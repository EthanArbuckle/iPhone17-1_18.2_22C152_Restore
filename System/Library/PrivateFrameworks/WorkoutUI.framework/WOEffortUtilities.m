@interface WOEffortUtilities
+ (id)analyticsTaskIdentifierWithWorkout:(id)a3;
+ (id)analyticsTaskIdentifierWithWorkoutActivity:(id)a3;
+ (id)fetchDemoExertionForWorkout:(id)a3;
+ (void)fetchExertionCollectionForWorkout:(id)a3 activity:(id)a4 healthStore:(id)a5 completion:(id)a6;
+ (void)fetchExertionForWorkout:(id)a3 activity:(id)a4 healthStore:(id)a5 completion:(id)a6;
+ (void)saveWithQuantity:(id)a3 workout:(id)a4 workoutActivity:(id)a5 healthStore:(id)a6;
+ (void)saveWithQuantity:(id)a3 workout:(id)a4 workoutActivity:(id)a5 healthStore:(id)a6 completion:(id)a7;
+ (void)sendDidViewTrainingLoadAnalyticsFrom:(id)a3;
+ (void)sendPostWorkoutAnalyticsWithWorkout:(id)a3 perceivedEffortQuantity:(id)a4 estimatedEffortQuantity:(id)a5 healthStore:(id)a6;
+ (void)sendPostWorkoutAnalyticsWithWorkoutActivity:(id)a3 perceivedEffortQuantity:(id)a4 estimatedEffortQuantity:(id)a5 healthStore:(id)a6;
+ (void)sendUpdatedEffortAnalyticsEventWithWorkout:(id)a3 workoutActivity:(id)a4 perceivedEffortQuantity:(id)a5 estimatedEffortQuantity:(id)a6;
- (WOEffortUtilities)init;
@end

@implementation WOEffortUtilities

+ (void)saveWithQuantity:(id)a3 workout:(id)a4 workoutActivity:(id)a5 healthStore:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  _s9WorkoutUI15EffortUtilitiesC4save8quantity7workout0G8Activity11healthStore10completionySo10HKQuantityCSg_So9HKWorkoutCSo0mH0CSgSo08HKHealthJ0CySb_s5Error_pSgtcSgtFZ_0(a3, v11, a5, v13, (void (*)(uint64_t, void))nullsub_1, 0);
}

+ (void)saveWithQuantity:(id)a3 workout:(id)a4 workoutActivity:(id)a5 healthStore:(id)a6 completion:(id)a7
{
  id v11 = (void (*)(uint64_t, void))_Block_copy(a7);
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    id v11 = (void (*)(uint64_t, void))sub_261AD5938;
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  _s9WorkoutUI15EffortUtilitiesC4save8quantity7workout0G8Activity11healthStore10completionySo10HKQuantityCSg_So9HKWorkoutCSo0mH0CSgSo08HKHealthJ0CySb_s5Error_pSgtcSgtFZ_0(a3, v14, a5, v16, v11, v12);
  sub_261AD5928((uint64_t)v11);
}

+ (id)fetchDemoExertionForWorkout:(id)a3
{
  id v3 = a3;
  v4 = _s9WorkoutUI15EffortUtilitiesC17fetchDemoExertion03forA0So10HKQuantityCSgSo9HKWorkoutC_tFZ_0(v3);

  return v4;
}

+ (void)fetchExertionForWorkout:(id)a3 activity:(id)a4 healthStore:(id)a5 completion:(id)a6
{
}

+ (void)fetchExertionCollectionForWorkout:(id)a3 activity:(id)a4 healthStore:(id)a5 completion:(id)a6
{
}

- (WOEffortUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EffortUtilities();
  return [(WOEffortUtilities *)&v3 init];
}

+ (id)analyticsTaskIdentifierWithWorkout:(id)a3
{
  id v3 = a3;
  _s9WorkoutUI15EffortUtilitiesC23analyticsTaskIdentifier7workoutSSSo9HKWorkoutC_tFZ_0(v3);

  v4 = (void *)sub_261B8F0B8();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)analyticsTaskIdentifierWithWorkoutActivity:(id)a3
{
  uint64_t v4 = sub_261B8AE38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  id v9 = objc_msgSend(v8, sel_UUID);
  sub_261B8AE18();

  sub_261B8ADE8();
  v12[0] = 0xD000000000000016;
  v12[1] = 0x8000000261BA3840;
  sub_261B8F1C8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  id v10 = (void *)sub_261B8F0B8();
  swift_bridgeObjectRelease();
  return v10;
}

+ (void)sendDidViewTrainingLoadAnalyticsFrom:(id)a3
{
  uint64_t v3 = sub_261B8ABF8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261B8ABE8();
  _s9WorkoutUI15EffortUtilitiesC32sendDidViewTrainingLoadAnalytics4fromy10Foundation3URLV_tFZ_0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

+ (void)sendPostWorkoutAnalyticsWithWorkout:(id)a3 perceivedEffortQuantity:(id)a4 estimatedEffortQuantity:(id)a5 healthStore:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_msgSend(v9, sel_workoutActivityType);
  char IsIndoor = _HKWorkoutIsIndoor(v9);
  id v15 = v10;
  id v16 = v11;
  v19[0] = 0xD000000000000025;
  v19[1] = 0x8000000261BA3860;
  v19[2] = v13;
  char v20 = IsIndoor;
  id v21 = a4;
  id v22 = a5;
  unint64_t v23 = sub_261AC5700(MEMORY[0x263F8EE78]);
  swift_bridgeObjectRetain();
  id v17 = v15;
  id v18 = v16;
  swift_bridgeObjectRetain();
  sub_261B5CA2C((uint64_t)v19);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  _s9WorkoutUI15EffortUtilitiesC32_sendLoadAndVitalsAnalyticsEvent11healthStoreySo08HKHealthL0C_tFZ_0(v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)sendPostWorkoutAnalyticsWithWorkoutActivity:(id)a3 perceivedEffortQuantity:(id)a4 estimatedEffortQuantity:(id)a5 healthStore:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  _s9WorkoutUI15EffortUtilitiesC08sendPostA9Analytics15workoutActivity09perceivedC8Quantity09estimatedcK011healthStoreySo09HKWorkoutI0C_So10HKQuantityCSgAMSo08HKHealthN0CtFZ_0(v9, a4, a5, v12);
}

+ (void)sendUpdatedEffortAnalyticsEventWithWorkout:(id)a3 workoutActivity:(id)a4 perceivedEffortQuantity:(id)a5 estimatedEffortQuantity:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  sub_261B5E150(v13, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)v17);
  sub_261B5CD6C((uint64_t)v17);
  sub_261B5E2B8((uint64_t)v17);
}

@end