@interface PXPhotoKitAssetsDataSource
+ (PXPhotoKitAssetsDataSource)dataSourceWithAsset:(id)a3;
+ (PXPhotoKitAssetsDataSource)dataSourceWithAssetCollections:(id)a3;
+ (PXPhotoKitAssetsDataSource)dataSourceWithAssets:(id)a3;
+ (PXPhotoKitAssetsDataSource)dataSourceWithAssets:(id)a3 userInfo:(id)a4 transientIdentifier:(id)a5;
- (BOOL)areAllSectionsConsideredAccurate;
- (BOOL)containsAnyItems;
- (BOOL)containsMultipleItems;
- (BOOL)couldObjectReferenceAppear:(id)a3;
- (BOOL)getAssetCounts:(id *)a3 guestAssetCounts:(id *)a4 allowFetch:(BOOL)a5;
- (BOOL)hasCurationForAssetCollection:(id)a3;
- (BOOL)ignoreSharedLibraryFilters;
- (BOOL)includeOthersInSocialGroupAssets;
- (BOOL)isAssetAtIndexPathPartOfCuratedSet:(PXSimpleIndexPath *)a3;
- (BOOL)isFiltered;
- (BOOL)isFilteringAssetCollection:(id)a3;
- (BOOL)isFilteringDisabledForAssetCollection:(id)a3;
- (BOOL)isSectionConsideredAccurate:(int64_t)a3;
- (BOOL)isSorted;
- (BOOL)startsAtEnd;
- (NSDictionary)userInfo;
- (PXPhotoKitAssetsDataSource)initWithImmutablePhotosDataSource:(id)a3 withChange:(id)a4;
- (PXPhotoKitAssetsDataSource)initWithImmutablePhotosDataSource:(id)a3 withChangeDetails:(id)a4;
- (PXPhotosDataSource)photosDataSource;
- (PXSectionedDataSourceChangeDetails)changeDetails;
- (PXSimpleIndexPath)_indexPathForObjectReference:(SEL)a3 restrictedToSection:(id)a4;
- (PXSimpleIndexPath)_indexPathForSavedSyndicatedAssetReference:(SEL)a3;
- (PXSimpleIndexPath)indexPathForObjectID:(SEL)a3;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (PXSimpleIndexPath)keyAssetIndexPathForSectionIndexPath:(SEL)a3;
- (id)_assetCollectionReferenceNearestToObjectReferenceAssumingSortedByIncreasingCreationDate:(id)a3;
- (id)_assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch:(id)a3;
- (id)_fastKeyCuratedAssetForAssetCollection:(id)a3;
- (id)assetCollectionReferenceNearestToObjectReference:(id)a3;
- (id)assetCollectionReferencesWithParentAssetCollectionReference:(id)a3;
- (id)assetCollectionReferencesWithParentAssetCollectionReference:(id)a3 assetCollectionReferenceWithSameKeyAssetAsParent:(id *)a4;
- (id)assetIdentifierAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)container;
- (id)containerCollection;
- (id)curatedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (id)description;
- (id)fetchAllItemObjects;
- (id)filterPredicate;
- (id)firstAssetCollection;
- (id)indexPathSetForObjectIDs:(id)a3;
- (id)inputForItem:(id)a3;
- (id)keyAssetsForAssetCollection:(id)a3;
- (id)keyAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (id)lastAssetCollection;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectReferenceAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectReferenceNearestToObjectReference:(id)a3;
- (id)objectReferenceNearestToObjectReference:(id)a3 inSection:(int64_t)a4;
- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3;
- (id)primaryFaceForAssetAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)selectionSnapshotForAsset:(id)a3 assetCollection:(id)a4;
- (id)selectionSnapshotForAssetsByAssetCollection:(id)a3;
- (id)startingAssetReference;
- (id)uncuratedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)estimatedAssetsCountWithEnrichmentState:(unsigned __int16)a3;
- (int64_t)identifier;
- (int64_t)libraryFilter;
- (int64_t)numberOfCuratedItemsInAssetCollection:(id)a3;
- (int64_t)numberOfCuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSectionsWithEnrichmentState:(unsigned __int16)a3;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
- (int64_t)numberOfUncuratedItemsInAssetCollection:(id)a3;
- (int64_t)numberOfUncuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)startingSection;
- (unint64_t)estimatedAssetCountForSectionIndexPath:(PXSimpleIndexPath *)a3;
- (unint64_t)estimatedOtherCount;
- (unint64_t)estimatedPhotosCount;
- (unint64_t)estimatedVideosCount;
- (void)prefetchIndexPaths:(id)a3;
- (void)prefetchIndexPaths:(id)a3 level:(unint64_t)a4;
- (void)prefetchSections:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation PXPhotoKitAssetsDataSource

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPhotoKitAssetsDataSource *)self identifier])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 117, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == [self identifier]" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8) {
    goto LABEL_12;
  }
  if (a3->item == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3->section != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
      uint64_t v8 = [v7 assetCollectionForSection:a3->section];
      goto LABEL_9;
    }
LABEL_12:
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    long long v13 = *(_OWORD *)&a3->item;
    long long v14 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v15 = v13;
    PXSimpleIndexPathDescription();
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  v7 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  long long v9 = *(_OWORD *)&a3->item;
  long long v14 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v15 = v9;
  uint64_t v8 = [v7 assetAtSimpleIndexPath:&v14];
LABEL_9:
  v10 = (void *)v8;

  return v10;
}

- (int64_t)identifier
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  int64_t v3 = [v2 versionIdentifier];

  return v3;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (BOOL)startsAtEnd
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  int64_t v3 = [v2 containerCollection];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 startsAtEnd];
  }
  else if ([v2 numberOfSections] < 1)
  {
    char v5 = 0;
  }
  else
  {
    v6 = [v2 assetCollectionForSection:0];
    char v5 = [v6 startsAtEnd];
  }
  char v7 = v5 ^ [v2 reverseSortOrder];

  return v7;
}

- (id)containerCollection
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  int64_t v3 = [v2 containerCollection];

  return v3;
}

- (BOOL)containsAnyItems
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v3 = [v2 isEmpty] ^ 1;

  return v3;
}

- (PXPhotoKitAssetsDataSource)initWithImmutablePhotosDataSource:(id)a3 withChangeDetails:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotoKitAssetsDataSource;
  v10 = [(PXPhotoKitAssetsDataSource *)&v15 init];
  if (v10)
  {
    if (([v8 options] & 4) == 0)
    {
      long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v10, @"PXPhotoKitAssetsDataSource.m", 82, @"Invalid parameter not satisfying: %@", @"([immutablePhotosDataSource options] & PXPhotosDataSourceOptionDisableChangeHandling) == PXPhotosDataSourceOptionDisableChangeHandling" object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_photosDataSource, a3);
    objc_storeStrong((id *)&v10->_changeDetails, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    layoutItemByAssetCache = v10->_layoutItemByAssetCache;
    v10->_layoutItemByAssetCache = v11;
  }
  return v10;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v4 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  int64_t v5 = [v4 numberOfItemsInSection:a3];

  return v5;
}

- (BOOL)areAllSectionsConsideredAccurate
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v3 = [v2 areAllSectionsConsideredAccurate];

  return v3;
}

- (int64_t)numberOfSections
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  int64_t v3 = [v2 numberOfSections];

  return v3;
}

- (int64_t)libraryFilter
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  int64_t v3 = [v2 libraryFilter];

  return v3;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  return [(PXPhotoKitAssetsDataSource *)self _indexPathForObjectReference:a4 restrictedToSection:0x7FFFFFFFFFFFFFFFLL];
}

