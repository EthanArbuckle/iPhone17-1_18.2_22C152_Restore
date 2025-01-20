@interface MBDryRestoreActivity
- (NSString)identifier;
- (OS_dispatch_queue)workQueue;
- (id)nextTaskRequestWithCurrentTaskRequest:(id)a3;
- (void)interruptWithReason:(unint64_t)a3;
- (void)invoke;
- (void)setIdentifier:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation MBDryRestoreActivity

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  *(void *)self->identifier = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)&self->identifier[8] = v4;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)*(id *)self->workQueue;
}

- (void)setWorkQueue:(id)a3
{
  id v4 = *(id *)self->workQueue;
  *(void *)self->workQueue = a3;
  id v3 = a3;
}

- (void)interruptWithReason:(unint64_t)a3
{
  swift_retain();
  sub_1000476F8(a3);
  swift_release();
}

- (void)invoke
{
  swift_retain();
  sub_100045F18(0xD00000000000001CLL, 0x8000000100307E60, 0xD000000000000017, 0x8000000100307D60);
  sub_10005530C();
  swift_release();
}

- (id)nextTaskRequestWithCurrentTaskRequest:(id)a3
{
  id v3 = a3;
  swift_retain();
  id v4 = sub_100048800();

  swift_release();
  return v4;
}

@end