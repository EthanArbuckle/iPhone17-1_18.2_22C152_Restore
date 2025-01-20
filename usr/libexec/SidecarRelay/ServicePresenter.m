@interface ServicePresenter
- (void)relayPresenterServiceExtensionReady:(id)a3;
- (void)relayPresenterStartServiceExtension:(id)a3 completion:(id)a4;
- (void)relayRegisterServicePresenter:(id)a3;
- (void)relayServicePresenterReady:(int64_t)a3 completion:(id)a4;
- (void)relaySessionOpen:(id)a3 reconnect:(id)a4 serviceIdentifier:(id)a5 destination:(id)a6 transport:(int64_t)a7 completion:(id)a8;
@end

@implementation ServicePresenter

- (void)relayRegisterServicePresenter:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100051F30((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
}

- (void)relaySessionOpen:(id)a3 reconnect:(id)a4 serviceIdentifier:(id)a5 destination:(id)a6 transport:(int64_t)a7 completion:(id)a8
{
  v27 = self;
  uint64_t v28 = a7;
  uint64_t v10 = sub_1000116B8(&qword_1000A2EC0);
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v27 - v18;
  v20 = _Block_copy(a8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 1;
  }
  sub_100012E34((uint64_t)v12, v21, 1, v13);
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = v23;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v20);
  v25 = v27;
  sub_100052218((uint64_t)v19, (uint64_t)v12, v22, v24, (uint64_t)v17, v28, (uint64_t)v25, (void (**)(void, void))v20);
  _Block_release(v20);

  swift_bridgeObjectRelease();
  v26 = *(void (**)(char *, uint64_t))(v14 + 8);
  v26(v17, v13);
  sub_100052ED0((uint64_t)v12);
  v26(v19, v13);
}

- (void)relayPresenterStartServiceExtension:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  sub_100052724(v6, v8, (uint64_t)sub_100012D24, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)relayPresenterServiceExtensionReady:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = self;
  sub_100052A94((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)relayServicePresenterReady:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  unint64_t v7 = self;
  sub_100057120(a3);

  swift_release();
}

@end