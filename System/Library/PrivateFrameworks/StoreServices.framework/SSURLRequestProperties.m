@interface SSURLRequestProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsBootstrapCellularData;
- (BOOL)canBeResolved;
- (BOOL)isEqual:(id)a3;
- (BOOL)isITunesStoreRequest;
- (BOOL)isLargeDownload;
- (BOOL)requiresCellularDataNetwork;
- (BOOL)requiresExtendedValidationCertificates;
- (BOOL)requiresExternal;
- (BOOL)requiresHTTPS;
- (BOOL)shouldAddKBSyncData;
- (BOOL)shouldDecodeResponse;
- (BOOL)shouldDisableCellular;
- (BOOL)shouldDisableCellularFallback;
- (BOOL)shouldDisableReversePush;
- (BOOL)shouldDisableReversePushSampling;
- (BOOL)shouldProcessProtocol;
- (BOOL)shouldSendSecureToken;
- (BOOL)shouldSetCookies;
- (NSArray)URLs;
- (NSArray)userAgentComponents;
- (NSData)HTTPBody;
- (NSData)clientAuditTokenData;
- (NSDictionary)HTTPHeaders;
- (NSDictionary)additionalMetrics;
- (NSDictionary)requestParameters;
- (NSInputStream)HTTPBodyStream;
- (NSString)HTTPMethod;
- (NSString)URLBagKey;
- (NSString)clientAuditBundleIdentifier;
- (NSString)clientBundleIdentifier;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSURL)URL;
- (SSURLRequestProperties)init;
- (SSURLRequestProperties)initWithCoder:(id)a3;
- (SSURLRequestProperties)initWithURL:(id)a3;
- (SSURLRequestProperties)initWithURLRequest:(id)a3;
- (SSURLRequestProperties)initWithXPCEncoding:(id)a3;
- (double)timeoutInterval;
- (id)URLBagURLBlock;
- (id)_initCommon;
- (id)copyURLRequest;
- (id)copyXPCEncoding;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)KBSyncType;
- (int64_t)URLBagType;
- (int64_t)allowedRetryCount;
- (int64_t)expectedContentLength;
- (int64_t)machineDataStyle;
- (unint64_t)cachePolicy;
- (unint64_t)networkServiceType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SSURLRequestProperties

void __40__SSURLRequestProperties_copyURLRequest__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAllHTTPHeaderFields:*(void *)(*(void *)(a1 + 40) + 96)];
  [*(id *)(a1 + 32) setCachePolicy:*(void *)(*(void *)(a1 + 40) + 32)];
  [*(id *)(a1 + 32) setHTTPBody:*(void *)(*(void *)(a1 + 40) + 80)];
  [*(id *)(a1 + 32) setHTTPBodyStream:*(void *)(*(void *)(a1 + 40) + 88)];
  [*(id *)(a1 + 32) setHTTPMethod:*(void *)(*(void *)(a1 + 40) + 104)];
  [*(id *)(a1 + 32) setNetworkServiceType:*(void *)(*(void *)(a1 + 40) + 144)];
  double v2 = *(double *)(*(void *)(a1 + 40) + 176);
  double v3 = 10.0;
  if (v2 >= 10.0) {
    double v3 = *(double *)(*(void *)(a1 + 40) + 176);
  }
  BOOL v4 = v2 < 2.22044605e-16;
  double v5 = 60.0;
  if (!v4) {
    double v5 = v3;
  }
  [*(id *)(a1 + 32) setTimeoutInterval:v5];
  if ([*(id *)(*(void *)(a1 + 40) + 208) count])
  {
    v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(*(void *)(a1 + 40) + 208) objectAtIndex:0];
    [v6 setURL:v7];
  }
}

- (SSURLRequestProperties)init
{
  return [(SSURLRequestProperties *)self initWithURLRequest:0];
}

- (id)copyURLRequest
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E88]);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__SSURLRequestProperties_copyURLRequest__block_invoke;
  v8[3] = &unk_1E5BA7018;
  id v5 = v3;
  id v9 = v5;
  v10 = self;
  dispatch_sync(dispatchQueue, v8);
  id v6 = v5;

  return v6;
}

- (SSURLRequestProperties)initWithURLRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SSURLRequestProperties *)self _initCommon];
  id v6 = v5;
  if (v5)
  {
    v5->_allowedRetryCount = -1;
    v5->_requiresExtendedValidationCertificates = -1;
    v5->_shouldDecodeResponse = 1;
    v5->_shouldSetCookies = 1;
    if (v4)
    {
      v5->_cachePolicy = [v4 cachePolicy];
      uint64_t v7 = [v4 HTTPBody];
      httpBody = v6->_httpBody;
      v6->_httpBody = (NSData *)v7;

      uint64_t v9 = [v4 HTTPBodyStream];
      httpBodyStream = v6->_httpBodyStream;
      v6->_httpBodyStream = (NSInputStream *)v9;

      uint64_t v11 = [v4 allHTTPHeaderFields];
      httpHeaders = v6->_httpHeaders;
      v6->_httpHeaders = (NSDictionary *)v11;

      uint64_t v13 = [v4 HTTPMethod];
      httpMethod = v6->_httpMethod;
      v6->_httpMethod = (NSString *)v13;

      [v4 timeoutInterval];
      v6->_timeoutInterval = v15;
      id v16 = objc_alloc(MEMORY[0x1E4F1C978]);
      v17 = [v4 URL];
      uint64_t v18 = objc_msgSend(v16, "initWithObjects:", v17, 0);
      urls = v6->_urls;
      v6->_urls = (NSArray *)v18;
    }
    else
    {
      v5->_cachePolicy = 0;
      v20 = v5->_httpMethod;
      v5->_httpMethod = (NSString *)@"GET";

      v6->_timeoutInterval = 60.0;
    }
  }

  return v6;
}

