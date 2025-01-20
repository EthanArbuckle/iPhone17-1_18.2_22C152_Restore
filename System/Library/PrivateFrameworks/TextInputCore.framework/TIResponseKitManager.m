@interface TIResponseKitManager
+ (id)rewriteMoneyAttributes:(id)a3;
+ (id)sharedTIResponseKitManager;
+ (id)singletonInstance;
- (TIResponseKitManager)init;
- (id)cannedResponsesForString:(id)a3 withLanguageID:(id)a4 withClientID:(id)a5 withRecipientID:(id)a6 withAdditionalPredictions:(id)a7 desiredCandidateCount:(unint64_t)a8 shouldDisableAutoCaps:(BOOL)a9 isBlocklisted:(BOOL)a10;
- (id)indexesOfDuplicatesInCandidates:(id)a3;
- (id)responseKitResponseCandidatesForString:(id)a3 withLanguageID:(id)a4 withClientID:(id)a5 withRecipientID:(id)a6 shouldDisableAutoCaps:(BOOL)a7;
- (void)addNewConversationTurnToHistory:(id)a3;
- (void)generateResponseKitSuggestionsForString:(id)a3 withLanguage:(id)a4 withClientID:(id)a5 withRecipientID:(id)a6 withAdditionalPredictions:(id)a7 desiredCandidateCount:(unint64_t)a8 shouldDisableAutoCaps:(BOOL)a9 stringIsBlocklisted:(BOOL)a10 async:(BOOL)a11 completionHandler:(id)a12;
- (void)persistResponseKitDynamicDataToDisk;
- (void)registerResponseKitResponse:(id)a3 forMessage:(id)a4 withLanguage:(id)a5 withClientID:(id)a6 withSenderID:(id)a7 withRecipientID:(id)a8 withTimestamp:(id)a9 shouldUpdateConversationHistory:(BOOL)a10;
- (void)resetResponseKit;
- (void)resetResponseKitConversationHistory;
- (void)updateResponseKitConversationHistoryWithMessage:(id)a3 withSenderID:(id)a4 withTimestamp:(id)a5;
@end

