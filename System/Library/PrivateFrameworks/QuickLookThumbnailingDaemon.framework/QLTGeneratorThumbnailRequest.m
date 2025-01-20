@interface QLTGeneratorThumbnailRequest
- (BOOL)cacheEnabled;
- (BOOL)cancelled;
- (BOOL)didCheckCache;
- (BOOL)hasHandledAllRequestedTypesOrMostRepresentativeType;
- (BOOL)isDownloaded;
- (BOOL)isDownloadedKnown;
- (BOOL)isUbiquitous;
- (BOOL)isUbiquitousKnown;
- (BOOL)needsLowQualityThumbnailGeneration;
- (BOOL)shouldGenerateLowQualityThumbnailOnCacheMiss;
- (FPItem)item;
- (NSError)generationError;
- (NSNumber)requestBadgeType;
- (NSSet)allowedTypesForGeneration;
- (NSString)clientApplicationIdentifier;
- (NSURL)taggedLogicalURL;
- (OS_dispatch_group)batchDispatchGroup;
- (OS_os_activity)activity;
- (OS_os_activity)topActivity;
- (QLDiskStore)diskStore;
- (QLIncrementalThumbnailGenerationHandler)generationHandler;
- (QLPreviewThumbnailGenerator)generator;
- (QLTGeneratorThumbnailRequest)initWithRequest:(id)a3 generationHandler:(id)a4;
- (QLThumbnailGenerationRequest)request;
- (id)description;
- (id)downloadCompletionHandler;
- (int64_t)compare:(id)a3;
- (int64_t)extensionMatchingType;
- (unint64_t)_requestedTypesForRepresentationType:(int64_t)a3;
- (unint64_t)badgeType;
- (unint64_t)handledRequestedTypes;
- (unint64_t)successfullyHandldedRequestedTypes;
- (unint64_t)unhandledRequestedTypes;
- (void)_adjustRequestInformationIfNeeded;
- (void)addTypeToHandledTypes:(int64_t)a3;
- (void)addTypeToSuccessfullyHandledTypes:(int64_t)a3;
- (void)cancel;
- (void)computeUbiquitousnessWithCompletionHandler:(id)a3;
- (void)fetchFPItemWithCompletionHandler:(id)a3;
- (void)fetchURLWithCompletionHandler:(id)a3;
- (void)setActivity:(id)a3;
- (void)setAllowedTypesForGeneration:(id)a3;
- (void)setBatchDispatchGroup:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setClientApplicationIdentifier:(id)a3;
- (void)setDidCheckCache:(BOOL)a3;
- (void)setDiskStore:(id)a3;
- (void)setDownloadCompletionHandler:(id)a3;
- (void)setExtensionMatchingType:(int64_t)a3;
- (void)setGenerationError:(id)a3;
- (void)setGenerator:(id)a3;
- (void)setHandledRequestedTypes:(unint64_t)a3;
- (void)setIsDownloaded:(BOOL)a3;
- (void)setIsDownloadedKnown:(BOOL)a3;
- (void)setIsUbiquitous:(BOOL)a3;
- (void)setIsUbiquitousKnown:(BOOL)a3;
- (void)setItem:(id)a3;
- (void)setRequestBadgeType:(id)a3;
- (void)setSuccessfullyHandldedRequestedTypes:(unint64_t)a3;
- (void)setTaggedLogicalURL:(id)a3;
- (void)setTopActivity:(id)a3;
@end

@implementation QLTGeneratorThumbnailRequest

- (void)setClientApplicationIdentifier:(id)a3
{
}

- (BOOL)hasHandledAllRequestedTypesOrMostRepresentativeType
{
  QLThumbnailGenerationRequestRepresentationTypes v3 = [(QLThumbnailGenerationRequest *)self->_request representationTypes] & 6;
  unint64_t handledRequestedTypes = self->_handledRequestedTypes;
  char v6 = handledRequestedTypes >= v3 || v3 < 2 * handledRequestedTypes;
  v7 = [(QLTGeneratorThumbnailRequest *)self request];
  if ([v7 provideCachedResultsOnly])
  {
    BOOL v8 = [(QLTGeneratorThumbnailRequest *)self didCheckCache];

    v6 |= v8;
  }
  else
  {
  }
  if (handledRequestedTypes == v3) {
    return 1;
  }
  else {
    return v6;
  }
}