- (id)_initCommon
{
  v6.receiver = self;
  v6.super_class = (Class)SSURLRequestProperties;
  double v2 = [(SSURLRequestProperties *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storeservices.SSURLRequestProperties", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentComponents, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong(&self->_urlBagURLBlock, 0);
  objc_storeStrong((id *)&self->_urlBagKey, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_httpMethod, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_httpBodyStream, 0);
  objc_storeStrong((id *)&self->_httpBody, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientAuditTokenData, 0);
  objc_storeStrong((id *)&self->_clientAuditBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalMetrics, 0);
}

- (SSURLRequestProperties)initWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(SSURLRequestProperties *)self initWithURLRequest:0];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v4, 0);
    urls = v5->_urls;
    v5->_urls = (NSArray *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SSURLRequestProperties.m" lineNumber:222 description:@"Only keyed coding is supported"];
  }
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__SSURLRequestProperties_encodeWithCoder___block_invoke;
  v9[3] = &unk_1E5BA7018;
  id v10 = v5;
  uint64_t v11 = self;
  id v7 = v5;
  dispatch_sync(dispatchQueue, v9);
}

uint64_t __42__SSURLRequestProperties_encodeWithCoder___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 8) forKey:@"additionalMetrics"];
  [*(id *)(a1 + 32) encodeInteger:*(void *)(*(void *)(a1 + 40) + 16) forKey:@"retry"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 24) forKey:@"btstrpcll"];
  [*(id *)(a1 + 32) encodeInteger:*(void *)(*(void *)(a1 + 40) + 32) forKey:@"cache"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 40) forKey:@"srcappid"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 48) forKey:@"srcapp"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 56) forKey:@"client"];
  [*(id *)(a1 + 32) encodeInt64:*(void *)(*(void *)(a1 + 40) + 72) forKey:@"exclen"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 80) forKey:@"body"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 96) forKey:@"headers"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 104) forKey:@"method"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 112) forKey:@"itunes"];
  [*(id *)(a1 + 32) encodeInt64:*(void *)(*(void *)(a1 + 40) + 120) forKey:@"kbsynctype"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 128) forKey:@"large"];
  [*(id *)(a1 + 32) encodeInteger:*(void *)(*(void *)(a1 + 40) + 136) forKey:@"mds"];
  [*(id *)(a1 + 32) encodeInteger:*(void *)(*(void *)(a1 + 40) + 144) forKey:@"srvtype"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 152) forKey:@"params"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 160) forKey:@"reqcell"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned char *)(*(void *)(a1 + 40) + 161) != 0 forKey:@"requireev"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 162) forKey:@"requireext"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 163) forKey:@"requireHTTPS"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 164) forKey:@"decode"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 166) forKey:@"nocell"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 165) forKey:@"disablecell"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 167) forKey:@"disableReversePush"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 168) forKey:@"disableReversePushSampling"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 169) forKey:@"procptcl"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 170) forKey:@"sectok"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 171) forKey:@"cookies"];
  [*(id *)(a1 + 32) encodeDouble:@"timeout" forKey:*(double *)(*(void *)(a1 + 40) + 176)];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 184) forKey:@"bagkey"];
  [*(id *)(a1 + 32) encodeInteger:*(void *)(*(void *)(a1 + 40) + 192) forKey:@"bagtype"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 208) forKey:@"urls"];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 216);
  return [v2 encodeObject:v3 forKey:@"uacomps"];
}

