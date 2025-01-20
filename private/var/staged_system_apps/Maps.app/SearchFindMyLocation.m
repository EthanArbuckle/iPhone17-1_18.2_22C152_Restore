@interface SearchFindMyLocation
- (BOOL)isEqual:(id)a3;
- (CLLocationCoordinate2D)latLng;
- (NSString)description;
- (NSUUID)id;
- (_TtC4Maps20SearchFindMyLocation)init;
- (int64_t)hash;
@end

@implementation SearchFindMyLocation

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (CLLocationCoordinate2D)latLng
{
  NSUUID v2 = self;
  Location.latitude.getter();
  double v4 = v3;
  Location.longitude.getter();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return sub_100323B24(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC4Maps20SearchFindMyLocation_location, (uint64_t (*)(char *, uint64_t))&static Location.== infix(_:_:));
}

- (int64_t)hash
{
  NSUUID v2 = self;
  int64_t v3 = Location.hashValue.getter();

  return v3;
}

- (NSString)description
{
  return (NSString *)sub_100323C0C(self, (uint64_t)a2, (void (*)(void))sub_100323C7C);
}

- (_TtC4Maps20SearchFindMyLocation)init
{
  CLLocationCoordinate2D result = (_TtC4Maps20SearchFindMyLocation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end