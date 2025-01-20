@interface SecureLocationsTrampoline
- (_TtC12searchpartyd25SecureLocationsTrampoline)init;
- (void)currentStewieStateWithCompletion:(id)a3;
- (void)fetchConfigFromServerWithCompletion:(id)a3;
- (void)isLocationPublishingDeviceWithCompletion:(id)a3;
- (void)latestLocationFromCacheForId:(id)a3 completion:(id)a4;
- (void)performKeyRollWithCompletion:(id)a3;
- (void)publishCurrentLocationToStewieWithReason:(int64_t)a3 completion:(id)a4;
- (void)publishLocation:(id)a3 completion:(id)a4;
- (void)receivedLocationCommand:(id)a3 completion:(id)a4;
- (void)receivedLocationPayload:(id)a3 completion:(id)a4;
- (void)shareCurrentKeyWithId:(id)a3 completion:(id)a4;
- (void)shareCurrentKeyWithId:(id)a3 idsHandles:(id)a4 completion:(id)a5;
- (void)shouldStartLocationMonitorWithCompletion:(id)a3;
- (void)simulateFeatureDisabled:(BOOL)a3 completion:(id)a4;
- (void)startMonitoringStewieStateWithCompletion:(id)a3;
- (void)stewiePublishStateWithCompletion:(id)a3;
- (void)stopMonitoringStewieStateWithCompletion:(id)a3;
- (void)subscribeAndFetchLocationForIds:(id)a3 context:(id)a4 completion:(id)a5;
- (void)triggerStewieProactiveNotification;
- (void)unsubscribeForIds:(id)a3 context:(id)a4 completion:(id)a5;
- (void)updateLocationCacheWith:(id)a3 completion:(id)a4;
@end

@implementation SecureLocationsTrampoline

- (void)subscribeAndFetchLocationForIds:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)unsubscribeForIds:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)publishLocation:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = *(void *)(*sub_10001CD44((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation+ 16])+ 96);
  _Block_copy(v6);
  id v8 = a3;
  v9 = self;
  swift_retain();
  sub_1007609D8(v8, v7, (void (**)(void, void))v6);
  _Block_release(v6);
  swift_release();
  _Block_release(v6);
}

- (void)receivedLocationPayload:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v12 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  uint64_t v11 = *(void *)(*sub_10001CD44((Class *)((char *)&v12->super.isa+ OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&v12->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation+ 16])+ 96);
  _Block_copy(v6);
  swift_retain();
  sub_100763C68(v8, v10, v11, (uint64_t)v6);
  _Block_release(v6);
  swift_release();
  _Block_release(v6);
  sub_10001CFB8(v8, v10);
}

- (void)receivedLocationCommand:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v12 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  sub_10001CD44((Class *)((char *)&v12->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&v12->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  swift_retain();
  sub_1007494E4(v8, v10, (uint64_t)sub_1001E06E0, v11);
  swift_release();
  swift_release();
  sub_10001CFB8(v8, v10);
}

- (void)latestLocationFromCacheForId:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v5;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  type metadata accessor for Transaction();
  v6 = self;
  swift_retain();
  static Transaction.named<A>(_:with:)();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)updateLocationCacheWith:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_10001D4B0(0, (unint64_t *)&qword_10163F378);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = *sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  _Block_copy(v5);
  uint64_t v8 = self;
  sub_1009F9578(v6, v7, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)shareCurrentKeyWithId:(id)a3 idsHandles:(id)a4 completion:(id)a5
{
  unint64_t v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  v12 = self;
  sub_1009F352C(v7, v9, v10, (uint64_t)sub_1001E06E0, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)shareCurrentKeyWithId:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  sub_10000588C(&qword_1016552B0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_101342130;
  *(void *)(v10 + 32) = v6;
  *(void *)(v10 + 40) = v8;
  uint64_t v11 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100BAA9DC(v10, (uint64_t)_swiftEmptyDictionarySingleton, 0, (uint64_t)sub_1001E06E0, v9);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)performKeyRollWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  type metadata accessor for Transaction();
  v5 = self;
  swift_retain();
  static Transaction.named<A>(_:with:)();

  swift_release();
  swift_release();
}

- (void)shouldStartLocationMonitorWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void (*)(void *, uint64_t, void))v4[2];
  uint64_t v6 = self;
  v5(v4, 1, 0);
  _Block_release(v4);
}

- (void)isLocationPublishingDeviceWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = qword_101637080;
  uint64_t v7 = self;
  if (v5 != -1) {
    swift_once();
  }
  swift_retain();
  char v6 = sub_100D0C0B0();
  swift_release();
  (*((void (**)(void *, void, void))v4 + 2))(v4, v6 & 1, 0);
  _Block_release(v4);
}

- (void)fetchConfigFromServerWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  char v6 = self;
  swift_retain();
  sub_10072E958((uint64_t)sub_1001E06E0, v5);

  swift_release();

  swift_release();
}

- (void)simulateFeatureDisabled:(BOOL)a3 completion:(id)a4
{
  char v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_1009F986C(a3, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)startMonitoringStewieStateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  char v6 = self;
  sub_1009F7B78((uint64_t)sub_1001E06E0, v5, "Daemon API: liteloc startMonitoringState", (uint64_t)&unk_1015E2CE8, (uint64_t)sub_1009F9A68, (uint64_t)&unk_1015E2D00);

  swift_release();
}

- (void)stopMonitoringStewieStateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  char v6 = self;
  sub_1009F7B78((uint64_t)sub_1001DF814, v5, "Daemon API: liteloc stopMonitoringState", (uint64_t)&unk_1015E2BF8, (uint64_t)sub_1009F99B8, (uint64_t)&unk_1015E2C10);

  swift_release();
}

- (void)publishCurrentLocationToStewieWithReason:(int64_t)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  uint64_t v7 = self;
  sub_1009F7FC4((uint64_t)sub_1007C84EC, v6, "Daemon API: liteloc publishCurrentLocationTo", (uint64_t)&unk_1015E2B80, (uint64_t)sub_1009F9970, (uint64_t)&unk_1015E2B98);

  swift_release();
}

- (void)currentStewieStateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  uint64_t v6 = self;
  sub_1009F7FC4((uint64_t)sub_1007C77E4, v5, "Daemon API: liteloc currentStateWithCompletion", (uint64_t)&unk_1015E2B08, (uint64_t)sub_1009F88F8, (uint64_t)&unk_1015E2B20);

  swift_release();
}

- (void)stewiePublishStateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  uint64_t v6 = self;
  sub_1009F7FC4((uint64_t)sub_1007C84EC, v5, "Daemon API: publishState", (uint64_t)&unk_1015E2A90, (uint64_t)sub_1009F88C0, (uint64_t)&unk_1015E2AA8);

  swift_release();
}

- (void)triggerStewieProactiveNotification
{
  sub_10001CD44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(void *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  v3 = self;
  sub_1009F83D8();
}

- (_TtC12searchpartyd25SecureLocationsTrampoline)init
{
  result = (_TtC12searchpartyd25SecureLocationsTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end