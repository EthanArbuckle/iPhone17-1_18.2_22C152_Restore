@interface DetailHeader.PlaylistVisibilitySwitchContainerView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView)initWithCoder:(id)a3;
- (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DetailHeader.PlaylistVisibilitySwitchContainerView

- (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView)initWithFrame:(CGRect)a3
{
  return (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView *)sub_2D68D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2D8240();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2D6B94();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 56.0;
  result.height = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = UIViewNoIntrinsicMetric;
  double v3 = 56.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView_switchButton));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication12DetailHeader37PlaylistVisibilitySwitchContainerView_textStackView);
}

@end