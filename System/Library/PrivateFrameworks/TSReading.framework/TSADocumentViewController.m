@interface TSADocumentViewController
+ (void)resetLastDocumentMode;
- (BOOL)allowEditMenuToAppear;
- (BOOL)allowImagePickerToAppear;
- (BOOL)allowTextEditingToBegin;
- (BOOL)chartDataEditorShowing;
- (BOOL)displaySharingButton;
- (BOOL)editMenuTapGRWasEnabledForFind;
- (BOOL)inFindReplaceMode;
- (BOOL)inPrintPreviewMode;
- (BOOL)insertControllerIsVisible;
- (BOOL)isBiDiEnabled;
- (BOOL)isCJKEnabled;
- (BOOL)isCanvasFullScreen;
- (BOOL)isCanvasInteractive;
- (BOOL)isClosingDocument;
- (BOOL)isDocumentLoaded;
- (BOOL)isHidingStatusBar;
- (BOOL)isInspectorVisible;
- (BOOL)isKeyboardUp;
- (BOOL)isLandscapeOrientation;
- (BOOL)isLayoutBelowApplicationToolbar;
- (BOOL)isPopoverGestureInFlight;
- (BOOL)isPrintingCanvas;
- (BOOL)isPrintingDocument;
- (BOOL)navigatorHiddenDefault;
- (BOOL)p_shouldZoomOutForCurrentSelection;
- (BOOL)p_shouldZoomOutFromTable;
- (BOOL)popoverController:(id)a3 shouldReceiveOutsideTouchAtLocation:(CGPoint)a4 inView:(id)a5;
- (BOOL)preserveScrollViewClipping;
- (BOOL)preventDocumentModeChangesDuringSelectionChanges;
- (BOOL)printerOptionsShowing;
- (BOOL)shouldAdjustContentFrameWhileRotating;
- (BOOL)shouldAutoscrollToSelectionOnContentViewSizeChange;
- (BOOL)shouldIgnoreTextGestures;
- (BOOL)shouldShowInstructionalText;
- (BOOL)shouldShowTextOverflowGlyphs;
- (BOOL)showEditMenuOnChartInsert;
- (BOOL)tappedCanvasBackgroundAtPoint:(CGPoint)a3;
- (BOOL)teardownAppUIForDocumentManagerAction;
- (BOOL)toolsControllerIsVisible;
- (BOOL)useToolBarHeightForSetDocumentMode;
- (BOOL)willChangeContentOffsetIfKeyboardHidden;
- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3;
- (CGRect)contentFrame;
- (CGRect)openCloseAnimationCanvasFrame;
- (CGRect)rectForPopoverFromToolbarButton:(id)a3;
- (CGRect)visibleScaledCanvasRectWithoutKeyboard;
- (CGRect)visibleUnscaledCanvasRectWithoutKeyboard;
- (CGSize)sizeOfScrollViewEnclosingCanvas;
- (NSArray)CJKLanguages;
- (NSArray)bidiLanguages;
- (NSArray)listLanguages;
- (NSString)closeDocumentButtonTitle;
- (TIADocument)document;
- (TSADebugViewController)debugViewController;
- (TSADocumentRoot)documentRoot;
- (TSADocumentViewController)initWithDefaultView;
- (TSADocumentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TSAFindReplaceUIController)findReplaceUIController;
- (TSAInteractiveCanvasController)defaultInteractiveCanvasController;
- (TSAInteractiveCanvasController)interactiveCanvasController;
- (TSANavigatorViewController)navigatorViewController;
- (TSASyncResolveConflictViewController)_openDocumentResolveConflictViewController;
- (TSDiOSCanvasViewController)canvasViewController;
- (TSKUIAlert)_openDocumentEvictionAlert;
- (TSKUIAlert)_openDocumentUpdatedAlert;
- (TSKUIAlert)openDocumentKeepOrDeleteAlert;
- (UIButton)coachingTipsButton;
- (UIButton)sharingButton;
- (UIScrollView)canvasScrollView;
- (_NSRange)visibleRootIndexRange;
- (double)autoZoomAnimationDurationForInteractiveCanvasController:(id)a3;
- (double)externalKeyboardHideMinDuration;
- (double)leftToolbarItemsInset;
- (double)mainToolsMenuMinimumHeight;
- (double)modalToolbarTitleBaselineOffset;
- (double)paddingAboveHalfHeightAtTopOfScreen;
- (double)rightToolbarItemsInset;
- (double)toolbarSpaceWidth;
- (double)toolbarTextButtonSpaceWidth;
- (double)viewHeaderHeight;
- (float)viewBottomInScreenCoordinates;
- (id)alternativeOpenCloseDocumentAnimationView;
- (id)childViewControllerForStatusBarStyle;
- (id)closeDocumentButton;
- (id)contentView;
- (id)drawableFactory;
- (id)openCloseAnimationAlternativeView;
- (id)p_arrayByAddingLanguage:(id)a3 toArray:(id)a4;
- (id)rectanglesObscuringView:(id)a3;
- (id)superviewForChartDataEditor:(id)a3;
- (id)title;
- (int64_t)defaultDocumentMode;
- (int64_t)documentMode;
- (int64_t)lastDocumentMode;
- (int64_t)modalToolbarTitleBaselineOffsetBarMetrics;
- (int64_t)p_documentModeToRestoreFor:(int64_t)a3;
- (void)_setOpenDocumentUpdatedAlert:(id)a3;
- (void)abandonDocument;
- (void)adjustContentViewFrame;
- (void)adjustScrollViewInsets;
- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4;
- (void)closeDocumentPressed;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)didReplaceDocument;
- (void)didSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5;
- (void)didStopCloseDocumentAnimation;
- (void)documentWillClose;
- (void)editorDidChangeSelection:(id)a3;
- (void)hideSharedUIPanelsForReadMode;
- (void)interactiveCanvasController:(id)a3 willAnimateToViewScale:(double)a4 withDuration:(double)a5 unscaledContentOffset:(CGPoint)a6;
- (void)keyboardShowCanceled;
- (void)keyboardWillHideOrUndock:(id)a3;
- (void)keyboardWillShowOrDock:(id)a3;
- (void)loadDocument;
- (void)navigatePlay:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_backgroundInit;
- (void)p_deregisterForNotifications;
- (void)p_restoreTextSelectionAfterModalDismiss;
- (void)p_scrollToCurrentSelection;
- (void)p_scrollToRect:(CGRect)a3;
- (void)p_setDocumentMode:(int64_t)a3 animated:(BOOL)a4 dismissOnTop:(BOOL)a5;
- (void)p_startBackgroundInit;
- (void)p_teardown;
- (void)p_zoomOutForCurrentSelection;
- (void)popoverController:(id)a3 learnMoreAPDIDTapped:(id)a4;
- (void)popoverControllerDidDismissPopoverBasedViewController:(id)a3;
- (void)setCanvasScrollViewClipsToBoundsForKeyboardAnimation:(BOOL)a3;
- (void)setCanvasViewController:(id)a3;
- (void)setDefaultInteractiveCanvasController:(id)a3;
- (void)setDocument:(id)a3;
- (void)setDocumentMode:(int64_t)a3;
- (void)setDocumentMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setDocumentMode:(int64_t)a3 animated:(BOOL)a4 dismissOnTop:(BOOL)a5;
- (void)setDocumentUnloaded;
- (void)setEditMenuTapGRWasEnabledForFind:(BOOL)a3;
- (void)setHidingStatusBar:(BOOL)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setIsLandscapeOrientation:(BOOL)a3;
- (void)setLastDocumentMode:(int64_t)a3;
- (void)setNavigatorHiddenDefault:(BOOL)a3;
- (void)setNavigatorViewController:(id)a3;
- (void)setOpenDocumentKeepOrDeleteAlert:(id)a3;
- (void)setPrinterOptionsShowing:(BOOL)a3;
- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5;
- (void)set_openDocumentEvictionAlert:(id)a3;
- (void)set_openDocumentResolveConflictViewController:(id)a3;
- (void)toolsFindReplace;
- (void)unloadDocument;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willInsertDrawable;
- (void)willReplaceDocument;
- (void)willSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5;
- (void)zoomOutAnimated:(BOOL)a3;
@end

