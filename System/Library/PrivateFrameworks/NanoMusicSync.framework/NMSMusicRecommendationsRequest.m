@interface NMSMusicRecommendationsRequest
+ (id)_recentMusicDirectory;
- (BOOL)useCachedDataOnly;
- (NSData)cachedData;
- (NSDictionary)unarchivedCombinedResponsesDictionary;
- (id)_heavyRotationCacheURL;
- (id)_starterPackMultiplexCacheURL;
- (id)_starterPackRoomCacheURL;
- (id)_unarchivedCombinedResponsesDictionary;
- (void)_continueToHeavyRotationRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5;
- (void)_continueToLegacyEditorialRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5;
- (void)_continueToLegacyForYouRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5;
- (void)_continueToLibraryImportWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5;
- (void)_continueToLibraryRecentMusicRecommedationsWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5;
- (void)_continueToProcessResultsWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5;
- (void)_continueToRecentMusicRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5;
- (void)_continueToStarterPackMultiplexRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5;
- (void)_continueToStarterPackRoomRequestWithURL:(id)a3 context:(id)a4 queue:(id)a5 responseHandler:(id)a6;
- (void)_finishWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5;
- (void)_performEditorialBrowseRequestWithCompletion:(id)a3;
- (void)_performForYouRequestWithCompletion:(id)a3;
- (void)_performHeavyRotationRequestWithCompletion:(id)a3;
- (void)_performLegacyLibraryImportChangeRequestWithModelObjects:(id)a3 completion:(id)a4;
- (void)_performLibraryImportChangeRequestWithModelObjects:(id)a3 completion:(id)a4;
- (void)_performLibraryRecentMusicRequestWithCompletion:(id)a3;
- (void)_performStarterPackMultiplexRequestWithCompletion:(id)a3;
- (void)_performStarterPackRoomRequestWithURL:(id)a3 completion:(id)a4;
- (void)_unarchivedCombinedResponsesDictionary;
- (void)_writeData:(id)a3 toURL:(id)a4;
- (void)performWithResponseHandler:(id)a3;
- (void)setCachedData:(id)a3;
- (void)setUnarchivedCombinedResponsesDictionary:(id)a3;
- (void)setUseCachedDataOnly:(BOOL)a3;
@end

@implementation NMSMusicRecommendationsRequest

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.NanoMusicSync.NMSMusicRecommendationsRequest", 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__NMSMusicRecommendationsRequest_performWithResponseHandler___block_invoke;
  block[3] = &unk_264633C68;
  block[4] = self;
  dispatch_queue_t v9 = v5;
  id v10 = v4;
  id v6 = v4;
  v7 = v5;
  dispatch_async(v7, block);
}

void __61__NMSMusicRecommendationsRequest_performWithResponseHandler___block_invoke(uint64_t a1)
{
  id v4 = objc_alloc_init(NMSMusicRecommendationsRequestContext);
  v2 = +[NMSyncDefaults sharedDefaults];
  v3 = [v2 minimumNumberOfRecentMusicModelObjects];
  -[NMSMusicRecommendationsRequestContext setMinimumNumberOfRecentMusicModelObjects:](v4, "setMinimumNumberOfRecentMusicModelObjects:", [v3 unsignedIntegerValue]);

  [*(id *)(a1 + 32) _continueToRecentMusicRequestWithContext:v4 queue:*(void *)(a1 + 40) responseHandler:*(void *)(a1 + 48)];
}

- (void)_continueToRecentMusicRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v14 = a3;
  v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2(v8);
  id v10 = +[NMSSubscriptionManager sharedManager];
  int v11 = [v10 hasCapability:1];

  if (v11)
  {
    if (self->_useCachedDataOnly
      && (-[NMSMusicRecommendationsRequest _unarchivedCombinedResponsesDictionary](self, "_unarchivedCombinedResponsesDictionary"), v12 = objc_claimAutoreleasedReturnValue(), [v12 objectForKeyedSubscript:@"recommendationsArray"], v13 = objc_claimAutoreleasedReturnValue(), v13, v12, v13))
    {
      [(NMSMusicRecommendationsRequest *)self _continueToLegacyForYouRequestWithContext:v14 queue:v8 responseHandler:v9];
    }
    else
    {
      [(NMSMusicRecommendationsRequest *)self _continueToHeavyRotationRequestWithContext:v14 queue:v8 responseHandler:v9];
    }
  }
  else
  {
    [(NMSMusicRecommendationsRequest *)self _continueToLibraryRecentMusicRecommedationsWithContext:v14 queue:v8 responseHandler:v9];
  }
}

- (void)_continueToHeavyRotationRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(v9);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __99__NMSMusicRecommendationsRequest__continueToHeavyRotationRequestWithContext_queue_responseHandler___block_invoke;
  v14[3] = &unk_264633CB8;
  v15 = v9;
  id v16 = v8;
  v17 = self;
  id v18 = v10;
  id v11 = v8;
  id v12 = v10;
  v13 = v9;
  [(NMSMusicRecommendationsRequest *)self _performHeavyRotationRequestWithCompletion:v14];
}

void __99__NMSMusicRecommendationsRequest__continueToHeavyRotationRequestWithContext_queue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __99__NMSMusicRecommendationsRequest__continueToHeavyRotationRequestWithContext_queue_responseHandler___block_invoke_2;
  v10[3] = &unk_264633C90;
  id v11 = v6;
  id v16 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

uint64_t __99__NMSMusicRecommendationsRequest__continueToHeavyRotationRequestWithContext_queue_responseHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
    return v2();
  }
  else
  {
    [*(id *)(a1 + 40) setHeavyRotationResponse:*(void *)(a1 + 48)];
    unint64_t v4 = [*(id *)(a1 + 40) numberOfRecentMusicModelObjects];
    unint64_t v5 = [*(id *)(a1 + 40) minimumNumberOfRecentMusicModelObjects];
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = *(void **)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 72);
    if (v4 >= v5)
    {
      return [v7 _continueToProcessResultsWithContext:v6 queue:v8 responseHandler:v9];
    }
    else
    {
      return [v7 _continueToLibraryRecentMusicRecommedationsWithContext:v6 queue:v8 responseHandler:v9];
    }
  }
}

