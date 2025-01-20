@interface DOMNode(UITextInput_Internal)
- (BOOL)_isEmptySelection;
- (BOOL)_range:()UITextInput_Internal containsRange:;
- (BOOL)_range:()UITextInput_Internal intersectsRange:;
- (BOOL)_range:()UITextInput_Internal isEqualToRange:;
- (BOOL)_selectionAtDocumentEnd;
- (BOOL)_selectionAtDocumentStart;
- (BOOL)_selectionAtWordStart;
- (UITextInputArrowKeyHistory)_setHistory:()UITextInput_Internal withExtending:withAnchor:withAffinityDownstream:;
- (double)_selectionClipRect;
- (id)_clampedpositionFromPosition:()UITextInput_Internal offset:;
- (id)_findBoundaryPositionClosestToPosition:()UITextInput_Internal withGranularity:;
- (id)_findDocumentBoundaryFromPosition:()UITextInput_Internal;
- (id)_findPleasingWordBoundaryFromPosition:()UITextInput_Internal;
- (id)_fontForCaretSelection;
- (id)_fullRange;
- (id)_fullText;
- (id)_intersectionOfRange:()UITextInput_Internal andRange:;
- (id)_moveDown:()UITextInput_Internal withHistory:;
- (id)_moveLeft:()UITextInput_Internal withHistory:;
- (id)_moveRight:()UITextInput_Internal withHistory:;
- (id)_moveToEndOfDocument:()UITextInput_Internal withHistory:;
- (id)_moveToEndOfLine:()UITextInput_Internal withHistory:;
- (id)_moveToEndOfParagraph:()UITextInput_Internal withHistory:;
- (id)_moveToEndOfWord:()UITextInput_Internal withHistory:;
- (id)_moveToStartOfDocument:()UITextInput_Internal withHistory:;
- (id)_moveToStartOfLine:()UITextInput_Internal withHistory:;
- (id)_moveToStartOfParagraph:()UITextInput_Internal withHistory:;
- (id)_moveToStartOfWord:()UITextInput_Internal withHistory:;
- (id)_moveUp:()UITextInput_Internal withHistory:;
- (id)_normalizedStringForRangeComparison:()UITextInput_Internal;
- (id)_positionAtStartOfWords:()UITextInput_Internal beforePosition:;
- (id)_positionFromPosition:()UITextInput_Internal inDirection:offset:withAffinityDownstream:;
- (id)_positionFromPosition:()UITextInput_Internal pastTextUnit:inDirection:;
- (id)_positionWithinRange:()UITextInput_Internal farthestInDirection:;
- (id)_rangeFromCurrentRangeWithDelta:()UITextInput_Internal;
- (id)_rangeOfSmartSelectionIncludingRange:()UITextInput_Internal;
- (id)_rangeOfText:()UITextInput_Internal endingAtPosition:;
- (id)_rangeOfTextUnit:()UITextInput_Internal enclosingPosition:;
- (id)_rangeSpanningTextUnit:()UITextInput_Internal andPosition:;
- (id)_responderWindow;
- (id)_selectionDisplayInteraction;
- (id)_setSelectionRangeWithHistory:()UITextInput_Internal;
- (id)_textColorForCaretSelection;
- (id)_textInteraction;
- (id)_textRangeFromNSRange:()UITextInput_Internal;
- (id)_underlineRectsByDocumentLineForSelectionRange:()UITextInput_Internal;
- (id)_wordContainingCaretSelection;
- (id)inputAssistantItem;
- (id)textInputSuggestionDelegate;
- (uint64_t)_characterAfterCaretSelection;
- (uint64_t)_characterBeforeCaretSelection;
- (uint64_t)_characterInRelationToCaretSelection:()UITextInput_Internal;
- (uint64_t)_characterInRelationToPosition:()UITextInput_Internal amount:;
- (uint64_t)_characterInRelationToRangedSelection:()UITextInput_Internal;
- (uint64_t)_expandSelectionToStartOfWordBeforeCaretSelection;
- (uint64_t)_hasMarkedText;
- (uint64_t)_hasMarkedTextOrRangedSelection;
- (uint64_t)_indexForTextPosition:()UITextInput_Internal;
- (uint64_t)_nsrangeForTextRange:()UITextInput_Internal;
- (uint64_t)_rangeOfEnclosingWord:()UITextInput_Internal;
- (uint64_t)_rangeOfLineEnclosingPosition:()UITextInput_Internal;
- (uint64_t)_rangeOfParagraphEnclosingPosition:()UITextInput_Internal;
- (uint64_t)_rangeOfSentenceEnclosingPosition:()UITextInput_Internal;
- (uint64_t)_selectedNSRange;
- (uint64_t)_selectedRangeWithinMarkedText;
- (uint64_t)_selectionAffinity;
- (uint64_t)_shouldPerformUICalloutBarButtonReplaceAction:()UITextInput_Internal forText:checkAutocorrection:;
- (uint64_t)_textInputSource;
- (uint64_t)_usesAsynchronousProtocol;
- (unint64_t)_opposingDirectionFromDirection:()UITextInput_Internal;
- (void)_deleteBackwardAndNotify:()UITextInput_Internal;
- (void)_deleteByWord;
- (void)_deleteForwardAndNotify:()UITextInput_Internal;
- (void)_deleteForwardByWord;
- (void)_deleteTextRange:()UITextInput_Internal;
- (void)_deleteToEndOfLine;
- (void)_deleteToEndOfParagraph;
- (void)_deleteToStartOfLine;
- (void)_expandSelectionToBackwardDeletionClusterWithReinsertionOut:()UITextInput_Internal;
- (void)_expandSelectionToStartOfWordsBeforeCaretSelection:()UITextInput_Internal;
- (void)_extendCurrentSelection:()UITextInput_Internal;
- (void)_moveCurrentSelection:()UITextInput_Internal;
- (void)_replaceCurrentWordWithText:()UITextInput_Internal;
- (void)_replaceDocumentWithText:()UITextInput_Internal;
- (void)_scrollRectToVisible:()UITextInput_Internal animated:;
- (void)_selectAll;
- (void)_setAttributedMarkedText:()UITextInput_Internal selectedRange:;
- (void)_setCaretSelectionAtEndOfSelection;
- (void)_setGestureRecognizers;
- (void)_setMarkedText:()UITextInput_Internal selectedRange:;
- (void)_setSelectedTextRange:()UITextInput_Internal withAffinityDownstream:;
- (void)_setSelectionToPosition:()UITextInput_Internal;
- (void)_transpose;
- (void)_unmarkText;
- (void)_updateSelectedRects:()UITextInput_Internal byTrimmingWhitespaceInRange:inDocument:;
- (void)_updateSelectionWithTextRange:()UITextInput_Internal withAffinityDownstream:;
- (void)set_textInputSource:()UITextInput_Internal;
@end

@implementation DOMNode(UITextInput_Internal)

- (id)textInputSuggestionDelegate
{
  v1 = [a1 _selectableText];
  v2 = [v1 inputDelegate];
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (uint64_t)_textInputSource
{
  v0 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];

  if (!v0) {
    return __UIPlatformFallbackInputSource;
  }
  v1 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  uint64_t v2 = [v1 lastEventSource];

  return v2;
}

- (void)set_textInputSource:()UITextInput_Internal
{
  v5 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];

  if (v5)
  {
    BOOL v6 = (objc_opt_respondsToSelector() & 1) != 0 && [a1 keyboardType] == 122;
    if (a3 == 3 && v6) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 5;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = a1;
    }
    else {
      v8 = 0;
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

- (uint64_t)_selectedNSRange
{
  uint64_t v2 = [a1 _selectableText];
  id v3 = v2;
  if (v2)
  {
    v4 = [v2 selectedTextRange];
    if (v4) {
      uint64_t v5 = [a1 _nsrangeForTextRange:v4];
    }
    else {
      uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (uint64_t)_selectedRangeWithinMarkedText
{
  v1 = [a1 _selectableText];
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 selectedTextRange];
    if (v3)
    {
      v4 = [v2 markedTextRange];
      uint64_t v5 = v4;
      if (!v4
        || ([v4 start],
            BOOL v6 = objc_claimAutoreleasedReturnValue(),
            [v3 start],
            uint64_t v7 = objc_claimAutoreleasedReturnValue(),
            uint64_t v8 = [v2 offsetFromPosition:v6 toPosition:v7],
            v7,
            v6,
            v8 < 0))
      {
        uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        id v9 = [v3 start];
        id v10 = [v3 end];
        [v2 offsetFromPosition:v9 toPosition:v10];
      }
    }
    else
    {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void)_selectAll
{
  id v2 = [a1 _selectableText];
  v1 = [v2 _fullRange];
  [v2 setSelectedTextRange:v1];
}

- (uint64_t)_indexForTextPosition:()UITextInput_Internal
{
  id v4 = a3;
  uint64_t v5 = [a1 _selectableText];
  BOOL v6 = [v5 beginningOfDocument];
  uint64_t v7 = [v5 offsetFromPosition:v6 toPosition:v4];

  return v7;
}

- (uint64_t)_nsrangeForTextRange:()UITextInput_Internal
{
  id v4 = a3;
  uint64_t v5 = [a1 _selectableText];
  BOOL v6 = [v4 start];
  uint64_t v7 = (int)[a1 _indexForTextPosition:v6];

  uint64_t v8 = [v4 start];
  id v9 = [v4 end];

  [v5 offsetFromPosition:v8 toPosition:v9];
  return v7;
}

- (id)_textRangeFromNSRange:()UITextInput_Internal
{
  BOOL v6 = [a1 _selectableText];
  uint64_t v7 = [v6 beginningOfDocument];
  uint64_t v8 = [v6 positionFromPosition:v7 offset:a3];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v6 endOfDocument];
  }
  v11 = v10;

  v12 = [v6 positionFromPosition:v11 offset:a4];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v6 endOfDocument];
  }
  v15 = v14;

  v16 = [v6 textRangeFromPosition:v11 toPosition:v15];

  return v16;
}

