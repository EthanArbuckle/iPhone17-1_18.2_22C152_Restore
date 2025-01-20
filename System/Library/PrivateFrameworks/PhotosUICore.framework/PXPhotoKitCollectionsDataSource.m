@interface PXPhotoKitCollectionsDataSource
+ (int64_t)estimatedCountForAssetCollection:(id)a3 withConfiguration:(id)a4;
- (NSArray)_collectionListBySection;
- (NSArray)_collectionsFetchResultBySection;
- (NSArray)_virtualCollections;
- (NSDictionary)_collectionsIndexPathsByCollection;
- (NSDictionary)_keyAssetsFetchResultsByCollection;
- (NSDictionary)itemFetchResultByCollection;
- (PHCollectionList)collectionList;
- (PHFetchResult)collectionsFetchResult;
- (PXPhotoKitCollectionsDataSource)init;
- (PXPhotoKitCollectionsDataSource)initWithRootCollectionList:(id)a3 collectionListBySection:(id)a4 collectionsFetchResultBySection:(id)a5 keyAssetsFetchResultsByCollection:(id)a6 collectionsIndexPathsByCollection:(id)a7 itemFetchResultByCollection:(id)a8 virtualCollections:(id)a9 collectionsFetchResult:(id)a10 sharingFilter:(unsigned __int16)a11 dataSourceConfiguration:(id)a12;
- (PXPhotoKitCollectionsDataSourceManagerConfiguration)configuration;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)_assetAtSimpleIndexPath:(PXSimpleIndexPath *)a3;
- (id)_collectionAtSimpleIndexPath:(PXSimpleIndexPath *)a3;
- (id)_collectionListAtSimpleIndexPath:(PXSimpleIndexPath *)a3;
- (id)collectionAtIndexPath:(id)a3;
- (id)collectionListForSection:(int64_t)a3;
- (id)description;
- (id)existingAssetsFetchResultAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)indexPathForCollection:(id)a3;
- (id)keyAssetsForCollection:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)assetCollectionsCountForFetchResult:(id)a3;
- (int64_t)assetCollectionsCountForSection:(int64_t)a3;
- (int64_t)collectionsListCountForFetchResult:(id)a3;
- (int64_t)collectionsListCountForSection:(int64_t)a3;
- (int64_t)countForCollection:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
- (unsigned)sharingFilter;
- (void)enumerateCollectionsUsingBlock:(id)a3;
@end

@implementation PXPhotoKitCollectionsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_collectionsFetchResult, 0);
  objc_storeStrong((id *)&self->__virtualCollections, 0);
  objc_storeStrong((id *)&self->_itemFetchResultByCollection, 0);
  objc_storeStrong((id *)&self->__collectionsIndexPathsByCollection, 0);
  objc_storeStrong((id *)&self->__keyAssetsFetchResultsByCollection, 0);
  objc_storeStrong((id *)&self->__collectionsFetchResultBySection, 0);
  objc_storeStrong((id *)&self->__collectionListBySection, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
}

- (unsigned)sharingFilter
{
  return self->_sharingFilter;
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)configuration
{
  return self->_configuration;
}

- (PHFetchResult)collectionsFetchResult
{
  return self->_collectionsFetchResult;
}

- (NSArray)_virtualCollections
{
  return self->__virtualCollections;
}

- (NSDictionary)itemFetchResultByCollection
{
  return self->_itemFetchResultByCollection;
}

- (NSDictionary)_collectionsIndexPathsByCollection
{
  return self->__collectionsIndexPathsByCollection;
}

- (NSDictionary)_keyAssetsFetchResultsByCollection
{
  return self->__keyAssetsFetchResultsByCollection;
}

- (NSArray)_collectionsFetchResultBySection
{
  return self->__collectionsFetchResultBySection;
}

- (NSArray)_collectionListBySection
{
  return self->__collectionListBySection;
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (void)enumerateCollectionsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PXPhotoKitCollectionsDataSource_enumerateCollectionsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DD2EE0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __66__PXPhotoKitCollectionsDataSource_enumerateCollectionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enumerateObjectsUsingBlock:*(void *)(a1 + 32)];
}

