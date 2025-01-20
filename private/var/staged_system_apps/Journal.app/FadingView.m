@interface FadingView
- (CGRect)bounds;
- (_TtC7Journal10FadingView)initWithCoder:(id)a3;
- (_TtC7Journal10FadingView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
@end

@implementation FadingView

- (_TtC7Journal10FadingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC7Journal10FadingView_contentFadeGradientLayer;
  id v9 = objc_allocWithZone((Class)CAGradientLayer);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[v9 init];
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC7Journal10FadingView_fadeLocations) = 0;
  *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC7Journal10FadingView_fadeColors) = 0;

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for FadingView();
  v11 = -[FadingView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  sub_1001E73E0();

  return v11;
}

- (_TtC7Journal10FadingView)initWithCoder:(id)a3
{
  return (_TtC7Journal10FadingView *)sub_1001E72F4(a3);
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FadingView();
  [(FadingView *)&v6 bounds];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FadingView();
  v7 = (char *)v9.receiver;
  -[FadingView setBounds:](&v9, "setBounds:", x, y, width, height);
  uint64_t v8 = *(void **)&v7[OBJC_IVAR____TtC7Journal10FadingView_contentFadeGradientLayer];
  [v7 bounds];
  [v8 setFrame:];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal10FadingView_contentFadeGradientLayer));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end