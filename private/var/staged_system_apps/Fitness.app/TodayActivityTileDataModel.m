@interface TodayActivityTileDataModel
- (_TtC10FitnessApp26TodayActivityTileDataModel)init;
- (void)dealloc;
@end

@implementation TodayActivityTileDataModel

- (void)dealloc
{
  v2 = self;
  sub_100391C24();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TodayActivityTileDataModel_activityDataProvider));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TodayActivityTileDataModel_activitySummary));

  swift_bridgeObjectRelease();
}

- (_TtC10FitnessApp26TodayActivityTileDataModel)init
{
  result = (_TtC10FitnessApp26TodayActivityTileDataModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end