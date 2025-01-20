@interface SoundPlaybackManager
- (_TtC12searchpartyd20SoundPlaybackManager)init;
- (uint64_t)findMyAccessoryManager:(void *)a3 didFetchFirmwareVersion:(void *)a4 fromDevice:(void *)a5 withError:(void *)a6;
- (uint64_t)findMyAccessoryManager:didSetObfuscatedIdentifierOnDevice:withError:;
- (void)findMyAccessoryManager:(id)a3 didCompletePlayingSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didCompletePlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4;
- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didFetchBatteryStatus:(unint64_t)a4 forDevice:(id)a5 withError:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didFetchUserStats:(id)a4 fromDevice:(id)a5 withError:(id)a6;
- (void)findMyAccessoryManager:(id)a3 didStartPlayingSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didStartPlayingUnauthorizedSoundOnDevice:(id)a4 withError:(id)a5;
- (void)findMyAccessoryManager:(id)a3 didStopPlayingSoundOnDevice:(id)a4 withError:(id)a5;
@end

@implementation SoundPlaybackManager

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

  sub_100037A24((uint64_t)a4, v21);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)findMyAccessoryManager:(id)a3 didFailWithError:(id)a4 forDevice:(id)a5
{
  uint64_t v6 = sub_10000588C(&qword_101638CF0);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  sub_10001DAB4((uint64_t)v8, &qword_101638CF0);
}

- (void)findMyAccessoryManager:(id)a3 didFetchBatteryStatus:(unint64_t)a4 forDevice:(id)a5 withError:(id)a6
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (uint64_t)findMyAccessoryManager:didSetObfuscatedIdentifierOnDevice:withError:
{
  uint64_t v0 = type metadata accessor for UUID();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

- (void)findMyAccessoryManager:(id)a3 didDisconnectDevice:(id)a4
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (uint64_t)findMyAccessoryManager:(void *)a3 didFetchFirmwareVersion:(void *)a4 fromDevice:(void *)a5 withError:(void *)a6
{
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a1;
  id v19 = a6;
  uint64_t v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v22 = v21;

  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10001CFB8(v20, v22);

  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (_TtC12searchpartyd20SoundPlaybackManager)init
{
  result = (_TtC12searchpartyd20SoundPlaybackManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((uint64_t)self + OBJC_IVAR____TtC12searchpartyd20SoundPlaybackManager_findMyCommandManager);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end