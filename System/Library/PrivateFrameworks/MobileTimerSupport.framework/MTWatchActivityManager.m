@interface MTWatchActivityManager
+ (_TtC18MobileTimerSupport22MTWatchActivityManager)shared;
+ (void)setShared:(id)a3;
- (_TtC18MobileTimerSupport22MTWatchActivityManager)init;
- (void)endActivityWithAlarmID:(id)a3;
- (void)startActivityWithAlarmID:(id)a3 firingDate:(id)a4;
@end

@implementation MTWatchActivityManager

+ (_TtC18MobileTimerSupport22MTWatchActivityManager)shared
{
  if (qword_1EA1052C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (_TtC18MobileTimerSupport22MTWatchActivityManager *)(id)qword_1EA106DC8;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_1EA1052C0;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)qword_1EA106DC8;
  qword_1EA106DC8 = (uint64_t)v4;
}

- (void)startActivityWithAlarmID:(id)a3 firingDate:(id)a4
{
  uint64_t v4 = sub_1BE322E70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE322E50();
  uint64_t v8 = sub_1BE322E20();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE322DE0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)endActivityWithAlarmID:(id)a3
{
  uint64_t v3 = sub_1BE322E70();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE322E50();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (_TtC18MobileTimerSupport22MTWatchActivityManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC18MobileTimerSupport22MTWatchActivityManager_activityManager;
  uint64_t v5 = qword_1EA105260;
  uint64_t v6 = self;
  if (v5 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *(Class *)((char *)&v6->super.isa + v4) = (Class)qword_1EA105CD8;
  sub_1BE322750();

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return [(MTWatchActivityManager *)&v8 init];
}

- (void).cxx_destruct
{
}

@end