@interface PUStoryViewController
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)allowsTransition:(id)a3 withEndPoint:(id)a4;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)needs79067616Workaround;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersViewEnvironmentChromeHidden;
- (BOOL)prepareForPopTransition;
- (BOOL)px_determinesPreferredStatusBarStyle;
- (BOOL)remainsActiveWhileApplicationIsHidden;
- (Class)gridDecorationViewClass;
- (NSString)appIntentsDebugDescription;
- (PUStoryViewController)initWithCoder:(id)a3;
- (PUStoryViewController)initWithConfiguration:(id)a3;
- (PUStoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXStoryExportActivityHelper)exportActivityHelper;
- (PXStoryView)storyView;
- (PXStoryViewControllerDismissalDelegate)dismissalDelegate;
- (PXStoryViewControllerNavigationItemHelper)navigationItemHelper;
- (PXStoryViewControllerShareActionDelegate)shareActionDelegate;
- (PXStoryViewEnvironmentActionDelegate)viewEnvironmentActionDelegate;
- (UIActivityItemsConfigurationReading)activityItemsConfiguration;
- (UIEdgeInsets)px_layoutMargins;
- (id)detailItemReferenceForTransitionWithSummaryEndPoint:(id)a3;
- (id)dismissStoryViewControllerInteractively;
- (id)itemPlacementControllerForItemReference:(id)a3;
- (id)musicFeedbackContextMenuDelegateWithAudioAssetProvidingBlock:(id)a3;
- (id)summaryItemReferenceForTransitionWithSummaryEndPoint:(id)a3;
- (id)undoManagerForActionPerformer:(id)a3;
- (int64_t)userInterfaceFeature;
- (void)a_customTapToRadar:(id)a3;
- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)copyInternalURL;
- (void)deleteCurrentChapter;
- (void)deleteMemory;
- (void)deselectAll:(id)a3;
- (void)didBeginExportWithConfiguration:(id)a3;
- (void)didEndExportWithConfiguration:(id)a3;
- (void)didEndTransition:(id)a3 withEndPoint:(id)a4 finished:(BOOL)a5;
- (void)dismissAppleMusicPreview;
- (void)dismissStoryViewController;
- (void)fileRadar;
- (void)fileRadarForErrorRepository:(id)a3;
- (void)installViewDidLoadHandler:(id)a3;
- (void)loadStoryViewIfNeeded;
- (void)makeAssetKeyPhoto:(id)a3;
- (void)makeKeyPhoto:(id)a3;
- (void)moveLeft:(id)a3;
- (void)moveRight:(id)a3;
- (void)performActionForChromeActionMenuItem:(int64_t)a3 withValue:(int64_t)a4 sender:(id)a5;
- (void)presentAppleMusicPreviewForSelectedSong:(id)a3 curatedSongs:(id)a4;
- (void)presentAppleMusicSignupWithSender:(id)a3;
- (void)presentAssetPicker;
- (void)presentBrowserGrid;
- (void)presentChapterEditor;
- (void)presentChapterInsertor;
- (void)presentColorGradeEditor;
- (void)presentMusicEditor;
- (void)presentSharingViewWithSender:(id)a3;
- (void)presentStyleSwitcher;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)provideFeedback;
- (void)removeAssetsFromCuration:(id)a3;
- (void)requestExportConfigurationWithCompletionHandler:(id)a3;
- (void)selectAll:(id)a3;
- (void)setActivityItemsConfiguration:(id)a3;
- (void)setDismissalDelegate:(id)a3;
- (void)setGridDecorationViewClass:(Class)a3;
- (void)setNavigationItemHelper:(id)a3;
- (void)setRemainsActiveWhileApplicationIsHidden:(BOOL)a3;
- (void)setShareActionDelegate:(id)a3;
- (void)setStoryView:(id)a3;
- (void)setViewEnvironmentActionDelegate:(id)a3;
- (void)showVisualDiagnostics;
- (void)toggleMuteState;
- (void)togglePlayback:(id)a3;
- (void)toggleViewer:(id)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBeginTransition:(id)a3 withEndPoint:(id)a4 anchorItemReference:(id)a5;
- (void)willDismissWithoutTransitionToEndPoint:(id)a3;
@end

