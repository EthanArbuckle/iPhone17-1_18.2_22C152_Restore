@interface HapticPlayer
- (OS_dispatch_queue)dispatchQueue;
- (_TtC17proximitycontrold12HapticPlayer)init;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation HapticPlayer

- (id)interruptionHandler
{
  return sub_1000D2FB4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC17proximitycontrold12HapticPlayer_interruptionHandler, (uint64_t)&unk_1003338D0);
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
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC17proximitycontrold12HapticPlayer_interruptionHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold12HapticPlayer_interruptionHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10000F088(v8);
}

- (id)invalidationHandler
{
  return sub_1000D2FB4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC17proximitycontrold12HapticPlayer_invalidationHandler, (uint64_t)&unk_100333880);
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
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC17proximitycontrold12HapticPlayer_invalidationHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold12HapticPlayer_invalidationHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10000F088(v8);
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC17proximitycontrold12HapticPlayer_dispatchQueue));
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold12HapticPlayer_dispatchQueue);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold12HapticPlayer_dispatchQueue) = (Class)a3;
  id v3 = a3;
}

- (_TtC17proximitycontrold12HapticPlayer)init
{
  result = (_TtC17proximitycontrold12HapticPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000F088(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17proximitycontrold12HapticPlayer_interruptionHandler));
  sub_10000F088(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17proximitycontrold12HapticPlayer_invalidationHandler));

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC17proximitycontrold12HapticPlayer_startTime;

  sub_1000B0424((uint64_t)v3);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_100225B18((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)invalidate
{
  v2 = self;
  sub_1002241C4();
}

@end