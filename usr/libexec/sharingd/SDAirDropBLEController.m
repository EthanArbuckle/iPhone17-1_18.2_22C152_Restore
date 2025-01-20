@interface SDAirDropBLEController
+ (_TtC16DaemoniOSLibrary22SDAirDropBLEController)shared;
- (_TtC16DaemoniOSLibrary22SDAirDropBLEController)init;
- (void)startScanningWithIdentifier:(id)a3 deviceUpdatesHandler:(id)a4;
- (void)stopScanningWithIdentifier:(id)a3;
@end

@implementation SDAirDropBLEController

+ (_TtC16DaemoniOSLibrary22SDAirDropBLEController)shared
{
  if (qword_10096A050 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100994918;

  return (_TtC16DaemoniOSLibrary22SDAirDropBLEController *)v2;
}

- (_TtC16DaemoniOSLibrary22SDAirDropBLEController)init
{
  return (_TtC16DaemoniOSLibrary22SDAirDropBLEController *)sub_1005DE5A4();
}

- (void)startScanningWithIdentifier:(id)a3 deviceUpdatesHandler:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  sub_1005DFE08((uint64_t)v9, (uint64_t)sub_1005E2750, v11, (uint64_t)&unk_1008E1180, (uint64_t)sub_1005E2770, (uint64_t)&unk_1008E1198);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)stopScanningWithIdentifier:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_1005DD6E8((uint64_t)v7, (uint64_t)&unk_1008E1108, (uint64_t)sub_1005E10AC, (uint64_t)&unk_1008E1120);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBLEController_airDropAdvertiser));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary22SDAirDropBLEController_nearbyInfoV2Advertiser));

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end