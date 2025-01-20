@interface BrandedAppTodayCardLargeIconBackgroundView
- (_TtC8AppStore42BrandedAppTodayCardLargeIconBackgroundView)initWithCoder:(id)a3;
- (_TtC8AppStore42BrandedAppTodayCardLargeIconBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BrandedAppTodayCardLargeIconBackgroundView

- (_TtC8AppStore42BrandedAppTodayCardLargeIconBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore42BrandedAppTodayCardLargeIconBackgroundView *)sub_1005AE1AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore42BrandedAppTodayCardLargeIconBackgroundView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore42BrandedAppTodayCardLargeIconBackgroundView_style;
  uint64_t v6 = type metadata accessor for Artwork.Style();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore42BrandedAppTodayCardLargeIconBackgroundView_image) = 0;
  id v7 = a3;

  result = (_TtC8AppStore42BrandedAppTodayCardLargeIconBackgroundView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005AE6D8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore42BrandedAppTodayCardLargeIconBackgroundView_backgroundImageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore42BrandedAppTodayCardLargeIconBackgroundView_gradientLayer));
  sub_10058A138((uint64_t)self + OBJC_IVAR____TtC8AppStore42BrandedAppTodayCardLargeIconBackgroundView_style);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore42BrandedAppTodayCardLargeIconBackgroundView_image);
}

@end