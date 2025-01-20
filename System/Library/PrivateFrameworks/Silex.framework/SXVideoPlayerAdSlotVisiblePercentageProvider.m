@interface SXVideoPlayerAdSlotVisiblePercentageProvider
- (double)visiblePercentageOfObject:(id)a3;
@end

@implementation SXVideoPlayerAdSlotVisiblePercentageProvider

- (double)visiblePercentageOfObject:(id)a3
{
  uint64_t v3 = [a3 mode];
  double result = 0.0;
  if (v3 == 1) {
    return 1.0;
  }
  return result;
}

@end