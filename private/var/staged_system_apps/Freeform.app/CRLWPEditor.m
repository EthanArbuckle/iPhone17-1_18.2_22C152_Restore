@interface CRLWPEditor
+ (BOOL)canEditTextIn:(id)a3 using:(id)a4;
- (BOOL)acceptAutoCorrectionBefore:(id)a3;
- (BOOL)blockGesture:(id)a3;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)canIgnoreEvent;
- (BOOL)canMutateTextStorage;
- (BOOL)canPasteWithItemSource:(id)a3 selection:(id)a4 sender:(id)a5;
- (BOOL)canSetWritingDirection:(int64_t)a3;
- (BOOL)coalescingText;
- (BOOL)disallowEditingOfTextString;
- (BOOL)editMenuIsVisible;
- (BOOL)editableTextSelectionForceGestureInProgress;
- (BOOL)gestureBeganWhenEditingBegan;
- (BOOL)gestureIsSuppressingKnobs;
- (BOOL)handlesSpacebar;
- (BOOL)hasText;
- (BOOL)ignoreFutureImmediatePresses;
- (BOOL)initialPressTextSelectionGranularity;
- (BOOL)isACurrentEditor;
- (BOOL)isBecomingActive;
- (BOOL)isDragAndDropBeginning;
- (BOOL)isDraggingListItem;
- (BOOL)isSelectingCaret;
- (BOOL)isSelectionPlaceHolderTextWithSelection:(id)a3;
- (BOOL)isUnscaledPointInTextSelection:(CGPoint)a3;
- (BOOL)isUserTypingAhead;
- (BOOL)knobTracking;
- (BOOL)p_shiftKeyIsDownWIthGesture:(id)a3;
- (BOOL)p_shouldBeginCaretGrabAtUnscaledCanvasPoint:(CGPoint)a3;
- (BOOL)pinchAndHalfDidStart;
- (BOOL)preventSelectionChanges;
- (BOOL)readyToEnd;
- (BOOL)resignFirstResponderWhenKeyboardHides;
- (BOOL)selectionBeingSetFromGestures;
- (BOOL)selectionRangeDidChange;
- (BOOL)selectionSetFromSingleTap;
- (BOOL)shouldBecomeTextInputEditor;
- (BOOL)shouldBeginTextInputWith:(id)a3;
- (BOOL)shouldPreventQuickSelect;
- (BOOL)shouldQueueBeginScribbleMode;
- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5;
- (BOOL)shouldShowEditMenuForInsertionPoint;
- (BOOL)shouldShowSelectionAndCaret;
- (BOOL)shouldSuppressMiniFormatter;
- (BOOL)shouldUseModernTextGestures;
- (BOOL)suppressBreaks;
- (BOOL)suppressEditMenuForIndirectGesture;
- (BOOL)suppressTabs;
- (BOOL)twoFingerPanGestureInProgress;
- (BOOL)wantsCaret;
- (BOOL)wantsDoneButtonWhenEditing;
- (BOOL)wantsParagraphMode;
- (BOOL)wantsParagraphModeWithSelection:(id)a3;
- (BOOL)wantsRawArrowKeyEvents;
- (BOOL)wantsToInterceptDeleteEvents;
- (BOOL)wantsToReceiveTextInput;
- (BOOL)wantsVisibleKeyboard;
- (CGPoint)adjustedDragPoint;
- (CGPoint)adjustedDragToNaturalPointOffset;
- (CGPoint)clampUnscaledPointToTextFieldBounds:(CGPoint)a3;
- (CGPoint)currentKnobPoint;
- (CGPoint)firstTapUnscaledPoint;
- (CGPoint)getCenterOfWord:(id)a3;
- (CGPoint)knobToTouchOffset;
- (CGPoint)knobTrackingDragPoint;
- (CGPoint)selectionTargetToAdjustedDragOffset;
- (CGRect)currentStationaryPinRect;
- (CGRect)currentTargetPinRect;
- (CGRect)targetRectForEditMenu;
- (CGRect)textFieldBounds;
- (CRLCanvasAutoscroll)autoscroll;
- (CRLEditorController)editorController;
- (CRLFidgetResolver)fidgetResolver;
- (CRLInteractiveCanvasController)icc;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLSearchReference)editingSearchReference;
- (CRLWPEditorHelper)editorHelper;
- (CRLWPRep)dragRep;
- (CRLWPRep)editingRep;
- (CRLWPSelection)selection;
- (CRLWPTextKnobTracker)knobTracker;
- (CRLWPTextMagnifier)magnifier;
- (CRLWPTextSource)textSource;
- (Class)wpSelectionClass;
- (NSArray)leadingBarButtonGroups;
- (NSArray)trailingBarButtonGroups;
- (NSArray)validAttributesForMarkedText;
- (NSAttributedString)markedText;
- (NSDate)lastSingleImmediateTapTime;
- (NSDictionary)markedTextStyle;
- (NSDictionary)tapInfo;
- (NSMutableDictionary)dictationInterpretations;
- (NSObject)listDragAnimator;
- (NSSet)editingReps;
- (NSString)mostRecentGestureKind;
- (UIInputViewController)inputAccessoryViewController;
- (_NSRange)availableSelectionRangeForCharIndex:(int64_t)a3;
- (_NSRange)expectedWordSelectionAtPoint;
- (_NSRange)markedRange;
- (_NSRange)nextWordFromIndex:(unint64_t)a3 forward:(BOOL)a4;
- (_NSRange)originalSelectionRange;
- (_NSRange)selectedRangeAtPinchAndHalfStart;
- (_TtC8Freeform11CRLWPEditor)init;
- (_TtC8Freeform11CRLWPEditor)initWithEditingCoordinator:(id)a3 enclosingShape:(id)a4 icc:(id)a5;
- (_TtC8Freeform11CRLWPLayout)layout;
- (_TtC8Freeform12CRLTextRange)markedTextRange;
- (_TtC8Freeform12CRLWPStorage)storage;
- (_TtC8Freeform12CRLWPStorage)storageWithMarkedText;
- (_TtC8Freeform14CRLWPShapeItem)enclosingShape;
- (_TtC8Freeform19CRLWPCharacterStyle)insertionStyle;
- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator;
- (_TtC8Freeform25CRLWPTextSelectionManager)textSelectionManager;
- (_TtP8Freeform16CRLTextSelecting_)textSelectionDelegate;
- (double)lastKeyDownTime;
- (id)attributedSubstringForProposedRange:(_NSRange)a3 actualRange:(_NSRange *)a4;
- (id)autocorrectionRangesToDisplayInRange:(_NSRange)a3;
- (id)closestRepToPoint:(CGPoint)a3 forStorage:(id)a4;
- (id)commandForReplacingTextInRange:(id)a3 withAttributedText:(id)a4;
- (id)commandForReplacingTextInRange:(id)a3 withText:(id)a4;
- (id)cursorAtPoint:(CGPoint)a3 withCursorPlatformObject:(id)a4;
- (id)dictationAndAutocorrectionsFor:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5;
- (id)p_editingRepAtPoint:(CGPoint)a3;
- (id)p_editingRepForCharIndex:(unint64_t)a3;
- (id)p_endingRepForUnscaledCanvasPoint:(CGPoint)a3;
- (id)p_inlineEquationRepInTableCellTextRep:(id)a3 atUnscaledCanvasPoint:(CGPoint)a4 gesture:(id)a5;
- (id)p_repsForStorage:(id)a3;
- (id)p_selectionForRep:(id)a3 naturalPoint:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7 includeListLabels:(BOOL)a8 allowPastBreak:(BOOL)a9 alternateClick:(BOOL)a10;
- (id)p_selectionForRep:(id)a3 point:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7 includeListLabels:(BOOL)a8 allowPastBreak:(BOOL)a9;
- (id)p_textRepAtGestureLocationForGesture:(id)a3;
- (id)selectionFromUnscaledCanvasPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 isTapHold:(BOOL)a5 allowPastBreak:(BOOL)a6 isDragging:(BOOL)a7;
- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7;
- (id)wpRepFromHitRep:(id)a3;
- (int64_t)baseWritingDirectionFor:(id)a3;
- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (int64_t)knobTrackingTapCount;
- (uint64_t)escapePressed:(uint64_t)a3;
- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7;
- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 isAtEndOfLine:(BOOL *)a8;
- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 leadingEdge:(BOOL *)a7;
- (unint64_t)knobTag;
- (void)abortMarkedText;
- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4;
- (void)alignBottom:(id)a3;
- (void)alignCenter:(id)a3;
- (void)alignJustified:(id)a3;
- (void)alignJustify:(id)a3;
- (void)alignLeft:(id)a3;
- (void)alignMiddle:(id)a3;
- (void)alignRight:(id)a3;
- (void)alignTop:(id)a3;
- (void)arrowKeyReceivedInDirection:(unint64_t)a3 withModifierKeys:(id)a4;
- (void)capitalizeWord:(id)a3;
- (void)clearMarkedRange;
- (void)commitMarkedText;
- (void)commitMarkedTextWithoutModifyingStorage;
- (void)complete:(id)a3;
- (void)copy:(id)a3;
- (void)copyStyle:(id)a3;
- (void)cut:(id)a3;
- (void)cutTo:(id)a3 nativeOnly:(BOOL)a4 sender:(id)a5;
- (void)decreaseFontSizeByOne:(id)a3;
- (void)decreaseSize:(id)a3;
- (void)deleteBackward:(id)a3;
- (void)deleteCurrentSelection;
- (void)deleteForward:(id)a3;
- (void)deleteToBeginningOfLine:(id)a3;
- (void)deleteToMark:(id)a3;
- (void)deleteWordBackward:(id)a3;
- (void)deleteWordForward:(id)a3;
- (void)didBecomeCurrentEditorForEditorController:(id)a3;
- (void)didBecomeTextInputEditor;
- (void)didResignTextInputEditor;
- (void)didUndo;
- (void)documentEditabilityDidChange;
- (void)endEditing;
- (void)endEditingAndSelectParent:(id)a3;
- (void)gestureSequenceDidEnd;
- (void)gestureSequenceWillBegin;
- (void)handleGesture:(id)a3;
- (void)hideEditMenu;
- (void)increaseFontSizeByOne:(id)a3;
- (void)increaseSize:(id)a3;
- (void)indentParagraphLevel:(id)a3;
- (void)insertBacktab:(id)a3;
- (void)insertLineBreak:(id)a3;
- (void)insertNewline:(id)a3;
- (void)insertTab:(id)a3;
- (void)insertText:(id)a3;
- (void)lookUp:(id)a3;
- (void)lookUpTextAtRange:(_NSRange)a3;
- (void)lowercaseWord:(id)a3;
- (void)makeBaseWritingDirectionLeftToRight:(id)a3;
- (void)makeBaseWritingDirectionNatural:(id)a3;
- (void)makeBaseWritingDirectionRightToLeft:(id)a3;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionNatural:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)moveBackward:(id)a3;
- (void)moveDown:(id)a3;
- (void)moveDownAndModifySelection:(id)a3;
- (void)moveForward:(id)a3;
- (void)moveLeft:(id)a3;
- (void)moveLeftAndModifySelection:(id)a3;
- (void)moveParagraphBackward:(id)a3;
- (void)moveParagraphBackwardAndModifySelection:(id)a3;
- (void)moveParagraphForward:(id)a3;
- (void)moveParagraphForwardAndModifySelection:(id)a3;
- (void)moveRight:(id)a3;
- (void)moveRightAndModifySelection:(id)a3;
- (void)moveToBeginningOfDocument:(id)a3;
- (void)moveToBeginningOfDocumentAndModifySelection:(id)a3;
- (void)moveToBeginningOfLine:(id)a3;
- (void)moveToBeginningOfLineAndModifySelection:(id)a3;
- (void)moveToBeginningOfParagraph:(id)a3;
- (void)moveToBeginningOfParagraphAndModifySelection:(id)a3;
- (void)moveToEndOfDocument:(id)a3;
- (void)moveToEndOfDocumentAndModifySelection:(id)a3;
- (void)moveToEndOfLine:(id)a3;
- (void)moveToEndOfLineAndModifySelection:(id)a3;
- (void)moveToEndOfParagraph:(id)a3;
- (void)moveToEndOfParagraphAndModifySelection:(id)a3;
- (void)moveToLeftEndOfLine:(id)a3;
- (void)moveToLeftEndOfLineAndModifySelection:(id)a3;
- (void)moveToRightEndOfLine:(id)a3;
- (void)moveToRightEndOfLineAndModifySelection:(id)a3;
- (void)moveUp:(id)a3;
- (void)moveUpAndModifySelection:(id)a3;
- (void)moveWordBackward:(id)a3;
- (void)moveWordBackwardAndModifySelection:(id)a3;
- (void)moveWordForward:(id)a3;
- (void)moveWordForwardAndModifySelection:(id)a3;
- (void)moveWordLeft:(id)a3;
- (void)moveWordLeftAndModifySelection:(id)a3;
- (void)moveWordRight:(id)a3;
- (void)moveWordRightAndModifySelection:(id)a3;
- (void)outdentParagraphLevel:(id)a3;
- (void)p_adjustSelection:(id)a3 withOtherSelection:(id)a4 textSelectionGranularity:(unint64_t)a5;
- (void)p_adjustSelection:(id)a3 withUnscaledCanvasPoint:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 allowPastBreak:(BOOL)a7 isDragging:(BOOL)a8;
- (void)p_beginKnobTrackingSelection:(id)a3 forRep:(id)a4 atPoint:(CGPoint)a5;
- (void)p_beginMagnification:(id)a3 forRep:(id)a4 atPoint:(CGPoint)a5 shouldSetSelection:(BOOL)a6;
- (void)p_beginOperationAndTakeControl;
- (void)p_beginTapAndLongPress;
- (void)p_cancelTapAndLongPressPreviousSelector;
- (void)p_createKnobTracker:(id)a3 forRep:(id)a4 tapCount:(unint64_t)a5;
- (void)p_endAutoscroll;
- (void)p_handleCaretDragWithImmediatePressGesture:(id)a3;
- (void)p_handleEditableTextSelectionForceGesture:(id)a3;
- (void)p_handleImmediateAndLongPressGesture:(id)a3;
- (void)p_handleIndirectImmediatePressGesture:(id)a3;
- (void)p_handleKnobDragGestureRecognizer:(id)a3;
- (void)p_handleLongPressTextInteractionWithGestureRecognizer:(id)a3;
- (void)p_handleTapAndTouchGesture:(id)a3;
- (void)p_handleTapGestures:(id)a3;
- (void)p_handleTapWhileMarkedTextGestureRecognizer:(id)a3;
- (void)p_handleTwoFingerPanGesture:(id)a3;
- (void)p_protectedStopKnobTrackingGesture:(id)a3;
- (void)p_recursivelyAddRep:(id)a3 forStorage:(id)a4 toSet:(id)a5;
- (void)p_sendHandleTapNotification;
- (void)p_setSelectionFromPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 includeListLabels:(BOOL)a5;
- (void)p_setTappedSelectionPath:(id)a3;
- (void)paste:(id)a3;
- (void)pasteAsPlainText:(id)a3;
- (void)pasteFromItemSource:(id)a3 forceMatchStyle:(BOOL)a4;
- (void)pasteStyle:(id)a3;
- (void)pasteWithItemSource:(id)a3 selection:(id)a4 sender:(id)a5 selectRange:(int64_t)a6 dragBlock:(id)a7;
- (void)protectedStopMagnification;
- (void)removeHyperlink:(id)a3;
- (void)replace:(id)a3 with:(id)a4;
- (void)replaceAction:(id)a3;
- (void)selectAll;
- (void)selectAll:(id)a3;
- (void)selectAllMenuAction:(id)a3;
- (void)selectLine:(id)a3;
- (void)selectMenuAction:(id)a3;
- (void)selectParagraph:(id)a3;
- (void)selectParent:(id)a3;
- (void)selectToMark:(id)a3;
- (void)selectWord:(id)a3;
- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5;
- (void)setAdjustedDragPoint:(CGPoint)a3;
- (void)setAdjustedDragToNaturalPointOffset:(CGPoint)a3;
- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setAutoscroll:(id)a3;
- (void)setBaseWritingDirection:(int64_t)a3 forParagraphsWithRange:(id)a4;
- (void)setCanIgnoreEvent:(BOOL)a3;
- (void)setCoalescingText:(BOOL)a3;
- (void)setCurrentKnobPoint:(CGPoint)a3;
- (void)setCurrentStationaryPinRect:(CGRect)a3;
- (void)setCurrentTargetPinRect:(CGRect)a3;
- (void)setDictationInterpretations:(id)a3;
- (void)setDisallowEditingOfTextString:(BOOL)a3;
- (void)setDragRep:(id)a3;
- (void)setEditableTextSelectionForceGestureInProgress:(BOOL)a3;
- (void)setEditorController:(id)a3;
- (void)setEditorHelper:(id)a3;
- (void)setEnclosingShape:(id)a3;
- (void)setExpectedWordSelectionAtPoint:(_NSRange)a3;
- (void)setFidgetResolver:(id)a3;
- (void)setFirstTapUnscaledPoint:(CGPoint)a3;
- (void)setGestureBeganWhenEditingBegan:(BOOL)a3;
- (void)setGestureIsSuppressingKnobs:(BOOL)a3;
- (void)setIcc:(id)a3;
- (void)setIgnoreFutureImmediatePresses:(BOOL)a3;
- (void)setInitialPressTextSelectionGranularity:(BOOL)a3;
- (void)setInsertionStyle:(id)a3;
- (void)setIsBecomingActive:(BOOL)a3;
- (void)setIsDragAndDropBeginning:(BOOL)a3;
- (void)setIsSelectingCaret:(BOOL)a3;
- (void)setIsUserTypingAhead:(BOOL)a3;
- (void)setKnobTag:(unint64_t)a3;
- (void)setKnobToTouchOffset:(CGPoint)a3;
- (void)setKnobTracker:(id)a3;
- (void)setKnobTracking:(BOOL)a3;
- (void)setKnobTrackingDragPoint:(CGPoint)a3;
- (void)setKnobTrackingTapCount:(int64_t)a3;
- (void)setLastKeyDownTime:(double)a3;
- (void)setLastSingleImmediateTapTime:(id)a3;
- (void)setListDragAnimator:(id)a3;
- (void)setMagnifier:(id)a3;
- (void)setMark:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4 replacementRange:(_NSRange)a5;
- (void)setMarkedTextStyle:(id)a3;
- (void)setMostRecentGestureKind:(id)a3;
- (void)setOriginalSelectionRange:(_NSRange)a3;
- (void)setPinchAndHalfDidStart:(BOOL)a3;
- (void)setPreventSelectionChanges:(BOOL)a3;
- (void)setReadyToEnd:(BOOL)a3;
- (void)setResignFirstResponderWhenKeyboardHides:(BOOL)a3;
- (void)setSelectedRangeAtPinchAndHalfStart:(_NSRange)a3;
- (void)setSelection:(id)a3;
- (void)setSelectionBeingSetFromGestures:(BOOL)a3;
- (void)setSelectionControlsForInputType:(int64_t)a3;
- (void)setSelectionRangeDidChange:(BOOL)a3;
- (void)setSelectionSetFromSingleTap:(BOOL)a3;
- (void)setSelectionTargetToAdjustedDragOffset:(CGPoint)a3;
- (void)setShouldPreventQuickSelect:(BOOL)a3;
- (void)setShouldQueueBeginScribbleMode:(BOOL)a3;
- (void)setShouldShowEditMenuForInsertionPoint:(BOOL)a3;
- (void)setShouldUseModernTextGestures:(BOOL)a3;
- (void)setSuppressBreaks:(BOOL)a3;
- (void)setSuppressEditMenuForIndirectGesture:(BOOL)a3;
- (void)setSuppressTabs:(BOOL)a3;
- (void)setTapInfo:(id)a3;
- (void)setTextFieldBounds:(CGRect)a3;
- (void)setTwoFingerPanGestureInProgress:(BOOL)a3;
- (void)setWantsParagraphMode:(BOOL)a3;
- (void)setWantsVisibleKeyboard:(BOOL)a3;
- (void)showEditMenu;
- (void)swapWithMark:(id)a3;
- (void)tapAndLongPressDidEndOrCancel;
- (void)tappedInRep:(id)a3 point:(CGPoint)a4 tapCount:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7;
- (void)tappedInRep:(id)a3 point:(CGPoint)a4 tapCount:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7 alternateClick:(BOOL)a8;
- (void)textDidChange;
- (void)textSelectionDidChange;
- (void)textSelectionWillChange;
- (void)textWillChange;
- (void)toggleBaseWritingDirection:(id)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleListEntry:(id)a3;
- (void)toggleStrikethrough:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)translate:(id)a3;
- (void)transpose:(id)a3;
- (void)transposeWords:(id)a3;
- (void)twoFingerPanGestureDidEnd;
- (void)twoFingerPanGestureWillBegin;
- (void)unmarkText;
- (void)updateTapAndLongPress;
- (void)uppercaseWord:(id)a3;
- (void)willResignCurrentEditor;
- (void)willResignTextInputEditor;
- (void)willUndo;
@end

