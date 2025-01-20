@interface EpisodeView
- (BOOL)accessibilityIsPlaying;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (UIButton)accessibilityContextButton;
- (UIView)accessibilitySecondSummaryLabel;
- (UIView)accessibilitySummaryLabel;
- (_TtC23ShelfKitCollectionViews11ArtworkView)accessibilityArtworkView;
- (_TtC23ShelfKitCollectionViews11EpisodeView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews11EpisodeView)initWithFrame:(CGRect)a3;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityDurationLabel;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC23ShelfKitCollectionViews18PlaybackStatusView)accessibilityPlaybackView;
- (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel)accessibilityCaptionLabel;
- (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets)accessibilitySummaryButton;
- (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets)summaryButton;
- (_TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView)artworkViewWithPlayback;
- (void)accessibilityPerformPlayPauseAction;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)moreButtonTapWithSender:(id)a3;
- (void)setSummaryButton:(id)a3;
- (void)tintColorDidChange;
- (void)titleTapped;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EpisodeView

- (_TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView)artworkViewWithPlayback
{
  return (_TtC23ShelfKitCollectionViews35LegacyArtworkWithPlaybackStatusView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_artworkViewWithPlayback);
}

- (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets)summaryButton
{
  v2 = self;
  v3 = sub_35F690();

  return (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets *)v3;
}

- (void)setSummaryButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView____lazy_storage___summaryButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView____lazy_storage___summaryButton) = (Class)a3;
  id v3 = a3;
}

- (void)moreButtonTapWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_362004((uint64_t)v4);
}

- (_TtC23ShelfKitCollectionViews11EpisodeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_3692C0();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_3621D4();
}

- (void)titleTapped
{
  v2 = self;
  sub_36250C();
}

- (void)layoutMarginsDidChange
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_363E60();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_36A084();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  v7 = (_TtC23ShelfKitCollectionViews11EpisodeView *)a4;
  v8 = self;
  v9 = (_TtC23ShelfKitCollectionViews11EpisodeView *)[(EpisodeView *)v7 view];
  if (v9)
  {
    v10 = v9;
    self;
    char v11 = swift_dynamicCastObjCClass() == 0;

    v7 = v8;
    v8 = v10;
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel)accessibilityCaptionLabel
{
  return (_TtC23ShelfKitCollectionViews19EpisodeCaptionLabel *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_captionLabel);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_titleLabel);
}

- (UIView)accessibilitySummaryLabel
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_summaryLabel));
}

- (UIView)accessibilitySecondSummaryLabel
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_secondSummaryLabel));
}

- (_TtC23ShelfKitCollectionViews18PlaybackStatusView)accessibilityPlaybackView
{
  return (_TtC23ShelfKitCollectionViews18PlaybackStatusView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playbackView);
}

- (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets)accessibilitySummaryButton
{
  v2 = self;
  id v3 = sub_35F690();

  return (_TtC23ShelfKitCollectionViews21ButtonWithTouchInsets *)v3;
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityDurationLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_durationLabel);
}

- (_TtC23ShelfKitCollectionViews11ArtworkView)accessibilityArtworkView
{
  return (_TtC23ShelfKitCollectionViews11ArtworkView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                               + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_artworkViewWithPlayback));
}

- (BOOL)accessibilityIsPlaying
{
  uint64_t v3 = sub_37C6F0();
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playState;
  swift_beginAccess();
  sub_302DA0(v6, (uint64_t)v5, (uint64_t (*)(void))&type metadata accessor for EpisodePlayState);
  v7 = self;
  LOBYTE(v6) = sub_37C6A0();
  sub_30B75C((uint64_t)v5, (uint64_t (*)(void))&type metadata accessor for EpisodePlayState);

  return v6 & 1;
}

- (UIButton)accessibilityContextButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_contextButton));
}

- (void)accessibilityPerformPlayPauseAction
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playButton);
  id v5 = v3;
  uint64_t v4 = self;
  sub_361B10(v3);
}

- (_TtC23ShelfKitCollectionViews11EpisodeView)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews11EpisodeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_libraryActionController, &qword_4800A8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_artworkContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_artworkViewWithPlayback));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_labelContainerMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_summaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_secondSummaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_ordinalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_durationLabel));
  swift_bridgeObjectRelease();
  sub_3687C0(*(uint64_t *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView____lazy_storage___inlineNowPlayingIndicatorLayout));
  sub_1C1B0(*(id *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 16], *(void *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 24], *(void *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 32], *(void *)&self->style[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing], *(void *)&self->artworkContainer[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 4], *(void *)&self->artworkViewWithPlayback[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 4], *(void **)&self->labelContainerMask[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 4], *(void *)&self->captionLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 4], *(void *)&self->titleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing + 4], *(void *)&self->summaryLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing+ 4], *(void *)&self->summaryLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing
                                 + 12],
    *(_WORD *)&self->secondSummaryLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_detailToPlaybackViewSpacing
                                      + 4]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playbackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView____lazy_storage___summaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_contextButton));
  swift_release();
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_contentSizeChangeHandler));
  swift_release();
  swift_release();
  sub_30B75C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_playState, (uint64_t (*)(void))&type metadata accessor for EpisodePlayState);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11EpisodeView_backgroundView));
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end