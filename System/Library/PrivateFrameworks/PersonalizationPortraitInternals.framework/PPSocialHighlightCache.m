@interface PPSocialHighlightCache
- (PPSocialHighlightCache)init;
- (id)initWithStream:(void *)a3 database:;
- (uint64_t)cachedHighlightsArrayIsValid:(void *)a3 queryResults:;
- (void)cachedRankedHighlightsForClient:(uint64_t)a1 variant:(void *)a2 completion:(void *)a3;
- (void)deleteMatchingPredicate:(uint64_t)a1;
- (void)invalidateCacheForClient:(uint64_t)a1;
- (void)lastCacheInvalidationDateForClient:(void *)a1;
- (void)saveOrderedBatch:(uint64_t)a1;
@end

@implementation PPSocialHighlightCache

void __43__PPSocialHighlightCache_saveOrderedBatch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 source];
  uint64_t v5 = [*(id *)(a1 + 32) count] - 1;
  if (v5 >= 0)
  {
    do
    {
      v6 = (void *)MEMORY[0x1CB79D060]();
      v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v5];
      [v4 sendEvent:v7];

      --v5;
    }
    while (v5 != -1);
  }
  v8 = pp_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [*(id *)(a1 + 32) count];
    int v10 = 134217984;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_INFO, "PPSocialHighlightCache: saved %tu events to the stream.", (uint8_t *)&v10, 0xCu);
  }
}

void __61__PPSocialHighlightCache_lastCacheInvalidationDateForClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v8 = (id)[[v3 alloc] initWithFormat:@"%@_%@", @"socialHighlightCacheInvalidationDate", *(void *)(a1 + 32)];
  uint64_t v5 = +[PPSQLKVStore numberForKey:v8 transaction:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)lastCacheInvalidationDateForClient:(void *)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__692;
    v22 = __Block_byref_object_dispose__693;
    id v23 = 0;
    uint64_t v5 = (void *)a1[2];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __61__PPSocialHighlightCache_lastCacheInvalidationDateForClient___block_invoke;
    v15 = &unk_1E65DB940;
    v17 = &v18;
    id v6 = v3;
    id v16 = v6;
    [v5 readTransactionWithClient:0 block:&v12];
    if (v19[5])
    {
      v7 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = v19[5];
        *(_DWORD *)buf = 138412546;
        uint64_t v25 = v8;
        __int16 v26 = 2112;
        id v27 = v6;
        _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: last cache invalidation of %@ for client %@.", buf, 0x16u);
      }

      id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      objc_msgSend((id)v19[5], "doubleValue", v12, v13, v14, v15);
      a1 = objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      int v10 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: no last invalidation date of cache", buf, 2u);
      }

      a1 = 0;
    }

    _Block_object_dispose(&v18, 8);
  }

  return a1;
}

void __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  double v4 = *(double *)(a1 + 40);
  id v5 = a2;
  id v9 = [v3 numberWithDouble:v4];
  uint64_t v6 = [v5 publisherWithStartTime:0 endTime:v9 maxEvents:0 lastN:0 reversed:1];

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __59__PPSocialHighlightCache_saveRankedItems_clientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  id v3 = (void *)MEMORY[0x1CB79D060]();
  double v4 = objc_opt_new();
  id v5 = [v4 UUIDString];

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  int v18 = 1;
  uint64_t v6 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__PPSocialHighlightCache_saveRankedItems_clientIdentifier___block_invoke_3;
  v12[3] = &unk_1E65D4630;
  id v7 = v2;
  id v13 = v7;
  id v16 = v17;
  id v8 = v5;
  id v14 = v8;
  id v15 = *(id *)(a1 + 40);
  id v9 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v12);
  int v10 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: Saving to cache for client '%@' with batch identifier of: '%@'", buf, 0x16u);
  }

  -[PPSocialHighlightCache saveOrderedBatch:](*(void *)(a1 + 48), v9);
  _Block_object_dispose(v17, 8);
}

- (void)saveOrderedBatch:(uint64_t)a1
{
  id v3 = a2;
  double v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__PPSocialHighlightCache_saveOrderedBatch___block_invoke;
    v6[3] = &unk_1E65D9CB0;
    id v7 = v3;
    [v5 runWithLockAcquired:v6];
  }
}

- (void)cachedRankedHighlightsForClient:(uint64_t)a1 variant:(void *)a2 completion:(void *)a3
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke;
    block[3] = &unk_1E65DBDE8;
    block[4] = a1;
    id v9 = v5;
    id v10 = v6;
    dispatch_async(v7, block);
  }
}

