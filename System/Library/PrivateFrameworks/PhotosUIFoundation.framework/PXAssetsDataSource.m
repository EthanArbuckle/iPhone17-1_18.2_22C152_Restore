@interface PXAssetsDataSource
- (BOOL)areAllSectionsConsideredAccurate;
- (BOOL)getAssetCounts:(id *)a3 guestAssetCounts:(id *)a4 allowFetch:(BOOL)a5;
- (BOOL)hasCurationForAssetCollection:(id)a3;
- (BOOL)ignoreSharedLibraryFilters;
- (BOOL)includeOthersInSocialGroupAssets;
- (BOOL)isFiltered;
- (BOOL)isFilteringAssetCollection:(id)a3;
- (BOOL)isFilteringDisabledForAssetCollection:(id)a3;
- (BOOL)isFilteringDisabledForSectionIndexPath:(PXSimpleIndexPath *)a3;
- (BOOL)isFilteringSectionIndexPath:(PXSimpleIndexPath *)a3;
- (BOOL)isSectionConsideredAccurate:(int64_t)a3;
- (BOOL)isSorted;
- (BOOL)startsAtEnd;
- (Class)objectReferenceClassForItem;
- (Class)objectReferenceClassForSection;
- (NSPredicate)filterPredicate;
- (PXDisplayAsset)keyAsset;
- (PXDisplayAssetCollection)firstAssetCollection;
- (PXDisplayAssetCollection)lastAssetCollection;
- (PXDisplayCollection)containerCollection;
- (PXSimpleIndexPath)indexPathForAssetReference:(SEL)a3;
- (PXSimpleIndexPath)keyAssetIndexPathForSectionIndexPath:(SEL)a3;
- (id)assetAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)assetCollectionAtSectionIndexPath:(PXSimpleIndexPath *)a3;
- (id)assetCollectionReferenceAtSectionIndexPath:(PXSimpleIndexPath *)a3;
- (id)assetCollectionReferenceForAssetCollectionReference:(id)a3;
- (id)assetCollectionReferenceNearestToObjectReference:(id)a3;
- (id)assetCollectionReferencesWithParentAssetCollectionReference:(id)a3;
- (id)assetCollectionReferencesWithParentAssetCollectionReference:(id)a3 assetCollectionReferenceWithSameKeyAssetAsParent:(id *)a4;
- (id)assetIdentifierAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)assetReferenceAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)assetsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (id)curatedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (id)keyAssetsForAssetCollection:(id)a3;
- (id)keyAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectIDAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectReferenceNearestToObjectReference:(id)a3 inSection:(int64_t)a4;
- (id)primaryFaceForAssetAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)startingAssetReference;
- (id)uncuratedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)estimatedAssetsCountWithEnrichmentState:(unsigned __int16)a3;
- (int64_t)libraryFilter;
- (int64_t)numberOfCuratedItemsInAssetCollection:(id)a3;
- (int64_t)numberOfCuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfSectionsWithEnrichmentState:(unsigned __int16)a3;
- (int64_t)numberOfUncuratedItemsInAssetCollection:(id)a3;
- (int64_t)numberOfUncuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)startingSection;
- (unint64_t)estimatedAssetCountForSectionIndexPath:(PXSimpleIndexPath *)a3;
- (unint64_t)estimatedOtherCount;
- (unint64_t)estimatedPhotosCount;
- (unint64_t)estimatedVideosCount;
@end

@implementation PXAssetsDataSource

- (id)assetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  v4 = [(PXSectionedDataSource *)self objectsInIndexPath:v6];

  return v4;
}

- (id)assetAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  v4 = [(PXSectionedDataSource *)self objectAtIndexPath:v6];

  return v4;
}

- (Class)objectReferenceClassForItem
{
  return (Class)objc_opt_class();
}

- (PXSimpleIndexPath)indexPathForAssetReference:(SEL)a3
{
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  return [(PXSectionedDataSource *)self indexPathForObjectReference:a4];
}

- (id)assetReferenceAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  v4 = [(PXSectionedDataSource *)self objectReferenceAtIndexPath:v6];

  return v4;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (unint64_t)estimatedOtherCount
{
  return self->_estimatedOtherCount;
}

- (unint64_t)estimatedVideosCount
{
  return self->_estimatedVideosCount;
}

- (unint64_t)estimatedPhotosCount
{
  return self->_estimatedPhotosCount;
}

- (id)assetCollectionReferenceNearestToObjectReference:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(PXSectionedDataSource *)self objectReferenceForObjectReference:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v8 = 0u;
      long long v9 = 0u;
      v5 = [(PXSectionedDataSource *)self objectReferenceNearestToObjectReference:v4];
      [(PXSectionedDataSource *)self indexPathForObjectReference:v5];
    }
    v6 = 0;
  }

  return v6;
}

