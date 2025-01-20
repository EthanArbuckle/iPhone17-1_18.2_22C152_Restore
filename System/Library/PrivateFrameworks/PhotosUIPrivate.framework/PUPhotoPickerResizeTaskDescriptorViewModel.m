@interface PUPhotoPickerResizeTaskDescriptorViewModel
- (NSString)description;
- (NSString)localizedFileSizeDescription;
- (NSString)localizedTitle;
- (OS_dispatch_queue)localizedFileSizeDescriptionUpdaterQueue;
- (PUPhotoPickerResizeTaskDescriptor)resizeTaskDescriptor;
- (PUPhotoPickerResizeTaskDescriptorViewModel)init;
- (PUPhotoPickerResizeTaskDescriptorViewModelDelegate)delegate;
- (PXInfoUpdater)localizedFileSizeDescriptionUpdater;
- (UIMenu)fileSizeMenu;
- (id)_infoDictionaryForLocalizedTitle:(id)a3 localizedFileSizeDescription:(id)a4;
- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4;
- (void)infoUpdaterDidUpdate:(id)a3;
- (void)invalidateAssetsForResizing;
- (void)performChanges:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileSizeMenu:(id)a3;
- (void)setLocalizedFileSizeDescriptionUpdater:(id)a3;
- (void)setLocalizedFileSizeDescriptionUpdaterQueue:(id)a3;
- (void)setResizeTaskDescriptor:(id)a3;
@end

@implementation PUPhotoPickerResizeTaskDescriptorViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedFileSizeDescriptionUpdaterQueue, 0);
  objc_storeStrong((id *)&self->_localizedFileSizeDescriptionUpdater, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileSizeMenu, 0);
  objc_storeStrong((id *)&self->_localizedFileSizeDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_resizeTaskDescriptor, 0);
}

- (void)setLocalizedFileSizeDescriptionUpdaterQueue:(id)a3
{
}

- (OS_dispatch_queue)localizedFileSizeDescriptionUpdaterQueue
{
  return self->_localizedFileSizeDescriptionUpdaterQueue;
}

- (void)setLocalizedFileSizeDescriptionUpdater:(id)a3
{
}

- (PXInfoUpdater)localizedFileSizeDescriptionUpdater
{
  return self->_localizedFileSizeDescriptionUpdater;
}

- (void)setDelegate:(id)a3
{
}

- (PUPhotoPickerResizeTaskDescriptorViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotoPickerResizeTaskDescriptorViewModelDelegate *)WeakRetained;
}

- (UIMenu)fileSizeMenu
{
  return self->_fileSizeMenu;
}

- (NSString)localizedFileSizeDescription
{
  return self->_localizedFileSizeDescription;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (PUPhotoPickerResizeTaskDescriptor)resizeTaskDescriptor
{
  return self->_resizeTaskDescriptor;
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v5 = a3;
  v6 = [v5 infoKind];
  int v7 = [v6 isEqualToString:@"PUResizeTaskDescriptorInfoKind"];

  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerResizeTaskDescriptorViewModel.m" lineNumber:139 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = [v5 info];
  v9 = [v8 objectForKeyedSubscript:@"PUResizeTaskDescriptorInfoLocalizedTitleKey"];
  v10 = [v8 objectForKeyedSubscript:@"PUResizeTaskDescriptorInfoLocalizedFileSizeDescriptionKey"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__PUPhotoPickerResizeTaskDescriptorViewModel_infoUpdaterDidUpdate___block_invoke;
  v14[3] = &unk_1E5F29C38;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v11 = v10;
  id v12 = v9;
  [(PUPhotoPickerResizeTaskDescriptorViewModel *)self performChanges:v14];
}

uint64_t __67__PUPhotoPickerResizeTaskDescriptorViewModel_infoUpdaterDidUpdate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 112), *(id *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  return [v2 signalChange:2];
}

- (id)_infoDictionaryForLocalizedTitle:(id)a3 localizedFileSizeDescription:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"PUResizeTaskDescriptorInfoLocalizedTitleKey";
  v10[1] = @"PUResizeTaskDescriptorInfoLocalizedFileSizeDescriptionKey";
  v11[0] = a3;
  v11[1] = a4;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PUPhotoPickerResizeTaskDescriptorViewModel *)self delegate];
  v10 = [v9 assetsForResizing];
  id v11 = (void *)[v10 copy];

  if (![v7 isEqualToString:@"PUResizeTaskDescriptorInfoKind"])
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerResizeTaskDescriptorViewModel.m" lineNumber:105 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v11)
  {
    id v12 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    v13 = [(PUPhotoPickerResizeTaskDescriptorViewModel *)self resizeTaskDescriptor];
    v14 = [(PUPhotoPickerResizeTaskDescriptorViewModel *)self localizedFileSizeDescriptionUpdaterQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__PUPhotoPickerResizeTaskDescriptorViewModel_requestInfoOfKind_withResultHandler___block_invoke;
    block[3] = &unk_1E5F29C10;
    id v15 = v12;
    id v22 = v15;
    id v23 = v13;
    id v24 = v11;
    v25 = self;
    id v26 = v8;
    id v16 = v13;
    dispatch_async(v14, block);
  }
  else
  {
    v17 = PULocalizedString(@"SIZE_PICKER_DOWNLOADING");
    v18 = [(PUPhotoPickerResizeTaskDescriptorViewModel *)self _infoDictionaryForLocalizedTitle:v17 localizedFileSizeDescription:v17];
    (*((void (**)(id, void *))v8 + 2))(v8, v18);

    id v15 = 0;
  }

  return v15;
}

