@interface TVRUITabSelectorControl
+ (double)defaultHeight;
- (BOOL)prefersCenteredItems;
- (NSArray)items;
- (NSString)previousSelectedItem;
- (TVRUITabSelectorControl)initWithItems:(id)a3;
- (TVRUITabSelectorControlDelegate)delegate;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (double)layoutHeight;
- (id)_cellResolvedLayoutResultsForItems:(id)a3;
- (id)_layout;
- (unint64_t)selectedIndex;
- (void)_configure;
- (void)_updateFromItemsAnimated:(BOOL)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItems:(id)a3;
- (void)setLayoutHeight:(double)a3;
- (void)setPrefersCenteredItems:(BOOL)a3;
- (void)setPreviousSelectedItem:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)updateItems:(id)a3 animated:(BOOL)a4;
@end

@implementation TVRUITabSelectorControl

- (TVRUITabSelectorControl)initWithItems:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRUITabSelectorControl;
  v5 = [(TVRUITabSelectorControl *)&v11 init];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v4];
    uint64_t v7 = [v6 array];
    items = v5->_items;
    v5->_items = (NSArray *)v7;

    v5->_prefersCenteredItems = 1;
    previousSelectedItem = v5->_previousSelectedItem;
    v5->_previousSelectedItem = 0;

    [(TVRUITabSelectorControl *)v5 _configure];
    [(TVRUITabSelectorControl *)v5 _updateFromItemsAnimated:0];
    if ([v4 count]) {
      [(TVRUITabSelectorControl *)v5 setSelectedIndex:0];
    }
  }
  return v5;
}

- (void)setItems:(id)a3
{
}

- (void)updateItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = [MEMORY[0x263EFF9D8] orderedSetWithArray:a3];
  v6 = [v8 array];
  items = self->_items;
  self->_items = v6;

  [(TVRUITabSelectorControl *)self _updateFromItemsAnimated:v4];
}

- (void)setSelectedIndex:(unint64_t)a3
{
  v5 = [(TVRUITabSelectorControl *)self items];
  unint64_t v6 = [v5 count];

  if (v6 > a3)
  {
    uint64_t v7 = [(TVRUITabSelectorControl *)self collectionView];
    id v8 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
    [v7 selectItemAtIndexPath:v8 animated:0 scrollPosition:0];

    id v11 = [(TVRUITabSelectorControl *)self items];
    if ([v11 count] <= a3)
    {
      [(TVRUITabSelectorControl *)self setPreviousSelectedItem:0];
    }
    else
    {
      v9 = [(TVRUITabSelectorControl *)self items];
      v10 = [v9 objectAtIndexedSubscript:a3];
      [(TVRUITabSelectorControl *)self setPreviousSelectedItem:v10];
    }
  }
}

