@interface CRLiOSBoardViewController
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)allowsZoomHUD;
- (BOOL)canBeginFreehandDrawingMode;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)documentIsSharedReadOnly;
- (BOOL)hasMediaReplacerForInteractiveCanvasController:(id)a3;
- (BOOL)hasText;
- (BOOL)isCanvasDotGridEnabled;
- (BOOL)isClosed;
- (BOOL)isClosedOrClosing;
- (BOOL)isClosing;
- (BOOL)isConnectorModeEnabled;
- (BOOL)isInDrawingMode;
- (BOOL)isInFollowingMode;
- (BOOL)isPresentingCompactScenesNavigator;
- (BOOL)isPrimarySelectionPathReceiver;
- (BOOL)isValidMode:(id)a3 forEditorController:(id)a4;
- (BOOL)shapeLibraryViewControllerShouldAllowInsertDrag:(id)a3;
- (BOOL)shapeLibraryViewControllerShouldAppearInSearchMode:(id)a3;
- (BOOL)shouldKeepDocumentModeOnVisibilityChangeOfPencilTray:(id)a3;
- (BOOL)shouldResizeCanvasToScrollView;
- (BOOL)shouldSelectAndScrollWithApplePencil;
- (BOOL)tappedCanvasBackgroundAtPoint:(CGPoint)a3;
- (BOOL)wantsToShowCanvasDotGridOnInteractiveCanvasController:(id)a3;
- (BOOL)wantsToShowConnectorKnobsOnInteractiveCanvasController:(id)a3;
- (BOOL)wantsToSuppressKnobsOnTransformReps;
- (BOOL)wantsToSuppressMultiselectionWithSingleBoundsForInteractiveCanvasController:(id)a3;
- (BOOL)zoomOnSelectionChange:(id)a3;
- (CGPoint)canvasCenterInCanvasBackgroundLayer:(id)a3;
- (CGPoint)contentOffsetForCanvasBackgroundLayer:(id)a3;
- (CGPoint)originOffsetForCanvasBackgroundLayer:(id)a3;
- (CGRect)rectForBorder;
- (CGRect)safeAreaLayoutFrameForInteractiveCanvasController:(id)a3;
- (CRLFindReplaceController)findReplaceController;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLiOSDocumentMode)currentDocumentMode;
- (CRLiOSDocumentMode)defaultDocumentMode;
- (CRLiOSDocumentModeController)documentModeController;
- (NSArray)childSearchTargets;
- (NSUndoManager)undoManager;
- (PKCanvasView)pencilKitCanvasView;
- (UIFindInteraction)findReplaceInteraction;
- (UIWindow)keyboardObserversWindow;
- (_NSRange)visibleRootIndexRange;
- (_TtC8Freeform16CRLiOSPencilTray)sharedPencilTray;
- (_TtC8Freeform25CRLSelectionPathValidator)selectionPathValidator;
- (_TtC8Freeform25CRLiOSBoardViewController)initWithCoder:(id)a3;
- (_TtC8Freeform25CRLiOSBoardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)pencilKitCanvasViewController;
- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)pencilKitCanvasViewControllerForFreehandDrawingTools;
- (_TtC8Freeform8CRLBoard)board;
- (double)contentsScaleForCanvasBackgroundLayer:(id)a3;
- (double)displayCornerRadius;
- (id)barButtonItemForPresentingColorPickerWithHiddenPencilTray:(id)a3;
- (id)beginModalOperationWithLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5;
- (id)beginModalOperationWithPresentedLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5;
- (id)boardViewControllerTraitCollectionForShapeLibraryViewController:(id)a3;
- (id)canUndo;
- (id)canvasViewScaleDetentsForInteractiveCanvasController:(id)a3 isFastPinch:(BOOL)a4;
- (id)editingCoordinatorForInteractiveCanvasController:(id)a3;
- (id)editingCoordinatorForShapeLibraryViewController:(id)a3;
- (id)editorControllerForInteractiveCanvasController:(id)a3;
- (id)editorControllersToObserveForMode:(id)a3;
- (id)findInteraction:(id)a3 sessionForView:(id)a4;
- (id)freehandDrawingToolkitForPencilKitCanvasViewController:(id)a3;
- (id)interactiveCanvasControllerForFindController:(id)a3;
- (id)interactiveCanvasControllerForPencilKitCanvasViewController:(id)a3;
- (id)itemThumbnailDataForCloudSharingController:(id)a3;
- (id)itemTitleForCloudSharingController:(id)a3;
- (id)mediaReplacerForInteractiveCanvasController:(id)a3;
- (id)modeForEditorController:(id)a3;
- (id)modelEnumeratorForSearchWithFlags:(unint64_t)a3;
- (id)pencilDocumentModeFor:(unint64_t)a3;
- (id)pencilKitCanvasViewControllerForCanvasViewController:(id)a3;
- (id)pencilKitRulerHostingViewForPencilKitCanvasViewController:(id)a3;
- (id)pencilKitSnapshotViewForPencilKitCanvasViewController:(id)a3;
- (id)quickSelectHUDParentViewForCanvasViewController:(id)a3;
- (id)rectanglesObscuringView:(id)a3;
- (id)selectionModelTranslatorForInteractiveCanvasController:(id)a3;
- (id)selectionStateSnapshot;
- (id)shapeLibraryViewControllerDefaultSearchTerm:(id)a3;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)test_pencilKitCanvasViewController;
- (id)viewControllerForMiniFormatterForCanvasViewController:(id)a3;
- (unint64_t)freehandDrawingBehaviorAtUnscaledPoint:(CGPoint)a3;
- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6;
- (unint64_t)pencilModeTypeForPencilKitCanvasViewController:(id)a3;
- (unint64_t)rootIndexOfStartOfCurrentSelection;
- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3;
- (void)beginDrawingModeIfNeeded;
- (void)beginDrawingTransformModeIfNeeded;
- (void)beginHandwritingModeIfNeeded;
- (void)closeBoardShortcut:(id)a3;
- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4;
- (void)cloudSharingControllerDidSaveShare:(id)a3;
- (void)cloudSharingControllerDidStopSharing:(id)a3;
- (void)continueAsynchronousWorkOnMainThreadUsingBlock:(id)a3;
- (void)createSceneShortcut:(id)a3;
- (void)dealloc;
- (void)didEndFollowingParticipant:(id)a3 shouldShowRefollowPlacard:(BOOL)a4;
- (void)didLongPressUndoButtonWithSender:(id)a3;
- (void)didPressBackOrCloseButtonWithSender:(id)a3;
- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5;
- (void)didStartFollowingParticipant:(id)a3;
- (void)didTapUndoButtonWithSender:(id)a3;
- (void)didUpdateRectangleObscuringCanvasScrollViewForPencilTray:(id)a3;
- (void)dismissPresentedViewController;
- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4;
- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4;
- (void)documentCameraViewControllerDidCancel:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)endDrawingModeIfNeeded;
- (void)endModalOperationWithToken:(id)a3;
- (void)find:(id)a3;
- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4;
- (void)findInteraction:(id)a3 didEndFindSession:(id)a4;
- (void)generativePlaygroundHelper:(id)a3 didCreateImageAt:(id)a4;
- (void)generativePlaygroundHelperDidCancel:(id)a3;
- (void)handleBoardLibrarySnapshotUpdateWithNotification:(id)a3;
- (void)iCloudStatusDidChangeWithNotification:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)insertStickerFromItemProvider:(NSItemProvider *)a3 completionHandler:(id)a4;
- (void)insertText:(id)a3;
- (void)interactiveCanvasControllerDidScroll:(id)a3;
- (void)keyboardWillChangeFrame:(id)a3;
- (void)keyboardWillHideOrUndock:(id)a3;
- (void)keyboardWillShowOrDock:(id)a3;
- (void)loadView;
- (void)multipleRemoteParticipantsDidEndFollowingLocalParticipantsWithNumberOfParticipants:(int64_t)a3;
- (void)multipleRemoteParticipantsDidStartFollowingLocalParticipantWithNumberOfParticipants:(int64_t)a3;
- (void)networkReachabilityDidChangeWithNotification:(id)a3;
- (void)newBoard:(id)a3;
- (void)nextSceneShortcut:(id)a3;
- (void)observedTraitsDidChange:(id)a3 :(id)a4;
- (void)pencilKitViewWantsSuppressedFreehandContent:(BOOL)a3 forPencilKitCanvasViewController:(id)a4;
- (void)prefersPencilOnlyDrawingDidChange;
- (void)prepareForPencilKitBeganStroke:(id)a3;
- (void)prepareForPencilKitEndingOrCancellingStroke:(id)a3;
- (void)prepareForPencilKitSnapshottingForPencilKitCanvasViewController:(id)a3;
- (void)presentGenerativePlayground:(id)a3;
- (void)presentGenerativePlaygroundForCurrentSelection:(id)a3;
- (void)presentMediaCompatibilityAlertWithReasons:(int64_t)a3 forMediaType:(int64_t)a4 forSingleMediaObject:(BOOL)a5 completionHandler:(id)a6;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)previousSceneShortcut:(id)a3;
- (void)print:(id)a3;
- (void)processChanges:(id)a3 forChangeSource:(id)a4;
- (void)remoteParticipantDidEndFollowingLocalParticipantWithRemoteParticipant:(id)a3;
- (void)remoteParticipantDidStartFollowingLocalParticipantWithRemoteParticipant:(id)a3;
- (void)restoreUserActivityState:(id)a3;
- (void)selectionPathDidChangeWithFlags:(unint64_t)a3;
- (void)setDocumentModeController:(id)a3;
- (void)setFindReplaceController:(id)a3;
- (void)setFindReplaceInteraction:(id)a3;
- (void)setIsCanvasDotGridEnabled:(BOOL)a3;
- (void)setIsClosed:(BOOL)a3;
- (void)setIsClosing:(BOOL)a3;
- (void)setIsConnectorModeEnabled:(BOOL)a3;
- (void)setPencilKitCanvasView:(id)a3;
- (void)setPencilKitCanvasViewController:(id)a3;
- (void)setPrimarySearchReference:(id)a3 forFindReplaceController:(id)a4;
- (void)setSearchReferencesToHighlight:(id)a3 forFindReplaceController:(id)a4;
- (void)setSelectionPath:(id)a3 withFlags:(unint64_t)a4;
- (void)shapeLibraryViewController:(id)a3 willDisappearWithSearchTerm:(id)a4;
- (void)shapeLibraryViewControllerDidCancelSearch:(id)a3;
- (void)shareFailedWithError:(id)a3 recordID:(id)a4;
- (void)showFollowEndedAlertWithHostShortName:(id)a3;
- (void)showFollowFailedAlertFor:(int64_t)a3;
- (void)showFollowRefusedAlert;
- (void)syncControllerSavedZoneWithNotification:(id)a3;
- (void)tearDown;
- (void)toolkitDidDrawWithFinger;
- (void)toolkitDidDrawWithIndirectTouch;
- (void)toolkitDidDrawWithPencil;
- (void)undoHistoryChangedWithSender:(id)a3;
- (void)updateAdditionalSafeArea;
- (void)updateCountInSearchBarUI;
- (void)updateToolbarButtons;
- (void)userDidInteractWithCanvas:(id)a3;
- (void)validateCommand:(id)a3;
- (void)validateSelectionStateUsing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4;
@end

