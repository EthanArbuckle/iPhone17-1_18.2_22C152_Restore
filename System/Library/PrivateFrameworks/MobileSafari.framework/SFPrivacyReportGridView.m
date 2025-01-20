@interface SFPrivacyReportGridView
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)itemViewCanUseCompactWidth:(id)a3;
- (BOOL)itemViewIsLineBreak:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)intrinsicContentSize;
- (NSArray)itemViews;
- (SFPrivacyReportGridView)init;
- (SFPrivacyReportGridView)initWithFrame:(CGRect)a3;
- (SFPrivacyReportGridViewDelegate)delegate;
- (double)interItemSpacing;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)_gridPositionForItemAtIndexPath:(id)a3;
- (void)_preferredContentSizeCategoryDidChange;
- (void)_rebuildRowLayoutInfoIfNeeded;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)invalidateIntrinsicContentSize;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setItemViews:(id)a3;
- (void)updateInterItemSpacing;
@end

@implementation SFPrivacyReportGridView

- (SFPrivacyReportGridView)init
{
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  v4 = -[SFPrivacyReportGridView initWithFrame:](self, "initWithFrame:");

  return v4;
}

- (SFPrivacyReportGridView)initWithFrame:(CGRect)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)SFPrivacyReportGridView;
  v3 = -[SFPrivacyReportGridView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    cachedRowInfo = v3->_cachedRowInfo;
    v3->_cachedRowInfo = (NSMutableArray *)v4;

    v6 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E4FB15C0]);
    collectionViewLayout = v3->_collectionViewLayout;
    v3->_collectionViewLayout = v6;

    id v8 = objc_alloc(MEMORY[0x1E4FB1568]);
    [(SFPrivacyReportGridView *)v3 bounds];
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:collectionViewLayout:", v3->_collectionViewLayout);
    collectionView = v3->_collectionView;
    v3->_collectionView = (UICollectionView *)v9;

    [(UICollectionView *)v3->_collectionView setAutoresizingMask:18];
    [(UICollectionView *)v3->_collectionView setScrollEnabled:0];
    [(SFPrivacyReportGridView *)v3 updateInterItemSpacing];
    [(SFPrivacyReportGridView *)v3 addSubview:v3->_collectionView];
    v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)v3->_collectionView setBackgroundColor:v11];

    [(UICollectionView *)v3->_collectionView setDelegate:v3];
    [(UICollectionView *)v3->_collectionView setDataSource:v3];
    [(UICollectionView *)v3->_collectionView frame];
    v3->_previousCollectionViewWidth = CGRectGetWidth(v20);
    [(UICollectionView *)v3->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"reportGridItemCell"];
    v12 = [(SFPrivacyReportGridView *)v3 traitCollection];
    v13 = [v12 preferredContentSizeCategory];
    v3->_isAccessibilitySize = UIContentSizeCategoryIsAccessibilityCategory(v13);

    v19[0] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v15 = (id)[(SFPrivacyReportGridView *)v3 registerForTraitChanges:v14 withTarget:v3 action:sel__preferredContentSizeCategoryDidChange];

    v16 = v3;
  }

  return v3;
}

- (void)invalidateIntrinsicContentSize
{
  [(NSMutableArray *)self->_cachedRowInfo removeAllObjects];
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout invalidateLayout];
  [(UICollectionView *)self->_collectionView setNeedsLayout];
  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportGridView;
  [(SFPrivacyReportGridView *)&v4 invalidateIntrinsicContentSize];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained gridViewDidUpdateContentSize:self];
  }
}

- (CGSize)intrinsicContentSize
{
  [(UICollectionView *)self->_collectionView layoutIfNeeded];
  double v3 = *MEMORY[0x1E4FB30D8];
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout collectionViewContentSize];
  double v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)updateInterItemSpacing
{
  [(SFPrivacyReportGridView *)self interItemSpacing];
  double v4 = v3;
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout minimumInteritemSpacing];
  if (v4 != v5)
  {
    [(UICollectionViewFlowLayout *)self->_collectionViewLayout setMinimumInteritemSpacing:v4];
    [(UICollectionViewFlowLayout *)self->_collectionViewLayout setMinimumLineSpacing:v4];
    [(SFPrivacyReportGridView *)self invalidateIntrinsicContentSize];
    [(SFPrivacyReportGridView *)self didUpdateInterItemSpacing:v4];
  }
}