- (uint64_t)_characterAfterCaretSelection
{
  return [a1 _characterInRelationToCaretSelection:0];
}

- (uint64_t)_characterBeforeCaretSelection
{
  return [a1 _characterInRelationToCaretSelection:0xFFFFFFFFLL];
}

- (uint64_t)_characterInRelationToCaretSelection:()UITextInput_Internal
{
  uint64_t v5 = [a1 _selectableText];
  uint64_t v6 = [v5 selectedTextRange];
  if (v6
    && (uint64_t v7 = (void *)v6,
        [v5 selectedTextRange],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEmpty],
        v8,
        v7,
        v9))
  {
    uint64_t v10 = [a1 _characterInRelationToRangedSelection:a3];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (uint64_t)_characterInRelationToRangedSelection:()UITextInput_Internal
{
  id v4 = [a1 _selectableText];
  uint64_t v5 = [v4 selectedTextRange];

  if (!v5) {
    goto LABEL_4;
  }
  if (a3 > -101)
  {
    if ((a3 & 0x80000000) == 0)
    {
      uint64_t v7 = [v4 selectedTextRange];
      uint64_t v8 = [v7 end];

      if (a3)
      {
        uint64_t v9 = [v4 positionFromPosition:v8 offset:a3];

        uint64_t v8 = (void *)v9;
      }
      if (!v8) {
        goto LABEL_17;
      }
LABEL_11:
      uint64_t v12 = [v4 positionFromPosition:v8 offset:1];
      if (v12)
      {
        v13 = (void *)v12;
        id v14 = [v4 textRangeFromPosition:v8 toPosition:v12];
        v15 = [v4 textInRange:v14];
        if ([v15 length])
        {
          if ([v15 length] == 2
            && (int v16 = [v15 characterAtIndex:0],
                int v17 = [v15 characterAtIndex:1],
                (v16 & 0xFC00) == 0xD800)
            && (v17 & 0xFC00) == 0xDC00)
          {
            uint64_t v6 = (v17 + (v16 << 10) - 56613888);
          }
          else
          {
            uint64_t v6 = [v15 characterAtIndex:0];
          }
        }
        else
        {
          uint64_t v6 = 0;
        }

        goto LABEL_21;
      }
LABEL_17:
      uint64_t v6 = 0;
LABEL_21:

      goto LABEL_22;
    }
LABEL_10:
    uint64_t v10 = [v4 selectedTextRange];
    v11 = [v10 start];
    uint64_t v8 = [v4 positionFromPosition:v11 offset:a3];

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
  uint64_t v6 = 0;
LABEL_22:

  return v6;
}

- (uint64_t)_characterInRelationToPosition:()UITextInput_Internal amount:
{
  if (!a3) {
    return 0;
  }
  id v6 = a3;
  uint64_t v7 = [a1 _selectableText];
  uint64_t v8 = [v7 positionFromPosition:v6 offset:a4];

  uint64_t v9 = [v7 positionFromPosition:v8 offset:1];
  uint64_t v10 = [v7 textRangeFromPosition:v8 toPosition:v9];
  v11 = [v7 textInRange:v10];
  if ([v11 length])
  {
    if ([v11 length] == 2
      && (int v12 = [v11 characterAtIndex:0],
          int v13 = [v11 characterAtIndex:1],
          (v12 & 0xFC00) == 0xD800)
      && (v13 & 0xFC00) == 0xDC00)
    {
      uint64_t v14 = (v13 + (v12 << 10) - 56613888);
    }
    else
    {
      uint64_t v14 = [v11 characterAtIndex:0];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_wordContainingCaretSelection
{
  id v2 = [a1 _selectableText];
  id v3 = [v2 selectedTextRange];
  if (v3)
  {
    id v4 = [v2 selectedTextRange];
    int v5 = [v4 isEmpty];

    if (v5)
    {
      id v6 = [v2 selectedTextRange];
      uint64_t v7 = [v6 start];
      uint64_t v8 = [a1 _rangeOfEnclosingWord:v7];

      if (v8)
      {
        id v3 = [v2 textInRange:v8];
      }
      else
      {
        id v3 = 0;
      }
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

- (id)_fullText
{
  v1 = [a1 _selectableText];
  id v2 = [v1 beginningOfDocument];
  id v3 = [v1 endOfDocument];
  id v4 = [v1 textRangeFromPosition:v2 toPosition:v3];

  int v5 = [v1 textInRange:v4];

  return v5;
}

- (void)_setSelectionToPosition:()UITextInput_Internal
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [a1 _selectableText];
    int v5 = [v6 textRangeFromPosition:v4 toPosition:v4];

    if (v5) {
      [v6 setSelectedTextRange:v5];
    }
  }
}

- (BOOL)_selectionAtWordStart
{
  id v2 = [a1 _selectableText];
  id v3 = [v2 selectedTextRange];
  id v4 = [v3 start];
  int v5 = [a1 _rangeOfEnclosingWord:v4];

  if (v5)
  {
    id v6 = [v5 start];
    uint64_t v7 = [v2 selectedTextRange];
    uint64_t v8 = [v7 start];
    uint64_t v9 = [v2 comparePosition:v6 toPosition:v8];

    BOOL v10 = v9 == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_selectionAtDocumentStart
{
  v1 = [a1 _selectableText];
  id v2 = [v1 selectedTextRange];
  id v3 = [v2 start];

  if (v3)
  {
    id v4 = [v1 beginningOfDocument];
    BOOL v5 = [v1 comparePosition:v4 toPosition:v3] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_selectionAtDocumentEnd
{
  v1 = [a1 _selectableText];
  id v2 = [v1 selectedTextRange];
  id v3 = [v2 end];

  if (v3)
  {
    id v4 = [v1 endOfDocument];
    BOOL v5 = [v1 comparePosition:v4 toPosition:v3] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (double)_selectionClipRect
{
  return *MEMORY[0x1E4F1DB20];
}

- (BOOL)_isEmptySelection
{
  v1 = [a1 _selectableText];
  id v2 = [v1 selectedTextRange];
  id v3 = [v2 start];
  id v4 = [v2 end];
  BOOL v5 = [v1 comparePosition:v3 toPosition:v4] == 0;

  return v5;
}

- (uint64_t)_hasMarkedTextOrRangedSelection
{
  v1 = [a1 _selectableText];
  id v2 = [v1 markedTextRange];
  if (v2)
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = [v1 selectedTextRange];
    if (v4)
    {
      BOOL v5 = [v1 selectedTextRange];
      uint64_t v3 = [v5 isEmpty] ^ 1;
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (void)_extendCurrentSelection:()UITextInput_Internal
{
  BOOL v5 = [a1 _selectableText];
  if (a3)
  {
    id v15 = v5;
    id v6 = [v5 selectedTextRange];

    BOOL v5 = v15;
    if (v6)
    {
      uint64_t v7 = [v15 selectedTextRange];
      uint64_t v8 = [v7 start];

      uint64_t v9 = [v15 selectedTextRange];
      BOOL v10 = [v9 end];

      if ((int)a3 < 1)
      {
        uint64_t v13 = [a1 _clampedpositionFromPosition:v8 offset:a3];
        int v12 = v8;
        uint64_t v8 = (void *)v13;
      }
      else
      {
        uint64_t v11 = [a1 _clampedpositionFromPosition:v10 offset:a3];
        int v12 = v10;
        BOOL v10 = (void *)v11;
      }

      uint64_t v14 = [v15 textRangeFromPosition:v8 toPosition:v10];
      [v15 setSelectedTextRange:v14];

      BOOL v5 = v15;
    }
  }
}

- (void)_moveCurrentSelection:()UITextInput_Internal
{
  BOOL v5 = [a1 _selectableText];
  if (a3)
  {
    id v14 = v5;
    id v6 = [v5 selectedTextRange];

    BOOL v5 = v14;
    if (v6)
    {
      uint64_t v7 = [v14 selectedTextRange];
      int v8 = [v7 isEmpty];

      if (v8)
      {
        uint64_t v9 = [v14 selectedTextRange];
        BOOL v10 = [v9 start];
      }
      else
      {
        uint64_t v11 = [v14 selectedTextRange];
        BOOL v10 = [v11 end];

        if ((int)a3 < 1) {
          a3 = (a3 + 1);
        }
        else {
          a3 = (a3 - 1);
        }
      }
      int v12 = [a1 _clampedpositionFromPosition:v10 offset:a3];

      uint64_t v13 = [v14 textRangeFromPosition:v12 toPosition:v12];
      if (v13) {
        [v14 setSelectedTextRange:v13];
      }

      BOOL v5 = v14;
    }
  }
}

- (void)_expandSelectionToBackwardDeletionClusterWithReinsertionOut:()UITextInput_Internal
{
  id v24 = [a1 _selectableText];
  id v4 = [v24 selectedTextRange];
  BOOL v5 = [v4 start];
  id v6 = [v4 end];
  id v7 = v5;
  if (!v4 || ([v4 isEmpty] & 1) != 0)
  {
    int v8 = &stru_1ED0E84C0;
    if (v7) {
      goto LABEL_4;
    }
LABEL_18:
    id v19 = 0;
    BOOL v10 = 0;
    goto LABEL_29;
  }
  int v8 = [v24 textInRange:v4];
  if (!v7) {
    goto LABEL_18;
  }
LABEL_4:
  v23 = a3;
  uint64_t v9 = v7;
  BOOL v10 = v7;
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

    BOOL v10 = [v24 positionFromPosition:v19 offset:-1];

    if (v10)
    {
      int v17 = [v24 textRangeFromPosition:v10 toPosition:v19];
      if (v17)
      {
        v18 = [v24 textInRange:v17];
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
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

  BOOL v10 = 0;
  int v8 = v11;
LABEL_20:
  v20 = v24;
  if (v23 && v16 >= 1)
  {
    id v21 = v10;

    void *v23 = [(__CFString *)v8 substringToIndex:v16];
    v20 = v24;
    id v19 = v21;
  }
  if (v19 != v7 && v19 && v6)
  {
    v22 = [v20 textRangeFromPosition:v19 toPosition:v6];
    if (v22) {
      [v24 setSelectedTextRange:v22];
    }
  }
LABEL_29:
}

- (uint64_t)_expandSelectionToStartOfWordBeforeCaretSelection
{
  return [a1 _expandSelectionToStartOfWordsBeforeCaretSelection:1];
}

- (void)_expandSelectionToStartOfWordsBeforeCaretSelection:()UITextInput_Internal
{
  id v10 = [a1 _selectableText];
  id v4 = [v10 selectedTextRange];
  BOOL v5 = v4;
  if (a3 && v4)
  {
    id v6 = [v4 start];
    id v7 = [v10 _positionAtStartOfWords:a3 beforePosition:v6];

    if (v7)
    {
      int v8 = [v5 end];
      uint64_t v9 = [v10 textRangeFromPosition:v7 toPosition:v8];
      [v10 setSelectedTextRange:v9];
    }
  }
}

- (id)_positionWithinRange:()UITextInput_Internal farthestInDirection:
{
  id v6 = a3;
  id v7 = [a1 _selectableText];
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

- (unint64_t)_opposingDirectionFromDirection:()UITextInput_Internal
{
  unint64_t result = a3;
  if (a3 <= 5) {
    return qword_186B9AF70[a3];
  }
  return result;
}

- (id)_positionFromPosition:()UITextInput_Internal pastTextUnit:inDirection:
{
  id v8 = a3;
  uint64_t v9 = [a1 _selectableText];
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
      int v16 = objc_msgSend(v15, "isPosition:atBoundary:inDirection:", v13, a4, objc_msgSend(a1, "_opposingDirectionFromDirection:", a5));

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

- (id)_positionAtStartOfWords:()UITextInput_Internal beforePosition:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
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
  v18 = [v8 tokenizer];
  id v19 = [v18 positionFromPosition:v6 toBoundary:1 inDirection:1];

  if (!v19)
  {
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  v20 = [v8 tokenizer];
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
  id v6 = [a1 _selectableText];
  v1 = [v6 selectedTextRange];
  id v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 end];
    id v4 = [v2 end];
    BOOL v5 = [v6 textRangeFromPosition:v3 toPosition:v4];
    [v6 setSelectedTextRange:v5];
  }
}

- (void)_deleteByWord
{
  id v9 = [a1 _selectableText];
  id v2 = [v9 selectedTextRange];
  uint64_t v3 = [v9 inputDelegate];
  [v3 textWillChange:v9];

  if ([v2 isEmpty])
  {
    id v4 = [v2 start];
    BOOL v5 = [v9 _positionAtStartOfWords:1 beforePosition:v4];

    if (v5)
    {
      id v6 = [v2 end];
      uint64_t v7 = [v9 textRangeFromPosition:v5 toPosition:v6];

      id v2 = (void *)v7;
    }
  }
  [a1 _deleteTextRange:v2];
  id v8 = [v9 inputDelegate];
  [v8 textDidChange:v9];
}

- (void)_deleteForwardByWord
{
  id v17 = [a1 _selectableText];
  id v2 = [v17 selectedTextRange];
  uint64_t v3 = [v17 inputDelegate];
  [v3 textWillChange:v17];

  if ([v2 isEmpty])
  {
    id v4 = [a1 _selectableText];
    BOOL v5 = v4;
    if (v2)
    {
      id v6 = [v4 tokenizer];
      uint64_t v7 = [v2 end];
      id v8 = [v6 rangeEnclosingPosition:v7 withGranularity:1 inDirection:0];

      if (v8) {
        goto LABEL_4;
      }
      uint64_t v13 = [v5 tokenizer];
      uint64_t v14 = [v2 end];
      uint64_t v15 = [v13 positionFromPosition:v14 toBoundary:1 inDirection:0];

      if (v15)
      {
        int v16 = [v5 tokenizer];
        id v8 = [v16 rangeEnclosingPosition:v15 withGranularity:1 inDirection:0];

        if (v8)
        {
LABEL_4:
          id v9 = [v2 start];
          uint64_t v10 = [v8 end];
          uint64_t v11 = [v5 textRangeFromPosition:v9 toPosition:v10];

          id v2 = (void *)v11;
        }
      }
    }
  }
  [a1 _deleteTextRange:v2];
  unint64_t v12 = [v17 inputDelegate];
  [v12 textDidChange:v17];
}

- (void)_deleteToStartOfLine
{
  id v12 = [a1 _selectableText];
  id v2 = [v12 selectedTextRange];
  uint64_t v3 = [v12 inputDelegate];
  [v3 textWillChange:v12];

  if ([v2 isEmpty])
  {
    id v4 = [v12 tokenizer];
    BOOL v5 = [v2 start];
    id v6 = [v4 positionFromPosition:v5 toBoundary:4 inDirection:1];

    if (v6)
    {
      uint64_t v7 = [v2 start];
      uint64_t v8 = [v12 comparePosition:v7 toPosition:v6];

      if (v8 == 1)
      {
        id v9 = [v2 start];
        uint64_t v10 = [v12 textRangeFromPosition:v6 toPosition:v9];

        id v2 = (void *)v10;
      }
    }
  }
  [a1 _deleteTextRange:v2];
  uint64_t v11 = [v12 inputDelegate];
  [v11 textDidChange:v12];
}

- (void)_deleteToEndOfLine
{
  id v12 = [a1 _selectableText];
  id v2 = [v12 selectedTextRange];
  uint64_t v3 = [v12 inputDelegate];
  [v3 textWillChange:v12];

  if ([v2 isEmpty])
  {
    id v4 = [v12 tokenizer];
    BOOL v5 = [v2 end];
    id v6 = [v4 positionFromPosition:v5 toBoundary:4 inDirection:0];

    if (v6)
    {
      uint64_t v7 = [v2 end];
      uint64_t v8 = [v12 comparePosition:v6 toPosition:v7];

      if (v8 == 1)
      {
        id v9 = [v2 end];
        uint64_t v10 = [v12 textRangeFromPosition:v9 toPosition:v6];

        id v2 = (void *)v10;
      }
    }
  }
  [a1 _deleteTextRange:v2];
  uint64_t v11 = [v12 inputDelegate];
  [v11 textDidChange:v12];
}

- (void)_deleteToEndOfParagraph
{
  id v12 = [a1 _selectableText];
  id v2 = [v12 selectedTextRange];
  uint64_t v3 = [v12 inputDelegate];
  [v3 textWillChange:v12];

  if ([v2 isEmpty])
  {
    id v4 = [v12 tokenizer];
    BOOL v5 = [v2 end];
    id v6 = [v4 positionFromPosition:v5 toBoundary:3 inDirection:0];

    if (v6)
    {
      uint64_t v7 = [v2 end];
      uint64_t v8 = [v12 comparePosition:v6 toPosition:v7];

      if (v8 == 1)
      {
        id v9 = [v2 end];
        uint64_t v10 = [v12 textRangeFromPosition:v9 toPosition:v6];

        id v2 = (void *)v10;
      }
    }
  }
  [a1 _deleteTextRange:v2];
  uint64_t v11 = [v12 inputDelegate];
  [v11 textDidChange:v12];
}

- (void)_deleteTextRange:()UITextInput_Internal
{
  id v4 = a3;
  id v9 = [a1 _selectableText];
  BOOL v5 = [v9 selectedTextRange];
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

- (void)_deleteBackwardAndNotify:()UITextInput_Internal
{
  id v1 = [a1 _keyInput];
  [v1 deleteBackward];
}

- (void)_deleteForwardAndNotify:()UITextInput_Internal
{
  id v12 = [a1 _selectableText];
  id v2 = [v12 selectedTextRange];
  uint64_t v3 = [v12 inputDelegate];
  [v3 textWillChange:v12];

  if ([v2 isEmpty])
  {
    id v4 = [v12 tokenizer];
    BOOL v5 = [v2 end];
    id v6 = [v4 positionFromPosition:v5 toBoundary:0 inDirection:0];

    if (v6)
    {
      char v7 = [v2 end];
      uint64_t v8 = [v12 comparePosition:v6 toPosition:v7];

      if (v8 == 1)
      {
        id v9 = [v2 end];
        uint64_t v10 = [v12 textRangeFromPosition:v9 toPosition:v6];

        id v2 = (void *)v10;
      }
    }
  }
  [a1 _deleteTextRange:v2];
  uint64_t v11 = [v12 inputDelegate];
  [v11 textDidChange:v12];
}

- (void)_transpose
{
  id v18 = [a1 _selectableText];
  id v1 = [v18 selectedTextRange];
  if ([v1 isEmpty])
  {
    id v2 = [v18 inputDelegate];
    [v2 textWillChange:v18];

    uint64_t v3 = [v18 tokenizer];
    id v4 = [v1 start];
    BOOL v5 = [v3 positionFromPosition:v4 toBoundary:0 inDirection:1];

    id v6 = [v18 tokenizer];
    char v7 = [v1 end];
    uint64_t v8 = [v6 positionFromPosition:v7 toBoundary:0 inDirection:0];

    if (v5 && v8)
    {
      id v9 = [v1 start];
      uint64_t v10 = [v18 textRangeFromPosition:v5 toPosition:v9];

      uint64_t v11 = [v1 end];
      id v12 = [v18 textRangeFromPosition:v11 toPosition:v8];

      if (v10 && v12)
      {
        uint64_t v13 = [v18 textInRange:v10];
        uint64_t v14 = [v18 textInRange:v12];
        uint64_t v15 = [v14 stringByAppendingString:v13];
        int v16 = [v18 textRangeFromPosition:v5 toPosition:v8];
        if (v16) {
          [v18 replaceRange:v16 withText:v15];
        }
      }
    }
    id v17 = [v18 inputDelegate];
    [v17 textDidChange:v18];
  }
}

- (void)_replaceCurrentWordWithText:()UITextInput_Internal
{
  id v8 = a3;
  id v4 = [a1 _selectableText];
  BOOL v5 = [v4 selectedTextRange];
  id v6 = [v5 start];
  char v7 = [a1 _rangeOfEnclosingWord:v6];

  if (v7) {
    [v4 replaceRange:v7 withText:v8];
  }
}

- (void)_replaceDocumentWithText:()UITextInput_Internal
{
  id v7 = a3;
  id v4 = [a1 _selectableText];
  BOOL v5 = [a1 _fullRange];
  id v6 = v5;
  if (v5)
  {
    if (([v5 isEmpty] & 1) == 0) {
      [v4 replaceRange:v6 withText:&stru_1ED0E84C0];
    }
    [v4 insertText:v7];
  }
}

- (void)_scrollRectToVisible:()UITextInput_Internal animated:
{
  id v14 = [a1 _selectableText];
  id v12 = [v14 textInputView];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = [v12 performSelector:sel__enclosingScrollerIncludingSelf];
    objc_msgSend(v13, "convertRect:fromView:", v12, a2, a3, a4, a5);
    objc_msgSend(v13, "scrollRectToVisible:animated:", a7);
  }
}

- (id)_normalizedStringForRangeComparison:()UITextInput_Internal
{
  uint64_t v3 = [a3 _stringByReplacingCharacter:160 withCharacter:32];
  id v4 = [v3 _stringByReplacingCharacter:8217 withCharacter:39];

  BOOL v5 = [v4 _stringByReplacingCharacter:8216 withCharacter:39];

  return v5;
}

- (id)_rangeOfText:()UITextInput_Internal endingAtPosition:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _selectableText];
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
    uint64_t v13 = objc_msgSend(v8, "positionFromPosition:offset:", v7, -objc_msgSend(v6, "length"));
    if (!v13)
    {
      uint64_t v13 = [v8 beginningOfDocument];
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
        id v21 = [a1 _normalizedStringForRangeComparison:v10];
        v22 = [a1 _normalizedStringForRangeComparison:v6];
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
        uint64_t v13 = [v8 positionFromPosition:v13 offset:1];

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

      uint64_t v13 = 0;
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

- (id)_rangeOfTextUnit:()UITextInput_Internal enclosingPosition:
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [a1 _selectableText];
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

- (uint64_t)_rangeOfEnclosingWord:()UITextInput_Internal
{
  return [a1 _rangeOfTextUnit:1 enclosingPosition:a3];
}

- (uint64_t)_rangeOfLineEnclosingPosition:()UITextInput_Internal
{
  return [a1 _rangeOfTextUnit:4 enclosingPosition:a3];
}

- (uint64_t)_rangeOfSentenceEnclosingPosition:()UITextInput_Internal
{
  return [a1 _rangeOfTextUnit:2 enclosingPosition:a3];
}

- (uint64_t)_rangeOfParagraphEnclosingPosition:()UITextInput_Internal
{
  return [a1 _rangeOfTextUnit:3 enclosingPosition:a3];
}

- (id)_fullRange
{
  id v1 = [a1 _selectableText];
  id v2 = [v1 beginningOfDocument];
  uint64_t v3 = [v1 endOfDocument];
  id v4 = [v1 textRangeFromPosition:v2 toPosition:v3];

  return v4;
}

- (id)_rangeSpanningTextUnit:()UITextInput_Internal andPosition:
{
  id v6 = a4;
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_17;
  }
  id v7 = [a1 _selectableText];
  id v8 = [a1 _rangeOfTextUnit:a3 enclosingPosition:v6];
  if (!v8)
  {
    id v9 = [v7 tokenizer];
    uint64_t v10 = 1;
    uint64_t v11 = [v9 positionFromPosition:v6 toBoundary:a3 inDirection:1];

    id v12 = (void *)v11;
    if (!v11)
    {
      uint64_t v13 = [v7 tokenizer];
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

- (BOOL)_range:()UITextInput_Internal containsRange:
{
  id v6 = a4;
  NSUInteger v7 = [a1 _nsrangeForTextRange:a3];
  NSUInteger v9 = v8;
  NSUInteger v10 = [a1 _nsrangeForTextRange:v6];
  NSUInteger v12 = v11;

  if (!v12) {
    return v10 >= v7 && v10 - v7 < v9;
  }
  v17.location = v7;
  v17.length = v9;
  v18.location = v10;
  v18.length = v12;
  NSRange v13 = NSIntersectionRange(v17, v18);
  return v10 == v13.location && v12 == v13.length;
}

- (BOOL)_range:()UITextInput_Internal intersectsRange:
{
  id v6 = a4;
  NSUInteger v7 = [a1 _nsrangeForTextRange:a3];
  NSUInteger v9 = v8;
  NSUInteger v10 = [a1 _nsrangeForTextRange:v6];
  NSUInteger v12 = v11;

  v14.location = v7;
  v14.length = v9;
  v15.location = v10;
  v15.length = v12;
  return NSIntersectionRange(v14, v15).length != 0;
}

- (id)_intersectionOfRange:()UITextInput_Internal andRange:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  NSUInteger v9 = [v6 start];
  NSUInteger v10 = [v7 start];
  if ([v8 comparePosition:v9 toPosition:v10] == 1) {
    NSUInteger v11 = v6;
  }
  else {
    NSUInteger v11 = v7;
  }
  NSUInteger v12 = [v11 start];

  NSRange v13 = [v6 end];
  NSRange v14 = [v7 end];
  if ([v8 comparePosition:v13 toPosition:v14] == -1) {
    NSRange v15 = v6;
  }
  else {
    NSRange v15 = v7;
  }
  unint64_t v16 = [v15 end];

  NSRange v17 = [v8 textRangeFromPosition:v12 toPosition:v16];

  return v17;
}

- (BOOL)_range:()UITextInput_Internal isEqualToRange:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 == v7)
  {
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
    if (v6 && v7)
    {
      id v10 = a1;
      NSUInteger v11 = [v6 start];
      NSUInteger v12 = [v8 start];
      uint64_t v13 = [v10 comparePosition:v11 toPosition:v12];

      NSRange v14 = [v6 end];
      NSRange v15 = [v8 end];
      uint64_t v16 = v13 | [v10 comparePosition:v14 toPosition:v15];

      BOOL v9 = v16 == 0;
    }
  }

  return v9;
}

- (id)_findBoundaryPositionClosestToPosition:()UITextInput_Internal withGranularity:
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 5)
  {
    id v8 = [a1 _findDocumentBoundaryFromPosition:v6];
  }
  else if (a4 == 1)
  {
    id v8 = [a1 _findPleasingWordBoundaryFromPosition:v6];
  }
  else
  {
    id v8 = v6;
  }
  BOOL v9 = v8;

  return v9;
}

- (id)_findPleasingWordBoundaryFromPosition:()UITextInput_Internal
{
  id v4 = a3;
  BOOL v5 = [a1 _selectableText];
  id v6 = [v5 tokenizer];
  if ([v6 isPosition:v4 atBoundary:4 inDirection:0]) {
    goto LABEL_2;
  }
  int v9 = [v6 isPosition:v4 withinTextUnit:1 inDirection:0];
  id v10 = [v5 tokenizer];
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

- (id)_findDocumentBoundaryFromPosition:()UITextInput_Internal
{
  id v4 = a3;
  BOOL v5 = [a1 _selectableText];
  id v6 = [v5 beginningOfDocument];
  id v7 = [v5 endOfDocument];
  uint64_t v8 = [v5 offsetFromPosition:v6 toPosition:v4];
  uint64_t v9 = [v5 offsetFromPosition:v4 toPosition:v7];

  if (v8 <= v9) {
    id v10 = v6;
  }
  else {
    id v10 = v7;
  }
  id v11 = v10;

  return v11;
}

- (id)_underlineRectsByDocumentLineForSelectionRange:()UITextInput_Internal
{
  id v4 = a3;
  BOOL v5 = [a1 _selectableText];
  id v6 = [v5 tokenizer];
  id v7 = [v4 start];
  uint64_t v8 = [v6 rangeEnclosingPosition:v7 withGranularity:4 inDirection:0];

  uint64_t v9 = [v4 end];
  id v10 = [v6 rangeEnclosingPosition:v9 withGranularity:4 inDirection:0];

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

  v29 = (void *)v19;
  [a1 _updateSelectedRects:v15 byTrimmingWhitespaceInRange:v19 inDocument:v5];
  v20 = [v8 end];
  id v21 = [v6 rangeEnclosingPosition:v20 withGranularity:4 inDirection:0];

  if (v21)
  {
    while (([v21 isEqual:v10] & 1) == 0)
    {
      v22 = [v21 end];
      v23 = [v6 rangeEnclosingPosition:v22 withGranularity:4 inDirection:0];

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
  v25 = [v10 start];
  v26 = [v4 end];
  v27 = [v5 textRangeFromPosition:v25 toPosition:v26];

  if (v27) {
    [a1 _updateSelectedRects:v15 byTrimmingWhitespaceInRange:v27 inDocument:v5];
  }

LABEL_10:
  return v15;
}

- (void)_updateSelectedRects:()UITextInput_Internal byTrimmingWhitespaceInRange:inDocument:
{
  id v18 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v7)
  {
    id v10 = [v8 textInRange:v7];
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

- (id)_rangeOfSmartSelectionIncludingRange:()UITextInput_Internal
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [a1 _selectableText];
    id v6 = v4;
    id v7 = [v5 tokenizer];
    id v8 = [v6 start];
    uint64_t v9 = [v7 positionFromPosition:v8 toBoundary:2 inDirection:1];
    id v10 = v9;
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
        v22 = [v7 positionFromPosition:v21 toBoundary:0 inDirection:1];
        v23 = v22;
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
    v26 = [v6 end];
    v27 = [v7 positionFromPosition:v26 toBoundary:2 inDirection:0];
    int v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      id v29 = [v5 endOfDocument];
    }
    v30 = v29;

    v31 = [v6 end];
    uint64_t v32 = [v5 offsetFromPosition:v31 toPosition:v30];

    if (v32 >= 65)
    {
      v33 = [v6 end];
      v34 = [v5 positionFromPosition:v33 offset:64];

      v30 = [v7 positionFromPosition:v34 toBoundary:1 inDirection:1];

      if (!v30)
      {
        v35 = [v6 end];
        v36 = [v5 positionFromPosition:v35 offset:64];

        v30 = [v7 positionFromPosition:v36 toBoundary:0 inDirection:1];
      }
      v37 = [v6 end];
      uint64_t v38 = [v5 comparePosition:v37 toPosition:v30];

      if (v38 == 1)
      {
        v39 = [v6 end];
        v40 = [v7 positionFromPosition:v39 toBoundary:0 inDirection:0];
        v41 = v40;
        if (v40)
        {
          id v42 = v40;
        }
        else
        {
          id v42 = [v6 end];
        }
        id v43 = v42;

        v30 = v43;
      }
    }
    v57 = v7;
    v59 = [v5 textRangeFromPosition:v12 toPosition:v30];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (uint64_t v44 = [v5 keyboardType], v45 = 420, v44 != 3) && v44 != 10 && v44 != 120)
    {
      uint64_t v45 = 428;
    }
    v46 = [v5 beginningOfDocument];
    v56 = v12;
    int v47 = [v5 offsetFromPosition:v46 toPosition:v12];

    uint64_t v48 = [a1 _nsrangeForTextRange:v6];
    uint64_t v50 = v49;
    v51 = [v5 textInRange:v59];
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3010000000;
    v64 = &unk_186D7DBA7;
    long long v65 = xmmword_186B93450;
    v52 = +[UIKeyboardImpl activeInstance];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __70__DOMNode_UITextInput_Internal___rangeOfSmartSelectionIncludingRange___block_invoke;
    v60[3] = &unk_1E52FEBF0;
    v60[4] = &v61;
    objc_msgSend(v52, "smartSelectionForTextInDocument:inRange:options:completion:", v51, v48 - v47, v50, v45, v60);

    uint64_t v53 = v62[4];
    if (v53 != 0x7FFFFFFFFFFFFFFFLL && v62[5])
    {
      v62[4] = v53 + v47;
      uint64_t v54 = objc_msgSend(a1, "_textRangeFromNSRange:");

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

- (id)_clampedpositionFromPosition:()UITextInput_Internal offset:
{
  id v6 = a3;
  id v7 = v6;
  if (!a4)
  {
    id v10 = v6;
    goto LABEL_10;
  }
  id v8 = [a1 _selectableText];
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

- (id)_rangeFromCurrentRangeWithDelta:()UITextInput_Internal
{
  id v6 = [a1 _selectableText];
  id v7 = [v6 selectedTextRange];
  id v8 = v7;
  if (a3 | a4)
  {
    uint64_t v10 = a4 + a3;
    uint64_t v11 = [v7 start];
    NSUInteger v12 = [v8 end];
    if (a3)
    {
      uint64_t v13 = [v6 positionFromPosition:v11 offset:a3];

      uint64_t v11 = (void *)v13;
      if (!v13)
      {
        if (a3 < 0) {
          [v6 beginningOfDocument];
        }
        else {
        uint64_t v11 = [v6 endOfDocument];
        }
      }
    }
    if (v10)
    {
      uint64_t v14 = [v6 positionFromPosition:v12 offset:v10];

      NSUInteger v12 = (void *)v14;
      if (!v14)
      {
        if (v10 < 0)
        {
          id v15 = v11;
        }
        else
        {
          id v15 = [v6 endOfDocument];
        }
        NSUInteger v12 = v15;
      }
    }
    uint64_t v16 = [v6 textRangeFromPosition:v11 toPosition:v12];
    NSRange v17 = (void *)v16;
    if (v16) {
      id v18 = (void *)v16;
    }
    else {
      id v18 = v8;
    }
    id v9 = v18;
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

- (id)_textColorForCaretSelection
{
  if (objc_opt_respondsToSelector())
  {
    id v2 = [a1 textColorForCaretSelection];
  }
  else
  {
    uint64_t v3 = [a1 _selectableText];
    if (objc_opt_respondsToSelector())
    {
      id v4 = [v3 selectedTextRange];
      BOOL v5 = [v4 end];

      if (v5)
      {
        id v6 = [v3 endOfDocument];
        if (v6 && [v3 comparePosition:v6 toPosition:v5] == -1)
        {
          id v7 = v6;

          BOOL v5 = v7;
        }
        id v8 = [v3 textStylingAtPosition:v5 inDirection:0];
      }
      else
      {
        id v8 = 0;
      }
      if (dyld_program_sdk_at_least()) {
        id v9 = *(__CFString **)off_1E52D2048;
      }
      else {
        id v9 = @"UITextInputTextColorKey";
      }
      id v2 = [v8 objectForKey:v9];
    }
    else
    {
      id v2 = 0;
    }
  }
  return v2;
}

- (id)_fontForCaretSelection
{
  if (objc_opt_respondsToSelector())
  {
    id v2 = [a1 fontForCaretSelection];
  }
  else
  {
    uint64_t v3 = [a1 _selectableText];
    if (objc_opt_respondsToSelector())
    {
      id v4 = [v3 selectedTextRange];
      BOOL v5 = [v4 end];

      if (v5)
      {
        id v6 = [v3 endOfDocument];
        if (v6 && [v3 comparePosition:v6 toPosition:v5] == -1)
        {
          id v7 = v6;

          BOOL v5 = v7;
        }
        id v8 = [v3 textStylingAtPosition:v5 inDirection:0];
      }
      else
      {
        id v8 = 0;
      }
      if (dyld_program_sdk_at_least()) {
        id v9 = *(__CFString **)off_1E52D2040;
      }
      else {
        id v9 = @"UITextInputTextFontKey";
      }
      id v2 = [v8 objectForKey:v9];
    }
    else
    {
      id v2 = 0;
    }
  }
  return v2;
}

- (void)_updateSelectionWithTextRange:()UITextInput_Internal withAffinityDownstream:
{
  id v6 = a3;
  id v7 = [a1 _selectableText];
  [v7 _setSelectedTextRange:v6 withAffinityDownstream:a4];
}

- (id)_setSelectionRangeWithHistory:()UITextInput_Internal
{
  id v4 = a3;
  BOOL v5 = [a1 _selectableText];
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

  id v9 = [v4 start];
  uint64_t v10 = [v4 end];
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
  uint64_t v14 = [v4 end];
  id v15 = [v5 textRangeFromPosition:v13 toPosition:v14];

  objc_msgSend(a1, "_updateSelectionWithTextRange:withAffinityDownstream:", v15, objc_msgSend(v4, "affinityDownstream"));
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
    id v18 = [a1 webView];
    [v16 postNotificationName:v17 object:v18];
  }
LABEL_19:

  return v4;
}

- (UITextInputArrowKeyHistory)_setHistory:()UITextInput_Internal withExtending:withAnchor:withAffinityDownstream:
{
  uint64_t v10 = a3;
  if (v10)
  {
    uint64_t v11 = v10;
    if ((a4 & 1) == 0) {
      [(UITextInputArrowKeyHistory *)v10 setAnchor:0];
    }
  }
  else
  {
    uint64_t v11 = objc_alloc_init(UITextInputArrowKeyHistory);
  }
  uint64_t v12 = [a1 _selectableText];
  uint64_t v13 = [v12 selectedTextRange];
  uint64_t v14 = [v13 start];
  [(UITextInputArrowKeyHistory *)v11 setStart:v14];

  id v15 = [v12 selectedTextRange];
  uint64_t v16 = [v15 end];
  [(UITextInputArrowKeyHistory *)v11 setEnd:v16];

  int v17 = [(UITextInputArrowKeyHistory *)v11 anchor];
  id v18 = [v12 selectedTextRange];
  uint64_t v19 = v18;
  if (a5 == 2)
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

  v22 = [(UITextInputArrowKeyHistory *)v11 startPosition];

  if (!v22)
  {
    v23 = [(UITextInputArrowKeyHistory *)v11 cursor];
    [(UITextInputArrowKeyHistory *)v11 setStartPosition:v23];

    if (a4) {
      goto LABEL_12;
    }
LABEL_16:
    a5 = 0;
LABEL_17:
    [(UITextInputArrowKeyHistory *)v11 setAnchor:a5];
    goto LABEL_18;
  }
  if (!a4) {
    goto LABEL_16;
  }
LABEL_12:
  if (!-[UITextInputArrowKeyHistory anchor](v11, "anchor") || [a1 _isEmptySelection]) {
    goto LABEL_17;
  }
LABEL_18:
  [(UITextInputArrowKeyHistory *)v11 setAffinityDownstream:a6];

  return v11;
}

- (id)_moveToStartOfWord:()UITextInput_Internal withHistory:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
  int v8 = [v7 selectedTextRange];

  if (v8)
  {
    id v9 = [a1 _setHistory:v6 withExtending:a3 withAnchor:2 withAffinityDownstream:1];

    [v9 setAmount:0];
    uint64_t v10 = [v7 tokenizer];
    uint64_t v11 = [v9 cursor];
    char v12 = [v10 isPosition:v11 withinTextUnit:1 inDirection:1];

    if (v12)
    {
LABEL_7:
      v22 = [v7 tokenizer];
      v23 = [v9 cursor];
      id v24 = [v22 positionFromPosition:v23 toBoundary:1 inDirection:1];
      [v9 setCursor:v24];

      id v25 = [v9 cursor];
      [v9 setStartPosition:v25];

      v26 = [a1 _setSelectionRangeWithHistory:v9];
      goto LABEL_9;
    }
    uint64_t v13 = [v7 tokenizer];
    uint64_t v14 = [v9 cursor];
    id v15 = [v13 positionFromPosition:v14 toBoundary:1 inDirection:1];

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
    id v15 = [v9 cursor];
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
        v35 = [v7 beginningOfDocument];
        [v9 setCursor:v35];

        v36 = [v9 cursor];
        [v9 setStartPosition:v36];

        break;
      }
      id v31 = v15;

      uint64_t v32 = [v7 tokenizer];
      id v15 = [v32 positionFromPosition:v31 toBoundary:3 inDirection:1];

      v33 = [v7 tokenizer];
      char v34 = [v33 isPosition:v15 atBoundary:3 inDirection:1];

      int v28 = v31;
      if ((v34 & 1) == 0)
      {
        [v9 setCursor:v15];

        goto LABEL_4;
      }
    }
    v26 = [a1 _setSelectionRangeWithHistory:v9];
  }
  else
  {
    v26 = 0;
    id v9 = v6;
  }
LABEL_9:

  return v26;
}

- (id)_moveToEndOfWord:()UITextInput_Internal withHistory:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
  int v8 = [v7 selectedTextRange];

  if (v8)
  {
    id v9 = [a1 _setHistory:v6 withExtending:a3 withAnchor:1 withAffinityDownstream:1];

    [v9 setAmount:0];
    uint64_t v10 = [v7 tokenizer];
    uint64_t v11 = [v9 cursor];
    char v12 = [v10 isPosition:v11 withinTextUnit:1 inDirection:0];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [v7 tokenizer];
      uint64_t v14 = [v9 cursor];
      id v15 = [v13 positionFromPosition:v14 toBoundary:1 inDirection:0];

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

    v22 = [a1 _setSelectionRangeWithHistory:v9];
  }
  else
  {
    v22 = 0;
    id v9 = v6;
  }

  return v22;
}

- (id)_moveToStartOfLine:()UITextInput_Internal withHistory:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
  int v8 = [v7 selectedTextRange];

  if (!v8)
  {
    int v17 = 0;
    uint64_t v10 = v6;
    goto LABEL_11;
  }
  char v9 = [v6 affinityDownstream];
  uint64_t v10 = [a1 _setHistory:v6 withExtending:a3 withAnchor:2 withAffinityDownstream:1];

  [v10 setAmount:0];
  uint64_t v11 = [v7 tokenizer];
  char v12 = [v7 selectedTextRange];
  uint64_t v13 = [v12 end];
  if (([v11 isPosition:v13 atBoundary:3 inDirection:1] & 1) == 0)
  {
    if (v9)
    {
      uint64_t v14 = [v7 tokenizer];
      id v15 = [v10 cursor];
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

  int v17 = [a1 _setSelectionRangeWithHistory:v10];
LABEL_11:

  return v17;
}

- (id)_moveToEndOfLine:()UITextInput_Internal withHistory:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
  int v8 = [v7 selectedTextRange];

  if (!v8)
  {
    uint64_t v14 = 0;
    uint64_t v10 = v6;
    goto LABEL_10;
  }
  int v9 = [v6 affinityDownstream];
  uint64_t v10 = [a1 _setHistory:v6 withExtending:a3 withAnchor:1 withAffinityDownstream:0];

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
  id v15 = [v7 tokenizer];
  char v16 = [v10 cursor];
  char v17 = [v15 isPosition:v16 atBoundary:4 inDirection:0];

  if ((v17 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_9:
  char v18 = [v10 cursor];
  [v10 setStartPosition:v18];

  uint64_t v14 = [a1 _setSelectionRangeWithHistory:v10];
LABEL_10:

  return v14;
}

- (id)_moveToStartOfParagraph:()UITextInput_Internal withHistory:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
  int v8 = [v7 selectedTextRange];

  if (v8)
  {
    int v9 = [a1 _setHistory:v6 withExtending:a3 withAnchor:2 withAffinityDownstream:1];

    [v9 setAmount:0];
    uint64_t v10 = [v7 tokenizer];
    uint64_t v11 = [v9 cursor];
    int v12 = [v10 isPosition:v11 atBoundary:3 inDirection:1];

    if (v12)
    {
      uint64_t v13 = [v9 cursor];
      uint64_t v14 = [v10 positionFromPosition:v13 toBoundary:0 inDirection:1];

      if (v14) {
        [v9 setCursor:v14];
      }
    }
    id v15 = [v9 cursor];
    char v16 = [v10 positionFromPosition:v15 toBoundary:3 inDirection:1];
    [v9 setCursor:v16];

    char v17 = [v9 cursor];
    [v9 setStartPosition:v17];

    char v18 = [a1 _setSelectionRangeWithHistory:v9];
  }
  else
  {
    char v18 = 0;
    int v9 = v6;
  }

  return v18;
}

- (id)_moveToEndOfParagraph:()UITextInput_Internal withHistory:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
  int v8 = [v7 selectedTextRange];

  if (v8)
  {
    int v9 = [a1 _setHistory:v6 withExtending:a3 withAnchor:1 withAffinityDownstream:0];

    [v9 setAmount:0];
    uint64_t v10 = [v7 tokenizer];
    uint64_t v11 = [v9 cursor];
    int v12 = [v10 isPosition:v11 atBoundary:3 inDirection:0];

    if (v12)
    {
      uint64_t v13 = [v9 cursor];
      uint64_t v14 = [v10 positionFromPosition:v13 toBoundary:0 inDirection:0];

      if (v14) {
        [v9 setCursor:v14];
      }
    }
    id v15 = [v9 cursor];
    char v16 = [v10 positionFromPosition:v15 toBoundary:3 inDirection:0];
    [v9 setCursor:v16];

    char v17 = [v9 cursor];
    [v9 setStartPosition:v17];

    char v18 = [a1 _setSelectionRangeWithHistory:v9];
  }
  else
  {
    char v18 = 0;
    int v9 = v6;
  }

  return v18;
}

- (id)_moveToStartOfDocument:()UITextInput_Internal withHistory:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
  int v8 = [v7 selectedTextRange];

  if (v8)
  {
    int v9 = [a1 _setHistory:v6 withExtending:a3 withAnchor:2 withAffinityDownstream:1];

    [v9 setAmount:0];
    uint64_t v10 = [v7 beginningOfDocument];
    [v9 setCursor:v10];

    uint64_t v11 = [v9 cursor];
    [v9 setStartPosition:v11];

    int v12 = [a1 _setSelectionRangeWithHistory:v9];
    id v6 = v9;
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (id)_moveToEndOfDocument:()UITextInput_Internal withHistory:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
  int v8 = [v7 selectedTextRange];

  if (v8)
  {
    int v9 = [a1 _setHistory:v6 withExtending:a3 withAnchor:1 withAffinityDownstream:0];

    [v9 setAmount:0];
    uint64_t v10 = [v7 endOfDocument];
    [v9 setCursor:v10];

    uint64_t v11 = [v9 cursor];
    [v9 setStartPosition:v11];

    int v12 = [v7 tokenizer];
    uint64_t v13 = [v9 cursor];
    int v14 = [v12 isPosition:v13 atBoundary:4 inDirection:3];

    if (v14) {
      [v9 setAffinityDownstream:1];
    }
    id v15 = [a1 _setSelectionRangeWithHistory:v9];
  }
  else
  {
    id v15 = 0;
    int v9 = v6;
  }

  return v15;
}

- (id)_moveUp:()UITextInput_Internal withHistory:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
  int v8 = [v7 selectedTextRange];

  if (v8)
  {
    if (v6) {
      uint64_t v9 = [v6 affinityDownstream];
    }
    else {
      uint64_t v9 = [a1 _selectionAffinity] == 0;
    }
    uint64_t v11 = [a1 _setHistory:v6 withExtending:a3 withAnchor:2 withAffinityDownstream:v9];

    objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
    int v12 = [v11 cursor];
    uint64_t v13 = [v7 beginningOfDocument];
    uint64_t v14 = [v7 comparePosition:v12 toPosition:v13];

    if (v14)
    {
      id v15 = [v11 startPosition];
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
        v22 = [v7 beginningOfDocument];
        [v11 setCursor:v22];

        objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
      }
    }
    else
    {
      objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
    }
    uint64_t v10 = [a1 _setSelectionRangeWithHistory:v11];
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = v6;
  }

  return v10;
}

- (id)_moveDown:()UITextInput_Internal withHistory:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
  int v8 = [v7 selectedTextRange];

  if (v8)
  {
    if (v6) {
      uint64_t v9 = [v6 affinityDownstream];
    }
    else {
      uint64_t v9 = [a1 _selectionAffinity] == 0;
    }
    uint64_t v11 = [a1 _setHistory:v6 withExtending:a3 withAnchor:1 withAffinityDownstream:v9];

    objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") - 1);
    int v12 = [v11 cursor];
    uint64_t v13 = [v7 endOfDocument];
    uint64_t v14 = [v7 comparePosition:v12 toPosition:v13];

    if (v14)
    {
      id v15 = [v11 startPosition];
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
        v22 = [v7 endOfDocument];
        [v11 setCursor:v22];

        objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
      }
    }
    else
    {
      objc_msgSend(v11, "setAmount:", objc_msgSend(v11, "amount") + 1);
    }
    uint64_t v10 = [a1 _setSelectionRangeWithHistory:v11];
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = v6;
  }

  return v10;
}

- (id)_moveLeft:()UITextInput_Internal withHistory:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
  int v8 = [v7 selectedTextRange];

  if (v8)
  {
    uint64_t v9 = [a1 _setHistory:v6 withExtending:a3 withAnchor:2 withAffinityDownstream:1];

    [v9 setAmount:0];
    uint64_t v10 = [v7 selectedTextRange];
    char v11 = [v10 isEmpty];

    if ((v11 & 1) != 0 || a3)
    {
      int v12 = [v9 cursor];
      uint64_t v13 = [v7 positionFromPosition:v12 inDirection:3 offset:1];
      [v9 setCursor:v13];
    }
    uint64_t v14 = [v9 cursor];
    [v9 setStartPosition:v14];

    id v15 = [a1 _setSelectionRangeWithHistory:v9];
  }
  else
  {
    id v15 = 0;
    uint64_t v9 = v6;
  }

  return v15;
}

- (id)_moveRight:()UITextInput_Internal withHistory:
{
  id v6 = a4;
  id v7 = [a1 _selectableText];
  int v8 = [v7 selectedTextRange];

  if (v8)
  {
    uint64_t v9 = [a1 _setHistory:v6 withExtending:a3 withAnchor:1 withAffinityDownstream:1];

    [v9 setAmount:0];
    uint64_t v10 = [v7 selectedTextRange];
    char v11 = [v10 isEmpty];

    if ((v11 & 1) != 0 || a3)
    {
      int v12 = [v9 cursor];
      uint64_t v13 = [v7 positionFromPosition:v12 inDirection:2 offset:1];
      [v9 setCursor:v13];
    }
    uint64_t v14 = [v9 cursor];
    [v9 setStartPosition:v14];

    id v15 = [a1 _setSelectionRangeWithHistory:v9];
  }
  else
  {
    id v15 = 0;
    uint64_t v9 = v6;
  }

  return v15;
}

- (id)_positionFromPosition:()UITextInput_Internal inDirection:offset:withAffinityDownstream:
{
  id v8 = a3;
  uint64_t v9 = [a1 _selectableText];
  uint64_t v10 = [v9 positionFromPosition:v8 inDirection:a4 offset:a5];

  return v10;
}

- (void)_setSelectedTextRange:()UITextInput_Internal withAffinityDownstream:
{
  id v7 = a3;
  if (objc_opt_respondsToSelector())
  {
    [a1 setSelectedTextRange:v7 withAffinityDownstream:a4];
  }
  else
  {
    id v6 = [a1 _selectableText];
    [v6 setSelectedTextRange:v7];
  }
}

- (uint64_t)_selectionAffinity
{
  id v1 = [a1 _selectableText];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v3 = [v1 tokenizer];
    id v4 = [v1 selectedTextRange];
    BOOL v5 = [v4 start];
    if ([v3 isPosition:v5 atBoundary:3 inDirection:1])
    {
    }
    else
    {
      id v6 = [v1 tokenizer];
      id v7 = [v1 selectedTextRange];
      id v8 = [v7 end];
      char v9 = [v6 isPosition:v8 atBoundary:4 inDirection:2];

      if (v9)
      {
        uint64_t v2 = 1;
        goto LABEL_8;
      }
    }
    uint64_t v2 = 0;
    goto LABEL_8;
  }
  uint64_t v2 = [v1 selectionAffinity];
LABEL_8:

  return v2;
}

- (void)_setGestureRecognizers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    [a1 _setInternalGestureRecognizers];
  }
  else
  {
    uint64_t v2 = +[UIKeyboardImpl activeInstance];
    uint64_t v3 = [v2 markedTextOverlay];
    [v3 removeFromSuperview];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = objc_msgSend(v3, "interactions", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 removeInteraction:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    char v9 = [a1 _selectableText];
    uint64_t v10 = [v9 interactionAssistant];
    char v11 = v10;
    if (v10)
    {
      [v10 setGestureRecognizers];
    }
    else if ([v9 _hasMarkedText] {
           && [v2 hasEditableMarkedText])
    }
    {
      int v12 = [v9 markedTextRange];
      [v9 firstRectForRange:v12];
      objc_msgSend(v3, "setFrame:");

      uint64_t v13 = [v9 textInputView];
      [v13 addSubview:v3];

      uint64_t v14 = [[UITextPhraseBoundaryInteraction alloc] initWithTextInput:v9];
      [v3 addInteraction:v14];
    }
  }
}

- (uint64_t)_usesAsynchronousProtocol
{
  id v1 = [a1 _selectableText];
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = [v1 conformsToProtocol:&unk_1ED700D60];
LABEL_9:
      uint64_t v2 = v3;
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v2 = 0;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v1 conformsToProtocolCached:&unk_1ED700940] & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = [v1 conformsToProtocolCached:&unk_1ED7009A0];
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  uint64_t v2 = 1;
LABEL_11:

  return v2;
}

- (uint64_t)_hasMarkedText
{
  id v1 = [a1 _selectableText];
  if ([v1 _usesAsynchronousProtocol]
    && (!+[UIKBInputDelegateManager isAsyncTextInputEnabled]|| (objc_opt_respondsToSelector() & 1) != 0|| (objc_opt_respondsToSelector() & 1) != 0))
  {
    uint64_t v2 = [v1 hasMarkedText];
  }
  else
  {
    uint64_t v3 = [v1 markedTextRange];
    uint64_t v2 = v3 != 0;
  }
  return v2;
}

- (void)_setMarkedText:()UITextInput_Internal selectedRange:
{
  id v8 = (objc_class *)MEMORY[0x1E4F28B18];
  id v9 = a3;
  id v10 = (id)[[v8 alloc] initWithString:v9];

  objc_msgSend(a1, "_setAttributedMarkedText:selectedRange:", v10, a4, a5);
}

- (void)_setAttributedMarkedText:()UITextInput_Internal selectedRange:
{
  id v8 = a3;
  id v27 = [a1 _selectableText];
  int v9 = [a1 _hasMarkedText];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v27, "setAttributedMarkedText:selectedRange:", v8, a4, a5);
  }
  else
  {
    uint64_t v10 = [v8 string];

    objc_msgSend(v27, "setMarkedText:selectedRange:", v10, a4, a5);
    id v8 = (id)v10;
  }

  int v11 = [a1 _hasMarkedText];
  if (v9 != v11)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
    {
      uint64_t v12 = [v27 _selectionDisplayInteraction];
      uint64_t v13 = v27;
      uint64_t v14 = (void *)v12;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v13 = v27;
    }
    [v13 _setGestureRecognizers];
    uint64_t v19 = [a1 _textSelectingContainer];
    uint64_t v20 = [v19 interactionAssistant];
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      v22 = [a1 _textSelectingContainer];
      v23 = [v22 interactionAssistant];
      id v24 = [v23 externalInteractions];

      if (v24)
      {
        id v25 = [a1 _textSelectingContainer];
        v26 = [v25 interactionAssistant];
        [v26 deactivateSelection];

        [v27 _setSelectionDisplayInteraction:v14];
      }
    }
    else
    {
    }
    goto LABEL_15;
  }
  if (v11)
  {
    long long v15 = [a1 _textSelectingContainer];
    long long v16 = [v15 interactionAssistant];

    if (!v16)
    {
      long long v17 = +[UIKeyboardImpl activeInstance];
      uint64_t v14 = [v17 markedTextOverlay];

      long long v18 = [v27 markedTextRange];
      [v27 firstRectForRange:v18];
      objc_msgSend(v14, "setFrame:");

LABEL_15:
    }
  }
}

- (void)_unmarkText
{
  id v12 = [a1 _selectableText];
  int v2 = [a1 _hasMarkedText];
  [v12 unmarkText];
  if (v2)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
    {
      uint64_t v3 = [v12 _selectionDisplayInteraction];
    }
    else
    {
      uint64_t v3 = 0;
    }
    [v12 _setGestureRecognizers];
    id v4 = [a1 _textSelectingContainer];
    uint64_t v5 = [v4 interactionAssistant];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = [a1 _textSelectingContainer];
      id v8 = [v7 interactionAssistant];
      int v9 = [v8 externalInteractions];

      if (v9)
      {
        uint64_t v10 = [a1 _textSelectingContainer];
        int v11 = [v10 interactionAssistant];
        [v11 deactivateSelection];

        [v12 _setSelectionDisplayInteraction:v3];
      }
    }
    else
    {
    }
  }
}

