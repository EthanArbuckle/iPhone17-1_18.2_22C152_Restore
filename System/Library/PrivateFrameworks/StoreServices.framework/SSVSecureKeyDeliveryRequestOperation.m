@interface SSVSecureKeyDeliveryRequestOperation
- (AVAssetResourceLoadingRequest)resourceLoadingRequest;
- (BOOL)isITunesStoreRequest;
- (BOOL)offline;
- (BOOL)shouldIncludeGUID;
- (BOOL)skippedRentalCheckout;
- (NSData)persistentContentKeyContext;
- (NSData)serverPlaybackContextData;
- (NSNumber)rentalId;
- (NSURL)certificateURL;
- (NSURL)keyServerURL;
- (SSVSecureKeyDeliveryRequestOperation)init;
- (SSVSecureKeyDeliveryRequestOperationDelegate)serverPlaybackContextDataDelegate;
- (double)_expirationTimeForStreamingKeyID:(int64_t)a3 streamingKeyDictionaries:(id)a4;
- (double)_playbackStartTimeForStreamingKeyID:(int64_t)a3 streamingKeyDictionaries:(id)a4;
- (double)_timeIntervalForStreamingKeyID:(int64_t)a3 responseKey:(id)a4 streamingKeyDictionaries:(id)a5;
- (double)expirationTime;
- (double)playbackStartTime;
- (id)_contentKeyContextForStreamingKeyID:(int64_t)a3 streamingKeyDictionaries:(id)a4 renewAfter:(double *)a5 error:(id *)a6;
- (id)_streamingKeyDictionaryForID:(int64_t)a3 URI:(id)a4 serverPlaybackContextData:(id)a5;
- (id)_streamingRequestDictionaryWithStreamingKeyDictionaries:(id)a3;
- (id)responseBlock;
- (int64_t)leaseAction;
- (void)_sendResponseBlockWithError:(id)a3;
- (void)configureWithURLBagDictionary:(id)a3;
- (void)main;
- (void)setCertificateURL:(id)a3;
- (void)setITunesStoreRequest:(BOOL)a3;
- (void)setKeyServerURL:(id)a3;
- (void)setLeaseAction:(int64_t)a3;
- (void)setOffline:(BOOL)a3;
- (void)setPersistentContentKeyContext:(id)a3;
- (void)setRentalId:(id)a3;
- (void)setResourceLoadingRequest:(id)a3;
- (void)setResponseBlock:(id)a3;
- (void)setServerPlaybackContextData:(id)a3;
- (void)setServerPlaybackContextDataDelegate:(id)a3;
- (void)setShouldIncludeGUID:(BOOL)a3;
- (void)setSkippedRentalCheckout:(BOOL)a3;
- (void)start;
@end

@implementation SSVSecureKeyDeliveryRequestOperation

- (SSVSecureKeyDeliveryRequestOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSVSecureKeyDeliveryRequestOperation;
  v2 = [(SSVSecureKeyDeliveryRequestOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreServices.SSVSecureKeyDeliveryRequestOperation.accessQueue", MEMORY[0x1E4F14430]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (NSURL)certificateURL
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SSVSecureKeyDeliveryRequestOperation_certificateURL__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __54__SSVSecureKeyDeliveryRequestOperation_certificateURL__block_invoke(uint64_t a1)
{
}

- (NSURL)keyServerURL
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SSVSecureKeyDeliveryRequestOperation_keyServerURL__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __52__SSVSecureKeyDeliveryRequestOperation_keyServerURL__block_invoke(uint64_t a1)
{
}

- (NSData)persistentContentKeyContext
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SSVSecureKeyDeliveryRequestOperation_persistentContentKeyContext__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __67__SSVSecureKeyDeliveryRequestOperation_persistentContentKeyContext__block_invoke(uint64_t a1)
{
}

- (AVAssetResourceLoadingRequest)resourceLoadingRequest
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SSVSecureKeyDeliveryRequestOperation_resourceLoadingRequest__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVAssetResourceLoadingRequest *)v3;
}

void __62__SSVSecureKeyDeliveryRequestOperation_resourceLoadingRequest__block_invoke(uint64_t a1)
{
}

- (id)responseBlock
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__87;
  v10 = __Block_byref_object_dispose__88;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SSVSecureKeyDeliveryRequestOperation_responseBlock__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (void *)MEMORY[0x1A6268200](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __53__SSVSecureKeyDeliveryRequestOperation_responseBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 280) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSData)serverPlaybackContextData
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__SSVSecureKeyDeliveryRequestOperation_serverPlaybackContextData__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __65__SSVSecureKeyDeliveryRequestOperation_serverPlaybackContextData__block_invoke(uint64_t a1)
{
}

- (void)setCertificateURL:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SSVSecureKeyDeliveryRequestOperation_setCertificateURL___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __58__SSVSecureKeyDeliveryRequestOperation_setCertificateURL___block_invoke(uint64_t a1)
{
}

- (void)setPersistentContentKeyContext:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SSVSecureKeyDeliveryRequestOperation_setPersistentContentKeyContext___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __71__SSVSecureKeyDeliveryRequestOperation_setPersistentContentKeyContext___block_invoke(uint64_t a1)
{
}

- (void)setKeyServerURL:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SSVSecureKeyDeliveryRequestOperation_setKeyServerURL___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __56__SSVSecureKeyDeliveryRequestOperation_setKeyServerURL___block_invoke(uint64_t a1)
{
}

- (void)setITunesStoreRequest:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__SSVSecureKeyDeliveryRequestOperation_setITunesStoreRequest___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_barrier_async(accessQueue, v4);
}

uint64_t __62__SSVSecureKeyDeliveryRequestOperation_setITunesStoreRequest___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 288) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setResourceLoadingRequest:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__SSVSecureKeyDeliveryRequestOperation_setResourceLoadingRequest___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __66__SSVSecureKeyDeliveryRequestOperation_setResourceLoadingRequest___block_invoke(uint64_t a1)
{
}

- (void)setResponseBlock:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SSVSecureKeyDeliveryRequestOperation_setResponseBlock___block_invoke;
  v7[3] = &unk_1E5BA7350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __57__SSVSecureKeyDeliveryRequestOperation_setResponseBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 280);
  *(void *)(v3 + 280) = v2;
}

- (void)setShouldIncludeGUID:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__SSVSecureKeyDeliveryRequestOperation_setShouldIncludeGUID___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_barrier_async(accessQueue, v4);
}

uint64_t __61__SSVSecureKeyDeliveryRequestOperation_setShouldIncludeGUID___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 289) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setServerPlaybackContextData:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SSVSecureKeyDeliveryRequestOperation_setServerPlaybackContextData___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __69__SSVSecureKeyDeliveryRequestOperation_setServerPlaybackContextData___block_invoke(uint64_t a1)
{
}

