@interface ICTextView
+ (double)overrideEdgeInset;
+ (void)initialize;
- (BOOL)_accessibilityBeginUndoableTextInsertion;
- (BOOL)_accessibilityEndUndoableTextInsertion;
- (BOOL)_shouldBecomeEditableUponBecomingTargetOfKeyboardEventDeferringEnvironment;
- (BOOL)_shouldBecomeEditableUponFocus;
- (BOOL)attachmentViewUnderTouches:(id)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)becomesEditableWithGestures;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)disableContentOffsetChanges;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hideCompatibilityBanner;
- (BOOL)isBecomingFirstResponder;
- (BOOL)isDisplayingEditableContent;
- (BOOL)isEditingOnSystemPaper;
- (BOOL)isInSetBounds;
- (BOOL)isInsertingTextFromKeyboardInput;
- (BOOL)isPaperLinkBarShowingOrWillShow;
- (BOOL)isPerformingHighlightUpdates;
- (BOOL)isPreviewing;
- (BOOL)isScrolling;
- (BOOL)isSearchResultView:(id)a3;
- (BOOL)isSettingContentOffset;
- (BOOL)isSettingEditable;
- (BOOL)isSettingStyleWithStyleUI;
- (BOOL)isTransitioningToNewSize;
- (BOOL)isUpdatingPanGesture;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)needsHideOverlappingAttachmentViews;
- (BOOL)resignFirstResponder;
- (BOOL)selectionSupportsFindInNote;
- (BOOL)shouldAutoScroll;
- (BOOL)shouldAvoidBecomingFirstResponder;
- (BOOL)shouldReplaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5;
- (BOOL)shouldRubberBand;
- (BOOL)shouldUpdateVisibleSupplementalViewsInLayoutSubviews;
- (BOOL)showCompatibilityBannerWithParentViewController:(id)a3;
- (BOOL)supportsAttachments;
- (BOOL)touchesCurrentlyOnAttachmentView;
- (BOOL)touchesShouldCancelInContentView:(id)a3;
- (CALayer)bottomSplitLayer;
- (CALayer)topSplitLayer;
- (CATransformLayer)splitLayerContainer;
- (CGPoint)clippedContentOffset:(CGPoint)a3;
- (CGPoint)distanceConsumedByEmbeddedScrollViews;
- (CGPoint)lastProposedContentOffset;
- (CGPoint)rubberBandContentOffset;
- (CGPoint)scrollEmbeddedScrollViewsWithProposedContentOffset:(CGPoint)a3;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)currentSetBoundsRect;
- (CGRect)lastDragInsertionRect;
- (CGSize)previousContentSize;
- (ICAttachmentViewDelegate)attachmentViewDelegate;
- (ICNoteEditorCompatibilityBannerView)compatibilityBannerView;
- (ICNoteEditorDateView)dateView;
- (ICNoteEditorUserTitleView)userTitleView;
- (ICSharedScrollClampingController)scrollClampingControllerDelayedRelease;
- (ICTextFindingCoordinator)textFindingCoordinator;
- (ICTextView)init;
- (ICTextView)initWithCoder:(id)a3;
- (ICTextView)initWithFrame:(CGRect)a3;
- (ICTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (NSArray)draggingSnapPoints;
- (NSMutableArray)highlightLayers;
- (NSSet)embeddedScrollViews;
- (UIEdgeInsets)minimumMargins;
- (UIResponder)nextResponderOverride;
- (_NSRange)characterRangeFromTextKitRange:(id)a3;
- (_NSRange)selectedRange;
- (double)leadingMargin;
- (double)maxYContentOffset;
- (id)TTTextStorageOptional;
- (id)_icaxUnfilteredAttributedString;
- (id)_nextKeyResponder;
- (id)_targetedPreviewForTextInteractableItem:(id)a3 dismissing:(BOOL)a4;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)attachmentViewTappedByGesture:(id)a3;
- (id)collectScrollViews;
- (id)findInteraction:(id)a3 sessionForView:(id)a4;
- (id)findableForAttachment:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)note;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)selectedText;
- (id)selectionRectsForRange:(id)a3;
- (id)singleSelectedAttachment;
- (id)tableAttachmentViewControllerForRange:(_NSRange)a3;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)textAttachmentAtPoint:(CGPoint)a3;
- (id)undoManager;
- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5;
- (unint64_t)updatingContentSizeCount;
- (void)_adjustContentOffsetIfNecessary;
- (void)_scrollToCaretIfNeeded;
- (void)_scrollToSelectionIfNeeded;
- (void)_updateContentSize;
- (void)_updatePanGesture;
- (void)applyEdgeInsets:(UIEdgeInsets)a3;
- (void)authorHighlightsControllerDidPerformHighlightUpdates:(id)a3;
- (void)authorHighlightsControllerWillPerformHighlightUpdates:(id)a3;
- (void)clampTextView;
- (void)clearAllDecoratedFoundText;
- (void)createDateLabel;
- (void)createUserTitleViewIfNecessaryForNote:(id)a3;
- (void)dealloc;
- (void)dictationControllerDidFinish:(id)a3;
- (void)dictationControllerDidPause:(id)a3;
- (void)dictationControllerDidResume:(id)a3;
- (void)didDismissWritingTools;
- (void)didEndTextSearchOperation;
- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4;
- (void)findInteraction:(id)a3 didEndFindSession:(id)a4;
- (void)handleAccessibilityDarkerSystemColorsStatusDidChange:(id)a3;
- (void)hideOverlappingAttachmentViewsIfNecessary;
- (void)inProcessUndoPanGesture:(id)a3;
- (void)initializeScollClampingController;
- (void)keyboardDidBeginDictation:(id)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)registerForTraitChanges;
- (void)replaceAllOccurrencesOfQueryString:(id)a3 usingOptions:(id)a4 withText:(id)a5;
- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5;
- (void)resetContentOffset:(CGPoint)a3;
- (void)resetUndoManager;
- (void)sceneWillEnterForeground:(id)a3;
- (void)scrollRangeToVisible:(_NSRange)a3 consideringInsets:(BOOL)a4 animated:(BOOL)a5 inSearchableString:(id)a6;
- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4;
- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4;
- (void)select:(id)a3;
- (void)setAttachmentViewDelegate:(id)a3;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setBottomSplitLayer:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setClippedContentOffset:(CGPoint)a3;
- (void)setCompatibilityBannerView:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)setCurrentSetBoundsRect:(CGRect)a3;
- (void)setDateView:(id)a3;
- (void)setDisableContentOffsetChanges:(BOOL)a3;
- (void)setDisplayingEditableContent:(BOOL)a3;
- (void)setDistanceConsumedByEmbeddedScrollViews:(CGPoint)a3;
- (void)setDraggingSnapPoints:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEmbeddedScrollViews:(id)a3;
- (void)setHighlightLayers:(id)a3;
- (void)setInputAccessoryViewVisible:(BOOL)a3;
- (void)setIsInSetBounds:(BOOL)a3;
- (void)setIsInsertingTextFromKeyboardInput:(BOOL)a3;
- (void)setIsPerformingHighlightUpdates:(BOOL)a3;
- (void)setIsSettingContentOffset:(BOOL)a3;
- (void)setIsSettingEditable:(BOOL)a3;
- (void)setIsSettingStyleWithStyleUI:(BOOL)a3;
- (void)setIsTransitioningToNewSize:(BOOL)a3;
- (void)setIsUpdatingPanGesture:(BOOL)a3;
- (void)setLastDragInsertionRect:(CGRect)a3;
- (void)setLastProposedContentOffset:(CGPoint)a3;
- (void)setNeedsHideOverlappingAttachmentViews:(BOOL)a3;
- (void)setNextResponderOverride:(id)a3;
- (void)setPreviousContentSize:(CGSize)a3;
- (void)setRubberBandContentOffset:(CGPoint)a3;
- (void)setScrollClampingControllerDelayedRelease:(id)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)setShouldAvoidBecomingFirstResponder:(BOOL)a3;
- (void)setShouldRubberBand:(BOOL)a3;
- (void)setSplitLayerContainer:(id)a3;
- (void)setTextFindingCoordinator:(id)a3;
- (void)setTopSplitLayer:(id)a3;
- (void)setTouchesCurrentlyOnAttachmentView:(BOOL)a3;
- (void)setUpdatingContentSizeCount:(unint64_t)a3;
- (void)setUserTitleView:(id)a3;
- (void)splitViewAnimatedTransitionEnded:(id)a3;
- (void)splitViewAnimatedTransitionWillBegin:(id)a3;
- (void)startEditingForTapGesture:(id)a3;
- (void)textControllerDidHandleSpecialCaseEditing:(id)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleStrikethrough;
- (void)toggleUnderline:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)unclampTextView;
- (void)undoManagerDidOpenUndoGroup:(id)a3;
- (void)updateCompatibilityBannerForNote:(id)a3 parentViewController:(id)a4 updateTextViewContentInsets:(BOOL)a5;
- (void)updateLayoutMargins;
- (void)updateLayoutMarginsForMultipleTextViewsIfNecessary;
- (void)updateOverscrollItemFrames;
- (void)updateTextViewForDidChange;
- (void)userTitleHiddenStateDidChange:(id)a3;
- (void)willHighlightFoundTextRange:(id)a3 inDocument:(id)a4;
- (void)willPresentWritingTools;
- (void)writingToolsCoordinator:(id)a3 replaceRange:(_NSRange)a4 inContext:(id)a5 proposedText:(id)a6 reason:(int64_t)a7 animationParameters:(id)a8 completion:(id)a9;
- (void)writingToolsCoordinator:(id)a3 willChangeToState:(int64_t)a4 completion:(id)a5;
@end

@implementation ICTextView

void __96__ICTextView_updateCompatibilityBannerForNote_parentViewController_updateTextViewContentInsets___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  if (v2)
  {
    v3 = [WeakRetained editorController];
    v4 = [v3 note];
    v5 = [v4 identifier];
    int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

    if (v6)
    {
      if (*(unsigned char *)(a1 + 56))
      {
        if (([WeakRetained showCompatibilityBannerWithParentViewController:v2] & 1) == 0) {
          goto LABEL_9;
        }
      }
      else if (![WeakRetained hideCompatibilityBanner])
      {
        goto LABEL_9;
      }
      if (*(unsigned char *)(a1 + 57))
      {
        v7 = [WeakRetained editorController];
        [v7 updateTextViewContentInsetsAnimated:1];
      }
    }
  }
LABEL_9:
}

- (BOOL)hideCompatibilityBanner
{
  v3 = [(ICTextView *)self compatibilityBannerView];
  v4 = v3;
  if (v3)
  {
    [v3 removeFromSuperview];
    [(ICTextView *)self setCompatibilityBannerView:0];
  }

  return v4 != 0;
}

- (void)updateLayoutMarginsForMultipleTextViewsIfNecessary
{
  v3 = [(ICBaseTextView *)self TTTextStorage];
  v4 = [v3 textViews];
  unint64_t v5 = [v4 count];

  if (v5 >= 2)
  {
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      int v6 = [(ICBaseTextView *)self editorController];
      [v6 saveCurrentScrollState];
    }
    [(ICTextView *)self updateLayoutMargins];
    if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
    {
      id v7 = [(ICBaseTextView *)self editorController];
      [v7 applyScrollStateIfAvailable];
    }
  }
}

- (void)authorHighlightsControllerWillPerformHighlightUpdates:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  unint64_t v5 = [v4 userInfo];

  int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F5B060]];
  ICCheckedDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [v10 document];
  v8 = [(ICBaseTextView *)self TTTextStorage];
  v9 = [v8 document];

  if (v7 == v9) {
    [(ICTextView *)self setIsPerformingHighlightUpdates:1];
  }
}

- (void)setIsPerformingHighlightUpdates:(BOOL)a3
{
  self->_isPerformingHighlightUpdates = a3;
}

- (void)authorHighlightsControllerDidPerformHighlightUpdates:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  unint64_t v5 = [v4 userInfo];

  int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F5B060]];
  id v7 = ICCheckedDynamicCast();

  v8 = [v7 document];
  v9 = [(ICBaseTextView *)self TTTextStorage];
  id v10 = [v9 document];

  if (v8 == v10) {
    dispatchMainAfterDelay();
  }
}

- (void)updateOverscrollItemFrames
{
  [(ICTextView *)self bounds];
  double v4 = v3;
  [(ICTextView *)self textContainerInset];
  double v6 = v4 + v5 * -2.0;
  id v7 = [(ICTextView *)self compatibilityBannerView];
  [v7 preferredHeight];
  double v9 = v8;

  [(ICTextView *)self textContainerInset];
  double v11 = v10;
  double v12 = -v9;
  v13 = [(ICTextView *)self compatibilityBannerView];
  [v13 frame];
  char v14 = TSDNearlyEqualRects();

  if ((v14 & 1) == 0)
  {
    v15 = [(ICTextView *)self compatibilityBannerView];
    [v15 setAvailableWidth:v6];

    v16 = [(ICTextView *)self compatibilityBannerView];
    objc_msgSend(v16, "setFrame:", v11, -v9, v6, v9);
  }
  v17 = [(ICTextView *)self dateView];
  [v17 preferredHeight];
  double v19 = v18;

  [(ICTextView *)self textContainerInset];
  double v21 = v20;
  v22 = [(ICTextView *)self dateView];
  [v22 frame];
  char v23 = TSDNearlyEqualRects();

  if ((v23 & 1) == 0)
  {
    v24 = [(ICTextView *)self dateView];
    objc_msgSend(v24, "setFrame:", v21, v12 - v19, v6, v19);
  }
  v25 = [(ICTextView *)self userTitleView];
  [v25 preferredHeight];
  double v27 = v26;

  [(ICTextView *)self textContainerInset];
  double v29 = v28;
  double v30 = v12 - v27 - v19;
  v31 = [(ICTextView *)self userTitleView];
  [v31 frame];
  char v32 = TSDNearlyEqualRects();

  if ((v32 & 1) == 0)
  {
    id v33 = [(ICTextView *)self userTitleView];
    objc_msgSend(v33, "setFrame:", v29, v30, v6, v27);
  }
}

- (ICNoteEditorCompatibilityBannerView)compatibilityBannerView
{
  return self->_compatibilityBannerView;
}

- (ICNoteEditorUserTitleView)userTitleView
{
  return self->_userTitleView;
}

- (ICNoteEditorDateView)dateView
{
  return self->_dateView;
}

