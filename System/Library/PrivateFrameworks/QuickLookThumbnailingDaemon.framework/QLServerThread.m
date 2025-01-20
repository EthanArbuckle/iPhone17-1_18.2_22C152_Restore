@interface QLServerThread
+ (id)sharedInstance;
+ (void)updateThumbnailRequestThumbnailVersionWithThirdPartyGeneratorInformationIfNeeded:(id)a3;
- (BOOL)_canUseAdditionToProvideThumbnail:(id)a3 forThumbnailRequest:(id)a4 taggedLogicalURL:(id)a5;
- (BOOL)_saveResultForThumbnailRequest:(id)a3 withImage:(id)a4 error:(id *)a5;
- (BOOL)downloadThumbnails:(id)a3 forProvider:(id)a4;
- (CGImage)_createUndecoratedAppIconForData:(id)a3 ofSize:(CGSize)a4 scale:(double)a5;
- (NSMutableDictionary)domainsToCaches;
- (NSMutableDictionary)externalThumbnailCacheAvailablePendingBlocks;
- (NSMutableDictionary)externalThumbnailCacheInboxURLs;
- (NSMutableDictionary)externalThumbnailCacheThumbnailURLs;
- (NSMutableDictionary)externalThumbnailCaches;
- (NSMutableDictionary)fsidsToCaches;
- (NSMutableDictionary)pendingRequests;
- (NSMutableDictionary)queuedDownloadRequests;
- (NSMutableDictionary)volumesToCaches;
- (NSMutableSet)knownDomainsWithoutExternalThumbnailCaches;
- (NSURL)overrideBasePersonaVolumesURLForTesting;
- (OS_dispatch_queue)completionBlocksQueue;
- (OS_dispatch_queue)externalThumbnailCacheQueue;
- (OS_dispatch_queue)queue;
- (QLServerThread)init;
- (QLServerThread)initWithCacheSize:(int64_t)a3 location:(id)a4;
- (_QLCacheThread)cacheThread;
- (id)allKnownDataSeparatedVolumes;
- (id)cacheThreadForFileIdentifier:(id)a3 atURL:(id)a4;
- (id)cacheThreadForProviderDomainID:(id)a3;
- (id)cacheThreadForRequest:(id)a3;
- (id)cacheThreadForVolume:(id)a3;
- (id)failedDownloadErrorForRequest:(id)a3 underlyingError:(id)a4;
- (id)genStoreThumbnailForRequest:(id)a3 error:(id *)a4;
- (id)imageDataForImage:(CGImage *)a3;
- (id)makeCacheThreadForPersonaString:(id)a3 containerURL:(id *)a4;
- (id)processedPNGAppIconDataForData:(id)a3 ofType:(id)a4 size:(CGSize)a5 scale:(double)a6;
- (id)uncachedCacheThreadForFileAtURL:(id)a3;
- (id)uncachedCacheThreadForProviderDomainID:(id)a3;
- (os_unfair_lock_s)cacheInitLock;
- (void)_addAllThumbnailsSizesToCacheForRequest:(id)a3 withImageSource:(CGImageSource *)a4 imageSize:(CGSize)a5 alreadyCachedSize:(CGSize)a6 completionHandler:(id)a7;
- (void)_addThumbnailRequestBatchToQueue:(id)a3 completionHandler:(id)a4;
- (void)_cacheThumbnailData:(id)a3 forRequest:(id)a4 imageSource:(CGImageSource *)a5 actualSize:(CGSize)a6 resultSize:(CGSize)a7 fromGenStore:(BOOL)a8 completionHandler:(id)a9;
- (void)_callCompletionHandler:(id)a3 ofThumbnailRequestBatch:(id)a4;
- (void)_completeHandledThumbnailRequest:(id)a3;
- (void)_downloadThumbnailForRequest:(id)a3 completionHandler:(id)a4;
- (void)_installRequestsFinishedWatchdog;
- (void)_notifyGenerationHandlerOfThumbnailGenerationForRequest:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailRepresentation:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9 error:(id)a10;
- (void)_removeRequestFromPendingRequests:(id)a3;
- (void)_saveLargeThumbnailForDocumentAtURL:(id)a3 toGenstoreWithImage:(CGImage *)a4 automaticallyGenerated:(BOOL)a5;
- (void)_saveLargeThumbnailToGenstoreWithData:(id)a3 url:(id)a4;
- (void)_updateInformationForProviderAndCallPendingBlocksForProviderDomainID:(id)a3 withConnection:(id)a4 inboxURL:(id)a5 thumbnailsURL:(id)a6;
- (void)addImageData:(id)a3 toCacheForRequest:(id)a4 withBitmapFormat:(id)a5 contentRect:(CGRect)a6 flavor:(int)a7 metadata:(id)a8;
- (void)addImageData:(id)a3 withBitmapFormat:(id)a4 contentRect:(CGRect)a5 hasIconModeApplied:(BOOL)a6 flavor:(int)a7 extensionBadge:(id)a8 metadata:(id)a9 toCacheAndCompleteRequest:(id)a10;
- (void)cancelThumbnailRequests:(id)a3;
- (void)completeThumbnailRequest:(id)a3 bitmapData:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 thumbnailRepresentation:(int64_t)a7 iconFlavor:(int)a8 format:(id)a9 clientShouldTakeOwnership:(BOOL)a10;
- (void)completeThumbnailRequest:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 thumbnailRepresentation:(int64_t)a7 iconFlavor:(int)a8 clientShouldTakeOwnership:(BOOL)a9;
- (void)completeThumbnailRequest:(id)a3 thumbnailData:(id)a4 updatedMetadata:(id)a5;
- (void)didNotFindLowQualityEntryInCachedForThumbnailRequest:(id)a3 error:(id)a4;
- (void)downloadThumbnailForRequest:(id)a3 completionHandler:(id)a4;
- (void)drainDownloadsQueueIfNeeded;
- (void)failedToCompleteThumbnailRequest:(id)a3 error:(id)a4;
- (void)findThumbnailInAddition:(id)a3 request:(id)a4 completionHandler:(id)a5;
- (void)findUncachedThumbnailInExternalThumbnailCacheForRequest:(id)a3 item:(id)a4 URL:(id)a5 completionHandler:(id)a6;
- (void)findUncachedThumbnailInGenStoreForRequest:(id)a3 completionHandler:(id)a4;
- (void)findUncachedThumbnailInGenStoreOrDownload:(id)a3 completionHandler:(id)a4;
- (void)forEachCacheThread:(id)a3;
- (void)generateSuccessiveThumbnailRepresentationsForGeneratorRequests:(id)a3 completionHandler:(id)a4;
- (void)generateSuccessiveThumbnailRepresentationsForRequests:(id)a3 generationHandler:(id)a4 completionHandler:(id)a5;
- (void)generateThumbnailForThumbnailRequest:(id)a3 shouldUpdateGenstore:(BOOL)a4 completionHandler:(id)a5;
- (void)getExternalThumbnailCacheConnectionForItem:(id)a3 atURL:(id)a4 completionHandler:(id)a5;
- (void)perform:(id)a3;
- (void)perform:(id)a3 afterDelay:(int64_t)a4;
- (void)processLargeThumbnailData:(id)a3 withContentType:(id)a4 isAppContainer:(BOOL)a5 forRequest:(id)a6 fromGenStore:(BOOL)a7 completionHandler:(id)a8;
- (void)queueThumbnailRequest:(id)a3 tryCache:(BOOL)a4 tryAdditionsFirst:(BOOL)a5;
- (void)receivedExternalCacheConnection:(id)a3 error:(id)a4 forProviderDomainID:(id)a5;
- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)reset;
- (void)sendResultForThumbnailRequest:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailRepresentation:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9 reenqueueRequest:(BOOL)a10 error:(id)a11;
- (void)setCacheThread:(id)a3;
- (void)setCompletionBlocksQueue:(id)a3;
- (void)setDomainsToCaches:(id)a3;
- (void)setExternalThumbnailCacheAvailablePendingBlocks:(id)a3;
- (void)setExternalThumbnailCacheInboxURLs:(id)a3;
- (void)setExternalThumbnailCacheQueue:(id)a3;
- (void)setExternalThumbnailCacheThumbnailURLs:(id)a3;
- (void)setExternalThumbnailCaches:(id)a3;
- (void)setFsidsToCaches:(id)a3;
- (void)setKnownDomainsWithoutExternalThumbnailCaches:(id)a3;
- (void)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3;
- (void)setOverrideBasePersonaVolumesURLForTesting:(id)a3;
- (void)setPendingRequests:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueuedDownloadRequests:(id)a3;
- (void)setVolumesToCaches:(id)a3;
- (void)storeImage:(CGImage *)a3 inExternalThumbnailCacheForItem:(id)a4 atURL:(id)a5;
- (void)thumbnailRequestWasCancelled:(id)a3;
@end

@implementation QLServerThread

- (void)_addThumbnailRequestBatchToQueue:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  v7 = dispatch_group_create();
  [(QLServerThread *)self _installRequestsFinishedWatchdog];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v12 = [v11 request];
        dispatch_group_enter(v7);
        kdebug_trace();
        [v11 setBatchDispatchGroup:v7];
        v13 = _os_activity_create(&dword_1DDC5E000, "Thumbnail Request Enqueued", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        os_activity_scope_enter(v13, &state);
        [v11 setTopActivity:v13];
        v14 = [(QLServerThread *)self pendingRequests];
        v15 = [v12 uuid];
        [v14 setObject:v11 forKeyedSubscript:v15];

        int v16 = [v12 forceGeneration];
        if (v16) {
          uint64_t v17 = 0;
        }
        else {
          uint64_t v17 = [v11 cacheEnabled];
        }
        [(QLServerThread *)self queueThumbnailRequest:v11 tryCache:v17 tryAdditionsFirst:v16 ^ 1u];
        os_activity_scope_leave(&state);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }

  completionBlocksQueue = self->_completionBlocksQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__QLServerThread__addThumbnailRequestBatchToQueue_completionHandler___block_invoke;
  block[3] = &unk_1E6D0CC58;
  block[4] = self;
  id v26 = v22;
  id v19 = obj;
  id v25 = v19;
  id v20 = v22;
  dispatch_group_notify(v7, completionBlocksQueue, block);
  v21 = _log_3();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[QLServerThread _addThumbnailRequestBatchToQueue:completionHandler:]();
  }
}

void __160__QLServerThread_sendResultForThumbnailRequest_images_metadata_contentRect_iconFlavor_thumbnailRepresentation_clientShouldTakeOwnership_reenqueueRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  v3 = [*(id *)(a1 + 32) topActivity];
  v4 = _os_activity_create(&dword_1DDC5E000, "Completion", v3, OS_ACTIVITY_FLAG_DEFAULT);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  [*(id *)v2 addTypeToHandledTypes:*(void *)(v2 + 40)];
  if ([*(id *)(a1 + 40) count]) {
    [*(id *)(a1 + 32) addTypeToSuccessfullyHandledTypes:*(void *)(a1 + 72)];
  }
  id v5 = *(id *)(a1 + 48);
  id v6 = [*(id *)(a1 + 40) firstObject];
  v7 = [*(id *)v2 request];
  int v8 = [v7 resultShouldBeSavedToDisk];
  if (v6) {
    int v9 = v8;
  }
  else {
    int v9 = 0;
  }
  if (v9 != 1)
  {

    goto LABEL_11;
  }
  int v10 = [*(id *)v2 hasHandledAllRequestedTypesOrMostRepresentativeType];

  if (!v10)
  {
LABEL_11:
    v15 = _log_3();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __160__QLServerThread_sendResultForThumbnailRequest_images_metadata_contentRect_iconFlavor_thumbnailRepresentation_clientShouldTakeOwnership_reenqueueRequest_error___block_invoke_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 56), "_notifyGenerationHandlerOfThumbnailGenerationForRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 64), *(unsigned int *)(a1 + 112), *(void *)(a1 + 72), *(unsigned __int8 *)(a1 + 116), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), v5);
    goto LABEL_14;
  }
  v11 = *(void **)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 32);
  id v21 = 0;
  int v13 = [v11 _saveResultForThumbnailRequest:v12 withImage:v6 error:&v21];
  id v14 = v21;

  if (v13)
  {
    id v5 = v14;
    goto LABEL_11;
  }
  int v16 = _log_3();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    __160__QLServerThread_sendResultForThumbnailRequest_images_metadata_contentRect_iconFlavor_thumbnailRepresentation_clientShouldTakeOwnership_reenqueueRequest_error___block_invoke_cold_2();
  }

  uint64_t v17 = *(void **)(a1 + 56);
  v18 = *(void **)(a1 + 32);
  id v19 = [v18 request];
  uint64_t v20 = [v19 requestedMostRepresentativeType];
  objc_msgSend(v17, "_notifyGenerationHandlerOfThumbnailGenerationForRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:error:", v18, 0, 0, 0, v20, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v14);

  id v5 = v14;
LABEL_14:
  if (*(unsigned char *)(a1 + 117)) {
    [*(id *)(a1 + 56) queueThumbnailRequest:*(void *)(a1 + 32) tryCache:0 tryAdditionsFirst:0];
  }

  os_activity_scope_leave(&state);
}

- (void)queueThumbnailRequest:(id)a3 tryCache:(BOOL)a4 tryAdditionsFirst:(BOOL)a5
{
  BOOL v5 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = [v7 request];
  int v9 = _log_3();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.opaque[0]) = 138412290;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v7;
    _os_log_impl(&dword_1DDC5E000, v9, OS_LOG_TYPE_INFO, "Enqueuing thumbnail request: %@", (uint8_t *)&buf, 0xCu);
  }

  if ([v7 hasHandledAllRequestedTypesOrMostRepresentativeType])
  {
    [(QLServerThread *)self _completeHandledThumbnailRequest:v7];
  }
  else
  {
    if (![v7 cancelled])
    {
      if (([v8 isValid] & 1) == 0)
      {
        uint64_t v17 = dispatch_get_global_queue(0, 0);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_26;
        v29[3] = &unk_1E6D0C750;
        id v30 = v7;
        long long v31 = self;
        dispatch_async(v17, v29);

        goto LABEL_18;
      }
      if (v5)
      {
        v11 = [v7 topActivity];
        uint64_t v12 = _os_activity_create(&dword_1DDC5E000, "Cache Lookup", v11, OS_ACTIVITY_FLAG_DEFAULT);

        buf.opaque[0] = 0;
        buf.opaque[1] = 0;
        os_activity_scope_enter(v12, &buf);
        [v7 setActivity:v12];
        int v13 = [v8 fileIdentifier];
        id v14 = [v13 version];
        int v15 = [v14 isDefaultVersion];

        if (v15) {
          [(id)objc_opt_class() updateThumbnailRequestThumbnailVersionWithThirdPartyGeneratorInformationIfNeeded:v8];
        }
        int v16 = [(QLServerThread *)self cacheThreadForRequest:v8];
        if ([v16 addThumbnailRequest:v7])
        {

          os_activity_scope_leave(&buf);
          goto LABEL_18;
        }
        v18 = _log_3();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[QLServerThread queueThumbnailRequest:tryCache:tryAdditionsFirst:]();
        }

        [v7 setActivity:0];
        os_activity_scope_leave(&buf);
      }
      id v19 = [v7 topActivity];
      uint64_t v20 = _os_activity_create(&dword_1DDC5E000, "Thumbnail Generation", v19, OS_ACTIVITY_FLAG_DEFAULT);

      buf.opaque[0] = 0;
      buf.opaque[1] = 0;
      os_activity_scope_enter(v20, &buf);
      [v7 setActivity:v20];
      id v21 = (void *)MEMORY[0x1E4F28B48];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      id v25 = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_28;
      id v26 = &unk_1E6D0C750;
      id v27 = v7;
      long long v28 = self;
      id v22 = [v21 blockOperationWithBlock:&v23];
      -[NSOperationQueue addOperation:](self->_uncachedThumbnailRetrievalQueue, "addOperation:", v22, v23, v24, v25, v26);

      os_activity_scope_leave(&buf);
      goto LABEL_18;
    }
    int v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke;
    block[3] = &unk_1E6D0C750;
    id v33 = v7;
    v34 = self;
    dispatch_async(v10, block);
  }
LABEL_18:
}

- (id)cacheThreadForRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 item];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 providerDomainID];
    int v8 = [(QLServerThread *)self cacheThreadForProviderDomainID:v7];
  }
  else
  {
    id v7 = [v4 fileIdentifier];
    int v9 = [v7 fileIdentifier];
    int v10 = [v4 quicklookSandboxWrapper];
    v11 = [v10 url];
    int v8 = [(QLServerThread *)self cacheThreadForFileIdentifier:v9 atURL:v11];
  }
  return v8;
}

- (id)cacheThreadForProviderDomainID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_cacheInitLock);
  BOOL v5 = [(NSMutableDictionary *)self->_domainsToCaches objectForKey:v4];
  if (!v5)
  {
    BOOL v5 = [(QLServerThread *)self uncachedCacheThreadForProviderDomainID:v4];
    [(NSMutableDictionary *)self->_domainsToCaches setObject:v5 forKeyedSubscript:v4];
  }
  os_unfair_lock_unlock(&self->_cacheInitLock);

  return v5;
}

- (NSMutableDictionary)pendingRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)_completeHandledThumbnailRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _log_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_1DDC5E000, v5, OS_LOG_TYPE_INFO, "All requested thumbnail types for request %@ have been handled.", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F29060] callStackReturnAddresses];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__QLServerThread__completeHandledThumbnailRequest___block_invoke;
  block[3] = &unk_1E6D0C7F0;
  void block[4] = self;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(queue, block);
}

- (void)_installRequestsFinishedWatchdog
{
  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer) {
    dispatch_source_cancel(watchdogTimer);
  }
  id v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  BOOL v5 = self->_watchdogTimer;
  self->_watchdogTimer = v4;

  objc_initWeak(&location, self);
  id v6 = self->_watchdogTimer;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__QLServerThread__installRequestsFinishedWatchdog__block_invoke;
  v9[3] = &unk_1E6D0C958;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v6, v9);
  id v7 = self->_watchdogTimer;
  dispatch_time_t v8 = dispatch_time(0, 600000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x45D964B800uLL);
  dispatch_activate((dispatch_object_t)self->_watchdogTimer);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__QLServerThread__completeHandledThumbnailRequest___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 128);
  id v4 = [*(id *)(a1 + 40) request];
  BOOL v5 = [v4 uuid];
  id v6 = [v3 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v7 = _log_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __51__QLServerThread__completeHandledThumbnailRequest___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) _removeRequestFromPendingRequests:*(void *)(a1 + 40)];
  dispatch_time_t v8 = _log_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = *v2;
    int v11 = 138412290;
    id v12 = v9;
    _os_log_impl(&dword_1DDC5E000, v8, OS_LOG_TYPE_INFO, "Leaving group for request %@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = [*v2 batchDispatchGroup];
  dispatch_group_leave(v10);
}