@implementation TSADocumentViewController

- (BOOL)isCanvasFullScreen
{
  return 0;
}

- (BOOL)chartDataEditorShowing
{
  return 0;
}

- (BOOL)isKeyboardUp
{
  return +[TSKKeyboardMonitor keyboardIsVisibleAndDocked];
}

- (BOOL)inPrintPreviewMode
{
  return 0;
}

- (BOOL)isInspectorVisible
{
  return 0;
}

- (BOOL)inFindReplaceMode
{
  return [(TSADocumentViewController *)self documentMode] == 2;
}

- (TSADebugViewController)debugViewController
{
  result = self->_debugViewController;
  if (!result)
  {
    result = [[TSADebugViewController alloc] initWithDelegate:self];
    self->_debugViewController = result;
  }
  return result;
}

- (TSADocumentViewController)initWithDefaultView
{
  v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSADocumentViewController initWithDefaultView]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 337, @"Abstract method");
  self->mSavedContentOffset = (CGPoint)*MEMORY[0x263F00148];
  self->mSavedCanvasViewScale = 0.0;
  return 0;
}

- (TSADocumentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSADocumentViewController;
  result = [(TSADocumentViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result) {
    result->_shouldShowInstructionalText = 1;
  }
  return result;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  self->_coachingTipsButton = 0;
  self->_sharingButton = 0;
  [(TSADocumentViewController *)self setNavigatorViewController:0];

  v3.receiver = self;
  v3.super_class = (Class)TSADocumentViewController;
  [(TSAViewController *)&v3 dealloc];
}

- (BOOL)isCJKEnabled
{
  return [(NSArray *)[(TSADocumentViewController *)self CJKLanguages] count] != 0;
}

- (BOOL)isBiDiEnabled
{
  return [(NSArray *)[(TSADocumentViewController *)self bidiLanguages] count] != 0;
}

- (id)p_arrayByAddingLanguage:(id)a3 toArray:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a4);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * v9) hasPrefix:a3]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      [a4 addObject:a3];
    }
    return a4;
  }
  else
  {
    v11 = (void *)MEMORY[0x263EFF980];
    return (id)objc_msgSend(v11, "arrayWithObject:");
  }
}

- (NSArray)listLanguages
{
  return (NSArray *)MEMORY[0x270F798A0](&__block_literal_global_85, a2);
}

uint64_t __42__TSADocumentViewController_listLanguages__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F798F0](a2);
}

- (NSArray)CJKLanguages
{
  return (NSArray *)MEMORY[0x270F798A0](&__block_literal_global_47, a2);
}

uint64_t __41__TSADocumentViewController_CJKLanguages__block_invoke()
{
  return TSUHasCJKLanguage();
}

- (NSArray)bidiLanguages
{
  return (NSArray *)MEMORY[0x270F798A0](&__block_literal_global_49, a2);
}

uint64_t __42__TSADocumentViewController_bidiLanguages__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F798E0](a2);
}

- (TSAInteractiveCanvasController)defaultInteractiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setDefaultInteractiveCanvasController:(id)a3
{
  id v5 = a3;

  self->_interactiveCanvasController = (TSAInteractiveCanvasController *)a3;
}

- (void)setDocument:(id)a3
{
  document = self->_document;
  if (document != a3)
  {
    if (document)
    {
      if (self->_isDocumentLoaded) {
        [(TSADocumentViewController *)self unloadDocument];
      }
      else {
        [(TSADocumentViewController *)self teardown];
      }
    }

    self->_document = (TIADocument *)a3;
    self->_isDocumentLoaded = 0;
  }
}

- (TSADocumentRoot)documentRoot
{
  return [(TIADocument *)self->_document documentRoot];
}

- (void)setDocumentUnloaded
{
  self->_isDocumentLoaded = 0;
}

- (void)willReplaceDocument
{
  if (!self->_isAbandoningDocument)
  {
    self->_documentModeBeforeReplaceController = [(TSADocumentViewController *)self p_documentModeToRestoreFor:[(TSADocumentViewController *)self documentMode]];
    [(TSADocumentViewController *)self setDocumentMode:0 animated:0];
    [(TSADocumentViewController *)self viewWillDisappear:0];
    [(TSAViewController *)self viewDidDisappear:0];
  }
}

- (void)didReplaceDocument
{
  [(TSADocumentViewController *)self viewWillAppear:0];
  [(TSADocumentViewController *)self viewDidAppear:0];
  int64_t documentModeBeforeReplaceController = self->_documentModeBeforeReplaceController;

  [(TSADocumentViewController *)self setDocumentMode:documentModeBeforeReplaceController animated:0];
}

- (void)abandonDocument
{
  self->_isAbandoningDocument = 1;
  [(TSADocumentViewController *)self willReplaceDocument];
  [(TSADocumentViewController *)self setDocument:0];
  self->_isAbandoningDocument = 0;
}

- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5
{
  if ([(TSADocumentViewController *)self documentMode] == 1)
  {
    uint64_t v9 = [(TSADocumentViewController *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v9 setSelection:a3 onModel:a4 withFlags:a5];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)TSAActiveCoachingTipSetObserverContext != a6 && TSACanvasCoachingTipsObserverContext != (void)a6)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSADocumentViewController;
    -[TSADocumentViewController observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)navigatePlay:(id)a3
{
  id v3 = +[TSWPHyperlinkUIController sharedHyperlinkUIController];

  [v3 endUISession];
}

- (void)p_startBackgroundInit
{
}

- (void)p_backgroundInit
{
  id v3 = objc_alloc_init(MEMORY[0x263F086B0]);
  [MEMORY[0x263F08B88] setThreadPriority:0.0];
  [(TSADocumentViewController *)self backgroundInit];

  [v3 drain];
}

- (BOOL)teardownAppUIForDocumentManagerAction
{
  return 1;
}

- (double)mainToolsMenuMinimumHeight
{
  return 0.0;
}

- (void)p_restoreTextSelectionAfterModalDismiss
{
  if (TSUPhoneUI())
  {
    interactiveCanvasController = self->_interactiveCanvasController;
    [(TSDInteractiveCanvasController *)interactiveCanvasController setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:1];
  }
}

- (void)popoverControllerDidDismissPopoverBasedViewController:(id)a3
{
  if (TSUPhoneUI() && !self->_documentModeChangeInProgress)
  {
    [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:0];
    [(TSADocumentViewController *)self adjustContentViewFrame];
    [(TSADocumentViewController *)self adjustScrollViewInsets];
  }
  if (TSUPhoneUI()) {
    self->_helpViewVisibleState = 0;
  }
}

- (BOOL)popoverController:(id)a3 shouldReceiveOutsideTouchAtLocation:(CGPoint)a4 inView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  [(UIButton *)self->_closeButton bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  -[UIButton convertPoint:fromView:](self->_closeButton, "convertPoint:fromView:", a5, x, y);
  v20.double x = v17;
  v20.double y = v18;
  v21.origin.double x = v10;
  v21.origin.double y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  return !CGRectContainsPoint(v21, v20);
}

- (void)popoverController:(id)a3 learnMoreAPDIDTapped:(id)a4
{
}

- (BOOL)navigatorHiddenDefault
{
  v2 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  return [v2 BOOLForKeyInCurrentRole:@"NavigatorHidden"];
}

- (void)setNavigatorHiddenDefault:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  [v4 setBool:v3 forKeyInCurrentRole:@"NavigatorHidden"];
}

- (double)viewHeaderHeight
{
  return 0.0;
}

- (void)closeDocumentPressed
{
  objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "endUISession");
  BOOL v3 = [(TSADocumentViewController *)self defaultInteractiveCanvasController];

  [(TSDInteractiveCanvasController *)v3 teardownBackgroundRendering];
}

- (BOOL)p_shouldZoomOutFromTable
{
  return 0;
}

- (BOOL)p_shouldZoomOutForCurrentSelection
{
  if ([(TSAInteractiveCanvasController *)[(TSADocumentViewController *)self interactiveCanvasController] hasEmptyWPSelection])
  {
    return 1;
  }

  return [(TSADocumentViewController *)self p_shouldZoomOutFromTable];
}

- (void)documentWillClose
{
  self->_isClosingDocument = 1;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSKDocumentUIWillCloseNotification", self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C7B0], "sharedMenuController"), "hideMenu");
  BOOL v3 = [(TSADocumentViewController *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v3 beginEditingRep:0];
}

- (void)loadDocument
{
  if (!self->_isDocumentLoaded)
  {
    BOOL v3 = [(TSADocumentViewController *)self defaultInteractiveCanvasController];
    uint64_t v4 = [(TSADocumentViewController *)self documentRoot];
    [(TSDInteractiveCanvasController *)v3 setShowInvisibleObjects:1];
    [(TSKChangeNotifier *)[(TSKDocumentRoot *)v4 changeNotifier] addObserver:self forChangeSource:v4];
    [(TSAInteractiveCanvasController *)v3 loadDocument];
    int64_t v5 = [(TSADocumentViewController *)self lastDocumentMode];
    [(TSADocumentViewController *)self setLastDocumentMode:v5];
    [(TSADocumentViewController *)self p_setDocumentMode:v5 animated:0 dismissOnTop:1];
    objc_msgSend(+[TSKPopoverUndoObserver sharedObserver](TSKPopoverUndoObserver, "sharedObserver"), "setObservedUndoManager:", -[TSADocumentViewController undoManager](self, "undoManager"));
    self->_isDocumentLoaded = 1;
  }
}

- (void)p_teardown
{
  [(TSAInteractiveCanvasController *)[(TSADocumentViewController *)self defaultInteractiveCanvasController] teardown];
  BOOL v3 = [(TSADocumentViewController *)self documentRoot];
  id v4 = +[TSDImageProviderPool sharedPool];
  uint64_t v5 = [(TSPObject *)v3 context];

  [v4 willCloseDocumentContext:v5];
}

- (void)unloadDocument
{
  BOOL v3 = [(TSADocumentViewController *)self defaultInteractiveCanvasController];
  objc_msgSend(+[TSKPopoverUndoObserver sharedObserver](TSKPopoverUndoObserver, "sharedObserver"), "setObservedUndoManager:", 0);
  [(TSADocumentViewController *)self p_deregisterForNotifications];
  id v4 = [(TSADocumentViewController *)self documentRoot];
  [(TSKChangeNotifier *)[(TSKDocumentRoot *)v4 changeNotifier] removeObserver:self forChangeSource:v4];
  [(TSAInteractiveCanvasController *)v3 unloadDocument];

  [(TSADocumentViewController *)self p_teardown];
}

- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(TSADocumentViewController *)self interactiveCanvasController];
  [(TSDScrollView *)self->_scrollView frame];
  double MaxY = CGRectGetMaxY(v18);
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v6, "convertUnscaledToBoundsPoint:", x, y);
  double v9 = v8;
  double v11 = v10;
  [(TSDScrollView *)self->_scrollView contentSize];
  if (v12 - v11 < MaxY)
  {
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v6, "convertBoundsToUnscaledPoint:", v9, fmax(v11 - (MaxY - (v12 - v11)), 0.0));
    double x = v13;
    double y = v14;
  }
  double v15 = x;
  double v16 = y;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)toolsFindReplace
{
  uint64_t v3 = TSUPadUI();

  [(TSADocumentViewController *)self setDocumentMode:2 animated:v3];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)TSADocumentViewController;
  [(TSADocumentViewController *)&v2 viewDidLoad];
}

- (id)title
{
  if (!TSUPadUI()) {
    return &stru_26D688A48;
  }
  uint64_t v3 = [(TIADocument *)self->_document documentRoot];

  return [(TSADocumentRoot *)v3 name];
}

- (BOOL)isLayoutBelowApplicationToolbar
{
  return 0;
}

- (id)closeDocumentButton
{
  uint64_t v3 = [(TSADocumentViewController *)self closeDocumentButtonTitle];

  return [(TSAViewController *)self toolbarButtonWithTitle:v3 target:self action:sel_closeDocumentPressed isModal:0];
}

