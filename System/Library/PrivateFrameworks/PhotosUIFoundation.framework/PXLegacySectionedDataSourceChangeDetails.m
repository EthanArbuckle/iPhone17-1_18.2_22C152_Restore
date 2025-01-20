@interface PXLegacySectionedDataSourceChangeDetails
- (BOOL)hasIncrementalChanges;
- (BOOL)hasMoves;
- (NSArray)changedItemsIndexPaths;
- (NSArray)contentItemsChangedIndexPaths;
- (NSArray)deletedItemsIndexPaths;
- (NSArray)insertedItemsIndexPaths;
- (NSIndexSet)changedSections;
- (NSIndexSet)deletedSections;
- (NSIndexSet)insertedSections;
- (PXLegacySectionedDataSourceChangeDetails)initWithSectionedDataSourceChangeDetails:(id)a3 shiftedSection:(int64_t)a4;
- (PXSectionedDataSourceChangeDetails)sectionedDataSourceChangeDetails;
- (id)contentChangedItemsIndexPaths;
- (id)description;
- (void)_prepareIncrementalDetails;
- (void)enumerateMovedIndexPathsUsingBlock:(id)a3;
- (void)prepareIfNeeded;
@end

@implementation PXLegacySectionedDataSourceChangeDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemsChangedIndexPaths, 0);
  objc_storeStrong((id *)&self->_sectionedDataSourceChangeDetails, 0);
  objc_storeStrong((id *)&self->_contentChangedIndexPaths, 0);
  objc_storeStrong((id *)&self->_changedIndexPaths, 0);
  objc_storeStrong((id *)&self->_insertedIndexPaths, 0);
  objc_storeStrong((id *)&self->_deletedIndexPaths, 0);
  objc_storeStrong((id *)&self->_changedSections, 0);
  objc_storeStrong((id *)&self->_insertedSections, 0);

  objc_storeStrong((id *)&self->_deletedSections, 0);
}

- (NSArray)contentItemsChangedIndexPaths
{
  return self->_contentItemsChangedIndexPaths;
}

- (PXSectionedDataSourceChangeDetails)sectionedDataSourceChangeDetails
{
  return self->_sectionedDataSourceChangeDetails;
}

- (void)enumerateMovedIndexPathsUsingBlock:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PXLegacySectionedDataSourceChangeDetails_enumerateMovedIndexPathsUsingBlock___block_invoke;
  aBlock[3] = &unk_26545BAE8;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v6 = [(PXLegacySectionedDataSourceChangeDetails *)self sectionedDataSourceChangeDetails];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v7 = [v6 sectionsWithItemChanges];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__PXLegacySectionedDataSourceChangeDetails_enumerateMovedIndexPathsUsingBlock___block_invoke_2;
  v11[3] = &unk_26545BB88;
  id v8 = v6;
  id v12 = v8;
  id v9 = v5;
  id v13 = v9;
  id v10 = v4;
  id v14 = v10;
  v15 = v16;
  [v7 enumerateIndexesUsingBlock:v11];

  _Block_object_dispose(v16, 8);
}

uint64_t __79__PXLegacySectionedDataSourceChangeDetails_enumerateMovedIndexPathsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a1 + 32) + 64) + a2;
}

void __79__PXLegacySectionedDataSourceChangeDetails_enumerateMovedIndexPathsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v6 = [*(id *)(a1 + 32) itemChangesInSection:a2];
  if ([v6 hasMoves])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __79__PXLegacySectionedDataSourceChangeDetails_enumerateMovedIndexPathsUsingBlock___block_invoke_3;
    v9[3] = &unk_26545BB60;
    id v10 = *(id *)(a1 + 40);
    uint64_t v13 = a2;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    id v11 = v7;
    uint64_t v12 = v8;
    [v6 enumerateMovedIndexesUsingBlock:v9];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      *a3 = 1;
    }
  }
}