- (void)_removeRequestFromPendingRequests:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  pendingRequests = self->_pendingRequests;
  id v7 = [v5 request];

  dispatch_time_t v8 = [v7 uuid];
  [(NSMutableDictionary *)pendingRequests setObject:0 forKeyedSubscript:v8];

  if (![(NSMutableDictionary *)self->_pendingRequests count])
  {
    [(NSMutableDictionary *)self->_domainsToCaches enumerateKeysAndObjectsUsingBlock:&__block_literal_global_85];
    cacheThread = self->_cacheThread;
    [(_QLCacheThread *)cacheThread serverIsIdle];
  }
}

- (void)perform:(id)a3
{
}

- (void)completeThumbnailRequest:(id)a3 thumbnailData:(id)a4 updatedMetadata:(id)a5
{
  id v25 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 request];
  if (+[QLDiskCacheEnumerator cachedThumbnailDataIsLowQuality:v25 forThumbnailRequest:v10])
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 2;
  }

  id v12 = [v25 bitmapData];
  uint64_t v13 = v8;
  if (!v8)
  {
    uint64_t v13 = [v25 metadata];
  }
  [v25 contentRect];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  uint64_t v22 = [v25 flavor];
  uint64_t v23 = [v25 bitmapFormat];
  LOBYTE(v24) = 0;
  -[QLServerThread completeThumbnailRequest:bitmapData:metadata:contentRect:thumbnailRepresentation:iconFlavor:format:clientShouldTakeOwnership:](self, "completeThumbnailRequest:bitmapData:metadata:contentRect:thumbnailRepresentation:iconFlavor:format:clientShouldTakeOwnership:", v9, v12, v13, v11, v22, v23, v15, v17, v19, v21, v24);

  if (!v8) {
}
  }

- (void)completeThumbnailRequest:(id)a3 bitmapData:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 thumbnailRepresentation:(int64_t)a7 iconFlavor:(int)a8 format:(id)a9 clientShouldTakeOwnership:(BOOL)a10
{
  uint64_t v11 = *(void *)&a8;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v25[1] = *MEMORY[0x1E4F143B8];
  double v20 = (void *)MEMORY[0x1E4F3A6A0];
  id v21 = a5;
  id v22 = a3;
  uint64_t v23 = [v20 imageWithFormat:a9 data:a4];
  v25[0] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  -[QLServerThread completeThumbnailRequest:images:metadata:contentRect:thumbnailRepresentation:iconFlavor:clientShouldTakeOwnership:](self, "completeThumbnailRequest:images:metadata:contentRect:thumbnailRepresentation:iconFlavor:clientShouldTakeOwnership:", v22, v24, v21, a7, v11, a10, x, y, width, height);
}

- (void)completeThumbnailRequest:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 thumbnailRepresentation:(int64_t)a7 iconFlavor:(int)a8 clientShouldTakeOwnership:(BOOL)a9
{
  BOOL v9 = a9;
  uint64_t v10 = *(void *)&a8;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  queue = self->_queue;
  id v21 = a5;
  id v22 = a4;
  dispatch_assert_queue_not_V2(queue);
  uint64_t v23 = _log_3();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v26 = v19;
    _os_log_impl(&dword_1DDC5E000, v23, OS_LOG_TYPE_INFO, "completeThumbnailRequest -> sendResultForThumbnailRequest %@", buf, 0xCu);
  }

  LOBYTE(v24) = 1;
  -[QLServerThread sendResultForThumbnailRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:reenqueueRequest:error:](self, "sendResultForThumbnailRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:reenqueueRequest:error:", v19, v22, v21, v10, a7, v9, x, y, width, height, v24, 0);
}

- (void)sendResultForThumbnailRequest:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailRepresentation:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9 reenqueueRequest:(BOOL)a10 error:(id)a11
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a11;
  queue = self->_queue;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __160__QLServerThread_sendResultForThumbnailRequest_images_metadata_contentRect_iconFlavor_thumbnailRepresentation_clientShouldTakeOwnership_reenqueueRequest_error___block_invoke;
  v30[3] = &unk_1E6D0CE30;
  id v31 = v21;
  id v32 = v22;
  id v33 = v24;
  v34 = self;
  id v35 = v23;
  int64_t v36 = a8;
  CGFloat v37 = x;
  CGFloat v38 = y;
  CGFloat v39 = width;
  CGFloat v40 = height;
  int v41 = a7;
  BOOL v42 = a9;
  BOOL v43 = a10;
  id v26 = v23;
  id v27 = v24;
  id v28 = v22;
  id v29 = v21;
  dispatch_async(queue, v30);
}

- (void)_notifyGenerationHandlerOfThumbnailGenerationForRequest:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailRepresentation:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9 error:(id)a10
{
  BOOL v10 = a9;
  uint64_t v12 = *(void *)&a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a10;
  id v23 = [v19 request];
  kdebug_trace();

  id v24 = [v19 request];
  if (v20)
  {
    id v25 = [v19 generationHandler];
    id v26 = [v24 uuid];
    objc_msgSend(v25, "didGenerateThumbnailForRequestWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:", v26, v20, v21, v12, a8, v10, x, y, width, height);
  }
  else
  {
    if (!v22)
    {
      id v22 = [v19 generationError];
      uint64_t v27 = [v19 successfullyHandldedRequestedTypes];
      if (!v22)
      {
        if (v27 == *MEMORY[0x1E4F3A740])
        {
          id v28 = _log_3();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[QLServerThread _notifyGenerationHandlerOfThumbnailGenerationForRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:error:]();
          }

          generationFailedError(v19);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v22 = 0;
        }
      }
    }
    id v29 = [v19 generationHandler];
    id v30 = [v24 uuid];
    [v29 failedToGenerateThumbnailOfType:a8 forRequestWithUUID:v30 error:v22];
  }
}

+ (void)updateThumbnailRequestThumbnailVersionWithThirdPartyGeneratorInformationIfNeeded:(id)a3
{
  id v12 = a3;
  v3 = [v12 contentType];

  if (v3)
  {
    id v4 = +[QLThumbnailExtensionMonitor shared];
    id v5 = [v4 bestExtensionFor:v12 matching:3];

    if (v5)
    {
      id v6 = [v5 generatorIdentifier];
      id v7 = [v5 generatorVersion];
      if (v6)
      {
        id v8 = [v12 fileIdentifier];
        BOOL v9 = [v8 version];
        [v9 setGeneratorID:v6];

        BOOL v10 = [v12 fileIdentifier];
        uint64_t v11 = [v10 version];
        [v11 setGeneratorVersion:v7];
      }
    }
    else
    {
      id v6 = 0;
      id v7 = 0;
    }
  }
}

uint64_t __52__QLServerThread__removeRequestFromPendingRequests___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 serverIsIdle];
}

uint64_t __99__QLServerThread_generateSuccessiveThumbnailRepresentationsForGeneratorRequests_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addThumbnailRequestBatchToQueue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

uint64_t __69__QLServerThread__addThumbnailRequestBatchToQueue_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callCompletionHandler:*(void *)(a1 + 48) ofThumbnailRequestBatch:*(void *)(a1 + 40)];
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__QLServerThread_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  uint64_t v2 = (void *)QLServerThreadInstance;
  return v2;
}

- (void)cancelThumbnailRequests:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__QLServerThread_cancelThumbnailRequests___block_invoke;
  v7[3] = &unk_1E6D0C750;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)_callCompletionHandler:(id)a3 ofThumbnailRequestBatch:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void (**)(void))a3;
  BOOL v9 = _log_3();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = NSStringFromSelector(a2);
    int v11 = 138412546;
    id v12 = v10;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1DDC5E000, v9, OS_LOG_TYPE_INFO, "%@%@", (uint8_t *)&v11, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_completionBlocksQueue);
  v8[2](v8);
}

- (void)generateSuccessiveThumbnailRepresentationsForGeneratorRequests:(id)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _log_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[QLServerThread generateSuccessiveThumbnailRepresentationsForGeneratorRequests:completionHandler:]();
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = [*(id *)(*((void *)&v32 + 1) + 8 * i) request];
        double v16 = [(QLServerThread *)self cacheThreadForRequest:v15];

        if (v16 != self->_cacheThread)
        {
          if (!v12)
          {
            id v12 = [MEMORY[0x1E4F1CA80] set];
          }
          [v12 addObject:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v11);
  }
  else
  {
    id v12 = 0;
  }

  [(_QLCacheThread *)self->_cacheThread serverIsWorking];
  if (v12)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v12;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * j) serverIsWorking];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v19);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__QLServerThread_generateSuccessiveThumbnailRepresentationsForGeneratorRequests_completionHandler___block_invoke;
  block[3] = &unk_1E6D0CC10;
  void block[4] = self;
  id v26 = v9;
  id v27 = v7;
  id v23 = v7;
  id v24 = v9;
  dispatch_sync(queue, block);
}

void __42__QLServerThread_cancelThumbnailRequests___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v4 = 138412290;
    long long v14 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        id v9 = objc_msgSend(*(id *)(a1 + 40), "pendingRequests", v14, (void)v15);
        uint64_t v10 = [v8 uuid];
        uint64_t v11 = [v9 objectForKeyedSubscript:v10];

        id v12 = _log_3();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
        if (v11)
        {
          if (v13)
          {
            *(_DWORD *)os_activity_scope_state_s buf = v14;
            uint64_t v20 = v11;
            _os_log_impl(&dword_1DDC5E000, v12, OS_LOG_TYPE_INFO, "Cancelling request that is part of the pending requests: %@", buf, 0xCu);
          }

          [v11 cancel];
        }
        else
        {
          if (v13)
          {
            *(_DWORD *)os_activity_scope_state_s buf = v14;
            uint64_t v20 = v8;
            _os_log_impl(&dword_1DDC5E000, v12, OS_LOG_TYPE_INFO, "Can't cancel thumbnail request because it was not found in the pending requests: %@", buf, 0xCu);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }
}

- (void)findUncachedThumbnailInExternalThumbnailCacheForRequest:(id)a3 item:(id)a4 URL:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  long long v14 = _log_3();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[QLServerThread(ExternalCache) findUncachedThumbnailInExternalThumbnailCacheForRequest:item:URL:completionHandler:]();
  }

  long long v15 = [v10 request];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke;
  v20[3] = &unk_1E6D0C728;
  id v24 = self;
  id v25 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v15;
  id v16 = v15;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  [(QLServerThread *)self getExternalThumbnailCacheConnectionForItem:v17 atURL:v13 completionHandler:v20];
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2;
    v19[3] = &unk_1E6D0C6D8;
    id v21 = *(id *)(a1 + 64);
    id v20 = *(id *)(a1 + 32);
    long long v4 = [a2 remoteObjectProxyWithErrorHandler:v19];
    uint64_t v5 = _log_3();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_cold_1(a1, v5);
    }

    uint64_t v6 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2;
    v13[3] = &unk_1E6D0C700;
    id v14 = v6;
    id v15 = *(id *)(a1 + 32);
    id v18 = *(id *)(a1 + 64);
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    id v16 = v7;
    uint64_t v17 = v8;
    [v4 getThumbnailURLForItem:v14 completion:v13];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 64);
    id v10 = (void *)MEMORY[0x1E4F3A6C8];
    id v12 = [*(id *)(a1 + 32) request];
    id v11 = [v10 errorWithCode:0 request:v12 additionalUserInfo:0];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v11);
  }
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = _log_3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_1();
  }

  uint64_t v5 = (void *)MEMORY[0x1E4F3A6C8];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) request];
  uint64_t v10 = *MEMORY[0x1E4F28A50];
  v11[0] = v3;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v9 = [v5 errorWithCode:0 request:v7 additionalUserInfo:v8];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v9);
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v45[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = _log_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_5();
    }

    CGImageSourceRef v8 = CGImageSourceCreateWithURL(v5, 0);
    if (v8)
    {
      CGImageSourceRef v9 = v8;
      QLThumbnailingImageIOGetSizeFromImageSourceAtIndex();
      if (v11 == *MEMORY[0x1E4F1DB30] && v10 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        long long v29 = [NSString stringWithFormat:@"Could not decode an image from thumbnail data at %@ for %@: image size is zero", v5, *(void *)(a1 + 40)];
        long long v30 = _log_3();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_2();
        }

        uint64_t v31 = *(void *)(a1 + 64);
        long long v32 = (void *)MEMORY[0x1E4F3A6C8];
        long long v33 = [*(id *)(a1 + 40) request];
        uint64_t v42 = *MEMORY[0x1E4F28228];
        BOOL v43 = v29;
        long long v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        long long v35 = [v32 errorWithCode:0 request:v33 additionalUserInfo:v34];
        (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v35);

        CFRelease(v9);
      }
      else
      {
        [*(id *)(a1 + 48) size];
        [*(id *)(a1 + 48) minimumDimension];
        [*(id *)(a1 + 48) scale];
        [*(id *)(a1 + 48) interpolationQuality];
        id v13 = (CGImage *)QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSource();
        id v14 = _log_3();
        id v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_4();
          }

          id v16 = [*(id *)(a1 + 56) imageDataForImage:v13];
          uint64_t v17 = [MEMORY[0x1E4F3A698] bitmapFormatWithBitmapImage:v13];
          objc_msgSend(*(id *)(a1 + 56), "addImageData:withBitmapFormat:contentRect:hasIconModeApplied:flavor:extensionBadge:metadata:toCacheAndCompleteRequest:", v16, v17, 0, 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), *(void *)(a1 + 40));
          CGImageRelease(v13);
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_3();
          }

          id v16 = [NSString stringWithFormat:@"Could not decode an image from thumbnail data at %@ for %@", v5, *(void *)(a1 + 40)];
          uint64_t v36 = *(void *)(a1 + 64);
          CGFloat v37 = (void *)MEMORY[0x1E4F3A6C8];
          uint64_t v17 = [*(id *)(a1 + 40) request];
          uint64_t v40 = *MEMORY[0x1E4F28228];
          int v41 = v16;
          uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          CGFloat v39 = [v37 errorWithCode:0 request:v17 additionalUserInfo:v38];
          (*(void (**)(uint64_t, void *))(v36 + 16))(v36, v39);
        }
        CFRelease(v9);
      }
    }
    else
    {
      id v22 = [NSString stringWithFormat:@"Could not decode an image from thumbnail data at %@ for %@", v5, *(void *)(a1 + 40)];
      id v23 = _log_3();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_1();
      }

      uint64_t v24 = *(void *)(a1 + 64);
      id v25 = (void *)MEMORY[0x1E4F3A6C8];
      id v26 = [*(id *)(a1 + 40) request];
      uint64_t v44 = *MEMORY[0x1E4F28228];
      v45[0] = v22;
      id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      long long v28 = [v25 errorWithCode:0 request:v26 additionalUserInfo:v27];
      (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v28);
    }
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 64);
    id v19 = (void *)MEMORY[0x1E4F3A6C8];
    id v20 = [*(id *)(a1 + 40) request];
    id v21 = [v19 errorWithCode:0 request:v20 additionalUserInfo:0];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v21);
  }
}

- (void)receivedExternalCacheConnection:(id)a3 error:(id)a4 forProviderDomainID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    double v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F39CA5B0];
    [v8 setRemoteObjectInterface:v11];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke;
    v24[3] = &unk_1E6D0C750;
    id v12 = v10;
    id v25 = v12;
    id v26 = self;
    [v8 setInvalidationHandler:v24];
    [v8 resume];
    id v13 = [v8 remoteObjectProxy];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke_20;
    v21[3] = &unk_1E6D0C778;
    v21[4] = self;
    id v22 = v12;
    id v23 = v8;
    id v14 = v12;
    [v13 getThumbnailCacheURLWrappersWithCompletion:v21];

    id v15 = v25;
  }
  else
  {
    id v16 = _log_3();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[QLServerThread(ExternalCache) receivedExternalCacheConnection:error:forProviderDomainID:]();
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke_22;
    block[3] = &unk_1E6D0C750;
    void block[4] = self;
    id v20 = v10;
    id v18 = v10;
    dispatch_sync(queue, block);
    [(QLServerThread *)self _updateInformationForProviderAndCallPendingBlocksForProviderDomainID:v18 withConnection:0 inboxURL:0 thumbnailsURL:0];
    id v15 = v20;
  }
}

uint64_t __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke(uint64_t a1)
{
  id v2 = _log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return [*(id *)(a1 + 40) _updateInformationForProviderAndCallPendingBlocksForProviderDomainID:*(void *)(a1 + 32) withConnection:0 inboxURL:0 thumbnailsURL:0];
}

void __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = [a2 url];
  uint64_t v6 = [v5 url];

  [v6 startAccessingSecurityScopedResource];
  [*(id *)(a1 + 32) _updateInformationForProviderAndCallPendingBlocksForProviderDomainID:*(void *)(a1 + 40) withConnection:*(void *)(a1 + 48) inboxURL:v7 thumbnailsURL:v6];
}

void __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke_22(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) knownDomainsWithoutExternalThumbnailCaches];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)_updateInformationForProviderAndCallPendingBlocksForProviderDomainID:(id)a3 withConnection:(id)a4 inboxURL:(id)a5 thumbnailsURL:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__0;
  CGFloat v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  id v14 = [(QLServerThread *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __140__QLServerThread_ExternalCache___updateInformationForProviderAndCallPendingBlocksForProviderDomainID_withConnection_inboxURL_thumbnailsURL___block_invoke;
  block[3] = &unk_1E6D0C7A0;
  void block[4] = self;
  id v15 = v10;
  id v28 = v15;
  id v16 = v11;
  id v29 = v16;
  id v17 = v12;
  id v30 = v17;
  id v18 = v13;
  id v31 = v18;
  long long v32 = &v33;
  dispatch_sync(v14, block);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v19 = (id)v34[5];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v23 objects:v39 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v19);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v23 + 1) + 8 * v22) + 16))(*(void *)(*((void *)&v23 + 1) + 8 * v22));
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v23 objects:v39 count:16];
    }
    while (v20);
  }

  _Block_object_dispose(&v33, 8);
}

