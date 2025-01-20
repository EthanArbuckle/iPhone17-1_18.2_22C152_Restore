@interface ICStorePlatformRequest
- (BOOL)returnsLocalEquivalencies;
- (BOOL)shouldIgnoreCache;
- (ICStorePlatformRequest)init;
- (ICStoreRequestContext)requestContext;
- (NSArray)itemIdentifiers;
- (NSArray)queryItems;
- (NSDictionary)HTTPHeaders;
- (NSString)clientBundleIdentifier;
- (NSString)clientBundleVersion;
- (NSString)clientIdentifier;
- (NSString)imageProfile;
- (NSString)keyProfile;
- (NSString)platformIdentifier;
- (NSString)protocolVersion;
- (double)retryDelay;
- (double)timeoutInterval;
- (id)batchResultsHandler;
- (id)copyWithItemIdentifiersInRange:(_NSRange)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)performWithResponseHandler:(id)a3;
- (int64_t)batchSize;
- (int64_t)personalizationStyle;
- (int64_t)qualityOfService;
- (void)setBatchResultsHandler:(id)a3;
- (void)setBatchSize:(int64_t)a3;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setClientBundleVersion:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setImageProfile:(id)a3;
- (void)setItemIdentifiers:(id)a3;
- (void)setKeyProfile:(id)a3;
- (void)setPersonalizationStyle:(int64_t)a3;
- (void)setPlatformIdentifier:(id)a3;
- (void)setProtocolVersion:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRequestContext:(id)a3;
- (void)setRetryDelay:(double)a3;
- (void)setReturnsLocalEquivalencies:(BOOL)a3;
- (void)setShouldIgnoreCache:(BOOL)a3;
- (void)setTimeoutInterval:(double)a3;
@end

