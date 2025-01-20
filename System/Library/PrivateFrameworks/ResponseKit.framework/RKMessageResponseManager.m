@interface RKMessageResponseManager
+ (BOOL)_isMirroredResponseValidForResponse:(id)a3;
+ (BOOL)_needsMirroredAnalysisForMessage:(id)a3 forChronologicalConversationHistory:(id)a4;
+ (BOOL)_responseLooksLikeIncomingCheckInResponse:(id)a3;
+ (BOOL)_responseLooksLikeOutgoingCheckInResponse:(id)a3;
+ (BOOL)_responseTypeIsSunsetted:(id)a3;
+ (id)_chronologicalConversationHistory:(id)a3;
+ (id)_mostRecentTextFromChronologicalConversationHistory:(id)a3;
+ (id)sharedManager;
- (BOOL)isQuestion:(id)a3 withLanguage:(id)a4;
- (BOOL)usePersonalizedRanking;
- (NSArray)preferredLanguages;
- (RKMessageResponseManager)init;
- (RKMessageResponseManager)initWithAssetPlistURL:(id)a3;
- (RKMessageResponseManager)initWithDynamicDataURL:(id)a3;
- (RKMessageResponseManager)initWithDynamicDataURL:(id)a3 displayStringsProvider:(id)a4;
- (RKMessageResponseManager)initWithDynamicDataURL:(id)a3 withBundleURL:(id)a4;
- (RKRankLearner)rankLearner;
- (RKResponseCollection)collection;
- (id)categoryForMessage:(id)a3 langID:(id)a4;
- (id)categoryForMessageWithoutQueue:(id)a3 langID:(id)a4;
- (id)dispatchQueue;
- (id)getRankLearner;
- (id)responseWithAttributesMatchingProactiveGrammarForMessage:(id)a3 languageID:(id)a4 kbdInputModes:(id)a5;
- (id)responseWithAttributesMatchingProactiveGrammarForMessageImp:(id)a3 languageID:(id *)a4 kbdInputModes:(id)a5;
- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forContext:(id)a5 withLanguage:(id)a6 options:(unint64_t)a7;
- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 withLanguage:(id)a6 inputModes:(id)a7 options:(unint64_t)a8;
- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 withLanguage:(id)a6 options:(unint64_t)a7;
- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 recipientID:(id)a5 forConversationHistory:(id)a6 withLanguage:(id)a7 options:(unint64_t)a8;
- (id)responsesForMessageImp:(id)a3 maximumResponses:(unint64_t)a4 forRecipientID:(id)a5 forConversationHistory:(id)a6 forContext:(id)a7 withLanguage:(id)a8 options:(unint64_t)a9;
- (id)responsesForMessageWithLanguageDetection:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 withLanguage:(id *)a7 options:(unint64_t)a8;
- (id)responsesForMessageWithLanguageDetectionImp:(id)a3 maximumResponses:(unint64_t)a4 forRecipientID:(id)a5 forConversationHistory:(id)a6 forContext:(id)a7 withLanguage:(id *)a8 inputModes:(id)a9 options:(unint64_t)a10;
- (void)flushDynamicData;
- (void)prunePersonalizedUserDatabase:(id)a3;
- (void)registerResponse:(id)a3 forMessage:(id)a4 forContext:(id)a5 withEffectiveDate:(id)a6 withLanguage:(id)a7;
- (void)registerResponse:(id)a3 forMessage:(id)a4 forContext:(id)a5 withLanguage:(id)a6;
- (void)registerResponse:(id)a3 forMessage:(id)a4 metadata:(id)a5 withLanguage:(id)a6;
- (void)resetRegisteredResponses;
- (void)responseWithAttributesMatchingProactiveGrammarForMessage:(id)a3 languageID:(id)a4 kbdInputModes:(id)a5 completionBlock:(id)a6;
- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forContext:(id)a5 withLanguage:(id)a6 options:(unint64_t)a7 completionBlock:(id)a8;
- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 withLanguage:(id)a6 options:(unint64_t)a7 completionBlock:(id)a8;
- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 recipientID:(id)a5 forConversationHistory:(id)a6 withLanguage:(id)a7 options:(unint64_t)a8 completionBlock:(id)a9;
- (void)responsesForMessageWithLanguageDetection:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 withLanguage:(id *)a7 options:(unint64_t)a8 completionBlock:(id)a9;
- (void)setCollection:(id)a3;
- (void)setPreferredLanguages:(id)a3;
- (void)setRankLearner:(id)a3;
@end

@implementation RKMessageResponseManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__RKMessageResponseManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_singleton;

  return v2;
}

uint64_t __41__RKMessageResponseManager_sharedManager__block_invoke()
{
  sharedManager_singleton = [objc_alloc((Class)objc_opt_class()) initWithDynamicDataURL:0];

  return MEMORY[0x270F9A758]();
}

- (id)dispatchQueue
{
  if (dispatchQueue_onceToken != -1) {
    dispatch_once(&dispatchQueue_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)dispatchQueue_queue;

  return v2;
}

void __41__RKMessageResponseManager_dispatchQueue__block_invoke()
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.ResponseKit", v0);
  v2 = (void *)dispatchQueue_queue;
  dispatchQueue_queue = (uint64_t)v1;
}

- (RKMessageResponseManager)init
{
  return self;
}

- (RKMessageResponseManager)initWithDynamicDataURL:(id)a3
{
  id v4 = a3;
  v5 = [RKBundleDataProvider alloc];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [(RKBundleDataProvider *)v5 initWithBundle:v6];
  v8 = [(RKMessageResponseManager *)self initWithDynamicDataURL:v4 displayStringsProvider:v7];

  return v8;
}

- (RKMessageResponseManager)initWithDynamicDataURL:(id)a3 withBundleURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [RKBundleDataProvider alloc];
  v9 = [MEMORY[0x263F086E0] bundleWithURL:v6];

  v10 = [(RKBundleDataProvider *)v8 initWithBundle:v9];
  v11 = [(RKMessageResponseManager *)self initWithDynamicDataURL:v7 displayStringsProvider:v10];

  return v11;
}

- (RKMessageResponseManager)initWithAssetPlistURL:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RKMessageResponseManager;
  v5 = [(RKMessageResponseManager *)&v24 init];
  uint64_t v6 = [(RKMessageResponseManager *)v5 dispatchQueue];
  dispatchQueue = v5->_dispatchQueue;
  v5->_dispatchQueue = (OS_dispatch_queue *)v6;

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v9 = objc_msgSend(MEMORY[0x263EFF960], "preferredLanguages", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:*(void *)(*((void *)&v20 + 1) + 8 * v13)];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v11);
  }

  [(RKMessageResponseManager *)v5 setPreferredLanguages:v8];
  if (v5)
  {
    v15 = [RKResponseCollection alloc];
    v16 = [[RKBundleDataProvider alloc] initWithAssetPlist:v4];
    uint64_t v17 = [(RKResponseCollection *)v15 initWithDynamicDataURL:0 displayStringsProvider:v16];
    collection = v5->_collection;
    v5->_collection = (RKResponseCollection *)v17;
  }
  return v5;
}

