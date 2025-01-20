@interface UITextInteractionAssistant
+ (int64_t)_nextGranularityInCycle:(int64_t)a3 forTouchType:(int64_t)a4;
- (BOOL)_canAutoscroll;
- (BOOL)_selectionIsActivated;
- (BOOL)autoscrolled;
- (BOOL)canShowSelectionCommands;
- (BOOL)containerAllowsSelection;
- (BOOL)containerAllowsSelectionTintOnly;
- (BOOL)containerIsBrowserView;
- (BOOL)containerIsTextField;
- (BOOL)cursorVisible;
- (BOOL)didPerformLoupeSelectionHandoff;
- (BOOL)didUseStashedSelection;
- (BOOL)expectingCommit;
- (BOOL)externalTextInput;
- (BOOL)ghostAppearance;
- (BOOL)handleMultilingualAlternativeWithString:(id)a3 range:(id)a4;
- (BOOL)hasActiveSelectionInteraction;
- (BOOL)hasReplacements;
- (BOOL)inGesture;
- (BOOL)isCursorBlinkAnimationEnabled;
- (BOOL)isDisplayingMenu;
- (BOOL)isDisplayingMenuForInputUI;
- (BOOL)isDisplayingVerticalSelection;
- (BOOL)isInteractiveSelectionDisabled;
- (BOOL)isSelectionDisplayVisible;
- (BOOL)isValid;
- (BOOL)needsGestureUpdate;
- (BOOL)requiresImmediateUpdate;
- (BOOL)scheduleReplacementsForRange:(id)a3 withOptions:(unint64_t)a4;
- (BOOL)shouldDisplayLoupeSessionForTouchType:(int64_t)a3;
- (BOOL)shouldSuppressSelectionCommands;
- (BOOL)showMultilingualDictationReplacementWithRange:(id)a3;
- (BOOL)supportsIndirectInteractions;
- (BOOL)swallowsDoubleTapWithScale:(double)a3 atPoint:(CGPoint)a4;
- (BOOL)textRangeAdjustmentInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4;
- (BOOL)textRangeAdjustmentInteraction:(id)a3 shouldDisplayLoupeForTouchType:(int64_t)a4;
- (BOOL)textRangeAdjustmentInteractionShouldApplyTouchOffset:(id)a3;
- (BOOL)useGesturesForEditableContent;
- (BOOL)usesAsynchronousSelectionController;
- (BOOL)viewConformsToAsynchronousInteractionProtocol;
- (BOOL)viewCouldBecomeEditable:(id)a3;
- (BOOL)wantsLinkInteraction;
- (BOOL)willHandoffLoupeMagnifier;
- (CGPoint)_rangeAdjustmentPointInTextInputCoordinateSpace:(CGPoint)a3;
- (CGPoint)_selectionViewManager:(id)a3 convertPointToRenderSpace:(CGPoint)a4 textRange:(id)a5;
- (CGPoint)autoscrollUntransformedExtentPoint;
- (CGPoint)boundedDeltaForTranslation:(CGPoint)a3 cursorLocationBase:(CGPoint)a4;
- (CGPoint)constrainedPoint:(CGPoint)a3;
- (CGPoint)convertPointToRenderSpace:(CGPoint)a3 textRange:(id)a4;
- (CGPoint)loupeGestureEndPoint;
- (CGRect)caretRectForTextRangeAdjustmentInteraction:(id)a3;
- (CGRect)paddedTextRangeAdjustmentHitRegionForEdge:(unint64_t)a3 precision:(unint64_t)a4;
- (CGRect)textRangeAdjustmentRectForEdge:(unint64_t)a3;
- (Class)selectionInteractionClass;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIContextMenuInteractionDelegate)externalContextMenuInteractionDelegate;
- (UIFieldEditor)fieldEditor;
- (UIGestureRecognizer)doubleTapGesture;
- (UIGestureRecognizer)forcePressGesture;
- (UILongPressGestureRecognizer)loupeGesture;
- (UIScrollView)scrollView;
- (UITapGestureRecognizer)singleTapGesture;
- (UITextCursorAssertionController)_assertionController;
- (UITextInput)textDocument;
- (UITextInput)view;
- (UITextInteraction)externalInteractions;
- (UITextInteraction)interactions;
- (UITextInteractionAssistant)initWithResponder:(id)a3;
- (UITextInteractionAssistant)initWithView:(id)a3;
- (UITextInteractionAssistant)initWithView:(id)a3 textInteractionMode:(int64_t)a4;
- (UITextRangeAdjustmentInteraction)rangeAdjustmentInteraction;
- (UITextSelection)activeSelection;
- (UITextSelectionDisplayInteraction)_selectionViewManager;
- (UIView)dynamicCaretView;
- (_UIKeyboardTextSelectionController)activeSelectionController;
- (_UITextChoiceAccelerationAssistant)_textChoicesAssistant;
- (_UITextInteractionEditMenuAssistant)_editMenuAssistant;
- (_UITextSelectionWidgetAnimating)_caretView;
- (id)_asAsyncTextInputClient;
- (id)_asBETextInput;
- (id)_asText;
- (id)_asTextAutoscrolling;
- (id)_computeGestureStateForView:(id)a3;
- (id)_legacySelectionView;
- (id)_pointerInteractionDelegate;
- (id)_rangeAdjustmentViewContainer;
- (id)_selectionView;
- (id)_selectionViewManager:(id)a3 obtainBlinkSuppressionAssertionForReason:(id)a4;
- (id)_selectionViewManager:(id)a3 obtainGhostCursorAssertionForReason:(id)a4;
- (id)_textReplacementsMenuForElement:(id)a3;
- (id)attributedTextInRange:(id)a3;
- (id)containerCoordinateSpaceForTextRangeAdjustmentInteraction:(id)a3;
- (id)generatorForRange:(id)a3 withOptions:(unint64_t)a4;
- (id)grabberSuppressionAssertion;
- (id)keyboardSuppressionAssertion;
- (id)linkInteraction;
- (id)obtainSelectionGrabberSuppressionAssertion;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)rangeForTextReplacement:(id)a3;
- (id)selectionContainerView;
- (id)selectionContainerViewAboveText;
- (id)selectionView;
- (id)textRangeAdjustmentViewForEdge:(unint64_t)a3;
- (id)textSelectionView;
- (id)updatedTextReplacementsMenuWithMenuElements:(id)a3;
- (int)glowViewMode;
- (int)selectionHighlightMode;
- (int64_t)currentCursorBehavior;
- (unint64_t)currentDraggedHandle;
- (unint64_t)loupeOrientation;
- (void)_invalidateSelectionDisplay;
- (void)_setTextSelectionControllerFromDelegate;
- (void)_textRangeAdjustmentForPoint:(CGPoint)a3 withTouchPoint:(CGPoint)a4;
- (void)_textRangeAdjustmentForPoint:(CGPoint)a3 withTouchPoint:(CGPoint)a4 selectionChangeReason:(int64_t)a5;
- (void)_updateRenderSpaceConversionConformance;
- (void)_updateSelectionInViewIfNeeded:(id)a3 toRange:(id)a4;
- (void)_updateSelectionWithPoint:(CGPoint)a3 granularity:(int64_t)a4 forceGranularity:(BOOL)a5;
- (void)_updateTextFormattingRestorationMethodsConformance;
- (void)activateSelection;
- (void)addGestureRecognizersToView:(id)a3;
- (void)autoscrollWillNotStart;
- (void)beginFloatingCursorAtPoint:(CGPoint)a3;
- (void)beginSelectionChange;
- (void)canBeginDragCursor:(id)a3;
- (void)cancelAutoscroll;
- (void)checkEditabilityAndSetFirstResponderIfNecessary;
- (void)clearGestureRecognizers;
- (void)clearGestureRecognizers:(BOOL)a3;
- (void)clearSelection;
- (void)clearStashedSelection;
- (void)commitSelectionWithPoint:(CGPoint)a3;
- (void)configureForHighlightMode;
- (void)configureForPencilDeletionPreviewMode;
- (void)configureForPencilHighlightMode;
- (void)configureForReplacementMode;
- (void)configureForSelectionMode;
- (void)deactivateSelection;
- (void)dealloc;
- (void)detach;
- (void)detach:(BOOL)a3;
- (void)didEndScrollingOrZooming;
- (void)didEndSelectionInteraction;
- (void)dismissMenuForInputUI;
- (void)endFloatingCursor;
- (void)endSelectionChange;
- (void)extendSelectionToLoupeOrSetToPoint:(CGPoint)a3;
- (void)extendSelectionToPoint:(CGPoint)a3;
- (void)hideSelectionCommands;
- (void)invalidate;
- (void)layoutChangedByScrolling:(BOOL)a3;
- (void)lollipopGestureWithState:(int64_t)a3 location:(CGPoint)a4 locationOfFirstTouch:(CGPoint)a5 forTouchType:(int64_t)a6;
- (void)loupeGestureWithState:(int64_t)a3 location:(id)a4 translation:(id)a5 velocity:(id)a6 modifierFlags:(int64_t)a7 shouldCancel:(BOOL *)a8;
- (void)loupeMagnifierWithState:(int64_t)a3 atPoint:(CGPoint)a4;
- (void)notifyKeyboardSelectionChanged;
- (void)presentMenuForInputUI:(id)a3 preferredArrowDirection:(int64_t)a4;
- (void)rangeSelectionCanceled;
- (void)rangeSelectionEnded:(CGPoint)a3;
- (void)rangeSelectionMoved:(CGPoint)a3 withTouchPoint:(CGPoint)a4;
- (void)rangeSelectionStarted:(CGPoint)a3;
- (void)rangedMagnifierWithState:(int64_t)a3 atPoint:(CGPoint)a4;
- (void)removeTextChoiceUnderlines;
- (void)resetWillHandoffLoupeMagnifier;
- (void)resignedFirstResponder;
- (void)scheduleChineseTransliteration;
- (void)scheduleDictationReplacementsForAlternatives:(id)a3 range:(id)a4;
- (void)scheduleDictationReplacementsForMultilingualAlternatives:(id)a3 range:(id)a4;
- (void)scheduleReplacements;
- (void)scheduleReplacementsWithOptions:(unint64_t)a3;
- (void)scrollSelectionToVisible;
- (void)scrollSelectionToVisible:(BOOL)a3;
- (void)selectAll:(id)a3;
- (void)selectWord;
- (void)selectWordWithoutShowingCommands;
- (void)selectionAnimationDidStop;
- (void)selectionChanged;
- (void)setAutomaticSelectionCommandsSuppressedForPointerTouchType:(BOOL)a3;
- (void)setAutoscrollUntransformedExtentPoint:(CGPoint)a3;
- (void)setAutoscrolled:(BOOL)a3;
- (void)setCursorBlinkAnimationEnabled:(BOOL)a3;
- (void)setCursorVisible:(BOOL)a3;
- (void)setExpectingCommit:(BOOL)a3;
- (void)setExternalContextMenuInteractionDelegate:(id)a3;
- (void)setExternalInteractions:(id)a3;
- (void)setFirstResponderIfNecessary;
- (void)setFirstResponderIfNecessaryActivatingSelection:(BOOL)a3;
- (void)setGestureRecognizers;
- (void)setGestureRecognizers:(id)a3;
- (void)setGhostAppearance:(BOOL)a3;
- (void)setGlowViewMode:(int)a3;
- (void)setGrabberSuppressionAssertion:(id)a3;
- (void)setInGesture:(BOOL)a3;
- (void)setKeyboardSuppressionAssertion:(id)a3;
- (void)setLoupeGestureEndPoint:(CGPoint)a3;
- (void)setNeedsGestureUpdate:(BOOL)a3;
- (void)setNeedsSelectionDisplayUpdate;
- (void)setSelectionDisplayVisible:(BOOL)a3;
- (void)setSelectionHighlightMode:(int)a3;
- (void)setSelectionWithPoint:(CGPoint)a3;
- (void)setSuppressSystemUI:(BOOL)a3;
- (void)setWillHandoffLoupeMagnifier;
- (void)showSelectionCommands;
- (void)startAutoscroll:(CGPoint)a3;
- (void)stashCurrentSelection;
- (void)textRangeAdjustmentInteraction:(id)a3 didBeginAtPoint:(CGPoint)a4;
- (void)textRangeAdjustmentInteraction:(id)a3 didEndAtPoint:(CGPoint)a4;
- (void)textRangeAdjustmentInteractionWasCancelled:(id)a3;
- (void)underlineCorrectedTextInRange:(id)a3 typedString:(id)a4;
- (void)updateAutoscroll:(id)a3;
- (void)updateDisplayedSelection;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3;
- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4;
- (void)updateSelectionForTextAnimation;
- (void)updateSelectionWithPoint:(CGPoint)a3;
- (void)updateWithMagnifierTerminalPoint:(BOOL)a3;
- (void)willBeginFloatingCursor:(BOOL)a3;
- (void)willBeginSelectionInteraction;
- (void)willStartScrollingOrZooming;
@end

@implementation UITextInteractionAssistant

- (BOOL)supportsIndirectInteractions
{
  BOOL v2 = 1;
  uint64_t v3 = _UIDeviceNativeUserInterfaceIdiom();
  if ((unint64_t)(v3 - 5) >= 2)
  {
    if (v3)
    {
      return v3 == 1;
    }
    else
    {
      v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v5 = [v4 hardwareKeyboardExclusivityIdentifier];
      BOOL v2 = v5 != 0;
    }
  }
  return v2;
}

- (UIGestureRecognizer)forcePressGesture
{
  return (UIGestureRecognizer *)[(UITextInteraction *)self->_interactions recognizerForName:0x1ED14EF20];
}

- (_UITextInteractionEditMenuAssistant)_editMenuAssistant
{
  editMenuAssistant = self->_editMenuAssistant;
  if (!editMenuAssistant)
  {
    v4 = [[_UITextInteractionEditMenuAssistant alloc] initWithInteractionAssistant:self];
    v5 = self->_editMenuAssistant;
    self->_editMenuAssistant = v4;

    editMenuAssistant = self->_editMenuAssistant;
  }
  return editMenuAssistant;
}

- (id)_selectionView
{
  return self->_selectionView;
}

- (UITextInteractionAssistant)initWithView:(id)a3 textInteractionMode:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITextInteractionAssistant;
  v7 = [(UITextInteractionAssistant *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_view, v6);
    v8->_textInteractionMode = a4;
    [(UITextInteractionAssistant *)v8 setGestureRecognizers];
    [(UITextInteractionAssistant *)v8 _updateRenderSpaceConversionConformance];
    [(UITextInteractionAssistant *)v8 _updateTextFormattingRestorationMethodsConformance];
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v8 selector:sel_setGestureRecognizers_ name:@"_UIHardwareKeyboardExclusivityIdentifierChangedNotification" object:0];
  }
  return v8;
}

- (void)_updateTextFormattingRestorationMethodsConformance
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (objc_opt_respondsToSelector())
  {
    id v4 = objc_loadWeakRetained((id *)p_view);
    self->_respondsToTextFormattingRestorationMethods = objc_opt_respondsToSelector() & 1;
  }
  else
  {
    self->_respondsToTextFormattingRestorationMethods = 0;
  }
}

- (void)_updateRenderSpaceConversionConformance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  self->_respondsToConvertPointToRenderSpace = objc_opt_respondsToSelector() & 1;
}

- (UITextInteractionAssistant)initWithView:(id)a3
{
  return [(UITextInteractionAssistant *)self initWithView:a3 textInteractionMode:-1];
}

- (void)dealloc
{
  [(UITextInteractionAssistant *)self detach:1];
  [(UITextSelectionView *)self->_selectionView invalidate];
  selectionView = self->_selectionView;
  self->_selectionView = 0;

  v4.receiver = self;
  v4.super_class = (Class)UITextInteractionAssistant;
  [(UITextInteractionAssistant *)&v4 dealloc];
}

- (void)detach:(BOOL)a3
{
  BOOL v3 = a3;
  self->_detaching = 1;
  [(UITextSelectionView *)self->_selectionView detach];
  v5 = [(UITextInteraction *)self->_linkInteraction view];
  [v5 removeInteraction:self->_linkInteraction];

  linkInteraction = self->_linkInteraction;
  self->_linkInteraction = 0;

  v7 = [(UITextInteraction *)self->_textContextMenuInteraction view];
  [v7 removeInteraction:self->_textContextMenuInteraction];

  textContextMenuInteraction = self->_textContextMenuInteraction;
  self->_textContextMenuInteraction = 0;

  v9 = [(UIPointerInteraction *)self->_pointerInteraction view];
  [v9 removeInteraction:self->_pointerInteraction];

  pointerInteraction = self->_pointerInteraction;
  self->_pointerInteraction = 0;

  if (self->_selectionViewManager)
  {
    objc_super v11 = [(UITextInteraction *)self->_interactions view];
    [v11 removeInteraction:self->_selectionViewManager];

    selectionViewManager = self->_selectionViewManager;
    self->_selectionViewManager = 0;
  }
  [(UITextInteractionAssistant *)self clearGestureRecognizers:v3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v13 = +[UITextMagnifierCaret activeCaretMagnifier];
  id v14 = [v13 target];

  if (WeakRetained == v14) {
    [v13 stopMagnifying:0];
  }
  v15 = +[UITextMagnifierRanged activeRangedMagnifier];
  id v16 = [v15 target];

  if (WeakRetained == v16) {
    [v15 stopMagnifying:0];
  }
  self->_detaching = 0;
}

- (id)selectionContainerView
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v4 = objc_opt_respondsToSelector();

  id v5 = objc_loadWeakRetained((id *)p_view);
  id v6 = v5;
  if (v4) {
    [v5 selectionContainerView];
  }
  else {
  v7 = [v5 textInputView];
  }

  return v7;
}

- (UITextInput)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UITextInput *)WeakRetained;
}

- (UITextSelection)activeSelection
{
  BOOL v2 = [(UITextInteractionAssistant *)self activeSelectionController];
  BOOL v3 = [v2 selection];

  return (UITextSelection *)v3;
}

- (_UIKeyboardTextSelectionController)activeSelectionController
{
  [(UITextInteractionAssistant *)self _setTextSelectionControllerFromDelegate];
  textSelectionController = self->_textSelectionController;
  return textSelectionController;
}