- (SSURLRequestProperties)initWithCoder:(id)a3
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2 object:self file:@"SSURLRequestProperties.m" lineNumber:262 description:@"Only keyed coding is supported"];
  }
  id v6 = [(SSURLRequestProperties *)self _initCommon];
  if (!v6) {
    goto LABEL_28;
  }
  if (![v5 containsValueForKey:@"properties"])
  {
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v7 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
    uint64_t v16 = [v5 decodeObjectOfClasses:v7 forKey:@"additionalMetrics"];
    v17 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v16;

    *((unsigned char *)v6 + 24) = [v5 decodeBoolForKey:@"btstrpcll"];
    uint64_t v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"srcappid"];
    v19 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v18;

    uint64_t v20 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"srcapp"];
    v21 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v20;

    uint64_t v22 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"client"];
    v23 = (void *)*((void *)v6 + 7);
    *((void *)v6 + 7) = v22;

    uint64_t v24 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
    v25 = (void *)*((void *)v6 + 10);
    *((void *)v6 + 10) = v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    v54[0] = objc_opt_class();
    v54[1] = objc_opt_class();
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    v28 = [v26 setWithArray:v27];
    uint64_t v29 = [v5 decodeObjectOfClasses:v28 forKey:@"headers"];
    v30 = (void *)*((void *)v6 + 12);
    *((void *)v6 + 12) = v29;

    uint64_t v31 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"method"];
    v32 = (void *)*((void *)v6 + 13);
    *((void *)v6 + 13) = v31;

    *((unsigned char *)v6 + 112) = [v5 decodeBoolForKey:@"itunes"];
    *((unsigned char *)v6 + 128) = [v5 decodeBoolForKey:@"large"];
    *((void *)v6 + 17) = [v5 decodeIntegerForKey:@"mds"];
    *((void *)v6 + 18) = [v5 decodeIntegerForKey:@"srvtype"];
    *((unsigned char *)v6 + 160) = [v5 decodeBoolForKey:@"reqcell"];
    *((unsigned char *)v6 + 161) = [v5 decodeBoolForKey:@"requireev"];
    *((unsigned char *)v6 + 162) = [v5 decodeBoolForKey:@"requireext"];
    *((unsigned char *)v6 + 163) = [v5 decodeBoolForKey:@"requireHTTPS"];
    *((unsigned char *)v6 + 164) = [v5 decodeBoolForKey:@"decode"];
    *((unsigned char *)v6 + 166) = [v5 decodeBoolForKey:@"nocell"];
    *((unsigned char *)v6 + 165) = [v5 decodeBoolForKey:@"disablecell"];
    *((unsigned char *)v6 + 167) = [v5 decodeBoolForKey:@"disableReversePush"];
    *((unsigned char *)v6 + 168) = [v5 decodeBoolForKey:@"disableReversePushSampling"];
    *((unsigned char *)v6 + 169) = [v5 decodeBoolForKey:@"procptcl"];
    *((unsigned char *)v6 + 170) = [v5 decodeBoolForKey:@"sectok"];
    *((unsigned char *)v6 + 171) = [v5 decodeBoolForKey:@"cookies"];
    [v5 decodeDoubleForKey:@"timeout"];
    *((void *)v6 + 22) = v33;
    uint64_t v34 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"bagkey"];
    v35 = (void *)*((void *)v6 + 23);
    *((void *)v6 + 23) = v34;

    *((void *)v6 + 24) = [v5 decodeIntegerForKey:@"bagtype"];
    uint64_t v36 = [v5 decodeObjectOfClasses:v7 forKey:@"uacomps"];
    v37 = (void *)*((void *)v6 + 27);
    *((void *)v6 + 27) = v36;

    if ([v5 containsValueForKey:@"retryCount"]) {
      v38 = @"retryCount";
    }
    else {
      v38 = @"retry";
    }
    *((void *)v6 + 2) = [v5 decodeIntegerForKey:v38];
    if ([v5 containsValueForKey:@"cachePolicy"]) {
      v39 = @"cachePolicy";
    }
    else {
      v39 = @"cache";
    }
    *((void *)v6 + 4) = [v5 decodeIntegerForKey:v39];
    if ([v5 containsValueForKey:@"expectedlength"]) {
      uint64_t v40 = [v5 decodeIntegerForKey:@"expectedlength"];
    }
    else {
      uint64_t v40 = [v5 decodeInt64ForKey:@"exclen"];
    }
    *((void *)v6 + 9) = v40;
    if ([v5 containsValueForKey:@"kbsync"]) {
      uint64_t v42 = [v5 decodeBoolForKey:@"kbsync"];
    }
    else {
      uint64_t v42 = [v5 decodeInt64ForKey:@"kbsynctype"];
    }
    *((void *)v6 + 15) = v42;
    if ([v5 containsValueForKey:@"query"]) {
      v43 = @"query";
    }
    else {
      v43 = @"params";
    }
    uint64_t v44 = [v5 decodeObjectOfClasses:v7 forKey:v43];
    v45 = (void *)*((void *)v6 + 19);
    *((void *)v6 + 19) = v44;

    if ([v5 containsValueForKey:@"urls"])
    {
      v46 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v47 = objc_opt_class();
      uint64_t v48 = objc_opt_class();
      v49 = objc_msgSend(v46, "setWithObjects:", v47, v48, objc_opt_class(), 0);
      uint64_t v50 = [v5 decodeObjectOfClasses:v49 forKey:@"urls"];
    }
    else
    {
      v49 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
      uint64_t v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v49, 0);
    }
    v51 = (void *)*((void *)v6 + 26);
    *((void *)v6 + 26) = v50;

    goto LABEL_27;
  }
  uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"properties"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)v6 + 1, *(id *)(v7 + 8));
    *((void *)v6 + 2) = *(void *)(v7 + 16);
    *((unsigned char *)v6 + 24) = *(unsigned char *)(v7 + 24);
    *((void *)v6 + 4) = *(void *)(v7 + 32);
    objc_storeStrong((id *)v6 + 5, *(id *)(v7 + 40));
    objc_storeStrong((id *)v6 + 6, *(id *)(v7 + 48));
    objc_storeStrong((id *)v6 + 7, *(id *)(v7 + 56));
    *((void *)v6 + 9) = *(void *)(v7 + 72);
    objc_storeStrong((id *)v6 + 10, *(id *)(v7 + 80));
    objc_storeStrong((id *)v6 + 11, *(id *)(v7 + 88));
    objc_storeStrong((id *)v6 + 12, *(id *)(v7 + 96));
    objc_storeStrong((id *)v6 + 13, *(id *)(v7 + 104));
    *((unsigned char *)v6 + 112) = *(unsigned char *)(v7 + 112);
    *((void *)v6 + 15) = *(void *)(v7 + 120);
    *((unsigned char *)v6 + 128) = *(unsigned char *)(v7 + 128);
    *((void *)v6 + 17) = *(void *)(v7 + 136);
    *((void *)v6 + 18) = *(void *)(v7 + 144);
    objc_storeStrong((id *)v6 + 19, *(id *)(v7 + 152));
    *((unsigned char *)v6 + 160) = *(unsigned char *)(v7 + 160);
    *((unsigned char *)v6 + 161) = *(unsigned char *)(v7 + 161);
    *((unsigned char *)v6 + 162) = *(unsigned char *)(v7 + 162);
    *((unsigned char *)v6 + 163) = *(unsigned char *)(v7 + 163);
    *((unsigned char *)v6 + 164) = *(unsigned char *)(v7 + 164);
    *((unsigned char *)v6 + 165) = *(unsigned char *)(v7 + 165);
    *((unsigned char *)v6 + 166) = *(unsigned char *)(v7 + 166);
    *((unsigned char *)v6 + 167) = *(unsigned char *)(v7 + 167);
    *((unsigned char *)v6 + 168) = *(unsigned char *)(v7 + 168);
    *((unsigned char *)v6 + 169) = *(unsigned char *)(v7 + 169);
    *((unsigned char *)v6 + 170) = *(unsigned char *)(v7 + 170);
    *((unsigned char *)v6 + 171) = *(unsigned char *)(v7 + 171);
    *((void *)v6 + 22) = *(void *)(v7 + 176);
    objc_storeStrong((id *)v6 + 23, *(id *)(v7 + 184));
    *((void *)v6 + 24) = *(void *)(v7 + 192);
    uint64_t v8 = MEMORY[0x1A6268200](*(void *)(v7 + 200));
    uint64_t v9 = (void *)*((void *)v6 + 25);
    *((void *)v6 + 25) = v8;

    objc_storeStrong((id *)v6 + 26, *(id *)(v7 + 208));
    objc_storeStrong((id *)v6 + 27, *(id *)(v7 + 216));
