@interface PXFocusTimelineEvent
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)shouldAnimate;
- (CGPoint)location;
- (PXFocusTimelineEvent)initWithTime:(id *)a3 type:(unint64_t)a4;
- (unint64_t)type;
- (void)setLocation:(CGPoint)a3;
- (void)setShouldAnimate:(BOOL)a3;
@end

@implementation PXFocusTimelineEvent

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (unint64_t)type
{
  return self->_type;
}

- (PXFocusTimelineEvent)initWithTime:(id *)a3 type:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PXFocusTimelineEvent;
  CGPoint result = [(PXFocusTimelineEvent *)&v8 init];
  if (result)
  {
    long long v7 = *(_OWORD *)&a3->var0;
    result->_time.epoch = a3->var3;
    *(_OWORD *)&result->_time.value = v7;
    result->_type = a4;
  }
  return result;
}

@end