void __140__QLServerThread_ExternalCache___updateInformationForProviderAndCallPendingBlocksForProviderDomainID_withConnection_inboxURL_thumbnailsURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) externalThumbnailCaches];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = [*(id *)(a1 + 32) externalThumbnailCacheInboxURLs];
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v6 = *(void *)(a1 + 64);
  id v7 = [*(id *)(a1 + 32) externalThumbnailCacheThumbnailURLs];
  [v7 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v8 = [*(id *)(a1 + 32) externalThumbnailCacheAvailablePendingBlocks];
  id v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v10 = [v9 copy];
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  id v13 = [*(id *)(a1 + 32) externalThumbnailCacheAvailablePendingBlocks];
  [v13 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)getExternalThumbnailCacheConnectionForItem:(id)a3 atURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__0;
  v52 = __Block_byref_object_dispose__0;
  id v53 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v40 = 0;
  int v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v11 = [v8 providerDomainID];
  id v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v13 = [v12 BOOLForKey:@"QLEnableExternalThumbnailCache"];

  if (v13)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke;
    block[3] = &unk_1E6D0C7C8;
    void block[4] = self;
    id v15 = v11;
    id v34 = v15;
    CGFloat v37 = &v44;
    id v16 = v10;
    id v36 = v16;
    id v38 = &v40;
    CGFloat v39 = &v48;
    id v17 = v8;
    id v35 = v17;
    dispatch_sync(queue, block);
    if (!*((unsigned char *)v41 + 24))
    {
      if (*((unsigned char *)v45 + 24))
      {
        (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
      }
      else
      {
        uint64_t v18 = v49[5];
        if (v18)
        {
          id v19 = [(QLServerThread *)self externalThumbnailCacheInboxURLs];
          uint64_t v20 = [v17 providerDomainID];
          uint64_t v21 = [v19 objectForKeyedSubscript:v20];
          (*((void (**)(id, uint64_t, void *))v16 + 2))(v16, v18, v21);
        }
        else
        {
          uint64_t v22 = (void *)MEMORY[0x1E4F1CA48];
          long long v23 = _Block_copy(v16);
          long long v24 = [v22 arrayWithObject:v23];

          long long v25 = self->_queue;
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke_2;
          v30[3] = &unk_1E6D0C7F0;
          void v30[4] = self;
          id v26 = v15;
          id v31 = v26;
          id v19 = v24;
          id v32 = v19;
          dispatch_sync(v25, v30);
          id v27 = [MEMORY[0x1E4F28CB8] defaultManager];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke_3;
          v28[3] = &unk_1E6D0C840;
          v28[4] = self;
          id v29 = v26;
          [v27 getFileProviderServicesForItemAtURL:v9 completionHandler:v28];
        }
      }
    }
  }
  else if (v10)
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
}

void __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) knownDomainsWithoutExternalThumbnailCaches];
  uint64_t v3 = [v2 member:*(void *)(a1 + 40)];

  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) externalThumbnailCacheAvailablePendingBlocks];
    id v10 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v10)
    {
      id v5 = _Block_copy(*(const void **)(a1 + 56));
      [v10 addObject:v5];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
    else
    {
      id v10 = [*(id *)(a1 + 32) externalThumbnailCaches];
      uint64_t v6 = [*(id *)(a1 + 48) providerDomainID];
      uint64_t v7 = [v10 objectForKeyedSubscript:v6];
      uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
}

void __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) externalThumbnailCacheAvailablePendingBlocks];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"com.apple.filesystems.LiveItemThumbnails"];

  if (v7)
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"com.apple.filesystems.LiveItemThumbnails"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke_4;
    v10[3] = &unk_1E6D0C818;
    id v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    [v8 getFileProviderConnectionWithCompletionHandler:v10];
  }
  else
  {
    [*(id *)(a1 + 32) receivedExternalCacheConnection:0 error:v6 forProviderDomainID:*(void *)(a1 + 40)];
  }
}

uint64_t __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) receivedExternalCacheConnection:a2 error:a3 forProviderDomainID:*(void *)(a1 + 40)];
}

- (void)storeImage:(CGImage *)a3 inExternalThumbnailCacheForItem:(id)a4 atURL:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  CGImageRetain(a3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke;
  v11[3] = &unk_1E6D0C8B8;
  id v12 = v8;
  char v13 = a3;
  v11[4] = self;
  id v10 = v8;
  [(QLServerThread *)self getExternalThumbnailCacheConnectionForItem:v10 atURL:v9 completionHandler:v11];
}

void __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) externalThumbnailCacheQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke_2;
    v8[3] = &unk_1E6D0C890;
    uint64_t v12 = *(void *)(a1 + 48);
    id v9 = v6;
    id v10 = v5;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(v7, v8);
  }
  else
  {
    CGImageRelease(*(CGImageRef *)(a1 + 48));
  }
}

void __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F3A688] writeThumbnailImage:*(void *)(a1 + 56) inInboxAtURL:*(void *)(a1 + 32)];
  CGImageRelease(*(CGImageRef *)(a1 + 56));
  id v3 = [*(id *)(a1 + 40) remoteObjectProxy];
  uint64_t v4 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke_3;
  v5[3] = &unk_1E6D0C868;
  id v6 = v4;
  [v3 storeThumbnailAtURL:v2 forItem:v6 completion:v5];
}

void __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _log_3();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke_3_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1DDC5E000, v5, OS_LOG_TYPE_INFO, "Store thumbnail for %@ in external thumbnail cache", (uint8_t *)&v7, 0xCu);
  }
}

- (QLServerThread)init
{
  int64_t v3 = +[_QLCacheThread defaultCacheSize];
  uint64_t v4 = +[QLDiskCache defaultLocation];
  id v5 = [(QLServerThread *)self initWithCacheSize:v3 location:v4];

  return v5;
}

- (QLServerThread)initWithCacheSize:(int64_t)a3 location:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v62.receiver = self;
  v62.super_class = (Class)QLServerThread;
  int v7 = [(QLServerThread *)&v62 init];
  if (v7)
  {
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.quicklook.server", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.quicklook.servercompletionblocks", v11);
    completionBlocksQueue = v7->_completionBlocksQueue;
    v7->_completionBlocksQueue = (OS_dispatch_queue *)v12;

    id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.quicklook.genstorecaching", v14);
    genstoreCachingQueue = v7->_genstoreCachingQueue;
    v7->_genstoreCachingQueue = (OS_dispatch_queue *)v15;

    id v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingRequests = v7->_pendingRequests;
    v7->_pendingRequests = v17;

    id v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    downloadsOperationQueue = v7->_downloadsOperationQueue;
    v7->_downloadsOperationQueue = v19;

    uint64_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.quicklook.fpthumbnailspending", v21);
    pendingDownloadsQueue = v7->_pendingDownloadsQueue;
    v7->_pendingDownloadsQueue = (OS_dispatch_queue *)v22;

    long long v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.quicklook.fpthumbnailsresponse", v24);
    downloadResponseProcessingQueue = v7->_downloadResponseProcessingQueue;
    v7->_downloadResponseProcessingQueue = (OS_dispatch_queue *)v25;

    v7->_drainScheduled = 0;
    atomic_store(0, (unsigned int *)&v7->_thumbnailDownloadsInFlight);
    [(NSOperationQueue *)v7->_downloadsOperationQueue setQualityOfService:17];
    id v27 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    uncachedThumbnailRetrievalQueue = v7->_uncachedThumbnailRetrievalQueue;
    v7->_uncachedThumbnailRetrievalQueue = v27;

    [(NSOperationQueue *)v7->_uncachedThumbnailRetrievalQueue setMaxConcurrentOperationCount:4];
    id v29 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    downscaledThumbnailGenerationQueue = v7->_downscaledThumbnailGenerationQueue;
    v7->_downscaledThumbnailGenerationQueue = v29;

    [(NSOperationQueue *)v7->_downscaledThumbnailGenerationQueue setQualityOfService:9];
    [(NSOperationQueue *)v7->_downscaledThumbnailGenerationQueue setMaxConcurrentOperationCount:1];
    id v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v32 = dispatch_queue_create("com.apple.quicklook.previewthumbnailgeneration", v31);
    previewThumbnailGeneratorQueue = v7->_previewThumbnailGeneratorQueue;
    v7->_previewThumbnailGeneratorQueue = (OS_dispatch_queue *)v32;

    id v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v35 = dispatch_queue_attr_make_with_qos_class(v34, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v36 = dispatch_queue_create("com.apple.quicklook.externalcache", v35);
    externalThumbnailCacheQueue = v7->_externalThumbnailCacheQueue;
    v7->_externalThumbnailCacheQueue = (OS_dispatch_queue *)v36;

    id v38 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    volumesToCaches = v7->_volumesToCaches;
    v7->_volumesToCaches = v38;

    watchdogTimer = v7->_watchdogTimer;
    v7->_watchdogTimer = 0;

    int v41 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    knownDomainsWithoutExternalThumbnailCaches = v7->_knownDomainsWithoutExternalThumbnailCaches;
    v7->_knownDomainsWithoutExternalThumbnailCaches = v41;

    char v43 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    domainsToCaches = v7->_domainsToCaches;
    v7->_domainsToCaches = v43;

    v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    externalThumbnailCacheAvailablePendingBlocks = v7->_externalThumbnailCacheAvailablePendingBlocks;
    v7->_externalThumbnailCacheAvailablePendingBlocks = v45;

    char v47 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queuedDownloadRequests = v7->_queuedDownloadRequests;
    v7->_queuedDownloadRequests = v47;

    v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    externalThumbnailCaches = v7->_externalThumbnailCaches;
    v7->_externalThumbnailCaches = v49;

    v51 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    externalThumbnailCacheInboxURLs = v7->_externalThumbnailCacheInboxURLs;
    v7->_externalThumbnailCacheInboxURLs = v51;

    id v53 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    externalThumbnailCacheThumbnailURLs = v7->_externalThumbnailCacheThumbnailURLs;
    v7->_externalThumbnailCacheThumbnailURLs = v53;

    v7->_cacheInitLock._os_unfair_lock_opaque = 0;
    v55 = [[_QLCacheThread alloc] initWithServerThread:v7 cacheSize:a3 location:v6];
    cacheThread = v7->_cacheThread;
    v7->_cacheThread = v55;

    v57 = v7->_cacheThread;
    if (v57)
    {
      [(_QLCacheThread *)v57 openCache];
    }
    else
    {
      v58 = _log_3();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        -[QLServerThread initWithCacheSize:location:](v58);
      }
    }
    v59 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/"];
    [(NSMutableDictionary *)v7->_volumesToCaches setObject:v7->_cacheThread forKeyedSubscript:v59];
    memset(&v63, 0, 512);
    if (!statfs("/", &v63))
    {
      v60 = [MEMORY[0x1E4F29238] valueWithBytes:&v63.f_fsid objCType:"{fsid=[2i]}"];
      [(NSMutableDictionary *)v7->_fsidsToCaches setObject:v7->_cacheThread forKeyedSubscript:v60];
    }
  }

  return v7;
}

void __32__QLServerThread_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01C5C90]();
  id v3 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v4 = (void *)QLServerThreadInstance;
  QLServerThreadInstance = (uint64_t)v3;

  uint64_t v5 = [(id)QLServerThreadInstance cacheThread];
  id v6 = (void *)QLCacheThreadInstance;
  QLCacheThreadInstance = v5;
}

- (void)perform:(id)a3 afterDelay:(int64_t)a4
{
  dispatch_block_t block = a3;
  dispatch_time_t v6 = dispatch_time(0, a4);
  dispatch_after(v6, (dispatch_queue_t)self->_queue, block);
}

- (id)makeCacheThreadForPersonaString:(id)a3 containerURL:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [(QLServerThread *)self overrideBasePersonaVolumesURLForTesting];

  if (v8)
  {
    dispatch_queue_t v9 = [(QLServerThread *)self overrideBasePersonaVolumesURLForTesting];
    id v10 = [v9 URLByAppendingPathComponent:v7];

LABEL_23:
    long long v24 = [v10 URLByAppendingPathComponent:*MEMORY[0x1E4F3A760]];
    dispatch_queue_t v25 = [v24 path];

    if (a4) {
      *a4 = v10;
    }
    +[QLDiskCache setupCacheAtLocationIfNecessary:v25];
    uint64_t v4 = [[_QLCacheThread alloc] initWithServerThread:self cacheSize:+[_QLCacheThread defaultCacheSize] location:v25];

    goto LABEL_26;
  }
  id v11 = [MEMORY[0x1E4FB36F8] sharedManager];
  dispatch_queue_t v12 = [v11 currentPersona];

  id v28 = 0;
  id v13 = [v12 userPersonaUniqueString];
  id v14 = v13;
  if (v13 == v7
    || ([v13 isEqualToString:v7] & 1) != 0
    || !voucher_process_can_use_arbitrary_personas())
  {
    id v19 = 0;
  }
  else
  {
    id v27 = 0;
    dispatch_queue_t v15 = (void *)[v12 copyCurrentPersonaContextWithError:&v27];
    id v16 = v27;
    id v17 = v28;
    id v28 = v15;

    if (v16)
    {
      uint64_t v18 = fp_current_or_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[QLServerThread makeCacheThreadForPersonaString:containerURL:]();
      }
    }
    id v19 = [v12 generateAndRestorePersonaContextWithPersonaUniqueString:v7];

    if (v19)
    {
      uint64_t v20 = fp_current_or_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[QLServerThread makeCacheThreadForPersonaString:containerURL:]();
      }
    }
  }
  uint64_t v21 = (void *)container_create_or_lookup_path_for_current_user();
  if (v21)
  {
    dispatch_queue_t v22 = _log_3();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      id v30 = v7;
      __int16 v31 = 2080;
      dispatch_queue_t v32 = v21;
      _os_log_impl(&dword_1DDC5E000, v22, OS_LOG_TYPE_INFO, "Creating cache for persona %@ in container %s", buf, 0x16u);
    }

    id v10 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v21 isDirectory:1 relativeToURL:0];
    free(v21);
  }
  else
  {
    long long v23 = _log_3();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[QLServerThread makeCacheThreadForPersonaString:containerURL:]();
    }

    uint64_t v4 = self->_cacheThread;
    id v10 = 0;
  }

  _FPRestorePersona();
  if (v21) {
    goto LABEL_23;
  }
LABEL_26:

  return v4;
}

- (id)uncachedCacheThreadForProviderDomainID:(id)a3
{
  id v4 = a3;
  id v18 = 0;
  uint64_t v5 = [MEMORY[0x1E4F25D68] providerDomainWithID:v4 cachePolicy:1 error:&v18];
  id v6 = v18;
  if (!v5)
  {
    id v14 = _log_3();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[QLServerThread uncachedCacheThreadForProviderDomainID:]();
    }

    goto LABEL_11;
  }
  id v7 = [v5 personaIdentifier];

  if (!v7)
  {
LABEL_11:
    dispatch_queue_t v12 = self->_cacheThread;
    goto LABEL_14;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4FB3710];
  dispatch_queue_t v9 = [v5 personaIdentifier];
  id v10 = [v8 personaAttributesForIdentifier:v9];

  if (v10 && ([v10 isDataSeparatedPersona] & 1) != 0)
  {
    id v11 = [v5 personaIdentifier];
    id v17 = 0;
    dispatch_queue_t v12 = [(QLServerThread *)self makeCacheThreadForPersonaString:v11 containerURL:&v17];
    id v13 = v17;

    uint64_t v16 = 0;
    if ([v13 getResourceValue:&v16 forKey:*MEMORY[0x1E4F1C960] error:0]) {
      [(NSMutableDictionary *)self->_volumesToCaches setObject:v12 forKeyedSubscript:v16];
    }
    [(_QLCacheThread *)v12 openCache];
  }
  else
  {
    dispatch_queue_t v12 = self->_cacheThread;
  }

LABEL_14:
  return v12;
}

- (id)uncachedCacheThreadForFileAtURL:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  [v41 getFileSystemRepresentation:&v59 maxLength:1024];
  BOOL v6 = v59 == 0x657461766972702FLL
    && *(void *)v60 == 0x7265502F7261762FLL
    && *(void *)&v60[8] == 0x756C6F56616E6F73
    && *(void *)&v60[11] == 0x73656D756C6F5661;
  if (v6
    || (v59 == 0x7265502F7261762FLL ? (BOOL v7 = *(void *)v60 == 0x756C6F56616E6F73) : (BOOL v7 = 0),
        v7 ? (BOOL v8 = *(void *)&v60[3] == 0x73656D756C6F5661) : (BOOL v8 = 0),
        v8))
  {
    int v10 = [v41 startAccessingSecurityScopedResource];
    id v51 = 0;
    uint64_t v11 = *MEMORY[0x1E4F1C960];
    int v12 = [v41 getResourceValue:&v51 forKey:*MEMORY[0x1E4F1C960] error:0];
    id v13 = v51;
    if (v12
      && ([(NSMutableDictionary *)self->_volumesToCaches objectForKeyedSubscript:v13],
          id v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v14))
    {
      if (v10) {
        [v41 stopAccessingSecurityScopedResource];
      }
      dispatch_queue_t v9 = [(NSMutableDictionary *)self->_volumesToCaches objectForKeyedSubscript:v13];
    }
    else
    {
      uint64_t v40 = self;
      dispatch_queue_t v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v50 = 0;
      uint64_t v16 = [v15 listAllPersonaAttributesWithError:&v50];
      id v17 = v50;

      if (v17)
      {
        id v18 = _log_3();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[QLServerThread uncachedCacheThreadForFileAtURL:]();
        }
      }
      uint64_t v38 = v11;
      CGFloat v39 = v13;
      id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v20 = v16;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v58 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        int v37 = v10;
        uint64_t v23 = *(void *)v47;
LABEL_30:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v47 != v23) {
            objc_enumerationMutation(v20);
          }
          dispatch_queue_t v25 = *(void **)(*((void *)&v46 + 1) + 8 * v24);
          id v26 = [v25 personaLayoutPathURL];

          if (v26)
          {
            uint64_t v45 = 0;
            id v27 = [v25 personaLayoutPathURL];
            id v44 = v17;
            char v28 = [v19 getRelationship:&v45 ofDirectoryAtURL:v27 toItemAtURL:v41 error:&v44];
            id v29 = v44;

            if (v28)
            {
              if (!v45)
              {
                dispatch_queue_t v32 = [v25 userPersonaUniqueString];

                if (!v32) {
                  goto LABEL_50;
                }
                id v43 = 0;
                dispatch_queue_t v9 = [(QLServerThread *)v40 makeCacheThreadForPersonaString:v32 containerURL:&v43];
                id v33 = v43;
                id v42 = 0;
                int v34 = [v33 getResourceValue:&v42 forKey:v38 error:0];
                id v13 = v42;

                if (v34) {
                  [(NSMutableDictionary *)v40->_volumesToCaches setObject:v9 forKeyedSubscript:v13];
                }
                if (v37) {
                  [v41 stopAccessingSecurityScopedResource];
                }

                goto LABEL_53;
              }
            }
            else
            {
              id v30 = _log_3();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                __int16 v31 = [v25 personaLayoutPathURL];
                *(_DWORD *)os_activity_scope_state_s buf = 138412802;
                id v53 = v31;
                __int16 v54 = 2112;
                id v55 = v41;
                __int16 v56 = 2112;
                id v57 = v29;
                _os_log_error_impl(&dword_1DDC5E000, v30, OS_LOG_TYPE_ERROR, "Could not get relationship between %@ and %@, error: %@", buf, 0x20u);
              }
            }
            id v17 = v29;
          }
          if (v22 == ++v24)
          {
            uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v58 count:16];
            if (v22) {
              goto LABEL_30;
            }
            break;
          }
        }
      }

      id v29 = v17;
LABEL_50:
      id v13 = v39;
      id v35 = _log_3();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[QLServerThread uncachedCacheThreadForFileAtURL:]();
      }

      dispatch_queue_t v9 = v40->_cacheThread;
