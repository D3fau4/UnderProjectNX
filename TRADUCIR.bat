@echo off
Title UnderProjectNX
set /p path="Arrastra el archivo nsp aqui: "
tools\hactool.exe "%path:"=%" -k prod.keys -x --intype=pfs0 --pfs0dir="%CD%\tools\extracted"
cd tools
titlekey.exe
cd ..
set /p var=<tools\final.txt
cd tools
hactool.exe -k prod.keys -t nca "extracted\eddd7cfa3cdca6623f31cf2f20e9257e.nca" --titlekey="%var%" --romfsdir="extracted\romfs"
cd ..
if not exist "%CD%\READY_LAYEREDFS" (
mkdir "%CD%\READY_LAYEREDFS\010080b00ad66000\romfs"
)

COPY tools\extracted\romfs\game.win %CD%\
echo Applying Patch %progress%
tools\xdelta3.exe -d -vfs "game.win" "game Patch file.vcdiff" "%CD%\READY_LAYEREDFS\010080b00ad66000\romfs\game.win"
pause
