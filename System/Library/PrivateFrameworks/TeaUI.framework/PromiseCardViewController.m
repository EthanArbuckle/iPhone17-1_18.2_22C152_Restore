@interface PromiseCardViewController
- (_TtC5TeaUI25PromiseCardViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI25PromiseCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation PromiseCardViewController

- (_TtC5TeaUI25PromiseCardViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5EE174C();
}

- (void)viewDidLoad
{
  v2 = self;
  PromiseCardViewController.viewDidLoad()();
}

- (_TtC5TeaUI25PromiseCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  PromiseCardViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1B5EE2B7C(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5TeaUI25PromiseCardViewController_viewControllerState), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC5TeaUI25PromiseCardViewController_viewControllerState), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC5TeaUI25PromiseCardViewController_viewControllerState), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC5TeaUI25PromiseCardViewController_viewControllerState), *(uint64_t *)((char *)&self->super._view + OBJC_IVAR____TtC5TeaUI25PromiseCardViewController_viewControllerState));
  swift_bridgeObjectRelease();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5TeaUI25PromiseCardViewController_activityIndicatorView);
}

@end