- (void)updateCompatibilityBannerForNote:(id)a3 parentViewController:(id)a4 updateTextViewContentInsets:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    double v10 = [v8 identifier];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v9);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __96__ICTextView_updateCompatibilityBannerForNote_parentViewController_updateTextViewContentInsets___block_invoke;
    v12[3] = &unk_2640B9AC0;
    objc_copyWeak(&v14, &location);
    objc_copyWeak(&v15, &from);
    id v11 = v10;
    id v13 = v11;
    BOOL v16 = a5;
    +[ICNoteEditorCompatibilityBannerView checkShouldShowCompatibilityBannerViewForNote:v8 parentViewController:v9 completion:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (void)setDisplayingEditableContent:(BOOL)a3
{
  self->_displayingEditableContent = a3;
}

- (void)createUserTitleViewIfNecessaryForNote:(id)a3
{
  id v13 = a3;
  double v4 = [(ICTextView *)self userTitleView];

  if (!v4
    && +[ICNoteEditorUserTitleView shouldShowUserTitleViewForNote:v13])
  {
    id v5 = +[ICNoteEditorUserTitleView newUserTitleView];
    [(ICTextView *)self setUserTitleView:v5];

    double v6 = [(ICTextView *)self userTitleView];
    [v6 setAutoresizingMask:5];

    id v7 = [(ICTextView *)self userTitleView];
    [v7 _accessibilitySetIsSpeakThisElement:0];

    id v8 = [(ICTextView *)self userTitleView];
    [v8 setDelegate:self];

    dateView = self->_dateView;
    double v10 = [(ICTextView *)self userTitleView];
    if (dateView) {
      [(ICTextView *)self insertSubview:v10 belowSubview:self->_dateView];
    }
    else {
      [(ICTextView *)self addSubview:v10];
    }
  }
  id v11 = [(ICTextView *)self userTitleView];

  if (v11)
  {
    double v12 = [(ICTextView *)self userTitleView];
    [v12 setNote:v13];
  }

  MEMORY[0x270F9A758]();
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ICTextView;
  [(ICTextView *)&v3 layoutMarginsDidChange];
  [(ICTextView *)self updateLayoutMargins];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ((TSDRectHasInfComponents() & 1) != 0 || TSDRectHasNaNComponents())
  {
    id v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v30.origin.double x = x;
      v30.origin.double y = y;
      v30.size.double width = width;
      v30.size.double height = height;
      id v9 = NSStringFromRect(v30);
      *(_DWORD *)buf = 136315394;
      double v26 = "-[ICTextView setBounds:]";
      __int16 v27 = 2112;
      double v28 = v9;
      _os_log_impl(&dword_20BE60000, v8, OS_LOG_TYPE_DEFAULT, "Calling %s with invalid value: %@", buf, 0x16u);
    }
LABEL_6:

    return;
  }
  if ([(ICTextView *)self isInSetBounds])
  {
    [(ICTextView *)self currentSetBoundsRect];
    v32.origin.double x = v10;
    v32.origin.double y = v11;
    v32.size.double width = v12;
    v32.size.double height = v13;
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.double width = width;
    v31.size.double height = height;
    if (CGRectEqualToRect(v31, v32))
    {
      id v8 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20BE60000, v8, OS_LOG_TYPE_DEFAULT, "We hit the setBounds guard", buf, 2u);
      }
      goto LABEL_6;
    }
  }
  BOOL v14 = [(ICTextView *)self disableContentOffsetChanges];
  if (![(ICTextView *)self isTransitioningToNewSize]) {
    [(ICTextView *)self setDisableContentOffsetChanges:1];
  }
  [(ICTextView *)self setIsTransitioningToNewSize:1];
  BOOL v15 = [(ICTextView *)self isInSetBounds];
  [(ICTextView *)self currentSetBoundsRect];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(ICTextView *)self setIsInSetBounds:1];
  -[ICTextView setCurrentSetBoundsRect:](self, "setCurrentSetBoundsRect:", x, y, width, height);
  v24.receiver = self;
  v24.super_class = (Class)ICTextView;
  -[ICTextView setBounds:](&v24, sel_setBounds_, x, y, width, height);
  [(ICTextView *)self setIsTransitioningToNewSize:0];
  [(ICTextView *)self setDisableContentOffsetChanges:v14];
  [(ICTextView *)self setIsInSetBounds:v15];
  -[ICTextView setCurrentSetBoundsRect:](self, "setCurrentSetBoundsRect:", v17, v19, v21, v23);
  [(ICTextView *)self updateLayoutMargins];
}

- (void)setIsTransitioningToNewSize:(BOOL)a3
{
  self->_isTransitioningToNewSize = a3;
}

- (void)setIsInSetBounds:(BOOL)a3
{
  self->_isInSetBounds = a3;
}

- (void)setDisableContentOffsetChanges:(BOOL)a3
{
  self->_disableContentOffsetChanges = a3;
}

- (void)setCurrentSetBoundsRect:(CGRect)a3
{
  self->_currentSetBoundsRect = a3;
}

- (BOOL)isInSetBounds
{
  return self->_isInSetBounds;
}

- (BOOL)disableContentOffsetChanges
{
  return self->_disableContentOffsetChanges;
}

- (CGRect)currentSetBoundsRect
{
  double x = self->_currentSetBoundsRect.origin.x;
  double y = self->_currentSetBoundsRect.origin.y;
  double width = self->_currentSetBoundsRect.size.width;
  double height = self->_currentSetBoundsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isTransitioningToNewSize
{
  return self->_isTransitioningToNewSize;
}

uint64_t __32__ICTextView__updateContentSize__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a5 = 1;
  return result;
}

- (void)_scrollToSelectionIfNeeded
{
  if ([(ICTextView *)self shouldAutoScroll])
  {
    v3.receiver = self;
    v3.super_class = (Class)ICTextView;
    [(ICTextView *)&v3 _scrollToSelectionIfNeeded];
  }
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v55 = *MEMORY[0x263EF8340];
  if ([(ICTextView *)self updatingContentSizeCount])
  {
    v50.receiver = self;
    v50.super_class = (Class)ICTextView;
    -[ICTextView setContentOffset:](&v50, sel_setContentOffset_, x, y);
    return;
  }
  -[ICTextView scrollEmbeddedScrollViewsWithProposedContentOffset:](self, "scrollEmbeddedScrollViewsWithProposedContentOffset:", x, y);
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v10 = [MEMORY[0x263F5B3F8] rootSettings];
  if (![v10 isRubberBandingEnabled]
    || ![(ICTextView *)self shouldRubberBand])
  {

    goto LABEL_9;
  }
  if ([(ICTextView *)self isDragging])
  {

    goto LABEL_18;
  }
  char v19 = [(ICTextView *)self isDecelerating];

  if ((v19 & 1) == 0)
  {
LABEL_9:
    CGFloat v11 = [(ICBaseTextView *)self editorController];
    uint64_t v12 = [v11 attributionSidebarVisibility];

    CGFloat v13 = [(ICBaseTextView *)self editorController];
    BOOL v14 = [v13 authorHighlightsController];
    BOOL v15 = [(ICBaseTextView *)self TTTextStorage];
    char v16 = [v14 isPerformingHighlightUpdatesForTextStorage:v15];

    if (v12 != 1 && (v16 & 1) == 0 && ![(ICTextView *)self isSettingContentOffset])
    {
      if ((TSDPointHasInfComponents() & 1) != 0 || TSDPointHasNaNComponents())
      {
        double v17 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v56.double x = v7;
          v56.double y = v9;
          double v18 = NSStringFromPoint(v56);
          *(_DWORD *)buf = 136315394;
          v52 = "-[ICTextView setContentOffset:]";
          __int16 v53 = 2112;
          v54 = v18;
          _os_log_impl(&dword_20BE60000, v17, OS_LOG_TYPE_DEFAULT, "Calling %s with invalid value: %@", buf, 0x16u);
        }
      }
      else
      {
        [(ICTextView *)self setIsSettingContentOffset:1];
        [(ICTextView *)self contentOffset];
        if ((v30 != 0.0 || v29 != v9) && ![(ICTextView *)self isTransitioningToNewSize])
        {
          CGRect v31 = [(ICBaseTextView *)self icDelegate];
          char v32 = objc_opt_respondsToSelector();

          if ((v32 & 1) != 0
            && ([(ICBaseTextView *)self icDelegate],
                id v33 = objc_claimAutoreleasedReturnValue(),
                int v34 = [v33 shouldLockTextViewContentOffset],
                v33,
                v34))
          {
            v35 = os_log_create("com.apple.notes", "UI");
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
              -[ICTextView setContentOffset:](v35);
            }

            int v36 = 1;
          }
          else
          {
            int v36 = 0;
          }
          v43 = [(ICTextView *)self scrollClampingControllerDelayedRelease];
          v44 = [v43 clampedYValue];

          if (v44 && ![(ICTextView *)self isUpdatingPanGesture])
          {
            [v44 floatValue];
            v48.receiver = self;
            v48.super_class = (Class)ICTextView;
            -[ICTextView setContentOffset:](&v48, sel_setContentOffset_, 0.0, v46);
          }
          else if ([(ICTextView *)self disableContentOffsetChanges] {
                 || (v36 | [(ICBaseTextView *)self isInProcessEditingForTextStorage]) == 1)
          }
          {
            if (![(ICBaseTextView *)self isInProcessEditingForTextStorage])
            {
              [(ICTextView *)self contentOffset];
              double v9 = v45;
            }
            -[ICTextView setClippedContentOffset:](self, "setClippedContentOffset:", 0.0, v9);
          }
          else
          {
            v47.receiver = self;
            v47.super_class = (Class)ICTextView;
            -[ICTextView setContentOffset:](&v47, sel_setContentOffset_, 0.0, v9);
          }
        }
        [(ICTextView *)self setIsSettingContentOffset:0];
      }
    }
    return;
  }
LABEL_18:
  [(ICTextView *)self rubberBandContentOffset];
  double v21 = v20;
  double v22 = [MEMORY[0x263F5B3F8] rootSettings];
  [v22 rubberBandRange];
  double v24 = v23;

  v25 = [MEMORY[0x263F5B3F8] rootSettings];
  [v25 rubberBandDragDistance];
  double v27 = v26;

  if (v9 <= v21) {
    goto LABEL_9;
  }
  if (vabdd_f64(v9, v21) < v27)
  {
    ICTextViewRubberBandOffsetForOffset(0, v9, v21, v21, v24);
    double v9 = v28;
    goto LABEL_9;
  }
  [(ICTextView *)self setShouldRubberBand:0];
  v37 = [(ICTextView *)self delegate];
  char v38 = objc_opt_respondsToSelector();

  if (v38)
  {
    v39 = [(ICTextView *)self delegate];
    [v39 textViewDidBreakRubberBand:self];
  }
  v40 = [MEMORY[0x263F5B3F8] rootSettings];
  [v40 rubberBandCatchUpAnimationDuration];
  double v42 = v41;

  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __31__ICTextView_setContentOffset___block_invoke;
  v49[3] = &unk_2640B9640;
  *(CGFloat *)&v49[5] = v7;
  *(double *)&v49[6] = v9;
  v49[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v49 animations:v42];
}

- (void)setIsSettingContentOffset:(BOOL)a3
{
  self->_isSettingContentOffset = a3;
}

- (CGPoint)scrollEmbeddedScrollViewsWithProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v72 = *MEMORY[0x263EF8340];
  [(ICTextView *)self contentOffset];
  double v7 = v6;
  [(ICTextView *)self contentOffset];
  double v9 = v8;
  [(ICTextView *)self bounds];
  CGFloat v65 = v11;
  CGFloat v66 = v10;
  CGFloat rect = v12;
  CGFloat v14 = v13;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  BOOL v15 = [(ICTextView *)self embeddedScrollViews];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    double v61 = x - v7;
    double v62 = x;
    double v63 = y;
    double v18 = y - v9;
    uint64_t v19 = *(void *)v68;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v68 != v19) {
          objc_enumerationMutation(v15);
        }
        double v21 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        objc_msgSend(v21, "contentSize", *(void *)&v61);
        double v23 = v22;
        [v21 bounds];
        if (v23 > CGRectGetHeight(v74))
        {
          [v21 bounds];
          objc_msgSend(v21, "convertRect:toView:", self);
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          CGFloat v29 = v28;
          CGFloat v31 = v30;
          [v21 contentSize];
          double v33 = v32;
          [v21 bounds];
          double v34 = v33 - CGRectGetHeight(v75);
          [v21 contentInset];
          double v36 = v34 + v35;
          v76.origin.double x = v25;
          v76.origin.double y = v27;
          v76.size.double width = v29;
          v76.size.double height = v31;
          double MaxY = CGRectGetMaxY(v76);
          v77.origin.double y = v65;
          v77.origin.double x = v66;
          v77.size.double width = rect;
          v77.size.double height = v14;
          double v38 = CGRectGetMaxY(v77);
          BOOL v39 = 0;
          if (v18 > 0.0 && MaxY - v18 < v38)
          {
            [v21 contentOffset];
            BOOL v39 = v40 < v36;
          }
          v78.origin.double x = v25;
          v78.origin.double y = v27;
          v78.size.double width = v29;
          v78.size.double height = v31;
          CGFloat v41 = CGRectGetMaxY(v78) - v18;
          v79.origin.double y = v65;
          v79.origin.double x = v66;
          v79.size.double width = rect;
          v79.size.double height = v14;
          if (v41 <= CGRectGetMaxY(v79))
          {
            if (v39) {
              goto LABEL_20;
            }
          }
          else
          {
            [v21 contentOffset];
            char v43 = v42 > 0.0 || v39;
            if (v43)
            {
LABEL_20:
              [v21 contentOffset];
              double v45 = v61 + v44;
              [v21 contentOffset];
              double v47 = fmax(v18 + v46, 0.0);
              if (v47 >= v36) {
                double v48 = v36;
              }
              else {
                double v48 = v47;
              }
              [v21 contentOffset];
              double v50 = v45 - v49;
              [v21 contentOffset];
              double v52 = v48 - v51;
              objc_msgSend(v21, "setContentOffset:", v45, v48);
              __int16 v53 = [(ICTextView *)self panGestureRecognizer];
              [v53 translationInView:self];
              double v55 = v54;
              double v57 = v56;

              v58 = [(ICTextView *)self panGestureRecognizer];
              objc_msgSend(v58, "setTranslation:inView:", self, v50 + v55, v57 + v52);

              double x = v62 - v50;
              double y = v63 - v52;
              goto LABEL_24;
            }
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v67 objects:v71 count:16];
      if (v17) {
        continue;
      }
      break;
    }
    double x = v62;
    double y = v63;
  }
LABEL_24:

  double v59 = x;
  double v60 = y;
  result.double y = v60;
  result.double x = v59;
  return result;
}

- (BOOL)isSettingContentOffset
{
  return self->_isSettingContentOffset;
}

- (NSSet)embeddedScrollViews
{
  return self->_embeddedScrollViews;
}

- (void)applyEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  uint64_t v72 = *MEMORY[0x263EF8340];
  if ([(ICTextView *)self _freezeTextContainerSize]) {
    return;
  }
  if (!objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    double v13 = [(ICTextView *)self window];

    if (!v13) {
      return;
    }
    uint64_t v14 = [(ICTextView *)self effectiveUserInterfaceLayoutDirection];
    [(ICTextView *)self bounds];
    double v16 = v15;
    uint64_t v17 = [(ICBaseTextView *)self TTTextStorage];
    double v18 = [v17 textViews];

    if ((unint64_t)[v18 count] >= 2)
    {
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      CGFloat v65 = v18;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v67 objects:v71 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v68 != v22) {
              objc_enumerationMutation(v19);
            }
            double v24 = *(ICTextView **)(*((void *)&v67 + 1) + 8 * i);
            if (v24 != self)
            {
              CGFloat v25 = [*(id *)(*((void *)&v67 + 1) + 8 * i) window];

              if (v25)
              {
                double v26 = [(ICTextView *)v24 window];
                CGFloat v27 = [v26 windowScene];
                unint64_t v28 = [v27 activationState];

                if (v28 <= 1)
                {
                  [(ICTextView *)v24 bounds];
                  if (v29 >= v16) {
                    double v16 = v29;
                  }
                }
              }
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v67 objects:v71 count:16];
        }
        while (v21);
      }

      double v18 = v65;
    }
    [(ICTextView *)self leadingMargin];
    double v31 = v30;
    double v32 = v16 - (right + v30);
    if (v16 > 1366.0)
    {
      double v33 = 1.2;
LABEL_32:
      double v35 = fmax(v33, 1.0);
      double v36 = v16 - (v31 + v32 * v35);
      if (v36 >= v31) {
        double v37 = v36;
      }
      else {
        double v37 = v31;
      }
      [(ICTextView *)self textContainerInset];
      double v39 = v38;
      double v41 = v40;
      if (v14 == 1) {
        double v42 = v31;
      }
      else {
        double v42 = v37;
      }
      if (v14 == 1) {
        double v31 = v37;
      }
      [(ICTextView *)self textContainerInset];
      BOOL v46 = v45 == v31;
      if (v47 != v39) {
        BOOL v46 = 0;
      }
      if (v44 != v42) {
        BOOL v46 = 0;
      }
      BOOL v48 = v43 == v41 && v46;
      if (!v48) {
        -[ICTextView setTextContainerInset:](self, "setTextContainerInset:", v39, v31, v41, v42);
      }
      double v49 = [(ICBaseTextView *)self TTTextStorage];
      objc_opt_class();
      double v50 = [v49 styler];
      double v51 = ICCheckedDynamicCast();

      if (!v51)
      {
        double v54 = v18;
        int v55 = 0;
        goto LABEL_65;
      }
      double v52 = [v51 zoomController];
      [v52 zoomFactor];
      if (vabdd_f64(v35, v53) >= 0.00999999978)
      {
        if ((ICInternalSettingsIsTextKit2Enabled() & 1) != 0 || (unint64_t)[v18 count] < 2) {
          goto LABEL_59;
        }
        double v56 = [(ICTextView *)self window];
        double v57 = [v56 windowScene];
        if ([v57 activationState] == 2)
        {
          double v54 = v18;

          goto LABEL_52;
        }
        v58 = [(ICTextView *)self window];
        double v59 = [v58 windowScene];
        uint64_t v66 = [v59 activationState];

        if (v66 != 1)
        {
LABEL_59:
          [v52 setZoomFactor:v35];
          double v60 = os_log_create("com.apple.notes", "UI");
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
            -[ICTextView applyEdgeInsets:](v60, v35);
          }
          double v54 = v18;

          if (ICInternalSettingsIsTextKit2Enabled())
          {
            int v55 = 1;
            [(ICBaseTextView *)self setNeedsStylingRefreshOnNextLayout:1];
          }
          else
          {
            [v51 refreshTextStylingForTextStorage:v49 withTextController:v51];
            int v55 = 1;
          }
          goto LABEL_64;
        }
      }
      double v54 = v18;
