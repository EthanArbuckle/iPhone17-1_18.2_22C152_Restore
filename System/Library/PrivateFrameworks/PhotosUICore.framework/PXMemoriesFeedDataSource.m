@interface PXMemoriesFeedDataSource
- (NSArray)entries;
- (NSString)diagnosticDescription;
- (PXMemoriesFeedDataSource)init;
- (PXMemoriesFeedDataSource)initWithEntries:(id)a3;
- (PXSimpleIndexPath)_firstSectionIndexPath;
- (PXSimpleIndexPath)indexPathForFirstPastMemorySection;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3 withHintIndexPath:(id)a4;
- (id)inputForItem:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)sectionedObjectReferenceForMemoryUUID:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
- (void)_enumerateItemIndexPathsWithHintIndexPath:(PXSimpleIndexPath *)a3 usingBlock:(id)a4;
- (void)_enumerateSectionIndexPathsStartingAtIndexPath:(PXSimpleIndexPath *)a3 reverseDirection:(BOOL)a4 usingBlock:(id)a5;
- (void)_enumerateSectionIndexPathsWithHintIndexPath:(PXSimpleIndexPath *)a3 usingBlock:(id)a4;
- (void)setIndexPathForFirstPastMemorySection:(PXSimpleIndexPath *)a3;
@end

@implementation PXMemoriesFeedDataSource

- (void).cxx_destruct
{
}

- (void)setIndexPathForFirstPastMemorySection:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_indexPathForFirstPastMemorySection.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_indexPathForFirstPastMemorySection.item = v3;
}

- (NSArray)entries
{
  return self->_entries;
}

- (NSString)diagnosticDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = [(PXMemoriesFeedDataSource *)self description];
  [v3 appendFormat:@"<%@\n", v4];

  entries = self->_entries;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PXMemoriesFeedDataSource_diagnosticDescription__block_invoke_2;
  v9[3] = &unk_1E5DAE058;
  id v10 = v3;
  id v11 = &__block_literal_global_528;
  id v6 = v3;
  [(NSArray *)entries enumerateObjectsUsingBlock:v9];
  [v6 appendString:@">"];
  v7 = (void *)[v6 copy];

  return (NSString *)v7;
}

void __49__PXMemoriesFeedDataSource_diagnosticDescription__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend(v5, "appendFormat:", @"\tSection %lu:\n", a3);
  v7 = [v6 memories];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__PXMemoriesFeedDataSource_diagnosticDescription__block_invoke_3;
  v8[3] = &unk_1E5DAE030;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  [v7 enumerateObjectsUsingBlock:v8];
}

uint64_t __49__PXMemoriesFeedDataSource_diagnosticDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
}

void __49__PXMemoriesFeedDataSource_diagnosticDescription__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  id v12 = [v7 localizedTitle];
  v8 = (*(void (**)(uint64_t, id))(v6 + 16))(v6, v12);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [v7 localizedDateText];

  id v11 = (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  [v5 appendFormat:@"\t\t%lu: %@ %@\n", a3, v8, v11];
}

- (PXSimpleIndexPath)indexPathForFirstPastMemorySection
{
  p_item = &self[3].item;
  if (self[3].item == *(void *)off_1E5DAAED8)
  {
    uint64_t v6 = self;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x4010000000;
    v23 = &unk_1AB5D584F;
    long long v7 = *((_OWORD *)off_1E5DAB028 + 1);
    long long v24 = *(_OWORD *)off_1E5DAB028;
    long long v25 = v7;
    v8 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [(PXSimpleIndexPath *)v6 _firstSectionIndexPath];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__PXMemoriesFeedDataSource_indexPathForFirstPastMemorySection__block_invoke;
    v14[3] = &unk_1E5DB0168;
    v14[4] = v6;
    SEL v18 = a3;
    id v10 = v9;
    id v15 = v10;
    id v11 = v8;
    id v16 = v11;
    v17 = &v20;
    [(PXSimpleIndexPath *)v6 _enumerateSectionIndexPathsWithHintIndexPath:v19 usingBlock:v14];
    long long v12 = *((_OWORD *)v21 + 3);
    *(_OWORD *)p_item = *((_OWORD *)v21 + 2);
    *((_OWORD *)p_item + 1) = v12;

    _Block_object_dispose(&v20, 8);
  }
  long long v13 = *((_OWORD *)p_item + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)p_item;
  *(_OWORD *)&retstr->item = v13;
  return self;
}