- (void)_setTextSelectionControllerFromDelegate
{
  id v3 = [(_UIKeyboardTextSelectionController *)self->_textSelectionController inputDelegate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (v3 == WeakRetained) {
    return;
  }
  if ([(UITextInteractionAssistant *)self usesAsynchronousSelectionController])
  {
    id v5 = _UIKeyboardAsyncTextSelectionController;
LABEL_7:
    id v7 = [v5 alloc];
    id v8 = objc_loadWeakRetained((id *)&self->_view);
    id v6 = (_UIKeyboardTextSelectionController *)[v7 initWithInputDelegate:v8];

    goto LABEL_8;
  }
  id v6 = (_UIKeyboardTextSelectionController *)objc_loadWeakRetained((id *)&self->_view);

  if (v6)
  {
    id v5 = _UIKeyboardTextSelectionController;
    goto LABEL_7;
  }
LABEL_8:
  textSelectionController = self->_textSelectionController;
  self->_textSelectionController = v6;
}

- (BOOL)usesAsynchronousSelectionController
{
  return 0;
}

- (void)setGestureRecognizers
{
  if (self->_externalTextInput) {
    return;
  }
  if ([(UITextInteractionAssistant *)self inGesture]) {
    return;
  }
  if (self->_textInteractionMode <= 1uLL)
  {
    if (self->_interactions)
    {
      externalInteractions = self->_externalInteractions;
      if (externalInteractions)
      {
        if ([(UITextInteraction *)externalInteractions textInteractionMode] == self->_textInteractionMode)
        {
          UITextInteractionMode v4 = [(UITextInteraction *)self->_externalInteractions textInteractionMode];
          if (v4 == [(UITextInteraction *)self->_interactions textInteractionMode]) {
            return;
          }
        }
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v6 = [(UITextInteractionAssistant *)self _computeGestureStateForView:WeakRetained];

  id v14 = [(UITextInteraction *)self->_interactions _transientState];
  [(UITextInteractionAssistant *)self clearGestureRecognizers];
  id v7 = objc_loadWeakRetained((id *)&self->_view);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v7 _textInputViewForAddingGestureRecognizers];
LABEL_14:
    objc_super v11 = (void *)v8;
    [(UITextInteractionAssistant *)self addGestureRecognizersToView:v8];
    goto LABEL_15;
  }
  v9 = [(UITextInteractionAssistant *)self externalInteractions];
  v10 = [v9 view];

  if (!v10)
  {
    uint64_t v8 = [v7 textInputView];
    goto LABEL_14;
  }
  objc_super v11 = [(UITextInteractionAssistant *)self externalInteractions];
  v12 = [v11 view];
  [(UITextInteractionAssistant *)self addGestureRecognizersToView:v12];

LABEL_15:
  [(UITextInteraction *)self->_interactions _applyTransientState:v14];
  gestureState = self->_gestureState;
  self->_gestureState = v6;
}

- (void)clearGestureRecognizers:(BOOL)a3
{
  if (a3 || ![(UITextInteractionAssistant *)self inGesture])
  {
    [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant cancelDelayedCommandRequests];
    gestureState = self->_gestureState;
    self->_gestureState = 0;

    id v6 = [(UITextInteraction *)self->_interactions view];
    [v6 removeInteraction:self->_interactions];
    interactions = self->_interactions;
    self->_interactions = 0;
  }
}

- (BOOL)inGesture
{
  return self->_inGesture || [(UITextInteraction *)self->_interactions inGesture];
}

- (void)clearGestureRecognizers
{
}

- (void)addGestureRecognizersToView:(id)a3
{
  id v167 = a3;
  if (!_UIDeviceHasExternalTouchInput() && !self->_interactions)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    if (([WeakRetained isEditable] & 1) != 0
      || (id v5 = objc_loadWeakRetained((id *)&self->_view),
          BOOL v6 = +[UITextItemInteractionInteraction mightResponderHaveTextItemInteractions:v5], v5, !v6))
    {
      BOOL v8 = [(UITextInteractionAssistant *)self viewCouldBecomeEditable:WeakRetained];
      int v7 = 0;
    }
    else
    {
      int v7 = 1;
      BOOL v8 = 1;
    }
    if (objc_opt_respondsToSelector()) {
      int v9 = [WeakRetained playsNicelyWithGestures];
    }
    else {
      int v9 = 1;
    }
    if (objc_opt_respondsToSelector()) {
      char v10 = [WeakRetained _isInteractiveTextSelectionDisabled];
    }
    else {
      char v10 = 0;
    }
    linkInteraction = self->_linkInteraction;
    if (linkInteraction) {
      goto LABEL_14;
    }
    if ([(UITextInteractionAssistant *)self wantsLinkInteraction])
    {
      v13 = +[UITextLinkInteraction interactionWithShouldProxyContextMenuDelegate:1];
      id v14 = self->_linkInteraction;
      self->_linkInteraction = v13;

      [v167 addInteraction:self->_linkInteraction];
      [(UITextInteraction *)self->_linkInteraction setAssistantDelegate:self];
      goto LABEL_19;
    }
    linkInteraction = self->_linkInteraction;
    if (linkInteraction)
    {
LABEL_14:
      id v12 = [(UITextInteraction *)linkInteraction view];

      if (v12 != v167) {
        [v167 addInteraction:self->_linkInteraction];
      }
    }
LABEL_19:
    textContextMenuInteraction = self->_textContextMenuInteraction;
    if (textContextMenuInteraction)
    {
      id v16 = [(UITextInteraction *)textContextMenuInteraction view];

      if (v16 == v167) {
        goto LABEL_24;
      }
    }
    else
    {
      v17 = objc_alloc_init(UITextContextMenuInteraction);
      v18 = self->_textContextMenuInteraction;
      self->_textContextMenuInteraction = v17;

      v19 = [(UITextInteractionAssistant *)self externalContextMenuInteractionDelegate];
      [(UITextContextMenuInteraction *)self->_textContextMenuInteraction setExternalContextMenuDelegate:v19];

      [(UITextInteraction *)self->_textContextMenuInteraction setAssistantDelegate:self];
    }
    [v167 addInteraction:self->_textContextMenuInteraction];
LABEL_24:
    if ([(UITextInteractionAssistant *)self currentCursorBehavior] == 2
      || (p_pointerInteraction = &self->_pointerInteraction, self->_pointerInteraction)
      || ![(UITextInteractionAssistant *)self supportsIndirectInteractions])
    {
      p_pointerInteraction = &self->_pointerInteraction;
      pointerInteraction = self->_pointerInteraction;
      if (!pointerInteraction
        || ([(UIPointerInteraction *)pointerInteraction view],
            id v26 = (id)objc_claimAutoreleasedReturnValue(),
            v26,
            v26 == v167))
      {
LABEL_31:
        v27 = +[UITextInteraction textInteractionForMode:self->_textInteractionMode];
        interactions = self->_interactions;
        self->_interactions = v27;

        [(UITextInteraction *)self->_interactions setTextInput:WeakRetained];
        [(UITextInteraction *)self->_interactions setAssistantDelegate:self];
        v29 = [(UITextInteraction *)self->_externalInteractions delegate];
        [(UITextInteraction *)self->_interactions setDelegate:v29];

        if (self->_textContextMenuInteraction) {
          -[UITextInteraction addIndirectChild:](self->_interactions, "addIndirectChild:");
        }
        if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
        {
          selectionViewManager = self->_selectionViewManager;
          if (selectionViewManager)
          {
            id v31 = [(UITextSelectionDisplayInteraction *)selectionViewManager view];

            if (v31 == v167) {
              goto LABEL_38;
            }
            selectionViewManager = self->_selectionViewManager;
          }
          uint64_t v32 = [(UITextSelectionDisplayInteraction *)selectionViewManager isActivated];
          v33 = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager view];
          [v33 removeInteraction:self->_selectionViewManager];

          v34 = [[UITextSelectionDisplayInteraction alloc] _initWithTextInput:WeakRetained delegate:self activated:0];
          v35 = self->_selectionViewManager;
          self->_selectionViewManager = v34;

          [v167 addInteraction:self->_selectionViewManager];
          [(UITextSelectionDisplayInteraction *)self->_selectionViewManager setActivated:v32];
        }
LABEL_38:
        id v36 = v167;
        v37 = v36;
        if (objc_opt_respondsToSelector())
        {
          v37 = [WeakRetained _rangeAdjustmentGestureView];
        }
        v38 = [[UITextRangeAdjustmentInteraction alloc] initWithAdjustmentDelegate:self gestureHostView:v37];
        rangeAdjustmentInteraction = self->_rangeAdjustmentInteraction;
        self->_rangeAdjustmentInteraction = v38;

        [(UITextInteraction *)self->_interactions addChild:self->_rangeAdjustmentInteraction];
        int64_t textInteractionMode = self->_textInteractionMode;
        if (textInteractionMode > 999)
        {
          if (textInteractionMode != 1000)
          {
            if (textInteractionMode == 1001)
            {
              [(UITextInteraction *)self->_interactions _setAllowsSelectionCommands:[(UITextInteraction *)self->_externalInteractions _allowsSelectionCommands]];
              v41 = self->_interactions;
              v42 = [UITextRefinementInteraction alloc];
              v43 = objc_opt_new();
              v44 = [(UITextRefinementInteraction *)v42 initWithBehaviorDelegate:v43];
              [(UITextInteraction *)v41 addChild:v44];

              v45 = self->_interactions;
              v46 = [[UITextNonEditableInteraction alloc] initWithMode:2];
              [(UITextInteraction *)v45 addChild:v46];

              v47 = self->_interactions;
              v48 = objc_alloc_init(UITextServicesInteraction);
LABEL_47:
              v49 = v48;
              [(UITextInteraction *)v47 addChild:v48];
LABEL_48:

LABEL_66:
              [v36 addInteraction:self->_interactions];
              [(UITextInteraction *)self->_interactions finishSetup];

              goto LABEL_67;
            }
            goto LABEL_55;
          }
        }
        else
        {
          if (!textInteractionMode)
          {
            v56 = self->_interactions;
            v57 = objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 0, 0);
            [(UITextInteraction *)v56 addChild:v57];

            v58 = self->_interactions;
            v59 = [UITextRefinementInteraction alloc];
            v60 = objc_opt_new();
            v61 = [(UITextRefinementInteraction *)v59 initWithBehaviorDelegate:v60];
            [(UITextInteraction *)v58 addChild:v61];

            if ([(UITextInteractionAssistant *)self supportsIndirectInteractions])
            {
              v62 = self->_interactions;
              v63 = objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 0, 1);
              [(UITextInteraction *)v62 addChild:v63];

              v64 = self->_interactions;
              v65 = [UITextRefinementInteraction alloc];
              v66 = objc_opt_new();
              v67 = [(UITextRefinementInteraction *)v65 initWithBehaviorDelegate:v66];
              [(UITextInteraction *)v64 addChild:v67];
            }
            v68 = self->_interactions;
            v69 = objc_alloc_init(UITextServicesInteraction);
            [(UITextInteraction *)v68 addChild:v69];

            v70 = self->_interactions;
            v71 = [[UITextIndirectKeyboardInteraction alloc] initWithView:0];
            [(UITextInteraction *)v70 addChild:v71];

            [(UITextInteractionAssistant *)self wantsLinkInteraction];
            goto LABEL_66;
          }
          if (textInteractionMode != 1)
          {
LABEL_55:
            if ([(UITextInteractionAssistant *)self useGesturesForEditableContent])
            {
              if ([WeakRetained _hasMarkedText])
              {
                v72 = +[UIKeyboardImpl activeInstance];
                int v73 = [v72 hasEditableMarkedText];

                if (v73)
                {
                  v74 = +[UIKeyboardImpl activeInstance];
                  int v75 = [v74 liveConversionEnabled];

                  v76 = self->_interactions;
                  if (v75)
                  {
                    v77 = [UITextLiveConversionInteraction alloc];
                    v78 = [(UITextInteractionAssistant *)self _asText];
                    v79 = [(UITextLiveConversionInteraction *)v77 initWithTextInput:v78];
                    [(UITextInteraction *)v76 addChild:v79];

                    goto LABEL_66;
                  }
                  v161 = [UITextPhraseBoundaryInteraction alloc];
                  v162 = [(UITextInteractionAssistant *)self _asText];
                  v163 = [(UITextPhraseBoundaryInteraction *)v161 initWithTextInput:v162];
                  [(UITextInteraction *)v76 addChild:v163];

                  v164 = self->_interactions;
                  v165 = objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 2, 0);
                  [(UITextInteraction *)v164 addChild:v165];

                  if (+[UIKeyboard usesInputSystemUI])
                  {
                    v166 = [[UITextIndirectKeyboardInteraction alloc] initWithView:v36];
                    [(UITextIndirectKeyboardInteraction *)v166 setDisableTouchesForGestures:1];
                    [(UITextInteraction *)self->_interactions addChild:v166];
                  }
                  if (![(UITextInteractionAssistant *)self supportsIndirectInteractions]) {
                    goto LABEL_66;
                  }
                  v47 = self->_interactions;
                  v48 = (UITextServicesInteraction *)objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 2, 1);
                  goto LABEL_47;
                }
              }
              v126 = self->_interactions;
              v127 = [UITextRefinementInteraction alloc];
              v128 = objc_opt_new();
              v129 = [(UITextRefinementInteraction *)v127 initWithBehaviorDelegate:v128];
              [(UITextInteraction *)v126 addChild:v129];

              v49 = objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 0, 0);
              [(UITextInteraction *)self->_interactions addChild:v49];
              v130 = self->_interactions;
              v131 = [[UITextIndirectKeyboardInteraction alloc] initWithView:v36];
              [(UITextInteraction *)v130 addChild:v131];

              if ([(UITextInteractionAssistant *)self supportsIndirectInteractions])
              {
                v132 = self->_interactions;
                v133 = [UITextRefinementInteraction alloc];
                v134 = objc_opt_new();
                v135 = [(UITextRefinementInteraction *)v133 initWithBehaviorDelegate:v134];
                [(UITextInteraction *)v132 addChild:v135];

                v136 = self->_interactions;
                v137 = objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 0, 1);
                [(UITextInteraction *)v136 addChild:v137];
              }
              [(UITextInteractionAssistant *)self wantsLinkInteraction];
              if (!v8) {
                goto LABEL_48;
              }
              v138 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174080];

              if (!v138) {
                goto LABEL_48;
              }
              v139 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174000];
              v140 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174080];
              [v139 requireGestureRecognizerToFail:v140];

              v141 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED1740A0];

              if (!v141) {
                goto LABEL_48;
              }
              v123 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174080];
              v124 = (UITextLinkInteraction *)self->_interactions;
              uint64_t v125 = 0x1ED1740A0;
LABEL_88:
              v142 = [(UITextInteraction *)v124 recognizerForName:v125];
              [v123 requireGestureRecognizerToFail:v142];

              goto LABEL_48;
            }
            if (v10) {
              goto LABEL_66;
            }
            v98 = self->_interactions;
            if (v9)
            {
              v99 = [UITextRefinementInteraction alloc];
              v100 = objc_opt_new();
              v101 = [(UITextRefinementInteraction *)v99 initWithBehaviorDelegate:v100];
              [(UITextInteraction *)v98 addChild:v101];

              v102 = self->_interactions;
              v103 = [[UITextNonEditableInteraction alloc] initWithMode:0];
              [(UITextInteraction *)v102 addChild:v103];

              v104 = self->_interactions;
              v105 = objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 3, 0);
              [(UITextInteraction *)v104 addChild:v105];

              if ([(UITextInteractionAssistant *)self supportsIndirectInteractions])
              {
                v106 = self->_interactions;
                v107 = [UITextRefinementInteraction alloc];
                v108 = objc_opt_new();
                v109 = [(UITextRefinementInteraction *)v107 initWithBehaviorDelegate:v108];
                [(UITextInteraction *)v106 addChild:v109];

                v110 = self->_interactions;
                v111 = objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 0, 1);
                [(UITextInteraction *)v110 addChild:v111];
              }
              v112 = self->_interactions;
              v113 = [[UITextIndirectNonEditableInteraction alloc] initWithView:v36];
              [(UITextInteraction *)v112 addChild:v113];

              v49 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED14EF20];
              if (v49)
              {
                v114 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174100];
                [v114 requireGestureRecognizerToFail:v49];
              }
              [(UITextInteractionAssistant *)self wantsLinkInteraction];
              if (v8)
              {
                v115 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174080];

                if (v115)
                {
                  v116 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174000];
                  v117 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174080];
                  [v116 requireGestureRecognizerToFail:v117];

                  v118 = [(UITextInteraction *)self->_linkInteraction recognizerForName:0x1ED174120];
                  v119 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174080];
                  [v118 requireGestureRecognizerToFail:v119];

                  v120 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED1740A0];

                  if (v120)
                  {
                    v121 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174080];
                    v122 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED1740A0];
                    [v121 requireGestureRecognizerToFail:v122];
                  }
                }
              }
              if (!v7) {
                goto LABEL_48;
              }
              v123 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174000];
              v124 = self->_linkInteraction;
              uint64_t v125 = 0x1ED174120;
              goto LABEL_88;
            }
            v143 = [[UITextIndirectNonEditableInteraction alloc] initWithView:v36];
            [(UITextInteraction *)v98 addChild:v143];

            v53 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED14EF20];
            if (v53)
            {
              v144 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174100];
              [v144 requireGestureRecognizerToFail:v53];
            }
            v145 = self->_interactions;
            v146 = [[UITextNonEditableInteraction alloc] initWithMode:1];
            [(UITextInteraction *)v145 addChild:v146];

            v147 = self->_interactions;
            v148 = [UITextRefinementInteraction alloc];
            v149 = objc_opt_new();
            v150 = [(UITextRefinementInteraction *)v148 initWithBehaviorDelegate:v149];
            [(UITextInteraction *)v147 addChild:v150];

            if ([(UITextInteractionAssistant *)self supportsIndirectInteractions])
            {
              v151 = self->_interactions;
              v152 = [UITextRefinementInteraction alloc];
              v153 = objc_opt_new();
              v154 = [(UITextRefinementInteraction *)v152 initWithBehaviorDelegate:v153];
              [(UITextInteraction *)v151 addChild:v154];

              v155 = self->_interactions;
              v156 = objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 3, 0);
              [(UITextInteraction *)v155 addChild:v156];
            }
            v157 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174000];
            [v157 setDelaysTouchesEnded:0];

            v158 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174000];
            [v158 setCancelsTouchesInView:0];

            v159 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174040];
            [v159 setDelaysTouchesEnded:0];

            v160 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174060];
            [v160 setDelaysTouchesEnded:0];

LABEL_65:
            goto LABEL_66;
          }
        }
        v50 = self->_interactions;
        v51 = [[UITextNonEditableInteraction alloc] initWithMode:0];
        [(UITextInteraction *)v50 addChild:v51];

        uint64_t v52 = [(UITextInteraction *)self->_externalInteractions _customHighlighterGesture];
        v53 = (void *)v52;
        v54 = self->_interactions;
        if (self->_textInteractionMode == 1000 && v52)
        {
          v55 = [[UITextRefinementInteraction_CustomHighlighter alloc] initWithLongPressGesture:v52];
          [(UITextInteraction *)v54 addChild:v55];
        }
        else
        {
          v80 = [UITextRefinementInteraction alloc];
          v81 = objc_opt_new();
          v82 = [(UITextRefinementInteraction *)v80 initWithBehaviorDelegate:v81];
          [(UITextInteraction *)v54 addChild:v82];

          v83 = self->_interactions;
          v84 = objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 3, 0);
          [(UITextInteraction *)v83 addChild:v84];

          if ([(UITextInteractionAssistant *)self supportsIndirectInteractions])
          {
            v85 = self->_interactions;
            v86 = objc_msgSend(objc_alloc(-[UITextInteractionAssistant selectionInteractionClass](self, "selectionInteractionClass")), "initWithMode:indirect:", 0, 1);
            [(UITextInteraction *)v85 addChild:v86];

            v87 = self->_interactions;
            v88 = [UITextRefinementInteraction alloc];
            v89 = objc_opt_new();
            v90 = [(UITextRefinementInteraction *)v88 initWithBehaviorDelegate:v89];
            [(UITextInteraction *)v87 addChild:v90];
          }
          v91 = self->_interactions;
          v92 = [[UITextIndirectNonEditableInteraction alloc] initWithView:v36];
          [(UITextInteraction *)v91 addChild:v92];

          v55 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED14EF20];
          if (v55)
          {
            v93 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174100];
            [v93 requireGestureRecognizerToFail:v55];
          }
        }

        v94 = [(UITextInteraction *)self->_interactions recognizerForName:0x1ED174000];
        v95 = [(UITextInteraction *)self->_linkInteraction recognizerForName:0x1ED174120];
        [v94 requireGestureRecognizerToFail:v95];

        v96 = self->_interactions;
        v97 = objc_alloc_init(UITextServicesInteraction);
        [(UITextInteraction *)v96 addChild:v97];

        [(UITextInteractionAssistant *)self wantsLinkInteraction];
        goto LABEL_65;
      }
    }
    else
    {
      v21 = [UIPointerInteraction alloc];
      v22 = [(UITextInteractionAssistant *)self _pointerInteractionDelegate];
      v23 = [(UIPointerInteraction *)v21 initWithDelegate:v22];
      v24 = self->_pointerInteraction;
      self->_pointerInteraction = v23;

      [(UIPointerInteraction *)self->_pointerInteraction _setPausesPointerUpdatesWhilePanning:0];
    }
    [v167 addInteraction:*p_pointerInteraction];
    goto LABEL_31;
  }