- (PXSimpleIndexPath)_indexPathForObjectReference:(SEL)a3 restrictedToSection:(id)a4
{
  id v9 = a4;
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->int64_t item = 0u;
  v55.receiver = self;
  v55.super_class = (Class)PXPhotoKitAssetsDataSource;
  [(PXSimpleIndexPath *)&v55 indexPathForObjectReference:v9];
  int64_t dataSourceIdentifier = retstr->dataSourceIdentifier;
  if (retstr->dataSourceIdentifier != *(void *)off_1E5DAAED8) {
    goto LABEL_49;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
    long long v14 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
    id v15 = v9;
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_9;
      }
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      v45 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v45);
      v46 = objc_msgSend(v15, "px_descriptionForAssertionMessage");
      [v42 handleFailureInMethod:a3, self, @"PXPhotoKitAssetsDataSource.m", 250, @"%@ should be an instance inheriting from %@, but it is %@", @"objectReference", v44, v46 object file lineNumber description];
    }
    else
    {
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      v43 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v43);
      [v42 handleFailureInMethod:a3, self, @"PXPhotoKitAssetsDataSource.m", 250, @"%@ should be an instance inheriting from %@, but it is nil", @"objectReference", v44 object file lineNumber description];
    }

LABEL_9:
    v16 = [v15 assetCollection];
    int64_t v17 = [v14 sectionForAssetCollection:v16];

    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      retstr->int64_t dataSourceIdentifier = [(PXPhotoKitAssetsDataSource *)self identifier];
      retstr->int64_t section = v17;
      *(int64x2_t *)&retstr->int64_t item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    }
    goto LABEL_43;
  }
  id v11 = v9;
  char v54 = 0;
  uint64_t v12 = [(PXPhotoKitAssetsDataSource *)self changeDetails];
  long long v13 = (void *)v12;
  if (!v11)
  {
    memset(v51, 0, sizeof(v51));
    if (v12) {
      goto LABEL_5;
    }
LABEL_12:
    long long v52 = 0u;
    long long v53 = 0u;
    goto LABEL_13;
  }
  [v11 indexPath];
  if (!v13) {
    goto LABEL_12;
  }
LABEL_5:
  [v13 indexPathAfterApplyingChangesToIndexPath:v51 hasIncrementalChanges:&v54 objectChanged:0];
LABEL_13:
  long long v18 = v53;
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = v52;
  *(_OWORD *)&retstr->int64_t item = v18;

  v19 = [v11 asset];
  v20 = v19;
  if (retstr->dataSourceIdentifier != dataSourceIdentifier || v54)
  {
    if (retstr->dataSourceIdentifier == dataSourceIdentifier && PXDisplayAssetIsSyndicatedAndUnsaved(v19))
    {
      [(PXPhotoKitAssetsDataSource *)self _indexPathForSavedSyndicatedAssetReference:v11];
      long long v25 = v53;
      *(_OWORD *)&retstr->int64_t dataSourceIdentifier = v52;
      *(_OWORD *)&retstr->int64_t item = v25;
    }
    goto LABEL_42;
  }
  v50 = a3;
  v21 = [v11 asset];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v23 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
    v24 = v23;
    if (a5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v11 asset];
      objc_claimAutoreleasedReturnValue();
      if (v11) {
        [v11 indexPath];
      }
      PXIndexPathFromSimpleIndexPath();
    }
    if ([v23 numberOfSections] > a5)
    {
      uint64_t v29 = [v24 assetCollectionForSection:a5];
      if (v29)
      {
        v30 = (void *)v29;
        v31 = [v11 asset];
        uint64_t v32 = [v24 indexPathForAsset:v31 inCollection:v30];

        if (v32)
        {

          goto LABEL_40;
        }
      }
    }
    if (PXDisplayAssetIsSyndicatedAndUnsaved(v20))
    {
      [(PXPhotoKitAssetsDataSource *)self _indexPathForSavedSyndicatedAssetReference:v11];
      long long v33 = v53;
      *(_OWORD *)&retstr->int64_t dataSourceIdentifier = v52;
      *(_OWORD *)&retstr->int64_t item = v33;
    }
  }
  else
  {
    v24 = [v11 asset];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v26 = [v24 uuid];
      if (v26)
      {
        v27 = (void *)v26;
        if (objc_opt_respondsToSelector())
        {
          v28 = [v24 burstIdentifier];
        }
        else
        {
          v28 = 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v49 = v28;
        }
        else
        {

          v49 = 0;
        }
        v35 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
        v36 = [v35 indexPathForLastAsset];

        v37 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
        v48 = v27;
        v34 = [v37 indexPathForAssetWithUUID:v27 orBurstIdentifier:v49 hintIndexPath:v36 hintCollection:0];

        if (v34)
        {
LABEL_40:
          [(PXPhotoKitAssetsDataSource *)self identifier];
          PXSimpleIndexPathFromIndexPath();
        }
        goto LABEL_41;
      }
    }
  }

  v34 = 0;
LABEL_41:

  a3 = v50;
LABEL_42:

LABEL_43:
  if (retstr->dataSourceIdentifier != dataSourceIdentifier)
  {
    int64_t section = retstr->section;
    if (section >= [(PXPhotoKitAssetsDataSource *)self numberOfSections])
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:a3 object:self file:@"PXPhotoKitAssetsDataSource.m" lineNumber:257 description:@"Section must be valid"];
    }
    int64_t item = retstr->item;
    if (item != 0x7FFFFFFFFFFFFFFFLL
      && item >= [(PXPhotoKitAssetsDataSource *)self numberOfItemsInSection:retstr->section])
    {
      v47 = [MEMORY[0x1E4F28B00] currentHandler];
      [v47 handleFailureInMethod:a3 object:self file:@"PXPhotoKitAssetsDataSource.m" lineNumber:258 description:@"Item must be valid"];
    }
  }
LABEL_49:

  return result;
}

- (id)firstAssetCollection
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  int64_t v3 = [v2 firstAssetCollection];

  return v3;
}

- (int64_t)numberOfSectionsWithEnrichmentState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v4 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  int64_t v5 = [v4 numberOfSectionsWithEnrichmentState:v3];

  return v5;
}

- (int64_t)estimatedAssetsCountWithEnrichmentState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v4 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  int64_t v5 = [v4 estimatedAssetsCountWithEnrichmentState:v3];

  return v5;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    PXSimpleIndexPathDescription();
  }
  v6 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v7 = [v6 assetsInSection:a3->section];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v6 emptyAssetsFetchResult];
  }
  v10 = v9;

  return v10;
}

- (void)prefetchIndexPaths:(id)a3 level:(unint64_t)a4
{
  BOOL v5 = a4 == 1;
  id v6 = a3;
  id v7 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  [v7 prefetchAssetsAtIndexPaths:v6 onlyThumbnailAssets:v5];
}

- (id)filterPredicate
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  uint64_t v3 = [v2 filterPredicate];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDetails, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_assetReferenceNearestToAssetCache, 0);
  objc_storeStrong((id *)&self->_fetchedKeyAssetByAssetCollectionLocalIdentifierCache, 0);
  objc_storeStrong((id *)&self->_layoutItemByAssetCache, 0);
}

- (id)objectReferenceAtIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v5 = *(void *)off_1E5DAAED8;
  if (a3->dataSourceIdentifier != *(void *)off_1E5DAAED8
    && a3->section != 0x7FFFFFFFFFFFFFFFLL
    && a3->item == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v10 = *(_OWORD *)&a3->item;
    long long v20 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v21 = v10;
    id v11 = [(PXPhotoKitAssetsDataSource *)self assetCollectionAtSectionIndexPath:&v20];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v12 = *(_OWORD *)&a3->item;
    long long v18 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v19 = v12;
    [(PXPhotoKitAssetsDataSource *)self keyAssetIndexPathForSectionIndexPath:&v18];
    if ((void)v20 == v5)
    {
      long long v13 = 0;
    }
    else
    {
      long long v18 = v20;
      long long v19 = v21;
      long long v13 = [(PXPhotoKitAssetsDataSource *)self assetReferenceAtItemIndexPath:&v18];
    }
    id v14 = objc_alloc((Class)off_1E5DA55C0);
    long long v15 = *(_OWORD *)&a3->item;
    long long v18 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v19 = v15;
    id v9 = (void *)[v14 initWithAssetCollection:v11 keyAssetReference:v13 indexPath:&v18];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PXPhotoKitAssetsDataSource;
    long long v8 = *(_OWORD *)&a3->item;
    long long v20 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v21 = v8;
    id v9 = [(PXPhotoKitAssetsDataSource *)&v17 objectReferenceAtIndexPath:&v20];
  }
  return v9;
}

