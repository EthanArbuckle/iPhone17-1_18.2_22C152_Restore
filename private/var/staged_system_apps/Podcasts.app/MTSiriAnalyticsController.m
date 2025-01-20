@interface MTSiriAnalyticsController
- (MTSiriAnalyticsController)init;
- (NSString)pendingRequest;
- (void)observePlaybackStartEventForRefId:(id)a3;
- (void)playerRateChanged:(id)a3;
- (void)setPendingRequest:(id)a3;
@end

@implementation MTSiriAnalyticsController

- (MTSiriAnalyticsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTSiriAnalyticsController;
  v2 = [(MTSiriAnalyticsController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"playerRateChanged:" name:IMAVPlayerNotification_RateChanged object:0];
  }
  return v2;
}

- (void)observePlaybackStartEventForRefId:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  [(MTSiriAnalyticsController *)self setPendingRequest:v4];
}

- (void)playerRateChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 object];
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = self;
    objc_sync_enter(v6);
    if ([v5 loadState] == (id)1)
    {
      [v5 actualRate];
      if (v7 > 0.0)
      {
        v8 = [(MTSiriAnalyticsController *)v6 pendingRequest];

        if (v8)
        {
          kdebug_trace();
          uint64_t v15 = 0;
          v16 = &v15;
          uint64_t v17 = 0x2050000000;
          v9 = (void *)qword_10060A638;
          uint64_t v18 = qword_10060A638;
          if (!qword_10060A638)
          {
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472;
            v14[2] = sub_1000727E4;
            v14[3] = &unk_10054D8A0;
            v14[4] = &v15;
            sub_1000727E4((uint64_t)v14);
            v9 = (void *)v16[3];
          }
          id v10 = v9;
          _Block_object_dispose(&v15, 8);
          v11 = [v10 sharedAnalytics];
          v19[0] = @"refId";
          v12 = [(MTSiriAnalyticsController *)v6 pendingRequest];
          v19[1] = @"bundleId";
          v20[0] = v12;
          v20[1] = kMTApplicationBundleIdentifier;
          v13 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
          [v11 logEventWithType:2901 context:v13];

          [(MTSiriAnalyticsController *)v6 setPendingRequest:0];
        }
      }
    }
    objc_sync_exit(v6);
  }
}

- (NSString)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end