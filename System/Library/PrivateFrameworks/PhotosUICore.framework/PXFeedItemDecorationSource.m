@interface PXFeedItemDecorationSource
- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (PXFeedSectionContentLayout)decoratedSectionContentLayout;
- (PXGLayout)decoratedLayout;
- (PXSectionedDataSource)dataSource;
- (PXSelectionSnapshot)selectionSnapshot;
- (id)_spriteIndexesForItems:(id)a3 inLayout:(id)a4;
- (id)selectedSpriteIndexesInLayout:(id)a3;
- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)section;
- (int64_t)selectionDecorationStyleInLayout:(id)a3;
- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3;
- (void)setDataSource:(id)a3 section:(int64_t)a4;
- (void)setDecoratedLayout:(id)a3;
- (void)setSelectionSnapshot:(id)a3;
@end

@implementation PXFeedItemDecorationSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoratedSectionContentLayout, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_decoratedLayout);
}

- (PXFeedSectionContentLayout)decoratedSectionContentLayout
{
  return self->_decoratedSectionContentLayout;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (int64_t)section
{
  return self->_section;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (PXGLayout)decoratedLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decoratedLayout);
  return (PXGLayout *)WeakRetained;
}

- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  float v6 = *(float *)off_1E5DAAF58;
  float v7 = *((float *)off_1E5DAAF58 + 1);
  float v8 = *((float *)off_1E5DAAF58 + 2);
  float v9 = *((float *)off_1E5DAAF58 + 3);
  id v10 = v5;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v11 = v10;

    if (v11)
    {
      [v11 decorationOverlayRectForSpriteIndex:v4];
      if (!CGRectIsNull(v17))
      {
        [v11 geometryForSpriteAtIndex:v4];
        PXEdgeInsetsBetweenRects();
      }
    }
  }
  else
  {

    id v11 = 0;
  }

  float v12 = v6;
  float v13 = v7;
  float v14 = v8;
  float v15 = v9;
  result.var3 = v15;
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (id)selectedSpriteIndexesInLayout:(id)a3
{
  id v5 = a3;
  float v6 = [(PXFeedItemDecorationSource *)self selectionSnapshot];
  float v7 = [v6 selectedIndexPaths];
  if ([v7 count] < 1)
  {
    float v13 = 0;
  }
  else
  {
    float v8 = [(PXFeedItemDecorationSource *)self dataSource];
    uint64_t v9 = [v8 identifier];

    id v10 = [v6 dataSource];
    uint64_t v11 = [v10 identifier];

    if (v9 != v11)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"PXFeedItemDecorationSource.m", 79, @"identifier mismatch between dataSource of %@ and selectionSnapshot %@", self, v6 object file lineNumber description];
    }
    float v12 = objc_msgSend(v7, "itemIndexSetForDataSourceIdentifier:section:", v9, -[PXFeedItemDecorationSource section](self, "section"));
    if (v12)
    {
      float v13 = [(PXFeedItemDecorationSource *)self _spriteIndexesForItems:v12 inLayout:v5];
    }
    else
    {
      float v14 = [v7 sectionIndexSetForDataSourceIdentifier:v9];
      if (objc_msgSend(v14, "containsIndex:", -[PXFeedItemDecorationSource section](self, "section"))
        && ([v6 dataSource],
            float v15 = objc_claimAutoreleasedReturnValue(),
            uint64_t v16 = objc_msgSend(v15, "numberOfItemsInSection:", -[PXFeedItemDecorationSource section](self, "section")),
            v15,
            v16 >= 1))
      {
        CGRect v17 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
        float v13 = [(PXFeedItemDecorationSource *)self _spriteIndexesForItems:v17 inLayout:v5];
      }
      else
      {
        float v13 = 0;
      }
    }
  }

  return v13;
}

- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3
{
  return 0;
}

- (int64_t)selectionDecorationStyleInLayout:(id)a3
{
  return 2;
}

- (void)setSelectionSnapshot:(id)a3
{
  id v5 = (PXSelectionSnapshot *)a3;
  if (self->_selectionSnapshot != v5)
  {
    float v7 = v5;
    objc_storeStrong((id *)&self->_selectionSnapshot, a3);
    float v6 = [(PXFeedItemDecorationSource *)self decoratedLayout];
    [v6 invalidateDecoration];

    id v5 = v7;
  }
}

- (void)setDataSource:(id)a3 section:(int64_t)a4
{
  id v7 = a3;
  if (*(_OWORD *)&self->_dataSource != __PAIR128__(a4, (unint64_t)v7))
  {
    self->_section = a4;
    id v9 = v7;
    objc_storeStrong((id *)&self->_dataSource, a3);
    float v8 = [(PXFeedItemDecorationSource *)self decoratedLayout];
    [v8 invalidateDecoration];

    id v7 = v9;
  }
}

- (void)setDecoratedLayout:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decoratedLayout);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_decoratedLayout, obj);
    float v6 = [(PXFeedItemDecorationSource *)self decoratedLayout];
    [v6 invalidateDecoration];

    id v5 = obj;
  }
}

- (id)_spriteIndexesForItems:(id)a3 inLayout:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 spriteIndexesForItems:v5];
    }
    else
    {
      id v7 = v5;
    }
    float v8 = v7;
  }
  else
  {
    float v8 = 0;
  }

  return v8;
}

@end