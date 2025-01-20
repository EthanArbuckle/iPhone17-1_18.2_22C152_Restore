@interface APMetricReceiver
- (APMetricReceiver)initWithConnection:(id)a3;
- (APXPCConnection)connection;
- (Protocol)exportedInterface;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)extendCollectionClassesForExportedInterface:(id)a3;
- (void)receivedMetric:(id)a3;
- (void)setConnection:(id)a3;
- (void)terminateConnection;
@end

@implementation APMetricReceiver

- (APMetricReceiver)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APMetricReceiver;
  v6 = [(APMetricReceiver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)receivedMetric:(id)a3
{
  v4 = (__CFString *)a3;
  id v5 = [(APMetricReceiver *)self connection];
  v6 = [v5 bundleID];
  id v7 = [v6 length];

  if (v7)
  {
    v8 = [(APMetricReceiver *)self connection];
    objc_super v9 = [v8 bundleID];
  }
  else
  {
    objc_super v9 = @"nil";
  }
  [(__CFString *)v4 addInternalPropertyValue:v9 forKey:kAPMetricBundleIdentifierKey];
  if (objc_opt_respondsToSelector()) {
    [(__CFString *)v4 performSelector:"updateClientBundleID:" withObject:v9];
  }
  v10 = [(__CFString *)v4 internalProperties];
  v11 = [v10 objectForKeyedSubscript:kAPMetricClientSourceKey];

  if (v11)
  {
    if ([v11 length])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = +[NSString stringWithFormat:@"%@%@%@", v9, @".", v11];

        objc_super v9 = (__CFString *)v12;
      }
    }
  }
  v13 = APLogForCategory();
  v14 = v13;
  if (v7)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478339;
      id v30 = (id)objc_opt_class();
      __int16 v31 = 2114;
      v32 = v9;
      __int16 v33 = 2114;
      v34 = v4;
      id v15 = v30;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{private}@] Received metric from %{public}@: %{public}@", buf, 0x20u);
    }
    id v16 = [(__CFString *)v4 purpose];
    if (v16)
    {
      v17 = +[APECPurposeConfig purposeConfig:v16];
      if (v17)
      {
        v18 = [(APMetricReceiver *)self connection];
        v19 = [v18 bundleID];

        if (!v19)
        {
          v22 = APLogForCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v30 = v4;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error missing BundleID for metric %{public}@", buf, 0xCu);
          }
          goto LABEL_24;
        }
        v20 = [(APMetricReceiver *)self connection];
        v21 = [v20 bundleID];
        v22 = [v21 dataUsingEncoding:4];

        v23 = [v22 sha256];
        v24 = [v23 asHexString];
        v25 = +[NSPredicate predicateWithFormat:@"SELF contains %@", v24];
        v26 = [v17 allowedSources];
        v27 = [v26 filteredArrayUsingPredicate:v25];

        if (!v27 || [v27 count] != (id)1)
        {
          v28 = APLogForCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            id v30 = v9;
            __int16 v31 = 2114;
            v32 = v4;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Metric %{public}@ from client %{public}@ not allowed ", buf, 0x16u);
          }

          goto LABEL_24;
        }
      }
    }
    else
    {
      v17 = 0;
    }
    v22 = +[MetricsModule storage];
    [v22 receivedMetric:v4];
LABEL_24:

    goto LABEL_25;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to get bundle ID for connection. Terminating the connection.", buf, 2u);
  }

  [(APMetricReceiver *)self terminateConnection];
LABEL_25:
}

- (void)terminateConnection
{
  v3 = [(APMetricReceiver *)self connection];

  if (v3)
  {
    v4 = [(APMetricReceiver *)self connection];
    [v4 invalidate];

    [(APMetricReceiver *)self setConnection:0];
  }
}

- (Protocol)exportedInterface
{
  return (Protocol *)&OBJC_PROTOCOL___APMetricReceiving;
}

- (void)extendCollectionClassesForExportedInterface:(id)a3
{
  id v3 = a3;
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", +[MetricsModuleCommon metricClass], 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setClasses:v4 forSelector:"receivedMetric:" argumentIndex:0 ofReply:0];
}

- (void)connectionInvalidated
{
  id v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138477827;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{private}@] Connection from the client was invalidated", (uint8_t *)&v5, 0xCu);
  }
  [(APMetricReceiver *)self terminateConnection];
}

- (void)connectionInterrupted
{
  id v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138477827;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{private}@] Connection from the client was interrupted", (uint8_t *)&v5, 0xCu);
  }
  [(APMetricReceiver *)self terminateConnection];
}

- (APXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end