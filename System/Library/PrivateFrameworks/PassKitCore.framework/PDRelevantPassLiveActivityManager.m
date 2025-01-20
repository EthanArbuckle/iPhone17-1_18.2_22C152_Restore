@interface PDRelevantPassLiveActivityManager
- (BOOL)areActivitiesEnabled;
- (PDRelevantPassLiveActivityManager)init;
- (PDRelevantPassLiveActivityManager)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4;
- (id)updateLiveActivitiesForCandidatePasses:(id)a3;
- (void)endAllActivities;
- (void)passUpdated:(id)a3;
@end

@implementation PDRelevantPassLiveActivityManager

- (PDRelevantPassLiveActivityManager)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (PDRelevantPassLiveActivityManager *)sub_1004EBF90(v5, v6);

  return v7;
}

- (BOOL)areActivitiesEnabled
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for ActivityAuthorization());
  v4 = self;
  id v5 = [v3 init];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  char v6 = dispatch thunk of ActivityAuthorization.areActivitiesEnabled(forBundleId:)();

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)endAllActivities
{
  v2 = self;
  RelevantPassLiveActivityManager.endAllActivities()();
}

- (id)updateLiveActivitiesForCandidatePasses:(id)a3
{
  sub_1004EC210();
  sub_1004ECEE4(&qword_100807FF8, (void (*)(uint64_t))sub_1004EC210);
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = self;
  RelevantPassLiveActivityManager.updateLiveActivities(forCandidatePasses:)(v4);

  swift_bridgeObjectRelease();
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v6.super.isa;
}

- (void)passUpdated:(id)a3
{
  id v4 = a3;
  id v5 = self;
  RelevantPassLiveActivityManager.passUpdated(_:)((PKPass)v4);
}

- (PDRelevantPassLiveActivityManager)init
{
  result = (PDRelevantPassLiveActivityManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end