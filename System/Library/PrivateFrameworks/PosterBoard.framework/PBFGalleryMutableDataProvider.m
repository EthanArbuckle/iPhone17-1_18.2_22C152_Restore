@interface PBFGalleryMutableDataProvider
- (BOOL)_isSectionIdentifierValid:(id)a3;
- (BOOL)_isSectionTypeValid:(int64_t)a3;
- (BOOL)_isValidItem:(id)a3 withinSectionIdentifier:(id)a4;
- (void)addSectionWithIdentifier:(id)a3 localizedTitle:(id)a4 type:(int64_t)a5 items:(id)a6;
- (void)addToSection:(id)a3 item:(id)a4;
- (void)configureForGallery:(id)a3;
- (void)executeBulkUpdate:(id)a3;
- (void)insertSectionWithIdentifier:(id)a3 toIndex:(unint64_t)a4 localizedTitle:(id)a5 localizedSubtitle:(id)a6 type:(int64_t)a7 items:(id)a8;
- (void)removeFromSection:(id)a3 item:(id)a4;
- (void)removeSectionWithIdentifier:(id)a3;
- (void)setItems:(id)a3 forSectionIdentifier:(id)a4;
- (void)sortItemsWithinSectionAtIdentifier:(id)a3 comparator:(id)a4;
- (void)sortSectionsWithComparator:(id)a3;
@end

@implementation PBFGalleryMutableDataProvider

- (void)addSectionWithIdentifier:(id)a3 localizedTitle:(id)a4 type:(int64_t)a5 items:(id)a6
{
}

- (void)insertSectionWithIdentifier:(id)a3 toIndex:(unint64_t)a4 localizedTitle:(id)a5 localizedSubtitle:(id)a6 type:(int64_t)a7 items:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (!v15)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PBFPosterGalleryDataProvider.m", 480, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];
  }
  if (![(PBFGalleryMutableDataProvider *)self _isSectionTypeValid:a7])
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PBFPosterGalleryDataProvider.m", 481, @"Invalid parameter not satisfying: %@", @"[self _isSectionTypeValid:sectionType]" object file lineNumber description];
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __113__PBFGalleryMutableDataProvider_insertSectionWithIdentifier_toIndex_localizedTitle_localizedSubtitle_type_items___block_invoke;
  v25[3] = &unk_1E6984460;
  unint64_t v30 = a4;
  int64_t v31 = a7;
  id v26 = v15;
  id v27 = v16;
  id v28 = v17;
  id v29 = v18;
  id v19 = v18;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  [(PBFGalleryMutableDataProvider *)self executeBulkUpdate:v25];
}

void __113__PBFGalleryMutableDataProvider_insertSectionWithIdentifier_toIndex_localizedTitle_localizedSubtitle_type_items___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[8];
  id v15 = v3;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [v3 orderedSectionIdentifiers];
    uint64_t v4 = [v5 count];

    id v3 = v15;
  }
  v6 = [v3 orderedSectionIdentifiers];
  [v6 insertObject:a1[4] atIndex:v4];

  v7 = [v15 sectionIdentifierToSectionType];
  v8 = [NSNumber numberWithInteger:a1[9]];
  [v7 setObject:v8 forKey:a1[4]];

  uint64_t v9 = a1[5];
  v10 = [v15 sectionIdentifierToLocalizedTitle];
  v11 = v10;
  if (v9) {
    [v10 setObject:a1[5] forKey:a1[4]];
  }
  else {
    [v10 removeObjectForKey:a1[4]];
  }

  uint64_t v12 = a1[6];
  v13 = [v15 sectionIdentifierToLocalizedSubtitle];
  v14 = v13;
  if (v12) {
    [v13 setObject:a1[6] forKey:a1[4]];
  }
  else {
    [v13 removeObjectForKey:a1[4]];
  }

  [v15 setItems:a1[7] forSectionIdentifier:a1[4]];
  [v15 _markChangeDidOccur];
}

