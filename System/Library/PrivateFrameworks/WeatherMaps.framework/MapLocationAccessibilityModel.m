@interface MapLocationAccessibilityModel
- (CLLocation)location;
- (NSDate)expiration;
- (NSString)accessibilityDescription;
- (NSString)overlayDescriptionKey;
- (_TtC11WeatherMaps29MapLocationAccessibilityModel)init;
@end

@implementation MapLocationAccessibilityModel

- (CLLocation)location
{
  id v2 = MapLocationAccessibilityModel.location.getter();
  return (CLLocation *)v2;
}

- (NSString)accessibilityDescription
{
  MapLocationAccessibilityModel.accessibilityDescription.getter();
  if (v2)
  {
    v3 = (void *)sub_20A38B5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)overlayDescriptionKey
{
  MapLocationAccessibilityModel.overlayDescriptionKey.getter();
  uint64_t v2 = (void *)sub_20A38B5D0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDate)expiration
{
  uint64_t v2 = sub_20A389550();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MapLocationAccessibilityModel.expiration.getter((uint64_t)v5);
  v6 = (void *)sub_20A389460();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSDate *)v6;
}

- (_TtC11WeatherMaps29MapLocationAccessibilityModel)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC11WeatherMaps29MapLocationAccessibilityModel_expiration;
  uint64_t v4 = sub_20A389550();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end