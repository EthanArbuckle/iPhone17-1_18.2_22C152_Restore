@interface ICiOSTableAttachmentViewController
- (BOOL)becomeFirstResponderForAuxStyling;
- (BOOL)canConvertToTag;
- (BOOL)canConvertToText;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)cursorPrefersWordBoundary;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isMenuHiding;
- (BOOL)isObservingContentOffset;
- (BOOL)isShowingTextStyleOptions;
- (BOOL)isTouchingColumnButton;
- (BOOL)isTouchingRowButton;
- (BOOL)isTrackingAnalyticsEdit;
- (BOOL)resignFirstResponderForAuxStyling;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (CGPoint)initialDragOffset;
- (CGPoint)previousNoteContentOffset;
- (CGPoint)previousViewOrigin;
- (CGRect)editingViewport;
- (ICNAEventReporter)eventReporter;
- (NSObject)keyboardWillShowScrollObservation;
- (UILongPressGestureRecognizer)rowLongPress;
- (UITextView)biuTextView;
- (_NSRange)previousSelectedRange;
- (id)addColumnAction;
- (id)addRowAction;
- (id)auxiliaryTextViewHost;
- (id)columnMenu;
- (id)copySelectionAction;
- (id)cutSelectionAction;
- (id)dragSnapshotFromRect:(CGRect)a3 afterScreenUpdates:(BOOL)a4;
- (id)formatMenu;
- (id)icTableDataFromPasteboard;
- (id)noteEditorViewController;
- (id)notesDataFromPasteboard;
- (id)pasteSelectionAction;
- (id)removeColumnAction;
- (id)removeRowAction;
- (id)rowMenu;
- (id)soloPlainTextStringFromPasteboard;
- (id)toggleBoldAction;
- (id)toggleItalicAction;
- (id)toggleStrikethroughAction;
- (id)toggleTableDirectionAction;
- (id)toggleUnderlineAction;
- (unint64_t)preferredNavigationSelection;
- (void)adjustScrollPositionByOffset:(CGPoint)a3;
- (void)beginEditingCellWithColumnID:(id)a3 andRowID:(id)a4 textRange:(id)a5;
- (void)beginEditingNoteAtRange:(_NSRange)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)cellFirstResponderChanged;
- (void)cleanUpKVOIfNeeded;
- (void)columnButtonMenuActionTriggered:(id)a3;
- (void)columnButtonPressed:(id)a3;
- (void)columnButtonTouched:(id)a3;
- (void)convertToTag:(id)a3;
- (void)convertToText:(id)a3;
- (void)convertUnconfirmedHashtagsMentionsIfNecessary;
- (void)copySelection:(id)a3;
- (void)dealloc;
- (void)didBeginEditingWithTextView:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)didTapEmptyTable:(id)a3;
- (void)didUpdateContentSize;
- (void)dragCellRange:(id)a3;
- (void)dragColumn:(id)a3;
- (void)dragRow:(id)a3;
- (void)dragTextRange:(id)a3;
- (void)ensureGesturesOnSelectionGrabbers:(id)a3;
- (void)eventReporterLostSession:(id)a3;
- (void)ic_makeFirstResponder:(id)a3;
- (void)ic_resignFirstResponder:(id)a3;
- (void)invalidateCachedChildrenForAccessibilityReparenting;
- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5;
- (void)loadView;
- (void)makeDelegateOfTextView:(id)a3;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)menuDidHide:(id)a3;
- (void)menuWillHide:(id)a3;
- (void)moveAccessibilityFocusToSelectedColumnOrRowButton;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)paste:(id)a3;
- (void)performInitialLayoutIfNeeded;
- (void)rowButtonMenuActionTriggered:(id)a3;
- (void)rowButtonPressed:(id)a3;
- (void)rowButtonTouched:(id)a3;
- (void)scrollToCaretIfNeededForTextView:(id)a3;
- (void)scrollToRect:(CGRect)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)selectCell;
- (void)selectCurrentColumnForAccessibility;
- (void)selectCurrentRowForAccessibility;
- (void)selectionDidResignFirstResponder:(id)a3;
- (void)sendAnalyticsForEndEditIfNeeded;
- (void)sendAnalyticsForStartEditIfNeeded;
- (void)setBiuTextView:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setInitialDragOffset:(CGPoint)a3;
- (void)setIsObservingContentOffset:(BOOL)a3;
- (void)setIsTrackingAnalyticsEdit:(BOOL)a3;
- (void)setKeyboardWillShowScrollObservation:(id)a3;
- (void)setMenuHiding:(BOOL)a3;
- (void)setPreviousNoteContentOffset:(CGPoint)a3;
- (void)setPreviousSelectedRange:(_NSRange)a3;
- (void)setPreviousViewOrigin:(CGPoint)a3;
- (void)setRowLongPress:(id)a3;
- (void)setShowingTextStyleOptions:(BOOL)a3;
- (void)setTextViewWritingDirection:(int64_t)a3 sender:(id)a4;
- (void)setTouchingColumnButton:(BOOL)a3;
- (void)setTouchingRowButton:(BOOL)a3;
- (void)setupEventHandling;
- (void)setupKVOIfNeeded;
- (void)setupTableTextView:(id)a3;
- (void)shareTable:(id)a3;
- (void)showButtonsAtColumns:(id)a3 rows:(id)a4;
- (void)showRangeSelectionMenu;
- (void)showRangeSelectionMenuAfterDelay;
- (void)showSelectionMenuFromRect:(CGRect)a3;
- (void)speakAccessibilityAnnouncementForMoveToCellWithColumnID:(id)a3 rowID:(id)a4;
- (void)speakAccessibilityExitedTableAnnouncementAndDidRemoveRow:(BOOL)a3;
- (void)strikethrough:(id)a3;
- (void)tableAttachmentDidChange;
- (void)tableAttachmentSelectionDidChange:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)unselectColumnRow;
- (void)updateAccessibilityValueForColumnAndRowButtons;
- (void)updateChrome;
- (void)updateKeyboardAppearanceForTextView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBeginEditingWithTextView:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation ICiOSTableAttachmentViewController

- (void)dealloc
{
  v3 = [(ICiOSTableAttachmentViewController *)self rowLongPress];

  if (v3)
  {
    v4 = [(ICiOSTableAttachmentViewController *)self ic_viewControllerManager];
    v5 = [v4 mainSplitViewController];
    v6 = [v5 viewControllerForColumn:3];

    objc_opt_class();
    v7 = ICDynamicCast();
    v8 = [v7 interactivePopGestureRecognizer];

    v9 = [(ICiOSTableAttachmentViewController *)self rowLongPress];
    [v8 removeFailureRequirement:v9];
  }
  [(ICiOSTableAttachmentViewController *)self cleanUpKVOIfNeeded];
  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 removeObserver:self];

  v11.receiver = self;
  v11.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v11 dealloc];
}

- (CGRect)editingViewport
{
  v3 = [(ICiOSTableAttachmentViewController *)self noteScrollView];
  v4 = [(ICiOSTableAttachmentViewController *)self view];
  v5 = [v4 superview];

  if (v5)
  {
    v6 = [(ICTableAttachmentViewController *)self tableContentView];
    [v3 contentOffset];
    objc_msgSend(v6, "convertPoint:fromView:", v3);
    double v8 = v7;
  }
  else
  {
    [v3 contentOffset];
    double v10 = v9;
    [(ICTableAttachmentViewController *)self proposedLineFragmentRect];
    double v12 = v10 - v11;
    v13 = [(ICTableAttachmentViewController *)self noteTextView];
    [v13 textContainerInset];
    v14 = [(ICTableAttachmentViewController *)self noteTextView];
    v15 = [v14 textContainer];
    [v15 lineFragmentPadding];

    v6 = [(ICTableAttachmentViewController *)self noteTextView];
    [v6 textContainerInset];
    double v8 = v12 - v16;
  }

  v17 = [(ICTableAttachmentViewController *)self scrollView];
  [v17 contentOffset];
  double v19 = v18;

  if (v3)
  {
    [(ICTableAttachmentViewController *)self availableWidth];
    double v21 = v20;
    [v3 bounds];
    double v23 = v22;
  }
  else
  {
    double v21 = 0.0;
    double v23 = 0.0;
  }

  double v24 = v19;
  double v25 = v8;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)noteEditorViewController
{
  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  objc_opt_class();
  v4 = [(ICiOSTableAttachmentViewController *)self parentViewController];
  v5 = v4;
  if (IsTextKit2Enabled)
  {
    v6 = ICCheckedDynamicCast();
  }
  else
  {
    double v7 = [v4 parentViewController];
    v6 = ICCheckedDynamicCast();
  }

  return v6;
}

- (id)auxiliaryTextViewHost
{
  v2 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  objc_opt_class();
  v3 = ICClassAndProtocolCast();

  return v3;
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v7 loadView];
  v3 = [(ICTableAttachmentViewController *)self scrollView];
  [v3 setDirectionalLockEnabled:1];

  v4 = [(ICTableAttachmentViewController *)self scrollView];
  [v4 setShowsVerticalScrollIndicator:0];

  v5 = [(ICTableAttachmentViewController *)self scrollView];
  [v5 setDelegate:self];

  v6 = [(ICTableAttachmentViewController *)self headerClipView];
  [v6 setAutoresizingMask:34];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICiOSTableAttachmentViewController *)&v7 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel_dragCellRange_];
  [v3 setMinimumPressDuration:0.0];
  v4 = [(ICTableAttachmentViewController *)self startKnob];
  [v4 addGestureRecognizer:v3];

  v5 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel_dragCellRange_];
  [v5 setMinimumPressDuration:0.0];
  v6 = [(ICTableAttachmentViewController *)self endKnob];
  [v6 addGestureRecognizer:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICiOSTableAttachmentViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICiOSTableAttachmentViewController *)&v4 viewDidAppear:a3];
  [(ICiOSTableAttachmentViewController *)self setupKVOIfNeeded];
  if (ICInternalSettingsIsTextKit2Enabled()) {
    [(ICTableAttachmentViewController *)self updateAllColumnWidthsAndRedraw];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICiOSTableAttachmentViewController *)&v4 viewWillDisappear:a3];
  [(ICiOSTableAttachmentViewController *)self cleanUpKVOIfNeeded];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICiOSTableAttachmentViewController *)&v13 viewWillLayoutSubviews];
  objc_super v3 = [(ICiOSTableAttachmentViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(ICTableAttachmentViewController *)self scrollView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  [(ICTableAttachmentViewController *)self updateTiles];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICiOSTableAttachmentViewController *)&v8 viewDidLayoutSubviews];
  if ([(ICTableAttachmentViewController *)self shouldBeginInitialEditing])
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__ICiOSTableAttachmentViewController_viewDidLayoutSubviews__block_invoke;
    block[3] = &unk_2640B7F90;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x263EF83A0], block);
    [(ICTableAttachmentViewController *)self setShouldBeginInitialEditing:0];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  [(ICiOSTableAttachmentViewController *)self performInitialLayoutIfNeeded];
  objc_super v3 = [(ICTableAttachmentViewController *)self textViewManager];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__ICiOSTableAttachmentViewController_viewDidLayoutSubviews__block_invoke_2;
  v4[3] = &unk_2640B8AE8;
  v4[4] = self;
  [v3 enumerateTextViewsWithBlock:v4];
}

void __59__ICiOSTableAttachmentViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained beginEditingInitialCell];
}

uint64_t __59__ICiOSTableAttachmentViewController_viewDidLayoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateKeyboardAppearanceForTextView:a2];
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICiOSTableAttachmentViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3) {
    [(ICiOSTableAttachmentViewController *)self cleanUpKVOIfNeeded];
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICiOSTableAttachmentViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_);
  if (a3)
  {
    objc_super v5 = [(ICTableAttachmentViewController *)self textViewManager];
    [v5 parentViewDidChange];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)ICiOSTableAttachmentViewController;
  -[ICiOSTableAttachmentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [(ICiOSTableAttachmentViewController *)self editingViewport];
  -[ICTableAttachmentViewController setTransitionViewport:](self, "setTransitionViewport:");
  if (ICInternalSettingsIsTextKit2Enabled()) {
    [(ICTableAttachmentViewController *)self updateAllColumnWidthsAndRedraw];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__ICiOSTableAttachmentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_2640B8050;
  v8[4] = self;
  [v7 animateAlongsideTransition:&__block_literal_global_2 completion:v8];
}

void __89__ICiOSTableAttachmentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTransitionViewport:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__ICiOSTableAttachmentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  block[3] = &unk_2640B8B30;
  objc_copyWeak(&v3, &location);
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __89__ICiOSTableAttachmentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained updateAllColumnWidthsAndRedraw];
    id v3 = [*(id *)(a1 + 32) currentlyEditingTextView];

    id WeakRetained = v6;
    if (v3)
    {
      double v4 = *(void **)(a1 + 32);
      objc_super v5 = [v4 currentlyEditingTextView];
      [v4 scrollToCaretIfNeededForTextView:v5];

      id WeakRetained = v6;
    }
  }
}

- (void)setupKVOIfNeeded
{
  if (![(ICiOSTableAttachmentViewController *)self isObservingContentOffset])
  {
    id v3 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
    char v4 = [v3 isEditingOnSystemPaper];

    if ((v4 & 1) == 0)
    {
      objc_super v5 = [(ICiOSTableAttachmentViewController *)self noteScrollView];
      objc_msgSend(v5, "ic_addObserver:forKeyPath:context:", self, @"contentOffset", &compoundliteral);

      [(ICiOSTableAttachmentViewController *)self setIsObservingContentOffset:1];
    }
    id v6 = [(ICiOSTableAttachmentViewController *)self view];
    objc_msgSend(v6, "ic_addObserver:forKeyPath:context:", self, @"frame", &compoundliteral_629);
  }
}

