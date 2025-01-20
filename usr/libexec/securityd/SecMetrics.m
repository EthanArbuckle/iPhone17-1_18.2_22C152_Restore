@interface SecMetrics
+ (id)c2MetricsEndpoint;
+ (id)managerObject;
- (NSMutableDictionary)taskMap;
- (NSURLSession)URLSession;
- (OS_os_transaction)transaction;
- (SecMetrics)init;
- (id)generateDeviceInfo;
- (id)getEvent:(id)a3;
- (id)gzipEncode:(id)a3;
- (id)requestForGenericEvent:(id)a3;
- (int64_t)lostEvents;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)sendEvent:(id)a3 pushTopic:(id)a4;
- (void)setLostEvents:(int64_t)a3;
- (void)setTaskMap:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setURLSession:(id)a3;
- (void)submitEvent:(id)a3;
@end

@implementation SecMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);

  objc_storeStrong((id *)&self->_taskMap, 0);
}

- (void)setLostEvents:(int64_t)a3
{
  self->_lostEvents = a3;
}

- (int64_t)lostEvents
{
  return self->_lostEvents;
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setURLSession:(id)a3
{
}

- (NSURLSession)URLSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTaskMap:(id)a3
{
}

- (NSMutableDictionary)taskMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (id)generateDeviceInfo
{
  v2 = objc_alloc_init(SECC2MPDeviceInfo);
  v3 = +[SecC2DeviceInfo productName];
  [(SECC2MPDeviceInfo *)v2 setProductName:v3];

  v4 = +[SecC2DeviceInfo productType];
  [(SECC2MPDeviceInfo *)v2 setProductType:v4];

  v5 = +[SecC2DeviceInfo productVersion];
  [(SECC2MPDeviceInfo *)v2 setProductVersion:v5];

  v6 = +[SecC2DeviceInfo buildVersion];
  [(SECC2MPDeviceInfo *)v2 setProductBuild:v6];

  v7 = +[SecC2DeviceInfo processName];
  [(SECC2MPDeviceInfo *)v2 setProcessName:v7];

  v8 = +[SecC2DeviceInfo processVersion];
  [(SECC2MPDeviceInfo *)v2 setProcessVersion:v8];

  v9 = +[SecC2DeviceInfo processUUID];
  [(SECC2MPDeviceInfo *)v2 setProcessUuid:v9];

  return v2;
}

- (id)gzipEncode:(id)a3
{
  id v3 = a3;
  bzero(v10, 0x400uLL);
  v4 = +[NSMutableData data];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v9.data_type = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v9.adler = v5;
  *(_OWORD *)&v9.avail_out = v5;
  *(_OWORD *)&v9.msg = v5;
  *(_OWORD *)&v9.next_in = v5;
  *(_OWORD *)&v9.total_in = v5;
  memset(&v9.zalloc, 0, 24);
  id v6 = 0;
  if (!deflateInit2_(&v9, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    id v7 = v3;
    v9.avail_in = [v7 length][v7 bytes];
    do
    {
      v9.avail_out = 1024;
      v9.next_out = v10;
      if (deflate(&v9, 4) == -2) {
        sub_10002BBA0(@"Execution has encountered an unexpected state", 0x53C0000Eu);
      }
      [v4 appendBytes:v10 length:1024 - v9.avail_out];
    }
    while (!v9.avail_out);
    if (v9.avail_in) {
      sub_10002BBA0(@"Execution has encountered an unexpected state", 0x53C0000Eu);
    }
    deflateEnd(&v9);
    id v6 = v4;
  }

  return v6;
}

- (id)requestForGenericEvent:(id)a3
{
  id v4 = a3;
  long long v5 = [(id)objc_opt_class() c2MetricsEndpoint];
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v5];
    if (v6)
    {
      id v7 = objc_alloc_init(SECC2MPMetric);
      if (v7)
      {
        v8 = [(SecMetrics *)self generateDeviceInfo];
        [(SECC2MPMetric *)v7 setDeviceInfo:v8];

        [(SECC2MPMetric *)v7 setReportFrequency:0];
        [(SECC2MPMetric *)v7 setReportFrequencyBase:0];
        [(SECC2MPMetric *)v7 setMetricType:201];
        [(SECC2MPMetric *)v7 setGenericEvent:v4];
        id v9 = objc_alloc_init((Class)PBDataWriter);
        if (v9)
        {
          [(SECC2MPMetric *)v7 writeTo:v9];
          v10 = [v9 immutableData];
          if (v10)
          {
            v11 = [(SecMetrics *)self gzipEncode:v10];
            if (v11)
            {
              [v6 setHTTPMethod:@"POST"];
              [v6 setHTTPBody:v11];
              [v6 setValue:@"application/protobuf" forHTTPHeaderField:@"Content-Type"];
              [v6 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
              id v12 = v6;
            }
            else
            {
              id v12 = 0;
            }
          }
          else
          {
            id v12 = 0;
          }
        }
        else
        {
          id v12 = 0;
        }
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SecMetrics *)self getEvent:v9];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v11 eventName];
    v13 = [v9 originalRequest];
    v14 = [v13 URL];
    if (v10)
    {
      v15 = [v10 description];
    }
    else
    {
      v15 = @"success";
    }
    int v26 = 138412802;
    v27 = v12;
    __int16 v28 = 2112;
    v29 = v14;
    __int16 v30 = 2112;
    v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "metrics %@ transfer %@ completed with: %@", (uint8_t *)&v26, 0x20u);
    if (v10) {
  }
    }
  v16 = self;
  objc_sync_enter(v16);
  v17 = [(SecMetrics *)v16 taskMap];
  v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 taskIdentifier]);
  [v17 removeObjectForKey:v18];

  int64_t v19 = [(SecMetrics *)v16 lostEvents];
  if (v10 || v19)
  {
    v20 = +[NSMutableDictionary dictionary];
    if ([(SecMetrics *)v16 lostEvents])
    {
      v21 = +[NSNumber numberWithLong:[(SecMetrics *)v16 lostEvents]];
      [v20 setObject:v21 forKeyedSubscript:@"counter"];
    }
    if (v10)
    {
      v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 code]);
      [v20 setObject:v22 forKeyedSubscript:@"error_code"];

      v23 = [v10 domain];
      [v20 setObject:v23 forKeyedSubscript:@"error_domain"];
    }
    +[SecCoreAnalytics sendEvent:@"com.apple.security.push.channel.dropped" event:v20];
    [(SecMetrics *)v16 setLostEvents:0];
  }
  v24 = [(SecMetrics *)v16 taskMap];
  BOOL v25 = [v24 count] == 0;

  if (v25) {
    [(SecMetrics *)v16 setTransaction:0];
  }
  objc_sync_exit(v16);
}