- (RKMessageResponseManager)initWithDynamicDataURL:(id)a3 displayStringsProvider:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v23.receiver = self;
  v23.super_class = (Class)RKMessageResponseManager;
  uint64_t v6 = [(RKMessageResponseManager *)&v23 init];
  uint64_t v7 = [(RKMessageResponseManager *)v6 dispatchQueue];
  dispatchQueue = v6->_dispatchQueue;
  v6->_dispatchQueue = (OS_dispatch_queue *)v7;

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF960], "preferredLanguages", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:*(void *)(*((void *)&v19 + 1) + 8 * v14)];
        if (v15) {
          [v9 addObject:v15];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v12);
  }

  [(RKMessageResponseManager *)v6 setPreferredLanguages:v9];
  if (v6)
  {
    v16 = [[RKResponseCollection alloc] initWithDynamicDataURL:0 displayStringsProvider:v5];
    collection = v6->_collection;
    v6->_collection = v16;
  }
  return v6;
}

- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forContext:(id)a5 withLanguage:(id)a6 options:(unint64_t)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__2;
  v31[4] = __Block_byref_object_dispose__2;
  id v32 = 0;
  dispatchQueue = self->_dispatchQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __113__RKMessageResponseManager_responsesForMessage_maximumResponses_forContext_withLanguage_options_completionBlock___block_invoke;
  v23[3] = &unk_2642D27C0;
  v23[4] = self;
  id v24 = v14;
  id v25 = v15;
  id v26 = v16;
  unint64_t v29 = a4;
  unint64_t v30 = a7;
  id v27 = v17;
  v28 = v31;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_async(dispatchQueue, v23);

  _Block_object_dispose(v31, 8);
}

void __113__RKMessageResponseManager_responsesForMessage_maximumResponses_forContext_withLanguage_options_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) responsesForMessageImp:*(void *)(a1 + 40) maximumResponses:*(void *)(a1 + 80) forRecipientID:0 forConversationHistory:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forContext:*(void *)(a1 + 48) withLanguage:*(void *)(a1 + 56) options:RKMessageResponseDontOverrideLanguageID | *(void *)(a1 + 88)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 withLanguage:(id)a6 options:(unint64_t)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __125__RKMessageResponseManager_responsesForMessage_maximumResponses_forConversationHistory_withLanguage_options_completionBlock___block_invoke;
  block[3] = &unk_2642D27E8;
  block[4] = self;
  id v24 = v14;
  id v25 = v15;
  id v26 = v16;
  unint64_t v28 = a4;
  unint64_t v29 = a7;
  id v27 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_async(dispatchQueue, block);
}

void __125__RKMessageResponseManager_responsesForMessage_maximumResponses_forConversationHistory_withLanguage_options_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) responsesForMessageImp:*(void *)(a1 + 40) maximumResponses:*(void *)(a1 + 72) forRecipientID:0 forConversationHistory:*(void *)(a1 + 48) forContext:0 withLanguage:*(void *)(a1 + 56) options:RKMessageResponseDontOverrideLanguageID | *(void *)(a1 + 80)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 recipientID:(id)a5 forConversationHistory:(id)a6 withLanguage:(id)a7 options:(unint64_t)a8 completionBlock:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  dispatchQueue = self->_dispatchQueue;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __137__RKMessageResponseManager_responsesForMessage_maximumResponses_recipientID_forConversationHistory_withLanguage_options_completionBlock___block_invoke;
  v26[3] = &unk_2642D2810;
  v26[4] = self;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  unint64_t v32 = a4;
  unint64_t v33 = a8;
  id v30 = v18;
  id v31 = v19;
  id v21 = v19;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  dispatch_async(dispatchQueue, v26);
}

void __137__RKMessageResponseManager_responsesForMessage_maximumResponses_recipientID_forConversationHistory_withLanguage_options_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) responsesForMessageImp:*(void *)(a1 + 40) maximumResponses:*(void *)(a1 + 80) forRecipientID:*(void *)(a1 + 48) forConversationHistory:*(void *)(a1 + 56) forContext:0 withLanguage:*(void *)(a1 + 64) options:RKMessageResponseDontOverrideLanguageID | *(void *)(a1 + 88)];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 recipientID:(id)a5 forConversationHistory:(id)a6 withLanguage:(id)a7 options:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__2;
  v37 = __Block_byref_object_dispose__2;
  id v38 = 0;
  dispatchQueue = self->_dispatchQueue;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __121__RKMessageResponseManager_responsesForMessage_maximumResponses_recipientID_forConversationHistory_withLanguage_options___block_invoke;
  v25[3] = &unk_2642D2838;
  v25[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v30 = &v33;
  unint64_t v31 = a4;
  unint64_t v32 = a8;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_sync(dispatchQueue, v25);
  id v23 = (id)v34[5];

  _Block_object_dispose(&v33, 8);

  return v23;
}

uint64_t __121__RKMessageResponseManager_responsesForMessage_maximumResponses_recipientID_forConversationHistory_withLanguage_options___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [*(id *)(a1 + 32) responsesForMessageImp:*(void *)(a1 + 40) maximumResponses:*(void *)(a1 + 80) forRecipientID:*(void *)(a1 + 48) forConversationHistory:*(void *)(a1 + 56) forContext:0 withLanguage:*(void *)(a1 + 64) options:RKMessageResponseDontOverrideLanguageID | *(void *)(a1 + 88)];

  return MEMORY[0x270F9A758]();
}

- (void)responsesForMessageWithLanguageDetection:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 withLanguage:(id *)a7 options:(unint64_t)a8 completionBlock:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__2;
  v32[4] = __Block_byref_object_dispose__2;
  id v33 = *a7;
  dispatchQueue = self->_dispatchQueue;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __157__RKMessageResponseManager_responsesForMessageWithLanguageDetection_maximumResponses_forConversationHistory_forContext_withLanguage_options_completionBlock___block_invoke;
  v24[3] = &unk_2642D2860;
  v24[4] = self;
  id v25 = v15;
  id v26 = v16;
  id v27 = v17;
  unint64_t v30 = a4;
  unint64_t v31 = a8;
  id v28 = v18;
  id v29 = v32;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  dispatch_async(dispatchQueue, v24);

  _Block_object_dispose(v32, 8);
}

void __157__RKMessageResponseManager_responsesForMessageWithLanguageDetection_maximumResponses_forConversationHistory_forContext_withLanguage_options_completionBlock___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[10];
  uint64_t v7 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v2 responsesForMessageWithLanguageDetectionImp:v3 maximumResponses:v6 forRecipientID:0 forConversationHistory:v4 forContext:v5 withLanguage:&obj inputModes:0 options:a1[11]];
  objc_storeStrong((id *)(v7 + 40), obj);
  (*(void (**)(void))(a1[8] + 16))();
}

- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forContext:(id)a5 withLanguage:(id)a6 options:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__2;
  v37 = __Block_byref_object_dispose__2;
  id v38 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__2;
  v31[4] = __Block_byref_object_dispose__2;
  id v32 = v14;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__2;
  v29[4] = __Block_byref_object_dispose__2;
  id v30 = 0;
  dispatchQueue = self->_dispatchQueue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __97__RKMessageResponseManager_responsesForMessage_maximumResponses_forContext_withLanguage_options___block_invoke;
  v21[3] = &unk_2642D2888;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = &v33;
  id v25 = v29;
  id v26 = v31;
  unint64_t v27 = a4;
  unint64_t v28 = a7;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  dispatch_sync(dispatchQueue, v21);
  id v19 = (id)v34[5];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(&v33, 8);

  return v19;
}

