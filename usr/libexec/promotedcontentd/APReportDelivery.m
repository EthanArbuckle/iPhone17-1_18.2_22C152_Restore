@interface APReportDelivery
- (APReportDatasource)datasource;
- (APReportDelivery)initWithDatasource:(id)a3;
- (void)_sendReportWithProperties:(id)a3 environment:(id)a4;
- (void)prepareDelivery;
@end

@implementation APReportDelivery

- (APReportDelivery)initWithDatasource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APReportDelivery;
  v6 = [(APReportDelivery *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_datasource, a3);
  }

  return v7;
}

- (void)prepareDelivery
{
  v3 = [(APReportDelivery *)self datasource];
  v4 = [v3 properties];
  if ([v4 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = [v4 allKeys];
    id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v11 = [v4 valueForKey:v10];
          [(APReportDelivery *)self _sendReportWithProperties:v11 environment:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_opt_class();
      id v13 = v12;
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      v16 = [v3 reportDate];
      v17 = [v16 reportDayString];
      *(_DWORD *)buf = 138478595;
      v24 = v12;
      __int16 v25 = 2160;
      uint64_t v26 = 1752392040;
      __int16 v27 = 2112;
      v28 = v15;
      __int16 v29 = 2114;
      v30 = v17;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Skipping Report %{mask.hash}@ for day %{public}@, no data avaliable.", buf, 0x2Au);
    }
  }
}

- (void)_sendReportWithProperties:(id)a3 environment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(APReportDelivery *)self datasource];
  objc_super v9 = +[NSUUID UUID];
  uint64_t v10 = [v9 appendBytes:8];
  v11 = [v10 base64FilenameSafeEncoded];

  v12 = [v8 environmentToBranchDic];
  id v13 = [v12 objectForKey:v7];

  v14 = +[MetricsModule storage];
  id v15 = [objc_alloc((Class)+[MetricsModuleCommon metricClass](MetricsModuleCommon, "metricClass")) initWithPurpose:103 metric:objc_msgSend(v8, "metric") contentIdentifier:0 contextIdentifier:0 handle:v11 branch:v13 properties:v6 relayData:0 environment:0 order:0 options:0];
  v16 = +[NSBundle mainBundle];
  v17 = [v16 bundleIdentifier];

  [v15 addInternalPropertyValue:v17 forKey:kAPMetricBundleIdentifierKey];
  if (objc_opt_respondsToSelector()) {
    [v15 performSelector:"updateClientBundleID:" withObject:v17];
  }
  [v14 receivedMetric:v15];
  long long v18 = APLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = objc_opt_class();
    id v26 = v19;
    long long v20 = (objc_class *)objc_opt_class();
    long long v21 = NSStringFromClass(v20);
    [v8 reportDate];
    v22 = v28 = v11;
    [v22 reportDayString];
    __int16 v27 = v14;
    v23 = v13;
    __int16 v25 = v24 = v6;
    *(_DWORD *)buf = 138478851;
    v30 = v19;
    __int16 v31 = 2160;
    uint64_t v32 = 1752392040;
    __int16 v33 = 2112;
    v34 = v21;
    __int16 v35 = 2114;
    v36 = v25;
    __int16 v37 = 2114;
    id v38 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Report %{mask.hash}@ for day %{public}@ sent to EC with properties %{public}@.", buf, 0x34u);

    id v6 = v24;
    id v13 = v23;
    v14 = v27;

    v11 = v28;
  }
}

- (APReportDatasource)datasource
{
  return self->_datasource;
}

- (void).cxx_destruct
{
}

@end