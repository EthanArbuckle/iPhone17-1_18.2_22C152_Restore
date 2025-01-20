@interface TestProvider
- (void)relayRegisterServiceProvider:(id)a3;
- (void)relaySessionOpen:(id)a3 reconnect:(id)a4 serviceIdentifier:(id)a5 destination:(id)a6 transport:(int64_t)a7 completion:(id)a8;
@end

@implementation TestProvider

- (void)relayRegisterServiceProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10005D6C8((uint64_t)sub_1000138A4, v5);

  swift_release();
}

- (void)relaySessionOpen:(id)a3 reconnect:(id)a4 serviceIdentifier:(id)a5 destination:(id)a6 transport:(int64_t)a7 completion:(id)a8
{
  v28 = self;
  uint64_t v29 = a7;
  uint64_t v10 = sub_1000116B8(&qword_1000A2EC0);
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for UUID();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)&v28 - v18;
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
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v20;
  v26 = v28;
  sub_10005D840((uint64_t)v19, (uint64_t)v12, v22, v24, (uint64_t)v17, v29, (uint64_t)sub_100012D24, v25);

  swift_bridgeObjectRelease();
  swift_release();
  v27 = *(void (**)(char *, uint64_t))(v14 + 8);
  v27(v17, v13);
  sub_100052ED0((uint64_t)v12);
  v27(v19, v13);
}

- (void).cxx_destruct
{
}

@end