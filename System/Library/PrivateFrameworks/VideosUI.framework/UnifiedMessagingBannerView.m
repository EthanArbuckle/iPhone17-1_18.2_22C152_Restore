@interface UnifiedMessagingBannerView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI26UnifiedMessagingBannerView)initWithCoder:(id)a3;
- (_TtC8VideosUI26UnifiedMessagingBannerView)initWithFrame:(CGRect)a3;
@end

@implementation UnifiedMessagingBannerView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E34958BC(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtC8VideosUI26UnifiedMessagingBannerView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI26UnifiedMessagingBannerView *)sub_1E3495A58();
}

- (_TtC8VideosUI26UnifiedMessagingBannerView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI26UnifiedMessagingBannerView *)sub_1E3495AE4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26UnifiedMessagingBannerView_bannerContentView));
  swift_release();
}

@end