LABEL_53:
    }
  }
  else
  {
    dispatch_queue_t v9 = self->_cacheThread;
  }

  return v9;
}

- (void)generateSuccessiveThumbnailRepresentationsForRequests:(id)a3 generationHandler:(id)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * v16);
        id v18 = [QLTGeneratorThumbnailRequest alloc];
        id v19 = -[QLTGeneratorThumbnailRequest initWithRequest:generationHandler:](v18, "initWithRequest:generationHandler:", v17, v9, (void)v20);
        [v11 addObject:v19];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  [(QLServerThread *)self generateSuccessiveThumbnailRepresentationsForGeneratorRequests:v11 completionHandler:v10];
}

void __50__QLServerThread__installRequestsFinishedWatchdog__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[16] enumerateKeysAndObjectsUsingBlock:&__block_literal_global_4];
    WeakRetained = v2;
  }
}

void __50__QLServerThread__installRequestsFinishedWatchdog__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 request];
  uint64_t v5 = [v4 beginDate];
  [v5 timeIntervalSinceNow];
  double v7 = v6;

  if (v7 < -600.0)
  {
    id v8 = _log_3();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __50__QLServerThread__installRequestsFinishedWatchdog__block_invoke_2_cold_1();
    }
  }
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke(uint64_t a1)
{
  uint64_t v2 = _log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_cold_1();
  }

  uint64_t v5 = a1 + 32;
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(v5 + 8);
  double v6 = cancelledError(v3);
  [v4 failedToCompleteThumbnailRequest:v3 error:v6];
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_26(uint64_t a1)
{
  uint64_t v2 = _log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_26_cold_1();
  }

  uint64_t v5 = a1 + 32;
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(v5 + 8);
  double v6 = (void *)MEMORY[0x1E4F3A6C8];
  double v7 = [v3 request];
  id v8 = [v6 errorWithCode:4 request:v7 additionalUserInfo:0];

  [v4 failedToCompleteThumbnailRequest:v3 error:v8];
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_28(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) activity];
  os_activity_scope_enter(v3, &state);

  if ([*v2 cancelled])
  {
    id v4 = _log_3();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_28_cold_1();
    }

    double v6 = *(void **)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    double v7 = cancelledError(v6);
    [v5 failedToCompleteThumbnailRequest:v6 error:v7];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_29;
    v11[3] = &unk_1E6D0C980;
    id v9 = v8;
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = v9;
    uint64_t v13 = v10;
    [v9 computeUbiquitousnessWithCompletionHandler:v11];
    double v7 = v12;
  }

  os_activity_scope_leave(&state);
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _log_3();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_29_cold_2();
    }

    double v6 = *(void **)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    double v7 = generationFailedErrorWithUnderlyingError(v6, v3, 0);
    [v5 failedToCompleteThumbnailRequest:v6 error:v7];
  }
  else
  {
    id v8 = (id *)(a1 + 32);
    int v9 = [*(id *)(a1 + 32) isDownloaded];
    uint64_t v10 = _log_3();
    uint64_t v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v12 = *v8;
        *(_DWORD *)os_activity_scope_state_s buf = 138412290;
        id v31 = v12;
        _os_log_impl(&dword_1DDC5E000, v11, OS_LOG_TYPE_INFO, "%@ is downloaded. Trying to generate a thumbnail locally", buf, 0xCu);
      }

      if ([*v8 cancelled])
      {
        uint64_t v13 = _log_3();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = *v8;
          *(_DWORD *)os_activity_scope_state_s buf = 138412290;
          id v31 = v14;
          _os_log_impl(&dword_1DDC5E000, v13, OS_LOG_TYPE_INFO, "Before generateThumbnailForThumbnailRequest: thumbnail request %@ cancelled", buf, 0xCu);
        }

        uint64_t v16 = *(void **)(a1 + 32);
        uint64_t v15 = *(void **)(a1 + 40);
        uint64_t v17 = cancelledError(v16);
        [v15 failedToCompleteThumbnailRequest:v16 error:v17];
      }
      else
      {
        long long v21 = *(void **)(a1 + 32);
        long long v22 = *(void **)(a1 + 40);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_30;
        v27[3] = &unk_1E6D0C980;
        id v23 = v21;
        uint64_t v24 = *(void *)(a1 + 40);
        id v28 = v23;
        uint64_t v29 = v24;
        [v22 generateThumbnailForThumbnailRequest:v23 shouldUpdateGenstore:0 completionHandler:v27];
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_29_cold_1();
      }

      id v18 = (uint64_t *)(a1 + 32);
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      id v19 = *(void **)(a1 + 40);
      uint64_t v20 = *v18;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_33;
      v25[3] = &unk_1E6D0CC80;
      v25[4] = v19;
      objc_copyWeak(&v26, (id *)buf);
      [v19 findUncachedThumbnailInGenStoreOrDownload:v20 completionHandler:v25];
      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) cancelled];
    uint64_t v5 = _log_3();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6) {
        __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_30_cold_1();
      }

      uint64_t v9 = a1 + 32;
      double v7 = *(void **)(a1 + 32);
      id v8 = *(void **)(v9 + 8);
      uint64_t v10 = cancelledError(v7);
      [v8 failedToCompleteThumbnailRequest:v7 error:v10];
    }
    else
    {
      if (v6) {
        __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_30_cold_2();
      }

      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v11 = *(void **)(a1 + 40);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_31;
      v13[3] = &unk_1E6D0CC80;
      void v13[4] = v11;
      objc_copyWeak(&v14, &location);
      [v11 findUncachedThumbnailInGenStoreOrDownload:v12 completionHandler:v13];
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_31(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = (id *)(a1 + 40);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    [v2 failedToCompleteThumbnailRequest:WeakRetained error:v4];
  }
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_33(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = (id *)(a1 + 40);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    [v2 failedToCompleteThumbnailRequest:WeakRetained error:v4];
  }
}

- (void)findUncachedThumbnailInGenStoreOrDownload:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__QLServerThread_findUncachedThumbnailInGenStoreOrDownload_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6D0CCA8;
  id v8 = v7;
  id v19 = v8;
  id v9 = v6;
  id v17 = v9;
  id v18 = self;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = [v9 taggedLogicalURL];

  if (v11)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__QLServerThread_findUncachedThumbnailInGenStoreOrDownload_completionHandler___block_invoke_35;
    v14[3] = &unk_1E6D0CCD0;
    id v15 = v10;
    [(QLServerThread *)self findUncachedThumbnailInGenStoreForRequest:v9 completionHandler:v14];
    uint64_t v12 = v15;
  }
  else
  {
    uint64_t v13 = _log_3();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[QLServerThread findUncachedThumbnailInGenStoreOrDownload:completionHandler:]();
    }

    uint64_t v12 = generationFailedErrorWithUnderlyingError(v9, 0, @"Unmaterialized file cannot have thumbnails stored on disk");
    (*((void (**)(void *, void, void *))v10 + 2))(v10, 0, v12);
  }
}

void __78__QLServerThread_findUncachedThumbnailInGenStoreOrDownload_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_10:
    v6();
    goto LABEL_11;
  }
  if ([*(id *)(a1 + 32) cancelled])
  {
    id v7 = _log_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __78__QLServerThread_findUncachedThumbnailInGenStoreOrDownload_completionHandler___block_invoke_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = cancelledError(*(void **)(a1 + 32));
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    if (![*(id *)(a1 + 32) isUbiquitous])
    {
      id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_10;
    }
    [*(id *)(a1 + 40) downloadThumbnailForRequest:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 48)];
  }
LABEL_11:
}

uint64_t __78__QLServerThread_findUncachedThumbnailInGenStoreOrDownload_completionHandler___block_invoke_35(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

- (void)findUncachedThumbnailInGenStoreForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v10 = 0;
  id v7 = (void (**)(id, id))a4;
  uint64_t v8 = [(QLServerThread *)self genStoreThumbnailForRequest:v6 error:&v10];
  id v9 = v10;
  if (v8) {
    [(QLServerThread *)self findThumbnailInAddition:v8 request:v6 completionHandler:v7];
  }
  else {
    v7[2](v7, v9);
  }
}

- (id)genStoreThumbnailForRequest:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 taggedLogicalURL];
  uint64_t v8 = v7;
  if (v7)
  {
    int v9 = [v7 startAccessingSecurityScopedResource];
    uint64_t v10 = _CFURLPromiseCopyPhysicalURL();
    uint64_t v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = (void *)v10;
    }
    else {
      uint64_t v12 = v8;
    }
    id v13 = v12;

    id v14 = _log_3();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v13;
      _os_log_impl(&dword_1DDC5E000, v14, OS_LOG_TYPE_INFO, "Trying GenStore for file at URL: %@ (physical: %@).", buf, 0x16u);
    }

    id v21 = 0;
    id v15 = (id)[objc_alloc(MEMORY[0x1E4F3A6A8]) initWithAdditionsPresentOnURL:v13 error:&v21];
    id v16 = v21;
    if (v16)
    {
      id v17 = _log_3();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)os_activity_scope_state_s buf = 138412290;
        id v23 = v16;
        _os_log_impl(&dword_1DDC5E000, v17, OS_LOG_TYPE_INFO, "Did not retrieve thumbnail from GenStore with error: %@", buf, 0xCu);
      }
    }
    if (v9) {
      [v8 stopAccessingSecurityScopedResource];
    }

    if (v15)
    {
      if ([(QLServerThread *)self _canUseAdditionToProvideThumbnail:v15 forThumbnailRequest:v6 taggedLogicalURL:v8])
      {
        id v15 = v15;
        id v18 = v15;
        goto LABEL_24;
      }
      if (a4)
      {
        generationFailedErrorWithUnderlyingError(v6, 0, @"Stored thumbnail version in Generational Storage is invalid for this version of the file");
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (!a4)
    {
LABEL_23:
      id v18 = 0;
      goto LABEL_24;
    }
LABEL_19:
    generationFailedErrorWithUnderlyingError(v6, v16, 0);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = 0;
LABEL_22:
    id v18 = 0;
    *a4 = v19;
    goto LABEL_24;
  }
  id v16 = 0;
  id v15 = 0;
  id v18 = 0;
  if (a4) {
    goto LABEL_19;
  }
LABEL_24:

  return v18;
}

- (void)processLargeThumbnailData:(id)a3 withContentType:(id)a4 isAppContainer:(BOOL)a5 forRequest:(id)a6 fromGenStore:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v11 = a5;
  v88[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  if (!v17) {
    -[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:]();
  }
  id v18 = (void (**)(void, void))v17;
  if (!v14)
  {
    id v35 = _log_3();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:]();
    }

    dispatch_queue_t v36 = NSString;
    int v37 = [v16 request];
    uint64_t v26 = [v36 stringWithFormat:@"Could not generate thumbnail: retrieved thumbnail had nil data for thumbnail request %@", v37];

    uint64_t v38 = (void *)MEMORY[0x1E4F3A6C8];
    CGFloat v39 = [v16 request];
    uint64_t v87 = *MEMORY[0x1E4F28228];
    v88[0] = v26;
    uint64_t v40 = (void *)MEMORY[0x1E4F1C9E8];
    id v41 = (void **)v88;
    id v42 = &v87;
    goto LABEL_19;
  }
  uint64_t v19 = QLThumbnailingImageIOCreateImageSourceFromData();
  if (!v19)
  {
    id v43 = _log_3();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412802;
      id v82 = v14;
      __int16 v83 = 2112;
      id v84 = v15;
      __int16 v85 = 2112;
      id v86 = v16;
      _os_log_error_impl(&dword_1DDC5E000, v43, OS_LOG_TYPE_ERROR, "Received thumbnail data which ImageIO is unable to read (%@ %@) for %@", buf, 0x20u);
    }

    id v44 = NSString;
    uint64_t v45 = [v16 request];
    uint64_t v26 = [v44 stringWithFormat:@"Unable to decode thumbnail image data (of type %@) for thumbnail request %@", v15, v45];

    uint64_t v38 = (void *)MEMORY[0x1E4F3A6C8];
    CGFloat v39 = [v16 request];
    uint64_t v79 = *MEMORY[0x1E4F28228];
    v80 = v26;
    uint64_t v40 = (void *)MEMORY[0x1E4F1C9E8];
    id v41 = &v80;
    id v42 = &v79;
LABEL_19:
    long long v46 = [v40 dictionaryWithObjects:v41 forKeys:v42 count:1];
    long long v47 = [v38 errorWithCode:0 request:v39 additionalUserInfo:v46];

LABEL_23:
    ((void (**)(void, void *))v18)[2](v18, v47);

    goto LABEL_24;
  }
  uint64_t v20 = (const void *)v19;
  QLThumbnailingImageIOGetSizeFromImageSourceAtIndex();
  double v23 = v22;
  double v24 = v21;
  if (v22 == *MEMORY[0x1E4F1DB30] && v21 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    long long v48 = _log_3();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:]();
    }

    long long v49 = NSString;
    id v50 = [v16 request];
    uint64_t v26 = [v49 stringWithFormat:@"Unable to decode thumbnail image data (of type %@) for thumbnail request %@", v15, v50];

    id v51 = (void *)MEMORY[0x1E4F3A6C8];
    v52 = [v16 request];
    uint64_t v77 = *MEMORY[0x1E4F28228];
    v78 = v26;
    id v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    long long v47 = [v51 errorWithCode:0 request:v52 additionalUserInfo:v53];

    CFRelease(v20);
    goto LABEL_23;
  }
  id v65 = v15;
  uint64_t v26 = [v16 request];
  [v26 size];
  QLAdaptSizeInSize();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  [v26 size];
  [v26 minimumDimension];
  [v26 scale];
  uint64_t v31 = QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSource();
  if (v31)
  {
    uint64_t v32 = (CGImage *)v31;
    BOOL v63 = a7;
    uint64_t v64 = [(QLServerThread *)self imageDataForImage:v31];
    id v33 = [MEMORY[0x1E4F3A698] bitmapFormatWithBitmapImage:v32];
    int v34 = _log_3();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:].cold.5();
    }

    -[QLServerThread addImageData:withBitmapFormat:contentRect:hasIconModeApplied:flavor:extensionBadge:metadata:toCacheAndCompleteRequest:](self, "addImageData:withBitmapFormat:contentRect:hasIconModeApplied:flavor:extensionBadge:metadata:toCacheAndCompleteRequest:", v64, v33, v11, 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v16);
    CGImageRelease(v32);

    if (v11)
    {
      CFRelease(v20);
    }
    else
    {
      genstoreCachingQueue = self->_genstoreCachingQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __117__QLServerThread_processLargeThumbnailData_withContentType_isAppContainer_forRequest_fromGenStore_completionHandler___block_invoke;
      block[3] = &unk_1E6D0CD18;
      void block[4] = self;
      id v67 = v14;
      id v68 = v16;
      v69 = v20;
      double v70 = v23;
      double v71 = v24;
      uint64_t v72 = v28;
      uint64_t v73 = v30;
      BOOL v74 = v63;
      dispatch_async(genstoreCachingQueue, block);
    }
    id v15 = v65;
    v18[2](v18, 0);
  }
  else
  {
    __int16 v54 = NSString;
    id v55 = [v16 request];
    __int16 v56 = [v54 stringWithFormat:@"Unable to decode thumbnail image data (of type %@) for thumbnail request %@", v15, v55];

    id v57 = (void *)MEMORY[0x1E4F3A6C8];
    v58 = [v16 request];
    uint64_t v75 = *MEMORY[0x1E4F28228];
    v76 = v56;
    uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    v60 = [v57 errorWithCode:0 request:v58 additionalUserInfo:v59];

    uint64_t v61 = _log_3();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      -[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:].cold.4();
    }

    ((void (**)(void, void *))v18)[2](v18, v60);
    CFRelease(v20);

    id v15 = v65;
  }
LABEL_24:
}

uint64_t __117__QLServerThread_processLargeThumbnailData_withContentType_isAppContainer_forRequest_fromGenStore_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __117__QLServerThread_processLargeThumbnailData_withContentType_isAppContainer_forRequest_fromGenStore_completionHandler___block_invoke_2;
  int v9 = &__block_descriptor_40_e17_v16__0__NSError_8l;
  uint64_t v10 = v4;
  return objc_msgSend(v2, "_cacheThumbnailData:forRequest:imageSource:actualSize:resultSize:fromGenStore:completionHandler:", v1, v3, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

void __117__QLServerThread_processLargeThumbnailData_withContentType_isAppContainer_forRequest_fromGenStore_completionHandler___block_invoke_2(uint64_t a1)
{
}

- (void)_cacheThumbnailData:(id)a3 forRequest:(id)a4 imageSource:(CGImageSource *)a5 actualSize:(CGSize)a6 resultSize:(CGSize)a7 fromGenStore:(BOOL)a8 completionHandler:(id)a9
{
  double height = a7.height;
  double width = a7.width;
  double v13 = a6.height;
  double v14 = a6.width;
  id v18 = a3;
  id v19 = a4;
  uint64_t v20 = (void (**)(id, void))a9;
  double v21 = [v19 taggedLogicalURL];
  double v22 = [v19 request];
  double v23 = v22;
  if (v21)
  {
    if (!a8) {
      [(QLServerThread *)self _saveLargeThumbnailToGenstoreWithData:v18 url:v21];
    }
    v20[2](v20, 0);
  }
  else
  {
    if ([v22 isUbiquitous])
    {
      double v24 = [MEMORY[0x1E4F25D38] defaultManager];
      id v25 = [v23 item];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __114__QLServerThread__cacheThumbnailData_forRequest_imageSource_actualSize_resultSize_fromGenStore_completionHandler___block_invoke;
      v29[3] = &unk_1E6D0CD40;
      id v30 = v23;
      BOOL v40 = a8;
      int v34 = v20;
      uint64_t v31 = self;
      id v32 = v18;
      id v33 = v19;
      id v35 = a5;
      double v36 = v14;
      double v37 = v13;
      double v38 = width;
      double v39 = height;
      [v24 fetchURLForItem:v25 creatingPlaceholderIfMissing:0 completionHandler:v29];

      uint64_t v26 = v30;
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __114__QLServerThread__cacheThumbnailData_forRequest_imageSource_actualSize_resultSize_fromGenStore_completionHandler___block_invoke_2;
      v27[3] = &unk_1E6D0C588;
      uint64_t v28 = v20;
      -[QLServerThread _addAllThumbnailsSizesToCacheForRequest:withImageSource:imageSize:alreadyCachedSize:completionHandler:](self, "_addAllThumbnailsSizesToCacheForRequest:withImageSource:imageSize:alreadyCachedSize:completionHandler:", v19, a5, v27, v14, v13, width, height);
      uint64_t v26 = v28;
    }
  }
}

void __114__QLServerThread__cacheThumbnailData_forRequest_imageSource_actualSize_resultSize_fromGenStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _log_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = [*(id *)(a1 + 32) item];
      *(_DWORD *)os_activity_scope_state_s buf = 138412802;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_error_impl(&dword_1DDC5E000, v7, OS_LOG_TYPE_ERROR, "Error fetching URL for item %@ (got %@): %@", buf, 0x20u);
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 72);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __114__QLServerThread__cacheThumbnailData_forRequest_imageSource_actualSize_resultSize_fromGenStore_completionHandler___block_invoke_57;
      v12[3] = &unk_1E6D0C588;
      uint64_t v10 = *(void *)(a1 + 56);
      id v13 = *(id *)(a1 + 64);
      objc_msgSend(v8, "_addAllThumbnailsSizesToCacheForRequest:withImageSource:imageSize:alreadyCachedSize:completionHandler:", v10, v9, v12, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));

      goto LABEL_6;
    }
    if (!*(unsigned char *)(a1 + 112)) {
      [*(id *)(a1 + 40) _saveLargeThumbnailToGenstoreWithData:*(void *)(a1 + 48) url:v5];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_6:
}

