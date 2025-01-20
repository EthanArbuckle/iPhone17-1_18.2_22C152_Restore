@interface APServerErrorRequester
- (APServerErrorRequester)initWithMetric:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6 error:(id)a7;
- (BOOL)isAllowedEmptyResponse;
- (Class)responseClass;
- (NSString)errorDetails;
- (id)protoBuffer;
- (int)legacyServerErrorCode;
- (void)setErrorDetails:(id)a3;
- (void)setLegacyServerErrorCode:(int)a3;
@end

@implementation APServerErrorRequester

- (APServerErrorRequester)initWithMetric:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6 error:(id)a7
{
  id v12 = a7;
  v21.receiver = self;
  v21.super_class = (Class)APServerErrorRequester;
  v13 = [(APLegacyMetricRequester *)&v21 initWithMetric:a3 internalContent:a4 andContext:a5 clientInfo:0 idAccount:a6];
  if (v13)
  {
    v14 = [v12 domain];
    unsigned int v15 = [v14 isEqualToString:@"com.apple.ap.AdValidationErrorDomain"];

    if (!v15)
    {
      v19 = 0;
      goto LABEL_9;
    }
    if ([v12 code] == (id)4512) {
      int v16 = 3;
    }
    else {
      int v16 = 10;
    }
    v13->_legacyServerErrorCode = v16;
    uint64_t v17 = [v12 localizedDescription];
    errorDetails = v13->_errorDetails;
    v13->_errorDetails = (NSString *)v17;
  }
  v19 = v13;
LABEL_9:

  return v19;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAllowedEmptyResponse
{
  return 1;
}

- (id)protoBuffer
{
  v3 = objc_alloc_init(APPBServerErrorRequest);
  v4 = [(APLegacyMetricRequester *)self logMetadata];
  [(APPBServerErrorRequest *)v3 setMetaData:v4];

  [(APPBServerErrorRequest *)v3 setErrorCode:[(APServerErrorRequester *)self legacyServerErrorCode]];
  v5 = [(APServerErrorRequester *)self errorDetails];
  [(APPBServerErrorRequest *)v3 setErrorDetails:v5];

  return v3;
}

- (int)legacyServerErrorCode
{
  return self->_legacyServerErrorCode;
}

- (void)setLegacyServerErrorCode:(int)a3
{
  self->_legacyServerErrorCode = a3;
}

- (NSString)errorDetails
{
  return self->_errorDetails;
}

- (void)setErrorDetails:(id)a3
{
}

- (void).cxx_destruct
{
}

@end