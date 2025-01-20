@interface PXContentSyndicationDataSource
- (NSDate)mostRecentlyAddedDate;
- (id)allAssetsFetchResult;
- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)collectionAtIndexPath:(id)a3;
- (id)collectionListForSection:(int64_t)a3;
- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)indexPathForCollection:(id)a3;
- (int64_t)countForCollection:(id)a3;
@end

@implementation PXContentSyndicationDataSource

- (int64_t)countForCollection:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXContentSyndicationDataSource.m", 50, @"Method %s is a responsibility of subclass %@", "-[PXContentSyndicationDataSource countForCollection:]", v8 object file lineNumber description];

  abort();
}

- (id)collectionListForSection:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXContentSyndicationDataSource.m", 46, @"Method %s is a responsibility of subclass %@", "-[PXContentSyndicationDataSource collectionListForSection:]", v7 object file lineNumber description];

  abort();
}

- (id)collectionAtIndexPath:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXContentSyndicationDataSource.m", 42, @"Method %s is a responsibility of subclass %@", "-[PXContentSyndicationDataSource collectionAtIndexPath:]", v8 object file lineNumber description];

  abort();
}

- (id)indexPathForCollection:(id)a3
{
}

- (NSDate)mostRecentlyAddedDate
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXContentSyndicationDataSource.m", 30, @"Method %s is a responsibility of subclass %@", "-[PXContentSyndicationDataSource mostRecentlyAddedDate]", v6 object file lineNumber description];

  abort();
}

- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXContentSyndicationDataSource.m", 26, @"Method %s is a responsibility of subclass %@", "-[PXContentSyndicationDataSource assetCollectionAtItemIndexPath:]", v7 object file lineNumber description];

  abort();
}

- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXContentSyndicationDataSource.m", 22, @"Method %s is a responsibility of subclass %@", "-[PXContentSyndicationDataSource contentSyndicationItemAtItemIndexPath:]", v7 object file lineNumber description];

  abort();
}

- (id)allAssetsFetchResult
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXContentSyndicationDataSource.m", 18, @"Method %s is a responsibility of subclass %@", "-[PXContentSyndicationDataSource allAssetsFetchResult]", v6 object file lineNumber description];

  abort();
}

@end