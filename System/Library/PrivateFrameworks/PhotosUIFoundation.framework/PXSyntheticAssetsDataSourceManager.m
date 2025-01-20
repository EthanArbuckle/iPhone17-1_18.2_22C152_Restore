@interface PXSyntheticAssetsDataSourceManager
- (PXSyntheticAssetsDataSourceManager)init;
- (PXSyntheticAssetsDataSourceManager)initWithConfigurationBlock:(id)a3;
- (id)createInitialDataSource;
- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4;
- (void)_appendIncrementalChangeDetails:(id)a3;
- (void)changeItemAtIndexPath:(id)a3 toAsset:(id)a4;
- (void)changeSectionAtIndex:(int64_t)a3 toAssetCollection:(id)a4;
- (void)insertItemAtIndexPath:(id)a3 assetBlock:(id)a4;
- (void)insertSectionAtIndex:(int64_t)a3 count:(int64_t)a4 assetCollection:(id)a5 assetBlock:(id)a6;
- (void)markChangeAsReload;
- (void)performDataSourceChanges:(id)a3;
- (void)removeItemAtIndexPath:(id)a3;
- (void)removeSectionAtIndex:(int64_t)a3;
@end

@implementation PXSyntheticAssetsDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDetailsCoalescer, 0);
  objc_storeStrong((id *)&self->_nextAssetCollections, 0);
  objc_storeStrong((id *)&self->_nextAssetsBySection, 0);

  objc_storeStrong((id *)&self->_initialDataSource, 0);
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a4, a3);
}

- (void)markChangeAsReload
{
  if (!self->_isPerformingDataSourceChanges)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PXSyntheticAssetsDataSourceManager.m", 174, @"Invalid parameter not satisfying: %@", @"_isPerformingDataSourceChanges" object file lineNumber description];
  }
  self->_changeIsReload = 1;
  changeDetailsCoalescer = self->_changeDetailsCoalescer;
  self->_changeDetailsCoalescer = 0;
}

- (void)changeSectionAtIndex:(int64_t)a3 toAssetCollection:(id)a4
{
  id v18 = a4;
  if (!self->_isPerformingDataSourceChanges)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXSyntheticAssetsDataSourceManager.m", 165, @"Invalid parameter not satisfying: %@", @"_isPerformingDataSourceChanges" object file lineNumber description];
  }
  if ([(NSMutableArray *)self->_nextAssetCollections count] <= (unint64_t)a3)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSourceManager.m" lineNumber:166 description:@"Out of bounds index for section change"];
  }
  nextAssetCollections = self->_nextAssetCollections;
  v8 = (void *)[v18 copyWithZone:0];
  [(NSMutableArray *)nextAssetCollections replaceObjectAtIndex:a3 withObject:v8];

  v9 = [PXSectionedDataSourceChangeDetails alloc];
  v10 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v11 = [v10 identifier];
  v12 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v13 = [v12 identifier];
  v14 = +[PXArrayChangeDetails changeDetailsWithChangedIndexRange:](PXArrayChangeDetails, "changeDetailsWithChangedIndexRange:", a3, 1);
  v15 = [(PXSectionedDataSourceChangeDetails *)v9 initWithFromDataSourceIdentifier:v11 toDataSourceIdentifier:v13 sectionChanges:v14 itemChangeDetailsBySection:0 subitemChangeDetailsByItemBySection:0];

  [(PXSyntheticAssetsDataSourceManager *)self _appendIncrementalChangeDetails:v15];
}

- (void)removeSectionAtIndex:(int64_t)a3
{
  if (!self->_isPerformingDataSourceChanges)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXSyntheticAssetsDataSourceManager.m", 155, @"Invalid parameter not satisfying: %@", @"_isPerformingDataSourceChanges" object file lineNumber description];
  }
  if ([(NSMutableArray *)self->_nextAssetCollections count] <= (unint64_t)a3
    || [(NSMutableArray *)self->_nextAssetsBySection count] <= (unint64_t)a3)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSourceManager.m" lineNumber:156 description:@"Out of bounds index for section deletion"];
  }
  [(NSMutableArray *)self->_nextAssetCollections removeObjectAtIndex:a3];
  [(NSMutableArray *)self->_nextAssetsBySection removeObjectAtIndex:a3];
  v6 = [PXSectionedDataSourceChangeDetails alloc];
  v7 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v8 = [v7 identifier];
  v9 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v10 = [v9 identifier];
  uint64_t v11 = +[PXArrayChangeDetails changeDetailsWithRemovedIndexRange:](PXArrayChangeDetails, "changeDetailsWithRemovedIndexRange:", a3, 1);
  v14 = [(PXSectionedDataSourceChangeDetails *)v6 initWithFromDataSourceIdentifier:v8 toDataSourceIdentifier:v10 sectionChanges:v11 itemChangeDetailsBySection:0 subitemChangeDetailsByItemBySection:0];

  [(PXSyntheticAssetsDataSourceManager *)self _appendIncrementalChangeDetails:v14];
}

