@interface PXPhotosAssetsFetcherConfiguration
- (BOOL)hideHiddenAssets;
- (BOOL)includeAllBurstAssets;
- (BOOL)includeOthersInSocialGroupAssets;
- (BOOL)includeUnsavedSyndicatedAssets;
- (BOOL)reverseSortOrder;
- (NSArray)fetchPropertySets;
- (NSArray)referencePersons;
- (NSArray)sortDescriptors;
- (NSPredicate)filterPredicate;
- (NSPredicate)inclusionPredicate;
- (PHAsset)referenceAsset;
- (PXPhotosAssetsFetcherConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)curationKind;
- (int64_t)curationLength;
- (int64_t)curationType;
- (int64_t)fetchLimit;
- (int64_t)libraryFilter;
- (unint64_t)options;
- (void)setCurationKind:(int64_t)a3;
- (void)setCurationLength:(int64_t)a3;
- (void)setCurationType:(int64_t)a3;
- (void)setFetchLimit:(int64_t)a3;
- (void)setFetchPropertySets:(id)a3;
- (void)setFilterPredicate:(id)a3;
- (void)setHideHiddenAssets:(BOOL)a3;
- (void)setIncludeAllBurstAssets:(BOOL)a3;
- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3;
- (void)setIncludeUnsavedSyndicatedAssets:(BOOL)a3;
- (void)setInclusionPredicate:(id)a3;
- (void)setLibraryFilter:(int64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setReferenceAsset:(id)a3;
- (void)setReferencePersons:(id)a3;
- (void)setReverseSortOrder:(BOOL)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation PXPhotosAssetsFetcherConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceAsset, 0);
  objc_storeStrong((id *)&self->_referencePersons, 0);
  objc_storeStrong((id *)&self->_fetchPropertySets, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_inclusionPredicate, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PXPhotosAssetsFetcherConfiguration);
  [(PXPhotosAssetsFetcherConfiguration *)v4 setCurationKind:[(PXPhotosAssetsFetcherConfiguration *)self curationKind]];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setCurationLength:[(PXPhotosAssetsFetcherConfiguration *)self curationLength]];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setOptions:[(PXPhotosAssetsFetcherConfiguration *)self options]];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setLibraryFilter:[(PXPhotosAssetsFetcherConfiguration *)self libraryFilter]];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setFetchLimit:[(PXPhotosAssetsFetcherConfiguration *)self fetchLimit]];
  v5 = [(PXPhotosAssetsFetcherConfiguration *)self filterPredicate];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setFilterPredicate:v5];

  v6 = [(PXPhotosAssetsFetcherConfiguration *)self inclusionPredicate];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setInclusionPredicate:v6];

  v7 = [(PXPhotosAssetsFetcherConfiguration *)self sortDescriptors];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setSortDescriptors:v7];

  v8 = [(PXPhotosAssetsFetcherConfiguration *)self fetchPropertySets];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setFetchPropertySets:v8];

  [(PXPhotosAssetsFetcherConfiguration *)v4 setIncludeUnsavedSyndicatedAssets:[(PXPhotosAssetsFetcherConfiguration *)self includeUnsavedSyndicatedAssets]];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setIncludeAllBurstAssets:[(PXPhotosAssetsFetcherConfiguration *)self includeAllBurstAssets]];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setReverseSortOrder:[(PXPhotosAssetsFetcherConfiguration *)self reverseSortOrder]];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setHideHiddenAssets:[(PXPhotosAssetsFetcherConfiguration *)self hideHiddenAssets]];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setCurationType:[(PXPhotosAssetsFetcherConfiguration *)self curationType]];
  v9 = [(PXPhotosAssetsFetcherConfiguration *)self referencePersons];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setReferencePersons:v9];

  v10 = [(PXPhotosAssetsFetcherConfiguration *)self referenceAsset];
  [(PXPhotosAssetsFetcherConfiguration *)v4 setReferenceAsset:v10];

  [(PXPhotosAssetsFetcherConfiguration *)v4 setIncludeOthersInSocialGroupAssets:[(PXPhotosAssetsFetcherConfiguration *)self includeOthersInSocialGroupAssets]];
  return v4;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setFilterPredicate:(id)a3
{
}

- (void)setCurationKind:(int64_t)a3
{
  self->_curationKind = a3;
}

- (PXPhotosAssetsFetcherConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosAssetsFetcherConfiguration;
  result = [(PXPhotosAssetsFetcherConfiguration *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_includeUnsavedSyndicatedAssets = 0;
    result->_reverseSortOrder = 0;
    result->_curationType = 0;
    result->_includeOthersInSocialGroupAssets = 0;
    *(_OWORD *)&result->_curationKind = 0u;
    *(_OWORD *)&result->_options = 0u;
    result->_fetchLimit = 0;
  }
  return result;
}

- (void)setLibraryFilter:(int64_t)a3
{
  self->_libraryFilter = a3;
}

- (void)setFetchLimit:(int64_t)a3
{
  self->_fetchLimit = a3;
}

- (void)setReverseSortOrder:(BOOL)a3
{
  self->_reverseSortOrder = a3;
}

- (void)setReferencePersons:(id)a3
{
}

- (void)setCurationLength:(int64_t)a3
{
  self->_curationLength = a3;
}

- (void)setSortDescriptors:(id)a3
{
}

- (void)setInclusionPredicate:(id)a3
{
}

- (void)setFetchPropertySets:(id)a3
{
}

- (void)setIncludeUnsavedSyndicatedAssets:(BOOL)a3
{
  self->_includeUnsavedSyndicatedAssets = a3;
}

- (void)setIncludeAllBurstAssets:(BOOL)a3
{
  self->_includeAllBurstAssets = a3;
}

- (void)setHideHiddenAssets:(BOOL)a3
{
  self->_hideHiddenAssets = a3;
}

- (void)setCurationType:(int64_t)a3
{
  self->_curationType = a3;
}

- (void)setReferenceAsset:(id)a3
{
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  self->_includeOthersInSocialGroupAssets = a3;
}

- (int64_t)curationKind
{
  return self->_curationKind;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)libraryFilter
{
  return self->_libraryFilter;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (NSArray)fetchPropertySets
{
  return self->_fetchPropertySets;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (NSArray)referencePersons
{
  return self->_referencePersons;
}

- (NSPredicate)inclusionPredicate
{
  return self->_inclusionPredicate;
}

- (int64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (BOOL)includeUnsavedSyndicatedAssets
{
  return self->_includeUnsavedSyndicatedAssets;
}

- (BOOL)includeAllBurstAssets
{
  return self->_includeAllBurstAssets;
}

- (BOOL)hideHiddenAssets
{
  return self->_hideHiddenAssets;
}

- (PHAsset)referenceAsset
{
  return self->_referenceAsset;
}

- (int64_t)curationLength
{
  return self->_curationLength;
}

- (int64_t)curationType
{
  return self->_curationType;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (BOOL)reverseSortOrder
{
  return self->_reverseSortOrder;
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  PXDisplayAssetCollectionCurationKindDescription(self->_curationKind);
  objc_claimAutoreleasedReturnValue();
  PXDisplayAssetCollectionCurationLengthDescription();
}

@end