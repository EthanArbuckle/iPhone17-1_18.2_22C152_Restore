@interface BookReaderContainerViewController
- (AEAsset)asset;
- (AEAssetOpenAnimating)contentOpenAnimator;
- (AEAssetViewControllerDelegate)assetViewControllerDelegate;
- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData;
- (BAUpSellData)upSellData;
- (BCAppIntentsAssetViewControllerInfo)appIntentsInfo;
- (BCBookPositionProcessing)bookPositionProcessor;
- (BOOL)accessibilityPerformEscape;
- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented;
- (BOOL)dismissShouldBegin:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAudiobook;
- (BOOL)isCloud;
- (BOOL)isDownloading;
- (BOOL)isLocal;
- (BOOL)isPreordered;
- (BOOL)isSample;
- (BOOL)isStore;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)snapshotDuringLiveResize;
- (NSArray)keyCommands;
- (REBuyBookServiceDelegate)serviceDelegate;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC5Books33BookReaderContainerViewController)initWithCoder:(id)a3;
- (_TtC5Books33BookReaderContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)transitionContentView;
- (int64_t)pageCountIncludingUpsell;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredStatusBarUpdateAnimation;
- (int64_t)readerType;
- (uint64_t)assetViewControllerUpdateToolbars;
- (unint64_t)supportedInterfaceOrientations;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)assetViewControllerDidCloseAnimated:(BOOL)a3;
- (void)assetViewControllerDidEnterBackground;
- (void)assetViewControllerDidOpenAnimated:(BOOL)a3;
- (void)assetViewControllerPrepareForReload;
- (void)assetViewControllerWillEnterForeground;
- (void)assetViewControllerWillOpen;
- (void)buildContextTree:(id)a3;
- (void)buyBookWithCompletion:(id)a3;
- (void)close:(BOOL)a3;
- (void)didPurchaseWithProductProfile:(id)a3 completion:(id)a4;
- (void)dragToDismiss:(id)a3;
- (void)forceRepagination;
- (void)handleTapDuringPageTurn:(id)a3;
- (void)jumpToBeginningAnimated:(BOOL)a3;
- (void)open:(BOOL)a3;
- (void)openToLocation:(id)a3 animated:(BOOL)a4;
- (void)readingLoupeSelectLine:(id)a3;
- (void)saveStateClosing:(BOOL)a3;
- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4;
- (void)setAppAnalyticsAdditionalData:(id)a3;
- (void)setAppIntentsInfo:(id)a3;
- (void)setAssetIsPreordered:(id)a3;
- (void)setAssetViewControllerDelegate:(id)a3;
- (void)setBookPositionProcessor:(id)a3;
- (void)setBuyButtonProgress:(float)a3;
- (void)setContentOpenAnimator:(id)a3;
- (void)setFinishedForAssetID:(id)a3;
- (void)setServiceDelegate:(id)a3;
- (void)setUpSellData:(id)a3;
- (void)swipeToDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BookReaderContainerViewController

- (BAUpSellData)upSellData
{
  return (BAUpSellData *)sub_1005ADF9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Books33BookReaderContainerViewController_upSellData);
}

- (void)setUpSellData:(id)a3
{
}

- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData
{
  return (BAAppAnalyticsAdditionalData *)sub_1005ADF9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Books33BookReaderContainerViewController_appAnalyticsAdditionalData);
}

- (void)setAppAnalyticsAdditionalData:(id)a3
{
}

- (BCAppIntentsAssetViewControllerInfo)appIntentsInfo
{
  return (BCAppIntentsAssetViewControllerInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_appIntentsInfo));
}

- (void)setAppIntentsInfo:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1005AE108(v4);
}

- (BCBookPositionProcessing)bookPositionProcessor
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BCBookPositionProcessing *)v2;
}

- (void)setBookPositionProcessor:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookPositionProcessor) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (REBuyBookServiceDelegate)serviceDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (REBuyBookServiceDelegate *)Strong;
}

