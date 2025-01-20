@interface NPTMetricResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMetricResult:(id)a3;
- (NPTMetricResult)initWithCoder:(id)a3;
- (NSDictionary)asDictionary;
- (NSError)error;
- (NSNumber)appleClientASN;
- (NSNumber)concurrentStreams;
- (NSNumber)latency;
- (NSNumber)localPort;
- (NSNumber)negotiatedTLSCipherSuite;
- (NSNumber)negotiatedTLSProtocolVersion;
- (NSNumber)remotePort;
- (NSNumber)responsiveness;
- (NSNumber)responsivenessConfidence;
- (NSNumber)responsivenessRating;
- (NSNumber)speedConfidence;
- (NSNumber)speedRating;
- (NSString)appleClientASNCompany;
- (NSString)cdnpop;
- (NSString)cdnuuid;
- (NSString)fetchDate;
- (NSString)interfaceName;
- (NSString)interfaceServiceName;
- (NSString)isCellular;
- (NSString)isConstrained;
- (NSString)isExpensive;
- (NSString)isMultipath;
- (NSString)isProxyConnection;
- (NSString)isReusedConnection;
- (NSString)localAddress;
- (NSString)nqTestEndPoint;
- (NSString)protocolName;
- (NSString)remoteAddress;
- (NSString)server;
- (double)connectionTime;
- (double)domainLookupTime;
- (double)maxSpeedObserved;
- (double)requestTime;
- (double)requestToResponseTime;
- (double)responseTime;
- (double)secureConnectionTime;
- (double)speed;
- (double)stableSpeed;
- (double)timeIntervalSinceDateWithLogging:(id)a3 startDate:(id)a4 nameToLog:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)fileSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)populateWithMetrics:(id)a3;
- (void)populateWithURLResponse:(id)a3;
- (void)setAppleClientASN:(id)a3;
- (void)setAppleClientASNCompany:(id)a3;
- (void)setCdnpop:(id)a3;
- (void)setCdnuuid:(id)a3;
- (void)setConcurrentStreams:(id)a3;
- (void)setConnectionTime:(double)a3;
- (void)setDomainLookupTime:(double)a3;
- (void)setError:(id)a3;
- (void)setFetchDate:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInterfaceServiceName:(id)a3;
- (void)setIsCellular:(id)a3;
- (void)setIsConstrained:(id)a3;
- (void)setIsExpensive:(id)a3;
- (void)setIsMultipath:(id)a3;
- (void)setIsProxyConnection:(id)a3;
- (void)setIsReusedConnection:(id)a3;
- (void)setLatency:(id)a3;
- (void)setLocalAddress:(id)a3;
- (void)setLocalPort:(id)a3;
- (void)setMaxSpeedObserved:(double)a3;
- (void)setNegotiatedTLSCipherSuite:(id)a3;
- (void)setNegotiatedTLSProtocolVersion:(id)a3;
- (void)setNqTestEndPoint:(id)a3;
- (void)setProtocolName:(id)a3;
- (void)setRemoteAddress:(id)a3;
- (void)setRemotePort:(id)a3;
- (void)setRequestTime:(double)a3;
- (void)setRequestToResponseTime:(double)a3;
- (void)setResponseTime:(double)a3;
- (void)setResponsiveness:(id)a3;
- (void)setResponsivenessConfidence:(id)a3;
- (void)setResponsivenessRating:(id)a3;
- (void)setSecureConnectionTime:(double)a3;
- (void)setServer:(id)a3;
- (void)setSpeed:(double)a3;
- (void)setSpeedConfidence:(id)a3;
- (void)setSpeedRating:(id)a3;
- (void)setStableSpeed:(double)a3;
@end