void __97__RKMessageResponseManager_responsesForMessage_maximumResponses_forContext_withLanguage_options___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(*(void *)(a1[8] + 8) + 40);
  uint64_t v6 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v2 responsesForMessageWithLanguageDetectionImp:v3 maximumResponses:a1[10] forRecipientID:0 forConversationHistory:v5 forContext:v4 withLanguage:&obj inputModes:0 options:RKMessageResponseDontOverrideLanguageID | a1[11]];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(a1[7] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 withLanguage:(id)a6 options:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v30 = 0;
  unint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  id v35 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__2;
  v28[4] = __Block_byref_object_dispose__2;
  id v29 = v14;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __109__RKMessageResponseManager_responsesForMessage_maximumResponses_forConversationHistory_withLanguage_options___block_invoke;
  block[3] = &unk_2642D28B0;
  block[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = &v30;
  id v25 = v28;
  unint64_t v26 = a4;
  unint64_t v27 = a7;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  dispatch_sync(dispatchQueue, block);
  id v19 = (id)v31[5];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  return v19;
}

void __109__RKMessageResponseManager_responsesForMessage_maximumResponses_forConversationHistory_withLanguage_options___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v2 responsesForMessageWithLanguageDetectionImp:v3 maximumResponses:v5 forRecipientID:0 forConversationHistory:v4 forContext:0 withLanguage:&obj inputModes:0 options:RKMessageResponseDontOverrideLanguageID | a1[10]];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(a1[7] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)responsesForMessage:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 withLanguage:(id)a6 inputModes:(id)a7 options:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  id v40 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__2;
  v33[4] = __Block_byref_object_dispose__2;
  id v34 = v16;
  dispatchQueue = self->_dispatchQueue;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __120__RKMessageResponseManager_responsesForMessage_maximumResponses_forConversationHistory_withLanguage_inputModes_options___block_invoke;
  v25[3] = &unk_2642D28D8;
  v25[4] = self;
  id v26 = v14;
  id v29 = &v35;
  uint64_t v30 = v33;
  id v27 = v15;
  id v28 = v17;
  unint64_t v31 = a4;
  unint64_t v32 = a8;
  id v19 = v17;
  id v20 = v15;
  id v21 = v14;
  id v22 = v16;
  dispatch_sync(dispatchQueue, v25);
  id v23 = (id)v36[5];

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);

  return v23;
}

void __120__RKMessageResponseManager_responsesForMessage_maximumResponses_forConversationHistory_withLanguage_inputModes_options___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[10];
  uint64_t v6 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v2 responsesForMessageWithLanguageDetectionImp:v3 maximumResponses:v5 forRecipientID:0 forConversationHistory:v4 forContext:0 withLanguage:&obj inputModes:a1[7] options:RKMessageResponseDontOverrideLanguageID | a1[11]];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(a1[8] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)responsesForMessageWithLanguageDetection:(id)a3 maximumResponses:(unint64_t)a4 forConversationHistory:(id)a5 forContext:(id)a6 withLanguage:(id *)a7 options:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  uint64_t v31 = 0;
  unint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__2;
  uint64_t v35 = __Block_byref_object_dispose__2;
  id v36 = 0;
  dispatchQueue = self->_dispatchQueue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __141__RKMessageResponseManager_responsesForMessageWithLanguageDetection_maximumResponses_forConversationHistory_forContext_withLanguage_options___block_invoke;
  v23[3] = &unk_2642D2900;
  v23[4] = self;
  id v24 = v14;
  id v27 = &v31;
  unint64_t v28 = a4;
  id v25 = v15;
  id v26 = v16;
  id v29 = a7;
  unint64_t v30 = a8;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  dispatch_sync(dispatchQueue, v23);
  id v21 = (id)v32[5];

  _Block_object_dispose(&v31, 8);

  return v21;
}

uint64_t __141__RKMessageResponseManager_responsesForMessageWithLanguageDetection_maximumResponses_forConversationHistory_forContext_withLanguage_options___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(a1 + 32) responsesForMessageWithLanguageDetectionImp:*(void *)(a1 + 40) maximumResponses:*(void *)(a1 + 72) forRecipientID:0 forConversationHistory:*(void *)(a1 + 48) forContext:*(void *)(a1 + 56) withLanguage:*(void *)(a1 + 80) inputModes:0 options:*(void *)(a1 + 88)];

  return MEMORY[0x270F9A758]();
}

- (id)responsesForMessageImp:(id)a3 maximumResponses:(unint64_t)a4 forRecipientID:(id)a5 forConversationHistory:(id)a6 forContext:(id)a7 withLanguage:(id)a8 options:(unint64_t)a9
{
  id v20 = a8;
  unint64_t v15 = RKMessageResponseDontOverrideLanguageID | a9;
  id v16 = a8;
  id v17 = [(RKMessageResponseManager *)self responsesForMessageWithLanguageDetectionImp:a3 maximumResponses:a4 forRecipientID:a5 forConversationHistory:a6 forContext:a7 withLanguage:&v20 inputModes:0 options:v15];
  id v18 = v20;

  return v17;
}

- (id)responseWithAttributesMatchingProactiveGrammarForMessage:(id)a3 languageID:(id)a4 kbdInputModes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__2;
  unint64_t v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__2;
  v22[4] = __Block_byref_object_dispose__2;
  id v23 = v9;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __110__RKMessageResponseManager_responseWithAttributesMatchingProactiveGrammarForMessage_languageID_kbdInputModes___block_invoke;
  block[3] = &unk_2642D2928;
  block[4] = self;
  id v18 = v8;
  id v20 = &v24;
  id v21 = v22;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_sync(dispatchQueue, block);
  id v15 = (id)v25[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __110__RKMessageResponseManager_responseWithAttributesMatchingProactiveGrammarForMessage_languageID_kbdInputModes___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 responseWithAttributesMatchingProactiveGrammarForMessageImp:v3 languageID:&obj kbdInputModes:v4];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[7] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)responseWithAttributesMatchingProactiveGrammarForMessage:(id)a3 languageID:(id)a4 kbdInputModes:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__2;
  v24[4] = __Block_byref_object_dispose__2;
  id v25 = v11;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __126__RKMessageResponseManager_responseWithAttributesMatchingProactiveGrammarForMessage_languageID_kbdInputModes_completionBlock___block_invoke;
  block[3] = &unk_2642D2950;
  block[4] = self;
  id v20 = v10;
  id v22 = v13;
  id v23 = v24;
  id v21 = v12;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(dispatchQueue, block);

  _Block_object_dispose(v24, 8);
}

void __126__RKMessageResponseManager_responseWithAttributesMatchingProactiveGrammarForMessage_languageID_kbdInputModes_completionBlock___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 responseWithAttributesMatchingProactiveGrammarForMessageImp:v3 languageID:&obj kbdInputModes:v4];
  objc_storeStrong((id *)(v5 + 40), obj);
  (*(void (**)(void))(a1[7] + 16))();
}