- (BOOL)getAssetCounts:(id *)a3 guestAssetCounts:(id *)a4 allowFetch:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v8 = *(void *)off_1E5DAAEE8;
  uint64_t v7 = *((void *)off_1E5DAAEE8 + 1);
  unint64_t v9 = *((void *)off_1E5DAAEE8 + 2);
  long long v10 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  id v11 = [v10 photoLibrary];
  long long v12 = +[PXPhotosMetadataFetcher sharedFetcherForPhotoLibrary:v11];

  long long v13 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  uint64_t v14 = [(PXPhotoKitAssetsDataSource *)self numberOfSections];
  v15.i64[0] = v8;
  v15.i64[1] = v7;
  int64x2_t v28 = v15;
  v15.i64[0] = v7;
  v15.i64[1] = v9;
  int64x2_t v27 = v15;
  if (v14 < 1)
  {
    BOOL v17 = 1;
    unint64_t v19 = v9;
    goto LABEL_15;
  }
  uint64_t v16 = v14;
  BOOL v17 = 0;
  uint64_t v18 = 0;
  unint64_t v19 = v9;
  while (1)
  {
    uint64_t v20 = [v13 assetsInSection:v18];
    if (v20) {
      break;
    }
LABEL_9:
    BOOL v17 = ++v18 >= v16;
    if (v16 == v18) {
      goto LABEL_15;
    }
  }
  long long v21 = (void *)v20;
  *(_OWORD *)v31 = *(_OWORD *)off_1E5DAAEE8;
  *(void *)&v31[16] = v9;
  int64x2_t v26 = *(int64x2_t *)v31;
  int64x2_t v29 = *(int64x2_t *)v31;
  unint64_t v30 = v9;
  if ([v12 getAssetCounts:v31 guestAssetCounts:&v29 forFetchResult:v20 allowFetch:v5])
  {
    v22 = [v13 assetCollectionForSection:v18];
    if ((objc_msgSend(v22, "px_isAllPhotosSmartAlbum") & 1) != 0
      || objc_msgSend(v22, "px_isRecentsSmartAlbum"))
    {
      PXDisplayAssetDetailedCountsSubtract();
    }
    if (objc_msgSend(v22, "px_isContentSyndicationAlbum"))
    {
      int64x2_t v29 = v26;
      unint64_t v30 = v9;
    }
    v8 += *(void *)v31;
    int64x2_t v27 = vaddq_s64(*(int64x2_t *)&v31[8], v27);
    int64x2_t v28 = vaddq_s64(v29, v28);
    v19 += v30;

    goto LABEL_9;
  }
  int64x2_t v28 = *(int64x2_t *)off_1E5DAAEE0;
  unint64_t v19 = *((void *)off_1E5DAAEE0 + 2);

  int64x2_t v27 = vzip2q_s64(v28, vdupq_n_s64(v19));
  unint64_t v8 = v28.i64[0];
LABEL_15:
  if (a3)
  {
    a3->var0 = v8;
    *(int64x2_t *)&a3->var1 = v27;
  }
  if (a4)
  {
    *(int64x2_t *)&a4->var0 = v28;
    a4->var2 = v19;
  }

  return v17;
}

- (PXSectionedDataSourceChangeDetails)changeDetails
{
  return self->_changeDetails;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (id)selectionSnapshotForAssetsByAssetCollection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  id v6 = [off_1E5DA7430 indexPathSet];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __74__PXPhotoKitAssetsDataSource_selectionSnapshotForAssetsByAssetCollection___block_invoke;
  int64x2_t v15 = &unk_1E5DC2528;
  id v16 = v5;
  id v17 = v6;
  id v7 = v6;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v12];

  id v9 = objc_alloc((Class)off_1E5DA84E8);
  long long v10 = objc_msgSend(v9, "initWithDataSource:selectedIndexPaths:", self, v7, v12, v13, v14, v15);

  return v10;
}

void __74__PXPhotoKitAssetsDataSource_selectionSnapshotForAssetsByAssetCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(a1 + 32) indexPathForAsset:*(void *)(*((void *)&v17 + 1) + 8 * v10) inCollection:v5];
        uint64_t v12 = [*(id *)(a1 + 32) versionIdentifier];
        uint64_t v13 = [v11 section];
        uint64_t v14 = [v11 item];
        int64x2_t v15 = *(void **)(a1 + 40);
        v16[0] = v12;
        v16[1] = v13;
        v16[2] = v14;
        v16[3] = 0x7FFFFFFFFFFFFFFFLL;
        [v15 addIndexPath:v16];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (id)selectionSnapshotForAsset:(id)a3 assetCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  uint64_t v9 = [v8 indexPathForAsset:v7 inCollection:v6];

  v12[0] = [v8 versionIdentifier];
  v12[1] = [v9 section];
  v12[2] = [v9 item];
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v10 = (void *)[objc_alloc((Class)off_1E5DA84E8) initWithDataSource:self selectedIndexPath:v12];

  return v10;
}

- (id)inputForItem:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXPhotoKitAssetsDataSource *)self identifier];
  uint64_t v6 = objc_msgSend(v4, "px_section");
  uint64_t v7 = objc_msgSend(v4, "px_item");
  uint64_t v8 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  uint64_t v9 = objc_msgSend(v4, "px_section");

  uint64_t v10 = [v8 assetCollectionForSection:v9];

  id v11 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  LODWORD(v9) = [v11 wantsCurationForAssetCollection:v10];

  uint64_t v12 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  v19[0] = v5;
  v19[1] = v6;
  v19[2] = v7;
  v19[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = [v12 assetAtSimpleIndexPath:v19];

  if (v9)
  {
    uint64_t v14 = [v13 objectID];
    id v15 = [(NSMutableDictionary *)self->_layoutItemByAssetCache objectForKey:v14];
    if (!v15)
    {
      id v16 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
      [v16 weightForAsset:v13];

      id v17 = objc_alloc((Class)off_1E5DA6FF0);
      [v13 size];
      id v15 = (id)objc_msgSend(v17, "initWithSize:weight:");
      [(NSMutableDictionary *)self->_layoutItemByAssetCache setObject:v15 forKey:v14];
    }
  }
  else
  {
    id v15 = v13;
  }

  return v15;
}

- (id)fetchAllItemObjects
{
  if ([(PXPhotoKitAssetsDataSource *)self numberOfSections] == 1)
  {
    uint64_t v3 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
    id v4 = [v3 assetsInSection:0];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXPhotoKitAssetsDataSource;
    id v4 = [(PXPhotoKitAssetsDataSource *)&v6 fetchAllItemObjects];
  }
  return v4;
}

- (void)prefetchSections:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  [v5 prefetchAssetsInSections:v4];
}

- (void)prefetchIndexPaths:(id)a3
{
}

- (BOOL)isSectionConsideredAccurate:(int64_t)a3
{
  id v4 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  LOBYTE(a3) = [v4 isSectionConsideredAccurate:a3];

  return a3;
}

- (BOOL)couldObjectReferenceAppear:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_super v6 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
    uint64_t v7 = [v5 asset];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v8 = [v6 isEmpty];

      if (v8)
      {
        int v9 = 1;
LABEL_15:

        BOOL v10 = v9 != 0;
        goto LABEL_16;
      }
      id v11 = [v5 asset];
      int v12 = [v11 isCloudSharedAsset];

      uint64_t v13 = [v6 numberOfSections];
      if (v13 < 1)
      {
        int v9 = 0;
        goto LABEL_15;
      }
      uint64_t v14 = v13;
      uint64_t v7 = 0;
      uint64_t v15 = 1;
      do
      {
        id v16 = v7;
        uint64_t v7 = [v6 assetCollectionForSection:v15 - 1];

        int v17 = v12 ^ [v7 isCloudSharedAlbum];
      }
      while (v17 == 1 && v15++ < v14);
      int v9 = v17 ^ 1;
    }
    else
    {
      int v9 = 1;
    }

    goto LABEL_15;
  }
  BOOL v10 = 1;