- (uint64_t)_shouldPerformUICalloutBarButtonReplaceAction:()UITextInput_Internal forText:checkAutocorrection:
{
  id v7 = a4;
  id v8 = v7;
  if (sel_promptForReplace_ != a3 && sel__promptForReplace_ != a3)
  {
    if (sel__transliterateChinese_ == a3)
    {
      uint64_t v14 = UIKeyboardEnabledInputModesAllowChineseTransliterationForText(v7);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (a5
    && (+[UIKeyboardImpl activeInstance],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 autocorrectSpellingEnabled],
        v10,
        !v11)
    || ([v8 _containsCJScriptsOnly] & 1) != 0)
  {
LABEL_11:
    uint64_t v14 = 0;
    goto LABEL_13;
  }
  id v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v13 = [v8 componentsSeparatedByCharactersInSet:v12];

  uint64_t v14 = (unint64_t)[v13 count] < 8;
LABEL_13:

  return v14;
}

- (id)_textInteraction
{
  id v1 = [a1 textInputView];
  int v2 = [v1 _textInteraction];

  return v2;
}

- (id)inputAssistantItem
{
  id v1 = [a1 textInputView];
  int v2 = [v1 inputAssistantItem];

  return v2;
}

- (id)_responderWindow
{
  id v1 = [a1 textInputView];
  int v2 = [v1 _responderWindow];

  return v2;
}

- (id)_selectionDisplayInteraction
{
  id v1 = [a1 textInputView];
  int v2 = [v1 _selectionDisplayInteraction];

  return v2;
}

@end