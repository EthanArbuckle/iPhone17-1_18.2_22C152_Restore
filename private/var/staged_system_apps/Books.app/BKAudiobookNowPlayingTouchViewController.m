@interface BKAudiobookNowPlayingTouchViewController
- (AEAsset)asset;
- (AEAssetAudiobookStatus)assetStatus;
- (AEAssetOpenAnimating)contentOpenAnimator;
- (AEAssetViewControllerDelegate)assetViewControllerDelegate;
- (BCBookPositionProcessing)bookPositionProcessor;
- (BKAudiobookNowPlayingTouchViewController)initWithCoder:(id)a3;
- (BKAudiobookNowPlayingTouchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BKAudiobookNowPlayingTouchViewControllerDelegate)delegate;
- (BOOL)coverAnimationHostIsFullyVisible:(id)a3;
- (BOOL)coverAnimationHostWantsScrollOnClose;
- (BOOL)dismissShouldBegin:(id)a3;
- (BOOL)im_firstVisibleChildValidateWithItem:(id)a3;
- (BOOL)isPlaying;
- (BOOL)shouldCloseDueToAssetDeletion;
- (BOOL)transitionHasCustomArtwork;
- (CGRect)transitionCoverFrame;
- (_TtC13BookAnalytics9BATracker)recommendedTracker;
- (_TtC13BookAnalytics9BATracker)trackerForAudiobookAnalytics;
- (double)coverCornerRadius;
- (double)transitionCoverImagePlayControlShadowOpacityValue;
- (double)transitionToolbarAlpha;
- (id)coverAnimationHostSourceForItem:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)transitionBackgroundImageView;
- (id)transitionContentView;
- (id)transitionCoverImagePlayControl;
- (id)transitionCoverViews;
- (id)transitionCurrentCoverImage;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)coverContentMode;
- (int64_t)readerType;
- (uint64_t)jumpToBeginningAnimated:;
- (void)assetViewControllerDidOpenAnimated:(BOOL)a3;
- (void)assetViewControllerPrepareForReload;
- (void)assetViewControllerWillUnload;
- (void)bc_analyticsForceEndSession;
- (void)close:(BOOL)a3;
- (void)dealloc;
- (void)didPurchaseWithProductProfile:(id)a3 completion:(id)a4;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)ensureAudiobookNotPlayingWithAssetID:(id)a3;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithURL:(id)a4;
- (void)messageViewControllerDidSelectCancel:(id)a3;
- (void)onAppWillEnterForeground:(id)a3;
- (void)open:(BOOL)a3;
- (void)openToLocation:(id)a3 animated:(BOOL)a4;
- (void)play;
- (void)requestClose:(BOOL)a3;
- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4;
- (void)setAssetViewControllerDelegate:(id)a3;
- (void)setBookPositionProcessor:(id)a3;
- (void)setContentOpenAnimator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadState:(int64_t)a3 assetState:(signed __int16)a4 progressValue:(float)a5;
- (void)setHelper:(id)a3 completion:(id)a4;
- (void)setRecommendedTracker:(id)a3;
- (void)togglePlayPause;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BKAudiobookNowPlayingTouchViewController

- (AEAssetViewControllerDelegate)assetViewControllerDelegate
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    v3 = self;
    swift_retain();
    swift_unknownObjectRelease();
    Strong = (void *)swift_unknownObjectWeakLoadStrong();

    swift_release();
  }
  else
  {
    Strong = 0;
  }

  return (AEAssetViewControllerDelegate *)Strong;
}

- (void)setAssetViewControllerDelegate:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_unknownObjectRetain();
    v4 = self;
    swift_retain();
    swift_unknownObjectRelease();
    swift_unknownObjectWeakAssign();

    swift_release();
    swift_unknownObjectRelease();
  }
}

- (BKAudiobookNowPlayingTouchViewControllerDelegate)delegate
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    v3 = self;
    swift_retain();
    swift_unknownObjectRelease();
    Strong = (void *)swift_unknownObjectWeakLoadStrong();

    swift_release();
  }
  else
  {
    Strong = 0;
  }

  return (BKAudiobookNowPlayingTouchViewControllerDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_unknownObjectRetain();
    v4 = self;
    swift_retain();
    swift_unknownObjectRelease();
    swift_unknownObjectWeakAssign();

    swift_release();
    swift_unknownObjectRelease();
  }
}

- (BOOL)isPlaying
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_1007F7850();

  swift_release();
  swift_release();
  return v5;
}

- (_TtC13BookAnalytics9BATracker)recommendedTracker
{
  return (_TtC13BookAnalytics9BATracker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                  + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_recommendedTracker));
}

- (void)setRecommendedTracker:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_recommendedTracker);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_recommendedTracker) = (Class)a3;
  id v3 = a3;
}

- (AEAssetAudiobookStatus)assetStatus
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_eventHandler) assetStatus];

  return (AEAssetAudiobookStatus *)v2;
}

