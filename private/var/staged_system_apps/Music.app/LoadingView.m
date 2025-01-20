@interface LoadingView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11MusicCoreUI11LoadingView)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI11LoadingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LoadingView

- (_TtC11MusicCoreUI11LoadingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100BF6DC4();
}

- (void)layoutSubviews
{
  v2 = self;
  LoadingView.layoutSubviews()();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = LoadingView.sizeThatFits(_:)(0.0, 0.0);
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  double v6 = LoadingView.sizeThatFits(_:)(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (_TtC11MusicCoreUI11LoadingView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC11MusicCoreUI11LoadingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI11LoadingView_activityIndicator));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MusicCoreUI11LoadingView____lazy_storage___progressBar);
}

@end