@interface SDTempPairingClient
- (_TtC16DaemoniOSLibrary19SDTempPairingClient)init;
- (void)handleDiscoverableModeChanged;
- (void)handleRapportIdentitiesChanged;
- (void)proximityDeviceDidTrigger:(id)a3;
@end

@implementation SDTempPairingClient

- (void)handleRapportIdentitiesChanged
{
  v2 = self;
  sub_1003E3A1C();
}

- (void)handleDiscoverableModeChanged
{
  v2 = self;
  sub_1003E3C14();
}

- (_TtC16DaemoniOSLibrary19SDTempPairingClient)init
{
  result = (_TtC16DaemoniOSLibrary19SDTempPairingClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_objectChanged));
  swift_release();

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_bluetoothController));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary19SDTempPairingClient_scanningIdentifier;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)proximityDeviceDidTrigger:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1003E4BD0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end