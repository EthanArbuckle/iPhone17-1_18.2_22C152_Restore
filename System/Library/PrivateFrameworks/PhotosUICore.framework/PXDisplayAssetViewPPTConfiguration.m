@interface PXDisplayAssetViewPPTConfiguration
+ (NSArray)defaultConfigurations;
+ (PHPhotoLibrary)defaultPhotoLibrary;
- (NSString)label;
- (PXDisplayAssetFetchResult)assets;
- (PXDisplayAssetViewPPTConfiguration)init;
- (PXDisplayAssetViewPPTConfiguration)initWithAssetViewFactory:(id)a3 label:(id)a4 assets:(id)a5 label:(id)a6;
- (PXDisplayAssetViewPPTConfiguration)initWithAssetViewFactory:(id)a3 label:(id)a4 photoLibraryAssetsWithPlaybackStyleFilter:(int64_t)a5;
- (id)assetViewFactory;
@end

@implementation PXDisplayAssetViewPPTConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong(&self->_assetViewFactory, 0);
}

- (NSString)label
{
  return self->_label;
}

- (PXDisplayAssetFetchResult)assets
{
  return self->_assets;
}

- (id)assetViewFactory
{
  return self->_assetViewFactory;
}

- (PXDisplayAssetViewPPTConfiguration)initWithAssetViewFactory:(id)a3 label:(id)a4 assets:(id)a5 label:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXDisplayAssetViewPPTConfiguration.m", 59, @"Invalid parameter not satisfying: %@", @"assetViewFactory != nil" object file lineNumber description];

    if (v12)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_10:
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"PXDisplayAssetViewPPTConfiguration.m", 61, @"Invalid parameter not satisfying: %@", @"assets != nil" object file lineNumber description];

      if (v14) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PXDisplayAssetViewPPTConfiguration.m", 60, @"Invalid parameter not satisfying: %@", @"assetViewFactoryLabel != nil" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_4:
  if (v14) {
    goto LABEL_5;
  }
LABEL_11:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PXDisplayAssetViewPPTConfiguration.m", 62, @"Invalid parameter not satisfying: %@", @"assetsLabel != nil" object file lineNumber description];

LABEL_5:
  v25.receiver = self;
  v25.super_class = (Class)PXDisplayAssetViewPPTConfiguration;
  v15 = [(PXDisplayAssetViewPPTConfiguration *)&v25 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    id assetViewFactory = v15->_assetViewFactory;
    v15->_id assetViewFactory = (id)v16;

    objc_storeStrong((id *)&v15->_assets, a5);
    uint64_t v18 = [[NSString alloc] initWithFormat:@"%@View-%@Assets", v12, v14];
    label = v15->_label;
    v15->_label = (NSString *)v18;
  }
  return v15;
}

- (PXDisplayAssetViewPPTConfiguration)initWithAssetViewFactory:(id)a3 label:(id)a4 photoLibraryAssetsWithPlaybackStyleFilter:(int64_t)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  v10 = [(id)objc_opt_class() defaultPhotoLibrary];
  id v11 = [v10 librarySpecificFetchOptions];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a5)
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"playbackStyle == %li", a5);
    [v12 addObject:v13];

    PXDisplayAssetPlaybackStyleDescription();
  }
  if ([v12 count])
  {
    id v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v12];
    [v11 setPredicate:v14];
  }
  v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v20[0] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v11 setSortDescriptors:v16];

  [v11 setFetchLimit:100];
  v17 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v11];

  uint64_t v18 = [(PXDisplayAssetViewPPTConfiguration *)self initWithAssetViewFactory:v9 label:v8 assets:v17 label:@"All"];
  return v18;
}

- (PXDisplayAssetViewPPTConfiguration)init
{
  return [(PXDisplayAssetViewPPTConfiguration *)self initWithAssetViewFactory:&__block_literal_global_259621 label:@"PXPhotoKitAssetView" photoLibraryAssetsWithPlaybackStyleFilter:0];
}

PXPhotoKitAssetView *__42__PXDisplayAssetViewPPTConfiguration_init__block_invoke()
{
  v0 = objc_alloc_init(PXPhotoKitAssetView);
  return v0;
}

+ (NSArray)defaultConfigurations
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke;
  aBlock[3] = &unk_1E5DCD498;
  id v13 = v3;
  id v4 = v3;
  v5 = _Block_copy(aBlock);
  v11[2] = __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_3;
  v11[3] = &__block_descriptor_40_e25___PXDisplayAssetView_8__0l;
  v11[4] = a1;
  v6 = (void (*)(void *, void *, __CFString *))v5[2];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v6(v5, v11, @"PXDisplayAssetView");
  ((void (*)(void *, void *, __CFString *))v5[2])(v5, &__block_literal_global_241_259637, @"PXPhotoKitAssetView");
  Class v7 = NSClassFromString(&cfstr_Phassetview.isa);
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_5;
    v10[3] = &__block_descriptor_40_e5__8__0lu32l8;
    v10[4] = v7;
    ((void (*)(void *, void *, __CFString *))v5[2])(v5, v10, @"PHAssetView");
  }
  id v8 = (void *)[v4 copy];

  return (NSArray *)v8;
}

void __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_2;
  aBlock[3] = &unk_1E5DCD470;
  id v7 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v5;
  id v12 = v7;
  id v8 = v6;
  id v9 = v5;
  v10 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v10[2](v10, 1);
  v10[2](v10, 3);
  v10[2](v10, 4);
}

PXDisplayAssetView *__59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_3()
{
  v0 = objc_alloc_init(PXDisplayAssetView);
  v1 = [PXPhotoKitUIMediaProvider alloc];
  id v2 = objc_alloc_init(MEMORY[0x1E4F390D0]);
  id v3 = [(id)objc_opt_class() defaultPhotoLibrary];
  id v4 = [(PXPhotoKitUIMediaProvider *)v1 initWithImageManager:v2 library:v3];
  [(PXDisplayAssetView *)v0 setMediaProvider:v4];

  return v0;
}

id __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_5(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  return v1;
}

PXPhotoKitAssetView *__59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_4()
{
  v0 = objc_alloc_init(PXPhotoKitAssetView);
  return v0;
}

void __59__PXDisplayAssetViewPPTConfiguration_defaultConfigurations__block_invoke_2(void *a1, uint64_t a2)
{
  id v2 = (void *)a1[4];
  id v3 = [[PXDisplayAssetViewPPTConfiguration alloc] initWithAssetViewFactory:a1[6] label:a1[5] photoLibraryAssetsWithPlaybackStyleFilter:a2];
  [v2 addObject:v3];
}

+ (PHPhotoLibrary)defaultPhotoLibrary
{
  return (PHPhotoLibrary *)objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
}

@end