LABEL_52:
      int v55 = 0;
LABEL_64:

LABEL_65:
      int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
      [(ICTextView *)self setNeedsLayout];
      if (IsTextKit2Enabled)
      {
        if ((v55 | !v48) == 1)
        {
          objc_opt_class();
          uint64_t v62 = [(ICTextView *)self textLayoutManager];
LABEL_70:
          double v63 = (void *)v62;
          v64 = ICDynamicCast();

          [v64 zoomFactorOrInsetsDidChange];
        }
      }
      else
      {
        [(ICTextView *)self frame];
        -[ICTextView setFrame:](self, "setFrame:");
        if ((v55 | !v48) == 1)
        {
          objc_opt_class();
          uint64_t v62 = [(ICTextView *)self layoutManager];
          goto LABEL_70;
        }
      }

      return;
    }
    double v33 = v16 * 0.5 / 375.0;
    if (v16 <= 1024.0)
    {
      if (v16 <= 989.0) {
        goto LABEL_32;
      }
      double v34 = 0.85;
    }
    else
    {
      double v34 = 0.68;
    }
    double v33 = v33 * v34;
    goto LABEL_32;
  }
  [(id)objc_opt_class() overrideEdgeInset];
  double v6 = v5;
  [(ICTextView *)self textContainerInset];
  double v8 = v7;
  [(ICTextView *)self textContainerInset];
  if (v12 != v6 || v9 != v6 || v11 != v6 || v10 != v8)
  {
    -[ICTextView setTextContainerInset:](self, "setTextContainerInset:", v6, v6, v8, v6);
  }
}

- (void)_adjustContentOffsetIfNecessary
{
  objc_super v3 = [(ICTextView *)self window];

  if (v3)
  {
    v4.receiver = self;
    v4.super_class = (Class)ICTextView;
    [(ICTextView *)&v4 _adjustContentOffsetIfNecessary];
  }
}

- (void)updateLayoutMargins
{
  [(ICTextView *)self minimumMargins];
  double v4 = v3;
  double v6 = v5;
  [(ICTextView *)self layoutMargins];
  if (v7 >= v4) {
    double v4 = v7;
  }
  [(ICTextView *)self layoutMargins];
  if (v8 < v6) {
    double v8 = v6;
  }

  -[ICTextView applyEdgeInsets:](self, "applyEdgeInsets:", 0.0, v4, 0.0, v8);
}

- (double)leadingMargin
{
  if ([(ICTextView *)self isEditingOnSystemPaper]
    && ([(ICTextView *)self traitCollection],
        double v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 userInterfaceIdiom],
        v3,
        v4 == 1))
  {
    +[ICSystemPaperConstants noteLeadingMargin];
  }
  else
  {
    [(ICTextView *)self bounds];
    double v7 = ceil(v6 * 24.0 / 375.0);
    double v8 = [(ICTextView *)self textContainer];
    [v8 lineFragmentPadding];
    double v10 = v7 - v9;

    [(ICTextView *)self minimumMargins];
    if (v10 >= v11) {
      return v10;
    }
    else {
      return v11;
    }
  }
  return result;
}

- (UIEdgeInsets)minimumMargins
{
  id v2 = [(ICTextView *)self textContainer];
  [v2 lineFragmentPadding];
  double v4 = 12.0 - v3;

  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = v4;
  double v8 = v4;
  result.double right = v8;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- (BOOL)isEditingOnSystemPaper
{
  double v3 = [(ICBaseTextView *)self icDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  double v5 = [(ICBaseTextView *)self icDelegate];
  char v6 = [v5 isEditingOnSystemPaper];

  return v6;
}

- (void)_updateContentSize
{
  double v3 = [(ICTextView *)self superview];

  if (v3)
  {
    if (![(ICTextView *)self updatingContentSizeCount])
    {
      [(ICTextView *)self contentSize];
      -[ICTextView setPreviousContentSize:](self, "setPreviousContentSize:");
    }
    [(ICTextView *)self setUpdatingContentSizeCount:[(ICTextView *)self updatingContentSizeCount] + 1];
    v22.receiver = self;
    v22.super_class = (Class)ICTextView;
    [(ICTextView *)&v22 _updateContentSize];
    [(ICTextView *)self setUpdatingContentSizeCount:[(ICTextView *)self updatingContentSizeCount] - 1];
    if (![(ICTextView *)self updatingContentSizeCount])
    {
      [(ICTextView *)self previousContentSize];
      double v5 = v4;
      [(ICTextView *)self contentSize];
      double v7 = v6 - v5;
      if (v6 - v5 != 0.0)
      {
        uint64_t v18 = 0;
        id v19 = &v18;
        uint64_t v20 = 0x2020000000;
        char v21 = 0;
        double v8 = [(ICBaseTextView *)self editorController];
        double v9 = [v8 note];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __32__ICTextView__updateContentSize__block_invoke;
        v17[3] = &unk_2640B8328;
        v17[4] = &v18;
        [v9 enumerateAttachmentsInOrderUsingBlock:v17];

        if (*((unsigned char *)v19 + 24)) {
          [(ICTextView *)self setNeedsHideOverlappingAttachmentViews:1];
        }
        _Block_object_dispose(&v18, 8);
      }
      double v10 = [(ICTextView *)self scrollClampingControllerDelayedRelease];
      double v11 = [v10 clampedYValue];

      if (v11)
      {
        if (![(ICTextView *)self isUpdatingPanGesture])
        {
          [(ICTextView *)self contentOffset];
          double v13 = v12;
          [v11 floatValue];
          v16.receiver = self;
          v16.super_class = (Class)ICTextView;
          -[ICTextView setContentOffset:](&v16, sel_setContentOffset_, v13, v14);
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __32__ICTextView__updateContentSize__block_invoke_2;
          v15[3] = &unk_2640B8140;
          v15[4] = self;
          dispatch_async(MEMORY[0x263EF83A0], v15);
        }
      }
    }
  }
}

- (unint64_t)updatingContentSizeCount
{
  return self->_updatingContentSizeCount;
}

- (void)setUpdatingContentSizeCount:(unint64_t)a3
{
  self->_updatingContentSizeCount = a3;
}

- (BOOL)shouldAutoScroll
{
  if ([(ICTextView *)self isScrolling]) {
    return 0;
  }
  objc_opt_class();
  double v3 = [(ICTextView *)self textStorage];
  double v4 = ICDynamicCast();
  char v5 = [v4 isTypingOrMarkingText];

  if (v5) {
    return 1;
  }
  double v7 = [(ICTextView *)self scrollClampingControllerDelayedRelease];
  if ([v7 isClamped])
  {

    return 0;
  }
  BOOL v8 = [(ICTextView *)self isPerformingHighlightUpdates];

  return !v8;
}

- (ICSharedScrollClampingController)scrollClampingControllerDelayedRelease
{
  return self->_scrollClampingControllerDelayedRelease;
}

- (BOOL)isScrolling
{
  if (([(ICTextView *)self isDragging] & 1) != 0
    || ([(ICTextView *)self isDecelerating] & 1) != 0)
  {
    return 1;
  }

  return [(ICTextView *)self _isAnimatingScroll];
}

- (BOOL)isPerformingHighlightUpdates
{
  return self->_isPerformingHighlightUpdates;
}

- (void)setPreviousContentSize:(CGSize)a3
{
  self->_previousContentSize = a3;
}

- (void)setNeedsHideOverlappingAttachmentViews:(BOOL)a3
{
  self->_needsHideOverlappingAttachmentViews = a3;
}

- (CGSize)previousContentSize
{
  double width = self->_previousContentSize.width;
  double height = self->_previousContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_opt_class();
    double v3 = [(ICTextView *)self layoutManager];
    double v4 = ICDynamicCast();

    if ([(ICTextView *)self shouldUpdateVisibleSupplementalViewsInLayoutSubviews])
    {
      [v4 updateVisibleSupplementalViews];
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)ICTextView;
  [(ICTextView *)&v6 layoutSubviews];
  if (([(ICTextView *)self _freezeTextContainerSize] & 1) == 0
    && ![(ICTextView *)self isTransitioningToNewSize])
  {
    [(ICTextView *)self updateOverscrollItemFrames];
  }
  ICInternalSettingsIsTextKit2Enabled();
  char v5 = [(ICTextView *)self dateView];
  [v5 updateLayoutIfNecessary];

  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0) {
    [(ICTextView *)self hideOverlappingAttachmentViewsIfNecessary];
  }
}

- (id)undoManager
{
  id v2 = [(ICBaseTextView *)self TTTextStorage];
  double v3 = [v2 undoManager];

  return v3;
}

- (BOOL)resignFirstResponder
{
  if ([(ICTextView *)self isFirstResponder])
  {
    double v3 = [MEMORY[0x263F5ABC0] sharedState];
    [v3 extendDeauthenticationTimer];

    double v4 = [(ICBaseTextView *)self editorController];
    char v5 = [v4 mentionsController];

    objc_super v6 = (void *)MEMORY[0x263F5AC88];
    double v7 = [(ICBaseTextView *)self TTTextStorage];
    uint64_t v8 = [v6 rangeOfUnconfirmedMentionInTextStorage:v7];
    uint64_t v10 = v9;

    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v10)
    {
      double v11 = [(ICBaseTextView *)self TTTextStorage];
      double v12 = [(ICBaseTextView *)self editorController];
      double v13 = [v12 note];
      BYTE1(v25) = [(ICBaseTextView *)self languageHasSpaces];
      LOBYTE(v25) = 1;
      [v5 checkForMentionInEditedRange:v8 ofTextStorage:v10 note:v11 textView:v13 allowAutoExplicitMention:self isEndingEditing:1 languageHasSpaces:v25 parentAttachment:0];
    }
    float v14 = [(ICBaseTextView *)self editorController];
    double v15 = [v14 hashtagController];

    objc_super v16 = (void *)MEMORY[0x263F5AC58];
    uint64_t v17 = [(ICBaseTextView *)self TTTextStorage];
    uint64_t v18 = [v16 rangeOfUnconfirmedHashtagInTextStorage:v17];
    uint64_t v20 = v19;

    if (v18 != 0x7FFFFFFFFFFFFFFFLL && v20)
    {
      char v21 = [(ICBaseTextView *)self TTTextStorage];
      objc_super v22 = [(ICBaseTextView *)self editorController];
      double v23 = [v22 note];
      BYTE1(v25) = [(ICBaseTextView *)self languageHasSpaces];
      LOBYTE(v25) = 1;
      [v15 checkForHashtagInEditedRange:v18 ofTextStorage:v20 note:v21 textView:v23 allowAutoExplicitHashtag:self isEndingEditing:0 languageHasSpaces:v25 parentAttachment:0];
    }
  }
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    double v29 = __34__ICTextView_resignFirstResponder__block_invoke;
    double v30 = &unk_2640B8140;
    double v31 = self;
    dispatchMainAfterDelay();
  }
  v26.receiver = self;
  v26.super_class = (Class)ICTextView;
  return [(ICBaseTextView *)&v26 resignFirstResponder];
}

- (BOOL)becomesEditableWithGestures
{
  return 0;
}

uint64_t __67__ICTextView_authorHighlightsControllerDidPerformHighlightUpdates___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsPerformingHighlightUpdates:0];
}

- (void)sceneWillEnterForeground:(id)a3
{
  double v4 = [a3 object];
  char v5 = [(ICTextView *)self window];
  objc_super v6 = [v5 windowScene];

  if (v4 == v6)
  {
    [(ICTextView *)self updateLayoutMarginsForMultipleTextViewsIfNecessary];
  }
}

