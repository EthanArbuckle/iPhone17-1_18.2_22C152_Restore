@interface TPSAnalyticsEventServiceRequest
+ (BOOL)supportsSecureCoding;
+ (id)serviceRequestEventWithType:(id)a3 metrics:(id)a4;
- (TPSAnalyticsEventServiceRequest)initWithCoder:(id)a3;
- (id)_initWithType:(id)a3 metrics:(id)a4;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSAnalyticsEventServiceRequest

- (id)_initWithType:(id)a3 metrics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v46.receiver = self;
  v46.super_class = (Class)TPSAnalyticsEventServiceRequest;
  v9 = [(TPSAnalyticsEvent *)&v46 initWithDate:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    v11 = [v8 transactionMetrics];
    v12 = [v11 firstObject];

    v13 = [v12 request];
    uint64_t v14 = [v13 URL];
    url = v10->_url;
    v10->_url = (NSURL *)v14;

    v16 = [v12 response];
    v17 = v16;
    if (v16)
    {
      v10->_statusCode = [v16 statusCode];
      uint64_t v18 = [v17 valueForHTTPHeaderField:@"Etag"];
      etag = v10->_etag;
      v10->_etag = (NSString *)v18;
    }
    v10->_responseSize = [v12 countOfResponseBodyBytesAfterDecoding];
    uint64_t v20 = [v12 requestEndDate];
    if (v20)
    {
      v21 = (void *)v20;
      v22 = [v12 requestStartDate];

      if (v22)
      {
        v23 = [v12 requestEndDate];
        v24 = [v12 requestStartDate];
        [v23 timeIntervalSinceDate:v24];
        v10->_requestTime = (unint64_t)v25;
      }
    }
    uint64_t v26 = [v12 responseStartDate];
    if (v26)
    {
      v27 = (void *)v26;
      v28 = [v12 responseEndDate];

      if (v28)
      {
        v29 = [v12 responseStartDate];
        v30 = [v12 responseEndDate];
        [v29 timeIntervalSinceDate:v30];
        v10->_responseTime = (unint64_t)v31;
      }
    }
    v32 = [v12 responseStartDate];

    if (v32)
    {
      v33 = [MEMORY[0x1E4F1C9C8] now];
      v34 = [v12 responseStartDate];
      [v33 timeIntervalSinceDate:v34];
      v10->_requestTtfb = (unint64_t)v35;
    }
    v36 = [v8 taskInterval];
    uint64_t v37 = [v36 endDate];
    if (v37)
    {
      v38 = (void *)v37;
      v39 = [v8 taskInterval];
      v40 = [v39 startDate];

      if (!v40)
      {
LABEL_16:
        v10->_responseHeadersSize = [v12 countOfResponseHeaderBytesReceived];

        goto LABEL_17;
      }
      v36 = [v8 taskInterval];
      v41 = [v36 endDate];
      v42 = [v8 taskInterval];
      v43 = [v42 startDate];
      [v41 timeIntervalSinceDate:v43];
      v10->_timeToDownloadResponse = (unint64_t)v44;
    }
    goto LABEL_16;
  }
LABEL_17:

  return v10;
}

+ (id)serviceRequestEventWithType:(id)a3 metrics:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) _initWithType:v7 metrics:v6];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventServiceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSAnalyticsEventServiceRequest;
  v5 = [(TPSAnalyticsEvent *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v8;

    v5->_statusCode = [v4 decodeIntegerForKey:@"response_status_code"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"etag"];
    etag = v5->_etag;
    v5->_etag = (NSString *)v10;

    v5->_requestTime = [v4 decodeIntegerForKey:@"request_time"];
    v5->_requestTtfb = [v4 decodeIntegerForKey:@"request_ttfb"];
    v5->_responseHeadersSize = [v4 decodeInt64ForKey:@"response_headers_size"];
    v5->_responseSize = [v4 decodeInt64ForKey:@"response_size"];
    v5->_responseTime = [v4 decodeIntegerForKey:@"response_time"];
    v5->_timeToDownloadResponse = [v4 decodeIntegerForKey:@"time_to_download_response"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventServiceRequest;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_url forKey:@"url"];
  [v4 encodeInteger:self->_statusCode forKey:@"response_status_code"];
  [v4 encodeObject:self->_etag forKey:@"etag"];
  [v4 encodeInteger:self->_requestTime forKey:@"request_time"];
  [v4 encodeInteger:self->_requestTtfb forKey:@"request_ttfb"];
  [v4 encodeInt64:self->_responseHeadersSize forKey:@"response_headers_size"];
  [v4 encodeInt64:self->_responseSize forKey:@"response_size"];
  [v4 encodeInteger:self->_responseTime forKey:@"response_time"];
  [v4 encodeInteger:self->_timeToDownloadResponse forKey:@"time_to_download_response"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"service_request"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_type forKeyedSubscript:@"type"];
  id v4 = [(NSURL *)self->_url absoluteString];
  [v3 setObject:v4 forKeyedSubscript:@"url"];

  objc_super v5 = [NSNumber numberWithInteger:self->_statusCode];
  [v3 setObject:v5 forKeyedSubscript:@"response_status_code"];

  [v3 setObject:self->_etag forKeyedSubscript:@"etag"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_requestTime];
  [v3 setObject:v6 forKeyedSubscript:@"request_time"];

  id v7 = [NSNumber numberWithUnsignedInteger:self->_requestTtfb];
  [v3 setObject:v7 forKeyedSubscript:@"request_ttfb"];

  uint64_t v8 = [NSNumber numberWithLongLong:self->_responseHeadersSize];
  [v3 setObject:v8 forKeyedSubscript:@"response_headers_size"];

  v9 = [NSNumber numberWithLongLong:self->_responseSize];
  [v3 setObject:v9 forKeyedSubscript:@"response_size"];

  uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_responseTime];
  [v3 setObject:v10 forKeyedSubscript:@"response_time"];

  v11 = [NSNumber numberWithUnsignedInteger:self->_timeToDownloadResponse];
  [v3 setObject:v11 forKeyedSubscript:@"time_to_download_response"];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end