LABEL_16:

  return v10;
}

- (BOOL)containsMultipleItems
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v3 = [v2 containsMultipleAssets];

  return v3;
}

- (BOOL)isSorted
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v3 = [v2 sortDescriptors];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)ignoreSharedLibraryFilters
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v3 = [v2 ignoreSharedLibraryFilters];

  return v3;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v3 = [v2 includeOthersInSocialGroupAssets];

  return v3;
}

- (BOOL)isFiltered
{
  char v3 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  BOOL v4 = [v3 filterPredicate];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_super v6 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
    uint64_t v7 = [v6 allowedUUIDs];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (int64_t)startingSection
{
  char v3 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  if ([v3 numberOfSections] < 1)
  {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if ([(PXPhotoKitAssetsDataSource *)self startsAtEnd])
  {
    int64_t v4 = [v3 numberOfSections] - 1;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)startingAssetReference
{
  long long v10 = *(_OWORD *)((char *)off_1E5DAB028 + 8);
  uint64_t v11 = *((void *)off_1E5DAB028 + 3);
  char v3 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  if ([v3 numberOfSections] < 1)
  {
    uint64_t v4 = *(void *)off_1E5DAB028;
  }
  else
  {
    if ([(PXPhotoKitAssetsDataSource *)self startsAtEnd]) {
      [(PXPhotoKitAssetsDataSource *)self lastItemIndexPath];
    }
    else {
      [(PXPhotoKitAssetsDataSource *)self firstItemIndexPath];
    }
    uint64_t v4 = v7;
    long long v10 = v8;
    uint64_t v11 = v9;
  }
  if (v4 == *(void *)off_1E5DAAED8)
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v7 = v4;
    long long v8 = v10;
    uint64_t v9 = v11;
    BOOL v5 = [(PXPhotoKitAssetsDataSource *)self assetReferenceAtItemIndexPath:&v7];
  }

  return v5;
}

- (id)assetCollectionReferencesWithParentAssetCollectionReference:(id)a3 assetCollectionReferenceWithSameKeyAssetAsParent:(id *)a4
{
  id v4 = a3;
  [v4 assetCollection];
  v45 = unint64_t v5 = 0x1E4F39000uLL;
  if (!v45)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v32 = (objc_class *)objc_opt_class();
    long long v33 = NSStringFromClass(v32);
    [v31 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 823, @"%@ should be an instance inheriting from %@, but it is nil", @"parentAssetCollectionReference.assetCollection", v33 object file lineNumber description];
LABEL_30:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    v34 = (objc_class *)objc_opt_class();
    long long v33 = NSStringFromClass(v34);
    v35 = objc_msgSend(v45, "px_descriptionForAssertionMessage");
    [v31 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 823, @"%@ should be an instance inheriting from %@, but it is %@", @"parentAssetCollectionReference.assetCollection", v33, v35 object file lineNumber description];

    goto LABEL_30;
  }
LABEL_3:
  v41 = v4;
  objc_super v6 = [v4 keyAssetReference];
  uint64_t v7 = [v6 asset];

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      v39 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
      [v36 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 824, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"parentAssetCollectionReference.keyAssetReference.asset", v38, v39 object file lineNumber description];
    }
  }
  v42 = v7;
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v8 = [(PXPhotoKitAssetsDataSource *)self identifier];
  int64_t v9 = [(PXPhotoKitAssetsDataSource *)self numberOfSections];
  long long v10 = v45;
  if (v9)
  {
    int64_t v11 = v9;
    uint64_t v12 = 0;
    int64x2_t v47 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    while (1)
    {
      int64_t v48 = v8;
      uint64_t v49 = v12;
      int64x2_t v50 = v47;
      uint64_t v13 = [(PXPhotoKitAssetsDataSource *)self assetCollectionAtSectionIndexPath:&v48];
      if (objc_msgSend(v13, "px_highlightKind") != -1) {
        break;
      }
LABEL_17:

      if (v11 == ++v12) {
        goto LABEL_22;
      }
    }
    id v14 = v13;
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_11:
        unint64_t v15 = v5;
        id v16 = [v14 parentPhotosHighlight];
        int v17 = [v10 objectID];
        int v18 = [v16 isEqual:v17];

        if (v18)
        {
          id v19 = objc_alloc((Class)off_1E5DA55C0);
          int64_t v48 = v8;
          uint64_t v49 = v12;
          int64x2_t v50 = v47;
          long long v20 = (void *)[v19 initWithAssetCollection:v14 keyAssetReference:0 indexPath:&v48];
          [v43 addObject:v20];
          if (a4)
          {
            long long v21 = [v42 objectID];
            uint64_t v22 = [v14 keyAssetObjectIDForKind];
            int v23 = [v21 isEqual:v22];

            if (v23) {
              *a4 = v20;
            }
          }

          long long v10 = v45;
        }

        unint64_t v5 = v15;
        goto LABEL_17;
      }
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      int64x2_t v27 = (objc_class *)objc_opt_class();
      int64x2_t v26 = NSStringFromClass(v27);
      int64x2_t v28 = objc_msgSend(v14, "px_descriptionForAssertionMessage");
      [v24 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 834, @"%@ should be an instance inheriting from %@, but it is %@", @"candidateAssetCollection", v26, v28 object file lineNumber description];
    }
    else
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v25 = (objc_class *)objc_opt_class();
      int64x2_t v26 = NSStringFromClass(v25);
      [v24 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 834, @"%@ should be an instance inheriting from %@, but it is nil", @"candidateAssetCollection", v26 object file lineNumber description];
    }

    goto LABEL_11;
  }
LABEL_22:
  if ([v43 count]) {
    int64x2_t v29 = (void *)[v43 copy];
  }
  else {
    int64x2_t v29 = 0;
  }

  return v29;
}

- (id)assetCollectionReferencesWithParentAssetCollectionReference:(id)a3
{
  return [(PXPhotoKitAssetsDataSource *)self assetCollectionReferencesWithParentAssetCollectionReference:a3 assetCollectionReferenceWithSameKeyAssetAsParent:0];
}

- (id)lastAssetCollection
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v3 = [v2 lastAssetCollection];

  return v3;
}

- (id)container
{
  v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v3 = [v2 container];

  return v3;
}

- (id)assetIdentifierAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPhotoKitAssetsDataSource *)self identifier])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 789, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 790, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(indexPath)" object file lineNumber description];
  }
  int64_t v9 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  long long v10 = [v9 assetsInSection:a3->section];
  int64_t v11 = [v10 objectIDAtIndex:a3->item];

  if (!v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)PXPhotoKitAssetsDataSource;
    long long v15 = *(_OWORD *)&a3->item;
    v16[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v16[1] = v15;
    int64_t v11 = [(PXPhotoKitAssetsDataSource *)&v17 assetIdentifierAtItemIndexPath:v16];
  }
  return v11;
}

