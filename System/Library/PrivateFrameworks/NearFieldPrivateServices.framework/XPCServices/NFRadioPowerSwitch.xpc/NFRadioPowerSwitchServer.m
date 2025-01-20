@interface NFRadioPowerSwitchServer
- (void)runService:(id)a3 callback:(id)a4;
@end

@implementation NFRadioPowerSwitchServer

- (void)runService:(id)a3 callback:(id)a4
{
  id v5 = a4;
  v6 = [a3 valueForKey:@"PopupInterval"];
  objc_opt_class();
  double v7 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v6 doubleValue];
    double v7 = v8;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100001A9C;
  v10[3] = &unk_100004268;
  id v11 = v5;
  id v9 = v5;
  sub_100001B74(v7, (uint64_t)NFSettingsNotification, v10);
}

@end