@implementation CRLWPEditor

- (BOOL)blockGesture:(id)a3
{
  v3 = [(CRLWPEditor *)self interactiveCanvasController];
  if ([v3 floatingCursorInMotion])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = [v3 textInputResponder];
    unsigned int v4 = [v5 isFirstResponder] ^ 1;
  }
  return v4;
}

- (_NSRange)nextWordFromIndex:(unint64_t)a3 forward:(BOOL)a4
{
  BOOL v4 = a4;
  CFIndex length = 0;
  v8 = [(CRLWPEditor *)self storageWithMarkedText];
  v9 = (char *)[v8 wordAtCharIndex:a3 includePreviousWord:v4];
  uint64_t v33 = v10;

  v11 = [(CRLWPEditor *)self editorHelper];
  v12 = [v11 availableSelectionRangeForCharIndex:a3];
  uint64_t v14 = v13;

  v15 = [(CRLWPEditor *)self storageWithMarkedText];
  v16 = [v15 textRangeForParagraphAtCharIndex:a3];
  uint64_t v18 = v17;

  v19 = [(CRLWPEditor *)self storageWithMarkedText];
  v20 = [v19 string];
  if (v4)
  {
    v12 += v14;
    v35.CFIndex length = v12 - v16;
    v35.CFIndex location = (CFIndex)v16;
    v21 = CFStringTokenizerCreate(0, v20, v35, 0, 0);

    NSUInteger v22 = 0x7FFFFFFFFFFFFFFFLL;
    if (v21)
    {
      uint64_t v23 = 0;
      do
      {
        unint64_t v24 = a3 + v23;
        CFStringTokenizerTokenType v25 = CFStringTokenizerGoToTokenAtIndex(v21, a3 + v23--);
      }
      while (!v25 && v24 > (unint64_t)v16 && v12 == (unsigned char *)a3);
      uint64_t v26 = -v23;
      unint64_t v27 = a3 + v23;
      do
      {
        ++v27;
        --v26;
      }
      while (!CFStringTokenizerGoToTokenAtIndex(v21, v27) && v27 < (unint64_t)v12);
      CFIndex location = CFStringTokenizerGetCurrentTokenRange(v21).location;
      if (&v9[v33] == (char *)location || v26 && location == v27 || CFStringTokenizerAdvanceToNextToken(v21))
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v21);
        if (CurrentTokenRange.location < 0)
        {
          CFIndex length = 0;
        }
        else
        {
          v12 = (unsigned char *)CurrentTokenRange.location;
          CFIndex length = CurrentTokenRange.length;
        }
      }
      else
      {
LABEL_28:
        CFIndex length = 0;
      }
LABEL_30:
      CFRelease(v21);
      NSUInteger v22 = (NSUInteger)v12;
    }
  }
  else
  {
    v36.CFIndex length = (CFIndex)&v16[v18 - (void)v12];
    v36.CFIndex location = (CFIndex)v12;
    v21 = CFStringTokenizerCreate(0, v20, v36, 0, 0);

    NSUInteger v22 = 0x7FFFFFFFFFFFFFFFLL;
    if (v21)
    {
      unint64_t v30 = a3;
      while (1)
      {
        while (!CFStringTokenizerGoToTokenAtIndex(v21, v30))
        {
          if (v30 <= (unint64_t)v12) {
            goto LABEL_28;
          }
          --v30;
        }
        CFRange v31 = CFStringTokenizerGetCurrentTokenRange(v21);
        CFIndex length = v31.length;
        if (v31.location + v31.length < a3 || (char *)(v31.location + v31.length) == v9) {
          break;
        }
        if (v31.location <= (unint64_t)v12) {
          goto LABEL_28;
        }
        if (v30 - 1 >= v31.location - 1) {
          unint64_t v30 = v31.location - 1;
        }
        else {
          --v30;
        }
      }
      v12 = (unsigned char *)v31.location;
      goto LABEL_30;
    }
  }
  NSUInteger v32 = length;
  result.CFIndex length = v32;
  result.CFIndex location = v22;
  return result;
}

- (Class)wpSelectionClass
{
  return (Class)objc_opt_class();
}

- (void)p_adjustSelection:(id)a3 withOtherSelection:(id)a4 textSelectionGranularity:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 isValid] && objc_msgSend(v8, "isValid"))
  {
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1004B3604;
    v50[3] = &unk_1014FF068;
    id v7 = v7;
    id v51 = v7;
    id v9 = v8;
    id v52 = v9;
    uint64_t v10 = objc_retainBlock(v50);
    if ([v9 type] == (id)7 && !objc_msgSend(v7, "type"))
    {
      v11 = [(CRLWPEditor *)self editorHelper];
      v12 = [v11 logicalToVisualSelection:v7];

      uint64_t v13 = [(CRLWPEditor *)self editorHelper];
      id v7 = [v13 calculateVisualRunsFromSelection:v12 updateControllerSelection:0];
    }
    if ([v9 type] != (id)7 || objc_msgSend(v7, "type") != (id)7)
    {
      uint64_t v25 = ((uint64_t (*)(void *))v10[2])(v10);
      uint64_t v27 = v26;
      v28 = [(CRLWPEditor *)self selection];
      if ([v28 isValid])
      {
        [(CRLWPEditor *)self selection];
        id v29 = v9;
        v31 = unint64_t v30 = v10;
        id v32 = [v31 range];
        uint64_t v47 = v33;

        uint64_t v10 = v30;
        id v9 = v29;

        if (v32 == (id)v25 && v47 == v27)
        {
          unint64_t v24 = 0;
          goto LABEL_26;
        }
      }
      else
      {
      }
      unint64_t v24 = [(CRLWPSelection *)objc_alloc([self wpSelectionClass]) initWithRange:v25, v27];
      if (v24) {
        goto LABEL_24;
      }
LABEL_26:

      goto LABEL_27;
    }
    char v49 = 1;
    uint64_t v48 = 0;
    uint64_t v14 = [(CRLWPEditor *)self editorHelper];
    id v15 = [v14 adjustVisualSelection:v7 withOtherSelection:v9 outLeadingEdge:&v49 outCaretAffinity:&v48];
    uint64_t v17 = v16;

    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v15 = (id)((uint64_t (*)(void *))v10[2])(v10);
      uint64_t v17 = v18;
    }
    v19 = [(CRLWPEditor *)self selection];
    v46 = v10;
    if ([v19 isValid])
    {
      v20 = [(CRLWPEditor *)self selection];
      id v21 = [v20 range];
      uint64_t v23 = v22;

      if (v21 == v15 && v23 == v17)
      {
        unint64_t v24 = 0;
        goto LABEL_23;
      }
    }
    else
    {
    }
    v34 = [CRLWPSelection alloc];
    uint64_t v35 = v48;
    char v36 = v49;
    v37 = [(CRLWPEditor *)self storageWithMarkedText];
    LOBYTE(v45) = v36;
    unint64_t v24 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v34, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, v15, v17, 0, v35, 0x7FFFFFFFFFFFFFFFLL, 0, v45, v37);

LABEL_23:
    uint64_t v10 = v46;
    if (v24)
    {
LABEL_24:
      v38 = [(CRLWPEditor *)self editorHelper];
      unsigned int v39 = [v38 selectionLastModifiedWithKeyboard];

      v40 = [(CRLWPEditor *)self editorController];
      [v40 setSelection:v24 forEditor:self withFlags:8];

      if (v39)
      {
        v41 = [(CRLWPEditor *)self editorController];
        v42 = [v41 selectionPath];
        v43 = [v42 selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:v9];

        v44 = [(CRLWPEditor *)self interactiveCanvasController];
        [v44 scrollToSelectionPath:v43 scrollOptions:1];
      }
      goto LABEL_26;
    }
    goto LABEL_26;
  }
LABEL_27:
}

- (void)p_adjustSelection:(id)a3 withUnscaledCanvasPoint:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 allowPastBreak:(BOOL)a7 isDragging:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  double y = a4.y;
  double x = a4.x;
  id v16 = a3;
  id v15 = -[CRLWPEditor selectionFromUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:](self, "selectionFromUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:", a5, v10, v9, v8, x, y);
  if (v15) {
    [(CRLWPEditor *)self p_adjustSelection:v16 withOtherSelection:v15 textSelectionGranularity:a5];
  }
}

- (id)p_editingRepAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = objc_opt_class();
  id v7 = [(CRLWPEditor *)self storageWithMarkedText];
  BOOL v8 = -[CRLWPEditor closestRepToPoint:forStorage:](self, "closestRepToPoint:forStorage:", v7, x, y);
  BOOL v9 = sub_1002469D0(v6, v8);

  if (v9 && [v9 isBeingEdited]) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (void)p_setSelectionFromPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 includeListLabels:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  id v10 = -[CRLWPEditor p_editingRepAtPoint:](self, "p_editingRepAtPoint:");
  if (v10)
  {
    id v21 = v10;
    [v10 convertNaturalPointFromUnscaledCanvas:x, y];
    [v21 pinToClosestColumn:];
    double v12 = v11;
    double v14 = v13;
    id v15 = -[CRLWPEditor p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:", v21, a4, 0, 1, v5, 0);
    id v16 = [(CRLWPEditor *)self selection];
    unsigned __int8 v17 = [v15 isEqual:v16];

    if ((v17 & 1) == 0)
    {
      if ([(CRLWPEditor *)self isSelectionPlaceHolderTextWithSelection:v15])
      {
        uint64_t v18 = 6;
      }
      else
      {
        uint64_t v18 = 14;
      }
      v19 = [(CRLWPEditor *)self editorController];
      [v19 setSelection:v15 forEditor:self withFlags:v18];

      v20 = [(CRLWPEditor *)self textSelectionDelegate];
      [v20 moveLoupeTo:v12, v14];
    }
    id v10 = v21;
  }
}

- (id)selectionFromUnscaledCanvasPoint:(CGPoint)a3 textSelectionGranularity:(unint64_t)a4 isTapHold:(BOOL)a5 allowPastBreak:(BOOL)a6 isDragging:(BOOL)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  double y = a3.y;
  double x = a3.x;
  uint64_t v13 = objc_opt_class();
  double v14 = [(CRLWPEditor *)self storageWithMarkedText];
  id v15 = -[CRLWPEditor closestRepToPoint:forStorage:](self, "closestRepToPoint:forStorage:", v14, x, y);
  id v16 = sub_1002469D0(v13, v15);

  if ([v16 isBeingEdited])
  {
    [v16 convertNaturalPointFromUnscaledCanvas:x, y];
    unsigned __int8 v17 = -[CRLWPEditor p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:](self, "p_selectionForRep:point:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:", v16, a4, v8, 1, 0, v7);
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (id)wpRepFromHitRep:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = sub_1002469D0(v4, v3);

  return v5;
}

- (id)p_textRepAtGestureLocationForGesture:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLWPEditor *)self interactiveCanvasController];
  [v4 unscaledLocationForICC:v5];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = objc_opt_class();
  double v11 = [v4 targetRep];

  double v12 = sub_1002469D0(v10, v11);

  if (!v12)
  {
    uint64_t v13 = objc_opt_class();
    double v14 = [v5 hitRep:v7, v9];
    id v15 = [(CRLWPEditor *)self wpRepFromHitRep:v14];
    double v12 = sub_1002469D0(v13, v15);
  }

  return v12;
}

- (BOOL)isDraggingListItem
{
  return 0;
}

- (void)twoFingerPanGestureWillBegin
{
}

- (void)twoFingerPanGestureDidEnd
{
}

- (void)p_recursivelyAddRep:(id)a3 forStorage:(id)a4 toSet:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  double v12 = sub_1002469D0(v11, v8);
  uint64_t v13 = v12;
  if (v12
    && ([v12 storage], id v14 = (id)objc_claimAutoreleasedReturnValue(), v14, v14 == v9))
  {
    [v10 addObject:v13];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = [v8 childReps];
    id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          [(CRLWPEditor *)self p_recursivelyAddRep:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19) forStorage:v9 toSet:v10];
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v17);
    }
  }
}

- (id)p_repsForStorage:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSMutableSet set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v6 = [(CRLWPEditor *)self interactiveCanvasController];
  double v7 = [v6 canvas];
  id v8 = [v7 topLevelReps];

  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [(CRLWPEditor *)self p_recursivelyAddRep:*(void *)(*((void *)&v14 + 1) + 8 * i) forStorage:v4 toSet:v5];
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v5;
}

- (id)closestRepToPoint:(CGPoint)a3 forStorage:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(CRLWPEditor *)self p_repsForStorage:v7];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v28;
    double v13 = INFINITY;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v15 frameInUnscaledCanvas];
        CGFloat v16 = v34.origin.x;
        CGFloat v17 = v34.origin.y;
        CGFloat width = v34.size.width;
        CGFloat height = v34.size.height;
        v33.double x = x;
        v33.double y = y;
        if (CGRectContainsPoint(v34, v33))
        {
          id v25 = v15;

          uint64_t v11 = v25;
          goto LABEL_14;
        }
        v35.origin.double x = v16;
        v35.origin.double y = v17;
        v35.size.CGFloat width = width;
        v35.size.CGFloat height = height;
        double MidX = CGRectGetMidX(v35);
        v36.origin.double x = v16;
        v36.origin.double y = v17;
        v36.size.CGFloat width = width;
        v36.size.CGFloat height = height;
        double MidY = CGRectGetMidY(v36);
        double v22 = sub_1000653B4(x, y, MidX, MidY);
        if (v22 < v13)
        {
          double v23 = v22;
          id v24 = v15;

          double v13 = v23;
          uint64_t v11 = v24;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)p_endingRepForUnscaledCanvasPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = objc_opt_class();
  id v7 = [(CRLWPEditor *)self storageWithMarkedText];
  id v8 = -[CRLWPEditor closestRepToPoint:forStorage:](self, "closestRepToPoint:forStorage:", v7, x, y);
  id v9 = sub_1002469D0(v6, v8);

  return v9;
}

- (void)p_handleTwoFingerPanGesture:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 targetRep];

  uint64_t v6 = objc_opt_class();
  if (v5)
  {
    id v7 = [v4 targetRep];
    id v8 = sub_1002469D0(v6, v7);
  }
  else
  {
    id v7 = [(CRLWPEditor *)self editingReps];
    id v9 = [v7 anyObject];
    id v8 = sub_1002469D0(v6, v9);
  }
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF088);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BB2CC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF0A8);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_handleTwoFingerPanGesture:]");
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 438, 0, "invalid nil value for '%{public}s'", "targetRep");
  }
  double v13 = [(CRLWPEditor *)self interactiveCanvasController];
  [v4 unscaledLocationForICC:v13];
  double v15 = v14;
  double v17 = v16;

  unsigned int v18 = [v4 gestureState];
  if (v18 == 2)
  {
    [v8 updateFloatingCursorAtPoint:v15, v17];
  }
  else if (v18 == 1)
  {
    [(CRLWPEditor *)self twoFingerPanGestureWillBegin];
    [v8 beginFloatingCursorAtPoint:1, v15, v17];
  }
  else
  {
    [v8 endFloatingCursorWithRepForAnimation:v8];
    [(CRLWPEditor *)self twoFingerPanGestureDidEnd];
    v19 = +[NSNotificationCenter defaultCenter];
    long long v20 = [(CRLWPEditor *)self storageWithMarkedText];
    [v19 postNotificationName:@"CRLTPEditorSelectionChanged" object:v20];

    long long v21 = +[NSNotificationCenter defaultCenter];
    double v22 = [(CRLWPEditor *)self storageWithMarkedText];
    [v21 postNotificationName:@"CRLWPEditorSelectionContentsChanged" object:v22];
  }
}

