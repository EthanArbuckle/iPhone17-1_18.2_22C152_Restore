@interface PXGadgetCollectionViewLayout
- (BOOL)_disablesDoubleSidedAnimations;
- (BOOL)_hasButtonForGadget:(id)a3;
- (BOOL)_shouldShowSectionHeaderForGadget:(id)a3;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)isPageFullColumnnWidth;
- (BOOL)prefersPagingEnabled;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (PXGadgetCollectionViewLayoutDelegate)delegate;
- (PXGadgetSpec)spec;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)columnWidth;
- (double)interSectionSpacing;
- (id)_titleForGadget:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (int64_t)pageSizeClass;
- (unint64_t)_buttonTypeForGadget:(id)a3;
- (unint64_t)_sectionHeaderStyleForGadget:(id)a3;
- (void)_updateMinimumLineSpacing;
- (void)setColumnWidth:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setInterSectionSpacing:(double)a3;
- (void)setIsPageFullColumnnWidth:(BOOL)a3;
- (void)setPageSizeClass:(int64_t)a3;
- (void)setPrefersPagingEnabled:(BOOL)a3;
- (void)setScrollDirection:(int64_t)a3;
- (void)setSpec:(id)a3;
@end

@implementation PXGadgetCollectionViewLayout

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (double)interSectionSpacing
{
  return self->_interSectionSpacing;
}

- (double)columnWidth
{
  return self->_columnWidth;
}

- (void)setIsPageFullColumnnWidth:(BOOL)a3
{
  self->_isPageFullColumnnWidth = a3;
}

- (BOOL)isPageFullColumnnWidth
{
  return self->_isPageFullColumnnWidth;
}

- (void)setPageSizeClass:(int64_t)a3
{
  self->_pageSizeClass = a3;
}

- (int64_t)pageSizeClass
{
  return self->_pageSizeClass;
}

- (BOOL)prefersPagingEnabled
{
  return self->_prefersPagingEnabled;
}

- (void)setDelegate:(id)a3
{
}

- (PXGadgetCollectionViewLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGadgetCollectionViewLayoutDelegate *)WeakRetained;
}

- (PXGadgetSpec)spec
{
  return self->_spec;
}

- (unint64_t)_sectionHeaderStyleForGadget:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 headerStyle];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldShowSectionHeaderForGadget:(id)a3
{
  id v4 = a3;
  v5 = [(PXGadgetCollectionViewLayout *)self _titleForGadget:v4];
  v6 = v5;
  if (v5) {
    BOOL v7 = [v5 length] != 0;
  }
  else {
    BOOL v7 = 0;
  }
  BOOL v8 = [(PXGadgetCollectionViewLayout *)self _hasButtonForGadget:v4];
  v9 = [(PXGadgetCollectionViewLayout *)self spec];
  uint64_t v10 = [v9 scrollAxis];

  BOOL v11 = v10 == 1 && (v7 || v8);
  return v11;
}

- (BOOL)_hasButtonForGadget:(id)a3
{
  return [(PXGadgetCollectionViewLayout *)self _buttonTypeForGadget:a3] != 0;
}