- (uint64_t)cachedHighlightsArrayIsValid:(void *)a3 queryResults:
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    uint64_t v47 = 0;
    goto LABEL_62;
  }
  if (![v5 count])
  {
    id v8 = pp_social_highlights_log_handle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    *(_WORD *)buf = 0;
    v48 = "PPSocialHighlightCache: no social highlights found in cache, no cache will be persisted.";
LABEL_56:
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, v48, buf, 2u);
    goto LABEL_60;
  }
  uint64_t v7 = [v5 count];
  if (v7 != [v6 count])
  {
    id v8 = pp_social_highlights_log_handle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    *(_WORD *)buf = 0;
    v48 = "PPSocialHighlightCache: cache length did not match query content length. Invalidating cache.";
    goto LABEL_56;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v8 = v5;
  uint64_t v56 = [v8 countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (!v56)
  {
    uint64_t v47 = 1;
    goto LABEL_61;
  }
  id v52 = v5;
  uint64_t v60 = *(void *)v71;
  v57 = v8;
  id v58 = v6;
LABEL_6:
  uint64_t v9 = 0;
LABEL_7:
  if (*(void *)v71 != v60) {
    objc_enumerationMutation(v8);
  }
  id v10 = *(void **)(*((void *)&v70 + 1) + 8 * v9);
  objc_msgSend(v10, "contentCreationSecondsSinceReferenceDate", v52);
  double v12 = v11;
  id v13 = objc_opt_new();
  [v13 timeIntervalSinceReferenceDate];
  double v15 = v14;
  id v16 = +[PPConfiguration sharedInstance];
  [v16 socialHighlightDecayInterval];
  double v18 = v15 - v17;

  if (v12 < v18)
  {
    v49 = pp_social_highlights_log_handle();
    id v5 = v52;
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_59;
    }
    v51 = [v10 highlightIdentifier];
    *(_DWORD *)buf = 138739971;
    v80 = v51;
    _os_log_impl(&dword_1CA9A8000, v49, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: highlight %{sensitive}@ found to be expired, invalidating cache.", buf, 0xCu);
    goto LABEL_68;
  }
  id v19 = v10;
  id v20 = v6;
  if (![v19 hasAttributionIdentifier]
    || ![v19 hasHighlightIdentifier])
  {

    goto LABEL_58;
  }
  uint64_t v61 = v9;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v74 objects:buf count:16];
  if (!v22) {
    goto LABEL_57;
  }
  uint64_t v23 = v22;
  uint64_t v24 = *(void *)v75;
  while (2)
  {
    uint64_t v25 = 0;
    do
    {
      if (*(void *)v75 != v24) {
        objc_enumerationMutation(v21);
      }
      __int16 v26 = *(void **)(*((void *)&v74 + 1) + 8 * v25);
      if (![v26 hasAttributionIdentifier]
        || ![v26 hasHighlightIdentifier])
      {
        goto LABEL_29;
      }
      id v27 = [v26 attributionIdentifier];
      uint64_t v28 = [v19 attributionIdentifier];
      if (![v27 isEqualToString:v28]
        || (int v29 = [v26 highlightType], v29 != objc_msgSend(v19, "highlightType")))
      {

        goto LABEL_29;
      }
      v30 = [v26 highlightIdentifier];
      v31 = [v19 highlightIdentifier];
      if (![v30 isEqualToString:v31]
        || ([v26 syndicationSecondsSinceReferenceDate],
            double v33 = v32,
            [v19 syndicationSecondsSinceReferenceDate],
            v33 != v34))
      {
        char v37 = 0;
        goto LABEL_28;
      }
      v69 = v30;
      int v35 = [v26 isCollaboration];
      if (v35 != [v19 isCollaboration]
        || (int v36 = [v26 hasCollaborationIdentifier],
            v36 != [v19 hasCollaborationIdentifier]))
      {
        char v37 = 0;
        v30 = v69;
        goto LABEL_28;
      }
      uint64_t v38 = [v26 collaborationIdentifier];
      v67 = [v19 collaborationIdentifier];
      v68 = (void *)v38;
      if ((void *)v38 != v67)
      {
        v39 = [v26 collaborationIdentifier];
        v62 = [v19 collaborationIdentifier];
        v63 = v39;
        if (!objc_msgSend(v39, "isEqual:"))
        {
          char v37 = 0;
          v30 = v69;
LABEL_45:

          goto LABEL_46;
        }
      }
      uint64_t v40 = [v26 contentType];
      v65 = [v19 contentType];
      v66 = (void *)v40;
      if ((void *)v40 != v65)
      {
        v41 = [v26 contentType];
        [v19 contentType];
        uint64_t v64 = v59 = v41;
        if (!objc_msgSend(v41, "isEqual:"))
        {
          char v37 = 0;
LABEL_40:
          v45 = (void *)v64;
          v30 = v69;
          goto LABEL_43;
        }
      }
      v42 = [v26 contentDisplayName];
      uint64_t v43 = [v19 contentDisplayName];
      if (v42 != (void *)v43)
      {
        v55 = (void *)v43;
        v53 = [v26 contentDisplayName];
        [v19 contentDisplayName];
        v44 = v54 = v42;
        char v37 = [v53 isEqual:v44];

        if (v66 == v65)
        {
          v30 = v69;
          goto LABEL_44;
        }
        goto LABEL_40;
      }

      char v37 = 1;
      v30 = v69;
      if (v66 == v65) {
        goto LABEL_44;
      }
      v45 = (void *)v64;
LABEL_43:
      uint64_t v64 = (uint64_t)v45;

LABEL_44:
      if (v68 != v67) {
        goto LABEL_45;
      }
LABEL_46:

LABEL_28:
      if (v37)
      {

        uint64_t v9 = v61 + 1;
        id v8 = v57;
        id v6 = v58;
        if (v61 + 1 != v56) {
          goto LABEL_7;
        }
        uint64_t v47 = 1;
        uint64_t v56 = [v57 countByEnumeratingWithState:&v70 objects:v78 count:16];
        if (!v56)
        {
          id v5 = v52;
          goto LABEL_61;
        }
        goto LABEL_6;
      }
LABEL_29:
      ++v25;
    }
    while (v23 != v25);
    uint64_t v46 = [v21 countByEnumeratingWithState:&v74 objects:buf count:16];
    uint64_t v23 = v46;
    if (v46) {
      continue;
    }
    break;
  }
LABEL_57:

  id v8 = v57;
  id v6 = v58;
LABEL_58:
  v49 = pp_social_highlights_log_handle();
  id v5 = v52;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    v51 = [v19 highlightIdentifier];
    *(_DWORD *)buf = 138739971;
    v80 = v51;
    _os_log_debug_impl(&dword_1CA9A8000, v49, OS_LOG_TYPE_DEBUG, "PPSocialHighlightCache: found highlight %{sensitive}@ in the cache that was not in the Spotlight query, invaldating cache.", buf, 0xCu);
LABEL_68:
  }