void __79__PXLegacySectionedDataSourceChangeDetails_enumerateMovedIndexPathsUsingBlock___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  objc_msgSend(MEMORY[0x263F088C8], "px_indexPathForItem:inSection:", a2, (*(uint64_t (**)(void))(a1[4] + 16))());
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_msgSend(MEMORY[0x263F088C8], "px_indexPathForItem:inSection:", a3, (*(uint64_t (**)(void))(a1[4] + 16))());
  (*(void (**)(void))(a1[5] + 16))();
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    *a4 = 1;
  }
}

- (void)_prepareIncrementalDetails
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PXLegacySectionedDataSourceChangeDetails__prepareIncrementalDetails__block_invoke;
  aBlock[3] = &unk_26545BAE8;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  id v4 = [(PXLegacySectionedDataSourceChangeDetails *)self sectionedDataSourceChangeDetails];
  v5 = [v4 sectionChanges];
  v6 = [v5 removedIndexes];
  id v7 = [v5 insertedIndexes];
  id v8 = [v5 changedIndexes];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__8196;
  v45 = __Block_byref_object_dispose__8197;
  id v46 = [MEMORY[0x263EFF980] array];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__8196;
  v39 = __Block_byref_object_dispose__8197;
  id v40 = [MEMORY[0x263EFF980] array];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__8196;
  v33 = __Block_byref_object_dispose__8197;
  id v34 = [MEMORY[0x263EFF980] array];
  id v9 = [MEMORY[0x263EFF9C0] set];
  id v10 = [v4 sectionsWithItemChanges];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__PXLegacySectionedDataSourceChangeDetails__prepareIncrementalDetails__block_invoke_2;
  v22[3] = &unk_26545BB38;
  id v11 = v4;
  id v23 = v11;
  v26 = &v41;
  id v12 = v3;
  id v25 = v12;
  v27 = &v35;
  v28 = &v29;
  id v13 = v9;
  id v24 = v13;
  [v10 enumerateIndexesUsingBlock:v22];

  if ([v6 count]) {
    id v14 = v6;
  }
  else {
    id v14 = 0;
  }
  objc_storeStrong((id *)&self->_deletedSections, v14);
  if ([v7 count]) {
    v15 = v7;
  }
  else {
    v15 = 0;
  }
  objc_storeStrong((id *)&self->_insertedSections, v15);
  if ([v8 count]) {
    v16 = v8;
  }
  else {
    v16 = 0;
  }
  objc_storeStrong((id *)&self->_changedSections, v16);
  if ([(id)v42[5] count]) {
    char v17 = (void *)v42[5];
  }
  else {
    char v17 = 0;
  }
  objc_storeStrong((id *)&self->_deletedIndexPaths, v17);
  if ([(id)v36[5] count]) {
    v18 = (void *)v36[5];
  }
  else {
    v18 = 0;
  }
  objc_storeStrong((id *)&self->_insertedIndexPaths, v18);
  if ([(id)v30[5] count]) {
    v19 = (void *)v30[5];
  }
  else {
    v19 = 0;
  }
  objc_storeStrong((id *)&self->_changedIndexPaths, v19);
  if ([v13 count])
  {
    v20 = [v13 allObjects];
    contentItemsChangedIndexPaths = self->_contentItemsChangedIndexPaths;
    self->_contentItemsChangedIndexPaths = v20;
  }
  else
  {
    contentItemsChangedIndexPaths = self->_contentItemsChangedIndexPaths;
    self->_contentItemsChangedIndexPaths = 0;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
}

uint64_t __70__PXLegacySectionedDataSourceChangeDetails__prepareIncrementalDetails__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a1 + 32) + 64) + a2;
}

