@interface ActivityChartDataCache
- (_TtC10FitnessApp22ActivityChartDataCache)init;
@end

@implementation ActivityChartDataCache

- (_TtC10FitnessApp22ActivityChartDataCache)init
{
  uint64_t v2 = OBJC_IVAR____TtC10FitnessApp22ActivityChartDataCache_calendar;
  uint64_t v3 = qword_10094A5E8;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Calendar();
  uint64_t v6 = sub_1000876DC(v5, (uint64_t)qword_100997610);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))((char *)v4 + v2, v6, v5);
  uint64_t v7 = OBJC_IVAR____TtC10FitnessApp22ActivityChartDataCache_cache;
  *(Class *)((char *)&v4->super.isa + v7) = (Class)[objc_allocWithZone((Class)NSCache) init];
  uint64_t v8 = OBJC_IVAR____TtC10FitnessApp22ActivityChartDataCache_basalEnergyCache;
  *(Class *)((char *)&v4->super.isa + v8) = (Class)[objc_allocWithZone((Class)NSCache) init];

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for ActivityChartDataCache();
  return [(ActivityChartDataCache *)&v10 init];
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp22ActivityChartDataCache_calendar;
  uint64_t v4 = type metadata accessor for Calendar();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp22ActivityChartDataCache_basalEnergyCache);
}

@end