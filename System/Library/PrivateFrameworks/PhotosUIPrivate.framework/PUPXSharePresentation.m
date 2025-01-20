@interface PUPXSharePresentation
- (id)createActivitySharingControllerWithContext:(id)a3;
- (id)createActivitySharingControllerWithContext:(id)a3 selectedAssetIndexSet:(id)a4;
- (id)defaultActivityTypeOrder;
@end

@implementation PUPXSharePresentation

- (id)defaultActivityTypeOrder
{
  return +[PUActivityViewController defaultActivityTypeOrder];
}

- (id)createActivitySharingControllerWithContext:(id)a3 selectedAssetIndexSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[PUPhotoSelectionManager alloc] initWithOptions:0];
  if ([v6 count])
  {
    v8 = [v5 assetCollectionsFetchResult];
    v9 = [v8 firstObject];
    [(PUPhotoSelectionManager *)v7 selectAssetsAtIndexes:v6 inAssetCollection:v9];
  }
  v10 = [v5 assetCollectionsFetchResult];
  v11 = [[PUActivitySharingConfiguration alloc] initWithCollectionsFetchResult:v10 selectionManager:v7];
  v12 = [v5 activities];
  [(PUActivitySharingConfiguration *)v11 setActivities:v12];

  v13 = [v5 excludedActivityTypes];
  [(PUActivitySharingConfiguration *)v11 setExcludedActivityTypes:v13];

  -[PUActivitySharingConfiguration setWantsActionSheet:](v11, "setWantsActionSheet:", [v5 wantsActionSheet]);
  if ([v5 excludeShareActivity])
  {
    [(PUActivitySharingConfiguration *)v11 setExcludeShareActivity:1];
  }
  else
  {
    v14 = [v5 photosDataSource];
    -[PUActivitySharingConfiguration setExcludeShareActivity:](v11, "setExcludeShareActivity:", [v14 isEmpty]);
  }
  v15 = [v5 title];
  [(PUActivitySharingConfiguration *)v11 setTitle:v15];

  v16 = [v5 subtitle];
  [(PUActivitySharingConfiguration *)v11 setSubtitle:v16];

  v17 = [v5 keyAsset];
  [(PUActivitySharingConfiguration *)v11 setKeyAsset:v17];

  v18 = [v5 person];
  [(PUActivitySharingConfiguration *)v11 setPerson:v18];

  -[PUActivitySharingConfiguration setSourceOrigin:](v11, "setSourceOrigin:", [v5 sourceOrigin]);
  v19 = [v5 photosDataSource];
  [(PUActivitySharingConfiguration *)v11 setPhotosDataSource:v19];

  v20 = [[PUActivitySharingController alloc] initWithActivitySharingConfiguration:v11];
  return v20;
}

- (id)createActivitySharingControllerWithContext:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28D60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [(PUPXSharePresentation *)self createActivitySharingControllerWithContext:v5 selectedAssetIndexSet:v6];

  return v7;
}

@end