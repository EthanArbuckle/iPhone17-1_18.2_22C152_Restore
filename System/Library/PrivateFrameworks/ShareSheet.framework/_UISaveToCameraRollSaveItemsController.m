@interface _UISaveToCameraRollSaveItemsController
- (BOOL)successToReport;
- (NSArray)itemsToSchedule;
- (NSError)errorToReport;
- (_UISaveToCameraRollSaveItemsController)initWithItems:(id)a3 saveCompletionBlock:(id)a4;
- (id)saveCompletionBlock;
- (int64_t)pendingSaveCount;
- (void)_didCompleteSavingItem:(id)a3 error:(id)a4 contextInfo:(void *)a5;
- (void)_invokeSaveCompletionBlock;
- (void)_noteDidCompleteSavingItem:(id)a3 error:(id)a4;
- (void)_saveImage:(id)a3;
- (void)_saveImageData:(id)a3;
- (void)_saveVideoAtPath:(id)a3;
- (void)beginSaving;
- (void)beginSavingItem:(id)a3;
@end

@implementation _UISaveToCameraRollSaveItemsController

- (_UISaveToCameraRollSaveItemsController)initWithItems:(id)a3 saveCompletionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UISaveToCameraRollSaveItemsController;
  v9 = [(_UISaveToCameraRollSaveItemsController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemsToSchedule, a3);
    v10->_successToReport = 1;
    uint64_t v11 = MEMORY[0x1A6229A90](v8);
    id saveCompletionBlock = v10->_saveCompletionBlock;
    v10->_id saveCompletionBlock = (id)v11;
  }
  return v10;
}

- (void)beginSaving
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = self->_itemsToSchedule;
  itemsToSchedule = self->_itemsToSchedule;
  self->_itemsToSchedule = 0;

  self->_pendingSaveCount += [(NSArray *)v3 count];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = v3;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[_UISaveToCameraRollSaveItemsController beginSavingItem:](self, "beginSavingItem:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)beginSavingItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(_UISaveToCameraRollSaveItemsController *)self _saveImage:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = 0;
      v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:1 error:&v10];
      id v6 = v10;
      uint64_t v7 = v6;
      if (v5)
      {
        [(_UISaveToCameraRollSaveItemsController *)self _saveImageData:v5];
      }
      else
      {
        if (!v6)
        {
          uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
        }
        [(_UISaveToCameraRollSaveItemsController *)self _didCompleteSavingItem:0 error:v7 contextInfo:0];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(_UISaveToCameraRollSaveItemsController *)self _saveImageData:v4];
      }
      else if (_UIActivityItemIsLivePhoto(v4))
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __58___UISaveToCameraRollSaveItemsController_beginSavingItem___block_invoke;
        v8[3] = &unk_1E5A232E8;
        v8[4] = self;
        id v9 = v4;
        [v9 saveToPhotoLibraryWithCompletionHandler:v8];
      }
      else
      {
        [(_UISaveToCameraRollSaveItemsController *)self _saveVideoAtPath:v4];
      }
    }
  }
}

- (void)_saveImage:(id)a3
{
}

- (void)_saveImageData:(id)a3
{
}

- (void)_saveVideoAtPath:(id)a3
{
}

- (void)_didCompleteSavingItem:(id)a3 error:(id)a4 contextInfo:(void *)a5
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83___UISaveToCameraRollSaveItemsController__didCompleteSavingItem_error_contextInfo___block_invoke;
  block[3] = &unk_1E5A21A28;
  block[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_noteDidCompleteSavingItem:(id)a3 error:(id)a4
{
  p_errorToReport = &self->_errorToReport;
  errorToReport = self->_errorToReport;
  --self->_pendingSaveCount;
  if (errorToReport) {
    a4 = errorToReport;
  }
  objc_storeStrong((id *)&self->_errorToReport, a4);
  *((unsigned char *)p_errorToReport - 32) = *p_errorToReport == 0;
  if (!*(p_errorToReport - 1))
  {
    [(_UISaveToCameraRollSaveItemsController *)self _invokeSaveCompletionBlock];
  }
}

- (void)_invokeSaveCompletionBlock
{
  id v4 = (void (**)(id, BOOL, NSError *))MEMORY[0x1A6229A90](self->_saveCompletionBlock, a2);
  id saveCompletionBlock = self->_saveCompletionBlock;
  self->_id saveCompletionBlock = 0;

  v4[2](v4, self->_successToReport, self->_errorToReport);
}

- (id)saveCompletionBlock
{
  return self->_saveCompletionBlock;
}

- (NSArray)itemsToSchedule
{
  return self->_itemsToSchedule;
}

- (int64_t)pendingSaveCount
{
  return self->_pendingSaveCount;
}

- (NSError)errorToReport
{
  return self->_errorToReport;
}

- (BOOL)successToReport
{
  return self->_successToReport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorToReport, 0);
  objc_storeStrong((id *)&self->_itemsToSchedule, 0);
  objc_storeStrong(&self->_saveCompletionBlock, 0);
}

@end