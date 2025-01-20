@interface SBKRequest
+ (id)_contentEncodingTypeStringForBodyContentEncodingType:(int64_t)a3;
+ (id)_contentTypeStringForBodyContentType:(int64_t)a3;
+ (id)_methodStringForMethod:(int64_t)a3;
+ (id)requestWithRequestURL:(id)a3;
+ (int64_t)bodyContentEncodingType;
+ (int64_t)bodyContentType;
- (BOOL)acceptsGzipEncoding;
- (BOOL)includeDeviceGUID;
- (BOOL)isConcurrent;
- (BOOL)shouldAuthenticate;
- (ISDataProvider)responseDataProvider;
- (NSData)bodyData;
- (SBKRequest)initWithRequestURL:(id)a3;
- (SBKTransaction)transaction;
- (double)timeoutInterval;
- (id)_defaultHeaderFields;
- (id)canonicalResponseForResponse:(id)a3;
- (id)copyRequestProperties;
- (id)description;
- (id)descriptionWithoutHeaderFields;
- (id)newURLOperation;
- (id)newURLOperationWithDelegate:(id)a3;
- (int64_t)method;
- (void)setBodyData:(id)a3;
- (void)setBodyDataWithPropertyList:(id)a3;
- (void)setIncludeDeviceGUID:(BOOL)a3;
- (void)setMethod:(int64_t)a3;
- (void)setResponseDataProvider:(id)a3;
- (void)setShouldAuthenticate:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setValue:(id)a3 forArgument:(id)a4;
- (void)setValue:(id)a3 forHeaderField:(id)a4;
@end

@implementation SBKRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_responseDataProvider, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
}

- (void)setResponseDataProvider:(id)a3
{
}

- (ISDataProvider)responseDataProvider
{
  return self->_responseDataProvider;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void)setIncludeDeviceGUID:(BOOL)a3
{
  self->_includeDeviceGUID = a3;
}

- (BOOL)includeDeviceGUID
{
  return self->_includeDeviceGUID;
}

- (void)setShouldAuthenticate:(BOOL)a3
{
  self->_shouldAuthenticate = a3;
}

- (BOOL)shouldAuthenticate
{
  return self->_shouldAuthenticate;
}

- (void)setMethod:(int64_t)a3
{
  self->_method = a3;
}

- (int64_t)method
{
  return self->_method;
}

- (BOOL)isConcurrent
{
  return self->_concurrent;
}

- (void)setTransaction:(id)a3
{
}

- (SBKTransaction)transaction
{
  return self->_transaction;
}

- (id)newURLOperationWithDelegate:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newURLOperation
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_defaultHeaderFields
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(SBKRequest *)self acceptsGzipEncoding]) {
    [v3 setObject:@"gzip" forKey:@"Accept-Encoding"];
  }
  v4 = objc_opt_class();
  v5 = objc_msgSend(v4, "_contentEncodingTypeStringForBodyContentEncodingType:", objc_msgSend((id)objc_opt_class(), "bodyContentEncodingType"));
  if (v5) {
    [v3 setObject:v5 forKey:@"Content-Encoding"];
  }
  v6 = objc_opt_class();
  v7 = objc_msgSend(v6, "_contentTypeStringForBodyContentType:", objc_msgSend((id)objc_opt_class(), "bodyContentType"));
  if (v7) {
    [v3 setObject:v7 forKey:@"Content-Type"];
  }

  return v3;
}

- (BOOL)acceptsGzipEncoding
{
  return 1;
}

- (id)canonicalResponseForResponse:(id)a3
{
  return a3;
}

- (id)copyRequestProperties
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:self->_requestURL];
  v4 = [(id)objc_opt_class() _methodStringForMethod:self->_method];
  [v3 setHTTPMethod:v4];

  headers = self->_headers;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __35__SBKRequest_copyRequestProperties__block_invoke;
  v19[3] = &unk_2648AFA10;
  id v6 = v3;
  id v20 = v6;
  [(NSDictionary *)headers enumerateKeysAndObjectsUsingBlock:v19];
  arguments = self->_arguments;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __35__SBKRequest_copyRequestProperties__block_invoke_2;
  v17 = &unk_2648AFA10;
  id v8 = v6;
  id v18 = v8;
  [(NSDictionary *)arguments enumerateKeysAndObjectsUsingBlock:&v14];
  if ([(SBKRequest *)self includeDeviceGUID])
  {
    v9 = [MEMORY[0x263F89480] sharedInstance];
    v10 = [v9 guid];
    [v8 setValue:v10 forRequestParameter:@"guid"];
  }
  [v8 setHTTPBody:self->_bodyData];
  [(SBKRequest *)self timeoutInterval];
  objc_msgSend(v8, "setTimeoutInterval:");
  v11 = v18;
  id v12 = v8;

  return v12;
}

uint64_t __35__SBKRequest_copyRequestProperties__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

uint64_t __35__SBKRequest_copyRequestProperties__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forRequestParameter:a2];
}

