@interface UWBPrewarmSession
- (_TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession)init;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)sessionDidStartRunning:(id)a3;
- (void)systemConfigurator:(id)a3 didUpdateResourceUsageLimitExceeded:(BOOL)a4 forSessionConfigurationType:(Class)a5;
- (void)systemConfigurator:(id)a3 didUpdateState:(id)a4;
@end

@implementation UWBPrewarmSession

- (_TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession)init
{
  result = (_TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession_session);
}

- (void)systemConfigurator:(id)a3 didUpdateState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100206AE0(v7);
}

- (void)systemConfigurator:(id)a3 didUpdateResourceUsageLimitExceeded:(BOOL)a4 forSessionConfigurationType:(Class)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  v9 = self;
  sub_100206C98(a4);
}

- (void)sessionDidStartRunning:(id)a3
{
  uint64_t v5 = type metadata accessor for DispatchPredicate();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (uint64_t *)((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = qword_100453928;
  id v11 = a3;
  v12 = self;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_100468A38;
  void *v9 = qword_100468A38;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v9, enum case for DispatchPredicate.onQueue(_:), v5);
  id v14 = (id)v13;
  LOBYTE(v13) = _dispatchPreconditionTest(_:)();
  uint64_t v15 = (*(uint64_t (**)(void *, uint64_t))(v6 + 8))(v9, v5);
  if (v13)
  {
    (*(void (**)(uint64_t))((char *)&v12->super.isa
                                    + OBJC_IVAR____TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession_onStart))(v15);
  }
  else
  {
    __break(1u);
  }
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v7 = type metadata accessor for DispatchPredicate();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  id v11 = (uint64_t *)((char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = qword_100453928;
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_100468A38;
  *id v11 = qword_100468A38;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))(v11, enum case for DispatchPredicate.onQueue(_:), v7);
  id v17 = (id)v16;
  LOBYTE(v16) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v8 + 8))(v11, v7);
  if (v16)
  {
    (*(void (**)(id))((char *)&v15->super.isa
                               + OBJC_IVAR____TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession_onInvalidation))(v14);
  }
  else
  {
    __break(1u);
  }
}

@end