- (void)setItems:(id)a3 forSectionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![(PBFGalleryMutableDataProvider *)self _isSectionIdentifierValid:v8])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PBFPosterGalleryDataProvider.m", 507, @"Invalid parameter not satisfying: %@", @"[self _isSectionIdentifierValid:sectionIdentifier]" object file lineNumber description];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PBFGalleryMutableDataProvider_setItems_forSectionIdentifier___block_invoke;
  v12[3] = &unk_1E69844B0;
  id v13 = v8;
  id v14 = v7;
  id v9 = v7;
  id v10 = v8;
  [(PBFGalleryMutableDataProvider *)self executeBulkUpdate:v12];
}

void __63__PBFGalleryMutableDataProvider_setItems_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [v3 sectionIdentifierToItems];
  v5 = [v4 objectForKey:*(void *)(a1 + 32)];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        v11 = [v3 posterPreviewForPosterUniqueIdentifier];
        uint64_t v12 = [v10 previewUniqueIdentifier];
        [v11 removeObjectForKey:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = [v3 sectionIdentifierToItems];
  id v15 = v14;
  if (v13)
  {
    id v16 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [v15 setObject:v16 forKey:*(void *)(a1 + 32)];
  }
  else
  {
    [v14 removeObjectForKey:*(void *)(a1 + 32)];
  }

  id v17 = *(void **)(a1 + 40);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__PBFGalleryMutableDataProvider_setItems_forSectionIdentifier___block_invoke_2;
  v19[3] = &unk_1E6984488;
  id v20 = v3;
  id v18 = v3;
  [v17 enumerateObjectsUsingBlock:v19];
  [v18 _markChangeDidOccur];
}

void __63__PBFGalleryMutableDataProvider_setItems_forSectionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 posterPreviewForPosterUniqueIdentifier];
  uint64_t v4 = [v3 previewUniqueIdentifier];
  [v5 setObject:v3 forKey:v4];
}

- (void)addToSection:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(PBFGalleryMutableDataProvider *)self _isSectionIdentifierValid:v7])
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PBFPosterGalleryDataProvider.m", 529, @"Invalid parameter not satisfying: %@", @"[self _isSectionIdentifierValid:sectionIdentifier]" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"PBFPosterGalleryDataProvider.m", 530, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];

LABEL_3:
  if (![(PBFGalleryMutableDataProvider *)self _isValidItem:v8 withinSectionIdentifier:v7])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__PBFGalleryMutableDataProvider_addToSection_item___block_invoke;
    v11[3] = &unk_1E69844B0;
    id v12 = v7;
    id v13 = v8;
    [(PBFGalleryMutableDataProvider *)self executeBulkUpdate:v11];
  }
}

void __51__PBFGalleryMutableDataProvider_addToSection_item___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 sectionIdentifierToItems];
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 32)];

  if (!v4)
  {
    uint64_t v4 = objc_opt_new();
    id v5 = [v9 sectionIdentifierToItems];
    [v5 setObject:v4 forKey:*(void *)(a1 + 32)];
  }
  [v4 addObject:*(void *)(a1 + 40)];
  uint64_t v6 = [v9 posterPreviewForPosterUniqueIdentifier];
  id v7 = *(void **)(a1 + 40);
  id v8 = [v7 previewUniqueIdentifier];
  [v6 setObject:v7 forKey:v8];

  [v9 _markChangeDidOccur];
}

- (void)removeSectionWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([(PBFGalleryMutableDataProvider *)self _isSectionIdentifierValid:v4])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__PBFGalleryMutableDataProvider_removeSectionWithIdentifier___block_invoke;
    v5[3] = &unk_1E69844B0;
    v5[4] = self;
    id v6 = v4;
    [(PBFGalleryMutableDataProvider *)self executeBulkUpdate:v5];
  }
}

