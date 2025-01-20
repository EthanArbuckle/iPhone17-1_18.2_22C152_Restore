@interface PPSocialHighlightStorageUtilities
+ (id)excludedChatBundleIds;
+ (id)filteredAllowedChatBundleIds:(id)a3;
- (PPSocialHighlightStorageUtilities)init;
- (id)resolveBundleIdToApplicationIdentifierIfInstalled:(id)a3;
- (void)clearCache;
@end

@implementation PPSocialHighlightStorageUtilities

+ (id)filteredAllowedChatBundleIds:(id)a3
{
  id v4 = a3;
  v5 = [a1 excludedChatBundleIds];
  if ([v5 count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__PPSocialHighlightStorageUtilities_filteredAllowedChatBundleIds___block_invoke;
    v8[3] = &unk_1E65DC168;
    id v9 = v5;
    v6 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v8);

    id v4 = v9;
  }
  else
  {
    v6 = (void *)[v4 copy];
  }

  return v6;
}

+ (id)excludedChatBundleIds
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledBundles", @"com.apple.spotlightui");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v11 = pp_social_highlights_log_handle();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v13 = objc_opt_class();
              *(_DWORD *)buf = 138543619;
              id v21 = v13;
              __int16 v22 = 2113;
              v23 = v8;
              id v14 = v13;
              _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "Item of unexpected type in SBSearchDisabledBundles array: %{public}@ (%{private}@)", buf, 0x16u);
            }
            goto LABEL_17;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    v3 = v3;
    id v9 = v3;
    goto LABEL_18;
  }
  if (v2)
  {
    v3 = pp_social_highlights_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543619;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2113;
      v23 = v2;
      id v10 = v21;
      _os_log_error_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_ERROR, "Unexpected type for SBSearchDisabledBundles: %{public}@ (%{private}@)", buf, 0x16u);
    }
LABEL_17:
    id v9 = MEMORY[0x1E4F1CBF0];
LABEL_18:

    goto LABEL_19;
  }
  id v9 = MEMORY[0x1E4F1CBF0];
LABEL_19:

  return v9;
}

uint64_t __47__PPSocialHighlightStorageUtilities_clearCache__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (void)clearCache
{
}

- (void).cxx_destruct
{
}

- (id)resolveBundleIdToApplicationIdentifierIfInstalled:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v29 = objc_opt_new();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v28 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (!v5) {
      goto LABEL_26;
    }
    uint64_t v31 = *(void *)v46;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v46 != v31) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v45 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1CB79D060]();
        uint64_t v39 = 0;
        v40 = &v39;
        uint64_t v41 = 0x3032000000;
        v42 = __Block_byref_object_copy__1114;
        v43 = __Block_byref_object_dispose__1115;
        id v44 = 0;
        bundleIdToAppIdCacheLock = self->_bundleIdToAppIdCacheLock;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __87__PPSocialHighlightStorageUtilities_resolveBundleIdToApplicationIdentifierIfInstalled___block_invoke;
        v38[3] = &unk_1E65D4D08;
        v38[4] = v7;
        v38[5] = &v39;
        [(_PASLock *)bundleIdToAppIdCacheLock runWithLockAcquired:v38];
        id v10 = (void *)v40[5];
        if (!v10)
        {
          id v14 = v7;
          id v15 = objc_alloc(MEMORY[0x1E4F223C8]);
          id v37 = 0;
          long long v16 = (void *)[v15 initWithBundleIdentifier:v14 allowPlaceholder:0 error:&v37];
          id v17 = v37;
          if (v16)
          {
            long long v18 = pp_social_highlights_log_handle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              id v50 = v14;
              __int16 v51 = 2112;
              id v52 = v16;
              _os_log_debug_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEBUG, "Considering registered bundleID: %@, got record: %@", buf, 0x16u);
            }

            id v19 = [v16 applicationState];
            if ([v19 isInstalled])
            {
              v20 = [v16 URL];
              BOOL v21 = v20 == 0;

              if (!v21)
              {
                id v19 = [v16 applicationIdentifier];
                if (v19)
                {
                  [v29 addObject:v19];
                  __int16 v22 = self->_bundleIdToAppIdCacheLock;
                  v32[0] = MEMORY[0x1E4F143A8];
                  v32[1] = 3221225472;
                  v32[2] = __87__PPSocialHighlightStorageUtilities_resolveBundleIdToApplicationIdentifierIfInstalled___block_invoke_13;
                  v32[3] = &unk_1E65D4868;
                  id v33 = v14;
                  id v19 = v19;
                  id v34 = v19;
                  [(_PASLock *)v22 runWithLockAcquired:v32];
                }
                goto LABEL_22;
              }
LABEL_23:

              goto LABEL_24;
            }
          }
          else
          {
            v23 = pp_social_highlights_log_handle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v50 = v14;
              __int16 v51 = 2112;
              id v52 = v17;
              _os_log_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_INFO, "Failed to initialize LSApplicationRecord with bundle id %@: %@", buf, 0x16u);
            }

            uint64_t v24 = self->_bundleIdToAppIdCacheLock;
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __87__PPSocialHighlightStorageUtilities_resolveBundleIdToApplicationIdentifierIfInstalled___block_invoke_12;
            v35[3] = &unk_1E65D4840;
            id v36 = v14;
            [(_PASLock *)v24 runWithLockAcquired:v35];
            id v19 = v36;
          }
LABEL_22:

          goto LABEL_23;
        }
        v11 = [MEMORY[0x1E4F1CA98] null];
        BOOL v12 = v10 == v11;

        if (!v12)
        {
          v13 = pp_social_highlights_log_handle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v25 = (void *)v40[5];
            *(_DWORD *)buf = 138412546;
            id v50 = v25;
            __int16 v51 = 2112;
            id v52 = v7;
            _os_log_debug_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEBUG, "Fetching cached application identifier %@ for bundle ID: %@", buf, 0x16u);
          }

          [v29 addObject:v40[5]];
        }
LABEL_24:
        _Block_object_dispose(&v39, 8);

        ++v6;
      }
      while (v5 != v6);
      uint64_t v5 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (!v5)
      {
LABEL_26:

        v26 = (void *)[v29 copy];
        id v4 = v28;
        goto LABEL_28;
      }
    }
  }
  v26 = 0;
LABEL_28:

  return v26;
}

uint64_t __87__PPSocialHighlightStorageUtilities_resolveBundleIdToApplicationIdentifierIfInstalled___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

void __87__PPSocialHighlightStorageUtilities_resolveBundleIdToApplicationIdentifierIfInstalled___block_invoke_12(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CA98];
  id v4 = a2;
  id v5 = [v3 null];
  [v4 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
}

uint64_t __87__PPSocialHighlightStorageUtilities_resolveBundleIdToApplicationIdentifierIfInstalled___block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

- (PPSocialHighlightStorageUtilities)init
{
  v8.receiver = self;
  v8.super_class = (Class)PPSocialHighlightStorageUtilities;
  v2 = [(PPSocialHighlightStorageUtilities *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    bundleIdToAppIdCacheLock = v2->_bundleIdToAppIdCacheLock;
    v2->_bundleIdToAppIdCacheLock = (_PASLock *)v5;
  }
  return v2;
}

uint64_t __66__PPSocialHighlightStorageUtilities_filteredAllowedChatBundleIds___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

@end