uint64_t __114__QLServerThread__cacheThumbnailData_forRequest_imageSource_actualSize_resultSize_fromGenStore_completionHandler___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __114__QLServerThread__cacheThumbnailData_forRequest_imageSource_actualSize_resultSize_fromGenStore_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_saveLargeThumbnailToGenstoreWithData:(id)a3 url:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unsigned int v25 = 0;
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = a3;
  uint64_t v8 = [v6 _QLTemporaryURLWithExtension:@"jpg" openingFileHandle:&v25 inDirectoryAtURL:0];
  id v9 = objc_alloc(MEMORY[0x1E4F28CB0]);
  uint64_t v10 = (void *)[v9 initWithFileDescriptor:v25 closeOnDealloc:1];
  id v24 = 0;
  int v11 = [v10 writeData:v7 error:&v24];

  id v12 = v24;
  if (v11)
  {
    id v23 = 0;
    char v13 = [v10 closeAndReturnError:&v23];
    id v14 = v23;

    if (v13)
    {
      int v15 = [v5 startAccessingSecurityScopedResource];
      __int16 v16 = (void *)_CFURLPromiseCopyPhysicalURL();
      id v17 = (void *)MEMORY[0x1E4F3A6A8];
      uint64_t v26 = *MEMORY[0x1E4F1C500];
      v27[0] = v8;
      __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      id v22 = v14;
      char v19 = [v17 associateThumbnailImagesDictionary:v18 serializedQuickLookMetadata:0 withDocumentAtURL:v16 error:&v22];
      id v12 = v22;

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = _log_3();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[QLServerThread _saveLargeThumbnailToGenstoreWithData:url:]();
        }
      }
      if (v15) {
        [v5 stopAccessingSecurityScopedResource];
      }
      goto LABEL_13;
    }
    id v12 = v14;
  }
  double v21 = _log_3();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[QLServerThread _saveLargeThumbnailToGenstoreWithData:url:]();
  }

  __int16 v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v16 removeItemAtURL:v8 error:0];
LABEL_13:
}

- (void)_saveLargeThumbnailForDocumentAtURL:(id)a3 toGenstoreWithImage:(CGImage *)a4 automaticallyGenerated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v10 = 0;
  LOBYTE(a4) = [MEMORY[0x1E4F3A6A8] associateImage:a4 metadata:0 automaticallyGenerated:v5 withURL:v7 error:&v10];
  id v8 = v10;
  if ((a4 & 1) == 0)
  {
    id v9 = _log_3();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[QLServerThread _saveLargeThumbnailForDocumentAtURL:toGenstoreWithImage:automaticallyGenerated:]();
    }
  }
}

- (void)_addAllThumbnailsSizesToCacheForRequest:(id)a3 withImageSource:(CGImageSource *)a4 imageSize:(CGSize)a5 alreadyCachedSize:(CGSize)a6 completionHandler:(id)a7
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  CGFloat v10 = a5.height;
  CGFloat v11 = a5.width;
  id v14 = a3;
  id v15 = a7;
  if (a4) {
    CFRetain(a4);
  }
  __int16 v16 = [v14 request];
  id v17 = [(QLServerThread *)self cacheThreadForRequest:v16];

  downscaledThumbnailGenerationQueue = self->_downscaledThumbnailGenerationQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __120__QLServerThread__addAllThumbnailsSizesToCacheForRequest_withImageSource_imageSize_alreadyCachedSize_completionHandler___block_invoke;
  v22[3] = &unk_1E6D0CD90;
  CGFloat v27 = v11;
  CGFloat v28 = v10;
  CGFloat v29 = width;
  CGFloat v30 = height;
  uint64_t v31 = a4;
  id v23 = v14;
  id v24 = self;
  id v25 = v17;
  id v26 = v15;
  id v19 = v15;
  id v20 = v17;
  id v21 = v14;
  [(NSOperationQueue *)downscaledThumbnailGenerationQueue addOperationWithBlock:v22];
}

void __120__QLServerThread__addAllThumbnailsSizesToCacheForRequest_withImageSource_imageSize_alreadyCachedSize_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v32 = xmmword_1DDCB9570;
  long long v33 = xmmword_1DDCB9580;
  uint64_t v34 = 0x4061800000000000;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  long long v30 = xmmword_1DDCB9590;
  uint64_t v31 = 0x4050400000000000;
  do
  {
    QLAdaptSizeInSize();
    if (v4 != *(double *)(a1 + 80) || v3 != *(double *)(a1 + 88))
    {
      id v6 = [*(id *)(a1 + 32) request];
      [v6 scale];
      [v6 interpolationQuality];
      uint64_t v7 = QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSource();
      if (v7)
      {
        id v8 = (CGImage *)v7;
        id v9 = [*(id *)(a1 + 32) request];
        double Width = (double)CGImageGetWidth(v8);
        CGFloat v11 = objc_msgSend(v9, "copyWithSize:", Width, (double)CGImageGetHeight(v8));

        id v12 = [*(id *)(a1 + 40) imageDataForImage:v8];
        char v13 = [MEMORY[0x1E4F3A698] bitmapFormatWithBitmapImage:v8];
        CGImageRelease(v8);
        id v14 = *(void **)(a1 + 48);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __120__QLServerThread__addAllThumbnailsSizesToCacheForRequest_withImageSource_imageSize_alreadyCachedSize_completionHandler___block_invoke_2;
        v21[3] = &unk_1E6D0CD68;
        id v15 = v14;
        id v22 = v15;
        id v23 = v11;
        id v24 = v13;
        id v25 = v12;
        id v26 = *(id *)(a1 + 32);
        id v27 = v6;
        id v16 = v12;
        id v17 = v13;
        id v18 = v11;
        [v15 enqueueWriting:v21];
      }
    }
    v2 += 8;
  }
  while (v2 != 40);
  uint64_t v19 = *(void *)(a1 + 56);
  if (v19) {
    (*(void (**)(void))(v19 + 16))();
  }
  id v20 = *(const void **)(a1 + 96);
  if (v20) {
    CFRelease(v20);
  }
}

uint64_t __120__QLServerThread__addAllThumbnailsSizesToCacheForRequest_withImageSource_imageSize_alreadyCachedSize_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = [*(id *)(a1 + 64) badgeType];
  uint64_t v7 = [*(id *)(a1 + 72) externalThumbnailGeneratorDataHash];
  return objc_msgSend(v2, "addThumbnailIntoCache:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:", v3, v4, v5, 0, 0, v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v7);
}

- (void)generateThumbnailForThumbnailRequest:(id)a3 shouldUpdateGenstore:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v31 = a5;
  id v9 = [v8 request];
  CGFloat v10 = (void *)[v9 copy];

  if (v6)
  {
    [v10 scale];
    double v12 = 1024.0 / v11;
    [v10 scale];
    objc_msgSend(v10, "setSize:", v12, 1024.0 / v13);
  }
  id v14 = [v8 taggedLogicalURL];
  int v15 = [v10 isDataBased];
  id v16 = _log_3();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v17)
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      id v46 = v8;
      _os_log_impl(&dword_1DDC5E000, v16, OS_LOG_TYPE_INFO, "About to generate a thumbnail locally for data request: %@", buf, 0xCu);
    }

    id v18 = objc_alloc(MEMORY[0x1E4F3A6D0]);
    uint64_t v19 = [v10 data];
    id v20 = [v10 contentType];
    id v21 = (void *)[v18 initWithData:v19 contentType:v20];
    goto LABEL_14;
  }
  if (v17)
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v46 = v14;
    _os_log_impl(&dword_1DDC5E000, v16, OS_LOG_TYPE_INFO, "About to generate a thumbnail locally from URL: %@", buf, 0xCu);
  }

  if ([v10 isFileBased])
  {
    uint64_t v22 = [v10 genericSandboxWrapper];
LABEL_13:
    uint64_t v19 = (void *)v22;
    id v23 = objc_alloc(MEMORY[0x1E4F3A6D0]);
    id v20 = [v10 parentDirectorySandboxWrapper];
    id v24 = [v10 contentType];
    id v21 = (void *)[v23 initWithURLWrapper:v19 parentDirectoryWrapper:v20 contentType:v24];

LABEL_14:
    if ([v10 provideLowQualityThumbnail]) {
      uint64_t v25 = [v8 needsLowQualityThumbnailGeneration];
    }
    else {
      uint64_t v25 = 0;
    }
    id v26 = [[QLPreviewThumbnailGenerator alloc] initWithGeneratorRequest:v8 lowQuality:v25 thumbnailItem:v21];
    [(QLPreviewThumbnailGenerator *)v26 setGenerationQueue:self->_previewThumbnailGeneratorQueue];
    objc_initWeak((id *)buf, v26);
    id v27 = [v8 request];
    kdebug_trace();

    [v8 setGenerator:v26];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __94__QLServerThread_generateThumbnailForThumbnailRequest_shouldUpdateGenstore_completionHandler___block_invoke;
    v43[3] = &unk_1E6D0CDB8;
    id v44 = v8;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __94__QLServerThread_generateThumbnailForThumbnailRequest_shouldUpdateGenstore_completionHandler___block_invoke_2;
    v32[3] = &unk_1E6D0CDE0;
    id v33 = v44;
    objc_copyWeak(&v39, (id *)buf);
    char v40 = v25;
    uint64_t v28 = v26;
    uint64_t v34 = v28;
    id v35 = v14;
    id v29 = v31;
    char v41 = v15;
    id v38 = v29;
    double v36 = self;
    id v37 = v10;
    BOOL v42 = v6;
    [(QLPreviewThumbnailGenerator *)v28 generateWithWillStartBlock:v43 completionBlock:v32];

    objc_destroyWeak(&v39);
    objc_destroyWeak((id *)buf);

    goto LABEL_18;
  }
  if (v14)
  {
    uint64_t v22 = [MEMORY[0x1E4F25D78] wrapperWithURL:v14 readonly:1 error:0];
    goto LABEL_13;
  }
  long long v30 = _log_3();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
    -[QLServerThread generateThumbnailForThumbnailRequest:shouldUpdateGenstore:completionHandler:]();
  }

  id v21 = generationFailedErrorWithUnderlyingError(v8, 0, @"Item does not have a file URL, cannot generate thumbnail locally");
  (*((void (**)(id, void *))v31 + 2))(v31, v21);
LABEL_18:
}

void __94__QLServerThread_generateThumbnailForThumbnailRequest_shouldUpdateGenstore_completionHandler___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) generationHandler];
  uint64_t v2 = [*(id *)(a1 + 32) request];
  uint64_t v3 = [v2 uuid];
  [v4 didUpdateStatus:0 ofThumbnailGenerationWithUUID:v3];
}

void __94__QLServerThread_generateThumbnailForThumbnailRequest_shouldUpdateGenstore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 32) request];
  kdebug_trace();

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  [*(id *)(a1 + 32) setGenerationError:v3];
  uint64_t v7 = [WeakRetained thumbnailImages];
  if (*(unsigned char *)(a1 + 88)) {
    int v8 = 0;
  }
  else {
    int v8 = [*(id *)(a1 + 40) resultIsLowQuality];
  }
  id v9 = [v7 firstObject];
  uint64_t v10 = [v9 CGImage];

  double v11 = _log_3();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (!v10)
  {
    if (v12)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 48);
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_1DDC5E000, v11, OS_LOG_TYPE_INFO, "Failed to generate a thumbnail from a local file with QLPreviewThumbnailGenerator for request: %@ URL: %@.", buf, 0x16u);
    }

    uint64_t v15 = *(void *)(a1 + 72);
    uint64_t v16 = generationFailedErrorWithUnderlyingError(*(void **)(a1 + 32), v3, 0);
    goto LABEL_12;
  }
  if (v8)
  {
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_1DDC5E000, v11, OS_LOG_TYPE_INFO, "Did generate a low quality thumbnail from a local file with QLPreviewThumbnailGenerator for request, but was expecting a full representation thumbnail: %@ URL: %@.", buf, 0x16u);
    }

    uint64_t v15 = *(void *)(a1 + 72);
    uint64_t v16 = generationFailedError(*(void **)(a1 + 32));
LABEL_12:
    uint64_t v19 = (void *)v16;
    (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, v16);

    goto LABEL_43;
  }
  if (v12)
  {
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 48);
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v21;
    _os_log_impl(&dword_1DDC5E000, v11, OS_LOG_TYPE_INFO, "Did generate a thumbnail from a local file with QLPreviewThumbnailGenerator for request: %@ URL: %@.", buf, 0x16u);
  }

  id v85 = WeakRetained;
  id v84 = v7;
  if (([*(id *)(a1 + 40) resultIsLowQuality] & 1) != 0
    || ![*v4 cacheEnabled]
    || *(unsigned char *)(a1 + 89))
  {
    id v83 = v3;
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    [*(id *)(a1 + 40) contentRect];
    *(void *)os_activity_scope_state_s buf = v23;
    *(void *)&buf[8] = v24;
    *(void *)&buf[16] = v25;
    double v96 = v26;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v27 = v7;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v88 objects:v94 count:16];
    id v86 = v22;
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v89 != v30) {
            objc_enumerationMutation(v27);
          }
          long long v32 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          id v33 = objc_msgSend(*(id *)(a1 + 56), "imageDataForImage:", objc_msgSend(v32, "CGImage"));
          uint64_t v34 = objc_msgSend(MEMORY[0x1E4F3A698], "bitmapFormatWithBitmapImage:", objc_msgSend(v32, "CGImage"));
          if ([*(id *)(a1 + 64) iconMode])
          {
            if (([*(id *)(a1 + 40) resultHasIconModeApplied] & 1) == 0)
            {
              id v35 = [v22 firstObject];

              if (!v35)
              {
                id v87 = 0;
                [*(id *)(a1 + 64) size];
                double v37 = v36;
                double v39 = v38;
                [*(id *)(a1 + 64) scale];
                double v41 = v40;
                uint64_t v42 = [*(id *)(a1 + 40) flavor];
                [*(id *)(a1 + 40) extensionBadge];
                v44 = id v43 = v27;
                LOBYTE(v82) = [*(id *)(a1 + 64) provideLowQualityThumbnail];
                uint64_t v45 = +[QLPreviewThumbnailGenerator generateIconDataFromThumbnailData:inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:](QLPreviewThumbnailGenerator, "generateIconDataFromThumbnailData:inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:", v33, v34, &v87, buf, v42, v44, v37, v39, v41, v82, [*(id *)(a1 + 64) iconVariant]);
                id v46 = v87;

                id v27 = v43;
                uint64_t v34 = v46;
                uint64_t v22 = v86;
                id v33 = (void *)v45;
              }
            }
          }
          uint64_t v47 = [MEMORY[0x1E4F3A6A0] imageWithFormat:v34 data:v33];
          [v22 addObject:v47];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v88 objects:v94 count:16];
      }
      while (v29);
    }

    long long v48 = [v22 firstObject];
    if ([*(id *)(a1 + 64) wantsBaseline])
    {
      long long v49 = [*(id *)(a1 + 40) generatedProperties];
      uint64_t v50 = [v49 baseline];

      if (v50 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v48)
        {
          id v51 = [v48 format];
          [v51 width];
          [v51 height];
          [v51 bitsPerComponent];
          [v51 bitsPerPixel];
          [v51 bytesPerRow];
          [v51 bitmapInfo];
          id v52 = [v48 data];
          [v52 bytes];
          uint64_t v53 = _QLThumbnailComputeBaselineFromData();

          __int16 v54 = [*(id *)(a1 + 40) generatedProperties];
          [v54 setBaseline:v53];
        }
      }
    }
    id v55 = [*(id *)(a1 + 40) generatedProperties];

    if (v55)
    {
      __int16 v56 = (void *)MEMORY[0x1E4F28DB0];
      id v57 = [*(id *)(a1 + 40) generatedProperties];
      v58 = [v56 archivedDataWithRootObject:v57 requiringSecureCoding:1 error:0];
    }
    else
    {
      v58 = 0;
    }
    if ([*(id *)(a1 + 40) resultIsLowQuality]) {
      uint64_t v59 = 1;
    }
    else {
      uint64_t v59 = 2;
    }
    v60 = _log_3();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      uint64_t v61 = *(void *)(a1 + 32);
      *(_DWORD *)v92 = 138412290;
      uint64_t v93 = v61;
      _os_log_impl(&dword_1DDC5E000, v60, OS_LOG_TYPE_INFO, "completing thumbnail request %@ after generation without caching", v92, 0xCu);
    }

    objc_super v62 = *(void **)(a1 + 56);
    uint64_t v63 = *(void *)(a1 + 32);
    uint64_t v64 = [*(id *)(a1 + 40) flavor];
    id v65 = v86;
    objc_msgSend(v62, "completeThumbnailRequest:images:metadata:contentRect:thumbnailRepresentation:iconFlavor:clientShouldTakeOwnership:", v63, v86, v58, v59, v64, 1, *(double *)buf, *(double *)&buf[8], *(double *)&buf[16], v96);

    id v3 = v83;
  }
  else
  {
    v66 = _log_3();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
      __94__QLServerThread_generateThumbnailForThumbnailRequest_shouldUpdateGenstore_completionHandler___block_invoke_2_cold_1();
    }

    id v65 = [v7 firstObject];
    id v67 = objc_msgSend(*(id *)(a1 + 56), "imageDataForImage:", objc_msgSend(v65, "CGImage"));
    id v68 = objc_msgSend(MEMORY[0x1E4F3A698], "bitmapFormatWithBitmapImage:", objc_msgSend(v65, "CGImage"));
    v69 = *(void **)(a1 + 56);
    [*(id *)(a1 + 40) contentRect];
    double v71 = v70;
    double v73 = v72;
    double v75 = v74;
    double v77 = v76;
    uint64_t v78 = [*(id *)(a1 + 40) resultHasIconModeApplied];
    uint64_t v79 = [*(id *)(a1 + 40) flavor];
    v80 = [*(id *)(a1 + 40) extensionBadge];
    v81 = [*(id *)(a1 + 40) generatedProperties];
    objc_msgSend(v69, "addImageData:withBitmapFormat:contentRect:hasIconModeApplied:flavor:extensionBadge:metadata:toCacheAndCompleteRequest:", v67, v68, v78, v79, v80, v81, v71, v73, v75, v77, *(void *)(a1 + 32));

    if (*(unsigned char *)(a1 + 90)) {
      objc_msgSend(*(id *)(a1 + 56), "_saveLargeThumbnailForDocumentAtURL:toGenstoreWithImage:automaticallyGenerated:", *(void *)(a1 + 48), objc_msgSend(v65, "CGImage"), 1);
    }
  }
  id WeakRetained = v85;

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  id v4 = (id *)(a1 + 32);
  uint64_t v7 = v84;