- (void)_continueToLibraryRecentMusicRecommedationsWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(v9);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __111__NMSMusicRecommendationsRequest__continueToLibraryRecentMusicRecommedationsWithContext_queue_responseHandler___block_invoke;
  v14[3] = &unk_264633CB8;
  id v15 = v9;
  id v16 = v8;
  v17 = self;
  id v18 = v10;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  [(NMSMusicRecommendationsRequest *)self _performLibraryRecentMusicRequestWithCompletion:v14];
}

void __111__NMSMusicRecommendationsRequest__continueToLibraryRecentMusicRecommedationsWithContext_queue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __111__NMSMusicRecommendationsRequest__continueToLibraryRecentMusicRecommedationsWithContext_queue_responseHandler___block_invoke_2;
  v10[3] = &unk_264633C90;
  id v11 = v6;
  id v16 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

uint64_t __111__NMSMusicRecommendationsRequest__continueToLibraryRecentMusicRecommedationsWithContext_queue_responseHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
    return v2();
  }
  else
  {
    [*(id *)(a1 + 40) setLibraryRecentMusicResponse:*(void *)(a1 + 48)];
    unint64_t v4 = [*(id *)(a1 + 40) numberOfRecentMusicModelObjects];
    if (v4 < [*(id *)(a1 + 40) minimumNumberOfRecentMusicModelObjects]
      && (+[NMSSubscriptionManager sharedManager],
          id v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 hasCapability:1],
          v5,
          v6))
    {
      v7 = *(unsigned char **)(a1 + 56);
      if (v7[8]
        && ([v7 _unarchivedCombinedResponsesDictionary],
            id v8 = objc_claimAutoreleasedReturnValue(),
            [v8 objectForKeyedSubscript:@"editorial-cachedLoadedOutput"],
            id v9 = objc_claimAutoreleasedReturnValue(),
            v9,
            v8,
            v7 = *(unsigned char **)(a1 + 56),
            v9))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 64);
        uint64_t v12 = *(void *)(a1 + 72);
        return [v7 _continueToLegacyEditorialRequestWithContext:v10 queue:v11 responseHandler:v12];
      }
      else
      {
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void *)(a1 + 64);
        uint64_t v19 = *(void *)(a1 + 72);
        return [v7 _continueToStarterPackMultiplexRequestWithContext:v17 queue:v18 responseHandler:v19];
      }
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void **)(a1 + 56);
      uint64_t v15 = *(void *)(a1 + 64);
      uint64_t v16 = *(void *)(a1 + 72);
      return [v14 _continueToProcessResultsWithContext:v13 queue:v15 responseHandler:v16];
    }
  }
}

- (void)_continueToStarterPackMultiplexRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(v9);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __106__NMSMusicRecommendationsRequest__continueToStarterPackMultiplexRequestWithContext_queue_responseHandler___block_invoke;
  v14[3] = &unk_264633CB8;
  uint64_t v15 = v9;
  uint64_t v16 = self;
  id v17 = v8;
  id v18 = v10;
  id v11 = v8;
  id v12 = v10;
  uint64_t v13 = v9;
  [(NMSMusicRecommendationsRequest *)self _performStarterPackMultiplexRequestWithCompletion:v14];
}

void __106__NMSMusicRecommendationsRequest__continueToStarterPackMultiplexRequestWithContext_queue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __106__NMSMusicRecommendationsRequest__continueToStarterPackMultiplexRequestWithContext_queue_responseHandler___block_invoke_2;
  v12[3] = &unk_264633C90;
  id v13 = v6;
  id v18 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v14 = v5;
  uint64_t v15 = v8;
  id v16 = v9;
  id v17 = *(id *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

void __106__NMSMusicRecommendationsRequest__continueToStarterPackMultiplexRequestWithContext_queue_responseHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v2();
  }
  else
  {
    v3 = [*(id *)(a1 + 40) results];
    unint64_t v4 = [v3 firstSection];
    id v5 = [v4 loadAdditionalContentURL];

    [*(id *)(a1 + 48) _continueToStarterPackRoomRequestWithURL:v5 context:*(void *)(a1 + 56) queue:*(void *)(a1 + 64) responseHandler:*(void *)(a1 + 72)];
  }
}

- (void)_continueToStarterPackRoomRequestWithURL:(id)a3 context:(id)a4 queue:(id)a5 responseHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  dispatch_assert_queue_V2(v11);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __105__NMSMusicRecommendationsRequest__continueToStarterPackRoomRequestWithURL_context_queue_responseHandler___block_invoke;
  v17[3] = &unk_264633CB8;
  id v18 = v11;
  id v19 = v10;
  v20 = self;
  id v21 = v12;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  [(NMSMusicRecommendationsRequest *)self _performStarterPackRoomRequestWithURL:v13 completion:v17];
}

void __105__NMSMusicRecommendationsRequest__continueToStarterPackRoomRequestWithURL_context_queue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __105__NMSMusicRecommendationsRequest__continueToStarterPackRoomRequestWithURL_context_queue_responseHandler___block_invoke_2;
  v10[3] = &unk_264633C90;
  id v11 = v6;
  id v16 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

uint64_t __105__NMSMusicRecommendationsRequest__continueToStarterPackRoomRequestWithURL_context_queue_responseHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
    return v2();
  }
  else
  {
    [*(id *)(a1 + 40) setStarterPackResponse:*(void *)(a1 + 48)];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    return [v5 _continueToProcessResultsWithContext:v4 queue:v6 responseHandler:v7];
  }
}

- (void)_continueToProcessResultsWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2(v9);
  if (self->_useCachedDataOnly) {
    [(NMSMusicRecommendationsRequest *)self _finishWithContext:v10 queue:v9 responseHandler:v8];
  }
  else {
    [(NMSMusicRecommendationsRequest *)self _continueToLibraryImportWithContext:v10 queue:v9 responseHandler:v8];
  }
}

- (void)_continueToLibraryImportWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(v9);
  id v11 = [v8 modelObjects];
  id v12 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_1];
  id v13 = [v11 filteredSetUsingPredicate:v12];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __92__NMSMusicRecommendationsRequest__continueToLibraryImportWithContext_queue_responseHandler___block_invoke_2;
  v17[3] = &unk_264633D28;
  id v18 = v9;
  id v19 = self;
  id v20 = v8;
  id v21 = v10;
  id v14 = v8;
  id v15 = v10;
  id v16 = v9;
  [(NMSMusicRecommendationsRequest *)self _performLibraryImportChangeRequestWithModelObjects:v13 completion:v17];
}

