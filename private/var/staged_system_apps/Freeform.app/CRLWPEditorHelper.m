@interface CRLWPEditorHelper
- (BOOL)areCollabUserActionsCurrentlyPermitted;
- (BOOL)continueKillRing;
- (BOOL)editorKeyboardLanguageIsRTL;
- (BOOL)hasWhitespaceBoundedWordAtSelection:(id)a3;
- (BOOL)isACurrentEditor;
- (BOOL)p_adjustSelection:(id)a3 forWordWithCharIndex:(unint64_t)a4;
- (BOOL)p_canReplaceSelection;
- (BOOL)p_filteredRangeCanBeTransposed:(_NSRange)a3 inFilteredStorage:(id)a4;
- (BOOL)p_isCharIndex:(unint64_t)a3 withEolAffinity:(BOOL)a4 atBoundary:(int64_t)a5 inDirection:(int64_t)a6;
- (BOOL)p_isCharIndex:(unint64_t)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5;
- (BOOL)p_isEdgeAtCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 withinWordInDirection:(int64_t)a5;
- (BOOL)p_isLayoutLeftToRightAtCharIndex:(unint64_t)a3;
- (BOOL)p_setSelectionWithCharIndex:(unint64_t)a3 andAnchor:(unint64_t)a4;
- (BOOL)p_setVisualSelectionWithCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 andAnchor:(unint64_t)a5 andAnchorLeadingEdge:(BOOL)a6;
- (BOOL)p_storageRangeCanBeTransposed:(_NSRange)a3 storage:(id)a4;
- (BOOL)p_transposeRanges:(_NSRange)a3 withRange:(_NSRange)a4;
- (BOOL)p_withLineFragmentsForLogicalLineContainingCharIndex:(unint64_t)a3 eol:(BOOL)a4 performBlock:(id)a5;
- (BOOL)selectionAnchorEdge;
- (BOOL)selectionLastModifiedWithKeyboard;
- (BOOL)wantsToReceiveTextInput;
- (CGRect)p_viewRectForSelection:(id)a3;
- (CRLInteractiveCanvasController)interactiveCanvasController;
- (CRLWPEditorHelper)initWithTextSource:(id)a3 icc:(id)a4 layout:(id)a5;
- (CRLWPParagraphEnumerator)paragraphEnumeratorAtCharIndex:(SEL)a3;
- (CRLWPParagraphEnumerator)paragraphEnumeratorAtCharIndex:(SEL)a3 styleProvider:(unint64_t)a4;
- (CRLWPSelection)anchorSelection;
- (CRLWPTextSource)textSource;
- (Class)wpSelectionClass;
- (NSMutableDictionary)autocorrectedEntries;
- (_NSRange)adjustVisualSelection:(id)a3 withOtherSelection:(id)a4 outLeadingEdge:(BOOL *)a5 outCaretAffinity:(unint64_t *)a6;
- (_NSRange)availableSelectionRangeForCharIndex:(unint64_t)a3;
- (_NSRange)emacsMarkRange;
- (_NSRange)lastAutocorrectionRange;
- (_NSRange)p_expandParagraphRangeForEnumerator:(CRLWPParagraphEnumerator *)a3;
- (_NSRange)p_rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4 handleNextWordWhitespace:(BOOL)a5;
- (_NSRange)p_sanitizeMark;
- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4;
- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4;
- (_NSRange)rangeOfWordEnclosingCharIndex:(unint64_t)a3 backward:(BOOL)a4;
- (_NSRange)scanLeftForWordAtCharIndex:(unint64_t)a3;
- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3;
- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3 includingBreaks:(BOOL)a4;
- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4;
- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4 includeHyphenation:(BOOL)a5;
- (_TtC8Freeform11CRLWPEditor)editor;
- (_TtC8Freeform11CRLWPLayout)layout;
- (__CFStringTokenizer)createTokenizerForCharIndex:(unint64_t)a3 outTokenizerRange:(_NSRange *)a4;
- (const)p_lineFragmentForCharIndex:(unint64_t)a3 column:(id *)a4 eol:(BOOL)a5;
- (const)p_lineFragmentWithCaretInfo:(id *)a3 forSelection:(id)a4;
- (double)preferredOffsetFromSelection:(id)a3;
- (id)calculateVisualRunsFromSelection:(id)a3 updateControllerSelection:(BOOL)a4;
- (id)characterStyleForDeletedRange:(_NSRange)a3;
- (id)editorController;
- (id)editorKeyboardLanguage;
- (id)logicalToVisualSelection:(id)a3;
- (id)protectedSelectionBehaviorForCommand:(id)a3;
- (id)selection;
- (id)styleProvider;
- (int64_t)p_layoutIndexForCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4;
- (int64_t)p_writingDirectionForCharAtIndex:(unint64_t)a3;
- (unint64_t)backwardSelectionAnchor;
- (unint64_t)backwardSelectionEdge;
- (unint64_t)caretCharIndexForLayoutOrderCharIndex:(unint64_t)a3 inDirection:(int64_t)a4;
- (unint64_t)charIndexByMovingPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5 preferPosition:(double *)a6;
- (unint64_t)charIndexForBeginningOfLineFromCharIndex:(unint64_t)a3;
- (unint64_t)charIndexForEndOfLineFromCharIndex:(unint64_t)a3;
- (unint64_t)charIndexMovingBackwardByCharacterFromCharIndex:(unint64_t)a3;
- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 inDirection:(int64_t)a4;
- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL *)a4 inDirection:(int64_t)a5 skipAnchors:(BOOL)a6;
- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL *)a4 inDirection:(int64_t)a5 skipAnchors:(BOOL)a6 useLeadingEdgeOfNextLine:(BOOL)a7;
- (unint64_t)charIndexMovingByWordFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL *)a4 inDirection:(int64_t)a5;
- (unint64_t)charIndexMovingForwardByCharacterFromCharIndex:(unint64_t)a3;
- (unint64_t)correctionCharIndexToIgnoreHUD;
- (unint64_t)forwardSelectionAnchor;
- (unint64_t)forwardSelectionEdge;
- (unint64_t)getVisualDeletionIndexForSelection:(id)a3 backward:(BOOL *)a4;
- (unint64_t)getVisualInsertionPointIndexForString:(id)a3 selection:(id)a4;
- (unint64_t)lastChangedCharIndex;
- (unint64_t)p_adjustedCharIndexForWordTestingFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 forDirection:(int64_t)a5;
- (unint64_t)p_charIndexByMovingCharIndex:(unint64_t)a3 withEolAffinity:(BOOL *)a4 toBoundary:(int64_t)a5 inDirection:(int64_t)a6 preferPosition:(double *)a7 isLeadingEdge:(BOOL *)a8;
- (unint64_t)p_charIndexByMovingPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5 preferPosition:(double *)a6 outEolAffinity:(unint64_t *)a7;
- (unint64_t)p_indexToTransposableCharacterStartingAtIndex:(unint64_t)a3 filterStorage:(id)a4 searchTowardsStorageStart:(BOOL)a5;
- (unint64_t)p_lastVisibleCharIndexForCharIndex:(unint64_t)a3;
- (unint64_t)p_layoutOrderCharIndexForCaretCharIndex:(unint64_t)a3 inDirection:(int64_t)a4;
- (unint64_t)p_leftCharForInsertion:(id *)a3;
- (unint64_t)p_leftEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4;
- (unint64_t)p_lineIndexForMovingCharIndex:(unint64_t)a3 column:(id *)a4 up:(BOOL)a5 atStart:(BOOL)a6 eol:(BOOL *)a7;
- (unint64_t)p_moveFromCharIndex:(unint64_t *)a3 leadingEdge:(BOOL *)a4 tokenizerRef:(__CFStringTokenizer *)a5 tokenizerRange:(_NSRange *)a6 direction:(int64_t)a7 currentWordRange:(_NSRange)a8 newWordRange:(_NSRange *)a9 reasonToStop:(unint64_t)a10;
- (unint64_t)p_oppositeEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4;
- (unint64_t)p_rightEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4;
- (unint64_t)p_selectionEdgeToMutateWithDirection:(int64_t)a3 newAnchor:(unint64_t *)a4;
- (unint64_t)p_selectionEdgeToMutateWithLeadingEdge:(BOOL *)a3 Direction:(int64_t)a4 newAnchor:(unint64_t *)a5 anchorLeadingEdge:(BOOL *)a6;
- (unint64_t)selectionAnchor;
- (void)capitalizeWord:(id)a3;
- (void)deleteBackwardByDecomposingPreviousCharacter:(id)a3;
- (void)deleteToBeginningOfLine:(id)a3;
- (void)deleteToBeginningOfParagraph:(id)a3;
- (void)deleteToEndOfLine:(id)a3;
- (void)deleteToEndOfParagraph:(id)a3;
- (void)deleteToMark:(id)a3;
- (void)deleteWordBackward:(id)a3;
- (void)deleteWordForward:(id)a3;
- (void)insertNewlineIgnoringFieldEditor:(id)a3;
- (void)insertParagraphSeparator:(id)a3;
- (void)lowercaseWord:(id)a3;
- (void)moveBackward:(id)a3;
- (void)moveBackwardAndModifySelection:(id)a3;
- (void)moveDown:(id)a3;
- (void)moveDownAndModifySelection:(id)a3;
- (void)moveForward:(id)a3;
- (void)moveForwardAndModifySelection:(id)a3;
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
- (void)moveWordAndModifySelectionInStorageDirection:(int64_t)a3;
- (void)moveWordBackward:(id)a3;
- (void)moveWordBackwardAndModifySelection:(id)a3;
- (void)moveWordForward:(id)a3;
- (void)moveWordForwardAndModifySelection:(id)a3;
- (void)moveWordInLayoutDirection:(int64_t)a3;
- (void)moveWordLeft:(id)a3;
- (void)moveWordLeftAndModifySelection:(id)a3;
- (void)moveWordRight:(id)a3;
- (void)moveWordRightAndModifySelection:(id)a3;
- (void)notifySelectionChangedWithFlags:(unint64_t)a3;
- (void)p_adjustSelection:(id)a3 withOtherSelection:(id)a4 textSelectionGranularity:(unint64_t)a5;
- (void)p_deleteSelectionBackward:(BOOL)a3 decomposeCharacter:(BOOL)a4 smart:(BOOL)a5 kill:(BOOL)a6;
- (void)p_extendToEndOfLineRight:(BOOL)a3;
- (void)p_moveAndModifySelectionRight:(BOOL)a3;
- (void)p_moveInLineLayoutDirectionLeft:(BOOL)a3;
- (void)p_moveToEndOfLineRight:(BOOL)a3;
- (void)p_moveWordAndModifySelectionInLayoutDirection:(int64_t)a3;
- (void)p_replaceRange:(_NSRange)a3 withText:(id)a4 dictationAndAutocorrectionKey:(id)a5 applyingDictationAlternative:(BOOL)a6 restoreSelection:(id)a7;
- (void)p_selection:(id)a3 toGlyphRange:(id *)a4;
- (void)p_setSelectionFromKeyboardWithRange:(_NSRange)a3 leadingEdge:(BOOL)a4 endOfLine:(BOOL)a5 allowEndOfLineChange:(BOOL)a6;
- (void)p_transformWordWithActionString:(id)a3 usingBlock:(id)a4;
- (void)p_withLayoutTargetForCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 performBlock:(id)a5;
- (void)p_withLineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4 performBlock:(id)a5;
- (void)replaceRange:(_NSRange)a3 withText:(id)a4;
- (void)selectLine:(id)a3;
- (void)selectParagraph:(id)a3;
- (void)selectToMark:(id)a3;
- (void)selectWord:(id)a3;
- (void)selectWordWithFlags:(unint64_t)a3;
- (void)setAnchorSelection:(id)a3;
- (void)setAutocorrectedEntries:(id)a3;
- (void)setContinueKillRing:(BOOL)a3;
- (void)setCorrectionCharIndexToIgnoreHUD:(unint64_t)a3;
- (void)setEditor:(id)a3;
- (void)setEmacsMarkRange:(_NSRange)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setLastAutocorrectionRange:(_NSRange)a3;
- (void)setLastChangedCharIndex:(unint64_t)a3;
- (void)setLayout:(id)a3;
- (void)setMark:(id)a3;
- (void)setSelectionAnchor:(unint64_t)a3;
- (void)setSelectionAnchorEdge:(BOOL)a3;
- (void)setSelectionFromKeyboardWithRange:(_NSRange)a3 leadingEdge:(BOOL)a4 endOfLine:(BOOL)a5;
- (void)setSelectionLastModifiedWithKeyboard:(BOOL)a3;
- (void)setSelectionOfType:(unint64_t)a3 withRange:(_NSRange)a4 endOfLine:(BOOL)a5 withFlags:(unint64_t)a6;
- (void)setSelectionWithRange:(_NSRange)a3 endOfLine:(BOOL)a4;
- (void)setSelectionWithRange:(_NSRange)a3 endOfLine:(BOOL)a4 withFlags:(unint64_t)a5;
- (void)setTextSource:(id)a3;
- (void)setVisualSelectionWithRange:(_NSRange)a3 endOfLine:(BOOL)a4;
- (void)swapWithMark:(id)a3;
- (void)transpose:(id)a3;
- (void)transposeWords:(id)a3;
- (void)uppercaseWord:(id)a3;
- (void)withLineFragmentForCharIndex:(unint64_t)a3 eol:(BOOL)a4 performBlock:(id)a5;
- (void)yank:(id)a3;
- (void)yankAndSelect:(id)a3;
@end

@implementation CRLWPEditorHelper

- (id)editorKeyboardLanguage
{
  if (+[NSThread isMainThread])
  {
    v0 = +[UIApplication sharedApplication];
    v1 = [v0 textInputMode];
    v2 = [v1 primaryLanguage];

    if (([v2 isEqualToString:@"dictation"] & 1) == 0) {
      objc_storeStrong((id *)&qword_1016A9298, v2);
    }
  }
  if (qword_1016A9298) {
    uint64_t v3 = (uint64_t)[(id)qword_1016A9298 rangeOfString:@"-"];
  }
  else {
    uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = (id)qword_1016A9298;
  }
  else
  {
    [qword_1016A9298 substringToIndex:];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if (v4 && (unint64_t)[v4 length] >= 4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFB20);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010873D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFB40);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_10107F4C8();
    }

    v7 = +[NSString stringWithUTF8String:"NSString *CRLWPGetPrimaryInputLanguage()"];
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPUtilities.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:2642 isFatal:0 description:"Unexpected input language code returned by the OS"];
  }
  unsigned int v9 = [v5 isEqualToString:@"zh"];
  v10 = (void *)qword_1016A9298;
  if (!v9) {
    v10 = v5;
  }
  id v11 = v10;
  if (!v11)
  {
    v12 = +[NSBundle mainBundle];
    v13 = [v12 preferredLocalizations];
    id v11 = [v13 firstObject];

    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DFB60);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108733C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DFB80);
      }
      v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_10107F4C8();
      }

      v15 = +[NSString stringWithUTF8String:"NSString *CRLWPGetPrimaryInputLanguage()"];
      v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPUtilities.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 2651, 0, "invalid nil value for '%{public}s'", "result");

      id v11 = 0;
    }
  }

  return v11;
}

- (CRLWPTextSource)textSource
{
  uint64_t v3 = objc_opt_class();
  id v4 = sub_1002469D0(v3, self->_textSource);
  id v5 = [v4 copyWithMarkedText];

  return (CRLWPTextSource *)v5;
}

- (CRLWPEditorHelper)initWithTextSource:(id)a3 icc:(id)a4 layout:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRLWPEditorHelper;
  v12 = [(CRLWPEditorHelper *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_textSource, a3);
    objc_storeStrong((id *)&v13->_interactiveCanvasController, a4);
    v13->_selectionAnchor = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v13->_layout, a5);
  }

  return v13;
}

- (id)editorController
{
  v2 = [(CRLWPEditorHelper *)self interactiveCanvasController];
  uint64_t v3 = [v2 editorController];

  return v3;
}

- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v8 = 0;
  id v9 = [(CRLWPEditorHelper *)self textSource];
  id v10 = [v9 range];
  CFIndex v12 = v11;

  v13 = [(CRLWPEditorHelper *)self textSource];
  v14 = [v13 string];

  if (CFStringGetLength(v14) <= a3)
  {
    int v16 = 0;
  }
  else
  {
    uint64_t CharacterAtIndex = CFStringGetCharacterAtIndex(v14, a3);
    int v16 = 0;
    if (CharacterAtIndex && (unint64_t)v10 + v12 > a3) {
      int v16 = sub_1001CA378(CharacterAtIndex) ^ 1;
    }
  }
  if (v4 && (unint64_t)v10 < a3)
  {
    uint64_t v17 = CFStringGetCharacterAtIndex(v14, a3 - 1);
    int v18 = sub_1001CA378(v17);
    v16 |= v18 ^ 1;
    if (!v18) {
      --a3;
    }
  }
  if (v16)
  {
    if (v12)
    {
      v28.CFIndex location = (CFIndex)v10;
      v28.CFIndex length = v12;
      v19 = CFStringTokenizerCreate(0, v14, v28, 4uLL, 0);
      if (v19)
      {
        v20 = v19;
        if (CFStringTokenizerGoToTokenAtIndex(v19, a3))
        {
          CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v20);
          CFIndex length = CurrentTokenRange.length;
          CFIndex location = CurrentTokenRange.location;
        }
        else
        {
          CFIndex length = 0;
          CFIndex location = -1;
        }
        if (location != -1 && length != 0)
        {
          uint64_t v7 = location;
          NSUInteger v8 = length;
        }
        CFRelease(v20);
      }
    }
  }
  NSUInteger v25 = v7;
  NSUInteger v26 = v8;
  result.CFIndex length = v26;
  result.CFIndex location = v25;
  return result;
}

- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4
{
  id v4 = [(CRLWPEditorHelper *)self p_rangeForSelectionAtCharIndex:a3 caretIndex:a4 handleNextWordWhitespace:1];
  result.CFIndex length = v5;
  result.CFIndex location = (NSUInteger)v4;
  return result;
}

- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3
{
  id v3 = [(CRLWPEditorHelper *)self whiteSpaceRangeAtCharIndex:a3 includingBreaks:1];
  result.CFIndex length = v4;
  result.CFIndex location = (NSUInteger)v3;
  return result;
}

- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3 includingBreaks:(BOOL)a4
{
  id v7 = -[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:");
  uint64_t v9 = v8;
  id v10 = [(CRLWPEditorHelper *)self textSource];
  if ((unint64_t)[v10 length] <= a3)
  {

    goto LABEL_28;
  }
  CFIndex v11 = [(CRLWPEditorHelper *)self textSource];
  int v12 = sub_1001CA378((uint64_t)[v11 characterAtIndex:a3]);

  if (!v12)
  {
LABEL_28:
    NSUInteger v26 = 0;
    unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_29;
  }
  unint64_t v13 = a3;
  if ((unint64_t)v7 < a3)
  {
    unint64_t v13 = a3;
    do
    {
      v14 = [(CRLWPEditorHelper *)self textSource];
      unint64_t v15 = v13 - 1;
      id v16 = [v14 characterAtIndex:v13 - 1];
      int v17 = sub_1001CA378((uint64_t)v16);
      if (!v17 || a4)
      {

        if (!v17) {
          goto LABEL_15;
        }
      }
      else
      {
        unsigned __int8 v18 = sub_1001CA284((uint64_t)v16);
        if (v16 == 8232) {
          char v19 = 1;
        }
        else {
          char v19 = v18;
        }

        if (v19) {
          goto LABEL_15;
        }
      }
      --v13;
    }
    while (v15 > (unint64_t)v7);
    unint64_t v13 = (unint64_t)v7;
  }
LABEL_15:
  unint64_t v20 = (unint64_t)v7 + v9;
  if ((unint64_t)v7 + v9 > a3)
  {
    do
    {
      v21 = [(CRLWPEditorHelper *)self textSource];
      id v22 = [v21 characterAtIndex:a3];
      int v23 = sub_1001CA378((uint64_t)v22);
      if (!v23 || a4)
      {

        if (!v23) {
          goto LABEL_26;
        }
      }
      else
      {
        unsigned __int8 v24 = sub_1001CA284((uint64_t)v22);
        if (v22 == 8232) {
          char v25 = 1;
        }
        else {
          char v25 = v24;
        }

        if (v25) {
          goto LABEL_26;
        }
      }
      ++a3;
    }
    while (v20 != a3);
    a3 = v20;
  }
LABEL_26:
  NSUInteger v26 = a3 - v13;
LABEL_29:
  NSUInteger v27 = v13;
  result.CFIndex length = v26;
  result.CFIndex location = v27;
  return result;
}

- (BOOL)hasWhitespaceBoundedWordAtSelection:(id)a3
{
  id v4 = a3;
  char v38 = 0;
  if ([v4 isVisual])
  {
    NSUInteger v5 = (char *)[v4 superRange];
    if (&v5[v6] > [(CRLWPTextSource *)self->_textSource length])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ECCA8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109CCE4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ECCC8);
      }
      id v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper hasWhitespaceBoundedWordAtSelection:]");
      uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:217 isFatal:0 description:"bad selection -- extends past end of storage"];
    }
    id v10 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    [v10 layoutIfNeeded];

    unint64_t v11 = [(CRLWPEditorHelper *)self p_leftEdgeForSelection:v4 withLeadingEdge:&v38];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ECCE8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109CBD4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ECD08);
      }
      int v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      unint64_t v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper hasWhitespaceBoundedWordAtSelection:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:221 isFatal:0 description:"Couldn't find left edge char index"];

      goto LABEL_44;
    }
    id v28 = [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:v11 inDirection:3];
    if ((sub_1001CA378((uint64_t)[(CRLWPTextSource *)self->_textSource characterAtIndex:v11]) & 1) != 0
      || v28 == [(CRLWPTextSource *)self->_textSource length]
      || sub_1001CA378((uint64_t)[(CRLWPTextSource *)self->_textSource characterAtIndex:v28]))
    {
      unint64_t v29 = [(CRLWPEditorHelper *)self p_rightEdgeForSelection:v4 withLeadingEdge:&v38];
      if (v29 == 0x7FFFFFFFFFFFFFFFLL)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ECD28);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109CC5C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ECD48);
        }
        v30 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper hasWhitespaceBoundedWordAtSelection:]");
        v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v31 file:v32 lineNumber:242 isFatal:0 description:"Invalid index for right edge of selection"];

        goto LABEL_46;
      }
      id v33 = [(CRLWPTextSource *)self->_textSource characterAtIndex:v29];
      if (sub_1001CA284((uint64_t)v33))
      {
LABEL_46:
        char v25 = 0;
        char v26 = 1;
        goto LABEL_49;
      }
      sub_1001CA378((uint64_t)v33);
      textSource = self->_textSource;
      id v35 = [v4 range];
      unsigned __int8 v27 = -[CRLWPTextSource isAllWhitespaceInRange:](textSource, "isAllWhitespaceInRange:", v35, v36);
LABEL_48:
      char v25 = v27 ^ 1;
      char v26 = v27 ^ 1;
      goto LABEL_49;
    }
LABEL_44:
    char v25 = 0;
    char v26 = 0;
    goto LABEL_49;
  }
  if (![v4 isValid]) {
    goto LABEL_44;
  }
  if (![v4 isRange]) {
    goto LABEL_44;
  }
  unint64_t v15 = (char *)[v4 range];
  uint64_t v17 = v16;
  unsigned __int8 v18 = +[NSCharacterSet crlwp_preSmartSet];
  unsigned __int8 v19 = [v18 characterIsMember:[self->_textSource characterAtIndex:v15]];

  if ((v19 & 1) == 0
    && [(CRLWPTextSource *)self->_textSource wordAtCharIndex:v15 includePreviousWord:0] != v15)
  {
    goto LABEL_44;
  }
  id v20 = [(CRLWPTextSource *)self->_textSource characterAtIndex:&v15[v17 - 1]];
  if (sub_1001CA284((uint64_t)v20)) {
    goto LABEL_46;
  }
  v21 = +[NSCharacterSet crlwp_postSmartSet];
  unsigned __int8 v22 = [v21 characterIsMember:v20];

  if ((v22 & 1) != 0
    || (v23 = (char *)[(CRLWPTextSource *)self->_textSource wordAtCharIndex:&v15[v17] includePreviousWord:1], char v25 = 0, v26 = 1, v24)&& &v23[v24] == &v15[v17])
  {
    unsigned __int8 v27 = -[CRLWPTextSource isAllWhitespaceInRange:](self->_textSource, "isAllWhitespaceInRange:", v15, v17);
    goto LABEL_48;
  }
LABEL_49:

  return v25 & v26;
}

- (_NSRange)scanLeftForWordAtCharIndex:(unint64_t)a3
{
  id v5 = -[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:");
  unint64_t v7 = a3;
  if ((unint64_t)v5 + v6 > a3)
  {
    uint64_t v8 = [(CRLWPEditorHelper *)self textSource];
    int v9 = sub_1001CA378((uint64_t)[v8 characterAtIndex:a3]);

    unint64_t v7 = a3;
    if (v9)
    {
      id v10 = [(CRLWPEditorHelper *)self whiteSpaceRangeAtCharIndex:a3];
      if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v7 = a3;
      }
      else {
        unint64_t v7 = (unint64_t)v10;
      }
    }
  }
  id v11 = [(CRLWPEditorHelper *)self wordAtCharIndex:a3 includePreviousWord:1];
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v11 = (id)v7;
  }
  NSUInteger v12 = a3 - (void)v11;
  result.CFIndex length = v12;
  result.CFIndex location = (NSUInteger)v11;
  return result;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  id v4 = [(CRLWPEditorHelper *)self wordAtCharIndex:a3 includePreviousWord:a4 includeHyphenation:0];
  result.CFIndex length = v5;
  result.CFIndex location = (NSUInteger)v4;
  return result;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4 includeHyphenation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  int v9 = [(CRLWPEditorHelper *)self textSource];
  id v10 = [v9 textRangeForParagraphAtCharIndex:a3];
  uint64_t v12 = v11;

  unint64_t v13 = [(CRLWPEditorHelper *)self textSource];
  v14 = [v13 string];
  id v15 = [v14 crlwp_rangeOfWordAtCharacterIndex:a3 range:v10 includePreviousWord:v12 includeHyphenation:v6];
  NSUInteger v17 = v16;

  NSUInteger v18 = (NSUInteger)v15;
  NSUInteger v19 = v17;
  result.CFIndex length = v19;
  result.CFIndex location = v18;
  return result;
}

- (_NSRange)p_rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4 handleNextWordWhitespace:(BOOL)a5
{
  BOOL v38 = a5;
  unint64_t v7 = a4 - 1;
  if (a3 != a4 && v7 != a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECD68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109CDF4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECD88);
    }
    uint64_t v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    int v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:381 isFatal:0 description:"Precondition: caretIndex is either equal to the given charIndex or one past"];
  }
  unint64_t v37 = v7;
  id v11 = [(CRLWPEditorHelper *)self availableSelectionRangeForCharIndex:a4];
  unint64_t v13 = (unint64_t)v11;
  uint64_t v14 = v12;
  if ((unint64_t)v11 <= a3) {
    unint64_t v15 = a3;
  }
  else {
    unint64_t v15 = (unint64_t)v11;
  }
  if (v12 - 1 < v15 - (unint64_t)v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECDA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109CD6C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECDC8);
    }
    NSUInteger v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    NSUInteger v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:]");
    NSUInteger v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:390 isFatal:0 description:"Character index should be inside allowable selection range."];
  }
  unint64_t v19 = v13 + v14;
  if (v15 >= v13 + v14)
  {
    id v21 = 0;
  }
  else
  {
    id v20 = [(CRLWPEditorHelper *)self textSource];
    id v21 = [v20 characterAtIndex:v15];
  }
  if (!sub_1001CA3C0((int)v21))
  {
    if (v38 && sub_1001CA378((uint64_t)v21))
    {
      if (v15 != a4 || !v15 || v13 >= a3)
      {
        unint64_t v37 = v15;
        if (v15 + 1 == a4)
        {
          if (v19 <= a4) {
            unint64_t v24 = v15;
          }
          else {
            unint64_t v24 = a4;
          }
          unint64_t v37 = v24;
        }
      }
      char v25 = [(CRLWPEditorHelper *)self textSource];
      id v26 = [v25 characterAtIndex:v37];

      if ((sub_1001CA378((uint64_t)v26) & 1) == 0)
      {
        BOOL v27 = sub_1001CA3C0((int)v26);
        unint64_t v28 = v37;
        if (!v27) {
          goto LABEL_47;
        }
      }
      uint64_t v23 = (uint64_t)[(CRLWPEditorHelper *)self whiteSpaceRangeAtCharIndex:v15 includingBreaks:0];
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger v22 = v29;
        unint64_t v28 = v15;
        if (v29) {
          goto LABEL_50;
        }
        goto LABEL_47;
      }
    }
    unint64_t v28 = v15;
LABEL_47:
    unint64_t v30 = v28;
    uint64_t v23 = (uint64_t)-[CRLWPEditorHelper wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:");
    NSUInteger v22 = v31;
    if (v23 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_50;
    }
    if (v30 < v19)
    {
      v32 = [(CRLWPEditorHelper *)self textSource];
      id v33 = [v32 string];
      uint64_t v23 = (uint64_t)[v33 rangeOfComposedCharacterSequenceAtIndex:v30];
      NSUInteger v22 = v34;

      goto LABEL_50;
    }
    goto LABEL_30;
  }
  NSUInteger v22 = 0;
LABEL_30:
  uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_50:
  NSUInteger v35 = v23;
  NSUInteger v36 = v22;
  result.CFIndex length = v36;
  result.CFIndex location = v35;
  return result;
}

- (Class)wpSelectionClass
{
  return (Class)objc_opt_class();
}

- (CRLWPParagraphEnumerator)paragraphEnumeratorAtCharIndex:(SEL)a3
{
  return [(CRLWPEditorHelper *)self paragraphEnumeratorAtCharIndex:a4 styleProvider:0];
}

- (CRLWPParagraphEnumerator)paragraphEnumeratorAtCharIndex:(SEL)a3 styleProvider:(unint64_t)a4
{
  id v13 = a5;
  uint64_t v8 = [(CRLWPEditorHelper *)self textSource];
  int v9 = [(CRLWPEditorHelper *)self textSource];
  id v10 = [v9 paragraphIndexAtCharIndex:a4];
  id v11 = [(CRLWPEditorHelper *)self textSource];
  sub_100189DF8(retstr, v8, v13, v10, (char *)[v11 paragraphCount] - 1, 1);

  return result;
}

- (id)selection
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CRLWPEditorHelper *)self editorController];
  BOOL v5 = [(CRLWPEditorHelper *)self editor];
  BOOL v6 = [v4 selectionForEditor:v5];
  unint64_t v7 = sub_1002469D0(v3, v6);

  return v7;
}

- (void)setVisualSelectionWithRange:(_NSRange)a3 endOfLine:(BOOL)a4
{
}

- (void)setSelectionWithRange:(_NSRange)a3 endOfLine:(BOOL)a4
{
}

- (void)setSelectionWithRange:(_NSRange)a3 endOfLine:(BOOL)a4 withFlags:(unint64_t)a5
{
}