- (AEAssetOpenAnimating)contentOpenAnimator
{
  return (AEAssetOpenAnimating *)sub_100299128();
}

- (void)setContentOpenAnimator:(id)a3
{
}

- (BCBookPositionProcessing)bookPositionProcessor
{
  return (BCBookPositionProcessing *)sub_100299128();
}

- (void)setBookPositionProcessor:(id)a3
{
}

- (BKAudiobookNowPlayingTouchViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10029DA90();
}

- (void)dealloc
{
  id v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x1E0);
  id v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AudiobookNowPlayingTouchViewController();
  [(BKAudiobookNowPlayingTouchViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_viewModel));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_analyticsRecorder));
  swift_bridgeObjectRelease();
  sub_10023E454((uint64_t)self + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_minibarViewControllerDelegate);
  sub_10023E454((uint64_t)self + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_minifiedController);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_recommendedTracker));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_amsEngagement));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_messageViewControllerProvider));

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AudiobookNowPlayingTouchViewController();
  id v2 = v4.receiver;
  [(BKAudiobookNowPlayingTouchViewController *)&v4 viewDidLoad];
  id v3 = [self defaultCenter];
  [v3 addObserver:v2 selector:"onAppWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
  sub_100299750();
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AudiobookNowPlayingTouchViewController();
  id v2 = (char *)v4.receiver;
  [(BKAudiobookNowPlayingTouchViewController *)&v4 viewDidLayoutSubviews];
  id v3 = (id *)&v2[OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_contentOpenAnimator];
  swift_beginAccess();
  if (*v3) {
    [*v3 bookContentDidLoad];
  }
  id *v3 = 0;

  swift_unknownObjectRelease();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudiobookNowPlayingTouchViewController();
  id v4 = v5.receiver;
  [(BKAudiobookNowPlayingTouchViewController *)&v5 viewWillAppear:v3];
  [v4 setNeedsStatusBarAppearanceUpdate];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudiobookNowPlayingTouchViewController();
  id v4 = (char *)v7.receiver;
  [(BKAudiobookNowPlayingTouchViewController *)&v7 viewDidAppear:v3];
  id v5 = [v4 ba_effectiveAnalyticsTracker];
  v6 = *(void **)&v4[OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_recommendedTracker];
  *(void *)&v4[OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_recommendedTracker] = v5;

  sub_100299DE0();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  AudiobookNowPlayingTouchViewController.viewWillDisappear(_:)(a3);
}

- (void)bc_analyticsForceEndSession
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_eventHandler);
  BOOL v3 = self;
  [v2 togglePlayPause];
  sub_1007F3C00();
}

- (void)setHelper:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    objc_super v7 = (char *)Strong;
    _Block_copy(v5);
    swift_unknownObjectRetain();
    v8 = self;
    sub_10043A334((uint64_t)a3, v7, v5);
    swift_unknownObjectRelease();
    _Block_release(v5);
  }
  else
  {
    swift_unknownObjectRetain();
    v9 = self;
  }
  _Block_release(v5);
  swift_unknownObjectRelease();
}

- (void)togglePlayPause
{
}

- (void)ensureAudiobookNotPlayingWithAssetID:(id)a3
{
  uint64_t v4 = sub_1007FDC70();
  uint64_t v6 = v5;
  objc_super v7 = self;
  sub_10029A538(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)play
{
}

- (void)onAppWillEnterForeground:(id)a3
{
  uint64_t v4 = sub_1007F25F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F25C0();
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKAudiobookNowPlayingTouchViewController_eventHandler) updateFollowingDormantPeriod];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BKAudiobookNowPlayingTouchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (BKAudiobookNowPlayingTouchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (AEAsset)asset
{
  id v2 = self;
  id v3 = AudiobookNowPlayingTouchViewController.asset.getter();

  return (AEAsset *)v3;
}

- (int64_t)readerType
{
  return 1;
}

- (void)open:(BOOL)a3
{
  BOOL v3 = a3;
  swift_unknownObjectWeakAssign();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v5 = self;
    sub_10030F23C(0, v3);

    swift_unknownObjectRelease();
  }
}

- (void)openToLocation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  swift_unknownObjectWeakAssign();
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_unknownObjectRetain();
    objc_super v7 = self;
    sub_10030F23C((uint64_t)a3, v4);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

- (void)close:(BOOL)a3
{
  BOOL v4 = self;
  sub_100249B78(a3);
}

- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_unknownObjectRelease();
  }
}

- (BOOL)dismissShouldBegin:(id)a3
{
  return [a3 proposedBeginState];
}

- (void)requestClose:(BOOL)a3
{
  BOOL v4 = self;
  sub_100249C28(a3);
}

- (void)assetViewControllerDidOpenAnimated:(BOOL)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    BOOL v4 = self;
    sub_100310CFC();

    swift_unknownObjectRelease();
  }
}

- (uint64_t)jumpToBeginningAnimated:
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    return swift_unknownObjectRelease();
  }
  return result;
}