@implementation PUStoryViewController

- (void)loadStoryViewIfNeeded
{
  v2 = self;
  sub_1AEB4ABD0();
}

- (PXStoryView)storyView
{
  v2 = sub_1AEB4AC5C();
  return (PXStoryView *)v2;
}

- (void)setStoryView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AEB4ACF4(a3);
}

- (BOOL)remainsActiveWhileApplicationIsHidden
{
  return sub_1AEB4ADE0() & 1;
}

- (void)setRemainsActiveWhileApplicationIsHidden:(BOOL)a3
{
  v4 = self;
  sub_1AEB4AE68(a3);
}

- (PXStoryViewControllerNavigationItemHelper)navigationItemHelper
{
  v2 = (void *)sub_1AEB4B030();
  return (PXStoryViewControllerNavigationItemHelper *)v2;
}

- (void)setNavigationItemHelper:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_1AEB4B09C((uint64_t)a3);
}

- (Class)gridDecorationViewClass
{
  Class result = (Class)sub_1AEB4B160();
  if (result)
  {
    return (Class)swift_getObjCClassFromMetadata();
  }
  return result;
}

- (void)setGridDecorationViewClass:(Class)a3
{
  if (a3) {
    uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  }
  else {
    uint64_t ObjCClassMetadata = 0;
  }
  sub_1AEB4B1CC(ObjCClassMetadata);
}

- (PXStoryViewControllerShareActionDelegate)shareActionDelegate
{
  v2 = (void *)sub_1AEB4B280();
  return (PXStoryViewControllerShareActionDelegate *)v2;
}

- (void)setShareActionDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AEB4B2EC();
}

- (PXStoryViewControllerDismissalDelegate)dismissalDelegate
{
  v2 = (void *)sub_1AEB4B3C4();
  return (PXStoryViewControllerDismissalDelegate *)v2;
}

- (void)setDismissalDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AEB4B430();
}

- (PXStoryViewEnvironmentActionDelegate)viewEnvironmentActionDelegate
{
  v2 = (void *)sub_1AEB4B54C();
  return (PXStoryViewEnvironmentActionDelegate *)v2;
}

- (void)setViewEnvironmentActionDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_1AEB4B5B8((uint64_t)a3);
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  v2 = self;
  v3 = sub_1AEB4BC3C();

  return (UIActivityItemsConfigurationReading *)v3;
}

- (void)setActivityItemsConfiguration:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_1AEB4BD64((uint64_t)a3);
}

- (PUStoryViewController)initWithConfiguration:(id)a3
{
  return (PUStoryViewController *)StoryViewController.init(configuration:)(a3);
}

- (PUStoryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  StoryViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AEB4C2E4();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  sub_1AEB4CC0C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  sub_1AEB4CC0C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AEB4CD00(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1AEB4D014(a3);
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return sub_1AEB4D9C0() & 1;
}

- (BOOL)prefersViewEnvironmentChromeHidden
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)px_determinesPreferredStatusBarStyle
{
  return 1;
}

