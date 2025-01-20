@interface OADTableCell
- (BOOL)horzMerge;
- (BOOL)merge:(int)a3;
- (BOOL)vertMerge;
- (OADTableCell)init;
- (id)description;
- (id)properties;
- (id)textBody;
- (int)gridSpan;
- (int)leftColumn;
- (int)rowSpan;
- (int)spanAlongDir:(int)a3;
- (int)topRow;
- (void)setGridSpan:(int)a3;
- (void)setHorzMerge:(BOOL)a3;
- (void)setLeftColumn:(int)a3;
- (void)setProperties:(id)a3;
- (void)setRowSpan:(int)a3;
- (void)setTextBody:(id)a3;
- (void)setTopRow:(int)a3;
- (void)setVertMerge:(BOOL)a3;
@end

@implementation OADTableCell

- (OADTableCell)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADTableCell;
  result = [(OADTableCell *)&v3 init];
  if (result)
  {
    *(void *)&result->mRowSpan = 0x100000001;
    *(_WORD *)&result->mHorzMerge = 0;
    *(void *)&result->mTopRow = -1;
  }
  return result;
}

- (void)setRowSpan:(int)a3
{
  self->mRowSpan = a3;
}

- (void)setGridSpan:(int)a3
{
  self->mGridSpan = a3;
}

- (void)setHorzMerge:(BOOL)a3
{
  self->mHorzMerge = a3;
}

- (void)setVertMerge:(BOOL)a3
{
  self->mVertMerge = a3;
}

- (void)setTextBody:(id)a3
{
}

- (void)setProperties:(id)a3
{
}

- (id)textBody
{
  return self->mTextBody;
}

- (BOOL)horzMerge
{
  return self->mHorzMerge;
}

- (BOOL)vertMerge
{
  return self->mVertMerge;
}

- (int)gridSpan
{
  return self->mGridSpan;
}

- (int)rowSpan
{
  return self->mRowSpan;
}

- (id)properties
{
  return self->mProperties;
}

- (int)spanAlongDir:(int)a3
{
  if (a3) {
    return [(OADTableCell *)self gridSpan];
  }
  else {
    return [(OADTableCell *)self rowSpan];
  }
}

- (BOOL)merge:(int)a3
{
  if (a3) {
    return [(OADTableCell *)self horzMerge];
  }
  else {
    return [(OADTableCell *)self vertMerge];
  }
}

- (int)topRow
{
  return self->mTopRow;
}

- (void)setTopRow:(int)a3
{
  self->mTopRow = a3;
}

- (int)leftColumn
{
  return self->mLeftColumn;
}

- (void)setLeftColumn:(int)a3
{
  self->mLeftColumn = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTableCell;
  v2 = [(OADTableCell *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProperties, 0);
  objc_storeStrong((id *)&self->mTextBody, 0);
}

@end