LABEL_67:
}

- (BOOL)wantsLinkInteraction
{
  return 1;
}

- (id)_legacySelectionView
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    id v3 = 0;
  }
  else
  {
    if (!self->_selectionView)
    {
      UITextInteractionMode v4 = [[UITextSelectionView alloc] initWithInteractionAssistant:self];
      selectionView = self->_selectionView;
      self->_selectionView = v4;
    }
    if (!self->_externalTextInput && !self->_detaching) {
      [(UITextSelectionView *)self->_selectionView installIfNecessary];
    }
    id v3 = self->_selectionView;
  }
  return v3;
}

- (void)setNeedsSelectionDisplayUpdate
{
  [(UITextSelectionView *)self->_selectionView deferredUpdateSelectionRects];
  [(UITextSelectionDisplayInteraction *)self->_selectionViewManager setNeedsSelectionUpdate];
  textChoicesAssistant = self->_textChoicesAssistant;
  [(_UITextChoiceAccelerationAssistant *)textChoicesAssistant setNeedsUnderlineUpdate];
}

- (BOOL)useGesturesForEditableContent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ([WeakRetained isEditable])
    {
LABEL_4:
      char v4 = 1;
      goto LABEL_10;
    }
    if ([(UITextInteractionAssistant *)self containerIsBrowserView])
    {
      id v5 = [WeakRetained _proxyTextInput];
      BOOL v6 = [v5 formElement];
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_4;
        }
      }
    }
    char v4 = 0;
    goto LABEL_10;
  }
  char v4 = [WeakRetained _useGesturesForEditableContent];
LABEL_10:

  return v4;
}

- (id)_computeGestureStateForView:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  objc_msgSend(v5, "setViewIsEditable:", objc_msgSend(v4, "isEditable"));
  objc_msgSend(v5, "setViewCanBecomeEditable:", -[UITextInteractionAssistant viewCouldBecomeEditable:](self, "viewCouldBecomeEditable:", v4));
  externalInteractions = self->_externalInteractions;
  if (externalInteractions)
  {
    int v7 = [(UITextInteraction *)externalInteractions children];
    objc_msgSend(v5, "setHasExternalInteractions:", objc_msgSend(v7, "count") != 0);
  }
  else
  {
    [v5 setHasExternalInteractions:0];
  }
  [v5 setMode:self->_textInteractionMode];
  objc_msgSend(v5, "setIsFirstResponder:", objc_msgSend(v4, "isFirstResponder"));

  return v5;
}

- (BOOL)viewCouldBecomeEditable:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([v3 isEditable] & 1) == 0)
  {
    char v4 = [v3 becomesEditableWithGestures];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (Class)selectionInteractionClass
{
  return (Class)objc_opt_class();
}

- (int64_t)currentCursorBehavior
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v4 = [WeakRetained textInputView];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = objc_loadWeakRetained((id *)p_view);
    int v7 = [v6 textInputView];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      return 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    int v9 = [WeakRetained textInputView];
    int64_t v10 = [v9 cursorBehavior];
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (UIContextMenuInteractionDelegate)externalContextMenuInteractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalContextMenuInteractionDelegate);
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    id v5 = [(UITextLinkInteraction *)self->_linkInteraction contextMenuDelegateProxy];
  }
  id v6 = v5;

  return (UIContextMenuInteractionDelegate *)v6;
}

- (void)updateDisplayedSelection
{
  [(UITextSelectionView *)self->_selectionView updateSelectionRects];
  [(UITextSelectionDisplayInteraction *)self->_selectionViewManager setNeedsSelectionUpdate];
  selectionViewManager = self->_selectionViewManager;
  [(UITextSelectionDisplayInteraction *)selectionViewManager layoutManagedSubviews];
}

- (BOOL)containerIsBrowserView
{
  if (WebKitFramework)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    id v3 = [WeakRetained _proxyTextInput];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (UITextInteraction)externalInteractions
{
  return self->_externalInteractions;
}

- (void)setExternalContextMenuInteractionDelegate:(id)a3
{
  p_externalContextMenuInteractionDelegate = &self->_externalContextMenuInteractionDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_externalContextMenuInteractionDelegate, v5);
  [(UITextContextMenuInteraction *)self->_textContextMenuInteraction setExternalContextMenuDelegate:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewConformsToAsynchronousInteractionViewProtocol, 0);
  objc_storeStrong((id *)&self->_viewRespondsToInteractiveTextSelectionDisabled, 0);
  objc_storeStrong((id *)&self->_viewConformsToTextItemInteracting, 0);
  objc_storeStrong((id *)&self->_rangeAdjustmentInteraction, 0);
  objc_storeStrong((id *)&self->_floatingCursorSession, 0);
  objc_storeStrong((id *)&self->_showDeleteButtonCursorAssertion, 0);
  objc_storeStrong((id *)&self->_showInputModesCursorAssertion, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_textSelectionController, 0);
  objc_storeStrong((id *)&self->_textChoicesAssistant, 0);
  objc_storeStrong((id *)&self->_editMenuAssistant, 0);
  objc_storeStrong((id *)&self->_selectionViewManager, 0);
  objc_storeStrong((id *)&self->_gestureState, 0);
  objc_storeStrong(&self->_keyboardSuppressionAssertion, 0);
  objc_storeStrong(&self->_grabberSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_externalInteractions, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_destroyWeak((id *)&self->_externalContextMenuInteractionDelegate);
  objc_storeStrong((id *)&self->_textContextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_linkInteraction, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_stashedTextRange, 0);
  objc_storeStrong((id *)&self->_textChecker, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (UITextInteractionAssistant)initWithResponder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextInteractionAssistant;
  id v5 = [(UITextInteractionAssistant *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    v5->_externalTextInput = 1;
    objc_storeWeak((id *)&v5->_view, v4);
    [(UITextInteractionAssistant *)v6 _updateRenderSpaceConversionConformance];
    int v7 = v6;
  }

  return v6;
}

- (id)textSelectionView
{
  selectionView = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager highlightView];
  id v4 = selectionView;
  if (!selectionView) {
    selectionView = self->_selectionView;
  }
  id v5 = selectionView;

  return v5;
}

- (BOOL)isInteractiveSelectionDisabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  viewRespondsToInteractiveTextSelectionDisabled = self->_viewRespondsToInteractiveTextSelectionDisabled;
  if (!viewRespondsToInteractiveTextSelectionDisabled)
  {
    id v5 = [NSNumber numberWithBool:objc_opt_respondsToSelector() & 1];
    id v6 = self->_viewRespondsToInteractiveTextSelectionDisabled;
    self->_viewRespondsToInteractiveTextSelectionDisabled = v5;

    viewRespondsToInteractiveTextSelectionDisabled = self->_viewRespondsToInteractiveTextSelectionDisabled;
  }
  if ([(NSNumber *)viewRespondsToInteractiveTextSelectionDisabled BOOLValue]) {
    char v7 = [WeakRetained _isInteractiveTextSelectionDisabled];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)_pointerInteractionDelegate
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_view);
    char v7 = [v6 _pointerInteractionDelegate];
  }
  else
  {
    char v7 = 0;
  }
  if (v7) {
    char v8 = v7;
  }
  else {
    char v8 = self;
  }
  objc_super v9 = v8;

  return v9;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id rect_24 = a3;
  id v8 = a4;
  id v9 = a5;
  [v8 location];
  double v11 = v10;
  double v13 = v12;
  uint64_t v114 = 0;
  v115 = &v114;
  v117 = &unk_186D7DBA7;
  uint64_t v116 = 0x4010000000;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v118 = *MEMORY[0x1E4F1DB20];
  long long v119 = v14;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v108 = 0;
  v109 = (id *)&v108;
  uint64_t v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__207;
  v112 = __Block_byref_object_dispose__207;
  v113 = @"_UITextCursorBoundingRegion";
  id v16 = [WeakRetained textInputView];
  if (!v16)
  {
    BOOL v21 = 0;
    goto LABEL_16;
  }
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained selectionClipRect];
LABEL_7:
    v22 = v115;
    v115[4] = v17;
    v22[5] = v18;
    v22[6] = v19;
    v22[7] = v20;
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained _selectionClipRect];
    goto LABEL_7;
  }
  uint64_t v17 = v115[4];
  uint64_t v18 = v115[5];
  uint64_t v19 = v115[6];
  uint64_t v20 = v115[7];
LABEL_9:
  if (CGRectIsNull(*(CGRect *)&v17))
  {
    v23 = +[UIKeyboardImpl activeInstance];
    v24 = [v23 inputDelegateManager];

    if (v24)
    {
      v25 = +[UIKeyboardImpl activeInstance];
      id v26 = [v25 inputDelegateManager];
      [v26 selectionClipRect];
      v27 = v115;
      v115[4] = v28;
      v27[5] = v29;
      v27[6] = v30;
      v27[7] = v31;
    }
  }
  if (CGRectIsNull(*((CGRect *)v115 + 1)))
  {
    [v16 bounds];
    id v36 = v115;
    v115[4] = v32;
    v36[5] = v33;
    v36[6] = v34;
    v36[7] = v35;
  }
  else
  {
    uint64_t v32 = v115[4];
    uint64_t v33 = v115[5];
    uint64_t v34 = v115[6];
    uint64_t v35 = v115[7];
  }
  v121.double x = v11;
  v121.CGFloat y = v13;
  BOOL v21 = CGRectContainsPoint(*(CGRect *)&v32, v121);
LABEL_16:
  viewConformsToTextItemInteracting = self->_viewConformsToTextItemInteracting;
  if (!viewConformsToTextItemInteracting)
  {
    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1ED42F900));
    v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v39 = self->_viewConformsToTextItemInteracting;
    self->_viewConformsToTextItemInteracting = v38;

    viewConformsToTextItemInteracting = self->_viewConformsToTextItemInteracting;
  }
  if ([(NSNumber *)viewConformsToTextItemInteracting BOOLValue])
  {
    id v40 = WeakRetained;
    v41 = objc_msgSend(v40, "_anyTextItemConstrainedToLineAtPoint:", v11, v13);
    v42 = v41;
    if (v41)
    {
      v43 = [v41 rects];
      v44 = [v43 firstObject];
      [v44 CGRectValue];
      v45 = v115;
      v115[4] = v46;
      v45[5] = v47;
      v45[6] = v48;
      v45[7] = v49;

      objc_storeStrong(v109 + 5, @"_UITextCursorLinkRegion");
    }
  }
  else
  {
    id v40 = [(UITextInteraction *)self->_linkInteraction view];
    if (objc_opt_respondsToSelector())
    {
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = __80__UITextInteractionAssistant_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
      v107[3] = &unk_1E530AC10;
      v107[4] = &v114;
      v107[5] = &v108;
      objc_msgSend(v40, "_requestTextItemConstrainedToLineAtPoint:resultHandler:", v107, v11, v13);
    }
  }

  int64_t v50 = [(UITextInteractionAssistant *)self currentCursorBehavior];
  double x = *MEMORY[0x1E4F1DB28];
  double v52 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v53 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v54 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  switch(v50)
  {
    case 0:
      if (!v21)
      {
        id v57 = v9;
        goto LABEL_74;
      }
      if ([(UITextInteractionAssistant *)self isInteractiveSelectionDisabled]) {
        BOOL v56 = v109[5] == @"_UITextCursorLinkRegion";
      }
      else {
        BOOL v56 = 1;
      }
      v58 = objc_msgSend(WeakRetained, "closestPositionToPoint:", v11, v13);
      if (v58) {
        BOOL v59 = v56;
      }
      else {
        BOOL v59 = 0;
      }
      if (!v59)
      {
        LOBYTE(v68) = 1;
        goto LABEL_69;
      }
      [WeakRetained caretRectForPosition:v58];
      CGFloat v101 = v60;
      CGFloat rect = v61;
      CGFloat rect_8 = v62;
      CGFloat rect_16 = v63;
      double v64 = *((double *)v115 + 7);
      v65 = +[_UIPointerSettingsDomain rootSettings];
      v66 = [v65 textSettings];

      if (vabdd_f64(rect_16, v64) >= 50.0)
      {
        [v66 regionCaptureMultiplier];
        double v70 = v69;
        UIDistanceBetweenPointAndRect(v11, v13, v101, rect_8, rect, rect_16);
        if (v71 >= rect_16 * v70) {
          goto LABEL_43;
        }
      }
      else
      {
        CGFloat v67 = -CGRectGetWidth(*((CGRect *)v115 + 1));
        v124.origin.double x = v101;
        v124.size.width = rect;
        v124.origin.CGFloat y = rect_8;
        v124.size.CGFloat height = rect_16;
        CGRect v125 = CGRectInset(v124, v67, 0.0);
        v122.double x = v11;
        v122.CGFloat y = v13;
        if (!CGRectContainsPoint(v125, v122))
        {
LABEL_43:
          if ([(UITextInteractionAssistant *)self hasActiveSelectionInteraction]) {
            goto LABEL_52;
          }
          int v68 = 0;
LABEL_48:
          if ([v109[5] isEqualToString:@"_UITextCursorLinkRegion"])
          {
            if (!v68) {
              goto LABEL_68;
            }
          }
          else
          {
            objc_storeStrong(v109 + 5, @"_UITextLineCursorRegion");
            if ((v68 & 1) == 0)
            {
              LOBYTE(v68) = 0;
LABEL_68:

LABEL_69:
              v94 = [rect_24 view];
              v95 = v94;
              if (v16 != v94)
              {
                objc_msgSend(v94, "convertRect:fromView:", v16, x, v52, v53, v54);
                double x = v96;
                double v52 = v97;
                double v53 = v98;
                double v54 = v99;
              }

              id v57 = v9;
              if (v68) {
                goto LABEL_72;
              }
              goto LABEL_74;
            }
          }
LABEL_52:
          [v16 bounds];
          CGFloat v73 = v72;
          CGFloat v75 = v74;
          double v77 = v76;
          CGFloat v79 = v78;
          double MinX = CGRectGetMinX(*((CGRect *)v115 + 1));
          v126.origin.double x = v73;
          v126.origin.CGFloat y = v75;
          v126.size.width = v77;
          v126.size.CGFloat height = v79;
          double v81 = CGRectGetMinX(v126);
          if (MinX < v81) {
            double MinX = v81;
          }
          double Width = CGRectGetWidth(*((CGRect *)v115 + 1));
          v127.origin.double x = v73;
          v127.origin.CGFloat y = v75;
          v127.size.width = v77;
          v127.size.CGFloat height = v79;
          double v83 = CGRectGetMaxX(v127) - MinX;
          if (Width >= v83) {
            double v84 = v83;
          }
          else {
            double v84 = Width;
          }
          if (v84 == v77)
          {
            v85 = [WeakRetained tokenizer];
            v86 = v85;
            if (v85)
            {
              v87 = [v85 rangeEnclosingPosition:v58 withGranularity:4 inDirection:0];
              if (v87
                || ([v86 rangeEnclosingPosition:v58 withGranularity:2 inDirection:0],
                    (v87 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                if (([v87 isEmpty] & 1) == 0)
                {
                  [WeakRetained firstRectForRange:v87];
                  CGFloat y = v128.origin.y;
                  CGFloat v89 = v128.size.width;
                  CGFloat height = v128.size.height;
                  CGFloat recta = v128.origin.x;
                  double v91 = CGRectGetWidth(v128);
                  if (v91 > 0.0)
                  {
                    v129.origin.double x = recta;
                    v129.origin.CGFloat y = y;
                    v129.size.width = v89;
                    v129.size.CGFloat height = height;
                    double MinX = CGRectGetMinX(v129);
                    double v84 = v91;
                  }
                }
              }
            }
          }
          [v66 textLineRegionPadding];
          CGFloat v93 = -v92;
          v130.origin.double x = MinX;
          v130.origin.CGFloat y = rect_8;
          v130.size.CGFloat height = rect_16;
          v130.size.width = v84;
          CGRect v131 = CGRectInset(v130, v93, v93);
          double x = v131.origin.x;
          double v52 = v131.origin.y;
          double v53 = v131.size.width;
          double v54 = v131.size.height;
          LOBYTE(v68) = 1;
          goto LABEL_68;
        }
      }
      int v68 = 1;
      goto LABEL_48;
    case 1:
      double x = *((double *)v115 + 4);
      double v52 = *((double *)v115 + 5);
      double v53 = *((double *)v115 + 6);
      double v54 = *((double *)v115 + 7);
      id v57 = v9;
      if (v21) {
        goto LABEL_72;
      }
LABEL_74:
      v55 = v57;
      goto LABEL_75;
    case 2:
      v55 = 0;
      goto LABEL_75;
  }
  id v57 = v9;
  if (!v21) {
    goto LABEL_74;
  }
LABEL_72:
  v132.origin.double x = x;
  v132.origin.CGFloat y = v52;
  v132.size.width = v53;
  v132.size.CGFloat height = v54;
  v123.double x = v11;
  v123.CGFloat y = v13;
  v55 = v9;
  if (CGRectContainsPoint(v132, v123))
  {
    v55 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v109[5], x, v52, v53, v54);
  }
LABEL_75:

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v114, 8);

  return v55;
}

