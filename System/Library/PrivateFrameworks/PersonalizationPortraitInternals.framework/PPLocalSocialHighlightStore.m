@interface PPLocalSocialHighlightStore
+ (id)defaultStore;
- (BOOL)feedbackForAttribution:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 error:(id *)a7;
- (BOOL)feedbackForHighlight:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 error:(id *)a7;
- (PPLocalSocialHighlightStore)init;
- (PPLocalSocialHighlightStore)initWithStorage:(id)a3;
- (id)attributionForIdentifier:(id)a3 error:(id *)a4;
- (id)consumeMessagesContentWithContext:(id)a3;
- (id)consumeSafariContentWithContext:(id)a3;
- (id)consumerName;
- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3;
- (id)rankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 applicationIdentifiers:(id)a6 error:(id *)a7;
- (id)rankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 applicationIdentifiers:(id)a6 error:(id *)a7;
@end

@implementation PPLocalSocialHighlightStore

- (id)rankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 applicationIdentifiers:(id)a6 error:(id *)a7
{
  return [(PPSocialHighlightStorage *)self->_storage rankedHighlightsWithLimit:a3 client:a4 variant:a5 applicationIdentifiers:a6 error:a7];
}

+ (id)defaultStore
{
  if (defaultStore__pasOnceToken2_18252 != -1) {
    dispatch_once(&defaultStore__pasOnceToken2_18252, &__block_literal_global_18253);
  }
  v2 = (void *)defaultStore__pasExprOnceResult_18254;
  return v2;
}

- (void).cxx_destruct
{
}

- (id)consumeMessagesContentWithContext:(id)a3
{
  return (id)[MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];
}

- (id)consumeSafariContentWithContext:(id)a3
{
  return (id)[MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)*MEMORY[0x1E4F8A0E8];
  v6 = [v4 bundleIdentifier];
  LODWORD(v5) = [v5 isEqual:v6];

  if (v5)
  {
    uint64_t v7 = *MEMORY[0x1E4F8A090];
    v26[0] = *MEMORY[0x1E4F8A078];
    v26[1] = v7;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          storage = self->_storage;
          id v15 = objc_alloc(MEMORY[0x1E4F937A0]);
          v16 = objc_msgSend(v15, "initWithBundleIdentifier:", v13, (void)v21);
          [(PPSocialHighlightStorage *)storage deleteDataDerivedFromContentMatchingRequest:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v17 = (void *)*MEMORY[0x1E4F8A0A8];
    v18 = [v4 bundleIdentifier];
    LODWORD(v17) = [v17 isEqual:v18];

    if (v17) {
      [(PPSocialHighlightStorage *)self->_storage deleteDataDerivedFromContentMatchingRequest:v4];
    }
  }
  v19 = objc_msgSend(MEMORY[0x1E4F93758], "successWithNumberOfExtractions:", 0, (void)v21);

  return v19;
}

- (id)consumerName
{
  return @"com.apple.proactive.PersonalizationPortrait.SocialHighlightStore";
}

- (BOOL)feedbackForAttribution:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 error:(id *)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v16 = 138413058;
    id v17 = v11;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_INFO, "PPLocalSocialHighlightStore: feedbackForAttribution: %@ type: %lu client: '%@' variant: '%@'", (uint8_t *)&v16, 0x2Au);
  }

  +[PPSocialHighlightMetrics logFeedbackForAttribution:v11 type:a4 client:v12];
  [(PPSocialHighlightStorage *)self->_storage saveAttributionFeedbackForAttributionIdentifier:v11 feedbackType:a4 client:v12 variant:v13];

  return 1;
}

- (BOOL)feedbackForHighlight:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 error:(id *)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = pp_social_highlights_log_handle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v16 = 138413058;
    id v17 = v11;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_INFO, "PPLocalSocialHighlightStore: feedbackForHighlight: %@ type: %lu client: '%@' variant: '%@'", (uint8_t *)&v16, 0x2Au);
  }

  +[PPSocialHighlightMetrics logFeedbackForHighlight:v11 type:a4 client:v12];
  [(PPSocialHighlightStorage *)self->_storage saveFeedbackForHighlightIdentifier:v11 feedbackType:a4 client:v12 variant:v13];

  return 1;
}

- (id)attributionForIdentifier:(id)a3 error:(id *)a4
{
  return [(PPSocialHighlightStorage *)self->_storage attributionForIdentifier:a3 error:a4];
}

- (id)rankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 applicationIdentifiers:(id)a6 error:(id *)a7
{
  return [(PPSocialHighlightStorage *)self->_storage rankedHighlightsForSyncedItems:a3 client:a4 variant:a5 applicationIdentifiers:a6 error:a7];
}

- (PPLocalSocialHighlightStore)init
{
  v3 = objc_opt_new();
  if (v3)
  {
    self = [(PPLocalSocialHighlightStore *)self initWithStorage:v3];
    id v4 = self;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (PPLocalSocialHighlightStore)initWithStorage:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPLocalSocialHighlightStore;
  v6 = [(PPLocalSocialHighlightStore *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F93750] defaultCoordinator];
    [v7 registerMessagesConsumer:v6 levelOfService:1];

    id v8 = [MEMORY[0x1E4F93750] defaultCoordinator];
    [v8 registerSafariConsumer:v6 levelOfService:1];

    objc_storeStrong((id *)&v6->_storage, a3);
  }

  return v6;
}

void __43__PPLocalSocialHighlightStore_defaultStore__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult_18254;
  defaultStore__pasExprOnceResult_18254 = v1;
}

@end