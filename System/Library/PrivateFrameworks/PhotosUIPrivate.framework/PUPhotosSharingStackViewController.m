@interface PUPhotosSharingStackViewController
- (PHAsset)currentAsset;
- (PHFetchResult)assetFetchResult;
- (PUPhotosSharingStackViewController)initWithAssetFetchResult:(id)a3;
- (PUPhotosSharingStackViewController)initWithCoder:(id)a3;
- (PUPhotosSharingStackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUPhotosSharingStackViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetFetchResult, 0);
  objc_storeStrong((id *)&self->_cardsView, 0);
}

- (PHFetchResult)assetFetchResult
{
  return self->_assetFetchResult;
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PUPhotosSharingStackViewController;
  [(PUPhotosSharingStackViewController *)&v14 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F90348]);
  v4 = (PXMessagesStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  cardsView = self->_cardsView;
  self->_cardsView = v4;

  [(PXMessagesStackView *)self->_cardsView setAllowPlayableContentLoading:1];
  [(PXMessagesStackView *)self->_cardsView setDelegate:self];
  [(PXMessagesStackView *)self->_cardsView setHorizontalAlignment:0];
  [(PXMessagesStackView *)self->_cardsView setUseAspectTiles:1];
  v6 = (void *)MEMORY[0x1E4F904E0];
  v7 = [(PUPhotosSharingStackViewController *)self assetFetchResult];
  v8 = [v7 firstObject];
  v9 = [v8 photoLibrary];
  v10 = [v6 mediaProviderWithLibrary:v9];

  [(PXMessagesStackView *)self->_cardsView setMediaProvider:v10];
  v11 = (void *)MEMORY[0x1E4F90468];
  v12 = [(PUPhotosSharingStackViewController *)self assetFetchResult];
  v13 = [v11 dataSourceManagerWithAssets:v12];

  [(PXMessagesStackView *)self->_cardsView setDataSourceManager:v13];
  [(PUPhotosSharingStackViewController *)self setView:self->_cardsView];
}

- (PHAsset)currentAsset
{
  id v3 = [(PUPhotosSharingStackViewController *)self assetFetchResult];
  v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[PXMessagesStackView currentIndex](self->_cardsView, "currentIndex"));

  return (PHAsset *)v4;
}

- (PUPhotosSharingStackViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPhotosSharingStackViewController.m", 40, @"%s is not available as initializer", "-[PUPhotosSharingStackViewController initWithCoder:]");

  abort();
}

- (PUPhotosSharingStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPhotosSharingStackViewController.m", 36, @"%s is not available as initializer", "-[PUPhotosSharingStackViewController initWithNibName:bundle:]");

  abort();
}

- (PUPhotosSharingStackViewController)initWithAssetFetchResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPhotosSharingStackViewController;
  v6 = [(PUPhotosSharingStackViewController *)&v9 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetFetchResult, a3);
  }

  return v7;
}

@end