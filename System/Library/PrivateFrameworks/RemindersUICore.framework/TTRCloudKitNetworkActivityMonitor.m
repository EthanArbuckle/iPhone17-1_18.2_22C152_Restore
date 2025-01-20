@interface TTRCloudKitNetworkActivityMonitor
- (_TtC15RemindersUICore33TTRCloudKitNetworkActivityMonitor)init;
- (void)cloudKitNetworkActivityDidChange:(id)a3;
@end

@implementation TTRCloudKitNetworkActivityMonitor

- (_TtC15RemindersUICore33TTRCloudKitNetworkActivityMonitor)init
{
  result = (_TtC15RemindersUICore33TTRCloudKitNetworkActivityMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore33TTRCloudKitNetworkActivityMonitor_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore33TTRCloudKitNetworkActivityMonitor_queue));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15RemindersUICore33TTRCloudKitNetworkActivityMonitor_executeToken);
}

- (void)cloudKitNetworkActivityDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  TTRCloudKitNetworkActivityMonitor.cloudKitNetworkActivityDidChange(_:)((NSNumber)v4);
}

@end