- (BOOL)shouldIncludeGUID
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SSVSecureKeyDeliveryRequestOperation_shouldIncludeGUID__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__SSVSecureKeyDeliveryRequestOperation_shouldIncludeGUID__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 289);
  return result;
}

- (BOOL)isITunesStoreRequest
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SSVSecureKeyDeliveryRequestOperation_isITunesStoreRequest__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__SSVSecureKeyDeliveryRequestOperation_isITunesStoreRequest__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 288);
  return result;
}

- (void)configureWithURLBagDictionary:(id)a3
{
  id v4 = (void *)[a3 copy];
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SSVSecureKeyDeliveryRequestOperation_configureWithURLBagDictionary___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

void __70__SSVSecureKeyDeliveryRequestOperation_configureWithURLBagDictionary___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 288) = 1;
  }
}

- (void)main
{
  v296[1] = *MEMORY[0x1E4F143B8];
  if (![(SSVSecureKeyDeliveryRequestOperation *)self isCancelled])
  {
    uint64_t v276 = 0;
    v277 = &v276;
    uint64_t v278 = 0x3032000000;
    v279 = __Block_byref_object_copy__2;
    v280 = __Block_byref_object_dispose__2;
    id v281 = 0;
    uint64_t v270 = 0;
    v271 = &v270;
    uint64_t v272 = 0x3032000000;
    v273 = __Block_byref_object_copy__2;
    v274 = __Block_byref_object_dispose__2;
    id v275 = 0;
    uint64_t v264 = 0;
    v265 = &v264;
    uint64_t v266 = 0x3032000000;
    v267 = __Block_byref_object_copy__2;
    v268 = __Block_byref_object_dispose__2;
    id v269 = 0;
    uint64_t v258 = 0;
    v259 = &v258;
    uint64_t v260 = 0x3032000000;
    v261 = __Block_byref_object_copy__2;
    v262 = __Block_byref_object_dispose__2;
    id v263 = 0;
    uint64_t v254 = 0;
    v255 = &v254;
    uint64_t v256 = 0x2020000000;
    char v257 = 0;
    uint64_t v250 = 0;
    v251 = &v250;
    uint64_t v252 = 0x2020000000;
    char v253 = 0;
    uint64_t v244 = 0;
    v245 = &v244;
    uint64_t v246 = 0x3032000000;
    v247 = __Block_byref_object_copy__2;
    v248 = __Block_byref_object_dispose__2;
    id v249 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SSVSecureKeyDeliveryRequestOperation_main__block_invoke;
    block[3] = &unk_1E5BA8088;
    block[4] = self;
    block[5] = &v276;
    block[6] = &v270;
    block[7] = &v258;
    block[8] = &v254;
    block[9] = &v250;
    block[10] = &v264;
    block[11] = &v244;
    dispatch_sync(accessQueue, block);
    if (!v277[5] || !v271[5] || !v259[5])
    {
      BOOL v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SSVSecureKeyDeliveryErrorDomain" code:-2002 userInfo:0];
      [(SSVSecureKeyDeliveryRequestOperation *)self _sendResponseBlockWithError:v5];
LABEL_180:

      _Block_object_dispose(&v244, 8);
      _Block_object_dispose(&v250, 8);
      _Block_object_dispose(&v254, 8);
      _Block_object_dispose(&v258, 8);

      _Block_object_dispose(&v264, 8);
      _Block_object_dispose(&v270, 8);

      _Block_object_dispose(&v276, 8);
      return;
    }
    if (*((unsigned char *)v255 + 24) && v265[5])
    {
      id v4 = [SSVURLBagInterpreter alloc];
      BOOL v5 = [(SSVURLBagInterpreter *)v4 initWithURLBagDictionary:v265[5]];
    }
    else
    {
      BOOL v5 = 0;
    }
    id v6 = objc_alloc(MEMORY[0x1E4F28E88]);
    v7 = (void *)[v6 initWithURL:v277[5]];
    [v7 setHTTPMethod:@"GET"];
    id v217 = v7;
    uint64_t v237 = 0;
    v238 = &v237;
    uint64_t v239 = 0x3032000000;
    v240 = __Block_byref_object_copy__2;
    v241 = __Block_byref_object_dispose__2;
    id v242 = 0;
    uint64_t v231 = 0;
    v232 = &v231;
    uint64_t v233 = 0x3032000000;
    v234 = __Block_byref_object_copy__2;
    v235 = __Block_byref_object_dispose__2;
    id v236 = 0;
    id v8 = [[SSVLoadURLOperation alloc] initWithURLRequest:v7];
    char v9 = v8;
    if (*((unsigned char *)v255 + 24))
    {
      [(SSVLoadURLOperation *)v8 setITunesStoreRequest:1];
      if (v265[5])
      {
        -[SSVLoadURLOperation configureWithURLBagDictionary:](v9, "configureWithURLBagDictionary:");
        v10 = [(SSVLoadURLOperation *)v9 storeFrontSuffix];
        BOOL v11 = v10 == 0;

        if (v11)
        {
          v12 = [(SSVURLBagInterpreter *)v5 storeFrontSuffix];
          [(SSVLoadURLOperation *)v9 setStoreFrontSuffix:v12];
        }
        [(SSVLoadURLOperation *)v9 setMachineDataStyle:2];
        v13 = [[SSVSAPSignaturePolicy alloc] initWithPolicyType:1];
        [(SSVLoadURLOperation *)v9 setSAPSignaturePolicy:v13];
      }
    }
    v230[0] = MEMORY[0x1E4F143A8];
    v230[1] = 3221225472;
    v230[2] = __44__SSVSecureKeyDeliveryRequestOperation_main__block_invoke_2;
    v230[3] = &unk_1E5BA80B0;
    v230[4] = &v231;
    v230[5] = &v237;
    [(SSVLoadURLOperation *)v9 setOutputBlock:v230];
    [(SSVLoadURLOperation *)v9 main];
    if ([(id)v232[5] length])
    {
      v14 = [(id)v259[5] request];
      v215 = [v14 URL];

      v15 = [v215 host];
      v212 = [v15 dataUsingEncoding:4];
      v210 = v15;
      if (*((unsigned char *)v251 + 24))
      {
        v16 = (void *)SSVAVFoundationFramework();
        v17 = SSVWeakLinkedStringConstantForString("AVAssetResourceLoadingRequestStreamingContentKeyRequestRequiresPersistentKey", v16);
        v295 = v17;
        v296[0] = MEMORY[0x1E4F1CC38];
        v211 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v296 forKeys:&v295 count:1];
      }
      else
      {
        v211 = 0;
      }
      if (v245[5])
      {
        id v19 = 0;
      }
      else
      {
        v32 = (void *)v259[5];
        uint64_t v33 = v232[5];
        id v229 = 0;
        uint64_t v34 = [v32 streamingContentKeyRequestDataForApp:v33 contentIdentifier:v212 options:v211 error:&v229];
        id v19 = v229;
        v35 = (void *)v245[5];
        v245[5] = v34;

        [(SSVSecureKeyDeliveryRequestOperation *)self setServerPlaybackContextData:v245[5]];
        v36 = [(SSVSecureKeyDeliveryRequestOperation *)self serverPlaybackContextDataDelegate];
        [v36 secureKeyDeliveryRequestOperationDidChangeServerPlaybackContextData:self];
      }
      uint64_t v37 = [v215 absoluteString];
      v213 = (void *)v37;
      if (v19 || !v245[5])
      {
        uint64_t v18 = (uint64_t)v19;
        v38 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v38)
        {
          v38 = +[SSLogConfig sharedConfig];
        }
        int v39 = [v38 shouldLog];
        int v40 = [v38 shouldLogToDisk];
        v41 = [v38 OSLogObject];
        if (v40) {
          v39 |= 2u;
        }
        v42 = v41;
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT)) {
          v39 &= 2u;
        }
        if (v39)
        {
          v43 = objc_opt_class();
          *(_DWORD *)v290 = 138543618;
          *(void *)&v290[4] = v43;
          *(_WORD *)&v290[12] = 2112;
          *(void *)&v290[14] = v18;
          id v44 = v43;
          LODWORD(v199) = 22;
          v198 = (int *)v290;
          v45 = (void *)_os_log_send_and_compose_impl();

          if (!v45)
          {
LABEL_176:

            goto LABEL_177;
          }
          v42 = objc_msgSend(NSString, "stringWithCString:encoding:", v45, 4, v290, v199);
          free(v45);
          SSFileLog(v38, @"%@", v46, v47, v48, v49, v50, v51, (uint64_t)v42);
        }
