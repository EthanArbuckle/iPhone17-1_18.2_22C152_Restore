@interface CRLiOSCanvasViewController
- (BOOL)allowGestureInRestrictedGestureMode:(id)a3;
- (BOOL)allowOpenLinkOnSingleTapForRepWhenEditingDisabled:(id)a3;
- (BOOL)allowTouchOutsideCanvasViewAtPoint:(CGPoint)a3 forGesture:(id)a4;
- (BOOL)allowUndoRedoOperations;
- (BOOL)allowedToEnterQuickSelectMode;
- (BOOL)allowsCanvasScrollingFromKeyboard;
- (BOOL)allowsSystemDragSession;
- (BOOL)becomeFirstResponderIfAppropriate;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canEditRepWithDragOperation:(id)a3;
- (BOOL)canInsertBoardItemsFromDragOperationForDragInfo:(id)a3;
- (BOOL)canInsertScribbleElementAtPoint:(CGPoint)a3;
- (BOOL)canOriginateSystemDrags;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canReceiveSystemDrops;
- (BOOL)canvasSubview:(id)a3 shouldHandleEventAtBoundsPoint:(CGPoint)a4;
- (BOOL)contextMenuMightBeDisplayed;
- (BOOL)contextMenuPositionShouldUpdateForContextMenuController:(id)a3;
- (BOOL)crl_representsPhysicalKeyboard;
- (BOOL)currentlyTrackingIndirectPointerTouch;
- (BOOL)disallowRectangularMarqueeOperationAtUnscaledPoint:(CGPoint)a3;
- (BOOL)documentChromeHasPresentedViewController;
- (BOOL)documentModeWantsToSuppressMediaReplacementKnobs;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4;
- (BOOL)i_allowCanvasInteraction:(id)a3 atPoint:(CGPoint)a4;
- (BOOL)i_isCurrentlyTrackingTouch;
- (BOOL)inInspectorPanZoomMode;
- (BOOL)inInspectorTextEditingMode;
- (BOOL)inMediaBrowsingMode;
- (BOOL)inRestrictedGestureMode;
- (BOOL)isCurrentlyInQuickSelectMode;
- (BOOL)isHandlingScribbleWriting;
- (BOOL)isInFocusedContainer;
- (BOOL)isShowingRadialPalette;
- (BOOL)p_currentModeAllowsQuickSelect;
- (BOOL)p_currentModeIsFind;
- (BOOL)p_editorAllowsQuickSelect;
- (BOOL)p_isAccessibilityTextResponderAction:(SEL)a3;
- (BOOL)p_scribblePreventedRegardlessOfPoint;
- (BOOL)p_shouldIgnoreKeyboardInputForTouchType:(int64_t)a3 atSomeTouchPoint:(CGPoint)a4;
- (BOOL)p_shouldShowMiniFormatterForSelectionPath:(id)a3;
- (BOOL)preserveEditorSelection;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)respondsToSelector:(SEL)a3 withSender:(id)a4;
- (BOOL)shapeLibraryViewControllerShouldAllowInsertDrag:(id)a3;
- (BOOL)shapeLibraryViewControllerShouldAppearInSearchMode:(id)a3;
- (BOOL)shouldAllowDragOperationForDragInfo:(id)a3;
- (BOOL)shouldAllowDynamicInsertForDragInfo:(id)a3;
- (BOOL)shouldBeginScribblingAtPoint:(CGPoint)a3;
- (BOOL)shouldExitQuickSelectModeForQuickSelectViewController:(id)a3;
- (BOOL)shouldHideCanvasLayerInMagnifier;
- (BOOL)shouldIgnoreKeyboardInput;
- (BOOL)shouldIgnoreTextGesture:(id)a3 atPoint:(CGPoint)a4;
- (BOOL)shouldIncludeObjectInScribbleCapableElements:(id)a3;
- (BOOL)shouldOptOutOfUIScrollViewContentOffsetAnimation;
- (BOOL)shouldPreserveEditorSelectionInSplitViewMode;
- (BOOL)shouldPreventBecomingFirstResponderOnViewLoad;
- (BOOL)shouldPreventDefaultPencilBehaviors;
- (BOOL)shouldSelectAndScrollWithApplePencil;
- (BOOL)shouldSelectAndShowEditMenuOnFirstTapForRep:(id)a3;
- (BOOL)touchHitsCanvasViewAtPoint:(CGPoint)a3;
- (BOOL)wantsSystemInputAssistantForScribble;
- (CALayer)layer;
- (CGPoint)lastTapPoint;
- (CGPoint)p_targetPointForEditMenuForSelectionPath:(id)a3 outModifiedDirection:(int64_t *)a4;
- (CGRect)p_targetRectForMenuControllerPositionForSelectionPath:(id)a3;
- (CGRect)rectForInsertingScribbleElements;
- (CGRect)rectToIncludeWhenGrowingCanvasToFitContent;
- (CGRect)targetRectForContextMenuController;
- (CGRect)targetRectForEditMenu:(id)a3;
- (CGRect)visibleCanvasRectForQuickSelectViewController:(id)a3;
- (CGRect)visibleScaledRectForCanvasUI;
- (CRLCanvasImageHUDController)imageHUDController;
- (CRLCanvasLayer)canvasLayer;
- (CRLCanvasView)canvasView;
- (CRLEditorController)editorController;
- (CRLFreehandDrawingPKSelectionManager)smartSelectionManager;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLUserDialogPresenter)userDialogPresenter;
- (CRLWPImmediatePressGestureRecognizer)immediatePressGestureRecognizer;
- (CRLWPLongPressGestureRecognizer)longPressGestureRecognizer;
- (CRLWPTapAndTouchGestureRecognizer)doubleTapAndTouchGestureRecognizer;
- (CRLWPTapAndTouchGestureRecognizer)tapAndTouchGestureRecognizer;
- (CRLWPTapGestureRecognizer)immediateDoubleTapGestureRecognizer;
- (CRLWPTapGestureRecognizer)immediateSingleTapGestureRecognizer;
- (CRLWPTapGestureRecognizer)secondarySingleTapGestureRecognizer;
- (CRLiOSAllTouchesDoneGestureRecognizer)allTouchesDoneGestureRecognizer;
- (CRLiOSCanvasDragInteractionDelegate)dragInteractionDelegate;
- (CRLiOSCanvasDropInteractionDelegate)dropInteractionDelegate;
- (CRLiOSCanvasViewController)initWithCoder:(id)a3;
- (CRLiOSCanvasViewController)initWithInteractiveCanvasController:(id)a3;
- (CRLiOSCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CRLiOSCanvasViewControllerDelegate)delegate;
- (CRLiOSEditMenuTapGestureRecognizer)editMenuTapGestureRecognizer;
- (CRLiOSFreehandDrawingGestureRecognizer)freehandDrawingGestureRecognizer;
- (CRLiOSKnobDragGestureRecognizer)knobDragGestureRecognizer;
- (CRLiOSMultiSelectGestureRecognizer)multiSelectGestureRecognizer;
- (CRLiOSPencilDownGestureRecognizer)pencilDownGestureRecognizer;
- (CRLiOSPencilMediating)pencilMediator;
- (CRLiOSRectangularMarqueeGestureRecognizer)rectangularMarqueeGestureRecognizer;
- (CRLiOSRepDragGestureRecognizer)repDragGestureRecognizer;
- (CRLiOSRepNudgeGestureRecognizer)nudgeGestureRecognizer;
- (CRLiOSRepRotateGestureRecognizer)repRotateGestureRecognizer;
- (CRLiOSRepRotateKnobGestureRecognizer)repRotateKnobGestureRecognizer;
- (CRLiOSScribbleInteractionDelegate)scribbleInteractionDelegate;
- (CRLiOSWindowIgnoreUserInteractionSafeWrapper)zoomTrackerIgnoreInteractionEventsSafeWrapper;
- (Class)audioInspectorPaneClass;
- (Class)movieInspectorPaneClass;
- (Class)recordingInspectorPaneClass;
- (Class)taggedPlaceholderInfoPaneClass;
- (Class)webVideoInspectorPaneClass;
- (NSArray)commonGestureRecognizers;
- (NSArray)gesturesToAdjustIfStylusShouldSelectAndScroll;
- (NSArray)passthroughViewsToAllowCanvasInteractionDuringPopoverPresentation;
- (NSMutableArray)disabledGesturesWhileInEyeDropperMode;
- (NSMutableArray)gestureRecognizers;
- (NSTimer)preventInsertScribbleElementTimer;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIDragInteraction)dragInteraction;
- (UIEditMenuInteraction)editMenuInteraction;
- (UIGestureRecognizer)preventScrollGestureRecognizer;
- (UIGestureRecognizer)zoomGestureRecognizer;
- (UIIndirectScribbleInteraction)scribbleInteraction;
- (UIScribbleInteraction)directScribbleInteraction;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (UITapGestureRecognizer)singleTapGestureRecognizer;
- (UITextInput)currentEditingTextInputResponder;
- (UIView)presentedHUDView;
- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator;
- (_TtC8Freeform28CRLiOSMiniFormatterPresenter)miniFormatterPresenter;
- (_TtC8Freeform31CRLiOSPencilHoverGestureHandler)pencilHoverGestureHandler;
- (id)_scribbleCapableElementsForReps:(id)a3 forRect:(CGRect)a4;
- (id)appSpecificGestureRecognizersAllowedDuringFreehandDrawing;
- (id)backgroundColorForMagnifier;
- (id)beginModalOperationWithLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5;
- (id)beginModalOperationWithPresentedLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5;
- (id)containedScribbleElementForContainerScribbleElement:(id)a3;
- (id)contextMenuInteractionDelegate;
- (id)editMenuConfigrationForSelectionPath:(id)a3 withConfigurationIdentifier:(id)a4;
- (id)editingCoordinatorForShapeLibraryViewController:(id)a3;
- (id)gesturesSupportingStylusAndIndirectPointer;
- (id)gesturesThatImmediateMarqueeShouldRequireToFail;
- (id)hitKnobWithTouch:(id)a3 returningRep:(id *)a4;
- (id)hitRepWithTouch:(id)a3;
- (id)i_quickSelectViewController;
- (id)insertTextBoxForScribbleAtUnscaledCanvasPoint:(CGPoint)a3;
- (id)insertedScribbleElementAtPoint:(CGPoint)a3;
- (id)itemsToAddToEditMenuForRep:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)modelContainerForLocalDragContext;
- (id)newDragAndDropController;
- (id)p_allRepsForHitTestingOrdered;
- (id)p_reasonStringForIgnoringKeyboardInputWithAllTouchesDoneGestureRecognizer:(id)a3;
- (id)p_willPresentError:(id)a3;
- (id)pointerInteractionDelegate;
- (id)scribbleCapableElementWithIdentifier:(id)a3;
- (id)scribbleCapableElementsForRect:(CGRect)a3;
- (id)shapeLibraryViewControllerDefaultSearchTerm:(id)a3;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)viewForGestureRecognizer:(id)a3;
- (void)addCommonObservers;
- (void)addInspectorPanZoomModeGRsToArray:(id)a3;
- (void)alignmentToolsControllerShouldDismiss:(id)a3;
- (void)beginPreventingDefaultPencilBehaviors;
- (void)canvasZoomTracker:(id)a3 willBeginViewScaleFeedbackWithZoomMethod:(int64_t)a4;
- (void)canvasZoomTracker:(id)a3 willUpdateViewScaleFeedbackWithScale:(double)a4;
- (void)canvasZoomTrackerDidEndFinalZoomAnimation:(id)a3;
- (void)canvasZoomTrackerDidEndViewScaleFeedback:(id)a3;
- (void)canvasZoomTrackerDidFinish:(id)a3;
- (void)canvasZoomTrackerWillBeginFinalZoomAnimation:(id)a3;
- (void)contextMenuDidHideForContextMenuController:(id)a3;
- (void)continueAsynchronousWorkOnMainThreadUsingBlock:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)didDismissQuickSelectViewController:(id)a3;
- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5;
- (void)didStartCountingTouches:(id)a3 touchType:(int64_t)a4 atSomeTouchPoint:(CGPoint)a5;
- (void)didStopCountingTouches:(id)a3;
- (void)dismissDocumentChromePresentedViewController;
- (void)dragSessionWillBegin;
- (void)endModalOperationWithToken:(id)a3;
- (void)endPreventingDefaultPencilBehaviors;
- (void)enterQuickSelectMode;
- (void)forceStopScrolling;
- (void)forwardInvocation:(id)a3;
- (void)handleDoubleTap:(id)a3;
- (void)hideEditMenu;
- (void)i_startObservingFreehandDrawingToolkit;
- (void)i_updateZoomGestureRecognizer;
- (void)insertStencilFromLibrary:(id)a3;
- (void)leaveQuickSelectModeIfNeeded;
- (void)modifyGesturesUsedForStylusAndIndirectPointerAddingTouchType:(int64_t)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_accessibilityInvertColorsDidChange:(id)a3;
- (void)p_allTouchesDone:(id)a3;
- (void)p_applicationDidBecomeActive:(id)a3;
- (void)p_buildMenuItems:(id)a3 forSelectionPath:(id)a4;
- (void)p_buildMenuTitles:(id)a3 forSelectionPath:(id)a4;
- (void)p_didEnterBackground:(id)a3;
- (void)p_handleHoverGesture:(id)a3;
- (void)p_handlePencilDown:(id)a3;
- (void)p_handleSingleTapGesture:(id)a3;
- (void)p_handleSqueezePaletteViewWillShowNotification:(id)a3;
- (void)p_handleTapForEditMenu:(id)a3;
- (void)p_keyWindowDidChange:(id)a3;
- (void)p_leaveQuickSelectMode;
- (void)p_presentStencilLibraryWithBoardItemsToSave:(id)a3;
- (void)p_schedulePreventInsertScribbleElementTimer;
- (void)p_setDragLiftDelay:(double)a3;
- (void)p_setUpWPGestureRecognizers;
- (void)p_setupDidEnterBackgroundObserver;
- (void)p_setupWillEnterForegroundObserver;
- (void)p_willEnterForeground:(id)a3;
- (void)p_zoomWithGesture:(id)a3;
- (void)presentAlignmentTools;
- (void)presentError:(id)a3 completionHandler:(id)a4;
- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5;
- (void)presentMediaCompatibilityAlertWithReasons:(int64_t)a3 forMediaType:(int64_t)a4 forSingleMediaObject:(BOOL)a5 completionHandler:(id)a6;
- (void)removeCommonObservers;
- (void)resetGesturesForContextSwitch;
- (void)saveSelectedBoardItemsAsStencil:(id)a3;
- (void)scribbleInteractionDidFinishWriting;
- (void)scribbleInteractionWillBeginWritingScribbleElementWillBeInserted:(BOOL)a3;
- (void)scrollViewDidScroll;
- (void)setAllTouchesDoneGestureRecognizer:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setContextMenuMightBeDisplayed:(BOOL)a3;
- (void)setCurrentlyTrackingIndirectPointerTouch:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectScribbleInteraction:(id)a3;
- (void)setDisabledGesturesWhileInEyeDropperMode:(id)a3;
- (void)setDoubleTapAndTouchGestureRecognizer:(id)a3;
- (void)setDoubleTapGestureRecognizer:(id)a3;
- (void)setEditMenuInteraction:(id)a3;
- (void)setEditMenuTapGestureRecognizer:(id)a3;
- (void)setFreehandDrawingGestureRecognizer:(id)a3;
- (void)setGestureRecognizers:(id)a3;
- (void)setImmediateDoubleTapGestureRecognizer:(id)a3;
- (void)setImmediatePressGestureRecognizer:(id)a3;
- (void)setImmediateSingleTapGestureRecognizer:(id)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setKnobDragGestureRecognizer:(id)a3;
- (void)setLastTapPoint:(CGPoint)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setMiniFormatterPresenter:(id)a3;
- (void)setMultiSelectGestureRecognizer:(id)a3;
- (void)setNudgeGestureRecognizer:(id)a3;
- (void)setPencilDownGestureRecognizer:(id)a3;
- (void)setPreventInsertScribbleElementTimer:(id)a3;
- (void)setRectangularMarqueeGestureRecognizer:(id)a3;
- (void)setRepDragGestureRecognizer:(id)a3;
- (void)setRepRotateGestureRecognizer:(id)a3;
- (void)setRepRotateKnobGestureRecognizer:(id)a3;
- (void)setScribbleInteraction:(id)a3;
- (void)setScribbleInteractionDelegate:(id)a3;
- (void)setSecondarySingleTapGestureRecognizer:(id)a3;
- (void)setSingleTapGestureRecognizer:(id)a3;
- (void)setTapAndTouchGestureRecognizer:(id)a3;
- (void)setUpCommonGestureAllowedTouchTypes;
- (void)setUpGestureRecognizers;
- (void)setUserDialogPresenter:(id)a3;
- (void)setView:(id)a3;
- (void)setZoomGestureRecognizer:(id)a3;
- (void)setZoomTrackerIgnoreInteractionEventsSafeWrapper:(id)a3;
- (void)showDefaultEditUIForCurrentSelection;
- (void)showEditMenuForSelectionPath:(id)a3;
- (void)showEditUIForSelectionPath:(id)a3;
- (void)showMiniFormatterToExitDrawingMode:(id)a3;
- (void)teardown;
- (void)temporarilyHideQuickSelectHUDIfNecessary;
- (void)toggleDefaultEditUIForCurrentSelection;
- (void)toggleEditMenuForCurrentSelection;
- (void)unhideQuickSelectHUDIfNecessary;
- (void)unlock:(id)a3;
- (void)updateToolbarButtons;
- (void)userDismissedAlignmentToolsController:(id)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willUpdateLayerTree;
@end

@implementation CRLiOSCanvasViewController

- (CRLiOSCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSCanvasViewController;
  v4 = [(CRLiOSCanvasViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    sub_1002BFDBC(v4);
  }
  return v5;
}

- (CRLiOSCanvasViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSCanvasViewController;
  v3 = [(CRLiOSCanvasViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    sub_1002BFDBC(v3);
  }
  return v4;
}

- (CRLiOSCanvasViewController)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSCanvasViewController;
  v5 = [(CRLiOSCanvasViewController *)&v8 initWithNibName:0 bundle:0];
  objc_super v6 = v5;
  if (v5)
  {
    sub_1002BFDBC(v5);
    [(CRLiOSCanvasViewController *)v6 setInteractiveCanvasController:v4];
  }

  return v6;
}

- (BOOL)shouldHideCanvasLayerInMagnifier
{
  return 1;
}

- (id)backgroundColorForMagnifier
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    if (self->mSceneWillEnterForegroundObserver)
    {
      objc_super v6 = +[NSNotificationCenter defaultCenter];
      [v6 removeObserver:self->mSceneWillEnterForegroundObserver];

      mSceneWillEnterForegroundObserver = self->mSceneWillEnterForegroundObserver;
      self->mSceneWillEnterForegroundObserver = 0;
    }
    if (self->mSceneDidEnterBackgroundObserver)
    {
      objc_super v8 = +[NSNotificationCenter defaultCenter];
      [v8 removeObserver:self->mSceneDidEnterBackgroundObserver];

      mSceneDidEnterBackgroundObserver = self->mSceneDidEnterBackgroundObserver;
      self->mSceneDidEnterBackgroundObserver = 0;
    }
    objc_storeWeak((id *)&self->mDelegate, obj);
    [(CRLiOSCanvasViewController *)self p_setupWillEnterForegroundObserver];
    [(CRLiOSCanvasViewController *)self p_setupDidEnterBackgroundObserver];
    v5 = obj;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSCanvasViewController;
  [(CRLiOSCanvasViewController *)&v4 viewDidAppear:a3];
  if (!self->mSceneWillEnterForegroundObserver) {
    [(CRLiOSCanvasViewController *)self p_setupWillEnterForegroundObserver];
  }
  if (!self->mSceneDidEnterBackgroundObserver) {
    [(CRLiOSCanvasViewController *)self p_setupDidEnterBackgroundObserver];
  }
  [(CRLiOSCanvasViewController *)self becomeFirstResponderIfAppropriate];
}

