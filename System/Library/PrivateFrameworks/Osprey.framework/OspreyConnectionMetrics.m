@interface OspreyConnectionMetrics
- (NSString)connectionMethod;
- (NSURL)requestURL;
- (OspreyConnectionMetrics)initWithMetrics:(id)a3;
- (double)connectionEstablishmentTime;
- (double)dnsResolutionTime;
- (double)fetchStartToDomainLookupStartTime;
- (double)fetchStartToFirstByteTime;
- (double)secureConnectionTime;
- (double)tcpConnectTime;
- (unint64_t)connectionState;
@end

@implementation OspreyConnectionMetrics

- (OspreyConnectionMetrics)initWithMetrics:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OspreyConnectionMetrics;
  v5 = [(OspreyConnectionMetrics *)&v17 init];
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = objc_msgSend(v4, "transactionMetrics", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (([v11 _localCache] & 1) == 0)
          {
            objc_storeStrong((id *)&v5->_metrics, v11);
            v5->_connectionState = [(NSURLSessionTaskTransactionMetrics *)v5->_metrics isReusedConnection];
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v5;
}

- (double)fetchStartToDomainLookupStartTime
{
  uint64_t v3 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics fetchStartDate];
  if (!v3) {
    return 0.0;
  }
  id v4 = (void *)v3;
  v5 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics domainLookupStartDate];

  if (!v5) {
    return 0.0;
  }
  v6 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics domainLookupStartDate];
  uint64_t v7 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics fetchStartDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  return v9;
}

- (double)dnsResolutionTime
{
  uint64_t v3 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics domainLookupStartDate];
  if (!v3) {
    return 0.0;
  }
  id v4 = (void *)v3;
  v5 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics domainLookupEndDate];

  if (!v5) {
    return 0.0;
  }
  v6 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics domainLookupEndDate];
  uint64_t v7 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics domainLookupStartDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  return v9;
}

- (double)connectionEstablishmentTime
{
  uint64_t v3 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics connectStartDate];
  if (!v3) {
    return 0.0;
  }
  id v4 = (void *)v3;
  v5 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics connectEndDate];

  if (!v5) {
    return 0.0;
  }
  v6 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics connectEndDate];
  uint64_t v7 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics connectStartDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  return v9;
}

- (double)tcpConnectTime
{
  uint64_t v3 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics connectStartDate];
  if (!v3) {
    return 0.0;
  }
  id v4 = (void *)v3;
  v5 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics secureConnectionStartDate];

  if (!v5) {
    return 0.0;
  }
  v6 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics secureConnectionStartDate];
  uint64_t v7 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics connectStartDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  return v9;
}

- (double)secureConnectionTime
{
  uint64_t v3 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics secureConnectionStartDate];
  if (!v3) {
    return 0.0;
  }
  id v4 = (void *)v3;
  v5 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics secureConnectionEndDate];

  if (!v5) {
    return 0.0;
  }
  v6 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics secureConnectionEndDate];
  uint64_t v7 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics secureConnectionStartDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  return v9;
}

- (double)fetchStartToFirstByteTime
{
  uint64_t v3 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics fetchStartDate];
  if (!v3) {
    return 0.0;
  }
  id v4 = (void *)v3;
  v5 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics _firstByteReceivedDate];

  if (!v5) {
    return 0.0;
  }
  v6 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics _firstByteReceivedDate];
  uint64_t v7 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics fetchStartDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  return v9;
}

- (NSString)connectionMethod
{
  if ([(NSURLSessionTaskTransactionMetrics *)self->_metrics isCellular]) {
    v2 = @"Cellular";
  }
  else {
    v2 = @"Wifi";
  }

  return (NSString *)v2;
}

- (NSURL)requestURL
{
  v2 = [(NSURLSessionTaskTransactionMetrics *)self->_metrics request];
  uint64_t v3 = [v2 URL];

  return (NSURL *)v3;
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

- (void).cxx_destruct
{
}

@end