LABEL_175:

        goto LABEL_176;
      }
      v38 = -[SSVSecureKeyDeliveryRequestOperation _streamingKeyDictionaryForID:URI:serverPlaybackContextData:](self, "_streamingKeyDictionaryForID:URI:serverPlaybackContextData:", 0, v37);
      v294 = v38;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v294 count:1];
      v209 = [(SSVSecureKeyDeliveryRequestOperation *)self _streamingRequestDictionaryWithStreamingKeyDictionaries:v52];

      id v228 = 0;
      uint64_t v53 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v209 options:0 error:&v228];
      id v54 = v228;
      uint64_t v18 = (uint64_t)v54;
      v208 = (void *)v53;
      if (v53 && !v54)
      {
        v55 = [MEMORY[0x1E4F28E88] requestWithURL:v271[5]];
        [v55 setHTTPBody:v53];
        [v55 setHTTPMethod:@"POST"];
        [v55 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        v205 = [MEMORY[0x1E4F1C9C8] date];
        *(void *)v290 = 0;
        *(void *)&v290[8] = v290;
        *(void *)&v290[16] = 0x3032000000;
        v291 = __Block_byref_object_copy__2;
        v292 = __Block_byref_object_dispose__2;
        id v293 = 0;
        uint64_t v222 = 0;
        v223 = &v222;
        uint64_t v224 = 0x3032000000;
        v225 = __Block_byref_object_copy__2;
        v226 = __Block_byref_object_dispose__2;
        id v227 = 0;
        v56 = [[SSVLoadURLOperation alloc] initWithURLRequest:v55];
        v57 = v56;
        v206 = v55;
        v207 = v56;
        if (*((unsigned char *)v255 + 24))
        {
          [(SSVLoadURLOperation *)v56 setITunesStoreRequest:1];
          if (v265[5])
          {
            -[SSVLoadURLOperation configureWithURLBagDictionary:](v57, "configureWithURLBagDictionary:");
            v58 = [(SSVLoadURLOperation *)v57 storeFrontSuffix];
            BOOL v59 = v58 == 0;

            if (v59)
            {
              v60 = [(SSVURLBagInterpreter *)v5 storeFrontSuffix];
              [(SSVLoadURLOperation *)v207 setStoreFrontSuffix:v60];
            }
            [(SSVLoadURLOperation *)v207 setMachineDataStyle:2];
            v61 = [[SSVSAPSignaturePolicy alloc] initWithPolicyType:1];
            [(SSVLoadURLOperation *)v207 setSAPSignaturePolicy:v61];

            v57 = v207;
          }
        }
        v62 = +[SSVURLDataConsumer consumer];
        [(SSVLoadURLOperation *)v57 setDataConsumer:v62];

        v221[0] = MEMORY[0x1E4F143A8];
        v221[1] = 3221225472;
        v221[2] = __44__SSVSecureKeyDeliveryRequestOperation_main__block_invoke_3;
        v221[3] = &unk_1E5BA80D8;
        v221[4] = self;
        v221[5] = &v222;
        v221[6] = v290;
        [(SSVLoadURLOperation *)v207 setOutputBlock:v221];
        [(SSVLoadURLOperation *)v207 main];
        double v220 = 0.0;
        double v63 = 0.0;
        if (![v209 count] || *(void *)(*(void *)&v290[8] + 40))
        {
          uint64_t v64 = 0;
          uint64_t v18 = 0;
          double v65 = 0.0;
          goto LABEL_131;
        }
        v203 = [(id)v223[5] objectForKey:@"fairplay-streaming-response"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v116 = +[SSLogConfig sharedStoreServicesConfig];
          if (!v116)
          {
            v116 = +[SSLogConfig sharedConfig];
          }
          int v117 = [v116 shouldLog];
          int v118 = [v116 shouldLogToDisk];
          v119 = [v116 OSLogObject];
          v113 = v119;
          if (v118) {
            v117 |= 2u;
          }
          if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT)) {
            int v120 = v117;
          }
          else {
            int v120 = v117 & 2;
          }
          v201 = v116;
          if (v120)
          {
            id v121 = (id)objc_opt_class();
            v122 = objc_opt_class();
            int v284 = 138543618;
            id v285 = v121;
            __int16 v286 = 2112;
            uint64_t v287 = (uint64_t)v122;
            id v123 = v122;
            LODWORD(v199) = 22;
            v198 = &v284;
            uint64_t v18 = _os_log_send_and_compose_impl();

            if (!v18)
            {
              uint64_t v64 = 0;
              double v65 = 0.0;
              goto LABEL_130;
            }
            v113 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v284, v199);
            free((void *)v18);
            SSFileLog(v201, @"%@", v124, v125, v126, v127, v128, v129, (uint64_t)v113);
          }
