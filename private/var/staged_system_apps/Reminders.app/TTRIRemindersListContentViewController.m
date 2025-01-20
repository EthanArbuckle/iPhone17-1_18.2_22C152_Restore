@interface TTRIRemindersListContentViewController
- (_TtC9Reminders38TTRIRemindersListContentViewController)initWithCoder:(id)a3;
- (_TtC9Reminders38TTRIRemindersListContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)hoverInteraction:(id)a3 didBeginHoverAndHoldAtLocation:(CGPoint)a4 elevation:(double)a5;
- (void)hoverInteractionDidEndHoverAndHold:(id)a3;
- (void)loadView;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TTRIRemindersListContentViewController

- (_TtC9Reminders38TTRIRemindersListContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100392C2C();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = sub_100377F30();
  v6 = *(Class *)((char *)&v5->isa + qword_1007A59F0);
  if (v6)
  {
    v7 = v6;
    sub_100370108();

    v5 = v7;
  }

  v8.receiver = v4;
  v8.super_class = ObjectType;
  [(TTRIRemindersListContentViewController *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_scrollingController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController____lazy_storage___treeView));
  swift_release();
  swift_release();
  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_contextMenuOriginatorItem, (uint64_t *)&unk_100788DC0);
  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_firstVisibleItemToRestore, (uint64_t *)&unk_100788DC0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_internalFocusedCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController____lazy_storage___completedTasksRotor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController____lazy_storage___incompleteTasksRotor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController____lazy_storage___overdueTasksRotor);
}

- (void)loadView
{
  v2 = self;
  id v3 = sub_100377F30();
  [(TTRIRemindersListContentViewController *)v2 setView:v3];

  id v4 = [(TTRIRemindersListContentViewController *)v2 view];
  if (v4)
  {
    id v5 = v4;
    [v4 setPreservesSuperviewLayoutMargins:1];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003782EC();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_100379A60(a3, a4);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100379E9C();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_10037A194(a3);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  id v9 = [v6 nextFocusedView];
  if (v9)
  {
    v10 = v9;
    type metadata accessor for TTRIRemindersListReminderCell();
    id v9 = (id)swift_dynamicCastClass();
    if (!v9)
    {

      id v9 = 0;
    }
  }
  id v11 = *(Class *)((char *)&v8->super.super.super.isa
                 + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_internalFocusedCell);
  *(Class *)((char *)&v8->super.super.super.isa
           + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_internalFocusedCell) = (Class)v9;
}

- (_TtC9Reminders38TTRIRemindersListContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders38TTRIRemindersListContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)hoverInteraction:(id)a3 didBeginHoverAndHoldAtLocation:(CGPoint)a4 elevation:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  id v9 = self;
  sub_1003935B8(v8, x, y);
}

- (void)hoverInteractionDidEndHoverAndHold:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000ABAF4();
  PassthroughSubject.send(_:)();
}

@end