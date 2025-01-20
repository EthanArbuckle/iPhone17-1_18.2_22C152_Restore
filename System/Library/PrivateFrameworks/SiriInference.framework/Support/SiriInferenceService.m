@interface SiriInferenceService
- (_TtC14siriinferenced20SiriInferenceService)init;
- (void)appSelectedForSearchTermWithRankEventId:(id)a3 selectedAppBundleId:(id)a4 numberOfAppsShown:(int64_t)a5;
- (void)backfillSiriRemembersWithDatabasePath:(id)a3 completionHandler:(id)a4;
- (void)logCoreAnalyticsMetricWithMetricsData:(id)a3;
- (void)overrideDBForIntegrationTestsWithUrl:(id)a3;
- (void)rankAppsForSearchTermWithSearchTerm:(id)a3 maxResults:(int64_t)a4 excludeAppBundleIds:(id)a5 completionHandler:(id)a6;
- (void)saveToSiriRemembersWithInteraction:(id)a3 databasePath:(id)a4 completionHandler:(id)a5;
- (void)searchSiriRemembersV0WithQuery:(id)a3 type:(id)a4 completionHandler:(id)a5;
- (void)waitForBackgroundJobsToFinishWithCompletionHandler:(id)a3;
@end

@implementation SiriInferenceService

- (void)searchSiriRemembersV0WithQuery:(id)a3 type:(id)a4 completionHandler:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v6;
  v14 = self;
  sub_100013ABC(v7, v9, v10, v12, (uint64_t)sub_100016338, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)logCoreAnalyticsMetricWithMetricsData:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100014204();
}

- (void)saveToSiriRemembersWithInteraction:(id)a3 databasePath:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_copy(v8);
  id v11 = a3;
  uint64_t v12 = self;
  sub_100014528((uint64_t)v11, v9, (uint64_t)a4, (uint64_t)v12, (void (**)(void, uint64_t))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)backfillSiriRemembersWithDatabasePath:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_copy(v6);
  uint64_t v9 = self;
  sub_100014DAC(v7, (uint64_t)a3, (uint64_t)v9, (void (**)(void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)overrideDBForIntegrationTestsWithUrl:(id)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_10001515C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)waitForBackgroundJobsToFinishWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1000153A0((uint64_t)v5, (void (**)(void))v4);
  _Block_release(v4);
}

- (void)rankAppsForSearchTermWithSearchTerm:(id)a3 maxResults:(int64_t)a4 excludeAppBundleIds:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = _Block_copy(a6);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v8;
  v14 = self;
  sub_10001546C(v9, v11, a4, v12, (uint64_t)sub_100016330, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)appSelectedForSearchTermWithRankEventId:(id)a3 selectedAppBundleId:(id)a4 numberOfAppsShown:(int64_t)a5
{
  uint64_t v7 = sub_100006B58((uint64_t *)&unk_100025F70);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for UUID();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = type metadata accessor for UUID();
    uint64_t v11 = 1;
  }
  sub_100009554((uint64_t)v9, v11, 1, v10);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = self;
  sub_100015A40();

  swift_bridgeObjectRelease();
  sub_1000162A4((uint64_t)v9, (uint64_t *)&unk_100025F70);
}

- (_TtC14siriinferenced20SiriInferenceService)init
{
  return (_TtC14siriinferenced20SiriInferenceService *)sub_100015BCC();
}

@end