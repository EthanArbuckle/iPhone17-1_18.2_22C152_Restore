@interface PushServiceManager.PushDelegate
- (_TtCC3asd18PushServiceManager12PushDelegate)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation PushServiceManager.PushDelegate

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  v4 = a4;
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = v4;
    v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;
  }
  else
  {
    id v11 = a3;
    v12 = self;
    unint64_t v10 = 0xF000000000000000;
  }
  sub_10002EC58((uint64_t)v4, v10);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10002E288((uint64_t)v8, a4);
}

- (_TtCC3asd18PushServiceManager12PushDelegate)init
{
}

- (void).cxx_destruct
{
  sub_10002EB9C((uint64_t)self + OBJC_IVAR____TtCC3asd18PushServiceManager12PushDelegate_pushDispatchManager);
  v3 = (char *)self + OBJC_IVAR____TtCC3asd18PushServiceManager12PushDelegate_logger;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end