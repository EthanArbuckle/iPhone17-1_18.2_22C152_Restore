@interface _TVListView
- (BOOL)configureForStackTemplate;
- (CGSize)tv_sizeThatFits:(CGSize)a3 withContentInset:(UIEdgeInsets)a4;
- (void)setConfigureForStackTemplate:(BOOL)a3;
@end

@implementation _TVListView

- (CGSize)tv_sizeThatFits:(CGSize)a3 withContentInset:(UIEdgeInsets)a4
{
  double bottom = a4.bottom;
  double top = a4.top;
  CGFloat width = a3.width;
  v8 = [(_TVListView *)self delegate];
  v9 = [(_TVListView *)self collectionViewLayout];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
  }
  double v10 = top + bottom;
  objc_msgSend(v9, "itemSize", *(void *)&width);
  double v39 = v11;
  [v9 sectionInset];
  double v42 = v12;
  double v14 = v13;
  [v9 headerReferenceSize];
  double v16 = v15;
  [v9 minimumLineSpacing];
  double v18 = v17;
  char v41 = objc_opt_respondsToSelector();
  char v40 = objc_opt_respondsToSelector();
  char v19 = objc_opt_respondsToSelector();
  char v20 = objc_opt_respondsToSelector();
  if ([(_TVListView *)self numberOfSections] >= 1)
  {
    uint64_t v21 = 0;
    do
    {
      double v22 = v42;
      double v23 = v14;
      if (v40)
      {
        [v8 collectionView:self layout:v9 insetForSectionAtIndex:v21];
        double v22 = v24;
        double v23 = v25;
      }
      double v26 = v16;
      if (v19)
      {
        [v8 collectionView:self layout:v9 referenceSizeForHeaderInSection:v21];
        double v26 = v27;
      }
      double v28 = v18;
      if (v20)
      {
        [v8 collectionView:self layout:v9 minimumLineSpacingForSectionAtIndex:v21];
        double v28 = v29;
      }
      uint64_t v30 = [(_TVListView *)self numberOfItemsInSection:v21];
      uint64_t v31 = v30;
      double v32 = v28 * (double)(v30 - 1);
      if (v30 <= 0) {
        double v32 = 0.0;
      }
      double v10 = v10 + v22 + v23 + v26 + v32;
      if (v41)
      {
        if (v30 >= 1)
        {
          uint64_t v33 = 0;
          do
          {
            v34 = [MEMORY[0x263F088C8] indexPathForItem:v33 inSection:v21];
            [v8 collectionView:self layout:v9 sizeForItemAtIndexPath:v34];
            double v10 = v10 + v35;

            ++v33;
          }
          while (v31 != v33);
        }
      }
      else
      {
        double v10 = v10 + (double)v30 * v39;
      }
      ++v21;
    }
    while (v21 < [(_TVListView *)self numberOfSections]);
  }

  double v36 = v38;
  double v37 = v10;
  result.height = v37;
  result.CGFloat width = v36;
  return result;
}

- (void)setConfigureForStackTemplate:(BOOL)a3
{
  if (self->_configureForStackTemplate != a3)
  {
    self->_BOOL configureForStackTemplate = a3;
    [(_TVCollectionView *)self setScrollEnabled:!a3];
    BOOL configureForStackTemplate = self->_configureForStackTemplate;
    [(_TVListView *)self _setShouldDeriveVisibleBoundsFromContainingScrollView:configureForStackTemplate];
  }
}

- (BOOL)configureForStackTemplate
{
  return self->_configureForStackTemplate;
}

@end