- (id)responseWithAttributesMatchingProactiveGrammarForMessageImp:(id)a3 languageID:(id *)a4 kbdInputModes:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = (void *)MEMORY[0x263F08708];
  id v9 = a3;
  id v10 = [v8 whitespaceCharacterSet];
  id v11 = [v9 stringByTrimmingCharactersInSet:v10];

  if ([v11 length]
    && (unint64_t)[v11 length] <= 0x800
    && !+[RKUtilities RKRepairStringNeeded:v11])
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v15 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:*a4];
    [v14 addObject:v15];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          if (([v14 containsObject:v21] & 1) == 0) {
            [v14 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v18);
    }

    id v22 = +[RKProactiveGrammar sharedManager];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v23 = v14;
    id v12 = (RKResponse *)[v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v12)
    {
      uint64_t v24 = *(void *)v31;
      while (2)
      {
        for (j = 0; j != v12; j = (RKResponse *)((char *)j + 1))
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v23);
          }
          uint64_t v26 = objc_msgSend(v22, "copyAttributedTokenForText:forLanguage:", v11, *(void *)(*((void *)&v30 + 1) + 8 * (void)j), (void)v30);
          if (v26)
          {
            id v27 = (void *)v26;
            unint64_t v28 = [RKResponse alloc];
            id v29 = RKLinguisticCategoryToPreferenceKey(43);
            id v12 = [(RKResponse *)v28 initWithString:0 attributes:v27 category:v29];

            goto LABEL_27;
          }
        }
        id v12 = (RKResponse *)[v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_27:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)responsesForMessageWithLanguageDetectionImp:(id)a3 maximumResponses:(unint64_t)a4 forRecipientID:(id)a5 forConversationHistory:(id)a6 forContext:(id)a7 withLanguage:(id *)a8 inputModes:(id)a9 options:(unint64_t)a10
{
  v230[1] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v185 = a5;
  id v17 = a6;
  id v18 = a7;
  id v186 = a9;
  uint64_t v19 = [(id)objc_opt_class() _chronologicalConversationHistory:v17];
  int v190 = [(id)objc_opt_class() _needsMirroredAnalysisForMessage:v16 forChronologicalConversationHistory:v19];
  v182 = self;
  v183 = (void *)v19;
  if (![v16 length])
  {
    [(id)objc_opt_class() _mostRecentTextFromChronologicalConversationHistory:v19];
    v21 = id v20 = v18;

    id v16 = (id)v21;
    id v18 = v20;
  }
  v184 = v17;
  if (+[RKUtilities RKRepairStringNeeded:v16])
  {
    id v22 = 0;
LABEL_7:
    unint64_t v28 = v183;
    goto LABEL_154;
  }
  id v181 = v18;
  id v23 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v24 = [v16 stringByTrimmingCharactersInSet:v23];

  id v25 = [v24 stringByReplacingOccurrencesOfString:@"‘" withString:&stru_26C8AEFC8];

  uint64_t v26 = [v25 stringByReplacingOccurrencesOfString:@"’" withString:&stru_26C8AEFC8];

  id v27 = [v26 stringByReplacingOccurrencesOfString:@"'" withString:&stru_26C8AEFC8];

  if ((unint64_t)[v27 length] > 0x800)
  {
    id v22 = 0;
    id v18 = v181;
    id v16 = v27;
    goto LABEL_7;
  }
  if (!a4) {
    a4 = 0x7FFFFFFFLL;
  }
  id v29 = a8;
  long long v30 = (void *)[v17 mutableCopy];
  v178 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:0];
  v230[0] = v178;
  long long v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v230 count:1];
  [v30 sortUsingDescriptors:v31];

  long long v32 = [(RKMessageResponseManager *)self preferredLanguages];
  +[RKMessageClassifier setPreferredLanguages:v32];

  v177 = v29;
  v189 = v27;
  v180 = v30;
  long long v33 = +[RKMessageClassifier messageClassification:v27 withLanguageIdentifier:*v29 conversationTurns:v30];
  long long v34 = [v33 language];

  v191 = v33;
  if (!v34)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[RKMessageResponseManager responsesForMessageWithLanguageDetectionImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:inputModes:options:]();
    }
    id v22 = 0;
    id v18 = v181;
    id v16 = v27;
    unint64_t v28 = v183;
    v44 = v33;
    goto LABEL_153;
  }
  v188 = RKLinguisticCategoryToPreferenceKey([v33 sentenceType]);
  long long v35 = [v33 language];
  +[RKCoreAnalytics sendCoreAnalyticsEvent:0 forAction:@"triggered" withLanguageID:v35];

  if ((RKMessageResponseDontOverrideLanguageID & a10) == 0)
  {
    *id v29 = [v191 language];
  }
  if ((a10 & 0x200) == 0)
  {
LABEL_21:
    v46 = [MEMORY[0x263EFF980] array];
    if ((a10 & 1) == 0)
    {
      v47 = [v191 customResponses];
      uint64_t v48 = [v47 count];

      if (v48)
      {
        if ([v191 sentenceType] != 6
          || ([v191 customResponses],
              v49 = objc_claimAutoreleasedReturnValue(),
              unint64_t v50 = [v49 count],
              v49,
              v50 <= a4))
        {
          v51 = [v191 customResponses];
          [v46 addObjectsFromArray:v51];

          if ([v46 count] > a4)
          {
            v52 = objc_msgSend(v46, "subarrayWithRange:", 0, a4);
            uint64_t v53 = [v52 mutableCopy];

            v46 = (void *)v53;
          }
          a4 -= [v46 count];
        }
      }
    }
    v54 = (void *)MEMORY[0x263EFF960];
    if (*v29)
    {
      objc_msgSend(MEMORY[0x263EFF960], "canonicalLanguageIdentifierFromString:");
      id v55 = (id)objc_claimAutoreleasedReturnValue();
      id v179 = v55;
    }
    else
    {
      id v55 = [MEMORY[0x263EFF960] currentLocale];
      v56 = [v55 localeIdentifier];
      id v179 = [v54 canonicalLanguageIdentifierFromString:v56];
    }
    uint64_t v57 = [v191 language];
    if (v57)
    {
      v58 = (void *)v57;
      v59 = [v191 language];
      char v60 = [v59 isEqualToString:@"und"];

      if ((v60 & 1) == 0)
      {
        v61 = [v191 language];
        v62 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v61];

        v63 = +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:v179];
        if (([v62 isEqualToString:v63] & 1) == 0)
        {
          uint64_t v64 = [v191 language];

          id v179 = (id)v64;
        }
      }
    }
    if (a4)
    {
      if ([(RKMessageResponseManager *)self usePersonalizedRanking])
      {
        v65 = [(RKMessageResponseManager *)self getRankLearner];
        rankLearner = self->_rankLearner;
        self->_rankLearner = v65;

        v67 = v191;
        if ([v191 sentenceType] == 1) {
          [v191 setSentenceType:2];
        }
        v68 = [(RKMessageResponseManager *)v182 rankLearner];
        v69 = RKLinguisticCategoryToPreferenceKey([v191 sentenceType]);
        v70 = [v191 language];
        v176 = [v68 getRankedResponses:v69 forRecipientID:v185 withLanguageID:v70];
      }
      else
      {
        v176 = 0;
        v67 = v191;
      }
      if ([v67 sentenceType] != 6)
      {
        v71 = [(RKMessageResponseManager *)v182 collection];
        v72 = objc_msgSend(v71, "responsesForCategory:gender:maximumResponses:withLanguage:context:options:", objc_msgSend(v67, "sentenceType"), objc_msgSend(v67, "gender"), a4, v179, v181, a10);
        [v46 addObjectsFromArray:v72];
      }
    }
    else
    {
      v176 = 0;
    }
    if ((a10 & 0x40) != 0)
    {
      v217[0] = MEMORY[0x263EF8330];
      v217[1] = 3221225472;
      v217[2] = __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke;
      v217[3] = &unk_2642D20E8;
      id v218 = v46;
      [v218 enumerateObjectsUsingBlock:v217];
    }
    if ((a10 & 0x80) == 0)
    {
      v215[0] = MEMORY[0x263EF8330];
      v215[1] = 3221225472;
      v215[2] = __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_2;
      v215[3] = &unk_2642D20E8;
      id v216 = v46;
      [v216 enumerateObjectsUsingBlock:v215];
    }
    if ([v191 sentenceType] == 6)
    {
      if (responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options__onceToken != -1) {
        dispatch_once(&responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options__onceToken, &__block_literal_global_204_0);
      }
      v213[0] = MEMORY[0x263EF8330];
      v213[1] = 3221225472;
      v213[2] = __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_6;
      v213[3] = &unk_2642D20E8;
      id v214 = v46;
      [v214 enumerateObjectsUsingBlock:v213];
    }
    if ((a10 & 0x20) == 0)
    {
      v211[0] = MEMORY[0x263EF8330];
      v211[1] = 3221225472;
      v211[2] = __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_8;
      v211[3] = &unk_2642D20E8;
      id v212 = v46;
      [v212 enumerateObjectsUsingBlock:v211];
    }
    if ([v191 isSensitive])
    {

      v46 = 0;
    }
    v73 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v73 synchronize];
    v175 = v73;
    if ([v73 BOOLForKey:@"RKSuppressGeneralStatementResponse"]
      && (![v191 sentenceType] || objc_msgSend(v191, "sentenceType") == 31))
    {

      v46 = 0;
    }
    v74 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v16 = v189;
    uint64_t v75 = [v189 stringByTrimmingCharactersInSet:v74];

    v76 = [(RKMessageResponseManager *)v182 collection];
    v77 = objc_msgSend(v76, "responsesForCategory:gender:maximumResponses:withLanguage:context:options:", objc_msgSend(v191, "sentenceType"), objc_msgSend(v191, "gender"), a4, v179, v181, a10 & 0xFFFFFFFFFFFFFFE0 | 0xF);

    v78 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF CONTAINS[c] %@", v75];
    v173 = v77;
    v79 = [v77 filteredArrayUsingPredicate:v78];
    uint64_t v80 = [v79 count];

    v174 = (void *)v75;
    if (v80)
    {
      v81 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (SELF CONTAINS[c] %@)", v75];
      v82 = [v46 filteredArrayUsingPredicate:v81];
      uint64_t v83 = [v82 mutableCopy];

      v46 = (void *)v83;
    }
    int v84 = v190;
    v85 = [MEMORY[0x263EFF980] array];
    long long v207 = 0u;
    long long v208 = 0u;
    long long v209 = 0u;
    long long v210 = 0u;
    id v86 = v46;
    uint64_t v87 = [v86 countByEnumeratingWithState:&v207 objects:v229 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = *(void *)v208;
      do
      {
        for (uint64_t i = 0; i != v88; ++i)
        {
          if (*(void *)v208 != v89) {
            objc_enumerationMutation(v86);
          }
          uint64_t v91 = *(void *)(*((void *)&v207 + 1) + 8 * i);
          if (([v85 containsObject:v91] & 1) == 0) {
            [v85 addObject:v91];
          }
        }
        uint64_t v88 = [v86 countByEnumeratingWithState:&v207 objects:v229 count:16];
      }
      while (v88);
    }

    v92 = (void *)[v85 copy];
    if (![v92 count])
    {

      v92 = 0;
    }
    v44 = v191;
    v172 = v85;
    if ([v92 count])
    {
      v93 = &_os_log_internal;
      id v94 = &_os_log_internal;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_INFO, "Non-intent based responses have been sunset.", buf, 2u);
      }

      id obj = 0;
      v95 = 0;
      v92 = 0;
      if ((a10 & 0x200) != 0) {
        goto LABEL_91;
      }
    }
    else if ((a10 & 0x200) != 0)
    {
      if (v92)
      {
        v97 = [MEMORY[0x263EFF980] array];
        long long v203 = 0u;
        long long v204 = 0u;
        long long v205 = 0u;
        long long v206 = 0u;
        id obj = v92;
        uint64_t v98 = [obj countByEnumeratingWithState:&v203 objects:v228 count:16];
        if (v98)
        {
          uint64_t v99 = v98;
          uint64_t v100 = *(void *)v204;
          do
          {
            for (uint64_t j = 0; j != v99; ++j)
            {
              if (*(void *)v204 != v100) {
                objc_enumerationMutation(obj);
              }
              v102 = [[RKResponse alloc] initWithString:*(void *)(*((void *)&v203 + 1) + 8 * j) attributes:0 category:v188];
              [v97 addObject:v102];
            }
            uint64_t v99 = [obj countByEnumeratingWithState:&v203 objects:v228 count:16];
          }
          while (v99);
        }

        v44 = v191;
        v95 = v97;
      }
      else
      {
        id obj = 0;
        v95 = 0;
      }
LABEL_91:
      v103 = objc_opt_new();
      v171 = RKLinguisticCategoryToPreferenceKey([v44 sentenceType]);
      objc_msgSend(v103, "setObject:forKey:");
      v104 = +[RKMessageIntentRecognizer sharedManager];
      v105 = [v44 language];
      v169 = v104;
      v170 = v103;
      v106 = (void *)[v104 copyAttributedTokensForMessage:v189 conversationTurns:v180 metadata:v103 languageID:v105];

      if ([v106 count] && !v95) {
        v95 = objc_opt_new();
      }
      long long v201 = 0u;
      long long v202 = 0u;
      long long v199 = 0u;
      long long v200 = 0u;
      id v196 = v106;
      uint64_t v107 = [v196 countByEnumeratingWithState:&v199 objects:v227 count:16];
      if (v107)
      {
        uint64_t v108 = v107;
        char v109 = 0;
        uint64_t v110 = *(void *)v200;
        uint64_t v192 = *(void *)v200;
        do
        {
          uint64_t v111 = 0;
          uint64_t v194 = v108;
          do
          {
            if (*(void *)v200 != v110) {
              objc_enumerationMutation(v196);
            }
            int IntentType = NLMessageIntentCandidateGetIntentType();
            v113 = (void *)NLMessageIntentCandidateCopyAttributes();
            NLMessageIntentCandidateGetScore();
            if (v114 >= 0.5 && IntentType == 1) {
              char v116 = v84;
            }
            else {
              char v116 = 1;
            }
            if ((v116 & 1) == 0)
            {
              v117 = objc_opt_new();
              [v117 setObject:@"photosharing" forKey:@"type"];
              v118 = [v113 objectForKey:*MEMORY[0x263F57488]];
              v119 = [v118 componentsSeparatedByString:@","];
              [v117 setObject:v119 forKey:@"keywords"];
              v120 = +[RKMessageIntentRecognizer getRangesOfKeywords:v119 forMessage:v16];
              if ([v120 count])
              {
                [v117 setObject:v120 forKey:@"keywordranges"];
                [v117 setObject:v16 forKey:@"message"];
                v121 = RKLinguisticCategoryToPreferenceKey(45);
                v197 = [[RKResponse alloc] initWithString:0 attributes:v117 category:v121];
                v122 = [v191 language];
                +[RKCoreAnalytics sendCoreAnalyticsEvent:v121 forAction:@"triggered" withLanguageID:v122];

                [v95 insertObject:v197 atIndex:0];
                id v16 = v189;

                int v84 = v190;
                char v109 = 1;
              }

              uint64_t v110 = v192;
              uint64_t v108 = v194;
            }

            ++v111;
          }
          while (v108 != v111);
          uint64_t v108 = [v196 countByEnumeratingWithState:&v199 objects:v227 count:16];
        }
        while (v108);
      }
      else
      {
        char v109 = 0;
      }

      v195 = +[RKPaymentIdentifier sharedManager];
      uint64_t v123 = [v195 copyAttributedTokensForText:v16];
      v193 = (void *)v123;
      if (v123)
      {
        uint64_t v124 = v123;
        v125 = RKLinguisticCategoryToPreferenceKey(44);
        v126 = [[RKResponse alloc] initWithString:0 attributes:v124 category:v125];
        if (!v95)
        {
          v95 = [MEMORY[0x263EFF980] array];
        }
        [v191 language];
        v128 = v127 = v95;
        +[RKCoreAnalytics sendCoreAnalyticsEvent:v125 forAction:@"triggered" withLanguageID:v128];

        v95 = v127;
        [v127 insertObject:v126 atIndex:0];
      }
      else
      {
        if (v109)
        {
          v198 = v95;
          goto LABEL_121;
        }
        v125 = [v191 language];
        +[RKCoreAnalytics sendCoreAnalyticsEvent:v171 forAction:@"triggered" withLanguageID:v125];
      }
      v198 = v95;

LABEL_121:
      unint64_t v28 = v183;
      v43 = v179;
      v129 = [(RKMessageResponseManager *)v182 responseWithAttributesMatchingProactiveGrammarForMessageImp:v16 languageID:v177 kbdInputModes:v186];
      if ([(id)objc_opt_class() _responseLooksLikeIncomingCheckInResponse:v129])
      {
        if (v84)
        {
          v130 = &_os_log_internal;
          id v131 = &_os_log_internal;
          v44 = v191;
          if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v132 = &_os_log_internal;
            v133 = "Incoming check-in response is not valid for outgoing messages";
LABEL_147:
            _os_log_impl(&dword_217E21000, v132, OS_LOG_TYPE_INFO, v133, buf, 2u);
            goto LABEL_148;
          }
          goto LABEL_148;
        }
        v139 = [v129 attributes];
        v135 = (void *)[v139 mutableCopy];

        v140 = (void *)[@"event" copy];
        [v135 setObject:v140 forKeyedSubscript:@"type"];

        v141 = (void *)[@"traveling home" copy];
        [v135 setObject:v141 forKeyedSubscript:@"subtype"];

        [v135 setObject:0 forKeyedSubscript:@"request"];
        v138 = (void *)[v135 copy];
        [v129 setAttributes:v138];
        v44 = v191;
      }
      else if ([(id)objc_opt_class() _responseLooksLikeOutgoingCheckInResponse:v129])
      {
        v44 = v191;
        if ((v84 & 1) == 0)
        {
          v162 = &_os_log_internal;
          id v163 = &_os_log_internal;
          if (os_log_type_enabled(v162, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v132 = &_os_log_internal;
            v133 = "Outgoing check-in response is not valid for incoming messages";
            goto LABEL_147;
          }
LABEL_148:

          id v22 = 0;
          id v18 = v181;
          v96 = v174;
          v45 = v175;
LABEL_149:
          id v161 = v198;
LABEL_150:

          goto LABEL_151;
        }
        v134 = [v129 attributes];
        v135 = (void *)[v134 mutableCopy];

        v136 = (void *)[@"event" copy];
        [v135 setObject:v136 forKeyedSubscript:@"type"];

        v137 = (void *)[@"traveling home" copy];
        [v135 setObject:v137 forKeyedSubscript:@"subtype"];

        [v135 setObject:0 forKeyedSubscript:@"request"];
        v138 = (void *)[v135 copy];
        [v129 setAttributes:v138];
      }
      else
      {
        if (!v84)
        {
          v44 = v191;
          if ([(id)objc_opt_class() _responseTypeIsSunsetted:v129])
          {
            v165 = &_os_log_internal;
            id v166 = &_os_log_internal;
            v96 = v174;
            v45 = v175;
            if (os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
            {
              v167 = [v129 attributes];
              v168 = [v167 objectForKeyedSubscript:@"type"];
              *(_DWORD *)buf = 138412290;
              v220 = v168;
              _os_log_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_INFO, "Responses of this type (%@) have been sunsetted", buf, 0xCu);

              v43 = v179;
            }

            id v22 = 0;
            id v18 = v181;
            goto LABEL_149;
          }
          id v18 = v181;
LABEL_130:
          v96 = v174;
          v45 = v175;
          if (v129)
          {
            v142 = v198;
            if (!v198)
            {
              v142 = [MEMORY[0x263EFF980] array];
            }
            [v142 insertObject:v129 atIndex:0];
          }
          else
          {
            v142 = v198;
          }
          id v161 = v142;
          id v22 = v161;
          goto LABEL_150;
        }
        v143 = [v129 attributes];
        v135 = (void *)[v143 copy];

        int v144 = [(id)objc_opt_class() _isMirroredResponseValidForResponse:v129];
        v145 = &_os_log_internal;
        id v146 = &_os_log_internal;
        if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
        {
          v147 = [v135 objectForKeyedSubscript:@"type"];
          v148 = [v135 objectForKeyedSubscript:@"subtype"];
          uint64_t v149 = [v135 objectForKeyedSubscript:@"field"];
          v150 = (void *)v149;
          v151 = @"No";
          *(_DWORD *)buf = 138413058;
          v220 = v147;
          if (v144) {
            v151 = @"Yes";
          }
          __int16 v221 = 2112;
          v222 = v148;
          __int16 v223 = 2112;
          uint64_t v224 = v149;
          __int16 v225 = 2112;
          v226 = v151;
          _os_log_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_INFO, "Response with type: %@, subtype: %@, field: %@ is valid for mirroring: %@", buf, 0x2Au);
        }
        v44 = v191;
        if (v144)
        {
          v138 = (void *)[v135 mutableCopy];
          [v138 setObject:@"mirrored" forKeyedSubscript:@"pov"];
          v152 = (void *)[v138 copy];
          [v129 setAttributes:v152];

          v153 = &_os_log_internal;
          id v154 = &_os_log_internal;
          if (os_log_type_enabled(v153, OS_LOG_TYPE_INFO))
          {
            v155 = [v129 attributes];
            v156 = [v155 objectForKeyedSubscript:@"type"];
            v157 = [v129 attributes];
            v158 = [v157 objectForKeyedSubscript:@"subtype"];
            v159 = [v129 attributes];
            v160 = [v159 objectForKeyedSubscript:@"field"];
            *(_DWORD *)buf = 138412802;
            v220 = v156;
            __int16 v221 = 2112;
            v222 = v158;
            __int16 v223 = 2112;
            uint64_t v224 = (uint64_t)v160;
            _os_log_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_INFO, "Response after mirroring has type: %@, subtype: %@, field: %@", buf, 0x20u);

            id v16 = v189;
            v44 = v191;
          }
        }
        else
        {
          v138 = v129;
          v129 = 0;
        }
      }

      id v18 = v181;
      v43 = v179;
      goto LABEL_130;
    }
    id v22 = v92;
    id obj = v22;
    id v18 = v181;
    unint64_t v28 = v183;
    v43 = v179;
    v96 = v174;
    v45 = v175;