- (void)setSelectionOfType:(unint64_t)a3 withRange:(_NSRange)a4 endOfLine:(BOOL)a5 withFlags:(unint64_t)a6
{
  BOOL v7 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v51 = [(CRLWPEditorHelper *)self editor];
  [v51 textSelectionWillChange];

  v52 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([CRLWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", a3, location, length, 0, v7);
  uint64_t v12 = [(CRLWPEditorHelper *)self editorController];
  id v13 = [v12 currentEditors];
  uint64_t v14 = [v13 lastObject];
  unint64_t v15 = [(CRLWPEditorHelper *)self editor];

  if (v14 == v15)
  {
    if ([(CRLWPSelection *)v52 isInsertionPoint])
    {
      NSUInteger v16 = [(CRLWPEditorHelper *)self interactiveCanvasController];
      unsigned int v17 = [v16 editingDisabled];

      if (v17)
      {
        NSUInteger v18 = [(CRLWPEditorHelper *)self editor];
        [v18 endEditingAndSelectParent:self];
LABEL_23:

        goto LABEL_24;
      }
    }
    unint64_t v19 = [(CRLWPEditorHelper *)self editorController];
    id v20 = [(CRLWPEditorHelper *)self editor];
    NSUInteger v18 = [v19 selectionForEditor:v20];

    uint64_t v21 = objc_opt_class();
    NSUInteger v22 = sub_1002469D0(v21, v18);
    uint64_t v23 = (char *)[v22 range];
    if (v23 == (char *)location || &v23[v24] == (char *)(location + length))
    {
      int v25 = 1;
    }
    else
    {
      int v25 = 0;
      a6 |= 4uLL;
    }
    id v26 = [(CRLWPEditorHelper *)self editorController];
    BOOL v27 = [v26 selectionPath];
    unint64_t v28 = [v27 selectionPathReplacingMostSpecificLocationOfSelection:v18 withSelection:v52];

    NSUInteger v29 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    [v29 setSelectionPath:v28 withSelectionFlags:a6];

    if (v22) {
      int v30 = v25;
    }
    else {
      int v30 = 0;
    }
    if (v30 != 1)
    {
LABEL_22:

      goto LABEL_23;
    }
    NSUInteger v31 = [(CRLWPEditorHelper *)self selection];
    v32 = (char *)[v22 superRange];
    uint64_t v34 = v33;
    NSUInteger v35 = (char *)[v31 superRange];
    unint64_t v37 = v35;
    if (v32 != v35 || v34 != v36)
    {
      if (v32 == v35)
      {
        unint64_t v37 = &v32[v36];
        uint64_t v38 = 1;
        goto LABEL_19;
      }
      if (&v32[v34] == &v35[v36])
      {
        uint64_t v38 = 0;
LABEL_19:
        if (v37 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v39 = [CRLWPSelection alloc];
          id v40 = [v31 type];
          id v41 = [v31 styleInsertionBehavior];
          id v42 = [v31 smartFieldRange];
          LOBYTE(v50) = 1;
          v44 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:](v39, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", v40, v37, 0, v41, v38, v42, v43, v50, v37);
          v45 = [(CRLWPEditorHelper *)self editorController];
          v46 = [v45 selectionPath];
          v47 = [v46 selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:v44];

          v48 = [(CRLWPEditorHelper *)self interactiveCanvasController];
          [v48 scrollToSelectionPath:v47 scrollOptions:1];
        }
      }
    }

    goto LABEL_22;
  }
LABEL_24:
  v49 = [(CRLWPEditorHelper *)self editor];
  [v49 textSelectionDidChange];
}

- (unint64_t)p_moveFromCharIndex:(unint64_t *)a3 leadingEdge:(BOOL *)a4 tokenizerRef:(__CFStringTokenizer *)a5 tokenizerRange:(_NSRange *)a6 direction:(int64_t)a7 currentWordRange:(_NSRange)a8 newWordRange:(_NSRange *)a9 reasonToStop:(unint64_t)a10
{
  [(CRLWPEditorHelper *)self paragraphEnumeratorAtCharIndex:*a3];
  v44 = [(CRLWPEditorHelper *)self textSource];
  NSUInteger location = a8.location;
  if (a8.location == -1)
  {
    NSUInteger v42 = 0;
    NSUInteger v43 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v15 = [v44 charRangeMappedFromStorage:a8.location, a8.length];
    NSUInteger v42 = v16;
    NSUInteger v43 = (NSUInteger)v15;
  }
  id v40 = a9;
  unint64_t v17 = *a3;
  while (1)
  {
    NSUInteger v18 = -[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:](self, "p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:", v17, *a4, a7, v40);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_49;
    }
    unint64_t v19 = *a5;
    if (!*a5) {
      goto LABEL_13;
    }
    if (v18 < a6->location || v18 - a6->location >= a6->length)
    {
      CFRelease(v19);
      *a5 = 0;
LABEL_13:
      unint64_t v19 = [(CRLWPEditorHelper *)self createTokenizerForCharIndex:v18 outTokenizerRange:a6];
      *a5 = v19;
    }
    CFStringTokenizerTokenType v21 = CFStringTokenizerGoToTokenAtIndex(v19, v18);
    if ((a10 & 2) != 0 && !v21)
    {
      unint64_t v35 = 2;
      goto LABEL_50;
    }
    NSUInteger v22 = location;
    if (!v21) {
      goto LABEL_32;
    }
    BOOL v23 = location == 0x7FFFFFFFFFFFFFFFLL && a8.length == 0;
    BOOL v24 = v23;
    if ((a10 & 4) != 0 && !v24) {
      break;
    }
    if ((a10 & 8) != 0)
    {
      *(CFRange *)id v40 = CFStringTokenizerGetCurrentTokenRange(*a5);
      unint64_t v35 = 8;
      goto LABEL_50;
    }
LABEL_32:
    BOOL v33 = *a4;
    unint64_t v34 = [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:*a3 leadingEdge:a4 inDirection:a7 skipAnchors:0];
    unint64_t v17 = v34;
    NSUInteger location = v22;
    if (v34 == *a3)
    {
      if (*a4 == v33 || v34 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_40:
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014ECDE8);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10109CE7C();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014ECE08);
          }
          uint64_t v36 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
          {
            +[CRLAssertionHandler packedBacktraceString];
            objc_claimAutoreleasedReturnValue();
            sub_1010663B0();
          }

          unint64_t v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_moveFromCharIndex:leadingEdge:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:]");
          uint64_t v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v37 file:v38 lineNumber:603 isFatal:0 description:"Should not have received NSNotFound."];
        }
LABEL_49:
        unint64_t v35 = 1;
        goto LABEL_50;
      }
    }
    else if (v34 == 0x7FFFFFFFFFFFFFFFLL)
    {
      goto LABEL_40;
    }
    *a3 = v34;
  }
  CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(*a5);
  id v26 = [v44 charRangeMappedFromStorage:CurrentTokenRange.location, CurrentTokenRange.length];
  NSUInteger v28 = v27;
  v48.NSUInteger location = v22;
  v48.NSUInteger length = a8.length;
  NSUInteger v41 = sub_100209474(v48, (NSRange)CurrentTokenRange);
  uint64_t v30 = v29;
  v49.NSUInteger length = v42;
  v49.NSUInteger location = v43;
  v50.NSUInteger location = (NSUInteger)v26;
  v50.NSUInteger length = v28;
  NSUInteger v31 = sub_100209474(v49, v50);
  if (CurrentTokenRange.location == v22 && CurrentTokenRange.length == a8.length || v32 | v31 && (v30 || !v41)) {
    goto LABEL_32;
  }
  *(CFRange *)id v40 = CurrentTokenRange;
  unint64_t v35 = 4;
LABEL_50:

  sub_100189C94(&v47);
  return v35;
}

- (__CFStringTokenizer)createTokenizerForCharIndex:(unint64_t)a3 outTokenizerRange:(_NSRange *)a4
{
  BOOL v7 = [(CRLWPEditorHelper *)self textSource];
  id v8 = [v7 textRangeForParagraphAtCharIndex:a3];
  NSUInteger v10 = v9;

  a4->NSUInteger location = (NSUInteger)v8;
  a4->NSUInteger length = v10;
  id v11 = [(CRLWPEditorHelper *)self textSource];
  uint64_t v12 = [v11 string];
  id v13 = CFStringTokenizerCreate(0, v12, *(CFRange *)a4, 0, 0);

  CFStringTokenizerGoToTokenAtIndex(v13, a3);
  return v13;
}

- (unint64_t)charIndexMovingForwardByCharacterFromCharIndex:(unint64_t)a3
{
  return [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:a3 inDirection:0];
}

- (unint64_t)charIndexMovingBackwardByCharacterFromCharIndex:(unint64_t)a3
{
  return [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:a3 inDirection:1];
}

- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  BOOL v7 = [(CRLWPEditorHelper *)self textSource];

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECE28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109CF04();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECE48);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    NSUInteger v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:]");
    NSUInteger v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 633, 0, "invalid nil value for '%{public}s'", "self.textSource");
  }
  id v11 = [(CRLWPEditorHelper *)self textSource];
  BOOL v12 = v11 == 0;

  if (v12) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:a3 leadingEdge:0 inDirection:a4 skipAnchors:1];
  }
}

- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL *)a4 inDirection:(int64_t)a5 skipAnchors:(BOOL)a6
{
  return [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:a3 leadingEdge:a4 inDirection:a5 skipAnchors:a6 useLeadingEdgeOfNextLine:0];
}

- (_NSRange)p_expandParagraphRangeForEnumerator:(CRLWPParagraphEnumerator *)a3
{
  NSUInteger location = (NSUInteger)sub_100189F3C((uint64_t)a3);
  NSUInteger length = v5;
  if (!sub_10018A0D4((uint64_t)a3))
  {
    sub_100189DFC((uint64_t)a3);
    v18.NSUInteger location = (NSUInteger)sub_100189F3C((uint64_t)a3);
    v18.NSUInteger length = v7;
    v16.NSUInteger location = location;
    v16.NSUInteger length = length;
    NSRange v8 = NSUnionRange(v16, v18);
    NSUInteger location = v8.location;
    NSUInteger length = v8.length;
    sub_100189E20((uint64_t)a3);
  }
  if (sub_100189E50((uint64_t)a3))
  {
    NSUInteger v9 = location;
    NSUInteger v10 = length;
  }
  else
  {
    sub_100189E20((uint64_t)a3);
    v12.NSUInteger location = (NSUInteger)sub_100189F3C((uint64_t)a3);
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

- (BOOL)p_isLayoutLeftToRightAtCharIndex:(unint64_t)a3
{
  NSUInteger v5 = [(CRLWPEditorHelper *)self interactiveCanvasController];
  [v5 layoutIfNeeded];

  uint64_t v8 = 0;
  BOOL v6 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:a3 column:&v8 eol:0];
  return !v6 || sub_100159174((long long *)v6, a3) == 0;
}

- (id)calculateVisualRunsFromSelection:(id)a3 updateControllerSelection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([v6 validVisualRanges] & 1) != 0
    || [v6 isInsertionPoint])
  {
    id v7 = v6;
    goto LABEL_4;
  }
  v100 = self;
  if ([v6 type] != (id)7)
  {
    id v7 = v6;
    if (v4) {
      goto LABEL_200;
    }
    goto LABEL_4;
  }
  v103 = (char *)[v6 start];
  NSUInteger v9 = [(CRLWPEditorHelper *)self textSource];
  id v10 = [v6 end];
  NSUInteger v11 = [(CRLWPEditorHelper *)self textSource];
  id v12 = [v11 characterCount];
  if (v12 >= v10) {
    id v13 = v10;
  }
  else {
    id v13 = v12;
  }
  NSRange v14 = (char *)[v9 previousCharacterIndex:v13];

  v101 = objc_opt_new();
  v124[0] = 0;
  v124[1] = v124;
  v124[2] = 0x3032000000;
  v124[3] = sub_100306F74;
  v124[4] = sub_100306F84;
  id v125 = 0;
  v122[0] = 0;
  v122[1] = v122;
  v122[2] = 0x3032000000;
  v122[3] = sub_100306F74;
  v122[4] = sub_100306F84;
  id v123 = 0;
  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x2020000000;
  uint64_t v121 = 0;
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x2020000000;
  uint64_t v117 = 0;
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_100306F8C;
  v113[3] = &unk_1014ECE70;
  v113[4] = v124;
  v113[5] = &v118;
  v113[7] = &v114;
  v113[8] = v14;
  v113[6] = v122;
  [(CRLWPEditorHelper *)self withLineFragmentForCharIndex:v103 eol:0 performBlock:v113];
  BOOL v98 = v4;
  if (!v119[3]
    || ![v6 isRange]
    || !v115[3]
    && (v112[0] = _NSConcreteStackBlock,
        v112[1] = 3221225472,
        v112[2] = sub_100307084,
        v112[3] = &unk_1014ECE98,
        v112[4] = v122,
        v112[5] = &v114,
        [(CRLWPEditorHelper *)self withLineFragmentForCharIndex:v14 eol:0 performBlock:v112], !v115[3]))
  {
    v102 = v14;
    goto LABEL_194;
  }
  unint64_t v15 = sub_10015A7EC(v119[3], (unint64_t)v103);
  unint64_t v16 = sub_10015A7EC(v115[3], (unint64_t)v14);
  unint64_t v17 = (uint64_t *)v119[3];
  uint64_t v18 = v17[3];
  if ((~*((_DWORD *)v17 + 6) & 0x801) != 0)
  {
    BOOL v22 = 0;
  }
  else
  {
    unint64_t v19 = &xmmword_101176F48;
    if (v18 >= 0) {
      unint64_t v19 = (long long *)v119[3];
    }
    uint64_t v21 = *(void *)v19;
    uint64_t v20 = *((void *)v19 + 1);
    BOOL v22 = v21 + v20 <= (unint64_t)[v6 end];
    unint64_t v17 = (uint64_t *)v119[3];
  }
  sub_10015B2B4(v17, &__p);
  int v23 = (v18 & 1) == 0 || v22;
  if (__p == (void *)v111 && v23)
  {
    uint64_t v24 = v119[3];
    if (*(uint64_t *)(v24 + 24) < 0) {
      int v25 = &xmmword_101176F48;
    }
    else {
      int v25 = (long long *)v119[3];
    }
    uint64_t v26 = *((void *)v25 + 1);
    *((void *)&v107 + 1) = *(void *)v25;
    uint64_t v108 = v26;
    BOOL v109 = (*(void *)(v24 + 24) & 0x1000) == 0;
    v106 = (char *)*((void *)&v107 + 1);
    *(void *)&long long v107 = *((void *)&v107 + 1);
    sub_1003070E8(&__p, (long long *)&v106);
  }
  NSUInteger v27 = (long long *)v119[3];
  uint64_t v99 = *((void *)v27 + 3);
  NSUInteger v28 = v103;
  if (v27 == (long long *)v115[3] && v15 > v16) {
    uint64_t v29 = v103;
  }
  else {
    uint64_t v29 = v14;
  }
  if (v27 == (long long *)v115[3] && v15 > v16) {
    NSUInteger v28 = v14;
  }
  v102 = v29;
  v103 = v28;
  if (v18)
  {
    if (v99 < 0) {
      NSUInteger v27 = &xmmword_101176F48;
    }
    unint64_t v30 = *(void *)v27;
    if (v30 >= (unint64_t)[v6 start])
    {
      [v101 addRange:*(void *)v119[3], 1];
      if ((void *)v111 != __p && !v22)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ECEB8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109CF98();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ECED8);
        }
        uint64_t v32 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        BOOL v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper calculateVisualRunsFromSelection:updateControllerSelection:]");
        unint64_t v34 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v33 file:v34 lineNumber:758 isFatal:0 description:"Expect no runs for a partitioned attachment line fragment"];
      }
    }
  }
  unint64_t v35 = __p;
  if ((void *)v111 == __p)
  {
LABEL_136:
    v60 = (long long *)v119[3];
    v61 = (long long *)v115[3];
    uint64_t v62 = *((void *)v60 + 3);
    if (v60 == v61 && (v62 & 0x4000) != 0)
    {
      id v63 = [v6 range];
      uint64_t v65 = v64;
LABEL_190:
      [v101 addRange:v63, v65];
      goto LABEL_191;
    }
    if (v62 < 0) {
      v60 = &xmmword_101176F48;
    }
    unint64_t v66 = *(void *)v60 + *((void *)v60 + 1);
    unint64_t v67 = *(void *)v61;
    if (v66 <= v67) {
      unint64_t v68 = v67;
    }
    else {
      unint64_t v68 = v66;
    }
    if (v66 >= v67) {
      uint64_t v69 = v67;
    }
    else {
      uint64_t v69 = v66;
    }
    [v101 addRange:v69, v68 - v69];
    sub_10015B2B4((uint64_t *)v115[3], &v106);
    if (__p)
    {
      *(void *)&long long v111 = __p;
      operator delete(__p);
    }
    v70 = v106;
    __p = v106;
    long long v111 = v107;
    v71 = (char *)v107;
    v72 = v115;
    v73 = v100;
    if (v106 == (char *)v107)
    {
      uint64_t v74 = v115[3];
      uint64_t v75 = *(void *)(v74 + 24);
      if ((v75 & 0x800) == 0) {
        goto LABEL_186;
      }
      if (v75 < 0) {
        v76 = &xmmword_101176F48;
      }
      else {
        v76 = (long long *)v115[3];
      }
      uint64_t v77 = *((void *)v76 + 1);
      *((void *)&v107 + 1) = *(void *)v76;
      uint64_t v108 = v77;
      BOOL v109 = (*(void *)(v74 + 24) & 0x1000) == 0;
      v106 = (char *)*((void *)&v107 + 1);
      *(void *)&long long v107 = *((void *)&v107 + 1);
      sub_1003070E8(&__p, (long long *)&v106);
      v72 = v115;
      v70 = (char *)__p;
      v71 = (char *)v111;
    }
    v78 = (id *)v72[3];
    id v79 = v78[3];
    if (v71 == v70)
    {
LABEL_187:
      if ((v79 & 1) == 0)
      {
        uint64_t v92 = objc_opt_new();

        v101 = (void *)v92;
        goto LABEL_191;
      }
      id v63 = *v78;
      uint64_t v65 = 1;
      goto LABEL_190;
    }
    uint64_t v80 = 0;
    char v81 = 0;
    unsigned int v82 = 0;
    while (1)
    {
      v83 = &v70[40 * v80];
      v85 = (char *)*((void *)v83 + 2);
      unint64_t v84 = *((void *)v83 + 3);
      if (v102 < v85 || v102 - v85 >= v84)
      {
        if (((unsigned __int16)v79 & 0x1000) == 0) {
          goto LABEL_178;
        }
        if (v81) {
          goto LABEL_184;
        }
LABEL_179:
        char v81 = 0;
        v70 = (char *)__p;
        uint64_t v80 = ++v82;
        if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v111 - (void)__p) >> 3) <= v82)
        {
          v72 = v115;
LABEL_186:
          v78 = (id *)v72[3];
          id v79 = v78[3];
          goto LABEL_187;
        }
      }
      else
      {
        int v87 = v70[40 * v80 + 32];
        if (((unsigned __int16)v79 & 0x1000) == 0)
        {
          if (v87)
          {
            v88 = [(CRLWPEditorHelper *)v73 textSource];
            v89 = (char *)[v88 nextCharacterIndex:v102];
            if (v85 >= v89) {
              v85 = v89;
            }

            char v81 = 1;
            v73 = v100;
          }
          else
          {
            if (v102 >= &v85[v84]) {
              v85 += v84;
            }
            else {
              v85 = v102;
            }
            char v81 = 1;
          }
LABEL_178:
          [v101 addRange:v85];
          if (v81) {
            goto LABEL_191;
          }
          goto LABEL_179;
        }
        if (v87)
        {
          if (v102 >= &v85[v84]) {
            v85 += v84;
          }
          else {
            v85 = v102;
          }
        }
        else
        {
          v90 = [(CRLWPEditorHelper *)v73 textSource];
          v91 = (char *)[v90 nextCharacterIndex:v102];
          if (v85 >= v91) {
            v85 = v91;
          }

          v73 = v100;
        }
LABEL_184:
        [v101 addRange:v85];
        v70 = (char *)__p;
        char v81 = 1;
        uint64_t v80 = ++v82;
        if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v111 - (void)__p) >> 3) <= v82) {
          goto LABEL_191;
        }
      }
    }
  }
  uint64_t v36 = 0;
  int v37 = 0;
  int v38 = 0;
  unsigned int v39 = 1;
  do
  {
    id v40 = &v35[40 * v36];
    unint64_t v42 = *((void *)v40 + 2);
    NSUInteger v41 = (char *)*((void *)v40 + 3);
    BOOL v44 = (unint64_t)v103 >= v42 && &v103[-v42] < v41;
    if (!v44)
    {
      NSRange v48 = (char *)*((void *)v40 + 2);
      int64_t v49 = *((void *)v40 + 3);
      goto LABEL_89;
    }
    if ((v99 & 0x1000) == 0 || v119[3] == v115[3])
    {
      if (v35[40 * v36 + 32])
      {
LABEL_74:
        if (v103 <= &v41[v42]) {
          NSRange v50 = &v41[v42];
        }
        else {
          NSRange v50 = v103;
        }
        if (v103 >= &v41[v42]) {
          NSRange v48 = &v41[v42];
        }
        else {
          NSRange v48 = v103;
        }
        int64_t v49 = v50 - v48;
        goto LABEL_88;
      }
      v45 = [(CRLWPEditorHelper *)v100 textSource];
      id v51 = (char *)[v45 nextCharacterIndex:v103];
      if (v42 <= (unint64_t)v51) {
        id v47 = v51;
      }
      else {
        id v47 = (unsigned char *)v42;
      }
      if (v42 >= (unint64_t)v51) {
        NSRange v48 = v51;
      }
      else {
        NSRange v48 = (char *)v42;
      }
    }
    else
    {
      if (!v35[40 * v36 + 32]) {
        goto LABEL_74;
      }
      v45 = [(CRLWPEditorHelper *)v100 textSource];
      v46 = (char *)[v45 nextCharacterIndex:v103];
      if (v42 <= (unint64_t)v46) {
        id v47 = v46;
      }
      else {
        id v47 = (unsigned char *)v42;
      }
      if (v42 >= (unint64_t)v46) {
        NSRange v48 = v46;
      }
      else {
        NSRange v48 = (char *)v42;
      }
    }

    int64_t v49 = v47 - v48;
LABEL_88:
    int v37 = 1;
LABEL_89:
    if ((unint64_t)v102 >= v42 && &v102[-v42] < v41)
    {
      if (*((unsigned char *)__p + 40 * v36 + 32))
      {
        if (v44)
        {
          v53 = [(CRLWPEditorHelper *)v100 textSource];
          v54 = (char *)[v53 nextCharacterIndex:v102];
          if (v103 <= v54) {
            v55 = v54;
          }
          else {
            v55 = v103;
          }
          if (v103 >= v54) {
            NSRange v48 = v54;
          }
          else {
            NSRange v48 = v103;
          }
        }
        else
        {
          v53 = [(CRLWPEditorHelper *)v100 textSource];
          v57 = (char *)[v53 nextCharacterIndex:v102];
          if (v42 <= (unint64_t)v57) {
            v55 = v57;
          }
          else {
            v55 = (char *)v42;
          }
          if (v42 >= (unint64_t)v57) {
            NSRange v48 = v57;
          }
          else {
            NSRange v48 = (char *)v42;
          }
        }
      }
      else
      {
        if (!v44)
        {
          if (v102 <= &v41[v42]) {
            v59 = &v41[v42];
          }
          else {
            v59 = v102;
          }
          if (v102 >= &v41[v42]) {
            NSRange v48 = &v41[v42];
          }
          else {
            NSRange v48 = v102;
          }
          int64_t v49 = v59 - v48;
          goto LABEL_115;
        }
        v53 = [(CRLWPEditorHelper *)v100 textSource];
        v56 = (char *)[v53 nextCharacterIndex:v103];
        if (v102 <= v56) {
          v55 = v56;
        }
        else {
          v55 = v102;
        }
        if (v102 >= v56) {
          NSRange v48 = v56;
        }
        else {
          NSRange v48 = v102;
        }
      }

      int64_t v49 = v55 - v48;
LABEL_115:
      int v38 = 1;
    }
    if ((v99 & 0x1000) != 0)
    {
      if (((v38 | v37) & 1) != 0 || v119[3] != v115[3]) {
        [v101 addRange:v48, v49];
      }
      if (v37)
      {
        if ((v119[3] != v115[3]) | v38 & 1) {
          break;
        }
        goto LABEL_126;
      }
    }
    else if (v37)
    {
      [v101 addRange:v48, v49];
    }
    if (v38) {
      goto LABEL_191;
    }
LABEL_126:
    uint64_t v36 = v39;
    unint64_t v35 = __p;
  }
  while (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v111 - (void)__p) >> 3) > v39++);
  if ((v38 & 1) == 0) {
    goto LABEL_136;
  }
LABEL_191:
  if (__p)
  {
    *(void *)&long long v111 = __p;
    operator delete(__p);
  }
  self = v100;
LABEL_194:
  if ([v101 rangeCount])
  {
    v93 = [(CRLWPEditorHelper *)self textSource];
    id v94 = [v93 isWritingDirectionRightToLeftForParagraphAtCharIndex:[v6 start]];
    id v7 = [v6 copyWithVisualRanges:v101 headCharIndex:v103 tailCharIndex:v102 rightToLeft:v94 sameLine:v119[3] == v115[3]];
  }
  else if ([v6 isRange])
  {
    id v7 = [v6 copyWithNewType:0];
  }
  else
  {
    id v7 = 0;
  }
  _Block_object_dispose(&v114, 8);
  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(v122, 8);

  _Block_object_dispose(v124, 8);
  self = v100;
  if (v98)
  {
LABEL_200:
    v95 = [(CRLWPEditorHelper *)self selection];
    unsigned __int8 v96 = [v95 isEqual:v7];

    if ((v96 & 1) == 0)
    {
      v97 = [(CRLWPEditorHelper *)v100 editorController];
      v104[0] = _NSConcreteStackBlock;
      v104[1] = 3221225472;
      v104[2] = sub_1003072A0;
      v104[3] = &unk_1014ECF00;
      v104[4] = v100;
      id v7 = v7;
      id v105 = v7;
      [v97 performBlockAfterSettingSelection:v104];
    }
  }
LABEL_4:

  return v7;
}

- (void)p_selection:(id)a3 toGlyphRange:(id *)a4
{
  id v6 = a3;
  a4->BOOL var6 = [v6 isInsertionPoint];
  id v7 = (char *)[v6 rawRange];
  uint64_t v8 = (uint64_t)v7;
  if (a4->var6)
  {
    a4->var7 = 0;
    p_var7 = &a4->var7;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    id v10 = v7;
  }
  else
  {
    id v10 = (char *)[v6 end] - 1;
    a4->var7 = 0;
    p_var7 = &a4->var7;
    BOOL var6 = a4->var6;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    if (!var6) {
      goto LABEL_6;
    }
  }
  if ([v6 caretAffinity] == (id)1)
  {
    id v12 = [v6 leadingEdge];
    goto LABEL_7;
  }
LABEL_6:
  id v12 = 0;
LABEL_7:
  var0 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:v8 column:&v30 eol:v12];
  a4->var0 = var0;
  char v14 = v12 ^ 1;
  if (var0) {
    char v14 = 1;
  }
  if ((v14 & 1) == 0)
  {
    var0 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:v8 - 1 column:&v30 eol:1];
    a4->var0 = var0;
  }
  unint64_t v15 = var0;
  if (!a4->var6)
  {
    unint64_t v15 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", v10, &v29, [v6 caretAffinity] == (id)1);
    var0 = a4->var0;
  }
  a4->var1 = v15;
  if (var0)
  {
    if (*((void *)var0 + 1))
    {
      if (a4->var6)
      {
        uint64_t v16 = *((void *)var0 + 3);
        unint64_t v17 = &xmmword_101176F48;
        if (v16 >= 0) {
          unint64_t v17 = (long long *)var0;
        }
        if (v8 == *(void *)v17 + *((void *)v17 + 1)) {
          uint64_t v18 = ((unint64_t)v16 >> 12) & 1;
        }
        else {
          LODWORD(v18) = sub_100159174((long long *)var0, v8) == 1;
        }
        if (v18 == [v6 leadingEdge])
        {
          BOOL v22 = a4->var0;
          int v23 = [(CRLWPEditorHelper *)self editor];
          uint64_t v24 = [v23 storage];
          uint64_t v8 = sub_10015C1D4((uint64_t)v22, v8, 2, v24);
        }
        if (v8 == 0x7FFFFFFFFFFFFFFFLL
          || ([(CRLWPEditorHelper *)self editor],
              int v25 = objc_claimAutoreleasedReturnValue(),
              [v25 storage],
              uint64_t v26 = objc_claimAutoreleasedReturnValue(),
              id v27 = [v26 length],
              v26,
              v25,
              (id)v8 == v27))
        {
          uint64_t v8 = sub_1001590D0((uint64_t)a4->var0);
          BOOL *p_var7 = 1;
        }
        unint64_t v28 = sub_10015A7EC((uint64_t)a4->var0, v8);
        a4->unint64_t var2 = v28;
        a4->var3 = v8;
        a4->var4 = v28;
        a4->var5 = v8;
      }
      else if (v15)
      {
        a4->unint64_t var2 = sub_10015A7EC((uint64_t)var0, v8);
        unint64_t v20 = sub_10015A7EC((uint64_t)a4->var1, (unint64_t)v10);
        a4->var3 = v8;
        a4->var4 = v20;
        a4->var5 = (unint64_t)v10;
        if (a4->var0 == a4->var1)
        {
          unint64_t var2 = a4->var2;
          if (var2 >= v20 != (*((unsigned char *)a4->var0 + 25) & 0x10) >> 4)
          {
            a4->unint64_t var2 = v20;
            a4->var3 = (unint64_t)v10;
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
      if ((*((void *)var0 + 3) & 0x1000) != 0) {
        unint64_t v19 = v8 - 1;
      }
      else {
        unint64_t v19 = v8;
      }
      a4->var3 = v19;
      a4->var5 = v8 - 1;
    }
  }
}

- (unint64_t)p_leftCharForInsertion:(id *)a3
{
  var0 = a3->var0;
  id v6 = [(CRLWPEditorHelper *)self editor];
  id v7 = [v6 storage];

  unint64_t var3 = a3->var3;
  if (*((void *)var0 + 1))
  {
    BOOL var7 = a3->var7;
    id v10 = (id)a3->var3;
    if (!var7) {
      id v10 = (id)sub_10015C1D4((uint64_t)var0, var3, 3, v7);
    }
    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = *((void *)var0 + 3);
      if ((v11 & 0x1000) != 0)
      {
        id v13 = [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:var3 leadingEdge:0 inDirection:3 skipAnchors:1];
      }
      else
      {
        if (!var3)
        {
          id v10 = 0;
          goto LABEL_15;
        }
        if (v11 < 0) {
          id v12 = &xmmword_101176F48;
        }
        else {
          id v12 = (long long *)var0;
        }
        id v13 = [v7 previousCharacterIndex:*(void *)v12];
      }
    }
    else
    {
      if (v10 != [v7 characterCount])
      {
LABEL_15:
        unint64_t var3 = (unint64_t)v10;
        goto LABEL_16;
      }
      id v13 = [v7 previousCharacterIndex:v10];
    }
    id v10 = v13;
    goto LABEL_15;
  }
LABEL_16:

  return var3;
}

- (_NSRange)adjustVisualSelection:(id)a3 withOtherSelection:(id)a4 outLeadingEdge:(BOOL *)a5 outCaretAffinity:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = objc_opt_class();
  id v13 = [(CRLWPEditorHelper *)self textSource];
  v53 = sub_1002469D0(v12, v13);

  unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v15 = 0;
  if (a5) {
    *a5 = 1;
  }
  if (a6) {
    *a6 = 0;
  }
  uint64_t v16 = [(CRLWPEditorHelper *)self calculateVisualRunsFromSelection:v10 updateControllerSelection:0];

  unint64_t v17 = [(CRLWPEditorHelper *)self calculateVisualRunsFromSelection:v11 updateControllerSelection:0];

  [(CRLWPEditorHelper *)self p_selection:v16 toGlyphRange:&v61];
  [(CRLWPEditorHelper *)self p_selection:v17 toGlyphRange:&v54];
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqzq_s64(v61), (int32x4_t)vceqzq_s64(v54)))) & 1) == 0)
  {
    if (v63 == v56 && v65 == v58 && v66 == v60)
    {
      if (a5) {
        *a5 = [v16 leadingEdge];
      }
      if (a6) {
        *a6 = (unint64_t)[v16 caretAffinity];
      }
      unint64_t v14 = (unint64_t)[v16 rawRange];
      NSUInteger v15 = v18;
      goto LABEL_144;
    }
    if ([v16 isInsertionPoint])
    {
      if (![v17 isInsertionPoint])
      {
        if (v61.i64[0] == v54.i64[0])
        {
          if (v62 >= v55)
          {
            unint64_t v35 = [(CRLWPEditorHelper *)self p_leftCharForInsertion:&v61];
            uint64_t v36 = &v56;
          }
          else
          {
            unint64_t v35 = v63;
            uint64_t v36 = &v58;
          }
          unint64_t v45 = *v36;
          if (v35 >= v45) {
            unint64_t v19 = v45;
          }
          else {
            unint64_t v19 = v35;
          }
          if (v35 <= v45) {
            unint64_t v32 = v45;
          }
          else {
            unint64_t v32 = v35;
          }
          goto LABEL_119;
        }
        unint64_t v32 = v63;
        unint64_t v19 = v56;
        uint64_t v33 = *(void *)(v61.i64[0] + 24);
        if (v63 >= v56)
        {
          if ((v33 & 0x1000) != 0) {
            goto LABEL_112;
          }
          goto LABEL_51;
        }
        if ((v33 & 0x1000) != 0) {
          unint64_t v32 = [(CRLWPEditorHelper *)self p_leftCharForInsertion:&v61];
        }
        unint64_t v19 = v32;
        unint64_t v32 = v58;
LABEL_112:
        if (v19 > v32)
        {
          id v46 = [v53 nextCharacterIndex:v19];
          if (v32 <= (unint64_t)v46) {
            unint64_t v47 = (unint64_t)v46;
          }
          else {
            unint64_t v47 = v32;
          }
          if (v32 >= (unint64_t)v46) {
            unint64_t v14 = (unint64_t)v46;
          }
          else {
            unint64_t v14 = v32;
          }
LABEL_143:
          NSUInteger v15 = v47 - v14;
          goto LABEL_144;
        }
LABEL_119:
        id v48 = [v53 nextCharacterIndex:v32];
        if (v19 <= (unint64_t)v48) {
          unint64_t v47 = (unint64_t)v48;
        }
        else {
          unint64_t v47 = v19;
        }
        if (v19 >= (unint64_t)v48) {
          unint64_t v14 = (unint64_t)v48;
        }
        else {
          unint64_t v14 = v19;
        }
        goto LABEL_143;
      }
      if (v61.i64[0] != v54.i64[0])
      {
        unint64_t v19 = v63;
        if (v63 < v56)
        {
          if ((*(unsigned char *)(v61.i64[0] + 25) & 0x10) != 0)
          {
            unint64_t v20 = [(CRLWPEditorHelper *)self p_leftCharForInsertion:&v61];
          }
          else
          {
            if (!v66) {
              goto LABEL_100;
            }
            unint64_t v20 = [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:v63 leadingEdge:0 inDirection:2 skipAnchors:1 useLeadingEdgeOfNextLine:1];
          }
          unint64_t v19 = v20;
LABEL_100:
          if ((*(unsigned char *)(v54.i64[0] + 25) & 0x10) != 0)
          {
            unint64_t v32 = v56;
            if (!v60) {
              goto LABEL_112;
            }
            unint64_t v38 = [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:v56 leadingEdge:0 inDirection:2 skipAnchors:1 useLeadingEdgeOfNextLine:1];
          }
          else
          {
            unint64_t v38 = [(CRLWPEditorHelper *)self p_leftCharForInsertion:&v54];
          }
          goto LABEL_111;
        }
        if ((*(unsigned char *)(v54.i64[0] + 25) & 0x10) != 0)
        {
          unint64_t v37 = [(CRLWPEditorHelper *)self p_leftCharForInsertion:&v54];
        }
        else
        {
          if (!v60)
          {
            unint64_t v19 = v56;
            goto LABEL_104;
          }
          unint64_t v37 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:](self, "charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:");
        }
        unint64_t v19 = v37;
LABEL_104:
        if ((*(unsigned char *)(v61.i64[0] + 25) & 0x10) == 0)
        {
LABEL_51:
          unint64_t v38 = [(CRLWPEditorHelper *)self p_leftCharForInsertion:&v61];
LABEL_111:
          unint64_t v32 = v38;
          goto LABEL_112;
        }
        unint64_t v32 = v63;
        if (v63 && v66)
        {
          unint64_t v38 = sub_1001CBAAC(v63, v53);
          goto LABEL_111;
        }
        goto LABEL_112;
      }
      if (v62 <= v55)
      {
        unint64_t v32 = v63;
        if (!v66)
        {
          unint64_t v44 = [(CRLWPEditorHelper *)self p_leftCharForInsertion:&v54];
LABEL_85:
          if (v32 >= v44) {
            unint64_t v19 = v44;
          }
          else {
            unint64_t v19 = v32;
          }
          if (v32 <= v44) {
            unint64_t v32 = v44;
          }
          goto LABEL_119;
        }
      }
      else
      {
        unint64_t v32 = [(CRLWPEditorHelper *)self p_leftCharForInsertion:&v61];
      }
      unint64_t v44 = v56;
      goto LABEL_85;
    }
    uint64_t v21 = [v16 visualRanges];
    if ([v21 containsCharacterAtIndex:v56])
    {
      BOOL v22 = [v16 visualRanges];
      unsigned int v23 = [v22 containsCharacterAtIndex:v58];

      if (v23)
      {
        unint64_t v24 = v56;
        id v25 = [v16 superRange];
        if (v24 <= (unint64_t)v25 + (v26 >> 1))
        {
          unint64_t v30 = v56;
          id v31 = [v53 nextCharacterIndex:v65];
LABEL_137:
          if (v30 <= (unint64_t)v31) {
            unint64_t v47 = (unint64_t)v31;
          }
          else {
            unint64_t v47 = v30;
          }
          if (v30 >= (unint64_t)v31) {
            unint64_t v14 = (unint64_t)v31;
          }
          else {
            unint64_t v14 = v30;
          }
          goto LABEL_143;
        }
        id v27 = (long long *)v54.i64[0];
        unint64_t v28 = (long long *)v61.i64[0];
        if (v54.i64[0] != v61.i64[0])
        {
          if (*(uint64_t *)(v61.i64[0] + 24) < 0) {
            unint64_t v28 = &xmmword_101176F48;
          }
          unint64_t v29 = *(void *)v28;
          if (*(uint64_t *)(v54.i64[0] + 24) < 0) {
            id v27 = &xmmword_101176F48;
          }
          unint64_t v30 = v63;
          if (v29 <= *(void *)v27) {
            id v31 = [v53 nextCharacterIndex:[self p_leftCharForInsertion:&v54]];
          }
          else {
            id v31 = [v53 nextCharacterIndex:v56];
          }
          goto LABEL_137;
        }
        uint64_t v49 = *(void *)(v54.i64[0] + 24);
        id v50 = (id)v56;
        if ((v49 & 0x1000) != 0)
        {
          id v50 = [v53 nextCharacterIndex:v56];
          uint64_t v49 = *(void *)(v54.i64[0] + 24);
        }
        if ((v49 & 0x1000) == 0 && v60) {
          id v50 = [v53 nextCharacterIndex:v56];
        }
        if (v63 <= (unint64_t)v50) {
          unint64_t v43 = (unint64_t)v50;
        }
        else {
          unint64_t v43 = v63;
        }
        if (v63 >= (unint64_t)v50) {
          unint64_t v14 = (unint64_t)v50;
        }
        else {
          unint64_t v14 = v63;
        }
LABEL_82:
        NSUInteger v15 = v43 - v14;
        goto LABEL_144;
      }
    }
    else
    {
    }
    if (v54.i64[0] == v61.i64[0])
    {
      if ((*(unsigned char *)(v54.i64[0] + 25) & 0x10) != 0)
      {
        if (v55 < v62) {
          goto LABEL_39;
        }
      }
      else if (v55 >= v62)
      {
        goto LABEL_39;
      }
    }
    else if (v56 > v63)
    {
LABEL_39:
      unint64_t v34 = v63;
      goto LABEL_58;
    }
    if (v59 && (*(unsigned char *)(v54.i64[0] + 25) & 0x10) != 0) {
      unint64_t v34 = [(CRLWPEditorHelper *)self p_leftCharForInsertion:&v54];
    }
    else {
      unint64_t v34 = v56;
    }
