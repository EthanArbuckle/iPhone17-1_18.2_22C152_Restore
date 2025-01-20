@interface PXPhotosDataSourceConfiguration
- (BOOL)canIncludeUnsavedSyndicatedAssets;
- (BOOL)hideHiddenAssets;
- (BOOL)ignoreSharedLibraryFilters;
- (BOOL)includeAllBurstAssets;
- (BOOL)includeOthersInSocialGroupAssets;
- (BOOL)reverseSortOrder;
- (BOOL)wantsCurationByDefault;
- (NSArray)fetchPropertySets;
- (NSArray)filterPersons;
- (NSArray)sortDescriptors;
- (NSDictionary)existingAssetCollectionFetchResults;
- (NSDictionary)existingKeyAssetsFetchResults;
- (NSPredicate)basePredicate;
- (NSPredicate)filterPredicate;
- (NSSet)allowedOIDs;
- (NSSet)allowedUUIDs;
- (OS_dispatch_queue)clientQueue;
- (PHAsset)referenceAsset;
- (PHCollection)containerCollection;
- (PHFetchResult)collectionListFetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PHSocialGroup)filterSocialGroup;
- (PXLibraryFilterState)libraryFilterState;
- (PXPhotosDataSourceConfiguration)init;
- (PXPhotosDataSourceConfiguration)initWithAssetCollection:(id)a3 options:(unint64_t)a4;
- (PXPhotosDataSourceConfiguration)initWithAssetFetchResult:(id)a3 options:(unint64_t)a4;
- (PXPhotosDataSourceConfiguration)initWithCollectionListFetchResult:(id)a3 containerCollection:(id)a4 options:(unint64_t)a5;
- (PXPhotosDataSourceConfiguration)initWithCollectionListFetchResult:(id)a3 options:(unint64_t)a4;
- (id)assetContainerProvider;
- (int64_t)curationKind;
- (int64_t)curationType;
- (int64_t)libraryFilter;
- (unint64_t)options;
- (void)setAllowedOIDs:(id)a3;
- (void)setAllowedUUIDs:(id)a3;
- (void)setAssetContainerProvider:(id)a3;
- (void)setBasePredicate:(id)a3;
- (void)setCanIncludeUnsavedSyndicatedAssets:(BOOL)a3;
- (void)setClientQueue:(id)a3;
- (void)setCurationKind:(int64_t)a3;
- (void)setCurationType:(int64_t)a3;
- (void)setExistingAssetCollectionFetchResults:(id)a3;
- (void)setExistingKeyAssetsFetchResults:(id)a3;
- (void)setFetchPropertySets:(id)a3;
- (void)setFilterPersons:(id)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setFilterSocialGroup:(id)a3;
- (void)setHideHiddenAssets:(BOOL)a3;
- (void)setIgnoreSharedLibraryFilters:(BOOL)a3;
- (void)setIncludeAllBurstAssets:(BOOL)a3;
- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3;
- (void)setLibraryFilter:(int64_t)a3;
- (void)setLibraryFilterState:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setReferenceAsset:(id)a3;
- (void)setReverseSortOrder:(BOOL)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setWantsCurationByDefault:(BOOL)a3;
@end

@implementation PXPhotosDataSourceConfiguration

- (void)setLibraryFilterState:(id)a3
{
}

- (void)setLibraryFilter:(int64_t)a3
{
  self->_libraryFilter = a3;
}

- (void)setFilterPredicate:(id)a3
{
}

- (void)setCanIncludeUnsavedSyndicatedAssets:(BOOL)a3
{
  self->_canIncludeUnsavedSyndicatedAssets = a3;
}

- (PXPhotosDataSourceConfiguration)initWithCollectionListFetchResult:(id)a3 options:(unint64_t)a4
{
  return [(PXPhotosDataSourceConfiguration *)self initWithCollectionListFetchResult:a3 containerCollection:0 options:a4];
}

- (PXPhotosDataSourceConfiguration)initWithCollectionListFetchResult:(id)a3 containerCollection:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PXPhotosDataSourceConfiguration;
  v11 = [(PXPhotosDataSourceConfiguration *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_collectionListFetchResult, a3);
    objc_storeStrong((id *)&v12->_containerCollection, a4);
    v12->_options = a5;
    v13 = [v9 photoLibrary];
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v15 = [v10 photoLibrary];
    }
    photoLibrary = v12->_photoLibrary;
    v12->_photoLibrary = v15;

    v12->_ignoreSharedLibraryFilters = 0;
    v17 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v12->_photoLibrary];
    v18 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v17];
    libraryFilterState = v12->_libraryFilterState;
    v12->_libraryFilterState = v18;

    v12->_libraryFilter = 0;
    v12->_curationKind = 1;
  }
  return v12;
}

