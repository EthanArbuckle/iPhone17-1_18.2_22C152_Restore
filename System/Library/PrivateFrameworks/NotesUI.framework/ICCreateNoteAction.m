@interface ICCreateNoteAction
- (BOOL)allowsNoContent;
- (ICCreateNoteAction)initWithNoteContext:(id)a3;
- (ICUnifiedNoteContext)noteContext;
- (id)performWithTitle:(id)a3 contents:(id)a4 container:(id)a5 error:(id *)a6;
- (void)setAllowsNoContent:(BOOL)a3;
@end

@implementation ICCreateNoteAction

- (ICCreateNoteAction)initWithNoteContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCreateNoteAction;
  v6 = [(ICCreateNoteAction *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_noteContext, a3);
    v7->_allowsNoContent = 0;
  }

  return v7;
}

- (id)performWithTitle:(id)a3 contents:(id)a4 container:(id)a5 error:(id *)a6
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 length]
    || [v10 length]
    || [(ICCreateNoteAction *)self allowsNoContent])
  {
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__22;
    v53 = __Block_byref_object_dispose__22;
    objc_opt_class();
    ICDynamicCast();
    id v54 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__22;
    v47 = __Block_byref_object_dispose__22;
    objc_opt_class();
    ICClassAndProtocolCast();
    id v48 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v50;
    if (!v44[5] && !v50[5])
    {
      v14 = (void *)MEMORY[0x1E4F83358];
      v15 = [(ICCreateNoteAction *)self noteContext];
      v16 = [v15 htmlNoteContext];
      v17 = [v14 defaultAccountWithHTMLNoteContext:v16];

      v18 = [v17 managedObjectContext];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke;
      v41[3] = &unk_1E5FD8DF0;
      id v19 = v17;
      id v42 = v19;
      [v18 performBlock:v41];

      objc_opt_class();
      v20 = ICDynamicCast();
      v38 = ICProtocolCast();
      if (v20)
      {
        v21 = [(ICCreateNoteAction *)self noteContext];
        v22 = [v21 modernManagedObjectContext];
        v23 = v40;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke_160;
        v40[3] = &unk_1E5FD91F8;
        v40[5] = &v49;
        v40[4] = v20;
        [v22 performBlockAndWait:v40];
      }
      else
      {
        if (!v38)
        {
          if (a6)
          {
            v33 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v34 = *MEMORY[0x1E4F83680];
            v56[0] = @"Unknown default account type";
            uint64_t v35 = *MEMORY[0x1E4F83670];
            v55[0] = v34;
            v55[1] = v35;
            v36 = v19;
            if (!v19)
            {
              v36 = [MEMORY[0x1E4F1CA98] null];
            }
            v56[1] = v36;
            v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
            *a6 = [v33 errorWithDomain:*MEMORY[0x1E4F83668] code:218 userInfo:v37];

            if (!v19) {
          }
            }
          a6 = 0;
          id v31 = v42;
          goto LABEL_19;
        }
        v21 = [(ICCreateNoteAction *)self noteContext];
        v22 = [v21 htmlManagedObjectContext];
        v23 = v39;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke_2;
        v39[3] = &unk_1E5FD91F8;
        v39[5] = &v43;
        v39[4] = v38;
        [v22 performBlockAndWait:v39];
      }

      v13 = v50;
    }
    if (v13[5])
    {
      v26 = [ICCreateModernNoteAction alloc];
      v27 = [(ICCreateNoteAction *)self noteContext];
      v28 = [v27 modernManagedObjectContext];
      uint64_t v29 = [(ICCreateModernNoteAction *)v26 initWithManagedObjectContext:v28 folder:v50[5]];
    }
    else
    {
      if (!v44[5])
      {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCreateNoteAction performWithTitle:contents:container:error:]" simulateCrash:1 showAlert:0 format:@"Expected a default folder to be set or an error returned"];
        a6 = 0;
        goto LABEL_21;
      }
      v30 = [ICCreateHTMLNoteAction alloc];
      v27 = [(ICCreateNoteAction *)self noteContext];
      v28 = [v27 htmlNoteContext];
      uint64_t v29 = [(ICCreateHTMLNoteAction *)v30 initWithHTMLNoteContext:v28 folder:v44[5]];
    }
    id v19 = (id)v29;

    a6 = [v19 performWithTitle:v10 contents:v11 error:a6];
    if (!a6)
    {
LABEL_20:

LABEL_21:
      _Block_object_dispose(&v43, 8);

      _Block_object_dispose(&v49, 8);
      goto LABEL_22;
    }
    id v31 = [MEMORY[0x1E4F83808] sharedWidget];
    [v31 reloadTimelinesWithReason:@"Note was created via automation"];
LABEL_19:

    goto LABEL_20;
  }
  if (a6)
  {
    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v57 = *MEMORY[0x1E4F83680];
    v58[0] = @"Attempted to create a note with no content";
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
    *a6 = [v24 errorWithDomain:*MEMORY[0x1E4F83668] code:218 userInfo:v25];

    a6 = 0;
  }
LABEL_22:

  return a6;
}

void __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke_cold_1(a1, v2);
  }
}

uint64_t __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke_160(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) defaultFolder];
  return MEMORY[0x1F41817F8]();
}

uint64_t __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) defaultFolder];
  return MEMORY[0x1F41817F8]();
}

- (ICUnifiedNoteContext)noteContext
{
  return self->_noteContext;
}

- (BOOL)allowsNoContent
{
  return self->_allowsNoContent;
}

- (void)setAllowsNoContent:(BOOL)a3
{
  self->_allowsNoContent = a3;
}

- (void).cxx_destruct
{
}

void __64__ICCreateNoteAction_performWithTitle_contents_container_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 32) description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "default account for Siri %@", (uint8_t *)&v4, 0xCu);
}

@end