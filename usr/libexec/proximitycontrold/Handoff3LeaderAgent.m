@interface Handoff3LeaderAgent
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (_TtC17proximitycontrold19Handoff3LeaderAgent)init;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation Handoff3LeaderAgent

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC17proximitycontrold19Handoff3LeaderAgent_dispatchQueue));
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold19Handoff3LeaderAgent_dispatchQueue);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold19Handoff3LeaderAgent_dispatchQueue) = (Class)a3;
  id v3 = a3;
}

- (id)invalidationHandler
{
  return sub_1000D2FB4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC17proximitycontrold19Handoff3LeaderAgent_invalidationHandler, (uint64_t)&unk_100332828);
}

- (void)setInvalidationHandler:(id)a3
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
  v7 = (uint64_t (**)())((char *)self
                                 + OBJC_IVAR____TtC17proximitycontrold19Handoff3LeaderAgent_invalidationHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17proximitycontrold19Handoff3LeaderAgent_invalidationHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10000F088(v8);
}

- (id)interruptionHandler
{
  return sub_1000D2FB4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC17proximitycontrold19Handoff3LeaderAgent_interruptionHandler, (uint64_t)&unk_1003327D8);
}

- (void)setInterruptionHandler:(id)a3
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
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC17proximitycontrold19Handoff3LeaderAgent_interruptionHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17proximitycontrold19Handoff3LeaderAgent_interruptionHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10000F088(v8);
}

- (void)dealloc
{
  v2 = self;
  id v3 = sub_1001F657C();
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 ulog:40 message:v4];

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for Handoff3LeaderAgent();
  [(Handoff3LeaderAgent *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_10000F088(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17proximitycontrold19Handoff3LeaderAgent_invalidationHandler));
  sub_10000F088(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17proximitycontrold19Handoff3LeaderAgent_interruptionHandler));
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)activateWithCompletion:(id)a3
{
  NSString v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10020AAC8((uint64_t)sub_10004C9CC, v5);

  swift_release();
}

- (void)invalidate
{
  v2 = self;
  sub_10020B520();
}

- (_TtC17proximitycontrold19Handoff3LeaderAgent)init
{
  result = (_TtC17proximitycontrold19Handoff3LeaderAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (NSString)description
{
  v2 = self;
  sub_10020B700();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end