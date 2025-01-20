@interface PXPhotoKitVideoContentProvider
- (PXPhotoKitVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7;
- (PXPhotoKitVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7 resourceReclamationController:(id)a8;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
@end

@implementation PXPhotoKitVideoContentProvider

- (void).cxx_destruct
{
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v9 = a3;
  v4 = [(PXDisplayAssetVideoContentProvider *)self asset];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(PXDisplayAssetVideoContentProvider *)self asset];
    v7 = [v9 changeDetailsForObject:v6];

    if (v7)
    {
      v8 = [v7 objectAfterChanges];
      [(PXDisplayAssetVideoContentProvider *)self setAsset:v8];
    }
  }
}

- (PXPhotoKitVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7 resourceReclamationController:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXPhotoKitVideoContentProvider;
  v15 = [(PXDisplayAssetVideoContentProvider *)&v18 initWithAsset:v14 mediaProvider:a4 deliveryStrategies:a5 audioSession:a6 requestURLOnly:v9 resourceReclamationController:a8];
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [v14 photoLibrary];
      objc_msgSend(v16, "px_registerChangeObserver:", v15);
    }
  }

  return v15;
}

- (PXPhotoKitVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7
{
  BOOL v7 = a7;
  v12 = (objc_class *)MEMORY[0x1E4F8EB70];
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init(v12);
  objc_super v18 = [(PXPhotoKitVideoContentProvider *)self initWithAsset:v16 mediaProvider:v15 deliveryStrategies:v14 audioSession:v13 requestURLOnly:v7 resourceReclamationController:v17];

  return v18;
}

@end