- (void)cleanUpKVOIfNeeded
{
  if ([(ICiOSTableAttachmentViewController *)self isObservingContentOffset])
  {
    id v3 = [(ICiOSTableAttachmentViewController *)self noteScrollView];
    objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, @"contentOffset", &compoundliteral);

    char v4 = [(ICiOSTableAttachmentViewController *)self view];
    objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"frame", &compoundliteral_629);

    [(ICiOSTableAttachmentViewController *)self setIsObservingContentOffset:0];
  }
  objc_super v5 = [(ICiOSTableAttachmentViewController *)self keyboardWillShowScrollObservation];

  if (v5)
  {
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    id v6 = [(ICiOSTableAttachmentViewController *)self keyboardWillShowScrollObservation];
    [v7 removeObserver:v6];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  if ([(ICiOSTableAttachmentViewController *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/Common/TextAttachmentUI/iOS/ICiOSTableAttachmentViewController.m"])
  {
    char v13 = [(ICiOSTableAttachmentViewController *)self ic_shouldIgnoreObserveValue:v11 ofObject:v10 forKeyPath:v12];

    if ((v13 & 1) == 0)
    {
      if (a6 == &compoundliteral)
      {
        if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
          [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICiOSTableAttachmentViewController observeValueForKeyPath:ofObject:change:context:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
        }
        [(ICiOSTableAttachmentViewController *)self previousNoteContentOffset];
        double v25 = v24;
        double v27 = v26;
        v28 = [(ICiOSTableAttachmentViewController *)self noteScrollView];
        [v28 contentOffset];
        double v30 = v29;
        double v32 = v31;

        if (v25 != v30 || v27 != v32)
        {
          v33 = [(ICiOSTableAttachmentViewController *)self noteScrollView];
          [v33 contentOffset];
          -[ICiOSTableAttachmentViewController setPreviousNoteContentOffset:](self, "setPreviousNoteContentOffset:");

          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __85__ICiOSTableAttachmentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
          v34[3] = &unk_2640B8140;
          v34[4] = self;
          objc_msgSend(MEMORY[0x263F82E00], "ic_performWithoutAnimation:", v34);
          [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_scrollViewDidEndScrollingAnimation_ object:v10];
          [(ICiOSTableAttachmentViewController *)self performSelector:sel_scrollViewDidEndScrollingAnimation_ withObject:v10 afterDelay:0.2];
        }
      }
      else if (a6 == &compoundliteral_629)
      {
        if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
          [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICiOSTableAttachmentViewController observeValueForKeyPath:ofObject:change:context:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
        }
        [(ICiOSTableAttachmentViewController *)self previousViewOrigin];
        double v15 = v14;
        double v17 = v16;
        double v18 = [(ICiOSTableAttachmentViewController *)self view];
        [v18 frame];
        double v20 = v19;
        double v22 = v21;

        if (v15 != v20 || v17 != v22)
        {
          double v23 = [(ICiOSTableAttachmentViewController *)self view];
          [v23 frame];
          -[ICiOSTableAttachmentViewController setPreviousViewOrigin:](self, "setPreviousViewOrigin:");

          [(ICTableAttachmentViewController *)self updateTiles];
        }
      }
    }
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)ICiOSTableAttachmentViewController;
    [(ICiOSTableAttachmentViewController *)&v35 observeValueForKeyPath:v12 ofObject:v10 change:v11 context:a6];
  }
}

uint64_t __85__ICiOSTableAttachmentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTiles];
}

- (void)scrollViewDidScroll:(id)a3
{
  [(ICTableAttachmentViewController *)self updateTiles];
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  char v4 = [(ICTableAttachmentViewController *)self scrollView];
  [v5 postNotificationName:@"ICTableScrollViewBoundsDidChangeNotification" object:v4];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_showRangeSelectionMenu object:0];
    [(ICiOSTableAttachmentViewController *)self performSelector:sel_showRangeSelectionMenu withObject:0 afterDelay:0.2];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_showRangeSelectionMenu object:0];

  [(ICiOSTableAttachmentViewController *)self performSelector:sel_showRangeSelectionMenu withObject:0 afterDelay:0.2];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_scrollViewDidEndScrollingAnimation_ object:a3];

  [(ICiOSTableAttachmentViewController *)self showRangeSelectionMenu];
}

- (void)didUpdateContentSize
{
  v9.receiver = self;
  v9.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v9 didUpdateContentSize];
  [(ICTableAttachmentViewController *)self intrinsicSize];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(ICTableAttachmentViewController *)self scrollView];
  objc_msgSend(v7, "setContentSize:", v4, v6);

  objc_super v8 = [(ICTableAttachmentViewController *)self scrollView];
  [v8 setContentInsetAdjustmentBehavior:2];
}

- (void)adjustScrollPositionByOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(ICTableAttachmentViewController *)self scrollView];
  [v6 contentOffset];
  double v8 = v7;
  double v10 = v9;

  id v11 = [(ICTableAttachmentViewController *)self scrollView];
  objc_msgSend(v11, "setContentOffset:", x + v8, y + v10);
}

- (void)scrollToRect:(CGRect)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  rect.origin.double x = a3.origin.x;
  id v10 = a5;
  if (![(ICTableAttachmentViewController *)self preventScrolling])
  {
    double v74 = width;
    double v72 = height;
    [(ICTableAttachmentViewController *)self viewport];
    double v13 = v12;
    double v15 = v14;
    double v73 = v16;
    double v18 = v17;
    double v19 = [(ICiOSTableAttachmentViewController *)self noteScrollView];
    [v19 contentInset];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    if (ICInternalSettingsIsTextKit2Enabled())
    {
      v28 = [(ICiOSTableAttachmentViewController *)self noteScrollView];
      [v28 safeAreaInsets];
      double v21 = v29;
    }
    double v30 = v13 + v23;
    double v31 = v15 + v21;
    double v32 = v21;
    double v33 = v73 - (v23 + v27);
    double v70 = v32;
    double v34 = v18 - (v25 + v32);
    if (v10) {
      objc_super v35 = v10;
    }
    else {
      objc_super v35 = &__block_literal_global_116;
    }
    id v11 = (void (**)(void))_Block_copy(v35);

    v86.origin.double x = v30;
    v86.origin.double y = v31;
    v86.size.CGFloat width = v73 - (v23 + v27);
    v86.size.CGFloat height = v34;
    CGFloat v36 = v74;
    v97.origin.double x = rect.origin.x;
    v97.origin.double y = y;
    v97.size.CGFloat width = v74;
    v97.size.CGFloat height = v72;
    if (CGRectContainsRect(v86, v97))
    {
      v11[2](v11);
      goto LABEL_27;
    }
    v37 = [(ICiOSTableAttachmentViewController *)self noteScrollView];
    v38 = [(ICTableAttachmentViewController *)self scrollView];
    v39 = [(ICiOSTableAttachmentViewController *)self noteScrollView];
    v40 = [(ICTableAttachmentViewController *)self tableContentView];
    objc_msgSend(v39, "convertRect:fromView:", v40, rect.origin.x, y, v74, v72);
    CGFloat v66 = v42;
    CGFloat v67 = v41;
    CGFloat v64 = v44;
    CGFloat v65 = v43;

    [v37 contentOffset];
    double v68 = v45;
    double v69 = v46;
    v87.origin.double x = rect.origin.x;
    v87.origin.double y = y;
    v87.size.CGFloat width = v74;
    v87.size.CGFloat height = v72;
    double MinY = CGRectGetMinY(v87);
    v88.origin.double x = v30;
    v88.origin.double y = v31;
    v88.size.CGFloat width = v33;
    v88.size.CGFloat height = v34;
    if (MinY < CGRectGetMinY(v88)) {
      goto LABEL_12;
    }
    v89.origin.double x = rect.origin.x;
    v89.origin.double y = y;
    v89.size.CGFloat width = v74;
    v89.size.CGFloat height = v72;
    double MaxY = CGRectGetMaxY(v89);
    v90.origin.double x = v30;
    v90.origin.double y = v31;
    v90.size.CGFloat width = v33;
    v90.size.CGFloat height = v34;
    if (MaxY > CGRectGetMaxY(v90))
    {
LABEL_12:
      v91.origin.double y = v66;
      v91.origin.double x = v67;
      v91.size.CGFloat height = v64;
      v91.size.CGFloat width = v65;
      double v49 = CGRectGetMidY(v91) + v34 * -0.5 - v70;
      [v37 contentSize];
      double v51 = v50 - v34;
      [v37 contentInset];
      double v53 = -v52;
      if (v49 >= v51) {
        double v54 = v51;
      }
      else {
        double v54 = v49;
      }
      CGFloat v36 = v74;
      if (v54 > v53) {
        double v53 = v54;
      }
      double v69 = v53;
    }
    objc_msgSend(v38, "contentOffset", *(void *)&v64, *(void *)&v65, *(void *)&v66, *(void *)&v67);
    double v71 = v55;
    double v75 = v56;
    v92.origin.double x = rect.origin.x;
    v92.origin.double y = y;
    v92.size.CGFloat width = v36;
    v92.size.CGFloat height = v72;
    double MinX = CGRectGetMinX(v92);
    v93.size.CGFloat height = v34;
    v93.origin.double x = v30;
    v93.origin.double y = v31;
    v93.size.CGFloat width = v33;
    if (MinX < CGRectGetMinX(v93)) {
      goto LABEL_20;
    }
    v94.origin.double x = rect.origin.x;
    v94.origin.double y = y;
    v94.size.CGFloat width = v36;
    v94.size.CGFloat height = v72;
    double MaxX = CGRectGetMaxX(v94);
    v95.origin.double x = v30;
    v95.origin.double y = v31;
    v95.size.CGFloat width = v33;
    v95.size.CGFloat height = v34;
    if (MaxX <= CGRectGetMaxX(v95))
    {
      double v62 = v71;
      if (v5)
      {
LABEL_23:
        v63 = (void *)MEMORY[0x263F82E00];
        v79[0] = MEMORY[0x263EF8330];
        v79[1] = 3221225472;
        v79[2] = __71__ICiOSTableAttachmentViewController_scrollToRect_animated_completion___block_invoke_2;
        v79[3] = &unk_2640B8B58;
        id v80 = v37;
        double v82 = v68;
        double v83 = v69;
        id v81 = v38;
        double v84 = v62;
        double v85 = v75;
        *(void *)&rect.origin.double y = MEMORY[0x263EF8330];
        *(void *)&rect.size.CGFloat width = 3221225472;
        *(void *)&rect.size.CGFloat height = __71__ICiOSTableAttachmentViewController_scrollToRect_animated_completion___block_invoke_3;
        v77 = &unk_2640B8B80;
        v78 = v11;
        objc_msgSend(v63, "ic_animateWithDuration:animations:completion:", v79, &rect.origin.y, 0.3);

LABEL_26:
        goto LABEL_27;
      }
    }
    else
    {
LABEL_20:
      v96.origin.double x = rect.origin.x;
      v96.origin.double y = y;
      v96.size.CGFloat width = v36;
      v96.size.CGFloat height = v72;
      double v59 = CGRectGetMidX(v96) + v33 * -0.5;
      [(ICTableAttachmentViewController *)self intrinsicSize];
      double v61 = v60 - v73;
      if (v59 < v61) {
        double v61 = v59;
      }
      double v62 = fmax(v61, 0.0);
      if (v5) {
        goto LABEL_23;
      }
    }
    objc_msgSend(v37, "setContentOffset:", v68, v69);
    objc_msgSend(v38, "setContentOffset:", v62, v75);
    v11[2](v11);
    goto LABEL_26;
  }
  id v11 = (void (**)(void))v10;
LABEL_27:
}

uint64_t __71__ICiOSTableAttachmentViewController_scrollToRect_animated_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 64);
  double v4 = *(double *)(a1 + 72);

  return objc_msgSend(v2, "setContentOffset:", v3, v4);
}

uint64_t __71__ICiOSTableAttachmentViewController_scrollToRect_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginEditingNoteAtRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  objc_opt_class();
  double v6 = [(ICiOSTableAttachmentViewController *)self view];
  ICDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  double v7 = [v10 textView];
  double v8 = [v7 editorController];
  objc_msgSend(v8, "setSelectedRange:", location, length);

  double v9 = [v7 editorController];
  [v9 startEditing];

  [(ICiOSTableAttachmentViewController *)self speakAccessibilityExitedTableAnnouncementAndDidRemoveRow:0];
}

- (id)dragSnapshotFromRect:(CGRect)a3 afterScreenUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(ICTableAttachmentViewController *)self scrollView];
  id v11 = objc_msgSend(v10, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", v4, x, y, width, height, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    [v11 setBackgroundColor:0];
  }
  else
  {
    double v12 = (void *)MEMORY[0x263F825C8];
    double v13 = [(ICiOSTableAttachmentViewController *)self view];
    double v14 = [v13 traitCollection];
    double v15 = objc_msgSend(v12, "ic_attachmentBackgroundColorForTraitCollection:", v14);
    double v16 = [v15 colorWithAlphaComponent:0.7];
    [v11 setBackgroundColor:v16];
  }

  return v11;
}

- (void)setupTableTextView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICiOSTableAttachmentViewController;
  id v4 = a3;
  [(ICTableAttachmentViewController *)&v5 setupTableTextView:v4];
  -[ICiOSTableAttachmentViewController updateKeyboardAppearanceForTextView:](self, "updateKeyboardAppearanceForTextView:", v4, v5.receiver, v5.super_class);
}

- (void)updateKeyboardAppearanceForTextView:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ICTableAttachmentViewController *)self noteTextView];
  objc_msgSend(v4, "setOverrideUserInterfaceStyle:", objc_msgSend(v5, "overrideUserInterfaceStyle"));

  id v6 = [(ICTableAttachmentViewController *)self noteTextView];
  objc_msgSend(v4, "setKeyboardAppearance:", objc_msgSend(v6, "keyboardAppearance"));
}

- (void)setupEventHandling
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_didTapEmptyTable_];
  [v4 setDelegate:self];
  double v3 = [(ICTableAttachmentViewController *)self tableContentView];
  [v3 addGestureRecognizer:v4];
}