LABEL_105:
          uint64_t v64 = 0;
          uint64_t v18 = 0;
LABEL_128:
          double v65 = 0.0;
          goto LABEL_129;
        }
        v201 = [v203 objectForKey:@"version"];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v112 = [v201 longLongValue];
          if (v112 == 1)
          {
            v113 = [v203 objectForKey:@"streaming-keys"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v219 = 0;
              uint64_t v64 = [(SSVSecureKeyDeliveryRequestOperation *)self _contentKeyContextForStreamingKeyID:0 streamingKeyDictionaries:v113 renewAfter:&v220 error:&v219];
              uint64_t v18 = (uint64_t)v219;
              [(SSVSecureKeyDeliveryRequestOperation *)self _expirationTimeForStreamingKeyID:0 streamingKeyDictionaries:v113];
              double v65 = v114;
              [(SSVSecureKeyDeliveryRequestOperation *)self _playbackStartTimeForStreamingKeyID:0 streamingKeyDictionaries:v113];
              double v63 = v115;
LABEL_129:

LABEL_130:
LABEL_131:
              if (!(v18 | v64))
              {
                v163 = *(void **)(*(void *)&v290[8] + 40);
                if (!v163)
                {
                  uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SSVSecureKeyDeliveryErrorDomain" code:-2005 userInfo:0];
                  goto LABEL_171;
                }
                uint64_t v202 = v64;
                uint64_t v18 = v163;
                v164 = +[SSLogConfig sharedStoreServicesConfig];
                if (!v164)
                {
                  v164 = +[SSLogConfig sharedConfig];
                }
                int v165 = objc_msgSend(v164, "shouldLog", v198);
                int v166 = [v164 shouldLogToDisk];
                v204 = v164;
                v167 = [v164 OSLogObject];
                v168 = v167;
                if (v166) {
                  v165 |= 2u;
                }
                if (!os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT)) {
                  v165 &= 2u;
                }
                if (v165)
                {
                  v169 = objc_opt_class();
                  int v284 = 138543618;
                  id v285 = v169;
                  __int16 v286 = 2112;
                  uint64_t v287 = v18;
                  id v170 = v169;
                  LODWORD(v199) = 22;
                  v198 = &v284;
                  v171 = (void *)_os_log_send_and_compose_impl();

                  if (!v171)
                  {
LABEL_170:

                    uint64_t v64 = v202;
                    goto LABEL_171;
                  }
                  v168 = objc_msgSend(NSString, "stringWithCString:encoding:", v171, 4, &v284, v199);
                  free(v171);
                  SSFileLog(v204, @"%@", v172, v173, v174, v175, v176, v177, (uint64_t)v168);
                }
LABEL_169:

                goto LABEL_170;
              }
              if (v18) {
                goto LABEL_171;
              }
              v162 = (void *)v259[5];
              if (!v162 || !v64) {
                goto LABEL_171;
              }
              if (self->_leaseAction == 3)
              {
                uint64_t v18 = 0;
LABEL_171:
                self->_expirationTime = v65;
                self->_playbackStartTime = v63;

                _Block_object_dispose(&v222, 8);
                _Block_object_dispose(v290, 8);

                v84 = v205;
                goto LABEL_172;
              }
              if (*((unsigned char *)v251 + 24))
              {
                id v218 = 0;
                v204 = [v162 persistentContentKeyFromKeyVendorResponse:v64 options:0 error:&v218];
                id v200 = v218;
                if (v200)
                {
                  v178 = +[SSLogConfig sharedStoreServicesConfig];
                  if (!v178)
                  {
                    v178 = +[SSLogConfig sharedConfig];
                  }
                  int v179 = objc_msgSend(v178, "shouldLog", v198);
                  int v180 = [v178 shouldLogToDisk];
                  v181 = [v178 OSLogObject];
                  v182 = v181;
                  if (v180) {
                    v179 |= 2u;
                  }
                  if (!os_log_type_enabled(v181, OS_LOG_TYPE_DEBUG)) {
                    v179 &= 2u;
                  }
                  if (v179)
                  {
                    v183 = objc_opt_class();
                    int v284 = 138543618;
                    id v285 = v183;
                    __int16 v286 = 2112;
                    uint64_t v287 = (uint64_t)v200;
                    id v184 = v183;
                    LODWORD(v199) = 22;
                    v198 = &v284;
                    v185 = (void *)_os_log_send_and_compose_impl();

                    if (!v185)
                    {
LABEL_160:

LABEL_165:
                      v193 = objc_msgSend((id)v259[5], "dataRequest", v198);
                      [v193 respondWithData:v64];
                      goto LABEL_166;
                    }
                    v182 = objc_msgSend(NSString, "stringWithCString:encoding:", v185, 4, &v284, v199);
                    free(v185);
                    SSFileLog(v178, @"%@", v186, v187, v188, v189, v190, v191, (uint64_t)v182);
                  }

                  goto LABEL_160;
                }
                if (v204)
                {
                  -[SSVSecureKeyDeliveryRequestOperation setPersistentContentKeyContext:](self, "setPersistentContentKeyContext:");
                  v192 = (void *)SSVAVFoundationFramework();
                  v193 = SSVWeakLinkedStringConstantForString("AVStreamingKeyDeliveryPersistentContentKeyType", v192);
                  v194 = [(id)v259[5] contentInformationRequest];
                  [v194 setContentType:v193];

                  v195 = [(id)v259[5] dataRequest];
                  [v195 respondWithData:v204];

                  id v200 = 0;
LABEL_166:
                  uint64_t v202 = v64;

                  if (v220 != 0.0)
                  {
                    v196 = [v205 dateByAddingTimeInterval:v220];
                    v197 = [(id)v259[5] contentInformationRequest];
                    [v197 setRenewalDate:v196];
                  }
                  uint64_t v18 = 0;
                  v168 = v200;
                  goto LABEL_169;
                }
              }
              id v200 = 0;
              v204 = 0;
              goto LABEL_165;
            }
            goto LABEL_105;
          }