void __80__UITextInteractionAssistant_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  if (!CGRectIsEmpty(*(CGRect *)&a3))
  {
    double v12 = *(double **)(*(void *)(a1 + 32) + 8);
    v12[4] = a3;
    v12[5] = a4;
    v12[6] = a5;
    v12[7] = a6;
    if (a2)
    {
      double v13 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      objc_storeStrong(v13, @"_UITextCursorLinkRegion");
    }
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v7 = [v5 identifier];
  int v8 = [v7 isEqual:@"_UITextCursorLinkRegion"];

  if (v8)
  {
    id v9 = +[UIPointerShape _linkPointerShape];
    double v10 = +[UIPointerStyle styleWithShape:v9 constrainedAxes:0];
LABEL_3:

    goto LABEL_12;
  }
  if (![(UITextInteractionAssistant *)self isInteractiveSelectionDisabled])
  {
    double v11 = [v5 identifier];
    if ([v11 isEqualToString:@"_UITextLineCursorRegion"])
    {

      goto LABEL_8;
    }
    int v12 = [v11 isEqualToString:@"_UITextCursorBoundingRegion"];

    if (v12)
    {
LABEL_8:
      [v5 rect];
      id v9 = objc_msgSend(WeakRetained, "closestPositionToPoint:", v14 + v13 * 0.5, v16 + v15 * 0.5);
      if (v9)
      {
        [WeakRetained caretRectForPosition:v9];
        if (v19 > v20)
        {
          double Width = CGRectGetWidth(*(CGRect *)&v17);
          uint64_t v22 = 1;
          goto LABEL_18;
        }
        double Width = CGRectGetHeight(*(CGRect *)&v17);
      }
      else
      {
        double Width = 0.0;
      }
      uint64_t v22 = 2;
LABEL_18:
      +[UITextInteraction _maximumBeamSnappingLength];
      uint64_t v25 = 2 * (Width <= v24);
      id v26 = +[UIPointerShape beamWithPreferredLength:v22 axis:Width];
      double v10 = +[UIPointerStyle styleWithShape:v26 constrainedAxes:v25];

      v27 = [v5 identifier];

      if (v27 != @"_UITextLineCursorRegion") {
        [v10 setConstrainedAxes:0];
      }
      goto LABEL_3;
    }
  }
  double v10 = +[UIPointerStyle systemPointerStyle];
LABEL_12:

  return v10;
}

- (BOOL)canShowSelectionCommands
{
  return self->_canShowSelectionCommands;
}

- (BOOL)needsGestureUpdate
{
  return self->_needsGestureUpdate;
}

- (void)setNeedsGestureUpdate:(BOOL)a3
{
  self->_needsGestureUpdate = a3;
}

- (id)grabberSuppressionAssertion
{
  return self->_grabberSuppressionAssertion;
}

- (void)setGrabberSuppressionAssertion:(id)a3
{
}

- (id)obtainSelectionGrabberSuppressionAssertion
{
  selectionView = self->_selectionView;
  if (selectionView) {
    [(UITextSelectionView *)selectionView obtainGrabberSuppressionAssertion];
  }
  else {
  id v4 = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager _obtainGrabberSuppressionAssertion];
  }
  return v4;
}

- (id)keyboardSuppressionAssertion
{
  return self->_keyboardSuppressionAssertion;
}

- (void)setKeyboardSuppressionAssertion:(id)a3
{
}

- (id)_asText
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v3 = [WeakRetained _proxyTextInput];

  return v3;
}

- (BOOL)_canAutoscroll
{
  id v3 = [(UITextInteractionAssistant *)self _asTextAutoscrolling];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(UITextInteractionAssistant *)self _asBETextInput];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(UITextInteractionAssistant *)self _asAsyncTextInputClient];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (id)_asTextAutoscrolling
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v3 = [WeakRetained _proxyTextInput];
  if ([v3 conformsToProtocolCached:&unk_1ED42E7C0])
  {
    BOOL v4 = [WeakRetained _proxyTextInput];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_asAsyncTextInputClient
{
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    BOOL v4 = [WeakRetained _proxyTextInput];
    int v5 = [v4 conformsToProtocolCached:&unk_1ED700940];

    if (v5)
    {
      id v6 = [WeakRetained _proxyTextInput];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_asBETextInput
{
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    BOOL v4 = [WeakRetained _proxyTextInput];
    int v5 = [v4 conformsToProtocolCached:&unk_1ED7009A0];

    if (v5)
    {
      id v6 = [WeakRetained _proxyTextInput];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)setSuppressSystemUI:(BOOL)a3
{
  BOOL suppressSystemUI = self->_suppressSystemUI;
  self->_BOOL suppressSystemUI = a3;
  if (suppressSystemUI != a3)
  {
    if (a3) {
      [(UITextInteractionAssistant *)self activateSelection];
    }
    else {
      [(UITextInteractionAssistant *)self deactivateSelection];
    }
  }
}

- (UITextRangeAdjustmentInteraction)rangeAdjustmentInteraction
{
  return self->_rangeAdjustmentInteraction;
}

- (int)selectionHighlightMode
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    selectionViewManager = self->_selectionViewManager;
    return [(UITextSelectionDisplayInteraction *)selectionViewManager rangeViewMode];
  }
  else
  {
    int v5 = [(UITextSelectionView *)self->_selectionView rangeView];
    int v6 = [v5 mode];

    return v6;
  }
}

- (void)setSelectionHighlightMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(UITextSelectionView *)self->_selectionView rangeView];
  [v5 setMode:v3];

  selectionViewManager = self->_selectionViewManager;
  [(UITextSelectionDisplayInteraction *)selectionViewManager setRangeViewMode:v3];
}

- (void)selectionChanged
{
  id v8 = [(UITextInteractionAssistant *)self activeSelection];
  [v8 selectionChanged];
  uint64_t v3 = [(UITextInteractionAssistant *)self view];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(UITextInteractionAssistant *)self viewConformsToAsynchronousInteractionProtocol])
  {
    int v4 = [v3 shouldAllowHidingSelectionCommands] ^ 1;
  }
  else
  {
    int v4 = 0;
  }
  if (([v8 isCommitting] & 1) == 0
    && ((v4 | [(UITextInteractionAssistant *)self expectingCommit]) & 1) == 0)
  {
    [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant _hideSelectionCommandsWithReason:2];
    [(UITextLinkInteraction *)self->_linkInteraction dismissEditMenuOnSelectionChangeIfNecessary];
    textChoicesAssistant = self->_textChoicesAssistant;
    int v6 = [v8 selectedRange];
    char v7 = [v6 start];
    [(_UITextChoiceAccelerationAssistant *)textChoicesAssistant updateUnderlinesIfNeededAfterPosition:v7];
  }
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    if (([v8 isCommitting] & 1) != 0
      || [(UITextInteractionAssistant *)self expectingCommit]
      || [(UITextInteractionAssistant *)self requiresImmediateUpdate])
    {
      [(UITextSelectionDisplayInteraction *)self->_selectionViewManager layoutManagedSubviews];
    }
    else
    {
      [(UITextSelectionDisplayInteraction *)self->_selectionViewManager setNeedsSelectionUpdate];
    }
  }
  else
  {
    [(UITextSelectionView *)self->_selectionView selectionChanged];
  }
  if (![(UITextInteractionAssistant *)self usesAsynchronousSelectionController]) {
    [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
  }
}

- (BOOL)_selectionIsActivated
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    selectionViewManager = self->_selectionViewManager;
    return [(UITextSelectionDisplayInteraction *)selectionViewManager isActivated];
  }
  else
  {
    selectionView = self->_selectionView;
    return [(UITextSelectionView *)selectionView isValid];
  }
}

- (void)activateSelection
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    [(UITextSelectionDisplayInteraction *)self->_selectionViewManager setActivated:1];
  }
  else
  {
    uint64_t v3 = [(UITextInteractionAssistant *)self _legacySelectionView];
    [v3 validateWithInteractionAssistant:self];

    int v4 = [(UITextInteractionAssistant *)self _legacySelectionView];
    [v4 activate];
  }
  if ([(UITextInteractionAssistant *)self containerAllowsSelectionTintOnly])
  {
    [(UITextInteractionAssistant *)self setSelectionHighlightMode:1];
  }
}

- (void)deactivateSelection
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    [(UITextSelectionDisplayInteraction *)self->_selectionViewManager setActivated:0];
  }
  else
  {
    [(UITextSelectionView *)self->_selectionView deactivate];
  }
  [(_UITextChoiceAccelerationAssistant *)self->_textChoicesAssistant setNeedsUnderlineUpdate];
  editMenuAssistant = self->_editMenuAssistant;
  [(_UITextInteractionEditMenuAssistant *)editMenuAssistant hideSelectionCommands];
}

- (void)_invalidateSelectionDisplay
{
  [(UITextSelectionView *)self->_selectionView updateSelectionRectsIfNeeded];
  [(UITextSelectionDisplayInteraction *)self->_selectionViewManager _layoutManagedSubviewsResettingBlinkingAnimation:0];
  [(_UITextChoiceAccelerationAssistant *)self->_textChoicesAssistant refreshExistingUnderlines];
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 updateActiveAutocorrectionRects];
}

- (void)setSelectionDisplayVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    selectionView = self->_selectionView;
    [(UITextSelectionView *)selectionView setVisible:v3];
  }
}

- (BOOL)isSelectionDisplayVisible
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    return 1;
  }
  selectionView = self->_selectionView;
  return [(UITextSelectionView *)selectionView visible];
}

- (void)setCursorBlinkAnimationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    id v6 = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager cursorView];
    [v6 setBlinking:v3];
  }
  else
  {
    selectionView = self->_selectionView;
    [(UITextSelectionView *)selectionView setCaretBlinks:v3];
  }
}

- (BOOL)isCursorBlinkAnimationEnabled
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    BOOL v3 = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager cursorView];
    char v4 = [v3 isBlinking];

    return v4;
  }
  else
  {
    selectionView = self->_selectionView;
    return [(UITextSelectionView *)selectionView caretBlinks];
  }
}

- (void)setGlowViewMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    selectionViewManager = self->_selectionViewManager;
    [(UITextSelectionDisplayInteraction *)selectionViewManager _setGlowViewMode:v3];
  }
}

- (int)glowViewMode
{
  int result = +[UITextSelectionDisplayInteraction isModernSelectionViewEnabled];
  if (result)
  {
    selectionViewManager = self->_selectionViewManager;
    return [(UITextSelectionDisplayInteraction *)selectionViewManager _glowViewMode];
  }
  return result;
}

- (id)selectionView
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    NSLog(&cfstr_WarningUitexti.isa);
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(UITextInteractionAssistant *)self _legacySelectionView];
  }
  return v3;
}

- (_UITextSelectionWidgetAnimating)_caretView
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    [(UITextSelectionDisplayInteraction *)self->_selectionViewManager _cursorView];
  }
  else
  {
    [(UITextSelectionView *)self->_selectionView caretView];
  uint64_t v3 = };
  return (_UITextSelectionWidgetAnimating *)v3;
}

- (UIView)dynamicCaretView
{
  return (UIView *)[(UITextSelectionView *)self->_selectionView dynamicCaret];
}

- (BOOL)requiresImmediateUpdate
{
  return 0;
}

- (BOOL)shouldDisplayLoupeSessionForTouchType:(int64_t)a3
{
  return a3 == 0;
}

- (unint64_t)loupeOrientation
{
  if ([(UITextInteractionAssistant *)self isDisplayingVerticalSelection]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (UITextInput)textDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ([(UITextInteractionAssistant *)self containerIsBrowserView])
  {
    char v4 = [WeakRetained _proxyTextInput];
    uint64_t v5 = [v4 formElement];
    id v6 = (void *)v5;
    if (v5) {
      char v7 = (void *)v5;
    }
    else {
      char v7 = WeakRetained;
    }
    id v8 = v7;

    id WeakRetained = v8;
  }
  return (UITextInput *)WeakRetained;
}

- (UITextInteraction)interactions
{
  return self->_interactions;
}

- (id)linkInteraction
{
  uint64_t v3 = [(UITextInteraction *)self->_linkInteraction view];

  if (v3) {
    char v4 = self->_linkInteraction;
  }
  else {
    char v4 = 0;
  }
  return v4;
}

- (void)setExternalInteractions:(id)a3
{
  char v4 = (UITextInteraction *)a3;
  int64_t textInteractionMode = self->_textInteractionMode;
  uint64_t v6 = [(UITextInteraction *)v4 textInteractionMode];
  externalInteractions = self->_externalInteractions;
  self->_externalInteractions = v4;
  id v8 = v4;

  self->_int64_t textInteractionMode = [(UITextInteraction *)v8 textInteractionMode];
  id v9 = [(UITextInteraction *)v8 delegate];
  [(UITextInteraction *)self->_interactions setDelegate:v9];

  if (textInteractionMode != v6)
  {
    [(UITextInteractionAssistant *)self setGestureRecognizers];
  }
}

- (UITapGestureRecognizer)singleTapGesture
{
  return (UITapGestureRecognizer *)[(UITextInteraction *)self->_interactions recognizerForName:0x1ED174000];
}

- (UIGestureRecognizer)doubleTapGesture
{
  return (UIGestureRecognizer *)[(UITextInteraction *)self->_interactions recognizerForName:0x1ED174080];
}

- (UILongPressGestureRecognizer)loupeGesture
{
  return (UILongPressGestureRecognizer *)[(UITextInteraction *)self->_interactions recognizerForName:0x1ED174100];
}

- (void)setLoupeGestureEndPoint:(CGPoint)a3
{
  self->_loupeGestureEndPoint = a3;
}

- (CGPoint)loupeGestureEndPoint
{
  double x = self->_loupeGestureEndPoint.x;
  double y = self->_loupeGestureEndPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInGesture:(BOOL)a3
{
  self->_inGesture = a3;
}

- (BOOL)autoscrolled
{
  return self->_autoscrolled;
}

- (void)setAutoscrolled:(BOOL)a3
{
  self->_autoscrolled = a3;
}

- (CGPoint)autoscrollUntransformedExtentPoint
{
  double x = self->_autoscrollUntransformedExtentPoint.x;
  double y = self->_autoscrollUntransformedExtentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAutoscrollUntransformedExtentPoint:(CGPoint)a3
{
  self->_autoscrollUntransformedExtentPoint = a3;
}

- (BOOL)externalTextInput
{
  return self->_externalTextInput;
}

- (BOOL)expectingCommit
{
  return self->_expectingCommit;
}

- (void)setExpectingCommit:(BOOL)a3
{
  self->_expectingCommit = a3;
}

- (void)invalidate
{
  [(UITextInteractionAssistant *)self detach:1];
  selectionView = self->_selectionView;
  [(UITextSelectionView *)selectionView invalidate];
}

- (BOOL)isValid
{
  BOOL v3 = [(UITextInteractionAssistant *)self _selectionIsActivated];
  if (v3)
  {
    char v4 = [(UITextInteractionAssistant *)self activeSelection];
    char v5 = [v4 isValid];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)detach
{
}

- (UIScrollView)scrollView
{
  BOOL v2 = [(UITextInteractionAssistant *)self view];
  BOOL v3 = [v2 textInputView];
  char v4 = [v3 _enclosingScrollerIncludingSelf];

  return (UIScrollView *)v4;
}

- (UIFieldEditor)fieldEditor
{
  BOOL v3 = [(UITextInteractionAssistant *)self view];
  char v4 = [v3 _proxyTextInput];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v6 = [(UITextInteractionAssistant *)self view];
  char v7 = [v6 _proxyTextInput];
  if (isKindOfClass) {
    goto LABEL_12;
  }
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  id v9 = [(UITextInteractionAssistant *)self view];
  uint64_t v6 = v9;
  if (v8)
  {
    double v10 = [v9 _proxyTextInput];
    char v7 = [v10 _fieldEditor];

LABEL_12:
    goto LABEL_13;
  }
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  int v12 = [(UITextInteractionAssistant *)self view];
  uint64_t v6 = v12;
  if (v11)
  {
    id v13 = [v12 _fieldEditor];
LABEL_11:
    char v7 = v13;
    goto LABEL_12;
  }
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  if (v14)
  {
    double v15 = [(UITextInteractionAssistant *)self view];
    uint64_t v6 = [v15 _firstTextView];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v16 = v6;
    }
    else {
      double v16 = 0;
    }
    id v13 = v16;
    goto LABEL_11;
  }
  char v7 = 0;
LABEL_13:
  return (UIFieldEditor *)v7;
}

- (BOOL)containerIsTextField
{
  BOOL v3 = [(UITextInteractionAssistant *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(UITextInteractionAssistant *)self view];
    uint64_t v6 = [v5 _proxyTextInput];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v4 = 1;
    }
    else
    {
      char v7 = [(UITextInteractionAssistant *)self fieldEditor];
      BOOL v4 = v7 != 0;
    }
  }

  return v4;
}

- (BOOL)containerAllowsSelection
{
  BOOL v3 = [(UITextInteractionAssistant *)self view];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  char v5 = [(UITextInteractionAssistant *)self view];
  uint64_t v6 = [v5 clearingBehavior];

  return v6 != 2;
}

- (BOOL)containerAllowsSelectionTintOnly
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v4 = objc_opt_respondsToSelector();

  BOOL result = 0;
  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_view);
    uint64_t v6 = [v5 clearingBehavior];

    if (v6 == 3) {
      return 1;
    }
  }
  return result;
}

- (void)canBeginDragCursor:(id)a3
{
  id v10 = a3;
  char v4 = [(UITextInteractionAssistant *)self scrollView];
  [v4 contentSize];
  double v6 = v5;

  char v7 = [(UITextInteractionAssistant *)self scrollView];
  [v7 bounds];
  double v9 = v8;

  if (v6 > v9) {
    [v10 setCanBeginDrag:0];
  }
}

- (void)setGestureRecognizers:(id)a3
{
  p_view = &self->_view;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  char v7 = [WeakRetained _responderWindow];
  double v8 = [v7 windowScene];
  double v9 = [v8 keyboardSceneDelegate];
  id v10 = [v5 object];

  if (v9 == v10)
  {
    [(UITextInteractionAssistant *)self setGestureRecognizers];
  }
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return [(UITextContextMenuInteraction *)self->_textContextMenuInteraction contextMenuInteraction];
}

- (void)setFirstResponderIfNecessary
{
}

- (void)setFirstResponderIfNecessaryActivatingSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  int v5 = [WeakRetained isFirstResponder];
  if (([WeakRetained isFirstResponder] & 1) == 0)
  {
    if (![(UITextInteractionAssistant *)self containerIsBrowserView]
      || ([WeakRetained _proxyTextInput],
          double v6 = objc_claimAutoreleasedReturnValue(),
          [v6 formElement],
          char v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          !v7))
    {
      [WeakRetained becomeFirstResponder];
    }
  }
  if ([WeakRetained isFirstResponder])
  {
    double v8 = [(UITextInteractionAssistant *)self view];
    double v9 = [v8 _responderWindow];
    [v9 makeKeyWindow];

    if (v5)
    {
      id v10 = [WeakRetained _responderWindow];
      char v11 = [v10 _isApplicationKeyWindow];

      if ((v11 & 1) == 0) {
        [WeakRetained reloadInputViews];
      }
    }
    [(UITextCursorAssertionController *)self->_assertionController _updateSubjectWithAssertionState];
  }
  if (v3)
  {
    if ([WeakRetained isFirstResponder])
    {
      if (![(UITextInteractionAssistant *)self _selectionIsActivated])
      {
        int v12 = +[UITextInputTraits traitsByAdoptingTraits:WeakRetained];
        char v13 = [v12 deferBecomingResponder];

        if ((v13 & 1) == 0) {
          [(UITextInteractionAssistant *)self activateSelection];
        }
      }
    }
  }
}

- (void)scrollSelectionToVisible
{
}

