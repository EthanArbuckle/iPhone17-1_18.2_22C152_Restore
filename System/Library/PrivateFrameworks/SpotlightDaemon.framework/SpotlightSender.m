@interface SpotlightSender
+ (BOOL)enabledForClient:(int64_t)a3;
+ (BOOL)jobForAssets:(int64_t)a3;
+ (BOOL)jobForDuet:(int64_t)a3;
+ (BOOL)jobForImages:(int64_t)a3;
+ (BOOL)jobForSuggestions:(int64_t)a3;
+ (BOOL)jobForTest:(int64_t)a3;
+ (id)clientConnection:(int64_t)a3;
+ (id)clientConnection:(int64_t)a3 jobType:(int)a4;
+ (id)connectionForClient:(int64_t)a3 jobType:(int64_t)a4;
+ (id)copyDiagnosticInfo;
+ (void)addInteraction:(id)a3 intentClassName:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 client:(int64_t)a7;
+ (void)addOrUpdateSearchableItems:(id)a3 itemsContent:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 client:(int64_t)a7;
+ (void)addUserActions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 client:(int64_t)a6;
+ (void)clearCache;
+ (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4 client:(int64_t)a5;
+ (void)deleteAllSearchableItemsWithBundleID:(id)a3 client:(int64_t)a4;
+ (void)deleteAllUserActivities:(id)a3 client:(int64_t)a4;
+ (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 client:(int64_t)a6;
+ (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 client:(int64_t)a6;
+ (void)deleteSearchableItemsSinceDate:(id)a3 bundleID:(id)a4 client:(int64_t)a5;
+ (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4 client:(int64_t)a5;
+ (void)deleteSearchableItemsWithEncodedIdentifiers:(id)a3 bundleID:(id)a4 client:(int64_t)a5;
+ (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4 contentType:(id)a5 client:(int64_t)a6;
+ (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4 client:(int64_t)a5 retainedData:(id)a6;
+ (void)dispatchWithOptions:(int64_t)a3 block:(id)a4;
+ (void)donateRelevantActions:(id)a3 bundleID:(id)a4 client:(int64_t)a5;
+ (void)purgeSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4 client:(int64_t)a5;
+ (void)setup;
@end

@implementation SpotlightSender

+ (void)addInteraction:(id)a3 intentClassName:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 client:(int64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = +[SpotlightSender clientConnection:a7 jobType:128];
  [v15 addInteraction:v14 intentClassName:v13 bundleID:v12 protectionClass:v11];
}

+ (void)addOrUpdateSearchableItems:(id)a3 itemsContent:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 client:(int64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = +[SpotlightSender clientConnection:a7 jobType:1];
  [v15 indexFromBundle:v12 protectionClass:v11 items:v14 itemsContent:v13];
}

+ (void)dispatchWithOptions:(int64_t)a3 block:(id)a4
{
  uint64_t v6 = 0;
  v9 = (void (**)(id, uint64_t))a4;
  do
  {
    uint64_t v7 = sAllReceiverClientIDs[v6];
    switch(v7)
    {
      case 0:
        if ([a1 jobForTest:a3]) {
          goto LABEL_12;
        }
        break;
      case 1:
        if ([a1 jobForDuet:a3]) {
          goto LABEL_12;
        }
        break;
      case 2:
        if ([a1 jobForSuggestions:a3]) {
          goto LABEL_12;
        }
        break;
      case 3:
        if ([a1 jobForImages:a3]) {
          goto LABEL_12;
        }
        break;
      case 4:
        if ([a1 jobForAssets:a3])
        {
LABEL_12:
          v8 = +[SpotlightSender clientConnection:v7];

          if (v8) {
            v9[2](v9, v7);
          }
        }
        break;
      default:
        break;
    }
    ++v6;
  }
  while (v6 != 5);
}

+ (id)clientConnection:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    id v4 = 0;
  }
  else {
    id v4 = (id)*off_264506658[a3];
  }
  if (([v4 disabled] & 1) != 0
    || [(id)sSpotlightSenderState clientDisabled:a3])
  {

    id v4 = 0;
  }
  return v4;
}

+ (id)clientConnection:(int64_t)a3 jobType:(int)a4
{
  if ((unint64_t)a3 > 4) {
    id v5 = 0;
  }
  else {
    id v5 = (id)*off_264506658[a3];
  }
  if (![v5 canRun]
    || [(id)sSpotlightSenderState clientDisabled:a3])
  {

    id v5 = 0;
  }
  return v5;
}

+ (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4 client:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[SpotlightSender clientConnection:a5 jobType:4];
  [v9 deleteFromBundle:v7 domainIdentifiers:v8];
}

+ (BOOL)jobForTest:(int64_t)a3
{
  return (a3 & 0x24F) == 0 || (a3 & 8) != 0;
}

+ (BOOL)jobForSuggestions:(int64_t)a3
{
  return (a3 & 0x24F) == 0 || (a3 & 2) != 0;
}

+ (BOOL)jobForImages:(int64_t)a3
{
  return (a3 & 0x24F) == 0 || (a3 & 0x40) != 0;
}

+ (BOOL)jobForDuet:(int64_t)a3
{
  return ((a3 & 0x24F) == 0) | a3 & 1;
}

+ (BOOL)jobForAssets:(int64_t)a3
{
  return (a3 & 0x24F) == 0 || (a3 & 0x200) != 0;
}

+ (id)copyDiagnosticInfo
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v13 = objc_opt_new();
  v2 = NSHomeDirectory();
  if ([v2 length])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v19[0] = @"com.apple.corespotlight.receiver.coreduet";
    v19[1] = @"com.apple.corespotlight.receiver.suggestions";
    v19[2] = @"com.apple.corespotlight.receiver.photos";
    v19[3] = @"com.apple.corespotlight.receiver.images";
    v19[4] = @"com.apple.corespotlight.receiver.corespotlight";
    id obj = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:5];
    uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v16;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * v6);
          id v8 = objc_alloc(NSURL);
          id v9 = [NSString stringWithFormat:@"%@/%s/%@.plist", v2, "Library/Spotlight/CoreSpotlight", v7];
          v10 = (void *)[v8 initFileURLWithPath:v9];

          if (v10)
          {
            id v11 = [NSDictionary dictionaryWithContentsOfURL:v10 error:0];
            if ([v11 count]) {
              [v13 setObject:v11 forKeyedSubscript:v7];
            }
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v4);
    }
  }
  return v13;
}

