@interface TILanguageModelOfflineLearningTask
+ (TILanguageModelOfflineLearningTask)taskWithClientIdentifier:(id)a3 oneTimeTask:(BOOL)a4;
+ (id)dataSourceForTask;
- (BOOL)incrementUsageCountsForMessages:(id)a3 forLanguage:(id)a4 adaptationContext:(id)a5;
- (BOOL)incrementUsageCountsForMessages:(id)a3 withHandle:(id)a4;
- (BOOL)isCancelled;
- (BOOL)oneTimeTask;
- (NSCharacterSet)linePaddingCharacters;
- (NSMutableDictionary)handles;
- (NSSet)forwardedMessageSeparators;
- (NSString)clientIdentifier;
- (TILanguageModelOfflineLearningHandle)handleForLanguageLikelihood;
- (TILanguageModelOfflineLearningTask)initWithClientIdentifier:(id)a3 oneTimeTask:(BOOL)a4;
- (TILinguisticDataSource)dataSource;
- (id)handleForLanguage:(id)a3;
- (void)didFinishLearning;
- (void)enumerateHandlesForLanguage:(id)a3 withBlock:(id)a4;
- (void)setAdaptationContext:(id)a3 onHandle:(id)a4;
- (void)setCancelled:(BOOL)a3;
@end

@implementation TILanguageModelOfflineLearningTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_handleForLanguageLikelihood, 0);
}

- (NSMutableDictionary)handles
{
  return self->_handles;
}

- (BOOL)oneTimeTask
{
  return self->_oneTimeTask;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)didFinishLearning
{
  v3 = [(TILanguageModelOfflineLearningTask *)self handles];
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_126_17719];

  id v4 = [(TILanguageModelOfflineLearningTask *)self handleForLanguageLikelihood];
  [v4 didFinishLearning];
}

void __55__TILanguageModelOfflineLearningTask_didFinishLearning__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if ([v3 isValid]) {
    [v3 didFinishLearning];
  }
}

- (BOOL)incrementUsageCountsForMessages:(id)a3 forLanguage:(id)a4 adaptationContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__TILanguageModelOfflineLearningTask_incrementUsageCountsForMessages_forLanguage_adaptationContext___block_invoke;
  v13[3] = &unk_1E6E2D480;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  v16 = &v17;
  id v10 = v8;
  id v11 = v9;
  [(TILanguageModelOfflineLearningTask *)self enumerateHandlesForLanguage:a4 withBlock:v13];
  LOBYTE(a4) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)a4;
}

void __100__TILanguageModelOfflineLearningTask_incrementUsageCountsForMessages_forLanguage_adaptationContext___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 isValid])
  {
    [*(id *)(a1 + 32) setAdaptationContext:*(void *)(a1 + 40) onHandle:v8];
    if (![*(id *)(a1 + 32) oneTimeTask]
      || ([MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v8 lastAdaptationDate],
          id v4 = objc_claimAutoreleasedReturnValue(),
          int v5 = [v4 isEqualToDate:v3],
          v4,
          v3,
          v5))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      if (*(unsigned char *)(v6 + 24))
      {
        char v7 = [*(id *)(a1 + 32) incrementUsageCountsForMessages:*(void *)(a1 + 48) withHandle:v8];
        uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      }
      else
      {
        char v7 = 0;
      }
      *(unsigned char *)(v6 + 24) = v7;
    }
  }
}

- (void)enumerateHandlesForLanguage:(id)a3 withBlock:(id)a4
{
  uint64_t v6 = (void (**)(id, id))a4;
  id v8 = [(TILanguageModelOfflineLearningTask *)self handleForLanguage:a3];
  v6[2](v6, v8);
  char v7 = [(TILanguageModelOfflineLearningTask *)self handleForLanguageLikelihood];
  v6[2](v6, v7);
}

- (BOOL)incrementUsageCountsForMessages:(id)a3 withHandle:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = v6;
  uint64_t v32 = [v8 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v41;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(v8);
        }
        id v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
        id v11 = [v10 dateSent];
        v12 = [v7 lastAdaptationDate];
        v13 = [v11 earlierDate:v12];

        if (v13 != v11)
        {
          [v11 timeIntervalSinceReferenceDate];
          double v15 = v14;
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v17 = [v10 body];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __81__TILanguageModelOfflineLearningTask_incrementUsageCountsForMessages_withHandle___block_invoke;
          v38[3] = &unk_1E6E2D458;
          v38[4] = self;
          id v18 = v16;
          id v39 = v18;
          [v17 enumerateLinesUsingBlock:v38];

          if (TICanLogMessageAtLevel_onceToken != -1) {
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
          }
          if (TICanLogMessageAtLevel_logLevel >= 2)
          {
            uint64_t v19 = TIOSLogFacility();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v26 = NSString;
              v27 = [v7 inputMode];
              v28 = [v7 currentAdaptationContext];
              v29 = [v26 stringWithFormat:@"%s Adapting to message (language=%@, adaptationContext=%@): %@", "-[TILanguageModelOfflineLearningTask incrementUsageCountsForMessages:withHandle:]", v27, v28, v18];
              *(_DWORD *)buf = 138412290;
              v46 = v29;
              _os_log_debug_impl(&dword_1E3F0E000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v20 = v18;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v44 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v35;
            while (2)
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v35 != v23) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * i);
                if ([(TILanguageModelOfflineLearningTask *)self isCancelled])
                {

                  BOOL v30 = 0;
                  goto LABEL_27;
                }
                [v7 adaptToParagraph:v25 timeStamp:1 adaptationType:v15];
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v44 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }
        }
        ++v9;
      }
      while (v9 != v32);
      BOOL v30 = 1;
      uint64_t v32 = [v8 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v32);
  }
  else
  {
    BOOL v30 = 1;
  }
