@interface PXFileBackedAssetsDataSource
- (NSDictionary)assetDescriptionsBySection;
- (PXFileBackedAssetsDataSource)init;
- (PXFileBackedAssetsDataSource)initWithFileBackedAssetDescriptionsBySection:(id)a3;
- (PXFileBackedAssetsDataSource)initWithFileURLsBySection:(id)a3;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)assetsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (id)inputForItem:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
@end

@implementation PXFileBackedAssetsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDescriptionsBySection, 0);
  objc_storeStrong((id *)&self->_assetCollectionBySection, 0);
}

- (NSDictionary)assetDescriptionsBySection
{
  return self->_assetDescriptionsBySection;
}

- (id)inputForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXFileBackedAssetsDataSource *)self identifier];
  uint64_t v6 = objc_msgSend(v4, "px_section");
  uint64_t v7 = objc_msgSend(v4, "px_item");

  v10[0] = v5;
  v10[1] = v6;
  v10[2] = v7;
  v10[3] = 0x7FFFFFFFFFFFFFFFLL;
  v8 = [(PXFileBackedAssetsDataSource *)self objectAtIndexPath:v10];
  return v8;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7 = a4;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x4010000000;
  v32 = &unk_1AB5D584F;
  long long v33 = 0u;
  long long v34 = 0u;
  v28.receiver = self;
  v28.super_class = (Class)PXFileBackedAssetsDataSource;
  [(PXSimpleIndexPath *)&v28 indexPathForObjectReference:v7];
  if (v30[4] == *(void *)off_1E5DAAED8)
  {
    v8 = [v7 sectionObject];
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = [MEMORY[0x1E4F28B00] currentHandler];
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        v19 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
        [v16 handleFailureInMethod:a3, self, @"PXFileBackedAssetsDataSource.m", 183, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"objectReference.sectionObject", v18, v19 object file lineNumber description];
      }
    }
    v9 = [v7 itemObject];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        v23 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
        [v20 handleFailureInMethod:a3, self, @"PXFileBackedAssetsDataSource.m", 184, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"objectReference.itemObject", v22, v23 object file lineNumber description];
      }
      v10 = [(PXFileBackedAssetsDataSource *)self assetDescriptionsBySection];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __60__PXFileBackedAssetsDataSource_indexPathForObjectReference___block_invoke;
      v26[3] = &unk_1E5DC2760;
      v27[1] = self;
      v27[2] = &v29;
      v27[0] = v9;
      [v10 enumerateKeysAndObjectsUsingBlock:v26];
      v11 = (id *)v27;
    }
    else
    {
      if (!v8)
      {
LABEL_13:
        long long v14 = *((_OWORD *)v30 + 3);
        *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v30 + 2);
        *(_OWORD *)&retstr->item = v14;

        goto LABEL_14;
      }
      assetCollectionBySection = self->_assetCollectionBySection;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __60__PXFileBackedAssetsDataSource_indexPathForObjectReference___block_invoke_2;
      v24[3] = &unk_1E5DC2788;
      v25[1] = self;
      v25[2] = &v29;
      v25[0] = v8;
      [(NSDictionary *)assetCollectionBySection enumerateKeysAndObjectsUsingBlock:v24];
      v11 = (id *)v25;
    }

    goto LABEL_13;
  }
  long long v12 = *((_OWORD *)v30 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v30 + 2);
  *(_OWORD *)&retstr->item = v12;
LABEL_14:
  _Block_object_dispose(&v29, 8);

  return result;
}

void __60__PXFileBackedAssetsDataSource_indexPathForObjectReference___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v19 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      uint64_t v12 = 0;
      uint64_t v20 = v10 + v9;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v12), "url", v19);
        long long v14 = [*(id *)(a1 + 32) url];
        int v15 = [v13 isEqual:v14];

        if (v15)
        {
          uint64_t v16 = [*(id *)(a1 + 40) identifier];
          uint64_t v17 = [v6 integerValue];
          v18 = *(void **)(*(void *)(a1 + 48) + 8);
          v18[4] = v16;
          v18[5] = v17;
          v18[6] = v10 + v12;
          v18[7] = 0x7FFFFFFFFFFFFFFFLL;
          unsigned char *v19 = 1;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v10 = v20;
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __60__PXFileBackedAssetsDataSource_indexPathForObjectReference___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([*(id *)(a1 + 32) isEqual:a3])
  {
    uint64_t v7 = [*(id *)(a1 + 40) identifier];
    uint64_t v8 = [v10 integerValue];
    uint64_t v9 = *(int64x2_t **)(*(void *)(a1 + 48) + 8);
    v9[2].i64[0] = v7;
    v9[2].i64[1] = v8;
    v9[3] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *a4 = 1;
  }
}

