@interface REBookReaderModuleHost
- (AEAsset)asset;
- (AEAssetOpenAnimating)contentOpenAnimator;
- (AEAssetViewControllerDelegate)assetViewControllerDelegate;
- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData;
- (BAUpSellData)upSellData;
- (BCAppIntentsAssetViewControllerInfo)appIntentsInfo;
- (BCBookPositionProcessing)bookPositionProcessor;
- (BOOL)dismissShouldBegin:(id)a3;
- (BOOL)prefersStatusBarHiddenDuringTransition;
- (BOOL)snapshotDuringLiveResize;
- (REBookReaderModuleHost)initWithCoder:(id)a3;
- (REBookReaderModuleHost)initWithHostEnvironmentProvider:(id)a3 book:(id)a4 annotationProvider:(id)a5 storeController:(id)a6 styleManager:(id)a7 engagementManager:(id)a8;
- (REBookReaderModuleHost)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)childViewControllerForStatusBarStyle;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)transitionContentView;
- (int64_t)pageCountIncludingUpsell;
- (int64_t)readerType;
- (unint64_t)supportedInterfaceOrientations;
- (void)assetViewControllerDidCloseAnimated:(BOOL)a3;
- (void)assetViewControllerDidEnterBackground;
- (void)assetViewControllerDidOpenAnimated:(BOOL)a3;
- (void)assetViewControllerPrepareForReload;
- (void)assetViewControllerUpdateCloseStateTypeIfNeeded;
- (void)assetViewControllerUpdateToolbars;
- (void)assetViewControllerUpdateToolbarsAfterOpenAnimation;
- (void)assetViewControllerUpdateToolbarsForOpenAnimation;
- (void)assetViewControllerWillAddView;
- (void)assetViewControllerWillEnterForeground;
- (void)assetViewControllerWillOpen;
- (void)close:(BOOL)a3;
- (void)dealloc;
- (void)didPurchaseWithProductProfile:(id)a3 completion:(id)a4;
- (void)forceRepagination;
- (void)jumpToBeginningAnimated:(BOOL)a3;
- (void)open:(BOOL)a3;
- (void)openToLocation:(id)a3 animated:(BOOL)a4;
- (void)requestClose:(BOOL)a3;
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
- (void)setUpSellData:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation REBookReaderModuleHost

- (AEAsset)asset
{
  return (AEAsset *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR___REBookReaderModuleHost_bookProviderService)
                                                            + OBJC_IVAR___REBookProviderService_bookInfo));
}

- (AEAssetViewControllerDelegate)assetViewControllerDelegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (AEAssetViewControllerDelegate *)Strong;
}

- (void)setAssetViewControllerDelegate:(id)a3
{
}

- (AEAssetOpenAnimating)contentOpenAnimator
{
  return (AEAssetOpenAnimating *)sub_100299128();
}

- (void)setContentOpenAnimator:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_contentOpenAnimator);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (int64_t)readerType
{
  return 6;
}

- (BCAppIntentsAssetViewControllerInfo)appIntentsInfo
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_appIntentsInfo);
  swift_beginAccess();
  return (BCAppIntentsAssetViewControllerInfo *)*v2;
}

- (void)setAppIntentsInfo:(id)a3
{
  swift_getObjectType();
  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_appIntentsInfo);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_1007FE9B0();
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    id v7 = self;
  }
  BookReaderModuleHost.target(forAction:withSender:)((uint64_t)a3, (uint64_t)v16, (uint64_t)v17);

  sub_10006CA38((uint64_t)v16);
  uint64_t v8 = v18;
  if (v18)
  {
    v9 = sub_10005DA74(v17, v18);
    uint64_t v10 = *(void *)(v8 - 8);
    double v11 = __chkstk_darwin(v9);
    v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
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

- (BOOL)snapshotDuringLiveResize
{
  v2 = self;
  v3 = (void *)sub_1005F56FC();
  v4 = v3;
  if (v3)
  {
    if ([v3 respondsToSelector:"snapshotDuringLiveResize"]) {
      LOBYTE(v4) = [v4 snapshotDuringLiveResize];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

- (void)open:(BOOL)a3
{
  v4 = self;
  BookReaderModuleHost.open(_:)(a3);
}

- (void)openToLocation:(id)a3 animated:(BOOL)a4
{
  swift_unknownObjectRetain();
  id v7 = self;
  BookReaderModuleHost.open(toLocation:animated:)((uint64_t)a3, a4);
  swift_unknownObjectRelease();
}

- (void)jumpToBeginningAnimated:(BOOL)a3
{
  v4 = self;
  BookReaderModuleHost.jumpToBeginning(animated:)(a3);
}

- (void)close:(BOOL)a3
{
  v4 = self;
  BookReaderModuleHost.close(_:)(a3);
}

- (void)saveStateClosing:(BOOL)a3
{
  v4 = self;
  BookReaderModuleHost.saveStateClosing(_:)(a3);
}

- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4
{
  v6 = self;
  BookReaderModuleHost.saveStateClosing(_:suspending:)(a3, a4);
}

- (BOOL)dismissShouldBegin:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController);
  if (v3) {
    return [v3 dismissShouldBegin:a3];
  }
  else {
    return [a3 proposedBeginState];
  }
}

- (void)assetViewControllerUpdateToolbars
{
  v2 = self;
  BookReaderModuleHost.assetViewControllerUpdateToolbars()();
}

- (void)assetViewControllerUpdateCloseStateTypeIfNeeded
{
  v2 = self;
  BookReaderModuleHost.assetViewControllerUpdateCloseStateTypeIfNeeded()();
}

- (void)assetViewControllerUpdateToolbarsAfterOpenAnimation
{
  v2 = self;
  BookReaderModuleHost.assetViewControllerUpdateToolbarsAfterOpenAnimation()();
}

- (void)assetViewControllerUpdateToolbarsForOpenAnimation
{
  v2 = self;
  BookReaderModuleHost.assetViewControllerUpdateToolbarsForOpenAnimation()();
}

- (void)assetViewControllerWillAddView
{
  v2 = self;
  BookReaderModuleHost.assetViewControllerWillAddView()();
}

- (void)assetViewControllerPrepareForReload
{
  v2 = self;
  BookReaderModuleHost.assetViewControllerPrepareForReload()();
}

- (void)setAssetIsPreordered:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  id v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  BookReaderModuleHost.setAssetIsPreordered(_:)(v9);
}

- (void)assetViewControllerWillOpen
{
  v2 = self;
  BookReaderModuleHost.assetViewControllerWillOpen()();
}

- (void)assetViewControllerDidOpenAnimated:(BOOL)a3
{
  v4 = self;
  BookReaderModuleHost.assetViewControllerDidOpen(animated:)(a3);
}

- (void)assetViewControllerWillEnterForeground
{
  v2 = self;
  BookReaderModuleHost.assetViewControllerWillEnterForeground()();
}

- (void)assetViewControllerDidEnterBackground
{
  v2 = self;
  BookReaderModuleHost.assetViewControllerDidEnterBackground()();
}

- (void)assetViewControllerDidCloseAnimated:(BOOL)a3
{
  v4 = self;
  BookReaderModuleHost.assetViewControllerDidClose(animated:)(a3);
}

- (int64_t)pageCountIncludingUpsell
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController);
  if (!v2) {
    return 1;
  }
  if (([*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController) respondsToSelector:"pageCountIncludingUpsell"] & 1) == 0)return 0; {

  }
  return (int64_t)[v2 pageCountIncludingUpsell];
}

