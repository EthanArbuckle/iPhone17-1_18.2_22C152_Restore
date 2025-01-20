@interface PXContentSyndicationDataSourceManager
+ (id)createCountsController;
- (PXDisplayAssetFetchResult)allAssetsFetchResult;
- (id)assetFetchResultProvider;
- (id)createAssetsDataSourceManager;
- (id)imageProvider;
- (id)socialLayerHighlightProvider;
@end

@implementation PXContentSyndicationDataSourceManager

- (void).cxx_destruct
{
}

+ (id)createCountsController
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, a1, @"PXContentSyndicationDataSource.m", 78, @"Method %s is a responsibility of subclass %@", "+[PXContentSyndicationDataSourceManager createCountsController]", v6 object file lineNumber description];

  abort();
}

- (PXDisplayAssetFetchResult)allAssetsFetchResult
{
  return self->_allAssetsFetchResult;
}

- (id)createAssetsDataSourceManager
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXContentSyndicationDataSource.m", 74, @"Method %s is a responsibility of subclass %@", "-[PXContentSyndicationDataSourceManager createAssetsDataSourceManager]", v6 object file lineNumber description];

  abort();
}

- (id)socialLayerHighlightProvider
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXContentSyndicationDataSource.m", 70, @"Method %s is a responsibility of subclass %@", "-[PXContentSyndicationDataSourceManager socialLayerHighlightProvider]", v6 object file lineNumber description];

  abort();
}

- (id)imageProvider
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXContentSyndicationDataSource.m", 66, @"Method %s is a responsibility of subclass %@", "-[PXContentSyndicationDataSourceManager imageProvider]", v6 object file lineNumber description];

  abort();
}

- (id)assetFetchResultProvider
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXContentSyndicationDataSource.m", 62, @"Method %s is a responsibility of subclass %@", "-[PXContentSyndicationDataSourceManager assetFetchResultProvider]", v6 object file lineNumber description];

  abort();
}

@end