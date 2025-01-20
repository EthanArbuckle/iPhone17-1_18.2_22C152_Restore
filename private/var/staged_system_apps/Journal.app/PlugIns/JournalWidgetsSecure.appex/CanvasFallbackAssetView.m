@interface CanvasFallbackAssetView
- (_TtC20JournalWidgetsSecure23CanvasFallbackAssetView)initWithCoder:(id)a3;
- (_TtC20JournalWidgetsSecure23CanvasFallbackAssetView)initWithFrame:(CGRect)a3;
@end

@implementation CanvasFallbackAssetView

- (_TtC20JournalWidgetsSecure23CanvasFallbackAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC20JournalWidgetsSecure23CanvasFallbackAssetView *)sub_1000F41D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20JournalWidgetsSecure23CanvasFallbackAssetView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20JournalWidgetsSecure23CanvasFallbackAssetView_symbolImageView;
  id v6 = objc_allocWithZone((Class)UIImageView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC20JournalWidgetsSecure23CanvasFallbackAssetView *)sub_1001055C8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure23CanvasFallbackAssetView_symbolImageView));
}

@end