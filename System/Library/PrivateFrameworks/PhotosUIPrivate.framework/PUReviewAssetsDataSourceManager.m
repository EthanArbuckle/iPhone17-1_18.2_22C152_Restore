@interface PUReviewAssetsDataSourceManager
- (PUDisplayAssetCollection)_containingAssetCollection;
- (PUReviewAssetsDataSourceManager)init;
- (PUReviewAssetsDataSourceManager)initWithReviewDataSource:(id)a3;
- (PUReviewAssetsDataSourceManagerDelegate)reviewDelegate;
- (PUReviewDataSource)_reviewDataSource;
- (void)_updateWithReviewDataSource:(id)a3 changeDetails:(id)a4;
- (void)dealloc;
- (void)setReviewDelegate:(id)a3;
@end

@implementation PUReviewAssetsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__containingAssetCollection, 0);
  objc_storeStrong((id *)&self->__reviewDataSource, 0);
  objc_destroyWeak((id *)&self->_reviewDelegate);
}

- (PUDisplayAssetCollection)_containingAssetCollection
{
  return self->__containingAssetCollection;
}

- (PUReviewDataSource)_reviewDataSource
{
  return self->__reviewDataSource;
}

- (void)setReviewDelegate:(id)a3
{
}

- (PUReviewAssetsDataSourceManagerDelegate)reviewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reviewDelegate);
  return (PUReviewAssetsDataSourceManagerDelegate *)WeakRetained;
}

- (void)_updateWithReviewDataSource:(id)a3 changeDetails:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [v7 assetsByIdentifier];
  v8 = [v7 orderedIdentifiers];

  v9 = [(PUReviewAssetsDataSourceManager *)self _containingAssetCollection];
  v10 = [[PUReviewAssetsDataSource alloc] initWithAssetsByIdentifier:v12 usingOrdering:v8 inAssetCollection:v9];
  [(PUAssetsDataSourceManager *)self setAssetsDataSource:v10];
  v11 = [(PUReviewAssetsDataSourceManager *)self reviewDelegate];
  [v11 assetsDataSourceManager:self didChangeAssetsDataSource:v10 changeDetails:v6];
}

- (void)dealloc
{
  v3 = [(PUReviewAssetsDataSourceManager *)self _reviewDataSource];
  [v3 unregisterChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUReviewAssetsDataSourceManager;
  [(PUReviewAssetsDataSourceManager *)&v4 dealloc];
}

- (PUReviewAssetsDataSourceManager)initWithReviewDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUReviewAssetsDataSourceManager;
  id v6 = [(PUReviewAssetsDataSourceManager *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:0];
    containingAssetCollection = v6->__containingAssetCollection;
    v6->__containingAssetCollection = (PUDisplayAssetCollection *)v7;

    objc_storeStrong((id *)&v6->__reviewDataSource, a3);
    [v5 registerChangeObserver:v6];
    [(PUReviewAssetsDataSourceManager *)v6 _updateWithReviewDataSource:v5 changeDetails:0];
    v9 = v6;
  }

  return v6;
}

- (PUReviewAssetsDataSourceManager)init
{
  return [(PUReviewAssetsDataSourceManager *)self initWithReviewDataSource:0];
}

@end