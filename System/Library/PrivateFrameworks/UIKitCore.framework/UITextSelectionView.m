@interface UITextSelectionView
- (BOOL)_activeAndVisible;
- (BOOL)_editMenuIsVisible;
- (BOOL)_shouldUseIndirectFloatingCaret;
- (BOOL)_updateEditMenuPositionForPreferredArrowDirection:(int64_t)a3 replacements:(id)a4;
- (BOOL)_viewUsesAsynchronousProtocol;
- (BOOL)activeCaret;
- (BOOL)activeFlattened;
- (BOOL)affectedByScrollerNotification:(id)a3;
- (BOOL)alertFlattened;
- (BOOL)caretBlinks;
- (BOOL)caretVisible;
- (BOOL)forceRangeView;
- (BOOL)ghostAppearance;
- (BOOL)isIndirectFloatingCaret;
- (BOOL)isInstalledInSelectionContainerView;
- (BOOL)isValid;
- (BOOL)navigationTransitionFlattened;
- (BOOL)point:(CGPoint)a3 isNearCursorRect:(CGRect)a4;
- (BOOL)popoverFlattened;
- (BOOL)sheetFlattened;
- (BOOL)shouldSuppressSelectionHandles;
- (BOOL)visible;
- (CGPoint)floatingCursorPositionForPoint:(CGPoint)a3;
- (CGPoint)floatingCursorPositionForPoint:(CGPoint)a3 lineSnapping:(BOOL)a4;
- (CGRect)clippedTargetRect:(CGRect)a3;
- (CGRect)previousGhostCaretRect;
- (CGRect)selectionBoundingBox;
- (CGRect)selectionBoundingBoxForRects:(id)a3;
- (CGRect)stashedCaretRect;
- (NSArray)replacements;
- (UITextInteractionAssistant)interactionAssistant;
- (UITextRangeView)rangeView;
- (UITextSelection)selection;
- (UITextSelectionView)initWithInteractionAssistant:(id)a3;
- (UIView)caretView;
- (UIView)floatingCaretView;
- (id)_actingParentViewForGestureRecognizers;
- (id)_customSelectionContainerView;
- (id)_editMenuSourceWindow;
- (id)caretViewColor;
- (id)dynamicCaret;
- (id)dynamicCaretList;
- (id)ghostCaretViewColor;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)menuInteraction;
- (id)obtainGrabberSuppressionAssertion;
- (id)scrollView;
- (int)applicationDeactivationReason;
- (void)_hideCaret:(int)a3;
- (void)_hideSelectionCommandsWithReason:(int64_t)a3;
- (void)_presentEditMenuWithPreferredDirection:(int64_t)a3 replacements:(id)a4;
- (void)_registerForViewAnimationNotificationsIfNecessary;
- (void)_setCaretBlinkAnimationEnabled:(BOOL)a3;
- (void)_showCaret:(int)a3;
- (void)_showCommandsWithReplacements:(id)a3 forDictation:(BOOL)a4 afterDelay:(double)a5;
- (void)_showCommandsWithReplacements:(id)a3 isForContextMenu:(BOOL)a4 forDictation:(BOOL)a5 arrowDirection:(int64_t)a6;
- (void)_showSelectionCommandsForContextMenu:(BOOL)a3;
- (void)_unregisterForNotifications;
- (void)_unregisterForViewAnimationNotificationsIfNecessary;
- (void)_updateViewAnimateNotificationObservationIfNecessary;
- (void)activate;
- (void)addCaretToSubview;
- (void)animateBoxShrinkOn:(id)a3;
- (void)animateCaret:(id)a3 toPosition:(CGPoint)a4 withSize:(CGSize)a5;
- (void)animateExpanderOn:(id)a3;
- (void)animatePulsingDirectCaret:(id)a3;
- (void)animatePulsingIndirectCaret:(id)a3;
- (void)appearOrFadeIfNecessary;
- (void)beginFloatingCaretView;
- (void)beginFloatingCursorAtPoint:(CGPoint)a3;
- (void)calculateReplacementsWithGenerator:(id)a3 andShowAfterDelay:(double)a4;
- (void)canExpandAfterAlert:(id)a3;
- (void)canExpandAfterBecomeActive:(id)a3;
- (void)canExpandAfterNavigationTransition:(id)a3;
- (void)canExpandAfterPopover:(id)a3;
- (void)canExpandAfterSheet:(id)a3;
- (void)cancelDelayedCommandRequests;
- (void)clearCaret;
- (void)clearRangeAnimated:(BOOL)a3;
- (void)configureForHighlightMode;
- (void)configureForPencilDeletionPreviewMode;
- (void)configureForPencilHighlightMode;
- (void)configureForReplacementMode;
- (void)configureForSelectionMode;
- (void)deactivate;
- (void)deactivateAndCollapseSelection:(BOOL)a3;
- (void)dealloc;
- (void)deferredUpdateSelectionCommands;
- (void)deferredUpdateSelectionRects;
- (void)didRotate:(id)a3;
- (void)didSuspend:(id)a3;
- (void)doneMagnifying;
- (void)endFloatingCaretView;
- (void)endFloatingCursor;
- (void)hideSelectionCommands;
- (void)hideSelectionCommandsAfterDelay:(double)a3 reason:(int64_t)a4;
- (void)inputModeDidChange:(id)a3;
- (void)inputViewDidAnimate;
- (void)inputViewDidChange;
- (void)inputViewDidMove;
- (void)inputViewWillAnimate;
- (void)inputViewWillChange;
- (void)inputViewWillMove:(id)a3;
- (void)installIfNecessary;
- (void)invalidate;
- (void)layoutChangedByScrolling:(BOOL)a3;
- (void)mustFlattenForAlert:(id)a3;
- (void)mustFlattenForNavigationTransition:(id)a3;
- (void)mustFlattenForPopover:(id)a3;
- (void)mustFlattenForResignActive:(id)a3;
- (void)mustFlattenForSheet:(id)a3;
- (void)prepareForMagnification;
- (void)releaseGrabberHandleSuppressionAssertion:(id)a3;
- (void)removeFromSuperview;
- (void)saveDeactivationReason:(id)a3;
- (void)scaleDidChange:(id)a3;
- (void)scaleWillChange:(id)a3;
- (void)selectionChanged;
- (void)selectionDidScroll:(id)a3;
- (void)selectionDidTranslateForReachability:(id)a3;
- (void)selectionWillScroll:(id)a3;
- (void)selectionWillTranslateForReachability:(id)a3;
- (void)setActiveFlattened:(BOOL)a3;
- (void)setAlertFlattened:(BOOL)a3;
- (void)setApplicationDeactivationReason:(int)a3;
- (void)setCaretBlinks:(BOOL)a3;
- (void)setCaretVisible:(BOOL)a3;
- (void)setEmphasisOnNextSelectionRects;
- (void)setForceRangeView:(BOOL)a3;
- (void)setGhostAppearance:(BOOL)a3;
- (void)setIsIndirectFloatingCaret:(BOOL)a3;
- (void)setNavigationTransitionFlattened:(BOOL)a3;
- (void)setPopoverFlattened:(BOOL)a3;
- (void)setPreviousGhostCaretRect:(CGRect)a3;
- (void)setReplacements:(id)a3;
- (void)setSheetFlattened:(BOOL)a3;
- (void)setStashedCaretRect:(CGRect)a3;
- (void)setVisible:(BOOL)a3;
- (void)showCalloutBarAfterDelay:(double)a3;
- (void)showCaret:(int)a3;
- (void)showCommandsWithReplacements:(id)a3;
- (void)showInitialCaret;
- (void)showReplacementsWithGenerator:(id)a3 forDictation:(BOOL)a4 afterDelay:(double)a5;
- (void)showSelectionCommands;
- (void)showSelectionCommandsAfterDelay:(double)a3;
- (void)textSelectionViewActivated:(id)a3;
- (void)tintColorDidChange;
- (void)updateBaseIsStartWithDocumentPoint:(CGPoint)a3;
- (void)updateDocumentHasContent:(BOOL)a3;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4;
- (void)updateRangeViewForSelectionMode;
- (void)updateSelectionCommands;
- (void)updateSelectionDots;
- (void)updateSelectionRects;
- (void)updateSelectionRectsIfNeeded;
- (void)updateSelectionWithDocumentPoint:(CGPoint)a3;
- (void)validateWithInteractionAssistant:(id)a3;
- (void)viewAnimate:(id)a3;
- (void)willBeginFloatingCursor:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
- (void)willResume:(id)a3;
- (void)willRotate:(id)a3;
- (void)windowDidResignOrBecomeKey;
@end

@implementation UITextSelectionView

- (UITextSelectionView)initWithInteractionAssistant:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextSelectionView;
  v5 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_viewDidStopNotification = -1;
    v5->_viewDidCommitNotification = -1;
    [(UITextSelectionView *)v5 validateWithInteractionAssistant:v4];
    [(UIView *)v6 _setDisableDictationTouchCancellation:1];
    v7 = v6;
  }

  return v6;
}

- (void)_unregisterForNotifications
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 removeObserver:a1 name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];
    [v2 removeObserver:a1 name:@"UIKeyboardDidHideNotification" object:0];
    [v2 removeObserver:a1 name:@"UIKeyboardWillHideNotification" object:0];
    [v2 removeObserver:a1 name:@"UIKeyboardDidShowNotification" object:0];
    [v2 removeObserver:a1 name:@"UIKeyboardWillShowNotification" object:0];
    [v2 removeObserver:a1 name:@"UIKeyboardDidChangeFrameNotification" object:0];
    [v2 removeObserver:a1 name:@"UIKeyboardWillChangeFrameNotification" object:0];
    [v2 removeObserver:a1 name:@"_UIWindowDidBecomeApplicationKeyNotification" object:0];
    [v2 removeObserver:a1 name:@"_UIWindowDidResignApplicationKeyNotification" object:0];
    [v2 removeObserver:a1 name:@"UIWindowDidRotateNotification" object:0];
    [v2 removeObserver:a1 name:@"UIWindowWillRotateNotification" object:0];
    [v2 removeObserver:a1 name:@"UITextSelectionDidTranslateForReachability" object:0];
    [v2 removeObserver:a1 name:@"UITextSelectionWillTranslateForReachability" object:0];
    [v2 removeObserver:a1 name:@"UITextSelectionDidInteractiveMove" object:0];
    [v2 removeObserver:a1 name:@"UITextSelectionWillInteractiveMove" object:0];
    [v2 removeObserver:a1 name:@"UITextSelectionDidZoom" object:0];
    [v2 removeObserver:a1 name:@"UITextSelectionWillZoom" object:0];
    [v2 removeObserver:a1 name:@"UITextSelectionDidScroll" object:0];
    [v2 removeObserver:a1 name:@"UITextSelectionWillScroll" object:0];
    [v2 removeObserver:a1 name:@"UITextSelectionViewActivatedNotification" object:0];
    [v2 removeObserver:a1 name:@"UITextEffectsWindowOffsetDidChangeNotification" object:0];
    [v2 removeObserver:a1 name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v2 removeObserver:a1 name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [v2 removeObserver:a1 name:@"_UIAlertWillAppearNotification" object:0];
    [v2 removeObserver:a1 name:@"_UIAlertDidDisappearNotification" object:0];
    [v2 removeObserver:a1 name:@"_UIApplicationWillAddDeactivationReasonNotification" object:0];
    [v2 removeObserver:a1 name:@"UIApplicationWillResignActiveNotification" object:0];
    [v2 removeObserver:a1 name:@"UIApplicationDidBecomeActiveNotification" object:0];
    [v2 removeObserver:a1 name:0x1ED10DD40 object:0];
    [v2 removeObserver:a1 name:0x1ED10DD60 object:0];
    [v2 removeObserver:a1 name:@"_UISheetWillAppearNotification" object:0];
    [v2 removeObserver:a1 name:@"_UISheetDidDisappearNotification" object:0];
    [v2 removeObserver:a1 name:0x1ED10B260 object:0];
    [v2 removeObserver:a1 name:0x1ED10B280 object:0];
  }
}

- (void)validateWithInteractionAssistant:(id)a3
{
  objc_storeWeak((id *)&self->m_interactionAssistant, a3);
  if (self->m_observer)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveObserver(Current, self->m_observer, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(self->m_observer);
    self->m_observer = 0;
  }
  self->m_deferSelectionCommands = 0;
  [(UIView *)self setUserInteractionEnabled:0];
  [(UITextSelectionView *)self setVisible:1];
  [(UITextSelectionView *)self setCaretBlinks:1];
  [(UITextSelectionView *)self setCaretVisible:1];
  [(UIView *)self setClipsToBounds:0];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  -[UITextSelectionView _unregisterForNotifications]((uint64_t)self);
  [v5 addObserver:self selector:sel_didSuspend_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
  [v5 addObserver:self selector:sel_willResume_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
  [v5 addObserver:self selector:sel_updateSelectionDots name:@"UITextEffectsWindowOffsetDidChangeNotification" object:0];
  [v5 addObserver:self selector:sel_textSelectionViewActivated_ name:@"UITextSelectionViewActivatedNotification" object:0];
  [v5 addObserver:self selector:sel_selectionWillScroll_ name:@"UITextSelectionWillScroll" object:0];
  [v5 addObserver:self selector:sel_selectionDidScroll_ name:@"UITextSelectionDidScroll" object:0];
  [v5 addObserver:self selector:sel_scaleWillChange_ name:@"UITextSelectionWillZoom" object:0];
  [v5 addObserver:self selector:sel_scaleDidChange_ name:@"UITextSelectionDidZoom" object:0];
  [v5 addObserver:self selector:sel_inputViewWillAnimate name:@"UITextSelectionWillInteractiveMove" object:0];
  [v5 addObserver:self selector:sel_inputViewDidAnimate name:@"UITextSelectionDidInteractiveMove" object:0];
  [v5 addObserver:self selector:sel_selectionWillTranslateForReachability_ name:@"UITextSelectionWillTranslateForReachability" object:0];
  [v5 addObserver:self selector:sel_selectionDidTranslateForReachability_ name:@"UITextSelectionDidTranslateForReachability" object:0];
  [v5 addObserver:self selector:sel_willRotate_ name:@"UIWindowWillRotateNotification" object:0];
  [v5 addObserver:self selector:sel_didRotate_ name:@"UIWindowDidRotateNotification" object:0];
  [v5 addObserver:self selector:sel_windowDidResignOrBecomeKey name:@"_UIWindowDidResignApplicationKeyNotification" object:0];
  [v5 addObserver:self selector:sel_windowDidResignOrBecomeKey name:@"_UIWindowDidBecomeApplicationKeyNotification" object:0];
  [v5 addObserver:self selector:sel_inputViewWillMove_ name:@"UIKeyboardWillChangeFrameNotification" object:0];
  [v5 addObserver:self selector:sel_inputViewDidMove name:@"UIKeyboardDidChangeFrameNotification" object:0];
  [v5 addObserver:self selector:sel_inputViewWillAnimate name:@"UIKeyboardWillShowNotification" object:0];
  [v5 addObserver:self selector:sel_inputViewDidAnimate name:@"UIKeyboardDidShowNotification" object:0];
  [v5 addObserver:self selector:sel_inputViewWillAnimate name:@"UIKeyboardWillHideNotification" object:0];
  [v5 addObserver:self selector:sel_inputViewDidAnimate name:@"UIKeyboardDidHideNotification" object:0];
  [v5 addObserver:self selector:sel_inputModeDidChange_ name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];
  [v5 addObserver:self selector:sel_mustFlattenForAlert_ name:@"_UIAlertWillAppearNotification" object:0];
  [v5 addObserver:self selector:sel_canExpandAfterAlert_ name:@"_UIAlertDidDisappearNotification" object:0];
  [v5 addObserver:self selector:sel_saveDeactivationReason_ name:@"_UIApplicationWillAddDeactivationReasonNotification" object:0];
  [v5 addObserver:self selector:sel_mustFlattenForResignActive_ name:@"UIApplicationWillResignActiveNotification" object:0];
  [v5 addObserver:self selector:sel_canExpandAfterBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];
  [v5 addObserver:self selector:sel_mustFlattenForNavigationTransition_ name:0x1ED10DD40 object:0];
  [v5 addObserver:self selector:sel_canExpandAfterNavigationTransition_ name:0x1ED10DD60 object:0];
  [v5 addObserver:self selector:sel_mustFlattenForSheet_ name:@"_UISheetWillAppearNotification" object:0];
  [v5 addObserver:self selector:sel_canExpandAfterSheet_ name:@"_UISheetDidDisappearNotification" object:0];
  [v5 addObserver:self selector:sel_mustFlattenForPopover_ name:0x1ED10B260 object:0];
  [v5 addObserver:self selector:sel_canExpandAfterPopover_ name:0x1ED10B280 object:0];
}

- (void)invalidate
{
  if (self->m_observer)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveObserver(Current, self->m_observer, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(self->m_observer);
    self->m_observer = 0;
  }
  -[UITextSelectionView _unregisterForNotifications]((uint64_t)self);
  [(UITextSelectionView *)self _unregisterForViewAnimationNotificationsIfNecessary];
  [(UITextSelectionView *)self deactivate];
  [(UITextSelection *)self->m_selection invalidate];
  m_selection = self->m_selection;
  self->m_selection = 0;

  m_replacements = self->m_replacements;
  self->m_replacements = 0;

  objc_storeWeak((id *)&self->m_interactionAssistant, 0);
}

- (BOOL)isValid
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_interactionAssistant);
  if (WeakRetained) {
    BOOL m_activated = self->m_activated;
  }
  else {
    BOOL m_activated = 0;
  }

  return m_activated;
}