LABEL_27:

LABEL_28:
    v41 = (SSURLRequestProperties *)v6;
    goto LABEL_29;
  }

  v41 = 0;
LABEL_29:

  return v41;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__24;
  uint64_t v13 = __Block_byref_object_dispose__24;
  id v14 = [(SSURLRequestProperties *)+[SSMutableURLRequestProperties allocWithZone:](SSMutableURLRequestProperties, "allocWithZone:") _initCommon];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SSURLRequestProperties_mutableCopyWithZone___block_invoke;
  block[3] = &unk_1E5BAAA18;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __46__SSURLRequestProperties_mutableCopyWithZone___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 8), *(id *)(a1[4] + 8));
  *(void *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 16) = *(void *)(a1[4] + 16);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 24) = *(unsigned char *)(a1[4] + 24);
  *(void *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 32) = *(void *)(a1[4] + 32);
  uint64_t v2 = [*(id *)(a1[4] + 40) copyWithZone:a1[6]];
  uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 40);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1[4] + 48) copyWithZone:a1[6]];
  uint64_t v6 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v5;

  uint64_t v8 = [*(id *)(a1[4] + 56) copyWithZone:a1[6]];
  uint64_t v9 = *(void *)(*(void *)(a1[5] + 8) + 40);
  id v10 = *(void **)(v9 + 56);
  *(void *)(v9 + 56) = v8;

  *(void *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 72) = *(void *)(a1[4] + 72);
  uint64_t v11 = [*(id *)(a1[4] + 80) copyWithZone:a1[6]];
  uint64_t v12 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v13 = *(void **)(v12 + 80);
  *(void *)(v12 + 80) = v11;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 88), *(id *)(a1[4] + 88));
  uint64_t v14 = [*(id *)(a1[4] + 96) copyWithZone:a1[6]];
  uint64_t v15 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v16 = *(void **)(v15 + 96);
  *(void *)(v15 + 96) = v14;

  uint64_t v17 = [*(id *)(a1[4] + 104) copyWithZone:a1[6]];
  uint64_t v18 = *(void *)(*(void *)(a1[5] + 8) + 40);
  v19 = *(void **)(v18 + 104);
  *(void *)(v18 + 104) = v17;

  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 112) = *(unsigned char *)(a1[4] + 112);
  *(void *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 120) = *(void *)(a1[4] + 120);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 128) = *(unsigned char *)(a1[4] + 128);
  *(void *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 136) = *(void *)(a1[4] + 136);
  *(void *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 144) = *(void *)(a1[4] + 144);
  uint64_t v20 = [*(id *)(a1[4] + 152) copyWithZone:a1[6]];
  uint64_t v21 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v22 = *(void **)(v21 + 152);
  *(void *)(v21 + 152) = v20;

  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 160) = *(unsigned char *)(a1[4] + 160);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 161) = *(unsigned char *)(a1[4] + 161);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 162) = *(unsigned char *)(a1[4] + 162);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 163) = *(unsigned char *)(a1[4] + 163);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 164) = *(unsigned char *)(a1[4] + 164);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 165) = *(unsigned char *)(a1[4] + 165);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 166) = *(unsigned char *)(a1[4] + 166);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 167) = *(unsigned char *)(a1[4] + 167);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 168) = *(unsigned char *)(a1[4] + 168);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 169) = *(unsigned char *)(a1[4] + 169);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 170) = *(unsigned char *)(a1[4] + 170);
  *(unsigned char *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 171) = *(unsigned char *)(a1[4] + 171);
  *(void *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 176) = *(void *)(a1[4] + 176);
  uint64_t v23 = [*(id *)(a1[4] + 184) copyWithZone:a1[6]];
  uint64_t v24 = *(void *)(*(void *)(a1[5] + 8) + 40);
  v25 = *(void **)(v24 + 184);
  *(void *)(v24 + 184) = v23;

  *(void *)(*(void *)(*(void *)(a1[5] + 8) + 40) + 192) = *(void *)(a1[4] + 192);
  uint64_t v26 = [*(id *)(a1[4] + 200) copyWithZone:a1[6]];
  uint64_t v27 = *(void *)(*(void *)(a1[5] + 8) + 40);
  v28 = *(void **)(v27 + 200);
  *(void *)(v27 + 200) = v26;

  uint64_t v29 = [*(id *)(a1[4] + 208) copyWithZone:a1[6]];
  uint64_t v30 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v31 = *(void **)(v30 + 208);
  *(void *)(v30 + 208) = v29;

  uint64_t v32 = [*(id *)(a1[4] + 216) copyWithZone:a1[6]];
  uint64_t v33 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v34 = *(void **)(v33 + 216);
  *(void *)(v33 + 216) = v32;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__SSURLRequestProperties_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E5BA7018;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(dispatchQueue, v8);
  id v6 = v5;

  return v6;
}