- (void)p_setupWillEnterForegroundObserver
{
  v3 = [(CRLiOSCanvasViewController *)self view];
  objc_super v4 = [v3 window];
  v5 = [v4 windowScene];

  if (v5)
  {
    objc_initWeak(&location, self);
    objc_super v6 = +[NSNotificationCenter defaultCenter];
    objc_super v7 = +[NSNotification CRLiOSSceneWillEnterForeground];
    objc_super v8 = +[NSOperationQueue mainQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002C0200;
    v11[3] = &unk_1014E9F98;
    objc_copyWeak(&v12, &location);
    v9 = [v6 addObserverForName:v7 object:v5 queue:v8 usingBlock:v11];
    mSceneWillEnterForegroundObserver = self->mSceneWillEnterForegroundObserver;
    self->mSceneWillEnterForegroundObserver = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)p_setupDidEnterBackgroundObserver
{
  v3 = [(CRLiOSCanvasViewController *)self view];
  objc_super v4 = [v3 window];
  v5 = [v4 windowScene];

  if (v5)
  {
    objc_initWeak(&location, self);
    objc_super v6 = +[NSNotificationCenter defaultCenter];
    objc_super v7 = +[NSNotification CRLiOSSceneDidEnterBackground];
    objc_super v8 = +[NSOperationQueue mainQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002C03D4;
    v11[3] = &unk_1014E9F98;
    objc_copyWeak(&v12, &location);
    v9 = [v6 addObserverForName:v7 object:v5 queue:v8 usingBlock:v11];
    mSceneDidEnterBackgroundObserver = self->mSceneDidEnterBackgroundObserver;
    self->mSceneDidEnterBackgroundObserver = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSCanvasViewController;
  if (-[CRLiOSCanvasViewController respondsToSelector:](&v12, "respondsToSelector:"))
  {
    v11.receiver = self;
    v11.super_class = (Class)CRLiOSCanvasViewController;
    id v5 = [(CRLiOSCanvasViewController *)&v11 methodSignatureForSelector:a3];
  }
  else
  {
    objc_super v6 = (void *)qword_1016A95B8;
    if (!qword_1016A95B8)
    {
      id v7 = +[NSString stringWithFormat:@"%s%s%s%s", "v", "@", ":", "@"];
      uint64_t v8 = +[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", [v7 UTF8String]);
      v9 = (void *)qword_1016A95B8;
      qword_1016A95B8 = v8;

      objc_super v6 = (void *)qword_1016A95B8;
    }
    id v5 = v6;
  }

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSCanvasViewController;
  if ([(CRLiOSCanvasViewController *)&v10 respondsToSelector:a3])
  {
    unsigned __int8 v7 = 1;
  }
  else if (+[CRLInteractiveCanvasController selectorIsActionMethod:a3])
  {
    uint64_t v8 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    unsigned __int8 v7 = [v8 respondsToSelector:a3 withSender:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return [(CRLiOSCanvasViewController *)self respondsToSelector:a3 withSender:0];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  [v4 invokeWithTarget:v5];
}

- (void)dealloc
{
  if (!self->mHasBeenTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9FB8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109865C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9FD8);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController dealloc]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:373 isFatal:0 description:"CVC should have been torn down before dealloc"];
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSCanvasViewController;
  [(CRLiOSCanvasViewController *)&v6 dealloc];
}

- (void)teardown
{
  if ([(CRLiOSCanvasViewController *)self isViewLoaded])
  {
    v3 = [(CRLiOSCanvasViewController *)self canvasView];
    [v3 teardown];

    id v4 = [(CRLiOSCanvasViewController *)self canvasView];
    [v4 setGestureRecognizers:0];
  }
  +[CRLiOSScribbleInteractionSetupHelper setupScribbleEditingProvider:self scribbleObserver:0 scribbleActive:0];
  id v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  objc_super v6 = [v5 freehandDrawingToolkit];
  [v6 removeToolkitObserver:self];

  [(CRLiOSCanvasViewController *)self leaveQuickSelectModeIfNeeded];
  [(CRLiOSPencilMediator *)self->mPencilMediator teardown];
  mPencilMediator = self->mPencilMediator;
  self->mPencilMediator = 0;

  mAlignmentController = self->mAlignmentController;
  if (mAlignmentController)
  {
    [(CRLiOSAlignmentToolsController *)mAlignmentController dismissAlignmentTools];
    v9 = self->mAlignmentController;
    self->mAlignmentController = 0;
  }
  [(CRLMiniFormatterStateManager *)self->_miniFormatterPresenter teardown];
  miniFormatterPresenter = self->_miniFormatterPresenter;
  self->_miniFormatterPresenter = 0;

  self->mHasBeenTornDown = 1;
  [(CRLiOSCanvasViewController *)self resignFirstResponder];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  [WeakRetained layerHostHasBeenTornDown];
}

- (void)viewDidLoad
{
  v53.receiver = self;
  v53.super_class = (Class)CRLiOSCanvasViewController;
  [(CRLiOSCanvasViewController *)&v53 viewDidLoad];
  v3 = [(CRLiOSCanvasViewController *)self canvasView];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);

    if (!WeakRetained)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA038);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101098778();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA058);
      }
      id v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      objc_super v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController viewDidLoad]");
      unsigned __int8 v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 411, 0, "invalid nil value for '%{public}s'", "mICC");
    }
    uint64_t v8 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    [v8 viewScale];
    double v10 = v9;

    id v11 = objc_loadWeakRetained((id *)&self->mICC);
    [v3 setController:v11];

    id v12 = objc_loadWeakRetained((id *)&self->mICC);
    v13 = [v12 canvas];
    [v13 setViewScale:v10];

    id v14 = objc_loadWeakRetained((id *)&self->mICC);
    v15 = [v14 canvas];
    +[UIScreen crl_screenScale];
    [v15 i_setContentsScale:];

    [v3 setMultipleTouchEnabled:1];
    [v3 setExclusiveTouch:1];
    [v3 setClearsContextBeforeDrawing:0];
    v16 = [v3 enclosingScrollView];
    v17 = v16;
    if (v16)
    {
      v18 = [v16 delegate];

      if (!v18)
      {
        id v19 = objc_loadWeakRetained((id *)&self->mICC);
        [v17 setDelegate:v19];
      }
      v20 = [(CRLiOSCanvasViewController *)self canvasLayer];
      [v20 fixFrameAndScrollView];

      [v17 setAutoresizesSubviews:0];
      [v17 setDelaysContentTouches:0];
      [v17 setCanCancelContentTouches:1];
    }
    id v21 = objc_loadWeakRetained((id *)&self->mICC);
    [v21 setTextGesturesInFlight:0];

    [(CRLiOSCanvasViewController *)self setUpGestureRecognizers];
    if ([(CRLiOSCanvasViewController *)self canReceiveSystemDrops])
    {
      id v22 = objc_alloc((Class)UIDropInteraction);
      v23 = [(CRLiOSCanvasViewController *)self dropInteractionDelegate];
      id v24 = [v22 initWithDelegate:v23];
      [v3 addInteraction:v24];
    }
    if ([(CRLiOSCanvasViewController *)self canOriginateSystemDrags])
    {
      id v25 = objc_alloc((Class)UIDragInteraction);
      uint64_t v26 = [(CRLiOSCanvasViewController *)self dragInteractionDelegate];
      v27 = (UIDragInteraction *)[v25 initWithDelegate:v26];
      mDragInteraction = self->mDragInteraction;
      self->mDragInteraction = v27;

      v29 = [(CRLiOSCanvasViewController *)self dragInteraction];
      [v3 addInteraction:v29];

      v30 = [(CRLiOSCanvasViewController *)self dragInteraction];
      [v30 setAllowsSimultaneousRecognitionDuringLift:1];

      v31 = [(CRLiOSCanvasViewController *)self dragInteraction];
      LOBYTE(v26) = objc_opt_respondsToSelector();

      if (v26)
      {
        v32 = [(CRLiOSCanvasViewController *)self dragInteraction];
        [v32 _setAdditionalTouchesCancelLift:1];
      }
      v33 = [(CRLiOSCanvasViewController *)self dragInteraction];
      [v33 setEnabled:1];

      v34 = [(CRLiOSCanvasViewController *)self dragInteraction];
      char v35 = objc_opt_respondsToSelector();

      if (v35)
      {
        v36 = [(CRLiOSCanvasViewController *)self dragInteraction];
        [v36 _setAllowsPointerDragBeforeLiftDelay:0];
      }
      [(CRLiOSCanvasViewController *)self p_setDragLiftDelay:0.7];
    }
    id v37 = objc_alloc((Class)UIContextMenuInteraction);
    v38 = [(CRLiOSCanvasViewController *)self contextMenuInteractionDelegate];
    id v39 = [v37 initWithDelegate:v38];

    [v3 addInteraction:v39];
    id v40 = objc_alloc((Class)UIPointerInteraction);
    v41 = [(CRLiOSCanvasViewController *)self pointerInteractionDelegate];
    v42 = (UIPointerInteraction *)[v40 initWithDelegate:v41];
    mPointerInteraction = self->mPointerInteraction;
    self->mPointerInteraction = v42;

    [v3 addInteraction:self->mPointerInteraction];
    id v44 = objc_alloc((Class)UIEditMenuInteraction);
    v45 = [(CRLiOSCanvasViewController *)self contextMenuInteractionDelegate];
    id v46 = [v44 initWithDelegate:v45];

    [v46 setPresentsContextMenuAsSecondaryAction:0];
    [(CRLiOSCanvasViewController *)self setEditMenuInteraction:v46];
    [v3 addInteraction:v46];
    v47 = [CRLCanvasRepEnterExitNotifier alloc];
    id v48 = objc_loadWeakRetained((id *)&self->mICC);
    v49 = [(CRLCanvasRepEnterExitNotifier *)v47 initWithInteractiveCanvasController:v48];
    mEnterExitNotifier = self->mEnterExitNotifier;
    self->mEnterExitNotifier = v49;

    id v51 = objc_loadWeakRetained((id *)&self->mICC);
    [v51 layoutInvalidated];

    if (![(CRLiOSCanvasViewController *)self shouldPreventBecomingFirstResponderOnViewLoad])[(CRLiOSCanvasViewController *)self becomeFirstResponder]; {
  }
    }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E9FF8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010986E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA018);
    }
    v52 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v52);
    }
    v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController viewDidLoad]");
    id v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v39, 406, 0, "invalid nil value for '%{public}s'", "canvasView");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSCanvasViewController;
  [(CRLiOSCanvasViewController *)&v8 viewWillAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  id v5 = [WeakRetained canvas];
  objc_super v6 = [(CRLiOSCanvasViewController *)self traitCollection];
  objc_msgSend(v5, "i_setCanvasIsWideGamut:", objc_msgSend(v6, "displayGamut") == (id)1);

  unsigned __int8 v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"p_handleSqueezePaletteViewWillShowNotification:" name:PKPencilSqueezeInteractionWillShowPaletteViewNotification object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:PKPencilSqueezeInteractionWillShowPaletteViewNotification object:0];

  objc_super v6 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  if ([v6 currentlyScrolling]) {
    [(CRLiOSCanvasViewController *)self forceStopScrolling];
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSCanvasViewController;
  [(CRLiOSCanvasViewController *)&v7 viewWillDisappear:v3];
}

- (void)setView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSCanvasViewController;
  id v4 = a3;
  [(CRLiOSCanvasViewController *)&v8 setView:v4];
  uint64_t v5 = objc_opt_class();
  objc_super v6 = objc_msgSend(v4, "layer", v8.receiver, v8.super_class);

  objc_super v7 = sub_1002469D0(v5, v6);
  objc_storeWeak((id *)&self->mCanvasLayer, v7);
}

- (CRLCanvasLayer)canvasLayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasLayer);

  return (CRLCanvasLayer *)WeakRetained;
}

- (CRLCanvasView)canvasView
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLiOSCanvasViewController *)self view];
  uint64_t v5 = sub_1002469D0(v3, v4);

  return (CRLCanvasView *)v5;
}

- (CALayer)layer
{
  v2 = [(CRLiOSCanvasViewController *)self view];
  uint64_t v3 = [v2 layer];

  return (CALayer *)v3;
}

- (BOOL)isInFocusedContainer
{
  if (![(CRLiOSCanvasViewController *)self isViewLoaded]) {
    return 0;
  }
  uint64_t v3 = [(CRLiOSCanvasViewController *)self view];
  id v4 = [v3 window];
  if ([v4 isKeyWindow])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    objc_super v6 = [WeakRetained textInputResponder];
    unsigned __int8 v7 = [v6 isFirstResponder];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)willUpdateLayerTree
{
  if (+[NSThread isMainThread])
  {
    mPointerInteraction = self->mPointerInteraction;
    [(UIPointerInteraction *)mPointerInteraction invalidate];
  }
}

- (void)addCommonObservers
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"p_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
  [v4 addObserver:self selector:"p_accessibilityInvertColorsDidChange:" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];
  [v4 addObserver:self selector:"p_keyWindowDidChange:" name:UIWindowDidBecomeKeyNotification object:0];
  [v4 addObserver:self selector:"p_keyWindowDidChange:" name:UIWindowDidResignKeyNotification object:0];
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  [v3 addObserver:self forKeyPath:@"CRLSelectAndScrollWithApplePencil" options:0 context:0];
}

- (void)removeCommonObservers
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  id v7 = v3;
  if (self->mSceneWillEnterForegroundObserver)
  {
    [v3 removeObserver];
    mSceneWillEnterForegroundObserver = self->mSceneWillEnterForegroundObserver;
    self->mSceneWillEnterForegroundObserver = 0;

    uint64_t v3 = v7;
  }
  if (self->mSceneDidEnterBackgroundObserver)
  {
    [v7 removeObserver:];
    mSceneDidEnterBackgroundObserver = self->mSceneDidEnterBackgroundObserver;
    self->mSceneDidEnterBackgroundObserver = 0;

    uint64_t v3 = v7;
  }
  [v3 removeObserver:self name:UIApplicationDidBecomeActiveNotification object:0];
  [v7 removeObserver:self name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];
  [v7 removeObserver:self name:UIWindowDidBecomeKeyNotification object:0];
  [v7 removeObserver:self name:UIWindowDidResignKeyNotification object:0];
  objc_super v6 = +[NSUserDefaults standardUserDefaults];
  [v6 removeObserver:self forKeyPath:@"CRLSelectAndScrollWithApplePencil"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[NSUserDefaults standardUserDefaults];
  if (v13 != v11)
  {

LABEL_5:
    v15.receiver = self;
    v15.super_class = (Class)CRLiOSCanvasViewController;
    [(CRLiOSCanvasViewController *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_6;
  }
  unsigned int v14 = [v10 isEqualToString:@"CRLSelectAndScrollWithApplePencil"];

  if (!v14) {
    goto LABEL_5;
  }
  [(CRLiOSCanvasViewController *)self p_pencilShouldSelectAndScrollPreferenceDidChange];
LABEL_6:
}

- (void)p_accessibilityInvertColorsDidChange:(id)a3
{
  id v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  [v3 invalidateAllLayers];
}

- (void)p_willEnterForeground:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v4 = [v3 canvas];
  uint64_t v5 = [v4 topLevelReps];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) recursivelyPerformSelector:"willEnterForeground"];
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)p_didEnterBackground:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v4 = [v3 canvas];
  uint64_t v5 = [v4 topLevelReps];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) recursivelyPerformSelector:"didEnterBackground"];
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)p_applicationDidBecomeActive:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v4 = [v3 canvas];
  uint64_t v5 = [v4 topLevelReps];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) recursivelyPerformSelector:"i_applicationDidBecomeActive"];
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)p_keyWindowDidChange:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = [(CRLiOSCanvasViewController *)self view];
  id v6 = [v5 window];

  if (v4 == v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    uint64_t v8 = [WeakRetained canvas];
    double v9 = [v8 topLevelReps];

    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"layerHostContainerFocusDidChange"];
        }
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (id)hitRepWithTouch:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CRLiOSCanvasViewController *)self canvasView];
    [v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    id v10 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    [v10 convertBoundsToUnscaledPoint:v7, v9];
    double v12 = v11;
    double v14 = v13;

    long long v15 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    long long v16 = [v15 hitRep:v12, v14];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA078);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109880C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA098);
    }
    long long v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController hitRepWithTouch:]");
    id v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 652, 0, "invalid nil value for '%{public}s'", "touch");

    long long v16 = 0;
  }

  return v16;
}

- (id)hitKnobWithTouch:(id)a3 returningRep:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    double v7 = [(CRLiOSCanvasViewController *)self canvasView];
    [v6 locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    double v12 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    [v12 convertBoundsToUnscaledPoint:v9, v11];
    double v14 = v13;
    double v16 = v15;

    BOOL v17 = sub_10036FEA4((BOOL)[v6 type]);
    v18 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    id v19 = [v18 hitKnobAtPoint:v17 inputType:a4 returningRep:v14];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA0B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010988A0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA0D8);
    }
    v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v20);
    }
    id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController hitKnobWithTouch:returningRep:]");
    id v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 666, 0, "invalid nil value for '%{public}s'", "touch");

    id v19 = 0;
    if (a4) {
      *a4 = 0;
    }
  }

  return v19;
}

- (BOOL)canvasSubview:(id)a3 shouldHandleEventAtBoundsPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  unsigned int v9 = [v8 i_isRepContentPlatformView:v7] ^ 1;
  if (v9)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    [v8 convertBoundsToUnscaledPoint:x, y];
    double v11 = v10;
    double v13 = v12;
    double v14 = [v8 hitKnobAtPoint:1 inputType:0 returningRep:];
    if (v14)
    {
      LOBYTE(v15) = 0;
    }
    else
    {
      double v16 = [v8 hitRep:v11, v13];
      BOOL v17 = v16;
      if (v16
        && [v16 directlyManagesContentPlatformView]
        && [v17 wantsContentPlatformViewEventHandling])
      {
        v18 = [v17 contentPlatformView];
        if (v18) {
          unsigned int v15 = [v7 isDescendantOfView:v18] | v9;
        }
        else {
          LOBYTE(v15) = 0;
        }
      }
      else
      {
        LOBYTE(v15) = 0;
      }
    }
  }

  return v15;
}