- (void)dealloc
{
  [(UITextSelectionView *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UITextSelectionView;
  [(UIView *)&v3 dealloc];
}

- (void)activate
{
  objc_super v3 = [(UITextSelectionView *)self interactionAssistant];
  int v4 = [v3 containerAllowsSelection];

  if (v4)
  {
    id v5 = [(UITextSelectionView *)self interactionAssistant];
    int v6 = [v5 containerAllowsSelectionTintOnly];

    if (v6) {
      [(UITextSelectionView *)self configureForHighlightMode];
    }
    self->BOOL m_activated = 1;
    [(UITextSelectionView *)self _updateViewAnimateNotificationObservationIfNecessary];
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"UITextSelectionViewActivatedNotification" object:self];
    v7 = [(UITextSelectionView *)self selection];
    [v7 selectionChanged];
    [(UITextSelectionView *)self appearOrFadeIfNecessary];
    [(UITextSelectionView *)self deferredUpdateSelectionRects];
  }
}

- (void)deactivate
{
}

- (void)deactivateAndCollapseSelection:(BOOL)a3
{
  BOOL v3 = a3;
  self->BOOL m_activated = 0;
  [(UITextSelectionView *)self _updateViewAnimateNotificationObservationIfNecessary];
  if (v3)
  {
    id v5 = [(UITextSelectionView *)self selection];
    [v5 collapseSelection];

    int v6 = [(UITextSelectionView *)self selection];
    [v6 commit];
  }
  [(UITextSelectionView *)self removeFromSuperview];
}

- (void)windowDidResignOrBecomeKey
{
  if (self->m_activated) {
    [(UITextSelectionView *)self appearOrFadeIfNecessary];
  }
}

- (void)inputModeDidChange:(id)a3
{
  if ([(UITextSelectionView *)self selectionCommandsShowing])
  {
    [(UITextSelectionView *)self deferredUpdateSelectionCommands];
  }
}

- (void)viewAnimate:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [(UIView *)self->m_rangeView superview];
  if (v4)
  {
    id v5 = (void *)v4;
    int v6 = [(UITextSelectionView *)self interactionAssistant];
    v7 = [v6 view];

    if (v7)
    {
      id v8 = [v20 userInfo];
      objc_super v9 = [v8 objectForKey:0x1ED0EB2A0];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
        {
          v11 = 0;
          goto LABEL_17;
        }
        id v10 = [v9 view];
      }
      v11 = v10;
      if (v10)
      {
        v12 = [(UITextSelectionView *)self interactionAssistant];
        v13 = [v12 view];
        v14 = [v13 textInputView];
        if (([v11 containsView:v14] & 1) == 0)
        {

LABEL_16:
          goto LABEL_17;
        }
        v15 = [v11 _layer];
        v16 = [v15 animationKeys];

        if (v16)
        {
          v17 = [v20 name];
          int v18 = [v17 isEqualToString:0x1ED185E20];

          v19 = [(UITextSelectionView *)self rangeView];
          v12 = v19;
          if (v18) {
            [v19 startAnimating];
          }
          else {
            [v19 performSelector:sel_stopAnimating withObject:0 afterDelay:0.1];
          }
          goto LABEL_16;
        }
      }
LABEL_17:
    }
  }
}