- (id)getEvent:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  objc_sync_enter(v5);
  id v6 = [(SecMetrics *)v5 taskMap];
  id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 taskIdentifier]);
  id v8 = [v6 objectForKeyedSubscript:v7];

  objc_sync_exit(v5);

  return v8;
}

- (void)sendEvent:(id)a3 pushTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(SecMetrics *)v8 taskMap];
  id v10 = [v9 count];

  if ((unint64_t)v10 < 6)
  {
    objc_sync_exit(v8);

    id v12 = [v6 genericEvent];
    if (v12)
    {
      v13 = [(SecMetrics *)v8 requestForGenericEvent:v12];
      if (v13)
      {
        v14 = [(SecMetrics *)v8 URLSession];
        v15 = [v14 dataTaskWithRequest:v13];

        if (v7) {
          [v15 set_APSRelayTopic:v7];
        }
        v16 = v8;
        objc_sync_enter(v16);
        v17 = [(SecMetrics *)v16 taskMap];
        id v18 = [v17 count];

        if (!v18)
        {
          int64_t v19 = (void *)os_transaction_create();
          [(SecMetrics *)v16 setTransaction:v19];
        }
        v20 = [(SecMetrics *)v16 taskMap];
        v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 taskIdentifier]);
        [v20 setObject:v6 forKeyedSubscript:v21];

        objc_sync_exit(v16);
        [v15 resume];
      }
    }
  }
  else
  {
    [(SecMetrics *)v8 setLostEvents:(char *)[(SecMetrics *)v8 lostEvents] + 1];
    objc_sync_exit(v8);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v6 eventName];
      int v22 = 138412290;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "metrics %@ dropped on floor since too many are pending", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)submitEvent:(id)a3
{
}

- (SecMetrics)init
{
  v8.receiver = self;
  v8.super_class = (Class)SecMetrics;
  v2 = [(SecMetrics *)&v8 init];
  if (v2)
  {
    id v3 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    id v4 = +[NSURLSession sessionWithConfiguration:v3 delegate:v2 delegateQueue:0];
    [(SecMetrics *)v2 setURLSession:v4];

    long long v5 = +[NSMutableDictionary dictionary];
    [(SecMetrics *)v2 setTaskMap:v5];

    id v6 = v2;
  }

  return v2;
}

+ (id)managerObject
{
  if (qword_10035D128 != -1) {
    dispatch_once(&qword_10035D128, &stru_100304E60);
  }
  v2 = (void *)qword_10035D120;

  return v2;
}

+ (id)c2MetricsEndpoint
{
  v2 = +[ACAccountStore defaultStore];
  id v3 = [v2 aa_primaryAppleAccount];
  id v4 = v3;
  if (v3)
  {
    long long v5 = [v3 propertiesForDataclass:ACAccountDataclassCKMetricsService];
    id v6 = [v5 objectForKeyedSubscript:@"url"];

    if (v6)
    {
      id v7 = [objc_alloc((Class)NSURL) initWithString:v6];
      id v8 = [v7 URLByAppendingPathComponent:@"c2"];

      if (v8)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001504C4;
        block[3] = &unk_100308558;
        id v8 = v8;
        id v11 = v8;
        if (qword_10035D118 != -1) {
          dispatch_once(&qword_10035D118, block);
        }
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end