@interface AssertionClient
- (_TtC16SessionAssertion15AssertionClient)init;
- (void)didConnect;
- (void)didInvalidate:(id)a3;
@end

@implementation AssertionClient

- (_TtC16SessionAssertion15AssertionClient)init
{
  return (_TtC16SessionAssertion15AssertionClient *)AssertionClient.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16SessionAssertion15AssertionClient_delegate;

  sub_1B8F7474C((uint64_t)v3);
}

- (void)didInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_1B8F895B0();
  unint64_t v8 = v7;

  v9 = (void *)sub_1B8F895A0();
  sub_1B8F894E0();
  swift_allocObject();
  sub_1B8F894D0();
  uint64_t v10 = sub_1B8F895B0();
  unint64_t v12 = v11;
  sub_1B8F73B08();
  sub_1B8F894C0();
  sub_1B8F6C7BC(v10, v12);

  swift_release();
  AssertionClient.didInvalidate(invalidationMessage:)((uint64_t)&v13);
  swift_bridgeObjectRelease();
  sub_1B8F6C7BC(v6, v8);
}

- (void)didConnect
{
  v2 = self;
  AssertionClient.didConnect()();
}

@end