LABEL_43:
  [*v4 setGenerator:0];
}

- (void)findThumbnailInAddition:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x1E4F1C500];
  id v11 = a3;
  BOOL v12 = [v11 thumbnailDataForKey:v10];
  uint64_t v13 = [v11 thumbnailURLForKey:v10];

  id v20 = 0;
  uint64_t v14 = *MEMORY[0x1E4F1C728];
  id v19 = 0;
  char v15 = [v13 getResourceValue:&v20 forKey:v14 error:&v19];
  id v16 = v20;
  id v17 = v19;
  if ((v15 & 1) == 0)
  {
    uint64_t v18 = _log_3();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[QLServerThread findThumbnailInAddition:request:completionHandler:]();
    }
  }
  [(QLServerThread *)self processLargeThumbnailData:v12 withContentType:v16 isAppContainer:0 forRequest:v8 fromGenStore:1 completionHandler:v9];
}

- (void)addImageData:(id)a3 toCacheForRequest:(id)a4 withBitmapFormat:(id)a5 contentRect:(CGRect)a6 flavor:(int)a7 metadata:(id)a8
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a8;
  uint64_t v21 = [v18 request];
  char v22 = [v21 forceGeneration];

  if ((v22 & 1) == 0)
  {
    uint64_t v23 = _log_3();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      id v39 = v18;
      _os_log_impl(&dword_1DDC5E000, v23, OS_LOG_TYPE_INFO, "Will add image to cache for request: %@.", buf, 0xCu);
    }

    uint64_t v24 = [v18 request];
    uint64_t v25 = [(QLServerThread *)self cacheThreadForRequest:v24];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    void v27[2] = __94__QLServerThread_addImageData_toCacheForRequest_withBitmapFormat_contentRect_flavor_metadata___block_invoke;
    v27[3] = &unk_1E6D0CE08;
    id v28 = v18;
    id v29 = v19;
    id v30 = v17;
    id v31 = v25;
    id v32 = v20;
    int v37 = a7;
    CGFloat v33 = x;
    CGFloat v34 = y;
    CGFloat v35 = width;
    CGFloat v36 = height;
    id v26 = v25;
    [v26 enqueueWriting:v27];
  }
}

uint64_t __94__QLServerThread_addImageData_toCacheForRequest_withBitmapFormat_contentRect_flavor_metadata___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    uint64_t v19 = v3;
    _os_log_impl(&dword_1DDC5E000, v2, OS_LOG_TYPE_INFO, "Adding image to cache for request: %@.", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) bytesPerRow];
  unint64_t v5 = [*(id *)(a1 + 40) height] * v4;
  id v6 = *(id *)(a1 + 48);
  if (v5 < [*(id *)(a1 + 48) length])
  {
    uint64_t v7 = (v5 + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00];
    if (v7 == [*(id *)(a1 + 48) length])
    {
      uint64_t v8 = objc_msgSend(*(id *)(a1 + 48), "subdataWithRange:", 0, v5);

      id v6 = (id)v8;
    }
  }
  id v9 = *(void **)(a1 + 56);
  uint64_t v10 = [*(id *)(a1 + 32) request];
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(unsigned int *)(a1 + 104);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = [*(id *)(a1 + 32) badgeType];
  char v15 = [*(id *)(a1 + 32) request];
  uint64_t v16 = objc_msgSend(v9, "addThumbnailIntoCache:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:", v10, v13, v6, v11, v12, v14, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), objc_msgSend(v15, "externalThumbnailGeneratorDataHash"));

  return v16;
}

- (void)addImageData:(id)a3 withBitmapFormat:(id)a4 contentRect:(CGRect)a5 hasIconModeApplied:(BOOL)a6 flavor:(int)a7 extensionBadge:(id)a8 metadata:(id)a9 toCacheAndCompleteRequest:(id)a10
{
  uint64_t v12 = *(void *)&a7;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v36 = a8;
  id v22 = a9;
  id v23 = a10;
  double v38 = x;
  double v39 = y;
  double v40 = width;
  double v41 = height;
  uint64_t v24 = [v23 request];
  if ([v24 iconMode] && !a6)
  {
    id v37 = 0;
    [v24 size];
    double v26 = v25;
    double v28 = v27;
    [v24 scale];
    double v30 = v29;
    LOBYTE(v35) = [v24 provideLowQualityThumbnail];
    uint64_t v31 = +[QLPreviewThumbnailGenerator generateIconDataFromThumbnailData:inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:](QLPreviewThumbnailGenerator, "generateIconDataFromThumbnailData:inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:", v20, v21, &v37, &v38, v12, v36, v26, v28, v30, v35, [v24 iconVariant]);
    id v32 = v37;

    id v21 = v32;
    id v20 = (id)v31;
  }
  if ([v24 wantsBaseline] && objc_msgSend(v22, "baseline") == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v21 width];
    [v21 height];
    [v21 bitsPerComponent];
    [v21 bitsPerPixel];
    [v21 bytesPerRow];
    [v21 bitmapInfo];
    [v20 bytes];
    [v22 setBaseline:_QLThumbnailComputeBaselineFromData()];
  }
  if (v22)
  {
    CGFloat v33 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v22 requiringSecureCoding:1 error:0];
  }
  else
  {
    CGFloat v33 = 0;
  }
  CGFloat v34 = _log_3();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v43 = v23;
    _os_log_impl(&dword_1DDC5E000, v34, OS_LOG_TYPE_INFO, "completing thumbnail request %@ in addImageData", buf, 0xCu);
  }

  LOBYTE(v35) = 1;
  -[QLServerThread completeThumbnailRequest:bitmapData:metadata:contentRect:thumbnailRepresentation:iconFlavor:format:clientShouldTakeOwnership:](self, "completeThumbnailRequest:bitmapData:metadata:contentRect:thumbnailRepresentation:iconFlavor:format:clientShouldTakeOwnership:", v23, v20, v33, 2, v12, v21, v38, v39, v40, v41, v35);
  -[QLServerThread addImageData:toCacheForRequest:withBitmapFormat:contentRect:flavor:metadata:](self, "addImageData:toCacheForRequest:withBitmapFormat:contentRect:flavor:metadata:", v20, v23, v21, v12, v33, v38, v39, v40, v41);
}

- (id)imageDataForImage:(CGImage *)a3
{
  if (a3)
  {
    DataProvider = CGImageGetDataProvider(a3);
    CFDataRef v5 = CGDataProviderCopyData(DataProvider);
  }
  else
  {
    CFDataRef v5 = 0;
  }
  return v5;
}

- (void)thumbnailRequestWasCancelled:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFDataRef v5 = _log_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1DDC5E000, v5, OS_LOG_TYPE_INFO, "thumbnailRequestWasCancelled %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = cancelledError(v4);
  [(QLServerThread *)self failedToCompleteThumbnailRequest:v4 error:v6];
}

- (void)didNotFindLowQualityEntryInCachedForThumbnailRequest:(id)a3 error:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  queue = self->_queue;
  id v8 = a4;
  dispatch_assert_queue_V2(queue);
  uint64_t v9 = _log_3();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1DDC5E000, v9, OS_LOG_TYPE_INFO, "didNotFindLowQualityEntryInCachedForThumbnailRequest -> sendResultForThumbnailRequest %@", buf, 0xCu);
  }

  LOBYTE(v10) = 0;
  -[QLServerThread sendResultForThumbnailRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:reenqueueRequest:error:](self, "sendResultForThumbnailRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:reenqueueRequest:error:", v6, 0, 0, 0, 1, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v10, v8);
}

- (void)failedToCompleteThumbnailRequest:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  [v6 setGenerationError:v7];
  id v8 = _log_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[QLServerThread failedToCompleteThumbnailRequest:error:]();
  }

  uint64_t v9 = [v6 request];
  uint64_t v10 = [v9 requestedMostRepresentativeType];
  LOBYTE(v11) = 1;
  -[QLServerThread sendResultForThumbnailRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:reenqueueRequest:error:](self, "sendResultForThumbnailRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:reenqueueRequest:error:", v6, 0, 0, 0, v10, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v11, v7);
}

- (BOOL)_saveResultForThumbnailRequest:(id)a3 withImage:(id)a4 error:(id *)a5
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  queue = self->_queue;
  id v10 = a4;
  dispatch_assert_queue_V2(queue);
  uint64_t v11 = [v8 request];
  id v12 = [v11 saveURL];
  uint64_t v13 = [v11 saveURLContentType];
  uint64_t v14 = [v13 identifier];

  char v15 = (void *)QLImageCreateForDefaultThumbnailGenerationFromData();
  if (v15)
  {
    if (v12)
    {
      int v52 = [v12 startAccessingSecurityScopedResource];
      id v55 = 0;
      CFURLRef v16 = [MEMORY[0x1E4F1CB10] _QLCreateTemporaryReplacementURLForOriginalFileAtURL:v12 withExtension:0 temporaryDirectoryURL:&v55];
      id v51 = v55;
      if (!v16)
      {
        id v32 = _log_3();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[QLServerThread _saveResultForThumbnailRequest:withImage:error:].cold.5();
        }

        id v18 = 0;
        CFURLRef v16 = 0;
LABEL_23:
        CGFloat v33 = _log_3();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[QLServerThread _saveResultForThumbnailRequest:withImage:error:]();
        }

        if (a5)
        {
          [MEMORY[0x1E4F3A6C8] errorWithCode:1 request:v11 additionalUserInfo:0];
          char v21 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
LABEL_28:
            if (v51) {
              [MEMORY[0x1E4F28CB8] _QLTRemoveTemporaryDirectoryAtURL:v51];
            }
            if (v52) {
              [v12 stopAccessingSecurityScopedResource];
            }

            goto LABEL_33;
          }
        }
        else
        {
          char v21 = 0;
          if (!v10) {
            goto LABEL_28;
          }
        }
LABEL_27:
        CFRelease(v15);
        goto LABEL_28;
      }
      id v17 = CGImageDestinationCreateWithURL(v16, v14, 1uLL, 0);
      id v18 = 0;
      if (!v17) {
        goto LABEL_23;
      }
    }
    else
    {
      id v18 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
      id v17 = CGImageDestinationCreateWithData(v18, v14, 1uLL, 0);
      int v52 = 0;
      id v51 = 0;
      CFURLRef v16 = 0;
      if (!v17) {
        goto LABEL_23;
      }
    }
    uint64_t v50 = v14;
    uint64_t v68 = *MEMORY[0x1E4F2F450];
    uint64_t v69 = MEMORY[0x1E4F1CC38];
    CGImageDestinationAddImage(v17, (CGImageRef)v15, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1]);
    BOOL v22 = CGImageDestinationFinalize(v17);
    CFRelease(v17);
    if (!v22)
    {
      double v29 = _log_3();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[QLServerThread _saveResultForThumbnailRequest:withImage:error:].cold.4();
      }

      if (a5)
      {
        id v48 = (id)MEMORY[0x1E4F3A6C8];
        uint64_t v66 = *MEMORY[0x1E4F28228];
        double v30 = [NSString stringWithFormat:@"Failed to save thumbnail for %@ to %@", v11, v12];
        id v67 = v30;
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        *a5 = [v48 errorWithCode:1 request:v11 additionalUserInfo:v31];

        char v21 = 0;
      }
      else
      {
        char v21 = 1;
      }
      uint64_t v14 = v50;
      if (!v10) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    if (!v18)
    {
      uint64_t v35 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v53 = 0;
      char v21 = [v35 replaceItemAtURL:v12 withItemAtURL:v16 backupItemName:0 options:0 resultingItemURL:0 error:&v53];
      id v36 = v53;

      uint64_t v14 = v50;
      if ((v21 & 1) == 0)
      {
        id v49 = v36;
        id v37 = _log_3();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[QLServerThread _saveResultForThumbnailRequest:withImage:error:]();
        }

        id v36 = v49;
        if (a5)
        {
          uint64_t v38 = [NSString stringWithFormat:@"Failed to save thumbnail for %@ to %@", v8, v12];
          id v46 = (void *)v38;
          if (v49)
          {
            uint64_t v39 = *MEMORY[0x1E4F28A50];
            v58[0] = *MEMORY[0x1E4F28228];
            v58[1] = v39;
            v59[0] = v38;
            v59[1] = v49;
            double v40 = (void *)MEMORY[0x1E4F1C9E8];
            double v41 = v59;
            uint64_t v42 = v58;
            uint64_t v43 = 2;
          }
          else
          {
            uint64_t v56 = *MEMORY[0x1E4F28228];
            uint64_t v57 = v38;
            double v40 = (void *)MEMORY[0x1E4F1C9E8];
            double v41 = &v57;
            uint64_t v42 = &v56;
            uint64_t v43 = 1;
          }
          uint64_t v45 = [v40 dictionaryWithObjects:v41 forKeys:v42 count:v43];
          *a5 = [MEMORY[0x1E4F3A6C8] errorWithCode:1 request:v11 additionalUserInfo:v45];
          id v36 = v49;
          *a5 = v49;
        }
      }

      id v18 = 0;
      if (!v10) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    id v23 = [v11 saveFileHandle];
    id v54 = 0;
    char v24 = [v23 writeData:v18 error:&v54];
    id v47 = v54;

    double v25 = _log_3();
    double v26 = v25;
    if (v24)
    {
      uint64_t v14 = v50;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_48;
      }
      uint64_t v27 = [(__CFData *)v18 length];
      double v28 = [v11 saveFileHandle];
      *(_DWORD *)os_activity_scope_state_s buf = 134218498;
      uint64_t v61 = v27;
      __int16 v62 = 2112;
      uint64_t v63 = v28;
      __int16 v64 = 2112;
      id v65 = v8;
      _os_log_debug_impl(&dword_1DDC5E000, v26, OS_LOG_TYPE_DEBUG, "Successfully wrote data of length %llu to file handle %@ for request %@", buf, 0x20u);
    }
    else
    {
      uint64_t v14 = v50;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      uint64_t v44 = [(__CFData *)v18 length];
      double v28 = [v11 saveFileHandle];
      *(_DWORD *)os_activity_scope_state_s buf = 134218498;
      uint64_t v61 = v44;
      __int16 v62 = 2112;
      uint64_t v63 = v28;
      __int16 v64 = 2112;
      id v65 = v47;
      _os_log_error_impl(&dword_1DDC5E000, v26, OS_LOG_TYPE_ERROR, "Could not write saved thumbnail (length: %llu) to file handle %@: %@", buf, 0x20u);
    }

    uint64_t v14 = v50;
LABEL_48:

    char v21 = 1;
    if (!v10) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  uint64_t v19 = _log_3();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[QLServerThread _saveResultForThumbnailRequest:withImage:error:]();
  }

  if (!a5)
  {
    char v21 = 0;
    goto LABEL_34;
  }
  id v18 = [NSString stringWithFormat:@"Failed to decode thumbnail data to save for %@", v11];
  id v20 = (void *)MEMORY[0x1E4F3A6C8];
  uint64_t v70 = *MEMORY[0x1E4F28228];
  v71[0] = v18;
  CFURLRef v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
  [v20 errorWithCode:1 request:v11 additionalUserInfo:v16];
  char v21 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

LABEL_34:
  return v21;
}

- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v20 = a4;
  id v7 = objc_opt_new();
  domainsToCaches = self->_domainsToCaches;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __123__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers_completionHandler___block_invoke;
  v30[3] = &unk_1E6D0CE78;
  id v9 = v7;
  id v31 = v9;
  [(NSMutableDictionary *)domainsToCaches enumerateKeysAndObjectsUsingBlock:v30];
  uint64_t v19 = self;
  [v9 addObject:self->_cacheThread];
  id v10 = dispatch_group_create();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        CFURLRef v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
        dispatch_group_enter(v10);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __123__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers_completionHandler___block_invoke_2;
        v23[3] = &unk_1E6D0CEA0;
        v23[4] = v16;
        id v24 = v6;
        double v25 = v10;
        [v16 enqueueWriting:v23];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v13);
  }

  completionBlocksQueue = v19->_completionBlocksQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers_completionHandler___block_invoke_3;
  block[3] = &unk_1E6D0C588;
  id v22 = v20;
  id v18 = v20;
  dispatch_group_notify(v10, completionBlocksQueue, block);
}

uint64_t __123__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __123__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "locked_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:", *(void *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  return v2;
}

uint64_t __123__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v20 = a4;
  id v7 = objc_opt_new();
  domainsToCaches = self->_domainsToCaches;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __102__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers_completionHandler___block_invoke;
  v30[3] = &unk_1E6D0CE78;
  id v9 = v7;
  id v31 = v9;
  [(NSMutableDictionary *)domainsToCaches enumerateKeysAndObjectsUsingBlock:v30];
  uint64_t v19 = self;
  [v9 addObject:self->_cacheThread];
  id v10 = dispatch_group_create();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        CFURLRef v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
        dispatch_group_enter(v10);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __102__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers_completionHandler___block_invoke_2;
        v23[3] = &unk_1E6D0CEA0;
        v23[4] = v16;
        id v24 = v6;
        double v25 = v10;
        [v16 enqueueWriting:v23];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v13);
  }

  completionBlocksQueue = v19->_completionBlocksQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers_completionHandler___block_invoke_3;
  block[3] = &unk_1E6D0C588;
  id v22 = v20;
  id v18 = v20;
  dispatch_group_notify(v10, completionBlocksQueue, block);
}

uint64_t __102__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __102__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "locked_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:", *(void *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  return v2;
}

uint64_t __102__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_canUseAdditionToProvideThumbnail:(id)a3 forThumbnailRequest:(id)a4 taggedLogicalURL:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if (a3)
  {
    id v7 = (objc_class *)MEMORY[0x1E4F3A6F0];
    id v8 = a3;
    id v9 = (void *)[[v7 alloc] initWithFileURL:v6 automaticallyGenerated:1];
    int v10 = [v8 shouldBeInvalidatedByThumbnailVersion:v9];

    id v11 = _log_3();
    uint64_t v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v6;
        _os_log_impl(&dword_1DDC5E000, v12, OS_LOG_TYPE_INFO, "not trusting thumbnail in GenStore for %@ because it is not for the right version", (uint8_t *)&v17, 0xCu);
      }

      if (!v6
        || ([MEMORY[0x1E4F3A700] contentTypeForURL:v6],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            BOOL v14 = +[QLPreviewThumbnailGenerator canGenerateThumbnailForContentType:atSize:](QLPreviewThumbnailGenerator, "canGenerateThumbnailForContentType:atSize:", v13, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8)), v13, v14))
      {
        BOOL v15 = 0;
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v12 = _log_3();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[QLServerThread _canUseAdditionToProvideThumbnail:forThumbnailRequest:taggedLogicalURL:](v12);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[QLServerThread _canUseAdditionToProvideThumbnail:forThumbnailRequest:taggedLogicalURL:]();
    }

    BOOL v15 = 1;
    goto LABEL_14;
  }
  BOOL v15 = 0;
