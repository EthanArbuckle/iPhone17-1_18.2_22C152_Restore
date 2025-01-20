@interface TSTTableHeaderInfo
- (TSTCellStyle)cellStyle;
- (TSWPParagraphStyle)textStyle;
- (double)size;
- (id)description;
- (unsigned)hidingState;
- (unsigned)numberOfCells;
- (void)dealloc;
- (void)setCellStyle:(id)a3;
- (void)setHidingState:(unsigned __int8)a3;
- (void)setNumberOfCells:(unsigned __int16)a3;
- (void)setSize:(double)a3;
- (void)setTextStyle:(id)a3;
@end

@implementation TSTTableHeaderInfo

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableHeaderInfo;
  [(TSTTableHeaderInfo *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@:%p size %f count %hu hiding 0x%02hx cstyle %p tstyle %p", NSStringFromClass(v4), self, *(void *)&self->mSize, self->mNumberOfCells, self->mHidingState, self->mCellStyle, self->mTextStyle];
}

- (TSTCellStyle)cellStyle
{
  return self->mCellStyle;
}

- (void)setCellStyle:(id)a3
{
}

- (TSWPParagraphStyle)textStyle
{
  return self->mTextStyle;
}

- (void)setTextStyle:(id)a3
{
}

- (double)size
{
  return self->mSize;
}

- (void)setSize:(double)a3
{
  self->mSize = a3;
}

- (unsigned)hidingState
{
  return self->mHidingState;
}

- (void)setHidingState:(unsigned __int8)a3
{
  self->mHidingState = a3;
}

- (unsigned)numberOfCells
{
  return self->mNumberOfCells;
}

- (void)setNumberOfCells:(unsigned __int16)a3
{
  self->mNumberOfCells = a3;
}

@end