uint64_t __41__SSURLRequestProperties_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "33", *(void *)(*(void *)(a1 + 40) + 8));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "0", *(void *)(*(void *)(a1 + 40) + 16));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "27", *(unsigned char *)(*(void *)(a1 + 40) + 24));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "1", *(void *)(*(void *)(a1 + 40) + 32));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "25", *(void *)(*(void *)(a1 + 40) + 40));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "2", *(void *)(*(void *)(a1 + 40) + 48));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "3", *(void *)(*(void *)(a1 + 40) + 56));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "5", *(void *)(*(void *)(a1 + 40) + 72));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "6", *(void *)(*(void *)(a1 + 40) + 80));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "7", *(void *)(*(void *)(a1 + 40) + 96));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "8", *(void *)(*(void *)(a1 + 40) + 104));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "9", *(unsigned char *)(*(void *)(a1 + 40) + 112));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "28", *(void *)(*(void *)(a1 + 40) + 120));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "24", *(unsigned char *)(*(void *)(a1 + 40) + 128));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "30", *(void *)(*(void *)(a1 + 40) + 136));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "12", *(void *)(*(void *)(a1 + 40) + 144));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "13", *(void *)(*(void *)(a1 + 40) + 152));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "29", *(unsigned char *)(*(void *)(a1 + 40) + 160));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "15", *(unsigned char *)(*(void *)(a1 + 40) + 161) != 0);
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "31", *(unsigned char *)(*(void *)(a1 + 40) + 162));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "26", *(unsigned char *)(*(void *)(a1 + 40) + 163));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "4", *(unsigned char *)(*(void *)(a1 + 40) + 164));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "11", *(unsigned char *)(*(void *)(a1 + 40) + 165));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "10", *(unsigned char *)(*(void *)(a1 + 40) + 166));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "32", *(unsigned char *)(*(void *)(a1 + 40) + 167));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "34", *(unsigned char *)(*(void *)(a1 + 40) + 168));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "14", *(unsigned char *)(*(void *)(a1 + 40) + 169));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "23", *(unsigned char *)(*(void *)(a1 + 40) + 170));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "17", *(unsigned char *)(*(void *)(a1 + 40) + 171));
  xpc_dictionary_set_double(*(xpc_object_t *)(a1 + 32), "18", *(double *)(*(void *)(a1 + 40) + 176));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "19", *(void *)(*(void *)(a1 + 40) + 184));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "20", *(void *)(*(void *)(a1 + 40) + 192));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "22", *(void *)(*(void *)(a1 + 40) + 216));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 208);
  return SSXPCDictionarySetObject(v2, "21", v3);
}