LABEL_151:

    goto LABEL_152;
  }
  long long v36 = +[RKResponseCollection responsesForFullScreenMoments:v27];
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!v36 || ![v36 count])
  {

    goto LABEL_21;
  }
  long long v37 = [v36 objectAtIndexedSubscript:0];
  id v38 = [v37 objectForKey:@"subtype"];
  uint64_t v39 = RKLinguisticCategoryForFSMType(v38);

  uint64_t v40 = [RKResponse alloc];
  id obj = v36;
  v41 = [v36 objectAtIndexedSubscript:0];
  uint64_t v42 = [(RKResponse *)v40 initWithString:0 attributes:v41 category:v39];

  v43 = (void *)v39;
  v176 = (void *)v42;
  [v22 insertObject:v42 atIndex:0];
  v44 = v191;
  v45 = [v191 language];
  +[RKCoreAnalytics sendCoreAnalyticsEvent:v43 forAction:@"triggered" withLanguageID:v45];
  id v18 = v181;
  id v16 = v27;
  unint64_t v28 = v183;
LABEL_152:

LABEL_153:
LABEL_154:

  return v22;
}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 stringByReplacingOccurrencesOfString:@"“" withString:@"\""];
  uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@"”" withString:@"\""];

  id v7 = [v6 stringByReplacingOccurrencesOfString:@"‘" withString:@"'"];

  id v8 = [v7 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

  [*(id *)(a1 + 32) setObject:v8 atIndexedSubscript:a3];
}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 componentsSeparatedByString:@"\n"];
  uint64_t v6 = (void *)[v5 mutableCopy];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_3;
  v9[3] = &unk_2642D20E8;
  id v10 = v6;
  id v7 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
  id v8 = [v7 componentsJoinedByString:@"\n"];
  [*(id *)(a1 + 32) setObject:v8 atIndexedSubscript:a3];
}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 uppercaseFirstWordString];
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a3];
}