void __62__PXMemoriesFeedDataSource_indexPathForFirstPastMemorySection__block_invoke(void *a1, _OWORD *a2, unsigned char *a3)
{
  uint64_t v6 = (void *)a1[4];
  long long v7 = a2[1];
  v15[0] = *a2;
  v15[1] = v7;
  v8 = [v6 objectAtIndexPath:v15];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a1[8], a1[4], @"PXMemoriesFeedDataSource.m", 252, @"Invalid parameter not satisfying: %@", @"[entry isKindOfClass:[PXMemoryEntryInfo class]]" object file lineNumber description];
  }
  uint64_t v9 = (void *)a1[5];
  id v10 = [v8 representativeDate];
  uint64_t v11 = [v9 compareDate:v10 toDate:a1[6] toUnitGranularity:16];

  if (v11 == -1)
  {
    uint64_t v12 = *(void *)(a1[7] + 8);
    long long v13 = a2[1];
    *(_OWORD *)(v12 + 32) = *a2;
    *(_OWORD *)(v12 + 48) = v13;
    *a3 = 1;
  }
}

- (id)inputForItem:(id)a3
{
  return 0;
}

- (id)sectionedObjectReferenceForMemoryUUID:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  SEL v18 = __Block_byref_object_copy__535;
  v19 = __Block_byref_object_dispose__536;
  id v20 = 0;
  uint64_t v5 = [(PXMemoriesFeedDataSource *)self identifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PXMemoriesFeedDataSource_sectionedObjectReferenceForMemoryUUID___block_invoke;
  v12[3] = &unk_1E5DBE1B0;
  v12[4] = self;
  id v6 = v4;
  id v13 = v6;
  v14 = &v15;
  uint64_t v9 = v5;
  long long v10 = xmmword_1AB359AA0;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  [(PXMemoriesFeedDataSource *)self _enumerateSectionIndexPathsStartingAtIndexPath:&v9 reverseDirection:0 usingBlock:v12];
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __66__PXMemoriesFeedDataSource_sectionedObjectReferenceForMemoryUUID___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) numberOfItemsInSection:*(void *)(a2 + 8)];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = [*(id *)(a1 + 32) identifier];
      uint64_t v9 = *(void *)(a2 + 8);
      long long v10 = *(void **)(a1 + 32);
      v18[0] = v8;
      v18[1] = v9;
      v18[2] = i;
      v18[3] = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v11 = [v10 objectReferenceAtIndexPath:v18];
      uint64_t v12 = [v11 itemObject];
      id v13 = [v12 assetCollection];
      v14 = (void *)MEMORY[0x1E4F391D0];
      uint64_t v15 = [v13 localIdentifier];
      id v16 = [v14 uuidFromLocalIdentifier:v15];

      if ([v16 isEqualToString:*(void *)(a1 + 40)])
      {
        *a3 = 1;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v11);
      }
    }
  }
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  long long v4 = *((_OWORD *)off_1E5DAB028 + 1);
  v6[0] = *(_OWORD *)off_1E5DAB028;
  v6[1] = v4;
  return [(PXMemoriesFeedDataSource *)self indexPathForObjectReference:a4 withHintIndexPath:v6];
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3 withHintIndexPath:(id)a4
{
  id v9 = a4;
  uint64_t v11 = *(void *)off_1E5DAAED8;
  if (a5->dataSourceIdentifier != *(void *)off_1E5DAAED8)
  {
    int64_t dataSourceIdentifier = a5->dataSourceIdentifier;
    if (dataSourceIdentifier != [(PXMemoriesFeedDataSource *)self identifier])
    {
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a3, self, @"PXMemoriesFeedDataSource.m", 162, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsNull(hintIndexPath) || (hintIndexPath.dataSourceIdentifier == [self identifier])" object file lineNumber description];
    }
  }
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x4010000000;
  v49 = &unk_1AB5D584F;
  long long v50 = 0u;
  long long v51 = 0u;
  if (v9)
  {
    [v9 indexPath];
    uint64_t v12 = v44;
  }
  else
  {
    uint64_t v12 = 0;
    long long v44 = 0uLL;
    long long v45 = 0uLL;
  }
  if (v12 != [(PXMemoriesFeedDataSource *)self identifier])
  {
    id v13 = v47;
    long long v14 = *((_OWORD *)off_1E5DAB028 + 1);
    *((_OWORD *)v47 + 2) = *(_OWORD *)off_1E5DAB028;
    *((_OWORD *)v13 + 3) = v14;
    long long v40 = 0u;
    long long v41 = 0u;
    if (v9)
    {
      [v9 indexPath];
      uint64_t v15 = v40;
      uint64_t v16 = v41;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v15 = 0;
    }
    if (v15 == v11)
    {
LABEL_44:
      [MEMORY[0x1E4F28B00] currentHandler];
      objc_claimAutoreleasedReturnValue();
      long long v38 = v40;
      long long v39 = v41;
      PXSimpleIndexPathDescription();
    }
    if (*((void *)&v40 + 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_44;
      }
    }
    else if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v19 = a5->dataSourceIdentifier;
      if (a5->dataSourceIdentifier == v11) {
        goto LABEL_25;
      }
      if (a5->section == 0x7FFFFFFFFFFFFFFFLL || a5->item != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a3, self, @"PXMemoriesFeedDataSource.m", 172, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsNull(hintIndexPath) || PXSimpleIndexPathIsSection(hintIndexPath)" object file lineNumber description];

        int64_t v19 = a5->dataSourceIdentifier;
      }
      if (v19 == v11)
      {
LABEL_25:
        [(PXMemoriesFeedDataSource *)self _firstSectionIndexPath];
        long long v21 = v39;
        *(_OWORD *)&a5->int64_t dataSourceIdentifier = v38;
        *(_OWORD *)&a5->item = v21;
        int64_t v19 = a5->dataSourceIdentifier;
      }
      if (v19 == v11) {
        goto LABEL_42;
      }
      uint64_t v22 = [v9 sectionObject];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v35 = [MEMORY[0x1E4F28B00] currentHandler];
        [v35 handleFailureInMethod:a3, self, @"PXMemoriesFeedDataSource.m", 178, @"Invalid parameter not satisfying: %@", @"[e1 isKindOfClass:[PXMemoryEntryInfo class]]" object file lineNumber description];
      }
      v23 = v37;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __74__PXMemoriesFeedDataSource_indexPathForObjectReference_withHintIndexPath___block_invoke;
      v37[3] = &unk_1E5DCF698;
      v37[4] = self;
      v37[7] = a3;
      id v24 = v22;
      v37[5] = v24;
      v37[6] = &v46;
      long long v25 = *(_OWORD *)&a5->item;
      long long v38 = *(_OWORD *)&a5->dataSourceIdentifier;
      long long v39 = v25;
      [(PXMemoriesFeedDataSource *)self _enumerateSectionIndexPathsWithHintIndexPath:&v38 usingBlock:v37];
      goto LABEL_41;
    }
    if (*((void *)&v41 + 1) != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_44;
    }
    int64_t v26 = a5->dataSourceIdentifier;
    if (a5->dataSourceIdentifier == v11) {
      goto LABEL_36;
    }
    if (a5->item == 0x7FFFFFFFFFFFFFFFLL || a5->subitem != 0x7FFFFFFFFFFFFFFFLL)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a3, self, @"PXMemoriesFeedDataSource.m", 189, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsNull(hintIndexPath) || PXSimpleIndexPathIsItem(hintIndexPath)" object file lineNumber description];

      int64_t v26 = a5->dataSourceIdentifier;
    }
    if (v26 == v11)
    {
LABEL_36:
      [(PXMemoriesFeedDataSource *)self firstItemIndexPath];
      long long v28 = v39;
      *(_OWORD *)&a5->int64_t dataSourceIdentifier = v38;
      *(_OWORD *)&a5->item = v28;
      int64_t v26 = a5->dataSourceIdentifier;
    }
    if (v26 == v11)
    {
LABEL_42:
      uint64_t v17 = v47;
      goto LABEL_43;
    }
    v29 = [v9 itemObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:a3, self, @"PXMemoriesFeedDataSource.m", 195, @"Invalid parameter not satisfying: %@", @"[m1 isKindOfClass:[PXMemoryInfo class]]" object file lineNumber description];
    }
    v23 = v36;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __74__PXMemoriesFeedDataSource_indexPathForObjectReference_withHintIndexPath___block_invoke_2;
    v36[3] = &unk_1E5DCF698;
    v36[4] = self;
    v36[7] = a3;
    id v24 = v29;
    v36[5] = v24;
    v36[6] = &v46;
    long long v30 = *(_OWORD *)&a5->item;
    long long v38 = *(_OWORD *)&a5->dataSourceIdentifier;
    long long v39 = v30;
    [(PXMemoriesFeedDataSource *)self _enumerateItemIndexPathsWithHintIndexPath:&v38 usingBlock:v36];
