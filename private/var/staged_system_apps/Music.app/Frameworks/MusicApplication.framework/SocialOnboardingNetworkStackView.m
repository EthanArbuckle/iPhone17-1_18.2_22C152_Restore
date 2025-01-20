@interface SocialOnboardingNetworkStackView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SocialOnboardingNetworkStackView

- (_TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView *)sub_39DCB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_39F0E8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_39E438();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_39EE6C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView_titleLabel));

  swift_bridgeObjectRelease();
}

@end