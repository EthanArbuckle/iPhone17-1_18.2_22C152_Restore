@interface AccessoryFirmwareUpdateManager
- (void)findMyAccessoryFirmwareUpdateManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5;
- (void)findMyAccessoryFirmwareUpdateManager:(id)a3 firmwareUpdateRequestForDevice:(id)a4 completedWithError:(id)a5;
@end

@implementation AccessoryFirmwareUpdateManager

- (void)findMyAccessoryFirmwareUpdateManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  uint64_t v8 = sub_10000588C(&qword_101638CF0);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  id v13 = a3;
  id v14 = a4;
  swift_retain();
  sub_10107BCE4((uint64_t)v14, (uint64_t)v10);

  swift_release();
  sub_10001DAB4((uint64_t)v10, &qword_101638CF0);
}

- (void)findMyAccessoryFirmwareUpdateManager:(id)a3 firmwareUpdateRequestForDevice:(id)a4 completedWithError:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  swift_retain();
  id v12 = a5;
  sub_10107C0A8((uint64_t)v10, (uint64_t)a5);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end