@interface HKWorkout
+ (id)kIntervalWorkoutStepDistanceGoalAchievedDateKey;
+ (id)kIntervalWorkoutStepDistanceGoalAchievedDurationKey;
+ (id)kIntervalWorkoutStepMetadataKey;
+ (id)kIntervalWorkoutStepSuccessful;
+ (id)kRaceWorkoutAveragePaceOnRouteMetadataKey;
+ (id)kRaceWorkoutReferenceWorkoutUUIDMetadataKey;
+ (id)kTrackTrackIdentifierMetadataKey;
- (BOOL)didWinRace;
- (BOOL)hasChartableMetrics;
- (BOOL)isIntervalWorkout;
- (BOOL)isMultiSportWorkout;
- (BOOL)isPacerWorkout;
- (BOOL)isRaceWorkout;
- (BOOL)isTrackWorkout;
- (BOOL)serializedConfigurationContainsRoute;
- (BOOL)shouldShowRaceResults;
- (BOOL)shouldUseCircularGradientImage;
- (BOOL)supportsTrackWorkout;
- (NSArray)downhillRunEventsBridge;
- (NSData)serializedConfigurationRouteSnapshotData;
- (NSNumber)trackId;
- (double)elapsedTime;
- (double)raceTime;
- (double)raceWorkoutDisplayDistance;
- (double)raceWorkoutReferencePace;
- (id)displayDetail:(id)a3;
- (id)expectedIntervalDistanceForStepKeyPath:(id)a3;
- (id)expectedIntervalDurationForStepKeyPath:(id)a3;
- (id)requiredDistanceForIntervalTimeGoalForStepKeyPath:(id)a3;
- (id)serializedConfigurationDataIncludingRoute:(BOOL)a3;
- (id)serializedConfigurationWithEmbedding:(id)a3 snapshot:(id)a4;
- (void)makeDownhillRunBridgesWithHealthStore:(id)a3 completion:(id)a4;
@end

@implementation HKWorkout

- (void)makeDownhillRunBridgesWithHealthStore:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_100386924;
  *(void *)(v8 + 24) = v7;
  id v9 = a3;
  v10 = self;
  swift_retain();
  HKWorkout.makeDownhillRuns(healthStore:completion:)();

  swift_release();

  swift_release();
}

- (NSArray)downhillRunEventsBridge
{
  v2 = self;
  id v3 = [(HKWorkout *)v2 downhillRunEvents];
  if (v3)
  {
    v4 = v3;
    sub_100182AC4();
    static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {

    v5.super.isa = 0;
  }

  return (NSArray *)v5.super.isa;
}

+ (id)kIntervalWorkoutStepMetadataKey
{
  return sub_100319EC0((uint64_t)a1, (uint64_t)a2, &qword_10094AB20);
}

+ (id)kIntervalWorkoutStepSuccessful
{
  return sub_100319EC0((uint64_t)a1, (uint64_t)a2, &qword_10094AB28);
}

+ (id)kRaceWorkoutAveragePaceOnRouteMetadataKey
{
  return sub_100319EC0((uint64_t)a1, (uint64_t)a2, &qword_10094AB30);
}

+ (id)kRaceWorkoutReferenceWorkoutUUIDMetadataKey
{
  return sub_100319EC0((uint64_t)a1, (uint64_t)a2, &qword_10094AB38);
}

+ (id)kTrackTrackIdentifierMetadataKey
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

+ (id)kIntervalWorkoutStepDistanceGoalAchievedDateKey
{
  return sub_100319EC0((uint64_t)a1, (uint64_t)a2, &qword_10094AB40);
}

+ (id)kIntervalWorkoutStepDistanceGoalAchievedDurationKey
{
  return sub_100319EC0((uint64_t)a1, (uint64_t)a2, &qword_10094AB48);
}

- (BOOL)hasChartableMetrics
{
  NSString v2 = self;
  id v3 = [(HKWorkout *)v2 fiui_activityType];
  if (v3)
  {
    v4 = v3;
    NSArray v5 = sub_100651C40();

    uint64_t v6 = v5[2];
    swift_bridgeObjectRelease();
    LOBYTE(v3) = v6 != 0;
  }
  else
  {
    __break(1u);
  }
  return (char)v3;
}

- (double)elapsedTime
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v9 = (char *)&v17 - v8;
  v10 = self;
  id v11 = [(HKWorkout *)v10 endDate];
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  id v12 = [(HKWorkout *)v10 startDate];
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  Date.timeIntervalSince(_:)();
  double v14 = v13;
  v15 = *(void (**)(char *, uint64_t))(v4 + 8);
  v15(v6, v3);
  v15(v9, v3);

  return v14;
}