- (UIEdgeInsets)px_layoutMargins
{
  v2 = self;
  sub_1AEB4DA44();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (int64_t)userInterfaceFeature
{
  return 7;
}

- (void)installViewDidLoadHandler:(id)a3
{
  double v4 = _Block_copy(a3);
  _Block_copy(v4);
  double v5 = self;
  sub_1AEB4E354((char *)v5, (void (**)(void))v4);
  _Block_release(v4);
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  swift_unknownObjectRetain();
  double v5 = self;
  sub_1AEB4E630(a3);
  swift_unknownObjectRelease();
}

- (void)presentStyleSwitcher
{
  v2 = self;
  sub_1AEB4E800();
}

- (void)presentBrowserGrid
{
  v2 = self;
  sub_1AEB4EB3C();
}

- (void)presentMusicEditor
{
  v2 = self;
  sub_1AEB4EC54();
}

- (void)presentSharingViewWithSender:(id)a3
{
}

- (PXStoryExportActivityHelper)exportActivityHelper
{
  sub_1AEA2652C();
  return (PXStoryExportActivityHelper *)self;
}

- (void)performActionForChromeActionMenuItem:(int64_t)a3 withValue:(int64_t)a4 sender:(id)a5
{
  if (a5)
  {
    double v8 = self;
    swift_unknownObjectRetain();
    sub_1AEF97980();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    double v9 = self;
  }
  sub_1AEB51EB4(a3, a4, (uint64_t)v10);

  sub_1AEA2F124((uint64_t)v10, (uint64_t *)&unk_1E9A96A80);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    double v6 = self;
    swift_unknownObjectRetain();
    sub_1AEF97980();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    double v7 = self;
  }
  sub_1AEB528B4((uint64_t)a3, (uint64_t)v11);
  char v9 = v8;

  sub_1AEA2F124((uint64_t)v11, (uint64_t *)&unk_1E9A96A80);
  return v9 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1AEB52AF0(v4);
}

- (void)selectAll:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1AEF97980();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    double v5 = self;
  }
  sub_1AEB52DCC();

  sub_1AEA2F124((uint64_t)v6, (uint64_t *)&unk_1E9A96A80);
}

- (void)deselectAll:(id)a3
{
}

- (void)makeKeyPhoto:(id)a3
{
}

- (void)moveLeft:(id)a3
{
}

- (void)moveRight:(id)a3
{
}

- (void)togglePlayback:(id)a3
{
}

- (void)toggleViewer:(id)a3
{
}

- (void)makeAssetKeyPhoto:(id)a3
{
  swift_unknownObjectRetain();
  double v5 = self;
  sub_1AEB532A4((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (void)removeAssetsFromCuration:(id)a3
{
  uint64_t v4 = sub_1AEF97130();
  double v5 = self;
  sub_1AEB535D0(v4);
  swift_bridgeObjectRelease();
}

- (void)deleteMemory
{
  v2 = self;
  sub_1AEB53984();
}

- (void)dismissStoryViewController
{
  v2 = self;
  sub_1AEB53DE0();
}

- (id)dismissStoryViewControllerInteractively
{
  v2 = self;
  id v3 = sub_1AEB53EBC();

  return v3;
}

- (BOOL)needs79067616Workaround
{
  v2 = self;
  unsigned __int8 v3 = sub_1AEB53F78();

  return v3 & 1;
}

- (void)presentAppleMusicPreviewForSelectedSong:(id)a3 curatedSongs:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  double v5 = self;
  sub_1AEB54188();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)dismissAppleMusicPreview
{
  v2 = self;
  sub_1AEB557AC();
}

- (void)presentAppleMusicSignupWithSender:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_1AEB55840();
}

- (void)a_customTapToRadar:(id)a3
{
}

- (void)fileRadar
{
  v2 = self;
  sub_1AEB56CAC();
}

- (void)fileRadarForErrorRepository:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_1AEB56D60(v5);
}

- (void)provideFeedback
{
  v2 = self;
  sub_1AEB5737C();
}

- (void)copyInternalURL
{
  v2 = self;
  sub_1AEB57588();
}

- (void)showVisualDiagnostics
{
  v2 = self;
  sub_1AEB57D3C();
}

- (void)toggleMuteState
{
  v2 = self;
  sub_1AEB57FF0();
}

- (void)presentAssetPicker
{
  v2 = self;
  sub_1AEB58348();
}

- (id)musicFeedbackContextMenuDelegateWithAudioAssetProvidingBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  id v5 = self;
  id v6 = sub_1AEB58F50();

  swift_release();
  return v6;
}

- (BOOL)prepareForPopTransition
{
  return 1;
}

- (id)detailItemReferenceForTransitionWithSummaryEndPoint:(id)a3
{
  return sub_1AEB59318();
}

- (id)summaryItemReferenceForTransitionWithSummaryEndPoint:(id)a3
{
  return sub_1AEB59318();
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1AEF97980();
  swift_unknownObjectRelease();
  id v5 = sub_1AEB59440(v7);

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v7);
  return v5;
}

