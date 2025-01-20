@interface TSApplicationBackgroundFetchScheduler
- (TSApplicationBackgroundFetchScheduler)init;
- (TSApplicationBackgroundFetchScheduler)initWithApplication:(id)a3;
- (void)setMinimumBackgroundFetchInterval:(double)a3;
@end

@implementation TSApplicationBackgroundFetchScheduler

- (TSApplicationBackgroundFetchScheduler)initWithApplication:(id)a3
{
  return (TSApplicationBackgroundFetchScheduler *)ApplicationBackgroundFetchScheduler.init(application:)((uint64_t)a3);
}

- (void)setMinimumBackgroundFetchInterval:(double)a3
{
  v4 = self;
  ApplicationBackgroundFetchScheduler.setMinimumBackgroundFetchInterval(_:)(a3);
}

- (TSApplicationBackgroundFetchScheduler)init
{
}

- (void).cxx_destruct
{
}

@end