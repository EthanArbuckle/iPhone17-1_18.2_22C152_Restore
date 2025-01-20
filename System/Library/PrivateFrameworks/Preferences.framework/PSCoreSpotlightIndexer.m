@interface PSCoreSpotlightIndexer
+ (char)spotlightIndexQueueIdentifier;
+ (id)searchIndexIdentifier;
+ (id)sharedInstance;
- (BOOL)controllerIsBlacklisted:(id)a3;
- (BOOL)needsIndex;
- (BOOL)skipManifests;
- (CSSearchQuery)hasItemsQuery;
- (CSSearchableIndex)prefsSearchableIndex;
- (CSTopHitSearchQuery)searchQuery;
- (NSDate)lastIndexDate;
- (NSMutableArray)indexFromControllerLog;
- (OS_dispatch_queue)spotlightIndexQueue;
- (id)_bundleForSpecifier:(id)a3 parentBundle:(id)a4;
- (id)_descriptionForSpecifierName:(id)a3 withParentSpecifierNames:(id)a4;
- (id)_keyValueDictionaryForURL:(id)a3;
- (id)_rankingHintScoreForURL:(id)a3;
- (id)_specifiersForSpecifier:(id)a3 bundle:(id)a4 parentBundle:(id)a5;
- (id)_specifiersPlistPathForSpecifier:(id)a3 bundle:(id)a4 parentBundle:(id)a5;
- (id)_urlForSpecifier:(id)a3 identifier:(id)a4 category:(id)a5 childCategory:(id *)a6 prefix:(id)a7 path:(id *)a8 baseURL:(id)a9 shouldLinkToRow:(BOOL)a10;
- (id)_urlsFromManifestForSpecifier:(id)a3 bundle:(id)a4;
- (id)blacklistedControllers;
- (id)csSearchableItemsFromSpecifiers:(id)a3 bundle:(id)a4 category:(id)a5 pathURL:(id)a6 withURLPrefix:(id)a7 parentSpecifierNames:(id)a8;
- (id)descriptionForCSSearchableItem:(id)a3;
- (id)descriptionForCSSearchableItems:(id)a3;
- (id)fedStatsStringsFromManifestBundlesAtURLs:(id)a3 withCompletion:(id)a4;
- (id)lastIndexBuild;
- (id)lastIndexLanguage;
- (id)manifestFromSpecifiers:(id)a3 bundle:(id)a4 category:(id)a5 pathURL:(id)a6 withURLPrefix:(id)a7 parentSpecifierNames:(id)a8;
- (id)manifestsFromDirectory:(id)a3;
- (id)readManifestBundlesAtURLs:(id)a3 skippingBundles:(id)a4 skippingManifests:(id)a5;
- (id)searchableFirstPartyItemClassIdentifier;
- (id)searchableItemAttributeSetClassIdenfitier;
- (id)searchableItemClassIdentifier;
- (id)searchableItemForSpecifier:(id)a3 bundleID:(id)a4 category:(id)a5 keywords:(id)a6 url:(id)a7 description:(id)a8;
- (id)searchableItemsFromManifest:(id)a3 specifier:(id)a4 bundle:(id)a5 processCapabilities:(BOOL)a6;
- (id)searchableItemsFromManifestsForSpecifier:(id)a3 bundle:(id)a4;
- (id)searchableItemsFromSpecifiers:(id)a3 bundle:(id)a4 category:(id)a5 pathURL:(id)a6 withURLPrefix:(id)a7 parentSpecifierNames:(id)a8;
- (id)searchableThirdPartyItemClassIdentifier;
- (void)_deleteSpecifiers:(id)a3 bundle:(id)a4 category:(id)a5 pathURL:(id)a6 withURLPrefix:(id)a7 completion:(id)a8;
- (void)_indexChunkOfSearchableItems:(id)a3 completionHandler:(id)a4;
- (void)_indexSearchableItems:(id)a3 completionHandler:(id)a4;
- (void)deleteIndexWithCompletionBlock:(id)a3;
- (void)deleteIndexWithDomainIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)deleteSpecifiers:(id)a3 bundle:(id)a4 withURLPrefix:(id)a5 waitForCompletion:(BOOL)a6 completion:(id)a7;
- (void)hasfirstPartyIndexItems:(id)a3;
- (void)indexManifestBundlesAtURL:(id)a3 withCompletion:(id)a4;
- (void)indexManifestBundlesAtURLs:(id)a3 skippingBundles:(id)a4 skippingManifests:(id)a5 withCompletion:(id)a6;
- (void)indexManifestBundlesAtURLs:(id)a3 withCompletion:(id)a4;
- (void)indexSpecifiers:(id)a3 bundle:(id)a4 withURLPrefix:(id)a5 waitForCompletion:(BOOL)a6 completion:(id)a7;
- (void)indexThirdPartyAppsWithPrefix:(id)a3 completion:(id)a4;
- (void)performYukonManifestMigrationWithCompletion:(id)a3;
- (void)reindexSpecifiersIfNeeded:(id)a3 bundle:(id)a4 withURLPrefix:(id)a5 waitForCompletion:(BOOL)a6 setHasIndexed:(BOOL)a7 completion:(id)a8;
- (void)setHasIndexed;
- (void)setHasItemsQuery:(id)a3;
- (void)setIndexFromControllerLog:(id)a3;
- (void)setLastIndexBuild:(id)a3;
- (void)setLastIndexDate:(id)a3;
- (void)setLastIndexLanguage:(id)a3;
- (void)setNeedsIndex;
- (void)setNeedsIndex:(BOOL)a3;
- (void)setPrefsSearchableIndex:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setSkipManifests:(BOOL)a3;
- (void)setSpotlightIndexQueue:(id)a3;
- (void)topHitSearchForString:(id)a3 keyboardLanguage:(id)a4 foundItemsHandler:(id)a5 completionHandler:(id)a6;
@end

@implementation PSCoreSpotlightIndexer

- (id)manifestsFromDirectory:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v23 = objc_opt_new();
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C6E8]];
    id v28 = 0;
    v6 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v5 options:4 error:&v28];
    id v7 = v28;

    if (v7)
    {
      v8 = PKLogForCategory(4);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[PSCoreSpotlightIndexer manifestsFromDirectory:]();
      }
    }
    v21 = v7;
    id v22 = v3;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v15 = [v14 lastPathComponent];
          v16 = [v15 pathExtension];
          if ([v16 isEqualToString:@"plist"])
          {
            v17 = [v15 stringByDeletingPathExtension];
            int v18 = [v17 hasPrefix:@"SettingsSearchManifest"];

            if (v18) {
              [v23 addObject:v14];
            }
          }
          else
          {
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v11);
    }

    v19 = (void *)[v23 copy];
    id v3 = v22;
  }
  else
  {
    v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

- (id)searchableItemForSpecifier:(id)a3 bundleID:(id)a4 category:(id)a5 keywords:(id)a6 url:(id)a7 description:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = objc_opt_new();
  [v20 setUrl:v15];
  [v20 setBundleID:v18];

  v21 = [v19 name];
  [v20 setName:v21];

  [v20 setContentDescription:v14];
  [v20 setCategory:v17];

  id v22 = [v19 identifier];
  [v20 setIdentifier:v22];

  v23 = [(PSCoreSpotlightIndexer *)self _rankingHintScoreForURL:v15];

  [v20 setRankingHint:v23];
  long long v24 = [v19 propertyForKey:@"requiredCapabilities"];
  [v20 setRequiredCapabilities:v24];

  long long v25 = [v19 propertyForKey:@"requiredCapabilitiesOr"];
  [v20 setRequiredCapabilitiesOr:v25];

  [v20 setKeywords:v16];
  long long v26 = [v19 propertyForKey:@"AppBundleID"];

  if (v26) {
    [(PSCoreSpotlightIndexer *)self searchableThirdPartyItemClassIdentifier];
  }
  else {
  long long v27 = [(PSCoreSpotlightIndexer *)self searchableFirstPartyItemClassIdentifier];
  }
  [v20 setClassIdentifier:v27];

  return v20;
}

- (id)searchableFirstPartyItemClassIdentifier
{
  v2 = NSString;
  id v3 = [(PSCoreSpotlightIndexer *)self searchableItemClassIdentifier];
  v4 = [v2 stringWithFormat:@"%@.firstParty", v3];

  return v4;
}

- (id)_rankingHintScoreForURL:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  v5 = [v3 characterSetWithCharactersInString:@"&/#"];
  v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  uint64_t v7 = [v6 count];
  if (v7 > 100)
  {
    v8 = &unk_1EFB74288;
  }
  else
  {
    v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:100 - v7];
  }
  return v8;
}

- (id)searchableItemsFromManifest:(id)a3 specifier:(id)a4 bundle:(id)a5 processCapabilities:(BOOL)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v44 = self;
  BOOL v13 = [(PSCoreSpotlightIndexer *)self skipManifests];
  id v14 = (void *)MEMORY[0x1E4F1CBF0];
  v45 = v12;
  if (v12 && !v13)
  {
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v10];
    id v42 = v10;
    id v16 = [v10 lastPathComponent];
    id v17 = [v16 stringByDeletingPathExtension];

    v40 = v15;
    id v41 = v11;
    v39 = v17;
    SearchSpecifiersFromPlistWithCapabilities(v15, v11, v17, v45, a6);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (!v18) {
      goto LABEL_21;
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v48;
    while (1)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v48 != v20) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (ShouldIndexSpecifier(v22))
        {
          v23 = [v22 objectForKeyedSubscript:@"keywords"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v24 = [v22 objectForKeyedSubscript:@"keywords"];
            uint64_t v25 = [v24 count];

            if (v25)
            {
              long long v26 = [v22 objectForKeyedSubscript:@"keywords"];
              goto LABEL_16;
            }
          }
          else
          {
          }
          long long v26 = [v22 objectForKeyedSubscript:@"keywords"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v27 = [v22 objectForKeyedSubscript:@"keywords"];
            uint64_t v28 = [v27 length];

            if (v28)
            {
              v29 = [v22 objectForKeyedSubscript:@"keywords"];
              long long v26 = [v29 componentsSeparatedByString:@","];

              goto LABEL_16;
            }
          }
          else
          {
LABEL_16:
          }
          uint64_t v30 = [v22 name];
          uint64_t v31 = [v30 length];

          if (v31)
          {
            v32 = [v45 bundleIdentifier];
            v33 = [v22 objectForKeyedSubscript:@"searchSectionID"];
            v34 = [v22 objectForKeyedSubscript:@"keywords"];
            v35 = [v22 objectForKeyedSubscript:@"searchURL"];
            v36 = [v22 objectForKeyedSubscript:@"contentDescription"];
            v37 = [(PSCoreSpotlightIndexer *)v44 searchableItemForSpecifier:v22 bundleID:v32 category:v33 keywords:v34 url:v35 description:v36];

            [v43 addObject:v37];
          }
          continue;
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (!v19)
      {
LABEL_21:
        id v14 = (void *)[v43 copy];

        id v11 = v41;
        id v10 = v42;
        break;
      }
    }
  }

  return v14;
}