- (void)insertSectionAtIndex:(int64_t)a3 count:(int64_t)a4 assetCollection:(id)a5 assetBlock:(id)a6
{
  id v27 = a5;
  uint64_t v11 = (void (**)(id, int64_t, void))a6;
  if (self->_isPerformingDataSourceChanges)
  {
    if (!a4) {
      goto LABEL_5;
    }
  }
  else
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PXSyntheticAssetsDataSourceManager.m", 139, @"Invalid parameter not satisfying: %@", @"_isPerformingDataSourceChanges" object file lineNumber description];

    if (!a4) {
      goto LABEL_5;
    }
  }
  if (!v11)
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PXSyntheticAssetsDataSourceManager.m", 140, @"Invalid parameter not satisfying: %@", @"assetBlock != nil || count == 0" object file lineNumber description];
  }
LABEL_5:
  if ([(NSMutableArray *)self->_nextAssetCollections count] < (unint64_t)a3
    || [(NSMutableArray *)self->_nextAssetsBySection count] < (unint64_t)a3)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSourceManager.m" lineNumber:141 description:@"Out of bounds index for section insertion"];
  }
  v12 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a4];
  if (a4 >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      v14 = v11[2](v11, a3, v13);
      [v12 addObject:v14];

      ++v13;
    }
    while (a4 != v13);
  }
  [(NSMutableArray *)self->_nextAssetsBySection insertObject:v12 atIndex:a3];
  nextAssetCollections = self->_nextAssetCollections;
  v16 = (void *)[v27 copyWithZone:0];
  [(NSMutableArray *)nextAssetCollections insertObject:v16 atIndex:a3];

  v17 = [PXSectionedDataSourceChangeDetails alloc];
  id v18 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v19 = [v18 identifier];
  v20 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v21 = [v20 identifier];
  v22 = +[PXArrayChangeDetails changeDetailsWithInsertedIndexRange:](PXArrayChangeDetails, "changeDetailsWithInsertedIndexRange:", a3, 1);
  v23 = [(PXSectionedDataSourceChangeDetails *)v17 initWithFromDataSourceIdentifier:v19 toDataSourceIdentifier:v21 sectionChanges:v22 itemChangeDetailsBySection:0 subitemChangeDetailsByItemBySection:0];

  [(PXSyntheticAssetsDataSourceManager *)self _appendIncrementalChangeDetails:v23];
}

- (void)changeItemAtIndexPath:(id)a3 toAsset:(id)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, unint64_t, unint64_t))a4;
  if (!self->_isPerformingDataSourceChanges)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXSyntheticAssetsDataSourceManager.m", 124, @"Invalid parameter not satisfying: %@", @"_isPerformingDataSourceChanges" object file lineNumber description];
  }
  unint64_t v9 = objc_msgSend(v7, "px_section");
  v28 = v7;
  unint64_t v10 = objc_msgSend(v7, "px_item");
  if (v9 >= [(NSMutableArray *)self->_nextAssetsBySection count])
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSourceManager.m" lineNumber:127 description:@"Out of bounds section for change"];
  }
  uint64_t v11 = [(NSMutableArray *)self->_nextAssetsBySection objectAtIndexedSubscript:v9];
  if (v10 >= [v11 count])
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSyntheticAssetsDataSourceManager.m", 129, @"Out of bounds index for change in section %ld", v9);
  }
  id v27 = v8[2](v8, v9, v10);
  [v11 replaceObjectAtIndex:v10 withObject:v27];
  v12 = [PXSectionedDataSourceChangeDetails alloc];
  uint64_t v13 = [(PXSectionedDataSourceManager *)self dataSource];
  v26 = v11;
  uint64_t v14 = [v13 identifier];
  v15 = [(PXSectionedDataSourceManager *)self dataSource];
  v25 = v8;
  uint64_t v16 = [v15 identifier];
  v17 = +[PXArrayChangeDetails changeDetailsWithNoChanges];
  id v18 = [NSNumber numberWithInteger:v9];
  v29 = v18;
  uint64_t v19 = +[PXArrayChangeDetails changeDetailsWithChangedIndexRange:](PXArrayChangeDetails, "changeDetailsWithChangedIndexRange:", v10, 1);
  v30[0] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  uint64_t v21 = [(PXSectionedDataSourceChangeDetails *)v12 initWithFromDataSourceIdentifier:v14 toDataSourceIdentifier:v16 sectionChanges:v17 itemChangeDetailsBySection:v20 subitemChangeDetailsByItemBySection:0];

  [(PXSyntheticAssetsDataSourceManager *)self _appendIncrementalChangeDetails:v21];
}

