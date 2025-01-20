@interface ActivitySharingFriendDetailActivitySummaryProvider
- (BOOL)isStandaloneForCacheIndex:(int64_t)a3;
- (_TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider)init;
- (id)activitySummaryForCacheIndex:(int64_t)a3;
- (int64_t)earliestActivitySummaryIndex;
- (int64_t)fitnessStartOfWeekOffset;
- (int64_t)latestActivitySummaryIndex;
- (int64_t)numberOfActivitySummaries;
@end

@implementation ActivitySharingFriendDetailActivitySummaryProvider

- (id)activitySummaryForCacheIndex:(int64_t)a3
{
  v4 = self;
  id v5 = sub_100556DE4(a3);

  return v5;
}

- (int64_t)numberOfActivitySummaries
{
  v2 = self;
  id v3 = sub_100556FB8();

  return (int64_t)v3;
}

- (int64_t)earliestActivitySummaryIndex
{
  v2 = self;
  int64_t v3 = sub_1005570C4();

  return v3;
}

- (int64_t)latestActivitySummaryIndex
{
  v2 = self;
  int64_t v3 = sub_100557110();

  return v3;
}

- (int64_t)fitnessStartOfWeekOffset
{
  v2 = self;
  int64_t v3 = sub_1005572E8();

  return v3;
}

- (BOOL)isStandaloneForCacheIndex:(int64_t)a3
{
  id v5 = objc_allocWithZone((Class)NSNumber);
  v6 = self;
  id v7 = [v5 initWithLongLong:a3];
  LOBYTE(v5) = [*(id *)((char *)&v6->super.isa+ OBJC_IVAR____TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider_friend) estimatedIsStandaloneForSnapshotIndex:v7];

  return (char)v5;
}

- (_TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider)init
{
  result = (_TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider_friend));
  int64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider_pauseRingsCoordinator);
}

@end