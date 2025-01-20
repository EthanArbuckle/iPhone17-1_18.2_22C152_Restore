@interface NowPlayingControlsViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (MPCPlayerResponse)accessibilityResponse;
- (MPCPlayerResponse)response;
- (MTMPButton)accessibilityContextButton;
- (MTMPButton)accessibilityPlaybackSpeedButton;
- (_TtC12NowPlayingUI25NowPlayingTransportButton)accessibilityLeftButton;
- (_TtC12NowPlayingUI25NowPlayingTransportButton)accessibilityPlayPauseStopButton;
- (_TtC12NowPlayingUI25NowPlayingTransportButton)accessibilityRightButton;
- (_TtC12NowPlayingUI32NowPlayingControlsViewController)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI32NowPlayingControlsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_UIGrabber)chevronView;
- (void)appEnteredWhileAppeared;
- (void)appExitedWhileAppeared;
- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3;
- (void)setChevronView:(id)a3;
- (void)setResponse:(id)a3;
- (void)standaloneMediaControlsViewController:(id)a3 didSelectRoute:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation NowPlayingControlsViewController

- (_TtC12NowPlayingUI32NowPlayingControlsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_F1818();
}

- (MPCPlayerResponse)response
{
  return (MPCPlayerResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                      + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController__systemPodcastsResponse));
}

- (void)setResponse:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_F1334(a3);
}

- (_UIGrabber)chevronView
{
  return (_UIGrabber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                               + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_chevronView));
}

- (void)setChevronView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_chevronView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_chevronView) = (Class)a3;
  id v3 = a3;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_E5A78();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_EC050(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_EC24C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_EC3A8(a3);
}

- (void)appExitedWhileAppeared
{
}

- (void)appEnteredWhileAppeared
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[NowPlayingControlsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_F14BC;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_F1D68;
  v11[3] = &block_descriptor_53;
  v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:v9 completion:0];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v6.receiver;
  [(NowPlayingControlsViewController *)&v6 viewDidDisappear:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_mediaControlsViewController];
  *(void *)&v4[OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_mediaControlsViewController] = 0;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_ECD5C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_ECE98();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_ED150(a3);
}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_EBDA4();
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(NowPlayingControlsViewController *)&v3 viewSafeAreaInsetsDidChange];
  sub_EBDA4();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(NowPlayingControlsViewController *)v5 view];
  [v4 locationInView:v6];
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  [*(id *)((char *)&v5->super.super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkLayoutGuide) layoutFrame];
  v12.x = v8;
  v12.y = v10;
  LOBYTE(v6) = CGRectContainsPoint(v13, v12);

  return (char)v6;
}

- (MTMPButton)accessibilityContextButton
{
  return (MTMPButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                               + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_contextButton));
}

- (MTMPButton)accessibilityPlaybackSpeedButton
{
  return (MTMPButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                               + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_playbackSpeedButton));
}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)accessibilityLeftButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_leftButton));
}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)accessibilityPlayPauseStopButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_playPauseStopButton));
}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)accessibilityRightButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_rightButton));
}

- (MPCPlayerResponse)accessibilityResponse
{
  return (MPCPlayerResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                      + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController__systemPodcastsResponse));
}

- (_TtC12NowPlayingUI32NowPlayingControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NowPlayingUI32NowPlayingControlsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkAreaLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkAreaLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkAreaTrailingConstraint));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_metrics);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_configuration);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_videoTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_videoPinchGestureRecognizer));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_chevronView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_timeControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_titlesStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_releaseDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_titleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_subtitleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_subtitleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_upsellBannerView));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_upsellCoverView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_transportControlsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_leftButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_playPauseStopButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_rightButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_volumeSlider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_secondaryTransportControlsGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_playbackSpeedButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_routeButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_contextButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_sleepButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_queueControlsView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_transportControlsHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController____lazy_storage___timeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_titlesYConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_secondaryControlsBottomMargin));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkAreaTopMarginConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_timeControlLayoutGuideTopAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_upsellCoverTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_timeControlTopAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_volumeSliderBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_artworkMaxWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_leftButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_playPauseStopButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_rightButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController_mediaControlsViewController));
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI32NowPlayingControlsViewController__systemPodcastsResponse);
}

- (void)standaloneMediaControlsViewController:(id)a3 didSelectRoute:(id)a4
{
  *(void *)(swift_allocObject() + 16) = a4;
  id v7 = a4;
  id v8 = a3;
  double v9 = self;
  sub_126FA0();

  swift_release();
}

@end