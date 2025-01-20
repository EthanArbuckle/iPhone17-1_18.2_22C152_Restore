@interface SSMutableURLRequestProperties
- (void)setAdditionalMetrics:(id)a3;
- (void)setAllowedRetryCount:(int64_t)a3;
- (void)setAllowsBootstrapCellularData:(BOOL)a3;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setClientAuditBundleIdentifier:(id)a3;
- (void)setClientAuditTokenData:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setExpectedContentLength:(int64_t)a3;
- (void)setHTTPBody:(id)a3;
- (void)setHTTPBodyStream:(id)a3;
- (void)setHTTPHeaders:(id)a3;
- (void)setHTTPMethod:(id)a3;
- (void)setITunesStoreRequest:(BOOL)a3;
- (void)setKBSyncType:(int64_t)a3;
- (void)setLargeDownload:(BOOL)a3;
- (void)setMachineDataStyle:(int64_t)a3;
- (void)setMultiPartFormDataWithDictionary:(id)a3;
- (void)setNetworkServiceType:(unint64_t)a3;
- (void)setRequestParameters:(id)a3;
- (void)setRequiresCellularDataNetwork:(BOOL)a3;
- (void)setRequiresExtendedValidationCertificates:(BOOL)a3;
- (void)setRequiresExternal:(BOOL)a3;
- (void)setRequiresHTTPS:(BOOL)a3;
- (void)setShouldAddKBSyncData:(BOOL)a3;
- (void)setShouldDecodeResponse:(BOOL)a3;
- (void)setShouldDisableCellular:(BOOL)a3;
- (void)setShouldDisableCellularFallback:(BOOL)a3;
- (void)setShouldDisableReversePush:(BOOL)a3;
- (void)setShouldDisableReversePushSampling:(BOOL)a3;
- (void)setShouldProcessProtocol:(BOOL)a3;
- (void)setShouldSendSecureToken:(BOOL)a3;
- (void)setShouldSetCookies:(BOOL)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)setURL:(id)a3;
- (void)setURLBagKey:(id)a3;
- (void)setURLBagType:(int64_t)a3;
- (void)setURLBagURLBlock:(id)a3;
- (void)setURLs:(id)a3;
- (void)setUserAgentComponents:(id)a3;
- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4;
- (void)setValue:(id)a3 forRequestParameter:(id)a4;
@end

@implementation SSMutableURLRequestProperties

- (void)setURL:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = (id)objc_msgSend([v4 alloc], "initWithObjects:", v5, 0);

  [(SSMutableURLRequestProperties *)self setURLs:v6];
}

- (void)setURLs:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__SSMutableURLRequestProperties_setURLs___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __61__SSMutableURLRequestProperties_setValue_forHTTPHeaderField___block_invoke(void *a1)
{
  id v2 = (id)[*(id *)(a1[4] + 96) mutableCopy];
  if (!v2) {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v8 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:v4];
  }
  else {
    [v2 removeObjectForKey:v4];
  }
  uint64_t v5 = [v8 copy];
  uint64_t v6 = a1[4];
  v7 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v5;
}

uint64_t __66__SSMutableURLRequestProperties_setShouldDisableCellularFallback___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 166) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __55__SSMutableURLRequestProperties_setITunesStoreRequest___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 112) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SSMutableURLRequestProperties_setValue_forHTTPHeaderField___block_invoke;
  block[3] = &unk_1E5BA7068;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(dispatchQueue, block);
}

void __47__SSMutableURLRequestProperties_setHTTPMethod___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 104) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v4;
  }
}

void __45__SSMutableURLRequestProperties_setHTTPBody___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 80) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v4;
  }
}

void __41__SSMutableURLRequestProperties_setURLs___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 208) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 208);
    *(void *)(v5 + 208) = v4;
  }
}

- (void)setShouldDisableCellularFallback:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__SSMutableURLRequestProperties_setShouldDisableCellularFallback___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setITunesStoreRequest:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SSMutableURLRequestProperties_setITunesStoreRequest___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

- (void)setHTTPMethod:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SSMutableURLRequestProperties_setHTTPMethod___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (void)setHTTPBody:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SSMutableURLRequestProperties_setHTTPBody___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (void)setAdditionalMetrics:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SSMutableURLRequestProperties_setAdditionalMetrics___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __54__SSMutableURLRequestProperties_setAdditionalMetrics___block_invoke(uint64_t a1)
{
}