- (void)p_handleImmediateAndLongPressGesture:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLWPEditor *)self interactiveCanvasController];
  [v4 unscaledLocationForICC:v5];
  id v21 = 0;
  BOOL v6 = 1;
  id v7 = [v5 hitKnobAtPoint:1 inputType:&v21 returningRep:];
  id v8 = v21;
  if ([v7 tag] != (id)11) {
    BOOL v6 = [v7 tag] == (id)10;
  }
  uint64_t v9 = objc_opt_class();
  id v10 = sub_1002469D0(v9, v8);

  int v11 = 1;
  if (v7 && v10)
  {
    uint64_t v12 = [v10 storage];
    double v13 = [(CRLWPEditor *)self storageWithMarkedText];

    int v11 = v12 != v13 || !v6;
  }
  double v14 = [(CRLWPEditor *)self knobTracker];
  if ([v4 gestureState] != 1 || v11) {
    BOOL v15 = ([v4 gestureState] == 2
  }
        || [v4 gestureState] == 3
        || [v4 gestureState] == 4)
       && v14 != 0;
  else {
    BOOL v15 = 1;
  }
  double v16 = [v4 gestureKind];
  id v17 = [v4 inputType];
  if ([v4 gestureState] == 1)
  {
    unsigned int v18 = [(CRLWPEditor *)self selection];
    unsigned int v19 = [v18 isInsertionPoint];
    if (v17 == (id)2) {
      BOOL v20 = 0;
    }
    else {
      BOOL v20 = v19;
    }
  }
  else
  {
    BOOL v20 = v17 != (id)2;
  }
  if (v16 == @"CRLWPImmediatePress" && v20 && !v15) {
    [(CRLWPEditor *)self p_handleCaretDragWithImmediatePressGesture:v4];
  }
  else {
    [(CRLWPEditor *)self p_handleLongPressTextInteractionWithGestureRecognizer:v4];
  }
}

- (void)p_handleCaretDragWithImmediatePressGesture:(id)a3
{
  id v27 = a3;
  id v4 = [(CRLWPEditor *)self interactiveCanvasController];
  [v27 unscaledLocationForICC:v4];
  double v6 = v5;
  double v8 = v7;
  [v4 convertUnscaledToBoundsPoint:];
  double v10 = v9;
  double v12 = v11;
  unsigned int v13 = [v27 gestureState];
  if (v13 - 3 < 2)
  {
    [(CRLWPEditor *)self revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold];
    [(CRLWPEditor *)self protectedStopMagnification];
  }
  else if (v13 == 2)
  {
    unsigned int v18 = -[CRLWPEditor p_editingRepAtPoint:](self, "p_editingRepAtPoint:", v6, v8);
    unsigned int v19 = [(CRLWPEditor *)self magnifier];

    if (v19)
    {
      BOOL v20 = [(CRLWPEditor *)self magnifier];
      [v20 setTarget:v18];

      id v21 = [(CRLWPEditor *)self magnifier];
      [v4 convertUnscaledToBoundsPoint:v6, v8];
      [v21 continueMagnifyingWithMagnificationPoint:];

      double v22 = (objc_class *)objc_opt_class();
      double v23 = sub_10024715C(v22, v27);
      [v23 velocity];
      double v25 = v24;
      uint64_t v26 = [(CRLWPEditor *)self magnifier];
      [v26 setPointVelocity:v25];
    }
    else
    {
      double v23 = [(CRLWPEditor *)self selection];
      -[CRLWPEditor p_beginMagnification:forRep:atPoint:shouldSetSelection:](self, "p_beginMagnification:forRep:atPoint:shouldSetSelection:", v23, v18, 1, v10, v12);
    }
  }
  else if (v13 == 1)
  {
    [(CRLWPEditor *)self p_clearEditMenuFlags];
    if (![(CRLWPEditor *)self editMenuIsVisible])
    {
      double v14 = [(CRLWPEditor *)self selection];
      if ([v14 isValid])
      {
        uint64_t v15 = (uint64_t)[v14 range];
        uint64_t v17 = v16;
      }
      else
      {
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v17 = 0;
      }
      -[CRLWPEditor setOriginalSelectionRange:](self, "setOriginalSelectionRange:", v15, v17);
    }
    [v4 layoutIfNeeded];
  }
}

- (BOOL)isUnscaledPointInTextSelection:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(CRLWPEditor *)self selection];
  uint64_t v7 = objc_opt_class();
  double v8 = [(CRLWPEditor *)self interactiveCanvasController];
  double v9 = [v8 hitRep:x, y];
  double v10 = [(CRLWPEditor *)self wpRepFromHitRep:v9];
  double v11 = sub_1002469D0(v7, v10);

  unsigned int v12 = [v11 canEditWithEditor:self];
  unsigned __int8 v13 = 0;
  if ([v6 isValid] && v12)
  {
    [v11 convertNaturalPointFromUnscaledCanvas:x, y];
    unsigned __int8 v13 = [v11 isPointInSelectedArea:];
  }

  return v13;
}

- (id)p_selectionForRep:(id)a3 point:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7 includeListLabels:(BOOL)a8 allowPastBreak:(BOOL)a9
{
  LOBYTE(v10) = 0;
  return -[CRLWPEditor p_selectionForRep:naturalPoint:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:alternateClick:](self, "p_selectionForRep:naturalPoint:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:alternateClick:", a3, a5, a6, a7, a8, a9, a4.x, a4.y, v10);
}

- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 leadingEdge:(BOOL *)a7
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  BOOL v9 = a5;
  double y = a4.y;
  double x = a4.x;
  unsigned int v12 = [a3 layout];
  unint64_t v13 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:inLayoutTarget:", v9, 0, a6, a7, v12, x, y);

  return v13;
}

- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  unint64_t v13 = v12;
  if (v12)
  {
    double v14 = [v12 layout];
    unint64_t v15 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:inLayoutTarget:", v9, v8, a7, 0, v14, x, y);
  }
  else
  {
    if (!v8)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF0C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BB360();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF0E8);
      }
      uint64_t v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v17);
      }
      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Unable to calculate charIndex with nil rep", v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[CRLWPEditor(GestureInterfaces) charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:]");
      double v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:]");
      uint64_t v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
      +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:712 isFatal:1 description:"Unable to calculate charIndex with nil rep"];

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v27, v28);
      abort();
    }
    unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v15;
}

- (unint64_t)charIndexInRep:(id)a3 fromPoint:(CGPoint)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 isAtEndOfLine:(BOOL *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  double y = a4.y;
  double x = a4.x;
  id v14 = a3;
  unint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = [v14 layout];
    unint64_t v17 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:inLayoutTarget:", v11, v10, v9, a8, 0, v16, x, y);
  }
  else
  {
    if (!v10)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF108);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BB3E8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF128);
      }
      uint64_t v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v19);
      }
      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Unable to calculate charIndex with nil rep", v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[CRLWPEditor(GestureInterfaces) charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:]");
      CKRecordID v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:]");
      Swift::String v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
      +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:723 isFatal:1 description:"Unable to calculate charIndex with nil rep"];

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v29, v30);
      abort();
    }
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v17;
}

- (id)p_selectionForRep:(id)a3 naturalPoint:(CGPoint)a4 textSelectionGranularity:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7 includeListLabels:(BOOL)a8 allowPastBreak:(BOOL)a9 alternateClick:(BOOL)a10
{
  BOOL v10 = a9;
  uint64_t v11 = a7;
  double y = a4.y;
  double x = a4.x;
  id v16 = a3;
  if (!v16) {
    goto LABEL_6;
  }
  v130[0] = 1;
  unsigned __int8 v129 = 0;
  unint64_t v17 = [(CRLWPEditor *)self storage];
  uint64_t v18 = [v16 storage];

  if (v17 == v18)
  {
    NSUInteger v20 = -[CRLWPEditor charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:](self, "charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:", v16, v10, &v129, v130, x, y);
  }
  else
  {
    uint64_t v19 = [(CRLWPEditor *)self storage];
    NSUInteger v20 = (NSUInteger)[v19 length];
  }
  if (v20 == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v22 = (char *)v20, !v130[0])
    && ([(CRLWPEditor *)self storageWithMarkedText],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        uint64_t v22 = (char *)[v23 nextCharacterIndex:v20],
        v23,
        v22 == (char *)0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_6:
    id v21 = 0;
    goto LABEL_80;
  }
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = [(CRLWPEditor *)self storageWithMarkedText];
  uint64_t v26 = sub_1002469D0(v24, v25);

  rect_8 = v26;
  if (a5 == 2)
  {
    if (-[CRLWPEditor charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:", v16, v10, 0, &v129, x, y) != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v20 = (NSUInteger)[v26 textRangeForParagraphAtCharIndex:v22];
      NSUInteger v29 = v49;
      uint64_t v36 = 0;
      goto LABEL_67;
    }
    goto LABEL_28;
  }
  if (a5 == 1)
  {
    unint64_t v37 = -[CRLWPEditor charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:", v16, v10, 1, 1, 0, x, y);
    unint64_t v38 = -[CRLWPEditor charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:](self, "charIndexInRep:fromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:", v16, v10, 0, 0, 0, x, y);
    if (v37 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v48 = v38;
LABEL_57:
      v56 = [(CRLWPEditor *)self editorHelper];
      uint64_t v57 = [v56 rangeForSelectionAtCharIndex:[v26 charIndexMappedFromStorage:v48] caretIndex:[v26 charIndexMappedFromStorage:v37]];
      uint64_t v59 = v58;

      if (v59 == 1 && [v26 characterAtIndex:v57] == 65532)
      {
        uint64_t v60 = 0;
        uint64_t v61 = 1;
      }
      else
      {
        uint64_t v57 = [v26 charRangeMappedToStorage:v57, v59];
        uint64_t v60 = 0;
      }
      goto LABEL_61;
    }
    unsigned int v39 = [(CRLWPEditor *)self storageWithMarkedText];
    v40 = (char *)[v39 length];

    v41 = [(CRLWPEditor *)self storageWithMarkedText];
    v42 = (char *)[v41 textRangeForParagraphAtCharIndex:v22];
    unint64_t v44 = v43;
    if (v22 >= v40)
    {

      if (v44)
      {
        uint64_t v48 = (uint64_t)(v22 - 1);
LABEL_56:
        unint64_t v37 = v48;
        goto LABEL_57;
      }
    }
    else
    {
      uint64_t v45 = v42;

      if (v22 < &v45[v44 - 1])
      {
        if (v22) {
          BOOL v46 = v129 == 0;
        }
        else {
          BOOL v46 = 1;
        }
        uint64_t v47 = !v46;
        uint64_t v48 = (uint64_t)&v22[-v47];
        goto LABEL_56;
      }
      if (v44 >= 2)
      {
        uint64_t v48 = (uint64_t)&v45[v44 - 2];
        goto LABEL_56;
      }
    }
    uint64_t v60 = 8;
    uint64_t v61 = 0;
    uint64_t v57 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_61:
    if (v57 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v29 = 0;
    }
    else {
      NSUInteger v29 = v61;
    }
    if (v57 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v36 = 7;
    }
    else
    {
      NSUInteger v20 = v57;
      uint64_t v36 = v60;
    }
    goto LABEL_67;
  }
  if (a5)
  {
    uint64_t v36 = 8;
    NSUInteger v29 = 0;
    NSUInteger v20 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_67;
  }
  Swift::String v28 = (char *)[v16 rangeOfMisspelledWordAtCharIndex:v22];
  NSUInteger v29 = v27;
  BOOL v30 = v28 < v22 && &v28[v27] > v22;
  char v31 = !v30;
  BOOL v32 = !a10;
  if (!v30) {
    BOOL v32 = 1;
  }
  if (!v11 || !v32)
  {
    if (v22
      && v129
      && ([(CRLWPEditor *)self storageWithMarkedText],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          CGPoint v33 = (char *)[(id)v11 length],
          (id)v11,
          v22 < v33))
    {
      uint64_t v11 = (uint64_t)rect_8;
      CGRect v34 = [rect_8 rangeOfNearestWhitespaceBeforeCharIndex:[rect_8 previousCharacterIndex:[rect_8 charIndexMappedFromStorage:v22]] includingBreaks:0];
      CGRect v35 = v22;
      if (v34 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v130[0] = 1;
        NSUInteger v20 = (NSUInteger)v34;
        CGRect v35 = v34;
      }
    }
    else
    {
      CGRect v35 = v22;
    }
    if ((v31 & 1) == 0)
    {
      v50 = [(CRLWPEditor *)self selection];
      if ([v50 isValid])
      {
        rect = v50;
        id v51 = [(CRLWPEditor *)self selection];
        id v124 = [v51 type];
        if (v124 == (id)3
          || ([(CRLWPEditor *)self selection],
              uint64_t v11 = objc_claimAutoreleasedReturnValue(),
              [(id)v11 type] == (id)5))
        {
          v122 = v51;
          [(CRLWPEditor *)self selection];
          v53 = unint64_t v52 = (unint64_t)v35;
          id v54 = [v53 range];
          v121 = (char *)v52;
          if (v52 >= (unint64_t)v54 && v52 - (unint64_t)v54 < v55)
          {

            if (v124 != (id)3) {
LABEL_88:
            }
            v81 = [(CRLWPEditor *)self selection];
            NSUInteger v20 = (NSUInteger)[v81 range];
            NSUInteger v29 = v82;
            uint64_t v36 = 0;
LABEL_124:

            goto LABEL_67;
          }
          v78 = [(CRLWPEditor *)self selection];
          v79 = (char *)[v78 range];
          v119 = &v79[v80];

          if (v124 != (id)3) {
          if (v119 == v121)
          }
            goto LABEL_88;
        }
        else
        {
        }
      }
      else
      {
      }
      if (v28 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v36 = 3;
        NSUInteger v20 = (NSUInteger)v28;
        goto LABEL_67;
      }
    }
    id v83 = [rect_8 wordAtCharIndex:v22 includePreviousWord:1];
    if (v83 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v85 = [(CRLWPEditor *)self editorHelper];
      id v86 = [v85 whiteSpaceRangeAtCharIndex:v22 includingBreaks:0];
      uint64_t v88 = v87;
    }
    else
    {
      id v86 = v83;
      uint64_t v88 = v84;
    }
    NSUInteger v29 = 0;
    uint64_t v36 = 7;
    if (v86 == (id)0x7FFFFFFFFFFFFFFFLL || !v88) {
      goto LABEL_67;
    }
    id v89 = [rect_8 charRangeMappedToStorage:v86, v88];
    NSUInteger v20 = (NSUInteger)v89 + v90 - 1;
    [v16 caretRectForCharIndex:v89 leadingEdge:1 caretAffinity:0];
    double v125 = v92;
    CGFloat recta = v91;
    CGFloat v94 = v93;
    double v123 = v93;
    CGFloat v96 = v95;
    [v16 caretRectForCharIndex:v20 leadingEdge:0 caretAffinity:0];
    CGFloat v98 = v97;
    CGFloat v100 = v99;
    CGFloat v102 = v101;
    CGFloat v104 = v103;
    v134.origin.double y = v94;
    v134.size.CGFloat width = v96;
    v134.origin.double x = recta;
    v134.size.CGFloat height = v125;
    CGFloat MidX = CGRectGetMidX(v134);
    CGFloat v120 = v102;
    v135.origin.double x = v98;
    CGFloat v117 = v104;
    double v118 = v100;
    v135.origin.double y = v100;
    v135.size.CGFloat width = v102;
    double v106 = MidX;
    v135.size.CGFloat height = v104;
    double v107 = CGRectGetMidX(v135);
    double v108 = v107;
    if (v106 <= v107) {
      double v109 = v106;
    }
    else {
      double v109 = v107;
    }
    if (v106 > v107) {
      double v107 = v106;
    }
    double v116 = v107;
    v136.origin.double x = recta;
    v136.origin.double y = v123;
    v136.size.CGFloat width = v96;
    v136.size.CGFloat height = v125;
    if (CGRectIsNull(v136)) {
      goto LABEL_102;
    }
    v137.size.CGFloat width = v120;
    v137.origin.double x = v98;
    v137.origin.double y = v118;
    v137.size.CGFloat height = v117;
    if (!CGRectIsNull(v137))
    {
      if (v123 != v118 && vabdd_f64(v123, v118) >= v125 / 3.0)
      {
        v138.origin.double x = recta;
        v138.origin.double y = v123;
        v138.size.CGFloat width = v96;
        v138.size.CGFloat height = v125;
        double v110 = vabdd_f64(CGRectGetMinX(v138), y);
        v139.origin.double x = recta;
        v139.origin.double y = v123;
        v139.size.CGFloat width = v96;
        v139.size.CGFloat height = v125;
        double v111 = fmin(v110, vabdd_f64(CGRectGetMaxX(v139), y));
        v140.origin.double y = v118;
        v140.origin.double x = v98;
        v140.size.CGFloat width = v120;
        v140.size.CGFloat height = v117;
        if (v111 <= vabdd_f64(CGRectGetMinY(v140), y)
          && (v141.origin.double x = v98,
              v141.origin.double y = v118,
              v141.size.CGFloat width = v120,
              v141.size.CGFloat height = v117,
              v111 <= vabdd_f64(CGRectGetMaxY(v141), y)))
        {
          char v112 = 1;
          NSUInteger v20 = (NSUInteger)v89;
        }
        else
        {
          char v112 = 0;
        }
        v130[0] = v112;
LABEL_114:
        if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FF148);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010BB470();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FF168);
          }
          v113 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v113);
          }
          v81 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_selectionForRep:naturalPoint:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:alternateClick:]");
          v114 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
          +[CRLAssertionHandler handleFailureInFunction:v81 file:v114 lineNumber:868 isFatal:0 description:"invalid charIndex for visual selection"];

          NSUInteger v29 = 0;
          NSUInteger v20 = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v36 = 7;
          goto LABEL_124;
        }
        goto LABEL_28;
      }
      if (v106 > v108 == v116 - x >= x - v109)
      {
LABEL_102:
        v130[0] = 0;
        goto LABEL_114;
      }
    }
    v130[0] = 1;
    NSUInteger v20 = (NSUInteger)v89;
    goto LABEL_114;
  }
