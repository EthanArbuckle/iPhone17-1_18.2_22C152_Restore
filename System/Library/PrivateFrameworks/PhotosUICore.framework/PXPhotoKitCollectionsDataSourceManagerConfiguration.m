@interface PXPhotoKitCollectionsDataSourceManagerConfiguration
+ (id)_generatePredicateForAssetTypesToInclude:(unint64_t)a3;
- (BOOL)_shouldSupportSyndicatedAssetFetches:(id)a3;
- (BOOL)includePeopleAlbum;
- (BOOL)separateSectionsForSmartAndUserCollections;
- (BOOL)shouldExcludePrivacySensitiveAlbums;
- (BOOL)shouldIgnoreLibraryChanges;
- (BOOL)simulateNonIncrementalChanges;
- (BOOL)skipAssetFetches;
- (BOOL)skipKeyAssetFetches;
- (BOOL)skipKeyAssetFetchesForSmartAlbums;
- (BOOL)skipSyndicatedAssetFetches;
- (BOOL)updateKeyAssetFetchesInBackground;
- (NSPredicate)assetsFilterPredicate;
- (PHCollectionList)collectionList;
- (PHFetchResult)collectionsFetchResult;
- (PXPhotoKitCollectionsDataSourceManagerConfiguration)init;
- (PXPhotoKitCollectionsDataSourceManagerConfiguration)initWithCollectionList:(id)a3;
- (PXPhotoKitCollectionsDataSourceManagerConfiguration)initWithCollectionList:(id)a3 collectionsFetchResult:(id)a4;
- (PXPhotoKitCollectionsDataSourceManagerConfiguration)initWithCollectionsFetchResult:(id)a3;
- (id)_newConfigurationWithCollectionList:(id)a3 collectionsFetchResult:(id)a4;
- (id)customFetchOptionsForCollection:(id)a3;
- (id)newConfigurationWithCollectionList:(id)a3;
- (id)newConfigurationWithCollectionsFetchResult:(id)a3;
- (int64_t)pausedChangeDetailsBufferLength;
- (unint64_t)assetTypesToInclude;
- (unint64_t)collectionTypesToInclude;
- (void)setAssetTypesToInclude:(unint64_t)a3;
- (void)setAssetsFilterPredicate:(id)a3;
- (void)setCollectionTypesToInclude:(unint64_t)a3;
- (void)setIncludePeopleAlbum:(BOOL)a3;
- (void)setPausedChangeDetailsBufferLength:(int64_t)a3;
- (void)setSeparateSectionsForSmartAndUserCollections:(BOOL)a3;
- (void)setShouldExcludePrivacySensitiveAlbums:(BOOL)a3;
- (void)setShouldIgnoreLibraryChanges:(BOOL)a3;
- (void)setSimulateNonIncrementalChanges:(BOOL)a3;
- (void)setSkipAssetFetches:(BOOL)a3;
- (void)setSkipKeyAssetFetches:(BOOL)a3;
- (void)setSkipKeyAssetFetchesForSmartAlbums:(BOOL)a3;
- (void)setSkipSyndicatedAssetFetches:(BOOL)a3;
- (void)setUpdateKeyAssetFetchesInBackground:(BOOL)a3;
@end

@implementation PXPhotoKitCollectionsDataSourceManagerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
  objc_storeStrong((id *)&self->_collectionsFetchResult, 0);
}

- (void)setShouldIgnoreLibraryChanges:(BOOL)a3
{
  self->_shouldIgnoreLibraryChanges = a3;
}

- (BOOL)shouldIgnoreLibraryChanges
{
  return self->_shouldIgnoreLibraryChanges;
}

- (void)setPausedChangeDetailsBufferLength:(int64_t)a3
{
  self->_pausedChangeDetailsBufferLength = a3;
}

- (int64_t)pausedChangeDetailsBufferLength
{
  return self->_pausedChangeDetailsBufferLength;
}

- (void)setSimulateNonIncrementalChanges:(BOOL)a3
{
  self->_simulateNonIncrementalChanges = a3;
}

- (BOOL)simulateNonIncrementalChanges
{
  return self->_simulateNonIncrementalChanges;
}

- (void)setShouldExcludePrivacySensitiveAlbums:(BOOL)a3
{
  self->_shouldExcludePrivacySensitiveAlbums = a3;
}

- (BOOL)shouldExcludePrivacySensitiveAlbums
{
  return self->_shouldExcludePrivacySensitiveAlbums;
}

- (void)setCollectionTypesToInclude:(unint64_t)a3
{
  self->_collectionTypesToInclude = a3;
}

