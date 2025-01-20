@interface NearbyAgent
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (_TtC17proximitycontrold11NearbyAgent)init;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation NearbyAgent

- (id)interruptionHandler
{
  return sub_1000D2FB4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC17proximitycontrold11NearbyAgent_interruptionHandler, (uint64_t)&unk_1003285D0);
}

- (void)setInterruptionHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1000D5AD0;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC17proximitycontrold11NearbyAgent_interruptionHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold11NearbyAgent_interruptionHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10000F088(v8);
}

- (id)invalidationHandler
{
  return sub_1000D2FB4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC17proximitycontrold11NearbyAgent_invalidationHandler, (uint64_t)&unk_100328580);
}

- (void)setInvalidationHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1000D56D0;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC17proximitycontrold11NearbyAgent_invalidationHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold11NearbyAgent_invalidationHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10000F088(v8);
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC17proximitycontrold11NearbyAgent_dispatchQueue));
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold11NearbyAgent_dispatchQueue);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold11NearbyAgent_dispatchQueue) = (Class)a3;
  id v3 = a3;
}

- (_TtC17proximitycontrold11NearbyAgent)init
{
  result = (_TtC17proximitycontrold11NearbyAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  sub_10000F088(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17proximitycontrold11NearbyAgent_interruptionHandler));
  sub_10000F088(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17proximitycontrold11NearbyAgent_invalidationHandler));

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = (uint64_t *)swift_allocObject();
  v5[2] = (uint64_t)v4;
  v6 = self;
  sub_100105B60((uint64_t)sub_10004C9CC, v5);

  swift_release();
}

- (void)invalidate
{
  v2 = self;
  sub_100108D60();
}

- (NSString)description
{
  v2 = self;
  sub_10010D998();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end