@implementation CRLiOSBoardViewController

- (void)iCloudStatusDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [(CRLiOSBoardViewController *)v5 traitCollection];
  sub_1005919EC(v6, (int)[*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController) documentIsSharedReadOnly], (uint64_t)v7);
  sub_100591DC0(v7, 0);
  sub_1005393A8((uint64_t)v7);
}

- (void)shareFailedWithError:(id)a3 recordID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_100535880((uint64_t)v8, v6);
}

- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4
{
  id v10 = a3;
  id v6 = (_TtC8Freeform25CRLiOSBoardViewController *)a4;
  v7 = self;
  sub_100DB2E18((uint64_t)v6, v7);
  id v8 = *(Class *)((char *)&v7->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interstitialUIController);
  if (v8)
  {
    v9 = v8;
    sub_100DE8BDC();

    v7 = v6;
    id v6 = v9;
  }
}

- (id)itemTitleForCloudSharingController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100538CF4();
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (void)cloudSharingControllerDidSaveShare:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100535F20(v4);
}

- (void)cloudSharingControllerDidStopSharing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100538E28();
}

- (id)itemThumbnailDataForCloudSharingController:(id)a3
{
  id v4 = a3;
  v5 = self;
  Class isa = (Class)[v4 share];
  if (isa)
  {
    static CKShare.SystemFieldKey.thumbnailImageData.getter();
    sub_100538CB4();
    CKRecordKeyValueSetting.subscript.getter();

    swift_bridgeObjectRelease();
    Class isa = 0;
    if (v9 >> 60 != 15)
    {
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      sub_100514260(v8, v9);
    }
  }
  else
  {
  }

  return isa;
}