uint64_t __92__NMSMusicRecommendationsRequest__continueToLibraryImportWithContext_queue_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "nms_prefersCatalogRepresentation");
}

void __92__NMSMusicRecommendationsRequest__continueToLibraryImportWithContext_queue_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__NMSMusicRecommendationsRequest__continueToLibraryImportWithContext_queue_responseHandler___block_invoke_3;
  block[3] = &unk_264633D00;
  id v10 = v3;
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  id v14 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v13 = *(id *)(a1 + 32);
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __92__NMSMusicRecommendationsRequest__continueToLibraryImportWithContext_queue_responseHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else {
    return [*(id *)(a1 + 40) _finishWithContext:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) responseHandler:*(void *)(a1 + 64)];
  }
}

- (void)_finishWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)a4);
  id v10 = self->_cachedData;
  if (!self->_useCachedDataOnly)
  {
    uint64_t v11 = objc_opt_new();
    if ([v8 minimumNumberOfRecentMusicModelObjects])
    {
      id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "minimumNumberOfRecentMusicModelObjects"));
      [v11 setObject:v12 forKey:@"minimumNumberOfRecentMusicModelObjects"];
    }
    id v13 = [v8 forYouResponse];
    id v14 = objc_msgSend(v13, "nms_cachedRecommendationsArray");

    if (v14)
    {
      id v15 = [v8 forYouResponse];
      id v16 = objc_msgSend(v15, "nms_cachedRecommendationsArray");
      [v11 setObject:v16 forKey:@"recommendationsArray"];
    }
    id v17 = [v8 forYouResponse];
    id v18 = objc_msgSend(v17, "nms_cachedStoreItemMetadataResults");

    if (v18)
    {
      id v19 = [v8 forYouResponse];
      id v20 = objc_msgSend(v19, "nms_cachedStoreItemMetadataResults");
      [v11 setObject:v20 forKey:@"storeItemMetadataResults"];
    }
    id v21 = [v8 editorialBrowseResponse];
    v22 = objc_msgSend(v21, "nms_cachedLoadedOutput");

    if (v22)
    {
      v23 = [v8 editorialBrowseResponse];
      v24 = objc_msgSend(v23, "nms_cachedLoadedOutput");
      [v11 setObject:v24 forKey:@"editorial-cachedLoadedOutput"];
    }
    v25 = (void *)MEMORY[0x263F08910];
    v26 = (void *)[v11 copy];
    id v33 = 0;
    uint64_t v27 = [v25 archivedDataWithRootObject:v26 requiringSecureCoding:1 error:&v33];
    id v28 = v33;

    if (v28)
    {
      v29 = NMLogForCategory(5);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[NMSMusicRecommendationsRequest _finishWithContext:queue:responseHandler:]();
      }
    }
    id v10 = (NSData *)v27;
  }
  v30 = [NMSMusicRecommendationsResponse alloc];
  v31 = [v8 recommendations];
  v32 = [(NMSMusicRecommendationsResponse *)v30 initWithCachedData:v10 recommendations:v31];

  if (v9) {
    v9[2](v9, v32, 0);
  }
}

- (void)_performHeavyRotationRequestWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F574B8]);
  [v5 setDefaultMusicRequestProperties];
  uint64_t v6 = [MEMORY[0x263F574C0] allSupportedSectionProperties];
  [v5 setSectionProperties:v6];

  uint64_t v7 = [MEMORY[0x263F574C0] allSupportedItemProperties];
  [v5 setItemProperties:v7];

  id v8 = [(NMSMusicRecommendationsRequest *)self _heavyRotationCacheURL];
  [v5 setCacheURL:v8];

  [v5 setCachePolicy:3];
  if (self->_useCachedDataOnly)
  {
    [v5 setCachePolicy:1];
    id v9 = [(NMSMusicRecommendationsRequest *)self _unarchivedCombinedResponsesDictionary];
    id v10 = [v9 objectForKeyedSubscript:@"HeavyRotationResponse"];

    uint64_t v11 = [(NMSMusicRecommendationsRequest *)self _heavyRotationCacheURL];
    [(NMSMusicRecommendationsRequest *)self _writeData:v10 toURL:v11];

    id v12 = @"Defaults";
  }
  else
  {
    id v12 = @"Store";
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__NMSMusicRecommendationsRequest__performHeavyRotationRequestWithCompletion___block_invoke;
  v15[3] = &unk_264633D50;
  id v16 = v12;
  id v17 = v5;
  id v18 = v4;
  id v13 = v4;
  id v14 = v5;
  [v14 performWithResponseHandler:v15];
}