- (void)setServiceDelegate:(id)a3
{
}

- (AEAssetViewControllerDelegate)assetViewControllerDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (AEAssetViewControllerDelegate *)Strong;
}

- (void)setAssetViewControllerDelegate:(id)a3
{
}

- (AEAssetOpenAnimating)contentOpenAnimator
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (AEAssetOpenAnimating *)Strong;
}

- (void)setContentOpenAnimator:(id)a3
{
}

- (AEAsset)asset
{
  return (AEAsset *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookProviderService)
                                                            + OBJC_IVAR___REBookProviderService_bookInfo));
}

- (_TtC5Books33BookReaderContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005BC390();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1005AEA04();
}

- (void)handleTapDuringPageTurn:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1005AFFA0();
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for BookReaderContainerViewController();
  v2 = (char *)v13.receiver;
  [(BookReaderContainerViewController *)&v13 viewDidLayoutSubviews];
  id v3 = [v2 view];
  if (v3)
  {
    id v4 = v3;
    [v3 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    [*(id *)&v2[OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderHostEnvironmentProvider] setFrame:v6, v8, v10, v12];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1005B03A8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1005B07DC(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1005B098C(a3);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for BookReaderContainerViewController();
  id v6 = v10.receiver;
  id v7 = a3;
  [(BookReaderContainerViewController *)&v10 viewDidMoveToWindow:v7 shouldAppearOrDisappear:v4];
  if (v7)
  {
    swift_getObjectType();
    sub_1007FB4B0();
  }
  id v8 = [v6 viewIfLoaded];
  id v9 = [v8 window];
}

- (void)dragToDismiss:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1005B0FA4(v4);
}

- (void)swipeToDismiss:(id)a3
{
  id v4 = a3;
  double v5 = self;
  if ([v4 direction] == (id)8 && (sub_1005B2330() & 1) != 0) {
    sub_1005BC678(1);
  }
}

- (void)readingLoupeSelectLine:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1005B1834(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  BOOL v9 = sub_1005B1BD0(v6, v7);

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1005B1F4C(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                                + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter)
                                                                     + OBJC_IVAR____TtC5Books19BookReaderPresenter_presentedExpandedContentViewController));
}

- (BOOL)accessibilityPerformEscape
{
  v2 = self;
  char v3 = sub_1005B27A8();

  return v3 & 1;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    char v6 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    id v7 = self;
  }
  sub_1005B29C0((uint64_t)a3, (uint64_t)v16, v17);

  sub_10005AFE8((uint64_t)v16, (uint64_t *)&unk_100B269C0);
  uint64_t v8 = v18;
  if (v18)
  {
    BOOL v9 = sub_10005DA74(v17, v18);
    uint64_t v10 = *(void *)(v8 - 8);
    double v11 = __chkstk_darwin(v9);
    objc_super v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v10 + 16))(v13, v11);
    v14 = (void *)sub_1007FF460();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    _s5Books15CurrentPageViewVwxx_0((uint64_t)v17);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSArray)keyCommands
{
  v2 = self;
  char v3 = sub_1005B3000();

  if (v3)
  {
    sub_10004A860(0, &qword_100B2C0B0);
    v4.super.isa = sub_1007FDFE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (_TtC5Books33BookReaderContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Books33BookReaderContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_readerController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookProviderService));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_upSellData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_appAnalyticsAdditionalData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_panDismissGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_swipeDismissGesture));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_tapDuringPageTurnGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_selectLineGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_statusBarStateProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_pageTurnController);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController__actionTarget));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_appIntentsInfo));
  sub_10005AFE8((uint64_t)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_buyButtonPresenter, (uint64_t *)&unk_100B2BD68);
  swift_release();
  swift_weakDestroy();
  swift_unknownObjectRelease();
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_serviceDelegate);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_assetViewControllerDelegate);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_contentOpenAnimator);
  char v3 = (char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_log;
  uint64_t v4 = sub_1007F6BC0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  double v5 = (char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_signposter;
  uint64_t v6 = sub_1007F6AB0();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  id v7 = (char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_signpostID;
  uint64_t v8 = sub_1007F6A80();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_manualCurlDriver));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_blurView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_paginationHostView));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  sub_10003E138(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_undoTemporaryThemeStyle));
  swift_unknownObjectRelease();

  swift_release();
}

