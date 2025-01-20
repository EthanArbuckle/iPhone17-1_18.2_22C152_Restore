@interface CLPPressure
- (id)initWithPressure:(double)a3 stdDeviation:(double)a4 timestamp:(double)a5;
@end

@implementation CLPPressure

- (id)initWithPressure:(double)a3 stdDeviation:(double)a4 timestamp:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLPPressure;
  id result = [(CLPPressure *)&v9 init];
  if (result)
  {
    *(double *)((char *)result + OBJC_IVAR___CLPPressure__value) = a3;
    *(double *)((char *)result + OBJC_IVAR___CLPPressure__std) = a4;
    *(double *)((char *)result + OBJC_IVAR___CLPPressure__timestamp) = a5;
  }
  return result;
}

@end