- (unint64_t)selectedIndex
{
  v2 = [(TVRUITabSelectorControl *)self collectionView];
  v3 = [v2 indexPathsForSelectedItems];
  BOOL v4 = [v3 firstObject];

  if (v4) {
    unint64_t v5 = [v4 item];
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

+ (double)defaultHeight
{
  return 28.0;
}

- (void)_configure
{
  v28[4] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F82538] registrationWithCellClass:objc_opt_class() configurationHandler:&__block_literal_global_5];
  id v4 = objc_alloc(MEMORY[0x263F82528]);
  unint64_t v5 = [(TVRUITabSelectorControl *)self _layout];
  unint64_t v6 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  [v6 setDelegate:self];
  id v7 = objc_alloc(MEMORY[0x263F82560]);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __37__TVRUITabSelectorControl__configure__block_invoke_2;
  v26[3] = &unk_264800570;
  id v27 = v3;
  id v25 = v3;
  v24 = (void *)[v7 initWithCollectionView:v6 cellProvider:v26];
  id v8 = self;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [MEMORY[0x263F825C8] clearColor];
  [v6 setBackgroundColor:v9];

  [v6 setBouncesVertically:0];
  [v6 setClipsToBounds:0];
  [(TVRUITabSelectorControl *)v8 addSubview:v6];
  v18 = (void *)MEMORY[0x263F08938];
  v23 = [(TVRUITabSelectorControl *)v8 leadingAnchor];
  v22 = [v6 leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v28[0] = v21;
  v20 = [(TVRUITabSelectorControl *)v8 trailingAnchor];
  v19 = [v6 trailingAnchor];
  v10 = [v20 constraintEqualToAnchor:v19];
  v28[1] = v10;
  id v11 = [(TVRUITabSelectorControl *)v8 topAnchor];
  v12 = [v6 topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v28[2] = v13;
  v14 = [(TVRUITabSelectorControl *)v8 bottomAnchor];
  v15 = [v6 bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v28[3] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
  [v18 activateConstraints:v17];

  [(TVRUITabSelectorControl *)v8 setCollectionView:v6];
  [(TVRUITabSelectorControl *)v8 setDataSource:v24];
}

void __37__TVRUITabSelectorControl__configure__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [a2 label];
  [v6 setText:v5];
}

uint64_t __37__TVRUITabSelectorControl__configure__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

- (id)_layout
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F82540]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__TVRUITabSelectorControl__layout__block_invoke;
  v6[3] = &unk_264800598;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v4 = (void *)[v3 initWithSectionProvider:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

id __34__TVRUITabSelectorControl__layout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained dataSource];
    id v8 = [v7 snapshot];

    uint64_t v62 = [v8 numberOfItems];
    v9 = *(void **)(a1 + 32);
    v59 = v8;
    v10 = [v8 itemIdentifiers];
    id v11 = [v9 _cellResolvedLayoutResultsForItems:v10];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v65;
      double v16 = 0.0;
      double v17 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v65 != v15) {
            objc_enumerationMutation(v12);
          }
          v19 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          [v19 resolvedLayoutSize];
          double v16 = v16 + v20;
          [v19 resolvedLayoutSize];
          if (v21 > v17) {
            double v17 = v21;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v64 objects:v68 count:16];
      }
      while (v14);
    }
    else
    {
      double v16 = 0.0;
      double v17 = 0.0;
    }

    double v23 = (double)(v62 - 1) * 10.0 + v16;
    [v6 setLayoutHeight:v17];
    id v61 = v4;
    v24 = [v4 container];
    [v24 effectiveContentSize];
    double v26 = v25;

    v60 = v6;
    int v27 = [v6 prefersCenteredItems];
    if (v23 < v26) {
      int v28 = v27;
    }
    else {
      int v28 = 0;
    }
    id v63 = objc_alloc_init(MEMORY[0x263EFF980]);
    unint64_t v29 = 0x263F82000uLL;
    if (v62 >= 1)
    {
      uint64_t v30 = 0;
      double v31 = (v26 - v23) * 0.5;
      do
      {
        v32 = [v12 objectAtIndexedSubscript:v30];
        v33 = (void *)MEMORY[0x263F82338];
        v34 = *(void **)(v29 + 752);
        [v32 resolvedLayoutSize];
        v35 = objc_msgSend(v34, "absoluteDimension:");
        unint64_t v36 = v29;
        v37 = [*(id *)(v29 + 752) absoluteDimension:v17];
        v38 = [v33 sizeWithWidthDimension:v35 heightDimension:v37];

        v39 = [MEMORY[0x263F82310] itemWithLayoutSize:v38];
        char v40 = v28 ^ 1;
        if (v30) {
          char v40 = 1;
        }
        if (v40)
        {
          v41 = 0;
        }
        else
        {
          v41 = [MEMORY[0x263F82340] fixedSpacing:v31];
        }
        if (v62 - 1 == v30) {
          int v42 = v28;
        }
        else {
          int v42 = 0;
        }
        if (v42 == 1)
        {
          v43 = [MEMORY[0x263F82340] fixedSpacing:v31];
        }
        else
        {
          v43 = 0;
        }
        v44 = [MEMORY[0x263F822F8] spacingForLeading:v41 top:0 trailing:v43 bottom:0];
        [v39 setEdgeSpacing:v44];
        [v63 addObject:v39];

        ++v30;
        unint64_t v29 = v36;
      }
      while (v62 != v30);
    }
    v45 = (void *)MEMORY[0x263F82338];
    v46 = *(void **)(v29 + 752);
    if (v28) {
      [v46 fractionalWidthDimension:1.0];
    }
    else {
    v47 = [v46 absoluteDimension:v23];
    }
    v48 = [*(id *)(v29 + 752) absoluteDimension:v17];
    v49 = [v45 sizeWithWidthDimension:v47 heightDimension:v48];
    id v4 = v61;

    if (![v63 count])
    {
      v50 = (void *)MEMORY[0x263F82310];
      v51 = (void *)MEMORY[0x263F82338];
      v52 = [*(id *)(v29 + 752) fractionalWidthDimension:1.0];
      v53 = [*(id *)(v29 + 752) fractionalHeightDimension:1.0];
      v54 = [v51 sizeWithWidthDimension:v52 heightDimension:v53];
      v55 = [v50 itemWithLayoutSize:v54];

      [v63 addObject:v55];
    }
    v56 = [MEMORY[0x263F82300] horizontalGroupWithLayoutSize:v49 subitems:v63];
    v57 = [MEMORY[0x263F82340] fixedSpacing:10.0];
    [v56 setInterItemSpacing:v57];

    v22 = [MEMORY[0x263F82320] sectionWithGroup:v56];

    id v6 = v60;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)_updateFromItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = objc_alloc_init(MEMORY[0x263F82358]);
  [v9 appendSectionsWithIdentifiers:&unk_26DB65B30];
  id v5 = [(TVRUITabSelectorControl *)self items];
  [v9 appendItemsWithIdentifiers:v5];

  id v6 = [(TVRUITabSelectorControl *)self dataSource];
  [v6 applySnapshot:v9 animatingDifferences:v3];

  if ([(TVRUITabSelectorControl *)self selectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [(TVRUITabSelectorControl *)self items];
    uint64_t v8 = [v7 count];

    if (v8) {
      [(TVRUITabSelectorControl *)self setSelectedIndex:0];
    }
  }
}