- (id)objectReferenceNearestToObjectReference:(id)a3 inSection:(int64_t)a4
{
  v5 = [(PXSectionedDataSource *)self objectReferenceNearestToObjectReference:a3];
  v6 = v5;
  if (v5)
  {
    [v5 indexPath];
    uint64_t v7 = v11;
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (v7 == a4) {
    long long v8 = v6;
  }
  else {
    long long v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (BOOL)isSectionConsideredAccurate:(int64_t)a3
{
  return 1;
}

- (BOOL)areAllSectionsConsideredAccurate
{
  return 1;
}

- (BOOL)isFilteringDisabledForAssetCollection:(id)a3
{
  return 0;
}

- (BOOL)isFilteringDisabledForSectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = self;
  long long v4 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v4;
  v5 = [(PXAssetsDataSource *)self assetCollectionAtSectionIndexPath:v7];
  LOBYTE(v3) = [(PXAssetsDataSource *)v3 isFilteringDisabledForAssetCollection:v5];

  return (char)v3;
}

- (BOOL)isFilteringAssetCollection:(id)a3
{
  return 0;
}

- (BOOL)isFilteringSectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = self;
  long long v4 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v4;
  v5 = [(PXAssetsDataSource *)self assetCollectionAtSectionIndexPath:v7];
  LOBYTE(v3) = [(PXAssetsDataSource *)v3 isFilteringAssetCollection:v5];

  return (char)v3;
}

- (id)primaryFaceForAssetAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (int64_t)estimatedAssetsCountWithEnrichmentState:(unsigned __int16)a3
{
  return 0;
}

- (int64_t)numberOfSectionsWithEnrichmentState:(unsigned __int16)a3
{
  return 0;
}

- (BOOL)hasCurationForAssetCollection:(id)a3
{
  return 0;
}

- (int64_t)numberOfCuratedItemsInAssetCollection:(id)a3
{
  return 0;
}

- (int64_t)numberOfUncuratedItemsInAssetCollection:(id)a3
{
  return 0;
}

- (int64_t)numberOfCuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (int64_t)numberOfUncuratedItemsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (id)uncuratedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (id)curatedAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (PXDisplayAsset)keyAsset
{
  long long v3 = [(PXAssetsDataSource *)self containerCollection];
  if (![v3 canContainAssets]
    || ([(PXAssetsDataSource *)self keyAssetsForAssetCollection:v3],
        long long v4 = objc_claimAutoreleasedReturnValue(),
        [v4 firstObject],
        v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    v6 = [(PXAssetsDataSource *)self startingAssetReference];
    v5 = [v6 asset];
  }

  return (PXDisplayAsset *)v5;
}

- (id)keyAssetsForAssetCollection:(id)a3
{
  return 0;
}

- (PXSimpleIndexPath)keyAssetIndexPathForSectionIndexPath:(SEL)a3
{
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  return self;
}

- (id)keyAssetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (BOOL)isSorted
{
  return 0;
}

- (int64_t)libraryFilter
{
  return 0;
}

- (BOOL)ignoreSharedLibraryFilters
{
  return 0;
}

- (NSPredicate)filterPredicate
{
  return 0;
}

- (BOOL)isFiltered
{
  return 0;
}

- (BOOL)startsAtEnd
{
  return 0;
}

- (int64_t)startingSection
{
  return 0;
}

- (id)startingAssetReference
{
  long long v6 = 0u;
  long long v7 = 0u;
  if ([(PXAssetsDataSource *)self startsAtEnd]) {
    [(PXSectionedDataSource *)self lastItemIndexPath];
  }
  else {
    [(PXSectionedDataSource *)self firstItemIndexPath];
  }
  if ((void)v6)
  {
    v5[0] = v6;
    v5[1] = v7;
    long long v3 = [(PXAssetsDataSource *)self assetReferenceAtItemIndexPath:v5];
  }
  else
  {
    long long v3 = 0;
  }

  return v3;
}

- (BOOL)getAssetCounts:(id *)a3 guestAssetCounts:(id *)a4 allowFetch:(BOOL)a5
{
  BOOL v26 = a5;
  long long v29 = 0uLL;
  uint64_t v30 = 0;
  int64_t v24 = [(PXSectionedDataSource *)self identifier];
  v25 = self;
  uint64_t v8 = [(PXSectionedDataSource *)self numberOfSections];
  v21 = a3;
  v22 = a4;
  if (v8 < 1)
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v9 = v8;
    BOOL v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    int64x2_t v23 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    while (1)
    {
      v27[0] = v24;
      v27[1] = v11;
      int64x2_t v28 = v23;
      v15 = -[PXAssetsDataSource assetsInSectionIndexPath:](v25, "assetsInSectionIndexPath:", v27, v21);
      v16 = v15;
      if (v26)
      {
        uint64_t v17 = [v15 countOfAssetsWithMediaType:1];
        uint64_t v18 = [v16 countOfAssetsWithMediaType:2];
        uint64_t v19 = [v16 countOfAssetsWithMediaType:3];
      }
      else
      {
        uint64_t v17 = [v15 cachedCountOfAssetsWithMediaType:1];
        uint64_t v18 = [v16 cachedCountOfAssetsWithMediaType:2];
        uint64_t v19 = [v16 cachedCountOfAssetsWithMediaType:3];
      }
      if (v17 == 0x7FFFFFFFFFFFFFFFLL || v18 == 0x7FFFFFFFFFFFFFFFLL || v19 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      v12 += v17;
      v13 += v18;
      v14 += v19;

      BOOL v10 = ++v11 >= v9;
      if (v9 == v11) {
        goto LABEL_13;
      }
    }
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    long long v29 = PXDisplayAssetDetailedCountsUndefined;

    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_13:
  if (v21)
  {
    v21->var0 = v12;
    v21->var1 = v13;
    v21->var2 = v14;
  }
  if (v22)
  {
    *(_OWORD *)&v22->var0 = v29;
    v22->var2 = v30;
  }
  return v10;
}

- (unint64_t)estimatedAssetCountForSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return 0;
}

- (id)assetCollectionReferencesWithParentAssetCollectionReference:(id)a3 assetCollectionReferenceWithSameKeyAssetAsParent:(id *)a4
{
  return 0;
}

- (id)assetCollectionReferencesWithParentAssetCollectionReference:(id)a3
{
  return 0;
}

- (id)assetCollectionReferenceForAssetCollectionReference:(id)a3
{
  v5 = [(PXSectionedDataSource *)self objectReferenceForObjectReference:a3];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v7 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      BOOL v10 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v7 handleFailureInMethod:a2, self, @"PXAssetsDataSource.m", 88, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[self objectReferenceForObjectReference:assetCollectionReference]", v9, v10 object file lineNumber description];
    }
  }

  return v5;
}

- (id)assetCollectionReferenceAtSectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v5 = *(_OWORD *)&a3->item;
  v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v13[1] = v5;
  long long v6 = [(PXSectionedDataSource *)self objectReferenceAtIndexPath:v13];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = (objc_class *)objc_opt_class();
    BOOL v10 = NSStringFromClass(v11);
    uint64_t v12 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXAssetsDataSource.m", 80, @"%@ should be an instance inheriting from %@, but it is %@", @"[self objectReferenceAtIndexPath:indexPath]", v10, v12 object file lineNumber description];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = (objc_class *)objc_opt_class();
    BOOL v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXAssetsDataSource.m", 80, @"%@ should be an instance inheriting from %@, but it is nil", @"[self objectReferenceAtIndexPath:indexPath]", v10 object file lineNumber description];
  }

LABEL_3:

  return v6;
}

- (Class)objectReferenceClassForSection
{
  return (Class)objc_opt_class();
}

- (PXDisplayAssetCollection)lastAssetCollection
{
  uint64_t v3 = [(PXSectionedDataSource *)self numberOfSections];
  uint64_t v4 = v3 - 1;
  if (v3 < 1)
  {
    long long v5 = 0;
  }
  else
  {
    v7[0] = [(PXSectionedDataSource *)self identifier];
    v7[1] = v4;
    int64x2_t v8 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    long long v5 = [(PXAssetsDataSource *)self assetCollectionAtSectionIndexPath:v7];
  }

  return (PXDisplayAssetCollection *)v5;
}

- (PXDisplayAssetCollection)firstAssetCollection
{
  if ([(PXSectionedDataSource *)self numberOfSections] < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    int64_t v5 = [(PXSectionedDataSource *)self identifier];
    long long v6 = xmmword_259D747C0;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v3 = [(PXAssetsDataSource *)self assetCollectionAtSectionIndexPath:&v5];
  }

  return (PXDisplayAssetCollection *)v3;
}

- (PXDisplayCollection)containerCollection
{
  if ([(PXSectionedDataSource *)self numberOfSections] == 1)
  {
    uint64_t v3 = [(PXAssetsDataSource *)self firstAssetCollection];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (PXDisplayCollection *)v3;
}

- (id)assetIdentifierAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v3;
  uint64_t v4 = [(PXAssetsDataSource *)self assetAtItemIndexPath:v7];
  int64_t v5 = [v4 uuid];

  return v5;
}

- (id)objectIDAtIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  uint64_t v4 = [(PXAssetsDataSource *)self assetIdentifierAtItemIndexPath:v6];

  return v4;
}

- (id)assetCollectionAtSectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  uint64_t v4 = [(PXSectionedDataSource *)self objectAtIndexPath:v6];

  return v4;
}

@end