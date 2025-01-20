@interface TTRIRemindersListScrollingController
- (_TtC9Reminders36TTRIRemindersListScrollingController)init;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
@end

@implementation TTRIRemindersListScrollingController

- (_TtC9Reminders36TTRIRemindersListScrollingController)init
{
  result = (_TtC9Reminders36TTRIRemindersListScrollingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders36TTRIRemindersListScrollingController_extenalScrollViewDelegate);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersListScrollingController_treeView));
  swift_release();
  swift_release();
  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders36TTRIRemindersListScrollingController_pendingStartEditingItem, &qword_1007ABB10);
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v6 = Strong;
    if ([Strong respondsToSelector:"scrollViewWillBeginDragging:"])
    {
      id v7 = a3;
      v8 = self;
      [v6 scrollViewWillBeginDragging:v7];
    }
    swift_unknownObjectRelease();
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    id v6 = a3;
    id v7 = self;
    sub_1005FD7DC();
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1005FD7DC();
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1005FE5FC();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1005FE730();
}

@end