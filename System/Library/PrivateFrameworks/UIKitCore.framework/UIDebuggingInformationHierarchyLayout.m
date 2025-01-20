@interface UIDebuggingInformationHierarchyLayout
+ (Class)layoutAttributesClass;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (NSDictionary)allAttributes;
- (NSMutableDictionary)allLineAttributes;
- (UIDebuggingInformationHierarchyLayoutDelegate)delegate;
- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)_recomputeAttributes;
- (void)invalidateLayout;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareLayout;
- (void)setAllAttributes:(id)a3;
- (void)setAllLineAttributes:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation UIDebuggingInformationHierarchyLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (void)prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)UIDebuggingInformationHierarchyLayout;
  [(UICollectionViewLayout *)&v3 prepareLayout];
  [(UIDebuggingInformationHierarchyLayout *)self _recomputeAttributes];
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UIDebuggingInformationHierarchyLayout;
  [(UICollectionViewLayout *)&v25 prepareForCollectionViewUpdates:v4];
  indexPathsToDelete = self->_indexPathsToDelete;
  if (indexPathsToDelete)
  {
    [(NSMutableArray *)indexPathsToDelete removeAllObjects];
  }
  else
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_indexPathsToDelete;
    self->_indexPathsToDelete = v6;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        allLineAttributes = self->_allLineAttributes;
        v15 = [v13 indexPathBeforeUpdate];
        v16 = [(NSMutableDictionary *)allLineAttributes objectForKeyedSubscript:v15];

        if (v16)
        {
          v17 = self->_indexPathsToDelete;
          v18 = [v13 indexPathBeforeUpdate];
          [(NSMutableArray *)v17 addObject:v18];

          v19 = self->_allLineAttributes;
          v20 = [v13 indexPathBeforeUpdate];
          [(NSMutableDictionary *)v19 removeObjectForKey:v20];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v10);
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  [(UIDebuggingInformationHierarchyLayout *)self invalidateLayout];
}

- (void)_recomputeAttributes
{
  v32 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v33 = self;
  id v34 = [(UICollectionViewLayout *)self collectionView];
  if ([v34 numberOfSections])
  {
    unint64_t v3 = 0;
    double v4 = -1.0;
    double v5 = 0.0;
    do
    {
      if ([v34 numberOfItemsInSection:v3])
      {
        unint64_t v6 = 0;
        do
        {
          v7 = [MEMORY[0x1E4F28D58] indexPathForRow:v6 inSection:v3];
          id v8 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v7];
          [v34 bounds];
          double Width = CGRectGetWidth(v36);
          p_delegate = (id *)&v33->_delegate;
          id WeakRetained = objc_loadWeakRetained((id *)&v33->_delegate);
          unint64_t v12 = [WeakRetained indentationLevelForIndexPath:v7];
          double v13 = (double)v12;

          [v8 setZIndex:2];
          objc_msgSend(v8, "setFrame:", v13 * 10.0, v5, Width - v13 * 10.0, 32.0);
          id v14 = objc_loadWeakRetained((id *)&v33->_delegate);
          objc_msgSend(v8, "setHidden:", objc_msgSend(v14, "shouldCollapseAtIndexPath:", v7));

          [(NSDictionary *)v32 setObject:v8 forKeyedSubscript:v7];
          v15 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:@"line" withIndexPath:v7];
          id v16 = objc_loadWeakRetained((id *)&v33->_delegate);
          v17 = [v16 colorForIndentationLevel:(unint64_t)(double)v12];
          [v15 setLineColor:v17];

          if (v12 < 2 || v4 == v13)
          {
            ++v6;
          }
          else
          {
            v18 = [MEMORY[0x1E4F28D58] indexPathForRow:++v6 inSection:v3];
            id v19 = objc_loadWeakRetained(p_delegate);
            double v20 = (double)(unint64_t)[v19 indentationLevelForIndexPath:v18];

            if (v20 >= v13)
            {
              double v21 = 32.0;
              long long v22 = v18;
              do
              {
                id v23 = objc_loadWeakRetained(p_delegate);
                int v24 = [v23 shouldCollapseAtIndexPath:v22];

                if (!v24) {
                  double v21 = v21 + 35.0;
                }
                v18 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v22, "row") + 1, v3);

                id v25 = objc_loadWeakRetained(p_delegate);
                double v26 = (double)(unint64_t)[v25 indentationLevelForIndexPath:v18];

                long long v22 = v18;
              }
              while (v26 >= v13);
            }
            else
            {
              double v21 = 32.0;
            }
            objc_msgSend(v15, "setFrame:", v13 * 10.0 + -10.0, v5 + 0.0, 2.0, v21);
            objc_msgSend(v15, "setSize:", 2.0, v21);
            id v27 = objc_loadWeakRetained(p_delegate);
            objc_msgSend(v15, "setHidden:", objc_msgSend(v27, "shouldCollapseAtIndexPath:", v7));

            [v15 setZIndex:1];
            [(NSMutableDictionary *)v31 setObject:v15 forKeyedSubscript:v7];
          }
          if (![v8 isHidden]) {
            double v5 = v5 + 35.0;
          }

          double v4 = v13;
        }
        while (v6 < [v34 numberOfItemsInSection:v3]);
      }
      else
      {
        double v13 = v4;
      }
      ++v3;
      double v4 = v13;
    }
    while (v3 < [v34 numberOfSections]);
  }
  allAttributes = v33->_allAttributes;
  v33->_allAttributes = v32;
  v29 = v32;

  allLineAttributes = v33->_allLineAttributes;
  v33->_allLineAttributes = v31;
}