- (id)_cellResolvedLayoutResultsForItems:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TVRUITabSelectorControl *)self bounds];
  double Height = CGRectGetHeight(v27);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [_TVRUITabSelectorControlCell alloc];
        uint64_t v14 = -[_TVRUITabSelectorControlCell initWithFrame:](v13, "initWithFrame:", 0.0, 0.0, 20000.0, Height, (void)v20);
        uint64_t v15 = [(_TVRUITabSelectorControlCell *)v14 label];
        [v15 setText:v12];

        -[_TVRUITabSelectorControlCell systemLayoutSizeFittingSize:](v14, "systemLayoutSizeFittingSize:", 20000.0, Height);
        v18 = -[_TVRUITabSelectorControlCellLayoutResult initWithResolvedLayoutSize:]([_TVRUITabSelectorControlCellLayoutResult alloc], "initWithResolvedLayoutSize:", v16, v17);
        [v6 addObject:v18];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v15 = a4;
  [(TVRUITabSelectorControl *)self sendActionsForControlEvents:4096];
  id v5 = [(TVRUITabSelectorControl *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [v15 item];
    uint64_t v8 = [(TVRUITabSelectorControl *)self previousSelectedItem];
    if ([v8 length])
    {
      uint64_t v9 = [(TVRUITabSelectorControl *)self items];
      uint64_t v10 = [(TVRUITabSelectorControl *)self previousSelectedItem];
      uint64_t v11 = [v9 indexOfObject:v10];
    }
    else
    {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }

    uint64_t v12 = [(TVRUITabSelectorControl *)self delegate];
    [v12 tabSelectorControl:self didSelectIndex:v7 previousIndex:v11];
  }
  uint64_t v13 = [(TVRUITabSelectorControl *)self dataSource];
  uint64_t v14 = [v13 itemIdentifierForIndexPath:v15];
  [(TVRUITabSelectorControl *)self setPreviousSelectedItem:v14];
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)prefersCenteredItems
{
  return self->_prefersCenteredItems;
}

- (void)setPrefersCenteredItems:(BOOL)a3
{
  self->_prefersCenteredItems = a3;
}

- (double)layoutHeight
{
  return self->_layoutHeight;
}

- (void)setLayoutHeight:(double)a3
{
  self->_layoutdouble Height = a3;
}

- (TVRUITabSelectorControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVRUITabSelectorControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSString)previousSelectedItem
{
  return self->_previousSelectedItem;
}

- (void)setPreviousSelectedItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSelectedItem, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_items, 0);
}

@end