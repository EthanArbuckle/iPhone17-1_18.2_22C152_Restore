@interface PXAssetsAction
+ (BOOL)canPerformOnAllAssets:(id)a3;
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (PXAssetsAction)initWithAsset:(id)a3;
- (PXAssetsAction)initWithAssets:(id)a3;
- (PXAssetsAction)initWithPhotoLibrary:(id)a3;
- (id)assets;
- (void)performAssetChanges:(id)a3 completionHandler:(id)a4;
@end

@implementation PXAssetsAction

- (void).cxx_destruct
{
}

- (id)assets
{
  return self->_assets;
}

- (void)performAssetChanges:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PXAssetsAction_performAssetChanges_completionHandler___block_invoke;
  v8[3] = &unk_1E5DD3280;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(PXPhotosAction *)self performChanges:v8 completionHandler:a4];
}

void __56__PXAssetsAction_performAssetChanges_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "assets", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:*(void *)(*((void *)&v8 + 1) + 8 * v6)];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (PXAssetsAction)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAssetsAction.m", 51, @"%s is not available as initializer", "-[PXAssetsAction initWithPhotoLibrary:]");

  abort();
}

- (PXAssetsAction)initWithAsset:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = -[PXAssetsAction initWithAssets:](self, "initWithAssets:", v6, v9, v10);
  return v7;
}

- (PXAssetsAction)initWithAssets:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 photoLibrary];
    v13.receiver = self;
    v13.super_class = (Class)PXAssetsAction;
    long long v8 = [(PXPhotosAction *)&v13 initWithPhotoLibrary:v7];

    if (v8)
    {
      uint64_t v9 = [v4 copy];
      assets = v8->_assets;
      v8->_assets = (PXFastEnumeration *)v9;
    }
    self = v8;
    long long v11 = self;
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

+ (BOOL)canPerformOnAllAssets:(id)a3
{
}

uint64_t __40__PXAssetsAction_canPerformOnAllAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) canPerformOnAsset:a2 inAssetCollection:0] ^ 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v10 = (objc_class *)objc_opt_class();
  long long v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, a1, @"PXAssetsAction.m", 23, @"Method %s is a responsibility of subclass %@", "+[PXAssetsAction canPerformOnAsset:inAssetCollection:]", v11 object file lineNumber description];

  abort();
}

@end