void __61__PBFGalleryMutableDataProvider_removeSectionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) itemsForSectionWithIdentifier:*(void *)(a1 + 40)];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PBFGalleryMutableDataProvider_removeSectionWithIdentifier___block_invoke_2;
  v11[3] = &unk_1E6984488;
  id v12 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v11];
  id v6 = [v5 orderedSectionIdentifiers];
  [v6 removeObject:*(void *)(a1 + 40)];

  id v7 = [v5 sectionIdentifierToItems];
  [v7 removeObjectForKey:*(void *)(a1 + 40)];

  id v8 = [v5 sectionIdentifierToSectionType];
  [v8 removeObjectForKey:*(void *)(a1 + 40)];

  id v9 = [v5 sectionIdentifierToLocalizedTitle];
  [v9 removeObjectForKey:*(void *)(a1 + 40)];

  id v10 = [v5 sectionIdentifierToLocalizedSubtitle];
  [v10 removeObjectForKey:*(void *)(a1 + 40)];

  [v5 _markChangeDidOccur];
}

void __61__PBFGalleryMutableDataProvider_removeSectionWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 posterPreviewForPosterUniqueIdentifier];
  id v4 = [v3 previewUniqueIdentifier];

  [v5 removeObjectForKey:v4];
}

- (void)removeFromSection:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PBFPosterGalleryDataProvider.m", 572, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"PBFPosterGalleryDataProvider.m", 573, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];

LABEL_3:
  if ([(PBFGalleryMutableDataProvider *)self _isValidItem:v9 withinSectionIdentifier:v7])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__PBFGalleryMutableDataProvider_removeFromSection_item___block_invoke;
    v12[3] = &unk_1E69844B0;
    id v13 = v9;
    id v14 = v7;
    [(PBFGalleryMutableDataProvider *)self executeBulkUpdate:v12];
  }
}

void __56__PBFGalleryMutableDataProvider_removeFromSection_item___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 _markChangeDidOccur];
  id v4 = [v3 posterPreviewForPosterUniqueIdentifier];
  id v5 = [*(id *)(a1 + 32) previewUniqueIdentifier];
  [v4 removeObjectForKey:v5];

  id v6 = [v3 sectionIdentifierToItems];

  id v7 = [v6 objectForKey:*(void *)(a1 + 40)];

  [v7 removeObject:*(void *)(a1 + 32)];
}

- (void)sortSectionsWithComparator:(id)a3
{
  id v4 = a3;
  id v5 = [(PBFPosterGalleryDataProvider *)self orderedSectionIdentifiers];
  id v6 = (void *)[v5 mutableCopy];
  [v5 sortUsingComparator:v4];

  if (([v6 isEqual:v5] & 1) == 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__PBFGalleryMutableDataProvider_sortSectionsWithComparator___block_invoke;
    v7[3] = &unk_1E69844D8;
    id v8 = v6;
    [(PBFGalleryMutableDataProvider *)self executeBulkUpdate:v7];
  }
}

void __60__PBFGalleryMutableDataProvider_sortSectionsWithComparator___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 orderedSectionIdentifiers];
  [v3 removeAllObjects];

  id v4 = [v6 orderedSectionIdentifiers];
  id v5 = [*(id *)(a1 + 32) array];
  [v4 addObjectsFromArray:v5];

  [v6 _markChangeDidOccur];
}

- (void)sortItemsWithinSectionAtIdentifier:(id)a3 comparator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PBFPosterGalleryDataProvider.m", 607, @"Invalid parameter not satisfying: %@", @"sectionIdentifier" object file lineNumber description];
  }
  id v9 = [(PBFPosterGalleryDataProvider *)self itemsForSectionWithIdentifier:v7];
  id v10 = (void *)[v9 mutableCopy];
  [v10 sortUsingComparator:v8];
  if (([v10 isEqual:v9] & 1) == 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__PBFGalleryMutableDataProvider_sortItemsWithinSectionAtIdentifier_comparator___block_invoke;
    v12[3] = &unk_1E6984500;
    id v13 = v10;
    id v14 = v7;
    id v15 = self;
    [(PBFGalleryMutableDataProvider *)self executeBulkUpdate:v12];
  }
}