- (BOOL)skipManifests
{
  return self->_skipManifests;
}

void __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_2;
  v3[3] = &unk_1E5C60128;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 performYukonManifestMigrationWithCompletion:v3];
}

- (void)performYukonManifestMigrationWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v6 = [v5 BOOLForKey:@"PSCoreSpolightIndexerHasPerformediOS13Migration"];

  if (v6)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__PSCoreSpotlightIndexer_performYukonManifestMigrationWithCompletion___block_invoke;
    v7[3] = &unk_1E5C5D938;
    v8 = v4;
    [(PSCoreSpotlightIndexer *)self deleteIndexWithCompletionBlock:v7];
  }
}

void __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_2(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 searchableFirstPartyItemClassIdentifier];
  v13[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_3;
  v7[3] = &unk_1E5C60128;
  id v8 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  [v2 deleteIndexWithDomainIdentifiers:v4 completionBlock:v7];
}

- (void)indexManifestBundlesAtURL:(id)a3 withCompletion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[PSCoreSpotlightIndexer indexManifestBundlesAtURLs:withCompletion:](self, "indexManifestBundlesAtURLs:withCompletion:", v9, v7, v10, v11);
}

- (void)indexManifestBundlesAtURLs:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = (id)objc_opt_new();
  id v8 = objc_opt_new();
  [(PSCoreSpotlightIndexer *)self indexManifestBundlesAtURLs:v7 skippingBundles:v9 skippingManifests:v8 withCompletion:v6];
}

- (void)indexManifestBundlesAtURLs:(id)a3 skippingBundles:(id)a4 skippingManifests:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  spotlightIndexQueue = self->_spotlightIndexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke;
  block[3] = &unk_1E5C60128;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(spotlightIndexQueue, block);
}

- (void)deleteIndexWithDomainIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PSCoreSpotlightIndexer *)self prefsSearchableIndex];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PSCoreSpotlightIndexer_deleteIndexWithDomainIdentifiers_completionBlock___block_invoke;
  v11[3] = &unk_1E5C601A0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 deleteSearchableItemsWithDomainIdentifiers:v10 completionHandler:v11];
}

void __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_3(id *a1)
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  v2 = PKLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6597000, v2, OS_LOG_TYPE_DEFAULT, "Index Deleted. Reindexing Manifests...", buf, 2u);
  }

  group = dispatch_group_create();
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id obj = a1[4];
  uint64_t v69 = [obj countByEnumeratingWithState:&v105 objects:v118 count:16];
  if (v69)
  {
    uint64_t v68 = *(void *)v106;
    uint64_t v66 = *MEMORY[0x1E4F1C6E8];
    do
    {
      for (uint64_t i = 0; i != v69; uint64_t i = v14 + 1)
      {
        if (*(void *)v106 != v68) {
          objc_enumerationMutation(obj);
        }
        uint64_t v72 = i;
        id v4 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        uint64_t v71 = MEMORY[0x1AD0BE030]();
        char v104 = 0;
        id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v6 = [v4 path];
        char v7 = [v5 fileExistsAtPath:v6 isDirectory:&v104];

        if (v7)
        {
          if (v104)
          {
            id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:v66];
            id v103 = 0;
            id v10 = [v8 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v9 options:4 error:&v103];
            id v11 = (const char *)v103;

            v70 = v11;
            if (v11)
            {
              id v12 = PKLogForCategory(4);
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v114 = v11;
                __int16 v115 = 2114;
                v116 = v4;
                _os_log_error_impl(&dword_1A6597000, v12, OS_LOG_TYPE_ERROR, "error reading manifest bundles: %{public}@ for path: %{public}@", buf, 0x16u);
              }

LABEL_19:
              long long v101 = 0u;
              long long v102 = 0u;
              long long v99 = 0u;
              long long v100 = 0u;
              id v16 = v10;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v99 objects:v112 count:16];
              if (!v17) {
                goto LABEL_56;
              }
              uint64_t v18 = v17;
              uint64_t v19 = *(void *)v100;
              uint64_t v73 = *(void *)v100;
              id v74 = v16;
              while (2)
              {
                uint64_t v20 = 0;
                uint64_t v75 = v18;
LABEL_22:
                if (*(void *)v100 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v21 = *(void **)(*((void *)&v99 + 1) + 8 * v20);
                context = (void *)MEMORY[0x1AD0BE030]();
                uint64_t v77 = v20;
                if ([a1[5] containsObject:v21])
                {
                  id v22 = PKLogForCategory(4);
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    id v23 = [v21 absoluteString];
                    *(_DWORD *)buf = 138412290;
                    v114 = v23;
                    _os_log_impl(&dword_1A6597000, v22, OS_LOG_TYPE_DEFAULT, "Skipping blocklisted bundle %@", buf, 0xCu);
                  }
                  goto LABEL_53;
                }
                long long v24 = [v21 lastPathComponent];
                uint64_t v25 = [v24 pathExtension];
                int v26 = [v25 isEqualToString:@"bundle"];

                if (v26)
                {
                  id v22 = [MEMORY[0x1E4F28B50] bundleWithURL:v21];
                  long long v95 = 0u;
                  long long v96 = 0u;
                  long long v97 = 0u;
                  long long v98 = 0u;
                  id v81 = [a1[6] manifestsFromDirectory:v21];
                  uint64_t v27 = [v81 countByEnumeratingWithState:&v95 objects:v111 count:16];
                  if (v27)
                  {
                    uint64_t v28 = v27;
                    uint64_t v29 = *(void *)v96;
                    uint64_t v79 = *(void *)v96;
                    do
                    {
                      uint64_t v30 = 0;
                      uint64_t v80 = v28;
                      do
                      {
                        if (*(void *)v96 != v29) {
                          objc_enumerationMutation(v81);
                        }
                        uint64_t v31 = *(void **)(*((void *)&v95 + 1) + 8 * v30);
                        int v32 = [a1[7] containsObject:v31];
                        v33 = PKLogForCategory(4);
                        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
                        if (v32)
                        {
                          if (v34)
                          {
                            v35 = [v31 absoluteString];
                            *(_DWORD *)buf = 138412290;
                            v114 = v35;
                            _os_log_impl(&dword_1A6597000, v33, OS_LOG_TYPE_DEFAULT, "Skipping blocklisted manifest %@", buf, 0xCu);
                          }
                        }
                        else
                        {
                          if (v34)
                          {
                            *(_DWORD *)buf = 138412290;
                            v114 = (const char *)v31;
                            _os_log_impl(&dword_1A6597000, v33, OS_LOG_TYPE_DEFAULT, "Fetching from file: %@", buf, 0xCu);
                          }

                          v36 = a1;
                          id v37 = a1[6];
                          v38 = +[PSSpecifier emptyGroupSpecifier];
                          v39 = [v37 searchableItemsFromManifest:v31 specifier:v38 bundle:v22 processCapabilities:1];

                          v40 = v22;
                          [v22 unload];
                          id v41 = PKLogForCategory(4);
                          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v114 = (const char *)v31;
                            _os_log_impl(&dword_1A6597000, v41, OS_LOG_TYPE_DEFAULT, "Converting %@", buf, 0xCu);
                          }

                          v33 = objc_opt_new();
                          long long v91 = 0u;
                          long long v92 = 0u;
                          long long v93 = 0u;
                          long long v94 = 0u;
                          id v42 = v39;
                          uint64_t v43 = [v42 countByEnumeratingWithState:&v91 objects:v110 count:16];
                          if (v43)
                          {
                            uint64_t v44 = v43;
                            uint64_t v45 = *(void *)v92;
                            do
                            {
                              for (uint64_t j = 0; j != v44; ++j)
                              {
                                if (*(void *)v92 != v45) {
                                  objc_enumerationMutation(v42);
                                }
                                long long v47 = [*(id *)(*((void *)&v91 + 1) + 8 * j) toCSSearchableItem];
                                [v33 addObject:v47];
                              }
                              uint64_t v44 = [v42 countByEnumeratingWithState:&v91 objects:v110 count:16];
                            }
                            while (v44);
                          }

                          long long v48 = PKLogForCategory(4);
                          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v114 = (const char *)v31;
                            _os_log_impl(&dword_1A6597000, v48, OS_LOG_TYPE_DEFAULT, "Indexing %@", buf, 0xCu);
                          }

                          dispatch_group_enter(group);
                          a1 = v36;
                          id v49 = v36[6];
                          v89[0] = MEMORY[0x1E4F143A8];
                          v89[1] = 3221225472;
                          v89[2] = __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_273;
                          v89[3] = &unk_1E5C5DDD0;
                          v89[4] = v31;
                          v90 = group;
                          [v49 _indexSearchableItems:v33 completionHandler:v89];

                          id v22 = v40;
                          uint64_t v29 = v79;
                          uint64_t v28 = v80;
                        }

                        ++v30;
                      }
                      while (v30 != v28);
                      uint64_t v28 = [v81 countByEnumeratingWithState:&v95 objects:v111 count:16];
                    }
                    while (v28);
                  }

                  uint64_t v19 = v73;
                  id v16 = v74;
                  uint64_t v18 = v75;
LABEL_53:
                }
                uint64_t v20 = v77 + 1;
                if (v77 + 1 == v18)
                {
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v99 objects:v112 count:16];
                  if (!v18)
                  {
LABEL_56:

                    id v15 = (void *)v71;
                    uint64_t v14 = v72;
                    id v13 = v70;
                    goto LABEL_57;
                  }
                  continue;
                }
                goto LABEL_22;
              }
            }
          }
          else
          {
            v117 = v4;
            id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
          }
          v70 = 0;
          goto LABEL_19;
        }
        id v13 = PKLogForCategory(4);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v114 = (const char *)v4;
          _os_log_error_impl(&dword_1A6597000, v13, OS_LOG_TYPE_ERROR, "path at %{public}@ does not exist", buf, 0xCu);
        }
        id v15 = (void *)v71;
        uint64_t v14 = v72;