- (void)_updateViewAnimateNotificationObservationIfNecessary
{
  if (self->m_activated
    && [(UITextSelectionView *)self visible]
    && ([(UIView *)self superview], BOOL v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    [(UITextSelectionView *)self _registerForViewAnimationNotificationsIfNecessary];
  }
  else
  {
    [(UITextSelectionView *)self _unregisterForViewAnimationNotificationsIfNecessary];
  }
}

- (void)_registerForViewAnimationNotificationsIfNecessary
{
  BOOL v3 = +[NSNotificationCenter uikitInternalCenter]();
  if (self->_viewDidStopNotification == -1)
  {
    id v4 = v3;
    self->_viewDidStopNotification = [v3 _addObserver:self selector:sel_viewAnimate_ name:0x1ED185E40 object:0 options:1024];
    BOOL v3 = v4;
  }
  if (self->_viewDidCommitNotification == -1)
  {
    id v5 = v3;
    self->_viewDidCommitNotification = [v3 _addObserver:self selector:sel_viewAnimate_ name:0x1ED185E20 object:0 options:1024];
    BOOL v3 = v5;
  }
}

- (void)_unregisterForViewAnimationNotificationsIfNecessary
{
  BOOL v3 = +[NSNotificationCenter uikitInternalCenter]();
  id v4 = v3;
  if (self->_viewDidStopNotification != -1)
  {
    objc_msgSend(v3, "_removeObserver:");
    BOOL v3 = v4;
    self->_viewDidStopNotification = -1;
  }
  if (self->_viewDidCommitNotification != -1)
  {
    objc_msgSend(v4, "_removeObserver:");
    BOOL v3 = v4;
    self->_viewDidCommitNotification = -1;
  }
}

- (void)selectionWillScroll:(id)a3
{
  id v11 = a3;
  if ([(UITextSelectionView *)self visible])
  {
    id v4 = [(UIView *)self superview];

    if (v4)
    {
      if ([(UITextSelectionView *)self affectedByScrollerNotification:v11])
      {
        BOOL v5 = self->m_wasShowingCommands
          || [(UITextSelectionView *)self selectionCommandsShowing];
        self->m_wasShowingCommands = v5;
        [(UITextSelectionView *)self hideSelectionCommands];
        int v6 = [(UITextSelectionView *)self selection];
        v7 = [v6 selectedRange];
        int v8 = [v7 _isRanged];

        if (v8)
        {
          objc_super v9 = [(UITextSelectionView *)self rangeView];
          [v9 willScroll];
        }
        id v10 = +[UIKeyboardImpl activeInstance];
        [v10 hideDictationMenuIfNeeded:0];
      }
    }
  }
}

- (void)selectionDidScroll:(id)a3
{
  id v14 = a3;
  if ([(UITextSelectionView *)self visible])
  {
    id v4 = [(UIView *)self superview];

    if (v4)
    {
      if ([(UITextSelectionView *)self affectedByScrollerNotification:v14])
      {
        BOOL v5 = [(UITextSelectionView *)self selection];
        int v6 = [v5 selectedRange];
        int v7 = [v6 _isRanged];

        BOOL v8 = [(UITextSelectionView *)self selectionCommandsShowing];
        if (v7)
        {
          if (v8)
          {
            objc_super v9 = [(UITextSelectionView *)self menuInteraction];

            if (v9)
            {
              id v10 = [(UITextSelectionView *)self menuInteraction];
              [v10 updateVisibleMenuPosition];
            }
            else
            {
              [(UITextSelectionView *)self hideSelectionCommands];
              self->m_wasShowingCommands = 1;
            }
          }
          if (self->m_wasShowingCommands) {
            [(UITextSelectionView *)self showCalloutBarAfterDelay:0.1];
          }
          v12 = [(UITextSelectionView *)self rangeView];
          [v12 didScroll];
        }
        else
        {
          if (!v8) {
            goto LABEL_16;
          }
          id v11 = [(UITextSelectionView *)self menuInteraction];

          if (!v11) {
            goto LABEL_16;
          }
          v12 = [(UITextSelectionView *)self menuInteraction];
          [v12 updateVisibleMenuPosition];
        }

LABEL_16:
        self->m_wasShowingCommands = 0;
        [(UITextSelectionView *)self deferredUpdateSelectionRects];
        v13 = +[UIKeyboardImpl activeInstance];
        [v13 showDictationMenuIfNeeded];
      }
    }
  }
}

- (BOOL)affectedByScrollerNotification:(id)a3
{
  id v4 = [a3 object];
  if (v4)
  {
    BOOL v5 = [(UITextSelectionView *)self interactionAssistant];
    int v6 = [v5 view];
    int v7 = [v6 textInputView];
    if (v7)
    {
      BOOL v8 = [(UITextSelectionView *)self interactionAssistant];
      objc_super v9 = [v8 view];
      id v10 = [v9 textInputView];
      char v11 = [v4 containsView:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)inputViewWillChange
{
  int m_showingCommandsCounter = self->m_showingCommandsCounter;
  self->int m_showingCommandsCounter = m_showingCommandsCounter + 1;
  if (!m_showingCommandsCounter)
  {
    BOOL v4 = self->m_delayShowingCommands
      || [(UITextSelectionView *)self selectionCommandsShowing];
    self->m_wasShowingCommands = v4;
    [(UITextSelectionView *)self cancelDelayedCommandRequests];
    [(UITextSelectionView *)self hideSelectionCommandsAfterDelay:1 reason:0.1];
    BOOL v5 = [(UITextSelectionView *)self rangeView];
    [v5 inputViewWillChange];

    id v6 = +[UIKeyboardImpl activeInstance];
    [v6 hideDictationMenuIfNeeded:1];
  }
}

- (void)inputViewDidChange
{
  int v2 = self->m_showingCommandsCounter - 1;
  self->int m_showingCommandsCounter = v2;
  if (!v2)
  {
    if (self->m_wasShowingCommands) {
      [(UITextSelectionView *)self showCalloutBarAfterDelay:0.1];
    }
    self->m_wasShowingCommands = 0;
    BOOL v4 = [(UITextSelectionView *)self rangeView];
    [v4 inputViewDidChange];

    id v5 = +[UIKeyboardImpl activeInstance];
    [v5 showDictationMenuIfNeeded];
  }
}

- (void)inputViewWillMove:(id)a3
{
  id v24 = a3;
  if (self->m_activated)
  {
    if ([(UITextSelectionView *)self shouldBeVisible])
    {
      BOOL v4 = [v24 userInfo];
      id v5 = [v4 objectForKey:@"UIKeyboardFrameBeginUserInfoKey"];
      [v5 CGRectValue];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;

      id v14 = [v24 userInfo];
      v15 = [v14 objectForKey:@"UIKeyboardFrameEndUserInfoKey"];
      [v15 CGRectValue];
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;

      v26.origin.x = v7;
      v26.origin.y = v9;
      v26.size.width = v11;
      v26.size.height = v13;
      v27.origin.x = v17;
      v27.origin.y = v19;
      v27.size.width = v21;
      v27.size.height = v23;
      if (!CGRectEqualToRect(v26, v27)) {
        [(UITextSelectionView *)self inputViewWillChange];
      }
    }
  }
}

- (void)inputViewDidMove
{
  if (self->m_showingCommandsCounter) {
    [(UITextSelectionView *)self inputViewDidChange];
  }
}

- (void)inputViewWillAnimate
{
  BOOL v3 = [(UIView *)self keyboardSceneDelegate];
  if (self->m_activated)
  {
    CGFloat v7 = v3;
    BOOL v4 = [(UITextSelectionView *)self shouldBeVisible];
    BOOL v3 = v7;
    if (v4)
    {
      id v5 = [v7 containerView];
      BOOL v6 = [(UIView *)self isDescendantOfView:v5];

      BOOL v3 = v7;
      if (v6)
      {
        [(UITextSelectionView *)self inputViewWillChange];
        BOOL v3 = v7;
      }
    }
  }
}

- (void)inputViewDidAnimate
{
  id v7 = [(UIView *)self keyboardSceneDelegate];
  if ([v7 isOnScreen])
  {
    if (!self->m_activated)
    {
      BOOL v3 = [(UITextSelectionView *)self interactionAssistant];
      int v4 = [v3 externalTextInput];

      if (v4) {
        [(UITextSelectionView *)self activate];
      }
    }
  }
  if (self->m_showingCommandsCounter)
  {
    id v5 = [v7 containerView];
    BOOL v6 = [(UIView *)self isDescendantOfView:v5];

    if (v6) {
      [(UITextSelectionView *)self inputViewDidChange];
    }
  }
}

- (void)selectionWillTranslateForReachability:(id)a3
{
  id v4 = a3;
  if (self->m_activated)
  {
    id v6 = v4;
    BOOL v5 = [(UITextSelectionView *)self shouldBeVisible];
    id v4 = v6;
    if (v5)
    {
      [(UITextSelectionView *)self inputViewWillChange];
      id v4 = v6;
    }
  }
}

- (void)selectionDidTranslateForReachability:(id)a3
{
  if (self->m_showingCommandsCounter) {
    [(UITextSelectionView *)self inputViewDidChange];
  }
}

- (void)textSelectionViewActivated:(id)a3
{
  id v4 = [a3 object];
  if (v4 != self)
  {
    CGFloat v13 = v4;
    BOOL v5 = [(UITextSelectionView *)v4 interactionAssistant];
    id v6 = [v5 view];
    id v7 = [v6 textInputView];
    double v8 = [v7 window];
    CGFloat v9 = [(UITextSelectionView *)self interactionAssistant];
    double v10 = [v9 view];
    CGFloat v11 = [v10 textInputView];
    double v12 = [v11 window];

    id v4 = v13;
    if (v8 == v12)
    {
      [(UITextSelectionView *)self deactivateAndCollapseSelection:1];
      id v4 = v13;
    }
  }
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITextSelectionView;
  -[UIView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3)
  {
    if ([(UITextSelectionView *)self _editMenuIsVisible]) {
      [(UITextSelectionView *)self hideSelectionCommands];
    }
  }
}

- (void)removeFromSuperview
{
  BOOL v3 = [(UIView *)self superview];

  if (v3) {
    [(UITextSelectionView *)self hideSelectionCommands];
  }
  [(UITextSelectionView *)self detach];
  [(UIView *)self->m_floatingCaretView removeFromSuperview];
  m_floatingCaretView = self->m_floatingCaretView;
  self->m_floatingCaretView = 0;

  m_caretView = self->m_caretView;
  if (m_caretView)
  {
    [(UITextSelectionView *)self clearCaret];
    m_caretView = self->m_caretView;
  }
  self->m_caretView = 0;

  m_rangeView = self->m_rangeView;
  if (m_rangeView)
  {
    [(UITextSelectionView *)self clearRangeAnimated:0];
    m_rangeView = self->m_rangeView;
  }
  self->m_rangeView = 0;

  if ((*(void *)&self->super._viewFlags & 0x1000) == 0)
  {
    id v7 = [(UIView *)self layer];
    double v8 = [v7 animationKeys];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      double v10 = [(UIView *)self layer];
      [v10 removeAllAnimations];
    }
  }
  [(UITextSelectionView *)self _updateViewAnimateNotificationObservationIfNecessary];
  v11.receiver = self;
  v11.super_class = (Class)UITextSelectionView;
  [(UIView *)&v11 removeFromSuperview];
}

- (void)clearRangeAnimated:(BOOL)a3
{
}

- (BOOL)_viewUsesAsynchronousProtocol
{
  int v2 = [(UITextSelectionView *)self interactionAssistant];
  char v3 = [v2 viewConformsToAsynchronousInteractionProtocol];

  return v3;
}

- (BOOL)isInstalledInSelectionContainerView
{
  int v2 = [(UITextSelectionView *)self interactionAssistant];
  char v3 = [v2 view];

  id v4 = [v3 textInputView];
  if (objc_opt_respondsToSelector())
  {
    objc_super v5 = [v3 selectionContainerView];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_customSelectionContainerView
{
  char v3 = [(UITextSelectionView *)self interactionAssistant];
  id v4 = [v3 view];

  objc_super v5 = [v4 textInputView];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [v4 selectionContainerView];
  }
  else
  {
    BOOL v6 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(UITextSelectionView *)self _viewUsesAsynchronousProtocol])
  {
    uint64_t v7 = [v5 unscaledView];

    BOOL v6 = (void *)v7;
  }

  return v6;
}

- (BOOL)_activeAndVisible
{
  if (!self->m_activated) {
    return 0;
  }
  [(UIView *)self alpha];
  if (v3 <= 0.0) {
    return 0;
  }
  id v4 = [(UITextSelectionView *)self interactionAssistant];
  char v5 = [v4 containerAllowsSelection];

  return v5;
}

- (void)installIfNecessary
{
  if ([(UITextSelectionView *)self _activeAndVisible])
  {
    double v3 = [(UITextSelectionView *)self interactionAssistant];
    id v7 = [v3 view];

    id v4 = [v7 textInputView];
    id v5 = [(UITextSelectionView *)self _customSelectionContainerView];
    if (!v5) {
      id v5 = v4;
    }
    id v6 = [(UIView *)self superview];

    if (v6 != v5) {
      [v5 addSubview:self];
    }
  }
}

- (id)_actingParentViewForGestureRecognizers
{
  double v3 = [(UITextSelectionView *)self _customSelectionContainerView];

  if (v3)
  {
    id v4 = [(UITextSelectionView *)self interactionAssistant];
    id v5 = [v4 view];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)selectionChanged
{
  double v3 = [(UITextSelectionView *)self interactionAssistant];
  id v4 = [v3 view];
  id v5 = [v4 textInputView];
  id v6 = [v5 window];

  if (!v6) {
    return;
  }
  if ([(UITextRangeView *)self->m_rangeView mode] == 2)
  {
    [(UITextSelectionView *)self updateRangeViewForSelectionMode];
  }
  else if ([(UITextRangeView *)self->m_rangeView mode] == 1)
  {
    id v7 = [(UITextSelectionView *)self interactionAssistant];
    if ([v7 containerAllowsSelectionTintOnly])
    {
    }
    else
    {
      double v8 = [(UITextSelectionView *)self selection];
      char v9 = [v8 isRangedSelectionSpanningDocument];

      if ((v9 & 1) == 0) {
        [(UITextRangeView *)self->m_rangeView setMode:0];
      }
    }
  }
  double v10 = [(UITextSelectionView *)self selection];
  [v10 selectionChanged];

  objc_super v11 = [(UITextSelectionView *)self selection];
  if ([v11 isCommitting])
  {

    goto LABEL_14;
  }
  double v12 = [(UITextSelectionView *)self interactionAssistant];
  char v13 = [v12 expectingCommit];

  if ((v13 & 1) != 0
    || ([(UITextSelectionView *)self interactionAssistant],
        id v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 requiresImmediateUpdate],
        v14,
        v15))
  {
LABEL_14:
    [(UITextSelectionView *)self updateSelectionRects];
    return;
  }
  [(UITextSelectionView *)self deferredUpdateSelectionRects];
}

- (void)updateSelectionRects
{
  v106[1] = *MEMORY[0x1E4F143B8];
  if ([(UITextSelectionView *)self _activeAndVisible])
  {
    if (self->m_observer && !self->m_deferSelectionCommands)
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveObserver(Current, self->m_observer, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
      CFRelease(self->m_observer);
      self->m_observer = 0;
    }
    id v4 = [(UITextSelectionView *)self interactionAssistant];
    id v5 = [(UITextSelectionView *)self selection];
    id v6 = [v5 selectedRange];

    if (!v6)
    {
      [(UITextSelectionView *)self clearCaret];
      [(UITextSelectionView *)self clearRangeAnimated:0];
      [(UITextSelectionView *)self removeFromSuperview];
      goto LABEL_30;
    }
    id v7 = [(UITextSelectionView *)self selection];
    double v8 = [v7 selectedRange];
    if ([v8 _isCaret])
    {
      BOOL v9 = [(UITextSelectionView *)self forceRangeView];

      if (!v9)
      {
        BOOL m_activeCaret = self->m_activeCaret;
        objc_super v11 = [(UITextSelectionView *)self interactionAssistant];
        double v12 = [v11 textDocument];
        BOOL v13 = +[UIDictationController shouldHideCursorForTextView:v12];

        if (!v13)
        {
          int v14 = 1;
          [(UITextSelectionView *)self clearRangeAnimated:1];
          int v15 = [(UITextSelectionView *)self interactionAssistant];
          double v16 = [v15 view];
          if (([v16 isEditable] & 1) == 0)
          {
            CGFloat v17 = [(UITextSelectionView *)self selection];
            int v14 = [v17 hasEditableSelection];
          }
          double v18 = [(UITextSelectionView *)self interactionAssistant];
          CGFloat v19 = [v18 externalInteractions];
          uint64_t v20 = [v19 textInteractionMode];

          CGFloat v21 = [(UITextSelectionView *)self interactionAssistant];
          if ([v21 inGesture])
          {
            double v22 = [(UITextSelectionView *)self rangeView];
            BOOL v23 = [v22 mode] != 1;
          }
          else
          {
            BOOL v23 = 0;
          }

          if ((v14 | v23) != 1 || v20 == 1)
          {
            [(UITextSelectionView *)self clearCaret];
            goto LABEL_30;
          }
          [(UITextSelectionView *)self installIfNecessary];
          v40 = [(UITextSelectionView *)self selection];
          [v40 caretRect];
          double v42 = v41;
          double v44 = v43;
          double v46 = v45;
          double v48 = v47;

          v49 = [(UITextSelectionView *)self interactionAssistant];
          v50 = [v49 view];
          v51 = [v50 textInputView];
          objc_msgSend(v51, "convertRect:toView:", self, v42, v44, v46, v48);
          double v98 = v52;
          double v54 = v53;
          double width = v55;
          double v58 = v57;

          uint64_t v59 = [v4 view];
          if (v59
            && (v60 = (void *)v59,
                [v4 view],
                v61 = objc_claimAutoreleasedReturnValue(),
                char v62 = objc_opt_respondsToSelector(),
                v61,
                v60,
                (v62 & 1) != 0))
          {
            v63 = [v4 view];
            [v63 selectionClipRect];
          }
          else
          {
            double v68 = *MEMORY[0x1E4F1DB20];
            double v69 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
            double v70 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
            double v71 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
            uint64_t v72 = [v4 view];
            if (!v72) {
              goto LABEL_42;
            }
            v73 = (void *)v72;
            v74 = [v4 view];
            char v75 = objc_opt_respondsToSelector();

            if ((v75 & 1) == 0) {
              goto LABEL_42;
            }
            v63 = [v4 view];
            [v63 _selectionClipRect];
          }
          double v68 = v64;
          double v69 = v65;
          double v70 = v66;
          double v71 = v67;

LABEL_42:
          v108.origin.double x = v68;
          v108.origin.double y = v69;
          v108.size.double width = v70;
          v108.size.double height = v71;
          if (!CGRectIsNull(v108))
          {
            v76 = [(UITextSelectionView *)self interactionAssistant];
            v77 = [v76 view];
            v78 = [v77 textInputView];
            objc_msgSend(v78, "convertRect:toView:", self, v68, v69, v70, v71);
            double v68 = v79;
            double v69 = v80;
            double v70 = v81;
            double v71 = v82;
          }
          v31 = [(UITextSelectionView *)self caretView];
          v109.origin.double x = v68;
          v109.origin.double y = v69;
          v109.size.double width = v70;
          v109.size.double height = v71;
          CGFloat r2 = v54;
          if (CGRectIsNull(v109))
          {
            double x = v98;
            CGFloat v84 = v58;
          }
          else
          {
            v110.origin.double x = v68;
            v110.origin.double y = v69;
            v110.size.double width = v70;
            v110.size.double height = v71;
            BOOL v85 = v98 < CGRectGetMinX(v110);
            CGFloat MinX = v98;
            if (v85)
            {
              v111.origin.double x = v68;
              v111.origin.double y = v69;
              v111.size.double width = v70;
              v111.size.double height = v71;
              CGFloat MinX = CGRectGetMinX(v111);
            }
            double x = MinX;
            double v87 = v54;
            double v88 = width;
            CGFloat v84 = v58;
            double v89 = v58;
            double MaxX = CGRectGetMaxX(*(CGRect *)&MinX);
            v112.origin.double x = v68;
            v112.origin.double y = v69;
            v112.size.double width = v70;
            v112.size.double height = v71;
            if (MaxX > CGRectGetMaxX(v112))
            {
              v113.origin.double x = v68;
              v113.origin.double y = v69;
              v113.size.double width = v70;
              v113.size.double height = v71;
              double x = CGRectGetMaxX(v113) - width;
            }
          }
          v114.origin.double x = v68;
          v114.origin.double y = v69;
          v114.size.double width = v70;
          v114.size.double height = v71;
          if (CGRectIsNull(v114))
          {
            double height = v84;
            double y = r2;
          }
          else
          {
            v115.origin.double x = v68;
            v115.origin.double y = v69;
            v115.size.double width = v70;
            v115.size.double height = v71;
            v119.origin.double x = x;
            v119.origin.double y = r2;
            v119.size.double width = width;
            v119.size.double height = v84;
            CGRect v116 = CGRectIntersection(v115, v119);
            double x = v116.origin.x;
            double y = v116.origin.y;
            double width = v116.size.width;
            double height = v116.size.height;
          }
          v117.origin.double x = x;
          v117.origin.double y = y;
          v117.size.double width = width;
          v117.size.double height = height;
          if (CGRectIsEmpty(v117) || !UIRectIsDiscrete(x, y, width, height))
          {
            [(UITextSelectionView *)self clearCaret];
          }
          else
          {
            uint64_t v93 = [(UITextSelectionView *)self dynamicCaret];
            if (v93
              && (v94 = (void *)v93,
                  [(UIView *)v31 superview],
                  v95 = objc_claimAutoreleasedReturnValue(),
                  v95,
                  v94,
                  v95))
            {
              v104[0] = MEMORY[0x1E4F143A8];
              v104[1] = 3221225472;
              v104[2] = __43__UITextSelectionView_updateSelectionRects__block_invoke;
              v104[3] = &unk_1E52DA520;
              v96 = (id *)v105;
              v105[0] = v31;
              *(double *)&v105[1] = x;
              *(double *)&v105[2] = y;
              *(double *)&v105[3] = width;
              *(double *)&v105[4] = height;
              +[UIView animateWithDuration:v104 animations:0.2];
            }
            else if (self->m_caretAnimating)
            {
              v102[0] = MEMORY[0x1E4F143A8];
              v102[1] = 3221225472;
              v102[2] = __43__UITextSelectionView_updateSelectionRects__block_invoke_2;
              v102[3] = &unk_1E52DA520;
              v96 = (id *)v103;
              v103[0] = v31;
              *(double *)&v103[1] = x;
              *(double *)&v103[2] = y;
              *(double *)&v103[3] = width;
              *(double *)&v103[4] = height;
              +[UIView animateWithDuration:50331648 delay:v102 options:0 animations:0.05 completion:0.0];
            }
            else
            {
              v100[0] = MEMORY[0x1E4F143A8];
              v100[1] = 3221225472;
              v100[2] = __43__UITextSelectionView_updateSelectionRects__block_invoke_3;
              v100[3] = &unk_1E52DA520;
              v96 = (id *)v101;
              v101[0] = v31;
              *(double *)&v101[1] = x;
              *(double *)&v101[2] = y;
              *(double *)&v101[3] = width;
              *(double *)&v101[4] = height;
              +[UIView performWithoutAnimation:v100];
            }

            v97 = [(UIView *)v31 superview];

            if (!v97) {
              [(UITextSelectionView *)self addCaretToSubview];
            }
            if (m_activeCaret) {
              [(UITextSelectionView *)self showCaret:0];
            }
            else {
              [(UITextSelectionView *)self showInitialCaret];
            }
            [(UITextSelectionView *)self _setCaretBlinkAnimationEnabled:self->m_caretBlinks];
            +[UIDictationController updateLandingView];
            if (_AXSZoomTouchEnabled())
            {
              [(UIView *)v31 bounds];
              UIAccessibilityZoomFocusChanged(UIAccessibilityZoomTypeInsertionPoint, v118, v31);
            }
          }
LABEL_29:

          goto LABEL_30;
        }
        goto LABEL_30;
      }
    }
    else
    {
    }
    id v24 = [(UITextSelectionView *)self selection];
    v25 = [v24 selectedRange];
    if ([v25 _isRanged])
    {
    }
    else
    {
      BOOL v26 = [(UITextSelectionView *)self forceRangeView];

      if (!v26) {
        goto LABEL_30;
      }
    }
    CGRect v27 = [(UITextSelectionView *)self interactionAssistant];
    v28 = [v27 textDocument];
    BOOL v29 = +[UIDictationController shouldHideSelectionUIForTextView:v28];

    if (!v29)
    {
      [(UITextSelectionView *)self clearCaret];
      [(UITextSelectionView *)self installIfNecessary];
      v30 = [(UITextSelectionView *)self selection];
      v31 = [v30 selectionRects];

      if (![(UIView *)v31 count])
      {
        v32 = [(UITextSelectionView *)self selection];
        [v32 caretRect];
        v33 = +[_UITextSelectionCaretRect selectionRectWithRect:](_UITextSelectionCaretRect, "selectionRectWithRect:");
        v106[0] = v33;
        uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:1];

        v31 = (UIView *)v34;
      }
      v35 = [(UITextSelectionView *)self rangeView];
      v36 = [v35 superview];

      if (!v36) {
        [(UIView *)self addSubview:v35];
      }
      [v35 setRects:v31];
      v37 = [(UITextSelectionView *)self interactionAssistant];
      v38 = [v37 view];
      v39 = [v38 textInputView];
      [v39 bounds];
      -[UIView setFrame:](self, "setFrame:");

      if (self->m_shouldEmphasizeNextSelectionRects)
      {
        [v35 animateHighlighterExpanderAnimation];
        self->m_shouldEmphasizeNextSelectionRects = 0;
      }

      goto LABEL_29;
    }
LABEL_30:

    return;
  }
  [(UITextSelectionView *)self removeFromSuperview];
}

uint64_t __43__UITextSelectionView_updateSelectionRects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __43__UITextSelectionView_updateSelectionRects__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v2 = *(double *)(a1 + 56) * 0.5;
  id v3 = [*(id *)(a1 + 32) layer];
  [v3 setCornerRadius:v2];
}

void __43__UITextSelectionView_updateSelectionRects__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v2 = *(double *)(a1 + 56) * 0.5;
  id v3 = [*(id *)(a1 + 32) layer];
  [v3 setCornerRadius:v2];
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)UITextSelectionView;
  [(UIView *)&v4 tintColorDidChange];
  if (self->m_caretView)
  {
    id v3 = [(UITextSelectionView *)self caretViewColor];
    [(UIView *)self->m_caretView setBackgroundColor:v3];
  }
}

