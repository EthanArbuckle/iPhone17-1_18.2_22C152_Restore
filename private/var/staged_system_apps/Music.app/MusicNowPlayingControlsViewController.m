@interface MusicNowPlayingControlsViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)videoOutputShouldAutomaticallyDismissAtPictureInPictureStart:(id)a3;
- (MPButton)accessibilityLyricsButton;
- (MPButton)accessibilityQueueButton;
- (MPCPlayerResponse)accessibilityNowPlayingResponse;
- (MPRouteLabel)routeLabel;
- (MusicNowPlayingControlsViewController)init;
- (MusicNowPlayingControlsViewController)initWithCoder:(id)a3;
- (MusicNowPlayingControlsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIButton)dismissButton;
- (UILabel)titleLabel;
- (_TtC11MusicCoreUI12SymbolButton)contextButton;
- (_TtC11MusicCoreUI12SymbolButton)favoriteButton;
- (_TtC5Music16AudioTraitButton)accessibilityPlayingItemAudioTraitButton;
- (_TtC5Music25NowPlayingTransportButton)leftButton;
- (_TtC5Music25NowPlayingTransportButton)playPauseStopButton;
- (_TtC5Music25NowPlayingTransportButton)rightButton;
- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton)subtitleButton;
- (_TtCE5MusicO11MusicCoreUI9Reactions7Control)reactionButton;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)loadView;
- (void)setContextButton:(id)a3;
- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setDismissButton:(id)a3;
- (void)setFavoriteButton:(id)a3;
- (void)setLeftButton:(id)a3;
- (void)setPlayPauseStopButton:(id)a3;
- (void)setReactionButton:(id)a3;
- (void)setRightButton:(id)a3;
- (void)setRouteLabel:(id)a3;
- (void)setSubtitleButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)videoOutput:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)videoOutput:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MusicNowPlayingControlsViewController

- (MusicNowPlayingControlsViewController)init
{
  return (MusicNowPlayingControlsViewController *)sub_100147A38();
}

- (MusicNowPlayingControlsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100175C18();
}

- (void)dealloc
{
  uint64_t v2 = qword_1010979F8;
  id v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = *(void (**)(MusicNowPlayingControlsViewController *))(*(void *)off_10109B3F0 + 104);
  v5 = v3;
  swift_retain();
  v4(v5);

  swift_release();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for NowPlayingControlsViewController();
  [(MusicNowPlayingControlsViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_100046744((uint64_t)self + OBJC_IVAR___MusicNowPlayingControlsViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_nowPlaying));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_grabberView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_mainContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_timeControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemAudioTraitButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_topContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_buttonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contextButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___favoriteButtonPackageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___favoriteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_reactionButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_attributionContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_attributionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_titlesStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_titleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_shuffleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_repeatButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_bottomContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_transportControlsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_playPauseStopButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_rightButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_volumeSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_bottomButtonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_routeSharePlayTogetherControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_routeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_lyricsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_queueButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___bottomButtonsConfiguration));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_singIndicatorView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkPlaceholderLayoutGuide));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_grabberYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_timeControlWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_topContainerMinYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_topContainerCenterYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_topContainerLayoutGuideHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_transportControlsLayoutGuideHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_volumeSlideBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_bottomButtonsLayoutGuideHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideExtendedLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideMotionBackgroundTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideMotionBackgroundCollapsedTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideExtendedTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_contentLayoutGuideSplitViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_routeButtonRegularLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_queueModeBadgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_queueModeBadgeMaskLayer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_musicHapticsManager));
  swift_bridgeObjectRelease();
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkDidChangeHandler));
  swift_unknownObjectWeakDestroy();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_sessionWaitTimer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_artworkTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_videoPinchGestureRecognizer));
  sub_100177D08(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemNavigationStyle), *(void *)&self->delegate[OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemNavigationStyle], self->delegate[OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemNavigationStyle + 8]);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___mediaControls));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___leaveSessionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_reactionEffectInteraction));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_nowPlayingPath));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingControlsViewController_sharePlayTogetherSession));

  swift_unknownObjectRelease();
}

- (void)loadView
{
  uint64_t v2 = self;
  sub_100148B18();
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_100148C28();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100151150(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10015126C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100151354(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100151460(a3);
}

- (void)viewDidLayoutSubviews
{
  uint64_t v2 = self;
  sub_100151584();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_100151994(a3);
}

- (void)viewSafeAreaInsetsDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NowPlayingControlsViewController();
  id v2 = v7.receiver;
  [(MusicNowPlayingControlsViewController *)&v7 viewSafeAreaInsetsDidChange];
  if (qword_101098328 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100050A90(v3, (uint64_t)qword_101129A40);
  v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "[NowPlayingControlsViewController] safe area insets changed, updating metrics", v6, 2u);
    swift_slowDealloc();
  }

  sub_100168404();
}