LABEL_28:
  NSUInteger v29 = 0;
  uint64_t v36 = 7;
LABEL_67:
  v62 = [(CRLWPEditor *)self storageWithMarkedText];
  v133.CFIndex location = (NSUInteger)[v62 range];
  v133.CFIndex length = v63;
  v132.CFIndex location = v20;
  v132.CFIndex length = v29;
  id v64 = (id)sub_100209474(v132, v133);
  uint64_t v66 = v65;

  v67 = [(CRLWPEditor *)self storageWithMarkedText];
  BOOL v70 = v64 == [v67 length] && v66 == 0 || v130[0] != 0;
  v130[0] = v70;

  id v71 = objc_alloc([(CRLWPEditor *)self wpSelectionClass]);
  uint64_t v72 = v129;
  char v73 = v130[0];
  v74 = [(CRLWPEditor *)self storageWithMarkedText];
  LOBYTE(v115) = v73;
  id v21 = [v71 initWithType:v36 range:v64 styleInsertionBehavior:v66 caretAffinity:0 smartFieldRange:v72 leadingEdge:0x7FFFFFFFFFFFFFFFLL caretAffinity:0 storage:v115];

  if (a5 == 1 && !v36)
  {
    v75 = [(CRLWPEditor *)self editorHelper];
    uint64_t v76 = [v75 logicalToVisualSelection:v21];

    id v21 = (id)v76;
  }

LABEL_80:

  return v21;
}

- (void)tappedInRep:(id)a3 point:(CGPoint)a4 tapCount:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7
{
}

- (void)p_setTappedSelectionPath:(id)a3
{
  id v17 = a3;
  id v4 = [v17 mostSpecificSelectionOfClass:objc_opt_class()];
  double v5 = [_TtC8Freeform12CRLTextRange alloc];
  id v6 = [v4 range];
  BOOL v8 = -[CRLTextRange initWithRange:](v5, "initWithRange:", v6, v7);
  BOOL v9 = [(CRLWPEditor *)self storage];
  if ([v9 hasMarkedText])
  {
    BOOL v10 = [(CRLWPEditor *)self storage];
    uint64_t v11 = [v10 markedTextRange];
    unsigned __int8 v12 = [v11 containsTextRange:v8];

    if (v12) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  unint64_t v13 = [(CRLWPEditor *)self storage];
  unsigned int v14 = [v13 hasMarkedText];

  if (v14) {
    [(CRLWPEditor *)self abortMarkedText];
  }
  if ([(CRLWPEditor *)self isSelectionPlaceHolderTextWithSelection:v4]) {
    uint64_t v15 = 6;
  }
  else {
    uint64_t v15 = 14;
  }
  [(CRLWPEditor *)self setSelectionBeingSetFromGestures:1];
  id v16 = [(CRLWPEditor *)self interactiveCanvasController];
  [v16 setSelectionPath:v17 withSelectionFlags:v15];

  [(CRLWPEditor *)self setSelectionBeingSetFromGestures:0];
LABEL_11:
}

- (void)tappedInRep:(id)a3 point:(CGPoint)a4 tapCount:(unint64_t)a5 isTapHold:(BOOL)a6 precise:(BOOL)a7 alternateClick:(BOOL)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  double y = a4.y;
  double x = a4.x;
  id v27 = a3;
  [(CRLWPEditor *)self p_sendHandleTapNotification];
  if (a5 == 3)
  {
    uint64_t v15 = 2;
  }
  else if (a5 == 2)
  {
    uint64_t v15 = 1;
  }
  else
  {
    if (a5 == 1)
    {
      [v27 convertNaturalPointToUnscaledCanvas:x, y];
      if (-[CRLWPEditor isUnscaledPointInTextSelection:](self, "isUnscaledPointInTextSelection:")) {
        [(CRLWPEditor *)self hideEditMenu];
      }
    }
    uint64_t v15 = 0;
  }
  id v16 = [(CRLWPEditor *)self storage];
  if (([v16 hasMarkedText] & 1) == 0)
  {

    goto LABEL_13;
  }
  id v17 = [(CRLWPEditor *)self layout];
  unsigned __int8 v18 = [v17 markedTextContainsPoint:x, y];

  uint64_t v19 = v27;
  if ((v18 & 1) == 0)
  {
LABEL_13:
    LOBYTE(v26) = a8;
    NSUInteger v20 = -[CRLWPEditor p_selectionForRep:naturalPoint:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:alternateClick:](self, "p_selectionForRep:naturalPoint:textSelectionGranularity:isTapHold:precise:includeListLabels:allowPastBreak:alternateClick:", v27, v15, v10, v9, a5 != 0, 0, x, y, v26);
    id v21 = [(CRLWPEditor *)self editorController];
    uint64_t v22 = [v21 selectionPath];
    uint64_t v23 = [(CRLWPEditor *)self selection];
    uint64_t v24 = [v22 selectionPathPoppingOffSelection:v23];

    uint64_t v25 = [v24 selectionPathWithAppendedSelection:v20];

    [(CRLWPEditor *)self p_setTappedSelectionPath:v25];
    uint64_t v19 = v27;
  }
}

- (BOOL)isACurrentEditor
{
  v2 = self;
  id v3 = [(CRLWPEditor *)self interactiveCanvasController];
  id v4 = [v3 editorController];
  double v5 = [v4 currentEditors];
  LOBYTE(v2) = [v5 containsObject:v2];

  return (char)v2;
}

- (void)p_sendHandleTapNotification
{
  CFStringRef v4 = @"CRLEditorControllerEditorKey";
  double v5 = self;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"CRLEditorControllerTextEditorWillHandleTap" object:0 userInfo:v2];
}

- (void)p_handleLongPressTextInteractionWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLWPEditor *)self interactiveCanvasController];
  [v4 unscaledLocationForICC:v5];
  double v7 = v6;
  double v9 = v8;
  [v5 convertUnscaledToBoundsPoint:];
  double v11 = v10;
  double v13 = v12;
  id v42 = 0;
  unsigned int v14 = [v5 hitKnobAtPoint:1 inputType:&v42 returningRep:v7 v9];
  id v15 = v42;
  id v16 = [v4 gestureKind];
  unsigned int v17 = [(CRLWPEditor *)self shouldUseModernTextGestures];
  unsigned int v18 = [v4 gestureState];
  if (v18 - 3 < 2)
  {
    NSUInteger v20 = [(CRLWPEditor *)self knobTracker];

    if (v20)
    {
      id v21 = [(CRLWPEditor *)self knobTracker];
      if ([v21 didDragKnob])
      {
      }
      else
      {
        unsigned __int8 v23 = [(CRLWPEditor *)self wantsParagraphMode];

        if ((v23 & 1) == 0) {
          [(CRLWPEditor *)self p_tappedOnKnob:v14];
        }
      }
      [(CRLWPEditor *)self p_protectedStopKnobTrackingGesture:v4];
    }
    else
    {
      [(CRLWPEditor *)self p_endAutoscroll];
      [(CRLWPEditor *)self revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold];
      [(CRLWPEditor *)self protectedStopMagnification];
      if ([v4 gestureState] == 3) {
        [(CRLWPEditor *)self setShouldShowEditMenuForInsertionPoint:1];
      }
    }
  }
  else
  {
    if (v18 != 2)
    {
      if (v18 != 1) {
        goto LABEL_36;
      }
      [(CRLWPEditor *)self p_clearEditMenuFlags];
      [v5 layoutIfNeeded];
      if ([v14 tag] == (id)11)
      {
        BOOL v19 = 0;
        if (!v14) {
          goto LABEL_20;
        }
      }
      else
      {
        BOOL v19 = [v14 tag] != (id)10;
        if (!v14) {
          goto LABEL_20;
        }
      }
      if (!v19)
      {
        uint64_t v24 = objc_opt_class();
        uint64_t v25 = sub_1002469D0(v24, v15);
        [v14 position];
        [v15 convertNaturalPointToUnscaledCanvas:];
        [(CRLWPEditor *)self setKnobToTouchOffset:sub_100064680(v26, v27, v7)];
        [(CRLWPEditor *)self p_createKnobTracker:v14 forRep:v25 tapCount:1];
        [(CRLWPEditor *)self p_beginOperationAndTakeControl];
        [(CRLWPEditor *)self p_handleKnobDragGestureRecognizer:v4];

        goto LABEL_36;
      }
LABEL_20:
      if (v16 != @"CRLWPLongPress") {
        goto LABEL_36;
      }
      Swift::String v28 = [(CRLWPEditor *)self p_textRepAtGestureLocationForGesture:v4];
      [v28 convertNaturalPointFromUnscaledCanvas:v7, v9];
      double v30 = v29;
      double v32 = v31;
      CGPoint v33 = [(CRLWPEditor *)self selection];
      if ([v33 isRange])
      {
        unsigned __int8 v34 = -[CRLWPEditor isUnscaledPointInTextSelection:](self, "isUnscaledPointInTextSelection:", v7, v9);

        if (v34) {
          goto LABEL_30;
        }
      }
      else
      {
      }
      -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v28, 1, 1, 0, v30, v32);
LABEL_30:
      unsigned int v39 = [(CRLWPEditor *)self selection];
      if ([v39 isInsertionPoint])
      {
        if (v17)
        {
          if (v28)
          {
            -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v28, 2, 1, 0, v30, v32);
            v40 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v11, v13);
            v43[0] = @"CRLWPEditorTextRepKey";
            v43[1] = @"CRLWPEditorRepPointKey";
            v44[0] = v28;
            v44[1] = v40;
            v41 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
            [(CRLWPEditor *)self setTapInfo:v41];

            [(CRLWPEditor *)self p_beginTapAndLongPress];
          }
        }
        else
        {
          -[CRLWPEditor p_beginMagnification:forRep:atPoint:shouldSetSelection:](self, "p_beginMagnification:forRep:atPoint:shouldSetSelection:", v39, v28, 1, v11, v13);
        }
      }

      goto LABEL_36;
    }
    uint64_t v22 = [(CRLWPEditor *)self knobTracker];

    if (v22)
    {
      [(CRLWPEditor *)self p_handleKnobDragGestureRecognizer:v4];
    }
    else if ((v17 & 1) == 0)
    {
      CGRect v35 = [v5 layerHost];
      uint64_t v36 = [v35 canvasView];
      unint64_t v37 = [v36 enclosingScrollView];
      unsigned int v38 = [v37 isScrollEnabled];

      if (v38) {
        +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v7, v9);
      }
      -[CRLWPEditor p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", 0, 0, v7, v9);
    }
  }
LABEL_36:
}

- (id)p_editingRepForCharIndex:(unint64_t)a3
{
  double v5 = [(CRLWPEditor *)self interactiveCanvasController];
  [v5 visibleUnscaledRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [(CRLWPEditor *)self editingReps];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v14)
  {
    id v16 = 0;
    goto LABEL_23;
  }
  id v15 = v14;
  id v16 = 0;
  id v17 = 0;
  uint64_t v18 = *(void *)v41;
  double v19 = INFINITY;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      id v21 = v17;
      if (*(void *)v41 != v18) {
        objc_enumerationMutation(obj);
      }
      id v17 = *(id *)(*((void *)&v40 + 1) + 8 * i);

      uint64_t v22 = (char *)[v17 range];
      if (a3 < (unint64_t)v22 || a3 - (unint64_t)v22 >= v23)
      {
        uint64_t v25 = v22;
        unint64_t v26 = v23;
        double v27 = [(CRLWPEditor *)self storage];
        if ([v27 length] != (id)a3) {
          goto LABEL_15;
        }

        if (&v25[v26] != (char *)a3) {
          continue;
        }
      }
      [v17 frameInUnscaledCanvas];
      double v32 = sub_1000655FC(v28, v29, v30, v31, v7, v9, v11, v13);
      if (v32 >= v19) {
        continue;
      }
      double v27 = v16;
      double v19 = v32;
      id v16 = v17;
LABEL_15:
    }
    id v15 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  }
  while (v15);
  if (v17)
  {
    if (v16) {
      goto LABEL_20;
    }
    goto LABEL_21;
  }
LABEL_23:
  if ([obj count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF188);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BB4F8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF1A8);
    }
    uint64_t v36 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v36);
    }
    unint64_t v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_editingRepForCharIndex:]");
    unsigned int v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
    +[CRLAssertionHandler handleFailureInFunction:v37 file:v38 lineNumber:1436 isFatal:0 description:"No valid rep for given char index; No editing reps."];
  }
  id v17 = 0;
  if (v16)
  {
LABEL_20:
    id v33 = v16;

    id v17 = v33;
  }
LABEL_21:
  id v34 = v17;

  return v34;
}

- (BOOL)p_shouldBeginCaretGrabAtUnscaledCanvasPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(CRLWPEditor *)self shouldUseModernTextGestures]) {
    return 0;
  }
  double v6 = [(CRLWPEditor *)self selection];
  unsigned int v7 = [v6 isInsertionPoint];

  if (!v7) {
    return 0;
  }
  double v8 = [(CRLWPEditor *)self interactiveCanvasController];
  [v8 layoutIfNeeded];

  double v9 = [(CRLWPEditor *)self selection];
  double v10 = -[CRLWPEditor p_editingRepForCharIndex:](self, "p_editingRepForCharIndex:", [v9 start]);

  double v11 = [(CRLWPEditor *)self interactiveCanvasController];
  uint64_t v12 = [v11 hitRep:x, y];
  double v13 = (void *)v12;
  if (!v10 || v12 && (void *)v12 != v10) {
    goto LABEL_7;
  }
  id v14 = [(CRLWPEditor *)self selection];
  [v10 caretRectForSelection:v14];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v31.origin.double x = v16;
  v31.origin.double y = v18;
  v31.size.double width = v20;
  v31.size.double height = v22;
  if (!CGRectIsNull(v31))
  {
    v32.origin.double x = v16;
    v32.origin.double y = v18;
    v32.size.double width = v20;
    v32.size.double height = v22;
    CGRect v33 = CGRectInset(v32, -25.0, -25.0);
    double v25 = v33.origin.x;
    double v26 = v33.origin.y;
    double width = v33.size.width;
    double height = v33.size.height;
    [v10 convertNaturalPointFromUnscaledCanvas:x y:y];
    BOOL v23 = sub_1000652B0(v29, v30, v25, v26, width, height);
  }
  else
  {
LABEL_7:
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)p_shiftKeyIsDownWIthGesture:(id)a3
{
  return ((unint64_t)[a3 tsdModifierFlags] >> 17) & 1;
}

- (id)p_inlineEquationRepInTableCellTextRep:(id)a3 atUnscaledCanvasPoint:(CGPoint)a4 gesture:(id)a5
{
  double v5 = [(CRLWPEditor *)self storageWithMarkedText];
  [v5 wpKind];

  return 0;
}

- (void)p_handleTapAndTouchGesture:(id)a3
{
  id v4 = a3;
  id v5 = [v4 inputType];
  [(CRLWPEditor *)self setIgnoreFutureImmediatePresses:1];
  double v6 = [(CRLWPEditor *)self interactiveCanvasController];
  [v4 unscaledLocationForICC:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(CRLWPEditor *)self interactiveCanvasController];
  [v11 layoutIfNeeded];

  uint64_t v12 = [(CRLWPEditor *)self p_textRepAtGestureLocationForGesture:v4];
  [v12 convertNaturalPointFromUnscaledCanvas:v8, v10];
  double v14 = v13;
  double v16 = v15;
  double v17 = (char *)[v4 numberOfTapsRequired];
  CGFloat v18 = [(CRLWPEditor *)self knobTracker];
  if (v18 || ([(CRLWPEditor *)self magnifier], (CGFloat v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    unsigned __int8 v29 = [(CRLWPEditor *)self pinchAndHalfDidStart];
    if (!v12 && (v29 & 1) == 0) {
      goto LABEL_12;
    }
  }
  double v19 = [(CRLWPEditor *)self selection];
  if ([v19 type] == (id)3)
  {
  }
  else
  {
    CGFloat v20 = [(CRLWPEditor *)self selection];
    id v21 = [v20 type];

    if (v21 != (id)5)
    {
      CGFloat v22 = [(CRLWPEditor *)self interactiveCanvasController];
      [v22 convertUnscaledToBoundsPoint:v8, v10];
      double v24 = v23;
      double v26 = v25;

      if ([v4 gestureState] == 1)
      {
        [(CRLWPEditor *)self p_clearEditMenuFlags];
        -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v12, v17 + 1, 1, 0, v14, v16);
        [(CRLWPEditor *)self setInitialPressTextSelectionGranularity:1];
        if (v5)
        {
          [(CRLWPEditor *)self p_cancelTapAndLongPressPreviousSelector];
          double v27 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v24, v26);
          v47[0] = @"CRLWPEditorTextRepKey";
          v47[1] = @"CRLWPEditorRepPointKey";
          v48[0] = v12;
          v48[1] = v27;
          CGFloat v28 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
          [(CRLWPEditor *)self setTapInfo:v28];

          [(CRLWPEditor *)self performSelector:"p_beginTapAndLongPress" withObject:0 afterDelay:0.2];
        }
        else
        {
          double v27 = [(CRLWPEditor *)self selection];
          uint64_t v45 = [(CRLWPEditor *)self editorHelper];
          [v45 setAnchorSelection:v27];
        }
      }
      else
      {
        if ([v4 gestureState] != 2)
        {
          [(CRLWPEditor *)self p_endAutoscroll];
          if (!v5)
          {
            BOOL v46 = [(CRLWPEditor *)self editorHelper];
            [v46 setAnchorSelection:0];

            [(CRLWPEditor *)self setInitialPressTextSelectionGranularity:0];
            goto LABEL_34;
          }
          [(CRLWPEditor *)self p_cancelTapAndLongPressPreviousSelector];
          unint64_t v44 = [(CRLWPEditor *)self knobTracker];

          if (v44)
          {
LABEL_16:
            [(CRLWPEditor *)self p_protectedStopKnobTrackingGesture:v4];
            goto LABEL_34;
          }
          [(CRLWPEditor *)self tapAndLongPressDidEndOrCancel];
LABEL_23:
          [(CRLWPEditor *)self protectedStopMagnification];
          goto LABEL_34;
        }
        if (v5) {
          goto LABEL_34;
        }
        unsigned int v39 = [(CRLWPEditor *)self interactiveCanvasController];
        long long v40 = [v39 canvasView];
        long long v41 = [v40 enclosingScrollView];
        unsigned int v42 = [v41 isScrollEnabled];

        if (v42) {
          +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v8, v10);
        }
        double v27 = [(CRLWPEditor *)self editorHelper];
        long long v43 = [v27 anchorSelection];
        -[CRLWPEditor p_adjustSelection:withUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:](self, "p_adjustSelection:withUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:", v43, [(CRLWPEditor *)self initialPressTextSelectionGranularity], 0, [(CRLWPEditor *)self initialPressTextSelectionGranularity] ^ 1, 1, v8, v10);
      }
      goto LABEL_34;
    }
  }
