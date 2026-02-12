using { /Verse.org/Colors }

log_level<public> := enum:
    Debug
    Verbose
    Info
    Warning
    Error

logger<internal> := class:

    Log<private>(Message:string, ?Level:log_level = log_level.Info, ?Duration:float = 2.0, ?Color:color = NamedColors.White)<transacts>:void =
        Print("{LevelToString(Level)} {Message}", ?Duration := Duration, ?Color := Color)

    Debug<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_level.Debug, ?Duration := 2.0, ?Color := NamedColors.Green)

    Verbose<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_level.Verbose, ?Duration := 2.0, ?Color := NamedColors.White)

    Info<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_level.Info, ?Duration := 2.0, ?Color := NamedColors.LightBlue)

    Warning<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_level.Warning, ?Duration := 10.0, ?Color := NamedColors.Gold)

    Error<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_level.Error, ?Duration := 20.0, ?Color := NamedColors.OrangeRed)

    LevelToString<private>(Level:log_level)<transacts>:string =
        case (Level):
            log_level.Debug => "DEBUG:"
            log_level.Verbose => "VERBOSE:"
            log_level.Info => "INFO: "
            log_level.Warning => "WARNING: "
            log_level.Error => "ERROR: "