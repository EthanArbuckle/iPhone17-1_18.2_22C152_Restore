@interface PXActivitySharingContext
- (BOOL)excludeShareActivity;
- (BOOL)wantsActionSheet;
- (NSArray)activities;
- (NSArray)excludedActivityTypes;
- (NSString)subtitle;
- (NSString)title;
- (PHFetchResult)assetCollectionsFetchResult;
- (PHPerson)person;
- (PXActivitySharingContext)init;
- (PXActivitySharingContext)initWithAssetCollection:(id)a3 assetsDataSource:(id)a4;
- (PXActivitySharingContext)initWithAssetCollection:(id)a3 photosDataSource:(id)a4;
- (PXDisplayAsset)keyAsset;
- (PXPhotosDataSource)photosDataSource;
- (int64_t)sourceOrigin;
- (void)setActivities:(id)a3;
- (void)setExcludeShareActivity:(BOOL)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setKeyAsset:(id)a3;
- (void)setPerson:(id)a3;
- (void)setSourceOrigin:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWantsActionSheet:(BOOL)a3;
@end

@implementation PXActivitySharingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_assetCollectionsFetchResult, 0);
}

- (void)setSourceOrigin:(int64_t)a3
{
  self->_sourceOrigin = a3;
}

- (int64_t)sourceOrigin
{
  return self->_sourceOrigin;
}

- (void)setPerson:(id)a3
{
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setKeyAsset:(id)a3
{
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setExcludeShareActivity:(BOOL)a3
{
  self->_excludeShareActivity = a3;
}

- (BOOL)excludeShareActivity
{
  return self->_excludeShareActivity;
}

- (void)setWantsActionSheet:(BOOL)a3
{
  self->_wantsActionSheet = a3;
}

- (BOOL)wantsActionSheet
{
  return self->_wantsActionSheet;
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setActivities:(id)a3
{
}

- (NSArray)activities
{
  return self->_activities;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (PHFetchResult)assetCollectionsFetchResult
{
  return self->_assetCollectionsFetchResult;
}

- (PXActivitySharingContext)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXActivitySharingContext.m", 61, @"%s is not available as initializer", "-[PXActivitySharingContext init]");

  abort();
}

- (PXActivitySharingContext)initWithAssetCollection:(id)a3 assetsDataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXActivitySharingContext.m", 56, @"%@ should be an instance inheriting from %@, but it is nil", @"assetsDataSource", v14 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    v16 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXActivitySharingContext.m", 56, @"%@ should be an instance inheriting from %@, but it is %@", @"assetsDataSource", v14, v16 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  v9 = [v8 photosDataSource];
  v10 = [(PXActivitySharingContext *)self initWithAssetCollection:v7 photosDataSource:v9];

  return v10;
}

- (PXActivitySharingContext)initWithAssetCollection:(id)a3 photosDataSource:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)PXActivitySharingContext;
  v9 = [(PXActivitySharingContext *)&v44 init];
  if (!v9) {
    goto LABEL_17;
  }
  v10 = [v7 localizedTitle];
  v11 = [v7 localizedSubtitle];
  id v12 = v7;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = id v43 = v8;
      v34 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v40 handleFailureInMethod:a2, v9, @"PXActivitySharingContext.m", 24, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"assetCollection", v33, v34 object file lineNumber description];

      id v8 = v43;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    id v42 = v8;
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_8:
        if (objc_msgSend(v13, "px_highlightKind") == 2)
        {
          v14 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v13];
          v15 = [MEMORY[0x1E4F38EB8] fetchAllAssetsInYearRepresentedByYearHighlight:v13 options:v14];
          v16 = (void *)MEMORY[0x1E4F38EE8];
          v17 = [v13 localizedTitle];
          id v12 = [v16 transientAssetCollectionWithAssetFetchResult:v15 title:v17];
        }
        else
        {
          v18 = [v13 smartDescription];
          uint64_t v19 = [v18 stringByReplacingOccurrencesOfString:*MEMORY[0x1E4F8AD88] withString:&stru_1F00B0030];

          [v13 dateDescription];
          v14 = v11;
          v11 = id v12 = v13;
          v10 = (void *)v19;
        }

        id v8 = v42;
        goto LABEL_12;
      }
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      v38 = (objc_class *)objc_opt_class();
      v37 = NSStringFromClass(v38);
      v39 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
      [v41 handleFailureInMethod:a2, v9, @"PXActivitySharingContext.m", 27, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollection", v37, v39 object file lineNumber description];

      v35 = v41;
    }
    else
    {
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      v36 = (objc_class *)objc_opt_class();
      v37 = NSStringFromClass(v36);
      [v35 handleFailureInMethod:a2, v9, @"PXActivitySharingContext.m", 27, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollection", v37 object file lineNumber description];
    }

    goto LABEL_8;
  }
LABEL_12:
  if ([v10 length] || !objc_msgSend(v11, "length"))
  {
    v20 = (NSString *)v11;
    v11 = v10;
  }
  else
  {

    v20 = 0;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F39150]);
  v45[0] = v12;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  v23 = [v12 photoLibrary];
  v24 = (PHFetchResult *)[v21 initWithObjects:v22 photoLibrary:v23 fetchType:*MEMORY[0x1E4F39650] fetchPropertySets:0 identifier:@"Share Sheet Photos Collection" registerIfNeeded:0];

  assetCollectionsFetchResult = v9->_assetCollectionsFetchResult;
  v9->_assetCollectionsFetchResult = v24;
  v26 = v24;

  title = v9->_title;
  v9->_title = (NSString *)v11;
  id v28 = v11;

  subtitle = v9->_subtitle;
  v9->_subtitle = v20;
  v30 = v20;

  objc_storeStrong((id *)&v9->_photosDataSource, a4);
LABEL_17:

  return v9;
}

@end