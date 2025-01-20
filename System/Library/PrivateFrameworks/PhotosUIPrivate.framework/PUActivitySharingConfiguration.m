@interface PUActivitySharingConfiguration
- (BOOL)allowsAirPlayActivity;
- (BOOL)allowsSuggestLessPersonActivity;
- (BOOL)excludeShareActivity;
- (BOOL)wantsActionSheet;
- (NSArray)activities;
- (NSArray)excludedActivityTypes;
- (NSDictionary)assetsFetchResultsByAssetCollection;
- (NSString)subtitle;
- (NSString)title;
- (PHFetchResult)collectionListFetchResult;
- (PHFetchResult)initialAssetsFetchResult;
- (PHPerson)person;
- (PHSocialGroup)socialGroup;
- (PUActivitySharingConfiguration)initWithCollectionsFetchResult:(id)a3 selectionManager:(id)a4;
- (PUPhotoSelectionManager)selectionManager;
- (PXDisplayAsset)keyAsset;
- (PXPhotosDataSource)photosDataSource;
- (int64_t)sourceOrigin;
- (void)setActivities:(id)a3;
- (void)setAllowsAirPlayActivity:(BOOL)a3;
- (void)setAllowsSuggestLessPersonActivity:(BOOL)a3;
- (void)setAssetsFetchResultsByAssetCollection:(id)a3;
- (void)setExcludeShareActivity:(BOOL)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setInitialAssetsFetchResult:(id)a3;
- (void)setKeyAsset:(id)a3;
- (void)setPerson:(id)a3;
- (void)setPhotosDataSource:(id)a3;
- (void)setSocialGroup:(id)a3;
- (void)setSourceOrigin:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWantsActionSheet:(BOOL)a3;
@end

@implementation PUActivitySharingConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_assetsFetchResultsByAssetCollection, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_collectionListFetchResult, 0);
}

- (void)setInitialAssetsFetchResult:(id)a3
{
}

- (PHFetchResult)initialAssetsFetchResult
{
  return self->_initialAssetsFetchResult;
}

- (void)setSourceOrigin:(int64_t)a3
{
  self->_sourceOrigin = a3;
}

- (int64_t)sourceOrigin
{
  return self->_sourceOrigin;
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

- (void)setSocialGroup:(id)a3
{
}

- (PHSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (void)setPerson:(id)a3
{
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setAllowsSuggestLessPersonActivity:(BOOL)a3
{
  self->_allowsSuggestLessPersonActivity = a3;
}

- (BOOL)allowsSuggestLessPersonActivity
{
  return self->_allowsSuggestLessPersonActivity;
}

- (void)setAllowsAirPlayActivity:(BOOL)a3
{
  self->_allowsAirPlayActivity = a3;
}

- (BOOL)allowsAirPlayActivity
{
  return self->_allowsAirPlayActivity;
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

- (void)setAssetsFetchResultsByAssetCollection:(id)a3
{
}

- (NSDictionary)assetsFetchResultsByAssetCollection
{
  return self->_assetsFetchResultsByAssetCollection;
}

- (void)setPhotosDataSource:(id)a3
{
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (PUPhotoSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PHFetchResult)collectionListFetchResult
{
  return self->_collectionListFetchResult;
}

- (PUActivitySharingConfiguration)initWithCollectionsFetchResult:(id)a3 selectionManager:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUActivitySharingConfiguration.m", 20, @"Invalid parameter not satisfying: %@", @"collectionListFetchResult" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PUActivitySharingConfiguration.m", 21, @"Invalid parameter not satisfying: %@", @"selectionManager" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PUActivitySharingConfiguration;
  v11 = [(PUActivitySharingConfiguration *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_collectionListFetchResult, a3);
    objc_storeStrong((id *)&v12->_selectionManager, a4);
  }

  return v12;
}

@end