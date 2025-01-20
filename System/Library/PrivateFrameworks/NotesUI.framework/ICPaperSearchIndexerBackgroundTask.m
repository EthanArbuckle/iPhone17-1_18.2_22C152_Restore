@interface ICPaperSearchIndexerBackgroundTask
+ (id)makeTaskRequest;
- (ICNoteContext)noteContext;
- (ICPaperSearchIndexerBackgroundTask)initWithNoteContext:(id)a3;
- (void)didRegister:(BOOL)a3;
- (void)handleTaskExpiration;
- (void)runTaskWithCompletion:(id)a3;
@end

@implementation ICPaperSearchIndexerBackgroundTask

void __50__ICPaperSearchIndexerBackgroundTask_didRegister___block_invoke(uint64_t a1, int a2)
{
  v3 = os_log_create("com.apple.notes", "SystemPaper");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v4) {
      __50__ICPaperSearchIndexerBackgroundTask_didRegister___block_invoke_cold_1();
    }

    v3 = [MEMORY[0x1E4F83300] sharedScheduler];
    [v3 scheduleTask:objc_opt_class() completion:0];
  }
  else if (v4)
  {
    __50__ICPaperSearchIndexerBackgroundTask_didRegister___block_invoke_cold_2();
  }
}

void __50__ICPaperSearchIndexerBackgroundTask_didRegister___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "No paper attachments needing index update", v2, v3, v4, v5, v6);
}

- (void)didRegister:(BOOL)a3
{
  uint64_t v4 = [(ICPaperSearchIndexerBackgroundTask *)self noteContext];
  uint64_t v5 = [v4 workerManagedObjectContext];

  uint8_t v6 = +[ICPaperSearchIndexer shared];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ICPaperSearchIndexerBackgroundTask_didRegister___block_invoke;
  v7[3] = &unk_1E5FDBD08;
  v7[4] = self;
  [v6 needsToUpdateIndexWithManagedObjectContext:v5 completionHandler:v7];
}

- (ICNoteContext)noteContext
{
  return self->_noteContext;
}

+ (id)makeTaskRequest
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F18B40]) initWithIdentifier:@"com.apple.notes.paper.indexer"];
  [v2 setRequiresExternalPower:1];
  return v2;
}

- (ICPaperSearchIndexerBackgroundTask)initWithNoteContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPaperSearchIndexerBackgroundTask;
  uint8_t v6 = [(ICPaperSearchIndexerBackgroundTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_noteContext, a3);
  }

  return v7;
}

- (void)runTaskWithCompletion:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F837E8] postBasicEvent:25];
  id v5 = [(ICPaperSearchIndexerBackgroundTask *)self noteContext];
  uint8_t v6 = [v5 workerManagedObjectContext];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke;
  v9[3] = &unk_1E5FD8F48;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  [v8 performBlock:v9];
}

void __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_cold_1();
  }

  uint64_t v3 = +[ICPaperSearchIndexer shared];
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_16;
  v5[3] = &unk_1E5FD8F48;
  id v6 = v4;
  id v7 = *(id *)(a1 + 40);
  [v3 updateIndexWithManagedObjectContext:v6 completionHandler:v5];
}

void __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_16(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_2;
  v3[3] = &unk_1E5FD8F48;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  [v4 performBlock:v3];
}

uint64_t __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_2_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", @"PaperKit indexer background task");
  [MEMORY[0x1E4F837E8] postBasicEvent:26];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)handleTaskExpiration
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Summary generation background task expiring", v2, v3, v4, v5, v6);
}

- (void).cxx_destruct
{
}

void __50__ICPaperSearchIndexerBackgroundTask_didRegister___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Found paper attachments needing index update", v2, v3, v4, v5, v6);
}

void __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Starting paper search indexer background task", v2, v3, v4, v5, v6);
}

void __60__ICPaperSearchIndexerBackgroundTask_runTaskWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1B08EB000, v0, v1, "Finished paper search indexer background task", v2, v3, v4, v5, v6);
}

@end