- (NSArray)commonGestureRecognizers
{
  double v14 = [(CRLiOSCanvasViewController *)self singleTapGestureRecognizer];
  id v3 = [(CRLiOSCanvasViewController *)self doubleTapGestureRecognizer];
  id v4 = [(CRLiOSCanvasViewController *)self editMenuTapGestureRecognizer];
  uint64_t v5 = [(CRLiOSCanvasViewController *)self knobDragGestureRecognizer];
  id v6 = [(CRLiOSCanvasViewController *)self multiSelectGestureRecognizer];
  id v7 = [(CRLiOSCanvasViewController *)self repDragGestureRecognizer];
  double v8 = [(CRLiOSCanvasViewController *)self repRotateGestureRecognizer];
  unsigned int v9 = [(CRLiOSCanvasViewController *)self repRotateKnobGestureRecognizer];
  double v10 = [(CRLiOSCanvasViewController *)self zoomGestureRecognizer];
  double v11 = [(CRLiOSCanvasViewController *)self nudgeGestureRecognizer];
  double v12 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11, 0);

  return (NSArray *)v12;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = (CRLiOSPencilDownGestureRecognizer *)a3;
  id v7 = a4;
  if ([v7 type] == (id)2)
  {
    double v8 = [v7 window];
    [v7 locationInView:v8];
    double v10 = v9;
    double v12 = v11;
    double v13 = [v8 screen];
    [v13 bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    id v22 = [v13 coordinateSpace];
    [v8 convertPoint:v22 toCoordinateSpace:v10, v12];
    double v24 = v23;
    double v26 = v25;

    v58.origin.double x = v15;
    v58.origin.double y = v17;
    v58.size.width = v19;
    v58.size.height = v21;
    if (v26 >= CGRectGetMaxY(v58) + -30.0)
    {
      v59.origin.double x = v15;
      v59.origin.double y = v17;
      v59.size.width = v19;
      v59.size.height = v21;
      if (v24 <= CGRectGetMinX(v59) + 30.0
        || (v60.origin.double x = v15,
            v60.origin.double y = v17,
            v60.size.width = v19,
            v60.size.height = v21,
            v24 >= CGRectGetMaxX(v60) + -30.0))
      {

LABEL_30:
        BOOL v41 = 0;
        goto LABEL_31;
      }
    }
  }
  double v8 = [(CRLiOSCanvasViewController *)self canvasView];
  [v7 locationInView:v8];
  double v28 = v27;
  double v30 = v29;
  v31 = [(CRLiOSCanvasViewController *)self editMenuTapGestureRecognizer];

  if (v31 == v6)
  {
    v32 = +[UIMenuController sharedMenuController];
    if ([v32 isMenuVisible])
    {
      self->mContextMenuMightBeDisplayed = 1;
    }
    else
    {
      v33 = [(CRLiOSCanvasViewController *)self contextMenuInteractionDelegate];
      self->mContextMenuMightBeDisplayed = [v33 currentlyDisplayingMenu];
    }
  }
  if (-[CRLiOSCanvasViewController touchHitsCanvasViewAtPoint:](self, "touchHitsCanvasViewAtPoint:", v28, v30)
    || -[CRLiOSCanvasViewController allowTouchOutsideCanvasViewAtPoint:forGesture:](self, "allowTouchOutsideCanvasViewAtPoint:forGesture:", v6, v28, v30))
  {
    v34 = [(CRLiOSCanvasViewController *)self traitCollection];
    if (objc_msgSend(v34, "crl_isCompactWidth")
      && [(CRLiOSCanvasViewController *)self inInspectorPanZoomMode]
      || [(CRLiOSCanvasViewController *)self inMediaBrowsingMode])
    {

LABEL_19:
      v36 = [(CRLiOSCanvasViewController *)self canvasView];
      id v37 = [v36 gestureRecognizers];
      unsigned int v38 = [v37 containsObject:v6];

      if (v38)
      {
        id v39 = +[NSMutableArray array];
        [(CRLiOSCanvasViewController *)self addInspectorPanZoomModeGRsToArray:v39];
        unsigned __int8 v40 = [v39 containsObject:v6];

        if ((v40 & 1) == 0) {
          goto LABEL_30;
        }
      }
      goto LABEL_26;
    }
    unsigned int v35 = [(CRLiOSCanvasViewController *)self inInspectorTextEditingMode];

    if (v35) {
      goto LABEL_19;
    }
    if (![(CRLiOSCanvasViewController *)self inRestrictedGestureMode]) {
      goto LABEL_26;
    }
  }
  else if (![(CRLiOSCanvasViewController *)self inRestrictedGestureMode])
  {
    goto LABEL_30;
  }
  if (![(CRLiOSCanvasViewController *)self allowGestureInRestrictedGestureMode:v6])goto LABEL_30; {
LABEL_26:
  }
  if (self->mPencilDownGestureRecognizer == v6)
  {
    v42 = [(CRLiOSCanvasViewController *)self delegate];
    char v43 = objc_opt_respondsToSelector();

    if ((v43 & 1) == 0
      || ([(CRLiOSCanvasViewController *)self delegate],
          id v44 = objc_claimAutoreleasedReturnValue(),
          [v44 currentDocumentMode],
          v45 = objc_claimAutoreleasedReturnValue(),
          v44,
          id v46 = [v45 pencilModeType],
          v45,
          !v46))
    {
      p_mICC = &self->mICC;
      id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
      v50 = [(CRLiOSCanvasViewController *)self canvasView];
      [v7 locationInView:v50];
      [WeakRetained convertBoundsToUnscaledPoint:];
      double v52 = v51;
      double v54 = v53;

      id v55 = objc_loadWeakRetained((id *)p_mICC);
      v56 = [v55 freehandDrawingToolkit];
      id v57 = [v56 freehandDrawingBehaviorForTouchType:2 atUnscaledPoint:v52, v54];

      BOOL v41 = v57 == (id)1;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  BOOL v41 = 1;
LABEL_31:

  return v41;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRLiOSCanvasViewController *)self rectangularMarqueeGestureRecognizer];
  if (v8 == v6)
  {
    double v9 = [(CRLiOSCanvasViewController *)self gesturesThatImmediateMarqueeShouldRequireToFail];
    unsigned int v10 = [v9 containsObject:v7];

    if (v10)
    {
      [(CRLiOSRectangularMarqueeGestureRecognizer *)self->mRectangularMarqueeGestureRecognizer minimumPressDuration];
      if (v11 <= 0.02)
      {
        unsigned __int8 v12 = 1;
        goto LABEL_6;
      }
    }
  }
  else
  {
  }
  unsigned __int8 v12 = 0;
LABEL_6:
  unsigned int v13 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:1];
  if ((v12 & 1) == 0 && v13)
  {
    double v14 = [(CRLiOSCanvasViewController *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      double v16 = [(CRLiOSCanvasViewController *)self delegate];
      CGFloat v17 = [v16 currentDocumentMode];

      unsigned __int8 v12 = [v17 gestureRecognizer:v6 shouldRequireFailureOfGestureRecognizer:v7];
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }

  return v12;
}

- (void)setUpGestureRecognizers
{
  v69 = [(CRLiOSCanvasViewController *)self canvasView];
  id v3 = [[CRLiOSTapGestureRecognizer alloc] initWithTarget:self action:"p_handleSingleTapGesture:"];
  [(CRLiOSTapGestureRecognizer *)v3 setDelegate:self];
  [(CRLiOSTapGestureRecognizer *)v3 setName:@"Single Tap"];
  [v69 addGestureRecognizer:v3];
  [(CRLiOSCanvasViewController *)self setSingleTapGestureRecognizer:v3];
  id v4 = [[CRLiOSPencilDownGestureRecognizer alloc] initWithTarget:self action:"p_handlePencilDown:"];
  [(CRLiOSPencilDownGestureRecognizer *)v4 setName:@"CVCPencilDown"];
  [(CRLiOSPencilDownGestureRecognizer *)v4 setDelegate:self];
  [v69 addGestureRecognizer:v4];
  v68 = v4;
  [(CRLiOSCanvasViewController *)self setPencilDownGestureRecognizer:v4];
  uint64_t v5 = [[CRLiOSTapGestureRecognizer alloc] initWithTarget:self action:"handleDoubleTap:"];
  [(CRLiOSTapGestureRecognizer *)v5 setNumberOfTapsRequired:2];
  [(CRLiOSTapGestureRecognizer *)v5 setDelegate:self];
  [(CRLiOSTapGestureRecognizer *)v5 setName:@"Double tap"];
  [v69 addGestureRecognizer:v5];
  v67 = v5;
  [(CRLiOSCanvasViewController *)self setDoubleTapGestureRecognizer:v5];
  id v6 = [[CRLiOSEditMenuTapGestureRecognizer alloc] initWithTarget:self action:"p_handleTapForEditMenu:"];
  [(CRLiOSEditMenuTapGestureRecognizer *)v6 setDelegate:self];
  id v7 = [(CRLiOSCanvasViewController *)self doubleTapGestureRecognizer];
  [(CRLiOSEditMenuTapGestureRecognizer *)v6 requireGestureRecognizerToFail:v7];

  [v69 addGestureRecognizer:v6];
  v66 = v6;
  [(CRLiOSCanvasViewController *)self setEditMenuTapGestureRecognizer:v6];
  id v8 = [CRLiOSKnobDragGestureRecognizer alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  unsigned int v10 = [(CRLiOSKnobDragGestureRecognizer *)v8 initWithInteractiveCanvasController:WeakRetained];

  [(CRLiOSKnobDragGestureRecognizer *)v10 setDelegate:self];
  [v69 addGestureRecognizer:v10];
  v65 = v10;
  [(CRLiOSCanvasViewController *)self setKnobDragGestureRecognizer:v10];
  double v11 = [CRLiOSMultiSelectGestureRecognizer alloc];
  id v12 = objc_loadWeakRetained((id *)&self->mICC);
  unsigned int v13 = [(CRLiOSMultiSelectGestureRecognizer *)v11 initWithInteractiveCanvasController:v12];

  [(CRLiOSMultiSelectGestureRecognizer *)v13 setDelegate:self];
  [v69 addGestureRecognizer:v13];
  v64 = v13;
  [(CRLiOSCanvasViewController *)self setMultiSelectGestureRecognizer:v13];
  double v14 = [CRLiOSRepDragGestureRecognizer alloc];
  id v15 = objc_loadWeakRetained((id *)&self->mICC);
  double v16 = [(CRLiOSRepDragGestureRecognizer *)v14 initWithInteractiveCanvasController:v15];

  [(CRLiOSRepDragGestureRecognizer *)v16 setDelegate:self];
  [v69 addGestureRecognizer:v16];
  v63 = v16;
  [(CRLiOSCanvasViewController *)self setRepDragGestureRecognizer:v16];
  CGFloat v17 = [CRLiOSRepNudgeGestureRecognizer alloc];
  id v18 = objc_loadWeakRetained((id *)&self->mICC);
  CGFloat v19 = [(CRLiOSRepNudgeGestureRecognizer *)v17 initWithInteractiveCanvasController:v18];

  [(CRLiOSRepNudgeGestureRecognizer *)v19 setDelegate:self];
  [(CRLiOSRepNudgeGestureRecognizer *)v19 setAllowedTouchTypes:&off_10155CDA0];
  [v69 addGestureRecognizer:v19];
  v62 = v19;
  [(CRLiOSCanvasViewController *)self setNudgeGestureRecognizer:v19];
  double v20 = [CRLiOSRepRotateGestureRecognizer alloc];
  id v21 = objc_loadWeakRetained((id *)&self->mICC);
  id v22 = [(CRLiOSRepRotateGestureRecognizer *)v20 initWithInteractiveCanvasController:v21];

  [(CRLiOSRepRotateGestureRecognizer *)v22 setDelegate:self];
  [v69 addGestureRecognizer:v22];
  [(CRLiOSRepRotateGestureRecognizer *)v22 setName:@"rotate finger"];
  v61 = v22;
  [(CRLiOSCanvasViewController *)self setRepRotateGestureRecognizer:v22];
  double v23 = [CRLiOSRepRotateKnobGestureRecognizer alloc];
  id v24 = objc_loadWeakRetained((id *)&self->mICC);
  double v25 = [(CRLiOSRepRotateKnobGestureRecognizer *)v23 initWithInteractiveCanvasController:v24];

  [(CRLiOSRepRotateKnobGestureRecognizer *)v25 setDelegate:self];
  [v69 addGestureRecognizer:v25];
  [(CRLiOSRepRotateKnobGestureRecognizer *)v25 setName:@"rotate knob"];
  CGRect v58 = v25;
  [(CRLiOSCanvasViewController *)self setRepRotateKnobGestureRecognizer:v25];
  double v26 = [[CRLiOSAllTouchesDoneGestureRecognizer alloc] initWithTarget:self action:"p_allTouchesDone:"];
  [(CRLiOSAllTouchesDoneGestureRecognizer *)v26 setDelegate:self];
  [v69 addGestureRecognizer:v26];
  CGRect v60 = v26;
  [(CRLiOSCanvasViewController *)self setAllTouchesDoneGestureRecognizer:v26];
  double v27 = [[CRLiOSAllTouchesDoneGestureRecognizer alloc] initWithTarget:self action:"p_allTouchesDone:"];
  [(CRLiOSAllTouchesDoneGestureRecognizer *)v27 setDelegate:self];
  [(CRLiOSAllTouchesDoneGestureRecognizer *)v27 setAllowedTouchTypes:&off_10155CDB8];
  [v69 addGestureRecognizer:v27];
  [(CRLiOSAllTouchesDoneGestureRecognizer *)v27 setName:@"indirect"];
  objc_storeStrong((id *)&self->mAllIndirectPointerTouchesDoneGestureRecognizer, v27);
  double v28 = [[CRLiOSCanvasZoomPinchGestureRecognizer alloc] initWithTarget:self action:"p_zoomWithGesture:"];
  [(CRLiOSCanvasZoomPinchGestureRecognizer *)v28 setDelegate:self];
  [v69 addGestureRecognizer:v28];
  CGRect v59 = v28;
  [(CRLiOSCanvasViewController *)self setZoomGestureRecognizer:v28];
  [(CRLiOSCanvasViewController *)self i_updateZoomGestureRecognizer];
  double v29 = [CRLiOSPreventScrollGestureRecognizer alloc];
  id v30 = objc_loadWeakRetained((id *)&self->mICC);
  v31 = [(CRLiOSPreventScrollGestureRecognizer *)v29 initWithInteractiveCanvasController:v30];

  [(CRLiOSPreventScrollGestureRecognizer *)v31 setDelegate:self];
  [v69 addGestureRecognizer:v31];
  objc_storeStrong((id *)&self->mPreventScrollGestureRecognizer, v31);
  v32 = [CRLiOSFreehandDrawingGestureRecognizer alloc];
  id v33 = objc_loadWeakRetained((id *)&self->mICC);
  v34 = [(CRLiOSFreehandDrawingGestureRecognizer *)v32 initWithInteractiveCanvasController:v33];

  [(CRLiOSFreehandDrawingGestureRecognizer *)v34 setDelegate:self];
  [v69 addGestureRecognizer:v34];
  p_mFreehandDrawingGestureRecognizer = (id *)&self->mFreehandDrawingGestureRecognizer;
  objc_storeStrong((id *)&self->mFreehandDrawingGestureRecognizer, v34);
  id v36 = objc_loadWeakRetained((id *)&self->mDelegate);
  char v37 = objc_opt_respondsToSelector();

  if (v37)
  {
    id v38 = objc_loadWeakRetained((id *)&self->mDelegate);
    id v39 = [v38 pencilKitCanvasViewControllerForCanvasViewController:self];

    unsigned __int8 v40 = [v39 pencilKitCanvasView];
    BOOL v41 = [v40 _hoverGestureRecognizer];

    if (v41)
    {
      v42 = [v40 _hoverGestureRecognizer];
      [v69 addGestureRecognizer:v42];
    }
  }
  id v43 = *p_mFreehandDrawingGestureRecognizer;
  id v44 = [(CRLiOSCanvasViewController *)self knobDragGestureRecognizer];
  [v43 requireGestureRecognizerToFail:v44];

  v45 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v46 = [v45 freehandDrawingToolkit];
  [*p_mFreehandDrawingGestureRecognizer setEnabled:v46 != 0];

  v47 = [CRLiOSRectangularMarqueeGestureRecognizer alloc];
  id v48 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  v49 = [(CRLiOSRectangularMarqueeGestureRecognizer *)v47 initWithInteractiveCanvasController:v48];

  [(CRLiOSRectangularMarqueeGestureRecognizer *)v49 setDelegate:self];
  [v69 addGestureRecognizer:v49];
  [(CRLiOSCanvasViewController *)self setRectangularMarqueeGestureRecognizer:v49];
  id v50 = [objc_alloc((Class)UIHoverGestureRecognizer) initWithTarget:self action:"p_handleHoverGesture:"];
  [v69 addGestureRecognizer:v50];
  double v51 = [_TtC8Freeform31CRLiOSPencilHoverGestureHandler alloc];
  id v52 = objc_loadWeakRetained((id *)&self->mICC);
  double v53 = [(CRLiOSCanvasViewController *)self pencilMediator];
  double v54 = [(CRLiOSPencilHoverGestureHandler *)v51 initWithInteractiveCanvasController:v52 pencilMediator:v53];
  mPencilHoverGestureHandler = self->mPencilHoverGestureHandler;
  self->mPencilHoverGestureHandler = v54;

  v56 = (UIHoverGestureRecognizer *)[objc_alloc((Class)UIHoverGestureRecognizer) initWithTarget:self->mPencilHoverGestureHandler action:"handleHoverGesture:"];
  mPencilHoverGestureRecognizer = self->mPencilHoverGestureRecognizer;
  self->mPencilHoverGestureRecognizer = v56;

  [(UIHoverGestureRecognizer *)self->mPencilHoverGestureRecognizer setAllowedTouchTypes:&off_10155CDD0];
  [v69 addGestureRecognizer:self->mPencilHoverGestureRecognizer];
  [(CRLiOSCanvasViewController *)self p_setUpWPGestureRecognizers];
  [(CRLiOSCanvasViewController *)self setUpCommonGestureAllowedTouchTypes];
}

- (id)gesturesSupportingStylusAndIndirectPointer
{
  id v3 = [(CRLiOSCanvasViewController *)self immediateDoubleTapGestureRecognizer];
  v9[0] = v3;
  id v4 = [(CRLiOSCanvasViewController *)self tapAndTouchGestureRecognizer];
  v9[1] = v4;
  uint64_t v5 = [(CRLiOSCanvasViewController *)self doubleTapAndTouchGestureRecognizer];
  v9[2] = v5;
  id v6 = [(CRLiOSCanvasViewController *)self immediatePressGestureRecognizer];
  v9[3] = v6;
  id v7 = +[NSArray arrayWithObjects:v9 count:4];

  return v7;
}

- (void)modifyGesturesUsedForStylusAndIndirectPointerAddingTouchType:(int64_t)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(CRLiOSCanvasViewController *)self gesturesSupportingStylusAndIndirectPointer];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v10 = [v9 allowedTouchTypes];
        double v11 = +[NSNumber numberWithInteger:a3];
        id v12 = [v10 arrayByAddingObject:v11];
        [v9 setAllowedTouchTypes:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)p_setUpWPGestureRecognizers
{
  id v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v28 = [v3 gestureDispatcher];

  id v4 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  gestureRecognizers = self->_gestureRecognizers;
  self->_gestureRecognizers = v4;

  id v6 = [[CRLWPTapAndTouchGestureRecognizer alloc] initWithGestureDispatcher:v28 gestureKind:@"CRLWPDoubleTapAndTouch"];
  [(CRLWPTapAndTouchGestureRecognizer *)v6 setNumberOfTapsRequired:2];
  uint64_t v7 = [(CRLiOSCanvasViewController *)self viewForGestureRecognizer:v6];
  [v7 addGestureRecognizer:v6];

  [(NSMutableArray *)self->_gestureRecognizers addObject:v6];
  [(CRLiOSCanvasViewController *)self setDoubleTapAndTouchGestureRecognizer:v6];
  id v8 = [[CRLWPTapAndTouchGestureRecognizer alloc] initWithGestureDispatcher:v28 gestureKind:@"CRLWPTapAndTouch"];
  [(CRLWPTapAndTouchGestureRecognizer *)v8 setNumberOfTapsRequired:1];
  double v9 = [(CRLiOSCanvasViewController *)self viewForGestureRecognizer:v8];
  [v9 addGestureRecognizer:v8];

  [(NSMutableArray *)self->_gestureRecognizers addObject:v8];
  [(CRLiOSCanvasViewController *)self setTapAndTouchGestureRecognizer:v8];
  unsigned int v10 = [[CRLWPLongPressGestureRecognizer alloc] initWithGestureDispatcher:v28 gestureKind:@"CRLWPLongPress"];
  [(CRLWPLongPressGestureRecognizer *)v10 setNumberOfTapsRequired:0];
  double v11 = [(CRLiOSCanvasViewController *)self viewForGestureRecognizer:v10];
  [v11 addGestureRecognizer:v10];

  [(NSMutableArray *)self->_gestureRecognizers addObject:v10];
  [(CRLiOSCanvasViewController *)self setLongPressGestureRecognizer:v10];
  [(CRLWPLongPressGestureRecognizer *)v10 setAllowedTouchTypes:&off_10155CDE8];
  id v12 = [[CRLWPImmediatePressGestureRecognizer alloc] initWithGestureDispatcher:v28 gestureKind:@"CRLWPImmediatePress"];
  [(CRLWPImmediatePressGestureRecognizer *)v12 setMaximumNumberOfTouches:1];
  long long v13 = [(CRLiOSCanvasViewController *)self viewForGestureRecognizer:v12];
  [v13 addGestureRecognizer:v12];

  [(NSMutableArray *)self->_gestureRecognizers addObject:v12];
  [(CRLiOSCanvasViewController *)self setImmediatePressGestureRecognizer:v12];
  long long v14 = [(CRLiOSCanvasViewController *)self immediatePressGestureRecognizer];
  [v14 setDisallowOptionKey:1];

  long long v15 = [(CRLiOSCanvasViewController *)self canvasView];
  long long v16 = [(CRLiOSCanvasViewController *)self immediatePressGestureRecognizer];
  [v16 setCanvasView:v15];

  [(CRLWPImmediatePressGestureRecognizer *)v12 setAllowedTouchTypes:&off_10155CE00];
  CGFloat v17 = [[CRLWPTapGestureRecognizer alloc] initWithGestureDispatcher:v28 gestureKind:@"CRLWPImmediateDoubleTap"];
  [(CRLWPTapGestureRecognizer *)v17 setNumberOfTapsRequired:2];
  id v18 = [(CRLiOSCanvasViewController *)self viewForGestureRecognizer:v17];
  [v18 addGestureRecognizer:v17];

  [(NSMutableArray *)self->_gestureRecognizers addObject:v17];
  [(CRLiOSCanvasViewController *)self setImmediateDoubleTapGestureRecognizer:v17];
  CGFloat v19 = [[CRLWPTapGestureRecognizer alloc] initWithGestureDispatcher:v28 gestureKind:@"CRLWPSecondarySingleTap"];
  secondarySingleTapGestureRecognizer = self->_secondarySingleTapGestureRecognizer;
  self->_secondarySingleTapGestureRecognizer = v19;

  [(CRLWPTapGestureRecognizer *)self->_secondarySingleTapGestureRecognizer setEnabled:0];
  id v21 = [(CRLiOSCanvasViewController *)self viewForGestureRecognizer:self->_secondarySingleTapGestureRecognizer];
  [v21 addGestureRecognizer:self->_secondarySingleTapGestureRecognizer];

  [(NSMutableArray *)self->_gestureRecognizers addObject:self->_secondarySingleTapGestureRecognizer];
  id v22 = [[CRLWPTapGestureRecognizer alloc] initWithGestureDispatcher:v28 gestureKind:@"CRLWPImmediateSingleTap"];
  double v23 = [(CRLiOSCanvasViewController *)self viewForGestureRecognizer:v22];
  [v23 addGestureRecognizer:v22];

  [(NSMutableArray *)self->_gestureRecognizers addObject:v22];
  [(CRLiOSCanvasViewController *)self setImmediateSingleTapGestureRecognizer:v22];
  [(CRLiOSCanvasViewController *)self modifyGesturesUsedForStylusAndIndirectPointerAddingTouchType:3];
  [(CRLiOSCanvasViewController *)self modifyGesturesUsedForStylusAndIndirectPointerAddingTouchType:2];
  id v24 = [(CRLiOSCanvasViewController *)self delegate];
  char v25 = objc_opt_respondsToSelector();

  double v26 = 0;
  if (v25)
  {
    double v27 = [(CRLiOSCanvasViewController *)self delegate];
    double v26 = [v27 scribbleInteractionObserverForCanvasViewController:self];
  }
  +[CRLiOSScribbleInteractionSetupHelper setupScribbleEditingProvider:self scribbleObserver:v26 scribbleActive:1];
  [v28 prioritizeRecognizer:v8 overRecognizer:v22];
  [v28 allowSimultaneousRecognitionByRecognizers:v22, self->_secondarySingleTapGestureRecognizer];
  [v28 allowSimultaneousRecognitionByRecognizers:self->_secondarySingleTapGestureRecognizer, v10, 0];
  [v28 allowSimultaneousRecognitionByRecognizers:v8, v12];
  [v28 allowSimultaneousRecognitionByRecognizers:v22, v8];
  [v28 allowSimultaneousRecognitionByRecognizers:v6, v17];
  [v28 allowSimultaneousRecognitionByRecognizers:v6, v8];
}

- (BOOL)touchHitsCanvasViewAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(CRLiOSCanvasViewController *)self canvasView];
  id v6 = [v5 hitTest:0 withEvent:x, y];
  BOOL v7 = v6 == v5;

  return v7;
}

- (NSArray)passthroughViewsToAllowCanvasInteractionDuringPopoverPresentation
{
  id v3 = +[NSMutableArray array];
  id v4 = [(CRLiOSCanvasViewController *)self canvasView];
  [v3 crl_addNonNilObject:v4];

  id v5 = [(CRLiOSCanvasViewController *)self i_quickSelectViewController];
  id v6 = [v5 view];
  [v3 crl_addNonNilObject:v6];

  return (NSArray *)v3;
}

- (BOOL)i_allowCanvasInteraction:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if ([(CRLiOSCanvasViewController *)self touchHitsCanvasViewAtPoint:a3]) {
    return 1;
  }
  id v8 = [(CRLiOSCanvasViewController *)self canvasView];
  double v9 = [v8 hitTest:0 withEvent:x, y];
  unsigned int v10 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  unsigned __int8 v11 = [v10 i_isRepContentPlatformView:v9];

  return v11;
}

- (void)p_handleHoverGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSCanvasViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || ([(CRLiOSCanvasViewController *)self delegate],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        [v7 currentDocumentMode],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        id v9 = [v8 pencilModeType],
        v8,
        v9 != (id)1))
  {
    unsigned int v10 = [(CRLiOSCanvasViewController *)self canvasView];
    [v4 locationInView:v10];
    double v12 = v11;
    double v14 = v13;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    [WeakRetained convertBoundsToUnscaledPoint:v12, v14];
    double v17 = v16;
    double v19 = v18;

    if (-[CRLiOSCanvasViewController touchHitsCanvasViewAtPoint:](self, "touchHitsCanvasViewAtPoint:", v12, v14)) {
      unsigned int v20 = 1;
    }
    else {
      unsigned int v20 = -[CRLiOSCanvasViewController allowTouchOutsideCanvasViewAtPoint:forGesture:](self, "allowTouchOutsideCanvasViewAtPoint:forGesture:", v4, v12, v14);
    }
    id v21 = +[CRLCanvasEnterExitPlatformObject platformObjectWithGesture:v4];
    if (v20)
    {
      switch((unint64_t)[v4 state])
      {
        case 0uLL:
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EA0F8);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_101098934();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EA118);
          }
          id v22 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v22);
          }
          double v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController p_handleHoverGesture:]");
          id v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
          +[CRLAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:1133 isFatal:0 description:"Something has gone wrong."];

          break;
        case 1uLL:
          -[CRLCanvasRepEnterExitNotifier cursorEnteredAtPoint:withPlatformObject:](self->mEnterExitNotifier, "cursorEnteredAtPoint:withPlatformObject:", v21, v17, v19);
          break;
        case 2uLL:
          -[CRLCanvasRepEnterExitNotifier updateEnteredExitedRepStateAtPoint:withPlatformObject:](self->mEnterExitNotifier, "updateEnteredExitedRepStateAtPoint:withPlatformObject:", v21, v17, v19);
          break;
        case 3uLL:
        case 4uLL:
        case 5uLL:
          goto LABEL_8;
        default:
          break;
      }
    }
    else
    {
LABEL_8:
      -[CRLCanvasRepEnterExitNotifier cursorExitedAtPoint:withPlatformObject:](self->mEnterExitNotifier, "cursorExitedAtPoint:withPlatformObject:", v21, v17, v19);
    }
  }
}

- (_TtC8Freeform31CRLiOSPencilHoverGestureHandler)pencilHoverGestureHandler
{
  return self->mPencilHoverGestureHandler;
}

- (NSArray)gesturesToAdjustIfStylusShouldSelectAndScroll
{
  id v3 = +[NSMutableArray array];
  id v4 = [(CRLiOSCanvasViewController *)self repDragGestureRecognizer];
  [v3 crl_addNonNilObject:v4];

  id v5 = [(CRLiOSCanvasViewController *)self singleTapGestureRecognizer];
  [v3 crl_addNonNilObject:v5];

  char v6 = [(CRLiOSCanvasViewController *)self doubleTapGestureRecognizer];
  [v3 crl_addNonNilObject:v6];

  BOOL v7 = [(CRLiOSCanvasViewController *)self rectangularMarqueeGestureRecognizer];
  [v3 crl_addNonNilObject:v7];

  return (NSArray *)v3;
}

- (BOOL)disallowRectangularMarqueeOperationAtUnscaledPoint:(CGPoint)a3
{
  id v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  if ([v3 currentlyScrolling])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [v3 dynamicOperationController];
    unsigned __int8 v4 = [v5 isInOperation];
  }
  return v4;
}

- (id)gesturesThatImmediateMarqueeShouldRequireToFail
{
  id v3 = [(CRLiOSCanvasViewController *)self singleTapGestureRecognizer];
  unsigned __int8 v4 = [(CRLiOSCanvasViewController *)self editMenuTapGestureRecognizer];
  id v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, 0);

  return v5;
}

- (void)setUpCommonGestureAllowedTouchTypes
{
  if ([(CRLiOSCanvasViewController *)self shouldSelectAndScrollWithApplePencil]) {
    id v3 = &off_10155CE18;
  }
  else {
    id v3 = &off_10155CE30;
  }
  unsigned __int8 v4 = [(CRLiOSCanvasViewController *)self gesturesToAdjustIfStylusShouldSelectAndScroll];
  id v5 = [(CRLiOSCanvasViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    BOOL v7 = [(CRLiOSCanvasViewController *)self delegate];
    id v8 = [v7 currentDocumentMode];

    uint64_t v9 = [v8 gesturesToAdjustIfPencilShouldSelectAndScrollFromGestures:v4];

    unsigned __int8 v4 = (void *)v9;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      double v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) setAllowedTouchTypes:v3 v15];
        double v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)resetGesturesForContextSwitch
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(CRLiOSCanvasViewController *)self view];
  unsigned __int8 v4 = [v3 gestureRecognizers];

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 isEnabled])
        {
          id v10 = [v9 delegate];

          if (v10 == self)
          {
            [v9 setEnabled:0];
            [v9 setEnabled:1];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v11 = [(CRLiOSCanvasViewController *)self editMenuTapGestureRecognizer];
  unsigned int v12 = [v11 isEnabled];

  if (v12)
  {
    uint64_t v13 = [(CRLiOSCanvasViewController *)self editMenuTapGestureRecognizer];
    [v13 setIgnoreTargetAction:1];
  }
}

- (void)i_updateZoomGestureRecognizer
{
  id v5 = [(CRLiOSCanvasViewController *)self canvasLayer];
  id v3 = [v5 allowsPinchZoom];
  unsigned __int8 v4 = [(CRLiOSCanvasViewController *)self zoomGestureRecognizer];
  [v4 setEnabled:v3];
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  self->mLastTapPoint.double x = x;
  self->mLastTapPoint.double y = y;
  id v8 = [(CRLiOSCanvasViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CRLiOSCanvasViewController *)self delegate];
    id v11 = [v10 currentDocumentMode];

    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA138);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010989BC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA158);
      }
      unsigned int v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      uint64_t v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController handleSingleTapAtPoint:withRecognizer:]");
      long long v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 1232, 0, "invalid nil value for '%{public}s'", "currentMode");
    }
    unsigned __int8 v15 = [v11 handleSingleTapAtPoint:[v7 touchTypeForTap] touchType:x, y];

    if (v15)
    {
      unsigned __int8 v16 = 1;
      goto LABEL_32;
    }
  }
  if ([(CRLiOSCanvasViewController *)self inMediaBrowsingMode])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0) {
      goto LABEL_23;
    }
    id v19 = objc_loadWeakRetained((id *)&self->mDelegate);
    [v19 handleMediaBrowsingModeTap];
  }
  else
  {
    if (![(CRLiOSCanvasViewController *)self inInspectorPanZoomMode]
      && ![(CRLiOSCanvasViewController *)self inInspectorTextEditingMode])
    {
      goto LABEL_23;
    }
    id v20 = objc_loadWeakRetained((id *)&self->mDelegate);
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = objc_loadWeakRetained((id *)&self->mDelegate);
      [v22 handleInspectorPanZoomModeTap];
    }
    id v19 = objc_loadWeakRetained((id *)&self->mICC);
    [v19 resumeEditing];
  }

LABEL_23:
  BOOL v23 = sub_10036FEA4((BOOL)[v7 touchTypeForTap]);
  p_mICC = &self->mICC;
  id v25 = objc_loadWeakRetained((id *)&self->mICC);
  id v35 = 0;
  double v26 = [v25 hitKnobAtPoint:v23 inputType:&v35 returningRep:x, y];
  id v27 = v35;

  if (v26 && (objc_msgSend(v27, "handleSingleTapAtPoint:onKnob:inputType:", v26, v23, x, y) & 1) != 0)
  {
    unsigned __int8 v16 = 1;
  }
  else
  {
    id v28 = objc_loadWeakRetained((id *)&self->mICC);
    double v29 = [v28 hitRep:x, y];

    id v30 = [v29 repForSelecting];
    if (v30 || (objc_msgSend(v29, "shouldIgnoreSingleTapAtPoint:withRecognizer:", v7, x, y) & 1) == 0)
    {
      BOOL v31 = ((unint64_t)[v7 modifierFlags] & 0x120000) != 0;
      uint64_t v32 = [(CRLiOSCanvasViewController *)self isCurrentlyInQuickSelectMode] ^ v31;
      id v33 = objc_loadWeakRetained((id *)p_mICC);
      unsigned __int8 v16 = [v33 handleSingleTapAtPoint:v32 extendingSelection:x inputType:y];
    }
    else
    {
      unsigned __int8 v16 = 1;
    }
  }
LABEL_32:

  return v16;
}