LABEL_12:
  [(CRLWPEditor *)self p_endAutoscroll];
  [(CRLWPEditor *)self p_cancelTapAndLongPressPreviousSelector];
  if ([v4 gestureState] == 3 || objc_msgSend(v4, "gestureState") == 4)
  {
    if (!v5)
    {
      CGRect v31 = [(CRLWPEditor *)self editorHelper];
      [v31 setAnchorSelection:0];

      goto LABEL_34;
    }
    double v30 = [(CRLWPEditor *)self knobTracker];

    if (v30) {
      goto LABEL_16;
    }
    unsigned int v38 = [(CRLWPEditor *)self magnifier];

    if (!v38) {
      goto LABEL_34;
    }
    goto LABEL_23;
  }
  CGRect v32 = [(CRLWPEditor *)self magnifier];

  if (v32)
  {
    CGRect v33 = [(CRLWPEditor *)self interactiveCanvasController];
    id v34 = [v33 layerHost];
    CGRect v35 = [v34 canvasView];
    uint64_t v36 = [v35 enclosingScrollView];
    unsigned int v37 = [v36 isScrollEnabled];

    if (v37) {
      +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v8, v10);
    }
    -[CRLWPEditor p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", 0, 0, v8, v10);
  }
LABEL_34:
}

- (void)p_beginTapAndLongPress
{
  id v3 = [(CRLWPEditor *)self tapInfo];

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF1C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BB580();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF1E8);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_beginTapAndLongPress]");
    double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:1798 isFatal:0 description:"self.tapInfo should be set"];
  }
  double v7 = [(CRLWPEditor *)self tapInfo];
  double v8 = [v7 objectForKeyedSubscript:@"CRLWPEditorTextRepKey"];

  double v9 = [(CRLWPEditor *)self tapInfo];
  double v10 = [v9 objectForKeyedSubscript:@"CRLWPEditorRepPointKey"];
  [v10 CGPointValue];
  double v12 = v11;
  double v14 = v13;

  double v15 = [(CRLWPEditor *)self selection];
  double v16 = [(CRLWPEditor *)self knobTracker];
  if (v16 || ![v15 isValid])
  {
  }
  else if ([v15 isRange])
  {
    -[CRLWPEditor p_beginKnobTrackingSelection:forRep:atPoint:](self, "p_beginKnobTrackingSelection:forRep:atPoint:", v15, v8, v12, v14);
  }
  [(CRLWPEditor *)self setTapInfo:0];
}

- (void)updateTapAndLongPress
{
  id v3 = [(CRLWPEditor *)self tapInfo];

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF208);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BB608();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF228);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) updateTapAndLongPress]");
    double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:1822 isFatal:0 description:"self.tapInfo should be set"];
  }
  double v7 = [(CRLWPEditor *)self tapInfo];
  double v8 = [v7 objectForKeyedSubscript:@"CRLWPEditorRepPointKey"];
  [v8 CGPointValue];
  double v10 = v9;
  double v12 = v11;

  -[CRLWPEditor clampUnscaledPointToTextFieldBounds:](self, "clampUnscaledPointToTextFieldBounds:", v10, v12);
  double v14 = v13;
  double v16 = v15;
  id v17 = [(CRLWPEditor *)self selectedRangeAtPinchAndHalfStart];
  NSUInteger v19 = v18;
  CGFloat v20 = [(CRLWPEditor *)self editingRep];
  [v20 convertNaturalPointFromUnscaledCanvas:v14, v16];
  double v22 = v21;
  double v24 = v23;

  [(CRLWPEditor *)self adjustedDragToNaturalPointOffset];
  double v26 = sub_100064680(v22, v24, v25);
  double v28 = v27;
  unsigned __int8 v29 = [(CRLWPEditor *)self textSelectionDelegate];
  double v30 = [v29 selectWordAt:v26, v28];

  v39.CFIndex location = (NSUInteger)[v30 nsRange];
  v39.CFIndex length = v31;
  v38.CFIndex location = (NSUInteger)v17;
  v38.CFIndex length = v19;
  NSRange v32 = NSUnionRange(v38, v39);
  -[CRLWPEditor setAdjustedDragPoint:](self, "setAdjustedDragPoint:", v26, v28);
  CGRect v33 = [(CRLWPEditor *)self storageWithMarkedText];
  id v34 = [v33 length];

  if (v32.length >= (unint64_t)v34)
  {
    [(CRLWPEditor *)self tapAndLongPressDidEndOrCancel];
  }
  else
  {
    CGRect v35 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v32.location, v32.length);
    uint64_t v36 = [(CRLWPEditor *)self interactiveCanvasController];
    unsigned int v37 = [v36 textInputResponder];
    [v37 setSelectedTextRange:v35];
  }
}

- (void)tapAndLongPressDidEndOrCancel
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(CRLWPEditor *)self editingReps];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setSuppressSelectionControls:0];
        [v8 invalidateKnobs];
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  -[CRLWPEditor setSelectedRangeAtPinchAndHalfStart:](self, "setSelectedRangeAtPinchAndHalfStart:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[CRLWPEditor setExpectedWordSelectionAtPoint:](self, "setExpectedWordSelectionAtPoint:", 0x7FFFFFFFFFFFFFFFLL, 0);
  [(CRLWPEditor *)self setGestureIsSuppressingKnobs:0];
  [(CRLWPEditor *)self setPinchAndHalfDidStart:0];
}

- (void)p_cancelTapAndLongPressPreviousSelector
{
  id v3 = [(CRLWPEditor *)self tapInfo];

  if (v3) {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"p_beginTapAndLongPress" object:0];
  }

  [(CRLWPEditor *)self setTapInfo:0];
}

- (void)p_beginKnobTrackingSelection:(id)a3 forRep:(id)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  unint64_t v11 = -[CRLWPEditor charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:](self, "charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:", v10, 0, 0, 0, x, y);
  id v12 = [v9 range];
  [v9 range];
  if (v11 >= (unint64_t)v12 + (v13 >> 1)) {
    uint64_t v14 = 10;
  }
  else {
    uint64_t v14 = 11;
  }
  double v15 = [v10 knobForTag:v14];
  if (v15)
  {
LABEL_15:
    [v15 position];
    if (sub_100065BC8(v22, v23))
    {
      [(CRLWPEditor *)self p_createKnobTracker:v15 forRep:v10 tapCount:2];
      [(CRLWPEditor *)self p_beginOperationAndTakeControl];
    }
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v16 = [v10 siblings];
    id v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = [*(id *)(*((void *)&v24 + 1) + 8 * i) knobForTag:v14];
          if (v21)
          {
            double v15 = (void *)v21;

            goto LABEL_15;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    double v15 = 0;
  }
}

- (void)p_createKnobTracker:(id)a3 forRep:(id)a4 tapCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CRLWPEditor *)self knobTracker];

  if (v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF248);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BB724();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF268);
    }
    unint64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_createKnobTracker:forRep:tapCount:]");
    unint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1895, 0, "expected nil value for '%{public}s'", "self.knobTracker");
  }
  uint64_t v14 = [(CRLWPEditor *)self knobTracker];

  if (!v14)
  {
    [(CRLWPEditor *)self setKnobTrackingTapCount:a5];
    id v15 = [v9 newTrackerForKnob:v8];
    uint64_t v16 = objc_opt_class();
    id v17 = sub_1002469D0(v16, v15);
    if (!v17)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF288);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BB690();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF2A8);
      }
      id v18 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v18);
      }
      uint64_t v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_createKnobTracker:forRep:tapCount:]");
      CGFloat v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 1900, 0, "invalid nil value for '%{public}s'", "wpKnobTracker");
    }
    [(CRLWPEditor *)self setKnobTracker:v17];
  }
}

- (void)p_handleEditableTextSelectionForceGesture:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = [v4 targetRep];
  double v7 = sub_10024715C(v5, v6);

  id v8 = [(CRLWPEditor *)self interactiveCanvasController];
  [v4 unscaledLocationForICC:v8];
  double v10 = v9;
  double v12 = v11;

  unint64_t v13 = [(CRLWPEditor *)self interactiveCanvasController];
  [v13 convertUnscaledToBoundsPoint:v10, v12];
  double v15 = v14;
  double v17 = v16;

  unsigned int v18 = [v4 gestureState];
  if (v18 - 3 < 2)
  {
    [(CRLWPEditor *)self setEditableTextSelectionForceGestureInProgress:0];
    [(CRLWPEditor *)self p_endAutoscroll];
    [(CRLWPEditor *)self revertLastSelectionChangeIfElapsedTimeIsUnderPinFidgetThreshold];
    [(CRLWPEditor *)self protectedStopMagnification];
  }
  else if (v18 == 2)
  {
    CGFloat v20 = [(CRLWPEditor *)self magnifier];

    if (!v20)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF2C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BB7B8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF2E8);
      }
      uint64_t v21 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v21);
      }
      double v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_handleEditableTextSelectionForceGesture:]");
      double v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 1925, 0, "invalid nil value for '%{public}s'", "self.magnifier");
    }
    long long v24 = [(CRLWPEditor *)self magnifier];
    [v24 setTarget:v7];

    long long v25 = [(CRLWPEditor *)self magnifier];
    [v25 continueMagnifyingWithMagnificationPoint:v15, v17];

    long long v26 = [(CRLWPEditor *)self interactiveCanvasController];
    long long v27 = [v26 layerHost];
    double v28 = [v27 canvasView];
    unsigned __int8 v29 = [v28 enclosingScrollView];
    unsigned int v30 = [v29 isScrollEnabled];

    if (v30) {
      +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v10, v12);
    }
    -[CRLWPEditor p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", 0, 0, v10, v12);
  }
  else if (v18 == 1)
  {
    [(CRLWPEditor *)self setEditableTextSelectionForceGestureInProgress:1];
    uint64_t v19 = [(CRLWPEditor *)self selection];
    -[CRLWPEditor p_beginMagnification:forRep:atPoint:shouldSetSelection:](self, "p_beginMagnification:forRep:atPoint:shouldSetSelection:", v19, v7, 1, v15, v17);
  }
}

- (void)p_handleTapGestures:(id)a3
{
  id v4 = a3;
  id v5 = [v4 gestureKind];
  uint64_t v6 = [(CRLWPEditor *)self interactiveCanvasController];
  [v4 unscaledLocationForICC:v6];
  double v8 = v7;
  double v10 = v9;
  -[CRLWPEditor setFirstTapUnscaledPoint:](self, "setFirstTapUnscaledPoint:");
  [v6 layoutIfNeeded];
  double v11 = [(CRLWPEditor *)self p_textRepAtGestureLocationForGesture:v4];
  [v11 convertNaturalPointFromUnscaledCanvas:v8, v10];
  double v13 = v12;
  double v15 = v14;
  if (v5 == @"CRLWPImmediateSingleTap")
  {
    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF308);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BB84C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF328);
      }
      double v23 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v23);
      }
      long long v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_handleTapGestures:]");
      long long v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
      +[CRLAssertionHandler handleFailureInFunction:v24 file:v25 lineNumber:1989 isFatal:0 description:"we should have gotten a valid textRep by now"];
    }
    unsigned int v26 = [(CRLWPEditor *)self p_shiftKeyIsDownWIthGesture:v4];
    uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v28 = 0;
    -[CRLWPEditor setOriginalSelectionRange:](self, "setOriginalSelectionRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    [(CRLWPEditor *)self p_clearEditMenuFlags];
    if (![(CRLWPEditor *)self editMenuIsVisible])
    {
      unsigned __int8 v29 = [(CRLWPEditor *)self selection];
      if ([v29 isValid])
      {
        uint64_t v27 = (uint64_t)[v29 range];
        uint64_t v28 = v30;
      }
      -[CRLWPEditor setOriginalSelectionRange:](self, "setOriginalSelectionRange:", v27, v28);
    }
    if (([(CRLWPEditor *)self shouldUseModernTextGestures] & v26) == 1
      && ([(CRLWPEditor *)self selection],
          NSUInteger v31 = objc_claimAutoreleasedReturnValue(),
          unsigned int v32 = [v31 isValid],
          v31,
          v32))
    {
      CGRect v33 = [(CRLWPEditor *)self selection];
      -[CRLWPEditor p_adjustSelection:withUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:](self, "p_adjustSelection:withUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:", v33, 0, 0, 0, 0, v8, v10);
    }
    else
    {
      BOOL v34 = 1;
      [(CRLWPEditor *)self setSelectionSetFromSingleTap:1];
      if ([v4 inputType]) {
        BOOL v34 = [v4 inputType] == (id)2;
      }
      -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:alternateClick:](self, "tappedInRep:point:tapCount:isTapHold:precise:alternateClick:", v11, 1, 0, v34, [v4 inputType] == (id)2, v13, v15);
      [(CRLWPEditor *)self setSelectionSetFromSingleTap:0];
      [(CRLWPEditor *)self setInitialPressTextSelectionGranularity:0];
      [(CRLWPEditor *)self setIsBecomingActive:0];
    }
  }
  else if (v5 == @"CRLWPImmediateDoubleTap")
  {
    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF348);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BB8D4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FF368);
      }
      double v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v16);
      }
      double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_handleTapGestures:]");
      unsigned int v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
      +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:2033 isFatal:0 description:"we should have gotten a valid textRep by now"];
    }
    [(CRLWPEditor *)self firstTapUnscaledPoint];
    if (v19 != 9.22337204e18)
    {
      [(CRLWPEditor *)self firstTapUnscaledPoint];
      if (v20 != 9.22337204e18)
      {
        [(CRLWPEditor *)self firstTapUnscaledPoint];
        [v11 convertNaturalPointFromUnscaledCanvas];
        double v13 = v21;
        double v15 = v22;
      }
    }
    -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v11, 2, 0, 0, v13, v15);
  }
}

- (void)setSelectionControlsForInputType:(int64_t)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(CRLWPEditor *)self editingReps];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setSuppressSelectionControls:a3 == 0];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(CRLWPEditor *)self setSuppressEditMenuForIndirectGesture:a3 == 0];
}

- (BOOL)canHandleGesture:(id)a3
{
  id v4 = a3;
  if ([(CRLWPEditor *)self blockGesture:v4])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v6 = [(CRLWPEditor *)self interactiveCanvasController];
    [v4 unscaledLocationForICC:v6];
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = objc_opt_class();
    long long v12 = [v6 hitRep:v8, v10];
    long long v13 = sub_1002469D0(v11, v12);

    LOBYTE(v5) = [v13 canEditWithEditor:self];
    unsigned __int8 v30 = [(CRLWPEditor *)self canIgnoreEvent];
    id v31 = 0;
    BOOL v14 = 1;
    double v15 = [v6 hitKnobAtPoint:1 inputType:&v31 returningRep:v8 v10];
    id v16 = v31;
    uint64_t v17 = objc_opt_class();
    unsigned int v18 = sub_1002469D0(v17, v16);

    if ([v15 tag] != (id)11) {
      BOOL v14 = [v15 tag] == (id)10;
    }
    BOOL v19 = 0;
    if (v15 && v18)
    {
      double v20 = [v18 storage];
      double v21 = [(CRLWPEditor *)self storage];
      BOOL v19 = v20 == v21 && v14;
    }
    if (v18) {
      LOBYTE(v5) = v14 & v5;
    }
    double v22 = [v4 gestureKind];
    if ([v4 inputType])
    {
      if (v22 == @"CRLWPTwoFingerPan")
      {
        LOBYTE(v5) = 1;
      }
      else if (v22 != @"CRLWPLongPress" || v15)
      {
        if (v22 == @"CRLWPImmediatePress"
          && ![(CRLWPEditor *)self ignoreFutureImmediatePresses])
        {
          unsigned int v5 = -[CRLWPEditor p_shouldBeginCaretGrabAtUnscaledCanvasPoint:](self, "p_shouldBeginCaretGrabAtUnscaledCanvasPoint:", v8, v10)|| v19;
        }
        else if (v22 == @"CRLWPImmediateSingleTap" {
               || v22 == @"CRLWPSecondarySingleTap"
        }
               || v22 == @"CRLWPImmediateDoubleTap"
               || v22 == @"CRLWPTapAndTouch"
               || v22 == @"CRLWPDoubleTapAndTouch")
        {
          uint64_t v27 = [(CRLWPEditor *)self interactiveCanvasController];
          unsigned __int8 v28 = [v27 editingDisabled];

          LOBYTE(v5) = v28 | v5;
        }
        else if (v22 != @"CRLWPEditableTextSelectionForceGesture")
        {
          LOBYTE(v5) = 0;
        }
      }
    }
    else
    {
      if (v22 == @"CRLWPImmediatePress"
        || v22 == @"CRLWPImmediateSingleTap"
        || v22 == @"CRLWPTapAndTouch"
        || v22 == @"CRLWPDoubleTapAndTouch")
      {
        char v26 = v5;
      }
      else
      {
        char v26 = 0;
      }
      LOBYTE(v5) = v26 & (v30 ^ 1);
    }
  }
  return v5;
}