LABEL_41:

    goto LABEL_42;
  }
  if (v9)
  {
    [v9 indexPath];
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
  }
  uint64_t v17 = v47;
  long long v18 = v43;
  *((_OWORD *)v47 + 2) = v42;
  *((_OWORD *)v17 + 3) = v18;
LABEL_43:
  long long v31 = *((_OWORD *)v17 + 3);
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *((_OWORD *)v17 + 2);
  *(_OWORD *)&retstr->item = v31;
  _Block_object_dispose(&v46, 8);

  return result;
}

void __74__PXMemoriesFeedDataSource_indexPathForObjectReference_withHintIndexPath___block_invoke(uint64_t a1, _OWORD *a2, unsigned char *a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  long long v7 = a2[1];
  v12[0] = *a2;
  v12[1] = v7;
  uint64_t v8 = [v6 objectAtIndexPath:v12];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PXMemoriesFeedDataSource.m", 181, @"Invalid parameter not satisfying: %@", @"[e2 isKindOfClass:[PXMemoryEntryInfo class]]" object file lineNumber description];
  }
  if (_isEqualEntries(*(void **)(a1 + 40), v8))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v10 = a2[1];
    *(_OWORD *)(v9 + 32) = *a2;
    *(_OWORD *)(v9 + 48) = v10;
    *a3 = 1;
  }
}