- (void)handleDoubleTap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  sub_1002469D0(v5, v4);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    [v12 firstTapLocation];
    [WeakRetained convertBoundsToUnscaledPoint:];
    double v8 = v7;
    double v10 = v9;

    if (!-[CRLiOSCanvasViewController handleDoubleTapAtPoint:withRecognizer:](self, "handleDoubleTapAtPoint:withRecognizer:", v12, v8, v10))
    {
      id v11 = objc_loadWeakRetained((id *)&self->mICC);
      [v11 handleDoubleTapAtPoint:sub_10036FEA4([v12 touchTypeForTap]) inputType:v8, v10];
    }
  }
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  double v9 = sub_1002469D0(v8, v7);
  BOOL v10 = sub_10036FEA4((BOOL)[v9 touchTypeForTap]);

  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  id v45 = 0;
  id v12 = [WeakRetained hitKnobAtPoint:v10 inputType:&v45 returningRep:x, y];
  id v13 = v45;

  if (v12)
  {
    unsigned __int8 v14 = [v13 handleDoubleTapAtPoint:v12 onKnob:v10 inputType:x, y];
    if (!+[CRLFeatureFlagsHelper isOSFeatureEnabled:1])
    {
LABEL_15:
      if (v14) {
        goto LABEL_16;
      }
      goto LABEL_8;
    }
  }
  else
  {
    if (!+[CRLFeatureFlagsHelper isOSFeatureEnabled:1]) {
      goto LABEL_8;
    }
    unsigned __int8 v14 = 0;
  }
  unsigned __int8 v15 = [(CRLiOSCanvasViewController *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0) {
    goto LABEL_15;
  }
  long long v17 = [(CRLiOSCanvasViewController *)self delegate];
  char v18 = [v17 currentDocumentMode];

  uint64_t v19 = objc_opt_class();
  id v20 = sub_1002469D0(v19, v7);
  id v21 = [v20 touchTypeForTap];

  char v22 = [v18 shouldHandleDoubleTapAtPoint:v21 touchType:x, y] | v14;
  if (v22)
  {
LABEL_16:
    BOOL v41 = 1;
    goto LABEL_17;
  }
LABEL_8:
  id v23 = objc_loadWeakRetained((id *)&self->mICC);
  id v24 = [v23 hitRep:x, y];
  id v25 = [v24 repForSelecting];

  if (v25)
  {
    double v26 = [v25 info];

    if (v26)
    {
      id v43 = v7;
      id v44 = v13;
      id v27 = objc_loadWeakRetained((id *)&self->mICC);
      id v28 = [v27 selectionModelTranslator];
      id v29 = objc_loadWeakRetained((id *)&self->mICC);
      id v30 = [v29 editorController];
      BOOL v31 = [v30 selectionPath];
      uint64_t v32 = [v28 boardItemsForSelectionPath:v31];

      id v33 = objc_loadWeakRetained((id *)&self->mICC);
      v34 = [v33 canvasEditor];

      if ([v32 count] != (id)1
        || ([v25 info],
            id v35 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v36 = [v32 containsObject:v35],
            v35,
            (v36 & 1) == 0))
      {
        char v37 = [v25 info];
        id v38 = [v34 selectionPathWithInfo:v37];
        id v39 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
        unsigned __int8 v40 = [v39 editorController];
        [v40 setSelectionPath:v38];
      }
      id v7 = v43;
      id v13 = v44;
    }
  }

  BOOL v41 = 0;
LABEL_17:

  return v41;
}

- (void)p_handleTapForEditMenu:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v35 = sub_1002469D0(v5, v4);

  id v6 = v35;
  if (v35)
  {
    unsigned __int8 v7 = [v35 ignoreTargetAction];
    id v6 = v35;
    if ((v7 & 1) == 0)
    {
      uint64_t v8 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
      if (![v8 shouldAllowKeyCommands]) {
        goto LABEL_25;
      }
      unsigned __int8 v9 = [(CRLiOSCanvasViewController *)self isCurrentlyInQuickSelectMode];

      id v6 = v35;
      if (v9) {
        goto LABEL_26;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
      id v11 = [(CRLiOSCanvasViewController *)self canvasView];
      [v35 locationInView:v11];
      [WeakRetained convertBoundsToUnscaledPoint:];
      double v13 = v12;
      double v15 = v14;

      char v16 = [v35 touchedRep];
      uint64_t v8 = v16;
      if (!v16) {
        goto LABEL_25;
      }
      if ([v16 hasBeenRemoved]) {
        goto LABEL_25;
      }
      long long v17 = [v8 repForSelecting];

      if (v17 != v8) {
        goto LABEL_25;
      }
      if (([v8 isSelectedIgnoringLocking] & 1) == 0
        && [(CRLiOSCanvasViewController *)self shouldSelectAndShowEditMenuOnFirstTapForRep:v8])
      {
        id v18 = objc_loadWeakRetained((id *)&self->mICC);
        [v18 endEditing];

        id v19 = objc_loadWeakRetained((id *)&self->mICC);
        id v20 = [v19 canvasEditor];

        id v21 = [v8 info];
        char v22 = [v20 selectionPathWithInfo:v21];
        id v23 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
        id v24 = [v23 editorController];
        [v24 setSelectionPath:v22];
      }
      self->mLastTapPoint = CGPointZero;
      if (![v8 isSelectedIgnoringLocking]
        || (objc_msgSend(v8, "shouldIgnoreEditMenuTapAtPoint:withRecognizer:", v35, v13, v15) & 1) != 0)
      {
        goto LABEL_25;
      }
      if (objc_msgSend(v8, "wantsToManuallyHandleEditMenuTapAtPoint:", v13, v15))
      {
        [v8 handleEditMenuTapAtPoint:sub_10036FEA4([v35 touchTypeForTap]) inputType:v13, v15];
      }
      else
      {
        if (!self->mContextMenuMightBeDisplayed)
        {
          id v25 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
          double v26 = [v25 editorController];
          id v27 = [v26 selectionPath];
          unsigned int v28 = [(CRLiOSCanvasViewController *)self p_shouldShowMiniFormatterForSelectionPath:v27];

          if (v28)
          {
            if ([v8 manuallyControlsMiniFormatter]) {
              goto LABEL_25;
            }
            if (UIAccessibilityIsVoiceOverRunning() && [v8 isSelected])
            {
              [v8 accessibilityActivationPoint];
              [v8 handleDoubleTapAtPoint:1];
              goto LABEL_25;
            }
            id v29 = [(CRLiOSCanvasViewController *)self miniFormatterPresenter];
            uint64_t v32 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
            id v33 = [v32 editorController];
            v34 = [v33 selectionPath];
            [v29 handleSingleTapOnRep:v8 withSelectionPath:v34];
          }
          else
          {
            id v29 = objc_loadWeakRetained((id *)&self->mICC);
            id v30 = [v29 editorController];
            BOOL v31 = [v30 selectionPath];
            [(CRLiOSCanvasViewController *)self showEditUIForSelectionPath:v31];
          }
          goto LABEL_25;
        }
        [(CRLiOSCanvasViewController *)self hideEditMenu];
      }
LABEL_25:

      id v6 = v35;
    }
  }
LABEL_26:
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = (CRLiOSRepNudgeGestureRecognizer *)a3;
  unsigned __int8 v7 = (CRLiOSEditMenuTapGestureRecognizer *)a4;
  uint64_t v8 = (CRLiOSRepNudgeGestureRecognizer *)v7;
  mSingleTapGestureRecognizer = self->mSingleTapGestureRecognizer;
  mEditMenuTapGestureRecognizer = self->mEditMenuTapGestureRecognizer;
  if (mSingleTapGestureRecognizer == (UITapGestureRecognizer *)v6 && mEditMenuTapGestureRecognizer == v7) {
    goto LABEL_33;
  }
  if (mSingleTapGestureRecognizer == (UITapGestureRecognizer *)v7
    && mEditMenuTapGestureRecognizer == (CRLiOSEditMenuTapGestureRecognizer *)v6)
  {
    goto LABEL_33;
  }
  mRepDragGestureRecognizer = self->mRepDragGestureRecognizer;
  if ((mRepDragGestureRecognizer == (CRLiOSRepDragGestureRecognizer *)v6
     || self->mNudgeGestureRecognizer == v6
     || (CRLiOSRepNudgeGestureRecognizer *)self->mMultiSelectGestureRecognizer == v6)
    && (mRepDragGestureRecognizer == (CRLiOSRepDragGestureRecognizer *)v8
     || self->mNudgeGestureRecognizer == v8
     || (CRLiOSRepNudgeGestureRecognizer *)self->mMultiSelectGestureRecognizer == v8))
  {
    goto LABEL_33;
  }
  BOOL v14 = mRepDragGestureRecognizer == (CRLiOSRepDragGestureRecognizer *)v6
     || mRepDragGestureRecognizer == (CRLiOSRepDragGestureRecognizer *)v8;
  if (!v14
    || [(CRLiOSRepDragGestureRecognizer *)mRepDragGestureRecognizer state] != (id)3
    || (double v15 = self->mEditMenuTapGestureRecognizer, v16 = 1, v15 != (CRLiOSEditMenuTapGestureRecognizer *)v6)
    && v15 != (CRLiOSEditMenuTapGestureRecognizer *)v8
    && (long long v17 = self->mSingleTapGestureRecognizer, v17 != (UITapGestureRecognizer *)v6)
    && v17 != (UITapGestureRecognizer *)v8)
  {
    id v18 = [(CRLiOSCanvasViewController *)self preventScrollGestureRecognizer];
    if (v18 != v6)
    {
      id v19 = [(CRLiOSCanvasViewController *)self preventScrollGestureRecognizer];
      if (v19 != v8)
      {

LABEL_36:
        if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:1]&& ([(CRLiOSCanvasViewController *)self delegate], unsigned int v28 = objc_claimAutoreleasedReturnValue(), v29 = objc_opt_respondsToSelector(), v28, (v29 & 1) != 0))
        {
          id v30 = [(CRLiOSCanvasViewController *)self delegate];
          BOOL v31 = [v30 currentDocumentMode];

          unsigned __int8 v16 = [v31 gestureRecognizer:v6 shouldRecognizeSimultaneouslyWithGestureRecognizer:v8];
        }
        else
        {
          unsigned __int8 v16 = 0;
        }
        goto LABEL_34;
      }
    }
    id v20 = [(CRLiOSCanvasViewController *)self canvasView];
    id v21 = [v20 enclosingScrollView];
    char v22 = [v21 panGestureRecognizer];
    if (v22 == v6)
    {
      BOOL v26 = 0;
    }
    else
    {
      id v23 = [(CRLiOSCanvasViewController *)self canvasView];
      id v24 = [v23 enclosingScrollView];
      id v25 = [v24 panGestureRecognizer];
      BOOL v26 = v25 != v8;
    }
    if (v18 == v6)
    {

      if (!v26) {
        goto LABEL_36;
      }
    }
    else
    {

      if (!v26) {
        goto LABEL_36;
      }
    }
LABEL_33:
    unsigned __int8 v16 = 1;
  }
LABEL_34:

  return v16;
}

- (BOOL)shouldSelectAndShowEditMenuOnFirstTapForRep:(id)a3
{
  return 1;
}

- (id)appSpecificGestureRecognizersAllowedDuringFreehandDrawing
{
  return +[NSSet set];
}

- (BOOL)shouldIgnoreTextGesture:(id)a3 atPoint:(CGPoint)a4
{
  uint64_t v5 = [(CRLiOSCanvasViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    unsigned __int8 v7 = [(CRLiOSCanvasViewController *)self delegate];
    uint64_t v8 = [v7 currentDocumentMode];

    unsigned __int8 v9 = [v8 shouldAllowTextGesturesInRestrictedGestureMode];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }
  if ([(CRLiOSCanvasViewController *)self inInspectorPanZoomMode])
  {
    unsigned __int8 v10 = 1;
    if (v9) {
      goto LABEL_10;
    }
  }
  else
  {
    unsigned __int8 v10 = [(CRLiOSCanvasViewController *)self inInspectorTextEditingMode];
    if (v9) {
      goto LABEL_10;
    }
  }
  if ([(CRLiOSCanvasViewController *)self inRestrictedGestureMode])
  {
    id v11 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    unsigned int v12 = [v11 editingDisabled] ^ 1;

    goto LABEL_11;
  }
LABEL_10:
  LOBYTE(v12) = 0;
LABEL_11:
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (WeakRetained)
  {
    id v15 = objc_loadWeakRetained((id *)p_mDelegate);
    if (objc_opt_respondsToSelector())
    {
      id v16 = objc_loadWeakRetained((id *)p_mDelegate);
      unsigned __int8 v17 = [v16 shouldIgnoreTextGestures];
    }
    else
    {
      unsigned __int8 v17 = 0;
    }
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v10 | v12 | v17;
}

- (BOOL)i_isCurrentlyTrackingTouch
{
  return self->mIsCurrentlyTrackingTouch;
}

- (void)p_allTouchesDone:(id)a3
{
  id v4 = [(CRLiOSCanvasViewController *)self view];
  uint64_t v5 = [v4 window];
  [v5 makeKeyWindow];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"CRLInteractiveCanvasControllerAllTouchesInGestureFinished" object:self];
}

- (id)p_reasonStringForIgnoringKeyboardInputWithAllTouchesDoneGestureRecognizer:(id)a3
{
  id v3 = [a3 name];
  id v4 = +[NSString stringWithFormat:@"All Touches Gestures In Flight (%@)", v3];

  return v4;
}

- (void)didStartCountingTouches:(id)a3 touchType:(int64_t)a4 atSomeTouchPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  unsigned __int8 v9 = (CRLiOSAllTouchesDoneGestureRecognizer *)a3;
  if (+[CRLFeatureFlagGroup isEasierConnectionLinesEnabled])
  {
    unsigned __int8 v10 = [(CRLiOSCanvasViewController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      unsigned int v12 = [(CRLiOSCanvasViewController *)self delegate];
      [v12 userDidInteractWithCanvas:self];
    }
  }
  -[CRLiOSCanvasViewController p_shouldIgnoreKeyboardInputForTouchType:atSomeTouchPoint:](self, "p_shouldIgnoreKeyboardInputForTouchType:atSomeTouchPoint:", a4, x, y);
  double v13 = [(CRLiOSCanvasViewController *)self editingCoordinator];
  [v13 suspendCollaborationWithReason:@"CRLCanvasTouches"];

  if (self->mAllIndirectPointerTouchesDoneGestureRecognizer == v9)
  {
    if ([(CRLiOSCanvasViewController *)self currentlyTrackingIndirectPointerTouch])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA178);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101098A50();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA198);
      }
      unsigned __int8 v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v17);
      }
      id v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController didStartCountingTouches:touchType:atSomeTouchPoint:]");
      id v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:1458 isFatal:0 description:"Should not be told twice about indirect touches!"];
    }
    [(CRLiOSCanvasViewController *)self setCurrentlyTrackingIndirectPointerTouch:1];
  }
  else if (self->mAllTouchesDoneGestureRecognizer == v9)
  {
    if (self->mIsCurrentlyTrackingTouch)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA1B8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101098AD8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA1D8);
      }
      BOOL v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController didStartCountingTouches:touchType:atSomeTouchPoint:]");
      id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:1461 isFatal:0 description:"Should not be told twice about touches!"];
    }
    self->mIsCurrentlyTrackingTouch = 1;
  }
  [(CRLiOSPencilHoverGestureHandler *)self->mPencilHoverGestureHandler removeHoverEffect];
}

- (BOOL)p_shouldIgnoreKeyboardInputForTouchType:(int64_t)a3 atSomeTouchPoint:(CGPoint)a4
{
  if (a3 == 2)
  {
    double y = a4.y;
    double x = a4.x;
    unsigned __int8 v7 = [(CRLiOSCanvasViewController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      unsigned __int8 v9 = [(CRLiOSCanvasViewController *)self delegate];
      unsigned __int8 v10 = [v9 currentDocumentMode];

      if (!v10)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EA1F8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101098B60();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EA218);
        }
        char v11 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v11);
        }
        unsigned int v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController p_shouldIgnoreKeyboardInputForTouchType:atSomeTouchPoint:]");
        double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1476, 0, "invalid nil value for '%{public}s'", "currentMode");
      }
      id v14 = [v10 pencilModeType];
      if (v14 == (id)2)
      {
        BOOL v15 = 0;
        goto LABEL_18;
      }
      if (v14 == (id)1)
      {
        BOOL v15 = 1;
LABEL_18:

        return v15;
      }
    }
    id v16 = [(CRLiOSCanvasViewController *)self pencilMediator];
    id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    [WeakRetained convertBoundsToUnscaledPoint:x, y];
    id v18 = [v16 pencilBehaviorOutsideModesAtUnscaledPoint:];

    return v18 != (id)2;
  }
  return 1;
}

- (void)didStopCountingTouches:(id)a3
{
  id v4 = (CRLiOSAllTouchesDoneGestureRecognizer *)a3;
  uint64_t v5 = [(CRLiOSCanvasViewController *)self editingCoordinator];
  [v5 resumeCollaborationWithReason:@"CRLCanvasTouches"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  unsigned __int8 v7 = [WeakRetained textInputResponder];
  [v7 becomeFirstResponder];

  if (self->mAllIndirectPointerTouchesDoneGestureRecognizer == v4)
  {
    if (![(CRLiOSCanvasViewController *)self currentlyTrackingIndirectPointerTouch])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA238);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101098BF4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA258);
      }
      char v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v11);
      }
      unsigned int v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController didStopCountingTouches:]");
      double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:1500 isFatal:0 description:"Should not be told twice about indirect touches!"];
    }
    [(CRLiOSCanvasViewController *)self setCurrentlyTrackingIndirectPointerTouch:0];
  }
  else if (self->mAllTouchesDoneGestureRecognizer == v4)
  {
    if (!self->mIsCurrentlyTrackingTouch)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA278);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101098C7C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA298);
      }
      char v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v8);
      }
      unsigned __int8 v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController didStopCountingTouches:]");
      unsigned __int8 v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:1503 isFatal:0 description:"Should not be told twice about touches!"];
    }
    self->mIsCurrentlyTrackingTouch = 0;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CRLiOSCanvasViewController;
  -[CRLiOSCanvasViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  if (v7) {
    [v7 targetTransform];
  }
  else {
    memset(v14, 0, sizeof(v14));
  }
  char v8 = [(CRLiOSCanvasViewController *)self view];
  [v8 bounds];
  BOOL v11 = sub_10007FFF0((uint64_t)v14, v9, v10);

  if (v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002C63F0;
    v13[3] = &unk_1014EA2C0;
    v13[4] = self;
    v13[5] = v15;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002C65CC;
    v12[3] = &unk_1014EA2E8;
    v12[4] = self;
    v12[5] = v15;
    [v7 animateAlongsideTransition:v13 completion:v12];
  }
  _Block_object_dispose(v15, 8);
}

- (BOOL)allowTouchOutsideCanvasViewAtPoint:(CGPoint)a3 forGesture:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = (CRLiOSAllTouchesDoneGestureRecognizer *)a4;
  char v8 = v7;
  mAllIndirectPointerTouchesDoneGestureRecognizer = self->mAllIndirectPointerTouchesDoneGestureRecognizer;
  unsigned __int8 v10 = mAllIndirectPointerTouchesDoneGestureRecognizer == v7;
  if (v7 && mAllIndirectPointerTouchesDoneGestureRecognizer != v7)
  {
    p_mDelegate = &self->mDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)p_mDelegate);
      unsigned __int8 v10 = [v14 allowTouchOutsideCanvasViewAtPoint:v8 forGesture:x, y];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (id)viewForGestureRecognizer:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->mDelegate);
    char v8 = [v7 viewForGestureRecognizer:v4];
  }
  else
  {
    char v8 = [(CRLiOSCanvasViewController *)self canvasView];
  }

  return v8;
}

- (BOOL)canOriginateSystemDrags
{
  return 1;
}

- (BOOL)canReceiveSystemDrops
{
  return 1;
}

- (CRLiOSCanvasDropInteractionDelegate)dropInteractionDelegate
{
  mDropInteractionDelegate = self->mDropInteractionDelegate;
  if (!mDropInteractionDelegate)
  {
    id v4 = [CRLiOSCanvasDropInteractionDelegate alloc];
    uint64_t v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    char v6 = [(CRLiOSCanvasDropInteractionDelegate *)v4 initWithICC:v5];
    id v7 = self->mDropInteractionDelegate;
    self->mDropInteractionDelegate = v6;

    mDropInteractionDelegate = self->mDropInteractionDelegate;
  }

  return mDropInteractionDelegate;
}

- (CRLiOSCanvasDragInteractionDelegate)dragInteractionDelegate
{
  mDragInteractionDelegate = self->mDragInteractionDelegate;
  if (!mDragInteractionDelegate)
  {
    id v4 = [CRLiOSCanvasDragInteractionDelegate alloc];
    uint64_t v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    char v6 = [(CRLiOSCanvasDragInteractionDelegate *)v4 initWithInteractiveCanvasController:v5];
    id v7 = self->mDragInteractionDelegate;
    self->mDragInteractionDelegate = v6;

    mDragInteractionDelegate = self->mDragInteractionDelegate;
  }

  return mDragInteractionDelegate;
}

- (id)contextMenuInteractionDelegate
{
  mContextMenuInteractionDelegate = self->mContextMenuInteractionDelegate;
  if (!mContextMenuInteractionDelegate)
  {
    id v4 = [CRLiOSCanvasContextMenuInteractionDelegate alloc];
    uint64_t v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    char v6 = [(CRLiOSCanvasContextMenuInteractionDelegate *)v4 initWithInteractiveCanvasController:v5];
    id v7 = self->mContextMenuInteractionDelegate;
    self->mContextMenuInteractionDelegate = v6;

    mContextMenuInteractionDelegate = self->mContextMenuInteractionDelegate;
  }

  return mContextMenuInteractionDelegate;
}

- (id)pointerInteractionDelegate
{
  mPointerInteractionDelegate = self->mPointerInteractionDelegate;
  if (!mPointerInteractionDelegate)
  {
    id v4 = [CRLiOSCanvasPointerInteractionDelegate alloc];
    uint64_t v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    char v6 = [(CRLiOSCanvasPointerInteractionDelegate *)v4 initWithInteractiveCanvasController:v5];
    id v7 = self->mPointerInteractionDelegate;
    self->mPointerInteractionDelegate = v6;

    mPointerInteractionDelegate = self->mPointerInteractionDelegate;
  }

  return mPointerInteractionDelegate;
}

- (id)newDragAndDropController
{
  id v3 = [CRLiOSDragAndDropController alloc];
  id v4 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  uint64_t v5 = [(CRLDragAndDropController *)v3 initWithDelegate:self interactiveCanvasController:v4];

  return v5;
}

- (id)modelContainerForLocalDragContext
{
  v2 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v3 = [v2 board];

  return v3;
}

- (void)dragSessionWillBegin
{
  id v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v4 = [v3 canvasView];
  uint64_t v5 = [v4 enclosingScrollView];
  char v6 = [v5 panGestureRecognizer];
  [v6 setState:4];

  id v7 = [(CRLiOSCanvasViewController *)self singleTapGestureRecognizer];
  [v7 setState:4];
}

- (BOOL)allowsSystemDragSession
{
  id v3 = [(CRLiOSCanvasViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  uint64_t v5 = [(CRLiOSCanvasViewController *)self delegate];
  unsigned __int8 v6 = [v5 allowsSystemDragSession];

  return v6;
}

- (void)p_setDragLiftDelay:(double)a3
{
  uint64_t v5 = [(CRLiOSCanvasViewController *)self dragInteraction];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CRLiOSCanvasViewController *)self dragInteraction];
    [v7 _setLiftDelay:a3];
  }
  char v8 = [(CRLiOSCanvasViewController *)self dragInteraction];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(CRLiOSCanvasViewController *)self dragInteraction];
    [v10 _setPointerLiftDelay:a3];
  }
}

- (BOOL)canInsertBoardItemsFromDragOperationForDragInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  char v6 = [v4 platformDraggingInfo];

  id v7 = [v6 localDragSession];
  char v8 = [v7 localContext];
  char v9 = sub_1002469D0(v5, v8);

  if (v9)
  {
    id v10 = [v9 modelContainer];
    BOOL v11 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    unsigned int v12 = [v11 board];
    BOOL v13 = v10 != v12;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)shouldAllowDragOperationForDragInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRLiOSCanvasViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v7 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    goto LABEL_5;
  }
  unsigned __int8 v6 = [v5 shouldRejectDragOperationForDragInfo:v4];
  id v7 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  if ((v6 & 1) == 0)
  {
LABEL_5:
    unsigned int v8 = [v7 isInDynamicOperation] ^ 1;
    goto LABEL_6;
  }
  LOBYTE(v8) = 0;
LABEL_6:

  return v8;
}

- (BOOL)shouldAllowDynamicInsertForDragInfo:(id)a3
{
  return 0;
}

- (BOOL)canEditRepWithDragOperation:(id)a3
{
  return 1;
}