- (void)didSuspend:(id)a3
{
  self->m_isSuspended = 1;
}

- (void)willResume:(id)a3
{
  self->m_isSuspended = 0;
  [(UITextSelectionView *)self updateSelectionRects];
}

- (void)deferredUpdateSelectionRects
{
  if (!self->m_observer && !self->m_isSuspended)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51__UITextSelectionView_deferredUpdateSelectionRects__block_invoke;
    v4[3] = &unk_1E52DD1A0;
    objc_copyWeak(&v5, &location);
    self->m_observer = CFRunLoopObserverCreateWithHandler(0, 4uLL, 0, 0, v4);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, self->m_observer, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __51__UITextSelectionView_deferredUpdateSelectionRects__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSelectionRectsIfNeeded];
}

- (void)setEmphasisOnNextSelectionRects
{
  self->m_shouldEmphasizeNextSelectionRects = 1;
}

- (void)deferredUpdateSelectionCommands
{
  self->m_deferSelectionCommands = 1;
  [(UITextSelectionView *)self deferredUpdateSelectionRects];
}

- (void)updateSelectionRectsIfNeeded
{
  if (self->m_observer)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveObserver(Current, self->m_observer, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(self->m_observer);
    self->m_observer = 0;
    [(UITextSelectionView *)self updateSelectionRects];
    if (self->m_deferSelectionCommands)
    {
      [(UITextSelectionView *)self showCommandsWithReplacements:0];
    }
  }
}

- (void)updateSelectionDots
{
  if ([(UITextSelectionView *)self visible])
  {
    id v3 = [(UITextSelectionView *)self selection];
    objc_super v4 = [v3 selectedRange];
    int v5 = [v4 _isRanged];

    if (v5)
    {
      m_rangeView = self->m_rangeView;
      [(UITextRangeView *)m_rangeView updateDots];
    }
  }
}

- (void)appearOrFadeIfNecessary
{
  BOOL v3 = [(UITextSelectionView *)self shouldBeVisible];
  [(UIView *)self alpha];
  if (v4 != 0.0 || !v3)
  {
    [(UIView *)self alpha];
    char v7 = v6 == 0.0 || v3;
    if ((v7 & 1) == 0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __46__UITextSelectionView_appearOrFadeIfNecessary__block_invoke;
      v9[3] = &unk_1E52D9F70;
      v9[4] = self;
      +[UIView animateWithDuration:0 delay:v9 options:0 animations:0.25 completion:0.0];
    }
  }
  else
  {
    [(UIView *)self setAlpha:1.0];
    [(UITextSelectionView *)self deferredUpdateSelectionRects];
    m_rangeView = self->m_rangeView;
    [(UIView *)m_rangeView setUserInteractionEnabled:1];
  }
}

uint64_t __46__UITextSelectionView_appearOrFadeIfNecessary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 440) updateDots];
  double v2 = *(void **)(*(void *)(a1 + 32) + 440);
  return [v2 setUserInteractionEnabled:0];
}

- (void)setVisible:(BOOL)a3
{
  BOOL v3 = a3;
  self->m_visible = a3;
  [(UITextSelectionView *)self _updateViewAnimateNotificationObservationIfNecessary];
  [(UITextSelectionView *)self appearOrFadeIfNecessary];
  BOOL v5 = v3 && self->m_caretBlinks;
  [(UITextSelectionView *)self _setCaretBlinkAnimationEnabled:v5];
}

- (BOOL)visible
{
  return self->m_visible;
}

- (void)setCaretBlinks:(BOOL)a3
{
  uint64_t v3 = a3;
  if (_UIDeviceHasExternalTouchInput()) {
    uint64_t v3 = [(id)UIApp _overridesDynamicCaret] & v3;
  }
  if (self->m_caretBlinks != v3 || !self->_caretBlinkAnimation)
  {
    self->m_caretBlinks = v3;
    if (self->m_caretShowingNow)
    {
      [(UITextSelectionView *)self _setCaretBlinkAnimationEnabled:v3];
    }
  }
}

- (BOOL)caretBlinks
{
  return self->m_caretBlinks;
}

- (BOOL)caretVisible
{
  return self->m_caretVisible;
}

- (void)setCaretVisible:(BOOL)a3
{
  if (self->m_caretVisible != a3)
  {
    self->m_caretVisible = a3;
    if (a3)
    {
      [(UITextSelectionView *)self addCaretToSubview];
      double v4 = [(UITextSelectionView *)self selection];
      BOOL v5 = [v4 selectedRange];
      char v6 = [v5 _isRanged];

      if ((v6 & 1) == 0) {
        [(UITextSelectionView *)self showCaret:0];
      }
      [(UITextSelectionView *)self updateSelectionDots];
    }
    else
    {
      [(UITextSelectionView *)self clearCaret];
    }
  }
}

- (BOOL)ghostAppearance
{
  return self->m_ghostApperarance;
}

- (void)setGhostAppearance:(BOOL)a3
{
  if (self->m_ghostApperarance != a3)
  {
    self->m_ghostApperarance = a3;
    id v4 = [(UITextSelectionView *)self caretViewColor];
    [(UIView *)self->m_caretView setBackgroundColor:v4];
  }
}

- (BOOL)_updateEditMenuPositionForPreferredArrowDirection:(int64_t)a3 replacements:(id)a4
{
  id v6 = a4;
  if ([(UITextSelectionView *)self _editMenuIsVisible]) {
    [(UITextSelectionView *)self _presentEditMenuWithPreferredDirection:a3 replacements:v6];
  }

  return 1;
}

- (void)showCommandsWithReplacements:(id)a3
{
}

- (void)_showCommandsWithReplacements:(id)a3 forDictation:(BOOL)a4 afterDelay:(double)a5
{
  id v8 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__UITextSelectionView__showCommandsWithReplacements_forDictation_afterDelay___block_invoke;
  aBlock[3] = &unk_1E52DC3D0;
  aBlock[4] = self;
  id v9 = v8;
  id v18 = v9;
  BOOL v19 = a4;
  double v10 = _Block_copy(aBlock);
  objc_super v11 = v10;
  if (a5 == 0.0)
  {
    (*((void (**)(void *))v10 + 2))(v10);
  }
  else
  {
    BOOL m_delayShowingCommands = self->m_delayShowingCommands;
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__UITextSelectionView__showCommandsWithReplacements_forDictation_afterDelay___block_invoke_3;
    v14[3] = &unk_1E52E3538;
    BOOL v16 = m_delayShowingCommands;
    v14[4] = self;
    id v15 = v11;
    dispatch_after(v13, MEMORY[0x1E4F14428], v14);
  }
}

void __77__UITextSelectionView__showCommandsWithReplacements_forDictation_afterDelay___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) interactionAssistant];
  uint64_t v3 = [v2 view];

  if ([*(id *)(a1 + 32) _viewUsesAsynchronousProtocol]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __77__UITextSelectionView__showCommandsWithReplacements_forDictation_afterDelay___block_invoke_2;
    v5[3] = &unk_1E52EA7D8;
    id v4 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    char v7 = *(unsigned char *)(a1 + 48);
    [v3 requestPreferredArrowDirectionForEditMenuWithCompletionHandler:v5];
  }
  else
  {
    [*(id *)(a1 + 32) _showCommandsWithReplacements:*(void *)(a1 + 40) isForContextMenu:0 forDictation:*(unsigned __int8 *)(a1 + 48) arrowDirection:0];
  }
}

uint64_t __77__UITextSelectionView__showCommandsWithReplacements_forDictation_afterDelay___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) >= 4) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = a2;
  }
  return [*(id *)(a1 + 32) _showCommandsWithReplacements:*(void *)(a1 + 40) isForContextMenu:0 forDictation:*(unsigned __int8 *)(a1 + 48) arrowDirection:v2];
}

uint64_t __77__UITextSelectionView__showCommandsWithReplacements_forDictation_afterDelay___block_invoke_3(uint64_t result)
{
  if (*(unsigned __int8 *)(result + 48) == *(unsigned __int8 *)(*(void *)(result + 32) + 456)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

- (void)_showCommandsWithReplacements:(id)a3 isForContextMenu:(BOOL)a4 forDictation:(BOOL)a5 arrowDirection:(int64_t)a6
{
  BOOL v7 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  self->int m_showingCommandsCounter = 0;
  self->m_showingCommandsCounterForRotate = 0;
  objc_super v11 = [(UITextSelectionView *)self interactionAssistant];
  double v12 = [v11 textDocument];
  char v13 = +[UIDictationController shouldHideSelectionUIForTextView:v12];
  if ((v13 & 1) == 0 && !a4)
  {
    int v14 = [(UITextSelectionView *)self interactionAssistant];
    char v13 = [v14 shouldSuppressSelectionCommands];
  }
  if ((v13 & 1) == 0)
  {
    [(UITextSelectionView *)self cancelDelayedCommandRequests];
    if ([(UITextSelectionView *)self selectionCommandsShowing])
    {
      if (![(UITextSelectionView *)self _updateEditMenuPositionForPreferredArrowDirection:a6 replacements:v10])[(UITextSelectionView *)self hideSelectionCommands]; {
    }
      }
    else
    {
      id v15 = +[UIKeyboardImpl activeInstance];
      char v16 = [v15 hasMarkedText];

      if ((v16 & 1) == 0)
      {
        uint64_t v17 = [v10 indexOfObjectPassingTest:&__block_literal_global_565];
        id v18 = +[UIKeyboardImpl activeInstance];
        int v19 = [v18 isPredictionViewControllerVisible];

        if (v7 && v17 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v20 = +[UIDevice currentDevice];
          uint64_t v21 = [v20 userInterfaceIdiom];

          if ((v21 & 0xFFFFFFFFFFFFFFFBLL) != 1)
          {
            int v22 = [v10 count] ? v19 : 0;
            if (v22 == 1)
            {
              BOOL v23 = +[UIKeyboardImpl activeInstance];
              v32 = [v23 autocorrectionController];

              id v24 = [MEMORY[0x1E4F1CA48] array];
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              id v25 = v10;
              uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
              if (v26)
              {
                uint64_t v27 = v26;
                uint64_t v28 = *(void *)v34;
                do
                {
                  for (uint64_t i = 0; i != v27; ++i)
                  {
                    if (*(void *)v34 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    v30 = +[UITextReplacementCandidate textReplacementCandidateForTextReplacement:*(void *)(*((void *)&v33 + 1) + 8 * i)];
                    [v24 addObject:v30];
                  }
                  uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
                }
                while (v27);
              }

              v31 = [MEMORY[0x1E4FAE278] listWithAutocorrection:0 predictions:v24];
              [v32 setAutocorrectionList:v31];
            }
          }
        }
        [(UITextSelectionView *)self _presentEditMenuWithPreferredDirection:a6 replacements:v10];
      }
    }
  }
}

uint64_t __98__UITextSelectionView__showCommandsWithReplacements_isForContextMenu_forDictation_arrowDirection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _isNoReplacementsFoundItem];
}

- (id)_editMenuSourceWindow
{
  uint64_t v3 = [(UIView *)self keyboardSceneDelegate];
  id v4 = [v3 containerWindow];

  BOOL v5 = [(UIView *)self window];
  int v6 = [v5 _isRemoteKeyboardWindow];

  if (v6)
  {
    uint64_t v7 = [(UIView *)self window];

    id v4 = (void *)v7;
  }
  return v4;
}

- (id)menuInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_interactionAssistant);
  uint64_t v3 = [WeakRetained _editMenuAssistant];
  id v4 = [v3 menuInteraction];

  return v4;
}

- (BOOL)_editMenuIsVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_interactionAssistant);
  uint64_t v3 = [WeakRetained _editMenuAssistant];
  char v4 = [v3 _editMenuIsVisible];

  return v4;
}

- (void)_presentEditMenuWithPreferredDirection:(int64_t)a3 replacements:(id)a4
{
  p_m_interactionAssistant = &self->m_interactionAssistant;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_m_interactionAssistant);
  uint64_t v7 = [WeakRetained _editMenuAssistant];
  [v7 _presentEditMenuWithPreferredDirection:a3 replacements:v6];
}

