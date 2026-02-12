using { /Verse.org/Colors }

log_levels := enum {
    Info
    Warning
    Error
    Debug
}

logger<internal> := class:

    Log<private>(Message:string, ?Level:log_levels = log_levels.Info, ?Duration:float = 2.0, ?Color:color = NamedColors.White)<transacts>:void =
        Print("{LevelToString(Level)} {Message}", ?Duration := Duration, ?Color := Color)
    
    Info<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_levels.Info, ?Duration := 2.0, ?Color := LevelToColor(log_levels.Info))

    Warning<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_levels.Warning, ?Duration := 10.0, ?Color := LevelToColor(log_levels.Warning))
    
    Error<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_levels.Error, ?Duration := 20.0, ?Color := LevelToColor(log_levels.Error))
        
    Debug<public>(Message:string)<transacts>:void =
        Log(Message, ?Level := log_levels.Debug, ?Duration := 2.0, ?Color := LevelToColor(log_levels.Debug))
            
    LevelToString<private>(Level:log_levels)<transacts>:string =
        case (Level):
            log_levels.Info => "INFO: "
            log_levels.Warning => "WARNING: "
            log_levels.Error => "ERROR: "
            log_levels.Debug => "DEBUG:"
        
    LevelToColor<private>(Level:log_levels)<transacts>:color =
        case (Level):
            log_levels.Debug => NamedColors.LightBlue
            log_levels.Info => NamedColors.White
            log_levels.Warning => NamedColors.Gold
            log_levels.Error => NamedColors.OrangeRed