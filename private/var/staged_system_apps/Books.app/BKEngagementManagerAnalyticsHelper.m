@interface BKEngagementManagerAnalyticsHelper
- (BKEngagementManagerAnalyticsHelper)init;
- (void)collectLocalSignalsAnalyticsWithTracker:(id)a3;
@end

@implementation BKEngagementManagerAnalyticsHelper

- (void)collectLocalSignalsAnalyticsWithTracker:(id)a3
{
  id v4 = a3;
  v5 = self;
  EngagementManagerAnalyticsHelper.collectLocalSignalsAnalytics(with:)((uint64_t)v4);
}

- (BKEngagementManagerAnalyticsHelper)init
{
  result = (BKEngagementManagerAnalyticsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end