void __70__PXLegacySectionedDataSourceChangeDetails__prepareIncrementalDetails__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) itemChangesInSection:a2];
  v5 = [v4 removedIndexes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v8 = (void *)MEMORY[0x263F088C8];
    id v9 = [v4 removedIndexes];
    id v10 = objc_msgSend(v8, "px_indexPathsForItems:inSection:", v9, (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))());
    [v7 addObjectsFromArray:v10];
  }
  id v11 = [v4 insertedIndexes];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    id v13 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v14 = (void *)MEMORY[0x263F088C8];
    v15 = [v4 insertedIndexes];
    v16 = objc_msgSend(v14, "px_indexPathsForItems:inSection:", v15, (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))());
    [v13 addObjectsFromArray:v16];
  }
  char v17 = [v4 changedIndexes];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v19 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v20 = (void *)MEMORY[0x263F088C8];
    v21 = [v4 changedIndexes];
    v22 = objc_msgSend(v20, "px_indexPathsForItems:inSection:", v21, (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))());
    [v19 addObjectsFromArray:v22];
  }
  id v23 = [*(id *)(a1 + 32) itemsWithSubitemChangesInSection:a2];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __70__PXLegacySectionedDataSourceChangeDetails__prepareIncrementalDetails__block_invoke_3;
  v24[3] = &unk_26545BB10;
  id v25 = *(id *)(a1 + 32);
  uint64_t v28 = a2;
  id v26 = *(id *)(a1 + 40);
  id v27 = *(id *)(a1 + 48);
  [v23 enumerateIndexesUsingBlock:v24];
}

void __70__PXLegacySectionedDataSourceChangeDetails__prepareIncrementalDetails__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v10 = [*(id *)(a1 + 32) subitemChangesInItem:a2 section:*(void *)(a1 + 56)];
  id v4 = [v10 changedIndexes];
  if ([v4 count]) {
    goto LABEL_4;
  }
  v5 = [v10 insertedIndexes];
  if ([v5 count])
  {

LABEL_4:
LABEL_5:
    uint64_t v6 = *(void **)(a1 + 40);
    id v7 = objc_msgSend(MEMORY[0x263F088C8], "px_indexPathForItem:inSection:", a2, (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))());
    [v6 addObject:v7];

    goto LABEL_6;
  }
  id v8 = [v10 removedIndexes];
  uint64_t v9 = [v8 count];

  if (v9) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)prepareIfNeeded
{
  if (!self->_prepared)
  {
    v3 = self;
    objc_sync_enter(v3);
    if (!self->_prepared)
    {
      id v4 = [(PXLegacySectionedDataSourceChangeDetails *)v3 sectionedDataSourceChangeDetails];
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 1;
      uint64_t v15 = 0;
      v16 = &v15;
      uint64_t v17 = 0x2020000000;
      char v18 = 0;
      v5 = [v4 sectionChanges];
      uint64_t v6 = v5;
      id v7 = v20;
      if (*((unsigned char *)v20 + 24))
      {
        char v8 = [v5 hasIncrementalChanges];
        id v7 = v20;
      }
      else
      {
        char v8 = 0;
      }
      *((unsigned char *)v7 + 24) = v8;
      uint64_t v9 = [v4 sectionsWithItemChanges];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __59__PXLegacySectionedDataSourceChangeDetails_prepareIfNeeded__block_invoke;
      v11[3] = &unk_26545BAC0;
      id v10 = v4;
      id v12 = v10;
      id v13 = &v19;
      id v14 = &v15;
      [v9 enumerateIndexesUsingBlock:v11];

      if (*((unsigned char *)v20 + 24))
      {
        v3->_hasIncrementalChanges = 1;
        v3->_hasMoves = *((unsigned char *)v16 + 24);
        [(PXLegacySectionedDataSourceChangeDetails *)v3 _prepareIncrementalDetails];
      }
      if (!v3->_hasIncrementalChanges) {
        *((unsigned char *)v16 + 24) = 0;
      }
      self->_prepared = 1;

      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v19, 8);
    }
    objc_sync_exit(v3);
  }
}

void __59__PXLegacySectionedDataSourceChangeDetails_prepareIfNeeded__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v5 = [*(id *)(a1 + 32) itemChangesInSection:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = v5;
  if (*(unsigned char *)(v6 + 24))
  {
    char v7 = [v5 hasIncrementalChanges];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    char v7 = 0;
  }
  *(unsigned char *)(v6 + 24) = v7;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    char v9 = 1;
  }
  else
  {
    char v9 = [v10 hasMoves];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(unsigned char *)(v8 + 24) = v9;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
}

