@interface ICURLPerformanceMetrics
- (BOOL)cachedResponse;
- (BOOL)connectionReused;
- (ICURLPerformanceMetrics)initWithDictionaryRepresentation:(id)a3;
- (ICURLPerformanceMetrics)initWithTransactionMetrics:(id)a3 request:(id)a4 taskIdentifier:(id)a5;
- (NSString)appleTimingApp;
- (NSString)connectionType;
- (NSString)edgeNodeCacheStatus;
- (NSString)environmentDataCenter;
- (NSString)jingleCorrelationKey;
- (NSString)requestUrl;
- (NSString)resolvedIPAddress;
- (NSString)responseDate;
- (NSString)taskIdentifier;
- (double)connectionEndTime;
- (double)connectionStartTime;
- (double)connectionTime;
- (double)dnsTime;
- (double)domainLookupEndTime;
- (double)domainLookupStartTime;
- (double)endTime;
- (double)fetchStartTime;
- (double)requestStartTime;
- (double)requestTime;
- (double)responseEndTime;
- (double)responseStartTime;
- (double)responseTime;
- (double)secureConnectionStartTime;
- (double)totalTime;
- (id)dictionaryRepresentation;
- (id)humanDescription;
- (unint64_t)redirectCount;
- (unint64_t)requestBytesSent;
- (unint64_t)requestMessageSize;
- (unint64_t)responseBytesReceived;
- (unint64_t)responseMessageSize;
- (unint64_t)statusCode;
@end

@implementation ICURLPerformanceMetrics

- (ICURLPerformanceMetrics)initWithTransactionMetrics:(id)a3 request:(id)a4 taskIdentifier:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v64.receiver = self;
  v64.super_class = (Class)ICURLPerformanceMetrics;
  v11 = [(ICURLPerformanceMetrics *)&v64 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_taskIdentifier, a5);
    v13 = [v8 connectStartDate];
    [v13 timeIntervalSince1970];
    v12->_connectionStartTime = v14;

    v15 = [v8 connectEndDate];
    [v15 timeIntervalSince1970];
    v12->_connectionEndTime = v16;

    v17 = [v8 domainLookupStartDate];
    [v17 timeIntervalSince1970];
    v12->_domainLookupStartTime = v18;

    v19 = [v8 domainLookupEndDate];
    [v19 timeIntervalSince1970];
    v12->_domainLookupEndTime = v20;

    v21 = [v8 fetchStartDate];
    [v21 timeIntervalSince1970];
    v12->_fetchStartTime = v22;

    v23 = [v8 requestStartDate];
    [v23 timeIntervalSince1970];
    v12->_requestStartTime = v24;

    v25 = [v8 responseStartDate];
    [v25 timeIntervalSince1970];
    v12->_responseStartTime = v26;

    v27 = [v8 responseEndDate];
    [v27 timeIntervalSince1970];
    v12->_responseEndTime = v28;

    v29 = [v8 secureConnectionStartDate];
    [v29 timeIntervalSince1970];
    v12->_secureConnectionStartTime = v30;

    v12->_cachedResponse = [v8 resourceFetchType] == 3;
    v12->_connectionReused = [v8 isReusedConnection];
    v12->_redirectCount = [v9 redirectCount];
    v31 = [v9 urlRequest];
    v32 = [v31 HTTPBody];
    v12->_requestMessageSize = [v32 length];

    uint64_t v33 = [v8 countOfRequestHeaderBytesSent];
    v12->_requestBytesSent = [v8 countOfRequestBodyBytesSent] + v33;
    v34 = [v9 responseData];
    v12->_responseMessageSize = [v34 length];

    uint64_t v35 = [v8 countOfResponseBodyBytesReceived];
    v12->_responseBytesReceived = [v8 countOfResponseHeaderBytesReceived] + v35;
    v36 = [v9 urlRequest];
    v37 = [v36 URL];
    uint64_t v38 = [v37 absoluteString];
    requestUrl = v12->_requestUrl;
    v12->_requestUrl = (NSString *)v38;

    v40 = [v8 response];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v41 = v40;
      uint64_t v42 = [v41 valueForHTTPHeaderField:@"apple-timing-app"];
      appleTimingApp = v12->_appleTimingApp;
      v12->_appleTimingApp = (NSString *)v42;

      uint64_t v44 = [v41 valueForHTTPHeaderField:@"X-Apple-Connection-Type"];
      connectionType = v12->_connectionType;
      v12->_connectionType = (NSString *)v44;

      uint64_t v46 = [v41 valueForHTTPHeaderField:@"X-Cache"];
      edgeNodeCacheStatus = v12->_edgeNodeCacheStatus;
      v12->_edgeNodeCacheStatus = (NSString *)v46;

      uint64_t v48 = [v41 valueForHTTPHeaderField:@"X-Apple-Application-Site"];
      environmentDataCenter = v12->_environmentDataCenter;
      v12->_environmentDataCenter = (NSString *)v48;

      uint64_t v50 = objc_msgSend(v41, "ic_valueForHTTPHeaderField:", @"x-apple-jingle-correlation-key");
      jingleCorrelationKey = v12->_jingleCorrelationKey;
      v12->_jingleCorrelationKey = (NSString *)v50;

      uint64_t v52 = [v41 valueForHTTPHeaderField:@"date"];
      responseDate = v12->_responseDate;
      v12->_responseDate = (NSString *)v52;

      uint64_t v54 = [v41 statusCode];
      v12->_statusCode = v54;
    }
    if ([v40 _CFURLResponse])
    {
      [v40 _CFURLResponse];
      CFDataRef v55 = (const __CFData *)CFURLResponseCopyPeerAddress();
      if (v55)
      {
        CFDataRef v56 = v55;
        BytePtr = CFDataGetBytePtr(v55);
        socklen_t v58 = *BytePtr;
        v59 = (char *)&v63 - (((_WORD)v58 + 15) & 0x1F0);
        inet_ntop(BytePtr[1], BytePtr + 4, v59, v58);
        uint64_t v60 = [NSString stringWithCString:v59 encoding:1];
        resolvedIPAddress = v12->_resolvedIPAddress;
        v12->_resolvedIPAddress = (NSString *)v60;

        CFRelease(v56);
      }
    }
  }
  return v12;
}