- (id)indexPathSetForObjectIDs:(id)a3
{
  id v4 = a3;
  uint64_t v22 = [v4 count];
  if (v22)
  {
    unint64_t v5 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
    int64_t v21 = [(PXPhotoKitAssetsDataSource *)self identifier];
    long long v20 = v5;
    uint64_t v6 = [v5 numberOfSections];
    int v23 = [off_1E5DA7430 indexPathSet];
    uint64_t v24 = v6;
    if (v6 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      while (1)
      {
        int64_t v9 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
        long long v10 = [v9 assetsInSection:v7];

        int64_t v11 = [v10 fetchedObjectIDsSet];
        uint64_t v12 = [MEMORY[0x1E4F1CA80] setWithSet:v4];
        [v12 intersectSet:v11];
        if ([v12 count])
        {
          uint64_t v13 = [v10 fetchedObjectIDs];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __55__PXPhotoKitAssetsDataSource_indexPathSetForObjectIDs___block_invoke;
          v27[3] = &unk_1E5DB47B0;
          id v14 = v12;
          id v28 = v14;
          long long v15 = [v13 indexesOfObjectsPassingTest:v27];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __55__PXPhotoKitAssetsDataSource_indexPathSetForObjectIDs___block_invoke_2;
          v25[3] = &unk_1E5DBB990;
          id v26 = v15;
          id v16 = v4;
          id v17 = v15;
          [v23 modifyItemIndexSetForDataSourceIdentifier:v21 section:v7 usingBlock:v25];
          v8 += [v17 count];

          id v4 = v16;
          if (v8 == v22) {
            break;
          }
        }

        if (v24 == ++v7) {
          goto LABEL_10;
        }
      }
    }
LABEL_10:

    int v18 = v23;
  }
  else
  {
    int v18 = [off_1E5DA6F50 indexPathSet];
  }

  return v18;
}

uint64_t __55__PXPhotoKitAssetsDataSource_indexPathSetForObjectIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) containsObject:v6];
  if (v7)
  {
    [*(id *)(a1 + 32) removeObject:v6];
    if (![*(id *)(a1 + 32) count]) {
      *a4 = 1;
    }
  }

  return v7;
}

uint64_t __55__PXPhotoKitAssetsDataSource_indexPathSetForObjectIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addIndexes:*(void *)(a1 + 32)];
}

- (PXSimpleIndexPath)indexPathForObjectID:(SEL)a3
{
  id v18 = a4;
  id v6 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  uint64_t v7 = [v6 numberOfSections];
  if (v7 < 1)
  {
LABEL_5:
    long long v14 = *((_OWORD *)off_1E5DAB028 + 1);
    *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
    *(_OWORD *)&retstr->int64_t item = v14;
  }
  else
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    while (1)
    {
      long long v10 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
      int64_t v11 = [v10 assetsInSection:v9];

      uint64_t v12 = [v11 fetchedObjectIDsSet];
      int v13 = [v12 containsObject:v18];

      if (v13) {
        break;
      }

      if (v8 == ++v9) {
        goto LABEL_5;
      }
    }
    long long v15 = [v11 fetchedObjectIDs];
    int64_t v16 = [v15 indexOfObject:v18];

    retstr->int64_t dataSourceIdentifier = [(PXPhotoKitAssetsDataSource *)self identifier];
    retstr->int64_t section = v9;
    retstr->int64_t item = v16;
    retstr->subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
  }

  return result;
}

- (id)assetCollectionReferenceNearestToObjectReference:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PXPhotoKitAssetsDataSource;
  unint64_t v5 = [(PXPhotoKitAssetsDataSource *)&v7 assetCollectionReferenceNearestToObjectReference:v4];
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(PXPhotoKitAssetsDataSource *)self objectReferenceNearestToObjectReference:v4];
    }
    else
    {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (id)_assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch:(id)a3
{
  id v5 = a3;
  id v6 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  __int16 v7 = [v6 options];

  if ((v7 & 0x800) == 0)
  {
    int64x2_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 648, @"Invalid parameter not satisfying: %@", @"PXOptionsHasSpecificValue(self.photosDataSource.options, PXPhotosDataSourceOptionAllowExhaustiveNearestToObjectSearch)" object file lineNumber description];
  }
  uint64_t v8 = [v5 asset];
  int64_t v9 = [v8 creationDate];
  long long v10 = v9;
  if (v9)
  {
    id v28 = v5;
    uint64_t v48 = 0;
    uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v46 = 0;
    uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __99__PXPhotoKitAssetsDataSource__assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch___block_invoke;
    aBlock[3] = &unk_1E5DB4738;
    id v11 = v9;
    id v44 = v11;
    v45 = self;
    uint64_t v12 = (void (**)(void *, void *, void *, uint64_t, uint64_t *, uint64_t *))_Block_copy(aBlock);
    uint64_t v13 = [(PXPhotoKitAssetsDataSource *)self numberOfSections];
    int64_t v14 = [(PXPhotoKitAssetsDataSource *)self identifier];
    if (v13 >= 1)
    {
      int64_t v15 = v14;
      int64_t v16 = 0;
      int64x2_t v29 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      do
      {
        int64_t v38 = v15;
        v39 = v16;
        int64x2_t v40 = v29;
        id v17 = [(PXPhotoKitAssetsDataSource *)self assetCollectionAtSectionIndexPath:&v38];
        id v18 = [v17 startDate];
        v12[2](v12, v16, v18, -1, &v49, &v48);

        id v19 = [v17 endDate];
        v12[2](v12, v16, v19, 1, &v47, &v46);

        int64_t v16 = (int64_t *)((char *)v16 + 1);
      }
      while ((int64_t *)v13 != v16);
    }
    int64_t v38 = 0;
    v39 = &v38;
    v40.i64[0] = 0x4010000000;
    v40.i64[1] = (uint64_t)&unk_1AB5D584F;
    long long v20 = *((_OWORD *)off_1E5DAB028 + 1);
    long long v41 = *(_OWORD *)off_1E5DAB028;
    long long v42 = v20;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __99__PXPhotoKitAssetsDataSource__assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch___block_invoke_2;
    v33[3] = &unk_1E5DB4760;
    v33[4] = self;
    id v34 = v11;
    v35 = &v38;
    v36 = v37;
    int64_t v21 = _Block_copy(v33);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __99__PXPhotoKitAssetsDataSource__assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch___block_invoke_3;
    v31[3] = &unk_1E5DB4788;
    v31[4] = self;
    id v22 = v21;
    id v32 = v22;
    int v23 = (void (**)(void *, uint64_t))_Block_copy(v31);
    v23[2](v23, v49);
    if (v47 != v49) {
      ((void (*)(void (**)(void *, uint64_t)))v23[2])(v23);
    }
    if (v39[4] == *(void *)off_1E5DAAED8)
    {
      uint64_t v24 = 0;
    }
    else
    {
      long long v25 = *((_OWORD *)v39 + 3);
      v30[0] = *((_OWORD *)v39 + 2);
      v30[1] = v25;
      uint64_t v24 = [(PXPhotoKitAssetsDataSource *)self assetReferenceAtItemIndexPath:v30];
    }

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(&v38, 8);

    id v5 = v28;
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

void __99__PXPhotoKitAssetsDataSource__assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5, double *a6)
{
  id v11 = a3;
  if (v11)
  {
    id v15 = v11;
    [v11 timeIntervalSinceDate:*(void *)(a1 + 32)];
    id v11 = v15;
    double v13 = v12 * (double)a4;
    if (v13 >= 0.0 && (*a5 == 0x7FFFFFFFFFFFFFFFLL || v13 < *a6))
    {
      BOOL v14 = [*(id *)(a1 + 40) numberOfItemsInSection:a2] < 1;
      id v11 = v15;
      if (!v14)
      {
        *a5 = a2;
        *a6 = v13;
      }
    }
  }
}

void __99__PXPhotoKitAssetsDataSource__assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch___block_invoke_2(void *a1, _OWORD *a2)
{
  id v4 = (void *)a1[4];
  long long v5 = a2[1];
  v14[0] = *a2;
  v14[1] = v5;
  id v6 = [v4 assetAtItemIndexPath:v14];
  __int16 v7 = [v6 creationDate];

  if (v7)
  {
    [v7 timeIntervalSinceDate:a1[5]];
    double v9 = fabs(v8);
    uint64_t v10 = *(void *)(a1[6] + 8);
    uint64_t v12 = *(void *)(v10 + 32);
    id v11 = (_OWORD *)(v10 + 32);
    if (v12 == *(void *)off_1E5DAAED8 || v9 < *(double *)(*(void *)(a1[7] + 8) + 24))
    {
      long long v13 = a2[1];
      _OWORD *v11 = *a2;
      v11[1] = v13;
      *(double *)(*(void *)(a1[7] + 8) + 24) = v9;
    }
  }
}

uint64_t __99__PXPhotoKitAssetsDataSource__assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13[10] = v2;
    v13[11] = v3;
    uint64_t v5 = result;
    uint64_t v6 = [*(id *)(result + 32) identifier];
    result = [*(id *)(v5 + 32) numberOfItemsInSection:a2];
    if (result >= 1)
    {
      uint64_t v9 = result;
      for (uint64_t i = 0; i != v9; ++i)
      {
        uint64_t v11 = *(void *)(v5 + 40);
        uint64_t v12 = *(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(v11 + 16);
        v13[0] = v6;
        v13[1] = a2;
        v13[2] = i;
        v13[3] = 0x7FFFFFFFFFFFFFFFLL;
        result = v12(v11, v13, v7, v8);
      }
    }
  }
  return result;
}