- (int64_t)collectionsListCountForFetchResult:(id)a3
{
  if (a3) {
    return [a3 countOfCollectionsLists];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)assetCollectionsCountForFetchResult:(id)a3
{
  if (a3) {
    return [a3 countOfAssetCollections];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)collectionsListCountForSection:(int64_t)a3
{
  if (a3 < 0 || [(PXPhotoKitCollectionsDataSource *)self numberOfSections] <= a3)
  {
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Requesting for collections count for a section out of bounds.", v10, 2u);
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
    id v6 = [v5 objectAtIndexedSubscript:a3];
    int64_t v7 = [(PXPhotoKitCollectionsDataSource *)self collectionsListCountForFetchResult:v6];

    return v7;
  }
}

- (int64_t)assetCollectionsCountForSection:(int64_t)a3
{
  if (a3 < 0 || [(PXPhotoKitCollectionsDataSource *)self numberOfSections] <= a3)
  {
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "Requesting for collections count for a section out of bounds.", v10, 2u);
    }

    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
    id v6 = [v5 objectAtIndexedSubscript:a3];
    int64_t v7 = [(PXPhotoKitCollectionsDataSource *)self assetCollectionsCountForFetchResult:v6];

    return v7;
  }
}

- (id)existingAssetsFetchResultAtIndexPath:(PXSimpleIndexPath *)a3
{
  long long v4 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v4;
  v5 = [(PXPhotoKitCollectionsDataSource *)self _collectionAtSimpleIndexPath:v9];
  if ([v5 canContainAssets])
  {
    id v6 = [(PXPhotoKitCollectionsDataSource *)self itemFetchResultByCollection];
    int64_t v7 = [v6 objectForKeyedSubscript:v5];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)countForCollection:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PXPhotoKitCollectionsDataSource *)self sectionedDataSourceLog];
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  id v8 = v6;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v10 = objc_msgSend(v5, "px_cheapLogIdentifier");
    *(_DWORD *)buf = 138543362;
    v35 = v10;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CountForCollection", "collection==%{public}@", buf, 0xCu);
  }
  int v11 = objc_msgSend(v5, "px_isFolder");
  id v12 = v5;
  v13 = v12;
  if (v11)
  {
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_7:
        v14 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v13 options:0];
        uint64_t v15 = [(PXPhotoKitCollectionsDataSource *)self assetCollectionsCountForFetchResult:v14];
        goto LABEL_20;
      }
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      v30 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v30);
      v31 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
      [v24 handleFailureInMethod:a2, self, @"PXPhotoKitCollectionsDataSource.m", 228, @"%@ should be an instance inheriting from %@, but it is %@", @"collection", v26, v31 object file lineNumber description];
    }
    else
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      [v24 handleFailureInMethod:a2, self, @"PXPhotoKitCollectionsDataSource.m", 228, @"%@ should be an instance inheriting from %@, but it is nil", @"collection", v26 object file lineNumber description];
    }

    goto LABEL_7;
  }
  if (!v12)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    [v27 handleFailureInMethod:a2, self, @"PXPhotoKitCollectionsDataSource.m", 233, @"%@ should be an instance inheriting from %@, but it is nil", @"collection", v29 object file lineNumber description];
LABEL_32:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v32 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v32);
    v33 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
    [v27 handleFailureInMethod:a2, self, @"PXPhotoKitCollectionsDataSource.m", 233, @"%@ should be an instance inheriting from %@, but it is %@", @"collection", v29, v33 object file lineNumber description];

    goto LABEL_32;
  }