uint64_t __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_4()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  dispatch_queue_t v1 = (void *)responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options__sAppleProducts;
  responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options__sAppleProducts = v0;

  return [&unk_26C8EC398 enumerateObjectsUsingBlock:&__block_literal_global_339];
}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = NSString;
  id v3 = a2;
  uint64_t v4 = [v2 stringWithFormat:@"\\b%@\\b", v3];
  id v5 = [v4 stringByReplacingOccurrencesOfString:@" " withString:@"\\s*"];

  [(id)responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options__sAppleProducts setObject:v3 forKeyedSubscript:v5];
}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)[a2 mutableCopy];
  uint64_t v6 = (void *)responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options__sAppleProducts;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_7;
  v8[3] = &unk_2642D2998;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = a3;
  id v7 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_7(void *a1, void *a2, void *a3)
{
  id v5 = (void *)a1[4];
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", v7, v6, 1025, 0, objc_msgSend(v5, "length"));

  if (v8)
  {
    uint64_t v10 = a1[4];
    id v9 = (void *)a1[5];
    uint64_t v11 = a1[6];
    [v9 setObject:v10 atIndexedSubscript:v11];
  }
}

void __170__RKMessageResponseManager_responsesForMessageWithLanguageDetectionImp_maximumResponses_forRecipientID_forConversationHistory_forContext_withLanguage_inputModes_options___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = [a2 componentsSeparatedByString:@"\n"];
  if ((unint64_t)[v6 count] >= 2)
  {
    id v5 = objc_msgSend(v6, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v6, "count"));
    [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a3];
  }
}