@implementation ICStorePlatformRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_platformIdentifier, 0);
  objc_storeStrong((id *)&self->_keyProfile, 0);
  objc_storeStrong((id *)&self->_imageProfile, 0);
  objc_storeStrong(&self->_batchResultsHandler, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientBundleVersion, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)setRequestContext:(id)a3
{
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setShouldIgnoreCache:(BOOL)a3
{
  self->_shouldIgnoreCache = a3;
}

- (BOOL)shouldIgnoreCache
{
  return self->_shouldIgnoreCache;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setReturnsLocalEquivalencies:(BOOL)a3
{
  self->_returnsLocalEquivalencies = a3;
}

- (BOOL)returnsLocalEquivalencies
{
  return self->_returnsLocalEquivalencies;
}

- (void)setRetryDelay:(double)a3
{
  self->_retryDelay = a3;
}

- (double)retryDelay
{
  return self->_retryDelay;
}

- (void)setProtocolVersion:(id)a3
{
}

- (void)setPlatformIdentifier:(id)a3
{
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  self->_personalizationStyle = a3;
}

- (int64_t)personalizationStyle
{
  return self->_personalizationStyle;
}

- (void)setKeyProfile:(id)a3
{
}

- (void)setImageProfile:(id)a3
{
}

- (void)setBatchResultsHandler:(id)a3
{
}

- (id)batchResultsHandler
{
  return self->_batchResultsHandler;
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setItemIdentifiers:(id)a3
{
}

- (void)setClientBundleVersion:(id)a3
{
}

- (NSString)clientBundleVersion
{
  return self->_clientBundleVersion;
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [self->_batchResultsHandler copyWithZone:a3];
    v7 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v6;

    *(void *)(v5 + 48) = self->_batchSize;
    uint64_t v8 = [(NSString *)self->_clientIdentifier copyWithZone:a3];
    v9 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v8;

    uint64_t v10 = [(NSString *)self->_imageProfile copyWithZone:a3];
    v11 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v10;

    uint64_t v12 = [(NSArray *)self->_itemIdentifiers copyWithZone:a3];
    v13 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;

    uint64_t v14 = [(NSString *)self->_keyProfile copyWithZone:a3];
    v15 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v14;

    *(void *)(v5 + 80) = self->_personalizationStyle;
    uint64_t v16 = [(NSString *)self->_platformIdentifier copyWithZone:a3];
    v17 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v16;

    uint64_t v18 = [(NSString *)self->_protocolVersion copyWithZone:a3];
    v19 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v18;

    id v20 = [(ICRequestContext *)self->_requestContext copyWithZone:a3];
    v21 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v20;

    *(double *)(v5 + 104) = self->_retryDelay;
    *(unsigned char *)(v5 + 8) = self->_returnsLocalEquivalencies;
    *(void *)(v5 + 120) = self->_qualityOfService;
    *(double *)(v5 + 112) = self->_timeoutInterval;
    *(unsigned char *)(v5 + 9) = self->_shouldIgnoreCache;
  }
  return (id)v5;
}

- (NSArray)queryItems
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:7];
  v4 = [(ICStorePlatformRequest *)self clientIdentifier];
  if ([v4 length])
  {
    uint64_t v5 = [MEMORY[0x1E4F290C8] queryItemWithName:@"caller" value:v4];
    [v3 addObject:v5];
  }
  uint64_t v6 = [(NSArray *)self->_itemIdentifiers componentsJoinedByString:@","];
  if ([v6 length])
  {
    v7 = [MEMORY[0x1E4F290C8] queryItemWithName:@"id" value:v6];
    [v3 addObject:v7];
  }
  uint64_t v8 = [(ICStorePlatformRequest *)self keyProfile];
  if ([v8 length])
  {
    v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"p" value:v8];
    [v3 addObject:v9];
  }
  if ([(ICStorePlatformRequest *)self returnsLocalEquivalencies])
  {
    uint64_t v10 = [MEMORY[0x1E4F290C8] queryItemWithName:@"e" value:@"true"];
    [v3 addObject:v10];
  }
  if ([(NSString *)self->_imageProfile length])
  {
    v11 = [MEMORY[0x1E4F290C8] queryItemWithName:@"artwork" value:self->_imageProfile];
    [v3 addObject:v11];
  }
  if ([(NSString *)self->_platformIdentifier length])
  {
    uint64_t v12 = [MEMORY[0x1E4F290C8] queryItemWithName:@"platform" value:self->_platformIdentifier];
    [v3 addObject:v12];
  }
  v13 = [(ICStorePlatformRequest *)self protocolVersion];
  if ([v13 length])
  {
    uint64_t v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"version" value:v13];
    [v3 addObject:v14];
  }

  return (NSArray *)v3;
}

- (NSDictionary)HTTPHeaders
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  if ((unint64_t)(self->_personalizationStyle - 1) <= 1)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F28C10];
    id v6 = v4;
    id v7 = objc_alloc_init(v5);
    [v7 setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v7 setLocale:v8];
    v9 = [v7 stringFromDate:v6];

    if ([v9 length]) {
      [v3 setObject:v9 forKey:@"X-Request-TimeStamp"];
    }
  }

  return (NSDictionary *)v3;
}

- (id)copyWithItemIdentifiersInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = (void *)[(ICStorePlatformRequest *)self copy];
  if (v6)
  {
    uint64_t v7 = -[NSArray subarrayWithRange:](self->_itemIdentifiers, "subarrayWithRange:", location, length);
    uint64_t v8 = (void *)v6[5];
    v6[5] = v7;
  }
  return v6;
}

- (void)setBatchSize:(int64_t)a3
{
  if (a3 >= 101) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Batch size must be <= %ld", 100);
  }
  int64_t v5 = 100;
  if (a3 < 100) {
    int64_t v5 = a3;
  }
  self->_batchSize = v5;
}

- (NSString)protocolVersion
{
  if ([(NSString *)self->_protocolVersion length]) {
    v3 = self->_protocolVersion;
  }
  else {
    v3 = @"2";
  }

  return (NSString *)v3;
}