LABEL_57:
      }
      uint64_t v69 = [obj countByEnumeratingWithState:&v105 objects:v118 count:16];
    }
    while (v69);
  }

  long long v50 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v51 = [v50 BOOLForKey:@"PSCoreSpolightIndexerWriteFedStatsStrings"];

  if (v51)
  {
    v82 = a1;
    uint64_t v52 = [a1[6] fedStatsStringsFromManifestBundlesAtURLs:a1[4] withCompletion:0];
    v53 = [v52 sortedArrayUsingComparator:&__block_literal_global_26];
    v54 = (void *)[&stru_1EFB51FD0 mutableCopy];
    v55 = objc_opt_new();
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v56 = v53;
    uint64_t v57 = [v56 countByEnumeratingWithState:&v85 objects:v109 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v86;
      do
      {
        for (uint64_t k = 0; k != v58; ++k)
        {
          if (*(void *)v86 != v59) {
            objc_enumerationMutation(v56);
          }
          uint64_t v61 = *(void *)(*((void *)&v85 + 1) + 8 * k);
          if (([v55 containsObject:v61] & 1) == 0)
          {
            [v55 addObject:v61];
            v62 = [NSString stringWithFormat:@"%@\n", v61];
            [v54 appendString:v62];
          }
        }
        uint64_t v58 = [v56 countByEnumeratingWithState:&v85 objects:v109 count:16];
      }
      while (v58);
    }

    v63 = NSTemporaryDirectory();
    v64 = [v63 stringByAppendingPathComponent:@"fedstats_index_strings.txt"];

    [v54 writeToFile:v64 atomically:1 encoding:4 error:0];
    v65 = PKLogForCategory(4);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v114 = "-[PSCoreSpotlightIndexer indexManifestBundlesAtURLs:skippingBundles:skippingManifests:withCompletion:]_block_invoke_2";
      __int16 v115 = 2112;
      v116 = v64;
      _os_log_impl(&dword_1A6597000, v65, OS_LOG_TYPE_DEFAULT, "%s: fedstats index strings file: %@", buf, 0x16u);
    }

    a1 = v82;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_286;
  block[3] = &unk_1E5C5D938;
  id v84 = a1[8];
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);
}

- (void)_indexSearchableItems:(id)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = (void (**)(void))a4;
  if ([v6 count])
  {
    id v8 = PKLogForCategory(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      *(_DWORD *)buf = 138412290;
      long long v24 = v9;
      _os_log_impl(&dword_1A6597000, v8, OS_LOG_TYPE_DEFAULT, "Indexing %@ items.", buf, 0xCu);
    }
    id v10 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(v10, "addObject:", *(void *)(*((void *)&v18 + 1) + 8 * v15), (void)v18);
          if ((unint64_t)[v10 count] >= 0x3E8)
          {
            id v16 = (void *)[v10 copy];
            [(PSCoreSpotlightIndexer *)self _indexChunkOfSearchableItems:v16 completionHandler:0];

            [v10 removeAllObjects];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    uint64_t v17 = (void *)[v10 copy];
    [(PSCoreSpotlightIndexer *)self _indexChunkOfSearchableItems:v17 completionHandler:v7];
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

- (void)_indexChunkOfSearchableItems:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v9;
    _os_log_impl(&dword_1A6597000, v8, OS_LOG_TYPE_DEFAULT, "Indexing chunk of %@ items.", buf, 0xCu);
  }
  id v10 = [(PSCoreSpotlightIndexer *)self prefsSearchableIndex];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __73__PSCoreSpotlightIndexer__indexChunkOfSearchableItems_completionHandler___block_invoke;
  v13[3] = &unk_1E5C601A0;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 indexSearchableItems:v12 completionHandler:v13];
}

- (CSSearchableIndex)prefsSearchableIndex
{
  return self->_prefsSearchableIndex;
}

void __40__PSCoreSpotlightIndexer_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = v2;

  id v4 = objc_alloc(MEMORY[0x1E4F23838]);
  id v5 = [*(id *)(a1 + 32) searchIndexIdentifier];
  id v6 = (void *)[v4 initWithName:v5 protectionClass:*MEMORY[0x1E4F28358]];
  [(id)sharedInstance_sharedInstance_1 setPrefsSearchableIndex:v6];

  id v7 = (const char *)[*(id *)(a1 + 32) spotlightIndexQueueIdentifier];
  id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create(v7, v9);
  [(id)sharedInstance_sharedInstance_1 setSpotlightIndexQueue:v8];
}

- (void)setSpotlightIndexQueue:(id)a3
{
}

- (void)setPrefsSearchableIndex:(id)a3
{
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PSCoreSpotlightIndexer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

void __75__PSCoreSpotlightIndexer_deleteIndexWithDomainIdentifiers_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogForCategory(4);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__PSCoreSpotlightIndexer_deleteIndexWithDomainIdentifiers_completionBlock___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "Deleted existing Settings Spotlight Index for domains: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (id)blacklistedControllers
{
  return &unk_1EFB74330;
}

- (BOOL)controllerIsBlacklisted:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(PSCoreSpotlightIndexer *)self blacklistedControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([v4 isEqualToString:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)needsIndex
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v4 = [v3 BOOLForKey:@"PSCoreSpolightIndexerNeverIndex"];

  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v8 = [v7 BOOLForKey:@"PSCoreSpolightIndexerAlwaysIndex"];

    if (v8)
    {
      id v5 = PKLogForCategory(4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v19 = 0;
        uint64_t v9 = "PSCoreSpolightIndexerAlwaysIndex is set. Always indexing.";
LABEL_11:
        _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, v9, v19, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    long long v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v11 = [v10 BOOLForKey:@"PSCoreSpolightIndexerNeedsIndex"];

    if (v11)
    {
      id v5 = PKLogForCategory(4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v19 = 0;
        uint64_t v9 = "indexing because kCoreSpolightIndexerNeedsIndexKey is set.";
        goto LABEL_11;
      }
LABEL_12:
      BOOL v6 = 1;
      goto LABEL_39;
    }
    id v5 = [(PSCoreSpotlightIndexer *)self lastIndexDate];
    if (!v5)
    {
      long long v12 = PKLogForCategory(4);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v19 = 0;
        _os_log_impl(&dword_1A6597000, v12, OS_LOG_TYPE_DEFAULT, "Indexing because we have never indexed.", v19, 2u);
      }
      BOOL v6 = 1;
      goto LABEL_38;
    }
    long long v12 = [(PSCoreSpotlightIndexer *)self lastIndexBuild];
    if (v12)
    {
      long long v13 = MGCopyAnswer();
      if ([v13 isEqualToString:v12])
      {

        long long v13 = [(PSCoreSpotlightIndexer *)self lastIndexLanguage];
        if (v13)
        {
          id v14 = [MEMORY[0x1E4F1CA20] preferredLanguages];
          uint64_t v15 = [v14 objectAtIndex:0];

          if ([v15 isEqualToString:v13])
          {

            uint64_t v15 = PKLogForCategory(4);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long v19 = 0;
              _os_log_impl(&dword_1A6597000, v15, OS_LOG_TYPE_DEFAULT, "Indexing not needed", v19, 2u);
            }
            BOOL v6 = 0;
            goto LABEL_36;
          }
          uint64_t v17 = PKLogForCategory(4);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long v19 = 0;
            _os_log_impl(&dword_1A6597000, v17, OS_LOG_TYPE_DEFAULT, "Indexing because language has changed.", v19, 2u);
          }
        }
        else
        {
          uint64_t v15 = PKLogForCategory(4);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long v19 = 0;
            _os_log_impl(&dword_1A6597000, v15, OS_LOG_TYPE_DEFAULT, "Indexing because there's no last known indexed language.", v19, 2u);
          }
        }
        BOOL v6 = 1;
LABEL_36:

        goto LABEL_37;
      }
      id v16 = PKLogForCategory(4);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v19 = 0;
        _os_log_impl(&dword_1A6597000, v16, OS_LOG_TYPE_DEFAULT, "Indexing because build number has changed.", v19, 2u);
      }
    }
    else
    {
      long long v13 = PKLogForCategory(4);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v19 = 0;
        _os_log_impl(&dword_1A6597000, v13, OS_LOG_TYPE_DEFAULT, "Indexing because there's no last known indexed build number.", v19, 2u);
      }
    }
    BOOL v6 = 1;
LABEL_37:

LABEL_38:
    goto LABEL_39;
  }
  id v5 = PKLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v19 = 0;
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "PSCoreSpolightIndexerNeverIndex is set. Never indexing.", v19, 2u);
  }
  BOOL v6 = 0;
LABEL_39:

  return v6;
}

- (void)setNeedsIndex:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PSCoreSpolightIndexerNeedsIndex"];
}

- (void)setNeedsIndex
{
  [(PSCoreSpotlightIndexer *)self setNeedsIndex:1];
  uint64_t v2 = PKLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_1A6597000, v2, OS_LOG_TYPE_DEFAULT, "Marking index as outdated", v3, 2u);
  }
}

- (void)setHasIndexed
{
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  [(PSCoreSpotlightIndexer *)self setLastIndexDate:v3];

  id v4 = (void *)MGCopyAnswer();
  [(PSCoreSpotlightIndexer *)self setLastIndexBuild:v4];

  id v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  BOOL v6 = [v5 objectAtIndex:0];
  [(PSCoreSpotlightIndexer *)self setLastIndexLanguage:v6];

  [(PSCoreSpotlightIndexer *)self setNeedsIndex:0];
}

- (NSDate)lastIndexDate
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"PSCoreSpolightIndexerLastIndexDate"];

  return (NSDate *)v3;
}

- (void)setLastIndexDate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setObject:v3 forKey:@"PSCoreSpolightIndexerLastIndexDate"];

  id v5 = PKLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "Setting last index date: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)lastIndexBuild
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"PSCoreSpolightIndexerLastIndexBuild"];

  return v3;
}

- (void)setLastIndexBuild:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setObject:v3 forKey:@"PSCoreSpolightIndexerLastIndexBuild"];

  id v5 = PKLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "Setting last index build: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)lastIndexLanguage
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"PSCoreSpolightIndexerLastIndexLanguage"];

  return v3;
}

- (void)setLastIndexLanguage:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setObject:v3 forKey:@"PSCoreSpolightIndexerLastIndexLanguage"];

  id v5 = PKLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "Setting last index language: %@", (uint8_t *)&v6, 0xCu);
  }
}

+ (id)searchIndexIdentifier
{
  return @"com.apple.Preferences.SearchableIndex";
}

- (id)searchableItemAttributeSetClassIdenfitier
{
  return @"com.apple.Preferences.url";
}

- (id)searchableItemClassIdentifier
{
  return @"com.apple.Preferences";
}

- (id)searchableThirdPartyItemClassIdentifier
{
  uint64_t v2 = NSString;
  id v3 = [(PSCoreSpotlightIndexer *)self searchableItemClassIdentifier];
  id v4 = [v2 stringWithFormat:@"%@.thirdPartyApp", v3];

  return v4;
}

