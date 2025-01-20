@interface TILanguageModelOfflineLearningAgent
+ (id)contactRecordsForRecipients:(id)a3;
+ (id)sharedLearningAgent;
- (BOOL)continueLearningTaskWithStrategy:(id)a3;
- (OS_dispatch_queue)dispatchQueue;
- (TILanguageModelOfflineLearningAgent)init;
- (TILanguageModelOfflineLearningTask)currentLearningTask;
- (void)handleRemovalOfLearnedModels;
- (void)performLearningIfNecessaryWithStrategy:(id)a3 lastAdaptationTime:(double)a4;
- (void)performTaskInBackground:(id)a3;
- (void)setCurrentLearningTask:(id)a3;
@end

@implementation TILanguageModelOfflineLearningAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLearningTask, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)setCurrentLearningTask:(id)a3
{
}

- (TILanguageModelOfflineLearningTask)currentLearningTask
{
  return self->_currentLearningTask;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)handleRemovalOfLearnedModels
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(TILanguageModelOfflineLearningAgent *)self currentLearningTask];

  if (v3)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel)
    {
      v4 = TIOSLogFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s Canceling learning due to a Reset Keyboard Dictionary event.", "-[TILanguageModelOfflineLearningAgent handleRemovalOfLearnedModels]");
        *(_DWORD *)buf = 138412290;
        v8 = v6;
        _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    v5 = [(TILanguageModelOfflineLearningAgent *)self currentLearningTask];
    [v5 setCancelled:1];
  }
}

- (void)performTaskInBackground:(id)a3
{
}

- (void)performLearningIfNecessaryWithStrategy:(id)a3 lastAdaptationTime:(double)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4 == 0.0)
  {
    v8 = [v6 learningTask];

    if (v8)
    {
      uint64_t v9 = +[TIKeyboardAssertionManager sharedAssertionManager];
      [v9 retainBackgroundActivityAssertion];

      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__23265;
      v20 = __Block_byref_object_dispose__23266;
      id v21 = v7;
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      v10 = TIOSLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v12 = NSString;
        v13 = [(id)v17[5] learningTask];
        v14 = [v13 clientIdentifier];
        v15 = [v12 stringWithFormat:@"%s Beginning offline learing task for client '%@'", "-[TILanguageModelOfflineLearningAgent performLearningIfNecessaryWithStrategy:lastAdaptationTime:]", v14];
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      v11 = [(TILanguageModelOfflineLearningAgent *)self dispatchQueue];
      TIDispatchAsync();

      _Block_object_dispose(&v16, 8);
    }
  }
}

void __97__TILanguageModelOfflineLearningAgent_performLearningIfNecessaryWithStrategy_lastAdaptationTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) learningTask];
  TIDispatchSync();
  v3 = [v2 dataSource];

  if (v3)
  {
    while (([*(id *)(a1 + 32) continueLearningTaskWithStrategy:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] & 1) != 0);
  }
  v4 = (void *)MEMORY[0x1E4F14428];
  TIDispatchSync();
}

uint64_t __97__TILanguageModelOfflineLearningAgent_performLearningIfNecessaryWithStrategy_lastAdaptationTime___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentLearningTask:*(void *)(a1 + 40)];
}

uint64_t __97__TILanguageModelOfflineLearningAgent_performLearningIfNecessaryWithStrategy_lastAdaptationTime___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  id v2 = TIOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v7 = NSString;
    v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) learningTask];
    uint64_t v9 = [v8 clientIdentifier];
    v10 = [v7 stringWithFormat:@"%s Finished offline learing task for client '%@'", "-[TILanguageModelOfflineLearningAgent performLearningIfNecessaryWithStrategy:lastAdaptationTime:]_block_invoke_3", v9];
    *(_DWORD *)buf = 138412290;
    v12 = v10;
    _os_log_debug_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  v5 = +[TIKeyboardAssertionManager sharedAssertionManager];
  [v5 releaseBackgroundActivityAssertion];

  return [*(id *)(a1 + 32) setCurrentLearningTask:0];
}

- (BOOL)continueLearningTaskWithStrategy:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4E7C3D0]();
  id v6 = [(TILanguageModelOfflineLearningAgent *)self currentLearningTask];
  v7 = [v6 dataSource];
  v8 = [v7 nextOutgoingMessageBatch];

  if (v8)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v9 = TIOSLogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v25 = NSString;
        uint64_t v26 = [v8 count];
        v27 = [v6 clientIdentifier];
        v28 = [v25 stringWithFormat:@"%s Retrieved %lu messages from %@ for %@", "-[TILanguageModelOfflineLearningAgent continueLearningTaskWithStrategy:]", v26, v6, v27];
        *(_DWORD *)buf = 138412290;
        v38 = v28;
        _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    v10 = [v4 filterMessages:v8];

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v32 + 1) + 8 * i) recipient];
          uint64_t v18 = (void *)[v17 copy];

          if ([v18 length]) {
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v14);
    }

    v19 = +[TILanguageModelOfflineLearningAgent contactRecordsForRecipients:v11];
    char v20 = [v4 learnMessages:v12 withRecipientRecords:v19];
  }
  else
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel)
    {
      id v21 = TIOSLogFacility();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v29 = NSString;
        v30 = [v6 clientIdentifier];
        v31 = [v29 stringWithFormat:@"%s Finished importing data for %@", "-[TILanguageModelOfflineLearningAgent continueLearningTaskWithStrategy:]", v30];
        *(_DWORD *)buf = 138412290;
        v38 = v31;
        _os_log_debug_impl(&dword_1E3F0E000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [v4 didFinishLearning];
    v22 = [(TILanguageModelOfflineLearningAgent *)self currentLearningTask];
    [v22 didFinishLearning];

    v23 = objc_opt_class();
    id v12 = [(TILanguageModelOfflineLearningAgent *)self currentLearningTask];
    [v23 didFinishLearningWithAgent:self task:v12];
    char v20 = 0;
  }

  return v20;
}

- (TILanguageModelOfflineLearningAgent)init
{
  v7.receiver = self;
  v7.super_class = (Class)TILanguageModelOfflineLearningAgent;
  id v2 = [(TILanguageModelOfflineLearningAgent *)&v7 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.TextInput.language-model.offline-learning", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)contactRecordsForRecipients:(id)a3
{
  return TIAddressBookFindRecordsMatchingRecipients(a3);
}

+ (id)sharedLearningAgent
{
  if (+[TILanguageModelOfflineLearningAgent sharedLearningAgent]::onceToken != -1) {
    dispatch_once(&+[TILanguageModelOfflineLearningAgent sharedLearningAgent]::onceToken, &__block_literal_global_23295);
  }
  id v2 = (void *)+[TILanguageModelOfflineLearningAgent sharedLearningAgent]::__sharedInstance;

  return v2;
}

uint64_t __58__TILanguageModelOfflineLearningAgent_sharedLearningAgent__block_invoke()
{
  v0 = objc_alloc_init(TILanguageModelOfflineLearningAgent);
  uint64_t v1 = +[TILanguageModelOfflineLearningAgent sharedLearningAgent]::__sharedInstance;
  +[TILanguageModelOfflineLearningAgent sharedLearningAgent]::__sharedInstance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end