LABEL_117:
          v145 = +[SSLogConfig sharedStoreServicesConfig];
          if (!v145)
          {
            v145 = +[SSLogConfig sharedConfig];
          }
          int v146 = [v145 shouldLog];
          int v147 = [v145 shouldLogToDisk];
          v148 = v145;
          v149 = [v145 OSLogObject];
          v150 = v149;
          if (v147) {
            v146 |= 2u;
          }
          if (!os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT)) {
            v146 &= 2u;
          }
          if (v146)
          {
            v151 = objc_opt_class();
            int v284 = 138543874;
            id v285 = v151;
            __int16 v286 = 2048;
            uint64_t v287 = v112;
            __int16 v288 = 2048;
            uint64_t v289 = 1;
            id v152 = v151;
            LODWORD(v199) = 32;
            v198 = &v284;
            v153 = (void *)_os_log_send_and_compose_impl();

            if (!v153)
            {
LABEL_127:

              v160 = (void *)MEMORY[0x1E4F28C58];
              v282 = @"SSVSecureKeyDeliveryErrorUserInfoKeyResponseVersion";
              v113 = [NSNumber numberWithLongLong:v112];
              v283 = v113;
              v161 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v283 forKeys:&v282 count:1];
              uint64_t v18 = [v160 errorWithDomain:@"SSVSecureKeyDeliveryErrorDomain" code:-2005 userInfo:v161];

              uint64_t v64 = 0;
              goto LABEL_128;
            }
            v150 = objc_msgSend(NSString, "stringWithCString:encoding:", v153, 4, &v284, v199);
            free(v153);
            SSFileLog(v148, @"%@", v154, v155, v156, v157, v158, v159, (uint64_t)v150);
          }

          goto LABEL_127;
        }
        v130 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v130)
        {
          v130 = +[SSLogConfig sharedConfig];
        }
        int v131 = [v130 shouldLog];
        int v132 = [v130 shouldLogToDisk];
        v133 = [v130 OSLogObject];
        v134 = v133;
        if (v132) {
          v131 |= 2u;
        }
        if (!os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT)) {
          v131 &= 2u;
        }
        if (v131)
        {
          id v135 = (id)objc_opt_class();
          v136 = objc_opt_class();
          int v284 = 138543618;
          id v285 = v135;
          __int16 v286 = 2112;
          uint64_t v287 = (uint64_t)v136;
          id v137 = v136;
          LODWORD(v199) = 22;
          v198 = &v284;
          v138 = (void *)_os_log_send_and_compose_impl();

          if (!v138)
          {
LABEL_116:

            uint64_t v112 = 0;
            goto LABEL_117;
          }
          v134 = objc_msgSend(NSString, "stringWithCString:encoding:", v138, 4, &v284, v199);
          free(v138);
          SSFileLog(v130, @"%@", v139, v140, v141, v142, v143, v144, (uint64_t)v134);
        }

        goto LABEL_116;
      }
      if (v54)
      {
        v80 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v80)
        {
          v80 = +[SSLogConfig sharedConfig];
        }
        int v81 = [v80 shouldLog];
        int v82 = [v80 shouldLogToDisk];
        v206 = v80;
        v83 = [v80 OSLogObject];
        v84 = v83;
        if (v82) {
          v81 |= 2u;
        }
        if (!os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT)) {
          v81 &= 2u;
        }
        if (v81)
        {
          v85 = objc_opt_class();
          *(_DWORD *)v290 = 138543618;
          *(void *)&v290[4] = v85;
          *(_WORD *)&v290[12] = 2112;
          *(void *)&v290[14] = v18;
          id v86 = v85;
          LODWORD(v199) = 22;
          v198 = (int *)v290;
          v87 = (void *)_os_log_send_and_compose_impl();

          if (!v87)
          {
LABEL_173:

            v111 = v208;
            goto LABEL_174;
          }
          v84 = objc_msgSend(NSString, "stringWithCString:encoding:", v87, 4, v290, v199);
          free(v87);
          SSFileLog(v206, @"%@", v88, v89, v90, v91, v92, v93, (uint64_t)v84);
        }
LABEL_172:

        goto LABEL_173;
      }
      v94 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v94)
      {
        v94 = +[SSLogConfig sharedConfig];
      }
      int v95 = [v94 shouldLog];
      int v96 = [v94 shouldLogToDisk];
      v97 = [v94 OSLogObject];
      v98 = v97;
      if (v96) {
        int v99 = v95 | 2;
      }
      else {
        int v99 = v95;
      }
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT)) {
        int v100 = v99;
      }
      else {
        int v100 = v99 & 2;
      }
      if (v100)
      {
        v101 = objc_opt_class();
        *(_DWORD *)v290 = 138543362;
        *(void *)&v290[4] = v101;
        id v102 = v101;
        LODWORD(v199) = 12;
        v198 = (int *)v290;
        v103 = (void *)_os_log_send_and_compose_impl();

        if (!v103)
        {
LABEL_89:

          uint64_t v110 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SSVSecureKeyDeliveryErrorDomain" code:-2004 userInfo:0];
          v111 = v208;
          uint64_t v18 = v110;
LABEL_174:

          v42 = v209;
          goto LABEL_175;
        }
        v98 = objc_msgSend(NSString, "stringWithCString:encoding:", v103, 4, v290, v199);
        free(v103);
        SSFileLog(v94, @"%@", v104, v105, v106, v107, v108, v109, (uint64_t)v98);
      }

      goto LABEL_89;
    }
    uint64_t v18 = (uint64_t)(id)v238[5];
    if (v18)
    {
      id v19 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v19)
      {
        id v19 = +[SSLogConfig sharedConfig];
      }
      int v20 = [v19 shouldLog];
      int v21 = [v19 shouldLogToDisk];
      v22 = [v19 OSLogObject];
      if (v21) {
        v20 |= 2u;
      }
      v213 = v22;
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        v20 &= 2u;
      }
      if (v20)
      {
        v23 = objc_opt_class();
        *(_DWORD *)v290 = 138543618;
        *(void *)&v290[4] = v23;
        *(_WORD *)&v290[12] = 2112;
        *(void *)&v290[14] = v18;
        id v24 = v23;
        LODWORD(v199) = 22;
        v198 = (int *)v290;
        v25 = (void *)_os_log_send_and_compose_impl();

        if (v25)
        {
          v214 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, v290, v199);
          free(v25);
          SSFileLog(v19, @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v214);
        }
        goto LABEL_178;
      }
LABEL_177:

LABEL_178:
      goto LABEL_179;
    }
    v66 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v66)
    {
      v66 = +[SSLogConfig sharedConfig];
    }
    int v67 = [v66 shouldLog];
    int v68 = [v66 shouldLogToDisk];
    v69 = [v66 OSLogObject];
    v70 = v69;
    if (v68) {
      v67 |= 2u;
    }
    if (!os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT)) {
      v67 &= 2u;
    }
    if (v67)
    {
      v71 = objc_opt_class();
      *(_DWORD *)v290 = 138543362;
      *(void *)&v290[4] = v71;
      id v72 = v71;
      LODWORD(v199) = 12;
      v198 = (int *)v290;
      v73 = (void *)_os_log_send_and_compose_impl();

      if (!v73)
      {
LABEL_66:

        uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SSVSecureKeyDeliveryErrorDomain" code:-2003 userInfo:0];
LABEL_179:
        -[SSVSecureKeyDeliveryRequestOperation _sendResponseBlockWithError:](self, "_sendResponseBlockWithError:", v18, v198);

        _Block_object_dispose(&v231, 8);
        _Block_object_dispose(&v237, 8);

        goto LABEL_180;
      }
      v70 = objc_msgSend(NSString, "stringWithCString:encoding:", v73, 4, v290, v199);
      free(v73);
      SSFileLog(v66, @"%@", v74, v75, v76, v77, v78, v79, (uint64_t)v70);
    }

    goto LABEL_66;
  }
  id v216 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SSVSecureKeyDeliveryErrorDomain" code:-2001 userInfo:0];
  [(SSVSecureKeyDeliveryRequestOperation *)self _sendResponseBlockWithError:v216];
}

void __44__SSVSecureKeyDeliveryRequestOperation_main__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 256));
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 264));
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), *(id *)(a1[4] + 272));
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = *(unsigned char *)(a1[4] + 288);
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = *(unsigned char *)(a1[4] + 321);
  objc_storeStrong((id *)(*(void *)(a1[10] + 8) + 40), *(id *)(a1[4] + 296));
  uint64_t v2 = *(void **)(a1[4] + 312);
  char v3 = (id *)(*(void *)(a1[11] + 8) + 40);
  objc_storeStrong(v3, v2);
}

void __44__SSVSecureKeyDeliveryRequestOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __44__SSVSecureKeyDeliveryRequestOperation_main__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7)
    {
      uint64_t v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    v10 = [v7 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      id v11 = objc_opt_class();
      id v12 = v11;
      *(_DWORD *)uint64_t v27 = 138543618;
      *(void *)&v27[4] = v11;
      *(_WORD *)&v27[12] = 2112;
      *(void *)&v27[14] = objc_opt_class();
      id v13 = *(id *)&v27[14];
      LODWORD(v26) = 22;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        id v5 = 0;
        goto LABEL_14;
      }
      v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, v27, v26, *(_OWORD *)v27, *(void *)&v27[16], v28);
      free(v14);
      SSFileLog(v7, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v10);
    }

    goto LABEL_13;
  }
LABEL_14:
  uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v5;
  id v23 = v5;

  uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v6;
}

- (void)start
{
  if ([(SSVSecureKeyDeliveryRequestOperation *)self isFinished]
    && [(SSVSecureKeyDeliveryRequestOperation *)self isCancelled])
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SSVSecureKeyDeliveryErrorDomain" code:-2001 userInfo:0];
    [(SSVSecureKeyDeliveryRequestOperation *)self _sendResponseBlockWithError:v3];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SSVSecureKeyDeliveryRequestOperation;
    [(SSVSecureKeyDeliveryRequestOperation *)&v4 start];
  }
}

- (id)_contentKeyContextForStreamingKeyID:(int64_t)a3 streamingKeyDictionaries:(id)a4 renewAfter:(double *)a5 error:(id *)a6
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id obj = a4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v132 objects:v146 count:16];
  if (!v8)
  {
    v45 = 0;
    id v46 = 0;
    goto LABEL_110;
  }
  uint64_t v9 = v8;
  uint64_t v126 = a6;
  uint64_t v127 = a5;
  uint64_t v10 = *(void *)v133;
  id v11 = &off_1E5BA6000;
LABEL_3:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v133 != v10) {
      objc_enumerationMutation(obj);
    }
    id v13 = *(void **)(*((void *)&v132 + 1) + 8 * v12);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [v11[244] sharedStoreServicesConfig];
      if (!v14)
      {
        v14 = [v11[244] sharedConfig];
      }
      int v15 = objc_msgSend(v14, "shouldLog", v121, v124);
      if ([v14 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      uint64_t v17 = [v14 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        int v18 = v16;
      }
      else {
        int v18 = v16 & 2;
      }
      if (!v18) {
        goto LABEL_33;
      }
      uint64_t v19 = objc_opt_class();
      id v20 = v19;
      uint64_t v21 = objc_opt_class();
      int v136 = 138543618;
      id v137 = v19;
      __int16 v138 = 2112;
      int64_t v139 = (int64_t)v21;
      id v22 = v21;
      LODWORD(v124) = 22;
      id v121 = &v136;
      id v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
        id v11 = &off_1E5BA6000;
        goto LABEL_34;
      }
      uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v136, v124);
      free(v23);
      SSFileLog(v14, @"%@", v24, v25, v26, v27, v28, v29, (uint64_t)v17);
      goto LABEL_32;
    }
    v14 = [v13 objectForKey:@"id"];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v17 = [v11[244] sharedStoreServicesConfig];
      if (!v17)
      {
        uint64_t v17 = [v11[244] sharedConfig];
      }
      int v30 = [v17 shouldLog];
      if ([v17 shouldLogToDisk]) {
        v30 |= 2u;
      }
      uint64_t v31 = [v17 OSLogObject];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
        int v32 = v30;
      }
      else {
        int v32 = v30 & 2;
      }
      if (!v32) {
        goto LABEL_31;
      }
      uint64_t v33 = objc_opt_class();
      id v34 = v33;
      v35 = objc_opt_class();
      int v136 = 138543618;
      id v137 = v33;
      __int16 v138 = 2112;
      int64_t v139 = (int64_t)v35;
      id v36 = v35;
      LODWORD(v124) = 22;
      id v121 = &v136;
      uint64_t v37 = (void *)_os_log_send_and_compose_impl();

      if (v37)
      {
        uint64_t v31 = objc_msgSend(NSString, "stringWithCString:encoding:", v37, 4, &v136, v124);
        free(v37);
        SSFileLog(v17, @"%@", v38, v39, v40, v41, v42, v43, (uint64_t)v31);
        id v11 = &off_1E5BA6000;
LABEL_31:

LABEL_33:
        goto LABEL_34;
      }
LABEL_32:
      id v11 = &off_1E5BA6000;
      goto LABEL_33;
    }
    if ([v14 longLongValue] == a3) {
      break;
    }