void __77__NMSMusicRecommendationsRequest__performHeavyRotationRequestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NMLogForCategory(5);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __77__NMSMusicRecommendationsRequest__performHeavyRotationRequestWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (Heavy Rotation) Got heavy rotation response: %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)_performLibraryRecentMusicRequestWithCompletion:(id)a3
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x3032000000;
  v100[3] = __Block_byref_object_copy__2;
  v100[4] = __Block_byref_object_dispose__2;
  id v101 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x3032000000;
  v98[3] = __Block_byref_object_copy__2;
  v98[4] = __Block_byref_object_dispose__2;
  id v99 = 0;
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0x3032000000;
  v96[3] = __Block_byref_object_copy__2;
  v96[4] = __Block_byref_object_dispose__2;
  id v97 = 0;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = __Block_byref_object_copy__2;
  v94[4] = __Block_byref_object_dispose__2;
  id v95 = 0;
  queue = dispatch_queue_create("com.apple.NanoMusicSync.NMSMusicRecommendationsRequest.LibraryCompletion", 0);
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  v88[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke;
  v88[3] = &unk_264633D78;
  v90 = v100;
  v91 = v96;
  v92 = v98;
  v93 = v94;
  id v51 = v3;
  id v89 = v51;
  v55 = (void *)MEMORY[0x223CA14E0](v88);
  id v4 = +[NMSyncDefaults sharedDefaults];
  v53 = [v4 libraryRecommendationPlaylists];

  if ([v53 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = v53;
    uint64_t v6 = [obj countByEnumeratingWithState:&v84 objects:v109 count:16];
    v58 = v5;
    if (v6)
    {
      uint64_t v7 = *(void *)v85;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v85 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v84 + 1) + 8 * v8);
          id v10 = objc_alloc(MEMORY[0x263F11DB0]);
          int v11 = [MEMORY[0x263F11FB8] identityKind];
          v83[0] = MEMORY[0x263EF8330];
          v83[1] = 3221225472;
          v83[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_2;
          v83[3] = &unk_264633DA0;
          v83[4] = v9;
          uint64_t v12 = (void *)[v10 initWithModelKind:v11 block:v83];

          [v58 addObject:v12];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v84 objects:v109 count:16];
      }
      while (v6);
    }

    id v13 = objc_alloc_init(MEMORY[0x263F11F48]);
    [v13 setLabel:@"Library Recommendation Playlists"];
    id v14 = (void *)MEMORY[0x263F11F98];
    uint64_t v15 = NMSMPModelPlaylistVariantsNonFolder;
    id v16 = (void *)MEMORY[0x263F11FA0];
    id v17 = [MEMORY[0x263F12028] kindWithVariants:1];
    v108 = v17;
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v108 count:1];
    id v19 = [v16 kindWithKinds:v18];
    id v20 = [v14 kindWithVariants:v15 & 0xFFFFFFFFFFFFFFFDLL playlistEntryKind:v19 options:4];
    [v13 setItemKind:v20];

    id v21 = (void *)MEMORY[0x263F12180];
    uint64_t v22 = *MEMORY[0x263F11638];
    v107[0] = *MEMORY[0x263F11670];
    v107[1] = v22;
    uint64_t v23 = *MEMORY[0x263F11668];
    v107[2] = *MEMORY[0x263F11678];
    v107[3] = v23;
    v107[4] = *MEMORY[0x263F11688];
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v107 count:5];
    v25 = [v21 propertySetWithProperties:v24];
    [v13 setItemProperties:v25];

    [v13 setAllowedItemIdentifiers:v58];
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3;
    v77[3] = &unk_264633DF0;
    id v26 = v13;
    id v78 = v26;
    v79 = queue;
    v81 = v96;
    v82 = v100;
    id v80 = v55;
    [v26 performWithResponseHandler:v77];

    uint64_t v27 = v58;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_2_82;
    block[3] = &unk_264633E18;
    v76 = v100;
    id v75 = v55;
    dispatch_async(queue, block);
    uint64_t v27 = v75;
  }

  id v28 = +[NMSyncDefaults sharedDefaults];
  v52 = [v28 libraryRecommendationAlbums];

  if ([v52 count])
  {
    id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obja = v52;
    uint64_t v30 = [obja countByEnumeratingWithState:&v70 objects:v106 count:16];
    v59 = v29;
    if (v30)
    {
      uint64_t v31 = *(void *)v71;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v71 != v31) {
            objc_enumerationMutation(obja);
          }
          uint64_t v33 = *(void *)(*((void *)&v70 + 1) + 8 * v32);
          id v34 = objc_alloc(MEMORY[0x263F11DB0]);
          v35 = [MEMORY[0x263F11E88] identityKind];
          v69[0] = MEMORY[0x263EF8330];
          v69[1] = 3221225472;
          v69[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3_84;
          v69[3] = &unk_264633DA0;
          v69[4] = v33;
          v36 = (void *)[v34 initWithModelKind:v35 block:v69];

          [v59 addObject:v36];
          ++v32;
        }
        while (v30 != v32);
        uint64_t v30 = [obja countByEnumeratingWithState:&v70 objects:v106 count:16];
      }
      while (v30);
    }

    id v37 = objc_alloc_init(MEMORY[0x263F11F48]);
    [v37 setLabel:@"Library Recommendation Albums"];
    v38 = (void *)MEMORY[0x263F11E80];
    v39 = [MEMORY[0x263F12028] kindWithVariants:1];
    v40 = [v38 kindWithSongKind:v39];
    [v37 setItemKind:v40];

    id v41 = objc_alloc(MEMORY[0x263F12180]);
    uint64_t v42 = *MEMORY[0x263F114A0];
    v105[0] = *MEMORY[0x263F114C0];
    v105[1] = v42;
    v105[2] = *MEMORY[0x263F114B8];
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:3];
    uint64_t v103 = *MEMORY[0x263F11990];
    v44 = (void *)MEMORY[0x263F12180];
    uint64_t v102 = *MEMORY[0x263F114F0];
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v102 count:1];
    v46 = [v44 propertySetWithProperties:v45];
    v104 = v46;
    v47 = [NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
    v48 = (void *)[v41 initWithProperties:v43 relationships:v47];
    [v37 setItemProperties:v48];

    [v37 setAllowedItemIdentifiers:v59];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_4;
    v63[3] = &unk_264633DF0;
    id v49 = v37;
    id v64 = v49;
    v65 = queue;
    v67 = v94;
    v68 = v98;
    id v66 = v55;
    [v49 performWithResponseHandler:v63];

    v50 = v59;
  }
  else
  {
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_2_91;
    v60[3] = &unk_264633E18;
    v62 = v98;
    id v61 = v55;
    dispatch_async(queue, v60);
    v50 = v61;
  }

  _Block_object_dispose(v94, 8);
  _Block_object_dispose(v96, 8);

  _Block_object_dispose(v98, 8);
  _Block_object_dispose(v100, 8);
}

void __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke(void *a1)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 40)) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = *(void *)(*(void *)(a1[6] + 8) + 40) == 0;
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 40)) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = *(void *)(*(void *)(a1[8] + 8) + 40) == 0;
  }
  if (v2 || v3)
  {
    id v4 = 0;
    id v15 = 0;
  }
  else
  {
    id v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
    if (v5 || (id v5 = *(void **)(*(void *)(a1[8] + 8) + 40)) != 0)
    {
      id v6 = v5;
      id v4 = 0;
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x263F12000]);
      id v9 = objc_alloc_init(MEMORY[0x263F11FF8]);
      id v4 = (void *)[v8 initWithRequest:v9];

      id v10 = objc_alloc_init(MEMORY[0x263F120D8]);
      [v10 appendSection:@"Playlists"];
      int v11 = [*(id *)(*(void *)(a1[5] + 8) + 40) results];
      uint64_t v12 = [v11 allItems];
      [v10 appendItems:v12];

      [v10 appendSection:@"Albums"];
      id v13 = [*(id *)(*(void *)(a1[7] + 8) + 40) results];
      id v14 = [v13 allItems];
      [v10 appendItems:v14];

      [v4 setResults:v10];
      id v6 = 0;
    }
    uint64_t v7 = a1[4];
    id v15 = v6;
    if (v7) {
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v4);
    }
  }
}

