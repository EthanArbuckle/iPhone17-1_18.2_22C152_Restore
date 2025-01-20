@interface PHASharingSuggestionGenerationTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSDictionary)suggestionOptionsDictionary;
- (NSString)name;
- (double)period;
- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)setSuggestionOptionsDictionary:(id)a3;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHASharingSuggestionGenerationTask

- (void).cxx_destruct
{
}

- (void)setSuggestionOptionsDictionary:(id)a3
{
}

- (NSDictionary)suggestionOptionsDictionary
{
  return self->_suggestionOptionsDictionary;
}

- (id)generateSuggestionsWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  v9 = [[PHASuggestionController alloc] initWithGraphManager:v8];

  if (self->_suggestionOptionsDictionary) {
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F8D920]) initWithOptionsDictionary:self->_suggestionOptionsDictionary];
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x1E4F8D920]);
  }
  v11 = v10;
  [v10 setDefaultStartAndEndDatesIfNeeded];
  [(PHASuggestionController *)v9 ingestExistingSuggestionsWithOptions:v11];
  if (!self->_suggestionOptionsDictionary) {
    [v11 setAllowNotification:1];
  }
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __97__PHASharingSuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke;
  v22 = &unk_1E6918B08;
  id v12 = v7;
  id v23 = v12;
  v13 = [(PHASuggestionController *)v9 generateSharingSuggestionsWithOptions:v11 progress:&v19];
  if (objc_msgSend(v11, "discardGeneratedSuggestions", v19, v20, v21, v22))
  {
    uint64_t v24 = *MEMORY[0x1E4F8B110];
    v25 = v13;
    v14 = (void *)MEMORY[0x1E4F1C9E8];
    v15 = &v25;
    v16 = &v24;
  }
  else
  {
    uint64_t v26 = *MEMORY[0x1E4F8B118];
    v27[0] = v13;
    v14 = (void *)MEMORY[0x1E4F1C9E8];
    v15 = (void **)v27;
    v16 = &v26;
  }
  v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];

  return v17;
}

uint64_t __97__PHASharingSuggestionGenerationTask_generateSuggestionsWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHASharingSuggestionGenerationTask timeoutFatal:]", "PHASharingSuggestionGenerationTask.m", 85, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHASharingSuggestionGenerationTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  v5 = [(PHASharingSuggestionGenerationTask *)self generateSuggestionsWithGraphManager:a3 progressReporter:a4 error:a5];
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v3 = a3;
  v4 = [v3 workingContext];
  v5 = [v4 photoLibrary];
  char v6 = [v5 isCloudPhotoLibraryEnabled];

  if (v6)
  {
    char v7 = [v3 isReady];
  }
  else
  {
    id v8 = [v4 loggingConnection];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_INFO, "[PHASharingSuggestionGenerationTask] Not running sharing suggestion task because cloud photo library is not enabled", v10, 2u);
    }

    char v7 = 0;
  }

  return v7;
}

- (int)priority
{
  return -1;
}

- (id)taskClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (double)period
{
  return -2.0;
}

- (NSString)name
{
  return (NSString *)@"PHASharingSuggestionGenerationTask";
}

@end