- (void)assetViewControllerWillUnload
{
  id v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x1E0);
  BOOL v3 = self;
  v2();
  sub_100249D0C();
}

- (void)assetViewControllerPrepareForReload
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_unknownObjectRelease();
  }
}

- (void)didPurchaseWithProductProfile:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_unknownObjectRetain();
  objc_super v7 = self;
  sub_10029DB74((uint64_t)a3, (uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease();
}

- (void)setDownloadState:(int64_t)a3 assetState:(signed __int16)a4 progressValue:(float)a5
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    v9 = self;
    sub_100307D50(a3, a4, a5);

    swift_unknownObjectRelease();
  }
}

- (BOOL)shouldCloseDueToAssetDeletion
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    BOOL v3 = self;
    char v4 = sub_10030FA3C();

    swift_unknownObjectRelease();
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (id)transitionContentView
{
  id v2 = [(BKAudiobookNowPlayingTouchViewController *)self view];

  return v2;
}

- (id)transitionCurrentCoverImage
{
  return 0;
}

- (CGRect)transitionCoverFrame
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)transitionBackgroundImageView
{
  return 0;
}

- (double)transitionToolbarAlpha
{
  return 1.0;
}

- (id)transitionCoverViews
{
  v2.super.isa = sub_1007FDFE0().super.isa;

  return v2.super.isa;
}

- (double)coverCornerRadius
{
  return 0.0;
}

- (int64_t)coverContentMode
{
  NSArray v2 = self;
  UIViewContentMode v3 = AudiobookNowPlayingTouchViewController.coverContentMode()();

  return v3;
}

- (BOOL)transitionHasCustomArtwork
{
  return 0;
}

- (double)transitionCoverImagePlayControlShadowOpacityValue
{
  return 0.22;
}

- (id)transitionCoverImagePlayControl
{
  return 0;
}

- (_TtC13BookAnalytics9BATracker)trackerForAudiobookAnalytics
{
  id v2 = [(BKAudiobookNowPlayingTouchViewController *)self ba_effectiveAnalyticsTracker];

  return (_TtC13BookAnalytics9BATracker *)v2;
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9 = sub_1007FDC70();
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_10029DD20(a4, v9, v11);

  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  double v5 = _Block_copy(a5);

  _Block_release(v5);
}

- (void)messageViewControllerDidSelectCancel:(id)a3
{
  id v4 = a3;
  double v5 = self;
  AudiobookNowPlayingTouchViewController.messageViewControllerDidSelectCancel(_:)(v4);
}

- (void)messageViewController:(id)a3 didSelectActionWithURL:(id)a4
{
  uint64_t v4 = sub_1007F29D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2990();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  uint64_t v6 = qword_100B225A0;
  id v7 = a3;
  id v13 = self;
  id v8 = a4;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1007F6BC0();
  sub_10005B838(v9, (uint64_t)qword_100B290B0);
  uint64_t v10 = sub_1007F6BA0();
  os_log_type_t v11 = sub_1007FE3C0();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Message View Controller did fail to load", v12, 2u);
    swift_slowDealloc();
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(BKAudiobookNowPlayingTouchViewController *)v5 traitCollection];
  int64_t v7 = [(BKAudiobookNowPlayingTouchViewController *)v5 adaptivePresentationStyleForPresentationController:v4 traitCollection:v6];

  return v7;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = [v6 presentedViewController];
  self;
  uint64_t v10 = swift_dynamicCastObjCClass();

  if (v10) {
    int64_t v11 = -1;
  }
  else {
    int64_t v11 = 5;
  }

  return v11;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = self;
  id v12 = (void *)sub_10029E220(v8);

  return v12;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = (void *)_s5Books38AudiobookNowPlayingTouchViewControllerC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0lI0C_So0L6RegionCtF_0(v6);

  return v9;
}

- (BOOL)coverAnimationHostIsFullyVisible:(id)a3
{
  return 1;
}

- (BOOL)coverAnimationHostWantsScrollOnClose
{
  return 0;
}

- (id)coverAnimationHostSourceForItem:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  id result = [(BKAudiobookNowPlayingTouchViewController *)v4 view];
  if (result)
  {
    id v6 = result;
    id v7 = (objc_class *)type metadata accessor for AudiobookNowPlayingTouchViewControllerCoverSource();
    id v8 = (char *)objc_allocWithZone(v7);
    *(void *)&v8[OBJC_IVAR____TtC5Books49AudiobookNowPlayingTouchViewControllerCoverSource_view] = v6;
    v10.receiver = v8;
    v10.super_class = v7;
    id v9 = [(BKAudiobookNowPlayingTouchViewController *)&v10 init];

    _s5Books15CurrentPageViewVwxx_0((uint64_t)v11);
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)im_firstVisibleChildValidateWithItem:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  BOOL v6 = sub_10047F7F4((uint64_t)v8);

  sub_10006CA38((uint64_t)v8);
  return v6;
}

@end