LABEL_15:

  return v15;
}

- (void)reset
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __23__QLServerThread_reset__block_invoke;
  v2[3] = &unk_1E6D0C648;
  v2[4] = self;
  [(QLServerThread *)self perform:v2];
}

uint64_t __23__QLServerThread_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) forEachCacheThread:&__block_literal_global_91];
}

uint64_t __23__QLServerThread_reset__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reset];
}

- (void)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3
{
}

- (void)forEachCacheThread:(id)a3
{
  id v4 = a3;
  CFDataRef v5 = objc_opt_new();
  domainsToCaches = self->_domainsToCaches;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __37__QLServerThread_forEachCacheThread___block_invoke;
  v19[3] = &unk_1E6D0CEC8;
  id v7 = v4;
  id v22 = v7;
  id v8 = v5;
  id v20 = v8;
  char v21 = self;
  [(NSMutableDictionary *)domainsToCaches enumerateKeysAndObjectsUsingBlock:v19];
  volumesToCaches = self->_volumesToCaches;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  BOOL v14 = __37__QLServerThread_forEachCacheThread___block_invoke_2;
  BOOL v15 = &unk_1E6D0CEF0;
  id v10 = v8;
  id v16 = v10;
  id v11 = v7;
  int v17 = self;
  id v18 = v11;
  [(NSMutableDictionary *)volumesToCaches enumerateKeysAndObjectsUsingBlock:&v12];
  if (objc_msgSend(v10, "containsObject:", self->_cacheThread, v12, v13, v14, v15)) {
    (*((void (**)(id, _QLCacheThread *))v11 + 2))(v11, self->_cacheThread);
  }
}

uint64_t __37__QLServerThread_forEachCacheThread___block_invoke(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[5] + 176);
  return [v2 addObject:v3];
}

void __37__QLServerThread_forEachCacheThread___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) addObject:*(void *)(*(void *)(a1 + 40) + 176)];
  }
}

- (id)cacheThreadForVolume:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_volumesToCaches objectForKeyedSubscript:a3];
}

- (id)cacheThreadForFileIdentifier:(id)a3 atURL:(id)a4
{
  id v6 = a4;
  uint64_t v10 = [a3 fsid];
  id v7 = [MEMORY[0x1E4F29238] valueWithBytes:&v10 objCType:"{fsid=[2i]}"];
  os_unfair_lock_lock(&self->_cacheInitLock);
  id v8 = [(NSMutableDictionary *)self->_fsidsToCaches objectForKeyedSubscript:v7];
  if (!v8)
  {
    id v8 = [(QLServerThread *)self uncachedCacheThreadForFileAtURL:v6];
    [(NSMutableDictionary *)self->_fsidsToCaches setObject:v8 forKeyedSubscript:v7];
  }
  os_unfair_lock_unlock(&self->_cacheInitLock);

  return v8;
}

- (id)allKnownDataSeparatedVolumes
{
  return (id)[(NSMutableDictionary *)self->_volumesToCaches allKeys];
}

- (NSMutableDictionary)externalThumbnailCaches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExternalThumbnailCaches:(id)a3
{
}

- (NSMutableDictionary)queuedDownloadRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueuedDownloadRequests:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSURL)overrideBasePersonaVolumesURLForTesting
{
  return (NSURL *)objc_getProperty(self, a2, 168, 1);
}

- (void)setOverrideBasePersonaVolumesURLForTesting:(id)a3
{
}

- (void)setPendingRequests:(id)a3
{
}

- (OS_dispatch_queue)completionBlocksQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCompletionBlocksQueue:(id)a3
{
}

- (_QLCacheThread)cacheThread
{
  return (_QLCacheThread *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCacheThread:(id)a3
{
}

- (NSMutableDictionary)domainsToCaches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDomainsToCaches:(id)a3
{
}

- (NSMutableDictionary)volumesToCaches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setVolumesToCaches:(id)a3
{
}

- (NSMutableDictionary)fsidsToCaches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setFsidsToCaches:(id)a3
{
}

- (os_unfair_lock_s)cacheInitLock
{
  return self->_cacheInitLock;
}

- (NSMutableDictionary)externalThumbnailCacheInboxURLs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExternalThumbnailCacheInboxURLs:(id)a3
{
}

- (NSMutableDictionary)externalThumbnailCacheThumbnailURLs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setExternalThumbnailCacheThumbnailURLs:(id)a3
{
}

- (NSMutableDictionary)externalThumbnailCacheAvailablePendingBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExternalThumbnailCacheAvailablePendingBlocks:(id)a3
{
}

- (NSMutableSet)knownDomainsWithoutExternalThumbnailCaches
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setKnownDomainsWithoutExternalThumbnailCaches:(id)a3
{
}

- (OS_dispatch_queue)externalThumbnailCacheQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExternalThumbnailCacheQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsidsToCaches, 0);
  objc_storeStrong((id *)&self->_volumesToCaches, 0);
  objc_storeStrong((id *)&self->_domainsToCaches, 0);
  objc_storeStrong((id *)&self->_cacheThread, 0);
  objc_storeStrong((id *)&self->_overrideBasePersonaVolumesURLForTesting, 0);
  objc_storeStrong((id *)&self->_previewThumbnailGeneratorQueue, 0);
  objc_storeStrong((id *)&self->_downscaledThumbnailGenerationQueue, 0);
  objc_storeStrong((id *)&self->_uncachedThumbnailRetrievalQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_genstoreCachingQueue, 0);
  objc_storeStrong((id *)&self->_completionBlocksQueue, 0);
  objc_storeStrong((id *)&self->_knownDomainsWithoutExternalThumbnailCaches, 0);
  objc_storeStrong((id *)&self->_externalThumbnailCacheAvailablePendingBlocks, 0);
  objc_storeStrong((id *)&self->_externalThumbnailCacheThumbnailURLs, 0);
  objc_storeStrong((id *)&self->_externalThumbnailCacheInboxURLs, 0);
  objc_storeStrong((id *)&self->_externalThumbnailCaches, 0);
  objc_storeStrong((id *)&self->_queuedDownloadRequests, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_externalThumbnailCacheQueue, 0);
  objc_storeStrong((id *)&self->_downloadResponseProcessingQueue, 0);
  objc_storeStrong((id *)&self->_pendingDownloadsQueue, 0);
  objc_storeStrong((id *)&self->_downloadsOperationQueue, 0);
}

- (id)failedDownloadErrorForRequest:(id)a3 underlyingError:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 item];
  if ([v7 isDownloaded]) {
    id v8 = @"Could not generate thumbnail for %@, and could not download a thumbnail either";
  }
  else {
    id v8 = @"Could not download a thumbnail for cloud item %@";
  }
  id v9 = objc_msgSend(NSString, "stringWithFormat:", v8, v7);
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = *MEMORY[0x1E4F28228];
  [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28228]];
  if (v6) {
    [v10 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F3A6C8];
  uint64_t v13 = [v5 request];
  uint64_t v17 = v11;
  v18[0] = v9;
  BOOL v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  BOOL v15 = [v12 errorWithCode:3 request:v13 additionalUserInfo:v14];

  return v15;
}

- (void)_downloadThumbnailForRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [v6 item];
  id v9 = [v8 providerDomainID];
  if ((([v9 hasPrefix:@"com.apple.filesystems.UserFS.FileProvider"] & 1) != 0
     || ([v9 hasPrefix:@"com.apple.FileProvider.LocalStorage"] & 1) != 0
     || [v9 hasPrefix:@"com.apple.SMBClientProvider.FileProvider"])
    && (objc_msgSend(v8, "fp_isContainer") & 1) == 0)
  {
    id v16 = _log_9();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_1DDC5E000, v16, OS_LOG_TYPE_INFO, "Item provider doesn't support fetching thumbnails for %@", buf, 0xCu);
    }

    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
    uint64_t v13 = self;
    id v14 = v6;
    BOOL v15 = v11;
    goto LABEL_12;
  }
  uint64_t v10 = [v8 providerDomainID];
  uint64_t v11 = [(QLServerThread *)self cacheThreadForProviderDomainID:v10];

  if ([v11 itemIsMissingRemoteThumbnail:v8])
  {
    uint64_t v12 = _log_9();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_1DDC5E000, v12, OS_LOG_TYPE_INFO, "We cached there is no thumbnail on the server for %@, failing", buf, 0xCu);
    }

    uint64_t v13 = self;
    id v14 = v6;
    BOOL v15 = 0;
LABEL_12:
    uint64_t v17 = [(QLServerThread *)v13 failedDownloadErrorForRequest:v14 underlyingError:v15];
    v7[2](v7, v17);
    goto LABEL_16;
  }
  [v6 setDownloadCompletionHandler:v7];
  id v18 = _log_9();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[QLServerThread(UbiquitousRequests) _downloadThumbnailForRequest:completionHandler:]();
  }

  uint64_t v19 = [v6 generationHandler];
  id v20 = [v6 request];
  char v21 = [v20 uuid];
  [v19 didUpdateStatus:1 ofThumbnailGenerationWithUUID:v21];

  pendingDownloadsQueue = self->_pendingDownloadsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke;
  block[3] = &unk_1E6D0C7F0;
  id v24 = v6;
  double v25 = self;
  id v26 = v8;
  dispatch_async(pendingDownloadsQueue, block);

  uint64_t v17 = v24;
LABEL_16:
}

void __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] request];
  uint64_t v3 = _log_9();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    char v21 = v2;
    _os_log_impl(&dword_1DDC5E000, v3, OS_LOG_TYPE_INFO, "Adding thumbnail-download to queue for request: %@", buf, 0xCu);
  }

  id v4 = [a1[5] queuedDownloadRequests];
  id v5 = [a1[6] providerDomainID];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = [a1[6] providerDomainID];
    [v4 setObject:v6 forKeyedSubscript:v7];
  }
  id v8 = [a1[6] itemIdentifier];
  id v9 = [v6 objectForKeyedSubscript:v8];

  if (!v9)
  {
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = [a1[6] itemIdentifier];
    [v6 setObject:v10 forKeyedSubscript:v11];
  }
  uint64_t v12 = [a1[6] itemIdentifier];
  uint64_t v13 = [v6 objectForKeyedSubscript:v12];
  [v13 addObject:a1[4]];

  if ((unint64_t)[v6 count] > 9)
  {
    uint64_t v17 = _log_9();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke_cold_1();
    }

    [a1[5] drainDownloadsQueueIfNeeded];
  }
  else if (!*((unsigned char *)a1[5] + 24))
  {
    dispatch_time_t v14 = dispatch_time(0, 100000000);
    id v15 = a1[5];
    id v16 = *((void *)v15 + 2);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke_18;
    v18[3] = &unk_1E6D0C750;
    v18[4] = v15;
    id v19 = v2;
    dispatch_after(v14, v16, v18);
    *((unsigned char *)a1[5] + 24) = 1;
  }
}

uint64_t __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke_18(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t v2 = _log_9();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke_18_cold_1(a1, v2);
  }

  return [*(id *)(a1 + 32) drainDownloadsQueueIfNeeded];
}

- (void)downloadThumbnailForRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 request];
  char v9 = [v8 isDownloadingAllowed];

  if (v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __84__QLServerThread_UbiquitousRequests__downloadThumbnailForRequest_completionHandler___block_invoke;
    v18[3] = &unk_1E6D0D498;
    id v19 = v6;
    id v20 = self;
    id v21 = v7;
    [v19 fetchFPItemWithCompletionHandler:v18];

    id v10 = v19;
  }
  else
  {
    uint64_t v11 = _log_9();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      id v25 = v6;
      _os_log_impl(&dword_1DDC5E000, v11, OS_LOG_TYPE_INFO, "Will not add thumbnail-download to queue because downloading is not allowed for request: %@.", buf, 0xCu);
    }

    uint64_t v12 = NSString;
    uint64_t v13 = [v6 request];
    id v10 = [v12 stringWithFormat:@"Failed to generate a thumbnail for request %@ and thumbnail downloading is not allowed for this request", v13];

    dispatch_time_t v14 = (void *)MEMORY[0x1E4F3A6C8];
    id v15 = [v6 request];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    id v23 = v10;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v17 = [v14 errorWithCode:0 request:v15 additionalUserInfo:v16];
    (*((void (**)(id, void *))v7 + 2))(v7, v17);
  }
}

void __84__QLServerThread_UbiquitousRequests__downloadThumbnailForRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) item];

  if (v4)
  {
    [*(id *)(a1 + 40) _downloadThumbnailForRequest:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    id v5 = _log_9();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __84__QLServerThread_UbiquitousRequests__downloadThumbnailForRequest_completionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32));
    }

    id v6 = NSString;
    id v7 = [*(id *)(a1 + 32) request];
    id v8 = [v6 stringWithFormat:@"Failed to generate a thumbnail for request %@ and could not download thumbnail: no backing ubiquitous item found (%@)", v7, v3];

    char v9 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v16 = *MEMORY[0x1E4F28228];
    v17[0] = v8;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v11 = [v9 dictionaryWithDictionary:v10];

    if (v3) {
      [v11 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = (void *)MEMORY[0x1E4F3A6C8];
    dispatch_time_t v14 = [*(id *)(a1 + 32) request];
    id v15 = [v13 errorWithCode:0 request:v14 additionalUserInfo:v11];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);
  }
}