- (ICTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if (!v9) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textContainer) != nil)", "-[ICTextView initWithFrame:textContainer:]", 1, 0, @"Expected non-nil value for '%s'", "textContainer");
  }
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    uint64_t v10 = [v9 textLayoutManager];

    if (!v10) {
      objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textContainer.textLayoutManager) != nil)", "-[ICTextView initWithFrame:textContainer:]", 1, 0, @"Expected non-nil value for '%s'", "textContainer.textLayoutManager");
    }
    double v11 = [v9 textLayoutManager];
    double v12 = [v11 textContentManager];

    if (!v12) {
      objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textContainer.textLayoutManager.textContentManager) != nil)", "-[ICTextView initWithFrame:textContainer:]", 1, 0, @"Expected non-nil value for '%s'", "textContainer.textLayoutManager.textContentManager");
    }
  }
  else
  {
    double v13 = [v9 layoutManager];

    if (!v13) {
      objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textContainer.layoutManager) != nil)", "-[ICTextView initWithFrame:textContainer:]", 1, 0, @"Expected non-nil value for '%s'", "textContainer.layoutManager");
    }
    float v14 = [v9 layoutManager];
    double v15 = [v14 textStorage];

    if (!v15) {
      objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((textContainer.layoutManager.textStorage) != nil)", "-[ICTextView initWithFrame:textContainer:]", 1, 0, @"Expected non-nil value for '%s'", "textContainer.layoutManager.textStorage");
    }
  }
  v42.receiver = self;
  v42.super_class = (Class)ICTextView;
  objc_super v16 = -[ICBaseTextView initWithFrame:textContainer:](&v42, sel_initWithFrame_textContainer_, v9, x, y, width, height);
  if (v16)
  {
    uint64_t v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v17 floatForKey:*MEMORY[0x263F5AF18]];
    double v19 = v18;

    [(ICTextView *)v16 setMaxTileHeight:v19];
    [(ICTextView *)v16 setEditable:0];
    uint64_t v20 = (CATransformLayer *)objc_alloc_init(MEMORY[0x263F15908]);
    splitLayerContainer = v16->_splitLayerContainer;
    v16->_splitLayerContainer = v20;

    objc_super v22 = [(ICTextView *)v16 layer];
    [v22 addSublayer:v16->_splitLayerContainer];

    if (objc_opt_respondsToSelector()) {
      [(ICTextView *)v16 setLayoutMarginsFollowReadableWidth:1];
    }
    [(ICTextView *)v16 createDateLabel];
    double v23 = [MEMORY[0x263F08A00] defaultCenter];
    [v23 addObserver:v16 selector:sel_keyboardDidBeginDictation_ name:@"UIKeyboardDidBeginDictationNotification" object:0];

    double v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v16 selector:sel_dictationControllerDidPause_ name:*MEMORY[0x263F834B8] object:0];

    uint64_t v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:v16 selector:sel_dictationControllerDidResume_ name:*MEMORY[0x263F834C0] object:0];

    objc_super v26 = [MEMORY[0x263F08A00] defaultCenter];
    [v26 addObserver:v16 selector:sel_dictationControllerDidFinish_ name:*MEMORY[0x263F834B0] object:0];

    uint64_t v27 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v28 = *MEMORY[0x263F08628];
    double v29 = [(ICTextView *)v16 undoManager];
    [v27 addObserver:v16 selector:sel_undoManagerDidOpenUndoGroup_ name:v28 object:v29];

    double v30 = [MEMORY[0x263F08A00] defaultCenter];
    [v30 addObserver:v16 selector:sel_handleAccessibilityDarkerSystemColorsStatusDidChange_ name:*MEMORY[0x263F831A0] object:0];

    double v31 = [MEMORY[0x263F08A00] defaultCenter];
    [v31 addObserver:v16 selector:sel_sceneWillEnterForeground_ name:*MEMORY[0x263F83928] object:0];

    double v32 = [MEMORY[0x263F08A00] defaultCenter];
    [v32 addObserver:v16 selector:sel_splitViewAnimatedTransitionWillBegin_ name:@"ICSplitViewControllerWillBeginAnimatedTransitionToStateRequest" object:0];

    double v33 = [MEMORY[0x263F08A00] defaultCenter];
    [v33 addObserver:v16 selector:sel_splitViewAnimatedTransitionEnded_ name:@"ICSplitViewControllerDidEndAnimatedTransitionToStateRequest" object:0];

    double v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 addObserver:v16 selector:sel_authorHighlightsControllerWillPerformHighlightUpdates_ name:*MEMORY[0x263F5B068] object:0];

    double v35 = [MEMORY[0x263F08A00] defaultCenter];
    [v35 addObserver:v16 selector:sel_authorHighlightsControllerDidPerformHighlightUpdates_ name:*MEMORY[0x263F5B050] object:0];

    [(ICTextView *)v16 initializeScollClampingController];
    [(ICTextView *)v16 setPreservesSuperviewLayoutMargins:0];
    double v36 = [(ICTextView *)v16 containerViewForAttachments];
    [v36 setShouldGroupAccessibilityChildren:1];

    [(ICBaseTextView *)v16 setupTextViewDragAndDropDelegates];
    [MEMORY[0x263F5B360] updateTouchPredictionPointsFromOverride];
    double v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    highlightLayers = v16->_highlightLayers;
    v16->_highlightLayers = v37;

    double v39 = [MEMORY[0x263F83018] productivityPanGestureRecognizerWithTarget:v16 action:sel_inProcessUndoPanGesture_ delegate:v16];
    [v39 setName:@"com.apple.MobileNotes.InProcess_UIKBProductivityPanGestureRecognizer"];
    [(ICTextView *)v16 addGestureRecognizer:v39];
    [(ICTextView *)v16 registerForTraitChanges];
    if (ICInternalSettingsIsAsyncFindEnabled())
    {
      double v40 = [[ICTextFindingCoordinator alloc] initWithDataSource:v16];
      [(ICTextView *)v16 setTextFindingCoordinator:v40];
    }
  }

  return v16;
}

- (void)setEditable:(BOOL)a3
{
  BOOL v3 = a3;
  [(ICTextView *)self setIsSettingEditable:1];
  char v5 = [(ICTextView *)self TTTextStorageOptional];
  [v5 beginTemporaryAttributeEditing];

  v7.receiver = self;
  v7.super_class = (Class)ICTextView;
  [(ICTextView *)&v7 setEditable:v3];
  objc_super v6 = [(ICTextView *)self TTTextStorageOptional];
  [v6 endTemporaryAttributeEditing];

  [(ICTextView *)self setIsSettingEditable:0];
}

- (void)setIsSettingEditable:(BOOL)a3
{
  self->_isSettingEditable = a3;
}

- (id)TTTextStorageOptional
{
  objc_opt_class();
  BOOL v3 = [(ICTextView *)self textStorage];
  double v4 = ICDynamicCast();

  return v4;
}

- (void)setTextFindingCoordinator:(id)a3
{
}

- (void)registerForTraitChanges
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = objc_opt_class();
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[(ICTextView *)self registerForTraitChanges:v3 withAction:sel_updateOverscrollItemFrames];
}

- (void)initializeScollClampingController
{
  BOOL v3 = [[ICSharedScrollClampingController alloc] initWithTextView:self listensToMergeNotifications:1 clampingTurnOffDelay:0.5];
  [(ICTextView *)self setScrollClampingControllerDelayedRelease:v3];
}

- (void)setScrollClampingControllerDelayedRelease:(id)a3
{
}

- (void)createDateLabel
{
  objc_opt_class();
  BOOL v3 = [(ICTextView *)self textContainer];
  id v4 = ICDynamicCast();
  char v5 = [v4 insideSiriSnippet];

  if ((v5 & 1) == 0)
  {
    objc_super v6 = +[ICNoteEditorDateView newDateView];
    dateView = self->_dateView;
    self->_dateView = v6;

    [(ICNoteEditorDateView *)self->_dateView setAutoresizingMask:21];
    [(ICNoteEditorDateView *)self->_dateView _accessibilitySetIsSpeakThisElement:0];
    uint64_t v8 = self->_dateView;
    [(ICTextView *)self addSubview:v8];
  }
}

+ (void)initialize
{
  v11[1] = *MEMORY[0x263EF8340];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___ICTextView;
  objc_msgSendSuper2(&v7, sel_initialize);
  if ((id)objc_opt_class() == a1)
  {
    BOOL v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v10 = *MEMORY[0x263F5AF18];
    v11[0] = &unk_26C1390A8;
    id v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v3 registerDefaults:v4];

    char v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v8 = *MEMORY[0x263F5AF00];
    id v9 = &unk_26C1390C0;
    objc_super v6 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [v5 registerDefaults:v6];
  }
}

- (BOOL)supportsAttachments
{
  return 1;
}

void __96__ICTextView_updateCompatibilityBannerForNote_parentViewController_updateTextViewContentInsets___block_invoke(uint64_t a1, char a2)
{
  objc_copyWeak(&v5, (id *)(a1 + 40));
  objc_copyWeak(&v6, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 32);
  char v7 = a2;
  char v8 = *(unsigned char *)(a1 + 56);
  performBlockOnMainThread();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

+ (double)overrideEdgeInset
{
  int v2 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
  double result = 32.0;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (ICTextView)init
{
  return -[ICTextView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (ICTextView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = objc_alloc(MEMORY[0x263F5B498]);
  id v9 = [MEMORY[0x263F08C38] UUID];
  uint64_t v10 = (void *)[v8 initWithData:0 replicaID:v9];

  double v11 = objc_alloc_init(ICLayoutManager);
  [(ICBaseLayoutManager *)v11 setTextView:self];
  [v10 addLayoutManager:v11];
  double v12 = objc_msgSend(objc_alloc(MEMORY[0x263F5B4E0]), "initWithSize:", width, height);
  [v12 setWidthTracksTextView:1];
  [(ICLayoutManager *)v11 addTextContainer:v12];
  [(ICTextView *)self registerForTraitChanges];
  double v13 = -[ICTextView initWithFrame:textContainer:](self, "initWithFrame:textContainer:", v12, x, y, width, height);

  return v13;
}

- (ICTextView)initWithCoder:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_CallingInitwit.isa);
  v7.receiver = self;
  v7.super_class = (Class)ICTextView;
  id v5 = [(ICBaseTextView *)&v7 initWithCoder:v4];

  if (v5)
  {
    [(ICTextView *)v5 setEditable:0];
    [(ICTextView *)v5 initializeScollClampingController];
    [(ICTextView *)v5 registerForTraitChanges];
  }
  return v5;
}

- (void)dealloc
{
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    BOOL v3 = [(ICTextView *)self layoutManager];
    if (v3)
    {
      id v4 = [(ICTextView *)self textStorage];
      [v4 removeLayoutManager:v3];
    }
  }
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v6 dealloc];
}

- (BOOL)_shouldBecomeEditableUponFocus
{
  return 1;
}

- (BOOL)_shouldBecomeEditableUponBecomingTargetOfKeyboardEventDeferringEnvironment
{
  return 1;
}

- (void)setAttachmentViewDelegate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(ICTextView *)self layoutManager];
  ICCheckedDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [v6 setAttachmentViewDelegate:v4];
}

- (ICAttachmentViewDelegate)attachmentViewDelegate
{
  objc_opt_class();
  BOOL v3 = [(ICTextView *)self layoutManager];
  id v4 = ICCheckedDynamicCast();

  id v5 = [v4 attachmentViewDelegate];

  return (ICAttachmentViewDelegate *)v5;
}

- (id)note
{
  int v2 = [(ICBaseTextView *)self editorController];
  BOOL v3 = [v2 note];

  return v3;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICTextView *)self textFindingCoordinator];
  [v8 configureFindInteraction:v7 forTextView:self];

  v10.receiver = self;
  v10.super_class = (Class)ICTextView;
  [(ICTextView *)&v10 findInteraction:v7 didBeginFindSession:v6];

  id v9 = [(ICBaseTextView *)self editorController];
  [v9 didBeginFindInteraction];
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ICTextView;
  [(ICTextView *)&v6 findInteraction:a3 didEndFindSession:a4];
  id v5 = [(ICBaseTextView *)self editorController];
  [v5 didEndFindInteraction];
}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  id v4 = [[ICTextSearchingFindSession alloc] initWithTextView:self];

  return v4;
}

- (void)willHighlightFoundTextRange:(id)a3 inDocument:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)ICTextView;
  [(ICTextView *)&v4 willHighlightFoundTextRange:a3 inDocument:a4];
}

- (void)clearAllDecoratedFoundText
{
  v4.receiver = self;
  v4.super_class = (Class)ICTextView;
  [(ICTextView *)&v4 clearAllDecoratedFoundText];
  BOOL v3 = [(ICBaseTextView *)self editorController];
  [v3 showOrHideSearchPatternHighlightsIfNecessary];

  if (objc_opt_respondsToSelector()) {
    [(ICTextView *)self _clearHighlightView];
  }
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(ICBaseTextView *)self editorController];
  [v11 didUpdateSearchQueryInFindInteraction:v8];

  double v12 = [(ICTextView *)self textStorage];
  objc_initWeak(&location, v10);
  objc_initWeak(&from, self);
  double v13 = +[ICNoteEditorTextFindingController textFindingQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke;
  v17[3] = &unk_2640B9A20;
  id v18 = v9;
  id v14 = v9;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  id v19 = v8;
  uint64_t v20 = self;
  id v21 = v12;
  id v15 = v12;
  id v16 = v8;
  dispatch_async(v13, v17);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) stringCompareOptions];
  uint64_t v3 = [*(id *)(a1 + 32) wordMatchMethod];
  uint64_t v4 = [*(id *)(a1 + 32) wordMatchMethod];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_2;
  aBlock[3] = &unk_2640B99D0;
  objc_copyWeak(&v19, (id *)(a1 + 64));
  objc_copyWeak(&v20, (id *)(a1 + 72));
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v17 = v5;
  uint64_t v18 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 48) textFindingCoordinator];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 48) textFindingCoordinator];
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 40);
    double v11 = [*(id *)(a1 + 48) note];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_4;
    v14[3] = &unk_2640B99F8;
    id v15 = v7;
    [v9 matchesForString:v10 inTextStorage:v13 note:v11 ignoreCase:v2 & 1 wholeWords:v3 == 2 startsWith:v4 == 1 completion:v14];

    double v12 = v15;
  }
  else
  {
    double v12 = +[ICNoteEditorTextFindingController textFindingResultsForPattern:*(void *)(a1 + 40) textView:*(void *)(a1 + 48) textStorage:*(void *)(a1 + 56) ignoreCase:v2 & 1 wholeWords:v3 == 2];
    (*((void (**)(void *, void *))v7 + 2))(v7, v12);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
}

void __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_3;
  block[3] = &unk_2640B99A8;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v8 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
}

void __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_3(id *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  uint64_t v18 = a1;
  id v3 = objc_loadWeakRetained(a1 + 8);
  id v4 = v3;
  id v19 = WeakRetained;
  if (WeakRetained && v3)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = a1[4];
    uint64_t v20 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v20)
    {
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v21 = [v6 range];
          uint64_t v8 = v7;
          id v22 = [v4 beginningOfDocument];
          id v9 = [v4 positionFromPosition:v22 offset:v21];
          uint64_t v10 = [v4 positionFromPosition:v9 offset:v8];
          id v11 = [v4 textRangeFromPosition:v9 toPosition:v10];
          objc_msgSend(v11, "_ic_setTextFindingResult:", v6);
          [v11 _setAttachmentRange:v6];
          [v19 foundRange:v11 forSearchString:v18[5] inDocument:0];
          objc_opt_class();
          id v12 = [v18[6] textLayoutManager];
          uint64_t v13 = [v12 textContentManager];
          id v14 = ICDynamicCast();
          id v15 = [v14 outlineController];

          objc_msgSend(v15, "expandAncestorsOfRange:", v21, v8);
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v20);
    }

    [v19 finishedSearching];
  }
}

void __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Find");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_4_cold_1((uint64_t)v4, v5);
    }

    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

- (id)selectionRectsForRange:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "_ic_textFindingResult");
  if ([v5 isAttachmentResult])
  {
    id v6 = [MEMORY[0x263EFF980] array];
    uint64_t v7 = [v5 framesForHighlightInTextView:self];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) CGRectValue];
          double v13 = v12;
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;
          uint64_t v20 = objc_alloc_init(ICTextSelectionRect);
          -[ICTextSelectionRect setRect:](v20, "setRect:", v13, v15, v17, v19);
          [v6 addObject:v20];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)ICTextView;
    id v6 = [(ICBaseTextView *)&v22 selectionRectsForRange:v4];
  }

  return v6;
}

- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "_ic_textFindingResult");
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 scrollToVisibleInTextView:self];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    [(ICTextView *)&v10 scrollRangeToVisible:v6 inDocument:v7];
  }
}

- (BOOL)shouldReplaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  uint64_t v5 = objc_msgSend(a3, "_ic_textFindingResult");
  if ([v5 isAttachmentResult])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  v32[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(v8, "_ic_textFindingResult");
  double v12 = [(ICTextView *)self textFindingCoordinator];

  if (v12 && v11)
  {
    double v13 = [(ICTextView *)self textFindingCoordinator];
    v32[0] = v11;
    double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
    id v25 = 0;
    [v13 replaceMatches:v14 withString:v10 error:&v25];
    id v15 = v25;

    if (v15)
    {
      double v16 = os_log_create("com.apple.notes", "Find");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v27 = v11;
        __int16 v28 = 2112;
        id v29 = v10;
        __int16 v30 = 2112;
        id v31 = v15;
        _os_log_error_impl(&dword_20BE60000, v16, OS_LOG_TYPE_ERROR, "Unexpected error when trying to replace %@ with %@: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    objc_opt_class();
    double v17 = objc_msgSend(v8, "_ic_textFindingResult");
    ICDynamicCast();
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_opt_class();
      double v18 = [v15 attachment];
      double v19 = [v18 attachmentModel];
      uint64_t v20 = ICDynamicCast();

      uint64_t v21 = [(ICTextView *)self characterRangeFromTextKitRange:v8];
      long long v23 = -[ICTextView tableAttachmentViewControllerForRange:](self, "tableAttachmentViewControllerForRange:", v21, v22);
      [v20 undoablyReplaceTextFindingResult:v15 withReplacementString:v10 tableViewController:v23];
    }
    else
    {
      v24.receiver = self;
      v24.super_class = (Class)ICTextView;
      [(ICTextView *)&v24 replaceFoundTextInRange:v8 inDocument:v9 withText:v10];
    }
  }
}

- (void)replaceAllOccurrencesOfQueryString:(id)a3 usingOptions:(id)a4 withText:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v29 = [v9 stringCompareOptions] & 1;
  uint64_t v11 = [v9 wordMatchMethod];
  uint64_t v12 = [v9 wordMatchMethod];
  double v13 = [(ICTextView *)self textFindingCoordinator];

  if (v13)
  {
    BOOL v14 = v12 == 1;
    BOOL v15 = v11 == 2;
    double v16 = [(ICTextView *)self textFindingCoordinator];
    double v17 = [(ICTextView *)self textStorage];
    double v18 = [(ICTextView *)self note];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __71__ICTextView_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke;
    v37[3] = &unk_2640B9348;
    id v38 = v8;
    id v39 = v10;
    LOBYTE(v28) = v14;
    [v16 replaceAllOccurrencesOfQueryString:v8 withString:v10 inTextStorage:v17 note:v18 ignoreCase:v29 wholeWords:v15 startsWith:v28 completion:v37];

    double v19 = v38;
  }
  else
  {
    BOOL v20 = v12 == 1;
    BOOL v21 = v11 == 2;
    v36.receiver = self;
    v36.super_class = (Class)ICTextView;
    [(ICTextView *)&v36 replaceAllOccurrencesOfQueryString:v8 usingOptions:v9 withText:v10];
    uint64_t v22 = [(ICTextView *)self textStorage];
    uint64_t v23 = *MEMORY[0x263F814A0];
    objc_super v24 = [(ICTextView *)self textStorage];
    uint64_t v25 = [v24 length];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __71__ICTextView_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke_175;
    v30[3] = &unk_2640B9A48;
    v30[4] = self;
    id v31 = v8;
    char v33 = v29;
    BOOL v34 = v21;
    BOOL v35 = v20;
    id v32 = v10;
    id v26 = v10;
    id v27 = v8;
    objc_msgSend(v22, "enumerateAttribute:inRange:options:usingBlock:", v23, 0, v25, 0, v30);

    double v19 = v31;
  }
}

