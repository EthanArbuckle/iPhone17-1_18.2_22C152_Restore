@interface PXRenameMemoryAction
- (NSString)redoSubtitle;
- (NSString)redoTitle;
- (NSString)undoSubtitle;
- (NSString)undoTitle;
- (PHMemory)memory;
- (PXRenameMemoryAction)initWithMemory:(id)a3 title:(id)a4 subtitle:(id)a5;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXRenameMemoryAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoSubtitle, 0);
  objc_storeStrong((id *)&self->_redoSubtitle, 0);
  objc_storeStrong((id *)&self->_undoTitle, 0);
  objc_storeStrong((id *)&self->_redoTitle, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

- (NSString)undoSubtitle
{
  return self->_undoSubtitle;
}

- (NSString)redoSubtitle
{
  return self->_redoSubtitle;
}

- (NSString)undoTitle
{
  return self->_undoTitle;
}

- (NSString)redoTitle
{
  return self->_redoTitle;
}

- (PHMemory)memory
{
  return self->_memory;
}

- (void)performUndo:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__PXRenameMemoryAction_performUndo___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __36__PXRenameMemoryAction_performUndo___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F39170];
  v3 = [*(id *)(a1 + 32) memory];
  id v6 = [v2 changeRequestForMemory:v3];

  v4 = [*(id *)(a1 + 32) undoTitle];
  [v6 setTitle:v4];

  v5 = [*(id *)(a1 + 32) undoSubtitle];
  [v6 setSubtitle:v5];
}

- (void)performAction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__PXRenameMemoryAction_performAction___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __38__PXRenameMemoryAction_performAction___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F39170];
  v3 = [*(id *)(a1 + 32) memory];
  id v6 = [v2 changeRequestForMemory:v3];

  v4 = [*(id *)(a1 + 32) redoTitle];
  [v6 setTitle:v4];

  v5 = [*(id *)(a1 + 32) redoSubtitle];
  [v6 setSubtitle:v5];
}

- (id)actionNameLocalizationKey
{
  return @"PXRenameMemoryActionName";
}

- (id)actionIdentifier
{
  return @"RenameMemory";
}

- (PXRenameMemoryAction)initWithMemory:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 canPerformEditOperation:7])
  {
    id v28 = v10;
    v12 = (void *)[v10 copy];
    uint64_t v13 = [v9 localizedTitle];
    v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = &stru_1F00B0030;
    }
    obj = v15;
    v16 = v15;

    v17 = (void *)[v11 copy];
    uint64_t v18 = [v9 subtitle];
    v19 = (void *)v18;
    if (v18) {
      v20 = (__CFString *)v18;
    }
    else {
      v20 = &stru_1F00B0030;
    }
    v21 = v20;

    v27 = v21;
    if ([v12 isEqualToString:v16]
      && ([v17 isEqualToString:v21] & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      v23 = [v9 photoLibrary];
      v29.receiver = self;
      v29.super_class = (Class)PXRenameMemoryAction;
      v24 = [(PXPhotosAction *)&v29 initWithPhotoLibrary:v23];

      if (v24)
      {
        objc_storeStrong((id *)&v24->_memory, a3);
        objc_storeStrong((id *)&v24->_redoTitle, v12);
        objc_storeStrong((id *)&v24->_undoTitle, obj);
        objc_storeStrong((id *)&v24->_redoSubtitle, v17);
        objc_storeStrong((id *)&v24->_undoSubtitle, v20);
      }
      self = v24;
      v22 = self;
    }
    id v10 = v28;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end