- (SSURLRequestProperties)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    id v6 = [(SSURLRequestProperties *)self _initCommon];
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "33", v8);
    additionalMetrics = v6->_additionalMetrics;
    v6->_additionalMetrics = (NSDictionary *)v9;

    v6->_allowedRetryCount = xpc_dictionary_get_int64(v5, "0");
    v6->_allowsBootstrapCellularData = xpc_dictionary_get_BOOL(v5, "27");
    v6->_cachePolicy = xpc_dictionary_get_int64(v5, "1");
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "25", v11);
    clientAuditBundleIdentifier = v6->_clientAuditBundleIdentifier;
    v6->_clientAuditBundleIdentifier = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
    clientAuditTokenData = v6->_clientAuditTokenData;
    v6->_clientAuditTokenData = (NSData *)v15;

    uint64_t v17 = objc_opt_class();
    uint64_t v18 = SSXPCDictionaryCopyObjectWithClass(v5, "3", v17);
    clientIdentifier = v6->_clientIdentifier;
    v6->_clientIdentifier = (NSString *)v18;

    v6->_expectedContentLength = xpc_dictionary_get_int64(v5, "5");
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = SSXPCDictionaryCopyObjectWithClass(v5, "6", v20);
    httpBody = v6->_httpBody;
    v6->_httpBody = (NSData *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v24 = SSXPCDictionaryCopyObjectWithClass(v5, "7", v23);
    httpHeaders = v6->_httpHeaders;
    v6->_httpHeaders = (NSDictionary *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v27 = SSXPCDictionaryCopyObjectWithClass(v5, "8", v26);
    httpMethod = v6->_httpMethod;
    v6->_httpMethod = (NSString *)v27;

    v6->_isITunesStoreRequest = xpc_dictionary_get_BOOL(v5, "9");
    v6->_kbsyncType = xpc_dictionary_get_int64(v5, "28");
    v6->_largeDownload = xpc_dictionary_get_BOOL(v5, "24");
    v6->_machineDataStyle = xpc_dictionary_get_int64(v5, "30");
    v6->_networkServiceType = xpc_dictionary_get_int64(v5, "12");
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = SSXPCDictionaryCopyObjectWithClass(v5, "13", v29);
    requestParameters = v6->_requestParameters;
    v6->_requestParameters = (NSDictionary *)v30;

    v6->_requiresCellularDataNetwork = xpc_dictionary_get_BOOL(v5, "29");
    v6->_requiresExtendedValidationCertificates = xpc_dictionary_get_BOOL(v5, "15");
    v6->_requiresExternal = xpc_dictionary_get_BOOL(v5, "31");
    v6->_requiresHTTPS = xpc_dictionary_get_BOOL(v5, "26");
    v6->_shouldDecodeResponse = xpc_dictionary_get_BOOL(v5, "4");
    v6->_shouldDisableCellular = xpc_dictionary_get_BOOL(v5, "11");
    v6->_shouldDisableCellularFallback = xpc_dictionary_get_BOOL(v5, "10");
    v6->_shouldDisableReversePush = xpc_dictionary_get_BOOL(v5, "32");
    v6->_shouldDisableReversePushSampling = xpc_dictionary_get_BOOL(v5, "34");
    v6->_shouldProcessProtocol = xpc_dictionary_get_BOOL(v5, "14");
    v6->_shouldSendSecureToken = xpc_dictionary_get_BOOL(v5, "23");
    v6->_shouldSetCookies = xpc_dictionary_get_BOOL(v5, "17");
    v6->_timeoutInterval = xpc_dictionary_get_double(v5, "18");
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = SSXPCDictionaryCopyObjectWithClass(v5, "19", v32);
    urlBagKey = v6->_urlBagKey;
    v6->_urlBagKey = (NSString *)v33;

    v6->_urlBagType = xpc_dictionary_get_int64(v5, "20");
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = SSXPCDictionaryCopyObjectWithClass(v5, "22", v35);
    userAgentComponents = v6->_userAgentComponents;
    v6->_userAgentComponents = (NSArray *)v36;

    xpc_dictionary_get_value(v5, "21");
    self = (SSURLRequestProperties *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = objc_opt_class();
    v39 = (NSArray *)SSXPCCreateNSArrayFromXPCEncodedArray(self, v38);
    urls = v6->_urls;
    v6->_urls = v39;
  }
  else
  {
    id v6 = 0;
  }

LABEL_5:
  return v6;
}

- (NSDictionary)additionalMetrics
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SSURLRequestProperties_additionalMetrics__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __43__SSURLRequestProperties_additionalMetrics__block_invoke(uint64_t a1)
{
}

- (int64_t)allowedRetryCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SSURLRequestProperties_allowedRetryCount__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SSURLRequestProperties_allowedRetryCount__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3 == -1)
  {
    result = [*(id *)(v2 + 104) caseInsensitiveCompare:@"post"];
    uint64_t v4 = *(void *)(*(void *)(v1 + 40) + 8);
    if (result) {
      *(void *)(v4 + 24) = 6;
    }
    else {
      *(void *)(v4 + 24) = 0;
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v3;
  }
  return result;
}

- (unint64_t)cachePolicy
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__SSURLRequestProperties_cachePolicy__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__SSURLRequestProperties_cachePolicy__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (NSString)clientIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SSURLRequestProperties_clientIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __42__SSURLRequestProperties_clientIdentifier__block_invoke(uint64_t a1)
{
}

- (int64_t)expectedContentLength
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SSURLRequestProperties_expectedContentLength__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSURLRequestProperties_expectedContentLength__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 72);
  return result;
}