+ (char)spotlightIndexQueueIdentifier
{
  return "com.apple.preferences.spotlightIndexQueue";
}

- (void)hasfirstPartyIndexItems:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PSCoreSpotlightIndexer *)self hasItemsQuery];
  [v5 cancel];

  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:@"contentType == \"*firstParty\"" attributes:0];
  [(PSCoreSpotlightIndexer *)self setHasItemsQuery:v6];

  id v7 = [(PSCoreSpotlightIndexer *)self searchableItemClassIdentifier];
  v24[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  uint64_t v9 = [(PSCoreSpotlightIndexer *)self hasItemsQuery];
  [v9 setBundleIDs:v8];

  uint64_t v10 = *MEMORY[0x1E4F28358];
  v23[0] = *MEMORY[0x1E4F28340];
  v23[1] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  long long v12 = [(PSCoreSpotlightIndexer *)self hasItemsQuery];
  [v12 setProtectionClasses:v11];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  long long v19 = __50__PSCoreSpotlightIndexer_hasfirstPartyIndexItems___block_invoke;
  long long v20 = &unk_1E5C600E0;
  long long v21 = self;
  id v22 = v4;
  id v13 = v4;
  id v14 = (void *)MEMORY[0x1AD0BE2A0](&v17);
  uint64_t v15 = [(PSCoreSpotlightIndexer *)self hasItemsQuery];
  [v15 setCompletionHandler:v14];

  id v16 = [(PSCoreSpotlightIndexer *)self hasItemsQuery];
  [v16 start];
}

uint64_t __50__PSCoreSpotlightIndexer_hasfirstPartyIndexItems___block_invoke(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 32) hasItemsQuery];
    [v2 foundItemCount];

    id v3 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v3();
  }
  return result;
}

- (id)fedStatsStringsFromManifestBundlesAtURLs:(id)a3 withCompletion:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v38 = a4;
  int v6 = objc_opt_new();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v5;
  uint64_t v42 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
  if (v42)
  {
    uint64_t v40 = *MEMORY[0x1E4F1C6E8];
    uint64_t v41 = *(void *)v71;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v71 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v7;
        uint64_t v8 = *(void *)(*((void *)&v70 + 1) + 8 * v7);
        uint64_t v43 = (void *)MEMORY[0x1AD0BE030]();
        uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObject:v40];
        id v69 = 0;
        int v11 = [v9 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:v10 options:4 error:&v69];
        id v12 = v69;

        uint64_t v45 = v12;
        if (v12)
        {
          id v13 = PKLogForCategory(4);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v78 = v12;
            __int16 v79 = 2114;
            uint64_t v80 = v8;
            _os_log_error_impl(&dword_1A6597000, v13, OS_LOG_TYPE_ERROR, "error reading manifest bundles: %{public}@ for path: %{public}@", buf, 0x16u);
          }
        }
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v47 = v11;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v65 objects:v76 count:16];
        if (v48)
        {
          uint64_t v14 = *(void *)v66;
          uint64_t v46 = *(void *)v66;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v66 != v14) {
                objc_enumerationMutation(v47);
              }
              uint64_t v50 = v15;
              id v16 = *(void **)(*((void *)&v65 + 1) + 8 * v15);
              context = (void *)MEMORY[0x1AD0BE030]();
              uint64_t v17 = [v16 lastPathComponent];
              uint64_t v18 = [v17 pathExtension];
              int v19 = [v18 isEqualToString:@"bundle"];

              if (v19)
              {
                v54 = [MEMORY[0x1E4F28B50] bundleWithURL:v16];
                long long v61 = 0u;
                long long v62 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                id v51 = [(PSCoreSpotlightIndexer *)self manifestsFromDirectory:v16];
                uint64_t v55 = [v51 countByEnumeratingWithState:&v61 objects:v75 count:16];
                if (v55)
                {
                  uint64_t v52 = *(void *)v62;
                  do
                  {
                    uint64_t v20 = 0;
                    do
                    {
                      if (*(void *)v62 != v52) {
                        objc_enumerationMutation(v51);
                      }
                      uint64_t v56 = v20;
                      long long v21 = *(void **)(*((void *)&v61 + 1) + 8 * v20);
                      id v22 = PKLogForCategory(4);
                      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v78 = v21;
                        _os_log_impl(&dword_1A6597000, v22, OS_LOG_TYPE_DEFAULT, "Fetching from file: %@", buf, 0xCu);
                      }

                      id v23 = +[PSSpecifier emptyGroupSpecifier];
                      long long v24 = [(PSCoreSpotlightIndexer *)self searchableItemsFromManifest:v21 specifier:v23 bundle:v54 processCapabilities:0];

                      [v54 unload];
                      long long v57 = 0u;
                      long long v58 = 0u;
                      long long v59 = 0u;
                      long long v60 = 0u;
                      id v25 = v24;
                      uint64_t v26 = [v25 countByEnumeratingWithState:&v57 objects:v74 count:16];
                      if (v26)
                      {
                        uint64_t v27 = v26;
                        uint64_t v28 = *(void *)v58;
                        do
                        {
                          for (uint64_t i = 0; i != v27; ++i)
                          {
                            if (*(void *)v58 != v28) {
                              objc_enumerationMutation(v25);
                            }
                            uint64_t v30 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                            uint64_t v31 = [v30 name];
                            int v32 = [v31 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

                            v33 = NSString;
                            BOOL v34 = [v30 url];
                            v35 = [v33 stringWithFormat:@"%@:%@", v34, v32];

                            [v6 addObject:v35];
                          }
                          uint64_t v27 = [v25 countByEnumeratingWithState:&v57 objects:v74 count:16];
                        }
                        while (v27);
                      }

                      uint64_t v20 = v56 + 1;
                    }
                    while (v56 + 1 != v55);
                    uint64_t v55 = [v51 countByEnumeratingWithState:&v61 objects:v75 count:16];
                  }
                  while (v55);
                }

                uint64_t v14 = v46;
              }
              uint64_t v15 = v50 + 1;
            }
            while (v50 + 1 != v48);
            uint64_t v48 = [v47 countByEnumeratingWithState:&v65 objects:v76 count:16];
          }
          while (v48);
        }

        uint64_t v7 = v44 + 1;
      }
      while (v44 + 1 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
    }
    while (v42);
  }

  v36 = (void *)[v6 copy];
  return v36;
}

- (id)readManifestBundlesAtURLs:(id)a3 skippingBundles:(id)a4 skippingManifests:(id)a5
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v72 = (id)objc_opt_new();
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id obj = v7;
  uint64_t v61 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
  if (v61)
  {
    uint64_t v60 = *(void *)v91;
    uint64_t v58 = *MEMORY[0x1E4F1C6E8];
    *(void *)&long long v10 = 138543618;
    long long v57 = v10;
    id v65 = v8;
    id v71 = v9;
    do
    {
      for (uint64_t i = 0; i != v61; uint64_t i = v22 + 1)
      {
        if (*(void *)v91 != v60) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = i;
        id v12 = *(NSObject **)(*((void *)&v90 + 1) + 8 * i);
        uint64_t v63 = MEMORY[0x1AD0BE030]();
        char v89 = 0;
        id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v14 = [v12 path];
        char v15 = [v13 fileExistsAtPath:v14 isDirectory:&v89];

        if (v15)
        {
          if (v89)
          {
            id v16 = [MEMORY[0x1E4F28CB8] defaultManager];
            uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObject:v58];
            id v88 = 0;
            uint64_t v18 = [v16 contentsOfDirectoryAtURL:v12 includingPropertiesForKeys:v17 options:4 error:&v88];
            int v19 = v88;

            long long v62 = v19;
            if (v19)
            {
              uint64_t v20 = PKLogForCategory(4);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v57;
                long long v98 = v19;
                __int16 v99 = 2114;
                long long v100 = v12;
                _os_log_error_impl(&dword_1A6597000, v20, OS_LOG_TYPE_ERROR, "error reading manifest bundles: %{public}@ for path: %{public}@", buf, 0x16u);
              }

LABEL_17:
              long long v86 = 0u;
              long long v87 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              id v24 = v18;
              uint64_t v25 = [v24 countByEnumeratingWithState:&v84 objects:v96 count:16];
              if (!v25) {
                goto LABEL_52;
              }
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v85;
              uint64_t v66 = *(void *)v85;
              id v67 = v24;
              while (2)
              {
                uint64_t v28 = 0;
                uint64_t v68 = v26;
LABEL_20:
                if (*(void *)v85 != v27) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v29 = *(void **)(*((void *)&v84 + 1) + 8 * v28);
                context = (void *)MEMORY[0x1AD0BE030]();
                uint64_t v70 = v28;
                if ([v8 containsObject:v29])
                {
                  uint64_t v30 = PKLogForCategory(4);
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v31 = [v29 absoluteString];
                    *(_DWORD *)buf = 138412290;
                    long long v98 = v31;
                    _os_log_impl(&dword_1A6597000, v30, OS_LOG_TYPE_DEFAULT, "Skipping blocklisted bundle %@", buf, 0xCu);
                  }
                  goto LABEL_49;
                }
                int v32 = [v29 lastPathComponent];
                v33 = [v32 pathExtension];
                int v34 = [v33 isEqualToString:@"bundle"];

                if (v34)
                {
                  uint64_t v30 = [MEMORY[0x1E4F28B50] bundleWithURL:v29];
                  long long v80 = 0u;
                  long long v81 = 0u;
                  long long v82 = 0u;
                  long long v83 = 0u;
                  id v75 = [(PSCoreSpotlightIndexer *)self manifestsFromDirectory:v29];
                  uint64_t v35 = [v75 countByEnumeratingWithState:&v80 objects:v95 count:16];
                  if (v35)
                  {
                    uint64_t v36 = v35;
                    uint64_t v37 = *(void *)v81;
                    do
                    {
                      uint64_t v38 = 0;
                      uint64_t v74 = v36;
                      do
                      {
                        if (*(void *)v81 != v37) {
                          objc_enumerationMutation(v75);
                        }
                        v39 = *(NSObject **)(*((void *)&v80 + 1) + 8 * v38);
                        int v40 = objc_msgSend(v9, "containsObject:", v39, v57);
                        uint64_t v41 = PKLogForCategory(4);
                        BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
                        if (v40)
                        {
                          if (v42)
                          {
                            uint64_t v43 = [v39 absoluteString];
                            *(_DWORD *)buf = 138412290;
                            long long v98 = v43;
                            _os_log_impl(&dword_1A6597000, v41, OS_LOG_TYPE_DEFAULT, "Skipping blocklisted manifest %@", buf, 0xCu);
                          }
                        }
                        else
                        {
                          if (v42)
                          {
                            *(_DWORD *)buf = 138412290;
                            long long v98 = v39;
                            _os_log_impl(&dword_1A6597000, v41, OS_LOG_TYPE_DEFAULT, "Fetching from file: %@", buf, 0xCu);
                          }

                          uint64_t v44 = +[PSSpecifier emptyGroupSpecifier];
                          uint64_t v45 = [(PSCoreSpotlightIndexer *)self searchableItemsFromManifest:v39 specifier:v44 bundle:v30 processCapabilities:1];

                          uint64_t v46 = v30;
                          [v30 unload];
                          id v47 = PKLogForCategory(4);
                          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            long long v98 = v39;
                            _os_log_impl(&dword_1A6597000, v47, OS_LOG_TYPE_DEFAULT, "Converting %@", buf, 0xCu);
                          }
                          uint64_t v48 = v37;

                          uint64_t v41 = objc_opt_new();
                          long long v76 = 0u;
                          long long v77 = 0u;
                          long long v78 = 0u;
                          long long v79 = 0u;
                          id v49 = v45;
                          uint64_t v50 = [v49 countByEnumeratingWithState:&v76 objects:v94 count:16];
                          if (v50)
                          {
                            uint64_t v51 = v50;
                            uint64_t v52 = *(void *)v77;
                            do
                            {
                              for (uint64_t j = 0; j != v51; ++j)
                              {
                                if (*(void *)v77 != v52) {
                                  objc_enumerationMutation(v49);
                                }
                                v54 = [*(id *)(*((void *)&v76 + 1) + 8 * j) toAutomationDictionary];
                                [v41 addObject:v54];
                              }
                              uint64_t v51 = [v49 countByEnumeratingWithState:&v76 objects:v94 count:16];
                            }
                            while (v51);
                          }

                          uint64_t v55 = [v39 absoluteString];
                          [v72 setObject:v41 forKey:v55];

                          id v9 = v71;
                          uint64_t v30 = v46;
                          uint64_t v37 = v48;
                          uint64_t v36 = v74;
                        }

                        ++v38;
                      }
                      while (v38 != v36);
                      uint64_t v36 = [v75 countByEnumeratingWithState:&v80 objects:v95 count:16];
                    }
                    while (v36);
                  }

                  id v8 = v65;
                  uint64_t v27 = v66;
                  id v24 = v67;
                  uint64_t v26 = v68;
LABEL_49:
                }
                uint64_t v28 = v70 + 1;
                if (v70 + 1 == v26)
                {
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v84 objects:v96 count:16];
                  if (!v26)
                  {
LABEL_52:

                    id v23 = (void *)v63;
                    uint64_t v22 = v64;
                    long long v21 = v62;
                    goto LABEL_53;
                  }
                  continue;
                }
                goto LABEL_20;
              }
            }
          }
          else
          {
            long long v101 = v12;
            uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
          }
          long long v62 = 0;
          goto LABEL_17;
        }
        long long v21 = PKLogForCategory(4);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          long long v98 = v12;
          _os_log_error_impl(&dword_1A6597000, v21, OS_LOG_TYPE_ERROR, "path at %{public}@ does not exist", buf, 0xCu);
        }
        id v23 = (void *)v63;
        uint64_t v22 = v64;
