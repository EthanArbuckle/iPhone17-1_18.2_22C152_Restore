@interface TagCommandManager
- (_TtC12searchpartyd17TagCommandManager)init;
- (void)findMyAccessoryManager:(id)a3 didCompletePlayingSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didCompletePlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didConnectDevice:(id)a4 error:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4;
- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didFetchBatteryStatus:(unint64_t)a4 forDevice:(id)a5 withError:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didFetchFirmwareVersion:(id)a4 fromDevice:(id)a5 withError:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didFetchHawkeyeSerialNumber:(id)a4 fromDevice:(id)a5 withError:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didFetchUserStats:(id)a4 forDevice:(id)a5 withError:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didFetchUserStats:(id)a4 fromDevice:(id)a5 withError:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didSetObfuscatedIdentifierOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didStartPlayingSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didStartPlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didStopPlayingSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didUnpairFromDevice:(id)a4 withError:(id)a5;
@end

@implementation TagCommandManager

- (_TtC12searchpartyd17TagCommandManager)init
{
  result = (_TtC12searchpartyd17TagCommandManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)findMyAccessoryManager:(id)a3 didFetchFirmwareVersion:(id)a4 fromDevice:(id)a5 withError:(id)a6
{
}

- (void)findMyAccessoryManager:(id)a3 didSetObfuscatedIdentifierOnDevice:(id)a4 withError:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didStartPlayingSoundOnDevice:(id)a4 withError:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didStartPlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didCompletePlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didCompletePlayingSoundOnDevice:(id)a4 withError:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didStopPlayingSoundOnDevice:(id)a4 withError:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didUnpairFromDevice:(id)a4 withError:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didFetchUserStats:(id)a4 fromDevice:(id)a5 withError:(id)a6
{
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  v18 = self;
  if (a4)
  {
    id v19 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v21 = v20;
  }
  else
  {
    unint64_t v21 = 0xF000000000000000;
  }
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1008D778C((uint64_t)a4, v21, (uint64_t)v14, (uint64_t)a6, (uint64_t)self);
  sub_100037A24((uint64_t)a4, v21);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)findMyAccessoryManager:(id)a3 didFetchUserStats:(id)a4 forDevice:(id)a5 withError:(id)a6
{
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  id v15 = a4;
  id v16 = self;
  id v17 = a6;
  sub_1008D81DC(v15, (uint64_t)v13, (uint64_t)a6, (uint64_t)v16);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  uint64_t v9 = sub_10000588C(&qword_101638CF0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  id v15 = a4;
  id v16 = self;
  sub_1008D8A38((uint64_t)v15, (uint64_t)v11);

  sub_10001DAB4((uint64_t)v11, &qword_101638CF0);
}

- (void)findMyAccessoryManager:(id)a3 didFetchBatteryStatus:(unint64_t)a4 forDevice:(id)a5 withError:(id)a6
{
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  id v15 = self;
  id v16 = a6;
  sub_1008D8BDC(a4, (uint64_t)v13, (uint64_t)a6, v15);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)findMyAccessoryManager:(id)a3 didConnectDevice:(id)a4 error:(id)a5
{
}

- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1008D992C((uint64_t)v9, v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)findMyAccessoryManager:(id)a3 didFetchHawkeyeSerialNumber:(id)a4 fromDevice:(id)a5 withError:(id)a6
{
}

@end