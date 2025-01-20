@interface StandardLocatorActions
+ (void)didReceiveLocation:(id)a3 isFinished:(BOOL)a4 inProvider:(id)a5 forCmd:(id)a6 withReason:(int64_t)a7 andAccuracyChange:(double)a8;
+ (void)didStopLocatingInProvider:(id)a3;
@end

@implementation StandardLocatorActions

+ (void)didReceiveLocation:(id)a3 isFinished:(BOOL)a4 inProvider:(id)a5 forCmd:(id)a6 withReason:(int64_t)a7 andAccuracyChange:(double)a8
{
  BOOL v12 = a4;
  id v16 = a3;
  id v13 = a5;
  id v14 = a6;
  [v13 sendCurrentLocation:v16 isFinished:v12 forCmd:v14 withReason:a7 andAccuracyChange:a8];
}

+ (void)didStopLocatingInProvider:(id)a3
{
  id v3 = a3;
  v4 = [v3 standardLocator];

  if (v4)
  {
    v5 = sub_10001B6D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10003807C(v3, v5);
    }

    [v3 setStandardLocator:0];
  }
}

@end