LABEL_53:
      }
      uint64_t v61 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
    }
    while (v61);
  }

  return v72;
}

void __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_273(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A6597000, v2, OS_LOG_TYPE_DEFAULT, "Indexing Manifest completed for %@", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_274(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __102__PSCoreSpotlightIndexer_indexManifestBundlesAtURLs_skippingBundles_skippingManifests_withCompletion___block_invoke_286(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)topHitSearchForString:(id)a3 keyboardLanguage:(id)a4 foundItemsHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(PSCoreSpotlightIndexer *)self searchQuery];
  [v14 cancel];

  char v15 = PKLogForCategory(4);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = self;
    _os_log_impl(&dword_1A6597000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing top hit search", buf, 0xCu);
  }

  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F23888]) initWithSearchString:v13 keyboardLanguage:v12 attributes:&unk_1EFB74348 hitCount:500];
  [(PSCoreSpotlightIndexer *)self setSearchQuery:v16];

  uint64_t v17 = [(PSCoreSpotlightIndexer *)self searchableItemClassIdentifier];
  uint64_t v27 = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  int v19 = [(PSCoreSpotlightIndexer *)self searchQuery];
  [v19 setBundleIDs:v18];

  uint64_t v20 = *MEMORY[0x1E4F28358];
  v26[0] = *MEMORY[0x1E4F28340];
  v26[1] = v20;
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  uint64_t v22 = [(PSCoreSpotlightIndexer *)self searchQuery];
  [v22 setProtectionClasses:v21];

  id v23 = [(PSCoreSpotlightIndexer *)self searchQuery];
  [v23 setFoundItemsHandler:v11];

  id v24 = [(PSCoreSpotlightIndexer *)self searchQuery];
  [v24 setCompletionHandler:v10];

  uint64_t v25 = [(PSCoreSpotlightIndexer *)self searchQuery];
  [v25 start];
}

- (void)reindexSpecifiersIfNeeded:(id)a3 bundle:(id)a4 withURLPrefix:(id)a5 waitForCompletion:(BOOL)a6 setHasIndexed:(BOOL)a7 completion:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if ([(PSCoreSpotlightIndexer *)self needsIndex])
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke;
    v28[3] = &unk_1E5C60150;
    BOOL v33 = a7;
    v28[4] = self;
    id v29 = v14;
    id v30 = v15;
    id v31 = v16;
    id v32 = v17;
    uint64_t v18 = (void *)MEMORY[0x1AD0BE2A0](v28);
    int v19 = v18;
    spotlightIndexQueue = self->_spotlightIndexQueue;
    if (v10)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_309;
      block[3] = &unk_1E5C5D938;
      long long v21 = &v27;
      uint64_t v27 = v18;
      id v22 = v18;
      dispatch_sync(spotlightIndexQueue, block);
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      void v24[2] = __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_2;
      v24[3] = &unk_1E5C5D938;
      long long v21 = &v25;
      uint64_t v25 = v18;
      id v23 = v18;
      dispatch_async(spotlightIndexQueue, v24);
    }
  }
}

void __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) setHasIndexed];
  }
  uint64_t v2 = PKLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6597000, v2, OS_LOG_TYPE_DEFAULT, "Gathering index items...", buf, 2u);
  }

  uint64_t v3 = objc_opt_new();
  [*(id *)(a1 + 32) setIndexFromControllerLog:v3];

  int v4 = [*(id *)(a1 + 32) csSearchableItemsFromSpecifiers:*(void *)(a1 + 40) bundle:*(void *)(a1 + 48) category:0 pathURL:0 withURLPrefix:*(void *)(a1 + 56) parentSpecifierNames:0];
  uint64_t v5 = PKLogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "Deleting index", buf, 2u);
  }

  uint64_t v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_307;
  v8[3] = &unk_1E5C5DE48;
  v8[4] = v6;
  id v9 = v4;
  id v10 = *(id *)(a1 + 64);
  id v7 = v4;
  [v6 deleteIndexWithCompletionBlock:v8];
}

void __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_307(uint64_t a1)
{
  uint64_t v2 = PKLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6597000, v2, OS_LOG_TYPE_DEFAULT, "Index Deleted. Reindexing...", buf, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_308;
  v5[3] = &unk_1E5C5ECF0;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 48);
  [v3 _indexSearchableItems:v4 completionHandler:v5];
}

uint64_t __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_308(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6597000, v2, OS_LOG_TYPE_DEFAULT, "Indexing completed. Indexed the following PSListControllers:", buf, 2u);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) indexFromControllerLog];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v9 = PKLogForCategory(4);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v16 = v8;
          _os_log_impl(&dword_1A6597000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_309(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __116__PSCoreSpotlightIndexer_reindexSpecifiersIfNeeded_bundle_withURLPrefix_waitForCompletion_setHasIndexed_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)indexSpecifiers:(id)a3 bundle:(id)a4 withURLPrefix:(id)a5 waitForCompletion:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  spotlightIndexQueue = self->_spotlightIndexQueue;
  if (v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__PSCoreSpotlightIndexer_indexSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke;
    block[3] = &unk_1E5C60128;
    void block[4] = self;
    id v17 = &v27;
    id v27 = v12;
    uint64_t v18 = &v28;
    id v28 = v13;
    int v19 = &v29;
    id v29 = v14;
    uint64_t v20 = &v30;
    id v30 = v15;
    dispatch_sync(spotlightIndexQueue, block);
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __92__PSCoreSpotlightIndexer_indexSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke_2;
    v21[3] = &unk_1E5C60128;
    v21[4] = self;
    id v17 = &v22;
    id v22 = v12;
    uint64_t v18 = &v23;
    id v23 = v13;
    int v19 = &v24;
    id v24 = v14;
    uint64_t v20 = &v25;
    id v25 = v15;
    dispatch_async(spotlightIndexQueue, v21);
  }
}

void __92__PSCoreSpotlightIndexer_indexSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [v2 csSearchableItemsFromSpecifiers:a1[5] bundle:a1[6] category:0 pathURL:0 withURLPrefix:a1[7] parentSpecifierNames:0];
  [v2 _indexSearchableItems:v3 completionHandler:a1[8]];
}

void __92__PSCoreSpotlightIndexer_indexSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = [v2 csSearchableItemsFromSpecifiers:a1[5] bundle:a1[6] category:0 pathURL:0 withURLPrefix:a1[7] parentSpecifierNames:0];
  [v2 _indexSearchableItems:v3 completionHandler:a1[8]];
}

- (void)deleteSpecifiers:(id)a3 bundle:(id)a4 withURLPrefix:(id)a5 waitForCompletion:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  spotlightIndexQueue = self->_spotlightIndexQueue;
  if (v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__PSCoreSpotlightIndexer_deleteSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke;
    block[3] = &unk_1E5C60128;
    void block[4] = self;
    id v17 = &v27;
    id v27 = v12;
    uint64_t v18 = &v28;
    id v28 = v13;
    int v19 = &v29;
    id v29 = v14;
    uint64_t v20 = &v30;
    id v30 = v15;
    dispatch_sync(spotlightIndexQueue, block);
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __93__PSCoreSpotlightIndexer_deleteSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke_2;
    v21[3] = &unk_1E5C60128;
    v21[4] = self;
    id v17 = &v22;
    id v22 = v12;
    uint64_t v18 = &v23;
    id v23 = v13;
    int v19 = &v24;
    id v24 = v14;
    uint64_t v20 = &v25;
    id v25 = v15;
    dispatch_async(spotlightIndexQueue, v21);
  }
}