- (UIButton)dismissButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___MusicNowPlayingControlsViewController_dismissButton));
}

- (void)setDismissButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_dismissButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_dismissButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC11MusicCoreUI12SymbolButton)contextButton
{
  return (_TtC11MusicCoreUI12SymbolButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR___MusicNowPlayingControlsViewController_contextButton));
}

- (void)setContextButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_contextButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_contextButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC11MusicCoreUI12SymbolButton)favoriteButton
{
  id v2 = self;
  id v3 = sub_1001560A8();

  return (_TtC11MusicCoreUI12SymbolButton *)v3;
}

- (void)setFavoriteButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___favoriteButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___MusicNowPlayingControlsViewController____lazy_storage___favoriteButton) = (Class)a3;
  id v3 = a3;
}

- (_TtCE5MusicO11MusicCoreUI9Reactions7Control)reactionButton
{
  return (_TtCE5MusicO11MusicCoreUI9Reactions7Control *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR___MusicNowPlayingControlsViewController_reactionButton));
}

- (void)setReactionButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_reactionButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_reactionButton) = (Class)a3;
  id v3 = a3;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___MusicNowPlayingControlsViewController_titleLabel));
}

- (void)setTitleLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_titleLabel);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_titleLabel) = (Class)a3;
  id v3 = a3;
}

- (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton)subtitleButton
{
  return (_TtC5MusicP33_B29993BA797B47F8C660EB2DB95D08BA18SizedToLabelButton *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleButton);
}

- (void)setSubtitleButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_subtitleButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC5Music25NowPlayingTransportButton)leftButton
{
  return (_TtC5Music25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButton));
}

- (void)setLeftButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_leftButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC5Music25NowPlayingTransportButton)playPauseStopButton
{
  return (_TtC5Music25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR___MusicNowPlayingControlsViewController_playPauseStopButton));
}

- (void)setPlayPauseStopButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___MusicNowPlayingControlsViewController_playPauseStopButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_playPauseStopButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC5Music25NowPlayingTransportButton)rightButton
{
  return (_TtC5Music25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR___MusicNowPlayingControlsViewController_rightButton));
}

- (void)setRightButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_rightButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_rightButton) = (Class)a3;
  id v3 = a3;
}

- (MPRouteLabel)routeLabel
{
  return (MPRouteLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR___MusicNowPlayingControlsViewController_routeLabel));
}

- (void)setRouteLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_routeLabel);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingControlsViewController_routeLabel) = (Class)a3;
  id v3 = a3;
}

- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = self;
  sub_100162E0C(a3, v4);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  os_log_type_t v5 = self;
  LOBYTE(self) = sub_100165524(v4);

  return self & 1;
}

- (MPButton)accessibilityLyricsButton
{
  return (MPButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___MusicNowPlayingControlsViewController_lyricsButton));
}

- (MPButton)accessibilityQueueButton
{
  return (MPButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___MusicNowPlayingControlsViewController_queueButton));
}

- (_TtC5Music16AudioTraitButton)accessibilityPlayingItemAudioTraitButton
{
  return (_TtC5Music16AudioTraitButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                 + OBJC_IVAR___MusicNowPlayingControlsViewController_playingItemAudioTraitButton));
}

- (MPCPlayerResponse)accessibilityNowPlayingResponse
{
  return (MPCPlayerResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR___MusicNowPlayingControlsViewController_nowPlaying));
}

- (MusicNowPlayingControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (MusicNowPlayingControlsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)videoOutput:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  objc_super v7 = self;
  sub_100172A10((uint64_t)a3, a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)videoOutput:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = self;
  *(void *)(v7 + 24) = a3;
  v10[4] = sub_10017671C;
  v10[5] = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_1007AF420;
  v10[3] = &unk_100FC9558;
  v8 = _Block_copy(v10);
  swift_unknownObjectRetain_n();
  v9 = self;
  swift_unknownObjectRetain();
  swift_release();
  [a4 animateAlongsideTransition:0 completion:v8];
  _Block_release(v8);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (BOOL)videoOutputShouldAutomaticallyDismissAtPictureInPictureStart:(id)a3
{
  return 0;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  os_log_type_t v5 = self;
  sub_1001763A0();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

@end