LABEL_58:
    if (v54.i64[1] == v61.i64[1])
    {
      if ((*(unsigned char *)(v54.i64[1] + 25) & 0x10) != 0)
      {
        if (v57 > v64) {
          goto LABEL_60;
        }
      }
      else if (v57 < v64)
      {
        goto LABEL_60;
      }
    }
    else if (v58 < v65)
    {
LABEL_60:
      unint64_t v39 = v65;
      goto LABEL_70;
    }
    if (v59)
    {
      if ((*(unsigned char *)(v54.i64[0] + 25) & 0x10) != 0) {
        unint64_t v39 = v56;
      }
      else {
        unint64_t v39 = [(CRLWPEditorHelper *)self p_leftCharForInsertion:&v54];
      }
    }
    else
    {
      unint64_t v39 = v58;
    }
LABEL_70:
    if (v34 <= v39) {
      unint64_t v40 = v39;
    }
    else {
      unint64_t v40 = v34;
    }
    id v41 = [v53 nextCharacterIndex:v40];
    if (v34 >= v39) {
      unint64_t v42 = v39;
    }
    else {
      unint64_t v42 = v34;
    }
    if (v42 <= (unint64_t)v41) {
      unint64_t v43 = (unint64_t)v41;
    }
    else {
      unint64_t v43 = v42;
    }
    if (v42 >= (unint64_t)v41) {
      unint64_t v14 = (unint64_t)v41;
    }
    else {
      unint64_t v14 = v42;
    }
    goto LABEL_82;
  }
LABEL_144:

  NSUInteger v51 = v14;
  NSUInteger v52 = v15;
  result.NSUInteger length = v52;
  result.NSUInteger location = v51;
  return result;
}

- (void)p_adjustSelection:(id)a3 withOtherSelection:(id)a4 textSelectionGranularity:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 isValid] && objc_msgSend(v8, "isValid"))
  {
    [v7 superRange];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10030834C;
    v49[3] = &unk_1014ECF28;
    id v7 = v7;
    id v50 = v7;
    id v9 = v8;
    id v51 = v9;
    id v46 = objc_retainBlock(v49);
    if ([v9 type] == (id)7 && !objc_msgSend(v7, "type"))
    {
      id v10 = [(CRLWPEditorHelper *)self logicalToVisualSelection:v7];

      uint64_t v11 = [(CRLWPEditorHelper *)self calculateVisualRunsFromSelection:v10 updateControllerSelection:0];

      id v7 = (id)v11;
    }
    if ([v9 type] == (id)7 && objc_msgSend(v7, "type") == (id)7)
    {
      unsigned __int8 v48 = 1;
      uint64_t v47 = 0;
      id v12 = [(CRLWPEditorHelper *)self adjustVisualSelection:v7 withOtherSelection:v9 outLeadingEdge:&v48 outCaretAffinity:&v47];
      uint64_t v45 = v13;
      id v14 = v12;
      if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v15 = ((uint64_t (*)(void))v46[2])();
        uint64_t v45 = v16;
        id v14 = (id)v15;
      }
      unint64_t v17 = [(CRLWPEditorHelper *)self selection];
      if ([v17 isValid])
      {
        NSUInteger v18 = [(CRLWPEditorHelper *)self selection];
        id v19 = [v18 range];
        uint64_t v21 = v20;

        if (v19 == v14 && v21 == v45)
        {
          id v22 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {
      }
      id v44 = objc_alloc([(CRLWPEditorHelper *)self wpSelectionClass]);
      uint64_t v43 = v47;
      int v31 = v48;
      uint64_t v32 = objc_opt_class();
      uint64_t v33 = [(CRLWPEditorHelper *)self textSource];
      unint64_t v34 = sub_1002469D0(v32, v33);
      LOBYTE(v42) = v31 != 0;
      id v22 = [v44 initWithType:7 range:v14 styleInsertionBehavior:v45 caretAffinity:0 smartFieldRange:v43 leadingEdge:0x7FFFFFFFFFFFFFFFLL storage:v42];

      if (!v22) {
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v23 = ((uint64_t (*)(void))v46[2])();
      uint64_t v25 = v24;
      unint64_t v26 = [(CRLWPEditorHelper *)self selection];
      if ([v26 isValid])
      {
        id v27 = [(CRLWPEditorHelper *)self selection];
        id v28 = [v27 range];
        uint64_t v30 = v29;

        if (v28 == (id)v23 && v30 == v25)
        {
          id v22 = 0;
          goto LABEL_25;
        }
      }
      else
      {
      }
      id v22 = [objc_alloc([self wpSelectionClass]) initWithRange:v23, v25];
      if (!v22) {
        goto LABEL_25;
      }
    }
    BOOL selectionLastModifiedWithKeyboard = self->_selectionLastModifiedWithKeyboard;
    uint64_t v36 = [(CRLWPEditorHelper *)self editorController];
    unint64_t v37 = [(CRLWPEditorHelper *)self editor];
    [v36 setSelection:v22 forEditor:v37 withFlags:8];

    if (selectionLastModifiedWithKeyboard)
    {
      unint64_t v38 = [(CRLWPEditorHelper *)self editorController];
      unint64_t v39 = [v38 selectionPath];
      unint64_t v40 = [v39 selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:v9];

      id v41 = [(CRLWPEditorHelper *)self interactiveCanvasController];
      [v41 scrollToSelectionPath:v40 scrollOptions:1];
    }
    goto LABEL_25;
  }
LABEL_26:
}

- (unint64_t)p_adjustedCharIndexForWordTestingFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 forDirection:(int64_t)a5
{
  int v6 = a4;
  unint64_t v7 = a3;
  BOOL v28 = a4;
  if ((unint64_t)a5 < 2)
  {
    if (!a4)
    {
      id v14 = [(CRLWPEditorHelper *)self textSource];
      unint64_t v7 = (unint64_t)[v14 nextCharacterIndex:v7];
    }
    if (!a5)
    {
      uint64_t v23 = [(CRLWPEditorHelper *)self textSource];
      unint64_t v7 = (unint64_t)[v23 charIndexRemappedFromStorage:v7];

      return v7;
    }
    if (a5 != 1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v15 = [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:v7 inDirection:1];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL || v15 == v7) {
      unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v7 = v15;
    }
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ECF88);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109D130();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ECFA8);
      }
      unint64_t v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      NSUInteger v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:]");
      id v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:1283 isFatal:0 description:"Should not have received NSNotFound."];

      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if ((unint64_t)(a5 - 2) > 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECFC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109D020();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECFE8);
    }
    uint64_t v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:]");
    id v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:1295 isFatal:0 description:"illegal direction"];
  }
  else
  {
    unsigned int v9 = [(CRLWPEditorHelper *)self p_isLayoutLeftToRightAtCharIndex:a3];
    uint64_t v10 = 2;
    if (v9 != v6) {
      uint64_t v10 = 3;
    }
    if (v10 != a5)
    {
      unint64_t v11 = [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:v7 leadingEdge:&v28 inDirection:a5 skipAnchors:0];
      if (v11 == v7)
      {
        if (v28 == v6 || v7 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v7;
        }
        if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
          return v13;
        }
      }
      else
      {
        unint64_t v7 = v11;
        if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
          return v7;
        }
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ECF48);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109D0A8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ECF68);
      }
      uint64_t v24 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      uint64_t v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:]");
      unint64_t v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:1267 isFatal:0 description:"Should not have received NSNotFound."];

      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v7;
}

- (_NSRange)availableSelectionRangeForCharIndex:(unint64_t)a3
{
  uint64_t v4 = objc_opt_class();
  NSUInteger v5 = [(CRLWPEditorHelper *)self textSource];
  int v6 = sub_1002469D0(v4, v5);

  id v7 = [v6 copyWithMarkedText];
  id v8 = +[CRLTextRange textRangeForAllOf:v7];
  id v9 = [v8 nsRange];
  NSUInteger v11 = v10;

  NSUInteger v12 = (NSUInteger)v9;
  NSUInteger v13 = v11;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (unint64_t)charIndexMovingByWordFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL *)a4 inDirection:(int64_t)a5
{
  if (a4) {
    BOOL v9 = *a4;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v32 = v9;
  if ((unint64_t)a5 > 3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED088);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109D2C8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED0A8);
    }
    uint64_t v23 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:]");
    uint64_t v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v24 file:v25 lineNumber:1400 isFatal:0 description:"Unsupported direction"];

    unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
LABEL_35:
    if (!a4) {
      return result;
    }
    goto LABEL_36;
  }
  NSUInteger v10 = [(CRLWPEditorHelper *)self textSource];
  NSUInteger v11 = +[CRLTextRange textRangeForAllOf:v10];
  id v12 = [v11 nsRange];
  uint64_t v14 = v13;

  unint64_t v31 = a3;
  long long v30 = xmmword_101176F48;
  unint64_t v15 = [(CRLWPEditorHelper *)self p_adjustedCharIndexForWordTestingFromCharIndex:a3 leadingEdge:v32 forDirection:a5];
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_35;
  }
  long long v29 = xmmword_101176F48;
  CFTypeRef cf = [(CRLWPEditorHelper *)self createTokenizerForCharIndex:v15 outTokenizerRange:&v29];
  CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)cf);
  unint64_t v18 = -[CRLWPEditorHelper p_moveFromCharIndex:leadingEdge:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:](self, "p_moveFromCharIndex:leadingEdge:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:", &v31, &v32, &cf, &v29, a5, CurrentTokenRange.location, CurrentTokenRange.length, &v30, 7);
  if (CurrentTokenRange.location == 0x7FFFFFFFFFFFFFFFLL && !CurrentTokenRange.length || (unint64_t v19 = v31, v31 == a3))
  {
    if (v18 == 4 || v18 == 1) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v18 > 4 || ((1 << v18) & 0x16) == 0)
  {
LABEL_11:
    -[CRLWPEditorHelper p_moveFromCharIndex:leadingEdge:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:](self, "p_moveFromCharIndex:leadingEdge:tokenizerRef:tokenizerRange:direction:currentWordRange:newWordRange:reasonToStop:", &v31, &v32, &cf, &v29, a5, 0x7FFFFFFFFFFFFFFFLL, 0, &v30, 8);
LABEL_12:
    unint64_t v19 = v31;
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v19 >= (unint64_t)v12)
    {
      unint64_t v26 = (unint64_t)v12 + v14;
      a3 = v19;
      if (v19 <= v26) {
        goto LABEL_52;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED048);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109D240();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED068);
      }
      id v27 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      uint64_t v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:]");
      id v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:1392 isFatal:0 description:"Result beyond selection range max."];
      a3 = v26;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED008);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109D1B8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED028);
      }
      uint64_t v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      uint64_t v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper charIndexMovingByWordFromCharIndex:leadingEdge:inDirection:]");
      id v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:1389 isFatal:0 description:"Result beyond selection range min."];
      a3 = (unint64_t)v12;
    }
  }
LABEL_52:
  unint64_t result = a3;
  if (!a4) {
    return result;
  }
LABEL_36:
  *a4 = v32;
  return result;
}

- (const)p_lineFragmentForCharIndex:(unint64_t)a3 column:(id *)a4 eol:(BOOL)a5
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  *a4 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003094E0;
  v7[3] = &unk_1014ED0D0;
  v7[4] = &v8;
  v7[5] = a4;
  [(CRLWPEditorHelper *)self withLineFragmentForCharIndex:a3 eol:a5 performBlock:v7];
  NSUInteger v5 = (const void *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)p_withLineFragmentsForLogicalLineContainingCharIndex:(unint64_t)a3 eol:(BOOL)a4 performBlock:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100309620;
  v10[3] = &unk_1014ED0F8;
  id v11 = a5;
  id v12 = &v13;
  id v8 = v11;
  [(CRLWPEditorHelper *)self p_withLineIndexForCharIndex:a3 eol:v5 performBlock:v10];
  LOBYTE(v5) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v5;
}

- (unint64_t)p_lastVisibleCharIndexForCharIndex:(unint64_t)a3
{
  uint64_t v3 = [(CRLWPEditorHelper *)self layout];
  uint64_t v10 = sub_100246AC8(v3, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLWPLayoutTarget);

  if (v10)
  {
    id v11 = [v10 columns];
    id v12 = +[CRLWPColumn rangeOfColumns:v11];
    unint64_t v14 = (unint64_t)v12 + v13;

    if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_14;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED118);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109D350();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED138);
    }
    uint64_t v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    char v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_lastVisibleCharIndexForCharIndex:]");
    unint64_t v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 1472, 0, "invalid nil value for '%{public}s'", "layout");
  }
  unint64_t v14 = 0;
LABEL_14:

  return v14;
}

- (unint64_t)p_lineIndexForMovingCharIndex:(unint64_t)a3 column:(id *)a4 up:(BOOL)a5 atStart:(BOOL)a6 eol:(BOOL *)a7
{
  BOOL v7 = a5;
  *a4 = 0;
  uint64_t v36 = 0;
  unint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x4012000000;
  BOOL v32 = sub_100309FA8;
  uint64_t v33 = nullsub_38;
  unint64_t v34 = "";
  long long v35 = xmmword_101176F48;
  uint64_t v25 = 0;
  unint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  unint64_t v28 = 0x8000000000000000;
  BOOL v10 = *a7;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100309FB8;
  v22[3] = &unk_1014ED160;
  v22[8] = a3;
  v22[9] = a7;
  v22[4] = self;
  v22[5] = &v29;
  BOOL v23 = a5;
  v22[6] = &v25;
  v22[7] = &v36;
  v22[10] = a4;
  BOOL v24 = a6;
  [(CRLWPEditorHelper *)self p_withLayoutTargetForCharIndex:a3 eolAffinity:v10 performBlock:v22];
  unint64_t v11 = v37[3];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v12 = v30[6];
    uint64_t v13 = v30[7];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL || v13)
    {
      if (v7)
      {
        unint64_t v14 = [(CRLWPEditorHelper *)self textSource];
        unint64_t v15 = sub_1001CAB34(v12, v14);

        if ((v26[3] & 0x300) == 0x100) {
          unint64_t v15 = v30[6];
        }
      }
      else
      {
        char v16 = [(CRLWPEditorHelper *)self textSource];
        unint64_t v15 = sub_1001CB3C4(v13 + v12, v16);
        unint64_t v17 = [(CRLWPEditorHelper *)self textSource];
        id v18 = [v17 length];
        if ((unint64_t)v18 < v15) {
          unint64_t v15 = (unint64_t)v18;
        }
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10030A524;
      v20[3] = &unk_1014ED188;
      BOOL v21 = v7;
      v20[4] = &v36;
      v20[5] = v15;
      v20[6] = a4;
      [(CRLWPEditorHelper *)self p_withLayoutTargetForCharIndex:v15 eolAffinity:v7 performBlock:v20];
      unint64_t v11 = v37[3];
    }
    else
    {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v36, 8);
  return v11;
}

- (void)p_withLineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4 performBlock:(id)a5
{
  BOOL v5 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10030A768;
  v9[3] = &unk_1014ED1B0;
  BOOL v12 = a4;
  id v10 = a5;
  unint64_t v11 = a3;
  id v8 = v10;
  [(CRLWPEditorHelper *)self p_withLayoutTargetForCharIndex:a3 eolAffinity:v5 performBlock:v9];
}

- (_TtC8Freeform11CRLWPLayout)layout
{
  layout = self->_layout;
  if (layout)
  {
    uint64_t v3 = layout;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    BOOL v7 = [(CRLWPEditorHelper *)self textSource];
    uint64_t v8 = objc_opt_class();
    unint64_t v14 = sub_100246DEC(v7, v8, 1, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
    unint64_t v15 = [v6 layoutForInfo:v14];
    sub_1002469D0(v5, v15);
    uint64_t v3 = (_TtC8Freeform11CRLWPLayout *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)p_withLayoutTargetForCharIndex:(unint64_t)a3 eolAffinity:(BOOL)a4 performBlock:(id)a5
{
  unint64_t v14 = (void (**)(id, void *))a5;
  uint64_t v6 = [(CRLWPEditorHelper *)self layout];
  uint64_t v13 = sub_100246AC8(v6, 1, v7, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___CRLWPLayoutTarget);

  v14[2](v14, v13);
}

- (void)withLineFragmentForCharIndex:(unint64_t)a3 eol:(BOOL)a4 performBlock:(id)a5
{
  BOOL v5 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10030AB94;
  v9[3] = &unk_1014ED218;
  id v10 = a5;
  id v8 = v10;
  [(CRLWPEditorHelper *)self p_withLineIndexForCharIndex:a3 eol:v5 performBlock:v9];
}

- (unint64_t)caretCharIndexForLayoutOrderCharIndex:(unint64_t)a3 inDirection:(int64_t)a4
{
  unint64_t v4 = a3;
  if ((unint64_t)a4 >= 2)
  {
    if ((unint64_t)(a4 - 2) > 1)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED238);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109D46C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED258);
      }
      char v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      unint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper caretCharIndexForLayoutOrderCharIndex:inDirection:]");
      id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:1707 isFatal:0 description:"Unsupported vertical character direction"];
    }
    else
    {
      unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
        return result;
      }
      id v7 = [(CRLWPEditorHelper *)self availableSelectionRangeForCharIndex:a3];
      uint64_t v9 = v8;
      id v10 = [(CRLWPEditorHelper *)self interactiveCanvasController];
      [v10 layoutIfNeeded];

      v19[0] = 0;
      uint64_t v11 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:v4 column:v19 eol:0];
      if (v11)
      {
        uint64_t v12 = [(CRLWPEditorHelper *)self editor];
        uint64_t v13 = [v12 storage];
        unint64_t v14 = sub_10015BAAC((uint64_t)v11, v4, v13);

        if (v14 <= (unint64_t)v7 + v9 && v14 >= (unint64_t)v7) {
          return v14;
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
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED278);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109D4F4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED298);
      }
      char v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      unint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_layoutOrderCharIndexForCaretCharIndex:inDirection:]");
      id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:1748 isFatal:0 description:"Unsupported vertical character direction"];
    }
    else
    {
      unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
        return result;
      }
      id v7 = [(CRLWPEditorHelper *)self availableSelectionRangeForCharIndex:a3];
      uint64_t v9 = v8;
      id v10 = [(CRLWPEditorHelper *)self interactiveCanvasController];
      [v10 layoutIfNeeded];

      v19[0] = 0;
      uint64_t v11 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:v4 column:v19 eol:0];
      if (v11)
      {
        uint64_t v12 = [(CRLWPEditorHelper *)self editor];
        uint64_t v13 = [v12 storage];
        unint64_t v14 = sub_10015B4A8((uint64_t)v11, v4, v13);

        if (v14 <= (unint64_t)v7 + v9 && v14 >= (unint64_t)v7) {
          return v14;
        }
      }
    }
  }
  return v4;
}

- (unint64_t)charIndexByMovingPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5 preferPosition:(double *)a6
{
  return [(CRLWPEditorHelper *)self p_charIndexByMovingPosition:a3 toBoundary:a4 inDirection:a5 preferPosition:a6 outEolAffinity:0];
}

- (unint64_t)p_charIndexByMovingPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5 preferPosition:(double *)a6 outEolAffinity:(unint64_t *)a7
{
  id v12 = a3;
  id v13 = [v12 location];
  unsigned __int8 v25 = [v12 eolAffinity];
  unsigned __int8 v24 = 1;
  if (a4) {
    unint64_t v14 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", [v12 location], &v25, a4, a5, a6, &v24);
  }
  else {
    unint64_t v14 = -[CRLWPEditorHelper caretCharIndexForLayoutOrderCharIndex:inDirection:](self, "caretCharIndexForLayoutOrderCharIndex:inDirection:", -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", -[CRLWPEditorHelper p_layoutOrderCharIndexForCaretCharIndex:inDirection:](self, "p_layoutOrderCharIndexForCaretCharIndex:inDirection:", [v12 location], a5), a5), a5);
  }
  unint64_t v15 = v14;
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = v25;
    if (a7) {
      *a7 = v25;
    }
    unint64_t v17 = [CRLWPSelection alloc];
    int v18 = v24;
    unint64_t v19 = [(CRLWPEditorHelper *)self editor];
    uint64_t v20 = [v19 storage];
    LOBYTE(v23) = v18 != 0;
    BOOL v21 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v17, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, v15, 0, 0, v16, 0x7FFFFFFFFFFFFFFFLL, 0, v23, v20);

    id v13 = [(CRLWPSelection *)v21 leadingCharIndex];
  }

  return (unint64_t)v13;
}

- (unint64_t)charIndexForBeginningOfLineFromCharIndex:(unint64_t)a3
{
  char v6 = 0;
  uint64_t v5 = 0;
  char v4 = 1;
  return [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:a3 withEolAffinity:&v6 toBoundary:4 inDirection:1 preferPosition:&v5 isLeadingEdge:&v4];
}

- (unint64_t)charIndexForEndOfLineFromCharIndex:(unint64_t)a3
{
  char v6 = 0;
  uint64_t v5 = 0;
  char v4 = 0;
  return [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:a3 withEolAffinity:&v6 toBoundary:4 inDirection:0 preferPosition:&v5 isLeadingEdge:&v4];
}

- (unint64_t)p_charIndexByMovingCharIndex:(unint64_t)a3 withEolAffinity:(BOOL *)a4 toBoundary:(int64_t)a5 inDirection:(int64_t)a6 preferPosition:(double *)a7 isLeadingEdge:(BOOL *)a8
{
  unint64_t v14 = (char *)-[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:");
  uint64_t v16 = v15;
  unint64_t v17 = [(CRLWPEditorHelper *)self textSource];
  uint64_t v108 = sub_100246AC8(v17, 1, v18, v19, v20, v21, v22, v23, (uint64_t)&OBJC_PROTOCOL___CRLWPTextSource);
  unsigned __int8 v24 = &v14[v16];

  if ((unint64_t)&v14[v16] < a3) {
    goto LABEL_2;
  }
  CFIndex v27 = 0;
  switch(a5)
  {
    case 0:
      unint64_t v29 = [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:a3 leadingEdge:a8 inDirection:a6 skipAnchors:1];
      goto LABEL_50;
    case 1:
      unint64_t v29 = [(CRLWPEditorHelper *)self charIndexMovingByWordFromCharIndex:a3 leadingEdge:a8 inDirection:a6];
LABEL_50:
      unint64_t v25 = v29;
      goto LABEL_51;
    case 2:
      if ((unint64_t)a6 >= 2)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ED360);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109D6D0();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ED380);
        }
        long long v35 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        uint64_t v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:]");
        unint64_t v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v36 file:v37 lineNumber:2066 isFatal:0 description:"sentence movement in layout direction is not supported"];
      }
      if (a8) {
        *a8 = 1;
      }
      uint64_t v38 = (char *)[v108 textRangeForParagraphAtCharIndex:a3];
      NSUInteger v39 = (NSUInteger)v38;
      NSUInteger v41 = v40;
      NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
      NSUInteger length = 0;
      if (a6 == 1 && v38)
      {
        id v44 = [v108 textRangeForParagraphAtCharIndex:v38 - 1];
LABEL_44:
        NSUInteger location = (NSUInteger)v44;
        NSUInteger length = v45;
        goto LABEL_68;
      }
      if (!a6)
      {
        unint64_t v56 = [(CRLWPEditorHelper *)self textSource];
        BOOL v57 = v39 + v41 < (unint64_t)[v56 length];

        if (v57)
        {
          id v44 = [v108 textRangeForParagraphAtCharIndex:v41 + v39 + 1];
          goto LABEL_44;
        }
      }
LABEL_68:
      if (v39 != 0x7FFFFFFFFFFFFFFFLL || v41)
      {
        if (location != 0x7FFFFFFFFFFFFFFFLL || length)
        {
          v123.NSUInteger location = v39;
          v123.NSUInteger length = v41;
          v124.NSUInteger location = location;
          v124.NSUInteger length = length;
          NSRange v62 = NSUnionRange(v123, v124);
          NSUInteger location = v62.location;
          NSUInteger length = v62.length;
        }
        else
        {
          NSUInteger location = v39;
          NSUInteger length = v41;
        }
      }
      unint64_t v63 = [v108 string];
      v125.NSUInteger location = location;
      v125.NSUInteger length = length;
      unint64_t v64 = CFStringTokenizerCreate(kCFAllocatorDefault, v63, v125, 1uLL, 0);

      unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      CFIndex v27 = 0;
      CFStringTokenizerTokenType Token = CFStringTokenizerGoToTokenAtIndex(v64, a3);
      if (Token)
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v64);
        CFIndex v67 = CurrentTokenRange.location;
        CFIndex v68 = CurrentTokenRange.length;
        if ((a6 | 2) == 2 && CurrentTokenRange.location + CurrentTokenRange.length == (int)a3) {
          CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(v64);
        }
      }
      else
      {
        if ((a6 | 2) == 2)
        {
          CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(v64);
          CFIndex v68 = 0;
        }
        else
        {
          CFIndex v68 = 0;
          CFStringTokenizerTokenType Token = 0;
        }
        CFIndex v67 = -1;
      }
      if ((a6 | 2) == 3)
      {
        if (Token)
        {
          CFRange v73 = CFStringTokenizerGetCurrentTokenRange(v64);
          CFIndex v72 = v73.length;
          CFIndex v67 = v73.location;
          if (a3 > LODWORD(v73.location)) {
            goto LABEL_113;
          }
        }
        unint64_t v74 = a3;
        do
          unint64_t v75 = v74--;
        while (v75 > (unint64_t)v14 && !CFStringTokenizerGoToTokenAtIndex(v64, v74));
        if (v74 <= (unint64_t)v14)
        {
          unint64_t v25 = (unint64_t)v14;
          goto LABEL_118;
        }
LABEL_112:
        CFRange v76 = CFStringTokenizerGetCurrentTokenRange(v64);
        CFIndex v72 = v76.length;
        CFIndex v67 = v76.location;
LABEL_113:
        CFIndex v68 = v72;
        goto LABEL_114;
      }
      if (Token) {
        goto LABEL_112;
      }
      if (v24 == (char *)a3)
      {
        unint64_t v26 = (unint64_t)v24;
        CFIndex v27 = 0;
      }
LABEL_114:
      if (v67 != -1)
      {
        unint64_t v26 = v67;
        CFIndex v27 = v68;
      }
      unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_118:
      CFRelease(v64);
      goto LABEL_4;
    case 3:
      if (a8) {
        *a8 = 1;
      }
      id v46 = (char *)[v108 textRangeForParagraphAtCharIndex:a3];
      uint64_t v48 = v47;
      if (v47)
      {
        uint64_t v49 = [(CRLWPEditorHelper *)self textSource];
        unsigned int v50 = sub_1001CA284((uint64_t)[v49 characterAtIndex:&v46[v48 - 1]]);

        uint64_t v51 = v48 - v50;
      }
      else
      {
        uint64_t v51 = 0;
      }
      switch(a6)
      {
        case 0:
        case 2:
          if (&v46[v51] == (char *)a3 && &v46[v51] < v24)
          {
            char v59 = (char *)[v108 textRangeForParagraphAtCharIndex:a3 + 1];
            id v46 = v59;
            if (v60) {
              uint64_t v51 = v60 - sub_1001CA284((uint64_t)[v108 characterAtIndex:&v59[v60 - 1]]);
            }
            else {
              uint64_t v51 = 0;
            }
          }
          break;
        case 1:
        case 3:
          if (v46 == (char *)a3 && v46 > v14)
          {
            id v46 = (char *)[v108 textRangeForParagraphAtCharIndex:a3 - 1];
            uint64_t v51 = v61 - 1;
          }
          break;
        default:
          break;
      }
      unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
      if (v46 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        switch(a6)
        {
          case 0:
          case 2:
            unint64_t v25 = (unint64_t)&v46[v51];
            break;
          case 1:
          case 3:
            unint64_t v25 = (unint64_t)v46;
            break;
          default:
            break;
        }
      }
      unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      CFIndex v27 = 0;
      goto LABEL_4;
    case 4:
      if (a8) {
        *a8 = 1;
      }
      uint64_t v33 = [(CRLWPEditorHelper *)self interactiveCanvasController];
      [v33 layoutIfNeeded];

      if ((unint64_t)a6 < 4)
      {
        id v119 = 0;
        uint64_t v120 = &v119;
        uint64_t v121 = 0x2020000000;
        uint64_t v122 = 0x7FFFFFFFFFFFFFFFLL;
        BOOL v34 = *a4;
        v110[0] = _NSConcreteStackBlock;
        v110[1] = 3221225472;
        v110[2] = sub_10030C67C;
        v110[3] = &unk_1014ED300;
        int64_t v113 = a6;
        uint64_t v114 = a8;
        v112 = &v119;
        v110[4] = self;
        id v111 = v108;
        v115 = a4;
        uint64_t v116 = v14;
        unint64_t v117 = a3;
        unint64_t v25 = (unint64_t)&v14[v16];
        if ([(CRLWPEditorHelper *)self p_withLineFragmentsForLogicalLineContainingCharIndex:a3 eol:v34 performBlock:v110])
        {
          unint64_t v25 = (unint64_t)v120[3];
        }

        _Block_object_dispose(&v119, 8);
        goto LABEL_3;
      }
      if ((unint64_t)(a6 - 4) >= 2)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ED320);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109D604();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ED340);
        }
        uint64_t v69 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        v70 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:]");
        v71 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v70 file:v71 lineNumber:2008 isFatal:0 description:"Unsupported horizontal line direction"];

        goto LABEL_2;
      }
      unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      if (a7) {
        double v58 = *a7;
      }
      else {
        double v58 = NAN;
      }
      id v119 = 0;
      uint64_t v77 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:a3 column:&v119 eol:*a4];
      if (!v77)
      {
        unint64_t v25 = (unint64_t)v24;
        if (a6 == 4)
        {
          unint64_t v25 = [(CRLWPEditorHelper *)self p_lastVisibleCharIndexForCharIndex:a3];
          *a4 = 1;
        }
        goto LABEL_4;
      }
      id v118 = 0;
      unint64_t v78 = [(CRLWPEditorHelper *)self p_lineIndexForMovingCharIndex:a3 column:&v118 up:a6 == 4 atStart:v58 == 0.0 eol:a4];
      if (v78 > 0x7FFFFFFFFFFFFFFELL)
      {
        unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_51:
        unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_4;
      }
      [v118 frameBounds];
      double v80 = v58 + v79;
      char v81 = (double *)[v118 nearestLineFragmentWithSameVerticalPositionAs:v78 xPos:v80];
      unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      unsigned int v82 = v81;
      if (!v81)
      {
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014ED2B8);
        }
        v93 = off_10166B498;
        if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_149;
        }
        goto LABEL_55;
      }
      if (v81 == v77 || v118 == v119 && v77[6] == v81[6])
      {
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014ED2D8);
        }
        v93 = off_10166B498;
        if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_DEBUG))
        {
LABEL_149:
          sub_10109D68C(v93);
LABEL_2:
          unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_3:
          unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
          CFIndex v27 = 0;
          goto LABEL_4;
        }
