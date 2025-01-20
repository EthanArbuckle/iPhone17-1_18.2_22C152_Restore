@interface SessionAudioPlayerView
- (_TtC9SeymourUI22SessionAudioPlayerView)initWithCoder:(id)a3;
- (_TtC9SeymourUI22SessionAudioPlayerView)initWithFrame:(CGRect)a3;
- (void)collapseButtonTapped:(id)a3;
- (void)exitButtonTapped:(id)a3;
@end

@implementation SessionAudioPlayerView

- (_TtC9SeymourUI22SessionAudioPlayerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A1A2CD0();
}

- (void)collapseButtonTapped:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_presenter);
  if (v3)
  {
    v4 = *(void (**)(uint64_t))(v3 + 32);
    if (v4)
    {
      id v6 = a3;
      v8 = self;
      uint64_t v7 = sub_239D03E2C((uint64_t)v4);
      v4(v7);
      sub_239C25118((uint64_t)v4);
    }
  }
}

- (void)exitButtonTapped:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_presenter);
  if (v3)
  {
    v4 = *(void (**)(uint64_t))(v3 + 48);
    if (v4)
    {
      id v6 = a3;
      v8 = self;
      uint64_t v7 = sub_239D03E2C((uint64_t)v4);
      v4(v7);
      sub_239C25118((uint64_t)v4);
    }
  }
}

- (_TtC9SeymourUI22SessionAudioPlayerView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI22SessionAudioPlayerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_animatedBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_actionButtonsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_playbackControlsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_playbackMetadataView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_playbackTimeControl));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_volumeSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_actionButtonsLayoutGuideHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_artworkViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_artworkViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_grabberTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_metadataLayoutGuideHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_playbackControlsLayoutGuideHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_playbackTimeControlWidthConstraint));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI22SessionAudioPlayerView_volumeSliderBottomConstraint);
}

@end