LABEL_10:
  char v16 = objc_msgSend(v13, "px_containsPrivateContent");
  if ([v13 assetCollectionType] == 2
    || [v13 assetCollectionType] == 9
    || [(PXPhotoKitCollectionsDataSource *)self sharingFilter] != 2)
  {
    if ((v16 & 1) == 0)
    {
LABEL_18:
      v20 = [(PXPhotoKitCollectionsDataSource *)self itemFetchResultByCollection];
      v14 = [v20 objectForKeyedSubscript:v13];

      if (!v14)
      {
        int64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_21;
      }
      uint64_t v15 = [v14 count];
LABEL_20:
      int64_t v19 = v15;
LABEL_21:

      goto LABEL_22;
    }
  }
  else
  {
    v17 = [(PXPhotoKitCollectionsDataSource *)self itemFetchResultByCollection];
    v18 = [v17 objectForKeyedSubscript:v13];

    if ((v16 & 1) == 0)
    {
      if (!v18)
      {
        v14 = [(PXPhotoKitCollectionsDataSource *)self configuration];
        uint64_t v15 = +[PXPhotoKitCollectionsDataSource estimatedCountForAssetCollection:v13 withConfiguration:v14];
        goto LABEL_20;
      }
      goto LABEL_18;
    }
  }
  int64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_22:

  v21 = v9;
  v22 = v21;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v22, OS_SIGNPOST_INTERVAL_END, v7, "CountForCollection", "", buf, 2u);
  }

  return v19;
}

- (id)collectionListForSection:(int64_t)a3
{
  if (a3 < 0 || [(PXPhotoKitCollectionsDataSource *)self numberOfSections] <= a3)
  {
    os_signpost_id_t v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Requesting for a collectionList for a section out of bounds.", v9, 2u);
    }

    id v6 = 0;
  }
  else
  {
    id v5 = [(PXPhotoKitCollectionsDataSource *)self _collectionListBySection];
    id v6 = [v5 objectAtIndexedSubscript:a3];
  }
  return v6;
}

- (id)collectionAtIndexPath:(id)a3
{
  id v4 = a3;
  if (([v4 section] & 0x8000000000000000) == 0)
  {
    unint64_t v5 = [v4 section];
    id v6 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
    if (v5 >= [v6 count] || objc_msgSend(v4, "item") < 0)
    {
    }
    else
    {
      unint64_t v7 = [v4 item];
      id v8 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
      v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
      unint64_t v10 = [v9 count];

      if (v7 < v10)
      {
        int v11 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
        id v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
        v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));

        goto LABEL_10;
      }
    }
  }
  v14 = PLUIGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v16 = 0;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "Requesting for a collection at an indexPath out of bounds.", v16, 2u);
  }

  v13 = 0;
LABEL_10:

  return v13;
}

- (id)indexPathForCollection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PXPhotoKitCollectionsDataSource *)self _collectionsIndexPathsByCollection];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    uint64_t v18 = 0;
    int64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v7 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__PXPhotoKitCollectionsDataSource_indexPathForCollection___block_invoke;
    v10[3] = &unk_1E5DCD500;
    id v11 = v4;
    id v12 = &v18;
    v13 = &v14;
    [v7 enumerateObjectsUsingBlock:v10];

    uint64_t v8 = v15[3];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:v8 inSection:v19[3]];
    }

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }

  return v6;
}

uint64_t __58__PXPhotoKitCollectionsDataSource_indexPathForCollection___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 indexOfObject:a1[4]];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    *(void *)(*(void *)(a1[6] + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6 = a4;
  unint64_t v7 = v6;
  int64_t v8 = *(void *)off_1E5DAB028;
  int64_t v9 = *((void *)off_1E5DAB028 + 1);
  int64x2_t v18 = *((int64x2_t *)off_1E5DAB028 + 1);
  if (!v6)
  {
    if (![(PXPhotoKitCollectionsDataSource *)self identifier])
    {
      int64_t v8 = 0;
      int64_t v9 = 0;
      int64x2_t v10 = 0uLL;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  [v6 indexPath];
  if (v25 != [(PXPhotoKitCollectionsDataSource *)self identifier])
  {
    [v7 indexPath];
    if (v19 != *(void *)off_1E5DAAED8 && v20 != 0x7FFFFFFFFFFFFFFFLL && v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = [v7 itemObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [(PXPhotoKitCollectionsDataSource *)self indexPathForCollection:v13];
        if (v14)
        {
          int64_t v8 = [(PXPhotoKitCollectionsDataSource *)self identifier];
          int64_t v9 = [v14 section];
          uint64_t v15 = [v14 item];
          int64x2_t v16 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
          v16.i64[0] = v15;
          int64x2_t v18 = v16;
        }
      }
    }
LABEL_19:
    int64x2_t v10 = v18;
    goto LABEL_21;
  }
  [v7 indexPath];
  int64_t v9 = v23;
  int64_t v8 = v22;
  int64x2_t v10 = v24;
LABEL_21:
  retstr->dataSourceIdentifier = v8;
  retstr->section = v9;
  *(int64x2_t *)&retstr->item = v10;

  return result;
}

- (id)keyAssetsForCollection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PXPhotoKitCollectionsDataSource *)self _keyAssetsFetchResultsByCollection];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)_assetAtSimpleIndexPath:(PXSimpleIndexPath *)a3
{
  unint64_t v5 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
  id v6 = [v5 objectAtIndexedSubscript:a3->section];
  unint64_t v7 = [v6 objectAtIndexedSubscript:a3->item];

  int64_t v8 = [(PXPhotoKitCollectionsDataSource *)self _keyAssetsFetchResultsByCollection];
  int64_t v9 = [v8 objectForKeyedSubscript:v7];
  int64x2_t v10 = [v9 objectAtIndexedSubscript:a3->subitem];

  return v10;
}

