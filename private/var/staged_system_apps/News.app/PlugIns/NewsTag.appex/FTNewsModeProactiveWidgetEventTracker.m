@interface FTNewsModeProactiveWidgetEventTracker
+ (id)widgetEventTrackerWithMaxRowCount:(unint64_t)a3;
- (FTNewsModeProactiveWidgetEventTracker)init;
@end

@implementation FTNewsModeProactiveWidgetEventTracker

- (FTNewsModeProactiveWidgetEventTracker)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTNewsModeProactiveWidgetEventTracker init]";
    __int16 v7 = 2080;
    v8 = "FTNewsModeProactiveWidgetEventTracker.m";
    __int16 v9 = 1024;
    int v10 = 19;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FTNewsModeProactiveWidgetEventTracker init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

+ (id)widgetEventTrackerWithMaxRowCount:(unint64_t)a3
{
  v3 = [[FTProactiveWidgetEventTracker alloc] initWithMaxRowCount:a3 trackedEvents:2];
  id v4 = [[FTConditionalWidgetEventTracker alloc] initWithWidgetEventTracker:v3 predicate:&stru_1000FB200];

  return v4;
}

@end