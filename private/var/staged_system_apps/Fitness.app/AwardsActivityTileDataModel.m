@interface AwardsActivityTileDataModel
- (_TtC10FitnessApp27AwardsActivityTileDataModel)init;
- (void)achievementsDataProviderDidFinishInitialLoad:(id)a3;
- (void)achievementsDataProviderDidUpdate:(id)a3;
- (void)dealloc;
@end

@implementation AwardsActivityTileDataModel

- (void)dealloc
{
  v2 = self;
  sub_1003814F8();
}

- (void).cxx_destruct
{
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_achievementsDataProvider);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_achievementLocalizationProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_activityDataProvider));
  sub_100382788(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_keyAwards), *(void **)&self->achievementsDataProvider[OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_keyAwards], *(void **)&self->achievementsDataProvider[OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_keyAwards + 8]);
  sub_10005E5F8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_onModelDidUpdate));

  swift_bridgeObjectRelease();
}

- (_TtC10FitnessApp27AwardsActivityTileDataModel)init
{
  result = (_TtC10FitnessApp27AwardsActivityTileDataModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)achievementsDataProviderDidFinishInitialLoad:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003824B8((uint64_t)sub_10038276C, (uint64_t)&unk_1008C3918);
}

- (void)achievementsDataProviderDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003824B8((uint64_t)sub_10038276C, (uint64_t)&unk_1008C38F0);
}

@end