- (id)_assetCollectionReferenceNearestToObjectReferenceAssumingSortedByIncreasingCreationDate:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v7 = [v6 options];

  if ((v7 & 0x80) == 0)
  {
    int64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 531, @"Invalid parameter not satisfying: %@", @"PXOptionsHasSpecificValue(photosDataSourceOptions, PXPhotosDataSourceOptionAssetCollectionsAreSortedByIncreasingCreationDate)" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v5 asset];
    uint64_t v9 = [v8 creationDate];
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = 0;
    goto LABEL_20;
  }
  id v10 = v5;
  uint64_t v11 = [v10 keyAssetReference];
  uint64_t v8 = [v11 asset];

  if (!v8)
  {
    uint64_t v12 = [v10 assetCollection];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_11:
        if ([v12 assetCollectionSubtype] == 1000000301)
        {
          uint64_t v9 = [v12 startDate];
          uint64_t v8 = 0;
        }
        else
        {
          long long v13 = PLCuratedLibraryGetLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v10;
            _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Missing key curated asset in %@. Degrading gracefully, but transitions might not work as expected.", (uint8_t *)&buf, 0xCu);
          }

          uint64_t v8 = [(PXPhotoKitAssetsDataSource *)self _fastKeyCuratedAssetForAssetCollection:v12];
          uint64_t v9 = [v8 creationDate];
        }

        goto LABEL_17;
      }
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v20 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v20);
      int64_t v21 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v17 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 555, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v19, v21 object file lineNumber description];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      id v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      [v17 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 555, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v19 object file lineNumber description];
    }

    goto LABEL_11;
  }
  uint64_t v9 = [v8 creationDate];
LABEL_17:

LABEL_18:
  if (v9)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x4010000000;
    uint64_t v24 = &unk_1AB5D584F;
    memset(v25, 0, sizeof(v25));
    *(void *)&v25[0] = [(PXPhotoKitAssetsDataSource *)self identifier];
    *(_OWORD *)((char *)v25 + 8) = xmmword_1AB359AA0;
    *((void *)&v25[1] + 1) = 0x7FFFFFFFFFFFFFFFLL;
    [(PXPhotoKitAssetsDataSource *)self numberOfSections];
    v9;
    PXLastIndexInSortedRangePassingTest();
  }
LABEL_20:
  id v14 = 0;

  return v14;
}

BOOL __118__PXPhotoKitAssetsDataSource__assetCollectionReferenceNearestToObjectReferenceAssumingSortedByIncreasingCreationDate___block_invoke(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = a2;
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = *(void *)(a1[6] + 8);
  long long v5 = *(_OWORD *)(v4 + 48);
  v12[0] = *(_OWORD *)(v4 + 32);
  v12[1] = v5;
  uint64_t v6 = [v3 assetCollectionAtSectionIndexPath:v12];
  char v7 = [v6 startDate];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 timeIntervalSinceDate:a1[5]];
    BOOL v10 = v9 <= 0.0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __118__PXPhotoKitAssetsDataSource__assetCollectionReferenceNearestToObjectReferenceAssumingSortedByIncreasingCreationDate___block_invoke_2(void *a1, uint64_t a2, unsigned char *a3)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = a2;
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = *(void *)(a1[6] + 8);
  long long v8 = *(_OWORD *)(v7 + 48);
  v11[0] = *(_OWORD *)(v7 + 32);
  v11[1] = v8;
  double v9 = [v6 assetsInSectionIndexPath:v11];
  int v10 = [v9 containsObject:a1[5]];

  if (v10)
  {
    *(void *)(*(void *)(a1[7] + 8) + 24) = a2;
    *a3 = 1;
  }
}

- (id)objectReferenceNearestToObjectReference:(id)a3 inSection:(int64_t)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v8 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  __int16 v9 = [v8 options];

  if (v7)
  {
    [v7 indexPath];
    uint64_t v10 = v59;
  }
  else
  {
    uint64_t v10 = 0;
    long long v59 = 0u;
    long long v60 = 0u;
  }
  if (v10 == [(PXPhotoKitAssetsDataSource *)self identifier]) {
    uint64_t v11 = v7;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v7;
  if (v11) {
    goto LABEL_56;
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v58.receiver = self;
    v58.super_class = (Class)PXPhotoKitAssetsDataSource;
    uint64_t v13 = [(PXPhotoKitAssetsDataSource *)&v58 objectReferenceNearestToObjectReference:v7];
  }
  else
  {
    *(_OWORD *)long long buf = 0u;
    long long v62 = 0u;
    [(PXPhotoKitAssetsDataSource *)self _indexPathForObjectReference:v7 restrictedToSection:a4];
    if (!*(void *)off_1E5DAAED8) {
      goto LABEL_13;
    }
    *(_OWORD *)v57 = *(_OWORD *)buf;
    *(_OWORD *)&v57[16] = v62;
    uint64_t v13 = [(PXPhotoKitAssetsDataSource *)self objectReferenceAtIndexPath:v57];
  }
  uint64_t v12 = (void *)v13;
  if (v13) {
    goto LABEL_56;
  }
LABEL_13:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (v9 & 0x800) != 0)
  {
    uint64_t v12 = [(PXPhotoKitAssetsDataSource *)self _assetReferenceReferenceNearestToAssetReferenceUsingExhaustiveSearch:v7];
    if (v12) {
      goto LABEL_56;
    }
  }
  if ((v9 & 0x80) != 0)
  {
    uint64_t v12 = [(PXPhotoKitAssetsDataSource *)self _assetCollectionReferenceNearestToObjectReferenceAssumingSortedByIncreasingCreationDate:v7];
    if (v12) {
      goto LABEL_56;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v7 itemObject],
        id v14 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v14,
        (isKindOfClass & 1) == 0))
  {
    uint64_t v12 = 0;
    goto LABEL_56;
  }
  id v16 = v7;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_22;
    }
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    int64x2_t v40 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v40);
    long long v41 = objc_msgSend(v16, "px_descriptionForAssertionMessage");
    [v37 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 461, @"%@ should be an instance inheriting from %@, but it is %@", @"objectReference", v39, v41 object file lineNumber description];
  }
  else
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v38 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v38);
    [v37 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 461, @"%@ should be an instance inheriting from %@, but it is nil", @"objectReference", v39 object file lineNumber description];
  }

LABEL_22:
  id v17 = [v16 asset];
  if (!v17)
  {
    long long v42 = [MEMORY[0x1E4F28B00] currentHandler];
    id v43 = (objc_class *)objc_opt_class();
    id v44 = NSStringFromClass(v43);
    [v42 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 462, @"%@ should be an instance inheriting from %@, but it is nil", @"assetReference.asset", v44 object file lineNumber description];
LABEL_64:

    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v42 = [MEMORY[0x1E4F28B00] currentHandler];
    v45 = (objc_class *)objc_opt_class();
    id v44 = NSStringFromClass(v45);
    uint64_t v46 = objc_msgSend(v17, "px_descriptionForAssertionMessage");
    [v42 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 462, @"%@ should be an instance inheriting from %@, but it is %@", @"assetReference.asset", v44, v46 object file lineNumber description];

    goto LABEL_64;
  }
