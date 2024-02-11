module LabArduinoShutter

export Shutter, set, open_shutter, close_shutter

using LibSerialPort

struct Shutter{T}
  serial_port::T
  open_position::Int
  close_position::Int
end

function Shutter( port::AbstractString;
  baud=9600,
  open_position::Int=0,
  close_position::Int=90,
)
  return Shutter(
    LibSerialPort.open(port, baud),
    open_position,
    close_position
  )
end

function set(s::Shutter, pos::Int) 
  @debug "Set shutter to" pos
  write(s.serial_port, "set $pos\n")
  set_read_timeout(s.serial_port, 1)
  parse(Int, readline(s.serial_port))
end


function open_shutter(s::Shutter)
  if s.open_position == set(s,s.open_position)
    @debug "Opening shutter successful"
  else
    @error "Could not open shutter"
  end
end

function close_shutter(s::Shutter)
  if s.close_position == set(s,s.close_position)
    @debug "Closing shutter successful"
  else
    @error "Could not close shutter"
  end
end

end
