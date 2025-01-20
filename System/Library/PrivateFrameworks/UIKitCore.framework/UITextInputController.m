@interface UITextInputController
+ (BOOL)_shouldUseStandardTextScaling:(id)a3;
- (BOOL)_canHandleResponderAction:(SEL)a3;
- (BOOL)_delegateShouldChangeTextInRange:(_NSRange)a3 replacementText:(id)a4;
- (BOOL)_hasDictationPlaceholder;
- (BOOL)_hasMarkedText;
- (BOOL)_hasMarkedTextOrRangedSelection;
- (BOOL)_isDisplayingLookupViewController;
- (BOOL)_isDisplayingReferenceLibraryViewController;
- (BOOL)_isDisplayingShareViewController;
- (BOOL)_isDisplayingShortcutViewController;
- (BOOL)_isDisplayingTextService;
- (BOOL)_isEmptySelection;
- (BOOL)_isInlineCompletionPresentedAsMarkedText:(id)a3;
- (BOOL)_isSecureTextEntry;
- (BOOL)_isSystemAttachment:(id)a3;
- (BOOL)_mightHaveSelection;
- (BOOL)_pasteFromPasteboard:(id)a3 andMatchStyle:(BOOL)a4;
- (BOOL)_range:(id)a3 containsRange:(id)a4;
- (BOOL)_range:(id)a3 intersectsRange:(id)a4;
- (BOOL)_range:(id)a3 isEqualToRange:(id)a4;
- (BOOL)_selectionAtDocumentEnd;
- (BOOL)_selectionAtDocumentStart;
- (BOOL)_selectionAtWordStart;
- (BOOL)_shouldConsiderTextViewForGeometry:(id)a3;
- (BOOL)_shouldHandleResponderAction:(SEL)a3 withSender:(id)a4;
- (BOOL)_shouldPerformUICalloutBarButtonReplaceAction:(SEL)a3 forText:(id)a4 checkAutocorrection:(BOOL)a5;
- (BOOL)_undoRedoInProgress;
- (BOOL)_usesAsynchronousProtocol;
- (BOOL)allowsEditingTextAttributes;
- (BOOL)continuousSpellCheckingEnabled;
- (BOOL)dontRemoveAllActions;
- (BOOL)hasText;
- (BOOL)isCoalescing;
- (BOOL)isEditable;
- (BOOL)isEditing;
- (BOOL)isWritingToolsStreamingReplacements;
- (BOOL)markedTextFromClient:(id)a3;
- (BOOL)performFinalGrammarChecking;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldStartNewUndoGroup:(id)a3 textGranularity:(int64_t)a4 operationType:(int)a5;
- (BOOL)shouldStartUndoGroup;
- (BOOL)supportLetterByLetterUndo;
- (BOOL)supportsAdaptiveImageGlyph;
- (BOOL)supportsTextKit2TextLists;
- (CGRect)_caretRect;
- (CGRect)_caretRectForOffset:(unint64_t)a3;
- (CGRect)_selectionClipRect;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)firstRectForRange:(id)a3;
- (CGRect)frameForTextPlaceholder:(id)a3;
- (NSAttributedString)filteredAttributedText;
- (NSDictionary)_emptyStringAttributes;
- (NSDictionary)markedTextStyle;
- (NSDictionary)typingAttributes;
- (NSSet)_allowedTypingAttributes;
- (UITextInputController)initWithTextLayoutController:(id)a3;
- (UITextInputControllerDelegate)delegate;
- (UITextInputDelegate)inputDelegate;
- (UITextInputSuggestionDelegate)textInputSuggestionDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextInteractionAssistant)interactionAssistant;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)previousSelectedTextRange;
- (UITextRange)selectedTextRange;
- (_NSRange)_nsrangeForTextRange:(id)a3;
- (_NSRange)_rangeAfterCancelDictationIfNecessaryForChangeInRange:(_NSRange)a3;
- (_NSRange)_rangeForBackwardsDelete;
- (_NSRange)_rangeToReplaceWhenInsertingText;
- (_NSRange)_selectedNSRange;
- (_NSRange)_selectedRange;
- (_NSRange)_selectedRangeWithinMarkedText;
- (_NSRange)markedRange;
- (_NSRange)nsRangeForTextRange:(id)a3;
- (_NSRange)selectedRange;
- (_UITextLayoutController)textLayoutController;
- (id)_attributedStringForInsertionOfAttributedString:(id)a3;
- (id)_attributesForInsertionOfText:(_NSRange)a3;
- (id)_attributesForReplacementInRange:(_NSRange)a3;
- (id)_characterPositionForPoint:(CGPoint)a3;
- (id)_clampedpositionFromPosition:(id)a3 offset:(int)a4;
- (id)_fallbackFont;
- (id)_findBoundaryPositionClosestToPosition:(id)a3 withGranularity:(int64_t)a4;
- (id)_findDocumentBoundaryFromPosition:(id)a3;
- (id)_findPleasingWordBoundaryFromPosition:(id)a3;
- (id)_firstTextView;
- (id)_fixupTypingAttributeForAttributes:(id)a3;
- (id)_fontForCaretSelection;
- (id)_fullRange;
- (id)_fullText;
- (id)_intersectionOfRange:(id)a3 andRange:(id)a4;
- (id)_itemProviderForCopyingRange:(_NSRange)a3;
- (id)_moveDown:(BOOL)a3 withHistory:(id)a4;
- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4;
- (id)_moveRight:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4;
- (id)_moveUp:(BOOL)a3 withHistory:(id)a4;
- (id)_newAttributedStringForInsertionOfAttributedText:(id)a3 inRange:(_NSRange)a4;
- (id)_newAttributedStringForInsertionOfText:(id)a3 inRange:(_NSRange)a4;
- (id)_newAttributedStringForReplacementOfAnnotatedText:(id)a3 inRange:(_NSRange)a4;
- (id)_normalizedStringForRangeComparison:(id)a3;
- (id)_parentScrollView;
- (id)_pasteController;
- (id)_positionAtStartOfWords:(unint64_t)a3 beforePosition:(id)a4;
- (id)_positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5 withAffinityDownstream:(BOOL)a6;
- (id)_positionFromPosition:(id)a3 pastTextUnit:(int64_t)a4 inDirection:(int64_t)a5;
- (id)_positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)_postfixTokensForDictationAttributedText:(id)a3 currentDictationAttributedTextRange:(_NSRange)a4 nextDictationAttributedTextRange:(_NSRange)a5;
- (id)_prefixTokensForDictationAttributedText:(id)a3 lastDictationAttributedTextRange:(_NSRange)a4 currentDictationAttributedTextRange:(_NSRange)a5;
- (id)_rangeFromCurrentRangeWithDelta:(_NSRange)a3;
- (id)_rangeOfEnclosingWord:(id)a3;
- (id)_rangeOfLineEnclosingPosition:(id)a3;
- (id)_rangeOfParagraphEnclosingPosition:(id)a3;
- (id)_rangeOfSentenceEnclosingPosition:(id)a3;
- (id)_rangeOfSmartSelectionIncludingRange:(id)a3;
- (id)_rangeOfText:(id)a3 endingAtPosition:(id)a4;
- (id)_rangeOfTextUnit:(int64_t)a3 enclosingPosition:(id)a4;
- (id)_rangeSpanningTextUnit:(int64_t)a3 andPosition:(id)a4;
- (id)_rectsForRange:(_NSRange)a3;
- (id)_replaceRange:(id)a3 withAttributedTextFromKeyboard:(id)a4 addingUnderlinesForAlternatives:(BOOL)a5 updatingSelection:(BOOL)a6;
- (id)_selectedAttributedText;
- (id)_selectedText;
- (id)_senderForDelegateNotifications;
- (id)_setHistory:(id)a3 withExtending:(BOOL)a4 withAnchor:(int)a5 withAffinityDownstream:(BOOL)a6;
- (id)_setSelectionRangeWithHistory:(id)a3;
- (id)_textColorForCaretSelection;
- (id)_textInputTraits;
- (id)_textRangeFromNSRange:(_NSRange)a3;
- (id)_textStorage;
- (id)_underlineRectsByDocumentLineForSelectionRange:(id)a3;
- (id)_userEditedTextInfo;
- (id)_wordContainingCaretSelection;
- (id)annotatedSubstringForRange:(id)a3;
- (id)attributedSubstringForMarkedRange;
- (id)attributedTextInRange:(id)a3;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)dictationLanguageForSelectedText;
- (id)handleInsertedText:(id)a3 intoTextStorage:(id)a4 replacementRange:(_NSRange)a5 updatedTypingAttributes:(id *)a6;
- (id)insertDictationResultPlaceholder;
- (id)insertTextPlaceholderWithSize:(CGSize)a3;
- (id)insertTextPlaceholderWithSize:(CGSize)a3 embeddingType:(int64_t)a4;
- (id)metadataDictionariesForDictationResults;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4;
- (id)replaceRange:(id)a3 withAttributedText:(id)a4 updatingSelection:(BOOL)a5;
- (id)selectionRectsForRange:(id)a3;
- (id)textChecker;
- (id)textInRange:(id)a3;
- (id)textRangeForNSRange:(_NSRange)a3;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4;
- (id)undoManager;
- (id)validAnnotations;
- (int)_indexForTextPosition:(id)a3;
- (int)currentUndoGroupType;
- (int64_t)_opposingDirectionFromDirection:(int64_t)a3;
- (int64_t)_resolveNaturalDirection:(int64_t)a3;
- (int64_t)_selectionAffinity;
- (int64_t)_textInputSource;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)selectionAffinity;
- (int64_t)writingDirectionAtPosition:(id)a3;
- (unint64_t)_validCaretPositionFromCharacterIndex:(unint64_t)a3 downstream:(BOOL)a4;
- (unint64_t)textLengthToDeleteBeforeSelectedRangeForSmartDelete;
- (unsigned)_characterAfterCaretSelection;
- (unsigned)_characterBeforeCaretSelection;
- (unsigned)_characterInRelationToCaretSelection:(int)a3;
- (unsigned)_characterInRelationToPosition:(id)a3 amount:(int)a4;
- (unsigned)_characterInRelationToRangedSelection:(int)a3;
- (void)_addShortcut:(id)a3;
- (void)_addToTypingAttributes:(id)a3 value:(id)a4;
- (void)_adjustSizeByIncreasing:(BOOL)a3;
- (void)_changeTextAlignment:(int64_t)a3 undoString:(id)a4;
- (void)_clearMarkedText;
- (void)_clearSelectionUI;
- (void)_coordinateSelectionChange:(id)a3;
- (void)_copySelectionToClipboard;
- (void)_copySelectionToClipboard:(id)a3;
- (void)_define:(id)a3;
- (void)_deleteBackwardAndNotify:(BOOL)a3;
- (void)_deleteByWord;
- (void)_deleteForwardAndNotify:(BOOL)a3;
- (void)_deleteForwardByWord;
- (void)_deleteTextRange:(id)a3;
- (void)_deleteToEndOfLine;
- (void)_deleteToEndOfParagraph;
- (void)_deleteToStartOfLine;
- (void)_detachFromLayoutManager;
- (void)_ensureSelectionValid;
- (void)_ensureSelectionVisible;
- (void)_expandSelectionToBackwardDeletionClusterWithReinsertionOut:(id *)a3;
- (void)_expandSelectionToStartOfWordBeforeCaretSelection;
- (void)_expandSelectionToStartOfWordsBeforeCaretSelection:(int)a3;
- (void)_extendCurrentSelection:(int)a3;
- (void)_forceUnmarkTextDueToEditing;
- (void)_insertAttributedText:(id)a3 fromKeyboard:(BOOL)a4;
- (void)_insertAttributedTextWithoutClosingTyping:(id)a3;
- (void)_insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4 replacingRange:(_NSRange)a5 resultLength:(unint64_t *)a6;
- (void)_insertText:(id)a3 fromKeyboard:(BOOL)a4;
- (void)_invalidateEmptyStringAttributes;
- (void)_invalidateTypingAttributes;
- (void)_layoutManagerDidCompleteLayout;
- (void)_moveCurrentSelection:(int)a3;
- (void)_pasteAndMatchStyle:(BOOL)a3;
- (void)_pasteAttributedString:(id)a3 pasteAsRichText:(BOOL)a4;
- (void)_pasteAttributedString:(id)a3 toRange:(id)a4 completion:(id)a5;
- (void)_pasteRawAttributedString:(id)a3 asRichText:(BOOL)a4;
- (void)_performWhileSuppressingDelegateNotifications:(id)a3;
- (void)_promptForReplace:(id)a3;
- (void)_registerUndoOperationForReplacementWithActionName:(id)a3 replacementText:(id)a4;
- (void)_removeShareController;
- (void)_removeShortcutController;
- (void)_replaceCurrentWordWithText:(id)a3;
- (void)_replaceDocumentWithText:(id)a3;
- (void)_scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4;
- (void)_selectAll;
- (void)_selectionDidScroll:(id)a3;
- (void)_selectionGeometryChanged;
- (void)_sendDelegateChangeNotificationsForText:(BOOL)a3 selection:(BOOL)a4;
- (void)_sendDelegateChangeNotificationsForText:(BOOL)a3 selection:(BOOL)a4 replacement:(id)a5 characterRange:(_NSRange)a6;
- (void)_sendDelegateWillChangeNotificationsForText:(BOOL)a3 selection:(BOOL)a4;
- (void)_setAllowedTypingAttributes:(id)a3;
- (void)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4 fromKeyboard:(BOOL)a5 useTextStyle:(BOOL)a6;
- (void)_setCaretSelectionAtEndOfSelection;
- (void)_setEmptyStringAttributes:(id)a3;
- (void)_setGestureRecognizers;
- (void)_setInternalGestureRecognizers;
- (void)_setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)_setSelectedRange:(_NSRange)a3;
- (void)_setSelectedTextRange:(id)a3 withAffinityDownstream:(BOOL)a4;
- (void)_setSelectionToPosition:(id)a3;
- (void)_setUndoRedoInProgress:(BOOL)a3;
- (void)_share:(id)a3;
- (void)_textStorageDidProcessEditing:(id)a3;
- (void)_toggleFontTrait:(unsigned int)a3;
- (void)_translate:(id)a3;
- (void)_transliterateChinese:(id)a3;
- (void)_transpose;
- (void)_undoManagerWillUndo:(id)a3;
- (void)_unmarkText;
- (void)_updateEmptyStringAttributes;
- (void)_updateFirstTextView;
- (void)_updateRangeForSmartDelete;
- (void)_updateRectsForPlaceholder;
- (void)_updateSelectedRects:(id)a3 byTrimmingWhitespaceInRange:(id)a4 inDocument:(id)a5;
- (void)_updateSelectionWithTextRange:(id)a3 withAffinityDownstream:(BOOL)a4;
- (void)_validateCommand:(id)a3 forFont:(id)a4 traits:(int)a5;
- (void)addTextAlternatives:(id)a3;
- (void)addTextAlternativesDisplayStyle:(int64_t)a3 toRange:(_NSRange)a4;
- (void)addTextAlternativesDisplayStyle:(int64_t)a3 toRange:(_NSRange)a4 invalidatingDisplayInBoundingRect:(BOOL)a5;
- (void)alignCenter:(id)a3;
- (void)alignJustified:(id)a3;
- (void)alignLeft:(id)a3;
- (void)alignRight:(id)a3;
- (void)applyGrammarCheckingIndication;
- (void)beginSelectionChange;
- (void)captureTextFromCamera:(id)a3;
- (void)changeWillBeUndone:(id)a3;
- (void)changingContextWithTrigger:(id)a3;
- (void)checkSmartPunctuationForWordInRange:(id)a3;
- (void)checkSpellingForSelectionChangeIfNecessary;
- (void)checkSpellingForWordInRange:(id)a3;
- (void)clearText;
- (void)coalesceInTextView:(id)a3 actionName:(id)a4 affectedRange:(_NSRange)a5 replacementRange:(_NSRange)a6 replacementText:(id)a7;
- (void)correctedTypedText:(id)a3 rangeOfReplacement:(id)a4;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)decreaseSize:(id)a3;
- (void)deleteBackward;
- (void)deleteRemainingSpaceForTextListIfNeeded;
- (void)didEndEditing;
- (void)endSelectionChange;
- (void)forwardInvocation:(id)a3;
- (void)handleTextListForInsertedText:(id)a3 attributedText:(id)a4 intoTextStorage:(id)a5 replacementRange:(_NSRange)a6 paragraphStyle:(id)a7 paragraphStart:(unint64_t)a8 paragraphContentsEnd:(unint64_t)a9 updatedTypingAttributes:(id *)a10;
- (void)increaseSize:(id)a3;
- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4;
- (void)insertAttributedText:(id)a3;
- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4;
- (void)insertEmojiImageTextAttachment:(id)a3 replacementRange:(id)a4;
- (void)insertText:(id)a3;
- (void)invalidateDisplayForRange:(uint64_t)a1;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionNatural:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)notifyTextCheckingControllerForSelectionChange;
- (void)paste:(id)a3;
- (void)pasteAndMatchStyle:(id)a3;
- (void)pasteItemProviders:(id)a3;
- (void)pasteItemProviders:(id)a3 matchesStyle:(BOOL)a4;
- (void)preheatTextChecker;
- (void)registerUndoOperationForType:(int)a3 actionName:(id)a4 affectedRange:(_NSRange)a5 replacementText:(id)a6;
- (void)removeAllTextAlternatives;
- (void)removeAlternativesForCurrentWord;
- (void)removeAnnotation:(id)a3 forRange:(id)a4;
- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4;
- (void)removeEmojiAlternatives;
- (void)removeSpellingMarkersForCurrentWord;
- (void)removeSpellingMarkersFromWordInRange:(id)a3;
- (void)removeTextPlaceholder:(id)a3;
- (void)removeTextPlaceholder:(id)a3 notifyInputDelegate:(BOOL)a4;
- (void)removeTextStylingFromString:(id)a3;
- (void)replace:(id)a3;
- (void)replaceRange:(id)a3 withAnnotatedString:(id)a4 relativeReplacementRange:(_NSRange)a5;
- (void)replaceRange:(id)a3 withAttributedText:(id)a4;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4;
- (void)scheduleUndoOperationForType:(int)a3 actionName:(id)a4 previousSelectedRange:(_NSRange)a5 replacementText:(id)a6;
- (void)scrollRangeToVisible:(_NSRange)a3;
- (void)select:(id)a3;
- (void)selectAll;
- (void)selectAll:(id)a3;
- (void)setAllowsEditingTextAttributes:(BOOL)a3;
- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setContinuousSpellCheckingEnabled:(BOOL)a3;
- (void)setCurrentUndoGroupType:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setInputDelegate:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setMarkedTextStyle:(id)a3;
- (void)setPreviousSelectedTextRange:(id)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setSelectedRange:(_NSRange)a3 afterDelta:(int64_t)a4 appliedToRange:(_NSRange)a5;
- (void)setSelectedTextRange:(id)a3;
- (void)setShouldStartUndoGroup:(BOOL)a3;
- (void)setSupportsAdaptiveImageGlyph:(BOOL)a3;
- (void)setTextLayoutController:(id)a3;
- (void)setTypingAttributes:(id)a3;
- (void)setWritingToolsStreamingReplacements:(BOOL)a3;
- (void)set_textInputSource:(int64_t)a3;
- (void)signalDictationDeletionTip;
- (void)signalDictationInputEvent:(id)a3 insertedText:(id)a4;
- (void)signalDictationSelectionTip:(id)a3;
- (void)stopCoalescing;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)undoDidReplaceRange:(_NSRange)a3 withAttributedText:(id)a4;
- (void)undoManagerDidFinishUndoRedo;
- (void)undoManagerWillBeginUndoRedo;
- (void)undoManagerWillRemoveAllActions;
- (void)undoWillChangeText;
- (void)unmarkText;
- (void)unmarkText:(BOOL)a3;
- (void)updateTextAttributesWithConversionHandler:(id)a3;
- (void)validateCommand:(id)a3;
@end

@implementation UITextInputController

- (_NSRange)_selectedRange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  uint64_t v4 = [WeakRetained characterRangeForTextRange:self->_selectedTextRange];
  NSUInteger v6 = v5;

  NSUInteger v7 = v4;
  NSUInteger v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

void __37__UITextInputController_textInRange___block_invoke(uint64_t a1, void *a2)
{
  id v24 = [a2 string];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  uint64_t v4 = [*(id *)(a1 + 32) selectedTextRange];
  uint64_t v5 = [WeakRetained characterRangeForTextRange:v4];

  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  uint64_t v7 = [v6 characterRangeForTextRange:*(void *)(a1 + 40)];
  unint64_t v9 = v8;

  if ((int)v7 < 0) {
    uint64_t v10 = v5;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = v10 + v7;
  if ((v11 & 0x80000000) != 0) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = v11;
  }
  if (v12 > [v24 length]) {
    unint64_t v12 = [v24 length];
  }
  if (v12 + v9 > [v24 length]) {
    unint64_t v9 = [v24 length] - v12;
  }
  v13 = *(void **)(*(void *)(a1 + 32) + 224);
  if (v13
    && ([v13 attachment],
        v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 attachmentRange],
        uint64_t v17 = v16,
        v14,
        v15 + v17 < (unint64_t)[v24 length]))
  {
    v18 = [NSString _stringWithUnichar:65532];
    uint64_t v19 = objc_msgSend(v24, "stringByReplacingCharactersInRange:withString:", v15, v17, v18);

    v20 = (void *)v19;
  }
  else
  {
    v20 = v24;
  }
  id v25 = v20;
  uint64_t v21 = objc_msgSend(v20, "substringWithRange:", v12, v9);
  uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
  v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;
}

- (UITextRange)selectedTextRange
{
  if (self->_markedTextRange.length)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(WeakRetained, "textRangeForCharacterRange:", self->_markedTextSelection.location + self->_markedTextRange.location, self->_markedTextSelection.length);
    uint64_t v4 = (UITextRange *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = self->_selectedTextRange;
  }
  return v4;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  p_textLayoutController = &self->_textLayoutController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  int64_t v9 = [WeakRetained comparePosition:v7 toPosition:v6];

  return v9;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  p_textLayoutController = &self->_textLayoutController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  unint64_t v8 = -[_UITextLayoutControllerBase positionFromPosition:offset:](WeakRetained, (uint64_t)v6, a4);

  return v8;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  p_textLayoutController = &self->_textLayoutController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  int64_t v9 = [WeakRetained textRangeFromPosition:v7 toPosition:v6];

  return v9;
}

- (UITextPosition)beginningOfDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  v3 = [WeakRetained beginningOfDocument];

  return (UITextPosition *)v3;
}

- (id)textInRange:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__211;
  uint64_t v16 = __Block_byref_object_dispose__211;
  id v17 = 0;
  uint64_t v5 = [(UITextInputController *)self _textStorage];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__UITextInputController_textInRange___block_invoke;
  v9[3] = &unk_1E530B718;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  unint64_t v11 = &v12;
  [v5 coordinateReading:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_textStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  v3 = [WeakRetained textStorage];

  return v3;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "instancesRespondToSelector:", objc_msgSend(v4, "selector")))
  {
    [v4 invokeWithTarget:self->_textInputTraits];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITextInputController;
    [(UITextInputController *)&v5 forwardInvocation:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  if (!v4)
  {
    id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  return v4;
}

- (void)_textStorageDidProcessEditing:(id)a3
{
  [(_UITextInputControllerTokenizer *)self->_tokenizer invalidateTokenizer];
  [(UITextInputController *)self _updateEmptyStringAttributes];
  id v4 = [(UITextInputController *)self _textStorage];
  if (([v4 editedMask] & 2) == 0 || (*((unsigned char *)&self->_tiFlags + 1) & 0x80) != 0) {
    goto LABEL_15;
  }
  uint64_t v5 = [(UITextInputController *)self _selectedRange];
  uint64_t v7 = v6;
  v24.NSUInteger length = [v4 length];
  v24.location = 0;
  NSUInteger length = NSIntersectionRange(v24, (NSRange)self[96]).length;
  int64_t v9 = [(UITextInputController *)self markedTextRange];
  if (v9)
  {
    id v10 = v9;
    if (length && length == self->_markedTextRange.length)
    {
      unint64_t v11 = [(NSAttributedString *)self->_markedText string];
      BOOL v12 = [(UITextInputController *)self _isInlineCompletionPresentedAsMarkedText:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    [(UITextInputController *)self _forceUnmarkTextDueToEditing];
  }
LABEL_10:
  [(UITextInputController *)self _ensureSelectionValid];
  if (v5 != [(UITextInputController *)self _selectedRange] || v7 != v13)
  {
    *(_DWORD *)&self->_tiFlags |= 0x10000u;
    uint64_t v14 = [(UITextInputController *)self interactionAssistant];
    uint64_t v15 = [v14 activeSelection];
    [v15 selectionChanged];
  }
  unint64_t v16 = [v4 editedRange];
  if (v16 <= [(UITextInputController *)self _selectedRange]) {
    [(UITextInputController *)self _selectionGeometryChanged];
  }
LABEL_15:
  if (![(UITextInputController *)self supportLetterByLetterUndo]
    && ([v4 editedMask] & 2) != 0
    && (*((unsigned char *)&self->_tiFlags + 1) & 0xA0) == 0)
  {
    id v17 = [(UITextInputController *)self undoManager];
    uint64_t v18 = [v17 groupingLevel];

    if (!v18)
    {
      uint64_t v19 = [(UITextInputController *)self undoManager];
      [v19 removeAllActions];
    }
  }
  if (([v4 editedMask] & 2) != 0
    && !+[UIKeyboard isModelessActive])
  {
    v20 = +[UIDictationController activeInstance];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [v20 cancelDictationForTextStoreChangesInResponder:WeakRetained];
  }
  uint64_t v22 = [(UITextInputController *)self _textStorage];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__UITextInputController__textStorageDidProcessEditing___block_invoke;
  v23[3] = &unk_1E530B528;
  v23[4] = self;
  [v22 coordinateReading:v23];
}

- (id)undoManager
{
  undoManager = self->_undoManager;
  if (!undoManager)
  {
    id v4 = objc_alloc_init(_UITextUndoManager);
    uint64_t v5 = self->_undoManager;
    self->_undoManager = v4;

    [(_UITextUndoManager *)self->_undoManager setInputController:self];
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__undoManagerWillUndo_ name:*MEMORY[0x1E4F28A98] object:self->_undoManager];

    undoManager = self->_undoManager;
  }
  return undoManager;
}

- (UITextRange)markedTextRange
{
  if (self->_markedTextRange.length)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    id v4 = objc_msgSend(WeakRetained, "textRangeForCharacterRange:", self->_markedTextRange.location, self->_markedTextRange.length);
  }
  else
  {
    id v4 = 0;
  }
  return (UITextRange *)v4;
}

- (BOOL)supportLetterByLetterUndo
{
  return 0;
}

- (void)undoManagerWillRemoveAllActions
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)&self->_tiFlags + 2) & 0x20) != 0)
  {
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
    {
      v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &undoManagerWillRemoveAllActions___s_category)+ 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        id v4 = (void *)MEMORY[0x1E4F29060];
        uint64_t v5 = v3;
        uint64_t v6 = [v4 callStackSymbols];
        int v7 = 138412290;
        unint64_t v8 = v6;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "!!!! Undo manager is removing all actions. UITextInputController will prematurely end undo group for Writing Tools replacements\n%@", (uint8_t *)&v7, 0xCu);
      }
    }
    *(_DWORD *)&self->_tiFlags |= 0x400000u;
  }
}

- (void)stopCoalescing
{
  p_undoOperationForCoalescing = &self->_undoOperationForCoalescing;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_undoOperationForCoalescing);

  if (WeakRetained)
  {
    objc_storeWeak((id *)p_undoOperationForCoalescing, 0);
  }
}

- (BOOL)dontRemoveAllActions
{
  return self->_dontRemoveAllActionsCount != 0;
}

- (void)_ensureSelectionValid
{
  v3 = [(UITextInputController *)self _textStorage];
  unint64_t location = [v3 length];

  if ([(UITextInputController *)self _selectedRange] >= location)
  {
    NSUInteger length = 0;
  }
  else
  {
    v9.unint64_t location = [(UITextInputController *)self _selectedRange];
    v10.unint64_t location = 0;
    v10.NSUInteger length = location;
    NSRange v5 = NSIntersectionRange(v9, v10);
    unint64_t location = v5.location;
    NSUInteger length = v5.length;
  }
  if ([(UITextInputController *)self _selectedRange] != location || v7 != length)
  {
    -[UITextInputController _setSelectedRange:](self, "_setSelectedRange:", location, length);
  }
}

- (NSDictionary)typingAttributes
{
  textPlaceholder = self->_textPlaceholder;
  if (textPlaceholder)
  {
    id v4 = [(UITextPlaceholder *)textPlaceholder attachment];
    NSRange v5 = [v4 typingAttributesBeforeInsertion];
    [(UITextInputController *)self setTypingAttributes:v5];

LABEL_3:
    typingAttributes = self->_typingAttributes;
    goto LABEL_5;
  }
  typingAttributes = self->_typingAttributes;
  if (!typingAttributes)
  {
    uint64_t v8 = [(UITextInputController *)self _selectedRange];
    id v4 = -[UITextInputController _attributesForReplacementInRange:](self, "_attributesForReplacementInRange:", v8, v9);
    [(UITextInputController *)self setTypingAttributes:v4];
    goto LABEL_3;
  }
LABEL_5:
  return typingAttributes;
}

- (void)setTextLayoutController:(id)a3
{
  id obj = a3;
  NSRange v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  p_textLayoutController = &self->_textLayoutController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);

  if (WeakRetained)
  {
    uint64_t v8 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    if (([v8 canAccessLayoutManager] & 1) != 0 || (objc_msgSend(obj, "canAccessLayoutManager") & 1) == 0)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_textLayoutController);
      NSRange v10 = [v9 textStorage];
      unint64_t v11 = [obj textStorage];

      if (v10 == v11)
      {
LABEL_7:
        [v5 removeObserver:self name:*(void *)off_1E52D6E60 object:0];
        objc_storeWeak((id *)&self->_layoutManager, 0);
        goto LABEL_8;
      }
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"UITextInputController.m" lineNumber:371 description:@"Cannot change the text storage after view is created"];
    }

    goto LABEL_7;
  }
LABEL_8:
  BOOL v12 = self;
  id v13 = objc_loadWeakRetained((id *)p_textLayoutController);
  [v13 detachFromTextInputController];

  id v14 = objc_storeWeak((id *)p_textLayoutController, obj);
  [obj adoptTextInputController:v12];

  if ([obj canAccessLayoutManager])
  {
    uint64_t v15 = [obj layoutManager];
    objc_storeWeak((id *)&v12->_layoutManager, v15);

    uint64_t v16 = *(void *)off_1E52D6E60;
    id v17 = objc_loadWeakRetained((id *)&v12->_layoutManager);
    [v5 addObserver:v12 selector:sel__textContainerDidChangeView_ name:v16 object:v17];
  }
  [(UITextInputController *)v12 _updateFirstTextView];
  [(UITextInputController *)v12 _updateEmptyStringAttributes];
}

- (UITextInputController)initWithTextLayoutController:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UITextInputController;
  uint64_t v6 = [(UITextInputController *)&v20 init];
  if (v6)
  {
    uint64_t v7 = +[UITextInputTraits defaultTextInputTraits];
    textInputTraits = v6->_textInputTraits;
    v6->_textInputTraits = (UITextInputTraits *)v7;

    if (!v5)
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:v6 file:@"UITextInputController.m" lineNumber:342 description:@"UITextInputController requires a text layout controller!"];
    }
    [(UITextInputController *)v6 setTextLayoutController:v5];
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = *(void *)off_1E52D2350;
    unint64_t v11 = [v5 textStorage];
    [v9 addObserver:v6 selector:sel__textStorageDidProcessEditing_ name:v10 object:v11];

    v6->_markedTextRange = (_NSRange)xmmword_186B93450;
    markedTextStyle = v6->_markedTextStyle;
    v6->_markedTextStyle = 0;

    id v13 = [v5 beginningOfDocument];
    uint64_t v14 = [v5 emptyTextRangeAtPosition:v13];
    selectedTextRange = v6->_selectedTextRange;
    v6->_selectedTextRange = (UITextRange *)v14;

    [(UITextInputController *)v6 _updateFirstTextView];
    [(UITextInputController *)v6 _updateEmptyStringAttributes];
    v6->_currentUndoGroupType = 0;
    uint64_t v16 = [[UITextCheckingController alloc] initWithClient:v6];
    textCheckingController = v6->_textCheckingController;
    v6->_textCheckingController = v16;
  }
  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITextInputController;
  if (-[UITextInputController respondsToSelector:](&v5, sel_respondsToSelector_)) {
    return 1;
  }
  else {
    return [(id)objc_opt_class() instancesRespondToSelector:a3];
  }
}

- (void)setTypingAttributes:(id)a3
{
}

- (id)_attributesForReplacementInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__211;
  uint64_t v14 = __Block_byref_object_dispose__211;
  id v15 = 0;
  uint64_t v6 = [(UITextInputController *)self _textStorage];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__UITextInputController__attributesForReplacementInRange___block_invoke;
  v9[3] = &unk_1E530B808;
  v9[6] = location;
  v9[7] = length;
  v9[4] = self;
  void v9[5] = &v10;
  [v6 coordinateReading:v9];

  uint64_t v7 = [(UITextInputController *)self _fixupTypingAttributeForAttributes:v11[5]];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)_fixupTypingAttributeForAttributes:(id)a3
{
  uint64_t v4 = *(void *)off_1E52D21A0;
  id v5 = a3;
  uint64_t v6 = [v5 objectForKey:v4];
  uint64_t v7 = [v5 objectForKey:@"DDResultAttributeName"];
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = [(UITextInputController *)self _allowedTypingAttributes];
  uint64_t v10 = [v5 objectForKey:@"mt_systemAttributes"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__UITextInputController__fixupTypingAttributeForAttributes___block_invoke;
  v17[3] = &unk_1E52E4F30;
  id v18 = v9;
  id v19 = v10;
  id v11 = v8;
  id v20 = v11;
  id v12 = v10;
  id v13 = v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v17];

  if (v6) {
    [v11 setObject:v6 forKey:*(void *)off_1E52D2040];
  }
  if (v7) {
    [v11 removeObjectForKey:*(void *)off_1E52D2110];
  }
  uint64_t v14 = v20;
  id v15 = v11;

  return v15;
}

- (NSSet)_allowedTypingAttributes
{
  allowedTypingAttributes = self->_allowedTypingAttributes;
  if (!allowedTypingAttributes)
  {
    if (qword_1EB264870 != -1) {
      dispatch_once(&qword_1EB264870, &__block_literal_global_559_1);
    }
    allowedTypingAttributes = (NSSet *)qword_1EB264868;
  }
  v3 = allowedTypingAttributes;
  return v3;
}

void __58__UITextInputController__attributesForReplacementInRange___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  NSUInteger v3 = [v19 length];
  if (v3)
  {
    NSUInteger v4 = v3;
    v21.NSUInteger location = 0;
    v21.NSUInteger length = v3;
    NSRange v5 = NSIntersectionRange(*(NSRange *)(a1 + 48), v21);
    if (v5 == 0uLL)
    {
      if (*(void *)(a1 + 48) || *(void *)(a1 + 56))
      {
        NSUInteger location = v4 - 1;
LABEL_11:
        id v9 = v19;
LABEL_12:
        NSUInteger v10 = location;
LABEL_13:
        uint64_t v11 = [v9 attributesAtIndex:v10 effectiveRange:0];
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v7 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;
        goto LABEL_14;
      }
      goto LABEL_23;
    }
    NSUInteger location = v5.location;
    if (v5.length) {
      goto LABEL_11;
    }
    if (!v5.location)
    {
LABEL_23:
      id v9 = v19;
      NSUInteger v10 = 0;
      goto LABEL_13;
    }
    if (v5.location >= v4)
    {
      NSUInteger v15 = v5.location - 1;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      uint64_t v14 = [v19 string];
      NSUInteger v15 = v5.location - 1;
      if (objc_msgSend(v13, "characterIsMember:", objc_msgSend(v14, "characterAtIndex:", v5.location - 1)))
      {
        if (v5.location + 1 >= v4)
        {

          goto LABEL_11;
        }
        uint64_t v16 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
        id v17 = [v19 string];
        char v18 = objc_msgSend(v16, "characterIsMember:", objc_msgSend(v17, "characterAtIndex:", v5.location));

        id v9 = v19;
        if ((v18 & 1) == 0) {
          goto LABEL_12;
        }
LABEL_27:
        NSUInteger v10 = v15;
        goto LABEL_13;
      }
    }
    id v9 = v19;
    goto LABEL_27;
  }
  uint64_t v7 = [*(id *)(a1 + 32) _emptyStringAttributes];
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
  if (!v7) {

  }
LABEL_14:
}

- (NSDictionary)_emptyStringAttributes
{
  return self->_emptyStringAttributes;
}

- (void)_updateEmptyStringAttributes
{
  id v6 = [(UITextInputController *)self _textStorage];
  if ([v6 length])
  {
    NSUInteger v3 = [v6 attributesAtIndex:0 effectiveRange:0];
    NSUInteger v4 = (void *)[v3 mutableCopy];

LABEL_3:
    [v4 removeObjectForKey:*(void *)off_1E52D2288];
    [(UITextInputController *)self _setEmptyStringAttributes:v4];
    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    NSRange v5 = [v6 defaultAttributes];
    NSUInteger v4 = (void *)[v5 mutableCopy];

    if ([v4 count]) {
      goto LABEL_3;
    }
  }
  else
  {
    NSUInteger v4 = 0;
  }
LABEL_8:
}

- (void)_setEmptyStringAttributes:(id)a3
{
}

- (void)_selectionGeometryChanged
{
  if ([(UITextInputController *)self _mightHaveSelection])
  {
    id v3 = [(UITextInputController *)self interactionAssistant];
    [v3 setNeedsSelectionDisplayUpdate];
  }
}

- (BOOL)_mightHaveSelection
{
  p_firstTextView = &self->_firstTextView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  id v5 = objc_loadWeakRetained((id *)p_firstTextView);
  char v6 = [v5 _mightHaveSelection];

  return v6;
}

- (BOOL)_hasDictationPlaceholder
{
  return self->_textPlaceholder != 0;
}

- (void)_updateFirstTextView
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v39 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  id v5 = [WeakRetained textContainers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v6)
  {

    id v8 = 0;
LABEL_38:
    id v8 = v8;
    id v9 = v8;
    goto LABEL_39;
  }
  uint64_t v7 = v6;
  v36 = self;
  id v8 = 0;
  id v9 = 0;
  uint64_t v10 = *(void *)v46;
  uint64_t v37 = *(void *)v46;
  v38 = v5;
  do
  {
    uint64_t v11 = 0;
    uint64_t v40 = v7;
    do
    {
      uint64_t v12 = v8;
      if (*(void *)v46 != v10) {
        objc_enumerationMutation(v5);
      }
      id v13 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * v11), "textView", v36);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [v13 superview];

        id v13 = (void *)v14;
      }
      if (v12) {
        NSUInteger v15 = v12;
      }
      else {
        NSUInteger v15 = v13;
      }
      id v8 = v15;

      [v13 bounds];
      objc_msgSend(v13, "convertRect:toView:", 0);
      if (!CGRectIsEmpty(v51))
      {
        id v42 = v8;
        uint64_t v16 = [v13 window];

        if (v16)
        {
          [v39 addObject:v13];
          if ([v3 count])
          {
            id v17 = [v3 lastObject];
            uint64_t v18 = [v13 superview];
            v41 = v9;
            if (v18)
            {
              id v19 = (void *)v18;
              id v20 = 0;
              while (1)
              {
                int v21 = [v3 containsObject:v19];
                id v22 = v19;
                if (v21) {
                  break;
                }

                id v19 = [v22 superview];

                id v20 = v22;
                if (!v19)
                {
                  id v20 = v22;
                  goto LABEL_23;
                }
              }

              id v17 = v22;
            }
            else
            {
              id v20 = 0;
LABEL_23:
              id v22 = 0;
            }
            v26 = [v17 subviews];
            unint64_t v27 = [v26 indexOfObjectIdenticalTo:v20];

            v28 = objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v3, "indexOfObject:", v17) - 1);
            v29 = [v17 subviews];
            unint64_t v30 = [v29 indexOfObjectIdenticalTo:v28];

            if (v27 <= v30)
            {
              id v9 = v41;
              id v5 = v38;
            }
            else
            {
              [v3 removeAllObjects];
              id v31 = v13;

              [v3 addObject:v31];
              v32 = [v31 superview];

              id v5 = v38;
              if (v32)
              {
                do
                {
                  [v3 addObject:v32];
                  uint64_t v33 = [v32 superview];

                  v32 = (void *)v33;
                }
                while (v33);
              }
              id v9 = v31;

              id v22 = 0;
            }

            uint64_t v10 = v37;
          }
          else
          {
            id v23 = v13;
            [v3 addObject:v23];
            NSRange v24 = [v23 superview];

            if (v24)
            {
              do
              {
                [v3 addObject:v24];
                uint64_t v25 = [v24 superview];

                NSRange v24 = (void *)v25;
              }
              while (v25);
            }
            id v17 = v9;
            id v9 = v23;
          }

          uint64_t v7 = v40;
        }
        id v8 = v42;
      }

      ++v11;
    }
    while (v11 != v7);
    uint64_t v7 = [v5 countByEnumeratingWithState:&v45 objects:v49 count:16];
  }
  while (v7);

  self = v36;
  if (!v9) {
    goto LABEL_38;
  }
LABEL_39:

  id v34 = objc_loadWeakRetained((id *)&self->_firstTextView);
  if (v34 != v9)
  {
    objc_storeWeak((id *)&self->_firstTextView, v9);
    id v35 = [(UITextInputController *)self _pasteController];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __45__UITextInputController__updateFirstTextView__block_invoke;
    v43[3] = &unk_1E52D9F70;
    id v44 = v9;
    +[UIView performWithoutAnimation:v43];
  }
}

- (id)_pasteController
{
  p_firstTextView = &self->_firstTextView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);

  if (!WeakRetained) {
    goto LABEL_9;
  }
  id v4 = objc_loadWeakRetained((id *)p_firstTextView);
  objc_getAssociatedObject(v4, sel__pasteController);
  id v5 = (UITextPasteController *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    goto LABEL_10;
  }
  id v6 = objc_loadWeakRetained((id *)p_firstTextView);
  int v7 = [v6 conformsToProtocol:&unk_1ED42FF78];

  if (v7)
  {
    id v8 = [UITextPasteController alloc];
    id v9 = objc_loadWeakRetained((id *)p_firstTextView);
    id v5 = [(UITextPasteController *)v8 initWithSupportingView:v9];
    goto LABEL_7;
  }
  id v10 = objc_loadWeakRetained((id *)p_firstTextView);
  uint64_t v11 = [v10 superview];
  int v12 = [v11 conformsToProtocol:&unk_1ED42FF78];

  if (!v12)
  {
LABEL_9:
    id v5 = 0;
    goto LABEL_10;
  }
  id v13 = [UITextPasteController alloc];
  id v9 = objc_loadWeakRetained((id *)p_firstTextView);
  uint64_t v14 = [v9 superview];
  id v5 = [(UITextPasteController *)v13 initWithSupportingView:v14];

LABEL_7:
  if (v5)
  {
    id v15 = objc_loadWeakRetained((id *)p_firstTextView);
    objc_setAssociatedObject(v15, sel__pasteController, v5, (void *)1);
  }
LABEL_10:
  return v5;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
  if (objc_opt_respondsToSelector()) {
    int v6 = 2;
  }
  else {
    int v6 = 0;
  }
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFFFD | v6);
  if (objc_opt_respondsToSelector()) {
    int v7 = 64;
  }
  else {
    int v7 = 0;
  }
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFFBF | v7);
  if (objc_opt_respondsToSelector()) {
    int v8 = 4;
  }
  else {
    int v8 = 0;
  }
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFFFB | v8);
  if (objc_opt_respondsToSelector()) {
    int v9 = 8;
  }
  else {
    int v9 = 0;
  }
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFFF7 | v9);
  if (objc_opt_respondsToSelector()) {
    int v10 = 16;
  }
  else {
    int v10 = 0;
  }
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFFEF | v10);
  if (objc_opt_respondsToSelector()) {
    int v11 = 128;
  }
  else {
    int v11 = 0;
  }
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFF7F | v11);
  if (objc_opt_respondsToSelector()) {
    int v12 = 1024;
  }
  else {
    int v12 = 0;
  }
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFBFF | v12);
  if (objc_opt_respondsToSelector()) {
    int v13 = 512;
  }
  else {
    int v13 = 0;
  }
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFDFF | v13);
  if (objc_opt_respondsToSelector()) {
    int v14 = 2048;
  }
  else {
    int v14 = 0;
  }
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFF7FF | v14);
  if (objc_opt_respondsToSelector()) {
    int v15 = 4096;
  }
  else {
    int v15 = 0;
  }
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFEFFF | v15);
  char v16 = objc_opt_respondsToSelector();

  if (v16) {
    int v17 = 256;
  }
  else {
    int v17 = 0;
  }
  self->_tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFFEFF | v17);
}

- (_NSRange)markedRange
{
  NSUInteger length = self->_markedTextRange.length;
  NSUInteger location = self->_markedTextRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

void __60__UITextInputController__fixupTypingAttributeForAttributes___block_invoke(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([a1[4] containsObject:v6] && (objc_msgSend(a1[5], "containsObject:", v6) & 1) == 0) {
    [a1[6] setObject:v5 forKey:v6];
  }
}

void __55__UITextInputController__textStorageDidProcessEditing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) selectedRange];
  uint64_t v6 = v5;
  if ([v3 length] && v4 + v6 >= objc_msgSend(v3, "length"))
  {
    unint64_t v4 = [v3 length] - 1;
    uint64_t v6 = 1;
  }
  if (v4 < [v3 length])
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    if (v6) {
      objc_msgSend(v3, "attributesAtIndex:longestEffectiveRange:inRange:", v4, &v14, v4, v6);
    }
    else {
    int v7 = [v3 attributesAtIndex:v4 effectiveRange:&v14];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152));
    int v9 = [WeakRetained keyboardSceneDelegate];
    int v10 = [v9 textFormattingCoordinator];

    unint64_t v11 = v15 + v14;
    uint64_t v12 = [*(id *)(a1 + 32) selectedRange];
    [v10 setSelectedAttributes:v7 isMultiple:v11 < v12 + v13];
  }
}

- (_NSRange)selectedRange
{
  if (self->_markedTextRange.length)
  {
    NSUInteger length = self->_markedTextSelection.length;
    NSUInteger v3 = self->_markedTextSelection.location + self->_markedTextRange.location;
  }
  else
  {
    NSUInteger v3 = [(UITextInputController *)self _selectedRange];
  }
  result.NSUInteger length = length;
  result.NSUInteger location = v3;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextInputController *)self _textStorage];
  NSUInteger v6 = [v5 editedRange];
  NSUInteger v8 = v7;

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v9 = [(UITextPlaceholder *)self->_textPlaceholder attachment];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    unint64_t v11 = [(UITextInputController *)self typingAttributes];
    id v43 = 0;
    [WeakRetained insertionRectForPosition:v4 typingAttributes:v11 placeholderAttachment:v9 textContainer:&v43];
    double v13 = v12;
    double v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    id v20 = v43;

    v45.origin.x = v13;
    v45.origin.y = v15;
    v45.size.width = v17;
    v45.size.height = v19;
    if (CGRectIsNull(v45))
    {
      double v13 = *MEMORY[0x1E4F1DB28];
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    }
    int v21 = [v20 textView];
    if ((*(unsigned char *)&self->_tiFlags & 0x80) == 0
      || (id v22 = objc_loadWeakRetained((id *)&self->_delegate),
          int v23 = [v22 textInputShouldExtendCaretHeight:self],
          v22,
          v23))
    {
      double v15 = v15 + -1.0;
      UIRoundToViewScale(v21);
      double v24 = v25 + 1.0;
    }
    objc_msgSend(v20, "textContainerOrigin", v24);
    double v27 = v13 + v26;
    double v29 = v15 + v28;
    [v21 _currentScreenScale];
    double v31 = UIPointRoundToScale(v27, v29, v30);
    double v33 = v32;
    UICeilToViewScale(v21);
    double v35 = v34;
    UICeilToViewScale(v21);
    double v37 = v36;
    if (v31 < 0.0) {
      double v31 = 0.0;
    }
  }
  else
  {
    double v31 = *MEMORY[0x1E4F1DB20];
    double v33 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v35 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v37 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    v44.NSUInteger location = v6;
    v44.NSUInteger length = v8;
    v38 = NSStringFromRange(v44);
    NSLog(&cfstr_RequestingCare.isa, v38);
  }
  double v39 = v31;
  double v40 = v33;
  double v41 = v35;
  double v42 = v37;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

void __45__UITextInputController__updateFirstTextView__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) interactionAssistant];
  [v1 updateDisplayedSelection];
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  p_textLayoutController = &self->_textLayoutController;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  int64_t v9 = [WeakRetained offsetFromPosition:v7 toPosition:v6];

  return v9;
}

uint64_t __48__UITextInputController_selectionRectsForRange___block_invoke(uint64_t a1, void *a2)
{
  NSUInteger v3 = [a2 textView];
  uint64_t v4 = [*(id *)(a1 + 32) _shouldConsiderTextViewForGeometry:v3];

  return v4;
}

- (BOOL)_shouldConsiderTextViewForGeometry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && ([v4 isHiddenOrHasHiddenAncestor] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
    NSUInteger v8 = [WeakRetained window];
    int64_t v9 = [v5 window];
    BOOL v6 = v8 == v9;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_addToTypingAttributes:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  NSUInteger v8 = [(UITextInputController *)self typingAttributes];
  id v9 = (id)[v8 mutableCopy];

  [v9 setValue:v6 forKey:v7];
  [(UITextInputController *)self setTypingAttributes:v9];
}

- (UITextInputDelegate)inputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  return (UITextInputDelegate *)WeakRetained;
}

- (id)_textInputTraits
{
  return self->_textInputTraits;
}

- (id)selectionRectsForRange:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v4 = [(UITextInputController *)self interactionAssistant];
  uint64_t v5 = [v4 view];
  id v6 = [v5 textInputView];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __48__UITextInputController_selectionRectsForRange___block_invoke;
  v84[3] = &unk_1E530B638;
  v84[4] = self;
  v61 = [WeakRetained selectionRectsForRange:v64 fromView:v6 forContainerPassingTest:v84];

  uint64_t v80 = 0;
  v81 = (double *)&v80;
  uint64_t v82 = 0x2020000000;
  uint64_t v83 = 0;
  NSUInteger v8 = [v64 end];
  id v9 = v8;
  if (v8)
  {
    id v62 = v8;
  }
  else
  {
    id v62 = [v64 start];
  }

  id v10 = objc_loadWeakRetained((id *)&self->_textLayoutController);
  unint64_t v11 = [(UITextInputController *)self typingAttributes];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __48__UITextInputController_selectionRectsForRange___block_invoke_2;
  v79[3] = &unk_1E530B660;
  v79[4] = &v80;
  [v10 requestTextGeometryAtPosition:v62 typingAttributes:v11 resultBlock:v79];

  double v12 = (void *)[v61 mutableCopy];
  id v63 = v12;
  if ([v12 count])
  {
    if ([v64 isEmpty]) {
      goto LABEL_36;
    }
    double v13 = objc_msgSend(v12, "bs_firstObjectPassingTest:", &__block_literal_global_524);
    double v14 = v13;
    if (v13)
    {
      id v60 = v13;
    }
    else
    {
      id v60 = [v12 firstObject];
    }

    double v16 = objc_msgSend(v12, "bs_firstObjectPassingTest:", &__block_literal_global_526);
    CGFloat v17 = v16;
    if (v16)
    {
      id v58 = v16;
    }
    else
    {
      id v58 = [v12 lastObject];
    }

    if ((*(unsigned char *)&self->_tiFlags & 0x80) == 0
      || (id v18 = objc_loadWeakRetained((id *)&self->_delegate),
          int v19 = [v18 textInputShouldExtendCaretHeight:self],
          v18,
          v19))
    {
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __48__UITextInputController_selectionRectsForRange___block_invoke_6;
      v76[3] = &unk_1E530B6C8;
      id v78 = &__block_literal_global_529;
      id v77 = v60;
      id v20 = [v12 indexesOfObjectsPassingTest:v76];
      int v21 = [v12 objectsAtIndexes:v20];

      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __48__UITextInputController_selectionRectsForRange___block_invoke_7;
      v73[3] = &unk_1E530B6C8;
      id v75 = &__block_literal_global_529;
      id v74 = v58;
      id v22 = [v12 indexesOfObjectsPassingTest:v73];
      int v23 = [v12 objectsAtIndexes:v22];

      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v24 = v21;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v69 objects:v86 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v70 != v26) {
              objc_enumerationMutation(v24);
            }
            double v28 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            objc_msgSend(v28, "rect", v58);
            double v30 = v29;
            double v32 = v31;
            double v34 = v33;
            double v36 = v35;
            [v28 setBaselineOffset:v81[3]];
            objc_msgSend(v28, "setRect:fromView:", v6, v30, v32 + -1.0, v34, v36 + 1.0);
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v69 objects:v86 count:16];
        }
        while (v25);
      }

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v37 = v23;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v65 objects:v85 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v66;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v66 != v39) {
              objc_enumerationMutation(v37);
            }
            double v41 = *(void **)(*((void *)&v65 + 1) + 8 * j);
            objc_msgSend(v41, "rect", v58);
            double v43 = v42;
            double v45 = v44;
            double v47 = v46;
            double v49 = v48;
            id v50 = objc_loadWeakRetained((id *)&self->_firstTextView);
            UIRoundToViewScale(v50);
            double v52 = v51;

            [v41 setBaselineOffset:v81[3]];
            objc_msgSend(v41, "setRect:fromView:", v6, v43, v45, v47, v49 + v52);
          }
          uint64_t v38 = [v37 countByEnumeratingWithState:&v65 objects:v85 count:16];
        }
        while (v38);
      }
    }
    if ((objc_msgSend(v60, "containsStart", v58) & 1) == 0)
    {
      v53 = [v64 start];
      [(UITextInputController *)self caretRectForPosition:v53];

      UIFloorToViewScale(v6);
      v54 = +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v6);
      [v54 setContainsStart:1];
      [v54 setBaselineOffset:v81[3]];
      [v63 addObject:v54];
    }
    if (([v59 containsEnd] & 1) == 0)
    {
      v55 = [v64 end];
      [(UITextInputController *)self caretRectForPosition:v55];

      UIFloorToViewScale(v6);
      v56 = +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v6);
      [v56 setContainsEnd:1];
      [v56 setBaselineOffset:v81[3]];
      [v63 addObject:v56];
    }
    double v15 = v60;
  }
  else
  {
    double v15 = +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v6, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    [v12 addObject:v15];
  }

LABEL_36:
  _Block_object_dispose(&v80, 8);

  return v63;
}

uint64_t __48__UITextInputController_selectionRectsForRange___block_invoke_2(uint64_t result, double a2, double a3, double a4, double a5, double a6)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a6;
  return result;
}

- (UITextInteractionAssistant)interactionAssistant
{
  v2 = [(UITextInputController *)self _firstTextView];
  NSUInteger v3 = [v2 interactionAssistant];

  return (UITextInteractionAssistant *)v3;
}

- (id)_firstTextView
{
  p_firstTextView = &self->_firstTextView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
  uint64_t v5 = [WeakRetained window];

  if (!v5) {
    [(UITextInputController *)self _updateFirstTextView];
  }
  id v6 = objc_loadWeakRetained((id *)p_firstTextView);
  return v6;
}

- (void)_detachFromLayoutManager
{
  NSUInteger v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  objc_storeWeak((id *)&self->_layoutManager, 0);
  [(UITextCheckingController *)self->_textCheckingController invalidate];
  textCheckingController = self->_textCheckingController;
  self->_textCheckingController = 0;
}

void __49__UITextInputController__allowedTypingAttributes__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", *(void *)off_1E52D2040, *(void *)off_1E52D21B8, *(void *)off_1E52D2048, *(void *)off_1E52D1F58, *(void *)off_1E52D20F8, *(void *)off_1E52D20C8, *(void *)off_1E52D2250, *(void *)off_1E52D23E8, *(void *)off_1E52D2258, *(void *)off_1E52D2260, *(void *)off_1E52D2238, *(void *)off_1E52D22C0, *(void *)off_1E52D2110, *(void *)off_1E52D1F60, *(void *)off_1E52D23E0, *(void *)off_1E52D2248, *(void *)off_1E52D2198,
         *(void *)off_1E52D1FE0,
         *(void *)off_1E52D2450,
         *(void *)off_1E52D2440,
         *(void *)off_1E52D2318,
         *(void *)off_1E52D22D8,
         @"_UILastStoredDefaultTextAttributesName",
         *(void *)off_1E52D2298,
         0);
  id v1 = (void *)qword_1EB264868;
  qword_1EB264868 = v0;
}

- (void)_setAllowedTypingAttributes:(id)a3
{
  if (self->_allowedTypingAttributes != a3)
  {
    id v4 = (NSSet *)[a3 copy];
    allowedTypingAttributes = self->_allowedTypingAttributes;
    self->_allowedTypingAttributes = v4;
  }
}

- (void)setAllowsEditingTextAttributes:(BOOL)a3
{
  self->_allowsEditingTextAttributes = a3;
}

- (UITextPosition)endOfDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  NSUInteger v3 = [WeakRetained endOfDocument];

  return (UITextPosition *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSelectedTextRange, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_typingAttributes, 0);
  objc_destroyWeak((id *)&self->_textLayoutController);
  objc_storeStrong((id *)&self->_emptyStringAttributes, 0);
  objc_storeStrong((id *)&self->_textPlaceholder, 0);
  objc_storeStrong((id *)&self->_allowedTypingAttributes, 0);
  objc_storeStrong((id *)&self->_textCheckingController, 0);
  objc_storeStrong((id *)&self->_textChecker, 0);
  objc_destroyWeak((id *)&self->_undoOperationForCoalescing);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_destroyWeak((id *)&self->_firstTextView);
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_markedTextStyle, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_translateSession, 0);
  objc_storeStrong((id *)&self->_lookupSession, 0);
  objc_storeStrong((id *)&self->_shareSession, 0);
  objc_storeStrong((id *)&self->_learnSession, 0);
  objc_storeStrong((id *)&self->_observedScrollViews, 0);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_selectedTextRange, 0);
  objc_destroyWeak((id *)&self->_inputDelegate);
}

- (void)dealloc
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutManager);

  if (has_internal_diagnostics)
  {
    if (WeakRetained)
    {
      uint64_t v5 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "NSLayoutManager was not detached before dealloc of UITextInputController", buf, 2u);
      }
    }
  }
  else if (WeakRetained)
  {
    id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dealloc___s_category_11) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "NSLayoutManager was not detached before dealloc of UITextInputController", buf, 2u);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UITextInputController;
  [(UITextInputController *)&v7 dealloc];
}

- (UITextInputSuggestionDelegate)textInputSuggestionDelegate
{
  v2 = [(UITextInputController *)self _selectableText];
  NSUInteger v3 = [v2 inputDelegate];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (UITextInputSuggestionDelegate *)v4;
}

- (int64_t)_textInputSource
{
  v2 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];

  if (!v2) {
    return __UIPlatformFallbackInputSource;
  }
  NSUInteger v3 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  int64_t v4 = [v3 lastEventSource];

  return v4;
}

- (void)set_textInputSource:(int64_t)a3
{
  uint64_t v5 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];

  if (v5)
  {
    BOOL v6 = (objc_opt_respondsToSelector() & 1) != 0 && [(UITextInputController *)self keyboardType] == 122;
    if (a3 == 3 && v6) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 5;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      NSUInteger v8 = self;
    }
    else {
      NSUInteger v8 = 0;
    }
    id v9 = v8;
    id v10 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v10 updateEventSource:a3 options:v7 responder:v9];
  }
  else
  {
    __UIPlatformFallbackInputSource = a3;
  }
}

- (_NSRange)_selectedNSRange
{
  NSUInteger v3 = [(UITextInputController *)self _selectableText];
  int64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 selectedTextRange];
    if (v5)
    {
      uint64_t v6 = [(UITextInputController *)self _nsrangeForTextRange:v5];
      NSUInteger v8 = v7;
    }
    else
    {
      NSUInteger v8 = 0;
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    NSUInteger v8 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)_selectedRangeWithinMarkedText
{
  v2 = [(UITextInputController *)self _selectableText];
  NSUInteger v3 = v2;
  if (v2)
  {
    int64_t v4 = [v2 selectedTextRange];
    if (v4)
    {
      uint64_t v5 = [v3 markedTextRange];
      uint64_t v6 = v5;
      if (!v5
        || ([v5 start],
            NSUInteger v7 = objc_claimAutoreleasedReturnValue(),
            [v4 start],
            NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
            uint64_t v9 = [v3 offsetFromPosition:v7 toPosition:v8],
            v8,
            v7,
            v9 < 0))
      {
        uint64_t v12 = 0;
        uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        NSUInteger v10 = [v4 start];
        unint64_t v11 = [v4 end];
        uint64_t v12 = [v3 offsetFromPosition:v10 toPosition:v11];
      }
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v13 = v9;
  NSUInteger v14 = v12;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (void)_selectAll
{
  id v3 = [(UITextInputController *)self _selectableText];
  v2 = [v3 _fullRange];
  [v3 setSelectedTextRange:v2];
}

- (int)_indexForTextPosition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextInputController *)self _selectableText];
  uint64_t v6 = [v5 beginningOfDocument];
  int v7 = [v5 offsetFromPosition:v6 toPosition:v4];

  return v7;
}

- (_NSRange)_nsrangeForTextRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextInputController *)self _selectableText];
  uint64_t v6 = [v4 start];
  NSUInteger v7 = [(UITextInputController *)self _indexForTextPosition:v6];

  NSUInteger v8 = [v4 start];
  uint64_t v9 = [v4 end];

  uint64_t v10 = [v5 offsetFromPosition:v8 toPosition:v9];
  NSUInteger v11 = v7;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (id)_textRangeFromNSRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v5 = [(UITextInputController *)self _selectableText];
  uint64_t v6 = [v5 beginningOfDocument];
  NSUInteger v7 = [v5 positionFromPosition:v6 offset:location];
  NSUInteger v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 endOfDocument];
  }
  uint64_t v10 = v9;

  NSUInteger v11 = [v5 positionFromPosition:v10 offset:length];
  NSUInteger v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v5 endOfDocument];
  }
  NSUInteger v14 = v13;

  double v15 = [v5 textRangeFromPosition:v10 toPosition:v14];

  return v15;
}

- (unsigned)_characterAfterCaretSelection
{
  return [(UITextInputController *)self _characterInRelationToCaretSelection:0];
}

- (unsigned)_characterBeforeCaretSelection
{
  return [(UITextInputController *)self _characterInRelationToCaretSelection:0xFFFFFFFFLL];
}

- (unsigned)_characterInRelationToCaretSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(UITextInputController *)self _selectableText];
  uint64_t v6 = [v5 selectedTextRange];
  if (v6
    && (NSUInteger v7 = (void *)v6,
        [v5 selectedTextRange],
        NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEmpty],
        v8,
        v7,
        v9))
  {
    unsigned int v10 = [(UITextInputController *)self _characterInRelationToRangedSelection:v3];
  }
  else
  {
    unsigned int v10 = 0;
  }

  return v10;
}

- (unsigned)_characterInRelationToRangedSelection:(int)a3
{
  id v4 = [(UITextInputController *)self _selectableText];
  uint64_t v5 = [v4 selectedTextRange];

  if (!v5) {
    goto LABEL_4;
  }
  if (a3 > -101)
  {
    if ((a3 & 0x80000000) == 0)
    {
      NSUInteger v7 = [v4 selectedTextRange];
      NSUInteger v8 = [v7 end];

      if (a3)
      {
        uint64_t v9 = [v4 positionFromPosition:v8 offset:a3];

        NSUInteger v8 = (void *)v9;
      }
      if (!v8) {
        goto LABEL_17;
      }
LABEL_11:
      uint64_t v12 = [v4 positionFromPosition:v8 offset:1];
      if (v12)
      {
        id v13 = (void *)v12;
        NSUInteger v14 = [v4 textRangeFromPosition:v8 toPosition:v12];
        double v15 = [v4 textInRange:v14];
        if ([v15 length])
        {
          if ([v15 length] == 2
            && (int v16 = [v15 characterAtIndex:0],
                int v17 = [v15 characterAtIndex:1],
                (v16 & 0xFC00) == 0xD800)
            && (v17 & 0xFC00) == 0xDC00)
          {
            unsigned int v6 = v17 + (v16 << 10) - 56613888;
          }
          else
          {
            unsigned int v6 = [v15 characterAtIndex:0];
          }
        }
        else
        {
          unsigned int v6 = 0;
        }

        goto LABEL_21;
      }
LABEL_17:
      unsigned int v6 = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_10:
    unsigned int v10 = [v4 selectedTextRange];
    NSUInteger v11 = [v10 start];
    NSUInteger v8 = [v4 positionFromPosition:v11 offset:a3];

    if (!v8) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  unsigned int v6 = 0;
LABEL_22:

  return v6;
}

- (unsigned)_characterInRelationToPosition:(id)a3 amount:(int)a4
{
  if (!a3) {
    return 0;
  }
  id v6 = a3;
  NSUInteger v7 = [(UITextInputController *)self _selectableText];
  NSUInteger v8 = [v7 positionFromPosition:v6 offset:a4];

  uint64_t v9 = [v7 positionFromPosition:v8 offset:1];
  unsigned int v10 = [v7 textRangeFromPosition:v8 toPosition:v9];
  NSUInteger v11 = [v7 textInRange:v10];
  if ([v11 length])
  {
    if ([v11 length] == 2
      && (int v12 = [v11 characterAtIndex:0],
          int v13 = [v11 characterAtIndex:1],
          (v12 & 0xFC00) == 0xD800)
      && (v13 & 0xFC00) == 0xDC00)
    {
      unsigned int v14 = v13 + (v12 << 10) - 56613888;
    }
    else
    {
      unsigned int v14 = [v11 characterAtIndex:0];
    }
  }
  else
  {
    unsigned int v14 = 0;
  }

  return v14;
}

- (id)_wordContainingCaretSelection
{
  uint64_t v3 = [(UITextInputController *)self _selectableText];
  id v4 = [v3 selectedTextRange];
  if (v4)
  {
    uint64_t v5 = [v3 selectedTextRange];
    int v6 = [v5 isEmpty];

    if (v6)
    {
      NSUInteger v7 = [v3 selectedTextRange];
      NSUInteger v8 = [v7 start];
      uint64_t v9 = [(UITextInputController *)self _rangeOfEnclosingWord:v8];

      if (v9)
      {
        id v4 = [v3 textInRange:v9];
      }
      else
      {
        id v4 = 0;
      }
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (id)_fullText
{
  v2 = [(UITextInputController *)self _selectableText];
  uint64_t v3 = [v2 beginningOfDocument];
  id v4 = [v2 endOfDocument];
  uint64_t v5 = [v2 textRangeFromPosition:v3 toPosition:v4];

  int v6 = [v2 textInRange:v5];

  return v6;
}

- (void)_setSelectionToPosition:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(UITextInputController *)self _selectableText];
    uint64_t v5 = [v6 textRangeFromPosition:v4 toPosition:v4];

    if (v5) {
      [v6 setSelectedTextRange:v5];
    }
  }
}

- (BOOL)_selectionAtWordStart
{
  uint64_t v3 = [(UITextInputController *)self _selectableText];
  id v4 = [v3 selectedTextRange];
  uint64_t v5 = [v4 start];
  id v6 = [(UITextInputController *)self _rangeOfEnclosingWord:v5];

  if (v6)
  {
    NSUInteger v7 = [v6 start];
    NSUInteger v8 = [v3 selectedTextRange];
    uint64_t v9 = [v8 start];
    uint64_t v10 = [v3 comparePosition:v7 toPosition:v9];

    BOOL v11 = v10 == 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_selectionAtDocumentStart
{
  v2 = [(UITextInputController *)self _selectableText];
  uint64_t v3 = [v2 selectedTextRange];
  id v4 = [v3 start];

  if (v4)
  {
    uint64_t v5 = [v2 beginningOfDocument];
    BOOL v6 = [v2 comparePosition:v5 toPosition:v4] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_selectionAtDocumentEnd
{
  v2 = [(UITextInputController *)self _selectableText];
  uint64_t v3 = [v2 selectedTextRange];
  id v4 = [v3 end];

  if (v4)
  {
    uint64_t v5 = [v2 endOfDocument];
    BOOL v6 = [v2 comparePosition:v5 toPosition:v4] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (CGRect)_selectionClipRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)_isEmptySelection
{
  double v2 = [(UITextInputController *)self _selectableText];
  double v3 = [v2 selectedTextRange];
  double v4 = [v3 start];
  double v5 = [v3 end];
  BOOL v6 = [v2 comparePosition:v4 toPosition:v5] == 0;

  return v6;
}

- (BOOL)_hasMarkedTextOrRangedSelection
{
  double v2 = [(UITextInputController *)self _selectableText];
  double v3 = [v2 markedTextRange];
  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    double v5 = [v2 selectedTextRange];
    if (v5)
    {
      BOOL v6 = [v2 selectedTextRange];
      int v4 = [v6 isEmpty] ^ 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (void)_extendCurrentSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = [(UITextInputController *)self _selectableText];
  if (v3)
  {
    id v15 = v5;
    BOOL v6 = [v5 selectedTextRange];

    double v5 = v15;
    if (v6)
    {
      NSUInteger v7 = [v15 selectedTextRange];
      NSUInteger v8 = [v7 start];

      uint64_t v9 = [v15 selectedTextRange];
      uint64_t v10 = [v9 end];

      if ((int)v3 < 1)
      {
        uint64_t v13 = [(UITextInputController *)self _clampedpositionFromPosition:v8 offset:v3];
        int v12 = v8;
        NSUInteger v8 = (void *)v13;
      }
      else
      {
        uint64_t v11 = [(UITextInputController *)self _clampedpositionFromPosition:v10 offset:v3];
        int v12 = v10;
        uint64_t v10 = (void *)v11;
      }

      unsigned int v14 = [v15 textRangeFromPosition:v8 toPosition:v10];
      [v15 setSelectedTextRange:v14];

      double v5 = v15;
    }
  }
}

- (void)_moveCurrentSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = [(UITextInputController *)self _selectableText];
  if (v3)
  {
    id v14 = v5;
    BOOL v6 = [v5 selectedTextRange];

    double v5 = v14;
    if (v6)
    {
      NSUInteger v7 = [v14 selectedTextRange];
      int v8 = [v7 isEmpty];

      if (v8)
      {
        uint64_t v9 = [v14 selectedTextRange];
        uint64_t v10 = [v9 start];
      }
      else
      {
        uint64_t v11 = [v14 selectedTextRange];
        uint64_t v10 = [v11 end];

        if ((int)v3 < 1) {
          uint64_t v3 = (v3 + 1);
        }
        else {
          uint64_t v3 = (v3 - 1);
        }
      }
      int v12 = [(UITextInputController *)self _clampedpositionFromPosition:v10 offset:v3];

      uint64_t v13 = [v14 textRangeFromPosition:v12 toPosition:v12];
      if (v13) {
        [v14 setSelectedTextRange:v13];
      }

      double v5 = v14;
    }
  }
}

- (void)_expandSelectionToBackwardDeletionClusterWithReinsertionOut:(id *)a3
{
  id v24 = [(UITextInputController *)self _selectableText];
  int v4 = [v24 selectedTextRange];
  double v5 = [v4 start];
  BOOL v6 = [v4 end];
  id v7 = v5;
  if (!v4 || ([v4 isEmpty] & 1) != 0)
  {
    int v8 = &stru_1ED0E84C0;
    if (v7) {
      goto LABEL_4;
    }
LABEL_18:
    id v19 = 0;
    uint64_t v10 = 0;
    goto LABEL_29;
  }
  int v8 = [v24 textInRange:v4];
  if (!v7) {
    goto LABEL_18;
  }
LABEL_4:
  int v23 = a3;
  uint64_t v9 = v7;
  uint64_t v10 = v7;
  while (1)
  {
    uint64_t v11 = v8;
    uint64_t v12 = [(__CFString *)v11 length];
    if (v12)
    {
      uint64_t v13 = v12;
      [(__CFString *)v11 _rangeOfBackwardDeletionClusterAtIndex:[(__CFString *)v11 length] - 1];
      uint64_t v15 = v14;
      int v16 = v13 - v14;

      if (v13 != v15)
      {
        int v8 = v11;
        id v19 = v9;
        goto LABEL_20;
      }
    }
    else
    {

      int v16 = 0;
    }
    id v19 = v10;

    uint64_t v10 = [v24 positionFromPosition:v19 offset:-1];

    if (v10)
    {
      int v17 = [v24 textRangeFromPosition:v10 toPosition:v19];
      if (v17)
      {
        id v18 = [v24 textInRange:v17];
      }
      else
      {
        id v18 = 0;
      }
    }
    else
    {
      id v18 = 0;
      int v17 = 0;
    }
    if (!objc_msgSend(v18, "length", v23)) {
      break;
    }
    int v8 = [v18 stringByAppendingString:v11];

    uint64_t v9 = v19;
    if (!v10) {
      goto LABEL_20;
    }
  }

  uint64_t v10 = 0;
  int v8 = v11;
LABEL_20:
  id v20 = v24;
  if (v23 && v16 >= 1)
  {
    id v21 = v10;

    id *v23 = [(__CFString *)v8 substringToIndex:v16];
    id v20 = v24;
    id v19 = v21;
  }
  if (v19 != v7 && v19 && v6)
  {
    id v22 = [v20 textRangeFromPosition:v19 toPosition:v6];
    if (v22) {
      [v24 setSelectedTextRange:v22];
    }
  }
LABEL_29:
}

- (void)_expandSelectionToStartOfWordBeforeCaretSelection
{
}

- (void)_expandSelectionToStartOfWordsBeforeCaretSelection:(int)a3
{
  id v10 = [(UITextInputController *)self _selectableText];
  int v4 = [v10 selectedTextRange];
  double v5 = v4;
  if (a3 && v4)
  {
    BOOL v6 = [v4 start];
    id v7 = [v10 _positionAtStartOfWords:a3 beforePosition:v6];

    if (v7)
    {
      int v8 = [v5 end];
      uint64_t v9 = [v10 textRangeFromPosition:v7 toPosition:v8];
      [v10 setSelectedTextRange:v9];
    }
  }
}

- (id)_positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UITextInputController *)self _selectableText];
  int v8 = v7;
  if (a4 == 1)
  {
    uint64_t v9 = [v6 start];
    goto LABEL_7;
  }
  if (!a4)
  {
    uint64_t v9 = [v6 end];
LABEL_7:
    id v10 = (void *)v9;
    goto LABEL_8;
  }
  if (v6)
  {
    uint64_t v9 = [v7 positionWithinRange:v6 farthestInDirection:a4];
    goto LABEL_7;
  }
  id v10 = 0;
LABEL_8:

  return v10;
}

- (int64_t)_opposingDirectionFromDirection:(int64_t)a3
{
  int64_t result = a3;
  if ((unint64_t)a3 <= 5) {
    return qword_186B9AF70[a3];
  }
  return result;
}

- (id)_positionFromPosition:(id)a3 pastTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [(UITextInputController *)self _selectableText];
  if (v8)
  {
    uint64_t v10 = -3;
    while (!__CFADD__(v10++, 1))
    {
      uint64_t v12 = [v9 tokenizer];
      uint64_t v13 = [v12 positionFromPosition:v8 toBoundary:a4 inDirection:a5];

      if (!v13)
      {
        id v17 = 0;
        id v8 = 0;
        goto LABEL_12;
      }
      uint64_t v14 = [v9 tokenizer];
      if ([v14 isPosition:v13 atBoundary:a4 inDirection:a5])
      {

LABEL_11:
        id v17 = v13;
        id v8 = v17;
        goto LABEL_12;
      }
      uint64_t v15 = [v9 tokenizer];
      int v16 = objc_msgSend(v15, "isPosition:atBoundary:inDirection:", v13, a4, -[UITextInputController _opposingDirectionFromDirection:](self, "_opposingDirectionFromDirection:", a5));

      id v8 = v13;
      if (v16) {
        goto LABEL_11;
      }
    }
  }
  id v17 = 0;
LABEL_12:

  return v17;
}

- (id)_positionAtStartOfWords:(unint64_t)a3 beforePosition:(id)a4
{
  id v6 = a4;
  id v7 = [(UITextInputController *)self _selectableText];
  id v8 = v7;
  if (!a3 || !v6)
  {
    id v6 = v6;
    uint64_t v10 = v6;
    goto LABEL_13;
  }
  uint64_t v9 = [v7 tokenizer];
  uint64_t v10 = [v9 rangeEnclosingPosition:v6 withGranularity:1 inDirection:1];

  if (v10) {
    goto LABEL_4;
  }
  id v18 = [v8 tokenizer];
  id v19 = [v18 positionFromPosition:v6 toBoundary:1 inDirection:1];

  if (!v19)
  {
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  id v20 = [v8 tokenizer];
  uint64_t v10 = [v20 rangeEnclosingPosition:v19 withGranularity:1 inDirection:1];

  if (v10)
  {
LABEL_4:
    uint64_t v11 = [v10 start];

    if (a3 >= 2)
    {
      unint64_t v12 = a3 - 1;
      while (1)
      {
        uint64_t v13 = [v8 tokenizer];
        uint64_t v14 = [v13 positionFromPosition:v11 toBoundary:1 inDirection:1];

        if (!v14) {
          break;
        }
        uint64_t v15 = [v8 tokenizer];
        int v16 = [v15 positionFromPosition:v14 toBoundary:1 inDirection:1];

        if (!v16) {
          break;
        }

        uint64_t v11 = v16;
        if (!--v12) {
          goto LABEL_12;
        }
      }
    }
    int v16 = v11;
LABEL_12:
    id v6 = v16;

    uint64_t v10 = v6;
  }
LABEL_13:

  return v10;
}

- (void)_setCaretSelectionAtEndOfSelection
{
  id v7 = [(UITextInputController *)self _selectableText];
  double v2 = [v7 selectedTextRange];
  uint64_t v3 = v2;
  if (v2)
  {
    int v4 = [v2 end];
    double v5 = [v3 end];
    id v6 = [v7 textRangeFromPosition:v4 toPosition:v5];
    [v7 setSelectedTextRange:v6];
  }
}

- (void)_deleteByWord
{
  id v10 = [(UITextInputController *)self _selectableText];
  uint64_t v3 = [v10 selectedTextRange];
  int v4 = [v10 inputDelegate];
  [v4 textWillChange:v10];

  if ([v3 isEmpty])
  {
    double v5 = [v3 start];
    id v6 = [v10 _positionAtStartOfWords:1 beforePosition:v5];

    if (v6)
    {
      id v7 = [v3 end];
      uint64_t v8 = [v10 textRangeFromPosition:v6 toPosition:v7];

      uint64_t v3 = (void *)v8;
    }
  }
  [(UITextInputController *)self _deleteTextRange:v3];
  uint64_t v9 = [v10 inputDelegate];
  [v9 textDidChange:v10];
}

- (void)_deleteForwardByWord
{
  id v18 = [(UITextInputController *)self _selectableText];
  uint64_t v3 = [v18 selectedTextRange];
  int v4 = [v18 inputDelegate];
  [v4 textWillChange:v18];

  if ([v3 isEmpty])
  {
    double v5 = [(UITextInputController *)self _selectableText];
    id v6 = v5;
    if (v3)
    {
      id v7 = [v5 tokenizer];
      uint64_t v8 = [v3 end];
      uint64_t v9 = [v7 rangeEnclosingPosition:v8 withGranularity:1 inDirection:0];

      if (v9) {
        goto LABEL_4;
      }
      uint64_t v14 = [v6 tokenizer];
      uint64_t v15 = [v3 end];
      int v16 = [v14 positionFromPosition:v15 toBoundary:1 inDirection:0];

      if (v16)
      {
        id v17 = [v6 tokenizer];
        uint64_t v9 = [v17 rangeEnclosingPosition:v16 withGranularity:1 inDirection:0];

        if (v9)
        {
LABEL_4:
          id v10 = [v3 start];
          uint64_t v11 = [v9 end];
          uint64_t v12 = [v6 textRangeFromPosition:v10 toPosition:v11];

          uint64_t v3 = (void *)v12;
        }
      }
    }
  }
  [(UITextInputController *)self _deleteTextRange:v3];
  uint64_t v13 = [v18 inputDelegate];
  [v13 textDidChange:v18];
}

- (void)_deleteToStartOfLine
{
  id v13 = [(UITextInputController *)self _selectableText];
  uint64_t v3 = [v13 selectedTextRange];
  int v4 = [v13 inputDelegate];
  [v4 textWillChange:v13];

  if ([v3 isEmpty])
  {
    double v5 = [v13 tokenizer];
    id v6 = [v3 start];
    id v7 = [v5 positionFromPosition:v6 toBoundary:4 inDirection:1];

    if (v7)
    {
      uint64_t v8 = [v3 start];
      uint64_t v9 = [v13 comparePosition:v8 toPosition:v7];

      if (v9 == 1)
      {
        id v10 = [v3 start];
        uint64_t v11 = [v13 textRangeFromPosition:v7 toPosition:v10];

        uint64_t v3 = (void *)v11;
      }
    }
  }
  [(UITextInputController *)self _deleteTextRange:v3];
  uint64_t v12 = [v13 inputDelegate];
  [v12 textDidChange:v13];
}

- (void)_deleteToEndOfLine
{
  id v13 = [(UITextInputController *)self _selectableText];
  uint64_t v3 = [v13 selectedTextRange];
  int v4 = [v13 inputDelegate];
  [v4 textWillChange:v13];

  if ([v3 isEmpty])
  {
    double v5 = [v13 tokenizer];
    id v6 = [v3 end];
    id v7 = [v5 positionFromPosition:v6 toBoundary:4 inDirection:0];

    if (v7)
    {
      uint64_t v8 = [v3 end];
      uint64_t v9 = [v13 comparePosition:v7 toPosition:v8];

      if (v9 == 1)
      {
        id v10 = [v3 end];
        uint64_t v11 = [v13 textRangeFromPosition:v10 toPosition:v7];

        uint64_t v3 = (void *)v11;
      }
    }
  }
  [(UITextInputController *)self _deleteTextRange:v3];
  uint64_t v12 = [v13 inputDelegate];
  [v12 textDidChange:v13];
}

- (void)_deleteToEndOfParagraph
{
  id v13 = [(UITextInputController *)self _selectableText];
  uint64_t v3 = [v13 selectedTextRange];
  int v4 = [v13 inputDelegate];
  [v4 textWillChange:v13];

  if ([v3 isEmpty])
  {
    double v5 = [v13 tokenizer];
    id v6 = [v3 end];
    id v7 = [v5 positionFromPosition:v6 toBoundary:3 inDirection:0];

    if (v7)
    {
      uint64_t v8 = [v3 end];
      uint64_t v9 = [v13 comparePosition:v7 toPosition:v8];

      if (v9 == 1)
      {
        id v10 = [v3 end];
        uint64_t v11 = [v13 textRangeFromPosition:v10 toPosition:v7];

        uint64_t v3 = (void *)v11;
      }
    }
  }
  [(UITextInputController *)self _deleteTextRange:v3];
  uint64_t v12 = [v13 inputDelegate];
  [v12 textDidChange:v13];
}

- (void)_deleteTextRange:(id)a3
{
  id v4 = a3;
  id v9 = [(UITextInputController *)self _selectableText];
  double v5 = [v9 selectedTextRange];
  [v9 setSelectedTextRange:v4];

  id v6 = [v9 selectedTextRange];
  char v7 = [v6 isEmpty];

  if ((v7 & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      id v8 = v9;
      if ([v8 keyboardInputShouldDelete:v8]) {
        [v8 deleteBackward];
      }
      else {
        [v8 setSelectedTextRange:v5];
      }
    }
    else
    {
      [v9 deleteBackward];
    }
  }
}

- (void)_deleteBackwardAndNotify:(BOOL)a3
{
  id v3 = [(UITextInputController *)self _keyInput];
  [v3 deleteBackward];
}

- (void)_deleteForwardAndNotify:(BOOL)a3
{
  id v14 = [(UITextInputController *)self _selectableText];
  id v4 = [v14 selectedTextRange];
  double v5 = [v14 inputDelegate];
  [v5 textWillChange:v14];

  if ([v4 isEmpty])
  {
    id v6 = [v14 tokenizer];
    char v7 = [v4 end];
    id v8 = [v6 positionFromPosition:v7 toBoundary:0 inDirection:0];

    if (v8)
    {
      id v9 = [v4 end];
      uint64_t v10 = [v14 comparePosition:v8 toPosition:v9];

      if (v10 == 1)
      {
        uint64_t v11 = [v4 end];
        uint64_t v12 = [v14 textRangeFromPosition:v11 toPosition:v8];

        id v4 = (void *)v12;
      }
    }
  }
  [(UITextInputController *)self _deleteTextRange:v4];
  id v13 = [v14 inputDelegate];
  [v13 textDidChange:v14];
}

- (void)_transpose
{
  id v19 = [(UITextInputController *)self _selectableText];
  double v2 = [v19 selectedTextRange];
  if ([v2 isEmpty])
  {
    id v3 = [v19 inputDelegate];
    [v3 textWillChange:v19];

    id v4 = [v19 tokenizer];
    double v5 = [v2 start];
    id v6 = [v4 positionFromPosition:v5 toBoundary:0 inDirection:1];

    char v7 = [v19 tokenizer];
    id v8 = [v2 end];
    id v9 = [v7 positionFromPosition:v8 toBoundary:0 inDirection:0];

    if (v6 && v9)
    {
      uint64_t v10 = [v2 start];
      uint64_t v11 = [v19 textRangeFromPosition:v6 toPosition:v10];

      uint64_t v12 = [v2 end];
      id v13 = [v19 textRangeFromPosition:v12 toPosition:v9];

      if (v11 && v13)
      {
        id v14 = [v19 textInRange:v11];
        uint64_t v15 = [v19 textInRange:v13];
        int v16 = [v15 stringByAppendingString:v14];
        id v17 = [v19 textRangeFromPosition:v6 toPosition:v9];
        if (v17) {
          [v19 replaceRange:v17 withText:v16];
        }
      }
    }
    id v18 = [v19 inputDelegate];
    [v18 textDidChange:v19];
  }
}

- (void)_replaceCurrentWordWithText:(id)a3
{
  id v8 = a3;
  id v4 = [(UITextInputController *)self _selectableText];
  double v5 = [v4 selectedTextRange];
  id v6 = [v5 start];
  char v7 = [(UITextInputController *)self _rangeOfEnclosingWord:v6];

  if (v7) {
    [v4 replaceRange:v7 withText:v8];
  }
}

- (void)_replaceDocumentWithText:(id)a3
{
  id v7 = a3;
  id v4 = [(UITextInputController *)self _selectableText];
  double v5 = [(UITextInputController *)self _fullRange];
  id v6 = v5;
  if (v5)
  {
    if (([v5 isEmpty] & 1) == 0) {
      [v4 replaceRange:v6 withText:&stru_1ED0E84C0];
    }
    [v4 insertText:v7];
  }
}

- (void)_scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = [(UITextInputController *)self _selectableText];
  id v9 = [v11 textInputView];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v9 performSelector:sel__enclosingScrollerIncludingSelf];
    objc_msgSend(v10, "convertRect:fromView:", v9, x, y, width, height);
    objc_msgSend(v10, "scrollRectToVisible:animated:", v4);
  }
}

- (id)_normalizedStringForRangeComparison:(id)a3
{
  id v3 = [a3 _stringByReplacingCharacter:160 withCharacter:32];
  BOOL v4 = [v3 _stringByReplacingCharacter:8217 withCharacter:39];

  double v5 = [v4 _stringByReplacingCharacter:8216 withCharacter:39];

  return v5;
}

- (id)_rangeOfText:(id)a3 endingAtPosition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UITextInputController *)self _selectableText];
  if (![v6 length])
  {
    id v11 = [v8 textRangeFromPosition:v7 toPosition:v7];
    goto LABEL_30;
  }
  id v9 = [v8 _rangeOfEnclosingWord:v7];
  if (v9)
  {
    uint64_t v10 = [v8 textInRange:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (![v10 isEqualToString:v6])
  {
    id v13 = objc_msgSend(v8, "positionFromPosition:offset:", v7, -objc_msgSend(v6, "length"));
    if (!v13)
    {
      id v13 = [v8 beginningOfDocument];
    }
    id v14 = [v8 textRangeFromPosition:v13 toPosition:v7];

    if (v14)
    {
      uint64_t v15 = [v8 textInRange:v14];

      unint64_t v16 = [v15 length];
      if (v16 <= [v6 length])
      {
        id v12 = v14;
        uint64_t v10 = v15;
LABEL_25:
        id v21 = [(UITextInputController *)self _normalizedStringForRangeComparison:v10];
        id v22 = [(UITextInputController *)self _normalizedStringForRangeComparison:v6];
        if ([v21 isEqualToString:v22]) {
          id v11 = v12;
        }
        else {
          id v11 = 0;
        }

        goto LABEL_29;
      }
      unsigned int v17 = 0;
      while (1)
      {
        id v18 = v13;
        id v13 = [v8 positionFromPosition:v13 offset:1];

        if (!v13) {
          break;
        }
        if ([v8 comparePosition:v13 toPosition:v7] != -1)
        {

          break;
        }
        id v12 = [v8 textRangeFromPosition:v13 toPosition:v7];

        if (!v12) {
          goto LABEL_24;
        }
        uint64_t v10 = [v8 textInRange:v12];

        unint64_t v19 = [v10 length];
        if (v19 > [v6 length])
        {
          id v14 = v12;
          uint64_t v15 = v10;
          if (v17++ < 9) {
            continue;
          }
        }
        goto LABEL_25;
      }

      id v13 = 0;
    }
    else
    {
      uint64_t v15 = v10;
    }
LABEL_24:

    id v12 = 0;
    uint64_t v10 = 0;
    goto LABEL_25;
  }
  id v12 = v9;
  id v11 = v12;
LABEL_29:

LABEL_30:
  return v11;
}

- (id)_rangeOfTextUnit:(int64_t)a3 enclosingPosition:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(UITextInputController *)self _selectableText];
    id v8 = [v7 tokenizer];
    id v9 = [v8 rangeEnclosingPosition:v6 withGranularity:a3 inDirection:0];

    if (!v9)
    {
      uint64_t v10 = [v7 tokenizer];
      id v9 = [v10 rangeEnclosingPosition:v6 withGranularity:a3 inDirection:1];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_rangeOfEnclosingWord:(id)a3
{
  return [(UITextInputController *)self _rangeOfTextUnit:1 enclosingPosition:a3];
}

- (id)_rangeOfLineEnclosingPosition:(id)a3
{
  return [(UITextInputController *)self _rangeOfTextUnit:4 enclosingPosition:a3];
}

- (id)_rangeOfSentenceEnclosingPosition:(id)a3
{
  return [(UITextInputController *)self _rangeOfTextUnit:2 enclosingPosition:a3];
}

- (id)_rangeOfParagraphEnclosingPosition:(id)a3
{
  return [(UITextInputController *)self _rangeOfTextUnit:3 enclosingPosition:a3];
}

- (id)_fullRange
{
  double v2 = [(UITextInputController *)self _selectableText];
  id v3 = [v2 beginningOfDocument];
  BOOL v4 = [v2 endOfDocument];
  double v5 = [v2 textRangeFromPosition:v3 toPosition:v4];

  return v5;
}

- (id)_rangeSpanningTextUnit:(int64_t)a3 andPosition:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_17;
  }
  id v7 = [(UITextInputController *)self _selectableText];
  id v8 = [(UITextInputController *)self _rangeOfTextUnit:a3 enclosingPosition:v6];
  if (!v8)
  {
    id v9 = [v7 tokenizer];
    uint64_t v10 = 1;
    uint64_t v11 = [v9 positionFromPosition:v6 toBoundary:a3 inDirection:1];

    id v12 = (void *)v11;
    if (!v11)
    {
      id v13 = [v7 tokenizer];
      id v12 = [v13 positionFromPosition:v6 toBoundary:a3 inDirection:0];

      if (!v12)
      {
        uint64_t v15 = 0;
        goto LABEL_11;
      }
      uint64_t v10 = 0;
    }
    id v14 = [v7 tokenizer];
    uint64_t v15 = [v14 rangeEnclosingPosition:v12 withGranularity:a3 inDirection:v10];

    if (v11)
    {
      unint64_t v16 = [v15 start];
      if (v16)
      {
        unsigned int v17 = v7;
        id v18 = v16;
        id v19 = v6;
LABEL_13:
        id v8 = [v17 textRangeFromPosition:v18 toPosition:v19];
LABEL_15:

        goto LABEL_16;
      }
      goto LABEL_14;
    }
LABEL_11:
    unint64_t v16 = [v15 end];
    if (v16)
    {
      unsigned int v17 = v7;
      id v18 = v6;
      id v19 = v16;
      goto LABEL_13;
    }
LABEL_14:
    id v8 = 0;
    goto LABEL_15;
  }
LABEL_16:

LABEL_17:
  return v8;
}

- (BOOL)_range:(id)a3 containsRange:(id)a4
{
  id v6 = a4;
  NSUInteger v7 = [(UITextInputController *)self _nsrangeForTextRange:a3];
  NSUInteger v9 = v8;
  NSUInteger v10 = [(UITextInputController *)self _nsrangeForTextRange:v6];
  NSUInteger v12 = v11;

  if (!v12) {
    return v10 >= v7 && v10 - v7 < v9;
  }
  v17.NSUInteger location = v7;
  v17.NSUInteger length = v9;
  v18.NSUInteger location = v10;
  v18.NSUInteger length = v12;
  NSRange v13 = NSIntersectionRange(v17, v18);
  return v10 == v13.location && v12 == v13.length;
}

- (BOOL)_range:(id)a3 intersectsRange:(id)a4
{
  id v6 = a4;
  NSUInteger v7 = [(UITextInputController *)self _nsrangeForTextRange:a3];
  NSUInteger v9 = v8;
  NSUInteger v10 = [(UITextInputController *)self _nsrangeForTextRange:v6];
  NSUInteger v12 = v11;

  v14.NSUInteger location = v7;
  v14.NSUInteger length = v9;
  v15.NSUInteger location = v10;
  v15.NSUInteger length = v12;
  return NSIntersectionRange(v14, v15).length != 0;
}

- (id)_intersectionOfRange:(id)a3 andRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSUInteger v8 = self;
  NSUInteger v9 = [v6 start];
  NSUInteger v10 = [v7 start];
  if ([(UITextInputController *)v8 comparePosition:v9 toPosition:v10] == 1) {
    NSUInteger v11 = v6;
  }
  else {
    NSUInteger v11 = v7;
  }
  NSUInteger v12 = [v11 start];

  NSRange v13 = [v6 end];
  NSRange v14 = [v7 end];
  if ([(UITextInputController *)v8 comparePosition:v13 toPosition:v14] == -1) {
    NSRange v15 = v6;
  }
  else {
    NSRange v15 = v7;
  }
  unint64_t v16 = [v15 end];

  NSRange v17 = [(UITextInputController *)v8 textRangeFromPosition:v12 toPosition:v16];

  return v17;
}

- (BOOL)_range:(id)a3 isEqualToRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  NSUInteger v8 = v7;
  if (v6 == v7)
  {
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
    if (v6 && v7)
    {
      NSUInteger v10 = self;
      NSUInteger v11 = [v6 start];
      NSUInteger v12 = [v8 start];
      uint64_t v13 = [(UITextInputController *)v10 comparePosition:v11 toPosition:v12];

      NSRange v14 = [v6 end];
      NSRange v15 = [v8 end];
      uint64_t v16 = v13 | [(UITextInputController *)v10 comparePosition:v14 toPosition:v15];

      BOOL v9 = v16 == 0;
    }
  }

  return v9;
}

- (id)_findBoundaryPositionClosestToPosition:(id)a3 withGranularity:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 5)
  {
    id v8 = [(UITextInputController *)self _findDocumentBoundaryFromPosition:v6];
  }
  else if (a4 == 1)
  {
    id v8 = [(UITextInputController *)self _findPleasingWordBoundaryFromPosition:v6];
  }
  else
  {
    id v8 = v6;
  }
  BOOL v9 = v8;

  return v9;
}

- (id)_findPleasingWordBoundaryFromPosition:(id)a3
{
  id v4 = a3;
  double v5 = [(UITextInputController *)self _selectableText];
  id v6 = [v5 tokenizer];
  if ([v6 isPosition:v4 atBoundary:4 inDirection:0]) {
    goto LABEL_2;
  }
  int v9 = [v6 isPosition:v4 withinTextUnit:1 inDirection:0];
  NSUInteger v10 = [v5 tokenizer];
  NSUInteger v11 = v10;
  if (v9)
  {
    NSUInteger v12 = [v10 rangeEnclosingPosition:v4 withGranularity:1 inDirection:0];

    uint64_t v13 = [v12 start];
    int v14 = [v5 offsetFromPosition:v13 toPosition:v4];

    if (v14 > 1) {
      [v12 end];
    }
    else {
    id v8 = [v12 start];
    }

    goto LABEL_12;
  }
  int v15 = [v10 isPosition:v4 atBoundary:1 inDirection:1];

  if (v15)
  {
LABEL_2:
    id v7 = v4;
LABEL_3:
    id v8 = v7;
    goto LABEL_12;
  }
  uint64_t v16 = [v5 tokenizer];
  id v8 = [v16 positionFromPosition:v4 toBoundary:1 inDirection:0];

  if (!v8)
  {
    id v7 = [v5 endOfDocument];
    goto LABEL_3;
  }
LABEL_12:

  return v8;
}

- (id)_findDocumentBoundaryFromPosition:(id)a3
{
  id v4 = a3;
  double v5 = [(UITextInputController *)self _selectableText];
  id v6 = [v5 beginningOfDocument];
  id v7 = [v5 endOfDocument];
  uint64_t v8 = [v5 offsetFromPosition:v6 toPosition:v4];
  uint64_t v9 = [v5 offsetFromPosition:v4 toPosition:v7];

  if (v8 <= v9) {
    NSUInteger v10 = v6;
  }
  else {
    NSUInteger v10 = v7;
  }
  id v11 = v10;

  return v11;
}

- (id)_underlineRectsByDocumentLineForSelectionRange:(id)a3
{
  id v4 = a3;
  double v5 = [(UITextInputController *)self _selectableText];
  id v6 = [v5 tokenizer];
  id v7 = [v4 start];
  uint64_t v8 = [v6 rangeEnclosingPosition:v7 withGranularity:4 inDirection:0];

  uint64_t v9 = [v4 end];
  NSUInteger v10 = [v6 rangeEnclosingPosition:v9 withGranularity:4 inDirection:0];

  if (!v8
    || !v10
    || ([v8 isEmpty] & 1) != 0
    || ([v10 isEmpty] & 1) != 0
    || ([v8 isEqual:v10] & 1) != 0)
  {
    goto LABEL_9;
  }
  id v11 = [v8 start];
  NSUInteger v12 = [v10 start];
  if ([v11 isEqual:v12])
  {

LABEL_9:
    int v15 = [v5 selectionRectsForRange:v4];
    goto LABEL_10;
  }
  uint64_t v13 = [v8 end];
  int v14 = [v10 end];
  int v28 = [v13 isEqual:v14];

  if (v28) {
    goto LABEL_9;
  }
  int v15 = objc_opt_new();
  NSRange v17 = [v4 start];
  NSRange v18 = [v8 end];
  uint64_t v19 = [v5 textRangeFromPosition:v17 toPosition:v18];

  double v29 = (void *)v19;
  [(UITextInputController *)self _updateSelectedRects:v15 byTrimmingWhitespaceInRange:v19 inDocument:v5];
  id v20 = [v8 end];
  id v21 = [v6 rangeEnclosingPosition:v20 withGranularity:4 inDirection:0];

  if (v21)
  {
    while (([v21 isEqual:v10] & 1) == 0)
    {
      id v22 = [v21 end];
      int v23 = [v6 rangeEnclosingPosition:v22 withGranularity:4 inDirection:0];

      if ([v23 isEqual:v21])
      {

        break;
      }
      id v24 = [v5 selectionRectsForRange:v21];
      [v15 addObjectsFromArray:v24];

      id v21 = v23;
      if (!v23) {
        break;
      }
    }
  }
  uint64_t v25 = [v10 start];
  uint64_t v26 = [v4 end];
  double v27 = [v5 textRangeFromPosition:v25 toPosition:v26];

  if (v27) {
    [(UITextInputController *)self _updateSelectedRects:v15 byTrimmingWhitespaceInRange:v27 inDocument:v5];
  }

LABEL_10:
  return v15;
}

- (void)_updateSelectedRects:(id)a3 byTrimmingWhitespaceInRange:(id)a4 inDocument:(id)a5
{
  id v18 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v7)
  {
    NSUInteger v10 = [v8 textInRange:v7];
    id v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    NSUInteger v12 = [v10 stringByTrimmingCharactersInSet:v11];

    if ([v12 length])
    {
      uint64_t v13 = [v7 start];
      int v14 = objc_msgSend(v9, "positionFromPosition:offset:", v13, objc_msgSend(v12, "length"));

      int v15 = [v7 start];
      uint64_t v16 = [v9 textRangeFromPosition:v15 toPosition:v14];

      if (v16)
      {
        NSRange v17 = [v9 selectionRectsForRange:v16];
        [v18 addObjectsFromArray:v17];
      }
    }
  }
}

- (id)_rangeOfSmartSelectionIncludingRange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(UITextInputController *)self _selectableText];
    id v6 = v4;
    id v7 = [v5 tokenizer];
    id v8 = [v6 start];
    uint64_t v9 = [v7 positionFromPosition:v8 toBoundary:2 inDirection:1];
    NSUInteger v10 = v9;
    id v58 = v4;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v5 beginningOfDocument];
    }
    NSUInteger v12 = v11;

    uint64_t v13 = [v6 start];
    uint64_t v14 = [v5 offsetFromPosition:v12 toPosition:v13];

    if (v14 >= 65)
    {
      int v15 = [v6 start];
      uint64_t v16 = [v5 positionFromPosition:v15 offset:-64];

      NSUInteger v12 = [v7 positionFromPosition:v16 toBoundary:1 inDirection:0];

      if (!v12)
      {
        NSRange v17 = [v6 start];
        id v18 = [v5 positionFromPosition:v17 offset:-64];

        NSUInteger v12 = [v7 positionFromPosition:v18 toBoundary:0 inDirection:0];
      }
      uint64_t v19 = [v6 start];
      uint64_t v20 = [v5 comparePosition:v12 toPosition:v19];

      if (v20 == 1)
      {
        id v21 = [v6 start];
        id v22 = [v7 positionFromPosition:v21 toBoundary:0 inDirection:1];
        int v23 = v22;
        if (v22)
        {
          id v24 = v22;
        }
        else
        {
          id v24 = [v6 start];
        }
        id v25 = v24;

        NSUInteger v12 = v25;
      }
    }
    uint64_t v26 = [v6 end];
    double v27 = [v7 positionFromPosition:v26 toBoundary:2 inDirection:0];
    int v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      id v29 = [v5 endOfDocument];
    }
    double v30 = v29;

    double v31 = [v6 end];
    uint64_t v32 = [v5 offsetFromPosition:v31 toPosition:v30];

    if (v32 >= 65)
    {
      double v33 = [v6 end];
      double v34 = [v5 positionFromPosition:v33 offset:64];

      double v30 = [v7 positionFromPosition:v34 toBoundary:1 inDirection:1];

      if (!v30)
      {
        double v35 = [v6 end];
        double v36 = [v5 positionFromPosition:v35 offset:64];

        double v30 = [v7 positionFromPosition:v36 toBoundary:0 inDirection:1];
      }
      id v37 = [v6 end];
      uint64_t v38 = [v5 comparePosition:v37 toPosition:v30];

      if (v38 == 1)
      {
        uint64_t v39 = [v6 end];
        double v40 = [v7 positionFromPosition:v39 toBoundary:0 inDirection:0];
        double v41 = v40;
        if (v40)
        {
          id v42 = v40;
        }
        else
        {
          id v42 = [v6 end];
        }
        id v43 = v42;

        double v30 = v43;
      }
    }
    v57 = v7;
    v59 = [v5 textRangeFromPosition:v12 toPosition:v30];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (uint64_t v44 = [v5 keyboardType], v45 = 420, v44 != 3) && v44 != 10 && v44 != 120)
    {
      uint64_t v45 = 428;
    }
    double v46 = [v5 beginningOfDocument];
    v56 = v12;
    int v47 = [v5 offsetFromPosition:v46 toPosition:v12];

    uint64_t v48 = [(UITextInputController *)self _nsrangeForTextRange:v6];
    uint64_t v50 = v49;
    double v51 = [v5 textInRange:v59];
    uint64_t v61 = 0;
    id v62 = &v61;
    uint64_t v63 = 0x3010000000;
    id v64 = &unk_186D7DBA7;
    long long v65 = xmmword_186B93450;
    double v52 = +[UIKeyboardImpl activeInstance];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __84__UITextInputController_UITextInput_Internal___rangeOfSmartSelectionIncludingRange___block_invoke;
    v60[3] = &unk_1E52FEBF0;
    v60[4] = &v61;
    objc_msgSend(v52, "smartSelectionForTextInDocument:inRange:options:completion:", v51, v48 - v47, v50, v45, v60);

    uint64_t v53 = v62[4];
    if (v53 != 0x7FFFFFFFFFFFFFFFLL && v62[5])
    {
      v62[4] = v53 + v47;
      uint64_t v54 = -[UITextInputController _textRangeFromNSRange:](self, "_textRangeFromNSRange:");

      id v6 = (id)v54;
    }
    _Block_object_dispose(&v61, 8);

    id v4 = v58;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __84__UITextInputController_UITextInput_Internal___rangeOfSmartSelectionIncludingRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v3 + 32) = a2;
  *(void *)(v3 + 40) = a3;
  return result;
}

- (id)_clampedpositionFromPosition:(id)a3 offset:(int)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!a4)
  {
    id v10 = v6;
    goto LABEL_10;
  }
  id v8 = [(UITextInputController *)self _selectableText];
  uint64_t v9 = v8;
  if (a4 < 1)
  {
    id v10 = [v8 positionFromPosition:v7 offset:a4];
    if (!v10)
    {
      uint64_t v11 = [v9 beginningOfDocument];
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = [v8 positionFromPosition:v7 offset:a4];
    if (!v10)
    {
      uint64_t v11 = [v9 endOfDocument];
LABEL_8:
      id v10 = (id)v11;
    }
  }

LABEL_10:
  return v10;
}

- (id)_rangeFromCurrentRangeWithDelta:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double v5 = [(UITextInputController *)self _selectableText];
  id v6 = [v5 selectedTextRange];
  id v7 = v6;
  if (location | length)
  {
    NSUInteger v9 = length + location;
    id v10 = [v6 start];
    uint64_t v11 = [v7 end];
    if (location)
    {
      uint64_t v12 = [v5 positionFromPosition:v10 offset:location];

      id v10 = (void *)v12;
      if (!v12)
      {
        if ((location & 0x8000000000000000) != 0) {
          [v5 beginningOfDocument];
        }
        else {
        id v10 = [v5 endOfDocument];
        }
      }
    }
    if (v9)
    {
      uint64_t v13 = [v5 positionFromPosition:v11 offset:v9];

      uint64_t v11 = (void *)v13;
      if (!v13)
      {
        if ((v9 & 0x8000000000000000) != 0)
        {
          id v14 = v10;
        }
        else
        {
          id v14 = [v5 endOfDocument];
        }
        uint64_t v11 = v14;
      }
    }
    uint64_t v15 = [v5 textRangeFromPosition:v10 toPosition:v11];
    uint64_t v16 = (void *)v15;
    if (v15) {
      NSRange v17 = (void *)v15;
    }
    else {
      NSRange v17 = v7;
    }
    id v8 = v17;
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (id)_textColorForCaretSelection
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(UITextInputController *)self textColorForCaretSelection];
  }
  else
  {
    id v4 = [(UITextInputController *)self _selectableText];
    if (objc_opt_respondsToSelector())
    {
      double v5 = [v4 selectedTextRange];
      id v6 = [v5 end];

      if (v6)
      {
        id v7 = [v4 endOfDocument];
        if (v7 && [v4 comparePosition:v7 toPosition:v6] == -1)
        {
          id v8 = v7;

          id v6 = v8;
        }
        NSUInteger v9 = [v4 textStylingAtPosition:v6 inDirection:0];
      }
      else
      {
        NSUInteger v9 = 0;
      }
      if (dyld_program_sdk_at_least()) {
        id v10 = *(__CFString **)off_1E52D2048;
      }
      else {
        id v10 = @"UITextInputTextColorKey";
      }
      uint64_t v3 = [v9 objectForKey:v10];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (id)_fontForCaretSelection
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(UITextInputController *)self fontForCaretSelection];
  }
  else
  {
    id v4 = [(UITextInputController *)self _selectableText];
    if (objc_opt_respondsToSelector())
    {
      double v5 = [v4 selectedTextRange];
      id v6 = [v5 end];

      if (v6)
      {
        id v7 = [v4 endOfDocument];
        if (v7 && [v4 comparePosition:v7 toPosition:v6] == -1)
        {
          id v8 = v7;

          id v6 = v8;
        }
        NSUInteger v9 = [v4 textStylingAtPosition:v6 inDirection:0];
      }
      else
      {
        NSUInteger v9 = 0;
      }
      if (dyld_program_sdk_at_least()) {
        id v10 = *(__CFString **)off_1E52D2040;
      }
      else {
        id v10 = @"UITextInputTextFontKey";
      }
      uint64_t v3 = [v9 objectForKey:v10];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (void)_updateSelectionWithTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UITextInputController *)self _selectableText];
  [v7 _setSelectedTextRange:v6 withAffinityDownstream:v4];
}

- (id)_setSelectionRangeWithHistory:(id)a3
{
  id v4 = a3;
  double v5 = [(UITextInputController *)self _selectableText];
  id v6 = [v4 cursor];

  if (!v6) {
    goto LABEL_19;
  }
  if ([v4 anchor] == 1)
  {
    id v7 = [v4 cursor];
LABEL_5:
    [v4 setEnd:v7];
    goto LABEL_6;
  }
  int v8 = [v4 anchor];
  id v7 = [v4 cursor];
  [v4 setStart:v7];
  if (v8 != 2) {
    goto LABEL_5;
  }
LABEL_6:

  NSUInteger v9 = [v4 start];
  id v10 = [v4 end];
  uint64_t v11 = [v5 comparePosition:v9 toPosition:v10];

  if (v11 >= 1)
  {
    if ([v4 anchor] == 1) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    [v4 setAnchor:v12];
  }
  uint64_t v13 = [v4 start];
  id v14 = [v4 end];
  uint64_t v15 = [v5 textRangeFromPosition:v13 toPosition:v14];

  -[UITextInputController _updateSelectionWithTextRange:withAffinityDownstream:](self, "_updateSelectionWithTextRange:withAffinityDownstream:", v15, [v4 affinityDownstream]);
  if ([v4 anchor])
  {
    if ([v4 anchor] == 1) {
      [v5 _lastRectForRange:v15];
    }
    else {
      [v5 firstRectForRange:v15];
    }
    objc_msgSend(v5, "_scrollRectToVisible:animated:", 0);
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v17 = *MEMORY[0x1E4FB6E78];
    id v18 = [(UITextInputController *)self webView];
    [v16 postNotificationName:v17 object:v18];
  }
LABEL_19:

  return v4;
}

- (id)_setHistory:(id)a3 withExtending:(BOOL)a4 withAnchor:(int)a5 withAffinityDownstream:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  id v10 = (UITextInputArrowKeyHistory *)a3;
  if (v10)
  {
    uint64_t v11 = v10;
    if (!v8) {
      [(UITextInputArrowKeyHistory *)v10 setAnchor:0];
    }
  }
  else
  {
    uint64_t v11 = objc_alloc_init(UITextInputArrowKeyHistory);
  }
  uint64_t v12 = [(UITextInputController *)self _selectableText];
  uint64_t v13 = [v12 selectedTextRange];
  id v14 = [v13 start];
  [(UITextInputArrowKeyHistory *)v11 setStart:v14];

  uint64_t v15 = [v12 selectedTextRange];
  uint64_t v16 = [v15 end];
  [(UITextInputArrowKeyHistory *)v11 setEnd:v16];

  int v17 = [(UITextInputArrowKeyHistory *)v11 anchor];
  id v18 = [v12 selectedTextRange];
  uint64_t v19 = v18;
  if (v7 == 2)
  {
    if (v17 == 1)
    {
LABEL_7:
      uint64_t v20 = [v18 end];
      goto LABEL_10;
    }
  }
  else if (v17 != 2)
  {
    goto LABEL_7;
  }
  uint64_t v20 = [v18 start];
LABEL_10:
  id v21 = (void *)v20;
  [(UITextInputArrowKeyHistory *)v11 setCursor:v20];

  id v22 = [(UITextInputArrowKeyHistory *)v11 startPosition];

  if (!v22)
  {
    int v23 = [(UITextInputArrowKeyHistory *)v11 cursor];
    [(UITextInputArrowKeyHistory *)v11 setStartPosition:v23];

    if (v8) {
      goto LABEL_12;
    }
LABEL_16:
    uint64_t v7 = 0;
LABEL_17:
    [(UITextInputArrowKeyHistory *)v11 setAnchor:v7];
    goto LABEL_18;
  }
  if (!v8) {
    goto LABEL_16;
  }
LABEL_12:
  if (![(UITextInputArrowKeyHistory *)v11 anchor]
    || [(UITextInputController *)self _isEmptySelection])
  {
    goto LABEL_17;
  }
LABEL_18:
  [(UITextInputArrowKeyHistory *)v11 setAffinityDownstream:v6];

  return v11;
}

- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    NSUInteger v9 = [(UITextInputController *)self _setHistory:v6 withExtending:v4 withAnchor:2 withAffinityDownstream:1];

    [v9 setAmount:0];
    id v10 = [v7 tokenizer];
    uint64_t v11 = [v9 cursor];
    char v12 = [v10 isPosition:v11 withinTextUnit:1 inDirection:1];

    if (v12)
    {
LABEL_7:
      id v22 = [v7 tokenizer];
      int v23 = [v9 cursor];
      id v24 = [v22 positionFromPosition:v23 toBoundary:1 inDirection:1];
      [v9 setCursor:v24];

      id v25 = [v9 cursor];
      [v9 setStartPosition:v25];

      uint64_t v26 = [(UITextInputController *)self _setSelectionRangeWithHistory:v9];
      goto LABEL_9;
    }
    uint64_t v13 = [v7 tokenizer];
    id v14 = [v9 cursor];
    uint64_t v15 = [v13 positionFromPosition:v14 toBoundary:1 inDirection:1];

    if (v15)
    {
LABEL_4:
      uint64_t v16 = [v7 tokenizer];
      int v17 = [v9 cursor];
      char v18 = [v16 isPosition:v17 withinTextUnit:1 inDirection:1];

      if ((v18 & 1) == 0)
      {
        uint64_t v19 = [v7 tokenizer];
        uint64_t v20 = [v9 cursor];
        id v21 = [v19 positionFromPosition:v20 toBoundary:1 inDirection:1];
        [v9 setCursor:v21];
      }
      goto LABEL_7;
    }
    uint64_t v15 = [v9 cursor];
    int v28 = 0;
    while (1)
    {
      id v29 = [v7 beginningOfDocument];
      uint64_t v30 = [v7 comparePosition:v29 toPosition:v15];

      if (!v30) {
        break;
      }
      if (v28 && ![v7 comparePosition:v28 toPosition:v15])
      {
        double v35 = [v7 beginningOfDocument];
        [v9 setCursor:v35];

        double v36 = [v9 cursor];
        [v9 setStartPosition:v36];

        break;
      }
      id v31 = v15;

      uint64_t v32 = [v7 tokenizer];
      uint64_t v15 = [v32 positionFromPosition:v31 toBoundary:3 inDirection:1];

      double v33 = [v7 tokenizer];
      char v34 = [v33 isPosition:v15 atBoundary:3 inDirection:1];

      int v28 = v31;
      if ((v34 & 1) == 0)
      {
        [v9 setCursor:v15];

        goto LABEL_4;
      }
    }
    uint64_t v26 = [(UITextInputController *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    uint64_t v26 = 0;
    NSUInteger v9 = v6;
  }
LABEL_9:

  return v26;
}

- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    NSUInteger v9 = [(UITextInputController *)self _setHistory:v6 withExtending:v4 withAnchor:1 withAffinityDownstream:1];

    [v9 setAmount:0];
    id v10 = [v7 tokenizer];
    uint64_t v11 = [v9 cursor];
    char v12 = [v10 isPosition:v11 withinTextUnit:1 inDirection:0];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [v7 tokenizer];
      id v14 = [v9 cursor];
      uint64_t v15 = [v13 positionFromPosition:v14 toBoundary:1 inDirection:0];

      if (v15) {
        [v9 setCursor:v15];
      }
    }
    uint64_t v16 = [v7 tokenizer];
    int v17 = [v9 cursor];
    char v18 = [v16 positionFromPosition:v17 toBoundary:1 inDirection:0];
    [v9 setCursor:v18];

    uint64_t v19 = [v9 cursor];

    if (!v19)
    {
      uint64_t v20 = [v7 endOfDocument];
      [v9 setCursor:v20];
    }
    id v21 = [v9 cursor];
    [v9 setStartPosition:v21];

    id v22 = [(UITextInputController *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    id v22 = 0;
    NSUInteger v9 = v6;
  }

  return v22;
}

- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (!v8)
  {
    int v17 = 0;
    id v10 = v6;
    goto LABEL_11;
  }
  char v9 = [v6 affinityDownstream];
  id v10 = [(UITextInputController *)self _setHistory:v6 withExtending:v4 withAnchor:2 withAffinityDownstream:1];

  [v10 setAmount:0];
  uint64_t v11 = [v7 tokenizer];
  char v12 = [v7 selectedTextRange];
  uint64_t v13 = [v12 end];
  if (([v11 isPosition:v13 atBoundary:3 inDirection:1] & 1) == 0)
  {
    if (v9)
    {
      id v14 = [v7 tokenizer];
      uint64_t v15 = [v10 cursor];
      char v16 = [v14 isPosition:v15 atBoundary:4 inDirection:1];

      if (v16) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v11 = [v7 tokenizer];
    char v12 = [v10 cursor];
    uint64_t v13 = [v11 positionFromPosition:v12 toBoundary:4 inDirection:1];
    [v10 setCursor:v13];
  }

LABEL_10:
  char v18 = [v10 cursor];
  [v10 setStartPosition:v18];

  int v17 = [(UITextInputController *)self _setSelectionRangeWithHistory:v10];
LABEL_11:

  return v17;
}

- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (!v8)
  {
    id v14 = 0;
    id v10 = v6;
    goto LABEL_10;
  }
  int v9 = [v6 affinityDownstream];
  id v10 = [(UITextInputController *)self _setHistory:v6 withExtending:v4 withAnchor:1 withAffinityDownstream:0];

  [v10 setAmount:0];
  uint64_t v11 = [v7 tokenizer];
  char v12 = [v7 selectedTextRange];
  uint64_t v13 = [v12 end];
  if ([v11 isPosition:v13 atBoundary:3 inDirection:0]) {
    goto LABEL_8;
  }
  if (v9)
  {

LABEL_7:
    uint64_t v11 = [v7 tokenizer];
    char v12 = [v10 cursor];
    uint64_t v13 = [v11 positionFromPosition:v12 toBoundary:4 inDirection:0];
    [v10 setCursor:v13];
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v15 = [v7 tokenizer];
  char v16 = [v10 cursor];
  char v17 = [v15 isPosition:v16 atBoundary:4 inDirection:0];

  if ((v17 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_9:
  char v18 = [v10 cursor];
  [v10 setStartPosition:v18];

  id v14 = [(UITextInputController *)self _setSelectionRangeWithHistory:v10];
LABEL_10:

  return v14;
}

- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    int v9 = [(UITextInputController *)self _setHistory:v6 withExtending:v4 withAnchor:2 withAffinityDownstream:1];

    [v9 setAmount:0];
    id v10 = [v7 tokenizer];
    uint64_t v11 = [v9 cursor];
    int v12 = [v10 isPosition:v11 atBoundary:3 inDirection:1];

    if (v12)
    {
      uint64_t v13 = [v9 cursor];
      id v14 = [v10 positionFromPosition:v13 toBoundary:0 inDirection:1];

      if (v14) {
        [v9 setCursor:v14];
      }
    }
    uint64_t v15 = [v9 cursor];
    char v16 = [v10 positionFromPosition:v15 toBoundary:3 inDirection:1];
    [v9 setCursor:v16];

    char v17 = [v9 cursor];
    [v9 setStartPosition:v17];

    char v18 = [(UITextInputController *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    char v18 = 0;
    int v9 = v6;
  }

  return v18;
}

- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    int v9 = [(UITextInputController *)self _setHistory:v6 withExtending:v4 withAnchor:1 withAffinityDownstream:0];

    [v9 setAmount:0];
    id v10 = [v7 tokenizer];
    uint64_t v11 = [v9 cursor];
    int v12 = [v10 isPosition:v11 atBoundary:3 inDirection:0];

    if (v12)
    {
      uint64_t v13 = [v9 cursor];
      id v14 = [v10 positionFromPosition:v13 toBoundary:0 inDirection:0];

      if (v14) {
        [v9 setCursor:v14];
      }
    }
    uint64_t v15 = [v9 cursor];
    char v16 = [v10 positionFromPosition:v15 toBoundary:3 inDirection:0];
    [v9 setCursor:v16];

    char v17 = [v9 cursor];
    [v9 setStartPosition:v17];

    char v18 = [(UITextInputController *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    char v18 = 0;
    int v9 = v6;
  }

  return v18;
}

- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    int v9 = [(UITextInputController *)self _setHistory:v6 withExtending:v4 withAnchor:2 withAffinityDownstream:1];

    [v9 setAmount:0];
    id v10 = [v7 beginningOfDocument];
    [v9 setCursor:v10];

    uint64_t v11 = [v9 cursor];
    [v9 setStartPosition:v11];

    int v12 = [(UITextInputController *)self _setSelectionRangeWithHistory:v9];
    id v6 = v9;
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    int v9 = [(UITextInputController *)self _setHistory:v6 withExtending:v4 withAnchor:1 withAffinityDownstream:0];

    [v9 setAmount:0];
    id v10 = [v7 endOfDocument];
    [v9 setCursor:v10];

    uint64_t v11 = [v9 cursor];
    [v9 setStartPosition:v11];

    int v12 = [v7 tokenizer];
    uint64_t v13 = [v9 cursor];
    int v14 = [v12 isPosition:v13 atBoundary:4 inDirection:3];

    if (v14) {
      [v9 setAffinityDownstream:1];
    }
    uint64_t v15 = [(UITextInputController *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    uint64_t v15 = 0;
    int v9 = v6;
  }

  return v15;
}

- (id)_moveUp:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    if (v6) {
      uint64_t v9 = [v6 affinityDownstream];
    }
    else {
      uint64_t v9 = [(UITextInputController *)self _selectionAffinity] == 0;
    }
    uint64_t v11 = [(UITextInputController *)self _setHistory:v6 withExtending:v4 withAnchor:2 withAffinityDownstream:v9];

    objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
    int v12 = [v11 cursor];
    uint64_t v13 = [v7 beginningOfDocument];
    uint64_t v14 = [v7 comparePosition:v12 toPosition:v13];

    if (v14)
    {
      uint64_t v15 = [v11 startPosition];
      if ([v11 amount] > 0) {
        uint64_t v16 = 4;
      }
      else {
        uint64_t v16 = 5;
      }
      uint64_t v17 = [v11 amount];
      if (v17 >= 0) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = -v17;
      }
      uint64_t v19 = objc_msgSend(v7, "_positionFromPosition:inDirection:offset:withAffinityDownstream:", v15, v16, v18, objc_msgSend(v11, "affinityDownstream"));

      uint64_t v20 = [v11 cursor];
      uint64_t v21 = [v7 comparePosition:v20 toPosition:v19];

      if (v21)
      {
        [v11 setCursor:v19];
      }
      else
      {
        id v22 = [v7 beginningOfDocument];
        [v11 setCursor:v22];

        objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
      }
    }
    else
    {
      objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
    }
    id v10 = [(UITextInputController *)self _setSelectionRangeWithHistory:v11];
  }
  else
  {
    id v10 = 0;
    uint64_t v11 = v6;
  }

  return v10;
}

- (id)_moveDown:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    if (v6) {
      uint64_t v9 = [v6 affinityDownstream];
    }
    else {
      uint64_t v9 = [(UITextInputController *)self _selectionAffinity] == 0;
    }
    uint64_t v11 = [(UITextInputController *)self _setHistory:v6 withExtending:v4 withAnchor:1 withAffinityDownstream:v9];

    objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
    int v12 = [v11 cursor];
    uint64_t v13 = [v7 endOfDocument];
    uint64_t v14 = [v7 comparePosition:v12 toPosition:v13];

    if (v14)
    {
      uint64_t v15 = [v11 startPosition];
      if ([v11 amount] > 0) {
        uint64_t v16 = 4;
      }
      else {
        uint64_t v16 = 5;
      }
      uint64_t v17 = [v11 amount];
      if (v17 >= 0) {
        uint64_t v18 = v17;
      }
      else {
        uint64_t v18 = -v17;
      }
      uint64_t v19 = objc_msgSend(v7, "_positionFromPosition:inDirection:offset:withAffinityDownstream:", v15, v16, v18, objc_msgSend(v11, "affinityDownstream"));

      uint64_t v20 = [v11 cursor];
      uint64_t v21 = [v7 comparePosition:v20 toPosition:v19];

      if (v21)
      {
        [v11 setCursor:v19];
      }
      else
      {
        id v22 = [v7 endOfDocument];
        [v11 setCursor:v22];

        objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
      }
    }
    else
    {
      objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
    }
    id v10 = [(UITextInputController *)self _setSelectionRangeWithHistory:v11];
  }
  else
  {
    id v10 = 0;
    uint64_t v11 = v6;
  }

  return v10;
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    uint64_t v9 = [(UITextInputController *)self _setHistory:v6 withExtending:v4 withAnchor:2 withAffinityDownstream:1];

    [v9 setAmount:0];
    id v10 = [v7 selectedTextRange];
    char v11 = [v10 isEmpty];

    if ((v11 & 1) != 0 || v4)
    {
      int v12 = [v9 cursor];
      uint64_t v13 = [v7 positionFromPosition:v12 inDirection:3 offset:1];
      [v9 setCursor:v13];
    }
    uint64_t v14 = [v9 cursor];
    [v9 setStartPosition:v14];

    uint64_t v15 = [(UITextInputController *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v9 = v6;
  }

  return v15;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectableText];
  BOOL v8 = [v7 selectedTextRange];

  if (v8)
  {
    uint64_t v9 = [(UITextInputController *)self _setHistory:v6 withExtending:v4 withAnchor:1 withAffinityDownstream:1];

    [v9 setAmount:0];
    id v10 = [v7 selectedTextRange];
    char v11 = [v10 isEmpty];

    if ((v11 & 1) != 0 || v4)
    {
      int v12 = [v9 cursor];
      uint64_t v13 = [v7 positionFromPosition:v12 inDirection:2 offset:1];
      [v9 setCursor:v13];
    }
    uint64_t v14 = [v9 cursor];
    [v9 setStartPosition:v14];

    uint64_t v15 = [(UITextInputController *)self _setSelectionRangeWithHistory:v9];
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v9 = v6;
  }

  return v15;
}

- (id)_positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5 withAffinityDownstream:(BOOL)a6
{
  id v9 = a3;
  id v10 = [(UITextInputController *)self _selectableText];
  char v11 = [v10 positionFromPosition:v9 inDirection:a4 offset:a5];

  return v11;
}

- (void)_setSelectedTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(UITextInputController *)self setSelectedTextRange:v7 withAffinityDownstream:v4];
  }
  else
  {
    id v6 = [(UITextInputController *)self _selectableText];
    [v6 setSelectedTextRange:v7];
  }
}

- (int64_t)_selectionAffinity
{
  double v2 = [(UITextInputController *)self _selectableText];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    BOOL v4 = [v2 tokenizer];
    double v5 = [v2 selectedTextRange];
    id v6 = [v5 start];
    if ([v4 isPosition:v6 atBoundary:3 inDirection:1])
    {
    }
    else
    {
      id v7 = [v2 tokenizer];
      BOOL v8 = [v2 selectedTextRange];
      id v9 = [v8 end];
      char v10 = [v7 isPosition:v9 atBoundary:4 inDirection:2];

      if (v10)
      {
        int64_t v3 = 1;
        goto LABEL_8;
      }
    }
    int64_t v3 = 0;
    goto LABEL_8;
  }
  int64_t v3 = [v2 selectionAffinity];
LABEL_8:

  return v3;
}

- (void)_setGestureRecognizers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    [(UITextInputController *)self _setInternalGestureRecognizers];
  }
  else
  {
    int64_t v3 = +[UIKeyboardImpl activeInstance];
    BOOL v4 = [v3 markedTextOverlay];
    [v4 removeFromSuperview];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v5 = objc_msgSend(v4, "interactions", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 removeInteraction:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    char v10 = [(UITextInputController *)self _selectableText];
    char v11 = [v10 interactionAssistant];
    int v12 = v11;
    if (v11)
    {
      [v11 setGestureRecognizers];
    }
    else if ([v10 _hasMarkedText] {
           && [v3 hasEditableMarkedText])
    }
    {
      uint64_t v13 = [v10 markedTextRange];
      [v10 firstRectForRange:v13];
      objc_msgSend(v4, "setFrame:");

      uint64_t v14 = [v10 textInputView];
      [v14 addSubview:v4];

      uint64_t v15 = [[UITextPhraseBoundaryInteraction alloc] initWithTextInput:v10];
      [v4 addInteraction:v15];
    }
  }
}

- (BOOL)_usesAsynchronousProtocol
{
  double v2 = [(UITextInputController *)self _selectableText];
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    if (objc_opt_respondsToSelector())
    {
      char v4 = [v2 conformsToProtocol:&unk_1ED700D60];
LABEL_9:
      BOOL v3 = v4;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v3 = 0;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v2 conformsToProtocolCached:&unk_1ED700940] & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      char v4 = [v2 conformsToProtocolCached:&unk_1ED7009A0];
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  BOOL v3 = 1;
LABEL_11:

  return v3;
}

- (BOOL)_hasMarkedText
{
  double v2 = [(UITextInputController *)self _selectableText];
  if ([v2 _usesAsynchronousProtocol]
    && (!+[UIKBInputDelegateManager isAsyncTextInputEnabled]|| (objc_opt_respondsToSelector() & 1) != 0|| (objc_opt_respondsToSelector() & 1) != 0))
  {
    char v3 = [v2 hasMarkedText];
  }
  else
  {
    char v4 = [v2 markedTextRange];
    char v3 = v4 != 0;
  }
  return v3;
}

- (void)_setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F28B18];
  id v8 = a3;
  id v9 = (id)[[v7 alloc] initWithString:v8];

  -[UITextInputController _setAttributedMarkedText:selectedRange:](self, "_setAttributedMarkedText:selectedRange:", v9, location, length);
}

- (void)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v26 = [(UITextInputController *)self _selectableText];
  int v8 = [(UITextInputController *)self _hasMarkedText];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v26, "setAttributedMarkedText:selectedRange:", v7, location, length);
  }
  else
  {
    uint64_t v9 = [v7 string];

    objc_msgSend(v26, "setMarkedText:selectedRange:", v9, location, length);
    id v7 = (id)v9;
  }

  int v10 = [(UITextInputController *)self _hasMarkedText];
  if (v8 != v10)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
    {
      uint64_t v11 = [v26 _selectionDisplayInteraction];
      int v12 = v26;
      uint64_t v13 = (void *)v11;
    }
    else
    {
      uint64_t v13 = 0;
      int v12 = v26;
    }
    [v12 _setGestureRecognizers];
    long long v18 = [(UITextInputController *)self _textSelectingContainer];
    uint64_t v19 = [v18 interactionAssistant];
    if (v19)
    {
      uint64_t v20 = (void *)v19;
      uint64_t v21 = [(UITextInputController *)self _textSelectingContainer];
      id v22 = [v21 interactionAssistant];
      int v23 = [v22 externalInteractions];

      if (v23)
      {
        id v24 = [(UITextInputController *)self _textSelectingContainer];
        id v25 = [v24 interactionAssistant];
        [v25 deactivateSelection];

        [v26 _setSelectionDisplayInteraction:v13];
      }
    }
    else
    {
    }
    goto LABEL_15;
  }
  if (v10)
  {
    uint64_t v14 = [(UITextInputController *)self _textSelectingContainer];
    uint64_t v15 = [v14 interactionAssistant];

    if (!v15)
    {
      long long v16 = +[UIKeyboardImpl activeInstance];
      uint64_t v13 = [v16 markedTextOverlay];

      long long v17 = [v26 markedTextRange];
      [v26 firstRectForRange:v17];
      objc_msgSend(v13, "setFrame:");

LABEL_15:
    }
  }
}

- (void)_unmarkText
{
  id v13 = [(UITextInputController *)self _selectableText];
  BOOL v3 = [(UITextInputController *)self _hasMarkedText];
  [v13 unmarkText];
  if (v3)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
    {
      char v4 = [v13 _selectionDisplayInteraction];
    }
    else
    {
      char v4 = 0;
    }
    [v13 _setGestureRecognizers];
    double v5 = [(UITextInputController *)self _textSelectingContainer];
    uint64_t v6 = [v5 interactionAssistant];
    if (v6)
    {
      id v7 = (void *)v6;
      int v8 = [(UITextInputController *)self _textSelectingContainer];
      uint64_t v9 = [v8 interactionAssistant];
      int v10 = [v9 externalInteractions];

      if (v10)
      {
        uint64_t v11 = [(UITextInputController *)self _textSelectingContainer];
        int v12 = [v11 interactionAssistant];
        [v12 deactivateSelection];

        [v13 _setSelectionDisplayInteraction:v4];
      }
    }
    else
    {
    }
  }
}

- (BOOL)_shouldPerformUICalloutBarButtonReplaceAction:(SEL)a3 forText:(id)a4 checkAutocorrection:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  int v8 = v7;
  if (sel_promptForReplace_ != a3 && sel__promptForReplace_ != a3)
  {
    if (sel__transliterateChinese_ == a3)
    {
      char v14 = UIKeyboardEnabledInputModesAllowChineseTransliterationForText(v7);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v5
    && (+[UIKeyboardImpl activeInstance],
        int v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 autocorrectSpellingEnabled],
        v10,
        !v11)
    || ([v8 _containsCJScriptsOnly] & 1) != 0)
  {
LABEL_11:
    char v14 = 0;
    goto LABEL_13;
  }
  int v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v13 = [v8 componentsSeparatedByCharactersInSet:v12];

  char v14 = (unint64_t)[v13 count] < 8;
LABEL_13:

  return v14;
}

- (_NSRange)_rangeAfterCancelDictationIfNecessaryForChangeInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  textPlaceholder = self->_textPlaceholder;
  if (textPlaceholder)
  {
    id v7 = [(UITextPlaceholder *)textPlaceholder attachment];
    NSUInteger v8 = [v7 attachmentRange];
    NSUInteger v10 = v9;

    if (location <= v8 && location + length <= v8 + v10)
    {
      if (!+[UIKeyboard isModelessActive])
      {
        char v14 = +[UIDictationController sharedInstance];
        [v14 cancelDictation];
      }
      if (!self->_textPlaceholder)
      {
        v15.NSUInteger location = location;
        v15.NSUInteger length = length;
        v17.NSUInteger location = v8;
        v17.NSUInteger length = v10;
        length -= NSIntersectionRange(v15, v17).length;
      }
    }
  }
  NSUInteger v12 = location;
  NSUInteger v13 = length;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (id)_senderForDelegateNotifications
{
  BOOL v3 = (UITextInputController *)objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    char v4 = [(UITextInputController *)v3 _textSelectingContainer];
  }
  else
  {
    char v4 = v3;
    if (!v3) {
      char v4 = self;
    }
  }

  return v4;
}

- (void)_sendDelegateWillChangeNotificationsForText:(BOOL)a3 selection:(BOOL)a4
{
  if ((*((unsigned char *)&self->_tiFlags + 1) & 0x20) == 0)
  {
    BOOL v4 = a3;
    uint64_t v6 = [(UITextInputController *)self _senderForDelegateNotifications];
    if (v4)
    {
      id v8 = v6;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
      [WeakRetained textWillChange:v8];

      uint64_t v6 = v8;
    }
  }
}

- (void)_sendDelegateChangeNotificationsForText:(BOOL)a3 selection:(BOOL)a4
{
}

- (void)_sendDelegateChangeNotificationsForText:(BOOL)a3 selection:(BOOL)a4 replacement:(id)a5 characterRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  BOOL v8 = a4;
  BOOL v9 = a3;
  id v20 = a5;
  int v11 = +[UIDictationController sharedInstance];
  char v12 = [v11 suppressDelegateTextInputDidChangeNotifications];

  $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = self->_tiFlags;
  if ((*(_DWORD *)&tiFlags & 0x80000) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    NSRange v15 = WeakRetained;
    if (v8 && (*(unsigned char *)&self->_tiFlags & 8) != 0) {
      [WeakRetained textInputDidChangeSelection:self];
    }
    if (v9)
    {
      char v16 = (*(unsigned char *)&self->_tiFlags & 4) != 0 ? v12 : 1;
      if ((v16 & 1) == 0) {
        [v15 textInputDidChange:self];
      }
    }

    $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = self->_tiFlags;
  }
  if ((*(_WORD *)&tiFlags & 0x2000) == 0)
  {
    NSRange v17 = [(UITextInputController *)self _senderForDelegateNotifications];
    if (v9)
    {
      id v18 = objc_loadWeakRetained((id *)&self->_inputDelegate);
      [v18 textDidChange:v17];
    }
    $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = self->_tiFlags;
  }
  if (v20 && (*(_WORD *)&tiFlags & 0x800) != 0 && location != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v19 = [(UITextInputController *)self delegate];
    objc_msgSend(v19, "textInput:didApplyAttributedText:toCharacterRange:", self, v20, location, length);
  }
}

- (BOOL)_delegateShouldChangeTextInRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v8 = -[UITextInputController _rangeAfterCancelDictationIfNecessaryForChangeInRange:](self, "_rangeAfterCancelDictationIfNecessaryForChangeInRange:", location, length);
  if ((*(unsigned char *)&self->_tiFlags & 2) != 0)
  {
    uint64_t v11 = v8;
    uint64_t v12 = v9;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_msgSend(WeakRetained, "textInput:shouldChangeCharactersInRange:replacementText:", self, v11, v12, v7);
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void)_setInternalGestureRecognizers
{
  id v2 = [(UITextInputController *)self interactionAssistant];
  [v2 clearGestureRecognizers:1];
}

- (void)_selectionDidScroll:(id)a3
{
  id v3 = [(UITextInputController *)self interactionAssistant];
  [v3 setNeedsSelectionDisplayUpdate];
}

- (void)setSelectedTextRange:(id)a3
{
  id v4 = a3;
  [(UITextInputController *)self signalDictationSelectionTip:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  uint64_t v6 = [WeakRetained characterRangeForTextRange:v4];
  uint64_t v8 = v7;

  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x3010000000;
  id v25 = &unk_186D7DBA7;
  uint64_t v26 = v6;
  uint64_t v27 = v8;
  uint64_t v9 = [(UITextInputController *)self _textStorage];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__UITextInputController_setSelectedTextRange___block_invoke;
  v21[3] = &unk_1E530B830;
  v21[4] = self;
  v21[5] = &v22;
  [v9 coordinateReading:v21];

  if (self->_markedTextRange.length)
  {
    uint64_t v10 = [(UITextInputController *)self _selectedRange];
    if (self->_markedTextSelection.location != v6 - v10 || self->_markedTextSelection.length != v8)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __46__UITextInputController_setSelectedTextRange___block_invoke_2;
      v20[3] = &unk_1E52DD178;
      v20[4] = self;
      v20[5] = v6 - v10;
      v20[6] = v8;
      [(UITextInputController *)self _coordinateSelectionChange:v20];
    }
  }
  else
  {
    uint64_t v11 = [(UITextInputController *)self _selectedRange];
    $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = self->_tiFlags;
    if (v11 != v23[4] || v12 != v23[5] || (*(_DWORD *)&tiFlags & 0x10000) != 0)
    {
      self->_$DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&tiFlags & 0xFFFEFFFF);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__UITextInputController_setSelectedTextRange___block_invoke_3;
      v14[3] = &unk_1E5300108;
      NSRange v17 = &v22;
      uint64_t v18 = v6;
      uint64_t v19 = v8;
      id v15 = v4;
      char v16 = self;
      [(UITextInputController *)self _coordinateSelectionChange:v14];
    }
  }
  _Block_object_dispose(&v22, 8);
}

void __46__UITextInputController_setSelectedTextRange___block_invoke(uint64_t a1, void *a2)
{
  v3.NSUInteger length = [a2 length];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5.NSUInteger location = *(void *)(v4 + 32);
  if (v5.location >= v3.length)
  {
    NSUInteger length = 0;
    *(void *)(v4 + 32) = v3.length;
  }
  else
  {
    v5.NSUInteger length = *(void *)(v4 + 40);
    v3.NSUInteger location = 0;
    NSRange v7 = NSIntersectionRange(v5, v3);
    NSUInteger length = v7.length;
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v4 + 32) = v7.location;
  }
  *(void *)(v4 + 40) = length;
  uint64_t v8 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v8 + 144) & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v8 + 264));
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v9 _selectedRange];
    uint64_t v12 = objc_msgSend(WeakRetained, "textInput:willChangeSelectionFromCharacterRange:toCharacterRange:", v9, v10, v11, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v13 + 32) = v12;
    *(void *)(v13 + 40) = v14;
  }
}

uint64_t __46__UITextInputController_setSelectedTextRange___block_invoke_2(uint64_t a1)
{
  *(_OWORD *)(*(void *)(a1 + 32) + 112) = *(_OWORD *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) interactionAssistant];
  [v2 selectionChanged];

  NSRange v3 = *(void **)(a1 + 32);
  return [v3 _sendDelegateChangeNotificationsForText:0 selection:1];
}

void __46__UITextInputController_setSelectedTextRange___block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(v3 + 40);
  if (v5 != *(void *)(a1 + 56) || v4 != *(void *)(a1 + 64))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 248));
    uint64_t v8 = objc_msgSend(WeakRetained, "textRangeForCharacterRange:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));

    id v2 = (id)v8;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v2;
  id v12 = v2;

  [*(id *)(a1 + 40) _invalidateTypingAttributes];
  uint64_t v11 = [*(id *)(a1 + 40) interactionAssistant];
  [v11 selectionChanged];

  [*(id *)(a1 + 40) _sendDelegateChangeNotificationsForText:0 selection:1];
}

- (void)_setSelectedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(WeakRetained, "textRangeForCharacterRange:", location, length);
  uint64_t v6 = (UITextRange *)objc_claimAutoreleasedReturnValue();
  selectedTextRange = self->_selectedTextRange;
  self->_selectedTextRange = v6;
}

- (void)setSelectedRange:(_NSRange)a3
{
}

- (void)setSelectedRange:(_NSRange)a3 afterDelta:(int64_t)a4 appliedToRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v8 = a3.length;
  NSUInteger v9 = a3.location;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  uint64_t v13 = objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v9, v8);
  [(UITextInputController *)self setSelectedTextRange:v13];

  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v14 = self->_accumulatedSelectedRangeForCoalescedUndoRedo.location;
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v15.NSUInteger length = self->_accumulatedSelectedRangeForCoalescedUndoRedo.length;
      if (location + length <= v15.length + v14) {
        int64_t v16 = a4;
      }
      else {
        int64_t v16 = 0;
      }
      v15.NSUInteger location = v16 + v14;
      if (v8 && v15.length)
      {
        v20.NSUInteger location = v9;
        v20.NSUInteger length = v8;
        NSRange v17 = NSUnionRange(v20, v15);
        NSUInteger v9 = v17.location;
        NSUInteger v8 = v17.length;
      }
      else
      {
        if (v15.location <= v9) {
          NSUInteger v18 = v9;
        }
        else {
          NSUInteger v18 = v16 + v14;
        }
        if (!v8)
        {
          NSUInteger v8 = self->_accumulatedSelectedRangeForCoalescedUndoRedo.length;
          NSUInteger v9 = v18;
        }
      }
    }
    if ((v9 & 0x8000000000000000) != 0 || (v8 & 0x8000000000000000) != 0)
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"UITextInputController.m", 880, @"Overflow in accumulation of selected range for coalesced undo or redo. Previous accumulation={%lu, %lu} Replacement range={%lu, %lu} delta=%li", self->_accumulatedSelectedRangeForCoalescedUndoRedo.location, self->_accumulatedSelectedRangeForCoalescedUndoRedo.length, location, length, a4 object file lineNumber description];
    }
    self->_accumulatedSelectedRangeForCoalescedUndoRedo.NSUInteger location = v9;
    self->_accumulatedSelectedRangeForCoalescedUndoRedo.NSUInteger length = v8;
  }
}

- (void)_coordinateSelectionChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextInputController *)self _textStorage];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__UITextInputController__coordinateSelectionChange___block_invoke;
  v7[3] = &unk_1E530B550;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 coordinateReading:v7];
}

void __52__UITextInputController__coordinateSelectionChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _ensureSelectionValid];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v5 = WeakRetained;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 145) & 0x20) == 0) {
    objc_msgSend(WeakRetained, "selectionWillChange:");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _ensureSelectionValid];
  unint64_t v6 = [*(id *)(a1 + 32) selectedRange];
  uint64_t v8 = v7;
  if ([v3 length] && v6 + v8 >= objc_msgSend(v3, "length"))
  {
    unint64_t v6 = [v3 length] - 1;
    uint64_t v8 = 1;
  }
  if ((v6 & 0x8000000000000000) == 0 && v6 < [v3 length])
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    if (v8) {
      objc_msgSend(v3, "attributesAtIndex:longestEffectiveRange:inRange:", v6, &v16, v6, v8);
    }
    else {
    NSUInteger v9 = [v3 attributesAtIndex:v6 effectiveRange:&v16];
    }
    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 152));
    uint64_t v11 = [v10 keyboardSceneDelegate];
    id v12 = [v11 textFormattingCoordinator];

    unint64_t v13 = v17 + v16;
    uint64_t v14 = [*(id *)(a1 + 32) selectedRange];
    [v12 setSelectedAttributes:v9 isMultiple:v13 < v14 + v15];
  }
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 145) & 0x20) == 0) {
    objc_msgSend(v5, "selectionDidChange:");
  }
}

- (_NSRange)_rangeToReplaceWhenInsertingText
{
  id v3 = [(UITextInputController *)self selectedTextRange];
  if (v3)
  {
    NSUInteger location = self->_markedTextRange.location;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
      NSUInteger location = [WeakRetained characterRangeForTextRange:v3];
      NSUInteger v7 = v6;
    }
    else
    {
      NSUInteger v7 = 0;
    }
  }
  else
  {
    NSUInteger v7 = 0;
    NSUInteger location = 0;
  }

  NSUInteger v8 = location;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (void)_insertText:(id)a3 fromKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(UITextInputController *)self isWritingToolsStreamingReplacements])
  {
    if (v4) {
      int v7 = 0x2000;
    }
    else {
      int v7 = 0;
    }
    self->_$DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFDFFF | v7);
    uint64_t v8 = [(UITextInputController *)self _rangeToReplaceWhenInsertingText];
    uint64_t v10 = -[UITextInputController _rangeAfterCancelDictationIfNecessaryForChangeInRange:](self, "_rangeAfterCancelDictationIfNecessaryForChangeInRange:", v8, v9);
    uint64_t v12 = v11;
    [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:0];
    if ((*((unsigned char *)&self->_tiFlags + 1) & 0x10) != 0)
    {
      unint64_t v13 = [(UITextInputController *)self delegate];
      objc_msgSend(v13, "textInput:willChangeCharactersInRange:", self, v10, v12);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    uint64_t v15 = objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v10, v12);

    [(UITextCheckingController *)self->_textCheckingController willReplaceTextInRange:v15 withText:v6];
    uint64_t v16 = [(UITextInputController *)self _selectedRange];
    uint64_t v18 = v17;
    uint64_t v19 = [(UITextInputController *)self _textStorage];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __50__UITextInputController__insertText_fromKeyboard___block_invoke;
    v59[3] = &unk_1E530B578;
    uint64_t v61 = v16;
    uint64_t v62 = v18;
    id v20 = v6;
    id v60 = v20;
    [v19 coordinateReading:v59];

    uint64_t v53 = 0;
    uint64_t v54 = &v53;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__211;
    v57 = __Block_byref_object_dispose__211;
    id v58 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x3032000000;
    uint64_t v50 = __Block_byref_object_copy__211;
    double v51 = __Block_byref_object_dispose__211;
    id v52 = 0;
    uint64_t v41 = 0;
    id v42 = &v41;
    uint64_t v43 = 0x3032000000;
    uint64_t v44 = __Block_byref_object_copy__211;
    uint64_t v45 = __Block_byref_object_dispose__211;
    id v46 = 0;
    uint64_t v21 = [(UITextInputController *)self _textStorage];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __50__UITextInputController__insertText_fromKeyboard___block_invoke_467;
    v34[3] = &unk_1E530B5A0;
    v34[4] = self;
    double v36 = &v47;
    uint64_t v39 = v10;
    uint64_t v40 = v12;
    id v35 = v20;
    id v37 = &v41;
    uint64_t v38 = &v53;
    [v21 coordinateEditing:v34];

    [(_UITextInputControllerTokenizer *)self->_tokenizer invalidateTokenizer];
    int64_t v22 = [(UITextInputController *)self selectionAffinity];
    if ([(id)v54[5] length])
    {
      int v23 = (void *)v54[5];
      uint64_t v24 = objc_msgSend(v23, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v23, "length") - 1);
      uint64_t v26 = objc_msgSend(v23, "substringWithRange:", v24, v25);
      uint64_t v27 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      uint64_t v28 = [v26 rangeOfCharacterFromSet:v27];

      if (!v28) {
        int64_t v22 = 0;
      }
    }
    id v29 = [(UITextRange *)self->_selectedTextRange start];
    id v30 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    id v31 = objc_msgSend(v30, "positionFromPosition:offset:affinity:", v29, objc_msgSend((id)v54[5], "length"), v22);

    if (v31)
    {
      id v32 = objc_loadWeakRetained((id *)&self->_textLayoutController);
      double v33 = [v32 emptyTextRangeAtPosition:v31];
      [(UITextInputController *)self setSelectedTextRange:v33];
    }
    if (v42[5]) {
      -[UITextInputController setTypingAttributes:](self, "setTypingAttributes:");
    }
    -[UITextInputController _sendDelegateChangeNotificationsForText:selection:replacement:characterRange:](self, "_sendDelegateChangeNotificationsForText:selection:replacement:characterRange:", 1, 0, v48[5], v10, v12);
    *(_DWORD *)&self->_tiFlags &= ~0x2000u;

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v47, 8);

    _Block_object_dispose(&v53, 8);
  }
}

void __50__UITextInputController__insertText_fromKeyboard___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(a1 + 40);
  id v24 = v3;
  if (v4 < [v3 length])
  {
    uint64_t v5 = [v24 attribute:@"_UITextInputDictationResultMetadata" atIndex:*(void *)(a1 + 40) effectiveRange:0];
    if (v5)
    {
      id v6 = (void *)v5;
      id v7 = 0;
      goto LABEL_11;
    }
  }
  unint64_t v8 = *(void *)(a1 + 40) - 1;
  id v6 = 0;
  id v7 = 0;
  if (v8 < [v24 length] && (v8 & 0x8000000000000000) == 0)
  {
    id v6 = [v24 attribute:@"_UITextInputDictationResultMetadata" atIndex:v8 effectiveRange:0];
    if (!v6)
    {
      id v7 = 0;
      goto LABEL_36;
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = +[UIDictationUtilities trackingPunctuations];
    int v10 = [v9 containsObject:*(void *)(a1 + 32)];

    if (v10) {
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"suffixPunctuationAdded"];
    }
    if ([*(id *)(a1 + 32) isEqualToString:&stru_1ED0E84C0]) {
      [v7 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"suffixPunctuationAdded"];
    }
LABEL_11:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_36;
    }
    id v11 = v6;
    id v6 = v11;
    if (v7) {
      [v11 addEntriesFromDictionary:v7];
    }
    uint64_t v12 = [*(id *)(a1 + 32) length] - *(_DWORD *)(a1 + 48);
    +[UIDictationUtilities updateCharacterModificationCount:v6 delta:v12];
    if (v12 == -1)
    {
      if (*(void *)(a1 + 48) == 1) {
        goto LABEL_30;
      }
    }
    else
    {
      if (v12 == 1)
      {
        if (!*(void *)(a1 + 48))
        {
          if (+[UIDictationUtilities characterDeletionCount:v6])
          {
            unint64_t v13 = +[UIDictationUtilities maxLoggableLengthOfInsertionWithDeletion:v6];
          }
          else
          {
            unint64_t v13 = +[UIDictationUtilities maxLoggableLengthOfInsertionWithoutDeletion:v6];
          }
          if (+[UIDictationUtilities characterInsertionCount:](UIDictationUtilities, "characterInsertionCount:", v6) < v13)+[UIDictationUtilities trackInsertion:text:range:](UIDictationUtilities, "trackInsertion:text:range:", v6, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48)); {
          +[UIDictationUtilities updateCharacterInsertionCount:v6 delta:1];
          }
          goto LABEL_35;
        }
LABEL_24:
        unint64_t v14 = +[UIDictationUtilities characterSubstitutionCount:v6];
        unint64_t v15 = +[UIDictationUtilities maxLoggableLengthOfInsertionBySubstitution:v6];
        unint64_t v16 = v15 - v14;
        if (v15 != v14)
        {
          uint64_t v17 = objc_msgSend(v24, "attributedSubstringFromRange:", *(void *)(a1 + 40), *(void *)(a1 + 48));
          uint64_t v18 = [v17 string];

          unint64_t v19 = [*(id *)(a1 + 32) length];
          if (v19 >= v16) {
            unint64_t v20 = v16;
          }
          else {
            unint64_t v20 = v19;
          }
          uint64_t v21 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", 0, v20);
          +[UIDictationUtilities trackSubstitution:originalText:originalTextRange:replacementText:replacementTextRange:](UIDictationUtilities, "trackSubstitution:originalText:originalTextRange:replacementText:replacementTextRange:", v6, v18, *(void *)(a1 + 40), *(void *)(a1 + 48), v21, 0, v20);
        }
        +[UIDictationUtilities updateCharacterSubstitutionCount:delta:](UIDictationUtilities, "updateCharacterSubstitutionCount:delta:", v6, [*(id *)(a1 + 32) length]);
        goto LABEL_35;
      }
      if ((v12 & 0x80000000) == 0) {
        goto LABEL_24;
      }
    }
    if ([*(id *)(a1 + 32) length]) {
      goto LABEL_24;
    }
LABEL_30:
    +[UIDictationUtilities updateCharacterDeletionCount:v6 delta:-(int)v12];
    int64_t v22 = objc_msgSend(v24, "attributedSubstringFromRange:", *(void *)(a1 + 40), *(void *)(a1 + 48));
    int v23 = [v22 string];

    +[UIDictationUtilities trackDeletion:text:range:](UIDictationUtilities, "trackDeletion:text:range:", v6, v23, *(void *)(a1 + 40), *(void *)(a1 + 48));
LABEL_35:
  }
LABEL_36:
}

void __50__UITextInputController__insertText_fromKeyboard___block_invoke_467(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[12];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "replaceCharactersInRange:withString:", v5, v4[13], &stru_1ED0E84C0);
    [*(id *)(a1 + 32) _clearMarkedText];
    unint64_t v4 = *(void **)(a1 + 32);
  }
  int v6 = [v4 supportsTextKit2TextLists];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v9 + 40);
    uint64_t v10 = objc_msgSend(v7, "handleInsertedText:intoTextStorage:replacementRange:updatedTypingAttributes:", v8, v3, *(void *)(a1 + 72), *(void *)(a1 + 80), &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    uint64_t v13 = objc_msgSend(v7, "_newAttributedStringForInsertionOfText:inRange:", v8, *(void *)(a1 + 72), *(void *)(a1 + 80));
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    objc_msgSend(v3, "replaceCharactersInRange:withAttributedString:", *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) string];
  uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;
}

- (BOOL)supportsTextKit2TextLists
{
  p_firstTextView = &self->_firstTextView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained((id *)p_firstTextView);
  char v6 = [v5 _supportsTextKit2TextLists];

  return v6;
}

- (id)handleInsertedText:(id)a3 intoTextStorage:(id)a4 replacementRange:(_NSRange)a5 updatedTypingAttributes:(id *)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a3;
  id v12 = a4;
  id v13 = -[UITextInputController _newAttributedStringForInsertionOfText:inRange:](self, "_newAttributedStringForInsertionOfText:inRange:", v11, location, length);
  uint64_t v21 = 0;
  unint64_t v22 = 0;
  uint64_t v14 = [v12 string];
  objc_msgSend(v14, "getParagraphStart:end:contentsEnd:forRange:", &v22, 0, &v21, location, length);

  unint64_t v15 = v22;
  if (v15 >= [v12 length])
  {
    objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", location, length, v13);
  }
  else
  {
    uint64_t v16 = [v12 attribute:*(void *)off_1E52D21B8 atIndex:v22 effectiveRange:0];
    uint64_t v17 = v16;
    if (v16
      && ([v16 textLists],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          uint64_t v19 = [v18 count],
          v18,
          v19))
    {
      -[UITextInputController handleTextListForInsertedText:attributedText:intoTextStorage:replacementRange:paragraphStyle:paragraphStart:paragraphContentsEnd:updatedTypingAttributes:](self, "handleTextListForInsertedText:attributedText:intoTextStorage:replacementRange:paragraphStyle:paragraphStart:paragraphContentsEnd:updatedTypingAttributes:", v11, v13, v12, location, length, v17, v22, v21, a6);
    }
    else
    {
      objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", location, length, v13);
    }
  }
  return v13;
}

- (void)handleTextListForInsertedText:(id)a3 attributedText:(id)a4 intoTextStorage:(id)a5 replacementRange:(_NSRange)a6 paragraphStyle:(id)a7 paragraphStart:(unint64_t)a8 paragraphContentsEnd:(unint64_t)a9 updatedTypingAttributes:(id *)a10
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v39 = a3;
  id v17 = a4;
  id v18 = a5;
  id v38 = a7;
  unint64_t v19 = a9 - a8;
  if (a9 - a8 > [v18 length])
  {
    double v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"UITextInputController.m" lineNumber:1146 description:@"Paragraph length somehow larger than text storage length"];
  }
  if ([v39 length] == 1
    && ([MEMORY[0x1E4F28B88] newlineCharacterSet],
        unint64_t v20 = objc_claimAutoreleasedReturnValue(),
        int v21 = objc_msgSend(v20, "characterIsMember:", objc_msgSend(v39, "characterAtIndex:", 0)),
        v20,
        v21))
  {
    unint64_t v22 = [v17 attributesAtIndex:0 effectiveRange:0];
    id v23 = (id)[v22 mutableCopy];

    id v24 = [v18 string];
    uint64_t v25 = objc_msgSend(v24, "substringWithRange:", a8, v19);

    uint64_t v26 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v37 = v25;
    uint64_t v27 = [v25 stringByTrimmingCharactersInSet:v26];
    uint64_t v28 = [v27 length];

    if (v28)
    {
      id v29 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n " attributes:v23];
      objc_msgSend(v18, "replaceCharactersInRange:withAttributedString:", location, length, v29);
      id v30 = v38;
    }
    else
    {
      id v30 = v38;
      id v29 = (void *)[v38 mutableCopy];
      [v29 setTextLists:MEMORY[0x1E4F1CBF0]];
      [v23 setObject:v29 forKeyedSubscript:*(void *)off_1E52D21B8];
      id v35 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0 attributes:v23];
      objc_msgSend(v18, "replaceCharactersInRange:withAttributedString:", a8, v19, v35);
      *a10 = (id)[v23 copy];
    }
  }
  else
  {
    id v23 = v17;
    uint64_t v31 = [v23 length];
    if (v19 == 1 && !v31)
    {
      id v32 = objc_alloc(MEMORY[0x1E4F28B18]);
      double v33 = [(UITextInputController *)self typingAttributes];
      uint64_t v34 = [v32 initWithString:@" " attributes:v33];

      id v23 = (id)v34;
    }
    objc_msgSend(v18, "replaceCharactersInRange:withAttributedString:", location, length, v23);
    id v30 = v38;
  }
}

- (int64_t)_resolveNaturalDirection:(int64_t)a3
{
  int64_t v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int64_t v10 = a3;
  if (a3 == -1)
  {
    char v4 = [(UITextInputController *)self _textStorage];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__UITextInputController__resolveNaturalDirection___block_invoke;
    v6[3] = &unk_1E52DF988;
    v6[4] = &v7;
    [v4 coordinateReading:v6];

    int64_t v3 = v8[3];
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __50__UITextInputController__resolveNaturalDirection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 string];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 _isNaturallyRTL];
}

- (void)setMarkedTextStyle:(id)a3
{
}

- (NSDictionary)markedTextStyle
{
  return self->_markedTextStyle;
}

- (BOOL)_isInlineCompletionPresentedAsMarkedText:(id)a3
{
  id v4 = a3;
  if ([v4 length] && self->_inputDelegateRespondsToInlineCompletionAsMarkedText)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
    char v6 = [WeakRetained inlineCompletionAsMarkedText];

    uint64_t v7 = [v6 string];
    char v8 = [v7 isEqualToString:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)attributedSubstringForMarkedRange
{
  id v3 = [(UITextInputController *)self markedTextRange];
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_21;
  }
  markedText = self->_markedText;
  if (markedText)
  {
    id v5 = markedText;
    goto LABEL_21;
  }
  BOOL v6 = +[UIKeyboard isRedesignedTextCursorEnabled];
  uint64_t v7 = [(UITextInputController *)self attributedTextInRange:v3];
  id v5 = v7;
  uint64_t v22 = 0;
  unint64_t v23 = 0;
  if (v6)
  {
    uint64_t v8 = *(void *)off_1E52D23E8;
    uint64_t v9 = [(NSAttributedString *)v7 attribute:*(void *)off_1E52D23E8 atIndex:0 effectiveRange:&v22];
    if (v9)
    {
      unint64_t v10 = v23;
      if (v10 >= [(NSAttributedString *)v5 length]) {
        goto LABEL_20;
      }
    }
    id v11 = (NSAttributedString *)[(NSAttributedString *)v5 mutableCopy];
    [(NSAttributedString *)v11 beginEditing];
    -[NSAttributedString addAttribute:value:range:](v11, "addAttribute:value:range:", v8, &unk_1ED3F6E70, 0, [(NSAttributedString *)v5 length]);
    id v12 = [(UITextInputController *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(UITextInputController *)self delegate];
      unint64_t v15 = [v14 tintColor];

      if (v15) {
        -[NSAttributedString addAttribute:value:range:](v11, "addAttribute:value:range:", *(void *)off_1E52D23E0, v15, 0, [(NSAttributedString *)v5 length]);
      }
    }
    NSUInteger length = self->_markedTextSelection.length;
    if (length)
    {
      unint64_t v17 = self->_markedTextSelection.location + length;
      if (v17 <= [(NSAttributedString *)v5 length]) {
        [(NSAttributedString *)v11 addAttribute:@"NSMarkedTextSelectionAttributeName", MEMORY[0x1E4F1CC38], self->_markedTextSelection.location, self->_markedTextSelection.length value range];
      }
    }
    [(NSAttributedString *)v11 endEditing];
  }
  else
  {
    uint64_t v18 = *(void *)off_1E52D1F58;
    uint64_t v9 = [(NSAttributedString *)v7 attribute:*(void *)off_1E52D1F58 atIndex:0 effectiveRange:&v22];
    if (v9)
    {
      unint64_t v19 = v23;
      if (v19 >= [(NSAttributedString *)v5 length]) {
        goto LABEL_20;
      }
    }
    id v11 = (NSAttributedString *)[(NSAttributedString *)v5 mutableCopy];
    unint64_t v20 = +[UIColor _markedTextBackgroundColor];
    -[NSAttributedString addAttribute:value:range:](v11, "addAttribute:value:range:", v18, v20, 0, [(NSAttributedString *)v5 length]);
  }
  id v5 = v11;
LABEL_20:

LABEL_21:
  return v5;
}

- (BOOL)isEditable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
  char v3 = [WeakRetained isEditable];

  return v3;
}

- (BOOL)isEditing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
  char v3 = [WeakRetained isEditing];

  return v3;
}

- (BOOL)hasText
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v2 = [(UITextInputController *)self _textStorage];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __32__UITextInputController_hasText__block_invoke;
  v4[3] = &unk_1E52DF988;
  v4[4] = &v5;
  [v2 coordinateReading:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __32__UITextInputController_hasText__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 length];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

- (void)removeAlternativesForCurrentWord
{
  if ((*((unsigned char *)&self->_tiFlags + 2) & 2) != 0)
  {
    char v3 = [(UITextInputController *)self _textStorage];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      uint64_t v5 = [(UITextInputController *)self beginningOfDocument];
      BOOL v6 = [(UITextInputController *)self positionFromPosition:v5 offset:[(UITextInputController *)self selectedRange]];

      uint64_t v7 = [(UITextInputController *)self tokenizer];
      char v8 = [v7 rangeEnclosingPosition:v6 withGranularity:1 inDirection:1];

      uint64_t v9 = [(UITextInputController *)self nsRangeForTextRange:v8];
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v11 = v9;
        uint64_t v12 = v10;
        char v13 = [(UITextInputController *)self _textStorage];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __57__UITextInputController_removeAlternativesForCurrentWord__block_invoke;
        v15[3] = &__block_descriptor_48_e23_v16__0__NSTextStorage_8l;
        v15[4] = v11;
        v15[5] = v12;
        [v13 coordinateEditing:v15];

        id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
        [WeakRetained removeAnnotationAttribute:*(void *)off_1E52D2290 forRange:v8];
      }
    }
  }
}

uint64_t __57__UITextInputController_removeAlternativesForCurrentWord__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAttribute:range:", *(void *)off_1E52D2288, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)insertText:(id)a3
{
  id v23 = a3;
  if (+[UIDictationController shouldInsertText:](UIDictationController, "shouldInsertText:"))
  {
    uint64_t v4 = +[UIDevice currentDevice];
    if ([v4 _graphicsQuality] == 100)
    {
      BOOL v5 = 1;
    }
    else
    {
      BOOL v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      BOOL v5 = [v23 rangeOfCharacterFromSet:v6] != 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v7 = [(UITextInputController *)self selectedRange];
    uint64_t v8 = v7;
    unint64_t v10 = v9;
    NSUInteger length = self->_markedTextRange.length;
    if (length)
    {
      NSUInteger v12 = v7 - length;
      char v13 = [(UITextInputController *)self _textStorage];
      unint64_t v14 = [v13 length];

      uint64_t v8 = (v12 & 0x80000000) != 0 ? 0 : v12;
      if (v8 + v10 > v14) {
        unint64_t v10 = v14 - v8;
      }
    }
    unint64_t v15 = [(UITextInputController *)self _textStorage];
    uint64_t v16 = [v15 string];
    unint64_t v17 = objc_msgSend(v16, "substringWithRange:", v8, v10);
    [(UITextInputController *)self signalDictationInputEvent:v17 insertedText:v23];

    uint64_t v18 = getUndoActionNameTyping();
    -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v18, v8, v10, v23);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    unint64_t v20 = [(UITextInputController *)self selectedTextRange];
    int v21 = [v20 start];
    uint64_t v22 = [WeakRetained emptyTextRangeAtPosition:v21];
    [(UITextInputController *)self setPreviousSelectedTextRange:v22];

    [(UITextInputController *)self _insertText:v23 fromKeyboard:1];
    if (v5) {
      [(UITextInputController *)self notifyTextCheckingControllerForSelectionChange];
    }
    [(UITextInputController *)self removeAlternativesForCurrentWord];
  }
}

- (void)addTextAlternativesDisplayStyle:(int64_t)a3 toRange:(_NSRange)a4
{
}

- (void)invalidateDisplayForRange:(uint64_t)a1
{
  if (a1)
  {
    char v3 = (id *)(a1 + 248);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    [WeakRetained boundingRectForRange:v4];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    id v14 = objc_loadWeakRetained((id *)(a1 + 152));
    objc_msgSend(v14, "setNeedsDisplayInRect:", v7, v9, v11, v13);
  }
}

- (void)addTextAlternativesDisplayStyle:(int64_t)a3 toRange:(_NSRange)a4 invalidatingDisplayInBoundingRect:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  *(_DWORD *)&self->_tiFlags |= 0x20000u;
  p_textLayoutController = &self->_textLayoutController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  objc_msgSend(WeakRetained, "textRangeForCharacterRange:", location, length);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  id v12 = objc_loadWeakRetained((id *)p_textLayoutController);
  uint64_t v13 = *(void *)off_1E52D2290;
  id v14 = [NSNumber numberWithInteger:a3];
  [v12 addAnnotationAttribute:v13 value:v14 forRange:v15];

  if (v5) {
    -[UITextInputController invalidateDisplayForRange:]((uint64_t)self, v15);
  }
}

- (void)insertAttributedText:(id)a3
{
  id v4 = a3;
  BOOL v5 = getUndoActionNameTyping();
  uint64_t v6 = [(UITextInputController *)self selectedRange];
  uint64_t v8 = v7;
  double v9 = [v4 string];
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v5, v6, v8, v9);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  double v11 = [(UITextInputController *)self selectedTextRange];
  id v12 = [v11 start];
  uint64_t v13 = [WeakRetained emptyTextRangeAtPosition:v12];
  [(UITextInputController *)self setPreviousSelectedTextRange:v13];

  uint64_t v14 = [(UITextInputController *)self selectedRange];
  id v16 = -[UITextInputController _newAttributedStringForInsertionOfAttributedText:inRange:](self, "_newAttributedStringForInsertionOfAttributedText:inRange:", v4, v14, v15);

  [(UITextInputController *)self _insertAttributedText:v16 fromKeyboard:1];
  if (_os_feature_enabled_impl()) {
    [(UITextInputController *)self notifyTextCheckingControllerForSelectionChange];
  }
}

- (void)_insertAttributedText:(id)a3 fromKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(UITextInputController *)self isWritingToolsStreamingReplacements])
  {
    if (v4) {
      int v7 = 0x2000;
    }
    else {
      int v7 = 0;
    }
    self->_$DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFDFFF | v7);
    [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:0];
    uint64_t v8 = [(UITextInputController *)self _rangeToReplaceWhenInsertingText];
    uint64_t v10 = v9;
    double v11 = [(UITextInputController *)self _selectedText];
    id v12 = [v6 string];
    [(UITextInputController *)self signalDictationInputEvent:v11 insertedText:v12];

    uint64_t v13 = -[UITextInputController _rangeAfterCancelDictationIfNecessaryForChangeInRange:](self, "_rangeAfterCancelDictationIfNecessaryForChangeInRange:", v8, v10);
    uint64_t v15 = v14;
    if ((*((unsigned char *)&self->_tiFlags + 1) & 0x10) != 0)
    {
      id v16 = [(UITextInputController *)self delegate];
      objc_msgSend(v16, "textInput:willChangeCharactersInRange:", self, v13, v15);
    }
    unint64_t v17 = [(UITextInputController *)self _textStorage];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__UITextInputController__insertAttributedText_fromKeyboard___block_invoke;
    v22[3] = &unk_1E530B5E8;
    v22[4] = self;
    uint64_t v24 = v13;
    uint64_t v25 = v15;
    id v18 = v6;
    id v23 = v18;
    [v17 coordinateEditing:v22];

    uint64_t v19 = *(void *)off_1E52D2288;
    uint64_t v20 = [v18 length];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__UITextInputController__insertAttributedText_fromKeyboard___block_invoke_2;
    v21[3] = &unk_1E530B610;
    v21[5] = v13;
    void v21[6] = v15;
    v21[4] = self;
    objc_msgSend(v18, "enumerateAttribute:inRange:options:usingBlock:", v19, 0, v20, 0, v21);
    -[UITextInputController setSelectedRange:](self, "setSelectedRange:", -[UITextInputController _selectedRange](self, "_selectedRange") + [v18 length], 0);
    -[UITextInputController _sendDelegateChangeNotificationsForText:selection:replacement:characterRange:](self, "_sendDelegateChangeNotificationsForText:selection:replacement:characterRange:", 1, 0, v18, v13, v15);
    *(_DWORD *)&self->_tiFlags &= ~0x2000u;
  }
}

void __60__UITextInputController__insertAttributedText_fromKeyboard___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 96);
  id v6 = v3;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "replaceCharactersInRange:withString:", v5, *(void *)(v4 + 104), &stru_1ED0E84C0);
    [*(id *)(a1 + 32) _clearMarkedText];
    id v3 = v6;
  }
  objc_msgSend(v3, "replaceCharactersInRange:withAttributedString:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 40));
}

uint64_t __60__UITextInputController__insertAttributedText_fromKeyboard___block_invoke_2(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v5 = result;
    id v6 = *(void **)(result + 32);
    uint64_t v7 = *(void *)(result + 40) + a3;
    id v8 = a2;
    uint64_t v9 = [v6 _textStorage];
    uint64_t v10 = [v9 string];
    double v11 = objc_msgSend(v10, "substringWithRange:", v7, 1);
    unsigned int v12 = [v11 isEqualToString:@" "];

    uint64_t v13 = v7 + v12;
    unsigned int v14 = [v8 isLowConfidence];

    uint64_t v15 = *(void **)(v5 + 32);
    return objc_msgSend(v15, "addTextAlternativesDisplayStyle:toRange:", v14, v13, a4 - v12);
  }
  return result;
}

- (void)_insertAttributedTextWithoutClosingTyping:(id)a3
{
  id v9 = a3;
  uint64_t v4 = getUndoActionNameTyping();
  uint64_t v5 = [(UITextInputController *)self selectedRange];
  uint64_t v7 = v6;
  id v8 = [v9 string];
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v4, v5, v7, v8);

  [(UITextInputController *)self _insertAttributedText:v9 fromKeyboard:1];
}

- (NSAttributedString)filteredAttributedText
{
  p_textLayoutController = &self->_textLayoutController;
  id v4 = objc_loadWeakRetained((id *)&self->_textLayoutController);
  uint64_t v5 = [v4 beginningOfDocument];
  id WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  uint64_t v7 = [WeakRetained endOfDocument];
  id v8 = [v4 textRangeFromPosition:v5 toPosition:v7];

  id v9 = [(UITextInputController *)self attributedTextInRange:v8];

  return (NSAttributedString *)v9;
}

- (void)_registerUndoOperationForReplacementWithActionName:(id)a3 replacementText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(UITextInputController *)self selectedRange];
  uint64_t v10 = v9;
  id v11 = [v6 string];

  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 3, v7, v8, v10, v11);
}

- (_NSRange)_rangeForBackwardsDelete
{
  uint64_t v3 = [(UITextInputController *)self _selectedRange];
  NSUInteger length = v4;
  if ([(UITextInputController *)self _hasMarkedText])
  {
    NSUInteger location = self->_markedTextSelection.location;
    NSUInteger length = self->_markedTextSelection.length;
    v3 += location;
    if (!location) {
      goto LABEL_7;
    }
  }
  else if (!v3)
  {
    goto LABEL_7;
  }
  if (!length)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    uint64_t v3 = [WeakRetained rangeOfCharacterClusterAtIndex:v3 - 1 type:4];
    NSUInteger length = v8;
  }
LABEL_7:
  NSUInteger v9 = v3;
  NSUInteger v10 = length;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (void)_updateRangeForSmartDelete
{
  uint64_t v3 = [(UITextInputController *)self selectedRange];
  if (v4)
  {
    uint64_t v5 = v3;
    uint64_t v6 = v4;
    id v7 = +[UIKeyboardImpl activeInstance];
    int v8 = [v7 smartInsertDeleteIsEnabled];

    if (v8)
    {
      NSUInteger v9 = [MEMORY[0x1E4FAE450] traitsForUITextInputTraits:self->_textInputTraits];
      NSUInteger v10 = (void *)[objc_alloc(MEMORY[0x1E4FAE3F8]) initWithTextInputTraits:v9];
      id v11 = [MEMORY[0x1E4FAE2A8] documentStateOfDocumentWithParagraph:self];
      long long v12 = 0uLL;
      [v10 smartDeleteForDocumentState:v11 outBeforeLength:(char *)&v12 + 8 outAfterLength:&v12];
      if (v12 != 0) {
        -[UITextInputController setSelectedRange:](self, "setSelectedRange:", v5 - *((void *)&v12 + 1), *((void *)&v12 + 1) + v6 + (void)v12);
      }
    }
  }
}

- (unint64_t)textLengthToDeleteBeforeSelectedRangeForSmartDelete
{
  [(UITextInputController *)self selectedRange];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = +[UIKeyboardImpl activeInstance];
  int v5 = [v4 smartInsertDeleteIsEnabled];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = [MEMORY[0x1E4FAE450] traitsForUITextInputTraits:self->_textInputTraits];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FAE3F8]) initWithTextInputTraits:v6];
  int v8 = [MEMORY[0x1E4FAE2A8] documentStateOfDocumentWithParagraph:self];
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  [v7 smartDeleteForDocumentState:v8 outBeforeLength:&v12 outAfterLength:&v11];
  unint64_t v9 = v12;

  if (!v9) {
    return 0;
  }
  return v9;
}

- (void)removeAllTextAlternatives
{
  uint64_t v3 = [(UITextInputController *)self _textStorage];
  uint64_t v4 = [v3 length];

  if ((*((unsigned char *)&self->_tiFlags + 2) & 2) != 0)
  {
    int v5 = [(UITextInputController *)self _textStorage];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      id v7 = [(UITextInputController *)self _textStorage];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __50__UITextInputController_removeAllTextAlternatives__block_invoke;
      v12[3] = &__block_descriptor_48_e23_v16__0__NSTextStorage_8l;
      v12[4] = 0;
      v12[5] = v4;
      [v7 coordinateEditing:v12];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
      uint64_t v9 = *(void *)off_1E52D2290;
      id v10 = WeakRetained;
      uint64_t v11 = [v10 documentRange];
      [v10 removeAnnotationAttribute:v9 forRange:v11];
    }
  }
  *(_DWORD *)&self->_tiFlags &= ~0x20000u;
}

uint64_t __50__UITextInputController_removeAllTextAlternatives__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAttribute:range:", *(void *)off_1E52D2288, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)didEndEditing
{
  [(UITextInputController *)self removeAllTextAlternatives];
  uint64_t v3 = [(UITextInputController *)self _textStorage];
  uint64_t v4 = [v3 length];

  if ((*((unsigned char *)&self->_tiFlags + 2) & 4) != 0)
  {
    int v5 = [(UITextInputController *)self _textStorage];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__UITextInputController_didEndEditing__block_invoke;
    v6[3] = &__block_descriptor_48_e23_v16__0__NSTextStorage_8l;
    v6[4] = 0;
    void v6[5] = v4;
    [v5 coordinateEditing:v6];

    *(_DWORD *)&self->_tiFlags &= ~0x40000u;
  }
}

uint64_t __38__UITextInputController_didEndEditing__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAttribute:range:", @"_UITextInputDictationResultMetadata", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)deleteBackward
{
  if ([(UITextInputController *)self _selectedRange]
    || ([(UITextInputController *)self _selectedRange], v4))
  {
    if (+[UIDictationController shouldDeleteBackward])
    {
      [(UITextInputController *)self signalDictationDeletionTip];
      *(_DWORD *)&self->_tiFlags |= 0x2000u;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __39__UITextInputController_deleteBackward__block_invoke;
      v5[3] = &unk_1E52D9CD0;
      v5[4] = self;
      v5[5] = a2;
      [(UITextInputController *)self _performWhileSuppressingDelegateNotifications:v5];
      [(UITextInputController *)self _insertText:&stru_1ED0E84C0 fromKeyboard:1];
      [(UITextInputController *)self removeSpellingMarkersForCurrentWord];
      [(UITextInputController *)self removeAlternativesForCurrentWord];
      *(_DWORD *)&self->_tiFlags &= ~0x2000u;
    }
  }
  else
  {
    [(UITextInputController *)self deleteRemainingSpaceForTextListIfNeeded];
  }
}

void __39__UITextInputController_deleteBackward__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _selectedRange];
  id v2 = *(void **)(a1 + 32);
  if (v3)
  {
    [v2 _updateRangeForSmartDelete];
    uint64_t v4 = *(void **)(a1 + 32);
    int v5 = getUndoActionNameTyping();
    uint64_t v6 = [*(id *)(a1 + 32) selectedRange];
    objc_msgSend(v4, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v5, v6, v7, &stru_1ED0E84C0);
  }
  else
  {
    uint64_t v8 = [v2 _rangeForBackwardsDelete];
    if (!v9)
    {
      unint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"UITextInputController.m" lineNumber:1598 description:@"Failed to deleteBackward in a non-empty document."];

      *(_DWORD *)(*(void *)(a1 + 32) + 144) &= ~0x2000u;
      return;
    }
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    unint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = getUndoActionNameTyping();
    objc_msgSend(v12, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v13, v10, v11, &stru_1ED0E84C0);

    objc_msgSend(*(id *)(a1 + 32), "setSelectedRange:", v10, v11);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  unsigned int v14 = [*(id *)(a1 + 32) selectedTextRange];
  uint64_t v15 = [v14 start];
  id v16 = [WeakRetained emptyTextRangeAtPosition:v15];
  [*(id *)(a1 + 32) setPreviousSelectedTextRange:v16];
}

- (void)deleteRemainingSpaceForTextListIfNeeded
{
  uint64_t v3 = [(UITextInputController *)self _textStorage];
  if ([v3 length] == 1)
  {
    uint64_t v4 = [v3 string];
    int v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];
    uint64_t v7 = [v6 length];

    if (!v7)
    {
      unint64_t v19 = 0;
      uint64_t v8 = [v3 string];
      objc_msgSend(v8, "getParagraphStart:end:contentsEnd:forRange:", &v19, 0, 0, 0, objc_msgSend(v3, "length"));

      unint64_t v9 = v19;
      if (v9 < [v3 length])
      {
        uint64_t v10 = *(void *)off_1E52D21B8;
        uint64_t v11 = [v3 attribute:*(void *)off_1E52D21B8 atIndex:v19 effectiveRange:0];
        unint64_t v12 = v11;
        if (v11)
        {
          uint64_t v13 = [v11 textLists];
          uint64_t v14 = [v13 count];

          if (v14)
          {
            uint64_t v15 = [(UITextInputController *)self _textStorage];
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __64__UITextInputController_deleteRemainingSpaceForTextListIfNeeded__block_invoke;
            v18[3] = &unk_1E530B408;
            v18[4] = self;
            [v15 coordinateEditing:v18];

            id v16 = [(UITextInputController *)self typingAttributes];
            unint64_t v17 = [v16 objectForKeyedSubscript:v10];

            [v17 setTextLists:MEMORY[0x1E4F1CBF0]];
          }
        }
      }
    }
  }
}

void __64__UITextInputController_deleteRemainingSpaceForTextListIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28B18];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v7 = [*(id *)(a1 + 32) typingAttributes];
  uint64_t v6 = (void *)[v5 initWithString:&stru_1ED0E84C0 attributes:v7];
  objc_msgSend(v4, "replaceCharactersInRange:withAttributedString:", 0, 1, v6);
}

- (void)checkSmartPunctuationForWordInRange:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && ![(UITextInputController *)self isWritingToolsStreamingReplacements])
  {
    id v5 = +[UIKeyboardImpl activeInstance];
    uint64_t v6 = [v5 smartPunctuationController];

    if (v6)
    {
      uint64_t v7 = [(UITextInputController *)self selectedRange];
      uint64_t v32 = v8;
      unint64_t v9 = [(UITextInputController *)self textInRange:v4];
      id v10 = objc_loadWeakRetained((id *)&self->_textLayoutController);
      uint64_t v11 = [v10 beginningOfDocument];
      unint64_t v12 = [v4 start];
      uint64_t v13 = [v10 offsetFromPosition:v11 toPosition:v12];

      [v6 smartPunctuationResultsForString:v9];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v28 = v7;
        id v29 = v9;
        id v30 = v6;
        id v31 = v4;
        char v33 = 0;
        uint64_t v16 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v36 != v16) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            uint64_t v19 = objc_msgSend(v18, "range", v28, v29, v30, v31);
            uint64_t v21 = v20;
            uint64_t v22 = v19 + v13;
            id v23 = [v18 replacementString];
            BOOL v24 = -[UITextInputController _delegateShouldChangeTextInRange:replacementText:](self, "_delegateShouldChangeTextInRange:replacementText:", v22, v21, v23);

            if (v24)
            {
              id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
              uint64_t v26 = objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v22, v21);

              uint64_t v27 = [v18 replacementString];
              [(UITextInputController *)self replaceRange:v26 withText:v27];

              char v33 = 1;
            }
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v15);
        uint64_t v6 = v30;
        id v4 = v31;
        unint64_t v9 = v29;
        if (v33) {
          -[UITextInputController setSelectedRange:](self, "setSelectedRange:", v28, v32);
        }
      }
    }
  }
}

- (id)textChecker
{
  textChecker = self->_textChecker;
  if (!textChecker)
  {
    id v4 = [[UITextChecker alloc] _initWithAsynchronousLoading:1];
    id v5 = self->_textChecker;
    self->_textChecker = v4;

    textChecker = self->_textChecker;
  }
  if ([(UITextChecker *)textChecker _doneLoading]) {
    uint64_t v6 = self->_textChecker;
  }
  else {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)preheatTextChecker
{
  if (!self->_textChecker)
  {
    uint64_t v3 = [[UITextChecker alloc] _initWithAsynchronousLoading:1];
    textChecker = self->_textChecker;
    self->_textChecker = v3;
  }
}

- (void)checkSpellingForWordInRange:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(UITextInputController *)self textInRange:v4];
    uint64_t v6 = [(UITextInputController *)self textChecker];
    if (!v6)
    {
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v7 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v8 = [v7 currentInputMode];

    unint64_t v9 = [v8 multilingualLanguages];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      uint64_t v11 = [v8 multilingualLanguages];
    }
    else
    {
      unint64_t v12 = [v8 primaryLanguage];

      if (v12)
      {
        uint64_t v13 = [v8 languageWithRegion];
        v28[0] = v13;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      }
      else
      {
        uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    uint64_t v14 = +[UIDictationController sharedInstance];
    uint64_t v15 = [v14 detectedLanguage];

    uint64_t v16 = +[UIDictationController sharedInstance];
    unint64_t v17 = [v16 language];

    if (v15)
    {
      id v18 = [v15 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

      if (([v11 containsObject:v18] & 1) == 0)
      {
        uint64_t v19 = [v11 arrayByAddingObject:v18];
LABEL_15:

        uint64_t v11 = (void *)v19;
      }
    }
    else
    {
      if (v17 && ([v11 containsObject:v17] & 1) == 0)
      {
        uint64_t v19 = [v11 arrayByAddingObject:v17];
        id v18 = 0;
        goto LABEL_15;
      }
      id v18 = 0;
    }
    if (objc_msgSend(v6, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", v5, 0, objc_msgSend(v5, "length"), 0, 0, v11) != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v20 = [(UITextInputController *)self beginningOfDocument];
      [v4 start];
      uint64_t v27 = v5;
      v22 = uint64_t v21 = v8;
      int64_t v26 = [(UITextInputController *)self offsetFromPosition:v20 toPosition:v22];

      id v23 = [v4 start];
      BOOL v24 = [v4 end];
      int64_t v25 = [(UITextInputController *)self offsetFromPosition:v23 toPosition:v24];

      uint64_t v8 = v21;
      id v5 = v27;

      -[UITextInputController addTextAlternativesDisplayStyle:toRange:](self, "addTextAlternativesDisplayStyle:toRange:", 2, v26, v25);
    }

    goto LABEL_19;
  }
LABEL_20:
}

- (_NSRange)nsRangeForTextRange:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(UITextInputController *)self beginningOfDocument];
    uint64_t v6 = [v4 start];
    int64_t v7 = [(UITextInputController *)self offsetFromPosition:v5 toPosition:v6];

    uint64_t v8 = [v4 start];
    unint64_t v9 = [v4 end];

    int64_t v10 = [(UITextInputController *)self offsetFromPosition:v8 toPosition:v9];
  }
  else
  {
    int64_t v10 = 0;
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v11 = v7;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (id)textRangeForNSRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  uint64_t v6 = objc_msgSend(WeakRetained, "textRangeForCharacterRange:", location, length);

  return v6;
}

- (void)removeSpellingMarkersFromWordInRange:(id)a3
{
  id v23 = a3;
  uint64_t v4 = -[UITextInputController nsRangeForTextRange:](self, "nsRangeForTextRange:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    uint64_t v9 = *(void *)off_1E52D2290;
    int64_t v10 = [v23 start];
    NSUInteger v11 = [WeakRetained annotationAttribute:v9 atPosition:v10];

    if (v11 && [v11 integerValue] == 2)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_textLayoutController);
      [v12 removeAnnotationAttribute:v9 forRange:v23];

      id v13 = objc_loadWeakRetained((id *)&self->_textLayoutController);
      objc_msgSend(v13, "boundingRectForCharacterRange:", v6, v7);
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;

      id v22 = objc_loadWeakRetained((id *)&self->_firstTextView);
      objc_msgSend(v22, "setNeedsDisplayInRect:", v15, v17, v19, v21);
    }
  }
}

- (void)removeSpellingMarkersForCurrentWord
{
  uint64_t v3 = [(UITextInputController *)self selectedTextRange];
  id v8 = [v3 start];

  uint64_t v4 = v8;
  if (v8)
  {
    uint64_t v5 = [(UITextInputController *)self tokenizer];
    uint64_t v6 = [v5 rangeEnclosingPosition:v8 withGranularity:1 inDirection:0];

    if (!v6)
    {
      uint64_t v7 = [(UITextInputController *)self tokenizer];
      uint64_t v6 = [v7 rangeEnclosingPosition:v8 withGranularity:1 inDirection:1];
    }
    [(UITextInputController *)self removeSpellingMarkersFromWordInRange:v6];

    uint64_t v4 = v8;
  }
}

- (void)notifyTextCheckingControllerForSelectionChange
{
  textCheckingController = self->_textCheckingController;
  id v3 = [(UITextInputController *)self previousSelectedTextRange];
  [(UITextCheckingController *)textCheckingController didChangeSelectionFromRange:v3];
}

- (void)checkSpellingForSelectionChangeIfNecessary
{
  if ([(UITextInputController *)self continuousSpellCheckingEnabled])
  {
    id v3 = [(UITextInputController *)self previousSelectedTextRange];
    uint64_t v4 = [v3 start];

    if (v4)
    {
      uint64_t v5 = [(UITextInputController *)self tokenizer];
      id v17 = [v5 rangeEnclosingPosition:v4 withGranularity:1 inDirection:0];

      if (!v17)
      {
        uint64_t v6 = [(UITextInputController *)self tokenizer];
        id v17 = [v6 rangeEnclosingPosition:v4 withGranularity:1 inDirection:1];
      }
    }
    else
    {
      id v17 = 0;
    }
    uint64_t v7 = [(UITextInputController *)self beginningOfDocument];
    id v8 = [(UITextInputController *)self positionFromPosition:v7 offset:[(UITextInputController *)self selectedRange]];

    uint64_t v9 = [(UITextInputController *)self tokenizer];
    int64_t v10 = [v9 rangeEnclosingPosition:v8 withGranularity:1 inDirection:0];

    if (!v10)
    {
      NSUInteger v11 = [(UITextInputController *)self tokenizer];
      int64_t v10 = [v11 rangeEnclosingPosition:v8 withGranularity:1 inDirection:1];
    }
    unint64_t v12 = [(UITextInputController *)self nsRangeForTextRange:v17];
    uint64_t v14 = v13;
    if (([v17 isEqual:v10] & 1) == 0)
    {
      uint64_t v15 = [(UITextInputController *)self selectedRange];
      if (v15 + v16 < v12 || [(UITextInputController *)self selectedRange] > v12 + v14)
      {
        [(UITextInputController *)self checkSpellingForWordInRange:v17];
        [(UITextInputController *)self removeSpellingMarkersFromWordInRange:v10];
      }
    }
  }
}

- (BOOL)performFinalGrammarChecking
{
  return [(UITextCheckingController *)self->_textCheckingController performFinalGrammarChecking];
}

- (void)applyGrammarCheckingIndication
{
}

- (void)beginSelectionChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  [WeakRetained selectionWillChange:self];

  id v4 = [(UITextInputController *)self selectedTextRange];
  [(UITextInputController *)self setPreviousSelectedTextRange:v4];
}

- (void)endSelectionChange
{
  [(UITextInputController *)self notifyTextCheckingControllerForSelectionChange];
  id v3 = [(UITextInputController *)self previousSelectedTextRange];
  id v4 = [(UITextInputController *)self selectedTextRange];
  id v5 = v3;
  id v6 = v4;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  uint64_t v7 = v6;
  if (!v5 || !v6)
  {

    goto LABEL_8;
  }
  char v8 = [v5 isEqual:v6];

  if ((v8 & 1) == 0) {
LABEL_8:
  }
    [(UITextInputController *)self setTypingAttributes:0];
LABEL_9:
  [(UITextInputController *)self changingContextWithTrigger:@"selectionChange"];
  +[UIKBAnalyticsDispatcher incrementAllowCursorMovementCount];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  [WeakRetained selectionDidChange:self];

  +[UIKBAnalyticsDispatcher decrementAllowCursorMovementCount];
}

- (void)changingContextWithTrigger:(id)a3
{
  id v8 = a3;
  p_inputDelegate = &self->_inputDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_inputDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_inputDelegate);
    [v7 performSelector:sel_changingContextWithTrigger_ withObject:v8];
  }
}

uint64_t __48__UITextInputController_selectionRectsForRange___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 containsStart];
}

uint64_t __48__UITextInputController_selectionRectsForRange___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 containsEnd];
}

BOOL __48__UITextInputController_selectionRectsForRange___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isEqual:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    int v7 = [v4 isVertical];
    if (v7 == [v5 isVertical])
    {
      int v8 = [v4 isVertical];
      [v4 rect];
      double v10 = v9;
      double v12 = v11;
      [v5 rect];
      if (v8) {
        BOOL v6 = v10 == v13;
      }
      else {
        BOOL v6 = v12 == v14;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

uint64_t __48__UITextInputController_selectionRectsForRange___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

uint64_t __48__UITextInputController_selectionRectsForRange___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (id)_rectsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  int v7 = objc_msgSend(WeakRetained, "textRangeForCharacterRange:", location, length);
  int v8 = [(UITextInputController *)self selectionRectsForRange:v7];

  return v8;
}

- (id)_characterPositionForPoint:(CGPoint)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  p_textLayoutController = &self->_textLayoutController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  BOOL v6 = [WeakRetained textContainers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v35 = v10;
    double v36 = *MEMORY[0x1E4F1DAD8];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        double v13 = objc_msgSend(v12, "textView", *(void *)&v35);
        if ([(UITextInputController *)self _shouldConsiderTextViewForGeometry:v13])
        {
          char v14 = objc_opt_respondsToSelector();
          double v15 = v36;
          double v16 = v10;
          if (v14) {
            objc_msgSend(v13, "textContainerOrigin", v36, v10);
          }
          double v17 = a3.x - v15;
          double v18 = a3.y - v16;
          [v13 bounds];
          CGFloat x = v46.origin.x;
          double y = v46.origin.y;
          CGFloat width = v46.size.width;
          double height = v46.size.height;
          v45.CGFloat x = v17;
          v45.double y = v18;
          if (CGRectContainsPoint(v46, v45)) {
            goto LABEL_14;
          }
          v47.origin.CGFloat x = x;
          v47.origin.double y = y;
          v47.size.CGFloat width = width;
          v47.size.double height = height;
          double v23 = CGRectGetMinX(v47) - v17;
          v48.origin.CGFloat x = x;
          v48.origin.double y = y;
          v48.size.CGFloat width = width;
          v48.size.double height = height;
          double v24 = fmin(v23, v17 - CGRectGetMaxX(v48));
          v49.origin.CGFloat x = x;
          v49.origin.double y = y;
          v49.size.CGFloat width = width;
          v49.size.double height = height;
          double v25 = CGRectGetMinY(v49) - v18;
          v50.origin.CGFloat x = x;
          v50.origin.double y = y;
          v50.size.CGFloat width = width;
          v50.size.double height = height;
          double v26 = fmin(v25, v18 - CGRectGetMaxY(v50));
          double v27 = v24 * v24;
          double v10 = v35;
          if (v27 + v26 * v26 < INFINITY)
          {
LABEL_14:
            [v12 size];
            if (y <= a3.y && a3.y <= y + height)
            {
              double v31 = v10 + v29;
              if (v18 > v10 + v29)
              {
                [v13 _currentScreenScale];
                double v18 = v31 + -1.0 / v32;
              }
              if (v18 < v10) {
                double v18 = v10;
              }
            }
            id v33 = objc_loadWeakRetained((id *)p_textLayoutController);
            uint64_t v28 = objc_msgSend(v33, "cursorPositionAtPoint:inContainer:", v12, v17, v18);

            goto LABEL_23;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v6 = objc_loadWeakRetained((id *)p_textLayoutController);
  uint64_t v28 = [v6 endOfDocument];
LABEL_23:

  return v28;
}

- (unint64_t)_validCaretPositionFromCharacterIndex:(unint64_t)a3 downstream:(BOOL)a4
{
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  unint64_t v14 = a3;
  BOOL v6 = [(UITextInputController *)self _textStorage];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__UITextInputController__validCaretPositionFromCharacterIndex_downstream___block_invoke;
  v9[3] = &unk_1E530B6F0;
  v9[4] = self;
  void v9[5] = &v11;
  BOOL v10 = a4;
  [v6 coordinateReading:v9];

  unint64_t v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __74__UITextInputController__validCaretPositionFromCharacterIndex_downstream___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 string];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v4 != [v3 length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
    uint64_t v6 = [WeakRetained rangeOfCharacterClusterAtIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) type:3];
    uint64_t v8 = v7;

    while (1)
    {
      if (*(unsigned char *)(a1 + 48)) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9 + v6;
      [*(id *)(a1 + 32) _caretRectForOffset:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
      if (!CGRectIsNull(v16)) {
        break;
      }
      if (*(unsigned char *)(a1 + 48))
      {
        unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        if (v10 < [v3 length])
        {
          uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v12 = *(void *)(v11 + 24);
          if (*(unsigned char *)(a1 + 48)) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
        if (*(unsigned char *)(a1 + 48)) {
          break;
        }
      }
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v12 = *(void *)(v11 + 24);
      if (!v12) {
        break;
      }
LABEL_16:
      --v12;
LABEL_17:
      *(void *)(v11 + 24) = v12;
      uint64_t v6 = [v3 rangeOfComposedCharacterSequenceAtIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
      uint64_t v8 = v13;
    }
  }
}

- (id)_parentScrollView
{
  id v2 = [(UITextInputController *)self _firstTextView];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      id v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (void)scrollRangeToVisible:(_NSRange)a3
{
  -[UITextInputController _rectsForRange:](self, "_rectsForRange:", a3.location, a3.length);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if ([v14 count])
  {
    uint64_t v4 = [v14 objectAtIndex:0];
    [v4 rect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    uint64_t v13 = [(UITextInputController *)self _parentScrollView];
    objc_msgSend(v13, "scrollRectToVisible:animated:", 1, v6, v8, v10, v12);
  }
}

- (void)_ensureSelectionVisible
{
  uint64_t v3 = [(UITextInputController *)self _selectedRange];
  -[UITextInputController scrollRangeToVisible:](self, "scrollRangeToVisible:", v3, 1);
}

- (id)attributedTextInRange:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__211;
  CGRect v16 = __Block_byref_object_dispose__211;
  id v17 = 0;
  double v5 = [(UITextInputController *)self _textStorage];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__UITextInputController_attributedTextInRange___block_invoke;
  v9[3] = &unk_1E530B718;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  double v11 = &v12;
  [v5 coordinateReading:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__UITextInputController_attributedTextInRange___block_invoke(uint64_t a1, void *a2)
{
  id v27 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  id v4 = [*(id *)(a1 + 32) selectedTextRange];
  uint64_t v5 = [WeakRetained characterRangeForTextRange:v4];

  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  uint64_t v7 = [v6 characterRangeForTextRange:*(void *)(a1 + 40)];
  NSUInteger v9 = v8;

  if ((int)v7 < 0) {
    uint64_t v10 = v5;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = v10 + v7;
  if ((v11 & 0x80000000) != 0) {
    NSUInteger v12 = 0;
  }
  else {
    NSUInteger v12 = v11;
  }
  if (v12 > [v27 length]) {
    NSUInteger v12 = [v27 length];
  }
  if (v12 + v9 > [v27 length]) {
    NSUInteger v9 = [v27 length] - v12;
  }
  uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 224);
  if (v13)
  {
    uint64_t v14 = [v13 attachment];
    NSUInteger v15 = [v14 attachmentRange];
    NSUInteger v17 = v16;

    v29.NSUInteger location = v12;
    v29.NSUInteger length = v9;
    v30.NSUInteger location = v15;
    v30.NSUInteger length = v17;
    NSRange v18 = NSIntersectionRange(v29, v30);
    if (v18.length)
    {
      double v19 = objc_msgSend(v27, "attributedSubstringFromRange:", v12, v9);
      double v20 = (void *)[v19 mutableCopy];

      double v21 = [NSString _stringWithUnichar:65532];
      objc_msgSend(v20, "replaceCharactersInRange:withString:", v18.location - v12, v18.length, v21);

      uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
      double v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v20;
    }
  }
  uint64_t v24 = objc_msgSend(v27, "attributedSubstringFromRange:", v12, v9);
  uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
  double v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v24;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(UITextInputController *)self _selectedRange];
  id v9 = -[UITextInputController _newAttributedStringForInsertionOfText:inRange:](self, "_newAttributedStringForInsertionOfText:inRange:", v6, v7, v8);

  id v10 = [(UITextInputController *)self _replaceRange:v11 withAttributedTextFromKeyboard:v9 addingUnderlinesForAlternatives:0 updatingSelection:1];
}

- (void)replaceRange:(id)a3 withAttributedText:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(UITextInputController *)self _replaceRange:v8 withAttributedTextFromKeyboard:v6 addingUnderlinesForAlternatives:[(UITextInputController *)self isWritingToolsStreamingReplacements] ^ 1 updatingSelection:1];
}

- (id)replaceRange:(id)a3 withAttributedText:(id)a4 updatingSelection:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(UITextInputController *)self _replaceRange:v9 withAttributedTextFromKeyboard:v8 addingUnderlinesForAlternatives:[(UITextInputController *)self isWritingToolsStreamingReplacements] ^ 1 updatingSelection:v5];

  return v10;
}

- (id)_replaceRange:(id)a3 withAttributedTextFromKeyboard:(id)a4 addingUnderlinesForAlternatives:(BOOL)a5 updatingSelection:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0)
    {
      if (byte_1E8FD4F9C)
      {
        long long v40 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantComposition", &_replaceRange_withAttributedTextFromKeyboard_addingUnderlinesForAlternatives_updatingSelection____s_category)+ 8);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          long long v41 = @"NO";
          *(_DWORD *)buf = 138413058;
          *(void *)&buf[4] = v10;
          if (v7) {
            id v42 = @"YES";
          }
          else {
            id v42 = @"NO";
          }
          if (v6) {
            long long v41 = @"YES";
          }
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v11;
          *(_WORD *)&buf[22] = 2112;
          uint64_t v61 = v42;
          LOWORD(v62) = 2112;
          *(void *)((char *)&v62 + 2) = v41;
          _os_log_impl(&dword_1853B0000, v40, OS_LOG_TYPE_ERROR, "replacing range, %@, with attributed text: %@\naddUnderlines? %@ updateSelection? %@", buf, 0x2Au);
        }
      }
    }
  }
  *(_DWORD *)&self->_tiFlags |= 0x2000u;
  unint64_t v12 = [(UITextInputController *)self selectedRange];
  [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:0];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3010000000;
  uint64_t v61 = (__CFString *)&unk_186D7DBA7;
  long long v62 = xmmword_186B93450;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__211;
  v57 = __Block_byref_object_dispose__211;
  id v58 = 0;
  uint64_t v13 = [(UITextInputController *)self _textStorage];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __120__UITextInputController__replaceRange_withAttributedTextFromKeyboard_addingUnderlinesForAlternatives_updatingSelection___block_invoke;
  v47[3] = &unk_1E530B768;
  v47[4] = self;
  CGRect v50 = buf;
  id v14 = v10;
  id v48 = v14;
  id v15 = v11;
  BOOL v52 = v7;
  id v49 = v15;
  double v51 = &v53;
  [v13 coordinateEditing:v47];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v16 = (id)v54[5];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v44 != v18) {
          objc_enumerationMutation(v16);
        }
        -[UITextInputController invalidateDisplayForRange:]((uint64_t)self, *(void **)(*((void *)&v43 + 1) + 8 * i));
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v59 count:16];
    }
    while (v17);
  }

  p_textLayoutController = &self->_textLayoutController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  uint64_t v22 = objc_msgSend(v14, "start", (void)v43);
  double v23 = -[_UITextLayoutControllerBase positionFromPosition:offset:](WeakRetained, (uint64_t)v22, [v15 length]);

  if (v6)
  {
    id v24 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    uint64_t v25 = [v24 emptyTextRangeAtPosition:v23];
    [(UITextInputController *)self setSelectedTextRange:v25];

    double v26 = [(UITextInputController *)self interactionAssistant];
    [v26 selectionChanged];

    uint64_t v27 = [(UITextInputController *)self selectedRange];
    if (v27 + v28 >= v12) {
      unint64_t v29 = v27 + v28 - v12;
    }
    else {
      unint64_t v29 = 0;
    }
    if (v27 + v28 >= v12) {
      unint64_t v30 = v12;
    }
    else {
      unint64_t v30 = v27 + v28;
    }
    id v31 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    double v32 = objc_msgSend(v31, "textRangeForCharacterRange:", v30, v29);

    [(UITextInputController *)self checkSmartPunctuationForWordInRange:v32];
  }
  -[UITextInputController _sendDelegateChangeNotificationsForText:selection:replacement:characterRange:](self, "_sendDelegateChangeNotificationsForText:selection:replacement:characterRange:", 1, 0, v15, *(void *)(*(void *)&buf[8] + 32), *(void *)(*(void *)&buf[8] + 40));
  *(_DWORD *)&self->_tiFlags &= ~0x2000u;
  id v33 = [v14 start];
  if (v33) {
    BOOL v34 = v23 == 0;
  }
  else {
    BOOL v34 = 1;
  }
  char v35 = v34;

  if (v35)
  {
    double v36 = 0;
  }
  else
  {
    id v37 = objc_loadWeakRetained((id *)p_textLayoutController);
    long long v38 = [v14 start];
    double v36 = [v37 textRangeFromPosition:v38 toPosition:v23];
  }
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(buf, 8);
  return v36;
}

void __120__UITextInputController__replaceRange_withAttributedTextFromKeyboard_addingUnderlinesForAlternatives_updatingSelection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 string];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  BOOL v6 = [*(id *)(a1 + 32) selectedTextRange];
  uint64_t v7 = [WeakRetained characterRangeForTextRange:v6];

  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  uint64_t v9 = [v8 characterRangeForTextRange:*(void *)(a1 + 40)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v10 + 32) = v9;
  *(void *)(v10 + 40) = v11;

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void *)(v12 + 32);
  if ((int)v13 < 0) {
    uint64_t v14 = v7;
  }
  else {
    uint64_t v14 = 0;
  }
  *(void *)(v12 + 32) = v14 + v13;
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(void *)(v15 + 32);
  if ((int)v16 < 0) {
    uint64_t v16 = 0;
  }
  *(void *)(v15 + 32) = v16;
  unint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
  if (v17 <= [v4 length])
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v18 = *(void *)(v19 + 32);
  }
  else
  {
    uint64_t v18 = [v4 length];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  }
  *(void *)(v19 + 32) = v18;
  unint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
      + *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
  if (v20 <= [v4 length])
  {
    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v23 = *(void *)(v22 + 40);
  }
  else
  {
    uint64_t v21 = [v4 length];
    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v23 = v21 - *(void *)(v22 + 32);
  }
  *(void *)(v22 + 40) = v23;
  id v24 = *(void **)(a1 + 32);
  uint64_t v25 = _UIKitBundle();
  double v26 = [v25 localizedStringForKey:@"Replace" value:@"Replace" table:@"Localizable"];
  uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v28 = [*(id *)(a1 + 48) string];
  objc_msgSend(v24, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 3, v26, *(void *)(v27 + 32), *(void *)(v27 + 40), v28);

  uint64_t v29 = objc_msgSend(*(id *)(a1 + 32), "_rangeAfterCancelDictationIfNecessaryForChangeInRange:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v30 + 32) = v29;
  *(void *)(v30 + 40) = v31;
  double v32 = *(unsigned char **)(a1 + 32);
  if ((v32[145] & 0x10) != 0)
  {
    id v33 = [v32 delegate];
    objc_msgSend(v33, "textInput:willChangeCharactersInRange:", *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  objc_msgSend(v3, "replaceCharactersInRange:withAttributedString:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(void *)(a1 + 48));
  if (*(unsigned char *)(a1 + 72))
  {
    BOOL v34 = *(void **)(a1 + 48);
    uint64_t v35 = *(void *)off_1E52D2288;
    uint64_t v36 = [v34 length];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __120__UITextInputController__replaceRange_withAttributedTextFromKeyboard_addingUnderlinesForAlternatives_updatingSelection___block_invoke_2;
    v37[3] = &unk_1E530B740;
    int8x16_t v38 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    v37[4] = *(void *)(a1 + 32);
    objc_msgSend(v34, "enumerateAttribute:inRange:options:usingBlock:", v35, 0, v36, 0, v37);
  }
}

void __120__UITextInputController__replaceRange_withAttributedTextFromKeyboard_addingUnderlinesForAlternatives_updatingSelection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v16 = v7;
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) + a3;
    objc_msgSend(*(id *)(a1 + 32), "addTextAlternativesDisplayStyle:toRange:invalidatingDisplayInBoundingRect:", objc_msgSend(v16, "isLowConfidence"), v11, a4, 0);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(v12 + 248));
    uint64_t v15 = objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v11, a4);
    [v13 addObject:v15];

    id v7 = v16;
  }
}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  uint64_t v9 = [WeakRetained characterRangeForTextRange:v6];
  uint64_t v11 = v10;

  if ((*((unsigned char *)&self->_tiFlags + 1) & 0x10) != 0)
  {
    uint64_t v12 = [(UITextInputController *)self delegate];
    objc_msgSend(v12, "textInput:willChangeCharactersInRange:", self, v9, v11);
  }
  uint64_t v13 = getUndoActionNameTyping();
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v13, v9, v11, &stru_1ED0E84C0);

  uint64_t v14 = getUndoActionNameTyping();
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v14, v9, 0, v7);

  uint64_t v15 = [(UITextInputController *)self selectedTextRange];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__UITextInputController_replaceRangeWithTextWithoutClosingTyping_replacementText___block_invoke;
  v20[3] = &unk_1E52E9D28;
  v20[4] = self;
  id v21 = v6;
  id v16 = (__CFString *)v7;
  uint64_t v22 = v16;
  uint64_t v23 = v9;
  uint64_t v24 = v11;
  id v17 = v6;
  [(UITextInputController *)self _performWhileSuppressingDelegateNotifications:v20];
  if (v16) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = &stru_1ED0E84C0;
  }
  uint64_t v19 = [(UITextInputController *)self selectedTextRange];
  -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, [v15 isEqual:v19] ^ 1);
}

void __82__UITextInputController_replaceRangeWithTextWithoutClosingTyping_replacementText___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelectedTextRange:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _insertText:*(void *)(a1 + 48) fromKeyboard:1];
  uint64_t v2 = [*(id *)(a1 + 32) selectedRange];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v5 = v2 + v4 - v3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v3, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) checkSmartPunctuationForWordInRange:v7];
}

- (void)correctedTypedText:(id)a3 rangeOfReplacement:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained correctedTypedText:v8 rangeOfReplacement:v6];
  }
}

- (void)_performWhileSuppressingDelegateNotifications:(id)a3
{
  $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = self->_tiFlags;
  self->_$DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&tiFlags | 0x80000);
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_$DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFF7FFFF | (((*(unsigned int *)&tiFlags >> 19) & 1) << 19));
}

- (int64_t)selectionAffinity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  [(UITextRange *)self->_selectedTextRange end];

  return *(_OWORD *)&self->_markedTextRange.length != 0;
}

- (void)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4 fromKeyboard:(BOOL)a5 useTextStyle:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  NSUInteger v11 = self->_markedTextRange.length;
  if (v11)
  {
    NSUInteger v12 = self->_markedTextRange.location;
  }
  else
  {
    NSUInteger v12 = [(UITextInputController *)self _selectedRange];
    NSUInteger v11 = v13;
  }
  NSUInteger v45 = length;
  if (v6)
  {
    uint64_t v14 = [(UITextInputController *)self markedTextStyle];
    uint64_t v15 = (void *)[v14 mutableCopy];
    id v16 = v15;
    if (v15) {
      id v17 = v15;
    }
    else {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v19 = v17;

    unint64_t v20 = -[UITextInputController _attributesForInsertionOfText:](self, "_attributesForInsertionOfText:", v12, v11);
    [v19 addEntriesFromDictionary:v20];

    uint64_t v18 = (void *)[v19 copy];
  }
  else
  {
    uint64_t v18 = -[UITextInputController _attributesForInsertionOfText:](self, "_attributesForInsertionOfText:", v12, v11);
  }
  id v21 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v22 = [v10 string];
  uint64_t v23 = (void *)[v21 initWithString:v22 attributes:v18];

  [v23 beginEditing];
  uint64_t v24 = [v10 length];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __90__UITextInputController__setAttributedMarkedText_selectedRange_fromKeyboard_useTextStyle___block_invoke;
  v68[3] = &unk_1E52D9AA8;
  id v25 = v23;
  id v69 = v25;
  objc_msgSend(v10, "enumerateAttributesInRange:options:usingBlock:", 0, v24, 0, v68);
  if ((*(unsigned char *)&self->_tiFlags & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained textInput:self prepareAttributedTextForInsertion:v25];
  }
  objc_msgSend(v25, "endEditing", v45);
  uint64_t v27 = (void *)[v25 copy];

  uint64_t v28 = [v27 length];
  if (v28 || self->_markedTextRange.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_DWORD *)&self->_tiFlags |= 0x8000u;
    [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:1];
    uint64_t v64 = 0;
    long long v65 = &v64;
    uint64_t v66 = 0x2020000000;
    uint64_t v67 = 0;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x3010000000;
    uint64_t v62 = 0;
    uint64_t v63 = 0;
    uint64_t v61 = &unk_186D7DBA7;
    uint64_t v52 = 0;
    uint64_t v53 = &v52;
    uint64_t v54 = 0x3032000000;
    uint64_t v55 = __Block_byref_object_copy__211;
    v56 = __Block_byref_object_dispose__211;
    id v57 = 0;
    uint64_t v29 = [(UITextInputController *)self _textStorage];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __90__UITextInputController__setAttributedMarkedText_selectedRange_fromKeyboard_useTextStyle___block_invoke_2;
    v47[3] = &unk_1E530B790;
    v47[4] = self;
    id v30 = v27;
    id v48 = v30;
    id v49 = &v52;
    CGRect v50 = &v58;
    double v51 = &v64;
    [v29 coordinateEditing:v47];

    uint64_t v31 = [(UITextInputController *)self _textStorage];
    uint64_t v32 = [v31 length];

    if (v65[3] != v32)
    {
      id v33 = [(UITextInputController *)self _textStorage];
      BOOL v34 = [v33 string];
      uint64_t v35 = objc_msgSend(v34, "substringWithRange:", self->_markedTextRange.location, self->_markedTextRange.length);
      uint64_t v36 = [v30 string];
      char v37 = [v35 isEqualToString:v36];

      if ((v37 & 1) == 0)
      {
        uint64_t v38 = v32 - v65[3];
        location += v38;
        self->_markedTextRange.location += v38;
      }
    }
    id v39 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    objc_msgSend(v39, "invalidateDisplayForCharacterRange:", self->_markedTextRange.location, self->_markedTextRange.length);

    -[UITextInputController _setSelectedRange:](self, "_setSelectedRange:", self->_markedTextRange.location, self->_markedTextRange.length);
    NSUInteger v40 = self->_markedTextRange.location;
    unint64_t v41 = [(UITextInputController *)self _selectedRange];
    NSUInteger v43 = v46;
    if (v40 + location > v41 + v42 || v41 > v40 + location + v46)
    {
      NSUInteger v43 = 0;
      NSUInteger location = self->_markedTextRange.length;
    }
    self->_markedTextSelection.NSUInteger location = location;
    self->_markedTextSelection.NSUInteger length = v43;
    long long v44 = [(UITextInputController *)self interactionAssistant];
    [v44 selectionChanged];

    if (!v28) {
      [(UITextInputController *)self unmarkText];
    }
    *(_DWORD *)&self->_tiFlags &= ~0x8000u;
    -[UITextInputController _sendDelegateChangeNotificationsForText:selection:replacement:characterRange:](self, "_sendDelegateChangeNotificationsForText:selection:replacement:characterRange:", 1, 1, v53[5], v59[4], v59[5]);

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v64, 8);
  }
}

uint64_t __90__UITextInputController__setAttributedMarkedText_selectedRange_fromKeyboard_useTextStyle___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

void __90__UITextInputController__setAttributedMarkedText_selectedRange_fromKeyboard_useTextStyle___block_invoke_2(uint64_t a1, void *a2)
{
  id v18 = a2;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[13];
  if (!v4)
  {
    v3[12] = [*(id *)(a1 + 32) _selectedRange];
    v3[13] = v5;
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[13];
  }
  v3[12] = objc_msgSend(v3, "_rangeAfterCancelDictationIfNecessaryForChangeInRange:", v3[12], v4);
  v3[13] = v6;
  id v7 = *(void **)(a1 + 32);
  id v8 = getUndoActionNameTyping();
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) string];
  objc_msgSend(v7, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v8, *(void *)(v9 + 96), *(void *)(v9 + 104), v10);

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), *(id *)(a1 + 40));
  NSUInteger v11 = *(void **)(a1 + 32);
  NSUInteger v12 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) string];
  uint64_t v13 = objc_msgSend(v11, "_newAttributedStringForInsertionOfText:inRange:", v12, *(void *)(*(void *)(a1 + 32) + 96), *(void *)(*(void *)(a1 + 32) + 104));
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  *(_OWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = *(_OWORD *)(*(void *)(a1 + 32) + 96);
  uint64_t v16 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v16 + 145) & 0x10) != 0)
  {
    id v17 = [(id)v16 delegate];
    objc_msgSend(v17, "textInput:willChangeCharactersInRange:", *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));

    uint64_t v16 = *(void *)(a1 + 32);
  }
  objc_msgSend(v18, "replaceCharactersInRange:withAttributedString:", *(void *)(v16 + 96), *(void *)(v16 + 104), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  *(void *)(*(void *)(a1 + 32) + 104) = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v18 length];
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  NSUInteger v8 = self->_markedTextRange.length;
  id v14 = v7;
  if (v8)
  {
    id v9 = v7;
    NSUInteger v10 = self->_markedTextRange.location;
  }
  else
  {
    uint64_t v11 = [(UITextInputController *)self _selectedRange];
    id v9 = v14;
    NSUInteger v10 = v11;
    NSUInteger v8 = v12;
  }
  id v13 = -[UITextInputController _newAttributedStringForInsertionOfText:inRange:](self, "_newAttributedStringForInsertionOfText:inRange:", v9, v10, v8);
  -[UITextInputController _setAttributedMarkedText:selectedRange:fromKeyboard:useTextStyle:](self, "_setAttributedMarkedText:selectedRange:fromKeyboard:useTextStyle:", v13, location, length, 0, 1);
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    BOOL v9 = [(UITextInputController *)self markedTextFromClient:v15];
    id v10 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    [v10 setMarkedTextFromClient:v9];
  }
  NSUInteger v11 = self->_markedTextRange.length;
  if (v11)
  {
    NSUInteger v12 = self->_markedTextRange.location;
  }
  else
  {
    NSUInteger v12 = [(UITextInputController *)self _selectedRange];
    NSUInteger v11 = v13;
  }
  id v14 = -[UITextInputController _newAttributedStringForInsertionOfAttributedText:inRange:](self, "_newAttributedStringForInsertionOfAttributedText:inRange:", v15, v12, v11);
  -[UITextInputController _setAttributedMarkedText:selectedRange:fromKeyboard:useTextStyle:](self, "_setAttributedMarkedText:selectedRange:fromKeyboard:useTextStyle:", v14, location, length, 0, 1);
}

- (BOOL)markedTextFromClient:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  NSUInteger v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if ([v3 length])
  {
    uint64_t v4 = [v3 length];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__UITextInputController_markedTextFromClient___block_invoke;
    v9[3] = &unk_1E52DE5D8;
    v9[4] = &v10;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", @"UITextInputAttributedStringMarkedTextFromClient", 0, v4, 0, v9);
    if (!*((unsigned char *)v11 + 24))
    {
      uint64_t v5 = *(void *)off_1E52D2048;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __46__UITextInputController_markedTextFromClient___block_invoke_2;
      v8[3] = &unk_1E52DE5D8;
      v8[4] = &v10;
      objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v4, 0, v8);
    }
  }
  char v6 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return v6;
}

uint64_t __46__UITextInputController_markedTextFromClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 BOOLValue];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

void __46__UITextInputController_markedTextFromClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    [v4 alphaComponent];
    if (fabs(v3 + -0.8) < 2.22044605e-16) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
}

- (void)_clearMarkedText
{
  self->_markedTextRange = (_NSRange)xmmword_186B93450;
  markedText = self->_markedText;
  self->_markedText = 0;
}

- (void)_forceUnmarkTextDueToEditing
{
  -[UITextInputController _setSelectedRange:](self, "_setSelectedRange:", [(UITextInputController *)self _selectedRange] + self->_markedTextRange.location, 0);
  [(UITextInputController *)self _clearMarkedText];
}

- (void)unmarkText
{
}

- (void)unmarkText:(BOOL)a3
{
  if (self->_markedTextRange.location == 0x7FFFFFFFFFFFFFFFLL) {
    return;
  }
  BOOL v3 = a3;
  uint64_t v5 = [(UITextInputController *)self markedTextStyle];
  char v6 = v5;
  if (!v5 || !self->_markedTextRange.length) {
    goto LABEL_6;
  }

  if (v3)
  {
    id v7 = [(UITextInputController *)self _textStorage];
    char v8 = [v7 string];
    char v6 = objc_msgSend(v8, "substringWithRange:", self->_markedTextRange.location, self->_markedTextRange.length);

    BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
    -[UITextInputController _setAttributedMarkedText:selectedRange:fromKeyboard:useTextStyle:](self, "_setAttributedMarkedText:selectedRange:fromKeyboard:useTextStyle:", v9, [v6 length], 0, 0, 0);

LABEL_6:
  }
  [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:1];
  [(UITextInputController *)self _clearMarkedText];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  uint64_t v11 = [(UITextInputController *)self _selectedRange];
  objc_msgSend(WeakRetained, "invalidateDisplayForCharacterRange:", v11, v12);

  -[UITextInputController setSelectedRange:](self, "setSelectedRange:", [(UITextInputController *)self _selectedRange] + self->_markedTextSelection.location, 0);
  [(UITextInputController *)self _sendDelegateChangeNotificationsForText:1 selection:1];
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  id v8 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    BOOL v9 = a4 == 3;
    BOOL v10 = a4 == 2;
    int64_t v11 = [(UITextInputController *)self _resolveNaturalDirection:[(UITextInputController *)self baseWritingDirectionForPosition:v8 inDirection:0]];
    BOOL v12 = v11 == 1 && v10;
    BOOL v13 = v11 != 1 && v9;
    id v14 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    id v15 = [v14 beginningOfDocument];
    unint64_t v16 = [v14 offsetFromPosition:v15 toPosition:v8];

    if (a5 >= 1)
    {
      BOOL v17 = v13 || v12;
      do
      {
        if (v17)
        {
          if (!v16) {
            break;
          }
          unint64_t v18 = v16 - 1;
          uint64_t v19 = self;
          uint64_t v20 = 0;
        }
        else
        {
          id v21 = [(UITextInputController *)self _textStorage];
          unint64_t v22 = [v21 length];

          if (v16 >= v22) {
            break;
          }
          uint64_t v19 = self;
          unint64_t v18 = v16;
          uint64_t v20 = 1;
        }
        unint64_t v16 = [(UITextInputController *)v19 _validCaretPositionFromCharacterIndex:v18 downstream:v20];
        --a5;
      }
      while (a5);
    }
    id v23 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    uint64_t v24 = [v23 beginningOfDocument];
    id v25 = -[_UITextLayoutControllerBase positionFromPosition:offset:](v23, (uint64_t)v24, v16);
  }
  else if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    char v27 = objc_opt_respondsToSelector();

    if ((v27 & 1) == 0) {
      goto LABEL_20;
    }
    id v28 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    uint64_t v29 = [(UITextInputController *)self typingAttributes];
    id v30 = [(UITextPlaceholder *)self->_textPlaceholder attachment];
    [v28 insertionRectForPosition:v8 typingAttributes:v29 placeholderAttachment:v30 textContainer:0];
    double MinX = CGRectGetMinX(v41);

    id v32 = objc_loadWeakRetained((id *)&self->_textLayoutController);
    id v25 = objc_msgSend(v32, "positionFromPosition:inDirection:offset:affinity:anchorPositionOffset:", v8, a4, a5, -[UITextInputController selectionAffinity](self, "selectionAffinity"), MinX);

    if (!v25)
    {
LABEL_20:
      id v33 = v8;
      [(UITextInputController *)self caretRectForPosition:v33];
      if (a5 < 1)
      {
        id v25 = v33;
      }
      else
      {
        double v35 = v34;
        do
        {
          [(UITextInputController *)self caretRectForPosition:v33];
          double v38 = v37 + 1.0;
          if (a4 == 4) {
            double v38 = -1.0;
          }
          id v25 = -[UITextInputController _characterPositionForPoint:](self, "_characterPositionForPoint:", v35, v36 + v38);

          id v33 = v25;
          --a5;
        }
        while (a5);
      }
    }
  }
  else
  {
    id v25 = [(UITextInputController *)self endOfDocument];
  }

  return v25;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  id v5 = a3;
  char v6 = v5;
  if (a4 == 5 || a4 == 2)
  {
    uint64_t v7 = [v5 end];
  }
  else
  {
    uint64_t v7 = [v5 start];
  }
  id v8 = (void *)v7;

  return v8;
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  if (a4 == 3) {
    uint64_t v4 = -1;
  }
  else {
    uint64_t v4 = 1;
  }
  p_textLayoutController = &self->_textLayoutController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  id v8 = -[_UITextLayoutControllerBase positionFromPosition:offset:](WeakRetained, (uint64_t)v6, v4);

  id v9 = objc_loadWeakRetained((id *)p_textLayoutController);
  BOOL v10 = [v9 textRangeFromPosition:v6 toPosition:v8];

  return v10;
}

- (void)setInputDelegate:(id)a3
{
  p_inputDelegate = &self->_inputDelegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_inputDelegate, v6);
  LOBYTE(p_inputDelegate) = objc_opt_respondsToSelector();

  self->_inputDelegateRespondsToInlineCompletionAsMarkedText = p_inputDelegate & 1;
}

- (id)_newAttributedStringForInsertionOfText:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = (__CFString *)a3;
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = &stru_1ED0E84C0;
  }
  id v9 = -[UITextInputController _attributesForInsertionOfText:](self, "_attributesForInsertionOfText:", location, length);
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8 attributes:v9];
  if ((*(unsigned char *)&self->_tiFlags & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained textInput:self prepareAttributedTextForInsertion:v10];
  }
  return v10;
}

- (id)_newAttributedStringForInsertionOfAttributedText:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = -[UITextInputController _attributesForInsertionOfText:](self, "_attributesForInsertionOfText:", location, length);
  id v9 = (void *)[v7 mutableCopy];

  if ([v8 count])
  {
    uint64_t v10 = [v9 length];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__UITextInputController__newAttributedStringForInsertionOfAttributedText_inRange___block_invoke;
    v13[3] = &unk_1E530B7B8;
    id v14 = v8;
    id v15 = v9;
    objc_msgSend(v15, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v13);
  }
  if ((*(unsigned char *)&self->_tiFlags & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained textInput:self prepareAttributedTextForInsertion:v9];
  }
  return v9;
}

void __82__UITextInputController__newAttributedStringForInsertionOfAttributedText_inRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = (id)[v7 mutableCopy];
  [v9 addEntriesFromDictionary:v8];

  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v9, a3, a4);
}

- (id)_newAttributedStringForReplacementOfAnnotatedText:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__211;
  id v32 = __Block_byref_object_dispose__211;
  id v33 = 0;
  id v8 = [(UITextInputController *)self _textStorage];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __83__UITextInputController__newAttributedStringForReplacementOfAnnotatedText_inRange___block_invoke;
  v27[3] = &unk_1E530B7E0;
  v27[4] = &v28;
  v27[5] = location;
  v27[6] = length;
  [v8 coordinateReading:v27];

  id v9 = [(id)v29[5] string];
  uint64_t v10 = [v7 string];
  char v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    BOOL v12 = (void *)[(id)v29[5] mutableCopy];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    BOOL v13 = [(UITextInputController *)self validAnnotations];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v12, "removeAttribute:range:", *(void *)(*((void *)&v23 + 1) + 8 * v16++), 0, objc_msgSend(v12, "length"));
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v34 count:16];
      }
      while (v14);
    }

    uint64_t v17 = [v7 length];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __83__UITextInputController__newAttributedStringForReplacementOfAnnotatedText_inRange___block_invoke_2;
    v21[3] = &unk_1E52D9AA8;
    id v18 = v12;
    id v22 = v18;
    objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", 0, v17, 0, v21);
    if ((*(unsigned char *)&self->_tiFlags & 0x40) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained textInput:self prepareAttributedTextForInsertion:v18];
    }
  }
  else
  {
    id v18 = -[UITextInputController _newAttributedStringForInsertionOfAttributedText:inRange:](self, "_newAttributedStringForInsertionOfAttributedText:inRange:", v7, location, length);
  }
  _Block_object_dispose(&v28, 8);

  return v18;
}

void __83__UITextInputController__newAttributedStringForReplacementOfAnnotatedText_inRange___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "attributedSubstringFromRange:", a1[5], a1[6]);
  uint64_t v4 = *(void *)(a1[4] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __83__UITextInputController__newAttributedStringForReplacementOfAnnotatedText_inRange___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

- (id)_attributesForInsertionOfText:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location == [(UITextInputController *)self _selectedRange] && length == v6)
  {
    id v7 = [(UITextInputController *)self typingAttributes];
  }
  else
  {
    id v7 = -[UITextInputController _attributesForReplacementInRange:](self, "_attributesForReplacementInRange:", location, length);
  }
  return v7;
}

- (void)_invalidateTypingAttributes
{
}

- (void)_invalidateEmptyStringAttributes
{
}

- (UITextInputTokenizer)tokenizer
{
  tokenizer = self->_tokenizer;
  if (!tokenizer)
  {
    uint64_t v4 = [[_UITextInputControllerTokenizer alloc] initWithTextInputController:self];
    id v5 = self->_tokenizer;
    self->_tokenizer = v4;

    tokenizer = self->_tokenizer;
  }
  return (UITextInputTokenizer *)tokenizer;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = -1;
  uint64_t v6 = [(UITextInputController *)self _textStorage];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__UITextInputController_baseWritingDirectionForPosition_inDirection___block_invoke;
  v9[3] = &unk_1E530B830;
  v9[4] = self;
  void v9[5] = &v10;
  [v6 coordinateReading:v9];

  int64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __69__UITextInputController_baseWritingDirectionForPosition_inDirection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__211;
  uint64_t v20 = __Block_byref_object_dispose__211;
  id v21 = 0;
  if ([v3 length])
  {
    uint64_t v4 = [v3 string];
    uint64_t v5 = [*(id *)(a1 + 32) _selectedRange];
    uint64_t v7 = objc_msgSend(v4, "paragraphRangeForRange:", v5, v6);
    uint64_t v9 = v8;

    uint64_t v10 = *(void *)off_1E52D21B8;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__UITextInputController_baseWritingDirectionForPosition_inDirection___block_invoke_2;
    v15[3] = &unk_1E52DE5D8;
    v15[4] = &v16;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v10, v7, v9, 0x100000, v15);
  }
  char v11 = (void *)v17[5];
  if (v11) {
    goto LABEL_5;
  }
  uint64_t v12 = [*(id *)(a1 + 32) typingAttributes];
  uint64_t v13 = [v12 objectForKey:*(void *)off_1E52D21B8];
  uint64_t v14 = (void *)v17[5];
  v17[5] = v13;

  char v11 = (void *)v17[5];
  if (v11) {
LABEL_5:
  }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v11 baseWritingDirection];
  _Block_object_dispose(&v16, 8);
}

void __69__UITextInputController_baseWritingDirectionForPosition_inDirection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void *)(v9 + 40);
  uint64_t v10 = (id *)(v9 + 40);
  if (!v11)
  {
    id v12 = v8;
    objc_storeStrong(v10, a2);
    id v8 = v12;
    *a5 = 1;
  }
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  p_textLayoutController = &self->_textLayoutController;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  uint64_t v9 = [WeakRetained characterRangeForTextRange:v7];
  uint64_t v11 = v10;

  id v12 = [(UITextInputController *)self _textStorage];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__UITextInputController_setBaseWritingDirection_forRange___block_invoke;
  v21[3] = &__block_descriptor_56_e23_v16__0__NSTextStorage_8l;
  void v21[4] = v9;
  v21[5] = v11;
  void v21[6] = a3;
  [v12 coordinateEditing:v21];

  if ([(UITextInputController *)self _selectedRange] == v9 && v13 == v11)
  {
    uint64_t v14 = [(UITextInputController *)self typingAttributes];
    uint64_t v15 = *(void *)off_1E52D21B8;
    uint64_t v16 = [v14 objectForKey:*(void *)off_1E52D21B8];
    uint64_t v17 = (void *)[v16 mutableCopy];
    uint64_t v18 = v17;
    if (v17) {
      id v19 = v17;
    }
    else {
      id v19 = (id)objc_opt_new();
    }
    uint64_t v20 = v19;

    [v20 setBaseWritingDirection:a3];
    [(UITextInputController *)self _addToTypingAttributes:v15 value:v20];
  }
  [(UITextInputController *)self _selectionGeometryChanged];
}

void __58__UITextInputController_setBaseWritingDirection_forRange___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 string];
  uint64_t v5 = objc_msgSend(v4, "paragraphRangeForRange:", a1[4], a1[5]);
  uint64_t v7 = v6;

  uint64_t v8 = *(void *)off_1E52D21B8;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__UITextInputController_setBaseWritingDirection_forRange___block_invoke_2;
  v11[3] = &unk_1E530B858;
  uint64_t v9 = a1[6];
  id v12 = v3;
  uint64_t v13 = v9;
  id v10 = v3;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v8, v5, v7, 0x100000, v11);
}

void __58__UITextInputController_setBaseWritingDirection_forRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)[a2 mutableCopy];
  uint64_t v8 = v7;
  if (v7)
  {
    id v11 = v7;
  }
  else
  {
    uint64_t v9 = [off_1E52D2DD0 defaultParagraphStyle];
    id v11 = (id)[v9 mutableCopy];
  }
  [v11 setBaseWritingDirection:*(void *)(a1 + 40)];
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10 != -1) {
    [v11 setAlignment:2 * (v10 != 0)];
  }
  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(void *)off_1E52D21B8, v11, a3, a4);
}

- (CGRect)firstRectForRange:(id)a3
{
  id v3 = [(UITextInputController *)self selectionRectsForRange:a3];
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndex:0];
    [v4 rect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)_caretRectForOffset:(unint64_t)a3
{
  id v5 = objc_loadWeakRetained((id *)&self->_textLayoutController);
  double v6 = [v5 beginningOfDocument];
  double v7 = -[_UITextLayoutControllerBase positionFromPosition:offset:](v5, (uint64_t)v6, a3);
  [(UITextInputController *)self caretRectForPosition:v7];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)_caretRect
{
  id v3 = [(UITextRange *)self->_selectedTextRange start];
  [(UITextInputController *)self caretRectForPosition:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = -[UITextInputController _characterPositionForPoint:](self, "_characterPositionForPoint:", x, y);
  double v9 = [v7 start];
  int64_t v10 = [(UITextInputController *)self comparePosition:v8 toPosition:v9];

  if (v10 == -1)
  {
    uint64_t v13 = [v7 start];
  }
  else
  {
    double v11 = [v7 end];
    int64_t v12 = [(UITextInputController *)self comparePosition:v11 toPosition:v8];

    if (v12 != -1) {
      goto LABEL_6;
    }
    uint64_t v13 = [v7 end];
  }
  double v14 = (void *)v13;

  double v8 = v14;
LABEL_6:

  return v8;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double v4 = -[UITextInputController _characterPositionForPoint:](self, "_characterPositionForPoint:", a3.x, a3.y);
  double v5 = [(UITextInputController *)self tokenizer];
  double v6 = [v5 rangeEnclosingPosition:v4 withGranularity:0 inDirection:-1];

  return v6;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6 = a3;
  selectedTextRange = self->_selectedTextRange;
  if (!selectedTextRange
    || ![(UITextRange *)selectedTextRange isEmpty]
    || (id v8 = objc_loadWeakRetained((id *)&self->_textLayoutController),
        [(UITextRange *)self->_selectedTextRange start],
        double v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v8 comparePosition:v6 toPosition:v9],
        v9,
        v8,
        v10))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    int64_t v12 = [(UITextInputController *)self endOfDocument];
    uint64_t v13 = [WeakRetained comparePosition:v6 toPosition:v12] | a4;

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_textLayoutController);
      double v15 = [v14 attributesAtPosition:v6 inDirection:a4];

      if (v15) {
        goto LABEL_6;
      }
LABEL_9:
      double v16 = 0;
      goto LABEL_11;
    }
  }
  double v15 = [(UITextInputController *)self typingAttributes];
  if (!v15) {
    goto LABEL_9;
  }
LABEL_6:
  if (dyld_program_sdk_at_least())
  {
    double v16 = (void *)[v15 mutableCopy];
  }
  else
  {
    double v16 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    double v17 = [v15 objectForKey:*(void *)off_1E52D2040];
    [v16 setValue:v17 forKey:@"UITextInputTextFontKey"];

    double v18 = [v15 objectForKey:*(void *)off_1E52D2048];
    [v16 setValue:v18 forKey:@"UITextInputTextColorKey"];

    double v19 = [v15 objectForKey:*(void *)off_1E52D1F58];
    [v16 setValue:v19 forKey:@"UITextInputTextBackgroundColorKey"];
  }
LABEL_11:

  return v16;
}

- (void)_undoManagerWillUndo:(id)a3
{
  if (![(UITextInputController *)self supportLetterByLetterUndo]) {
    [(UITextInputController *)self stopCoalescing];
  }
  [(UITextInputController *)self unmarkText];
}

- (void)coalesceInTextView:(id)a3 actionName:(id)a4 affectedRange:(_NSRange)a5 replacementRange:(_NSRange)a6 replacementText:(id)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v8 = a5.length;
  NSUInteger v9 = a5.location;
  id v26 = a3;
  id v12 = a4;
  id v25 = a7;
  uint64_t v13 = [v26 undoManager];
  id v14 = [v26 _textStorage];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_undoOperationForCoalescing);
  int v16 = [v13 _shouldCoalesceTypingForText:WeakRetained :v14];

  if (!v16
    || [(UITextInputController *)self shouldStartNewUndoGroup:v25 textGranularity:2 operationType:2])
  {
    goto LABEL_8;
  }
  uint64_t v18 = [v26 selectedRange];
  uint64_t v19 = self->_markedTextRange.location == 0x7FFFFFFFFFFFFFFFLL ? v17 : 0;
  id v20 = objc_loadWeakRetained((id *)&self->_undoOperationForCoalescing);
  char v21 = objc_msgSend(v20, "coalesceAffectedRange:replacementRange:selectedRange:textStorage:", v9, v8, location, length, v18, v19, v14);

  if ((v21 & 1) == 0)
  {
LABEL_8:
    [(UITextInputController *)self stopCoalescing];
    id v22 = -[_UITextUndoOperationTyping initWithAffectedRange:inputController:replacementRange:]([_UITextUndoOperationTyping alloc], "initWithAffectedRange:inputController:replacementRange:", v9, v8, self, location, length);
    long long v23 = [(UITextInputController *)self _textStorage];
    [v13 registerUndoWithTarget:v23 selector:sel__UIUndoRedoTextOperation_ object:v22];

    [v13 setActionName:v12];
    objc_storeWeak((id *)&self->_undoOperationForCoalescing, v22);
  }
}

- (BOOL)shouldStartNewUndoGroup:(id)a3 textGranularity:(int64_t)a4 operationType:(int)a5
{
  id v7 = a3;
  NSUInteger v8 = v7;
  if (a5 != 2) {
    goto LABEL_6;
  }
  if (a4 == 3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    [v8 rangeOfCharacterFromSet:v10];
    LOBYTE(v9) = v11 != 0;
LABEL_11:

    goto LABEL_12;
  }
  if (a4 == 2)
  {
    uint64_t v10 = +[UIKeyboardImpl activeInstance];
    if ([v10 nextInputWouldStartSentence]) {
      int v9 = [v8 isEqualToString:@" "] ^ 1;
    }
    else {
      LOBYTE(v9) = 0;
    }
    goto LABEL_11;
  }
  if (a4 != 1)
  {
LABEL_6:
    LOBYTE(v9) = 0;
    goto LABEL_12;
  }
  LOBYTE(v9) = [v7 isEqualToString:@" "];
LABEL_12:

  return v9;
}

- (void)scheduleUndoOperationForType:(int)a3 actionName:(id)a4 previousSelectedRange:(_NSRange)a5 replacementText:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v8 = *(void *)&a3;
  id v17 = a6;
  if (![(UITextInputController *)self _undoRedoInProgress])
  {
    if (v8 == 1)
    {
      id v12 = [_UITextUndoOperationSetAttributes alloc];
      uint64_t v13 = [(UITextInputController *)self selectedRange];
      uint64_t v15 = -[_UITextUndoOperationSetAttributes initWithAffectedRange:inputController:](v12, "initWithAffectedRange:inputController:", v13, v14, self);
    }
    else
    {
      if (v8 == 3)
      {
        uint64_t v10 = [v17 length];
        uint64_t v11 = _UITextUndoOperationReplace;
      }
      else
      {
        if (v8 != 2)
        {
          int v16 = 0;
LABEL_16:

          goto LABEL_17;
        }
        uint64_t v10 = [v17 length];
        uint64_t v11 = _UITextUndoOperationTyping;
      }
      uint64_t v15 = objc_msgSend([v11 alloc], "initWithAffectedRange:inputController:replacementRange:", location, length, self, location, v10);
    }
    int v16 = (void *)v15;
    if (v15)
    {
      if ([(UITextInputController *)self shouldStartUndoGroup])
      {
        [(UITextInputController *)self setCurrentUndoGroupType:v8];
        [(UITextInputController *)self appendUndoOperation:v16 newGroup:1];
        [(UITextInputController *)self setShouldStartUndoGroup:0];
      }
      else
      {
        [(UITextInputController *)self appendUndoOperation:v16 newGroup:0];
      }
      if ([(UITextInputController *)self shouldStartNewUndoGroup:v17 textGranularity:2 operationType:v8])
      {
        [(UITextInputController *)self setShouldStartUndoGroup:1];
      }
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)registerUndoOperationForType:(int)a3 actionName:(id)a4 affectedRange:(_NSRange)a5 replacementText:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v9 = *(void *)&a3;
  id v22 = a4;
  id v12 = a6;
  if (!+[UIDictationController isRunning]
    || +[UIDictationController canUndoOrRedo])
  {
    if ([(UITextInputController *)self supportLetterByLetterUndo])
    {
      -[UITextInputController scheduleUndoOperationForType:actionName:previousSelectedRange:replacementText:](self, "scheduleUndoOperationForType:actionName:previousSelectedRange:replacementText:", v9, v22, location, length, v12);
      goto LABEL_15;
    }
    if (![(UITextInputController *)self _undoRedoInProgress])
    {
      switch(v9)
      {
        case 3:
          uint64_t v17 = [v12 length];
          [(UITextInputController *)self stopCoalescing];
          int v16 = -[_UITextUndoOperationReplace initWithAffectedRange:inputController:replacementRange:]([_UITextUndoOperationReplace alloc], "initWithAffectedRange:inputController:replacementRange:", location, length, self, location, v17);
          break;
        case 2:
          -[UITextInputController coalesceInTextView:actionName:affectedRange:replacementRange:replacementText:](self, "coalesceInTextView:actionName:affectedRange:replacementRange:replacementText:", self, v22, location, length, location, [v12 length], v12);
          goto LABEL_15;
        case 1:
          [(UITextInputController *)self stopCoalescing];
          uint64_t v13 = [_UITextUndoOperationSetAttributes alloc];
          uint64_t v14 = [(UITextInputController *)self selectedRange];
          int v16 = -[_UITextUndoOperationSetAttributes initWithAffectedRange:inputController:](v13, "initWithAffectedRange:inputController:", v14, v15, self);
          break;
        default:
          uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2 object:self file:@"UITextInputController.m" lineNumber:3272 description:@"Unknown text undo operation type encountered"];
          goto LABEL_14;
      }
      uint64_t v18 = v16;
      uint64_t v19 = [(UITextInputController *)self undoManager];
      id v20 = [(UITextInputController *)self _textStorage];
      [v19 registerUndoWithTarget:v20 selector:sel__UIUndoRedoTextOperation_ object:v18];

      char v21 = [(UITextInputController *)self undoManager];
      [v21 setActionName:v22];

LABEL_14:
    }
  }
LABEL_15:
}

- (void)undoWillChangeText
{
}

- (void)undoManagerWillBeginUndoRedo
{
  self->_accumulatedSelectedRangeForCoalescedUndoRedo = (_NSRange)xmmword_186B93450;
}

- (void)undoManagerDidFinishUndoRedo
{
  if ((*((unsigned char *)&self->_tiFlags + 1) & 4) != 0)
  {
    id v3 = [(UITextInputController *)self delegate];
    [v3 textInputDidFinishUndoRedoChanges:self];
  }
  if (self->_accumulatedSelectedRangeForCoalescedUndoRedo.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UITextInputController setSelectedRange:](self, "setSelectedRange:");
  }
}

- (void)undoDidReplaceRange:(_NSRange)a3 withAttributedText:(id)a4
{
  if ((*((unsigned char *)&self->_tiFlags + 1) & 2) != 0)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    id v7 = a4;
    uint64_t v8 = [(UITextInputController *)self delegate];
    objc_msgSend(v8, "textInput:undoRedoDidApplyAttributedText:toCharacterRange:", self, v7, location, length);
  }
  -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 1, a4);
}

- (void)_setUndoRedoInProgress:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFBFFF | v3);
}

- (BOOL)_undoRedoInProgress
{
  return (*((unsigned __int8 *)&self->_tiFlags + 1) >> 6) & 1;
}

- (BOOL)isCoalescing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_undoOperationForCoalescing);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (void)changeWillBeUndone:(id)a3
{
  if (![(UITextInputController *)self supportLetterByLetterUndo]) {
    [(UITextInputController *)self stopCoalescing];
  }
  [(UITextInputController *)self unmarkText];
}

- (void)clearText
{
  [(UITextInputController *)self unmarkText:0];
  [(UITextInputController *)self selectAll];
  BOOL v3 = _UIKitBundle();
  double v4 = [v3 localizedStringForKey:@"DELETE_FOR_UNDO" value:@"Delete" table:@"Localizable"];
  uint64_t v5 = [(UITextInputController *)self selectedRange];
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 3, v4, v5, v6, &stru_1ED0E84C0);

  [(UITextInputController *)self _insertText:&stru_1ED0E84C0 fromKeyboard:0];
}

- (void)insertEmojiImageTextAttachment:(id)a3 replacementRange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([off_1E52D2A88 prefersEmojiImageTextAttachment])
  {
    id v8 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v7];

    [(UITextInputController *)self replaceRange:v6 withAttributedText:v8];
  }
  else
  {
    id v8 = [v7 adaptiveImageGlyph];

    [(UITextInputController *)self insertAdaptiveImageGlyph:v8 replacementRange:v6];
  }
}

- (void)setSupportsAdaptiveImageGlyph:(BOOL)a3
{
  if (a3) {
    int v3 = 0;
  }
  else {
    int v3 = 0x100000;
  }
  self->_$DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFEFFFFF | v3);
}

- (BOOL)supportsAdaptiveImageGlyph
{
  return (*((unsigned char *)&self->_tiFlags + 2) & 0x10) == 0;
}

- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([(UITextInputController *)self supportsAdaptiveImageGlyph])
  {
    if ([off_1E52D2A88 prefersTextAttachment])
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ([v13 nominalTextAttachment], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v11 = 0;
LABEL_10:

        goto LABEL_11;
      }
      id v8 = (void *)v7;
      uint64_t v9 = (void *)MEMORY[0x1E4F28B18];
      uint64_t v10 = [(UITextInputController *)self typingAttributes];
      uint64_t v11 = [v9 attributedStringWithAttachment:v8 attributes:v10];
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28B18];
      id v8 = [(UITextInputController *)self typingAttributes];
      uint64_t v11 = [v12 attributedStringWithAdaptiveImageGlyph:v13 attributes:v8];
    }

    if (v11) {
      [(UITextInputController *)self replaceRange:v6 withAttributedText:v11];
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)setWritingToolsStreamingReplacements:(BOOL)a3
{
  BOOL v3 = a3;
  $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = self->_tiFlags;
  if ((((*(_DWORD *)&tiFlags & 0x200000) == 0) ^ a3)) {
    goto LABEL_9;
  }
  if (a3)
  {
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
    {
      id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB264878) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, ">>>> UITextInputController will begin undo group for Writing Tools replacements", buf, 2u);
      }
    }
    *(_DWORD *)&self->_tiFlags &= ~0x400000u;
    id v6 = [(UITextInputController *)self undoManager];
    [v6 beginUndoGrouping];
  }
  else
  {
    if ((*(_DWORD *)&tiFlags & 0x400000) != 0) {
      goto LABEL_9;
    }
    if (os_variant_has_internal_diagnostics()
      && ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantRewriteLogging, @"UITextAssistantRewriteLogging") & 1) == 0&& byte_1E8FD4F9C|| (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UITextAssistantProofreadLogging, @"UITextAssistantProofreadLogging") & 1) == 0&& byte_1E8FD4FA4))
    {
      uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextAssistantGeneral", &qword_1EB264880) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "<<<< UITextInputController will end undo group for Writing Tools replacements", v10, 2u);
      }
    }
    id v6 = [(UITextInputController *)self undoManager];
    [v6 endUndoGrouping];
  }

  $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = self->_tiFlags;
LABEL_9:
  if (v3) {
    int v7 = 0x200000;
  }
  else {
    int v7 = 0;
  }
  self->_$DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&tiFlags & 0xFFDFFFFF | v7);
}

- (BOOL)isWritingToolsStreamingReplacements
{
  return (*((unsigned __int8 *)&self->_tiFlags + 2) >> 5) & 1;
}

- (BOOL)_isSystemAttachment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4 replacingRange:(_NSRange)a5 resultLength:(unint64_t *)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a4;
  id v12 = a3;
  -[UITextInputController setSelectedRange:](self, "setSelectedRange:", location, length);
  *(_DWORD *)&self->_tiFlags |= 0x40000u;
  id v13 = +[UIDictationUtilities attributedStringForDictationResult:v12 andCorrectionIdentifier:v11 capturePrefixAndPostfixWordCount:5];

  id v18 = (id)[v13 mutableCopy];
  uint64_t v14 = [(UITextInputController *)self typingAttributes];

  if (v14)
  {
    uint64_t v15 = [(UITextInputController *)self typingAttributes];
    int v16 = (void *)[v15 mutableCopy];

    if (v16) {
      [v16 removeObjectForKey:*(void *)off_1E52D2288];
    }
    uint64_t v17 = [v16 objectForKey:@"_UITextInputDictationResultMetadata"];
    if (v17) {
      [v16 removeObjectForKey:@"_UITextInputDictationResultMetadata"];
    }
    objc_msgSend(v18, "addAttributes:range:", v16, 0, objc_msgSend(v18, "length"));
  }
  ++self->_dontRemoveAllActionsCount;
  [(UITextInputController *)self _insertAttributedText:v18 fromKeyboard:1];
  --self->_dontRemoveAllActionsCount;
  if (a6) {
    *a6 = [v18 length];
  }
}

- (void)insertDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*((unsigned char *)&self->_tiFlags + 1) & 0x20) == 0)
  {
    id v8 = [v6 bestText];
    uint64_t v9 = [(UITextInputController *)self _firstTextView];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_4;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
    id v12 = +[UIKeyboardImpl sharedInstance];
    id v13 = [v12 delegate];
    int v14 = [WeakRetained keyboardInput:v13 shouldInsertText:v8 isMarkedText:0];

    if (v14)
    {
LABEL_4:
      uint64_t v15 = [(UITextInputController *)self selectedRange];
      uint64_t v17 = v16;
      unint64_t v22 = 0;
      *(_DWORD *)&self->_tiFlags |= 0x2000u;
      -[UITextInputController _insertDictationResult:withCorrectionIdentifier:replacingRange:resultLength:](self, "_insertDictationResult:withCorrectionIdentifier:replacingRange:resultLength:", v6, v7, v15, v16, &v22);
      *(_DWORD *)&self->_tiFlags &= ~0x2000u;
      [(UITextInputController *)self stopCoalescing];
      id v18 = _UIKitBundle();
      uint64_t v19 = [v18 localizedStringForKey:@"Dictation" value:@"Dictation" table:@"Localizable"];
      unint64_t v20 = [v8 length];
      if (v20 <= v22)
      {
        -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v19, v15, v17, v8);
      }
      else
      {
        char v21 = objc_msgSend(v8, "substringToIndex:");
        -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 2, v19, v15, v17, v21);
      }
      [(UITextInputController *)self stopCoalescing];
      -[UITextInputController setSelectedRange:](self, "setSelectedRange:", v22 + v15, 0);
      [(UITextInputController *)self _setSelectedRangeToEndIfNecessary];
    }
  }
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3 embeddingType:(int64_t)a4
{
  p_textPlaceholder = &self->_textPlaceholder;
  if (self->_textPlaceholder)
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v39 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v39, OS_LOG_TYPE_FAULT, "Multiple text placeholders", buf, 2u);
      }
    }
    else
    {
      uint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &insertTextPlaceholderWithSize_embeddingType____s_category)+ 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Multiple text placeholders", buf, 2u);
      }
    }
    id v6 = *p_textPlaceholder;
  }
  else
  {
    double height = a3.height;
    double width = a3.width;
    *(void *)buf = 0;
    CGRect v50 = buf;
    uint64_t v51 = 0x2020000000;
    uint64_t v52 = 0;
    id v11 = [(UITextInputController *)self selectedTextRange];
    id v12 = [v11 start];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [(UITextInputController *)self endOfDocument];
    }
    uint64_t v15 = v14;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    uint64_t v17 = [(UITextInputController *)self typingAttributes];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __69__UITextInputController_insertTextPlaceholderWithSize_embeddingType___block_invoke;
    v48[3] = &unk_1E530B660;
    v48[4] = buf;
    [WeakRetained requestTextGeometryAtPosition:v15 typingAttributes:v17 resultBlock:v48];

    id v18 = objc_alloc_init(UITextPlaceholder);
    double v19 = *((double *)v50 + 3);
    unint64_t v20 = [(UITextPlaceholder *)v18 attachment];
    objc_msgSend(v20, "setBounds:", 0.0, -(height - v19), width, height);

    char v21 = [(UITextInputController *)self typingAttributes];
    unint64_t v22 = [(UITextPlaceholder *)v18 attachment];
    [v22 setTypingAttributesBeforeInsertion:v21];

    uint64_t v23 = [(UITextInputController *)self _selectedRange];
    long long v24 = [(UITextPlaceholder *)v18 attachment];
    objc_msgSend(v24, "setAttachmentRange:", v23, 1);

    id v25 = [(UITextPlaceholder *)v18 attachment];
    [v25 setImage:0];

    id v26 = [(UITextPlaceholder *)v18 attachment];
    [v26 setEmbeddingType:a4];

    char v27 = [(UITextInputController *)self selectedTextRange];
    uint64_t v28 = [v27 start];
    [(UITextInputController *)self caretRectForPosition:v28];
    -[UITextPlaceholder setCaretRectBeforeInsertion:](v18, "setCaretRectBeforeInsertion:");

    objc_storeStrong((id *)p_textPlaceholder, v18);
    $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = self->_tiFlags;
    self->_$DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&tiFlags | 0x2000);
    [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:0];
    uint64_t v30 = [(UITextInputController *)self _selectedRange];
    uint64_t v32 = v31;
    uint64_t v33 = [(UITextInputController *)self _textStorage];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __69__UITextInputController_insertTextPlaceholderWithSize_embeddingType___block_invoke_2;
    v43[3] = &unk_1E530B5E8;
    double v34 = v18;
    long long v44 = v34;
    NSUInteger v45 = self;
    uint64_t v46 = v30;
    uint64_t v47 = v32;
    [(id)v33 coordinateEditing:v43];

    -[UITextInputController setSelectedRange:](self, "setSelectedRange:", v30 + 1, 0);
    [(UITextInputController *)self _setSelectedRangeToEndIfNecessary];
    uint64_t v35 = [(UITextInputController *)self interactionAssistant];
    [v35 selectionChanged];

    [(UITextInputController *)self _sendDelegateChangeNotificationsForText:1 selection:0];
    id v36 = objc_loadWeakRetained((id *)&self->_layoutManager);
    LOBYTE(v33) = objc_opt_respondsToSelector();

    if (v33)
    {
      objc_initWeak(&location, self);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __69__UITextInputController_insertTextPlaceholderWithSize_embeddingType___block_invoke_3;
      v40[3] = &unk_1E52DC308;
      objc_copyWeak(&v41, &location);
      id v37 = objc_loadWeakRetained((id *)&self->_layoutManager);
      [v37 setDidCompleteLayoutObserverBlock:v40];

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
    }
    self->_$DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFDFFF | (((*(unsigned int *)&tiFlags >> 13) & 1) << 13));
    [(UITextInputController *)self _updateRectsForPlaceholder];
    id v6 = *p_textPlaceholder;

    _Block_object_dispose(buf, 8);
  }
  return v6;
}

uint64_t __69__UITextInputController_insertTextPlaceholderWithSize_embeddingType___block_invoke(uint64_t result, double a2, double a3, double a4, double a5, double a6)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a6;
  return result;
}

void __69__UITextInputController_insertTextPlaceholderWithSize_embeddingType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28B18];
  double v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 attachment];
  id v7 = [v3 attributedStringWithAttachment:v6];
  id v9 = (id)[v7 mutableCopy];

  id v8 = [*(id *)(a1 + 40) typingAttributes];
  objc_msgSend(v9, "addAttributes:range:", v8, 0, 1);

  objc_msgSend(v5, "replaceCharactersInRange:withAttributedString:", *(void *)(a1 + 48), *(void *)(a1 + 56), v9);
}

void __69__UITextInputController_insertTextPlaceholderWithSize_embeddingType___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _layoutManagerDidCompleteLayout];
}

- (void)_layoutManagerDidCompleteLayout
{
  id v3 = [(UITextInputController *)self _textStorage];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__UITextInputController__layoutManagerDidCompleteLayout__block_invoke;
  v4[3] = &unk_1E530B528;
  v4[4] = self;
  [v3 coordinateReading:v4];

  [(UITextInputController *)self _updateRectsForPlaceholder];
}

void __56__UITextInputController__layoutManagerDidCompleteLayout__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)off_1E52D1F50;
  id v4 = a2;
  uint64_t v5 = [v4 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__UITextInputController__layoutManagerDidCompleteLayout__block_invoke_2;
  v6[3] = &unk_1E530B8A0;
  v6[4] = *(void *)(a1 + 32);
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v5, 0, v6);
}

void __56__UITextInputController__layoutManagerDidCompleteLayout__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = *(void **)(*(void *)(a1 + 32) + 224);
  id v10 = a2;
  id v11 = [v9 attachment];

  if (v11 == v10)
  {
    id v12 = [*(id *)(*(void *)(a1 + 32) + 224) attachment];
    objc_msgSend(v12, "setAttachmentRange:", a3, a4);

    *a5 = 1;
  }
}

- (void)_updateRectsForPlaceholder
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  textPlaceholder = self->_textPlaceholder;
  if (textPlaceholder)
  {
    id v4 = [(UITextPlaceholder *)textPlaceholder attachment];
    uint64_t v5 = [v4 attachmentRange];
    id v7 = -[UITextInputController _rectsForRange:](self, "_rectsForRange:", v5, v6);

    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v41 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          objc_msgSend(v14, "rect", (void)v40);
          if (!CGRectIsEmpty(v49)) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v11);
    }

    [(UITextPlaceholder *)self->_textPlaceholder setRects:v8];
    uint64_t v15 = [(UITextPlaceholder *)self->_textPlaceholder attachment];
    [v15 bounds];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    v50.origin.double x = v17;
    v50.origin.double y = v19;
    v50.size.double width = v21;
    v50.size.double height = v23;
    if (CGRectIsEmpty(v50))
    {
      long long v24 = [(UITextPlaceholder *)self->_textPlaceholder attachment];
      uint64_t v25 = [v24 attachmentRange];
      uint64_t v27 = v26;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
      uint64_t v29 = objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v25, v27);

      uint64_t v30 = [v29 start];
      int64_t v31 = [(UITextInputController *)self _resolveNaturalDirection:[(UITextInputController *)self baseWritingDirectionForPosition:v30 inDirection:0]];

      uint64_t v32 = [(UITextInputController *)self interactionAssistant];
      uint64_t v33 = [v32 view];
      double v34 = [v33 textInputView];

      [(UITextPlaceholder *)self->_textPlaceholder caretRectBeforeInsertion];
      uint64_t v35 = +[_UIMutableTextSelectionRect selectionRectWithRect:v34 fromView:(void)v40];
      [v35 setWritingDirection:v31];
      uint64_t v46 = v35;
      id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      [(UITextPlaceholder *)self->_textPlaceholder setRects:v36];
    }
    id v37 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", (void)v40);
    double v38 = self->_textPlaceholder;
    long long v44 = @"UITextInputPlaceholderChangedPlaceholderKey";
    NSUInteger v45 = v38;
    id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    [v37 postNotificationName:@"UITextInputPlaceholderChangedNotification" object:0 userInfo:v39];
  }
}

- (id)insertTextPlaceholderWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = a3.height > 0.0;
  if (a3.height <= 0.0)
  {
    id v7 = [(UITextInputController *)self selectedTextRange];
    id v8 = [v7 start];
    [(UITextInputController *)self caretRectForPosition:v8];
    double v10 = v9 + -2.0;

    double height = fmax(v10, 1.0);
  }
  uint64_t v11 = -[UITextInputController insertTextPlaceholderWithSize:embeddingType:](self, "insertTextPlaceholderWithSize:embeddingType:", v6, width, height);
  uint64_t v12 = v11;
  if (width <= 0.0 || height <= 0.0)
  {
    CGFloat v21 = [v11 attachment];
    [v21 setImage:0];
  }
  else
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, width, height, 0.0);
    id v13 = +[UIColor clearColor];
    [v13 setFill];

    id v14 = [v12 attachment];
    [v14 bounds];
    UIRectFillUsingOperation(1, v15, v16, v17, v18);

    CGFloat v19 = _UIGraphicsGetImageFromCurrentImageContext(0);
    double v20 = [v12 attachment];
    [v20 setImage:v19];

    UIGraphicsEndImageContext();
  }
  return v12;
}

- (id)insertDictationResultPlaceholder
{
  uint64_t v3 = [(UITextInputController *)self selectedTextRange];
  id v4 = [v3 start];
  [(UITextInputController *)self caretRectForPosition:v4];
  double v6 = v5 + -1.0;

  +[UIDictationLandingView widthForLineHeight:v6];
  ++self->_dontRemoveAllActionsCount;
  id result = -[UITextInputController insertTextPlaceholderWithSize:embeddingType:](self, "insertTextPlaceholderWithSize:embeddingType:", 0);
  --self->_dontRemoveAllActionsCount;
  return result;
}

- (CGRect)frameForTextPlaceholder:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 attachment];
  uint64_t v5 = [v4 attachmentRange];
  id v7 = -[UITextInputController _rectsForRange:](self, "_rectsForRange:", v5, v6);

  CGFloat x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v16), "rect", (void)v30);
        v39.origin.CGFloat x = v17;
        v39.origin.double y = v18;
        v39.size.CGFloat width = v19;
        v39.size.double height = v20;
        v36.origin.CGFloat x = x;
        v36.origin.double y = y;
        v36.size.CGFloat width = width;
        v36.size.double height = height;
        CGRect v37 = CGRectUnion(v36, v39);
        CGFloat x = v37.origin.x;
        double y = v37.origin.y;
        CGFloat width = v37.size.width;
        double height = v37.size.height;
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }

  CGFloat v21 = _UIMainBundleIdentifier();
  if ([v21 isEqual:@"com.apple.MobileSMS"])
  {
    double v22 = +[UIScreen mainScreen];
    [v22 scale];
    double v24 = v23;

    if (v24 <= 1.0) {
      double v25 = -1.0;
    }
    else {
      double v25 = -0.5;
    }
  }
  else
  {

    double v25 = -1.0;
  }

  double v26 = y + v25;
  double v27 = height + 2.0;
  double v28 = x;
  double v29 = width;
  result.size.double height = v27;
  result.size.CGFloat width = v29;
  result.origin.double y = v26;
  result.origin.CGFloat x = v28;
  return result;
}

- (void)removeTextPlaceholder:(id)a3 notifyInputDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (UITextPlaceholder *)a3;
  if (self->_textPlaceholder == v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutManager);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_layoutManager);
      [v9 setDidCompleteLayoutObserverBlock:0];
    }
    textPlaceholder = self->_textPlaceholder;
    self->_textPlaceholder = 0;

    NSUInteger location = self->_markedTextRange.location;
    NSUInteger length = self->_markedTextRange.length;
    unint64_t v13 = [(UITextInputController *)self _selectedRange];
    uint64_t v29 = 0;
    long long v30 = &v29;
    uint64_t v31 = 0x3010000000;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    long long v32 = &unk_186D7DBA7;
    uint64_t v14 = [(UITextPlaceholder *)v6 attachment];
    uint64_t v33 = [v14 attachmentRange];
    uint64_t v34 = v15;

    uint64_t v16 = [(UITextInputController *)self _textStorage];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __67__UITextInputController_removeTextPlaceholder_notifyInputDelegate___block_invoke;
    v26[3] = &unk_1E530B830;
    double v28 = &v29;
    CGFloat v17 = v6;
    double v27 = v17;
    [v16 coordinateReading:v26];

    if (v30[4] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v4) {
        [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:1];
      }
      CGFloat v18 = [(UITextInputController *)self _textStorage];
      unint64_t v19 = [v18 length];

      unint64_t v20 = v30[4];
      if (v20 < v19 && v30[5] + v20 <= v19)
      {
        double v24 = [(UITextInputController *)self _textStorage];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __67__UITextInputController_removeTextPlaceholder_notifyInputDelegate___block_invoke_3;
        v25[3] = &unk_1E530B8F0;
        v25[4] = &v29;
        [v24 coordinateEditing:v25];

        unint64_t v21 = v30[4];
        if (v13 > v21) {
          unint64_t v21 = v13 - v30[5];
        }
      }
      else
      {
        unint64_t v21 = v19 - 1;
      }
      -[UITextInputController setSelectedRange:](self, "setSelectedRange:", v21, 0);
      [(UITextInputController *)self _setSelectedRangeToEndIfNecessary];
      if (location != 0x7FFFFFFFFFFFFFFFLL)
      {
        self->_markedTextRange.NSUInteger location = location;
        self->_markedTextRange.NSUInteger length = length;
        if (location > v30[4]) {
          self->_markedTextRange.NSUInteger location = location - 1;
        }
      }
      double v22 = [(UITextPlaceholder *)v17 attachment];
      double v23 = [v22 typingAttributesBeforeInsertion];
      [(UITextInputController *)self setTypingAttributes:v23];

      if (v4) {
        [(UITextInputController *)self _sendDelegateChangeNotificationsForText:1 selection:1];
      }
    }

    _Block_object_dispose(&v29, 8);
  }
}

void __67__UITextInputController_removeTextPlaceholder_notifyInputDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
  unint64_t v5 = [v3 length];
  uint64_t v6 = *(void *)off_1E52D1F50;
  if (v4 >= v5
    || ([v3 attribute:*(void *)off_1E52D1F50 atIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) effectiveRange:0], id v7 = objc_claimAutoreleasedReturnValue(), objc_msgSend(*(id *)(a1 + 32), "attachment"), v8 = objc_claimAutoreleasedReturnValue(), v8, v7, v7 != v8))
  {
    *(_OWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = xmmword_186B93450;
    uint64_t v9 = [v3 length];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__UITextInputController_removeTextPlaceholder_notifyInputDelegate___block_invoke_2;
    v12[3] = &unk_1E530B8C8;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v13 = v10;
    uint64_t v14 = v11;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v9, 0x100000, v12);
  }
}

void __67__UITextInputController_removeTextPlaceholder_notifyInputDelegate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = a2;
  id v11 = [v9 attachment];

  if (v11 == v10)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v12 + 32) = a3;
    *(void *)(v12 + 40) = a4;
    *a5 = 1;
  }
}

uint64_t __67__UITextInputController_removeTextPlaceholder_notifyInputDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "replaceCharactersInRange:withString:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &stru_1ED0E84C0);
}

- (void)removeTextPlaceholder:(id)a3
{
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  ++self->_dontRemoveAllActionsCount;
  $DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = self->_tiFlags;
  self->_$DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&tiFlags | 0x2000);
  [(UITextInputController *)self removeTextPlaceholder:a3 notifyInputDelegate:!a4];
  self->_$DC2D22D023D617B6DA0FE84CE3B2FD07 tiFlags = ($DC2D22D023D617B6DA0FE84CE3B2FD07)(*(_DWORD *)&self->_tiFlags & 0xFFFFDFFF | (((*(unsigned int *)&tiFlags >> 13) & 1) << 13));
  --self->_dontRemoveAllActionsCount;
}

- (id)rangeWithTextAlternatives:(id *)a3 atPosition:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  id v8 = 0;
  if (a3 && v6)
  {
    uint64_t v9 = [(UITextInputController *)self _textStorage];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      id v11 = [(UITextInputController *)self textRangeFromPosition:v7 toPosition:v7];
      uint64_t v12 = [(UITextInputController *)self nsRangeForTextRange:v11];

      id v8 = 0;
      v28[0] = 0;
      v28[1] = v28;
      void v28[2] = 0x2020000000;
      v28[3] = v12;
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v22 = 0;
        double v23 = &v22;
        uint64_t v24 = 0x3032000000;
        double v25 = __Block_byref_object_copy__211;
        double v26 = __Block_byref_object_dispose__211;
        id v27 = 0;
        uint64_t v16 = 0;
        CGFloat v17 = &v16;
        uint64_t v18 = 0x3032000000;
        unint64_t v19 = __Block_byref_object_copy__211;
        unint64_t v20 = __Block_byref_object_dispose__211;
        id v21 = 0;
        id v13 = [(UITextInputController *)self _textStorage];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __62__UITextInputController_rangeWithTextAlternatives_atPosition___block_invoke;
        v15[3] = &unk_1E530B918;
        void v15[6] = &v16;
        v15[7] = &v22;
        v15[4] = self;
        void v15[5] = v28;
        [v13 coordinateReading:v15];

        *a3 = (id) v17[5];
        id v8 = (id)v23[5];
        _Block_object_dispose(&v16, 8);

        _Block_object_dispose(&v22, 8);
      }
      _Block_object_dispose(v28, 8);
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

void __62__UITextInputController_rangeWithTextAlternatives_atPosition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v4 = a2;
  if (v3 == [v4 length]) {
    --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  uint64_t v5 = objc_msgSend(v4, "attribute:atIndex:longestEffectiveRange:inRange:", *(void *)off_1E52D2288, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), &v11, 0, objc_msgSend(v4, "length", v11, v12));

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "textRangeForNSRange:", v11, v12);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)addTextAlternatives:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(UITextInputController *)self _selectedRange];
  uint64_t v6 = [v4 primaryString];
  unint64_t v7 = [v6 length];

  if (v5 >= v7)
  {
    uint64_t v8 = [(UITextInputController *)self _selectedRange];
    uint64_t v9 = [v4 primaryString];
    uint64_t v10 = v8 - [v9 length];
    uint64_t v11 = [v4 primaryString];
    uint64_t v12 = [v11 length];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
    uint64_t v14 = objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v10, v12);

    uint64_t v15 = [(UITextInputController *)self textInRange:v14];
    uint64_t v16 = [v4 primaryString];
    int v17 = [v15 isEqualToString:v16];

    if (v17)
    {
      uint64_t v18 = [(UITextInputController *)self _textStorage];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __45__UITextInputController_addTextAlternatives___block_invoke;
      v19[3] = &unk_1E530B940;
      uint64_t v23 = v10;
      uint64_t v24 = v12;
      id v20 = v4;
      id v21 = self;
      id v22 = v14;
      [v18 coordinateEditing:v19];
    }
  }
}

void __45__UITextInputController_addTextAlternatives___block_invoke(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = *(id *)(a1 + 32);
  v23[0] = 0;
  v23[1] = 0;
  uint64_t v5 = *(void *)off_1E52D2288;
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = a2;
  uint64_t v8 = [v7 attribute:v5 atIndex:v6 effectiveRange:v23];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 primaryString];
    uint64_t v11 = [v4 primaryString];
    int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      id v13 = (void *)MEMORY[0x1E4F1CA70];
      uint64_t v14 = [v9 alternativeStrings];
      uint64_t v15 = [v13 orderedSetWithArray:v14];

      uint64_t v16 = [*(id *)(a1 + 32) alternativeStrings];
      [v15 addObjectsFromArray:v16];

      id v17 = objc_alloc((Class)off_1E52D2EA8);
      uint64_t v18 = [v4 primaryString];
      unint64_t v19 = [v15 array];
      uint64_t v20 = objc_msgSend(v17, "initWithPrimaryString:alternativeStrings:isLowConfidence:", v18, v19, objc_msgSend(v4, "isLowConfidence"));

      id v4 = (id)v20;
    }
  }
  objc_msgSend(v7, "removeAttribute:range:", v5, *(void *)(a1 + 56), *(void *)(a1 + 64));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 248));
  [WeakRetained removeAnnotationAttribute:*(void *)off_1E52D2290 forRange:*(void *)(a1 + 48)];

  uint64_t v24 = v5;
  v25[0] = v4;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  objc_msgSend(v7, "addAttributes:range:", v22, *(void *)(a1 + 56), *(void *)(a1 + 64));

  objc_msgSend(*(id *)(a1 + 40), "addTextAlternativesDisplayStyle:toRange:", objc_msgSend(v4, "isLowConfidence"), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

- (void)removeEmojiAlternatives
{
  if ((*((unsigned char *)&self->_tiFlags + 2) & 2) != 0)
  {
    uint64_t v3 = [(UITextInputController *)self _textStorage];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      uint64_t v5 = [(UITextInputController *)self _textStorage];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __48__UITextInputController_removeEmojiAlternatives__block_invoke;
      v6[3] = &unk_1E530B408;
      v6[4] = self;
      [v5 coordinateEditing:v6];
    }
  }
}

void __48__UITextInputController_removeEmojiAlternatives__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) _selectedRange];
  uint64_t v5 = [*(id *)(a1 + 32) _textStorage];
  unint64_t v6 = v4 - (v4 >= [v5 length]);

  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v7 = *(void *)off_1E52D2288;
  uint64_t v8 = [v3 attribute:*(void *)off_1E52D2288 atIndex:v6 effectiveRange:&v28];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v11 = [v8 alternativeStrings];
    int v12 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = objc_msgSend(v9, "alternativeStrings", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (([v18 _containsEmojiOnly] & 1) == 0) {
            [v12 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v15);
    }

    objc_msgSend(v3, "removeAttribute:range:", v7, v28, v29);
    if ([v12 count])
    {
      id v19 = objc_alloc((Class)off_1E52D2EA8);
      uint64_t v20 = [v9 primaryString];
      id WeakRetained = (id)objc_msgSend(v19, "initWithPrimaryString:alternativeStrings:isLowConfidence:", v20, v12, objc_msgSend(v9, "isLowConfidence"));

      uint64_t v30 = v7;
      id v31 = WeakRetained;
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      objc_msgSend(v3, "addAttributes:range:", v22, v28, v29);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
      uint64_t v23 = *(void *)off_1E52D2290;
      id v22 = objc_msgSend(*(id *)(a1 + 32), "textRangeForNSRange:", v28, v29);
      [WeakRetained removeAnnotationAttribute:v23 forRange:v22];
    }
  }
}

- (id)_prefixTokensForDictationAttributedText:(id)a3 lastDictationAttributedTextRange:(_NSRange)a4 currentDictationAttributedTextRange:(_NSRange)a5
{
  NSUInteger location = a5.location;
  NSUInteger length = a4.length;
  NSUInteger v7 = a4.location;
  id v8 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__211;
  long long v24 = __Block_byref_object_dispose__211;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  NSUInteger v9 = v7 + length;
  NSUInteger v10 = location - v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __134__UITextInputController__prefixTokensForDictationAttributedText_lastDictationAttributedTextRange_currentDictationAttributedTextRange___block_invoke;
  v15[3] = &unk_1E530B968;
  v15[4] = &v16;
  void v15[5] = &v20;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", v9, v10, 259, v15);
  if (!*((_DWORD *)v17 + 6))
  {
    uint64_t v11 = (void *)v21[5];
    int v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v9, v10);
    [v11 addObject:v12];
  }
  id v13 = (id)v21[5];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v13;
}

void __134__UITextInputController__prefixTokensForDictationAttributedText_lastDictationAttributedTextRange_currentDictationAttributedTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if ((int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 5) {
    *a7 = 1;
  }
  NSUInteger v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a5, a6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 addObject:v8];
}

- (id)_postfixTokensForDictationAttributedText:(id)a3 currentDictationAttributedTextRange:(_NSRange)a4 nextDictationAttributedTextRange:(_NSRange)a5
{
  NSUInteger location = a5.location;
  NSUInteger length = a4.length;
  NSUInteger v7 = a4.location;
  id v8 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__211;
  long long v24 = __Block_byref_object_dispose__211;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  NSUInteger v9 = v7 + length;
  NSUInteger v10 = location - v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __135__UITextInputController__postfixTokensForDictationAttributedText_currentDictationAttributedTextRange_nextDictationAttributedTextRange___block_invoke;
  v15[3] = &unk_1E530B968;
  v15[4] = &v16;
  void v15[5] = &v20;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", v9, v10, 3, v15);
  if (!*((_DWORD *)v17 + 6))
  {
    uint64_t v11 = (void *)v21[5];
    int v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v9, v10);
    [v11 addObject:v12];
  }
  id v13 = (id)v21[5];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v13;
}

void __135__UITextInputController__postfixTokensForDictationAttributedText_currentDictationAttributedTextRange_nextDictationAttributedTextRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if ((int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 5) {
    *a7 = 1;
  }
  NSUInteger v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a5, a6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v7 addObject:v8];
}

- (id)_userEditedTextInfo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__211;
  id v17 = __Block_byref_object_dispose__211;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  NSUInteger v10 = __Block_byref_object_copy__211;
  uint64_t v11 = __Block_byref_object_dispose__211;
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  unint64_t v4 = [(UITextInputController *)self _textStorage];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__UITextInputController__userEditedTextInfo__block_invoke;
  v6[3] = &unk_1E530BA30;
  v6[4] = self;
  void v6[5] = &v13;
  void v6[6] = &v7;
  [v4 coordinateReading:v6];

  [v3 setObject:v8[5] forKeyedSubscript:@"userEditedText"];
  [v3 setObject:v14[5] forKeyedSubscript:@"userEditedTextRanges"];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v3;
}

void __44__UITextInputController__userEditedTextInfo__block_invoke(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [v3 length];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __44__UITextInputController__userEditedTextInfo__block_invoke_2;
  v35[3] = &unk_1E52D9A30;
  id v6 = v4;
  id v36 = v6;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", @"_UITextInputDictationResultMetadata", 0, v5, 0x100000, v35);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3010000000;
  v34[3] = &unk_186D7DBA7;
  v34[4] = 0;
  void v34[5] = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __44__UITextInputController__userEditedTextInfo__block_invoke_3;
  v29[3] = &unk_1E52F03F0;
  v29[4] = a1[4];
  id v7 = v3;
  id v30 = v7;
  uint64_t v8 = a1[5];
  long long v32 = v34;
  uint64_t v33 = v8;
  id v9 = v6;
  id v31 = v9;
  [v9 enumerateObjectsUsingBlock:v29];
  NSUInteger v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:*(void *)(*(void *)(a1[5] + 8) + 40)];
  uint64_t v11 = [v10 array];
  uint64_t v12 = [v11 mutableCopy];
  uint64_t v13 = *(void *)(a1[5] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = *(id *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v15);
        }
        int v19 = *(void **)(*((void *)&v25 + 1) + 8 * v18);
        uint64_t v20 = *(void **)(*(void *)(a1[6] + 8) + 40);
        id v21 = objc_msgSend(v7, "string", (void)v25);
        uint64_t v22 = [v19 rangeValue];
        long long v24 = objc_msgSend(v21, "substringWithRange:", v22, v23);
        [v20 appendString:v24];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v16);
  }

  _Block_object_dispose(v34, 8);
}

void __44__UITextInputController__userEditedTextInfo__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v2 addObject:v3];
  }
}

void __44__UITextInputController__userEditedTextInfo__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v39 = a2;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) string];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v11 = [v39 rangeValue];
  uint64_t v13 = objc_msgSend(v8, "_prefixTokensForDictationAttributedText:lastDictationAttributedTextRange:currentDictationAttributedTextRange:", v9, *(void *)(v10 + 32), *(void *)(v10 + 40), v11, v12);
  [v7 addObjectsFromArray:v13];

  uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v15 = [v7 reverseObjectEnumerator];
  uint64_t v16 = [v15 allObjects];
  [v14 addObjectsFromArray:v16];

  uint64_t v17 = [v39 rangeValue];
  uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v18 + 32) = v17;
  *(void *)(v18 + 40) = v19;
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v39];
  if ([*(id *)(a1 + 48) count] - 1 == a3)
  {
    int v20 = [v39 rangeValue];
    [v39 rangeValue];
    uint64_t v22 = v21 + v20;
    uint64_t v23 = [*(id *)(a1 + 40) string];
    uint64_t v24 = [v23 length];

    if (v22 != v24)
    {
      long long v25 = [*(id *)(a1 + 40) string];
      uint64_t v26 = [v25 length] - v22;

      long long v27 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      long long v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v22, v26);
      [v27 addObject:v28];
    }
    *a4 = 1;
  }
  else
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v30 = *(void **)(a1 + 32);
    id v31 = [*(id *)(a1 + 40) string];
    uint64_t v32 = [v39 rangeValue];
    uint64_t v34 = v33;
    uint64_t v35 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3 + 1];
    uint64_t v36 = [v35 rangeValue];
    uint64_t v38 = objc_msgSend(v30, "_postfixTokensForDictationAttributedText:currentDictationAttributedTextRange:nextDictationAttributedTextRange:", v31, v32, v34, v36, v37);
    [v29 addObjectsFromArray:v38];

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObjectsFromArray:v29];
  }
}

- (id)metadataDictionariesForDictationResults
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(UITextInputController *)self _userEditedTextInfo];
  uint64_t v5 = [(UITextInputController *)self _textStorage];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__UITextInputController_metadataDictionariesForDictationResults__block_invoke;
  v11[3] = &unk_1E530B9B8;
  id v6 = v3;
  id v12 = v6;
  uint64_t v13 = v4;
  id v7 = v4;
  [v5 coordinateReading:v11];

  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

void __64__UITextInputController_metadataDictionariesForDictationResults__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__211;
  void v17[4] = __Block_byref_object_dispose__211;
  id v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__211;
  v15[4] = __Block_byref_object_dispose__211;
  id v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3010000000;
  v13[3] = &unk_186D7DBA7;
  long long v14 = xmmword_186B93450;
  uint64_t v4 = [v3 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__UITextInputController_metadataDictionariesForDictationResults__block_invoke_2;
  v6[3] = &unk_1E530B990;
  uint64_t v10 = v17;
  uint64_t v11 = v15;
  id v7 = *(id *)(a1 + 32);
  id v12 = v13;
  id v5 = v3;
  id v8 = v5;
  id v9 = *(id *)(a1 + 40);
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", @"_UITextInputDictationResultMetadata", 0, v4, 0x100000, v6);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(v17, 8);
}

void __64__UITextInputController_metadataDictionariesForDictationResults__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  if (!v8) {
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_30;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(id *)(v10 + 40);
  uint64_t v11 = (id *)(v10 + 40);
  if (v12 != v9)
  {
    objc_storeStrong(v11, a2);
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = &stru_1ED0E84C0;

    id v15 = [v9 objectForKey:@"insertion"];

    if (v15)
    {
      id v16 = [v9 objectForKey:@"insertion"];
      [v9 removeObjectForKey:@"insertion"];
      uint64_t v17 = [v9 objectForKey:@"insertions"];

      if (v17)
      {
        id v18 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v19 = [v9 objectForKey:@"insertions"];
        int v20 = [v18 arrayWithArray:v19];

        [v20 addObject:v16];
      }
      else
      {
        v57[0] = v16;
        int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
      }
      [v9 setObject:v20 forKey:@"insertions"];
    }
    int v21 = [v9 objectForKey:@"deletion"];

    if (v21)
    {
      uint64_t v22 = [v9 objectForKey:@"deletion"];
      [v9 removeObjectForKey:@"deletion"];
      uint64_t v23 = [v9 objectForKey:@"deletions"];

      if (v23)
      {
        uint64_t v24 = (void *)MEMORY[0x1E4F1CA48];
        long long v25 = [v9 objectForKey:@"deletions"];
        uint64_t v26 = [v24 arrayWithArray:v25];

        [v26 addObject:v22];
      }
      else
      {
        v56 = v22;
        uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
      }
      [v9 setObject:v26 forKey:@"deletions"];
    }
    if (([*(id *)(a1 + 32) containsObject:v9] & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v9];
    }
  }
  uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v28 = *(void *)(v27 + 32);
  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) length]) {
      BOOL v29 = 1;
    }
    else {
      BOOL v29 = a3 == 0;
    }
    uint64_t v30 = a4;
    uint64_t v31 = a3;
    if (v29) {
      goto LABEL_26;
    }
    uint64_t v32 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) stringByAppendingString:@"*"];
    uint64_t v33 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;

    goto LABEL_25;
  }
  uint64_t v31 = *(void *)(v27 + 40) + v28;
  uint64_t v35 = a3 - v31;
  if (a3 - v31 >= +[UIDictationUtilities maxLoggableLengthOfInsertionWithDeletion:v9])
  {
    uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
        + *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 32);
    unint64_t v37 = +[UIDictationUtilities maxLoggableLengthOfInsertionWithDeletion:v9];
    uint64_t v38 = [*(id *)(a1 + 40) string];
    id v39 = objc_msgSend(v38, "substringWithRange:", v36, v37);

    long long v40 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    long long v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v35- +[UIDictationUtilities maxLoggableLengthOfInsertionWithDeletion:](UIDictationUtilities, "maxLoggableLengthOfInsertionWithDeletion:", v9));
    uint64_t v42 = [v40 stringByAppendingFormat:@"%@(%@*)", v39, v41];
    uint64_t v43 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v44 = *(void **)(v43 + 40);
    *(void *)(v43 + 40) = v42;

LABEL_25:
    uint64_t v30 = a4;
    uint64_t v31 = a3;
    goto LABEL_26;
  }
  uint64_t v30 = v35 + a4;
LABEL_26:
  uint64_t v45 = *(void *)(*(void *)(a1 + 72) + 8);
  *(void *)(v45 + 32) = a3;
  *(void *)(v45 + 40) = a4;
  uint64_t v46 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v47 = [*(id *)(a1 + 40) string];
  uint64_t v48 = objc_msgSend(v47, "substringWithRange:", v31, v30);
  uint64_t v49 = [v46 stringByAppendingString:v48];
  uint64_t v50 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v51 = *(void **)(v50 + 40);
  *(void *)(v50 + 40) = v49;

  [v9 setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:@"fullText"];
  uint64_t v52 = [v9 objectForKeyedSubscript:@"recognizedTextInfo"];
  uint64_t v53 = *(void **)(a1 + 48);
  if (v52)
  {
    uint64_t v54 = [v53 objectForKeyedSubscript:@"userEditedText"];
    [v52 setObject:v54 forKey:@"userEditedText"];

    uint64_t v55 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"userEditedTextRanges"];
    [v52 setObject:v55 forKey:@"userEditedTextRanges"];
  }
  else
  {
    uint64_t v52 = (void *)[v53 mutableCopy];
  }
  [v9 setObject:v52 forKey:@"recognizedTextInfo"];

LABEL_30:
}

- (id)dictationLanguageForSelectedText
{
  id v3 = [(UITextInputController *)self selectedTextRange];
  uint64_t v4 = [v3 start];
  id v5 = [(UITextInputController *)self _rangeOfEnclosingWord:v4];

  id v6 = [(UITextInputController *)self attributedTextInRange:v5];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__211;
  id v18 = __Block_byref_object_dispose__211;
  id v19 = 0;
  uint64_t v7 = [v6 length];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__UITextInputController_dictationLanguageForSelectedText__block_invoke;
  v11[3] = &unk_1E530B9E0;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v14;
  objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0x100000, v11);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __57__UITextInputController_dictationLanguageForSelectedText__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v8 = [a2 allKeys];
  char v9 = [v8 containsObject:@"_UITextInputDictationResultMetadata"];

  if (v9)
  {
    id v14 = [*(id *)(a1 + 32) attribute:@"_UITextInputDictationResultMetadata" atIndex:a3 effectiveRange:0];
    uint64_t v10 = [v14 objectForKeyedSubscript:@"dictationLanguage"];
    char v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    if ((v11 & 1) != 0 || (uint64_t v13 = *(void **)(v12 + 40)) == 0)
    {
      objc_storeStrong((id *)(v12 + 40), v10);
    }
    else
    {
      *(void *)(v12 + 40) = 0;

      *a5 = 1;
    }
  }
  else
  {
    *a5 = 1;
  }
}

- (void)signalDictationInputEvent:(id)a3 insertedText:(id)a4
{
  id v13 = a4;
  if (+[UIDictationController isRunning])
  {
    id v5 = [(UITextInputController *)self _selectedText];
    uint64_t v6 = [v5 length];

    uint64_t v7 = +[UIDictationController sharedInstance];
    id v8 = [v7 dictationTipController];
    char v9 = v8;
    if (v6)
    {
      uint64_t v10 = [(UITextInputController *)self _selectedText];
      [v9 signalDictationReplacementTip:v10];
    }
    else
    {
      [v8 signalDictationInsertionTip:v13];
    }

    char v11 = +[UIDictationController sharedInstance];
    uint64_t v12 = [v11 dictationTipController];
    [v12 recordDictationTipReplacementText:v13];
  }
}

- (void)signalDictationDeletionTip
{
  id v25 = [MEMORY[0x1E4FAE2A8] documentStateOfDocumentWithParagraph:self];
  id v3 = [v25 selectedText];

  if (v3)
  {
    uint64_t v4 = [v25 selectedText];
  }
  else
  {
    id v5 = [v25 contextBeforeInput];
    uint64_t v6 = [v5 _lastGrapheme];

    uint64_t v7 = [v25 contextBeforeInput];
    id v8 = [v25 contextBeforeInput];
    uint64_t v4 = objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v8, "length") - objc_msgSend(v6, "length"));
  }
  char v9 = +[UIDictationController activeInstance];
  uint64_t v10 = [(UITextInputController *)self _selectedRange];
  objc_msgSend(v9, "markDictationTipDeletionEvent:deletedTextRange:", v4, v10, v11);

  uint64_t v12 = +[UIDictationController sharedInstance];
  if ([v12 consecutiveKeyboardDeleteEventCount] > 4)
  {
    BOOL v14 = 0;
  }
  else
  {
    id v13 = [(UITextInputController *)self _selectedText];
    BOOL v14 = [v13 length] == 0;
  }
  if (+[UIDictationController isRunning] && !v14)
  {
    id v15 = [(UITextInputController *)self _selectedText];
    uint64_t v16 = [v15 length];

    if (v16)
    {
      uint64_t v17 = [(UITextInputController *)self _selectedText];
      uint64_t v18 = [v17 length];
      id v19 = [v25 string];
      uint64_t v20 = [v19 length];

      int v21 = +[UIDictationController sharedInstance];
      uint64_t v22 = [v21 dictationTipController];
      uint64_t v23 = v22;
      if (v18 == v20)
      {
        [v22 signalDictationClearAllTip];
      }
      else
      {
        uint64_t v24 = [(UITextInputController *)self _selectedText];
        [v23 signalDictationDeletionTip:v24];
      }
    }
    else
    {
      int v21 = +[UIDictationController sharedInstance];
      uint64_t v23 = [v21 dictationTipController];
      [v23 signalDictationDeletionTip:v4];
    }
  }
}

- (void)signalDictationSelectionTip:(id)a3
{
  id v10 = a3;
  if (+[UIDictationController isRunning])
  {
    uint64_t v4 = [v10 start];
    id v5 = [v10 end];
    uint64_t v6 = [(UITextInputController *)self offsetFromPosition:v4 toPosition:v5];

    if (v6 >= 1)
    {
      uint64_t v7 = +[UIDictationController sharedInstance];
      id v8 = [v7 dictationTipController];
      char v9 = [(UITextInputController *)self textInRange:v10];
      [v8 signalDictationSelectionTip:v9];
    }
  }
}

- (BOOL)_canHandleResponderAction:(SEL)a3
{
  BOOL v4 = 1;
  if (sel_cut_ != a3
    && sel_copy_ != a3
    && sel_paste_ != a3
    && sel_pasteAndMatchStyle_ != a3
    && sel_alignLeft_ != a3
    && sel_alignCenter_ != a3
    && sel_alignJustified_ != a3
    && sel_alignRight_ != a3
    && sel_promptForReplace_ != a3
    && sel__promptForReplace_ != a3
    && sel__transliterateChinese_ != a3
    && sel_select_ != a3
    && sel_selectAll_ != a3
    && sel_makeTextWritingDirectionNatural_ != a3
    && sel_makeTextWritingDirectionRightToLeft_ != a3
    && sel_makeTextWritingDirectionLeftToRight_ != a3
    && sel_replace_ != a3
    && sel__insertDrawing_ != a3
    && sel_captureTextFromCamera_ != a3
    && sel_toggleBoldface_ != a3
    && sel_toggleItalics_ != a3
    && sel_toggleUnderline_ != a3
    && sel_increaseSize_ != a3
    && sel_decreaseSize_ != a3)
  {
    BOOL v4 = sel_showWritingTools_ == a3;
  }
  id v5 = [(UITextInputController *)self _firstTextView];
  uint64_t v6 = [v5 traitCollection];

  BOOL v7 = [v6 userInterfaceIdiom] != 6 || objc_msgSend(v6, "_presentationSemanticContext") != 3;
  if (sel__define_ != a3 && sel__translate_ != a3 && sel__addShortcut_ != a3 && sel__share_ != a3) {
    BOOL v7 = 0;
  }
  BOOL v11 = v4 || v7;

  return v11;
}

- (BOOL)_shouldHandleResponderAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  BOOL v7 = [(UITextInputController *)self hasText];
  if (sel_paste_ == a3 || sel_pasteAndMatchStyle_ == a3)
  {
    BOOL v9 = [(UITextInputController *)self isEditing];
    *((unsigned char *)v54 + 24) = v9;
    if ([(UITextInputController *)self allowsEditingTextAttributes])
    {
LABEL_54:
      LOBYTE(v15) = *((unsigned char *)v54 + 24) != 0;
      goto LABEL_55;
    }
    id v10 = v54;
    if (!*((unsigned char *)v54 + 24))
    {
LABEL_51:
      *((unsigned char *)v10 + 24) = 0;
      goto LABEL_54;
    }
    BOOL v11 = +[UIPasteboard generalPasteboard];
    char v12 = [v11 hasStrings];
    *((unsigned char *)v54 + 24) = v12;
LABEL_9:

    goto LABEL_54;
  }
  if (sel_copy_ == a3)
  {
    if ([(UITextInputController *)self isSecureTextEntry])
    {
LABEL_42:
      LOBYTE(v16) = 0;
LABEL_53:
      *((unsigned char *)v54 + 24) = v16;
      goto LABEL_54;
    }
LABEL_52:
    [(UITextInputController *)self selectedRange];
    LOBYTE(v16) = v20 != 0;
    goto LABEL_53;
  }
  if (sel_cut_ == a3)
  {
    if (![(UITextInputController *)self isEditing]
      || ([(UITextInputController *)self isSecureTextEntry] & 1) != 0)
    {
      goto LABEL_42;
    }
    goto LABEL_52;
  }
  if (sel_promptForReplace_ == a3 || sel__promptForReplace_ == a3 || sel__transliterateChinese_ == a3)
  {
    if ([(UITextInputController *)self isEditing])
    {
      if (([(UITextInputController *)self isSecureTextEntry] & 1) == 0)
      {
        [(UITextInputController *)self selectedRange];
        if (v17)
        {
          uint64_t v18 = [(UITextInputController *)self _selectedAttributedText];
          BOOL v19 = +[UIDictationMultilingualUtilities hasMultilingualAttributesForAttributedString:v18];

          if (v19)
          {
            LOBYTE(v15) = 1;
          }
          else
          {
            uint64_t v26 = [(UITextInputController *)self _selectedText];
            int v15 = [(UITextInputController *)self _shouldPerformUICalloutBarButtonReplaceAction:a3 forText:v26 checkAutocorrection:1];
            if (v15 && sel__transliterateChinese_ != a3)
            {
              uint64_t v27 = [(UITextInputController *)self interactionAssistant];
              LOBYTE(v15) = [v27 hasReplacements];
            }
          }
          goto LABEL_55;
        }
      }
    }
    goto LABEL_93;
  }
  BOOL v13 = v7;
  if (sel_select_ == a3)
  {
    if (![(UITextInputController *)self isEditing]
      || (([(UITextInputController *)self isSecureTextEntry] | !v13) & 1) != 0)
    {
LABEL_50:
      id v10 = v54;
      goto LABEL_51;
    }
LABEL_62:
    BOOL v11 = [(UITextInputController *)self _selectedText];
    uint64_t v25 = [v11 length];
    *((unsigned char *)v54 + 24) = v25 == 0;
    goto LABEL_9;
  }
  if (sel_selectAll_ == a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [v6 sender];
      BOOL v23 = v22 == 0;
    }
    else
    {
      BOOL v23 = 0;
    }
    int v16 = [(UITextInputController *)self isEditing] && v13;
    if ((v16 ^ 1 | v23)) {
      goto LABEL_53;
    }
    goto LABEL_62;
  }
  if (sel_makeTextWritingDirectionRightToLeft_ == a3
    || sel_makeTextWritingDirectionLeftToRight_ == a3
    || sel_makeTextWritingDirectionNatural_ == a3)
  {
    if ([(UITextInputController *)self allowsEditingTextAttributes])
    {
      uint64_t v24 = [(UITextInputController *)self _textStorage];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __65__UITextInputController__shouldHandleResponderAction_withSender___block_invoke;
      v52[3] = &unk_1E530BA08;
      v52[4] = self;
      v52[5] = &v53;
      v52[6] = a3;
      [v24 coordinateReading:v52];
    }
    goto LABEL_54;
  }
  if (sel_replace_ == a3)
  {
    if ([(UITextInputController *)self isEditing])
    {
      LOBYTE(v16) = v13 & ~[(UITextInputController *)self isSecureTextEntry];
      goto LABEL_53;
    }
    goto LABEL_42;
  }
  if (sel__share_ == a3)
  {
    if (([(UITextInputController *)self isSecureTextEntry] & 1) == 0)
    {
      if (qword_1EB264890 != -1) {
        dispatch_once(&qword_1EB264890, &__block_literal_global_691_0);
      }
      uint64_t v28 = [(UITextInputController *)self _selectedText];
      BOOL v29 = [v28 stringByTrimmingCharactersInSet:qword_1EB264888];

      if ([v29 length])
      {
        uint64_t v30 = [(UITextInputController *)self _firstTextView];
        char v31 = [v30 _canShowTextServiceForType:8];
        *((unsigned char *)v54 + 24) = v31;

        goto LABEL_54;
      }
    }
    goto LABEL_93;
  }
  if (sel__define_ == a3)
  {
    if ([(UITextInputController *)self isSecureTextEntry]) {
      goto LABEL_93;
    }
    uint64_t v32 = [(UITextInputController *)self _firstTextView];
    int v15 = [v32 _canShowTextServiceForType:2];

    if (!v15) {
      goto LABEL_55;
    }
LABEL_79:
    BOOL v14 = [(UITextInputController *)self _selectedText];
    LOBYTE(v15) = [v14 length] != 0;
    goto LABEL_80;
  }
  if (sel__translate_ == a3)
  {
    if ([(UITextInputController *)self isSecureTextEntry]) {
      goto LABEL_93;
    }
    uint64_t v33 = [(UITextInputController *)self _firstTextView];
    int v15 = [v33 _canShowTextServiceForType:32];

    if (!v15) {
      goto LABEL_55;
    }
    goto LABEL_79;
  }
  if (sel__addShortcut_ == a3)
  {
    uint64_t v34 = +[_UITextServiceSession textServiceSessionForType:4];
    char v35 = [v34 isDisplaying];

    if ((v35 & 1) == 0 && ([(UITextInputController *)self isSecureTextEntry] & 1) == 0)
    {
      [(UITextInputController *)self selectedRange];
      if (v36)
      {
        unint64_t v37 = [(UITextInputController *)self _firstTextView];
        int v15 = [v37 _canShowTextServiceForType:4];

        if (!v15) {
          goto LABEL_55;
        }
        if (TIEnabledInputModesAllowOneToManyShortcuts())
        {
          uint64_t v38 = [(UITextInputController *)self _selectedText];
          int v15 = [v38 _containsCJScripts];

          if (!v15) {
            goto LABEL_55;
          }
          id v39 = [(UITextInputController *)self _firstTextView];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v40 = [(UITextInputController *)self _firstTextView];
            char v41 = [v40 _inPopover];

            if (v41) {
              goto LABEL_93;
            }
          }
          else
          {
          }
          uint64_t v45 = +[UIDevice currentDevice];
          uint64_t v46 = [v45 userInterfaceIdiom];

          if ((v46 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
            goto LABEL_108;
          }
          uint64_t v47 = [(UITextInputController *)self _firstTextView];
          uint64_t v48 = [v47 window];
          uint64_t v49 = [(UITextInputController *)self _firstTextView];
          uint64_t v50 = [v49 keyboardSceneDelegate];
          uint64_t v51 = [v50 containerWindow];

          if (v48 != v51)
          {
LABEL_108:
            *((unsigned char *)v54 + 24) = 1;
            goto LABEL_54;
          }
        }
      }
    }
LABEL_93:
    LOBYTE(v15) = 0;
    goto LABEL_55;
  }
  if (sel_toggleBoldface_ == a3
    || sel_toggleItalics_ == a3
    || sel_toggleUnderline_ == a3
    || sel_alignLeft_ == a3
    || sel_alignRight_ == a3
    || sel_alignCenter_ == a3
    || sel_alignJustified_ == a3
    || sel_increaseSize_ == a3
    || sel_decreaseSize_ == a3)
  {
    if ([(UITextInputController *)self isEditing])
    {
      LOBYTE(v15) = [(UITextInputController *)self allowsEditingTextAttributes];
      goto LABEL_55;
    }
    goto LABEL_93;
  }
  if (sel__insertDrawing_ == a3)
  {
    if ([(UITextInputController *)self isEditing])
    {
      uint64_t v42 = [(UITextInputController *)self _firstTextView];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v43 = [(UITextInputController *)self _firstTextView];
        LOBYTE(v15) = [v43 _canInsertDrawing];
      }
      else
      {
        LOBYTE(v15) = 0;
      }

      goto LABEL_55;
    }
    goto LABEL_93;
  }
  if (sel_captureTextFromCamera_ != a3)
  {
    if (sel_showWritingTools_ == a3)
    {
      BOOL v14 = [(UITextInputController *)self _firstTextView];
      LOBYTE(v15) = [v14 _shouldDisplayWritingToolsCalloutBarItem];
LABEL_80:

      goto LABEL_55;
    }
    goto LABEL_50;
  }
  if (+[UIKeyboardCameraSession isEnabled]
    && [(UITextInputController *)self isEditable])
  {
    [(UITextInputController *)self selectedRange];
    int v15 = v44 == 0;
  }
  else
  {
    int v15 = 0;
  }
  if (+[UIKeyboard isModelessActive])
  {
    BOOL v14 = +[UIDictationController activeInstance];
    v15 &= [v14 shouldSuppressSoftwareKeyboard] ^ 1;
    goto LABEL_80;
  }
LABEL_55:
  _Block_object_dispose(&v53, 8);

  return v15;
}

void __65__UITextInputController__shouldHandleResponderAction_withSender___block_invoke(uint64_t a1, void *a2)
{
  id v24 = a2;
  uint64_t v3 = [off_1E52D2DD0 defaultWritingDirectionForLanguage:0];
  BOOL v4 = [*(id *)(a1 + 32) typingAttributes];
  uint64_t v5 = *(void *)off_1E52D21B8;
  id v6 = [v4 objectForKey:*(void *)off_1E52D21B8];

  if ([v24 length] && !v6)
  {
    BOOL v7 = [v24 string];
    uint64_t v8 = [*(id *)(a1 + 32) selectedRange];
    uint64_t v10 = objc_msgSend(v7, "paragraphRangeForRange:", v8, v9);
    uint64_t v12 = v11;

    if (!v12)
    {
      id v6 = 0;
      goto LABEL_11;
    }
    id v6 = [v24 attribute:v5 atIndex:v10 effectiveRange:0];
  }
  if (v6 && [v6 alignment] != 1)
  {
    uint64_t v13 = [v6 baseWritingDirection];
    if (v13 == -1)
    {
      BOOL v14 = [v24 string];
      uint64_t v3 = [v14 _isNaturallyRTL];
    }
    else
    {
      uint64_t v3 = v13;
    }
  }
LABEL_11:
  if ([*(id *)(a1 + 32) isEditing])
  {
    unint64_t v15 = [*(id *)(a1 + 32) keyboardType];
    if (v15 <= 0xB) {
      char v16 = (0x6CFu >> v15) & 1;
    }
    else {
      char v16 = 1;
    }
  }
  else
  {
    char v16 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v16;
  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  char v18 = *(unsigned char *)(v17 + 24);
  if (v18)
  {
    char IsRightToLeftInputModeActive = UIKeyboardIsRightToLeftInputModeActive();
    if (v3 == 1) {
      char v18 = 1;
    }
    else {
      char v18 = IsRightToLeftInputModeActive;
    }
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v17 + 24) = v18;
  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
  char v21 = *(unsigned char *)(v20 + 24);
  if (v21)
  {
    uint64_t v22 = *(char **)(a1 + 48);
    char v21 = v22 == sel_makeTextWritingDirectionRightToLeft_ && v3 != 1
       || v22 == sel_makeTextWritingDirectionLeftToRight_ && v3
       || v22 == sel_makeTextWritingDirectionNatural_ && v3 != -1;
  }
  *(unsigned char *)(v20 + 24) = v21;
}

void __65__UITextInputController__shouldHandleResponderAction_withSender___block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
  id v1 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  [v0 formUnionWithCharacterSet:v1];

  __int16 v5 = -4;
  uint64_t v2 = [NSString stringWithCharacters:&v5 length:1];
  [v0 addCharactersInString:v2];
  uint64_t v3 = [v0 copy];
  BOOL v4 = (void *)qword_1EB264888;
  qword_1EB264888 = v3;
}

- (id)_selectedText
{
  uint64_t v3 = [(UITextInputController *)self _textStorage];
  BOOL v4 = [v3 string];
  uint64_t v5 = [(UITextInputController *)self selectedRange];
  BOOL v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);

  return v7;
}

- (id)_selectedAttributedText
{
  uint64_t v3 = [(UITextInputController *)self _textStorage];
  uint64_t v4 = [(UITextInputController *)self selectedRange];
  uint64_t v6 = objc_msgSend(v3, "attributedSubstringFromRange:", v4, v5);

  return v6;
}

- (void)selectAll
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__UITextInputController_selectAll__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  [(UITextInputController *)self _coordinateSelectionChange:v2];
}

void __34__UITextInputController_selectAll__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  uint64_t v2 = [WeakRetained documentRange];
  [*(id *)(a1 + 32) setSelectedTextRange:v2];
}

- (void)replace:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"UITextInputController.m" lineNumber:4413 description:0];
  }
  uint64_t v34 = 0;
  char v35 = &v34;
  uint64_t v36 = 0x3010000000;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  unint64_t v37 = &unk_186D7DBA7;
  uint64_t v38 = [(UITextInputController *)self _selectedRange];
  uint64_t v39 = v6;
  uint64_t v28 = 0;
  BOOL v29 = &v28;
  uint64_t v30 = 0x3032000000;
  char v31 = __Block_byref_object_copy__211;
  uint64_t v32 = __Block_byref_object_dispose__211;
  id v33 = 0;
  BOOL v7 = [(UITextInputController *)self _textStorage];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __33__UITextInputController_replace___block_invoke;
  v24[3] = &unk_1E530BA30;
  uint64_t v26 = &v34;
  id v8 = v5;
  id v25 = v8;
  uint64_t v27 = &v28;
  [v7 coordinateReading:v24];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    uint64_t v10 = [v9 replacementText];
  }
  else
  {
    uint64_t v10 = 0;
  }
  textCheckingController = self->_textCheckingController;
  uint64_t v12 = [(UITextInputController *)self selectedTextRange];
  [(UITextCheckingController *)textCheckingController willReplaceTextInRange:v12 withText:v10];

  uint64_t v13 = +[UIKeyboardImpl sharedInstance];
  [v13 replaceText:v8];

  if (v29[5])
  {
    if (v10)
    {
      uint64_t v14 = v35[4];
      uint64_t v15 = [v10 length];
      char v16 = [(UITextInputController *)self _textStorage];
      unint64_t v17 = [v16 length];

      if (v15 + v14 <= v17)
      {
        char v18 = [(UITextInputController *)self _textStorage];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __33__UITextInputController_replace___block_invoke_3;
        v20[3] = &unk_1E530BA58;
        uint64_t v22 = &v28;
        BOOL v23 = &v34;
        id v21 = v10;
        [v18 coordinateEditing:v20];
      }
    }
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
}

void __33__UITextInputController_replace___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
  if (v4 < [v3 length]
    && ([v3 attribute:@"_UITextInputDictationResultMetadata" atIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) effectiveRange:0], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = (void *)v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      id v8 = [v7 valueForKey:@"alternativesSelectedCount"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "intValue") + 1);
        [v7 setObject:v9 forKey:@"alternativesSelectedCount"];

        uint64_t v10 = [v3 attribute:*(void *)off_1E52D2288 atIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) effectiveRange:0];
        uint64_t v11 = [v10 alternativeStrings];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __33__UITextInputController_replace___block_invoke_2;
        v12[3] = &unk_1E52E57D8;
        id v13 = *(id *)(a1 + 32);
        id v14 = v7;
        [v11 enumerateObjectsUsingBlock:v12];

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
      }
    }
    else
    {
      id v7 = v6;
    }
  }
  else
  {
    id v7 = 0;
  }
}

void __33__UITextInputController_replace___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v7 replacementText];
  int v9 = [v8 isEqualToString:v12];

  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [v7 originalText];
    +[UIDictationUtilities logSpeechAlternativeReplacement:v10 originalText:v11 replacementText:v12 index:a3];

    *a4 = 1;
  }
}

void __33__UITextInputController_replace___block_invoke_3(void *a1, void *a2)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 32);
  id v5 = a2;
  objc_msgSend(v5, "addAttribute:value:range:", @"_UITextInputDictationResultMetadata", v3, v4, objc_msgSend(v2, "length"));
}

- (BOOL)_isSecureTextEntry
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [(UITextInputController *)self isSecureTextEntry];
}

- (int64_t)writingDirectionAtPosition:(id)a3
{
  p_textLayoutController = &self->_textLayoutController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  int64_t v6 = [WeakRetained baseWritingDirectionAtPosition:v4];

  return v6;
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  id v4 = [(UITextInputController *)self selectedTextRange];
  [(UITextInputController *)self setBaseWritingDirection:-1 forRange:v4];
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  id v4 = [(UITextInputController *)self selectedTextRange];
  [(UITextInputController *)self setBaseWritingDirection:1 forRange:v4];
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  id v4 = [(UITextInputController *)self selectedTextRange];
  [(UITextInputController *)self setBaseWritingDirection:0 forRange:v4];
}

- (void)removeTextStylingFromString:(id)a3
{
  id v5 = a3;
  if (![(UITextInputController *)self allowsEditingTextAttributes])
  {
    uint64_t v4 = [v5 length];
    objc_msgSend(v5, "removeAttribute:range:", *(void *)off_1E52D2040, 0, v4);
    objc_msgSend(v5, "removeAttribute:range:", *(void *)off_1E52D21B8, 0, v4);
    objc_msgSend(v5, "removeAttribute:range:", *(void *)off_1E52D2048, 0, v4);
    objc_msgSend(v5, "removeAttribute:range:", *(void *)off_1E52D1F58, 0, v4);
    objc_msgSend(v5, "removeAttribute:range:", *(void *)off_1E52D1F60, 0, v4);
    objc_msgSend(v5, "removeAttribute:range:", *(void *)off_1E52D2238, 0, v4);
  }
}

+ (BOOL)_shouldUseStandardTextScaling:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 usesStandardTextScaling];
  }
  else {
    char v4 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v3 traitCollection];
    BOOL v6 = [v5 userInterfaceIdiom] == 5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v4 | v6;
}

- (void)_copySelectionToClipboard
{
  id v3 = +[UIPasteboard generalPasteboard];
  [(UITextInputController *)self _copySelectionToClipboard:v3];
}

- (void)_copySelectionToClipboard:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextInputController *)self _firstTextView];
  uint64_t v6 = [v5 _dataOwnerForCopy];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__UITextInputController__copySelectionToClipboard___block_invoke;
  v8[3] = &unk_1E52D9F98;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  +[UIPasteboard _performAsDataOwner:v6 block:v8];
}

void __51__UITextInputController__copySelectionToClipboard___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 _selectedNSRange];
  uint64_t v5 = objc_msgSend(v2, "_itemProviderForCopyingRange:", v3, v4);
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    v8[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [*(id *)(a1 + 40) setItemProviders:v7];
  }
}

- (id)_itemProviderForCopyingRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  char v7 = dyld_program_sdk_at_least();
  if ([(UITextInputController *)self isSecureTextEntry])
  {
    id v8 = 0;
  }
  else
  {
    char v9 = v7 ^ 1;
    uint64_t v10 = [(UITextInputController *)self _firstTextView];
    BOOL v11 = +[UITextInputController _shouldUseStandardTextScaling:v10];

    BOOL v12 = !v11;
    id v13 = [(UITextInputController *)self _textStorage];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __54__UITextInputController__itemProviderForCopyingRange___block_invoke;
    id v21 = &unk_1E530BA80;
    NSUInteger v24 = location;
    NSUInteger v25 = length;
    char v27 = v9;
    uint64_t v22 = self;
    id v14 = v6;
    id v23 = v14;
    BOOL v26 = v12;
    [v13 coordinateReading:&v18];

    uint64_t v15 = objc_msgSend(v14, "registeredTypeIdentifiers", v18, v19, v20, v21, v22);
    if ([v15 count]) {
      char v16 = v14;
    }
    else {
      char v16 = 0;
    }
    id v8 = v16;
  }
  return v8;
}

void __54__UITextInputController__itemProviderForCopyingRange___block_invoke(uint64_t a1, void *a2)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  BOOL v26 = [v3 dictionary];
  uint64_t v5 = objc_msgSend(v4, "attributedSubstringFromRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));

  id v6 = (void *)[v5 mutableCopy];
  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) removeTextStylingFromString:v6];
  }
  uint64_t v7 = [v6 length];
  if (([*(id *)(a1 + 32) allowsEditingTextAttributes] & 1) != 0 || *(unsigned char *)(a1 + 72))
  {
    uint64_t v8 = *(void *)off_1E52D1FC8;
    uint64_t v37 = *(void *)off_1E52D1FC8;
    v38[0] = *(void *)off_1E52D2078;
    char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    uint64_t v10 = objc_msgSend(v6, "dataFromRange:documentAttributes:error:", 0, v7, v9, 0);

    if (v10)
    {
      BOOL v11 = *(void **)(a1 + 40);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __54__UITextInputController__itemProviderForCopyingRange___block_invoke_2;
      v31[3] = &unk_1E52DD3E0;
      id v32 = v10;
      [v11 registerDataRepresentationForTypeIdentifier:@"Apple Web Archive pasteboard type" visibility:0 loadHandler:v31];
    }
    uint64_t v12 = *(void *)off_1E52D2208;
    uint64_t v13 = *(void *)off_1E52D2348;
    v35[0] = v8;
    v35[1] = v13;
    v36[0] = v12;
    id v14 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
    v36[1] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    char v16 = objc_msgSend(v6, "dataFromRange:documentAttributes:error:", 0, v7, v15, 0);

    if (v16)
    {
      unint64_t v17 = *(void **)(a1 + 40);
      uint64_t v18 = [(id)*MEMORY[0x1E4F443C0] identifier];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __54__UITextInputController__itemProviderForCopyingRange___block_invoke_3;
      v29[3] = &unk_1E52DD3E0;
      id v19 = v16;
      id v30 = v19;
      [v17 registerDataRepresentationForTypeIdentifier:v18 visibility:0 loadHandler:v29];
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
    uint64_t v8 = *(void *)off_1E52D1FC8;
  }
  v34[0] = *(void *)off_1E52D21C0;
  uint64_t v20 = *(void *)off_1E52D1F88;
  v33[0] = v8;
  v33[1] = v20;
  id v21 = [NSNumber numberWithInteger:4];
  v34[1] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  id v23 = objc_msgSend(v6, "dataFromRange:documentAttributes:error:", 0, v7, v22, 0);

  if (v23)
  {
    NSUInteger v24 = *(void **)(a1 + 40);
    NSUInteger v25 = [(id)*MEMORY[0x1E4F44510] identifier];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __54__UITextInputController__itemProviderForCopyingRange___block_invoke_4;
    v27[3] = &unk_1E52DD3E0;
    id v28 = v23;
    [v24 registerDataRepresentationForTypeIdentifier:v25 visibility:0 loadHandler:v27];
  }
}

uint64_t __54__UITextInputController__itemProviderForCopyingRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t __54__UITextInputController__itemProviderForCopyingRange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t __54__UITextInputController__itemProviderForCopyingRange___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (void)cut:(id)a3
{
  [(UITextInputController *)self _copySelectionToClipboard];
  [(UITextInputController *)self changingContextWithTrigger:@"cut"];
  [(UITextInputController *)self _updateRangeForSmartDelete];
  id v4 = _UIKitBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"CUT_FOR_UNDO" value:@"Cut" table:@"Localizable"];
  uint64_t v6 = [(UITextInputController *)self selectedRange];
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 3, v5, v6, v7, &stru_1ED0E84C0);

  [(UITextInputController *)self _insertText:&stru_1ED0E84C0 fromKeyboard:0];
}

- (void)paste:(id)a3
{
}

- (void)pasteAndMatchStyle:(id)a3
{
}

- (void)_pasteAndMatchStyle:(BOOL)a3
{
  [(UITextInputController *)self changingContextWithTrigger:@"paste"];
  uint64_t v5 = [(UITextInputController *)self _firstTextView];
  uint64_t v6 = [v5 _dataOwnerForPaste];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__UITextInputController__pasteAndMatchStyle___block_invoke;
  v7[3] = &unk_1E52D9FC0;
  v7[4] = self;
  BOOL v8 = a3;
  +[UIPasteboard _performAsDataOwner:v6 block:v7];
}

void __45__UITextInputController__pasteAndMatchStyle___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[UIPasteboard generalPasteboard];
  [v2 _pasteFromPasteboard:v3 andMatchStyle:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)_pasteFromPasteboard:(id)a3 andMatchStyle:(BOOL)a4
{
  BOOL v4 = a4;
  v42[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 itemProviders];

  if (!v7)
  {
    if (![(UITextInputController *)self allowsEditingTextAttributes])
    {
      id v21 = 0;
      uint64_t v13 = 0;
      goto LABEL_17;
    }
    uint64_t v10 = [(UITextInputController *)self _firstTextView];
    BOOL v11 = +[UITextInputController _shouldUseStandardTextScaling:v10];

    uint64_t v12 = [(id)*MEMORY[0x1E4F443C0] identifier];
    uint64_t v13 = [v6 dataForPasteboardType:v12];

    id v14 = *(id *)off_1E52D2208;
    id v15 = v14;
    if (v13)
    {
      if (v11)
      {
        uint64_t v16 = *(void *)off_1E52D1FC0;
        v41[0] = @"Timeout";
        v41[1] = v16;
        v42[0] = &unk_1ED3F2828;
        v42[1] = v14;
        v41[2] = *(void *)off_1E52D2278;
        v42[2] = &unk_1ED3F6E88;
        unint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v18 = v42;
        id v19 = v41;
        uint64_t v20 = 3;
LABEL_12:
        NSUInteger v25 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v20];
        id v38 = 0;
        BOOL v26 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithData:v13 options:v25 documentAttributes:0 error:&v38];
        id v21 = v38;
        if (v4)
        {
          id v27 = objc_alloc(MEMORY[0x1E4F28B18]);
          id v28 = [v26 string];
          uint64_t v29 = [v27 initWithString:v28];

          BOOL v26 = (void *)v29;
        }

        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v13 = [v6 valueForPasteboardType:@"Apple Web Archive pasteboard type"];
      id v22 = *(id *)off_1E52D2078;

      if (v13)
      {
        id v15 = v22;
      }
      else
      {
        id v23 = [(id)*MEMORY[0x1E4F444A0] identifier];
        uint64_t v13 = [v6 valueForPasteboardType:v23];

        id v15 = *(id *)off_1E52D2210;
        if (!v13)
        {
          uint64_t v13 = [v6 valueForPasteboardType:*(void *)off_1E52D1FD0];
          if (v13 && (uint64_t v35 = [objc_alloc((Class)off_1E52D2BC8) initWithData:v13]) != 0)
          {
            uint64_t v36 = (void *)v35;
            BOOL v26 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v35];
          }
          else
          {
            uint64_t v36 = [v6 image];
            if (v36)
            {
              id v37 = objc_alloc_init((Class)off_1E52D2EB0);
              [v37 setImage:v36];
            }
            BOOL v26 = 0;
          }

          id v21 = 0;
LABEL_15:

          if (v26)
          {
            uint64_t v30 = 1;
            goto LABEL_19;
          }
LABEL_17:
          char v31 = [v6 string];

          if (!v31)
          {
            BOOL v9 = 0;
            goto LABEL_21;
          }
          id v32 = objc_alloc(MEMORY[0x1E4F28B18]);
          id v33 = [v6 string];
          BOOL v26 = (void *)[v32 initWithString:v33];

          uint64_t v30 = 0;
LABEL_19:
          [(UITextInputController *)self _pasteAttributedString:v26 pasteAsRichText:v30];

          BOOL v9 = 1;
LABEL_21:

          goto LABEL_22;
        }
      }
    }
    uint64_t v24 = *(void *)off_1E52D1FC0;
    v39[0] = @"Timeout";
    v39[1] = v24;
    v40[0] = &unk_1ED3F2828;
    v40[1] = v15;
    unint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v18 = v40;
    id v19 = v39;
    uint64_t v20 = 2;
    goto LABEL_12;
  }
  BOOL v8 = [v6 itemProviders];
  [(UITextInputController *)self pasteItemProviders:v8 matchesStyle:v4];

  BOOL v9 = 1;
LABEL_22:

  return v9;
}

- (void)pasteItemProviders:(id)a3 matchesStyle:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  id v6 = [(UITextInputController *)self _pasteController];
  uint64_t v7 = [(UITextInputController *)self selectedTextRange];
  BOOL v8 = [v7 start];

  if (!v8)
  {
    BOOL v8 = [(UITextInputController *)self beginningOfDocument];
  }
  BOOL v9 = [(UITextInputController *)self textRangeFromPosition:v8 toPosition:v8];
  id v10 = (id)[v6 beginPastingItems:v11 toRange:v9 delegate:0 matchesTextStyles:v4];
}

- (void)pasteItemProviders:(id)a3
{
}

- (id)_attributedStringForInsertionOfAttributedString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if ((*(unsigned char *)&self->_tiFlags & 0x40) != 0)
  {
    uint64_t v6 = [v4 mutableCopy];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained textInput:self prepareAttributedTextForInsertion:v6];

    uint64_t v5 = (void *)v6;
  }
  BOOL v8 = +[UIKeyboardImpl activeInstance];
  int v9 = [v8 smartInsertDeleteIsEnabled];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4FAE450] traitsForUITextInputTraits:self->_textInputTraits];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4FAE3F8]) initWithTextInputTraits:v10];
    uint64_t v12 = [MEMORY[0x1E4FAE2A8] documentStateOfDocumentWithParagraph:self];
    uint64_t v13 = [v5 string];
    id v28 = 0;
    id v29 = 0;
    [v11 smartInsertForDocumentState:v12 stringToInsert:v13 outBeforeString:&v29 outAfterString:&v28];
    id v14 = v29;
    id v15 = v28;

    if (*((unsigned char *)&self->_tiFlags + 1))
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      int v17 = [v16 isSingleLineDocument];

      if (v17)
      {
        if ([v14 length])
        {
          uint64_t v18 = [v14 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1ED0E84C0];

          id v14 = (id)v18;
        }
        if ([v15 length])
        {
          uint64_t v19 = [v15 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1ED0E84C0];

          id v15 = (id)v19;
        }
      }
    }
    if ([v14 length] || objc_msgSend(v15, "length"))
    {
      uint64_t v20 = (void *)[v5 mutableCopy];
      if ([v14 length])
      {
        if ([v20 length])
        {
          id v21 = [v20 attributesAtIndex:0 effectiveRange:0];
          id v22 = (void *)[v21 mutableCopy];

          [v22 removeObjectForKey:*(void *)off_1E52D1F50];
          [v22 removeObjectForKey:*(void *)off_1E52D1F40];
        }
        else
        {
          id v22 = 0;
        }
        id v23 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v14 attributes:v22];
        [v20 insertAttributedString:v23 atIndex:0];
      }
      if ([v15 length])
      {
        if ([v20 length])
        {
          uint64_t v24 = objc_msgSend(v20, "attributesAtIndex:effectiveRange:", objc_msgSend(v20, "length") - 1, 0);
          NSUInteger v25 = (void *)[v24 mutableCopy];

          [v25 removeObjectForKey:*(void *)off_1E52D1F50];
          [v25 removeObjectForKey:*(void *)off_1E52D1F40];
        }
        else
        {
          NSUInteger v25 = 0;
        }
        BOOL v26 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v15 attributes:v25];
        [v20 appendAttributedString:v26];
      }
      uint64_t v5 = v20;
    }
  }
  return v5;
}

- (void)_pasteAttributedString:(id)a3 pasteAsRichText:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(UITextInputController *)self _attributedStringForInsertionOfAttributedString:a3];
  [(UITextInputController *)self _pasteRawAttributedString:v6 asRichText:v4];
}

- (void)_pasteAttributedString:(id)a3 toRange:(id)a4 completion:(id)a5
{
  id v8 = a4;
  int v9 = (void (**)(id, void *, id))a5;
  id v18 = [(UITextInputController *)self _attributedStringForInsertionOfAttributedString:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v11 = [WeakRetained keyboardSceneDelegate];
  id v12 = objc_loadWeakRetained((id *)&self->_firstTextView);
  [v11 _beginPinningInputViewsOnBehalfOfResponder:v12];

  [(UITextInputController *)self _pasteRawAttributedString:v18 asRichText:1];
  [v11 _stopPinningInputViewsOnBehalfOfResponder:WeakRetained];
  if (v9)
  {
    uint64_t v13 = [v8 start];
    id v14 = [v8 start];
    id v15 = -[UITextInputController positionFromPosition:offset:](self, "positionFromPosition:offset:", v14, [v18 length]);
    if (v15)
    {
      id v16 = [(UITextInputController *)self textRangeFromPosition:v13 toPosition:v15];
    }
    else
    {
      int v17 = [v8 end];
      id v16 = [(UITextInputController *)self textRangeFromPosition:v13 toPosition:v17];
    }
    v9[2](v9, v16, v18);
  }
}

- (void)_pasteRawAttributedString:(id)a3 asRichText:(BOOL)a4
{
  BOOL v4 = a4;
  id v19 = a3;
  id v6 = _UIKitBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"PASTE_FOR_UNDO" value:@"Paste" table:@"Localizable"];
  uint64_t v8 = [(UITextInputController *)self selectedRange];
  uint64_t v10 = v9;
  id v11 = [v19 string];
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 3, v7, v8, v10, v11);

  uint64_t v12 = [(UITextInputController *)self _selectedRange];
  uint64_t v14 = v13;
  id v15 = [v19 string];
  LODWORD(v12) = -[UITextInputController _delegateShouldChangeTextInRange:replacementText:](self, "_delegateShouldChangeTextInRange:replacementText:", v12, v14, v15);

  if (v12)
  {
    uint64_t v16 = [(UITextInputController *)self _selectedRange];
    -[UITextInputController _rangeAfterCancelDictationIfNecessaryForChangeInRange:](self, "_rangeAfterCancelDictationIfNecessaryForChangeInRange:", v16, v17);
    if (v4)
    {
      [(UITextInputController *)self _insertAttributedText:v19 fromKeyboard:0];
    }
    else
    {
      id v18 = [v19 string];
      [(UITextInputController *)self _insertText:v18 fromKeyboard:0];
    }
  }
}

- (void)_adjustSizeByIncreasing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UITextInputController *)self allowsEditingTextAttributes])
  {
    uint64_t v5 = _UIKitBundle();
    id v6 = v5;
    if (v3) {
      uint64_t v7 = @"Bigger";
    }
    else {
      uint64_t v7 = @"Smaller";
    }
    uint64_t v8 = [v5 localizedStringForKey:v7 value:v7 table:@"Localizable"];

    uint64_t v9 = [(UITextInputController *)self selectedRange];
    -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 1, v8, v9, v10, 0);
    [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:0];
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x3032000000;
    id v37 = __Block_byref_object_copy__211;
    id v38 = __Block_byref_object_dispose__211;
    id v39 = 0;
    id v11 = [(UITextInputController *)self _textStorage];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    void v33[2] = __49__UITextInputController__adjustSizeByIncreasing___block_invoke;
    v33[3] = &unk_1E530B830;
    v33[4] = self;
    v33[5] = &v34;
    [v11 coordinateReading:v33];

    uint64_t v12 = [(id)v35[5] fontDescriptor];
    [v12 pointSize];
    double v14 = 0.862068966;
    if (v3) {
      double v14 = 1.16;
    }
    id v15 = objc_msgSend(off_1E52D39B8, "fontWithDescriptor:size:", v12, fmax(v14 * v13, 7.0));
    [off_1E52D39B8 defaultFontSize];
    uint64_t v16 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
    uint64_t v17 = [(UITextInputController *)self _selectedRange];
    uint64_t v19 = v18;
    uint64_t v20 = [(UITextInputController *)self _textStorage];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    NSUInteger v25 = __49__UITextInputController__adjustSizeByIncreasing___block_invoke_2;
    BOOL v26 = &unk_1E530BAD0;
    id v27 = self;
    id v21 = v15;
    id v28 = v21;
    uint64_t v30 = v17;
    uint64_t v31 = v19;
    id v22 = v16;
    id v29 = v22;
    BOOL v32 = v3;
    [v20 coordinateEditing:&v23];

    -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 0, v23, v24, v25, v26, v27);
    _Block_object_dispose(&v34, 8);
  }
}

void __49__UITextInputController__adjustSizeByIncreasing___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  unint64_t v3 = [*(id *)(a1 + 32) _selectedRange];
  if (v4 && v3 < [v8 length])
  {
    uint64_t v5 = objc_msgSend(v8, "attribute:atIndex:effectiveRange:", *(void *)off_1E52D2040, objc_msgSend(*(id *)(a1 + 32), "_selectedRange"), 0);
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) _fallbackFont];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __49__UITextInputController__adjustSizeByIncreasing___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)off_1E52D2040;
  [*(id *)(a1 + 32) _addToTypingAttributes:*(void *)off_1E52D2040 value:*(void *)(a1 + 40)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__UITextInputController__adjustSizeByIncreasing___block_invoke_3;
  v9[3] = &unk_1E530BAA8;
  id v5 = *(id *)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 72);
  id v10 = v5;
  id v11 = v3;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v8 = v3;
  objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v4, v7, v6, 0x100000, v9);
}

void __49__UITextInputController__adjustSizeByIncreasing___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (!v7) {
    id v7 = *(id *)(a1 + 32);
  }
  id v11 = v7;
  id v8 = [v7 fontDescriptor];
  [v8 pointSize];
  id v10 = objc_msgSend(off_1E52D39B8, "fontWithDescriptor:size:", v8, fmax(v9 * dbl_186B9D910[*(unsigned char *)(a1 + 48) == 0], 7.0));
  if (v10) {
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(void *)off_1E52D2040, v10, a3, a4);
  }
}

- (void)increaseSize:(id)a3
{
}

- (void)decreaseSize:(id)a3
{
}

- (void)updateTextAttributesWithConversionHandler:(id)a3
{
  id v4 = a3;
  if ([(UITextInputController *)self allowsEditingTextAttributes])
  {
    [(UITextInputController *)self _selectedRange];
    if (v5)
    {
      uint64_t v6 = _UIKitBundle();
      id v7 = [v6 localizedStringForKey:@"Set Font" value:@"Set Font" table:@"Localizable"];
      uint64_t v8 = [(UITextInputController *)self selectedRange];
      -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 1, v7, v8, v9, 0);

      [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:0];
      uint64_t v10 = [(UITextInputController *)self _selectedRange];
      uint64_t v12 = v11;
      double v13 = [(UITextInputController *)self _fallbackFont];
      double v14 = [(UITextInputController *)self _textStorage];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __67__UITextInputController_updateTextAttributesWithConversionHandler___block_invoke;
      uint64_t v19 = &unk_1E530BB20;
      uint64_t v22 = v10;
      uint64_t v23 = v12;
      id v20 = v13;
      id v21 = v4;
      id v15 = v13;
      [v14 coordinateEditing:&v16];

      -[UITextInputController _sendDelegateChangeNotificationsForText:selection:](self, "_sendDelegateChangeNotificationsForText:selection:", 1, 0, v16, v17, v18, v19);
    }
  }
}

void __67__UITextInputController_updateTextAttributesWithConversionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __67__UITextInputController_updateTextAttributesWithConversionHandler___block_invoke_2;
  v8[3] = &unk_1E530BAF8;
  id v9 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v3;
  objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", v6, v5, 0x100000, v8);
}

void __67__UITextInputController_updateTextAttributesWithConversionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  uint64_t v7 = *(void *)off_1E52D2040;
  uint64_t v8 = [v11 valueForKey:*(void *)off_1E52D2040];

  id v9 = v11;
  if (!v8)
  {
    id v9 = (void *)[v11 mutableCopy];
    [v9 setObject:*(void *)(a1 + 32) forKey:v7];
  }
  id v10 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v10, a3, a4);
  objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *(void *)off_1E52D21A0, a3, a4);
}

- (void)select:(id)a3
{
  id v3 = [(UITextInputController *)self interactionAssistant];
  [v3 selectWord];
}

- (void)selectAll:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextInputController *)self interactionAssistant];
  [v5 selectAll:v4];
}

- (void)_promptForReplace:(id)a3
{
  id v3 = [(UITextInputController *)self interactionAssistant];
  [v3 scheduleReplacements];
}

- (void)_transliterateChinese:(id)a3
{
  id v3 = [(UITextInputController *)self interactionAssistant];
  [v3 scheduleChineseTransliteration];
}

- (void)_removeShareController
{
}

- (void)_share:(id)a3
{
  id v4 = +[UIDevice currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(UITextInputController *)self _removeShareController];
  }
  uint64_t v6 = [(UITextInputController *)self _firstTextView];
  uint64_t v7 = +[_UITextServiceSessionContext sessionContextForType:8 withTextInput:v6];
  uint64_t v8 = [v6 _showServiceForType:8 withContext:v7];
  shareSession = self->_shareSession;
  self->_shareSession = v8;

  id v10 = self->_shareSession;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__UITextInputController__share___block_invoke;
  v11[3] = &unk_1E530A908;
  void v11[4] = self;
  [(_UITextServiceSession *)v10 setDismissedHandler:v11];
}

void __32__UITextInputController__share___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = 0;
}

- (void)_removeShortcutController
{
}

- (void)_define:(id)a3
{
  id v5 = a3;
  if (self->_lookupSession)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UITextInputController.m" lineNumber:5053 description:@"Shouldn't have a lookup session"];
  }
  uint64_t v6 = [(UITextInputController *)self _firstTextView];
  uint64_t v7 = +[_UITextServiceSessionContext sessionContextForType:16 withTextInput:v6];
  uint64_t v8 = [v6 _showServiceForType:16 withContext:v7];
  lookupSession = self->_lookupSession;
  self->_lookupSession = v8;

  objc_initWeak(&location, self);
  id v10 = self->_lookupSession;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33__UITextInputController__define___block_invoke;
  v12[3] = &unk_1E530BB48;
  objc_copyWeak(&v13, &location);
  [(_UITextServiceSession *)v10 setDismissedHandler:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __33__UITextInputController__define___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)WeakRetained[9];
    WeakRetained[9] = 0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

- (void)_translate:(id)a3
{
  id v5 = a3;
  if (self->_translateSession)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UITextInputController.m" lineNumber:5069 description:@"Shouldn't have translate session"];
  }
  uint64_t v6 = [(UITextInputController *)self _firstTextView];
  uint64_t v7 = +[_UITextServiceSessionContext sessionContextForType:32 withTextInput:v6];
  uint64_t v8 = [v6 _showServiceForType:32 withContext:v7];
  translateSession = self->_translateSession;
  self->_translateSession = v8;

  objc_initWeak(&location, self);
  id v10 = self->_translateSession;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __36__UITextInputController__translate___block_invoke;
  v12[3] = &unk_1E530BB48;
  objc_copyWeak(&v13, &location);
  [(_UITextServiceSession *)v10 setDismissedHandler:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __36__UITextInputController__translate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)WeakRetained[10];
    WeakRetained[10] = 0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

- (BOOL)_isDisplayingTextService
{
  if ([(UITextInputController *)self _isDisplayingShortcutViewController]
    || [(UITextInputController *)self _isDisplayingReferenceLibraryViewController]|| [(UITextInputController *)self _isDisplayingLookupViewController])
  {
    return 1;
  }
  return [(UITextInputController *)self _isDisplayingShareViewController];
}

- (BOOL)_isDisplayingShortcutViewController
{
  return [(_UITextServiceSession *)self->_learnSession isDisplaying];
}

- (BOOL)_isDisplayingReferenceLibraryViewController
{
  return [(_UITextServiceSession *)self->_lookupSession isDisplaying];
}

- (BOOL)_isDisplayingLookupViewController
{
  return [(_UITextServiceSession *)self->_lookupSession isDisplaying];
}

- (BOOL)_isDisplayingShareViewController
{
  return [(_UITextServiceSession *)self->_shareSession isDisplaying];
}

- (void)_clearSelectionUI
{
  id v3 = [(UITextInputController *)self interactionAssistant];
  id v4 = [v3 activeSelection];
  [v4 clearSelection];

  id v5 = [(UITextInputController *)self interactionAssistant];
  [v5 updateDisplayedSelection];
}

- (void)_addShortcut:(id)a3
{
  id v4 = a3;
  id v5 = +[UIDevice currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(UITextInputController *)self _removeShortcutController];
  }
  uint64_t v7 = [(UITextInputController *)self _firstTextView];
  uint64_t v8 = +[_UITextServiceSessionContext sessionContextForType:4 withTextInput:v7];
  id v9 = [v7 _showServiceForType:4 withContext:v8];
  learnSession = self->_learnSession;
  self->_learnSession = v9;

  [v7 resignFirstResponder];
  objc_initWeak(&location, self);
  id v11 = self->_learnSession;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__UITextInputController__addShortcut___block_invoke;
  v12[3] = &unk_1E530BB48;
  objc_copyWeak(&v13, &location);
  [(_UITextServiceSession *)v11 setDismissedHandler:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __38__UITextInputController__addShortcut___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)WeakRetained[7];
    WeakRetained[7] = 0;
    id v5 = WeakRetained;

    id v3 = +[UIDevice currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    id WeakRetained = v5;
    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      [v5 _clearSelectionUI];
      id WeakRetained = v5;
    }
  }
}

- (id)_fallbackFont
{
  uint64_t v2 = [(UITextInputController *)self typingAttributes];
  id v3 = [v2 objectForKey:*(void *)off_1E52D2040];

  if (!v3)
  {
    [off_1E52D39B8 defaultFontSize];
    id v3 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
  }
  return v3;
}

- (void)_toggleFontTrait:(unsigned int)a3
{
  id v5 = [(UITextInputController *)self _textStorage];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__UITextInputController__toggleFontTrait___block_invoke;
  v6[3] = &unk_1E530BB98;
  void v6[4] = self;
  unsigned int v7 = a3;
  [v5 coordinateEditing:v6];
}

void __42__UITextInputController__toggleFontTrait___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _fallbackFont];
  id v5 = [v4 fontDescriptor];
  int v6 = [v5 symbolicTraits];

  unsigned int v7 = *(_DWORD *)(a1 + 40);
  if ((v7 & v6) != 0) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  [*(id *)(a1 + 32) _selectedRange];
  uint64_t v9 = *(void *)off_1E52D2040;
  if (v10)
  {
    uint64_t v11 = [*(id *)(a1 + 32) _selectedRange];
    uint64_t v13 = v12;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __42__UITextInputController__toggleFontTrait___block_invoke_2;
    v18[3] = &unk_1E530BB70;
    id v19 = v4;
    int v14 = *(_DWORD *)(a1 + 40);
    int v21 = v8;
    int v22 = v14;
    id v20 = v3;
    objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", v9, v11, v13, 0x100000, v18);
  }
  id v15 = [v4 fontDescriptor];
  uint64_t v16 = [v15 fontDescriptorWithSymbolicTraits:v8 mask:*(unsigned int *)(a1 + 40)];

  [v4 pointSize];
  uint64_t v17 = objc_msgSend(off_1E52D39B8, "fontWithDescriptor:size:", v16);
  [*(id *)(a1 + 32) _addToTypingAttributes:v9 value:v17];
}

void __42__UITextInputController__toggleFontTrait___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = a2;
  if (!a2) {
    uint64_t v8 = *(void **)(a1 + 32);
  }
  id v9 = v8;
  id v13 = a2;
  uint64_t v10 = [v9 fontDescriptor];
  uint64_t v11 = [v10 fontDescriptorWithSymbolicTraits:*(unsigned int *)(a1 + 48) mask:*(unsigned int *)(a1 + 52)];

  if (v11)
  {
    [*(id *)(a1 + 32) pointSize];
    uint64_t v12 = objc_msgSend(off_1E52D39B8, "fontWithDescriptor:size:", v11);
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *(void *)off_1E52D2040, v12, a3, a4);
    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *(void *)off_1E52D21A0, a3, a4);
  }
}

- (void)toggleBoldface:(id)a3
{
  uint64_t v4 = _UIKitBundle();
  id v5 = [v4 localizedStringForKey:@"BOLD_FOR_UNDO" value:@"Bold" table:@"Localizable"];
  uint64_t v6 = [(UITextInputController *)self selectedRange];
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 1, v5, v6, v7, 0);

  [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:0];
  [(UITextInputController *)self _toggleFontTrait:2];
  [(UITextInputController *)self _sendDelegateChangeNotificationsForText:1 selection:0];
}

- (void)toggleItalics:(id)a3
{
  uint64_t v4 = _UIKitBundle();
  id v5 = [v4 localizedStringForKey:@"ITALIC_FOR_UNDO" value:@"Italic" table:@"Localizable"];
  uint64_t v6 = [(UITextInputController *)self selectedRange];
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 1, v5, v6, v7, 0);

  [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:0];
  [(UITextInputController *)self _toggleFontTrait:1];
  [(UITextInputController *)self _sendDelegateChangeNotificationsForText:1 selection:0];
}

- (void)toggleUnderline:(id)a3
{
  uint64_t v4 = _UIKitBundle();
  id v5 = [v4 localizedStringForKey:@"UNDERLINE_FOR_UNDO" value:@"Underline" table:@"Localizable"];
  uint64_t v6 = [(UITextInputController *)self selectedRange];
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 1, v5, v6, v7, 0);

  [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:0];
  uint64_t v8 = [(UITextInputController *)self _textStorage];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__UITextInputController_toggleUnderline___block_invoke;
  v9[3] = &unk_1E530B408;
  void v9[4] = self;
  [v8 coordinateEditing:v9];

  [(UITextInputController *)self _sendDelegateChangeNotificationsForText:1 selection:0];
}

void __41__UITextInputController_toggleUnderline___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) typingAttributes];
  uint64_t v4 = *(void *)off_1E52D23E8;
  uint64_t v5 = [v3 objectForKey:*(void *)off_1E52D23E8];

  if (v5) {
    uint64_t v6 = (void *)v5;
  }
  else {
    uint64_t v6 = &unk_1ED3F6EA0;
  }
  if ([v6 intValue]) {
    uint64_t v7 = &unk_1ED3F6EA0;
  }
  else {
    uint64_t v7 = &unk_1ED3F6EB8;
  }
  [*(id *)(a1 + 32) _selectedRange];
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) _selectedRange];
    objc_msgSend(v11, "addAttribute:value:range:", v4, v7, v9, v10);
  }
  [*(id *)(a1 + 32) _addToTypingAttributes:v4 value:v7];
}

- (void)_changeTextAlignment:(int64_t)a3 undoString:(id)a4
{
  uint64_t v6 = [(UITextInputController *)self _textStorage];
  uint64_t v7 = [v6 string];
  uint64_t v8 = [(UITextInputController *)self _selectedRange];
  uint64_t v10 = objc_msgSend(v7, "paragraphRangeForRange:", v8, v9);
  uint64_t v12 = v11;

  id v13 = _UIKitBundle();
  int v14 = [v13 localizedStringForKey:@"Align Left" value:@"Align Left" table:@"Localizable"];
  -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](self, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 1, v14, v10, v12, 0);

  [(UITextInputController *)self _sendDelegateWillChangeNotificationsForText:1 selection:0];
  id v15 = [(UITextInputController *)self _textStorage];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__UITextInputController__changeTextAlignment_undoString___block_invoke;
  v16[3] = &unk_1E530BBC0;
  v16[4] = self;
  v16[5] = v10;
  v16[6] = v12;
  v16[7] = a3;
  [v15 coordinateEditing:v16];

  [(UITextInputController *)self _sendDelegateChangeNotificationsForText:1 selection:0];
}

void __57__UITextInputController__changeTextAlignment_undoString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) typingAttributes];
  uint64_t v5 = *(void *)off_1E52D21B8;
  uint64_t v6 = [v4 objectForKey:*(void *)off_1E52D21B8];

  if (!v6)
  {
    uint64_t v6 = [off_1E52D2DD0 defaultParagraphStyle];
  }
  if (*(void *)(a1 + 48))
  {
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __57__UITextInputController__changeTextAlignment_undoString___block_invoke_2;
    uint64_t v11 = &unk_1E530B858;
    uint64_t v13 = *(void *)(a1 + 56);
    id v12 = v3;
    objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v5, *(void *)(a1 + 40), *(void *)(a1 + 48), 0x100000, &v8);
  }
  if (objc_msgSend(v6, "alignment", v8, v9, v10, v11) != *(void *)(a1 + 56))
  {
    uint64_t v7 = (void *)[v6 mutableCopy];
    [v7 setAlignment:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) _addToTypingAttributes:v5 value:v7];
  }
}

void __57__UITextInputController__changeTextAlignment_undoString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v9 = v7;
  if (!v7)
  {
    id v7 = [off_1E52D2DD0 defaultParagraphStyle];
  }
  if ([v7 alignment] != *(void *)(a1 + 40))
  {
    uint64_t v8 = (void *)[v7 mutableCopy];
    [v8 setAlignment:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *(void *)off_1E52D21B8, v8, a3, a4);
  }
}

- (void)alignLeft:(id)a3
{
  _UIKitBundle();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v5 localizedStringForKey:@"Align Left" value:@"Align Left" table:@"Localizable"];
  [(UITextInputController *)self _changeTextAlignment:0 undoString:v4];
}

- (void)alignCenter:(id)a3
{
  _UIKitBundle();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v5 localizedStringForKey:@"Center" value:@"Center" table:@"Localizable"];
  [(UITextInputController *)self _changeTextAlignment:1 undoString:v4];
}

- (void)alignJustified:(id)a3
{
  _UIKitBundle();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v5 localizedStringForKey:@"Justify" value:@"Justify" table:@"Localizable"];
  [(UITextInputController *)self _changeTextAlignment:3 undoString:v4];
}

- (void)alignRight:(id)a3
{
  _UIKitBundle();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v5 localizedStringForKey:@"Align Right" value:@"Align Right" table:@"Localizable"];
  [(UITextInputController *)self _changeTextAlignment:2 undoString:v4];
}

- (void)_validateCommand:(id)a3 forFont:(id)a4 traits:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v12 = a3;
  id v7 = a4;
  int v8 = [v7 traits];
  LODWORD(a4) = v8 & v5;
  [v12 setState:(v8 & v5) == v5];
  if (a4 != v5)
  {
    id v9 = [v7 fontDescriptor];
    uint64_t v10 = [v9 fontDescriptorWithSymbolicTraits:v5 mask:v5];

    if (v10)
    {
      [v7 pointSize];
      uint64_t v11 = objc_msgSend(off_1E52D39B8, "fontWithDescriptor:size:", v10);

      if (v11 && (v5 & ~[v11 traits]) == 0) {
        goto LABEL_8;
      }
    }
    else
    {

      uint64_t v11 = 0;
    }
    objc_msgSend(v12, "setAttributes:", objc_msgSend(v12, "attributes") | 1);
LABEL_8:

    id v7 = v11;
  }
}

- (void)validateCommand:(id)a3
{
  id v37 = a3;
  uint64_t v4 = (char *)[v37 action];
  BOOL v5 = [(UITextInputController *)self _canHandleResponderAction:v4];
  uint64_t v6 = v37;
  if (!v5) {
    goto LABEL_62;
  }
  BOOL v8 = v4 == sel_makeTextWritingDirectionNatural_
    || v4 == sel_makeTextWritingDirectionLeftToRight_
    || v4 == sel_makeTextWritingDirectionRightToLeft_;
  if ([(UITextInputController *)self _shouldHandleResponderAction:v4 withSender:v37])
  {
    id v9 = [(UITextInputController *)self typingAttributes];
    unint64_t v10 = [(UITextInputController *)self selectedRange];
    uint64_t v11 = [(UITextInputController *)self _textStorage];
    unint64_t v12 = [v11 length];

    uint64_t v13 = *(void *)off_1E52D21B8;
    uint64_t v14 = [v9 objectForKeyedSubscript:*(void *)off_1E52D21B8];
    id v15 = (void *)v14;
    BOOL v16 = 1;
    if (v4 != sel_alignLeft_ && v4 != sel_alignCenter_ && v4 != sel_alignJustified_) {
      BOOL v16 = v4 == sel_alignRight_;
    }
    int v17 = v16 || v8;
    if (v9 || v10 >= v12)
    {
      if (v17)
      {
        if (!v14)
        {
LABEL_20:
          id v15 = [off_1E52D2DD0 defaultParagraphStyle];
        }
LABEL_21:
        uint64_t v24 = [v15 alignment];
        uint64_t v25 = [v15 baseWritingDirection];
        if (v16)
        {
          if (v24 == 4)
          {
            if (v25 == -1) {
              uint64_t v25 = [off_1E52D2DD0 defaultWritingDirectionForLanguage:0];
            }
            uint64_t v24 = 2 * (v25 == 1);
          }
          uint64_t v26 = 3;
          if (v4 != sel_alignJustified_) {
            uint64_t v26 = 0;
          }
          uint64_t v27 = 2;
          if (v4 != sel_alignRight_) {
            uint64_t v27 = v26;
          }
          if (v4 == sel_alignCenter_) {
            uint64_t v27 = 1;
          }
          BOOL v28 = v27 == v24;
        }
        else
        {
          uint64_t v31 = 1;
          if (v4 != sel_makeTextWritingDirectionRightToLeft_) {
            uint64_t v31 = -1;
          }
          if (v4 == sel_makeTextWritingDirectionLeftToRight_) {
            uint64_t v31 = 0;
          }
          BOOL v28 = v31 == v25;
        }
        uint64_t v32 = v28;
        [v37 setState:v32];
        goto LABEL_59;
      }
    }
    else
    {
      uint64_t v18 = [(UITextInputController *)self _textStorage];
      id v19 = v18;
      if (v17)
      {
        id v20 = [v18 string];
        uint64_t v21 = objc_msgSend(v20, "paragraphRangeForRange:", v10, 1);

        int v22 = [(UITextInputController *)self _textStorage];
        uint64_t v23 = [v22 attribute:v13 atIndex:v21 effectiveRange:0];

        id v9 = 0;
        id v15 = (void *)v23;
        if (!v23) {
          goto LABEL_20;
        }
        goto LABEL_21;
      }
      id v9 = [v18 attributesAtIndex:v10 effectiveRange:0];
    }
    if (v4 == sel_toggleBoldface_ || v4 == sel_toggleItalics_)
    {
      id v29 = [v9 objectForKeyedSubscript:*(void *)off_1E52D2040];
      if (v29)
      {
        if (v4 == sel_toggleBoldface_) {
          uint64_t v33 = 2;
        }
        else {
          uint64_t v33 = 1;
        }
        [(UITextInputController *)self _validateCommand:v37 forFont:v29 traits:v33];
      }
    }
    else
    {
      if (v4 == sel_toggleUnderline_)
      {
        id v29 = [v9 objectForKeyedSubscript:*(void *)off_1E52D23E8];
        BOOL v30 = [v29 integerValue] == 0;
      }
      else
      {
        if (v4 != sel_toggleSmartInsertDelete_)
        {
LABEL_59:

          goto LABEL_60;
        }
        id v29 = [(UITextInputController *)self _textInputTraits];
        BOOL v30 = [v29 smartInsertDeleteType] == 1;
      }
      uint64_t v34 = !v30;
      [v37 setState:v34];
    }

    goto LABEL_59;
  }
LABEL_60:
  uint64_t v6 = v37;
  if (v4 == sel_captureTextFromCamera_)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_firstTextView);
    uint64_t v36 = +[UIAction _textFromCameraTitleForResponder:WeakRetained];
    [v37 setTitle:v36];

    uint64_t v6 = v37;
  }
LABEL_62:
}

- (id)validAnnotations
{
  return [(UITextCheckingController *)self->_textCheckingController validAnnotations];
}

- (id)annotatedSubstringForRange:(id)a3
{
  p_textLayoutController = &self->_textLayoutController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
  uint64_t v6 = [WeakRetained annotatedSubstringForRange:v4];

  return v6;
}

- (void)replaceRange:(id)a3 withAnnotatedString:(id)a4 relativeReplacementRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [(UITextInputController *)self _textStorage];
  uint64_t v11 = [v9 length];
  unint64_t v12 = [v10 length];
  uint64_t v46 = self;
  p_textLayoutController = &self->_textLayoutController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  uint64_t v15 = [WeakRetained characterRangeForTextRange:v8];
  NSUInteger v17 = v16;

  uint64_t v49 = v15;
  unint64_t v18 = v15 + v17;
  id v19 = v10;
  if (v18 <= v12)
  {
    uint64_t v20 = v11;
    if (location != 0x7FFFFFFFFFFFFFFFLL && location + length <= v17)
    {
      NSUInteger v21 = v11 + length - v17;
      if (v11 + length >= v17)
      {
        NSUInteger v22 = v49 + location;
        unint64_t v41 = [(UITextInputController *)v46 selectedRange];
        uint64_t v38 = v23;
        NSUInteger v39 = v21;
        uint64_t v43 = objc_msgSend(v9, "attributedSubstringFromRange:", location, v21);
        id v40 = -[UITextInputController _newAttributedStringForReplacementOfAnnotatedText:inRange:](v46, "_newAttributedStringForReplacementOfAnnotatedText:inRange:");
        uint64_t v24 = _UIKitBundle();
        uint64_t v25 = [v24 localizedStringForKey:@"Replace" value:@"Replace" table:@"Localizable"];
        uint64_t v26 = [v40 string];
        -[UITextInputController registerUndoOperationForType:actionName:affectedRange:replacementText:](v46, "registerUndoOperationForType:actionName:affectedRange:replacementText:", 3, v25, v22, length, v26);

        [(UITextInputController *)v46 _sendDelegateWillChangeNotificationsForText:1 selection:0];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __83__UITextInputController_replaceRange_withAnnotatedString_relativeReplacementRange___block_invoke;
        v58[3] = &unk_1E530B1C0;
        NSUInteger v60 = v22;
        NSUInteger v61 = length;
        id v59 = v40;
        id v27 = v40;
        [v19 coordinateEditing:v58];
        if (v41 >= v22 + length && v39 != length) {
          -[UITextInputController setSelectedRange:](v46, "setSelectedRange:", v39 - length + v41, v38);
        }
        -[UITextInputController _sendDelegateChangeNotificationsForText:selection:replacement:characterRange:](v46, "_sendDelegateChangeNotificationsForText:selection:replacement:characterRange:", 1, 0, v27, v22, length);
      }
    }
    unint64_t v28 = [v19 length];
    if (v20 && v49 + v20 <= v28)
    {
      uint64_t v44 = v9;
      NSUInteger v45 = v17;
      id v48 = v8;
      id v29 = objc_loadWeakRetained((id *)p_textLayoutController);
      uint64_t v42 = v20;
      BOOL v30 = objc_msgSend(v29, "textRangeForCharacterRange:", v49, v20);

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v31 = [(UITextInputController *)v46 validAnnotations];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v55 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            id v37 = objc_loadWeakRetained((id *)p_textLayoutController);
            [v37 removeAnnotationAttribute:v36 forRange:v30];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v54 objects:v62 count:16];
        }
        while (v33);
      }

      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __83__UITextInputController_replaceRange_withAnnotatedString_relativeReplacementRange___block_invoke_2;
      v50[3] = &unk_1E530BBE8;
      uint64_t v52 = v49;
      NSUInteger v53 = v45;
      v50[4] = v46;
      id v51 = v19;
      id v9 = v44;
      objc_msgSend(v44, "enumerateAttributesInRange:options:usingBlock:", 0, v42, 0, v50);

      id v8 = v48;
    }
  }
}

uint64_t __83__UITextInputController_replaceRange_withAnnotatedString_relativeReplacementRange___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "replaceCharactersInRange:withAttributedString:", a1[5], a1[6], a1[4]);
}

void __83__UITextInputController_replaceRange_withAnnotatedString_relativeReplacementRange___block_invoke_2(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)off_1E52D2288;
  id v9 = [v7 objectForKey:*(void *)off_1E52D2288];
  uint64_t v10 = a1[6] + a3;
  uint64_t v11 = v7;
  if (v9)
  {
    *(_DWORD *)(a1[4] + 144) |= 0x20000u;
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
    unint64_t v12 = (void *)a1[5];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__UITextInputController_replaceRange_withAnnotatedString_relativeReplacementRange___block_invoke_3;
    v16[3] = &unk_1E530B1C0;
    id v17 = v9;
    uint64_t v18 = v10;
    uint64_t v19 = a4;
    [v12 coordinateEditing:v16];
    [v11 removeObjectForKey:v8];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 248));
  uint64_t v14 = objc_msgSend(WeakRetained, "textRangeForCharacterRange:", v10, a4);

  id v15 = objc_loadWeakRetained((id *)(a1[4] + 248));
  [v15 addRenderingAttributes:v11 forRange:v14];
}

uint64_t __83__UITextInputController_replaceRange_withAnnotatedString_relativeReplacementRange___block_invoke_3(void *a1, void *a2)
{
  return objc_msgSend(a2, "addAttribute:value:range:", *(void *)off_1E52D2288, a1[4], a1[5], a1[6]);
}

- (void)removeAnnotation:(id)a3 forRange:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if ([v18 isEqualToString:*(void *)off_1E52D2290])
  {
    [(UITextInputController *)self removeSpellingMarkersFromWordInRange:v6];
  }
  else
  {
    id v7 = [(UITextInputController *)self _textStorage];
    unint64_t v8 = [v7 length];

    p_textLayoutController = &self->_textLayoutController;
    id WeakRetained = objc_loadWeakRetained((id *)p_textLayoutController);
    unint64_t v11 = [WeakRetained characterRangeForTextRange:v6];
    unint64_t v13 = v12;

    if (v13 && v8 > v11)
    {
      if (v11 + v13 <= v8) {
        unint64_t v14 = v13;
      }
      else {
        unint64_t v14 = v8 - v11;
      }
      id v15 = objc_loadWeakRetained((id *)p_textLayoutController);
      NSUInteger v16 = objc_msgSend(v15, "textRangeForCharacterRange:", v11, v14);

      id v17 = objc_loadWeakRetained((id *)p_textLayoutController);
      [v17 removeAnnotationAttribute:v18 forRange:v16];
    }
  }
}

- (void)captureTextFromCamera:(id)a3
{
  id v4 = a3;
  id v6 = [(UITextInputController *)self _firstTextView];
  BOOL v5 = +[UIKeyboardCameraSession sharedSession];
  [v5 showForResponder:v6 sender:v4 rtiConfiguration:0];
}

- (_UITextLayoutController)textLayoutController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutController);
  return (_UITextLayoutController *)WeakRetained;
}

- (BOOL)allowsEditingTextAttributes
{
  return self->_allowsEditingTextAttributes;
}

- (UITextInputControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UITextInputControllerDelegate *)WeakRetained;
}

- (BOOL)continuousSpellCheckingEnabled
{
  return self->_continuousSpellCheckingEnabled;
}

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  self->_continuousSpellCheckingEnabled = a3;
}

- (UITextRange)previousSelectedTextRange
{
  return self->_previousSelectedTextRange;
}

- (void)setPreviousSelectedTextRange:(id)a3
{
}

- (int)currentUndoGroupType
{
  return self->_currentUndoGroupType;
}

- (void)setCurrentUndoGroupType:(int)a3
{
  self->_currentUndoGroupType = a3;
}

- (BOOL)shouldStartUndoGroup
{
  return self->_shouldStartUndoGroup;
}

- (void)setShouldStartUndoGroup:(BOOL)a3
{
  self->_shouldStartUndoGroup = a3;
}

@end