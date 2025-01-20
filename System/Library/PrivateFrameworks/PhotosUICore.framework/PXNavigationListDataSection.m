@interface PXNavigationListDataSection
- (NSArray)sectionRangeMap;
- (NSDictionary)childDataSections;
- (NSDictionary)childIndexHints;
- (PXCollectionsDataSection)collectionsDataSection;
- (PXNavigationListDataSection)initWithCollectionsDataSection:(id)a3;
- (PXNavigationListDataSection)initWithCollectionsDataSection:(id)a3 indentationLevel:(int64_t)a4 childDataSections:(id)a5 childIndexHints:(id)a6 skipAssetCountFetches:(BOOL)a7;
- (PXNavigationListDataSection)initWithOutlineObject:(id)a3;
- (id)content;
- (id)debugDescription;
- (id)existingFetchResultForListItem:(id)a3;
- (id)objectAtIndex:(int64_t)a3;
- (id)parentOfListItemAtIndex:(int64_t)a3 localIndex:(int64_t *)a4;
- (int64_t)count;
- (int64_t)indentationLevel;
- (int64_t)indexForListItem:(id)a3;
- (int64_t)indexInCollectionsDataSectionOfListItem:(id)a3 hintIndex:(int64_t)a4;
- (int64_t)validatedIndexOfListItem:(id)a3 hintIndex:(int64_t)a4;
- (unint64_t)_dataSubsectionIndexForListItemAtIndex:(int64_t)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_createDataSubsectionsIfNecessary;
@end

@implementation PXNavigationListDataSection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionRangeMap, 0);
  objc_storeStrong((id *)&self->_collectionsDataSection, 0);
  objc_storeStrong((id *)&self->_childIndexHints, 0);
  objc_storeStrong((id *)&self->_childDataSections, 0);
  objc_storeStrong((id *)&self->_countNumber, 0);
  objc_storeStrong((id *)&self->_dataSubsections, 0);
  objc_storeStrong((id *)&self->_dataSubsectionIndexes, 0);
}

- (NSArray)sectionRangeMap
{
  return self->_sectionRangeMap;
}

- (PXCollectionsDataSection)collectionsDataSection
{
  return self->_collectionsDataSection;
}

- (NSDictionary)childIndexHints
{
  return self->_childIndexHints;
}

- (NSDictionary)childDataSections
{
  return self->_childDataSections;
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (id)debugDescription
{
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", CFSTR("<%@: %p; identifier = %ld, numberOfListItems = %ld, listItems = ("),
    objc_opt_class(),
    self,
    [(PXDataSection *)self identifier],
  v3 = [(PXNavigationListDataSection *)self count]);
  if ([(PXNavigationListDataSection *)self count] >= 1)
  {
    int64_t v4 = 0;
    do
    {
      v5 = [(PXNavigationListDataSection *)self objectAtIndex:v4];
      v6 = [v5 visualDescription];
      [v3 appendFormat:@"\n\t[%ld]%@", v4, v6];

      ++v4;
    }
    while (v4 < [(PXNavigationListDataSection *)self count]);
  }
  [v3 appendString:@"\n>"]);
  return v3;
}

- (id)parentOfListItemAtIndex:(int64_t)a3 localIndex:(int64_t *)a4
{
  unint64_t v7 = -[PXNavigationListDataSection _dataSubsectionIndexForListItemAtIndex:](self, "_dataSubsectionIndexForListItemAtIndex:");
  if (v7)
  {
    v9 = [(NSArray *)self->_dataSubsections objectAtIndex:v7];
    v10 = [(NSArray *)self->_dataSubsections objectAtIndex:v7 - 1];
    uint64_t v11 = [v9 externalStartIndex];
    v8 = [v10 listItemAtExternalIndex:v11 - 1];
    if (a4) {
      *a4 = a3 - v11;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (int64_t)indexInCollectionsDataSectionOfListItem:(id)a3 hintIndex:(int64_t)a4
{
  int64_t v5 = [(PXNavigationListDataSection *)self validatedIndexOfListItem:a3 hintIndex:a4];
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v7 = v5;
    if (([(PXNavigationListDataSection *)self _dataSubsectionIndexForListItemAtIndex:v5] & 1) == 0)
    {
      v8 = -[NSArray objectAtIndex:](self->_dataSubsections, "objectAtIndex:");
      uint64_t v9 = [v8 indexDelta] + v7;
      int64_t v6 = v9 - [v8 externalStartIndex];
    }
  }
  return v6;
}

- (int64_t)validatedIndexOfListItem:(id)a3 hintIndex:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL
    || ([(PXNavigationListDataSection *)self objectAtIndex:a4],
        int64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqual:v6],
        v7,
        (v8 & 1) == 0))
  {
    a4 = [(PXNavigationListDataSection *)self indexForListItem:v6];
  }

  return a4;
}