+ (void)clearCache
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = NSHomeDirectory();
  if ([v2 length])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v22[0] = @"com.apple.corespotlight.receiver.coreduet";
    v22[1] = @"com.apple.corespotlight.receiver.suggestions";
    v22[2] = @"com.apple.corespotlight.receiver.photos";
    v22[3] = @"com.apple.corespotlight.receiver.images";
    v22[4] = @"com.apple.corespotlight.receiver.corespotlight";
    id obj = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:5];
    uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v17 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = [NSString stringWithFormat:@"%@/%s/%@.plist", v2, "Library/Spotlight/CoreSpotlight", *(void *)(*((void *)&v16 + 1) + 8 * i)];
          unsigned __int8 v15 = 0;
          id v8 = [MEMORY[0x263F08850] defaultManager];
          int v9 = [v8 fileExistsAtPath:v7 isDirectory:&v15];
          int v10 = v15;

          if (v9) {
            BOOL v11 = v10 == 0;
          }
          else {
            BOOL v11 = 0;
          }
          if (v11)
          {
            id v12 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v21 = v7;
              _os_log_impl(&dword_21F1CE000, v12, OS_LOG_TYPE_DEFAULT, "Removing cache file  %@", buf, 0xCu);
            }

            id v13 = [MEMORY[0x263F08850] defaultManager];
            [v13 removeItemAtPath:v7 error:0];
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v23 count:16];
      }
      while (v4);
    }
  }
}

+ (void)setup
{
}

+ (BOOL)enabledForClient:(int64_t)a3
{
  uint64_t v3 = +[SpotlightSender clientConnection:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (void)deleteSearchableItemsWithEncodedIdentifiers:(id)a3 bundleID:(id)a4 client:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[SpotlightSender clientConnection:a5 jobType:2];
  [v9 deleteFromBundle:v7 encodedIdentifiers:v8];
}

+ (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4 contentType:(id)a5 client:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[SpotlightSender clientConnection:a6 jobType:2];
  [v12 deleteFromBundle:v10 contentType:v9 identifiers:v11];
}

+ (void)deleteAllSearchableItemsWithBundleID:(id)a3 client:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[SpotlightSender clientConnection:a4 jobType:8];
  [v6 deleteFromBundle:v5];
}

+ (void)deleteSearchableItemsSinceDate:(id)a3 bundleID:(id)a4 client:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[SpotlightSender clientConnection:a5 jobType:16];
  [v9 deleteFromBundle:v7 sinceDate:v8];
}

+ (void)purgeSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4 client:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[SpotlightSender clientConnection:a5 jobType:32];
  [v9 purgeFromBundle:v7 identifiers:v8];
}

+ (void)addUserActions:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 client:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[SpotlightSender clientConnection:a6 jobType:64];
  [v12 addUserActions:v11 bundleID:v10 protectionClass:v9];
}

+ (void)deleteAllUserActivities:(id)a3 client:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[SpotlightSender clientConnection:a4 jobType:4096];
  [v6 deleteAllUserActivities:v5];
}

+ (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4 client:(int64_t)a5 retainedData:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[SpotlightSender clientConnection:a5 jobType:0x2000];
  [v12 deleteUserActivitiesWithPersistentIdentifiers:v11 bundleID:v10 retainedData:v9];
}

+ (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 client:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[SpotlightSender clientConnection:a6 jobType:256];
  [v12 deleteInteractionsWithIdentifiers:v11 bundleID:v10 protectionClass:v9];
}

+ (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 client:(int64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[SpotlightSender clientConnection:a6 jobType:512];
  [v12 deleteInteractionsWithGroupIdentifiers:v11 bundleID:v10 protectionClass:v9];
}

+ (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4 client:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[SpotlightSender clientConnection:a5 jobType:1024];
  [v9 deleteAllInteractionsWithBundleID:v8 protectionClass:v7];
}

+ (void)donateRelevantActions:(id)a3 bundleID:(id)a4 client:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[SpotlightSender clientConnection:a5 jobType:18432];
  [v9 donateRelevantActions:v8 bundleID:v7];
}

+ (id)connectionForClient:(int64_t)a3 jobType:(int64_t)a4
{
  id v5 = +[SpotlightSender clientConnection:a3];
  id v6 = v5;
  if (a4
    && v5
    && ((unint64_t)a4 > 0xF
     || ((1 << a4) & 0xC1CE) == 0
     || ![v5 canRun]
     || ([v6 supportedJobs] & 0x8000) == 0))
  {

    id v6 = 0;
  }
  return v6;
}

@end