LABEL_24:
  assetReferenceNearestToAssetCache = self->_assetReferenceNearestToAssetCache;
  if (!assetReferenceNearestToAssetCache)
  {
    id v19 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    long long v20 = self->_assetReferenceNearestToAssetCache;
    self->_assetReferenceNearestToAssetCache = v19;

    assetReferenceNearestToAssetCache = self->_assetReferenceNearestToAssetCache;
  }
  uint64_t v12 = [(NSCache *)assetReferenceNearestToAssetCache objectForKey:v17];
  if (!v12)
  {
    if ([(PXPhotoKitAssetsDataSource *)self containsAnyItems])
    {
      if (a4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        *(_OWORD *)long long buf = 0u;
        long long v62 = 0u;
        if (v7) {
          [v16 indexPath];
        }
        id v21 = objc_alloc((Class)off_1E5DA55C0);
        id v22 = [v16 assetCollection];
        uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
        long long v55 = *(_OWORD *)buf;
        int64x2_t v56 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        uint64_t v47 = v56.i64[1];
        uint64_t v24 = (void *)[v21 initWithAssetCollection:v22 keyAssetReference:0 indexPath:&v55];

        [(PXPhotoKitAssetsDataSource *)self indexPathForAssetCollectionReference:v24];
        int64_t v25 = *(void *)v57;
        int64_t v26 = *(void *)off_1E5DAAED8;
        if (*(void *)v57 == *(void *)off_1E5DAAED8)
        {
          int64_t v27 = *(void *)&buf[8];
          int64_t v28 = [(PXPhotoKitAssetsDataSource *)self numberOfSections] - 1;
          if (v27 < v28) {
            int64_t v28 = v27;
          }
          uint64_t v29 = v28 & ~(v28 >> 63);
          int64_t v25 = [(PXPhotoKitAssetsDataSource *)self identifier];
          *((void *)&v30 + 1) = v47;
          *(void *)&long long v30 = v29;
        }
        else
        {
          long long v30 = *(_OWORD *)&v57[8];
          uint64_t v23 = *(void *)&v57[24];
        }
        int64_t v52 = v25;
        long long v53 = v30;
        uint64_t v54 = v23;
        [(PXPhotoKitAssetsDataSource *)self firstNonEmptySectionAtOrBeforeSection:&v52];
        a4 = *(void *)&v57[8];
        int64_t v31 = *(void *)v57;
        if (*(void *)v57 == v26)
        {
          [(PXPhotoKitAssetsDataSource *)self firstItemIndexPath];
          int64_t v31 = v26;
          if (v51 != v26)
          {
            [(PXPhotoKitAssetsDataSource *)self firstItemIndexPath];
            int64_t v31 = v49;
            a4 = v50;
          }
        }
      }
      else
      {
        int64_t v31 = [(PXPhotoKitAssetsDataSource *)self identifier];
        int64_t v26 = *(void *)off_1E5DAAED8;
      }
      if (v31 == v26) {
        PXAssertGetLog();
      }
      id v32 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
      long long v33 = [v32 assetsInSection:a4];
      unint64_t v34 = objc_msgSend(v33, "px_indexOfSortedAssetNearestToAsset:", v17);
      if (v34 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (![v33 count]) {
          goto LABEL_53;
        }
        if (v7)
        {
          [v16 indexPath];
          unint64_t v34 = v48;
        }
        else
        {
          unint64_t v34 = 0;
        }
        uint64_t v35 = [v33 count];
        if (v34 >= v35 - 1) {
          unint64_t v34 = v35 - 1;
        }
        if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_53:
        }
          PXAssertGetLog();
      }
      *(void *)long long buf = [(PXPhotoKitAssetsDataSource *)self identifier];
      *(void *)&buf[8] = a4;
      *(void *)&long long v62 = v34;
      *((void *)&v62 + 1) = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v12 = [(PXPhotoKitAssetsDataSource *)self assetReferenceAtItemIndexPath:buf];
      [(NSCache *)self->_assetReferenceNearestToAssetCache setObject:v12 forKey:v17];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }

LABEL_56:
  return v12;
}

- (id)objectReferenceNearestToObjectReference:(id)a3
{
  return [(PXPhotoKitAssetsDataSource *)self objectReferenceNearestToObjectReference:a3 inSection:0x7FFFFFFFFFFFFFFFLL];
}

- (id)_fastKeyCuratedAssetForAssetCollection:(id)a3
{
  id v4 = a3;
  fetchedKeyAssetByAssetCollectionLocalIdentifierCache = self->_fetchedKeyAssetByAssetCollectionLocalIdentifierCache;
  if (!fetchedKeyAssetByAssetCollectionLocalIdentifierCache)
  {
    uint64_t v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    id v7 = self->_fetchedKeyAssetByAssetCollectionLocalIdentifierCache;
    self->_fetchedKeyAssetByAssetCollectionLocalIdentifierCache = v6;

    fetchedKeyAssetByAssetCollectionLocalIdentifierCache = self->_fetchedKeyAssetByAssetCollectionLocalIdentifierCache;
  }
  long long v8 = [v4 localIdentifier];
  __int16 v9 = [(NSCache *)fetchedKeyAssetByAssetCollectionLocalIdentifierCache objectForKey:v8];

  if (!v9)
  {
    if (objc_msgSend(v4, "px_supportsFastCuration"))
    {
      uint64_t v10 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
      uint64_t v11 = [v10 photoLibrary];
      uint64_t v12 = +[PXPhotosAssetsFetcher sharedFetcherForPhotoLibrary:v11];

      uint64_t v13 = objc_alloc_init(PXPhotosAssetsFetcherConfiguration);
      [(PXPhotosAssetsFetcherConfiguration *)v13 setCurationKind:5];
      [(PXPhotosAssetsFetcherConfiguration *)v13 setLibraryFilter:[(PXPhotoKitAssetsDataSource *)self libraryFilter]];
      id v14 = [v12 fetchAssetsInContainer:v4 configuration:v13];
      __int16 v9 = [v14 firstObject];

      if (!v9)
      {
        __int16 v9 = [MEMORY[0x1E4F1CA98] null];
      }
      id v15 = self->_fetchedKeyAssetByAssetCollectionLocalIdentifierCache;
      id v16 = [v4 localIdentifier];
      [(NSCache *)v15 setObject:v9 forKey:v16];
    }
    else
    {
      __int16 v9 = 0;
    }
  }
  id v17 = [MEMORY[0x1E4F1CA98] null];

  if (v9 == v17)
  {

    __int16 v9 = 0;
  }

  return v9;
}

- (id)primaryFaceForAssetAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  id v4 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  long long v5 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v5;
  uint64_t v6 = [v4 facesAtSimpleIndexPath:v9];

  id v7 = [v6 firstObject];

  return v7;
}

- (BOOL)hasCurationForAssetCollection:(id)a3
{
  id v4 = a3;
  long long v5 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v6 = [v5 hasCurationForAssetCollection:v4];

  return v6;
}

- (int64_t)numberOfCuratedItemsInAssetCollection:(id)a3
{
  id v4 = a3;
  long long v5 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v6 = [v5 curatedAssetsForAssetCollection:v4];

  int64_t v7 = [v6 count];
  return v7;
}

- (int64_t)numberOfUncuratedItemsInAssetCollection:(id)a3
{
  id v4 = a3;
  long long v5 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  char v6 = [v5 uncuratedAssetsForAssetCollection:v4];

  int64_t v7 = [v6 count];
  return v7;
}