- (void)scrollSelectionToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  int v5 = [(UITextInteractionAssistant *)self scrollView];
  if (v5)
  {
    double v6 = [(UITextInteractionAssistant *)self activeSelection];
    char v7 = [v6 selectedRange];

    if (!v7)
    {
      double v8 = [(UITextInteractionAssistant *)self activeSelection];
      [v8 selectionChanged];
    }
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    char v13 = [(UITextInteractionAssistant *)self activeSelection];
    char v14 = [v13 selectedRange];

    if (v14)
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      double v15 = [(UITextInteractionAssistant *)self activeSelection];
      double v16 = [v15 selectionRects];

      uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v42;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v42 != v19) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v41 + 1) + 8 * v20) rect];
            v50.origin.double x = v21;
            v50.origin.double y = v22;
            v50.size.double width = v23;
            v50.size.double height = v24;
            v47.origin.double x = x;
            v47.origin.double y = y;
            v47.size.double width = width;
            v47.size.double height = height;
            CGRect v48 = CGRectUnion(v47, v50);
            double x = v48.origin.x;
            double y = v48.origin.y;
            double width = v48.size.width;
            double height = v48.size.height;
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v18);
      }
    }
    v49.origin.double x = x;
    v49.origin.double y = y;
    v49.size.double width = width;
    v49.size.double height = height;
    if (CGRectIsNull(v49))
    {
      uint64_t v25 = [(UITextInteractionAssistant *)self activeSelection];
      [v25 caretRect];
      double x = v26;
      double y = v27;
      double width = v28;
      double height = v29;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    uint64_t v31 = [WeakRetained textInputView];
    objc_msgSend(v5, "convertRect:fromView:", v31, x, y, width, height);
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;

    if (v37 == 0.0) {
      double v40 = 1.0;
    }
    else {
      double v40 = v37;
    }
    objc_msgSend(v5, "scrollRectToVisible:animated:", v3, v33, v35, v40, v39);
  }
}

- (void)setWillHandoffLoupeMagnifier
{
  self->_willHandoffLoupeMagnifier = 1;
}

- (void)resetWillHandoffLoupeMagnifier
{
  self->_willHandoffLoupeMagnifier = 0;
}

- (BOOL)willHandoffLoupeMagnifier
{
  return self->_willHandoffLoupeMagnifier;
}

- (void)loupeGestureWithState:(int64_t)a3 location:(id)a4 translation:(id)a5 velocity:(id)a6 modifierFlags:(int64_t)a7 shouldCancel:(BOOL *)a8
{
  interactions = self->_interactions;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = [(UITextInteraction *)interactions interactionWithGestureForName:0x1ED174100];
  [v17 willBeginExternalGesture];
  [v17 loupeGestureWithState:a3 location:v16 translation:v15 velocity:v14 modifierFlags:a7 shouldCancel:a8];
}

- (void)loupeMagnifierWithState:(int64_t)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v8 = +[UITextMagnifierCaret sharedCaretMagnifier];
  if (a3 == 2)
  {
    id v11 = v8;
    objc_msgSend(v8, "setMagnificationPoint:", x, y);
LABEL_10:
    double v8 = v11;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    if (self->_willHandoffLoupeMagnifier)
    {
      self->_willHandoffLoupeMagnifier = 0;
      goto LABEL_11;
    }
    id v11 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    id v10 = [WeakRetained textInputView];
    objc_msgSend(v11, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v10, WeakRetained, 1, x, y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    goto LABEL_10;
  }
  if ((unint64_t)(a3 - 3) <= 1)
  {
    id v11 = v8;
    objc_msgSend(v8, "setMagnificationPoint:", x, y);
    double v8 = v11;
    if (!self->_willHandoffLoupeMagnifier)
    {
      [v11 stopMagnifying:1];
      [(UITextInteractionAssistant *)self didEndSelectionInteraction];
      goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)rangedMagnifierWithState:(int64_t)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v8 = +[UITextMagnifierRanged sharedRangedMagnifier];
  if (a3 == 2)
  {
    id v11 = v8;
    objc_msgSend(v8, "setMagnificationPoint:", x, y);
  }
  else if (a3 == 1)
  {
    id v11 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    id v10 = [WeakRetained textInputView];
    objc_msgSend(v11, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v10, WeakRetained, 1, x, y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  else
  {
    if ((unint64_t)(a3 - 3) > 1) {
      goto LABEL_8;
    }
    id v11 = v8;
    objc_msgSend(v8, "setMagnificationPoint:", x, y);
    [v11 stopMagnifying:1];
  }
  double v8 = v11;
LABEL_8:
}

- (void)lollipopGestureWithState:(int64_t)a3 location:(CGPoint)a4 locationOfFirstTouch:(CGPoint)a5 forTouchType:(int64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v12 = [(UITextInteractionAssistant *)self rangeAdjustmentInteraction];
  objc_msgSend(v12, "manuallyUpdateInteractionWithGestureState:location:locationOfFirstTouch:forTouchType:", a3, a6, v10, v9, x, y);
}

- (void)setSelectionWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(UITextInteractionAssistant *)self activeSelection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ([WeakRetained isEditable])
  {
  }
  else
  {
    char v7 = [v8 hasEditableSelection];

    if ((v7 & 1) == 0) {
      goto LABEL_5;
    }
  }
  objc_msgSend(v8, "setSelectionWithPoint:", x, y);
  [v8 setGranularity:0];
LABEL_5:
}

- (void)commitSelectionWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v14 = [(UITextInteractionAssistant *)self activeSelection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ([WeakRetained isEditable])
  {
  }
  else
  {
    char v7 = [v14 hasEditableSelection];

    if ((v7 & 1) == 0) {
      goto LABEL_5;
    }
  }
  id v8 = [(UITextInteractionAssistant *)self _legacySelectionView];
  objc_msgSend(v8, "floatingCursorPositionForPoint:", x, y);
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v14, "setSelectionWithPoint:", v10, v12);
  [v14 setGranularity:0];
  char v13 = [(UITextInteractionAssistant *)self activeSelection];
  [v13 commit];

  [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
LABEL_5:
}

- (void)extendSelectionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(UITextInteractionAssistant *)self activeSelection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if ([WeakRetained isEditable])
  {
  }
  else
  {
    char v7 = [v8 hasEditableSelection];

    if ((v7 & 1) == 0) {
      goto LABEL_5;
    }
  }
  objc_msgSend(v8, "extendSelectionToPoint:", x, y);
  [v8 setGranularity:0];
LABEL_5:
}

- (void)extendSelectionToLoupeOrSetToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!self->_stashedTextRange) {
    goto LABEL_10;
  }
  double v6 = [(UITextInteractionAssistant *)self loupeGesture];
  if (![v6 numberOfTouches]) {
    goto LABEL_9;
  }
  char v7 = [(UITextInteractionAssistant *)self loupeGesture];
  if ([v7 state] <= 0)
  {

LABEL_9:
    goto LABEL_10;
  }
  id v8 = [(UITextInteractionAssistant *)self loupeGesture];
  uint64_t v9 = [v8 state];

  if (v9 <= 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained setSelectedTextRange:self->_stashedTextRange];

    self->_didUseStashedRange = 1;
    double v11 = [(UITextInteractionAssistant *)self loupeGesture];
    double v12 = [(UITextInteractionAssistant *)self loupeGesture];
    char v13 = [v12 view];
    [v11 locationInView:v13];
    double v15 = v14;
    double v17 = v16;

    -[UITextInteractionAssistant extendSelectionToPoint:](self, "extendSelectionToPoint:", v15, v17);
    return;
  }
LABEL_10:
  -[UITextInteractionAssistant setSelectionWithPoint:](self, "setSelectionWithPoint:", x, y);
}

+ (int64_t)_nextGranularityInCycle:(int64_t)a3 forTouchType:(int64_t)a4
{
  uint64_t v4 = 2;
  if (a4 == 3) {
    uint64_t v4 = 3;
  }
  if (((1 << a3) & 0x14) != 0) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = v4;
  }
  if (((1 << a3) & 0x29) != 0) {
    int64_t v6 = 1;
  }
  else {
    int64_t v6 = v5;
  }
  if ((unint64_t)a3 <= 5) {
    return v6;
  }
  else {
    return a3;
  }
}

- (void)checkEditabilityAndSetFirstResponderIfNecessary
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  self->_needsGestureUpdate = [WeakRetained isFirstResponder] ^ 1;

  id v12 = [(UITextInteractionAssistant *)self activeSelection];
  id v5 = objc_loadWeakRetained((id *)p_view);
  if ([(UITextInteractionAssistant *)self viewCouldBecomeEditable:v5])
  {
    int64_t v6 = [v12 selectedRange];
    char v7 = [v6 _isRanged];

    if ((v7 & 1) == 0)
    {
      id v8 = +[UIKeyboardImpl sharedInstance];
      [v8 updateChangeTimeAndIncrementCount];

      id v9 = objc_loadWeakRetained((id *)p_view);
      [v9 setEditable:1];

      [(UITextInteractionAssistant *)self setFirstResponderIfNecessary];
LABEL_7:
      [(UITextInteractionAssistant *)self setGestureRecognizers];
      goto LABEL_8;
    }
  }
  else
  {
  }
  [(UITextInteractionAssistant *)self setFirstResponderIfNecessary];
  if (self->_needsGestureUpdate)
  {
    id v10 = objc_loadWeakRetained((id *)p_view);
    int v11 = [v10 isFirstResponder];

    if (v11) {
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)selectWord
{
  [(UITextInteractionAssistant *)self setFirstResponderIfNecessary];
  [(UITextInteractionAssistant *)self configureForSelectionMode];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [(UITextInteractionAssistant *)self beginSelectionChange];
  BOOL v3 = [(UITextInteractionAssistant *)self activeSelection];
  [v3 caretRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (([WeakRetained isEditable] & 1) != 0
    || (v16.origin.double x = v5, v16.origin.y = v7, v16.size.width = v9, v16.size.height = v11, !CGRectIsEmpty(v16)))
  {
    double x = v5 + v9 * 0.5;
    double y = v7 + v11 * 0.5;
  }
  else
  {
    double x = self->_loupeGestureEndPoint.x;
    double y = self->_loupeGestureEndPoint.y;
  }
  objc_msgSend(v3, "alterSelection:granularity:", 1, x, y);
  [v3 commit];
  [(UITextInteractionAssistant *)self endSelectionChange];
  if ([(UITextInteractionAssistant(UITextInteractionAssistant_Internal) *)self canShowSelectionCommands])
  {
    [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant showSelectionCommandsAfterDelay:0.2];
  }
  [(UITextInteractionAssistant *)self scrollSelectionToVisible];
  [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
}

- (void)selectWordWithoutShowingCommands
{
  [(UITextInteractionAssistant *)self setFirstResponderIfNecessary];
  [(UITextInteractionAssistant *)self configureForSelectionMode];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [(UITextInteractionAssistant *)self beginSelectionChange];
  BOOL v3 = [(UITextInteractionAssistant *)self activeSelection];
  [v3 caretRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (([WeakRetained isEditable] & 1) != 0
    || (v16.origin.double x = v5, v16.origin.y = v7, v16.size.width = v9, v16.size.height = v11, !CGRectIsEmpty(v16)))
  {
    double x = v5 + v9 * 0.5;
    double y = v7 + v11 * 0.5;
  }
  else
  {
    double x = self->_loupeGestureEndPoint.x;
    double y = self->_loupeGestureEndPoint.y;
  }
  objc_msgSend(v3, "alterSelection:granularity:", 1, x, y);
  [v3 commit];
  [(UITextInteractionAssistant *)self endSelectionChange];
  [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
}

- (BOOL)shouldSuppressSelectionCommands
{
  if (self->_automaticSelectionCommandsSuppressed) {
    goto LABEL_4;
  }
  BOOL v3 = [(UITextInteractionAssistant *)self textDocument];
  BOOL v4 = +[UIDictationController shouldHideSelectionUIForTextView:v3];

  if (v4
    || (+[UIKeyboardImpl activeInstance],
        double v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 shouldSuppressSelectionCommands],
        v5,
        (v6 & 1) != 0))
  {
LABEL_4:
    LOBYTE(v7) = 1;
  }
  else
  {
    double v9 = [(UITextInteractionAssistant *)self _asBETextInput];
    if (objc_opt_respondsToSelector())
    {
      int v7 = [v9 automaticallyPresentEditMenu] ^ 1;
    }
    else
    {
      double v10 = [(UITextInteractionAssistant *)self _asAsyncTextInputClient];
      if (objc_opt_respondsToSelector())
      {
        LOBYTE(v7) = [v10 shouldSuppressEditMenu];
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
        if (objc_opt_respondsToSelector()) {
          LOBYTE(v7) = [WeakRetained _shouldSuppressSelectionCommands];
        }
        else {
          LOBYTE(v7) = 0;
        }
      }
    }
  }
  return v7;
}

- (void)showSelectionCommands
{
}

- (void)hideSelectionCommands
{
}

- (void)setAutomaticSelectionCommandsSuppressedForPointerTouchType:(BOOL)a3
{
  self->_automaticSelectionCommandsSuppressed = a3;
}

- (void)selectAll:(id)a3
{
  [(UITextInteractionAssistant *)self setFirstResponderIfNecessary];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [(UITextInteractionAssistant *)self beginSelectionChange];
  double v5 = [(UITextInteractionAssistant *)self activeSelection];
  [v5 selectAll];
  [v5 commit];
  [(UITextInteractionAssistant *)self endSelectionChange];
  if (a3
    && [(UITextInteractionAssistant(UITextInteractionAssistant_Internal) *)self canShowSelectionCommands])
  {
    [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant showSelectionCommandsAfterDelay:0.2];
  }
  [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
}

- (void)clearSelection
{
  BOOL v3 = [(UITextInteractionAssistant *)self _legacySelectionView];
  [v3 removeFromSuperview];

  [(UITextInteractionAssistant *)self beginSelectionChange];
  id v4 = [(UITextInteractionAssistant *)self activeSelection];
  [v4 clearSelection];
  [v4 commit];
  [(UITextInteractionAssistant *)self endSelectionChange];
  [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
}

- (void)notifyKeyboardSelectionChanged
{
  BOOL v3 = [(UITextInteractionAssistant *)self view];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v8 = [(UITextInteractionAssistant *)self view];
    double v5 = +[UIKeyboardImpl activeInstance];
    char v6 = [v5 inputDelegateManager];
    int v7 = [v6 keyInputDelegate];
    [v8 keyboardInputChangedSelection:v7];
  }
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
}

- (void)_updateSelectionWithPoint:(CGPoint)a3 granularity:(int64_t)a4 forceGranularity:(BOOL)a5
{
  double y = a3.y;
  double x = a3.x;
  id v16 = [(UITextInteractionAssistant *)self activeSelection];
  double v10 = [(UITextInteractionAssistant *)self rangeAdjustmentInteraction];
  uint64_t v11 = [v10 baseIsStart];

  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    id v12 = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager highlightView];
  }
  else
  {
    char v13 = [(UITextInteractionAssistant *)self _legacySelectionView];
    id v12 = [v13 rangeView];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  double v15 = [WeakRetained textInputView];
  objc_msgSend(v12, "convertPoint:toView:", v15, x, y);

  objc_msgSend(v16, "setRangedSelectionExtentPoint:baseIsStart:", v11, x, y);
  if (a5 || [v16 willSelectionChange]) {
    [v16 setGranularity:a4];
  }
  [v16 commit];
  [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
}

- (void)updateWithMagnifierTerminalPoint:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
LABEL_13:
    double v14 = [(UITextInteractionAssistant *)self _editMenuAssistant];
    char v15 = [v14 _editMenuIsVisible];

    if ((v15 & 1) == 0)
    {
      id v16 = [(UITextInteractionAssistant *)self _editMenuAssistant];
      [v16 showSelectionCommandsAfterDelay:0.0];
    }
    [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
    return;
  }
  double v5 = [(UITextInteractionAssistant *)self _legacySelectionView];
  id v17 = [v5 rangeView];

  char v6 = +[UITextMagnifierRanged sharedRangedMagnifier];
  int v7 = [v6 target];

  if (v7)
  {
    if ((![v6 terminalPointPlacedCarefully]
       || [(UITextInteractionAssistant *)self autoscrolled])
      && ([(UITextInteractionAssistant *)self _legacySelectionView],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      [(UITextInteractionAssistant *)self beginSelectionChange];
      [v17 setAnimateUpdate:1];
      double v10 = [v17 startGrabber];
      [v10 setAnimating:1];

      uint64_t v11 = [v17 endGrabber];
      [v11 setAnimating:1];

      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      double v26 = __100__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updateWithMagnifierTerminalPoint___block_invoke;
      double v27 = &unk_1E52DD450;
      id v28 = v6;
      double v29 = self;
      id v12 = v17;
      id v30 = v12;
      id v31 = WeakRetained;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      CGFloat v21 = __100__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updateWithMagnifierTerminalPoint___block_invoke_2;
      CGFloat v22 = &unk_1E52DC3A0;
      CGFloat v23 = self;
      id v13 = WeakRetained;
      +[UIView animateWithDuration:0x20000 delay:&v24 options:&v19 animations:0.2 completion:0.0];
      [v12 setAnimateUpdate:0];
      [(UITextInteractionAssistant *)self endSelectionChange];
    }
    else if (v3)
    {
      [v6 terminalPoint];
      objc_msgSend(v6, "setMagnificationPoint:");
      [v17 activeTouchPoint];
      -[UITextInteractionAssistant updateSelectionWithPoint:](self, "updateSelectionWithPoint:");
    }
    objc_msgSend(v6, "stopMagnifying:", 1, v17, v19, v20, v21, v22, v23, v24, v25, v26, v27);

    goto LABEL_13;
  }
  [v6 stopMagnifying:0];
}

void __100__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updateWithMagnifierTerminalPoint___block_invoke(id *a1)
{
  int v2 = [a1[4] horizontalMovement];
  if (v2 >= 0) {
    unsigned int v3 = -1;
  }
  else {
    unsigned int v3 = 3;
  }
  if (v2 <= 0) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 2;
  }
  id v11 = [a1[5] activeSelection];
  objc_msgSend(v11, "smartExtendRangedSelection:downstream:", v4, objc_msgSend(a1[6], "baseIsStart"));
  [v11 commit];
  [a1[6] updateBaseAndExtentPointsFromEdges];
  id v5 = a1[6];
  [v5 extentPoint];
  double v7 = v6;
  double v9 = v8;
  double v10 = [a1[7] textInputView];
  objc_msgSend(v5, "convertPoint:toView:", v10, v7, v9);
  objc_msgSend(a1[4], "setAnimationPoint:");
}

uint64_t __100__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updateWithMagnifierTerminalPoint___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) selectionAnimationDidStop];
}

- (void)selectionAnimationDidStop
{
  int v2 = [(UITextInteractionAssistant *)self _legacySelectionView];
  id v5 = [v2 rangeView];

  unsigned int v3 = [v5 startGrabber];
  [v3 setAnimating:0];

  uint64_t v4 = [v5 endGrabber];
  [v4 setAnimating:0];
}

- (void)rangeSelectionStarted:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UITextInteractionAssistant *)self interactions];
  objc_msgSend(v6, "_callDelegateWillMoveTextRangeExtentAtPoint:", x, y);

  id v10 = [(UITextInteractionAssistant *)self activeSelection];
  double v7 = [(UITextInteractionAssistant *)self _legacySelectionView];
  double v8 = [v7 rangeView];

  [(UITextInteractionAssistant *)self willBeginSelectionInteraction];
  [(UITextInteractionAssistant *)self beginSelectionChange];
  if ([v8 baseIsStart])
  {
    [v10 setRangedSelectionBaseToCurrentSelectionStart];
    [v10 setRangedSelectionInitialExtentToCurrentSelectionEnd];
  }
  else
  {
    [v10 setRangedSelectionBaseToCurrentSelectionEnd];
    [v10 setRangedSelectionInitialExtentToCurrentSelectionStart];
  }
  double v9 = [(UITextInteractionAssistant *)self _legacySelectionView];
  [v9 setForceRangeView:1];

  -[UITextInteractionAssistant _updateSelectionWithPoint:granularity:forceGranularity:](self, "_updateSelectionWithPoint:granularity:forceGranularity:", [v10 granularity], 0, x, y);
  [v8 performSelector:sel_beginMagnifying withObject:0 afterDelay:0.4];
  [v8 setWillBeginMagnifying:1];
}