void __74__PXMemoriesFeedDataSource_indexPathForObjectReference_withHintIndexPath___block_invoke_2(uint64_t a1, _OWORD *a2, unsigned char *a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  long long v7 = a2[1];
  v12[0] = *a2;
  v12[1] = v7;
  uint64_t v8 = [v6 objectAtIndexPath:v12];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"PXMemoriesFeedDataSource.m", 198, @"Invalid parameter not satisfying: %@", @"[m2 isKindOfClass:[PXMemoryInfo class]]" object file lineNumber description];
  }
  if (_isEqualMemories(*(void **)(a1 + 40), v8))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v10 = a2[1];
    *(_OWORD *)(v9 + 32) = *a2;
    *(_OWORD *)(v9 + 48) = v10;
    *a3 = 1;
  }
}

- (void)_enumerateItemIndexPathsWithHintIndexPath:(PXSimpleIndexPath *)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v18 = 0;
  int64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  _OWORD v15[2] = __81__PXMemoriesFeedDataSource__enumerateItemIndexPathsWithHintIndexPath_usingBlock___block_invoke;
  v15[3] = &unk_1E5DADFE0;
  id v7 = v6;
  id v16 = v7;
  uint64_t v17 = &v18;
  long long v8 = *(_OWORD *)&a3->item;
  long long v13 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v14 = v8;
  [(PXMemoriesFeedDataSource *)self enumerateItemIndexPathsStartingAtIndexPath:&v13 reverseDirection:0 usingBlock:v15];
  if (!*((unsigned char *)v19 + 24))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__PXMemoriesFeedDataSource__enumerateItemIndexPathsWithHintIndexPath_usingBlock___block_invoke_2;
    v10[3] = &unk_1E5DADFE0;
    id v11 = v7;
    uint64_t v12 = &v18;
    long long v9 = *(_OWORD *)&a3->item;
    long long v13 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v14 = v9;
    [(PXMemoriesFeedDataSource *)self enumerateItemIndexPathsStartingAtIndexPath:&v13 reverseDirection:1 usingBlock:v10];
  }
  _Block_object_dispose(&v18, 8);
}

