@interface CardView
- (BOOL)vuiDebugUI;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSArray)accessibilityLabelViews;
- (UIView)accessibilityButton;
- (UIView)accessibilityOverlayView;
- (VUIImageView)accessibilityAppImageView;
- (VUIImageView)accessibilityImageView;
- (_TtC8VideosUI8CardView)initWithCoder:(id)a3;
- (_TtC8VideosUI8CardView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)mainImageLoadedNotificationHandler;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CardView

- (_TtC8VideosUI8CardView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI8CardView *)sub_1E323ABF0();
}

- (_TtC8VideosUI8CardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E323AD08();
}

- (void)dealloc
{
  v2 = self;
  sub_1E323AE08();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI8CardView_imageAndOverlayContainerView));

  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8VideosUI8CardView_bottomSeparatorView);
}

- (BOOL)vuiDebugUI
{
  v2 = self;
  char v3 = sub_1E323AFB4();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_1E323AFE8(a3);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v4 = self;
  sub_1E323B388();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (VUIImageView)accessibilityImageView
{
  v2 = self;
  char v3 = (void *)sub_1E323F9E0();

  return (VUIImageView *)v3;
}

- (VUIImageView)accessibilityAppImageView
{
  v2 = self;
  char v3 = (void *)sub_1E323FA58();

  return (VUIImageView *)v3;
}

- (UIView)accessibilityOverlayView
{
  v2 = self;
  char v3 = (void *)sub_1E323FAD8();

  return (UIView *)v3;
}

- (NSArray)accessibilityLabelViews
{
  v2 = self;
  uint64_t v3 = sub_1E323FB94();

  if (v3)
  {
    sub_1E2BE915C(0, (unint64_t *)&qword_1EBF91530);
    v4 = (void *)sub_1E387CC88();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (UIView)accessibilityButton
{
  v2 = self;
  uint64_t v3 = (void *)sub_1E323FC14();

  return (UIView *)v3;
}

- (void)mainImageLoadedNotificationHandler
{
  v2 = self;
  sub_1E323FC50();
}

@end