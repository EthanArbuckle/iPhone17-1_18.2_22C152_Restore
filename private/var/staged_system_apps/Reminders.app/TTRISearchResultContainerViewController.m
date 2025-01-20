@interface TTRISearchResultContainerViewController
- (_TtC9Reminders39TTRISearchResultContainerViewController)initWithCoder:(id)a3;
- (_TtC9Reminders39TTRISearchResultContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
@end

@implementation TTRISearchResultContainerViewController

- (_TtC9Reminders39TTRISearchResultContainerViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9Reminders39TTRISearchResultContainerViewController_resultViewController);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self + OBJC_IVAR____TtC9Reminders39TTRISearchResultContainerViewController_resultModuleInterface;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  id v6 = a3;

  result = (_TtC9Reminders39TTRISearchResultContainerViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC9Reminders39TTRISearchResultContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders39TTRISearchResultContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100038CD8((uint64_t)self + OBJC_IVAR____TtC9Reminders39TTRISearchResultContainerViewController_resultViewPresenter);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders39TTRISearchResultContainerViewController_resultViewController));
  v3 = (char *)self + OBJC_IVAR____TtC9Reminders39TTRISearchResultContainerViewController_resultModuleInterface;

  sub_100548E70((uint64_t)v3);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100548C74();
}

@end