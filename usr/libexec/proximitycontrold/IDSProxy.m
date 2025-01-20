@interface IDSProxy
- (_TtC17proximitycontrold8IDSProxy)init;
- (void)dealloc;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
@end

@implementation IDSProxy

- (void)dealloc
{
  v2 = self;
  id v3 = sub_1001F68FC();
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 ulog:40 message:v4];

  sub_100169D30();
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for IDSProxy();
  [(IDSProxy *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC17proximitycontrold8IDSProxy)init
{
  return (_TtC17proximitycontrold8IDSProxy *)sub_100169FC0();
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (a4) {
    uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  v8 = self;
  sub_10016A628(v6);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  if (a4) {
    uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  v8 = self;
  sub_10016A80C(v6);

  swift_bridgeObjectRelease();
}

@end