void __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v2, "longLongValue"));
}

void __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = NMLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3_cold_1();
    }
  }
  id v8 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_80;
  block[3] = &unk_264633DC8;
  uint64_t v17 = *(void *)(a1 + 64);
  id v14 = v6;
  id v15 = v5;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v12;
  long long v16 = v12;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, block);
}

uint64_t __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_80(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
  BOOL v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_2_82(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F12000]);
  id v3 = objc_alloc_init(MEMORY[0x263F11FF8]);
  uint64_t v4 = [v2 initWithRequest:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v7();
}

void __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3_84(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v2, "longLongValue"));
}

void __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = NMLogForCategory(5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3_cold_1();
    }
  }
  id v8 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_90;
  block[3] = &unk_264633DC8;
  uint64_t v17 = *(void *)(a1 + 64);
  id v14 = v6;
  id v15 = v5;
  long long v12 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v12;
  long long v16 = v12;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, block);
}

uint64_t __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_90(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

uint64_t __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_2_91(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F12000]);
  id v3 = objc_alloc_init(MEMORY[0x263F11FF8]);
  uint64_t v4 = [v2 initWithRequest:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v7();
}

- (void)_performStarterPackMultiplexRequestWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2050000000;
  uint64_t v5 = (void *)getAKAccountManagerClass_softClass;
  uint64_t v28 = getAKAccountManagerClass_softClass;
  if (!getAKAccountManagerClass_softClass)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __getAKAccountManagerClass_block_invoke;
    v24[3] = &unk_264634070;
    v24[4] = &v25;
    __getAKAccountManagerClass_block_invoke((uint64_t)v24);
    uint64_t v5 = (void *)v26[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v25, 8);
  uint64_t v7 = [v6 sharedInstance];
  id v8 = [v7 primaryAuthKitAccount];
  uint64_t v9 = [v7 userUnderAgeForAccount:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F574C8]) initWithUnderageUser:v9];
  [v10 setDefaultMusicRequestProperties];
  [v10 setEditorialRequestProperties];
  id v11 = [MEMORY[0x263F574C0] allSupportedSectionProperties];
  [v10 setSectionProperties:v11];

  long long v12 = [MEMORY[0x263F574C0] allSupportedItemProperties];
  [v10 setItemProperties:v12];

  id v13 = [(NMSMusicRecommendationsRequest *)self _starterPackMultiplexCacheURL];
  [v10 setCacheURL:v13];

  [v10 setCachePolicy:3];
  if (self->_useCachedDataOnly)
  {
    [v10 setCachePolicy:1];
    id v14 = [(NMSMusicRecommendationsRequest *)self _unarchivedCombinedResponsesDictionary];
    id v15 = [v14 objectForKeyedSubscript:@"StarterPackMultiplexResponse"];

    long long v16 = [(NMSMusicRecommendationsRequest *)self _starterPackMultiplexCacheURL];
    [(NMSMusicRecommendationsRequest *)self _writeData:v15 toURL:v16];

    uint64_t v17 = @"Defaults";
  }
  else
  {
    uint64_t v17 = @"Store";
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __84__NMSMusicRecommendationsRequest__performStarterPackMultiplexRequestWithCompletion___block_invoke;
  v20[3] = &unk_264633D50;
  id v21 = v17;
  id v22 = v10;
  id v23 = v4;
  id v18 = v4;
  id v19 = v10;
  [v19 performWithResponseHandler:v20];
}

void __84__NMSMusicRecommendationsRequest__performStarterPackMultiplexRequestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NMLogForCategory(5);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __84__NMSMusicRecommendationsRequest__performStarterPackMultiplexRequestWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (Starter Pack) Got multiplex response: %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)_performStarterPackRoomRequestWithURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x263F574D0];
  id v8 = a3;
  uint64_t v9 = (void *)[[v7 alloc] initWithURL:v8];

  [v9 setDefaultMusicRequestProperties];
  uint64_t v10 = [MEMORY[0x263F574C0] allSupportedSectionProperties];
  [v9 setSectionProperties:v10];

  int v11 = [MEMORY[0x263F574C0] allSupportedItemProperties];
  [v9 setItemProperties:v11];

  uint64_t v12 = [(NMSMusicRecommendationsRequest *)self _starterPackRoomCacheURL];
  [v9 setCacheURL:v12];

  [v9 setCachePolicy:3];
  if (self->_useCachedDataOnly)
  {
    [v9 setCachePolicy:1];
    __int16 v13 = [(NMSMusicRecommendationsRequest *)self _unarchivedCombinedResponsesDictionary];
    id v14 = [v13 objectForKeyedSubscript:@"StarterPackRoomResponse"];

    uint64_t v15 = [(NMSMusicRecommendationsRequest *)self _starterPackRoomCacheURL];
    [(NMSMusicRecommendationsRequest *)self _writeData:v14 toURL:v15];

    long long v16 = @"Defaults";
  }
  else
  {
    long long v16 = @"Store";
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __83__NMSMusicRecommendationsRequest__performStarterPackRoomRequestWithURL_completion___block_invoke;
  v19[3] = &unk_264633D50;
  id v20 = v16;
  id v21 = v9;
  id v22 = v6;
  id v17 = v6;
  id v18 = v9;
  [v18 performWithResponseHandler:v19];
}