- (CGRect)targetRectForEditMenu:(id)a3
{
  id v4 = a3;
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  char v9 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v10 = [v9 editorController];
  BOOL v11 = [v10 currentEditors];
  unsigned int v12 = [v11 reverseObjectEnumerator];

  id v13 = [v12 countByEnumeratingWithState:&v92 objects:v98 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v93;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v93 != v15) {
        objc_enumerationMutation(v12);
      }
      objc_super v17 = *(void **)(*((void *)&v92 + 1) + 8 * v16);
      if (objc_opt_respondsToSelector())
      {
        [v17 targetRectForEditMenu];
        double x = v99.origin.x;
        double y = v99.origin.y;
        double width = v99.size.width;
        double height = v99.size.height;
        if (!CGRectIsNull(v99)) {
          break;
        }
      }
      if (v14 == (id)++v16)
      {
        id v14 = [v12 countByEnumeratingWithState:&v92 objects:v98 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v100.origin.double x = x;
  v100.origin.double y = y;
  v100.size.double width = width;
  v100.size.double height = height;
  if (CGRectIsNull(v100))
  {
    id v18 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    id v19 = [v18 infosForSelectionPath:v4];

    if ([v19 count])
    {
      p_mICC = &self->mICC;
      id WeakRetained = objc_loadWeakRetained((id *)p_mICC);
      [WeakRetained layoutIfNeeded];

      if ([v19 count] == (id)1)
      {
        id v22 = objc_loadWeakRetained((id *)p_mICC);
        id v23 = [v19 anyObject];
        id v24 = [v22 repForInfo:v23];

        [v24 targetRectForEditMenu];
        CGFloat v25 = v101.origin.x;
        CGFloat v26 = v101.origin.y;
        CGFloat v27 = v101.size.width;
        CGFloat v28 = v101.size.height;
        if (!CGRectIsNull(v101))
        {
          if (v24) {
            [v24 transformToConvertNaturalToLayerRelative];
          }
          else {
            memset(&v91, 0, sizeof(v91));
          }
          v102.origin.double x = v25;
          v102.origin.double y = v26;
          v102.size.double width = v27;
          v102.size.double height = v28;
          CGRect v103 = CGRectApplyAffineTransform(v102, &v91);
          double v40 = v103.origin.x;
          double v41 = v103.origin.y;
          double width = v103.size.width;
          double height = v103.size.height;
          [v24 layerFrameInScaledCanvas];
          double x = sub_100064698(v40, v41, v42);
          double y = v43;
        }
      }
      v104.origin.double x = x;
      v104.origin.double y = y;
      v104.size.double width = width;
      v104.size.double height = height;
      if (CGRectIsNull(v104))
      {
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v44 = v19;
        id v45 = [v44 countByEnumeratingWithState:&v87 objects:v97 count:16];
        if (v45)
        {
          id v46 = v45;
          v81 = v19;
          id v82 = v4;
          uint64_t v47 = *(void *)v88;
          do
          {
            for (i = 0; i != v46; i = (char *)i + 1)
            {
              if (*(void *)v88 != v47) {
                objc_enumerationMutation(v44);
              }
              uint64_t v49 = *(void *)(*((void *)&v87 + 1) + 8 * i);
              long long v83 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              id v50 = objc_loadWeakRetained((id *)p_mICC);
              double v51 = [v50 repsForInfo:v49];

              id v52 = [v51 countByEnumeratingWithState:&v83 objects:v96 count:16];
              if (v52)
              {
                id v53 = v52;
                uint64_t v54 = *(void *)v84;
                do
                {
                  for (j = 0; j != v53; j = (char *)j + 1)
                  {
                    if (*(void *)v84 != v54) {
                      objc_enumerationMutation(v51);
                    }
                    v56 = [*(id *)(*((void *)&v83 + 1) + 8 * (void)j) layout:v81, v82];
                    [v56 insertionFrameInRoot];
                    double v58 = v57;
                    double v60 = v59;
                    double v62 = v61;
                    double v64 = v63;

                    id v65 = objc_loadWeakRetained((id *)p_mICC);
                    [v65 convertUnscaledToBoundsRect:v58, v60, v62, v64];
                    double v67 = v66;
                    double v69 = v68;
                    double v71 = v70;
                    double v73 = v72;

                    v105.origin.double x = x;
                    v105.origin.double y = y;
                    v105.size.double width = width;
                    v105.size.double height = height;
                    if (CGRectIsNull(v105))
                    {
                      double height = v73;
                      double width = v71;
                      double y = v69;
                      double x = v67;
                    }
                    else
                    {
                      double x = sub_100064F28(x, y, width, height, v67, v69, v71, v73);
                      double y = v74;
                      double width = v75;
                      double height = v76;
                    }
                  }
                  id v53 = [v51 countByEnumeratingWithState:&v83 objects:v96 count:16];
                }
                while (v53);
              }
            }
            id v46 = [v44 countByEnumeratingWithState:&v87 objects:v97 count:16];
          }
          while (v46);
          id v19 = v81;
          id v4 = v82;
        }

        v106.origin.double x = x;
        v106.origin.double y = y;
        v106.size.double width = width;
        v106.size.double height = height;
        if (CGRectIsNull(v106))
        {
          double x = CGRectZero.origin.x;
          double y = CGRectZero.origin.y;
          double width = CGRectZero.size.width;
          double height = CGRectZero.size.height;
        }
      }
    }
    else
    {
      char v29 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
      [(CRLiOSCanvasViewController *)self lastTapPoint];
      [v29 convertUnscaledToBoundsPoint:];
      double v31 = v30;
      double v33 = v32;

      sub_100064698(v31, v33, 0.0);
      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v34, v35);
      double x = v36;
      double y = v37;
      double width = v38;
      double height = v39;
    }
  }
  double v77 = x;
  double v78 = y;
  double v79 = width;
  double v80 = height;
  result.size.double height = v80;
  result.size.double width = v79;
  result.origin.double y = v78;
  result.origin.double x = v77;
  return result;
}

- (void)showEditMenuForSelectionPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[UIMenuController sharedMenuController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v7 = objc_loadWeakRetained((id *)&self->mDelegate);
    unsigned int v8 = [v7 allowEditMenuToAppear];

    if (!v8) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ([(CRLiOSCanvasViewController *)self becomeFirstResponderIfAppropriate])
  {
    char v9 = [(CRLiOSCanvasViewController *)self view];
    id v10 = [v9 window];
    [v10 makeKeyWindow];

    if (self->mContextMenuController)
    {
      BOOL v11 = +[UIMenuController sharedMenuController];
      [v11 hideMenu];
    }
    id v12 = objc_loadWeakRetained((id *)&self->mICC);
    [v12 visibleBoundsRect];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    [(CRLiOSCanvasViewController *)self targetRectForEditMenu:v4];
    v42.origin.double x = v14;
    v42.origin.double y = v16;
    v42.size.double width = v18;
    v42.size.double height = v20;
    CGRect v41 = CGRectIntersection(v40, v42);
    v43.origin.double x = CGRectNull.origin.x;
    v43.origin.double y = CGRectNull.origin.y;
    v43.size.double width = CGRectNull.size.width;
    v43.size.double height = CGRectNull.size.height;
    if (!CGRectEqualToRect(v41, v43))
    {
      id v21 = +[NSMutableArray array];
      [(CRLiOSCanvasViewController *)self p_buildMenuItems:v21 forSelectionPath:v4];
      [v5 setMenuItems:v21];
      [(CRLiOSCanvasViewController *)self p_targetRectForMenuControllerPositionForSelectionPath:v4];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      self->mTargetRectForContextMenuController.origin.double x = v22;
      self->mTargetRectForContextMenuController.origin.double y = v24;
      self->mTargetRectForContextMenuController.size.double width = v26;
      self->mTargetRectForContextMenuController.size.double height = v28;
      if (self->mContextMenuController)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EA308);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101098D04();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EA328);
        }
        double v30 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v30);
        }
        double v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController showEditMenuForSelectionPath:]");
        double v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 1784, 0, "expected nil value for '%{public}s'", "mContextMenuController");
      }
      double v33 = [[CRLiOSContextMenuController alloc] initWithDelegate:self];
      mContextMenuController = self->mContextMenuController;
      self->mContextMenuController = v33;

      Swift::String v35 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
      double v36 = [v35 infosForSelectionPath:v4];

      double v37 = +[NSSet setWithSet:v36];
      double v38 = self->mContextMenuController;
      double v39 = [(CRLiOSCanvasViewController *)self canvasView];
      -[CRLiOSContextMenuController showContextMenuFromView:rect:animated:withChangeSources:](v38, "showContextMenuFromView:rect:animated:withChangeSources:", v39, 1, v37, v23, v25, v27, v29);

      self->mContextMenuMightBeDisplayed = 1;
    }
  }
LABEL_20:
}

- (CGRect)p_targetRectForMenuControllerPositionForSelectionPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[UIMenuController sharedMenuController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  [WeakRetained visibleBoundsRect];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  [(CRLiOSCanvasViewController *)self targetRectForEditMenu:v4];
  double y = v55.origin.y;
  double x = v55.origin.x;
  double height = v55.size.height;
  double width = v55.size.width;
  CGFloat v45 = v12;
  v60.origin.double x = v8;
  double v48 = v14;
  double v49 = v10;
  v60.origin.double y = v10;
  v60.size.double width = v12;
  v60.size.double height = v14;
  CGRect v56 = CGRectIntersection(v55, v60);
  double v15 = v56.origin.x;
  double v16 = v56.origin.y;
  double v17 = v56.size.width;
  double v18 = v56.size.height;
  CGFloat v19 = CGRectNull.origin.y;
  CGFloat v21 = CGRectNull.size.width;
  CGFloat v20 = CGRectNull.size.height;
  v61.origin.double x = CGRectNull.origin.x;
  v61.origin.double y = v19;
  v61.size.double width = v21;
  v61.size.double height = v20;
  BOOL v22 = CGRectEqualToRect(v56, v61);
  if (v22)
  {
    double v18 = height;
    double v23 = width;
  }
  else
  {
    double v23 = v17;
  }
  if (v22) {
    double v24 = y;
  }
  else {
    double v24 = v16;
  }
  if (v22) {
    double v15 = x;
  }
  double v25 = v15;
  double v26 = v24;
  CGFloat v54 = v23;
  double v27 = v18;
  v62.origin.double x = CGRectNull.origin.x;
  v62.origin.double y = v19;
  v62.size.double width = v21;
  v62.size.double height = v20;
  if (CGRectEqualToRect(*(CGRect *)(&v23 - 2), v62))
  {
    CGFloat v28 = v54;
  }
  else
  {
    double v29 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    double v30 = [v29 infosForSelectionPath:v4];

    double v31 = [v30 objectsPassingTest:&stru_1014EA348];
    id v32 = [v31 count];
    double v33 = v18 * 0.5;
    if ((unint64_t)v32 <= 1) {
      double v33 = -0.0;
    }
    double v24 = v24 + v33;
    [v5 setArrowDirection:0, v45, v8];
    if (v24 > v49 + 100.0 || v18 < v48 + -100.0)
    {
      CGFloat v28 = v54;
    }
    else
    {
      v57.origin.double x = v15;
      v57.origin.double y = v24;
      v57.size.double width = v54;
      v57.size.double height = v18;
      v58.origin.double x = CGRectGetMidX(v57);
      double v15 = v58.origin.x;
      v58.origin.double y = v24;
      v58.size.double width = v54;
      v58.size.double height = v18;
      double MinY = CGRectGetMinY(v58);
      uint64_t v37 = v46;
      uint64_t v36 = v47;
      double v38 = v49;
      double v39 = v48;
      double v40 = CGRectGetMinY(*(CGRect *)&v36) + 6.0;
      if (MinY >= v40) {
        double v24 = MinY;
      }
      else {
        double v24 = v40;
      }
      CGFloat v28 = CGSizeZero.width;
      double v18 = CGSizeZero.height;
      [v5 setArrowDirection:1];
    }
  }
  double v41 = v15;
  double v42 = v24;
  double v43 = v28;
  double v44 = v18;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.double y = v42;
  result.origin.double x = v41;
  return result;
}

- (void)p_buildMenuTitles:(id)a3 forSelectionPath:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = +[NSBundle mainBundle];
  double v7 = [v6 localizedStringForKey:@"Select Objects…" value:0 table:0];

  [v5 addObject:v7];
  CGFloat v8 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  double v9 = [v8 canvasEditor];
  unsigned int v10 = [v9 canvasEditorCanUngroupWithSender:0];

  double v11 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  CGFloat v12 = [v11 canvasEditor];
  unsigned int v13 = [v12 canvasEditorCanGroupWithSender:0];

  if (v13)
  {
    CGFloat v14 = +[NSBundle mainBundle];
    double v15 = v14;
    CFStringRef v16 = @"GROUP_EDIT_MENU";
    CFStringRef v17 = @"Group";
  }
  else
  {
    if (!v10) {
      goto LABEL_6;
    }
    CGFloat v14 = +[NSBundle mainBundle];
    double v15 = v14;
    CFStringRef v16 = @"Ungroup";
    CFStringRef v17 = 0;
  }
  double v18 = [v14 localizedStringForKey:v16 value:v17 table:0];

  [v5 addObject:v18];
LABEL_6:
  CGFloat v19 = +[NSBundle mainBundle];
  uint64_t v20 = [v19 localizedStringForKey:@"Unlock" value:0 table:0];

  uint64_t v36 = (void *)v20;
  [v5 addObject:v20];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  CGFloat v21 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  BOOL v22 = [v21 editorController];
  double v23 = [v22 currentEditors];

  id obj = v23;
  id v24 = [v23 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v43;
    do
    {
      double v27 = 0;
      do
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(obj);
        }
        CGFloat v28 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v27);
        if (objc_opt_respondsToSelector())
        {
          double v29 = +[NSMutableArray array];
          [v28 addContextualMenuItemsToArray:v29];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v30 = v29;
          id v31 = [v30 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v39;
            do
            {
              CKRecordID v34 = 0;
              do
              {
                if (*(void *)v39 != v33) {
                  objc_enumerationMutation(v30);
                }
                Swift::String v35 = [*(id *)(*((void *)&v38 + 1) + 8 * (void)v34) title];
                [v5 addObject:v35];

                CKRecordID v34 = (char *)v34 + 1;
              }
              while (v32 != v34);
              id v32 = [v30 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }
            while (v32);
          }
        }
        double v27 = (char *)v27 + 1;
      }
      while (v27 != v25);
      id v25 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v25);
  }
}

- (void)p_buildMenuItems:(id)a3 forSelectionPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = +[NSBundle mainBundle];
  double v9 = [v8 localizedStringForKey:@"Select Objects…" value:0 table:0];

  id v10 = [objc_alloc((Class)UIMenuItem) initWithTitle:v9 action:"enterQuickSelectMode:"];
  [v6 addObject:v10];

  double v11 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  double v49 = v7;
  CGFloat v12 = [v11 infosForSelectionPath:v7];

  unsigned int v13 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  CGFloat v14 = [v13 canvasEditor];
  unsigned int v15 = [v14 canvasEditorCanUngroupWithSender:0];

  CFStringRef v16 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  CFStringRef v17 = [v16 canvasEditor];
  unsigned int v18 = [v17 canvasEditorCanGroupWithSender:0];

  if (v18)
  {
    CGFloat v19 = +[NSBundle mainBundle];
    uint64_t v20 = [v19 localizedStringForKey:@"GROUP_EDIT_MENU" value:@"Group" table:0];
    CGFloat v21 = &selRef_group_;
  }
  else
  {
    if (!v15) {
      goto LABEL_6;
    }
    CGFloat v19 = +[NSBundle mainBundle];
    uint64_t v20 = [v19 localizedStringForKey:@"Ungroup" value:0 table:0];
    CGFloat v21 = &selRef_ungroup_;
  }

  id v22 = [objc_alloc((Class)UIMenuItem) initWithTitle:v20 action:*v21];
  [v6 addObject:v22];

LABEL_6:
  double v23 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v24 = [v23 canvasEditor];
  id v25 = [v24 canvasEditorHelper];
  id v26 = [v25 canvasEditorCanPerformShowMiniFormatterToExitDrawingModeActionWithSender:0];

  if (v26 == (id)1)
  {
    double v27 = +[NSBundle mainBundle];
    CGFloat v28 = [v27 localizedStringForKey:@"Edit" value:0 table:0];

    id v29 = [objc_alloc((Class)UIMenuItem) initWithTitle:v28 action:"showMiniFormatterToExitDrawingMode:"];
    [v6 addObject:v29];
  }
  if ([v12 count] == (id)1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    id v31 = [v12 anyObject];
    id v32 = [WeakRetained repForInfo:v31];

    if ([v32 isLocked])
    {
      int v33 = 0;
    }
    else
    {
      CKRecordID v34 = [v32 itemsToAddToEditMenu];
      [v6 addObjectsFromArray:v34];

      int v33 = 1;
    }
  }
  else
  {
    int v33 = 0;
    id v32 = 0;
  }
  Swift::String v35 = +[NSBundle mainBundle];
  uint64_t v36 = [v35 localizedStringForKey:@"Unlock" value:0 table:0];

  id v37 = [objc_alloc((Class)UIMenuItem) initWithTitle:v36 action:"unlock:"];
  [v6 addObject:v37];
  if (v33)
  {
    long long v38 = [(CRLiOSCanvasViewController *)self itemsToAddToEditMenuForRep:v32];
    long long v39 = v38;
    if (v38 && [v38 count]) {
      [v6 addObjectsFromArray:v39];
    }
  }
  double v48 = v32;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v40 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  long long v41 = [v40 editorController];
  long long v42 = [v41 currentEditors];

  id v43 = [v42 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v51;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v51 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v47 addContextualMenuItemsToArray:v6];
        }
      }
      id v44 = [v42 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v44);
  }
}

- (void)toggleEditMenuForCurrentSelection
{
  if (self->mContextMenuMightBeDisplayed)
  {
    [(CRLiOSCanvasViewController *)self hideEditMenu];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    id v3 = [WeakRetained editorController];
    id v4 = [v3 selectionPath];
    [(CRLiOSCanvasViewController *)self showEditMenuForSelectionPath:v4];
  }
}

- (void)toggleDefaultEditUIForCurrentSelection
{
  if (self->mContextMenuMightBeDisplayed)
  {
    [(CRLiOSCanvasViewController *)self hideEditMenu];
  }
  else
  {
    id v3 = [(CRLiOSCanvasViewController *)self miniFormatterPresenter];
    unsigned int v4 = [v3 isPresentingMiniFormatter];

    if (v4)
    {
      id v9 = [(CRLiOSCanvasViewController *)self miniFormatterPresenter];
      [v9 dismissMiniFormatter];
    }
    else
    {
      id v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
      id v6 = [v5 layerHost];
      id v7 = [v6 asiOSCVC];
      unsigned __int8 v8 = [v7 isCurrentlyInQuickSelectMode];

      if ((v8 & 1) == 0)
      {
        [(CRLiOSCanvasViewController *)self showDefaultEditUIForCurrentSelection];
      }
    }
  }
}

- (void)showDefaultEditUIForCurrentSelection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  unsigned int v4 = [WeakRetained editorController];
  id v10 = [v4 selectionPath];

  if ([(CRLiOSCanvasViewController *)self p_shouldShowMiniFormatterForSelectionPath:v10])
  {
    id v5 = [(CRLiOSCanvasViewController *)self miniFormatterPresenter];
    [v5 presentMiniFormatterForSelectionPath:v10];

    goto LABEL_8;
  }
  id v6 = [(CRLiOSCanvasViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(CRLiOSCanvasViewController *)self delegate];
    unsigned __int8 v8 = [v7 currentDocumentMode];
    unsigned int v9 = [v8 wantsLegacyEditMenu];

    if (v9)
    {
      [(CRLiOSCanvasViewController *)self showEditMenuForSelectionPath:v10];
      goto LABEL_8;
    }
  }
  else
  {
  }
  [(CRLiOSCanvasViewController *)self showEditUIForSelectionPath:v10];
LABEL_8:
}

- (id)editMenuConfigrationForSelectionPath:(id)a3 withConfigurationIdentifier:(id)a4
{
  uint64_t v9 = 0;
  id v6 = a4;
  [(CRLiOSCanvasViewController *)self p_targetPointForEditMenuForSelectionPath:a3 outModifiedDirection:&v9];
  id v7 = +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", v6);

  [v7 setPreferredArrowDirection:v9];

  return v7;
}

- (CGPoint)p_targetPointForEditMenuForSelectionPath:(id)a3 outModifiedDirection:(int64_t *)a4
{
  [(CRLiOSCanvasViewController *)self targetRectForEditMenu:a3];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CGFloat v13 = v12;
  CGFloat v14 = +[UIApplication sharedApplication];
  unsigned int v15 = [v14 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v15))
  {
    CFStringRef v16 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    [v16 visibleBoundsRect];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    v40.origin.CGFloat x = v18;
    v40.origin.CGFloat y = v20;
    v40.size.CGFloat width = v22;
    v40.size.double height = v24;
    v43.origin.CGFloat x = v7;
    v43.origin.CGFloat y = v9;
    v43.size.CGFloat width = v11;
    v43.size.double height = v13;
    CGRect v41 = CGRectIntersection(v40, v43);
    CGFloat v36 = v13;
    double v37 = v11;
    CGFloat x = v41.origin.x;
    double v38 = v7;
    CGFloat y = v41.origin.y;
    CGFloat width = v41.size.width;
    CGFloat rect = v41.size.height;
    v41.origin.CGFloat x = v18;
    v41.origin.CGFloat y = v20;
    v41.size.CGFloat width = v22;
    v41.size.double height = v24;
    double MaxY = CGRectGetMaxY(v41);
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    double v11 = v37;
    double v7 = v38;
    v42.size.double height = rect;
    double v29 = MaxY - CGRectGetMaxY(v42);
    BOOL v30 = v29 < v9;
    int64_t v31 = 2;
    if (v29 >= v9) {
      int64_t v31 = 1;
    }
    double v32 = -0.0;
    if (!v30) {
      double v32 = v36;
    }
    double v9 = v9 + v32;
    *a4 = v31;
  }

  double v33 = v7 + v11 * 0.5;
  double v34 = v9;
  result.CGFloat y = v34;
  result.CGFloat x = v33;
  return result;
}

- (void)showEditUIForSelectionPath:(id)a3
{
  id v5 = [(CRLiOSCanvasViewController *)self editMenuConfigrationForSelectionPath:a3 withConfigurationIdentifier:@"CRLDefault"];
  unsigned int v4 = [(CRLiOSCanvasViewController *)self editMenuInteraction];
  [v4 presentEditMenuWithConfiguration:v5];
}

- (void)hideEditMenu
{
  id v3 = [(CRLiOSCanvasViewController *)self editMenuInteraction];
  [v3 dismissMenu];

  unsigned int v4 = +[UIMenuController sharedMenuController];
  [v4 hideMenu];

  self->mContextMenuMightBeDisplayed = 0;
}

- (id)itemsToAddToEditMenuForRep:(id)a3
{
  return 0;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  v2 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v3 = [v2 editingCoordinator];

  return (_TtC8Freeform21CRLEditingCoordinator *)v3;
}

- (void)contextMenuDidHideForContextMenuController:(id)a3
{
  mContextMenuController = (CRLiOSContextMenuController *)a3;
  id v5 = mContextMenuController;
  if (self->mContextMenuController != mContextMenuController)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA368);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101098D98();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA388);
    }
    double v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController contextMenuDidHideForContextMenuController:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:2051 isFatal:0 description:"Unexpected context menu controller closing!"];

    mContextMenuController = self->mContextMenuController;
  }
  [(CRLiOSContextMenuController *)mContextMenuController setDelegate:0];
  double v9 = self->mContextMenuController;
  self->mContextMenuController = 0;

  double v10 = +[UIMenuController sharedMenuController];
  [v10 setMenuItems:&__NSArray0__struct];
}

- (BOOL)contextMenuPositionShouldUpdateForContextMenuController:(id)a3
{
  if (self->mContextMenuController != a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA3A8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101098E20();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA3C8);
    }
    unsigned int v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController contextMenuPositionShouldUpdateForContextMenuController:]");
    double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:2060 isFatal:0 description:"Unexpected context menu controller updating!"];
  }
  double v7 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  double v8 = [v7 editorController];
  double v9 = [v8 selectionPath];
  [(CRLiOSCanvasViewController *)self p_targetRectForMenuControllerPositionForSelectionPath:v9];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v19.origin.CGFloat x = v11;
  v19.origin.CGFloat y = v13;
  v19.size.CGFloat width = v15;
  v19.size.double height = v17;
  return !CGRectEqualToRect(v19, self->mTargetRectForContextMenuController);
}