- (BOOL)shouldUseCircularGradientImage
{
  NSString v2 = self;
  char v3 = sub_100416740();

  return v3 & 1;
}

- (BOOL)isIntervalWorkout
{
  NSString v2 = self;
  BOOL v3 = sub_100416B6C();

  return v3;
}

- (BOOL)isRaceWorkout
{
  NSString v2 = self;
  char v3 = sub_100417804((unsigned int *)&enum case for ConfigurationType.race(_:));

  return v3 & 1;
}

- (BOOL)shouldShowRaceResults
{
  NSString v2 = self;
  BOOL v3 = sub_100417140();

  return v3;
}

- (double)raceTime
{
  NSString v2 = self;
  double v3 = sub_100417330();

  return v3;
}

- (BOOL)didWinRace
{
  NSString v2 = self;
  BOOL v3 = sub_100417634();

  return v3;
}

- (BOOL)isPacerWorkout
{
  NSString v2 = self;
  char v3 = sub_100417804((unsigned int *)&enum case for ConfigurationType.pacer(_:));

  return v3 & 1;
}

- (BOOL)isMultiSportWorkout
{
  return (id)[(HKWorkout *)self workoutActivityType] == (id)82;
}

- (double)raceWorkoutReferencePace
{
  NSString v2 = self;
  double v3 = sub_100417D90((double (*)(void))&RaceWorkoutConfiguration.referenceRouteAveragePace.getter);

  return v3;
}

- (double)raceWorkoutDisplayDistance
{
  NSString v2 = self;
  double v3 = sub_100417D90((double (*)(void))&RaceWorkoutConfiguration.lastWorkoutDistance.getter);

  return v3;
}

- (BOOL)supportsTrackWorkout
{
  NSString v2 = self;
  unsigned __int8 v3 = sub_100417EE4();

  return v3 & 1;
}

- (BOOL)isTrackWorkout
{
  NSString v2 = self;
  if ([(HKWorkout *)v2 supportsTrackWorkout])
  {
    unsigned __int8 v3 = [(HKWorkout *)v2 trackId];

    if (!v3) {
      return 0;
    }
    BOOL v4 = 1;
    NSString v2 = (HKWorkout *)v3;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSNumber)trackId
{
  NSString v2 = self;
  unsigned __int8 v3 = (void *)sub_100418074();

  return (NSNumber *)v3;
}

- (id)serializedConfigurationDataIncludingRoute:(BOOL)a3
{
  BOOL v4 = self;
  uint64_t v5 = sub_1004181A0(a3);
  unint64_t v7 = v6;

  if (v7 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100182378(v5, v7);
  }

  return isa;
}

- (BOOL)serializedConfigurationContainsRoute
{
  NSString v2 = self;
  char v3 = sub_1004183FC();

  return v3 & 1;
}

- (NSData)serializedConfigurationRouteSnapshotData
{
  NSString v2 = self;
  char v3 = sub_100418640();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100182378((uint64_t)v3, v5);
  }

  return (NSData *)isa;
}

- (id)serializedConfigurationWithEmbedding:(id)a3 snapshot:(id)a4
{
  unint64_t v4 = a4;
  if (a4)
  {
    id v7 = a3;
    uint64_t v8 = self;
    id v9 = v4;
    unint64_t v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = a3;
    double v13 = self;
    unint64_t v11 = 0xF000000000000000;
  }
  uint64_t v14 = sub_1004187D8(a3, (uint64_t)v4, v11);
  unint64_t v16 = v15;
  sub_100182378((uint64_t)v4, v11);

  if (v16 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100182378(v14, v16);
  }

  return isa;
}

- (id)displayDetail:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_100418D70(v4);
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (id)expectedIntervalDistanceForStepKeyPath:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [(HKWorkout *)v7 requiredDistanceForIntervalTimeGoalForStepKeyPath:v8];

  if (!v9) {
    id v9 = sub_100419AE8(v4, v6, (void *)1);
  }

  swift_bridgeObjectRelease();

  return v9;
}

- (id)expectedIntervalDurationForStepKeyPath:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  id v8 = sub_100419AE8(v4, v6, (void *)2);

  swift_bridgeObjectRelease();

  return v8;
}

- (id)requiredDistanceForIntervalTimeGoalForStepKeyPath:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = self;
  id v5 = sub_100419F1C();

  swift_bridgeObjectRelease();

  return v5;
}

@end