@interface PXContentSyndicationEmptyDataSourceManager
+ (id)createCountsController;
- (id)allAssetsFetchResult;
- (id)createAssetsDataSourceManager;
- (id)createInitialDataSource;
@end

@implementation PXContentSyndicationEmptyDataSourceManager

+ (id)createCountsController
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"PXContentSyndicationEmptyDataSource.m" lineNumber:57 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (id)createAssetsDataSourceManager
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXContentSyndicationEmptyDataSource.m" lineNumber:53 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (id)allAssetsFetchResult
{
  id v9 = 0;
  v4 = [MEMORY[0x1E4F39228] openPhotoLibraryWithWellKnownIdentifier:3 error:&v9];
  id v5 = v9;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXContentSyndicationEmptyDataSource.m", 47, @"Error trying to access the syndication library for returning an empty fetch result in PXContentSyndicationEmptyDataSource: %@", v5 object file lineNumber description];
  }
  v6 = [MEMORY[0x1E4F39150] emptyFetchResultWithPhotoLibrary:v4];

  return v6;
}

- (id)createInitialDataSource
{
  v2 = objc_alloc_init(PXContentSyndicationEmptyDataSource);
  return v2;
}

@end