- (BOOL)crl_representsPhysicalKeyboard
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return !self->mHasBeenTornDown;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ([(CRLiOSCanvasViewController *)self p_isAccessibilityTextResponderAction:a3])
  {
    double v7 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    double v8 = [v7 textInputResponder];

    if (objc_opt_respondsToSelector()) {
      goto LABEL_9;
    }
  }
  if (!sel_isEqual(a3, "find:")) {
    goto LABEL_8;
  }
  double v9 = (objc_class *)objc_opt_class();
  double v10 = [(CRLiOSCanvasViewController *)self delegate];
  double v8 = sub_10024715C(v9, v10);

  if (!v8 || ([v8 canPerformAction:a3 withSender:v6] & 1) == 0)
  {

LABEL_8:
    v12.receiver = self;
    v12.super_class = (Class)CRLiOSCanvasViewController;
    double v8 = [(CRLiOSCanvasViewController *)&v12 targetForAction:a3 withSender:v6];
  }
LABEL_9:

  return v8;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (self->mHasBeenTornDown || [(CRLiOSCanvasViewController *)self p_currentModeIsFind])
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    BOOL v9 = "bringToFront:" == a3 || "sendToBack:" == a3;
    if (v9
      && (self,
          double v10 = objc_claimAutoreleasedReturnValue(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v10,
          (isKindOfClass & 1) != 0))
    {
      unsigned __int8 v7 = 1;
    }
    else
    {
      p_mICC = &self->mICC;
      id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
      double v14 = [WeakRetained tmCoordinator];
      CGFloat v15 = [v14 controllingTM];
      double v16 = [v15 tracker];

      if (v16
        && (objc_opt_respondsToSelector() & 1) != 0
        && ([v16 disallowAllActionsWhileTracking] & 1) != 0)
      {
        unsigned __int8 v7 = 0;
      }
      else
      {
        id v17 = objc_loadWeakRetained((id *)p_mICC);
        if ([v17 isInDynamicOperation])
        {
          unsigned __int8 v7 = 0;
        }
        else
        {
          id v18 = objc_loadWeakRetained((id *)p_mICC);
          unsigned __int8 v7 = [v18 canPerformInteractiveAction:a3 withSender:v6];
        }
      }
    }
  }

  return v7;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  if ([v4 action] == "sendToBack:")
  {
    id v6 = "bringToFront:";
  }
  else
  {
    id v5 = (char *)[v4 action];
    if (v5 != "bringToFront:") {
      goto LABEL_11;
    }
    id v6 = v5;
  }
  unsigned __int8 v7 = [(CRLiOSCanvasViewController *)self canPerformAction:"sendToBack:" withSender:self];
  unsigned int v8 = [(CRLiOSCanvasViewController *)self canPerformAction:v6 withSender:self];
  if ((v7 & 1) == 0 && !v8)
  {
    uint64_t v9 = 4;
LABEL_10:
    [v4 setAttributes:v9];
    goto LABEL_11;
  }
  if (!-[CRLiOSCanvasViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", [v4 action], self))
  {
    uint64_t v9 = 1;
    goto LABEL_10;
  }
LABEL_11:
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSCanvasViewController;
  [(CRLiOSCanvasViewController *)&v10 validateCommand:v4];
}

- (void)setContextMenuMightBeDisplayed:(BOOL)a3
{
  if (!a3)
  {
    id v5 = +[UIMenuController sharedMenuController];
    unsigned int v6 = [v5 isMenuVisible];

    if (v6) {
      [(CRLiOSCanvasViewController *)self hideEditMenu];
    }
  }
  self->mContextMenuMightBeDisplayed = a3;
}

- (void)cut:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [(CRLiOSCanvasViewController *)self hideEditMenu];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  [WeakRetained makeEditorPerformAction:a2 withSender:v6];
}

- (void)showMiniFormatterToExitDrawingMode:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CRLiOSCanvasViewController *)self hideEditMenu];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  id v5 = [WeakRetained canvasEditor];
  id v6 = [v5 canvasEditorHelper];
  [v6 showMiniFormatterToExitDrawingMode:v7];
}

- (void)unlock:(id)a3
{
  id v5 = a3;
  id v6 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  [v6 makeEditorPerformAction:a2 withSender:v5];

  objc_opt_class();
  LOBYTE(a2) = objc_opt_isKindOfClass();

  if (a2)
  {
    id v9 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    id v7 = [v9 editorController];
    unsigned int v8 = [v7 selectionPath];
    [(CRLiOSCanvasViewController *)self showEditMenuForSelectionPath:v8];
  }
}

- (void)forceStopScrolling
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA3E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101098EA8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA408);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController forceStopScrolling]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:2188 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  id v6 = [(CRLiOSCanvasViewController *)self canvasView];
  id v7 = [v6 enclosingScrollView];

  if ([v7 isScrollEnabled])
  {
    unsigned int v8 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    unsigned int v9 = [v8 currentlyScrolling];

    if (v9)
    {
      [v7 setScrollEnabled:0];
      [v7 setScrollEnabled:1];
      [v7 contentOffset];
      [v7 setContentOffset:0 animated:YES];
    }
  }
}

- (void)scrollViewDidScroll
{
  if (+[CRLFeatureFlagGroup isEasierConnectionLinesEnabled])
  {
    id v3 = [(CRLiOSCanvasViewController *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [(CRLiOSCanvasViewController *)self delegate];
      [v5 userDidInteractWithCanvas:self];
    }
  }
}

- (BOOL)shouldOptOutOfUIScrollViewContentOffsetAnimation
{
  return 1;
}

- (void)enterQuickSelectMode
{
  id v3 = [(CRLiOSCanvasViewController *)self miniFormatterPresenter];
  unsigned int v4 = [v3 isPresentingMiniFormatter];

  if ([(CRLiOSCanvasViewController *)self allowedToEnterQuickSelectMode] && v4)
  {
    id v5 = [(CRLiOSCanvasViewController *)self miniFormatterPresenter];
    [v5 dismissMiniFormatter];
  }
  if ([(CRLiOSCanvasViewController *)self isCurrentlyInQuickSelectMode]
    || ![(CRLiOSCanvasViewController *)self allowedToEnterQuickSelectMode])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA428);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101098F30();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA448);
    }
    id v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v18);
    }
    CGRect v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController enterQuickSelectMode]");
    CGFloat v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:2227 isFatal:0 description:"Attempting to enter Quick Select mode at an inappropriate time."];
  }
  else
  {
    id v6 = [(CRLiOSCanvasViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      unsigned int v8 = [(CRLiOSCanvasViewController *)self delegate];
      [v8 willEnterQuickSelectModeForCanvasViewController:self];
    }
    [(CRLiOSCanvasViewController *)self beginPreventingDefaultPencilBehaviors];
    unsigned int v9 = [[CRLiOSQuickSelectViewController alloc] initWithDelegate:self];
    mQuickSelectViewController = self->mQuickSelectViewController;
    self->mQuickSelectViewController = v9;

    CGFloat v11 = [(CRLiOSCanvasViewController *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      CGFloat v13 = [(CRLiOSCanvasViewController *)self delegate];
      [v13 didEnterQuickSelectModeForCanvasViewController:self];
    }
    double v14 = [(CRLiOSCanvasViewController *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      double v16 = [(CRLiOSCanvasViewController *)self delegate];
      uint64_t v17 = [v16 quickSelectHUDParentViewForCanvasViewController:self];
    }
    else
    {
      uint64_t v17 = 0;
    }
    Swift::String v35 = (void *)v17;
    [(CRLiOSQuickSelectViewController *)self->mQuickSelectViewController presentOnCanvasViewController:self parentView:v17];
    double v21 = [(CRLiOSCanvasViewController *)self canvasView];
    CGFloat v20 = [v21 enclosingScrollView];

    CGFloat v22 = [v20 panGestureRecognizer];
    self->mEnclosingScrollViewPanGestureMinimumTouchCountBeforeQuickSelect = (int64_t)[v22 minimumNumberOfTouches];

    double v23 = [v20 panGestureRecognizer];
    [v23 setMinimumNumberOfTouches:2];

    self->mEditMenuTapGestureRecognizerEnabledBeforeQuickSelect = [(CRLiOSEditMenuTapGestureRecognizer *)self->mEditMenuTapGestureRecognizer isEnabled];
    [(CRLiOSEditMenuTapGestureRecognizer *)self->mEditMenuTapGestureRecognizer setEnabled:0];
    CGFloat v24 = [(CRLiOSCanvasViewController *)self delegate];
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      id v26 = [(CRLiOSCanvasViewController *)self delegate];
      [v26 updateToolbarButtons];
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    CGFloat v28 = [WeakRetained canvas];
    double v29 = [v28 topLevelReps];

    id v30 = [v29 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v29);
          }
          double v34 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          [v34 recursivelyPerformSelectorIfImplemented:"invalidateKnobs"];
          [v34 recursivelyPerformSelectorIfImplemented:"stopPlaybackIfNeeded"];
        }
        id v31 = [v29 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v31);
    }

    CGRect v19 = v35;
  }
}

- (void)leaveQuickSelectModeIfNeeded
{
  if ([(CRLiOSCanvasViewController *)self isCurrentlyInQuickSelectMode])
  {
    [(CRLiOSCanvasViewController *)self p_leaveQuickSelectMode];
  }
}

- (void)temporarilyHideQuickSelectHUDIfNecessary
{
}

- (void)unhideQuickSelectHUDIfNecessary
{
}

- (BOOL)shouldExitQuickSelectModeForQuickSelectViewController:(id)a3
{
  return ![(CRLiOSCanvasViewController *)self allowedToEnterQuickSelectMode];
}

- (CGRect)visibleCanvasRectForQuickSelectViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  [v5 visibleScaledRectForCanvasUI];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [(CRLiOSCanvasViewController *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    double v16 = [(CRLiOSCanvasViewController *)self delegate];
    [v16 safeInsetsForTemporaryHUDsToAvoidViewsObscuringCanvasScrollViewForCanvasViewController:self];
    double left = v17;
    double bottom = v19;
    double right = v21;
  }
  else
  {
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  double v23 = v7 + 0.0;
  double v24 = v9 + 0.0;
  double v25 = v13 - (bottom + 0.0);
  if (left >= right) {
    double v26 = left;
  }
  else {
    double v26 = right;
  }
  double v27 = v7 + v26;
  double v28 = v11 - (v26 + v26);
  unsigned int v29 = [v4 isInCompactViewModeForCompactFrame:v23 andRegularSizeFrame:v24 v11 v25 v27 v24 v28 v13];
  if (v29) {
    double v13 = v25;
  }
  else {
    double v11 = v28;
  }
  if (v29) {
    double v27 = v23;
  }

  double v30 = v27;
  double v31 = v24;
  double v32 = v11;
  double v33 = v13;
  result.size.double height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (BOOL)allowedToEnterQuickSelectMode
{
  BOOL v3 = [(CRLiOSCanvasViewController *)self p_currentModeAllowsQuickSelect];
  if (v3)
  {
    LOBYTE(v3) = [(CRLiOSCanvasViewController *)self p_editorAllowsQuickSelect];
  }
  return v3;
}

- (BOOL)isCurrentlyInQuickSelectMode
{
  return self->mQuickSelectViewController != 0;
}

- (BOOL)p_currentModeAllowsQuickSelect
{
  BOOL v3 = [(CRLiOSCanvasViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  id v5 = [(CRLiOSCanvasViewController *)self delegate];
  double v6 = [v5 currentDocumentMode];

  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA468);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101098FB8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA488);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController p_currentModeAllowsQuickSelect]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 2327, 0, "invalid nil value for '%{public}s'", "currentMode");
  }
  unsigned __int8 v10 = [v6 allowedToEnterQuickSelectModeForCanvasViewController:self];

  return v10;
}

- (BOOL)p_currentModeIsFind
{
  BOOL v3 = [(CRLiOSCanvasViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CRLiOSCanvasViewController *)self delegate];
    double v6 = [v5 currentDocumentMode];

    if (!v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA4A8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109904C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA4C8);
      }
      double v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController p_currentModeIsFind]");
      double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 2341, 0, "invalid nil value for '%{public}s'", "currentMode");
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (BOOL)p_editorAllowsQuickSelect
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v2 = [(CRLiOSCanvasViewController *)self editorController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002CA438;
  v4[3] = &unk_1014D1520;
  v4[4] = &v5;
  [v2 enumerateEditorsOnStackUsingBlock:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (void)p_leaveQuickSelectMode
{
  BOOL v3 = [(CRLiOSCanvasViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(CRLiOSCanvasViewController *)self delegate];
    [v5 willLeaveQuickSelectModeForCanvasViewController:self];
  }
  [(CRLiOSQuickSelectViewController *)self->mQuickSelectViewController dismiss];
  double v6 = [(CRLiOSCanvasViewController *)self canvasView];
  uint64_t v7 = [v6 enclosingScrollView];

  int64_t mEnclosingScrollViewPanGestureMinimumTouchCountBeforeQuickSelect = self->mEnclosingScrollViewPanGestureMinimumTouchCountBeforeQuickSelect;
  uint64_t v9 = [v7 panGestureRecognizer];
  [(id)v9 setMinimumNumberOfTouches:mEnclosingScrollViewPanGestureMinimumTouchCountBeforeQuickSelect];

  [(CRLiOSEditMenuTapGestureRecognizer *)self->mEditMenuTapGestureRecognizer setEnabled:self->mEditMenuTapGestureRecognizerEnabledBeforeQuickSelect];
  mQuickSelectViewController = self->mQuickSelectViewController;
  self->mQuickSelectViewController = 0;

  double v11 = [(CRLiOSCanvasViewController *)self delegate];
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if (v9)
  {
    double v12 = [(CRLiOSCanvasViewController *)self delegate];
    [v12 didLeaveQuickSelectModeForCanvasViewController:self];
  }
  double v13 = [(CRLiOSCanvasViewController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    char v15 = [(CRLiOSCanvasViewController *)self delegate];
    [v15 updateToolbarButtons];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  double v17 = [WeakRetained canvas];
  id v18 = [v17 topLevelReps];

  id v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:"invalidateKnobs"];
      }
      id v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v20);
  }

  [(CRLiOSCanvasViewController *)self endPreventingDefaultPencilBehaviors];
}

- (id)i_quickSelectViewController
{
  return self->mQuickSelectViewController;
}

- (CGRect)visibleScaledRectForCanvasUI
{
  v2 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  [v2 visibleScaledRectForCanvasUI];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CRLEditorController)editorController
{
  v2 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  double v3 = [v2 editorController];

  return (CRLEditorController *)v3;
}

- (void)didDismissQuickSelectViewController:(id)a3
{
  if (self->mQuickSelectViewController == a3)
  {
    unsigned __int8 v4 = -[CRLiOSCanvasViewController shouldExitQuickSelectModeForQuickSelectViewController:](self, "shouldExitQuickSelectModeForQuickSelectViewController:");
    [(CRLiOSCanvasViewController *)self leaveQuickSelectModeIfNeeded];
    if ((v4 & 1) == 0)
    {
      double v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
      unsigned __int8 v6 = [v5 editingDisabled];

      if ((v6 & 1) == 0)
      {
        double v7 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
        double v8 = [v7 selectionModelTranslator];
        double v9 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
        double v10 = [v9 editorController];
        double v11 = [v10 selectionPath];
        double v12 = [v8 boardItemsForSelectionPath:v11];
        id v13 = [v12 count];

        if (v13)
        {
          [(CRLiOSCanvasViewController *)self showDefaultEditUIForCurrentSelection];
        }
      }
    }
  }
}

- (void)presentAlignmentTools
{
  if (!self->mAlignmentController)
  {
    double v3 = [[_TtC8Freeform30CRLiOSAlignmentToolsController alloc] initWithDelegate:self];
    unsigned __int8 v4 = [(CRLiOSAlignmentToolsController *)v3 viewController];
    [(CRLiOSCanvasViewController *)self presentViewController:v4 animated:1 completion:0];

    mAlignmentController = self->mAlignmentController;
    self->mAlignmentController = v3;
  }
}

- (void)userDismissedAlignmentToolsController:(id)a3
{
  unsigned __int8 v4 = (_TtC8Freeform30CRLiOSAlignmentToolsController *)a3;
  mAlignmentController = v4;
  if (self->mAlignmentController != v4)
  {
    int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA4E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010990E0(v6);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA508);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController userDismissedAlignmentToolsController:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 2439, 0, "expected equality between %{public}s and %{public}s", "alignmentController", "mAlignmentController");

    mAlignmentController = self->mAlignmentController;
  }
  self->mAlignmentController = 0;
}

- (void)alignmentToolsControllerShouldDismiss:(id)a3
{
  unsigned __int8 v4 = (_TtC8Freeform30CRLiOSAlignmentToolsController *)a3;
  mAlignmentController = v4;
  if (self->mAlignmentController != v4)
  {
    int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA528);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099234(v6);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA548);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController alignmentToolsControllerShouldDismiss:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 2444, 0, "expected equality between %{public}s and %{public}s", "alignmentController", "mAlignmentController");

    mAlignmentController = self->mAlignmentController;
  }
  if (mAlignmentController) {
    goto LABEL_21;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EA568);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010991A0();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EA588);
  }
  double v10 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v10);
  }
  double v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController alignmentToolsControllerShouldDismiss:]");
  double v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 2445, 0, "invalid nil value for '%{public}s'", "mAlignmentController");

  if (self->mAlignmentController)
  {
LABEL_21:
    id v13 = [(CRLiOSCanvasViewController *)self presentedViewController];
    double v14 = [(CRLiOSAlignmentToolsController *)self->mAlignmentController viewController];

    if (v13 == v14) {
      [v13 dismissViewControllerAnimated:1 completion:0];
    }
    char v15 = self->mAlignmentController;
    self->mAlignmentController = 0;
  }
}

- (BOOL)inRestrictedGestureMode
{
  v2 = [(CRLiOSCanvasViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v3 = [v2 currentDocumentMode];
    unsigned __int8 v4 = v3;
    if (v3) {
      unsigned __int8 v5 = [v3 wantsCanvasInRestrictedGestureMode];
    }
    else {
      unsigned __int8 v5 = 0;
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)allowGestureInRestrictedGestureMode:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CRLiOSCanvasViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v6 = [v5 currentDocumentMode];
    double v7 = v6;
    if (v6) {
      unsigned __int8 v8 = [v6 allowGestureInRestrictedGestureMode:v4];
    }
    else {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)inInspectorPanZoomMode
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_mDelegate);
  unsigned __int8 v6 = [v5 inInspectorPanZoomMode];

  return v6;
}

- (BOOL)inInspectorTextEditingMode
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_mDelegate);
  unsigned __int8 v6 = [v5 inInspectorTextEditingMode];

  return v6;
}

- (void)addInspectorPanZoomModeGRsToArray:(id)a3
{
  id v7 = a3;
  char v4 = [(CRLiOSCanvasViewController *)self zoomGestureRecognizer];
  [v7 addObject:v4];

  id v5 = [(CRLiOSCanvasViewController *)self singleTapGestureRecognizer];
  [v7 addObject:v5];

  if ([(CRLiOSCanvasViewController *)self inMediaBrowsingMode])
  {
    unsigned __int8 v6 = [(CRLiOSCanvasViewController *)self knobDragGestureRecognizer];
    [v7 addObject:v6];
  }
}

- (BOOL)inMediaBrowsingMode
{
  p_mDelegate = &self->mDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_mDelegate);
  unsigned __int8 v6 = [v5 inMediaBrowsingMode];

  return v6;
}

- (BOOL)documentModeWantsToSuppressMediaReplacementKnobs
{
  return 0;
}

- (void)p_handlePencilDown:(id)a3
{
  p_mICC = &self->mICC;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_mICC);
  id v7 = [(CRLiOSCanvasViewController *)self canvasView];
  [v5 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  [WeakRetained convertBoundsToUnscaledPoint:v9, v11];
  double v13 = v12;
  double v15 = v14;

  id v16 = objc_loadWeakRetained((id *)p_mICC);
  double v17 = [v16 freehandDrawingToolkit];
  id v18 = [v17 freehandDrawingBehaviorForTouchType:2 atUnscaledPoint:v13 v15];

  if (v18 == (id)1)
  {
    id v19 = objc_loadWeakRetained((id *)p_mICC);
    id v20 = [v19 canvasEditor];
    uint64_t v21 = +[NSSet set];
    id v26 = [v20 selectionPathWithInfos:v21];

    id v22 = objc_loadWeakRetained((id *)p_mICC);
    long long v23 = [v22 editorController];
    [v23 setSelectionPath:v26];

    id v24 = objc_loadWeakRetained((id *)p_mICC);
    long long v25 = [v24 freehandDrawingToolkit];
    [v25 beginDrawingModeIfNeededForTouchType:2];
  }
}

- (void)p_handleSingleTapGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  sub_1002469D0(v5, v4);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  unsigned __int8 v6 = v17;
  if (v17)
  {
    BOOL v7 = [v17 state] == (id)4;
    unsigned __int8 v6 = v17;
    if (!v7)
    {
      uint64_t v8 = objc_opt_class();
      double v9 = [(CRLiOSCanvasViewController *)self presentedViewController];
      double v10 = sub_1002469D0(v8, v9);

      if (v10 && ([v10 isBeingDismissed] & 1) == 0)
      {
        [v10 dismissScenesPopover];
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
        [v17 firstTapLocation];
        [WeakRetained convertBoundsToUnscaledPoint:];
        double v13 = v12;
        double v15 = v14;

        if (!-[CRLiOSCanvasViewController handleSingleTapAtPoint:withRecognizer:](self, "handleSingleTapAtPoint:withRecognizer:", v17, v13, v15))
        {
          id v16 = objc_loadWeakRetained((id *)&self->mICC);
          [v16 tappedCanvasBackgroundAtPoint:sub_10036FEA4([v17 touchTypeForTap]) inputType:v13, v15];
        }
      }

      unsigned __int8 v6 = v17;
    }
  }
}

- (void)p_zoomWithGesture:(id)a3
{
  id v4 = a3;
  id v5 = [v4 state];
  if (v5 == (id)3)
  {
    int v9 = 0;
    uint64_t v10 = 2;
  }
  else if (v5 == (id)2)
  {
    int v9 = 1;
    uint64_t v10 = 1;
  }
  else if (v5 == (id)1)
  {
    if (self->mCanvasZoomTracker)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA5A8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010992F4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA5C8);
      }
      unsigned __int8 v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      BOOL v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController p_zoomWithGesture:]");
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 2578, 0, "expected nil value for '%{public}s'", "mCanvasZoomTracker");
    }
    int v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    int v9 = 0;
    uint64_t v10 = 3;
  }
  if (!self->mCanvasZoomTracker)
  {
    double v11 = [CRLCanvasZoomTracker alloc];
    double v12 = [(CRLiOSCanvasViewController *)self canvasLayer];
    double v13 = [(CRLCanvasZoomTracker *)v11 initWithCanvasLayer:v12];
    mCanvasZoomTracker = self->mCanvasZoomTracker;
    self->mCanvasZoomTracker = v13;

    [(CRLCanvasZoomTracker *)self->mCanvasZoomTracker setDelegate:self];
  }
  double v15 = [(CRLiOSCanvasViewController *)self canvasView];
  id v16 = [v15 superview];
  [v4 locationInView:v16];
  double v18 = v17;
  double v20 = v19;

  uint64_t v21 = [(CRLiOSCanvasViewController *)self canvasView];
  id v22 = [(CRLiOSCanvasViewController *)self canvasView];
  long long v23 = [v22 superview];
  [v21 convertPoint:v23 fromView:v18];
  double v25 = v24;
  double v27 = v26;

  if (!v9 || [v4 numberOfTouches] == (id)2 || !objc_msgSend(v4, "numberOfTouches"))
  {
    double v28 = self->mCanvasZoomTracker;
    [v4 scale];
    double v30 = v29;
    [v4 velocity];
    -[CRLCanvasZoomTracker zoomWithScale:velocity:locationInView:phase:](v28, "zoomWithScale:velocity:locationInView:phase:", v10, v30, v31, v25, v27);
  }
}