LABEL_55:
        unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_4;
      }
      uint64_t v83 = *((void *)v81 + 3);
      if (*a4)
      {
        BOOL v84 = v83 < 0;
        v85 = &xmmword_101176F48;
        if (!v84) {
          v85 = (long long *)v81;
        }
        uint64_t v86 = *(void *)v85;
        uint64_t v87 = *((void *)v85 + 1);
        if (v87)
        {
          id v88 = [v108 characterAtIndex:v87 + v86 - 1];
          int v89 = (int)v88;
          unsigned int v90 = sub_1001CA284((uint64_t)v88);
          if (v89 == 8232) {
            uint64_t v91 = 1;
          }
          else {
            uint64_t v91 = v90;
          }
          uint64_t v92 = v87 - v91;
        }
        else
        {
          uint64_t v92 = 0;
        }
        unint64_t v25 = v92 + v86;
        goto LABEL_3;
      }
      if (a6 == 4)
      {
        id v94 = &xmmword_101176F48;
        if (v83 >= 0) {
          id v94 = (long long *)v81;
        }
        unint64_t v25 = *(void *)v94 + *((void *)v94 + 1);
      }
      else
      {
        v95 = &xmmword_101176F48;
        if (v83 >= 0) {
          v95 = (long long *)v81;
        }
        unint64_t v25 = *(void *)v95;
      }
      if (v83)
      {
        if ((v83 & 0x200) != 0)
        {
          BOOL v84 = v83 < 0;
          long long v107 = &xmmword_101176F48;
          if (!v84) {
            long long v107 = (long long *)v81;
          }
          unint64_t v25 = *(void *)v107;
        }
        else if ((v83 & 0x100) != 0)
        {
          v103 = &xmmword_101176F48;
          if (v83 >= 0) {
            v103 = (long long *)v81;
          }
          v106 = v103;
          uint64_t v104 = *(void *)v103;
          uint64_t v105 = *((void *)v106 + 1);
          unint64_t v25 = v104 + v105;
          if ((v83 & 0x800) != 0) {
            unint64_t v25 = sub_1001CAB34(v104 + v105, v108);
          }
        }
      }
      else
      {
        uint64_t v96 = sub_10015AD80((long long *)v81, 1, 0, 0, 0, v80);
        uint64_t v97 = v96;
        BOOL v98 = &xmmword_101176F48;
        if (*((uint64_t *)v82 + 3) >= 0) {
          BOOL v98 = (long long *)v82;
        }
        uint64_t v99 = *((void *)v98 + 1);
        if (v99)
        {
          unint64_t v25 = v96;
          if (v96 == *(void *)v98 + v99)
          {
            if ((char *)v96 != v24) {
              goto LABEL_172;
            }
            id v100 = [v108 characterAtIndex:v24 - 1];
            int v101 = (int)v100;
            unsigned int v102 = sub_1001CA284((uint64_t)v100) ^ 1;
            if (v101 == 8232) {
              LOBYTE(v102) = 0;
            }
            unint64_t v25 = (unint64_t)v24;
            unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
            if ((v102 & 1) == 0) {
LABEL_172:
            }
              unint64_t v25 = v97 - 1;
          }
        }
        else
        {
          unint64_t v25 = v96;
        }
      }
LABEL_4:
      switch(a6)
      {
        case 0:
        case 2:
          if (v26 <= a3) {
            CFIndex v28 = v27;
          }
          else {
            CFIndex v28 = 0;
          }
          unint64_t v25 = v28 + v26;
          break;
        case 1:
        case 3:
          if (v27 + v26 >= a3) {
            unint64_t v25 = v26;
          }
          else {
            unint64_t v25 = v27 + v26;
          }
          break;
        default:
          break;
      }
      if ((unint64_t)v24 >= v25) {
        long long v30 = (char *)v25;
      }
      else {
        long long v30 = v24;
      }
      if (v30 <= v14) {
        long long v30 = v14;
      }
      if (v25 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v31 = (unint64_t)v30;
      }

      return v31;
    case 5:
      if (a8) {
        *a8 = 1;
      }
      unint64_t v26 = (unint64_t)[(CRLWPEditorHelper *)self availableSelectionRangeForCharIndex:a3];
      CFIndex v27 = v52;
      goto LABEL_55;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED3A0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109D57C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED3C0);
      }
      v53 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      int64x2_t v54 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:]");
      unint64_t v55 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v54 file:v55 lineNumber:2136 isFatal:0 description:"Unsupported granularity"];

      goto LABEL_2;
  }
}

- (unint64_t)charIndexMovingByCharacterFromCharIndex:(unint64_t)a3 leadingEdge:(BOOL *)a4 inDirection:(int64_t)a5 skipAnchors:(BOOL)a6 useLeadingEdgeOfNextLine:(BOOL)a7
{
  BOOL v70 = a7;
  v71 = [(CRLWPEditorHelper *)self textSource];
  uint64_t v11 = (char *)[(CRLWPEditorHelper *)self availableSelectionRangeForCharIndex:a3];
  uint64_t v13 = v12;
  [(CRLWPEditorHelper *)self paragraphEnumeratorAtCharIndex:a3];
  CFIndex v72 = [(CRLWPEditorHelper *)self textSource];
  unint64_t v14 = (unint64_t)&v11[v13];
  int v15 = 1;
  switch(a5)
  {
    case 0:
      id v16 = [v72 charIndexMappedFromStorage:a3];
      if (v16 >= [v72 charIndexMappedFromStorage:v14])
      {
        a3 = (unint64_t)[v72 charIndexRemappedFromStorage:v14];
      }
      else
      {
        id v17 = [v72 charIndexMappedToStorage:v16];
        uint64_t v18 = [v71 string];
        id v19 = [v18 rangeOfComposedCharacterSequenceAtIndex:v17];
        uint64_t v21 = v20;

        a3 = (unint64_t)v19 + v21;
        if (a3 > v14)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014ED3E0);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10109D7E0();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014ED400);
          }
          uint64_t v22 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
          {
            +[CRLAssertionHandler packedBacktraceString];
            objc_claimAutoreleasedReturnValue();
            sub_1010663B0();
          }

          uint64_t v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:]");
          unsigned __int8 v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:2219 isFatal:0 description:"composed character extends past storage boundary"];
        }
      }
      goto LABEL_118;
    case 1:
      CFIndex v28 = (char *)[v72 charIndexMappedFromStorage:a3];
      if (v28 > [v72 charIndexMappedFromStorage:v11])
      {
        id v29 = [v72 charIndexMappedToStorage:v28 - 1];
        long long v30 = [v71 string];
        if (v29 >= [v30 length])
        {
          unint64_t v31 = [v71 string];
          id v32 = [v31 length];
        }
        else
        {
          unint64_t v31 = [v71 string];
          id v32 = [v31 rangeOfComposedCharacterSequenceAtIndex:v29];
        }
        a3 = (unint64_t)v32;
      }
      NSUInteger v40 = (char *)[v72 charIndexMappedToStorage:v28];
      if (v40 > v11)
      {
        id v41 = [v72 charIndexRemappedFromStorage:v40 - 1];
        uint64_t v42 = [v71 string];
        if (v41 >= [v42 length])
        {
          uint64_t v43 = [v71 string];
          id v44 = [v43 length];
        }
        else
        {
          uint64_t v43 = [v71 string];
          id v44 = [v43 rangeOfComposedCharacterSequenceAtIndex:v41];
        }
        unint64_t v45 = (unint64_t)v44;

        if (v45 < a3) {
          a3 = v45;
        }
      }
      goto LABEL_118;
    case 2:
      goto LABEL_26;
    case 3:
      int v15 = 0;
LABEL_26:
      uint64_t v33 = [(CRLWPEditorHelper *)self interactiveCanvasController];
      [v33 layoutIfNeeded];

      v74[0] = 0;
      BOOL v34 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:a3 column:v74 eol:0];
      if (!v34)
      {
        if (v15 == [v72 isWritingDirectionRightToLeftForParagraphAtCharIndex:a3])
        {
          if (!a3)
          {
            uint64_t v38 = 0;
            goto LABEL_48;
          }
          unint64_t v39 = sub_1001CAB34(a3, v72);
        }
        else
        {
          uint64_t v38 = (char *)a3;
          if ([v72 length] == (id)a3) {
            goto LABEL_48;
          }
          unint64_t v39 = sub_1001CB3C4(a3, v72);
        }
        uint64_t v38 = (char *)v39;
        goto LABEL_48;
      }
      if (v15) {
        uint64_t v35 = 2;
      }
      else {
        uint64_t v35 = 3;
      }
      uint64_t v36 = objc_opt_class();
      unint64_t v37 = sub_1002469D0(v36, v71);
      uint64_t v38 = (char *)sub_10015C1D4((uint64_t)v34, a3, v35, v37);

LABEL_48:
      if (a4) {
        BOOL v46 = v34 == 0;
      }
      else {
        BOOL v46 = 1;
      }
      int v47 = !v46;
      if (v38 == (char *)0x7FFFFFFFFFFFFFFFLL || v38 < v11 || (unint64_t)v38 > v14)
      {
        if (v47)
        {
          unsigned int v50 = *((uint64_t *)v34 + 3) < 0 ? &xmmword_101176F48 : v34;
          if (*(void *)v50 + *((void *)v50 + 1) > a3)
          {
            id v51 = (id)a3;
            int v69 = *a4;
            int v52 = sub_100159174(v34, a3) == 1;
            if (v15)
            {
              if (v69 == v52) {
                goto LABEL_85;
              }
            }
            else if (v69 != v52)
            {
              goto LABEL_85;
            }
            int64x2_t v54 = [(CRLWPEditorHelper *)self textSource];
            BOOL v68 = a3 < (unint64_t)[v54 length];

            if (v68)
            {
              id v55 = [v71 characterAtIndex:a3];
              int v56 = (int)v55;
              unsigned __int8 v57 = sub_1001CA284((uint64_t)v55);
              char v58 = v56 == 8232 ? 1 : v57;
              if ((v58 & 1) == 0)
              {
                *a4 = v69 ^ 1;
                goto LABEL_84;
              }
            }
          }
        }
LABEL_85:
        unsigned int v59 = v15 ^ [v71 isWritingDirectionRightToLeftForParagraphAtCharIndex:a3];
        if (v34)
        {
          uint64_t v60 = &xmmword_101176F48;
          if (*((uint64_t *)v34 + 3) >= 0) {
            uint64_t v60 = v34;
          }
          unint64_t v61 = *(void *)v60;
          uint64_t v62 = *((void *)v60 + 1);
          if (v59) {
            goto LABEL_89;
          }
        }
        else
        {
          uint64_t v62 = 0;
          unint64_t v61 = a3;
          if (v59)
          {
LABEL_89:
            if (v62 + v61 < v14 || v34 && (*((void *)v34 + 3) & 0x100000800) != 0)
            {
              if (v62) {
                uint64_t v38 = (char *)(v62 + v61);
              }
              else {
                uint64_t v38 = (char *)(v61 + 1);
              }
            }
            goto LABEL_100;
          }
        }
        if (v61 > (unint64_t)v11)
        {
          uint64_t v38 = (char *)[v71 previousCharacterIndex:];
          if (a4) {
            *a4 = 1;
          }
        }
LABEL_100:
        if (v38 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_101:
          id v51 = [v72 charIndexRemappedFromStorage:a3];
          goto LABEL_117;
        }
        unint64_t v63 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:v38 column:v74 eol:0];
        unint64_t v64 = v63;
        if (!v63)
        {
LABEL_114:
          if (v38 != (char *)0x7FFFFFFFFFFFFFFFLL && v38 >= v11)
          {
            id v51 = v38;
            if ((unint64_t)v38 <= v14) {
              goto LABEL_117;
            }
          }
          goto LABEL_101;
        }
        if (v70)
        {
          char v65 = v15 ^ 1;
          if (!v34) {
            char v65 = 1;
          }
          if ((v65 & 1) == 0 && ((v63[25] ^ *((unsigned __int8 *)v34 + 25)) & 0x10) == 0) {
            goto LABEL_108;
          }
        }
        else if (v15)
        {
LABEL_108:
          uint64_t v66 = sub_10015909C((uint64_t)v63);
LABEL_111:
          uint64_t v38 = (char *)v66;
          if (a4 && (*((void *)v64 + 3) & 0x4800) == 0x4000) {
            *a4 = 1;
          }
          goto LABEL_114;
        }
        uint64_t v66 = sub_1001590D0((uint64_t)v63);
        goto LABEL_111;
      }
      if (!v47) {
        goto LABEL_95;
      }
      BOOL v48 = *a4;
      uint64_t v49 = sub_100159174(v34, (uint64_t)v38);
      if (v49 == sub_100159174(v34, a3))
      {
        if (!*a4) {
          goto LABEL_70;
        }
LABEL_95:
        id v51 = v38;
        goto LABEL_117;
      }
      *a4 = !v48;
      if (!v48) {
        goto LABEL_95;
      }
LABEL_70:
      if (*((uint64_t *)v34 + 3) < 0) {
        v53 = &xmmword_101176F48;
      }
      else {
        v53 = v34;
      }
      if (v38 == (char *)(*(void *)v53 + *((void *)v53 + 1)))
      {
        *a4 = 1;
        goto LABEL_95;
      }
      if (!sub_1001CA284((uint64_t)[v72 characterAtIndex:[v72 charIndexMappedFromStorage:v38]]))goto LABEL_95; {
      *a4 = 1;
      }
      id v51 = (id)sub_1001CB3C4((unint64_t)v38, v72);
LABEL_84:
      if (v51 == (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_85;
      }
LABEL_117:
      a3 = (unint64_t)v51;
LABEL_118:

      sub_100189C94(&v73);
      return a3;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED420);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109D758();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED440);
      }
      unint64_t v25 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      unint64_t v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:leadingEdge:inDirection:skipAnchors:useLeadingEdgeOfNextLine:]");
      CFIndex v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v26 file:v27 lineNumber:2328 isFatal:0 description:"Unsupported vertical character direction"];

      a3 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_118;
  }
}

- (void)moveForward:(id)a3
{
  id v7 = [(CRLWPEditorHelper *)self selection];
  if ([v7 isValid])
  {
    if ((id v4 = [v7 end], objc_msgSend(v7, "isInsertionPoint"))
      && (unint64_t v5 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", v4, 0), (id)v5 != v4)|| (v6 = [v7 isInsertionPoint], unint64_t v5 = (unint64_t)v4, (v6 & 1) == 0))
    {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v5, 0, 0);
    }
  }
}

- (unint64_t)p_rightEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v29 = 0;
  id v7 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", [v6 start], &v29, objc_msgSend(v6, "caretAffinity") == (id)1);
  if (!v7)
  {
LABEL_15:
    unint64_t v8 = (unint64_t)[v6 insertionChar];
    goto LABEL_53;
  }
  if ([v6 isRange])
  {
    if ([v6 isVisual])
    {
      unint64_t v8 = (unint64_t)[v6 range];
      [v6 range];
      uint64_t v10 = v9;
      if (*((uint64_t *)v7 + 3) < 0) {
        uint64_t v11 = &xmmword_101176F48;
      }
      else {
        uint64_t v11 = v7;
      }
      unint64_t v13 = *(void *)v11;
      uint64_t v12 = *((void *)v11 + 1);
      id v14 = [v6 range];
      uint64_t v16 = v8 + v10 - 1;
      if (v13 <= (unint64_t)v14 && v13 + v12 >= (unint64_t)v14 + v15)
      {
        if ((*((void *)v7 + 3) & 0x1000) == 0) {
          unint64_t v8 = v16;
        }
      }
      else if ((*((unsigned char *)v7 + 25) & 0x10) == 0)
      {
        uint64_t v18 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:v16 column:&v29 eol:0];
        if (v18)
        {
          if ((v18[25] & 0x10) != 0) {
            BOOL v19 = sub_100159174((long long *)v18, v16) != 1;
          }
          else {
            BOOL v19 = sub_100159174((long long *)v18, v16) == 1;
          }
          unint64_t v8 = v16;
          goto LABEL_52;
        }
        goto LABEL_15;
      }
      BOOL v27 = sub_100159174(v7, v8) == 1;
      goto LABEL_49;
    }
    if (![v6 isValid])
    {
      unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_53;
    }
    unint64_t v8 = (unint64_t)[v6 end];
    BOOL v19 = 1;
LABEL_52:
    *a4 = v19;
    goto LABEL_53;
  }
  unint64_t v8 = (unint64_t)[v6 insertionChar];
  if ([v6 type] != (id)7)
  {
    uint64_t v20 = *((uint64_t *)v7 + 3) < 0 ? &xmmword_101176F48 : v7;
    uint64_t v21 = *((void *)v20 + 1);
    if (v8 == *(void *)v20 + v21)
    {
      BOOL v22 = !v21 || !*a4;
      if (!v22 && v8 != 0) {
        goto LABEL_39;
      }
    }
  }
  if ([v6 type] == (id)7 && v8 < *(void *)v7 && !*a4)
  {
    if ((*((unsigned char *)v7 + 25) & 0x10) != 0) {
      uint64_t v24 = sub_1001590D0((uint64_t)v7);
    }
    else {
      uint64_t v24 = sub_10015909C((uint64_t)v7);
    }
    unint64_t v8 = v24;
    BOOL v27 = sub_100159174(v7, v24) == ((*((void *)v7 + 3) >> 12) & 1);
LABEL_49:
    BOOL v19 = v27;
    goto LABEL_52;
  }
  unint64_t v25 = *((uint64_t *)v7 + 3) < 0 ? &xmmword_101176F48 : v7;
  if (v8 && v8 == *(void *)v25 + *((void *)v25 + 1))
  {
LABEL_39:
    unint64_t v26 = [(CRLWPEditorHelper *)self textSource];
    unint64_t v8 = (unint64_t)[v26 previousCharacterIndex:v8];

    BOOL v19 = 0;
    goto LABEL_52;
  }
LABEL_53:

  return v8;
}

- (unint64_t)p_leftEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [v6 caretAffinity];
  uint64_t v40 = 0;
  unint64_t v8 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", [v6 start], &v40, v7 == (id)1);
  if (!v8) {
    goto LABEL_33;
  }
  if ([v6 isVisual] && objc_msgSend(v6, "isRange"))
  {
    uint64_t v9 = (char *)[v6 range];
    [v6 range];
    uint64_t v11 = v10;
    if (*((uint64_t *)v8 + 3) < 0) {
      uint64_t v12 = &xmmword_101176F48;
    }
    else {
      uint64_t v12 = v8;
    }
    unint64_t v14 = *(void *)v12;
    uint64_t v13 = *((void *)v12 + 1);
    id v15 = [v6 range];
    id v17 = &v9[v11 - 1];
    if (v14 <= (unint64_t)v15 && v14 + v13 >= (unint64_t)v15 + v16)
    {
      if ((*((unsigned char *)v8 + 25) & 0x10) == 0) {
        id v17 = v9;
      }
      if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        unsigned int v30 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ED460);
        }
        unint64_t v31 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          uint64_t v38 = *((void *)v8 + 3);
          *(_DWORD *)buf = 67110402;
          BOOL v23 = (v38 & 0x1000) == 0;
          CFStringRef v39 = @"head";
          if (v23) {
            CFStringRef v39 = @"tail";
          }
          unsigned int v42 = v30;
          __int16 v43 = 2082;
          id v44 = "-[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:]";
          __int16 v45 = 2082;
          BOOL v46 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm";
          __int16 v47 = 1024;
          int v48 = 2441;
          __int16 v49 = 2114;
          CFStringRef v50 = v39;
          __int16 v51 = 2112;
          id v52 = v6;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to find %{public}@ char index for %@", buf, 0x36u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ED480);
        }
        id v32 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        uint64_t v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_leftEdgeForSelection:withLeadingEdge:]");
        BOOL v34 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
        CFStringRef v35 = @"head";
        if ((*((void *)v8 + 3) & 0x1000) == 0) {
          CFStringRef v35 = @"tail";
        }
        +[CRLAssertionHandler handleFailureInFunction:v33, v34, 2441, 0, "Failed to find %{public}@ char index for %@", v35, v6 file lineNumber isFatal description];
      }
      uint64_t v36 = sub_100159174(v8, (uint64_t)v17);
LABEL_66:
      BOOL v20 = v36 != 1;
      goto LABEL_67;
    }
    if ((*((unsigned char *)v8 + 25) & 0x10) == 0)
    {
      BOOL v19 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:v9 column:&v40 eol:v7 == (id)1];
      if (v19)
      {
        if ((v19[25] & 0x10) != 0) {
          BOOL v20 = sub_100159174((long long *)v19, (uint64_t)v9) == 1;
        }
        else {
          BOOL v20 = sub_100159174((long long *)v19, (uint64_t)v9) != 1;
        }
        id v17 = v9;
        goto LABEL_67;
      }
      goto LABEL_33;
    }
    CFIndex v28 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:v17 column:&v40 eol:v7 == (id)1];
    if (v28)
    {
      if ((v28[25] & 0x10) == 0)
      {
        BOOL v29 = sub_100159174((long long *)v28, (uint64_t)v17) == 1;
LABEL_45:
        BOOL v20 = v29;
        goto LABEL_67;
      }
      uint64_t v36 = sub_100159174((long long *)v28, (uint64_t)v17);
      goto LABEL_66;
    }
LABEL_33:
    id v17 = (char *)[v6 insertionChar];
    goto LABEL_68;
  }
  id v17 = (char *)[v6 insertionChar];
  if ([v6 type] != (id)7)
  {
    uint64_t v21 = *((uint64_t *)v8 + 3) < 0 ? &xmmword_101176F48 : v8;
    uint64_t v22 = *((void *)v21 + 1);
    if (v17 == (char *)(*(void *)v21 + v22))
    {
      BOOL v23 = !v22 || !*a4;
      if (!v23 && v17 != 0) {
        goto LABEL_39;
      }
    }
  }
  if ([v6 type] == (id)7 && (unint64_t)v17 < *(void *)v8 && !*a4)
  {
    if ((*((unsigned char *)v8 + 25) & 0x10) != 0) {
      uint64_t v25 = sub_1001590D0((uint64_t)v8);
    }
    else {
      uint64_t v25 = sub_10015909C((uint64_t)v8);
    }
    id v17 = (char *)v25;
    BOOL v29 = sub_100159174(v8, v25) == ((*((void *)v8 + 3) >> 12) & 1);
    goto LABEL_45;
  }
  unint64_t v26 = *((uint64_t *)v8 + 3) < 0 ? &xmmword_101176F48 : v8;
  if (v17 && v17 == (char *)(*(void *)v26 + *((void *)v26 + 1)))
  {
LABEL_39:
    BOOL v27 = [(CRLWPEditorHelper *)self textSource];
    id v17 = (char *)[v27 previousCharacterIndex:v17];

    BOOL v20 = 0;
LABEL_67:
    *a4 = v20;
  }
LABEL_68:

  return (unint64_t)v17;
}

- (void)p_moveInLineLayoutDirectionLeft:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(CRLWPEditorHelper *)self selection];
  if ([v5 isValid])
  {
    [(CRLWPEditorHelper *)self setAnchorSelection:0];
    unsigned __int8 v22 = [v5 leadingEdge];
    if (v3) {
      unint64_t v6 = [(CRLWPEditorHelper *)self p_leftEdgeForSelection:v5 withLeadingEdge:&v22];
    }
    else {
      unint64_t v6 = [(CRLWPEditorHelper *)self p_rightEdgeForSelection:v5 withLeadingEdge:&v22];
    }
    unint64_t v7 = v6;
    if (!v22 && v6 != 0x7FFFFFFFFFFFFFFFLL && v6 > (unint64_t)[v5 start])
    {
      unint64_t v8 = [(CRLWPEditorHelper *)self textSource];
      id v9 = [v8 characterAtIndex:v7];
      int v10 = (int)v9;
      unsigned int v11 = sub_1001CA284((uint64_t)v9);
      int v12 = v10 == 8232 ? 1 : v11;

      if (v12)
      {
        [(CRLWPEditorHelper *)self paragraphEnumeratorAtCharIndex:v7];
        if (sub_100189E50((uint64_t)v21))
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014ED4A0);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10109D868();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014ED4C0);
          }
          uint64_t v13 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
          {
            +[CRLAssertionHandler packedBacktraceString];
            objc_claimAutoreleasedReturnValue();
            sub_1010663B0();
          }

          unint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_moveInLineLayoutDirectionLeft:]");
          id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:2505 isFatal:0 description:"Should not be on last paragraph yet."];
        }
        uint64_t v16 = [(CRLWPEditorHelper *)self textSource];
        unint64_t v7 = sub_1001CB3C4(v7, v16);

        unsigned __int8 v22 = 1;
        sub_100189C94(v21);
      }
    }
    int v17 = v22;
    unint64_t v18 = v7;
    if ([v5 isInsertionPoint])
    {
      if (v3) {
        uint64_t v19 = 3;
      }
      else {
        uint64_t v19 = 2;
      }
      unint64_t v18 = [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:v7 leadingEdge:&v22 inDirection:v19 skipAnchors:1];
    }
    int v20 = v22;
    if (v18 != v7 || v22 != v17) {
      goto LABEL_32;
    }
    if (([v5 isInsertionPoint] & 1) == 0)
    {
      int v20 = v22;
LABEL_32:
      -[CRLWPEditorHelper setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:](self, "setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:", v18, 0, v20 != 0, 0);
    }
  }
}

- (void)moveRight:(id)a3
{
}

- (void)moveBackward:(id)a3
{
  id v7 = [(CRLWPEditorHelper *)self selection];
  if ([v7 isValid])
  {
    if ((id v4 = [v7 start], objc_msgSend(v7, "isInsertionPoint"))
      && (unint64_t v5 = -[CRLWPEditorHelper charIndexMovingByCharacterFromCharIndex:inDirection:](self, "charIndexMovingByCharacterFromCharIndex:inDirection:", v4, 1), (id)v5 != v4)|| (v6 = [v7 isInsertionPoint], unint64_t v5 = (unint64_t)v4, (v6 & 1) == 0))
    {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v5, 0, 0);
    }
  }
}

- (void)moveLeft:(id)a3
{
}

- (_NSRange)rangeOfWordEnclosingCharIndex:(unint64_t)a3 backward:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v8 = 0;
  id v9 = [(CRLWPEditorHelper *)self textSource];
  id v10 = [v9 length];

  if ((unint64_t)v10 >= a3)
  {
    unsigned int v11 = [(CRLWPEditorHelper *)self textSource];
    uint64_t v7 = (uint64_t)[v11 wordAtCharIndex:a3 includePreviousWord:v4];
    NSUInteger v8 = v12;

    if (v7 == a3 && v4)
    {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      NSUInteger v8 = 0;
    }
  }
  NSUInteger v13 = v7;
  NSUInteger v14 = v8;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (id)logicalToVisualSelection:(id)a3
{
  id v4 = a3;
  if ([v4 type] == (id)7 || objc_msgSend(v4, "type") == (id)1 || objc_msgSend(v4, "type") == (id)2)
  {
    id v5 = v4;
    goto LABEL_5;
  }
  [v4 range];
  if (!v11)
  {
    id v5 = [v4 copyWithNewType:7];
LABEL_5:
    id v6 = v5;
    if (v5) {
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  NSUInteger v12 = [(CRLWPEditorHelper *)self interactiveCanvasController];
  [v12 layoutIfNeeded];

  BOOL v46 = [v4 start];
  uint64_t v76 = 0;
  uint64_t v77 = &v76;
  uint64_t v78 = 0x4012000000;
  double v79 = sub_100309FA8;
  double v80 = nullsub_38;
  char v81 = "";
  long long v82 = xmmword_101176F48;
  uint64_t v72 = 0;
  id v73 = &v72;
  uint64_t v74 = 0x2020000000;
  char v75 = 0;
  int v69 = 0;
  BOOL v70 = 0;
  uint64_t v71 = 0;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10030F004;
  v68[3] = &unk_1014ED4E8;
  v68[5] = &v72;
  v68[6] = &v69;
  v68[4] = &v76;
  -[CRLWPEditorHelper withLineFragmentForCharIndex:eol:performBlock:](self, "withLineFragmentForCharIndex:eol:performBlock:", v46, [v4 caretAffinity] == (id)1, v68);
  if (v77[6] == 0x7FFFFFFFFFFFFFFFLL && !v77[7])
  {
    id v6 = v4;
    goto LABEL_79;
  }
  NSUInteger v13 = [(CRLWPEditorHelper *)self textSource];
  NSUInteger location = [v13 previousCharacterIndex:[v4 end]];

  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x4012000000;
  unint64_t v64 = sub_100309FA8;
  char v65 = nullsub_38;
  uint64_t v66 = "";
  long long v67 = xmmword_101176F48;
  uint64_t v57 = 0;
  char v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  __p = 0;
  id v55 = 0;
  uint64_t v56 = 0;
  range2.NSUInteger length = (NSUInteger)_NSConcreteStackBlock;
  uint64_t v48 = 3221225472;
  __int16 v49 = sub_10030F0B0;
  CFStringRef v50 = &unk_1014ED4E8;
  id v52 = &v57;
  p_p = &__p;
  __int16 v51 = &v61;
  -[CRLWPEditorHelper withLineFragmentForCharIndex:eol:performBlock:](self, "withLineFragmentForCharIndex:eol:performBlock:", location, [v4 isAtEndOfLine], &range2.length);
  if (v62[6] != 0x7FFFFFFFFFFFFFFFLL || v62[7])
  {
    range2.NSUInteger location = (NSUInteger)[v4 range];
    NSUInteger v16 = v15;
    if (v77[6] == v62[6] && v77[7] == v62[7])
    {
      int v17 = v69;
      if (v70 != v69)
      {
        uint64_t v18 = 0;
        char v19 = 0;
        unsigned int v20 = 1;
        do
        {
          v84.NSUInteger location = range2.location;
          v84.NSUInteger length = v16;
          NSRange v21 = NSIntersectionRange(*(NSRange *)&v17[40 * v18 + 16], v84);
          int v17 = v69;
          if ((v19 & 1) == 0 && v21.length)
          {
            if (!v69[40 * v18 + 32])
            {
              BOOL v23 = [(CRLWPEditorHelper *)self textSource];
              BOOL v46 = [v23 previousCharacterIndex:v21.location + v21.length];

              char v19 = 1;
              int v17 = v69;
LABEL_35:
              if (v21.length)
              {
                if (v17[40 * v18 + 32])
                {
                  unsigned __int8 v22 = [(CRLWPEditorHelper *)self textSource];
                  NSUInteger location = [v22 previousCharacterIndex:v21.location + v21.length];

                  int v17 = v69;
                }
                else
                {
                  NSUInteger location = (unsigned char *)v21.location;
                }
              }
              goto LABEL_40;
            }
            char v19 = 1;
            BOOL v46 = (unsigned char *)v21.location;
          }
          if (v19) {
            goto LABEL_35;
          }
LABEL_40:
          uint64_t v18 = v20;
          BOOL v24 = 0xCCCCCCCCCCCCCCCDLL * ((v70 - v17) >> 3) > v20++;
        }
        while (v24);
      }
    }
    else
    {
      uint64_t v25 = v69;
      if (v70 != v69)
      {
        uint64_t v26 = 0;
        int v27 = *((unsigned __int8 *)v73 + 24);
        unsigned int v28 = 1;
        do
        {
          v85.NSUInteger location = range2.location;
          v85.NSUInteger length = v16;
          NSRange v29 = NSIntersectionRange(*(NSRange *)&v25[40 * v26 + 16], v85);
          if (v29.length)
          {
            if (!v27)
            {
              if (v69[40 * v26 + 32])
              {
                BOOL v46 = (unsigned char *)v29.location;
              }
              else
              {
                unint64_t v31 = [(CRLWPEditorHelper *)self textSource];
                BOOL v46 = [v31 previousCharacterIndex:v29.location + v29.length];
              }
              break;
            }
            if (v69[40 * v26 + 32])
            {
              unsigned int v30 = [(CRLWPEditorHelper *)self textSource];
              BOOL v46 = [v30 previousCharacterIndex:v29.location + v29.length];
            }
            else
            {
              BOOL v46 = (unsigned char *)v29.location;
            }
          }
          uint64_t v26 = v28;
          uint64_t v25 = v69;
          BOOL v24 = 0xCCCCCCCCCCCCCCCDLL * ((v70 - v69) >> 3) > v28++;
        }
        while (v24);
      }
      id v32 = (char *)__p;
      if (v55 != __p)
      {
        uint64_t v33 = 0;
        int v34 = *((unsigned __int8 *)v58 + 24);
        unsigned int v35 = 1;
        do
        {
          v86.NSUInteger location = range2.location;
          v86.NSUInteger length = v16;
          NSRange v36 = NSIntersectionRange(*(NSRange *)&v32[40 * v33 + 16], v86);
          if (v36.length)
          {
            if (v34)
            {
              if (*((unsigned char *)__p + 40 * v33 + 32))
              {
                NSUInteger location = (unsigned char *)v36.location;
              }
              else
              {
                uint64_t v38 = [(CRLWPEditorHelper *)self textSource];
                NSUInteger location = [v38 previousCharacterIndex:v36.location + v36.length];
              }
              break;
            }
            if (*((unsigned char *)__p + 40 * v33 + 32))
            {
              unint64_t v37 = [(CRLWPEditorHelper *)self textSource];
              NSUInteger location = [v37 previousCharacterIndex:v36.location + v36.length];
            }
            else
            {
              NSUInteger location = (unsigned char *)v36.location;
            }
          }
          uint64_t v33 = v35;
          id v32 = (char *)__p;
          BOOL v24 = 0xCCCCCCCCCCCCCCCDLL * ((v55 - (unsigned char *)__p) >> 3) > v35++;
        }
        while (v24);
      }
    }
    CFStringRef v39 = [(CRLWPEditorHelper *)self textSource];
    if (v46 <= location)
    {
      uint64_t v40 = [v39 nextCharacterIndex:location];
      id v41 = v46;
    }
    else
    {
      uint64_t v40 = [v39 nextCharacterIndex:v46];
      id v41 = location;
    }
    if (v41 <= v40) {
      unsigned int v42 = v40;
    }
    else {
      unsigned int v42 = v41;
    }
    if (v41 >= v40) {
      __int16 v43 = v40;
    }
    else {
      __int16 v43 = v41;
    }
    int64_t v44 = v42 - v43;

    id v14 = [v4 copyWithNewVisualTypeRange:v43 head:v44 tail:v46 location:location];
    goto LABEL_76;
  }
  id v14 = v4;
LABEL_76:
  id v6 = v14;
  if (__p)
  {
    id v55 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
LABEL_79:
  [v6 type];
  if (v69)
  {
    BOOL v70 = v69;
    operator delete(v69);
  }
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
  if (!v6)
  {
LABEL_6:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED508);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109D8F0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED528);
    }
    uint64_t v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    NSUInteger v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper logicalToVisualSelection:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 2685, 0, "invalid nil value for '%{public}s'", "result");
  }
