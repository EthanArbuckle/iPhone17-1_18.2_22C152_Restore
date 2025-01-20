@interface JSUserNotificationAuthorizationViewController
- (_TtC16MusicApplication45JSUserNotificationAuthorizationViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication45JSUserNotificationAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation JSUserNotificationAuthorizationViewController

- (_TtC16MusicApplication45JSUserNotificationAuthorizationViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication45JSUserNotificationAuthorizationViewController_engagementViewController) = 0;
  id v4 = a3;

  result = (_TtC16MusicApplication45JSUserNotificationAuthorizationViewController *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  JSUserNotificationAuthorizationViewController.viewDidLoad()();
}

- (_TtC16MusicApplication45JSUserNotificationAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication45JSUserNotificationAuthorizationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication45JSUserNotificationAuthorizationViewController_userNotificationAuthorizationViewModel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication45JSUserNotificationAuthorizationViewController_engagementViewController);
}

@end