- (void)canvasZoomTracker:(id)a3 willBeginViewScaleFeedbackWithZoomMethod:(int64_t)a4
{
  id v40 = [(CRLiOSCanvasViewController *)self canvasView];
  unsigned __int8 v6 = self->mZoomGestureRecognizer;
  BOOL v7 = v6;
  self->mCanvasZoomMethod = a4;
  if (a4 || [(CRLiOSCanvasZoomPinchGestureRecognizer *)v6 numberOfTouches] != (id)2)
  {
    id v16 = [v40 enclosingScrollView];
    [v16 center];
    double v18 = v17;
    double v20 = v19 + -120.0;
    uint64_t v21 = [v16 superview];
    [v21 convertPoint:v40 toView:v18];
    double v13 = v22;
    double v15 = v23;

    double v11 = v15;
    double v9 = v13;
  }
  else
  {
    [(CRLiOSCanvasZoomPinchGestureRecognizer *)v7 locationOfTouch:0 inView:v40];
    double v9 = v8;
    double v11 = v10;
    [(CRLiOSCanvasZoomPinchGestureRecognizer *)v7 locationOfTouch:1 inView:v40];
    double v13 = v12;
    double v15 = v14;
  }
  double v24 = sub_100064698(v9, v11, v13);
  double v26 = sub_1000646A4(v24, v25, 0.5);
  double v28 = v27;
  if (vabdd_f64(v9, v13) >= 40.0)
  {
    if (v9 >= v13) {
      double v29 = v9;
    }
    else {
      double v29 = v13;
    }
    if (v9 >= v13) {
      double v30 = v11;
    }
    else {
      double v30 = v15;
    }
    if (v9 >= v13) {
      double v31 = v13;
    }
    else {
      double v31 = v9;
    }
    double v32 = sub_100064680(v29, v30, v31);
    double v34 = sub_100065C1C(v32, v33);
    double v35 = sub_1000662E0(v34 + -1.57079633);
    double v37 = sub_1000646A4(v35, v36, 120.0);
    double v26 = sub_100064698(v26, v28, v37);
    double v28 = v38;
  }
  self->mLastZoomHUDLocation.CGFloat x = sub_1000674F0(v26, v28);
  self->mLastZoomHUDLocation.CGFloat y = v39;
}

- (void)canvasZoomTracker:(id)a3 willUpdateViewScaleFeedbackWithScale:(double)a4
{
  id v19 = [(CRLiOSCanvasViewController *)self canvasLayer];
  [v19 minimumPinchViewScale];
  double v7 = v6;
  [v19 maximumPinchViewScale];
  double v9 = sub_100407E48(a4, v7, v8);
  double v10 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  double v11 = [v10 i_descriptionForViewScale:self->mCanvasZoomMethod zoomMethod:v9];

  double v12 = [(CRLiOSCanvasViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v13 = [(CRLiOSCanvasViewController *)self delegate];
    char v14 = [v13 allowsZoomHUD] ^ 1;
  }
  else
  {
    char v14 = 0;
  }

  id v15 = [v11 length];
  id v16 = +[CRLCanvasHUDController sharedHUDController];
  double v17 = v16;
  if (!v15 || (v14 & 1) != 0)
  {
    [v16 hideHUDForKey:self];
  }
  else
  {
    [v16 setLabelText:v11];

    double v17 = +[CRLCanvasHUDController sharedHUDController];
    double v18 = [(CRLiOSCanvasViewController *)self canvasView];
    [v17 showHUDForKey:self forTouchPoint:v18 inCanvasView:self->mLastZoomHUDLocation.x, self->mLastZoomHUDLocation.y, 0.0];
  }
}

- (void)canvasZoomTrackerDidEndViewScaleFeedback:(id)a3
{
  id v4 = +[CRLCanvasHUDController sharedHUDController];
  [v4 hideHUDForKey:self];
}

- (CGRect)rectToIncludeWhenGrowingCanvasToFitContent
{
  mCanvasZoomTracker = self->mCanvasZoomTracker;
  if (mCanvasZoomTracker)
  {
    [(CRLCanvasZoomTracker *)mCanvasZoomTracker visibleUnscaledBoundsAtEndOfZoom];
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)canvasZoomTrackerWillBeginFinalZoomAnimation:(id)a3
{
  id v4 = [(CRLiOSCanvasViewController *)self crl_windowWrapper];
  id v5 = [v4 newWrapperBeginningIgnoringUserInteractionSafely];

  [(CRLiOSCanvasViewController *)self setZoomTrackerIgnoreInteractionEventsSafeWrapper:v5];
}

- (void)canvasZoomTrackerDidEndFinalZoomAnimation:(id)a3
{
  id v4 = [(CRLiOSCanvasViewController *)self zoomTrackerIgnoreInteractionEventsSafeWrapper];
  [v4 endIgnoringUserInteractionSafely];

  [(CRLiOSCanvasViewController *)self setZoomTrackerIgnoreInteractionEventsSafeWrapper:0];
}

- (void)canvasZoomTrackerDidFinish:(id)a3
{
  [(CRLCanvasZoomTracker *)self->mCanvasZoomTracker setDelegate:0];
  mCanvasZoomTracker = self->mCanvasZoomTracker;
  self->mCanvasZoomTracker = 0;
}

- (id)p_willPresentError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 localizedRecoveryOptions];
  id v5 = v4;
  if (v4 && [v4 count])
  {
    double v6 = [v3 recoveryAttempter];
    if (!v6 || (objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      double v7 = [v3 userInfo];
      id v8 = [v7 mutableCopy];

      [v8 removeObjectForKey:NSLocalizedRecoverySuggestionErrorKey];
      [v8 removeObjectForKey:NSLocalizedRecoveryOptionsErrorKey];
      [v8 removeObjectForKey:NSRecoveryAttempterErrorKey];
      double v9 = [v3 domain];
      uint64_t v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, [v3 code], v8);

      id v3 = (id)v10;
    }
  }

  return v3;
}

- (void)presentError:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  double v7 = [(CRLiOSCanvasViewController *)self p_willPresentError:a3];
  id v8 = +[CRLSelectionAwareAlertController crl_alertControllerWithError:v7 preferredStyle:1 completion:v6];

  if (qword_101719A88 != -1) {
    dispatch_once(&qword_101719A88, &stru_1014EA5E8);
  }
  double v9 = off_10166B4B8;
  if (os_log_type_enabled((os_log_t)off_10166B4B8, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = v9;
    double v11 = [v8 title];
    double v12 = [v8 message];
    *(_DWORD *)buf = 138412546;
    double v18 = v11;
    __int16 v19 = 2112;
    double v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "title: %@, message: %@", buf, 0x16u);
  }
  double v13 = [(CRLiOSCanvasViewController *)self presentedViewController];
  unsigned __int8 v14 = [v13 isBeingDismissed];
  if (!v13 || (v14 & 1) != 0)
  {
    [(CRLiOSCanvasViewController *)self presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002CC23C;
    void v15[3] = &unk_1014CBE78;
    v15[4] = self;
    id v16 = v8;
    [(CRLiOSCanvasViewController *)self dismissViewControllerAnimated:1 completion:v15];
  }
}

- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] == (id)1)
  {
    double v11 = [v8 firstObject];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002CC480;
    v20[3] = &unk_1014CE158;
    double v12 = &v21;
    id v21 = v10;
    double v13 = +[CRLSelectionAwareAlertController crl_alertControllerWithError:v11 preferredStyle:1 completion:v20];
  }
  else
  {
    double v13 = +[CRLSelectionAwareAlertController alertControllerWithTitle:v9 message:0 preferredStyle:1];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1002CC498;
    v18[3] = &unk_1014D1290;
    double v12 = &v19;
    id v19 = v10;
    [v13 crl_addSimpleOKButtonWithHandler:v18];
  }

  unsigned __int8 v14 = [(CRLiOSCanvasViewController *)self presentedViewController];
  id v15 = v14;
  if (v14 && ([v14 isBeingDismissed] & 1) == 0)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1002CC4B0;
    v16[3] = &unk_1014CBE78;
    v16[4] = self;
    id v17 = v13;
    [(CRLiOSCanvasViewController *)self dismissViewControllerAnimated:1 completion:v16];
  }
  else
  {
    [(CRLiOSCanvasViewController *)self presentViewController:v13 animated:1 completion:0];
  }
}

- (id)beginModalOperationWithLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA608);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109941C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA628);
    }
    double v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController beginModalOperationWithLocalizedMessage:progress:cancelHandler:]");
    double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 2774, 0, "Modal operations must be started on the main thread,");
  }
  unsigned __int8 v14 = [(CRLiOSCanvasViewController *)self userDialogPresenter];
  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA648);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099388();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA668);
    }
    id v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController beginModalOperationWithLocalizedMessage:progress:cancelHandler:]");
    id v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 2778, 0, "invalid nil value for '%{public}s'", "modalOperationPresenter");
  }
  double v18 = [v14 beginModalOperationWithLocalizedMessage:v8 progress:v9 cancelHandler:v10];

  return v18;
}

- (id)beginModalOperationWithPresentedLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA688);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099538();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA6A8);
    }
    double v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController beginModalOperationWithPresentedLocalizedMessage:progress:cancelHandler:]");
    double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 2785, 0, "Modal operations must be started on the main thread,");
  }
  unsigned __int8 v14 = [(CRLiOSCanvasViewController *)self userDialogPresenter];
  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA6C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010994A4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA6E8);
    }
    id v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController beginModalOperationWithPresentedLocalizedMessage:progress:cancelHandler:]");
    id v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 2789, 0, "invalid nil value for '%{public}s'", "modalOperationPresenter");
  }
  double v18 = [v14 beginModalOperationWithPresentedLocalizedMessage:v8 progress:v9 cancelHandler:v10];

  return v18;
}

- (void)endModalOperationWithToken:(id)a3
{
  id v4 = a3;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA708);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099654();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA728);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController endModalOperationWithToken:]");
    double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 2795, 0, "Modal operations must be ended on the main thread,");
  }
  id v8 = [(CRLiOSCanvasViewController *)self userDialogPresenter];
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA748);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010995C0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA768);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController endModalOperationWithToken:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 2799, 0, "invalid nil value for '%{public}s'", "modalOperationPresenter");
  }
  [v8 endModalOperationWithToken:v4];
}

- (void)continueAsynchronousWorkOnMainThreadUsingBlock:(id)a3
{
}

- (void)presentMediaCompatibilityAlertWithReasons:(int64_t)a3 forMediaType:(int64_t)a4 forSingleMediaObject:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = [(CRLiOSCanvasViewController *)self userDialogPresenter];
  [v11 presentMediaCompatibilityAlertWithReasons:a3 forMediaType:a4 forSingleMediaObject:v6 completionHandler:v10];
}

- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 knobValidatorBlock];
  id v10 = [(CRLiOSCanvasViewController *)self knobDragGestureRecognizer];
  [v10 setKnobValidatorBlock:v9];

  if ([v7 wantsToSuppressMiniFormatter]
    && ([v8 wantsToSuppressMiniFormatter] & 1) == 0)
  {
    id v11 = [(CRLiOSCanvasViewController *)self miniFormatterPresenter];
    [v11 dismissMiniFormatter];
    goto LABEL_7;
  }
  if (([v7 wantsToSuppressMiniFormatter] & 1) == 0
    && [v8 wantsToSuppressMiniFormatter])
  {
    id v11 = [(CRLiOSCanvasViewController *)self miniFormatterPresenter];
    double v12 = [(CRLiOSCanvasViewController *)self editorController];
    double v13 = [v12 selectionPath];
    [v11 presentMiniFormatterForSelectionPath:v13];

LABEL_7:
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unsigned __int8 v14 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v15 = [v14 canvas];
  id v16 = [v15 topLevelReps];

  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * i) recursivelyPerformSelector:"documentModeDidChange"];
      }
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v18);
  }
}

- (_TtC8Freeform28CRLiOSMiniFormatterPresenter)miniFormatterPresenter
{
  miniFormatterPresenter = self->_miniFormatterPresenter;
  if (!miniFormatterPresenter)
  {
    if (self->mHasBeenTornDown)
    {
      miniFormatterPresenter = 0;
    }
    else
    {
      id v4 = [_TtC8Freeform28CRLiOSMiniFormatterPresenter alloc];
      id v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
      BOOL v6 = [v5 editorController];
      id v7 = [(CRLiOSMiniFormatterPresenter *)v4 initWithEditorController:v6 canvasLayerHosting:self];
      id v8 = self->_miniFormatterPresenter;
      self->_miniFormatterPresenter = v7;

      miniFormatterPresenter = self->_miniFormatterPresenter;
    }
  }

  return miniFormatterPresenter;
}

- (void)updateToolbarButtons
{
  id v3 = [(CRLiOSCanvasViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CRLiOSCanvasViewController *)self delegate];
    [v5 updateToolbarButtons];
  }
}

- (BOOL)p_shouldShowMiniFormatterForSelectionPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  unsigned __int8 v6 = [v5 documentIsSharedReadOnly];

  if (v6) {
    goto LABEL_3;
  }
  id v7 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v8 = [v7 layerHost];
  id v9 = [v8 asiOSCVC];
  unsigned __int8 v10 = [v9 isCurrentlyInQuickSelectMode];

  if (v10)
  {
LABEL_3:
    BOOL v11 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
    double v13 = [WeakRetained selectionModelTranslator];
    unsigned __int8 v14 = [v13 boardItemsForSelectionPath:v4];

    BOOL v11 = [v14 count] != 0;
  }

  return v11;
}

- (CRLiOSPencilMediating)pencilMediator
{
  mPencilMediator = self->mPencilMediator;
  if (!mPencilMediator)
  {
    id v4 = [_TtC8Freeform20CRLiOSPencilMediator alloc];
    id v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    unsigned __int8 v6 = [(CRLiOSPencilMediator *)v4 initWithInteractiveCanvasController:v5];
    id v7 = self->mPencilMediator;
    self->mPencilMediator = v6;

    mPencilMediator = self->mPencilMediator;
  }

  return (CRLiOSPencilMediating *)mPencilMediator;
}

- (BOOL)shouldSelectAndScrollWithApplePencil
{
  v2 = [(CRLiOSCanvasViewController *)self delegate];
  if (!v2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA788);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010996DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA7A8);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController shouldSelectAndScrollWithApplePencil]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 2876, 0, "invalid nil value for '%{public}s'", "delegate");
  }
  unsigned __int8 v6 = [v2 shouldSelectAndScrollWithApplePencil];

  return v6;
}

- (BOOL)shouldPreventDefaultPencilBehaviors
{
  signed int v2 = atomic_load((unsigned int *)&self->mPreventStandardPencilBehaviorsCounter);
  return v2 > 0;
}

- (void)beginPreventingDefaultPencilBehaviors
{
}

- (void)endPreventingDefaultPencilBehaviors
{
  if (!atomic_fetch_add(&self->mPreventStandardPencilBehaviorsCounter, 0xFFFFFFFF))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA7C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099770();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA7E8);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController endPreventingDefaultPencilBehaviors]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:2891 isFatal:0 description:"Uneven calls to begin/endPreventingDefaultPencilBehaviors!"];

    atomic_fetch_add(&self->mPreventStandardPencilBehaviorsCounter, 1u);
  }
}

- (BOOL)isShowingRadialPalette
{
  signed int v2 = [(CRLiOSCanvasViewController *)self view];
  id v3 = [v2 window];
  id v4 = [v3 windowScene];

  if (v4)
  {
    id v5 = +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:v4];
    unsigned __int8 v6 = [v5 _paletteViewVisible];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)p_handleSqueezePaletteViewWillShowNotification:(id)a3
{
  p_mICC = &self->mICC;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);
  id v5 = [WeakRetained layerHost];
  unsigned __int8 v6 = [v5 asiOSCVC];
  id v7 = [v6 delegate];
  id v8 = [v7 currentDocumentMode];
  id v9 = [v8 pencilModeType];

  if (!v9)
  {
    id v11 = objc_loadWeakRetained((id *)p_mICC);
    unsigned __int8 v10 = [v11 freehandDrawingToolkit];
    [v10 beginDrawingModeIfNeededForTouchType:2];
  }
}

- (void)i_startObservingFreehandDrawingToolkit
{
  id v4 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v3 = [v4 freehandDrawingToolkit];
  [v3 addToolkitObserver:self];
}

- (BOOL)isHandlingScribbleWriting
{
  id v3 = [(CRLiOSCanvasViewController *)self scribbleInteraction];
  if ([v3 isHandlingWriting])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(CRLiOSCanvasViewController *)self directScribbleInteraction];
    unsigned __int8 v4 = [v5 isHandlingWriting];
  }
  return v4;
}

- (UIView)presentedHUDView
{
  return (UIView *)[(CRLiOSQuickSelectViewController *)self->mQuickSelectViewController view];
}

- (UITextInput)currentEditingTextInputResponder
{
  signed int v2 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v3 = [v2 textInputResponder];
  unsigned __int8 v4 = [v3 editor];
  id v5 = (objc_class *)objc_opt_class();
  id v11 = sub_100246E2C(v4, v5, 1, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLEditor);

  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    double v13 = [v2 editorController];
    unsigned __int8 v14 = [v13 selectionForEditor:v11];
    id v15 = sub_1002469D0(v12, v14);

    if (v15 && [v15 range] != (id)0x7FFFFFFFFFFFFFFFLL) {
      id v16 = v3;
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return (UITextInput *)v16;
}

- (BOOL)p_scribblePreventedRegardlessOfPoint
{
  id v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  if (([v3 editingDisabled] & 1) != 0
    || ([v3 isInDynamicOperation] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v4 = [(CRLiOSCanvasViewController *)self shouldPreventDefaultPencilBehaviors];
  }

  return v4;
}

- (BOOL)shouldBeginScribblingAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(CRLiOSCanvasViewController *)self p_scribblePreventedRegardlessOfPoint])
  {
    uint64_t v7 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    [v7 convertBoundsToUnscaledPoint:x, y];
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = [(CRLiOSCanvasViewController *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      unsigned __int8 v14 = [(CRLiOSCanvasViewController *)self delegate];
      id v15 = [v14 currentDocumentMode];
      id v16 = [v15 pencilModeType];

      if (v16 == (id)1) {
        goto LABEL_9;
      }
      if (v16 == (id)2)
      {
LABEL_7:
        uint64_t v19 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
        double v20 = [v19 hitKnobAtPoint:2 inputType:0 returningRep:v9 v11];

        if ([v20 worksWithStylus])
        {
          BOOL v6 = 0;
        }
        else
        {
          long long v21 = [v7 hitRep:v9, v11];
          long long v22 = v21;
          if (v21
            && (objc_msgSend(v21, "convertNaturalPointFromUnscaledCanvas:", v9, v11),
                !objc_msgSend(v22, "shouldBeginScribbleAtPoint:")))
          {
            BOOL v6 = 0;
          }
          else if (-[CRLiOSCanvasViewController touchHitsCanvasViewAtPoint:](self, "touchHitsCanvasViewAtPoint:", x, y))
          {
            BOOL v6 = 1;
          }
          else
          {
            BOOL v6 = -[CRLiOSCanvasViewController allowTouchOutsideCanvasViewAtPoint:forGesture:](self, "allowTouchOutsideCanvasViewAtPoint:forGesture:", 0, x, y);
          }
        }
        goto LABEL_18;
      }
    }
    id v17 = [(CRLiOSCanvasViewController *)self pencilMediator];
    id v18 = [v17 pencilBehaviorOutsideModesAtUnscaledPoint:v9, v11];

    if (v18 == (id)2) {
      goto LABEL_7;
    }
LABEL_9:
    BOOL v6 = 0;
LABEL_18:

    return v6;
  }
  return 0;
}

- (id)containedScribbleElementForContainerScribbleElement:(id)a3
{
  double v8 = sub_100246AC8(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)&OBJC_PROTOCOL___CRLWPContainerTextEditingRep);
  double v9 = v8;
  if (v8)
  {
    double v10 = [v8 containedRep];
    double v11 = [v10 scribbleCapableElements];
    uint64_t v12 = [v11 lastObject];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)wantsSystemInputAssistantForScribble
{
  return 0;
}

- (id)scribbleCapableElementsForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(CRLiOSCanvasViewController *)self p_scribblePreventedRegardlessOfPoint])
  {
    double v8 = &__NSArray0__struct;
  }
  else
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    double v10 = [(CRLiOSCanvasViewController *)self p_allRepsForHitTestingOrdered];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v18 = v11;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v10);
          }
          long long v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v22 = sub_100246AC8(v21, 1, v12, v13, v14, v15, v16, v17, (uint64_t)&OBJC_PROTOCOL___CRLiOSScribbleElementProvider);
          if (v22
            && ([v21 isLocked] & 1) == 0
            && [(CRLiOSCanvasViewController *)self shouldIncludeObjectInScribbleCapableElements:v22])
          {
            [v9 addObject:v22];
          }
        }
        id v18 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v18);
    }
    double v8 = -[CRLiOSCanvasViewController _scribbleCapableElementsForReps:forRect:](self, "_scribbleCapableElementsForReps:forRect:", v9, x, y, width, height);
  }

  return v8;
}

- (id)p_allRepsForHitTestingOrdered
{
  signed int v2 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  uint64_t v3 = [v2 canvas];
  uint64_t v4 = [v3 topLevelReps];
  id v5 = [v4 mutableCopy];

  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v5 objectAtIndexedSubscript:v6];
      double v8 = [v7 childRepsForHitTesting];

      id v9 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", ++v6, [v8 count]);
      [v5 insertObjects:v8 atIndexes:v9];
    }
    while (v6 < (unint64_t)[v5 count]);
  }
  id v10 = [v5 copy];

  return v10;
}

- (BOOL)shouldIncludeObjectInScribbleCapableElements:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = sub_1002469D0(v4, v3);

  uint64_t v12 = sub_100246AC8(v5, 1, v6, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLWPContainerTextEditingRep);
  uint64_t v13 = [v5 parentRep];
  double v20 = sub_100246AC8(v13, 1, v14, v15, v16, v17, v18, v19, (uint64_t)&OBJC_PROTOCOL___CRLWPContainerTextEditingRep);

  if (v20) {
    BOOL v21 = v12 == 0;
  }
  else {
    BOOL v21 = 0;
  }
  BOOL v22 = !v21;

  return v22;
}

- (id)scribbleCapableElementWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([(CRLiOSCanvasViewController *)self p_scribblePreventedRegardlessOfPoint])
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    uint64_t v7 = [v6 canvas];
    uint64_t v8 = [v7 allRepsOrdered];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v10)
    {
      id v17 = v10;
      uint64_t v18 = *(void *)v41;
      uint64_t v19 = &off_101557000;
      uint64_t v33 = *(void *)v41;
      id v34 = v9;
      while (2)
      {
        double v20 = 0;
        id v35 = v17;
        do
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(v9);
          }
          uint64_t v21 = sub_100246AC8(*(void **)(*((void *)&v40 + 1) + 8 * (void)v20), 1, v11, v12, v13, v14, v15, v16, (uint64_t)v19[464]);
          if (v21)
          {
            BOOL v22 = (void *)v21;
            if (objc_opt_respondsToSelector())
            {
              id v23 = [v22 scribbleCapableElementWithIdentifier:v4];
              if (v23) {
                goto LABEL_28;
              }
            }
            else
            {
              long long v24 = [v22 scribbleCapableElements];
              long long v36 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              id v25 = v24;
              id v23 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
              if (v23)
              {
                uint64_t v26 = *(void *)v37;
                while (2)
                {
                  for (i = 0; i != v23; i = (char *)i + 1)
                  {
                    if (*(void *)v37 != v26) {
                      objc_enumerationMutation(v25);
                    }
                    double v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                    double v29 = [v28 scribbleIdentifier];
                    unsigned int v30 = [v29 isEqual:v4];

                    if (v30)
                    {
                      id v23 = v28;
                      goto LABEL_22;
                    }
                  }
                  id v23 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
                  if (v23) {
                    continue;
                  }
                  break;
                }
LABEL_22:
                uint64_t v18 = v33;
                id v9 = v34;
                uint64_t v19 = &off_101557000;
                id v17 = v35;
              }

              if (v23)
              {
LABEL_28:
                id v31 = v23;

                id v5 = v31;
                goto LABEL_29;
              }
            }
          }
          double v20 = (char *)v20 + 1;
        }
        while (v20 != v17);
        id v17 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    id v5 = 0;
    id v31 = v9;
LABEL_29:
  }

  return v5;
}

- (id)_scribbleCapableElementsForReps:(id)a3 forRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v15 = [v14 scribbleCapableElementsForRect:x, y, width, height];
          [v9 crl_addObjectsFromNonNilArray:v15];
        }
        else
        {
          uint64_t v15 = [v14 scribbleCapableElements];
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v24;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v24 != v18) {
                  objc_enumerationMutation(v15);
                }
                double v20 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
                [v20 scaledScribbleEditingFrame];
                v35.origin.double x = x;
                v35.origin.double y = y;
                v35.size.double width = width;
                v35.size.double height = height;
                if (CGRectIntersectsRect(v34, v35)) {
                  [v9 crl_addNonNilObject:v20];
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v17);
          }
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  return v9;
}

- (void)scribbleInteractionWillBeginWritingScribbleElementWillBeInserted:(BOOL)a3
{
  id v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  uint64_t v6 = [v5 textInputResponder];
  [v6 scribbleWillBegin];

  if (!a3)
  {
    [(CRLiOSCanvasViewController *)self p_schedulePreventInsertScribbleElementTimer];
  }
}