- (id)categoryForMessage:(id)a3 langID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__2;
  uint64_t v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  uint64_t v8 = [(RKMessageResponseManager *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__RKMessageResponseManager_categoryForMessage_langID___block_invoke;
  block[3] = &unk_2642D29C0;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __54__RKMessageResponseManager_categoryForMessage_langID___block_invoke(void *a1)
{
  id v2 = (void *)MEMORY[0x21D45BF80]();
  id v3 = +[RKMessageClassifier messageClassification:a1[4] withLanguageIdentifier:a1[5]];
  uint64_t v4 = RKLinguisticCategoryToPreferenceKey([v3 sentenceType]);
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if ([*(id *)(*(void *)(a1[6] + 8) + 40) isEqualToString:@"QueryGeneral"])
  {
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = @"QueryPolar";
  }
}

- (id)categoryForMessageWithoutQueue:(id)a3 langID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x21D45BF80]();
  uint64_t v8 = +[RKMessageClassifier messageClassification:v5 withLanguageIdentifier:v6];
  RKLinguisticCategoryToPreferenceKey([v8 sentenceType]);
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v9 isEqualToString:@"QueryGeneral"])
  {

    id v9 = @"QueryPolar";
  }

  return v9;
}

- (void)registerResponse:(id)a3 forMessage:(id)a4 forContext:(id)a5 withLanguage:(id)a6
{
}

- (void)registerResponse:(id)a3 forMessage:(id)a4 forContext:(id)a5 withEffectiveDate:(id)a6 withLanguage:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(RKMessageResponseManager *)self dispatchQueue];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __98__RKMessageResponseManager_registerResponse_forMessage_forContext_withEffectiveDate_withLanguage___block_invoke;
  v23[3] = &unk_2642D29E8;
  id v24 = v12;
  id v25 = v13;
  uint64_t v26 = self;
  id v27 = v16;
  id v28 = v14;
  id v29 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v16;
  id v21 = v13;
  id v22 = v12;
  dispatch_sync(v17, v23);
}

void __98__RKMessageResponseManager_registerResponse_forMessage_forContext_withEffectiveDate_withLanguage___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (*(void *)(a1 + 40))
    {
      id v2 = [*(id *)(a1 + 48) collection];
      [v2 registerResponse:*(void *)(a1 + 32) forMessage:*(void *)(a1 + 40) withLanguage:*(void *)(a1 + 56) context:*(void *)(a1 + 64) effectiveDate:*(void *)(a1 + 72)];
    }
    else
    {
      NSLog(&cfstr_WarningMessage.isa);
    }
  }
  else
  {
    NSLog(&cfstr_WarningRespons.isa);
  }
}

- (void)registerResponse:(id)a3 forMessage:(id)a4 metadata:(id)a5 withLanguage:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(RKMessageResponseManager *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__RKMessageResponseManager_registerResponse_forMessage_metadata_withLanguage___block_invoke;
  block[3] = &unk_2642D2A10;
  id v20 = v11;
  id v21 = v10;
  id v22 = self;
  id v23 = v13;
  id v24 = v12;
  id v15 = v12;
  id v16 = v13;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(v14, block);
}

