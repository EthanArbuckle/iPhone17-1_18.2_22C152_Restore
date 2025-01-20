@interface WeatherMapSnapshotView
- (_TtC11WeatherMaps22WeatherMapSnapshotView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps22WeatherMapSnapshotView)initWithFrame:(CGRect)a3;
- (void)darkerSystemColorsStatusDidChange:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation WeatherMapSnapshotView

- (_TtC11WeatherMaps22WeatherMapSnapshotView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A1E7C10();
}

- (void)dealloc
{
  v2 = self;
  sub_20A1E7DB4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView____lazy_storage___snapshotDisplayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_annotationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_debugLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_errorLabelEffect));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_errorEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_errorLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_errorPlatterView));
  swift_unknownObjectWeakDestroy();
  swift_release();
  sub_20A1F1460((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_snapshot, qword_26AC3B418);
  sub_20A1F1460((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_weatherData, &qword_26AC39130);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A1E7FCC();
}

- (void)darkerSystemColorsStatusDidChange:(id)a3
{
  uint64_t v4 = sub_20A388FE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A388FB0();
  v8 = self;
  sub_20A1EC988(v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11WeatherMaps22WeatherMapSnapshotView)initWithFrame:(CGRect)a3
{
}

@end