- (BOOL)allowsTransition:(id)a3 withEndPoint:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  unsigned __int8 v7 = sub_1AEB59570();

  swift_unknownObjectRelease();
  return v7 & 1;
}

- (void)willBeginTransition:(id)a3 withEndPoint:(id)a4 anchorItemReference:(id)a5
{
  if (a5)
  {
    id v7 = a3;
    swift_unknownObjectRetain();
    char v8 = self;
    swift_unknownObjectRetain();
    sub_1AEF97980();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    id v9 = a3;
    swift_unknownObjectRetain();
    double v10 = self;
  }
  sub_1AEB59674();

  swift_unknownObjectRelease();
  sub_1AEA2F124((uint64_t)v11, (uint64_t *)&unk_1E9A96A80);
}

- (void)didEndTransition:(id)a3 withEndPoint:(id)a4 finished:(BOOL)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_1AEB59804();

  swift_unknownObjectRelease();
}

- (void)willDismissWithoutTransitionToEndPoint:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1AEB59964();
  swift_unknownObjectRelease();
}

- (void)presentColorGradeEditor
{
  v2 = self;
  sub_1AEB59C20();
}

- (void)presentChapterEditor
{
  v2 = self;
  sub_1AEB5BDA4();
}

- (void)presentChapterInsertor
{
  v2 = self;
  sub_1AEB5C538();
}

- (void)deleteCurrentChapter
{
  v2 = self;
  sub_1AEB5CE80();
}

- (PUStoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AEF96DE0();
  }
  id v5 = a4;
  StoryViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1AEA1FDC4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___PUStoryViewController_onViewDidLoad));
  swift_unknownObjectRelease();
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR___PUStoryViewController_shareActionDelegate);
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR___PUStoryViewController_dismissalDelegate);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUStoryViewController____lazy_storage___viewModel));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUStoryViewController____lazy_storage___analyticsController));
  swift_release();
  sub_1AEA1FDC4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___PUStoryViewController_exportConfigurationCompletionBlock));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PUStoryViewController_originalToolbarScrollEdgeAppearance));

  sub_1AEA2F124((uint64_t)self + OBJC_IVAR___PUStoryViewController_lastAppVisibilityChangeDate, (uint64_t *)&unk_1E9A96A90);
  swift_release();

  swift_release();
  unsigned __int8 v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PUStoryViewController_airPlayHelper);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v4 = (UIPresentationController *)a3;
  id v5 = self;
  StoryViewController.presentationControllerDidDismiss(_:)(v4);
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  char v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  swift_unknownObjectRetain();
  double v11 = self;
  LOBYTE(v8) = StoryViewController.actionPerformer(_:dismiss:completionHandler:)((uint64_t)v11, a4, (uint64_t)sub_1AEB62354, v9);

  swift_unknownObjectRelease();
  swift_release();
  return v8 & 1;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = (void *)StoryViewController.undoManager(for:)((PXActionPerformer *)v5);

  return v6;
}

- (void)requestExportConfigurationWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  id v5 = self;
  StoryViewController.requestExportConfiguration(completionHandler:)();

  swift_release();
}

- (void)didBeginExportWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = self;
  StoryViewController.didBeginExport(with:)();
}

- (void)didEndExportWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = self;
  StoryViewController.didEndExport(with:)();
}

- (NSString)appIntentsDebugDescription
{
  v2 = self;
  StoryViewController.appIntentsDebugDescription.getter();

  unsigned __int8 v3 = (void *)sub_1AEF96DA0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4
{
  id v6 = _Block_copy(a3);
  id v7 = _Block_copy(a4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  *(void *)(swift_allocObject() + 16) = v7;
  uint64_t v9 = self;
  StoryViewController.appIntentsEnumerateAssetCollections(_:completionHandler:)((void (*)(uint64_t, uint64_t))sub_1AEB61220, v8, (uint64_t (*)(uint64_t))sub_1AEB49C50);

  swift_release();
  swift_release();
}

@end