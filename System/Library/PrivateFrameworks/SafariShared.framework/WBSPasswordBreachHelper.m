@interface WBSPasswordBreachHelper
- (void)addResultRecordDictionaries:(id)a3 completionHandler:(id)a4;
- (void)clearAllRecordsWithCompletionHandler:(id)a3;
- (void)clearRecentlyBreachedResultRecordsWithCompletionHandler:(id)a3;
- (void)getPasswordEvaluationsForPersistentIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getResultRecordDictionariesForResultQueryDictionaries:(id)a3 withCompletionHandler:(id)a4;
- (void)recentlyBreachedResultRecordDictionariesWithCompletionHandler:(id)a3;
- (void)runLookupSessionIgnoringMinimumDelay:(BOOL)a3 completionHandler:(id)a4;
- (void)writePasswordEvaluationsToCache:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSPasswordBreachHelper

- (void)runLookupSessionIgnoringMinimumDelay:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__WBSPasswordBreachHelper_runLookupSessionIgnoringMinimumDelay_completionHandler___block_invoke;
  v7[3] = &unk_1E5C9E648;
  id v8 = v5;
  BOOL v9 = a3;
  id v6 = v5;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:v7];
}

void __82__WBSPasswordBreachHelper_runLookupSessionIgnoringMinimumDelay_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __82__WBSPasswordBreachHelper_runLookupSessionIgnoringMinimumDelay_completionHandler___block_invoke_2;
    v5[3] = &unk_1E5C9E620;
    id v6 = *(id *)(a1 + 32);
    [a2 performNextSessionLookupIgnoringMinimumDelay:v3 completionHandler:v5];
  }
  else
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

uint64_t __82__WBSPasswordBreachHelper_runLookupSessionIgnoringMinimumDelay_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getResultRecordDictionariesForResultQueryDictionaries:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F97F20] resultQueriesFromDictionaryRepresentations:a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __103__WBSPasswordBreachHelper_getResultRecordDictionariesForResultQueryDictionaries_withCompletionHandler___block_invoke;
  v9[3] = &unk_1E5C9E670;
  id v10 = v6;
  id v11 = v5;
  id v7 = v6;
  id v8 = v5;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:v9];
}

void __103__WBSPasswordBreachHelper_getResultRecordDictionariesForResultQueryDictionaries_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v5 = [a2 resultRecordsForQueries:*(void *)(a1 + 32)];
    uint64_t v3 = [MEMORY[0x1E4F97F28] dictionaryRepresentationsForResultRecords:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

- (void)recentlyBreachedResultRecordDictionariesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__WBSPasswordBreachHelper_recentlyBreachedResultRecordDictionariesWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E5C9E698;
  id v6 = v3;
  id v4 = v3;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:v5];
}

void __89__WBSPasswordBreachHelper_recentlyBreachedResultRecordDictionariesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v5 = [a2 recentlyBreachedResultRecords];
    id v3 = [MEMORY[0x1E4F97F28] dictionaryRepresentationsForResultRecords:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

- (void)clearRecentlyBreachedResultRecordsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__WBSPasswordBreachHelper_clearRecentlyBreachedResultRecordsWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E5C9E698;
  id v6 = v3;
  id v4 = v3;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:v5];
}

uint64_t __83__WBSPasswordBreachHelper_clearRecentlyBreachedResultRecordsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 clearRecentlyBreachedResultRecords];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (void)clearAllRecordsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__WBSPasswordBreachHelper_clearAllRecordsWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E5C9E698;
  id v6 = v3;
  id v4 = v3;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:v5];
}

void __64__WBSPasswordBreachHelper_clearAllRecordsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __64__WBSPasswordBreachHelper_clearAllRecordsWithCompletionHandler___block_invoke_2;
    v4[3] = &unk_1E5C8CDC8;
    id v5 = *(id *)(a1 + 32);
    [a2 clearAllRecordsWithCompletionHandler:v4];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

uint64_t __64__WBSPasswordBreachHelper_clearAllRecordsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addResultRecordDictionaries:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F97F28] resultRecordsFromDictionaryRepresentations:a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__WBSPasswordBreachHelper_addResultRecordDictionaries_completionHandler___block_invoke;
  v9[3] = &unk_1E5C9E670;
  id v10 = v6;
  id v11 = v5;
  id v7 = v6;
  id v8 = v5;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:v9];
}

uint64_t __73__WBSPasswordBreachHelper_addResultRecordDictionaries_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 addResultRecords:*(void *)(a1 + 32)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)getPasswordEvaluationsForPersistentIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __92__WBSPasswordBreachHelper_getPasswordEvaluationsForPersistentIdentifiers_completionHandler___block_invoke;
  v9[3] = &unk_1E5C9E670;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:v9];
}

uint64_t __92__WBSPasswordBreachHelper_getPasswordEvaluationsForPersistentIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 getPasswordEvaluationsForPersistentIdentifiers:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)writePasswordEvaluationsToCache:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__WBSPasswordBreachHelper_writePasswordEvaluationsToCache_completionHandler___block_invoke;
  v9[3] = &unk_1E5C9E670;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  +[WBSPasswordBreachManager getSharedManagerWithCompletionHandler:v9];
}

uint64_t __77__WBSPasswordBreachHelper_writePasswordEvaluationsToCache_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 writePasswordEvaluationsToStore:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end