void __83__NMSMusicRecommendationsRequest__performStarterPackRoomRequestWithURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NMLogForCategory(5);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __83__NMSMusicRecommendationsRequest__performStarterPackRoomRequestWithURL_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (Starter Pack) Got starter pack room response: %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)_performLibraryImportChangeRequestWithModelObjects:(id)a3 completion:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  uint64_t v7 = v5;
  id v8 = v6;
  uint64_t v31 = v7;
  if (![v7 count])
  {
    v8[2](v8, 0);
    goto LABEL_25;
  }
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__2;
  v49[4] = __Block_byref_object_dispose__2;
  id v50 = 0;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke;
  v44[3] = &unk_264633E40;
  v47 = v51;
  v48 = v49;
  id v9 = v7;
  id v45 = v9;
  uint64_t v30 = v8;
  v46 = v8;
  uint64_t v33 = (void (**)(void, void))MEMORY[0x223CA14E0](v44);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (!v10) {
    goto LABEL_23;
  }
  uint64_t v11 = *(void *)v41;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v41 != v11) {
        objc_enumerationMutation(obj);
      }
      __int16 v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        uint64_t v15 = [v14 identifiers];
        long long v16 = [v15 universalStore];
        id v17 = [v16 globalPlaylistID];

        if ([v17 length])
        {
          id v18 = NMLogForCategory(5);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v53 = v14;
            _os_log_impl(&dword_2228FD000, v18, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Import) Importing playlist: %{public}@", buf, 0xCu);
          }

          id v19 = [MEMORY[0x263F11E40] defaultMediaLibrary];
          id v20 = [v14 identifiers];
          id v21 = [v20 universalStore];
          id v22 = [v21 globalPlaylistID];
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_101;
          v37[3] = &unk_264633E68;
          v38 = v14;
          v39 = v33;
          [v19 addGlobalPlaylistWithID:v22 andAddToCloudLibrary:0 completion:v37];

          id v23 = v38;
        }
        else
        {
          id v23 = NMLogForCategory(5);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v53 = v14;
            _os_log_fault_impl(&dword_2228FD000, v23, OS_LOG_TYPE_FAULT, "[Recommendation] (Import) Skipping import for playlist without a globalPlaylistID: %{public}@", buf, 0xCu);
          }
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v33[2](v33, 0);
          goto LABEL_21;
        }
        id v24 = v13;
        uint64_t v25 = NMLogForCategory(5);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v53 = v24;
          _os_log_impl(&dword_2228FD000, v25, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Import) Importing album: %{public}@", buf, 0xCu);
        }

        id v26 = [MEMORY[0x263F11E40] defaultMediaLibrary];
        uint64_t v27 = [v24 identifiers];
        uint64_t v28 = [v27 universalStore];
        uint64_t v29 = [v28 adamID];
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_104;
        v34[3] = &unk_264633E90;
        id v35 = v24;
        v36 = v33;
        [v26 addStoreItem:v29 andAddTracksToCloudLibrary:0 withCompletion:v34];

        id v17 = v35;
      }

LABEL_21:
      ++v12;
    }
    while (v10 != v12);
    uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
  }
  while (v10);
LABEL_23:

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);
  id v8 = v30;
LABEL_25:
}

void __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  id v6 = v7;
  id v9 = v3;
  if (v7) {
    id v3 = v6;
  }
  objc_storeStrong(v5, v3);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v8 == [*(id *)(a1 + 32) count]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_101(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = NMLogForCategory(5);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_101_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v14 = 138543362;
      uint64_t v15 = v6;
      _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Import) Successfully imported playlist: %{public}@", (uint8_t *)&v14, 0xCu);
    }

    id v5 = [MEMORY[0x263F11E68] playlistsQuery];
    uint64_t v7 = (void *)MEMORY[0x263F11E60];
    uint64_t v8 = [*(id *)(a1 + 32) identifiers];
    id v9 = [v8 universalStore];
    uint64_t v10 = [v9 globalPlaylistID];
    uint64_t v11 = [v7 predicateWithValue:v10 forProperty:*MEMORY[0x263F11430] comparisonType:0];
    [v5 addFilterPredicate:v11];

    uint64_t v12 = [v5 collections];
    __int16 v13 = [v12 firstObject];

    [v13 setValue:MEMORY[0x263EFFA88] forProperty:*MEMORY[0x263F11460]];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_104(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = NMLogForCategory(5);
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_104_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Import) Successfully imported album: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_unarchivedCombinedResponsesDictionary
{
  unarchivedCombinedResponsesDictionary = self->_unarchivedCombinedResponsesDictionary;
  if (!unarchivedCombinedResponsesDictionary)
  {
    if ([(NSData *)self->_cachedData length])
    {
      id v4 = (void *)MEMORY[0x263F08928];
      id v5 = (void *)MEMORY[0x263EFFA08];
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
      cachedData = self->_cachedData;
      id v19 = 0;
      __int16 v13 = [v4 unarchivedObjectOfClasses:v11 fromData:cachedData error:&v19];
      id v14 = v19;
      uint64_t v15 = self->_unarchivedCombinedResponsesDictionary;
      self->_unarchivedCombinedResponsesDictionary = v13;

      if (v14)
      {
        uint64_t v16 = NMLogForCategory(5);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[NMSMusicRecommendationsRequest _unarchivedCombinedResponsesDictionary]();
        }
      }
    }
    else
    {
      id v17 = self->_unarchivedCombinedResponsesDictionary;
      self->_unarchivedCombinedResponsesDictionary = 0;
    }
    unarchivedCombinedResponsesDictionary = self->_unarchivedCombinedResponsesDictionary;
  }

  return unarchivedCombinedResponsesDictionary;
}

+ (id)_recentMusicDirectory
{
  if (_recentMusicDirectory_onceToken != -1) {
    dispatch_once(&_recentMusicDirectory_onceToken, &__block_literal_global_112);
  }
  id v2 = NSURL;
  uint64_t v3 = _recentMusicDirectory_path;

  return (id)[v2 fileURLWithPath:v3 isDirectory:1];
}

void __55__NMSMusicRecommendationsRequest__recentMusicDirectory__block_invoke()
{
  uint64_t v0 = +[NMSPathUtil recentMusicDirectory];
  v1 = (void *)_recentMusicDirectory_path;
  _recentMusicDirectory_path = v0;

  id v2 = [MEMORY[0x263F08850] defaultManager];
  [v2 createDirectoryAtPath:_recentMusicDirectory_path withIntermediateDirectories:1 attributes:0 error:0];
}