uint64_t __79__PBFGalleryMutableDataProvider_sortItemsWithinSectionAtIdentifier_comparator___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 sectionIdentifierToItems];
  [v3 setObject:a1[4] forKey:a1[5]];

  id v4 = (void *)a1[6];
  return [v4 _markChangeDidOccur];
}

- (void)executeBulkUpdate:(id)a3
{
  id v6 = (void (**)(id, PBFGalleryMutableDataProvider *))a3;
  if (!v6)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PBFPosterGalleryDataProvider.m", 623, @"Invalid parameter not satisfying: %@", @"bulkUpdateHandler" object file lineNumber description];
  }
  [(PBFPosterGalleryDataProvider *)self _incrementTransactionCount:1];
  v6[2](v6, self);
  [(PBFPosterGalleryDataProvider *)self _decrementTransactionCount:1];
}

- (void)configureForGallery:(id)a3
{
  id v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__15;
  v18[4] = __Block_byref_object_dispose__15;
  id v5 = [(PBFPosterGalleryDataProvider *)self sectionIdentifiers];
  id v19 = [v5 array];

  id v6 = [v4 sectionIdentifiers];
  id v7 = [v6 array];

  id v8 = [v4 snapshotProvider];
  [(PBFPosterGalleryDataProvider *)self setSnapshotProvider:v8];
  id v9 = [v4 complicationSnapshotProvider];
  [(PBFPosterGalleryDataProvider *)self setComplicationSnapshotProvider:v9];
  id v10 = [v4 extensionProvider];
  [(PBFPosterGalleryDataProvider *)self setExtensionProvider:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__PBFGalleryMutableDataProvider_configureForGallery___block_invoke;
  v13[3] = &unk_1E6984528;
  id v11 = v7;
  id v14 = v11;
  id v17 = v18;
  id v12 = v4;
  id v15 = v12;
  id v16 = self;
  [(PBFGalleryMutableDataProvider *)self executeBulkUpdate:v13];

  _Block_object_dispose(v18, 8);
}

void __53__PBFGalleryMutableDataProvider_configureForGallery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) differenceFromArray:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v5 = [v4 removals];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v47 + 1) + 8 * i) object];
        [v3 removeSectionWithIdentifier:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v7);
  }
  v38 = v3;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v36 = v4;
  obuint64_t j = [v4 insertions];
  uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        id v16 = [v15 object];
        id v17 = [*(id *)(a1 + 40) sectionForSectionIdentifier:v16];
        id v18 = [*(id *)(a1 + 40) itemsForSectionWithIdentifier:v16];
        uint64_t v19 = [v15 index];
        id v20 = [v17 localizedTitle];
        long long v21 = [v17 localizedSubtitle];
        unint64_t v22 = [v17 type] - 1;
        if (v22 > 2) {
          uint64_t v23 = 1;
        }
        else {
          uint64_t v23 = qword_1D337EB90[v22];
        }
        [v38 insertSectionWithIdentifier:v16 toIndex:v19 localizedTitle:v20 localizedSubtitle:v21 type:v23 items:v18];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v12);
  }

  long long v24 = [*(id *)(a1 + 48) sectionIdentifiers];
  uint64_t v25 = [v24 array];
  uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
  id v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v25;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v28 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v39 + 1) + 8 * k);
        v34 = [*(id *)(a1 + 48) itemsForSectionWithIdentifier:v33];
        v35 = [*(id *)(a1 + 40) itemsForSectionWithIdentifier:v33];
        if (([v34 isEqual:v35] & 1) == 0) {
          [v38 setItems:v35 forSectionIdentifier:v33];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v30);
  }
}

- (BOOL)_isSectionIdentifierValid:(id)a3
{
  id v4 = a3;
  id v5 = [(PBFPosterGalleryDataProvider *)self orderedSectionIdentifiers];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)_isValidItem:(id)a3 withinSectionIdentifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(PBFPosterGalleryDataProvider *)self itemsForSectionWithIdentifier:a4];
  LOBYTE(self) = [v7 containsObject:v6];

  return (char)self;
}

- (BOOL)_isSectionTypeValid:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

@end