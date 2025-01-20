@interface WOEffortBridges
+ (NSString)didUpdateDemoOverrideEffortValues;
+ (id)demoExertionForWorkout:(id)a3;
+ (id)makeHostingControllerWithStartingEffort:(id)a3 workoutActivityType:(id)a4 showCurrentWorkloadButton:(BOOL)a5 cancel:(id)a6 completion:(id)a7;
+ (void)fetchExertionForWorkout:(id)a3 workoutActivity:(id)a4 healthStore:(id)a5 completion:(id)a6;
+ (void)saveWithQuantity:(id)a3 effortSampleCollection:(id)a4 workout:(id)a5 workoutActivity:(id)a6 healthStore:(id)a7 canSendAnalytics:(BOOL)a8;
+ (void)sendDidViewTrainingLoadAnalyticsFromURL:(id)a3;
- (WOEffortBridges)init;
@end

@implementation WOEffortBridges

+ (id)makeHostingControllerWithStartingEffort:(id)a3 workoutActivityType:(id)a4 showCurrentWorkloadButton:(BOOL)a5 cancel:(id)a6 completion:(id)a7
{
  v10 = _Block_copy(a6);
  v11 = _Block_copy(a7);
  *(void *)(swift_allocObject() + 16) = v10;
  *(void *)(swift_allocObject() + 16) = v11;
  type metadata accessor for EffortUIController();
  id v12 = a3;
  id v13 = a4;
  v14 = (void *)static EffortUIController.makeHostingController(shouldEmbedInNavStack:startingEffort:workoutActivityType:shouldShowWorkoutGlyph:showCurrentWorkloadButton:cancel:completion:)();

  swift_release();
  swift_release();

  return v14;
}

+ (void)saveWithQuantity:(id)a3 effortSampleCollection:(id)a4 workout:(id)a5 workoutActivity:(id)a6 healthStore:(id)a7 canSendAnalytics:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  sub_100245FB0((uint64_t)a3, a4, (uint64_t)v16, (uint64_t)a6, (uint64_t)v18, a8);
}

+ (void)fetchExertionForWorkout:(id)a3 workoutActivity:(id)a4 healthStore:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  type metadata accessor for EffortUtilities();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_100245F68;
  *(void *)(v11 + 24) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  swift_retain();
  static EffortUtilities.fetchExertionCollection(forWorkout:activity:healthStore:completion:)();

  swift_release();

  swift_release();
}

+ (id)demoExertionForWorkout:(id)a3
{
  type metadata accessor for EffortUtilities();
  id v4 = a3;
  v5 = (void *)static EffortUtilities.fetchDemoExertion(forWorkout:)();

  return v5;
}

+ (void)sendDidViewTrainingLoadAnalyticsFromURL:(id)a3
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for EffortUtilities();
  static EffortUtilities.sendDidViewTrainingLoadAnalytics(from:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

+ (NSString)didUpdateDemoOverrideEffortValues
{
  if (qword_10094A6E8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100997888;

  return (NSString *)v2;
}

- (WOEffortBridges)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EffortBridges();
  return [(WOEffortBridges *)&v3 init];
}

@end