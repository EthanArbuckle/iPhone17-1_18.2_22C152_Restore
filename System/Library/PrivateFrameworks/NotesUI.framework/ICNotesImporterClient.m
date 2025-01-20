@interface ICNotesImporterClient
- (ICNotesImporterClient)init;
- (OS_dispatch_queue)requestCountQueue;
- (unint64_t)requestCount;
- (void)archiveEvernoteNotesFromBookmarkData:(id)a3 completionBlock:(id)a4;
- (void)cleanupArchiveId:(id)a3 completionBlock:(id)a4;
- (void)countEvernoteNotesFromBookmarkData:(id)a3 completionBlock:(id)a4;
- (void)parseHTMLStringFromEvernoteContentString:(id)a3 completionBlock:(id)a4;
- (void)parseTitleFromHTMLString:(id)a3 completionBlock:(id)a4;
- (void)resumeConnectionIfNeeded;
- (void)setRequestCount:(unint64_t)a3;
- (void)setRequestCountQueue:(id)a3;
- (void)suspendConnectionIfNeeded;
- (void)unarchiveEvernoteNoteFromArchiveId:(id)a3 noteArchiveId:(id)a4 completionBlock:(id)a5;
- (void)unarchiveEvernoteResourceFromArchiveId:(id)a3 resourceArchiveId:(id)a4 completionBlock:(id)a5;
@end

@implementation ICNotesImporterClient

- (ICNotesImporterClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICNotesImporterClient;
  v2 = [(ICNotesImporterClient *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.notes.NotesImporter", v3);
    requestCountQueue = v2->_requestCountQueue;
    v2->_requestCountQueue = (OS_dispatch_queue *)v4;

    v2->_requestCount = 0;
  }
  return v2;
}

- (void)parseHTMLStringFromEvernoteContentString:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICNotesImporterClient *)self resumeConnectionIfNeeded];
  connectionToService = self->_connectionToService;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke;
  v14[3] = &unk_1E5FDB140;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  v10 = [(NSXPCConnection *)connectionToService remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_8;
  v12[3] = &unk_1E5FDB168;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 parseHTMLStringFromEvernoteContentString:v7 completionBlock:v12];
}

void __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_8(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)countEvernoteNotesFromBookmarkData:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICNotesImporterClient *)self resumeConnectionIfNeeded];
  v8 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__ICNotesImporterClient_countEvernoteNotesFromBookmarkData_completionBlock___block_invoke;
  v14[3] = &unk_1E5FDB140;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__ICNotesImporterClient_countEvernoteNotesFromBookmarkData_completionBlock___block_invoke_10;
  v12[3] = &unk_1E5FDB190;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 countEvernoteNotesFromBookmarkData:v7 completionBlock:v12];
}

void __76__ICNotesImporterClient_countEvernoteNotesFromBookmarkData_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

uint64_t __76__ICNotesImporterClient_countEvernoteNotesFromBookmarkData_completionBlock___block_invoke_10(uint64_t a1)
{
  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)parseTitleFromHTMLString:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICNotesImporterClient *)self resumeConnectionIfNeeded];
  v8 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__ICNotesImporterClient_parseTitleFromHTMLString_completionBlock___block_invoke;
  v14[3] = &unk_1E5FDB140;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__ICNotesImporterClient_parseTitleFromHTMLString_completionBlock___block_invoke_12;
  v12[3] = &unk_1E5FDB168;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 parseTitleFromHTMLString:v7 completionBlock:v12];
}

void __66__ICNotesImporterClient_parseTitleFromHTMLString_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __66__ICNotesImporterClient_parseTitleFromHTMLString_completionBlock___block_invoke_12(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)archiveEvernoteNotesFromBookmarkData:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICNotesImporterClient *)self resumeConnectionIfNeeded];
  v8 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__ICNotesImporterClient_archiveEvernoteNotesFromBookmarkData_completionBlock___block_invoke;
  v14[3] = &unk_1E5FDB140;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__ICNotesImporterClient_archiveEvernoteNotesFromBookmarkData_completionBlock___block_invoke_13;
  v12[3] = &unk_1E5FDB1B8;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 archiveEvernoteNotesFromBookmarkData:v7 completionBlock:v12];
}

void __78__ICNotesImporterClient_archiveEvernoteNotesFromBookmarkData_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __78__ICNotesImporterClient_archiveEvernoteNotesFromBookmarkData_completionBlock___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