- (void)scribbleInteractionDidFinishWriting
{
  [(CRLiOSCanvasViewController *)self p_schedulePreventInsertScribbleElementTimer];
  id v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v4 = [v3 textInputResponder];
  [v4 reloadInputViews];

  if (![(CRLiOSCanvasViewController *)self wantsSystemInputAssistantForScribble])
  {
    id v5 = [(CRLiOSCanvasViewController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [(CRLiOSCanvasViewController *)self delegate];
      [v7 beginHandwritingModeIfNeeded];
    }
    id v8 = [(CRLiOSCanvasViewController *)self pencilMediator];
    if (!v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA808);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010997F8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EA828);
      }
      id v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController scribbleInteractionDidFinishWriting]");
      id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 3180, 0, "invalid nil value for '%{public}s'", "pencilMediator");
    }
    [v8 markPencilUsedForMode:2];
    uint64_t v12 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    uint64_t v13 = [v12 textInputResponder];
    [v13 scribbleDidEnd];
  }
}

- (void)p_schedulePreventInsertScribbleElementTimer
{
  id v3 = [(CRLiOSCanvasViewController *)self preventInsertScribbleElementTimer];
  [v3 invalidate];

  objc_initWeak(&location, self);
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  uint64_t v7 = sub_1002CED58;
  id v8 = &unk_1014EA850;
  objc_copyWeak(&v9, &location);
  id v4 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v5 block:2.5];
  -[CRLiOSCanvasViewController setPreventInsertScribbleElementTimer:](self, "setPreventInsertScribbleElementTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (CGRect)rectForInsertingScribbleElements
{
  signed int v2 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  [v2 visibleBoundsRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BOOL)canInsertScribbleElementAtPoint:(CGPoint)a3
{
  BOOL v4 = -[CRLiOSCanvasViewController shouldBeginScribblingAtPoint:](self, "shouldBeginScribblingAtPoint:", a3.x, a3.y);
  if (v4)
  {
    double v5 = [(CRLiOSCanvasViewController *)self preventInsertScribbleElementTimer];

    LOBYTE(v4) = v5 == 0;
  }
  return v4;
}

- (id)insertedScribbleElementAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[CRLiOSCanvasViewController canInsertScribbleElementAtPoint:](self, "canInsertScribbleElementAtPoint:"))
  {
    double v6 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    [v6 convertBoundsToUnscaledPoint:x, y];
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = objc_opt_class();
    double v12 = -[CRLiOSCanvasViewController insertTextBoxForScribbleAtUnscaledCanvasPoint:](self, "insertTextBoxForScribbleAtUnscaledCanvasPoint:", v8, v10);
    double v13 = sub_1002469D0(v11, v12);

    double v14 = [v13 scribbleCapableElements];
    uint64_t v15 = [v14 firstObject];

    id v16 = [v15 scribbleEditingBlock];

    if (v16)
    {
      id v17 = [v15 scribbleEditingBlock];
      v17[2](v17, 0, v8, v10);
    }
    [(CRLiOSCanvasViewController *)self p_schedulePreventInsertScribbleElementTimer];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)insertTextBoxForScribbleAtUnscaledCanvasPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  double v6 = [v5 commandController];
  [v6 openGroup];
  [v6 enableProgressiveEnqueuingInCurrentGroup];
  double v7 = [v5 editingCoordinator];
  double v8 = [v7 boardItemFactory];
  double v9 = [v8 makeShapeItemWithShapeType:0];

  uint64_t v10 = +[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:", 1, 0, 0, 0, x, y);
  uint64_t v11 = [v5 canvasEditor];
  uint64_t v47 = v9;
  double v12 = +[NSArray arrayWithObjects:&v47 count:1];
  [v11 prepareGeometryForInsertingBoardItems:v12 withInsertionContext:v10];

  double v13 = [v5 canvasEditor];
  uint64_t v46 = v9;
  double v14 = +[NSArray arrayWithObjects:&v46 count:1];
  long long v39 = (void *)v10;
  [v13 insertBoardItems:v14 withInsertionContext:v10 postProcessBlock:0];

  uint64_t v15 = (objc_class *)objc_opt_class();
  id v16 = sub_10024715C(v15, v9);
  id v17 = [v16 text];
  if (v17)
  {
    uint64_t v18 = [_TtC8Freeform23CRLWPReplaceTextCommand alloc];
    id v19 = [v17 range];
    uint64_t v21 = -[CRLWPReplaceTextCommand initWithShapeItem:range:text:](v18, "initWithShapeItem:range:text:", v16, v19, v20, &stru_101538650);
    [v6 enqueueCommand:v21];
  }
  long long v40 = v16;
  [v6 closeGroup];
  BOOL v22 = [v5 canvas];
  [v22 layoutInvalidated];

  [v5 layoutIfNeeded];
  long long v23 = [v5 canvas];
  long long v24 = [v23 allRepsOrdered];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v25 = v24;
  id v26 = [v25 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v42;
LABEL_5:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v42 != v28) {
        objc_enumerationMutation(v25);
      }
      long long v30 = *(void **)(*((void *)&v41 + 1) + 8 * v29);
      id v31 = [v30 info];

      if (v31 == v9) {
        break;
      }
      if (v27 == (id)++v29)
      {
        id v27 = [v25 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v27) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    uint64_t v33 = objc_opt_class();
    CGRect v34 = sub_1002469D0(v33, v30);

    double v32 = v39;
    if (v34) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_11:

    double v32 = v39;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EA870);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10109988C();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EA890);
  }
  CGRect v35 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v35);
  }
  long long v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasViewController insertTextBoxForScribbleAtUnscaledCanvasPoint:]");
  long long v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasViewController.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v37, 3267, 0, "invalid nil value for '%{public}s'", "result");

  CGRect v34 = 0;
LABEL_22:

  return v34;
}

- (void)insertStencilFromLibrary:(id)a3
{
  id v4 = (id)objc_opt_new();
  [(CRLiOSCanvasViewController *)self p_presentStencilLibraryWithBoardItemsToSave:v4];
}

- (void)saveSelectedBoardItemsAsStencil:(id)a3
{
  id v8 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v4 = [v8 selectionModelTranslator];
  double v5 = [v8 editorController];
  double v6 = [v5 selectionPath];
  double v7 = [v4 unlockedBoardItemsForSelectionPath:v6];

  [(CRLiOSCanvasViewController *)self p_presentStencilLibraryWithBoardItemsToSave:v7];
}

- (void)p_presentStencilLibraryWithBoardItemsToSave:(id)a3
{
  id v4 = a3;
  double v5 = [_TtC8Freeform34CRLiOSStencilLibraryViewController alloc];
  double v6 = [(CRLiOSCanvasViewController *)self editingCoordinator];
  double v7 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v8 = [(CRLiOSStencilLibraryViewController *)v5 initWithEditingCoordinator:v6 interactiveCanvasController:v7 boardItemsToSave:v4];

  [(CRLiOSStencilLibraryViewController *)v8 setModalPresentationStyle:2];
  [(CRLiOSStencilLibraryViewController *)v8 setModalInPresentation:1];
  [(CRLiOSCanvasViewController *)self presentViewController:v8 animated:1 completion:&stru_1014EA8B0];
}

- (Class)movieInspectorPaneClass
{
  return 0;
}

- (Class)audioInspectorPaneClass
{
  return 0;
}

- (Class)webVideoInspectorPaneClass
{
  return 0;
}

- (Class)taggedPlaceholderInfoPaneClass
{
  return 0;
}

- (Class)recordingInspectorPaneClass
{
  return 0;
}

- (CRLCanvasImageHUDController)imageHUDController
{
  mImageHUDOnce = self->mImageHUDOnce;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002CF75C;
  v5[3] = &unk_1014CBBB0;
  v5[4] = self;
  [(CRLOnce *)mImageHUDOnce performBlockOnce:v5];
  return self->mImageHUDController;
}

- (BOOL)preserveEditorSelection
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLiOSCanvasViewController *)self delegate];
  double v5 = sub_1002469D0(v3, v4);

  uint64_t v6 = [v5 presentedViewController];
  if (!v6)
  {
    uint64_t v10 = [(CRLiOSCanvasViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = [(CRLiOSCanvasViewController *)self delegate];
      unsigned __int8 v12 = [v11 preserveEditorSelection];

      if (v12) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    double v13 = [(CRLiOSCanvasViewController *)self crl_windowWrapper];
    if ([v13 isInSplitViewMode])
    {
      unsigned __int8 v14 = [(CRLiOSCanvasViewController *)self shouldPreserveEditorSelectionInSplitViewMode];

      if (v14)
      {
LABEL_11:
        unsigned __int8 v8 = 1;
        goto LABEL_4;
      }
    }
    else
    {
    }
    uint64_t v15 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    id v16 = [v15 editorController];
    double v7 = [v16 textInputEditor];

    if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
      unsigned __int8 v8 = [v7 wantsToPreserveEditorSelection];
    }
    else {
      unsigned __int8 v8 = 0;
    }
    goto LABEL_3;
  }
  double v7 = (void *)v6;
  unsigned __int8 v8 = 1;
LABEL_3:

LABEL_4:
  return v8;
}

- (BOOL)shouldPreserveEditorSelectionInSplitViewMode
{
  return 1;
}

- (BOOL)shouldIgnoreKeyboardInput
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLiOSCanvasViewController *)self delegate];
  double v5 = sub_1002469D0(v3, v4);

  uint64_t v6 = [v5 presentedViewController];
  if (v6)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    p_mDelegate = &self->mDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_mDelegate);
    if (objc_opt_respondsToSelector())
    {
      id v10 = objc_loadWeakRetained((id *)p_mDelegate);
      unsigned __int8 v7 = [v10 printerOptionsShowing];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  uint64_t v11 = [v5 presentedViewController];
  int64_t v12 = +[CRLPresentedPopoverTextEditingBehaviorProvidingSwiftHelper allowTextInputWhilePresentingFor:v11];

  if (v12 == 2) {
    BOOL v13 = v7;
  }
  else {
    BOOL v13 = v12 == 0;
  }

  return v13;
}

- (BOOL)shouldPreventBecomingFirstResponderOnViewLoad
{
  return 0;
}

- (BOOL)becomeFirstResponderIfAppropriate
{
  uint64_t v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v4 = [v3 textInputResponder];
  unsigned __int8 v5 = [v4 isFirstResponder];

  if (v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  unsigned __int8 v7 = [v6 textInputResponder];
  unsigned int v8 = [v7 canBecomeFirstResponder];

  if (v8)
  {
    double v9 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
    id v10 = [v9 textInputResponder];
    unsigned __int8 v11 = [v10 becomeFirstResponder];

    if (v11) {
      goto LABEL_5;
    }
  }
  if ([(CRLiOSCanvasViewController *)self isFirstResponder])
  {
LABEL_5:
    LOBYTE(v12) = 1;
  }
  else
  {
    unsigned int v12 = [(CRLiOSCanvasViewController *)self canBecomeFirstResponder];
    if (v12)
    {
      LOBYTE(v12) = [(CRLiOSCanvasViewController *)self becomeFirstResponder];
    }
  }
  return v12;
}

- (BOOL)allowsCanvasScrollingFromKeyboard
{
  uint64_t v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v4 = [v3 editorController];
  unsigned __int8 v5 = [v4 selectionPath];
  uint64_t v6 = [v3 canvasEditor];
  unsigned __int8 v7 = [v6 selectionPathWithInfo:0];
  unsigned __int8 v8 = [v5 isEqual:v7];

  double v9 = [(CRLiOSCanvasViewController *)self canvasView];
  id v10 = [v9 enclosingScrollView];

  [v10 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [v10 contentSize];
  double v20 = v19;
  double v22 = v21;
  v26.origin.double x = v12;
  v26.origin.double y = v14;
  v26.size.double width = v16;
  v26.size.double height = v18;
  if (v20 <= CGRectGetWidth(v26))
  {
    v27.origin.double x = v12;
    v27.origin.double y = v14;
    v27.size.double width = v16;
    v27.size.double height = v18;
    BOOL v23 = v22 > CGRectGetHeight(v27);
  }
  else
  {
    BOOL v23 = 1;
  }
  BOOL v24 = v8 & v23;

  return v24;
}

- (BOOL)allowUndoRedoOperations
{
  uint64_t v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  id v4 = [v3 tmCoordinator];
  unsigned __int8 v5 = [v4 controllingTM];

  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      [v3 isInDynamicOperation];
      LOBYTE(v7) = 0;
      goto LABEL_9;
    }
    char v6 = [v5 allowUndoRedoOperations] ^ 1;
  }
  else
  {
    char v6 = 0;
  }
  LOBYTE(v7) = 0;
  if (([v3 isInDynamicOperation] & 1) == 0 && (v6 & 1) == 0) {
    unsigned int v7 = ![(CRLiOSCanvasViewController *)self shouldIgnoreKeyboardInput];
  }
LABEL_9:

  return v7;
}

- (BOOL)allowOpenLinkOnSingleTapForRepWhenEditingDisabled:(id)a3
{
  return 0;
}

- (BOOL)documentChromeHasPresentedViewController
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLiOSCanvasViewController *)self delegate];
  unsigned __int8 v5 = sub_1002469D0(v3, v4);

  char v6 = [v5 presentedViewController];
  LOBYTE(v4) = v6 != 0;

  return (char)v4;
}

- (void)dismissDocumentChromePresentedViewController
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLiOSCanvasViewController *)self delegate];
  sub_1002469D0(v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  unsigned __int8 v5 = [v9 presentedViewController];

  if (v5)
  {
    char v6 = [(CRLiOSCanvasViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      unsigned __int8 v8 = [(CRLiOSCanvasViewController *)self delegate];
      [v8 dismissPresentedViewController];
    }
  }
}

- (BOOL)p_isAccessibilityTextResponderAction:(SEL)a3
{
  uint64_t v3 = NSStringFromSelector(a3);
  unsigned __int8 v4 = [&off_10155CE48 containsObject:v3];

  return v4;
}

- (id)editingCoordinatorForShapeLibraryViewController:(id)a3
{
  uint64_t v3 = [(CRLiOSCanvasViewController *)self interactiveCanvasController];
  unsigned __int8 v4 = [v3 editingCoordinator];

  return v4;
}

- (id)shapeLibraryViewControllerDefaultSearchTerm:(id)a3
{
  return &stru_101538650;
}

- (BOOL)shapeLibraryViewControllerShouldAllowInsertDrag:(id)a3
{
  return 0;
}

- (BOOL)shapeLibraryViewControllerShouldAppearInSearchMode:(id)a3
{
  return 0;
}

- (CRLFreehandDrawingPKSelectionManager)smartSelectionManager
{
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:1])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);
    unsigned __int8 v4 = [WeakRetained pencilKitCanvasViewControllerForCanvasViewController:self];

    unsigned __int8 v5 = [v4 smartSelectionManager];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return (CRLFreehandDrawingPKSelectionManager *)v5;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mICC);

  return (CRLInteractiveCanvasController *)WeakRetained;
}

- (void)setInteractiveCanvasController:(id)a3
{
}

- (CRLiOSCanvasViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDelegate);

  return (CRLiOSCanvasViewControllerDelegate *)WeakRetained;
}

- (CRLUserDialogPresenter)userDialogPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mUserDialogPresenter);

  return (CRLUserDialogPresenter *)WeakRetained;
}

- (void)setUserDialogPresenter:(id)a3
{
}

- (UITapGestureRecognizer)singleTapGestureRecognizer
{
  return self->mSingleTapGestureRecognizer;
}

- (void)setSingleTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->mDoubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
}

- (CRLiOSEditMenuTapGestureRecognizer)editMenuTapGestureRecognizer
{
  return self->mEditMenuTapGestureRecognizer;
}

- (void)setEditMenuTapGestureRecognizer:(id)a3
{
}

- (CRLiOSMultiSelectGestureRecognizer)multiSelectGestureRecognizer
{
  return self->mMultiSelectGestureRecognizer;
}

- (void)setMultiSelectGestureRecognizer:(id)a3
{
}

- (CRLiOSKnobDragGestureRecognizer)knobDragGestureRecognizer
{
  return self->mKnobDragGestureRecognizer;
}

- (void)setKnobDragGestureRecognizer:(id)a3
{
}

- (CRLiOSRepDragGestureRecognizer)repDragGestureRecognizer
{
  return self->mRepDragGestureRecognizer;
}

- (void)setRepDragGestureRecognizer:(id)a3
{
}

- (CRLiOSRepRotateGestureRecognizer)repRotateGestureRecognizer
{
  return self->mRepRotateGestureRecognizer;
}

- (void)setRepRotateGestureRecognizer:(id)a3
{
}

- (CRLiOSRepRotateKnobGestureRecognizer)repRotateKnobGestureRecognizer
{
  return self->mRepRotateKnobGestureRecognizer;
}

- (void)setRepRotateKnobGestureRecognizer:(id)a3
{
}

- (CRLiOSRepNudgeGestureRecognizer)nudgeGestureRecognizer
{
  return self->mNudgeGestureRecognizer;
}

- (void)setNudgeGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)zoomGestureRecognizer
{
  return &self->mZoomGestureRecognizer->super.super;
}

- (void)setZoomGestureRecognizer:(id)a3
{
}

- (CRLiOSAllTouchesDoneGestureRecognizer)allTouchesDoneGestureRecognizer
{
  return self->mAllTouchesDoneGestureRecognizer;
}

- (void)setAllTouchesDoneGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)preventScrollGestureRecognizer
{
  return &self->mPreventScrollGestureRecognizer->super;
}

- (CRLiOSFreehandDrawingGestureRecognizer)freehandDrawingGestureRecognizer
{
  return self->mFreehandDrawingGestureRecognizer;
}

- (void)setFreehandDrawingGestureRecognizer:(id)a3
{
}

- (CRLiOSPencilDownGestureRecognizer)pencilDownGestureRecognizer
{
  return self->mPencilDownGestureRecognizer;
}

- (void)setPencilDownGestureRecognizer:(id)a3
{
}

- (CRLiOSRectangularMarqueeGestureRecognizer)rectangularMarqueeGestureRecognizer
{
  return self->mRectangularMarqueeGestureRecognizer;
}

- (void)setRectangularMarqueeGestureRecognizer:(id)a3
{
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return self->mEditMenuInteraction;
}

- (void)setEditMenuInteraction:(id)a3
{
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->mContextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (BOOL)contextMenuMightBeDisplayed
{
  return self->mContextMenuMightBeDisplayed;
}

- (CGPoint)lastTapPoint
{
  double x = self->mLastTapPoint.x;
  double y = self->mLastTapPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastTapPoint:(CGPoint)a3
{
  self->mLastTapPoint = a3;
}

- (CGRect)targetRectForContextMenuController
{
  double x = self->mTargetRectForContextMenuController.origin.x;
  double y = self->mTargetRectForContextMenuController.origin.y;
  double width = self->mTargetRectForContextMenuController.size.width;
  double height = self->mTargetRectForContextMenuController.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)currentlyTrackingIndirectPointerTouch
{
  return self->mIsCurrentlyTrackingIndirectPointerTouch;
}

- (void)setCurrentlyTrackingIndirectPointerTouch:(BOOL)a3
{
  self->mIsCurrentlyTrackingIndirectPointerTouch = a3;
}

- (CRLiOSWindowIgnoreUserInteractionSafeWrapper)zoomTrackerIgnoreInteractionEventsSafeWrapper
{
  return self->mZoomTrackerIgnoreInteractionEventsSafeWrapper;
}

- (void)setZoomTrackerIgnoreInteractionEventsSafeWrapper:(id)a3
{
}

- (NSMutableArray)disabledGesturesWhileInEyeDropperMode
{
  return self->mDisabledGesturesWhileInEyeDropperMode;
}

- (void)setDisabledGesturesWhileInEyeDropperMode:(id)a3
{
}

- (UIDragInteraction)dragInteraction
{
  return self->mDragInteraction;
}

- (CRLiOSScribbleInteractionDelegate)scribbleInteractionDelegate
{
  return self->mScribbleInteractionDelegate;
}

- (void)setScribbleInteractionDelegate:(id)a3
{
}

- (UIScribbleInteraction)directScribbleInteraction
{
  return self->mDirectScribbleInteraction;
}

- (void)setDirectScribbleInteraction:(id)a3
{
}

- (UIIndirectScribbleInteraction)scribbleInteraction
{
  return self->mScribbleInteraction;
}

- (void)setScribbleInteraction:(id)a3
{
}

- (NSTimer)preventInsertScribbleElementTimer
{
  return self->mPreventInsertScribbleElementTimer;
}

- (void)setPreventInsertScribbleElementTimer:(id)a3
{
}

- (NSMutableArray)gestureRecognizers
{
  return self->_gestureRecognizers;
}

- (void)setGestureRecognizers:(id)a3
{
}

- (CRLWPTapAndTouchGestureRecognizer)doubleTapAndTouchGestureRecognizer
{
  return self->_doubleTapAndTouchGestureRecognizer;
}

- (void)setDoubleTapAndTouchGestureRecognizer:(id)a3
{
}

- (CRLWPTapAndTouchGestureRecognizer)tapAndTouchGestureRecognizer
{
  return self->_tapAndTouchGestureRecognizer;
}

- (void)setTapAndTouchGestureRecognizer:(id)a3
{
}

- (CRLWPLongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (CRLWPImmediatePressGestureRecognizer)immediatePressGestureRecognizer
{
  return self->_immediatePressGestureRecognizer;
}

- (void)setImmediatePressGestureRecognizer:(id)a3
{
}

- (CRLWPTapGestureRecognizer)immediateDoubleTapGestureRecognizer
{
  return self->_immediateDoubleTapGestureRecognizer;
}

- (void)setImmediateDoubleTapGestureRecognizer:(id)a3
{
}

- (CRLWPTapGestureRecognizer)immediateSingleTapGestureRecognizer
{
  return self->_immediateSingleTapGestureRecognizer;
}

- (void)setImmediateSingleTapGestureRecognizer:(id)a3
{
}

- (CRLWPTapGestureRecognizer)secondarySingleTapGestureRecognizer
{
  return self->_secondarySingleTapGestureRecognizer;
}

- (void)setSecondarySingleTapGestureRecognizer:(id)a3
{
}

- (void)setMiniFormatterPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miniFormatterPresenter, 0);
  objc_storeStrong((id *)&self->_secondarySingleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_immediateSingleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_immediateDoubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_immediatePressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapAndTouchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doubleTapAndTouchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
  objc_storeStrong((id *)&self->mPreventInsertScribbleElementTimer, 0);
  objc_storeStrong((id *)&self->mScribbleInteraction, 0);
  objc_storeStrong((id *)&self->mDirectScribbleInteraction, 0);
  objc_storeStrong((id *)&self->mScribbleInteractionDelegate, 0);
  objc_storeStrong((id *)&self->mDragInteraction, 0);
  objc_storeStrong((id *)&self->mDisabledGesturesWhileInEyeDropperMode, 0);
  objc_storeStrong((id *)&self->mZoomTrackerIgnoreInteractionEventsSafeWrapper, 0);
  objc_storeStrong((id *)&self->mContextMenuInteraction, 0);
  objc_storeStrong((id *)&self->mEditMenuInteraction, 0);
  objc_storeStrong((id *)&self->mRepRotateKnobGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->mUserDialogPresenter);
  objc_storeStrong((id *)&self->mAlignmentController, 0);
  objc_storeStrong((id *)&self->mPencilMediator, 0);
  objc_storeStrong((id *)&self->mQuickSelectViewController, 0);
  objc_storeStrong((id *)&self->mEnterExitNotifier, 0);
  objc_storeStrong((id *)&self->mPointerInteractionDelegate, 0);
  objc_storeStrong((id *)&self->mPointerInteraction, 0);
  objc_storeStrong((id *)&self->mContextMenuInteractionDelegate, 0);
  objc_storeStrong((id *)&self->mDragInteractionDelegate, 0);
  objc_storeStrong((id *)&self->mDropInteractionDelegate, 0);
  objc_storeStrong((id *)&self->mCanvasZoomTracker, 0);
  objc_storeStrong((id *)&self->mImageHUDOnce, 0);
  objc_storeStrong((id *)&self->mImageHUDController, 0);
  objc_storeStrong((id *)&self->mRectangularMarqueeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mPencilDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mPencilHoverGestureHandler, 0);
  objc_storeStrong((id *)&self->mPencilHoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mFreehandDrawingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mPreventScrollGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mAllIndirectPointerTouchesDoneGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mAllTouchesDoneGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mNudgeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mZoomGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mRepRotateGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mRepDragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mMultiSelectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mKnobDragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mEditMenuTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mDoubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mSingleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->mSceneDidEnterBackgroundObserver, 0);
  objc_storeStrong((id *)&self->mSceneWillEnterForegroundObserver, 0);
  objc_storeStrong((id *)&self->mContextMenuController, 0);
  objc_destroyWeak((id *)&self->mCanvasLayer);
  objc_destroyWeak((id *)&self->mDelegate);

  objc_destroyWeak((id *)&self->mICC);
}

@end