- (NSData)HTTPBody
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSURLRequestProperties_HTTPBody__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __34__SSURLRequestProperties_HTTPBody__block_invoke(uint64_t a1)
{
}

- (NSDictionary)HTTPHeaders
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__SSURLRequestProperties_HTTPHeaders__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __37__SSURLRequestProperties_HTTPHeaders__block_invoke(uint64_t a1)
{
}

- (NSString)HTTPMethod
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SSURLRequestProperties_HTTPMethod__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __36__SSURLRequestProperties_HTTPMethod__block_invoke(uint64_t a1)
{
}

- (BOOL)isITunesStoreRequest
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SSURLRequestProperties_isITunesStoreRequest__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__SSURLRequestProperties_isITunesStoreRequest__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 112)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = *(void *)(v1 + 184) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int64_t)machineDataStyle
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SSURLRequestProperties_machineDataStyle__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SSURLRequestProperties_machineDataStyle__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 136);
  return result;
}

- (unint64_t)networkServiceType
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 3;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SSURLRequestProperties_networkServiceType__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__SSURLRequestProperties_networkServiceType__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 144);
  return result;
}

- (NSDictionary)requestParameters
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SSURLRequestProperties_requestParameters__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __43__SSURLRequestProperties_requestParameters__block_invoke(uint64_t a1)
{
}

- (BOOL)shouldProcessProtocol
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SSURLRequestProperties_shouldProcessProtocol__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSURLRequestProperties_shouldProcessProtocol__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 169);
  return result;
}

- (BOOL)shouldSendSecureToken
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SSURLRequestProperties_shouldSendSecureToken__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSURLRequestProperties_shouldSendSecureToken__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 170);
  return result;
}

- (BOOL)shouldSetCookies
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SSURLRequestProperties_shouldSetCookies__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SSURLRequestProperties_shouldSetCookies__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 171);
  return result;
}

- (NSString)clientAuditBundleIdentifier
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SSURLRequestProperties_clientAuditBundleIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __53__SSURLRequestProperties_clientAuditBundleIdentifier__block_invoke(uint64_t a1)
{
}

- (NSData)clientAuditTokenData
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SSURLRequestProperties_clientAuditTokenData__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __46__SSURLRequestProperties_clientAuditTokenData__block_invoke(uint64_t a1)
{
}

- (NSString)clientBundleIdentifier
{
  id v3 = [(SSURLRequestProperties *)self clientAuditBundleIdentifier];
  if (![v3 length])
  {
    uint64_t v4 = [(SSURLRequestProperties *)self clientAuditTokenData];
    uint64_t v5 = [v4 length];

    if (v5 == 32)
    {
      uint64_t v6 = [(SSURLRequestProperties *)self clientAuditTokenData];
      [v6 getBytes:&v9 length:32];

      uint64_t v7 = CPCopyBundleIdentifierFromAuditToken();
      id v3 = (void *)v7;
    }
  }
  return (NSString *)v3;
}

- (double)timeoutInterval
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x404E000000000000;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SSURLRequestProperties_timeoutInterval__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __41__SSURLRequestProperties_timeoutInterval__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 176);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)URLBagKey
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SSURLRequestProperties_URLBagKey__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __35__SSURLRequestProperties_URLBagKey__block_invoke(uint64_t a1)
{
}

- (NSURL)URL
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__SSURLRequestProperties_URL__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __29__SSURLRequestProperties_URL__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 208) count])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 208) objectAtIndex:0];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  else
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

- (NSArray)userAgentComponents
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SSURLRequestProperties_userAgentComponents__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __45__SSURLRequestProperties_userAgentComponents__block_invoke(uint64_t a1)
{
}

- (NSString)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)SSURLRequestProperties;
  uint64_t v4 = [(SSURLRequestProperties *)&v10 description];
  uint64_t v5 = [(SSURLRequestProperties *)self URLs];
  uint64_t v6 = [(SSURLRequestProperties *)self requestParameters];
  uint64_t v7 = [(SSURLRequestProperties *)self HTTPHeaders];
  uint64_t v8 = [v3 stringWithFormat:@"%@: URLs: %@; Parameters: %@; Headers: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int64_t v5 = [(SSURLRequestProperties *)self allowedRetryCount],
        v5 == [v4 allowedRetryCount])
    && (unint64_t v6 = -[SSURLRequestProperties cachePolicy](self, "cachePolicy"), v6 == [v4 cachePolicy])
    && (unint64_t v7 = [(SSURLRequestProperties *)self networkServiceType],
        v7 == [v4 networkServiceType])
    && ([(SSURLRequestProperties *)self timeoutInterval],
        double v9 = v8,
        [v4 timeoutInterval],
        v9 == v10))
  {
    int64_t v11 = [(SSURLRequestProperties *)self URLBagType];
    BOOL v12 = v11 == [v4 URLBagType];
  }
  else
  {
    BOOL v12 = 0;
  }
  uint64_t v13 = [(SSURLRequestProperties *)self HTTPMethod];
  uint64_t v14 = [v4 HTTPMethod];
  uint64_t v15 = (void *)v14;
  if (v12)
  {
    if (v13 == (void *)v14) {
      int v16 = 1;
    }
    else {
      int v16 = [v13 isEqualToString:v14];
    }
  }
  else
  {
    int v16 = 0;
  }
  uint64_t v17 = [(SSURLRequestProperties *)self URLs];

  uint64_t v18 = [v4 URLs];

  uint64_t v19 = [v17 count];
  if (v16)
  {
    uint64_t v20 = v19;
    uint64_t v21 = [v18 count];
    uint64_t v22 = [v17 count];
    BOOL v23 = v20 == v21;
    int v24 = v20 == v21;
    if (v23)
    {
      uint64_t v25 = v22;
      if (v22 >= 1)
      {
        uint64_t v26 = 1;
        do
        {
          uint64_t v27 = [v17 objectAtIndex:v26 - 1];
          v28 = [v18 objectAtIndex:v26 - 1];
          int v24 = [v27 isEqual:v28];

          if (!v24) {
            break;
          }
        }
        while (v26++ < v25);
      }
    }
  }
  else
  {
    int v24 = 0;
  }
  uint64_t v30 = [(SSURLRequestProperties *)self userAgentComponents];

  uint64_t v31 = [v4 userAgentComponents];

  if (v24)
  {
    if (v30 == v31) {
      char v32 = 1;
    }
    else {
      char v32 = [v30 isEqualToArray:v31];
    }
  }
  else
  {
    char v32 = 0;
  }

  return v32;
}

