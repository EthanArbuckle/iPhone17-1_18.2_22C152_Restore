@interface CRLRateLimiter
- (_TtC8Freeform14CRLRateLimiter)init;
- (_TtC8Freeform14CRLRateLimiter)initWithIntervalInSeconds:(double)a3;
- (void)exec:(id)a3;
@end

@implementation CRLRateLimiter

- (_TtC8Freeform14CRLRateLimiter)initWithIntervalInSeconds:(double)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8Freeform14CRLRateLimiter_queue;
  sub_100656064();
  v6 = self;
  *(Class *)((char *)&self->super.isa + v5) = (Class)static OS_dispatch_queue.main.getter();
  v7 = (Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC8Freeform14CRLRateLimiter_currentExecBlock);
  void *v7 = 0;
  v7[1] = 0;
  static Date.distantPast.getter();
  *(double *)((char *)&v6->super.isa + OBJC_IVAR____TtC8Freeform14CRLRateLimiter_interval) = a3;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for CRLRateLimiter();
  return [(CRLRateLimiter *)&v9 init];
}

- (void)exec:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_100F3A118((uint64_t)v5, (void (**)(void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC8Freeform14CRLRateLimiter)init
{
  result = (_TtC8Freeform14CRLRateLimiter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1005174AC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform14CRLRateLimiter_currentExecBlock));
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform14CRLRateLimiter_lastExecutionTime;
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end