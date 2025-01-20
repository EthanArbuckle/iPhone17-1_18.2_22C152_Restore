@interface UNSSummaryServiceAdapter
- (UNSSummaryServiceAdapter)init;
- (id)groupSummariesForNotificationIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation UNSSummaryServiceAdapter

- (UNSSummaryServiceAdapter)init
{
  return (UNSSummaryServiceAdapter *)UNSSummaryServiceAdapter.init()();
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
}

- (id)groupSummariesForNotificationIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  sub_2228D82E8();
  sub_2228D82E8();
  v5 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC12010);
  sub_2228D8438();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end