- (void)setBodyDataWithPropertyList:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(id)objc_opt_class() bodyContentType];
  if (v6 == 2)
  {
    v7 = (void *)MEMORY[0x263F08AC0];
    uint64_t v17 = 0;
    id v8 = (id *)&v17;
    v9 = &v17;
    id v10 = v5;
    uint64_t v11 = 100;
  }
  else
  {
    if (v6 != 3)
    {
      v16 = [MEMORY[0x263F08690] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"SBKRequest.m" lineNumber:119 description:@"Invalid bodyContentType requested for propertyList"];

      id v12 = 0;
      goto LABEL_10;
    }
    v7 = (void *)MEMORY[0x263F08AC0];
    uint64_t v18 = 0;
    id v8 = (id *)&v18;
    v9 = &v18;
    id v10 = v5;
    uint64_t v11 = 200;
  }
  id v12 = objc_msgSend(v7, "dataWithPropertyList:format:options:error:", v10, v11, 0, v9, v17, v18);
  id v13 = *v8;
  if (!v13)
  {
LABEL_10:
    [(SBKRequest *)self setBodyData:v12];
    goto LABEL_11;
  }
  uint64_t v14 = v13;
  uint64_t v15 = os_log_create("com.apple.amp.StoreBookkeeper", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v14;
    _os_log_impl(&dword_22B807000, v15, OS_LOG_TYPE_DEFAULT, "ERROR: failed to serialize property list with error = %@", buf, 0xCu);
  }

LABEL_11:
}

- (void)setBodyData:(id)a3
{
  v4 = (NSData *)a3;
  if ([(id)objc_opt_class() bodyContentEncodingType] == 1)
  {
    uint64_t v5 = [(NSData *)v4 SBKDataByDeflatingWithGZip];

    v4 = (NSData *)v5;
  }
  bodyData = self->_bodyData;
  self->_bodyData = v4;
}

- (void)setValue:(id)a3 forArgument:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  arguments = self->_arguments;
  if (!arguments)
  {
    id v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v9 = self->_arguments;
    self->_arguments = v8;

    arguments = self->_arguments;
  }
  [(NSDictionary *)arguments setObject:v10 forKey:v6];
}

- (void)setValue:(id)a3 forHeaderField:(id)a4
{
}

- (id)descriptionWithoutHeaderFields
{
  v7.receiver = self;
  v7.super_class = (Class)SBKRequest;
  v3 = [(SBKRequest *)&v7 description];
  v4 = [(id)objc_opt_class() _methodStringForMethod:self->_method];
  uint64_t v5 = [v3 stringByAppendingFormat:@" %@ [%@]", v4, self->_action];

  return v5;
}

- (double)timeoutInterval
{
  return 60.0;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SBKRequest;
  v3 = [(SBKRequest *)&v8 description];
  requestURL = self->_requestURL;
  uint64_t v5 = [(id)objc_opt_class() _methodStringForMethod:self->_method];
  id v6 = [v3 stringByAppendingFormat:@" %@ [%@] URL = %@, shouldAuthenticate = %d, arguments = %@, headers = %@, bodyData = %@ ", requestURL, v5, self->_action, self->_shouldAuthenticate, self->_arguments, self->_headers, self->_bodyData];

  return v6;
}

- (SBKRequest)initWithRequestURL:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBKRequest;
  id v6 = [(SBKRequest *)&v15 init];
  if (v6)
  {
    objc_super v7 = [v5 absoluteString];
    uint64_t v8 = [v7 lastPathComponent];
    action = v6->_action;
    v6->_action = (NSString *)v8;

    objc_storeStrong((id *)&v6->_requestURL, a3);
    id v10 = [(SBKRequest *)v6 _defaultHeaderFields];
    uint64_t v11 = [v10 mutableCopy];
    headers = v6->_headers;
    v6->_headers = (NSDictionary *)v11;

    id v13 = objc_alloc_init(MEMORY[0x263F89500]);
    [v13 setShouldPostFooterSectionChanged:0];
    [v13 setShouldProcessDialogs:0];
    [v13 setShouldTriggerDownloads:0];
    [(SBKRequest *)v6 setResponseDataProvider:v13];
  }
  return v6;
}

+ (id)_contentTypeStringForBodyContentType:(int64_t)a3
{
  v3 = @"text/plain; charset=UTF-8";
  if (a3 == 2) {
    v3 = @"text/xml; charset=UTF-8";
  }
  if (a3 == 3) {
    return @"application/x-plist";
  }
  else {
    return v3;
  }
}

+ (id)_contentEncodingTypeStringForBodyContentEncodingType:(int64_t)a3
{
  if (a3 == 1) {
    return @"gzip";
  }
  else {
    return 0;
  }
}

+ (id)_methodStringForMethod:(int64_t)a3
{
  if (a3 == 1) {
    return @"POST";
  }
  else {
    return @"GET";
  }
}

+ (int64_t)bodyContentEncodingType
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  unsigned int v3 = [v2 BOOLForKey:@"SBKRequestBodyContentType-EncodeGzip"];

  return v3;
}

+ (int64_t)bodyContentType
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"SBKRequestBodyContentType-TextXML"];

  if (v3) {
    return 2;
  }
  else {
    return 3;
  }
}

+ (id)requestWithRequestURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class()) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"subclass must implement"];
  }
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRequestURL:v3];

  return v5;
}

@end