- (BOOL)displaySharingButton
{
  return 1;
}

- (double)leftToolbarItemsInset
{
  if (TSUPhoneUI())
  {
    int IsLandscape = TSUStatusBarIsLandscape();
    uint64_t v3 = (double *)&TSADefaultLeftToolbarItemsInsetiPhoneLandscape;
    if (!IsLandscape) {
      uint64_t v3 = (double *)&TSADefaultLeftToolbarItemsInsetiPhonePortrait;
    }
  }
  else
  {
    uint64_t v3 = (double *)&TSADefaultLeftToolbarItemsInsetiPad;
  }
  return *v3;
}

- (double)rightToolbarItemsInset
{
  int v2 = TSUPhoneUI();
  uint64_t v3 = (double *)&TSADefaultRightToolbarItemsInsetiPhone;
  if (!v2) {
    uint64_t v3 = (double *)&TSADefaultRightToolbarItemsInsetiPad;
  }
  return *v3;
}

- (CGRect)rectForPopoverFromToolbarButton:(id)a3
{
  [a3 bounds];
  double v5 = v4;
  double v7 = v6 + -6.0;
  objc_msgSend((id)objc_msgSend(a3, "imageView"), "frame");
  double v10 = v5;
  double v11 = v7;
  result.size.height = v11;
  result.size.width = v9;
  result.origin.double y = v10;
  result.origin.double x = v8;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSADocumentViewController;
  [(TSADocumentViewController *)&v6 viewWillAppear:a3];
  if (!self->_document)
  {
    double v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSADocumentViewController viewWillAppear:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 2812, @"No document has been set");
  }
  self->_keyboardHeight = 0.0;
  [(TSDInteractiveCanvasController *)[(TSADocumentViewController *)self interactiveCanvasController] setDelegate:self];
  if (!self->_isDocumentLoaded)
  {
    [(TSADocumentViewController *)self loadDocument];
    self->_isClosingDocument = 0;
  }
  if (!self->_registered)
  {
    self->_registered = 1;
    +[TSKKeyboardMonitor addKeyboardObserver:self];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_willEnterFullScreen_, @"TSKWillEnterFullScreenNotification", 0);
    [(TSADocumentViewController *)self registerForCanvasEditorNotifications];
  }
  [(TSADocumentViewController *)self adjustContentViewFrame];
  [(TSADocumentViewController *)self adjustScrollViewInsets];
  [(TSADocumentViewController *)self setIsLandscapeOrientation:TSUStatusBarIsLandscape()];
  if (TSUPhoneUI())
  {
    if (![(TSADocumentViewController *)self isLandscapeOrientation]) {
      [(TSAViewController *)self setLeftToolbarItemsMaximumWidth:168.0];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSADocumentViewController;
  [(TSAViewController *)&v6 viewDidAppear:a3];
  if (!self->_document)
  {
    double v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSADocumentViewController viewDidAppear:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 2872, @"No document has been set");
  }
  if (!self->_scheduledBackgroundInit)
  {
    self->_scheduledBackgroundInit = 1;
    [(TSADocumentViewController *)self performSelector:sel_p_startBackgroundInit withObject:0 afterDelay:0.00999999978];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)TSADocumentViewController;
  [(TSAViewController *)&v13 viewWillDisappear:a3];
  if ([(TSADocumentViewController *)self document])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = [(TSDCanvas *)[(TSDInteractiveCanvasController *)[(TSADocumentViewController *)self interactiveCanvasController] canvas] topLevelReps];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) recursivelyPerformSelectorIfImplemented:sel_disableCaretAnimation];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v6);
    }
  }
  [(TSADocumentViewController *)self p_deregisterForNotifications];
  [(TSADocumentViewController *)self adjustContentViewFrame];
}

- (void)p_deregisterForNotifications
{
  if (self->_registered)
  {
    self->_registered = 0;
    +[TSKKeyboardMonitor removeKeyboardObserver:self];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"TSKWillEnterFullScreenNotification", 0);
    [(TSADocumentViewController *)self deRegisterForCanvasEditorNotifications];
    self->_keyboardHeight = 0.0;
  }
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)TSADocumentViewController;
  [(TSADocumentViewController *)&v2 didReceiveMemoryWarning];
}

- (CGRect)openCloseAnimationCanvasFrame
{
  objc_super v2 = [(TSADocumentViewController *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v2 visibleBoundsRect];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)openCloseAnimationAlternativeView
{
  return 0;
}

- (void)didStopCloseDocumentAnimation
{
}

- (double)externalKeyboardHideMinDuration
{
  return 0.0;
}

- (id)alternativeOpenCloseDocumentAnimationView
{
  return 0;
}

- (BOOL)useToolBarHeightForSetDocumentMode
{
  return 0;
}

- (double)toolbarSpaceWidth
{
  return 18.0;
}

- (double)toolbarTextButtonSpaceWidth
{
  int v2 = TSUPadUI();
  double result = 18.0;
  if (v2) {
    return 22.0;
  }
  return result;
}

- (void)interactiveCanvasController:(id)a3 willAnimateToViewScale:(double)a4 withDuration:(double)a5 unscaledContentOffset:(CGPoint)a6
{
  if ((TSUSupportsTextInteraction() & 1) == 0)
  {
    +[TSWPEditMenuController hideEditMenu];
  }
}

- (id)childViewControllerForStatusBarStyle
{
  return 0;
}

- (_NSRange)visibleRootIndexRange
{
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setDocumentMode:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)setDocumentMode:(int64_t)a3 animated:(BOOL)a4 dismissOnTop:(BOOL)a5
{
  if (self->_documentMode != a3)
  {
    -[TSADocumentViewController p_setDocumentMode:animated:dismissOnTop:](self, "p_setDocumentMode:animated:dismissOnTop:");
    if (a3 != 2)
    {
      [(TSADocumentViewController *)self setLastDocumentMode:a3];
    }
  }
}

- (void)setDocumentMode:(int64_t)a3
{
}

- (int64_t)defaultDocumentMode
{
  return 1;
}

- (int64_t)lastDocumentMode
{
  NSUInteger v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"DocumentMode");
  if (v3)
  {
    return [v3 integerValue];
  }
  else
  {
    return [(TSADocumentViewController *)self defaultDocumentMode];
  }
}

- (void)setLastDocumentMode:(int64_t)a3
{
  double v4 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  [v4 setInteger:a3 forKey:@"DocumentMode"];
}

+ (void)resetLastDocumentMode
{
  NSUInteger v2 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];

  [v2 removeObjectForKey:@"DocumentMode"];
}

- (void)willSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = [(TSADocumentViewController *)self interactiveCanvasController];

  [(TSAInteractiveCanvasController *)v8 willSetDocumentToMode:a3 fromMode:a4 animated:v5];
}

