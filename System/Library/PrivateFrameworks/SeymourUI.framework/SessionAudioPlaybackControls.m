@interface SessionAudioPlaybackControls
- (_TtC9SeymourUI28SessionAudioPlaybackControls)initWithCoder:(id)a3;
- (_TtC9SeymourUI28SessionAudioPlaybackControls)initWithFrame:(CGRect)a3;
- (void)playbackControlTapped:(id)a3;
@end

@implementation SessionAudioPlaybackControls

- (_TtC9SeymourUI28SessionAudioPlaybackControls)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI28SessionAudioPlaybackControls *)sub_23A7758F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI28SessionAudioPlaybackControls)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_onPlaybackControlTapped);
  void *v5 = 0;
  v5[1] = 0;
  uint64_t v6 = OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_stackView;
  id v7 = objc_allocWithZone(MEMORY[0x263F82BF8]);
  id v8 = a3;
  id v9 = objc_msgSend(v7, sel_init);
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)v9;

  result = (_TtC9SeymourUI28SessionAudioPlaybackControls *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)playbackControlTapped:(id)a3
{
  v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_onPlaybackControlTapped);
  if (v3)
  {
    id v5 = a3;
    uint64_t v6 = self;
    sub_239D03E2C((uint64_t)v3);
    v3(v5);
    sub_239C25118((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_onPlaybackControlTapped));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_playPauseControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_skipBackwardControl));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI28SessionAudioPlaybackControls_skipForwardControl);
}

@end