uint64_t __81__PXMemoriesFeedDataSource__enumerateItemIndexPathsWithHintIndexPath_usingBlock___block_invoke(uint64_t a1, _OWORD *a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8) + 24;
  long long v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  long long v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  uint64_t result = v8(v6, v11, v7, a4);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

uint64_t __81__PXMemoriesFeedDataSource__enumerateItemIndexPathsWithHintIndexPath_usingBlock___block_invoke_2(uint64_t a1, _OWORD *a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8) + 24;
  long long v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  long long v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  uint64_t result = v8(v6, v11, v7, a4);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (void)_enumerateSectionIndexPathsWithHintIndexPath:(PXSimpleIndexPath *)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v18 = 0;
  int64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  _OWORD v15[2] = __84__PXMemoriesFeedDataSource__enumerateSectionIndexPathsWithHintIndexPath_usingBlock___block_invoke;
  v15[3] = &unk_1E5DADFE0;
  id v7 = v6;
  id v16 = v7;
  uint64_t v17 = &v18;
  long long v8 = *(_OWORD *)&a3->item;
  long long v13 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v14 = v8;
  [(PXMemoriesFeedDataSource *)self _enumerateSectionIndexPathsStartingAtIndexPath:&v13 reverseDirection:0 usingBlock:v15];
  if (!*((unsigned char *)v19 + 24))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __84__PXMemoriesFeedDataSource__enumerateSectionIndexPathsWithHintIndexPath_usingBlock___block_invoke_2;
    v10[3] = &unk_1E5DADFE0;
    id v11 = v7;
    uint64_t v12 = &v18;
    long long v9 = *(_OWORD *)&a3->item;
    long long v13 = *(_OWORD *)&a3->dataSourceIdentifier;
    long long v14 = v9;
    [(PXMemoriesFeedDataSource *)self _enumerateSectionIndexPathsStartingAtIndexPath:&v13 reverseDirection:1 usingBlock:v10];
  }
  _Block_object_dispose(&v18, 8);
}

uint64_t __84__PXMemoriesFeedDataSource__enumerateSectionIndexPathsWithHintIndexPath_usingBlock___block_invoke(uint64_t a1, _OWORD *a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8) + 24;
  long long v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  long long v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  uint64_t result = v8(v6, v11, v7, a4);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

