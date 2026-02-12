using { /Verse.org/Colors }

log_level<public> := enum:
    Debug
    Verbose
    Info
    Warning
    Error

logger<public> := class:
    var CurrentLogLevel:log_level = log_level.Info
    var PrintStackTraceOnError:logic = false

    Log<private>(Message:string, ?Level:log_level = log_level.Info, ?Duration:float = 2.0, ?Color:color = NamedColors.White)<transacts>:void =
        if(ShouldLog(Level)?):
            Print("{LevelToLabel(Level)} {Message}", ?Duration := Duration, ?Color := Color)

    Debug<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_level.Debug, ?Duration := 2.0, ?Color := NamedColors.Green)

    Verbose<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_level.Verbose, ?Duration := 2.0, ?Color := NamedColors.LightBlue)

    Info<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_level.Info, ?Duration := 2.0, ?Color := NamedColors.White)

    Warning<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_level.Warning, ?Duration := 10.0, ?Color := NamedColors.Gold)
    
    Error<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_level.Error, ?Duration := 20.0, ?Color := NamedColors.OrangeRed)

    SetLogLevel<public>(NewLogLevel:log_level):void =
        set CurrentLogLevel = NewLogLevel

    LevelToLabel<private>(Level:log_level)<transacts>:string =
        case (Level):
            log_level.Debug => "[DEBUG]"
            log_level.Verbose => "[VERBOSE]"
            log_level.Info => "[INFO]"
            log_level.Warning => "[WARNING]"
            log_level.Error => "[ERROR]"

    GetLevelValue<private>(Level:log_level)<transacts>:int =
        case(Level):
            log_level.Debug => 0
            log_level.Verbose => 1
            log_level.Info => 2
            log_level.Warning => 3
            log_level.Error => 4

    ShouldLog<private>(Level:log_level)<transacts>:logic =
        if (GetLevelValue(Level) >= GetLevelValue(CurrentLogLevel)):
            return true
            
        return false