void __82__PUPhotoPickerResizeTaskDescriptorViewModel_requestInfoOfKind_withResultHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 40) localizedDescription];
    v2 = [*(id *)(a1 + 40) localizedDescriptionForAssets:*(void *)(a1 + 48)];
    v3 = [*(id *)(a1 + 56) _infoDictionaryForLocalizedTitle:v4 localizedFileSizeDescription:v2];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)invalidateAssetsForResizing
{
  id v2 = [(PUPhotoPickerResizeTaskDescriptorViewModel *)self localizedFileSizeDescriptionUpdater];
  [v2 invalidateInfo];
}

- (void)setFileSizeMenu:(id)a3
{
  id v5 = (UIMenu *)a3;
  if (self->_fileSizeMenu != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_fileSizeMenu, a3);
    [(PUPhotoPickerResizeTaskDescriptorViewModel *)self signalChange:4];
    id v5 = v6;
  }
}

- (void)setResizeTaskDescriptor:(id)a3
{
  v9 = (PUPhotoPickerResizeTaskDescriptor *)a3;
  id v5 = self->_resizeTaskDescriptor;
  if (v5 == v9)
  {
  }
  else
  {
    id v6 = v5;
    BOOL v7 = [(PUPhotoPickerResizeTaskDescriptor *)v5 isEqual:v9];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_resizeTaskDescriptor, a3);
      id v8 = [(PUPhotoPickerResizeTaskDescriptorViewModel *)self localizedFileSizeDescriptionUpdater];
      [v8 invalidateInfo];

      [(PUPhotoPickerResizeTaskDescriptorViewModel *)self signalChange:1];
    }
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoPickerResizeTaskDescriptorViewModel;
  [(PUPhotoPickerResizeTaskDescriptorViewModel *)&v3 performChanges:a3];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"resizeTaskDescriptor: %@", self->_resizeTaskDescriptor];
}

- (PUPhotoPickerResizeTaskDescriptorViewModel)init
{
  v12.receiver = self;
  v12.super_class = (Class)PUPhotoPickerResizeTaskDescriptorViewModel;
  id v2 = [(PUPhotoPickerResizeTaskDescriptorViewModel *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[PUPhotoPickerResizeTaskDescriptor defaultActualSizeDescriptor];
    resizeTaskDescriptor = v2->_resizeTaskDescriptor;
    v2->_resizeTaskDescriptor = (PUPhotoPickerResizeTaskDescriptor *)v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.photopicker.PUPhotoPickerResizeTaskDescriptorViewModel.localizedFileSizeDescriptionUpdaterQueue", v6);
    localizedFileSizeDescriptionUpdaterQueue = v2->_localizedFileSizeDescriptionUpdaterQueue;
    v2->_localizedFileSizeDescriptionUpdaterQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F902E8]) initWithInfoProvider:v2 infoKind:@"PUResizeTaskDescriptorInfoKind"];
    localizedFileSizeDescriptionUpdater = v2->_localizedFileSizeDescriptionUpdater;
    v2->_localizedFileSizeDescriptionUpdater = (PXInfoUpdater *)v9;

    [(PXInfoUpdater *)v2->_localizedFileSizeDescriptionUpdater setObserver:v2];
  }
  return v2;
}

@end