- (void)rangeSelectionEnded:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v16 = +[UITextMagnifierRanged sharedRangedMagnifier];
  double v6 = [(UITextInteractionAssistant *)self _legacySelectionView];
  double v7 = [v6 rangeView];

  double v8 = [(UITextInteractionAssistant *)self _legacySelectionView];
  [v8 setForceRangeView:0];

  double v9 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v10 = [v9 preferencesActions];
  int v11 = [v10 BOOLForPreferenceKey:@"YukonMagnifiersDisabled"];

  if (v11)
  {
    if ([(UITextInteractionAssistant(UITextInteractionAssistant_Internal) *)self canShowSelectionCommands])
    {
      [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant showSelectionCommands];
    }
    [(UITextInteractionAssistant *)self setExpectingCommit:1];
    goto LABEL_7;
  }
  id v12 = [v16 target];

  if (v12)
  {
    [(UITextInteractionAssistant *)self updateWithMagnifierTerminalPoint:[(UITextInteractionAssistant *)self autoscrolled] ^ 1];
    goto LABEL_7;
  }
  if (![v7 commandsWereShowing])
  {
    if ([(UITextInteractionAssistant(UITextInteractionAssistant_Internal) *)self canShowSelectionCommands])
    {
      [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant showSelectionCommands];
    }
    goto LABEL_7;
  }
  [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant hideSelectionCommands];
  if ([v7 autoscrolled])
  {
LABEL_7:
    [v7 setWillBeginMagnifying:0];
    [(UITextInteractionAssistant *)self cancelAutoscroll];
    id v13 = [v7 startGrabber];
    [v13 updateDot];

    double v14 = [v7 endGrabber];
    [v14 updateDot];

    goto LABEL_8;
  }
  -[UITextInteractionAssistant setSelectionWithPoint:](self, "setSelectionWithPoint:", x, y);
  char v15 = [(UITextInteractionAssistant *)self activeSelection];
  [v15 commit];

  [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
  [v7 setWillBeginMagnifying:0];
  [(UITextInteractionAssistant *)self cancelAutoscroll];
LABEL_8:
  [(UITextInteractionAssistant *)self endSelectionChange];
  [(UITextInteractionAssistant *)self didEndSelectionInteraction];
  [(UITextInteractionAssistant *)self setExpectingCommit:0];
}

- (void)rangeSelectionCanceled
{
  unsigned int v3 = [(UITextInteractionAssistant *)self _legacySelectionView];
  [v3 setForceRangeView:0];

  uint64_t v4 = [(UITextInteractionAssistant *)self _legacySelectionView];
  id v5 = [v4 rangeView];
  [v5 setWillBeginMagnifying:0];

  [(UITextInteractionAssistant *)self endSelectionChange];
  [(UITextInteractionAssistant *)self didEndSelectionInteraction];
}

- (void)rangeSelectionMoved:(CGPoint)a3 withTouchPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  double v9 = [(UITextInteractionAssistant *)self _legacySelectionView];
  id v38 = [v9 rangeView];

  -[UITextInteractionAssistant _updateSelectionWithPoint:granularity:forceGranularity:](self, "_updateSelectionWithPoint:granularity:forceGranularity:", 0, 0, v7, v6);
  id v10 = +[UITextMagnifierRanged sharedRangedMagnifier];
  [v38 magnifierPoint];
  double v12 = v11;
  double v14 = v13;
  char v15 = [v38 _window];
  id v16 = [v15 screen];
  id v17 = [v16 coordinateSpace];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v19 = [WeakRetained textInputView];
  if (v19) {
    id v20 = v19;
  }
  else {
    id v20 = v38;
  }
  objc_msgSend(v17, "convertPoint:fromCoordinateSpace:", v20, v12, v14);
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  uint64_t v25 = +[UIScreen mainScreen];
  [v25 bounds];
  v40.double x = v22;
  v40.double y = v24;
  BOOL v26 = CGRectContainsPoint(v41, v40);

  double v27 = [v10 target];
  if (v27)
  {

    goto LABEL_10;
  }
  [v38 initialExtentPoint];
  if (sqrt((v28 - v7) * (v28 - v7) + (v29 - v6) * (v29 - v6)) <= 8.0)
  {
LABEL_10:
    id v30 = [v10 target];

    if (v30)
    {
      if (v26) {
        objc_msgSend(v10, "setMagnificationPoint:", v12, v14);
      }
      else {
        [v10 stopMagnifying:1];
      }
    }
    goto LABEL_14;
  }
  if (v26 && [v38 willBeginMagnifying]) {
    [v38 beginMagnifying];
  }
LABEL_14:
  id v31 = [(UITextInteractionAssistant *)self view];
  double v32 = [v31 _proxyTextInput];
  double v33 = [v32 textInputView];
  objc_msgSend(v38, "convertPoint:toView:", v33, x, y);
  double v35 = v34;
  double v37 = v36;

  -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", v35, v37);
  [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
}

- (void)configureForSelectionMode
{
}

- (void)configureForHighlightMode
{
}

- (void)configureForReplacementMode
{
}

- (void)configureForPencilHighlightMode
{
}

- (void)configureForPencilDeletionPreviewMode
{
}

- (void)beginSelectionChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained beginSelectionChange];
}

- (void)endSelectionChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained endSelectionChange];
}

- (CGPoint)constrainedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "constrainedPoint:", x, y);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)resignedFirstResponder
{
  [(UITextSelectionView *)self->_selectionView hideSelectionCommands];
  [(UITextSelectionView *)self->_selectionView setVisible:0];
  [(UITextSelectionView *)self->_selectionView setCaretBlinks:0];
  selectionView = self->_selectionView;
  [(UITextSelectionView *)selectionView deactivate];
}

- (void)stashCurrentSelection
{
  unsigned int v3 = [(UITextInteractionAssistant *)self activeSelection];
  uint64_t v4 = [v3 selectedRange];
  stashedTextRange = self->_stashedTextRange;
  self->_stashedTextRange = v4;

  self->_didUseStashedRange = 0;
}

- (void)clearStashedSelection
{
  stashedTextRange = self->_stashedTextRange;
  self->_stashedTextRange = 0;

  self->_didUseStashedRange = 0;
}

- (BOOL)didUseStashedSelection
{
  return self->_didUseStashedRange;
}

- (BOOL)viewConformsToAsynchronousInteractionProtocol
{
  viewConformsToAsynchronousInteractionViewProtocol = self->_viewConformsToAsynchronousInteractionViewProtocol;
  if (!viewConformsToAsynchronousInteractionViewProtocol)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "_usesAsynchronousProtocol"));
    id v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    double v6 = self->_viewConformsToAsynchronousInteractionViewProtocol;
    self->_viewConformsToAsynchronousInteractionViewProtocol = v5;

    viewConformsToAsynchronousInteractionViewProtocol = self->_viewConformsToAsynchronousInteractionViewProtocol;
  }
  return [(NSNumber *)viewConformsToAsynchronousInteractionViewProtocol BOOLValue];
}

- (void)willBeginSelectionInteraction
{
  ++self->_activeSelectionInteractions;
  if (self->_respondsToTextFormattingRestorationMethods)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained _prepareForTextFormattingRestoration];
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UITextSelectionInteractionWillBegin" object:0];
}

- (void)didEndSelectionInteraction
{
  --self->_activeSelectionInteractions;
  if (self->_respondsToTextFormattingRestorationMethods)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained _performTextFormattingRestoration];
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UITextSelectionInteractionDidEnd" object:0];
}

- (BOOL)hasActiveSelectionInteraction
{
  return self->_activeSelectionInteractions != 0;
}

- (BOOL)cursorVisible
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    return ![(UITextSelectionDisplayInteraction *)self->_selectionViewManager isCursorHidden];
  }
  selectionView = self->_selectionView;
  return [(UITextSelectionView *)selectionView caretVisible];
}

- (void)setCursorVisible:(BOOL)a3
{
  BOOL v3 = a3;
  -[UITextSelectionView setCaretVisible:](self->_selectionView, "setCaretVisible:");
  selectionViewManager = self->_selectionViewManager;
  [(UITextSelectionDisplayInteraction *)selectionViewManager setCursorHidden:!v3];
}

- (BOOL)ghostAppearance
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    BOOL v3 = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager _cursorView];
    char v4 = [v3 isGhostEffectEnabled];

    return v4;
  }
  else
  {
    selectionView = self->_selectionView;
    return [(UITextSelectionView *)selectionView ghostAppearance];
  }
}

- (void)setGhostAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  -[UITextSelectionView setGhostAppearance:](self->_selectionView, "setGhostAppearance:");
  id v5 = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager _cursorView];
  [v5 setGhostEffectEnabled:v3];
}

- (unint64_t)currentDraggedHandle
{
  if (![(UITextInteractionAssistant *)self hasActiveSelectionInteraction]) {
    return 0;
  }
  BOOL v3 = [(UITextInteractionAssistant *)self rangeAdjustmentInteraction];
  char v4 = v3;
  if (v3)
  {
    if ([v3 baseIsStart]) {
      unint64_t v5 = 8;
    }
    else {
      unint64_t v5 = 2;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (UITextCursorAssertionController)_assertionController
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    if ([(UITextSelectionDisplayInteraction *)self->_selectionViewManager isActivated])
    {
      BOOL v3 = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager _cursorAssertionController];
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  else
  {
    assertionController = self->_assertionController;
    if (!assertionController)
    {
      unint64_t v5 = objc_alloc_init(UITextCursorAssertionController);
      double v6 = self->_assertionController;
      self->_assertionController = v5;

      [(UITextCursorAssertionController *)self->_assertionController setSubject:self];
      assertionController = self->_assertionController;
    }
    BOOL v3 = assertionController;
  }
  return v3;
}

- (_UITextChoiceAccelerationAssistant)_textChoicesAssistant
{
  textChoicesAssistant = self->_textChoicesAssistant;
  if (!textChoicesAssistant)
  {
    char v4 = [[_UITextChoiceAccelerationAssistant alloc] initWithInteractionAssistant:self];
    unint64_t v5 = self->_textChoicesAssistant;
    self->_textChoicesAssistant = v4;

    textChoicesAssistant = self->_textChoicesAssistant;
  }
  return textChoicesAssistant;
}

- (void)willBeginFloatingCursor:(BOOL)a3
{
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UITextInteractionAssistant *)self setInGesture:1];
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    [(_UITextFloatingCursorSession *)self->_floatingCursorSession _invalidate];
    selectionViewManager = self->_selectionViewManager;
    double v7 = [(UITextInteractionAssistant *)self view];
    double v8 = [v7 textInputView];
    -[UITextSelectionDisplayInteraction _beginFloatingCursorSessionAtPoint:inContainer:](selectionViewManager, "_beginFloatingCursorSessionAtPoint:inContainer:", v8, x, y);
    double v9 = (_UITextFloatingCursorSession *)objc_claimAutoreleasedReturnValue();
    floatingCursorSession = self->_floatingCursorSession;
    self->_floatingCursorSession = v9;
  }
  else
  {
    selectionView = self->_selectionView;
    double v12 = [(UITextInteractionAssistant *)self view];
    double v13 = [v12 textInputView];
    -[UIView convertPoint:fromView:](selectionView, "convertPoint:fromView:", v13, x, y);
    double v15 = v14;
    double v17 = v16;

    -[UITextSelectionView beginFloatingCursorAtPoint:](self->_selectionView, "beginFloatingCursorAtPoint:", v15, v17);
  }
  -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", x, y);
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  floatingCursorSession = self->_floatingCursorSession;
  if (floatingCursorSession)
  {
    double v9 = [(UITextInteractionAssistant *)self view];
    double v10 = [v9 textInputView];
    -[_UITextFloatingCursorSession updateWithPoint:inContainer:animated:](floatingCursorSession, "updateWithPoint:inContainer:animated:", v10, v4, x, y);
  }
  else
  {
    selectionView = self->_selectionView;
    double v12 = [(UITextInteractionAssistant *)self view];
    double v13 = [v12 textInputView];
    -[UIView convertPoint:fromView:](selectionView, "convertPoint:fromView:", v13, x, y);
    double v15 = v14;
    double v17 = v16;

    -[UITextSelectionView updateFloatingCursorAtPoint:animated:](self->_selectionView, "updateFloatingCursorAtPoint:animated:", v4, v15, v17);
  }
  -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", x, y);
}

- (CGPoint)boundedDeltaForTranslation:(CGPoint)a3 cursorLocationBase:(CGPoint)a4
{
  double v5 = a3.x + a4.x;
  double v6 = a3.y + a4.y;
  floatingCursorSession = self->_floatingCursorSession;
  if (!floatingCursorSession)
  {
    selectionView = self->_selectionView;
    double v9 = [(UITextInteractionAssistant *)self view];
    double v10 = [v9 textInputView];
    -[UIView convertPoint:fromView:](selectionView, "convertPoint:fromView:", v10, v5, v6);
    double v5 = v11;
    double v6 = v12;

    floatingCursorSession = self->_selectionView;
  }
  objc_msgSend(floatingCursorSession, "floatingCursorPositionForPoint:lineSnapping:", 0, v5, v6);
  double v14 = v13 - v5;
  double v16 = v15 - v6;
  result.double y = v16;
  result.double x = v14;
  return result;
}

- (void)endFloatingCursor
{
  [(UITextInteractionAssistant *)self cancelAutoscroll];
  floatingCursorSession = self->_floatingCursorSession;
  if (floatingCursorSession)
  {
    [(_UITextFloatingCursorSession *)floatingCursorSession _invalidate];
    BOOL v4 = self->_floatingCursorSession;
    self->_floatingCursorSession = 0;
  }
  else
  {
    [(UITextSelectionView *)self->_selectionView endFloatingCursor];
  }
  [(UITextInteractionAssistant *)self setInGesture:0];
}

- (void)startAutoscroll:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(UITextInteractionAssistant *)self _canAutoscroll])
  {
    uint64_t v14 = [(UITextInteractionAssistant *)self scrollView];
    uint64_t v6 = [(UITextInteractionAssistant *)self fieldEditor];
    if (v14 | v6)
    {
      if (v14) {
        [(id)v14 _setAutoscrolling:1];
      }
      [(UITextInteractionAssistant *)self setAutoscrolled:0];
      double v7 = [(UITextInteractionAssistant *)self view];
      double v8 = [v7 _proxyTextInput];
      double v9 = [v8 textInputView];
      objc_msgSend(v9, "convertPoint:toView:", 0, x, y);
      -[UITextInteractionAssistant setAutoscrollUntransformedExtentPoint:](self, "setAutoscrollUntransformedExtentPoint:");

      double v10 = [(UITextInteractionAssistant *)self _asTextAutoscrolling];
      double v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "startAutoscroll:", x, y);
      }
      else
      {
        double v12 = [(UITextInteractionAssistant *)self _asBETextInput];

        if (v12) {
          [(UITextInteractionAssistant *)self _asBETextInput];
        }
        else {
        double v13 = [(UITextInteractionAssistant *)self _asAsyncTextInputClient];
        }
        objc_msgSend(v13, "autoscrollToPoint:", x, y);
      }
    }
  }
}

- (void)cancelAutoscroll
{
  if ([(UITextInteractionAssistant *)self _canAutoscroll])
  {
    id v7 = [(UITextInteractionAssistant *)self scrollView];
    if (v7) {
      [v7 _setAutoscrolling:0];
    }
    BOOL v3 = [(UITextInteractionAssistant *)self _asTextAutoscrolling];
    BOOL v4 = v3;
    if (v3)
    {
      [v3 cancelAutoscroll];
    }
    else
    {
      double v5 = [(UITextInteractionAssistant *)self _asBETextInput];

      if (v5) {
        [(UITextInteractionAssistant *)self _asBETextInput];
      }
      else {
      uint64_t v6 = [(UITextInteractionAssistant *)self _asAsyncTextInputClient];
      }
      [v6 cancelAutoscroll];
    }
  }
}

- (void)autoscrollWillNotStart
{
  BOOL v3 = +[UITextMagnifierCaret sharedCaretMagnifier];
  [v3 autoscrollWillNotStart];

  BOOL v4 = +[UITextMagnifierRanged sharedRangedMagnifier];
  [v4 autoscrollWillNotStart];

  [(UITextInteractionAssistant *)self cancelAutoscroll];
}

