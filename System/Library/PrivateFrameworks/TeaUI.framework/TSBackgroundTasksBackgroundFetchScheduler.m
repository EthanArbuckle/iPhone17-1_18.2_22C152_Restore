@interface TSBackgroundTasksBackgroundFetchScheduler
- (TSBackgroundTasksBackgroundFetchScheduler)init;
- (TSBackgroundTasksBackgroundFetchScheduler)initWithApplication:(id)a3 taskIdentifier:(id)a4;
- (void)prepareForUseWithApplicationDelegate:(id)a3;
- (void)setMinimumBackgroundFetchInterval:(double)a3;
@end

@implementation TSBackgroundTasksBackgroundFetchScheduler

- (TSBackgroundTasksBackgroundFetchScheduler)initWithApplication:(id)a3 taskIdentifier:(id)a4
{
  sub_1B61B20F0();
  id v5 = a3;
  return (TSBackgroundTasksBackgroundFetchScheduler *)BackgroundTasksBackgroundFetchScheduler.init(application:taskIdentifier:)();
}

- (void)setMinimumBackgroundFetchInterval:(double)a3
{
  v4 = self;
  BackgroundTasksBackgroundFetchScheduler.setMinimumBackgroundFetchInterval(_:)(a3);
}

- (void)prepareForUseWithApplicationDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  BackgroundTasksBackgroundFetchScheduler.prepareForUse(with:)((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (TSBackgroundTasksBackgroundFetchScheduler)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end