@interface FMAnnotation
- (BOOL)isEqual:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (NSString)title;
- (_TtC6FindMy12FMAnnotation)init;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setTitle:(id)a3;
@end

@implementation FMAnnotation

- (CLLocationCoordinate2D)coordinate
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy12FMAnnotation_coordinate);
  double v3 = *(double *)&self->coordinate[OBJC_IVAR____TtC6FindMy12FMAnnotation_coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy12FMAnnotation_coordinate) = a3;
}

- (NSString)title
{
  if (*(void *)&self->coordinate[OBJC_IVAR____TtC6FindMy12FMAnnotation_title])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6FindMy12FMAnnotation_title);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_100179EE4((uint64_t)v8);

  sub_100003F10((uint64_t)v8, &qword_1006AFE40);
  return v6 & 1;
}

- (_TtC6FindMy12FMAnnotation)init
{
  CLLocationCoordinate2D result = (_TtC6FindMy12FMAnnotation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100083358(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy12FMAnnotation_fmClusterIdentifier), *(void *)&self->coordinate[OBJC_IVAR____TtC6FindMy12FMAnnotation_fmClusterIdentifier]);
  swift_bridgeObjectRelease();

  double v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy12FMAnnotation_stewieBadgeImage);
}

@end