- (void)updateAutoscroll:(id)a3
{
  id v45 = a3;
  if ([(UITextInteractionAssistant *)self _canAutoscroll])
  {
    BOOL v4 = [(UITextInteractionAssistant *)self scrollView];
    if (!v4)
    {
LABEL_34:

      goto LABEL_35;
    }
    [(UITextInteractionAssistant *)self setAutoscrolled:1];
    [v4 contentOffset];
    double v6 = v5;
    double v42 = v5;
    double v43 = v7;
    double v44 = v7;
    double v8 = [v45 scrollContainer];
    double v9 = [(UITextInteractionAssistant *)self view];
    double v10 = [v9 _proxyTextInput];
    double v11 = [v10 textInputView];
    [v8 contentFrameForView:v11];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    [v4 contentInset];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    int v26 = [v45 directions];
    int v27 = v26;
    if (v26)
    {
      if (v6 > v13) {
        goto LABEL_12;
      }
      unsigned int v31 = v26 & 0xFFFFFFFE;
    }
    else
    {
      if ((v26 & 2) == 0)
      {
        double v13 = v42;
        if ((v26 & 4) == 0)
        {
          double v28 = v45;
          if ((v27 & 8) == 0) {
            goto LABEL_21;
          }
          [v4 bounds];
          if (v29 + v30 < 64.0)
          {
            v27 &= ~8u;
LABEL_20:
            double v28 = v45;
LABEL_21:
            if (v27) {
              goto LABEL_22;
            }
            goto LABEL_33;
          }
          [v4 bounds];
          double v28 = v45;
          if (v44 < v15 + v19 - (v41 - v23))
          {
            double v43 = v15 + v19 - (v41 - v23);
            goto LABEL_22;
          }
          if ((v27 & 0xFFFFFFF7) != 0) {
            goto LABEL_22;
          }
LABEL_33:
          [(UITextInteractionAssistant *)self cancelAutoscroll];
          goto LABEL_34;
        }
        [v4 bounds];
        if (v33 + v34 < 64.0 || v44 <= v15 - v21)
        {
          v27 &= ~4u;
          goto LABEL_20;
        }
        double v43 = v15 - v21;
        goto LABEL_12;
      }
      [v4 bounds];
      double v13 = v13 + v17 - (v32 - v25);
      if (v6 < v13)
      {
LABEL_12:
        double v28 = v45;
        goto LABEL_22;
      }
      unsigned int v31 = v27 & 0xFFFFFFFD;
    }
    double v28 = v45;
    double v13 = v42;
    if (!v31) {
      goto LABEL_33;
    }
LABEL_22:
    double v35 = sqrt((v13 - v6) * (v13 - v6) + (v43 - v44) * (v43 - v44));
    if ([v28 count] == 1)
    {
      double autoscrollFactor = v35 + v35;
      self->_double autoscrollFactor = v35 + v35;
      int v37 = (int)(sqrt(v35) / 5.0);
      if (v37 <= 5) {
        int v37 = 5;
      }
      self->_unint64_t autoscrollRamp = v37;
    }
    else
    {
      double autoscrollFactor = self->_autoscrollFactor;
    }
    double v38 = v35 / autoscrollFactor;
    unint64_t v39 = [v45 count];
    unint64_t autoscrollRamp = self->_autoscrollRamp;
    if (v39 < autoscrollRamp) {
      double v38 = v38 * (double)(autoscrollRamp - [v45 count] + 1);
    }
    [v4 _setContentOffsetAnimationDuration:v38];
    objc_msgSend(v4, "setContentOffset:animated:", 1, v13, v43);
    goto LABEL_34;
  }
LABEL_35:
}

- (BOOL)didPerformLoupeSelectionHandoff
{
  int v2 = [(UITextInteraction *)self->_interactions interactionWithGestureForName:0x1ED1740E0];
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = [v2 inheritedGranularity] != -1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)scheduleReplacements
{
  self->_automaticSelectionCommandsSuppressed = 0;
  [(UITextInteractionAssistant *)self scheduleReplacementsWithOptions:8];
}

- (void)scheduleReplacementsWithOptions:(unint64_t)a3
{
  double v5 = [(UITextInteractionAssistant *)self activeSelection];
  id v7 = [v5 selectedRange];

  double v6 = [(UITextInteractionAssistant *)self attributedTextInRange:v7];
  if (![(UITextInteractionAssistant *)self handleMultilingualAlternativeWithString:v6 range:v7])[(UITextInteractionAssistant *)self scheduleReplacementsForRange:v7 withOptions:a3]; {
}
  }

- (id)_textReplacementsMenuForElement:(id)a3
{
  id v4 = a3;
  double v5 = [(UITextInteractionAssistant *)self activeSelection];
  double v6 = [v5 selectedRange];

  id v7 = [(UITextInteractionAssistant *)self generatorForRange:v6 withOptions:0];
  double v8 = [(UITextInteractionAssistant *)self _editMenuAssistant];
  double v9 = [v7 replacements];
  double v10 = [v8 menuElementsForReplacements:v9];

  double v11 = [v4 title];
  double v12 = [v4 image];

  double v13 = +[UIMenu menuWithTitle:v11 image:v12 identifier:0 options:0 children:v10];

  return v13;
}

- (id)updatedTextReplacementsMenuWithMenuElements:(id)a3
{
  v5[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __111__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updatedTextReplacementsMenuWithMenuElements___block_invoke;
  v6[3] = &unk_1E530AC38;
  v6[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __111__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updatedTextReplacementsMenuWithMenuElements___block_invoke_2;
  v5[3] = &unk_1E530AC60;
  BOOL v3 = _UIMenuReplacingElementMatchingPredicate(a3, v6, v5);
  return v3;
}

uint64_t __111__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updatedTextReplacementsMenuWithMenuElements___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_4;
  }
  double v5 = (char *)[v4 action];
  if (v5 == sel_promptForReplace_)
  {
    int v2 = [*(id *)(a1 + 32) view];
    if (objc_msgSend(v2, "canPerformAction:withSender:", objc_msgSend(v4, "action"), v4))
    {
      uint64_t v6 = 1;
      goto LABEL_11;
    }
    if ((char *)[v4 fallbackAction] != sel__promptForReplace_)
    {
      uint64_t v6 = 0;
      goto LABEL_11;
    }
LABEL_10:
    id v7 = [*(id *)(a1 + 32) view];
    uint64_t v6 = objc_msgSend(v7, "canPerformAction:withSender:", objc_msgSend(v4, "fallbackAction"), v4);

    if (v5 != sel_promptForReplace_) {
      goto LABEL_12;
    }
LABEL_11:

    goto LABEL_12;
  }
  if ((char *)[v4 fallbackAction] == sel__promptForReplace_) {
    goto LABEL_10;
  }
LABEL_4:
  uint64_t v6 = 0;
LABEL_12:

  return v6;
}

id __111__UITextInteractionAssistant_UITextInteractionAssistant_Internal__updatedTextReplacementsMenuWithMenuElements___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) _textReplacementsMenuForElement:a2];
  v5[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)_updateSelectionInViewIfNeeded:(id)a3 toRange:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [v14 selectedTextRange];
  if (v7)
  {
    double v8 = [v6 start];
    double v9 = [v7 start];
    if ([v14 comparePosition:v8 toPosition:v9])
    {
    }
    else
    {
      double v10 = [v6 end];
      double v11 = [v7 end];
      uint64_t v12 = [v14 comparePosition:v10 toPosition:v11];

      if (!v12) {
        goto LABEL_6;
      }
    }
  }
  double v13 = [(UITextInteractionAssistant *)self activeSelection];
  [(UITextInteractionAssistant *)self setFirstResponderIfNecessary];
  [(UITextInteractionAssistant *)self beginSelectionChange];
  [v13 setSelectedRange:v6];
  [v13 commit];
  [(UITextInteractionAssistant *)self endSelectionChange];

LABEL_6:
}

- (void)scheduleChineseTransliteration
{
  BOOL v3 = [(UITextInteractionAssistant *)self activeSelection];
  id v4 = [v3 selectedRange];

  if (!v4) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  int v6 = [v4 isEmpty];
  if (!v6)
  {
    id v10 = v4;
LABEL_7:
    id v21 = v10;
    double v11 = objc_msgSend(WeakRetained, "textInRange:");
    if ([v11 length])
    {
      if (v6)
      {
        uint64_t v12 = [v21 end];
        double v13 = [v21 end];
        uint64_t v14 = [WeakRetained textRangeFromPosition:v12 toPosition:v13];

        id v15 = (id)v14;
      }
      else
      {
        id v15 = v21;
      }
      id v21 = v15;
      [(UITextInteractionAssistant *)self _updateSelectionInViewIfNeeded:WeakRetained toRange:v15];
      double v16 = objc_alloc_init(UITextReplacementGeneratorForChineseTransliteration);
      [(UITextReplacementGenerator *)v16 setReplacementRange:v21];
      [(UITextReplacementGenerator *)v16 setStringToReplace:v11];
      double v17 = [(UITextReplacementGeneratorForChineseTransliteration *)v16 replacements];
      if ([v17 count])
      {
        double v18 = +[UIKeyboardImpl sharedInstance];
        double v19 = [v17 firstObject];
        [v18 replaceText:v19];
      }
      else
      {
        [(UITextInteractionAssistant *)self beginSelectionChange];
        double v18 = [(UITextInteractionAssistant *)self activeSelection];
        [v18 collapseSelection];
        [v18 commit];
        [(UITextInteractionAssistant *)self endSelectionChange];
        [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
      }
    }
    goto LABEL_16;
  }
  id v20 = [(UITextInteractionAssistant *)self rangeForTextReplacement:v4];
  id v7 = [v4 end];
  double v8 = [v20 end];
  uint64_t v9 = [WeakRetained comparePosition:v7 toPosition:v8];

  if (v9 != -1)
  {

    id v10 = v20;
    goto LABEL_7;
  }
  double v11 = v20;
  id v21 = v4;
LABEL_16:
}

- (id)rangeForTextReplacement:(id)a3
{
  id v4 = a3;
  if ([v4 isEmpty])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v6 = v4;
    }
    else {
      int v6 = 0;
    }
    id v7 = v6;
    double v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 domRange];
      id v10 = [v9 enclosingWordRange];
      +[UITextRangeImpl wrapDOMRange:v10];
    }
    else
    {
      uint64_t v9 = [WeakRetained tokenizer];
      id v10 = [v4 start];
      [v9 rangeEnclosingPosition:v10 withGranularity:1 inDirection:1];
    double v11 = };

    if (v11)
    {
      uint64_t v12 = [v11 start];
      double v13 = [v11 start];
      uint64_t v14 = [WeakRetained comparePosition:v12 toPosition:v13];

      if (v14 == -1
        || ([v11 end],
            id v15 = objc_claimAutoreleasedReturnValue(),
            uint64_t v16 = [WeakRetained comparePosition:v12 toPosition:v15],
            v15,
            v16 == 1))
      {

        double v11 = 0;
      }
    }
    id v4 = v11;
  }
  return v4;
}

- (id)attributedTextInRange:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (objc_opt_respondsToSelector())
  {
    int v6 = [WeakRetained attributedTextInRange:v4];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (BOOL)showMultilingualDictationReplacementWithRange:(id)a3
{
  BOOL v3 = [(UITextInteractionAssistant *)self attributedTextInRange:a3];
  BOOL v4 = +[UIDictationMultilingualUtilities hasMultilingualAttributesForAttributedString:v3];

  return v4;
}

- (BOOL)handleMultilingualAlternativeWithString:(id)a3 range:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    double v8 = +[UIDictationMultilingualUtilities multilingualAttributesForAttributedString:v6];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"bestAlternatives"];
    id v10 = [v8 objectForKeyedSubscript:@"multilingualResultsForAlternateRecognitions"];
    if (v9)
    {
      double v11 = [MEMORY[0x1E4F1CA48] array];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __113__UITextInteractionAssistant_UITextInteractionAssistant_Internal__handleMultilingualAlternativeWithString_range___block_invoke;
      v16[3] = &unk_1E530AC88;
      id v17 = v9;
      id v18 = v10;
      id v12 = v11;
      id v19 = v12;
      +[UIDictationUtilities attributedString:v6 withIdentifiersBlock:v16];
      uint64_t v13 = [v12 count];
      BOOL v14 = v13 != 0;
      if (v13) {
        [(UITextInteractionAssistant *)self scheduleDictationReplacementsForMultilingualAlternatives:v12 range:v7];
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __113__UITextInteractionAssistant_UITextInteractionAssistant_Internal__handleMultilingualAlternativeWithString_range___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v5 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = [[UIDictationMultilingualString alloc] initWithDictionary:*(void *)(*((void *)&v20 + 1) + 8 * v9)];
        [(UIDictationMultilingualString *)v10 setCorrectionIdentifier:v19];
        [(UIDictationMultilingualString *)v10 setInteractionIdentifier:v5];
        double v11 = *(void **)(a1 + 40);
        id v12 = [(UIDictationMultilingualString *)v10 dominantLanguage];
        uint64_t v13 = [v11 objectForKeyedSubscript:v12];

        BOOL v14 = [v13 dominantLanguage];
        id v15 = [(UIDictationMultilingualString *)v10 dominantLanguage];
        int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          id v17 = [v13 phrases];
          [(UIDictationMultilingualString *)v10 setPhrases:v17];
        }
        if (v10) {
          [*(id *)(a1 + 48) addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
}

- (void)scheduleDictationReplacementsForAlternatives:(id)a3 range:(id)a4
{
  v52[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [v6 alternativeStrings];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      id v10 = [(UITextInteractionAssistant *)self view];
      double v11 = [v10 textInRange:v7];

      if (![v11 length])
      {
LABEL_21:

        goto LABEL_22;
      }
      id v12 = [(UITextInteractionAssistant *)self attributedTextInRange:v7];
      BOOL v13 = [(UITextInteractionAssistant *)self handleMultilingualAlternativeWithString:v12 range:v7];
      BOOL v14 = [v6 alternativeStrings];
      int v15 = [v14 containsObject:0x1ED1450A0];

      if (v15)
      {
        int v16 = +[UIKeyboardImpl activeInstance];
        id v17 = [v16 inputDelegate];
        [v17 setSelectedTextRange:v7];

        if (+[UIDictationController isRunning])
        {
          id v18 = +[UIKeyboardImpl activeInstance];
          [v18 showSelectionCommands];
LABEL_9:
        }
      }
      else
      {
        id v19 = [v6 alternativeStrings];
        int v20 = [v19 containsObject:0x1ED145080];

        if (v20)
        {
          long long v21 = +[UIKeyboardImpl activeInstance];
          long long v22 = [v21 inputDelegate];
          [v22 setSelectedTextRange:v7];

          id v18 = +[UIKeyboardImpl activeInstance];
          long long v23 = [v18 inputDelegateManager];
          [v23 deleteBackward];

          goto LABEL_9;
        }
        double v24 = [v6 alternativeStrings];
        int v25 = [v24 containsObject:0x1ED1450C0];

        if (v25)
        {
          int v26 = +[UIKeyboardImpl activeInstance];
          int v27 = [v26 inputDelegate];
          double v28 = [v7 end];
          uint64_t v29 = [v7 end];
        }
        else
        {
          double v30 = [v6 alternativeStrings];
          int v31 = [v30 containsObject:0x1ED1450E0];

          if (!v31)
          {
            v52[0] = v11;
            v51[0] = @"originalText";
            v51[1] = @"alternatives";
            uint64_t v36 = [v6 alternativeStrings];
            int v37 = (void *)v36;
            v51[2] = @"isMultilingual";
            uint64_t v38 = MEMORY[0x1E4F1CC28];
            if (v13) {
              uint64_t v38 = MEMORY[0x1E4F1CC38];
            }
            v52[1] = v36;
            v52[2] = v38;
            unint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:3];

            uint64_t v44 = MEMORY[0x1E4F143A8];
            uint64_t v45 = 3221225472;
            uint64_t v46 = __118__UITextInteractionAssistant_UITextInteractionAssistant_Internal__scheduleDictationReplacementsForAlternatives_range___block_invoke;
            CGRect v47 = &unk_1E530AC88;
            id v40 = v39;
            id v48 = v40;
            id v49 = v12;
            id v41 = v6;
            id v50 = v41;
            +[UIDictationUtilities attributedString:v49 withIdentifiersBlock:&v44];
            if (!v13)
            {
              double v42 = [(UITextInteractionAssistant *)self activeSelection];
              [(UITextInteractionAssistant *)self setFirstResponderIfNecessary];
              [(UITextInteractionAssistant *)self beginSelectionChange];
              [v42 setSelectedRange:v7];
              [v42 commit];
              [(UITextInteractionAssistant *)self endSelectionChange];
              double v43 = [[UITextReplacementGeneratorForDictation alloc] initWithAlternatives:v41 stringToReplace:v11 replacementRange:v7];
              [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant showReplacementsWithGenerator:v43 forDictation:1 afterDelay:0.2];
            }
            goto LABEL_20;
          }
          int v26 = +[UIKeyboardImpl activeInstance];
          int v27 = [v26 inputDelegate];
          double v28 = [v7 start];
          uint64_t v29 = [v7 start];
        }
        double v32 = (void *)v29;
        double v33 = [v27 textRangeFromPosition:v28 toPosition:v29];

        double v34 = +[UIKeyboardImpl activeInstance];
        double v35 = [v34 inputDelegate];
        [v35 setSelectedTextRange:v33];
      }
LABEL_20:

      goto LABEL_21;
    }
  }
LABEL_22:
}

void __118__UITextInteractionAssistant_UITextInteractionAssistant_Internal__scheduleDictationReplacementsForAlternatives_range___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  BOOL v13 = +[UIDictationController sharedInstance];
  [v13 didShowAlternatives:*(void *)(a1 + 32) correctionIdentifier:v12 interactionIdentifier:v11 instrumentationContext:v10 dictationLanguage:v9];

  id v17 = [*(id *)(a1 + 40) attribute:@"_UITextInputDictationResultMetadata" atIndex:0 effectiveRange:0];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v14 = NSNumber;
      int v15 = [*(id *)(a1 + 48) alternativeStrings];
      int v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      [v17 setObject:v16 forKeyedSubscript:@"alternativesAvailableCount"];
    }
  }
}

- (void)scheduleDictationReplacementsForMultilingualAlternatives:(id)a3 range:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6 && [v11 count])
  {
    id v7 = [(UITextInteractionAssistant *)self view];
    uint64_t v8 = [v7 textInRange:v6];

    if ([v8 length])
    {
      id v9 = [(UITextInteractionAssistant *)self activeSelection];
      [(UITextInteractionAssistant *)self setFirstResponderIfNecessary];
      [(UITextInteractionAssistant *)self beginSelectionChange];
      [v9 setSelectedRange:v6];
      [v9 commit];
      [(UITextInteractionAssistant *)self endSelectionChange];
      id v10 = [[UITextReplacementGeneratorForMultilingualDictation alloc] initWithMultilingualAlternatives:v11 stringToReplace:v8 replacementRange:v6];
      [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant showReplacementsWithGenerator:v10 forDictation:1 afterDelay:0.2];
    }
  }
}

