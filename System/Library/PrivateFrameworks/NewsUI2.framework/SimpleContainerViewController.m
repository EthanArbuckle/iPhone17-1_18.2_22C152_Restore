@interface SimpleContainerViewController
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC7NewsUI229SimpleContainerViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI229SimpleContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation SimpleContainerViewController

- (_TtC7NewsUI229SimpleContainerViewController)initWithCoder:(id)a3
{
  result = (_TtC7NewsUI229SimpleContainerViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC7NewsUI229SimpleContainerViewController_contentViewController));
}

- (_TtC7NewsUI229SimpleContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI229SimpleContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229SimpleContainerViewController_contentViewController));
}

@end