@implementation NPTMetricResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v3 setValue:self->_fetchDate forKey:@"fetch_date"];
  [v3 setValue:self->_protocolName forKey:@"protocol_name"];
  [v3 setValue:self->_isReusedConnection forKey:@"is_reused_connection"];
  [v3 setValue:self->_isProxyConnection forKey:@"is_proxy_connection"];
  v4 = [NSNumber numberWithUnsignedLongLong:self->_fileSize];
  [v3 setValue:v4 forKey:@"file_size"];

  v5 = [NSNumber numberWithDouble:self->_speed];
  [v3 setValue:v5 forKey:@"speed"];

  v6 = [NSNumber numberWithDouble:self->_maxSpeedObserved];
  [v3 setValue:v6 forKey:@"max_speed_observed"];

  v7 = [NSNumber numberWithDouble:self->_stableSpeed];
  [v3 setValue:v7 forKey:@"stable_speed"];

  [v3 setValue:self->_speedRating forKey:@"speed_rating"];
  [v3 setValue:self->_speedConfidence forKey:@"speed_confidence"];
  [v3 setValue:self->_latency forKey:@"latency"];
  [v3 setValue:self->_nqTestEndPoint forKey:@"nq_test_end_point"];
  v8 = [NSNumber numberWithDouble:self->_domainLookupTime];
  [v3 setValue:v8 forKey:@"domain_lookup_time"];

  v9 = [NSNumber numberWithDouble:self->_connectionTime];
  [v3 setValue:v9 forKey:@"connection_time"];

  v10 = [NSNumber numberWithDouble:self->_secureConnectionTime];
  [v3 setValue:v10 forKey:@"secure_connection_time"];

  v11 = [NSNumber numberWithDouble:self->_requestTime];
  [v3 setValue:v11 forKey:@"request_time"];

  v12 = [NSNumber numberWithDouble:self->_requestToResponseTime];
  [v3 setValue:v12 forKey:@"request_to_response_time"];

  v13 = [NSNumber numberWithDouble:self->_responseTime];
  [v3 setValue:v13 forKey:@"response_time"];

  [v3 setValue:self->_cdnpop forKey:@"cdn_pop"];
  [v3 setValue:self->_cdnuuid forKey:@"cdn_uuid"];
  [v3 setValue:self->_appleClientASN forKey:@"apple_client_asn"];
  [v3 setValue:self->_appleClientASNCompany forKey:@"apple_client_asn_company"];
  [v3 setValue:self->_server forKey:@"server"];
  [v3 setValue:self->_isCellular forKey:@"is_cellular"];
  [v3 setValue:self->_isConstrained forKey:@"is_constrained"];
  [v3 setValue:self->_isExpensive forKey:@"is_expensive"];
  [v3 setValue:self->_isMultipath forKey:@"is_multipath"];
  [v3 setValue:self->_localAddress forKey:@"local_address"];
  [v3 setValue:self->_remoteAddress forKey:@"remote_address"];
  [v3 setValue:self->_localPort forKey:@"local_port"];
  [v3 setValue:self->_remotePort forKey:@"remote_port"];
  [v3 setValue:self->_negotiatedTLSCipherSuite forKey:@"negotiated_tls_cipher_suite"];
  [v3 setValue:self->_negotiatedTLSProtocolVersion forKey:@"negotiated_tls_protocol_version"];
  [v3 setValue:self->_interfaceServiceName forKey:@"interface_service_name"];
  [v3 setValue:self->_interfaceName forKey:@"interface_name"];
  [v3 setValue:self->_concurrentStreams forKey:@"number_of_streams"];
  [v3 setValue:self->_responsiveness forKey:@"responsiveness"];
  [v3 setValue:self->_responsivenessRating forKey:@"responsiveness_rating"];
  [v3 setValue:self->_responsivenessConfidence forKey:@"responsiveness_confidence"];
  error = self->_error;
  if (error)
  {
    v15 = [(NSError *)error localizedDescription];
    [v3 setValue:v15 forKey:@"error"];

    v16 = [(NSError *)self->_error domain];
    [v3 setValue:v16 forKey:@"error_domain"];

    v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSError code](self->_error, "code"));
    [v3 setValue:v17 forKey:@"error_code"];
  }
  v18 = [NSDictionary dictionaryWithDictionary:v3];

  return (NSDictionary *)v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NPTMetricResult fileSize](self, "fileSize"), @"fileSize");
  v5 = [(NPTMetricResult *)self fetchDate];
  [v4 encodeObject:v5 forKey:@"fetchDate"];

  v6 = [(NPTMetricResult *)self protocolName];
  [v4 encodeObject:v6 forKey:@"protocolName"];

  v7 = [(NPTMetricResult *)self isReusedConnection];
  [v4 encodeObject:v7 forKey:@"isReusedConnection"];

  v8 = [(NPTMetricResult *)self isProxyConnection];
  [v4 encodeObject:v8 forKey:@"isProxtConnection"];

  [(NPTMetricResult *)self domainLookupTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"domainLookupTime");
  [(NPTMetricResult *)self connectionTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"connectionTime");
  [(NPTMetricResult *)self secureConnectionTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"secureConnectionTime");
  [(NPTMetricResult *)self requestTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"requestTime");
  [(NPTMetricResult *)self requestToResponseTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"requestToResponseTime");
  [(NPTMetricResult *)self responseTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"responseTime");
  [(NPTMetricResult *)self speed];
  objc_msgSend(v4, "encodeDouble:forKey:", @"speed");
  v9 = [(NPTMetricResult *)self speedRating];
  [v4 encodeObject:v9 forKey:@"speedRating"];

  v10 = [(NPTMetricResult *)self speedConfidence];
  [v4 encodeObject:v10 forKey:@"speedConfidence"];

  v11 = [(NPTMetricResult *)self latency];
  [v4 encodeObject:v11 forKey:@"latency"];

  v12 = [(NPTMetricResult *)self nqTestEndPoint];
  [v4 encodeObject:v12 forKey:@"nqTestEndPoint"];

  [(NPTMetricResult *)self maxSpeedObserved];
  objc_msgSend(v4, "encodeDouble:forKey:", @"maxSpeedObserved");
  [(NPTMetricResult *)self stableSpeed];
  objc_msgSend(v4, "encodeDouble:forKey:", @"stableSpeed");
  v13 = [(NPTMetricResult *)self cdnpop];
  [v4 encodeObject:v13 forKey:@"cdnpop"];

  v14 = [(NPTMetricResult *)self cdnuuid];
  [v4 encodeObject:v14 forKey:@"cdnuuid"];

  v15 = [(NPTMetricResult *)self appleClientASN];
  [v4 encodeObject:v15 forKey:@"appleClientASN"];

  v16 = [(NPTMetricResult *)self appleClientASNCompany];
  [v4 encodeObject:v16 forKey:@"appleClientASNCompany"];

  v17 = [(NPTMetricResult *)self server];
  [v4 encodeObject:v17 forKey:@"server"];

  v18 = [(NPTMetricResult *)self isCellular];
  [v4 encodeObject:v18 forKey:@"isCellular"];

  v19 = [(NPTMetricResult *)self isConstrained];
  [v4 encodeObject:v19 forKey:@"isConstrained"];

  v20 = [(NPTMetricResult *)self isExpensive];
  [v4 encodeObject:v20 forKey:@"isExpensive"];

  v21 = [(NPTMetricResult *)self isMultipath];
  [v4 encodeObject:v21 forKey:@"isMultipath"];

  v22 = [(NPTMetricResult *)self localAddress];
  [v4 encodeObject:v22 forKey:@"localAddress"];

  v23 = [(NPTMetricResult *)self remoteAddress];
  [v4 encodeObject:v23 forKey:@"remoteAddress"];

  v24 = [(NPTMetricResult *)self localPort];
  [v4 encodeObject:v24 forKey:@"localPort"];

  v25 = [(NPTMetricResult *)self remotePort];
  [v4 encodeObject:v25 forKey:@"remotePort"];

  v26 = [(NPTMetricResult *)self negotiatedTLSCipherSuite];
  [v4 encodeObject:v26 forKey:@"negotiatedTLSCipherSuite"];

  v27 = [(NPTMetricResult *)self negotiatedTLSProtocolVersion];
  [v4 encodeObject:v27 forKey:@"negotiatedTLSProtocolVersion"];

  v28 = [(NPTMetricResult *)self interfaceServiceName];
  [v4 encodeObject:v28 forKey:@"interfaceServiceName"];

  v29 = [(NPTMetricResult *)self interfaceName];
  [v4 encodeObject:v29 forKey:@"interfaceName"];

  v30 = [(NPTMetricResult *)self concurrentStreams];
  [v4 encodeObject:v30 forKey:@"number_of_streams"];

  v31 = [(NPTMetricResult *)self error];
  [v4 encodeObject:v31 forKey:@"error"];

  v32 = [(NPTMetricResult *)self responsiveness];
  [v4 encodeObject:v32 forKey:@"responsiveness"];

  v33 = [(NPTMetricResult *)self responsivenessRating];
  [v4 encodeObject:v33 forKey:@"responsivenessRating"];

  id v34 = [(NPTMetricResult *)self responsivenessConfidence];
  [v4 encodeObject:v34 forKey:@"responsivenessConfidence"];
}

