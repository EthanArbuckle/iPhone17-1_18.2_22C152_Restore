@interface CHWorkoutDetailAnalyticsTracker
+ (CHWorkoutDetailAnalyticsTracker)sharedInstance;
- (CHWorkoutDetailAnalyticsTracker)init;
- (id)workoutAnalyticsHandlerFor:(id)a3 workoutActivity:(id)a4;
- (void)applicationWillTerminateWithNotification:(id)a3;
- (void)sendEventWith:(id)a3;
- (void)startTrackingWorkout:(id)a3 workoutActivity:(id)a4;
- (void)stopTrackingWorkout:(id)a3 workoutActivity:(id)a4;
@end

@implementation CHWorkoutDetailAnalyticsTracker

+ (CHWorkoutDetailAnalyticsTracker)sharedInstance
{
  if (qword_10094B120 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100998900;

  return (CHWorkoutDetailAnalyticsTracker *)v2;
}

- (CHWorkoutDetailAnalyticsTracker)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutDetailAnalyticsTracker_trackingWorkouts) = (Class)_swiftEmptyDictionarySingleton;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for WorkoutDetailAnalyticsTracker();
  v2 = [(CHWorkoutDetailAnalyticsTracker *)&v7 init];
  v3 = self;
  v4 = v2;
  id v5 = [v3 defaultCenter];
  [v5 addObserver:v4 selector:"applicationWillTerminateWithNotification:" name:UIApplicationWillTerminateNotification object:0];

  return v4;
}

- (void)applicationWillTerminateWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1006F312C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)sendEventWith:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1006F3D38();
}

- (void)startTrackingWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1006F359C(v6, a4);
}

- (void)stopTrackingWorkout:(id)a3 workoutActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1006F3888(v6, a4);
}

- (id)workoutAnalyticsHandlerFor:(id)a3 workoutActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  uint64_t v9 = sub_1006F3ACC(v6, a4);

  return v9;
}

- (void).cxx_destruct
{
}

@end