LABEL_15:

  return v6;
}

- (BOOL)p_adjustSelection:(id)a3 forWordWithCharIndex:(unint64_t)a4
{
  id v6 = a3;
  id v8 = [(CRLWPEditorHelper *)self rangeOfWordEnclosingCharIndex:a4 backward:0];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [(CRLWPEditorHelper *)self textSource];
    id v10 = [v9 length];

    uint64_t v11 = [(CRLWPEditorHelper *)self wpSelectionClass];
    uint64_t v12 = objc_opt_class();
    NSUInteger v13 = [(CRLWPEditorHelper *)self textSource];
    id v14 = sub_1002469D0(v12, v13);
    NSUInteger v15 = -[objc_class selectionWithRange:type:leadingEdge:storage:](v11, "selectionWithRange:type:leadingEdge:storage:", a4, 0, 7, v10 == (id)a4, v14);
  }
  else
  {
    NSUInteger v13 = -[objc_class selectionWithRange:]([(CRLWPEditorHelper *)self wpSelectionClass], "selectionWithRange:", v8, v7);
    NSUInteger v15 = [(CRLWPEditorHelper *)self logicalToVisualSelection:v13];
  }

  NSUInteger v16 = (char *)[v15 range];
  uint64_t v18 = v17;
  char v19 = (char *)[v6 range];
  if (v16 <= v19 && &v16[v18] >= &v19[v20])
  {
    unsigned __int8 v22 = [(CRLWPEditorHelper *)self editorController];
    BOOL v23 = [(CRLWPEditorHelper *)self editor];
    [v22 setSelection:v15 forEditor:v23 withFlags:8];

    BOOL v21 = 1;
  }
  else
  {
    [(CRLWPEditorHelper *)self p_adjustSelection:v6 withOtherSelection:v15 textSelectionGranularity:1];
    BOOL v21 = 0;
  }

  return v21;
}

- (void)p_moveAndModifySelectionRight:(BOOL)a3
{
  int v3 = a3;
  id v5 = [(CRLWPEditorHelper *)self editor];
  [v5 textSelectionWillChange];

  id v6 = [(CRLWPEditorHelper *)self selection];
  if (![v6 isValid]) {
    goto LABEL_42;
  }
  unsigned int v42 = [(CRLWPEditorHelper *)self textSource];
  uint64_t v7 = [(CRLWPEditorHelper *)self anchorSelection];

  if (!v7)
  {
    unsigned __int8 v46 = 0;
    if ([(CRLWPEditorHelper *)self selectionAnchor] == 0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned __int8 v46 = [v6 leadingEdge];
      uint64_t v45 = 0;
      if (!-[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", [v6 start], &v45, objc_msgSend(v6, "caretAffinity") == (id)1))
      {
        -[CRLWPEditorHelper paragraphEnumeratorAtCharIndex:](self, "paragraphEnumeratorAtCharIndex:", [v6 start]);
        if (sub_10018A0BC((uint64_t)&v43) == v3) {
          id v9 = [v6 end];
        }
        else {
          id v9 = [v6 start];
        }
        id v10 = v9;
        sub_100189C94((id *)&v43);
        goto LABEL_12;
      }
      if (v3) {
        unint64_t v8 = [(CRLWPEditorHelper *)self p_leftEdgeForSelection:v6 withLeadingEdge:&v46];
      }
      else {
        unint64_t v8 = [(CRLWPEditorHelper *)self p_rightEdgeForSelection:v6 withLeadingEdge:&v46];
      }
    }
    else
    {
      unsigned __int8 v46 = [(CRLWPEditorHelper *)self selectionAnchorEdge];
      unint64_t v8 = [(CRLWPEditorHelper *)self selectionAnchor];
    }
    id v10 = (id)v8;
LABEL_12:
    uint64_t v11 = [(CRLWPEditorHelper *)self wpSelectionClass];
    int v12 = v46;
    uint64_t v13 = objc_opt_class();
    id v14 = sub_1002469D0(v13, v42);
    NSUInteger v15 = -[objc_class selectionWithRange:type:leadingEdge:storage:](v11, "selectionWithRange:type:leadingEdge:storage:", v10, 0, 7, v12 != 0, v14);
    [(CRLWPEditorHelper *)self setAnchorSelection:v15];
  }
  unsigned __int8 v46 = 0;
  unsigned __int8 v46 = [v6 leadingEdge];
  NSUInteger v16 = [(CRLWPEditorHelper *)self p_oppositeEdgeForSelection:v6 withLeadingEdge:&v46];
  if (v3) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 3;
  }
  uint64_t v18 = [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:v16 leadingEdge:&v46 inDirection:v17 skipAnchors:1];
  char v19 = [(CRLWPEditorHelper *)self textSource];
  uint64_t v20 = [v19 smartFieldAtCharIndex:v18 attributeKind:6 effectiveRange:&v43];

  if (v20
    || ([(CRLWPEditorHelper *)self textSource],
        BOOL v21 = objc_claimAutoreleasedReturnValue(),
        [v21 smartFieldAtCharIndex:v18 attributeKind:21 effectiveRange:&v43],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        v21,
        v20))
  {
    unsigned __int8 v22 = (char *)[v6 superRange];
    if (v22 <= v43)
    {
      BOOL v24 = &v43[v44];
      if (&v22[v23] >= &v43[v44] && (v18 > v43 || !v46 && v18 == v43) && v18 < v24)
      {
        if (v16 != v43)
        {
          unsigned __int8 v46 = 1;
          id v41 = (void *)v20;
          uint64_t v18 = v43;
          goto LABEL_27;
        }
        unsigned __int8 v46 = 0;
        uint64_t v25 = [(CRLWPEditorHelper *)self textSource];
        uint64_t v18 = (char *)sub_1001CAB34((unint64_t)v24, v25);
      }
    }
    id v41 = (void *)v20;
  }
  else
  {
    id v41 = 0;
  }
LABEL_27:
  uint64_t v45 = 0;
  uint64_t v26 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:v18 column:&v45 eol:0];
  BOOL v28 = v18 > v16 && v46 != 0;
  id v29 = objc_alloc([(CRLWPEditorHelper *)self wpSelectionClass]);
  if (v26) {
    uint64_t v30 = 7;
  }
  else {
    uint64_t v30 = 0;
  }
  int v31 = v46;
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = sub_1002469D0(v32, v42);
  LOBYTE(v40) = v31 != 0;
  id v34 = [v29 initWithType:v30 range:v18 styleInsertionBehavior:0 caretAffinity:0 smartFieldRange:v28 leadingEdge:0x7FFFFFFFFFFFFFFFLL storage:v40];

  [(CRLWPEditorHelper *)self setSelectionLastModifiedWithKeyboard:1];
  unsigned int v35 = [(CRLWPEditorHelper *)self anchorSelection];
  [(CRLWPEditorHelper *)self p_adjustSelection:v35 withOtherSelection:v34 textSelectionGranularity:0];

  NSRange v36 = [(CRLWPEditorHelper *)self anchorSelection];
  if (v36)
  {
    id v29 = [(CRLWPEditorHelper *)self anchorSelection];
    uint64_t v37 = (uint64_t)[v29 insertionChar];
  }
  else
  {
    uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(CRLWPEditorHelper *)self setSelectionAnchor:v37];
  if (v36) {

  }
  uint64_t v38 = [(CRLWPEditorHelper *)self anchorSelection];
  -[CRLWPEditorHelper setSelectionAnchorEdge:](self, "setSelectionAnchorEdge:", [v38 leadingEdge]);

  CFStringRef v39 = [(CRLWPEditorHelper *)self editor];
  [v39 textSelectionDidChange];

LABEL_42:
}

- (void)moveRightAndModifySelection:(id)a3
{
}

- (void)moveLeftAndModifySelection:(id)a3
{
}

- (void)moveBackwardAndModifySelection:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self selection];
  if ([v4 isValid])
  {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v5 = [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:[(CRLWPEditorHelper *)self p_selectionEdgeToMutateWithDirection:1 newAnchor:&v6] inDirection:1];
    [(CRLWPEditorHelper *)self p_setSelectionWithCharIndex:v5 andAnchor:v6];
  }
}

- (void)moveForwardAndModifySelection:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self selection];
  if ([v4 isValid])
  {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v5 = [(CRLWPEditorHelper *)self charIndexMovingByCharacterFromCharIndex:[(CRLWPEditorHelper *)self p_selectionEdgeToMutateWithDirection:0 newAnchor:&v6] inDirection:0];
    [(CRLWPEditorHelper *)self p_setSelectionWithCharIndex:v5 andAnchor:v6];
  }
}

- (double)preferredOffsetFromSelection:(id)a3
{
  return NAN;
}

- (void)moveUp:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self selection];
  if ([v4 isValid])
  {
    [(CRLWPEditorHelper *)self preferredOffsetFromSelection:v4];
    uint64_t v11 = v5;
    id v6 = [v4 start];
    char v10 = 1;
    unsigned __int8 v9 = [v4 isAtEndOfLine];
    unint64_t v7 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v6 withEolAffinity:&v9 toBoundary:4 inDirection:4 preferPosition:&v11 isLeadingEdge:&v10];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      id v8 = 0;
    }
    else {
      id v8 = (id)v7;
    }
    if (v8 != [v4 start] || (objc_msgSend(v4, "isInsertionPoint") & 1) == 0) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v8, 0, v9);
    }
  }
}

- (void)moveDown:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self selection];
  if ([v4 isValid])
  {
    [(CRLWPEditorHelper *)self preferredOffsetFromSelection:v4];
    uint64_t v23 = v5;
    id v6 = [v4 end];
    if (v6)
    {
      if ([v4 isRange])
      {
        id v7 = [v4 superRange];
        uint64_t v9 = v8;
        char v10 = [(CRLWPEditorHelper *)self textSource];
        unint64_t v11 = sub_1001CAB34((unint64_t)v7 + v9, v10);

        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int v12 = [(CRLWPEditorHelper *)self textSource];
          uint64_t v13 = [(CRLWPEditorHelper *)self textSource];
          id v14 = [v12 characterAtIndex:[v13 charIndexMappedFromStorage:v11]];

          unsigned int v15 = sub_1001CA284((uint64_t)v14);
          if (v14 == 8232 ? 1 : v15) {
            id v6 = (id)v11;
          }
        }
      }
    }
    uint64_t v17 = [(CRLWPEditorHelper *)self textSource];
    id v18 = [v17 length];

    char v22 = 1;
    unsigned __int8 v21 = [v4 isAtEndOfLine];
    unint64_t v19 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v6 withEolAffinity:&v21 toBoundary:4 inDirection:5 preferPosition:&v23 isLeadingEdge:&v22];
    if ((unint64_t)v18 >= v19) {
      id v20 = (id)v19;
    }
    else {
      id v20 = v18;
    }
    if (v20 != [v4 end] || (objc_msgSend(v4, "isInsertionPoint") & 1) == 0) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v20, 0, [v4 isAtEndOfLine]);
    }
  }
}

- (void)moveUpAndModifySelection:(id)a3
{
  id v6 = [(CRLWPEditorHelper *)self selection];
  if ([v6 isValid])
  {
    [(CRLWPEditorHelper *)self preferredOffsetFromSelection:v6];
    uint64_t v18 = v7;
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v8 = [(CRLWPEditorHelper *)self p_selectionEdgeToMutateWithDirection:4 newAnchor:&v17];
    unsigned __int8 v16 = 1;
    unsigned __int8 v15 = [v6 isAtEndOfLine];
    unint64_t v9 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v8 withEolAffinity:&v15 toBoundary:4 inDirection:4 preferPosition:&v18 isLeadingEdge:&v16];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = v9;
    }
    unint64_t v11 = [(CRLWPEditorHelper *)self selection];
    unsigned int v12 = [v11 validVisualRanges];
    if ((v12 & 1) != 0
      && (([(CRLWPEditorHelper *)self selection],
           int v3 = objc_claimAutoreleasedReturnValue(),
           [v3 visualRanges],
           id v4 = objc_claimAutoreleasedReturnValue(),
           unsigned __int8 v13 = [v4 containsCharacterAtIndex:v10],
           v10 < v17)
        ? (unsigned __int8 v14 = v13)
        : (unsigned __int8 v14 = 0),
          (v14 & 1) != 0)
      || (-[CRLWPEditorHelper p_setVisualSelectionWithCharIndex:leadingEdge:andAnchor:andAnchorLeadingEdge:](self, "p_setVisualSelectionWithCharIndex:leadingEdge:andAnchor:andAnchorLeadingEdge:", v10, v16), v12))
    {
    }
  }
}

- (void)moveDownAndModifySelection:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self selection];
  if ([v4 isValid])
  {
    [(CRLWPEditorHelper *)self preferredOffsetFromSelection:v4];
    uint64_t v14 = v5;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v6 = [(CRLWPEditorHelper *)self p_selectionEdgeToMutateWithDirection:5 newAnchor:&v13];
    uint64_t v7 = [(CRLWPEditorHelper *)self textSource];
    unint64_t v8 = (char *)[v7 length];

    unsigned __int8 v12 = 1;
    unsigned __int8 v11 = [v4 isAtEndOfLine];
    unint64_t v9 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v6 withEolAffinity:&v11 toBoundary:4 inDirection:5 preferPosition:&v14 isLeadingEdge:&v12];
    if ((unint64_t)(v8 - 1) >= v9) {
      unint64_t v10 = (char *)v9;
    }
    else {
      unint64_t v10 = v8 - 1;
    }
    [(CRLWPEditorHelper *)self p_setVisualSelectionWithCharIndex:v10 leadingEdge:v12 andAnchor:v13 andAnchorLeadingEdge:1];
  }
}

- (BOOL)p_isEdgeAtCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 withinWordInDirection:(int64_t)a5
{
  unint64_t v6 = [(CRLWPEditorHelper *)self p_adjustedCharIndexForWordTestingFromCharIndex:a3 leadingEdge:a4 forDirection:a5];
  uint64_t v7 = [(CRLWPEditorHelper *)self textSource];
  id v8 = [v7 length];

  if (v6 > (unint64_t)v8) {
    return 0;
  }
  unint64_t v10 = [(CRLWPEditorHelper *)self textSource];
  id v11 = [v10 wordAtCharIndex:v6 includePreviousWord:0];
  unint64_t v13 = v12;

  return v6 >= (unint64_t)v11 && v6 - (unint64_t)v11 < v13;
}

- (void)moveWordInLayoutDirection:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED548);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109D984();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED568);
    }
    uint64_t v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    unint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper moveWordInLayoutDirection:]");
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 2994, 0, "Unsupported direction: %lu", a3);
  }
  id v8 = [(CRLWPEditorHelper *)self selection];
  if ([v8 isValid])
  {
    [(CRLWPEditorHelper *)self setAnchorSelection:0];
    unsigned __int8 v18 = [v8 leadingEdge];
    if (a3 == 2) {
      unint64_t v9 = [(CRLWPEditorHelper *)self p_rightEdgeForSelection:v8 withLeadingEdge:&v18];
    }
    else {
      unint64_t v9 = [(CRLWPEditorHelper *)self p_leftEdgeForSelection:v8 withLeadingEdge:&v18];
    }
    unint64_t v10 = v9;
    unsigned __int8 v11 = [(CRLWPEditorHelper *)self p_isEdgeAtCharIndex:v9 leadingEdge:v18 withinWordInDirection:a3];
    unint64_t v12 = [(CRLWPEditorHelper *)self charIndexMovingByWordFromCharIndex:v10 leadingEdge:&v18 inDirection:a3];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      char v13 = 1;
    }
    else {
      char v13 = v11;
    }
    if ((v13 & 1) == 0)
    {
      unint64_t v14 = [(CRLWPEditorHelper *)self charIndexMovingByWordFromCharIndex:v12 leadingEdge:&v18 inDirection:a3];
      if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v12 = v14;
      }
    }
    if (v12 == 0x7FFFFFFFFFFFFFFFLL && v10 == 0) {
      unint64_t v16 = 0;
    }
    else {
      unint64_t v16 = v12;
    }
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v16 != v10
        || (int v17 = v18, v17 != [v8 leadingEdge])
        || ([v8 isInsertionPoint] & 1) == 0)
      {
        -[CRLWPEditorHelper setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:](self, "setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:", v16, 0, v18, 0);
      }
    }
  }
}

- (void)moveWordRight:(id)a3
{
}

- (void)moveWordLeft:(id)a3
{
}

- (void)moveWordRightAndModifySelection:(id)a3
{
}

- (void)moveWordLeftAndModifySelection:(id)a3
{
}

- (void)p_moveWordAndModifySelectionInLayoutDirection:(int64_t)a3
{
  uint64_t v5 = [(CRLWPEditorHelper *)self editor];
  [v5 textSelectionWillChange];

  unint64_t v6 = [(CRLWPEditorHelper *)self selection];
  if ([v6 isValid])
  {
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    unsigned __int8 v18 = 1;
    unsigned __int8 v17 = 1;
    unint64_t v7 = [(CRLWPEditorHelper *)self p_selectionEdgeToMutateWithLeadingEdge:&v17 Direction:a3 newAnchor:&v19 anchorLeadingEdge:&v18];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned __int8 v8 = [(CRLWPEditorHelper *)self p_isEdgeAtCharIndex:v7 leadingEdge:v17 withinWordInDirection:a3];
      char v16 = 0;
      unsigned __int8 v15 = v17;
      unint64_t v9 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v7 withEolAffinity:&v16 toBoundary:1 inDirection:a3 preferPosition:0 isLeadingEdge:&v15];
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v8)
        {
          unint64_t v10 = [(CRLWPEditorHelper *)self p_layoutIndexForCharIndex:v7 leadingEdge:v17];
          unint64_t v11 = [(CRLWPEditorHelper *)self p_layoutIndexForCharIndex:v9 leadingEdge:v15];
          unint64_t v12 = [(CRLWPEditorHelper *)self p_layoutIndexForCharIndex:[(CRLWPEditorHelper *)self selectionAnchor] leadingEdge:[(CRLWPEditorHelper *)self selectionAnchorEdge]];
          if ((v10 >= v12 || v12 >= v11) && (v11 >= v12 || v12 >= v10))
          {
            unsigned int v13 = v15;
          }
          else
          {
            unint64_t v9 = [(CRLWPEditorHelper *)self selectionAnchor];
            unsigned int v13 = [(CRLWPEditorHelper *)self selectionAnchorEdge];
          }
          unsigned __int8 v17 = v13;
        }
        else
        {
          char v16 = 0;
          unsigned __int8 v17 = v15;
          unint64_t v9 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v9 withEolAffinity:&v16 toBoundary:1 inDirection:a3 preferPosition:0 isLeadingEdge:&v17];
          unsigned int v13 = v17;
        }
        [(CRLWPEditorHelper *)self p_setVisualSelectionWithCharIndex:v9 leadingEdge:v13 != 0 andAnchor:v19 andAnchorLeadingEdge:v18];
      }
    }
  }
  unint64_t v14 = [(CRLWPEditorHelper *)self editor];
  [v14 textSelectionDidChange];
}

- (BOOL)p_isCharIndex:(unint64_t)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  if (a4 != 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED588);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109DA10();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED5A8);
    }
    unint64_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    unint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_isCharIndex:withinTextUnit:inDirection:]");
    unint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:3117 isFatal:0 description:"unexpected granularity"];

    return 0;
  }
  if ((unint64_t)a5 > 5) {
    return 0;
  }
  if (((1 << a5) & 0x1A) != 0)
  {
    unint64_t v6 = -[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:](self, "p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:", a3, 1);
    unint64_t v7 = [(CRLWPEditorHelper *)self textSource];
    id v8 = [v7 length];

    if (v6 <= (unint64_t)v8) {
      goto LABEL_17;
    }
    return 0;
  }
  unint64_t v6 = -[CRLWPEditorHelper p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:](self, "p_adjustedCharIndexForWordTestingFromCharIndex:leadingEdge:forDirection:", a3, 1);
  unsigned int v13 = [(CRLWPEditorHelper *)self textSource];
  id v14 = [v13 length];

  if (v6 > (unint64_t)v14) {
    return 0;
  }
LABEL_17:
  unsigned __int8 v15 = [(CRLWPEditorHelper *)self textSource];
  id v16 = [v15 wordAtCharIndex:v6 includePreviousWord:0];
  unint64_t v18 = v17;

  return v6 >= (unint64_t)v16 && v6 - (unint64_t)v16 < v18;
}

- (int64_t)p_writingDirectionForCharAtIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return -1;
  }
  uint64_t v10 = 0;
  id v4 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:a3 column:&v10 eol:0];
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED5C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109DA98();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED5E8);
    }
    unint64_t v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_writingDirectionForCharAtIndex:]");
    unint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 3129, 0, "invalid nil value for '%{public}s'", "lineFragment");

    return -1;
  }
  if (v4[3] < 0) {
    uint64_t v5 = &xmmword_101176F48;
  }
  else {
    uint64_t v5 = (long long *)v4;
  }
  return sub_100159174((long long *)v4, a3 - (*(void *)v5 + *((void *)v5 + 1) == a3));
}

- (BOOL)p_isCharIndex:(unint64_t)a3 withEolAffinity:(BOOL)a4 atBoundary:(int64_t)a5 inDirection:(int64_t)a6
{
  BOOL v8 = a4;
  unint64_t v11 = (char *)-[CRLWPEditorHelper availableSelectionRangeForCharIndex:](self, "availableSelectionRangeForCharIndex:");
  uint64_t v61 = v11;
  unsigned int v13 = &v11[v12];
  if (a3) {
    unint64_t v14 = a3 - (&v11[v12] == (char *)a3);
  }
  else {
    unint64_t v14 = 0;
  }
  if (v14 >= (unint64_t)v13) {
    return 0;
  }
  switch(a5)
  {
    case 0:
      unsigned __int8 v15 = [(CRLWPEditorHelper *)self textSource];
      id v16 = [v15 string];
      CFIndex v17 = (CFIndex)[v16 rangeOfComposedCharacterSequenceAtIndex:v14];
      CFIndex v19 = v18;

      goto LABEL_59;
    case 1:
      if ((unint64_t)a6 > 1)
      {
        int64_t v49 = [(CRLWPEditorHelper *)self p_writingDirectionForCharAtIndex:v14];
        uint64_t v50 = 2;
        if (v49 == 1) {
          uint64_t v50 = 3;
        }
        BOOL v20 = v50 == a6;
      }
      else
      {
        BOOL v20 = a6 == 0;
      }
      uint64_t v51 = v20;
      CFIndex v17 = (CFIndex)[(CRLWPEditorHelper *)self rangeOfWordEnclosingCharIndex:v14 backward:v51];
      CFIndex v19 = v52;
      goto LABEL_59;
    case 2:
      unsigned __int8 v21 = [(CRLWPEditorHelper *)self textSource];
      id location = [v21 textRangeForParagraphAtCharIndex:a3];
      NSUInteger length = v23;

      if (a3 && location == (id)a3)
      {
        uint64_t v25 = [(CRLWPEditorHelper *)self textSource];
        v68.id location = (NSUInteger)[v25 textRangeForParagraphAtCharIndex:a3 - 1];
        v68.NSUInteger length = v26;
        v67.id location = (NSUInteger)location;
        v67.NSUInteger length = length;
        NSRange v27 = NSUnionRange(v67, v68);
        id location = (id)v27.location;
        NSUInteger length = v27.length;
      }
      BOOL v28 = [(CRLWPEditorHelper *)self textSource];
      id v29 = [v28 string];
      v69.id location = (CFIndex)location;
      v69.NSUInteger length = length;
      uint64_t v30 = CFStringTokenizerCreate(kCFAllocatorDefault, v29, v69, 1uLL, 0);

      if (CFStringTokenizerGoToTokenAtIndex(v30, a3))
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v30);
        CFIndex v17 = CurrentTokenRange.location;
        CFIndex v19 = CurrentTokenRange.length;
      }
      else
      {
        CFIndex v17 = 0x7FFFFFFFFFFFFFFFLL;
        CFIndex v19 = 0;
      }
      CFRelease(v30);
      goto LABEL_59;
    case 3:
      uint64_t v32 = [(CRLWPEditorHelper *)self textSource];
      CFIndex v17 = (CFIndex)[v32 textRangeForParagraphAtCharIndex:a3];
      uint64_t v34 = v33;

      if (v34)
      {
        unsigned int v35 = [(CRLWPEditorHelper *)self textSource];
        unsigned int v36 = sub_1001CA284((uint64_t)[v35 characterAtIndex:v34 + v17 - 1]);

        CFIndex v19 = v34 - v36;
      }
      else
      {
        CFIndex v19 = 0;
      }
      goto LABEL_59;
    case 4:
      [(CRLWPEditorHelper *)self layout];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      v59 = long long v63 = 0u;
      id obj = [v59 columns];
      id v37 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
      int64_t v58 = a6;
      if (!v37) {
        goto LABEL_37;
      }
      uint64_t v38 = *(void *)v63;
      break;
    default:
      CFIndex v19 = v12;
      CFIndex v17 = (CFIndex)v11;
      goto LABEL_39;
  }
  while (2)
  {
    for (i = 0; i != v37; i = (char *)i + 1)
    {
      if (*(void *)v63 != v38) {
        objc_enumerationMutation(obj);
      }
      uint64_t v40 = *(void **)(*((void *)&v62 + 1) + 8 * i);
      id v41 = [v40 range];
      BOOL v43 = v14 < (unint64_t)v41 || v14 - (unint64_t)v41 >= v42;
      if (!v43 || v8 && (char *)v14 == &v41[v42])
      {
        id v44 = [v40 lineIndexForCharIndex:v14 eol:v8];
        if ((unint64_t)v44 > 0x7FFFFFFFFFFFFFFELL)
        {
LABEL_37:
          CFIndex v19 = 0;
          CFIndex v17 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          uint64_t v45 = (long long *)[v40 lineFragmentAtIndex:v44];
          if (*((uint64_t *)v45 + 3) < 0) {
            unsigned __int8 v46 = &xmmword_101176F48;
          }
          else {
            unsigned __int8 v46 = v45;
          }
          CFIndex v17 = *(void *)v46;
          CFIndex v19 = *((void *)v46 + 1);
        }
        goto LABEL_38;
      }
    }
    id v37 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
    CFIndex v19 = 0;
    CFIndex v17 = 0x7FFFFFFFFFFFFFFFLL;
    if (v37) {
      continue;
    }
    break;
  }
LABEL_38:

  a6 = v58;
LABEL_39:
  if (a5 != 5)
  {
LABEL_59:
    BOOL result = v17 + v19 == a3;
    if (v17 != a3 && v17 + v19 != a3) {
      return 0;
    }
    switch(a5)
    {
      case 0:
      case 2:
        if (a6 == 1)
        {
          if (v13 == (char *)a3) {
            return 0;
          }
        }
        else if (!a6 && v61 == (char *)a3)
        {
          return 0;
        }
        return (unint64_t)(a6 - 6) < 0xFFFFFFFFFFFFFFFELL;
      case 1:
      case 4:
        if ((unint64_t)a6 <= 1) {
          return (v17 == a3) == a6;
        }
        int64_t v53 = [(CRLWPEditorHelper *)self p_writingDirectionForCharAtIndex:a3];
        uint64_t v54 = 2;
        if (v53 == 1) {
          uint64_t v54 = 3;
        }
        BOOL v55 = v54 == a6;
        BOOL v57 = (a6 & 0xFFFFFFFFFFFFFFFELL) == 2 && v54 != a6;
        if (v17 == a3) {
          return v57;
        }
        else {
          return v55;
        }
      case 3:
        if (v61 == (char *)a3 && (unint64_t)a6 <= 5 && ((1 << a6) & 0x25) != 0
          || v13 == (char *)a3 && (unint64_t)a6 <= 4 && ((1 << a6) & 0x1A) != 0)
        {
          return 0;
        }
        if ((a6 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
          return v17 == a3;
        }
        if ((a6 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
          return result;
        }
        return 0;
      default:
        return 0;
    }
  }
  if (v61 == (char *)a3 && (unint64_t)a6 <= 4 && ((1 << a6) & 0x1A) != 0) {
    return 1;
  }
  unsigned int v48 = (0x25u >> a6) & 1;
  if ((unint64_t)a6 >= 6) {
    LOBYTE(v48) = 0;
  }
  if (v13 == (char *)a3) {
    return v48;
  }
  else {
    return 0;
  }
}

- (void)moveWordForward:(id)a3
{
  id v7 = [(CRLWPEditorHelper *)self selection];
  if ([v7 isValid])
  {
    id v4 = [v7 end];
    unsigned __int8 v5 = [(CRLWPEditorHelper *)self p_isCharIndex:v4 withinTextUnit:1 inDirection:0];
    unint64_t v6 = [(CRLWPEditorHelper *)self charIndexMovingByWordFromCharIndex:v4 leadingEdge:0 inDirection:0];
    if ((v5 & 1) == 0
      && [(CRLWPEditorHelper *)self p_isCharIndex:v6 withEolAffinity:0 atBoundary:1 inDirection:1])
    {
      unint64_t v6 = [(CRLWPEditorHelper *)self charIndexMovingByWordFromCharIndex:v6 leadingEdge:0 inDirection:0];
    }
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && ((id)v6 != v4 || ([v7 isInsertionPoint] & 1) == 0)) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v6, 0, 0);
    }
  }
}

- (void)moveWordBackward:(id)a3
{
  id v8 = [(CRLWPEditorHelper *)self selection];
  if ([v8 isValid])
  {
    id v4 = [v8 start];
    unsigned __int8 v5 = [(CRLWPEditorHelper *)self p_isCharIndex:v4 withinTextUnit:1 inDirection:1];
    unint64_t v6 = [(CRLWPEditorHelper *)self charIndexMovingByWordFromCharIndex:v4 leadingEdge:0 inDirection:1];
    if ((v5 & 1) == 0
      && [(CRLWPEditorHelper *)self p_isCharIndex:v6 withEolAffinity:0 atBoundary:1 inDirection:0])
    {
      unint64_t v6 = [(CRLWPEditorHelper *)self charIndexMovingByWordFromCharIndex:v6 leadingEdge:0 inDirection:1];
    }
    if (v4) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = v6 == 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v7) {
      unint64_t v6 = 0;
    }
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && ((id)v6 != v4 || ([v8 isInsertionPoint] & 1) == 0)) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v6, 0, 0);
    }
  }
}

- (void)moveWordAndModifySelectionInStorageDirection:(int64_t)a3
{
  unsigned __int8 v5 = [(CRLWPEditorHelper *)self selection];
  if ([v5 isValid])
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v6 = [(CRLWPEditorHelper *)self p_selectionEdgeToMutateWithDirection:a3 newAnchor:&v11];
    unsigned __int8 v7 = [(CRLWPEditorHelper *)self p_isCharIndex:v6 withinTextUnit:1 inDirection:a3];
    unsigned __int8 v10 = 0;
    unint64_t v8 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v6 withEolAffinity:&v10 toBoundary:1 inDirection:a3 preferPosition:0 isLeadingEdge:0];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((v7 & 1) == 0
        && [(CRLWPEditorHelper *)self p_isCharIndex:v8 withEolAffinity:v10 atBoundary:1 inDirection:a3 == 0])
      {
        unsigned __int8 v10 = 0;
        unint64_t v8 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v8 withEolAffinity:&v10 toBoundary:1 inDirection:a3 preferPosition:0 isLeadingEdge:0];
      }
      if (v6 != (void *)[(CRLWPEditorHelper *)self selectionAnchor])
      {
        unint64_t v9 = [(CRLWPEditorHelper *)self selectionAnchor];
        if ((unint64_t)v6 <= v9 == v8 > [(CRLWPEditorHelper *)self selectionAnchor]) {
          unint64_t v8 = [(CRLWPEditorHelper *)self selectionAnchor];
        }
      }
      [(CRLWPEditorHelper *)self p_setSelectionWithCharIndex:v8 andAnchor:v11];
    }
  }
}

- (void)moveWordForwardAndModifySelection:(id)a3
{
}

- (void)moveWordBackwardAndModifySelection:(id)a3
{
}

- (void)selectParagraph:(id)a3
{
  id v19 = [(CRLWPEditorHelper *)self selection];
  if ([v19 isValid])
  {
    id v4 = (char *)[v19 range];
    uint64_t v6 = v5;
    unsigned __int8 v7 = [(CRLWPEditorHelper *)self textSource];
    id v8 = [v7 textRangeForParagraphAtCharIndex:v4];
    NSUInteger v10 = v9;

    uint64_t v11 = [(CRLWPEditorHelper *)self textSource];
    CFIndex v12 = (char *)[v11 textRangeForParagraphAtCharIndex:&v4[v6]];
    uint64_t v14 = v13;

    unsigned int v15 = [v19 isRange];
    BOOL v16 = &v4[v6] == v12;
    v17.id location = (NSUInteger)((v15 & v16) != 0 ? &v4[v6] : v12);
    v17.NSUInteger length = (v15 & v16) != 0 ? 0 : v14;
    v21.id location = (NSUInteger)v8;
    v21.NSUInteger length = v10;
    NSRange v18 = NSUnionRange(v21, v17);
    if ((char *)v18.location != v4 || v18.length != v6) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v18.location, v18.length, 0);
    }
  }
}

