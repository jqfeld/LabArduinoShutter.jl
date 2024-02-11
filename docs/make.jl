using LabArduinoShutter
using Documenter

DocMeta.setdocmeta!(LabArduinoShutter, :DocTestSetup, :(using LabArduinoShutter); recursive=true)

makedocs(;
    modules=[LabArduinoShutter],
    authors="Jan Kuhfeld <jan.kuhfeld@rub.de> and contributors",
    sitename="LabArduinoShutter.jl",
    format=Documenter.HTML(;
        canonical="https://jqfeld.github.io/LabArduinoShutter.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/jqfeld/LabArduinoShutter.jl",
    devbranch="main",
)
