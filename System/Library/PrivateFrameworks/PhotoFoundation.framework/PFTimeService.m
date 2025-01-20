@interface PFTimeService
+ (PFTimeService)defaultTimeService;
- (double)timeIntervalSinceReferenceDate;
- (unint64_t)clock_gettime_nsec_np:(int)a3;
- (void)sleepForTimeInterval:(double)a3;
@end

@implementation PFTimeService

- (unint64_t)clock_gettime_nsec_np:(int)a3
{
  return clock_gettime_nsec_np((clockid_t)a3);
}

+ (PFTimeService)defaultTimeService
{
  if (defaultTimeService_onceToken != -1) {
    dispatch_once(&defaultTimeService_onceToken, &__block_literal_global_192);
  }
  v2 = (void *)defaultTimeService_defaultTimeService;
  return (PFTimeService *)v2;
}

uint64_t __35__PFTimeService_defaultTimeService__block_invoke()
{
  defaultTimeService_defaultTimeService = objc_alloc_init(PFTimeService);
  return MEMORY[0x1F41817F8]();
}

- (void)sleepForTimeInterval:(double)a3
{
}

- (double)timeIntervalSinceReferenceDate
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

@end