- (void)selectLine:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self selection];
  if ([v4 isValid])
  {
    unsigned __int8 v23 = 0;
    if ([v4 isRange]) {
      unsigned __int8 v5 = 0;
    }
    else {
      unsigned __int8 v5 = [v4 isAtEndOfLine];
    }
    unsigned __int8 v23 = v5;
    NSUInteger v6 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", [v4 start], &v23, 4, 1, 0, 0);
    if ([v4 isRange]) {
      unsigned __int8 v7 = 1;
    }
    else {
      unsigned __int8 v7 = [v4 isAtEndOfLine];
    }
    unsigned __int8 v23 = v7;
    unint64_t v8 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", [v4 start], &v23, 4, 0, 0, 0);
    if (v6 <= v8) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v6;
    }
    if (v6 >= v8) {
      NSUInteger v6 = v8;
    }
    if ([v4 isRange]) {
      unsigned __int8 v10 = 0;
    }
    else {
      unsigned __int8 v10 = [v4 isAtEndOfLine];
    }
    unsigned __int8 v23 = v10;
    NSUInteger v11 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", [v4 end], &v23, 4, 1, 0, 0);
    if ([v4 isRange]
      && ([(CRLWPEditorHelper *)self textSource],
          CFIndex v12 = objc_claimAutoreleasedReturnValue(),
          unsigned int v13 = sub_1001CA284((uint64_t)objc_msgSend(v12, "characterAtIndex:", (char *)objc_msgSend(v4, "end") - 1)), v12, v13))
    {
      uint64_t v14 = (char *)[v4 end];
    }
    else
    {
      if ([v4 isRange]) {
        unsigned __int8 v15 = 1;
      }
      else {
        unsigned __int8 v15 = [v4 isAtEndOfLine];
      }
      unsigned __int8 v23 = v15;
      uint64_t v14 = -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", [v4 end], &v23, 4, 0, 0, 0);
      BOOL v16 = [(CRLWPEditorHelper *)self textSource];
      if (v14 >= (char *)[v16 length] - 1)
      {
      }
      else
      {
        NSRange v17 = [(CRLWPEditorHelper *)self textSource];
        unsigned int v18 = sub_1001CA284((uint64_t)[v17 characterAtIndex:v14]);

        v14 += v18;
      }
    }
    if (v11 <= (unint64_t)v14) {
      NSUInteger v19 = (NSUInteger)v14;
    }
    else {
      NSUInteger v19 = v11;
    }
    if (v11 >= (unint64_t)v14) {
      v20.id location = (NSUInteger)v14;
    }
    else {
      v20.id location = v11;
    }
    v20.NSUInteger length = v19 - v20.location;
    v24.id location = v6;
    v24.NSUInteger length = v9 - v6;
    NSRange v21 = NSUnionRange(v24, v20);
    if ((id)v21.location != [v4 range] || v21.length != v22) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v21.location, v21.length, 0);
    }
  }
}

- (void)selectWord:(id)a3
{
}

- (void)selectWordWithFlags:(unint64_t)a3
{
  id v16 = [(CRLWPEditorHelper *)self selection];
  unsigned __int8 v5 = [(CRLWPEditorHelper *)self textSource];
  if ([v16 isValid] && objc_msgSend(v5, "length"))
  {
    id v6 = [v16 start];
    if (v6
      && (v6 == [v5 length]
       || sub_1001CA284((uint64_t)[v5 characterAtIndex:v6])))
    {
      id v6 = [v5 previousCharacterIndex:v6];
    }
    id location = [(CRLWPEditorHelper *)self rangeForSelectionAtCharIndex:v6 caretIndex:v6];
    NSUInteger length = v8;
    if ([v16 isRange] && (location != objc_msgSend(v16, "range") || length != v10))
    {
      if (location == (id)0x7FFFFFFFFFFFFFFFLL && length == 0) {
        NSUInteger length = 0;
      }
      else {
        id v6 = location;
      }
      id v11 = [v5 previousCharacterIndex:[v16 end]];
      v13.id location = (NSUInteger)[(CRLWPEditorHelper *)self rangeForSelectionAtCharIndex:v11 caretIndex:v11];
      v13.NSUInteger length = v12;
      if (v13.location == 0x7FFFFFFFFFFFFFFFLL && !v12)
      {
        v13.id location = [v16 end:0x7FFFFFFFFFFFFFFFLL, 0];
        v13.NSUInteger length = 0;
      }
      v18.id location = (NSUInteger)v6;
      v18.NSUInteger length = length;
      NSRange v14 = NSUnionRange(v18, v13);
      id location = (id)v14.location;
      NSUInteger length = v14.length;
    }
    if (location != [v16 range] || length != v15) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:withFlags:](self, "setSelectionWithRange:endOfLine:withFlags:", location, length, 0, a3);
    }
  }
}

- (void)setSelectionFromKeyboardWithRange:(_NSRange)a3 leadingEdge:(BOOL)a4 endOfLine:(BOOL)a5
{
}

- (void)p_setSelectionFromKeyboardWithRange:(_NSRange)a3 leadingEdge:(BOOL)a4 endOfLine:(BOOL)a5 allowEndOfLineChange:(BOOL)a6
{
  BOOL v6 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = objc_alloc([(CRLWPEditorHelper *)self wpSelectionClass]);
  uint64_t v12 = objc_opt_class();
  NSRange v13 = [(CRLWPEditorHelper *)self textSource];
  NSRange v14 = sub_1002469D0(v12, v13);
  NSUInteger v43 = length;
  LOBYTE(v42) = a4;
  id v44 = [v11 initWithType:7 range:location length:length styleInsertionBehavior:0 caretAffinity:v6 smartFieldRange:0x7FFFFFFFFFFFFFFFLL leadingEdge:0 storage:v42 caretAffinity:v14];

  uint64_t v15 = [(CRLWPEditorHelper *)self editorController];
  id v16 = [v15 selectionPath];

  NSRange v17 = [v16 mostSpecificSelectionOfClass:objc_opt_class()];
  if (v17)
  {
    NSRange v18 = [v16 selectionPathReplacingMostSpecificLocationOfSelection:v17 withSelection:v44];
  }
  else
  {
    NSUInteger v19 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    NSRange v20 = [v19 selectionModelTranslator];
    id v21 = [v44 range];
    uint64_t v23 = v22;
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = [(CRLWPEditorHelper *)self textSource];
    NSUInteger v26 = sub_1002469D0(v24, v25);
    NSRange v18 = [v20 selectionPathForRange:v21 onStorage:v23];
  }
  NSRange v27 = (char *)[v17 range];
  uint64_t v29 = v28;
  uint64_t v30 = location;
  if ([v44 isRange])
  {
    uint64_t v30 = location + v43;
    if (v27 != (char *)location)
    {
      if ((char *)v30 == &v27[v29]) {
        uint64_t v30 = location;
      }
      else {
        uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  int v31 = [(CRLWPEditorHelper *)self interactiveCanvasController];
  uint64_t v32 = v31;
  if (v30 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v33 = 36;
  }
  else {
    uint64_t v33 = 32;
  }
  [v31 setSelectionPath:v18 withSelectionFlags:v33];

  if (v30 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v44 isInsertionPoint])
    {
      id v34 = v44;
    }
    else
    {
      [objc_opt_class() selectionWithRange:v30];
      id v34 = (id)objc_claimAutoreleasedReturnValue();
    }
    unsigned int v35 = v34;
    if ([v44 isInsertionPoint]) {
      uint64_t v36 = (uint64_t)[v44 caretAffinity];
    }
    else {
      uint64_t v36 = 0;
    }
    if (([v44 isRange] & (v30 == location + v43)) != 0) {
      uint64_t v36 = 1;
    }
    if ([v35 caretAffinity] != (id)v36)
    {
      id v37 = [v35 copyWithNewStyleInsertionBehavior:0 newCaretAffinity:v36];

      unsigned int v35 = v37;
    }
    uint64_t v38 = v16;
    CFStringRef v39 = [v16 selectionPathByAppendingOrReplacingMostSpecificSelectionWithSelection:v35];
    uint64_t v40 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    [v40 scrollToSelectionPath:v39 scrollOptions:0];

    id v41 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    [v41 layoutIfNeeded];

    id v16 = v38;
  }
  [(CRLWPEditorHelper *)self setSelectionLastModifiedWithKeyboard:1];
  if ([v44 isInsertionPoint]) {
    self->_selectionAnchor = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(CRLWPEditorHelper *)self p_clearEditMenuFlags];
}

- (void)p_moveToEndOfLineRight:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(CRLWPEditorHelper *)self selection];
  if ([v5 isValid])
  {
    unsigned __int8 v17 = [v5 leadingEdge];
    if (v3)
    {
      BOOL v6 = [(CRLWPEditorHelper *)self p_rightEdgeForSelection:v5 withLeadingEdge:&v17];
      uint64_t v7 = 2;
    }
    else
    {
      BOOL v6 = [(CRLWPEditorHelper *)self p_leftEdgeForSelection:v5 withLeadingEdge:&v17];
      uint64_t v7 = 3;
    }
    int v8 = v17;
    unsigned __int8 v9 = [(CRLWPEditorHelper *)self p_isCharIndex:v6 withEolAffinity:1 atBoundary:4 inDirection:v7];
    if ([v5 isRange] && v6 == objc_msgSend(v5, "end"))
    {
      uint64_t v10 = [(CRLWPEditorHelper *)self textSource];
      unsigned int v11 = sub_1001CA284((uint64_t)[v10 characterAtIndex:v6 - 1]);

      uint64_t v12 = &v6[-v11];
    }
    else
    {
      LOBYTE(v11) = 0;
      uint64_t v12 = v6;
    }
    if ([v5 isInsertionPoint]) {
      unsigned __int8 v13 = [v5 isAtEndOfLine];
    }
    else {
      unsigned __int8 v13 = v11 | v9;
    }
    unsigned __int8 v16 = v13;
    unint64_t v14 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v12 withEolAffinity:&v16 toBoundary:4 inDirection:v7 preferPosition:0 isLeadingEdge:&v17];
    int v15 = v17;
    if ((char *)v14 != v6 || v8 != v17) {
      goto LABEL_16;
    }
    if ([v5 isRange])
    {
      int v15 = v17;
LABEL_16:
      -[CRLWPEditorHelper p_setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:allowEndOfLineChange:](self, "p_setSelectionFromKeyboardWithRange:leadingEdge:endOfLine:allowEndOfLineChange:", v14, 0, v15 != 0, v16, 0);
    }
  }
}

- (void)moveToLeftEndOfLine:(id)a3
{
}

- (void)moveToRightEndOfLine:(id)a3
{
}

- (void)p_extendToEndOfLineRight:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(CRLWPEditorHelper *)self selection];
  if ([v5 isValid])
  {
    unsigned __int8 v15 = [v5 leadingEdge];
    if (v3) {
      unint64_t v6 = [(CRLWPEditorHelper *)self p_rightEdgeForSelection:v5 withLeadingEdge:&v15];
    }
    else {
      unint64_t v6 = [(CRLWPEditorHelper *)self p_leftEdgeForSelection:v5 withLeadingEdge:&v15];
    }
    uint64_t v7 = (char *)v6;
    if (![v5 isRange]
      || v7 != [v5 end]
      || ([(CRLWPEditorHelper *)self textSource],
          int v8 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v9 = sub_1001CA284((uint64_t)[v8 characterAtIndex:v7 - 1]),
          v8,
          (v9 & 1) == 0))
    {
      if (v3) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 3;
      }
      unsigned __int8 v11 = [(CRLWPEditorHelper *)self p_isCharIndex:v7 withEolAffinity:1 atBoundary:4 inDirection:v10];
      if ([v5 isInsertionPoint]) {
        unsigned __int8 v11 = [v5 isAtEndOfLine];
      }
      unsigned __int8 v14 = v11;
      uint64_t v7 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v7 withEolAffinity:&v14 toBoundary:4 inDirection:v10 preferPosition:0 isLeadingEdge:&v15];
    }
    unsigned __int8 v13 = [v5 leadingEdge];
    if (v3) {
      unint64_t v12 = [(CRLWPEditorHelper *)self p_leftEdgeForSelection:v5 withLeadingEdge:&v13];
    }
    else {
      unint64_t v12 = [(CRLWPEditorHelper *)self p_rightEdgeForSelection:v5 withLeadingEdge:&v13];
    }
    [(CRLWPEditorHelper *)self p_setVisualSelectionWithCharIndex:v7 leadingEdge:v15 andAnchor:v12 andAnchorLeadingEdge:v13];
  }
}

- (void)moveToLeftEndOfLineAndModifySelection:(id)a3
{
}

- (void)moveToRightEndOfLineAndModifySelection:(id)a3
{
}

- (void)moveToBeginningOfLine:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self selection];
  if ([v4 isValid])
  {
    id v5 = [v4 start];
    unsigned __int8 v7 = [v4 isAtEndOfLine];
    unint64_t v6 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v5 withEolAffinity:&v7 toBoundary:4 inDirection:1 preferPosition:0 isLeadingEdge:0];
    if ((id)v6 != v5 || [v4 isRange]) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v6, 0, 0);
    }
  }
}

- (void)moveToEndOfLine:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self selection];
  if ([v4 isValid])
  {
    id v5 = (char *)[v4 end];
    unint64_t v6 = v5;
    if ([v4 isRange])
    {
      unsigned __int8 v7 = [(CRLWPEditorHelper *)self textSource];
      unsigned int v8 = sub_1001CA284((uint64_t)[v7 characterAtIndex:v5 - 1]);

      unint64_t v6 = &v5[-v8];
    }
    unsigned __int8 v9 = [(CRLWPEditorHelper *)self p_isCharIndex:v6 withEolAffinity:1 atBoundary:4 inDirection:0];
    if ([v4 isInsertionPoint]) {
      unsigned __int8 v9 = [v4 isAtEndOfLine];
    }
    unsigned __int8 v11 = v9;
    unint64_t v10 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v6 withEolAffinity:&v11 toBoundary:4 inDirection:0 preferPosition:0 isLeadingEdge:0];
    if ((char *)v10 != v5 || [v4 isRange]) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v10, 0, 1);
    }
  }
}

- (void)moveToBeginningOfLineAndModifySelection:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self editor];
  [v4 textSelectionWillChange];

  id v5 = [(CRLWPEditorHelper *)self selection];
  if ([v5 isValid])
  {
    id v6 = [v5 start];
    unsigned __int8 v8 = [v5 isAtEndOfLine];
    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", -[CRLWPEditorHelper p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:](self, "p_charIndexByMovingCharIndex:withEolAffinity:toBoundary:inDirection:preferPosition:isLeadingEdge:", v6, &v8, 4, 1, 0, 0), [v5 end]);
  }
  unsigned __int8 v7 = [(CRLWPEditorHelper *)self editor];
  [v7 textSelectionDidChange];
}

- (void)moveToEndOfLineAndModifySelection:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self editor];
  [v4 textSelectionWillChange];

  id v5 = [(CRLWPEditorHelper *)self selection];
  if ([v5 isValid])
  {
    id v6 = (char *)[v5 end];
    if ([v5 isInsertionPoint]) {
      unsigned __int8 v7 = [v5 isAtEndOfLine];
    }
    else {
      unsigned __int8 v7 = 1;
    }
    unsigned __int8 v11 = v7;
    if (![v5 isRange]
      || v6 != [v5 end]
      || ([(CRLWPEditorHelper *)self textSource],
          unsigned __int8 v8 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v9 = sub_1001CA284((uint64_t)[v8 characterAtIndex:v6 - 1]),
          v8,
          (v9 & 1) == 0))
    {
      id v6 = [(CRLWPEditorHelper *)self p_charIndexByMovingCharIndex:v6 withEolAffinity:&v11 toBoundary:4 inDirection:0 preferPosition:0 isLeadingEdge:0];
    }
    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v6, [v5 start]);
  }
  unint64_t v10 = [(CRLWPEditorHelper *)self editor];
  [v10 textSelectionDidChange];
}

- (void)moveToBeginningOfParagraph:(id)a3
{
  id v8 = [(CRLWPEditorHelper *)self editor];
  [v8 textSelectionWillChange];

  id v9 = [(CRLWPEditorHelper *)self selection];
  if ([v9 isValid])
  {
    id v4 = [v9 start];
    id v5 = [(CRLWPEditorHelper *)self textSource];
    id v6 = [v5 textRangeForParagraphAtCharIndex:v4];

    if (v6 != v4 || [v9 isRange]) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v6, 0, 0);
    }
  }
  unsigned __int8 v7 = [(CRLWPEditorHelper *)self editor];
  [v7 textSelectionDidChange];
}

- (void)moveToEndOfParagraph:(id)a3
{
  id v16 = [(CRLWPEditorHelper *)self editor];
  [v16 textSelectionWillChange];

  id v17 = [(CRLWPEditorHelper *)self selection];
  if ([v17 isValid])
  {
    id v4 = (char *)[v17 end];
    id v5 = v4;
    if ([v17 isRange])
    {
      id v6 = [(CRLWPEditorHelper *)self textSource];
      unsigned int v7 = sub_1001CA284((uint64_t)[v6 characterAtIndex:v4 - 1]);

      id v5 = &v4[-v7];
    }
    id v8 = [(CRLWPEditorHelper *)self textSource];
    id v9 = (char *)[v8 textRangeForParagraphAtCharIndex:v5];
    uint64_t v11 = v10;

    unint64_t v12 = &v9[v11];
    if (v11)
    {
      unsigned __int8 v13 = [(CRLWPEditorHelper *)self textSource];
      unsigned int v14 = sub_1001CA284((uint64_t)[v13 characterAtIndex:v12 - 1]);

      v12 -= v14;
    }
    if (v12 != v4 || [v17 isRange]) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v12, 0, 0);
    }
  }
  unsigned __int8 v15 = [(CRLWPEditorHelper *)self editor];
  [v15 textSelectionDidChange];
}

- (void)moveToBeginningOfParagraphAndModifySelection:(id)a3
{
  id v10 = [(CRLWPEditorHelper *)self editor];
  [v10 textSelectionWillChange];

  id v11 = [(CRLWPEditorHelper *)self selection];
  if ([v11 isValid])
  {
    id v4 = (char *)[v11 range];
    uint64_t v6 = v5;
    unsigned int v7 = [(CRLWPEditorHelper *)self textSource];
    id v8 = [v7 textRangeForParagraphAtCharIndex:v4];

    [(CRLWPEditorHelper *)self p_setSelectionWithCharIndex:v8 andAnchor:&v4[v6]];
  }
  id v9 = [(CRLWPEditorHelper *)self editor];
  [v9 textSelectionDidChange];
}

- (void)moveToEndOfParagraphAndModifySelection:(id)a3
{
  id v20 = [(CRLWPEditorHelper *)self editor];
  [v20 textSelectionWillChange];

  id v21 = [(CRLWPEditorHelper *)self selection];
  if ([v21 isValid])
  {
    id v4 = (char *)[v21 range];
    uint64_t v6 = v5;
    unsigned int v7 = &v4[v5];
    if ([v21 isRange])
    {
      id v8 = [(CRLWPEditorHelper *)self textSource];
      unsigned int v9 = sub_1001CA284((uint64_t)[v8 characterAtIndex:v7 - 1]);

      v7 -= v9;
    }
    id v10 = [(CRLWPEditorHelper *)self textSource];
    id v11 = (char *)[v10 textRangeForParagraphAtCharIndex:v7];
    uint64_t v13 = v12;

    unsigned int v14 = &v11[v13];
    if (v4 <= &v11[v13]) {
      unsigned __int8 v15 = &v11[v13];
    }
    else {
      unsigned __int8 v15 = v4;
    }
    if (v4 >= &v11[v13]) {
      id v16 = &v11[v13];
    }
    else {
      id v16 = v4;
    }
    if (v4 > v14 || v15 - v16 != v6)
    {
      if (v13)
      {
        id v17 = [(CRLWPEditorHelper *)self textSource];
        unsigned int v18 = sub_1001CA284((uint64_t)[v17 characterAtIndex:v14 - 1]);

        unsigned int v14 = &v11[v13 - v18];
      }
      [(CRLWPEditorHelper *)self p_setSelectionWithCharIndex:v14 andAnchor:v4];
    }
  }
  NSUInteger v19 = [(CRLWPEditorHelper *)self editor];
  [v19 textSelectionDidChange];
}

- (void)moveParagraphForward:(id)a3
{
  id v4 = a3;
  -[CRLWPEditorHelper moveForward:](self, "moveForward:");
  [(CRLWPEditorHelper *)self moveToEndOfParagraph:v4];
}

- (void)moveParagraphBackward:(id)a3
{
  id v4 = a3;
  -[CRLWPEditorHelper moveBackward:](self, "moveBackward:");
  [(CRLWPEditorHelper *)self moveToBeginningOfParagraph:v4];
}

- (void)moveParagraphForwardAndModifySelection:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self editor];
  [v4 textSelectionWillChange];

  uint64_t v5 = [(CRLWPEditorHelper *)self selection];
  if ([v5 isValid])
  {
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v6 = [(CRLWPEditorHelper *)self p_selectionEdgeToMutateWithDirection:0 newAnchor:&v13];
    unsigned int v7 = [(CRLWPEditorHelper *)self textSource];
    id v8 = [v7 textRangeForParagraphAtCharIndex:v6];
    uint64_t v10 = v9;

    unint64_t v11 = (unint64_t)v8 + v10;
    if (v6 < [(CRLWPEditorHelper *)self selectionAnchor]
      && [(CRLWPEditorHelper *)self selectionAnchor] < v11)
    {
      unint64_t v11 = v13;
    }
    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v11);
  }
  uint64_t v12 = [(CRLWPEditorHelper *)self editor];
  [v12 textSelectionDidChange];
}

- (void)moveParagraphBackwardAndModifySelection:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self editor];
  [v4 textSelectionWillChange];

  uint64_t v5 = [(CRLWPEditorHelper *)self selection];
  if ([v5 isValid])
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v6 = [(CRLWPEditorHelper *)self p_selectionEdgeToMutateWithDirection:1 newAnchor:&v11];
    unsigned int v7 = [(CRLWPEditorHelper *)self textSource];
    id v8 = [v7 textRangeForParagraphAtCharIndex:v6];

    if (v6 && (id)v6 == v8)
    {
      uint64_t v9 = [(CRLWPEditorHelper *)self textSource];
      id v8 = [v9 textRangeForParagraphAtCharIndex:v6 - 1];
    }
    if (v6 > [(CRLWPEditorHelper *)self selectionAnchor]
      && (id)[(CRLWPEditorHelper *)self selectionAnchor] > v8)
    {
      id v8 = (id)v11;
    }
    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v8);
  }
  uint64_t v10 = [(CRLWPEditorHelper *)self editor];
  [v10 textSelectionDidChange];
}

- (void)moveToBeginningOfDocument:(id)a3
{
  id v4 = [(CRLWPEditorHelper *)self selection];
  if ([v4 isValid]
    && ([v4 start] || objc_msgSend(v4, "isRange")))
  {
    -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", 0, 0, 0);
  }
}

- (void)moveToEndOfDocument:(id)a3
{
  id v6 = [(CRLWPEditorHelper *)self selection];
  if ([v6 isValid])
  {
    id v4 = [(CRLWPEditorHelper *)self textSource];
    uint64_t v5 = (char *)[v4 length];

    if (v5 - 1 != [v6 end] || objc_msgSend(v6, "isRange")) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v5 - 1, 0, 0);
    }
  }
}

- (void)moveToBeginningOfDocumentAndModifySelection:(id)a3
{
  id v5 = [(CRLWPEditorHelper *)self editor];
  [v5 textSelectionWillChange];

  id v6 = [(CRLWPEditorHelper *)self selection];
  if ([v6 isValid]) {
    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", 0, [v6 end]);
  }
  id v4 = [(CRLWPEditorHelper *)self editor];
  [v4 textSelectionDidChange];
}

- (void)moveToEndOfDocumentAndModifySelection:(id)a3
{
  id v7 = [(CRLWPEditorHelper *)self editor];
  [v7 textSelectionWillChange];

  id v8 = [(CRLWPEditorHelper *)self selection];
  if ([v8 isValid])
  {
    id v4 = [(CRLWPEditorHelper *)self textSource];
    id v5 = (char *)[v4 length];

    -[CRLWPEditorHelper p_setSelectionWithCharIndex:andAnchor:](self, "p_setSelectionWithCharIndex:andAnchor:", v5 - 1, [v8 start]);
  }
  id v6 = [(CRLWPEditorHelper *)self editor];
  [v6 textSelectionDidChange];
}

- (CGRect)p_viewRectForSelection:(id)a3
{
  id v4 = a3;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  if ([v4 isValid])
  {
    uint64_t v9 = -[objc_class selectionWithRange:](-[CRLWPEditorHelper wpSelectionClass](self, "wpSelectionClass"), "selectionWithRange:", [v4 start], 0);
    uint64_t v10 = [(CRLWPEditorHelper *)self editorController];
    uint64_t v11 = [v10 selectionPath];
    uint64_t v12 = [(CRLWPEditorHelper *)self selection];
    uint64_t v13 = [v11 selectionPathPoppingOffSelection:v12];

    unsigned int v14 = [v13 selectionPathWithAppendedSelection:v9];
    unsigned __int8 v15 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    id v16 = [v15 infoForSelectionPath:v14];

    id v17 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    unsigned int v18 = [v17 layoutForInfoNearestVisibleRect:v16 intersectingSelectionPath:v14];

    NSUInteger v19 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    [v19 layoutIfNeeded];

    uint64_t v20 = objc_opt_class();
    id v21 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    uint64_t v22 = [v21 repForLayout:v18];
    uint64_t v23 = sub_1002469D0(v20, v22);

    if (v23)
    {
      if ([v4 isRange]) {
        [v23 rectForSelection:v4 includeRuby:0 includePaginatedAttachments:0];
      }
      else {
        [v23 caretRectForSelection:v4];
      }
      CGFloat v28 = v24;
      CGFloat v29 = v25;
      CGFloat v30 = v26;
      CGFloat v31 = v27;
      memset(&v46[1], 0, sizeof(CGAffineTransform));
      if (v18) {
        [v18 transformInRoot];
      }
      v46[0] = v46[1];
      v47.origin.CGFloat x = v28;
      v47.origin.CGFloat y = v29;
      v47.size.CGFloat width = v30;
      v47.size.CGFloat height = v31;
      CGRect v48 = CGRectApplyAffineTransform(v47, v46);
      double v32 = v48.origin.x;
      double v33 = v48.origin.y;
      double v34 = v48.size.width;
      double v35 = v48.size.height;
      uint64_t v36 = [(CRLWPEditorHelper *)self interactiveCanvasController];
      id v37 = [v36 canvas];
      [v37 convertUnscaledToBoundsRect:v32, v33, v34, v35];
      CGFloat x = v38;
      CGFloat y = v39;
      CGFloat width = v40;
      CGFloat height = v41;
    }
  }

  double v42 = x;
  double v43 = y;
  double v44 = width;
  double v45 = height;
  result.size.CGFloat height = v45;
  result.size.CGFloat width = v44;
  result.origin.CGFloat y = v43;
  result.origin.CGFloat x = v42;
  return result;
}

- (BOOL)p_canReplaceSelection
{
  BOOL v3 = [(CRLWPEditorHelper *)self selection];
  if ([v3 isValid])
  {
    id v4 = [(CRLWPEditorHelper *)self selection];
    BOOL v5 = [v4 type] != (id)2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)notifySelectionChangedWithFlags:(unint64_t)a3
{
  BOOL v5 = +[NSNotificationCenter defaultCenter];
  v11[0] = @"CRLWPEditorKey";
  id v6 = [(CRLWPEditorHelper *)self editor];
  v12[0] = v6;
  v11[1] = @"CRLWPEditorSelectionFlagsKey";
  id v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  v12[1] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  uint64_t v9 = [(CRLWPEditorHelper *)self editor];
  uint64_t v10 = [v9 storage];
  [v5 postNotificationName:@"CRLTPEditorSelectionChanged" object:v10 userInfo:v8];
}

- (void)insertParagraphSeparator:(id)a3
{
  id v3 = [(CRLWPEditorHelper *)self editor];
  [v3 insertText:@"\n"];
}

- (void)insertNewlineIgnoringFieldEditor:(id)a3
{
  id v3 = [(CRLWPEditorHelper *)self editor];
  [v3 insertText:@"\n"];
}

- (BOOL)areCollabUserActionsCurrentlyPermitted
{
  return 1;
}

- (id)styleProvider
{
  return 0;
}

- (BOOL)editorKeyboardLanguageIsRTL
{
  v2 = [(CRLWPEditorHelper *)self editorKeyboardLanguage];
  BOOL v3 = (id)+[NSLocale characterDirectionForLanguage:v2] == (id)2;

  return v3;
}

- (const)p_lineFragmentWithCaretInfo:(id *)a3 forSelection:(id)a4
{
  id v43 = a4;
  id v6 = [(CRLWPEditorHelper *)self textSource];
  double v44 = 0;
  id v7 = -[CRLWPEditorHelper p_lineFragmentForCharIndex:column:eol:](self, "p_lineFragmentForCharIndex:column:eol:", [v43 insertionChar], &v44, 0);
  id v8 = v44;
  if (v7 && !v44)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED608);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109DB2C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED628);
    }
    uint64_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_lineFragmentWithCaretInfo:forSelection:]");
    uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:3990 isFatal:0 description:"Column should not be nil"];

    id v8 = v44;
  }
  if (!v8)
  {
    if (!v7) {
      goto LABEL_55;
    }
LABEL_16:
    unint64_t v14 = v7[3];
    id v15 = [v43 insertionChar];
    uint64_t v16 = sub_100159174((long long *)v7, (uint64_t)v15);
    BOOL v39 = v16 == 1;
    unsigned int v41 = [v43 leadingEdge];
    __int16 v40 = v14;
    if ((v14 & 0x1000) != 0) {
      int v17 = 2;
    }
    else {
      int v17 = 1;
    }
    int v42 = v17;
    if (v15 < [v6 length])
    {
      UChar32 v18 = sub_1001CBAB0((unint64_t)v15, v6);
      int v42 = sub_1001CD248(v18);
    }
    BOOL v19 = (v14 >> 12) & 1;
    if (([v43 isVisual] & 1) != 0
      || (unint64_t)v15 <= *v7
      || (v16 == 1) == [(CRLWPEditorHelper *)self editorKeyboardLanguageIsRTL])
    {
      int v38 = v16 == 1;
      if (v38 != v41) {
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v20 = [(CRLWPEditorHelper *)self textSource];
      id v15 = [v20 previousCharacterIndex:[v43 insertionChar]];

      LOBYTE(v41) = 0;
      if (sub_100159174((long long *)v7, (uint64_t)v15) == 1)
      {
        LOBYTE(v38) = 1;
        BOOL v39 = 1;
LABEL_27:
        id v21 = v6;
        uint64_t v22 = objc_opt_class();
        uint64_t v23 = sub_1002469D0(v22, v6);
        uint64_t v24 = sub_10015C1D4((uint64_t)v7, (uint64_t)v15, 3, v23);

        if ((uint64_t)v7[3] < 0) {
          double v25 = &xmmword_101176F48;
        }
        else {
          double v25 = (long long *)v7;
        }
        if (v24 == *(void *)v25 + *((void *)v25 + 1)) {
          unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v26 = v24;
        }
        if (v26 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v27 = sub_100159174((long long *)v7, v26);
          UChar32 v28 = sub_1001CBAB0(v26, v21);
          LOBYTE(v19) = v27 == 1;
          int v17 = sub_1001CD248(v28);
        }
        if (v15 == (id)sub_1001590D0((uint64_t)v7) && (*((unsigned char *)v7 + 25) & 8) != 0)
        {
          uint64_t v29 = (uint64_t)v15;
          int v30 = v42;
          if ((v40 & 0x1000) == 0)
          {
            BOOL v39 = 0;
            int v30 = 1;
            uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        else
        {
          uint64_t v29 = (uint64_t)v15;
          int v30 = v42;
        }
        BOOL v31 = v39;
LABEL_54:
        a3->var4 = v26;
        a3->var5 = v19;
        a3->unint64_t var2 = v41;
        a3->BOOL var6 = v17;
        a3->BOOL var7 = v29;
        a3->var8 = v31;
        a3->var9 = v30;
        a3->var0 = (unint64_t)v15;
        a3->var1 = v38;
        a3->unint64_t var3 = v42;
        id v6 = v21;
        goto LABEL_55;
      }
      LOBYTE(v38) = 0;
      BOOL v39 = 0;
    }
    uint64_t v32 = objc_opt_class();
    double v33 = sub_1002469D0(v32, v6);
    uint64_t v29 = sub_10015C1D4((uint64_t)v7, (uint64_t)v15, 2, v33);

    double v34 = &xmmword_101176F48;
    if ((uint64_t)v7[3] >= 0) {
      double v34 = (long long *)v7;
    }
    if (v29 == *(void *)v34 + *((void *)v34 + 1)) {
      uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    }
    BOOL v31 = (v14 & 0x1000) != 0;
    int v30 = v17;
    if (v29 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v35 = sub_100159174((long long *)v7, v29);
      UChar32 v36 = sub_1001CBAB0(v29, v6);
      BOOL v31 = v35 == 1;
      int v30 = sub_1001CD248(v36);
    }
    id v21 = v6;
    if (v15 == (id)sub_10015909C((uint64_t)v7) && (*((unsigned char *)v7 + 25) & 8) != 0)
    {
      unint64_t v26 = (unint64_t)v15;
      int v17 = v42;
      if ((v40 & 0x1000) != 0)
      {
        int v17 = 2;
        BOOL v39 = 1;
        unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      unint64_t v26 = (unint64_t)v15;
      int v17 = v42;
    }
    LOBYTE(v19) = v39;
    goto LABEL_54;
  }
  uint64_t v12 = [v8 storage];
  BOOL v13 = v12 != v6;

  if (!v13 && v7 != 0) {
    goto LABEL_16;
  }
  id v7 = 0;
LABEL_55:

  return v7;
}

- (unint64_t)getVisualDeletionIndexForSelection:(id)a3 backward:(BOOL *)a4
{
  id v6 = a3;
  if (a4)
  {
    int v7 = *a4;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED648);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109DC3C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED668);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper getVisualDeletionIndexForSelection:backward:]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:4096 isFatal:0 description:"backwards should never be NULL!"];

    int v7 = 1;
  }
  uint64_t v11 = (char *)[v6 range];
  if (([v6 isInsertionPoint] & 1) == 0)
  {
    [v6 range];
    if (((v12 != 0) & ~v7) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED688);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109DBB4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED6A8);
      }
      BOOL v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      unint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper getVisualDeletionIndexForSelection:backward:]");
      id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:4099 isFatal:0 description:"invalid selection type"];
    }
  }
  uint64_t v16 = [(CRLWPEditorHelper *)self p_lineFragmentWithCaretInfo:&v29 forSelection:v6];
  int v17 = (long long *)v16;
  if (!v16 || !v16[1] || ![v6 isVisual]) {
    goto LABEL_45;
  }
  if (([v6 isInsertionPoint] & 1) == 0)
  {
    [v6 range];
    char v19 = v18 ? v7 : 1;
    if (v19) {
      goto LABEL_45;
    }
  }
  uint64_t v20 = *((void *)v17 + 3);
  id v21 = &xmmword_101176F48;
  if (v20 >= 0) {
    id v21 = v17;
  }
  uint64_t v22 = *(char **)v21;
  uint64_t v23 = *((void *)v21 + 1) + (v20 << 52 >> 63);
  if (v31 != v34 && v32 != 3 && v35 != 3)
  {
    if (v31)
    {
      if ([(CRLWPEditorHelper *)self editorKeyboardLanguageIsRTL]) {
        uint64_t v24 = v30;
      }
      else {
        uint64_t v24 = v33;
      }
      LOBYTE(v7) = v24 == (char *)0x7FFFFFFFFFFFFFFFLL;
      if (v24 == (char *)0x7FFFFFFFFFFFFFFFLL) {
        v22 += v23;
      }
      else {
        uint64_t v22 = v24;
      }
      goto LABEL_46;
    }
    unint64_t v26 = [(CRLWPEditorHelper *)self textSource];
    if ([(CRLWPEditorHelper *)self editorKeyboardLanguageIsRTL])
    {
      uint64_t v27 = v33;
      if (v33 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_60:
        uint64_t v22 = (char *)[v26 nextCharacterIndex:v27];
        goto LABEL_61;
      }
      if (!v31)
      {
        uint64_t v27 = v30;
        goto LABEL_60;
      }
    }
    else
    {
      uint64_t v27 = v30;
      if (v30 != (char *)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_60;
      }
      if (v34)
      {
        uint64_t v27 = v33;
        goto LABEL_60;
      }
    }
LABEL_61:

    LOBYTE(v7) = 1;
    goto LABEL_46;
  }
  if (v31 == v34 || ![v6 isVisual])
  {
LABEL_45:
    uint64_t v22 = v11;
    goto LABEL_46;
  }
  if (v31)
  {
    if (v30 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      v22 += v23;
    }
    else {
      uint64_t v22 = v30;
    }
  }
  else if (v33 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    UChar32 v28 = [(CRLWPEditorHelper *)self textSource];
    uint64_t v22 = (char *)[v28 nextCharacterIndex:v33];
  }
