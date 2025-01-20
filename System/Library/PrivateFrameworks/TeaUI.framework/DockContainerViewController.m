@interface DockContainerViewController
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)canBecomeFirstResponder;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)shouldAutorotate;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC5TeaUI27DockContainerViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI27DockContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)dockedViewLongPressed;
- (void)dockedViewTapped;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)showDetailViewController:(id)a3 sender:(id)a4;
- (void)showViewController:(id)a3 sender:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation DockContainerViewController

- (_TtC5TeaUI27DockContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B6069430();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  v2 = self;
  id v3 = (void *)DockContainerViewController.childForStatusBarStyle.getter();

  return (UIViewController *)v3;
}

- (void)viewDidLoad
{
  v2 = self;
  DockContainerViewController.viewDidLoad()();
}

- (BOOL)shouldAutorotate
{
  v2 = self;
  unsigned __int8 v3 = DockContainerViewController.shouldAutorotate.getter();

  return v3 & 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  DockContainerViewController.viewDidLayoutSubviews()();
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_1B606C638;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  DockContainerViewController.present(_:animated:completion:)((uint64_t)v10, a4, (uint64_t)v8, v9);
  sub_1B5E3799C((uint64_t)v8);
}

- (void)showViewController:(id)a3 sender:(id)a4
{
}

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1B606C4DC;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  DockContainerViewController.dismiss(animated:completion:)(a3, v6, v7);
  sub_1B5E3799C((uint64_t)v6);
}

- (void)dockedViewTapped
{
  v2 = self;
  sub_1B606ABF4();
}

- (void)dockedViewLongPressed
{
  v2 = self;
  sub_1B606AC48();
}

- (_TtC5TeaUI27DockContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  DockContainerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI27DockContainerViewController_dockView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI27DockContainerViewController____lazy_storage___dockHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI27DockContainerViewController____lazy_storage___dockedView));
  unsigned __int8 v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI27DockContainerViewController____lazy_storage___expandedViewController);
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = DockContainerViewController.animationController(forDismissed:)(v4);

  return v6;
}

- (BOOL)accessibilityPerformMagicTap
{
  v2 = self;
  DockContainerViewController.accessibilityPerformMagicTap()();

  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

@end