- (void)didSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = [(TSADocumentViewController *)self interactiveCanvasController];

  [(TSAInteractiveCanvasController *)v8 didSetDocumentToMode:a3 fromMode:a4 animated:v5];
}

- (BOOL)tappedCanvasBackgroundAtPoint:(CGPoint)a3
{
  if ([(TSADocumentViewController *)self documentMode]
    && [(TSADocumentViewController *)self documentMode] != 2)
  {
    return 0;
  }
  BOOL v4 = 1;
  [(TSADocumentViewController *)self setDocumentMode:1 animated:1];
  return v4;
}

- (BOOL)shouldAutoscrollToSelectionOnContentViewSizeChange
{
  return self->_documentMode != 0;
}

- (CGRect)contentFrame
{
  objc_msgSend((id)-[TSADocumentViewController view](self, "view"), "bounds");
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  remainder.origin.CGFloat x = v3;
  remainder.origin.CGFloat y = v5;
  remainder.size.CGFloat width = v7;
  remainder.size.CGFloat height = v9;
  [(TSADocumentViewController *)self viewHeaderHeight];
  if (v11 > 0.0)
  {
    CGFloat v12 = v11;
    CGSize v13 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    v21.origin = (CGPoint)*MEMORY[0x263F001A8];
    v21.size = v13;
    CGFloat v14 = x;
    v13.CGFloat width = y;
    CGFloat v15 = width;
    CGFloat v16 = height;
    CGRectDivide(*(CGRect *)((char *)&v13 - 8), &v21, &remainder, v12, CGRectMinYEdge);
    CGFloat x = remainder.origin.x;
    CGFloat y = remainder.origin.y;
    CGFloat width = remainder.size.width;
    CGFloat height = remainder.size.height;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (BOOL)willChangeContentOffsetIfKeyboardHidden
{
  if (self->_keyboardHeight <= 0.0) {
    return 0;
  }
  CGFloat v3 = [(TSDCanvasView *)[(TSDInteractiveCanvasController *)[(TSADocumentViewController *)self interactiveCanvasController] canvasView] enclosingScrollView];
  [(TSKScrollView *)v3 contentSize];
  double v5 = v4;
  [(TSKScrollView *)v3 contentOffset];
  double v7 = v6;
  [(TSKScrollView *)v3 frame];
  return v5 - v7 < CGRectGetMaxY(v9) - self->_keyboardHeight;
}

- (BOOL)shouldAdjustContentFrameWhileRotating
{
  return 1;
}

- (id)contentView
{
  return self->_scrollView;
}

- (void)adjustScrollViewInsets
{
  NSUInteger v2 = [(TSADocumentViewController *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v2 unobscuredFrameDidChange];
}

- (void)adjustContentViewFrame
{
  [(TSADocumentViewController *)self contentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TSDScrollView *)self->_scrollView frame];
  float v12 = v11;
  [(TSDScrollView *)self->_scrollView frame];
  v20.origin.CGFloat x = v13;
  v20.origin.CGFloat y = v14;
  v20.size.CGFloat width = v15;
  v20.size.CGFloat height = v16;
  v19.origin.CGFloat x = v4;
  v19.origin.CGFloat y = v6;
  v19.size.CGFloat width = v8;
  v19.size.CGFloat height = v10;
  if (!CGRectEqualToRect(v19, v20)) {
    -[TSDScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10);
  }
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](-[TSADocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "adjustContentInsets");
  [(TSADocumentViewController *)self didSetContentViewFrame];
  [(TSDInteractiveCanvasController *)[(TSADocumentViewController *)self interactiveCanvasController] invalidateVisibleBounds];
  if (v10 != v12
    && [(TSADocumentViewController *)self shouldAutoscrollToSelectionOnContentViewSizeChange]&& v10 < v12)
  {
    double v17 = [(TSADocumentViewController *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)v17 setShouldAutoscrollToSelectionAfterLayout:1];
  }
}

- (BOOL)preserveScrollViewClipping
{
  return 0;
}

- (CGRect)visibleScaledCanvasRectWithoutKeyboard
{
  double v3 = [(TSADocumentViewController *)self interactiveCanvasController];
  [(TSDInteractiveCanvasController *)v3 visibleBoundsRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([(TSADocumentViewController *)self isKeyboardUp])
  {
    float v12 = [(TSDInteractiveCanvasController *)v3 canvasView];
    double v11 = v11 + self->_keyboardHeight;
    [(TSKScrollView *)[(TSDCanvasView *)v12 enclosingScrollView] contentSize];
    float v14 = v13;
    double v15 = v14;
    if (v11 >= v15) {
      double v11 = v15;
    }
  }
  double v16 = v5;
  double v17 = v7;
  double v18 = v9;
  double v19 = v11;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)visibleUnscaledCanvasRectWithoutKeyboard
{
  double v3 = [(TSADocumentViewController *)self interactiveCanvasController];
  [(TSADocumentViewController *)self visibleScaledCanvasRectWithoutKeyboard];

  -[TSDInteractiveCanvasController convertBoundsToUnscaledRect:](v3, "convertBoundsToUnscaledRect:");
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGSize)sizeOfScrollViewEnclosingCanvas
{
  [(TSKScrollView *)[(TSDCanvasView *)[(TSDInteractiveCanvasController *)[(TSADocumentViewController *)self interactiveCanvasController] canvasView] enclosingScrollView] frame];
  double v4 = v3;
  double v6 = v5;
  if ([(TSADocumentViewController *)self isKeyboardUp]) {
    double v6 = v6 + self->_keyboardHeight;
  }
  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (BOOL)allowEditMenuToAppear
{
  return ![(id)TSUDynamicCast() presentedViewController]
      && [(TSADocumentViewController *)self presentedViewController] == 0;
}

- (BOOL)allowTextEditingToBegin
{
  return 1;
}

- (BOOL)allowImagePickerToAppear
{
  BOOL v3 = [(TSADocumentViewController *)self allowEditMenuToAppear];
  if (v3) {
    LOBYTE(v3) = ![(TSDInteractiveCanvasController *)[(TSADocumentViewController *)self interactiveCanvasController] inReadMode];
  }
  return v3;
}

- (void)p_setDocumentMode:(int64_t)a3 animated:(BOOL)a4 dismissOnTop:(BOOL)a5
{
  if (!self->_settingDocumentMode)
  {
    BOOL v5 = a4;
    self->_settingDocumentMode = 1;
    int64_t documentMode = self->_documentMode;
    [(TSADocumentViewController *)self willSetDocumentToMode:a3 fromMode:documentMode animated:a4];
    self->_int64_t documentMode = a3;
    double v9 = [(TSADocumentViewController *)self interactiveCanvasController];
    double v10 = v9;
    if (!a3)
    {
      [(TSDInteractiveCanvasController *)v9 setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:1];
      [(TSADocumentViewController *)self setSelection:+[TSDCanvasSelection emptySelection] onModel:[(TSADocumentViewController *)self documentRoot] withFlags:0];
    }
    [(TSDInteractiveCanvasController *)v10 setInReadMode:a3 == 0];
    [(TSDInteractiveCanvasController *)v10 setShowInvisibleObjects:a3 != 0];
    uint64_t v11 = [MEMORY[0x263F1C408] sharedApplication];
    double v12 = 0.2;
    if (!v5) {
      double v12 = 0.0;
    }
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __69__TSADocumentViewController_p_setDocumentMode_animated_dismissOnTop___block_invoke;
    v14[3] = &unk_2646B3EA8;
    v14[4] = v11;
    v14[5] = self;
    v14[6] = v10;
    v14[7] = documentMode;
    v14[8] = a3;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __69__TSADocumentViewController_p_setDocumentMode_animated_dismissOnTop___block_invoke_2;
    v13[3] = &unk_2646B3ED0;
    v13[4] = self;
    v13[5] = v11;
    [MEMORY[0x263F1CB60] animateWithDuration:196612 delay:v14 options:v13 animations:v12 completion:0.0];
    if ((objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "isDisplayingHyperlinkUI") & 1) == 0)-[TSDInteractiveCanvasController setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:](v10, "setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:", 0); {
    self->_settingDocumentMode = 0;
    }
  }
}

uint64_t __69__TSADocumentViewController_p_setDocumentMode_animated_dismissOnTop___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) beginIgnoringInteractionEvents];
  uint64_t v2 = [MEMORY[0x263F1CB60] areAnimationsEnabled];
  BOOL v3 = (void *)MEMORY[0x263F1CB60];
  char v4 = TSUPadUI();
  BOOL v5 = 1;
  if ((v4 & 1) == 0) {
    BOOL v5 = *(void *)(a1 + 56) != 2;
  }
  [v3 setAnimationsEnabled:v5];
  [MEMORY[0x263F1CB60] setAnimationsEnabled:v2];
  *(unsigned char *)(*(void *)(a1 + 40) + 1211) = 1;
  double v6 = *(void **)(a1 + 40);
  if (v6[141] == 1)
  {
    [*(id *)(a1 + 48) resumeEditing];
    double v6 = *(void **)(a1 + 40);
  }
  [v6 adjustContentViewFrame];
  double v7 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);

  return [v7 didSetDocumentToMode:v8 fromMode:v9 animated:0];
}