- (void)networkReachabilityDidChangeWithNotification:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  type metadata accessor for MainActor();
  id v10 = self;
  id v11 = a3;
  uint64_t v12 = static MainActor.shared.getter();
  v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v10;
  sub_10059134C((uint64_t)v8, (uint64_t)&unk_101674818, (uint64_t)v13);

  swift_release();
}

- (void)syncControllerSavedZoneWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100596130(v4);
}

- (void)didTapUndoButtonWithSender:(id)a3
{
}

- (void)didLongPressUndoButtonWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1005A5440((uint64_t)v5);

  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v5);
}

- (void)didPressBackOrCloseButtonWithSender:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_1005A5630();

  sub_100522F00((uint64_t)v6, &qword_101672BF0);
}

- (void)undoHistoryChangedWithSender:(id)a3
{
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  uint64_t v8 = self;
  sub_1005C5320(v6);

  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  sub_10050BF48(0, (unint64_t *)&qword_10167B170);
  id v5 = a3;
  uint64_t v6 = self;
  id v8 = (id)static OS_os_log.default.getter();
  uint64_t v7 = static os_log_type_t.default.getter();
  sub_100BAC898((uint64_t)v8, (uint64_t)&_mh_execute_header, v7, (uint64_t)"User cancelled inserting a file", 31, 2, (uint64_t)_swiftEmptyArrayStorage);
}

- (void)imagePickerControllerDidCancel:(id)a3
{
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  type metadata accessor for InfoKey(0);
  sub_1005C689C(&qword_101671720, type metadata accessor for InfoKey);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v6;
  v12[4] = sub_1005C7A40;
  v12[5] = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = *(void *)"";
  v12[2] = sub_100679958;
  v12[3] = &unk_1015098C8;
  uint64_t v9 = _Block_copy(v12);
  id v10 = a3;
  id v11 = self;
  swift_bridgeObjectRetain();
  swift_release();
  [v10 dismissViewControllerAnimated:1 completion:v9];
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1005B573C(v6, v7);
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  uint64_t v4 = qword_10166F9C8;
  id v5 = a3;
  id v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v7 = (id)static OS_os_log.crlDefault;
  uint64_t v8 = static os_log_type_t.default.getter();
  sub_100BAC898((uint64_t)v7, (uint64_t)&_mh_execute_header, v8, (uint64_t)"Document camera cancelled", 25, 2, (uint64_t)_swiftEmptyArrayStorage);

  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1005C5490(v6);
}

- (void)presentGenerativePlayground:(id)a3
{
}

- (void)presentGenerativePlaygroundForCurrentSelection:(id)a3
{
}

- (void)generativePlaygroundHelper:(id)a3 didCreateImageAt:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  id v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1005057FC(&qword_1016743E0);
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10117E810;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v7 + 16))(v12 + v11, v10, v6);
  id v13 = a3;
  uint64_t v14 = self;
  uint64_t v15 = sub_100E3C6E8();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  uint64_t v19 = v15;
  v20 = sub_1005C7968;
  uint64_t v21 = v16;
  v17 = v14;
  sub_100FB614C(v12, (void (*)(double *, Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion (__swiftcall *)(CKRecordID, Swift::String), uint64_t))sub_1005C7970, (uint64_t)v18);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)generativePlaygroundHelperDidCancel:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_gpHelper;
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_gpHelper);
  if (v6)
  {
    uint64_t v7 = *(void **)(v6 + OBJC_IVAR____TtC8Freeform29CRLGenerativePlaygroundHelper_viewController);
    id v8 = a3;
    uint64_t v9 = self;
    [v7 dismissViewControllerAnimated:1 completion:0];
    id v12 = *(Class *)((char *)&self->super.super.super.isa + v5);
  }
  else
  {
    id v10 = a3;
    unint64_t v11 = self;
    id v12 = 0;
  }
  *(Class *)((char *)&self->super.super.super.isa + v5) = 0;
}

- (BOOL)hasText
{
  return 0;
}

- (void)insertText:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1005B6D54(v4, v6);

  swift_bridgeObjectRelease();
}

- (CRLiOSDocumentModeController)documentModeController
{
  v2 = self;
  id v3 = sub_100E3C594();

  return (CRLiOSDocumentModeController *)v3;
}

- (void)setDocumentModeController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___documentModeController);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___documentModeController) = (Class)a3;
  id v3 = a3;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                   + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController));
}

- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)pencilKitCanvasViewController
{
  return (_TtC8Freeform35CRLiOSPencilKitCanvasViewController *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasViewController);
}

- (void)setPencilKitCanvasViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasViewController);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasViewController) = (Class)a3;
  id v3 = a3;
}

- (PKCanvasView)pencilKitCanvasView
{
  return (PKCanvasView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasView));
}

- (void)setPencilKitCanvasView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasView) = (Class)a3;
  id v3 = a3;
}

- (UIFindInteraction)findReplaceInteraction
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIFindInteraction *)Strong;
}

- (void)setFindReplaceInteraction:(id)a3
{
}

- (CRLFindReplaceController)findReplaceController
{
  v2 = self;
  id v3 = sub_100E3CE10();

  return (CRLFindReplaceController *)v3;
}

- (void)setFindReplaceController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___findReplaceController);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___findReplaceController) = (Class)a3;
  id v3 = a3;
}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  uint64_t v9 = sub_100E3CEE0(v6, (uint64_t)v7);

  return v9;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v6 = *(void **)(*(char **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator)
                + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_followCoordinator);
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = v6;
  sub_1007ECB48(1);

  id v11 = [objc_allocWithZone((Class)CRLiOSDocumentModeFindReplace) initWithBoardViewController:v9 andInteractiveCanvasController:*(Class *)((char *)&v9->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController)];
  id v12 = sub_100E3C594();
  [v12 setMode:v11 animated:1];
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100E720B4();
}

- (_TtC8Freeform8CRLBoard)board
{
  return (_TtC8Freeform8CRLBoard *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                                      + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator)
                                                                           + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_mainBoard));
}

- (BOOL)isClosing
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isClosing);
}

