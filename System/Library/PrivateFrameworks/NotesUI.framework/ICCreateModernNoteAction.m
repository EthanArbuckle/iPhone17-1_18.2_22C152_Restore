@interface ICCreateModernNoteAction
- (ICCreateModernNoteAction)initWithManagedObjectContext:(id)a3 folder:(id)a4;
- (ICFolder)folder;
- (NSManagedObjectContext)context;
- (id)performWithTitle:(id)a3 contents:(id)a4 error:(id *)a5;
@end

@implementation ICCreateModernNoteAction

- (ICCreateModernNoteAction)initWithManagedObjectContext:(id)a3 folder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICCreateModernNoteAction;
  v9 = [(ICCreateModernNoteAction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_folder, a4);
  }

  return v10;
}

- (id)performWithTitle:(id)a3 contents:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__49;
  v32 = __Block_byref_object_dispose__49;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__49;
  v26 = __Block_byref_object_dispose__49;
  id v27 = 0;
  if ([v8 length])
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8];
    if ([v9 length])
    {
      objc_msgSend(v10, "ic_appendString:", @"\n");
      v11 = (void *)[v9 mutableCopy];
      [v11 insertAttributedString:v10 atIndex:0];
    }
    else
    {
      v11 = (void *)[v10 mutableCopy];
    }
  }
  else
  {
    v11 = (void *)[v9 mutableCopy];
    v10 = 0;
  }
  objc_super v12 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ICCreateModernNoteAction performWithTitle:contents:error:](buf, [v11 length], objc_msgSend(v11, "hash"), v12);
  }

  v13 = [(ICCreateModernNoteAction *)self context];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__ICCreateModernNoteAction_performWithTitle_contents_error___block_invoke;
  v18[3] = &unk_1E5FDCFE0;
  v18[4] = self;
  v20 = &v22;
  id v14 = v11;
  id v19 = v14;
  v21 = &v28;
  [v13 performBlockAndWait:v18];

  if (a5)
  {
    v15 = (void *)v29[5];
    if (v15) {
      *a5 = v15;
    }
  }
  id v16 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __60__ICCreateModernNoteAction_performWithTitle_contents_error___block_invoke(uint64_t a1)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) folder];
  int v3 = [v2 canMoveAddOrDeleteContents];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F83418];
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = [*(id *)(a1 + 32) folder];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v7 + 40);
    uint64_t v8 = [v4 newNoteWithAttributedString:v5 inFolder:v6 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      return;
    }
    v11 = [*(id *)(a1 + 32) context];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v28 = *(id *)(v12 + 40);
    [v11 save:&v28];
    id v13 = v28;
    id v14 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }
  else
  {
    v15 = [*(id *)(a1 + 32) folder];
    int v16 = [v15 isSharedReadOnly];

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F83668];
      uint64_t v34 = *MEMORY[0x1E4F83680];
      v35[0] = @"Can't create a note in the specified folder because it is read only";
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      id v19 = v17;
      uint64_t v20 = v18;
      uint64_t v21 = 228;
    }
    else
    {
      uint64_t v22 = [*(id *)(a1 + 32) folder];
      int v23 = [v22 isSmartFolder];

      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F83668];
      if (v23)
      {
        uint64_t v32 = *MEMORY[0x1E4F83680];
        id v33 = @"Can't create a note in the specified folder because it is a smart folder";
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        id v19 = v24;
        uint64_t v20 = v25;
        uint64_t v21 = 229;
      }
      else
      {
        uint64_t v30 = *MEMORY[0x1E4F83680];
        v31 = @"Can't create a note in the specified folder";
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        id v19 = v24;
        uint64_t v20 = v25;
        uint64_t v21 = 218;
      }
    }
    uint64_t v26 = [v19 errorWithDomain:v20 code:v21 userInfo:v11];
    uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
    id v14 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
  }
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)performWithTitle:(uint64_t)a3 contents:(os_log_t)log error:.cold.1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "About to create note with content length %lu and hash %lu", buf, 0x16u);
}

@end