- (void)handleGesture:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLWPEditor *)self interactiveCanvasController];
  id v6 = [v4 gestureKind];
  if ([v4 gestureState] != 2) {
    [v5 layoutIfNeeded];
  }
  id v7 = [v4 inputType];
  [v4 unscaledLocationForICC:v5];
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = objc_opt_class();
  long long v13 = [v5 hitRep:v9, v11];
  BOOL v14 = [(CRLWPEditor *)self wpRepFromHitRep:v13];
  double v15 = sub_1002469D0(v12, v14);

  unsigned int v16 = [v15 suppressSelectionControls];
  uint64_t v17 = objc_opt_class();
  unsigned int v18 = [v5 layerHost];
  BOOL v19 = sub_1002469D0(v17, v18);

  [v5 convertUnscaledToBoundsPoint:v9, v11];
  double v21 = v20;
  double v23 = v22;
  if ([v4 inputType] == (id)2
    && objc_msgSend(v19, "shouldBeginScribblingAtPoint:", v21, v23))
  {
    [(CRLWPEditor *)self setShouldQueueBeginScribbleMode:1];
  }
  -[CRLWPEditor setSelectionControlsForInputType:](self, "setSelectionControlsForInputType:", [v4 inputType]);
  [v15 convertNaturalPointFromUnscaledCanvas:v9, v11];
  double v25 = v24;
  double v27 = v26;
  unsigned __int8 v28 = [v15 layout];
  [v28 validate];

  unint64_t v29 = -[CRLWPEditor charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:](self, "charIndexInRep:fromPoint:allowPastBreak:isAtEndOfLine:leadingEdge:", v15, 0, 0, 0, v25, v27);
  if (!v7)
  {
    if (v29 != 0x7FFFFFFFFFFFFFFFLL
      || ([(CRLWPEditor *)self editorHelper],
          unsigned int v42 = objc_claimAutoreleasedReturnValue(),
          [v42 anchorSelection],
          long long v43 = objc_claimAutoreleasedReturnValue(),
          v43,
          v42,
          v43))
    {
      if (v6 == @"CRLWPImmediatePress")
      {
        [(CRLWPEditor *)self p_handleIndirectImmediatePressGesture:v4];
        goto LABEL_42;
      }
      if (v6 == @"CRLWPTapAndTouch" || v6 == @"CRLWPDoubleTapAndTouch")
      {
        v50 = sub_100246AC8(v4, 1, v30, v31, v32, v33, v34, v35, (uint64_t)&OBJC_PROTOCOL___CRLTapGesture);
        [(CRLWPEditor *)self p_handleTapAndTouchGesture:v50];

        goto LABEL_42;
      }
      if (v6 == @"CRLWPImmediateSingleTap"
        || v6 == @"CRLWPImmediateDoubleTap"
        && ([(CRLWPEditor *)self interactiveCanvasController],
            unint64_t v44 = objc_claimAutoreleasedReturnValue(),
            unsigned int v45 = [v44 editingDisabled],
            v44,
            v45))
      {
        [(CRLWPEditor *)self p_handleTapGestures:v4];
LABEL_42:
        [(CRLWPEditor *)self setMostRecentGestureKind:v6];
        goto LABEL_43;
      }
    }
    [(CRLWPEditor *)self setMostRecentGestureKind:v6];
LABEL_29:
    int v46 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF388);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BB95C((uint64_t)v6, v46);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF3A8);
    }
    uint64_t v47 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v47);
    }
    uint64_t v48 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) handleGesture:]");
    NSUInteger v49 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v48, v49, 2355, 0, "CRLWPEditor can't handle a gesture of kind %{public}@", v6);

    goto LABEL_40;
  }
  [(CRLWPEditor *)self setMostRecentGestureKind:v6];
  if (v6 == @"CRLWPTwoFingerPan")
  {
    [(CRLWPEditor *)self p_handleTwoFingerPanGesture:v4];
    goto LABEL_43;
  }
  if (v6 == @"CRLWPLongPress" || v6 == @"CRLWPImmediatePress")
  {
    [(CRLWPEditor *)self p_handleImmediateAndLongPressGesture:v4];
    goto LABEL_43;
  }
  if (v6 == @"CRLWPTapAndTouch" || v6 == @"CRLWPDoubleTapAndTouch")
  {
    uint64_t v48 = sub_100246AC8(v4, 1, v36, v37, v38, v39, v40, v41, (uint64_t)&OBJC_PROTOCOL___CRLTapGesture);
    [(CRLWPEditor *)self p_handleTapAndTouchGesture:v48];
LABEL_40:

    goto LABEL_43;
  }
  if (v6 != @"CRLWPImmediateSingleTap"
    && v6 != @"CRLWPSecondarySingleTap"
    && v6 != @"CRLWPImmediateDoubleTap")
  {
    if (v6 == @"CRLWPEditableTextSelectionForceGesture")
    {
      [(CRLWPEditor *)self p_handleEditableTextSelectionForceGesture:v4];
      goto LABEL_43;
    }
    goto LABEL_29;
  }
  unsigned int v51 = [v15 isPointInSelectedArea:v25, v27];
  id v52 = [v4 inputType];
  if (v6 == @"CRLWPImmediateSingleTap") {
    unsigned int v53 = v51;
  }
  else {
    unsigned int v53 = 0;
  }
  if ((v53 & v16) != 1 || !v52) {
    [(CRLWPEditor *)self p_handleTapGestures:v4];
  }
LABEL_43:
}

- (void)p_handleIndirectImmediatePressGesture:(id)a3
{
  id v48 = a3;
  id v4 = [(CRLWPEditor *)self interactiveCanvasController];
  [v48 unscaledLocationForICC:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = (objc_class *)objc_opt_class();
  double v10 = sub_10024715C(v9, v48);
  double v11 = [(CRLWPEditor *)self icc];
  [v10 initialPosition];
  [v11 convertBoundsToUnscaledPoint:];
  double v13 = v12;
  double v15 = v14;

  unsigned int v16 = [(CRLWPEditor *)self p_shiftKeyIsDownWIthGesture:v48];
  unsigned int v17 = [v48 gestureState];
  if (v17 - 3 < 2)
  {
    [(CRLWPEditor *)self p_endAutoscroll];
    BOOL v19 = [(CRLWPEditor *)self editorHelper];
    [v19 setAnchorSelection:0];
    goto LABEL_20;
  }
  if (v17 != 2)
  {
    if (v17 != 1) {
      goto LABEL_21;
    }
    unsigned int v18 = [(CRLWPEditor *)self interactiveCanvasController];
    [v18 layoutIfNeeded];

    BOOL v19 = [(CRLWPEditor *)self p_textRepAtGestureLocationForGesture:v48];
    [v19 convertNaturalPointFromUnscaledCanvas:v13, v15];
    double v21 = v20;
    double v23 = v22;
    unsigned int v24 = [v19 didPointHitSelectionEnd:];
    unsigned int v25 = v24;
    if (v16)
    {
      double v26 = [(CRLWPEditor *)self selection];
      unsigned int v27 = [v26 isValid];

      if (((v27 | v25) & 1) == 0)
      {
LABEL_6:
        [(CRLWPEditor *)self setSelectionSetFromSingleTap:1];
        -[CRLWPEditor tappedInRep:point:tapCount:isTapHold:precise:](self, "tappedInRep:point:tapCount:isTapHold:precise:", v19, 1, 1, 1, v21, v23);
        [(CRLWPEditor *)self setSelectionSetFromSingleTap:0];
        unsigned __int8 v28 = [(CRLWPEditor *)self selection];
        unint64_t v29 = [(CRLWPEditor *)self editorHelper];
        [v29 setAnchorSelection:v28];

        [(CRLWPEditor *)self setInitialPressTextSelectionGranularity:0];
LABEL_20:

        goto LABEL_21;
      }
    }
    else if ((v24 & 1) == 0)
    {
      goto LABEL_6;
    }
    uint64_t v39 = [(CRLWPEditor *)self selection];
    uint64_t v40 = (char *)[v39 range];
    unint64_t v42 = v41;

    uint64_t v38 = -[CRLWPEditor selectionFromUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:](self, "selectionFromUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:", 0, 1, 0, 0, v6, v8);
    long long v43 = [(CRLWPEditor *)self selection];
    [(CRLWPEditor *)self p_adjustSelection:v43 withOtherSelection:v38 textSelectionGranularity:0];

    unint64_t v44 = [(CRLWPEditor *)self editorHelper];
    [v44 setAnchorSelection:0];

    if ([v38 range] <= &v40[v42 >> 1]) {
      unint64_t v45 = v42;
    }
    else {
      unint64_t v45 = 0;
    }
    id v46 = [objc_alloc(-[CRLWPEditor wpSelectionClass](self, "wpSelectionClass")) initWithRange:&v40[v45]];
    uint64_t v47 = [(CRLWPEditor *)self editorHelper];
    [v47 setAnchorSelection:v46];

LABEL_19:
    goto LABEL_20;
  }
  uint64_t v30 = [(CRLWPEditor *)self interactiveCanvasController];
  uint64_t v31 = [v30 canvasView];
  uint64_t v32 = [v31 enclosingScrollView];
  unsigned int v33 = [v32 isScrollEnabled];

  if (v33) {
    +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v6, v8);
  }
  uint64_t v34 = [(CRLWPEditor *)self editorHelper];
  uint64_t v35 = [v34 anchorSelection];

  if (!v35)
  {
    uint64_t v36 = [(CRLWPEditor *)self selection];
    uint64_t v37 = [(CRLWPEditor *)self editorHelper];
    [v37 setAnchorSelection:v36];
  }
  if (sub_1000653B4(v13, v15, v6, v8) >= 3.0)
  {
    BOOL v19 = [(CRLWPEditor *)self editorHelper];
    uint64_t v38 = [v19 anchorSelection];
    -[CRLWPEditor p_adjustSelection:withUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:](self, "p_adjustSelection:withUnscaledCanvasPoint:textSelectionGranularity:isTapHold:allowPastBreak:isDragging:", v38, [(CRLWPEditor *)self initialPressTextSelectionGranularity], 1, [(CRLWPEditor *)self initialPressTextSelectionGranularity] ^ 1, 1, v6, v8);
    goto LABEL_19;
  }
LABEL_21:
}

- (void)gestureSequenceWillBegin
{
}

- (void)gestureSequenceDidEnd
{
  [(CRLWPEditor *)self setIgnoreFutureImmediatePresses:0];
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLWPEditor *)self interactiveCanvasController];
  double v5 = [v4 layerHost];
  sub_1002469D0(v3, v5);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  if ([(CRLWPEditor *)self shouldQueueBeginScribbleMode])
  {
    [v18 scribbleInteractionDidFinishWriting];
    [(CRLWPEditor *)self setShouldQueueBeginScribbleMode:0];
  }
  if ([(CRLWPEditor *)self isACurrentEditor])
  {
    double v6 = [(CRLWPEditor *)self selection];
    if (!v6) {
      goto LABEL_18;
    }
    double v7 = [(CRLWPEditor *)self mostRecentGestureKind];
    double v8 = v7;
    if (v7 == @"CRLWPImmediateSingleTap")
    {
    }
    else
    {
      double v9 = [(CRLWPEditor *)self mostRecentGestureKind];

      if (v9 != @"CRLWPImmediatePress")
      {
        double v10 = [(CRLWPEditor *)self mostRecentGestureKind];
        double v11 = v10;
        if (v10 == @"CRLWPTapAndTouch")
        {

          goto LABEL_16;
        }
        double v12 = [(CRLWPEditor *)self mostRecentGestureKind];

        if (v12 == @"CRLWPImmediateDoubleTap")
        {
LABEL_16:
          [v6 range];
          if (!v17) {
            [(CRLWPEditor *)self gestureBeganWhenEditingBegan];
          }
        }
LABEL_18:

        goto LABEL_19;
      }
    }
    id v13 = [v6 range];
    uint64_t v15 = v14;
    if (v13 == [(CRLWPEditor *)self originalSelectionRange]
      && v15 == v16
      && ![(CRLWPEditor *)self gestureBeganWhenEditingBegan])
    {
      [(CRLWPEditor *)self setShouldShowEditMenuForInsertionPoint:1];
    }
    goto LABEL_18;
  }
LABEL_19:
  [(CRLWPEditor *)self setGestureBeganWhenEditingBegan:0];
}

- (void)p_beginOperationAndTakeControl
{
  uint64_t v3 = [(CRLWPEditor *)self interactiveCanvasController];
  id v4 = [v3 dynamicOperationController];
  unsigned int v5 = [v4 isInOperation];

  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF3C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BBB18();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF3E8);
    }
    double v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_beginOperationAndTakeControl]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:2826 isFatal:0 description:"beginning WP operation in DOC when already in an operation"];
  }
  double v9 = [v3 tmCoordinator];
  [v9 registerTrackerManipulator:self];

  double v10 = [v3 tmCoordinator];
  unsigned int v11 = [v10 takeControlWithTrackerManipulator:self];

  if (v11)
  {
    double v12 = [v3 dynamicOperationController];
    [v12 beginOperation];
  }
  else
  {
    int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF408);
    }
    uint64_t v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BBA08(v14, v3, v13);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF428);
    }
    uint64_t v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_beginOperationAndTakeControl]");
    uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
    uint64_t v17 = [v3 tmCoordinator];
    id v18 = [v17 controllingTM];
    BOOL v19 = (objc_class *)objc_opt_class();
    double v20 = NSStringFromClass(v19);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v16, 2832, 0, "could not take control with WP Editing Controller. Controlling TM is %{public}@", v20);
  }
}

- (void)p_endAutoscroll
{
  uint64_t v3 = [(CRLWPEditor *)self autoscroll];
  [v3 invalidate];

  [(CRLWPEditor *)self setAutoscroll:0];
}

- (void)p_handleTapWhileMarkedTextGestureRecognizer:(id)a3
{
  id v4 = [(CRLWPEditor *)self icc];
  uint64_t v3 = [v4 textInputResponder];
  [v3 acceptAutocorrection];
}

- (void)p_handleKnobDragGestureRecognizer:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  BOOL v6 = !v4 || [v4 gestureState] == 3 || [v5 gestureState] == 4;
  [(CRLWPEditor *)self setReadyToEnd:v6];
  double v7 = [(CRLWPEditor *)self knobTracker];

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF448);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BBBA0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FF468);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditor(GestureInterfaces) p_handleKnobDragGestureRecognizer:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Gestures/CRLWPEditor+Gestures.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 2849, 0, "invalid nil value for '%{public}s'", "self.knobTracker");
  }
  if ([v5 gestureState] == 3 || objc_msgSend(v5, "gestureState") == 1)
  {
    unsigned int v11 = [(CRLWPEditor *)self knobTracker];
    [v11 setIgnoreNextCall:1];
  }
  double v12 = [(CRLWPEditor *)self icc];
  [v5 unscaledLocationForICC:v12];
  double v15 = sub_1000674F0(v13, v14);
  double v17 = v16;

  [(CRLWPEditor *)self knobToTouchOffset];
  double v19 = sub_100064698(v15, v17, v18);
  double v21 = v20;
  double v22 = [(CRLWPEditor *)self knobTracker];
  [v22 setCurrentPosition:v19, v21];

  if ([(CRLWPEditor *)self readyToEnd]) {
    [(CRLWPEditor *)self p_endAutoscroll];
  }
  else {
    +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v15, v17);
  }
  double v23 = [(CRLWPEditor *)self interactiveCanvasController];
  unsigned int v24 = [v23 dynamicOperationController];
  [v24 handleTrackerManipulator:self];
}

- (void)p_beginMagnification:(id)a3 forRep:(id)a4 atPoint:(CGPoint)a5 shouldSetSelection:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  double v10 = [(CRLWPEditor *)self interactiveCanvasController];
  [v10 convertBoundsToUnscaledPoint:x, y];
  double v12 = v11;
  double v14 = v13;

  if (v6)
  {
    -[CRLWPEditor p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:](self, "p_setSelectionFromPoint:textSelectionGranularity:includeListLabels:", 0, 1, v12, v14);
  }
}

- (void)protectedStopMagnification
{
  uint64_t v3 = [(CRLWPEditor *)self textSelectionDelegate];
  [v3 endLoupeSession];

  id v4 = [(CRLWPEditor *)self magnifier];

  if (v4)
  {
    unsigned int v5 = [(CRLWPEditor *)self interactiveCanvasController];
    [v5 layoutIfNeeded];

    BOOL v6 = [(CRLWPEditor *)self magnifier];
    [v6 stopMagnifying:1];

    [(CRLWPEditor *)self setMagnifier:0];
    [(CRLWPEditor *)self setFidgetResolver:0];
  }
}

- (void)p_protectedStopKnobTrackingGesture:(id)a3
{
  id v6 = a3;
  id v4 = [(CRLWPEditor *)self knobTracker];

  if (v4)
  {
    [(CRLWPEditor *)self p_handleKnobDragGestureRecognizer:v6];
    double y = CGPointZero.y;
    -[CRLWPEditor setAdjustedDragPoint:](self, "setAdjustedDragPoint:", CGPointZero.x, y);
    -[CRLWPEditor setAdjustedDragToNaturalPointOffset:](self, "setAdjustedDragToNaturalPointOffset:", CGPointZero.x, y);
    -[CRLWPEditor setSelectionTargetToAdjustedDragOffset:](self, "setSelectionTargetToAdjustedDragOffset:", CGPointZero.x, y);
    [(CRLWPEditor *)self setKnobTracker:0];
  }
}

- (_TtC8Freeform19CRLWPCharacterStyle)insertionStyle
{
  return (_TtC8Freeform19CRLWPCharacterStyle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____TtC8Freeform11CRLWPEditor_insertionStyle));
}

- (void)setInsertionStyle:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_insertionStyle);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_insertionStyle) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform14CRLWPShapeItem)enclosingShape
{
  return (_TtC8Freeform14CRLWPShapeItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape));
}