- (void)setIsClosing:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isClosing) = a3;
}

- (BOOL)isClosed
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isClosed);
}

- (void)setIsClosed:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isClosed) = a3;
}

- (BOOL)isClosedOrClosing
{
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isClosing)) {
    return 1;
  }
  else {
    return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isClosed);
  }
}

- (_TtC8Freeform25CRLiOSBoardViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100E72198();
}

- (void)tearDown
{
  v2 = self;
  sub_100E3E52C();
}

- (void)dealloc
{
  char v2 = *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isTornDown);
  id v3 = self;
  if ((v2 & 1) == 0)
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2, 419, (uint64_t)"Must call tearDown() before deallocation occurs.", 48, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"deinit", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2, 419);
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CRLiOSBoardViewController();
  [(CRLiOSBoardViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___editorController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___documentModeController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___boardEditor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_selectionModelTranslator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasViewController));
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_delegate);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_undoAlertController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_progressTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_progressViewController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shareSheetProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interstitialUIController));
  sub_10053890C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shareSyncAwaitTask), *(void *)&self->$__lazy_storage_$_editorController[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shareSyncAwaitTask]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasBackgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1005C5B38(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_toolbarButtonState), *(void *)&self->$__lazy_storage_$_editorController[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_toolbarButtonState], *(void *)&self->editingCoordinator[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_toolbarButtonState], *(void **)&self->boardLibrary[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_toolbarButtonState]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___undoToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___insertTextBoxToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___insertAVMediaToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___insertStickyNoteToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___insertShapeToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___togglePencilModeToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___insertStencilToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___shareToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___boardViewControlsItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___newBoardToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___doneToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___doneWithModeToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___doneWithScenesNavigatorToolbarItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___viewOnlyToolbarItem));
  sub_100522AD8(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___collaborationButtonItem));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_photoPickerLoadingProgress));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_gpHelper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_insertURLAlert));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasScrollViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_snapshotViewWrapper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___snapshotHostingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasZoomControlViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasZoomAndScenesContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_boardControlsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_connectorModeMessageViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_connectorModeMessageViewState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scenesNavigatorViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_compactScenesNavigatorViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scenesNavigatorState));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scenesPopoverState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scenesPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_compactScenesPresenter));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_presentedSceneAlert));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_findSession));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___findReplaceController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_freehandDrawingHighlightManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_keyboardTopEdgeLayoutGuideConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_topUnobscuredRectLayoutGuideConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_bottomUnobscuredRectLayoutGuideConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_leadingUnobscuredRectLayoutGuideConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_trailingUnobscuredRectLayoutGuideConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_statusHUDManager));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_currentlyPresentedTip, &qword_101674708);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_tipPresentationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_mediaReplacer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___unobscuredRectLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController____lazy_storage___keyboardFrameLayoutGuide));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_followBorderHighlightView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_viewScaleObservation));
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scrollObserver, &qword_101672BF0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController__sharedPencilTray));
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_lastPrintContentDate, &qword_101672EB0);
}

- (void)loadView
{
  char v2 = self;
  sub_100E3FD08();
}

- (void)viewDidLoad
{
  char v2 = self;
  sub_100E40BB4();
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_100E41678(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_100E41BF0(a3);
}

- (void)viewDidLayoutSubviews
{
  char v2 = self;
  sub_100E46958();
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    id v8 = sub_1005E21D4;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v11 = a3;
  id v10 = self;
  sub_100E46C24(v11, a4, (uint64_t)v8, v9);
  sub_1005174AC((uint64_t)v8);
}

- (_TtC8Freeform16CRLiOSPencilTray)sharedPencilTray
{
  uint64_t v3 = OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController__sharedPencilTray;
  objc_super v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController__sharedPencilTray);
  unint64_t v5 = self;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = (objc_class *)sub_100E48CC8();
    id v8 = *(Class *)((char *)&self->super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.isa + v3) = v7;
    id v6 = v7;

    objc_super v4 = 0;
  }
  uint64_t v9 = v4;

  return (_TtC8Freeform16CRLiOSPencilTray *)v6;
}

- (void)restoreUserActivityState:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  sub_100E48F84((uint64_t)v5);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4 = self;
  sub_100E491B4(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4 = self;
  sub_100E49664(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  id v8 = self;
  sub_100E499B8((uint64_t)a4, width, height);

  swift_unknownObjectRelease();
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  sub_100E4A4B8((uint64_t)v7, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)observedTraitsDidChange:(id)a3 :(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self;
  sub_100E738A4(v6);
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.super.super.isa
                                                                             + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator)
                                                                  + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_undoManager));
}

- (void)updateAdditionalSafeArea
{
  char v2 = self;
  sub_100E4B054();
}

- (void)handleBoardLibrarySnapshotUpdateWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = self;
  sub_100E4B888((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (BOOL)isCanvasDotGridEnabled
{
  return sub_100E4ED9C((unsigned __int8 *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController__isCanvasDotGridEnabled, sub_100E4EA7C);
}

- (void)setIsCanvasDotGridEnabled:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100E4E064(a3);
}

- (BOOL)isConnectorModeEnabled
{
  return sub_100E4ED9C((unsigned __int8 *)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController__isConnectorModeEnabled, sub_100E4F834);
}

- (void)setIsConnectorModeEnabled:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100E4EE64(a3);
}

- (BOOL)documentIsSharedReadOnly
{
  return [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController) documentIsSharedReadOnly];
}

- (BOOL)isInFollowingMode
{
  char v2 = *(void **)(*(char **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator)
                + OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_followCoordinator);
  uint64_t v3 = self;
  id v4 = v2;
  char v5 = sub_1007E9F6C();

  return v5 & 1;
}

- (CRLiOSDocumentMode)currentDocumentMode
{
  char v2 = self;
  id v3 = sub_100E3C594();
  id v4 = [v3 mode];

  return (CRLiOSDocumentMode *)v4;
}

- (id)quickSelectHUDParentViewForCanvasViewController:(id)a3
{
  id v3 = [(CRLiOSBoardViewController *)self view];

  return v3;
}

- (BOOL)shouldSelectAndScrollWithApplePencil
{
  char v2 = self;
  id v3 = sub_100E3C594();
  id v4 = [v3 mode];

  LOBYTE(v3) = [v4 shouldSelectAndScrollWithApplePencil];
  return (char)v3;
}

