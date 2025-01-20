@interface WaveformPlayIndicator
- (_TtC11MusicCoreUI21WaveformPlayIndicator)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI21WaveformPlayIndicator)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation WaveformPlayIndicator

- (_TtC11MusicCoreUI21WaveformPlayIndicator)initWithCoder:(id)a3
{
  id v3 = a3;
  _s11MusicCoreUI21WaveformPlayIndicatorC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)tintColorDidChange
{
  v2 = self;
  WaveformPlayIndicator.tintColorDidChange()();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(WaveformPlayIndicator *)&v3 layoutSubviews];
  if (!*(void *)&v2[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_exclusiveAnimation]) {
    sub_100528D04();
  }
}

- (void)didMoveToWindow
{
  v2 = self;
  WaveformPlayIndicator.didMoveToWindow()();
}

- (_TtC11MusicCoreUI21WaveformPlayIndicator)initWithFrame:(CGRect)a3
{
  result = (_TtC11MusicCoreUI21WaveformPlayIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette);
  v4 = *(void **)&self->mode[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette];
  v5 = *(void **)&self->colorPalette[OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_colorPalette + 7];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_waveform));
  swift_release();
  swift_release();
  v6 = (char *)self + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator__isVisible;
  uint64_t v7 = sub_10000BB04(&qword_1006754B0);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI21WaveformPlayIndicator_settings));

  swift_release();
}

@end