@interface MapManager.MOMapAnnotation
- (CLLocationCoordinate2D)coordinate;
- (NSString)title;
- (_TtCC20JournalWidgetsSecure10MapManager15MOMapAnnotation)init;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setTitle:(id)a3;
@end

@implementation MapManager.MOMapAnnotation

- (CLLocationCoordinate2D)coordinate
{
  double v2 = *(double *)((char *)&self->super.isa
                 + OBJC_IVAR____TtCC20JournalWidgetsSecure10MapManager15MOMapAnnotation_coordinate);
  double v3 = *(double *)&self->coordinate[OBJC_IVAR____TtCC20JournalWidgetsSecure10MapManager15MOMapAnnotation_coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)((char *)&self->super.isa
                            + OBJC_IVAR____TtCC20JournalWidgetsSecure10MapManager15MOMapAnnotation_coordinate) = a3;
}

- (NSString)title
{
  if (*(void *)&self->coordinate[OBJC_IVAR____TtCC20JournalWidgetsSecure10MapManager15MOMapAnnotation_title])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_100104B38();
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
    uint64_t v4 = sub_100104B78();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtCC20JournalWidgetsSecure10MapManager15MOMapAnnotation_title);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (_TtCC20JournalWidgetsSecure10MapManager15MOMapAnnotation)init
{
  CLLocationCoordinate2D result = (_TtCC20JournalWidgetsSecure10MapManager15MOMapAnnotation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end