- (id)assetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(PXFileBackedAssetsDataSource *)self assetDescriptionsBySection];
  uint64_t v7 = [NSNumber numberWithInteger:a3->section];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [[PXFileBackedAsset alloc] initWithDescription:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  long long v14 = [[PXFileBackedFetchResult alloc] initWithAssets:v5];
  return v14;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXFileBackedAssetsDataSource *)self identifier])
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXFileBackedAssetsDataSource.m", 150, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == [self identifier]" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8) {
    goto LABEL_12;
  }
  if (a3->item == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3->section != 0x7FFFFFFFFFFFFFFFLL)
    {
      assetCollectionBySection = self->_assetCollectionBySection;
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:");
      uint64_t v9 = [(NSDictionary *)assetCollectionBySection objectForKeyedSubscript:v8];
      goto LABEL_9;
    }
LABEL_12:
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    PXSimpleIndexPathDescription();
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  uint64_t v10 = [(PXFileBackedAssetsDataSource *)self assetDescriptionsBySection];
  uint64_t v11 = [NSNumber numberWithInteger:a3->section];
  uint64_t v8 = [v10 objectForKeyedSubscript:v11];

  uint64_t v12 = [v8 objectAtIndexedSubscript:a3->item];
  uint64_t v9 = [[PXFileBackedAsset alloc] initWithDescription:v12];

LABEL_9:
  return v9;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  id v4 = [(PXFileBackedAssetsDataSource *)self assetDescriptionsBySection];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];
  int64_t v7 = [v6 count];

  return v7;
}

- (int64_t)numberOfSections
{
  v2 = [(PXFileBackedAssetsDataSource *)self assetDescriptionsBySection];
  int64_t v3 = [v2 count];

  return v3;
}

- (PXFileBackedAssetsDataSource)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFileBackedAssetsDataSource.m", 134, @"%s is not available as initializer", "-[PXFileBackedAssetsDataSource init]");

  abort();
}

- (PXFileBackedAssetsDataSource)initWithFileURLsBySection:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__PXFileBackedAssetsDataSource_initWithFileURLsBySection___block_invoke;
  v10[3] = &unk_1E5DC2738;
  id v11 = v6;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  uint64_t v8 = [(PXFileBackedAssetsDataSource *)self initWithFileBackedAssetDescriptionsBySection:v7];
  return v8;
}

void __58__PXFileBackedAssetsDataSource_initWithFileURLsBySection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = +[PXFileBackedAssetDescription simpleImageDescriptionWithURL:](PXFileBackedAssetDescription, "simpleImageDescriptionWithURL:", *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14);
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

- (PXFileBackedAssetsDataSource)initWithFileBackedAssetDescriptionsBySection:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXFileBackedAssetsDataSource;
  id v5 = [(PXFileBackedAssetsDataSource *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assetDescriptionsBySection = v5->_assetDescriptionsBySection;
    v5->_assetDescriptionsBySection = (NSDictionary *)v6;

    id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__PXFileBackedAssetsDataSource_initWithFileBackedAssetDescriptionsBySection___block_invoke;
    v13[3] = &unk_1E5DD30D8;
    uint64_t v9 = v8;
    long long v14 = v9;
    [v4 enumerateKeysAndObjectsUsingBlock:v13];
    assetCollectionBySection = v5->_assetCollectionBySection;
    v5->_assetCollectionBySection = v9;
    uint64_t v11 = v9;
  }
  return v5;
}

void __77__PXFileBackedAssetsDataSource_initWithFileBackedAssetDescriptionsBySection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(_PXFileBackedAssetCollection);
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
}

@end