- (BOOL)downloadThumbnails:(id)a3 forProvider:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pendingDownloadsQueue);
  if ([v6 count])
  {
    uint64_t v29 = [(QLServerThread *)self cacheThreadForProviderDomainID:v7];
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    char v9 = [v6 allValues];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v45;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = [*(id *)(*((void *)&v44 + 1) + 8 * v12) anyObject];
          dispatch_time_t v14 = [v13 item];
          [v8 addObject:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v10);
    }

    id v15 = _log_9();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[QLServerThread(UbiquitousRequests) downloadThumbnails:forProvider:](v6, (uint64_t)self, v15);
    }

    uint64_t v16 = _log_9();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

    if (v17) {
      [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_8];
    }
    atomic_fetch_add(&self->_thumbnailDownloadsInFlight, [v8 count]);
    id v18 = [MEMORY[0x1E4F25D38] defaultManager];
    id v19 = objc_msgSend(v18, "thumbnailsFetchOperationForItems:withSize:scale:", v8, 1024.0, 1024.0, 2.0);

    objc_initWeak(&location, self);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_30;
    v37[3] = &unk_1E6D0D508;
    objc_copyWeak(&v42, &location);
    id v22 = v6;
    id v38 = v22;
    uint64_t v39 = self;
    id v23 = v20;
    id v40 = v23;
    id v24 = v21;
    id v41 = v24;
    [v19 setPerThumbnailCompletionBlock:v37];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_33;
    v30[3] = &unk_1E6D0D580;
    objc_copyWeak(&v36, &location);
    id v31 = v22;
    id v32 = self;
    id v25 = v29;
    id v33 = v25;
    id v26 = v23;
    id v34 = v26;
    id v27 = v24;
    id v35 = v27;
    [v19 setThumbnailsFetchCompletionBlock:v30];
    [(NSOperationQueue *)self->_downloadsOperationQueue addOperation:v19];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v42);

    objc_destroyWeak(&location);
  }

  return 1;
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _log_9();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_cold_1((uint64_t)v4);
  }
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_30(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  dispatch_time_t v14 = WeakRetained;
  if (WeakRetained)
  {
    atomic_fetch_add((atomic_uint *volatile)WeakRetained + 7, 0xFFFFFFFF);
    id v15 = *((void *)WeakRetained + 4);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2;
    block[3] = &unk_1E6D0D4E0;
    id v20 = v10;
    id v21 = v11;
    objc_copyWeak(&v28, (id *)(a1 + 64));
    id v22 = *(id *)(a1 + 32);
    id v23 = v9;
    id v16 = v12;
    uint64_t v17 = *(void *)(a1 + 40);
    id v18 = *(void **)(a1 + 48);
    id v24 = v16;
    uint64_t v25 = v17;
    id v26 = v18;
    id v27 = *(id *)(a1 + 56);
    dispatch_async(v15, block);

    objc_destroyWeak(&v28);
  }
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2(uint64_t a1)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v54 = *(id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained)
  {
    uint64_t v50 = (uint64_t *)(a1 + 56);
    int v52 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 56)];
    id v3 = [v52 anyObject];
    id v51 = [v3 item];

    id v4 = _log_9();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_cold_3(v50);
    }

    if (v52)
    {
      if (v2)
      {
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v5 = [v52 allObjects];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v68 objects:v82 count:16];
        if (v6)
        {
          uint64_t v7 = *(void *)v69;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v69 != v7) {
                objc_enumerationMutation(v5);
              }
              id v9 = *(void **)(*((void *)&v68 + 1) + 8 * i);
              *(void *)&state[8] = 0;
              *(void *)os_activity_scope_state_s state = 0;
              id v10 = [v9 activity];
              os_activity_scope_enter(v10, (os_activity_scope_state_t)state);

              id v11 = _log_9();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf.opaque[0]) = 138412290;
                *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v9;
                _os_log_impl(&dword_1DDC5E000, v11, OS_LOG_TYPE_INFO, "Downloaded thumbnail for %@; adding to cache",
                  (uint8_t *)&buf,
                  0xCu);
              }

              os_activity_scope_leave((os_activity_scope_state_t)state);
            }
            uint64_t v6 = [v5 countByEnumeratingWithState:&v68 objects:v82 count:16];
          }
          while (v6);
        }

        uint64_t v12 = [v51 isContainer];
        [*(id *)(a1 + 88) addObject:v51];
        if (([v54 isEqualToString:*MEMORY[0x1E4F25BD0]] & 1) != 0
          || [v54 isEqualToString:*MEMORY[0x1E4F25BD8]])
        {
          uint64_t v13 = [v52 anyObject];
          dispatch_time_t v14 = [v13 request];

          [v14 size];
          double v16 = v15;
          double v18 = v17;
          [v14 scale];
          uint64_t v20 = objc_msgSend(WeakRetained, "processedPNGAppIconDataForData:ofType:size:scale:", v2, v54, v16, v18, v19);

          uint64_t v21 = [(id)*MEMORY[0x1E4F44460] identifier];

          id v54 = (id)v21;
          id v2 = (id)v20;
        }
        if (v2)
        {
          long long v66 = 0uLL;
          long long v67 = 0uLL;
          long long v64 = 0uLL;
          long long v65 = 0uLL;
          id v22 = [v52 allObjects];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v64 objects:v81 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v65;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v65 != v24) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v26 = *(void *)(*((void *)&v64 + 1) + 8 * j);
                uint64_t v59 = MEMORY[0x1E4F143A8];
                uint64_t v60 = 3221225472;
                uint64_t v61 = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_31;
                __int16 v62 = &unk_1E6D0C868;
                uint64_t v63 = v26;
                objc_msgSend(WeakRetained, "processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:", v2, v54, v12);
              }
              uint64_t v23 = [v22 countByEnumeratingWithState:&v64 objects:v81 count:16];
            }
            while (v23);
          }
        }
        else
        {
          long long v57 = 0uLL;
          long long v58 = 0uLL;
          long long v55 = 0uLL;
          long long v56 = 0uLL;
          id v22 = [v52 allObjects];
          id v2 = (id)[v22 countByEnumeratingWithState:&v55 objects:v80 count:16];
          if (v2)
          {
            uint64_t v36 = *(void *)v56;
            do
            {
              for (k = 0; k != v2; k = (char *)k + 1)
              {
                if (*(void *)v56 != v36) {
                  objc_enumerationMutation(v22);
                }
                id v38 = *(void **)(*((void *)&v55 + 1) + 8 * (void)k);
                *(void *)&state[8] = 0;
                *(void *)os_activity_scope_state_s state = 0;
                uint64_t v39 = [v38 activity];
                os_activity_scope_enter(v39, (os_activity_scope_state_t)state);

                id v40 = _log_9();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf.opaque[0]) = 138412290;
                  *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v38;
                  _os_log_error_impl(&dword_1DDC5E000, v40, OS_LOG_TYPE_ERROR, "Unable to process icon data for %@", (uint8_t *)&buf, 0xCu);
                }

                id v41 = [v38 downloadCompletionHandler];
                v41[2](v41, *(void *)(a1 + 64));

                os_activity_scope_leave((os_activity_scope_state_t)state);
              }
              id v2 = (id)[v22 countByEnumeratingWithState:&v55 objects:v80 count:16];
            }
            while (v2);
          }
        }
      }
      else if (*(void *)(a1 + 64))
      {
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v22 = [v52 allObjects];
        id v2 = (id)[v22 countByEnumeratingWithState:&v76 objects:v86 count:16];
        if (v2)
        {
          uint64_t v28 = *(void *)v77;
          do
          {
            for (m = 0; m != v2; m = (char *)m + 1)
            {
              if (*(void *)v77 != v28) {
                objc_enumerationMutation(v22);
              }
              double v30 = *(void **)(*((void *)&v76 + 1) + 8 * (void)m);
              buf.opaque[1] = 0;
              buf.opaque[0] = 0;
              id v31 = [v30 activity];
              os_activity_scope_enter(v31, &buf);

              id v32 = _log_9();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                uint64_t v33 = *(void *)(a1 + 64);
                *(_DWORD *)os_activity_scope_state_s state = 138412546;
                *(void *)&state[4] = v30;
                *(_WORD *)&state[12] = 2112;
                *(void *)&state[14] = v33;
                _os_log_impl(&dword_1DDC5E000, v32, OS_LOG_TYPE_INFO, "No thumbnail for %@: thumbnail download failed [%@]", state, 0x16u);
              }

              id v34 = [v30 downloadCompletionHandler];
              id v35 = [*(id *)(a1 + 72) failedDownloadErrorForRequest:v30 underlyingError:*(void *)(a1 + 64)];
              ((void (**)(void, void *))v34)[2](v34, v35);

              os_activity_scope_leave(&buf);
            }
            id v2 = (id)[v22 countByEnumeratingWithState:&v76 objects:v86 count:16];
          }
          while (v2);
        }
      }
      else
      {
        [*(id *)(a1 + 80) addObject:v51];
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v22 = [v52 allObjects];
        id v2 = (id)[v22 countByEnumeratingWithState:&v72 objects:v83 count:16];
        if (v2)
        {
          uint64_t v42 = *(void *)v73;
          do
          {
            for (n = 0; n != v2; n = (char *)n + 1)
            {
              if (*(void *)v73 != v42) {
                objc_enumerationMutation(v22);
              }
              long long v44 = *(void **)(*((void *)&v72 + 1) + 8 * (void)n);
              *(void *)&state[8] = 0;
              *(void *)os_activity_scope_state_s state = 0;
              long long v45 = [v44 activity];
              os_activity_scope_enter(v45, (os_activity_scope_state_t)state);

              long long v46 = _log_9();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf.opaque[0]) = 138412290;
                *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v44;
                _os_log_impl(&dword_1DDC5E000, v46, OS_LOG_TYPE_INFO, "No thumbnail in the cloud for %@", (uint8_t *)&buf, 0xCu);
              }

              long long v47 = [*(id *)(a1 + 72) failedDownloadErrorForRequest:v44 underlyingError:0];
              id v48 = [v44 downloadCompletionHandler];
              ((void (**)(void, void *))v48)[2](v48, v47);

              os_activity_scope_leave((os_activity_scope_state_t)state);
            }
            id v2 = (id)[v22 countByEnumeratingWithState:&v72 objects:v83 count:16];
          }
          while (v2);
        }
      }

      uint64_t v49 = _log_9();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_cold_2();
      }

      [*(id *)(a1 + 48) setObject:0 forKeyedSubscript:*(void *)(a1 + 56)];
    }
    else
    {
      id v27 = _log_9();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_cold_1(v50, v27);
      }
    }
  }
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _log_9();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_31_cold_1(a1, v4);
    }
  }
  id v5 = [*(id *)(a1 + 32) downloadCompletionHandler];
  ((void (**)(void, id))v5)[2](v5, v3);
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_33(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_34;
    v8[3] = &unk_1E6D0D558;
    void v8[4] = WeakRetained;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(a1 + 48);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    id v12 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 64);
    dispatch_async(v4, v8);
  }
}

uint64_t __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_34(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_3;
  block[3] = &unk_1E6D0C648;
  void block[4] = v2;
  dispatch_async(v3, block);
  atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 28), -(int)[*(id *)(a1 + 40) count]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_35;
  v6[3] = &unk_1E6D0D530;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 48);
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  [*(id *)(a1 + 40) removeAllObjects];
  [*(id *)(a1 + 56) noteRemoteThumbnailMissingForItems:*(void *)(a1 + 64)];
  return [*(id *)(a1 + 56) noteRemoteThumbnailPresentForItems:*(void *)(a1 + 72)];
}

uint64_t __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = _log_9();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_3_cold_1();
  }

  return [*(id *)(a1 + 32) drainDownloadsQueueIfNeeded];
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 allObjects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        id v11 = [v10 activity];
        os_activity_scope_enter(v11, &state);

        id v12 = _log_9();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)os_activity_scope_state_s buf = 138412290;
          id v22 = v10;
          _os_log_error_impl(&dword_1DDC5E000, v12, OS_LOG_TYPE_ERROR, "Failing %@, which did not get a per-thumbnail download completion block", buf, 0xCu);
        }

        id v13 = [*(id *)(a1 + 32) failedDownloadErrorForRequest:v10 underlyingError:0];
        dispatch_time_t v14 = [v10 downloadCompletionHandler];
        ((void (**)(void, void *))v14)[2](v14, v13);

        os_activity_scope_leave(&state);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }
}

- (void)drainDownloadsQueueIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pendingDownloadsQueue);
  queuedDownloadRequests = self->_queuedDownloadRequests;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__QLServerThread_UbiquitousRequests__drainDownloadsQueueIfNeeded__block_invoke;
  v4[3] = &unk_1E6D0D5A8;
  v4[4] = self;
  [(NSMutableDictionary *)queuedDownloadRequests enumerateKeysAndObjectsUsingBlock:v4];
}

void __65__QLServerThread_UbiquitousRequests__drainDownloadsQueueIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  uint64_t v6 = (void *)[v7 mutableCopy];
  LODWORD(a1) = [*(id *)(a1 + 32) downloadThumbnails:v6 forProvider:v5];

  if (a1) {
    [v7 removeAllObjects];
  }
}

- (id)processedPNGAppIconDataForData:(id)a3 ofType:(id)a4 size:(CGSize)a5 scale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a4;
  id v13 = _log_9();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[QLServerThread(UbiquitousRequests) processedPNGAppIconDataForData:ofType:size:scale:]();
  }

  int v14 = [v12 isEqualToString:*MEMORY[0x1E4F25BD0]];
  if (v14) {
    id v15 = -[QLServerThread _createUndecoratedAppIconForData:ofSize:scale:](self, "_createUndecoratedAppIconForData:ofSize:scale:", v11, width, height, a6);
  }
  else {
    id v15 = (CGImage *)LICreateIconFromCachedBitmap();
  }
  double v16 = v15;
  if (v15)
  {
    long long v17 = QLCGImageRefPNGRepresentation();

    CFRelease(v16);
  }
  else
  {
    long long v18 = _log_9();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[QLServerThread(UbiquitousRequests) processedPNGAppIconDataForData:ofType:size:scale:]();
    }

    long long v17 = 0;
  }
  return v17;
}

- (CGImage)_createUndecoratedAppIconForData:(id)a3 ofSize:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v22 = *MEMORY[0x1E4F2FF48];
  v23[0] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  CFDataRef v9 = (const __CFData *)a3;
  CFDictionaryRef v10 = (const __CFDictionary *)[v8 dictionaryWithObjects:v23 forKeys:&v22 count:1];
  CGImageSourceRef v11 = CGImageSourceCreateWithData(v9, v10);

  if (!v11) {
    return 0;
  }
  if (!CGImageSourceGetCount(v11))
  {
    CFRelease(v11);
    return 0;
  }
  ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(v11, 0, v10);
  CFRelease(v11);
  if (!ImageAtIndex) {
    return 0;
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F6F1E8]) initWithCGImage:ImageAtIndex scale:1.0];
  id v14 = objc_alloc_init(MEMORY[0x1E4F6F258]);
  objc_msgSend(v14, "setSize:", width, height);
  [v14 setScale:a5];
  id v15 = objc_alloc(MEMORY[0x1E4F6F248]);
  uint64_t v21 = v13;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  long long v17 = (void *)[v15 initWithImages:v16];

  long long v18 = [v17 prepareImageForDescriptor:v14];
  long long v19 = (CGImage *)[v18 CGImage];
  CGImageRetain(v19);
  CFRelease(ImageAtIndex);

  return v19;
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_DEBUG, "Got external cache for %@", (uint8_t *)&v3, 0xCu);
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Error while fetching thumbnail from external cache: %@", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Received thumbnail data which ImageIO is unable to read (%@).", v2, v3, v4, v5, v6);
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Received thumbnail data which ImageIO is unable to read (%@): image size is zero.", v2, v3, v4, v5, v6);
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Could not create image from thumbnail data at %@ for %@");
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, v0, v1, "Found thumbnail for %@ in external cache: %@");
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, v0, v1, "Got thumbnail URL %@ in external cache for %@");
}

void __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Failed storing thumbnail for %@ in external thumbnail cache: %@");
}

- (void)initWithCacheSize:(os_log_t)log location:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "Could not enable the thumbnails cache", v1, 2u);
}

- (void)makeCacheThreadForPersonaString:containerURL:.cold.1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "failed creating container with error %llu", v2, v3, v4, v5, v6);
}

- (void)makeCacheThreadForPersonaString:containerURL:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "[ERROR] Can't adopt persona %@: %@");
}

- (void)makeCacheThreadForPersonaString:containerURL:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "[ERROR] won't restore persona: %@", v2, v3, v4, v5, v6);
}

- (void)uncachedCacheThreadForProviderDomainID:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Failed to fetch domain for domain ID %@ (%@)");
}

- (void)uncachedCacheThreadForFileAtURL:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Could not retrieve container for %s", v2, v3, v4, v5, v6);
}

- (void)uncachedCacheThreadForFileAtURL:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Could not list persona, error: %@", v2, v3, v4, v5, v6);
}

- (void)generateSuccessiveThumbnailRepresentationsForGeneratorRequests:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "generateSuccessiveThumbnailRepresentationsForRequests: %@", v2, v3, v4, v5, v6);
}

void __50__QLServerThread__installRequestsFinishedWatchdog__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Request %@ has been pending for more than 10 minutes", v2, v3, v4, v5, v6);
}

- (void)_addThumbnailRequestBatchToQueue:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "thumbnail requests queued (%@), relinquishing server thread", v2, v3, v4, v5, v6);
}

- (void)queueThumbnailRequest:tryCache:tryAdditionsFirst:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "failed to queue %@ for cache; falling back", v2, v3, v4, v5, v6);
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Queuing thumbnail request %@: request is cancelled", v2, v3, v4, v5, v6);
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_26_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "%@ is not ubiquitous, but does not reference a valid file either", v2, v3, v4, v5, v6);
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Beginning uncached retrieval: thumbnail request %@ cancelled", v2, v3, v4, v5, v6);
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_29_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "File for %@ is not downloaded, trying genstore / download of the thumbnail", v2, v3, v4, v5, v6);
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_29_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Could not determine if %@ is for an ubiquitous file", v2, v3, v4, v5, v6);
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_30_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, v0, v1, "generateThumbnailForThumbnailRequest completion: thumbnail request %@ cancelled. Additionally, hit error %@ while generating thumbnail");
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_30_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, v0, v1, "Hit error %@ during generation of thumbnail for %@, so trying genstore / download");
}

- (void)findUncachedThumbnailInGenStoreOrDownload:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Skipping GenStore because %@ may not be materialized yet", v2, v3, v4, v5, v6);
}

void __78__QLServerThread_findUncachedThumbnailInGenStoreOrDownload_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "findUncachedThumbnailInGenStoreForRequest: thumbnail request %@ cancelled", v2, v3, v4, v5, v6);
}

- (void)processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:.cold.1()
{
  __assert_rtn("-[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:]", "QLServerThread.m", 767, "completionHandler != nil");
}

- (void)processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Could not generate thumbnail for %@ because received nil data (content type: %@)");
}

- (void)processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Thumbnail size could not be determined from thumbnail data for %@", v2, v3, v4, v5, v6);
}

- (void)processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Failed to create thumbnail from image source for %@", v2, v3, v4, v5, v6);
}

- (void)processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "processLargeThumbnailData: adding image data to cache and completing request %@", v2, v3, v4, v5, v6);
}

- (void)_saveLargeThumbnailToGenstoreWithData:url:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Could not associate large thumbnail to GS file at URL: %@ (%@)");
}

- (void)_saveLargeThumbnailToGenstoreWithData:url:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Could not save thumbnail data for %@ to genstore: %@");
}

- (void)_saveLargeThumbnailForDocumentAtURL:toGenstoreWithImage:automaticallyGenerated:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Could not associate existing thumbnail image with the document at URL %@: %@");
}

- (void)generateThumbnailForThumbnailRequest:shouldUpdateGenstore:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_1DDC5E000, v0, OS_LOG_TYPE_FAULT, "No URL to generate thumbnail for %@", v1, 0xCu);
}

void __94__QLServerThread_generateThumbnailForThumbnailRequest_shouldUpdateGenstore_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "after generation: adding image data to cache and completing request %@", v2, v3, v4, v5, v6);
}

- (void)findThumbnailInAddition:request:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Got error %@ trying to find content type for %@");
}

- (void)failedToCompleteThumbnailRequest:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, v0, v1, "failedToCompleteThumbnailRequest -> sendResultForThumbnailRequest %@ [%@]");
}

void __160__QLServerThread_sendResultForThumbnailRequest_images_metadata_contentRect_iconFlavor_thumbnailRepresentation_clientShouldTakeOwnership_reenqueueRequest_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Sending thumbnail data to the host for request %@ from pending requests and removing it", v2, v3, v4, v5, v6);
}

void __160__QLServerThread_sendResultForThumbnailRequest_images_metadata_contentRect_iconFlavor_thumbnailRepresentation_clientShouldTakeOwnership_reenqueueRequest_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "Sending nil thumbnail data to the host for request %@ from pending requests and removing it because saving best representation failed", v2, v3, v4, v5, v6);
}

- (void)_notifyGenerationHandlerOfThumbnailGenerationForRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Missing error during thumbnail request %@, using a generic error", v2, v3, v4, v5, v6);
}

- (void)_saveResultForThumbnailRequest:withImage:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Failed to create thumbnail image to save at URL: %@", v2, v3, v4, v5, v6);
}

- (void)_saveResultForThumbnailRequest:withImage:error:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Could not save thumbnail at URL %@ for request %@: could not create CGImageDestinationRef");
}

- (void)_saveResultForThumbnailRequest:withImage:error:.cold.3()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Could not save thumbnail at URL: %@. Error: %@");
}

- (void)_saveResultForThumbnailRequest:withImage:error:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "CGImageDestinationFinalize failed to add image to URL: %@.", v2, v3, v4, v5, v6);
}

- (void)_saveResultForThumbnailRequest:withImage:error:.cold.5()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_0(&dword_1DDC5E000, v0, v1, "Could not save thumbnail at URL %@ for request %@: could not create CGImageDestinationRef because could not obtain temporary URL");
}

void __51__QLServerThread__completeHandledThumbnailRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8_0();
  uint64_t v3 = v0;
  _os_log_fault_impl(&dword_1DDC5E000, v1, OS_LOG_TYPE_FAULT, "Request %@ is already completed at %@", v2, 0x16u);
}

- (void)_canUseAdditionToProvideThumbnail:(os_log_t)log forThumbnailRequest:taggedLogicalURL:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_DEBUG, "using the thumbnail from GenStore anyway because we do not have a choice", v1, 2u);
}

- (void)_canUseAdditionToProvideThumbnail:forThumbnailRequest:taggedLogicalURL:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_1DDC5E000, v0, v1, "addition from GenStore is valid for %@", v2, v3, v4, v5, v6);
}

void __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Draining the downloads queue because we have more than 10 thumbnails in queue", v2, v3, v4, v5, v6);
}

void __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke_18_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_DEBUG, "Draining the downloads queue because 100ms have elapsed since %@ was enqueued", (uint8_t *)&v3, 0xCu);
}

void __84__QLServerThread_UbiquitousRequests__downloadThumbnailForRequest_completionHandler___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(&dword_1DDC5E000, v2, OS_LOG_TYPE_ERROR, "Could not fetch FPItem for request: %@ (error: %@)", (uint8_t *)&v3, 0x16u);
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, v1, v2, "download: %@ (%@)", (void)v3, DWORD2(v3));
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_FAULT, "perThumbnailCompletionBlock was called for %@, but this identifier wasn't in the requests or already received its perThumbnailCompletionBlock", (uint8_t *)&v3, 0xCu);
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, v0, v1, "clearing generatorRequests %@ for %@");
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_cold_3(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, v1, v2, "perThumbnailCompletionBlock for %@, associated with requests %@", (void)v3, DWORD2(v3));
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_31_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_ERROR, "Unable to process thumbnail data for %@", (uint8_t *)&v3, 0xCu);
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Draining downloads queue because a batch is finished", v2, v3, v4, v5, v6);
}

@end