void __78__RKMessageResponseManager_registerResponse_forMessage_metadata_withLanguage___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if ((unint64_t)[v2 length] <= 0x800)
    {
      id v3 = *(void **)(a1 + 40);
      if (v3)
      {
        if ((unint64_t)[v3 length] <= 0x14)
        {
          if ([*(id *)(a1 + 48) usePersonalizedRanking])
          {
            uint64_t v4 = [*(id *)(a1 + 48) getRankLearner];
            uint64_t v5 = *(void *)(a1 + 48);
            id v6 = *(void **)(v5 + 32);
            *(void *)(v5 + 32) = v4;
          }
          if (*(void *)(*(void *)(a1 + 48) + 32))
          {
            uint64_t v7 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:*(void *)(a1 + 56)];
            id v29 = [v7 objectForKey:*MEMORY[0x263EFF508]];

            uint64_t v8 = objc_opt_new();
            id v9 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"recipient"];
            [v8 setObject:v9 forKeyedSubscript:@"recipient"];

            id v10 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"source"];
            [v8 setObject:v10 forKeyedSubscript:@"source"];

            id v11 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"inputmethod"];
            id v28 = v8;
            [v8 setObject:v11 forKeyedSubscript:@"inputmethod"];

            uint64_t v30 = a1;
            id v12 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"rankedlist"];
            id v13 = objc_opt_new();
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            id obj = v12;
            uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v33;
              do
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v33 != v16) {
                    objc_enumerationMutation(obj);
                  }
                  id v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                  id v19 = objc_opt_new();
                  id v20 = [v18 string];
                  [v19 addObject:v20];

                  id v21 = [v18 attributes];
                  id v22 = [v21 objectForKey:@"rank"];
                  [v19 addObject:v22];

                  id v23 = [v18 attributes];
                  id v24 = [v23 objectForKey:@"selected"];
                  [v19 addObject:v24];

                  id v25 = [v19 componentsJoinedByString:@":"];
                  [v13 addObject:v25];
                }
                uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
              }
              while (v15);
            }

            uint64_t v26 = [*(id *)(v30 + 48) categoryForMessageWithoutQueue:*(void *)(v30 + 32) langID:*(void *)(v30 + 56)];
            [v28 setObject:v26 forKeyedSubscript:@"category"];
            id v27 = [v13 componentsJoinedByString:@";"];
            [v28 setObject:v27 forKeyedSubscript:@"rankedlist"];
            [v28 setObject:*(void *)(v30 + 32) forKeyedSubscript:@"message"];
            [v28 setObject:*(void *)(v30 + 40) forKeyedSubscript:@"response"];
            if ([*(id *)(*(void *)(v30 + 48) + 32) insertRankingInfo:v28 forLanguageID:v29])objc_msgSend(*(id *)(*(void *)(v30 + 48) + 32), "flushRankingData:", v29); {
          }
            }
        }
      }
    }
  }
}

- (id)getRankLearner
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__RKMessageResponseManager_getRankLearner__block_invoke;
  block[3] = &unk_2642D22B8;
  void block[4] = self;
  if (getRankLearner_onceToken != -1) {
    dispatch_once(&getRankLearner_onceToken, block);
  }
  return self->_rankLearner;
}

uint64_t __42__RKMessageResponseManager_getRankLearner__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = objc_alloc_init(RKRankLearner);

  return MEMORY[0x270F9A758]();
}

- (BOOL)usePersonalizedRanking
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_INFO, "Rank learning has been sunset across all platforms.", v3, 2u);
  }
  return 0;
}

- (void)prunePersonalizedUserDatabase:(id)a3
{
  id v6 = a3;
  if ([(RKMessageResponseManager *)self usePersonalizedRanking])
  {
    uint64_t v4 = objc_alloc_init(RKRankLearner);
    uint64_t v5 = [(RKRankLearner *)v4 getDBManager:v6];
    [v5 pruneUserDatabase];
  }
}

- (void)resetRegisteredResponses
{
  id v3 = [(RKMessageResponseManager *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__RKMessageResponseManager_resetRegisteredResponses__block_invoke;
  block[3] = &unk_2642D22B8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __52__RKMessageResponseManager_resetRegisteredResponses__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collection];
  [v1 resetRegisteredResponses];
}

- (void)flushDynamicData
{
  id v3 = [(RKMessageResponseManager *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__RKMessageResponseManager_flushDynamicData__block_invoke;
  block[3] = &unk_2642D22B8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __44__RKMessageResponseManager_flushDynamicData__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collection];
  [v1 flushDynamicData];
}

- (BOOL)isQuestion:(id)a3 withLanguage:(id)a4
{
  return 0;
}

+ (BOOL)_needsMirroredAnalysisForMessage:(id)a3 forChronologicalConversationHistory:(id)a4
{
  id v6 = a4;
  if ([a3 length] || !objc_msgSend(v6, "count"))
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v8 = [a1 _mostRecentTextFromChronologicalConversationHistory:v6];
    BOOL v7 = [v8 length] != 0;
  }
  return v7;
}

+ (BOOL)_responseTypeIsSunsetted:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 attributes];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"type"];

  if ([v4 isEqualToString:@"event"]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:@"health"];
  }

  return v5;
}

+ (BOOL)_responseLooksLikeIncomingCheckInResponse:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 attributes];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"request"];

  LOBYTE(v3) = [v4 containsString:@"xCHECKININCOMINGx"];
  return (char)v3;
}

+ (BOOL)_responseLooksLikeOutgoingCheckInResponse:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 attributes];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"request"];

  LOBYTE(v3) = [v4 containsString:@"xCHECKINOUTGOINGx"];
  return (char)v3;
}

+ (BOOL)_isMirroredResponseValidForResponse:(id)a3
{
  id v3 = [a3 attributes];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"type"];
  char v5 = [v3 objectForKeyedSubscript:@"subtype"];
  id v6 = [v3 objectForKeyedSubscript:@"field"];
  if ([v6 length] || !objc_msgSend(v4, "containsString:", @"location")) {
    char v7 = 0;
  }
  else {
    char v7 = [v5 containsString:@"current location"];
  }

  return v7;
}

+ (id)_mostRecentTextFromChronologicalConversationHistory:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = [(id)objc_opt_class() _chronologicalConversationHistory:v3];
    char v5 = [v4 lastObject];
    id v6 = [v5 text];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_chronologicalConversationHistory:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_394];
}

uint64_t __62__RKMessageResponseManager__chronologicalConversationHistory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  char v5 = [a2 timestamp];
  id v6 = [v4 timestamp];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (RKResponseCollection)collection
{
  return (RKResponseCollection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCollection:(id)a3
{
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (void)setPreferredLanguages:(id)a3
{
}

- (RKRankLearner)rankLearner
{
  return (RKRankLearner *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRankLearner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankLearner, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_collection, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)responsesForMessageWithLanguageDetectionImp:maximumResponses:forRecipientID:forConversationHistory:forContext:withLanguage:inputModes:options:.cold.1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Failed to identify the language of the given message", v0, 2u);
}

@end