- (void)_preferredContentSizeCategoryDidChange
{
  double v3 = [(SFPrivacyReportGridView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  self->_isAccessibilitySize = UIContentSizeCategoryIsAccessibilityCategory(v4);

  [(SFPrivacyReportGridView *)self updateInterItemSpacing];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportGridView;
  [(SFPrivacyReportGridView *)&v4 layoutSubviews];
  [(UICollectionView *)self->_collectionView frame];
  CGFloat Width = CGRectGetWidth(v5);
  if (Width != self->_previousCollectionViewWidth)
  {
    self->_previousCollectionViewCGFloat Width = Width;
    [(SFPrivacyReportGridView *)self invalidateIntrinsicContentSize];
  }
}

- (void)_rebuildRowLayoutInfoIfNeeded
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_cachedRowInfo count])
  {
    double v3 = [(SFPrivacyReportGridView *)self traitCollection];
    objc_super v4 = [v3 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    if ((int64_t)[(NSArray *)self->_itemViews count] >= 1)
    {
      int64_t v6 = 0;
      uint64_t v7 = 0;
      do
      {
        if (v6 + 1 >= (int64_t)[(NSArray *)self->_itemViews count]
          || ([(NSArray *)self->_itemViews objectAtIndexedSubscript:v6],
              id v8 = objc_claimAutoreleasedReturnValue(),
              BOOL v9 = [(SFPrivacyReportGridView *)self itemViewIsLineBreak:v8],
              v8,
              v9))
        {
          char v10 = 0;
        }
        else
        {
          v22 = [(NSArray *)self->_itemViews objectAtIndexedSubscript:v6];
          if ([(SFPrivacyReportGridView *)self itemViewCanUseCompactWidth:v22])
          {
            v23 = [(NSArray *)self->_itemViews objectAtIndexedSubscript:v6 + 1];
            BOOL v24 = [(SFPrivacyReportGridView *)self itemViewCanUseCompactWidth:v23];

            if (v24) {
              double v11 = 250.0;
            }
            else {
              double v11 = 375.0;
            }
            if (v24) {
              double v12 = 150.0;
            }
            else {
              double v12 = 250.0;
            }
            char v10 = 1;
            goto LABEL_8;
          }

          char v10 = 1;
        }
        double v11 = 375.0;
        double v12 = 250.0;
LABEL_8:
        if (IsAccessibilityCategory) {
          double v13 = v11;
        }
        else {
          double v13 = v12;
        }
        [(UICollectionView *)self->_collectionView frame];
        double Width = CGRectGetWidth(v38);
        [(UICollectionViewFlowLayout *)self->_collectionViewLayout minimumInteritemSpacing];
        double v16 = v15;
        [(UICollectionViewFlowLayout *)self->_collectionViewLayout sectionInset];
        if ((v10 & (v16 + v18 + v17 + v13 * 2.0 <= Width)) != 0) {
          uint64_t v19 = 2;
        }
        else {
          uint64_t v19 = 1;
        }
        CGRect v20 = -[SFPrivacyReportGridRowLayoutInfo initWithRow:itemRange:]([SFPrivacyReportGridRowLayoutInfo alloc], "initWithRow:itemRange:", v7, v6, v19);
        uint64_t v21 = v19;
        do
        {
          [(NSMutableArray *)self->_cachedRowInfo addObject:v20];
          --v21;
        }
        while (v21);
        ++v7;
        v6 += v19;
      }
      while (v6 < (int64_t)[(NSArray *)self->_itemViews count]);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v25 = [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v33 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v31 = -[NSArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", [v30 item]);
          objc_msgSend(v31, "setGridPosition:", -[SFPrivacyReportGridView _gridPositionForItemAtIndexPath:](self, "_gridPositionForItemAtIndexPath:", v30));
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v27);
    }
  }
}

- (void)layoutMarginsDidChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)SFPrivacyReportGridView;
  [(SFPrivacyReportGridView *)&v13 layoutMarginsDidChange];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v3 = [(UICollectionView *)self->_collectionView visibleCells];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        [(SFPrivacyReportGridView *)self layoutMargins];
        objc_msgSend(v8, "setLayoutMargins:");
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  [(SFPrivacyReportGridView *)self invalidateIntrinsicContentSize];
}

- (BOOL)itemViewCanUseCompactWidth:(id)a3
{
  return 0;
}

- (BOOL)itemViewIsLineBreak:(id)a3
{
  return 0;
}

- (double)interItemSpacing
{
  double v3 = [(SFPrivacyReportGridView *)self traitCollection];
  if ([v3 horizontalSizeClass] != 2 || (double v4 = 20.0, objc_msgSend(v3, "verticalSizeClass") != 2))
  {
    if (self->_isAccessibilitySize) {
      double v4 = 20.0;
    }
    else {
      double v4 = 10.0;
    }
  }

  return v4;
}