@implementation TIResponseKitManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationTurns, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)cannedResponsesForString:(id)a3 withLanguageID:(id)a4 withClientID:(id)a5 withRecipientID:(id)a6 withAdditionalPredictions:(id)a7 desiredCandidateCount:(unint64_t)a8 shouldDisableAutoCaps:(BOOL)a9 isBlocklisted:(BOOL)a10
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  if (![v16 length])
  {
    id v46 = v20;
    goto LABEL_33;
  }
  v21 = [(TIResponseKitManager *)self responseKitResponseCandidatesForString:v16 withLanguageID:v17 withClientID:v18 withRecipientID:v19 shouldDisableAutoCaps:a9];
  if (!v21)
  {
    id v46 = v20;
    goto LABEL_32;
  }
  v48 = self;
  unint64_t v49 = a8;
  v51 = v20;
  id v52 = v19;
  id v53 = v18;
  id v54 = v16;
  v55 = [MEMORY[0x1E4F1CA48] array];
  v57 = [MEMORY[0x1E4F1CA48] array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v50 = v21;
  id v22 = v21;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (!v23) {
    goto LABEL_27;
  }
  uint64_t v24 = v23;
  uint64_t v25 = *(void *)v59;
  uint64_t v56 = *MEMORY[0x1E4F962C8];
  do
  {
    uint64_t v26 = 0;
    do
    {
      if (*(void *)v59 != v25) {
        objc_enumerationMutation(v22);
      }
      v27 = *(void **)(*((void *)&v58 + 1) + 8 * v26);
      v28 = [v27 attributes];

      if (v28)
      {
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          v29 = TIOSLogFacility();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v42 = objc_msgSend(NSString, "stringWithFormat:", @"%s DEBUG:ProactiveQuickType:TI: Response Kit has returned an attributed response.", "-[TIResponseKitManager cannedResponsesForString:withLanguageID:withClientID:withRecipientID:withAdditionalPredictions:desiredCandidateCount:shouldDisableAutoCaps:isBlocklisted:]");
            *(_DWORD *)buf = 138412290;
            v63 = v42;
            _os_log_debug_impl(&dword_1E3F0E000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
        v30 = [v27 category];
        int v31 = [v30 isEqualToString:@"QueryPhotoSharing"];

        if (!v31 || !a10)
        {
          v32 = [v27 attributes];
          v33 = [v32 objectForKey:*MEMORY[0x1E4F72330]];

          if ([v33 isEqualToString:v56])
          {
            v34 = [v27 attributes];
            v35 = +[TIResponseKitManager rewriteMoneyAttributes:v34];

            v36 = [TIProactiveTrigger alloc];
          }
          else
          {
            v41 = [TIProactiveTrigger alloc];
            v35 = [v27 attributes];
            v36 = v41;
          }
          v39 = [(TIProactiveTrigger *)v36 initWithSourceType:1 attributes:v35];

          [v57 addObject:v39];
          goto LABEL_24;
        }
      }
      else
      {
        v37 = [v27 string];

        if (v37 && !a10)
        {
          id v38 = objc_alloc(MEMORY[0x1E4FAE500]);
          v39 = [v27 string];
          v33 = [v27 category];
          v40 = (void *)[v38 initWithCandidate:v39 responseKitCategory:v33];
          [v55 addObject:v40];

LABEL_24:
        }
      }
      ++v26;
    }
    while (v24 != v26);
    uint64_t v24 = [v22 countByEnumeratingWithState:&v58 objects:v64 count:16];
  }
  while (v24);
LABEL_27:

  id v20 = v51;
  if ([v55 count] < v49)
  {
    v43 = [v51 predictions];
    [v55 addObjectsFromArray:v43];

    v44 = [(TIResponseKitManager *)v48 indexesOfDuplicatesInCandidates:v55];
    [v55 removeObjectsAtIndexes:v44];

    v45 = [v51 proactiveTriggers];
    [v57 addObjectsFromArray:v45];
  }
  id v46 = [MEMORY[0x1E4FAE278] listWithPredictions:v55 proactiveTriggers:v57];

  id v16 = v54;
  id v19 = v52;
  id v18 = v53;
  v21 = v50;
LABEL_32:

LABEL_33:

  return v46;
}

- (id)indexesOfDuplicatesInCandidates:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__TIResponseKitManager_indexesOfDuplicatesInCandidates___block_invoke;
  v9[3] = &unk_1E6E2D9F0;
  id v10 = v5;
  id v6 = v5;
  v7 = [v4 indexesOfObjectsPassingTest:v9];

  return v7;
}

BOOL __56__TIResponseKitManager_indexesOfDuplicatesInCandidates___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 candidate];
  id v4 = [*(id *)(a1 + 32) member:v3];

  if (!v4) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return v4 != 0;
}

- (id)responseKitResponseCandidatesForString:(id)a3 withLanguageID:(id)a4 withClientID:(id)a5 withRecipientID:(id)a6 shouldDisableAutoCaps:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  id v13 = a6;
  if (v7) {
    uint64_t v14 = 704;
  }
  else {
    uint64_t v14 = 576;
  }
  conversationTurns = self->_conversationTurns;
  id v16 = a4;
  id v17 = a3;
  if ([(NSMutableArray *)conversationTurns count])
  {
    id v18 = [MEMORY[0x1E4F962A8] sharedManager];
    id v19 = [(TILanguageModelAdaptationContext *)v18 responsesForMessage:v17 maximumResponses:10 forConversationHistory:self->_conversationTurns withLanguage:v16 options:v14];
  }
  else
  {
    id v18 = [[TILanguageModelAdaptationContext alloc] initWithClientIdentifier:v12 andRecipientContactInfo:v13];
    id v20 = [MEMORY[0x1E4F962A8] sharedManager];
    uint64_t v21 = [(TILanguageModelAdaptationContext *)v18 identifierForResponseKit];
    id v19 = [v20 responsesForMessage:v17 maximumResponses:10 forContext:v21 withLanguage:v16 options:v14];

    id v16 = (id)v21;
    id v17 = v20;
  }

  return v19;
}

