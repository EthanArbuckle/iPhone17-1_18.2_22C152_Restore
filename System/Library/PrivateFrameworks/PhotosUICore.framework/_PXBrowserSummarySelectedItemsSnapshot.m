@interface _PXBrowserSummarySelectedItemsSnapshot
- (PXBrowserSelectionSnapshot)browserSelectionSnapshot;
- (_PXBrowserSummarySelectedItemsSnapshot)init;
- (_PXBrowserSummarySelectedItemsSnapshot)initWithBrowserSelectionSnapshot:(id)a3;
- (id)containsItemReference:(id)a3;
- (id)itemForItemReference:(id)a3;
- (id)itemReferenceAtIndex:(int64_t)a3;
- (int64_t)count;
@end

@implementation _PXBrowserSummarySelectedItemsSnapshot

- (void).cxx_destruct
{
}

- (PXBrowserSelectionSnapshot)browserSelectionSnapshot
{
  return self->_browserSelectionSnapshot;
}

- (id)itemForItemReference:(id)a3
{
  id v4 = a3;
  v5 = [(_PXBrowserSummarySelectedItemsSnapshot *)self browserSelectionSnapshot];
  uint64_t v6 = [v5 indexOfAssetReference:v4];

  v7 = [v5 displayAssetAtIndex:v6];
  if (!v7)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }

  return v7;
}

- (id)containsItemReference:(id)a3
{
  id v4 = a3;
  v5 = [(_PXBrowserSummarySelectedItemsSnapshot *)self browserSelectionSnapshot];
  uint64_t v6 = [v5 indexOfAssetReference:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v5 assetReferenceAtIndex:v6];
  }

  return v7;
}

- (id)itemReferenceAtIndex:(int64_t)a3
{
  id v4 = [(_PXBrowserSummarySelectedItemsSnapshot *)self browserSelectionSnapshot];
  v5 = [v4 assetReferenceAtIndex:a3];

  return v5;
}

- (int64_t)count
{
  v2 = [(_PXBrowserSummarySelectedItemsSnapshot *)self browserSelectionSnapshot];
  int64_t v3 = [v2 assetCount];

  return v3;
}

- (_PXBrowserSummarySelectedItemsSnapshot)initWithBrowserSelectionSnapshot:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXBrowserSummarySelectedItemsSnapshot;
  uint64_t v6 = [(_PXBrowserSummarySelectedItemsSnapshot *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_browserSelectionSnapshot, a3);
  }

  return v7;
}

- (_PXBrowserSummarySelectedItemsSnapshot)init
{
  return [(_PXBrowserSummarySelectedItemsSnapshot *)self initWithBrowserSelectionSnapshot:0];
}

@end