- (int64_t)numberOfCuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPhotoKitAssetsDataSource *)self identifier])
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 327, @"Invalid parameter not satisfying: %@", @"sectionIndexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  int64_t v7 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  long long v8 = [v7 curatedAssetsInSection:a3->section];
  int64_t v9 = [v8 count];

  return v9;
}

- (int64_t)numberOfUncuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPhotoKitAssetsDataSource *)self identifier])
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 322, @"Invalid parameter not satisfying: %@", @"sectionIndexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  int64_t v7 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  long long v8 = [v7 uncuratedAssetsInSection:a3->section];
  int64_t v9 = [v8 count];

  return v9;
}

- (id)uncuratedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPhotoKitAssetsDataSource *)self identifier])
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 317, @"Invalid parameter not satisfying: %@", @"sectionIndexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  int64_t v7 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  long long v8 = [v7 uncuratedAssetsInSection:a3->section];

  return v8;
}

- (id)curatedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPhotoKitAssetsDataSource *)self identifier])
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 312, @"Invalid parameter not satisfying: %@", @"sectionIndexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  int64_t v7 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  long long v8 = [v7 curatedAssetsInSection:a3->section];

  return v8;
}

- (PXSimpleIndexPath)keyAssetIndexPathForSectionIndexPath:(SEL)a3
{
  int64_t dataSourceIdentifier = a4->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPhotoKitAssetsDataSource *)self identifier])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a3, self, @"PXPhotoKitAssetsDataSource.m", 300, @"Invalid parameter not satisfying: %@", @"sectionIndexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  int64_t v9 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  int64_t v10 = [v9 keyAssetIndexInSection:a4->section];

  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->int64_t item = 0u;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v12 = *((_OWORD *)off_1E5DAB028 + 1);
    *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
    *(_OWORD *)&retstr->int64_t item = v12;
  }
  else
  {
    result = [(PXPhotoKitAssetsDataSource *)self identifier];
    int64_t section = a4->section;
    retstr->int64_t dataSourceIdentifier = (int64_t)result;
    retstr->int64_t section = section;
    retstr->int64_t item = v10;
    retstr->subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)keyAssetsForAssetCollection:(id)a3
{
  id v4 = a3;
  long long v5 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  uint64_t v6 = [v5 sectionForAssetCollection:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v7 = [v5 keyAssetsInSection:v6];
  }

  return v7;
}

- (id)keyAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXPhotoKitAssetsDataSource *)self identifier])
  {
    int64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXPhotoKitAssetsDataSource.m", 284, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  int64_t v7 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  long long v8 = [v7 keyAssetsInSection:a3->section];

  return v8;
}

- (PXSimpleIndexPath)_indexPathForSavedSyndicatedAssetReference:(SEL)a3
{
  id v7 = a4;
  long long v8 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->int64_t item = v8;
  int64_t v9 = [v7 asset];
  if (!PXDisplayAssetIsSyndicatedAndUnsaved(v9)) {
    goto LABEL_9;
  }
  id v10 = v9;
  if (!v10)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a3, self, @"PXPhotoKitAssetsDataSource.m", 269, @"%@ should be an instance inheriting from %@, but it is nil", @"removedDisplayAsset", v16 object file lineNumber description];
LABEL_12:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v17 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v17);
    id v18 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a3, self, @"PXPhotoKitAssetsDataSource.m", 269, @"%@ should be an instance inheriting from %@, but it is %@", @"removedDisplayAsset", v16, v18 object file lineNumber description];

    goto LABEL_12;
  }
LABEL_4:
  [v10 fetchPropertySetsIfNeeded];
  uint64_t v11 = [v10 curationProperties];
  uint64_t v12 = [v11 syndicationIdentifier];

  if (v12)
  {
    if (v7) {
      [v7 indexPath];
    }
    PXIndexPathFromSimpleIndexPath();
  }

LABEL_9:
  return result;
}

- (BOOL)isFilteringDisabledForAssetCollection:(id)a3
{
  id v4 = a3;
  long long v5 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  uint64_t v6 = [v5 infoForAssetCollection:v4];

  LOBYTE(v5) = [v6 explicitlyDisableFilters];
  return (char)v5;
}

- (BOOL)isFilteringAssetCollection:(id)a3
{
  id v4 = a3;
  long long v5 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  uint64_t v6 = [v5 infoForAssetCollection:v4];

  LOBYTE(v5) = [v6 UUIDFilterHidesSomeAssets];
  return (char)v5;
}

- (unint64_t)estimatedOtherCount
{
  uint64_t v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  unint64_t v3 = [v2 estimatedOtherCount];

  return v3;
}

- (unint64_t)estimatedVideosCount
{
  uint64_t v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  unint64_t v3 = [v2 estimatedVideosCount];

  return v3;
}

- (unint64_t)estimatedPhotosCount
{
  uint64_t v2 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  unint64_t v3 = [v2 estimatedPhotosCount];

  return v3;
}

- (unint64_t)estimatedAssetCountForSectionIndexPath:(PXSimpleIndexPath *)a3
{
  id v4 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  long long v5 = [v4 assetCollectionForSection:a3->section];
  unint64_t v6 = [v5 estimatedAssetCount];

  return v6;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)description
{
  unint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotoKitAssetsDataSource;
  id v4 = [(PXPhotoKitAssetsDataSource *)&v9 description];
  long long v5 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  unint64_t v6 = [(PXPhotoKitAssetsDataSource *)self container];
  id v7 = [v3 stringWithFormat:@"<%@ photosDataSource:%@, container:%@>", v4, v5, v6];

  return v7;
}

- (PXPhotoKitAssetsDataSource)initWithImmutablePhotosDataSource:(id)a3 withChange:(id)a4
{
  id v6 = a3;
  id v7 = [a4 sectionedDataSourceChangeDetails];
  long long v8 = [(PXPhotoKitAssetsDataSource *)self initWithImmutablePhotosDataSource:v6 withChangeDetails:v7];

  return v8;
}

+ (PXPhotoKitAssetsDataSource)dataSourceWithAssetCollections:(id)a3
{
  unint64_t v3 = [MEMORY[0x1E4F39008] transientCollectionListWithCollections:a3 title:0];
  id v4 = [MEMORY[0x1E4F38EE8] fetchCollectionsInCollectionList:v3 options:0];
  long long v5 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v4 options:4];
  id v6 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v5];
  id v7 = [[PXPhotoKitAssetsDataSource alloc] initWithImmutablePhotosDataSource:v6 withChange:0];

  return v7;
}

+ (PXPhotoKitAssetsDataSource)dataSourceWithAssets:(id)a3
{
  return (PXPhotoKitAssetsDataSource *)[a1 dataSourceWithAssets:a3 userInfo:MEMORY[0x1E4F1CC08] transientIdentifier:0];
}

+ (PXPhotoKitAssetsDataSource)dataSourceWithAssets:(id)a3 userInfo:(id)a4 transientIdentifier:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if (![v11 count])
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetsDataSource.m", 54, @"Invalid parameter not satisfying: %@", @"assets.count > 0" object file lineNumber description];
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F38EE8];
  uint64_t v13 = [v11 firstObject];
  id v14 = [v13 photoLibrary];
  id v15 = [v12 transientAssetCollectionWithAssets:v11 title:0 identifier:v9 photoLibrary:v14];

  v20[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v17 = [a1 dataSourceWithAssetCollections:v16];

  [v17 setUserInfo:v10];
  return (PXPhotoKitAssetsDataSource *)v17;
}

+ (PXPhotoKitAssetsDataSource)dataSourceWithAsset:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetsDataSource.m", 49, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v7 = [a1 dataSourceWithAssets:v6];

  return (PXPhotoKitAssetsDataSource *)v7;
}

- (BOOL)isAssetAtIndexPathPartOfCuratedSet:(PXSimpleIndexPath *)a3
{
  id v4 = [(PXPhotoKitAssetsDataSource *)self photosDataSource];
  long long v5 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v5;
  LOBYTE(a3) = [v4 isAssetAtIndexPathPartOfCuratedSet:v7];

  return (char)a3;
}

@end