LABEL_46:
  if (a4) {
    *a4 = v7;
  }

  return (unint64_t)v22;
}

- (id)characterStyleForDeletedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  BOOL v5 = [(CRLWPEditorHelper *)self textSource];
  id v6 = [v5 characterStyleAtCharIndex:location effectiveRange:v9];

  id v7 = 0;
  if (v6 && v9[0] == location)
  {
    if (v9[1] + location <= location + length) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }

  return v7;
}

- (void)p_deleteSelectionBackward:(BOOL)a3 decomposeCharacter:(BOOL)a4 smart:(BOOL)a5 kill:(BOOL)a6
{
  BOOL v52 = a3;
  id v7 = [(CRLWPEditorHelper *)self editor];
  [v7 unmarkText];

  id v49 = [(CRLWPEditorHelper *)self selection];
  if ([v49 isValid])
  {
    id v8 = [(CRLWPEditorHelper *)self textSource];
    if ([v8 length])
    {
      unsigned int v9 = [(CRLWPEditorHelper *)self areCollabUserActionsCurrentlyPermitted];

      if (!v9) {
        return;
      }
      uint64_t v10 = [(CRLWPEditorHelper *)self interactiveCanvasController];
      [v10 layoutIfNeeded];

      uint64_t v11 = [(CRLWPEditorHelper *)self interactiveCanvasController];
      uint64_t v12 = [v11 commandController];

      id v50 = (id)v12;
      if (!v12)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ED6C8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109DD4C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ED6E8);
        }
        BOOL v13 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        unint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_deleteSelectionBackward:decomposeCharacter:smart:kill:]");
        id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:4223 isFatal:0 description:"can't delete without a command controller"];
      }
      uint64_t v16 = [(CRLWPEditorHelper *)self selection];
      int v17 = (char *)[v16 superRange];
      uint64_t v19 = v18;

      uint64_t v20 = [(CRLWPEditorHelper *)self selection];
      id v21 = (char *)[v20 range];
      uint64_t v23 = v22;

      uint64_t v24 = [(CRLWPEditorHelper *)self textSource];
      BOOL v25 = &v17[v19] > [v24 length];

      if (v25)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ED708);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109DCC4();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014ED728);
        }
        unint64_t v26 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        uint64_t v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_deleteSelectionBackward:decomposeCharacter:smart:kill:]");
        UChar32 v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:4230 isFatal:0 description:"Trying to delete past end of storage"];
      }
      uint64_t v29 = [(CRLWPEditorHelper *)self textSource];
      BOOL v30 = &v21[v23] > [v29 length];

      if (v30) {
        goto LABEL_51;
      }
      if (v19)
      {
LABEL_50:
        CGRect v47 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v21, v23);
        CGRect v48 = [(CRLWPEditorHelper *)self editor];
        [v48 replace:v47 with:&stru_101538650];

LABEL_51:
        return;
      }
      char v31 = [(CRLWPEditorHelper *)self styleProvider];
      [(CRLWPEditorHelper *)self paragraphEnumeratorAtCharIndex:v17 styleProvider:v31];

      BOOL v32 = sub_10018A060((uint64_t)v51);
      if (v52 && v32)
      {
        char v34 = sub_100189F84((uint64_t)v51);
        int v35 = +[NSString stringWithFormat:@"%C", 65532, v50];
        UChar32 v36 = [v34 stringByReplacingOccurrencesOfString:v35 withString:&stru_101538650];

        if (![v36 length]
          || (sub_1001CA198(),
              id v37 = objc_claimAutoreleasedReturnValue(),
              [v36 stringByTrimmingCharactersInSet:v37],
              int v38 = objc_claimAutoreleasedReturnValue(),
              BOOL v39 = [v38 length] == 0,
              v38,
              v37,
              v39))
        {
          -[CRLWPEditorHelper p_deleteBackwardsOnEmptyListWithRange:ignoreLevel:](self, "p_deleteBackwardsOnEmptyListWithRange:ignoreLevel:", v21, v23, 1);

          goto LABEL_49;
        }
      }
      __int16 v40 = [(CRLWPEditorHelper *)self selection];
      id v21 = [(CRLWPEditorHelper *)self getVisualDeletionIndexForSelection:v40 backward:&v52];

      unsigned int v41 = [(CRLWPEditorHelper *)self textSource];
      int v42 = (char *)[v41 length];

      if (v52)
      {
        if (v21)
        {
          id v43 = [(CRLWPEditorHelper *)self textSource];
          double v44 = (char *)[v43 previousCharacterIndex:v21];

LABEL_43:
          if (v21 <= v44) {
            unsigned __int8 v46 = v44;
          }
          else {
            unsigned __int8 v46 = v21;
          }
          if (v21 >= v44) {
            id v21 = v44;
          }
          uint64_t v23 = v46 - v21;
        }
      }
      else if (v21 < v42 - 1)
      {
        double v45 = [(CRLWPEditorHelper *)self textSource];
        double v44 = (char *)[v45 nextCharacterIndex:v21];

        goto LABEL_43;
      }
LABEL_49:
      sub_100189C94(v51);
      goto LABEL_50;
    }
  }
}

- (BOOL)wantsToReceiveTextInput
{
  v2 = [(CRLWPEditorHelper *)self editor];
  unsigned __int8 v3 = [v2 wantsToReceiveTextInput];

  return v3;
}

- (void)deleteBackwardByDecomposingPreviousCharacter:(id)a3
{
  if ([(CRLWPEditorHelper *)self wantsToReceiveTextInput])
  {
    [(CRLWPEditorHelper *)self p_deleteSelectionBackward:1 decomposeCharacter:1 smart:0 kill:0];
  }
}

- (void)deleteWordForward:(id)a3
{
  if ([(CRLWPEditorHelper *)self wantsToReceiveTextInput])
  {
    id v7 = [(CRLWPEditorHelper *)self selection];
    unsigned int v4 = [v7 isValid];

    if (v4)
    {
      id v8 = [(CRLWPEditorHelper *)self selection];
      unsigned __int8 v5 = [v8 isInsertionPoint];

      if (v5)
      {
        BOOL v6 = [(CRLWPEditorHelper *)self continueKillRing];
        [(CRLWPEditorHelper *)self moveWordForwardAndModifySelection:self];
        [(CRLWPEditorHelper *)self setContinueKillRing:v6];
        [(CRLWPEditorHelper *)self p_deleteSelectionBackward:0 decomposeCharacter:0 smart:0 kill:0];
      }
      else
      {
        id v9 = [(CRLWPEditorHelper *)self editor];
        [v9 deleteForward:0];
      }
    }
  }
}

- (void)deleteWordBackward:(id)a3
{
  if ([(CRLWPEditorHelper *)self wantsToReceiveTextInput])
  {
    id v7 = [(CRLWPEditorHelper *)self selection];
    unsigned int v4 = [v7 isValid];

    if (v4)
    {
      id v8 = [(CRLWPEditorHelper *)self selection];
      unsigned __int8 v5 = [v8 isInsertionPoint];

      if (v5)
      {
        BOOL v6 = [(CRLWPEditorHelper *)self continueKillRing];
        [(CRLWPEditorHelper *)self moveWordBackwardAndModifySelection:self];
        [(CRLWPEditorHelper *)self setContinueKillRing:v6];
        [(CRLWPEditorHelper *)self p_deleteSelectionBackward:1 decomposeCharacter:0 smart:0 kill:0];
      }
      else
      {
        id v9 = [(CRLWPEditorHelper *)self editor];
        [v9 deleteBackward:0];
      }
    }
  }
}

- (void)deleteToBeginningOfLine:(id)a3
{
  if ([(CRLWPEditorHelper *)self wantsToReceiveTextInput])
  {
    unsigned int v4 = [(CRLWPEditorHelper *)self selection];
    unsigned int v5 = [v4 isValid];

    if (v5)
    {
      BOOL v6 = [(CRLWPEditorHelper *)self selection];
      unsigned int v7 = [v6 isInsertionPoint];

      if (v7)
      {
        BOOL v8 = [(CRLWPEditorHelper *)self continueKillRing];
        [(CRLWPEditorHelper *)self moveToBeginningOfLineAndModifySelection:self];
        [(CRLWPEditorHelper *)self setContinueKillRing:v8];
      }
      id v9 = [(CRLWPEditorHelper *)self selection];
      unsigned __int8 v10 = [v9 isInsertionPoint];

      if ((v10 & 1) == 0)
      {
        [(CRLWPEditorHelper *)self p_deleteSelectionBackward:1 decomposeCharacter:0 smart:0 kill:1];
      }
    }
  }
}

- (void)deleteToEndOfLine:(id)a3
{
  if ([(CRLWPEditorHelper *)self wantsToReceiveTextInput])
  {
    unsigned int v4 = [(CRLWPEditorHelper *)self selection];
    unsigned int v5 = [v4 isValid];

    if (v5)
    {
      BOOL v6 = [(CRLWPEditorHelper *)self selection];
      unsigned int v7 = [v6 isInsertionPoint];

      if (v7)
      {
        BOOL v8 = [(CRLWPEditorHelper *)self continueKillRing];
        [(CRLWPEditorHelper *)self moveToEndOfLineAndModifySelection:self];
        [(CRLWPEditorHelper *)self setContinueKillRing:v8];
      }
      id v9 = [(CRLWPEditorHelper *)self selection];
      unsigned __int8 v10 = [v9 isInsertionPoint];

      if ((v10 & 1) == 0)
      {
        [(CRLWPEditorHelper *)self p_deleteSelectionBackward:0 decomposeCharacter:0 smart:0 kill:1];
      }
    }
  }
}

- (void)deleteToBeginningOfParagraph:(id)a3
{
  if ([(CRLWPEditorHelper *)self wantsToReceiveTextInput])
  {
    unsigned int v4 = [(CRLWPEditorHelper *)self selection];
    unsigned int v5 = [v4 isValid];

    if (v5)
    {
      BOOL v6 = [(CRLWPEditorHelper *)self selection];
      unsigned int v7 = [v6 isInsertionPoint];

      if (v7)
      {
        BOOL v8 = [(CRLWPEditorHelper *)self continueKillRing];
        [(CRLWPEditorHelper *)self moveToBeginningOfParagraphAndModifySelection:self];
        [(CRLWPEditorHelper *)self setContinueKillRing:v8];
      }
      id v9 = [(CRLWPEditorHelper *)self selection];
      unsigned __int8 v10 = [v9 isInsertionPoint];

      if ((v10 & 1) == 0)
      {
        [(CRLWPEditorHelper *)self p_deleteSelectionBackward:1 decomposeCharacter:0 smart:0 kill:1];
      }
    }
  }
}

- (void)deleteToEndOfParagraph:(id)a3
{
  if (![(CRLWPEditorHelper *)self wantsToReceiveTextInput]) {
    return;
  }
  unsigned int v4 = [(CRLWPEditorHelper *)self selection];
  unsigned int v5 = [v4 isValid];

  if (!v5) {
    return;
  }
  BOOL v6 = [(CRLWPEditorHelper *)self selection];
  unsigned int v7 = [v6 isInsertionPoint];

  if (v7)
  {
    BOOL v8 = [(CRLWPEditorHelper *)self continueKillRing];
    [(CRLWPEditorHelper *)self moveToEndOfParagraphAndModifySelection:self];
    [(CRLWPEditorHelper *)self setContinueKillRing:v8];
  }
  id v9 = [(CRLWPEditorHelper *)self selection];
  if ([v9 isInsertionPoint])
  {
    unsigned __int8 v10 = [(CRLWPEditorHelper *)self selection];
    id v11 = [v10 range];
    uint64_t v12 = [(CRLWPEditorHelper *)self textSource];
    if (v11 < [v12 length])
    {
      BOOL v13 = [(CRLWPEditorHelper *)self textSource];
      unint64_t v14 = [(CRLWPEditorHelper *)self selection];
      unsigned int v15 = sub_1001CA284((uint64_t)[v13 characterAtIndex:[v14 range]]);

      if (v15)
      {
        BOOL v16 = [(CRLWPEditorHelper *)self continueKillRing];
        [(CRLWPEditorHelper *)self moveForwardAndModifySelection:self];
        [(CRLWPEditorHelper *)self setContinueKillRing:v16];
      }
      goto LABEL_11;
    }
  }
LABEL_11:
  int v17 = [(CRLWPEditorHelper *)self selection];
  unsigned __int8 v18 = [v17 isInsertionPoint];

  if ((v18 & 1) == 0)
  {
    [(CRLWPEditorHelper *)self p_deleteSelectionBackward:0 decomposeCharacter:0 smart:0 kill:1];
  }
}

- (void)yank:(id)a3
{
  if ([(CRLWPEditorHelper *)self wantsToReceiveTextInput])
  {
    id v11 = [(CRLWPEditorHelper *)self selection];
    unsigned int v4 = [v11 isValid];

    if (v4)
    {
      sub_1003E6F00();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v5 = [_TtC8Freeform12CRLTextRange alloc];
      BOOL v6 = [(CRLWPEditorHelper *)self selection];
      id v7 = [v6 range];
      id v9 = -[CRLTextRange initWithRange:](v5, "initWithRange:", v7, v8);

      unsigned __int8 v10 = [(CRLWPEditorHelper *)self editor];
      [v10 replace:v9 with:v12];

      sub_1003E6EF0();
    }
  }
}

- (void)yankAndSelect:(id)a3
{
  if ([(CRLWPEditorHelper *)self wantsToReceiveTextInput])
  {
    id v10 = [(CRLWPEditorHelper *)self selection];
    unsigned int v4 = [v10 isValid];

    if (v4)
    {
      sub_1003E6F68();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v5 = [(CRLWPEditorHelper *)self selection];
      id v6 = [v5 range];
      id v7 = [v11 length];

      uint64_t v8 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v6, v7);
      id v9 = [(CRLWPEditorHelper *)self editor];
      [v9 replace:v8 with:v11];

      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v6, v7, 0);
      sub_1003E6EF0();
    }
  }
}

- (void)setMark:(id)a3
{
  id v7 = [(CRLWPEditorHelper *)self selection];
  unsigned int v4 = [v7 isValid];

  if (v4)
  {
    id v8 = [(CRLWPEditorHelper *)self selection];
    id v5 = [v8 range];
    -[CRLWPEditorHelper setEmacsMarkRange:](self, "setEmacsMarkRange:", v5, v6);
  }
}

- (_NSRange)p_sanitizeMark
{
  unsigned __int8 v3 = [(CRLWPEditorHelper *)self emacsMarkRange];
  NSUInteger v5 = v4;
  uint64_t v6 = [(CRLWPEditorHelper *)self textSource];
  id v7 = [v6 length];

  id v8 = [(CRLWPEditorHelper *)self textSource];
  id v9 = [v8 length];
  if (v3 >= v7) {
    unsigned __int8 v3 = v7;
  }
  if (v5 >= v9 - v3) {
    NSUInteger v5 = v9 - v3;
  }

  [(CRLWPEditorHelper *)self emacsMarkRange];
  NSUInteger v10 = (NSUInteger)v3;
  NSUInteger v11 = v5;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (void)deleteToMark:(id)a3
{
  id v10 = [(CRLWPEditorHelper *)self selection];
  if ([v10 isValid])
  {
    id v4 = [(CRLWPEditorHelper *)self emacsMarkRange];

    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v5 = [(CRLWPEditorHelper *)self p_sanitizeMark];
      NSUInteger v7 = v6;
      id v11 = [(CRLWPEditorHelper *)self selection];
      v14.NSUInteger location = (NSUInteger)[v11 range];
      v14.NSUInteger length = v8;
      v13.NSUInteger location = (NSUInteger)v5;
      v13.NSUInteger length = v7;
      NSRange v9 = NSUnionRange(v13, v14);

      if (v9.length)
      {
        -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v9.location, v9.length, 0);
        [(CRLWPEditorHelper *)self p_deleteSelectionBackward:0 decomposeCharacter:0 smart:0 kill:1];
      }
    }
  }
  else
  {
  }
}

- (void)selectToMark:(id)a3
{
  id v10 = [(CRLWPEditorHelper *)self selection];
  if ([v10 isValid])
  {
    id v4 = [(CRLWPEditorHelper *)self emacsMarkRange];

    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v5 = [(CRLWPEditorHelper *)self p_sanitizeMark];
      NSUInteger v7 = v6;
      -[CRLWPEditorHelper setEmacsMarkRange:](self, "setEmacsMarkRange:", v5, v6);
      id v11 = [(CRLWPEditorHelper *)self selection];
      v14.NSUInteger location = (NSUInteger)[v11 range];
      v14.NSUInteger length = v8;
      v13.NSUInteger location = (NSUInteger)v5;
      v13.NSUInteger length = v7;
      NSRange v9 = NSUnionRange(v13, v14);

      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v9.location, v9.length, 0);
    }
  }
  else
  {
  }
}

- (void)swapWithMark:(id)a3
{
  id v10 = [(CRLWPEditorHelper *)self selection];
  if ([v10 isValid])
  {
    id v4 = [(CRLWPEditorHelper *)self emacsMarkRange];

    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v5 = [(CRLWPEditorHelper *)self p_sanitizeMark];
      uint64_t v7 = v6;
      id v11 = [(CRLWPEditorHelper *)self selection];
      id v8 = [v11 range];
      -[CRLWPEditorHelper setEmacsMarkRange:](self, "setEmacsMarkRange:", v8, v9);

      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v5, v7, 0);
    }
  }
  else
  {
  }
}

- (BOOL)p_storageRangeCanBeTransposed:(_NSRange)a3 storage:(id)a4
{
  return 1;
}

- (BOOL)p_filteredRangeCanBeTransposed:(_NSRange)a3 inFilteredStorage:(id)a4
{
  return [a4 hasSmartFieldsInRange:a3.location, a3.length] ^ 1;
}

- (void)transpose:(id)a3
{
  id v26 = [(CRLWPEditorHelper *)self selection];
  if ([v26 isInsertionPoint])
  {
    id v4 = [v26 range];
    id v5 = [(CRLWPEditorHelper *)self textSource];
    id v6 = [v5 length];
    if (v4 && v4 == v6) {
      id v4 = [v5 previousCharacterIndex:v4];
    }
    if (v4)
    {
      if (v4 < [v5 length])
      {
        unint64_t v7 = -[CRLWPEditorHelper p_indexToTransposableCharacterStartingAtIndex:filterStorage:searchTowardsStorageStart:](self, "p_indexToTransposableCharacterStartingAtIndex:filterStorage:searchTowardsStorageStart:", [v5 previousCharacterIndex:v4], v5, 1);
        unint64_t v8 = [(CRLWPEditorHelper *)self p_indexToTransposableCharacterStartingAtIndex:v4 filterStorage:v5 searchTowardsStorageStart:0];
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v9 = v8;
          if (v8 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v10 = [v5 nextCharacterIndex:v8];
            if (v7 <= (unint64_t)v10) {
              id v11 = v10;
            }
            else {
              id v11 = (unsigned char *)v7;
            }
            if (v7 >= (unint64_t)v10) {
              id v12 = v10;
            }
            else {
              id v12 = (unsigned char *)v7;
            }
            uint64_t v13 = objc_opt_class();
            NSRange v14 = [(CRLWPEditorHelper *)self textSource];
            unsigned int v15 = sub_1002469D0(v13, v14);

            if (v15)
            {
              id v16 = [v5 charRangeMappedToStorage:v12, v11 - v12];
              if (-[CRLWPEditorHelper p_storageRangeCanBeTransposed:storage:](self, "p_storageRangeCanBeTransposed:storage:", v16, v17, v15))
              {
                if (-[CRLWPEditorHelper p_filteredRangeCanBeTransposed:inFilteredStorage:](self, "p_filteredRangeCanBeTransposed:inFilteredStorage:", v12, v11 - v12, v5))
                {
                  id v18 = [v5 charRangeMappedToStorage:v7, (char *)[v5 nextCharacterIndex:v7] - v7];
                  uint64_t v20 = v19;
                  id v21 = [v5 charRangeMappedToStorage:v9, [v5 nextCharacterIndex:v9] - v9];
                  uint64_t v23 = v22;
                  if (-[CRLWPEditorHelper p_transposeRanges:withRange:](self, "p_transposeRanges:withRange:", v18, v20, v21, v22))
                  {
                    uint64_t v24 = [(CRLWPEditorHelper *)self editor];
                    BOOL v25 = +[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", &v21[v23], 0);
                    [v24 setSelection:v25];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)transposeWords:(id)a3
{
  id v29 = [(CRLWPEditorHelper *)self selection];
  if ([v29 isInsertionPoint])
  {
    id v4 = [v29 range];
    id v5 = [(CRLWPEditorHelper *)self textSource];
    id v6 = v5;
    if (v4
      && v4 < [v5 length]
      && ((sub_1001CA478((uint64_t)[v6 characterAtIndex:v4]) & 1) != 0
       || sub_1001CA478((uint64_t)objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v6, "previousCharacterIndex:", v4)))))
    {
      if (sub_1001CA378((uint64_t)objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v6, "previousCharacterIndex:", v4)))&& (id v4 = objc_msgSend(v6, "previousCharacterIndex:", v4)) == 0)
      {
        uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v9 = 0;
      }
      else
      {
        do
        {
          uint64_t v7 = (uint64_t)[v6 wordAtCharIndex:v4 includePreviousWord:1];
          uint64_t v9 = v8;
          id v10 = [v6 previousCharacterIndex:v4];
          id v4 = v10;
        }
        while (v7 == 0x7FFFFFFFFFFFFFFFLL && v9 == 0 && v10 != 0);
      }
      if (v7 != 0x7FFFFFFFFFFFFFFFLL && v9)
      {
        id v13 = [v6 nextCharacterIndex:v9 + v7];
        unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v14 = 0;
        do
        {
          if (v13 >= [v6 length]) {
            break;
          }
          unint64_t v15 = (unint64_t)[v6 wordAtCharIndex:v13 includePreviousWord:1];
          uint64_t v14 = v16;
          id v13 = [v6 nextCharacterIndex:v13];
        }
        while (v15 == 0x7FFFFFFFFFFFFFFFLL && v14 == 0);
        if (v15 != 0x7FFFFFFFFFFFFFFFLL && v14)
        {
          id v18 = [v6 nextCharacterIndex:];
          if (v15 <= (unint64_t)v18) {
            uint64_t v19 = v18;
          }
          else {
            uint64_t v19 = (unsigned char *)v15;
          }
          if (v15 >= (unint64_t)v18) {
            uint64_t v20 = v18;
          }
          else {
            uint64_t v20 = (unsigned char *)v15;
          }
          uint64_t v21 = objc_opt_class();
          uint64_t v22 = [(CRLWPEditorHelper *)self textSource];
          uint64_t v23 = sub_1002469D0(v21, v22);

          id v24 = [v6 charRangeMappedToStorage:v20, v19 - v20];
          if (-[CRLWPEditorHelper p_storageRangeCanBeTransposed:storage:](self, "p_storageRangeCanBeTransposed:storage:", v24, v25, v23)&& -[CRLWPEditorHelper p_transposeRanges:withRange:](self, "p_transposeRanges:withRange:", v7, v9, v15, v14))
          {
            id v26 = [(CRLWPEditorHelper *)self editor];
            uint64_t v27 = [v26 textSelectionDelegate];
            UChar32 v28 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v14 + v15, 0);
            [v27 setSelectedTextRange:v28];
          }
        }
      }
    }
  }
}

- (BOOL)p_transposeRanges:(_NSRange)a3 withRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a3.location >= a4.location)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED748);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109DEE4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED768);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_transposeRanges:withRange:]");
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:4734 isFatal:0 description:"bad ranges"];
  }
  if (!a3.length || !length)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED788);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109DE5C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED7A8);
    }
    uint64_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_transposeRanges:withRange:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:4735 isFatal:0 description:"bad range lengths"];
  }
  v42.NSUInteger location = location;
  v42.NSUInteger length = length;
  NSUInteger v12 = NSIntersectionRange(a3, v42).length;
  if (v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED7C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109DDD4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED7E8);
    }
    id v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_transposeRanges:withRange:]");
    unint64_t v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:4737 isFatal:0 description:"overlapping transposition ranges"];
  }
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = [(CRLWPEditorHelper *)self textSource];
  id v18 = sub_1002469D0(v16, v17);

  if (!v12)
  {
    id v38 = -[CRLWPStorage initFromStorage:withRange:]([_TtC8Freeform12CRLWPStorage alloc], "initFromStorage:withRange:", v18, a3.location, a3.length);
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = [(CRLWPEditorHelper *)self textSource];
    BOOL v39 = sub_1002469D0(v19, v20);

    id v37 = -[CRLWPStorage initFromStorage:withRange:]([_TtC8Freeform12CRLWPStorage alloc], "initFromStorage:withRange:", v39, location, length);
    uint64_t v21 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    uint64_t v22 = [v21 commandController];

    [v22 openGroup];
    uint64_t v23 = [_TtC8Freeform23CRLWPReplaceTextCommand alloc];
    id v24 = [(CRLWPEditorHelper *)self editor];
    uint64_t v25 = [v24 enclosingShape];
    id v26 = [v38 string];
    uint64_t v27 = -[CRLWPReplaceTextCommand initWithShapeItem:range:text:](v23, "initWithShapeItem:range:text:", v25, location, length, v26);

    [v22 enqueueCommand:v27];
    UChar32 v28 = [_TtC8Freeform23CRLWPReplaceTextCommand alloc];
    id v29 = [(CRLWPEditorHelper *)self editor];
    BOOL v30 = [v29 enclosingShape];
    char v31 = [v37 string];
    BOOL v32 = -[CRLWPReplaceTextCommand initWithShapeItem:range:text:](v28, "initWithShapeItem:range:text:", v30, a3.location, a3.length, v31);

    double v33 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    char v34 = [v33 canvasEditor];

    int v35 = [[CRLCanvasCommandSelectionBehavior alloc] initWithCanvasEditor:v34 type:2];
    [v22 enqueueCommand:v32 withSelectionBehavior:v35];
    [v22 closeGroup];
  }
  return v12 == 0;
}

- (id)protectedSelectionBehaviorForCommand:(id)a3
{
  id v4 = [CRLCommandSelectionBehavior alloc];
  id v5 = [(CRLWPEditorHelper *)self interactiveCanvasController];
  id v6 = [v5 editorController];
  uint64_t v7 = [v6 selectionPath];
  uint64_t v8 = [(CRLWPEditorHelper *)self interactiveCanvasController];
  uint64_t v9 = [v8 editorController];
  id v10 = [v9 selectionPath];
  id v11 = [(CRLCommandSelectionBehavior *)v4 initWithForwardSelectionPath:v7 reverseSelectionPath:v10 selectionFlags:0];

  return v11;
}

- (BOOL)isACurrentEditor
{
  unsigned __int8 v3 = [(CRLWPEditorHelper *)self editorController];
  id v4 = [v3 currentEditors];
  id v5 = [(CRLWPEditorHelper *)self editor];
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (void)p_replaceRange:(_NSRange)a3 withText:(id)a4 dictationAndAutocorrectionKey:(id)a5 applyingDictationAlternative:(BOOL)a6 restoreSelection:(id)a7
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v12 = a4;
  id v46 = a5;
  id v47 = a7;
  CGRect v48 = v12;
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED808);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109DFF4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED828);
    }
    id v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_replaceRange:withText:dictationAndAutocorrectionKey:applyingDictationAlternative:restoreSelection:]");
    unint64_t v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 4870, 0, "invalid nil value for '%{public}s'", "aStr");
  }
  uint64_t v16 = [(CRLWPEditorHelper *)self editor];
  uint64_t v17 = [v16 storage];
  BOOL v18 = location + length > (unint64_t)[v17 length];

  if (v18)
  {
    unsigned int v19 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED848);
    }
    uint64_t v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      v62.NSUInteger location = location;
      v62.NSUInteger length = length;
      NSStringFromRange(v62);
      id v45 = (id)objc_claimAutoreleasedReturnValue();
      double v44 = [(CRLWPEditorHelper *)self editor];
      id v43 = [v44 storage];
      *(_DWORD *)buf = 67110402;
      unsigned int v50 = v19;
      __int16 v51 = 2082;
      BOOL v52 = "-[CRLWPEditorHelper p_replaceRange:withText:dictationAndAutocorrectionKey:applyingDictationAlternative:restoreSelection:]";
      __int16 v53 = 2082;
      uint64_t v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm";
      __int16 v55 = 1024;
      int v56 = 4872;
      __int16 v57 = 2114;
      id v58 = v45;
      __int16 v59 = 2048;
      id v60 = [v43 length];
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Bad replacement range %{public}@ is past end of storage: %lu", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED868);
    }
    uint64_t v21 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_replaceRange:withText:dictationAndAutocorrectionKey:applyingDictationAlternative:restoreSelection:]");
    uint64_t v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    v61.NSUInteger location = location;
    v61.NSUInteger length = length;
    id v24 = NSStringFromRange(v61);
    uint64_t v25 = [(CRLWPEditorHelper *)self editor];
    id v26 = [v25 storage];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 4872, 0, "Bad replacement range %{public}@ is past end of storage: %lu", v24, [v26 length]);
  }
  uint64_t v27 = [(CRLWPEditorHelper *)self editor];
  UChar32 v28 = [v27 storage];
  BOOL v29 = location + length > (unint64_t)[v28 length];

  if (!v29)
  {
    id v30 = [objc_alloc(-[CRLWPEditorHelper wpSelectionClass](self, "wpSelectionClass")) initWithRange:location, length];
    char v31 = [(CRLWPEditorHelper *)self interactiveCanvasController];
    BOOL v32 = [v31 commandController];

    if (!v32)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED888);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109DF6C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014ED8A8);
      }
      double v33 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      char v34 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_replaceRange:withText:dictationAndAutocorrectionKey:applyingDictationAlternative:restoreSelection:]");
      int v35 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v34 file:v35 lineNumber:4895 isFatal:0 description:"can't delete without a command controller"];
    }
    UChar32 v36 = [(CRLWPEditorHelper *)self editor];
    id v37 = [_TtC8Freeform12CRLTextRange alloc];
    id v38 = [v30 superRange];
    __int16 v40 = -[CRLTextRange initWithRange:](v37, "initWithRange:", v38, v39);
    unsigned int v41 = [v36 commandForReplacingTextInRange:v40 withText:v48];

    NSRange v42 = [(CRLWPEditorHelper *)self protectedSelectionBehaviorForCommand:v41];
    [v32 enqueueCommand:v41 withSelectionBehavior:v42];
  }
}

- (void)replaceRange:(_NSRange)a3 withText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  uint64_t v7 = [(CRLWPEditorHelper *)self editor];
  unsigned int v8 = [v7 wantsToReceiveTextInput];

  if (v8) {
    -[CRLWPEditorHelper p_replaceRange:withText:dictationAndAutocorrectionKey:applyingDictationAlternative:restoreSelection:](self, "p_replaceRange:withText:dictationAndAutocorrectionKey:applyingDictationAlternative:restoreSelection:", location, length, v9, 0, 0, 0);
  }
}