uint64_t __69__TSADocumentViewController_p_setDocumentMode_animated_dismissOnTop___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1211) = 0;
  return [*(id *)(a1 + 40) endIgnoringInteractionEvents];
}

- (void)hideSharedUIPanelsForReadMode
{
}

- (NSString)closeDocumentButtonTitle
{
  uint64_t v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSADocumentViewController closeDocumentButtonTitle]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 3696, @"Abstract method");
  objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498], objc_msgSend(NSString, "stringWithFormat:", @"%@: %s", @"Abstract method", "-[TSADocumentViewController closeDocumentButtonTitle]"), 0 reason userInfo]);
}

- (double)modalToolbarTitleBaselineOffset
{
  return 0.0;
}

- (int64_t)modalToolbarTitleBaselineOffsetBarMetrics
{
  return 0;
}

- (void)p_zoomOutForCurrentSelection
{
  if (!self->_waitingToZoomOut
    && [(TSDInteractiveCanvasController *)self->_interactiveCanvasController shouldZoomOnSelectionChange])
  {
    self->_waitingToZoomOut = 1;
    if (![(TSADocumentViewController *)self isKeyboardUp])
    {
      Main = CFRunLoopGetMain();
      char v4 = (const void *)*MEMORY[0x263EFFE88];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__TSADocumentViewController_p_zoomOutForCurrentSelection__block_invoke;
      block[3] = &unk_2646AF7B8;
      block[4] = self;
      CFRunLoopPerformBlock(Main, v4, block);
    }
  }
}

uint64_t __57__TSADocumentViewController_p_zoomOutForCurrentSelection__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) zoomOutAnimated:1];
  *(unsigned char *)(*(void *)(a1 + 32) + 1208) = 0;
  return result;
}

- (void)zoomOutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController fitWidthViewScale];
  double v6 = v5;
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController visibleUnscaledRect];
  interactiveCanvasController = self->_interactiveCanvasController;

  -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](interactiveCanvasController, "setViewScale:contentOffset:clampOffset:animated:", 1, v3, v6, 0.0, v7);
}

- (float)viewBottomInScreenCoordinates
{
  objc_msgSend((id)-[TSADocumentViewController view](self, "view"), "frame");
  return CGRectGetMaxY(v3);
}

- (void)setCanvasScrollViewClipsToBoundsForKeyboardAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(TSADocumentViewController *)self preserveScrollViewClipping])
  {
    double v5 = [(TSDCanvasView *)[(TSDInteractiveCanvasController *)[(TSADocumentViewController *)self interactiveCanvasController] canvasView] enclosingScrollView];
    [(TSKScrollView *)v5 setClipsToBounds:v3];
  }
}

- (void)keyboardWillShowOrDock:(id)a3
{
  if ([(TSADocumentViewController *)self contentView] && self->_registered)
  {
    double v5 = (void *)[a3 userInfo];
    if (!v5)
    {
      double v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[TSADocumentViewController keyboardWillShowOrDock:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 3969, @"invalid nil value for '%s'", "userInfo");
    }
    objc_msgSend(+[TSKKeyboardMonitor sharedKeyboardMonitor](TSKKeyboardMonitor, "sharedKeyboardMonitor"), "onScreenHeight");
    self->_keyboardHeight = v8;
    objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x263F1D3F8]), "floatValue");
    float v10 = v9;
    if (objc_msgSend(+[TSAApplicationDelegate sharedDelegate](TSAApplicationDelegate, "sharedDelegate"), "isActivating"))
    {
      double v11 = 0.0;
      uint64_t v12 = 4;
    }
    else
    {
      if (self->_documentModeChangeInProgress) {
        double v11 = 0.2;
      }
      else {
        double v11 = v10;
      }
      if (self->_documentModeChangeInProgress) {
        uint64_t v12 = 196612;
      }
      else {
        uint64_t v12 = 4;
      }
    }
    uint64_t v13 = [MEMORY[0x263F1C408] sharedApplication];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52__TSADocumentViewController_keyboardWillShowOrDock___block_invoke;
    v15[3] = &unk_2646B06B0;
    v15[4] = v13;
    v15[5] = self;
    *(double *)&v15[6] = v11;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52__TSADocumentViewController_keyboardWillShowOrDock___block_invoke_2;
    v14[3] = &unk_2646B3ED0;
    v14[4] = self;
    v14[5] = v13;
    [MEMORY[0x263F1CB60] animateWithDuration:v12 delay:v15 options:v14 animations:v11 completion:0.0];
  }
}

