@interface CHDBar3DType
+ (BOOL)is3DType;
+ (id)stringWithShapeType:(int)a3;
- (CHDBar3DType)initWithChart:(id)a3;
- (int)gapDepth;
- (int)shapeType;
- (void)setGapDepth:(int)a3;
- (void)setShapeType:(int)a3;
@end

@implementation CHDBar3DType

- (CHDBar3DType)initWithChart:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHDBar3DType;
  result = [(CHDBar2DType *)&v4 initWithChart:a3];
  if (result)
  {
    *(_DWORD *)&result->super.mColumn = 150;
    result->super.mOverlap = 0;
  }
  return result;
}

- (void)setGapDepth:(int)a3
{
  *(_DWORD *)&self->super.mColumn = a3;
}

- (void)setShapeType:(int)a3
{
  self->super.mOverlap = a3;
}

- (int)shapeType
{
  return self->super.mOverlap;
}

+ (BOOL)is3DType
{
  return 1;
}

- (int)gapDepth
{
  return *(_DWORD *)&self->super.mColumn;
}

+ (id)stringWithShapeType:(int)a3
{
  if ((a3 - 1) > 4) {
    return @"box";
  }
  else {
    return off_264D67C10[a3 - 1];
  }
}

@end