- (void)didTapEmptyTable:(id)a3
{
  id v12 = a3;
  if ([v12 state] == 3)
  {
    id v4 = [(ICTableAttachmentViewController *)self table];
    if ([v4 columnCount])
    {
      objc_super v5 = [(ICTableAttachmentViewController *)self table];
      uint64_t v6 = [v5 rowCount];

      if (v6) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    double v7 = [(ICTableAttachmentViewController *)self tableContentView];
    [v12 locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    -[ICTableAttachmentViewController tappedTableAtLocation:](self, "tappedTableAtLocation:", v9, v11);
  }
LABEL_7:
}

- (BOOL)becomeFirstResponderForAuxStyling
{
  v2 = [(ICTableAttachmentViewController *)self selectionHighlightView];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponderForAuxStyling
{
  v2 = [(ICTableAttachmentViewController *)self selectionHighlightView];
  char v3 = [v2 resignFirstResponder];

  return v3;
}

- (void)ic_makeFirstResponder:(id)a3
{
}

- (void)ic_resignFirstResponder:(id)a3
{
}

- (void)makeDelegateOfTextView:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:self];
  [v4 setIcDelegate:self];
  id v5 = [v4 layoutManager];

  [v5 setDelegate:self];
}

- (BOOL)cursorPrefersWordBoundary
{
  return 1;
}

- (unint64_t)preferredNavigationSelection
{
  return 2;
}

- (void)willBeginEditingWithTextView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v7 willBeginEditingWithTextView:a3];
  id v4 = [(ICTableAttachmentViewController *)self noteTextView];
  char v5 = [v4 isEditable];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(ICTableAttachmentViewController *)self noteTextView];
    [v6 setEditable:1];
  }
}

- (void)didBeginEditingWithTextView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v6 didBeginEditingWithTextView:a3];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  char v5 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  [v4 postNotificationName:@"ICNoteEditorViewControllerSelectionDidChangeNotification" object:v5];
}

- (void)cellFirstResponderChanged
{
  v4.receiver = self;
  v4.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v4 cellFirstResponderChanged];
  [(ICiOSTableAttachmentViewController *)self convertUnconfirmedHashtagsMentionsIfNecessary];
  char v3 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  [v3 tableCellFirstResponderChanged];
}

- (void)convertUnconfirmedHashtagsMentionsIfNecessary
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    char v5 = [(ICTableAttachmentViewController *)self currentlyEditingTextStorage];

    if (v5)
    {
      objc_super v6 = [(ICTableAttachmentViewController *)self noteTextView];
      objc_super v7 = [v6 editorController];
      id v34 = [v7 mentionsController];

      double v8 = (void *)MEMORY[0x263F5AC88];
      double v9 = [(ICTableAttachmentViewController *)self currentlyEditingTextStorage];
      uint64_t v10 = [v8 rangeOfUnconfirmedMentionInTextStorage:v9];
      uint64_t v12 = v11;

      if (v10 != 0x7FFFFFFFFFFFFFFFLL && v12)
      {
        double v13 = [(ICTableAttachmentViewController *)self currentlyEditingTextStorage];
        double v14 = [(ICTableAttachmentViewController *)self note];
        double v15 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
        double v16 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
        char v17 = [v16 languageHasSpaces];
        double v18 = [(ICAttachmentViewController *)self attachment];
        BYTE1(v33) = v17;
        LOBYTE(v33) = 1;
        [v34 checkForMentionInEditedRange:v10 ofTextStorage:v12 note:v13 textView:v14 allowAutoExplicitMention:v15 isEndingEditing:1 languageHasSpaces:v33 parentAttachment:v18];
      }
      double v19 = [(ICTableAttachmentViewController *)self noteTextView];
      double v20 = [v19 editorController];
      double v21 = [v20 hashtagController];

      double v22 = (void *)MEMORY[0x263F5AC58];
      double v23 = [(ICTableAttachmentViewController *)self currentlyEditingTextStorage];
      uint64_t v24 = [v22 rangeOfUnconfirmedHashtagInTextStorage:v23];
      uint64_t v26 = v25;

      if (v24 != 0x7FFFFFFFFFFFFFFFLL && v26)
      {
        double v27 = [(ICTableAttachmentViewController *)self currentlyEditingTextStorage];
        v28 = [(ICTableAttachmentViewController *)self note];
        double v29 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
        double v30 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
        char v31 = [v30 languageHasSpaces];
        double v32 = [(ICAttachmentViewController *)self attachment];
        BYTE1(v33) = v31;
        LOBYTE(v33) = 1;
        [v21 checkForHashtagInEditedRange:v24 ofTextStorage:v26 note:v27 textView:v28 allowAutoExplicitHashtag:v29 isEndingEditing:1 languageHasSpaces:v33 parentAttachment:v32];
      }
    }
  }
}

- (void)showButtonsAtColumns:(id)a3 rows:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ICTableAttachmentViewController *)self columnButton];
  if (!v8
    || (double v9 = (void *)v8,
        [(ICTableAttachmentViewController *)self rowButton],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    uint64_t v11 = [ICTableColumnRowButton alloc];
    uint64_t v12 = [(ICTableAttachmentViewController *)self table];
    id v13 = -[ICTableColumnRowButton initAsColumn:isLeftToRight:](v11, "initAsColumn:isLeftToRight:", 1, [v12 isLeftToRight]);
    [(ICTableAttachmentViewController *)self setColumnButton:v13];

    double v14 = [ICTableColumnRowButton alloc];
    double v15 = [(ICTableAttachmentViewController *)self table];
    id v16 = -[ICTableColumnRowButton initAsColumn:isLeftToRight:](v14, "initAsColumn:isLeftToRight:", 0, [v15 isLeftToRight]);
    [(ICTableAttachmentViewController *)self setRowButton:v16];

    char v17 = [(ICTableAttachmentViewController *)self columnButton];
    [v17 addTarget:self action:sel_columnButtonTouched_ forControlEvents:1];

    double v18 = [(ICTableAttachmentViewController *)self columnButton];
    [v18 addTarget:self action:sel_columnButtonPressed_ forControlEvents:64];

    double v19 = [(ICTableAttachmentViewController *)self columnButton];
    [v19 addTarget:self action:sel_columnButtonMenuActionTriggered_ forControlEvents:0x4000];

    double v20 = [(ICTableAttachmentViewController *)self columnButton];
    [v20 setExclusiveTouch:1];

    double v21 = [(ICTableAttachmentViewController *)self columnButton];
    [v21 setShowsMenuAsPrimaryAction:1];

    double v22 = [(ICTableAttachmentViewController *)self rowButton];
    [v22 addTarget:self action:sel_rowButtonTouched_ forControlEvents:1];

    double v23 = [(ICTableAttachmentViewController *)self rowButton];
    [v23 addTarget:self action:sel_rowButtonPressed_ forControlEvents:64];

    uint64_t v24 = [(ICTableAttachmentViewController *)self rowButton];
    [v24 addTarget:self action:sel_rowButtonMenuActionTriggered_ forControlEvents:0x4000];

    uint64_t v25 = [(ICTableAttachmentViewController *)self rowButton];
    [v25 setExclusiveTouch:1];

    uint64_t v26 = [(ICTableAttachmentViewController *)self rowButton];
    [v26 setShowsMenuAsPrimaryAction:1];

    double v27 = [MEMORY[0x263F086E0] mainBundle];
    [v27 localizedStringForKey:@"Column selection handle" value:&stru_26C10E100 table:0];
    v28 = id v79 = v6;
    [(ICTableAttachmentViewController *)self columnButton];
    double v29 = v78 = v7;
    [v29 setAccessibilityLabel:v28];

    double v30 = [MEMORY[0x263F086E0] mainBundle];
    char v31 = [v30 localizedStringForKey:@"Double tap and drag to reorder this column." value:&stru_26C10E100 table:0];
    double v32 = [(ICTableAttachmentViewController *)self columnButton];
    [v32 setAccessibilityHint:v31];

    uint64_t v33 = [MEMORY[0x263F086E0] mainBundle];
    id v34 = [v33 localizedStringForKey:@"Row selection handle" value:&stru_26C10E100 table:0];
    objc_super v35 = [(ICTableAttachmentViewController *)self rowButton];
    [v35 setAccessibilityLabel:v34];

    CGFloat v36 = [MEMORY[0x263F086E0] mainBundle];
    v37 = [v36 localizedStringForKey:@"Double tap and drag to reorder this row." value:&stru_26C10E100 table:0];
    v38 = [(ICTableAttachmentViewController *)self rowButton];
    [v38 setAccessibilityHint:v37];

    v39 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:self action:sel_dragColumn_];
    [v39 setDelegate:self];
    v40 = [(ICTableAttachmentViewController *)self columnButton];
    [v40 addGestureRecognizer:v39];

    double v41 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel_dragColumn_];
    [v41 setDelegate:self];
    [v41 setMinimumPressDuration:0.3];
    double v42 = [(ICTableAttachmentViewController *)self columnButton];
    [v42 addGestureRecognizer:v41];

    double v43 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:self action:sel_dragRow_];
    [v43 setDelegate:self];
    double v44 = [(ICTableAttachmentViewController *)self rowButton];
    [v44 addGestureRecognizer:v43];

    double v45 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel_dragRow_];
    [v45 setDelegate:self];
    [v45 setMinimumPressDuration:0.3];
    double v46 = [(ICTableAttachmentViewController *)self rowButton];
    [v46 addGestureRecognizer:v45];

    [(ICiOSTableAttachmentViewController *)self setRowLongPress:v45];
    v47 = [(ICiOSTableAttachmentViewController *)self ic_viewControllerManager];
    v48 = [v47 mainSplitViewController];
    double v49 = [v48 viewControllerForColumn:3];

    objc_opt_class();
    double v50 = ICDynamicCast();
    double v51 = [v50 interactivePopGestureRecognizer];

    [v51 requireGestureRecognizerToFail:v45];
    double v52 = [(ICiOSTableAttachmentViewController *)self view];
    double v53 = [v52 outsideViews];
    double v54 = [(ICTableAttachmentViewController *)self columnButton];
    [v53 addObject:v54];

    double v55 = [(ICiOSTableAttachmentViewController *)self view];
    double v56 = [v55 outsideViews];
    v57 = [(ICTableAttachmentViewController *)self rowButton];
    [v56 addObject:v57];

    [(ICiOSTableAttachmentViewController *)self invalidateCachedChildrenForAccessibilityReparenting];
    id v7 = v78;

    id v6 = v79;
  }
  v58 = [(ICTableAttachmentViewController *)self columnButton];
  uint64_t v59 = [v58 superview];
  if (v59)
  {
    double v60 = (void *)v59;
    double v61 = [(ICTableAttachmentViewController *)self rowButton];
    double v62 = [v61 superview];

    if (v62) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  v63 = [(ICTableAttachmentViewController *)self headerClipView];
  CGFloat v64 = [(ICTableAttachmentViewController *)self columnButton];
  [v63 addSubview:v64];

  CGFloat v65 = [(ICiOSTableAttachmentViewController *)self view];
  CGFloat v66 = [(ICTableAttachmentViewController *)self rowButton];
  [v65 addSubview:v66];

LABEL_9:
  CGFloat v67 = [(ICTableAttachmentViewController *)self columnButton];
  [v67 setColumnOrRowIdentifiers:v7];

  double v68 = [(ICTableAttachmentViewController *)self rowButton];
  [v68 setColumnOrRowIdentifiers:v6];

  [(ICTableAttachmentViewController *)self showColumnRowButtons];
  double v69 = *MEMORY[0x263F001A8];
  double v70 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v71 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v72 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v73 = [(ICTableAttachmentViewController *)self columnButton];
  objc_msgSend(v73, "setFrame:", v69, v70, v71, v72);

  double v74 = [(ICTableAttachmentViewController *)self rowButton];
  objc_msgSend(v74, "setFrame:", v69, v70, v71, v72);

  [(ICTableAttachmentViewController *)self updateButtonFrames];
  double v75 = [(ICiOSTableAttachmentViewController *)self view];
  v76 = [v75 superview];
  v77 = [(ICiOSTableAttachmentViewController *)self view];
  [v76 bringSubviewToFront:v77];

  [(ICiOSTableAttachmentViewController *)self updateAccessibilityValueForColumnAndRowButtons];
}

- (void)updateChrome
{
  if (![(ICTableAttachmentViewController *)self lockSelection])
  {
    uint64_t v3 = [(ICTableAttachmentViewController *)self tableSelection];
    char v4 = [v3 moving];

    if ((v4 & 1) == 0)
    {
      v16.receiver = self;
      v16.super_class = (Class)ICiOSTableAttachmentViewController;
      [(ICTableAttachmentViewController *)&v16 updateChrome];
      char v5 = [(ICiOSTableAttachmentViewController *)self columnMenu];
      id v6 = [(ICTableAttachmentViewController *)self columnButton];
      [v6 setMenu:v5];

      id v7 = [(ICiOSTableAttachmentViewController *)self rowMenu];
      uint64_t v8 = [(ICTableAttachmentViewController *)self rowButton];
      [v8 setMenu:v7];

      double v9 = [(ICTableAttachmentViewController *)self tableSelection];
      uint64_t v10 = [v9 type];

      if ((unint64_t)(v10 - 1) < 4)
      {
        uint64_t v11 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
        uint64_t v12 = v11;
        id v13 = self;
LABEL_5:
        [v11 setAuxiliaryStylingController:v13];

        return;
      }
      if (!v10)
      {
        double v14 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
        double v15 = [v14 auxiliaryStylingController];

        if (v15 == self)
        {
          uint64_t v11 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
          uint64_t v12 = v11;
          id v13 = 0;
          goto LABEL_5;
        }
      }
    }
  }
}

- (void)unselectColumnRow
{
  v9.receiver = self;
  v9.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v9 unselectColumnRow];
  uint64_t v3 = [(ICTableAttachmentViewController *)self columnButton];
  [v3 setSelected:0];

  char v4 = [(ICiOSTableAttachmentViewController *)self columnMenu];
  char v5 = [(ICTableAttachmentViewController *)self columnButton];
  [v5 setMenu:v4];

  id v6 = [(ICTableAttachmentViewController *)self rowButton];
  [v6 setSelected:0];

  id v7 = [(ICiOSTableAttachmentViewController *)self rowMenu];
  uint64_t v8 = [(ICTableAttachmentViewController *)self rowButton];
  [v8 setMenu:v7];
}

- (void)columnButtonTouched:(id)a3
{
}

void __58__ICiOSTableAttachmentViewController_columnButtonTouched___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isTouchingColumnButton])
  {
    id v2 = [*(id *)(a1 + 32) columnButton];
    [v2 setMenu:0];
  }
}