- (void)updateSelectionCommands
{
  if ([(UITextSelectionView *)self selectionCommandsShowing])
  {
    uint64_t v3 = [(UITextSelectionView *)self interactionAssistant];
    char v4 = [v3 view];

    if ([(UITextSelectionView *)self _viewUsesAsynchronousProtocol]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __46__UITextSelectionView_updateSelectionCommands__block_invoke;
      v6[3] = &unk_1E52DC698;
      v6[4] = self;
      [v4 requestPreferredArrowDirectionForEditMenuWithCompletionHandler:v6];
    }
    else
    {
      BOOL v5 = [(UITextSelectionView *)self replacements];
      [(UITextSelectionView *)self _updateEditMenuPositionForPreferredArrowDirection:0 replacements:v5];
    }
  }
}

void __46__UITextSelectionView_updateSelectionCommands__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if ((unint64_t)(a2 - 1) >= 4) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a2;
  }
  id v4 = [*(id *)(a1 + 32) replacements];
  [v2 _updateEditMenuPositionForPreferredArrowDirection:v3 replacements:v4];
}

- (void)cancelDelayedCommandRequests
{
  self->BOOL m_delayShowingCommands = 0;
  self->m_deferSelectionCommands = 0;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  id hideSelectionCommandsWorkItem = self->_hideSelectionCommandsWorkItem;
  if (hideSelectionCommandsWorkItem)
  {
    dispatch_block_cancel(hideSelectionCommandsWorkItem);
    id v4 = self->_hideSelectionCommandsWorkItem;
    self->_id hideSelectionCommandsWorkItem = 0;
  }
}

- (void)showCalloutBarAfterDelay:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_interactionAssistant);
  id v11 = [WeakRetained _editMenuAssistant];

  if (![v11 _editMenuDismissedRecently]
    || [v11 _editMenuDismissedByActionSelection])
  {
    [(UITextSelectionView *)self cancelDelayedCommandRequests];
    self->BOOL m_delayShowingCommands = 1;
    id v6 = [(UITextSelectionView *)self replacements];
    [(UITextSelectionView *)self _showCommandsWithReplacements:v6 forDictation:0 afterDelay:a3];

    uint64_t v7 = [(UITextSelectionView *)self replacements];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      if (self->m_dictationReplacementsMode) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = 2;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = [(UITextSelectionView *)self rangeView];
    [v10 setMode:v9];
  }
}

- (void)showSelectionCommandsAfterDelay:(double)a3
{
  BOOL v5 = [(UITextSelectionView *)self interactionAssistant];
  id v6 = [v5 textDocument];
  BOOL v7 = +[UIDictationController shouldHideSelectionUIForTextView:v6];

  if (!v7)
  {
    [(UITextSelectionView *)self setReplacements:0];
    [(UITextSelectionView *)self showCalloutBarAfterDelay:a3];
  }
}

- (void)showSelectionCommands
{
}

- (void)updateRangeViewForSelectionMode
{
  id v2 = [(UITextSelectionView *)self rangeView];
  [v2 setMode:0];
}

- (void)_showSelectionCommandsForContextMenu:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UITextSelectionView *)self interactionAssistant];
  id v6 = [v5 textDocument];
  BOOL v7 = +[UIDictationController shouldHideSelectionUIForTextView:v6];

  if (!v7)
  {
    uint64_t v8 = [(UITextSelectionView *)self selection];
    int v9 = [v8 isCommitting];

    if (v9)
    {
      [(UITextSelectionView *)self showCommandsWithReplacements:0];
    }
    else if (v3)
    {
      [(UITextSelectionView *)self _showCommandsWithReplacements:0 isForContextMenu:1 forDictation:self->m_dictationReplacementsMode arrowDirection:0];
    }
    else
    {
      [(UITextSelectionView *)self deferredUpdateSelectionCommands];
    }
    self->m_dictationReplacementsMode = 0;
    [(UITextSelectionView *)self updateRangeViewForSelectionMode];
  }
}

- (void)calculateReplacementsWithGenerator:(id)a3 andShowAfterDelay:(double)a4
{
  id v6 = [a3 replacements];
  if ([v6 count]) {
    [(UITextSelectionView *)self _showCommandsWithReplacements:v6 forDictation:0 afterDelay:a4];
  }
}

- (void)showReplacementsWithGenerator:(id)a3 forDictation:(BOOL)a4 afterDelay:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [(UITextSelectionView *)self cancelDelayedCommandRequests];
  self->m_dictationReplacementsMode = v6;
  if (v6)
  {
    char v9 = 0;
    uint64_t v10 = 3;
  }
  else
  {
    int v11 = [v8 isStringToReplaceMisspelled];
    char v9 = v11;
    if (v11) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  double v12 = [(UITextSelectionView *)self rangeView];
  [v12 setMode:v10];

  if ((v9 & 1) != 0 || v6)
  {
    char v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"UIKeyboardPredictionsAvailable" object:0];
  }
  int v14 = [(UITextSelectionView *)self interactionAssistant];
  id v15 = [v14 view];
  int v16 = [v15 conformsToProtocol:&unk_1ED700D60];

  if (v16)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    BOOL v23 = __77__UITextSelectionView_showReplacementsWithGenerator_forDictation_afterDelay___block_invoke;
    id v24 = &unk_1E52E3628;
    id v25 = self;
    id v26 = v8;
    uint64_t v17 = _Block_copy(&v21);
    id v18 = +[UIKeyboardImpl sharedInstance];
    int v19 = [v18 taskQueue];
    id v20 = (id)[v19 scheduleTask:v17 timeInterval:0 repeats:a5];
  }
  else
  {
    [(UITextSelectionView *)self calculateReplacementsWithGenerator:v8 andShowAfterDelay:a5];
  }
}

void __77__UITextSelectionView_showReplacementsWithGenerator_forDictation_afterDelay___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 calculateReplacementsWithGenerator:v3 andShowAfterDelay:0.0];
  [v4 returnExecutionToParent];
}

- (void)hideSelectionCommandsAfterDelay:(double)a3 reason:(int64_t)a4
{
  [(UITextSelectionView *)self cancelDelayedCommandRequests];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__UITextSelectionView_hideSelectionCommandsAfterDelay_reason___block_invoke;
  v12[3] = &unk_1E52D9CD0;
  v12[4] = self;
  v12[5] = a4;
  BOOL v7 = (void (**)(void))dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v12);
  id v8 = v7;
  if (a3 == 0.0)
  {
    v7[2](v7);
  }
  else
  {
    char v9 = _Block_copy(v7);
    id hideSelectionCommandsWorkItem = self->_hideSelectionCommandsWorkItem;
    self->_id hideSelectionCommandsWorkItem = v9;

    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_after(v11, MEMORY[0x1E4F14428], v8);
  }
}

uint64_t __62__UITextSelectionView_hideSelectionCommandsAfterDelay_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideSelectionCommandsWithReason:*(void *)(a1 + 40)];
}

- (void)hideSelectionCommands
{
}

- (void)_hideSelectionCommandsWithReason:(int64_t)a3
{
  [(UITextSelectionView *)self cancelDelayedCommandRequests];
  id v5 = [(UITextSelectionView *)self menuInteraction];
  [v5 dismissSelectionCommandsWithReason:a3];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(UITextSelectionView *)self dynamicCaret];

  if (!v8) {
    goto LABEL_3;
  }
  char v9 = [(UITextSelectionView *)self caretView];
  uint64_t v10 = [(UITextSelectionView *)self caretView];
  dispatch_time_t v11 = [v10 _window];
  objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
  objc_msgSend(v9, "convertPoint:fromView:", 0);
  double v13 = v12;
  double v15 = v14;

  int v16 = [(UITextSelectionView *)self caretView];
  uint64_t v17 = objc_msgSend(v16, "hitTest:withEvent:", v7, v13, v15);

  if (!v17)
  {
LABEL_3:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v18 = ![(UITextSelectionView *)self shouldSuppressSelectionHandles];
    }
    else {
      int v18 = 1;
    }
    int v19 = [(UITextSelectionView *)self selection];
    id v20 = [v19 selectedRange];
    if ([v20 _isRanged])
    {
      uint64_t v21 = [(UIView *)self->m_rangeView _window];
      if (!v21) {
        int v18 = 0;
      }

      if (v18 == 1)
      {
        m_rangeView = self->m_rangeView;
        BOOL v23 = [(UIView *)m_rangeView _window];
        objc_msgSend(v23, "convertPoint:fromView:", self, x, y);
        -[UIView convertPoint:fromView:](m_rangeView, "convertPoint:fromView:", 0);
        double v25 = v24;
        double v27 = v26;

        uint64_t v17 = -[UIView hitTest:withEvent:](self->m_rangeView, "hitTest:withEvent:", v7, v25, v27);
        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v17 = 0;
  }
LABEL_13:

  return v17;
}

- (void)configureForSelectionMode
{
  id v2 = [(UITextSelectionView *)self rangeView];
  [v2 setMode:0];
}

- (void)configureForHighlightMode
{
  id v2 = [(UITextSelectionView *)self rangeView];
  [v2 setMode:1];
}

- (void)configureForReplacementMode
{
  if (self->m_dictationReplacementsMode) {
    uint64_t v2 = 3;
  }
  else {
    uint64_t v2 = 2;
  }
  id v3 = [(UITextSelectionView *)self rangeView];
  [v3 setMode:v2];
}

- (void)configureForPencilHighlightMode
{
  id v2 = [(UITextSelectionView *)self rangeView];
  [v2 setMode:4];
}

- (void)configureForPencilDeletionPreviewMode
{
  id v2 = [(UITextSelectionView *)self rangeView];
  [v2 setMode:5];
}

- (BOOL)activeCaret
{
  return self->m_activeCaret;
}

- (void)clearCaret
{
  self->BOOL m_activeCaret = 0;
  [(UITextSelectionView *)self hideCaret:0];
  id v3 = [(UITextSelectionView *)self caretView];
  [v3 removeFromSuperview];

  if (self->m_caretAnimating)
  {
    [(UITextSelectionView *)self endFloatingCursor];
  }
}

- (void)_hideCaret:(int)a3
{
  switch(a3)
  {
    case 2:
      if (!self->m_caretShowingNow) {
        break;
      }
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      char v9 = __34__UITextSelectionView__hideCaret___block_invoke_2;
      uint64_t v10 = &unk_1E52D9F70;
      dispatch_time_t v11 = self;
      double v5 = 0.15;
      BOOL v6 = &v7;
LABEL_9:
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 117440512, v6, 0, v5, 0.0, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
      break;
    case 1:
      if (!self->m_caretShowingNow) {
        break;
      }
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      double v14 = __34__UITextSelectionView__hideCaret___block_invoke;
      double v15 = &unk_1E52D9F70;
      int v16 = self;
      double v5 = 0.25;
      BOOL v6 = &v12;
      goto LABEL_9;
    case 0:
      id v4 = [(UITextSelectionView *)self caretView];
      [v4 setAlpha:0.0];

      break;
  }
  self->m_caretShowingNow = 0;
}

void __34__UITextSelectionView__hideCaret___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) caretView];
  [v1 setAlpha:0.0];
}

void __34__UITextSelectionView__hideCaret___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) caretView];
  [v1 setAlpha:0.0];
}

- (void)animateBoxShrinkOn:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 frame];
  double v5 = v4;
  BOOL v6 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v6 setFrameInterval:0.0166666667];
  [v6 setDuration:0.125];
  [v6 setFillMode:*MEMORY[0x1E4F39FA0]];
  uint64_t v7 = [v6 keyPath];
  [v3 addAnimation:v6 forKey:v7];

  LODWORD(v8) = 1.0;
  [v3 setOpacity:v8];
  char v9 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds.size.width"];
  [v9 setFrameInterval:0.0166666667];
  [v9 setDuration:0.125];
  uint64_t v10 = *MEMORY[0x1E4F39F98];
  [v9 setFillMode:*MEMORY[0x1E4F39F98]];
  dispatch_time_t v11 = [NSNumber numberWithDouble:v5 * 7.0];
  v20[0] = v11;
  uint64_t v12 = [NSNumber numberWithDouble:v5];
  v20[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v9 setValues:v13];

  double v14 = [v9 keyPath];
  [v3 addAnimation:v9 forKey:v14];

  double v15 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"position.x"];
  [v15 setFrameInterval:0.0166666667];
  [v15 setDuration:0.125];
  [v15 setFillMode:v10];
  int v16 = [NSNumber numberWithDouble:v5 * 7.0 * 0.5];
  v19[0] = v16;
  v19[1] = &unk_1ED3F6D20;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [v15 setValues:v17];

  [v15 setAdditive:1];
  int v18 = [v15 keyPath];
  [v3 addAnimation:v15 forKey:v18];
}

- (void)animateExpanderOn:(id)a3
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  uint64_t v28 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v28 setFrameInterval:0.0166666667];
  [v28 setDuration:0.125];
  uint64_t v8 = *MEMORY[0x1E4F39F98];
  [v28 setFillMode:*MEMORY[0x1E4F39F98]];
  [v28 setValues:&unk_1ED3F1408];
  char v9 = [v28 keyPath];
  [v3 addAnimation:v28 forKey:v9];

  LODWORD(v10) = 1.0;
  [v3 setOpacity:v10];
  dispatch_time_t v11 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds.size.width"];
  [v11 setFrameInterval:0.0166666667];
  uint64_t v12 = *MEMORY[0x1E4F39D70];
  [v11 setCalculationMode:*MEMORY[0x1E4F39D70]];
  [v11 setDuration:0.300000012];
  [v11 setFillMode:v8];
  [v11 setKeyTimes:&unk_1ED3F1420];
  uint64_t v13 = [NSNumber numberWithDouble:v5];
  v30[0] = v13;
  double v14 = [NSNumber numberWithDouble:v5 * 3.5];
  v30[1] = v14;
  double v15 = [NSNumber numberWithDouble:v5 * 0.5];
  v30[2] = v15;
  int v16 = [NSNumber numberWithDouble:v5];
  v30[3] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  [v11 setValues:v17];

  int v18 = [v11 keyPath];
  [v3 addAnimation:v11 forKey:v18];

  int v19 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"bounds.size.height"];
  [v19 setFrameInterval:0.0166666667];
  [v19 setCalculationMode:v12];
  [v19 setDuration:0.300000012];
  [v19 setFillMode:v8];
  [v19 setKeyTimes:&unk_1ED3F1438];
  id v20 = [NSNumber numberWithDouble:v7 * 0.1];
  v29[0] = v20;
  uint64_t v21 = [NSNumber numberWithDouble:v7 * 1.25];
  v29[1] = v21;
  uint64_t v22 = [NSNumber numberWithDouble:v7 * 0.75];
  v29[2] = v22;
  BOOL v23 = [NSNumber numberWithDouble:v7];
  v29[3] = v23;
  double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v19 setValues:v24];

  double v25 = [v19 keyPath];
  [v3 addAnimation:v19 forKey:v25];

  double v26 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v26 setFrameInterval:0.0166666667];
  [v26 setDuration:0.600000024];
  [v26 setFillMode:v8];
  [v26 setValues:&unk_1ED3F1450];
  [v26 setKeyTimes:&unk_1ED3F1468];
  [v26 setBeginTime:0.0925];
  double v27 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v26 setTimingFunction:v27];

  [v3 addAnimation:v26 forKey:@"opacity2"];
}