- (void)addNewConversationTurnToHistory:(id)a3
{
  id v4 = a3;
  conversationTurns = self->_conversationTurns;
  id v9 = v4;
  if (!conversationTurns)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v7 = self->_conversationTurns;
    self->_conversationTurns = v6;

    id v4 = v9;
    conversationTurns = self->_conversationTurns;
  }
  [(NSMutableArray *)conversationTurns addObject:v4];
  unint64_t v8 = *MEMORY[0x1E4F962D8];
  if ([(NSMutableArray *)self->_conversationTurns count] > v8) {
    -[NSMutableArray removeObjectsInRange:](self->_conversationTurns, "removeObjectsInRange:", 0, [(NSMutableArray *)self->_conversationTurns count] - v8);
  }
}

- (void)persistResponseKitDynamicDataToDisk
{
}

void __59__TIResponseKitManager_persistResponseKitDynamicDataToDisk__block_invoke()
{
  id v0 = [MEMORY[0x1E4F962A8] sharedManager];
  [v0 flushDynamicData];
}

- (void)resetResponseKit
{
}

void __40__TIResponseKitManager_resetResponseKit__block_invoke()
{
  id v0 = [MEMORY[0x1E4F962A8] sharedManager];
  [v0 resetRegisteredResponses];
}

- (void)resetResponseKitConversationHistory
{
}

uint64_t __59__TIResponseKitManager_resetResponseKitConversationHistory__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void)updateResponseKitConversationHistoryWithMessage:(id)a3 withSenderID:(id)a4 withTimestamp:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  id v9 = v10;
  TIDispatchAsync();
}

void __99__TIResponseKitManager_updateResponseKitConversationHistoryWithMessage_withSenderID_withTimestamp___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40) && *(void *)(a1 + 48))
  {
    id v2 = (id)[objc_alloc(MEMORY[0x1E4F96298]) initWithString:*(void *)(a1 + 32) senderID:*(void *)(a1 + 40) timestamp:*(void *)(a1 + 48)];
    [*(id *)(a1 + 56) addNewConversationTurnToHistory:v2];
  }
}

- (void)registerResponseKitResponse:(id)a3 forMessage:(id)a4 withLanguage:(id)a5 withClientID:(id)a6 withSenderID:(id)a7 withRecipientID:(id)a8 withTimestamp:(id)a9 shouldUpdateConversationHistory:(BOOL)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v27 = v18;
  id v28 = a8;
  v29 = v15;
  v30 = v16;
  int v31 = v17;
  id v32 = a9;
  id v20 = v32;
  id v21 = v19;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  id v25 = v28;
  id v26 = v18;
  TIDispatchAsync();
}

void __164__TIResponseKitManager_registerResponseKitResponse_forMessage_withLanguage_withClientID_withSenderID_withRecipientID_withTimestamp_shouldUpdateConversationHistory___block_invoke(uint64_t a1)
{
  id v7 = [[TILanguageModelAdaptationContext alloc] initWithClientIdentifier:*(void *)(a1 + 32) andRecipientContactInfo:*(void *)(a1 + 40)];
  id v2 = [MEMORY[0x1E4F962A8] sharedManager];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v5 = [(TILanguageModelAdaptationContext *)v7 identifierForResponseKit];
  [v2 registerResponse:v3 forMessage:v4 forContext:v5 withLanguage:*(void *)(a1 + 64)];

  if (*(unsigned char *)(a1 + 96) && *(void *)(a1 + 48) && *(void *)(a1 + 72) && *(void *)(a1 + 80))
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F96298]) initWithString:*(void *)(a1 + 48) senderID:*(void *)(a1 + 72) timestamp:*(void *)(a1 + 80)];
    [*(id *)(a1 + 88) addNewConversationTurnToHistory:v6];
  }
}

