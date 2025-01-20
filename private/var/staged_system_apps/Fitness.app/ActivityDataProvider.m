@interface ActivityDataProvider
- (BOOL)isWheelchairUser;
- (CHWorkoutDataProvider)workoutDataProvider;
- (HKHealthStore)healthStore;
- (_TtC10FitnessApp20ActivityDataProvider)init;
- (_TtC10FitnessApp20ActivityDataProvider)initWithHealthStore:(id)a3 wheelchairUseCache:(id)a4 workoutDataProvider:(id)a5 achievementsDataProvider:(id)a6;
- (_TtC10FitnessApp29ActivitySummaryChangeListener)activitySummaryListener;
- (void)dealloc;
- (void)setHealthStore:(id)a3;
- (void)setIsWheelchairUser:(BOOL)a3;
- (void)setWorkoutDataProvider:(id)a3;
- (void)updateWidgets;
- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4;
@end

@implementation ActivityDataProvider

- (_TtC10FitnessApp20ActivityDataProvider)initWithHealthStore:(id)a3 wheelchairUseCache:(id)a4 workoutDataProvider:(id)a5 achievementsDataProvider:(id)a6
{
  return (_TtC10FitnessApp20ActivityDataProvider *)sub_1000442A0(a3, a4, a5, a6);
}

- (void)updateWidgets
{
  type metadata accessor for WidgetCenter();
  v3 = self;
  static WidgetCenter.shared.getter();
  dispatch thunk of WidgetCenter.reloadAllTimelines()();

  swift_release();
}

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_healthStore));
}

- (void)setHealthStore:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_healthStore);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_healthStore) = (Class)a3;
  id v3 = a3;
}

- (CHWorkoutDataProvider)workoutDataProvider
{
  return (CHWorkoutDataProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_workoutDataProvider));
}

- (void)setWorkoutDataProvider:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_workoutDataProvider);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_workoutDataProvider) = (Class)a3;
  id v3 = a3;
}

- (_TtC10FitnessApp29ActivitySummaryChangeListener)activitySummaryListener
{
  return (_TtC10FitnessApp29ActivitySummaryChangeListener *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_activitySummaryListener);
}

- (BOOL)isWheelchairUser
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_isWheelchairUser);
}

- (void)setIsWheelchairUser:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_isWheelchairUser) = a3;
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_wheelchairCache);
  id v3 = self;
  [v2 removeObserver:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for ActivityDataProvider();
  [(ActivityDataProvider *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_activitySummaryListener));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_achievementsDataProvider));

  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider____lazy_storage___currentCalendar, (uint64_t *)&unk_1009546C0);
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_internalQueue);
}

- (_TtC10FitnessApp20ActivityDataProvider)init
{
  result = (_TtC10FitnessApp20ActivityDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_100241568(a4);
}

@end