- (void)setEnclosingShape:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  _NSRange result = *(_TtC8Freeform12CRLWPStorage **)(*(char **)((char *)&self->super.isa
                                                      + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape)
                                           + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (_TtC8Freeform12CRLWPStorage)storageWithMarkedText
{
  v2 = self;
  sub_1008244D4();
  id v4 = v3;

  return (_TtC8Freeform12CRLWPStorage *)v4;
}

- (CRLWPTextSource)textSource
{
  _NSRange result = *(CRLWPTextSource **)(*(char **)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape)
                               + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (_TtC8Freeform11CRLWPLayout)layout
{
  v2 = self;
  id v3 = sub_1008245B4();

  return (_TtC8Freeform11CRLWPLayout *)v3;
}

- (CRLInteractiveCanvasController)icc
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CRLInteractiveCanvasController *)Strong;
}

- (void)setIcc:(id)a3
{
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CRLInteractiveCanvasController *)Strong;
}

- (BOOL)wantsDoneButtonWhenEditing
{
  return 1;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  return (_TtC8Freeform21CRLEditingCoordinator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editingCoordinator));
}

- (_TtC8Freeform11CRLWPEditor)initWithEditingCoordinator:(id)a3 enclosingShape:(id)a4 icc:(id)a5
{
  return (_TtC8Freeform11CRLWPEditor *)sub_1008246E0(a3, a4, a5);
}

- (void)textSelectionWillChange
{
  v2 = self;
  sub_100824FD8();
}

- (void)textSelectionDidChange
{
  v2 = self;
  sub_100825130();
}

- (void)textWillChange
{
  v2 = self;
  sub_100825288();
}

- (void)textDidChange
{
  v2 = self;
  sub_1008253C0();
}

- (void)willUndo
{
  v2 = self;
  sub_1008254F8();
}

- (void)didUndo
{
  v2 = self;
  sub_1008253C0();
}

- (void)documentEditabilityDidChange
{
  v2 = self;
  sub_100825634();
}

+ (BOOL)canEditTextIn:(id)a3 using:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = sub_10083E644((uint64_t)v5, v6);

  return v7 & 1;
}

- (CRLWPSelection)selection
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorController);
  id v3 = self;
  id v4 = (_TtC8Freeform11CRLWPEditor *)[v2 selectionForEditor:v3];
  if (!v4 || (v5 = v4, self, id v6 = (void *)swift_dynamicCastObjCClass(), v3, v3 = v5, !v6))
  {

    id v6 = 0;
  }

  return (CRLWPSelection *)v6;
}

- (void)setSelection:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100825870(a3);
}

- (CRLSearchReference)editingSearchReference
{
  v2 = self;
  id v3 = sub_100825A60();

  return (CRLSearchReference *)v3;
}

- (void)endEditingAndSelectParent:(id)a3
{
}

- (void)selectParent:(id)a3
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
    id v5 = self;
  }
  sub_100825CE8();

  sub_100522F00((uint64_t)v6, &qword_101672BF0);
}

- (void)endEditing
{
  memset(v3, 0, sizeof(v3));
  v2 = self;
  sub_100825CE8();
  sub_100522F00((uint64_t)v3, &qword_101672BF0);
}

- (BOOL)shouldBecomeTextInputEditor
{
  return 1;
}

- (BOOL)shouldBeginTextInputWith:(id)a3
{
  return 0;
}

- (BOOL)wantsToReceiveTextInput
{
  return 1;
}

- (BOOL)wantsVisibleKeyboard
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_wantsVisibleKeyboard);
}

- (void)setWantsVisibleKeyboard:(BOOL)a3
{
  id v4 = self;
  sub_100825FC8(a3);
}

- (BOOL)resignFirstResponderWhenKeyboardHides
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_resignFirstResponderWhenKeyboardHides);
}

- (void)setResignFirstResponderWhenKeyboardHides:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_resignFirstResponderWhenKeyboardHides) = a3;
}

- (_TtP8Freeform16CRLTextSelecting_)textSelectionDelegate
{
  v2 = self;
  sub_10083B97C();
  id v4 = v3;
  swift_unknownObjectRetain();

  return (_TtP8Freeform16CRLTextSelecting_ *)v4;
}

- (_TtC8Freeform25CRLWPTextSelectionManager)textSelectionManager
{
  v2 = self;
  sub_10083B97C();
  if (v3)
  {
    type metadata accessor for CRLWPTextSelectionManager();
    id v4 = (void *)swift_dynamicCastClass();
    if (v4) {
      swift_unknownObjectRetain();
    }
  }
  else
  {
    id v4 = 0;
  }

  return (_TtC8Freeform25CRLWPTextSelectionManager *)v4;
}

- (CRLEditorController)editorController
{
  return (CRLEditorController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorController));
}

- (void)setEditorController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorController) = (Class)a3;
  id v3 = a3;
}

- (UIInputViewController)inputAccessoryViewController
{
  id v3 = self;
  id v4 = self;
  if ((objc_msgSend(v3, "crl_padUI") & 1) != 0 || (id v5 = (char *)sub_1008264E8()) == 0)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = v5;
    id v7 = *(id *)&v5[OBJC_IVAR____TtC8Freeform51CRLiOSMiniFormatterTextEditingAccessoryStateManager_textEditingAccessoryViewController];
  }

  return (UIInputViewController *)v7;
}

- (NSArray)leadingBarButtonGroups
{
  return (NSArray *)sub_1008263B8(self, (uint64_t)a2, sub_100826388);
}

- (NSArray)trailingBarButtonGroups
{
  return (NSArray *)sub_1008263B8(self, (uint64_t)a2, sub_100826440);
}

- (BOOL)shouldSuppressMiniFormatter
{
  return 1;
}

- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = self;
  unsigned __int8 v10 = sub_10083E748(v7, v8);

  return v10 & 1;
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  return 0;
}

- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  double v14 = self;
  id v15 = sub_10083E928(a3, v12);

  return v15;
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_1008267D0(a3, v10, a5);
}

- (BOOL)selectionBeingSetFromGestures
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionBeingSetFromGestures);
}

- (void)setSelectionBeingSetFromGestures:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionBeingSetFromGestures) = a3;
}

- (void)didBecomeCurrentEditorForEditorController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10083EC00();
}

- (void)willResignCurrentEditor
{
  v2 = self;
  sub_100827134();
}

- (void)copy:(id)a3
{
}

- (BOOL)canPasteWithItemSource:(id)a3 selection:(id)a4 sender:(id)a5
{
  if (a5)
  {
    swift_unknownObjectRetain();
    id v8 = a4;
    id v9 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    swift_unknownObjectRetain();
    id v10 = a4;
    id v11 = self;
  }
  char v12 = sub_10083ED84(a3);
  swift_unknownObjectRelease();

  sub_100522F00((uint64_t)v14, &qword_101672BF0);
  return v12 & 1;
}

- (void)paste:(id)a3
{
}

- (void)pasteAsPlainText:(id)a3
{
}

- (void)pasteFromItemSource:(id)a3 forceMatchStyle:(BOOL)a4
{
  swift_unknownObjectRetain();
  id v7 = self;
  sub_100827824(a3, a4);
  swift_unknownObjectRelease();
}

- (void)pasteWithItemSource:(id)a3 selection:(id)a4 sender:(id)a5 selectRange:(int64_t)a6 dragBlock:(id)a7
{
  char v12 = (void (**)(void))_Block_copy(a7);
  if (a5)
  {
    swift_unknownObjectRetain();
    id v13 = a4;
    double v14 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    swift_unknownObjectRetain();
    id v15 = a4;
    double v16 = self;
  }
  id v17 = [a4 range:v22, v23];
  uint64_t v19 = v18;
  id v20 = objc_allocWithZone((Class)type metadata accessor for CRLTextRange());
  double v21 = (void *)sub_1006CC83C((uint64_t)v17, v19);
  sub_10083EEAC(a3, (uint64_t)&v22, v21, a6, 0);
  v12[2](v12);
  swift_unknownObjectRelease();

  sub_100522F00((uint64_t)&v22, &qword_101672BF0);
  _Block_release(v12);
}

- (void)cut:(id)a3
{
}

- (void)cutTo:(id)a3 nativeOnly:(BOOL)a4 sender:(id)a5
{
  if (a5)
  {
    id v8 = a3;
    id v9 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    id v10 = a3;
    id v11 = self;
  }
  sub_100828CCC((uint64_t)a3, a4);

  sub_100522F00((uint64_t)v12, &qword_101672BF0);
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
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
    id v7 = self;
  }
  int64_t v8 = sub_100829140((uint64_t)a3);

  sub_100522F00((uint64_t)v10, &qword_101672BF0);
  return v8;
}

- (void)makeBaseWritingDirectionLeftToRight:(id)a3
{
}

- (void)makeBaseWritingDirectionRightToLeft:(id)a3
{
}

- (void)makeBaseWritingDirectionNatural:(id)a3
{
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
}

- (BOOL)canMutateTextStorage
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = (void *)Strong;
    id v5 = self;
    unsigned int v6 = [v4 editingDisabled];

    if (!v6)
    {
      char v8 = *((unsigned char *)&v5->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_disallowEditingOfTextString);

      char v7 = v8 ^ 1;
      return v7 & 1;
    }
  }
  char v7 = 0;
  return v7 & 1;
}

- (CRLWPEditorHelper)editorHelper
{
  return (CRLWPEditorHelper *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorHelper));
}

- (void)setEditorHelper:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorHelper);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorHelper) = (Class)a3;
  id v3 = a3;
}

- (void)moveDownAndModifySelection:(id)a3
{
}

- (void)moveUpAndModifySelection:(id)a3
{
}

- (void)moveRightAndModifySelection:(id)a3
{
}

- (void)moveLeftAndModifySelection:(id)a3
{
}

- (id)cursorAtPoint:(CGPoint)a3 withCursorPlatformObject:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  char v8 = self;
  id v9 = sub_10082A6C8((uint64_t)v7, x, y);

  return v9;
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  id v5 = a3;
  unsigned int v6 = self;
  sub_10083F690(v5);
}

- (void)selectMenuAction:(id)a3
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
    long long v6 = 0u;
    long long v7 = 0u;
    id v5 = self;
  }
  [*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editorHelper) selectWordWithFlags:16 v6, v7];

  sub_100522F00((uint64_t)&v6, &qword_101672BF0);
}

- (void)selectAll
{
  v2 = self;
  sub_10082B428();
}

- (void)selectAllMenuAction:(id)a3
{
}

- (void)toggleBaseWritingDirection:(id)a3
{
}

- (void)replaceAction:(id)a3
{
}

- (void)lookUp:(id)a3
{
  if (!a3)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    char v8 = self;
    sub_10083B97C();
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v4 = self;
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10083B97C();
  if (v5)
  {
LABEL_3:
    id v6 = [v5 selectedRange:v9, v10];
    sub_10082B8AC((uint64_t)v6, v7);
  }
LABEL_4:

  sub_100522F00((uint64_t)&v9, &qword_101672BF0);
}

- (void)lookUpTextAtRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = self;
  sub_10082B8AC(location, length);
}

- (void)translate:(id)a3
{
}

- (void)copyStyle:(id)a3
{
}

- (void)pasteStyle:(id)a3
{
}

- (void)deleteBackward:(id)a3
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
    long long v6 = 0u;
    long long v7 = 0u;
    id v5 = self;
  }
  [(CRLWPEditor *)self deleteCurrentSelection];

  sub_100522F00((uint64_t)&v6, &qword_101672BF0);
}

- (void)deleteForward:(id)a3
{
}

- (BOOL)wantsToInterceptDeleteEvents
{
  return 0;
}

- (void)increaseFontSizeByOne:(id)a3
{
}

- (void)decreaseFontSizeByOne:(id)a3
{
}

- (void)toggleBoldface:(id)a3
{
}

- (void)toggleItalics:(id)a3
{
}

- (void)toggleUnderline:(id)a3
{
}

- (void)toggleStrikethrough:(id)a3
{
}

- (void)alignLeft:(id)a3
{
}

- (void)alignRight:(id)a3
{
}

- (void)alignCenter:(id)a3
{
}

- (void)alignJustified:(id)a3
{
}

- (void)alignTop:(id)a3
{
}

- (void)alignBottom:(id)a3
{
}

- (void)alignMiddle:(id)a3
{
}

- (void)alignJustify:(id)a3
{
}

- (void)showEditMenu
{
  v2 = self;
  sub_10082F898();
}

- (CGRect)targetRectForEditMenu
{
  v2 = self;
  double v3 = sub_10083000C();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (void)hideEditMenu
{
  v2 = self;
  sub_10083014C();
}

- (BOOL)acceptAutoCorrectionBefore:(id)a3
{
  return 0;
}

- (id)dictationAndAutocorrectionsFor:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  double v6 = self;
  swift_retain();
  sub_1007ACF04((char *)a3);
  uint64_t v8 = v7;
  NSUInteger v10 = v9;
  NSUInteger v12 = v11;
  swift_release();
  if (v8)
  {
    if (a4)
    {
      a4->NSUInteger location = v10;
      a4->NSUInteger length = v12;
    }

    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v13 = 0;
  }

  return v13;
}

- (id)autocorrectionRangesToDisplayInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double v5 = self;
  id v6 = sub_100830554(location, length);

  return v6;
}

- (void)removeHyperlink:(id)a3
{
}

- (void)toggleListEntry:(id)a3
{
  if (a3)
  {
    double v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    double v5 = self;
  }
  swift_getKeyPath();
  sub_10083242C();
  __int16 v7 = v6;
  swift_release();
  if ((_BYTE)v7) {
    BOOL v8 = (v7 & 0xFF00) == 512;
  }
  else {
    BOOL v8 = 1;
  }
  char v9 = v8;
  sub_1008311B8(v9);

  sub_100522F00((uint64_t)v10, &qword_101672BF0);
}

- (BOOL)canSetWritingDirection:(int64_t)a3
{
  double v4 = self;
  sub_100831824(a3);
  LOBYTE(a3) = v5;

  return a3 & 1;
}

- (int64_t)baseWritingDirectionFor:(id)a3
{
  id v4 = a3;
  char v5 = self;
  sub_1008319FC((uint64_t)v4);
  int64_t v7 = v6;

  return v7;
}

- (void)setBaseWritingDirection:(int64_t)a3 forParagraphsWithRange:(id)a4
{
  int64_t v6 = (char *)a4;
  int64_t v7 = self;
  sub_100831BF0(a3, v6);
}

- (CRLCanvasAutoscroll)autoscroll
{
  return (CRLCanvasAutoscroll *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform11CRLWPEditor_autoscroll));
}

- (void)setAutoscroll:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_autoscroll);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_autoscroll) = (Class)a3;
  id v3 = a3;
}

- (double)lastKeyDownTime
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_lastKeyDownTime);
}

- (void)setLastKeyDownTime:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_lastKeyDownTime) = a3;
}

- (BOOL)isUserTypingAhead
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isUserTypingAhead);
}

- (void)setIsUserTypingAhead:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isUserTypingAhead) = a3;
}

- (BOOL)shouldShowSelectionAndCaret
{
  return 1;
}

- (BOOL)wantsCaret
{
  return 1;
}

- (BOOL)suppressBreaks
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_suppressBreaks);
}

- (void)setSuppressBreaks:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_suppressBreaks) = a3;
}

- (BOOL)suppressTabs
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_suppressTabs);
}

- (void)setSuppressTabs:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_suppressTabs) = a3;
}

- (BOOL)editableTextSelectionForceGestureInProgress
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editableTextSelectionForceGestureInProgress);
}

- (void)setEditableTextSelectionForceGestureInProgress:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_editableTextSelectionForceGestureInProgress) = a3;
}

- (BOOL)initialPressTextSelectionGranularity
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_initialPressTextSelectionGranularity);
}

- (void)setInitialPressTextSelectionGranularity:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_initialPressTextSelectionGranularity) = a3;
}

- (BOOL)selectionSetFromSingleTap
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionSetFromSingleTap);
}

- (void)setSelectionSetFromSingleTap:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionSetFromSingleTap) = a3;
}

- (NSObject)listDragAnimator
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8Freeform11CRLWPEditor_listDragAnimator));
}

- (void)setListDragAnimator:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_listDragAnimator);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_listDragAnimator) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isBecomingActive
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isBecomingActive);
}

- (void)setIsBecomingActive:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isBecomingActive) = a3;
}

- (void)commitMarkedTextWithoutModifyingStorage
{
  v2 = self;
  sub_100832D30();
}

- (void)commitMarkedText
{
  v2 = self;
  sub_100832E80();
}

- (void)abortMarkedText
{
  v2 = self;
  sub_100833210();
}

- (void)willResignTextInputEditor
{
  v2 = self;
  sub_100833300();
}

- (void)didResignTextInputEditor
{
  v2 = self;
  sub_100833454();
}

- (void)didBecomeTextInputEditor
{
  v2 = self;
  sub_100833868();
}

- (BOOL)shouldPreventQuickSelect
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldPreventQuickSelect);
}

- (void)setShouldPreventQuickSelect:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldPreventQuickSelect) = a3;
}

- (BOOL)gestureBeganWhenEditingBegan
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_gestureBeganWhenEditingBegan);
}

- (void)setGestureBeganWhenEditingBegan:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_gestureBeganWhenEditingBegan) = a3;
}

- (BOOL)readyToEnd
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_readyToEnd);
}

- (void)setReadyToEnd:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_readyToEnd) = a3;
}

- (BOOL)shouldQueueBeginScribbleMode
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldQueueBeginScribbleMode);
}

- (void)setShouldQueueBeginScribbleMode:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldQueueBeginScribbleMode) = a3;
}

- (BOOL)suppressEditMenuForIndirectGesture
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_suppressEditMenuForIndirectGesture);
}

- (void)setSuppressEditMenuForIndirectGesture:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_suppressEditMenuForIndirectGesture) = a3;
}

- (NSString)mostRecentGestureKind
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8Freeform11CRLWPEditor_mostRecentGestureKind));
}

- (void)setMostRecentGestureKind:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_mostRecentGestureKind);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_mostRecentGestureKind) = (Class)a3;
  id v3 = a3;
}

- (CRLFidgetResolver)fidgetResolver
{
  return (CRLFidgetResolver *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform11CRLWPEditor_fidgetResolver));
}

- (void)setFidgetResolver:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_fidgetResolver);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_fidgetResolver) = (Class)a3;
  id v3 = a3;
}

- (BOOL)shouldShowEditMenuForInsertionPoint
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldShowEditMenuForInsertionPoint);
}

