@interface MainToolbarController
- (TUISyncLayoutController)syncLayoutController;
- (_TtC5Books21MainToolbarController)initWithCoder:(id)a3;
- (_TtC5Books21MainToolbarController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setSyncLayoutController:(id)a3;
- (void)syncLayoutControllerNeedsFlushing:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MainToolbarController

- (TUISyncLayoutController)syncLayoutController
{
  return (TUISyncLayoutController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                            + OBJC_IVAR____TtC5Books21MainToolbarController_syncLayoutController));
}

- (void)setSyncLayoutController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books21MainToolbarController_syncLayoutController);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books21MainToolbarController_syncLayoutController) = (Class)a3;
  id v3 = a3;
}

- (_TtC5Books21MainToolbarController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books21MainToolbarController_cancellable) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Books21MainToolbarController____lazy_storage___toolbarView) = 0;
  id v5 = a3;

  result = (_TtC5Books21MainToolbarController *)sub_1007FF260();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006AA670();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1006AAC7C();
}

- (_TtC5Books21MainToolbarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Books21MainToolbarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books21MainToolbarController_interactor);
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books21MainToolbarController_presenter);
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books21MainToolbarController_router);
  swift_release();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books21MainToolbarController_syncLayoutController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books21MainToolbarController_mainContentViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books21MainToolbarController____lazy_storage___toolbarView);
}

- (void)syncLayoutControllerNeedsFlushing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(MainToolbarController *)v5 view];
  [v6 setNeedsLayout];
}

@end