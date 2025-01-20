@interface APTimeSpentReportActivity
- (APMetricsLegacyInterface)legacyInterface;
- (APTimeSpentLegacyInterface)timeSpentLegacyInterface;
- (APTimeSpentReportActivity)initWithLegacyInterface:(id)a3;
- (APXPCActivityCriteria)criteria;
- (BOOL)isCancelled;
- (BOOL)runActivity:(id)a3;
- (BOOL)sendDiagnosticReport:(id)a3 context:(id)a4 isUserChanged:(BOOL)a5;
- (NSString)taskID;
- (OS_dispatch_queue)queue;
- (double)retrieveTimeSpentTTLConfigValue;
- (void)cancelActiveWork:(id)a3;
- (void)deferActivity:(id)a3 completionHandler:(id)a4;
- (void)makeTimeSpentRequests:(id)a3 activity:(id)a4;
- (void)setIsCancelled:(BOOL)a3;
- (void)setTimeSpentLegacyInterface:(id)a3;
- (void)terminateActivity:(id)a3;
@end

@implementation APTimeSpentReportActivity

- (APTimeSpentReportActivity)initWithLegacyInterface:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APTimeSpentReportActivity;
  v6 = [(APTimeSpentReportActivity *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.ap.promotedcontentd.timespentactivity.queue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_legacyInterface, a3);
  }

  return v6;
}

- (NSString)taskID
{
  return (NSString *)@"com.apple.ap.promotedcontentd.timespent";
}

- (BOOL)runActivity:(id)a3
{
  id v4 = a3;
  [(APTimeSpentReportActivity *)self setIsCancelled:0];
  id v5 = [(APTimeSpentReportActivity *)self legacyInterface];
  v6 = [v5 timeSpentProcessor];
  [(APTimeSpentReportActivity *)self setTimeSpentLegacyInterface:v6];

  objc_initWeak(&location, self);
  v7 = [(APTimeSpentReportActivity *)self queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000073AC;
  v10[3] = &unk_10022E368;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return 1;
}

- (void)deferActivity:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Request Time Spent Report activity deferral.", v7, 2u);
  }

  [(APTimeSpentReportActivity *)self cancelActiveWork:v5];
}

- (void)terminateActivity:(id)a3
{
  id v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Time Spent Activity Terminated.", v5, 2u);
  }

  [(APTimeSpentReportActivity *)self cancelActiveWork:0];
}

- (void)makeTimeSpentRequests:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(APTimeSpentReportActivity *)self isCancelled])
  {
    if ([v6 count])
    {
      v37 = v7;
      v39 = [v6 lastObject];
      v40 = [v39 contentId];
      if ([v40 length])
      {
        id v8 = +[APManagedContentData findById:v40];
        v9 = [v8 contentData];
        v10 = [v9 contextIdentifier];
        v38 = [v10 UUIDString];

        if ([v38 length])
        {
          id v11 = +[APManagedContext findManagedContextByFingerprint:v38];
          id v12 = +[APIDAccountProvider privateUserAccount];
          v13 = [v11 idAccount];
          v14 = [v13 anonymousDemandID];
          v15 = [v14 UUIDString];
          v16 = [v12 anonymousDemandID];
          v17 = [v16 UUIDString];
          id v35 = v6;
          v18 = v12;
          v19 = v8;
          uint64_t v20 = [v15 isEqualToString:v17] ^ 1;

          id v6 = v35;
        }
        else
        {
          v22 = APLogForCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v47 = v40;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "No managed content data for %{public}@.", buf, 0xCu);
          }

          v19 = v8;
          uint64_t v20 = 0;
          id v11 = 0;
        }
        v21 = v19;
        if (![(APTimeSpentReportActivity *)self sendDiagnosticReport:v19 context:v11 isUserChanged:v20])
        {
          if (!v19)
          {
LABEL_17:

            id v7 = v37;
            goto LABEL_18;
          }
          v25 = [v19 contentDataPrivate];
          v28 = [v21 contentDataTransient];
          [v28 timeSpent];
          double v30 = v29;

          objc_initWeak((id *)buf, self);
          v31 = [(APTimeSpentReportActivity *)self timeSpentLegacyInterface];
          v32 = [v21 clientId];
          v36 = [(APTimeSpentStoreDatabase *)v25 adResponseIdentifier];
          v33 = [(APTimeSpentStoreDatabase *)v25 batchResponseID];
          v34 = [(APTimeSpentStoreDatabase *)v25 impressionIdentifier];
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_100007AF4;
          v41[3] = &unk_10022E390;
          id v42 = v6;
          objc_copyWeak(&v44, (id *)buf);
          id v43 = v37;
          [v31 sendTimeSpentMetricFor:v32 contentId:v40 contextId:v38 adDataResponseIdentifier:v36 batchId:v33 impressionIdentifierData:v34 timeSpent:v30 completionHandler:v41];

          objc_destroyWeak(&v44);
          objc_destroyWeak((id *)buf);
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
        v21 = 0;
        id v11 = 0;
        v38 = 0;
        if (![(APTimeSpentReportActivity *)self sendDiagnosticReport:0 context:0 isUserChanged:0])goto LABEL_17; {
      }
        }
      v23 = [APTimeSpentStoreDatabase alloc];
      v24 = +[APDatabaseManager mainDatabase];
      v25 = [(APTimeSpentStoreDatabase *)v23 initWithDatabase:v24];

      v45 = v40;
      v26 = +[NSArray arrayWithObjects:&v45 count:1];
      [(APTimeSpentStoreDatabase *)v25 removeEntriesForContentIds:v26];

      [v6 removeLastObject];
      [(APTimeSpentReportActivity *)self makeTimeSpentRequests:v6 activity:v37];
      goto LABEL_16;
    }
    [v7 finished];
  }
