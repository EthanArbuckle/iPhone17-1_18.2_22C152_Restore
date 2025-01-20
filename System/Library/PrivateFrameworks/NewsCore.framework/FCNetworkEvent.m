@interface FCNetworkEvent
- (BOOL)isProxyConnection;
- (FCNetworkEvent)initWithType:(int)a3 URL:(id)a4 operationID:(id)a5 requestUUID:(id)a6 responseMIMEType:(id)a7 HTTPStatusCode:(unint64_t)a8 HTTPMethod:(id)a9 HTTPResponseHeaders:(id)a10 containerName:(id)a11 isProxyConnection:(BOOL)a12 error:(id)a13 startTime:(double)a14 dnsDuration:(double)a15 connectDuration:(double)a16 requestDuration:(double)a17 responseDuration:(double)a18 requestSize:(double)a19 responseSize:(double)a20;
- (FCNetworkEvent)initWithType:(int)a3 URLRequest:(id)a4 operationID:(id)a5 requestUUID:(id)a6 startTime:(double)a7 HTTPResponse:(id)a8 metrics:(id)a9 containerName:(id)a10 error:(id)a11;
- (FCNetworkEvent)initWithType:(int)a3 ckRequestInfo:(id)a4 operationID:(id)a5 startTime:(double)a6 containerName:(id)a7 error:(id)a8;
- (FCNetworkEvent)initWithType:(int)a3 rcNetworkEvent:(id)a4;
- (NSDateInterval)dateInterval;
- (NSDictionary)HTTPResponseHeaders;
- (NSError)error;
- (NSString)HTTPMethod;
- (NSString)containerName;
- (NSString)operationID;
- (NSString)requestUUID;
- (NSString)responseMIMEType;
- (NSURL)URL;
- (double)connectDuration;
- (double)dnsDuration;
- (double)requestDuration;
- (double)responseDuration;
- (double)startTime;
- (double)totalDuration;
- (id)debugDescription;
- (id)description;
- (int)type;
- (unint64_t)HTTPStatusCode;
- (unint64_t)requestSize;
- (unint64_t)responseSize;
@end

@implementation FCNetworkEvent

- (int)type
{
  return self->_type;
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (unint64_t)HTTPStatusCode
{
  return self->_HTTPStatusCode;
}

- (unint64_t)responseSize
{
  return self->_responseSize;
}

- (double)totalDuration
{
  [(FCNetworkEvent *)self dnsDuration];
  double v4 = v3;
  [(FCNetworkEvent *)self connectDuration];
  double v6 = v4 + v5;
  [(FCNetworkEvent *)self requestDuration];
  double v8 = v6 + v7;
  [(FCNetworkEvent *)self responseDuration];
  return v8 + v9;
}

- (double)responseDuration
{
  return self->_responseDuration;
}

- (double)requestDuration
{
  return self->_requestDuration;
}

- (double)dnsDuration
{
  return self->_dnsDuration;
}

- (id)description
{
  double v3 = +[FCDescription descriptionWithObject:self];
  double v4 = FCStringFromNetworkEventType([(FCNetworkEvent *)self type]);
  [v3 addField:@"type" object:v4];

  double v5 = [(FCNetworkEvent *)self URL];

  if (v5)
  {
    double v6 = [(FCNetworkEvent *)self URL];
    [v3 addField:@"URL" object:v6];
  }
  double v7 = [(FCNetworkEvent *)self requestUUID];
  [v3 addField:@"requestUUID" object:v7];

  double v8 = [(FCNetworkEvent *)self operationID];
  [v3 addField:@"operationID" object:v8];

  double v9 = [(FCNetworkEvent *)self containerName];

  if (v9)
  {
    v10 = [(FCNetworkEvent *)self containerName];
    [v3 addField:@"containerName" value:v10];
  }
  v11 = [(FCNetworkEvent *)self error];

  if (!v11)
  {
    [(FCNetworkEvent *)self connectDuration];
    double v13 = v12;
    [(FCNetworkEvent *)self totalDuration];
    double v15 = fmax(v14, 0.0) * 1000.0;
    unint64_t v16 = (unint64_t)v15;
    if (v13 == 0.0)
    {
      objc_msgSend(v3, "addField:format:", @"timing", @"total=%llums", (unint64_t)v15, v32, v33, v34);
    }
    else
    {
      [(FCNetworkEvent *)self dnsDuration];
      unint64_t v18 = (unint64_t)(fmax(v17, 0.0) * 1000.0);
      [(FCNetworkEvent *)self connectDuration];
      unint64_t v20 = (unint64_t)(fmax(v19, 0.0) * 1000.0);
      [(FCNetworkEvent *)self requestDuration];
      double v22 = v21;
      [(FCNetworkEvent *)self responseDuration];
      [v3 addField:@"timing", @"total=%llums, dns=%llums, connect=%llums, remainder=%llums", v16, v18, v20, (unint64_t)(fmax(v22 + v23, 0.0) * 1000.0) format];
    }
    if ([(FCNetworkEvent *)self HTTPStatusCode] != 200)
    {
      v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCNetworkEvent HTTPStatusCode](self, "HTTPStatusCode"));
      [v3 addField:@"httpStatusCode" object:v24];
    }
  }
  v25 = [(FCNetworkEvent *)self HTTPResponseHeaders];
  v26 = [v25 objectForKeyedSubscript:@"X-Apple-Cache"];

  if (v26)
  {
    if ([v26 BOOLValue]) {
      v27 = @"YES";
    }
    else {
      v27 = @"NO";
    }
    [v3 addField:@"cached" object:v27];
  }
  v28 = [(FCNetworkEvent *)self error];

  if (v28)
  {
    v29 = [(FCNetworkEvent *)self error];
    [v3 addField:@"error" object:v29];
  }
  v30 = [v3 descriptionString];

  return v30;
}