- (NPTMetricResult)initWithCoder:(id)a3
{
  v36.receiver = self;
  v36.super_class = (Class)NPTMetricResult;
  id v3 = a3;
  id v4 = [(NPTMetricResult *)&v36 init];
  -[NPTMetricResult setFileSize:](v4, "setFileSize:", (int)objc_msgSend(v3, "decodeIntegerForKey:", @"fileSize", v36.receiver, v36.super_class));
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"fetchDate"];
  [(NPTMetricResult *)v4 setFetchDate:v5];

  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"protocolName"];
  [(NPTMetricResult *)v4 setProtocolName:v6];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"isReusedConnection"];
  [(NPTMetricResult *)v4 setIsReusedConnection:v7];

  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"isProxyConnection"];
  [(NPTMetricResult *)v4 setIsProxyConnection:v8];

  [v3 decodeDoubleForKey:@"domainLookupTime"];
  -[NPTMetricResult setDomainLookupTime:](v4, "setDomainLookupTime:");
  [v3 decodeDoubleForKey:@"connectionTime"];
  -[NPTMetricResult setConnectionTime:](v4, "setConnectionTime:");
  [v3 decodeDoubleForKey:@"secureConnectionTime"];
  -[NPTMetricResult setSecureConnectionTime:](v4, "setSecureConnectionTime:");
  [v3 decodeDoubleForKey:@"requestTime"];
  -[NPTMetricResult setRequestTime:](v4, "setRequestTime:");
  [v3 decodeDoubleForKey:@"requestToResponseTime"];
  -[NPTMetricResult setRequestToResponseTime:](v4, "setRequestToResponseTime:");
  [v3 decodeDoubleForKey:@"responseTime"];
  -[NPTMetricResult setResponseTime:](v4, "setResponseTime:");
  [v3 decodeDoubleForKey:@"speed"];
  -[NPTMetricResult setSpeed:](v4, "setSpeed:");
  v9 = [v3 decodeObjectForKey:@"speedRating"];
  [(NPTMetricResult *)v4 setSpeedRating:v9];

  v10 = [v3 decodeObjectForKey:@"speedConfidence"];
  [(NPTMetricResult *)v4 setSpeedConfidence:v10];

  v11 = [v3 decodeObjectForKey:@"latency"];
  [(NPTMetricResult *)v4 setLatency:v11];

  v12 = [v3 decodeObjectForKey:@"nqTestEndPoint"];
  [(NPTMetricResult *)v4 setNqTestEndPoint:v12];

  [v3 decodeDoubleForKey:@"maxSpeedObserved"];
  -[NPTMetricResult setMaxSpeedObserved:](v4, "setMaxSpeedObserved:");
  [v3 decodeDoubleForKey:@"stableSpeed"];
  -[NPTMetricResult setStableSpeed:](v4, "setStableSpeed:");
  v13 = [v3 decodeObjectForKey:@"cdnpop"];
  [(NPTMetricResult *)v4 setCdnpop:v13];

  v14 = [v3 decodeObjectForKey:@"cdnuuid"];
  [(NPTMetricResult *)v4 setCdnuuid:v14];

  v15 = [v3 decodeObjectForKey:@"appleClientASN"];
  [(NPTMetricResult *)v4 setAppleClientASN:v15];

  v16 = [v3 decodeObjectForKey:@"appleClientASNCompany"];
  [(NPTMetricResult *)v4 setAppleClientASNCompany:v16];

  v17 = [v3 decodeObjectForKey:@"server"];
  [(NPTMetricResult *)v4 setServer:v17];

  v18 = [v3 decodeObjectForKey:@"isCellular"];
  [(NPTMetricResult *)v4 setIsCellular:v18];

  v19 = [v3 decodeObjectForKey:@"isConstrained"];
  [(NPTMetricResult *)v4 setIsConstrained:v19];

  v20 = [v3 decodeObjectForKey:@"isExpensive"];
  [(NPTMetricResult *)v4 setIsExpensive:v20];

  v21 = [v3 decodeObjectForKey:@"isMultipath"];
  [(NPTMetricResult *)v4 setIsMultipath:v21];

  v22 = [v3 decodeObjectForKey:@"localAddress"];
  [(NPTMetricResult *)v4 setLocalAddress:v22];

  v23 = [v3 decodeObjectForKey:@"remoteAddress"];
  [(NPTMetricResult *)v4 setRemoteAddress:v23];

  v24 = [v3 decodeObjectForKey:@"localPort"];
  [(NPTMetricResult *)v4 setLocalPort:v24];

  v25 = [v3 decodeObjectForKey:@"remotePort"];
  [(NPTMetricResult *)v4 setRemotePort:v25];

  v26 = [v3 decodeObjectForKey:@"negotiatedTLSCipherSuite"];
  [(NPTMetricResult *)v4 setNegotiatedTLSCipherSuite:v26];

  v27 = [v3 decodeObjectForKey:@"negotiatedTLSProtocolVersion"];
  [(NPTMetricResult *)v4 setNegotiatedTLSProtocolVersion:v27];

  v28 = [v3 decodeObjectForKey:@"interfaceServiceName"];
  [(NPTMetricResult *)v4 setInterfaceServiceName:v28];

  v29 = [v3 decodeObjectForKey:@"interfaceName"];
  [(NPTMetricResult *)v4 setInterfaceName:v29];

  v30 = [v3 decodeObjectForKey:@"number_of_streams"];
  [(NPTMetricResult *)v4 setConcurrentStreams:v30];

  v31 = [v3 decodeObjectForKey:@"error"];
  [(NPTMetricResult *)v4 setError:v31];

  v32 = [v3 decodeObjectForKey:@"responsiveness"];
  [(NPTMetricResult *)v4 setResponsiveness:v32];

  v33 = [v3 decodeObjectForKey:@"responsivenessRating"];
  [(NPTMetricResult *)v4 setResponsivenessRating:v33];

  id v34 = [v3 decodeObjectForKey:@"responsivenessConfidence"];

  [(NPTMetricResult *)v4 setResponsivenessConfidence:v34];
  return v4;
}