- (id)pencilKitCanvasViewControllerForCanvasViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasViewController));
}

- (void)prefersPencilOnlyDrawingDidChange
{
  char v2 = self;
  id v3 = sub_100E3C594();
  id v4 = [v3 mode];

  [v4 prefersPencilOnlyDrawingDidChange];
}

- (void)dismissPresentedViewController
{
  char v2 = self;
  id v3 = (_TtC8Freeform25CRLiOSBoardViewController *)[(CRLiOSBoardViewController *)v2 presentedViewController];
  if (v3)
  {
    id v8 = v3;
    id v4 = [(CRLiOSBoardViewController *)v2 presentedViewController];
    if (v4)
    {
      char v5 = v4;
      self;
      BOOL v6 = swift_dynamicCastObjCClass() == 0;
    }
    else
    {
      BOOL v6 = 1;
    }
    [(CRLiOSBoardViewController *)v8 dismissViewControllerAnimated:v6 completion:0];

    uint64_t v7 = v8;
  }
  else
  {
    uint64_t v7 = v2;
  }
}

- (void)beginHandwritingModeIfNeeded
{
  char v2 = self;
  sub_100E537BC();
}

- (void)userDidInteractWithCanvas:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_connectorModeMessageViewState);
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v3;
  static Published.subscript.setter();
}

- (id)editorControllerForInteractiveCanvasController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController);
  id v5 = a3;
  BOOL v6 = self;
  id v7 = v4;
  sub_10060ED60((uint64_t)v5, (uint64_t)v7, (uint64_t)&_mh_execute_header, (uint64_t)"editorController(for:)", 22, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2u, 1950);

  id v8 = sub_100E3C474();

  return v8;
}

- (id)selectionModelTranslatorForInteractiveCanvasController:(id)a3
{
  return sub_100E53AA4((char *)self, (uint64_t)a2, a3, (uint64_t)"selectionModelTranslator(for:)", 30, 1955, &OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_selectionModelTranslator);
}

- (id)editingCoordinatorForInteractiveCanvasController:(id)a3
{
  return sub_100E53AA4((char *)self, (uint64_t)a2, a3, (uint64_t)"editingCoordinator(for:)", 24, 1960, &OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator);
}

- (void)selectionPathDidChangeWithFlags:(unint64_t)a3
{
  id v3 = self;
  sub_100E73EA8();
}

- (id)canvasViewScaleDetentsForInteractiveCanvasController:(id)a3 isFastPinch:(BOOL)a4
{
  sub_100E74294();
  sub_10050BF48(0, (unint64_t *)&qword_101684330);
  v4.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (id)rectanglesObscuringView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100E743DC();

  sub_10050BF48(0, (unint64_t *)&qword_10167AF10);
  v6.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (CGRect)safeAreaLayoutFrameForInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100E73654();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)shouldResizeCanvasToScrollView
{
  return 1;
}

- (BOOL)hasMediaReplacerForInteractiveCanvasController:(id)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_mediaReplacer);
  if (v3)
  {
    double v6 = *(void **)(v3 + OBJC_IVAR____TtC8Freeform19CRLiOSMediaReplacer_interactiveCanvasController);
    sub_10050BF48(0, &qword_101675990);
    id v7 = a3;
    double v8 = self;
    id v9 = v6;
    char v10 = static NSObject.== infix(_:_:)();
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

- (id)mediaReplacerForInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  double v6 = sub_100E53DD8();

  return v6;
}

- (BOOL)wantsToSuppressMultiselectionWithSingleBoundsForInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_100E3C594();
  id v7 = [v6 mode];

  LOBYTE(v6) = [v7 wantsToSuppressMultiselectionWithSingleBounds];
  return (char)v6;
}

- (BOOL)wantsToShowCanvasDotGridOnInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_100E54048((uint64_t)v4);

  return self & 1;
}

- (BOOL)wantsToShowConnectorKnobsOnInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_100E5414C((uint64_t)v4);

  return self & 1;
}

- (BOOL)zoomOnSelectionChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_100E74A18();

  return self & 1;
}

- (BOOL)tappedCanvasBackgroundAtPoint:(CGPoint)a3
{
  uint64_t v3 = self;
  char v4 = sub_100E74AF8();

  return v4 & 1;
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100E542D0();
}

- (id)canUndo
{
  v1 = *(void **)&a1[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController];
  char v2 = a1;
  if ([v1 editingDisabled]) {
    id v3 = 0;
  }
  else {
    id v3 = [*(id *)&v2[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasViewController] allowUndoRedoOperations];
  }

  return v3;
}

- (_TtC8Freeform25CRLSelectionPathValidator)selectionPathValidator
{
  char v2 = self;
  id v3 = sub_100E54520();

  return (_TtC8Freeform25CRLSelectionPathValidator *)v3;
}

- (BOOL)isPrimarySelectionPathReceiver
{
  char v2 = self;
  unsigned __int8 v3 = sub_100E54608();

  return v3 & 1;
}

- (id)selectionStateSnapshot
{
  char v2 = self;
  id v3 = sub_100E3C474();
  id v4 = [v3 selectionPath];

  id v5 = objc_allocWithZone((Class)type metadata accessor for CRLPersistableSelectionPath(0));
  sub_10064A0DC(v4);
  id v7 = v6;

  return v7;
}

- (void)validateSelectionStateUsing:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100E5479C(a3);
}

- (void)updateToolbarButtons
{
  char v2 = self;
  id v3 = [(CRLiOSBoardViewController *)v2 traitCollection];
  sub_1005919EC(v3, (int)[*(id *)((char *)&v2->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController) documentIsSharedReadOnly], (uint64_t)v4);
  sub_100591DC0(v4, 0);
  sub_1005393A8((uint64_t)v4);
}

- (BOOL)allowsZoomHUD
{
  char v2 = self;
  char v3 = sub_100E56C84();

  return v3 & 1;
}

