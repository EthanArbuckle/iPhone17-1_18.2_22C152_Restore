@interface EDOneCellAnchor
- (BOOL)isRelative;
- (CGSize)size;
- (EDCellAnchorMarker)from;
- (id).cxx_construct;
- (void)setFrom:(EDCellAnchorMarker)a3;
- (void)setRelative:(BOOL)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation EDOneCellAnchor

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)setRelative:(BOOL)a3
{
  self->mIsRelative = a3;
}

- (void)setFrom:(EDCellAnchorMarker)a3
{
  self->mFrom = a3;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

- (EDCellAnchorMarker)from
{
  p_mFrom = &self->mFrom;
  uint64_t v3 = *(void *)&self->mFrom.columnIndex;
  uint64_t v4 = *(void *)&p_mFrom->rowIndex;
  result.rowIndex = v4;
  result.rowAdjustment = *((float *)&v4 + 1);
  result.columnIndex = v3;
  result.columnAdjustment = *((float *)&v3 + 1);
  return result;
}

- (BOOL)isRelative
{
  return self->mIsRelative;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end