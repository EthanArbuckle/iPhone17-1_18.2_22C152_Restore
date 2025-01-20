@interface SDAirDropService
- (NSString)description;
- (_TtC16DaemoniOSLibrary16SDAirDropService)init;
@end

@implementation SDAirDropService

- (_TtC16DaemoniOSLibrary16SDAirDropService)init
{
  sub_100428914();
  return result;
}

- (NSString)description
{
  type metadata accessor for SFAirDropUserDefaults();
  v3 = self;
  v4 = (void *)static SFAirDropUserDefaults.shared.getter();
  SFAirDropUserDefaults.description.getter();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  sub_10024D338((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_nearFieldService);
  swift_release();
  sub_10024D338((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_airDropUISessionManager);

  swift_release();
}

@end