- (unint64_t)_gridPositionForItemAtIndexPath:(id)a3
{
  cachedRowInfo = self->_cachedRowInfo;
  id v5 = a3;
  uint64_t v6 = -[NSMutableArray objectAtIndexedSubscript:](cachedRowInfo, "objectAtIndexedSubscript:", [v5 item]);
  BOOL v7 = [v6 row] == 0;
  uint64_t v8 = [v6 row];
  long long v9 = [(NSMutableArray *)self->_cachedRowInfo lastObject];
  uint64_t v10 = [v9 row];

  if (v8 == v10) {
    uint64_t v11 = v7 | 2;
  }
  else {
    uint64_t v11 = v7;
  }
  uint64_t v12 = [v5 item];
  if (v12 == [v6 itemRange]) {
    v11 |= 4uLL;
  }
  uint64_t v13 = [v5 item];

  uint64_t v14 = [v6 itemRange];
  [v6 itemRange];
  if (v13 == v14 + v15 - 1) {
    unint64_t v16 = v11 | 8;
  }
  else {
    unint64_t v16 = v11;
  }

  return v16;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  BOOL v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"reportGridItemCell" forIndexPath:v6];
  uint64_t v8 = -[NSArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", [v6 item]);
  [v8 setDelegate:self];
  unint64_t v9 = [(SFPrivacyReportGridView *)self _gridPositionForItemAtIndexPath:v6];

  [v8 setGridPosition:v9];
  [(SFPrivacyReportGridView *)self layoutMargins];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [v7 contentView];
  objc_msgSend(v18, "setLayoutMargins:", v11, v13, v15, v17);

  uint64_t v19 = [v7 defaultBackgroundConfiguration];
  CGRect v20 = [v8 cellBackgroundColor];

  if (v20)
  {
    uint64_t v21 = [v8 cellBackgroundColor];
    [v19 setBackgroundColor:v21];
  }
  [v8 cellBackgroundCornerRadius];
  if (v22 != 9.22337204e18)
  {
    [v8 cellBackgroundCornerRadius];
    objc_msgSend(v19, "setCornerRadius:");
  }
  [v7 setBackgroundConfiguration:v19];
  [v7 setReportView:v8];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return [(NSArray *)self->_itemViews count];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(SFPrivacyReportGridView *)self _rebuildRowLayoutInfoIfNeeded];
  double v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_cachedRowInfo, "objectAtIndexedSubscript:", [v10 item]);
  [(UICollectionView *)self->_collectionView frame];
  double Width = CGRectGetWidth(v36);
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout minimumInteritemSpacing];
  double v14 = v13;
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout sectionInset];
  double v16 = v15;
  double v18 = v17;
  [v11 itemRange];
  uint64_t v31 = 0;
  long long v32 = (double *)&v31;
  double v20 = (Width - v16 - v18 - v14 * (double)(v19 - 1)) / (double)v19;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  [v11 height];
  uint64_t v34 = v21;
  double v22 = v32[3];
  if (v22 == 0.0)
  {
    v23 = (void *)MEMORY[0x1E4F28D60];
    uint64_t v24 = [v11 itemRange];
    uint64_t v26 = objc_msgSend(v23, "indexSetWithIndexesInRange:", v24, v25);
    itemViews = self->_itemViews;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __72__SFPrivacyReportGridView_collectionView_layout_sizeForItemAtIndexPath___block_invoke;
    v30[3] = &unk_1E54ECB38;
    v30[4] = &v31;
    *(double *)&v30[5] = v20;
    [(NSArray *)itemViews enumerateObjectsAtIndexes:v26 options:0 usingBlock:v30];
    [v11 setHeight:v32[3]];

    double v22 = v32[3];
  }
  _Block_object_dispose(&v31, 8);

  double v28 = v20;
  double v29 = v22;
  result.height = v29;
  result.width = v28;
  return result;
}

double __72__SFPrivacyReportGridView_collectionView_layout_sizeForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  double v7 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  LODWORD(a5) = 1148846080;
  LODWORD(a6) = 1112014848;
  objc_msgSend(a2, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *(double *)(a1 + 40), 1000.0, a5, a6);
  double result = fmax(v7, v8);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  double v4 = -[NSArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", objc_msgSend(a4, "item", a3));
  id v5 = [v4 action];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  -[NSArray objectAtIndexedSubscript:](self->_itemViews, "objectAtIndexedSubscript:", objc_msgSend(a4, "item", a3));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = [v5 action];
  v4[2]();
}

- (NSArray)itemViews
{
  return self->_itemViews;
}

- (void)setItemViews:(id)a3
{
}

- (SFPrivacyReportGridViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFPrivacyReportGridViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemViews, 0);
  objc_storeStrong((id *)&self->_cachedRowInfo, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end