- (void)showInitialCaret
{
  if ([(UITextSelectionView *)self visible] && !self->m_caretAnimating && self->m_caretVisible)
  {
    id v3 = [(UIView *)self keyboardSceneDelegate];
    double v4 = [v3 containerWindow];
    int v5 = [v4 _isFullscreen];

    if (v5)
    {
      [(UITextSelectionView *)self showCaret:0];
    }
    else
    {
      [(UITextSelectionView *)self _setCaretBlinkAnimationEnabled:self->m_caretBlinks];
      self->BOOL m_activeCaret = 1;
    }
  }
}

- (void)showCaret:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(UITextSelectionView *)self visible] && !self->m_caretAnimating && self->m_caretVisible)
  {
    [(UITextSelectionView *)self _showCaret:v3];
  }
}

- (void)_showCaret:(int)a3
{
  switch(a3)
  {
    case 2:
      if (self->m_caretShowingNow) {
        break;
      }
      uint64_t v6 = MEMORY[0x1E4F143A8];
      uint64_t v7 = 3221225472;
      uint64_t v8 = __34__UITextSelectionView__showCaret___block_invoke_2;
      char v9 = &unk_1E52D9F70;
      double v10 = self;
      int v5 = &v6;
LABEL_9:
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 117440512, v5, 0, 0.15, 0.0, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
      break;
    case 1:
      if (self->m_caretShowingNow) {
        break;
      }
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      uint64_t v13 = __34__UITextSelectionView__showCaret___block_invoke;
      double v14 = &unk_1E52D9F70;
      double v15 = self;
      int v5 = &v11;
      goto LABEL_9;
    case 0:
      double v4 = [(UITextSelectionView *)self caretView];
      [v4 setAlpha:1.0];

      break;
  }
  self->m_caretShowingNow = 1;
  self->BOOL m_activeCaret = 1;
}

void __34__UITextSelectionView__showCaret___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) caretView];
  [v1 setAlpha:1.0];
}

void __34__UITextSelectionView__showCaret___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) caretView];
  [v1 setAlpha:1.0];
}

- (void)_setCaretBlinkAnimationEnabled:(BOOL)a3
{
  if (a3 && [(UITextSelectionView *)self visible])
  {
    if (!self->_caretBlinkAnimation)
    {
      double v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
      caretBlinkAnimation = self->_caretBlinkAnimation;
      self->_caretBlinkAnimation = v4;

      [(CAKeyframeAnimation *)self->_caretBlinkAnimation setCalculationMode:*MEMORY[0x1E4F39D78]];
      [(CAKeyframeAnimation *)self->_caretBlinkAnimation setValues:&unk_1ED3F1480];
      [(CAKeyframeAnimation *)self->_caretBlinkAnimation setKeyTimes:&unk_1ED3F1498];
      [(CAKeyframeAnimation *)self->_caretBlinkAnimation setDuration:1.0];
      LODWORD(v6) = 2139095039;
      [(CAKeyframeAnimation *)self->_caretBlinkAnimation setRepeatCount:v6];
    }
    double v10 = [(UIView *)self->m_caretView layer];
    [(CAKeyframeAnimation *)v10 addAnimation:self->_caretBlinkAnimation forKey:@"UITextSelectionViewCaretBlinkAnimation"];
    uint64_t v7 = v10;
  }
  else
  {
    if (!self->_caretBlinkAnimation) {
      return;
    }
    uint64_t v8 = [(UIView *)self->m_floatingCaretView layer];
    [v8 removeAnimationForKey:@"UITextSelectionViewCaretBlinkAnimation"];

    char v9 = [(UIView *)self->m_caretView layer];
    [v9 removeAnimationForKey:@"UITextSelectionViewCaretBlinkAnimation"];

    uint64_t v7 = self->_caretBlinkAnimation;
    self->_caretBlinkAnimation = 0;
  }
}

- (id)ghostCaretViewColor
{
  return +[UIColor colorWithDynamicProvider:&__block_literal_global_417_0];
}

id __42__UITextSelectionView_ghostCaretViewColor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userInterfaceStyle];
  double v3 = 0.0;
  if (v2 == 2) {
    double v3 = 1.0;
  }
  double v4 = +[UIColor colorWithWhite:v3 alpha:0.3];
  return v4;
}

- (id)caretViewColor
{
  if (self->m_ghostApperarance)
  {
    double v3 = [(UITextSelectionView *)self ghostCaretViewColor];
  }
  else
  {
    double v4 = [(UITextSelectionView *)self interactionAssistant];
    int v5 = [v4 view];
    if (objc_opt_respondsToSelector())
    {
      double v6 = [(UITextSelectionView *)self interactionAssistant];
      uint64_t v7 = [v6 view];
      double v3 = [v7 insertionPointColor];
    }
    else
    {
      double v3 = +[UIColor insertionPointColor];
    }
  }
  return v3;
}

- (void)addCaretToSubview
{
  id v3 = [(UITextSelectionView *)self caretView];
  [(UIView *)self addSubview:v3];
}

- (UIView)caretView
{
  if (!self->m_caretView)
  {
    if (_UIDeviceHasExternalTouchInput() && ([(id)UIApp _overridesDynamicCaret] & 1) == 0)
    {
      uint64_t v8 = [UIDynamicCaret alloc];
      char v9 = -[UIDynamicCaret initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      m_caretView = self->m_caretView;
      self->m_caretView = v9;

      [(UIView *)self setUserInteractionEnabled:1];
    }
    else
    {
      id v3 = [UIView alloc];
      double v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      int v5 = self->m_caretView;
      self->m_caretView = v4;

      [(UIView *)self->m_caretView setUserInteractionEnabled:0];
      double v6 = [(UITextSelectionView *)self caretViewColor];
      [(UIView *)self->m_caretView setBackgroundColor:v6];

      [(UIView *)self->m_caretView setAlpha:0.0];
      uint64_t v7 = [(UIView *)self->m_caretView layer];
      [v7 setCornerRadius:1.0];
    }
  }
  uint64_t v11 = self->m_caretView;
  return v11;
}

- (BOOL)point:(CGPoint)a3 isNearCursorRect:(CGRect)a4
{
  BOOL v4 = vabdd_f64(a4.origin.x + a4.size.width * 0.5, a3.x) < 15.0;
  return vabdd_f64(a4.origin.y + a4.size.height * 0.5, a3.y) < 30.0 && v4;
}

- (void)beginFloatingCaretView
{
  id v3 = [UIView alloc];
  BOOL v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIView *)v4 setUserInteractionEnabled:0];
  int v5 = [(UITextSelectionView *)self ghostCaretViewColor];
  [(UIView *)v4 setBackgroundColor:v5];

  double v6 = [(UIView *)v4 layer];
  [v6 setCornerRadius:1.0];

  uint64_t v7 = [(UITextSelectionView *)self caretView];
  uint64_t v8 = [v7 superview];

  if (v8)
  {
    [(UIView *)self->m_caretView frame];
    -[UIView setFrame:](v4, "setFrame:");
    char v9 = [(UIView *)self->m_caretView layer];
    [v9 cornerRadius];
    double v11 = v10;
    uint64_t v12 = [(UIView *)v4 layer];
    [v12 setCornerRadius:v11];

    [(UIView *)self addSubview:v4];
  }
  p_m_floatingCaretView = &self->m_floatingCaretView;
  [(UIView *)self->m_floatingCaretView removeFromSuperview];
  objc_storeStrong((id *)&self->m_floatingCaretView, self->m_caretView);
  m_caretView = self->m_caretView;
  self->m_caretView = v4;
  double v15 = v4;

  int v16 = [(UITextSelectionView *)self floatingCaretView];
  uint64_t v17 = [v16 superview];

  if (!v17)
  {
    int v18 = [(UITextSelectionView *)self selection];
    int v19 = [v18 selectedRange];
    id v20 = [v19 start];

    if (v20)
    {
      uint64_t v21 = [(UITextSelectionView *)self selection];
      uint64_t v22 = [v21 document];
      [v22 caretRectForPosition:v20];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;

      v31 = [(UITextSelectionView *)self floatingCaretView];
      objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

      v32 = [(UITextSelectionView *)self floatingCaretView];
      long long v33 = [v32 layer];
      [v33 setCornerRadius:v28 * 0.5];
    }
    long long v34 = [(UITextSelectionView *)self floatingCaretView];
    [(UIView *)self addSubview:v34];
  }
  long long v35 = [(UITextSelectionView *)self floatingCaretViewColor];
  [(UIView *)*p_m_floatingCaretView setBackgroundColor:v35];

  [(UIView *)*p_m_floatingCaretView bounds];
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
  id v36 = objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [v36 CGPath];
  uint64_t v38 = [(UIView *)*p_m_floatingCaretView layer];
  [v38 setShadowPath:v37];

  id v39 = +[UIColor colorWithRed:0.274509804 green:0.431372549 blue:0.725490196 alpha:1.0];
  uint64_t v40 = [v39 CGColor];
  double v41 = [(UIView *)*p_m_floatingCaretView layer];
  [v41 setShadowColor:v40];

  double v42 = [(UIView *)*p_m_floatingCaretView layer];
  objc_msgSend(v42, "setShadowOffset:", 0.0, 10.0);

  double v43 = [(UIView *)*p_m_floatingCaretView layer];
  [v43 setShadowRadius:3.0];

  id v45 = [(UIView *)*p_m_floatingCaretView layer];

  LODWORD(v44) = 1051931443;
  [v45 setShadowOpacity:v44];
}

- (void)animatePulsingIndirectCaret:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F39C90];
  id v4 = a3;
  id v8 = [v3 animationWithKeyPath:@"transform.scale"];
  [v8 setFrameInterval:0.0166666667];
  uint64_t v5 = *MEMORY[0x1E4F39F98];
  [v8 setFillMode:*MEMORY[0x1E4F39F98]];
  [v8 setFromValue:&unk_1ED3F6D20];
  [v8 setToValue:&unk_1ED3F2748];
  [v8 setAdditive:1];
  [v8 setMass:1.0];
  [v8 setStiffness:734.0];
  [v8 setDamping:33.0];
  double v6 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale"];
  [v6 setFrameInterval:0.0166666667];
  [v6 setFillMode:v5];
  [v6 setFromValue:&unk_1ED3F6D20];
  [v6 setToValue:&unk_1ED3F27F8];
  [v6 setAdditive:1];
  [v6 setMass:1.0];
  [v6 setStiffness:155.0];
  [v6 setDamping:14.0];
  [v6 settlingDuration];
  objc_msgSend(v6, "setDuration:");
  [v6 setBeginTime:CACurrentMediaTime() + 0.12];
  [v6 settlingDuration];
  [v8 setDuration:v7 + 0.12];
  [v4 addAnimation:v6 forKey:0];
  [v4 addAnimation:v8 forKey:0];
}

- (void)animatePulsingDirectCaret:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  double v5 = v4;
  [v3 bounds];
  double v7 = v6;
  id v12 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"bounds"];
  [v12 setFillMode:*MEMORY[0x1E4F39F98]];
  id v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v7, v5);
  [v12 setFromValue:v8];

  double v9 = v7 * 1.5;
  double v10 = v5 * 1.8;
  double v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v9, v10);
  [v12 setToValue:v11];

  [v12 setMass:1.0];
  [v12 setStiffness:300.0];
  [v12 setDamping:25.82];
  [v12 settlingDuration];
  objc_msgSend(v12, "setDuration:");
  [v3 addAnimation:v12 forKey:@"bounds"];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v9, v10);

  [MEMORY[0x1E4F39CF8] setDisableActions:0];
}

- (void)willBeginFloatingCursor:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self->m_caretView frame];
  -[UITextSelectionView setStashedCaretRect:](self, "setStashedCaretRect:");
  [(UIView *)self->m_caretView frame];
  -[UITextSelectionView setPreviousGhostCaretRect:](self, "setPreviousGhostCaretRect:");
  [(UITextSelectionView *)self setIsIndirectFloatingCaret:v3];
}

- (BOOL)_shouldUseIndirectFloatingCaret
{
  [(UIView *)self->m_caretView frame];
  return v2 > 40.0;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UITextSelectionView *)self selection];
  double v7 = [v6 selectedRange];

  if (!v7) {
    return;
  }
  id v8 = [(UITextSelectionView *)self floatingCaretView];
  if (v8)
  {
    BOOL m_caretAnimating = self->m_caretAnimating;

    if (m_caretAnimating) {
      return;
    }
  }
  double v10 = [(UITextSelectionView *)self caretView];
  [v10 frame];
  IsEmptdouble y = CGRectIsEmpty(v21);

  if (IsEmpty) {
    [(UITextSelectionView *)self updateSelectionRects];
  }
  [(UITextSelectionView *)self hideSelectionCommands];
  [(UITextSelectionView *)self showCaret:0];
  self->BOOL m_caretAnimating = 1;
  id v12 = [(UITextSelectionView *)self interactionAssistant];
  uint64_t v13 = [v12 _assertionController];
  double v14 = [v13 nonBlinkingAssertionWithReason:@"Floating cursor"];
  id floatingCaretBlinkAssertion = self->_floatingCaretBlinkAssertion;
  self->_id floatingCaretBlinkAssertion = v14;

  [(UITextSelectionView *)self beginFloatingCaretView];
  int v16 = [(UITextSelectionView *)self selection];
  if (![v16 granularity])
  {

    goto LABEL_11;
  }
  BOOL m_shouldEmphasizeNextSelectionRects = self->m_shouldEmphasizeNextSelectionRects;

  if (!m_shouldEmphasizeNextSelectionRects)
  {
LABEL_11:
    [MEMORY[0x1E4F39CF8] begin];
    if ([(UITextSelectionView *)self isIndirectFloatingCaret]
      || [(UITextSelectionView *)self _shouldUseIndirectFloatingCaret])
    {
      int v18 = [(UITextSelectionView *)self floatingCaretView];
      int v19 = [v18 layer];
      [(UITextSelectionView *)self animatePulsingIndirectCaret:v19];
    }
    [MEMORY[0x1E4F39CF8] commit];
  }
  -[UITextSelectionView updateFloatingCursorAtPoint:](self, "updateFloatingCursorAtPoint:", x, y);
}