- (unint64_t)collectionTypesToInclude
{
  return self->_collectionTypesToInclude;
}

- (void)setAssetTypesToInclude:(unint64_t)a3
{
  self->_assetTypesToInclude = a3;
}

- (unint64_t)assetTypesToInclude
{
  return self->_assetTypesToInclude;
}

- (void)setAssetsFilterPredicate:(id)a3
{
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (void)setUpdateKeyAssetFetchesInBackground:(BOOL)a3
{
  self->_updateKeyAssetFetchesInBackground = a3;
}

- (BOOL)updateKeyAssetFetchesInBackground
{
  return self->_updateKeyAssetFetchesInBackground;
}

- (void)setSkipSyndicatedAssetFetches:(BOOL)a3
{
  self->_skipSyndicatedAssetFetches = a3;
}

- (BOOL)skipSyndicatedAssetFetches
{
  return self->_skipSyndicatedAssetFetches;
}

- (void)setSkipAssetFetches:(BOOL)a3
{
  self->_skipAssetFetches = a3;
}

- (BOOL)skipAssetFetches
{
  return self->_skipAssetFetches;
}

- (void)setSkipKeyAssetFetchesForSmartAlbums:(BOOL)a3
{
  self->_skipKeyAssetFetchesForSmartAlbums = a3;
}

- (BOOL)skipKeyAssetFetchesForSmartAlbums
{
  return self->_skipKeyAssetFetchesForSmartAlbums;
}

- (void)setSkipKeyAssetFetches:(BOOL)a3
{
  self->_skipKeyAssetFetches = a3;
}

- (BOOL)skipKeyAssetFetches
{
  return self->_skipKeyAssetFetches;
}

- (void)setIncludePeopleAlbum:(BOOL)a3
{
  self->_includePeopleAlbum = a3;
}

- (BOOL)includePeopleAlbum
{
  return self->_includePeopleAlbum;
}

- (void)setSeparateSectionsForSmartAndUserCollections:(BOOL)a3
{
  self->_separateSectionsForSmartAndUserCollections = a3;
}

- (BOOL)separateSectionsForSmartAndUserCollections
{
  return self->_separateSectionsForSmartAndUserCollections;
}

- (PHCollectionList)collectionList
{
  return (PHCollectionList *)objc_getProperty(self, a2, 32, 1);
}

- (id)_newConfigurationWithCollectionList:(id)a3 collectionsFetchResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[PXPhotoKitCollectionsDataSourceManagerConfiguration alloc] initWithCollectionList:v7 collectionsFetchResult:v6];

  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setSeparateSectionsForSmartAndUserCollections:[(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self separateSectionsForSmartAndUserCollections]];
  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setIncludePeopleAlbum:[(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self includePeopleAlbum]];
  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setAssetTypesToInclude:[(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self assetTypesToInclude]];
  v9 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self assetsFilterPredicate];
  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setAssetsFilterPredicate:v9];

  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setCollectionTypesToInclude:[(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self collectionTypesToInclude]];
  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setShouldExcludePrivacySensitiveAlbums:[(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self shouldExcludePrivacySensitiveAlbums]];
  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setShouldIgnoreLibraryChanges:[(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self shouldIgnoreLibraryChanges]];
  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setSkipKeyAssetFetches:[(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self skipKeyAssetFetches]];
  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setSkipKeyAssetFetchesForSmartAlbums:[(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self skipKeyAssetFetchesForSmartAlbums]];
  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setSkipAssetFetches:[(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self skipAssetFetches]];
  [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v8 setSkipSyndicatedAssetFetches:[(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self skipSyndicatedAssetFetches]];
  return v8;
}

- (id)newConfigurationWithCollectionsFetchResult:(id)a3
{
  return [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self _newConfigurationWithCollectionList:0 collectionsFetchResult:a3];
}

- (id)newConfigurationWithCollectionList:(id)a3
{
  return [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self _newConfigurationWithCollectionList:a3 collectionsFetchResult:0];
}

