@interface ICCreateHTMLNoteAction
- (ICCreateHTMLNoteAction)initWithHTMLNoteContext:(id)a3 folder:(id)a4;
- (ICLegacyContext)context;
- (ICLegacyFolder)folder;
- (id)performWithTitle:(id)a3 contents:(id)a4 error:(id *)a5;
@end

@implementation ICCreateHTMLNoteAction

- (ICCreateHTMLNoteAction)initWithHTMLNoteContext:(id)a3 folder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICCreateHTMLNoteAction;
  v9 = [(ICCreateHTMLNoteAction *)&v12 init];
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
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__79;
  v35 = __Block_byref_object_dispose__79;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__79;
  v29 = __Block_byref_object_dispose__79;
  id v30 = 0;
  if ([v8 length])
  {
    if ([v9 length])
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      objc_msgSend(v11, "ic_appendString:", v8);
      objc_msgSend(v11, "ic_appendString:", @"\n");
      [v11 appendAttributedString:v9];
      uint64_t v12 = [v11 copy];

      id v9 = (id)v12;
    }
    else
    {
      id v11 = v9;
      id v9 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];
    }
  }
  v13 = [(ICCreateHTMLNoteAction *)self context];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__ICCreateHTMLNoteAction_performWithTitle_contents_error___block_invoke;
  v19[3] = &unk_1E5FDE590;
  id v14 = v9;
  id v20 = v14;
  v21 = self;
  id v15 = v10;
  id v22 = v15;
  v23 = &v31;
  v24 = &v25;
  [v13 performBlockAndWait:v19];

  if (a5)
  {
    v16 = (void *)v32[5];
    if (v16) {
      *a5 = v16;
    }
  }
  id v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __58__ICCreateHTMLNoteAction_performWithTitle_contents_error___block_invoke(uint64_t a1)
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v2 = *MEMORY[0x1E4FB0708];
    uint64_t v3 = *MEMORY[0x1E4FB06E8];
    v18[0] = *MEMORY[0x1E4FB06D8];
    v18[1] = v3;
    v19[0] = v2;
    v19[1] = &unk_1F09A4028;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    v5 = objc_msgSend(*(id *)(a1 + 32), "dataFromRange:documentAttributes:error:", 0, objc_msgSend(*(id *)(a1 + 32), "length"), v4, 0);
    v6 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  id v7 = [*(id *)(a1 + 40) context];
  id v8 = ICCheckedDynamicCast();
  id v9 = [v8 newlyAddedNote];

  [v9 setCreationDate:*(void *)(a1 + 48)];
  [v9 setModificationDate:*(void *)(a1 + 48)];
  v10 = [*(id *)(a1 + 40) folder];
  [v9 setStore:v10];

  [v9 setContent:v6];
  id v11 = [*(id *)(a1 + 32) string];
  uint64_t v12 = ICNoteTitleFromPlainText();
  [v9 setTitle:v12];

  v13 = [*(id *)(a1 + 40) context];
  id v14 = [v13 managedObjectContext];
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v15 + 40);
  int v16 = [v14 save:&obj];
  objc_storeStrong((id *)(v15 + 40), obj);

  if (v16) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v9);
  }
}

- (ICLegacyContext)context
{
  return self->_context;
}

- (ICLegacyFolder)folder
{
  return self->_folder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end