- (CGPoint)floatingCursorPositionForPoint:(CGPoint)a3
{
  -[UITextSelectionView floatingCursorPositionForPoint:lineSnapping:](self, "floatingCursorPositionForPoint:lineSnapping:", 1, a3.x, a3.y);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)floatingCursorPositionForPoint:(CGPoint)a3 lineSnapping:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = [(UITextSelectionView *)self interactionAssistant];
  double v9 = [v8 view];
  char v10 = objc_opt_respondsToSelector();

  double v11 = [(UITextSelectionView *)self interactionAssistant];
  id v12 = [v11 view];
  uint64_t v13 = v12;
  if (v10)
  {
    [v12 _selectionClipRect];
LABEL_5:
    double v19 = v14;
    double v20 = v15;
    double v21 = v16;
    double v22 = v17;

    goto LABEL_7;
  }
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    double v11 = [(UITextSelectionView *)self interactionAssistant];
    uint64_t v13 = [v11 view];
    [v13 selectionClipRect];
    goto LABEL_5;
  }
  double v19 = *MEMORY[0x1E4F1DB20];
  double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_7:
  v56.origin.double x = v19;
  v56.origin.double y = v20;
  v56.size.double width = v21;
  v56.size.double height = v22;
  if (CGRectIsNull(v56))
  {
    double v23 = [(UITextSelectionView *)self interactionAssistant];
    double v24 = [v23 view];
    double v25 = [v24 textInputView];
    [v25 bounds];
    double v19 = v26;
    double v20 = v27;
    double v21 = v28;
    double v22 = v29;
  }
  double v30 = [(UITextSelectionView *)self interactionAssistant];
  v31 = [v30 view];
  v32 = [v31 textInputView];
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v32, v19, v20, v21, v22);
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  double v41 = [(UITextSelectionView *)self floatingCaretView];
  [v41 size];
  double v43 = v42 * 0.5;

  double v44 = [(UITextSelectionView *)self floatingCaretView];
  [v44 size];
  double v46 = v45 * 0.5;

  double v47 = v38 - (v43 + v43);
  double v48 = v40 - (v46 + v46);
  if (v47 >= 0.0)
  {
    if (x >= v34 + v43)
    {
      double v49 = v34 + v43 + v47;
      if (x > v49) {
        double x = v49;
      }
    }
    else
    {
      double x = v34 + v43;
    }
  }
  if (v48 >= 0.0)
  {
    if (y >= v36 + v46)
    {
      double v50 = v36 + v46 + v48;
      if (y > v50) {
        double y = v50;
      }
    }
    else
    {
      double y = v36 + v46;
    }
  }
  if (v4)
  {
    [(UIView *)self->m_caretView frame];
    double y = v52 + v51 * 0.5 + (y - (v52 + v51 * 0.5)) * 0.3;
  }
  double v53 = x;
  double v54 = y;
  result.double y = v54;
  result.double x = v53;
  return result;
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->BOOL m_caretAnimating = 1;
  -[UITextSelectionView floatingCursorPositionForPoint:](self, "floatingCursorPositionForPoint:", a3.x, a3.y);
  double v7 = v6;
  double v9 = v8;
  char v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v11 = [v10 preferencesActions];
  int v12 = [v11 BOOLForPreferenceKey:@"YukonMagnifiersDisabled"];

  if (v12)
  {
    [(UIView *)self->m_caretView frame];
    if (-[UITextSelectionView point:isNearCursorRect:](self, "point:isNearCursorRect:", v7, v9, v13, v14, v15, v16))
    {
      if (self->m_caretShowingNow) {
        [(UITextSelectionView *)self _hideCaret:2];
      }
    }
    else if (!self->m_caretShowingNow)
    {
      [(UITextSelectionView *)self _showCaret:2];
    }
    [(UITextSelectionView *)self previousGhostCaretRect];
    CGRectGetMidY(v22);
    if (v4)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __60__UITextSelectionView_updateFloatingCursorAtPoint_animated___block_invoke;
      void v20[3] = &unk_1E52DD178;
      v20[4] = self;
      *(double *)&v20[5] = v7;
      *(double *)&v20[6] = v9;
      +[UIView _animateUsingDefaultDampedSpringWithDelay:4 initialSpringVelocity:v20 options:&__block_literal_global_439_0 animations:0.0 completion:0.0];
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      void v19[2] = __60__UITextSelectionView_updateFloatingCursorAtPoint_animated___block_invoke_3;
      v19[3] = &unk_1E52DD178;
      v19[4] = self;
      *(double *)&v19[5] = v7;
      *(double *)&v19[6] = v9;
      +[UIView performWithoutAnimation:v19];
    }
    [(UIView *)self->m_caretView frame];
    -[UITextSelectionView setPreviousGhostCaretRect:](self, "setPreviousGhostCaretRect:");
  }
  else
  {
    id v18 = [(UITextSelectionView *)self floatingCaretView];
    double v17 = [v18 layer];
    objc_msgSend(v17, "setPosition:", v7, v9);
  }
}

void __60__UITextSelectionView_updateFloatingCursorAtPoint_animated___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) floatingCaretView];
  objc_msgSend(v3, "setCenter:", v1, v2);
}

void __60__UITextSelectionView_updateFloatingCursorAtPoint_animated___block_invoke_3(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) floatingCaretView];
  objc_msgSend(v3, "setCenter:", v1, v2);
}

- (void)animateCaret:(id)a3 toPosition:(CGPoint)a4 withSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  double v9 = (void *)MEMORY[0x1E4F39C10];
  id v10 = a3;
  LODWORD(v11) = 1048911544;
  LODWORD(v12) = 1054615798;
  LODWORD(v13) = 1065520988;
  id v28 = [v9 functionWithControlPoints:v11 :0.0 :v12 :v13];
  double v14 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position"];
  [v14 setFrameInterval:0.0166666667];
  [v14 setDuration:0.15];
  [v14 setTimingFunction:v28];
  double v15 = (void *)MEMORY[0x1E4F29238];
  [v10 position];
  double v16 = objc_msgSend(v15, "valueWithCGPoint:");
  [v14 setFromValue:v16];

  double v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
  [v14 setToValue:v17];

  id v18 = [v14 keyPath];
  [v10 addAnimation:v14 forKey:v18];

  objc_msgSend(v10, "setPosition:", x, y);
  [v10 bounds];
  double v20 = v19;
  double v22 = v21;
  double v23 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
  [v23 setFrameInterval:0.0166666667];
  [v23 setDuration:0.15];
  [v23 setTimingFunction:v28];
  double v24 = (void *)MEMORY[0x1E4F29238];
  [v10 bounds];
  double v25 = objc_msgSend(v24, "valueWithCGRect:");
  [v23 setFromValue:v25];

  double v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v20, v22, width, height);
  [v23 setToValue:v26];

  double v27 = [v23 keyPath];
  [v10 addAnimation:v23 forKey:v27];

  objc_msgSend(v10, "setBounds:", v20, v22, width, height);
}

- (void)endFloatingCaretView
{
  id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  BOOL v4 = [v3 preferencesActions];
  int v5 = [v4 BOOLForPreferenceKey:@"YukonMagnifiersDisabled"];

  if (v5 && !self->m_caretShowingNow) {
    [(UITextSelectionView *)self showCaret:2];
  }
  double v6 = [(UITextSelectionView *)self caretViewColor];
  [(UIView *)self->m_floatingCaretView setBackgroundColor:v6];

  double v7 = [(UIView *)self->m_floatingCaretView layer];
  [v7 setShadowColor:0];

  double v8 = [(UIView *)self->m_floatingCaretView layer];
  [v8 setShadowPath:0];

  double v9 = [(UIView *)self->m_floatingCaretView layer];
  [v9 setShadowOpacity:0.0];

  [(UIView *)self->m_caretView removeFromSuperview];
  objc_storeStrong((id *)&self->m_caretView, self->m_floatingCaretView);
  m_floatingCaretView = self->m_floatingCaretView;
  self->m_floatingCaretView = 0;
}

- (void)endFloatingCursor
{
  id floatingCaretBlinkAssertion = self->_floatingCaretBlinkAssertion;
  self->_id floatingCaretBlinkAssertion = 0;

  BOOL v4 = [(UITextSelectionView *)self caretView];
  int v5 = [v4 superview];

  if (v5)
  {
    [MEMORY[0x1E4F39CF8] begin];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __40__UITextSelectionView_endFloatingCursor__block_invoke;
    v16[3] = &unk_1E52D9F70;
    v16[4] = self;
    [MEMORY[0x1E4F39CF8] setCompletionBlock:v16];
    double v6 = [(UITextSelectionView *)self floatingCaretView];
    double v7 = [v6 layer];
    double v8 = [(UITextSelectionView *)self caretView];
    double v9 = [v8 layer];
    [v9 position];
    double v11 = v10;
    double v13 = v12;
    double v14 = [(UITextSelectionView *)self caretView];
    [v14 bounds];
    [(UITextSelectionView *)self animateCaret:v7 toPosition:v11 withSize:v13];

    [MEMORY[0x1E4F39CF8] commit];
  }
  else
  {
    double v15 = [(UITextSelectionView *)self floatingCaretView];
    [v15 removeFromSuperview];

    self->BOOL m_caretAnimating = 0;
  }
  [(UITextSelectionView *)self endFloatingCaretView];
}

uint64_t __40__UITextSelectionView_endFloatingCursor__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 450) = 0;
  return result;
}

- (id)obtainGrabberSuppressionAssertion
{
  ++self->_activeGrabberSuppressionAssertions;
  double v2 = [[UITextSelectionGrabberSuppressionAssertion alloc] initWithSelectionView:self];
  return v2;
}

- (BOOL)shouldSuppressSelectionHandles
{
  return self->_activeGrabberSuppressionAssertions != 0;
}

- (void)releaseGrabberHandleSuppressionAssertion:(id)a3
{
  unint64_t activeGrabberSuppressionAssertions = self->_activeGrabberSuppressionAssertions;
  if (activeGrabberSuppressionAssertions)
  {
    self->_unint64_t activeGrabberSuppressionAssertions = activeGrabberSuppressionAssertions - 1;
    dispatch_time_t v5 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__UITextSelectionView_releaseGrabberHandleSuppressionAssertion___block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
  }
}

void __64__UITextSelectionView_releaseGrabberHandleSuppressionAssertion___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) shouldSuppressSelectionHandles] & 1) == 0)
  {
    double v2 = [*(id *)(a1 + 32) rangeView];
    int v3 = [v2 areSelectionRectsVisible];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) rangeView];
      [v4 updateGrabbers];
    }
  }
}

- (id)dynamicCaret
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    m_caretView = self->m_caretView;
  }
  else {
    m_caretView = 0;
  }
  return m_caretView;
}

- (id)dynamicCaretList
{
  if ([(UIView *)self->m_caretView conformsToProtocol:&unk_1ED5A2B70]) {
    int v3 = self->m_caretView;
  }
  else {
    int v3 = 0;
  }
  return v3;
}

- (void)updateDocumentHasContent:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIView *)self->m_caretView conformsToProtocol:&unk_1ED669520])
  {
    m_caretView = self->m_caretView;
    [(UIView *)m_caretView setDocumentHasContent:v3];
  }
}

- (UITextRangeView)rangeView
{
  m_rangeView = self->m_rangeView;
  if (!m_rangeView)
  {
    id v4 = [UITextRangeView alloc];
    dispatch_time_t v5 = -[UITextRangeView initWithFrame:selectionView:](v4, "initWithFrame:selectionView:", self, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = self->m_rangeView;
    self->m_rangeView = v5;

    m_rangeView = self->m_rangeView;
  }
  return m_rangeView;
}

- (UITextSelection)selection
{
  double v2 = [(UITextSelectionView *)self interactionAssistant];
  BOOL v3 = [v2 activeSelectionController];
  id v4 = [v3 selection];

  return (UITextSelection *)v4;
}

- (CGRect)selectionBoundingBox
{
  BOOL v3 = [(UITextSelectionView *)self selection];
  id v4 = [v3 selectedRange];
  char v5 = [v4 _isRanged];

  if (v5)
  {
    double v6 = [(UITextRangeView *)self->m_rangeView rects];
    [(UITextSelectionView *)self selectionBoundingBoxForRects:v6];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)selectionBoundingBoxForRects:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  *(void *)double v41 = *MEMORY[0x1E4F1DB28];
  *(void *)&v41[8] = *(void *)(MEMORY[0x1E4F1DB28] + 8);
  *(void *)&v41[16] = *(void *)(MEMORY[0x1E4F1DB28] + 16);
  *(void *)&v41[24] = *(void *)(MEMORY[0x1E4F1DB28] + 24);
  char v5 = [(UITextSelectionView *)self interactionAssistant];
  double v6 = [v5 view];
  double v7 = [v6 textInputView];
  [v7 visibleBounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    int v19 = 0;
    uint64_t v20 = *(void *)v43;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v43 != v20) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * v21), "rect", *(void *)v41, *(void *)&v41[8], *(void *)&v41[16], *(void *)&v41[24], (void)v42);
        double x = v48.origin.x;
        double y = v48.origin.y;
        double width = v48.size.width;
        double height = v48.size.height;
        v52.origin.double x = v9;
        v52.origin.double y = v11;
        v52.size.double width = v13;
        v52.size.double height = v15;
        CGRect v49 = CGRectIntersection(v48, v52);
        if (!CGRectIsNull(v49))
        {
          double v26 = [(UITextSelectionView *)self interactionAssistant];
          double v27 = [v26 view];
          id v28 = [v27 textInputView];
          objc_msgSend(v28, "convertRect:toView:", self, x, y, width, height);
          CGFloat v30 = v29;
          CGFloat v32 = v31;
          CGFloat v34 = v33;
          CGFloat v36 = v35;

          if (v19)
          {
            v53.origin.double x = v30;
            v53.origin.double y = v32;
            v53.size.double width = v34;
            v53.size.double height = v36;
            CGRect v50 = CGRectUnion(*(CGRect *)v41, v53);
            CGFloat v30 = v50.origin.x;
            CGFloat v32 = v50.origin.y;
            CGFloat v34 = v50.size.width;
            CGFloat v36 = v50.size.height;
          }
          ++v19;
          *(CGFloat *)&v41[16] = v34;
          *(CGFloat *)&v41[24] = v36;
          *(CGFloat *)double v41 = v30;
          *(CGFloat *)&v41[8] = v32;
        }
        ++v21;
      }
      while (v18 != v21);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v18);
  }

  double v37 = *(double *)v41;
  double v38 = *(double *)&v41[8];
  double v39 = *(double *)&v41[16];
  double v40 = *(double *)&v41[24];
  result.size.double height = v40;
  result.size.double width = v39;
  result.origin.double y = v38;
  result.origin.double x = v37;
  return result;
}

- (void)layoutChangedByScrolling:(BOOL)a3
{
  [(UITextSelectionView *)self updateSelectionRects];
  [(UITextSelectionView *)self updateSelectionCommands];
}

- (void)prepareForMagnification
{
  BOOL v3 = [(UITextSelectionView *)self rangeView];
  id v4 = [v3 superview];

  if (v4)
  {
    id v5 = [(UITextSelectionView *)self rangeView];
    [v5 prepareForMagnification];
  }
}

- (void)doneMagnifying
{
  BOOL v3 = [(UITextSelectionView *)self rangeView];
  id v4 = [v3 superview];

  if (v4)
  {
    id v5 = [(UITextSelectionView *)self rangeView];
    [v5 doneMagnifying];
  }
}

