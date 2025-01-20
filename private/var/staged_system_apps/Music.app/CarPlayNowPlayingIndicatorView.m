@interface CarPlayNowPlayingIndicatorView
- (BOOL)isHighlighted;
- (BOOL)isPlaying;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC5Music30CarPlayNowPlayingIndicatorView)init;
- (_TtC5Music30CarPlayNowPlayingIndicatorView)initWithCoder:(id)a3;
- (_TtC5Music30CarPlayNowPlayingIndicatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setIsHighlighted:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
@end

@implementation CarPlayNowPlayingIndicatorView

- (_TtC5Music30CarPlayNowPlayingIndicatorView)init
{
  return (_TtC5Music30CarPlayNowPlayingIndicatorView *)sub_100222CE0();
}

- (_TtC5Music30CarPlayNowPlayingIndicatorView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_isPlaying) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_isHighlighted) = 0;
  uint64_t v4 = OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_waveform;
  uint64_t v5 = qword_101098270;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  v7 = (void *)qword_101129988;
  id v8 = objc_allocWithZone((Class)type metadata accessor for WaveformPlayIndicator());
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)WaveformPlayIndicator.init(settings:)(v7);

  result = (_TtC5Music30CarPlayNowPlayingIndicatorView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isPlaying
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_isPlaying);
}

- (void)setIsPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_isPlaying) = a3;
  uint64_t v5 = self;
  if (v3) {
    unsigned __int8 v4 = 3;
  }
  else {
    unsigned __int8 v4 = 1;
  }
  WaveformPlayIndicator.mode.setter(v4);
}

- (BOOL)isHighlighted
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_isHighlighted);
}

- (void)setIsHighlighted:(BOOL)a3
{
  unsigned __int8 v4 = self;
  sub_1002230D4(a3);
}

- (CGSize)intrinsicContentSize
{
  double v2 = 24.0;
  double v3 = 24.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  double v2 = (char *)v4.receiver;
  [(CarPlayNowPlayingIndicatorView *)&v4 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_waveform];
  [v2 bounds];
  [v3 setFrame:];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 24.0;
  double v4 = 24.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC5Music30CarPlayNowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC5Music30CarPlayNowPlayingIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music30CarPlayNowPlayingIndicatorView_waveform));
}

@end