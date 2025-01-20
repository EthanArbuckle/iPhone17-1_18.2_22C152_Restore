@interface MSDSessionTransactionData
- (MSDSessionTransactionData)initWithData:(id)a3;
- (NSMutableDictionary)data;
- (void)saveToFile:(id)a3;
- (void)setData:(id)a3;
@end

@implementation MSDSessionTransactionData

- (MSDSessionTransactionData)initWithData:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MSDSessionTransactionData;
  v5 = [(MSDSessionTransactionData *)&v46 init];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    [(MSDSessionTransactionData *)v5 setData:v6];

    v7 = [MSDSessionTimeIntervalDataPoint alloc];
    v8 = [v4 domainLookupStartDate];
    v9 = [v4 domainLookupEndDate];
    v45 = [(MSDSessionTimeIntervalDataPoint *)v7 initWithStartTime:v8 endTime:v9];

    v10 = [(MSDSessionTransactionData *)v5 data];
    [v10 setObject:v45 forKey:@"DNSResolutionTime"];

    v11 = [MSDSessionTimeIntervalDataPoint alloc];
    v12 = [v4 connectStartDate];
    v13 = [v4 connectEndDate];
    v14 = [(MSDSessionTimeIntervalDataPoint *)v11 initWithStartTime:v12 endTime:v13];

    v15 = [(MSDSessionTransactionData *)v5 data];
    [v15 setObject:v14 forKey:@"ConectionEstablishmentTime"];

    v16 = [MSDSessionTimeIntervalDataPoint alloc];
    v17 = [v4 connectStartDate];
    v18 = [v4 secureConnectionStartDate];
    v19 = [(MSDSessionTimeIntervalDataPoint *)v16 initWithStartTime:v17 endTime:v18];

    v20 = [(MSDSessionTransactionData *)v5 data];
    [v20 setObject:v19 forKey:@"TCPConnectionTime"];

    v21 = [MSDSessionTimeIntervalDataPoint alloc];
    v22 = [v4 secureConnectionStartDate];
    v23 = [v4 secureConnectionEndDate];
    v24 = [(MSDSessionTimeIntervalDataPoint *)v21 initWithStartTime:v22 endTime:v23];

    v25 = [(MSDSessionTransactionData *)v5 data];
    [v25 setObject:v24 forKey:@"SecureConnectionTime"];

    v26 = [MSDSessionTimeIntervalDataPoint alloc];
    v27 = [v4 requestStartDate];
    v28 = [v4 requestEndDate];
    v29 = [(MSDSessionTimeIntervalDataPoint *)v26 initWithStartTime:v27 endTime:v28];

    v30 = [(MSDSessionTransactionData *)v5 data];
    [v30 setObject:v29 forKey:@"RequestTime"];

    v31 = [MSDSessionTimeIntervalDataPoint alloc];
    v32 = [v4 responseStartDate];
    v33 = [v4 responseEndDate];
    v34 = [(MSDSessionTimeIntervalDataPoint *)v31 initWithStartTime:v32 endTime:v33];

    v35 = [(MSDSessionTransactionData *)v5 data];
    [v35 setObject:v34 forKey:@"ResponseTime"];

    v36 = (char *)[v4 countOfRequestHeaderBytesSent];
    v37 = &v36[(void)[v4 countOfRequestBodyBytesSent]];
    v38 = (char *)[v4 countOfResponseHeaderBytesReceived];
    v39 = &v38[(void)[v4 countOfResponseBodyBytesReceived]];
    v40 = [[MSDSessionCountDataPoint alloc] initWithCount:v37];
    v41 = [[MSDSessionCountDataPoint alloc] initWithCount:v39];
    v42 = [(MSDSessionTransactionData *)v5 data];
    [v42 setObject:v40 forKey:@"RequestBytesSent"];

    v43 = [(MSDSessionTransactionData *)v5 data];
    [v43 setObject:v41 forKey:@"ResponseBytesReceived"];
  }
  return v5;
}

- (void)saveToFile:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)MSDSessionTransactionData;
  id v16 = a3;
  -[MSDSessionMetricsData saveToFile:](&v21, "saveToFile:");
  id v4 = +[NSArray arrayWithObjects:@"DNSResolutionTime", @"ConectionEstablishmentTime", @"TCPConnectionTime", @"SecureConnectionTime", @"RequestTime", @"ResponseTime", @"RequestBytesSent", @"ResponseBytesReceived", 0];
  id v5 = objc_alloc_init((Class)NSMutableString);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v10);
        v12 = [(MSDSessionTransactionData *)self data];
        v13 = [v12 objectForKey:v11];

        if (v13)
        {
          v14 = [v13 print];
          [v5 appendFormat:@"%@,", v14];
        }
        else
        {
          [v5 appendString:@" ,"];
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }

  [v5 appendString:@"\n"];
  v15 = [v5 dataUsingEncoding:4];
  [v16 writeData:v15];
}

- (NSMutableDictionary)data
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end