- (id)viewControllerForMiniFormatterForCanvasViewController:(id)a3
{
  id v4 = (_TtC8Freeform25CRLiOSBoardViewController *)a3;
  id v5 = self;
  id v6 = (_TtC8Freeform25CRLiOSBoardViewController *)[(CRLiOSBoardViewController *)v5 traitCollection];
  if ((objc_msgSend(self, "crl_phoneUI") & 1) == 0)
  {
    unsigned __int8 v7 = [(CRLiOSBoardViewController *)v6 crl_isCompactWidth];

    if (v7) {
      goto LABEL_5;
    }
    id v6 = v5;
    id v5 = (_TtC8Freeform25CRLiOSBoardViewController *)objc_retain(*(id *)((char *)&v5->super.super.super.isa
                                                                       + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_canvasViewController));
  }

  id v4 = v6;
LABEL_5:

  return v5;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    unsigned __int8 v7 = self;
  }
  sub_100E56E60((uint64_t)a3, (uint64_t)v16, v17);

  sub_100522F00((uint64_t)v16, &qword_101672BF0);
  uint64_t v8 = v18;
  if (v18)
  {
    id v9 = sub_10050F848(v17, v18);
    uint64_t v10 = *(void *)(v8 - 8);
    __n128 v11 = __chkstk_darwin(v9, v9);
    double v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v10 + 16))(v13, v11);
    double v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v17);
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    unsigned __int8 v7 = self;
  }
  char v8 = sub_100E57450((uint64_t)a3, (uint64_t)v10);

  sub_100522F00((uint64_t)v10, &qword_101672BF0);
  return v8 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  [v4 action];
  id v6 = (NSString *)String._bridgeToObjectiveC()();
  NSSelectorFromString(v6);

  if (static Selector.== infix(_:_:)()) {
    [v4 setAttributes:1];
  }
  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for CRLiOSBoardViewController();
  [(CRLiOSBoardViewController *)&v7 validateCommand:v4];
}

- (void)find:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = self;
  objc_super v7 = self;
  sub_100E533D0(sub_1005C629C, v6);
  swift_release();

  sub_100522F00((uint64_t)v8, &qword_101672BF0);
}

- (void)print:(id)a3
{
}

- (_TtC8Freeform25CRLiOSBoardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGRect result = (_TtC8Freeform25CRLiOSBoardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)isPresentingCompactScenesNavigator
{
  char v2 = self;
  char v3 = (_TtC8Freeform25CRLiOSBoardViewController *)[(CRLiOSBoardViewController *)v2 presentedViewController];
  if (!v3)
  {
    id v4 = v2;
LABEL_7:

    return 0;
  }
  id v4 = v3;
  id v5 = *(Class *)((char *)&v2->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_compactScenesNavigatorViewController);
  if (!v5)
  {

    goto LABEL_7;
  }
  sub_10050BF48(0, (unint64_t *)&qword_101672E50);
  id v6 = v5;
  char v7 = static NSObject.== infix(_:_:)();

  return (v7 & 1) != 0;
}

- (double)displayCornerRadius
{
  char v2 = self;
  id v3 = [(CRLiOSBoardViewController *)v2 view];
  if (v3)
  {
    id v5 = v3;
    id v6 = [v3 traitCollection];

    [v6 displayCornerRadius];
    double v8 = v7;

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CGRect)rectForBorder
{
  char v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scrollView);
  id v3 = self;
  [v2 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v2 adjustedContentInset];

  double v12 = sub_100A4A174(v5, v7, v9, v11, 0.0, 0.0);
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)didStartFollowingParticipant:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100E59800(v4);
}

- (void)didEndFollowingParticipant:(id)a3 shouldShowRefollowPlacard:(BOOL)a4
{
  id v7 = a3;
  double v8 = self;
  sub_100E5A0B8(a3, a4);
}

- (void)remoteParticipantDidStartFollowingLocalParticipantWithRemoteParticipant:(id)a3
{
}

- (void)remoteParticipantDidEndFollowingLocalParticipantWithRemoteParticipant:(id)a3
{
}

- (void)multipleRemoteParticipantsDidStartFollowingLocalParticipantWithNumberOfParticipants:(int64_t)a3
{
}

- (void)multipleRemoteParticipantsDidEndFollowingLocalParticipantsWithNumberOfParticipants:(int64_t)a3
{
}

- (void)showFollowFailedAlertFor:(int64_t)a3
{
  id v4 = self;
  sub_100E5A744(a3);
}

- (void)showFollowEndedAlertWithHostShortName:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  id v7 = self;
  sub_100E5A97C(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)showFollowRefusedAlert
{
  char v2 = self;
  sub_100E5AC6C();
}

- (id)beginModalOperationWithLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  id v7 = (uint64_t (*)())_Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    id v7 = sub_1005E21D4;
  }
  double v8 = self;
  id v9 = a4;
  sub_100E756F0();
  double v11 = v10;
  sub_1005174AC((uint64_t)v7);

  return v11;
}

- (id)beginModalOperationWithPresentedLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  id v7 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (v7)
  {
    double v11 = (void *)swift_allocObject();
    v11[2] = v7;
    id v7 = sub_1005E21D4;
  }
  else
  {
    double v11 = 0;
  }
  double v12 = self;
  id v13 = a4;
  double v14 = sub_100E5B070(v8, v10, a4, (uint64_t)v7, v11);
  sub_1005174AC((uint64_t)v7);

  swift_bridgeObjectRelease();

  return v14;
}

- (void)endModalOperationWithToken:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_100E5B734((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)continueAsynchronousWorkOnMainThreadUsingBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_100E75830((uint64_t)sub_1005E2108, v5);

  swift_release();
}

- (void)presentMediaCompatibilityAlertWithReasons:(int64_t)a3 forMediaType:(int64_t)a4 forSingleMediaObject:(BOOL)a5 completionHandler:(id)a6
{
  id v7 = _Block_copy(a6);
  uint64_t v8 = (void (*)(void *, void, void, uint64_t))v7[2];
  uint64_t v9 = self;
  v8(v7, 0, 0, 1);
  _Block_release(v7);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100E5DCEC(1);
}

- (void)newBoard:(id)a3
{
}

- (void)closeBoardShortcut:(id)a3
{
}

- (void)createSceneShortcut:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  if (((*(unsigned char **)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_scenesNavigatorState))[OBJC_IVAR____TtC8Freeform23CRLScenesNavigatorState_captureIsAnimating] & 1) == 0)
  {
    [(CRLiOSBoardViewController *)self endDrawingModeIfNeeded];
    sub_100E5D3EC();
    sub_100E68A9C(0);
  }

  sub_100522F00((uint64_t)v6, &qword_101672BF0);
}

- (void)nextSceneShortcut:(id)a3
{
}

- (void)previousSceneShortcut:(id)a3
{
}