uint64_t __93__PSCoreSpotlightIndexer_deleteSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteSpecifiers:*(void *)(a1 + 40) bundle:*(void *)(a1 + 48) category:0 pathURL:0 withURLPrefix:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

uint64_t __93__PSCoreSpotlightIndexer_deleteSpecifiers_bundle_withURLPrefix_waitForCompletion_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteSpecifiers:*(void *)(a1 + 40) bundle:*(void *)(a1 + 48) category:0 pathURL:0 withURLPrefix:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

- (void)deleteIndexWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSCoreSpotlightIndexer *)self prefsSearchableIndex];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PSCoreSpotlightIndexer_deleteIndexWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E5C60178;
  id v8 = v4;
  id v6 = v4;
  [v5 deleteAllSearchableItemsWithCompletionHandler:v7];
}

void __57__PSCoreSpotlightIndexer_deleteIndexWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PKLogForCategory(4);
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__PSCoreSpotlightIndexer_deleteIndexWithCompletionBlock___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "Deleted existing Settings Spotlight Index", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (id)searchableItemsFromSpecifiers:(id)a3 bundle:(id)a4 category:(id)a5 pathURL:(id)a6 withURLPrefix:(id)a7 parentSpecifierNames:(id)a8
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = v13;
  id v16 = v14;
  id v65 = a5;
  id v61 = a6;
  id v64 = a7;
  id v17 = a8;
  uint64_t v63 = v17;
  if ([v13 count])
  {
    id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ((unint64_t)[v17 count] <= 9)
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id obj = v13;
      uint64_t v18 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
      int v19 = self;
      if (v18)
      {
        uint64_t v20 = v18;
        uint64_t v21 = *(void *)v83;
        uint64_t v58 = *(void *)v83;
        id v59 = v16;
        do
        {
          uint64_t v22 = 0;
          uint64_t v62 = v20;
          do
          {
            if (*(void *)v83 != v21) {
              objc_enumerationMutation(obj);
            }
            id v23 = *(void **)(*((void *)&v82 + 1) + 8 * v22);
            if (ShouldIndexSpecifier(v23))
            {
              id v24 = [(PSCoreSpotlightIndexer *)v19 _bundleForSpecifier:v23 parentBundle:v16];
              id v75 = v23;
              if (([v24 isEqual:v16] & 1) == 0)
              {
                id v25 = [(PSCoreSpotlightIndexer *)v19 searchableItemsFromManifestsForSpecifier:v23 bundle:v24];
                [v68 addObjectsFromArray:v25];
              }
              uint64_t v74 = v24;
              long long v73 = [(PSCoreSpotlightIndexer *)v19 _specifiersForSpecifier:v23 bundle:v24 parentBundle:v16];
              uint64_t v26 = [v23 identifier];
              id v27 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
              id v28 = [v26 stringByAddingPercentEncodingWithAllowedCharacters:v27];

              id v72 = v28;
              if ([v28 length])
              {
                id v29 = [v23 propertyForKey:@"detail"];
                if (v29)
                {
                  BOOL v30 = 0;
                }
                else
                {
                  id v31 = [v23 propertyForKey:@"bundle"];
                  if (v31) {
                    BOOL v30 = 0;
                  }
                  else {
                    BOOL v30 = [v23 detailControllerClass] == 0;
                  }
                }
                id v80 = 0;
                id v81 = 0;
                char v67 = v30;
                LOBYTE(v57) = v30;
                id v71 = [(PSCoreSpotlightIndexer *)v19 _urlForSpecifier:v23 identifier:v72 category:v65 childCategory:&v81 prefix:v64 path:&v80 baseURL:v61 shouldLinkToRow:v57];
                id v69 = v81;
                id v70 = v80;
                long long v76 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                long long v79 = 0u;
                id v32 = v73;
                uint64_t v33 = [v32 countByEnumeratingWithState:&v76 objects:v91 count:16];
                if (v33)
                {
                  uint64_t v34 = v33;
                  id v35 = 0;
                  uint64_t v36 = *(void *)v77;
                  do
                  {
                    for (uint64_t i = 0; i != v34; ++i)
                    {
                      if (*(void *)v77 != v36) {
                        objc_enumerationMutation(v32);
                      }
                      uint64_t v38 = *(void **)(*((void *)&v76 + 1) + 8 * i);
                      if (![v38 cellType])
                      {
                        v39 = [v38 name];
                        uint64_t v40 = [v39 length];

                        if (v40)
                        {
                          if (!v35) {
                            id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                          }
                          uint64_t v41 = [v38 name];
                          [v35 addObject:v41];
                        }
                      }
                    }
                    uint64_t v34 = [v32 countByEnumeratingWithState:&v76 objects:v91 count:16];
                  }
                  while (v34);
                }
                else
                {
                  id v35 = 0;
                }

                BOOL v42 = [v75 name];
                int v19 = self;
                uint64_t v43 = [(PSCoreSpotlightIndexer *)self _descriptionForSpecifierName:v42 withParentSpecifierNames:v63];

                uint64_t v44 = [v75 name];
                uint64_t v45 = [v44 length];

                if (v45)
                {
                  uint64_t v46 = [v74 bundleIdentifier];
                  id v47 = [(PSCoreSpotlightIndexer *)self searchableItemForSpecifier:v75 bundleID:v46 category:v65 keywords:v35 url:v71 description:v43];

                  [v68 addObject:v47];
                }
                uint64_t v48 = v69;
                if ([v32 count])
                {
                  id v49 = [v75 name];

                  if (v49)
                  {
                    uint64_t v50 = [v75 name];
                    if (v63)
                    {
                      [v63 arrayByAddingObject:v50];
                    }
                    else
                    {
                      long long v90 = v50;
                      [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
                    id v49 = };
                  }
                  uint64_t v51 = [(PSCoreSpotlightIndexer *)self searchableItemsFromSpecifiers:v32 bundle:v74 category:v69 pathURL:v70 withURLPrefix:v64 parentSpecifierNames:v49];
                  [v68 addObjectsFromArray:v51];
                }
                uint64_t v52 = [v32 count];
                char v53 = v67;
                if (v52) {
                  char v53 = 1;
                }
                id v16 = v59;
                uint64_t v20 = v62;
                if ((v53 & 1) == 0)
                {
                  v54 = PKLogForCategory(4);
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v55 = [v75 name];
                    *(_DWORD *)buf = 138412546;
                    long long v87 = v55;
                    __int16 v88 = 2112;
                    char v89 = v71;
                    _os_log_impl(&dword_1A6597000, v54, OS_LOG_TYPE_DEFAULT, "Can't find children for \"%@\" URL: %@", buf, 0x16u);

                    uint64_t v48 = v69;
                  }
                }
                uint64_t v21 = v58;
              }
            }
            ++v22;
          }
          while (v22 != v20);
          uint64_t v20 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
        }
        while (v20);
      }

      id v15 = v13;
    }
  }
  else
  {
    id v68 = 0;
  }

  return v68;
}

- (id)csSearchableItemsFromSpecifiers:(id)a3 bundle:(id)a4 category:(id)a5 pathURL:(id)a6 withURLPrefix:(id)a7 parentSpecifierNames:(id)a8
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = [(PSCoreSpotlightIndexer *)self searchableItemsFromSpecifiers:a3 bundle:a4 category:a5 pathURL:a6 withURLPrefix:a7 parentSpecifierNames:a8];
  id v9 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "toCSSearchableItem", (void)v18);
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  id v16 = (void *)[v9 copy];
  return v16;
}

- (id)manifestFromSpecifiers:(id)a3 bundle:(id)a4 category:(id)a5 pathURL:(id)a6 withURLPrefix:(id)a7 parentSpecifierNames:(id)a8
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = [(PSCoreSpotlightIndexer *)self searchableItemsFromSpecifiers:a3 bundle:a4 category:a5 pathURL:a6 withURLPrefix:a7 parentSpecifierNames:a8];
  id v9 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "toManifestDictionary", (void)v18);
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  id v16 = (void *)[v9 copy];
  return v16;
}

void __73__PSCoreSpotlightIndexer__indexChunkOfSearchableItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogForCategory(4);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "Unable to index items with error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "Successfully indexed %@ items.", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (void)_deleteSpecifiers:(id)a3 bundle:(id)a4 category:(id)a5 pathURL:(id)a6 withURLPrefix:(id)a7 completion:(id)a8
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v46 = a6;
  id v44 = a7;
  id v17 = (void (**)(void))a8;
  if ([v14 count])
  {
    BOOL v42 = v17;
    id v47 = objc_opt_new();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v43 = v14;
    id obj = v14;
    uint64_t v18 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    id v19 = v44;
    if (v18)
    {
      uint64_t v20 = v18;
      uint64_t v21 = *(void *)v57;
      uint64_t v45 = *(void *)v57;
      do
      {
        uint64_t v22 = 0;
        uint64_t v48 = v20;
        do
        {
          if (*(void *)v57 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v56 + 1) + 8 * v22);
          if (ShouldIndexSpecifier(v23))
          {
            id v24 = [v23 identifier];
            id v25 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
            uint64_t v26 = [v24 stringByAddingPercentEncodingWithAllowedCharacters:v25];

            if ([v26 length])
            {
              id v27 = [v23 propertyForKey:@"detail"];
              if (v27)
              {
                BOOL v28 = 0;
              }
              else
              {
                id v29 = [v23 propertyForKey:@"bundle"];
                if (v29) {
                  BOOL v28 = 0;
                }
                else {
                  BOOL v28 = [v23 detailControllerClass] == 0;
                }
              }
              id v54 = 0;
              id v55 = 0;
              LOBYTE(v41) = v28;
              uint64_t v30 = [(PSCoreSpotlightIndexer *)self _urlForSpecifier:v23 identifier:v26 category:v16 childCategory:&v55 prefix:v19 path:&v54 baseURL:v46 shouldLinkToRow:v41];
              id v31 = v55;
              id v32 = v54;
              uint64_t v50 = (void *)v30;
              [v47 addObject:v30];
              uint64_t v33 = [(PSCoreSpotlightIndexer *)self _bundleForSpecifier:v23 parentBundle:v15];
              if (([v33 isEqual:v15] & 1) == 0)
              {
                [(PSCoreSpotlightIndexer *)self _urlsFromManifestForSpecifier:v23 bundle:v15];
                id v34 = v16;
                v36 = id v35 = v15;
                [v47 addObjectsFromArray:v36];

                id v15 = v35;
                id v16 = v34;
                id v19 = v44;
              }
              uint64_t v37 = [(PSCoreSpotlightIndexer *)self _specifiersForSpecifier:v23 bundle:v33 parentBundle:v15];
              [(PSCoreSpotlightIndexer *)self _deleteSpecifiers:v37 bundle:v33 category:v31 pathURL:v32 withURLPrefix:v19 completion:0];

              uint64_t v21 = v45;
            }

            uint64_t v20 = v48;
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v20);
    }

    uint64_t v38 = [(PSCoreSpotlightIndexer *)self prefsSearchableIndex];
    v39 = (void *)[v47 copy];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __93__PSCoreSpotlightIndexer__deleteSpecifiers_bundle_category_pathURL_withURLPrefix_completion___block_invoke;
    v51[3] = &unk_1E5C601A0;
    id v52 = v47;
    id v17 = v42;
    char v53 = v42;
    id v40 = v47;
    [v38 deleteSearchableItemsWithIdentifiers:v39 completionHandler:v51];

    id v14 = v43;
  }
  else if (v17)
  {
    v17[2](v17);
  }
}