void __71__ICTextView_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.notes", "Find");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__ICTextView_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

void __71__ICTextView_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke_175(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_opt_class();
  id v8 = ICDynamicCast();

  id v12 = [v8 attachment];

  if ([v12 isTable])
  {
    objc_opt_class();
    id v9 = [v12 attachmentModel];
    id v10 = ICDynamicCast();

    uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "tableAttachmentViewControllerForRange:", a3, a4);
    [v10 undoablyReplaceAllOccurrencesOfQueryString:*(void *)(a1 + 40) textView:*(void *)(a1 + 32) ignoreCase:*(unsigned __int8 *)(a1 + 56) wholeWords:*(unsigned __int8 *)(a1 + 57) startsWith:*(unsigned __int8 *)(a1 + 58) withText:*(void *)(a1 + 48) tableViewController:v11];
  }
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  return objc_msgSend(a3, "ic_compare:inTextView:", a4, self, a5);
}

- (_NSRange)characterRangeFromTextKitRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICTextView *)self beginningOfDocument];
  id v6 = [v4 start];
  uint64_t v7 = [(ICTextView *)self offsetFromPosition:v5 toPosition:v6];

  id v8 = [v4 start];
  id v9 = [v4 end];

  uint64_t v10 = [(ICTextView *)self offsetFromPosition:v8 toPosition:v9];
  NSUInteger v11 = v7;
  NSUInteger v12 = v10;
  result.length = v12;
  result.id location = v11;
  return result;
}

- (id)tableAttachmentViewControllerForRange:(_NSRange)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a3.location, a3.length);
  v15[0] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  NSUInteger v12 = __Block_byref_object_copy__6;
  double v13 = __Block_byref_object_dispose__6;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__ICTextView_tableAttachmentViewControllerForRange___block_invoke;
  v8[3] = &unk_2640B9A70;
  v8[4] = &v9;
  [(ICBaseTextView *)self ic_enumerateTableAttachmentViewControllersInRanges:v5 usingBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __52__ICTextView_tableAttachmentViewControllerForRange___block_invoke(uint64_t a1, void *a2)
{
}

- (id)selectedText
{
  id v3 = [(ICTextView *)self textStorage];
  id v4 = objc_msgSend(v3, "attribute:atIndex:effectiveRange:", *MEMORY[0x263F814A0], -[ICTextView selectedRange](self, "selectedRange"), 0);

  objc_opt_class();
  uint64_t v5 = ICDynamicCast();
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 attachment];
    id v8 = [v7 altText];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    id v8 = [(ICTextView *)&v10 selectedText];
  }

  return v8;
}

- (void)didEndTextSearchOperation
{
  id v2 = [(ICBaseTextView *)self editorController];
  [v2 showOrHideSearchPatternHighlightsIfNecessary];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBaseTextView *)self tapGestureRecognizer];
  if (v5 == v4)
  {
    id v6 = [(ICBaseTextView *)self editorController];
    char v7 = [v6 ignoresTaps];

    if (v7) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v12.receiver = self;
  v12.super_class = (Class)ICTextView;
  if (![(ICBaseTextView *)&v12 gestureRecognizerShouldBegin:v4])
  {
    BOOL v9 = 0;
    goto LABEL_9;
  }
  id v8 = [(ICBaseTextView *)self tapGestureRecognizer];

  if (v8 == v4)
  {
    objc_super v10 = [(ICTextView *)self attachmentViewTappedByGesture:v4];
    BOOL v9 = v10 == 0;

    goto LABEL_9;
  }
LABEL_6:
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

- (void)startEditingForTapGesture:(id)a3
{
  [a3 locationOfTouch:0 inView:self];
  uint64_t v4 = -[ICTextView closestPositionToPoint:](self, "closestPositionToPoint:");
  id v7 = (id)v4;
  if (v4)
  {
    id v5 = [(ICTextView *)self textRangeFromPosition:v4 toPosition:v4];
    if (v5) {
      [(ICTextView *)self setSelectedTextRange:v5];
    }
  }
  id v6 = [(ICBaseTextView *)self editorController];
  [v6 startEditing];
}

- (void)willPresentWritingTools
{
  v3.receiver = self;
  v3.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v3 willPresentWritingTools];
  [(ICTextView *)self setInputAccessoryViewVisible:0];
}

- (void)didDismissWritingTools
{
  [(ICTextView *)self setInputAccessoryViewVisible:1];
  v3.receiver = self;
  v3.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v3 didDismissWritingTools];
}

- (void)writingToolsCoordinator:(id)a3 willChangeToState:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 state] == 3)
  {
    objc_super v10 = [(ICBaseTextView *)self TTTextStorage];
    [v10 breakUndoCoalescing];
  }
  v11.receiver = self;
  v11.super_class = (Class)ICTextView;
  [(ICTextView *)&v11 writingToolsCoordinator:v8 willChangeToState:a4 completion:v9];
}

- (void)writingToolsCoordinator:(id)a3 replaceRange:(_NSRange)a4 inContext:(id)a5 proposedText:(id)a6 reason:(int64_t)a7 animationParameters:(id)a8 completion:(id)a9
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v16 = a9;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  BOOL v21 = [(ICTextView *)self note];
  [v21 updateModificationDateAndChangeCountAndSaveAfterDelay];

  v22.receiver = self;
  v22.super_class = (Class)ICTextView;
  -[ICTextView writingToolsCoordinator:replaceRange:inContext:proposedText:reason:animationParameters:completion:](&v22, sel_writingToolsCoordinator_replaceRange_inContext_proposedText_reason_animationParameters_completion_, v20, location, length, v19, v18, a7, v17, v16);
}

- (void)keyboardDidBeginDictation:(id)a3
{
  uint64_t v4 = [(ICTextView *)self TTTextStorageOptional];
  [v4 setIsPausingUndoActions:1];

  [(ICTextView *)self setInputAccessoryViewVisible:0];
}

- (void)dictationControllerDidPause:(id)a3
{
  uint64_t v4 = [(ICTextView *)self TTTextStorageOptional];
  [v4 setIsPausingUndoActions:0];

  id v5 = [(ICTextView *)self TTTextStorageOptional];
  [v5 breakUndoCoalescing];
}

- (void)dictationControllerDidResume:(id)a3
{
  id v3 = [(ICTextView *)self TTTextStorageOptional];
  [v3 setIsPausingUndoActions:1];
}

- (void)dictationControllerDidFinish:(id)a3
{
  uint64_t v4 = [(ICTextView *)self TTTextStorageOptional];
  [v4 setIsPausingUndoActions:0];

  [(ICTextView *)self setInputAccessoryViewVisible:1];
}

- (void)userTitleHiddenStateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTextView *)self userTitleView];

  if (v5 == v4)
  {
    [(ICTextView *)self updateOverscrollItemFrames];
  }
}

- (BOOL)showCompatibilityBannerWithParentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTextView *)self compatibilityBannerView];

  if (!v5)
  {
    id v6 = [ICNoteEditorCompatibilityBannerView alloc];
    id v7 = -[ICNoteEditorCompatibilityBannerView initWithFrame:parentViewController:](v6, "initWithFrame:parentViewController:", v4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(ICTextView *)self setCompatibilityBannerView:v7];

    id v8 = [(ICTextView *)self compatibilityBannerView];
    [v8 setAutoresizingMask:5];

    id v9 = [(ICTextView *)self compatibilityBannerView];
    [(ICTextView *)self addSubview:v9];
  }
  return v5 == 0;
}

- (BOOL)shouldUpdateVisibleSupplementalViewsInLayoutSubviews
{
  if ([(ICTextView *)self isScrolling]
    || ([(ICTextView *)self _isAnimatingScrollTest] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return [(ICTextView *)self _freezeTextContainerSize] ^ 1;
  }
}

- (void)hideOverlappingAttachmentViewsIfNecessary
{
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    if ([(ICTextView *)self needsHideOverlappingAttachmentViews])
    {
      objc_opt_class();
      id v3 = [(ICTextView *)self layoutManager];
      id v4 = ICDynamicCast();

      [(ICTextView *)self bounds];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v13 = [(ICTextView *)self textContainer];
      uint64_t v14 = objc_msgSend(v4, "glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:", v13, v6, v8, v10, v12);
      uint64_t v16 = v15;

      uint64_t v17 = objc_msgSend(v4, "characterRangeForGlyphRange:actualGlyphRange:", v14, v16, 0);
      uint64_t v19 = v18;
      uint64_t v20 = v17 + v18;
      BOOL v21 = [(ICTextView *)self textStorage];
      uint64_t v22 = [v21 length] - v20;

      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __55__ICTextView_hideOverlappingAttachmentViewsIfNecessary__block_invoke;
      aBlock[3] = &unk_2640B9AE8;
      uint64_t v30 = v17;
      uint64_t v31 = v19;
      id v29 = v4;
      id v23 = v4;
      objc_super v24 = _Block_copy(aBlock);
      uint64_t v25 = [(ICTextView *)self textStorage];
      uint64_t v26 = *MEMORY[0x263F814A0];
      objc_msgSend(v25, "enumerateAttribute:inRange:options:usingBlock:", *MEMORY[0x263F814A0], 0, v17, 0x100000, v24);

      id v27 = [(ICTextView *)self textStorage];
      objc_msgSend(v27, "enumerateAttribute:inRange:options:usingBlock:", v26, v20, v22, 0x100000, v24);

      [(ICTextView *)self setNeedsHideOverlappingAttachmentViews:0];
    }
  }
}

void __55__ICTextView_hideOverlappingAttachmentViewsIfNecessary__block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7 = a2;
  if (v7)
  {
    id v15 = v7;
    v17.NSUInteger location = a3;
    v17.NSUInteger length = a4;
    NSUInteger length = NSIntersectionRange(*(NSRange *)(a1 + 40), v17).length;
    id v7 = v15;
    if (!length)
    {
      objc_opt_class();
      double v9 = ICDynamicCast();
      double v10 = [*(id *)(a1 + 32) viewProviderForTextAttachment:v9 characterIndex:a3];
      double v11 = [v10 view];
      if (!v11)
      {
        double v11 = [*(id *)(a1 + 32) viewForTextAttachmentNoCreate:v9];
      }
      uint64_t v12 = [v11 window];
      if (v12)
      {
        double v13 = (void *)v12;
        char v14 = [v11 isHidden];

        if ((v14 & 1) == 0)
        {
          [MEMORY[0x263F158F8] begin];
          [MEMORY[0x263F158F8] setDisableActions:1];
          [v11 setHidden:1];
          [MEMORY[0x263F158F8] commit];
        }
      }

      id v7 = v15;
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  v13.receiver = self;
  v13.super_class = (Class)ICTextView;
  unsigned int v3 = [(ICBaseTextView *)&v13 canBecomeFirstResponder];
  id v4 = [(ICBaseTextView *)self editorController];
  double v5 = [v4 presentedViewController];

  uint64_t v6 = [v5 modalPresentationStyle];
  if (v3 && (uint64_t v7 = v6, ![(ICTextView *)self shouldAvoidBecomingFirstResponder]))
  {
    double v9 = [(ICBaseTextView *)self editorController];
    double v10 = [v9 note];
    if (v10) {
      BOOL v11 = v7 == 5;
    }
    else {
      BOOL v11 = 1;
    }
    BOOL v8 = !v11;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)becomeFirstResponder
{
  if ([(ICTextView *)self shouldAvoidBecomingFirstResponder])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    self->_isBecomingFirstResponder = 1;
    id v4 = [MEMORY[0x263F5ABC0] sharedState];
    [v4 extendDeauthenticationTimer];

    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    BOOL v3 = [(ICBaseTextView *)&v10 becomeFirstResponder];
    double v5 = [(ICBaseTextView *)self editorController];
    uint64_t v6 = [v5 viewControllerManager];

    uint64_t v7 = [(ICTextView *)self traitCollection];
    if (objc_msgSend(v7, "ic_hasCompactSize"))
    {
      if ([v6 isPrimaryContentVisible]) {
        char v8 = 1;
      }
      else {
        char v8 = [v6 isSupplementaryContentVisible];
      }
    }
    else
    {
      char v8 = 0;
    }

    if (([(ICTextView *)self isSelectable] & 1) == 0 && v3 && (v8 & 1) == 0) {
      [(ICTextView *)self setEditable:1];
    }
    [(ICBaseTextView *)self icaxClearCaches];
    self->_isBecomingFirstResponder = 0;
  }
  return v3;
}

uint64_t __34__ICTextView_resignFirstResponder__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) icaxUpdateLinkRanges];
}

- (id)_nextKeyResponder
{
  BOOL v3 = [(ICTextView *)self nextResponderOverride];

  if (v3)
  {
    id v4 = [(ICTextView *)self nextResponderOverride];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)selectionSupportsFindInNote
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  BOOL v3 = [(ICTextView *)self textStorage];
  uint64_t v4 = [(ICTextView *)self selectedRange];
  uint64_t v5 = *MEMORY[0x263F814A0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__ICTextView_selectionSupportsFindInNote__block_invoke;
  v10[3] = &unk_2640B9B10;
  v10[4] = &v11;
  v10[5] = &v15;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, v4, v6, 0, v10);

  if (*((unsigned char *)v12 + 24))
  {
    BOOL v7 = 1;
  }
  else if (*((unsigned char *)v16 + 24))
  {
    [(ICTextView *)self selectedRange];
    BOOL v7 = v8 == 1;
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v7;
}

uint64_t __41__ICTextView_selectionSupportsFindInNote__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a5 = 1;
    }
  }

  return MEMORY[0x270F9A758]();
}