- (void)removeItemAtIndexPath:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!self->_isPerformingDataSourceChanges)
  {
    uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXSyntheticAssetsDataSourceManager.m", 110, @"Invalid parameter not satisfying: %@", @"_isPerformingDataSourceChanges" object file lineNumber description];
  }
  unint64_t v6 = objc_msgSend(v5, "px_section");
  v23 = v5;
  unint64_t v7 = objc_msgSend(v5, "px_item");
  if (v6 >= [(NSMutableArray *)self->_nextAssetsBySection count])
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSourceManager.m" lineNumber:113 description:@"Out of bounds section for deletion"];
  }
  uint64_t v8 = [(NSMutableArray *)self->_nextAssetsBySection objectAtIndexedSubscript:v6];
  if (v7 >= [v8 count])
  {
    uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSyntheticAssetsDataSourceManager.m", 115, @"Out of bounds index for deletion in section %ld", v6);
  }
  [v8 removeObjectAtIndex:v7];
  unint64_t v9 = [PXSectionedDataSourceChangeDetails alloc];
  unint64_t v10 = [(PXSectionedDataSourceManager *)self dataSource];
  uint64_t v11 = [v10 identifier];
  v12 = [(PXSectionedDataSourceManager *)self dataSource];
  v22 = v8;
  uint64_t v13 = [v12 identifier];
  uint64_t v14 = +[PXArrayChangeDetails changeDetailsWithNoChanges];
  v15 = [NSNumber numberWithInteger:v6];
  v24 = v15;
  uint64_t v16 = +[PXArrayChangeDetails changeDetailsWithRemovedIndexRange:](PXArrayChangeDetails, "changeDetailsWithRemovedIndexRange:", v7, 1);
  v25[0] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  id v18 = [(PXSectionedDataSourceChangeDetails *)v9 initWithFromDataSourceIdentifier:v11 toDataSourceIdentifier:v13 sectionChanges:v14 itemChangeDetailsBySection:v17 subitemChangeDetailsByItemBySection:0];

  [(PXSyntheticAssetsDataSourceManager *)self _appendIncrementalChangeDetails:v18];
}

- (void)insertItemAtIndexPath:(id)a3 assetBlock:(id)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, unint64_t, unint64_t))a4;
  if (!self->_isPerformingDataSourceChanges)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXSyntheticAssetsDataSourceManager.m", 95, @"Invalid parameter not satisfying: %@", @"_isPerformingDataSourceChanges" object file lineNumber description];
  }
  unint64_t v9 = objc_msgSend(v7, "px_section");
  v28 = v7;
  unint64_t v10 = objc_msgSend(v7, "px_item");
  if (v9 >= [(NSMutableArray *)self->_nextAssetsBySection count])
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSourceManager.m" lineNumber:98 description:@"Out of bounds section for insertion"];
  }
  uint64_t v11 = [(NSMutableArray *)self->_nextAssetsBySection objectAtIndexedSubscript:v9];
  if (v10 > [v11 count])
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSyntheticAssetsDataSourceManager.m", 100, @"Out of bounds index for insertion in section %ld", v9);
  }
  id v27 = v8[2](v8, v9, v10);
  [v11 insertObject:v27 atIndex:v10];
  v12 = [PXSectionedDataSourceChangeDetails alloc];
  uint64_t v13 = [(PXSectionedDataSourceManager *)self dataSource];
  v26 = v11;
  uint64_t v14 = [v13 identifier];
  v15 = [(PXSectionedDataSourceManager *)self dataSource];
  v25 = v8;
  uint64_t v16 = [v15 identifier];
  v17 = +[PXArrayChangeDetails changeDetailsWithNoChanges];
  id v18 = [NSNumber numberWithInteger:v9];
  v29 = v18;
  uint64_t v19 = +[PXArrayChangeDetails changeDetailsWithInsertedIndexRange:](PXArrayChangeDetails, "changeDetailsWithInsertedIndexRange:", v10, 1);
  v30[0] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  uint64_t v21 = [(PXSectionedDataSourceChangeDetails *)v12 initWithFromDataSourceIdentifier:v14 toDataSourceIdentifier:v16 sectionChanges:v17 itemChangeDetailsBySection:v20 subitemChangeDetailsByItemBySection:0];

  [(PXSyntheticAssetsDataSourceManager *)self _appendIncrementalChangeDetails:v21];
}

