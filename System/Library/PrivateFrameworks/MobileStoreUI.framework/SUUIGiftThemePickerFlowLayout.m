@interface SUUIGiftThemePickerFlowLayout
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (int64_t)currentPage;
- (void)setCurrentPage:(int64_t)a3;
@end

@implementation SUUIGiftThemePickerFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double currentPage = (double)self->_currentPage;
  v4 = [(SUUIGiftThemePickerFlowLayout *)self collectionView];
  [v4 frame];
  double v6 = v5 * currentPage;

  double v7 = 0.0;
  double v8 = v6;
  result.y = v7;
  result.x = v8;
  return result;
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentPage:(int64_t)a3
{
  self->_double currentPage = a3;
}

@end