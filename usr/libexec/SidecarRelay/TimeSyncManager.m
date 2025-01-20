@interface TimeSyncManager
- (_TtC15SidecarTimeSyncP33_52E478E0294A7D1A30B0593D640BE43C15TimeSyncManager)init;
- (void)interruptedConnectionForClockManager:(id)a3;
@end

@implementation TimeSyncManager

- (_TtC15SidecarTimeSyncP33_52E478E0294A7D1A30B0593D640BE43C15TimeSyncManager)init
{
  return (_TtC15SidecarTimeSyncP33_52E478E0294A7D1A30B0593D640BE43C15TimeSyncManager *)sub_100076B84();
}

- (void).cxx_destruct
{
  sub_10007A708(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC15SidecarTimeSyncP33_52E478E0294A7D1A30B0593D640BE43C15TimeSyncManager_activation), self->activation[OBJC_IVAR____TtC15SidecarTimeSyncP33_52E478E0294A7D1A30B0593D640BE43C15TimeSyncManager_activation]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)interruptedConnectionForClockManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10007792C();
}

@end