@interface EDTwoCellAnchor
- (BOOL)isRelative;
- (EDCellAnchorMarker)from;
- (EDCellAnchorMarker)to;
- (EDTwoCellAnchor)init;
- (id).cxx_construct;
- (int)editAs;
- (void)setEditAs:(int)a3;
- (void)setFrom:(EDCellAnchorMarker)a3;
- (void)setRelative:(BOOL)a3;
- (void)setTo:(EDCellAnchorMarker)a3;
@end

@implementation EDTwoCellAnchor

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (EDTwoCellAnchor)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDTwoCellAnchor;
  result = [(EDTwoCellAnchor *)&v3 init];
  if (result) {
    result->mEditAs = 0;
  }
  return result;
}

- (void)setRelative:(BOOL)a3
{
  self->mIsRelative = a3;
}

- (void)setEditAs:(int)a3
{
  self->mEditAs = a3;
}

- (void)setFrom:(EDCellAnchorMarker)a3
{
  self->mFrom = a3;
}

- (void)setTo:(EDCellAnchorMarker)a3
{
  self->mTo = a3;
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

- (EDCellAnchorMarker)to
{
  p_mTo = &self->mTo;
  uint64_t v3 = *(void *)&self->mTo.columnIndex;
  uint64_t v4 = *(void *)&p_mTo->rowIndex;
  result.rowIndex = v4;
  result.rowAdjustment = *((float *)&v4 + 1);
  result.columnIndex = v3;
  result.columnAdjustment = *((float *)&v3 + 1);
  return result;
}

- (int)editAs
{
  return self->mEditAs;
}

@end