- (BOOL)shapeLibraryViewControllerShouldAllowInsertDrag:(id)a3
{
  return 1;
}

- (id)editingCoordinatorForShapeLibraryViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator));
}

- (id)boardViewControllerTraitCollectionForShapeLibraryViewController:(id)a3
{
  id v3 = [(CRLiOSBoardViewController *)self traitCollection];

  return v3;
}

- (BOOL)shapeLibraryViewControllerShouldAppearInSearchMode:(id)a3
{
  return *(void *)&self->$__lazy_storage_$_editorController[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shapeLibrarySearchTerm] != 0;
}

- (id)shapeLibraryViewControllerDefaultSearchTerm:(id)a3
{
  if (*(void *)&self->$__lazy_storage_$_editorController[OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shapeLibrarySearchTerm])
  {
    swift_bridgeObjectRetain();
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return v3;
}

- (void)shapeLibraryViewController:(id)a3 willDisappearWithSearchTerm:(id)a4
{
  if (a4)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  id v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shapeLibrarySearchTerm);
  uint64_t *v7 = v5;
  v7[1] = v6;

  swift_bridgeObjectRelease();
}

- (void)shapeLibraryViewControllerDidCancelSearch:(id)a3
{
  NSString v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_shapeLibrarySearchTerm);
  *NSString v3 = 0;
  v3[1] = 0;
  swift_bridgeObjectRelease();
}

- (BOOL)isValidMode:(id)a3 forEditorController:(id)a4
{
  return 1;
}

- (id)modeForEditorController:(id)a3
{
  return 0;
}

- (CRLiOSDocumentMode)defaultDocumentMode
{
  id v2 = [objc_allocWithZone((Class)CRLiOSDocumentModeEdit) initWithBoardViewController:self];

  return (CRLiOSDocumentMode *)v2;
}

- (id)editorControllersToObserveForMode:(id)a3
{
  sub_1005057FC((uint64_t *)&unk_101676C10);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_101177E70;
  id v6 = a3;
  id v7 = self;
  *(void *)(v5 + 32) = sub_100E3C474();
  specialized Array._endMutation()();

  sub_10050BF48(0, (unint64_t *)&unk_101693C00);
  v8.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (void)willSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v10 = self;
  BOOL v9 = [v7 pencilModeType] == (id)2;
  *((unsigned char *)&v10->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_isChangingDocumentModeToHandwriting) = v9;
}

- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = self;
  sub_100E75B18(v7, v8);
}

- (id)interactiveCanvasControllerForPencilKitCanvasViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController));
}

- (unint64_t)pencilModeTypeForPencilKitCanvasViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_100E3C594();
  id v7 = [v6 mode];

  id v8 = [v7 pencilModeType];
  return (unint64_t)v8;
}

- (id)freehandDrawingToolkitForPencilKitCanvasViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController);
  id v5 = a3;
  id v6 = self;
  id v7 = [v4 freehandDrawingToolkit];
  if (!v7)
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"freehandDrawingToolkit(for:)", 28, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2, 3474, (uint64_t)"Toolkit should be set up by the time freehandDrawingToolkit(for pencilKitCanvasViewController:) is called.", 106, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"freehandDrawingToolkit(for:)", 28, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2, 3474);
  }

  return v7;
}

- (id)pencilKitSnapshotViewForPencilKitCanvasViewController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_snapshotViewWrapper));
}

- (id)pencilKitRulerHostingViewForPencilKitCanvasViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id result = [(CRLiOSBoardViewController *)v5 view];
  if (result)
  {
    id v7 = result;

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)pencilKitViewWantsSuppressedFreehandContent:(BOOL)a3 forPencilKitCanvasViewController:(id)a4
{
}

- (void)prepareForPencilKitSnapshottingForPencilKitCanvasViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100E7605C((uint64_t *)&selRef_prepareForPencilKitSnapshotting);
}

- (void)prepareForPencilKitBeganStroke:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100E7605C((uint64_t *)&selRef_didBeginPencilKitStroke);
}

- (void)prepareForPencilKitEndingOrCancellingStroke:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100E7605C((uint64_t *)&selRef_didFinishPencilKitStroke);
}

- (void)beginDrawingModeIfNeeded
{
  id v2 = self;
  sub_100E5F944();
}

- (void)endDrawingModeIfNeeded
{
  id v7 = self;
  id v2 = sub_100E3C594();
  id v3 = [v2 mode];

  id v4 = [v3 pencilModeType];
  if (v4 == (id)1)
  {
    id v5 = (_TtC8Freeform25CRLiOSBoardViewController *)sub_100E3C594();
    [(CRLiOSBoardViewController *)v5 resetToDefaultModeAnimated:1];

    id v6 = v5;
  }
  else
  {
    id v6 = v7;
  }
}

- (void)beginDrawingTransformModeIfNeeded
{
  id v2 = self;
  sub_100E5FB5C();
}

- (void)toolkitDidDrawWithPencil
{
  id v2 = self;
  sub_100E5FCCC();
}

- (void)toolkitDidDrawWithFinger
{
  id v2 = self;
  sub_100E5FF74();
}

- (void)toolkitDidDrawWithIndirectTouch
{
  id v2 = self;
  sub_100E60158();
}

- (unint64_t)freehandDrawingBehaviorAtUnscaledPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = self;
  unint64_t v6 = sub_100E6033C(x, y);

  return v6;
}

- (_TtC8Freeform35CRLiOSPencilKitCanvasViewController)pencilKitCanvasViewControllerForFreehandDrawingTools
{
  id v2 = self;
  id v3 = (id)sub_100E761B4();

  return (_TtC8Freeform35CRLiOSPencilKitCanvasViewController *)v3;
}

- (BOOL)canBeginFreehandDrawingMode
{
  return 1;
}

- (BOOL)isInDrawingMode
{
  id v2 = self;
  id v3 = sub_100E3C594();
  id v4 = [v3 mode];

  id v5 = [v4 pencilModeType];
  return v5 == (id)1;
}

- (BOOL)wantsToSuppressKnobsOnTransformReps
{
  id v2 = self;
  id v3 = sub_100E3C594();
  id v4 = [v3 mode];

  LOBYTE(v3) = [v4 wantsToSuppressSelectionKnobs];
  return (char)v3;
}

- (id)pencilDocumentModeFor:(unint64_t)a3
{
  id v4 = self;
  id v5 = (void *)sub_100E606E4(a3);

  return v5;
}