- (int64_t)indexForListItem:(id)a3
{
  id v4 = a3;
  if (v4 && [(PXNavigationListDataSection *)self count] >= 1)
  {
    int64_t v5 = 0;
    while (1)
    {
      id v6 = [(PXNavigationListDataSection *)self objectAtIndex:v5];
      char v7 = [v4 isEqual:v6];

      if (v7) {
        break;
      }
      if (++v5 >= [(PXNavigationListDataSection *)self count]) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v10 = [(PXNavigationListDataSection *)self childDataSections];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXNavigationListDataSection.m" lineNumber:240 description:@"This code path is not implemented."];

    abort();
  }
  v12 = [(PXNavigationListDataSection *)self collectionsDataSection];
  unint64_t v13 = [v12 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v13;
}

- (id)objectAtIndex:(int64_t)a3
{
  id v4 = -[NSArray objectAtIndex:](self->_dataSubsections, "objectAtIndex:", -[PXNavigationListDataSection _dataSubsectionIndexForListItemAtIndex:](self, "_dataSubsectionIndexForListItemAtIndex:"));
  int64_t v5 = [v4 listItemAtExternalIndex:a3];

  return v5;
}

- (int64_t)count
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  countNumber = self->_countNumber;
  if (!countNumber)
  {
    id v4 = [(PXNavigationListDataSection *)self collectionsDataSection];
    uint64_t v5 = [v4 count];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(PXNavigationListDataSection *)self childDataSections];
    char v7 = [v6 allValues];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v5 += [*(id *)(*((void *)&v15 + 1) + 8 * v11++) count];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    v12 = [NSNumber numberWithInteger:v5];
    unint64_t v13 = self->_countNumber;
    self->_countNumber = v12;

    countNumber = self->_countNumber;
  }
  return [(NSNumber *)countNumber integerValue];
}

- (id)content
{
  v2 = [(PXNavigationListDataSection *)self collectionsDataSection];
  v3 = [v2 content];

  return v3;
}

- (unint64_t)_dataSubsectionIndexForListItemAtIndex:(int64_t)a3
{
  return -[NSIndexSet countOfIndexesInRange:](self->_dataSubsectionIndexes, "countOfIndexesInRange:", 0, a3 + 1) - 1;
}

- (id)existingFetchResultForListItem:(id)a3
{
  int64_t v4 = [(PXNavigationListDataSection *)self indexForListItem:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    int64_t v6 = v4;
    char v7 = [(PXNavigationListDataSection *)self collectionsDataSection];
    uint64_t v5 = [v7 existingAssetsFetchResultAtIndex:v6];
  }
  return v5;
}

- (void)_createDataSubsectionsIfNecessary
{
  if (!self->_dataSubsectionIndexes)
  {
    int64_t v4 = objc_opt_new();
    uint64_t v5 = objc_opt_new();
    int64_t v6 = [(PXNavigationListDataSection *)self childIndexHints];
    char v7 = [(PXNavigationListDataSection *)self collectionsDataSection];
    uint64_t v8 = [(PXNavigationListDataSection *)self childDataSections];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __64__PXNavigationListDataSection__createDataSubsectionsIfNecessary__block_invoke;
    v34[3] = &unk_1E5DCF8B0;
    id v25 = v6;
    id v35 = v25;
    id v9 = v7;
    id v36 = v9;
    id v10 = v5;
    id v37 = v10;
    id v11 = v4;
    v39 = self;
    SEL v40 = a2;
    id v38 = v11;
    [v8 enumerateKeysAndObjectsUsingBlock:v34];

    v12 = objc_opt_new();
    unint64_t v13 = objc_opt_new();
    v14 = [PXNavigationListDataSubsection alloc];
    long long v15 = [(PXNavigationListDataSection *)self collectionsDataSection];
    long long v16 = -[PXNavigationListDataSubsection initWithDataSection:indexDelta:expandedIndex:indentationLevel:externalStartIndex:skipAssetCountFetches:](v14, "initWithDataSection:indexDelta:expandedIndex:indentationLevel:externalStartIndex:skipAssetCountFetches:", v15, 0, [v10 firstIndex], -[PXNavigationListDataSection indentationLevel](self, "indentationLevel"), 0, self->_skipAssetCountFetches);
    [v12 addObject:v16];

    [v13 addIndex:0];
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __64__PXNavigationListDataSection__createDataSubsectionsIfNecessary__block_invoke_2;
    v26[3] = &unk_1E5DCF8D8;
    id v17 = v11;
    id v27 = v17;
    v32 = v33;
    long long v18 = v12;
    v28 = v18;
    v29 = self;
    v19 = v13;
    v30 = v19;
    id v20 = v10;
    id v31 = v20;
    [v20 enumerateIndexesUsingBlock:v26];
    dataSubsectionIndexes = self->_dataSubsectionIndexes;
    self->_dataSubsectionIndexes = v19;
    v22 = v19;

    dataSubsections = self->_dataSubsections;
    self->_dataSubsections = v18;
    v24 = v18;

    _Block_object_dispose(v33, 8);
  }
}

