@interface TSWPEditingController
+ (id)_targetedDragPreviewForSelection:(id)a3 interactiveCanvasController:(id)a4 reps:(id)a5 applyScale:(BOOL)a6 imageFrameUnion:(CGRect *)a7;
+ (id)dragItemForHitRepWithDragInteraction:(id)a3 session:(id)a4 canvasView:(id)a5 icc:(id)a6 withTouchPoint:(CGPoint)a7;
+ (id)dropProposalForSession:(id)a3;
+ (id)previewForDragItem:(id)a3;
+ (id)retargetedDragItem:(id)a3 withDefault:(id)a4 canvasView:(id)a5 icc:(id)a6;
- (BOOL)allowAutomaticTextEditingToBeginWithDifferentEditor;
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)canAcceptOrRejectChange;
- (BOOL)canAddOrShowComment;
- (BOOL)canCenterHUD;
- (BOOL)canCoalesce;
- (BOOL)canCoalesceBreakingCharacters;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)canHandleSwipeGestureForGestureRecognizer:(id)a3 outDelta:(int64_t *)a4 outTextDirection:(int64_t *)a5 outLayoutDirection:(int64_t *)a6;
- (BOOL)canHighlightCurrentSelection;
- (BOOL)canRemoveHighlightForCurrentSelection;
- (BOOL)canSetWritingDirection:(int)a3;
- (BOOL)canShowCommentForCurrentSelectionGetHighlight:(id *)a3 range:(_NSRange *)a4;
- (BOOL)coalescingText;
- (BOOL)disableInspector;
- (BOOL)editorCanHideEditMenu;
- (BOOL)editorKeyboardLanguageIsRTL;
- (BOOL)handleGesture:(id)a3;
- (BOOL)isBecomingActive;
- (BOOL)isDisplayingPhoneticsHUD;
- (BOOL)isEditingPlainText;
- (BOOL)isInParagraphMode;
- (BOOL)isParagraphModeWithSelection:(id)a3 onStorage:(id)a4;
- (BOOL)isSelectionSingleAnchoredDrawableAttachment;
- (BOOL)isUnscaledPointInTextSelection:(CGPoint)a3;
- (BOOL)knobTracking;
- (BOOL)pIsSelectionPlaceHolderText;
- (BOOL)pIsSelectionPlaceHolderTextWithSelection:(id)a3;
- (BOOL)pStorageCanAcceptDrawableAttachments;
- (BOOL)p_canEditTextString;
- (BOOL)p_canInsertBreak;
- (BOOL)p_canSelectAllWithSender:(id)a3;
- (BOOL)p_hitListLabelAtCharIndex:(unint64_t)a3 atNaturalPoint:(CGPoint)a4 inRep:(id)a5;
- (BOOL)p_isCharIndex:(unint64_t)a3 withEolAffinity:(BOOL)a4 atBoundary:(int)a5 inDirection:(int64_t)a6;
- (BOOL)p_isCharIndex:(unint64_t)a3 withinTextUnit:(int)a4 inDirection:(int64_t)a5;
- (BOOL)p_isIgnoringKeyboardInput;
- (BOOL)p_isLayoutLeftToRightAtCharIndex:(unint64_t)a3;
- (BOOL)p_isTextInputEditor;
- (BOOL)p_keyboardShouldShowOnscreen;
- (BOOL)p_respondsToHyperlinkGestures;
- (BOOL)p_respondsToListGestures;
- (BOOL)p_respondsToRubyGestures;
- (BOOL)p_selectionIsSimpleInsertionPoint;
- (BOOL)readyToEndOperation;
- (BOOL)selectionIsOnEmptyParagraph;
- (BOOL)selectionLastModifiedWithKeyboard;
- (BOOL)selectionLastModifiedWithKnob;
- (BOOL)shouldDisplayKeyboard;
- (BOOL)shouldShowEditMenu;
- (BOOL)shouldShowSelectedTextAsFocused;
- (BOOL)supportsDataDetectors;
- (BOOL)suppressBreaks;
- (BOOL)suppressDataDetectorsOnResignTextInput;
- (BOOL)suppressPhonetics;
- (BOOL)suppressTabs;
- (BOOL)suppressesTextInspector;
- (BOOL)swipeableParagraphIsSelected;
- (BOOL)textEditingSupportsFormatBar;
- (BOOL)textIsVerticalAtCharIndex:(unint64_t)a3;
- (BOOL)textStorage:(id)a3 hasWhitespaceBoundedWordAtSelection:(id)a4;
- (BOOL)trackingKnobInParagraphMode;
- (BOOL)wantsCaret;
- (BOOL)wantsDoneButtonWhenEditing;
- (BOOL)wantsKeyboard;
- (CGPoint)autoscrollPoint;
- (CGPoint)knobTrackingDragPoint;
- (CGPoint)p_clampPointToLine:(CGPoint)a3 trackingRep:(id)a4;
- (CGRect)firstRectForRange:(_NSRange)a3;
- (CGRect)overrideCaretRectForSelection:(id)a3;
- (CGRect)p_adjustedPopoverTargetRectForRange:(_NSRange)a3;
- (CGRect)p_firstRectForRange:(_NSRange)a3 actualRange:(_NSRange *)a4;
- (CGRect)p_targetRectForSelection:(id)a3;
- (NSAttributedString)markedText;
- (TSDAutoscroll)autoscroll;
- (TSDEditor)hostEditor;
- (TSDInteractiveCanvasController)icc;
- (TSDTextSelection)textInputSelection;
- (TSWPCharacterStyle)insertionStyle;
- (TSWPEditingController)initWithStorage:(id)a3 interactiveCanvasController:(id)a4;
- (TSWPInteractiveCanvasController)interactiveCanvasController;
- (TSWPSelection)selection;
- (TSWPStorage)storage;
- (UIView)inputAccessoryView;
- (UIView)inputView;
- (_NSRange)editRange;
- (_NSRange)markedRange;
- (_NSRange)p_adjustVisualSelection:(id)a3 withOtherSelection:(id)a4;
- (_NSRange)p_expandParagraphRangeForEnumerator:(TSWPParagraphEnumerator *)a3;
- (_NSRange)rangeOfWordEnclosingCharIndex:(unint64_t)a3 backward:(BOOL)a4;
- (_NSRange)smartDeletionSelection:(id)a3 isVisual:(BOOL *)a4;
- (_NSRange)tsax_rangeOfLineFragmentAtCharIndex:(unint64_t)a3;
- (__CFStringTokenizer)p_createTokenizerForCharIndex:(unint64_t)a3 outTokenizerRange:(_NSRange *)a4;
- (const)p_lastVisibleLineFragmentForCharIndex:(unint64_t)a3 eol:(BOOL)a4;
- (const)p_lineFragmentForCharIndex:(unint64_t)a3 column:(id *)a4 eol:(BOOL)a5;
- (const)p_lineFragmentWithCaretInfo:(id *)a3 forSelection:(id)a4;
- (const)p_nearestLineFragmentWithSameVerticalPositionAs:(unint64_t)a3 xPos:(double)a4 inColumn:(id)a5;
- (double)p_effectiveFontSizeForCurrentSelection;
- (double)targetPointSizeForSelectionWithViewScale:(double)a3;
- (double)viewScaleForSelectionWithTargetPointSize:(double)a3;
- (id)_addSelectionRectsForLayout:(id)a3 selection:(id)a4;
- (id)_repsForStorage:(id)a3 selection:(id)a4;
- (id)calculateVisualRunsFromSelection:(id)a3 updateControllerSelection:(BOOL)a4;
- (id)characterStyleForDeletedRange:(_NSRange)a3;
- (id)currentFontColor;
- (id)currentLayoutParent;
- (id)dictationInterpretationsAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4;
- (id)documentRoot;
- (id)dragItemForCurrentSelectionWithDragInteraction:(id)a3 session:(id)a4 withTouchPoint:(CGPoint)a5;
- (id)editingReps;
- (id)editingSearchReference;
- (id)extendSelectionToParagraphs:(id)a3;
- (id)extraMenuItems;
- (id)logicalToVisualSelection:(id)a3;
- (id)model;
- (id)p_columnForCharIndex:(unint64_t)a3;
- (id)p_columnForCharIndex:(unint64_t)a3 withStorage:(id)a4;
- (id)p_containingShapeRep;
- (id)p_documentViewController;
- (id)p_editingRepForCharIndex:(unint64_t)a3;
- (id)p_extendSelectionToIncludeSmartFields:(id)a3;
- (id)p_highlightSelectionForSelection:(id)a3;
- (id)p_hitRepWithPoint:(CGPoint)a3 keyboardAdjustmentDelta:(double)a4;
- (id)p_layoutTargetForCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4;
- (id)p_previousAutocorrectionForWordAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4;
- (id)p_repForSwipeAtUnscaledLocation:(CGPoint)a3;
- (id)p_selectionForRep:(id)a3 point:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7 includeListLabels:(BOOL)a8 allowPastBreak:(BOOL)a9 selectsEntireLink:(BOOL)a10;
- (id)p_selectionFromUnscaledCanvasPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 isTapHold:(BOOL)a5 allowPastBreak:(BOOL)a6 selectsEntireLink:(BOOL)a7;
- (id)p_viewControllerForPresenting;
- (id)p_wordRangesForRange:(_NSRange)a3;
- (id)pasteboardController;
- (id)selectionForRep:(id)a3 point:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5;
- (id)selectionFromUnscaledCanvasPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 isTapHold:(BOOL)a5 allowPastBreak:(BOOL)a6 selectsEntireLink:(BOOL)a7;
- (id)selectionRectsForRange:(_NSRange)a3;
- (id)selectionWithRange:(_NSRange)a3;
- (id)stringFromSelection;
- (id)styleProvider;
- (id)textColorAtCharIndex:(unint64_t)a3;
- (id)textFontAtCharIndex:(unint64_t)a3;
- (id)textInRange:(_NSRange)a3;
- (id)topLevelInspectorAutosaveName;
- (id)tracker;
- (id)tsax_listItemLabelForCharIndex:(unint64_t)a3 textIsLiteral:(BOOL *)a4;
- (id)unfilteredText;
- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (int)p_canPerformOptInEditorAction:(SEL)a3 withSender:(id)a4;
- (int)p_moveFromCharIndex:(unint64_t *)a3 tokenizerRef:(__CFStringTokenizer *)a4 tokenizerRange:(_NSRange *)a5 direction:(int64_t)a6 currentWordRange:(_NSRange)a7 newWordRange:(_NSRange *)a8 reasonToStop:(unsigned int)a9;
- (int)p_writingDirectionForCharAtIndex:(unint64_t)a3;
- (int)valueForWritingDirectionPropertyForInspector:(id)a3;
- (int64_t)returnKeyType;
- (int64_t)writingDirectionForCharIndex:(unint64_t)a3;
- (unint64_t)charIndexByMovingPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5 preferPosition:(double *)a6;
- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7;
- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 isAtEndOfLine:(BOOL *)a8;
- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 leadingEdge:(BOOL *)a7;
- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 inDirection:(int64_t)a4;
- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL *)a4 inDirection:(int64_t)a5;
- (unint64_t)charIndexMovingByWordFromCharIndex:(unint64_t)a3 inDirection:(int64_t)a4;
- (unint64_t)closestCharIndexToPoint:(CGPoint)a3 isAtEndOfLine:(BOOL *)a4;
- (unint64_t)countOfHyperlinksInUserSelection;
- (unint64_t)currentSelectionFlags;
- (unint64_t)insertionPoint;
- (unint64_t)knobTag;
- (unint64_t)p_LeftCharForInsertion:(id *)a3;
- (unint64_t)p_MoveByLineRange:(_NSRange)a3 up:(BOOL)a4;
- (unint64_t)p_adjustedCharIndexForWordTestingFromCharIndex:(unint64_t)a3 forDirection:(int64_t)a4;
- (unint64_t)p_caretCharIndexForLayoutOrderCharIndex:(unint64_t)a3 inDirection:(int64_t)a4;
- (unint64_t)p_charIndexAtPoint:(CGPoint)a3 isAtEndOfLine:(BOOL *)a4;
- (unint64_t)p_charIndexByMovingCharIndex:(unint64_t)a3 withEolAffinity:(BOOL *)a4 toBoundary:(int)a5 inDirection:(int64_t)a6 preferPosition:(double *)a7 isLeadingEdge:(BOOL *)a8;
- (unint64_t)p_getVisualDeletionIndexForSelection:(id)a3 backward:(BOOL *)a4;
- (unint64_t)p_getVisualInsertionPointIndexForString:(id)a3 selection:(id)a4;
- (unint64_t)p_layoutOrderCharIndexForCaretCharIndex:(unint64_t)a3 inDirection:(int64_t)a4;
- (unint64_t)p_leftEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4;
- (unint64_t)p_lineIndexForCharIndex:(unint64_t)a3 column:(id *)a4 eol:(BOOL)a5;
- (unint64_t)p_rightEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4;
- (unint64_t)textLength;
- (unint64_t)textSelectionGranularityForTapCount:(unint64_t)a3;
- (unsigned)knobTrackingTapCount;
- (void)abandonMarkedText;
- (void)addAllDictationInterpretationRangesInRange:(_NSRange)a3 toRanges:(void *)a4;
- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4;
- (void)autoscrollWillNotStart;
- (void)beginAutomaticTextEditingIfNeededForPoint:(CGPoint)a3;
- (void)cancelKnobTrackingAndMagnifying;
- (void)cancelPhoneticsHUDAnimated:(BOOL)a3;
- (void)clearMarkedRange;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)definitionAction:(id)a3;
- (void)didBecomeCurrentEditor;
- (void)didBecomeTextInputEditor;
- (void)didEnterBackground;
- (void)dismissActivePopovers;
- (void)dismissPhoneticsHUDAnimated:(BOOL)a3;
- (void)endEditing;
- (void)endEditingAndSelectParent:(id)a3;
- (void)extendSelectionLeft;
- (void)extendSelectionRight;
- (void)gestureSequenceDidEnd;
- (void)gestureSequenceWillBegin;
- (void)invalidateSelectionVisualRuns;
- (void)p_addCommonEditItemsIntoMenu:(id)a3;
- (void)p_addInsertItemsIntoMenu:(id)a3;
- (void)p_adjustSelection:(id)a3 withOtherSelection:(id)a4 textSelectionGranularity:(unint64_t)a5;
- (void)p_adjustSelection:(id)a3 withUnscaledCanvasPoint:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 allowPastBreak:(BOOL)a7;
- (void)p_beginKnobTrackingSelection:(id)a3 forRep:(id)a4 atPoint:(CGPoint)a5;
- (void)p_beginMagnification:(id)a3 forRep:(id)a4 atPoint:(CGPoint)a5;
- (void)p_beginOperationAndTakeControl;
- (void)p_beginTapAndLongPress:(id)a3;
- (void)p_cancelDelayedSelectors;
- (void)p_cancelTapAndLongPressPreviousSelector;
- (void)p_clearEditMenuFlags;
- (void)p_clearSecondaryHighlight;
- (void)p_createKnobTracker:(id)a3 forRep:(id)a4 tapCount:(unint64_t)a5;
- (void)p_dismissDefinitionPopover;
- (void)p_endAutoscroll;
- (void)p_handleKnobDragGestureRecognizer:(id)a3;
- (void)p_handleLongPressGesture:(id)a3;
- (void)p_handleSwipeMoveCaretWithTextGranularity:(int64_t)a3 textDirection:(int64_t)a4 layoutDirection:(int64_t)a5;
- (void)p_handleTapAndTouchGesture:(id)a3;
- (void)p_handleTapGestures:(id)a3;
- (void)p_highlightRubyTextWithRange:(_NSRange)a3;
- (void)p_inputLanguageDidChangeNotification:(id)a3;
- (void)p_postSelectionContentsChangedNotification;
- (void)p_postWillStyleTextNotification;
- (void)p_removeAutocorrectionAtCharIndex:(unint64_t)a3;
- (void)p_rescheduleDelayedUpdateHUDState;
- (void)p_selection:(id)a3 toGlyphRange:(id *)a4;
- (void)p_sendHandleTapNotification;
- (void)p_setInsertionStyle:(id)a3;
- (void)p_setRevertibleSelection:(id)a3;
- (void)p_setSelection:(id)a3 withFlags:(unint64_t)a4 force:(BOOL)a5;
- (void)p_setSelectionFromPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 includeListLabels:(BOOL)a5;
- (void)p_setTappedSelection:(id)a3;
- (void)p_suppressSelectionHighlight:(BOOL)a3;
- (void)p_switchToReplaceSelection;
- (void)p_updateHUDState;
- (void)popoverControllerDidDismissPopoverBasedViewController:(id)a3;
- (void)referenceLibrarayViewControllerWasDismissed:(id)a3;
- (void)replaceAction:(id)a3;
- (void)revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold;
- (void)select:(id)a3;
- (void)selectAll:(id)a3;
- (void)selectionChangedWithFlags:(unint64_t)a3 wpFlags:(unint64_t)a4;
- (void)setAutoscroll:(id)a3;
- (void)setAutoscrollPoint:(CGPoint)a3;
- (void)setCanCoalesce:(BOOL)a3;
- (void)setCanCoalesceBreakingCharacters:(BOOL)a3;
- (void)setCoalescingText:(BOOL)a3;
- (void)setDisableInspector:(BOOL)a3;
- (void)setHostEditor:(id)a3;
- (void)setInsertionPoint:(unint64_t)a3;
- (void)setInsertionPoint:(unint64_t)a3 withFlags:(unint64_t)a4;
- (void)setIsBecomingActive:(BOOL)a3;
- (void)setIsEditingPlainText:(BOOL)a3;
- (void)setKnobTag:(unint64_t)a3;
- (void)setKnobTracking:(BOOL)a3;
- (void)setKnobTrackingDragPoint:(CGPoint)a3;
- (void)setKnobTrackingTapCount:(unsigned int)a3;
- (void)setSelection:(id)a3;
- (void)setSelection:(id)a3 withFlags:(unint64_t)a4;
- (void)setSelectionWithRange:(_NSRange)a3 endOfLine:(BOOL)a4;
- (void)setSelectionWithRange:(_NSRange)a3 leadingEdge:(BOOL)a4 endOfLine:(BOOL)a5;
- (void)setShouldDisplayKeyboard:(BOOL)a3;
- (void)setSupportsDataDetectors:(BOOL)a3;
- (void)setSuppressBreaks:(BOOL)a3;
- (void)setSuppressPhonetics:(BOOL)a3;
- (void)setSuppressTabs:(BOOL)a3;
- (void)styleAction:(id)a3;
- (void)tappedInRep:(id)a3 point:(CGPoint)a4 tapCount:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7;
- (void)tappedOnKnob:(id)a3;
- (void)teardown;
- (void)updateAfterAutoscroll:(id)a3;
- (void)updateHUDState;
- (void)willEnterForeground;
- (void)willResignCurrentEditor;
- (void)willResignTextInputEditor;
- (void)willResignTextInputEditorAndDeselect:(BOOL)a3;
@end

@implementation TSWPEditingController

- (TSWPSelection)selection
{
  selection = self->_selection;
  if (selection)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPEditingController selection]"];
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 489, @"Bad selection class - returning nil.");
      return 0;
    }
  }
  return selection;
}

- (TSDTextSelection)textInputSelection
{
  return (TSDTextSelection *)self->_selection;
}

- (TSWPEditingController)initWithStorage:(id)a3 interactiveCanvasController:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TSWPEditingController;
  v6 = [(TSWPEditingController *)&v10 init];
  if (v6)
  {
    *((void *)v6 + 1) = a3;
    *((void *)v6 + 3) = a4;
    long long v7 = *MEMORY[0x263F7C7C8];
    *(_OWORD *)(v6 + 72) = *MEMORY[0x263F7C7C8];
    *((void *)v6 + 13) = 0x7FFFFFFFFFFFFFFFLL;
    v6[113] = 1;
    v6[360] = 0;
    *(_OWORD *)(v6 + 152) = v7;
    [v6 setShouldDisplayKeyboard:1];
    v8 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v6 selector:sel_p_inputLanguageDidChangeNotification_ name:*MEMORY[0x263F1D788] object:0];
    [v6 setSupportsDataDetectors:1];
    objc_msgSend(v6, "setSuppressPhonetics:", objc_msgSend(a3, "allowsElementKind:", 4096) ^ 1);
  }
  return (TSWPEditingController *)v6;
}

- (void)dealloc
{
  if (self->_knobTracking)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPEditingController dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 597, @"-dealloc called while tracking");
  }
  if (self->_definitionPopoverController)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPEditingController dealloc]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 599, @"expected nil value for '%s'", "_definitionPopoverController");
  }
  if ((TSUSupportsTextInteraction() & 1) == 0 && self->_definitionViewController)
  {
    long long v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPEditingController dealloc]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 602, @"expected nil value for '%s'", "_definitionViewController");
  }

  self->_inputViewForHidingKeyboard = 0;
  self->_autoscroll = 0;

  self->_selection = 0;
  self->_suggestions = 0;

  self->_insertionStyle = 0;
  self->_storage = 0;

  self->_fidgetResolver = 0;
  self->_tapInfo = 0;

  self->_markedText = 0;
  [(TSDMultiPaneController *)self->_insertBreakPopoverController dismissAnimated:0];

  self->_insertBreakPopoverController = 0;
  self->_dictationInterpretations = 0;

  self->_autocorrectedEntries = 0;
  self->_previousSelectedAnnotation = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  v9.receiver = self;
  v9.super_class = (Class)TSWPEditingController;
  [(TSWPEditingController *)&v9 dealloc];
}

- (void)teardown
{
  [(TSWPEditingController *)self p_cancelDelayedSelectors];
  self->_interactiveCanvasController = 0;
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v3 removeObserver:self];
}

- (void)setCoalescingText:(BOOL)a3
{
  self->_coalescingText = a3;
  [(TSWPEditingController *)self setCanCoalesceBreakingCharacters:0];
}

- (void)setKnobTracking:(BOOL)a3
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  v5 = (void *)TSUProtocolCast();
  self->_knobTracking = a3;
  if (a3)
  {
    uint64_t v6 = objc_alloc_init(TSKFidgetResolver);
    self->_fidgetResolver = v6;
    [(TSKFidgetResolver *)v6 setFidgetThreshold:0.2];
    if (objc_opt_respondsToSelector())
    {
      [v5 knobTrackingDidBegin];
    }
  }
  else
  {
    [(TSWPEditingController *)self setKnobTrackingTapCount:0];
    selection = self->_selection;
    if (selection && [(TSWPSelection *)selection isValid])
    {
      if ([(TSWPEditingController *)self isInParagraphMode])
      {
        uint64_t v8 = objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "canvasView"), "enclosingScrollView");
        interactiveCanvasController = self->_interactiveCanvasController;
        [v8 contentOffset];
        -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](interactiveCanvasController, "convertBoundsToUnscaledPoint:");
        double v11 = v10;
        double v13 = v12;
        v14 = self->_interactiveCanvasController;
        [(TSDInteractiveCanvasController *)v14 viewScale];
        -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](v14, "clampedUnscaledContentOffset:forViewScale:", v11, v13, v15);
        -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](self->_interactiveCanvasController, "convertUnscaledToBoundsPoint:");
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __41__TSWPEditingController_setKnobTracking___block_invoke;
        v18[3] = &unk_2646B0700;
        v18[4] = v8;
        v18[5] = v16;
        v18[6] = v17;
        [MEMORY[0x263F1CB60] animateWithDuration:v18 animations:0.25];
      }

      self->_fidgetResolver = 0;
    }
    if (objc_opt_respondsToSelector()) {
      [v5 knobTrackingDidEnd];
    }
  }
}

uint64_t __41__TSWPEditingController_setKnobTracking___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)model
{
  return self->_storage;
}

- (id)documentRoot
{
  return [(TSDInteractiveCanvasController *)self->_interactiveCanvasController documentRoot];
}

- (void)didBecomeCurrentEditor
{
  self->_initialStorageChangeCount = [(TSWPStorage *)self->_storage changeCount];
}

- (void)willResignCurrentEditor
{
  [(TSWPEditingController *)self dismissActivePopovers];
  [(TSWPEditingController *)self p_cancelDelayedSelectors];
  [(TSKChangeNotifier *)[(TSDInteractiveCanvasController *)self->_interactiveCanvasController changeNotifier] removeObserver:self forChangeSource:self->_storage];
  interactiveCanvasController = self->_interactiveCanvasController;

  [(TSWPInteractiveCanvasController *)interactiveCanvasController willEndEditingText];
}

- (void)didBecomeTextInputEditor
{
  self->_dictationInterpretations = 0;
  self->_autocorrectedEntries = 0;
}

- (id)p_containingShapeRep
{
  if (!self->_storage) {
    return 0;
  }
  id v2 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController repsForInfo:[(TSWPEditingController *)self storage]];
  objc_opt_class();
  [v2 anyObject];
  uint64_t v3 = TSUDynamicCast();
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (void *)v3;
  objc_opt_class();
  [v4 parentRep];

  return (id)TSUDynamicCast();
}

- (void)willResignTextInputEditorAndDeselect:(BOOL)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  if (self->_storage)
  {
    BOOL v4 = a3;
    if (![(TSWPInteractiveCanvasController *)self->_interactiveCanvasController isTearingDown])
    {
      id v5 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController repsForInfo:[(TSWPEditingController *)self storage]];
      objc_opt_class();
      [v5 anyObject];
      uint64_t v6 = TSUDynamicCast();
      if (v6)
      {
        long long v7 = (void *)v6;
        objc_opt_class();
        [v7 parentRep];
        uint64_t v8 = (void *)TSUDynamicCast();
        if (v8) {
          [v8 willEndEditingContainedRep];
        }
      }
      if (v4) {
        [(TSWPEditingController *)self setSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8))];
      }
      if ([v5 count]
        && [(TSWPStorage *)[(TSWPEditingController *)self storage] wpKind] == 5)
      {
        [v5 enumerateObjectsUsingBlock:&__block_literal_global_66];
      }
      +[TSWPEditMenuController hideEditMenu];

      self->_dictationInterpretations = 0;
      self->_autocorrectedEntries = 0;
    }
  }
  [(TSWPEditingController *)self setCoalescingText:0];
  if (self->_storage)
  {
    double v10 = @"TSWPEditingControllerEditor";
    v11[0] = self;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"TSWPEditingControllerEditingDidEnd", self->_storage, v9);
  }
}

uint64_t __62__TSWPEditingController_willResignTextInputEditorAndDeselect___block_invoke()
{
  objc_opt_class();
  v0 = (void *)[(id)TSUDynamicCast() parentRep];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return [v0 willEndEditingContainedRep];
  }
  return result;
}

- (void)willResignTextInputEditor
{
}

- (void)willEnterForeground
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController repsForInfo:[(TSWPEditingController *)self storage]];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) willEnterForeground];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)didEnterBackground
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(TSWPEditingController *)self protectedStopMagnification];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController repsForInfo:[(TSWPEditingController *)self storage]];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) didEnterBackground];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)cancelKnobTrackingAndMagnifying
{
  [(TSWPEditingController *)self p_cancelDelayedSelectors];
  if (self->_knobTracker)
  {
    self->_readyToEnd = 1;
    [(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] dynamicOperationController] handleTrackerManipulator:self];

    self->_knobTracker = 0;
  }
  else
  {
    [(TSWPEditingController *)self protectedStopMagnification];
  }
}

- (id)editingReps
{
  id v3 = (void *)[MEMORY[0x263EFF9C0] set];
  objc_opt_class();
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController repForInfo:[(TSWPEditingController *)self storage]];
  uint64_t v4 = TSUDynamicCast();
  if (v4) {
    [v3 addObject:v4];
  }
  return v3;
}

- (id)p_editingRepForCharIndex:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(TSWPEditingController *)self editingReps];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v18;
  unint64_t v8 = a3 ? a3 - 1 : 0;
LABEL_5:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v18 != v7) {
      objc_enumerationMutation(v4);
    }
    long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
    unint64_t v11 = [v10 range];
    if (v8 >= v11 && v8 - v11 < v12) {
      break;
    }
    if (v6 == ++v9)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        goto LABEL_5;
      }
      break;
    }
  }
  if (!v10)
  {
LABEL_16:
    v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSWPEditingController p_editingRepForCharIndex:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 1270, @"No valid rep for given char index");
    return 0;
  }
  return v10;
}

- (void)p_suppressSelectionHighlight:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(TSWPEditingController *)self editingReps];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 isSelectionHighlightSuppressed] != v3)
        {
          [v9 setSuppressSelectionHighlight:v3];
          [v9 invalidateKnobs];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (CGRect)p_targetRectForSelection:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v5 = (double *)MEMORY[0x263F001A0];
  double v6 = *MEMORY[0x263F001A0];
  double v7 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A0] + 24);
  id v10 = [(TSWPEditingController *)self editingReps];
  if (v10)
  {
    long long v11 = v10;
    double v63 = v9;
    double v64 = v8;
    double v65 = v7;
    double v66 = v6;
    double v12 = *v5;
    double v13 = v5[1];
    double v14 = v5[2];
    double v15 = v5[3];
    uint64_t v16 = [(TSWPEditingController *)self interactiveCanvasController];
    [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] visibleBoundsRectClippedToWindow];
    -[TSDInteractiveCanvasController convertBoundsToUnscaledRect:](v16, "convertBoundsToUnscaledRect:");
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    int v25 = [a3 isInsertionPoint];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v26 = [v11 countByEnumeratingWithState:&v69 objects:v73 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v70;
      double v67 = v24;
      double v29 = v18;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v70 != v28) {
            objc_enumerationMutation(v11);
          }
          v31 = *(void **)(*((void *)&v69 + 1) + 8 * v30);
          v68.size.CGFloat width = v14;
          v68.size.CGFloat height = v15;
          v68.origin.CGFloat x = v12;
          v68.origin.CGFloat y = v13;
          if (v25) {
            [v31 caretRectForSelection:a3];
          }
          else {
            [v31 rectForSelection:a3];
          }
          objc_msgSend(v31, "convertNaturalRectToUnscaledCanvas:");
          CGFloat v33 = v32;
          CGFloat v35 = v34;
          CGFloat v37 = v36;
          CGFloat v39 = v38;
          uint64_t v40 = [v31 parentRep];
          double v41 = v29;
          double v42 = v20;
          double v43 = v22;
          double v44 = v67;
          if (v40)
          {
            v45 = objc_msgSend(v31, "parentRep", v29, v20, v22, v67);
            objc_msgSend((id)objc_msgSend(v31, "parentRep"), "clipRect");
            objc_msgSend(v45, "convertNaturalRectToUnscaledCanvas:");
            v82.origin.CGFloat x = v46;
            v82.origin.CGFloat y = v47;
            v82.size.CGFloat width = v48;
            v82.size.CGFloat height = v49;
            v75.origin.CGFloat x = v29;
            v75.origin.CGFloat y = v20;
            v75.size.CGFloat width = v22;
            v75.size.CGFloat height = v67;
            *(CGRect *)&double v41 = CGRectIntersection(v75, v82);
          }
          v83.origin.CGFloat x = v33;
          v83.origin.CGFloat y = v35;
          v83.size.CGFloat width = v37;
          v83.size.CGFloat height = v39;
          CGRect v76 = CGRectIntersection(*(CGRect *)&v41, v83);
          CGFloat x = v76.origin.x;
          CGFloat y = v76.origin.y;
          CGFloat width = v76.size.width;
          CGFloat height = v76.size.height;
          if (CGRectGetHeight(v76) == 0.0
            && (v77.origin.CGFloat x = x,
                v77.origin.CGFloat y = y,
                v77.size.CGFloat width = width,
                v77.size.CGFloat height = height,
                CGRectGetWidth(v77) == 0.0))
          {
            double v12 = v68.origin.x;
            double v13 = v68.origin.y;
            double v14 = v68.size.width;
            double v15 = v68.size.height;
          }
          else
          {
            v84.origin.CGFloat x = x;
            v84.origin.CGFloat y = y;
            v84.size.CGFloat width = width;
            v84.size.CGFloat height = height;
            CGRect v78 = CGRectUnion(v68, v84);
            double v12 = v78.origin.x;
            double v13 = v78.origin.y;
            double v14 = v78.size.width;
            double v15 = v78.size.height;
          }
          ++v30;
        }
        while (v27 != v30);
        uint64_t v54 = [v11 countByEnumeratingWithState:&v69 objects:v73 count:16];
        uint64_t v27 = v54;
      }
      while (v54);
    }
    v79.origin.CGFloat x = v12;
    v79.origin.CGFloat y = v13;
    v79.size.CGFloat width = v14;
    v79.size.CGFloat height = v15;
    double v7 = v65;
    double v6 = v66;
    double v9 = v63;
    double v8 = v64;
    if (CGRectGetHeight(v79) != 0.0
      || (v80.origin.CGFloat x = v12, v80.origin.y = v13,
                              v80.size.CGFloat width = v14,
                              v80.size.CGFloat height = v15,
                              CGRectGetWidth(v80) != 0.0))
    {
      -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:]([(TSWPEditingController *)self interactiveCanvasController], "convertUnscaledToBoundsRect:", v12, v13, v14, v15);
      double v6 = v55;
      double v7 = v56;
      double v8 = v57;
      double v9 = v58;
    }
  }
  double v59 = v6;
  double v60 = v7;
  double v61 = v8;
  double v62 = v9;
  result.size.CGFloat height = v62;
  result.size.CGFloat width = v61;
  result.origin.CGFloat y = v60;
  result.origin.CGFloat x = v59;
  return result;
}

- (BOOL)shouldShowEditMenu
{
  if ((TSUSupportsTextInteraction() & 1) != 0 || self->_suppressEditMenu) {
    goto LABEL_3;
  }
  if ([(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] documentRoot] isFindActive]|| [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] textGesturesInFlight]|| [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] currentlyScrolling]|| [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] animatingViewScale]|| self->_magnifying|| [(TSWPEditingController *)self isSelectionSingleAnchoredDrawableAttachment])
  {
    int v4 = 0;
  }
  else
  {
    int v4 = ![(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] inReadMode];
  }
  if (TSUSupportsTextInteraction())
  {
    if (!v4) {
      goto LABEL_3;
    }
  }
  else if (!v4 || self->_definitionViewController)
  {
    goto LABEL_3;
  }
  if (self->_definitionPopoverController
    || ([(TSWPDismissBlockPopover *)self->_rubyTextViewController isVisible] & 1) != 0
    || (objc_msgSend(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"), "isDisplayingHyperlinkUI") & 1) != 0)
  {
    goto LABEL_3;
  }
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  uint64_t v5 = (void *)TSUProtocolCast();
  if (objc_opt_respondsToSelector())
  {
    int v3 = [v5 editorAllowsEditMenu];
    if (!v3) {
      return v3;
    }
  }
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  double v6 = (void *)TSUProtocolCast();
  if (objc_opt_respondsToSelector())
  {
    int v3 = [v6 allowEditMenuToAppear];
    if (!v3) {
      return v3;
    }
  }
  if (+[TSKPopoverController anyPopoversVisible]
    || [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] inspectorModeEnabled]|| self->_markedRange.length|| self->_knobTracking)
  {
LABEL_3:
    LOBYTE(v3) = 0;
    return v3;
  }
  double v7 = [(TSWPEditingController *)self selection];
  if ([(TSWPSelection *)v7 isValid] && [(TSWPSelection *)v7 type] != 2)
  {
    [(TSWPSelection *)v7 range];
    BOOL v8 = v9 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  BOOL v10 = [(TSWPStorage *)[(TSWPEditingController *)self storage] wpKind] == 1
     && [(TSWPStorage *)[(TSWPEditingController *)self storage] length] == 0;
  char v11 = self->_shouldShowEditMenuForInsertionPoint || v8;
  LOBYTE(v3) = 1;
  if ((v11 & 1) == 0 && !v10) {
    LOBYTE(v3) = self->_showNextEditMenu;
  }
  return v3;
}

- (BOOL)editorCanHideEditMenu
{
  return TSUSupportsTextInteraction() ^ 1;
}

- (BOOL)wantsDoneButtonWhenEditing
{
  return 1;
}

- (void)dismissActivePopovers
{
  [(TSWPEditingController *)self p_dismissDefinitionPopover];
  insertBreakPopoverController = self->_insertBreakPopoverController;
  if (insertBreakPopoverController)
  {
    [(TSDMultiPaneController *)insertBreakPopoverController dismissAnimated:1];
    int v4 = self->_insertBreakPopoverController;
    self->_insertBreakPopoverController = 0;
  }
}

- (void)p_clearEditMenuFlags
{
  *(_WORD *)&self->_shouldShowEditMenuForInsertionPoint = 0;
}

- (BOOL)isSelectionSingleAnchoredDrawableAttachment
{
  int v3 = [(TSWPEditingController *)self selection];
  if (![(TSWPSelection *)v3 isRange]) {
    return 0;
  }
  [(TSWPSelection *)v3 range];
  if (v4 != 1) {
    return 0;
  }
  objc_opt_class();
  [(TSWPStorage *)[(TSWPEditingController *)self storage] attachmentAtCharIndex:[(TSWPSelection *)v3 range]];
  uint64_t v5 = (void *)TSUDynamicCast();

  return [v5 isAnchored];
}

- (void)p_rescheduleDelayedUpdateHUDState
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_p_updateHUDState object:0];

  [(TSWPEditingController *)self performSelector:sel_p_updateHUDState withObject:0 afterDelay:0.1];
}

- (void)p_updateHUDState
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (objc_msgSend(-[TSWPEditingController editingReps](self, "editingReps"), "count"))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = [(TSWPEditingController *)self editingReps];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v7), "layout"), "layoutIsValid"))goto LABEL_11; {
        if (v5 == ++v7)
        }
        {
          uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v5) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    if (+[TSWPEditMenuController isAnimating])
    {
LABEL_11:
      [(TSWPEditingController *)self p_rescheduleDelayedUpdateHUDState];
      return;
    }
    if ([(TSWPEditingController *)self shouldShowEditMenu]
      && ([(TSWPEditingController *)self p_targetRectForSelection:[(TSWPEditingController *)self selection]], double x = v23.origin.x, y = v23.origin.y, width = v23.size.width, height = v23.size.height, !CGRectIsNull(v23)))
    {
      +[TSWPEditMenuController showEditMenuAtTargetRect:canCenterHUD:interactiveCanvasController:](TSWPEditMenuController, "showEditMenuAtTargetRect:canCenterHUD:interactiveCanvasController:", [(TSWPEditingController *)self canCenterHUD], [(TSWPEditingController *)self interactiveCanvasController], x, y, width, height);
      self->_editMenuIsVisible = 1;
    }
    else if ([(TSWPEditingController *)self editorCanHideEditMenu])
    {
      [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
      double v12 = (void *)TSUProtocolCast();
      double v13 = [(TSWPEditingController *)self selection];
      +[TSWPEditMenuController hideEditMenu];
      self->_editMenuIsVisible = 0;
      if (objc_opt_respondsToSelector())
      {
        storage = self->_storage;
        uint64_t v15 = [(TSWPSelection *)v13 range];
        objc_msgSend(v12, "showCustomEditMenuForStorage:range:", storage, v15, v16);
      }
    }
  }
}

- (BOOL)canCenterHUD
{
  return 1;
}

- (void)p_cancelDelayedSelectors
{
  [(TSWPEditingController *)self p_cancelTapAndLongPressPreviousSelector];
  id v3 = (void *)MEMORY[0x263F8C6D0];

  [v3 cancelPreviousPerformRequestsWithTarget:self];
}

- (void)updateHUDState
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2234CA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "This call is a no-op for clients that use UITextInteraction.", v0, 2u);
}

- (id)topLevelInspectorAutosaveName
{
  return @"TSWPTextInspectorLastSelectedPane";
}

- (_NSRange)editRange
{
  if (!TSUSupportsTextInteraction())
  {
    if ([(TSWPSelection *)self->_selection isValid])
    {
      unint64_t v6 = [(TSWPStorage *)self->_storage selectionRangeForCharIndex:[(TSWPSelection *)self->_selection start]];
      NSUInteger v8 = v7;
      unint64_t v9 = [(TSWPSelection *)self->_selection range];
      if (v6 > v9 || v6 + v8 < v9 + v10)
      {
        double v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v13 = [NSString stringWithUTF8String:"-[TSWPEditingController editRange]"];
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 1906, @"Bad range from selectionRangeForCharIndex.");
      }
      goto LABEL_13;
    }
LABEL_12:
    unint64_t v6 = 0;
    NSUInteger v8 = 0;
LABEL_13:
    NSUInteger v4 = v6;
    NSUInteger v5 = v8;
    goto LABEL_14;
  }
  storage = self->_storage;
  if (!storage) {
    goto LABEL_12;
  }

  NSUInteger v4 = [(TSWPStorage *)storage range];
LABEL_14:
  result.length = v5;
  result.location = v4;
  return result;
}

- (double)p_effectiveFontSizeForCurrentSelection
{
  v6[3] = *MEMORY[0x263EF8340];
  BOOL v3 = [(TSWPSelection *)self->_selection isValid];
  double result = 0.0;
  if (v3)
  {
    uint64_t v5 = [(TSWPSelection *)self->_selection range];
    v6[1] = [(TSWPStorage *)self->_storage characterStyleAtCharIndex:v5 - ((v5 != 0) & ~[(TSWPSelection *)self->_selection isRange]) effectiveRange:0];
    v6[2] = objc_msgSend(-[TSWPEditingController styleProvider](self, "styleProvider"), "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self->_storage, "paragraphIndexAtCharIndex:", -[TSWPSelection range](self->_selection, "range")), 0);
    TSWPResolveFloatPropertyForStyles(v6, 3uLL, 17);
  }
  return result;
}

- (double)viewScaleForSelectionWithTargetPointSize:(double)a3
{
  [(TSWPEditingController *)self p_effectiveFontSizeForCurrentSelection];
  double v5 = a3 / v4;
  BOOL v6 = v4 <= 0.0;
  double result = 0.0;
  if (!v6) {
    return v5;
  }
  return result;
}

- (double)targetPointSizeForSelectionWithViewScale:(double)a3
{
  [(TSWPEditingController *)self p_effectiveFontSizeForCurrentSelection];
  return v4 * a3;
}

- (void)p_highlightRubyTextWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(TSWPEditingController *)self editingReps];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setSecondaryHighlightRange:color:pathStyle:", location, length, objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.200000003), "CGColor"), 1);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)p_clearSecondaryHighlight
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(TSWPEditingController *)self editingReps];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) clearSecondaryHighlight];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)p_wordRangesForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = (void *)[MEMORY[0x263EFF980] array];
  CFStringRef v7 = [(TSWPStorage *)self->_storage string];
  CFLocaleRef v8 = (const __CFLocale *)[MEMORY[0x263EFF960] currentLocale];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__TSWPEditingController_p_wordRangesForRange___block_invoke;
  v10[3] = &unk_2646B2A58;
  v10[4] = v6;
  v11.NSUInteger location = location;
  v11.NSUInteger length = length;
  TSWPEnumerateWordsInStringWithBlock(v7, v11, v8, (uint64_t)v10);
  return v6;
}

uint64_t __46__TSWPEditingController_p_wordRangesForRange___block_invoke(uint64_t a1, CFStringTokenizerRef tokenizer)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x263F08D40];
  CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(tokenizer);
  uint64_t v5 = objc_msgSend(v3, "valueWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);

  return [v2 addObject:v5];
}

- (id)p_viewControllerForPresenting
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  id v2 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return (id)[v2 viewControllerForPresenting];
}

- (CGRect)p_adjustedPopoverTargetRectForRange:(_NSRange)a3
{
  [(TSWPEditingController *)self p_targetRectForSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3.location, a3.length)];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = (void *)[(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] layerHost] canvasView];
  long long v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "window"), "rootViewController"), "view");
  objc_msgSend(v12, "convertRect:toView:", v13, v5, v7, v9, v11);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [v13 bounds];
  double v23 = v22;
  v31.origin.double x = v15;
  v31.origin.double y = v17;
  v31.size.double width = v19;
  v31.size.double height = v21;
  double v24 = v23 - CGRectGetMaxX(v31);
  if (v15 >= v24)
  {
    if (v15 >= 350.0) {
      goto LABEL_7;
    }
    double v25 = 350.0 - v15;
    double v15 = v15 + 350.0 - v15;
  }
  else
  {
    if (v24 >= 350.0) {
      goto LABEL_7;
    }
    double v25 = 350.0 - v24;
  }
  double v19 = v19 - v25;
LABEL_7:

  objc_msgSend(v12, "convertRect:fromView:", v13, v15, v17, v19, v21);
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (id)p_documentViewController
{
  id v2 = objc_msgSend(-[TSWPEditingController documentRoot](self, "documentRoot"), "viewController");
  if (!v2)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPEditingController p_documentViewController]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 2146, @"invalid nil value for '%s'", "dvc");
  }
  return v2;
}

- (BOOL)isUnscaledPointInTextSelection:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(TSWPEditingController *)self selection];
  objc_opt_class();
  -[TSDInteractiveCanvasController hitRep:](self->_interactiveCanvasController, "hitRep:", x, y);
  double v7 = (void *)TSUDynamicCast();
  int v8 = [v7 canEditWithEditor:self];
  if (![(TSWPSelection *)v6 isValid] || !v8) {
    return 0;
  }
  objc_msgSend(v7, "convertNaturalPointFromUnscaledCanvas:", x, y);

  return objc_msgSend(v7, "isPointInSelectedArea:");
}

- (BOOL)p_respondsToListGestures
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  id v2 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }

  return [v2 editorAllowsListInteraction];
}

- (BOOL)p_respondsToHyperlinkGestures
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  id v2 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }

  return [v2 editorAllowsHyperlinkInteraction];
}

- (BOOL)p_respondsToRubyGestures
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  id v2 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }

  return [v2 editorAllowsRubyInteraction];
}

- (id)p_repForSwipeAtUnscaledLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v37 = *MEMORY[0x263EF8340];
  double v6 = [(TSWPEditingController *)self interactiveCanvasController];
  double v7 = [(TSWPEditingController *)self selection];
  -[TSDInteractiveCanvasController convertBoundsToUnscaledSize:](v6, "convertBoundsToUnscaledSize:", 50.0, 50.0);
  double v9 = v8;
  double v11 = v10;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = -[TSDInteractiveCanvasController hitRepsAtPoint:withSlop:](v6, "hitRepsAtPoint:withSlop:", x, y, v8, v10, 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v13) {
    return 0;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v33;
  double v16 = -v9;
  double v17 = -v11;
LABEL_3:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(void *)v33 != v15) {
      objc_enumerationMutation(v12);
    }
    double v19 = *(void **)(*((void *)&v32 + 1) + 8 * v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v20 = [(TSWPEditingController *)self storage];
      if (v20 == (TSWPStorage *)[v19 storage])
      {
        if ([(TSWPSelection *)v7 isInsertionPoint]) {
          [v19 caretRect];
        }
        else {
          [v19 rectForSelection:v7];
        }
        CGRect v39 = CGRectInset(*(CGRect *)&v21, v16, v17);
        CGFloat v25 = v39.origin.x;
        CGFloat v26 = v39.origin.y;
        CGFloat width = v39.size.width;
        CGFloat height = v39.size.height;
        objc_msgSend(v19, "convertNaturalPointFromUnscaledCanvas:", x, y);
        v38.double x = v29;
        v38.double y = v30;
        v40.origin.double x = v25;
        v40.origin.double y = v26;
        v40.size.CGFloat width = width;
        v40.size.CGFloat height = height;
        if (CGRectContainsPoint(v40, v38)) {
          return v19;
        }
      }
    }
    if (v14 == ++v18)
    {
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v14) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)canHandleSwipeGestureForGestureRecognizer:(id)a3 outDelta:(int64_t *)a4 outTextDirection:(int64_t *)a5 outLayoutDirection:(int64_t *)a6
{
  int v11 = [a3 direction];
  BOOL v12 = [(TSWPEditingController *)self textIsVerticalAtCharIndex:0];
  if (v12)
  {
    if (a5)
    {
      int64_t v13 = 3;
      if (v11 != 4) {
        int64_t v13 = 0;
      }
      if (v11 == 8) {
        int64_t v13 = 2;
      }
      *a5 = v13;
    }
    if (a6) {
      *a6 = v11 == 4;
    }
    BOOL v14 = v11 == 4;
    if (v11 == 8) {
      goto LABEL_22;
    }
  }
  else
  {
    if (a5)
    {
      int64_t v15 = 3;
      if (v11 != 2) {
        int64_t v15 = 0;
      }
      if (v11 == 1) {
        int64_t v15 = 2;
      }
      *a5 = v15;
    }
    if (a6) {
      *a6 = v11 == 2;
    }
    BOOL v14 = v11 == 2;
    if (v11 == 1) {
      goto LABEL_22;
    }
  }
  if (!v14) {
    return 0;
  }
LABEL_22:
  if ((__CFString *)[a3 gestureKind] == @"TSWPOneFingerSwipe"
    && (v12 | ![(TSWPEditingController *)self swipeableParagraphIsSelected]) != 1
    || [(TSWPEditingController *)self isInParagraphMode])
  {
    return 0;
  }
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

- (BOOL)swipeableParagraphIsSelected
{
  BOOL v3 = [(TSWPSelection *)self->_selection isValid];
  if (v3)
  {
    BOOL v3 = [(TSWPEditingController *)self p_respondsToListGestures];
    if (v3)
    {
      uint64_t v4 = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:[(TSWPSelection *)self->_selection range]];
      unint64_t v6 = v5;
      BOOL v7 = [(TSWPStorage *)self->_storage paragraphHasListLabelAtCharIndex:[(TSWPSelection *)self->_selection range]];
      if ([(TSWPSelection *)self->_selection isInsertionPoint] && v6 <= 1 && v7
        || [(TSWPSelection *)self->_selection type] == 2
        || [(TSWPSelection *)self->_selection range] == v4
        && (([(TSWPSelection *)self->_selection range], v8 == v6) ? (BOOL v9 = v7) : (BOOL v9 = 0), v9))
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        LOBYTE(v3) = [(TSWPEditingController *)self isInParagraphMode];
      }
    }
  }
  return v3;
}

- (BOOL)canHandleGesture:(id)a3
{
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  objc_msgSend(a3, "unscaledLocationForICC:", -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"));
  double v7 = v6;
  double v9 = v8;
  objc_opt_class();
  -[TSDInteractiveCanvasController hitRep:]([(TSWPEditingController *)self interactiveCanvasController], "hitRep:", v7, v9);
  double v10 = (void *)TSUDynamicCast();
  int v11 = [v10 canEditWithEditor:self];
  uint64_t v21 = 0;
  id v12 = -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](self->_interactiveCanvasController, "hitKnobAtPoint:returningRep:", &v21, v7, v9);
  objc_opt_class();
  int64_t v13 = (void *)TSUDynamicCast();
  BOOL v14 = [v12 tag] == 11 || objc_msgSend(v12, "tag") == 10;
  int v15 = 0;
  if (v12 && v13) {
    int v15 = (TSWPStorage *)[v13 storage] == self->_storage && v14;
  }
  if (v13) {
    v11 &= v14;
  }
  double v16 = (__CFString *)[a3 gestureKind];
  double v17 = v16;
  if ((v16 == @"TSWPOneFingerSwipe" || v16 == @"TSWPTwoFingerSwipe" || v16 == @"TSWPThreeFingerSwipe")
    && [(TSWPSelection *)self->_selection isValid])
  {
    int v15 = [(TSWPEditingController *)self canHandleSwipeGestureForGestureRecognizer:v5 outDelta:0 outTextDirection:0 outLayoutDirection:0];
    goto LABEL_28;
  }
  if (v17 == @"TSWPLongPress" && !v12)
  {
LABEL_18:
    int v15 = v11;
    goto LABEL_28;
  }
  if (v17 != @"TSWPImmediatePress" || self->_ignoreFutureImmediatePresses)
  {
    if (v17 != @"TSWPImmediateSingleTap"
      && v17 != @"TSWPTwoFingerTap"
      && v17 != @"TSWPSecondarySingleTap"
      && v17 != @"TSWPImmediateDoubleTap"
      && v17 != @"TSWPTapAndTouch"
      && v17 != @"TSWPDoubleTapAndTouch")
    {
      int v15 = 2 * (v17 != @"TSWPUndefinedGestureKind");
      goto LABEL_28;
    }
    goto LABEL_18;
  }
LABEL_28:
  if (v10 && v15)
  {
    objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:", v7, v9);
    uint64_t v18 = objc_msgSend(v10, "footnoteReferenceAttachmentAtPoint:");
    if (v17 == @"TSWPTapAndTouch" && v18 != 0) {
      int v15 = 0;
    }
  }
  return v15 == 1;
}

- (void)p_handleSwipeMoveCaretWithTextGranularity:(int64_t)a3 textDirection:(int64_t)a4 layoutDirection:(int64_t)a5
{
  if (![(TSWPSelection *)self->_selection isValid]) {
    return;
  }
  unint64_t v9 = [(TSWPEditingController *)self insertionPoint];
  if ([(TSWPSelection *)self->_selection isRange])
  {
    if (a5)
    {
      if (!a3) {
        ++v9;
      }
    }
    else
    {
      uint64_t v10 = [(TSWPSelection *)self->_selection range];
      unint64_t v9 = ((__PAIR128__(v11, a3) - 1) >> 64) + v10;
    }
  }
  BOOL v12 = [(TSWPSelection *)self->_selection caretAffinity] == 1;
  LODWORD(v13) = 2143289344;
  unint64_t v14 = [(TSWPEditingController *)self charIndexByMovingPosition:+[TSDTextPosition textPositionWithCharIndex:v9 eolAffinity:v12 preferredPosition:0 isPreferredStart:v13] toBoundary:a3 inDirection:a4 preferPosition:0];
  if (a3 == 1)
  {
    uint64_t v15 = [(TSWPEditingController *)self rangeOfWordEnclosingCharIndex:v9 backward:a5 == 0];
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4 == 3)
      {
        if (v9 != v15) {
          goto LABEL_16;
        }
      }
      else if (a4 != 2 || v9 != v15 + v16)
      {
        goto LABEL_16;
      }
      BOOL v17 = [(TSWPSelection *)self->_selection caretAffinity] == 1;
      LODWORD(v18) = 2143289344;
      unint64_t v14 = [(TSWPEditingController *)self charIndexByMovingPosition:+[TSDTextPosition textPositionWithCharIndex:v14 eolAffinity:v17 preferredPosition:0 isPreferredStart:v18] toBoundary:1 inDirection:a4 preferPosition:0];
    }
  }
LABEL_16:
  uint64_t v19 = [(TSWPStorage *)self->_storage range];
  if (v14 <= v19 + v20 && v14 >= [(TSWPStorage *)self->_storage range]
    || (uint64_t v21 = [(TSWPStorage *)self->_storage range], v9 <= v21 + v22)
    && (unint64_t v14 = v9, v9 >= [(TSWPStorage *)self->_storage range]))
  {
    if (v14 != [(TSWPSelection *)self->_selection range] || v26)
    {
      double v27 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, v14, 0, 0, a4 == 2);
      [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setSelection:v27 onModel:self->_storage withFlags:80];
    }
  }
  else
  {
    double v23 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v24 = [NSString stringWithUTF8String:"-[TSWPEditingController p_handleSwipeMoveCaretWithTextGranularity:textDirection:layoutDirection:]"];
    uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"];
    [v23 handleFailureInFunction:v24 file:v25 lineNumber:2939 description:@"Swipe gesture tried to set invalid insertion point"];
  }
}

- (void)p_handleLongPressGesture:(id)a3
{
  objc_msgSend(a3, "locationInView:", objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "asiOSCVC"), "view"));
  double v6 = v5;
  double v8 = v7;
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:");
  double v10 = v9;
  double v12 = v11;
  CGFloat v30 = 0;
  id v13 = -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](self->_interactiveCanvasController, "hitKnobAtPoint:returningRep:", &v30);
  uint64_t v14 = [a3 state];
  if ((unint64_t)(v14 - 3) < 2)
  {
    objc_opt_class();
    [a3 targetRep];
    BOOL v17 = (void *)TSUDynamicCast();
    if (v17) {
      [v17 setShouldHideSelectionControls:0];
    }
    double v18 = objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "target");
    if (v18) {
      [v18 setShouldHideSelectionControls:0];
    }
    knobTracker = self->_knobTracker;
    if (knobTracker)
    {
      if (![(TSWPTextKnobTracker *)knobTracker didShowMagnifier]
        && ![(TSWPEditingController *)self isInParagraphMode])
      {
        [(TSWPEditingController *)self tappedOnKnob:v13];
      }
      [(TSWPEditingController *)self p_handleKnobDragGestureRecognizer:a3];

      self->_knobTracker = 0;
    }
    else
    {
      [(TSWPEditingController *)self p_endAutoscroll];
      [(TSWPEditingController *)self revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold];
      [(TSWPEditingController *)self protectedStopMagnification];
      if ([a3 state] == 3)
      {
        self->_shouldShowEditMenuForInsertionPoint = 1;
        objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "asiOSCVC"), "becomeFirstResponder");
      }
    }
  }
  else if (v14 == 2)
  {
    if (self->_knobTracker)
    {
LABEL_25:
      [(TSWPEditingController *)self p_handleKnobDragGestureRecognizer:a3];
      return;
    }
    if ([(TSWPSelection *)self->_selection type] != 2)
    {
      if (objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "canvasView"), "enclosingScrollView"), "isScrollEnabled"))+[TSDAutoscroll startAutoscroll:unscaledPoint:](TSDAutoscroll, "startAutoscroll:unscaledPoint:", self, v10, v12); {
      -[TSWPEditingController p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", self->_initialPressTextSelectionGranularity, 0, v10, v12);
      }
    }
  }
  else
  {
    if (v14 != 1) {
      return;
    }
    [(TSWPEditingController *)self p_clearEditMenuFlags];
    objc_opt_class();
    [a3 targetRep];
    uint64_t v15 = (void *)TSUDynamicCast();
    if (v15)
    {
      uint64_t v16 = v15;
      [v15 setShouldHideSelectionControls:1];
    }
    else
    {
      objc_opt_class();
      -[TSDInteractiveCanvasController hitRep:](self->_interactiveCanvasController, "hitRep:", v10, v12);
      uint64_t v16 = (void *)TSUDynamicCast();
    }
    objc_msgSend(v16, "convertNaturalPointFromUnscaledCanvas:", v10, v12);
    if (v13)
    {
      uint64_t v20 = v30;
      [v13 position];
      objc_msgSend(v20, "convertNaturalPointToUnscaledCanvas:");
      double v22 = v21;
      double v24 = v23;
      uint64_t v25 = [(TSWPEditingController *)self icc];
      objc_msgSend(a3, "locationInView:", objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](-[TSWPEditingController icc](self, "icc"), "layerHost"), "asiOSCVC"), "view"));
      -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v25, "convertBoundsToUnscaledPoint:");
      self->_knobToTouchOffset.double x = TSDSubtractPoints(v22, v24, v26);
      self->_knobToTouchOffset.double y = v27;
      objc_opt_class();
      [(TSWPEditingController *)self p_createKnobTracker:v13 forRep:TSUDynamicCast() tapCount:1];
      [(TSWPEditingController *)self p_beginOperationAndTakeControl];
      goto LABEL_25;
    }
    -[TSWPEditingController tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v16, 2, 1, 0);
    self->_initialPressTextSelectionGranularitdouble y = 1;
    double v28 = [(TSWPEditingController *)self selection];
    int v29 = [(TSWPSelection *)v28 type];
    if (![(TSWPEditingController *)self pIsSelectionPlaceHolderTextWithSelection:v28]&& v29 != 2)
    {
      -[TSWPEditingController p_beginMagnification:forRep:atPoint:](self, "p_beginMagnification:forRep:atPoint:", v28, v16, v6, v8);
    }
  }
}

- (CGPoint)p_clampPointToLine:(CGPoint)a3 trackingRep:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  objc_msgSend(a4, "convertNaturalPointFromUnscaledCanvas:");
  objc_msgSend(a4, "pinToNaturalBounds:andLastLineFragment:", 1);
  if (a4)
  {
    objc_msgSend(a4, "lineMetricsAtPoint:");
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v10 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  if (!CGRectIsEmpty(*(CGRect *)&v7))
  {
    objc_msgSend(a4, "convertNaturalRectToUnscaledCanvas:", (unsigned __int128)0, (unsigned __int128)0);
    CGFloat y = CGRectGetMidY(v14);
  }
  double v11 = x;
  double v12 = y;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (void)p_handleTapAndTouchGesture:(id)a3
{
  v41[2] = *MEMORY[0x263EF8340];
  self->_ignoreFutureImmediatePresses = 1;
  objc_msgSend(a3, "unscaledLocationForICC:", -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"));
  double v6 = v5;
  double v8 = v7;
  objc_opt_class();
  [a3 targetRep];
  uint64_t v9 = (void *)TSUDynamicCast();
  if (!v9)
  {
    objc_opt_class();
    -[TSDInteractiveCanvasController hitRep:](self->_interactiveCanvasController, "hitRep:", v6, v8);
    uint64_t v9 = (void *)TSUDynamicCast();
  }
  uint64_t v10 = v9;
  objc_msgSend(v9, "convertNaturalPointFromUnscaledCanvas:", v6, v8);
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [a3 numberOfTapsRequired];
  if (!v10
    || (uint64_t v16 = v15, [(TSWPSelection *)self->_selection type] == 3)
    || [(TSWPSelection *)self->_selection type] == 5)
  {
    [(TSWPEditingController *)self p_endAutoscroll];
    [(TSWPEditingController *)self p_cancelTapAndLongPressPreviousSelector];
    if ([a3 gestureState] == 3 || objc_msgSend(a3, "gestureState") == 4)
    {
      if (self->_knobTracker)
      {
        objc_opt_class();
        uint64_t v17 = TSUDynamicCast();
        if (!v17)
        {
          double v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v19 = [NSString stringWithUTF8String:"-[TSWPEditingController p_handleTapAndTouchGesture:]"];
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3427, @"invalid nil value for '%s'", "gr");
        }
        [(TSWPEditingController *)self p_handleKnobDragGestureRecognizer:v17];

        self->_knobTracker = 0;
      }
      else if (self->_magnifying)
      {
        [(TSWPEditingController *)self protectedStopMagnification];
      }
    }
    else if (self->_magnifying)
    {
      if (objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "canvasView"), "enclosingScrollView"), "isScrollEnabled"))+[TSDAutoscroll startAutoscroll:unscaledPoint:](TSDAutoscroll, "startAutoscroll:unscaledPoint:", self, v6, v8); {
      initialPressTextSelectionGranularitCGFloat y = self->_initialPressTextSelectionGranularity;
      }
      -[TSWPEditingController p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", initialPressTextSelectionGranularity, 0, v6, v8);
    }
    return;
  }
  uint64_t v21 = v16 + 1;
  if ([a3 gestureState] == 1)
  {
    [(TSWPEditingController *)self p_clearEditMenuFlags];
    if (!-[TSWPInteractiveCanvasController suppressDoubleTapForSelection](self->_interactiveCanvasController, "suppressDoubleTapForSelection"))-[TSWPEditingController tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v10, v21, 1, 0, v12, v14); {
    [(TSWPEditingController *)self p_cancelTapAndLongPressPreviousSelector];
    }
    v40[0] = @"TSWPEditingControllerTextRepKey";
    v40[1] = @"TSWPEditingControllerRepPointKey";
    v41[0] = v10;
    v41[1] = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v12, v14);
    double v22 = (NSDictionary *)(id)[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
    self->_tapInfo = v22;
    self->_tapAndLongPressIsPossible = 1;
    [(TSWPEditingController *)self performSelector:sel_p_beginTapAndLongPress_ withObject:v22 afterDelay:0.2];
    return;
  }
  if ([a3 gestureState] == 2)
  {
    if ([(TSWPSelection *)self->_selection type] == 2) {
      return;
    }
    objc_msgSend(-[NSDictionary objectForKey:](self->_tapInfo, "objectForKey:", @"TSWPEditingControllerRepPointKey"), "CGPointValue");
    double v24 = v23;
    double v26 = v25;
    if ([(TSWPInteractiveCanvasController *)self->_interactiveCanvasController suppressDoubleTapForSelection])
    {
      BOOL v27 = TSDDistance(v24, v26, v12, v14) <= 5.0;
    }
    else
    {
      BOOL v27 = 0;
    }
    if (self->_tapAndLongPressIsPossible && !v27)
    {
      [(TSWPEditingController *)self p_cancelTapAndLongPressPreviousSelector];
      v38[0] = @"TSWPEditingControllerTextRepKey";
      v38[1] = @"TSWPEditingControllerRepPointKey";
      v39[0] = v10;
      v39[1] = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v12, v14);
      long long v32 = (NSDictionary *)(id)[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
      self->_tapInfo = v32;
      self->_tapAndLongPressIsPossible = 1;
      [(TSWPEditingController *)self p_beginTapAndLongPress:v32];
    }
    if (self->_magnifying) {
      goto LABEL_52;
    }
    if (!self->_knobTracker)
    {
      double v36 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v37 = [NSString stringWithUTF8String:"-[TSWPEditingController p_handleTapAndTouchGesture:]"];
      [v36 handleFailureInFunction:v37, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3341, @"after beginTapAndLongPress, we must be either tracking the knobs, or magnifying" file lineNumber description];
      if (self->_magnifying)
      {
LABEL_52:
        if (objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "canvasView"), "enclosingScrollView"), "isScrollEnabled"))+[TSDAutoscroll startAutoscroll:unscaledPoint:](TSDAutoscroll, "startAutoscroll:unscaledPoint:", self, v6, v8); {
        -[TSWPEditingController p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", self->_initialPressTextSelectionGranularity, 0, v6, v8);
        }
        return;
      }
      if (!self->_knobTracker) {
        return;
      }
    }
    objc_opt_class();
    uint64_t v33 = TSUDynamicCast();
    if (!v33)
    {
      long long v34 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"-[TSWPEditingController p_handleTapAndTouchGesture:]"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3354, @"invalid nil value for '%s'", "gr");
    }
    [(TSWPEditingController *)self p_handleKnobDragGestureRecognizer:v33];
  }
  else
  {
    [(TSWPEditingController *)self p_endAutoscroll];
    if (self->_tapAndLongPressIsPossible && v21 == 2) {
      -[TSWPInteractiveCanvasController zoomColumnAtPoint:](self->_interactiveCanvasController, "zoomColumnAtPoint:", v6, v8);
    }
    [(TSWPEditingController *)self p_cancelTapAndLongPressPreviousSelector];
    if (self->_knobTracker)
    {
      objc_opt_class();
      uint64_t v28 = TSUDynamicCast();
      if (!v28)
      {
        int v29 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v30 = [NSString stringWithUTF8String:"-[TSWPEditingController p_handleTapAndTouchGesture:]"];
        objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3395, @"invalid nil value for '%s'", "gr");
      }
      [(TSWPEditingController *)self p_handleKnobDragGestureRecognizer:v28];

      self->_knobTracker = 0;
    }
    else
    {
      [(TSWPEditingController *)self protectedStopMagnification];
    }
    if ([a3 gestureState] != 5
      && [(TSWPSelection *)[(TSWPEditingController *)self selection] isValid])
    {
      if (v21 == 2) {
        uint64_t v31 = 3;
      }
      else {
        uint64_t v31 = 1;
      }
      [(TSWPEditingController *)self selectionChangedWithFlags:0 wpFlags:v31];
    }
  }
}

- (void)p_beginTapAndLongPress:(id)a3
{
  if (!self->_tapAndLongPressIsPossible)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPEditingController p_beginTapAndLongPress:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3463, @"_tapAndLongPressIsPossible should be YES");
  }
  self->_tapAndLongPressIsPossible = 0;
  if ([(TSWPSelection *)self->_selection type] != 2)
  {
    uint64_t v7 = [a3 objectForKeyedSubscript:@"TSWPEditingControllerTextRepKey"];
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"TSWPEditingControllerRepPointKey"), "CGPointValue");
    double v9 = v8;
    double v11 = v10;
    if ([(TSWPInteractiveCanvasController *)self->_interactiveCanvasController suppressDoubleTapForSelection])
    {
      -[TSWPEditingController tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v7, 2, 1, 0, v9, v11);
    }
    double v12 = [(TSWPEditingController *)self selection];
    double v13 = v12;
    if (!self->_knobTracker && [(TSWPSelection *)v12 isValid] && [(TSWPSelection *)v13 isRange]) {
      -[TSWPEditingController p_beginKnobTrackingSelection:forRep:atPoint:](self, "p_beginKnobTrackingSelection:forRep:atPoint:", v13, v7, v9, v11);
    }
    else {
      -[TSWPEditingController p_beginMagnification:forRep:atPoint:](self, "p_beginMagnification:forRep:atPoint:", v13, v7, v9, v11);
    }
  }

  self->_tapInfo = 0;
}

- (void)p_cancelTapAndLongPressPreviousSelector
{
  if (self->_tapAndLongPressIsPossible)
  {
    self->_tapAndLongPressIsPossible = 0;
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_p_beginTapAndLongPress_ object:self->_tapInfo];
  }

  self->_tapInfo = 0;
}

- (void)p_dismissDefinitionPopover
{
  if ((TSUSupportsTextInteraction() & 1) == 0)
  {
    if ([(UIPopoverController *)self->_definitionPopoverController isPopoverVisible]) {
      [(UIPopoverController *)self->_definitionPopoverController dismissPopoverAnimated:1];
    }
    [(TSWPReferenceLibraryViewController *)self->_definitionViewController setDelegate:0];

    self->_definitionViewController = 0;
    self->_definitionPopoverController = 0;
  }
}

- (void)p_beginKnobTrackingSelection:(id)a3 forRep:(id)a4 atPoint:(CGPoint)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v8 = -[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:](self, "charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:", a4, 0, 0, 0, a5.x, a5.y);
  uint64_t v9 = [a3 range];
  [a3 range];
  if (v8 >= v9 + (v10 >> 1)) {
    uint64_t v11 = 10;
  }
  else {
    uint64_t v11 = 11;
  }
  uint64_t v12 = [a4 knobForTag:v11];
  if (v12)
  {
LABEL_15:
    [(TSWPEditingController *)self p_createKnobTracker:v12 forRep:a4 tapCount:2];
    [(TSWPEditingController *)self p_beginOperationAndTakeControl];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v13 = objc_msgSend(a4, "siblings", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(*((void *)&v19 + 1) + 8 * i) knobForTag:v11];
          if (v18)
          {
            uint64_t v12 = v18;
            goto LABEL_15;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
  }
}

- (void)p_createKnobTracker:(id)a3 forRep:(id)a4 tapCount:(unint64_t)a5
{
  if (!self->_knobTracker
    || (uint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPEditingController p_createKnobTracker:forRep:tapCount:]"], objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3548, @"expected nil value for '%s'", "_knobTracker"), !self->_knobTracker))
  {
    [(TSWPEditingController *)self setKnobTrackingTapCount:a5];
    id v11 = (id)[a4 newTrackerForKnob:a3];
    self->_knobTracker = (TSWPTextKnobTracker *)v11;
  }
}

- (void)p_handleTapGestures:(id)a3
{
  double v5 = (__CFString *)[a3 gestureKind];
  objc_msgSend(a3, "unscaledLocationForICC:", -[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"));
  double v7 = v6;
  double v9 = v8;
  objc_opt_class();
  [a3 targetRep];
  uint64_t v10 = (void *)TSUDynamicCast();
  if (!v10)
  {
    objc_opt_class();
    -[TSDInteractiveCanvasController hitRep:]([(TSWPEditingController *)self interactiveCanvasController], "hitRep:", v7, v9);
    uint64_t v10 = (void *)TSUDynamicCast();
  }
  id v11 = v10;
  objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:", v7, v9);
  double v13 = v12;
  double v15 = v14;
  if (v5 == @"TSWPImmediateSingleTap")
  {
    if (!v11)
    {
      uint64_t v24 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v25 = [NSString stringWithUTF8String:"-[TSWPEditingController p_handleTapGestures:]"];
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3588, @"we should have gotten a valid textRep by now");
    }
    double v26 = (NSUInteger *)MEMORY[0x263F7C7C8];
    self->_originalSelectionRange = (_NSRange)*MEMORY[0x263F7C7C8];
    [(TSWPEditingController *)self p_clearEditMenuFlags];
    if (!self->_editMenuIsVisible)
    {
      BOOL v27 = [(TSWPEditingController *)self selection];
      if ([(TSWPSelection *)v27 isValid])
      {
        NSUInteger v28 = [(TSWPSelection *)v27 range];
      }
      else
      {
        NSUInteger v28 = *v26;
        NSUInteger v29 = v26[1];
      }
      self->_originalSelectionRange.NSUInteger location = v28;
      self->_originalSelectionRange.NSUInteger length = v29;
    }
    -[TSWPEditingController tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v11, 1, 0, 0, v13, v15);
    char v22 = 0;
    uint64_t v23 = 148;
    goto LABEL_26;
  }
  if (v5 != @"TSWPSecondarySingleTap"
    && (v5 == @"TSWPImmediateDoubleTap" || v5 == @"TSWPTwoFingerTap"))
  {
    uint64_t v17 = v5 == @"TSWPImmediateDoubleTap" ? 2 : 4 * (v5 == @"TSWPTwoFingerTap");
    if (!v11)
    {
      uint64_t v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v19 = [NSString stringWithUTF8String:"-[TSWPEditingController p_handleTapGestures:]"];
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3763, @"we should have gotten a valid textRep by now");
    }
    -[TSWPEditingController tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v11, v17, 0, 0, v13, v15);
    long long v20 = [(TSWPEditingController *)self selection];
    if (v20)
    {
      [(TSWPSelection *)v20 range];
      if (!v21)
      {
        char v22 = 1;
        uint64_t v23 = 232;
LABEL_26:
        *((unsigned char *)&self->super.isa + v23) = v22;
      }
    }
  }
}

- (BOOL)handleGesture:(id)a3
{
  double v5 = (__CFString *)[a3 gestureKind];
  self->_mostRecentGestureKind = (NSString *)v5;
  objc_opt_class();
  [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] layerHost];
  [(id)TSUDynamicCast() cancelDelayedTapAction];
  BOOL v7 = v5 == @"TSWPOneFingerSwipe" || v5 == @"TSWPTwoFingerSwipe" || v5 == @"TSWPThreeFingerSwipe";
  if (v7 && [(TSWPSelection *)self->_selection isValid])
  {
    uint64_t v20 = 2;
    uint64_t v21 = 0;
    uint64_t v19 = 0;
    objc_opt_class();
    uint64_t v8 = TSUDynamicCast();
    if (v8
      && [(TSWPEditingController *)self canHandleSwipeGestureForGestureRecognizer:v8 outDelta:&v21 outTextDirection:&v20 outLayoutDirection:&v19])
    {
      if (!v21)
      {
        if (v5 == @"TSWPOneFingerSwipe")
        {
          uint64_t v10 = v19;
          uint64_t v9 = v20;
          id v11 = self;
          uint64_t v12 = 0;
        }
        else
        {
          if (v5 == @"TSWPTwoFingerSwipe")
          {
            BOOL v17 = 1;
            [(TSWPEditingController *)self p_handleSwipeMoveCaretWithTextGranularity:1 textDirection:v20 layoutDirection:v19];
            return v17;
          }
          if (v5 != @"TSWPThreeFingerSwipe") {
            return 1;
          }
          uint64_t v10 = v19;
          uint64_t v9 = v20;
          id v11 = self;
          uint64_t v12 = 4;
        }
        [(TSWPEditingController *)v11 p_handleSwipeMoveCaretWithTextGranularity:v12 textDirection:v9 layoutDirection:v10];
      }
      return 1;
    }
  }
  else
  {
    if (v5 == @"TSWPLongPress" || v5 == @"TSWPImmediatePress")
    {
      [(TSWPEditingController *)self p_handleLongPressGesture:a3];
      return 1;
    }
    if (v5 == @"TSWPTapAndTouch" || v5 == @"TSWPDoubleTapAndTouch")
    {
      [(TSWPEditingController *)self p_handleTapAndTouchGesture:TSUProtocolCast()];
      return 1;
    }
    if (v5 == @"TSWPImmediateSingleTap"
      || v5 == @"TSWPTwoFingerTap"
      || v5 == @"TSWPSecondarySingleTap"
      || v5 == @"TSWPImmediateDoubleTap")
    {
      [(TSWPEditingController *)self p_handleTapGestures:a3];
      return 1;
    }
    double v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPEditingController handleGesture:]"];
    [v15 handleFailureInFunction:v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 3869, @"TSWPEditingController can't handle a gesture of kind %@", v5 file lineNumber description];
  }
  return 0;
}

- (void)gestureSequenceWillBegin
{
  self->_originalSelectionRange = (_NSRange)*MEMORY[0x263F7C7C8];
  *(_WORD *)&self->_gestureBeganWhenEditingBegan = objc_msgSend(+[TSWPEditMenuController sharedEditMenuController](TSWPEditMenuController, "sharedEditMenuController"), "isBeginningEditing");
}

- (void)gestureSequenceDidEnd
{
  self->_ignoreFutureImmediatePresses = 0;
  objc_opt_class();
  [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] layerHost];
  BOOL v3 = (void *)TSUDynamicCast();
  if ([v3 hasDelayedTapAction])
  {
    [v3 finishDelayedTapAction];
    goto LABEL_21;
  }
  uint64_t v4 = [(TSWPEditingController *)self selection];
  if (!v4) {
    goto LABEL_21;
  }
  mostRecentGestureKind = (__CFString *)self->_mostRecentGestureKind;
  if (mostRecentGestureKind != @"TSWPImmediateSingleTap")
  {
    if (mostRecentGestureKind != @"TSWPTapAndTouch") {
      goto LABEL_21;
    }
    [(TSWPSelection *)v4 range];
    if (v6) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  uint64_t v7 = [(TSWPSelection *)v4 range];
  NSUInteger location = self->_originalSelectionRange.location;
  NSUInteger length = self->_originalSelectionRange.length;
  if ((location != *MEMORY[0x263F7C7C8] || length != *(void *)(MEMORY[0x263F7C7C8] + 8))
    && v7 == location
    && v8 == length)
  {
LABEL_19:
    if (!self->_gestureBeganWhenEditingBegan) {
      self->_shouldShowEditMenuForInsertionPoint = 1;
    }
  }
LABEL_21:
  self->_gestureBeganWhenEditingBegan = 0;
}

- (void)setAutoscroll:(id)a3
{
  autoscroll = self->_autoscroll;
  if (autoscroll != a3)
  {

    self->_autoscroll = 0;
    self->_autoscroll = (TSDAutoscroll *)a3;
  }
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return self->_readyToEnd;
}

- (id)tracker
{
  return self->_knobTracker;
}

- (BOOL)readyToEndOperation
{
  return self->_readyToEnd;
}

- (void)p_beginOperationAndTakeControl
{
  BOOL v3 = [(TSWPEditingController *)self interactiveCanvasController];
  if ([(TSDDynamicOperationController *)[(TSDInteractiveCanvasController *)v3 dynamicOperationController] isInOperation])
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPEditingController p_beginOperationAndTakeControl]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4332, @"beginning WP operation in DOC when already in an operation");
  }
  [(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)v3 tmCoordinator] registerTrackerManipulator:self];
  if ([(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)v3 tmCoordinator] takeControlWithTrackerManipulator:self])
  {
    uint64_t v6 = [(TSDInteractiveCanvasController *)v3 dynamicOperationController];
    [(TSDDynamicOperationController *)v6 beginOperation];
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPEditingController p_beginOperationAndTakeControl]"];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"];
    [(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)v3 tmCoordinator] controllingTM];
    uint64_t v10 = (objc_class *)objc_opt_class();
    [v7 handleFailureInFunction:v8, v9, 4341, @"could not take control with WP Editing Controller. Controlling TM is %@", NSStringFromClass(v10) file lineNumber description];
  }
}

- (void)p_endAutoscroll
{
  [(TSDAutoscroll *)[(TSWPEditingController *)self autoscroll] invalidate];

  [(TSWPEditingController *)self setAutoscroll:0];
}

- (void)p_handleKnobDragGestureRecognizer:(id)a3
{
  BOOL v5 = [a3 state] == 3 || objc_msgSend(a3, "state") == 4;
  self->_readyToEnd = v5;
  if (!self->_knobTracker)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSWPEditingController p_handleKnobDragGestureRecognizer:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4355, @"invalid nil value for '%s'", "_knobTracker");
  }
  if ([a3 state] == 3 || objc_msgSend(a3, "state") == 1) {
    [(TSWPTextKnobTracker *)self->_knobTracker setIgnoreNextCall:1];
  }
  uint64_t v8 = [(TSWPEditingController *)self icc];
  objc_msgSend(a3, "locationInView:", objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](-[TSWPEditingController icc](self, "icc"), "layerHost"), "asiOSCVC"), "view"));
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v8, "convertBoundsToUnscaledPoint:");
  double v9 = TSDRoundedPoint();
  double v11 = v10;
  [(TSDKnobTracker *)self->_knobTracker setCurrentPosition:TSDAddPoints(v9, v10, self->_knobToTouchOffset.x)];
  if (self->_readyToEnd) {
    [(TSWPEditingController *)self p_endAutoscroll];
  }
  else {
    +[TSDAutoscroll startAutoscroll:unscaledPoint:](TSDAutoscroll, "startAutoscroll:unscaledPoint:", self, v9, v11);
  }
  uint64_t v12 = [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] dynamicOperationController];

  [(TSDDynamicOperationController *)v12 handleTrackerManipulator:self];
}

- (unint64_t)insertionPoint
{
  if (![(TSWPSelection *)self->_selection isValid]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  selection = self->_selection;

  return [(TSWPSelection *)selection start];
}

- (void)setInsertionPoint:(unint64_t)a3
{
}

- (void)setInsertionPoint:(unint64_t)a3 withFlags:(unint64_t)a4
{
  uint64_t v6 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", a3, 0);
  [(TSWPEditingController *)self setSelection:v6 withFlags:a4];
}

- (void)setSelection:(id)a3
{
}

- (void)p_setRevertibleSelection:(id)a3
{
  -[TSKFidgetResolver pushValue:](self->_fidgetResolver, "pushValue:");
  if ([a3 isValid])
  {
    unint64_t v5 = [a3 end];
    if (v5 > [(TSWPStorage *)self->_storage length])
    {
      uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[TSWPEditingController p_setRevertibleSelection:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4421, @"Selection extends past end of storage");
    }
    if ([a3 isInsertionPoint])
    {
      unint64_t v8 = [a3 range];
      if (v8 < [(TSWPStorage *)self->_storage length]
        && (-[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", [a3 range]) & 0xFC00) == 0xDC00)
      {
        double v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPEditingController p_setRevertibleSelection:]"];
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4427, @"Insertion point is before the wrong half of a surrogate pair");
        a3 = (id)objc_msgSend(a3, "copyWithNewRange:", objc_msgSend(a3, "range") + 1, 0);
      }
    }
    else
    {
      unint64_t v11 = [a3 start];
      if (v11 <= [(TSWPStorage *)self->_storage length])
      {
        uint64_t v12 = [a3 start];
        if (v12 != [(TSWPStorage *)self->_storage length]
          && (-[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", [a3 start]) & 0xFC00) == 0xDC00)
        {
          double v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v14 = [NSString stringWithUTF8String:"-[TSWPEditingController p_setRevertibleSelection:]"];
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4436, @"Selection covers half of a surrogate pair");
        }
      }
      unint64_t v15 = [a3 end];
      if (v15 <= [(TSWPStorage *)self->_storage length])
      {
        uint64_t v16 = [a3 end];
        if (v16 != [(TSWPStorage *)self->_storage length]
          && (-[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", [a3 end]) & 0xFC00) == 0xDC00)
        {
          BOOL v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v18 = [NSString stringWithUTF8String:"-[TSWPEditingController p_setRevertibleSelection:]"];
          objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4441, @"Selection covers half of a surrogate pair");
        }
      }
    }
  }
  id v19 = a3;

  self->_selection = (TSWPSelection *)a3;
}

- (void)setSelection:(id)a3 withFlags:(unint64_t)a4
{
}

- (void)p_setSelection:(id)a3 withFlags:(unint64_t)a4 force:(BOOL)a5
{
  v50[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPEditingController p_setSelection:withFlags:force:]"];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"];
      uint64_t v12 = (objc_class *)objc_opt_class();
      double v13 = NSStringFromClass(v12);
      uint64_t v14 = (objc_class *)objc_opt_class();
      [v9 handleFailureInFunction:v10, v11, 4478, @"[TSWPEditingController setSelection:] expected %@, got %@", v13, NSStringFromClass(v14) file lineNumber description];
    }
  }
  objc_opt_class();
  unint64_t v15 = (TSWPSelection *)TSUDynamicCast();
  if ([(TSWPSelection *)v15 isValid])
  {
    unint64_t v16 = [(TSWPSelection *)v15 end];
    if (v16 > [(TSWPStorage *)self->_storage length])
    {
      BOOL v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v18 = [NSString stringWithUTF8String:"-[TSWPEditingController p_setSelection:withFlags:force:]"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4480, @"Bad selection range");
    }
  }
  if (!a3)
  {
    CGFloat v49 = @"TSDEditorControllerEditorKey";
    v50[0] = self;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v49 count:1];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"TSDEditorControllerTextEditorWillClearSelection", 0, v19);
  }
  if (![(TSWPSelection *)v15 isValid])
  {

    self->_dictationInterpretations = 0;
    self->_autocorrectedEntries = 0;
  }
  if (![(TSWPSelection *)v15 isInsertionPoint])
  {
    insertBreakPopoverController = self->_insertBreakPopoverController;
    if (insertBreakPopoverController)
    {
      [(TSDMultiPaneController *)insertBreakPopoverController dismissAnimated:1];
      uint64_t v21 = self->_insertBreakPopoverController;
      self->_insertBreakPopoverController = 0;
    }
  }
  [(TSWPEditingController *)self setCoalescingText:0];
  [(TSWPEditingController *)self p_clearEditMenuFlags];
  char v22 = TSUSupportsTextInteraction();
  if ((a4 & 0x20) == 0 && (v22 & 1) == 0)
  {
    if ([(TSWPEditingController *)self pIsSelectionPlaceHolderTextWithSelection:v15])
    {
      uint64_t v23 = (TSWPSelection *)(id)objc_msgSend(-[TSWPStorage extendSelectionToIncludeSmartFields:](self->_storage, "extendSelectionToIncludeSmartFields:", v15), "copyWithNewType:", 3);
    }
    else
    {
      uint64_t v23 = [(TSWPEditingController *)self p_extendSelectionToIncludeSmartFields:v15];
    }
    unint64_t v15 = v23;
  }
  if ([(TSWPEditingController *)self isParagraphModeWithSelection:v15 onStorage:self->_storage])
  {
    unint64_t v15 = [(TSWPEditingController *)self extendSelectionToParagraphs:v15];
  }
  if (a5 || (selection = self->_selection, selection != v15) && ![(TSWPSelection *)selection isEqual:v15])
  {
    if (![(TSWPSelection *)self->_selection isEquivalentForInsertionStyle:v15])
    {

      self->_insertionStyle = 0;
    }
    self->_selectionAnchor = 0x7FFFFFFFFFFFFFFFLL;
    if ([(TSWPSelection *)v15 isValid])
    {
      switch([(TSWPSelection *)v15 type])
      {
        case 0:
        case 4:
        case 6:
        case 7:
          break;
        case 1:
          if (![(TSWPSelection *)v15 isInsertionPoint])
          {
            uint64_t v34 = [MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v35 = [NSString stringWithUTF8String:"-[TSWPEditingController p_setSelection:withFlags:force:]"];
            uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"];
            NSUInteger v28 = @"label selection isn't an insertion point";
            NSUInteger v29 = (void *)v34;
            uint64_t v30 = v35;
            uint64_t v31 = 4579;
            goto LABEL_40;
          }
          break;
        case 2:
          if (![(TSWPSelection *)v15 isRange])
          {
            double v36 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v37 = [NSString stringWithUTF8String:"-[TSWPEditingController p_setSelection:withFlags:force:]"];
            objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4583, @"topic selection isn't a range");
          }
          uint64_t v38 = [(TSWPSelection *)v15 range];
          uint64_t v40 = v39;
          if (v38 != [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:v38])
          {
            double v41 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v42 = [NSString stringWithUTF8String:"-[TSWPEditingController p_setSelection:withFlags:force:]"];
            objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 4585, @"Topic selection doesn't start at paragraph boundary");
          }
          uint64_t v43 = v38 + v40;
          uint64_t v44 = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:v43 - 1];
          if (v43 != v44 + v45)
          {
            uint64_t v46 = [MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v47 = [NSString stringWithUTF8String:"-[TSWPEditingController p_setSelection:withFlags:force:]"];
            uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"];
            NSUInteger v28 = @"Topic selection doesn't end at paragraph boundary";
            NSUInteger v29 = (void *)v46;
            uint64_t v30 = v47;
            uint64_t v31 = 4586;
            goto LABEL_40;
          }
          break;
        case 3:
        case 5:
          if (![(TSWPSelection *)v15 isRange])
          {
            uint64_t v25 = [MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v26 = [NSString stringWithUTF8String:"-[TSWPEditingController p_setSelection:withFlags:force:]"];
            uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"];
            NSUInteger v28 = @"replace selection isn't a insertion range";
            NSUInteger v29 = (void *)v25;
            uint64_t v30 = v26;
            uint64_t v31 = 4576;
            goto LABEL_40;
          }
          break;
        default:
          uint64_t v32 = [MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v33 = [NSString stringWithUTF8String:"-[TSWPEditingController p_setSelection:withFlags:force:]"];
          uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"];
          NSUInteger v28 = @"illegal selection type";
          NSUInteger v29 = (void *)v32;
          uint64_t v30 = v33;
          uint64_t v31 = 4566;
LABEL_40:
          [v29 handleFailureInFunction:v30 file:v27 lineNumber:v31 description:v28];
          break;
      }
    }
    *(_WORD *)&self->_selectionLastModifiedWithKnob = self->_knobTracking;
    self->_currentSelectionFlags = a4;
    [(TSWPEditingController *)self p_setRevertibleSelection:v15];
    [(TSWPEditingController *)self selectionChangedWithFlags:a4 wpFlags:0];
  }
  CGFloat v48 = self->_selection;
  if (v48
    && [(TSWPSelection *)v48 isValid]
    && (self->_markedRange.location != *MEMORY[0x263F7C7C8]
     || self->_markedRange.length != *(void *)(MEMORY[0x263F7C7C8] + 8)))
  {
    [(TSWPEditingController *)self clearMarkedRange];
  }
  if (![(TSWPSelection *)self->_selection isValid]) {
    [(TSWPEditingController *)self p_clearEditMenuFlags];
  }

  self->_previousSelectedAnnotation = 0;
}

- (void)revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold
{
  id v3 = [(TSKFidgetResolver *)self->_fidgetResolver nonFidgetValue];
  if (v3)
  {
    uint64_t v4 = v3;

    self->_selection = (TSWPSelection *)v4;
    unint64_t currentSelectionFlags = self->_currentSelectionFlags;
    [(TSWPEditingController *)self selectionChangedWithFlags:currentSelectionFlags wpFlags:0];
  }
}

- (void)p_beginMagnification:(id)a3 forRep:(id)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  unint64_t v8 = (void *)TSUProtocolCast();
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:", x, y);
  double v10 = v9;
  double v12 = v11;
  if ((objc_opt_respondsToSelector() & 1) == 0 || [v8 editorAllowsMagnifier])
  {
    initialPressTextSelectionGranularitdouble y = self->_initialPressTextSelectionGranularity;
    -[TSWPEditingController p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", initialPressTextSelectionGranularity, 1, v10, v12);
  }
}

- (void)p_postWillStyleTextNotification
{
  v4[1] = *MEMORY[0x263EF8340];
  id v3 = @"TSDEditorControllerEditorKey";
  v4[0] = self;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"TSDEditorControllerTextEditorWillStyleText", 0, v2);
}

- (void)p_postSelectionContentsChangedNotification
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = @"TSWPEditingControllerEditor";
  v5[0] = self;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"TSWPEditingControllerSelectionContentsChanged", self->_storage, v3);
}

- (void)selectionChangedWithFlags:(unint64_t)a3 wpFlags:(unint64_t)a4
{
  v9[2] = *MEMORY[0x263EF8340];
  if (self->_storage)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3, a4);
    v8[0] = @"TSWPEditingControllerEditor";
    v8[1] = @"TSWPEditingControllerSelectionFlagsKey";
    v9[0] = self;
    v9[1] = [NSNumber numberWithUnsignedInteger:a3];
    objc_msgSend(v6, "postNotificationName:object:userInfo:", @"TSWPEditingControllerSelectionChanged", self->_storage, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
    [(TSWPEditingController *)self p_postSelectionContentsChangedNotification];
  }
  [(TSWPEditingController *)self dismissActivePopovers];
  uint64_t v7 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController editorController];
  if (![(TSWPEditingController *)self trackingKnobInParagraphMode])
  {
    [(TSDEditorController *)v7 editorDidChangeSelection:self withSelectionFlags:a3];
    if ((a3 & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  [(TSDEditorController *)v7 editorDidChangeSelectionAndWantsKeyboard:self withSelectionFlags:a3];
  if ((a3 & 0x10000) != 0) {
LABEL_7:
  }
    [(TSWPEditingController *)self p_clearEditMenuFlags];
LABEL_8:
  self->_suppressEditMenu = (a3 & 0x20000) != 0;
  if (self->_magnifying)
  {
    if (objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "target"))
    {
      objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "canvasNeedsDisplay");
    }
  }
}

- (id)extendSelectionToParagraphs:(id)a3
{
  unint64_t v5 = [(TSWPEditingController *)self storage];
  uint64_t v6 = [a3 range];
  -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:", -[TSWPStorage textRangeForParagraphsInCharRange:](v5, "textRangeForParagraphsInCharRange:", v6, v7));
  uint64_t v8 = NSIntersectionRangeInclusive();
  double v10 = objc_msgSend(a3, "copyWithNewRange:", v8, v9);
  id v11 = v10;

  return [(TSWPEditingController *)self p_extendSelectionToIncludeSmartFields:v10];
}

- (id)p_columnForCharIndex:(unint64_t)a3 withStorage:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] layoutsForModel:a4 withSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3, 1)];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v29;
  uint64_t v9 = &protocolRef_TSDTapGesture;
  uint64_t v23 = *(void *)v29;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v5);
      }
      id v11 = v9;
      double v12 = (void *)TSUProtocolCast();
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      double v13 = (void *)[v12 columns];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
LABEL_8:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
          unint64_t v19 = [v18 range];
          if (a3 >= v19 && a3 - v19 < v20) {
            return v18;
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v15) {
              goto LABEL_8;
            }
            break;
          }
        }
      }
      uint64_t v9 = v11;
      uint64_t v8 = v23;
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    uint64_t v18 = 0;
    if (v7) {
      continue;
    }
    return v18;
  }
}

- (BOOL)isInParagraphMode
{
  return [(TSWPEditingController *)self isParagraphModeWithSelection:self->_selection onStorage:self->_storage];
}

- (BOOL)isParagraphModeWithSelection:(id)a3 onStorage:(id)a4
{
  if (![(TSWPEditingController *)self p_canEditTextString]
    || ([(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate],
        uint64_t v7 = (void *)TSUProtocolCast(),
        [a3 isValid])
    && (objc_opt_respondsToSelector() & 1) != 0
    && ([v7 editorShouldAlwaysBeInParagraphMode] & 1) != 0)
  {
    LOBYTE(v8) = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) == 0 || (int v8 = [v7 editorAllowsParagraphMode]) != 0)
  {
    int v8 = [a3 isRange];
    if (v8)
    {
      uint64_t v9 = [a3 range];
      uint64_t v11 = v10;
      uint64_t v12 = objc_msgSend(a4, "selectedParagraphBreakCount:", v9, v10);
      uint64_t v13 = objc_msgSend(a4, "emptyParagraphCount:", v9, v11);
      uint64_t v14 = v13 != 0;
      objc_msgSend(a4, "paragraphIndexRangeForCharRange:", v9, v11);
      LOBYTE(v8) = 0;
      if (a4)
      {
        if (v15 >= 2 && v12 != v14)
        {
          if ([a3 type] == 3)
          {
            LOBYTE(v8) = 0;
          }
          else
          {
            int v8 = [(TSWPSelection *)self->_selection type];
            BOOL v16 = v8 == 5;
            LOBYTE(v8) = v8 != 5;
            if (!v16 && v12 - v14 == 1)
            {
              uint64_t v17 = v11 + v9 - 1;
              id v18 = [(TSWPEditingController *)self p_columnForCharIndex:v9 withStorage:a4];
              id v19 = [(TSWPEditingController *)self p_columnForCharIndex:v17 withStorage:a4];
              uint64_t v20 = [v18 lineIndexForCharIndex:v9 eol:0];
              unint64_t v21 = [v19 lineIndexForCharIndex:v17 eol:0] - v20;
              if (!v13) {
                ++v21;
              }
              LOBYTE(v8) = v18 != v19 || v21 > 2;
            }
          }
        }
      }
    }
  }
  return v8;
}

- (BOOL)trackingKnobInParagraphMode
{
  BOOL v3 = [(TSWPEditingController *)self knobTracking];
  if (v3)
  {
    LOBYTE(v3) = [(TSWPEditingController *)self isInParagraphMode];
  }
  return v3;
}

- (_NSRange)markedRange
{
  NSUInteger length = self->_markedRange.length;
  NSUInteger location = self->_markedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)clearMarkedRange
{
  v6[1] = *MEMORY[0x263EF8340];
  if (self->_markedRange.location != *MEMORY[0x263F7C7C8]
    || self->_markedRange.length != *(void *)(MEMORY[0x263F7C7C8] + 8))
  {
    self->_markedRange = (_NSRange)*MEMORY[0x263F7C7C8];
    id v5 = @"TSWPEditingControllerEditor";
    v6[0] = self;
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"TSWPEditingControllerMarkChanged", self->_storage, v4);

    self->_markedText = 0;
  }
}

- (unint64_t)countOfHyperlinksInUserSelection
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  if ([(TSWPSelection *)self->_selection isValid])
  {
    storage = self->_storage;
    uint64_t v4 = [(TSWPSelection *)self->_selection range];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __57__TSWPEditingController_countOfHyperlinksInUserSelection__block_invoke;
    v8[3] = &unk_2646B2A80;
    v8[4] = &v9;
    -[TSWPStorage enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](storage, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v4, v5, v8);
  }
  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __57__TSWPEditingController_countOfHyperlinksInUserSelection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 elementKind];
  if (result == 512) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (id)p_hitRepWithPoint:(CGPoint)a3 keyboardAdjustmentDelta:(double)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:", a3.x, a3.y + a4);
  double v6 = v5;
  double v8 = v7;
  objc_opt_class();
  -[TSDInteractiveCanvasController hitRep:](self->_interactiveCanvasController, "hitRep:", v6, v8);
  uint64_t v9 = (void *)TSUDynamicCast();
  if (!v9)
  {
    -[TSDInteractiveCanvasController convertBoundsToUnscaledSize:](self->_interactiveCanvasController, "convertBoundsToUnscaledSize:", 20.0, 2.0);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = -[TSDInteractiveCanvasController hitRepsAtPoint:withSlop:](self->_interactiveCanvasController, "hitRepsAtPoint:withSlop:", v6, v8, v10, v11, 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v9 isEditing]
          && (TSWPStorage *)[v9 storage] == self->_storage)
        {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v14) {
            goto LABEL_4;
          }
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 leadingEdge:(BOOL *)a7
{
  return objc_msgSend(a3, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:", a5, 0, a6, a7, a4.x, a4.y);
}

- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7
{
  return objc_msgSend(a3, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:", a5, a6, a7, 0, a4.x, a4.y);
}

- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 isAtEndOfLine:(BOOL *)a8
{
  return objc_msgSend(a3, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", a5, a6, a7, a8, 0, a4.x, a4.y);
}

- (unint64_t)textSelectionGranularityForTapCount:(unint64_t)a3
{
  if (a3 - 2 >= 3) {
    return 4 * (a3 == 5);
  }
  else {
    return a3 - 1;
  }
}

- (void)tappedInRep:(id)a3 point:(CGPoint)a4 tapCount:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double y = a4.y;
  double x = a4.x;
  [(TSWPEditingController *)self p_sendHandleTapNotification];
  unint64_t v14 = [(TSWPEditingController *)self textSelectionGranularityForTapCount:a5];
  if (a5) {
    BOOL v15 = v8;
  }
  else {
    BOOL v15 = 0;
  }
  LOBYTE(v17) = 0;
  -[TSWPEditingController p_setTappedSelection:](self, "p_setTappedSelection:", -[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:", a3, v14, v8, v7, v15, 0, x, y, v17));
  if (v8)
  {
    [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] delegate];
    uint64_t v16 = (void *)TSUProtocolCast();
    if (objc_opt_respondsToSelector())
    {
      [v16 didSetTappedSelectionWithWPEditor:self onWPRep:a3];
    }
  }
}

- (id)selectionForRep:(id)a3 point:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5
{
  LOBYTE(v6) = 0;
  return -[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:", a3, a5, 0, 1, 1, 0, a4.x, a4.y, v6);
}

- (void)tappedOnKnob:(id)a3
{
  uint64_t v4 = [a3 tag];
  selection = self->_selection;
  if (v4 == 11) {
    uint64_t v6 = [(TSWPSelection *)selection start];
  }
  else {
    uint64_t v6 = [(TSWPSelection *)selection end];
  }
  uint64_t v7 = v6;
  [(TSWPEditingController *)self p_sendHandleTapNotification];
  BOOL v8 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", v7, 0);
  [(TSWPEditingController *)self p_setTappedSelection:v8];
}

- (void)p_sendHandleTapNotification
{
  v4[1] = *MEMORY[0x263EF8340];
  BOOL v3 = @"TSDEditorControllerEditorKey";
  v4[0] = self;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"TSDEditorControllerTextEditorWillHandleTap", 0, v2);
}

- (void)p_setTappedSelection:(id)a3
{
  if (-[TSWPEditingController pIsSelectionPlaceHolderTextWithSelection:](self, "pIsSelectionPlaceHolderTextWithSelection:"))
  {
    uint64_t v5 = 16464;
  }
  else
  {
    uint64_t v5 = 16720;
  }
  interactiveCanvasController = self->_interactiveCanvasController;
  storage = self->_storage;

  [(TSDInteractiveCanvasController *)interactiveCanvasController setSelection:a3 onModel:storage withFlags:v5];
}

- (BOOL)p_hitListLabelAtCharIndex:(unint64_t)a3 atNaturalPoint:(CGPoint)a4 inRep:(id)a5
{
  if (!a5) {
    return 0;
  }
  double y = a4.y;
  double x = a4.x;
  if (![(TSWPEditingController *)self p_respondsToListGestures]) {
    return 0;
  }
  [a5 labelRectForCharIndex:a3];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  double v17 = TSDRectWithCenterAndSize(x, y, 40.0);
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v24 = v10;
  uint64_t v25 = v12;
  uint64_t v26 = v14;
  uint64_t v27 = v16;

  return CGRectIntersectsRect(*(CGRect *)&v24, *(CGRect *)&v17);
}

- (id)p_selectionFromUnscaledCanvasPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 isTapHold:(BOOL)a5 allowPastBreak:(BOOL)a6 selectsEntireLink:(BOOL)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double y = a3.y;
  double x = a3.x;
  objc_opt_class();
  -[TSWPInteractiveCanvasController closestRepToPoint:forStorage:](self->_interactiveCanvasController, "closestRepToPoint:forStorage:", self->_storage, x, y);
  uint64_t v14 = (void *)TSUDynamicCast();
  if (![v14 isEditing]) {
    return 0;
  }
  objc_msgSend(v14, "convertNaturalPointFromUnscaledCanvas:", x, y);
  objc_msgSend(v14, "pinToClosestColumn:");
  LOBYTE(v16) = a7;
  return -[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:", v14, a4, v9, 1, 0, v8, v16);
}

- (id)p_selectionForRep:(id)a3 point:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7 includeListLabels:(BOOL)a8 allowPastBreak:(BOOL)a9 selectsEntireLink:(BOOL)a10
{
  BOOL v10 = a9;
  BOOL v11 = a8;
  double y = a4.y;
  double x = a4.x;
  objc_opt_class();
  double v17 = (void *)TSUDynamicCast();
  if (!v17) {
    return 0;
  }
  uint64_t v18 = v17;
  v120[0] = 1;
  unsigned __int8 v119 = 0;
  storage = self->_storage;
  if (storage == (TSWPStorage *)[v17 storage])
  {
    *(double *)&unint64_t v20 = COERCE_DOUBLE(-[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:](self, "charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:", v18, v10, &v119, v120, x, y));
  }
  else
  {
    *(double *)&unint64_t v20 = COERCE_DOUBLE([(TSWPStorage *)self->_storage length]);
    uint64_t v21 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v22 = [NSString stringWithUTF8String:"-[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:]"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 5299, @"The selection for the rep's storage is not the same as the editor's storage.");
  }
  if (*(double *)&v20 == NAN) {
    return 0;
  }
  CGFloat v24 = *(double *)&v20;
  if (!v120[0])
  {
    *(double *)&unint64_t v20 = COERCE_DOUBLE([(TSWPStorage *)self->_storage nextCharacterIndex:v20]);
    if (*(double *)&v20 == NAN) {
      return 0;
    }
  }
  rect.origin.double x = v24;
  double v115 = *MEMORY[0x263F7C7C8];
  uint64_t v25 = [TSWPFilteredStorage alloc];
  uint64_t v26 = self->_storage;
  uint64_t v27 = [(TSWPStorage *)v26 selectionRangeForCharIndex:v20];
  long long v29 = -[TSWPFilteredStorage initWithStorage:subRange:](v25, "initWithStorage:subRange:", v26, v27, v28);
  uint64_t v30 = [(TSWPFilteredStorage *)v29 charIndexMappedFromStorage:v20];
  switch(a5)
  {
    case 0uLL:
      uint64_t v31 = v30;
      if (v11
        && -[TSWPEditingController p_hitListLabelAtCharIndex:atNaturalPoint:inRep:](self, "p_hitListLabelAtCharIndex:atNaturalPoint:inRep:", *(void *)&rect.origin.x, v18, x, y))
      {
        uint64_t v32 = self->_storage;
        if (v32) {
          [(TSWPStorage *)v32 paragraphEnumeratorAtCharIndex:v20 styleProvider:0];
        }
        else {
          memset(&v118, 0, sizeof(v118));
        }
        CGFloat width = COERCE_DOUBLE(TSWPParagraphEnumerator::paragraphTextRange(&v118));
        uint64_t v63 = v62;
        BOOL v64 = v62 != 0;
        double v65 = [(TSWPEditingController *)self selection];
        if (v63)
        {
          double v66 = v65;
          if ([(TSWPSelection *)v65 isValid])
          {
            if ([(TSWPSelection *)v66 type] == 2)
            {
              unint64_t v67 = [(TSWPSelection *)v66 range];
              if (v67 <= *(void *)&width && v67 + v68 >= *(void *)&width + v63) {
                CGFloat width = COERCE_DOUBLE([(TSWPSelection *)v66 range]);
              }
            }
          }
        }
        uint64_t v41 = (2 * v64);
        TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v118);
        goto LABEL_99;
      }
      uint64_t v44 = [(TSWPFilteredStorage *)v29 smartFieldAtCharIndex:v31 attributeKind:6 effectiveRange:&v118];
      v118.var0 = (id)-[TSWPFilteredStorage charRangeMappedToStorage:](v29, "charRangeMappedToStorage:", v118.var0, v118.var1);
      v118.var1 = v45;
      if (a7 || v44)
      {
        objc_opt_class();
        if (TSUDynamicCast()) {
          BOOL v59 = a10;
        }
        else {
          BOOL v59 = 1;
        }
        if (v59) {
          uint64_t v41 = 7;
        }
        else {
          uint64_t v41 = 0;
        }
        if (v59) {
          CGFloat width = rect.origin.x;
        }
        else {
          CGFloat width = *(double *)&v118.var0;
        }
        goto LABEL_99;
      }
      if (v119)
      {
        if (v20 > [(TSWPStorage *)self->_storage selectionRangeMinForCharIndex:v20])
        {
          uint64_t v46 = [(TSWPFilteredStorage *)v29 whiteSpaceRangeAtCharIndex:[(TSWPFilteredStorage *)v29 previousCharacterIndex:[(TSWPFilteredStorage *)v29 charIndexMappedFromStorage:v20]] includingBreaks:0];
          if (v46 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v47 = v46;
            *(double *)&unint64_t v20 = COERCE_DOUBLE([(TSWPFilteredStorage *)v29 charIndexMappedToStorage:v46]);
            v120[0] = 1;
            uint64_t v31 = v47;
            *(void *)&rect.origin.double x = v20;
          }
        }
      }
      [(TSWPEditingController *)self dictationInterpretationsAtCharIndex:v20 outRange:&rect.size];
      *(double *)&uint64_t v48 = COERCE_DOUBLE([v18 rangeOfMisspelledWordAtCharIndex:v20]);
      if (*(void *)&rect.size.width != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (![(TSWPSelection *)self->_selection isValid])
        {
          uint64_t v41 = 5;
          CGFloat width = rect.size.width;
          goto LABEL_99;
        }
        uint64_t v60 = [(TSWPSelection *)self->_selection range];
        CGFloat width = rect.size.width;
        uint64_t v41 = 5;
        if (v60 != *(void *)&rect.size.width || v61 != *(void *)&rect.size.height) {
          goto LABEL_99;
        }
      }
      if (*(double *)&v48 != NAN)
      {
        uint64_t v41 = 3;
        CGFloat width = *(double *)&v48;
        goto LABEL_99;
      }
      if ([(TSWPSelection *)self->_selection isValid]
        && ([(TSWPSelection *)self->_selection type] == 3 || [(TSWPSelection *)self->_selection type] == 5))
      {
        if ((unint64_t v49 = [(TSWPSelection *)self->_selection range], v20 >= v49) && v20 - v49 < v50
          || (uint64_t v51 = [(TSWPSelection *)self->_selection range], v51 + v52 == v20))
        {
          selection = self->_selection;
          goto LABEL_15;
        }
      }
      uint64_t v69 = [(TSWPFilteredStorage *)v29 wordAtCharIndex:[(TSWPFilteredStorage *)v29 scanBackwardForWordAtCharIndex:v31] includePreviousWord:0];
      if (v69 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v69 = [(TSWPFilteredStorage *)v29 whiteSpaceRangeAtCharIndex:v31 includingBreaks:0];
      }
      uint64_t v71 = v69;
      CGFloat width = rect.origin.x;
      if (v69 == 0x7FFFFFFFFFFFFFFFLL || !v70) {
        goto LABEL_117;
      }
      *(double *)&uint64_t v72 = COERCE_DOUBLE(-[TSWPFilteredStorage charRangeMappedToStorage:](v29, "charRangeMappedToStorage:", v69, v70));
      *(void *)&CGFloat width = v73 + v72 - 1;
      [v18 caretRectForCharIndex:v72 leadingEdge:1 caretAffinity:0];
      CGFloat v116 = v75;
      rect.origin.double x = v74;
      CGFloat v77 = v76;
      double v114 = v76;
      CGFloat v79 = v78;
      [v18 caretRectForCharIndex:*(void *)&width leadingEdge:0 caretAffinity:0];
      CGFloat v81 = v80;
      CGFloat v83 = v82;
      CGFloat v85 = v84;
      CGFloat v87 = v86;
      v123.origin.double y = v77;
      v123.size.CGFloat width = v79;
      v123.origin.double x = rect.origin.x;
      v123.size.CGFloat height = v116;
      CGFloat MidX = CGRectGetMidX(v123);
      CGFloat v113 = v85;
      v124.origin.double x = v81;
      CGFloat v111 = v87;
      double v112 = v83;
      v124.origin.double y = v83;
      v124.size.CGFloat width = v85;
      double v89 = MidX;
      v124.size.CGFloat height = v87;
      double v90 = CGRectGetMidX(v124);
      double v91 = v90;
      if (v89 <= v90) {
        double v92 = v90;
      }
      else {
        double v92 = v89;
      }
      if (v89 <= v90) {
        double v90 = v89;
      }
      double v110 = v90;
      v125.origin.double x = rect.origin.x;
      v125.origin.double y = v114;
      v125.size.CGFloat width = v79;
      v125.size.CGFloat height = v116;
      if (CGRectIsNull(v125)) {
        goto LABEL_86;
      }
      v126.size.CGFloat width = v113;
      v126.origin.double x = v81;
      v126.origin.double y = v112;
      v126.size.CGFloat height = v111;
      if (CGRectIsNull(v126)) {
        goto LABEL_106;
      }
      if (vabdd_f64(v114, v112) >= 0.00999999978)
      {
        v127.origin.double x = rect.origin.x;
        v127.origin.double y = v114;
        v127.size.CGFloat width = v79;
        v127.size.CGFloat height = v116;
        double v104 = vabdd_f64(CGRectGetMinX(v127), y);
        v128.origin.double x = rect.origin.x;
        v128.origin.double y = v114;
        v128.size.CGFloat width = v79;
        v128.size.CGFloat height = v116;
        double v105 = vabdd_f64(CGRectGetMaxX(v128), y);
        if (v105 < v104) {
          double v104 = v105;
        }
        v129.origin.double y = v112;
        v129.origin.double x = v81;
        v129.size.CGFloat width = v113;
        v129.size.CGFloat height = v111;
        if (v104 <= vabdd_f64(CGRectGetMinY(v129), y)
          && (v130.origin.double x = v81,
              v130.origin.double y = v112,
              v130.size.CGFloat width = v113,
              v130.size.CGFloat height = v111,
              v104 <= vabdd_f64(CGRectGetMaxY(v130), y)))
        {
          char v106 = 1;
          CGFloat width = *(double *)&v72;
        }
        else
        {
          char v106 = 0;
        }
        v120[0] = v106;
      }
      else if (v89 > v91 != v92 - x >= x - v110)
      {
LABEL_106:
        v120[0] = 1;
        CGFloat width = *(double *)&v72;
      }
      else
      {
LABEL_86:
        v120[0] = 0;
      }
LABEL_117:
      if (width == NAN)
      {
        v107 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", v71);
        uint64_t v108 = [NSString stringWithUTF8String:"-[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:]"];
        objc_msgSend(v107, "handleFailureInFunction:file:lineNumber:description:", v108, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 5465, @"invalid charIndex for visual selection");
        CGFloat width = NAN;
      }
      uint64_t v41 = 7;
LABEL_99:
      [(TSWPStorage *)self->_storage selectionRangeForCharIndex:*(void *)&width];
      uint64_t v96 = NSIntersectionRangeInclusive();
      uint64_t v98 = v97;
      BOOL v99 = v96 == [(TSWPStorage *)self->_storage length] && !v98 || v120[0] != 0;
      v120[0] = v99;
      v100 = [TSWPSelection alloc];
      LOBYTE(v109) = v120[0];
      v101 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v100, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", v41, v96, v98, 0, v119, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), v109, self->_storage);
      v102 = v101;
      id v23 = [(TSWPEditingController *)self logicalToVisualSelection:[(TSWPEditingController *)self p_extendSelectionToIncludeSmartFields:v101]];

      return v23;
    case 1uLL:
      unint64_t v35 = -[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:", v18, v10, 1, 1, 0, x, y);
      unint64_t v36 = -[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:", v18, v10, 0, 0, 0, x, y);
      if (v11
        && [(TSWPSelection *)self->_selection isValid]
        && [(TSWPSelection *)self->_selection type] == 2
        && -[TSWPEditingController p_hitListLabelAtCharIndex:atNaturalPoint:inRep:](self, "p_hitListLabelAtCharIndex:atNaturalPoint:inRep:", v20, v18, x, y))
      {
        CGFloat width = COERCE_DOUBLE([(TSWPSelection *)self->_selection range]);
        NSUInteger length = v37;
        uint64_t v39 = self->_storage;
        unint64_t v40 = [(TSWPSelection *)self->_selection start];
        if (v39) {
          [(TSWPStorage *)v39 paragraphEnumeratorAtCharIndex:v40 styleProvider:0];
        }
        else {
          memset(&v118, 0, sizeof(v118));
        }
        CGFloat v43 = rect.origin.x;
        unint64_t v93 = TSWPParagraphEnumerator::paragraphLevel(&v118);
        while (!TSWPParagraphEnumerator::isLastParagraph(&v118))
        {
          TSWPParagraphEnumerator::operator++(&v118);
          if (TSWPParagraphEnumerator::paragraphLevel(&v118) <= v93
            || !TSWPParagraphEnumerator::paragraphHasListLabel(&v118))
          {
            break;
          }
          v122.NSUInteger location = TSWPParagraphEnumerator::paragraphTextRange(&v118);
          v122.NSUInteger length = v94;
          *(CGFloat *)&v121.NSUInteger location = width;
          v121.NSUInteger length = length;
          NSRange v95 = NSUnionRange(v121, v122);
          CGFloat width = *(double *)&v95.location;
          NSUInteger length = v95.length;
        }
        TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v118);
        unsigned int v42 = 2;
      }
      else if (v35 == 0x7FFFFFFFFFFFFFFFLL)
      {
        unsigned int v42 = 8;
        CGFloat width = v115;
        CGFloat v43 = rect.origin.x;
      }
      else
      {
        *(double *)&uint64_t v54 = COERCE_DOUBLE([(TSWPFilteredStorage *)v29 rangeForSelectionAtCharIndex:[(TSWPFilteredStorage *)v29 charIndexMappedFromStorage:v36] caretIndex:[(TSWPFilteredStorage *)v29 charIndexMappedFromStorage:v35]]);
        uint64_t v56 = v55;
        CGFloat width = COERCE_DOUBLE(-[TSWPFilteredStorage charRangeMappedToStorage:](v29, "charRangeMappedToStorage:", v54, v55));
        BOOL v57 = v56 == 1;
        CGFloat v43 = rect.origin.x;
        if (v57)
        {
          int v58 = [(TSWPFilteredStorage *)v29 characterAtIndex:v54];
          unsigned int v42 = 0;
          if (v58 == 65532) {
            CGFloat width = *(double *)&v54;
          }
        }
        else
        {
          unsigned int v42 = 0;
        }
      }
      if (width == NAN) {
        uint64_t v41 = 7;
      }
      else {
        uint64_t v41 = v42;
      }
      if (width == NAN) {
        CGFloat width = v43;
      }
      goto LABEL_99;
    case 2uLL:
      if (-[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:", v18, v10, 0, &v119, x, y) == 0x7FFFFFFFFFFFFFFFLL)goto LABEL_25; {
      LOBYTE(rect.size.width) = 0;
      }
      HIBYTE(rect.origin.y) = 0;
      v118.var0 = 0;
      CGFloat width = COERCE_DOUBLE([(TSWPEditingController *)self p_charIndexByMovingCharIndex:v20 withEolAffinity:&rect.size toBoundary:2 inDirection:1 preferPosition:&v118 isLeadingEdge:(char *)&rect.origin.y + 7]);
      [(TSWPEditingController *)self p_charIndexByMovingCharIndex:v20 withEolAffinity:&rect.size toBoundary:2 inDirection:0 preferPosition:&v118 isLeadingEdge:v120];
      uint64_t v41 = 0;
      goto LABEL_99;
    case 3uLL:
      if (-[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:", v18, v10, 0, &v119, x, y) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v53 = self->_storage;
        if (v53) {
          [(TSWPStorage *)v53 paragraphEnumeratorAtCharIndex:v20 styleProvider:0];
        }
        else {
          memset(&v118, 0, sizeof(v118));
        }
        CGFloat width = COERCE_DOUBLE(TSWPParagraphEnumerator::paragraphTextRange(&v118));
        TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v118);
        goto LABEL_65;
      }
LABEL_25:
      uint64_t v41 = 7;
      CGFloat width = rect.origin.x;
      goto LABEL_99;
    case 4uLL:
      selection = self->_storage;
LABEL_15:
      CGFloat width = COERCE_DOUBLE([selection range]);
LABEL_65:
      uint64_t v41 = 0;
      goto LABEL_99;
    default:
      uint64_t v41 = 8;
      CGFloat width = v115;
      goto LABEL_99;
  }
}

- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (self->_storage == a4)
  {
    if ([(TSWPSelection *)[(TSWPEditingController *)self selection] isValid])
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v6 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v22 != v8) {
              objc_enumerationMutation(a3);
            }
            BOOL v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if ([v10 kind] == 1)
            {
              [v10 details];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                BOOL v11 = objc_msgSend((id)objc_msgSend(v10, "details"), "objectForKeyedSubscript:", @"selection");
                uint64_t v12 = [v11 range];
                uint64_t v14 = v13;
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "details"), "objectForKeyedSubscript:", @"TSWPEditingControllerReassignSelectionKey"), "BOOLValue"))
                {
                  [(TSWPEditingController *)self setSelection:v11];
                }
                else
                {
                  unint64_t v15 = [(TSWPStorage *)self->_storage range];
                  uint64_t v17 = v16;
                  unint64_t v18 = [(TSWPSelection *)[(TSWPEditingController *)self selection] range];
                  if (v15 <= v18 && v15 + v17 >= v18 + v19)
                  {
                    if (-[TSWPSelection intersectsRange:]([(TSWPEditingController *)self selection], "intersectsRange:", v12, v14)|| [(TSWPSelection *)[(TSWPEditingController *)self selection] isInsertionPoint]&& (unint64_t v20 = [(TSWPSelection *)[(TSWPEditingController *)self selection] start], v20 == [(TSWPStorage *)self->_storage length])&& v12 + v14 == [(TSWPStorage *)self->_storage length])
                    {
                      [(TSWPEditingController *)self p_postSelectionContentsChangedNotification];
                      return;
                    }
                  }
                }
              }
            }
          }
          uint64_t v7 = [a3 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
    }
  }
}

- (TSDInteractiveCanvasController)icc
{
  return &self->_interactiveCanvasController->super;
}

- (void)updateAfterAutoscroll:(id)a3
{
  interactiveCanvasController = self->_interactiveCanvasController;
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](interactiveCanvasController, "layerHost"), "canvasView"), "convertPoint:fromView:", 0, self->_autoscrollPoint.x, self->_autoscrollPoint.y);
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](interactiveCanvasController, "convertBoundsToUnscaledPoint:");
  double v7 = v6;
  double v9 = v8;
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layoutIfNeeded];
  knobTracker = self->_knobTracker;
  if (knobTracker)
  {
    double x = self->_autoscrollPoint.x;
    double y = self->_autoscrollPoint.y;
    -[TSWPTextKnobTracker updateAfterAutoscroll:atPoint:](knobTracker, "updateAfterAutoscroll:atPoint:", a3, x, y);
  }
  else
  {
    id v13 = +[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier];
    objc_msgSend(v13, "setAutoscrollDirections:", objc_msgSend(a3, "directions"));
    if ([(TSWPSelection *)[(TSWPEditingController *)self selection] isInsertionPoint]) {
      -[TSWPEditingController p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", 0, 0, v7, v9);
    }
    objc_msgSend(v13, "postAutoscrollPoint:", v7, v9);
  }
}

- (void)autoscrollWillNotStart
{
  objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "autoscrollWillNotStart");
  knobTracker = self->_knobTracker;

  [(TSWPTextKnobTracker *)knobTracker autoscrollWillNotStart];
}

- (id)pasteboardController
{
  uint64_t v2 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController documentRoot];

  return [(TSKDocumentRoot *)v2 pasteboardController];
}

- (BOOL)pStorageCanAcceptDrawableAttachments
{
  return [(TSWPStorage *)self->_storage allowsElementKind:1048591];
}

- (_NSRange)smartDeletionSelection:(id)a3 isVisual:(BOOL *)a4
{
  uint64_t v7 = [a3 range];
  NSUInteger v9 = v8;
  if (a4) {
    *a4 = [a3 isVisual];
  }
  if ((unint64_t)[a3 visualRangeCount] <= 1 && objc_msgSend(a3, "isRange"))
  {
    uint64_t v7 = [a3 superRange];
    NSUInteger v9 = v10;
    if (a4) {
      *a4 = 0;
    }
    unint64_t v11 = [(TSWPStorage *)self->_storage length];
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    [(TSWPStorage *)self->_storage smartFieldAtCharIndex:v7 attributeKind:6 effectiveRange:&v36];
    NSUInteger v12 = v7 + v9;
    if (v7) {
      BOOL v13 = v36 == v7;
    }
    else {
      BOOL v13 = 1;
    }
    int v14 = !v13;
    uint64_t v15 = v37 + v36;
    if (v37 + v36 < v12)
    {
      [(TSWPStorage *)self->_storage smartFieldAtCharIndex:v12 - 1 attributeKind:6 effectiveRange:&v36];
      uint64_t v15 = v37 + v36;
    }
    BOOL v17 = v15 == v12 || v12 == v11;
    if (v14)
    {
      uint64_t v18 = [(TSWPStorage *)self->_storage characterAtIndex:v7 - 1];
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet"), "characterIsMember:", v18))
      {
        char v19 = 0;
        BOOL v20 = v18 == 32;
        int v21 = 1;
        if (v17) {
          goto LABEL_36;
        }
LABEL_38:
        uint64_t v29 = [(TSWPStorage *)self->_storage characterAtIndex:v7 + v9];
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet"), "characterIsMember:", v29) & 1) == 0)
        {
          if ((v20 & objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "postSmartSet"), "characterIsMember:", v29)) != 1)goto LABEL_52; {
          goto LABEL_46;
          }
        }
        if (v29 == 32) {
          char v30 = v14;
        }
        else {
          char v30 = 1;
        }
        if ((v30 & 1) == 0) {
          goto LABEL_47;
        }
        if (v19)
        {
          v9 += (v29 == 32) & ~v21;
          goto LABEL_52;
        }
        if (v29 == 32)
        {
LABEL_47:
          ++v9;
          goto LABEL_52;
        }
LABEL_36:
        if (!v20) {
          goto LABEL_52;
        }
LABEL_46:
        --v7;
        goto LABEL_47;
      }
      int v28 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "preSmartSet"), "characterIsMember:", v18);
      BOOL v20 = 0;
      int v21 = v28 ^ 1;
    }
    else
    {
      BOOL v20 = 0;
      int v21 = 1;
    }
    char v19 = 1;
    if (v17) {
      goto LABEL_36;
    }
    goto LABEL_38;
  }
  if ([a3 isRange]
    && [a3 isVisual]
    && [(TSWPEditingController *)self textStorage:[(TSWPEditingController *)self storage] hasWhitespaceBoundedWordAtSelection:a3])
  {
    LOBYTE(v36) = 0;
    unint64_t v22 = [(TSWPEditingController *)self charIndexMovingByCharacterFromCharIndex:[(TSWPEditingController *)self p_leftEdgeForSelection:a3 withLeadingEdge:&v36] inDirection:3];
    if (IsWhitespaceCharacter([(TSWPStorage *)[(TSWPEditingController *)self storage] characterAtIndex:v22]))
    {
      unint64_t v23 = [a3 superRange];
      if (v22 >= v23 && v22 - v23 < v24) {
        goto LABEL_49;
      }
    }
    unint64_t v25 = [(TSWPEditingController *)self p_rightEdgeForSelection:a3 withLeadingEdge:&v36];
    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v26 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v27 = [NSString stringWithUTF8String:"-[TSWPEditingController smartDeletionSelection:isVisual:]"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 5914, @"Invalid index for right edge of selection");
      goto LABEL_50;
    }
    unint64_t v22 = [(TSWPEditingController *)self charIndexMovingByCharacterFromCharIndex:v25 inDirection:2];
    if (IsWhitespaceCharacter([(TSWPStorage *)[(TSWPEditingController *)self storage] characterAtIndex:v22]))
    {
LABEL_49:
      if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v7 = [(TSWPEditingController *)self p_adjustVisualSelection:a3 withOtherSelection:[(TSWPEditingController *)self logicalToVisualSelection:+[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v22, 1)]];
        NSUInteger v9 = v35;
        if (!a4) {
          goto LABEL_52;
        }
        goto LABEL_51;
      }
    }
LABEL_50:
    uint64_t v31 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v32 = [NSString stringWithUTF8String:"-[TSWPEditingController smartDeletionSelection:isVisual:]"];
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 5927, @"A spaceCharIndexToRemove to remove should always be found");
    if (!a4) {
      goto LABEL_52;
    }
LABEL_51:
    *a4 = 1;
  }
LABEL_52:
  NSUInteger v33 = v7;
  NSUInteger v34 = v9;
  result.NSUInteger length = v34;
  result.NSUInteger location = v33;
  return result;
}

- (CGRect)overrideCaretRectForSelection:(id)a3
{
  double v3 = *MEMORY[0x263F001A0];
  double v4 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)textStorage:(id)a3 hasWhitespaceBoundedWordAtSelection:(id)a4
{
  char v33 = 0;
  if ([a4 isVisual])
  {
    unint64_t v7 = [(TSWPEditingController *)self p_leftEdgeForSelection:a4 withLeadingEdge:&v33];
    unint64_t v8 = [(TSWPEditingController *)self charIndexMovingByCharacterFromCharIndex:v7 inDirection:3];
    if (IsWhitespaceCharacter([a3 characterAtIndex:v7])) {
      goto LABEL_6;
    }
    if (v8 == [a3 length]
      || IsWhitespaceCharacter([a3 characterAtIndex:v8]))
    {
      int v9 = TSWPCJKLanguageForInputLanguageString(objc_msgSend(a3, "languageForTextRange:useStringTokenizer:useCreationLanguage:", v7, 1, 1, 0));
      LOBYTE(v10) = 0;
      char v11 = 0;
      if (v9 == 6)
      {
LABEL_6:
        unint64_t v12 = [(TSWPEditingController *)self p_rightEdgeForSelection:a4 withLeadingEdge:&v33];
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v14 = [NSString stringWithUTF8String:"-[TSWPEditingController textStorage:hasWhitespaceBoundedWordAtSelection:]"];
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 5987, @"Invalid index for right edge of selection");
LABEL_16:
          LOBYTE(v10) = 0;
          char v11 = 1;
          return v10 & v11;
        }
        unint64_t v22 = v12;
        uint64_t v23 = [a3 characterAtIndex:v12];
        if (IsParagraphBreakingCharacter(v23)) {
          goto LABEL_16;
        }
        if (IsWhitespaceCharacter(v23)) {
          goto LABEL_27;
        }
        unint64_t v24 = [(TSWPEditingController *)self charIndexMovingByCharacterFromCharIndex:v22 inDirection:2];
        if (v24 != [a3 length]
          && !IsWhitespaceCharacter([a3 characterAtIndex:v24]))
        {
          goto LABEL_16;
        }
        unint64_t v25 = v22 <= v24 ? v24 : v22;
        unint64_t v26 = v22 >= v24 ? v24 : v22;
        char v11 = 1;
        if (TSWPCJKLanguageForInputLanguageString(objc_msgSend(a3, "languageForTextRange:useStringTokenizer:useCreationLanguage:", v26, v25 - v26, 1, 0)) == 6)
        {
LABEL_27:
          uint64_t v20 = [a4 range];
          id v19 = a3;
          uint64_t v21 = v27;
          goto LABEL_28;
        }
LABEL_35:
        LOBYTE(v10) = 0;
        return v10 & v11;
      }
      return v10 & v11;
    }
LABEL_14:
    LOBYTE(v10) = 0;
    char v11 = 0;
    return v10 & v11;
  }
  if (![a4 isValid] || !objc_msgSend(a4, "isRange")) {
    goto LABEL_14;
  }
  uint64_t v15 = [a4 range];
  uint64_t v17 = v16;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "preSmartSet"), "characterIsMember:", objc_msgSend(a3, "characterAtIndex:", v15)) & 1) != 0|| (v28 = objc_msgSend(a3, "wordAtCharIndex:includePreviousWord:", v15, 0), LOBYTE(v10) = 0, char v11 = 0, v28 == v15)&& (v29 = TSWPCJKLanguageForInputLanguageString(objc_msgSend(a3, "languageForTextRange:useStringTokenizer:useCreationLanguage:", v15, 1, 1, 0)), LOBYTE(v10) = 0, char v11 = 0, v29 == 6))
  {
    uint64_t v18 = [a3 characterAtIndex:v15 + v17 - 1];
    if (IsParagraphBreakingCharacter(v18)) {
      goto LABEL_16;
    }
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "postSmartSet"), "characterIsMember:", v18) & 1) == 0)
    {
      char v11 = 1;
      uint64_t v30 = [a3 wordAtCharIndex:v15 + v17 includePreviousWord:1];
      LOBYTE(v10) = 0;
      if (!v31 || v30 + v31 != v15 + v17) {
        return v10 & v11;
      }
      char v11 = 1;
      if (TSWPCJKLanguageForInputLanguageString(objc_msgSend(a3, "languageForTextRange:useStringTokenizer:useCreationLanguage:", v15 + v17 - 1, 1, 1, 0)) != 6)goto LABEL_35; {
    }
      }
    id v19 = a3;
    uint64_t v20 = v15;
    uint64_t v21 = v17;
LABEL_28:
    int v10 = objc_msgSend(v19, "isAllWhitespaceInRange:", v20, v21) ^ 1;
    char v11 = v10;
  }
  return v10 & v11;
}

- (BOOL)p_selectionIsSimpleInsertionPoint
{
  BOOL v3 = [(TSWPSelection *)self->_selection isInsertionPoint];
  if (v3) {
    LOBYTE(v3) = [(TSWPSelection *)self->_selection type] != 3
  }
              && [(TSWPSelection *)self->_selection type] != 5
              && [(TSWPSelection *)self->_selection type] != 4
              && [(TSWPStorage *)self->_storage length] != 0;
  return v3;
}

- (BOOL)p_canSelectAllWithSender:(id)a3
{
  if (+[TSDCanvasEditor physicalKeyboardIsSender:a3])
  {
    if ([(TSWPSelection *)self->_selection isValid])
    {
      uint64_t v4 = [(TSWPSelection *)self->_selection range];
      uint64_t v6 = v5;
      if (v4 != [(TSWPStorage *)self->_storage range] || v6 != v7) {
        return 1;
      }
      BOOL v10 = [(TSWPSelection *)self->_selection type] == 0;
    }
    else
    {
      BOOL v10 = [(TSWPStorage *)self->_storage length] == 0;
    }
    return !v10;
  }
  else
  {
    return [(TSWPEditingController *)self p_selectionIsSimpleInsertionPoint];
  }
}

- (BOOL)p_canInsertBreak
{
  if ([(TSWPEditingController *)self p_canEditTextString]
    && [(TSWPSelection *)self->_selection isValid])
  {
    [(TSWPSelection *)self->_selection isInsertionPoint];
  }
  return 1;
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  BOOL v7 = +[TSDCanvasEditor physicalKeyboardIsSender:a4];
  if ([(TSWPEditingController *)self p_canEditTextString])
  {
    BOOL v8 = [(TSWPSelection *)self->_selection isValid];
    if (sel_deleteObject_ == a3)
    {
      if (!v8) {
        return -1;
      }
LABEL_25:
      if ([(TSWPSelection *)self->_selection type] != 4)
      {
        BOOL v8 = [(TSWPSelection *)self->_selection isRange];
LABEL_38:
        BOOL v11 = !v8;
LABEL_39:
        if (v11) {
          return -1;
        }
        else {
          return 1;
        }
      }
      return -1;
    }
  }
  else
  {
    if (sel_deleteObject_ == a3) {
      return -1;
    }
    BOOL v8 = 0;
  }
  if (sel_delete_ == a3)
  {
    if (!v8 || !v7) {
      return -1;
    }
    goto LABEL_25;
  }
  if (sel_copy_ == a3)
  {
    if (![(TSWPSelection *)self->_selection isValid]
      || [(TSWPSelection *)self->_selection type] == 3
      || [(TSWPSelection *)self->_selection type] == 5
      || [(TSWPSelection *)self->_selection type] == 4
      || [(TSWPSelection *)self->_selection isInsertionPoint])
    {
      int v10 = 0;
    }
    else
    {
      int v10 = ![(TSWPEditingController *)self pIsSelectionPlaceHolderText];
    }
    BOOL v11 = (v7 & v10) == 0;
    goto LABEL_39;
  }
  if (sel_select_ == a3)
  {
    if (!v7) {
      return -1;
    }
LABEL_35:
    BOOL v8 = [(TSWPEditingController *)self p_selectionIsSimpleInsertionPoint];
    goto LABEL_38;
  }
  if (sel_customSelect_ == a3) {
    goto LABEL_35;
  }
  if (sel_selectAll_ == a3)
  {
    if (!v7) {
      return -1;
    }
LABEL_37:
    BOOL v8 = [(TSWPEditingController *)self p_canSelectAllWithSender:a4];
    goto LABEL_38;
  }
  if (sel_customSelectAll_ == a3) {
    goto LABEL_37;
  }
  if (sel_replaceWithSuggestion0_ == a3
    || sel_replaceWithSuggestion1_ == a3
    || sel_replaceWithSuggestion2_ == a3
    || sel_replaceWithSuggestion3_ == a3
    || sel_replaceWithSuggestion4_ == a3
    || sel_noReplacementsFound_ == a3)
  {
    goto LABEL_38;
  }
  if (sel_definitionAction_ == a3)
  {
    storage = self->_storage;
    uint64_t v13 = [(TSWPSelection *)self->_selection range];
    if (-[TSWPStorage hasSmartFieldsInRange:](storage, "hasSmartFieldsInRange:", v13, v14)) {
      return -1;
    }
    if (![(TSWPSelection *)self->_selection isRange]) {
      return -1;
    }
    unint64_t v15 = [(TSWPEditingController *)self rangeOfWordEnclosingCharIndex:[(TSWPSelection *)self->_selection range] backward:0];
    uint64_t v17 = v16;
    unint64_t v18 = [(TSWPSelection *)self->_selection range];
    if (v15 > v18) {
      return -1;
    }
    BOOL v11 = v15 + v17 < v18 + v19;
    goto LABEL_39;
  }
  if (sel_endEditingAndSelectParent_ == a3) {
    return ([(TSWPStorage *)self->_storage wpKind] & 0xFFFFFFFE) == 2;
  }

  return [(TSWPEditingController *)self p_canPerformOptInEditorAction:a3 withSender:a4];
}

- (int)p_canPerformOptInEditorAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (id)styleProvider
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  uint64_t v3 = TSUProtocolCast();
  if (objc_opt_respondsToSelector()) {
    uint64_t v4 = (__objc2_class *)v3;
  }
  else {
    uint64_t v4 = TSWPStorageStyleProvider;
  }
  storage = self->_storage;

  return (id)[(__objc2_class *)v4 styleProviderForStorage:storage];
}

- (id)currentLayoutParent
{
  return 0;
}

- (id)stringFromSelection
{
  storage = self->_storage;
  uint64_t v4 = [(TSWPSelection *)self->_selection superRange];
  uint64_t v6 = v5;
  id v7 = [(TSWPEditingController *)self currentLayoutParent];

  return -[TSWPStorage stringEquivalentFromRange:withLayoutParent:](storage, "stringEquivalentFromRange:withLayoutParent:", v4, v6, v7);
}

- (void)copy:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  if ([(TSWPSelection *)self->_selection isRange])
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if ([(TSWPStorage *)self->_storage stylesheet])
    {
      uint64_t v5 = [(TSWPSelection *)self->_selection range];
      id v7 = -[TSWPStorage nsAttributedSubstringFromRange:scale:](self->_storage, "nsAttributedSubstringFromRange:scale:", v5, v6, 1.0);
      uint64_t v8 = objc_msgSend(v7, "tsu_RTFFromRange:documentAttributes:", 0, objc_msgSend(v7, "length"), 0);
      if (v8) {
        [v4 setObject:v8 forKey:*MEMORY[0x263F01B10]];
      }
    }
    id v9 = [(TSWPStorage *)[(TSWPEditingController *)self storage] substringWithSelection:[(TSWPEditingController *)self selection]];
    [v4 setObject:v9 forKey:*MEMORY[0x263F01B58]];
    v11[0] = v4;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C840], "generalPasteboard"), "setItems:", v10);
  }
}

- (BOOL)selectionIsOnEmptyParagraph
{
  BOOL v3 = [(TSWPSelection *)self->_selection isValid];
  if (v3)
  {
    [(TSWPSelection *)self->_selection range];
    if (v4)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      uint64_t v5 = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:[(TSWPSelection *)self->_selection start]];
      LOBYTE(v3) = v6 == (v5 + v6 != [(TSWPStorage *)self->_storage length]);
    }
  }
  return v3;
}

- (BOOL)canSetWritingDirection:(int)a3
{
  int v5 = [(TSWPEditingController *)self p_canEditTextString];
  if (!v5) {
    return v5;
  }
  int v5 = [(TSWPSelection *)self->_selection isValid];
  if (!v5) {
    return v5;
  }
  int v5 = objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "supportsRTL");
  if (!v5) {
    return v5;
  }
  if ([(TSWPSelection *)self->_selection type] == 3
    || [(TSWPSelection *)self->_selection type] == 5
    || [(TSWPSelection *)self->_selection type] == 4)
  {
    goto LABEL_14;
  }
  if ((a3 + 1) > 2)
  {
    id v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPEditingController canSetWritingDirection:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 7859, @"Unknown writing direction.");
    goto LABEL_14;
  }
  unint64_t v6 = [(TSWPSelection *)self->_selection start];
  if (v6 > [(TSWPStorage *)self->_storage length])
  {
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }
  int v5 = objc_msgSend((id)TSWPResolvePropertyForStyles(0, (uint64_t)-[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self->_storage, "paragraphStyleAtCharIndex:effectiveRange:", v6, 0), 44, 0), "intValue");
  if (v5 == -1)
  {
    int v5 = [(TSWPStorage *)self->_storage writingDirectionForParagraphAtCharIndex:v6];
    if (v5 == -1) {
      int v5 = objc_msgSend(-[TSWPStorage documentRoot](self->_storage, "documentRoot"), "isDirectionRightToLeft");
    }
  }
  LOBYTE(v5) = v5 != a3;
  return v5;
}

- (int64_t)writingDirectionForCharIndex:(unint64_t)a3
{
  if ([(TSWPStorage *)self->_storage length] < a3)
  {
    int v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPEditingController writingDirectionForCharIndex:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 7956, @"Bad char index into storage.");
  }
  if ([(TSWPStorage *)self->_storage length] >= a3)
  {
    uint64_t v7 = [(TSWPStorage *)self->_storage writingDirectionForParagraphAtCharIndex:a3]+ 1;
    if (v7 < 3) {
      return v7 - 1;
    }
    id v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPEditingController writingDirectionForCharIndex:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 7973, @"Unknown writing direction.");
  }
  return -1;
}

- (BOOL)editorKeyboardLanguageIsRTL
{
  id v2 = [(TSWPEditingController *)self editorKeyboardLanguage];
  return [MEMORY[0x263EFF960] characterDirectionForLanguage:v2] == 2;
}

- (void)referenceLibrarayViewControllerWasDismissed:(id)a3
{
  if ((TSUSupportsTextInteraction() & 1) == 0)
  {

    self->_definitionViewController = 0;
    self->_definitionPopoverController = 0;
    interactiveCanvasController = self->_interactiveCanvasController;
    [(TSDInteractiveCanvasController *)interactiveCanvasController setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:0];
  }
}

- (void)popoverControllerDidDismissPopoverBasedViewController:(id)a3
{
  BOOL v3 = self;
}

- (void)select:(id)a3
{
  uint64_t v4 = [(TSWPStorage *)self->_storage rangeForSelectionWithInsertionSelection:self->_selection];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(TSWPSelection *)self->_selection isValid] && [(TSWPSelection *)self->_selection start]) {
      unint64_t v6 = [(TSWPSelection *)self->_selection start] - 1;
    }
    else {
      unint64_t v6 = 0;
    }
    uint64_t v7 = 0;
  }
  else
  {
    unint64_t v6 = v4;
    uint64_t v7 = v5;
  }
  uint64_t v8 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", v6, v7);
  [(TSWPEditingController *)self setSelection:[(TSWPEditingController *)self logicalToVisualSelection:[(TSWPEditingController *)self p_extendSelectionToIncludeSmartFields:v8]] withFlags:65792];
}

- (void)p_addInsertItemsIntoMenu:(id)a3
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  TSUProtocolCast();
  if (TSUPhoneUI() & 1) == 0 && (objc_opt_respondsToSelector()) {
    return;
  }
  int v5 = [(TSWPEditingController *)self acceptsTabs];
  int v6 = [(TSWPEditingController *)self acceptsLineBreaks] + v5;
  int v7 = [(TSWPEditingController *)self acceptsColumnBreaks];
  unsigned int v8 = v6 + v7 + [(TSWPEditingController *)self acceptsPageBreaks];
  if (v8 >= 2)
  {
    id v9 = (void *)MEMORY[0x263F1C7B8];
    uint64_t v10 = [(id)TSWPBundle() localizedStringForKey:@"Insert" value:&stru_26D688A48 table:@"TSText"];
    BOOL v11 = sel_showInsertBreak_;
LABEL_14:
    uint64_t v12 = [v9 menuItemWithTitle:v10 action:v11];
    [a3 addObject:v12];
    return;
  }
  if (v8 == 1)
  {
    if ([(TSWPEditingController *)self acceptsTabs]) {
      objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x263F1C7B8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Tab", &stru_26D688A48, @"TSTextPlatform"), sel_insertTab_));
    }
    if ([(TSWPEditingController *)self acceptsLineBreaks]) {
      objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x263F1C7B8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Line Break", &stru_26D688A48, @"TSTextPlatform"), sel_insertLineBreak_));
    }
    if ([(TSWPEditingController *)self acceptsColumnBreaks]) {
      objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x263F1C7B8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Column Break", &stru_26D688A48, @"TSTextPlatform"), sel_insertColumnBreak_));
    }
    if ([(TSWPEditingController *)self acceptsPageBreaks])
    {
      id v9 = (void *)MEMORY[0x263F1C7B8];
      uint64_t v10 = [(id)TSWPBundle() localizedStringForKey:@"Page Break" value:&stru_26D688A48 table:@"TSTextPlatform"];
      BOOL v11 = sel_insertPageBreak_;
      goto LABEL_14;
    }
  }
}

- (void)p_addCommonEditItemsIntoMenu:(id)a3
{
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x263F1C7B8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Select", &stru_26D688A48, @"TSTextPlatform"), sel_customSelect_));
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x263F1C7B8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Select All", &stru_26D688A48, @"TSTextPlatform"), sel_customSelectAll_));
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x263F1C7B8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Cut", &stru_26D688A48, @"TSTextPlatform"), sel_cutObject_));
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x263F1C7B8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Copy", &stru_26D688A48, @"TSTextPlatform"), sel_copyObject_));
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x263F1C7B8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Paste", &stru_26D688A48, @"TSTextPlatform"), sel_pasteObject_));
  uint64_t v4 = objc_msgSend(MEMORY[0x263F1C7B8], "menuItemWithTitle:action:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"Delete", &stru_26D688A48, @"TSTextPlatform"), sel_deleteObject_);

  [a3 addObject:v4];
}

- (id)extraMenuItems
{
  BOOL v3 = (void *)[MEMORY[0x263EFF980] array];

  self->_suggestions = 0;
  if (![(TSWPSelection *)self->_selection isValid]
    || [(TSWPSelection *)self->_selection type] != 3 && [(TSWPSelection *)self->_selection type] != 5
    || [(TSWPEditingController *)self pIsSelectionPlaceHolderText])
  {
    [(TSWPStorage *)[(TSWPEditingController *)self storage] wpKind];
    [(TSWPEditingController *)self p_addCommonEditItemsIntoMenu:v3];
  }
  return v3;
}

- (void)replaceAction:(id)a3
{
}

- (void)definitionAction:(id)a3
{
  if ((TSUSupportsTextInteraction() & 1) == 0)
  {
    storage = self->_storage;
    uint64_t v5 = [(TSWPSelection *)self->_selection range];
    uint64_t v7 = -[TSWPStorage substringWithRange:](storage, "substringWithRange:", v5, v6);

    self->_definitionViewController = 0;
    unsigned int v8 = [(UIReferenceLibraryViewController *)[TSWPReferenceLibraryViewController alloc] initWithTerm:v7];
    self->_definitionViewController = v8;
    [(TSWPReferenceLibraryViewController *)v8 setDelegate:self];
    if (TSUPhoneUI())
    {
      [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:1];
      id v9 = [(TSWPEditingController *)self p_viewControllerForPresenting];
      if (!v9) {
        id v9 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSWPEditingController p_documentViewController](self, "p_documentViewController"), "view"), "window"), "rootViewController");
      }
      definitionViewController = self->_definitionViewController;
      [v9 presentViewController:definitionViewController animated:1 completion:0];
    }
    else
    {

      self->_definitionPopoverController = 0;
      BOOL v11 = (UIPopoverController *)[objc_alloc(MEMORY[0x263F1C898]) initWithContentViewController:self->_definitionViewController];
      self->_definitionPopoverController = v11;
      uint64_t v12 = [(TSWPSelection *)[(TSWPEditingController *)self selection] range];
      -[TSWPEditingController p_firstRectForRange:actualRange:](self, "p_firstRectForRange:actualRange:", v12, v13, 0);
      CGRect v21 = CGRectIntegral(v20);
      double x = v21.origin.x;
      double y = v21.origin.y;
      double width = v21.size.width;
      double height = v21.size.height;
      uint64_t v18 = objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "asiOSCVC"), "view");
      -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v11, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v18, 15, 1, x, y, width, height);
    }
  }
}

- (void)styleAction:(id)a3
{
  uint64_t v4 = [TSWPSelection alloc];
  uint64_t v5 = [(TSWPSelection *)self->_selection superRange];
  uint64_t v7 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:](v4, "initWithType:range:styleInsertionBehavior:caretAffinity:", 4, v5, v6, [(TSWPSelection *)self->_selection styleInsertionBehavior], [(TSWPSelection *)self->_selection caretAffinity]);
  [(TSWPEditingController *)self setSelection:v7];

  [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] layoutInvalidated];
  self->_showNextEditMenu = 1;
}

- (void)p_switchToReplaceSelection
{
  if (![(TSWPSelection *)self->_selection isRange])
  {
    BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPEditingController p_switchToReplaceSelection]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 8589, @"shouldn't change an insertion point to a replacement selection");
  }
  uint64_t v5 = [(TSWPEditingController *)self rangeOfWordEnclosingCharIndex:[(TSWPSelection *)self->_selection range] backward:0];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 3, v5, v6, [(TSWPSelection *)self->_selection styleInsertionBehavior], [(TSWPSelection *)self->_selection caretAffinity]);
    [(TSWPEditingController *)self setSelection:v7];
  }
}

- (void)selectAll:(id)a3
{
  uint64_t v5 = [TSWPSelection alloc];
  storage = self->_storage;
  if ([(TSWPSelection *)self->_selection isValid]) {
    unint64_t v7 = [(TSWPSelection *)self->_selection start];
  }
  else {
    unint64_t v7 = 0;
  }
  uint64_t v8 = [(TSWPStorage *)storage selectionRangeForCharIndex:v7];
  BOOL v11 = -[TSWPSelection initWithRange:](v5, "initWithRange:", v8, v9);
  if (+[TSDCanvasEditor physicalKeyboardIsSender:a3]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 0x10000;
  }
  [(TSWPEditingController *)self setSelection:v11 withFlags:v10];
}

- (BOOL)p_isTextInputEditor
{
  return [(TSDEditorController *)[(TSDInteractiveCanvasController *)self->_interactiveCanvasController editorController] textInputEditor] == self;
}

- (id)currentFontColor
{
  v7[3] = *MEMORY[0x263EF8340];
  if ([(TSWPSelection *)self->_selection isValid]) {
    unint64_t v3 = [(TSWPSelection *)self->_selection start];
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = [(TSWPStorage *)self->_storage characterStyleAtCharIndex:v3 left:[(TSWPSelection *)self->_selection isInsertionPoint] effectiveRange:0];
  id v5 = [(TSWPStorage *)self->_storage paragraphStyleAtCharIndex:v3 effectiveRange:0];
  v7[0] = self->_insertionStyle;
  v7[1] = v4;
  v7[2] = v5;
  return (id)TSWPResolvePropertyForStyles((uint64_t)v7, 3uLL, 18, 0);
}

- (BOOL)canHighlightCurrentSelection
{
  BOOL v3 = [(TSWPEditingController *)self p_canEditTextString];
  BOOL v4 = [(TSWPEditingController *)self canShowCommentForCurrentSelectionGetHighlight:0 range:0];
  if ([(TSWPSelection *)self->_selection isValid])
  {
    objc_msgSend(-[TSWPEditingController p_highlightSelectionForSelection:](self, "p_highlightSelectionForSelection:", self->_selection), "range");
    if (v5) {
      int v6 = !v4;
    }
    else {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }
  BOOL v7 = v3 & v6 & [(TSWPStorage *)[(TSWPEditingController *)self storage] highlightsAllowed];
  return !self->_hostEditor && v7;
}

- (BOOL)canShowCommentForCurrentSelectionGetHighlight:(id *)a3 range:(_NSRange *)a4
{
  LODWORD(v7) = [(TSWPEditingController *)self p_canEditTextString];
  if (v7)
  {
    LODWORD(v7) = [(TSWPSelection *)self->_selection isValid];
    if (v7)
    {
      LODWORD(v7) = [(TSWPStorage *)[(TSWPEditingController *)self storage] highlightsAllowed];
      if (v7)
      {
        storage = self->_storage;
        uint64_t v9 = [(TSWPSelection *)self->_selection superRange];
        uint64_t v7 = -[TSWPStorage firstHighlightForSelectionRange:outRange:](storage, "firstHighlightForSelectionRange:outRange:", v9, v10, &v16);
        if (v7)
        {
          BOOL v11 = (void *)v7;
          _NSRange v12 = v16;
          unint64_t v13 = [(TSWPSelection *)self->_selection superRange];
          if (v12.location <= v13 && v12.length + v12.location >= v13 + v14)
          {
            if (a3) {
              *a3 = v11;
            }
            if (a4) {
              *a4 = v16;
            }
            LOBYTE(v7) = 1;
          }
          else
          {
            LOBYTE(v7) = 0;
          }
        }
      }
    }
  }
  return v7;
}

- (BOOL)canRemoveHighlightForCurrentSelection
{
  BOOL v3 = [(TSWPEditingController *)self p_canEditTextString];
  if (v3)
  {
    BOOL v3 = [(TSWPSelection *)self->_selection isValid];
    if (v3)
    {
      BOOL v3 = [(TSWPStorage *)[(TSWPEditingController *)self storage] highlightsAllowed];
      if (v3)
      {
        storage = self->_storage;
        uint64_t v5 = [(TSWPSelection *)self->_selection superRange];
        LOBYTE(v3) = -[TSWPStorage firstHighlightForSelectionRange:outRange:](storage, "firstHighlightForSelectionRange:outRange:", v5, v6, 0) != 0;
      }
    }
  }
  return v3;
}

- (BOOL)canAddOrShowComment
{
  BOOL v3 = [(TSWPSelection *)self->_selection isValid];
  if (v3)
  {
    if ([(TSWPEditingController *)self canRemoveHighlightForCurrentSelection])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(TSWPEditingController *)self canHighlightCurrentSelection];
    }
  }
  return v3;
}

- (BOOL)canAcceptOrRejectChange
{
  return 0;
}

- (id)p_highlightSelectionForSelection:(id)a3
{
  if ([a3 isInsertionPoint]) {
    uint64_t v5 = [(TSWPStorage *)self->_storage rangeForSelectionWithInsertionSelection:a3];
  }
  else {
    uint64_t v5 = [a3 superRange];
  }

  return +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v5, v6);
}

- (void)beginAutomaticTextEditingIfNeededForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(TSWPEditingController *)self interactiveCanvasController];
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v5, "convertBoundsToUnscaledPoint:", x, y);
  id v6 = -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](v5, "hitRep:withGesture:passingTest:", 0, &__block_literal_global_783);
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v6 isEditing] & 1) == 0)
  {
    [(TSDInteractiveCanvasController *)v5 beginEditingRep:v6];
  }
}

BOOL __67__TSWPEditingController_beginAutomaticTextEditingIfNeededForPoint___block_invoke(uint64_t a1, void *a2)
{
  return (objc_opt_respondsToSelector() & 1) != 0 && ([a2 containsText] & 1) != 0;
}

- (BOOL)allowAutomaticTextEditingToBeginWithDifferentEditor
{
  if (![(TSWPSelection *)self->_selection isValid]) {
    return 1;
  }
  selection = self->_selection;

  return [(TSWPSelection *)selection isInsertionPoint];
}

- (unint64_t)closestCharIndexToPoint:(CGPoint)a3 isAtEndOfLine:(BOOL *)a4
{
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:", a3.x, a3.y);
  double v7 = v6;
  double v9 = v8;
  objc_opt_class();
  -[TSWPInteractiveCanvasController closestRepToPoint:forStorage:](self->_interactiveCanvasController, "closestRepToPoint:forStorage:", self->_storage, v7, v9);
  uint64_t v10 = (void *)TSUDynamicCast();
  objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:", v7, v9);

  return -[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:](self, "charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:", v10, 1, a4, 0);
}

- (unint64_t)p_charIndexAtPoint:(CGPoint)a3 isAtEndOfLine:(BOOL *)a4
{
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self->_interactiveCanvasController, "convertBoundsToUnscaledPoint:", a3.x, a3.y);
  double v7 = v6;
  double v9 = v8;
  objc_opt_class();
  -[TSWPInteractiveCanvasController closestRepToPoint:forStorage:](self->_interactiveCanvasController, "closestRepToPoint:forStorage:", self->_storage, v7, v9);
  uint64_t v10 = (void *)TSUDynamicCast();
  objc_msgSend(v10, "convertNaturalPointFromUnscaledCanvas:", v7, v9);

  return -[TSWPEditingController charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:", v10, 0, 1, a4);
}

- (BOOL)p_isCharIndex:(unint64_t)a3 withEolAffinity:(BOOL)a4 atBoundary:(int)a5 inDirection:(int64_t)a6
{
  BOOL v8 = a4;
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v11 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:");
  unint64_t v13 = v11 + v12;
  if (a3) {
    unint64_t v14 = a3 - (v11 + v12 == a3);
  }
  else {
    unint64_t v14 = 0;
  }
  if (v14 >= v13) {
    return 0;
  }
  uint64_t v15 = v11;
  switch(a5)
  {
    case 0:
      uint64_t v16 = objc_msgSend(-[TSWPStorage string](self->_storage, "string"), "rangeOfComposedCharacterSequenceAtIndex:", v14);
      goto LABEL_41;
    case 1:
      if ((unint64_t)a6 > 1)
      {
        int v44 = [(TSWPEditingController *)self p_writingDirectionForCharAtIndex:v14];
        uint64_t v45 = 2;
        if (v44 == 1) {
          uint64_t v45 = 3;
        }
        BOOL v20 = v45 == a6;
      }
      else
      {
        BOOL v20 = a6 == 0;
      }
      uint64_t v46 = v20;
      uint64_t v16 = [(TSWPEditingController *)self rangeOfWordEnclosingCharIndex:v14 backward:v46];
LABEL_41:
      CFIndex v19 = v16;
      CFIndex v18 = v17;
      goto LABEL_53;
    case 2:
      int v54 = a5;
      uint64_t v21 = v11;
      uint64_t v22 = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:a3];
      NSUInteger location = v22;
      NSUInteger length = v24;
      if (a3 && v22 == a3)
      {
        v62.NSUInteger location = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:a3 - 1];
        v62.NSUInteger length = v26;
        v61.NSUInteger location = location;
        v61.NSUInteger length = length;
        NSRange v27 = NSUnionRange(v61, v62);
        NSUInteger location = v27.location;
        NSUInteger length = v27.length;
      }
      CFAllocatorRef v28 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v29 = [(TSWPStorage *)self->_storage string];
      v63.NSUInteger location = location;
      v63.NSUInteger length = length;
      uint64_t v30 = CFStringTokenizerCreate(v28, v29, v63, 1uLL, 0);
      if (CFStringTokenizerGoToTokenAtIndex(v30, a3))
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v30);
        CFIndex v19 = CurrentTokenRange.location;
        CFIndex v18 = CurrentTokenRange.length;
      }
      else
      {
        CFIndex v19 = *MEMORY[0x263F7C7C8];
        CFIndex v18 = *(void *)(MEMORY[0x263F7C7C8] + 8);
      }
      uint64_t v15 = v21;
      CFRelease(v30);
      goto LABEL_45;
    case 3:
      CFIndex v19 = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:a3];
      if (v32) {
        CFIndex v18 = v32
      }
            - IsParagraphBreakingCharacter([(TSWPStorage *)self->_storage characterAtIndex:v32 + v19 - 1]);
      else {
        CFIndex v18 = 0;
      }
      goto LABEL_53;
    case 4:
      int v54 = a5;
      uint64_t v53 = v11;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      char v33 = objc_msgSend(-[TSWPEditingController p_layoutTargetForCharIndex:eolAffinity:](self, "p_layoutTargetForCharIndex:eolAffinity:", a3, v8), "columns");
      uint64_t v34 = [v33 countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (!v34)
      {
        CFIndex v18 = 0;
        CFIndex v19 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v15 = v53;
LABEL_45:
        a5 = v54;
        goto LABEL_53;
      }
      uint64_t v35 = v34;
      unint64_t v52 = a6;
      uint64_t v36 = *(void *)v56;
      while (2)
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v56 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          unint64_t v39 = objc_msgSend(v38, "range", v52);
          BOOL v41 = v14 < v39 || v14 - v39 >= v40;
          if (!v41 || v8 && v14 == v39 + v40)
          {
            unint64_t v42 = [v38 lineIndexForCharIndex:v14 eol:v8];
            if (v42 > 0x7FFFFFFFFFFFFFFELL)
            {
              CFIndex v18 = 0;
              CFIndex v19 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else
            {
              CGFloat v43 = (CFIndex *)[v38 lineFragmentAtIndex:v42];
              CFIndex v19 = *v43;
              CFIndex v18 = v43[1];
            }
            goto LABEL_48;
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v55 objects:v59 count:16];
        CFIndex v18 = 0;
        CFIndex v19 = 0x7FFFFFFFFFFFFFFFLL;
        if (v35) {
          continue;
        }
        break;
      }
LABEL_48:
      a5 = v54;
      a6 = v52;
      uint64_t v15 = v53;
      if (v54 != 5)
      {
LABEL_53:
        BOOL result = v19 + v18 == a3;
        if (v19 != a3 && v19 + v18 != a3) {
          return 0;
        }
        switch(a5)
        {
          case 0:
          case 2:
            if (a6 == 1)
            {
              if (v13 == a3) {
                return 0;
              }
            }
            else if (!a6 && v15 == a3)
            {
              return 0;
            }
            return (unint64_t)(a6 - 6) < 0xFFFFFFFFFFFFFFFELL;
          case 1:
          case 4:
            if ((unint64_t)a6 > 1)
            {
              int v50 = [(TSWPEditingController *)self p_writingDirectionForCharAtIndex:a3];
              uint64_t v48 = 2;
              if (v50 == 1) {
                uint64_t v48 = 3;
              }
              if (v19 == a3) {
                return (a6 & 0xFFFFFFFFFFFFFFFELL) == 2 && v48 != a6;
              }
            }
            else
            {
              uint64_t v48 = v19 == a3;
            }
            return v48 == a6;
          case 3:
            if (v15 == a3 && (unint64_t)a6 <= 5 && ((1 << a6) & 0x25) != 0
              || v13 == a3 && (unint64_t)a6 <= 4 && ((1 << a6) & 0x1A) != 0)
            {
              return 0;
            }
            if ((a6 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
              return v19 == a3;
            }
            if ((a6 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
              return result;
            }
            return 0;
          default:
            return 0;
        }
      }
      if (v53 == a3 && v52 <= 4 && ((1 << v52) & 0x1A) != 0) {
        return 1;
      }
      if (v13 != a3 || v52 >= 6) {
        return 0;
      }
      else {
        return (0x25u >> v52) & 1;
      }
    default:
      CFIndex v18 = v12;
      int v54 = a5;
      unint64_t v52 = a6;
      uint64_t v53 = v11;
      CFIndex v19 = v11;
      goto LABEL_48;
  }
}

- (id)p_layoutTargetForCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4
{
  uint64_t v5 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, a3, 0, 0, a4);
  uint64_t v11 = 0;
  CFIndex v12 = &v11;
  uint64_t v13 = 0x3052000000;
  unint64_t v14 = __Block_byref_object_copy__20;
  uint64_t v15 = __Block_byref_object_dispose__20;
  uint64_t v16 = 0;
  double v6 = [(TSWPEditingController *)self interactiveCanvasController];
  storage = self->_storage;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__TSWPEditingController_p_layoutTargetForCharIndex_eolAffinity___block_invoke;
  v10[3] = &unk_2646B1568;
  v10[4] = &v11;
  [(TSWPInteractiveCanvasController *)v6 withLayoutForModel:storage withSelection:v5 performBlock:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

id __64__TSWPEditingController_p_layoutTargetForCharIndex_eolAffinity___block_invoke(uint64_t a1)
{
  id result = (id)TSUProtocolCast();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (unint64_t)p_MoveByLineRange:(_NSRange)a3 up:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v8 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:");
  if (v4)
  {
    unint64_t v10 = location;
    if (location > v8)
    {
      unint64_t v10 = location - 1;
      uint64_t v11 = [(TSWPStorage *)self->_storage characterAtIndex:location - 1];
      int v12 = v11;
      char v13 = IsParagraphBreakingCharacter(v11);
      if (v12 != 8232
        && (v13 & 1) == 0
        && !objc_msgSend(-[TSWPStorage attachmentAtCharIndex:](self->_storage, "attachmentAtCharIndex:", location - 1), "isPartitioned"))
      {
        return location;
      }
    }
  }
  else
  {
    unint64_t v10 = location + length;
    BOOL v14 = v10 <= v8 || v10 >= v8 + v9;
    if (!v14
      && objc_msgSend(-[TSWPStorage attachmentAtCharIndex:](self->_storage, "attachmentAtCharIndex:", v10), "isPartitioned"))
    {
      uint64_t v15 = [(TSWPStorage *)self->_storage characterAtIndex:v10 - 1];
      int v16 = v15;
      LODWORD(v17) = IsParagraphBreakingCharacter(v15) ^ 1;
      if (v16 == 8232) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = v17;
      }
      v10 += v17;
    }
  }
  return v10;
}

- (unint64_t)p_lineIndexForCharIndex:(unint64_t)a3 column:(id *)a4 eol:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = [(TSWPEditingController *)self p_layoutTargetForCharIndex:a3 eolAffinity:a5];
  *a4 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = objc_msgSend(v8, "columns", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unint64_t v15 = [v14 range];
        if (a3 - v15 < v16 && a3 >= v15 || v15 + v16 == a3)
        {
          unint64_t result = [v14 lineIndexForCharIndex:a3 eol:v5];
          if (result <= 0x7FFFFFFFFFFFFFFELL)
          {
            *a4 = v14;
            return result;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)invalidateSelectionVisualRuns
{
  if ([(TSWPSelection *)self->_selection isVisual]
    && [(TSWPSelection *)self->_selection validVisualRanges])
  {
    unint64_t v3 = [(TSWPSelection *)self->_selection visualRangeCount];
    selection = self->_selection;
    if (v3 < 2)
    {
      uint64_t v7 = [(TSWPSelection *)self->_selection superRange];
      id v5 = -[TSWPSelection copyWithNewType:range:](selection, "copyWithNewType:range:", 0, v7, v8);
      uint64_t v6 = 0x800000;
    }
    else
    {
      id v5 = [(TSWPSelection *)self->_selection copyWithNewType:7];
      uint64_t v6 = 0;
    }
    id v9 = v5;
    [(TSWPEditingController *)self p_setSelection:v9 withFlags:v6 force:1];
  }
}

- (id)calculateVisualRunsFromSelection:(id)a3 updateControllerSelection:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (TSWPSelection *)a3;
  if (([a3 validVisualRanges] & 1) != 0 || -[TSWPSelection isInsertionPoint](v5, "isInsertionPoint")) {
    return v5;
  }
  v94[0] = 0;
  unint64_t v7 = [(TSWPSelection *)v5 start];
  if (v7 <= [(TSWPStorage *)self->_storage range]) {
    uint64_t v8 = [(TSWPStorage *)self->_storage range];
  }
  else {
    uint64_t v8 = [(TSWPSelection *)v5 start];
  }
  unint64_t v9 = v8;
  storage = self->_storage;
  unint64_t v11 = [(TSWPSelection *)v5 end];
  if (v11 >= [(TSWPStorage *)self->_storage characterCount]) {
    uint64_t v12 = [(TSWPStorage *)self->_storage characterCount];
  }
  else {
    uint64_t v12 = [(TSWPSelection *)v5 end];
  }
  unint64_t v13 = [(TSWPStorage *)storage previousCharacterIndex:v12];
  memset(&v93, 0, sizeof(v93));
  BOOL v14 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:v9 column:v94 eol:0];
  unint64_t v15 = 0;
  if ([(TSWPSelection *)v5 type] == 7 && v14)
  {
    if ([(TSWPSelection *)v5 isRange])
    {
      unint64_t v16 = TSWPLineFragment::visualIndexForCharIndex(v14, v9);
      [(TSWPSelection *)v5 range];
      if (!v17)
      {
        unint64_t v13 = [(TSWPSelection *)v5 end];
        unint64_t v85 = v9;
        unint64_t v15 = v14;
        goto LABEL_97;
      }
      CFIndex v18 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:v13 column:v94 eol:0];
      unint64_t v15 = v18;
      if (v18)
      {
        unint64_t v19 = TSWPLineFragment::visualIndexForCharIndex(v18, v13);
        __p = 0;
        double v91 = 0;
        uint64_t v92 = 0;
        TSWPLineFragment::fillWritingDirectionRuns((uint64_t *)v14, &__p);
        long long v20 = (char *)__p;
        long long v21 = v91;
        BOOL v79 = v4;
        if (__p == v91)
        {
          long long v21 = (char *)__p;
          if ((*((_DWORD *)v14 + 6) & 0x800) != 0)
          {
            long long v22 = *(_OWORD *)v14;
            BOOL v89 = (*((_DWORD *)v14 + 6) & 0x1000) == 0;
            long long v88 = v22;
            _NSRange v87 = (_NSRange)vdupq_lane_s64(v22, 0);
            std::vector<TSWPLFWritingDirectionRun>::push_back[abi:nn180100](&__p, (long long *)&v87);
            long long v20 = (char *)__p;
            long long v21 = v91;
          }
        }
        double v82 = v14;
        CGFloat v83 = (uint64_t *)v15;
        BOOL v23 = v14 == v15;
        BOOL v24 = v16 > v19;
        BOOL v25 = !v23 || !v24;
        if (v23 && v24) {
          unint64_t v26 = v13;
        }
        else {
          unint64_t v26 = v9;
        }
        unint64_t v85 = v26;
        if (!v25) {
          unint64_t v13 = v9;
        }
        if (v21 != v20)
        {
          uint64_t v27 = 0;
          int v28 = 0;
          int v29 = 0;
          BOOL v30 = v14 == (TSWPLineFragment *)v83;
          __int16 v84 = *((_DWORD *)v14 + 6);
          if ((*((_DWORD *)v14 + 6) & 0x1000) == 0) {
            BOOL v30 = 1;
          }
          BOOL v80 = v14 != (TSWPLineFragment *)v83;
          BOOL v81 = v30;
          unsigned int v31 = 1;
          while (1)
          {
            uint64_t v32 = &v20[40 * v27];
            NSUInteger v34 = *((void *)v32 + 2);
            NSUInteger v33 = *((void *)v32 + 3);
            v86.NSUInteger location = v34;
            v86.NSUInteger length = v33;
            BOOL v35 = v85 < v34 || v85 - v34 >= v33;
            BOOL v36 = !v35;
            if (v36) {
              break;
            }
LABEL_51:
            if (v13 >= v34 && v13 - v34 < v33)
            {
              if (*((unsigned char *)__p + 40 * v27 + 32))
              {
                uint64_t v45 = self->_storage;
                if (v36)
                {
                  unint64_t v46 = [(TSWPStorage *)v45 nextCharacterIndex:v13];
                  NSUInteger v47 = v85;
                  if (v85 <= v46) {
                    unint64_t v48 = v46;
                  }
                  else {
                    unint64_t v48 = v85;
                  }
                  if (v85 >= v46) {
                    NSUInteger v47 = v46;
                  }
                }
                else
                {
                  unint64_t v50 = [(TSWPStorage *)v45 nextCharacterIndex:v13];
                  if (v34 <= v50) {
                    unint64_t v48 = v50;
                  }
                  else {
                    unint64_t v48 = v34;
                  }
                  if (v34 >= v50) {
                    NSUInteger v47 = v50;
                  }
                  else {
                    NSUInteger v47 = v34;
                  }
                }
LABEL_75:
                NSUInteger v51 = v48 - v47;
                v86.NSUInteger location = v47;
              }
              else
              {
                if (v36)
                {
                  unint64_t v49 = [(TSWPStorage *)self->_storage nextCharacterIndex:v85];
                  if (v13 <= v49) {
                    unint64_t v48 = v49;
                  }
                  else {
                    unint64_t v48 = v13;
                  }
                  if (v13 >= v49) {
                    NSUInteger v47 = v49;
                  }
                  else {
                    NSUInteger v47 = v13;
                  }
                  goto LABEL_75;
                }
                if (v13 <= v33 + v34) {
                  unint64_t v53 = v33 + v34;
                }
                else {
                  unint64_t v53 = v13;
                }
                if (v13 >= v33 + v34) {
                  NSUInteger v54 = v33 + v34;
                }
                else {
                  NSUInteger v54 = v13;
                }
                NSUInteger v51 = v53 - v54;
                v86.NSUInteger location = v54;
              }
              v86.NSUInteger length = v51;
              int v29 = 1;
            }
            if ((v84 & 0x1000) != 0)
            {
              if (((v29 | v28) & 1) != 0 || v82 != (TSWPLineFragment *)v83) {
                TSWPRangeVector::addRange(&v93, &v86);
              }
              if ((v28 & v80 | v29))
              {
LABEL_110:
                if ((v29 & 1) == 0) {
                  goto LABEL_111;
                }
                goto LABEL_161;
              }
            }
            else
            {
              if (v28) {
                TSWPRangeVector::addRange(&v93, &v86);
              }
              if (v29) {
                goto LABEL_161;
              }
            }
            uint64_t v27 = v31;
            long long v20 = (char *)__p;
            BOOL v52 = 0xCCCCCCCCCCCCCCCDLL * ((v91 - (unsigned char *)__p) >> 3) > v31++;
            if (!v52) {
              goto LABEL_110;
            }
          }
          int v37 = v20[40 * v27 + 32];
          if (v81)
          {
            if (!v37) {
              goto LABEL_37;
            }
          }
          else if (v37)
          {
LABEL_37:
            unint64_t v38 = [(TSWPStorage *)self->_storage nextCharacterIndex:v85];
            if (v34 <= v38) {
              unint64_t v39 = v38;
            }
            else {
              unint64_t v39 = v34;
            }
            if (v34 >= v38) {
              NSUInteger v40 = v38;
            }
            else {
              NSUInteger v40 = v34;
            }
            NSUInteger v41 = v39 - v40;
            v86.NSUInteger location = v40;
LABEL_50:
            v86.NSUInteger length = v41;
            int v28 = 1;
            goto LABEL_51;
          }
          NSUInteger v42 = v85;
          if (v85 <= v33 + v34) {
            NSUInteger v43 = v33 + v34;
          }
          else {
            NSUInteger v43 = v85;
          }
          if (v85 >= v33 + v34) {
            NSUInteger v42 = v33 + v34;
          }
          NSUInteger v41 = v43 - v42;
          v86.NSUInteger location = v42;
          goto LABEL_50;
        }
LABEL_111:
        NSUInteger v59 = *((void *)v82 + 1) + *(void *)v82;
        if (v59 <= *v83) {
          uint64_t v60 = *v83;
        }
        else {
          uint64_t v60 = *((void *)v82 + 1) + *(void *)v82;
        }
        if (v59 >= *v83) {
          NSUInteger v59 = *v83;
        }
        v87.NSUInteger location = v59;
        v87.NSUInteger length = v60 - v59;
        TSWPRangeVector::addRange(&v93, &v87);
        double v91 = (char *)__p;
        TSWPLineFragment::fillWritingDirectionRuns(v83, &__p);
        NSRange v61 = (char *)__p;
        NSRange v62 = v91;
        if (__p == v91)
        {
          if ((v83[3] & 0x800) == 0) {
            goto LABEL_161;
          }
          long long v63 = *(_OWORD *)v83;
          BOOL v89 = (v83[3] & 0x1000) == 0;
          long long v88 = v63;
          _NSRange v87 = (_NSRange)vdupq_lane_s64(v63, 0);
          std::vector<TSWPLFWritingDirectionRun>::push_back[abi:nn180100](&__p, (long long *)&v87);
          NSRange v61 = (char *)__p;
          NSRange v62 = v91;
        }
        if (v62 != v61)
        {
          uint64_t v64 = 0;
          char v65 = 0;
          int v66 = *((_DWORD *)v83 + 6);
          unsigned int v67 = 1;
          while (1)
          {
            uint64_t v68 = &v61[40 * v64];
            NSUInteger v70 = *((void *)v68 + 2);
            NSUInteger v69 = *((void *)v68 + 3);
            v86.NSUInteger location = v70;
            v86.NSUInteger length = v69;
            if (v13 >= v70 && v13 - v70 < v69) {
              break;
            }
            if ((v66 & 0x1000) == 0) {
              goto LABEL_150;
            }
            if (v65) {
              goto LABEL_159;
            }
LABEL_151:
            char v65 = 0;
LABEL_160:
            uint64_t v64 = v67;
            NSRange v61 = (char *)__p;
            BOOL v52 = 0xCCCCCCCCCCCCCCCDLL * ((v91 - (unsigned char *)__p) >> 3) > v67++;
            if (!v52) {
              goto LABEL_161;
            }
          }
          int v72 = v61[40 * v64 + 32];
          if ((v66 & 0x1000) != 0)
          {
            if (v72)
            {
              NSUInteger v76 = v69 + v70;
              if (v13 <= v69 + v70) {
                unint64_t v77 = v69 + v70;
              }
              else {
                unint64_t v77 = v13;
              }
              if (v13 < v69 + v70) {
                NSUInteger v76 = v13;
              }
            }
            else
            {
              unint64_t v78 = [(TSWPStorage *)self->_storage nextCharacterIndex:v13];
              if (v70 <= v78) {
                unint64_t v77 = v78;
              }
              else {
                unint64_t v77 = v70;
              }
              if (v70 >= v78) {
                NSUInteger v76 = v78;
              }
              else {
                NSUInteger v76 = v70;
              }
            }
            v86.NSUInteger location = v76;
            v86.NSUInteger length = v77 - v76;
LABEL_159:
            TSWPRangeVector::addRange(&v93, &v86);
            char v65 = 1;
            goto LABEL_160;
          }
          if (v72)
          {
            unint64_t v73 = [(TSWPStorage *)self->_storage nextCharacterIndex:v13];
            if (v70 <= v73) {
              unint64_t v74 = v73;
            }
            else {
              unint64_t v74 = v70;
            }
            if (v70 >= v73) {
              NSUInteger v75 = v73;
            }
            else {
              NSUInteger v75 = v70;
            }
          }
          else
          {
            NSUInteger v75 = v69 + v70;
            if (v13 <= v69 + v70) {
              unint64_t v74 = v69 + v70;
            }
            else {
              unint64_t v74 = v13;
            }
            if (v13 < v69 + v70) {
              NSUInteger v75 = v13;
            }
          }
          v86.NSUInteger location = v75;
          v86.NSUInteger length = v74 - v75;
          char v65 = 1;
LABEL_150:
          TSWPRangeVector::addRange(&v93, &v86);
          if (v65) {
            goto LABEL_161;
          }
          goto LABEL_151;
        }
LABEL_161:
        if (__p)
        {
          double v91 = (char *)__p;
          operator delete(__p);
        }
        BOOL v4 = v79;
        BOOL v14 = v82;
        unint64_t v15 = (TSWPLineFragment *)v83;
        goto LABEL_97;
      }
    }
    else
    {
      unint64_t v15 = 0;
    }
  }
  unint64_t v85 = v9;
LABEL_97:
  if (v93.__end_ == v93.__begin_)
  {
    if ([(TSWPSelection *)v5 isVisual] && [(TSWPSelection *)v5 isRange]) {
      long long v55 = [(TSWPSelection *)v5 copyWithNewType:0];
    }
    else {
      long long v55 = v5;
    }
  }
  else
  {
    long long v55 = [(TSWPSelection *)v5 copyWithVisualRanges:&v93 startChar:v85 endChar:v13 rightToLeft:[(TSWPStorage *)self->_storage isWritingDirectionRightToLeftForParagraphAtCharIndex:[(TSWPSelection *)v5 start]] sameLine:v14 == v15];
  }
  id v5 = v55;
  if (v4 && [(TSWPSelection *)self->_selection isEqual:v55])
  {
    long long v56 = v5;

    self->_selection = v5;
  }
  long long v57 = v5;
  if (v93.__begin_)
  {
    v93.__end_ = v93.__begin_;
    operator delete(v93.__begin_);
  }
  return v5;
}

- (id)logicalToVisualSelection:(id)a3
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layoutIfNeeded];
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  NSUInteger v5 = [a3 start];
  uint64_t v6 = [a3 end];
  NSUInteger v42 = self;
  unint64_t v7 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v5, &v47, [a3 caretAffinity] == 1);
  if ([a3 type] || !v7) {
    goto LABEL_60;
  }
  [a3 range];
  if (!v8)
  {
    a3 = (id)[a3 copyWithNewType:7];
    goto LABEL_60;
  }
  NSUInteger location = v6 - 1;
  uint64_t v10 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:location column:&v46 eol:1];
  if (!v10) {
    goto LABEL_60;
  }
  unint64_t v11 = (uint64_t *)v10;
  NSUInteger v12 = [a3 range];
  NSUInteger v14 = v13;
  __p = 0;
  int v44 = 0;
  uint64_t v45 = 0;
  if (v7 == v11)
  {
    TSWPLineFragment::fillWritingDirectionRuns(v7, &__p);
    long long v22 = __p;
    if (v44 == __p) {
      goto LABEL_45;
    }
    uint64_t v23 = 0;
    char v24 = 0;
    unsigned int v25 = 1;
    while (1)
    {
      v49.NSUInteger location = v12;
      v49.NSUInteger length = v14;
      NSRange v26 = NSIntersectionRange(*(NSRange *)&v22[40 * v23 + 16], v49);
      long long v22 = __p;
      if ((v24 & 1) == 0 && v26.length)
      {
        if (!*((unsigned char *)__p + 40 * v23 + 32))
        {
          NSUInteger v5 = [(TSWPStorage *)v42->_storage previousCharacterIndex:v26.location + v26.length];
          char v24 = 1;
          long long v22 = __p;
LABEL_23:
          if (v26.length)
          {
            if (v22[40 * v23 + 32])
            {
              NSUInteger location = [(TSWPStorage *)v42->_storage previousCharacterIndex:v26.location + v26.length];
              long long v22 = __p;
            }
            else
            {
              NSUInteger location = v26.location;
            }
          }
          goto LABEL_28;
        }
        char v24 = 1;
        NSUInteger v5 = v26.location;
      }
      if (v24) {
        goto LABEL_23;
      }
LABEL_28:
      uint64_t v23 = v25;
      BOOL v21 = 0xCCCCCCCCCCCCCCCDLL * ((v44 - v22) >> 3) > v25++;
      if (!v21) {
        goto LABEL_45;
      }
    }
  }
  TSWPLineFragment::fillWritingDirectionRuns(v7, &__p);
  NSUInteger v41 = v11;
  unint64_t v15 = v44;
  if (v44 == __p) {
    goto LABEL_33;
  }
  uint64_t v16 = 0;
  int v17 = *((_DWORD *)v7 + 6);
  unsigned int v18 = 1;
  unint64_t v15 = (char *)__p;
  while (1)
  {
    v48.NSUInteger location = v12;
    v48.NSUInteger length = v14;
    NSRange v20 = NSIntersectionRange(*(NSRange *)&v15[40 * v16 + 16], v48);
    NSUInteger v19 = v20.location;
    if (v20.length) {
      break;
    }
LABEL_13:
    uint64_t v16 = v18;
    unint64_t v15 = (char *)__p;
    BOOL v21 = 0xCCCCCCCCCCCCCCCDLL * ((v44 - (unsigned char *)__p) >> 3) > v18++;
    if (!v21) {
      goto LABEL_33;
    }
  }
  unint64_t v15 = (char *)__p;
  if ((v17 & 0x1000) != 0)
  {
    if (*((unsigned char *)__p + 40 * v16 + 32)) {
      NSUInteger v19 = [(TSWPStorage *)v42->_storage previousCharacterIndex:v20.location + v20.length];
    }
    NSUInteger v5 = v19;
    goto LABEL_13;
  }
  if (*((unsigned char *)__p + 40 * v16 + 32))
  {
    NSUInteger v5 = v20.location;
  }
  else
  {
    NSUInteger v5 = [(TSWPStorage *)v42->_storage previousCharacterIndex:v20.location + v20.length];
    unint64_t v15 = (char *)__p;
  }
LABEL_33:
  int v44 = v15;
  TSWPLineFragment::fillWritingDirectionRuns(v41, &__p);
  uint64_t v27 = (char *)__p;
  if (v44 == __p) {
    goto LABEL_45;
  }
  uint64_t v28 = 0;
  int v29 = *((_DWORD *)v41 + 6);
  unsigned int v30 = 1;
  while (2)
  {
    v50.NSUInteger location = v12;
    v50.NSUInteger length = v14;
    NSRange v32 = NSIntersectionRange(*(NSRange *)&v27[40 * v28 + 16], v50);
    NSUInteger v31 = v32.location;
    if (!v32.length)
    {
LABEL_40:
      uint64_t v28 = v30;
      uint64_t v27 = (char *)__p;
      BOOL v21 = 0xCCCCCCCCCCCCCCCDLL * ((v44 - (unsigned char *)__p) >> 3) > v30++;
      if (!v21) {
        goto LABEL_45;
      }
      continue;
    }
    break;
  }
  if ((v29 & 0x1000) == 0)
  {
    if (*((unsigned char *)__p + 40 * v28 + 32)) {
      NSUInteger v31 = [(TSWPStorage *)v42->_storage previousCharacterIndex:v32.location + v32.length];
    }
    NSUInteger location = v31;
    goto LABEL_40;
  }
  if (!*((unsigned char *)__p + 40 * v28 + 32)) {
    NSUInteger v31 = [(TSWPStorage *)v42->_storage previousCharacterIndex:v32.location + v32.length];
  }
  NSUInteger location = v31;
LABEL_45:
  storage = v42->_storage;
  if (v5 <= location)
  {
    unint64_t v37 = [(TSWPStorage *)storage nextCharacterIndex:location];
    if (v5 <= v37) {
      unint64_t v35 = v37;
    }
    else {
      unint64_t v35 = v5;
    }
    if (v5 >= v37) {
      unint64_t v36 = v37;
    }
    else {
      unint64_t v36 = v5;
    }
  }
  else
  {
    unint64_t v34 = [(TSWPStorage *)storage nextCharacterIndex:v5];
    if (location <= v34) {
      unint64_t v35 = v34;
    }
    else {
      unint64_t v35 = location;
    }
    if (location >= v34) {
      unint64_t v36 = v34;
    }
    else {
      unint64_t v36 = location;
    }
  }
  a3 = (id)objc_msgSend(a3, "copyWithNewVisualTypeRange:head:tail:", v36, v35 - v36, v5, location);
  if (__p)
  {
    int v44 = (char *)__p;
    operator delete(__p);
  }
LABEL_60:
  if (!a3)
  {
    unint64_t v38 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v39 = [NSString stringWithUTF8String:"-[TSWPEditingController logicalToVisualSelection:]"];
    objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 12066, @"invalid nil value for '%s'", "result");
  }
  return a3;
}

- (const)p_lineFragmentForCharIndex:(unint64_t)a3 column:(id *)a4 eol:(BOOL)a5
{
  unint64_t v6 = [(TSWPEditingController *)self p_lineIndexForCharIndex:a3 column:a4 eol:a5];
  if ([*a4 countLines]) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 == 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!v7)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPEditingController p_lineFragmentForCharIndex:column:eol:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 12073, @"Empty column returned from p_lineIndexForCharIndex");
  }
  if (v6 >= [*a4 countLines]) {
    return 0;
  }
  id v10 = *a4;

  return (const void *)[v10 lineFragmentAtIndex:v6];
}

- (const)p_lastVisibleLineFragmentForCharIndex:(unint64_t)a3 eol:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v4 = objc_msgSend((id)objc_msgSend(-[TSWPEditingController p_layoutTargetForCharIndex:eolAffinity:](self, "p_layoutTargetForCharIndex:eolAffinity:", a3, a4), "columns"), "reverseObjectEnumerator");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t result = (const void *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    unint64_t v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if ([v9 countLines]) {
          return (const void *)objc_msgSend(v9, "lineFragmentAtIndex:", objc_msgSend(v9, "countLines") - 1);
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      unint64_t result = (const void *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      unint64_t v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (const)p_nearestLineFragmentWithSameVerticalPositionAs:(unint64_t)a3 xPos:(double)a4 inColumn:(id)a5
{
  objc_msgSend(a5, "boundsOfLineFragmentAtIndex:");
  double MinY = CGRectGetMinY(v22);
  do
  {
    unint64_t v9 = a3;
    if (!a3) {
      break;
    }
    --a3;
    [a5 boundsOfLineFragmentAtIndex:v9 - 1];
  }
  while (CGRectGetMinY(v23) >= MinY);
  unint64_t v10 = [a5 countLines];
  if (v9 < v10)
  {
    unint64_t v11 = v10;
    double v12 = INFINITY;
    unint64_t v13 = v9;
    do
    {
      [a5 boundsOfLineFragmentAtIndex:v13];
      CGFloat x = v24.origin.x;
      CGFloat y = v24.origin.y;
      CGFloat width = v24.size.width;
      CGFloat height = v24.size.height;
      if (MinY != CGRectGetMinY(v24)) {
        break;
      }
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      double v18 = vabdd_f64(a4, CGRectGetMinX(v25));
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      double v19 = vabdd_f64(a4, CGRectGetMaxX(v26));
      if (v19 >= v18) {
        double v19 = v18;
      }
      if (v19 < v12)
      {
        double v12 = v19;
        unint64_t v9 = v13;
      }
      ++v13;
    }
    while (v13 < v11);
  }

  return (const void *)[a5 lineFragmentAtIndex:v9];
}

- (unint64_t)charIndexByMovingPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5 preferPosition:(double *)a6
{
  unint64_t v11 = [a3 charIndex];
  if (a6)
  {
    [a3 preferredPosition];
    *a6 = v12;
  }
  char v21 = 0;
  uint64_t v13 = [a3 charIndex];
  char v22 = [a3 endOfLineAffinity];
  unint64_t v14 = [(TSWPEditingController *)self p_charIndexByMovingCharIndex:v13 withEolAffinity:&v22 toBoundary:a4 inDirection:a5 preferPosition:a6 isLeadingEdge:&v21];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v15 = v14;
    uint64_t v16 = [TSWPSelection alloc];
    uint64_t v17 = [a3 endOfLineAffinity];
    LOBYTE(v20) = v21;
    double v18 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v16, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, v15, 0, 0, v17, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), v20, self->_storage);
    unint64_t v11 = [(TSWPSelection *)v18 leadingCharIndex];
  }
  return v11;
}

- (unint64_t)p_charIndexByMovingCharIndex:(unint64_t)a3 withEolAffinity:(BOOL *)a4 toBoundary:(int)a5 inDirection:(int64_t)a6 preferPosition:(double *)a7 isLeadingEdge:(BOOL *)a8
{
  unint64_t v15 = *MEMORY[0x263F7C7C8];
  CFIndex v114 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  unint64_t v16 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:");
  unint64_t v18 = v16 + v17;
  if (a8) {
    *a8 = 1;
  }
  if (v18 < a3) {
    goto LABEL_4;
  }
  switch(a5)
  {
    case 0:
      int64_t v20 = a6;
      unint64_t v23 = [(TSWPEditingController *)self charIndexMovingByCharacterFromCharIndex:[(TSWPEditingController *)self p_layoutOrderCharIndexForCaretCharIndex:a3 inDirection:a6] inDirection:a6];
      goto LABEL_28;
    case 1:
      int64_t v20 = a6;
      unint64_t v23 = [(TSWPEditingController *)self charIndexMovingByWordFromCharIndex:[(TSWPEditingController *)self p_layoutOrderCharIndexForCaretCharIndex:a3 inDirection:a6] inDirection:a6];
LABEL_28:
      unint64_t v19 = [(TSWPEditingController *)self p_caretCharIndexForLayoutOrderCharIndex:v23 inDirection:a6];
      goto LABEL_6;
    case 2:
      unint64_t v33 = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:a3];
      unint64_t v35 = a6 & 0xFFFFFFFFFFFFFFFDLL;
      if (v33 <= v18) {
        unint64_t v36 = v18;
      }
      else {
        unint64_t v36 = v33;
      }
      if (v33 >= v18) {
        CFIndex v37 = v18;
      }
      else {
        CFIndex v37 = v33;
      }
      CFIndex v38 = v36 - v37;
      CFIndex v39 = v33 + v34;
      if (v16 <= v33 + v34) {
        unint64_t v40 = v33 + v34;
      }
      else {
        unint64_t v40 = v16;
      }
      if (v16 < v33 + v34) {
        CFIndex v39 = v16;
      }
      CFIndex v41 = v40 - v39;
      if (v35 == 1) {
        CFIndex v42 = v39;
      }
      else {
        CFIndex v42 = v37;
      }
      if (v35 == 1) {
        CFIndex v43 = v41;
      }
      else {
        CFIndex v43 = v38;
      }
      CFAllocatorRef v44 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v45 = [(TSWPStorage *)self->_storage string];
      v117.CFIndex location = v42;
      v117.CFIndex length = v43;
      uint64_t v46 = CFStringTokenizerCreate(v44, v45, v117, 1uLL, 0);
      if (CFStringTokenizerGoToTokenAtIndex(v46, a3))
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v46);
        if (v35)
        {
          BOOL v85 = v35 == 1;
          int64_t v20 = a6;
          CFIndex v21 = v114;
          if (!v85) {
            goto LABEL_94;
          }
          CFRange v49 = CFStringTokenizerGetCurrentTokenRange(v46);
          CFIndex length = v49.length;
          CFIndex location = v49.location;
          if (a3 > LODWORD(v49.location)) {
            goto LABEL_95;
          }
LABEL_73:
          unint64_t v62 = a3;
          do
          {
            unint64_t v63 = v62 - 1;
            if (v62 <= v16) {
              break;
            }
            CFStringTokenizerTokenType v64 = CFStringTokenizerGoToTokenAtIndex(v46, v62 - 1);
            unint64_t v62 = v63;
          }
          while (!v64);
          if (v63 <= v16)
          {
            unint64_t v19 = v16;
            goto LABEL_101;
          }
          goto LABEL_94;
        }
        CFIndex location = CurrentTokenRange.location;
        CFIndex v73 = CurrentTokenRange.length;
        int64_t v20 = a6;
        CFIndex v21 = v114;
        if (CurrentTokenRange.location + CurrentTokenRange.length != (int)a3) {
          goto LABEL_94;
        }
        goto LABEL_93;
      }
      if (!v35)
      {
        CFIndex v73 = 0;
        CFIndex location = -1;
        int64_t v20 = a6;
        CFIndex v21 = v114;
LABEL_93:
        if (CFStringTokenizerAdvanceToNextToken(v46))
        {
LABEL_94:
          CFRange v72 = CFStringTokenizerGetCurrentTokenRange(v46);
          CFIndex length = v72.length;
          CFIndex location = v72.location;
LABEL_95:
          CFIndex v73 = length;
          goto LABEL_98;
        }
        goto LABEL_96;
      }
      BOOL v85 = v35 == 1;
      int64_t v20 = a6;
      CFIndex v21 = v114;
      if (v85) {
        goto LABEL_73;
      }
      CFIndex v73 = 0;
      CFIndex location = -1;
LABEL_96:
      if (v18 == a3)
      {
        CFIndex v21 = 0;
        unint64_t v15 = v18;
      }
LABEL_98:
      if (location != -1)
      {
        CFIndex v21 = v73;
        unint64_t v15 = location;
      }
      unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_101:
      CFRelease(v46);
LABEL_7:
      switch(v20)
      {
        case 0:
        case 2:
          if (v15 <= a3) {
            CFIndex v22 = v21;
          }
          else {
            CFIndex v22 = 0;
          }
          unint64_t v19 = v22 + v15;
          break;
        case 1:
        case 3:
          if (v15 + v21 >= a3) {
            unint64_t v19 = v15;
          }
          else {
            unint64_t v19 = v15 + v21;
          }
          break;
        default:
          break;
      }
      if (v18 >= v19) {
        unint64_t v24 = v19;
      }
      else {
        unint64_t v24 = v18;
      }
      if (v24 <= v16) {
        unint64_t v24 = v16;
      }
      if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        return v24;
      }
    case 3:
      unint64_t v52 = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:a3];
      if (v51) {
        uint64_t v53 = v51
      }
            - IsParagraphBreakingCharacter([(TSWPStorage *)self->_storage characterAtIndex:v52 + v51 - 1]);
      else {
        uint64_t v53 = 0;
      }
      int64_t v20 = a6;
      int64_t v65 = a6;
      int v66 = (unint64_t *)MEMORY[0x263F7C7C8];
      switch(v65)
      {
        case 0:
        case 2:
          if (v53 + v52 == a3 && v53 + v52 < v18)
          {
            unint64_t v52 = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:a3 + 1];
            if (v68) {
              uint64_t v53 = v68
            }
                  - IsParagraphBreakingCharacter([(TSWPStorage *)self->_storage characterAtIndex:v68 + v52 - 1]);
            else {
              uint64_t v53 = 0;
            }
          }
          break;
        case 1:
        case 3:
          if (v52 == a3 && v52 > v16)
          {
            unint64_t v52 = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:a3 - 1];
            uint64_t v53 = v69 - 1;
          }
          break;
        default:
          break;
      }
      unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
      if (v52 != 0x7FFFFFFFFFFFFFFFLL)
      {
        switch(v20)
        {
          case 0:
          case 2:
            unint64_t v19 = v52 + v53;
            break;
          case 1:
          case 3:
            unint64_t v19 = v52;
            break;
          default:
            break;
        }
      }
      unint64_t v15 = *v66;
      CFIndex v21 = v66[1];
      goto LABEL_7;
    case 4:
      [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layoutIfNeeded];
      if ((unint64_t)a6 < 4)
      {
        id v116 = 0;
        NSUInteger v54 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:a3 column:&v116 eol:*a4];
        unint64_t v19 = v18;
        if (!v54) {
          goto LABEL_5;
        }
        long long v55 = v54;
        switch(a6)
        {
          case 1:
            unint64_t v19 = *v54;
            goto LABEL_5;
          case 2:
            unint64_t v19 = TSWPLineFragment::rightMostCharIndex((TSWPLineFragment *)v54);
            if (a8)
            {
              if (!TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v55, v19)
                && v19 < [(TSWPStorage *)self->_storage length])
              {
                uint64_t v77 = [(TSWPStorage *)self->_storage characterAtIndex:v19];
                int v78 = v77;
                char v79 = IsParagraphBreakingCharacter(v77);
                if (v78 != 8232 && (v79 & 1) == 0) {
                  *a8 = 0;
                }
              }
            }
            LOBYTE(v59) = (v55[3] & 0x1000) == 0;
            break;
          case 3:
            unint64_t v19 = TSWPLineFragment::leftMostCharIndex((TSWPLineFragment *)v54);
            if (a8)
            {
              if (TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v55, v19) == 1
                && v19 < [(TSWPStorage *)self->_storage length])
              {
                uint64_t v56 = [(TSWPStorage *)self->_storage characterAtIndex:v19];
                int v57 = v56;
                char v58 = IsParagraphBreakingCharacter(v56);
                if (v57 != 8232 && (v58 & 1) == 0) {
                  *a8 = 0;
                }
              }
            }
            BOOL v59 = (*((_DWORD *)v55 + 6) >> 12) & 1;
            break;
          default:
            unint64_t v80 = [(TSWPStorage *)self->_storage charIndexRemappedFromStorage:v54[1] + *v54];
            unint64_t v19 = v80;
            if (v80 > v16 && v80 > a3)
            {
              uint64_t v82 = [(TSWPStorage *)self->_storage characterAtIndex:v80 - 1];
              int v83 = v82;
              int v84 = IsParagraphBreakingCharacter(v82);
              BOOL v85 = v83 != 8232 && v84 == 0;
              if (!v85) {
                unint64_t v19 = [(TSWPStorage *)self->_storage previousCharacterIndex:v19];
              }
            }
            goto LABEL_5;
        }
        *a4 = v59;
        goto LABEL_5;
      }
      if ((unint64_t)(a6 - 4) > 1)
      {
        uint64_t v70 = [MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v71 = [NSString stringWithUTF8String:"-[TSWPEditingController p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:]"];
        uint64_t v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"];
        int v29 = @"Unsupported horizontal line direction";
        unsigned int v30 = (void *)v70;
        uint64_t v31 = v71;
        uint64_t v32 = 12364;
LABEL_26:
        [v30 handleFailureInFunction:v31 file:v28 lineNumber:v32 description:v29];
LABEL_4:
        unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_5:
        int64_t v20 = a6;
        goto LABEL_6;
      }
      if (a7) {
        double v61 = *a7;
      }
      else {
        double v61 = NAN;
      }
      int64_t v20 = a6;
      id v116 = 0;
      unint64_t v74 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:a3 column:&v116 eol:*a4];
      CGFloat v113 = v74;
      if (v74)
      {
        int64_t v20 = a6;
        unint64_t v75 = -[TSWPEditingController p_MoveByLineRange:up:](self, "p_MoveByLineRange:up:", *(void *)v74, *((void *)v74 + 1), a6 == 4);
      }
      else if (a6 == 4)
      {
        NSUInteger v76 = [(TSWPEditingController *)self p_lastVisibleLineFragmentForCharIndex:a3 eol:*a4];
        if (!v76)
        {
          unint64_t v75 = 0;
LABEL_135:
          id v115 = 0;
          unint64_t v86 = [(TSWPEditingController *)self p_lineIndexForCharIndex:v75 column:&v115 eol:v20 == 4];
          if (v86 <= 0x7FFFFFFFFFFFFFFELL)
          {
            unint64_t v87 = v86;
            uint64_t v88 = [v115 lineFragmentAtIndex:v86];
            id v89 = v115;
            if (v113 && v88 && v113 != (TSWPLineFragment *)v88 && v115 == v116)
            {
              for (double i = *((double *)v113 + 7); i == *(double *)(v88 + 56); double i = *((double *)v113 + 7))
              {
                unint64_t v75 = -[TSWPEditingController p_MoveByLineRange:up:](self, "p_MoveByLineRange:up:", *(void *)v88, *(void *)(v88 + 8), v20 == 4);
                unint64_t v87 = [(TSWPEditingController *)self p_lineIndexForCharIndex:v75 column:&v115 eol:v20 == 4];
                uint64_t v88 = [v115 lineFragmentAtIndex:v87];
                id v89 = v115;
                BOOL v104 = v75 == v18 || v75 == v16;
                if (v104 || v115 != v116) {
                  break;
                }
              }
            }
            BOOL v90 = v87 > 0x7FFFFFFFFFFFFFFELL || v89 == 0;
            if (v90
              || ([v89 frameBounds],
                  double v92 = v61 + v91,
                  (TSWPRangeVector v93 = [(TSWPEditingController *)self p_nearestLineFragmentWithSameVerticalPositionAs:v87 xPos:v115 inColumn:v92]) == 0))
            {
              if (v75 <= a3 || v20 == 4) {
                unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v19 = v75;
              }
              goto LABEL_6;
            }
            NSUInteger v94 = v93;
            if (v93 != v113 && (v115 != v116 || v113 && *((double *)v113 + 7) != *((double *)v93 + 7)))
            {
              if (*a4)
              {
                uint64_t v95 = *(void *)v93;
                uint64_t v96 = *((void *)v93 + 1);
                if (v96)
                {
                  uint64_t v97 = [(TSWPStorage *)self->_storage characterAtIndex:v95 + v96 - 1];
                  int v98 = v97;
                  unsigned int v99 = IsParagraphBreakingCharacter(v97);
                  if (v98 == 8232) {
                    uint64_t v100 = 1;
                  }
                  else {
                    uint64_t v100 = v99;
                  }
                  uint64_t v101 = v96 - v100;
                }
                else
                {
                  uint64_t v101 = 0;
                }
                unint64_t v19 = v101 + v95;
              }
              else
              {
                if ((*((unsigned char *)v93 + 24) & 1) == 0 || (uint64_t v106 = *(void *)v93, v75 == *(void *)v93))
                {
                  unint64_t v75 = TSWPLineFragment::charIndexForWPOffset(v93, v92, 1, 0, 0, 0);
                  uint64_t v106 = *(void *)v94;
                }
                uint64_t v107 = *((void *)v94 + 1);
                uint64_t v108 = v107 + v106;
                if (v107) {
                  BOOL v109 = v75 == v108;
                }
                else {
                  BOOL v109 = 0;
                }
                if (v109)
                {
                  if (v75 != v18
                    || (uint64_t v110 = [(TSWPStorage *)self->_storage characterAtIndex:v18 - 1],
                        int v111 = v110,
                        int v112 = IsParagraphBreakingCharacter(v110),
                        v111 == 8232)
                    || (unint64_t v19 = v18, v112))
                  {
                    unint64_t v19 = v75 - 1;
                  }
                }
                else
                {
                  unint64_t v19 = v75;
                }
              }
              goto LABEL_6;
            }
          }
          unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:
          CFIndex v21 = v114;
          goto LABEL_7;
        }
        unint64_t v75 = v76[1] + *v76;
      }
      else
      {
        unint64_t v75 = v18;
      }
      unint64_t v19 = v75;
      if (v75 > 0x7FFFFFFFFFFFFFFELL) {
        goto LABEL_6;
      }
      goto LABEL_135;
    case 5:
      unint64_t v15 = [(TSWPStorage *)self->_storage selectionRangeForCharIndex:a3];
      CFIndex v21 = v60;
      unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
      int64_t v20 = a6;
      goto LABEL_7;
    default:
      uint64_t v26 = [MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v27 = [NSString stringWithUTF8String:"-[TSWPEditingController p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:]"];
      uint64_t v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"];
      int v29 = @"Unsupported granularity";
      unsigned int v30 = (void *)v26;
      uint64_t v31 = v27;
      uint64_t v32 = 12485;
      goto LABEL_26;
  }
}

- (BOOL)p_isCharIndex:(unint64_t)a3 withinTextUnit:(int)a4 inDirection:(int64_t)a5
{
  if (a4 != 1)
  {
    unint64_t v11 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, *(void *)&a4, a5);
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSWPEditingController p_isCharIndex:withinTextUnit:inDirection:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 12566, @"unexpected granularity");
    return 0;
  }
  if ((unint64_t)a5 > 5) {
    return 0;
  }
  unint64_t v6 = [(TSWPEditingController *)self p_adjustedCharIndexForWordTestingFromCharIndex:a3 forDirection:a5];
  if (v6 > [(TSWPStorage *)self->_storage length]) {
    return 0;
  }
  unint64_t v7 = [(TSWPStorage *)self->_storage wordAtCharIndex:v6 includePreviousWord:0];
  return v6 >= v7 && v6 - v7 < v8;
}

- (_NSRange)rangeOfWordEnclosingCharIndex:(unint64_t)a3 backward:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = (NSUInteger *)MEMORY[0x263F7C7C8];
  NSUInteger v8 = *MEMORY[0x263F7C7C8];
  NSUInteger v9 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  if ([(TSWPStorage *)self->_storage length] >= a3)
  {
    uint64_t v10 = [(TSWPStorage *)self->_storage wordAtCharIndex:a3 includePreviousWord:v4];
    if (v10 != a3 || !v4)
    {
      NSUInteger v8 = v10;
      NSUInteger v9 = v11;
    }
    else
    {
      NSUInteger v8 = *v7;
      NSUInteger v9 = v7[1];
    }
  }
  NSUInteger v13 = v8;
  NSUInteger v14 = v9;
  result.CFIndex length = v14;
  result.CFIndex location = v13;
  return result;
}

- (BOOL)isDisplayingPhoneticsHUD
{
  rubyTextViewController = self->_rubyTextViewController;
  if (rubyTextViewController) {
    LOBYTE(rubyTextViewController) = [(TSWPDismissBlockPopover *)rubyTextViewController isVisible];
  }
  return (char)rubyTextViewController;
}

- (void)dismissPhoneticsHUDAnimated:(BOOL)a3
{
}

- (void)cancelPhoneticsHUDAnimated:(BOOL)a3
{
  self->_cancelRubyText = 1;
  [(TSWPDismissBlockPopover *)self->_rubyTextViewController dismissAnimated:a3];
}

- (BOOL)p_isIgnoringKeyboardInput
{
  unint64_t v3 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![(TSDInteractiveCanvasControllerDelegate *)v3 editorAllowsKeyboard])
  {
    return 1;
  }
  else
  {
    return ![(TSWPSelection *)self->_selection isValid];
  }
}

- (BOOL)wantsCaret
{
  unint64_t v3 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  int v4 = [(TSWPEditingController *)self p_canEditTextString];
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      LOBYTE(v4) = [(TSDInteractiveCanvasControllerDelegate *)v3 editorAllowsCaret];
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (BOOL)wantsKeyboard
{
  return 1;
}

- (BOOL)p_keyboardShouldShowOnscreen
{
  unint64_t v3 = [(TSWPEditingController *)self selection];
  int v4 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  if (objc_opt_respondsToSelector()) {
    int v5 = [(TSDInteractiveCanvasControllerDelegate *)v4 willChangeContentOffsetIfKeyboardHidden] ^ 1;
  }
  else {
    int v5 = 1;
  }
  if (objc_opt_respondsToSelector()) {
    char v6 = [(TSDInteractiveCanvasControllerDelegate *)v4 editorAllowsKeyboard] ^ 1;
  }
  else {
    char v6 = 0;
  }
  BOOL v7 = [(TSKDocumentRoot *)[(TSDInteractiveCanvasController *)self->_interactiveCanvasController documentRoot] isFindActive];
  BOOL v8 = [(TSWPEditingController *)self shouldDisplayKeyboard];
  BOOL v9 = [(TSWPSelection *)v3 isValid];
  BOOL v10 = [(TSWPEditingController *)self isBecomingActive];
  BOOL v11 = [(TSWPEditingController *)self isDisplayingPhoneticsHUD];
  BOOL v12 = [(TSWPEditingController *)self isInParagraphMode];
  BOOL result = 0;
  int v14 = v12 & v5;
  if (self->_knobTracking) {
    char v15 = v14;
  }
  else {
    char v15 = 0;
  }
  if (v8 && (v6 & 1) == 0 && !v7 && (v9 || v10) && !v11 && (v15 & 1) == 0) {
    return (TSUPhoneUI() & v14) != 1
  }
        || (self->_currentSelectionFlags & 0x10000) == 0 && !self->_selectionLastModifiedWithKnob;
  return result;
}

- (void)abandonMarkedText
{
  id v2 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController textInputResponder];

  [(TSDTextInputResponder *)v2 acceptAutocorrection];
}

- (void)endEditing
{
  [(TSWPEditingController *)self dismissActivePopovers];
  [(TSWPEditingController *)self p_cancelDelayedSelectors];
  id v3 = [(TSWPEditingController *)self p_containingShapeRep];
  int v4 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController editorController];
  int v5 = v4;
  if (v3)
  {
    [(TSDEditorController *)v4 popEditor:self];
    id v6 = [(TSDEditorController *)v5 mostSpecificCurrentEditorOfClass:0];
    [v6 setSelection:0];
  }
  else if (objc_msgSend(-[TSDEditorController currentEditorsOfClass:](v4, "currentEditorsOfClass:", objc_opt_class()), "containsObject:", self))
  {
    [(TSDEditorController *)v5 popEditor:self];
  }
}

- (void)endEditingAndSelectParent:(id)a3
{
  int v4 = [(TSWPStorage *)self->_storage wpKind];
  if (v4 == 2)
  {
    uint64_t v8 = [(TSDContainerInfo *)[(TSWPStorage *)self->_storage parentInfo] findCharIndexForFootnoteAttachment:[(TSWPStorage *)self->_storage owningAttachment]];
    [(TSDInteractiveCanvasController *)self->_interactiveCanvasController endEditing];
    BOOL v9 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v8 + 1, 0);
    BOOL v10 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController canvasEditor];
    [(TSDCanvasEditor *)v10 setSelection:v9];
  }
  else if (v4 == 3)
  {
    objc_opt_class();
    [(TSWPStorage *)self->_storage parentInfo];
    uint64_t v5 = TSUDynamicCast();
    if (v5)
    {
      uint64_t v6 = v5;
      [(TSDInteractiveCanvasController *)self->_interactiveCanvasController endEditing];
      BOOL v7 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController canvasEditor];
      [(TSDCanvasEditor *)v7 setSelectionToInfo:v6];
    }
  }
}

- (BOOL)textIsVerticalAtCharIndex:(unint64_t)a3
{
  [(TSWPStorage *)self->_storage parentInfo];
  uint64_t v4 = TSUProtocolCast();
  storage = self->_storage;
  if (v4)
  {
    uint64_t v6 = [(TSWPStorage *)storage parentInfo];
  }
  else
  {
    if ([(TSWPStorage *)storage wpKind]) {
      return 0;
    }
    [(TSWPStorage *)self->_storage documentRoot];
    uint64_t v6 = (TSDContainerInfo *)TSUProtocolCast();
  }

  return [(TSDContainerInfo *)v6 textIsVertical];
}

- (int64_t)returnKeyType
{
  if (self->_suppressBreaks) {
    return 9;
  }
  else {
    return 0;
  }
}

- (unint64_t)textLength
{
  return [(TSWPStorage *)self->_storage length];
}

- (id)unfilteredText
{
  return [(TSWPStorage *)self->_storage string];
}

- (id)textInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = [(TSWPStorage *)self->_storage string];
  if (location + length > [v6 length])
  {
    BOOL v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPEditingController textInRange:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 12933, @"bad text range");
  }
  unint64_t v9 = [v6 length];
  BOOL v10 = &stru_26D688A48;
  if (length && location + length <= v9)
  {
    if ([(TSWPStorage *)self->_storage hasTrackedChanges])
    {
      BOOL v11 = -[TSWPFilteredStorage initWithStorage:subRange:removeRanges:]([TSWPFilteredStorage alloc], "initWithStorage:subRange:removeRanges:", self->_storage, location, length, -[TSWPStorage deletedRangesInRange:](self->_storage, "deletedRangesInRange:", location, length));
      BOOL v10 = (__CFString *)[(TSWPFilteredStorage *)v11 string];
      if (![(__CFString *)v10 length]) {
        BOOL v10 = @" ";
      }
    }
    else
    {
      BOOL v10 = (__CFString *)objc_msgSend(v6, "substringWithRange:", location, length);
    }
    if (!-[TSWPEditingController textInRange:]::sSeparatorSet)
    {
      *(_OWORD *)chars = xmmword_22383AD78;
      *(void *)&chars[7] = 0x20292028000F000DLL;
      CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v13 = CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x263EFFB08], chars, 11);
      if (v13)
      {
        CFStringRef v14 = v13;
        -[TSWPEditingController textInRange:]::sSeparatorSet = (uint64_t)CFCharacterSetCreateWithCharactersInString(v12, v13);
        CFRelease(v14);
      }
      else
      {
        char v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPEditingController textInRange:]"];
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 12970, @"invalid nil value for '%s'", "setStr");
      }
    }
    if ((unint64_t)-[__CFString rangeOfCharacterFromSet:](v10, "rangeOfCharacterFromSet:") <= 0x7FFFFFFFFFFFFFFELL)
    {
      uint64_t v17 = (void *)-[__CFString componentsSeparatedByCharactersInSet:](v10, "componentsSeparatedByCharactersInSet:", -[TSWPEditingController textInRange:]::sSeparatorSet);
      BOOL v10 = (__CFString *)objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", -[__CFString length](v10, "length"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v25;
        char v21 = 1;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            if (v21) {
              [(__CFString *)v10 appendString:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            }
            else {
              [(__CFString *)v10 appendFormat:@"\n%@", *(void *)(*((void *)&v24 + 1) + 8 * i)];
            }
            char v21 = 0;
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
          char v21 = 0;
        }
        while (v19);
      }
    }
  }
  return v10;
}

- (CGRect)firstRectForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(TSWPStorage *)self->_storage hasTrackedChanges])
  {
    id v6 = -[TSWPFilteredStorage initWithStorage:subRange:removeRanges:]([TSWPFilteredStorage alloc], "initWithStorage:subRange:removeRanges:", self->_storage, location, length, -[TSWPStorage deletedRangesInRange:](self->_storage, "deletedRangesInRange:", location, length));
    uint64_t v7 = -[TSWPFilteredStorage charRangeMappedFromStorage:](v6, "charRangeMappedFromStorage:", location, length);
    NSUInteger location = -[TSWPFilteredStorage charRangeMappedToStorage:](v6, "charRangeMappedToStorage:", v7, v8);
    NSUInteger length = v9;
  }

  -[TSWPEditingController p_firstRectForRange:actualRange:](self, "p_firstRectForRange:actualRange:", location, length, 0);
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (void)p_setInsertionStyle:(id)a3
{
  if (self->_insertionStyle != a3)
  {
    id v5 = a3;

    self->_insertionStyle = (TSWPCharacterStyle *)a3;
    id v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    storage = self->_storage;
    [v6 postNotificationName:@"TSWPEditingControllerInsertionStyleChanged" object:storage userInfo:0];
  }
}

- (id)characterStyleForDeletedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(TSWPStorage *)self->_storage smartFieldAtCharIndex:a3.location attributeKind:6 effectiveRange:&v14];
  objc_opt_class();
  uint64_t v6 = TSUDynamicCast();
  uint64_t v7 = v14;
  id v8 = [(TSWPStorage *)[(TSWPEditingController *)self storage] attachmentOrFootnoteAtCharIndex:location];
  if (v7 == location && v6 != 0 || v8 != 0) {
    return 0;
  }
  id v12 = [(TSWPStorage *)self->_storage characterStyleAtCharIndex:location effectiveRange:v13];
  id result = 0;
  if (v12 && v13[0] == location)
  {
    if (v13[1] + location <= location + length) {
      return v12;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)extendSelectionLeft
{
  unint64_t v3 = [(TSWPSelection *)[(TSWPEditingController *)self selection] range];
  uint64_t v5 = v4;
  unint64_t v6 = [(TSWPStorage *)self->_storage selectionRangeMinForCharIndex:v3];
  if (v3 > v6)
  {
    unint64_t v7 = v6;
    storage = self->_storage;
    for (unint64_t i = v3; ; unint64_t i = v10)
    {
      unint64_t v10 = [(TSWPStorage *)storage previousCharacterIndex:i];
      if (v10 <= v7
        || ![(TSWPStorage *)self->_storage anchoredDrawableAttachmentCharacterAtCharIndex:v10])
      {
        break;
      }
      storage = self->_storage;
    }
    double v11 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", v10, v5 + v3 - v10);
    [(TSWPEditingController *)self setSelection:v11];
  }
}

- (void)extendSelectionRight
{
  unint64_t v3 = [(TSWPEditingController *)self selection];
  if (![(TSWPSelection *)v3 isValid])
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPEditingController extendSelectionRight]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 14569, @"Invalid selection");
  }
  if ([(TSWPSelection *)v3 isValid])
  {
    uint64_t v6 = [(TSWPSelection *)v3 range];
    unint64_t v8 = v6 + v7;
    unint64_t v9 = [(TSWPStorage *)self->_storage selectionRangeMaxForCharIndex:v6 + v7];
    if (v8 < v9)
    {
      unint64_t v10 = v9;
      do
        unint64_t v8 = [(TSWPStorage *)self->_storage nextCharacterIndex:v8];
      while (v8 < v10
           && [(TSWPStorage *)self->_storage anchoredDrawableAttachmentCharacterAtCharIndex:v8]);
      double v11 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", v6, v8 - v6);
      [(TSWPEditingController *)self setSelection:v11];
    }
  }
}

- (CGRect)p_firstRectForRange:(_NSRange)a3 actualRange:(_NSRange *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v46 = *MEMORY[0x263EF8340];
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layoutIfNeeded];
  uint64_t v7 = (double *)MEMORY[0x263F001A0];
  CGFloat v8 = *MEMORY[0x263F001A0];
  CGFloat v9 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v10 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v11 = *(double *)(MEMORY[0x263F001A0] + 24);
  NSUInteger v12 = *MEMORY[0x263F7C7C8];
  NSUInteger v13 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  range1[0] = location;
  uint64_t v14 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", location, length);
  CFIndex v39 = self;
  id v15 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layoutForModel:self->_storage withSelection:v14];
  if (!v15)
  {
    uint64_t v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"-[TSWPEditingController p_firstRectForRange:actualRange:]"];
    [v16 handleFailureInFunction:v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 14664, @"failed to find a layout, can't present autocorrection UI" file lineNumber description];
  }
  double x = *v7;
  double y = v7[1];
  double width = v7[2];
  double height = v7[3];
  *(_OWORD *)&range1[1] = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  CFIndex v22 = objc_msgSend(v15, "columns", v15);
  uint64_t v23 = [v22 countByEnumeratingWithState:&range1[1] objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v42;
LABEL_5:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v42 != v25) {
        objc_enumerationMutation(v22);
      }
      long long v27 = *(void **)(range1[2] + 8 * v26);
      if (length)
      {
        [*(id *)(range1[2] + 8 * v26) firstRectForSelection:v14 includeSpaceAfter:0 includeSpaceBefore:0 includeLeading:0];
        double x = v49.origin.x;
        double y = v49.origin.y;
        double width = v49.size.width;
        double height = v49.size.height;
        if (CGRectIsEmpty(v49))
        {
          double x = *v7;
          double y = v7[1];
          double width = v7[2];
          double height = v7[3];
        }
        else
        {
          v51.origin.double x = x;
          v51.origin.double y = y;
          v51.size.double width = width;
          v51.size.double height = height;
          if (!CGRectIsNull(v51))
          {
            v48.NSUInteger location = [v27 range];
            v48.NSUInteger length = v28;
            v47.NSUInteger location = range1[0];
            v47.NSUInteger length = length;
            NSRange v29 = NSIntersectionRange(v47, v48);
            NSUInteger v12 = v29.location;
            NSUInteger v13 = v29.length;
          }
        }
      }
      else
      {
        [*(id *)(range1[2] + 8 * v26) caretRectForSelection:v14];
        double x = v50.origin.x;
        double y = v50.origin.y;
        double width = v50.size.width;
        double height = v50.size.height;
        if (!CGRectIsNull(v50))
        {
          NSUInteger v12 = range1[0];
          NSUInteger v13 = 0;
        }
      }
      v52.origin.double x = x;
      v52.origin.double y = y;
      v52.size.double width = width;
      v52.size.double height = height;
      if (!CGRectIsNull(v52)) {
        break;
      }
      if (v24 == ++v26)
      {
        uint64_t v24 = [v22 countByEnumeratingWithState:&range1[1] objects:v45 count:16];
        if (v24) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  v53.origin.double x = x;
  v53.origin.double y = y;
  v53.size.double width = width;
  v53.size.double height = height;
  if (!CGRectIsNull(v53))
  {
    objc_msgSend(v38, "rectInRoot:", x, y, width, height);
    -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](v39->_interactiveCanvasController, "convertUnscaledToBoundsRect:");
    CGFloat v8 = v30;
    CGFloat v9 = v31;
    CGFloat v10 = v32;
    CGFloat v11 = v33;
  }
  v54.origin.double x = v8;
  v54.origin.double y = v9;
  v54.size.double width = v10;
  v54.size.double height = v11;
  if (CGRectIsNull(v54))
  {
    CGFloat v8 = *MEMORY[0x263F001A8];
    CGFloat v9 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v10 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  if (a4)
  {
    a4->NSUInteger location = v12;
    a4->NSUInteger length = v13;
  }
  double v34 = v8;
  double v35 = v9;
  double v36 = v10;
  double v37 = v11;
  result.size.double height = v37;
  result.size.double width = v36;
  result.origin.double y = v35;
  result.origin.double x = v34;
  return result;
}

- (id)_repsForStorage:(id)a3 selection:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = [(TSWPInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] _repsForStorage:a3];
  uint64_t v6 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        CGFloat v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        NSUInteger v12 = [a4 range];
        NSUInteger v14 = v13;
        v24.NSUInteger location = [v11 range];
        v24.NSUInteger length = v15;
        v23.NSUInteger location = v12;
        v23.NSUInteger length = v14;
        if (NSIntersectionRange(v23, v24).length) {
          [v6 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  return v6;
}

- (id)_addSelectionRectsForLayout:(id)a3 selection:(id)a4
{
  id v4 = a4;
  uint64_t v82 = *MEMORY[0x263EF8340];
  uint64_t v62 = [a4 range];
  uint64_t v58 = v7;
  unint64_t v63 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:1];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v61 = a3;
  obuint64_t j = (id)[a3 columns];
  uint64_t v57 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v76;
    CFStringTokenizerTokenType v64 = v4;
    do
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v76 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        unsigned int v65 = [v9 textIsVertical];
        if (v58)
        {
          id v74 = 0;
          uint64_t v59 = i;
          if ([v4 isVisual])
          {
            id v74 = (id)[v4 visualRangesArray];
            uint64_t v10 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:1];
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            id v60 = v74;
            uint64_t v11 = [v74 countByEnumeratingWithState:&v70 objects:v80 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v71;
              do
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v71 != v13) {
                    objc_enumerationMutation(v60);
                  }
                  uint64_t v15 = [*(id *)(*((void *)&v70 + 1) + 8 * j) rangeValue];
                  long long v17 = objc_msgSend(v9, "rectsForSelectionRange:selectionType:", v15, v16, objc_msgSend(v64, "type"));
                  if ([v17 count] != 1)
                  {
                    long long v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
                    uint64_t v19 = [NSString stringWithUTF8String:"-[TSWPEditingController _addSelectionRectsForLayout:selection:]"];
                    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 14766, @"A visual selection should only return one rect");
                  }
                  objc_msgSend(v10, "addObject:", objc_msgSend(v17, "objectAtIndex:", 0));
                }
                uint64_t v12 = [v60 countByEnumeratingWithState:&v70 objects:v80 count:16];
              }
              while (v12);
            }
          }
          else
          {
            uint64_t v10 = (void *)[v9 rectsForSelection:v4 ranges:&v74];
          }
          uint64_t v24 = [v10 count];
          if (v24 != [v74 count])
          {
            uint64_t v25 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v26 = [NSString stringWithUTF8String:"-[TSWPEditingController _addSelectionRectsForLayout:selection:]"];
            uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"];
            uint64_t v28 = [v10 count];
            objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 14775, @"rect/range count mismatch: %lu v %lu", v28, objc_msgSend(v74, "count"));
          }
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          uint64_t v29 = [v10 countByEnumeratingWithState:&v66 objects:v79 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            int v31 = 0;
            uint64_t v32 = *(void *)v67;
            do
            {
              for (uint64_t k = 0; k != v30; ++k)
              {
                if (*(void *)v67 != v32) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v66 + 1) + 8 * k) CGRectValue];
                double x = v84.origin.x;
                double y = v84.origin.y;
                double width = v84.size.width;
                double height = v84.size.height;
                if (!CGRectIsEmpty(v84))
                {
                  objc_msgSend(v61, "rectInRoot:", x, y, width, height);
                  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](self->_interactiveCanvasController, "convertUnscaledToBoundsRect:");
                  double v39 = v38;
                  double v41 = v40;
                  double v43 = v42;
                  double v45 = v44;
                  uint64_t v46 = objc_msgSend((id)objc_msgSend(v74, "objectAtIndexedSubscript:", (v31 + k)), "rangeValue");
                  NSRange v48 = -[TSDTextSelectionRect initWithRect:direction:range:containsStart:containsEnd:isVertical:]([TSDTextSelectionRect alloc], "initWithRect:direction:range:containsStart:containsEnd:isVertical:", [(TSWPEditingController *)self writingDirectionForCharIndex:v46], +[TSDTextRange textRangeWithRange:](TSDTextRange, "textRangeWithRange:", v46, v47), v46 == v62, v46 + v47 == v62 + v58, v65, v39, v41, v43, v45);
                  [v63 addObject:v48];
                }
              }
              uint64_t v30 = [v10 countByEnumeratingWithState:&v66 objects:v79 count:16];
              v31 += k;
            }
            while (v30);
          }
          id v4 = v64;
          uint64_t i = v59;
        }
        else
        {
          [v9 caretRectForSelection:v4];
          double v20 = v83.origin.x;
          double v21 = v83.origin.y;
          double v22 = v83.size.width;
          double v23 = v83.size.height;
          if (!CGRectIsNull(v83))
          {
            objc_msgSend(v61, "rectInRoot:", v20, v21, v22, v23);
            -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](self->_interactiveCanvasController, "convertUnscaledToBoundsRect:");
            CGRect v53 = -[TSDTextSelectionRect initWithRect:direction:range:containsStart:containsEnd:isVertical:]([TSDTextSelectionRect alloc], "initWithRect:direction:range:containsStart:containsEnd:isVertical:", [(TSWPEditingController *)self writingDirectionForCharIndex:v62], +[TSDTextRange textRangeWithRange:](TSDTextRange, "textRangeWithRange:", v62, 0), 1, 1, v65, v49, v50, v51, v52);
            [v63 addObject:v53];

            return v63;
          }
        }
      }
      uint64_t v57 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
    }
    while (v57);
  }
  return v63;
}

- (id)selectionRectsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(TSWPEditingController *)self interactiveCanvasController];
  [(TSDInteractiveCanvasController *)v6 delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(TSDInteractiveCanvasControllerDelegate *)[(TSDInteractiveCanvasController *)v6 delegate] selectableWordLimit])
  {
    NSUInteger location = +[TSDRangeClamper clampSelectedRange:inFullString:toWordLimit:](TSDRangeClamper, "clampSelectedRange:inFullString:toWordLimit:", location, length, [(TSWPEditingController *)self unfilteredText], [(TSDInteractiveCanvasControllerDelegate *)[(TSDInteractiveCanvasController *)v6 delegate] selectableWordLimit]);
    NSUInteger length = v7;
  }
  uint64_t v8 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:1];
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layoutIfNeeded];
  uint64_t v9 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", location, length);
  if (TSUSupportsTextInteraction())
  {
    id v10 = [(TSWPEditingController *)self _repsForStorage:self->_storage selection:v9];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(v8, "addObjectsFromArray:", -[TSWPEditingController _addSelectionRectsForLayout:selection:](self, "_addSelectionRectsForLayout:selection:", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "layout"), v9));
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v15 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layoutsForModel:self->_storage withSelection:v9];
    if (![v15 count])
    {
      uint64_t v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v17 = [NSString stringWithUTF8String:"-[TSWPEditingController selectionRectsForRange:]"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController.mm"), 14861, @"failed to find a layout");
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v18 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(v8, "addObjectsFromArray:", -[TSWPEditingController _addSelectionRectsForLayout:selection:](self, "_addSelectionRectsForLayout:selection:", *(void *)(*((void *)&v23 + 1) + 8 * j), v9));
        }
        uint64_t v19 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v19);
    }
  }

  return v8;
}

- (id)textColorAtCharIndex:(unint64_t)a3
{
  v8[3] = *MEMORY[0x263EF8340];
  id v5 = [(TSWPStorage *)self->_storage characterStyleAtCharIndex:a3 effectiveRange:0];
  uint64_t v6 = objc_msgSend(-[TSWPEditingController styleProvider](self, "styleProvider"), "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self->_storage, "paragraphIndexAtCharIndex:", a3), 0);
  v8[0] = self->_insertionStyle;
  v8[1] = v5;
  void v8[2] = v6;
  return (id)objc_msgSend((id)TSWPResolvePropertyForStyles((uint64_t)v8, 3uLL, 18, 0), "UIColor");
}

- (id)p_columnForCharIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3, 0);
  id v5 = [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layoutForModel:self->_storage withSelection:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = objc_msgSend(v5, "columns", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v15;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v15 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
    [v11 caretRectForSelection:v4];
    if (v12 > 0.0) {
      return v11;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)textFontAtCharIndex:(unint64_t)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  id v5 = [(TSWPStorage *)self->_storage characterStyleAtCharIndex:a3 effectiveRange:0];
  uint64_t v6 = objc_msgSend(-[TSWPEditingController styleProvider](self, "styleProvider"), "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self->_storage, "paragraphIndexAtCharIndex:", a3), 0);
  v15[0] = self->_insertionStyle;
  v15[1] = v5;
  v15[2] = v6;
  uint64_t v7 = TSWPCreateFontForStylesWithScale((uint64_t)v15, 3uLL, 0x64uLL);
  uint64_t v8 = TSWPUIFontForCTFont(v7);
  CFRelease(v7);
  [(__CTFont *)v8 pointSize];
  double v10 = v9;
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController viewScale];
  double v12 = v10 * v11;
  id v13 = [(TSWPEditingController *)self p_columnForCharIndex:a3];
  if (v13) {
    double v12 = v12 * (float)((float)(unint64_t)[v13 scaleTextPercent] / 100.0);
  }
  return [(__CTFont *)v8 fontWithSize:v12];
}

- (id)selectionWithRange:(_NSRange)a3
{
  id v4 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", a3.location, a3.length);

  return [(TSWPEditingController *)self p_extendSelectionToIncludeSmartFields:v4];
}

- (void)setSelectionWithRange:(_NSRange)a3 endOfLine:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(TSWPSelection *)[(TSWPEditingController *)self selection] range] == a3.location) {
    uint64_t v8 = 168000;
  }
  else {
    uint64_t v8 = 135232;
  }
  double v9 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([TSWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, location, length, 0, v4);
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setSelection:v9 onModel:self->_storage withFlags:v8];

  self->_selectionLastModifiedWithKeyboard = 1;

  [(TSWPEditingController *)self p_clearEditMenuFlags];
}

- (void)setSelectionWithRange:(_NSRange)a3 leadingEdge:(BOOL)a4 endOfLine:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double v10 = [TSWPSelection alloc];
  LOBYTE(v13) = a4;
  double v11 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v10, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, location, length, 0, v5, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), v13, self->_storage);
  if ([(TSWPSelection *)[(TSWPEditingController *)self selection] range] == location) {
    uint64_t v12 = 168000;
  }
  else {
    uint64_t v12 = 135232;
  }
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController setSelection:v11 onModel:self->_storage withFlags:v12];

  self->_selectionLastModifiedWithKeyboard = 1;

  [(TSWPEditingController *)self p_clearEditMenuFlags];
}

- (id)editingSearchReference
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(TSWPEditingController *)self selection];
  BOOL v4 = (TSWPSearchReference *)v3;
  if (v3)
  {
    if ([(TSWPSelection *)v3 isValid])
    {
      BOOL v4 = +[TSWPSearchReference searchReferenceWithStorage:self->_storage selection:v4];
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = [(TSWPEditingController *)self editingReps];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "layout"), "calculatePointFromSearchReference:", v4);
            if ((v10 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
            {
              -[TSWPSearchReference setSearchReferencePoint:](v4, "setSearchReferencePoint:");
              return v4;
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (id)p_extendSelectionToIncludeSmartFields:(id)a3
{
  int v5 = [a3 type];
  id result = [(TSWPStorage *)self->_storage extendSelectionToIncludeSmartFields:a3];
  if (v5 == 7)
  {
    return [(TSWPEditingController *)self logicalToVisualSelection:result];
  }
  return result;
}

- (void)p_setSelectionFromPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 includeListLabels:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  objc_opt_class();
  -[TSWPInteractiveCanvasController closestRepToPoint:forStorage:](self->_interactiveCanvasController, "closestRepToPoint:forStorage:", self->_storage, x, y);
  uint64_t v10 = (void *)TSUDynamicCast();
  if (v10)
  {
    double v11 = v10;
    if ([v10 isEditing])
    {
      objc_msgSend(v11, "convertNaturalPointFromUnscaledCanvas:", x, y);
      objc_msgSend(v11, "pinToClosestColumn:");
      LOBYTE(v19) = 0;
      id v12 = -[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:", v11, a4, 0, 1, v5, 0, v19);
      if ((objc_msgSend(v12, "isEqual:", -[TSWPEditingController selection](self, "selection")) & 1) == 0)
      {
        if ([(TSWPEditingController *)self pIsSelectionPlaceHolderTextWithSelection:v12])
        {
          uint64_t v13 = 4176;
        }
        else
        {
          uint64_t v13 = 4432;
        }
        [(TSWPEditingController *)self setSelection:v12 withFlags:v13];
      }
      if (self->_magnifying)
      {
        if (objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "target") != v11)objc_msgSend((id)objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "target"), "setShouldHideSelectionControls:", 0); {
        [v11 setShouldHideSelectionControls:self->_initialPressTextSelectionGranularity == 1];
        }
        objc_msgSend(+[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier](TSWPTextMagnifierHorizontalRanged, "sharedRangedMagnifier"), "setTarget:", v11);
        -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](self->_interactiveCanvasController, "convertUnscaledToBoundsPoint:", x, y);
        double v15 = v14;
        double v17 = v16;
        id v18 = +[TSWPTextMagnifierHorizontalRanged sharedRangedMagnifier];
        objc_msgSend(v18, "setMagnificationPoint:", v15, v17);
      }
    }
  }
}

- (id)selectionFromUnscaledCanvasPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 isTapHold:(BOOL)a5 allowPastBreak:(BOOL)a6 selectsEntireLink:(BOOL)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double y = a3.y;
  double x = a3.x;
  objc_opt_class();
  -[TSWPInteractiveCanvasController closestRepToPoint:forStorage:](self->_interactiveCanvasController, "closestRepToPoint:forStorage:", self->_storage, x, y);
  double v14 = (void *)TSUDynamicCast();
  if (![v14 isEditing]) {
    return 0;
  }
  objc_msgSend(v14, "convertNaturalPointFromUnscaledCanvas:", x, y);
  objc_msgSend(v14, "pinToClosestColumn:");
  LOBYTE(v16) = a7;
  return -[TSWPEditingController p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:selectsEntireLink:", v14, a4, v9, 1, 0, v8, v16);
}

- (void)p_adjustSelection:(id)a3 withUnscaledCanvasPoint:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 allowPastBreak:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] visibleUnscaledRect];
  CGRectInset(v14, 1.0, 1.0);
  id v12 = [(TSWPEditingController *)self p_selectionFromUnscaledCanvasPoint:a5 textSelectionGranularity:v8 isTapHold:v7 allowPastBreak:1 selectsEntireLink:TSDClampPointInRect()];
  if (v12)
  {
    [(TSWPEditingController *)self p_adjustSelection:a3 withOtherSelection:v12 textSelectionGranularity:a5];
  }
}

- (void)p_inputLanguageDidChangeNotification:(id)a3
{
  if ([(TSWPSelection *)self->_selection isValid])
  {
    uint64_t v5 = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:[(TSWPSelection *)self->_selection range]];
    if (v4)
    {
      if (v4 == 1) {
        char v6 = IsParagraphBreakingCharacter([(TSWPStorage *)self->_storage characterAtIndex:v5]) ^ 1;
      }
      else {
        char v6 = 1;
      }
    }
    else
    {
      char v6 = 0;
    }
    if (![(TSWPSelection *)self->_selection isInsertionPoint] || (v6 & 1) != 0)
    {
      unint64_t currentSelectionFlags = self->_currentSelectionFlags;
      [(TSWPEditingController *)self selectionChangedWithFlags:currentSelectionFlags wpFlags:0];
    }
    else
    {
      int v7 = [(TSWPStorage *)self->_storage writingDirectionForParagraphAtCharIndex:v5];
      if ((v7 != 1) == ([MEMORY[0x263EFF960] characterDirectionForLanguage:TSWPGetPrimaryInputLanguage()] == 2))
      {
        -[TSWPEditingController setBaseWritingDirection:forParagraphsWithRange:](self, "setBaseWritingDirection:forParagraphsWithRange:");
      }
    }
  }
}

- (BOOL)p_canEditTextString
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  uint64_t v3 = TSUProtocolCast();
  if (v3 && (uint64_t v4 = (void *)v3, (objc_opt_respondsToSelector() & 1) != 0)) {
    return objc_msgSend(v4, "disallowEditingOfTextStringWithStorage:", -[TSWPEditingController storage](self, "storage")) ^ 1;
  }
  else {
    return 1;
  }
}

- (void)p_adjustSelection:(id)a3 withOtherSelection:(id)a4 textSelectionGranularity:(unint64_t)a5
{
  id v6 = a3;
  if (![a3 isValid] || !objc_msgSend(a4, "isValid")) {
    return;
  }
  [v6 superRange];
  if ([a4 type] == 7
    && (![v6 type] || objc_msgSend(v6, "type") == 7))
  {
    if ([v6 type] != 7) {
      id v6 = [(TSWPEditingController *)self logicalToVisualSelection:v6];
    }
    uint64_t v8 = [(TSWPEditingController *)self p_adjustVisualSelection:v6 withOtherSelection:a4];
    uint64_t v10 = v9;
    if (![(TSWPSelection *)[(TSWPEditingController *)self selection] isValid]
      || [(TSWPSelection *)[(TSWPEditingController *)self selection] range] != v8
      || v11 != v10)
    {
      id v12 = [TSWPSelection alloc];
      LOBYTE(v37) = 1;
      uint64_t v13 = -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v12, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, v8, v10, 0, 0, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), v37, self->_storage);
LABEL_28:
      double v38 = v13;
      [(TSWPEditingController *)self setSelection:v13 withFlags:768];
    }
  }
  else
  {
    unint64_t v14 = [v6 range];
    if (v14 >= [a4 range]
      || (uint64_t v15 = [a4 range], v17 = v15 + v16, v18 = objc_msgSend(v6, "range"), v17 >= v18 + v19))
    {
      NSUInteger v28 = [v6 range];
      NSUInteger v30 = v29;
      v41.NSUInteger location = [a4 range];
      v41.NSUInteger length = v31;
      v40.NSUInteger location = v28;
      v40.NSUInteger length = v30;
      NSRange v32 = NSUnionRange(v40, v41);
      NSUInteger location = v32.location;
      NSUInteger length = v32.length;
    }
    else
    {
      unint64_t v20 = [a4 range];
      uint64_t v21 = [v6 range];
      if (v20 <= v21 + (v22 >> 1))
      {
        NSUInteger location = [a4 range];
        uint64_t v34 = [v6 range];
        if (location <= v34 + v35) {
          NSUInteger v36 = v34 + v35;
        }
        else {
          NSUInteger v36 = location;
        }
        if (location >= v34 + v35) {
          NSUInteger location = v34 + v35;
        }
        NSUInteger length = v36 - location;
      }
      else
      {
        unint64_t v23 = [v6 range];
        unint64_t v24 = [a4 range];
        if (v23 <= v24) {
          unint64_t v25 = v24;
        }
        else {
          unint64_t v25 = v23;
        }
        if (v23 >= v24) {
          NSUInteger location = v24;
        }
        else {
          NSUInteger location = v23;
        }
        NSUInteger length = v25 - location;
      }
    }
    if (![(TSWPSelection *)[(TSWPEditingController *)self selection] isValid]
      || [(TSWPSelection *)[(TSWPEditingController *)self selection] range] != location
      || v33 != length)
    {
      uint64_t v13 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", location, length);
      goto LABEL_28;
    }
  }
}

- (UIView)inputView
{
  if ([(TSWPEditingController *)self p_keyboardShouldShowOnscreen]) {
    return 0;
  }
  id result = self->_inputViewForHidingKeyboard;
  if (!result)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    id result = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    self->_inputViewForHidingKeyboard = result;
  }
  return result;
}

- (UIView)inputAccessoryView
{
  if (![(TSWPEditingController *)self p_keyboardShouldShowOnscreen]) {
    return 0;
  }
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController delegate];
  uint64_t v3 = (void *)TSUProtocolCast();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return (UIView *)[v3 formatBarAccessoryView];
}

- (BOOL)textEditingSupportsFormatBar
{
  return [(TSWPEditingController *)self inputAccessoryView] != 0;
}

- (id)p_previousAutocorrectionForWordAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  if (a4) {
    *a4 = *(_NSRange *)MEMORY[0x263F7C7C8];
  }
  uint64_t v6 = [(TSWPStorage *)self->_storage wordAtCharIndex:a3 includePreviousWord:1];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id result = [(TSWPStorage *)self->_storage dictationAndAutocorrectionKeyAtCharIndex:v6 effectiveRange:&v8];
  if (result)
  {
    id result = (id)[(NSMutableDictionary *)self->_autocorrectedEntries objectForKeyedSubscript:result];
    if (a4)
    {
      if (result) {
        *a4 = v8;
      }
    }
  }
  return result;
}

- (int)valueForWritingDirectionPropertyForInspector:(id)a3
{
  id v4 = [(TSWPEditingController *)self selection];
  if (![(TSWPSelection *)v4 isValid]) {
    return -1;
  }
  uint64_t v5 = [(TSWPSelection *)v4 start];
  storage = self->_storage;
  id v7 = [(TSWPEditingController *)self styleProvider];
  if (storage) {
    [(TSWPStorage *)storage paragraphEnumeratorAtCharIndex:v5 styleProvider:v7];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  int v8 = objc_msgSend((id)TSWPParagraphEnumerator::paragraphStyle(&v12, 0), "intValueForProperty:", 44);
  if (v8 == -1)
  {
    uint64_t v9 = [(TSWPEditingController *)self interactiveCanvasController];
    objc_opt_class();
    [(TSDInteractiveCanvasController *)v9 layoutForInfo:self->_storage];
    uint64_t v10 = (void *)TSUDynamicCast();
    if (!v10 || (int v8 = [v10 naturalDirection], v8 == -1)) {
      int v8 = TSWPParagraphEnumerator::paragraphRunsRightToLeft(&v12);
    }
  }
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v12);
  return v8;
}

- (void)p_removeAutocorrectionAtCharIndex:(unint64_t)a3
{
  id v4 = [(TSWPStorage *)self->_storage dictationAndAutocorrectionKeyAtCharIndex:a3 effectiveRange:0];
  if (v4)
  {
    id v5 = v4;
    autocorrectedEntries = self->_autocorrectedEntries;
    [(NSMutableDictionary *)autocorrectedEntries removeObjectForKey:v5];
  }
}

- (id)dictationInterpretationsAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  if (a4) {
    *a4 = *(_NSRange *)MEMORY[0x263F7C7C8];
  }
  id result = [(TSWPStorage *)self->_storage dictationAndAutocorrectionKeyAtCharIndex:a3 effectiveRange:&v7];
  if (result)
  {
    id result = (id)[(NSMutableDictionary *)self->_dictationInterpretations objectForKeyedSubscript:result];
    if (a4)
    {
      if (result) {
        *a4 = v7;
      }
    }
  }
  return result;
}

- (void)addAllDictationInterpretationRangesInRange:(_NSRange)a3 toRanges:(void *)a4
{
  __p = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  -[TSWPStorage addAllDictationAndAutocorrectionKeyRangesInRange:toRanges:](self->_storage, "addAllDictationAndAutocorrectionKeyRangesInRange:toRanges:", a3.location, a3.length, &__p);
  uint64_t v6 = __p;
  if (self->_dictationInterpretations)
  {
    _NSRange v7 = v21;
    if (__p != v21)
    {
      do
      {
        if ([(NSMutableDictionary *)self->_dictationInterpretations objectForKeyedSubscript:[(TSWPStorage *)self->_storage dictationAndAutocorrectionKeyAtCharIndex:*v6 effectiveRange:0]])
        {
          uint64_t v9 = (_OWORD *)*((void *)a4 + 1);
          unint64_t v8 = *((void *)a4 + 2);
          if ((unint64_t)v9 >= v8)
          {
            uint64_t v11 = ((uint64_t)v9 - *(void *)a4) >> 4;
            unint64_t v12 = v11 + 1;
            if ((unint64_t)(v11 + 1) >> 60) {
              abort();
            }
            uint64_t v13 = v8 - *(void *)a4;
            if (v13 >> 3 > v12) {
              unint64_t v12 = v13 >> 3;
            }
            if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v14 = v12;
            }
            if (v14) {
              uint64_t v15 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)a4 + 16, v14);
            }
            else {
              uint64_t v15 = 0;
            }
            uint64_t v16 = &v15[16 * v11];
            *(_OWORD *)uint64_t v16 = *(_OWORD *)v6;
            uint64_t v18 = *(char **)a4;
            unint64_t v17 = (char *)*((void *)a4 + 1);
            uint64_t v19 = v16;
            if (v17 != *(char **)a4)
            {
              do
              {
                *((_OWORD *)v19 - objc_msgSend(+[TSWPEditMenuController sharedEditMenuController](TSWPEditMenuController, "sharedEditMenuController"), "setIsBeginningEditing:", 1) = *((_OWORD *)v17 - 1);
                v19 -= 16;
                v17 -= 16;
              }
              while (v17 != v18);
              unint64_t v17 = *(char **)a4;
            }
            uint64_t v10 = v16 + 16;
            *(void *)a4 = v19;
            *((void *)a4 + objc_msgSend(+[TSWPEditMenuController sharedEditMenuController](TSWPEditMenuController, "sharedEditMenuController"), "setIsBeginningEditing:", 1) = v16 + 16;
            *((void *)a4 + 2) = &v15[16 * v14];
            if (v17) {
              operator delete(v17);
            }
          }
          else
          {
            *uint64_t v9 = *(_OWORD *)v6;
            uint64_t v10 = v9 + 1;
          }
          *((void *)a4 + objc_msgSend(+[TSWPEditMenuController sharedEditMenuController](TSWPEditMenuController, "sharedEditMenuController"), "setIsBeginningEditing:", 1) = v10;
        }
        v6 += 2;
      }
      while (v6 != v7);
      uint64_t v6 = __p;
    }
  }
  if (v6)
  {
    uint64_t v21 = v6;
    operator delete(v6);
  }
}

- (BOOL)suppressesTextInspector
{
  return 0;
}

- (BOOL)shouldShowSelectedTextAsFocused
{
  return 0;
}

- (TSWPInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (TSWPStorage)storage
{
  return self->_storage;
}

- (NSAttributedString)markedText
{
  return self->_markedText;
}

- (BOOL)knobTracking
{
  return self->_knobTracking;
}

- (unint64_t)knobTag
{
  return self->_knobTag;
}

- (void)setKnobTag:(unint64_t)a3
{
  self->_knobTag = a3;
}

- (CGPoint)knobTrackingDragPoint
{
  double x = self->_knobTrackingDragPoint.x;
  double y = self->_knobTrackingDragPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setKnobTrackingDragPoint:(CGPoint)a3
{
  self->_knobTrackingDragPoint = a3;
}

- (unsigned)knobTrackingTapCount
{
  return self->_knobTrackingTapCount;
}

- (void)setKnobTrackingTapCount:(unsigned int)a3
{
  self->_knobTrackingTapCount = a3;
}

- (TSWPCharacterStyle)insertionStyle
{
  return self->_insertionStyle;
}

- (BOOL)canCoalesce
{
  return self->_canCoalesce;
}

- (void)setCanCoalesce:(BOOL)a3
{
  self->_canCoalesce = a3;
}

- (BOOL)isBecomingActive
{
  return self->_isBecomingActive;
}

- (void)setIsBecomingActive:(BOOL)a3
{
  self->_isBecomingActive = a3;
}

- (BOOL)supportsDataDetectors
{
  return self->_supportsDataDetectors;
}

- (void)setSupportsDataDetectors:(BOOL)a3
{
  self->_supportsDataDetectors = a3;
}

- (BOOL)isEditingPlainText
{
  return self->_isEditingPlainText;
}

- (void)setIsEditingPlainText:(BOOL)a3
{
  self->_isEditingPlainText = a3;
}

- (BOOL)shouldDisplayKeyboard
{
  return self->_shouldDisplayKeyboard;
}

- (void)setShouldDisplayKeyboard:(BOOL)a3
{
  self->_shouldDisplayKeyboard = a3;
}

- (unint64_t)currentSelectionFlags
{
  return self->_currentSelectionFlags;
}

- (BOOL)selectionLastModifiedWithKnob
{
  return self->_selectionLastModifiedWithKnob;
}

- (BOOL)selectionLastModifiedWithKeyboard
{
  return self->_selectionLastModifiedWithKeyboard;
}

- (BOOL)suppressDataDetectorsOnResignTextInput
{
  return self->_suppressDataDetectorsOnResignTextInput;
}

- (TSDAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (CGPoint)autoscrollPoint
{
  double x = self->_autoscrollPoint.x;
  double y = self->_autoscrollPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAutoscrollPoint:(CGPoint)a3
{
  self->_autoscrollPoint = a3;
}

- (TSDEditor)hostEditor
{
  return self->_hostEditor;
}

- (void)setHostEditor:(id)a3
{
  self->_hostEditor = (TSDEditor *)a3;
}

- (BOOL)suppressBreaks
{
  return self->_suppressBreaks;
}

- (void)setSuppressBreaks:(BOOL)a3
{
  self->_suppressBreaks = a3;
}

- (BOOL)suppressPhonetics
{
  return self->_suppressPhonetics;
}

- (void)setSuppressPhonetics:(BOOL)a3
{
  self->_suppressPhonetics = a3;
}

- (BOOL)suppressTabs
{
  return self->_suppressTabs;
}

- (void)setSuppressTabs:(BOOL)a3
{
  self->_suppressTabs = a3;
}

- (BOOL)disableInspector
{
  return self->_disableInspector;
}

- (void)setDisableInspector:(BOOL)a3
{
  self->_disableInspector = a3;
}

- (BOOL)coalescingText
{
  return self->_coalescingText;
}

- (BOOL)canCoalesceBreakingCharacters
{
  return self->_canCoalesceBreakingCharacters;
}

- (void)setCanCoalesceBreakingCharacters:(BOOL)a3
{
  self->_canCoalesceBreakingCharacters = a3;
}

- (id)tsax_listItemLabelForCharIndex:(unint64_t)a3 textIsLiteral:(BOOL *)a4
{
  *a4 = 1;
  [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] layoutIfNeeded];
  uint64_t v10 = 0;
  id result = [(TSWPEditingController *)self p_lineFragmentForCharIndex:a3 column:&v10 eol:1];
  if (result)
  {
    uint64_t v8 = *((void *)result + 22);
    if (!v8) {
      return 0;
    }
    int v9 = *(_DWORD *)(v8 + 64);
    if ((v9 - 2) < 2) {
      return *(id *)(v8 + 96);
    }
    if (v9 == 1)
    {
      id result = (id)[(id)TSWPBundle() localizedStringForKey:@"Image bullet" value:&stru_26D688A48 table:@"TSText"];
      *a4 = 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (_NSRange)tsax_rangeOfLineFragmentAtCharIndex:(unint64_t)a3
{
  [(TSDInteractiveCanvasController *)[(TSWPEditingController *)self interactiveCanvasController] layoutIfNeeded];
  uint64_t v9 = 0;
  id v5 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:a3 column:&v9 eol:1];
  uint64_t v6 = (NSUInteger *)MEMORY[0x263F7C7C8];
  if (v5) {
    uint64_t v6 = v5;
  }
  NSUInteger v7 = *v6;
  NSUInteger v8 = v6[1];
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (id)dragItemForCurrentSelectionWithDragInteraction:(id)a3 session:(id)a4 withTouchPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v10 = [(TSWPEditingController *)self interactiveCanvasController];
  uint64_t v11 = [(TSWPEditingController *)self storage];
  unint64_t v12 = [(TSWPEditingController *)self selection];
  id v13 = [(TSWPEditingController *)self stringFromSelection];
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](v10, "convertBoundsToUnscaledPoint:", x, y);
  if (v11
    && (double v16 = v14, v17 = v15, [(TSWPSelection *)v12 range], v18)
    && [v13 length]
    && -[TSWPEditingController isUnscaledPointInTextSelection:](self, "isUnscaledPointInTextSelection:", v16, v17))
  {
    uint64_t v28 = 0;
    -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](v10, "hitKnobAtPoint:returningRep:", &v28, v16, v17);
    id v19 = 0;
    if (!v28)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      id v20 = +[TSWPEditingController _targetedDragPreviewForSelection:v12 interactiveCanvasController:v10 reps:[(TSWPEditingController *)self _repsForStorage:v11 selection:v12] applyScale:0 imageFrameUnion:&v26];
      uint64_t v21 = +[TSWPStorageItemProvider storageItemProviderWithString:v13];
      uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F088E0]) initWithObject:v21];
      unint64_t v23 = [TSWPDragItem alloc];
      unint64_t v24 = -[TSWPDragItem initWithDragPreview:canvasRect:](v23, "initWithDragPreview:canvasRect:", v20, v26, v27);
      id v19 = (id)[objc_alloc(MEMORY[0x263F1C5E0]) initWithItemProvider:v22];
      [v19 setLocalObject:v24];
    }
  }
  else
  {
    id v19 = (id)objc_msgSend((id)objc_opt_class(), "dragItemForHitRepWithDragInteraction:session:canvasView:icc:withTouchPoint:", a3, a4, objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](-[TSWPEditingController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "asiOSCVC"), "view"), self->_interactiveCanvasController, x, y);
  }
  return v19;
}

+ (id)dragItemForHitRepWithDragInteraction:(id)a3 session:(id)a4 canvasView:(id)a5 icc:(id)a6 withTouchPoint:(CGPoint)a7
{
  objc_msgSend(a6, "convertBoundsToUnscaledPoint:", a7.x, a7.y);
  double v12 = v11;
  double v14 = v13;
  objc_opt_class();
  objc_msgSend(a6, "hitRep:", v12, v14);
  double v15 = (void *)TSUDynamicCast();
  objc_msgSend(v15, "convertNaturalPointFromUnscaledCanvas:", v12, v14);
  double v17 = v16;
  double v19 = v18;
  objc_opt_class();
  objc_msgSend(v15, "smartFieldAtPoint:", v17, v19);
  uint64_t v20 = TSUDynamicCast();
  if (!v20)
  {
    id v24 = 0;
    goto LABEL_16;
  }
  uint64_t v21 = (void *)v20;
  [a6 delegate];
  char v22 = objc_opt_respondsToSelector();
  unint64_t v23 = (void *)[a6 delegate];
  if (v22)
  {
    id v24 = (id)[v23 interactiveCanvasController:a6 dragItemForSmartField:v21 interaction:a3 session:a4];
    if (!v24) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  if (objc_opt_respondsToSelector()) {
    char v25 = objc_msgSend((id)objc_msgSend(a6, "delegate"), "interactiveCanvasController:allowsDragOfSmartField:", a6, v21) ^ 1;
  }
  else {
    char v25 = 0;
  }
  objc_opt_class();
  long long v26 = (void *)TSUDynamicCast();
  id v24 = 0;
  if ([v26 url] && (v25 & 1) == 0)
  {
    uint64_t v27 = [v26 displayText];
    if (!v27) {
      uint64_t v27 = objc_msgSend((id)objc_msgSend(v26, "url"), "absoluteString");
    }
    uint64_t v28 = [v26 range];
    objc_msgSend(v15, "rectForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v28, v29));
    objc_msgSend(v15, "convertNaturalRectToUnscaledCanvas:");
    objc_msgSend(a6, "convertUnscaledToBoundsPoint:", TSDCenterOfRect(v30, v31, v32, v33));
    NSUInteger v36 = objc_msgSend(objc_alloc(MEMORY[0x263F1C5F0]), "initWithContainer:center:", a5, v34, v35);
    id v37 = (id)objc_msgSend(MEMORY[0x263F1CA78], "previewForURL:title:target:", objc_msgSend(v26, "url"), v27, v36);

    uint64_t v38 = objc_msgSend(MEMORY[0x263F088E0], "itemProviderWithURL:title:", objc_msgSend(v26, "url"), v27);
    id v24 = (id)[objc_alloc(MEMORY[0x263F1C5E0]) initWithItemProvider:v38];
    [v24 setLocalObject:v37];

    if (v24)
    {
LABEL_14:
      [v24 localObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v39 = [v21 range];
        objc_msgSend(v15, "rectForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v39, v40));
        objc_msgSend(v15, "convertNaturalRectToUnscaledCanvas:");
        double v42 = v41;
        double v44 = v43;
        double v46 = v45;
        double v48 = v47;
        uint64_t v49 = [v24 localObject];
        double v50 = [TSWPURLDragItem alloc];
        uint64_t v51 = [v21 range];
        CGRect v53 = -[TSWPURLDragItem initWithDragPreview:canvasRect:canvasDragPoint:range:](v50, "initWithDragPreview:canvasRect:canvasDragPoint:range:", v49, v51, v52, v42, v44, v46, v48, v12, v14);
        [v24 setLocalObject:v53];
      }
    }
  }
LABEL_16:

  return v24;
}

+ (id)previewForDragItem:(id)a3
{
  [a3 localObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = (void *)[a3 localObject];
  if (isKindOfClass) {
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = (void *)[a3 localObject];

  return (id)[v6 targetedDragPreview];
}

+ (id)retargetedDragItem:(id)a3 withDefault:(id)a4 canvasView:(id)a5 icc:(id)a6
{
  [a3 localObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v10 = (void *)[a3 localObject];
  [v10 canvasRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = (void *)[a5 superview];
  objc_msgSend(a6, "convertUnscaledToBoundsRect:", v12, v14, v16, v18);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  objc_msgSend((id)objc_msgSend(v19, "superview"), "convertRect:fromView:", a5, v20, v22, v24, v26);
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  [v19 frame];
  v42.origin.double x = TSDRectWithSize();
  v42.origin.double y = v36;
  v42.size.double width = v37;
  v42.size.double height = v38;
  v41.origin.double x = v29;
  v41.origin.double y = v31;
  v41.size.double width = v33;
  v41.size.double height = v35;
  if (!CGRectIntersectsRect(v41, v42)) {
    return 0;
  }
  uint64_t v39 = objc_msgSend(v10, "retargetedDragPreviewForDefaultTargetedDragPreview:icc:canvasView:boundsRect:", a4, a6, a5, v21, v23, v25, v27);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v39, "view"), "layer"), "setZPosition:", 1.0);
  return v39;
}

+ (id)dropProposalForSession:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = objc_msgSend(a3, "items", 0);
  id v4 = (void *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      NSUInteger v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) localObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = (void *)[objc_alloc(MEMORY[0x263F1C600]) initWithDropOperation:0];
          return v4;
        }
        NSUInteger v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v4 = (void *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      id v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

+ (id)_targetedDragPreviewForSelection:(id)a3 interactiveCanvasController:(id)a4 reps:(id)a5 applyScale:(BOOL)a6 imageFrameUnion:(CGRect *)a7
{
  BOOL v64 = a6;
  uint64_t v94 = *MEMORY[0x263EF8340];
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  id v71 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a5, "count"));
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  obuint64_t j = a5;
  uint64_t v13 = [a5 countByEnumeratingWithState:&v86 objects:v93 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v87;
    long long v68 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    long long v69 = *MEMORY[0x263F001A8];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v87 != v15) {
          objc_enumerationMutation(obj);
        }
        double v17 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        *(_OWORD *)&v73.a = v69;
        *(_OWORD *)&v73.c = v68;
        double v18 = (void *)[v17 textImageForSelection:a3 frame:&v73 usingGlyphRect:0 drawBackground:0 shouldPulsate:0 suppressInvisibles:1];
        objc_msgSend(v17, "convertNaturalRectToUnscaledCanvas:", v73.a, v73.b, v73.c, v73.d);
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        v95.origin.CGFloat x = x;
        v95.origin.CGFloat y = y;
        v95.size.CGFloat width = width;
        v95.size.CGFloat height = height;
        if (CGRectIsNull(v95))
        {
          CGFloat height = v26;
          CGFloat width = v24;
          CGFloat y = v22;
          CGFloat x = v20;
        }
        else
        {
          v96.origin.CGFloat x = x;
          v96.origin.CGFloat y = y;
          v96.size.CGFloat width = width;
          v96.size.CGFloat height = height;
          v98.origin.CGFloat x = v20;
          v98.origin.CGFloat y = v22;
          v98.size.CGFloat width = v24;
          v98.size.CGFloat height = v26;
          CGRect v97 = CGRectUnion(v96, v98);
          CGFloat x = v97.origin.x;
          CGFloat y = v97.origin.y;
          CGFloat width = v97.size.width;
          CGFloat height = v97.size.height;
        }
        double v27 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithImage:", objc_msgSend(v18, "UIImage"));
        objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);
        [v71 addObject:v27];

        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        double v28 = (void *)[v17 selectionRects];
        uint64_t v29 = [v28 countByEnumeratingWithState:&v82 objects:v92 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v83;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v83 != v31) {
                objc_enumerationMutation(v28);
              }
              [*(id *)(*((void *)&v82 + 1) + 8 * j) CGRectValue];
              objc_msgSend(v17, "convertNaturalRectToUnscaledCanvas:");
              objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:"));
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v82 objects:v92 count:16];
          }
          while (v30);
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v86 objects:v93 count:16];
    }
    while (v14);
  }
  CGFloat v33 = objc_msgSend((id)objc_msgSend(a4, "layerHost"), "asiOSCVC");
  uint64_t v34 = [v33 view];
  objc_msgSend(a4, "convertUnscaledToBoundsPoint:", TSDCenterOfRect(x, y, width, height));
  double v36 = v35;
  double v38 = v37;
  uint64_t v39 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", TSDRectWithCenterAndSize(v35, v37, width));
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v40 = [v71 countByEnumeratingWithState:&v78 objects:v91 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v79;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v79 != v42) {
          objc_enumerationMutation(v71);
        }
        double v44 = *(void **)(*((void *)&v78 + 1) + 8 * k);
        [v44 frame];
        objc_msgSend(v44, "setFrame:", TSDSubtractPoints(v45, v46, x));
        [v39 addSubview:v44];
      }
      uint64_t v41 = [v71 countByEnumeratingWithState:&v78 objects:v91 count:16];
    }
    while (v41);
  }
  id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v48 = [v12 countByEnumeratingWithState:&v74 objects:v90 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v75;
    do
    {
      for (uint64_t m = 0; m != v49; ++m)
      {
        if (*(void *)v75 != v50) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v74 + 1) + 8 * m) CGRectValue];
        objc_msgSend(v47, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", TSDSubtractPoints(v52, v53, x)));
      }
      uint64_t v49 = [v12 countByEnumeratingWithState:&v74 objects:v90 count:16];
    }
    while (v49);
  }

  memset(&v73, 0, sizeof(v73));
  if (v64)
  {
    [a4 viewScale];
    CGFloat v55 = v54;
    [a4 viewScale];
    CGAffineTransformMakeScale(&v73, v55, v56);
  }
  else
  {
    long long v57 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v73.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v73.c = v57;
    *(_OWORD *)&v73.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  }
  id v58 = objc_alloc(MEMORY[0x263F1C5F0]);
  CGAffineTransform v72 = v73;
  uint64_t v59 = objc_msgSend(v58, "initWithContainer:center:transform:", v34, &v72, v36, v38);
  id v60 = (void *)[objc_alloc(MEMORY[0x263F1C5E8]) initWithTextLineRects:v47];

  id v61 = (void *)[v33 delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v60, "setBackgroundColor:", objc_msgSend(v61, "backgroundColorForDragUIPlatter"));
  }
  uint64_t v62 = (void *)[objc_alloc(MEMORY[0x263F1CA78]) initWithView:v39 parameters:v60 target:v59];

  if (a7)
  {
    a7->origin.CGFloat x = x;
    a7->origin.CGFloat y = y;
    a7->size.CGFloat width = width;
    a7->size.CGFloat height = height;
  }
  return v62;
}

- (BOOL)pIsSelectionPlaceHolderText
{
  return [(TSWPEditingController *)self pIsSelectionPlaceHolderTextWithSelection:self->_selection];
}

- (BOOL)pIsSelectionPlaceHolderTextWithSelection:(id)a3
{
  int v5 = [a3 isValid];
  if (v5)
  {
    unint64_t v6 = [a3 range];
    if (!v7)
    {
LABEL_8:
      LOBYTE(v5) = 0;
      return v5;
    }
    unint64_t v8 = v6;
    unint64_t v9 = v6 + v7;
    if (v6 < v6 + v7)
    {
      do
      {
        id v10 = [(TSWPStorage *)self->_storage smartFieldAtCharIndex:v8 attributeKind:6 effectiveRange:&v12];
        if (!v10 || ([v10 isMemberOfClass:objc_opt_class()] & 1) == 0) {
          goto LABEL_8;
        }
        unint64_t v8 = v13 + v12;
      }
      while (v13 + v12 < v9);
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)p_caretCharIndexForLayoutOrderCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  unint64_t v4 = a3;
  if ((unint64_t)a4 >= 2)
  {
    if ((unint64_t)(a4 - 2) > 1)
    {
      uint64_t v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v14 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) p_caretCharIndexForLayoutOrderCharIndex:inDirection:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 107, @"Unsupported vertical character direction");
    }
    else
    {
      unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
        return result;
      }
      unint64_t v7 = [(TSWPStorage *)self->_storage selectionRangeForCharIndex:a3];
      uint64_t v9 = v8;
      [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layoutIfNeeded];
      uint64_t v15 = 0;
      id v10 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:v4 column:&v15 eol:0];
      if (v10)
      {
        unint64_t v11 = TSWPLineFragment::caretCharIndexForLayoutOrderCharIndex(v10, v4, self->_storage);
        if (v11 <= v7 + v9 && v11 >= v7) {
          return v11;
        }
      }
    }
  }
  return v4;
}

- (unint64_t)p_layoutOrderCharIndexForCaretCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  unint64_t v4 = a3;
  if ((unint64_t)a4 >= 2)
  {
    if ((unint64_t)(a4 - 2) > 1)
    {
      uint64_t v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v14 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) p_layoutOrderCharIndexForCaretCharIndex:inDirection:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 151, @"Unsupported vertical character direction");
    }
    else
    {
      unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
        return result;
      }
      unint64_t v7 = [(TSWPStorage *)self->_storage selectionRangeForCharIndex:a3];
      uint64_t v9 = v8;
      [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layoutIfNeeded];
      uint64_t v15 = 0;
      id v10 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:v4 column:&v15 eol:0];
      if (v10)
      {
        unint64_t v11 = TSWPLineFragment::layoutOrderCharIndexForCaretCharIndex(v10, v4, self->_storage);
        if (v11 <= v7 + v9 && v11 >= v7) {
          return v11;
        }
      }
    }
  }
  return v4;
}

- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  return [(TSWPEditingController *)self charIndexMovingByCharacterFromCharIndex:a3 leadingEdge:0 inDirection:a4];
}

- (_NSRange)p_expandParagraphRangeForEnumerator:(TSWPParagraphEnumerator *)a3
{
  NSUInteger location = TSWPParagraphEnumerator::paragraphTextRange(a3);
  NSUInteger length = v5;
  if (!TSWPParagraphEnumerator::isFirstParagraph(a3))
  {
    TSWPParagraphEnumerator::operator--(a3);
    v18.NSUInteger location = TSWPParagraphEnumerator::paragraphTextRange(a3);
    v18.NSUInteger length = v7;
    v16.NSUInteger location = location;
    v16.NSUInteger length = length;
    NSRange v8 = NSUnionRange(v16, v18);
    NSUInteger location = v8.location;
    NSUInteger length = v8.length;
    TSWPParagraphEnumerator::operator++(a3);
  }
  if (TSWPParagraphEnumerator::isLastParagraph(a3))
  {
    NSUInteger v9 = location;
    NSUInteger v10 = length;
  }
  else
  {
    TSWPParagraphEnumerator::operator++(a3);
    v12.NSUInteger location = TSWPParagraphEnumerator::paragraphTextRange(a3);
    v12.NSUInteger length = v11;
    v13.NSUInteger location = location;
    v13.NSUInteger length = length;
    NSRange v14 = NSUnionRange(v13, v12);
    NSUInteger v10 = v14.length;
    NSUInteger v9 = v14.location;
  }
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL *)a4 inDirection:(int64_t)a5
{
  unint64_t v8 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:");
  uint64_t v10 = v9;
  storage = self->_storage;
  if (storage) {
    [(TSWPStorage *)storage paragraphEnumeratorAtCharIndex:a3 styleProvider:0];
  }
  else {
    memset(&v64, 0, sizeof(v64));
  }
  uint64_t v12 = [(TSWPEditingController *)self p_expandParagraphRangeForEnumerator:&v64];
  id v14 = -[TSWPStorage textSourceForLayoutInRange:]([(TSWPEditingController *)self storage], "textSourceForLayoutInRange:", v12, v13);
  unint64_t v15 = v8 + v10;
  int v16 = 1;
  switch(a5)
  {
    case 0:
      if (v15 <= a3) {
        goto LABEL_9;
      }
      while ([(TSWPStorage *)self->_storage anchoredDrawableAttachmentCharacterAtCharIndex:a3])
      {
        if (v15 == ++a3)
        {
          a3 = v15;
          break;
        }
      }
LABEL_9:
      unint64_t v17 = [v14 charIndexMappedFromStorage:a3];
      if (v17 >= [v14 charIndexMappedFromStorage:v15])
      {
        uint64_t v55 = [v14 charIndexRemappedFromStorage:v15];
        goto LABEL_79;
      }
      uint64_t v18 = objc_msgSend(-[TSWPStorage string](self->_storage, "string"), "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v14, "charIndexMappedToStorage:", v17));
      unint64_t v20 = v18 + v19;
      if (v18 + v19 > v15)
      {
        double v21 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v22 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:]"];
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 237, @"composed character extends past storage boundary");
      }
      goto LABEL_88;
    case 1:
      do
      {
        unint64_t v20 = a3;
        if (a3 <= v8) {
          break;
        }
        --a3;
      }
      while ([(TSWPStorage *)self->_storage anchoredDrawableAttachmentCharacterAtCharIndex:v20 - 1]);
      unint64_t v23 = [v14 charIndexMappedFromStorage:v20];
      if (v23 > [v14 charIndexMappedFromStorage:v8])
      {
        unint64_t v24 = [v14 charIndexMappedToStorage:v23 - 1];
        unint64_t v25 = objc_msgSend(-[TSWPStorage string](self->_storage, "string"), "length");
        double v26 = self->_storage;
        if (v24 >= v25) {
          uint64_t v27 = objc_msgSend(-[TSWPStorage string](v26, "string"), "length");
        }
        else {
          uint64_t v27 = objc_msgSend(-[TSWPStorage string](v26, "string"), "rangeOfComposedCharacterSequenceAtIndex:", v24);
        }
        unint64_t v20 = v27;
      }
      unint64_t v56 = [v14 charIndexMappedToStorage:v23];
      if (v56 > v8)
      {
        unint64_t v57 = [v14 charIndexRemappedFromStorage:v56 - 1];
        unint64_t v58 = objc_msgSend(-[TSWPStorage string](self->_storage, "string"), "length");
        uint64_t v59 = self->_storage;
        unint64_t v60 = v57 >= v58
            ? objc_msgSend(-[TSWPStorage string](v59, "string"), "length")
            : objc_msgSend(-[TSWPStorage string](v59, "string"), "rangeOfComposedCharacterSequenceAtIndex:", v57);
        if (v60 < v20) {
          unint64_t v20 = v60;
        }
      }
      goto LABEL_88;
    case 2:
      goto LABEL_19;
    case 3:
      int v16 = 0;
LABEL_19:
      [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layoutIfNeeded];
      uint64_t v63 = 0;
      uint64_t v30 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:a3 column:&v63 eol:0];
      uint64_t v31 = v30;
      if (!v30)
      {
        unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_43:
        int v41 = v16 ^ [(TSWPStorage *)self->_storage isWritingDirectionRightToLeftForParagraphAtCharIndex:a3];
        if (v31)
        {
          unint64_t v42 = *v31;
          uint64_t v31 = (unint64_t *)v31[1];
        }
        else
        {
          unint64_t v42 = a3;
        }
        unint64_t v45 = v42 - 1;
        if (v42 <= v8) {
          unint64_t v45 = v20;
        }
        if (v31) {
          unint64_t v46 = (unint64_t)v31 + v42;
        }
        else {
          unint64_t v46 = v42 + 1;
        }
        if ((unint64_t)v31 + v42 < v15) {
          unint64_t v47 = v46;
        }
        else {
          unint64_t v47 = v20;
        }
        if (v41) {
          unint64_t v48 = v47;
        }
        else {
          unint64_t v48 = v45;
        }
        if (v48 == 0x7FFFFFFFFFFFFFFFLL
          || (uint64_t v49 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:v48 column:&v63 eol:0], (v50 = v49) == 0))
        {
          if (v41) {
            double v52 = v31;
          }
          else {
            double v52 = 0;
          }
          unint64_t v20 = (unint64_t)v52 + v42;
        }
        else
        {
          if (v16) {
            uint64_t v51 = TSWPLineFragment::leftMostCharIndex(v49);
          }
          else {
            uint64_t v51 = TSWPLineFragment::rightMostCharIndex(v49);
          }
          unint64_t v20 = v51;
          if (a4 && (*((_DWORD *)v50 + 6) & 0x4800) == 0x4000) {
            *a4 = 1;
          }
        }
        if (v20 == 0x7FFFFFFFFFFFFFFFLL || v20 < v8 || v20 > v15)
        {
          uint64_t v55 = [v14 charIndexRemappedFromStorage:a3];
LABEL_79:
          unint64_t v20 = v55;
        }
        goto LABEL_88;
      }
      if (v16) {
        int v32 = 2;
      }
      else {
        int v32 = 3;
      }
      unint64_t v33 = TSWPLineFragment::nextOrPreviousCharIndexForDirection((uint64_t)v30, a3, v32, self->_storage);
      unint64_t v20 = v33;
      if (v33 == 0x7FFFFFFFFFFFFFFFLL || v33 < v8 || v33 > v15)
      {
        if (a4 && v31[1] + *v31 > a3)
        {
          int v36 = *a4;
          int v37 = TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v31, a3) == 1;
          BOOL v38 = v36 == v37;
          BOOL v39 = v36 != v37;
          int v40 = v38;
          if (!v16) {
            BOOL v39 = v40;
          }
          if (v39
            && (IsParagraphBreakingCharacter([(TSWPStorage *)self->_storage characterAtIndex:a3]) & 1) == 0)
          {
            *a4 = v36 ^ 1;
            if (a3 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v20 = a3;
              goto LABEL_88;
            }
          }
        }
        goto LABEL_43;
      }
      if (!a4) {
        goto LABEL_88;
      }
      BOOL v43 = *a4;
      int v44 = TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v31, v33);
      if (v44 == TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v31, a3))
      {
        if (*a4) {
          goto LABEL_88;
        }
      }
      else
      {
        *a4 = !v43;
        if (!v43) {
          goto LABEL_88;
        }
      }
      if (v20 == v31[1] + *v31) {
        *a4 = 1;
      }
LABEL_88:
      TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v64);
      return v20;
    default:
      double v28 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v29 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:]"];
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 346, @"Unsupported vertical character direction");
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_88;
  }
}

- (BOOL)p_isLayoutLeftToRightAtCharIndex:(unint64_t)a3
{
  [(TSDInteractiveCanvasController *)self->_interactiveCanvasController layoutIfNeeded];
  uint64_t v7 = 0;
  NSUInteger v5 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:a3 column:&v7 eol:0];
  return !v5 || TSWPLineFragment::writingDirectionForCharIndex(v5, a3) == 0;
}

- (unint64_t)p_adjustedCharIndexForWordTestingFromCharIndex:(unint64_t)a3 forDirection:(int64_t)a4
{
  if ((unint64_t)a4 >= 4)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 375, @"Bad input direction.");
  }
  switch(a4)
  {
    case 0:
      storage = self->_storage;
      if (storage) {
        [(TSWPStorage *)storage paragraphEnumeratorAtCharIndex:a3 styleProvider:0];
      }
      else {
        memset(&v29, 0, sizeof(v29));
      }
      uint64_t v26 = [(TSWPEditingController *)self p_expandParagraphRangeForEnumerator:&v29];
      a3 = objc_msgSend(-[TSWPStorage textSourceForLayoutInRange:](-[TSWPEditingController storage](self, "storage"), "textSourceForLayoutInRange:", v26, v27), "charIndexRemappedFromStorage:", a3);
      TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v29);
      break;
    case 1:
      unint64_t v22 = [(TSWPEditingController *)self charIndexMovingByCharacterFromCharIndex:a3 inDirection:1];
      if (v22 == 0x7FFFFFFFFFFFFFFFLL || v22 == a3) {
        a3 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        a3 = v22;
      }
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v24 = [MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v25 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:]"];
        uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"];
        unint64_t v15 = (void *)v24;
        uint64_t v16 = v25;
        uint64_t v17 = 424;
        goto LABEL_32;
      }
      break;
    case 2:
      if (![(TSWPEditingController *)self p_isLayoutLeftToRightAtCharIndex:a3])
      {
        unint64_t v10 = [(TSWPEditingController *)self charIndexMovingByCharacterFromCharIndex:a3 inDirection:2];
        BOOL v11 = v10 == 0x7FFFFFFFFFFFFFFFLL || v10 == a3;
        a3 = v11 ? 0x7FFFFFFFFFFFFFFFLL : v10;
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v12 = [MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v13 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:]"];
          uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"];
          unint64_t v15 = (void *)v12;
          uint64_t v16 = v13;
          uint64_t v17 = 410;
          goto LABEL_32;
        }
      }
      break;
    case 3:
      if ([(TSWPEditingController *)self p_isLayoutLeftToRightAtCharIndex:a3])
      {
        unint64_t v18 = [(TSWPEditingController *)self charIndexMovingByCharacterFromCharIndex:a3 inDirection:3];
        BOOL v19 = v18 == 0x7FFFFFFFFFFFFFFFLL || v18 == a3;
        a3 = v19 ? 0x7FFFFFFFFFFFFFFFLL : v18;
        if (v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v20 = [MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v21 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:]"];
          uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"];
          unint64_t v15 = (void *)v20;
          uint64_t v16 = v21;
          uint64_t v17 = 389;
LABEL_32:
          [v15 handleFailureInFunction:v16 file:v14 lineNumber:v17 description:@"Should not have received NSNotFound."];
          a3 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      break;
    default:
      return a3;
  }
  return a3;
}

- (__CFStringTokenizer)p_createTokenizerForCharIndex:(unint64_t)a3 outTokenizerRange:(_NSRange *)a4
{
  a4->NSUInteger location = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:");
  a4->NSUInteger length = v7;
  uint64_t v8 = CFStringTokenizerCreate(0, (CFStringRef)[(TSWPStorage *)self->_storage string], *(CFRange *)a4, 0, 0);
  CFStringTokenizerGoToTokenAtIndex(v8, a3);
  return v8;
}

- (int)p_moveFromCharIndex:(unint64_t *)a3 tokenizerRef:(__CFStringTokenizer *)a4 tokenizerRange:(_NSRange *)a5 direction:(int64_t)a6 currentWordRange:(_NSRange)a7 newWordRange:(_NSRange *)a8 reasonToStop:(unsigned int)a9
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  storage = self->_storage;
  if (storage) {
    [(TSWPStorage *)storage paragraphEnumeratorAtCharIndex:*a3 styleProvider:0];
  }
  else {
    memset(&v42, 0, sizeof(v42));
  }
  uint64_t v13 = [(TSWPEditingController *)self p_expandParagraphRangeForEnumerator:&v42];
  id v37 = -[TSWPStorage textSourceForLayoutInRange:]([(TSWPEditingController *)self storage], "textSourceForLayoutInRange:", v13, v14);
  objc_msgSend(v37, "charRangeMappedFromStorage:", location, length);
  int v36 = a8;
  unint64_t v15 = *a3;
  while (1)
  {
    NSUInteger v16 = -[TSWPEditingController p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:](self, "p_adjustedCharIndexForWordTestingFromCharIndex:forDirection:", v15, a6, v36);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_38;
    }
    uint64_t v17 = *a4;
    if (!*a4) {
      goto LABEL_13;
    }
    if (v16 < a5->location || v16 - a5->location >= a5->length)
    {
      CFRelease(v17);
      *a4 = 0;
LABEL_13:
      uint64_t v17 = [(TSWPEditingController *)self p_createTokenizerForCharIndex:v16 outTokenizerRange:a5];
      *a4 = v17;
    }
    CFStringTokenizerTokenType v19 = CFStringTokenizerGoToTokenAtIndex(v17, v16);
    if ((a9 & 2) != 0 && !v19)
    {
      int v31 = 2;
      goto LABEL_42;
    }
    if (!v19) {
      goto LABEL_32;
    }
    BOOL v20 = location == *MEMORY[0x263F7C7C8] && length == *(void *)(MEMORY[0x263F7C7C8] + 8);
    BOOL v21 = v20;
    if ((a9 & 4) != 0 && !v21) {
      break;
    }
    if ((a9 & 8) != 0)
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(*a4);
      CFIndex v23 = CurrentTokenRange.location;
      CFIndex v24 = CurrentTokenRange.length;
      int v31 = 8;
      goto LABEL_41;
    }
LABEL_32:
    unint64_t v30 = [(TSWPEditingController *)self charIndexMovingByCharacterFromCharIndex:*a3 inDirection:a6];
    unint64_t v15 = v30;
    if (v30 == 0x7FFFFFFFFFFFFFFFLL || v30 == *a3)
    {
      if (v30 == 0x7FFFFFFFFFFFFFFFLL)
      {
        int v32 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v33 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) p_moveFromCharIndex:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:]"];
        objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 533, @"Should not have received NSNotFound.");
      }
LABEL_38:
      int v31 = 1;
      goto LABEL_42;
    }
    *a3 = v30;
  }
  CFRange v22 = CFStringTokenizerGetCurrentTokenRange(*a4);
  CFIndex v23 = v22.location;
  CFIndex v24 = v22.length;
  objc_msgSend(v37, "charRangeMappedFromStorage:", v22.location, v22.length);
  uint64_t v25 = NSIntersectionRangeInclusive();
  uint64_t v27 = v26;
  uint64_t v28 = NSIntersectionRangeInclusive();
  if (v22.location == location && v22.length == length || v29 | v28 && (v27 || !v25)) {
    goto LABEL_32;
  }
  int v31 = 4;
LABEL_41:
  v36->NSUInteger location = v23;
  v36->NSUInteger length = v24;
LABEL_42:
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v42);
  return v31;
}

- (unint64_t)charIndexMovingByWordFromCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  if ((unint64_t)a4 > 3)
  {
    CFStringTokenizerTokenType v19 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
    uint64_t v20 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) charIndexMovingByWordFromCharIndex:inDirection:]"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 646, @"Unsupported direction");
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = a3;
  unint64_t v7 = -[TSWPStorage selectionRangeForCharIndex:](self->_storage, "selectionRangeForCharIndex:");
  uint64_t v9 = v8;
  unint64_t v29 = v5;
  unint64_t v10 = (long long *)MEMORY[0x263F7C7C8];
  long long v28 = *MEMORY[0x263F7C7C8];
  unint64_t v11 = [(TSWPEditingController *)self p_adjustedCharIndexForWordTestingFromCharIndex:v5 forDirection:a4];
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    return result;
  }
  long long v27 = *v10;
  CFTypeRef cf = [(TSWPEditingController *)self p_createTokenizerForCharIndex:v11 outTokenizerRange:&v27];
  CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)cf);
  LODWORD(v24) = 7;
  unsigned int v14 = -[TSWPEditingController p_moveFromCharIndex:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:](self, "p_moveFromCharIndex:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:", &v29, &cf, &v27, a4, CurrentTokenRange.location, CurrentTokenRange.length, &v28, v24);
  BOOL v15 = CurrentTokenRange.location == *(void *)v10 && CurrentTokenRange.length == *((void *)v10 + 1);
  if (v15 || (unint64_t v16 = v29, v29 == v5))
  {
    if (v14 == 4 || v14 == 1) {
      goto LABEL_11;
    }
  }
  else if (v14 <= 4 && ((1 << v14) & 0x16) != 0)
  {
    goto LABEL_12;
  }
  LODWORD(v25) = 8;
  -[TSWPEditingController p_moveFromCharIndex:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:](self, "p_moveFromCharIndex:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:", &v29, &cf, &v27, a4, &v28, v25);
LABEL_11:
  unint64_t v16 = v29;
LABEL_12:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v16 >= v7)
    {
      unint64_t v21 = v7 + v9;
      unint64_t v5 = v16;
      if (v16 > v21)
      {
        CFRange v22 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v23 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) charIndexMovingByWordFromCharIndex:inDirection:]"];
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 637, @"Result beyond selection range max.");
        return v21;
      }
    }
    else
    {
      uint64_t v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v18 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) charIndexMovingByWordFromCharIndex:inDirection:]"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 632, @"Result beyond selection range min.");
      return v7;
    }
  }
  return v5;
}

- (_NSRange)p_adjustVisualSelection:(id)a3 withOtherSelection:(id)a4
{
  unint64_t v6 = *MEMORY[0x263F7C7C8];
  NSUInteger v7 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  id v8 = [(TSWPEditingController *)self calculateVisualRunsFromSelection:a3 updateControllerSelection:0];
  id v9 = [(TSWPEditingController *)self calculateVisualRunsFromSelection:a4 updateControllerSelection:0];
  [(TSWPEditingController *)self p_selection:v8 toGlyphRange:&v50];
  [(TSWPEditingController *)self p_selection:v9 toGlyphRange:&v43];
  if (vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqzq_s64(v50), (int32x4_t)vceqzq_s64(v43))))) {
    goto LABEL_96;
  }
  if (v52 == v45 && v54 == v47 && v55 == v49)
  {
    unint64_t v6 = [v8 range];
    NSUInteger v7 = v10;
    goto LABEL_96;
  }
  if ([v8 isInsertionPoint])
  {
    int v11 = [v9 isInsertionPoint];
    uint64_t v12 = v50.i64[0];
    uint64_t v13 = v43.i64[0];
    if (!v11)
    {
      if (v50.i64[0] == v43.i64[0])
      {
        if (v51 >= v44)
        {
          long long v28 = &v45;
          unint64_t v27 = [(TSWPEditingController *)self p_LeftCharForInsertion:&v50];
        }
        else
        {
          unint64_t v27 = v52;
          long long v28 = &v47;
        }
        unint64_t v35 = *v28;
        BOOL v36 = v27 > *v28;
        if (v27 >= *v28) {
          unint64_t v14 = *v28;
        }
        else {
          unint64_t v14 = v27;
        }
        if (v36) {
          unint64_t v24 = v27;
        }
        else {
          unint64_t v24 = v35;
        }
        goto LABEL_88;
      }
      unint64_t v24 = v52;
      unint64_t v14 = v45;
      int v25 = *(_DWORD *)(v50.i64[0] + 24);
      if (v52 < v45)
      {
        if ((v25 & 0x1000) != 0) {
          unint64_t v24 = [(TSWPEditingController *)self p_LeftCharForInsertion:&v50];
        }
        unint64_t v14 = v24;
        unint64_t v24 = v47;
        goto LABEL_88;
      }
      if ((v25 & 0x1000) != 0)
      {
LABEL_88:
        storage = self->_storage;
        goto LABEL_89;
      }
LABEL_40:
      BOOL v15 = &v50;
LABEL_41:
      unint64_t v24 = [(TSWPEditingController *)self p_LeftCharForInsertion:v15];
      goto LABEL_88;
    }
    if (v50.i64[0] != v43.i64[0])
    {
      unint64_t v14 = v52;
      if (v52 < v45)
      {
        if ((*(unsigned char *)(v50.i64[0] + 25) & 0x10) != 0)
        {
          unint64_t v14 = [(TSWPEditingController *)self p_LeftCharForInsertion:&v50];
          uint64_t v13 = v43.i64[0];
        }
        if ((*(unsigned char *)(v13 + 25) & 0x10) != 0)
        {
          unint64_t v24 = v45 - v49;
          goto LABEL_88;
        }
        BOOL v15 = &v43;
        goto LABEL_41;
      }
      unint64_t v14 = v45;
      if ((*(unsigned char *)(v43.i64[0] + 25) & 0x10) != 0)
      {
        unint64_t v14 = [(TSWPEditingController *)self p_LeftCharForInsertion:&v43];
        uint64_t v12 = v50.i64[0];
      }
      if ((*(unsigned char *)(v12 + 25) & 0x10) != 0)
      {
        unint64_t v24 = v52;
        goto LABEL_88;
      }
      goto LABEL_40;
    }
    if (v51 <= v44)
    {
      unint64_t v26 = v52;
      if (!v55)
      {
        unint64_t v34 = [(TSWPEditingController *)self p_LeftCharForInsertion:&v43];
        goto LABEL_74;
      }
    }
    else
    {
      unint64_t v26 = [(TSWPEditingController *)self p_LeftCharForInsertion:&v50];
    }
    unint64_t v34 = v45;
LABEL_74:
    if (v26 >= v34) {
      unint64_t v14 = v34;
    }
    else {
      unint64_t v14 = v26;
    }
    if (v26 <= v34) {
      unint64_t v24 = v34;
    }
    else {
      unint64_t v24 = v26;
    }
    goto LABEL_88;
  }
  unint64_t v16 = (TSWPRangeVector *)[v8 visualRanges];
  if (!TSWPRangeVector::containsCharacterAtIndex(v16, v45, 0)
    || (uint64_t v17 = (TSWPRangeVector *)[v8 visualRanges],
        !TSWPRangeVector::containsCharacterAtIndex(v17, v47, 0)))
  {
    if (v43.i64[0] == v50.i64[0])
    {
      if ((*(unsigned char *)(v43.i64[0] + 25) & 0x10) != 0)
      {
        if (v44 < v51) {
          goto LABEL_22;
        }
      }
      else if (v44 >= v51)
      {
        goto LABEL_22;
      }
    }
    else if (v45 > v52)
    {
LABEL_22:
      unint64_t v23 = v52;
      goto LABEL_48;
    }
    if (v48 && (*(unsigned char *)(v43.i64[0] + 25) & 0x10) != 0) {
      unint64_t v23 = [(TSWPEditingController *)self p_LeftCharForInsertion:&v43];
    }
    else {
      unint64_t v23 = v45;
    }
LABEL_48:
    if (v43.i64[1] == v50.i64[1])
    {
      if ((*(unsigned char *)(v43.i64[1] + 25) & 0x10) != 0)
      {
        if (v46 > v53) {
          goto LABEL_50;
        }
      }
      else if (v46 < v53)
      {
        goto LABEL_50;
      }
    }
    else if (v47 < v54)
    {
LABEL_50:
      unint64_t v30 = v54;
      goto LABEL_60;
    }
    if (v48)
    {
      if ((*(unsigned char *)(v43.i64[0] + 25) & 0x10) != 0) {
        unint64_t v30 = v45;
      }
      else {
        unint64_t v30 = [(TSWPEditingController *)self p_LeftCharForInsertion:&v43];
      }
    }
    else
    {
      unint64_t v30 = v47;
    }
LABEL_60:
    if (v23 >= v30) {
      unint64_t v6 = v30;
    }
    else {
      unint64_t v6 = v23;
    }
    if (v23 <= v30) {
      unint64_t v22 = v30;
    }
    else {
      unint64_t v22 = v23;
    }
    int v31 = self->_storage;
LABEL_67:
    unint64_t v32 = [(TSWPStorage *)v31 nextCharacterIndex:v22];
    if (v6 <= v32) {
      unint64_t v33 = v32;
    }
    else {
      unint64_t v33 = v6;
    }
    if (v6 >= v32) {
      unint64_t v6 = v32;
    }
    goto LABEL_95;
  }
  unint64_t v18 = v45;
  uint64_t v19 = [v8 superRange];
  if (v18 <= v19 + (v20 >> 1))
  {
    unint64_t v14 = v45;
    storage = self->_storage;
    unint64_t v24 = v54;
LABEL_89:
    unint64_t v37 = [(TSWPStorage *)storage nextCharacterIndex:v24];
    if (v14 <= v37) {
      unint64_t v33 = v37;
    }
    else {
      unint64_t v33 = v14;
    }
    if (v14 >= v37) {
      unint64_t v6 = v37;
    }
    else {
      unint64_t v6 = v14;
    }
LABEL_95:
    NSUInteger v7 = v33 - v6;
    goto LABEL_96;
  }
  if (v43.i64[0] != v50.i64[0])
  {
    unint64_t v6 = v52;
    unint64_t v21 = self->_storage;
    if (*(void *)v50.i64[0] <= *(void *)v43.i64[0]) {
      unint64_t v22 = [(TSWPEditingController *)self p_LeftCharForInsertion:&v43];
    }
    else {
      unint64_t v22 = v45;
    }
    int v31 = v21;
    goto LABEL_67;
  }
  int v40 = *(_DWORD *)(v43.i64[0] + 24);
  if ((v40 & 0x1000) != 0)
  {
    unint64_t v41 = [(TSWPStorage *)self->_storage nextCharacterIndex:v45];
    int v40 = *(_DWORD *)(v43.i64[0] + 24);
  }
  else
  {
    unint64_t v41 = v45;
  }
  if ((v40 & 0x1000) == 0 && v49) {
    unint64_t v41 = [(TSWPStorage *)self->_storage nextCharacterIndex:v45];
  }
  if (v52 <= v41) {
    unint64_t v42 = v41;
  }
  else {
    unint64_t v42 = v52;
  }
  if (v52 >= v41) {
    unint64_t v6 = v41;
  }
  else {
    unint64_t v6 = v52;
  }
  NSUInteger v7 = v42 - v6;
LABEL_96:
  NSUInteger v38 = v6;
  NSUInteger v39 = v7;
  result.NSUInteger length = v39;
  result.NSUInteger location = v38;
  return result;
}

- (unint64_t)p_LeftCharForInsertion:(id *)a3
{
  var0 = a3->var0;
  unint64_t var3 = a3->var3;
  unint64_t v6 = var3;
  if (!a3->var7) {
    unint64_t v6 = TSWPLineFragment::nextOrPreviousCharIndexForDirection((uint64_t)a3->var0, a3->var3, 3, self->_storage);
  }
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 == [(TSWPStorage *)self->_storage characterCount])
    {
      storage = self->_storage;
      unint64_t v8 = v6;
      goto LABEL_9;
    }
    return v6;
  }
  if ((*((unsigned char *)var0 + 25) & 0x10) != 0 || !var3) {
    return var3;
  }
  storage = self->_storage;
  unint64_t v8 = *(void *)var0;
LABEL_9:

  return [(TSWPStorage *)storage previousCharacterIndex:v8];
}

- (unint64_t)p_rightEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4
{
  uint64_t v21 = 0;
  NSUInteger v7 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", [a3 start], &v21, 0);
  if (!v7) {
    return [a3 insertionChar];
  }
  unint64_t v8 = (unint64_t *)v7;
  if ([a3 isRange])
  {
    if ([a3 isVisual])
    {
      unint64_t v9 = *v8;
      unint64_t v10 = v8[1];
      unint64_t v11 = [a3 range];
      if (v9 <= v11 && v10 + v9 >= v11 + v12)
      {
        if ((*((unsigned char *)v8 + 25) & 0x10) != 0) {
          uint64_t v19 = [a3 headChar];
        }
        else {
          uint64_t v19 = [a3 tailChar];
        }
        unint64_t v13 = v19;
        int v16 = TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v8, v19);
        goto LABEL_25;
      }
      if ((*((unsigned char *)v8 + 25) & 0x10) != 0)
      {
        unint64_t v13 = [a3 headChar];
        int v18 = *((_DWORD *)v8 + 6);
        int v16 = [(TSWPEditingController *)self p_writingDirectionForCharAtIndex:v13];
        if ((v18 & 0x1000) != 0)
        {
LABEL_25:
          BOOL v17 = v16 == 1;
          goto LABEL_26;
        }
        goto LABEL_20;
      }
      unint64_t v13 = [a3 tailChar];
      unint64_t v14 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:v13 column:&v21 eol:0];
      if (v14)
      {
        int v15 = v14[6];
        int v16 = [(TSWPEditingController *)self p_writingDirectionForCharAtIndex:v13];
        if ((v15 & 0x1000) == 0) {
          goto LABEL_25;
        }
LABEL_20:
        BOOL v17 = v16 != 1;
        goto LABEL_26;
      }
      return [a3 insertionChar];
    }
    if ([a3 isValid])
    {
      unint64_t v13 = [a3 end];
      BOOL v17 = 1;
LABEL_26:
      *a4 = v17;
      return v13;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v13 = [a3 insertionChar];
    if ([a3 type] != 7 && v13 == v8[1] + *v8 && *a4 && v13)
    {
      unint64_t v13 = [(TSWPStorage *)self->_storage previousCharacterIndex:v13];
      *a4 = 0;
    }
  }
  return v13;
}

- (unint64_t)p_leftEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4
{
  uint64_t v22 = 0;
  NSUInteger v7 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", [a3 start], &v22, 0);
  if (!v7) {
    return [a3 insertionChar];
  }
  unint64_t v8 = (unint64_t *)v7;
  if ([a3 isVisual] && objc_msgSend(a3, "isRange"))
  {
    unint64_t v9 = *v8;
    unint64_t v10 = v8[1];
    unint64_t v11 = [a3 range];
    if (v9 <= v11 && v10 + v9 >= v11 + v12)
    {
      if ((*((unsigned char *)v8 + 25) & 0x10) != 0) {
        uint64_t v20 = [a3 tailChar];
      }
      else {
        uint64_t v20 = [a3 headChar];
      }
      uint64_t v13 = v20;
      int v16 = TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v8, v20);
      goto LABEL_23;
    }
    if ((*((unsigned char *)v8 + 25) & 0x10) != 0)
    {
      uint64_t v13 = [a3 tailChar];
      BOOL v17 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:v13 column:&v22 eol:0];
      if (v17)
      {
        int v18 = *((_DWORD *)v17 + 6);
        int v16 = TSWPLineFragment::writingDirectionForCharIndex(v17, v13);
        if ((v18 & 0x1000) != 0)
        {
LABEL_23:
          BOOL v19 = v16 != 1;
          goto LABEL_24;
        }
LABEL_17:
        BOOL v19 = v16 == 1;
LABEL_24:
        *a4 = v19;
        return v13;
      }
    }
    else
    {
      uint64_t v13 = [a3 headChar];
      unint64_t v14 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:v13 column:&v22 eol:0];
      if (v14)
      {
        int v15 = *((_DWORD *)v14 + 6);
        int v16 = TSWPLineFragment::writingDirectionForCharIndex(v14, v13);
        if ((v15 & 0x1000) == 0) {
          goto LABEL_23;
        }
        goto LABEL_17;
      }
    }
    return [a3 insertionChar];
  }
  uint64_t v13 = [a3 insertionChar];
  if ([a3 type] != 7 && v13 == v8[1] + *v8 && *a4 && v13)
  {
    uint64_t v13 = [(TSWPStorage *)self->_storage previousCharacterIndex:v13];
    *a4 = 0;
  }
  return v13;
}

- (void)p_selection:(id)a3 toGlyphRange:(id *)a4
{
  a4->BOOL var6 = [a3 isInsertionPoint];
  uint64_t v7 = [a3 rawRange];
  uint64_t v8 = v7;
  if (a4->var6)
  {
    a4->var7 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    unint64_t v9 = v7;
  }
  else
  {
    uint64_t v10 = [a3 end];
    BOOL var6 = a4->var6;
    unint64_t v9 = v10 - 1;
    a4->var7 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    if (!var6)
    {
LABEL_6:
      uint64_t v12 = 0;
      goto LABEL_7;
    }
  }
  if (objc_msgSend(a3, "caretAffinity", v21, v22) != 1) {
    goto LABEL_6;
  }
  uint64_t v12 = [a3 leadingEdge];
LABEL_7:
  var0 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v8, &v22, v12, v21);
  a4->var0 = var0;
  if (v12 && !var0)
  {
    var0 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:v8 - 1 column:&v22 eol:1];
    a4->var0 = var0;
  }
  unint64_t v14 = var0;
  if (!a4->var6)
  {
    unint64_t v14 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v9, &v21, [a3 caretAffinity] == 1);
    var0 = a4->var0;
  }
  a4->var1 = v14;
  if (var0)
  {
    uint64_t v15 = *((void *)var0 + 1);
    if (v15)
    {
      if (a4->var6)
      {
        if (v8 == *(void *)var0 + v15) {
          int v16 = (*((unsigned __int8 *)var0 + 25) >> 4) & 1;
        }
        else {
          int v16 = TSWPLineFragment::writingDirectionForCharIndex(var0, v8) == 1;
        }
        if (v16 == [a3 leadingEdge]) {
          uint64_t v8 = TSWPLineFragment::nextOrPreviousCharIndexForDirection((uint64_t)a4->var0, v8, 2, self->_storage);
        }
        if (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 == [(TSWPStorage *)self->_storage length])
        {
          uint64_t v8 = TSWPLineFragment::rightMostCharIndex(a4->var0);
          a4->var7 = 1;
        }
        unint64_t v20 = TSWPLineFragment::visualIndexForCharIndex(a4->var0, v8);
        a4->unint64_t var2 = v20;
        a4->unint64_t var3 = v8;
        a4->var4 = v20;
        a4->var5 = v8;
      }
      else if (v14)
      {
        a4->unint64_t var2 = TSWPLineFragment::visualIndexForCharIndex(var0, v8);
        unint64_t v18 = TSWPLineFragment::visualIndexForCharIndex(a4->var1, v9);
        a4->unint64_t var3 = v8;
        a4->var4 = v18;
        a4->var5 = v9;
        if (a4->var0 == a4->var1)
        {
          unint64_t var2 = a4->var2;
          if (var2 >= v18 != (*((unsigned char *)a4->var0 + 25) & 0x10) >> 4)
          {
            a4->unint64_t var2 = v18;
            a4->unint64_t var3 = v9;
            a4->var4 = var2;
            a4->var5 = v8;
          }
        }
      }
    }
    else
    {
      a4->unint64_t var2 = 0;
      a4->var4 = 0;
      if ((*((_DWORD *)var0 + 6) & 0x1000) != 0) {
        unint64_t v17 = v8 - 1;
      }
      else {
        unint64_t v17 = v8;
      }
      a4->unint64_t var3 = v17;
      a4->var5 = v8 - 1;
    }
  }
}

- (int)p_writingDirectionForCharAtIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return -1;
  }
  void v10[5] = v3;
  v10[6] = v4;
  v10[0] = 0;
  uint64_t v7 = [(TSWPEditingController *)self p_lineFragmentForCharIndex:a3 column:v10 eol:0];
  if (v7) {
    return TSWPLineFragment::writingDirectionForCharIndex(v7, a3 - (*((void *)v7 + 1) + *(void *)v7 == a3));
  }
  uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) p_writingDirectionForCharAtIndex:]"];
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 1119, @"invalid nil value for '%s'", "lineFragment");
  return -1;
}

- (const)p_lineFragmentWithCaretInfo:(id *)a3 forSelection:(id)a4
{
  uint64_t v35 = 0;
  uint64_t v7 = -[TSWPEditingController p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", [a4 range], &v35, objc_msgSend(a4, "isAtEndOfLine"));
  uint64_t v8 = (uint64_t)v7;
  if (v7)
  {
    int v9 = v7[6];
    unint64_t v10 = [a4 insertionChar];
    int v11 = TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v8, v10);
    BOOL v12 = v11 == 1;
    __int16 v30 = v9;
    int v33 = (unsigned __int16)(v9 & 0x1000) >> 12;
    int v34 = [a4 leadingEdge];
    if ((v9 & 0x1000) != 0) {
      int v13 = 2;
    }
    else {
      int v13 = 1;
    }
    unint64_t v14 = [(TSWPStorage *)self->_storage length];
    int v15 = v13;
    if (v10 < v14)
    {
      TSWPComposedCharacterAtIndexForTextSource(v10, self->_storage);
      int v15 = TSWPGetBidiClass();
    }
    int v32 = v15;
    if (([a4 isVisual] & 1) != 0
      || v10 <= *(void *)v8
      || (v11 == 1) == [(TSWPEditingController *)self editorKeyboardLanguageIsRTL])
    {
      BOOL v16 = v11 == 1;
      int v31 = v11 == 1;
      if (v31 != v34) {
        goto LABEL_13;
      }
    }
    else
    {
      unint64_t v10 = -[TSWPStorage previousCharacterIndex:](self->_storage, "previousCharacterIndex:", [a4 insertionChar]);
      BOOL v16 = 0;
      LOBYTE(v34) = 0;
      if (TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v8, v10) == 1)
      {
        LOBYTE(v3objc_msgSend(+[TSWPEditMenuController sharedEditMenuController](TSWPEditMenuController, "sharedEditMenuController"), "setIsBeginningEditing:", 1) = 1;
        BOOL v12 = 1;
LABEL_13:
        uint64_t v17 = TSWPLineFragment::nextOrPreviousCharIndexForDirection(v8, v10, 3, self->_storage);
        if (v17 == *(void *)(v8 + 8) + *(void *)v8) {
          unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v33) = TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v8, v18) == 1;
          TSWPComposedCharacterAtIndexForTextSource(v18, self->_storage);
          int v13 = TSWPGetBidiClass();
        }
        if (v10 == TSWPLineFragment::rightMostCharIndex((TSWPLineFragment *)v8))
        {
          uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
          if ((v30 & 0x1000) != 0)
          {
            uint64_t v19 = v10;
            BOOL v20 = v12;
          }
          else
          {
            BOOL v20 = 0;
          }
          int v21 = v32;
          BOOL v16 = v33;
          if ((v30 & 0x1000) != 0) {
            int v22 = v32;
          }
          else {
            int v22 = 1;
          }
          if ((*(unsigned char *)(v8 + 25) & 8) != 0) {
            unint64_t v23 = v19;
          }
          else {
            unint64_t v23 = v10;
          }
          if ((*(unsigned char *)(v8 + 25) & 8) != 0) {
            BOOL v12 = v20;
          }
          int v24 = v13;
          if ((*(unsigned char *)(v8 + 25) & 8) != 0) {
            int v13 = v22;
          }
          else {
            int v13 = v32;
          }
        }
        else
        {
          int v21 = v32;
          BOOL v16 = v33;
          int v24 = v13;
          unint64_t v23 = v10;
          int v13 = v32;
        }
LABEL_54:
        a3->var4 = v18;
        a3->var5 = v16;
        a3->unint64_t var2 = v34;
        a3->BOOL var6 = v24;
        a3->var7 = v23;
        a3->var8 = v12;
        a3->var9 = v13;
        a3->var0 = v10;
        a3->var1 = v31;
        a3->unint64_t var3 = v21;
        return (const void *)v8;
      }
      LOBYTE(v3objc_msgSend(+[TSWPEditMenuController sharedEditMenuController](TSWPEditMenuController, "sharedEditMenuController"), "setIsBeginningEditing:", 1) = 0;
    }
    uint64_t v25 = TSWPLineFragment::nextOrPreviousCharIndexForDirection(v8, v10, 2, self->_storage);
    if (v25 == *(void *)(v8 + 8) + *(void *)v8) {
      unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v23 = v25;
    }
    BOOL v12 = v33;
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v12 = TSWPLineFragment::writingDirectionForCharIndex((TSWPLineFragment *)v8, v23) == 1;
      TSWPComposedCharacterAtIndexForTextSource(v23, self->_storage);
      int v13 = TSWPGetBidiClass();
    }
    if (v10 == TSWPLineFragment::leftMostCharIndex((TSWPLineFragment *)v8))
    {
      uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      if ((v30 & 0x1000) != 0)
      {
        char v27 = 1;
      }
      else
      {
        uint64_t v26 = v10;
        char v27 = v16;
      }
      int v21 = v32;
      if ((v30 & 0x1000) != 0) {
        int v28 = 2;
      }
      else {
        int v28 = v32;
      }
      if ((*(unsigned char *)(v8 + 25) & 8) != 0) {
        unint64_t v18 = v26;
      }
      else {
        unint64_t v18 = v10;
      }
      if ((*(unsigned char *)(v8 + 25) & 8) != 0)
      {
        BOOL v16 = v27;
        int v24 = v28;
      }
      else
      {
        int v24 = v32;
      }
    }
    else
    {
      unint64_t v18 = v10;
      int v21 = v32;
      int v24 = v32;
    }
    goto LABEL_54;
  }
  return (const void *)v8;
}

- (unint64_t)p_getVisualDeletionIndexForSelection:(id)a3 backward:(BOOL *)a4
{
  unint64_t v7 = [a3 range];
  if (([a3 isInsertionPoint] & 1) == 0)
  {
    [a3 range];
    if (!v8 || *a4)
    {
      int v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) p_getVisualDeletionIndexForSelection:backward:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 1270, @"invalid selection type");
    }
  }
  int v11 = [(TSWPEditingController *)self p_lineFragmentWithCaretInfo:&v19 forSelection:a3];
  if (v11)
  {
    BOOL v12 = v11;
    if (v11[1])
    {
      if ([a3 isVisual])
      {
        if (([a3 isInsertionPoint] & 1) != 0 || (objc_msgSend(a3, "range"), v13) && !*a4)
        {
          unint64_t v14 = *v12;
          unint64_t v15 = v12[1] + ((int)(*((_DWORD *)v12 + 6) << 20) >> 31);
          if (v21 == v24 || v22 == 3 || v25 == 3)
          {
            if (v21 == v24 || ![a3 isVisual]) {
              return v7;
            }
            if (v21)
            {
              if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
                return v15 + v14;
              }
              else {
                return v20;
              }
            }
            unint64_t v16 = v23;
            unint64_t v7 = v14;
            if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
              return v7;
            }
          }
          else
          {
            if (v21)
            {
              *a4 = 0;
              if ([(TSWPEditingController *)self editorKeyboardLanguageIsRTL]) {
                unint64_t v7 = v20;
              }
              else {
                unint64_t v7 = v23;
              }
              if (v7 == 0x7FFFFFFFFFFFFFFFLL)
              {
                *a4 = 1;
                return v15 + v14;
              }
              return v7;
            }
            *a4 = 1;
            if ([(TSWPEditingController *)self editorKeyboardLanguageIsRTL])
            {
              unint64_t v16 = v23;
              if (v23 == 0x7FFFFFFFFFFFFFFFLL)
              {
                unint64_t v7 = v14;
                if (v21) {
                  return v7;
                }
                storage = self->_storage;
                unint64_t v16 = v20;
                return [(TSWPStorage *)storage nextCharacterIndex:v16];
              }
            }
            else
            {
              unint64_t v16 = v20;
              if (v20 == 0x7FFFFFFFFFFFFFFFLL)
              {
                unint64_t v7 = v14;
                if (!v24) {
                  return v7;
                }
                storage = self->_storage;
                unint64_t v16 = v23;
                return [(TSWPStorage *)storage nextCharacterIndex:v16];
              }
            }
          }
          storage = self->_storage;
          return [(TSWPStorage *)storage nextCharacterIndex:v16];
        }
      }
    }
  }
  return v7;
}

- (unint64_t)p_getVisualInsertionPointIndexForString:(id)a3 selection:(id)a4
{
  if (![a4 isInsertionPoint] || (objc_msgSend(a4, "isVisual") & 1) == 0)
  {
    unint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPEditingController(Internal) p_getVisualInsertionPointIndexForString:selection:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEditingController_Internal.mm"), 1384, @"invalid selection type");
  }
  unint64_t v9 = [a4 range];
  uint64_t v10 = [(TSWPEditingController *)self p_lineFragmentWithCaretInfo:v45 forSelection:a4];
  if (v10)
  {
    int v11 = v10;
    if ([a4 isInsertionPoint])
    {
      if ([a4 isVisual])
      {
        int v12 = v11[6];
        if ((v12 & 0x4000) == 0)
        {
          uint64_t v13 = *(void *)v11;
          uint64_t v14 = *((void *)v11 + 1);
          if ([a3 length])
          {
            [a3 utf32CharacterAtIndex:0];
            int v15 = TSWPGetBidiClass();
          }
          else
          {
            int v15 = 6;
          }
          if (v48 != v51)
          {
            uint64_t v16 = v14 + (v12 << 20 >> 31);
            if (v15 == v48)
            {
              unint64_t v9 = v46;
              if (v46 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if ((v12 & 0x1000) != 0) {
                  uint64_t v17 = v14 + (v12 << 20 >> 31);
                }
                else {
                  uint64_t v17 = 0;
                }
                return v17 + v13;
              }
              if (v47) {
                return v9;
              }
              return [(TSWPStorage *)self->_storage nextCharacterIndex:v9];
            }
            if (v15 == v51)
            {
              unint64_t v9 = v49;
              if (v49 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if ((v12 & 0x1000) != 0) {
                  uint64_t v17 = 0;
                }
                else {
                  uint64_t v17 = v14 + (v12 << 20 >> 31);
                }
                return v17 + v13;
              }
              if (!v50) {
                return v9;
              }
              return [(TSWPStorage *)self->_storage nextCharacterIndex:v9];
            }
            if ((v15 & 0xFFFFFFFD) == 1 || v15 == 2) {
              int v19 = v15;
            }
            else {
              int v19 = 1;
            }
            __p = 0;
            int64x2_t v43 = 0;
            uint64_t v44 = 0;
            TSWPLineFragment::fillWritingDirectionRuns((uint64_t *)v11, &__p);
            if (v46 == 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v20 = 0;
            }
            else
            {
              int64_t v21 = v43 - (unsigned char *)__p;
              if (v43 == __p) {
                goto LABEL_52;
              }
              unint64_t v22 = 0;
              uint64_t v23 = v21 / 40;
              BOOL v28 = v21 / 40 != 0;
              unint64_t v24 = v21 / 40 - 1;
              if (v24 == 0 || !v28) {
                uint64_t v23 = 1;
              }
              int v25 = (unint64_t *)((char *)__p + 24);
              while (1)
              {
                unint64_t v26 = *(v25 - 1);
                BOOL v28 = v46 >= v26;
                unint64_t v27 = v46 - v26;
                BOOL v28 = !v28 || v27 >= *v25;
                if (!v28) {
                  break;
                }
                v25 += 5;
                if (v23 == ++v22)
                {
                  unint64_t v22 = v23;
                  break;
                }
              }
              unint64_t v20 = v22 + 1;
              if (v22 == 0x7FFFFFFFFFFFFFFELL || v22 >= v24) {
                goto LABEL_52;
              }
            }
            if (*((unsigned char *)__p + 40 * v20 + 33)) {
              BOOL v29 = v19 == 2;
            }
            else {
              BOOL v29 = 0;
            }
            if (v29)
            {
              unint64_t v32 = [(TSWPStorage *)self->_storage nextCharacterIndex:*((void *)__p + 5 * v20 + 1)];
LABEL_89:
              unint64_t v9 = v32;
LABEL_90:
              if (__p)
              {
                int64x2_t v43 = __p;
                operator delete(__p);
              }
              return v9;
            }
LABEL_52:
            if (v19 == 3)
            {
              int v31 = v47;
              BOOL v30 = (v47 | v50) == 0;
            }
            else
            {
              if (v19 != 2)
              {
                BOOL v33 = v47 == 0;
                BOOL v36 = v50 == 0;
                BOOL v30 = 1;
                goto LABEL_70;
              }
              BOOL v30 = 0;
              int v31 = v47;
            }
            BOOL v33 = v31 == 0;
            if (!v30 && v31)
            {
              if ((v12 & 0x1000) != 0) {
                uint64_t v34 = v16;
              }
              else {
                uint64_t v34 = 0;
              }
              unint64_t v35 = v34 + v13;
              if (v46 == 0x7FFFFFFFFFFFFFFFLL) {
                unint64_t v9 = v35;
              }
              else {
                unint64_t v9 = v46;
              }
              goto LABEL_90;
            }
            BOOL v36 = v50 == 0;
            if (v50) {
              char v37 = v30;
            }
            else {
              char v37 = 1;
            }
            if ((v37 & 1) == 0)
            {
              if (v49 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if ((v12 & 0x1000) != 0) {
                  uint64_t v38 = 0;
                }
                else {
                  uint64_t v38 = v16;
                }
                goto LABEL_87;
              }
              goto LABEL_88;
            }
LABEL_70:
            if (!v30 || !v33)
            {
              if (v30 && v36)
              {
                if ((v12 & 0x1000) != 0) {
                  uint64_t v39 = 0;
                }
                else {
                  uint64_t v39 = v16;
                }
                unint64_t v40 = v39 + v13;
                if (v49 == 0x7FFFFFFFFFFFFFFFLL) {
                  unint64_t v9 = v40;
                }
                else {
                  unint64_t v9 = v49;
                }
              }
              goto LABEL_90;
            }
            if (v46 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ((v12 & 0x1000) != 0) {
                uint64_t v38 = v16;
              }
              else {
                uint64_t v38 = 0;
              }
LABEL_87:
              unint64_t v9 = v38 + v13;
              goto LABEL_90;
            }
LABEL_88:
            unint64_t v32 = -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:");
            goto LABEL_89;
          }
        }
      }
    }
  }
  return v9;
}

@end