- (id)_collectionAtSimpleIndexPath:(PXSimpleIndexPath *)a3
{
  id v4 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
  unint64_t v5 = [v4 objectAtIndexedSubscript:a3->section];
  id v6 = [v5 objectAtIndexedSubscript:a3->item];

  return v6;
}

- (id)_collectionListAtSimpleIndexPath:(PXSimpleIndexPath *)a3
{
  id v4 = [(PXPhotoKitCollectionsDataSource *)self _collectionListBySection];
  unint64_t v5 = [v4 objectAtIndexedSubscript:a3->section];

  return v5;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXPhotoKitCollectionsDataSource.m", 129, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsSection(indexPath)" object file lineNumber description];

    int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  }
  if (dataSourceIdentifier != [(PXPhotoKitCollectionsDataSource *)self identifier])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXPhotoKitCollectionsDataSource.m", 130, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  int64_t v9 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
  int64x2_t v10 = [v9 objectAtIndexedSubscript:a3->section];

  return v10;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8) {
    goto LABEL_9;
  }
  int64_t item = a3->item;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_9;
    }
  }
  else if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    goto LABEL_10;
  }
  if (a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v5 = *(_OWORD *)&a3->item;
    long long v8 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v9 = v5;
    id v4 = [(PXPhotoKitCollectionsDataSource *)self _collectionAtSimpleIndexPath:&v8];
    goto LABEL_10;
  }
LABEL_9:
  long long v6 = *(_OWORD *)&a3->item;
  long long v8 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v9 = v6;
  id v4 = [(PXPhotoKitCollectionsDataSource *)self _assetAtSimpleIndexPath:&v8];
LABEL_10:
  return v4;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  unint64_t v7 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
  long long v8 = [v7 objectAtIndexedSubscript:a4];

  long long v9 = [v8 objectAtIndexedSubscript:a3];
  int64x2_t v10 = [(PXPhotoKitCollectionsDataSource *)self _keyAssetsFetchResultsByCollection];
  id v11 = [v10 objectForKeyedSubscript:v9];

  uint64_t v12 = [v11 count];
  if (v12 <= 1) {
    int64_t v13 = 1;
  }
  else {
    int64_t v13 = v12;
  }

  return v13;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  id v4 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
  long long v5 = [v4 objectAtIndexedSubscript:a3];

  int64_t v6 = [v5 count];
  return v6;
}

- (int64_t)numberOfSections
{
  v2 = [(PXPhotoKitCollectionsDataSource *)self _collectionsFetchResultBySection];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)description
{
  uint64_t v3 = [(PXPhotoKitCollectionsDataSource *)self numberOfSections];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      int64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[PXPhotoKitCollectionsDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", i));
      [v4 addObject:v6];
    }
  }
  unint64_t v7 = NSString;
  long long v8 = (objc_class *)objc_opt_class();
  long long v9 = NSStringFromClass(v8);
  int64x2_t v10 = [v7 stringWithFormat:@"<%@: %p, numberOfSections:%ld sectionCounts:[%@]>", v9, self, v3, v4];

  return v10;
}

