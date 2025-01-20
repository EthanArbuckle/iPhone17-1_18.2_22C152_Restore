@interface BKAudiobookNowPlayingFullscreenTouchViewController
- (BKAudiobookNowPlayingFullscreenTouchViewController)initWithCoder:(id)a3;
- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented;
- (BOOL)sliderIsProgressSlider:(id)a3;
- (CGRect)alternateAccessibilityFrameFor:(id)a3;
- (CGRect)transitionCoverFrame;
- (_TtC13BookAnalytics9BATracker)ba_analyticsTracker;
- (double)coverCornerRadius;
- (double)durationOfCurrentChapter;
- (double)playedInterval;
- (id)accessibleDescriptionOfSessionIndicatorPosition;
- (id)createMiniViewController;
- (id)transitionBackgroundImageView;
- (id)transitionControlsViews;
- (id)transitionCoverImagePlayControl;
- (id)transitionCoverViews;
- (id)transitionCurrentCoverImage;
- (id)transitionToolbarViews;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)ba_setAnalyticsTracker:(id)a3;
- (void)beginTracking:(id)a3;
- (void)didTapSessionIndicator:(id)a3;
- (void)endTracking:(id)a3;
- (void)fadeOutHUD:(id)a3;
- (void)fineScrubSpeedChanged:(id)a3;
- (void)loadView;
- (void)resetPlaybackSpeed;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BKAudiobookNowPlayingFullscreenTouchViewController

- (BKAudiobookNowPlayingFullscreenTouchViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002ACB1C();
}

- (void)loadView
{
  v2 = self;
  id v3 = sub_10029FB78();
  [(BKAudiobookNowPlayingFullscreenTouchViewController *)v2 setView:v3];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(BKAudiobookNowPlayingTouchViewController *)&v4 viewDidLoad];
  id v3 = *(void **)&v2[OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_viewModel];
  sub_1002A0054();
  sub_1002A06AC(v3);
  sub_1002A3F50();
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4 = self;
  AudiobookNowPlayingFullscreenTouchViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  [(BKAudiobookNowPlayingTouchViewController *)&v6 viewDidAppear:v3];
  v5 = sub_10029FB78();
  [*(id *)&v5[OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_primaryTitleMarqueeView] setMarqueeEnabled:1 withOptions:0];
  [*(id *)&v5[OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_secondaryTitleMarqueeView] setMarqueeEnabled:1 withOptions:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(BKAudiobookNowPlayingFullscreenTouchViewController *)&v7 viewDidDisappear:v3];
  v5 = (void *)sub_10045A094();
  if (v5)
  {
    objc_super v6 = v5;
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v5);

    id v4 = v6;
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(BKAudiobookNowPlayingFullscreenTouchViewController *)&v4 viewSafeAreaInsetsDidChange];
  BOOL v3 = sub_10029FB78();
  [v3 setNeedsLayout];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  id v2 = self;
  id v3 = [(BKAudiobookNowPlayingFullscreenTouchViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4) {
    return 30;
  }
  else {
    return 2;
  }
}

- (id)createMiniViewController
{
  id v2 = self;
  id v3 = sub_1002A4908();

  return v3;
}

- (_TtC13BookAnalytics9BATracker)ba_analyticsTracker
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = [(BKAudiobookNowPlayingFullscreenTouchViewController *)&v4 ba_analyticsTracker];

  return v2;
}

- (void)ba_setAnalyticsTracker:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(BKAudiobookNowPlayingFullscreenTouchViewController *)&v6 ba_setAnalyticsTracker:v4];
  sub_1002A4F18();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController____lazy_storage___nowPlayingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_tocVC));
  sub_10005AFE8((uint64_t)self + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_buyButtonProvider, &qword_100B25DD0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_buyButtonViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_datePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_hudDisappearTimer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_scrubberImpactBehavior));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingFullscreenTouchViewController_attributionView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)transitionCurrentCoverImage
{
  id v2 = self;
  id v3 = sub_10029FB78();
  id v4 = *(id *)&v3[OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_artworkImageView];

  id v5 = [v4 image];

  return v5;
}