- (void)unarchiveEvernoteNoteFromArchiveId:(id)a3 noteArchiveId:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(ICNotesImporterClient *)self resumeConnectionIfNeeded];
  id v11 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxy];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__ICNotesImporterClient_unarchiveEvernoteNoteFromArchiveId_noteArchiveId_completionBlock___block_invoke;
  v17[3] = &unk_1E5FDB140;
  v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__ICNotesImporterClient_unarchiveEvernoteNoteFromArchiveId_noteArchiveId_completionBlock___block_invoke_15;
  v15[3] = &unk_1E5FDB1E0;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 unarchiveEvernoteNoteFromArchiveId:v10 noteArchiveId:v9 completionBlock:v15];
}

void __90__ICNotesImporterClient_unarchiveEvernoteNoteFromArchiveId_noteArchiveId_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __90__ICNotesImporterClient_unarchiveEvernoteNoteFromArchiveId_noteArchiveId_completionBlock___block_invoke_15(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)unarchiveEvernoteResourceFromArchiveId:(id)a3 resourceArchiveId:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(ICNotesImporterClient *)self resumeConnectionIfNeeded];
  id v11 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxy];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __98__ICNotesImporterClient_unarchiveEvernoteResourceFromArchiveId_resourceArchiveId_completionBlock___block_invoke;
  v17[3] = &unk_1E5FDB140;
  v17[4] = self;
  id v12 = v8;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__ICNotesImporterClient_unarchiveEvernoteResourceFromArchiveId_resourceArchiveId_completionBlock___block_invoke_17;
  v15[3] = &unk_1E5FDB208;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 unarchiveEvernoteResourceFromArchiveId:v10 resourceArchiveId:v9 completionBlock:v15];
}

void __98__ICNotesImporterClient_unarchiveEvernoteResourceFromArchiveId_resourceArchiveId_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __98__ICNotesImporterClient_unarchiveEvernoteResourceFromArchiveId_resourceArchiveId_completionBlock___block_invoke_17(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)cleanupArchiveId:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICNotesImporterClient *)self resumeConnectionIfNeeded];
  id v8 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__ICNotesImporterClient_cleanupArchiveId_completionBlock___block_invoke;
  v14[3] = &unk_1E5FDB140;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__ICNotesImporterClient_cleanupArchiveId_completionBlock___block_invoke_19;
  v12[3] = &unk_1E5FD8F48;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 cleanupArchiveId:v7 completionBlock:v12];
}

void __58__ICNotesImporterClient_cleanupArchiveId_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __58__ICNotesImporterClient_cleanupArchiveId_completionBlock___block_invoke_19(uint64_t a1)
{
  [*(id *)(a1 + 32) suspendConnectionIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)resumeConnectionIfNeeded
{
  id v3 = [(ICNotesImporterClient *)self requestCountQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ICNotesImporterClient_resumeConnectionIfNeeded__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __49__ICNotesImporterClient_resumeConnectionIfNeeded__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[1])
  {
    if (![v2 requestCount]) {
      [*(id *)(*(void *)(a1 + 32) + 8) resume];
    }
  }
  else
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    id v4 = ICNotesImporterBundleIdentifier();
    uint64_t v5 = [v3 initWithServiceName:v4];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v5;

    id v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0A65938];
    [*(id *)(*(void *)(a1 + 32) + 8) setRemoteObjectInterface:v8];
    [*(id *)(*(void *)(a1 + 32) + 8) resume];
  }
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v9 requestCount] + 1;
  return [v9 setRequestCount:v10];
}

- (void)suspendConnectionIfNeeded
{
  id v3 = [(ICNotesImporterClient *)self requestCountQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ICNotesImporterClient_suspendConnectionIfNeeded__block_invoke;
  block[3] = &unk_1E5FD8DF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __50__ICNotesImporterClient_suspendConnectionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) requestCount];
  if (result)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRequestCount:", objc_msgSend(*(id *)(a1 + 32), "requestCount") - 1);
    uint64_t result = [*(id *)(a1 + 32) requestCount];
    if (!result)
    {
      id v3 = *(void **)(*(void *)(a1 + 32) + 8);
      return [v3 suspend];
    }
  }
  return result;
}

- (OS_dispatch_queue)requestCountQueue
{
  return self->_requestCountQueue;
}

- (void)setRequestCountQueue:(id)a3
{
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCountQueue, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

void __82__ICNotesImporterClient_parseHTMLStringFromEvernoteContentString_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B08EB000, v0, v1, "Error reaching Notes Importer service: %@", v2, v3, v4, v5, v6);
}

@end