- (id)generatorForRange:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[UIKeyboardImpl activeInstance];
  int v8 = [v7 autocorrectSpellingEnabled];

  if (!v8 || !v6)
  {
    id v15 = 0;
    goto LABEL_22;
  }
  int v9 = [v6 isEmpty];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (!v9)
  {
    id v11 = v6;
LABEL_9:
    int v16 = +[UITextReplacementGeneratorForCorrections generatorForTextInput:WeakRetained range:v11 options:a4];
    if (v16)
    {
      id v17 = [(UITextInteractionAssistant *)self view];
      id v18 = [v17 textInRange:v11];

      if (![v18 length]) {
        goto LABEL_17;
      }
      textChecker = self->_textChecker;
      if (!textChecker)
      {
        int v20 = [[UITextChecker alloc] _initWithAsynchronousLoading:1];
        long long v21 = self->_textChecker;
        self->_textChecker = v20;

        textChecker = self->_textChecker;
      }
      if ([(UITextChecker *)textChecker _doneLoading])
      {
        [v16 setTextChecker:self->_textChecker];
        if ((a4 & 0x27) != 7
          || (+[UITextChecker keyboardLanguages],
              long long v22 = objc_claimAutoreleasedReturnValue(),
              v23 = -[UITextChecker rangeOfMisspelledWordInString:range:startingAt:wrap:languages:](self->_textChecker, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", v18, 0, [v18 length], 0, 0, v22), v22, id v15 = 0, v23 != 0x7FFFFFFFFFFFFFFFLL))
        {
          id v15 = v16;
        }
      }
      else
      {
LABEL_17:
        id v15 = 0;
      }
    }
    else
    {
      id v15 = 0;
    }
    goto LABEL_21;
  }
  id v11 = [(UITextInteractionAssistant *)self rangeForTextReplacement:v6];
  if (!v11
    || ([v6 end],
        id v12 = objc_claimAutoreleasedReturnValue(),
        [v11 end],
        BOOL v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [WeakRetained comparePosition:v12 toPosition:v13],
        v13,
        v12,
        v14 != -1))
  {

    goto LABEL_9;
  }
  id v15 = 0;
  int v16 = v11;
  id v11 = v6;
LABEL_21:

  id v6 = v11;
LABEL_22:

  return v15;
}

- (BOOL)scheduleReplacementsForRange:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  int v7 = [v6 isEmpty];
  int v8 = [(UITextInteractionAssistant *)self generatorForRange:v6 withOptions:a4];
  int v9 = v8;
  if (v8)
  {
    if (([v8 isStringToReplaceMisspelled] & 1) != 0
      || [v9 forceAutocorrectionGuesses])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      id v11 = [v9 replacementRange];

      if (v7)
      {
        id v12 = [v11 end];
        BOOL v13 = [v11 end];
        uint64_t v14 = [WeakRetained textRangeFromPosition:v12 toPosition:v13];

        id v11 = (void *)v14;
      }
      [(UITextInteractionAssistant *)self _updateSelectionInViewIfNeeded:WeakRetained toRange:v11];

      BOOL v15 = 1;
      id v6 = v11;
    }
    else
    {
      BOOL v15 = 0;
    }
    double v16 = dbl_186B9D760[(a4 & 8) == 0];
    if (!+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])goto LABEL_21; {
    uint64_t v17 = [v9 autocorrectionRecord];
    }
    if (v17 && (id v18 = (void *)v17, v19 = [v9 forceAutocorrectionGuesses], v18, v19))
    {
      int v20 = [(UITextInteractionAssistant *)self _textChoicesAssistant];
      long long v21 = [v9 autocorrectionRecord];
      char v22 = [v20 showChoicesForAutocorrectionCandidate:v21 range:v6 delay:v16];
    }
    else
    {
      char v23 = [v9 forceAutocorrectionGuesses];
      double v24 = [(UITextInteractionAssistant *)self _textChoicesAssistant];
      int v20 = v24;
      if ((v23 & 1) == 0)
      {
        int v26 = [v24 showDictationChoicesForTextInRange:v6];

        if (!v26)
        {
LABEL_20:
          double v28 = [(UITextInteractionAssistant *)self _textChoicesAssistant];
          [v28 dismissWithoutSelection];

LABEL_21:
          [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant showReplacementsWithGenerator:v9 forDictation:0 afterDelay:v16];
          goto LABEL_22;
        }
        int v27 = [(UITextInteractionAssistant *)self activeSelection];
        [v27 setSelectedRange:v6];
        [v27 commit];

        goto LABEL_19;
      }
      long long v21 = [v9 replacements];
      char v22 = [v20 showChoicesForTextInRange:v6 withReplacements:v21 delay:v16];
    }
    char v25 = v22;

    if ((v25 & 1) == 0) {
      goto LABEL_20;
    }
LABEL_19:
    BOOL v15 = 1;
    goto LABEL_22;
  }
  BOOL v15 = 0;
LABEL_22:

  return v15;
}

- (BOOL)hasReplacements
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UITextInteractionAssistant *)self activeSelection];
  BOOL v4 = [v3 selectedRange];
  id v5 = [(UITextInteractionAssistant *)self attributedTextInRange:v4];

  if (+[UIDictationMultilingualUtilities hasMultilingualAttributesForAttributedString:v5])
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    int v7 = [(UITextInteractionAssistant *)self activeSelection];
    int v8 = [v7 selectedRange];
    int v9 = [(UITextInteractionAssistant *)self generatorForRange:v8 withOptions:8];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = objc_msgSend(v9, "replacements", 0);
    uint64_t v6 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v10);
          }
          BOOL v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) replacementText];
          uint64_t v14 = [v13 length];

          if (v14)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v6;
}

- (BOOL)swallowsDoubleTapWithScale:(double)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (a3 != 0.0)
  {
    if (1.0 / a3 <= a3) {
      a3 = 1.0 / a3;
    }
    float v7 = a3;
    if (v7 < 0.9) {
      return 0;
    }
  }
  [(UITextInteractionAssistant *)self setFirstResponderIfNecessary];
  [(UITextInteractionAssistant *)self beginSelectionChange];
  int v8 = [(UITextInteractionAssistant *)self activeSelection];
  objc_msgSend(v8, "alterSelection:granularity:", 1, x, y);
  [v8 commit];
  [(UITextInteractionAssistant *)self endSelectionChange];
  if ([(UITextInteractionAssistant(UITextInteractionAssistant_Internal) *)self canShowSelectionCommands])
  {
    [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant showSelectionCommands];
  }

  return 1;
}

- (void)layoutChangedByScrolling:(BOOL)a3
{
}

- (void)willStartScrollingOrZooming
{
  BOOL v3 = +[UITextSelectionDisplayInteraction isModernSelectionViewEnabled];
  uint64_t v4 = 16;
  if (v3) {
    uint64_t v4 = 232;
  }
  id v5 = *(Class *)((char *)&self->super.isa + v4);
  [v5 hideSelectionCommands];
}

- (void)didEndScrollingOrZooming
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    if (![(UITextInteractionAssistant(UITextInteractionAssistant_Internal) *)self canShowSelectionCommands])return; {
    BOOL v3 = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager highlightView];
    }
    char v4 = [v3 isHidden];

    if (v4) {
      return;
    }
    editMenuAssistant = self->_editMenuAssistant;
    goto LABEL_16;
  }
  [(UITextSelectionView *)self->_selectionView deferredUpdateSelectionRects];
  selectionView = self->_selectionView;
  if (selectionView)
  {
    float v7 = [(UITextSelectionView *)selectionView selection];
    int v8 = [v7 selectedRange];
    if (v8)
    {
      int v9 = [(UITextSelectionView *)self->_selectionView selection];
      id v10 = [v9 selectedRange];
      char v11 = [v10 isEmpty];
    }
    else
    {
      char v11 = 1;
    }

    if ([(UITextInteractionAssistant(UITextInteractionAssistant_Internal) *)self canShowSelectionCommands])
    {
      if ((v11 & 1) == 0)
      {
        id v12 = +[UIKeyboardImpl activeInstance];
        BOOL v13 = [v12 inputDelegateManager];
        [v13 selectionClipRect];
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        [(UITextSelectionView *)self->_selectionView selectionBoundingBox];
        v29.origin.double x = v22;
        v29.origin.double y = v23;
        v29.size.double width = v24;
        v29.size.double height = v25;
        v28.origin.double x = v15;
        v28.origin.double y = v17;
        v28.size.double width = v19;
        v28.size.double height = v21;
        BOOL v26 = CGRectIntersectsRect(v28, v29);

        if (v26)
        {
          editMenuAssistant = self->_selectionView;
LABEL_16:
          [editMenuAssistant showSelectionCommands];
        }
      }
    }
  }
  else
  {
    [(UITextInteractionAssistant(UITextInteractionAssistant_Internal) *)self canShowSelectionCommands];
  }
}

- (void)presentMenuForInputUI:(id)a3 preferredArrowDirection:(int64_t)a4
{
}

- (void)dismissMenuForInputUI
{
}

- (BOOL)isDisplayingMenuForInputUI
{
  return [(UITextContextMenuInteraction *)self->_textContextMenuInteraction isDisplayingMenuForInputUI];
}

- (BOOL)isDisplayingMenu
{
  return [(UITextContextMenuInteraction *)self->_textContextMenuInteraction isDisplayingMenu];
}

- (void)underlineCorrectedTextInRange:(id)a3 typedString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UITextInteractionAssistant *)self _textChoicesAssistant];
  [v8 underlineTextInRange:v7 revertText:v6];
}

- (void)removeTextChoiceUnderlines
{
  id v2 = [(UITextInteractionAssistant *)self _textChoicesAssistant];
  [v2 removeAllUnderlines];
}

- (BOOL)isDisplayingVerticalSelection
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    selectionViewManager = self->_selectionViewManager;
    return [(UITextSelectionDisplayInteraction *)selectionViewManager _isDisplayingVerticalSelection];
  }
  else
  {
    id v5 = [(UITextInteractionAssistant *)self _legacySelectionView];
    id v6 = [v5 rangeView];
    char v7 = [v6 isDisplayingVerticalSelection];

    return v7;
  }
}

- (CGRect)textRangeAdjustmentRectForEdge:(unint64_t)a3
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    [(UITextSelectionDisplayInteraction *)self->_selectionViewManager textRangeAdjustmentRectForEdge:a3];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    BOOL v13 = [(UITextInteractionAssistant *)self _legacySelectionView];
    double v14 = [v13 rangeView];
    [v14 textRangeAdjustmentRectForEdge:a3];
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
    double v12 = v18;
  }
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)paddedTextRangeAdjustmentHitRegionForEdge:(unint64_t)a3 precision:(unint64_t)a4
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    [(UITextSelectionDisplayInteraction *)self->_selectionViewManager paddedTextRangeAdjustmentHitRegionForEdge:a3 precision:a4];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v15 = [(UITextInteractionAssistant *)self _legacySelectionView];
    double v16 = [v15 rangeView];
    [v16 paddedTextRangeAdjustmentHitRegionForEdge:a3 precision:a4];
    double v8 = v17;
    double v10 = v18;
    double v12 = v19;
    double v14 = v20;
  }
  double v21 = v8;
  double v22 = v10;
  double v23 = v12;
  double v24 = v14;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (id)textRangeAdjustmentViewForEdge:(unint64_t)a3
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    double v5 = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager textRangeAdjustmentViewForEdge:a3];
  }
  else
  {
    double v6 = [(UITextInteractionAssistant *)self _legacySelectionView];
    double v7 = [v6 rangeView];
    double v5 = [v7 textRangeAdjustmentViewForEdge:a3];
  }
  return v5;
}

- (id)_rangeAdjustmentViewContainer
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    BOOL v3 = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager _rangeAdjustmentViewContainer];
  }
  else
  {
    char v4 = [(UITextInteractionAssistant *)self _legacySelectionView];
    BOOL v3 = [v4 rangeView];
  }
  return v3;
}

- (CGPoint)_rangeAdjustmentPointInTextInputCoordinateSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UITextInteractionAssistant *)self _rangeAdjustmentViewContainer];
  double v7 = [(UITextInteractionAssistant *)self view];
  double v8 = [v7 _proxyTextInput];
  double v9 = [v8 textInputView];
  objc_msgSend(v6, "convertPoint:toView:", v9, x, y);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (BOOL)textRangeAdjustmentInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  BOOL v5 = [(UITextInteractionAssistant *)self _selectionIsActivated];
  if (v5)
  {
    double v6 = [(UITextInteractionAssistant *)self activeSelection];
    double v7 = [v6 selectedRange];
    char v8 = [v7 _isRanged];

    LOBYTE(v5) = v8;
  }
  return v5;
}

- (void)textRangeAdjustmentInteraction:(id)a3 didBeginAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  [(UITextInteractionAssistant *)self setSelectionHighlightMode:0];
  -[UITextInteractionAssistant _rangeAdjustmentPointInTextInputCoordinateSpace:](self, "_rangeAdjustmentPointInTextInputCoordinateSpace:", x, y);
  double v9 = v8;
  double v11 = v10;
  double v12 = [(UITextInteractionAssistant *)self interactions];
  objc_msgSend(v12, "_callDelegateWillMoveTextRangeExtentAtPoint:", v9, v11);

  [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant hideSelectionCommands];
  [(UITextInteractionAssistant *)self willBeginSelectionInteraction];
  [(UITextInteractionAssistant *)self beginSelectionChange];
  double v13 = [(UITextInteractionAssistant *)self rangeAdjustmentInteraction];
  int v14 = [v13 baseIsStart];

  id v16 = [(UITextInteractionAssistant *)self activeSelection];
  if (v14)
  {
    [v16 setRangedSelectionBaseToCurrentSelectionStart];
    [v16 setRangedSelectionInitialExtentToCurrentSelectionEnd];
  }
  else
  {
    [v16 setRangedSelectionBaseToCurrentSelectionEnd];
    [v16 setRangedSelectionInitialExtentToCurrentSelectionStart];
  }
  [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
  [(UITextInteractionAssistant *)self setNeedsSelectionDisplayUpdate];
  double v15 = [(UITextInteractionAssistant *)self _selectionViewManager];
  [v15 _didBeginRangeAdjustmentInteraction:v7];
}

- (void)updateSelectionForTextAnimation
{
  if ([(UITextRangeAdjustmentInteraction *)self->_rangeAdjustmentInteraction hasActiveTouch])
  {
    [(UITextRangeAdjustmentInteraction *)self->_rangeAdjustmentInteraction extentPoint];
    -[UITextInteractionAssistant _textRangeAdjustmentForPoint:withTouchPoint:selectionChangeReason:](self, "_textRangeAdjustmentForPoint:withTouchPoint:selectionChangeReason:", 1, v3, v4, v3, v4);
  }
  else
  {
    [(UITextInteractionAssistant *)self _invalidateSelectionDisplay];
  }
  [(UITextRangeAdjustmentInteraction *)self->_rangeAdjustmentInteraction extentPoint];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(UITextInteractionAssistant *)self activeSelection];
  double v10 = [v9 selectedRange];
  -[UITextInteractionAssistant convertPointToRenderSpace:textRange:](self, "convertPointToRenderSpace:textRange:", v10, v6, v8);
  double v12 = v11;
  double v14 = v13;

  rangeAdjustmentInteraction = self->_rangeAdjustmentInteraction;
  -[UITextRangeAdjustmentInteraction setModelPosition:](rangeAdjustmentInteraction, "setModelPosition:", v12, v14);
}

- (void)_textRangeAdjustmentForPoint:(CGPoint)a3 withTouchPoint:(CGPoint)a4
{
}

- (void)_textRangeAdjustmentForPoint:(CGPoint)a3 withTouchPoint:(CGPoint)a4 selectionChangeReason:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  -[UITextInteractionAssistant _rangeAdjustmentPointInTextInputCoordinateSpace:](self, "_rangeAdjustmentPointInTextInputCoordinateSpace:", a3.x, a3.y);
  double v10 = v9;
  double v12 = v11;
  -[UITextInteractionAssistant _rangeAdjustmentPointInTextInputCoordinateSpace:](self, "_rangeAdjustmentPointInTextInputCoordinateSpace:", x, y);
  double v14 = v13;
  double v16 = v15;
  double v17 = [(UITextInteractionAssistant *)self activeSelection];
  double v18 = [(UITextInteractionAssistant *)self rangeAdjustmentInteraction];
  objc_msgSend(v17, "setRangedSelectionExtentPoint:baseIsStart:", objc_msgSend(v18, "baseIsStart"), v10, v12);

  [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
  if (a5)
  {
    if (a5 == 1) {
      [(UITextInteractionAssistant *)self _invalidateSelectionDisplay];
    }
  }
  else
  {
    [(UITextInteractionAssistant *)self setNeedsSelectionDisplayUpdate];
  }
  -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", v14, v16);
}

- (void)textRangeAdjustmentInteraction:(id)a3 didEndAtPoint:(CGPoint)a4
{
  id v5 = a3;
  double v6 = [(UITextInteractionAssistant *)self activeSelection];
  int v7 = [v6 willSelectionChange];

  if (v7)
  {
    if ([(UITextInteractionAssistant(UITextInteractionAssistant_Internal) *)self canShowSelectionCommands])
    {
      [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant showSelectionCommands];
    }
    double v8 = [(UITextInteractionAssistant *)self activeSelection];
    [v8 commit];

    [(UITextInteractionAssistant *)self endSelectionChange];
    [(UITextInteractionAssistant *)self didEndSelectionInteraction];
  }
  else if (![(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant _editMenuIsVisibleOrDismissedRecently]&& [(UITextInteractionAssistant(UITextInteractionAssistant_Internal) *)self canShowSelectionCommands])
  {
    [(_UITextInteractionEditMenuAssistant *)self->_editMenuAssistant showSelectionCommands];
  }
  [(UITextInteractionAssistant *)self cancelAutoscroll];
  id v9 = [(UITextInteractionAssistant *)self _selectionViewManager];
  [v9 _didEndRangeAdjustmentInteraction:v5];
}

- (void)textRangeAdjustmentInteractionWasCancelled:(id)a3
{
  [(UITextInteractionAssistant *)self endSelectionChange];
  [(UITextInteractionAssistant *)self didEndSelectionInteraction];
  [(UITextInteractionAssistant *)self cancelAutoscroll];
}

- (BOOL)textRangeAdjustmentInteractionShouldApplyTouchOffset:(id)a3
{
  return ![(UITextInteractionAssistant *)self isDisplayingVerticalSelection];
}

- (BOOL)textRangeAdjustmentInteraction:(id)a3 shouldDisplayLoupeForTouchType:(int64_t)a4
{
  return [(UITextInteractionAssistant *)self shouldDisplayLoupeSessionForTouchType:a4];
}

- (CGRect)caretRectForTextRangeAdjustmentInteraction:(id)a3
{
  double v3 = [(UITextInteractionAssistant *)self _caretView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (id)containerCoordinateSpaceForTextRangeAdjustmentInteraction:(id)a3
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    double v4 = [(UITextSelectionDisplayInteraction *)self->_selectionViewManager _rangeAdjustmentViewContainer];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    double v4 = [WeakRetained textInputView];
  }
  return v4;
}

- (UITextSelectionDisplayInteraction)_selectionViewManager
{
  return self->_selectionViewManager;
}

- (id)selectionContainerViewAboveText
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v4 = objc_opt_respondsToSelector();

  id v5 = objc_loadWeakRetained((id *)p_view);
  double v6 = v5;
  if (v4) {
    [v5 _selectionContainerViewAboveText];
  }
  else {
  double v7 = [v5 textInputView];
  }

  return v7;
}

- (id)_selectionViewManager:(id)a3 obtainBlinkSuppressionAssertionForReason:(id)a4
{
  id v5 = a4;
  double v6 = [(UITextInteractionAssistant *)self _assertionController];
  double v7 = [v6 nonBlinkingAssertionWithReason:v5];

  return v7;
}

- (id)_selectionViewManager:(id)a3 obtainGhostCursorAssertionForReason:(id)a4
{
  id v5 = a4;
  double v6 = [(UITextInteractionAssistant *)self _assertionController];
  double v7 = [v6 nonBlinkingGhostAssertionWithReason:v5];

  return v7;
}

- (CGPoint)_selectionViewManager:(id)a3 convertPointToRenderSpace:(CGPoint)a4 textRange:(id)a5
{
  -[UITextInteractionAssistant convertPointToRenderSpace:textRange:](self, "convertPointToRenderSpace:textRange:", a5, a4.x, a4.y);
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)convertPointToRenderSpace:(CGPoint)a3 textRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (self->_respondsToConvertPointToRenderSpace)
  {
    p_view = &self->_view;
    id v7 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(WeakRetained, "_convertPointToRenderSpace:textRange:", v7, x, y);
    double x = v9;
    double y = v10;
  }
  double v11 = x;
  double v12 = y;
  result.double y = v12;
  result.double x = v11;
  return result;
}

@end