LABEL_59:

LABEL_60:
  uint64_t v47 = 0;
LABEL_61:

LABEL_62:
  return v47;
}

void __59__PPSocialHighlightCache_saveRankedItems_clientIdentifier___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PPSocialHighlightCache_saveRankedItems_clientIdentifier___block_invoke_2;
  block[3] = &unk_1E65D87E8;
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  dispatch_async(v2, block);
}

void __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  id v3 = -[PPSocialHighlightCache lastCacheInvalidationDateForClient:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v4 = objc_opt_new();
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;
  id v7 = +[PPConfiguration sharedInstance];
  [v7 socialHighlightCacheTimeoutInterval];
  double v9 = v6 - v8;

  uint64_t v10 = [v3 timeIntervalSinceReferenceDate];
  if (v11 >= v9) {
    double v12 = v11;
  }
  else {
    double v12 = v9;
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__692;
  v45 = __Block_byref_object_dispose__693;
  id v46 = 0;
  id v13 = (void *)MEMORY[0x1CB79D060](v10);
  double v14 = *(void **)(*(void *)v2 + 8);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_14;
  v40[3] = &unk_1E65D44F0;
  v40[4] = &v41;
  *(double *)&v40[5] = v12;
  [v14 runWithLockAcquired:v40];
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__692;
  v38[4] = __Block_byref_object_dispose__693;
  id v39 = 0;
  double v15 = objc_opt_new();
  id v16 = (void *)MEMORY[0x1CB79D060]();
  double v17 = (void *)v42[5];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_2;
  v36[3] = &unk_1E65D9E80;
  id v37 = *(id *)(a1 + 40);
  double v18 = [v17 filterWithIsIncluded:v36];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_3;
  v32[3] = &unk_1E65D4518;
  id v33 = v15;
  id v34 = *(id *)(a1 + 40);
  int v35 = v38;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_20;
  int v29 = &unk_1E65D4540;
  v31 = v38;
  id v19 = v33;
  id v30 = v19;
  id v20 = (id)[v18 sinkWithCompletion:v32 shouldContinue:&v26];

  id v21 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = objc_msgSend(v19, "count", v26, v27, v28, v29);
    uint64_t v23 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v48 = v22;
    __int16 v49 = 2112;
    uint64_t v50 = v23;
    _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: found %tu cached items for client '%@'", buf, 0x16u);
  }

  uint64_t v24 = *(void *)(a1 + 48);
  uint64_t v25 = (void *)[v19 copy];
  (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v25);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v41, 8);
}

