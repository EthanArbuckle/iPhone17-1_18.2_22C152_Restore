@interface PASExtensionPickedAccountBuilder
- (_TtC21ProximityAppleIDSetup32PASExtensionPickedAccountBuilder)init;
@end

@implementation PASExtensionPickedAccountBuilder

- (_TtC21ProximityAppleIDSetup32PASExtensionPickedAccountBuilder)init
{
  return (_TtC21ProximityAppleIDSetup32PASExtensionPickedAccountBuilder *)PASExtensionPickedAccountBuilder.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ProximityAppleIDSetup32PASExtensionPickedAccountBuilder_dsid));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC21ProximityAppleIDSetup32PASExtensionPickedAccountBuilder_imageData);
  unint64_t v4 = *(void *)&self->dsid[OBJC_IVAR____TtC21ProximityAppleIDSetup32PASExtensionPickedAccountBuilder_imageData];

  sub_22CB9817C(v3, v4);
}

@end