LABEL_34:

    if (v9 == ++v12)
    {
      uint64_t v44 = [obj countByEnumeratingWithState:&v132 objects:v146 count:16];
      uint64_t v9 = v44;
      if (!v44)
      {
        v45 = 0;
        id v46 = 0;
        goto LABEL_109;
      }
      goto LABEL_3;
    }
  }
  uint64_t v47 = [v11[244] sharedStoreServicesConfig];
  uint64_t v48 = (void *)v47;
  if (!v47)
  {
    uint64_t v48 = [v11[244] sharedConfig];
  }
  int v49 = objc_msgSend(v48, "shouldLog", v121);
  if ([v48 shouldLogToDisk]) {
    v49 |= 2u;
  }
  uint64_t v50 = [v48 OSLogObject];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
    int v51 = v49;
  }
  else {
    int v51 = v49 & 2;
  }
  v52 = v127;
  if (v51)
  {
    uint64_t v53 = objc_opt_class();
    int v136 = 138543618;
    id v137 = v53;
    __int16 v138 = 2048;
    int64_t v139 = a3;
    id v54 = v53;
    LODWORD(v124) = 22;
    v122 = &v136;
    v55 = (void *)_os_log_send_and_compose_impl();

    if (v55)
    {
      uint64_t v50 = objc_msgSend(NSString, "stringWithCString:encoding:", v55, 4, &v136, v124);
      free(v55);
      SSFileLog(v48, @"%@", v56, v57, v58, v59, v60, v61, (uint64_t)v50);
      goto LABEL_49;
    }
  }
  else
  {
LABEL_49:
  }
  v62 = [v13 objectForKey:@"status"];
  double v63 = [v13 objectForKey:@"failureType"];
  if ((objc_opt_respondsToSelector() & 1) == 0 || (uint64_t v64 = [v62 longLongValue]) == 0)
  {
    int v68 = objc_msgSend(v13, "objectForKey:", @"ckc", v122);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v46 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v68 options:0];
      if (![v46 length])
      {
        uint64_t v89 = v62;
        uint64_t v90 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v90)
        {
          uint64_t v90 = +[SSLogConfig sharedConfig];
        }
        uint64_t v129 = v63;
        int v91 = [v90 shouldLog];
        if ([v90 shouldLogToDisk]) {
          v91 |= 2u;
        }
        uint64_t v92 = [v90 OSLogObject];
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT)) {
          int v93 = v91;
        }
        else {
          int v93 = v91 & 2;
        }
        if (v93)
        {
          v94 = objc_opt_class();
          int v136 = 138543618;
          id v137 = v94;
          __int16 v138 = 2048;
          int64_t v139 = a3;
          id v95 = v94;
          LODWORD(v124) = 22;
          id v123 = &v136;
          int v96 = (void *)_os_log_send_and_compose_impl();

          v62 = v89;
          if (!v96) {
            goto LABEL_106;
          }
          uint64_t v92 = objc_msgSend(NSString, "stringWithCString:encoding:", v96, 4, &v136, v124);
          free(v96);
          SSFileLog(v90, @"%@", v97, v98, v99, v100, v101, v102, (uint64_t)v92);
        }
        else
        {
          v62 = v89;
        }

LABEL_106:
        id v46 = 0;
        v52 = v127;
        double v63 = v129;
        if (!v127) {
          goto LABEL_107;
        }
        goto LABEL_96;
      }
LABEL_95:
      if (!v127)
      {
LABEL_107:
        v45 = 0;
        goto LABEL_108;
      }
LABEL_96:
      v71 = v63;
      id v72 = objc_msgSend(v13, "objectForKey:", @"renew-after", v123);
      uint64_t v118 = 0;
      if (v72 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v72 doubleValue];
        uint64_t v118 = v119;
      }
      v45 = 0;
      *(void *)v52 = v118;
      goto LABEL_103;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v46 = v68;
      if (!v127) {
        goto LABEL_107;
      }
      goto LABEL_96;
    }
    v103 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v103)
    {
      v103 = +[SSLogConfig sharedConfig];
    }
    int v104 = [v103 shouldLog];
    if ([v103 shouldLogToDisk]) {
      v104 |= 2u;
    }
    uint64_t v105 = [v103 OSLogObject];
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT)) {
      int v106 = v104;
    }
    else {
      int v106 = v104 & 2;
    }
    if (v106)
    {
      uint64_t v107 = objc_opt_class();
      v130 = v63;
      id v108 = v107;
      uint64_t v109 = objc_opt_class();
      int v136 = 138543874;
      id v137 = v107;
      __int16 v138 = 2048;
      int64_t v139 = a3;
      __int16 v140 = 2112;
      uint64_t v141 = (uint64_t)v109;
      id v110 = v109;
      LODWORD(v124) = 32;
      id v123 = &v136;
      v111 = (void *)_os_log_send_and_compose_impl();

      double v63 = v130;
      if (!v111)
      {
LABEL_94:

        id v46 = 0;
        goto LABEL_95;
      }
      uint64_t v105 = objc_msgSend(NSString, "stringWithCString:encoding:", v111, 4, &v136, v124);
      free(v111);
      SSFileLog(v103, @"%@", v112, v113, v114, v115, v116, v117, (uint64_t)v105);
    }

    goto LABEL_94;
  }
  uint64_t v65 = v64;
  id v66 = objc_alloc(MEMORY[0x1E4F1CA60]);
  int v67 = [NSNumber numberWithLongLong:v65];
  int v68 = objc_msgSend(v66, "initWithObjectsAndKeys:", v67, @"SSVSecureKeyDeliveryErrorUserInfoKeyResponseStatus", 0);

  unint64_t v69 = 0x1E4F28000;
  if (v63 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v70 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"SSServerErrorDomain", objc_msgSend(v63, "integerValue"), 0);
    [v68 setObject:v70 forKey:@"SSVSecureKeyDeliveryErrorUserInfoKeyServerError"];

    unint64_t v69 = 0x1E4F28000uLL;
  }
  v71 = v63;
  id v72 = [v13 objectForKey:@"dialog"];
  if ([v72 isNSDictionary]) {
    [v68 setObject:v72 forKey:@"SSVSecureKeyDeliveryErrorUserInfoKeyDialogDictionary"];
  }
  v73 = v62;
  uint64_t v74 = (void *)[objc_alloc(*(Class *)(v69 + 3160)) initWithDomain:@"com.apple.fpsrequest" code:v65 userInfo:0];
  [v68 setObject:v74 forKey:*MEMORY[0x1E4F28A50]];

  uint64_t v75 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v75)
  {
    uint64_t v75 = +[SSLogConfig sharedConfig];
  }
  int v76 = [v75 shouldLog];
  if ([v75 shouldLogToDisk]) {
    v76 |= 2u;
  }
  uint64_t v77 = [v75 OSLogObject];
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT)) {
    int v78 = v76;
  }
  else {
    int v78 = v76 & 2;
  }
  if (v78)
  {
    uint64_t v79 = objc_opt_class();
    int v136 = 138544386;
    id v137 = v79;
    __int16 v138 = 2048;
    int64_t v139 = a3;
    __int16 v140 = 2048;
    uint64_t v141 = v65;
    __int16 v142 = 2114;
    uint64_t v143 = v71;
    __int16 v144 = 2114;
    v145 = v72;
    id v80 = v79;
    LODWORD(v125) = 52;
    int v81 = (void *)_os_log_send_and_compose_impl();

    v62 = v73;
    unint64_t v82 = 0x1E4F28000;
    if (v81)
    {
      uint64_t v77 = objc_msgSend(NSString, "stringWithCString:encoding:", v81, 4, &v136, v125);
      free(v81);
      SSFileLog(v75, @"%@", v83, v84, v85, v86, v87, v88, (uint64_t)v77);
      goto LABEL_101;
    }
  }
  else
  {
    v62 = v73;
    unint64_t v82 = 0x1E4F28000uLL;
LABEL_101:
  }
  v45 = [*(id *)(v82 + 3160) errorWithDomain:@"SSVSecureKeyDeliveryErrorDomain" code:-2005 userInfo:v68];
  id v46 = 0;