- (void)_appendIncrementalChangeDetails:(id)a3
{
  id v4 = a3;
  changeDetailsCoalescer = self->_changeDetailsCoalescer;
  id v8 = v4;
  if (changeDetailsCoalescer || self->_changeIsReload)
  {
    [(PXSectionedChangeDetailsCoalescer *)changeDetailsCoalescer addChangeDetails:v4];
  }
  else
  {
    unint64_t v6 = [[PXSectionedChangeDetailsCoalescer alloc] initWithSectionedChangeDetails:v4];
    id v7 = self->_changeDetailsCoalescer;
    self->_changeDetailsCoalescer = v6;
  }
}

- (void)performDataSourceChanges:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, PXSyntheticAssetsDataSourceManager *))a3;
  if (self->_isPerformingDataSourceChanges)
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"PXSyntheticAssetsDataSourceManager.m" lineNumber:50 description:@"Nested changes not supported"];
  }
  unint64_t v6 = [(PXSectionedDataSourceManager *)self dataSource];
  id v7 = [v6 assetsBySection];

  id v8 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
  nextAssetsBySection = self->_nextAssetsBySection;
  self->_nextAssetsBySection = v8;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = self->_nextAssetsBySection;
        uint64_t v16 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * i) mutableCopy];
        [(NSMutableArray *)v15 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v12);
  }

  v17 = [(PXSectionedDataSourceManager *)self dataSource];
  id v18 = [v17 assetCollections];

  uint64_t v19 = (NSMutableArray *)[v18 mutableCopy];
  nextAssetCollections = self->_nextAssetCollections;
  self->_nextAssetCollections = v19;

  self->_isPerformingDataSourceChanges = 1;
  v5[2](v5, self);
  self->_isPerformingDataSourceChanges = 0;
  uint64_t v21 = [[PXSyntheticAssetsDataSource alloc] initWithAssetsBySection:self->_nextAssetsBySection assetCollections:self->_nextAssetCollections];
  v22 = [(PXSectionedDataSourceManager *)self dataSource];
  v23 = +[PXSectionedDataSourceChangeDetails changeDetailsWithNoChangesFromDataSourceIdentifier:toDataSourceIdentifier:](PXSectionedDataSourceChangeDetails, "changeDetailsWithNoChangesFromDataSourceIdentifier:toDataSourceIdentifier:", [v22 identifier], -[PXSectionedDataSource identifier](v21, "identifier"));

  id v24 = v23;
  changeDetailsCoalescer = self->_changeDetailsCoalescer;
  v26 = v24;
  if (changeDetailsCoalescer)
  {
    [(PXSectionedChangeDetailsCoalescer *)changeDetailsCoalescer addChangeDetails:v24];
    v26 = [(PXSectionedChangeDetailsCoalescer *)self->_changeDetailsCoalescer coalescedChangeDetails];
  }
  if (self->_changeIsReload)
  {
    id v27 = [(PXSectionedDataSourceManager *)self dataSource];
    id v38 = v24;
    v28 = v5;
    uint64_t v29 = [v27 identifier];
    v30 = v21;
    uint64_t v31 = [(PXSectionedDataSource *)v21 identifier];
    uint64_t v32 = v29;
    id v5 = v28;
    uint64_t v33 = +[PXSectionedDataSourceChangeDetails changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:v32 toDataSourceIdentifier:v31];

    v26 = (void *)v33;
    id v24 = v38;
  }
  else
  {
    v30 = v21;
  }
  [(PXSectionedDataSourceManager *)self setDataSource:v30 changeDetails:v26];
  v34 = self->_nextAssetsBySection;
  self->_nextAssetsBySection = 0;

  v35 = self->_nextAssetCollections;
  self->_nextAssetCollections = 0;

  v36 = self->_changeDetailsCoalescer;
  self->_changeDetailsCoalescer = 0;

  self->_changeIsReload = 0;
}

- (id)createInitialDataSource
{
  v3 = self->_initialDataSource;
  initialDataSource = self->_initialDataSource;
  self->_initialDataSource = 0;

  return v3;
}

- (PXSyntheticAssetsDataSourceManager)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSyntheticAssetsDataSourceManager.m", 40, @"%s is not available as initializer", "-[PXSyntheticAssetsDataSourceManager init]");

  abort();
}

- (PXSyntheticAssetsDataSourceManager)initWithConfigurationBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSyntheticAssetsDataSourceManager;
  id v5 = [(PXSectionedDataSourceManager *)&v9 init];
  if (v5)
  {
    unint64_t v6 = [[PXSyntheticAssetsDataSource alloc] initWithConfigurationBlock:v4];
    initialDataSource = v5->_initialDataSource;
    v5->_initialDataSource = v6;
  }
  return v5;
}

@end