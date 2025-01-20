@interface MTAppIntentsManager
+ (_TtC18MobileTimerSupport19MTAppIntentsManager)sharedManager;
- (_TtC18MobileTimerSupport19MTAppIntentsManager)init;
- (_TtP18MobileTimerSupport27MTAppIntentsManagerDelegate_)delegate;
- (void)didAddNewWorldClockWithName:(id)a3;
- (void)didRemoveWorldClockWithName:(id)a3;
- (void)didSelectTabWithTab:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MTAppIntentsManager

+ (_TtC18MobileTimerSupport19MTAppIntentsManager)sharedManager
{
  if (qword_1EB838438 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB838430;
  return (_TtC18MobileTimerSupport19MTAppIntentsManager *)v2;
}

- (_TtP18MobileTimerSupport27MTAppIntentsManagerDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC18MobileTimerSupport19MTAppIntentsManager_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1C1892210](v2);
  return (_TtP18MobileTimerSupport27MTAppIntentsManagerDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)didSelectTabWithTab:(int64_t)a3
{
  v4 = self;
  sub_1BE2F8380(a3);
}

- (void)didAddNewWorldClockWithName:(id)a3
{
}

- (void)didRemoveWorldClockWithName:(id)a3
{
}

- (_TtC18MobileTimerSupport19MTAppIntentsManager)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MTAppIntentsManager();
  return [(MTAppIntentsManager *)&v4 init];
}

- (void).cxx_destruct
{
}

@end