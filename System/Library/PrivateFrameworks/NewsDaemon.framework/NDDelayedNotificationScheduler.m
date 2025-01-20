@interface NDDelayedNotificationScheduler
- (NDDelayedNotificationScheduler)init;
- (void)activate;
- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4;
@end

@implementation NDDelayedNotificationScheduler

- (void)activate
{
  v2 = self;
  sub_1000268DC();
}

- (NDDelayedNotificationScheduler)init
{
  result = (NDDelayedNotificationScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000185C0((uint64_t)self + OBJC_IVAR___NDDelayedNotificationScheduler_timetableFactory);
  sub_1000185C0((uint64_t)self + OBJC_IVAR___NDDelayedNotificationScheduler_notificationVendor);
  sub_1000185C0((uint64_t)self + OBJC_IVAR___NDDelayedNotificationScheduler_notificationHistory);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NDDelayedNotificationScheduler_notificationCenter);
}

- (void)userNotificationCenter:(id)a3 didChangeSettings:(id)a4
{
  uint64_t v7 = sub_1000170E8(&qword_10006B220);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void *)FCNotificationsLog;
  id v11 = a3;
  id v12 = a4;
  v13 = self;
  id v14 = v10;
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v13;
  v17 = v13;
  sub_10001A6F0((uint64_t)v9, (uint64_t)&unk_10006B230, (uint64_t)v16);

  swift_release();
}

@end