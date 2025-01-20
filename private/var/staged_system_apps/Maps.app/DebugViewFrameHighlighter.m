@interface DebugViewFrameHighlighter
+ (BOOL)frameHighlightingEnabled;
+ (BOOL)shouldHighlightOnLaunch;
+ (void)setFrameHighlightingEnabled:(BOOL)a3;
+ (void)setFrameHighlightingEnabled:(BOOL)a3 persistToDefaults:(BOOL)a4;
@end

@implementation DebugViewFrameHighlighter

+ (BOOL)frameHighlightingEnabled
{
  Uid = sel_getUid("_toolsDebugColorViewBounds");
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    return [(id)objc_opt_class() Uid];
  }
  v4 = sub_100A3C39C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315138;
    Name = sel_getName(Uid);
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "UIView.class doesn't respond to %s", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

+ (void)setFrameHighlightingEnabled:(BOOL)a3 persistToDefaults:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  Uid = sel_getUid("_enableToolsDebugColorViewBounds:");
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    [objc_opt_class() Uid:v5];
    if (v4)
    {
      id v9 = +[NSUserDefaults standardUserDefaults];
      [v9 setBool:v5 forKey:@"kDebugViewFrameHighlightingEnabledDefaultsKey"];
    }
  }
  else
  {
    v7 = sub_100A3C39C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      Name = sel_getName(Uid);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "UIView.class doesn't respond to %s", buf, 0xCu);
    }

    v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setBool:0 forKey:@"kDebugViewFrameHighlightingEnabledDefaultsKey"];
  }
}

+ (void)setFrameHighlightingEnabled:(BOOL)a3
{
}

+ (BOOL)shouldHighlightOnLaunch
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"kDebugViewFrameHighlightingEnabledDefaultsKey"];

  return v3;
}

@end