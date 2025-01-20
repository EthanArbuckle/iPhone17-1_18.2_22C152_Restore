@interface TTRISegmentedNavigationController
- (_TtC9Reminders33TTRISegmentedNavigationController)initWithCoder:(id)a3;
- (_TtC9Reminders33TTRISegmentedNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC9Reminders33TTRISegmentedNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9Reminders33TTRISegmentedNavigationController)initWithRootViewController:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation TTRISegmentedNavigationController

- (_TtC9Reminders33TTRISegmentedNavigationController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders33TTRISegmentedNavigationController_segmentedControl) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders33TTRISegmentedNavigationController_palette) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC9Reminders33TTRISegmentedNavigationController_selectedTabID);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC9Reminders33TTRISegmentedNavigationController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRISegmentedNavigationController();
  id v2 = v3.receiver;
  [(TTRISegmentedNavigationController *)&v3 viewDidLoad];
  sub_1003B655C();
  [v2 setDelegate:v2];
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_1003B7000();
}

- (_TtC9Reminders33TTRISegmentedNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC9Reminders33TTRISegmentedNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9Reminders33TTRISegmentedNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC9Reminders33TTRISegmentedNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9Reminders33TTRISegmentedNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders33TTRISegmentedNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRISegmentedNavigationController_segmentedControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders33TTRISegmentedNavigationController_palette));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1003B6904(v8);
}

@end