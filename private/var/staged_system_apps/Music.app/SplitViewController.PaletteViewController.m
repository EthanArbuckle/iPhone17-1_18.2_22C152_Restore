@interface SplitViewController.PaletteViewController
- (_TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController)initWithCoder:(id)a3;
- (_TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation SplitViewController.PaletteViewController

- (_TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003483AC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10034301C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10034330C();
}

- (void)viewSafeAreaInsetsDidChange
{
  v2 = self;
  sub_10034343C();
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SplitViewController.PaletteViewController();
  id v2 = v3.receiver;
  [(SplitViewController.PaletteViewController *)&v3 viewLayoutMarginsDidChange];
  sub_1003445E0();
}

- (int64_t)preferredStatusBarStyle
{
  id v2 = self;
  unint64_t v3 = sub_1003436C8();

  return v3;
}

- (_TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController_contentNavigationController));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController_onWillNavigateToViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController_accessoryViewController));
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController____lazy_storage___accessoryContainerView);
}

@end