- (void)setShouldShowEditMenuForInsertionPoint:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldShowEditMenuForInsertionPoint) = a3;
}

- (BOOL)coalescingText
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_coalescingText);
}

- (void)setCoalescingText:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_coalescingText) = a3;
}

- (NSMutableDictionary)dictationInterpretations
{
  return (NSMutableDictionary *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dictationInterpretations));
}

- (void)setDictationInterpretations:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dictationInterpretations);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dictationInterpretations) = (Class)a3;
  id v3 = a3;
}

- (BOOL)ignoreFutureImmediatePresses
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_ignoreFutureImmediatePresses);
}

- (void)setIgnoreFutureImmediatePresses:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_ignoreFutureImmediatePresses) = a3;
}

- (BOOL)isSelectionPlaceHolderTextWithSelection:(id)a3
{
  return 0;
}

- (NSDictionary)tapInfo
{
  return (NSDictionary *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR____TtC8Freeform11CRLWPEditor_tapInfo));
}

- (void)setTapInfo:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_tapInfo);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_tapInfo) = (Class)a3;
  id v3 = a3;
}

- (BOOL)shouldUseModernTextGestures
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldUseModernTextGestures);
}

- (void)setShouldUseModernTextGestures:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_shouldUseModernTextGestures) = a3;
}

- (CRLWPTextMagnifier)magnifier
{
  v2 = (void *)swift_unknownObjectRetain();

  return (CRLWPTextMagnifier *)v2;
}

- (void)setMagnifier:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_magnifier) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (CGPoint)knobTrackingDragPoint
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTrackingDragPoint);
  double v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTrackingDragPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setKnobTrackingDragPoint:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTrackingDragPoint) = a3;
}

- (CGPoint)firstTapUnscaledPoint
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_firstTapUnscaledPoint);
  double v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_firstTapUnscaledPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setFirstTapUnscaledPoint:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_firstTapUnscaledPoint) = a3;
}

- (BOOL)knobTracking
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTracking);
}

- (void)setKnobTracking:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTracking) = a3;
}

- (CRLWPTextKnobTracker)knobTracker
{
  return (CRLWPTextKnobTracker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTracker));
}

- (void)setKnobTracker:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTracker);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTracker) = (Class)a3;
  id v3 = a3;
}

- (unint64_t)knobTag
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTag);
}

- (void)setKnobTag:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTag) = (Class)a3;
}

- (int64_t)knobTrackingTapCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTrackingTapCount);
}

- (void)setKnobTrackingTapCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobTrackingTapCount) = (Class)a3;
}

- (BOOL)wantsParagraphMode
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_wantsParagraphMode);
}

- (void)setWantsParagraphMode:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_wantsParagraphMode) = a3;
}

- (BOOL)editMenuIsVisible
{
  double v2 = self;
  id v3 = sub_10082F778();
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)&v3[OBJC_IVAR____TtC8Freeform23CRLWPEditMenuController_selectionPath];

    return v5 != 0;
  }
  else
  {

    return 0;
  }
}

- (_NSRange)originalSelectionRange
{
  double v2 = (char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_originalSelectionRange;
  NSUInteger v3 = *(NSUInteger *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_originalSelectionRange);
  NSUInteger v4 = *((void *)v2 + 1);
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (void)setOriginalSelectionRange:(_NSRange)a3
{
  *(_NSRange *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_originalSelectionRange) = a3;
}

- (CGPoint)knobToTouchOffset
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobToTouchOffset);
  double v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobToTouchOffset];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setKnobToTouchOffset:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_knobToTouchOffset) = a3;
}

- (BOOL)wantsParagraphModeWithSelection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  if ([v4 isValid])
  {
    char v6 = *((unsigned char *)&v5->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_wantsParagraphMode);

    if (v6) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (NSSet)editingReps
{
  double v2 = self;
  sub_10083418C();

  sub_10050BF48(0, (unint64_t *)&qword_101678790);
  sub_10055A7A4();
  v3.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v3.super.isa;
}

- (BOOL)twoFingerPanGestureInProgress
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_twoFingerPanGestureInProgress);
}

- (void)setTwoFingerPanGestureInProgress:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_twoFingerPanGestureInProgress) = a3;
}

- (BOOL)canIgnoreEvent
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_canIgnoreEvent);
}

- (void)setCanIgnoreEvent:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_canIgnoreEvent) = a3;
}

- (BOOL)isSelectingCaret
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isSelectingCaret);
}

- (void)setIsSelectingCaret:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isSelectingCaret) = a3;
}

- (_NSRange)selectedRangeAtPinchAndHalfStart
{
  double v2 = (char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectedRangeAtPinchAndHalfStart;
  NSUInteger v3 = *(NSUInteger *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectedRangeAtPinchAndHalfStart);
  NSUInteger v4 = *((void *)v2 + 1);
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (void)setSelectedRangeAtPinchAndHalfStart:(_NSRange)a3
{
  *(_NSRange *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectedRangeAtPinchAndHalfStart) = a3;
}

- (_NSRange)expectedWordSelectionAtPoint
{
  double v2 = (char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_expectedWordSelectionAtPoint;
  NSUInteger v3 = *(NSUInteger *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_expectedWordSelectionAtPoint);
  NSUInteger v4 = *((void *)v2 + 1);
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (void)setExpectedWordSelectionAtPoint:(_NSRange)a3
{
  *(_NSRange *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_expectedWordSelectionAtPoint) = a3;
}

- (BOOL)gestureIsSuppressingKnobs
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_gestureIsSuppressingKnobs);
}

- (void)setGestureIsSuppressingKnobs:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_gestureIsSuppressingKnobs) = a3;
}

- (BOOL)pinchAndHalfDidStart
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_pinchAndHalfDidStart);
}

- (void)setPinchAndHalfDidStart:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_pinchAndHalfDidStart) = a3;
}

- (NSDate)lastSingleImmediateTapTime
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  int64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v8 = (char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_lastSingleImmediateTapTime;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v8, v3);
  v9.super.isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return (NSDate *)v9.super.isa;
}

- (void)setLastSingleImmediateTapTime:(id)a3
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  BOOL v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  NSDate v9 = (char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_lastSingleImmediateTapTime;
  swift_beginAccess();
  NSUInteger v10 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v11 = self;
  v10(v9, v8, v4);
  swift_endAccess();
}

- (CGPoint)adjustedDragPoint
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_adjustedDragPoint);
  double v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_adjustedDragPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setAdjustedDragPoint:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_adjustedDragPoint) = a3;
}

- (CGPoint)adjustedDragToNaturalPointOffset
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_adjustedDragToNaturalPointOffset);
  double v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_adjustedDragToNaturalPointOffset];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setAdjustedDragToNaturalPointOffset:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_adjustedDragToNaturalPointOffset) = a3;
}

- (CGRect)textFieldBounds
{
  double v2 = sub_100834640((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform11CRLWPEditor_textFieldBounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setTextFieldBounds:(CGRect)a3
{
}

- (BOOL)selectionRangeDidChange
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionRangeDidChange);
}

- (void)setSelectionRangeDidChange:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionRangeDidChange) = a3;
}

- (CGPoint)selectionTargetToAdjustedDragOffset
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionTargetToAdjustedDragOffset);
  double v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionTargetToAdjustedDragOffset];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setSelectionTargetToAdjustedDragOffset:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_selectionTargetToAdjustedDragOffset) = a3;
}

- (CGRect)currentTargetPinRect
{
  double v2 = sub_100834640((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform11CRLWPEditor_currentTargetPinRect);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setCurrentTargetPinRect:(CGRect)a3
{
}

- (CGRect)currentStationaryPinRect
{
  double v2 = sub_100834640((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform11CRLWPEditor_currentStationaryPinRect);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setCurrentStationaryPinRect:(CGRect)a3
{
}

- (CGPoint)currentKnobPoint
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_currentKnobPoint);
  double v3 = *(double *)&self->insertionStyle[OBJC_IVAR____TtC8Freeform11CRLWPEditor_currentKnobPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setCurrentKnobPoint:(CGPoint)a3
{
  *(CGPoint *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_currentKnobPoint) = a3;
}

- (CRLWPRep)editingRep
{
  double v2 = self;
  double v3 = sub_1008346E0();

  return (CRLWPRep *)v3;
}

- (BOOL)preventSelectionChanges
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_preventSelectionChanges);
}

- (void)setPreventSelectionChanges:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_preventSelectionChanges) = a3;
}

- (CGPoint)clampUnscaledPointToTextFieldBounds:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  double v6 = sub_1008348C0(x, y);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)getCenterOfWord:(id)a3
{
  id v4 = a3;
  double v5 = self;
  double v6 = sub_1008349C8(v4);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (BOOL)disallowEditingOfTextString
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_disallowEditingOfTextString);
}

- (void)setDisallowEditingOfTextString:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_disallowEditingOfTextString) = a3;
}

- (BOOL)isDragAndDropBeginning
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isDragAndDropBeginning);
}

- (void)setIsDragAndDropBeginning:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_isDragAndDropBeginning) = a3;
}

- (CRLWPRep)dragRep
{
  return (CRLWPRep *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dragRep));
}

- (void)setDragRep:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dragRep);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dragRep) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform11CRLWPEditor)init
{
  CGPoint result = (_TtC8Freeform11CRLWPEditor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();

  sub_100522AD8(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC8Freeform11CRLWPEditor____lazy_storage___textEditingInputAccessoryStateManager));

  sub_100522AD8(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor____lazy_storage___editMenu));
  swift_release();

  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC8Freeform11CRLWPEditor_lastSingleImmediateTapTime;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  double v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_dragRep);
}

- (void)moveRight:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    double v5 = self;
  }
  if (qword_10166EE60 != -1) {
    swift_once();
  }
  id v6 = (id)qword_10171A478;
  sub_10083506C((uint64_t)self, (uint64_t)v7);

  sub_100522F00((uint64_t)v7, &qword_101672BF0);
}

- (void)moveLeft:(id)a3
{
}

- (void)moveForward:(id)a3
{
}

- (void)moveBackward:(id)a3
{
}

- (void)moveUp:(id)a3
{
}

- (void)moveDown:(id)a3
{
}

- (_NSRange)availableSelectionRangeForCharIndex:(int64_t)a3
{
  id v3 = self;
  sub_1008416B8();
  NSUInteger v5 = v4;
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (BOOL)hasText
{
  double v2 = self;
  sub_100837B84();
  char v4 = v3;

  return v4 & 1;
}

- (NSArray)validAttributesForMarkedText
{
  sub_10084178C();
  type metadata accessor for Key(0);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)insertText:(id)a3
{
  swift_unknownObjectRetain();
  char v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (qword_10166EE60 != -1) {
    swift_once();
  }
  id v5 = (id)qword_10171A478;
  sub_100837E48((uint64_t)v6, (char *)v4);

  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v6);
}

- (void)deleteCurrentSelection
{
  NSArray v2 = self;
  sub_1008380D4();
}

- (void)replace:(id)a3 with:(id)a4
{
  NSUInteger v6 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a3;
  double v10 = self;
  sub_100838248(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)indentParagraphLevel:(id)a3
{
}

- (void)outdentParagraphLevel:(id)a3
{
}

- (void)increaseSize:(id)a3
{
}

- (void)decreaseSize:(id)a3
{
}

- (NSAttributedString)markedText
{
  uint64_t v2 = qword_10166EE60;
  _NSRange result = self;
  char v4 = result;
  if (v2 != -1) {
    _NSRange result = (NSAttributedString *)swift_once();
  }
  uint64_t v5 = *(void *)(*(char **)((char *)&v4->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape)
                 + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (v5)
  {
    NSUInteger v6 = (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)(v5
                                                                       + OBJC_IVAR____TtC8Freeform12CRLWPStorage_attributedMarkedText));

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_NSRange)markedRange
{
  uint64_t v2 = self;
  sub_100839140();
  NSUInteger v4 = v3;
  NSUInteger v6 = v5;

  NSUInteger v7 = v4;
  NSUInteger v8 = v6;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (void)clearMarkedRange
{
  uint64_t v2 = self;
  sub_1008392D8();
}

- (_TtC8Freeform12CRLTextRange)markedTextRange
{
  uint64_t v2 = self;
  NSUInteger v3 = (void *)sub_100839444();

  return (_TtC8Freeform12CRLTextRange *)v3;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4 replacementRange:(_NSRange)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a3)
  {
    NSUInteger v8 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v9 = self;
  }
  sub_100839594((uint64_t)v10, location, length);

  sub_100522F00((uint64_t)v10, &qword_101672BF0);
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  double v10 = self;
  sub_100839A3C(v7, v9, location, length);

  swift_bridgeObjectRelease();
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  uint64_t v9 = self;
  sub_100839CBC(a3, location, length);
}

- (id)attributedSubstringForProposedRange:(_NSRange)a3 actualRange:(_NSRange *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v7 = qword_10166EE60;
  id v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  id v9 = (id)qword_10171A478;
  sub_10083A314(location, length, (uint64_t)v8, a4, &v12);

  id v10 = v12;

  return v10;
}

- (void)unmarkText
{
  uint64_t v2 = self;
  sub_10083A548();
}

- (NSDictionary)markedTextStyle
{
  uint64_t v2 = *(void *)(*(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform11CRLWPEditor_enclosingShape)
                 + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (v2)
  {
    if (*(void *)(v2 + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextStyle))
    {
      type metadata accessor for Key(0);
      sub_100842BF8((unint64_t *)&qword_1016837E0, type metadata accessor for Key);
      swift_bridgeObjectRetain();
      v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      v3.super.isa = 0;
    }
    return (NSDictionary *)v3.super.isa;
  }
  else
  {
    __break(1u);
  }
  return self;
}

- (void)setMarkedTextStyle:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for Key(0);
    sub_100842BF8((unint64_t *)&qword_1016837E0, type metadata accessor for Key);
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  NSUInteger v5 = self;
  sub_10083A9DC(v3);
}

- (id)commandForReplacingTextInRange:(id)a3 withText:(id)a4
{
  NSUInteger v6 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  id v11 = sub_10083B078((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();

  return v11;
}

- (id)commandForReplacingTextInRange:(id)a3 withAttributedText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = sub_10083B3AC((uint64_t)v6, v7);

  return v9;
}

- (void)insertBacktab:(id)a3
{
}

- (void)insertLineBreak:(id)a3
{
  if (a3)
  {
    NSUInteger v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    NSUInteger v5 = self;
  }
  NSString v6 = String._bridgeToObjectiveC()();
  [(CRLWPEditor *)self insertText:v6];

  sub_10052E2B0((uint64_t)v7);
}

- (void)insertNewline:(id)a3
{
}

- (void)insertTab:(id)a3
{
}

- (void)deleteToBeginningOfLine:(id)a3
{
}

- (void)deleteWordForward:(id)a3
{
  if (a3)
  {
    NSUInteger v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    NSUInteger v5 = self;
  }
  sub_100BD3898();

  sub_10052E2B0((uint64_t)v6);
}

- (void)deleteWordBackward:(id)a3
{
}

- (void)complete:(id)a3
{
}

- (void)transpose:(id)a3
{
}

- (void)transposeWords:(id)a3
{
}

- (void)capitalizeWord:(id)a3
{
}

- (void)lowercaseWord:(id)a3
{
}

- (void)uppercaseWord:(id)a3
{
}

- (void)moveToBeginningOfDocument:(id)a3
{
}

- (void)moveToBeginningOfDocumentAndModifySelection:(id)a3
{
}

- (void)moveToEndOfDocument:(id)a3
{
}

- (void)moveToEndOfDocumentAndModifySelection:(id)a3
{
}

- (void)moveParagraphForward:(id)a3
{
}

- (void)moveParagraphForwardAndModifySelection:(id)a3
{
}

- (void)moveParagraphBackward:(id)a3
{
}

- (void)moveParagraphBackwardAndModifySelection:(id)a3
{
}

- (void)moveToBeginningOfParagraph:(id)a3
{
}

- (void)moveToBeginningOfParagraphAndModifySelection:(id)a3
{
}

- (void)moveToEndOfParagraph:(id)a3
{
}

- (void)moveToEndOfParagraphAndModifySelection:(id)a3
{
}

- (void)moveToLeftEndOfLine:(id)a3
{
}

- (void)moveToLeftEndOfLineAndModifySelection:(id)a3
{
}

- (void)moveToRightEndOfLine:(id)a3
{
}

- (void)moveToRightEndOfLineAndModifySelection:(id)a3
{
}

- (void)moveToBeginningOfLine:(id)a3
{
}

- (void)moveToBeginningOfLineAndModifySelection:(id)a3
{
}

- (void)moveToEndOfLine:(id)a3
{
}

- (void)moveToEndOfLineAndModifySelection:(id)a3
{
}

- (void)moveWordForward:(id)a3
{
}

- (void)moveWordBackward:(id)a3
{
}

- (void)moveWordForwardAndModifySelection:(id)a3
{
}

- (void)moveWordBackwardAndModifySelection:(id)a3
{
}

- (void)moveWordLeft:(id)a3
{
}

- (void)moveWordRight:(id)a3
{
}

- (void)moveWordLeftAndModifySelection:(id)a3
{
}

- (void)moveWordRightAndModifySelection:(id)a3
{
}

- (void)selectAll:(id)a3
{
}

- (void)selectLine:(id)a3
{
}

- (void)selectWord:(id)a3
{
}

- (void)selectParagraph:(id)a3
{
}

- (void)setMark:(id)a3
{
}

- (void)selectToMark:(id)a3
{
}

- (void)deleteToMark:(id)a3
{
}

- (void)swapWithMark:(id)a3
{
}

- (BOOL)handlesSpacebar
{
  return 0;
}

- (uint64_t)escapePressed:(uint64_t)a3
{
  if (a3)
  {
    id v3 = a1;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  return sub_10052E2B0((uint64_t)v5);
}

- (BOOL)wantsRawArrowKeyEvents
{
  return 0;
}

- (void)arrowKeyReceivedInDirection:(unint64_t)a3 withModifierKeys:(id)a4
{
  id v6 = a4;
  id v7 = self;
  sub_100BD4C24(a3);
}

@end