- (double)timeIntervalSinceDateWithLogging:(id)a3 startDate:(id)a4 nameToLog:(id)a5
{
  id v7 = a5;
  if (a3 && a4)
  {
    [a3 timeIntervalSinceDate:a4];
    double v9 = v8;
  }
  else
  {
    v10 = +[NPTLogger network];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[NPTMetricResult timeIntervalSinceDateWithLogging:startDate:nameToLog:]((uint64_t)v7, v10);
    }

    double v9 = 0.0;
  }

  return v9;
}

- (void)populateWithMetrics:(id)a3
{
  id v4 = [a3 transactionMetrics];
  id v35 = [v4 firstObject];

  id v5 = objc_alloc_init(MEMORY[0x263F08790]);
  [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSxxx"];
  v6 = [v35 fetchStartDate];
  id v7 = [v5 stringFromDate:v6];
  [(NPTMetricResult *)self setFetchDate:v7];

  double v8 = [v35 domainLookupEndDate];
  double v9 = [v35 domainLookupStartDate];
  [(NPTMetricResult *)self timeIntervalSinceDateWithLogging:v8 startDate:v9 nameToLog:@"domainLookupTime"];
  -[NPTMetricResult setDomainLookupTime:](self, "setDomainLookupTime:");

  v10 = [v35 connectEndDate];
  v11 = [v35 connectStartDate];
  [(NPTMetricResult *)self timeIntervalSinceDateWithLogging:v10 startDate:v11 nameToLog:@"connectionTime"];
  -[NPTMetricResult setConnectionTime:](self, "setConnectionTime:");

  v12 = [v35 secureConnectionEndDate];
  v13 = [v35 secureConnectionStartDate];
  [(NPTMetricResult *)self timeIntervalSinceDateWithLogging:v12 startDate:v13 nameToLog:@"secureConnectionTime"];
  -[NPTMetricResult setSecureConnectionTime:](self, "setSecureConnectionTime:");

  v14 = [v35 requestEndDate];
  v15 = [v35 requestStartDate];
  [(NPTMetricResult *)self timeIntervalSinceDateWithLogging:v14 startDate:v15 nameToLog:@"requestTime"];
  -[NPTMetricResult setRequestTime:](self, "setRequestTime:");

  v16 = [v35 responseStartDate];
  v17 = [v35 requestEndDate];
  [(NPTMetricResult *)self timeIntervalSinceDateWithLogging:v16 startDate:v17 nameToLog:@"requestToResponseTime"];
  -[NPTMetricResult setRequestToResponseTime:](self, "setRequestToResponseTime:");

  v18 = [v35 responseEndDate];
  v19 = [v35 responseStartDate];
  [(NPTMetricResult *)self timeIntervalSinceDateWithLogging:v18 startDate:v19 nameToLog:@"responseTime"];
  -[NPTMetricResult setResponseTime:](self, "setResponseTime:");

  if ([v35 isProxyConnection]) {
    v20 = @"true";
  }
  else {
    v20 = @"false";
  }
  [(NPTMetricResult *)self setIsProxyConnection:v20];
  if ([v35 isReusedConnection]) {
    v21 = @"true";
  }
  else {
    v21 = @"false";
  }
  [(NPTMetricResult *)self setIsReusedConnection:v21];
  v22 = [v35 networkProtocolName];
  [(NPTMetricResult *)self setProtocolName:v22];

  if ([v35 isCellular]) {
    v23 = @"true";
  }
  else {
    v23 = @"false";
  }
  [(NPTMetricResult *)self setIsCellular:v23];
  if ([v35 isConstrained]) {
    v24 = @"true";
  }
  else {
    v24 = @"false";
  }
  [(NPTMetricResult *)self setIsConstrained:v24];
  if ([v35 isExpensive]) {
    v25 = @"true";
  }
  else {
    v25 = @"false";
  }
  [(NPTMetricResult *)self setIsExpensive:v25];
  if ([v35 isMultipath]) {
    v26 = @"true";
  }
  else {
    v26 = @"false";
  }
  [(NPTMetricResult *)self setIsMultipath:v26];
  v27 = [v35 localAddress];
  [(NPTMetricResult *)self setLocalAddress:v27];

  v28 = [v35 remoteAddress];
  [(NPTMetricResult *)self setRemoteAddress:v28];

  v29 = [v35 localPort];
  [(NPTMetricResult *)self setLocalPort:v29];

  v30 = [v35 remotePort];
  [(NPTMetricResult *)self setRemotePort:v30];

  v31 = [v35 negotiatedTLSCipherSuite];
  [(NPTMetricResult *)self setNegotiatedTLSCipherSuite:v31];

  v32 = [v35 negotiatedTLSProtocolVersion];
  [(NPTMetricResult *)self setNegotiatedTLSProtocolVersion:v32];

  v33 = [v35 interfaceServiceName];
  [(NPTMetricResult *)self setInterfaceServiceName:v33];

  id v34 = [v35 interfaceName];
  [(NPTMetricResult *)self setInterfaceName:v34];
}

- (void)populateWithURLResponse:(id)a3
{
  id v15 = [a3 allHeaderFields];
  id v4 = [v15 objectForKey:@"cdnuuid"];
  [(NPTMetricResult *)self setCdnuuid:v4];

  id v5 = [v15 objectForKey:@"Server"];
  [(NPTMetricResult *)self setServer:v5];

  v6 = [v15 objectForKey:@"Apple-Client-ASN"];
  id v7 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v7 setNumberStyle:0];
  double v8 = [v7 numberFromString:v6];
  [(NPTMetricResult *)self setAppleClientASN:v8];

  double v9 = [v15 objectForKey:@"Apple-Client-ASN-Company"];
  [(NPTMetricResult *)self setAppleClientASNCompany:v9];

  v10 = [v15 objectForKey:@"Via"];
  v11 = [v10 componentsSeparatedByString:@" "];
  if ((unint64_t)[v11 count] >= 2)
  {
    v12 = v11;
    uint64_t v13 = 1;
LABEL_5:
    v14 = [v12 objectAtIndexedSubscript:v13];
    [(NPTMetricResult *)self setCdnpop:v14];

    goto LABEL_7;
  }
  if ([v11 count] == 1)
  {
    v12 = v11;
    uint64_t v13 = 0;
    goto LABEL_5;
  }
  [(NPTMetricResult *)self setCdnpop:@"Unknown"];
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NPTMetricResult allocWithZone:a3] init];
  id v5 = [(NPTMetricResult *)self cdnpop];
  [(NPTMetricResult *)v4 setCdnpop:v5];

  v6 = [(NPTMetricResult *)self server];
  [(NPTMetricResult *)v4 setServer:v6];

  id v7 = [(NPTMetricResult *)self cdnuuid];
  [(NPTMetricResult *)v4 setCdnuuid:v7];

  double v8 = [(NPTMetricResult *)self appleClientASN];
  [(NPTMetricResult *)v4 setAppleClientASN:v8];

  double v9 = [(NPTMetricResult *)self appleClientASNCompany];
  [(NPTMetricResult *)v4 setAppleClientASNCompany:v9];

  [(NPTMetricResult *)v4 setFileSize:[(NPTMetricResult *)self fileSize]];
  v10 = [(NPTMetricResult *)self fetchDate];
  [(NPTMetricResult *)v4 setFetchDate:v10];

  v11 = [(NPTMetricResult *)self protocolName];
  [(NPTMetricResult *)v4 setProtocolName:v11];

  v12 = [(NPTMetricResult *)self isReusedConnection];
  [(NPTMetricResult *)v4 setIsReusedConnection:v12];

  uint64_t v13 = [(NPTMetricResult *)self isProxyConnection];
  [(NPTMetricResult *)v4 setIsProxyConnection:v13];

  [(NPTMetricResult *)self domainLookupTime];
  -[NPTMetricResult setDomainLookupTime:](v4, "setDomainLookupTime:");
  [(NPTMetricResult *)self connectionTime];
  -[NPTMetricResult setConnectionTime:](v4, "setConnectionTime:");
  [(NPTMetricResult *)self secureConnectionTime];
  -[NPTMetricResult setSecureConnectionTime:](v4, "setSecureConnectionTime:");
  [(NPTMetricResult *)self requestTime];
  -[NPTMetricResult setRequestTime:](v4, "setRequestTime:");
  [(NPTMetricResult *)self requestToResponseTime];
  -[NPTMetricResult setRequestToResponseTime:](v4, "setRequestToResponseTime:");
  [(NPTMetricResult *)self responseTime];
  -[NPTMetricResult setResponseTime:](v4, "setResponseTime:");
  [(NPTMetricResult *)self speed];
  -[NPTMetricResult setSpeed:](v4, "setSpeed:");
  v14 = [(NPTMetricResult *)self speedRating];
  [(NPTMetricResult *)v4 setSpeedRating:v14];

  id v15 = [(NPTMetricResult *)self speedConfidence];
  [(NPTMetricResult *)v4 setSpeedConfidence:v15];

  v16 = [(NPTMetricResult *)self latency];
  [(NPTMetricResult *)v4 setLatency:v16];

  v17 = [(NPTMetricResult *)self nqTestEndPoint];
  [(NPTMetricResult *)v4 setNqTestEndPoint:v17];

  [(NPTMetricResult *)self stableSpeed];
  -[NPTMetricResult setStableSpeed:](v4, "setStableSpeed:");
  v18 = [(NPTMetricResult *)self isCellular];
  [(NPTMetricResult *)v4 setIsCellular:v18];

  v19 = [(NPTMetricResult *)self isExpensive];
  [(NPTMetricResult *)v4 setIsExpensive:v19];

  v20 = [(NPTMetricResult *)self isConstrained];
  [(NPTMetricResult *)v4 setIsConstrained:v20];

  v21 = [(NPTMetricResult *)self isMultipath];
  [(NPTMetricResult *)v4 setIsMultipath:v21];

  v22 = [(NPTMetricResult *)self localAddress];
  [(NPTMetricResult *)v4 setLocalAddress:v22];

  v23 = [(NPTMetricResult *)self remoteAddress];
  [(NPTMetricResult *)v4 setRemoteAddress:v23];

  v24 = [(NPTMetricResult *)self negotiatedTLSCipherSuite];
  [(NPTMetricResult *)v4 setNegotiatedTLSCipherSuite:v24];

  v25 = [(NPTMetricResult *)self negotiatedTLSProtocolVersion];
  [(NPTMetricResult *)v4 setNegotiatedTLSProtocolVersion:v25];

  v26 = [(NPTMetricResult *)self localPort];
  [(NPTMetricResult *)v4 setLocalPort:v26];

  v27 = [(NPTMetricResult *)self remotePort];
  [(NPTMetricResult *)v4 setRemotePort:v27];

  v28 = [(NPTMetricResult *)self interfaceServiceName];
  [(NPTMetricResult *)v4 setInterfaceServiceName:v28];

  v29 = [(NPTMetricResult *)self interfaceName];
  [(NPTMetricResult *)v4 setInterfaceName:v29];

  v30 = [(NPTMetricResult *)self concurrentStreams];
  [(NPTMetricResult *)v4 setConcurrentStreams:v30];

  v31 = [(NPTMetricResult *)self error];
  [(NPTMetricResult *)v4 setError:v31];

  v32 = [(NPTMetricResult *)self responsiveness];
  [(NPTMetricResult *)v4 setResponsiveness:v32];

  v33 = [(NPTMetricResult *)self responsivenessRating];
  [(NPTMetricResult *)v4 setResponsivenessRating:v33];

  id v34 = [(NPTMetricResult *)self responsivenessConfidence];
  [(NPTMetricResult *)v4 setResponsivenessConfidence:v34];

  return v4;
}