- (void)didPurchaseWithProductProfile:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_purchaseHandler);
  _Block_copy(v6);
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  sub_10028EC40((uint64_t)a3, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease();
}

- (void)setAssetIsPreordered:(id)a3
{
  uint64_t v4 = self;
  if (a3) {
    [a3 BOOLValue];
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_getObjectType();
    sub_1007FB360();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (int64_t)readerType
{
  return 6;
}

- (BOOL)snapshotDuringLiveResize
{
  return 1;
}

- (void)assetViewControllerWillOpen
{
  v2 = self;
  sub_1005B3918();
}

- (void)assetViewControllerDidOpenAnimated:(BOOL)a3
{
  char v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter);
  uint64_t v4 = self;
  id v5 = v3;
  sub_1006FDB5C();
}

- (void)assetViewControllerWillEnterForeground
{
  v2 = self;
  sub_1005B3BDC();
}

- (void)assetViewControllerDidEnterBackground
{
  v2 = self;
  sub_1005B3E80();
}

- (void)setFinishedForAssetID:(id)a3
{
  sub_1007FDC70();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = Strong;
    if ([Strong respondsToSelector:"setFinishedForAssetID:"])
    {
      uint64_t v6 = self;
      id v7 = sub_1007FDC30();
      [v5 setFinishedForAssetID:v7];

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)setBuyButtonProgress:(float)a3
{
  uint64_t v4 = self;
  sub_1005B4128(a3);
}

- (void)open:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1005B42D4(a3);
}

- (void)openToLocation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  if (Strong)
  {
    [Strong assetViewController:v8 willOpen:v4];
    swift_unknownObjectRelease();
  }
  id v9 = objc_retain(*(id *)((char *)&v8->super.super.super.isa
                         + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter));
  sub_10070AC40((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)jumpToBeginningAnimated:(BOOL)a3
{
  char v3 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter);
  BOOL v4 = *(void **)(*(void *)&v3[OBJC_IVAR____TtC5Books19BookReaderPresenter_interactor] + 168);
  id v5 = self;
  uint64_t v6 = v3;
  id v7 = v4;
  sub_10075B778(1);
}

- (void)close:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    id v7 = self;
    [v6 assetViewController:v7 willClose:v3];

    swift_unknownObjectRelease();
  }
}

- (void)saveStateClosing:(BOOL)a3
{
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter);
  BOOL v4 = self;
  id v5 = v3;
  sub_1004FB08C();
  sub_1004FC760(0);
}

- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4
{
  uint64_t v6 = self;
  sub_1005B4630(a3, a4);
}

- (BOOL)dismissShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1005B4B7C(v4);

  return self & 1;
}

- (void)assetViewControllerDidCloseAnimated:(BOOL)a3
{
  BOOL v3 = self;
  sub_1005BC8B0();
}

- (uint64_t)assetViewControllerUpdateToolbars
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    return swift_unknownObjectRelease();
  }
  return result;
}

- (void)assetViewControllerPrepareForReload
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderPresenter);
  BOOL v3 = self;
  id v4 = v2;
  sub_1004FC760(1);
}

- (int64_t)pageCountIncludingUpsell
{
  int64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    swift_unknownObjectRelease();
    return 1;
  }
  return result;
}