- (NSString)platformIdentifier
{
  if (self->_platformIdentifier) {
    return self->_platformIdentifier;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (id)performWithResponseHandler:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v5 = [(NSArray *)self->_itemIdentifiers count];
    id v6 = [(ICStorePlatformRequest *)self keyProfile];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v72 = v6;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing platform request of %ld items with profile '%{public}@'", buf, 0x20u);
  }
  uint64_t v7 = +[ICURLSessionManager sharedSessionManager];
  p_qualityOfService = &self->_qualityOfService;
  v39 = [v7 sessionWithQualityOfService:self->_qualityOfService];

  group = dispatch_group_create();
  id val = objc_alloc_init(MEMORY[0x1E4F28F08]);
  unint64_t v9 = [v39 maxConcurrentRequests];
  uint64_t v10 = v9 - 1;
  if (v9 - 1 >= 5) {
    uint64_t v10 = 5;
  }
  if (v9 <= 2) {
    unint64_t v11 = v9;
  }
  else {
    unint64_t v11 = v10;
  }
  [val setMaxConcurrentOperationCount:v11];
  [val setName:@"com.apple.iTunesCloud.ICStorePlatformRequest.operationQueue"];
  [val setQualityOfService:*p_qualityOfService];
  int64_t batchSize = self->_batchSize;
  v36 = [(ICStorePlatformRequest *)self keyProfile];
  int v13 = [v36 isEqualToString:@"lockup"];
  uint64_t v14 = 50;
  if (v13) {
    uint64_t v14 = 100;
  }
  if (v14 >= batchSize) {
    uint64_t v15 = batchSize;
  }
  else {
    uint64_t v15 = v14;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v72 = __Block_byref_object_copy__9616;
  v73 = __Block_byref_object_dispose__9617;
  id v74 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x2020000000;
  v70[3] = 0;
  v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v18 = dispatch_queue_attr_make_with_qos_class(v17, *(dispatch_qos_class_t *)p_qualityOfService, 0);
  queue = dispatch_queue_create("com.apple.iTunesCloud.ICStorePlatformRequest.union", v18);

  v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v20 = dispatch_queue_attr_make_with_qos_class(v19, *(dispatch_qos_class_t *)p_qualityOfService, 0);
  dispatch_queue_t v40 = dispatch_queue_create("com.apple.iTunesCloud.ICStorePlatformRequest.callout", v20);

  v21 = [ICStorePlatformResponse alloc];
  v22 = [(ICStorePlatformResponse *)v21 initWithResponseDictionary:MEMORY[0x1E4F1CC08]];
  uint64_t v23 = [(NSArray *)self->_itemIdentifiers count];
  if (v23 >= 1)
  {
    for (uint64_t i = 0; i < v23; i += v15)
      [v16 addObject:v22];
  }
  v25 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(v16, "count"));
  [v25 setCancellable:1];
  objc_initWeak(&location, val);
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  char v68 = 0;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke;
  v63[3] = &unk_1E5AC7FC8;
  objc_copyWeak(&v66, &location);
  v65 = v67;
  v63[4] = queue;
  v63[5] = v40;
  id v35 = v3;
  id v64 = v35;
  [v25 setCancellationHandler:v63];
  v37 = (void *)MEMORY[0x1A6240BF0](self->_batchResultsHandler);
  if (v23 > 0)
  {
    uint64_t v26 = 0;
    uint64_t v27 = v23;
    do
    {
      if (v15 >= v27) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = v15;
      }
      id v29 = -[ICStorePlatformRequest copyWithItemIdentifiersInRange:](self, "copyWithItemIdentifiersInRange:", v26, v28);
      v30 = [[ICStorePlatformRequestOperation alloc] initWithPlatformRequest:v29 usingURLSession:v39];
      dispatch_group_enter(group);
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_4;
      v53[3] = &unk_1E5AC8018;
      v53[4] = group;
      v53[5] = queue;
      id v54 = v25;
      id v55 = v16;
      v59 = buf;
      id v57 = v29;
      v58 = v37;
      v60 = v70;
      v61 = v67;
      uint64_t v62 = v26 / v15;
      dispatch_queue_t v56 = v40;
      [(ICStorePlatformRequestOperation *)v30 setResponseHandler:v53];
      [val addOperation:v30];

      v26 += v15;
      v27 -= v15;
    }
    while (v26 < v23);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_7;
  block[3] = &unk_1E5AC8040;
  id v45 = val;
  dispatch_queue_t v46 = v40;
  v51 = v70;
  v52 = buf;
  id v49 = v35;
  v50 = v67;
  v47 = self;
  id v48 = v16;
  id v31 = v35;
  id v32 = val;
  dispatch_group_notify(group, queue, block);
  id v33 = v25;

  objc_destroyWeak(&v66);
  _Block_object_dispose(v67, 8);
  objc_destroyWeak(&location);

  _Block_object_dispose(v70, 8);
  _Block_object_dispose(buf, 8);

  return v33;
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained cancelAllOperations];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_2;
  block[3] = &unk_1E5ACB0E8;
  id v3 = *(NSObject **)(a1 + 32);
  void block[4] = *(void *)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v7 = v5;
  dispatch_async(v3, block);
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_7(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_8;
    block[3] = &unk_1E5ACA0E0;
    id v3 = *(NSObject **)(a1 + 40);
    void block[4] = *(void *)(a1 + 48);
    long long v7 = *(_OWORD *)(a1 + 80);
    id v4 = *(id *)(a1 + 64);
    void block[5] = *(void *)(a1 + 56);
    id v6 = v4;
    dispatch_async(v3, block);
  }
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = *(NSObject **)(a1 + 32);
  uint64_t v8 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_5;
  block[3] = &unk_1E5AC7FF0;
  id v22 = *(id *)(a1 + 48);
  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 88);
  id v23 = v9;
  uint64_t v26 = v10;
  id v11 = v5;
  uint64_t v12 = *(void *)(a1 + 56);
  id v24 = v11;
  uint64_t v25 = v12;
  uint64_t v13 = *(void *)(a1 + 112);
  uint64_t v27 = *(void *)(a1 + 96);
  uint64_t v28 = v13;
  dispatch_group_async(v7, v8, block);
  uint64_t v14 = *(void *)(a1 + 80);
  if (v14 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_6;
    v17[3] = &unk_1E5ACD2A0;
    id v16 = *(NSObject **)(a1 + 64);
    uint64_t v15 = *(void *)(a1 + 72);
    uint64_t v20 = v14;
    v17[4] = v15;
    id v18 = v11;
    id v19 = v9;
    dispatch_async(v16, v17);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  id v2 = *(void **)(a1 + 40);
  if (v2) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v2);
  }
  if (*(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 56), "replaceObjectAtIndex:withObject:", *(void *)(a1 + 80));
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = [*(id *)(a1 + 32) itemIdentifiers];
  (*(void (**)(uint64_t, id, void, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_8(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v5 = *(void *)(*(void *)(a1[8] + 8) + 40);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Request completed with %ld responses. err=%{public}@", (uint8_t *)&v7, 0x20u);
  }

  if (*(void *)(*(void *)(a1[7] + 8) + 24))
  {
    id v6 = [[ICStorePlatformResponseGroup alloc] initWithResponses:a1[5]];
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_3;
    block[3] = &unk_1E5ACD170;
    uint64_t v2 = *(NSObject **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    dispatch_async(v2, block);
  }
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7004 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (NSString)keyProfile
{
  if (self->_keyProfile) {
    return self->_keyProfile;
  }
  else {
    return (NSString *)@"lockup";
  }
}

- (NSArray)itemIdentifiers
{
  if (self->_itemIdentifiers) {
    return self->_itemIdentifiers;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (NSString)imageProfile
{
  if (self->_imageProfile) {
    return self->_imageProfile;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSString)clientIdentifier
{
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
  {
    uint64_t v3 = clientIdentifier;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v5 = [v4 bundleIdentifier];

    if ([v5 length])
    {
      uint64_t v3 = v5;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v3 = [v6 processName];
    }
  }

  return v3;
}

- (ICStorePlatformRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICStorePlatformRequest;
  result = [(ICStorePlatformRequest *)&v3 init];
  if (result)
  {
    result->_int64_t batchSize = 100;
    result->_qualityOfService = 25;
    *(_OWORD *)&result->_retryDelay = xmmword_1A3032C10;
  }
  return result;
}

@end