- (id)description
{
  v24.receiver = self;
  v24.super_class = (Class)PXLegacySectionedDataSourceChangeDetails;
  id v23 = [(PXLegacySectionedDataSourceChangeDetails *)&v24 description];
  uint64_t v21 = NSString;
  BOOL v3 = [(PXLegacySectionedDataSourceChangeDetails *)self hasIncrementalChanges];
  id v4 = @"NO";
  if (v3) {
    id v4 = @"YES";
  }
  v20 = v4;
  char v22 = [(PXLegacySectionedDataSourceChangeDetails *)self deletedSections];
  uint64_t v19 = [v22 count];
  v5 = [(PXLegacySectionedDataSourceChangeDetails *)self insertedSections];
  uint64_t v18 = [v5 count];
  uint64_t v6 = [(PXLegacySectionedDataSourceChangeDetails *)self changedSections];
  uint64_t v7 = [v6 count];
  uint64_t v8 = [(PXLegacySectionedDataSourceChangeDetails *)self deletedItemsIndexPaths];
  uint64_t v9 = [v8 count];
  id v10 = [(PXLegacySectionedDataSourceChangeDetails *)self insertedItemsIndexPaths];
  uint64_t v11 = [v10 count];
  id v12 = [(PXLegacySectionedDataSourceChangeDetails *)self changedItemsIndexPaths];
  uint64_t v13 = [v12 count];
  id v14 = [(PXLegacySectionedDataSourceChangeDetails *)self contentItemsChangedIndexPaths];
  uint64_t v15 = [v21 stringWithFormat:@" hasIncremental:%@ sections:(%lu,%lu,%lu) indexPaths:(%lu,%lu,%lu,%lu) (del,ins,change,contentChange)", v20, v19, v18, v7, v9, v11, v13, objc_msgSend(v14, "count")];

  v16 = [v23 stringByAppendingString:v15];

  return v16;
}

- (id)contentChangedItemsIndexPaths
{
  [(PXLegacySectionedDataSourceChangeDetails *)self prepareIfNeeded];
  contentItemsChangedIndexPaths = self->_contentItemsChangedIndexPaths;

  return contentItemsChangedIndexPaths;
}

- (NSArray)changedItemsIndexPaths
{
  [(PXLegacySectionedDataSourceChangeDetails *)self prepareIfNeeded];
  changedIndexPaths = self->_changedIndexPaths;

  return changedIndexPaths;
}

- (NSArray)insertedItemsIndexPaths
{
  [(PXLegacySectionedDataSourceChangeDetails *)self prepareIfNeeded];
  insertedIndexPaths = self->_insertedIndexPaths;

  return insertedIndexPaths;
}

- (NSArray)deletedItemsIndexPaths
{
  [(PXLegacySectionedDataSourceChangeDetails *)self prepareIfNeeded];
  deletedIndexPaths = self->_deletedIndexPaths;

  return deletedIndexPaths;
}

- (NSIndexSet)changedSections
{
  [(PXLegacySectionedDataSourceChangeDetails *)self prepareIfNeeded];
  changedSections = self->_changedSections;

  return changedSections;
}

- (NSIndexSet)insertedSections
{
  [(PXLegacySectionedDataSourceChangeDetails *)self prepareIfNeeded];
  insertedSections = self->_insertedSections;

  return insertedSections;
}

- (NSIndexSet)deletedSections
{
  [(PXLegacySectionedDataSourceChangeDetails *)self prepareIfNeeded];
  deletedSections = self->_deletedSections;

  return deletedSections;
}

- (BOOL)hasMoves
{
  return self->_hasMoves;
}

- (BOOL)hasIncrementalChanges
{
  return self->_hasIncrementalChanges;
}

- (PXLegacySectionedDataSourceChangeDetails)initWithSectionedDataSourceChangeDetails:(id)a3 shiftedSection:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXLegacySectionedDataSourceChangeDetails;
  uint64_t v8 = [(PXLegacySectionedDataSourceChangeDetails *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sectionedDataSourceChangeDetails, a3);
    v9->_shiftingSectionLocation = a4;
  }

  return v9;
}

@end