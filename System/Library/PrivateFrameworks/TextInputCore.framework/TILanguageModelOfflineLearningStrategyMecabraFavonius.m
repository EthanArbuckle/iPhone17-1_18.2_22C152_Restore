@interface TILanguageModelOfflineLearningStrategyMecabraFavonius
- (BOOL)incrementUsageCountsForMessages:(id)a3 withAdaptationContext:(id)a4;
- (BOOL)learnMessages:(id)a3 withRecipientRecords:(id)a4;
- (TILanguageModelOfflineLearningStrategyMecabraFavonius)initWithClientIdentifier:(id)a3;
- (TILanguageModelOfflineLearningTask)learningTask;
- (id)filterMessages:(id)a3;
- (id)identifyLanguagesForMessages:(id)a3;
@end

@implementation TILanguageModelOfflineLearningStrategyMecabraFavonius

- (void).cxx_destruct
{
}

- (TILanguageModelOfflineLearningTask)learningTask
{
  return (TILanguageModelOfflineLearningTask *)objc_getProperty(self, a2, 8, 1);
}

- (id)identifyLanguagesForMessages:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__23265;
  v25[4] = __Block_byref_object_dispose__23266;
  id v26 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __86__TILanguageModelOfflineLearningStrategyMecabraFavonius_identifyLanguagesForMessages___block_invoke;
  v23 = &unk_1E6E2E248;
  v24 = v25;
  TIDispatchSync();
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "body", (void)v16);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v30.length = [(__CFString *)v11 length];
        v30.location = 0;
        CFStringRef v12 = CFStringTokenizerCopyBestStringLanguage(v11, v30);
        if (v12)
        {
          CFStringRef v13 = v12;
          id v14 = [v4 objectForKey:v12];
          if (!v14)
          {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v4 setObject:v14 forKey:v13];
          }
          [v14 addObject:v10];

          CFRelease(v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v27 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(v25, 8);

  return v4;
}

void __86__TILanguageModelOfflineLearningStrategyMecabraFavonius_identifyLanguagesForMessages___block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  v2 = [v6 enabledInputModeIdentifiers];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)learnMessages:(id)a3 withRecipientRecords:(id)a4
{
  v23 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count") + 1);
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count") + 1);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        CFStringRef v13 = objc_msgSend(v12, "recipient", v23);
        id v14 = [v6 objectForKey:v13];

        uint64_t v15 = [v14 objectForKey:@"compositeName"];
        long long v16 = (void *)v15;
        long long v17 = &stru_1F3F7A998;
        if (v15) {
          long long v17 = (__CFString *)v15;
        }
        long long v18 = v17;

        if (v14) {
          [v25 setObject:v14 forKey:v18];
        }
        id v19 = [v7 objectForKey:v18];
        if (!v19)
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v7 setObject:v19 forKey:v18];
        }
        [v19 addObject:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v9);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __92__TILanguageModelOfflineLearningStrategyMecabraFavonius_learnMessages_withRecipientRecords___block_invoke;
  v26[3] = &unk_1E6E2E180;
  v26[4] = v23;
  id v27 = v25;
  uint64_t v28 = &v33;
  id v20 = v25;
  [v7 enumerateKeysAndObjectsUsingBlock:v26];
  char v21 = *((unsigned char *)v34 + 24);

  _Block_object_dispose(&v33, 8);
  return v21;
}

void __92__TILanguageModelOfflineLearningStrategyMecabraFavonius_learnMessages_withRecipientRecords___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v7 learningTask];
  uint64_t v10 = [v9 clientIdentifier];

  v11 = [*(id *)(a1 + 40) objectForKey:v8];

  CFStringRef v12 = [[TILanguageModelAdaptationContext alloc] initWithClientIdentifier:v10 andRecipientRecord:v11];
  [(TILanguageModelAdaptationContext *)v12 setIsOnline:0];
  if (v12) {
    char v13 = [*(id *)(a1 + 32) incrementUsageCountsForMessages:v14 withAdaptationContext:v12];
  }
  else {
    char v13 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
}

- (BOOL)incrementUsageCountsForMessages:(id)a3 withAdaptationContext:(id)a4
{
  id v6 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  uint64_t v7 = [(TILanguageModelOfflineLearningStrategyMecabraFavonius *)self identifyLanguagesForMessages:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __111__TILanguageModelOfflineLearningStrategyMecabraFavonius_incrementUsageCountsForMessages_withAdaptationContext___block_invoke;
  v10[3] = &unk_1E6E2E180;
  id v11 = v6;
  CFStringRef v12 = &v13;
  v10[4] = self;
  id v8 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
  LOBYTE(v6) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v6;
}

void __111__TILanguageModelOfflineLearningStrategyMecabraFavonius_incrementUsageCountsForMessages_withAdaptationContext___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v7 = (void *)a1[4];
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v7 learningTask];
  char v11 = [v10 incrementUsageCountsForMessages:v8 forLanguage:v9 adaptationContext:a1[5]];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v11;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    *a4 = 1;
  }
}

- (id)filterMessages:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v7 = [v6 dateByAddingUnit:8 value:-9 toDate:v5 options:0];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __72__TILanguageModelOfflineLearningStrategyMecabraFavonius_filterMessages___block_invoke;
  char v16 = &unk_1E6E2E158;
  id v17 = v5;
  id v18 = v7;
  id v8 = v7;
  id v9 = v5;
  uint64_t v10 = [v4 indexesOfObjectsPassingTest:&v13];
  char v11 = objc_msgSend(v4, "objectsAtIndexes:", v10, v13, v14, v15, v16);

  return v11;
}

BOOL __72__TILanguageModelOfflineLearningStrategyMecabraFavonius_filterMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 body];
  uint64_t v5 = [v4 length];

  if (v5
    && ((objc_opt_respondsToSelector() & 1) == 0 || [v3 fromMe])
    && ([v3 dateSent],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 laterDate:*(void *)(a1 + 32)],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = *(void **)(a1 + 32),
        v7,
        v6,
        v7 == v8))
  {
    char v11 = [v3 dateSent];
    CFStringRef v12 = [v11 earlierDate:*(void *)(a1 + 40)];
    BOOL v9 = v12 == *(void **)(a1 + 40);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (TILanguageModelOfflineLearningStrategyMecabraFavonius)initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TILanguageModelOfflineLearningStrategyMecabraFavonius;
  uint64_t v5 = [(TILanguageModelOfflineLearningStrategyMecabraFavonius *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[TILanguageModelOfflineLearningTask taskWithClientIdentifier:v4 oneTimeTask:1];
    learningTask = v5->_learningTask;
    v5->_learningTask = (TILanguageModelOfflineLearningTask *)v6;
  }
  return v5;
}

@end