void __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  double v5 = pp_social_highlights_log_handle();
  double v6 = v5;
  if (v4 == 1)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v3 error];
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v7;
      _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPSocialHighlightCache: unable to read from the cache: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) count];
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 134218242;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: found cache of %tu items for client: '%@'", (uint8_t *)&v12, 0x16u);
    }

    double v6 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: batch Identifier is: %@ for client: '%@'", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (PPSocialHighlightCache)init
{
  NSUInteger v3 = NSRoundUpToMultipleOfPageSize(0x30000uLL);
  uint64_t v4 = +[PPPaths subdirectory:@"streams"];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F50278]) initWithStoreBasePath:v4 segmentSize:v3];
  id v6 = objc_alloc(MEMORY[0x1E4F50268]);
  id v7 = +[PPConfiguration sharedInstance];
  [v7 socialHighlightRankedStorageMaxAge];
  uint64_t v8 = objc_msgSend(v6, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 1, 1, 25 * v3);

  [v5 setPruningPolicy:v8];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"rankedSocialHighlights" storeConfig:v5];
  uint64_t v10 = +[PPSQLDatabase sharedInstance];
  uint64_t v11 = (PPSocialHighlightCache *)-[PPSocialHighlightCache initWithStream:database:]((id *)&self->super.isa, v9, v10);

  return v11;
}

- (id)initWithStream:(void *)a3 database:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)PPSocialHighlightCache;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v5];
      id v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
      uint64_t v9 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"SocialHighlightCache"];
      id v10 = a1[3];
      a1[3] = (id)v9;
    }
  }

  return a1;
}

uint64_t __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1CB79D060]();
  id v5 = [v3 eventBody];
  if (v5 && [v5 hasClientIdentifier])
  {
    id v6 = [v5 clientIdentifier];
    if ([v6 isEqualToString:*(void *)(a1 + 32)]) {
      uint64_t v7 = [v5 hasBatchIdentifier];
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __77__PPSocialHighlightCache_cachedRankedHighlightsForClient_variant_completion___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1CB79D060]();
  id v5 = [v3 eventBody];
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = [v5 batchIdentifier];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  uint64_t v9 = [v5 batchIdentifier];
  uint64_t v10 = [v9 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  if (v10)
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
  else
  {
    uint64_t v11 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [v5 batchIdentifier];
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_debug_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEBUG, "PPSocialHighlightCache: returning cache as have completed loading of batch %@", (uint8_t *)&v14, 0xCu);
    }
  }

  return v10;
}

- (void)invalidateCacheForClient:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 16);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__PPSocialHighlightCache_invalidateCacheForClient___block_invoke;
    v6[3] = &unk_1E65DB8F0;
    id v7 = v3;
    [v5 writeTransactionWithClient:0 block:v6];
  }
}

void __51__PPSocialHighlightCache_invalidateCacheForClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  id v5 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v6 = NSNumber;
  [v4 timeIntervalSinceReferenceDate];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = (void *)[[NSString alloc] initWithFormat:@"%@_%@", @"socialHighlightCacheInvalidationDate", *(void *)(a1 + 32)];
  +[PPSQLKVStore setNumber:v7 forKey:v8 transaction:v3];

  uint64_t v9 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    objc_super v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: invalidated the cache as of %@ for client %@", buf, 0x16u);
  }
}

- (void)deleteMatchingPredicate:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v11 = 0;
    objc_super v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    id v5 = *(void **)(a1 + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__PPSocialHighlightCache_deleteMatchingPredicate___block_invoke;
    v8[3] = &unk_1E65D9E58;
    id v9 = v3;
    uint64_t v10 = &v11;
    [v5 runWithLockAcquired:v8];
    uint64_t v6 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = v12[3];
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_INFO, "PPSocialHighlightCache: deleted %tu items in the vended stream.", buf, 0xCu);
    }

    _Block_object_dispose(&v11, 8);
  }
}

void __50__PPSocialHighlightCache_deleteMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PPSocialHighlightCache_deleteMatchingPredicate___block_invoke_2;
  v6[3] = &unk_1E65D4568;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 pruneWithPredicateBlock:v6];
}