uint64_t __52__TSADocumentViewController_keyboardWillShowOrDock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) beginIgnoringInteractionEvents];
  *(void *)(*(void *)(a1 + 40) + 1168) = *(void *)(a1 + 48);
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "interactiveCanvasController"), "setShouldAutoscrollToSelectionAfterLayout:", 1);
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 adjustScrollViewInsets];
}

uint64_t __52__TSADocumentViewController_keyboardWillShowOrDock___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1168) = 0;
  return [*(id *)(a1 + 40) endIgnoringInteractionEvents];
}

- (void)keyboardShowCanceled
{
  [(TSDScrollView *)self->_scrollView contentOffset];
  scrollView = self->_scrollView;

  -[TSKScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 1);
}

- (void)keyboardWillHideOrUndock:(id)a3
{
  self->_keyboardHeight = 0.0;
  if ([(TSADocumentViewController *)self contentView] && self->_registered)
  {
    objc_opt_class();
    [(TSDEditorController *)[(TSDInteractiveCanvasController *)self->_interactiveCanvasController editorController] textInputEditor];
    double v5 = (void *)TSUDynamicCast();
    if (self->_documentMode == 1
      && (([v5 trackingKnobInParagraphMode] & 1) != 0
       || [(TSAViewController *)self isPresentingModalViewController]))
    {
      [(TSADocumentViewController *)self adjustContentViewFrame];
      [(TSADocumentViewController *)self adjustScrollViewInsets];
    }
    else
    {
      double v6 = (void *)[a3 userInfo];
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", *MEMORY[0x263F1D3F8]), "floatValue");
      float v8 = v7;
      if (objc_msgSend(+[TSAApplicationDelegate sharedDelegate](TSAApplicationDelegate, "sharedDelegate"), "isActivating"))
      {
        double v9 = 0.0;
        uint64_t v10 = 4;
      }
      else
      {
        if (self->_documentModeChangeInProgress) {
          double v9 = 0.2;
        }
        else {
          double v9 = v8;
        }
        if (self->_documentModeChangeInProgress) {
          uint64_t v10 = 196612;
        }
        else {
          uint64_t v10 = 4;
        }
      }
      uint64_t v11 = [MEMORY[0x263F1C408] sharedApplication];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __54__TSADocumentViewController_keyboardWillHideOrUndock___block_invoke;
      v13[3] = &unk_2646B06B0;
      v13[4] = v11;
      v13[5] = self;
      *(double *)&void v13[6] = v9;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __54__TSADocumentViewController_keyboardWillHideOrUndock___block_invoke_2;
      v12[3] = &unk_2646B3ED0;
      v12[4] = self;
      v12[5] = v11;
      [MEMORY[0x263F1CB60] animateWithDuration:v10 delay:v13 options:v12 animations:v9 completion:0.0];
      if (self->_waitingToZoomOut)
      {
        [(TSADocumentViewController *)self zoomOutAnimated:1];
        self->_waitingToZoomOut = 0;
      }
    }
  }
}

uint64_t __54__TSADocumentViewController_keyboardWillHideOrUndock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) beginIgnoringInteractionEvents];
  *(void *)(*(void *)(a1 + 40) + 1168) = *(void *)(a1 + 48);
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 adjustScrollViewInsets];
}

uint64_t __54__TSADocumentViewController_keyboardWillHideOrUndock___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1168) = 0;
  return [*(id *)(a1 + 40) endIgnoringInteractionEvents];
}

- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(TIADocument *)self->_document documentRoot] == a4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v4 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v22;
      double v18 = @"selection";
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(a3);
          }
          float v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
          if (objc_msgSend(v8, "kind", v18) == 2)
          {
            double v9 = (void *)[v8 details];
            uint64_t v10 = [v9 objectForKey:@"model"];
            objc_opt_class();
            [v9 objectForKey:v18];
            uint64_t v11 = TSUDynamicCast();
            objc_opt_class();
            [v9 objectForKey:@"flags"];
            uint64_t v12 = [(id)TSUDynamicCast() unsignedIntegerValue];
            if (v10)
            {
              if (v11)
              {
LABEL_10:
                [(TSADocumentViewController *)self setSelection:v11 onModel:v10 withFlags:v12 | 0x40];
                goto LABEL_11;
              }
            }
            else
            {
              uint64_t v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
              uint64_t v14 = [NSString stringWithUTF8String:"-[TSADocumentViewController asyncProcessChanges:forChangeSource:]"];
              objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 4130, @"bad model in a selection change record");
              if (v11) {
                goto LABEL_10;
              }
            }
            double v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v16 = [NSString stringWithUTF8String:"-[TSADocumentViewController asyncProcessChanges:forChangeSource:]"];
            objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSADocumentViewController.m"), 4131, @"bad selection in a selection change record");
            goto LABEL_10;
          }
LABEL_11:
          ++v7;
        }
        while (v5 != v7);
        uint64_t v17 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v5 = v17;
      }
      while (v17);
    }
  }
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)isPrintingCanvas
{
  return 0;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  return (unint64_t)(self->_documentMode - 1) < 2;
}

- (double)autoZoomAnimationDurationForInteractiveCanvasController:(id)a3
{
  uint64_t v4 = [(TSADocumentViewController *)self presentedViewController];
  double result = 0.0;
  if (!v4)
  {
    double result = self->_contentFrameAnimationDuration;
    if (result == 0.0) {
      return 0.3;
    }
  }
  return result;
}

- (void)editorDidChangeSelection:(id)a3
{
  if ([(TSADocumentViewController *)self documentMode] != 2
    && ![(TSADocumentViewController *)self preventDocumentModeChangesDuringSelectionChanges])
  {
    [(TSADocumentViewController *)self setDocumentMode:1 animated:1];
  }
  if ([(TSADocumentViewController *)self p_shouldZoomOutForCurrentSelection])
  {
    [(TSADocumentViewController *)self p_zoomOutForCurrentSelection];
  }
}

