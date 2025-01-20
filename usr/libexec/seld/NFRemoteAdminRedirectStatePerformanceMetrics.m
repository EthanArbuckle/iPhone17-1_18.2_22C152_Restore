@interface NFRemoteAdminRedirectStatePerformanceMetrics
+ (BOOL)supportsSecureCoding;
- (NFRemoteAdminRedirectStatePerformanceMetrics)initWithCoder:(id)a3;
- (NSError)nsUrlSessionError;
- (double)maxNetworkResponseTime;
- (double)totalAPDUTime;
- (double)totalNetworkResponseTime;
- (double)totalSessionTime;
- (id)asDictionary;
- (unsigned)totalResponsesWithBody;
- (unsigned)transferWithMaxResponseTime;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxNetworkResponseTime:(double)a3;
- (void)setNsUrlSessionError:(id)a3;
- (void)setTotalAPDUTime:(double)a3;
- (void)setTotalNetworkResponseTime:(double)a3;
- (void)setTotalResponsesWithBody:(unsigned int)a3;
- (void)setTotalSessionTime:(double)a3;
- (void)setTransferWithMaxResponseTime:(unsigned int)a3;
@end

@implementation NFRemoteAdminRedirectStatePerformanceMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFRemoteAdminRedirectStatePerformanceMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NFRemoteAdminRedirectStatePerformanceMetrics;
  v5 = [(NFRemoteAdminRedirectStatePerformanceMetrics *)&v19 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalResponsesWithBody"];
    v5->_totalResponsesWithBody = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferWithMaxResponseTime"];
    v5->_transferWithMaxResponseTime = [v7 unsignedIntegerValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxResponseTime"];
    [v8 doubleValue];
    v5->_maxNetworkResponseTime = v9;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalResponseTime"];
    [v10 doubleValue];
    v5->_totalNetworkResponseTime = v11;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalAPDUTime"];
    [v12 doubleValue];
    v5->_totalAPDUTime = v13;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalSessionTime"];
    [v14 doubleValue];
    v5->_totalSessionTime = v15;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nsUrlSessionError"];
    nsUrlSessionError = v5->_nsUrlSessionError;
    v5->_nsUrlSessionError = (NSError *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t totalResponsesWithBody = self->_totalResponsesWithBody;
  id v11 = a3;
  v5 = +[NSNumber numberWithUnsignedInteger:totalResponsesWithBody];
  [v11 encodeObject:v5 forKey:@"totalResponsesWithBody"];

  v6 = +[NSNumber numberWithUnsignedInteger:self->_transferWithMaxResponseTime];
  [v11 encodeObject:v6 forKey:@"transferWithMaxResponseTime"];

  v7 = +[NSNumber numberWithDouble:self->_maxNetworkResponseTime];
  [v11 encodeObject:v7 forKey:@"maxResponseTime"];

  v8 = +[NSNumber numberWithDouble:self->_totalNetworkResponseTime];
  [v11 encodeObject:v8 forKey:@"totalResponseTime"];

  double v9 = +[NSNumber numberWithDouble:self->_totalAPDUTime];
  [v11 encodeObject:v9 forKey:@"totalAPDUTime"];

  v10 = +[NSNumber numberWithDouble:self->_totalSessionTime];
  [v11 encodeObject:v10 forKey:@"totalSessionTime"];

  [v11 encodeObject:self->_nsUrlSessionError forKey:@"nsUrlSessionError"];
}

- (id)asDictionary
{
  v3 = objc_opt_new();
  id v4 = +[NSNumber numberWithUnsignedInteger:self->_totalResponsesWithBody];
  [v3 setObject:v4 forKey:@"totalResponsesWithBody"];

  v5 = +[NSNumber numberWithUnsignedInteger:self->_transferWithMaxResponseTime];
  [v3 setObject:v5 forKey:@"transferWithMaxResponseTime"];

  v6 = +[NSNumber numberWithInteger:(uint64_t)(self->_totalNetworkResponseTime * 1000.0)];
  [v3 setObject:v6 forKey:@"sumOfAllResponseTime"];

  v7 = +[NSNumber numberWithInteger:(uint64_t)(self->_maxNetworkResponseTime * 1000.0)];
  [v3 setObject:v7 forKey:@"maxResponseTime"];

  nsUrlSessionError = self->_nsUrlSessionError;
  if (nsUrlSessionError)
  {
    double v9 = +[NSNumber numberWithInteger:[(NSError *)nsUrlSessionError code]];
    [v3 setObject:v9 forKey:@"clientNSURLSessionErrorCode"];
  }

  return v3;
}

- (unsigned)totalResponsesWithBody
{
  return self->_totalResponsesWithBody;
}

- (void)setTotalResponsesWithBody:(unsigned int)a3
{
  self->_uint64_t totalResponsesWithBody = a3;
}

- (unsigned)transferWithMaxResponseTime
{
  return self->_transferWithMaxResponseTime;
}

- (void)setTransferWithMaxResponseTime:(unsigned int)a3
{
  self->_transferWithMaxResponseTime = a3;
}

- (double)maxNetworkResponseTime
{
  return self->_maxNetworkResponseTime;
}

- (void)setMaxNetworkResponseTime:(double)a3
{
  self->_maxNetworkResponseTime = a3;
}

- (double)totalNetworkResponseTime
{
  return self->_totalNetworkResponseTime;
}

- (void)setTotalNetworkResponseTime:(double)a3
{
  self->_totalNetworkResponseTime = a3;
}

- (double)totalAPDUTime
{
  return self->_totalAPDUTime;
}

- (void)setTotalAPDUTime:(double)a3
{
  self->_totalAPDUTime = a3;
}

- (double)totalSessionTime
{
  return self->_totalSessionTime;
}

- (void)setTotalSessionTime:(double)a3
{
  self->_totalSessionTime = a3;
}

- (NSError)nsUrlSessionError
{
  return self->_nsUrlSessionError;
}

- (void)setNsUrlSessionError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end