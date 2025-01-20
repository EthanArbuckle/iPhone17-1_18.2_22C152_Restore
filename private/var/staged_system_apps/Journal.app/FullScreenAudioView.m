@interface FullScreenAudioView
- (BOOL)accessibilityPerformMagicTap;
- (_TtC7Journal19FullScreenAudioView)initWithCoder:(id)a3;
- (_TtC7Journal19FullScreenAudioView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)toggleAudioButton;
@end

@implementation FullScreenAudioView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FullScreenAudioView();
  id v2 = v3.receiver;
  [(FullScreenAudioView *)&v3 layoutSubviews];
  sub_100322F90();
  sub_100323404();
}

- (BOOL)accessibilityPerformMagicTap
{
  id v2 = self;
  sub_100322CB0();

  return 1;
}

- (void)toggleAudioButton
{
  id v2 = self;
  sub_100322CB0();
}

- (_TtC7Journal19FullScreenAudioView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal19FullScreenAudioView *)sub_1003243C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal19FullScreenAudioView)initWithCoder:(id)a3
{
  return (_TtC7Journal19FullScreenAudioView *)sub_1003245F8(a3);
}

- (void).cxx_destruct
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC7Journal19FullScreenAudioView_playConfig;
  uint64_t v4 = type metadata accessor for UIButton.Configuration();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC7Journal19FullScreenAudioView_pauseConfig, v4);

  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Journal19FullScreenAudioView_currentPlaybackTimer);
}

@end