- (id)rectanglesObscuringView:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF8C0], "array", a3);
  objc_msgSend((id)-[TSADocumentViewController view](self, "view"), "frame");
  CGFloat v8 = v5;
  CGFloat v10 = v9;
  CGFloat v11 = v6;
  CGFloat v12 = v7;
  memset(&remainder, 0, sizeof(remainder));
  CGSize v13 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v18.origin = (CGPoint)*MEMORY[0x263F001A8];
  v18.size = v13;
  double keyboardHeight = self->_keyboardHeight;
  if (keyboardHeight > 0.0)
  {
    CGFloat v15 = v10;
    CGRectDivide(*(CGRect *)&v5, &v18, &remainder, keyboardHeight, CGRectMaxYEdge);
    uint64_t v4 = objc_msgSend(v4, "arrayByAddingObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", *(_OWORD *)&v18.origin, *(_OWORD *)&v18.size));
  }
  double footerHeightPadding = self->_footerHeightPadding;
  if (footerHeightPadding > 0.0)
  {
    v20.origin.CGFloat x = v8;
    v20.origin.CGFloat y = v10;
    v20.size.CGFloat width = v11;
    v20.size.CGFloat height = v12;
    CGRectDivide(v20, &v18, &remainder, footerHeightPadding, CGRectMaxYEdge);
    uint64_t v4 = objc_msgSend(v4, "arrayByAddingObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", *(_OWORD *)&v18.origin, *(_OWORD *)&v18.size));
  }
  if ([(TSADocumentViewController *)self documentMode] == 2)
  {
    objc_msgSend((id)-[TSAFindReplaceUIController view](-[TSADocumentViewController findReplaceUIController](self, "findReplaceUIController"), "view"), "frame");
    return (id)objc_msgSend(v4, "arrayByAddingObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:"));
  }
  return v4;
}

- (id)drawableFactory
{
  uint64_t v2 = [(TSADocumentViewController *)self documentRoot];

  return [(TSADocumentRoot *)v2 drawableFactory];
}

- (void)willInsertDrawable
{
  if (TSUPhoneUI()
    && [(TSDInteractiveCanvasController *)[(TSADocumentViewController *)self interactiveCanvasController] shouldZoomOnSelectionChange])
  {
    [(TSADocumentViewController *)self zoomOutAnimated:0];
  }
}

- (BOOL)showEditMenuOnChartInsert
{
  return 1;
}

- (double)paddingAboveHalfHeightAtTopOfScreen
{
  return 0.0;
}

- (id)superviewForChartDataEditor:(id)a3
{
  BOOL v3 = (void *)[(TSADocumentViewController *)self applicationViewController];

  return (id)[v3 view];
}

- (BOOL)shouldIgnoreTextGestures
{
  return [(TSADocumentViewController *)self documentMode] == 2;
}

- (BOOL)toolsControllerIsVisible
{
  return 0;
}

- (BOOL)insertControllerIsVisible
{
  return 0;
}

- (void)p_scrollToRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = [(TSADocumentViewController *)self interactiveCanvasController];

  -[TSDInteractiveCanvasController scrollRectToVisibleCenter:animated:onlyScrollNecessaryAxes:](v7, "scrollRectToVisibleCenter:animated:onlyScrollNecessaryAxes:", 1, 0, x, y, width, height);
}

- (void)p_scrollToCurrentSelection
{
  id v3 = [(TSDEditorController *)[(TSDInteractiveCanvasController *)[(TSADocumentViewController *)self interactiveCanvasController] editorController] textInputEditor];
  if (objc_opt_respondsToSelector())
  {
    char v7 = 1;
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v3 performSelector:sel_shouldScrollToCurrentSelection_ withObject:&v7], v7))
    {
      long long v4 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
      long long v5 = *MEMORY[0x263F001A8];
      long long v6 = v4;
      [v3 performSelector:sel_selectionRect_ withObject:&v5];
      -[TSADocumentViewController p_scrollToRect:](self, "p_scrollToRect:", v5, v6);
    }
  }
}

- (int64_t)p_documentModeToRestoreFor:(int64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return a3;
  }
}

- (TSDiOSCanvasViewController)canvasViewController
{
  return self->_canvasViewController;
}

- (void)setCanvasViewController:(id)a3
{
}

- (TSANavigatorViewController)navigatorViewController
{
  return self->_navigatorViewController;
}

- (void)setNavigatorViewController:(id)a3
{
}

- (UIScrollView)canvasScrollView
{
  return &self->_scrollView->super.super;
}

- (BOOL)isDocumentLoaded
{
  return self->_isDocumentLoaded;
}

- (BOOL)isClosingDocument
{
  return self->_isClosingDocument;
}

- (int64_t)documentMode
{
  return self->_documentMode;
}

- (BOOL)shouldShowInstructionalText
{
  return self->_shouldShowInstructionalText;
}

- (BOOL)isPrintingDocument
{
  return self->_isPrintingDocument;
}

- (BOOL)isHidingStatusBar
{
  return self->_isHidingStatusBar;
}

- (void)setHidingStatusBar:(BOOL)a3
{
  self->_isHidingStatusBar = a3;
}

- (BOOL)isLandscapeOrientation
{
  return self->_isLandscapeOrientation;
}

- (void)setIsLandscapeOrientation:(BOOL)a3
{
  self->_isLandscapeOrientation = a3;
}

- (TSAInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
}

- (UIButton)coachingTipsButton
{
  return self->_coachingTipsButton;
}

- (TIADocument)document
{
  return self->_document;
}

- (TSAFindReplaceUIController)findReplaceUIController
{
  return self->_findReplaceUIController;
}

- (BOOL)printerOptionsShowing
{
  return self->_printerOptionsShowing;
}

- (void)setPrinterOptionsShowing:(BOOL)a3
{
  self->_printerOptionsShowing = a3;
}

- (BOOL)isPopoverGestureInFlight
{
  return self->_isPopoverGestureInFlight;
}

- (BOOL)preventDocumentModeChangesDuringSelectionChanges
{
  return self->_preventDocumentModeChangesDuringSelectionChanges;
}

- (TSKUIAlert)openDocumentKeepOrDeleteAlert
{
  return self->_openDocumentKeepOrDeleteAlert;
}

- (void)setOpenDocumentKeepOrDeleteAlert:(id)a3
{
}

- (UIButton)sharingButton
{
  return self->_sharingButton;
}

- (BOOL)editMenuTapGRWasEnabledForFind
{
  return self->_editMenuTapGRWasEnabledForFind;
}

- (void)setEditMenuTapGRWasEnabledForFind:(BOOL)a3
{
  self->_editMenuTapGRWasEnabledForFind = a3;
}

- (TSASyncResolveConflictViewController)_openDocumentResolveConflictViewController
{
  return self->__openDocumentResolveConflictViewController;
}

- (void)set_openDocumentResolveConflictViewController:(id)a3
{
}

- (TSKUIAlert)_openDocumentUpdatedAlert
{
  return self->__openDocumentUpdatedAlert;
}

- (void)_setOpenDocumentUpdatedAlert:(id)a3
{
}

- (TSKUIAlert)_openDocumentEvictionAlert
{
  return self->__openDocumentEvictionAlert;
}

- (void)set_openDocumentEvictionAlert:(id)a3
{
}

@end