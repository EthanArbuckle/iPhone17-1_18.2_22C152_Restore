@interface PinnedButtonContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PinnedButtonContainerView

- (_TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView *)sub_1A139C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1A326C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_1A1804(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1A1B50();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView_embeddedChildViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView_visualEffectView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView_headerLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplicationP33_B95EA7AEEA306FB0B77EC0083A5C6FD425PinnedButtonContainerView_footerLabel);
}

@end