- (void)didPurchaseWithProductProfile:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  BookReaderModuleHost.didPurchase(withProductProfile:completion:)((uint64_t)a3, (uint64_t)sub_100051634, v7);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)setBuyButtonProgress:(float)a3
{
  v4 = self;
  BookReaderModuleHost.setBuyButtonProgress(_:)(a3);
}

- (void)requestClose:(BOOL)a3
{
  v4 = self;
  BookReaderModuleHost.requestClose(_:)(a3);
}

- (BCBookPositionProcessing)bookPositionProcessor
{
  return (BCBookPositionProcessing *)sub_100299128();
}

- (void)setBookPositionProcessor:(id)a3
{
}

- (REBookReaderModuleHost)initWithHostEnvironmentProvider:(id)a3 book:(id)a4 annotationProvider:(id)a5 storeController:(id)a6 styleManager:(id)a7 engagementManager:(id)a8
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1007FD1D0();
  swift_unknownObjectRetain();
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = sub_1007FD1C0();
  id v21 = objc_allocWithZone(ObjectType);
  v22 = sub_1005F3158((uint64_t)a3, v15, v16, v17, v18, v19, v20);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (REBookReaderModuleHost *)v22;
}

- (void)dealloc
{
  v2 = self;
  BookReaderModuleHost.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  sub_10023E454((uint64_t)self + OBJC_IVAR___REBookReaderModuleHost_assetViewControllerDelegate);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController));
  v3 = (char *)self + OBJC_IVAR___REBookReaderModuleHost_log;
  uint64_t v4 = sub_1007F6BC0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_blurView);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  BookReaderModuleHost.viewWillTransition(to:with:)((uint64_t)a4, width, height);
  swift_unknownObjectRelease();
}

- (REBookReaderModuleHost)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005F5EF8();
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = self;
  sub_1005F0F1C();
  v7.receiver = v6;
  v7.super_class = ObjectType;
  [(REBookReaderModuleHost *)&v7 viewIsAppearing:v3];
  [(REBookReaderModuleHost *)v6 bc_analyticsVisibilityUpdateSubtree];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  [(REBookReaderModuleHost *)&v6 viewDidAppear:v3];
  [v4 bc_analyticsVisibilityUpdateSubtree];
  swift_getObjectType();
  id v5 = [v4 traitCollection];
  sub_1007FD210();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(REBookReaderModuleHost *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController);
  if (v2) {
    return (unint64_t)[v2 supportedInterfaceOrientations];
  }
  else {
    return 30;
  }
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController));
}

- (REBookReaderModuleHost)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (REBookReaderModuleHost *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)transitionContentView
{
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController)) {
    self = *(REBookReaderModuleHost **)((char *)&self->super.super.super.isa
  }
                                      + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController);
  id v2 = [(REBookReaderModuleHost *)self view];

  return v2;
}

- (BOOL)prefersStatusBarHiddenDuringTransition
{
  id v2 = self;
  Swift::Bool v3 = BookReaderModuleHost.prefersStatusBarHiddenDuringTransition()();

  return v3;
}

- (BAUpSellData)upSellData
{
  return (BAUpSellData *)sub_1005F51B8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_upSellData);
}

- (void)setUpSellData:(id)a3
{
}

- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData
{
  return (BAAppAnalyticsAdditionalData *)sub_1005F51B8((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_appAnalyticsAdditionalData);
}

- (void)setAppAnalyticsAdditionalData:(id)a3
{
}

- (void)forceRepagination
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController);
  if (v2) {
    [v2 forceRepagination];
  }
}

- (void)setFinishedForAssetID:(id)a3
{
  sub_1007FDC70();
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController);
  if (v4
    && ([*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___REBookReaderModuleHost_readerModuleViewController) respondsToSelector:"setFinishedForAssetID:"] & 1) != 0)
  {
    id v5 = self;
    id v6 = v4;
    id v7 = sub_1007FDC30();
    [v6 setFinishedForAssetID:v7];

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

@end