- (id)_heavyRotationCacheURL
{
  id v2 = [(id)objc_opt_class() _recentMusicDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"HeavyRotationResponse"];

  return v3;
}

- (id)_starterPackMultiplexCacheURL
{
  id v2 = [(id)objc_opt_class() _recentMusicDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"StarterPackMultiplexResponse"];

  return v3;
}

- (id)_starterPackRoomCacheURL
{
  id v2 = [(id)objc_opt_class() _recentMusicDirectory];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"StarterPackRoomResponse"];

  return v3;
}

- (void)_writeData:(id)a3 toURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v11 = 0;
    int v7 = [v5 writeToURL:v6 options:1 error:&v11];
    uint64_t v8 = v11;
    uint64_t v9 = NMLogForCategory(5);
    uint64_t v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_impl(&dword_2228FD000, v10, OS_LOG_TYPE_DEFAULT, "[Recommendations] Cached data %@ at url %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[NMSMusicRecommendationsRequest _writeData:toURL:]();
    }
  }
  else
  {
    uint64_t v8 = NMLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NMSMusicRecommendationsRequest _writeData:toURL:]();
    }
  }
}

- (void)_continueToLegacyForYouRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(v9);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __98__NMSMusicRecommendationsRequest__continueToLegacyForYouRequestWithContext_queue_responseHandler___block_invoke;
  v14[3] = &unk_264633EB8;
  id v15 = v9;
  id v16 = v8;
  id v17 = self;
  id v18 = v10;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  [(NMSMusicRecommendationsRequest *)self _performForYouRequestWithCompletion:v14];
}

void __98__NMSMusicRecommendationsRequest__continueToLegacyForYouRequestWithContext_queue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __98__NMSMusicRecommendationsRequest__continueToLegacyForYouRequestWithContext_queue_responseHandler___block_invoke_2;
  v10[3] = &unk_264633C90;
  id v11 = v6;
  id v16 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

uint64_t __98__NMSMusicRecommendationsRequest__continueToLegacyForYouRequestWithContext_queue_responseHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
    return v2();
  }
  else
  {
    [*(id *)(a1 + 40) setForYouResponse:*(void *)(a1 + 48)];
    unint64_t v4 = [*(id *)(a1 + 40) numberOfRecentMusicModelObjects];
    unint64_t v5 = [*(id *)(a1 + 40) minimumNumberOfRecentMusicModelObjects];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = *(void **)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 72);
    if (v4 >= v5)
    {
      return [v7 _continueToProcessResultsWithContext:v6 queue:v8 responseHandler:v9];
    }
    else
    {
      return [v7 _continueToLibraryRecentMusicRecommedationsWithContext:v6 queue:v8 responseHandler:v9];
    }
  }
}

- (void)_continueToLegacyEditorialRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(v9);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __101__NMSMusicRecommendationsRequest__continueToLegacyEditorialRequestWithContext_queue_responseHandler___block_invoke;
  v14[3] = &unk_264633EE0;
  id v15 = v9;
  id v16 = v8;
  id v17 = self;
  id v18 = v10;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  [(NMSMusicRecommendationsRequest *)self _performEditorialBrowseRequestWithCompletion:v14];
}

void __101__NMSMusicRecommendationsRequest__continueToLegacyEditorialRequestWithContext_queue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __101__NMSMusicRecommendationsRequest__continueToLegacyEditorialRequestWithContext_queue_responseHandler___block_invoke_2;
  v10[3] = &unk_264633C90;
  id v11 = v6;
  id v16 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = *(id *)(a1 + 32);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

uint64_t __101__NMSMusicRecommendationsRequest__continueToLegacyEditorialRequestWithContext_queue_responseHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
    return v2();
  }
  else
  {
    [*(id *)(a1 + 40) setEditorialBrowseResponse:*(void *)(a1 + 48)];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    return [v5 _continueToProcessResultsWithContext:v4 queue:v6 responseHandler:v7];
  }
}

- (void)_performForYouRequestWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(NMSModelForYouRecommendationsRequest);
  [(NMSModelForYouRecommendationsRequest *)v5 setLabel:@"ForYou Music Recommendations"];
  uint64_t v6 = +[MPModelForYouRecommendationsRequest allSupportedSectionProperties];
  [(NMSModelForYouRecommendationsRequest *)v5 setSectionProperties:v6];

  uint64_t v7 = +[MPModelForYouRecommendationsRequest allSupportedItemProperties];
  [(NMSModelForYouRecommendationsRequest *)v5 setItemProperties:v7];

  [(MPStoreModelRequest *)v5 setClientIdentifier:@"NanoMusic"];
  [(MPStoreModelRequest *)v5 setClientVersion:@"2.0"];
  if (self->_useCachedDataOnly)
  {
    [(NMSModelForYouRecommendationsRequest *)v5 setNms_useCachedDataOnly:1];
    id v8 = [(NMSMusicRecommendationsRequest *)self _unarchivedCombinedResponsesDictionary];
    id v9 = [v8 objectForKeyedSubscript:@"recommendationsArray"];
    [(NMSModelForYouRecommendationsRequest *)v5 setNms_cachedRecommendationsArray:v9];

    id v10 = [(NMSMusicRecommendationsRequest *)self _unarchivedCombinedResponsesDictionary];
    id v11 = [v10 objectForKeyedSubscript:@"storeItemMetadataResults"];
    [(NMSModelForYouRecommendationsRequest *)v5 setNms_cachedStoreItemMetadataResults:v11];

    id v12 = @"Defaults";
  }
  else
  {
    id v12 = @"Store";
  }
  id v13 = NMLogForCategory(5);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v12;
    __int16 v22 = 2114;
    id v23 = v5;
    _os_log_impl(&dword_2228FD000, v13, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (ForYou) Performing request: %{public}@", buf, 0x16u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __70__NMSMusicRecommendationsRequest__performForYouRequestWithCompletion___block_invoke;
  v16[3] = &unk_264633F08;
  id v17 = v12;
  id v18 = v5;
  id v19 = v4;
  id v14 = v4;
  id v15 = v5;
  [(NMSModelForYouRecommendationsRequest *)v15 performWithResponseHandler:v16];
}

