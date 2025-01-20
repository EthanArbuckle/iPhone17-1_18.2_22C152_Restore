@interface PUPhotoKitDataSourceManager
- (PUPhotoKitDataSourceManager)init;
- (PUPhotoKitDataSourceManager)initWithAssetsDataSourceManager:(id)a3;
- (PUPhotoKitDataSourceManager)initWithPhotosDataSource:(id)a3;
- (PXPhotosDataSource)photosDataSource;
- (id)photosDataSourceInterestingAssetReferences:(id)a3;
- (void)dealloc;
- (void)photosDataSource:(id)a3 didChange:(id)a4;
- (void)setPhotosDataSource:(id)a3;
- (void)updateWithPhotosDataSource:(id)a3 andDataSourceChange:(id)a4;
@end

@implementation PUPhotoKitDataSourceManager

- (void).cxx_destruct
{
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (id)photosDataSourceInterestingAssetReferences:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotoKitDataSourceManager *)self photosDataSource];

  if (v5 == v4)
  {
    v7 = [(PUAssetsDataSourceManager *)self delegate];
    v6 = [v7 assetsDataSourceManagerInterestingAssetReferences:self];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(PUPhotoKitDataSourceManager *)self photosDataSource];

  if (v7 == v8) {
    [(PUPhotoKitDataSourceManager *)self updateWithPhotosDataSource:v8 andDataSourceChange:v6];
  }
}

- (void)setPhotosDataSource:(id)a3
{
  id v5 = (PXPhotosDataSource *)a3;
  photosDataSource = self->_photosDataSource;
  id v7 = v5;
  if (photosDataSource != v5)
  {
    [(PXPhotosDataSource *)photosDataSource unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_photosDataSource, a3);
    [(PXPhotosDataSource *)self->_photosDataSource registerChangeObserver:self];
    [(PUPhotoKitDataSourceManager *)self updateWithPhotosDataSource:v7 andDataSourceChange:0];
  }
}

- (void)updateWithPhotosDataSource:(id)a3 andDataSourceChange:(id)a4
{
  id v6 = a4;
  id v11 = [a3 immutableCopy];
  id v7 = [PUPhotoKitAssetsDataSource alloc];
  id v8 = [(PUAssetsDataSourceManager *)self assetsDataSource];
  v9 = [v8 identifier];
  v10 = [(PUPhotoKitAssetsDataSource *)v7 initWithImmutablePhotosDataSource:v11 withChange:v6 fromDataSourceIdentifier:v9];

  [(PUAssetsDataSourceManager *)self setAssetsDataSource:v10];
}

- (void)dealloc
{
  [(PXPhotosDataSource *)self->_photosDataSource unregisterChangeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoKitDataSourceManager;
  [(PUPhotoKitDataSourceManager *)&v3 dealloc];
}

- (PUPhotoKitDataSourceManager)initWithAssetsDataSourceManager:(id)a3
{
  id v4 = [a3 photosDataSource];
  id v5 = [(PUPhotoKitDataSourceManager *)self initWithPhotosDataSource:v4];

  return v5;
}

- (PUPhotoKitDataSourceManager)initWithPhotosDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoKitDataSourceManager;
  id v6 = [(PUPhotoKitDataSourceManager *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photosDataSource, a3);
    [v5 registerChangeObserver:v7];
    [(PUPhotoKitDataSourceManager *)v7 updateWithPhotosDataSource:v5 andDataSourceChange:0];
  }

  return v7;
}

- (PUPhotoKitDataSourceManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPhotoKitDataSourceManager.m", 25, @"%s is not available as initializer", "-[PUPhotoKitDataSourceManager init]");

  abort();
}

@end