- (id)singleSelectedAttachment
{
  uint64_t v3 = [(ICTextView *)self selectedRange];
  id v5 = 0;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL && v4 == 1)
  {
    uint64_t v6 = v3;
    BOOL v7 = [(ICTextView *)self textStorage];
    uint64_t v8 = [v7 attribute:*MEMORY[0x263F814A0] atIndex:v6 effectiveRange:0];

    objc_opt_class();
    id v5 = 0;
    if (objc_opt_isKindOfClass()) {
      id v5 = v8;
    }
  }

  return v5;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(ICTextView *)self nextResponderOverride];

  if (!v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)ICTextView;
    uint64_t v11 = [(ICTextView *)&v16 targetForAction:a3 withSender:self];
    uint64_t v12 = [(ICTextView *)self singleSelectedAttachment];
    if (v12)
    {
      if (ICInternalSettingsIsTextKit2Enabled())
      {
        uint64_t v13 = [(ICBaseTextView *)self icTextLayoutManager];
        char v14 = [v12 viewIdentifier];
        id v10 = [v13 existingAttachmentViewForIdentifier:v14];
      }
      else
      {
        uint64_t v13 = [(ICBaseTextView *)self icLayoutManager];
        id v10 = [v13 viewForTextAttachment:v12];
      }

      if (v10
        && [v10 canPerformAction:a3 withSender:v6]
        && ![v11 canPerformAction:a3 withSender:v6])
      {
        goto LABEL_14;
      }
    }
    id v10 = v11;
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v8 = [(ICTextView *)self nextResponderOverride];
  int v9 = [v8 canPerformAction:a3 withSender:v6];

  if (v9)
  {
    id v10 = [(ICTextView *)self nextResponderOverride];
  }
  else
  {
    id v10 = 0;
  }
LABEL_15:

  return v10;
}

- (void)resetContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(ICTextView *)self disableContentOffsetChanges];
  [(ICTextView *)self setDisableContentOffsetChanges:1];
  v7.receiver = self;
  v7.super_class = (Class)ICTextView;
  -[ICTextView setContentOffset:](&v7, sel_setContentOffset_, x, y);
  [(ICTextView *)self setDisableContentOffsetChanges:v6];
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v9 = [(ICBaseTextView *)self editorController];
  if ([v9 isPreviewingAttachmentFromNote])
  {
  }
  else
  {
    char v8 = [(ICTextView *)self isDragging];

    if ((v8 & 1) == 0)
    {
      v10.receiver = self;
      v10.super_class = (Class)ICTextView;
      -[ICTextView setContentOffset:animated:](&v10, sel_setContentOffset_animated_, v4, x, y);
    }
  }
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    if ([(ICTextView *)self isFirstResponder])
    {
      uint64_t v10 = [(ICTextView *)self selectedRange];
      uint64_t v11 = [(ICTextView *)self textStorage];
      uint64_t v12 = [v11 length];

      if (v10 == v12)
      {
        uint64_t v13 = [(ICTextView *)self layoutManager];
        [v13 extraLineFragmentRect];
        rect.origin.double x = v14;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        [(ICTextView *)self textContainerInset];
        CGFloat v22 = v21;
        [(ICTextView *)self textContainerInset];
        CGFloat v24 = v23;
        v30.origin.double x = rect.origin.x;
        v30.origin.double y = v16;
        v30.size.double width = v18;
        v30.size.double height = v20;
        CGRect v31 = CGRectOffset(v30, v22, v24);
        double v25 = v31.origin.x;
        double v26 = v31.origin.y;
        double v27 = v31.size.width;
        double v28 = v31.size.height;

        v32.origin.double x = x;
        v32.origin.double y = y;
        v32.size.double width = width;
        v32.size.double height = height;
        v33.origin.double x = v25;
        v33.origin.double y = v26;
        v33.size.double width = v27;
        v33.size.double height = v28;
        if (CGRectContainsRect(v32, v33))
        {
          double x = v25;
          double y = v26;
          double width = v27;
          double height = v28;
        }
      }
    }
  }
  *(void *)&rect.origin.double y = self;
  *(void *)&rect.size.double width = ICTextView;
  -[CGFloat scrollRectToVisible:animated:]((objc_super *)&rect.origin.y, sel_scrollRectToVisible_animated_, v4, x, y, width, height);
}

- (void)setEmbeddedScrollViews:(id)a3
{
  BOOL v4 = (NSSet *)[a3 copy];
  embeddedScrollViews = self->_embeddedScrollViews;
  self->_embeddedScrollViews = v4;

  CGPoint v6 = (CGPoint)*MEMORY[0x263F00148];
  self->_lastProposedContentOffset = (CGPoint)*MEMORY[0x263F00148];
  self->_distanceConsumedByEmbeddedScrollViews = v6;
}

id __31__ICTextView_setContentOffset___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ICTextView;
  return objc_msgSendSuper2(&v2, sel_setContentOffset_, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __32__ICTextView__updateContentSize__block_invoke_2(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) editorController];
  uint64_t v3 = [v2 visibleRange];
  uint64_t v5 = v4;

  int IsTextKit2Enabled = ICInternalSettingsIsTextKit2Enabled();
  objc_super v7 = *(void **)(a1 + 32);
  if (IsTextKit2Enabled)
  {
    char v8 = [v7 textLayoutManager];
    objc_msgSend(v8, "ic_textRangeForRange:", v3, v5);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    id v9 = [*(id *)(a1 + 32) textLayoutManager];
    [v9 invalidateLayoutForRange:v10];
  }
  else
  {
    id v10 = [v7 layoutManager];
    objc_msgSend(v10, "invalidateDisplayForCharacterRange:", v3, v5);
  }
}

- (double)maxYContentOffset
{
  [(ICTextView *)self contentSize];
  double v4 = v3;
  [(ICTextView *)self bounds];
  double v6 = v5;
  [(ICTextView *)self contentInset];
  return v4 - (v6 - v7);
}

- (CGPoint)clippedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  [(ICTextView *)self contentInset];
  double v7 = -v6;
  [(ICTextView *)self maxYContentOffset];
  if (v8 >= v7) {
    double v9 = v8;
  }
  else {
    double v9 = v7;
  }
  if (y <= v9)
  {
    if (y < v7) {
      double v9 = v7;
    }
    else {
      double v9 = y;
    }
  }
  double v10 = x;
  result.double y = v9;
  result.CGFloat x = v10;
  return result;
}

- (void)setClippedContentOffset:(CGPoint)a3
{
  -[ICTextView clippedContentOffset:](self, "clippedContentOffset:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  [(ICTextView *)self contentOffset];
  if (v5 != v9 || v7 != v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)ICTextView;
    -[ICTextView setContentOffset:](&v11, sel_setContentOffset_, v5, v7);
  }
}

- (void)select:(id)a3
{
  id v4 = a3;
  if ([(ICTextView *)self selectedRange] == 0) {
    goto LABEL_5;
  }
  objc_opt_class();
  double v5 = [(ICTextView *)self textStorage];
  double v6 = ICDynamicCast();

  uint64_t v7 = [(ICTextView *)self selectedRange];
  uint64_t v8 = [v6 attribute:*MEMORY[0x263F814A0] atIndex:v7 - 1 effectiveRange:0];
  if (!v8)
  {

LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    [(ICBaseTextView *)&v10 select:v4];
    goto LABEL_6;
  }
  double v9 = (void *)v8;
  -[ICTextView setSelectedRange:](self, "setSelectedRange:", [(ICTextView *)self selectedRange] - 1, 1);

LABEL_6:
}

- (void)resetUndoManager
{
  id v2 = [(ICBaseTextView *)self TTTextStorage];
  [v2 resetUndoManager];
}

- (void)undoManagerDidOpenUndoGroup:(id)a3
{
  id v6 = [(ICBaseTextView *)self TTTextStorage];
  if ([v6 isPausingUndoActions])
  {
    id v4 = [(ICTextView *)self undoManager];
    uint64_t v5 = [v4 groupingLevel];

    if (v5 < 2) {
      return;
    }
    id v6 = [(ICBaseTextView *)self TTTextStorage];
    [v6 breakUndoCoalescing];
  }
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  id v8 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    v16.receiver = self;
    v16.super_class = (Class)ICTextView;
    double v9 = [(ICTextView *)&v16 positionFromPosition:v8 inDirection:a4 offset:a5];
  }
  else
  {
    objc_opt_class();
    objc_super v10 = [(ICTextView *)self layoutManager];
    objc_super v11 = ICDynamicCast();
    [v11 setLineHeightIncludeParagraphSpacing:1];

    v15.receiver = self;
    v15.super_class = (Class)ICTextView;
    double v9 = [(ICTextView *)&v15 positionFromPosition:v8 inDirection:a4 offset:a5];
    objc_opt_class();
    uint64_t v12 = [(ICTextView *)self layoutManager];
    uint64_t v13 = ICDynamicCast();
    [v13 setLineHeightIncludeParagraphSpacing:0];
  }

  return v9;
}

- (CGRect)caretRectForPosition:(id)a3
{
  v34.receiver = self;
  v34.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v34 caretRectForPosition:a3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([(ICBaseTextView *)self isDraggingChecklistItem]
    && [(ICBaseTextView *)self isDraggingOverChecklistItem])
  {
    uint64_t v12 = [(ICBaseTextView *)self trackedParagraphCurrentlyUnderDraggedChecklist];
    +[ICChecklistDragUtilities insertionRectForTrackedTodoParagraph:v12 drawAbove:[(ICBaseTextView *)self shouldDropChecklistAbove] inTextView:self];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    CGRect v39 = *(CGRect *)*(void *)&MEMORY[0x263F001A8];
    v35.origin.CGFloat x = v14;
    v35.origin.CGFloat y = v16;
    v35.size.CGFloat width = v18;
    v35.size.CGFloat height = v20;
    CGFloat y = v39.origin.y;
    CGFloat v33 = *MEMORY[0x263F001A8];
    CGFloat height = v39.size.height;
    CGFloat width = v39.size.width;
    if (!CGRectEqualToRect(v35, *MEMORY[0x263F001A8]))
    {
      [(ICTextView *)self lastDragInsertionRect];
      v40.origin.CGFloat x = v21;
      v40.origin.CGFloat y = v22;
      v40.size.CGFloat width = v23;
      v40.size.CGFloat height = v24;
      v36.origin.CGFloat x = v14;
      v36.origin.CGFloat y = v16;
      v36.size.CGFloat width = v18;
      v36.size.CGFloat height = v20;
      if (!CGRectEqualToRect(v36, v40))
      {
        double v25 = [(ICBaseTextView *)self checklistDragFeedbackGenerator];
        [v25 selectionChanged];

        double v11 = v20;
        double v9 = v18;
        double v7 = v16;
        double v5 = v14;
      }
    }
    v37.origin.CGFloat x = v14;
    v37.origin.CGFloat y = v16;
    v37.size.CGFloat width = v18;
    v37.size.CGFloat height = v20;
    v41.origin.CGFloat y = y;
    v41.origin.CGFloat x = v33;
    v41.size.CGFloat height = height;
    v41.size.CGFloat width = width;
    if (!CGRectEqualToRect(v37, v41))
    {
      double v11 = v20;
      double v9 = v18;
      double v7 = v16;
      double v5 = v14;
    }
  }
  -[ICTextView setLastDragInsertionRect:](self, "setLastDragInsertionRect:", v5, v7, v9, v11, *(void *)&height, *(void *)&width, *(void *)&y, *(void *)&v33);
  double v26 = v5;
  double v27 = v7;
  double v28 = v9;
  double v29 = v11;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (BOOL)attachmentViewUnderTouches:(id)a3
{
  id v4 = a3;
  if (attachmentViewUnderTouches__onceToken != -1) {
    dispatch_once(&attachmentViewUnderTouches__onceToken, &__block_literal_global_6);
  }
  if (attachmentViewUnderTouches__supportsForceTouch
    && [v4 count]
    && ([v4 anyObject],
        double v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 type],
        v5,
        !v6))
  {
    double v9 = [v4 anyObject];
    [v9 locationInView:self];
    double v11 = v10;
    double v13 = v12;

    CGFloat v14 = -[ICTextView textAttachmentAtPoint:](self, "textAttachmentAtPoint:", v11, v13);
    BOOL v7 = v14 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __41__ICTextView_attachmentViewUnderTouches___block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  attachmentViewUnderTouches__supportsForceTouch = result;
  return result;
}

- (BOOL)isSearchResultView:(id)a3
{
  id v4 = a3;
  if ([(ICTextView *)self containsView:v4])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v4 superview],
          double v5 = (ICTextView *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5 == self))
    {
      BOOL v8 = 1;
    }
    else
    {
      uint64_t v6 = (ICTextView *)v4;
      BOOL v7 = v6;
      BOOL v8 = 0;
      if (v6 && v6 != self)
      {
        while (1)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v9 = [(ICTextView *)v7 superview];

            if (v9 == self) {
              break;
            }
          }
          double v10 = [(ICTextView *)v7 superview];

          BOOL v8 = 0;
          if (v10)
          {
            BOOL v7 = v10;
            if (v10 != self) {
              continue;
            }
          }
          goto LABEL_15;
        }
        BOOL v8 = 1;
      }
      double v10 = v7;
LABEL_15:
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICTextView;
  BOOL v8 = -[ICBaseTextView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
  if ([(ICTextView *)self isSearchResultView:v8])
  {
    double v9 = [(ICTextView *)self containerViewForAttachments];
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    double v11 = v10;
    double v13 = v12;

    CGFloat v14 = [(ICTextView *)self containerViewForAttachments];
    objc_msgSend(v14, "hitTest:withEvent:", v7, v11, v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = v8;
  }

  return v15;
}

- (id)textAttachmentAtPoint:(CGPoint)a3
{
  id v4 = -[ICTextView characterRangeAtPoint:](self, "characterRangeAtPoint:", a3.x, a3.y);
  double v5 = [v4 start];
  if (v5)
  {
    uint64_t v6 = [(ICTextView *)self beginningOfDocument];
    double v7 = (double)[(ICTextView *)self offsetFromPosition:v6 toPosition:v5];

    BOOL v8 = [(ICTextView *)self textStorage];
    double v9 = [v8 attribute:*MEMORY[0x263F814A0] atIndex:(unint64_t)v7 effectiveRange:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  double v9 = 0;
LABEL_5:

  return v9;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICTextView *)self setTouchesCurrentlyOnAttachmentView:[(ICTextView *)self attachmentViewUnderTouches:v7]];
  BOOL v8 = [(ICBaseTextView *)self editorController];
  double v9 = [v8 textController];
  double v10 = [v9 authorHighlightsController];
  [v10 setAllowsAnimations:0];

  v11.receiver = self;
  v11.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v11 touchesBegan:v7 withEvent:v6];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICTextView *)self setTouchesCurrentlyOnAttachmentView:[(ICTextView *)self attachmentViewUnderTouches:v7]];
  v8.receiver = self;
  v8.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v8 touchesMoved:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v8 touchesEnded:a3 withEvent:a4];
  [(ICTextView *)self setTouchesCurrentlyOnAttachmentView:0];
  double v5 = [(ICBaseTextView *)self editorController];
  id v6 = [v5 textController];
  id v7 = [v6 authorHighlightsController];
  [v7 setAllowsAnimations:1];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v8 touchesCancelled:a3 withEvent:a4];
  [(ICTextView *)self setTouchesCurrentlyOnAttachmentView:0];
  double v5 = [(ICBaseTextView *)self editorController];
  id v6 = [v5 textController];
  id v7 = [v6 authorHighlightsController];
  [v7 setAllowsAnimations:1];
}

- (BOOL)isPreviewing
{
  if ([(ICTextView *)self touchesCurrentlyOnAttachmentView])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v3 = [MEMORY[0x263F82D60] instancesRespondToSelector:sel_isPreviewing];
    if (v3)
    {
      v5.receiver = self;
      v5.super_class = (Class)ICTextView;
      LOBYTE(v3) = [(ICBaseTextView *)&v5 isPreviewing];
    }
  }
  return v3;
}

- (id)_targetedPreviewForTextInteractableItem:(id)a3 dismissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    id v7 = [(ICBaseTextView *)self icLayoutManager];
    [v7 setShouldIgnoreCachedOriginUpdates:1];
  }
  v11.receiver = self;
  v11.super_class = (Class)ICTextView;
  objc_super v8 = [(ICTextView *)&v11 _targetedPreviewForTextInteractableItem:v6 dismissing:v4];
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    double v9 = [(ICBaseTextView *)self icLayoutManager];
    [v9 setShouldIgnoreCachedOriginUpdates:0];
  }

  return v8;
}

