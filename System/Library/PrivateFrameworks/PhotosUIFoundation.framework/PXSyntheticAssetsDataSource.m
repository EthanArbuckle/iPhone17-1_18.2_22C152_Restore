@interface PXSyntheticAssetsDataSource
- (NSArray)assetCollections;
- (NSArray)assetsBySection;
- (PXSimpleIndexPath)indexPathForObjectID:(SEL)a3;
- (PXSyntheticAssetsDataSource)initWithAssetsBySection:(id)a3 assetCollections:(id)a4;
- (PXSyntheticAssetsDataSource)initWithConfigurationBlock:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
@end

@implementation PXSyntheticAssetsDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollections, 0);

  objc_storeStrong((id *)&self->_assetsBySection, 0);
}

- (NSArray)assetCollections
{
  return self->_assetCollections;
}

- (NSArray)assetsBySection
{
  return self->_assetsBySection;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  if (a3->dataSourceIdentifier) {
    BOOL v4 = a3->section == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4 || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    long long v13 = *(_OWORD *)&a3->item;
    v15[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v15[1] = v13;
    v14 = PXSimpleIndexPathDescription(v15);
    [v12 handleFailureInMethod:a2, self, @"PXSyntheticAssetsDataSource.m", 89, @"%@ invalid indexPath:%@", self, v14 object file lineNumber description];

    abort();
  }
  v6 = [(PXSyntheticAssetsDataSource *)self assetsBySection];
  v7 = [v6 objectAtIndexedSubscript:a3->section];

  v8 = [[PXSyntheticAssetsFetchResult alloc] initWithAssets:v7];

  return v8;
}

- (PXSimpleIndexPath)indexPathForObjectID:(SEL)a3
{
  id v5 = a4;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v14 = [MEMORY[0x263F08690] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v17);
    v18 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a3, self, @"PXSyntheticAssetsDataSource.m", 68, @"%@ should be an instance inheriting from %@, but it is %@", @"objectID", v16, v18 object file lineNumber description];
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a3, self, @"PXSyntheticAssetsDataSource.m", 68, @"%@ should be an instance inheriting from %@, but it is nil", @"objectID", v16 object file lineNumber description];
  }

LABEL_3:
  uint64_t v6 = [(PXSyntheticAssetsDataSource *)self numberOfSections];
  if (v6 < 1)
  {
LABEL_7:
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)PXSimpleIndexPathNull;
    *(_OWORD *)&retstr->item = *(_OWORD *)&PXSimpleIndexPathNull[16];
  }
  else
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    while (1)
    {
      v9 = [(PXSyntheticAssetsDataSource *)self assetsBySection];
      v10 = [v9 objectAtIndexedSubscript:v8];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __52__PXSyntheticAssetsDataSource_indexPathForObjectID___block_invoke;
      v21[3] = &unk_26545BC70;
      id v22 = v5;
      uint64_t v11 = [v10 indexOfObjectPassingTest:v21];
      if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }

      if (v7 == ++v8) {
        goto LABEL_7;
      }
    }
    int64_t v12 = v11;
    retstr->dataSourceIdentifier = [(PXSectionedDataSource *)self identifier];
    retstr->section = v8;
    retstr->item = v12;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

uint64_t __52__PXSyntheticAssetsDataSource_indexPathForObjectID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXSectionedDataSource *)self identifier])
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSource.m" lineNumber:49 description:@"Invalid identifier"];
  }
  if (!a3->dataSourceIdentifier) {
    goto LABEL_17;
  }
  int64_t item = a3->item;
  if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t section = a3->section;
    if (section != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (section >= [(PXSyntheticAssetsDataSource *)self numberOfSections])
      {
        v16 = [MEMORY[0x263F08690] currentHandler];
        [v16 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSource.m" lineNumber:59 description:@"Out-of-bounds index path"];
      }
      v9 = [(PXSyntheticAssetsDataSource *)self assetCollections];
      v10 = [v9 objectAtIndexedSubscript:section];
      goto LABEL_13;
    }
LABEL_17:
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSource.m" lineNumber:63 description:@"Invalid index path"];

    abort();
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_17;
  }
  int64_t v11 = a3->section;
  if (v11 >= [(PXSyntheticAssetsDataSource *)self numberOfSections]
    || item >= [(PXSyntheticAssetsDataSource *)self numberOfItemsInSection:v11])
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSource.m" lineNumber:53 description:@"Out-of-bounds index path"];
  }
  v9 = [(PXSyntheticAssetsDataSource *)self assetsBySection];
  int64_t v12 = [v9 objectAtIndexedSubscript:v11];
  v10 = [v12 objectAtIndexedSubscript:item];

LABEL_13:

  return v10;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSource.m" lineNumber:44 description:@"Subitems not supported"];

  abort();
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  if ([(PXSyntheticAssetsDataSource *)self numberOfSections] <= a3)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSource.m" lineNumber:38 description:@"Out-of-bounds section"];
  }
  uint64_t v6 = [(PXSyntheticAssetsDataSource *)self assetsBySection];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3];
  int64_t v8 = [v7 count];

  return v8;
}

- (int64_t)numberOfSections
{
  v2 = [(PXSyntheticAssetsDataSource *)self assetsBySection];
  int64_t v3 = [v2 count];

  return v3;
}

- (PXSyntheticAssetsDataSource)initWithConfigurationBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, PXSyntheticAssetsDataSourceBuilder *))a3;
  id v5 = objc_alloc_init(PXSyntheticAssetsDataSourceBuilder);
  v4[2](v4, v5);

  uint64_t v6 = [(PXSyntheticAssetsDataSourceBuilder *)v5 assetsBySection];
  uint64_t v7 = [(PXSyntheticAssetsDataSourceBuilder *)v5 assetCollections];
  int64_t v8 = [(PXSyntheticAssetsDataSource *)self initWithAssetsBySection:v6 assetCollections:v7];

  return v8;
}

- (PXSyntheticAssetsDataSource)initWithAssetsBySection:(id)a3 assetCollections:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  if (v9 != [v8 count])
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXSyntheticAssetsDataSource.m", 16, @"Invalid parameter not satisfying: %@", @"assetsBySection.count == assetCollections.count" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PXSyntheticAssetsDataSource;
  v10 = [(PXSectionedDataSource *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    assetsBySection = v10->_assetsBySection;
    v10->_assetsBySection = (NSArray *)v11;

    uint64_t v13 = [v8 copy];
    assetCollections = v10->_assetCollections;
    v10->_assetCollections = (NSArray *)v13;
  }
  return v10;
}

@end