@interface SKUIGiftThemePickerFlowLayout
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (int64_t)currentPage;
- (void)setCurrentPage:(int64_t)a3;
@end

@implementation SKUIGiftThemePickerFlowLayout

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftThemePickerFlowLayout targetContentOffsetForProposedContentOffset:]();
  }
  double currentPage = (double)self->_currentPage;
  v5 = [(SKUIGiftThemePickerFlowLayout *)self collectionView];
  [v5 frame];
  double v7 = v6 * currentPage;

  double v8 = 0.0;
  double v9 = v7;
  result.y = v8;
  result.x = v9;
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

- (void)targetContentOffsetForProposedContentOffset:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftThemePickerFlowLayout targetContentOffsetForProposedContentOffset:]";
}

@end