- (_NSRange)selectedRange
{
  v13.receiver = self;
  v13.super_class = (Class)ICTextView;
  int v3 = (char *)[(ICTextView *)&v13 selectedRange];
  NSUInteger v5 = v4;
  id v6 = &v3[v4];
  id v7 = [(ICTextView *)self textStorage];
  unint64_t v8 = [v7 length];

  if (v5) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = (unint64_t)v6 > v8;
  }
  if (v9)
  {
    double v10 = [(ICTextView *)self textStorage];
    int v3 = (char *)[v10 length];

    NSUInteger v5 = 0;
  }
  NSUInteger v11 = (NSUInteger)v3;
  NSUInteger v12 = v5;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (void)setSelectedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(ICBaseTextView *)self editorController];
  char v7 = [v6 isPreviewingAttachmentFromNote];

  if ((v7 & 1) == 0)
  {
    objc_opt_class();
    unint64_t v8 = [(ICTextView *)self textStorage];
    BOOL v9 = ICDynamicCast();

    if (([v9 isFixing] & 1) == 0) {
      [(ICBaseTextView *)self endHeadingRenameCommittingMarkedText:1];
    }
    [v9 setIsSelectingText:1];
    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    -[ICTextView setSelectedRange:](&v10, sel_setSelectedRange_, location, length);
    [v9 setIsSelectingText:0];
  }
}

- (void)setSelectedTextRange:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(ICBaseTextView *)self editorController];
  char v6 = [v5 isPreviewingAttachmentFromNote];

  if ((v6 & 1) == 0)
  {
    objc_opt_class();
    char v7 = [(ICTextView *)self textStorage];
    unint64_t v8 = ICDynamicCast();

    if (([v8 isFixing] & 1) == 0) {
      [(ICBaseTextView *)self endHeadingRenameCommittingMarkedText:1];
    }
    [v8 setIsSelectingText:1];
    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    [(ICTextView *)&v10 setSelectedTextRange:v4];
    [v8 setHasEditedCharactersAfterTextSelection:0];
    [v8 breakUndoCoalescing];
    [v8 setIsSelectingText:0];
    BOOL v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 postNotificationName:@"ICTextViewSelectedTextRangeDidChangeNotification" object:self];
  }
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4 = (ICTextView *)a3;
  NSUInteger v5 = v4;
  char v6 = v4;
  if (!v4 || (char v6 = v4, v4 == self))
  {
LABEL_7:
    v10.receiver = self;
    v10.super_class = (Class)ICTextView;
    unsigned __int8 v8 = [(ICTextView *)&v10 touchesShouldCancelInContentView:v5];
    char v7 = v6;
  }
  else
  {
    char v7 = v4;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      char v6 = [(ICTextView *)v7 superview];

      if (v6)
      {
        char v7 = v6;
        if (v6 != self) {
          continue;
        }
      }
      goto LABEL_7;
    }
    unsigned __int8 v8 = [(ICTextView *)v7 scrollViewShouldCancelTouchesForThisView];
  }

  return v8;
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  char v7 = [(ICTextView *)self textStorage];
  unsigned __int8 v8 = ICDynamicCast();
  [v8 setIsResettingBaseWritingDirection:1];

  v11.receiver = self;
  v11.super_class = (Class)ICTextView;
  [(ICTextView *)&v11 setBaseWritingDirection:a3 forRange:v6];

  objc_opt_class();
  BOOL v9 = [(ICTextView *)self textStorage];
  objc_super v10 = ICDynamicCast();
  [v10 setIsResettingBaseWritingDirection:0];
}

- (void)scrollRangeToVisible:(_NSRange)a3 consideringInsets:(BOOL)a4 animated:(BOOL)a5 inSearchableString:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v18 = a6;
  objc_super v11 = [(ICBaseTextView *)self editorController];
  NSUInteger v12 = [v11 note];
  uint64_t v13 = objc_msgSend(v12, "textRangeForSearchRange:inSearchableString:", location, length, v18);
  uint64_t v15 = v14;

  if (v15) {
    -[ICTextView ic_scrollRangeToVisible:consideringInsets:animated:](self, "ic_scrollRangeToVisible:consideringInsets:animated:", v13, v15, v7, v6);
  }
  CGFloat v16 = [v18 attribute:*MEMORY[0x263F5ADA0] atIndex:location effectiveRange:0];
  if (v16)
  {
    objc_super v17 = [(ICTextView *)self findableForAttachment:v16];
    objc_msgSend(v17, "scrollToRange:inFindableString:", location, length, v18);
  }
}

- (id)findableForAttachment:(id)a3
{
  id v4 = [MEMORY[0x263F5B200] textAttachmentWithBaseAttachment:a3];
  NSUInteger v5 = v4;
  if (!v4)
  {
    BOOL v9 = 0;
    goto LABEL_12;
  }
  if (([v4 containsFindableText] & 1) == 0) {
    [MEMORY[0x263F5AE60] handleFailedAssertWithCondition:"textAttachment.containsFindableText" functionName:"-[ICTextView findableForAttachment:]" simulateCrash:1 showAlert:0 format:@"Text attachment must contain findable text"];
  }
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    BOOL v6 = ICCheckedDynamicCast();
    if (!v6)
    {
      BOOL v9 = 0;
      goto LABEL_11;
    }
    BOOL v7 = [(ICBaseTextView *)self icTextLayoutManager];
    unsigned __int8 v8 = [v7 tableViewControllerForAttachment:v6 createIfNeeded:1];

    ICProtocolCast();
    BOOL v9 = 0;
  }
  else
  {
    objc_opt_class();
    objc_super v10 = [(ICTextView *)self textContainer];
    objc_super v11 = [v10 layoutManager];
    BOOL v6 = ICCheckedDynamicCast();

    unsigned __int8 v8 = [v6 viewControllerForTextAttachment:v5];
    BOOL v9 = ICProtocolCast();
  }

LABEL_11:
LABEL_12:

  return v9;
}

- (void)setInputAccessoryViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  NSUInteger v5 = [(ICTextView *)self inputAccessoryView];
  ICDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v3) {
    [v6 showWithDelay:0.0];
  }
  else {
    [v6 hide];
  }
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v9 makeTextWritingDirectionLeftToRight:v4];
  NSUInteger v5 = [(ICTextView *)self ic_selectedRanges];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__ICTextView_makeTextWritingDirectionLeftToRight___block_invoke;
  v7[3] = &unk_2640B9B38;
  id v8 = v4;
  id v6 = v4;
  [(ICBaseTextView *)self ic_enumerateTableAttachmentViewControllersInRanges:v5 usingBlock:v7];
}

uint64_t __50__ICTextView_makeTextWritingDirectionLeftToRight___block_invoke(uint64_t a1, void *a2)
{
  return [a2 makeTextWritingDirectionLeftToRight:*(void *)(a1 + 32)];
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v9 makeTextWritingDirectionRightToLeft:v4];
  NSUInteger v5 = [(ICTextView *)self ic_selectedRanges];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__ICTextView_makeTextWritingDirectionRightToLeft___block_invoke;
  v7[3] = &unk_2640B9B38;
  id v8 = v4;
  id v6 = v4;
  [(ICBaseTextView *)self ic_enumerateTableAttachmentViewControllersInRanges:v5 usingBlock:v7];
}

uint64_t __50__ICTextView_makeTextWritingDirectionRightToLeft___block_invoke(uint64_t a1, void *a2)
{
  return [a2 makeTextWritingDirectionRightToLeft:*(void *)(a1 + 32)];
}

- (void)toggleBoldface:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v9 toggleBoldface:v4];
  NSUInteger v5 = [(ICTextView *)self ic_selectedRanges];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__ICTextView_toggleBoldface___block_invoke;
  v7[3] = &unk_2640B9B38;
  id v8 = v4;
  id v6 = v4;
  [(ICBaseTextView *)self ic_enumerateTableAttachmentViewControllersInRanges:v5 usingBlock:v7];
}

uint64_t __29__ICTextView_toggleBoldface___block_invoke(uint64_t a1, void *a2)
{
  return [a2 toggleBoldface:*(void *)(a1 + 32)];
}

- (void)toggleItalics:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v9 toggleItalics:v4];
  NSUInteger v5 = [(ICTextView *)self ic_selectedRanges];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__ICTextView_toggleItalics___block_invoke;
  v7[3] = &unk_2640B9B38;
  id v8 = v4;
  id v6 = v4;
  [(ICBaseTextView *)self ic_enumerateTableAttachmentViewControllersInRanges:v5 usingBlock:v7];
}

uint64_t __28__ICTextView_toggleItalics___block_invoke(uint64_t a1, void *a2)
{
  return [a2 toggleItalics:*(void *)(a1 + 32)];
}

- (void)toggleUnderline:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v9 toggleUnderline:v4];
  NSUInteger v5 = [(ICTextView *)self ic_selectedRanges];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__ICTextView_toggleUnderline___block_invoke;
  v7[3] = &unk_2640B9B38;
  id v8 = v4;
  id v6 = v4;
  [(ICBaseTextView *)self ic_enumerateTableAttachmentViewControllersInRanges:v5 usingBlock:v7];
}

uint64_t __30__ICTextView_toggleUnderline___block_invoke(uint64_t a1, void *a2)
{
  return [a2 toggleUnderline:*(void *)(a1 + 32)];
}

- (void)toggleStrikethrough
{
  v5.receiver = self;
  v5.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v5 toggleStrikethrough];
  BOOL v3 = [(ICTextView *)self ic_selectedRanges];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__ICTextView_toggleStrikethrough__block_invoke;
  v4[3] = &unk_2640B9B38;
  v4[4] = self;
  [(ICBaseTextView *)self ic_enumerateTableAttachmentViewControllersInRanges:v3 usingBlock:v4];
}

uint64_t __33__ICTextView_toggleStrikethrough__block_invoke(uint64_t a1, void *a2)
{
  return [a2 toggleStrikethrough:*(void *)(a1 + 32)];
}

- (void)updateTextViewForDidChange
{
  if ([(ICTextView *)self isSettingStyleWithStyleUI])
  {
    BOOL v3 = [(ICBaseTextView *)self typingAttributes];
    id v4 = (void *)MEMORY[0x263F5AB28];
    objc_super v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F5AB28]];

    if (v5)
    {
      id v6 = [(ICBaseTextView *)self internalTypingAttributes];
      BOOL v7 = (void *)[v6 mutableCopy];

      [v7 setObject:v5 forKey:*v4];
      [(ICBaseTextView *)self setInternalTypingAttributes:v7];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)ICTextView;
  [(ICBaseTextView *)&v8 updateTextViewForDidChange];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(ICTextView *)self setIsInsertingTextFromKeyboardInput:1];
  v11.receiver = self;
  v11.super_class = (Class)ICTextView;
  LOBYTE(v5) = [(ICTextView *)&v11 keyboardInput:v9 shouldInsertText:v8 isMarkedText:v5];

  [(ICTextView *)self setIsInsertingTextFromKeyboardInput:0];
  return v5;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v47 = 0;
  BOOL v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 1;
  if ([MEMORY[0x263F828A0] isInHardwareKeyboardMode])
  {
    uint64_t v8 = [v7 _modifierFlags];
    id v9 = [v7 _unmodifiedInput];
    NSUInteger v10 = [(ICTextView *)self selectedRange];
    uint64_t v12 = v11;
    if ([v9 length])
    {
      int v13 = [v7 _isKeyDown];
      int v14 = v12 ? 0 : v13;
      if (v14 == 1)
      {
        uint64_t v15 = *MEMORY[0x263F83760];
        if ([v9 isEqualToString:*MEMORY[0x263F83760]])
        {
          if ((v8 & 0xFFFFFFFFFFF7FFFFLL) == 0) {
            goto LABEL_14;
          }
        }
        else
        {
          char v16 = [v9 isEqualToString:*MEMORY[0x263F83768]];
          if ((v8 & 0xFFFFFFFFFFF7FFFFLL) != 0) {
            char v17 = 0;
          }
          else {
            char v17 = v16;
          }
          if (v17)
          {
LABEL_14:
            id v18 = [(ICTextView *)self textStorage];
            double v19 = [v18 attributesAtIndex:v10 effectiveRange:0];

            CGFloat v20 = [v19 objectForKey:*MEMORY[0x263F81540]];
            CGFloat v21 = v20;
            if (v20)
            {
              uint64_t v22 = [v20 baseWritingDirection];
              int v23 = [v9 isEqualToString:v15];
              char v24 = v23;
              if (((v22 != 1) ^ v23))
              {
                double v25 = [(ICTextView *)self textStorage];
                unint64_t v26 = [v25 length];

                if (v10 >= v26) {
                  goto LABEL_27;
                }
LABEL_20:
                if (v10 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  double v27 = [(ICTextView *)self textStorage];
                  v52.NSUInteger length = [v27 length];
                  v51.NSUInteger location = v10;
                  v51.NSUInteger length = 1;
                  v52.NSUInteger location = 0;
                  NSUInteger length = NSIntersectionRange(v51, v52).length;

                  if (length != 1) {
                    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "NSIntersectionRange(testRange, NSMakeRange(0, self.textStorage.length)).length == 1", "-[ICTextView pressesBegan:withEvent:]", 1, 0, @"test range must be within bounds");
                  }
                  if (ICInternalSettingsIsTextKit2Enabled())
                  {
                    id v29 = [(ICBaseTextView *)self icTextLayoutManager];
                    v45[0] = MEMORY[0x263EF8330];
                    v45[1] = 3221225472;
                    v45[2] = __37__ICTextView_pressesBegan_withEvent___block_invoke;
                    v45[3] = &unk_2640B9B60;
                    char v46 = v24;
                    v45[4] = self;
                    v45[5] = &v47;
                    objc_msgSend(v29, "enumerateAttachmentViewsInRange:usingBlock:", v10, 1, v45);
                  }
                  else
                  {
                    objc_opt_class();
                    CGRect v30 = [(ICTextView *)self layoutManager];
                    CGRect v31 = ICDynamicCast();

                    v41[0] = MEMORY[0x263EF8330];
                    v41[1] = 3221225472;
                    v41[2] = __37__ICTextView_pressesBegan_withEvent___block_invoke_2;
                    v41[3] = &unk_2640B9B60;
                    id v29 = v31;
                    char v44 = v24;
                    id v42 = v29;
                    double v43 = &v47;
                    objc_msgSend(v29, "enumerateAttachmentViewsInRange:usingBlock:", v10, 1, v41);
                  }
                }
                goto LABEL_27;
              }
              if (v10)
              {
                --v10;
                goto LABEL_20;
              }
            }
LABEL_27:
          }
        }
      }
    }
    CGRect v32 = [(ICBaseTextView *)self editorController];
    CGFloat v33 = [v32 linkAcceleratorController];

    if (![v33 isShowing] || !objc_msgSend(v7, "_isKeyDown")) {
      goto LABEL_41;
    }
    *((unsigned char *)v48 + 24) = 0;
    int v34 = [v9 isEqualToString:*MEMORY[0x263F83758]];
    int v35 = [v9 isEqualToString:*MEMORY[0x263F83750]];
    int v36 = [v9 isEqualToString:*MEMORY[0x263F83770]];
    int v37 = [v9 isEqualToString:@"\r"];
    int v38 = [v9 isEqualToString:@"\t"];
    if (v34)
    {
      [v33 hideAccelerator];
LABEL_41:

      goto LABEL_42;
    }
    if (v35)
    {
      char v39 = [v33 handleArrowDown];
    }
    else if (v36)
    {
      char v39 = [v33 handleArrowUp];
    }
    else
    {
      if ((v37 | v38) != 1) {
        goto LABEL_40;
      }
      char v39 = [v33 handleUseCurrentSuggestion];
    }
    if (v39) {
      goto LABEL_41;
    }
    [v33 hideAccelerator];
LABEL_40:
    *((unsigned char *)v48 + 24) = 1;
    goto LABEL_41;
  }