- (unint64_t)hash
{
  id v3 = [(NPTMetricResult *)self fetchDate];
  uint64_t v4 = [v3 hash];
  id v5 = [(NPTMetricResult *)self cdnuuid];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(NPTMetricResult *)self cdnpop];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqualToMetricResult:(id)a3
{
  id v4 = a3;
  id v5 = [(NPTMetricResult *)self fetchDate];
  uint64_t v6 = [v4 fetchDate];
  if (![v5 isEqualToString:v6]) {
    goto LABEL_8;
  }
  [(NPTMetricResult *)self requestToResponseTime];
  double v8 = v7;
  [v4 requestToResponseTime];
  if (v8 != v9) {
    goto LABEL_8;
  }
  [(NPTMetricResult *)self requestTime];
  double v11 = v10;
  [v4 requestTime];
  if (v11 == v12
    && ([(NPTMetricResult *)self domainLookupTime],
        double v14 = v13,
        [v4 domainLookupTime],
        v14 == v15))
  {
    v16 = [(NPTMetricResult *)self cdnuuid];
    v17 = [v4 cdnuuid];
    if ([v16 isEqualToString:v17])
    {
      v18 = [(NPTMetricResult *)self cdnpop];
      v19 = [v4 cdnpop];
      if ([v18 isEqualToString:v19])
      {
        [(NPTMetricResult *)self responseTime];
        double v21 = v20;
        [v4 responseTime];
        BOOL v23 = v21 == v22;
      }
      else
      {
        BOOL v23 = 0;
      }
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  else
  {
LABEL_8:
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NPTMetricResult *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(NPTMetricResult *)self isEqualToMetricResult:v5];

  return v6;
}

- (NSString)cdnpop
{
  return self->_cdnpop;
}

- (void)setCdnpop:(id)a3
{
}

- (NSString)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (NSString)cdnuuid
{
  return self->_cdnuuid;
}

- (void)setCdnuuid:(id)a3
{
}

- (NSString)appleClientASNCompany
{
  return self->_appleClientASNCompany;
}

- (void)setAppleClientASNCompany:(id)a3
{
}

- (NSNumber)appleClientASN
{
  return self->_appleClientASN;
}

- (void)setAppleClientASN:(id)a3
{
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSString)fetchDate
{
  return self->_fetchDate;
}

- (void)setFetchDate:(id)a3
{
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (void)setProtocolName:(id)a3
{
}

- (NSString)isReusedConnection
{
  return self->_isReusedConnection;
}

- (void)setIsReusedConnection:(id)a3
{
}

- (NSString)isProxyConnection
{
  return self->_isProxyConnection;
}

- (void)setIsProxyConnection:(id)a3
{
}

- (double)domainLookupTime
{
  return self->_domainLookupTime;
}

- (void)setDomainLookupTime:(double)a3
{
  self->_domainLookupTime = a3;
}

- (double)connectionTime
{
  return self->_connectionTime;
}

- (void)setConnectionTime:(double)a3
{
  self->_connectionTime = a3;
}

- (double)secureConnectionTime
{
  return self->_secureConnectionTime;
}

- (void)setSecureConnectionTime:(double)a3
{
  self->_secureConnectionTime = a3;
}

- (double)requestTime
{
  return self->_requestTime;
}

- (void)setRequestTime:(double)a3
{
  self->_requestTime = a3;
}

- (double)requestToResponseTime
{
  return self->_requestToResponseTime;
}

- (void)setRequestToResponseTime:(double)a3
{
  self->_requestToResponseTime = a3;
}

- (double)responseTime
{
  return self->_responseTime;
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (double)maxSpeedObserved
{
  return self->_maxSpeedObserved;
}

- (void)setMaxSpeedObserved:(double)a3
{
  self->_maxSpeedObserved = a3;
}

- (double)stableSpeed
{
  return self->_stableSpeed;
}

- (void)setStableSpeed:(double)a3
{
  self->_stableSpeed = a3;
}

- (NSNumber)speedRating
{
  return self->_speedRating;
}

- (void)setSpeedRating:(id)a3
{
}

- (NSNumber)speedConfidence
{
  return self->_speedConfidence;
}

- (void)setSpeedConfidence:(id)a3
{
}

- (NSNumber)responsiveness
{
  return self->_responsiveness;
}

- (void)setResponsiveness:(id)a3
{
}

- (NSNumber)responsivenessRating
{
  return self->_responsivenessRating;
}

- (void)setResponsivenessRating:(id)a3
{
}

- (NSNumber)responsivenessConfidence
{
  return self->_responsivenessConfidence;
}

- (void)setResponsivenessConfidence:(id)a3
{
}

- (NSNumber)latency
{
  return self->_latency;
}

- (void)setLatency:(id)a3
{
}

- (NSString)nqTestEndPoint
{
  return self->_nqTestEndPoint;
}

- (void)setNqTestEndPoint:(id)a3
{
}

- (NSString)isCellular
{
  return self->_isCellular;
}

- (void)setIsCellular:(id)a3
{
}

- (NSString)isExpensive
{
  return self->_isExpensive;
}

- (void)setIsExpensive:(id)a3
{
}

- (NSString)isConstrained
{
  return self->_isConstrained;
}

- (void)setIsConstrained:(id)a3
{
}

- (NSString)isMultipath
{
  return self->_isMultipath;
}

- (void)setIsMultipath:(id)a3
{
}

- (NSString)localAddress
{
  return self->_localAddress;
}

- (void)setLocalAddress:(id)a3
{
}

- (NSString)remoteAddress
{
  return self->_remoteAddress;
}

- (void)setRemoteAddress:(id)a3
{
}

- (NSNumber)negotiatedTLSCipherSuite
{
  return self->_negotiatedTLSCipherSuite;
}

- (void)setNegotiatedTLSCipherSuite:(id)a3
{
}

- (NSNumber)negotiatedTLSProtocolVersion
{
  return self->_negotiatedTLSProtocolVersion;
}

- (void)setNegotiatedTLSProtocolVersion:(id)a3
{
}

- (NSNumber)localPort
{
  return self->_localPort;
}

- (void)setLocalPort:(id)a3
{
}

- (NSNumber)remotePort
{
  return self->_remotePort;
}

- (void)setRemotePort:(id)a3
{
}

- (NSString)interfaceServiceName
{
  return self->_interfaceServiceName;
}

- (void)setInterfaceServiceName:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSNumber)concurrentStreams
{
  return self->_concurrentStreams;
}

- (void)setConcurrentStreams:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_concurrentStreams, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_interfaceServiceName, 0);
  objc_storeStrong((id *)&self->_remotePort, 0);
  objc_storeStrong((id *)&self->_localPort, 0);
  objc_storeStrong((id *)&self->_negotiatedTLSProtocolVersion, 0);
  objc_storeStrong((id *)&self->_negotiatedTLSCipherSuite, 0);
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
  objc_storeStrong((id *)&self->_isMultipath, 0);
  objc_storeStrong((id *)&self->_isConstrained, 0);
  objc_storeStrong((id *)&self->_isExpensive, 0);
  objc_storeStrong((id *)&self->_isCellular, 0);
  objc_storeStrong((id *)&self->_nqTestEndPoint, 0);
  objc_storeStrong((id *)&self->_latency, 0);
  objc_storeStrong((id *)&self->_responsivenessConfidence, 0);
  objc_storeStrong((id *)&self->_responsivenessRating, 0);
  objc_storeStrong((id *)&self->_responsiveness, 0);
  objc_storeStrong((id *)&self->_speedConfidence, 0);
  objc_storeStrong((id *)&self->_speedRating, 0);
  objc_storeStrong((id *)&self->_isProxyConnection, 0);
  objc_storeStrong((id *)&self->_isReusedConnection, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_appleClientASN, 0);
  objc_storeStrong((id *)&self->_appleClientASNCompany, 0);
  objc_storeStrong((id *)&self->_cdnuuid, 0);
  objc_storeStrong((id *)&self->_server, 0);

  objc_storeStrong((id *)&self->_cdnpop, 0);
}

- (void)timeIntervalSinceDateWithLogging:(uint64_t)a1 startDate:(NSObject *)a2 nameToLog:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_219415000, a2, OS_LOG_TYPE_DEBUG, "%@ is NaN", (uint8_t *)&v2, 0xCu);
}

@end