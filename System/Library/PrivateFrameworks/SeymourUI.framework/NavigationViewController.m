@interface NavigationViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC9SeymourUI24NavigationViewController)init;
- (_TtC9SeymourUI24NavigationViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI24NavigationViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC9SeymourUI24NavigationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9SeymourUI24NavigationViewController)initWithRootViewController:(id)a3;
- (void)menuButtonTapped;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)viewDidLoad;
@end

@implementation NavigationViewController

- (_TtC9SeymourUI24NavigationViewController)init
{
  v3 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PlaceholderViewController()), sel_init);
  objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC9SeymourUI25PlaceholderViewController_activityIndicator], sel_startAnimating);
  v4 = [(NavigationViewController *)self initWithRootViewController:v3];

  return v4;
}

- (_TtC9SeymourUI24NavigationViewController)initWithRootViewController:(id)a3
{
  return (_TtC9SeymourUI24NavigationViewController *)NavigationViewController.init(rootViewController:)(a3);
}

- (_TtC9SeymourUI24NavigationViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_onShouldBeginRecognizing);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_onMenuTapped);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (_TtC9SeymourUI24NavigationViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NavigationViewController();
  v2 = (char *)v5.receiver;
  [(NavigationViewController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addGestureRecognizer_, *(void *)&v2[OBJC_IVAR____TtC9SeymourUI24NavigationViewController_menuGestureRecognizer]);
  }
  else
  {
    __break(1u);
  }
}

- (void)menuButtonTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_onMenuTapped);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_239D03E2C((uint64_t)v2);
    v2(v3);
    sub_239C25118((uint64_t)v2);
  }
}

- (_TtC9SeymourUI24NavigationViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC9SeymourUI24NavigationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI24NavigationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI24NavigationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_rootViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_menuGestureRecognizer));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_onShouldBeginRecognizing));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_onMenuTapped));

  swift_bridgeObjectRelease();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v3 = *(uint64_t (**)(_TtC9SeymourUI24NavigationViewController *, id))((char *)&self->super.super.super.super.isa
                                                                                + OBJC_IVAR____TtC9SeymourUI24NavigationViewController_onShouldBeginRecognizing);
  if (v3)
  {
    id v5 = a3;
    id v6 = self;
    sub_239D03E2C((uint64_t)v3);
    char v7 = v3(v6, v5);
    sub_239C25118((uint64_t)v3);
  }
  else
  {
    char v7 = 1;
  }
  return v7 & 1;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_239F33E38(v8);
}

@end