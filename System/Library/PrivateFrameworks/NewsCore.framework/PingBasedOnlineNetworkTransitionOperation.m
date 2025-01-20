@interface PingBasedOnlineNetworkTransitionOperation
- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4;
- (_TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation)init;
- (unint64_t)maxRetries;
- (void)cancel;
- (void)performOperation;
- (void)resetForRetry;
@end

@implementation PingBasedOnlineNetworkTransitionOperation

- (void)performOperation
{
  v2 = self;
  sub_1A46EB5B0();
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v6 = a3;
  v7 = self;
  LOBYTE(a4) = sub_1A46ED2BC(a4);

  return a4 & 1;
}

- (void)resetForRetry
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_probeLock);
  v3 = (void *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1A46EC8F0(v3);
  os_unfair_lock_unlock(v4);
}

- (unint64_t)maxRetries
{
  return -1;
}

- (void)cancel
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_probeLock);
  v3 = (uint64_t *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1A46EC9BC(v3, &v7);
  os_unfair_lock_unlock(v4);
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for PingBasedOnlineNetworkTransitionOperation();
  [(FCOperation *)&v6 cancel];
}

- (_TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation)init
{
  result = (_TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_log));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

@end