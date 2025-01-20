@interface CSTimeManager
+ (unint64_t)SPU_estimate_current_timestamp;
@end

@implementation CSTimeManager

+ (unint64_t)SPU_estimate_current_timestamp
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3E8;
}

@end