void __93__PSCoreSpotlightIndexer__deleteSpecifiers_bundle_category_pathURL_withURLPrefix_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogForCategory(4);
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __93__PSCoreSpotlightIndexer__deleteSpecifiers_bundle_category_pathURL_withURLPrefix_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "Deleted index items with identifiers: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (id)_keyValueDictionaryForURL:(id)a3
{
  id v3 = a3;
  id v4 = +[PSURLManager sharedManager];
  BOOL v5 = [v4 keyValueDictionaryForURL:v3];

  return v5;
}

- (id)_descriptionForSpecifierName:(id)a3 withParentSpecifierNames:(id)a4
{
  id v4 = a4;
  if ([v4 count])
  {
    uint64_t v5 = PSLocaleLanguageDirection();
    uint64_t v6 = @"→";
    if (v5 == 2) {
      uint64_t v6 = @"←";
    }
    uint64_t v7 = [NSString stringWithFormat:@" %@ ", v6];
    int v8 = [v4 componentsJoinedByString:v7];
    if (v5 == 2)
    {
      uint64_t v9 = [NSString stringWithFormat:@"%@%@", v8, @"\u200F"];

      int v8 = (void *)v9;
    }
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)descriptionForCSSearchableItem:(id)a3
{
  id v3 = [a3 attributeSet];
  id v4 = NSString;
  uint64_t v5 = [v3 subject];
  uint64_t v6 = [v3 rankingHint];
  uint64_t v7 = [v3 identifier];
  int v8 = [v4 stringWithFormat:@"Search item name=%@, rank=%@, uid=%@", v5, v6, v7];

  return v8;
}

- (id)descriptionForCSSearchableItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[PSCoreSpotlightIndexer descriptionForCSSearchableItem:](self, "descriptionForCSSearchableItem:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 appendString:v11];

        [v5 appendString:@"\n"];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v5 copy];
  return v12;
}

- (id)searchableItemsFromManifestsForSpecifier:(id)a3 bundle:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(PSCoreSpotlightIndexer *)self skipManifests];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7 && !v8)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = objc_msgSend(v7, "bundleURL", 0);
    uint64_t v12 = [(PSCoreSpotlightIndexer *)self manifestsFromDirectory:v11];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = [(PSCoreSpotlightIndexer *)self searchableItemsFromManifest:*(void *)(*((void *)&v19 + 1) + 8 * i) specifier:v6 bundle:v7 processCapabilities:1];
          [v10 addObjectsFromArray:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    uint64_t v9 = (void *)[v10 copy];
  }

  return v9;
}

- (id)_bundleForSpecifier:(id)a3 parentBundle:(id)a4
{
  id v5 = a4;
  id v6 = [a3 propertyForKey:@"bundle"];
  if ([v6 length])
  {
    id v7 = (void *)MEMORY[0x1E4F28B50];
    BOOL v8 = PSBundlePathForPreferenceBundle((uint64_t)v6);
    uint64_t v9 = SFRuntimeAbsoluteFilePathForPath();
    id v10 = [v7 bundleWithPath:v9];

    if (!v10)
    {
      uint64_t v11 = SFDeveloperSettingsBundlesDirectoryPath();
      uint64_t v12 = [v11 stringByAppendingPathComponent:v6];
      uint64_t v13 = [v12 stringByAppendingPathExtension:@"bundle"];

      uint64_t v14 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v15 = SFRuntimeAbsoluteFilePathForPath();
      id v10 = [v14 bundleWithPath:v15];

      if (!v10)
      {
        long long v16 = [MEMORY[0x1E4F42948] currentDevice];
        if (objc_msgSend(v16, "sf_isInternalInstall"))
        {
          Boolean keyExistsAndHasValidFormat = 0;
          int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PSShouldIndexInternalSettings", @"com.apple.Preferences", &keyExistsAndHasValidFormat);
          int v18 = keyExistsAndHasValidFormat;

          id v10 = 0;
          if (v18 && AppBooleanValue)
          {
            long long v19 = [@"/AppleInternal/Library/PreferenceBundles/" stringByAppendingPathComponent:v6];
            long long v20 = [v19 stringByAppendingPathExtension:@"bundle"];

            long long v21 = (void *)MEMORY[0x1E4F28B50];
            long long v22 = SFRuntimeAbsoluteFilePathForPath();
            id v10 = [v21 bundleWithPath:v22];
          }
        }
        else
        {

          id v10 = 0;
        }
      }
    }
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

- (id)_specifiersPlistPathForSpecifier:(id)a3 bundle:(id)a4 parentBundle:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 propertyForKey:@"searchPlist"];
  if (v10)
  {
    uint64_t v11 = [v8 pathForResource:v10 ofType:@"plist"];
  }
  else
  {
    uint64_t v12 = [v7 identifier];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      uint64_t v14 = [v7 identifier];
      uint64_t v11 = [v8 pathForResource:v14 ofType:@"plist"];
    }
    else
    {
      uint64_t v11 = 0;
    }
    char v15 = [v8 isEqual:v9];
    if (![v11 length] && (v15 & 1) == 0)
    {
      long long v16 = [v8 bundleURL];
      long long v17 = [v16 lastPathComponent];
      int v18 = [v17 stringByDeletingPathExtension];

      long long v19 = [v8 pathForResource:v18 ofType:@"plist"];

      if (![v19 length])
      {
        long long v20 = PKLogForCategory(4);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          long long v21 = [v7 identifier];
          int v23 = 138412546;
          uint64_t v24 = v21;
          __int16 v25 = 2112;
          uint64_t v26 = v18;
          _os_log_impl(&dword_1A6597000, v20, OS_LOG_TYPE_DEFAULT, "Could not find plist for specifier: %@, in bundle: %@", (uint8_t *)&v23, 0x16u);
        }
      }

      uint64_t v11 = v19;
    }
  }

  return v11;
}

- (id)_specifiersForSpecifier:(id)a3 bundle:(id)a4 parentBundle:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v8 cellType])
  {
    long long v17 = 0;
    goto LABEL_67;
  }
  uint64_t v11 = [v8 propertyForKey:@"AppSettingsBundle"];

  if (!v11) {
    goto LABEL_26;
  }
  uint64_t v66 = self;
  uint64_t v12 = [v8 propertyForKey:@"AppSettingsBundle"];
  uint64_t v13 = [v8 propertyForKey:@"File"];
  uint64_t v14 = [v12 pathForResource:v13 ofType:@"plist"];
  char v15 = (void *)v14;
  if (!v13 || v14 == 0)
  {
    long long v17 = 0;
  }
  else
  {
    uint64_t v63 = v12;
    id v64 = v10;
    id v65 = v9;
    uint64_t v62 = (void *)v14;
    int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v14];
    long long v19 = [v18 objectForKeyedSubscript:@"StringsTable"];
    long long v20 = [v19 stringByDeletingPathExtension];

    uint64_t v61 = v18;
    long long v21 = [v18 objectForKeyedSubscript:@"PreferenceSpecifiers"];
    long long v22 = [MEMORY[0x1E4F1CA48] array];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v72 objects:v81 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v73;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v73 != v26) {
            objc_enumerationMutation(v23);
          }
          BOOL v28 = +[PSAppListController specifiersFromDictionary:*(void *)(*((void *)&v72 + 1) + 8 * i) stringsTable:v20 parentSpecifier:v8 target:0];
          if (v28) {
            [v22 addObjectsFromArray:v28];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v72 objects:v81 count:16];
      }
      while (v25);
    }

    if ([v22 count]) {
      long long v17 = (void *)[v22 copy];
    }
    else {
      long long v17 = 0;
    }
    id v29 = PKLogForCategory(4);
    id v9 = v65;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      long long v78 = v13;
      __int16 v79 = 2112;
      id v80 = v17;
      _os_log_impl(&dword_1A6597000, v29, OS_LOG_TYPE_DEFAULT, "Got specifiers from 3rd party plist %@: Specifiers: %@", buf, 0x16u);
    }

    uint64_t v12 = v63;
    id v10 = v64;
    char v15 = v62;
  }

  self = v66;
  if (!v17)
  {
LABEL_26:
    uint64_t v30 = [(PSCoreSpotlightIndexer *)self _specifiersPlistPathForSpecifier:v8 bundle:v9 parentBundle:v10];
    if ([v30 length])
    {
      id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v30];
      id v32 = [v31 objectForKeyedSubscript:@"searchable"];
      int v33 = [v32 BOOLValue];
      if (!v32 || v33)
      {
        char v67 = self;
        id v34 = [v30 lastPathComponent];
        id v35 = [v34 stringByDeletingPathExtension];

        long long v17 = SearchSpecifiersFromPlist(v31, v8, v35, v9);
        uint64_t v36 = PKLogForCategory(4);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          long long v78 = (NSString *)v35;
          __int16 v79 = 2112;
          id v80 = v17;
          _os_log_impl(&dword_1A6597000, v36, OS_LOG_TYPE_DEFAULT, "Got specifiers from plist %@: Specifiers: %@", buf, 0x16u);
        }

        self = v67;
      }
      else
      {
        long long v17 = 0;
      }

      if (v17) {
        goto LABEL_67;
      }
    }
    else
    {
    }
    uint64_t v37 = [v8 propertyForKey:@"dataSourceClass"];
    if (!v37) {
      goto LABEL_39;
    }
    uint64_t v38 = (NSString *)v37;
    [v9 load];
    v39 = [NSClassFromString(v38) sharedInstance];
    long long v17 = [v39 specifiersForSpecifier:v8 observer:0];
    id v40 = PKLogForCategory(4);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      long long v78 = v38;
      __int16 v79 = 2112;
      id v80 = v17;
      _os_log_impl(&dword_1A6597000, v40, OS_LOG_TYPE_DEFAULT, "Got specifiers from datasource %@: Specifiers: %@", buf, 0x16u);
    }

    if (!v17)
    {
LABEL_39:
      uint64_t v41 = [v8 propertyForKey:@"detail"];
      if (!v41)
      {
        BOOL v42 = [v8 propertyForKey:@"isController"];
        int v43 = [v42 BOOLValue];

        if (!v43
          || (NSStringFromClass((Class)[v9 principalClass]),
              (uint64_t v41 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          uint64_t v41 = NSStringFromClass((Class)[v8 detailControllerClass]);
          if (!v41) {
            goto LABEL_45;
          }
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || [(PSCoreSpotlightIndexer *)self controllerIsBlacklisted:v41])
      {
LABEL_45:
        long long v17 = 0;
LABEL_66:

        goto LABEL_67;
      }
      id v44 = [(PSCoreSpotlightIndexer *)self indexFromControllerLog];
      [v44 insertObject:v41 atIndex:0];

      uint64_t v45 = (void *)[@"PSCoreSpotlightIndexer indexed these PSlistControllers:\n" mutableCopy];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v46 = [(PSCoreSpotlightIndexer *)self indexFromControllerLog];
      id v47 = (void *)[v46 copy];

      uint64_t v48 = [v47 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v69;
        do
        {
          for (uint64_t j = 0; j != v49; ++j)
          {
            if (*(void *)v69 != v50) {
              objc_enumerationMutation(v47);
            }
            [v45 appendString:*(void *)(*((void *)&v68 + 1) + 8 * j)];
            [v45 appendString:@"\n"];
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v68 objects:v76 count:16];
        }
        while (v49);
      }

      id v52 = v45;
      qword_1E96C0240 = [v52 UTF8String];
      [v9 load];
      char v53 = NSClassFromString((NSString *)v41);
      id v54 = PKLogForCategory(4);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        id v55 = [v9 bundlePath];
        long long v56 = [v55 lastPathComponent];
        long long v57 = [v56 stringByDeletingPathExtension];
        *(_DWORD *)buf = 138412546;
        long long v78 = (NSString *)v41;
        __int16 v79 = 2112;
        id v80 = v57;
        _os_log_impl(&dword_1A6597000, v54, OS_LOG_TYPE_DEFAULT, "Trying to get specifiers from controller: %@, in bundle: %@", buf, 0x16u);
      }
      if (v53)
      {
        if ([(objc_class *)v53 isSubclassOfClass:objc_opt_class()])
        {
          long long v58 = objc_alloc_init(v53);
          [v58 setSpecifier:v8];
          long long v17 = [v58 specifiers];
          long long v59 = PKLogForCategory(4);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            long long v78 = (NSString *)v41;
            __int16 v79 = 2112;
            id v80 = v17;
            _os_log_impl(&dword_1A6597000, v59, OS_LOG_TYPE_DEFAULT, "Got specifiers from controller %@: Specifiers: %@", buf, 0x16u);
          }

          goto LABEL_65;
        }
        long long v58 = PKLogForCategory(4);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          -[PSCoreSpotlightIndexer _specifiersForSpecifier:bundle:parentBundle:]();
        }
      }
      else
      {
        long long v58 = PKLogForCategory(4);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          -[PSCoreSpotlightIndexer _specifiersForSpecifier:bundle:parentBundle:]();
        }
      }
      long long v17 = 0;
