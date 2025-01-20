@interface AudiobookNowPlayingFullscreenTouchView
- (_TtC5Books38AudiobookNowPlayingFullscreenTouchView)initWithCoder:(id)a3;
- (_TtC5Books38AudiobookNowPlayingFullscreenTouchView)initWithFrame:(CGRect)a3;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)cancelDownload:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)onClose:(id)a3;
- (void)onNarrationSpeed:(id)a3;
- (void)onPlayPause:(id)a3;
- (void)onTOC:(id)a3;
- (void)relayoutSubviews;
- (void)setChapterProgress:(id)a3;
- (void)skipBackwardStart:(id)a3;
- (void)skipBackwardTouchCancel:(id)a3;
- (void)skipBackwardTouchUpInside:(id)a3;
- (void)skipForwardStart:(id)a3;
- (void)skipForwardTouchCancel:(id)a3;
- (void)skipForwardTouchUpInside:(id)a3;
- (void)startDownload:(id)a3;
@end

@implementation AudiobookNowPlayingFullscreenTouchView

- (_TtC5Books38AudiobookNowPlayingFullscreenTouchView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003E4500();
}

- (void)dealloc
{
  id v3 = (objc_class *)type metadata accessor for AudiobookNowPlayingFullscreenTouchView();
  v6[3] = v3;
  v6[0] = self;
  v4 = self;
  sub_1007FE560();
  _s5Books15CurrentPageViewVwxx_0((uint64_t)v6);
  v5.receiver = v4;
  v5.super_class = v3;
  [(AudiobookNowPlayingFullscreenTouchView *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_viewModel));
  id v3 = (char *)self + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_logger;
  uint64_t v4 = sub_1007F6BC0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_playImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_pauseImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_scrubberImpactBehavior));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView____lazy_storage___backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_artworkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_artworkImageShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_bottomToolbarContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_downloadIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_downloadSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_downloadButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_grabberView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_hudTrack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_loadingSpinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_overflowButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_played));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_progressSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_playbackSpeed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_primaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_primaryTitleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_secondaryTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_secondaryTitleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_sleepButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_toPlay));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_titlesContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_tocButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_transportContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_backgroundGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_lowerHalfGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__playPause));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__playPauseVibrancyEffectContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__skipForwardButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__skipForwardVibrancyEffectContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__skipBackwardButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__skipBackwardVibrancyEffectContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__toPlayInAudiobook));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__mainViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__transportSubcontainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__volumeContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__volumeMaxImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__volumeMinImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_buyButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__routeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView__volumeView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  sub_1003DA76C(a4);

  _s5Books15CurrentPageViewVwxx_0((uint64_t)&v8);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003DB7D8();
  sub_1003DC350();
}

- (void)relayoutSubviews
{
}

- (_TtC5Books38AudiobookNowPlayingFullscreenTouchView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Books38AudiobookNowPlayingFullscreenTouchView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)cancelDownload:(id)a3
{
}

- (void)onClose:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    objc_super v5 = (void *)Strong;
    swift_unknownObjectRetain();
    id v6 = self;
    [v5 close:1];
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

- (void)onPlayPause:(id)a3
{
}

- (void)onNarrationSpeed:(id)a3
{
}

- (void)onTOC:(id)a3
{
}

- (void)setChapterProgress:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1003E3E78();
  swift_unknownObjectRelease();
}

- (void)skipBackwardTouchCancel:(id)a3
{
}

- (void)skipBackwardStart:(id)a3
{
}

- (void)skipBackwardTouchUpInside:(id)a3
{
}

- (void)skipForwardTouchCancel:(id)a3
{
}

- (void)skipForwardStart:(id)a3
{
}

- (void)skipForwardTouchUpInside:(id)a3
{
}

- (void)startDownload:(id)a3
{
}

@end