- (void)invalidateLayout
{
  v3.receiver = self;
  v3.super_class = (Class)UIDebuggingInformationHierarchyLayout;
  [(UICollectionViewLayout *)&v3 invalidateLayout];
  [(UIDebuggingInformationHierarchyLayout *)self _recomputeAttributes];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double Width = CGRectGetWidth(a3);
  double v5 = [(UICollectionViewLayout *)self collectionView];
  [v5 bounds];
  BOOL v6 = Width != CGRectGetWidth(v8);

  return v6;
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  return self->_indexPathsToDelete;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [(UIDebuggingInformationHierarchyLayout *)self allAttributes];
    BOOL v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    BOOL v6 = 0;
  }
  return v6;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    BOOL v6 = [(UIDebuggingInformationHierarchyLayout *)self allLineAttributes];
    v7 = [v6 objectForKeyedSubscript:v5];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [(UIDebuggingInformationHierarchyLayout *)self allAttributes];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__UIDebuggingInformationHierarchyLayout_layoutAttributesForElementsInRect___block_invoke;
  v14[3] = &unk_1E530CB38;
  CGFloat v16 = x;
  CGFloat v17 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v14];

  uint64_t v11 = v15;
  id v12 = v10;

  return v12;
}

void __75__UIDebuggingInformationHierarchyLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  [v5 frame];
  v17.origin.CGFloat x = v6;
  v17.origin.CGFloat y = v7;
  v17.size.CGFloat width = v8;
  v17.size.CGFloat height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), v17))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
    char v11 = [WeakRetained shouldCollapseAtIndexPath:v15];

    if ((v11 & 1) == 0)
    {
      [*(id *)(a1 + 40) addObject:v5];
      id v12 = [*(id *)(*(void *)(a1 + 32) + 296) objectForKeyedSubscript:v15];

      if (v12)
      {
        double v13 = *(void **)(a1 + 40);
        id v14 = [*(id *)(*(void *)(a1 + 32) + 296) objectForKeyedSubscript:v15];
        [v13 addObject:v14];
      }
    }
  }
}

- (CGSize)collectionViewContentSize
{
  objc_super v3 = [(UICollectionViewLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];

  if (v4)
  {
    unint64_t v5 = 0;
    double v6 = 0.0;
    do
    {
      CGFloat v7 = [(UICollectionViewLayout *)self collectionView];
      uint64_t v8 = [v7 numberOfItemsInSection:v5];

      if (v8)
      {
        unint64_t v9 = 0;
        do
        {
          id v10 = [MEMORY[0x1E4F28D58] indexPathForRow:v9 inSection:v5];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          int v12 = [WeakRetained shouldCollapseAtIndexPath:v10];

          if (!v12) {
            double v6 = v6 + 35.0;
          }

          ++v9;
          double v13 = [(UICollectionViewLayout *)self collectionView];
          unint64_t v14 = [v13 numberOfItemsInSection:v5];
        }
        while (v9 < v14);
      }
      ++v5;
      id v15 = [(UICollectionViewLayout *)self collectionView];
      unint64_t v16 = [v15 numberOfSections];
    }
    while (v5 < v16);
  }
  else
  {
    double v6 = 0.0;
  }
  CGRect v17 = [(UICollectionViewLayout *)self collectionView];
  [v17 bounds];
  CGFloat Width = CGRectGetWidth(v22);

  double v19 = Width;
  double v20 = v6;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (UIDebuggingInformationHierarchyLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIDebuggingInformationHierarchyLayoutDelegate *)WeakRetained;
}

- (NSDictionary)allAttributes
{
  return self->_allAttributes;
}

- (void)setAllAttributes:(id)a3
{
}

- (NSMutableDictionary)allLineAttributes
{
  return self->_allLineAttributes;
}

- (void)setAllLineAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLineAttributes, 0);
  objc_storeStrong((id *)&self->_allAttributes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_indexPathsToDelete, 0);
}

@end