- (void)scaleWillChange:(id)a3
{
  id v12 = a3;
  BOOL v4 = [(UITextSelectionView *)self affectedByScrollerNotification:v12];
  id v5 = v12;
  if (v4)
  {
    uint64_t v6 = [v12 userInfo];
    if (!v6) {
      goto LABEL_4;
    }
    double v7 = (void *)v6;
    double v8 = [v12 userInfo];
    CGFloat v9 = [v8 objectForKey:@"UITextSelectionZoomScaleDidChange"];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
LABEL_4:
      self->m_wasShowingCommands |= [(UITextSelectionView *)self selectionCommandsShowing];
      [(UITextSelectionView *)self hideSelectionCommands];
    }
    CGFloat v11 = [(UIView *)self->m_rangeView superview];

    id v5 = v12;
    if (v11)
    {
      [(UITextRangeView *)self->m_rangeView scaleWillChange];
      id v5 = v12;
    }
  }
}

- (void)scaleDidChange:(id)a3
{
  id v15 = a3;
  BOOL v4 = [(UITextSelectionView *)self affectedByScrollerNotification:v15];
  id v5 = v15;
  if (v4)
  {
    uint64_t v6 = [v15 userInfo];
    if (!v6) {
      goto LABEL_4;
    }
    double v7 = (void *)v6;
    double v8 = [v15 userInfo];
    CGFloat v9 = [v8 objectForKey:@"UITextSelectionZoomScaleDidChange"];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
LABEL_4:
      CGFloat v11 = [(UITextSelectionView *)self selection];
      id v12 = [v11 selectedRange];
      int v13 = [v12 _isRanged];

      if (v13 && self->m_wasShowingCommands) {
        [(UITextSelectionView *)self showCalloutBarAfterDelay:0.1];
      }
      self->m_wasShowingCommands = 0;
    }
    double v14 = [(UIView *)self->m_rangeView superview];

    id v5 = v15;
    if (v14)
    {
      [(UITextRangeView *)self->m_rangeView scaleDidChange];
      id v5 = v15;
    }
  }
}

- (void)willRotate:(id)a3
{
  id v7 = a3;
  if (self->m_activated && [(UITextSelectionView *)self shouldBeVisible])
  {
    int m_showingCommandsCounterForRotate = self->m_showingCommandsCounterForRotate;
    self->int m_showingCommandsCounterForRotate = m_showingCommandsCounterForRotate + 1;
    if (!m_showingCommandsCounterForRotate)
    {
      BOOL v5 = self->m_delayShowingCommands
        || [(UITextSelectionView *)self selectionCommandsShowing];
      self->m_wasShowingCommands = v5;
      [(UITextSelectionView *)self cancelDelayedCommandRequests];
      [(UITextSelectionView *)self hideSelectionCommands];
    }
    uint64_t v6 = [(UIView *)self->m_rangeView superview];

    if (v6) {
      [(UITextRangeView *)self->m_rangeView willRotate];
    }
  }
}

- (void)didRotate:(id)a3
{
  BOOL v4 = [(UIView *)self->m_rangeView superview];

  if (v4) {
    [(UITextRangeView *)self->m_rangeView didRotate];
  }
  int m_showingCommandsCounterForRotate = self->m_showingCommandsCounterForRotate;
  if (m_showingCommandsCounterForRotate)
  {
    int v6 = m_showingCommandsCounterForRotate - 1;
    self->int m_showingCommandsCounterForRotate = v6;
    if (!v6 && self->m_wasShowingCommands)
    {
      [(UITextSelectionView *)self showCalloutBarAfterDelay:0.1];
      self->m_wasShowingCommands = 0;
    }
  }
}

- (void)updateBaseIsStartWithDocumentPoint:(CGPoint)a3
{
  m_rangeView = self->m_rangeView;
  if (m_rangeView) {
    -[UITextRangeView updateBaseIsStartWithDocumentPoint:](m_rangeView, "updateBaseIsStartWithDocumentPoint:", a3.x, a3.y);
  }
}

- (void)updateSelectionWithDocumentPoint:(CGPoint)a3
{
  m_rangeView = self->m_rangeView;
  if (m_rangeView) {
    -[UITextRangeView updateSelectionWithDocumentPoint:](m_rangeView, "updateSelectionWithDocumentPoint:", a3.x, a3.y);
  }
}

- (id)scrollView
{
  double v2 = [(UIView *)self _scroller];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (CGRect)clippedTargetRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!+[UIKeyboard isKeyboardProcess])
  {
    double v8 = [(UITextSelectionView *)self interactionAssistant];
    CGFloat v9 = [v8 view];
    int v10 = [v9 textInputView];
    [v10 visibleBounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    int v19 = [(UITextSelectionView *)self interactionAssistant];
    uint64_t v20 = [v19 view];
    uint64_t v21 = [v20 textInputView];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v21, v12, v14, v16, v18);
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;

    v98.origin.double x = v23;
    v98.origin.double y = v25;
    v98.size.double width = v27;
    v98.size.double height = v29;
    v108.origin.double x = x;
    v108.origin.double y = y;
    v108.size.double width = width;
    v108.size.double height = height;
    CGRect v99 = CGRectIntersection(v98, v108);
    double v30 = v99.origin.x;
    double v31 = v99.origin.y;
    double v32 = v99.size.width;
    double v33 = v99.size.height;
    CGFloat v34 = [(UIView *)self window];
    double v35 = [(UIView *)self _screen];
    [v35 bounds];
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    long long v44 = [(UIView *)self _screen];
    long long v45 = [v44 coordinateSpace];
    objc_msgSend(v34, "convertRect:fromCoordinateSpace:", v45, v37, v39, v41, v43);
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;

    double v54 = [(UIView *)self window];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v54, v47, v49, v51, v53);
    double v56 = v55;
    double v58 = v57;
    double v60 = v59;
    double v62 = v61;

    v100.origin.double x = v56;
    v100.origin.double y = v58;
    v100.size.double width = v60;
    v100.size.double height = v62;
    v109.origin.double x = v30;
    v109.origin.double y = v31;
    v109.size.double width = v32;
    v109.size.double height = v33;
    if (!CGRectIntersectsRect(v100, v109))
    {
      double v63 = v56 + v60;
      if (v30 + v32 < v56 + 10.0) {
        double v64 = v56 - v32 + 10.0;
      }
      else {
        double v64 = v30;
      }
      if (v63 < v30 + 10.0) {
        double v30 = v63 + -10.0;
      }
      else {
        double v30 = v64;
      }
      if (v58 + v62 >= v31 + 10.0)
      {
        if (v31 + v33 < v58 + 10.0) {
          double v31 = v58 - v33 + 10.0;
        }
      }
      else
      {
        double v31 = v58 + v62 + -10.0;
      }
    }
    v101.origin.double x = v56;
    v101.origin.double y = v58;
    v101.size.double width = v60;
    v101.size.double height = v62;
    v110.origin.double x = v30;
    v110.origin.double y = v31;
    v110.size.double width = v32;
    v110.size.double height = v33;
    CGRect v102 = CGRectIntersection(v101, v110);
    double x = v102.origin.x;
    double y = v102.origin.y;
    double width = v102.size.width;
    double height = v102.size.height;
    double v65 = [(UITextSelectionView *)self scrollView];
    if (v65)
    {
      -[UIView convertRect:toView:](self, "convertRect:toView:", v65, x, y, width, height);
      CGFloat v67 = v66;
      CGFloat v69 = v68;
      CGFloat v71 = v70;
      CGFloat v73 = v72;
      [v65 bounds];
      v111.origin.double x = v67;
      v111.origin.double y = v69;
      v111.size.double width = v71;
      v111.size.double height = v73;
      CGRect v104 = CGRectIntersection(v103, v111);
      double v74 = v104.origin.x;
      double v75 = v104.origin.y;
      double v76 = v104.size.width;
      double v77 = v104.size.height;
      if (CGRectIsEmpty(v104))
      {
        double x = *MEMORY[0x1E4F1DB28];
        double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      }
      else
      {
        -[UIView convertRect:fromView:](self, "convertRect:fromView:", v65, v74, v75, v76, v77);
        double v82 = v78;
        double v83 = v79;
        double v84 = v80;
        double v85 = v81;
        if (v81 >= height)
        {
          double x = v78;
          double y = v79;
          double width = v80;
          double height = v81;
        }
        else
        {
          if (height >= 40.0)
          {
            v86 = [(UITextSelectionView *)self interactionAssistant];
            double v87 = [v86 view];
            int v88 = [v87 isEditing];

            if (v88)
            {
              double v89 = +[UIKeyboardImpl activeInstance];
              objc_msgSend(v89, "subtractKeyboardFrameFromRect:inView:", self, v82, v83, v84, v85);
              double v82 = v90;
              double v83 = v91;
              double v84 = v92;
              double v85 = v93;
            }
            v106.origin.double x = v82;
            v106.origin.double y = v83;
            v106.size.double width = v84;
            v106.size.double height = v85;
            CGRect v105 = CGRectInset(v106, 0.0, -10.0);
          }
          else
          {
            v112.origin.double x = x;
            v112.origin.double y = y;
            v112.size.double width = width;
            v112.size.double height = height;
            CGRect v105 = CGRectUnion(*(CGRect *)&v78, v112);
          }
          double x = v105.origin.x;
          double y = v105.origin.y;
          double width = v105.size.width;
          double height = v105.size.height;
        }
      }
    }
  }
  double v94 = x;
  double v95 = y;
  double v96 = width;
  double v97 = height;
  result.size.double height = v97;
  result.size.double width = v96;
  result.origin.double y = v95;
  result.origin.double x = v94;
  return result;
}

- (void)mustFlattenForAlert:(id)a3
{
  id v6 = a3;
  id v4 = [v6 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UITextSelectionView *)self setAlertFlattened:0];
  }
  else
  {
    BOOL v5 = [v6 object];
    objc_opt_class();
    [(UITextSelectionView *)self setAlertFlattened:(objc_opt_isKindOfClass() & 1) == 0];
  }
  [(UITextSelectionView *)self updateSelectionDots];
}

- (void)canExpandAfterAlert:(id)a3
{
  [(UITextSelectionView *)self setAlertFlattened:0];
  [(UITextSelectionView *)self updateSelectionDots];
}

- (void)mustFlattenForSheet:(id)a3
{
  [(UITextSelectionView *)self setSheetFlattened:1];
  [(UITextSelectionView *)self updateSelectionDots];
}

- (void)canExpandAfterSheet:(id)a3
{
  [(UITextSelectionView *)self setSheetFlattened:0];
  [(UITextSelectionView *)self updateSelectionDots];
}

- (void)mustFlattenForPopover:(id)a3
{
  [(UITextSelectionView *)self setPopoverFlattened:1];
  [(UITextSelectionView *)self updateSelectionDots];
}

- (void)canExpandAfterPopover:(id)a3
{
  [(UITextSelectionView *)self setPopoverFlattened:0];
  [(UITextSelectionView *)self updateSelectionDots];
}

- (void)saveDeactivationReason:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = [v5 objectForKey:@"_UIApplicationDeactivationReasonUserInfoKey"];
  -[UITextSelectionView setApplicationDeactivationReason:](self, "setApplicationDeactivationReason:", [v4 intValue]);
}

- (void)mustFlattenForResignActive:(id)a3
{
  if ([(UITextSelectionView *)self applicationDeactivationReason] != 11
    && [(UITextSelectionView *)self applicationDeactivationReason])
  {
    [(UITextSelectionView *)self setActiveFlattened:1];
    [(UITextSelectionView *)self updateSelectionDots];
  }
}

- (void)canExpandAfterBecomeActive:(id)a3
{
  [(UITextSelectionView *)self setActiveFlattened:0];
  [(UITextSelectionView *)self updateSelectionDots];
}

- (void)mustFlattenForNavigationTransition:(id)a3
{
  [(UITextSelectionView *)self setNavigationTransitionFlattened:1];
  [(UITextSelectionView *)self updateSelectionDots];
}

- (void)canExpandAfterNavigationTransition:(id)a3
{
  [(UITextSelectionView *)self setNavigationTransitionFlattened:0];
  [(UITextSelectionView *)self updateSelectionDots];
}

- (UIView)floatingCaretView
{
  return self->m_floatingCaretView;
}

- (UITextInteractionAssistant)interactionAssistant
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_interactionAssistant);
  return (UITextInteractionAssistant *)WeakRetained;
}

- (BOOL)forceRangeView
{
  return self->m_forceRangeView;
}

- (void)setForceRangeView:(BOOL)a3
{
  self->m_forceRangeView = a3;
}

- (NSArray)replacements
{
  return self->m_replacements;
}

- (void)setReplacements:(id)a3
{
}

- (BOOL)activeFlattened
{
  return self->_activeFlattened;
}

- (void)setActiveFlattened:(BOOL)a3
{
  self->_activeFlattened = a3;
}

- (BOOL)alertFlattened
{
  return self->_alertFlattened;
}

- (void)setAlertFlattened:(BOOL)a3
{
  self->_alertFlattened = a3;
}

- (BOOL)sheetFlattened
{
  return self->_sheetFlattened;
}

- (void)setSheetFlattened:(BOOL)a3
{
  self->_sheetFlattened = a3;
}

- (BOOL)popoverFlattened
{
  return self->_popoverFlattened;
}

- (void)setPopoverFlattened:(BOOL)a3
{
  self->_popoverFlattened = a3;
}

- (BOOL)navigationTransitionFlattened
{
  return self->_navigationTransitionFlattened;
}

- (void)setNavigationTransitionFlattened:(BOOL)a3
{
  self->_navigationTransitionFlattened = a3;
}

- (int)applicationDeactivationReason
{
  return self->_applicationDeactivationReason;
}

- (void)setApplicationDeactivationReason:(int)a3
{
  self->_applicationDeactivationReason = a3;
}

- (CGRect)stashedCaretRect
{
  double x = self->_stashedCaretRect.origin.x;
  double y = self->_stashedCaretRect.origin.y;
  double width = self->_stashedCaretRect.size.width;
  double height = self->_stashedCaretRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStashedCaretRect:(CGRect)a3
{
  self->_stashedCaretRect = a3;
}

- (BOOL)isIndirectFloatingCaret
{
  return self->_isIndirectFloatingCaret;
}

- (void)setIsIndirectFloatingCaret:(BOOL)a3
{
  self->_isIndirectFloatingCaret = a3;
}

- (CGRect)previousGhostCaretRect
{
  double x = self->_previousGhostCaretRect.origin.x;
  double y = self->_previousGhostCaretRect.origin.y;
  double width = self->_previousGhostCaretRect.size.width;
  double height = self->_previousGhostCaretRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousGhostCaretRect:(CGRect)a3
{
  self->_previousGhostCaretRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hideSelectionCommandsWorkItem, 0);
  objc_storeStrong(&self->_floatingCaretBlinkAssertion, 0);
  objc_storeStrong((id *)&self->_caretBlinkAnimation, 0);
  objc_storeStrong((id *)&self->m_replacements, 0);
  objc_storeStrong((id *)&self->m_rangeView, 0);
  objc_storeStrong((id *)&self->m_floatingCaretView, 0);
  objc_storeStrong((id *)&self->m_caretView, 0);
  objc_storeStrong((id *)&self->m_selection, 0);
  objc_destroyWeak((id *)&self->m_interactionAssistant);
}

@end