- (double)requestStartTime
{
  return self->_requestStartTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedIPAddress, 0);
  objc_storeStrong((id *)&self->_requestUrl, 0);
  objc_storeStrong((id *)&self->_responseDate, 0);
  objc_storeStrong((id *)&self->_environmentDataCenter, 0);
  objc_storeStrong((id *)&self->_edgeNodeCacheStatus, 0);
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_appleTimingApp, 0);
  objc_storeStrong((id *)&self->_jingleCorrelationKey, 0);

  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

- (unint64_t)responseBytesReceived
{
  return self->_responseBytesReceived;
}

- (unint64_t)responseMessageSize
{
  return self->_responseMessageSize;
}

- (NSString)resolvedIPAddress
{
  return self->_resolvedIPAddress;
}

- (NSString)requestUrl
{
  return self->_requestUrl;
}

- (unint64_t)requestBytesSent
{
  return self->_requestBytesSent;
}

- (unint64_t)requestMessageSize
{
  return self->_requestMessageSize;
}

- (unint64_t)redirectCount
{
  return self->_redirectCount;
}

- (unint64_t)statusCode
{
  return self->_statusCode;
}

- (NSString)responseDate
{
  return self->_responseDate;
}

- (NSString)environmentDataCenter
{
  return self->_environmentDataCenter;
}

- (NSString)edgeNodeCacheStatus
{
  return self->_edgeNodeCacheStatus;
}

- (NSString)connectionType
{
  return self->_connectionType;
}

- (NSString)appleTimingApp
{
  return self->_appleTimingApp;
}

- (BOOL)connectionReused
{
  return self->_connectionReused;
}

- (BOOL)cachedResponse
{
  return self->_cachedResponse;
}

- (double)secureConnectionStartTime
{
  return self->_secureConnectionStartTime;
}

- (double)responseEndTime
{
  return self->_responseEndTime;
}

- (double)responseStartTime
{
  return self->_responseStartTime;
}

- (double)fetchStartTime
{
  return self->_fetchStartTime;
}

- (double)domainLookupEndTime
{
  return self->_domainLookupEndTime;
}

- (double)domainLookupStartTime
{
  return self->_domainLookupStartTime;
}

- (double)connectionEndTime
{
  return self->_connectionEndTime;
}

- (double)connectionStartTime
{
  return self->_connectionStartTime;
}