- (BOOL)wantsCurationByDefault
{
  return self->_wantsCurationByDefault;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (BOOL)reverseSortOrder
{
  return self->_reverseSortOrder;
}

- (PHAsset)referenceAsset
{
  return self->_referenceAsset;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)libraryFilter
{
  return self->_libraryFilter;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (BOOL)includeAllBurstAssets
{
  return self->_includeAllBurstAssets;
}

- (BOOL)ignoreSharedLibraryFilters
{
  return self->_ignoreSharedLibraryFilters;
}

- (BOOL)hideHiddenAssets
{
  return self->_hideHiddenAssets;
}

- (PHSocialGroup)filterSocialGroup
{
  return self->_filterSocialGroup;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (NSArray)filterPersons
{
  return self->_filterPersons;
}

- (NSArray)fetchPropertySets
{
  return self->_fetchPropertySets;
}

- (NSDictionary)existingKeyAssetsFetchResults
{
  return self->_existingKeyAssetsFetchResults;
}

- (NSDictionary)existingAssetCollectionFetchResults
{
  return self->_existingAssetCollectionFetchResults;
}

- (int64_t)curationType
{
  return self->_curationType;
}

- (int64_t)curationKind
{
  return self->_curationKind;
}

- (PHCollection)containerCollection
{
  return self->_containerCollection;
}

- (PHFetchResult)collectionListFetchResult
{
  return self->_collectionListFetchResult;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (BOOL)canIncludeUnsavedSyndicatedAssets
{
  return self->_canIncludeUnsavedSyndicatedAssets;
}

- (NSPredicate)basePredicate
{
  return self->_basePredicate;
}

- (id)assetContainerProvider
{
  return self->_assetContainerProvider;
}

- (NSSet)allowedUUIDs
{
  return self->_allowedUUIDs;
}

- (NSSet)allowedOIDs
{
  return self->_allowedOIDs;
}

- (void)setWantsCurationByDefault:(BOOL)a3
{
  self->_wantsCurationByDefault = a3;
}

- (void)setSortDescriptors:(id)a3
{
}

- (void)setFetchPropertySets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_assetContainerProvider, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_fetchPropertySets, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_filterSocialGroup, 0);
  objc_storeStrong((id *)&self->_filterPersons, 0);
  objc_storeStrong((id *)&self->_allowedOIDs, 0);
  objc_storeStrong((id *)&self->_allowedUUIDs, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_basePredicate, 0);
  objc_storeStrong((id *)&self->_referenceAsset, 0);
  objc_storeStrong((id *)&self->_existingKeyAssetsFetchResults, 0);
  objc_storeStrong((id *)&self->_existingAssetCollectionFetchResults, 0);
  objc_storeStrong((id *)&self->_containerCollection, 0);
  objc_storeStrong((id *)&self->_collectionListFetchResult, 0);
}

- (void)setAssetContainerProvider:(id)a3
{
}

- (void)setIncludeAllBurstAssets:(BOOL)a3
{
  self->_includeAllBurstAssets = a3;
}

- (void)setIgnoreSharedLibraryFilters:(BOOL)a3
{
  self->_ignoreSharedLibraryFilters = a3;
}

- (void)setReverseSortOrder:(BOOL)a3
{
  self->_reverseSortOrder = a3;
}

- (void)setClientQueue:(id)a3
{
}

- (void)setCurationKind:(int64_t)a3
{
  self->_curationKind = a3;
}

- (void)setCurationType:(int64_t)a3
{
  self->_curationType = a3;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (void)setHideHiddenAssets:(BOOL)a3
{
  self->_hideHiddenAssets = a3;
}

- (void)setFilterSocialGroup:(id)a3
{
}

- (void)setFilterPersons:(id)a3
{
}

- (void)setAllowedOIDs:(id)a3
{
}

- (void)setAllowedUUIDs:(id)a3
{
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  self->_includeOthersInSocialGroupAssets = a3;
}

- (void)setBasePredicate:(id)a3
{
}

- (void)setReferenceAsset:(id)a3
{
}

- (void)setExistingKeyAssetsFetchResults:(id)a3
{
}

- (void)setExistingAssetCollectionFetchResults:(id)a3
{
}

- (PXPhotosDataSourceConfiguration)initWithAssetCollection:(id)a3 options:(unint64_t)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isTransient])
  {
    v7 = (void *)MEMORY[0x1E4F39008];
    v19[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v9 = [v7 transientCollectionListWithCollections:v8 title:0];

    id v10 = [MEMORY[0x1E4F38EE8] fetchCollectionsInCollectionList:v9 options:0];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F39150]);
    id v9 = [v6 objectID];
    v18 = v9;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    v13 = [v6 photoLibrary];
    v14 = objc_opt_class();

    v15 = [v14 fetchType];
    id v10 = (void *)[v11 initWithOids:v12 photoLibrary:v13 fetchType:v15 fetchPropertySets:0 identifier:0 registerIfNeeded:1];

    id v6 = (id)v12;
  }

  v16 = [(PXPhotosDataSourceConfiguration *)self initWithCollectionListFetchResult:v10 options:a4];
  return v16;
}

- (PXPhotosDataSourceConfiguration)initWithAssetFetchResult:(id)a3 options:(unint64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:a3 title:0];
  v7 = (void *)MEMORY[0x1E4F39008];
  v13[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v9 = [v7 transientCollectionListWithCollections:v8 title:0];

  id v10 = [MEMORY[0x1E4F38EE8] fetchCollectionsInCollectionList:v9 options:0];
  id v11 = [(PXPhotosDataSourceConfiguration *)self initWithCollectionListFetchResult:v10 options:a4];

  return v11;
}

- (PXPhotosDataSourceConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXPhotosDataSource.m" lineNumber:4151 description:@"Use the designated initializer \"-initWithCollectionListFetchResult:options:\""];

  abort();
}

@end