- (id)transitionContentView
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Books33BookReaderContainerViewController_readerController) view];

  return v2;
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v3 = *(void *)&self->readerController[OBJC_IVAR____TtC5Books33BookReaderContainerViewController_orientationLocking];
  uint64_t ObjectType = swift_getObjectType();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  uint64_t v6 = self;
  if (v5(ObjectType, v3))
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(ObjectType, v3);

    if ((unint64_t)(v7 - 1) >= 4) {
      return 0;
    }
    else {
      return qword_100879E20[v7 - 1];
    }
  }
  else
  {

    return 26;
  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  id v2 = self;
  char v3 = sub_1005B5E44();

  return v3 & 1;
}

- (BOOL)prefersStatusBarHidden
{
  id v2 = self;
  unsigned __int8 v3 = sub_1005B5F9C();

  return v3 & 1;
}

- (int64_t)preferredStatusBarStyle
{
  unsigned __int8 v3 = (char *)self + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_statusBarStateProvider;
  if (!swift_unknownObjectWeakLoadStrong()) {
    return 1;
  }
  uint64_t v4 = *((void *)v3 + 1);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 16);
  uint64_t v7 = self;
  LOBYTE(v4) = v6(ObjectType, v4);

  swift_unknownObjectRelease();
  if (v4) {
    return 3;
  }
  else {
    return 1;
  }
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (void)buyBookWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_1005BC998((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (BOOL)isPreordered
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookProviderService)
     + OBJC_IVAR___REBookProviderService_bookEntity;
  swift_beginAccess();
  sub_10005DAB8(v3, (uint64_t)v6);
  sub_10005DA74(v6, v6[3]);
  uint64_t v4 = self;
  LOBYTE(v3) = sub_1007FA660();
  _s5Books15CurrentPageViewVwxx_0((uint64_t)v6);

  return v3 & 1;
}

- (BOOL)isStore
{
  return 1;
}

- (BOOL)isLocal
{
  return 0;
}

- (BOOL)isCloud
{
  return 0;
}

- (BOOL)isSample
{
  return 1;
}

- (BOOL)isAudiobook
{
  return 0;
}

- (BOOL)isDownloading
{
  return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for BookReaderContainerViewController();
  swift_unknownObjectRetain();
  uint64_t v7 = (char *)v14.receiver;
  -[BookReaderContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  id v8 = [v7 view];
  if (v8)
  {
    id v9 = v8;
    [v8 frame];
    double v11 = v10;
    double v13 = v12;

    [*(id *)&v7[OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderHostEnvironmentProvider] setFrame:v11, v13, width, height];
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for BookReaderContainerViewController();
  id v2 = (char *)v14.receiver;
  [(BookReaderContainerViewController *)&v14 viewSafeAreaInsetsDidChange];
  uint64_t v3 = *(void **)&v2[OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookReaderHostEnvironmentProvider];
  id v4 = [v2 view];
  if (v4)
  {
    id v5 = v4;
    [v4 safeAreaInsets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    [v3 setSafeAreaInsets:v7, v9, v11, v13];
  }
  else
  {
    __break(1u);
  }
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  double v7 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  sub_1005BCB28();

  _s5Books15CurrentPageViewVwxx_0((uint64_t)&v8);
}

- (void)buildContextTree:(id)a3
{
  sub_1007FDA70();
  id v4 = self;
  sub_1005B8C6C();

  swift_bridgeObjectRelease();
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (void)forceRepagination
{
  uint64_t v3 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Books33BookReaderContainerViewController_bookProviderService)
     + OBJC_IVAR___REBookProviderService_bookEntity;
  swift_beginAccess();
  sub_10005DAB8((uint64_t)v3, (uint64_t)v5);
  sub_10005DA74(v5, v5[3]);
  id v4 = self;
  sub_1007FA750();
  _s5Books15CurrentPageViewVwxx_0((uint64_t)v5);
  swift_getObjectType();
  sub_1007FB450();

  swift_bridgeObjectRelease();
}

@end