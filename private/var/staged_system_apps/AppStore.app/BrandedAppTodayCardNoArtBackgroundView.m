@interface BrandedAppTodayCardNoArtBackgroundView
- (_TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView)initWithCoder:(id)a3;
- (_TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BrandedAppTodayCardNoArtBackgroundView

- (_TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView *)sub_1005894D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView_style;
  uint64_t v6 = type metadata accessor for Artwork.Style();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView_image) = 0;
  id v7 = a3;

  result = (_TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100589A1C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView_imageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView_gradientLayer));
  sub_10058A138((uint64_t)self + OBJC_IVAR____TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView_style);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView_image);
}

@end