- (void)columnButtonPressed:(id)a3
{
  id v4 = a3;
  [(ICiOSTableAttachmentViewController *)self setTouchingColumnButton:0];
  uint64_t v5 = [(ICTableAttachmentViewController *)self tableSelection];
  id v6 = [v4 columnOrRowIdentifiers];

  [(id)v5 selectColumns:v6];
  id v7 = [(ICTableAttachmentViewController *)self selectionHighlightView];
  LOBYTE(v5) = objc_msgSend(v7, "ic_isFirstResponder");

  if ((v5 & 1) == 0)
  {
    uint64_t v8 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    [v8 removeFromSuperview];

    objc_super v9 = [(ICTableAttachmentViewController *)self scrollView];
    uint64_t v10 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    [v9 addSubview:v10];

    uint64_t v11 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    [v11 becomeFirstResponder];
  }
  [(ICiOSTableAttachmentViewController *)self updateChrome];
  uint64_t v12 = [(ICTableAttachmentViewController *)self columnButton];
  [v12 setSelected:1];

  id v13 = [(ICiOSTableAttachmentViewController *)self columnMenu];
  double v14 = [(ICTableAttachmentViewController *)self columnButton];
  [v14 setMenu:v13];

  double v15 = [(ICTableAttachmentViewController *)self rowButton];
  [v15 setSelected:0];

  objc_super v16 = [(ICiOSTableAttachmentViewController *)self rowMenu];
  char v17 = [(ICTableAttachmentViewController *)self rowButton];
  [v17 setMenu:v16];

  [(ICTableAttachmentViewController *)self showColumnRowButtons];
  id v18 = [(ICTableAttachmentViewController *)self tableAXController];
  [v18 tableRowOrColumnSelectionDidChange];
}

- (void)columnButtonMenuActionTriggered:(id)a3
{
  [(ICiOSTableAttachmentViewController *)self setTouchingColumnButton:0];
  id v5 = [(ICiOSTableAttachmentViewController *)self columnMenu];
  id v4 = [(ICTableAttachmentViewController *)self columnButton];
  [v4 setMenu:v5];
}

- (void)rowButtonTouched:(id)a3
{
}

void __55__ICiOSTableAttachmentViewController_rowButtonTouched___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isTouchingRowButton])
  {
    id v2 = [*(id *)(a1 + 32) rowButton];
    [v2 setMenu:0];
  }
}

- (void)rowButtonPressed:(id)a3
{
  id v4 = a3;
  [(ICiOSTableAttachmentViewController *)self setTouchingRowButton:0];
  uint64_t v5 = [(ICTableAttachmentViewController *)self tableSelection];
  id v6 = [v4 columnOrRowIdentifiers];

  [(id)v5 selectRows:v6];
  id v7 = [(ICTableAttachmentViewController *)self selectionHighlightView];
  LOBYTE(v5) = objc_msgSend(v7, "ic_isFirstResponder");

  if ((v5 & 1) == 0)
  {
    uint64_t v8 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    [v8 removeFromSuperview];

    objc_super v9 = [(ICTableAttachmentViewController *)self scrollView];
    uint64_t v10 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    [v9 addSubview:v10];

    uint64_t v11 = [(ICTableAttachmentViewController *)self selectionHighlightView];
    [v11 becomeFirstResponder];
  }
  [(ICiOSTableAttachmentViewController *)self updateChrome];
  uint64_t v12 = [(ICTableAttachmentViewController *)self columnButton];
  [v12 setSelected:0];

  id v13 = [(ICiOSTableAttachmentViewController *)self columnMenu];
  double v14 = [(ICTableAttachmentViewController *)self columnButton];
  [v14 setMenu:v13];

  double v15 = [(ICTableAttachmentViewController *)self rowButton];
  [v15 setSelected:1];

  objc_super v16 = [(ICiOSTableAttachmentViewController *)self rowMenu];
  char v17 = [(ICTableAttachmentViewController *)self rowButton];
  [v17 setMenu:v16];

  [(ICTableAttachmentViewController *)self showColumnRowButtons];
  id v18 = [(ICTableAttachmentViewController *)self tableAXController];
  [v18 tableRowOrColumnSelectionDidChange];
}

- (void)rowButtonMenuActionTriggered:(id)a3
{
  [(ICiOSTableAttachmentViewController *)self setTouchingRowButton:0];
  id v5 = [(ICiOSTableAttachmentViewController *)self rowMenu];
  id v4 = [(ICTableAttachmentViewController *)self rowButton];
  [v4 setMenu:v5];
}

- (void)showSelectionMenuFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = [MEMORY[0x263F82950] sharedMenuController];
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  CGFloat MaxX = CGRectGetMaxX(v20);
  objc_super v9 = v18;
  if (MaxX > 0.0)
  {
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = width;
    v21.size.double height = height;
    double MinX = CGRectGetMinX(v21);
    uint64_t v11 = [(ICiOSTableAttachmentViewController *)self view];
    [v11 bounds];
    if (MinX < CGRectGetWidth(v22))
    {
      char v12 = [v18 isMenuVisible];

      objc_super v9 = v18;
      if (v12) {
        goto LABEL_6;
      }
      id v13 = [MEMORY[0x263F08A00] defaultCenter];
      [v13 addObserver:self selector:sel_menuWillHide_ name:*MEMORY[0x263F83840] object:0];

      double v14 = [MEMORY[0x263F08A00] defaultCenter];
      [v14 addObserver:self selector:sel_menuDidHide_ name:*MEMORY[0x263F83838] object:0];

      double v15 = [(ICiOSTableAttachmentViewController *)self view];
      objc_msgSend(v18, "showMenuFromView:rect:", v15, x, y, width, height);

      LODWORD(v15) = *MEMORY[0x263F831C0];
      uint64_t v11 = [MEMORY[0x263F824F8] sharedCalloutBar];
      objc_super v16 = [v11 _accessibleSubviews];
      char v17 = [v16 firstObject];
      UIAccessibilityPostNotification((UIAccessibilityNotifications)v15, v17);
    }
    objc_super v9 = v18;
  }
LABEL_6:
}

- (void)ensureGesturesOnSelectionGrabbers:(id)a3
{
  id v7 = a3;
  id v4 = [v7 gestureRecognizers];
  char v5 = objc_msgSend(v4, "ic_containsObjectOfClass:", objc_opt_class());

  if ((v5 & 1) == 0)
  {
    id v6 = [[ICTableSelectionGrabberRecognizer alloc] initWithTarget:self action:sel_dragTextRange_];
    [(ICTableSelectionGrabberRecognizer *)v6 setMinimumPressDuration:0.0];
    [(ICTableSelectionGrabberRecognizer *)v6 setCancelsTouchesInView:0];
    [(ICTableSelectionGrabberRecognizer *)v6 setDelegate:self];
    [v7 addGestureRecognizer:v6];
  }
}

- (void)dragTextRange:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 2)
  {
    char v5 = [(ICTableAttachmentViewController *)self tableContentView];
    [v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    -[ICTableAttachmentViewController textRangeDraggedAtLocation:](self, "textRangeDraggedAtLocation:", v7, v9);
  }
  else if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__ICiOSTableAttachmentViewController_dragTextRange___block_invoke;
    block[3] = &unk_2640B8140;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __52__ICiOSTableAttachmentViewController_dragTextRange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) textRangeDragEnded];
  id v2 = *(void **)(a1 + 32);

  return [v2 showRangeSelectionMenuAfterDelay];
}

- (void)dragCellRange:(id)a3
{
  id v10 = a3;
  if ([v10 state] == 1)
  {
    id v4 = [v10 view];
    [(ICTableAttachmentViewController *)self cellRangeDragBeganOnView:v4];
  }
  else if ([v10 state] == 2)
  {
    char v5 = [(ICTableAttachmentViewController *)self tableContentView];
    [v10 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    -[ICTableAttachmentViewController cellRangeDraggedAtLocation:](self, "cellRangeDraggedAtLocation:", v7, v9);
  }
  else if ([v10 state] == 3 || objc_msgSend(v10, "state") == 4 || objc_msgSend(v10, "state") == 5)
  {
    [(ICiOSTableAttachmentViewController *)self showRangeSelectionMenu];
  }
}

- (void)selectCell
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self selectionHighlightView];
  [v3 removeFromSuperview];

  id v4 = [(ICiOSTableAttachmentViewController *)self view];
  char v5 = [(ICTableAttachmentViewController *)self selectionHighlightView];
  [v4 addSubview:v5];

  double v6 = [(ICTableAttachmentViewController *)self selectionHighlightView];
  [v6 becomeFirstResponder];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__ICiOSTableAttachmentViewController_selectCell__block_invoke;
  v7[3] = &unk_2640B8140;
  v7[4] = self;
  [MEMORY[0x263F158F8] setCompletionBlock:v7];
}

uint64_t __48__ICiOSTableAttachmentViewController_selectCell__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableSelection];
  uint64_t v3 = [*(id *)(a1 + 32) columnButton];
  id v4 = [v3 columnOrRowIdentifiers];
  char v5 = [*(id *)(a1 + 32) rowButton];
  double v6 = [v5 columnOrRowIdentifiers];
  [v2 selectCellRangeAtColumns:v4 rows:v6];

  [*(id *)(a1 + 32) updateChrome];
  double v7 = *(void **)(a1 + 32);

  return [v7 showRangeSelectionMenu];
}

- (void)showRangeSelectionMenuAfterDelay
{
}

- (void)showRangeSelectionMenu
{
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_showRangeSelectionMenu object:0];
    uint64_t v3 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v4 = [v3 type];

    if (v4 == 4)
    {
      char v5 = [(ICTableAttachmentViewController *)self startKnob];
      [v5 center];
      double v7 = v6;
      double v9 = v8;

      id v10 = [(ICTableAttachmentViewController *)self endKnob];
      [v10 center];
      double v12 = v11;
      double v14 = v13;

      if (v7 >= v12) {
        double v15 = v12;
      }
      else {
        double v15 = v7;
      }
      if (v9 >= v14) {
        double v16 = v14;
      }
      else {
        double v16 = v9;
      }
      double v17 = vabdd_f64(v7, v12);
      double v18 = vabdd_f64(v9, v14);
      -[ICiOSTableAttachmentViewController showSelectionMenuFromRect:](self, "showSelectionMenuFromRect:", v15, v16, v17, v18);
    }
  }
}

- (void)dragColumn:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(ICiOSTableAttachmentViewController *)self view];
  [v11 locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  if ([v11 state] == 1)
  {
    double v9 = [MEMORY[0x263F82950] sharedMenuController];
    [v9 setMenuVisible:0 animated:1];

    id v10 = [MEMORY[0x263F828B0] activeInstance];
    [v10 removeAutocorrection];

    -[ICTableAttachmentViewController dragBeganOnColumnOrRow:atLocation:](self, "dragBeganOnColumnOrRow:atLocation:", 1, v6, v8);
  }
  else if ([v11 state] == 2)
  {
    -[ICTableAttachmentViewController dragMovedOnColumnOrRow:atLocation:](self, "dragMovedOnColumnOrRow:atLocation:", 1, v6, v8);
  }
  else if ([v11 state] == 3 || objc_msgSend(v11, "state") == 5 || objc_msgSend(v11, "state") == 4)
  {
    -[ICTableAttachmentViewController dragEndedOnColumnOrRow:atLocation:](self, "dragEndedOnColumnOrRow:atLocation:", 1, v6, v8);
  }
}

- (void)dragRow:(id)a3
{
  id v19 = a3;
  uint64_t v4 = [(ICiOSTableAttachmentViewController *)self view];
  [v19 locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  if ([v19 state] == 1)
  {
    double v9 = [MEMORY[0x263F82950] sharedMenuController];
    [v9 setMenuVisible:0 animated:1];

    id v10 = [MEMORY[0x263F828B0] activeInstance];
    [v10 removeAutocorrection];

    -[ICTableAttachmentViewController dragBeganOnColumnOrRow:atLocation:](self, "dragBeganOnColumnOrRow:atLocation:", 0, v6, v8);
    id v11 = [(ICTableAttachmentViewController *)self noteTextView];
    [v11 contentInset];
    double v13 = v12;
    double v14 = [(ICTableAttachmentViewController *)self tableAutoScroller];
    [v14 setTopThresholdDistance:v13];

    double v15 = [(ICTableAttachmentViewController *)self noteTextView];
    [v15 contentInset];
    double v17 = v16;
    double v18 = [(ICTableAttachmentViewController *)self tableAutoScroller];
    [v18 setBottomThresholdDistance:v17];
  }
  else if ([v19 state] == 2)
  {
    -[ICTableAttachmentViewController dragMovedOnColumnOrRow:atLocation:](self, "dragMovedOnColumnOrRow:atLocation:", 0, v6, v8);
  }
  else if ([v19 state] == 3 || objc_msgSend(v19, "state") == 5 || objc_msgSend(v19, "state") == 4)
  {
    -[ICTableAttachmentViewController dragEndedOnColumnOrRow:atLocation:](self, "dragEndedOnColumnOrRow:atLocation:", 0, v6, v8);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a3;
  double v6 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v7 = [v6 type];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 view],
        double v8 = objc_claimAutoreleasedReturnValue(),
        [(ICTableAttachmentViewController *)self tableContentView],
        double v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v8 == v9))
  {
    double v15 = [(ICTableAttachmentViewController *)self table];
    if ([v15 columnCount])
    {
      double v16 = [(ICTableAttachmentViewController *)self table];
      char isKindOfClass = [v16 rowCount] == 0;
    }
    else
    {
      char isKindOfClass = 1;
    }
  }
  else
  {
    id v10 = [v5 view];
    id v11 = [(ICTableAttachmentViewController *)self columnButton];

    if (v10 == v11)
    {
      char isKindOfClass = (unint64_t)(v7 - 1) < 2;
    }
    else
    {
      double v12 = [v5 view];
      double v13 = [(ICTableAttachmentViewController *)self rowButton];

      if (v12 == v13)
      {
        char isKindOfClass = (v7 & 0xFFFFFFFFFFFFFFFDLL) == 1;
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)toggleBoldAction
{
  uint64_t v3 = (void *)MEMORY[0x263F823D0];
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 localizedStringForKey:@"Bold" value:&stru_26C10E100 table:0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__ICiOSTableAttachmentViewController_toggleBoldAction__block_invoke;
  v8[3] = &unk_2640B8BA8;
  v8[4] = self;
  double v6 = objc_msgSend(v3, "ic_actionWithTitle:imageName:handler:", v5, @"bold", v8);

  return v6;
}

uint64_t __54__ICiOSTableAttachmentViewController_toggleBoldAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) toggleBoldface:a2];
}