- (void)setAllowedRetryCount:(int64_t)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SSMutableURLRequestProperties_setAllowedRetryCount___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __54__SSMutableURLRequestProperties_setAllowedRetryCount___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 16) = *(void *)(result + 40);
  return result;
}

- (void)setCachePolicy:(unint64_t)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SSMutableURLRequestProperties_setCachePolicy___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __48__SSMutableURLRequestProperties_setCachePolicy___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32) = *(void *)(result + 40);
  return result;
}

- (void)setClientIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SSMutableURLRequestProperties_setClientIdentifier___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __53__SSMutableURLRequestProperties_setClientIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 56) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;
  }
}

- (void)setExpectedContentLength:(int64_t)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SSMutableURLRequestProperties_setExpectedContentLength___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __58__SSMutableURLRequestProperties_setExpectedContentLength___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 72) = *(void *)(result + 40);
  return result;
}

- (void)setHTTPHeaders:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SSMutableURLRequestProperties_setHTTPHeaders___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __48__SSMutableURLRequestProperties_setHTTPHeaders___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 96) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v4;
  }
}

- (void)setMachineDataStyle:(int64_t)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__SSMutableURLRequestProperties_setMachineDataStyle___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __53__SSMutableURLRequestProperties_setMachineDataStyle___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 136) = *(void *)(result + 40);
  return result;
}

- (void)setNetworkServiceType:(unint64_t)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SSMutableURLRequestProperties_setNetworkServiceType___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __55__SSMutableURLRequestProperties_setNetworkServiceType___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 144) = *(void *)(result + 40);
  return result;
}

- (void)setRequestParameters:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SSMutableURLRequestProperties_setRequestParameters___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __54__SSMutableURLRequestProperties_setRequestParameters___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 152) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 152);
    *(void *)(v5 + 152) = v4;
  }
}

- (void)setShouldDisableCellular:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SSMutableURLRequestProperties_setShouldDisableCellular___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __58__SSMutableURLRequestProperties_setShouldDisableCellular___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 165) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setShouldDisableReversePush:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__SSMutableURLRequestProperties_setShouldDisableReversePush___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __61__SSMutableURLRequestProperties_setShouldDisableReversePush___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 167) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setShouldDisableReversePushSampling:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__SSMutableURLRequestProperties_setShouldDisableReversePushSampling___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __69__SSMutableURLRequestProperties_setShouldDisableReversePushSampling___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 168) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setTimeoutInterval:(double)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__SSMutableURLRequestProperties_setTimeoutInterval___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

double __52__SSMutableURLRequestProperties_setTimeoutInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 176) = result;
  return result;
}

- (void)setURLBagKey:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__SSMutableURLRequestProperties_setURLBagKey___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __46__SSMutableURLRequestProperties_setURLBagKey___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 184) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 184);
    *(void *)(v5 + 184) = v4;
  }
}

- (void)setUserAgentComponents:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SSMutableURLRequestProperties_setUserAgentComponents___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __56__SSMutableURLRequestProperties_setUserAgentComponents___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 216) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 216);
    *(void *)(v5 + 216) = v4;
  }
}

- (void)setValue:(id)a3 forRequestParameter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SSMutableURLRequestProperties_setValue_forRequestParameter___block_invoke;
  block[3] = &unk_1E5BA7068;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(dispatchQueue, block);
}

void __62__SSMutableURLRequestProperties_setValue_forRequestParameter___block_invoke(void *a1)
{
  id v2 = (id)[*(id *)(a1[4] + 152) mutableCopy];
  if (!v2) {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v8 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:v4];
  }
  else {
    [v2 removeObjectForKey:v4];
  }
  uint64_t v5 = [v8 copy];
  uint64_t v6 = a1[4];
  id v7 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v5;
}

- (void)setAllowsBootstrapCellularData:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__SSMutableURLRequestProperties_setAllowsBootstrapCellularData___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __64__SSMutableURLRequestProperties_setAllowsBootstrapCellularData___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setHTTPBodyStream:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SSMutableURLRequestProperties_setHTTPBodyStream___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __51__SSMutableURLRequestProperties_setHTTPBodyStream___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  BOOL v5 = *(void **)(v2 + 88);
  id v4 = (id *)(v2 + 88);
  if (v5 != v3) {
    objc_storeStrong(v4, v3);
  }
}

- (void)setKBSyncType:(int64_t)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SSMutableURLRequestProperties_setKBSyncType___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __47__SSMutableURLRequestProperties_setKBSyncType___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 120) = *(void *)(result + 40);
  return result;
}

