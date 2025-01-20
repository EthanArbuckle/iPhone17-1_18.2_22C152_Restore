@interface AVAssetTrack(RCAdditions)
- (double)rc_timeRange;
@end

@implementation AVAssetTrack(RCAdditions)

- (double)rc_timeRange
{
  [a1 timeRange];
  return RCTimeRangeFromCMTimeRange((uint64_t)&v2);
}

@end