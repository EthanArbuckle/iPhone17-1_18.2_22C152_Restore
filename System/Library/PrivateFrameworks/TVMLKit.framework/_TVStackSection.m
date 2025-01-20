@interface _TVStackSection
- (TVRowMetrics)compoundRowMetrics;
- (UIEdgeInsets)sectionSpacing;
- (UIEdgeInsets)showcaseSectionSpacing;
- (double)sectionHeight;
- (double)showcaseSectionHeight;
- (id)debugDescription;
- (int64_t)firstItemRowIndex;
- (int64_t)firstRowIndex;
- (int64_t)rowCount;
- (void)setCompoundRowMetrics:(TVRowMetrics *)a3;
- (void)setFirstItemRowIndex:(int64_t)a3;
- (void)setFirstRowIndex:(int64_t)a3;
- (void)setRowCount:(int64_t)a3;
- (void)setSectionHeight:(double)a3;
- (void)setSectionSpacing:(UIEdgeInsets)a3;
- (void)setShowcaseSectionHeight:(double)a3;
- (void)setShowcaseSectionSpacing:(UIEdgeInsets)a3;
@end

@implementation _TVStackSection

- (id)debugDescription
{
  v3 = NSString;
  double sectionHeight = self->_sectionHeight;
  v5 = objc_msgSend(MEMORY[0x263F08D40], "valueWithUIEdgeInsets:", self->_sectionSpacing.top, self->_sectionSpacing.left, self->_sectionSpacing.bottom, self->_sectionSpacing.right);
  v6 = [v3 stringWithFormat:@"_TVStackSection [%p] sectionHeight [%f] sectionSpacing [%@] firstRowIndex [%ld] rowCount [%ld] firstItemRowIndex [%ld]", self, *(void *)&sectionHeight, v5, self->_firstRowIndex, self->_rowCount, self->_firstItemRowIndex];

  return v6;
}

- (double)sectionHeight
{
  return self->_sectionHeight;
}

- (void)setSectionHeight:(double)a3
{
  self->_double sectionHeight = a3;
}

- (UIEdgeInsets)sectionSpacing
{
  double top = self->_sectionSpacing.top;
  double left = self->_sectionSpacing.left;
  double bottom = self->_sectionSpacing.bottom;
  double right = self->_sectionSpacing.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSectionSpacing:(UIEdgeInsets)a3
{
  self->_sectionSpacing = a3;
}

- (TVRowMetrics)compoundRowMetrics
{
  $3BE62F1B3D8F3BC4B4EA8287E388A583 v3 = *($3BE62F1B3D8F3BC4B4EA8287E388A583 *)&self[2].rowType;
  retstr->rowInset = self[1].rowMargin;
  retstr->$3BE62F1B3D8F3BC4B4EA8287E388A583 rowInsetAlt = v3;
  retstr->rowMargin = self[2].rowPadding;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowInsetAlt = self[1].rowInsetAlt;
  *($3BE62F1B3D8F3BC4B4EA8287E388A583 *)&retstr->rowType = self[1].rowInset;
  retstr->rowPadding = rowInsetAlt;
  return self;
}

- (void)setCompoundRowMetrics:(TVRowMetrics *)a3
{
  *(_OWORD *)&self->_compoundRowMetrics.rowType = *(_OWORD *)&a3->rowType;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowPadding = a3->rowPadding;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowInset = a3->rowInset;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowMargin = a3->rowMargin;
  self->_compoundRowMetrics.$3BE62F1B3D8F3BC4B4EA8287E388A583 rowInsetAlt = a3->rowInsetAlt;
  self->_compoundRowMetrics.$3BE62F1B3D8F3BC4B4EA8287E388A583 rowMargin = rowMargin;
  self->_compoundRowMetrics.$3BE62F1B3D8F3BC4B4EA8287E388A583 rowPadding = rowPadding;
  self->_compoundRowMetrics.$3BE62F1B3D8F3BC4B4EA8287E388A583 rowInset = rowInset;
}

- (double)showcaseSectionHeight
{
  return self->_showcaseSectionHeight;
}

- (void)setShowcaseSectionHeight:(double)a3
{
  self->_showcaseSectionHeight = a3;
}

- (UIEdgeInsets)showcaseSectionSpacing
{
  double top = self->_showcaseSectionSpacing.top;
  double left = self->_showcaseSectionSpacing.left;
  double bottom = self->_showcaseSectionSpacing.bottom;
  double right = self->_showcaseSectionSpacing.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setShowcaseSectionSpacing:(UIEdgeInsets)a3
{
  self->_showcaseSectionSpacing = a3;
}

- (int64_t)firstRowIndex
{
  return self->_firstRowIndex;
}

- (void)setFirstRowIndex:(int64_t)a3
{
  self->_firstRowIndex = a3;
}

- (int64_t)rowCount
{
  return self->_rowCount;
}

- (void)setRowCount:(int64_t)a3
{
  self->_rowCount = a3;
}

- (int64_t)firstItemRowIndex
{
  return self->_firstItemRowIndex;
}

- (void)setFirstItemRowIndex:(int64_t)a3
{
  self->_firstItemRowIndex = a3;
}

@end