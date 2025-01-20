@interface CHDArea3DType
+ (BOOL)is3DType;
- (CHDArea3DType)initWithChart:(id)a3;
- (int)gapDepth;
- (void)setGapDepth:(int)a3;
@end

@implementation CHDArea3DType

- (CHDArea3DType)initWithChart:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHDArea3DType;
  result = [(CHDArea2DType *)&v4 initWithChart:a3];
  if (result) {
    result->super.super.mGrouping = 150;
  }
  return result;
}

+ (BOOL)is3DType
{
  return 1;
}

- (void)setGapDepth:(int)a3
{
  self->super.super.mGrouping = a3;
}

- (int)gapDepth
{
  return self->super.super.mGrouping;
}

@end