- (BOOL)allowsBootstrapCellularData
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SSURLRequestProperties_allowsBootstrapCellularData__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SSURLRequestProperties_allowsBootstrapCellularData__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (BOOL)canBeResolved
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SSURLRequestProperties_canBeResolved__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SSURLRequestProperties_canBeResolved__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(void *)(v2 + 184) || *(void *)(v2 + 200))
  {
    BOOL v3 = 1;
  }
  else
  {
    double result = [*(id *)(v2 + 208) count];
    BOOL v3 = result != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = v3;
  return result;
}

- (NSInputStream)HTTPBodyStream
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__24;
  double v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__SSURLRequestProperties_HTTPBodyStream__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSInputStream *)v3;
}

void __40__SSURLRequestProperties_HTTPBodyStream__block_invoke(uint64_t a1)
{
}

- (BOOL)isLargeDownload
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SSURLRequestProperties_isLargeDownload__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__SSURLRequestProperties_isLargeDownload__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 128);
  return result;
}

- (int64_t)KBSyncType
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SSURLRequestProperties_KBSyncType__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__SSURLRequestProperties_KBSyncType__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 120);
  return result;
}

- (BOOL)requiresCellularDataNetwork
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SSURLRequestProperties_requiresCellularDataNetwork__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SSURLRequestProperties_requiresCellularDataNetwork__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 160);
  return result;
}

- (BOOL)requiresExtendedValidationCertificates
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__SSURLRequestProperties_requiresExtendedValidationCertificates__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__SSURLRequestProperties_requiresExtendedValidationCertificates__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(v1 + 161);
  if (v2 == 255) {
    char v3 = *(unsigned char *)(v1 + 112);
  }
  else {
    char v3 = v2 != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)requiresExternal
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__SSURLRequestProperties_requiresExternal__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SSURLRequestProperties_requiresExternal__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 162);
  return result;
}

- (BOOL)requiresHTTPS
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SSURLRequestProperties_requiresHTTPS__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__SSURLRequestProperties_requiresHTTPS__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 163);
  return result;
}

- (BOOL)shouldAddKBSyncData
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SSURLRequestProperties_shouldAddKBSyncData__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__SSURLRequestProperties_shouldAddKBSyncData__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 120) != 0;
  return result;
}

- (BOOL)shouldDecodeResponse
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SSURLRequestProperties_shouldDecodeResponse__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__SSURLRequestProperties_shouldDecodeResponse__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 164);
  return result;
}

- (BOOL)shouldDisableCellular
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SSURLRequestProperties_shouldDisableCellular__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSURLRequestProperties_shouldDisableCellular__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 165);
  return result;
}

- (BOOL)shouldDisableCellularFallback
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SSURLRequestProperties_shouldDisableCellularFallback__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SSURLRequestProperties_shouldDisableCellularFallback__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 166);
  return result;
}

- (BOOL)shouldDisableReversePush
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SSURLRequestProperties_shouldDisableReversePush__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__SSURLRequestProperties_shouldDisableReversePush__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 167);
  return result;
}

- (BOOL)shouldDisableReversePushSampling
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SSURLRequestProperties_shouldDisableReversePushSampling__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__SSURLRequestProperties_shouldDisableReversePushSampling__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 168);
  return result;
}

- (int64_t)URLBagType
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SSURLRequestProperties_URLBagType__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__SSURLRequestProperties_URLBagType__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 192);
  return result;
}

- (id)URLBagURLBlock
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__323;
  double v10 = __Block_byref_object_dispose__324;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__SSURLRequestProperties_URLBagURLBlock__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = (void *)MEMORY[0x1A6268200](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__SSURLRequestProperties_URLBagURLBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1A6268200](*(void *)(*(void *)(a1 + 32) + 200));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)URLs
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__24;
  double v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__SSURLRequestProperties_URLs__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __30__SSURLRequestProperties_URLs__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 208) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end