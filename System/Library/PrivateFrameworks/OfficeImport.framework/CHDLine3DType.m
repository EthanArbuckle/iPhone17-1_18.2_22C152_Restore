@interface CHDLine3DType
+ (BOOL)is3DType;
- (CHDLine3DType)initWithChart:(id)a3;
- (int)gapDepth;
- (void)setGapDepth:(int)a3;
@end

@implementation CHDLine3DType

- (CHDLine3DType)initWithChart:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHDLine3DType;
  result = [(CHDLineType *)&v4 initWithChart:a3];
  if (result) {
    result->super.super.mGrouping = 150;
  }
  return result;
}

+ (BOOL)is3DType
{
  return 1;
}

- (int)gapDepth
{
  return self->super.super.mGrouping;
}

- (void)setGapDepth:(int)a3
{
  self->super.super.mGrouping = a3;
}

@end