- (unint64_t)_buttonTypeForGadget:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    unint64_t v4 = [v3 accessoryButtonType];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_titleForGadget:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 localizedTitle];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)_updateMinimumLineSpacing
{
  if ([(UICollectionViewFlowLayout *)self scrollDirection] == 1)
  {
    [(PXGadgetCollectionViewLayout *)self interSectionSpacing];
    -[UICollectionViewFlowLayout setMinimumLineSpacing:](self, "setMinimumLineSpacing:");
  }
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)PXGadgetCollectionViewLayout;
  BOOL v8 = -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v15, sel_invalidationContextForBoundsChange_);
  v9 = [(PXGadgetCollectionViewLayout *)self collectionView];
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v10 = CGRectGetWidth(v17);
  [v9 bounds];
  BOOL v11 = v10 != CGRectGetWidth(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v12 = CGRectGetHeight(v19);
  [v9 bounds];
  uint64_t v13 = v12 != CGRectGetHeight(v20) || v11;
  [v8 setInvalidateFlowLayoutDelegateMetrics:v13];

  return v8;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  double v10 = [(PXGadgetCollectionViewLayout *)self delegate];
  BOOL v11 = [v10 dataSource];

  uint64_t v12 = [v11 identifier];
  uint64_t v13 = [v9 section];
  uint64_t v14 = [v9 item];

  v26[0] = v12;
  v26[1] = v13;
  v26[2] = v14;
  v26[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_super v15 = [v11 gadgetAtIndexPath:v26];
  v16 = [(PXGadgetCollectionViewLayout *)self spec];
  uint64_t v17 = [v16 scrollAxis];

  if (v17 == 2)
  {
    [v8 bounds];
    [v8 contentInset];
    PXEdgeInsetsInsetSize();
  }
  if (v17 != 1)
  {
    double v18 = 0.0;
    double v19 = 0.0;
    if (v17) {
      goto LABEL_9;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      v25 = [(PXGadgetCollectionViewLayout *)self spec];
      *(_DWORD *)buf = 138412290;
      v28 = v25;
      _os_log_fault_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Undefined scroll axis for spec %@. This shouldn't happen, but actually sometimes still does. See <rdar://problem/49414469> for details.", buf, 0xCu);
    }
  }
  [v8 bounds];
  objc_msgSend(v15, "sizeThatFits:", CGRectGetWidth(v31), 1.79769313e308);
  double v19 = v20;
  double v18 = v21;
  if (v21 >= 1.79769313e308)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXGadgetCollectionViewLayout.m", 171, @"Invalid parameter not satisfying: %@", @"preferredSize.height < CGFLOAT_MAX" object file lineNumber description];
  }
LABEL_9:

  double v23 = v19;
  double v24 = v18;
  result.CGFloat height = v24;
  result.CGFloat width = v23;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  [(PXGadgetCollectionViewLayout *)self interSectionSpacing];
  double v8 = v7;
  if ([(UICollectionViewFlowLayout *)self scrollDirection] == 1 && v8 > 0.0)
  {
    double v9 = 0.0;
    if (a5) {
      double v10 = v8;
    }
    else {
      double v10 = 0.0;
    }
    double v11 = 0.0;
    double v12 = 0.0;
  }
  else
  {
    double v12 = *MEMORY[0x1E4FB2848];
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  result.right = v9;
  result.bottom = v11;
  result.left = v10;
  result.top = v12;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  double x = a3.x;
  v6 = [(PXGadgetCollectionViewLayout *)self delegate];
  double v7 = [v6 dataSource];
  uint64_t v8 = [v7 numberOfSections];

  if (v8)
  {
    double v9 = [(PXGadgetCollectionViewLayout *)self collectionView];
    if (([v9 isPagingEnabled] & 1) == 0
      && [(UICollectionViewFlowLayout *)self scrollDirection] == 1)
    {
      [v9 contentInset];
      double v11 = v10;
      [v9 contentSize];
      double v13 = v12;
      [v9 bounds];
      if (x < v13 - CGRectGetWidth(v29) - v11)
      {
        [(PXGadgetCollectionViewLayout *)self interSectionSpacing];
        double v15 = v14;
        [(UICollectionViewFlowLayout *)self itemSize];
        double v17 = v16;
        double v18 = [(PXGadgetCollectionViewLayout *)self delegate];
        double v19 = [v18 dataSource];
        uint64_t v20 = [v19 numberOfItemsInSection:0];

        if (v20 >= 1)
        {
          double v21 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
          [(PXGadgetCollectionViewLayout *)self collectionView:v9 layout:self sizeForItemAtIndexPath:v21];
          double v17 = v22;
        }
        if (v15 + v17 > 0.0)
        {
          double v23 = [(PXGadgetCollectionViewLayout *)self spec];
          [v23 displayScale];
          if (v24 == 0.0)
          {
            v25 = [MEMORY[0x1E4FB1BA8] mainScreen];
            [v25 scale];
          }
          PXFloatRoundToPixel();
        }
      }
    }
  }
  double v26 = x;
  double v27 = y;
  result.CGFloat y = v27;
  result.double x = v26;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXGadgetCollectionViewLayout;
  -[PXGadgetCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](&v7, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, a4.x, a4.y);
  -[PXGadgetCollectionViewLayout targetContentOffsetForProposedContentOffset:](self, "targetContentOffsetForProposedContentOffset:");
  result.CGFloat y = v6;
  result.double x = v5;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)setScrollDirection:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGadgetCollectionViewLayout;
  [(UICollectionViewFlowLayout *)&v4 setScrollDirection:a3];
  [(PXGadgetCollectionViewLayout *)self _updateMinimumLineSpacing];
}

- (void)setInterSectionSpacing:(double)a3
{
  if (a3 < 0.0)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PXGadgetCollectionViewLayout.m", 71, @"Invalid parameter not satisfying: %@", @"interSectionSpacing >= 0" object file lineNumber description];
  }
  PXFloatApproximatelyEqualToFloat();
}

- (void)setColumnWidth:(double)a3
{
  if (a3 <= 0.0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXGadgetCollectionViewLayout.m", 61, @"Invalid parameter not satisfying: %@", @"columnWidth > 0" object file lineNumber description];
  }
  if (self->_columnWidth != a3)
  {
    self->_columnWidth = a3;
    [(PXGadgetCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setPrefersPagingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && [(UICollectionViewFlowLayout *)self scrollDirection] != 1)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXGadgetCollectionViewLayout.m", 51, @"Invalid parameter not satisfying: %@", @"!prefersPagingEnabled || (self.scrollDirection == UICollectionViewScrollDirectionHorizontal)" object file lineNumber description];
  }
  if (self->_prefersPagingEnabled != v3)
  {
    self->_prefersPagingEnabled = v3;
    [(PXGadgetCollectionViewLayout *)self invalidateLayout];
  }
}

- (void)setSpec:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXGadgetCollectionViewLayout.m", 39, @"Invalid parameter not satisfying: %@", @"spec" object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_spec, a3);
  [v7 layoutInsets];
  [(PXGadgetSpec *)self->_spec layoutInsets];
  PXEdgeInsetsEqualToEdgeInsets();
}

- (BOOL)_disablesDoubleSidedAnimations
{
  BOOL v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  int64_t v5 = [(UICollectionViewFlowLayout *)self scrollDirection];
  double v6 = [(PXGadgetCollectionViewLayout *)self delegate];
  char v7 = [v6 isTogglingSidebarNoRotating];

  if (v4 == 1 && v5 == 0) {
    return v7;
  }
  else {
    return 0;
  }
}

@end