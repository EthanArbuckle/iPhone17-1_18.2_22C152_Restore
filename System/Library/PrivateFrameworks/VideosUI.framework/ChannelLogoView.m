@interface ChannelLogoView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI15ChannelLogoView)initWithCoder:(id)a3;
- (_TtC8VideosUI15ChannelLogoView)initWithFrame:(CGRect)a3;
@end

@implementation ChannelLogoView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v5 = self;
  double v6 = sub_1E30C9F1C(a4);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC8VideosUI15ChannelLogoView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI15ChannelLogoView *)sub_1E30CA9AC();
}

- (_TtC8VideosUI15ChannelLogoView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI15ChannelLogoView *)sub_1E30CAA28(a3);
}

- (void).cxx_destruct
{
  swift_release();
  sub_1E30CAB10(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC8VideosUI15ChannelLogoView____lazy_storage___appleTvImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15ChannelLogoView_channelImageView));
  swift_release();
}

@end