uint64_t __84__PXMemoriesFeedDataSource__enumerateSectionIndexPathsWithHintIndexPath_usingBlock___block_invoke_2(uint64_t a1, _OWORD *a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8) + 24;
  long long v8 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v6 + 16);
  long long v9 = a2[1];
  v11[0] = *a2;
  v11[1] = v9;
  uint64_t result = v8(v6, v11, v7, a4);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (void)_enumerateSectionIndexPathsStartingAtIndexPath:(PXSimpleIndexPath *)a3 reverseDirection:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v5 = a4;
  long long v9 = a5;
  if (!v9)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXMemoriesFeedDataSource.m", 85, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXMemoriesFeedDataSource.m", 86, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsSection(startIndexPath)" object file lineNumber description];

    int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  }
  if (dataSourceIdentifier != [(PXMemoriesFeedDataSource *)self identifier])
  {
    char v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXMemoriesFeedDataSource.m", 87, @"%@: indexPath data source identifier:%lu, does not match:%lu and is not valid for use with this data source. Convert it to ensure safe use.", self, a3->dataSourceIdentifier, -[PXMemoriesFeedDataSource identifier](self, "identifier") object file lineNumber description];
  }
  if (v5) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = 1;
  }
  int64_t v14 = [(PXMemoriesFeedDataSource *)self numberOfSections];
  char v25 = 0;
  long long v24 = *(_OWORD *)&a3->item;
  int64_t v16 = a3->dataSourceIdentifier;
  int64_t section = a3->section;
  if ((section & 0x8000000000000000) == 0)
  {
    int64_t v17 = v14;
    do
    {
      if (section >= v17) {
        break;
      }
      if (v25) {
        break;
      }
      uint64_t v18 = (void (*)(void *, void *, char *))v9[2];
      v22[0] = v16;
      v22[1] = section;
      long long v23 = v24;
      v18(v9, v22, &v25);
      section += v13;
    }
    while (section >= 0);
  }
}

- (PXSimpleIndexPath)_firstSectionIndexPath
{
  *(_OWORD *)&retstr->int64_t dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  uint64_t result = [(PXMemoriesFeedDataSource *)self numberOfSections];
  if ((uint64_t)result < 1)
  {
    long long v6 = *((_OWORD *)off_1E5DAB028 + 1);
    *(_OWORD *)&retstr->int64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
    *(_OWORD *)&retstr->item = v6;
  }
  else
  {
    uint64_t result = (PXSimpleIndexPath *)[(PXMemoriesFeedDataSource *)self identifier];
    retstr->int64_t dataSourceIdentifier = (int64_t)result;
    *(_OWORD *)&retstr->int64_t section = xmmword_1AB359AA0;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8)
  {
LABEL_12:
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    PXSimpleIndexPathDescription();
  }
  int64_t item = a3->item;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_12;
    }
  }
  else if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:");
    goto LABEL_9;
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  long long v6 = -[NSArray objectAtIndexedSubscript:](self->_entries, "objectAtIndexedSubscript:");
  uint64_t v7 = [v6 memories];
  BOOL v5 = [v7 objectAtIndexedSubscript:a3->item];

LABEL_9:
  return v5;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  id v3 = [(NSArray *)self->_entries objectAtIndexedSubscript:a3];
  long long v4 = [v3 memories];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSections
{
  return [(NSArray *)self->_entries count];
}

- (PXMemoriesFeedDataSource)init
{
  return [(PXMemoriesFeedDataSource *)self initWithEntries:MEMORY[0x1E4F1CBF0]];
}

- (PXMemoriesFeedDataSource)initWithEntries:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXMemoriesFeedDataSource;
  int64_t v5 = [(PXMemoriesFeedDataSource *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    entries = v5->_entries;
    v5->_entries = (NSArray *)v6;

    long long v8 = *((_OWORD *)off_1E5DAB028 + 1);
    *(_OWORD *)&v5->_indexPathForFirstPastMemorySection.int64_t dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
    *(_OWORD *)&v5->_indexPathForFirstPastMemorySection.int64_t item = v8;
  }

  return v5;
}

@end