LABEL_27:

  return v30;
}

uint64_t __81__TILanguageModelOfflineLearningTask_incrementUsageCountsForMessages_withHandle___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v13 = a2;
  int v5 = [*(id *)(a1 + 32) linePaddingCharacters];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) linePaddingCharacters];
    uint64_t v7 = [v13 stringByTrimmingCharactersInSet:v6];

    id v13 = (id)v7;
  }
  id v8 = [*(id *)(a1 + 32) forwardedMessageSeparators];
  int v9 = [v8 containsObject:v13];

  if (v9)
  {
    *a3 = 1;
  }
  else
  {
    uint64_t v10 = [v13 length];
    id v11 = v13;
    if (!v10) {
      goto LABEL_8;
    }
    uint64_t v10 = [*(id *)(a1 + 40) addObject:v13];
  }
  id v11 = v13;
LABEL_8:

  return MEMORY[0x1F41817F8](v10, v11);
}

- (void)setAdaptationContext:(id)a3 onHandle:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [v5 currentAdaptationContext];
  if (v6 == v9)
  {
  }
  else
  {
    uint64_t v7 = [v5 currentAdaptationContext];
    char v8 = [v9 isEqual:v7];

    if ((v8 & 1) == 0) {
      [v5 updateAdaptationContext:v9];
    }
  }
}

- (id)handleForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__116;
  double v14 = __Block_byref_object_dispose__117;
  id v5 = [(TILanguageModelOfflineLearningTask *)self handles];
  id v15 = [v5 objectForKey:v4];

  id v6 = (void *)v11[5];
  if (!v6)
  {
    id v9 = v4;
    TIDispatchSync();

    id v6 = (void *)v11[5];
  }
  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __56__TILanguageModelOfflineLearningTask_handleForLanguage___block_invoke(uint64_t a1)
{
  v2 = TICanonicalInputModeName();
  id v7 = +[TIInputMode inputModeWithIdentifier:v2];

  uint64_t v3 = +[TILanguageModelOfflineLearningHandle handleForInputMode:v7];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isValid]) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) load];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = [*(id *)(a1 + 40) handles];
    [v6 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }
}

- (TILanguageModelOfflineLearningHandle)handleForLanguageLikelihood
{
  handleForLanguageLikelihood = self->_handleForLanguageLikelihood;
  if (!handleForLanguageLikelihood)
  {
    TIDispatchSync();
    handleForLanguageLikelihood = self->_handleForLanguageLikelihood;
  }

  return handleForLanguageLikelihood;
}

uint64_t __65__TILanguageModelOfflineLearningTask_handleForLanguageLikelihood__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[TILanguageModelOfflineLearningHandle handleForLanguageLikelihood];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSSet)forwardedMessageSeparators
{
  return 0;
}

- (NSCharacterSet)linePaddingCharacters
{
  return 0;
}

- (TILinguisticDataSource)dataSource
{
  return 0;
}

- (TILanguageModelOfflineLearningTask)initWithClientIdentifier:(id)a3 oneTimeTask:(BOOL)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TILanguageModelOfflineLearningTask;
  id v7 = [(TILanguageModelOfflineLearningTask *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    clientIdentifier = v7->_clientIdentifier;
    v7->_clientIdentifier = (NSString *)v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    handles = v7->_handles;
    v7->_handles = v10;

    v7->_oneTimeTask = a4;
  }

  return v7;
}

+ (TILanguageModelOfflineLearningTask)taskWithClientIdentifier:(id)a3 oneTimeTask:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = +[TILanguageModelOfflineLearningTask taskWithClientIdentifier:oneTimeTask:]::onceToken;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&+[TILanguageModelOfflineLearningTask taskWithClientIdentifier:oneTimeTask:]::onceToken, &__block_literal_global_17732);
  }
  id v7 = [(id)+[TILanguageModelOfflineLearningTask taskWithClientIdentifier:oneTimeTask:]::learningTaskClasses objectForKey:v6];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "alloc"), "initWithClientIdentifier:oneTimeTask:", v6, v4);

  return (TILanguageModelOfflineLearningTask *)v8;
}

void __75__TILanguageModelOfflineLearningTask_taskWithClientIdentifier_oneTimeTask___block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.mobilemail";
  v2[1] = @"com.apple.MobileSMS";
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)+[TILanguageModelOfflineLearningTask taskWithClientIdentifier:oneTimeTask:]::learningTaskClasses;
  +[TILanguageModelOfflineLearningTask taskWithClientIdentifier:oneTimeTask:]::learningTaskClasses = v0;
}

+ (id)dataSourceForTask
{
  return 0;
}

@end