@interface MTPerfUtils
- (id)DNSServersIPAddresses;
- (id)loadUrlMeasurementWithURLSessionTaskMetrics:(id)a3;
- (id)loadUrlMeasurementWithURLSessionTaskTransactionMetrics:(id)a3;
@end

@implementation MTPerfUtils

- (id)DNSServersIPAddresses
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  v3 = (__res_9_state *)malloc_type_calloc(1uLL, 0x228uLL, 0x10B20402089BC1DuLL);
  if (!res_9_ninit(v3))
  {
    v4 = (res_9_sockaddr_union *)malloc_type_malloc((uint64_t)v3->nscount << 7, 0x1000040AE2C30F4uLL);
    res_9_getservers(v3, v4, v3->nscount);
    if (v3->nscount)
    {
      unint64_t v5 = 0;
      v6 = &v4->__space[4];
      while (1)
      {
        int v7 = *(v6 - 3);
        if (v7 == 30) {
          break;
        }
        if (v7 == 2)
        {
          int v8 = 2;
          v9 = v6;
          socklen_t v10 = 16;
          goto LABEL_8;
        }
LABEL_10:
        ++v5;
        v6 += 128;
        if (v5 >= v3->nscount) {
          goto LABEL_11;
        }
      }
      v9 = v6 + 4;
      int v8 = 30;
      socklen_t v10 = 46;
LABEL_8:
      inet_ntop(v8, v9, v14, v10);
      v11 = [NSString stringWithUTF8String:v14];
      if (v11)
      {
        [v2 addObject:v11];
      }
      goto LABEL_10;
    }
LABEL_11:
    free(v4);
  }
  res_9_ndestroy(v3);
  free(v3);
  if ([v2 count])
  {
    v12 = [v2 componentsJoinedByString:@","];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)loadUrlMeasurementWithURLSessionTaskTransactionMetrics:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MTObject *)self metricsKit];
  v6 = [v5 loadUrlMeasurement];

  int v7 = [v4 fetchStartDate];

  if (v7)
  {
    int v8 = [v4 fetchStartDate];
    [v6 mark:@"fetchStartTime" date:v8];
  }
  v9 = [v4 domainLookupStartDate];

  if (v9)
  {
    socklen_t v10 = [v4 domainLookupStartDate];
    [v6 mark:@"domainLookupStartTime" date:v10];
  }
  v11 = [v4 domainLookupEndDate];

  if (v11)
  {
    v12 = [v4 domainLookupEndDate];
    [v6 mark:@"domainLookupEndTime" date:v12];
  }
  v13 = [v4 connectStartDate];

  if (v13)
  {
    v14 = [v4 connectStartDate];
    [v6 mark:@"connectionStartTime" date:v14];
  }
  uint64_t v15 = [v4 connectEndDate];

  if (v15)
  {
    v16 = [v4 connectEndDate];
    [v6 mark:@"connectionEndTime" date:v16];
  }
  v17 = [v4 secureConnectionStartDate];

  if (v17)
  {
    v18 = [v4 secureConnectionStartDate];
    [v6 mark:@"secureConnectionStartTime" date:v18];
  }
  v19 = [v4 requestStartDate];

  if (v19)
  {
    v20 = [v4 requestStartDate];
    [v6 mark:@"requestStartTime" date:v20];
  }
  v21 = [v4 responseStartDate];

  if (v21)
  {
    v22 = [v4 responseStartDate];
    [v6 mark:@"responseStartTime" date:v22];
  }
  v23 = [v4 responseEndDate];

  if (v23)
  {
    v24 = [v4 responseEndDate];
    [v6 mark:@"responseEndTime" date:v24];
  }
  objc_msgSend(v6, "setConnectionReused:", objc_msgSend(v4, "isReusedConnection"));
  v25 = [v4 request];
  v26 = [v25 URL];
  v27 = [v26 absoluteString];

  if (v27)
  {
    v28 = [v4 request];
    v29 = [v28 URL];
    v30 = [v29 absoluteString];
    [v6 setRequestUrl:v30];
  }
  v31 = [v4 response];
  v32 = v31;
  if (v31) {
    objc_msgSend(v6, "setStatusCode:", objc_msgSend(v31, "statusCode"));
  }

  return v6;
}

- (id)loadUrlMeasurementWithURLSessionTaskMetrics:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 transactionMetrics];
  v6 = [v5 lastObject];

  if (v6)
  {
    int v7 = [(MTPerfUtils *)self loadUrlMeasurementWithURLSessionTaskTransactionMetrics:v6];
    objc_msgSend(v7, "setRedirectCount:", objc_msgSend(v4, "redirectCount"));
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

@end