LABEL_42:
  if (*((unsigned char *)v48 + 24))
  {
    v40.receiver = self;
    v40.super_class = (Class)ICTextView;
    [(ICTextView *)&v40 pressesBegan:v6 withEvent:v7];
  }
  _Block_object_dispose(&v47, 8);
}

void __37__ICTextView_pressesBegan_withEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v4 = [v9 attachment];
  int v5 = [v4 attachmentType];

  if (v5 == 12)
  {
    id v6 = [*(id *)(a1 + 32) icTextLayoutManager];
    objc_opt_class();
    id v7 = ICCheckedDynamicCast();
    uint64_t v8 = [v6 tableViewControllerForAttachment:v7 createIfNeeded:1];

    [v8 moveIntoTableWithDirection:*(unsigned char *)(a1 + 48) == 0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void __37__ICTextView_pressesBegan_withEvent___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v4 = [v8 attachment];
  int v5 = [v4 attachmentType];

  if (v5 == 12)
  {
    objc_opt_class();
    id v6 = [*(id *)(a1 + 32) viewControllerForTextAttachment:v8];
    id v7 = ICDynamicCast();

    [v7 moveIntoTableWithDirection:*(unsigned char *)(a1 + 48) == 0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)clampTextView
{
  id v2 = [(ICTextView *)self scrollClampingControllerDelayedRelease];
  [v2 clamp];
}

- (void)unclampTextView
{
  id v2 = [(ICTextView *)self scrollClampingControllerDelayedRelease];
  [v2 unclamp];
}

- (void)_scrollToCaretIfNeeded
{
  if ([(ICTextView *)self shouldAutoScroll])
  {
    v3.receiver = self;
    v3.super_class = (Class)ICTextView;
    [(ICTextView *)&v3 _scrollToCaretIfNeeded];
  }
}

- (void)_updatePanGesture
{
  [(ICTextView *)self setIsUpdatingPanGesture:1];
  v3.receiver = self;
  v3.super_class = (Class)ICTextView;
  [(ICTextView *)&v3 _updatePanGesture];
  [(ICTextView *)self setIsUpdatingPanGesture:0];
}

- (void)splitViewAnimatedTransitionWillBegin:(id)a3
{
  id v4 = a3;
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    objc_opt_class();
    int v5 = [v4 object];
    id v6 = ICDynamicCast();

    id v7 = [(ICBaseTextView *)self editorController];
    id v8 = [v7 viewControllerManager];

    id v9 = [v8 mainSplitViewController];
    objc_opt_class();
    NSUInteger v10 = [v4 userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"ICSplitViewControllerPredictedDetailSizeUserInfo"];
    uint64_t v12 = ICDynamicCast();

    int v13 = [v9 transitionCoordinator];
    int v14 = [v8 mainSplitViewController];
    if (v6 == v14 && [v9 displayMode] != 3 && v13)
    {

      if (v12)
      {
        uint64_t v15 = [v13 completionCurve];
        [v13 transitionDuration];
        double v17 = v16;
        [v13 transitionDuration];
        double v19 = v18;
        [v13 percentComplete];
        double v21 = v17 - v19 * v20;
        uint64_t v22 = (void *)MEMORY[0x263F82E00];
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __51__ICTextView_splitViewAnimatedTransitionWillBegin___block_invoke;
        v23[3] = &unk_2640B82D8;
        v23[4] = self;
        id v24 = v12;
        [v22 transitionWithView:self duration:v15 | 0x500000 options:v23 animations:0 completion:v21];
      }
    }
    else
    {
    }
  }
}

uint64_t __51__ICTextView_splitViewAnimatedTransitionWillBegin___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double v3 = v2;
  double v5 = v4;
  [*(id *)(a1 + 40) CGSizeValue];
  double v7 = v6;
  [*(id *)(a1 + 40) CGSizeValue];
  id v9 = *(void **)(a1 + 32);

  return objc_msgSend(v9, "setFrame:", v3, v5, v7, v8);
}

- (void)splitViewAnimatedTransitionEnded:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  double v5 = [v4 object];

  ICDynamicCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  double v6 = [(ICTextView *)self window];
  id v7 = [v6 rootViewController];

  double v8 = v9;
  if (v7 == v9)
  {
    [(ICTextView *)self updateLayoutMargins];
    double v8 = v9;
  }
}

- (BOOL)isPaperLinkBarShowingOrWillShow
{
  double v3 = [(ICBaseTextView *)self icDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  double v5 = [(ICBaseTextView *)self icDelegate];
  char v6 = [v5 isPaperLinkBarShowing];

  return v6;
}

- (id)attachmentViewTappedByGesture:(id)a3
{
  id v4 = a3;
  if (![v4 numberOfTouches])
  {
LABEL_13:
    char v6 = 0;
    goto LABEL_14;
  }
  [v4 locationOfTouch:0 inView:self];
  -[ICTextView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  double v5 = (ICTextView *)objc_claimAutoreleasedReturnValue();
  char v6 = v5;
  if (!v5 || v5 == self)
  {
    id v7 = v5;
LABEL_12:

    goto LABEL_13;
  }
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    NSClassFromString(&cfstr_PaperkitPapert.isa);
    if (objc_opt_isKindOfClass()) {
      break;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    id v7 = [(ICTextView *)v6 superview];

    if (v7)
    {
      char v6 = v7;
      if (v7 != self) {
        continue;
      }
    }
    goto LABEL_12;
  }
LABEL_14:

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v8 = 0;
  if (isKindOfClass)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (void)inProcessUndoPanGesture:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([a3 state] == 1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = [(ICTextView *)self collectScrollViews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          NSUInteger v10 = [v9 panGestureRecognizer];
          int v11 = [v10 isEnabled];

          if (v11)
          {
            uint64_t v12 = [v9 panGestureRecognizer];
            [v12 setEnabled:0];

            int v13 = [v9 panGestureRecognizer];
            [v13 setEnabled:1];
          }
          int v14 = [v9 pinchGestureRecognizer];
          int v15 = [v14 isEnabled];

          if (v15)
          {
            double v16 = [v9 pinchGestureRecognizer];
            [v16 setEnabled:0];

            double v17 = [v9 pinchGestureRecognizer];
            [v17 setEnabled:1];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }
  }
}

- (id)collectScrollViews
{
  double v3 = [MEMORY[0x263EFF980] array];
  ICTextViewCollectScrollViews(self, v3);
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (ICInternalSettingsIsTextKit2Enabled()) {
    goto LABEL_8;
  }
  int v11 = [(ICBaseTextView *)self editorController];
  if (([v11 isInkPickerShowing] & 1) == 0)
  {

LABEL_8:
    v29.receiver = self;
    v29.super_class = (Class)ICTextView;
    double v27 = [(ICTextView *)&v29 pointerInteraction:v8 regionForRequest:v9 defaultRegion:v10];
    goto LABEL_9;
  }
  char v12 = [MEMORY[0x263F82A20] prefersPencilOnlyDrawing];

  if (v12) {
    goto LABEL_8;
  }
  int v13 = [(ICTextView *)self layoutManager];
  int v14 = [(ICTextView *)self textStorage];
  uint64_t v15 = objc_msgSend(v13, "glyphIndexForCharacterAtIndex:", objc_msgSend(v14, "length") - 1);

  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_8;
  }
  double v16 = [(ICTextView *)self layoutManager];
  [v16 lineFragmentRectForGlyphAtIndex:v15 effectiveRange:0];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  [v9 location];
  double v26 = v25;
  v31.origin.double x = v18;
  v31.origin.double y = v20;
  v31.size.CGFloat width = v22;
  v31.size.CGFloat height = v24;
  double v27 = 0;
  if (v26 <= CGRectGetMaxY(v31)) {
    goto LABEL_8;
  }
LABEL_9:

  return v27;
}

- (void)textControllerDidHandleSpecialCaseEditing:(id)a3
{
  id v4 = [(ICTextView *)self delegate];
  [v4 textViewDidChange:self];
}

- (id)accessibilityLabel
{
  double v2 = [MEMORY[0x263F086E0] mainBundle];
  double v3 = [v2 localizedStringForKey:@"Note" value:&stru_26C10E100 table:0];

  return v3;
}

- (id)accessibilityIdentifier
{
  return @"Note";
}

- (BOOL)_accessibilityBeginUndoableTextInsertion
{
  double v2 = [(ICBaseTextView *)self TTTextStorage];
  [v2 setIsPerformingAccessibilityUndoableTextInsertion:1];

  return 1;
}

- (BOOL)_accessibilityEndUndoableTextInsertion
{
  double v2 = [(ICBaseTextView *)self TTTextStorage];
  [v2 setIsPerformingAccessibilityUndoableTextInsertion:0];

  return 1;
}

- (id)_icaxUnfilteredAttributedString
{
  double v2 = [(ICBaseTextView *)self TTTextStorage];
  double v3 = [v2 _icaxUnfilteredAttributedString];

  return v3;
}

- (void)handleAccessibilityDarkerSystemColorsStatusDidChange:(id)a3
{
  id v4 = [(ICTextView *)self textStorage];
  uint64_t v5 = *MEMORY[0x263F81520];
  uint64_t v6 = [(ICTextView *)self textStorage];
  uint64_t v7 = [v6 length];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__ICTextView_handleAccessibilityDarkerSystemColorsStatusDidChange___block_invoke;
  v8[3] = &unk_2640B89D0;
  v8[4] = self;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v7, 0, v8);
}

void __67__ICTextView_handleAccessibilityDarkerSystemColorsStatusDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_opt_class();
  uint64_t v7 = [*(id *)(a1 + 32) textStorage];
  ICDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    id v8 = [*(id *)(a1 + 32) editorController];
    id v9 = [v8 textController];
    objc_msgSend(v9, "styleText:inExactRange:fixModelAttributes:", v10, a3, a4, 0);
  }
}

- (void)setUserTitleView:(id)a3
{
}

- (void)setDateView:(id)a3
{
}

- (void)setCompatibilityBannerView:(id)a3
{
}

- (CALayer)topSplitLayer
{
  return self->_topSplitLayer;
}

- (void)setTopSplitLayer:(id)a3
{
}

- (CALayer)bottomSplitLayer
{
  return self->_bottomSplitLayer;
}

- (void)setBottomSplitLayer:(id)a3
{
}

- (UIResponder)nextResponderOverride
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextResponderOverride);

  return (UIResponder *)WeakRetained;
}

- (void)setNextResponderOverride:(id)a3
{
}

- (BOOL)shouldAvoidBecomingFirstResponder
{
  return self->_shouldAvoidBecomingFirstResponder;
}

- (void)setShouldAvoidBecomingFirstResponder:(BOOL)a3
{
  self->_shouldAvoidBecomingFirstResponder = a3;
}

- (BOOL)shouldRubberBand
{
  return self->_shouldRubberBand;
}

- (void)setShouldRubberBand:(BOOL)a3
{
  self->_shouldRubberBand = a3;
}

- (CGPoint)rubberBandContentOffset
{
  double x = self->_rubberBandContentOffset.x;
  double y = self->_rubberBandContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRubberBandContentOffset:(CGPoint)a3
{
  self->_rubberBandContentOffset = a3;
}

- (NSArray)draggingSnapPoints
{
  return self->_draggingSnapPoints;
}

- (void)setDraggingSnapPoints:(id)a3
{
}

- (BOOL)isBecomingFirstResponder
{
  return self->_isBecomingFirstResponder;
}

- (BOOL)isInsertingTextFromKeyboardInput
{
  return self->_isInsertingTextFromKeyboardInput;
}

- (void)setIsInsertingTextFromKeyboardInput:(BOOL)a3
{
  self->_isInsertingTextFromKeyboardInput = a3;
}

- (BOOL)isSettingStyleWithStyleUI
{
  return self->_isSettingStyleWithStyleUI;
}

- (void)setIsSettingStyleWithStyleUI:(BOOL)a3
{
  self->_isSettingStyleWithStyleUI = a3;
}

- (BOOL)isDisplayingEditableContent
{
  return self->_displayingEditableContent;
}

- (CATransformLayer)splitLayerContainer
{
  return self->_splitLayerContainer;
}

- (void)setSplitLayerContainer:(id)a3
{
}

- (BOOL)touchesCurrentlyOnAttachmentView
{
  return self->_touchesCurrentlyOnAttachmentView;
}

- (void)setTouchesCurrentlyOnAttachmentView:(BOOL)a3
{
  self->_touchesCurrentlyOnAttachmentView = a3;
}

- (BOOL)isUpdatingPanGesture
{
  return self->_isUpdatingPanGesture;
}

- (void)setIsUpdatingPanGesture:(BOOL)a3
{
  self->_isUpdatingPanGesture = a3;
}

- (CGRect)lastDragInsertionRect
{
  double x = self->_lastDragInsertionRect.origin.x;
  double y = self->_lastDragInsertionRect.origin.y;
  double width = self->_lastDragInsertionRect.size.width;
  double height = self->_lastDragInsertionRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastDragInsertionRect:(CGRect)a3
{
  self->_lastDragInsertionRect = a3;
}

- (BOOL)isSettingEditable
{
  return self->_isSettingEditable;
}

- (BOOL)needsHideOverlappingAttachmentViews
{
  return self->_needsHideOverlappingAttachmentViews;
}

- (NSMutableArray)highlightLayers
{
  return self->_highlightLayers;
}

- (void)setHighlightLayers:(id)a3
{
}

- (CGPoint)lastProposedContentOffset
{
  double x = self->_lastProposedContentOffset.x;
  double y = self->_lastProposedContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastProposedContentOffset:(CGPoint)a3
{
  self->_lastProposedContentOffset = a3;
}

- (CGPoint)distanceConsumedByEmbeddedScrollViews
{
  double x = self->_distanceConsumedByEmbeddedScrollViews.x;
  double y = self->_distanceConsumedByEmbeddedScrollViews.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDistanceConsumedByEmbeddedScrollViews:(CGPoint)a3
{
  self->_distanceConsumedByEmbeddedScrollViews = a3;
}

- (ICTextFindingCoordinator)textFindingCoordinator
{
  return self->_textFindingCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFindingCoordinator, 0);
  objc_storeStrong((id *)&self->_highlightLayers, 0);
  objc_storeStrong((id *)&self->_scrollClampingControllerDelayedRelease, 0);
  objc_storeStrong((id *)&self->_splitLayerContainer, 0);
  objc_storeStrong((id *)&self->_embeddedScrollViews, 0);
  objc_storeStrong((id *)&self->_draggingSnapPoints, 0);
  objc_destroyWeak((id *)&self->_nextResponderOverride);
  objc_storeStrong((id *)&self->_bottomSplitLayer, 0);
  objc_storeStrong((id *)&self->_topSplitLayer, 0);
  objc_storeStrong((id *)&self->_compatibilityBannerView, 0);
  objc_storeStrong((id *)&self->_dateView, 0);

  objc_storeStrong((id *)&self->_userTitleView, 0);
}

void __77__ICTextView_performTextSearchWithQueryString_usingOptions_resultAggregator___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Error when trying to find in note: %@", (uint8_t *)&v2, 0xCu);
}

void __71__ICTextView_replaceAllOccurrencesOfQueryString_usingOptions_withText___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "Unexpected error when trying to replace all occurrences of %@ with %@: %@", (uint8_t *)&v5, 0x20u);
}

- (void)setContentOffset:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20BE60000, log, OS_LOG_TYPE_DEBUG, "Should lock content offset", v1, 2u);
}

- (void)applyEdgeInsets:(NSObject *)a1 .cold.1(NSObject *a1, double a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForBodyText");
  [v4 pointSize];
  int v6 = 134218240;
  double v7 = a2;
  __int16 v8 = 2048;
  double v9 = a2 * v5;
  _os_log_debug_impl(&dword_20BE60000, a1, OS_LOG_TYPE_DEBUG, "Applying zoom factor: %g => %g", (uint8_t *)&v6, 0x16u);
}

@end