void __64__PXNavigationListDataSection__createDataSubsectionsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  int64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v16];
  char v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 integerValue];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = v8;
      if (v8 < [*(id *)(a1 + 40) count])
      {
        id v10 = [*(id *)(a1 + 40) objectAtIndex:v9];
        char v11 = [v10 isEqual:v16];

        if (v11) {
          goto LABEL_6;
        }
      }
    }
  }
  v12 = *(void **)(a1 + 40);
  unint64_t v13 = [v16 collection];
  uint64_t v9 = [v12 indexOfCollection:v13];

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    [*(id *)(a1 + 48) addIndex:v9];
    v14 = *(void **)(a1 + 56);
    long long v15 = [NSNumber numberWithInteger:v9];
    [v14 setObject:v5 forKey:v15];
  }
}

void __64__PXNavigationListDataSection__createDataSubsectionsIfNecessary__block_invoke_2(uint64_t a1, uint64_t a2)
{
  int64_t v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v16 = [v4 objectForKey:v5];

  uint64_t v6 = a2 + 1;
  uint64_t v7 = a2 + 1 + *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = -[PXNavigationListDataSubsection initWithDataSection:indexDelta:expandedIndex:indentationLevel:externalStartIndex:skipAssetCountFetches:]([PXNavigationListDataSubsection alloc], "initWithDataSection:indexDelta:expandedIndex:indentationLevel:externalStartIndex:skipAssetCountFetches:", v16, 0, 0x7FFFFFFFFFFFFFFFLL, [v16 indentationLevel], v7, *(unsigned __int8 *)(*(void *)(a1 + 48) + 56));
  [v8 addObject:v9];

  [*(id *)(a1 + 56) addIndex:v7];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += [v16 count];
  uint64_t v10 = [*(id *)(a1 + 64) indexGreaterThanIndex:a2];
  uint64_t v11 = v6 + *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  v12 = *(void **)(a1 + 40);
  unint64_t v13 = [PXNavigationListDataSubsection alloc];
  v14 = [*(id *)(a1 + 48) collectionsDataSection];
  long long v15 = -[PXNavigationListDataSubsection initWithDataSection:indexDelta:expandedIndex:indentationLevel:externalStartIndex:skipAssetCountFetches:](v13, "initWithDataSection:indexDelta:expandedIndex:indentationLevel:externalStartIndex:skipAssetCountFetches:", v14, v6, v10, [*(id *)(a1 + 48) indentationLevel], v11, *(unsigned __int8 *)(*(void *)(a1 + 48) + 56));
  [v12 addObject:v15];

  [*(id *)(a1 + 56) addIndex:v11];
}

- (PXNavigationListDataSection)initWithOutlineObject:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXNavigationListDataSection.m", 134, @"%s is not available as initializer", "-[PXNavigationListDataSection initWithOutlineObject:]");

  abort();
}

- (PXNavigationListDataSection)initWithCollectionsDataSection:(id)a3
{
  return [(PXNavigationListDataSection *)self initWithCollectionsDataSection:a3 indentationLevel:0 childDataSections:0 childIndexHints:0 skipAssetCountFetches:0];
}

- (PXNavigationListDataSection)initWithCollectionsDataSection:(id)a3 indentationLevel:(int64_t)a4 childDataSections:(id)a5 childIndexHints:(id)a6 skipAssetCountFetches:(BOOL)a7
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = [v15 count];
  if (v17 != [v16 count])
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PXNavigationListDataSection.m", 117, @"Invalid parameter not satisfying: %@", @"childDataSections.count == childIndexHints.count" object file lineNumber description];
  }
  long long v18 = [v14 outlineObject];
  v29.receiver = self;
  v29.super_class = (Class)PXNavigationListDataSection;
  v19 = [(PXDataSection *)&v29 initWithOutlineObject:v18];

  if (v19)
  {
    objc_storeStrong((id *)&v19->_collectionsDataSection, a3);
    v19->_indentationLevel = a4;
    uint64_t v20 = [v15 copy];
    v21 = (void *)v20;
    v22 = (void *)MEMORY[0x1E4F1CC08];
    if (v20) {
      v23 = (void *)v20;
    }
    else {
      v23 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v19->_childDataSections, v23);

    uint64_t v24 = [v16 copy];
    id v25 = (void *)v24;
    if (v24) {
      v26 = (void *)v24;
    }
    else {
      v26 = v22;
    }
    objc_storeStrong((id *)&v19->_childIndexHints, v26);

    v19->_skipAssetCountFetches = a7;
  }

  return v19;
}

@end