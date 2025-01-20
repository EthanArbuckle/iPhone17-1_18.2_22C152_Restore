@interface TITypingDESRecordWriter
- (BOOL)shouldRecordToDES;
- (DESRecordStore)typingDataStore;
- (TITypingDESRecordWriter)init;
- (void)clearStoredRecordsWithCompletionHandler:(id)a3;
- (void)fetchRecords:(id)a3;
- (void)setTypingDataStore:(id)a3;
- (void)storeAlignedSession:(id)a3 completion:(id)a4;
- (void)storeTypingSession:(id)a3 containsCP:(BOOL)a4 completion:(id)a5;
@end

@implementation TITypingDESRecordWriter

- (void).cxx_destruct
{
}

- (void)setTypingDataStore:(id)a3
{
}

- (DESRecordStore)typingDataStore
{
  return self->_typingDataStore;
}

- (void)clearStoredRecordsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(TITypingDESRecordWriter *)self typingDataStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__TITypingDESRecordWriter_clearStoredRecordsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6E29D98;
  id v8 = v4;
  id v6 = v4;
  [v5 deleteAllSavedRecordsWithCompletion:v7];
}

uint64_t __67__TITypingDESRecordWriter_clearStoredRecordsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchRecords:(id)a3
{
  id v4 = a3;
  v5 = [(TITypingDESRecordWriter *)self typingDataStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__TITypingDESRecordWriter_fetchRecords___block_invoke;
  v7[3] = &unk_1E6E29D70;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchSavedRecordInfoWithCompletion:v7];
}

uint64_t __40__TITypingDESRecordWriter_fetchRecords___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)storeAlignedSession:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [a3 restrictedAlignedSessionWithWordLimit:20];
  id v13 = 0;
  id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v13];
  id v9 = v13;
  if (v9)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    uint64_t v10 = [v7 containsCPEntries];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__TITypingDESRecordWriter_storeAlignedSession_completion___block_invoke;
    v11[3] = &unk_1E6E29D48;
    id v12 = v6;
    [(TITypingDESRecordWriter *)self storeTypingSession:v8 containsCP:v10 completion:v11];
  }
}

uint64_t __58__TITypingDESRecordWriter_storeAlignedSession_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldRecordToDES
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
  }
  if (TI_IS_INTERNAL_INSTALL::is_internal_install) {
    return 1;
  }
  id v4 = [(TITypingDESRecordWriter *)self typingDataStore];
  char v5 = [v4 shouldMakeRecord];

  return v5;
}

- (void)storeTypingSession:(id)a3 containsCP:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v18[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([(TITypingDESRecordWriter *)self shouldRecordToDES])
  {
    v17[0] = @"source";
    v17[1] = @"type";
    v18[0] = @"TITypingDESRecordWriter";
    v18[1] = @"typingSession";
    v17[2] = @"timestamp";
    uint64_t v10 = NSNumber;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    v18[2] = v11;
    v17[3] = @"containsCP";
    id v12 = [NSNumber numberWithBool:v6];
    v18[3] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

    v14 = [(TITypingDESRecordWriter *)self typingDataStore];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__TITypingDESRecordWriter_storeTypingSession_containsCP_completion___block_invoke;
    v15[3] = &unk_1E6E29D20;
    id v16 = v9;
    [v14 saveRecordWithData:v8 recordInfo:v13 completion:v15];
  }
  else if (v9)
  {
    (*((void (**)(id, void, uint64_t))v9 + 2))(v9, 0, 1);
  }
}

void __68__TITypingDESRecordWriter_storeTypingSession_containsCP_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v6 localizedDescription];
    int v9 = 136315394;
    uint64_t v10 = "-[TITypingDESRecordWriter storeTypingSession:containsCP:completion:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Error: %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, BOOL))(v8 + 16))(v8, v5, v6 == 0);
  }
}

- (TITypingDESRecordWriter)init
{
  v6.receiver = self;
  v6.super_class = (Class)TITypingDESRecordWriter;
  v2 = [(TITypingDESRecordWriter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F5F4F8]) initWithBundleIdentifier:@"com.apple.TextInput.TypingDESPlugin"];
    typingDataStore = v2->_typingDataStore;
    v2->_typingDataStore = (DESRecordStore *)v3;
  }
  return v2;
}

@end