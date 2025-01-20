@interface ExecutiveBridge
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14photoanalysisd15ExecutiveBridge)init;
- (id)targetForOriginalTarget:(id)a3 connection:(id)a4 selector:(SEL)a5;
- (void)dispatchOperation:(id)a3 toTarget:(id)a4 service:(id)a5;
- (void)dumpStatusToLog;
- (void)shutdown;
- (void)startup;
@end

@implementation ExecutiveBridge

- (_TtC14photoanalysisd15ExecutiveBridge)init
{
  return (_TtC14photoanalysisd15ExecutiveBridge *)ExecutiveBridge.init()();
}

- (void)startup
{
}

- (void)shutdown
{
}

- (void)dumpStatusToLog
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  Swift::Bool v9 = ExecutiveBridge.listener(_:shouldAcceptNewConnection:)((NSXPCListener)v6, (NSXPCConnection)v7);

  return v9;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14photoanalysisd15ExecutiveBridge_invoker);
}

- (id)targetForOriginalTarget:(id)a3 connection:(id)a4 selector:(SEL)a5
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  ExecutiveBridge.target(forOriginalTarget:connection:selector:)((uint64_t)v16, (uint64_t)v17);

  sub_100005F5C((uint64_t)v16);
  uint64_t v9 = v18;
  if (v18)
  {
    v10 = sub_100005FAC(v17, v18);
    uint64_t v11 = *(void *)(v9 - 8);
    __chkstk_darwin(v10, v10);
    v13 = &v16[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(unsigned char *))(v11 + 16))(v13);
    v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v9);
    sub_100005F5C((uint64_t)v17);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dispatchOperation:(id)a3 toTarget:(id)a4 service:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v7 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  _s14photoanalysisd15ExecutiveBridgeC17dispatchOperation_8toTarget7serviceySo020PHAServiceCancelableE0C_ypyptF_0((uint64_t)v6, (uint64_t)v9, (uint64_t)v8);

  sub_100005F5C((uint64_t)v8);
  sub_100005F5C((uint64_t)v9);
}

@end