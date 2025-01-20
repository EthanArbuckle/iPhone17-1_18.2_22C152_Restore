@interface RoutePlanningEbikeOptionsViewController
+ (Class)_dataSourceClass;
- (id)_titleForTransportType:(int64_t)a3;
@end

@implementation RoutePlanningEbikeOptionsViewController

+ (Class)_dataSourceClass
{
  return (Class)objc_opt_class();
}

- (id)_titleForTransportType:(int64_t)a3
{
  if (a3 == 5)
  {
    v3 = +[NSBundle mainBundle];
    v4 = [v3 localizedStringForKey:@"[Route Planning, Cycle] E-Bike options card header", @"localized string not found", 0 value table];
  }
  else
  {
    v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315650;
      v10 = "-[RoutePlanningEbikeOptionsViewController _titleForTransportType:]";
      __int16 v11 = 2080;
      v12 = "RoutePlanningOptionsViewController.m";
      __int16 v13 = 1024;
      int v14 = 1357;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v9, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = +[NSThread callStackSymbols];
        int v9 = 138412290;
        v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
      }
    }
    v4 = 0;
  }

  return v4;
}

@end