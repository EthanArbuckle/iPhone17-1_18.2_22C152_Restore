@interface MSDCDNSession
- (BOOL)getIsFileDownload;
- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5;
- (void)collectMetricsData:(id)a3;
- (void)collectTimingDataForTask:(id)a3 withNetworkError:(id)a4;
@end

@implementation MSDCDNSession

- (void)authenticate:(id)a3 forTask:(id)a4 completion:(id)a5
{
  id v12 = a3;
  v6 = (void (**)(id, void, void *))a5;
  v7 = objc_alloc_init(MSDSessionFileDownloadTrustEvaluate);
  v8 = [v12 protectionSpace];
  unsigned int v9 = -[MSDSessionFileDownloadTrustEvaluate trustServer:isRedirect:](v7, "trustServer:isRedirect:", [v8 serverTrust], 0);

  if (v9)
  {
    v10 = [v12 protectionSpace];
    v11 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v10 serverTrust]);

    v6[2](v6, 0, v11);
  }
  else
  {
    v6[2](v6, 1, 0);
  }
}

- (BOOL)getIsFileDownload
{
  return 1;
}

- (void)collectTimingDataForTask:(id)a3 withNetworkError:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  v6 = [v14 info];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v14 task];
    unsigned int v9 = [v8 _timingData];

    v10 = [v14 info];
    v11 = [v10 serverType];

    if (v9)
    {
      id v12 = +[MSDSessionMetrics sharedInstance];
      [v12 extractAndUploadTimingData:v9 forServerType:v11];
    }
    if (v5)
    {
      v13 = +[MSDAnalyticsEventHandler sharedInstance];
      [v13 sendNetworkFailureEvent:v5 forServerType:v11];
    }
  }
}

- (void)collectMetricsData:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDSessionMetrics sharedInstance];
  [v4 saveTransactionMetric:v3];
}

@end