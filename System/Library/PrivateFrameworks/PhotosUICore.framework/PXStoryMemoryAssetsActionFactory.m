@interface PXStoryMemoryAssetsActionFactory
- (PXStoryMemoryAssetsActionFactory)initWithViewModel:(id)a3;
- (PXStoryViewModel)viewModel;
- (id)assetsPickerPresenter;
- (id)rearrangeMemoryAssetsActionWithAssetCollection:(id)a3 movedAssets:(id)a4 beforeAsset:(id)a5;
@end

@implementation PXStoryMemoryAssetsActionFactory

- (void).cxx_destruct
{
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (id)assetsPickerPresenter
{
  v2 = [(PXStoryMemoryAssetsActionFactory *)self viewModel];
  v3 = [v2 actionPerformer];

  return v3;
}

- (id)rearrangeMemoryAssetsActionWithAssetCollection:(id)a3 movedAssets:(id)a4 beforeAsset:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(PXStoryMemoryAssetsActionFactory *)self viewModel];
  v13 = [v12 mainModel];

  id v14 = [v13 currentAssetCollection];

  if (v14 != v11)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXStoryMemoryAssetsActionFactory.m", 35, @"Invalid parameter not satisfying: %@", @"assetCollection == modelCollection" object file lineNumber description];
  }
  v15 = [[PXStoryRearrangeMemoryAssetsAction alloc] initWithModel:v13 movedAssets:v10 beforeAsset:v9];

  return v15;
}

- (PXStoryMemoryAssetsActionFactory)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryMemoryAssetsActionFactory;
  v6 = [(PXStoryMemoryAssetsActionFactory *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewModel, a3);
  }

  return v7;
}

@end