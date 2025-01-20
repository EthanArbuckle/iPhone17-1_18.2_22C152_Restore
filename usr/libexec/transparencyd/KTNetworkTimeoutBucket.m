@interface KTNetworkTimeoutBucket
- (NSString)sysdiagnose;
- (_TtC13transparencyd22KTNetworkTimeoutBucket)init;
- (id)networkTimeoutOperation;
- (id)onQueueNetworkTimeoutOperation;
- (void)networkWithFeedback:(int64_t)a3;
@end

@implementation KTNetworkTimeoutBucket

- (_TtC13transparencyd22KTNetworkTimeoutBucket)init
{
  return (_TtC13transparencyd22KTNetworkTimeoutBucket *)KTNetworkTimeoutBucket.init()();
}

- (NSString)sysdiagnose
{
  v2 = self;
  OS_dispatch_queue.sync<A>(execute:)();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (id)networkTimeoutOperation
{
  v2 = self;
  sub_100080E08(&qword_100321BC0);
  OS_dispatch_queue.sync<A>(execute:)();

  return v4;
}

- (id)onQueueNetworkTimeoutOperation
{
  v2 = self;
  NSString v3 = (void *)KTNetworkTimeoutBucket.onQueueNetworkTimeoutOperation()();

  return v3;
}

- (void)networkWithFeedback:(int64_t)a3
{
  id v4 = self;
  KTNetworkTimeoutBucket.network(feedback:)(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  NSString v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13transparencyd22KTNetworkTimeoutBucket_networkTimeoutDependency);
}

@end