- (BOOL)_shouldSupportSyndicatedAssetFetches:(id)a3
{
  id v4 = a3;
  if (-[PXPhotoKitCollectionsDataSourceManagerConfiguration skipSyndicatedAssetFetches](self, "skipSyndicatedAssetFetches")|| ([v4 photoLibrary], v5 = objc_claimAutoreleasedReturnValue(), +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", v5), id v6 = objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "showUnsavedSyndicatedContentInPhotosGrids"), v6, v5, !v7))
  {
    char ShouldShowUnsavedAssetsInGridForAssetCollection = 0;
  }
  else if ([v4 canContainAssets])
  {
    char ShouldShowUnsavedAssetsInGridForAssetCollection = PXContentSyndicationShouldShowUnsavedAssetsInGridForAssetCollection(v4);
  }
  else
  {
    char ShouldShowUnsavedAssetsInGridForAssetCollection = 1;
  }

  return ShouldShowUnsavedAssetsInGridForAssetCollection;
}

- (id)customFetchOptionsForCollection:(id)a3
{
  id v4 = a3;
  v5 = [v4 photoLibrary];
  id v6 = objc_msgSend(v5, "px_standardLibrarySpecificFetchOptions");

  BOOL v7 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self _shouldSupportSyndicatedAssetFetches:v4];
  [v6 setIncludeGuestAssets:v7];
  v8 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self assetsFilterPredicate];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_generatePredicateForAssetTypesToInclude:", -[PXPhotoKitCollectionsDataSourceManagerConfiguration assetTypesToInclude](self, "assetTypesToInclude"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  [v6 setInternalPredicate:v11];
  return v6;
}

- (PHFetchResult)collectionsFetchResult
{
  collectionsFetchResult = self->_collectionsFetchResult;
  if (!collectionsFetchResult)
  {
    id v4 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self collectionList];
    v5 = [v4 photoLibrary];
    id v6 = objc_msgSend(v5, "px_standardLibrarySpecificFetchOptions");

    objc_msgSend(v6, "setIncludePlacesSmartAlbum:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 6) & 1);
    objc_msgSend(v6, "setIncludeDuplicatesAlbums:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 16) & 1);
    objc_msgSend(v6, "setIncludeUserSmartAlbums:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 22) & 1);
    objc_msgSend(v6, "setIncludeAllPhotosSmartAlbum:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 2) & 1);
    objc_msgSend(v6, "setIncludeRecentlyEditedSmartAlbum:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 12) & 1);
    objc_msgSend(v6, "setIncludeScreenRecordingsSmartAlbum:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 7) & 1);
    objc_msgSend(v6, "setIncludeProResSmartAlbum:", (-[PXPhotoKitCollectionsDataSourceManagerConfiguration collectionTypesToInclude](self, "collectionTypesToInclude") >> 7) & 1);
    BOOL v7 = (void *)MEMORY[0x1E4F38FF8];
    v8 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self collectionList];
    v9 = [v7 fetchCollectionsInCollectionList:v8 options:v6];
    id v10 = self->_collectionsFetchResult;
    self->_collectionsFetchResult = v9;

    collectionsFetchResult = self->_collectionsFetchResult;
  }
  return collectionsFetchResult;
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)initWithCollectionList:(id)a3 collectionsFetchResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotoKitCollectionsDataSourceManagerConfiguration;
  v9 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    v9->_assetTypesToInclude = -1;
    v9->_collectionTypesToInclude = -1;
    objc_storeStrong((id *)&v9->_collectionList, a3);
    objc_storeStrong((id *)&v10->_collectionsFetchResult, a4);
  }

  return v10;
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)initWithCollectionsFetchResult:(id)a3
{
  return [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self initWithCollectionList:0 collectionsFetchResult:a3];
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)initWithCollectionList:(id)a3
{
  return [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self initWithCollectionList:a3 collectionsFetchResult:0];
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)init
{
  return [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self initWithCollectionList:0 collectionsFetchResult:0];
}

+ (id)_generatePredicateForAssetTypesToInclude:(unint64_t)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (a3 == -1)
  {
LABEL_9:
    id v4 = 0;
    goto LABEL_12;
  }
  char v3 = a3;
  if ((~(_BYTE)a3 & 3) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(kind) == %d OR noindex:(kind) == %d", 0, 1);
LABEL_4:
    id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(kindSubtype) != %d", 100);
    id v6 = v5;
    if (v4)
    {
      id v7 = (void *)MEMORY[0x1E4F28BA0];
      v11[0] = v4;
      v11[1] = v5;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
      uint64_t v9 = [v7 andPredicateWithSubpredicates:v8];

      id v4 = (id)v9;
    }
    else
    {
      id v4 = v5;
    }

    goto LABEL_12;
  }
  if ((a3 & 1) == 0)
  {
    if ((a3 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(kind) == %d OR noindex:(playbackStyle) == %d", 1, 5);
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(kind) == %d AND noindex:(playbackStyle) != %d", 0, 5);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((v3 & 2) != 0) {
    goto LABEL_5;
  }
LABEL_12:
  return v4;
}

@end