- (void)p_transformWordWithActionString:(id)a3 usingBlock:(id)a4
{
  id v38 = a3;
  unsigned __int8 v6 = (void (**)(id, void *))a4;
  [(CRLWPEditorHelper *)self selectWord:self];
  uint64_t v7 = [(CRLWPEditorHelper *)self selection];
  uint64_t v39 = self;
  LODWORD(self) = [v7 isRange];

  if (self)
  {
    unsigned int v8 = [(CRLWPEditorHelper *)v39 selection];
    id v9 = [v8 range];
    NSUInteger v40 = v10;
    NSUInteger v41 = (NSUInteger)v9;

    id v11 = [(CRLWPEditorHelper *)v39 selection];
    -[CRLWPEditorHelper paragraphEnumeratorAtCharIndex:](v39, "paragraphEnumeratorAtCharIndex:", [v11 range]);

    while (!sub_100189E50((uint64_t)v47))
      sub_100189E20((uint64_t)v47);
    id v12 = [(CRLWPEditorHelper *)v39 interactiveCanvasController];
    id v37 = [v12 commandController];

    UChar32 v36 = objc_opt_new();
    id v13 = [(CRLWPEditorHelper *)v39 textSource];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1003182E8;
    v45[3] = &unk_1014ED8D0;
    id v42 = v36;
    id v46 = v42;
    [v13 enumerateSmartFieldsWithAttributeKind:6 inRange:v41 usingBlock:v40, v45];

    uint64_t v14 = [(CRLWPEditorHelper *)v39 editor];
    unint64_t v15 = [v14 storage];

    id v43 = objc_alloc_init((Class)NSMutableArray);
    double v44 = objc_opt_new();
    while (1)
    {
      v48.NSUInteger location = (NSUInteger)sub_100189F3C((uint64_t)v47);
      v49.NSUInteger length = v40;
      v49.NSUInteger location = v41;
      NSRange v16 = NSIntersectionRange(v48, v49);
      uint64_t v17 = -[CRLWPRangeArray initWithRange:]([CRLWPMutableRangeArray alloc], "initWithRange:", v16.location, v16.length);
      if (objc_msgSend(v42, "intersectsRange:", v16.location, v16.length)) {
        [(CRLWPMutableRangeArray *)v17 subtract:v42];
      }
      BOOL v18 = [(CRLWPRangeArray *)v17 rangeCount];
      if ((uint64_t)(v18 - 1) >= 0)
      {
        do
        {
          id v19 = [(CRLWPRangeArray *)v17 rangeAtIndex:--v18];
          if (v20)
          {
            uint64_t v21 = [v15 charRangeMappedFromStorage:v19, v20];
            uint64_t v23 = v22;
            uint64_t v24 = v22 - 1;
            id v25 = [v15 characterAtIndex:&v21[v22 - 1]];
            if (v23)
            {
              if ((sub_1001CA284((uint64_t)v25) & 1) == 0 || (uint64_t v23 = v24) != 0)
              {
                id v26 = [v15 substringWithRange:v21, v23];
                uint64_t v27 = v6[2](v6, v26);
                [v27 length];
                [v26 length];
                id v28 = v27;

                id v29 = [v15 charRangeMappedToStorage:v21, v23];
                uint64_t v31 = v30;
                if ([v28 length])
                {
                  [v43 addObject:v28];
                  [v44 concatenateRange:v29, v31];
                }
              }
            }
          }
        }
        while ((uint64_t)v18 > 0);
      }
      if (sub_10018A0D4((uint64_t)v47)) {
        break;
      }
      sub_100189DFC((uint64_t)v47);
    }
    if ([v44 rangeCount])
    {
      [v37 openGroup];
      [v37 setCurrentGroupActionString:v38];
      for (unint64_t i = 0; i < (unint64_t)[v44 rangeCount]; ++i)
      {
        double v33 = [v43 objectAtIndexedSubscript:i];
        id v34 = [v44 rangeAtIndex:i];
        -[CRLWPEditorHelper replaceRange:withText:](v39, "replaceRange:withText:", v34, v35, v33);
      }
      [v37 closeGroup];
    }

    sub_100189C94(v47);
  }
}

- (void)uppercaseWord:(id)a3
{
  id v5 = +[NSBundle mainBundle];
  id v4 = [v5 localizedStringForKey:@"Make Upper Case" value:0 table:@"UndoStrings"];
  [(CRLWPEditorHelper *)self p_transformWordWithActionString:v4 usingBlock:&stru_1014ED910];
}

- (void)lowercaseWord:(id)a3
{
  id v5 = +[NSBundle mainBundle];
  id v4 = [v5 localizedStringForKey:@"Make Lower Case" value:0 table:@"UndoStrings"];
  [(CRLWPEditorHelper *)self p_transformWordWithActionString:v4 usingBlock:&stru_1014ED930];
}

- (void)capitalizeWord:(id)a3
{
  id v5 = +[NSBundle mainBundle];
  id v4 = [v5 localizedStringForKey:@"Capitalize" value:0 table:@"UndoStrings"];
  [(CRLWPEditorHelper *)self p_transformWordWithActionString:v4 usingBlock:&stru_1014ED950];
}

- (unint64_t)getVisualInsertionPointIndexForString:(id)a3 selection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(CRLWPEditorHelper *)self interactiveCanvasController];
  [v8 layoutIfNeeded];

  if (![v7 isInsertionPoint] || (objc_msgSend(v7, "isVisual") & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED970);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109E088();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED990);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    NSUInteger v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper getVisualInsertionPointIndexForString:selection:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:5122 isFatal:0 description:"invalid selection type"];
  }
  id v12 = (char *)[v7 range];
  id v13 = [(CRLWPEditorHelper *)self p_lineFragmentWithCaretInfo:v65 forSelection:v7];
  if (!v13) {
    goto LABEL_107;
  }
  if (![v7 isInsertionPoint]) {
    goto LABEL_107;
  }
  if (![v7 isVisual]) {
    goto LABEL_107;
  }
  uint64_t v14 = v13[3];
  if ((v14 & 0x4000) != 0) {
    goto LABEL_107;
  }
  if (v14 < 0) {
    unint64_t v15 = &xmmword_101176F48;
  }
  else {
    unint64_t v15 = (long long *)v13;
  }
  uint64_t v60 = *((void *)v15 + 1);
  if (objc_msgSend(v6, "length", *(void *)v15)) {
    int v61 = sub_1001CD248([v6 crlwp_utf32CharacterAtIndex:0]);
  }
  else {
    int v61 = 6;
  }
  long long v64 = xmmword_101176F48;
  unint64_t v16 = (unint64_t)v66;
  if (v66 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = [(CRLWPEditorHelper *)self editor];
    BOOL v18 = [v17 storage];
    BOOL v19 = v16 < (unint64_t)[v18 length];

    if (v19)
    {
      uint64_t v20 = [(CRLWPEditorHelper *)self editor];
      uint64_t v21 = [v20 storage];
      uint64_t v22 = [v21 smartFieldAtCharIndex:v66 attributeKind:6 effectiveRange:&v64];

      if (v22)
      {
        if ((*((unsigned char *)v13 + 25) & 0x10) != 0)
        {
LABEL_26:
          id v12 = (char *)v64;

          goto LABEL_107;
        }
LABEL_30:
        uint64_t v26 = *((void *)&v64 + 1);
        uint64_t v25 = v64;

        id v12 = (char *)(v26 + v25);
        goto LABEL_107;
      }
    }
  }
  if (v69 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v23 = [(CRLWPEditorHelper *)self editor];
    uint64_t v24 = [v23 storage];
    uint64_t v22 = [v24 smartFieldAtCharIndex:v69 attributeKind:6 effectiveRange:&v64];

    if (v22)
    {
      if ((*((unsigned char *)v13 + 25) & 0x10) == 0) {
        goto LABEL_26;
      }
      goto LABEL_30;
    }
  }
  if (v68 == v71) {
    goto LABEL_107;
  }
  uint64_t v27 = v60 + (v14 << 52 >> 63);
  if (v61 == v68)
  {
    id v12 = v66;
    if (v66 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v28 = v27 & (v14 << 51 >> 63);
LABEL_40:
      id v12 = (char *)(v28 + v59);
      goto LABEL_107;
    }
    if (!v67)
    {
      id v29 = [(CRLWPEditorHelper *)self editor];
      uint64_t v30 = [v29 storage];
      id v12 = (char *)[v30 nextCharacterIndex:v66];
    }
    goto LABEL_107;
  }
  if (v61 != v71)
  {
    if ((v61 - 1) >= 3)
    {
      if (sub_1001CEEA0()) {
        int v31 = 2;
      }
      else {
        int v31 = 1;
      }
      int v61 = v31;
    }
    sub_10015B2B4(v13, &__p);
    if (v66 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v32 = 0;
    }
    else
    {
      int64_t v35 = v63 - (unsigned char *)__p;
      if (v63 == __p) {
        goto LABEL_69;
      }
      unint64_t v36 = 0;
      uint64_t v37 = v35 / 40;
      BOOL v42 = v35 / 40 != 0;
      unint64_t v38 = v35 / 40 - 1;
      if (v38 == 0 || !v42) {
        uint64_t v37 = 1;
      }
      uint64_t v39 = (char *)__p + 24;
      while (1)
      {
        unint64_t v40 = *(v39 - 1);
        BOOL v42 = (unint64_t)v66 >= v40;
        NSUInteger v41 = &v66[-v40];
        BOOL v42 = !v42 || (unint64_t)v41 >= *v39;
        if (!v42) {
          break;
        }
        v39 += 5;
        if (v37 == ++v36)
        {
          unint64_t v36 = v37;
          break;
        }
      }
      unint64_t v32 = v36 + 1;
      if (v36 == 0x7FFFFFFFFFFFFFFELL || v36 >= v38) {
        goto LABEL_69;
      }
    }
    if (*((unsigned char *)__p + 40 * v32 + 33)) {
      BOOL v43 = v61 == 2;
    }
    else {
      BOOL v43 = 0;
    }
    if (v43)
    {
      if (v69 == *((char **)__p + 5 * v32 + 2))
      {
        id v47 = [(CRLWPEditorHelper *)self editor];
        NSRange v48 = [v47 storage];
        id v12 = (char *)[v48 nextCharacterIndex:*((void *)__p + 5 * v32 + 1)];

        goto LABEL_105;
      }
      goto LABEL_75;
    }
LABEL_69:
    if (v61 != 2)
    {
      if (v61 != 3)
      {
        BOOL v46 = v67 == 0;
        BOOL v44 = v70 == 0;
        int v45 = 1;
        goto LABEL_87;
      }
      if (!(v67 | v70))
      {
        BOOL v44 = 1;
        int v45 = 1;
        BOOL v46 = 1;
        goto LABEL_87;
      }
      BOOL v49 = sub_1001CEEA0();
LABEL_78:
      int v45 = !v49;
      BOOL v46 = v67 == 0;
      if (v49 && v67)
      {
        if (v66 == (char *)0x7FFFFFFFFFFFFFFFLL) {
          id v12 = (char *)((v27 & (v14 << 51 >> 63)) + v59);
        }
        else {
          id v12 = v66;
        }
        goto LABEL_105;
      }
      BOOL v44 = v70 == 0;
      if (v70) {
        char v50 = !v49;
      }
      else {
        char v50 = 1;
      }
      if ((v50 & 1) == 0)
      {
        if (v69 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          if ((v14 & 0x1000) != 0) {
            uint64_t v51 = 0;
          }
          else {
            uint64_t v51 = v60 + (v14 << 52 >> 63);
          }
          goto LABEL_102;
        }
        int v56 = [(CRLWPEditorHelper *)self editor];
        __int16 v57 = [v56 storage];
        id v12 = (char *)[v57 nextCharacterIndex:v69];

LABEL_105:
        if (__p)
        {
          long long v63 = __p;
          operator delete(__p);
        }
        goto LABEL_107;
      }
LABEL_87:
      if (!v45 || !v46)
      {
        if ((v45 & v44) == 1)
        {
          if ((v14 & 0x1000) != 0) {
            uint64_t v52 = 0;
          }
          else {
            uint64_t v52 = v60 + (v14 << 52 >> 63);
          }
          __int16 v53 = (char *)(v52 + v59);
          if (v69 == (char *)0x7FFFFFFFFFFFFFFFLL) {
            id v12 = v53;
          }
          else {
            id v12 = v69;
          }
        }
        goto LABEL_105;
      }
      if (v66 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v51 = v27 & (v14 << 51 >> 63);
LABEL_102:
        id v12 = (char *)(v51 + v59);
        goto LABEL_105;
      }
      uint64_t v54 = [(CRLWPEditorHelper *)self editor];
      __int16 v55 = [v54 storage];
      id v12 = (char *)[v55 nextCharacterIndex:v66];

      goto LABEL_105;
    }
LABEL_75:
    BOOL v49 = 1;
    goto LABEL_78;
  }
  id v12 = v69;
  if (v69 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    if ((v14 & 0x1000) != 0) {
      uint64_t v28 = 0;
    }
    else {
      uint64_t v28 = v60 + (v14 << 52 >> 63);
    }
    goto LABEL_40;
  }
  if (v70)
  {
    double v33 = [(CRLWPEditorHelper *)self editor];
    id v34 = [v33 storage];
    id v12 = (char *)[v34 nextCharacterIndex:v69];
  }
LABEL_107:

  return (unint64_t)v12;
}

- (BOOL)p_setVisualSelectionWithCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 andAnchor:(unint64_t)a5 andAnchorLeadingEdge:(BOOL)a6
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    BOOL v8 = a6;
    BOOL v10 = a4;
    char v30 = 1;
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [(CRLWPEditorHelper *)self textSource];
    unint64_t v15 = sub_1002469D0(v13, v14);
    unint64_t v16 = +[CRLWPSelection selectionWithRange:type:leadingEdge:storage:](CRLWPSelection, "selectionWithRange:type:leadingEdge:storage:", a5, 0, 7, v8, v15);

    uint64_t v17 = objc_opt_class();
    BOOL v18 = [(CRLWPEditorHelper *)self textSource];
    BOOL v19 = sub_1002469D0(v17, v18);
    uint64_t v20 = +[CRLWPSelection selectionWithRange:type:leadingEdge:storage:](CRLWPSelection, "selectionWithRange:type:leadingEdge:storage:", a3, 0, 7, v10, v19);

    id v21 = [(CRLWPEditorHelper *)self adjustVisualSelection:v16 withOtherSelection:v20 outLeadingEdge:&v30 outCaretAffinity:0];
    id v23 = v21;
    unint64_t v24 = v22;
    if (v21 == (id)0x7FFFFFFFFFFFFFFFLL && !v22)
    {
      if (a3 <= a5) {
        unint64_t v25 = a5;
      }
      else {
        unint64_t v25 = a3;
      }
      if (a3 >= a5) {
        id v23 = (id)a5;
      }
      else {
        id v23 = (id)a3;
      }
      unint64_t v24 = v25 - (void)v23;
    }
    uint64_t v26 = [(CRLWPEditorHelper *)self selection];
    BOOL v7 = v23 != [v26 range] || v24 != v27;

    if (v7) {
      -[CRLWPEditorHelper setVisualSelectionWithRange:endOfLine:](self, "setVisualSelectionWithRange:endOfLine:", v23, v24, 0);
    }
    [(CRLWPEditorHelper *)self setSelectionAnchor:a5];
    [(CRLWPEditorHelper *)self setSelectionAnchorEdge:v8];
  }
  return v7;
}

- (BOOL)p_setSelectionWithCharIndex:(unint64_t)a3 andAnchor:(unint64_t)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    if (a3 <= a4) {
      unint64_t v8 = a4;
    }
    else {
      unint64_t v8 = a3;
    }
    if (a3 >= a4) {
      id v9 = (id)a4;
    }
    else {
      id v9 = (id)a3;
    }
    BOOL v10 = [(CRLWPEditorHelper *)self selection];
    unint64_t v12 = v8 - (void)v9;
    BOOL v5 = v9 != [v10 range] || v12 != v11;

    if (v5) {
      -[CRLWPEditorHelper setSelectionWithRange:endOfLine:](self, "setSelectionWithRange:endOfLine:", v9, v12, 0);
    }
    [(CRLWPEditorHelper *)self setSelectionAnchor:a4];
    [(CRLWPEditorHelper *)self setSelectionAnchorEdge:1];
  }
  return v5;
}

- (unint64_t)p_oppositeEdgeForSelection:(id)a3 withLeadingEdge:(BOOL *)a4
{
  id v6 = a3;
  unsigned __int8 v46 = [v6 leadingEdge];
  BOOL v7 = [(CRLWPEditorHelper *)self anchorSelection];
  unsigned __int8 v8 = [v7 leadingEdge];

  unsigned __int8 v45 = v8;
  unint64_t v9 = [(CRLWPEditorHelper *)self p_leftEdgeForSelection:v6 withLeadingEdge:&v46];
  BOOL v10 = [(CRLWPEditorHelper *)self anchorSelection];
  unint64_t v11 = [(CRLWPEditorHelper *)self p_leftEdgeForSelection:v10 withLeadingEdge:&v45];

  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x4012000000;
  NSUInteger v41 = sub_100309FA8;
  BOOL v42 = nullsub_38;
  BOOL v43 = "";
  long long v44 = xmmword_101176F48;
  uint64_t v31 = 0;
  unint64_t v32 = &v31;
  uint64_t v33 = 0x4012000000;
  id v34 = sub_100309FA8;
  int64_t v35 = nullsub_38;
  unint64_t v36 = "";
  long long v37 = xmmword_101176F48;
  uint64_t v27 = 0;
  uint64_t v28 = (double *)&v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0x7FF8000000000000;
  uint64_t v23 = 0;
  unint64_t v24 = (double *)&v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0x7FF8000000000000;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100319644;
  v21[3] = &unk_1014ED9B8;
  v21[4] = &v38;
  v21[5] = &v27;
  v21[6] = v9;
  unsigned __int8 v22 = v46;
  [(CRLWPEditorHelper *)self withLineFragmentForCharIndex:v9 eol:0 performBlock:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1003196B8;
  void v19[3] = &unk_1014ED9B8;
  v19[4] = &v31;
  v19[5] = &v23;
  v19[6] = v11;
  unsigned __int8 v20 = v45;
  [(CRLWPEditorHelper *)self withLineFragmentForCharIndex:v11 eol:0 performBlock:v19];
  unint64_t v13 = v39[6];
  unint64_t v12 = v39[7];
  if (__PAIR128__(v12, v13) == *((_OWORD *)v32 + 3) && (v13 != 0x7FFFFFFFFFFFFFFFLL || v12))
  {
    if (v28[3] == v24[3])
    {
      id v17 = [(CRLWPEditorHelper *)self p_rightEdgeForSelection:v6 withLeadingEdge:a4];
LABEL_12:
      unint64_t v9 = (unint64_t)v17;
      goto LABEL_13;
    }
  }
  else if (v13 == 0x7FFFFFFFFFFFFFFFLL && !v12)
  {
    *a4 = 1;
    uint64_t v14 = [(CRLWPEditorHelper *)self anchorSelection];
    id v15 = [v14 start];
    id v16 = [v6 start];

    if (v15 == v16) {
      id v17 = [v6 end];
    }
    else {
      id v17 = [v6 start];
    }
    goto LABEL_12;
  }
  *a4 = v46;
LABEL_13:
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v38, 8);

  return v9;
}

- (unint64_t)forwardSelectionEdge
{
  uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  return [(CRLWPEditorHelper *)self p_selectionEdgeToMutateWithDirection:0 newAnchor:&v3];
}

- (unint64_t)backwardSelectionEdge
{
  uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  return [(CRLWPEditorHelper *)self p_selectionEdgeToMutateWithDirection:1 newAnchor:&v3];
}

- (unint64_t)forwardSelectionAnchor
{
  unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  [(CRLWPEditorHelper *)self p_selectionEdgeToMutateWithDirection:0 newAnchor:&v3];
  return v3;
}

- (unint64_t)backwardSelectionAnchor
{
  unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  [(CRLWPEditorHelper *)self p_selectionEdgeToMutateWithDirection:1 newAnchor:&v3];
  return v3;
}

- (unint64_t)p_selectionEdgeToMutateWithDirection:(int64_t)a3 newAnchor:(unint64_t *)a4
{
  id v6 = [(CRLWPEditorHelper *)self selection];
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED9D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109E228();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ED9F8);
    }
    BOOL v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    unsigned __int8 v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:]");
    unint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 5379, 0, "invalid nil value for '%{public}s'", "selection");
  }
  BOOL v10 = (char *)[v6 superRange];
  uint64_t v12 = v11;
  unsigned __int8 v45 = [v6 leadingEdge];
  unsigned __int8 v44 = [v6 leadingEdge];
  unint64_t v13 = [(CRLWPEditorHelper *)self p_rightEdgeForSelection:v6 withLeadingEdge:&v45];
  unint64_t v14 = [(CRLWPEditorHelper *)self p_leftEdgeForSelection:v6 withLeadingEdge:&v44];
  if ([(CRLWPEditorHelper *)self selectionAnchor] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  if ([(CRLWPEditorHelper *)self selectionAnchorEdge])
  {
    BOOL v18 = [(CRLWPEditorHelper *)self selectionAnchor];
  }
  else
  {
    BOOL v19 = [(CRLWPEditorHelper *)self textSource];
    BOOL v18 = [v19 nextCharacterIndex:-[self selectionAnchor]];
  }
  if ((unint64_t)a3 > 5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EDA18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109E19C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EDA38);
    }
    unint64_t v36 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    long long v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:]");
    uint64_t v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 5415, 0, "illegal text direction: %ld", a3);
  }
  else
  {
    if (((1 << a3) & 0x33) != 0)
    {
      if (v18 == v10)
      {
LABEL_22:
        unint64_t v14 = (unint64_t)&v10[v12];
        *a4 = (unint64_t)v10;
        goto LABEL_42;
      }
      if (v18 == &v10[v12])
      {
LABEL_32:
        *a4 = (unint64_t)&v10[v12];
        unint64_t v14 = (unint64_t)v10;
        goto LABEL_42;
      }
      goto LABEL_12;
    }
    if (v44)
    {
      if (v18 == (char *)v14) {
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v39 = [(CRLWPEditorHelper *)self textSource];
      BOOL v40 = v18 == [v39 nextCharacterIndex:v14];

      if (v40)
      {
LABEL_25:
        int v20 = v45;
        id v16 = a4;
        *a4 = v14;
        BOOL v17 = v44 != 0;
        unint64_t v14 = v13;
        if (!v20)
        {
LABEL_26:
          id v21 = [(CRLWPEditorHelper *)self textSource];
          id v22 = [v21 range];
          BOOL v24 = v14 < (unint64_t)v22 + v23;

          if (v24)
          {
            uint64_t v25 = [(CRLWPEditorHelper *)self textSource];
            unint64_t v14 = (unint64_t)[v25 nextCharacterIndex:v14];
          }
          id v16 = a4;
          if (v17) {
            goto LABEL_42;
          }
LABEL_29:
          unint64_t v26 = *v16;
          uint64_t v27 = [(CRLWPEditorHelper *)self textSource];
          id v28 = [v27 range];
          BOOL v30 = v26 < (unint64_t)v28 + v29;

          if (v30)
          {
            uint64_t v31 = [(CRLWPEditorHelper *)self textSource];
            *a4 = (unint64_t)[v31 nextCharacterIndex:*a4];
          }
          goto LABEL_42;
        }
LABEL_14:
        if (v17) {
          goto LABEL_42;
        }
        goto LABEL_29;
      }
    }
    if (v45)
    {
      if (v18 == (char *)v13) {
        goto LABEL_13;
      }
    }
    else
    {
      NSUInteger v41 = [(CRLWPEditorHelper *)self textSource];
      BOOL v42 = v18 == [v41 nextCharacterIndex:v13];

      if (v42)
      {
LABEL_13:
        int v15 = v44;
        id v16 = a4;
        *a4 = v13;
        BOOL v17 = v45 != 0;
        if (!v15) {
          goto LABEL_26;
        }
        goto LABEL_14;
      }
    }
  }
LABEL_12:
  switch(a3)
  {
    case 0:
    case 5:
      goto LABEL_22;
    case 1:
    case 4:
      goto LABEL_32;
    case 2:
      goto LABEL_25;
    case 3:
      goto LABEL_13;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EDA58);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109E110();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EDA78);
      }
      unint64_t v32 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      uint64_t v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithDirection:newAnchor:]");
      id v34 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 5450, 0, "illegal text direction: %ld", a3);

      unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }
LABEL_42:

  return v14;
}

- (unint64_t)p_selectionEdgeToMutateWithLeadingEdge:(BOOL *)a3 Direction:(int64_t)a4 newAnchor:(unint64_t *)a5 anchorLeadingEdge:(BOOL *)a6
{
  uint64_t v11 = [(CRLWPEditorHelper *)self selection];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = [v11 range];
    uint64_t v38 = v14;
    unint64_t v15 = (unint64_t)v13;
    unsigned __int8 v40 = [v12 leadingEdge];
    unsigned __int8 v39 = [v12 leadingEdge];
    unint64_t v16 = [(CRLWPEditorHelper *)self p_rightEdgeForSelection:v12 withLeadingEdge:&v40];
    unint64_t v37 = [(CRLWPEditorHelper *)self p_leftEdgeForSelection:v12 withLeadingEdge:&v39];
    if ([(CRLWPEditorHelper *)self selectionAnchor] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((unint64_t)a4 > 5)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EDB58);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109E3DC();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EDB78);
        }
        uint64_t v27 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        id v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithLeadingEdge:Direction:newAnchor:anchorLeadingEdge:]");
        uint64_t v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 5506, 0, "illegal text direction: %ld", a4);
LABEL_53:

        goto LABEL_54;
      }
      if (((1 << a4) & 0x33) != 0)
      {
        if ([(CRLWPEditorHelper *)self selectionAnchorEdge])
        {
          id v17 = [(CRLWPEditorHelper *)self selectionAnchor];
        }
        else
        {
          unint64_t v26 = [(CRLWPEditorHelper *)self textSource];
          id v17 = [v26 nextCharacterIndex:[self selectionAnchor]];
        }
        if (v17 == (id)v15)
        {
          *a3 = 1;
LABEL_55:
          unint64_t v16 = v15 + v38;
          *a5 = v15;
          goto LABEL_70;
        }
        if (v17 == (id)(v15 + v38))
        {
          *a3 = 1;
LABEL_56:
          *a5 = v15 + v38;
          unint64_t v16 = v15;
          goto LABEL_70;
        }
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EDAD8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109E468();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EDAF8);
        }
        BOOL v30 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        id v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithLeadingEdge:Direction:newAnchor:anchorLeadingEdge:]");
        uint64_t v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v28 file:v29 lineNumber:5487 isFatal:0 description:"Invalid selection anchor"];
        goto LABEL_53;
      }
      id v21 = [(CRLWPEditorHelper *)self p_layoutIndexForCharIndex:[(CRLWPEditorHelper *)self selectionAnchor] leadingEdge:[(CRLWPEditorHelper *)self selectionAnchorEdge]];
      if (v21 != (void *)[(CRLWPEditorHelper *)self p_layoutIndexForCharIndex:v37 leadingEdge:v39])
      {
        id v22 = [(CRLWPEditorHelper *)self p_layoutIndexForCharIndex:[(CRLWPEditorHelper *)self selectionAnchor] leadingEdge:[(CRLWPEditorHelper *)self selectionAnchorEdge]];
        if (v22 != (void *)[(CRLWPEditorHelper *)self p_layoutIndexForCharIndex:v16 leadingEdge:v40])
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EDB18);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10109E4F0();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014EDB38);
          }
          uint64_t v23 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
          {
            +[CRLAssertionHandler packedBacktraceString];
            objc_claimAutoreleasedReturnValue();
            sub_1010663B0();
          }

          unint64_t v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithLeadingEdge:Direction:newAnchor:anchorLeadingEdge:]");
          BOOL v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v36 file:v24 lineNumber:5497 isFatal:0 description:"Invalid selection anchor"];
        }
      }
      uint64_t v25 = [(CRLWPEditorHelper *)self p_layoutIndexForCharIndex:[(CRLWPEditorHelper *)self selectionAnchor] leadingEdge:[(CRLWPEditorHelper *)self selectionAnchorEdge]];
      if (v25 == (void *)[(CRLWPEditorHelper *)self p_layoutIndexForCharIndex:v37 leadingEdge:v39])
      {
        *a3 = 1;
LABEL_57:
        *a3 = v40;
        *a5 = v37;
        *a6 = v39;
        goto LABEL_70;
      }
      id v34 = [(CRLWPEditorHelper *)self p_layoutIndexForCharIndex:[(CRLWPEditorHelper *)self selectionAnchor] leadingEdge:[(CRLWPEditorHelper *)self selectionAnchorEdge]];
      if (v34 == (void *)[(CRLWPEditorHelper *)self p_layoutIndexForCharIndex:v16 leadingEdge:v40])
      {
        *a3 = 1;
LABEL_69:
        *a3 = v39;
        *a5 = v16;
        *a6 = v40;
        unint64_t v16 = v37;
        goto LABEL_70;
      }
    }
LABEL_54:
    *a3 = 1;
    switch(a4)
    {
      case 0:
      case 5:
        goto LABEL_55;
      case 1:
      case 4:
        goto LABEL_56;
      case 2:
        goto LABEL_57;
      case 3:
        goto LABEL_69;
      default:
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EDB98);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10109E350();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EDBB8);
        }
        uint64_t v31 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        unint64_t v32 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithLeadingEdge:Direction:newAnchor:anchorLeadingEdge:]");
        uint64_t v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 5540, 0, "illegal text direction: %ld", a4);

        goto LABEL_16;
    }
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EDA98);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10109E2BC();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014EDAB8);
  }
  BOOL v18 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  BOOL v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPEditorHelper p_selectionEdgeToMutateWithLeadingEdge:Direction:newAnchor:anchorLeadingEdge:]");
  int v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Editor/CRLWPEditorHelper.mm"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 5469, 0, "invalid nil value for '%{public}s'", "selection");

LABEL_16:
  unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_70:

  return v16;
}

- (int64_t)p_layoutIndexForCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4
{
  int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11[3] = v4;
    v11[4] = v5;
    BOOL v7 = a4;
    unint64_t v8 = a3;
    v11[0] = 0;
    unint64_t v9 = [(CRLWPEditorHelper *)self p_lineFragmentForCharIndex:a3 column:v11 eol:0];
    if (v9) {
      return sub_10015A890((uint64_t)v9, v8, v7);
    }
    return v8;
  }
  return v6;
}

- (unint64_t)p_indexToTransposableCharacterStartingAtIndex:(unint64_t)a3 filterStorage:(id)a4 searchTowardsStorageStart:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  while ([v7 characterAtIndex:a3] == 65532)
  {
    if (a3 || !v5)
    {
      id v8 = v5 ? [v7 previousCharacterIndex:a3] : [v7 nextCharacterIndex:a3];
      a3 = (unint64_t)v8;
      if (v8 < [v7 length]) {
        continue;
      }
    }
    a3 = 0x7FFFFFFFFFFFFFFFLL;
    break;
  }

  return a3;
}

- (_TtC8Freeform11CRLWPEditor)editor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editor);

  return (_TtC8Freeform11CRLWPEditor *)WeakRetained;
}

- (void)setEditor:(id)a3
{
}

- (CRLWPSelection)anchorSelection
{
  return self->_anchorSelection;
}

- (void)setAnchorSelection:(id)a3
{
}

- (unint64_t)selectionAnchor
{
  return self->_selectionAnchor;
}

- (void)setSelectionAnchor:(unint64_t)a3
{
  self->_selectionAnchor = a3;
}

- (BOOL)selectionAnchorEdge
{
  return self->_selectionAnchorEdge;
}

- (void)setSelectionAnchorEdge:(BOOL)a3
{
  self->_selectionAnchorEdge = a3;
}

- (BOOL)selectionLastModifiedWithKeyboard
{
  return self->_selectionLastModifiedWithKeyboard;
}

- (void)setSelectionLastModifiedWithKeyboard:(BOOL)a3
{
  self->_BOOL selectionLastModifiedWithKeyboard = a3;
}

- (_NSRange)emacsMarkRange
{
  NSUInteger length = self->_emacsMarkRange.length;
  NSUInteger location = self->_emacsMarkRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setEmacsMarkRange:(_NSRange)a3
{
  self->_emacsMarkRange = a3;
}

- (BOOL)continueKillRing
{
  return self->_continueKillRing;
}

- (void)setContinueKillRing:(BOOL)a3
{
  self->_continueKillRing = a3;
}

- (void)setTextSource:(id)a3
{
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
}

- (NSMutableDictionary)autocorrectedEntries
{
  return self->_autocorrectedEntries;
}

- (void)setAutocorrectedEntries:(id)a3
{
}

- (unint64_t)lastChangedCharIndex
{
  return self->_lastChangedCharIndex;
}

- (void)setLastChangedCharIndex:(unint64_t)a3
{
  self->_lastChangedCharIndeCGFloat x = a3;
}

- (unint64_t)correctionCharIndexToIgnoreHUD
{
  return self->_correctionCharIndexToIgnoreHUD;
}

- (void)setCorrectionCharIndexToIgnoreHUD:(unint64_t)a3
{
  self->_correctionCharIndexToIgnoreHUD = a3;
}

- (_NSRange)lastAutocorrectionRange
{
  NSUInteger length = self->_lastAutocorrectionRange.length;
  NSUInteger location = self->_lastAutocorrectionRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLastAutocorrectionRange:(_NSRange)a3
{
  self->_lastAutocorrectionRange = a3;
}

- (void)setLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_autocorrectedEntries, 0);
  objc_storeStrong((id *)&self->_interactiveCanvasController, 0);
  objc_storeStrong((id *)&self->_textSource, 0);
  objc_storeStrong((id *)&self->_anchorSelection, 0);

  objc_destroyWeak((id *)&self->_editor);
}

@end