LABEL_18:
}

- (BOOL)sendDiagnosticReport:(id)a3 context:(id)a4 isUserChanged:(BOOL)a5
{
  if (a3) {
    BOOL v5 = a4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = v5 || a5;
  if (v6)
  {
    BOOL v7 = a5;
    BOOL v8 = a4 == 0;
    BOOL v9 = a3 == 0;
    v10 = [a3 identifier];
    id v11 = +[NSString stringWithFormat:@"Trying to send time spent metric for promoted content with content id: %@, but couldn't find it or user account changed.", v10];

    v20[0] = @"ManagedContentNotFound";
    id v12 = +[NSNumber numberWithBool:v9];
    v21[0] = v12;
    v20[1] = @"ManagedContextNotFound";
    v13 = +[NSNumber numberWithBool:v8];
    v21[1] = v13;
    v20[2] = @"ExpiredAnonId";
    v14 = +[NSNumber numberWithBool:v7];
    v21[2] = v14;
    v15 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

    CreateDiagnosticReport();
    v16 = APLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@.", buf, 0xCu);
    }
  }
  return v6;
}

- (void)cancelActiveWork:(id)a3
{
  id v4 = a3;
  [(APTimeSpentReportActivity *)self setIsCancelled:1];
  BOOL v5 = [(APTimeSpentReportActivity *)self timeSpentLegacyInterface];

  if (v5)
  {
    BOOL v6 = [(APTimeSpentReportActivity *)self timeSpentLegacyInterface];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007EAC;
    v7[3] = &unk_10022E3B8;
    v7[4] = self;
    id v8 = v4;
    [v6 cancel:v7];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

- (double)retrieveTimeSpentTTLConfigValue
{
  v2 = +[APConfigurationMediator configurationForClass:objc_opt_class() usingCache:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    id v4 = [v3 timeSpentMetricTTL];

    if (v4)
    {
      BOOL v5 = [v3 timeSpentMetricTTL];
      [v5 doubleValue];
      double v7 = v6;
    }
    else
    {
      double v7 = 21600.0;
    }
  }
  else
  {
    double v7 = 21600.0;
  }

  return v7;
}

- (APXPCActivityCriteria)criteria
{
  return self->criteria;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (APTimeSpentLegacyInterface)timeSpentLegacyInterface
{
  return self->_timeSpentLegacyInterface;
}

- (void)setTimeSpentLegacyInterface:(id)a3
{
}

- (APMetricsLegacyInterface)legacyInterface
{
  return self->_legacyInterface;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyInterface, 0);
  objc_storeStrong((id *)&self->_timeSpentLegacyInterface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->criteria, 0);

  objc_storeStrong((id *)&self->taskID, 0);
}

@end