- (void)generateResponseKitSuggestionsForString:(id)a3 withLanguage:(id)a4 withClientID:(id)a5 withRecipientID:(id)a6 withAdditionalPredictions:(id)a7 desiredCandidateCount:(unint64_t)a8 shouldDisableAutoCaps:(BOOL)a9 stringIsBlocklisted:(BOOL)a10 async:(BOOL)a11 completionHandler:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a12;
  if (a11)
  {
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    id v38 = __220__TIResponseKitManager_generateResponseKitSuggestionsForString_withLanguage_withClientID_withRecipientID_withAdditionalPredictions_desiredCandidateCount_shouldDisableAutoCaps_stringIsBlocklisted_async_completionHandler___block_invoke;
    v39 = &unk_1E6E2D950;
    v40 = self;
    id v41 = v17;
    id v42 = v18;
    id v43 = v19;
    id v44 = v20;
    id v45 = v21;
    unint64_t v47 = a8;
    BOOL v48 = a9;
    BOOL v49 = a10;
    id v46 = v22;
    TIDispatchAsync();

    id v23 = v41;
  }
  else
  {
    uint64_t v30 = 0;
    int v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__19141;
    v34 = __Block_byref_object_dispose__19142;
    v35 = 0;
    id v25 = v17;
    id v26 = v18;
    id v27 = v19;
    id v28 = v20;
    id v29 = v21;
    TIDispatchSync();
    (*((void (**)(id, uint64_t))v22 + 2))(v22, v31[5]);

    _Block_object_dispose(&v30, 8);
    id v23 = v35;
  }
}

void __220__TIResponseKitManager_generateResponseKitSuggestionsForString_withLanguage_withClientID_withRecipientID_withAdditionalPredictions_desiredCandidateCount_shouldDisableAutoCaps_stringIsBlocklisted_async_completionHandler___block_invoke(uint64_t a1)
{
  LOWORD(v4) = *(_WORD *)(a1 + 96);
  id v2 = objc_msgSend(*(id *)(a1 + 32), "cannedResponsesForString:withLanguageID:withClientID:withRecipientID:withAdditionalPredictions:desiredCandidateCount:shouldDisableAutoCaps:isBlocklisted:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 88), v4);
  id v5 = *(id *)(a1 + 80);
  id v3 = v2;
  TIDispatchAsync();
}

uint64_t __220__TIResponseKitManager_generateResponseKitSuggestionsForString_withLanguage_withClientID_withRecipientID_withAdditionalPredictions_desiredCandidateCount_shouldDisableAutoCaps_stringIsBlocklisted_async_completionHandler___block_invoke_2(uint64_t a1)
{
  LOWORD(v6) = *(_WORD *)(a1 + 96);
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "cannedResponsesForString:withLanguageID:withClientID:withRecipientID:withAdditionalPredictions:desiredCandidateCount:shouldDisableAutoCaps:isBlocklisted:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 88), v6);
  uint64_t v3 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (TIResponseKitManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)TIResponseKitManager;
  uint64_t v2 = [(TIResponseKitManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.TextInput.ResponseKitManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)rewriteMoneyAttributes:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F722D8];
  id v25 = [a3 objectForKey:*MEMORY[0x1E4F722D8]];
  dispatch_queue_t v4 = [v25 objectForKey:*MEMORY[0x1E4F962D0]];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setValue:*MEMORY[0x1E4F962C8] forKey:*MEMORY[0x1E4F72330]];
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v7 = [MEMORY[0x1E4F1CA48] array];
  [v6 setValue:v7 forKey:@"Currency"];
  id v23 = v5;
  id v24 = v6;
  [v5 setValue:v6 forKey:*v3];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F1CA60];
          id v15 = v13;
          id v16 = [v14 dictionary];
          id v17 = [v15 currency];
          [v16 setObject:v17 forKey:@"CurrencyType"];

          id v18 = NSString;
          [v15 value];
          uint64_t v20 = v19;

          id v21 = [v18 stringWithFormat:@"%.2f", v20];
          [v16 setObject:v21 forKey:@"CurrencyValue"];

          [v7 addObject:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  return v23;
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken_19165 != -1) {
    dispatch_once(&singletonInstance_onceToken_19165, &__block_literal_global_19166);
  }
  uint64_t v2 = (void *)singletonInstance_singleton_19167;

  return v2;
}

uint64_t __41__TIResponseKitManager_singletonInstance__block_invoke()
{
  id v0 = objc_alloc_init(TIResponseKitManager);
  uint64_t v1 = singletonInstance_singleton_19167;
  singletonInstance_singleton_19167 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedTIResponseKitManager
{
  return +[TIResponseKitManager singletonInstance];
}

@end