- (id)toggleItalicAction
{
  uint64_t v3 = (void *)MEMORY[0x263F823D0];
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 localizedStringForKey:@"Italic" value:&stru_26C10E100 table:0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__ICiOSTableAttachmentViewController_toggleItalicAction__block_invoke;
  v8[3] = &unk_2640B8BA8;
  v8[4] = self;
  double v6 = objc_msgSend(v3, "ic_actionWithTitle:imageName:handler:", v5, @"italic", v8);

  return v6;
}

uint64_t __56__ICiOSTableAttachmentViewController_toggleItalicAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) toggleItalics:a2];
}

- (id)toggleUnderlineAction
{
  uint64_t v3 = (void *)MEMORY[0x263F823D0];
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 localizedStringForKey:@"Underline" value:&stru_26C10E100 table:0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__ICiOSTableAttachmentViewController_toggleUnderlineAction__block_invoke;
  v8[3] = &unk_2640B8BA8;
  v8[4] = self;
  double v6 = objc_msgSend(v3, "ic_actionWithTitle:imageName:handler:", v5, @"underline", v8);

  return v6;
}

uint64_t __59__ICiOSTableAttachmentViewController_toggleUnderlineAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) toggleUnderline:a2];
}

- (id)toggleStrikethroughAction
{
  uint64_t v3 = (void *)MEMORY[0x263F823D0];
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 localizedStringForKey:@"Strikethrough" value:&stru_26C10E100 table:0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__ICiOSTableAttachmentViewController_toggleStrikethroughAction__block_invoke;
  v8[3] = &unk_2640B8BA8;
  v8[4] = self;
  double v6 = objc_msgSend(v3, "ic_actionWithTitle:imageName:handler:", v5, @"strikethrough", v8);

  return v6;
}

uint64_t __63__ICiOSTableAttachmentViewController_toggleStrikethroughAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) toggleStrikethrough:a2];
}

- (id)toggleTableDirectionAction
{
  if ([MEMORY[0x263F5B3A8] supportsRTL]
    && ([(ICTableAttachmentViewController *)self tableSelection],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = (void *)MEMORY[0x263F823D0];
    id v5 = [MEMORY[0x263F086E0] mainBundle];
    double v6 = [v5 localizedStringForKey:@"Table Direction" value:&stru_26C10E100 table:0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__ICiOSTableAttachmentViewController_toggleTableDirectionAction__block_invoke;
    v9[3] = &unk_2640B8BA8;
    v9[4] = self;
    uint64_t v7 = objc_msgSend(v4, "ic_actionWithTitle:imageName:handler:", v6, @"arrow.left.arrow.right.square.fill", v9);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __64__ICiOSTableAttachmentViewController_toggleTableDirectionAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reverseTableColumnDirection:*(void *)(a1 + 32)];
}

- (id)formatMenu
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self tableSelection];
  if ([v3 isRangeOrSpanningSelection])
  {
    id v4 = [(ICTableAttachmentViewController *)self table];
    id v5 = [(ICTableAttachmentViewController *)self tableSelection];
    double v6 = [v5 columns];
    uint64_t v7 = [(ICTableAttachmentViewController *)self tableSelection];
    double v8 = [v7 rows];
    char v9 = [v4 isEmptyAtColumnIdentifiers:v6 rowIdentifiers:v8];

    if (v9)
    {
      id v10 = 0;
      goto LABEL_7;
    }
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    id v11 = [(ICiOSTableAttachmentViewController *)self toggleBoldAction];
    objc_msgSend(v3, "ic_addNonNilObject:", v11);

    double v12 = [(ICiOSTableAttachmentViewController *)self toggleItalicAction];
    objc_msgSend(v3, "ic_addNonNilObject:", v12);

    double v13 = [(ICiOSTableAttachmentViewController *)self toggleUnderlineAction];
    objc_msgSend(v3, "ic_addNonNilObject:", v13);

    double v14 = [(ICiOSTableAttachmentViewController *)self toggleStrikethroughAction];
    objc_msgSend(v3, "ic_addNonNilObject:", v14);

    double v15 = [(ICiOSTableAttachmentViewController *)self toggleTableDirectionAction];
    objc_msgSend(v3, "ic_addNonNilObject:", v15);

    double v16 = (void *)MEMORY[0x263F82940];
    double v17 = [MEMORY[0x263F086E0] mainBundle];
    double v18 = [v17 localizedStringForKey:@"Format" value:&stru_26C10E100 table:0];
    id v19 = [MEMORY[0x263F827E8] systemImageNamed:@"bold.italic.underline"];
    CGRect v20 = (void *)[v3 copy];
    id v10 = [v16 menuWithTitle:v18 image:v19 identifier:0 options:0 children:v20];
  }
  else
  {
    id v10 = 0;
  }

LABEL_7:

  return v10;
}

- (void)buildMenuWithBuilder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICiOSTableAttachmentViewController;
  id v4 = a3;
  [(ICiOSTableAttachmentViewController *)&v7 buildMenuWithBuilder:v4];
  uint64_t v5 = *MEMORY[0x263F838B8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__ICiOSTableAttachmentViewController_buildMenuWithBuilder___block_invoke;
  v6[3] = &unk_2640B8BD0;
  v6[4] = self;
  [v4 replaceChildrenOfMenuForIdentifier:v5 fromChildrenBlock:v6];
}

id __59__ICiOSTableAttachmentViewController_buildMenuWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v6)
  {

    char v14 = 0;
    char v12 = 0;
    char v13 = 0;
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  uint64_t v23 = a1;
  uint64_t v24 = v4;
  char v25 = 0;
  uint64_t v26 = 0;
  char v8 = 0;
  uint64_t v9 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v28 != v9) {
        objc_enumerationMutation(v5);
      }
      objc_opt_class();
      id v11 = ICDynamicCast();
      if (sel_isEqual((SEL)[v11 action], sel_toggleBoldface_))
      {
        char v8 = 1;
      }
      else if (sel_isEqual((SEL)[v11 action], sel_toggleItalics_))
      {
        LOBYTE(v26) = 1;
      }
      else if (sel_isEqual((SEL)[v11 action], sel_toggleUnderline_))
      {
        char v25 = 1;
      }
      else
      {
        HIDWORD(v26) |= sel_isEqual((SEL)[v11 action], sel_strikethrough_);
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v7);

  if ((v8 & 1) == 0)
  {
    a1 = v23;
    id v4 = v24;
    char v14 = v26;
    char v12 = BYTE4(v26);
    char v13 = v25;
LABEL_20:
    double v15 = [*(id *)(a1 + 32) toggleBoldAction];
    objc_msgSend(v4, "ic_addNonNilObject:", v15);

    if (v14) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  a1 = v23;
  id v4 = v24;
  char v12 = BYTE4(v26);
  char v13 = v25;
  if ((v26 & 1) == 0)
  {
LABEL_21:
    double v16 = [*(id *)(a1 + 32) toggleItalicAction];
    objc_msgSend(v4, "ic_addNonNilObject:", v16);
  }
LABEL_22:
  if ((v13 & 1) == 0)
  {
    double v17 = [*(id *)(a1 + 32) toggleUnderlineAction];
    objc_msgSend(v4, "ic_addNonNilObject:", v17);
  }
  if ((v12 & 1) == 0)
  {
    double v18 = [*(id *)(a1 + 32) toggleStrikethroughAction];
    objc_msgSend(v4, "ic_addNonNilObject:", v18);
  }
  id v19 = [*(id *)(a1 + 32) toggleTableDirectionAction];
  objc_msgSend(v4, "ic_addNonNilObject:", v19);

  CGRect v20 = (void *)[v4 copy];
  CGRect v21 = [v5 arrayByAddingObjectsFromArray:v20];

  return v21;
}

- (id)removeColumnAction
{
  id v3 = [(ICTableAttachmentViewController *)self tableSelection];
  if ([v3 type] == 2)
  {
    id v4 = [(ICTableAttachmentViewController *)self table];
    uint64_t v5 = [v4 columnCount];

    if (v5 != 1)
    {
      uint64_t v6 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v7 = [v6 localizedStringForKey:@"Delete %lu Column" value:&stru_26C10E100 table:0];

      char v8 = (void *)MEMORY[0x263F823D0];
      uint64_t v9 = NSString;
      id v10 = [(ICTableAttachmentViewController *)self tableSelection];
      id v11 = [v10 columns];
      char v12 = objc_msgSend(v9, "localizedStringWithFormat:", v7, objc_msgSend(v11, "count"));
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __56__ICiOSTableAttachmentViewController_removeColumnAction__block_invoke;
      v15[3] = &unk_2640B8BA8;
      v15[4] = self;
      char v13 = objc_msgSend(v8, "ic_actionWithTitle:imageName:handler:", v12, @"rectangle.badge.minus", v15);

      goto LABEL_6;
    }
  }
  else
  {
  }
  char v13 = 0;
LABEL_6:

  return v13;
}

uint64_t __56__ICiOSTableAttachmentViewController_removeColumnAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteSelectedColumns:a2];
}

- (id)addColumnAction
{
  id v3 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v4 = [v3 type];

  if (v4 == 2)
  {
    uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"ADD_COLUMN_MENU_ACTION" value:@"Add Column" table:@"Localizable"];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__ICiOSTableAttachmentViewController_addColumnAction__block_invoke;
    v9[3] = &unk_2640B8BA8;
    v9[4] = self;
    uint64_t v7 = objc_msgSend(MEMORY[0x263F823D0], "ic_actionWithTitle:imageName:handler:", v6, @"rectangle.badge.plus", v9);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __53__ICiOSTableAttachmentViewController_addColumnAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addColumnAfterSelection:a2];
}

- (id)removeRowAction
{
  id v3 = [(ICTableAttachmentViewController *)self tableSelection];
  if ([v3 type] == 3)
  {
    uint64_t v4 = [(ICTableAttachmentViewController *)self table];
    uint64_t v5 = [v4 rowCount];

    if (v5 != 1)
    {
      uint64_t v6 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v7 = [v6 localizedStringForKey:@"Delete %lu Row" value:&stru_26C10E100 table:0];

      char v8 = (void *)MEMORY[0x263F823D0];
      uint64_t v9 = NSString;
      id v10 = [(ICTableAttachmentViewController *)self tableSelection];
      id v11 = [v10 rows];
      char v12 = objc_msgSend(v9, "localizedStringWithFormat:", v7, objc_msgSend(v11, "count"));
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __53__ICiOSTableAttachmentViewController_removeRowAction__block_invoke;
      v15[3] = &unk_2640B8BA8;
      v15[4] = self;
      char v13 = objc_msgSend(v8, "ic_actionWithTitle:imageName:handler:", v12, @"rectangle.badge.minus", v15);

      goto LABEL_6;
    }
  }
  else
  {
  }
  char v13 = 0;
LABEL_6:

  return v13;
}

uint64_t __53__ICiOSTableAttachmentViewController_removeRowAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteSelectedRows:a2];
}

- (id)addRowAction
{
  id v3 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v4 = [v3 type];

  if (v4 == 3)
  {
    uint64_t v5 = (void *)MEMORY[0x263F823D0];
    uint64_t v6 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"Add Row" value:&stru_26C10E100 table:0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__ICiOSTableAttachmentViewController_addRowAction__block_invoke;
    v10[3] = &unk_2640B8BA8;
    v10[4] = self;
    char v8 = objc_msgSend(v5, "ic_actionWithTitle:imageName:handler:", v7, @"rectangle.badge.plus", v10);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

uint64_t __50__ICiOSTableAttachmentViewController_addRowAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addRowBelowSelection:a2];
}

- (id)copySelectionAction
{
  id v3 = [(ICTableAttachmentViewController *)self tableSelection];
  if (([v3 isRangeOrSpanningSelection] & 1) == 0)
  {

    return 0;
  }
  uint64_t v4 = [(ICTableAttachmentViewController *)self table];
  uint64_t v5 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v6 = [v5 columns];
  uint64_t v7 = [(ICTableAttachmentViewController *)self tableSelection];
  char v8 = [v7 rows];
  char v9 = [v4 isEmptyAtColumnIdentifiers:v6 rowIdentifiers:v8];

  if (v9) {
    return 0;
  }
  id v10 = (void *)MEMORY[0x263F823D0];
  id v11 = [MEMORY[0x263F086E0] mainBundle];
  char v12 = [v11 localizedStringForKey:@"Copy" value:&stru_26C10E100 table:0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__ICiOSTableAttachmentViewController_copySelectionAction__block_invoke;
  v15[3] = &unk_2640B8BA8;
  v15[4] = self;
  char v13 = objc_msgSend(v10, "ic_actionWithTitle:imageName:handler:", v12, @"doc.on.doc", v15);

  return v13;
}

uint64_t __57__ICiOSTableAttachmentViewController_copySelectionAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) copySelection:a2];
}

- (id)cutSelectionAction
{
  id v3 = [(ICTableAttachmentViewController *)self tableSelection];
  if ([v3 isRangeOrSpanningSelection])
  {
    uint64_t v4 = [(ICTableAttachmentViewController *)self table];
    uint64_t v5 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v6 = [v5 columns];
    uint64_t v7 = [(ICTableAttachmentViewController *)self tableSelection];
    char v8 = [v7 rows];
    char v9 = [v4 isEmptyAtColumnIdentifiers:v6 rowIdentifiers:v8];

    if ((v9 & 1) == 0)
    {
      id v10 = (void *)MEMORY[0x263F823D0];
      id v11 = [MEMORY[0x263F086E0] mainBundle];
      char v12 = [v11 localizedStringForKey:@"Cut" value:&stru_26C10E100 table:0];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __56__ICiOSTableAttachmentViewController_cutSelectionAction__block_invoke;
      v15[3] = &unk_2640B8BA8;
      v15[4] = self;
      char v13 = objc_msgSend(v10, "ic_actionWithTitle:imageName:handler:", v12, @"scissors", v15);

      goto LABEL_6;
    }
  }
  else
  {
  }
  char v13 = 0;
LABEL_6:

  return v13;
}

uint64_t __56__ICiOSTableAttachmentViewController_cutSelectionAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cutSelection:a2];
}

