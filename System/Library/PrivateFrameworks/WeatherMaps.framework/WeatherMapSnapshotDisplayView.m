@interface WeatherMapSnapshotDisplayView
- (_TtC11WeatherMaps29WeatherMapSnapshotDisplayView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps29WeatherMapSnapshotDisplayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation WeatherMapSnapshotDisplayView

- (void)layoutSubviews
{
  v2 = self;
  sub_20A1D4F9C();
}

- (_TtC11WeatherMaps29WeatherMapSnapshotDisplayView)initWithFrame:(CGRect)a3
{
  return (_TtC11WeatherMaps29WeatherMapSnapshotDisplayView *)sub_20A1D55F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11WeatherMaps29WeatherMapSnapshotDisplayView)initWithCoder:(id)a3
{
  return (_TtC11WeatherMaps29WeatherMapSnapshotDisplayView *)sub_20A1D56CC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps29WeatherMapSnapshotDisplayView____lazy_storage___mapLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps29WeatherMapSnapshotDisplayView____lazy_storage___baseLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps29WeatherMapSnapshotDisplayView____lazy_storage___weatherOverlayLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11WeatherMaps29WeatherMapSnapshotDisplayView____lazy_storage___effectOverlayLayer);
}

@end