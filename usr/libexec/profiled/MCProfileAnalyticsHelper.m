@interface MCProfileAnalyticsHelper
+ (id)_containsPayloadsDictionary;
+ (id)_getBoolDictionaryFromKeySet:(id)a3;
+ (void)addContainsPayloadInfoWithProfile:(id)a3 eventPayload:(id)a4;
@end

@implementation MCProfileAnalyticsHelper

+ (void)addContainsPayloadInfoWithProfile:(id)a3 eventPayload:(id)a4
{
  id v5 = a3;
  id v19 = a4;
  v6 = +[MCProfileAnalyticsHelper _containsPayloadsDictionary];
  v7 = [v6 allValues];
  v8 = +[NSSet setWithArray:v7];
  v9 = +[MCProfileAnalyticsHelper _getBoolDictionaryFromKeySet:v8];

  [v9 setObject:&__kCFBooleanFalse forKeyedSubscript:@"profile_containsPayload_other"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v20 = v5;
  v10 = [v5 payloads];
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v14) type];
        v16 = [v6 objectForKeyedSubscript:v15];

        if (!v16
          || ([v9 objectForKeyedSubscript:v16],
              v17 = objc_claimAutoreleasedReturnValue(),
              v17,
              CFStringRef v18 = v16,
              !v17))
        {
          CFStringRef v18 = @"profile_containsPayload_other";
        }
        [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:v18];

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  [v19 addEntriesFromDictionary:v9];
}

+ (id)_containsPayloadsDictionary
{
  if (qword_100105A50 != -1) {
    dispatch_once(&qword_100105A50, &stru_1000EC348);
  }
  v2 = (void *)qword_100105A48;

  return v2;
}

+ (id)_getBoolDictionaryFromKeySet:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

@end