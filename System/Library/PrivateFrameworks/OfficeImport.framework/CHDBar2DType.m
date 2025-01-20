@interface CHDBar2DType
- (BOOL)isColumn;
- (BOOL)isHorizontal;
- (CHDBar2DType)initWithChart:(id)a3;
- (int)defaultLabelPosition;
- (int)gapWidth;
- (int)overlap;
- (void)setColumn:(BOOL)a3;
- (void)setGapWidth:(int)a3;
- (void)setOverlap:(int)a3;
@end

@implementation CHDBar2DType

- (CHDBar2DType)initWithChart:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHDBar2DType;
  result = [(CHDChartTypeWithGrouping *)&v4 initWithChart:a3];
  if (result)
  {
    *((unsigned char *)&result->super.mGrouping + 4) = 1;
    result->super.mGrouping = 150;
    *((_DWORD *)&result->super.super.mVaryColors + 1) = 0;
    result->mGapWidth = 0;
  }
  return result;
}

- (void)setOverlap:(int)a3
{
  self->mGapWidth = a3;
}

- (void)setGapWidth:(int)a3
{
  if (a3 >= 500) {
    int v3 = 500;
  }
  else {
    int v3 = a3;
  }
  self->super.mGrouping = v3;
}

- (void)setColumn:(BOOL)a3
{
  *((unsigned char *)&self->super.mGrouping + 4) = a3;
}

- (BOOL)isHorizontal
{
  return *((unsigned char *)&self->super.mGrouping + 4) == 0;
}

- (BOOL)isColumn
{
  return *((unsigned char *)&self->super.mGrouping + 4);
}

- (int)overlap
{
  return self->mGapWidth;
}

- (int)gapWidth
{
  return self->super.mGrouping;
}

- (int)defaultLabelPosition
{
  mDefaultDataLabel = self->super.super.mDefaultDataLabel;
  if (mDefaultDataLabel && [(CHDDataLabel *)mDefaultDataLabel position])
  {
    objc_super v4 = self->super.super.mDefaultDataLabel;
    return [(CHDDataLabel *)v4 position];
  }
  else if ([(CHDChartTypeWithGrouping *)self isGroupingStacked])
  {
    return 3;
  }
  else
  {
    return 1;
  }
}

@end