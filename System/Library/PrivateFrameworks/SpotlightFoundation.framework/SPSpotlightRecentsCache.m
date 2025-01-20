@interface SPSpotlightRecentsCache
+ (BOOL)topic:(id)a3 isSameAsTopic:(id)a4;
+ (id)filteredTopics:(id)a3;
+ (id)recentResults;
+ (id)recentResultsWithOptions:(id)a3;
+ (id)recentResultsWithOptions:(id)a3 rankAndDeduplicate:(id)a4;
+ (id)resultFromTopic:(id)a3;
+ (void)cacheContact:(id)a3 contactIdentifier:(id)a4 score:(id)a5 searchString:(id)a6;
+ (void)cacheLocalResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 searchString:(id)a7;
+ (void)cachePerson:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5 searchString:(id)a6;
+ (void)cacheResult:(id)a3 title:(id)a4 searchString:(id)a5;
+ (void)cacheSuggestion:(id)a3 type:(int)a4 score:(id)a5 searchString:(id)a6;
+ (void)deleteAllRecentResults;
+ (void)deleteContact:(id)a3 contactIdentifier:(id)a4 score:(id)a5;
+ (void)deleteLocalResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6;
+ (void)deletePerson:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5;
+ (void)deleteResult:(id)a3 title:(id)a4;
+ (void)deleteSuggestion:(id)a3 type:(int)a4 score:(id)a5;
+ (void)enumerateRecentCompletionsWithSearchString:(id)a3 usingBlock:(id)a4;
+ (void)enumerateRecentResultsUsingBlock:(id)a3;
+ (void)updateApplicationContexts:(id)a3;
@end

@implementation SPSpotlightRecentsCache

+ (id)recentResultsWithOptions:(id)a3
{
  id v3 = a3;
  v4 = +[SPCacheManager defaultManager];
  v5 = [v4 recentResultsWithOptions:v3 rankAndDeduplicate:0];

  return v5;
}

+ (void)updateApplicationContexts:(id)a3
{
  id v3 = a3;
  id v4 = +[SPCacheManager defaultManager];
  [v4 updateRecentsWithBundleIdentifiers:v3];
}

+ (id)recentResults
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"SPSpotlightRecentsCacheOptionMaxCountKey";
  v6[0] = &unk_1F0CB31D8;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v3 = +[SPSpotlightRecentsCache recentResultsWithOptions:v2];

  return v3;
}

+ (id)recentResultsWithOptions:(id)a3 rankAndDeduplicate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[SPCacheManager defaultManager];
  v8 = [v7 recentResultsWithOptions:v6 rankAndDeduplicate:v5];

  return v8;
}

+ (void)enumerateRecentResultsUsingBlock:(id)a3
{
  id v3 = a3;
  id v4 = +[SPCacheManager defaultManager];
  [v4 enumerateRecentResultsUsingBlock:v3];
}

+ (void)enumerateRecentCompletionsWithSearchString:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[SPCacheManager defaultManager];
  [v7 enumerateRecentCompletionsWithSearchString:v6 usingBlock:v5];
}

+ (void)cacheResult:(id)a3 title:(id)a4 searchString:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[SPCacheManager defaultManager];
  [v10 cacheResult:v9 title:v8 searchString:v7];
}

+ (void)cacheLocalResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 searchString:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[SPCacheManager defaultManager];
  [v16 cacheLocalResult:v15 identifier:v14 bundleIdentifier:v13 protectionClass:v12 searchString:v11];
}

+ (void)cachePerson:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5 searchString:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[SPCacheManager defaultManager];
  [v13 cachePerson:v12 personQueryIdentifier:v11 score:v10 searchString:v9];
}

+ (void)cacheContact:(id)a3 contactIdentifier:(id)a4 score:(id)a5 searchString:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[SPCacheManager defaultManager];
  [v13 cacheContact:v12 contactIdentifier:v11 score:v10 searchString:v9];
}

+ (void)cacheSuggestion:(id)a3 type:(int)a4 score:(id)a5 searchString:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = +[SPCacheManager defaultManager];
  [v12 cacheSuggestion:v11 type:v7 score:v10 searchString:v9];
}

+ (void)deleteResult:(id)a3 title:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[SPCacheManager defaultManager];
  [v7 deleteResult:v6 title:v5];
}

+ (void)deleteLocalResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[SPCacheManager defaultManager];
  [v13 deleteLocalResult:v12 identifier:v11 bundleIdentifier:v10 protectionClass:v9];
}

+ (void)deletePerson:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[SPCacheManager defaultManager];
  [v10 deletePerson:v9 personQueryIdentifier:v8 score:v7];
}

+ (void)deleteContact:(id)a3 contactIdentifier:(id)a4 score:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[SPCacheManager defaultManager];
  [v10 deleteContact:v9 contactIdentifier:v8 score:v7];
}

+ (void)deleteSuggestion:(id)a3 type:(int)a4 score:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[SPCacheManager defaultManager];
  [v9 deleteSuggestion:v8 type:v5 score:v7];
}

+ (void)deleteAllRecentResults
{
  id v2 = +[SPCacheManager defaultManager];
  [v2 deleteAllResults];
}

+ (BOOL)topic:(id)a3 isSameAsTopic:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_14;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  LOBYTE(v8) = 0;
  if (!v6 || (isKindOfClass & 1) == 0) {
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_14:
    LOBYTE(v8) = 0;
    goto LABEL_17;
  }
  id v9 = [v5 identifier];
  id v10 = attributesForTopicIdentifier(v9, 0);

  id v11 = [v6 identifier];
  id v12 = attributesForTopicIdentifier(v11, 0);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v13 = v12;
  uint64_t v8 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v14 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v13);
        }
        if (objc_msgSend(v10, "containsObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17))
        {
          LOBYTE(v8) = 1;
          goto LABEL_16;
        }
      }
      uint64_t v8 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_16:

LABEL_17:
  return v8;
}

+ (id)filteredTopics:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      uint64_t v22 = v6;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v29 = 0;
          id v10 = [v9 identifier];
          id v11 = attributesForTopicIdentifier(v10, &v29);

          if (v29)
          {
            uint64_t v12 = v7;
            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            id v13 = v11;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v34 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v26;
              while (2)
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v26 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  if ([v4 containsObject:*(void *)(*((void *)&v25 + 1) + 8 * i)])
                  {

                    uint64_t v7 = v12;
                    uint64_t v6 = v22;
                    goto LABEL_22;
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v34 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
            }

            uint64_t v7 = v12;
            uint64_t v6 = v22;
          }
          [v24 addObject:v9];
          if (!v29) {
            [v4 addObjectsFromArray:v11];
          }
LABEL_22:
        }
        else
        {
          long long v18 = [v9 identifier];
          char v19 = [v4 containsObject:v18];

          if ((v19 & 1) == 0)
          {
            [v24 addObject:v9];
            long long v20 = [v9 identifier];
            [v4 addObject:v20];
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  return v24;
}

+ (id)resultFromTopic:(id)a3
{
  if (a3)
  {
    id v3 = [a3 identifier];
    id v4 = searchResultWithTopicIdentifier(v3, 1.0);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

@end