- (id)pasteSelectionAction
{
  id v3 = [MEMORY[0x263F82A18] generalPasteboard];
  if ([v3 hasStrings])
  {
    uint64_t v4 = [(ICTableAttachmentViewController *)self tableSelection];
    int v5 = [v4 isRangeOrSpanningSelection];

    if (v5)
    {
      uint64_t v6 = (void *)MEMORY[0x263F823D0];
      uint64_t v7 = [MEMORY[0x263F086E0] mainBundle];
      char v8 = [v7 localizedStringForKey:@"Paste" value:&stru_26C10E100 table:0];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __58__ICiOSTableAttachmentViewController_pasteSelectionAction__block_invoke;
      v11[3] = &unk_2640B8BA8;
      v11[4] = self;
      char v9 = objc_msgSend(v6, "ic_actionWithTitle:imageName:handler:", v8, @"doc.on.clipboard", v11);

      goto LABEL_6;
    }
  }
  else
  {
  }
  char v9 = 0;
LABEL_6:

  return v9;
}

uint64_t __58__ICiOSTableAttachmentViewController_pasteSelectionAction__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) pasteIntoSelection:a2];
}

- (id)columnMenu
{
  id v3 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v4 = [v3 type];

  if (v4 == 2)
  {
    int v5 = [MEMORY[0x263EFF980] array];
    uint64_t v6 = [(ICiOSTableAttachmentViewController *)self removeColumnAction];
    objc_msgSend(v5, "ic_addNonNilObject:", v6);

    uint64_t v7 = [(ICiOSTableAttachmentViewController *)self addColumnAction];
    objc_msgSend(v5, "ic_addNonNilObject:", v7);

    char v8 = [(ICiOSTableAttachmentViewController *)self formatMenu];
    objc_msgSend(v5, "ic_addNonNilObject:", v8);

    id v9 = [(ICiOSTableAttachmentViewController *)self copySelectionAction];
    objc_msgSend(v5, "ic_addNonNilObject:", v9);

    id v10 = [(ICiOSTableAttachmentViewController *)self cutSelectionAction];
    objc_msgSend(v5, "ic_addNonNilObject:", v10);

    id v11 = [(ICiOSTableAttachmentViewController *)self pasteSelectionAction];
    objc_msgSend(v5, "ic_addNonNilObject:", v11);

    char v12 = [MEMORY[0x263F82940] menuWithChildren:v5];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)rowMenu
{
  id v3 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v4 = [v3 type];

  if (v4 == 3)
  {
    int v5 = [MEMORY[0x263EFF980] array];
    uint64_t v6 = [(ICiOSTableAttachmentViewController *)self removeRowAction];
    objc_msgSend(v5, "ic_addNonNilObject:", v6);

    uint64_t v7 = [(ICiOSTableAttachmentViewController *)self addRowAction];
    objc_msgSend(v5, "ic_addNonNilObject:", v7);

    char v8 = [(ICiOSTableAttachmentViewController *)self formatMenu];
    objc_msgSend(v5, "ic_addNonNilObject:", v8);

    id v9 = [(ICiOSTableAttachmentViewController *)self copySelectionAction];
    objc_msgSend(v5, "ic_addNonNilObject:", v9);

    id v10 = [(ICiOSTableAttachmentViewController *)self cutSelectionAction];
    objc_msgSend(v5, "ic_addNonNilObject:", v10);

    id v11 = [(ICiOSTableAttachmentViewController *)self pasteSelectionAction];
    objc_msgSend(v5, "ic_addNonNilObject:", v11);

    char v12 = [MEMORY[0x263F82940] menuWithChildren:v5];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  int v5 = self;
  uint64_t v6 = [(ICiOSTableAttachmentViewController *)self biuTextView];

  if (v6)
  {
    if (sel_isEqual(a3, sel_toggleBoldface_)
      || sel_isEqual(a3, sel_toggleItalics_)
      || sel_isEqual(a3, sel_toggleUnderline_))
    {
      goto LABEL_9;
    }
    uint64_t v7 = sel_strikethrough_;
    goto LABEL_6;
  }
  if (sel_isEqual(a3, sel_strikethrough_)) {
    goto LABEL_9;
  }
  if (sel_isEqual(a3, sel_cut_) || sel_isEqual(a3, sel_copy_))
  {
    id v9 = [(ICTableAttachmentViewController *)v5 tableSelection];
    if ([v9 isRangeOrSpanningSelection])
    {
      id v10 = [(ICTableAttachmentViewController *)v5 table];
      id v11 = [(ICTableAttachmentViewController *)v5 tableSelection];
      char v12 = [v11 columns];
      char v13 = [(ICTableAttachmentViewController *)v5 tableSelection];
      char v14 = [v13 rows];
      LODWORD(v5) = [v10 isEmptyAtColumnIdentifiers:v12 rowIdentifiers:v14] ^ 1;

LABEL_15:
LABEL_20:

      return (char)v5;
    }
    goto LABEL_19;
  }
  if (sel_isEqual(a3, sel_paste_))
  {
    id v9 = [MEMORY[0x263F82A18] generalPasteboard];
    if ([v9 hasStrings])
    {
      id v10 = [(ICTableAttachmentViewController *)v5 tableSelection];
      LOBYTE(v5) = [v10 isRangeOrSpanningSelection];
      goto LABEL_15;
    }
LABEL_19:
    LOBYTE(v5) = 0;
    goto LABEL_20;
  }
  if (sel_isEqual(a3, sel_convertToTag_))
  {
    return [(ICiOSTableAttachmentViewController *)v5 canConvertToTag];
  }
  else
  {
    if (!sel_isEqual(a3, sel_convertToText_))
    {
      if (sel_isEqual(a3, sel_makeTextWritingDirectionLeftToRight_))
      {
        if ([MEMORY[0x263F5B3A8] supportsRTL])
        {
          double v15 = [(ICTableAttachmentViewController *)v5 tableSelection];
          uint64_t v16 = [v15 type];

          if (v16 == 2)
          {
            double v17 = [(ICTableAttachmentViewController *)v5 table];
            char v18 = [v17 isRightToLeft];

            return v18;
          }
        }
        if (![MEMORY[0x263F5B3A8] supportsRTL]) {
          goto LABEL_7;
        }
        CGRect v21 = [(ICTableAttachmentViewController *)v5 tableSelection];
        uint64_t v22 = [v21 type];

        if (v22 != 4) {
          goto LABEL_7;
        }
        BOOL v23 = [(ICTableAttachmentViewController *)v5 textDirectionForCurrentSelection] == 1;
      }
      else
      {
        if (!sel_isEqual(a3, sel_makeTextWritingDirectionRightToLeft_))
        {
          if (sel_isEqual(a3, sel_copyTable_)
            || sel_isEqual(a3, sel_shareTable_)
            || sel_isEqual(a3, sel_convertTableToText_))
          {
            goto LABEL_9;
          }
          uint64_t v7 = sel_deleteTable_;
LABEL_6:
          if (!sel_isEqual(a3, v7))
          {
LABEL_7:
            LOBYTE(v5) = 0;
            return (char)v5;
          }
LABEL_9:
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        if ([MEMORY[0x263F5B3A8] supportsRTL])
        {
          id v19 = [(ICTableAttachmentViewController *)v5 tableSelection];
          uint64_t v20 = [v19 type];

          if (v20 == 2)
          {
            id v9 = [(ICTableAttachmentViewController *)v5 table];
            LODWORD(v5) = [v9 isRightToLeft] ^ 1;
            goto LABEL_20;
          }
        }
        if (![MEMORY[0x263F5B3A8] supportsRTL]) {
          goto LABEL_7;
        }
        uint64_t v24 = [(ICTableAttachmentViewController *)v5 tableSelection];
        uint64_t v25 = [v24 type];

        if (v25 != 4) {
          goto LABEL_7;
        }
        BOOL v23 = [(ICTableAttachmentViewController *)v5 textDirectionForCurrentSelection] == 0;
      }
      LOBYTE(v5) = v23;
      return (char)v5;
    }
    return [(ICiOSTableAttachmentViewController *)v5 canConvertToText];
  }
}

- (BOOL)canConvertToTag
{
  id v3 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
  uint64_t v4 = [v3 selectedText];
  if (objc_msgSend(v4, "ic_canConvertToTag")) {
    BOOL v5 = ![(ICiOSTableAttachmentViewController *)self canConvertToText];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)convertToTag:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F5AC68];
  BOOL v5 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
  uint64_t v6 = [v5 selectedText];
  uint64_t v7 = [(ICTableAttachmentViewController *)self note];
  id v19 = [v4 createHashtagAttachmentIfApplicableWithHashtagText:v6 creatingHashtagIfNecessary:1 note:v7 parentAttachment:0];

  if (v19)
  {
    id v8 = objc_alloc(MEMORY[0x263F5B228]);
    id v9 = [(ICTableAttachmentViewController *)self note];
    id v10 = (void *)[v8 initWithNote:v9];

    id v11 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
    uint64_t v12 = [v11 selectedRange];
    uint64_t v14 = v13;
    double v15 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
    id v16 = (id)objc_msgSend(v10, "addInlineAttachment:atTextRange:textView:", v19, v12, v14, v15);

    [v19 updateChangeCountWithReason:@"Converted text to tag"];
    double v17 = [(ICTableAttachmentViewController *)self note];
    [v17 updateChangeCountWithReason:@"Converted text to tag"];

    char v18 = [(ICTableAttachmentViewController *)self note];
    [v18 save];
  }
  [(ICiOSTableAttachmentViewController *)self setEditing:1 animated:1];
}

- (BOOL)canConvertToText
{
  id v3 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  uint64_t v4 = [v3 textController];
  BOOL v5 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
  uint64_t v6 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
  uint64_t v7 = [v6 selectedRange];
  char v9 = objc_msgSend(v4, "canConvertInlineAttachmentToTextInTextView:forRange:", v5, v7, v8);

  return v9;
}

- (void)convertToText:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
    v19.NSUInteger location = [v5 selectedRange];
    uint64_t v6 = NSStringFromRange(v19);
    int v16 = 138412290;
    double v17 = v6;
    _os_log_impl(&dword_20BE60000, v4, OS_LOG_TYPE_INFO, "Converting inline attachment at %@ to text", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v7 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  uint64_t v8 = [v7 textController];
  char v9 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
  id v10 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
  uint64_t v11 = [v10 selectedRange];
  objc_msgSend(v8, "convertInlineAttachmentToTextInTextView:forRange:", v9, v11, v12);

  uint64_t v13 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
  [(ICiOSTableAttachmentViewController *)self textViewDidChange:v13];

  uint64_t v14 = [(ICTableAttachmentViewController *)self note];
  [v14 updateChangeCountWithReason:@"Converted tag to text"];

  double v15 = [(ICTableAttachmentViewController *)self note];
  [v15 save];
}

- (void)menuWillHide:(id)a3
{
  [(ICiOSTableAttachmentViewController *)self setMenuHiding:1];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F83840] object:0];
}

- (void)menuDidHide:(id)a3
{
  [(ICiOSTableAttachmentViewController *)self setMenuHiding:0];
  [(ICiOSTableAttachmentViewController *)self setShowingTextStyleOptions:0];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F83838] object:0];

  BOOL v5 = [(ICiOSTableAttachmentViewController *)self biuTextView];
  [v5 removeFromSuperview];

  [(ICiOSTableAttachmentViewController *)self setBiuTextView:0];

  [(ICiOSTableAttachmentViewController *)self moveAccessibilityFocusToSelectedColumnOrRowButton];
}

- (void)paste:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__ICiOSTableAttachmentViewController_paste___block_invoke;
  v6[3] = &unk_2640B82D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __44__ICiOSTableAttachmentViewController_paste___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pasteIntoSelection:*(void *)(a1 + 40)];
}

- (void)strikethrough:(id)a3
{
  id v7 = a3;
  id v4 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v5 = [v4 type];

  if (v5 == 1)
  {
    uint64_t v6 = [(ICTableAttachmentViewController *)self currentlyEditingTextView];
    [v6 toggleStrikethrough];
  }
  else
  {
    [(ICTableAttachmentViewController *)self toggleStrikethrough:v7];
  }
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
}

- (void)setTextViewWritingDirection:(int64_t)a3 sender:(id)a4
{
  id v10 = a4;
  uint64_t v6 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v7 = [v6 type];

  if (v7 == 2)
  {
    [(ICTableAttachmentViewController *)self reverseTableColumnDirection:v10];
  }
  else
  {
    uint64_t v8 = [(ICTableAttachmentViewController *)self tableSelection];
    uint64_t v9 = [v8 type];

    if (v9 == 4)
    {
      [(ICTableAttachmentViewController *)self setSelectionDirection:a3];
    }
    else if ([(ICTableAttachmentViewController *)self containedInNoteSelection])
    {
      [(ICTableAttachmentViewController *)self updateTableColumnDirectionForWritingDirection:a3];
    }
  }
}

- (void)shareTable:(id)a3
{
  v27[3] = *MEMORY[0x263EF8340];
  id v4 = [(ICAttachmentViewController *)self attachment];
  id v5 = objc_alloc(MEMORY[0x263F6BC98]);
  uint64_t v6 = [v4 activityItems];
  uint64_t v7 = (void *)[v5 initWithActivityItems:v6 applicationActivities:0];

  uint64_t v8 = [(ICAttachmentViewController *)self attachment];
  uint64_t v9 = [v8 note];
  id v10 = [v9 account];
  objc_msgSend(v7, "setIsContentManaged:", objc_msgSend(v10, "isManaged"));

  uint64_t v11 = *MEMORY[0x263F5AE08];
  v27[0] = *MEMORY[0x263F6BD08];
  v27[1] = v11;
  v27[2] = *MEMORY[0x263F6BD58];
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
  [v7 setExcludedActivityTypes:v12];

  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
    uint64_t v13 = -2;
  }
  else {
    uint64_t v13 = 7;
  }
  [v7 setModalPresentationStyle:v13];
  [(ICiOSTableAttachmentViewController *)self presentViewController:v7 animated:1 completion:0];
  uint64_t v14 = [(ICiOSTableAttachmentViewController *)self view];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  BOOL v23 = [v7 popoverPresentationController];
  objc_msgSend(v23, "setSourceRect:", v16, v18, v20, v22);

  uint64_t v24 = [(ICiOSTableAttachmentViewController *)self view];
  uint64_t v25 = [v24 superview];
  uint64_t v26 = [v7 popoverPresentationController];
  [v26 setSourceView:v25];
}