- (NSURL)URL
{
  return self->_URL;
}

- (double)connectDuration
{
  return self->_connectDuration;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (NSDictionary)HTTPResponseHeaders
{
  return self->_HTTPResponseHeaders;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (FCNetworkEvent)initWithType:(int)a3 URLRequest:(id)a4 operationID:(id)a5 requestUUID:(id)a6 startTime:(double)a7 HTTPResponse:(id)a8 metrics:(id)a9 containerName:(id)a10 error:(id)a11
{
  id v49 = a11;
  id v48 = a10;
  id v17 = a9;
  id v18 = a8;
  id v50 = a6;
  id v19 = a5;
  id v20 = a4;
  v46 = [v20 URL];
  v44 = [v18 MIMEType];
  uint64_t v43 = [v18 statusCode];
  v40 = [v20 HTTPMethod];

  v38 = [v18 allHeaderFields];

  LOBYTE(a5) = [v17 isProxyConnection];
  v47 = [v17 domainLookupEndDate];
  v45 = [v17 domainLookupStartDate];
  [v47 timeIntervalSinceDate:v45];
  double v22 = v21;
  v42 = [v17 connectEndDate];
  v41 = [v17 connectStartDate];
  [v42 timeIntervalSinceDate:v41];
  double v24 = v23;
  v39 = [v17 responseStartDate];
  v25 = [v17 requestStartDate];
  [v39 timeIntervalSinceDate:v25];
  double v27 = v26;
  v28 = [v17 responseEndDate];
  v29 = [v17 responseStartDate];
  [v28 timeIntervalSinceDate:v29];
  double v31 = v30;
  uint64_t v32 = [v17 countOfRequestHeaderBytesSent];
  double v33 = (double)([v17 countOfRequestBodyBytesSent] + v32);
  uint64_t v34 = [v17 countOfResponseHeaderBytesReceived];
  uint64_t v35 = [v17 countOfResponseBodyBytesReceived];

  LOBYTE(v37) = (_BYTE)a5;
  v53 = -[FCNetworkEvent initWithType:URL:operationID:requestUUID:responseMIMEType:HTTPStatusCode:HTTPMethod:HTTPResponseHeaders:containerName:isProxyConnection:error:startTime:dnsDuration:connectDuration:requestDuration:responseDuration:requestSize:responseSize:](self, "initWithType:URL:operationID:requestUUID:responseMIMEType:HTTPStatusCode:HTTPMethod:HTTPResponseHeaders:containerName:isProxyConnection:error:startTime:dnsDuration:connectDuration:requestDuration:responseDuration:requestSize:responseSize:", a3, v46, v19, v50, v44, v43, a7, v22, v24, v27, v31, v33, (double)(v35 + v34), v40, v38,
          v48,
          v37,
          v49);

  return v53;
}

- (FCNetworkEvent)initWithType:(int)a3 URL:(id)a4 operationID:(id)a5 requestUUID:(id)a6 responseMIMEType:(id)a7 HTTPStatusCode:(unint64_t)a8 HTTPMethod:(id)a9 HTTPResponseHeaders:(id)a10 containerName:(id)a11 isProxyConnection:(BOOL)a12 error:(id)a13 startTime:(double)a14 dnsDuration:(double)a15 connectDuration:(double)a16 requestDuration:(double)a17 responseDuration:(double)a18 requestSize:(double)a19 responseSize:(double)a20
{
  id v58 = a4;
  id v31 = a5;
  id v32 = a6;
  id v33 = a7;
  id v34 = a9;
  id v35 = a10;
  id v36 = a11;
  id v37 = a13;
  v59.receiver = self;
  v59.super_class = (Class)FCNetworkEvent;
  v38 = [(FCNetworkEvent *)&v59 init];
  v39 = v38;
  if (v38)
  {
    v38->_type = a3;
    uint64_t v40 = [v58 copy];
    URL = v39->_URL;
    v39->_URL = (NSURL *)v40;

    uint64_t v42 = [v31 copy];
    operationID = v39->_operationID;
    v39->_operationID = (NSString *)v42;

    uint64_t v44 = [v32 copy];
    requestUUID = v39->_requestUUID;
    v39->_requestUUID = (NSString *)v44;

    uint64_t v46 = [v33 copy];
    responseMIMEType = v39->_responseMIMEType;
    v39->_responseMIMEType = (NSString *)v46;

    v39->_HTTPStatusCode = a8;
    uint64_t v48 = [v34 copy];
    HTTPMethod = v39->_HTTPMethod;
    v39->_HTTPMethod = (NSString *)v48;

    uint64_t v50 = [v35 copy];
    HTTPResponseHeaders = v39->_HTTPResponseHeaders;
    v39->_HTTPResponseHeaders = (NSDictionary *)v50;

    uint64_t v52 = [v36 copy];
    containerName = v39->_containerName;
    v39->_containerName = (NSString *)v52;

    v39->_isProxyConnection = a12;
    uint64_t v54 = [v37 copy];
    error = v39->_error;
    v39->_error = (NSError *)v54;

    v39->_startTime = a14;
    v39->_connectDuration = a16;
    v39->_requestDuration = a17;
    v39->_responseDuration = a18;
    v39->_requestSize = (unint64_t)a19;
    v39->_responseSize = (unint64_t)a20;
  }

  return v39;
}

- (NSError)error
{
  return self->_error;
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)isProxyConnection
{
  return self->_isProxyConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_HTTPResponseHeaders, 0);
  objc_storeStrong((id *)&self->_HTTPMethod, 0);
  objc_storeStrong((id *)&self->_responseMIMEType, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (FCNetworkEvent)initWithType:(int)a3 ckRequestInfo:(id)a4 operationID:(id)a5 startTime:(double)a6 containerName:(id)a7 error:(id)a8
{
  id v12 = a4;
  id v13 = a8;
  id v14 = a7;
  id v52 = a5;
  objc_super v59 = [v12 requestUUID];
  v57 = [v12 responseHTTPHeaders];
  id v58 = [v57 objectForKeyedSubscript:@"Content-Type"];
  v56 = v13;
  if (v13)
  {
    v39 = [v13 userInfo];
    v38 = [v39 objectForKeyedSubscript:*MEMORY[0x1E4F19CA8]];
    uint64_t v47 = [v38 unsignedIntegerValue];
  }
  else
  {
    uint64_t v47 = 200;
  }
  double v15 = [v12 responseHTTPHeaders];
  v51 = [v12 w3cNavigationTiming];
  uint64_t v50 = [v51 objectForKeyedSubscript:@"_kCFNTimingDataDomainLookupEnd"];
  [v50 doubleValue];
  double v17 = v16;
  id v49 = [v12 w3cNavigationTiming];
  uint64_t v48 = [v49 objectForKeyedSubscript:@"_kCFNTimingDataDomainLookupStart"];
  [v48 doubleValue];
  double v19 = v17 - v18;
  uint64_t v46 = [v12 w3cNavigationTiming];
  v45 = [v46 objectForKeyedSubscript:@"_kCFNTimingDataConnectEnd"];
  [v45 doubleValue];
  double v21 = v20;
  uint64_t v44 = [v12 w3cNavigationTiming];
  uint64_t v43 = [v44 objectForKeyedSubscript:@"_kCFNTimingDataConnectStart"];
  [v43 doubleValue];
  double v23 = v21 - v22;
  uint64_t v42 = [v12 w3cNavigationTiming];
  v41 = [v42 objectForKeyedSubscript:@"_kCFNTimingDataResponseStart"];
  [v41 doubleValue];
  double v25 = v24;
  uint64_t v40 = [v12 w3cNavigationTiming];
  double v26 = [v40 objectForKeyedSubscript:@"_kCFNTimingDataRequestStart"];
  [v26 doubleValue];
  double v28 = v25 - v27;
  v29 = [v12 w3cNavigationTiming];
  double v30 = [v29 objectForKeyedSubscript:@"_kCFNTimingDataResponseEnd"];
  [v30 doubleValue];
  double v32 = v31;
  id v33 = [v12 w3cNavigationTiming];
  id v34 = [v33 objectForKeyedSubscript:@"_kCFNTimingDataResponseStart"];
  [v34 doubleValue];
  LOBYTE(v37) = 0;
  v55 = -[FCNetworkEvent initWithType:URL:operationID:requestUUID:responseMIMEType:HTTPStatusCode:HTTPMethod:HTTPResponseHeaders:containerName:isProxyConnection:error:startTime:dnsDuration:connectDuration:requestDuration:responseDuration:requestSize:responseSize:](self, "initWithType:URL:operationID:requestUUID:responseMIMEType:HTTPStatusCode:HTTPMethod:HTTPResponseHeaders:containerName:isProxyConnection:error:startTime:dnsDuration:connectDuration:requestDuration:responseDuration:requestSize:responseSize:", a3, 0, v52, v59, v58, v47, a6, v19, v23, v28, v32 - v35, 0.0, 0.0, @"POST", v15,
          v14,
          v37,
          v56);

  if (v56)
  {
  }
  return v55;
}

- (FCNetworkEvent)initWithType:(int)a3 rcNetworkEvent:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  double v7 = [v6 request];
  double v8 = [v6 operationID];
  double v9 = [v6 requestID];
  v10 = [v6 startDate];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;
  id v13 = [v6 response];
  id v14 = [v6 metrics];
  double v15 = [v6 error];

  double v16 = [(FCNetworkEvent *)self initWithType:v4 URLRequest:v7 operationID:v8 requestUUID:v9 startTime:v13 HTTPResponse:v14 metrics:v12 containerName:0 error:v15];
  return v16;
}

- (NSDateInterval)dateInterval
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  [(FCNetworkEvent *)self startTime];
  double v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  [(FCNetworkEvent *)self totalDuration];
  double v7 = objc_msgSend(v3, "initWithStartDate:duration:", v5, fmax(v6, 0.0));

  return (NSDateInterval *)v7;
}

- (id)debugDescription
{
  id v3 = +[FCDescription descriptionWithObject:self];
  uint64_t v4 = FCStringFromNetworkEventType([(FCNetworkEvent *)self type]);
  [v3 addField:@"type" object:v4];

  double v5 = [(FCNetworkEvent *)self URL];

  if (v5)
  {
    double v6 = [(FCNetworkEvent *)self URL];
    [v3 addField:@"URL" object:v6];
  }
  double v7 = [(FCNetworkEvent *)self HTTPMethod];
  [v3 addField:@"httpMethod" object:v7];

  double v8 = [(FCNetworkEvent *)self requestUUID];
  [v3 addField:@"requestUUID" object:v8];

  double v9 = [(FCNetworkEvent *)self operationID];
  [v3 addField:@"operationID" value:v9];

  v10 = [(FCNetworkEvent *)self containerName];

  if (v10)
  {
    double v11 = [(FCNetworkEvent *)self containerName];
    [v3 addField:@"containerName" value:v11];
  }
  double v12 = (void *)MEMORY[0x1E4F1C9C8];
  [(FCNetworkEvent *)self startTime];
  id v13 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
  [v3 addField:@"startDate" object:v13];

  id v14 = [(FCNetworkEvent *)self error];

  if (!v14)
  {
    [(FCNetworkEvent *)self connectDuration];
    double v16 = v15;
    [(FCNetworkEvent *)self totalDuration];
    double v18 = fmax(v17, 0.0) * 1000.0;
    unint64_t v19 = (unint64_t)v18;
    if (v16 == 0.0)
    {
      objc_msgSend(v3, "addField:format:", @"timing", @"total=%llums", (unint64_t)v18, v41, v42, v43);
    }
    else
    {
      [(FCNetworkEvent *)self dnsDuration];
      unint64_t v21 = (unint64_t)(fmax(v20, 0.0) * 1000.0);
      [(FCNetworkEvent *)self connectDuration];
      unint64_t v23 = (unint64_t)(fmax(v22, 0.0) * 1000.0);
      [(FCNetworkEvent *)self requestDuration];
      double v25 = v24;
      [(FCNetworkEvent *)self responseDuration];
      [v3 addField:@"timing", @"total=%llums, dns=%llums, connect=%llums, remainder=%llums", v19, v21, v23, (unint64_t)(fmax(v25 + v26, 0.0) * 1000.0) format];
    }
  }
  double v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FCNetworkEvent HTTPStatusCode](self, "HTTPStatusCode"));
  [v3 addField:@"httpStatusCode" object:v27];

  double v28 = [(FCNetworkEvent *)self HTTPResponseHeaders];
  v29 = [v28 objectForKeyedSubscript:@"X-Apple-Cache"];

  if (v29)
  {
    if ([v29 BOOLValue]) {
      double v30 = @"YES";
    }
    else {
      double v30 = @"NO";
    }
    [v3 addField:@"cached" object:v30];
  }
  double v31 = [(FCNetworkEvent *)self responseMIMEType];

  if (v31)
  {
    double v32 = [(FCNetworkEvent *)self responseMIMEType];
    [v3 addField:@"responseMIMEType" object:v32];
  }
  if ([(FCNetworkEvent *)self requestSize])
  {
    id v33 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[FCNetworkEvent requestSize](self, "requestSize"), 0);
    [v3 addField:@"requestSize" object:v33];
  }
  if ([(FCNetworkEvent *)self responseSize])
  {
    id v34 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", -[FCNetworkEvent responseSize](self, "responseSize"), 0);
    [v3 addField:@"responseSize" object:v34];
  }
  double v35 = [(FCNetworkEvent *)self error];

  if (v35)
  {
    id v36 = [(FCNetworkEvent *)self error];
    [v3 addField:@"error" object:v36];
  }
  uint64_t v37 = [(FCNetworkEvent *)self HTTPResponseHeaders];

  if (v37)
  {
    v38 = [(FCNetworkEvent *)self HTTPResponseHeaders];
    [v3 addField:@"httpResponseHeaders" object:v38];
  }
  v39 = [v3 descriptionString];

  return v39;
}

- (NSString)responseMIMEType
{
  return self->_responseMIMEType;
}

- (NSString)HTTPMethod
{
  return self->_HTTPMethod;
}

- (unint64_t)requestSize
{
  return self->_requestSize;
}

@end