- (OS_os_activity)topActivity
{
  return (OS_os_activity *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTopActivity:(id)a3
{
}

- (void)setBatchDispatchGroup:(id)a3
{
}

- (void)setActivity:(id)a3
{
}

- (BOOL)cacheEnabled
{
  QLThumbnailGenerationRequestRepresentationTypes v3 = [(QLTGeneratorThumbnailRequest *)self diskStore];

  if (!v3) {
    return ([(QLThumbnailGenerationRequest *)self->_request isDataBased] & 1) == 0;
  }
  v4 = [(QLTGeneratorThumbnailRequest *)self request];
  if ([v4 isFileBased])
  {
    v5 = [(QLTGeneratorThumbnailRequest *)self diskStore];
    char v6 = [v5 hasThumbnailCache];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (QLDiskStore)diskStore
{
  return (QLDiskStore *)objc_getProperty(self, a2, 152, 1);
}

- (void)addTypeToHandledTypes:(int64_t)a3
{
  unint64_t handledRequestedTypes = self->_handledRequestedTypes;
  self->_unint64_t handledRequestedTypes = [(QLTGeneratorThumbnailRequest *)self _requestedTypesForRepresentationType:a3] | handledRequestedTypes;
}

- (void)addTypeToSuccessfullyHandledTypes:(int64_t)a3
{
  unint64_t successfullyHandldedRequestedTypes = self->_successfullyHandldedRequestedTypes;
  self->_unint64_t successfullyHandldedRequestedTypes = [(QLTGeneratorThumbnailRequest *)self _requestedTypesForRepresentationType:a3] | successfullyHandldedRequestedTypes;
}

- (unint64_t)_requestedTypesForRepresentationType:(int64_t)a3
{
  unint64_t v3 = 1;
  if (a3 == 1) {
    unint64_t v3 = 2;
  }
  if (a3 == 2) {
    return 4;
  }
  else {
    return v3;
  }
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (OS_dispatch_group)batchDispatchGroup
{
  return self->_batchDispatchGroup;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (OS_os_activity)activity
{
  return (OS_os_activity *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDidCheckCache:(BOOL)a3
{
  self->_didCheckCache = a3;
}

- (QLThumbnailGenerationRequest)request
{
  return self->_request;
}

- (QLIncrementalThumbnailGenerationHandler)generationHandler
{
  return self->_generationHandler;
}

- (BOOL)needsLowQualityThumbnailGeneration
{
  int v3 = [(QLThumbnailGenerationRequest *)self->_request provideLowQualityThumbnail];
  if (v3) {
    LOBYTE(v3) = self->_handledRequestedTypes == *MEMORY[0x1E4F3A740];
  }
  return v3;
}

- (QLTGeneratorThumbnailRequest)initWithRequest:(id)a3 generationHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)QLTGeneratorThumbnailRequest;
  v9 = [(QLTGeneratorThumbnailRequest *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_generationHandler, a4);
    v10->_unint64_t handledRequestedTypes = *MEMORY[0x1E4F3A740];
    v11 = [v7 quicklookSandboxWrapper];
    v12 = [v11 url];

    if (v12)
    {
      int v13 = [v12 startAccessingSecurityScopedResource];
      uint64_t v14 = +[QLDiskStore diskStoreForURL:v12];
      diskStore = v10->_diskStore;
      v10->_diskStore = (QLDiskStore *)v14;

      if (v13) {
        [v12 stopAccessingSecurityScopedResource];
      }
    }
    [(QLTGeneratorThumbnailRequest *)v10 _adjustRequestInformationIfNeeded];
  }
  return v10;
}

- (void)_adjustRequestInformationIfNeeded
{
  self->_badgeType = 0;
  if ([(QLThumbnailGenerationRequest *)self->_request badgeType] == 1)
  {
    int v3 = [(QLThumbnailGenerationRequest *)self->_request contentType];
    if ([v3 conformsToType:*MEMORY[0x1E4F44500]])
    {
    }
    else
    {
      v4 = [(QLThumbnailGenerationRequest *)self->_request contentType];
      int v5 = [v4 conformsToType:*MEMORY[0x1E4F444B0]];

      if (!v5) {
        return;
      }
    }
    char v6 = +[QLThumbnailExtensionMonitor shared];
    id v7 = [v6 bestExtensionFor:self->_request matching:3];
    int v8 = [v7 supportsInteractiveThumbnailBadges];

    if (v8) {
      self->_badgeType = [(QLThumbnailGenerationRequest *)self->_request badgeType];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskStore, 0);
  objc_storeStrong((id *)&self->_requestBadgeType, 0);
  objc_storeStrong(&self->_downloadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_allowedTypesForGeneration, 0);
  objc_storeStrong((id *)&self->_clientApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_taggedLogicalURL, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_topActivity, 0);
  objc_storeStrong((id *)&self->_generationHandler, 0);
  objc_storeStrong((id *)&self->_generationError, 0);
  objc_storeStrong((id *)&self->_batchDispatchGroup, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (BOOL)shouldGenerateLowQualityThumbnailOnCacheMiss
{
  return 0;
}

- (unint64_t)unhandledRequestedTypes
{
  return [(QLThumbnailGenerationRequest *)self->_request representationTypes] & ~LODWORD(self->_handledRequestedTypes) & 6;
}

- (void)cancel
{
  [(QLTGeneratorThumbnailRequest *)self setCancelled:1];
  [(QLThumbnailGenerationRequest *)self->_request cancel];
  id v3 = [(QLTGeneratorThumbnailRequest *)self generator];
  [v3 cancel];
}

- (int64_t)compare:(id)a3
{
  request = self->_request;
  v4 = [a3 request];
  int64_t v5 = [(QLThumbnailGenerationRequest *)request compare:v4];

  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  request = self->_request;
  taggedLogicalURL = self->_taggedLogicalURL;
  item = self->_item;
  unint64_t handledRequestedTypes = self->_handledRequestedTypes;
  unint64_t badgeType = self->_badgeType;
  if ([(QLTGeneratorThumbnailRequest *)self needsLowQualityThumbnailGeneration]) {
    v10 = @"(low quality)";
  }
  else {
    v10 = &stru_1F39B7010;
  }
  v11 = [(QLTGeneratorThumbnailRequest *)self clientApplicationIdentifier];
  v12 = (void *)[v3 initWithFormat:@"<%@: %@, url: %@, item: %@, ht:%lu bt:%lu %@ client:%@>", v4, request, taggedLogicalURL, item, handledRequestedTypes, badgeType, v10, v11];

  return v12;
}

- (void)fetchURLWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  int64_t v5 = [(QLTGeneratorThumbnailRequest *)self request];
  int v6 = [v5 isDataBased];

  if (v6) {
    goto LABEL_4;
  }
  id v7 = [(QLTGeneratorThumbnailRequest *)self request];
  int v8 = [v7 quicklookSandboxWrapper];

  v9 = [(QLTGeneratorThumbnailRequest *)self request];
  v10 = v9;
  if (v8)
  {
    v11 = [v9 quicklookSandboxWrapper];
    v12 = [v11 url];
    [(QLTGeneratorThumbnailRequest *)self setTaggedLogicalURL:v12];

LABEL_4:
    v4[2](v4, 0);
    goto LABEL_5;
  }
  int v13 = [v9 item];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F25D38] defaultManager];
    v15 = [(QLTGeneratorThumbnailRequest *)self request];
    v16 = [v15 item];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__QLTGeneratorThumbnailRequest_fetchURLWithCompletionHandler___block_invoke;
    v23[3] = &unk_1E6D0CBA0;
    v23[4] = self;
    v24 = v4;
    [v14 fetchURLForItem:v16 completionHandler:v23];
  }
  else
  {
    objc_super v17 = _log_6();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[QLTGeneratorThumbnailRequest fetchURLWithCompletionHandler:]((uint64_t)self, v17);
    }

    v18 = [(QLTGeneratorThumbnailRequest *)self request];
    if (([v18 isDataBased] & 1) == 0)
    {
      v19 = [(QLTGeneratorThumbnailRequest *)self request];
      v20 = [v19 quicklookSandboxWrapper];
      if (!v20)
      {
        v21 = [(QLTGeneratorThumbnailRequest *)self request];
        v22 = [v21 item];
        if (!v22) {
          -[QLTGeneratorThumbnailRequest fetchURLWithCompletionHandler:]();
        }
      }
    }
  }
LABEL_5:
}

void __62__QLTGeneratorThumbnailRequest_fetchURLWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setTaggedLogicalURL:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)computeUbiquitousnessWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  int64_t v5 = [(QLTGeneratorThumbnailRequest *)self request];
  id v6 = [v5 item];

  id v7 = [(QLTGeneratorThumbnailRequest *)self request];
  int v8 = v7;
  if (v6)
  {
    v9 = [v7 item];

    uint64_t v10 = 1;
    [(QLTGeneratorThumbnailRequest *)self setIsUbiquitous:1];
    [(QLTGeneratorThumbnailRequest *)self setIsUbiquitousKnown:1];
    [(QLTGeneratorThumbnailRequest *)self setIsDownloadedKnown:1];
    if ([v9 isCloudItem]) {
      uint64_t v10 = [v9 isDownloaded];
    }
    [(QLTGeneratorThumbnailRequest *)self setIsDownloaded:v10];
    v11 = [v9 fileURL];

    if (v11)
    {
      v12 = [v9 fileURL];
      [(QLTGeneratorThumbnailRequest *)self setTaggedLogicalURL:v12];

      int v13 = [(QLTGeneratorThumbnailRequest *)self taggedLogicalURL];
      id v22 = 0;
      LODWORD(v12) = [v13 _QLIsThumbnailableWithError:&v22];
      id v14 = v22;

      if (v12) {
        id v15 = 0;
      }
      else {
        id v15 = v14;
      }
      ((void (**)(id, id))v4)[2](v4, v15);
    }
    else if ([(QLTGeneratorThumbnailRequest *)self isDownloaded])
    {
      objc_super v17 = [MEMORY[0x1E4F25D38] defaultManager];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __75__QLTGeneratorThumbnailRequest_computeUbiquitousnessWithCompletionHandler___block_invoke;
      v20[3] = &unk_1E6D0CBA0;
      v20[4] = self;
      v21 = v4;
      [v17 fetchURLForItem:v9 completionHandler:v20];
    }
    else
    {
      v4[2](v4, 0);
    }
  }
  else
  {
    int v16 = [v7 isDataBased];

    if (v16)
    {
      [(QLTGeneratorThumbnailRequest *)self setIsDownloaded:1];
      [(QLTGeneratorThumbnailRequest *)self setIsDownloadedKnown:1];
      [(QLTGeneratorThumbnailRequest *)self setIsUbiquitous:0];
      [(QLTGeneratorThumbnailRequest *)self setIsUbiquitousKnown:0];
      v4[2](v4, 0);
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __75__QLTGeneratorThumbnailRequest_computeUbiquitousnessWithCompletionHandler___block_invoke_2;
      v18[3] = &unk_1E6D0C6D8;
      v18[4] = self;
      v19 = v4;
      [(QLTGeneratorThumbnailRequest *)self fetchURLWithCompletionHandler:v18];
    }
  }
}

void __75__QLTGeneratorThumbnailRequest_computeUbiquitousnessWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setTaggedLogicalURL:v5];
  if (v5)
  {
    id v8 = 0;
    [v5 _QLIsThumbnailableWithError:&v8];
    id v7 = v8;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __75__QLTGeneratorThumbnailRequest_computeUbiquitousnessWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_5:
    v3();
    return;
  }
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = [*(id *)(a1 + 32) taggedLogicalURL];
  int v6 = [v5 _QLIsDataLess];

  id v7 = *v4;
  if (v6)
  {
    [v7 setIsDownloaded:0];
    [*(id *)(a1 + 32) setIsDownloadedKnown:1];
    [*(id *)(a1 + 32) setIsUbiquitous:1];
    [*(id *)(a1 + 32) setIsUbiquitousKnown:1];
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  [v7 setIsDownloaded:1];
  [*v4 setIsDownloadedKnown:1];
  id v8 = [*v4 taggedLogicalURL];
  id v22 = 0;
  char v9 = [v8 _QLIsThumbnailableWithError:&v22];
  id v10 = v22;

  if (v9)
  {
    v11 = [*v4 taggedLogicalURL];
    uint64_t v12 = *MEMORY[0x1E4F1C758];
    uint64_t v13 = *MEMORY[0x1E4F1C690];
    v23[0] = *MEMORY[0x1E4F1C758];
    v23[1] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v21 = 0;
    id v15 = [v11 promisedItemResourceValuesForKeys:v14 error:&v21];
    id v16 = v21;

    if (v15)
    {
      objc_super v17 = [v15 objectForKeyedSubscript:v12];
      v18 = [v15 objectForKeyedSubscript:v13];
      objc_msgSend(*v4, "setIsUbiquitous:", objc_msgSend(v18, "BOOLValue"));
      [*v4 setIsUbiquitousKnown:1];
      BOOL v19 = ![v18 BOOLValue]
         || v17 && ([v17 isEqualToString:*MEMORY[0x1E4F1C760]] & 1) == 0;
      [*(id *)(a1 + 32) setIsDownloadedKnown:1];
      [*(id *)(a1 + 32) setIsDownloaded:v19];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v20 = _log_6();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __75__QLTGeneratorThumbnailRequest_computeUbiquitousnessWithCompletionHandler___block_invoke_2_cold_1((id *)(a1 + 32), (uint64_t)v16, v20);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchFPItemWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  id v5 = [(QLTGeneratorThumbnailRequest *)self item];

  if (v5) {
    goto LABEL_4;
  }
  int v6 = [(QLTGeneratorThumbnailRequest *)self request];
  id v7 = [v6 item];

  id v8 = [(QLTGeneratorThumbnailRequest *)self request];
  char v9 = v8;
  if (v7)
  {
    id v10 = [v8 item];
    [(QLTGeneratorThumbnailRequest *)self setItem:v10];

LABEL_4:
    v4[2](v4, 0);
    goto LABEL_5;
  }
  if ([v8 isDataBased]) {
    -[QLTGeneratorThumbnailRequest fetchFPItemWithCompletionHandler:]();
  }

  v11 = [(QLTGeneratorThumbnailRequest *)self taggedLogicalURL];

  if (!v11)
  {
    uint64_t v12 = [(QLTGeneratorThumbnailRequest *)self request];
    uint64_t v13 = [v12 quicklookSandboxWrapper];
    id v14 = [v13 url];
    [(QLTGeneratorThumbnailRequest *)self setTaggedLogicalURL:v14];
  }
  id v15 = [MEMORY[0x1E4F25D38] defaultManager];
  id v16 = [(QLTGeneratorThumbnailRequest *)self taggedLogicalURL];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__QLTGeneratorThumbnailRequest_fetchFPItemWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E6D0CBC8;
  v17[4] = self;
  v18 = v4;
  [v15 fetchItemForURL:v16 completionHandler:v17];

LABEL_5:
}

void __65__QLTGeneratorThumbnailRequest_fetchFPItemWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _log_6();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__QLTGeneratorThumbnailRequest_fetchFPItemWithCompletionHandler___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }
  }
  [*(id *)(a1 + 32) setItem:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (QLPreviewThumbnailGenerator)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (NSError)generationError
{
  return self->_generationError;
}

- (void)setGenerationError:(id)a3
{
}

- (unint64_t)handledRequestedTypes
{
  return self->_handledRequestedTypes;
}

- (void)setHandledRequestedTypes:(unint64_t)a3
{
  self->_unint64_t handledRequestedTypes = a3;
}

- (BOOL)didCheckCache
{
  return self->_didCheckCache;
}

- (unint64_t)successfullyHandldedRequestedTypes
{
  return self->_successfullyHandldedRequestedTypes;
}

- (void)setSuccessfullyHandldedRequestedTypes:(unint64_t)a3
{
  self->_unint64_t successfullyHandldedRequestedTypes = a3;
}

- (NSURL)taggedLogicalURL
{
  return (NSURL *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTaggedLogicalURL:(id)a3
{
}

- (FPItem)item
{
  return (FPItem *)objc_getProperty(self, a2, 104, 1);
}

- (void)setItem:(id)a3
{
}

- (BOOL)isUbiquitousKnown
{
  return self->_isUbiquitousKnown;
}

- (void)setIsUbiquitousKnown:(BOOL)a3
{
  self->_isUbiquitousKnown = a3;
}

- (BOOL)isDownloadedKnown
{
  return self->_isDownloadedKnown;
}

- (void)setIsDownloadedKnown:(BOOL)a3
{
  self->_isDownloadedKnown = a3;
}

- (BOOL)isUbiquitous
{
  return self->_isUbiquitous;
}

- (void)setIsUbiquitous:(BOOL)a3
{
  self->_isUbiquitous = a3;
}

- (BOOL)isDownloaded
{
  return self->_isDownloaded;
}

- (void)setIsDownloaded:(BOOL)a3
{
  self->_isDownloaded = a3;
}

- (NSString)clientApplicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSSet)allowedTypesForGeneration
{
  return self->_allowedTypesForGeneration;
}

- (void)setAllowedTypesForGeneration:(id)a3
{
}

- (int64_t)extensionMatchingType
{
  return self->_extensionMatchingType;
}

- (void)setExtensionMatchingType:(int64_t)a3
{
  self->_extensionMatchingType = a3;
}

- (id)downloadCompletionHandler
{
  return objc_getProperty(self, a2, 136, 1);
}

- (void)setDownloadCompletionHandler:(id)a3
{
}

- (NSNumber)requestBadgeType
{
  return self->_requestBadgeType;
}

- (void)setRequestBadgeType:(id)a3
{
}

- (void)setDiskStore:(id)a3
{
}

- (void)fetchURLWithCompletionHandler:.cold.1()
{
  __assert_rtn("-[QLTGeneratorThumbnailRequest fetchURLWithCompletionHandler:]", "QLTGeneratorThumbnailRequest.m", 202, "self.request.isDataBased || (self.request.quicklookSandboxWrapper != nil) || (self.request.item != nil)");
}

- (void)fetchURLWithCompletionHandler:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_ERROR, "No URL or FPItem for request %@", (uint8_t *)&v2, 0xCu);
}

void __75__QLTGeneratorThumbnailRequest_computeUbiquitousnessWithCompletionHandler___block_invoke_2_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [*a1 taggedLogicalURL];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1DDC5E000, a3, OS_LOG_TYPE_ERROR, "Could not retrieve the downloading status of %@: %@", (uint8_t *)&v6, 0x16u);
}

- (void)fetchFPItemWithCompletionHandler:.cold.1()
{
}

void __65__QLTGeneratorThumbnailRequest_fetchFPItemWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "Could not fetch FPItem for %@: %@", (uint8_t *)&v4, 0x16u);
}

@end