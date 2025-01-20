@interface PXNavigationListDataSectionConfiguration
+ (id)configurationWithCollectionList:(id)a3;
+ (id)configurationWithCollectionsFetchResult:(id)a3;
- (BOOL)emptyCollectionsHidden;
- (BOOL)hideHiddenAlbum;
- (BOOL)includeKeyAssetFetches;
- (BOOL)includeUserSmartAlbums;
- (BOOL)showSyncedFromMacAlbums;
- (BOOL)simulateNonIncrementalChanges;
- (BOOL)skipAssetCountFetches;
- (BOOL)skipAssetFetches;
- (BOOL)skipKeyAssetFetchesForSmartAlbums;
- (BOOL)skipSyndicatedAssetFetches;
- (NSPredicate)assetsFilterPredicate;
- (PHCollectionList)collectionList;
- (PHFetchResult)collectionsFetchResult;
- (PXNavigationListDataSectionConfiguration)initWithCollectionList:(id)a3;
- (PXNavigationListDataSectionConfiguration)initWithCollectionsFetchResult:(id)a3;
- (id)description;
- (int64_t)pausedChangeDetailsBufferLength;
- (void)setAssetsFilterPredicate:(id)a3;
- (void)setEmptyCollectionsHidden:(BOOL)a3;
- (void)setHideHiddenAlbum:(BOOL)a3;
- (void)setIncludeKeyAssetFetches:(BOOL)a3;
- (void)setIncludeUserSmartAlbums:(BOOL)a3;
- (void)setPausedChangeDetailsBufferLength:(int64_t)a3;
- (void)setShowSyncedFromMacAlbums:(BOOL)a3;
- (void)setSimulateNonIncrementalChanges:(BOOL)a3;
- (void)setSkipAssetCountFetches:(BOOL)a3;
- (void)setSkipAssetFetches:(BOOL)a3;
- (void)setSkipKeyAssetFetchesForSmartAlbums:(BOOL)a3;
- (void)setSkipSyndicatedAssetFetches:(BOOL)a3;
@end

@implementation PXNavigationListDataSectionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_collectionsFetchResult, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
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

- (void)setAssetsFilterPredicate:(id)a3
{
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (void)setSkipSyndicatedAssetFetches:(BOOL)a3
{
  self->_skipSyndicatedAssetFetches = a3;
}

- (BOOL)skipSyndicatedAssetFetches
{
  return self->_skipSyndicatedAssetFetches;
}

- (void)setSkipAssetCountFetches:(BOOL)a3
{
  self->_skipAssetCountFetches = a3;
}

- (BOOL)skipAssetCountFetches
{
  return self->_skipAssetCountFetches;
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

- (void)setHideHiddenAlbum:(BOOL)a3
{
  self->_hideHiddenAlbum = a3;
}

- (BOOL)hideHiddenAlbum
{
  return self->_hideHiddenAlbum;
}

- (void)setIncludeUserSmartAlbums:(BOOL)a3
{
  self->_includeUserSmartAlbums = a3;
}

- (BOOL)includeUserSmartAlbums
{
  return self->_includeUserSmartAlbums;
}

- (void)setIncludeKeyAssetFetches:(BOOL)a3
{
  self->_includeKeyAssetFetches = a3;
}

- (BOOL)includeKeyAssetFetches
{
  return self->_includeKeyAssetFetches;
}

- (void)setShowSyncedFromMacAlbums:(BOOL)a3
{
  self->_showSyncedFromMacAlbums = a3;
}

- (BOOL)showSyncedFromMacAlbums
{
  return self->_showSyncedFromMacAlbums;
}

- (void)setEmptyCollectionsHidden:(BOOL)a3
{
  self->_emptyCollectionsHidden = a3;
}

- (BOOL)emptyCollectionsHidden
{
  return self->_emptyCollectionsHidden;
}

- (PHFetchResult)collectionsFetchResult
{
  return self->_collectionsFetchResult;
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PHCollectionList *)self->_collectionList localizedTitle];
  v6 = [v3 stringWithFormat:@"<%@: %p title = %@>", v4, self, v5];;

  return v6;
}

- (PXNavigationListDataSectionConfiguration)initWithCollectionsFetchResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXNavigationListDataSectionConfiguration;
  v6 = [(PXNavigationListDataSectionConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collectionsFetchResult, a3);
  }

  return v7;
}

- (PXNavigationListDataSectionConfiguration)initWithCollectionList:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXNavigationListDataSectionConfiguration;
  v6 = [(PXNavigationListDataSectionConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collectionList, a3);
  }

  return v7;
}

+ (id)configurationWithCollectionsFetchResult:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithCollectionsFetchResult:v4];

  return v5;
}

+ (id)configurationWithCollectionList:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithCollectionList:v4];

  return v5;
}

@end