- (PXPhotoKitCollectionsDataSource)init
{
  LOWORD(v3) = 2;
  return [(PXPhotoKitCollectionsDataSource *)self initWithRootCollectionList:0 collectionListBySection:0 collectionsFetchResultBySection:0 keyAssetsFetchResultsByCollection:0 collectionsIndexPathsByCollection:0 itemFetchResultByCollection:0 virtualCollections:0 collectionsFetchResult:0 sharingFilter:v3 dataSourceConfiguration:0];
}

- (PXPhotoKitCollectionsDataSource)initWithRootCollectionList:(id)a3 collectionListBySection:(id)a4 collectionsFetchResultBySection:(id)a5 keyAssetsFetchResultsByCollection:(id)a6 collectionsIndexPathsByCollection:(id)a7 itemFetchResultByCollection:(id)a8 virtualCollections:(id)a9 collectionsFetchResult:(id)a10 sharingFilter:(unsigned __int16)a11 dataSourceConfiguration:(id)a12
{
  id v43 = a3;
  id v44 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a12;
  v45.receiver = self;
  v45.super_class = (Class)PXPhotoKitCollectionsDataSource;
  v26 = [(PXPhotoKitCollectionsDataSource *)&v45 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_collectionList, a3);
    uint64_t v28 = [v44 copy];
    collectionListBySection = v27->__collectionListBySection;
    v27->__collectionListBySection = (NSArray *)v28;

    uint64_t v30 = [v19 copy];
    collectionsFetchResultBySection = v27->__collectionsFetchResultBySection;
    v27->__collectionsFetchResultBySection = (NSArray *)v30;

    uint64_t v32 = [v20 copy];
    keyAssetsFetchResultsByCollection = v27->__keyAssetsFetchResultsByCollection;
    v27->__keyAssetsFetchResultsByCollection = (NSDictionary *)v32;

    uint64_t v34 = [v21 copy];
    collectionsIndexPathsByCollection = v27->__collectionsIndexPathsByCollection;
    v27->__collectionsIndexPathsByCollection = (NSDictionary *)v34;

    uint64_t v36 = [v22 copy];
    itemFetchResultByCollection = v27->_itemFetchResultByCollection;
    v27->_itemFetchResultByCollection = (NSDictionary *)v36;

    uint64_t v38 = [v24 copy];
    collectionsFetchResult = v27->_collectionsFetchResult;
    v27->_collectionsFetchResult = (PHFetchResult *)v38;

    objc_storeStrong((id *)&v27->_configuration, a12);
    uint64_t v40 = [v23 copy];
    virtualCollections = v27->__virtualCollections;
    v27->__virtualCollections = (NSArray *)v40;

    v27->_sharingFilter = a11;
  }

  return v27;
}

+ (int64_t)estimatedCountForAssetCollection:(id)a3 withConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v6 assetsFilterPredicate];

  uint64_t v8 = [v6 assetTypesToInclude];
  if (!v7)
  {
    if (v8 != -1 && (~v8 & 3) != 0)
    {
      if ((v8 & 1) == 0)
      {
        if ((v8 & 2) == 0)
        {
          int64_t v9 = 0;
          goto LABEL_12;
        }
LABEL_17:
        uint64_t v10 = [v5 estimatedVideosCount];
        goto LABEL_11;
      }
      goto LABEL_16;
    }
LABEL_10:
    uint64_t v10 = [v5 estimatedAssetCount];
LABEL_11:
    int64_t v9 = v10;
    goto LABEL_12;
  }
  if ((~v8 & 7) == 0) {
    goto LABEL_10;
  }
  if ((v8 & 4) == 0)
  {
    if ((~v8 & 3) != 0)
    {
      if ((v8 & 1) == 0)
      {
        if ((v8 & 2) == 0) {
          goto LABEL_7;
        }
        goto LABEL_17;
      }
LABEL_16:
      uint64_t v10 = [v5 estimatedPhotosCount];
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_7:
  int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v9;
}

@end