void __70__NMSMusicRecommendationsRequest__performForYouRequestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NMLogForCategory(5);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __70__NMSMusicRecommendationsRequest__performForYouRequestWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (ForYou) Got response: %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)_performEditorialBrowseRequestWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(NMSModelEditorialRecommendationsRequest);
  [(NMSModelEditorialRecommendationsRequest *)v5 setLabel:@"Editorial Recommendations"];
  id v6 = +[MPModelStoreBrowseRequest allSupportedSectionProperties];
  [(NMSModelEditorialRecommendationsRequest *)v5 setSectionProperties:v6];

  uint64_t v7 = +[MPModelStoreBrowseRequest allSupportedItemProperties];
  [(NMSModelEditorialRecommendationsRequest *)v5 setItemProperties:v7];

  [(MPStoreModelRequest *)v5 setClientIdentifier:@"NanoMusic"];
  [(MPStoreModelRequest *)v5 setClientVersion:@"2.0"];
  if (self->_useCachedDataOnly)
  {
    [(NMSModelEditorialRecommendationsRequest *)v5 setNms_useCachedDataOnly:1];
    id v8 = [(NMSMusicRecommendationsRequest *)self _unarchivedCombinedResponsesDictionary];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"editorial-cachedLoadedOutput"];
    [(NMSModelEditorialRecommendationsRequest *)v5 setNms_cachedLoadedOutput:v9];

    uint64_t v10 = @"Defaults";
  }
  else
  {
    uint64_t v10 = @"Store";
  }
  int v11 = NMLogForCategory(5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v5;
    _os_log_impl(&dword_2228FD000, v11, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (Editorial) Performing request: %{public}@", buf, 0x16u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__NMSMusicRecommendationsRequest__performEditorialBrowseRequestWithCompletion___block_invoke;
  v14[3] = &unk_264633F30;
  uint64_t v15 = v10;
  id v16 = v5;
  id v17 = v4;
  id v12 = v4;
  __int16 v13 = v5;
  [(NMSModelEditorialRecommendationsRequest *)v13 performWithResponseHandler:v14];
}

void __79__NMSMusicRecommendationsRequest__performEditorialBrowseRequestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = NMLogForCategory(5);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __79__NMSMusicRecommendationsRequest__performEditorialBrowseRequestWithCompletion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (Editorial) Got response: %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);
  }
}

- (void)_performLegacyLibraryImportChangeRequestWithModelObjects:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263F11F30];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setShouldLibraryAdd:0];
  [v8 setModelObjects:v7];

  uint64_t v9 = NMLogForCategory(5);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v8;
    _os_log_impl(&dword_2228FD000, v9, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Import) Performing request: %{public}@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __102__NMSMusicRecommendationsRequest__performLegacyLibraryImportChangeRequestWithModelObjects_completion___block_invoke;
  v12[3] = &unk_264633E90;
  id v13 = v8;
  id v14 = v5;
  id v10 = v5;
  id v11 = v8;
  [v11 performWithResponseHandler:v12];
}

void __102__NMSMusicRecommendationsRequest__performLegacyLibraryImportChangeRequestWithModelObjects_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = NMLogForCategory(5);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __102__NMSMusicRecommendationsRequest__performLegacyLibraryImportChangeRequestWithModelObjects_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_2228FD000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Import) Got response: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (BOOL)useCachedDataOnly
{
  return self->_useCachedDataOnly;
}

- (void)setUseCachedDataOnly:(BOOL)a3
{
  self->_useCachedDataOnly = a3;
}

- (NSData)cachedData
{
  return self->_cachedData;
}

- (void)setCachedData:(id)a3
{
}

- (NSDictionary)unarchivedCombinedResponsesDictionary
{
  return self->_unarchivedCombinedResponsesDictionary;
}

- (void)setUnarchivedCombinedResponsesDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unarchivedCombinedResponsesDictionary, 0);

  objc_storeStrong((id *)&self->_cachedData, 0);
}

- (void)_finishWithContext:queue:responseHandler:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "[Recommendation] Failed to archive combinedResponsesDictionary due to %@", v2, v3, v4, v5, v6);
}

void __77__NMSMusicRecommendationsRequest__performHeavyRotationRequestWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2228FD000, v0, v1, "[Recommendation] (%{public}@) (Heavy Rotation) %{public}@ failed heavy rotation request with error: %{public}@");
}

void __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_2228FD000, v0, v1, "[Recommendation] (Defaults) (Library) %{public}@ failed with error: %{public}@");
}

void __84__NMSMusicRecommendationsRequest__performStarterPackMultiplexRequestWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2228FD000, v0, v1, "[Recommendation] (%{public}@) (Starter Pack) %{public}@ failed multiplex request with error: %{public}@");
}

void __83__NMSMusicRecommendationsRequest__performStarterPackRoomRequestWithURL_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2228FD000, v0, v1, "[Recommendation] (%{public}@) (Starter Pack) %{public}@ failed starter pack room request with error: %{public}@");
}

void __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_101_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2228FD000, v0, v1, "[Recommendation] (Import) Failed to import playlist with error: %{public}@, playlist: %{public}@");
}

void __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_104_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2228FD000, v0, v1, "[Recommendation] (Import) Failed to import album with error: %{public}@, album: %{public}@");
}

- (void)_unarchivedCombinedResponsesDictionary
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "Failed to unarchive combinedResponsesDictionary due to %@", v2, v3, v4, v5, v6);
}

- (void)_writeData:toURL:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "[Recommendation] failed to write null data to disk for URL: %@", v2, v3, v4, v5, v6);
}

- (void)_writeData:toURL:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_2228FD000, v0, v1, "[Recommendations] Failed to write data to disk at url: %@ due to write error: %@");
}

void __70__NMSMusicRecommendationsRequest__performForYouRequestWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2228FD000, v0, v1, "[Recommendation] (%{public}@) (ForYou) %{public}@ failed with error: %{public}@");
}

void __79__NMSMusicRecommendationsRequest__performEditorialBrowseRequestWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2228FD000, v0, v1, "[Recommendation] (%{public}@) (Editorial) %{public}@ failed with error: %{public}@");
}

void __102__NMSMusicRecommendationsRequest__performLegacyLibraryImportChangeRequestWithModelObjects_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_2228FD000, v0, v1, "[Recommendation] (Import) %{public}@ failed with error: %{public}@");
}

@end