uint64_t __50__PPSocialHighlightCache_deleteMatchingPredicate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v5 = [*(id *)(a1 + 32) evaluateWithObject:v3];
  if (v5) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }

  return v5;
}

uint64_t __72__PPSocialHighlightCache_mostRecentRankedHighlightsMatchingTest_client___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 publisherWithStartTime:0 endTime:0 maxEvents:0 lastN:0 reversed:1];
  return MEMORY[0x1F41817F8]();
}

uint64_t __72__PPSocialHighlightCache_mostRecentRankedHighlightsMatchingTest_client___block_invoke_34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v5 = [v3 eventBody];
  uint64_t v6 = [v5 batchIdentifier];
  if (v5)
  {
    id v7 = [v5 clientIdentifier];
    if ([v7 isEqualToString:*(void *)(a1 + 32)])
    {
      int v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();

      if (v8)
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
        if (*(void *)(v9 + 40)) {
          BOOL v10 = v6 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
          if (!objc_msgSend(v6, "isEqual:"))
          {
            uint64_t v11 = 0;
            goto LABEL_13;
          }
          uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
        }
        objc_storeStrong((id *)(v9 + 40), v6);
        [*(id *)(a1 + 40) addObject:v5];
      }
    }
    else
    {
    }
  }
  uint64_t v11 = 1;
LABEL_13:

  return v11;
}

void __72__PPSocialHighlightCache_mostRecentRankedHighlightsMatchingTest_client___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 state];
  id v4 = pp_social_highlights_log_handle();
  uint64_t v5 = v4;
  if (v3 == 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = [v2 error];
      int v7 = 138412290;
      int v8 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_ERROR, "PPSocialHighlightCache: unable to read items from Biome %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: successfully completed reading of the ranked stream from Biome.", (uint8_t *)&v7, 2u);
  }
}

void __34__PPSocialHighlightCache_allItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 publisherFromStartTime:0.0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__PPSocialHighlightCache_allItems__block_invoke_2;
  v7[3] = &unk_1E65D45B8;
  id v8 = *(id *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PPSocialHighlightCache_allItems__block_invoke_35;
  v5[3] = &unk_1E65D45E0;
  id v6 = *(id *)(a1 + 32);
  id v4 = (id)[v3 sinkWithCompletion:v7 receiveInput:v5];
}

void __34__PPSocialHighlightCache_allItems__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "PPSocialHighlightCache: retrieved %tu events from the stream.", (uint8_t *)&v4, 0xCu);
  }
}

void __34__PPSocialHighlightCache_allItems__block_invoke_35(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 eventBody];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v7 eventBody];
    [v5 addObject:v6];
  }
}

void __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 publisherFromStartTime:0.0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke_2;
  v9[3] = &unk_1E65D9E80;
  id v10 = *(id *)(a1 + 32);
  int v4 = [v3 filterWithIsIncluded:v9];
  uint64_t v5 = [MEMORY[0x1E4F501E8] count];
  uint64_t v6 = [v4 reduce:v5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke_40;
  v8[3] = &unk_1E65D4608;
  void v8[4] = *(void *)(a1 + 40);
  id v7 = (id)[v6 sinkWithCompletion:&__block_literal_global_39 receiveInput:v8];
}

uint64_t __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v5 = [v3 eventBody];
  if ([v5 isPrimary])
  {
    uint64_t v6 = [v3 eventBody];
    id v7 = [v6 batchIdentifier];
    if (v7)
    {
      id v8 = [v3 eventBody];
      uint64_t v9 = [v8 batchIdentifier];
      uint64_t v10 = [v9 isEqual:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t result = [a2 unsignedIntegerValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __74__PPSocialHighlightCache_countDistinctRankedItemsMatchingBatchIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 state] == 1)
  {
    id v3 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = [v2 error];
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_ERROR, "PPSocialHighlightCache: unable to count items matching batch identifier: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

id __59__PPSocialHighlightCache_saveRankedItems_clientIdentifier___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)a1[4];
  int v5 = [v3 highlightIdentifier];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    [v3 setIsPrimary:0];
    [v3 setRank:*(unsigned int *)(*(void *)(a1[7] + 8) + 24)];
  }
  else
  {
    [v3 setIsPrimary:1];
    [v3 setRank:*(unsigned int *)(*(void *)(a1[7] + 8) + 24)];
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = [v3 highlightIdentifier];
    [v6 addObject:v7];

    ++*(_DWORD *)(*(void *)(a1[7] + 8) + 24);
  }
  [v3 setBatchIdentifier:a1[5]];
  [v3 setClientIdentifier:a1[6]];
  return v3;
}

@end