- (void)didUpdateRectangleObscuringCanvasScrollViewForPencilTray:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_100E4B054();
  swift_unknownObjectRelease();
}

- (id)barButtonItemForPresentingColorPickerWithHiddenPencilTray:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  id v5 = sub_100E3C8CC();
  swift_unknownObjectRelease();

  return v5;
}

- (BOOL)shouldKeepDocumentModeOnVisibilityChangeOfPencilTray:(id)a3
{
  return *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_undoAlertController) != 0;
}

- (id)interactiveCanvasControllerForFindController:(id)a3
{
  sub_10050BF48(0, (unint64_t *)&qword_101672E50);
  id v5 = a3;
  unint64_t v6 = self;
  id v7 = sub_100E3CE10();
  LOBYTE(self) = static NSObject.== infix(_:_:)();

  if ((self & 1) == 0)
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"interactiveCanvasController(forFind:)", 37, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2, 3711, (uint64_t)"Unknown find and replace controller", 35, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"interactiveCanvasController(forFind:)", 37, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2, 3711);
  }
  id v8 = objc_retainAutoreleaseReturnValue(*(id *)((char *)&v6->super.super.super.isa
                                               + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController));

  return v8;
}

- (id)modelEnumeratorForSearchWithFlags:(unint64_t)a3
{
  id v3 = [objc_allocWithZone((Class)CRLDocumentModelEnumerator) initWithRootModelObject:*(void *)(*(void *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_editingCoordinator)+ OBJC_IVAR____TtC8Freeform21CRLEditingCoordinator_mainBoard)+ OBJC_IVAR____TtC8Freeform8CRLBoard_rootContainer) flags:a3 filter:0];

  return v3;
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  return 0;
}

- (void)setSelectionPath:(id)a3 withFlags:(unint64_t)a4
{
}

- (_NSRange)visibleRootIndexRange
{
  NSUInteger v2 = 0;
  NSUInteger v3 = 1;
  result.length = v3;
  result.location = v2;
  return result;
}

- (unint64_t)rootIndexOfStartOfCurrentSelection
{
  return 0;
}

- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3
{
  return 1;
}

- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4
{
  unint64_t v6 = (void (**)(void *, _TtC8Freeform25CRLiOSBoardViewController *))_Block_copy(a4);
  id v7 = self;
  sub_10060EDB0(a3, 0, (uint64_t)&_mh_execute_header, (uint64_t)"withRootSearchTarget(at:execute:)", 33, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSBoardViewController.swift", 95, 2u, 3740);
  v6[2](v6, v7);
  _Block_release(v6);
}

- (void)setPrimarySearchReference:(id)a3 forFindReplaceController:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  id v8 = self;
  sub_100E762CC((uint64_t)a3, (SEL *)&selRef_setPrimaryFindResultSearchReference_);
  swift_unknownObjectRelease();
}

- (void)setSearchReferencesToHighlight:(id)a3 forFindReplaceController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = self;
  sub_100E762CC((uint64_t)a3, (SEL *)&selRef_setSearchReferencesToHighlight_);
}

- (void)updateCountInSearchBarUI
{
  id Strong = (id)swift_unknownObjectWeakLoadStrong();
  NSUInteger v3 = self;
  [Strong updateResultCount];
}

- (NSArray)childSearchTargets
{
  NSUInteger v2 = self;
  sub_100E62124();

  sub_1005057FC(&qword_10169FAF8);
  v3.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = self;
  sub_100E76364(v7, a4);

  swift_unknownObjectRelease();
}

- (BOOL)accessibilityPerformEscape
{
  NSUInteger v2 = self;
  char v3 = sub_100E62604();

  return v3 & 1;
}

- (BOOL)accessibilityPerformMagicTap
{
  NSUInteger v2 = self;
  char v3 = sub_100E62BD4();

  return v3 & 1;
}

- (id)test_pencilKitCanvasViewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_pencilKitCanvasViewController));
}

- (UIWindow)keyboardObserversWindow
{
  NSUInteger v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController);
  char v3 = self;
  id v4 = (_TtC8Freeform25CRLiOSBoardViewController *)[v2 canvasView];
  if (v4)
  {
    id v5 = v4;
    id v6 = [(CRLiOSBoardViewController *)v4 window];

    char v3 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (UIWindow *)v6;
}

- (void)keyboardWillShowOrDock:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v9 = self;
  sub_100E446A8(0);
  if ((sub_100E3CCB4() & 1) == 0)
  {
    uint64_t v10 = self;
    Class isa = Notification._bridgeToObjectiveC()().super.isa;
    LOBYTE(v10) = [(id)v10 isKeyboardFrameChanging:isa];

    if (v10) {
      [*(id *)((char *)&v9->super.super.super.isa+ OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController) scrollCurrentSelectionToVisibleWithOptions:1];
    }
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)keyboardWillHideOrUndock:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v9 = self;
  sub_100E446A8(0);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)keyboardWillChangeFrame:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v9 = self;
  sub_100E664C8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)insertStickerFromItemProvider:(NSItemProvider *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v11 = _Block_copy(a4);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  double v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10169FAA0;
  v14[5] = v12;
  double v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10169FAB0;
  v15[5] = v14;
  double v16 = a3;
  double v17 = self;
  sub_100E6DE90((uint64_t)v10, (uint64_t)&unk_10169A060, (uint64_t)v15);
  swift_release();
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  type metadata accessor for CRLChangeRecord();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100E6C93C(v5, (uint64_t)v7);

  swift_bridgeObjectRelease();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v7);
}

- (double)contentsScaleForCanvasBackgroundLayer:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController);
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = [v4 canvas];
  [v7 contentsScale];
  double v9 = v8;

  return v9;
}

- (CGPoint)canvasCenterInCanvasBackgroundLayer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  double v6 = sub_100E6D5F0((uint64_t)v4);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)originOffsetForCanvasBackgroundLayer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform25CRLiOSBoardViewController_interactiveCanvasController);
  id v5 = a3;
  double v6 = self;
  id v7 = [v4 layerHost];
  if (v7
    && (id v8 = [v7 canvasLayer], swift_unknownObjectRelease(), v8))
  {
    [v8 bounds];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {

    double v10 = 0.0;
    double v12 = 0.0;
  }
  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPoint)contentOffsetForCanvasBackgroundLayer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100E768D0();
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

@end