LABEL_103:

  double v63 = v71;
LABEL_108:

LABEL_109:
  a6 = v126;
LABEL_110:

  if (a6) {
    *a6 = v45;
  }

  return v46;
}

- (double)_expirationTimeForStreamingKeyID:(int64_t)a3 streamingKeyDictionaries:(id)a4
{
  [(SSVSecureKeyDeliveryRequestOperation *)self _timeIntervalForStreamingKeyID:a3 responseKey:@"expiration-time" streamingKeyDictionaries:a4];
  return result;
}

- (double)_playbackStartTimeForStreamingKeyID:(int64_t)a3 streamingKeyDictionaries:(id)a4
{
  [(SSVSecureKeyDeliveryRequestOperation *)self _timeIntervalForStreamingKeyID:a3 responseKey:@"playback-start-time" streamingKeyDictionaries:a4];
  return result;
}

- (void)_sendResponseBlockWithError:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__87;
  uint64_t v12 = __Block_byref_object_dispose__88;
  id v13 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SSVSecureKeyDeliveryRequestOperation__sendResponseBlockWithError___block_invoke;
  v7[3] = &unk_1E5BA6F30;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_barrier_sync(accessQueue, v7);
  uint64_t v6 = v9[5];
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
  _Block_object_dispose(&v8, 8);
}

void __68__SSVSecureKeyDeliveryRequestOperation__sendResponseBlockWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 280) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = 0;
}

- (id)_streamingKeyDictionaryForID:(int64_t)a3 URI:(id)a4 serverPlaybackContextData:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v11 = [NSNumber numberWithLongLong:a3];
  uint64_t v12 = objc_msgSend(v10, "initWithObjectsAndKeys:", v11, @"id", 0);

  if (v8) {
    [v12 setObject:v8 forKey:@"uri"];
  }
  if ([v9 length])
  {
    id v13 = [v9 base64EncodedStringWithOptions:0];
    if ([v13 length]) {
      [v12 setObject:v13 forKey:@"spc"];
    }
  }
  v14 = [(SSVSecureKeyDeliveryRequestOperation *)self rentalId];

  if (v14)
  {
    int v15 = [(SSVSecureKeyDeliveryRequestOperation *)self rentalId];
    [v12 setObject:v15 forKey:@"rental-id"];
  }
  if ([(SSVSecureKeyDeliveryRequestOperation *)self skippedRentalCheckout]) {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKey:@"skipped-rental-checkout"];
  }
  if ([(SSVSecureKeyDeliveryRequestOperation *)self shouldIncludeGUID])
  {
    int v16 = +[SSDevice currentDevice];
    uint64_t v17 = [v16 uniqueDeviceIdentifier];

    if (v17) {
      [v12 setObject:v17 forKey:@"guid"];
    }
  }
  unint64_t v18 = [(SSVSecureKeyDeliveryRequestOperation *)self leaseAction] - 1;
  if (v18 <= 2) {
    [v12 setObject:off_1E5BA80F8[v18] forKey:@"lease-action"];
  }
  if ([(SSVSecureKeyDeliveryRequestOperation *)self offline]) {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKey:@"offline"];
  }

  return v12;
}

- (id)_streamingRequestDictionaryWithStreamingKeyDictionaries:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", &unk_1EF9A97B0, @"version", 0);
  if ([v3 count]) {
    [v4 setObject:v3 forKey:@"streaming-keys"];
  }
  uint64_t v7 = @"fairplay-streaming-request";
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (double)_timeIntervalForStreamingKeyID:(int64_t)a3 responseKey:(id)a4 streamingKeyDictionaries:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = a5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  double v9 = 0.0;
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = [v13 objectForKey:@"id"];
          if (objc_opt_respondsToSelector())
          {
            uint64_t v15 = [v14 longLongValue];
            if (v6)
            {
              if (v15 == a3)
              {
                int v16 = [v13 objectForKey:v6];
                double v9 = 0.0;
                if (objc_opt_respondsToSelector())
                {
                  [v16 doubleValue];
                  double v9 = v17 / 1000.0;
                }

                goto LABEL_17;
              }
            }
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v9;
}

- (NSNumber)rentalId
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setRentalId:(id)a3
{
}

- (BOOL)skippedRentalCheckout
{
  return self->_skippedRentalCheckout;
}

- (void)setSkippedRentalCheckout:(BOOL)a3
{
  self->_skippedRentalCheckout = a3;
}

- (int64_t)leaseAction
{
  return self->_leaseAction;
}

- (void)setLeaseAction:(int64_t)a3
{
  self->_leaseAction = a3;
}

- (BOOL)offline
{
  return self->_offline;
}

- (void)setOffline:(BOOL)a3
{
  self->_offline = a3;
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (double)playbackStartTime
{
  return self->_playbackStartTime;
}

- (SSVSecureKeyDeliveryRequestOperationDelegate)serverPlaybackContextDataDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverPlaybackContextDataDelegate);
  return (SSVSecureKeyDeliveryRequestOperationDelegate *)WeakRetained;
}

- (void)setServerPlaybackContextDataDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serverPlaybackContextDataDelegate);
  objc_storeStrong((id *)&self->_rentalId, 0);
  objc_storeStrong((id *)&self->_serverPlaybackContextData, 0);
  objc_storeStrong((id *)&self->_persistentContentKeyContext, 0);
  objc_storeStrong((id *)&self->_URLBagDictionary, 0);
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_resourceLoadingRequest, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end