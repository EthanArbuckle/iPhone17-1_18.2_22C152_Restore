@interface OverlayView
- (BOOL)vuiDebugUI;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (VUILabel)accessibilityTitleLabel;
- (_TtC8VideosUI11OverlayView)initWithCoder:(id)a3;
- (_TtC8VideosUI11OverlayView)initWithFrame:(CGRect)a3;
@end

@implementation OverlayView

- (_TtC8VideosUI11OverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI11OverlayView *)sub_1E3150524();
}

- (BOOL)vuiDebugUI
{
  return 0;
}

- (_TtC8VideosUI11OverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E315063C();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E3150734(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (VUILabel)accessibilityTitleLabel
{
  v2 = self;
  id v3 = (void *)sub_1E31512C4();

  return (VUILabel *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8VideosUI11OverlayView_progressView);
}

@end