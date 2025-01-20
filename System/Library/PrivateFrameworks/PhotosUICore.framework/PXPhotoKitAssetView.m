@interface PXPhotoKitAssetView
- (PHPhotoLibrary)photoLibrary;
- (void)setAsset:(id)a3;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation PXPhotoKitAssetView

- (void).cxx_destruct
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  v11 = (PHPhotoLibrary *)a3;
  p_photoLibrary = &self->_photoLibrary;
  v6 = self->_photoLibrary;
  v7 = v11;
  if (v6 == v11) {
    goto LABEL_5;
  }
  char v8 = [(PHPhotoLibrary *)v11 isEqual:v6];

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_photoLibrary, a3);
    if (*p_photoLibrary)
    {
      v7 = (PHPhotoLibrary *)objc_alloc_init(MEMORY[0x1E4F390D0]);
      v9 = [[PXPhotoKitUIMediaProvider alloc] initWithImageManager:v7 library:*p_photoLibrary];
      v10 = +[PXSimulatedUIMediaProvider defaultMediaProviderWithMediaProvider:v9];

      [(PXDisplayAssetView *)self setMediaProvider:v10];
LABEL_5:
    }
  }
}

- (void)setAsset:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXPhotoKitAssetView;
  id v4 = a3;
  [(PXDisplayAssetView *)&v6 setAsset:v4];
  v5 = objc_msgSend(v4, "photoLibrary", v6.receiver, v6.super_class);

  [(PXPhotoKitAssetView *)self setPhotoLibrary:v5];
}

@end