@interface PXPhotoKitAssetsDataSourceManagerConfiguration
- (BOOL)canIncludeUnsavedSyndicatedAssets;
- (BOOL)ignoreSharedLibraryFilters;
- (BOOL)reverseSortOrder;
- (NSArray)fetchPropertySets;
- (NSPredicate)basePredicate;
- (PHFetchResult)existingAssetsFetchResult;
- (PHFetchResult)existingKeyAssetsFetchResult;
- (unint64_t)options;
- (void)setBasePredicate:(id)a3;
- (void)setCanIncludeUnsavedSyndicatedAssets:(BOOL)a3;
- (void)setExistingAssetsFetchResult:(id)a3;
- (void)setExistingKeyAssetsFetchResult:(id)a3;
- (void)setFetchPropertySets:(id)a3;
- (void)setIgnoreSharedLibraryFilters:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setReverseSortOrder:(BOOL)a3;
@end

@implementation PXPhotoKitAssetsDataSourceManagerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePredicate, 0);
  objc_storeStrong((id *)&self->_fetchPropertySets, 0);
  objc_storeStrong((id *)&self->_existingKeyAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_existingAssetsFetchResult, 0);
}

- (void)setCanIncludeUnsavedSyndicatedAssets:(BOOL)a3
{
  self->_canIncludeUnsavedSyndicatedAssets = a3;
}

- (BOOL)canIncludeUnsavedSyndicatedAssets
{
  return self->_canIncludeUnsavedSyndicatedAssets;
}

- (void)setReverseSortOrder:(BOOL)a3
{
  self->_reverseSortOrder = a3;
}

- (BOOL)reverseSortOrder
{
  return self->_reverseSortOrder;
}

- (void)setIgnoreSharedLibraryFilters:(BOOL)a3
{
  self->_ignoreSharedLibraryFilters = a3;
}

- (BOOL)ignoreSharedLibraryFilters
{
  return self->_ignoreSharedLibraryFilters;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setBasePredicate:(id)a3
{
}

- (NSPredicate)basePredicate
{
  return self->_basePredicate;
}

- (void)setFetchPropertySets:(id)a3
{
}

- (NSArray)fetchPropertySets
{
  return self->_fetchPropertySets;
}

- (void)setExistingKeyAssetsFetchResult:(id)a3
{
}

- (PHFetchResult)existingKeyAssetsFetchResult
{
  return self->_existingKeyAssetsFetchResult;
}

- (void)setExistingAssetsFetchResult:(id)a3
{
}

- (PHFetchResult)existingAssetsFetchResult
{
  return self->_existingAssetsFetchResult;
}

@end