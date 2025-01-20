@interface APTimeSpentLegacyInterface
- (APDatabaseManager)dbManager;
- (APLegacyMetricRetryManagerProtocol)metricRetryManager;
- (APTimeSpentLegacyInterface)initWithDbManager:(id)a3 retryManager:(id)a4;
- (NSURLSessionDataTask)activeDataTask;
- (void)cancel:(id)a3;
- (void)sendTimeSpentMetricFor:(id)a3 contentId:(id)a4 contextId:(id)a5 adDataResponseIdentifier:(id)a6 batchId:(id)a7 impressionIdentifierData:(id)a8 timeSpent:(double)a9 completionHandler:(id)a10;
- (void)setActiveDataTask:(id)a3;
@end

@implementation APTimeSpentLegacyInterface

- (APTimeSpentLegacyInterface)initWithDbManager:(id)a3 retryManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)APTimeSpentLegacyInterface;
  v9 = [(APTimeSpentLegacyInterface *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metricRetryManager, a4);
    objc_storeStrong((id *)&v10->_dbManager, a3);
  }

  return v10;
}

- (void)cancel:(id)a3
{
  v6 = (void (**)(void))a3;
  v4 = [(APTimeSpentLegacyInterface *)self activeDataTask];

  if (v4)
  {
    v5 = [(APTimeSpentLegacyInterface *)self activeDataTask];
    [v5 cancel];

    [(APTimeSpentLegacyInterface *)self setActiveDataTask:0];
  }
  v6[2]();
}

- (void)sendTimeSpentMetricFor:(id)a3 contentId:(id)a4 contextId:(id)a5 adDataResponseIdentifier:(id)a6 batchId:(id)a7 impressionIdentifierData:(id)a8 timeSpent:(double)a9 completionHandler:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v35 = a10;
  v23 = [APTimeSpentEventRequester alloc];
  v24 = +[APIDAccountProvider privateUserAccount];
  v25 = [(APTimeSpentLegacyInterface *)self dbManager];
  v33 = v19;
  v34 = v17;
  id v26 = v19;
  v27 = v20;
  v28 = [(APTimeSpentEventRequester *)v23 initWithBundleID:v17 idAccount:v24 contentId:v18 contextId:v26 adDataResponseIdentifier:v20 batchId:v21 impressionIdentifierData:a9 timeSpent:v22 databaseManager:v25];

  v29 = [(APTimeSpentLegacyInterface *)self metricRetryManager];
  [(APLegacyMetricRequester *)v28 setRetryManager:v29];

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000C339C;
  v36[3] = &unk_100235790;
  v39 = v40;
  id v30 = v35;
  id v38 = v30;
  id v31 = v18;
  id v37 = v31;
  v32 = [(APServerRequester *)v28 makeNetworkRequest:v36];
  [(APTimeSpentLegacyInterface *)self setActiveDataTask:v32];

  _Block_object_dispose(v40, 8);
}

- (APLegacyMetricRetryManagerProtocol)metricRetryManager
{
  return (APLegacyMetricRetryManagerProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (APDatabaseManager)dbManager
{
  return (APDatabaseManager *)objc_getProperty(self, a2, 16, 1);
}

- (NSURLSessionDataTask)activeDataTask
{
  return self->_activeDataTask;
}

- (void)setActiveDataTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDataTask, 0);
  objc_storeStrong((id *)&self->_dbManager, 0);

  objc_storeStrong((id *)&self->_metricRetryManager, 0);
}

@end