- (NSString)jingleCorrelationKey
{
  return self->_jingleCorrelationKey;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (double)totalTime
{
  [(ICURLPerformanceMetrics *)self endTime];
  double v4 = v3;
  [(ICURLPerformanceMetrics *)self fetchStartTime];
  double v5 = 0.0;
  if (v6 > 0.0)
  {
    [(ICURLPerformanceMetrics *)self fetchStartTime];
    if (v4 > v7)
    {
      [(ICURLPerformanceMetrics *)self fetchStartTime];
      return v4 - v8;
    }
  }
  return v5;
}

- (double)responseTime
{
  [(ICURLPerformanceMetrics *)self responseEndTime];
  double v4 = v3;
  [(ICURLPerformanceMetrics *)self responseStartTime];
  double v6 = v5;
  double result = 0.0;
  if (v4 > v6)
  {
    [(ICURLPerformanceMetrics *)self responseEndTime];
    double v9 = v8;
    [(ICURLPerformanceMetrics *)self responseStartTime];
    return v9 - v10;
  }
  return result;
}

- (double)requestTime
{
  [(ICURLPerformanceMetrics *)self requestStartTime];
  double v3 = 0.0;
  if (v4 > 0.0)
  {
    [(ICURLPerformanceMetrics *)self responseStartTime];
    double v6 = v5;
    [(ICURLPerformanceMetrics *)self requestStartTime];
    if (v6 > v7)
    {
      [(ICURLPerformanceMetrics *)self responseStartTime];
      double v9 = v8;
      [(ICURLPerformanceMetrics *)self requestStartTime];
      return v9 - v10;
    }
  }
  return v3;
}

- (double)dnsTime
{
  [(ICURLPerformanceMetrics *)self domainLookupEndTime];
  double v4 = v3;
  [(ICURLPerformanceMetrics *)self domainLookupStartTime];
  double v6 = v5;
  double result = 0.0;
  if (v4 > v6)
  {
    [(ICURLPerformanceMetrics *)self domainLookupEndTime];
    double v9 = v8;
    [(ICURLPerformanceMetrics *)self domainLookupStartTime];
    return v9 - v10;
  }
  return result;
}

- (double)connectionTime
{
  [(ICURLPerformanceMetrics *)self connectionEndTime];
  double v4 = v3;
  [(ICURLPerformanceMetrics *)self connectionStartTime];
  double v6 = v5;
  double result = 0.0;
  if (v4 > v6)
  {
    [(ICURLPerformanceMetrics *)self connectionEndTime];
    double v9 = v8;
    [(ICURLPerformanceMetrics *)self connectionStartTime];
    return v9 - v10;
  }
  return result;
}

- (double)endTime
{
  double result = self->_responseEndTime;
  if (result <= 0.0)
  {
    double result = self->_responseStartTime;
    if (result <= 0.0)
    {
      double result = self->_requestStartTime;
      if (result <= 0.0)
      {
        double result = self->_connectionEndTime;
        if (result <= 0.0)
        {
          double result = self->_secureConnectionStartTime;
          if (result <= 0.0)
          {
            double result = self->_connectionStartTime;
            if (result <= 0.0)
            {
              double result = self->_domainLookupEndTime;
              if (result <= 0.0)
              {
                double result = self->_domainLookupStartTime;
                if (result <= 0.0) {
                  return self->_fetchStartTime;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (id)humanDescription
{
  double v3 = [MEMORY[0x1E4F28E78] stringWithString:self->_taskIdentifier];
  unint64_t v4 = [(ICURLPerformanceMetrics *)self statusCode];
  unint64_t v5 = [(ICURLPerformanceMetrics *)self responseMessageSize] / 0x3E8;
  [(ICURLPerformanceMetrics *)self totalTime];
  objc_msgSend(v3, "appendFormat:", @" %ld %ldkB total:%.0fms", v4, v5, v6 * 1000.0);
  if ([(ICURLPerformanceMetrics *)self cachedResponse])
  {
    double v7 = @" cached:YES";
LABEL_5:
    [v3 appendString:v7];
    goto LABEL_7;
  }
  if ([(ICURLPerformanceMetrics *)self connectionReused])
  {
    double v7 = @" connReused:YES";
    goto LABEL_5;
  }
  [(ICURLPerformanceMetrics *)self connectionTime];
  double v9 = v8 * 1000.0;
  [(ICURLPerformanceMetrics *)self dnsTime];
  objc_msgSend(v3, "appendFormat:", @" conn:%.0fms dns:%.0fms", *(void *)&v9, v10 * 1000.0);
LABEL_7:
  v11 = [(ICURLPerformanceMetrics *)self jingleCorrelationKey];

  if (v11)
  {
    [v3 appendString:@" jingleCorrelationKey:"];
    v12 = [(ICURLPerformanceMetrics *)self jingleCorrelationKey];
    [v3 appendString:v12];
  }
  v13 = [(ICURLPerformanceMetrics *)self requestUrl];
  [v3 appendFormat:@" %@", v13];

  return v3;
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_taskIdentifier forKeyedSubscript:@"taskIdentifier"];
  unint64_t v4 = [NSNumber numberWithDouble:self->_connectionStartTime];
  [v3 setObject:v4 forKeyedSubscript:@"connectionStartTime"];

  unint64_t v5 = [NSNumber numberWithDouble:self->_connectionEndTime];
  [v3 setObject:v5 forKeyedSubscript:@"connectionEndTime"];

  double v6 = [NSNumber numberWithDouble:self->_domainLookupStartTime];
  [v3 setObject:v6 forKeyedSubscript:@"domainLookupStartTime"];

  double v7 = [NSNumber numberWithDouble:self->_domainLookupEndTime];
  [v3 setObject:v7 forKeyedSubscript:@"domainLookupEndTime"];

  double v8 = [NSNumber numberWithDouble:self->_fetchStartTime];
  [v3 setObject:v8 forKeyedSubscript:@"fetchStartTime"];

  double v9 = [NSNumber numberWithDouble:self->_requestStartTime];
  [v3 setObject:v9 forKeyedSubscript:@"requestStartTime"];

  double v10 = [NSNumber numberWithDouble:self->_responseStartTime];
  [v3 setObject:v10 forKeyedSubscript:@"responseStartTime"];

  v11 = [NSNumber numberWithDouble:self->_responseEndTime];
  [v3 setObject:v11 forKeyedSubscript:@"responseEndTime"];

  v12 = [NSNumber numberWithDouble:self->_secureConnectionStartTime];
  [v3 setObject:v12 forKeyedSubscript:@"secureConnectionStartTime"];

  v13 = [NSNumber numberWithBool:self->_cachedResponse];
  [v3 setObject:v13 forKeyedSubscript:@"cachedResponse"];

  double v14 = [NSNumber numberWithBool:self->_connectionReused];
  [v3 setObject:v14 forKeyedSubscript:@"connectionReused"];

  v15 = [NSNumber numberWithUnsignedInteger:self->_redirectCount];
  [v3 setObject:v15 forKeyedSubscript:@"redirectCount"];

  double v16 = [NSNumber numberWithUnsignedInteger:self->_requestMessageSize];
  [v3 setObject:v16 forKeyedSubscript:@"requestMessageSize"];

  v17 = [NSNumber numberWithUnsignedInteger:self->_requestBytesSent];
  [v3 setObject:v17 forKeyedSubscript:@"requestBytesSent"];

  double v18 = [NSNumber numberWithUnsignedInteger:self->_responseMessageSize];
  [v3 setObject:v18 forKeyedSubscript:@"responseMessageSize"];

  v19 = [NSNumber numberWithUnsignedInteger:self->_responseBytesReceived];
  [v3 setObject:v19 forKeyedSubscript:@"responseBytesReceived"];

  [v3 setObject:self->_requestUrl forKeyedSubscript:@"requestUrl"];
  [v3 setObject:self->_appleTimingApp forKeyedSubscript:@"appleTimingApp"];
  [v3 setObject:self->_connectionType forKeyedSubscript:@"connectionType"];
  [v3 setObject:self->_edgeNodeCacheStatus forKeyedSubscript:@"edgeNodeCacheStatus"];
  [v3 setObject:self->_environmentDataCenter forKeyedSubscript:@"environmentDataCenter"];
  [v3 setObject:self->_jingleCorrelationKey forKeyedSubscript:@"jingleCorrelationKey"];
  [v3 setObject:self->_responseDate forKeyedSubscript:@"responseDate"];
  double v20 = [NSNumber numberWithUnsignedInteger:self->_statusCode];
  [v3 setObject:v20 forKeyedSubscript:@"statusCode"];

  [v3 setObject:self->_resolvedIPAddress forKeyedSubscript:@"resolvedIPAddress"];

  return v3;
}

- (ICURLPerformanceMetrics)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)ICURLPerformanceMetrics;
  unint64_t v5 = [(ICURLPerformanceMetrics *)&v51 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"taskIdentifier"];
    taskIdentifier = v5->_taskIdentifier;
    v5->_taskIdentifier = (NSString *)v6;

    double v8 = [v4 objectForKeyedSubscript:@"connectionStartTime"];
    [v8 doubleValue];
    v5->_connectionStartTime = v9;

    double v10 = [v4 objectForKeyedSubscript:@"connectionEndTime"];
    [v10 doubleValue];
    v5->_connectionEndTime = v11;

    v12 = [v4 objectForKeyedSubscript:@"domainLookupStartTime"];
    [v12 doubleValue];
    v5->_domainLookupStartTime = v13;

    double v14 = [v4 objectForKeyedSubscript:@"domainLookupEndTime"];
    [v14 doubleValue];
    v5->_domainLookupEndTime = v15;

    double v16 = [v4 objectForKeyedSubscript:@"fetchStartTime"];
    [v16 doubleValue];
    v5->_fetchStartTime = v17;

    double v18 = [v4 objectForKeyedSubscript:@"requestStartTime"];
    [v18 doubleValue];
    v5->_requestStartTime = v19;

    double v20 = [v4 objectForKeyedSubscript:@"responseStartTime"];
    [v20 doubleValue];
    v5->_responseStartTime = v21;

    double v22 = [v4 objectForKeyedSubscript:@"responseEndTime"];
    [v22 doubleValue];
    v5->_responseEndTime = v23;

    double v24 = [v4 objectForKeyedSubscript:@"secureConnectionStartTime"];
    [v24 doubleValue];
    v5->_secureConnectionStartTime = v25;

    double v26 = [v4 objectForKeyedSubscript:@"cachedResponse"];
    v5->_cachedResponse = [v26 BOOLValue];

    v27 = [v4 objectForKeyedSubscript:@"connectionReused"];
    v5->_connectionReused = [v27 BOOLValue];

    double v28 = [v4 objectForKeyedSubscript:@"redirectCount"];
    v5->_redirectCount = [v28 integerValue];

    v29 = [v4 objectForKeyedSubscript:@"requestMessageSize"];
    v5->_requestMessageSize = [v29 integerValue];

    double v30 = [v4 objectForKeyedSubscript:@"requestBytesSent"];
    v5->_requestBytesSent = [v30 integerValue];

    v31 = [v4 objectForKeyedSubscript:@"responseMessageSize"];
    v5->_responseMessageSize = [v31 integerValue];

    v32 = [v4 objectForKeyedSubscript:@"responseBytesReceived"];
    v5->_responseBytesReceived = [v32 integerValue];

    uint64_t v33 = [v4 objectForKeyedSubscript:@"requestUrl"];
    requestUrl = v5->_requestUrl;
    v5->_requestUrl = (NSString *)v33;

    uint64_t v35 = [v4 objectForKeyedSubscript:@"appleTimingApp"];
    appleTimingApp = v5->_appleTimingApp;
    v5->_appleTimingApp = (NSString *)v35;

    uint64_t v37 = [v4 objectForKeyedSubscript:@"connectionType"];
    connectionType = v5->_connectionType;
    v5->_connectionType = (NSString *)v37;

    uint64_t v39 = [v4 objectForKeyedSubscript:@"edgeNodeCacheStatus"];
    edgeNodeCacheStatus = v5->_edgeNodeCacheStatus;
    v5->_edgeNodeCacheStatus = (NSString *)v39;

    uint64_t v41 = [v4 objectForKeyedSubscript:@"environmentDataCenter"];
    environmentDataCenter = v5->_environmentDataCenter;
    v5->_environmentDataCenter = (NSString *)v41;

    uint64_t v43 = [v4 objectForKeyedSubscript:@"jingleCorrelationKey"];
    jingleCorrelationKey = v5->_jingleCorrelationKey;
    v5->_jingleCorrelationKey = (NSString *)v43;

    uint64_t v45 = [v4 objectForKeyedSubscript:@"responseDate"];
    responseDate = v5->_responseDate;
    v5->_responseDate = (NSString *)v45;

    v47 = [v4 objectForKeyedSubscript:@"statusCode"];
    v5->_statusCode = [v47 integerValue];

    uint64_t v48 = [v4 objectForKeyedSubscript:@"resolvedIPAddress"];
    resolvedIPAddress = v5->_resolvedIPAddress;
    v5->_resolvedIPAddress = (NSString *)v48;
  }
  return v5;
}

@end