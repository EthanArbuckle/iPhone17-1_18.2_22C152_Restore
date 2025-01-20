@interface CHDBar3DSeries
- (CHDBar3DSeries)init;
- (id)shallowCopy;
- (int)shapeType;
- (void)setShapeType:(int)a3;
@end

@implementation CHDBar3DSeries

- (void)setShapeType:(int)a3
{
  *(_DWORD *)(&self->super.mHiddenFlag + 3) = a3;
}

- (id)shallowCopy
{
  v5.receiver = self;
  v5.super_class = (Class)CHDBar3DSeries;
  v3 = [(CHDSeries *)&v5 shallowCopy];
  [v3 setShapeType:*(unsigned int *)(&self->super.mHiddenFlag + 3)];
  return v3;
}

- (CHDBar3DSeries)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHDBar3DSeries;
  result = [(CHDBar3DSeries *)&v3 init];
  if (result) {
    *(_DWORD *)(&result->super.mHiddenFlag + 3) = 0;
  }
  return result;
}

- (int)shapeType
{
  return *(_DWORD *)(&self->super.mHiddenFlag + 3);
}

@end