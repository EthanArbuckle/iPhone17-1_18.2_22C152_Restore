@interface ICAttachmentImageActivityItemSource
- (NSItemProvider)itemProvider;
- (id)_resolveItemProvider;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (void)setItemProvider:(id)a3;
@end

@implementation ICAttachmentImageActivityItemSource

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return &stru_1F0973378;
}

- (id)_resolveItemProvider
{
  itemProvider = self->_itemProvider;
  if (!itemProvider)
  {
    v4 = [(ICAttachmentActivityItemSource *)self attachment];
    v5 = objc_msgSend(v4, "ic_permanentObjectID");

    v6 = [MEMORY[0x1E4F83428] sharedContext];
    v7 = [v6 workerManagedObjectContext];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke;
    aBlock[3] = &unk_1E5FDD280;
    id v8 = v7;
    id v36 = v8;
    id v9 = v5;
    id v37 = v9;
    v10 = _Block_copy(aBlock);
    v11 = [(ICAttachmentActivityItemSource *)self attachmentTypeUTI];
    v12 = (NSItemProvider *)objc_alloc_init(MEMORY[0x1E4F28D78]);
    v13 = [(ICAttachmentActivityItemSource *)self attachment];
    int v14 = [v13 isPasswordProtected];

    if (v14)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_3;
      v33[3] = &unk_1E5FDD2D0;
      v15 = &v34;
      id v34 = v10;
      [(NSItemProvider *)v12 registerDataRepresentationForTypeIdentifier:v11 visibility:0 loadHandler:v33];
    }
    else
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_5;
      v31[3] = &unk_1E5FDD2F8;
      v15 = &v32;
      id v16 = v10;
      id v32 = v16;
      [(NSItemProvider *)v12 registerFileRepresentationForTypeIdentifier:v11 fileOptions:0 visibility:0 loadHandler:v31];
      v17 = [(id)*MEMORY[0x1E4F443B8] identifier];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_7;
      v29[3] = &unk_1E5FDD320;
      id v30 = v16;
      [(NSItemProvider *)v12 registerItemForTypeIdentifier:v17 loadHandler:v29];
    }
    v18 = [(id)*MEMORY[0x1E4F44378] identifier];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_9;
    v27[3] = &unk_1E5FDD320;
    id v19 = v10;
    id v28 = v19;
    [(NSItemProvider *)v12 registerItemForTypeIdentifier:v18 loadHandler:v27];

    uint64_t v20 = objc_opt_class();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_11;
    v25[3] = &unk_1E5FDD348;
    id v26 = v19;
    id v21 = v19;
    [(NSItemProvider *)v12 registerObjectOfClass:v20 visibility:0 loadHandler:v25];
    v22 = self->_itemProvider;
    self->_itemProvider = v12;
    v23 = v12;

    itemProvider = self->_itemProvider;
  }
  return itemProvider;
}

void __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_2;
  v6[3] = &unk_1E5FDBB10;
  id v7 = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v5 = v3;
  [v7 performBlock:v6];
}

void __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  v2 = objc_msgSend(*(id *)(a1 + 32), "ic_existingObjectWithID:", *(void *)(a1 + 40));
  ICDynamicCast();
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_4;
  v8[3] = &unk_1E5FDD2A8;
  id v9 = v3;
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v8);

  return 0;
}

void __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 media];
  id v3 = [v4 data];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, 0);
}

uint64_t __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_6;
  v8[3] = &unk_1E5FDD2A8;
  id v9 = v3;
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v8);

  return 0;
}

void __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 media];
  id v3 = [v4 mediaURL];
  (*(void (**)(uint64_t, void *, void, void))(v2 + 16))(v2, v3, 0, 0);
}

void __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_8;
  v7[3] = &unk_1E5FDD2A8;
  id v8 = v3;
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v7);
}

void __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 media];
  id v3 = [v4 mediaURL];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, 0);
}

void __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_10;
  v7[3] = &unk_1E5FDD2A8;
  id v8 = v3;
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v7);
}

void __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 media];
  id v3 = [v4 data];
  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v3, 0);
}

uint64_t __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_12;
  v8[3] = &unk_1E5FDD2A8;
  id v9 = v3;
  id v5 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v6 = v3;
  v5(v4, v8);

  return 0;
}

void __59__ICAttachmentImageActivityItemSource__resolveItemProvider__block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 isPasswordProtected];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (void *)MEMORY[0x1E4FB1818];
  id v10 = [v3 media];

  if (v4)
  {
    id v7 = [v10 data];
    id v8 = [v6 imageWithData:v7];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v8, 0);
  }
  else
  {
    id v7 = [v10 mediaURL];
    id v8 = [v7 path];
    id v9 = [v6 imageWithContentsOfFile:v8];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v9, 0);
  }
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end