@interface ICDRequest
+ (id)request;
- (BOOL)acceptsGzipEncoding;
- (BOOL)includeCloudLibraryDAAPDebugFeature;
- (BOOL)isConcurrent;
- (BOOL)requestGroupEntityPayloadForTrackSourceMatch;
- (ICDRequest)initWithAction:(id)a3;
- (NSData)bodyData;
- (NSString)action;
- (NSString)requestingBundleID;
- (NSString)sagaClientFeaturesVersion;
- (NSURL)responseDataDestinationFileURL;
- (double)timeoutInterval;
- (id)URLRequestForBaseURL:(id)a3 sessionID:(unsigned int)a4;
- (id)_HTTPMethodStringForICDRequestMethod:(int64_t)a3;
- (id)canonicalResponseForResponse:(id)a3;
- (id)description;
- (id)requestURLForBaseURL:(id)a3 sessionID:(unsigned int)a4;
- (int64_t)allowedRetryCount;
- (int64_t)method;
- (int64_t)reason;
- (int64_t)requestPersonalizationStyle;
- (int64_t)verificationInteractionLevel;
- (void)setAllowedRetryCount:(int64_t)a3;
- (void)setBodyData:(id)a3;
- (void)setIncludeCloudLibraryDAAPDebugFeature:(BOOL)a3;
- (void)setMethod:(int64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setRequestGroupEntityPayloadForTrackSourceMatch:(BOOL)a3;
- (void)setRequestPersonalizationStyle:(int64_t)a3;
- (void)setRequestingBundleID:(id)a3;
- (void)setResponseDataDestinationFileURL:(id)a3;
- (void)setSagaClientFeaturesVersion:(id)a3;
- (void)setValue:(id)a3 forArgument:(id)a4;
- (void)setVerificationInteractionLevel:(int64_t)a3;
@end

@implementation ICDRequest

- (void)setValue:(id)a3 forArgument:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  arguments = self->_arguments;
  if (!arguments)
  {
    v8 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9 = self->_arguments;
    self->_arguments = v8;

    arguments = self->_arguments;
  }
  [(NSDictionary *)arguments setObject:v10 forKey:v6];
}

- (ICDRequest)initWithAction:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDRequest;
  v5 = [(ICDRequest *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v6;

    *((void *)v5 + 11) = 1;
    *((void *)v5 + 6) = 1;
    *(_WORD *)(v5 + 17) = 0;
  }

  return (ICDRequest *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sagaClientFeaturesVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleID, 0);
  objc_storeStrong((id *)&self->_responseDataDestinationFileURL, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_arguments, 0);
}

- (id)requestURLForBaseURL:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(NSString *)self->_action mutableCopy];
  if (v4)
  {
    arguments = self->_arguments;
    objc_super v9 = +[NSNumber numberWithUnsignedInt:v4];
    [(NSDictionary *)arguments setValue:v9 forKey:@"session-id"];
  }
  if ([(NSDictionary *)self->_arguments count])
  {
    id v10 = +[NSMutableArray array];
    v11 = self->_arguments;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100010D48;
    v17[3] = &unk_1001BEAC0;
    id v12 = v10;
    id v18 = v12;
    [(NSDictionary *)v11 enumerateKeysAndObjectsUsingBlock:v17];
    v13 = [v12 componentsJoinedByString:@"&"];
    if (self->_requestGroupEntityPayloadForTrackSourceMatch) {
      CFStringRef v14 = @"&";
    }
    else {
      CFStringRef v14 = @"?";
    }
    [v7 appendString:v14];
    [v7 appendString:v13];
  }
  v15 = +[NSURL URLWithString:v7 relativeToURL:v6];

  return v15;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (int64_t)verificationInteractionLevel
{
  return self->_verificationInteractionLevel;
}

- (void)setRequestPersonalizationStyle:(int64_t)a3
{
  self->_requestPersonalizationStyle = a3;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (void)setMethod:(int64_t)a3
{
  self->_method = a3;
}

- (void)setBodyData:(id)a3
{
}

- (NSURL)responseDataDestinationFileURL
{
  return self->_responseDataDestinationFileURL;
}

- (NSString)requestingBundleID
{
  return self->_requestingBundleID;
}

- (int64_t)requestPersonalizationStyle
{
  return self->_requestPersonalizationStyle;
}

- (int64_t)reason
{
  return self->_reason;
}

- (int64_t)method
{
  return self->_method;
}

- (BOOL)includeCloudLibraryDAAPDebugFeature
{
  return self->_includeCloudLibraryDAAPDebugFeature;
}

- (NSString)action
{
  return self->_action;
}

- (void)setSagaClientFeaturesVersion:(id)a3
{
}

- (NSString)sagaClientFeaturesVersion
{
  return self->_sagaClientFeaturesVersion;
}

- (void)setIncludeCloudLibraryDAAPDebugFeature:(BOOL)a3
{
  self->_includeCloudLibraryDAAPDebugFeature = a3;
}

- (void)setRequestGroupEntityPayloadForTrackSourceMatch:(BOOL)a3
{
  self->_requestGroupEntityPayloadForTrackSourceMatch = a3;
}

- (BOOL)requestGroupEntityPayloadForTrackSourceMatch
{
  return self->_requestGroupEntityPayloadForTrackSourceMatch;
}

- (void)setRequestingBundleID:(id)a3
{
}

- (void)setAllowedRetryCount:(int64_t)a3
{
  self->_allowedRetryCount = a3;
}

- (int64_t)allowedRetryCount
{
  return self->_allowedRetryCount;
}

- (void)setResponseDataDestinationFileURL:(id)a3
{
}

- (void)setVerificationInteractionLevel:(int64_t)a3
{
  self->_verificationInteractionLevel = a3;
}

- (BOOL)isConcurrent
{
  return self->_concurrent;
}

- (id)_HTTPMethodStringForICDRequestMethod:(int64_t)a3
{
  if (a3 == 1) {
    return @"POST";
  }
  else {
    return @"GET";
  }
}

- (BOOL)acceptsGzipEncoding
{
  return 1;
}

- (id)canonicalResponseForResponse:(id)a3
{
  return a3;
}

- (id)URLRequestForBaseURL:(id)a3 sessionID:(unsigned int)a4
{
  v5 = [(ICDRequest *)self requestURLForBaseURL:a3 sessionID:*(void *)&a4];
  [(ICDRequest *)self timeoutInterval];
  id v6 = +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v5, 0);
  id v7 = [(ICDRequest *)self _HTTPMethodStringForICDRequestMethod:self->_method];
  [v6 setHTTPMethod:v7];

  if ([(ICDRequest *)self acceptsGzipEncoding]) {
    [v6 setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
  }
  if ([(NSData *)self->_bodyData length]) {
    [v6 setHTTPBody:self->_bodyData];
  }
  v8 = +[NSString stringWithFormat:@"%d.%d", 3, 16];
  [v6 setValue:v8 forHTTPHeaderField:@"Client-iTunes-Sharing-Version"];

  return v6;
}

- (double)timeoutInterval
{
  return 60.0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ICDRequest;
  v3 = [(ICDRequest *)&v7 description];
  uint64_t v4 = [(ICDRequest *)self _HTTPMethodStringForICDRequestMethod:self->_method];
  v5 = [v3 stringByAppendingFormat:@" %@ [%@]", v4, self->_action];

  return v5;
}

+ (id)request
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    +[NSException raise:NSInvalidArgumentException format:@"subclass must implement"];
  }
  id v3 = objc_alloc_init((Class)objc_opt_class());

  return v3;
}

@end