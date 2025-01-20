@interface APPCIntegrityReportEventListener
+ (id)sharedInstance;
- (void)_storeIntegrityEvent:(id)a3;
- (void)start;
@end

@implementation APPCIntegrityReportEventListener

+ (id)sharedInstance
{
  v3 = +[APUniversalSingleton sharedInstance];
  v4 = [v3 integrityReportEventListener];
  if (!v4)
  {
    id v5 = a1;
    objc_sync_enter(v5);
    v4 = [v3 integrityReportEventListener];
    if (!v4)
    {
      v4 = objc_alloc_init(APPCIntegrityReportEventListener);
      [v3 setIntegrityReportEventListener:v4];
    }
    objc_sync_exit(v5);
  }

  return v4;
}

- (void)start
{
  objc_initWeak(&location, self);
  v3 = +[MetricsModule storage];
  v4 = [v3 notificationRegistrar];
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_10017DF78;
  v9 = &unk_100238958;
  objc_copyWeak(&v10, &location);
  id v5 = [v4 registerHandlerForExternalPurposesAndAllMetricsWithClosure:&v6];
  -[APPCBaseEventListener setToken:](self, "setToken:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_storeIntegrityEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 environment];

  if (!v4)
  {
    id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 metric]);
    v6 = [APReportDate alloc];
    uint64_t v7 = +[NSDate date];
    v8 = [(APReportDate *)v6 initWithDate:v7];

    v9 = +[APDatabaseManager mainDatabase];
    id v10 = [v9 getTableForClass:objc_opt_class()];

    v11 = +[NSNumber numberWithInteger:[(APReportDate *)v8 monthDayInteger]];
    v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 purpose]);
    v13 = [v3 branch];
    unsigned __int8 v14 = [v10 addCountForDayOfYear:v11 purpose:v12 event:v5 value:0 environment:@"PROD" branch:v13];

    if ((v14 & 1) == 0)
    {
      v15 = APLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138477827;
        id v18 = (id)objc_opt_class();
        id v16 = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{private}@] Error: Store integrity event to DB failed.", (uint8_t *)&v17, 0xCu);
      }
    }
  }
}

@end