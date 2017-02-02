-- Generated by CSharp.lua Compiler 1.0.0.0
local System = System;
local CSharpLua;
System.usingDeclare(function (global) 
    CSharpLua = global.CSharpLua;
end);
System.namespace("CSharpLua", function (namespace) 
    namespace.class("Program", function (namespace) 
        local HelpCmdString, Main, ShowHelpInfo;
        HelpCmdString = [[Usage: CSharp.lua [-s srcfolder] [-d dstfolder]
Arguments 
-s              : source directory, all *.cs files whill be compiled
-d              : destination  directory, will put the out lua files

Options
-l              : libraries referenced, use ';' to separate      
-m              : meta files, like System.xml, use ';' to separate     
-h              : show the help message    
-def            : defines name as a conditional symbol, use ';' to separate
]];
        Main = function (args) 
            if #args > 0 then
                local default, extern = System.try(function () 
                    local cmds = CSharpLua.Utility.GetCommondLines(args);
                    if cmds:ContainsKey("-h") then
                        ShowHelpInfo(this);
                        return true;
                    end

                    System.Console.WriteLine(("start {0}"):Format(System.DateTime.getNow()));
                    local folder = CSharpLua.Utility.GetArgument(cmds, "-s", false);
                    local output = CSharpLua.Utility.GetArgument(cmds, "-d", false);
                    local lib = CSharpLua.Utility.GetArgument(cmds, "-l", true);
                    local meta = CSharpLua.Utility.GetArgument(cmds, "-m", true);
                    local defines = CSharpLua.Utility.GetArgument(cmds, "-def", true);
                    local w = CSharpLua.Worker:new(1, folder, output, lib, meta, defines);
                    w:Do();
                    System.Console.WriteLine("all operator success");
                    System.Console.WriteLine(("end {0}"):Format(System.DateTime.getNow()));
                end, function (default) 
                    if System.is(default, CSharpLua.CmdArgumentException) then
                        local e = default;
                        System.Console.getError():WriteLine(e:getMessage());
                        ShowHelpInfo(this);
                        System.Environment.setExitCode(- 1);
                    elseif System.is(default, CSharpLua.CompilationErrorException) then
                        local e = default;
                        System.Console.getError():WriteLine(e:getMessage());
                        System.Environment.setExitCode(- 1);
                    else
                        local e = default;
                        System.Console.getError():WriteLine(e:ToString());
                        System.Environment.setExitCode(- 1);
                    end
                end);
                if default then
                    return extern;
                end
            else
                ShowHelpInfo(this);
                System.Environment.setExitCode(- 1);
            end
        end;
        ShowHelpInfo = function () 
            System.Console.getError():WriteLine(HelpCmdString);
        end;
        return {
            Main = Main
        };
    end);
end);