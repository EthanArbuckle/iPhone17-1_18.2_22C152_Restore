@interface SocialOnboardingNetworkStatusViewController
- (_TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4143SocialOnboardingNetworkStatusViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4143SocialOnboardingNetworkStatusViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SocialOnboardingNetworkStatusViewController

- (_TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4143SocialOnboardingNetworkStatusViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_376358();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_3700C8();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_37090C();
}

- (_TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4143SocialOnboardingNetworkStatusViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4143SocialOnboardingNetworkStatusViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4143SocialOnboardingNetworkStatusViewController_network));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4143SocialOnboardingNetworkStatusViewController_networkLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplicationP33_B8BEB5E19410BDA0BB2B4503F9E0BB4143SocialOnboardingNetworkStatusViewController_networkStateLabel);
}

@end