- (id)icTableDataFromPasteboard
{
  id v2 = [MEMORY[0x263F82A18] generalPasteboard];
  id v3 = [v2 dataForPasteboardType:@"com.apple.notes.table"];

  return v3;
}

- (id)soloPlainTextStringFromPasteboard
{
  id v2 = [MEMORY[0x263F82A18] generalPasteboard];
  id v3 = [v2 items];
  uint64_t v4 = [v3 count];

  if (v4 == 1
    && ([v2 dataForPasteboardType:*MEMORY[0x263F5AA90]],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    uint64_t v6 = [v2 string];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)notesDataFromPasteboard
{
  id v2 = [MEMORY[0x263F82A18] generalPasteboard];
  id v3 = [v2 dataForPasteboardType:*MEMORY[0x263F5AA90]];

  return v3;
}

- (void)copySelection:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(MEMORY[0x263F82A18], "generalPasteboard", a3);
  id v5 = [(ICTableAttachmentViewController *)self pasteboardItemsForSelection];
  v7[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v4 setItems:v6];

  [(ICiOSTableAttachmentViewController *)self _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21B78]];
}

- (void)selectionDidResignFirstResponder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v12 selectionDidResignFirstResponder:a3];
  if (![(ICTableAttachmentViewController *)self lockSelection])
  {
    [(ICiOSTableAttachmentViewController *)self sendAnalyticsForEndEditIfNeeded];
    uint64_t v4 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
    [v4 updateTextInputAccessoryViewForDidEndEditing:0];

    id v5 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
    uint64_t v6 = [v5 auxiliaryResponder];
    if (v6)
    {
    }
    else
    {
      uint64_t v7 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
      uint64_t v8 = [v7 textView];
      char v9 = [v8 isBecomingFirstResponder];

      if (v9) {
        return;
      }
      id v10 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
      uint64_t v11 = [v10 textView];
      [v11 setEditable:0];

      id v5 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
      [v5 setEditing:0];
    }
  }
}

- (void)tableAttachmentDidChange
{
  v2.receiver = self;
  v2.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v2 tableAttachmentDidChange];
}

- (void)performInitialLayoutIfNeeded
{
  v2.receiver = self;
  v2.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v2 performInitialLayoutIfNeeded];
}

- (void)tableAttachmentSelectionDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  [v5 postNotificationName:@"ICNoteEditorViewControllerSelectionDidChangeNotification" object:v4];
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  int v6 = [v5 textViewShouldBeginEditing:v4];

  if (v6)
  {
    uint64_t v7 = [(ICiOSTableAttachmentViewController *)self auxiliaryTextViewHost];
    [v7 setAuxiliaryResponder:v4];

    uint64_t v8 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
    char v9 = [v8 textViewInputAccessoryView];
    [v4 setInputAccessoryView:v9];
  }
  return v6;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  if ([v5 isStyleSelectorInputViewPresenting])
  {
  }
  else
  {
    char v6 = [v4 isFirstResponder];

    if (v6)
    {
      [(ICiOSTableAttachmentViewController *)self sendAnalyticsForStartEditIfNeeded];
      uint64_t v7 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
      [v7 setEditing:1];

      uint64_t v8 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
      char v9 = [v8 textView];
      id v10 = [v9 ink];
      char v11 = [v10 _isHandwritingInk];

      if ((v11 & 1) == 0)
      {
        objc_super v12 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
        [v12 showInkPicker:0 animated:1];
      }
      uint64_t v13 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
      [v13 updateTextInputAccessoryViewForDidBeginEditing:v4];

      if (![(ICTableAttachmentViewController *)self preventScrolling]
        && ![(ICTableAttachmentViewController *)self makingCellFirstResponder])
      {
        objc_initWeak(&location, self);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __62__ICiOSTableAttachmentViewController_textViewDidBeginEditing___block_invoke;
        block[3] = &unk_2640B8B30;
        objc_copyWeak(&v16, &location);
        id v15 = v4;
        dispatch_async(MEMORY[0x263EF83A0], block);

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __62__ICiOSTableAttachmentViewController_textViewDidBeginEditing___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  id v3 = [*(id *)(a1 + 32) textStorage];
  id v4 = ICDynamicCast();

  uint64_t v5 = [*(id *)(a1 + 32) selectedRange];
  char v6 = [v4 columnID];
  uint64_t v7 = [v4 rowAtIndex:v5 rowRange:0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__ICiOSTableAttachmentViewController_textViewDidBeginEditing___block_invoke_2;
  v8[3] = &unk_2640B8BF8;
  id v9 = *(id *)(a1 + 32);
  [WeakRetained beginEditingCellWithColumnID:v6 andRowID:v7 textRange:v8];
}

uint64_t __62__ICiOSTableAttachmentViewController_textViewDidBeginEditing___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) selectedRange];
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  char v6 = [v5 isStyleSelectorInputViewPresenting];

  if (v6) {
    goto LABEL_12;
  }
  objc_opt_class();
  uint64_t v7 = ICDynamicCast();
  if (v7)
  {
    uint64_t v8 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
    id v9 = [v8 auxiliaryResponder];
    if (v7 == v9)
    {
      id v10 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
      char v11 = [v10 textView];
      char v12 = [v11 isBecomingFirstResponder];

      if (v12)
      {
LABEL_8:
        [(ICTableAttachmentViewController *)self endCellEditingSessionWithTextView:v7];
        id v15 = [(ICAttachmentViewController *)self attachment];
        [v15 setIsBeingEditedLocallyOnDevice:0];

        goto LABEL_9;
      }
      uint64_t v13 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
      uint64_t v14 = [v13 textView];
      [v14 setEditable:0];

      uint64_t v8 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
      [v8 setEditing:0];
    }
    else
    {
    }
    goto LABEL_8;
  }
LABEL_9:
  [(ICiOSTableAttachmentViewController *)self sendAnalyticsForEndEditIfNeeded];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  double v22 = __60__ICiOSTableAttachmentViewController_textViewDidEndEditing___block_invoke;
  BOOL v23 = &unk_2640B82D8;
  uint64_t v24 = self;
  id v16 = v4;
  id v25 = v16;
  dispatch_async(MEMORY[0x263EF83A0], &v20);
  objc_msgSend(v16, "setInputAccessoryView:", 0, v20, v21, v22, v23, v24);
  double v17 = [(ICiOSTableAttachmentViewController *)self keyboardWillShowScrollObservation];

  if (v17)
  {
    double v18 = [MEMORY[0x263F08A00] defaultCenter];
    double v19 = [(ICiOSTableAttachmentViewController *)self keyboardWillShowScrollObservation];
    [v18 removeObserver:v19];

    [(ICiOSTableAttachmentViewController *)self setKeyboardWillShowScrollObservation:0];
  }

LABEL_12:
}

void __60__ICiOSTableAttachmentViewController_textViewDidEndEditing___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) noteEditorViewController];
  [v2 updateTextInputAccessoryViewForDidEndEditing:*(void *)(a1 + 40)];
}

- (void)beginEditingCellWithColumnID:(id)a3 andRowID:(id)a4 textRange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(ICiOSTableAttachmentViewController *)self keyboardWillShowScrollObservation];

  if (v11)
  {
    char v12 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v13 = [(ICiOSTableAttachmentViewController *)self keyboardWillShowScrollObservation];
    [v12 removeObserver:v13];

    [(ICiOSTableAttachmentViewController *)self setKeyboardWillShowScrollObservation:0];
  }
  objc_initWeak(&location, self);
  uint64_t v14 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v15 = *MEMORY[0x263F83808];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __86__ICiOSTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke;
  v20[3] = &unk_2640B8C48;
  objc_copyWeak(&v23, &location);
  id v16 = v8;
  id v21 = v16;
  id v17 = v9;
  id v22 = v17;
  double v18 = [v14 addObserverForName:v15 object:0 queue:0 usingBlock:v20];
  [(ICiOSTableAttachmentViewController *)self setKeyboardWillShowScrollObservation:v18];

  v19.receiver = self;
  v19.super_class = (Class)ICiOSTableAttachmentViewController;
  [(ICTableAttachmentViewController *)&v19 beginEditingCellWithColumnID:v16 andRowID:v17 textRange:v10];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __86__ICiOSTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [WeakRetained textViewManager];
  id v4 = [v3 textViewForColumn:a1[4] createIfNeeded:1];

  if (v4)
  {
    uint64_t v5 = [WeakRetained keyboardWillShowScrollObservation];

    if (v5)
    {
      char v6 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v7 = [WeakRetained keyboardWillShowScrollObservation];
      [v6 removeObserver:v7];

      [WeakRetained setKeyboardWillShowScrollObservation:0];
      if (([MEMORY[0x263F828A0] isInHardwareKeyboardMode] & 1) == 0)
      {
        [WeakRetained setPreventScrolling:0];
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __86__ICiOSTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke_2;
        v8[3] = &unk_2640B8C20;
        void v8[4] = WeakRetained;
        id v9 = v4;
        id v10 = a1[4];
        id v11 = a1[5];
        dispatch_async(MEMORY[0x263EF83A0], v8);
      }
    }
  }
}

void __86__ICiOSTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __86__ICiOSTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke_3;
  v4[3] = &unk_2640B89A8;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 scrollToSelectionInTextView:v3 animated:1 completion:v4];
}

void __86__ICiOSTableAttachmentViewController_beginEditingCellWithColumnID_andRowID_textRange___block_invoke_3(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) updateTiles];
  id v2 = *(void **)(a1 + 32);
  v6[0] = *(void *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  uint64_t v5 = *(void *)(a1 + 48);
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v5 count:1];
  [v2 showButtonsAtColumns:v3 rows:v4];
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  id v6 = [v5 viewControllerManager];
  [v6 dismissOverlayContent];

  uint64_t v7 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  [v7 setHasMadeEdits];

  [v4 updateTextViewForDidChange];
  [(ICTableAttachmentViewController *)self setNeedsSave];
  uint64_t v15 = v4;
  id v8 = v4;
  dispatchMainAfterDelay();
  id v9 = [(ICTableAttachmentViewController *)self tableSelection];
  id v10 = [v9 columns];
  id v11 = [v10 firstObject];

  char v12 = [(ICTableAttachmentViewController *)self tableSelection];
  uint64_t v13 = [v12 rows];
  uint64_t v14 = [v13 firstObject];

  if (v11 && v14) {
    [(ICTableAttachmentViewController *)self updateCellSizeAtColumn:v11 row:v14 immediateWidthUpdate:0];
  }
}

void __56__ICiOSTableAttachmentViewController_textViewDidChange___block_invoke(uint64_t a1)
{
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = ICDynamicCast();
  objc_opt_class();
  id v6 = [v4 textStorage];
  uint64_t v7 = ICDynamicCast();

  NSUInteger v8 = [v4 selectedRange];
  NSUInteger v10 = v9;
  uint64_t v11 = v8;
  v63 = v4;
  CGFloat v64 = v7;
  if (([v7 isApplyingUndoCommand] & 1) == 0)
  {
    uint64_t v12 = [v4 selectedRange];
    uint64_t v14 = v13;
    NSUInteger v15 = [v4 selectedRange];
    NSUInteger v17 = v16;
    v69.id location = [v5 previousSelectedRange];
    v69.NSUInteger length = v18;
    v67.id location = v15;
    id v4 = v63;
    v67.NSUInteger length = v17;
    NSRange v19 = NSUnionRange(v67, v69);
    uint64_t v7 = v64;
    if (v12 == v19.location && v14 == v19.length) {
      uint64_t v11 = [v5 previousSelectedRange];
    }
  }
  NSUInteger v65 = 0;
  NSUInteger v66 = 0;
  id v21 = (id)[v7 rowAtIndex:v11 rowRange:&v65];
  v22.NSUInteger length = v66;
  v22.id location = v66 + v65;
  if (v8 >= v66 + v65)
  {
    v22.NSUInteger length = 0;
  }
  else if (v66)
  {
    v68.id location = v8;
    v68.NSUInteger length = v10;
    v22.id location = v65;
    NSRange v22 = NSIntersectionRange(v68, v22);
  }
  else
  {
    v22.id location = v65;
  }
  if (v22.location == v8 && v22.length == v10)
  {
    id v23 = [(ICTableAttachmentViewController *)self tableSelection];
    if (![v23 draggingText])
    {
      uint64_t v24 = [(ICTableAttachmentViewController *)self tableSelection];
      if (([v24 moving] & 1) != 0 || (objc_msgSend(v4, "isFirstResponder") & 1) == 0)
      {
      }
      else
      {
        char v25 = [v5 isResigningFirstResponder];

        if (v25) {
          goto LABEL_24;
        }
        objc_opt_class();
        id v23 = ICDynamicCast();
        uint64_t v26 = [v4 selectedTextRange];
        char v27 = [v26 isEmpty];

        if (v27)
        {
          [(ICTableAttachmentViewController *)self showColumnRowButtons];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            v58 = ICDynamicCast();
            [(ICiOSTableAttachmentViewController *)self ensureGesturesOnSelectionGrabbers:v58];
          }
          uint64_t v59 = [(ICTableAttachmentViewController *)self columnButton];
          [v59 setHidden:1];

          double v60 = [(ICTableAttachmentViewController *)self rowButton];
          [v60 setHidden:1];
        }
        if (v23)
        {
          [(ICiOSTableAttachmentViewController *)self didBeginEditingWithTextView:v23];
          [(ICiOSTableAttachmentViewController *)self scrollToCaretIfNeededForTextView:v23];
        }
      }
    }
  }
  else
  {
    objc_msgSend(v4, "setSelectedRange:");
  }
