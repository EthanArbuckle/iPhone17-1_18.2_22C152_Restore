@interface AudioManager
- (_TtC7Journal12AudioManager)init;
- (void)appMovedToBackground;
- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4;
- (void)dealloc;
- (void)updateDecibels;
- (void)willEnterFullScreenView:(id)a3;
@end

@implementation AudioManager

- (void)dealloc
{
  v2 = self;
  sub_1003A946C();
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal12AudioManager__recorderDelegate);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7Journal12AudioManager__currentDecibels;
  uint64_t v4 = sub_100010218((uint64_t *)&unk_100800FB0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC7Journal12AudioManager__startRecordingTime;
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_release();
  swift_release();
  v7 = (char *)self + OBJC_IVAR____TtC7Journal12AudioManager___observationRegistrar;
  uint64_t v8 = type metadata accessor for ObservationRegistrar();
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

- (_TtC7Journal12AudioManager)init
{
  return (_TtC7Journal12AudioManager *)sub_1003A990C();
}

- (void)updateDecibels
{
  uint64_t v3 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_100328A60((uint64_t)v5, (uint64_t)&unk_10080B448, (uint64_t)v9);

  swift_release();
}

- (void)appMovedToBackground
{
  v2 = self;
  sub_1003AD50C();
}

- (void)willEnterFullScreenView:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_1003AF2C8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  uint64_t v6 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  type metadata accessor for MainActor();
  uint64_t v10 = self;
  id v11 = a3;
  uint64_t v12 = static MainActor.shared.getter();
  v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v10;
  sub_100328A60((uint64_t)v8, (uint64_t)&unk_10080B428, (uint64_t)v13);

  swift_release();
}

@end