LABEL_65:

      goto LABEL_66;
    }
  }
LABEL_67:

  return v17;
}

- (id)_urlForSpecifier:(id)a3 identifier:(id)a4 category:(id)a5 childCategory:(id *)a6 prefix:(id)a7 path:(id *)a8 baseURL:(id)a9 shouldLinkToRow:(BOOL)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a9;
  if ([v17 length])
  {
    id v20 = v17;
    *a6 = v20;
    if ([v19 length])
    {
      if (!a10)
      {
        *a8 = [NSString stringWithFormat:@"%@/%@", v19, v16];
        [v19 length];
LABEL_12:
        [NSString stringWithFormat:@"%@:root=%@&path=%@", v18, v20, *a8];
        goto LABEL_14;
      }
      id v21 = [NSString stringWithFormat:@"%@#%@", v19, v16];
    }
    else
    {
      id v21 = v16;
    }
    *a8 = v21;
    if (![v19 length] && a10)
    {
      [NSString stringWithFormat:@"%@:root=%@#%@", v18, v20, *a8];
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v22 = v16;
  *a6 = v22;
  if (a10) {
    [NSString stringWithFormat:@"%@:root=ROOT#%@", v18, v22, v29];
  }
  else {
    [NSString stringWithFormat:@"%@:root=%@", v18, v22, v29];
  }
  id v23 = LABEL_14:;
  uint64_t v24 = [v15 propertyForKey:@"AppBundleID"];

  if (v24)
  {
    uint64_t v25 = NSString;
    uint64_t v26 = [v15 propertyForKey:@"AppBundleID"];
    uint64_t v27 = [v25 stringWithFormat:@"%@&thirdPartyBundleID=%@", v23, v26];

    id v23 = (void *)v27;
  }

  return v23;
}

- (id)_urlsFromManifestForSpecifier:(id)a3 bundle:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v32 = v6;
  id v8 = [v6 bundleURL];
  id v9 = [(PSCoreSpotlightIndexer *)self manifestsFromDirectory:v8];

  id obj = v9;
  uint64_t v34 = [v9 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v34)
  {
    uint64_t v31 = *(void *)v42;
    *(void *)&long long v10 = 138412546;
    long long v29 = v10;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v42 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfURL:", v12, v29);
        uint64_t v14 = [v12 lastPathComponent];
        id v15 = [v14 stringByDeletingPathExtension];

        id v35 = v15;
        uint64_t v36 = v13;
        id v16 = SearchSpecifiersFromPlist(v13, v33, v15, v32);
        id v17 = PKLogForCategory(4);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v29;
          id v47 = v12;
          __int16 v48 = 2112;
          uint64_t v49 = v16;
          _os_log_impl(&dword_1A6597000, v17, OS_LOG_TYPE_DEFAULT, "Manifest found: %@\nspecifiers: %@", buf, 0x16u);
        }

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v18 = v16;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v38 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              if (ShouldIndexSpecifier(v23))
              {
                uint64_t v24 = [v23 name];
                uint64_t v25 = [v24 length];

                if (v25)
                {
                  uint64_t v26 = [v23 objectForKeyedSubscript:@"searchURL"];
                  [v7 addObject:v26];
                }
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v20);
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v34);
  }

  uint64_t v27 = (void *)[v7 copy];
  return v27;
}

- (void)indexThirdPartyAppsWithPrefix:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  spotlightIndexQueue = self->_spotlightIndexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PSCoreSpotlightIndexer_indexThirdPartyAppsWithPrefix_completion___block_invoke;
  block[3] = &unk_1E5C5DE48;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(spotlightIndexQueue, block);
}

void __67__PSCoreSpotlightIndexer_indexThirdPartyAppsWithPrefix_completion___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6597000, v2, OS_LOG_TYPE_DEFAULT, "Started indexing 3rd party specifiers", buf, 2u);
  }

  id v3 = +[PSSystemPolicyManager thirdPartyApplications];
  id v4 = +[PSSystemPolicyManager specifiersForThirdPartyApps:v3];

  id v5 = [*(id *)(a1 + 32) csSearchableItemsFromSpecifiers:v4 bundle:0 category:0 pathURL:0 withURLPrefix:*(void *)(a1 + 40) parentSpecifierNames:0];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 searchableThirdPartyItemClassIdentifier];
  v17[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PSCoreSpotlightIndexer_indexThirdPartyAppsWithPrefix_completion___block_invoke_402;
  v12[3] = &unk_1E5C5E380;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v9 = *(id *)(a1 + 48);
  id v14 = v4;
  id v15 = v9;
  id v10 = v4;
  id v11 = v5;
  [v6 deleteIndexWithDomainIdentifiers:v8 completionBlock:v12];
}

void __67__PSCoreSpotlightIndexer_indexThirdPartyAppsWithPrefix_completion___block_invoke_402(uint64_t a1)
{
  uint64_t v2 = PKLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6597000, v2, OS_LOG_TYPE_DEFAULT, "Deleted 3rd party index", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PSCoreSpotlightIndexer_indexThirdPartyAppsWithPrefix_completion___block_invoke_403;
  v5[3] = &unk_1E5C5EA48;
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v3 _indexSearchableItems:v4 completionHandler:v5];
}

void __67__PSCoreSpotlightIndexer_indexThirdPartyAppsWithPrefix_completion___block_invoke_403(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = PKLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1A6597000, v3, OS_LOG_TYPE_DEFAULT, "Finished indexing %@ 3rd party specifiers", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t __70__PSCoreSpotlightIndexer_performYukonManifestMigrationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setBool:1 forKey:@"PSCoreSpolightIndexerHasPerformediOS13Migration"];

  id v3 = PKLogForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1A6597000, v3, OS_LOG_TYPE_DEFAULT, "Deleted index for index domain migration", v5, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setSkipManifests:(BOOL)a3
{
  self->_skipManifests = a3;
}

- (OS_dispatch_queue)spotlightIndexQueue
{
  return self->_spotlightIndexQueue;
}

- (CSTopHitSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
}

- (CSSearchQuery)hasItemsQuery
{
  return self->_hasItemsQuery;
}

- (void)setHasItemsQuery:(id)a3
{
}

- (NSMutableArray)indexFromControllerLog
{
  return self->_indexFromControllerLog;
}

- (void)setIndexFromControllerLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexFromControllerLog, 0);
  objc_storeStrong((id *)&self->_hasItemsQuery, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_spotlightIndexQueue, 0);
  objc_storeStrong((id *)&self->_prefsSearchableIndex, 0);
}

void __57__PSCoreSpotlightIndexer_deleteIndexWithCompletionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1A6597000, v0, v1, "Could not completely delete index: %@", v2, v3, v4, v5, v6);
}

void __75__PSCoreSpotlightIndexer_deleteIndexWithDomainIdentifiers_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A6597000, v0, v1, "Could not delete index for domains: %@: %@");
}

void __93__PSCoreSpotlightIndexer__deleteSpecifiers_bundle_category_pathURL_withURLPrefix_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A6597000, v0, v1, "Could not delete index items with identifiers: %@\n Error: %@");
}

- (void)manifestsFromDirectory:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1A6597000, v0, v1, "error reading manifest: %{public}@ for path: %{public}@");
}

- (void)_specifiersForSpecifier:bundle:parentBundle:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1A6597000, v0, v1, "Could not load class %@", v2, v3, v4, v5, v6);
}

- (void)_specifiersForSpecifier:bundle:parentBundle:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_1A6597000, v0, v1, "Class isn't a subclass of PSListController: %@", v2, v3, v4, v5, v6);
}

@end