LABEL_24:
  uint64_t v28 = [v5 selectedRange];
  objc_msgSend(v5, "setPreviousSelectedRange:", v28, v29);
  long long v30 = [(ICTableAttachmentViewController *)self noteTextView];
  char v31 = [v30 editorController];
  uint64_t v32 = [v31 hashtagController];
  [v32 setHashtagTableKeyboardDelegate:v5];

  uint64_t v33 = [(ICTableAttachmentViewController *)self noteTextView];
  id v34 = [v33 editorController];
  objc_super v35 = [v34 mentionsController];
  [v35 setMentionsTableKeyboardDelegate:v5];

  CGFloat v36 = [(ICTableAttachmentViewController *)self noteTextView];
  v37 = [v36 editorController];
  v38 = [v37 mentionsController];
  uint64_t v39 = [v5 selectedRange];
  uint64_t v41 = v40;
  double v42 = [(ICTableAttachmentViewController *)self note];
  char v43 = [v5 languageHasSpaces];
  double v44 = [(ICAttachmentViewController *)self attachment];
  BYTE1(v61) = v43;
  LOBYTE(v61) = 0;
  uint64_t v45 = v41;
  double v46 = v64;
  LOBYTE(v39) = [v38 checkForMentionInEditedRange:v39 ofTextStorage:v45 note:v64 textView:v42 allowAutoExplicitMention:v5 isEndingEditing:0 languageHasSpaces:v61 parentAttachment:v44];

  if ((v39 & 1) == 0)
  {
    v47 = [(ICTableAttachmentViewController *)self noteTextView];
    v48 = [v47 editorController];
    double v49 = [v48 hashtagController];
    uint64_t v50 = [v5 selectedRange];
    uint64_t v52 = v51;
    double v53 = [(ICTableAttachmentViewController *)self note];
    char v54 = [v5 languageHasSpaces];
    double v55 = [(ICAttachmentViewController *)self attachment];
    BYTE1(v62) = v54;
    LOBYTE(v62) = 0;
    [v49 checkForHashtagInEditedRange:v50 ofTextStorage:v52 note:v64 textView:v53 allowAutoExplicitHashtag:v5 isEndingEditing:0 languageHasSpaces:v62 parentAttachment:v55];

    double v46 = v64;
  }
  double v56 = [MEMORY[0x263F08A00] defaultCenter];
  v57 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  [v56 postNotificationName:@"ICNoteEditorViewControllerSelectionDidChangeNotification" object:v57];
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (![(ICTableAttachmentViewController *)self acceptsKeystrokes]) {
    goto LABEL_10;
  }
  if ([v8 hasSuffix:@"\n"]
    && (objc_msgSend(MEMORY[0x263F828A0], "ic_isShiftKeyPressed") & 1) == 0)
  {
    if ([v7 returnKeyType] == 4) {
      [(ICTableAttachmentViewController *)self moveNextCell];
    }
    else {
      [(ICTableAttachmentViewController *)self moveReturnCell];
    }
    goto LABEL_10;
  }
  if ([v8 hasSuffix:@"\t"])
  {
    [(ICTableAttachmentViewController *)self moveTabCell];
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)scrollToCaretIfNeededForTextView:(id)a3
{
  id v6 = a3;
  id v4 = [v6 selectedTextRange];
  int v5 = [v4 isEmpty];

  if (v5) {
    [(ICTableAttachmentViewController *)self scrollToSelectionInTextView:v6 animated:1 completion:0];
  }
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(ICTableAttachmentViewController *)self noteTextView];
  [v7 postNotificationName:@"ICTextViewLayoutDidChangeNotification" object:v6];
}

- (void)selectCurrentColumnForAccessibility
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self columnButton];
  [(ICiOSTableAttachmentViewController *)self columnButtonPressed:v3];

  LODWORD(v3) = *MEMORY[0x263F831C0];
  id v4 = [(ICTableAttachmentViewController *)self columnButton];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v4);
}

- (void)selectCurrentRowForAccessibility
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self rowButton];
  [(ICiOSTableAttachmentViewController *)self rowButtonPressed:v3];

  LODWORD(v3) = *MEMORY[0x263F831C0];
  id v4 = [(ICTableAttachmentViewController *)self rowButton];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v4);
}

- (void)invalidateCachedChildrenForAccessibilityReparenting
{
  objc_opt_class();
  uint64_t v3 = [(ICTableAttachmentViewController *)self noteTextView];
  ICDynamicCast();
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [v4 icaxClearCachedChildrenForReparenting];
}

- (void)updateAccessibilityValueForColumnAndRowButtons
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self table];
  id v4 = [(ICTableAttachmentViewController *)self columnButton];
  int v5 = [v4 columnOrRowIdentifiers];
  id v6 = [v5 firstObject];
  uint64_t v7 = [v3 columnIndexForIdentifier:v6];

  id v8 = [(ICTableAttachmentViewController *)self table];
  BOOL v9 = [(ICTableAttachmentViewController *)self columnButton];
  NSUInteger v10 = [v9 columnOrRowIdentifiers];
  uint64_t v11 = [v10 lastObject];
  uint64_t v12 = [v8 columnIndexForIdentifier:v11];

  uint64_t v13 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v14 = v13;
  uint64_t v15 = v7 + 1;
  if (v7 == v12)
  {
    NSUInteger v16 = [v13 localizedStringForKey:@"column %lu" value:&stru_26C10E100 table:0];

    NSUInteger v17 = NSString;
  }
  else
  {
    NSUInteger v16 = [v13 localizedStringForKey:@"columns %lu to %lu" value:&stru_26C10E100 table:0];

    NSUInteger v17 = NSString;
    uint64_t v35 = v12 + 1;
  }
  NSUInteger v18 = objc_msgSend(v17, "localizedStringWithFormat:", v16, v15, v35);
  NSRange v19 = [(ICTableAttachmentViewController *)self columnButton];
  [v19 setAccessibilityValue:v18];

  uint64_t v20 = [(ICTableAttachmentViewController *)self table];
  id v21 = [(ICTableAttachmentViewController *)self rowButton];
  NSRange v22 = [v21 columnOrRowIdentifiers];
  id v23 = [v22 firstObject];
  uint64_t v24 = [v20 rowIndexForIdentifier:v23];

  char v25 = [(ICTableAttachmentViewController *)self table];
  uint64_t v26 = [(ICTableAttachmentViewController *)self rowButton];
  char v27 = [v26 columnOrRowIdentifiers];
  uint64_t v28 = [v27 lastObject];
  uint64_t v29 = [v25 rowIndexForIdentifier:v28];

  long long v30 = [MEMORY[0x263F086E0] mainBundle];
  char v31 = v30;
  if (v24 == v29)
  {
    id v37 = [v30 localizedStringForKey:@"row %lu" value:&stru_26C10E100 table:0];

    uint64_t v32 = NSString;
  }
  else
  {
    id v37 = [v30 localizedStringForKey:@"rows %lu to %lu" value:&stru_26C10E100 table:0];

    uint64_t v32 = NSString;
    uint64_t v36 = v29 + 1;
  }
  uint64_t v33 = objc_msgSend(v32, "localizedStringWithFormat:", v37, v24 + 1, v36);
  id v34 = [(ICTableAttachmentViewController *)self rowButton];
  [v34 setAccessibilityValue:v33];
}

- (void)moveAccessibilityFocusToSelectedColumnOrRowButton
{
  uint64_t v3 = [(ICTableAttachmentViewController *)self columnButton];
  int v4 = [v3 isSelected];

  if (v4)
  {
    uint64_t v5 = [(ICTableAttachmentViewController *)self columnButton];
LABEL_5:
    id v8 = (void *)v5;
    goto LABEL_7;
  }
  id v6 = [(ICTableAttachmentViewController *)self rowButton];
  int v7 = [v6 isSelected];

  if (v7)
  {
    uint64_t v5 = [(ICTableAttachmentViewController *)self rowButton];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:
  id v9 = v8;
  UIAccessibilityPostNotification(*MEMORY[0x263F831C0], v8);
}

- (void)speakAccessibilityAnnouncementForMoveToCellWithColumnID:(id)a3 rowID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICTableAttachmentViewController *)self table];
  uint64_t v9 = [v8 columnIndexForIdentifier:v7];

  NSUInteger v10 = [(ICTableAttachmentViewController *)self table];
  uint64_t v11 = [v10 rowIndexForIdentifier:v6];

  uint64_t v12 = [(ICTableAttachmentViewController *)self tableAXController];
  id v16 = [v12 cellElementForColumnIndex:v9 rowIndex:v11];

  uint64_t v13 = [v16 accessibilityLabel];
  uint64_t v15 = [v16 accessibilityValue];
  uint64_t v14 = __ICAccessibilityStringForVariables();

  UIAccessibilityPostNotification(*MEMORY[0x263F83188], v14);
}

- (void)speakAccessibilityExitedTableAnnouncementAndDidRemoveRow:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v5 = v4;
  if (v3) {
    id v6 = @"Removed empty row and exited table";
  }
  else {
    id v6 = @"Exited table";
  }
  id argument = [v4 localizedStringForKey:v6 value:&stru_26C10E100 table:0];

  UIAccessibilityPostNotification(*MEMORY[0x263F83188], argument);
}

- (void)sendAnalyticsForStartEditIfNeeded
{
  if (![(ICiOSTableAttachmentViewController *)self isTrackingAnalyticsEdit])
  {
    [(ICiOSTableAttachmentViewController *)self setIsTrackingAnalyticsEdit:1];
    BOOL v3 = [(ICTableAttachmentViewController *)self table];
    uint64_t v4 = [v3 columnCount];

    uint64_t v5 = [(ICTableAttachmentViewController *)self table];
    uint64_t v6 = [v5 rowCount];

    id v7 = [(ICiOSTableAttachmentViewController *)self eventReporter];
    [v7 pushStartTableDataWithStartColumns:v4 startRows:v6];
  }
}

- (void)sendAnalyticsForEndEditIfNeeded
{
  objc_opt_class();
  BOOL v3 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
  uint64_t v4 = [v3 auxiliaryResponder];
  ICDynamicCast();
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if ([(ICiOSTableAttachmentViewController *)self isTrackingAnalyticsEdit])
  {
    if (v16)
    {
      uint64_t v5 = [(ICiOSTableAttachmentViewController *)self view];
      if ([v16 isDescendantOfView:v5])
      {
        uint64_t v6 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
        id v7 = [v6 textView];
        int v8 = [v7 isBecomingFirstResponder];

        if (!v8) {
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    uint64_t v9 = [(ICTableAttachmentViewController *)self table];
    uint64_t v10 = [v9 columnCount];

    uint64_t v11 = [(ICTableAttachmentViewController *)self table];
    uint64_t v12 = [v11 rowCount];

    uint64_t v13 = [(ICiOSTableAttachmentViewController *)self eventReporter];
    uint64_t v14 = [(ICiOSTableAttachmentViewController *)self noteEditorViewController];
    uint64_t v15 = [v14 note];
    [v13 submitTableEditEventForNote:v15 endColumns:v10 endRows:v12];

    [(ICiOSTableAttachmentViewController *)self setIsTrackingAnalyticsEdit:0];
  }
LABEL_8:
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter)
  {
    if ([MEMORY[0x263F5A768] isOptedInForAnalytics])
    {
      BOOL v3 = [(ICiOSTableAttachmentViewController *)self viewIfLoaded];

      if (v3)
      {
        id v4 = objc_alloc(MEMORY[0x263F5A768]);
        uint64_t v5 = (objc_class *)objc_opt_class();
        uint64_t v6 = NSStringFromClass(v5);
        id v7 = [(ICiOSTableAttachmentViewController *)self view];
        int v8 = (ICNAEventReporter *)[v4 initWithSubTrackerName:v6 view:v7];
        eventReporter = self->_eventReporter;
        self->_eventReporter = v8;

        uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
        [v10 addObserver:self selector:sel_eventReporterLostSession_ name:*MEMORY[0x263F5A750] object:self->_eventReporter];
      }
    }
  }
  uint64_t v11 = self->_eventReporter;

  return v11;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = *MEMORY[0x263F5A750];
  id v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (BOOL)isShowingTextStyleOptions
{
  return self->_showingTextStyleOptions;
}

- (void)setShowingTextStyleOptions:(BOOL)a3
{
  self->_showingTextStyleOptions = a3;
}

- (CGPoint)initialDragOffset
{
  double x = self->_initialDragOffset.x;
  double y = self->_initialDragOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialDragOffset:(CGPoint)a3
{
  self->_initialDragOffset = a3;
}

- (BOOL)isObservingContentOffset
{
  return self->_isObservingContentOffset;
}

- (void)setIsObservingContentOffset:(BOOL)a3
{
  self->_isObservingContentOffset = a3;
}

- (BOOL)isMenuHiding
{
  return self->_menuHiding;
}

- (void)setMenuHiding:(BOOL)a3
{
  self->_menuHiding = a3;
}

- (CGPoint)previousNoteContentOffset
{
  double x = self->_previousNoteContentOffset.x;
  double y = self->_previousNoteContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousNoteContentOffset:(CGPoint)a3
{
  self->_previousNoteContentOffset = a3;
}

- (CGPoint)previousViewOrigin
{
  double x = self->_previousViewOrigin.x;
  double y = self->_previousViewOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousViewOrigin:(CGPoint)a3
{
  self->_previousViewOrigin = a3;
}

- (_NSRange)previousSelectedRange
{
  p_previousSelectedRange = &self->_previousSelectedRange;
  NSUInteger location = self->_previousSelectedRange.location;
  NSUInteger length = p_previousSelectedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setPreviousSelectedRange:(_NSRange)a3
{
  self->_previousSelectedRange = a3;
}

- (UITextView)biuTextView
{
  return self->_biuTextView;
}

- (void)setBiuTextView:(id)a3
{
}

- (UILongPressGestureRecognizer)rowLongPress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rowLongPress);

  return (UILongPressGestureRecognizer *)WeakRetained;
}

- (void)setRowLongPress:(id)a3
{
}

- (void)setEventReporter:(id)a3
{
}

- (BOOL)isTrackingAnalyticsEdit
{
  return self->_isTrackingAnalyticsEdit;
}

- (void)setIsTrackingAnalyticsEdit:(BOOL)a3
{
  self->_isTrackingAnalyticsEdit = a3;
}

- (BOOL)isTouchingColumnButton
{
  return self->_touchingColumnButton;
}

- (void)setTouchingColumnButton:(BOOL)a3
{
  self->_touchingColumnButton = a3;
}

- (BOOL)isTouchingRowButton
{
  return self->_touchingRowButton;
}

- (void)setTouchingRowButton:(BOOL)a3
{
  self->_touchingRowButton = a3;
}

- (NSObject)keyboardWillShowScrollObservation
{
  return self->_keyboardWillShowScrollObservation;
}

- (void)setKeyboardWillShowScrollObservation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardWillShowScrollObservation, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_rowLongPress);

  objc_storeStrong((id *)&self->_biuTextView, 0);
}

@end