- (CGRect)transitionCoverFrame
{
  id v2 = self;
  double v3 = AudiobookNowPlayingFullscreenTouchViewController.transitionCoverFrame()();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)transitionBackgroundImageView
{
  id v2 = self;
  double v3 = sub_10029FB78();
  id v4 = sub_1003D8E94();

  return v4;
}

- (id)transitionToolbarViews
{
  return sub_1002AA51C(self, (uint64_t)a2, &OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_grabberView, &qword_100B29558);
}

- (id)transitionControlsViews
{
  id v2 = self;
  AudiobookNowPlayingFullscreenTouchViewController.transitionControlsViews()();

  v3.super.isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)transitionCoverViews
{
  return sub_1002AA51C(self, (uint64_t)a2, &OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_artworkImageView, &qword_100B29570);
}

- (double)coverCornerRadius
{
  id v2 = self;
  NSArray v3 = sub_10029FB78();
  if (qword_100B227B8 != -1) {
    swift_once();
  }
  double v4 = *(double *)&qword_100B31148;

  return v4;
}

- (id)transitionCoverImagePlayControl
{
  id v2 = self;
  NSArray v3 = sub_10029FB78();
  id v4 = *(id *)&v3[OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_artworkImageView];

  return v4;
}

- (void)fadeOutHUD:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1002AA774(0);
}

- (void)beginTracking:(id)a3
{
  id v4 = a3;
  double v5 = self;
  AudiobookNowPlayingFullscreenTouchViewController.beginTracking(_:)((uint64_t)v4);
}

- (void)endTracking:(id)a3
{
  id v4 = a3;
  double v5 = self;
  _s5Books48AudiobookNowPlayingFullscreenTouchViewControllerC11endTrackingyySo14IMCustomSliderCF_0();
}

- (void)fineScrubSpeedChanged:(id)a3
{
  id v4 = a3;
  double v5 = self;
  AudiobookNowPlayingFullscreenTouchViewController.fineScrubSpeedChanged(_:)(v4);
}

- (BOOL)sliderIsProgressSlider:(id)a3
{
  id v4 = a3;
  double v5 = self;
  double v6 = sub_10029FB78();
  id v7 = *(id *)&v6[OBJC_IVAR____TtC5Books38AudiobookNowPlayingFullscreenTouchView_progressSlider];

  return v7 == v4;
}

- (double)playedInterval
{
  swift_getKeyPath();
  swift_getKeyPath();
  NSArray v3 = self;
  sub_1007F7850();

  swift_release();
  swift_release();
  return v5;
}

- (double)durationOfCurrentChapter
{
  id v2 = self;
  double v3 = AudiobookNowPlayingFullscreenTouchViewController.durationOfCurrentChapter.getter();

  return v3;
}

- (void)didTapSessionIndicator:(id)a3
{
  id v4 = (BKScrubberSlider *)a3;
  double v5 = self;
  AudiobookNowPlayingFullscreenTouchViewController.didTapSessionIndicator(_:)(v4);
}

- (id)accessibleDescriptionOfSessionIndicatorPosition
{
  id v2 = self;
  object = AudiobookNowPlayingFullscreenTouchViewController.accessibleDescriptionOfSessionIndicatorPosition()().value._object;

  if (object)
  {
    NSString v4 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }

  return v4;
}

- (CGRect)alternateAccessibilityFrameFor:(id)a3
{
  id v4 = a3;
  double v5 = self;
  double v6 = AudiobookNowPlayingFullscreenTouchViewController.alternateAccessibilityFrame(for:)(v4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)resetPlaybackSpeed
{
  id v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_eventHandler);
  double v6 = self;
  [v2 playbackRate];
  if (*(float *)&v3 == 1.0)
  {
    id v4 = v6;
  }
  else
  {
    LODWORD(v3) = 1.0;
    [v2 setPlaybackRateTo:v3];
    double v5 = (BKAudiobookNowPlayingFullscreenTouchViewController *)[objc_allocWithZone((Class)UINotificationFeedbackGenerator) init];
    [(BKAudiobookNowPlayingFullscreenTouchViewController *)v5 notificationOccurred:0];

    id v4 = v5;
  }
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

@end