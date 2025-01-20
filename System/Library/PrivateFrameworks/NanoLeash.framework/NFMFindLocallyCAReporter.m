@interface NFMFindLocallyCAReporter
+ (void)recordPingMyFiredSuccessfully:(BOOL)a3 wantedTorch:(BOOL)a4 withDeliveryDuration:(double)a5;
+ (void)sendEvent:(id)a3 with:(id)a4;
@end

@implementation NFMFindLocallyCAReporter

+ (void)sendEvent:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = nfm_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[NFMFindLocallyCAReporter] Sending event: <%{public}@; %{public}@>",
      (uint8_t *)&v8,
      0x16u);
  }

  AnalyticsSendEvent();
}

+ (void)recordPingMyFiredSuccessfully:(BOOL)a3 wantedTorch:(BOOL)a4 withDeliveryDuration:(double)a5
{
  BOOL v6 = a4;
  v12[0] = @"success";
  int v8 = +[NSNumber numberWithBool:a3];
  v13[0] = v8;
  v12[1] = @"wantedTorch";
  id v9 = +[NSNumber numberWithBool:v6];
  v13[1] = v9;
  v12[2] = @"deliveryDuration";
  __int16 v10 = +[NSNumber numberWithDouble:a5];
  v13[2] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  [a1 sendEvent:@"com.apple.NanoFindLocally.Fired" with:v11];
}

@end