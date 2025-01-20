@interface CHFitnessAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (CHFitnessAppDelegate)init;
- (CHHistoryDataProvider)historyDataProvider;
- (CHWorkoutFormattingManager)workoutFormattingManager;
- (FIPauseRingsCoordinator)pauseRingsCoordinator;
- (FIUIFormattingManager)fitnessUIFormattingManager;
- (HKHealthStore)healthStore;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation CHFitnessAppDelegate

- (CHFitnessAppDelegate)init
{
  sub_1000508AC();
  return result;
}

- (FIUIFormattingManager)fitnessUIFormattingManager
{
  return (FIUIFormattingManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                          + OBJC_IVAR___CHFitnessAppDelegate_fitnessUIFormattingManager));
}

- (CHWorkoutFormattingManager)workoutFormattingManager
{
  return (CHWorkoutFormattingManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                               + OBJC_IVAR___CHFitnessAppDelegate_workoutFormattingManager));
}

- (FIPauseRingsCoordinator)pauseRingsCoordinator
{
  return (FIPauseRingsCoordinator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                            + OBJC_IVAR___CHFitnessAppDelegate_pauseRingsCoordinator));
}

- (CHHistoryDataProvider)historyDataProvider
{
  return (CHHistoryDataProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                          + OBJC_IVAR___CHFitnessAppDelegate_historyDataProvider));
}

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                  + OBJC_IVAR___CHFitnessAppDelegate_healthStore));
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_1004C7A98(v7, v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return self & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHFitnessAppDelegate_pauseRingsCoordinator);
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = sub_1005AD31C(v9);

  return v12;
}

@end