- (void)setLargeDownload:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SSMutableURLRequestProperties_setLargeDownload___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __50__SSMutableURLRequestProperties_setLargeDownload___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 128) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setMultiPartFormDataWithDictionary:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 UUIDString];
    if (v7)
    {
      id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"multipart/form-data; boundary=%@",
                     v7);
      id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __68__SSMutableURLRequestProperties_setMultiPartFormDataWithDictionary___block_invoke;
      v13[3] = &unk_1E5BAAA40;
      id v14 = v9;
      id v10 = v7;
      id v15 = v10;
      id v11 = v9;
      [v4 enumerateKeysAndObjectsUsingBlock:v13];
      [v11 appendFormat:@"--%@--", v10];
      id v12 = [v11 dataUsingEncoding:4];
      [(SSMutableURLRequestProperties *)self setHTTPBody:v12];

      [(SSMutableURLRequestProperties *)self setHTTPMethod:@"POST"];
      [(SSMutableURLRequestProperties *)self setValue:v8 forHTTPHeaderField:@"Content-Type"];
    }
  }
}

void __68__SSMutableURLRequestProperties_setMultiPartFormDataWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = a3;
  id v7 = a2;
  [v5 appendFormat:@"--%@\r\n", v6];
  [*(id *)(a1 + 32) appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", v7];

  [*(id *)(a1 + 32) appendFormat:@"%@\r\n", v8];
}

- (void)setRequiresCellularDataNetwork:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__SSMutableURLRequestProperties_setRequiresCellularDataNetwork___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __64__SSMutableURLRequestProperties_setRequiresCellularDataNetwork___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 160) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setRequiresExtendedValidationCertificates:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__SSMutableURLRequestProperties_setRequiresExtendedValidationCertificates___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __75__SSMutableURLRequestProperties_setRequiresExtendedValidationCertificates___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 161) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setRequiresExternal:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__SSMutableURLRequestProperties_setRequiresExternal___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __53__SSMutableURLRequestProperties_setRequiresExternal___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 162) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setRequiresHTTPS:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SSMutableURLRequestProperties_setRequiresHTTPS___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __50__SSMutableURLRequestProperties_setRequiresHTTPS___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 163) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setShouldAddKBSyncData:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SSMutableURLRequestProperties_setShouldAddKBSyncData___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __56__SSMutableURLRequestProperties_setShouldAddKBSyncData___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 120) = *(unsigned __int8 *)(result + 40);
  return result;
}

- (void)setShouldDecodeResponse:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SSMutableURLRequestProperties_setShouldDecodeResponse___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __57__SSMutableURLRequestProperties_setShouldDecodeResponse___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 164) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setShouldProcessProtocol:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SSMutableURLRequestProperties_setShouldProcessProtocol___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __58__SSMutableURLRequestProperties_setShouldProcessProtocol___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 169) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setShouldSendSecureToken:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SSMutableURLRequestProperties_setShouldSendSecureToken___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __58__SSMutableURLRequestProperties_setShouldSendSecureToken___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 170) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setShouldSetCookies:(BOOL)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__SSMutableURLRequestProperties_setShouldSetCookies___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __53__SSMutableURLRequestProperties_setShouldSetCookies___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 171) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setClientAuditBundleIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SSMutableURLRequestProperties_setClientAuditBundleIdentifier___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __64__SSMutableURLRequestProperties_setClientAuditBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 40) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (void)setClientAuditTokenData:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SSMutableURLRequestProperties_setClientAuditTokenData___block_invoke;
  v7[3] = &unk_1E5BA7018;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __57__SSMutableURLRequestProperties_setClientAuditTokenData___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(void **)(v2 + 48);
  uint64_t v3 = (id *)(v2 + 48);
  if (v1 != v4) {
    objc_storeStrong(v3, v1);
  }
}

- (void)setURLBagType:(int64_t)a3
{
  dispatchQueue = self->super._dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SSMutableURLRequestProperties_setURLBagType___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __47__SSMutableURLRequestProperties_setURLBagType___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 192) = *(void *)(result + 40);
  return result;
}

- (void)setURLBagURLBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SSMutableURLRequestProperties_setURLBagURLBlock___block_invoke;
  v7[3] = &unk_1E5BA7350;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __51__SSMutableURLRequestProperties_setURLBagURLBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 200) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 200);
    *(void *)(v5 + 200) = v4;
  }
}

@end