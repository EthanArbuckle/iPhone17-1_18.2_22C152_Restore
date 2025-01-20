@interface PXRecipientSearchDataSource
- (id)recipientSearchResultAtIndexPath:(id)a3;
- (id)recipientSearchResultAtSimpleIndexPath:(PXSimpleIndexPath *)a3;
- (id)recipientSearchResultsInSection:(unint64_t)a3;
@end

@implementation PXRecipientSearchDataSource

- (id)recipientSearchResultAtSimpleIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v6[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v6[1] = v3;
  v4 = [(PXRecipientSearchDataSource *)self objectAtIndexPath:v6];
  return v4;
}

- (id)recipientSearchResultAtIndexPath:(id)a3
{
  long long v6 = 0u;
  long long v7 = 0u;
  id v4 = a3;
  [(PXRecipientSearchDataSource *)self identifier];
  PXSimpleIndexPathFromIndexPath();
}

- (id)recipientSearchResultsInSection:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
  long long v7 = objc_msgSend(off_1E5DA6F50, "indexPathSetWithSectionIndexes:dataSourceIdentifier:", v6, -[PXRecipientSearchDataSource identifier](self, "identifier"));

  v8 = [(PXRecipientSearchDataSource *)self itemIndexPathsForSections:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__PXRecipientSearchDataSource_recipientSearchResultsInSection___block_invoke;
  v13[3] = &unk_1E5DCA3B8;
  v13[4] = self;
  id v9 = v5;
  id v14 = v9;
  [v8 enumerateAllIndexPathsUsingBlock:v13];
  v10 = v14;
  id v11 = v9;

  return v11;
}

void __63__PXRecipientSearchDataSource_recipientSearchResultsInSection___block_invoke(uint64_t a1, _OWORD *a2)
{
  long long v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  id v5 = [v3 recipientSearchResultAtSimpleIndexPath:v6];
  [*(id *)(a1 + 40) addObject:v5];
}

@end