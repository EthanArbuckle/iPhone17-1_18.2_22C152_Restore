@interface UITextReplacementGeneratorForCorrections
+ (id)generatorForTextInput:(id)a3 range:(id)a4 options:(unint64_t)a5;
+ (id)rangeForTextReplacement:(id)a3 textInput:(id)a4;
- (BOOL)forceAutocorrectionGuesses;
- (BOOL)forceHistoryReplacement;
- (BOOL)forceSpellingGuesses;
- (BOOL)isStringMisspelled:(id)a3;
- (BOOL)isStringToReplaceMisspelled;
- (TIKeyboardCandidate)autocorrectionRecord;
- (UITextChecker)textChecker;
- (UITextReplacementGeneratorForCorrections)init;
- (id)addReplacementRevertingAutocorrectionToReplacements:(id)a3;
- (id)replacements;
- (unint64_t)maxCountAfterAutocorrectionGuesses;
- (unint64_t)maxCountAfterSpellingGuesses;
- (unint64_t)maxEditDistance;
- (void)addAutocorrectionGuessesToReplacements:(id)a3;
- (void)addPreviouslySuggestedAutocorrectionToReplacements:(id)a3;
- (void)addSpellingGuessesForString:(id)a3 ToReplacements:(id)a4;
- (void)setAutocorrectionRecord:(id)a3;
- (void)setForceAutocorrectionGuesses:(BOOL)a3;
- (void)setForceHistoryReplacement:(BOOL)a3;
- (void)setForceSpellingGuesses:(BOOL)a3;
- (void)setMaxCountAfterAutocorrectionGuesses:(unint64_t)a3;
- (void)setMaxCountAfterSpellingGuesses:(unint64_t)a3;
- (void)setMaxEditDistance:(unint64_t)a3;
- (void)setTextChecker:(id)a3;
@end

@implementation UITextReplacementGeneratorForCorrections

- (UITextReplacementGeneratorForCorrections)init
{
  v3.receiver = self;
  v3.super_class = (Class)UITextReplacementGeneratorForCorrections;
  result = [(UITextReplacementGeneratorForCorrections *)&v3 init];
  if (result) {
    result->_maxEditDistance = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

+ (id)generatorForTextInput:(id)a3 range:(id)a4 options:(unint64_t)a5
{
  unsigned int v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = +[UIKeyboardImpl activeInstance];
  if (![v9 autocorrectSpellingEnabled] || !v8)
  {
    v15 = 0;
    goto LABEL_41;
  }
  int v10 = [v8 isEmpty];
  if (v10)
  {
    v11 = [(id)objc_opt_class() rangeForTextReplacement:v8 textInput:v7];
    if (v11)
    {
      v12 = [v8 end];
      v13 = [v11 end];
      uint64_t v14 = [v7 comparePosition:v12 toPosition:v13];

      if (v14 == -1)
      {
        v15 = 0;
        v16 = v11;
        goto LABEL_40;
      }
    }
  }
  else
  {
    v11 = v8;
  }
  v16 = [v7 textInRange:v11];
  if ([v16 length])
  {
    v17 = [v9 autocorrectionRecordForWord:v16];
    int v18 = [v17 isAutocorrection];
    v19 = +[UITextChecker grammarAutocorrectionForWord:v16];
    v20 = v19;
    if (v19)
    {
      id v21 = v19;

      int v18 = 1;
      v17 = v21;
    }
    char v22 = v10 ^ 1;
    if (!v17) {
      char v22 = 1;
    }
    v42 = v20;
    int v41 = v18;
    if (v22) {
      goto LABEL_30;
    }
    v23 = [v11 end];
    if ([v7 baseWritingDirectionForPosition:v23 inDirection:0] == 1) {
      uint64_t v24 = 2;
    }
    else {
      uint64_t v24 = 3;
    }
    v25 = [v17 candidate];
    uint64_t v26 = objc_msgSend(v7, "positionFromPosition:inDirection:offset:", v23, v24, objc_msgSend(v25, "length"));

    v27 = (void *)v26;
    v28 = [v7 tokenizer];
    v40 = v27;
    if ([v28 isPosition:v27 atBoundary:1 inDirection:1])
    {
      v29 = [v7 textRangeFromPosition:v27 toPosition:v23];

      id v30 = v29;
      if (v30)
      {
        id v31 = [v7 textInRange:v30];
        if (v31)
        {
          v39 = [v17 candidate];
          int v38 = [v39 isEqual:v31];

          if (v38)
          {
            id v30 = v30;

            id v31 = v31;
            v16 = v31;
            v11 = v30;
            goto LABEL_28;
          }
        }
LABEL_26:
        if ([v17 isToucanInlineCompletionCandidate])
        {
          int v32 = 0;
          goto LABEL_29;
        }
LABEL_28:
        int v32 = 1;
LABEL_29:

        if (!v32)
        {
          v15 = 0;
LABEL_38:

          goto LABEL_39;
        }
LABEL_30:
        v33 = UIKeyboardGetCurrentInputMode();
        int v34 = UIKeyboardCheckSpellingForInputMode(v33);

        v15 = objc_alloc_init(UITextReplacementGeneratorForCorrections);
        [(UITextReplacementGenerator *)v15 setReplacementRange:v11];
        [(UITextReplacementGenerator *)v15 setStringToReplace:v16];
        [(UITextReplacementGeneratorForCorrections *)v15 setAutocorrectionRecord:v17];
        [(UITextReplacementGeneratorForCorrections *)v15 setMaxEditDistance:2];
        [(UITextReplacementGeneratorForCorrections *)v15 setMaxCountAfterAutocorrectionGuesses:1];
        if (v34) {
          uint64_t v35 = 3;
        }
        else {
          uint64_t v35 = 0;
        }
        [(UITextReplacementGeneratorForCorrections *)v15 setMaxCountAfterSpellingGuesses:v35];
        [(UITextReplacementGeneratorForCorrections *)v15 setForceHistoryReplacement:(v5 & 4) == 0];
        if ((v5 & 2) != 0) {
          uint64_t v36 = v41 & (v5 >> 5);
        }
        else {
          uint64_t v36 = 1;
        }
        [(UITextReplacementGeneratorForCorrections *)v15 setForceAutocorrectionGuesses:v36];
        [(UITextReplacementGeneratorForCorrections *)v15 setForceSpellingGuesses:(v5 & 1) == 0];
        goto LABEL_38;
      }
    }
    else
    {

      id v30 = 0;
    }
    id v31 = 0;
    goto LABEL_26;
  }
  v15 = 0;
LABEL_39:
  id v8 = v11;
LABEL_40:

LABEL_41:
  return v15;
}

+ (id)rangeForTextReplacement:(id)a3 textInput:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEmpty])
  {
    id v7 = [v6 tokenizer];
    id v8 = [v5 start];
    v9 = [v7 rangeEnclosingPosition:v8 withGranularity:1 inDirection:1];

    if (v9)
    {
      int v10 = [v9 start];
      v11 = [v9 start];
      uint64_t v12 = [v6 comparePosition:v10 toPosition:v11];

      if (v12 == -1
        || ([v9 end],
            v13 = objc_claimAutoreleasedReturnValue(),
            uint64_t v14 = [v6 comparePosition:v10 toPosition:v13],
            v13,
            v14 == 1))
      {

        v9 = 0;
      }

      id v5 = v9;
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isStringMisspelled:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextReplacementGeneratorForCorrections *)self textChecker];

  if (v5)
  {
    id v6 = +[UITextChecker keyboardLanguages];
    uint64_t v7 = [v4 length];
    id v8 = [(UITextReplacementGeneratorForCorrections *)self textChecker];
    objc_msgSend(v8, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", v4, 0, v7, 0, 0, v6);
    uint64_t v10 = v9;

    if (v10) {
      LOBYTE(v10) = v10 == [v4 length];
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)isStringToReplaceMisspelled
{
  v2 = self;
  objc_super v3 = [(UITextReplacementGenerator *)self stringToReplace];
  LOBYTE(v2) = [(UITextReplacementGeneratorForCorrections *)v2 isStringMisspelled:v3];

  return (char)v2;
}

- (id)addReplacementRevertingAutocorrectionToReplacements:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextReplacementGeneratorForCorrections *)self autocorrectionRecord];

  if (v5)
  {
    id v6 = [(UITextReplacementGeneratorForCorrections *)self autocorrectionRecord];
    uint64_t v7 = [v6 input];

    id v8 = [(UITextReplacementGenerator *)self stringToReplace];
    uint64_t v9 = [(UITextReplacementGeneratorForCorrections *)self autocorrectionRecord];
    uint64_t v10 = [v9 candidate];
    int v11 = [v8 isEqualToString:v10];

    if (v11
      && [(UITextReplacementGenerator *)self shouldAllowString:v7 intoReplacements:v4])
    {
      uint64_t v12 = [(UITextReplacementGenerator *)self replacementWithText:v7];
      v13 = [(UITextReplacementGeneratorForCorrections *)self autocorrectionRecord];
      objc_msgSend(v12, "setUsageTrackingMask:", objc_msgSend(v13, "usageTrackingMask"));

      [v4 addObject:v12];
      uint64_t v14 = v7;
    }
    else
    {
      uint64_t v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)addPreviouslySuggestedAutocorrectionToReplacements:(id)a3
{
  id v15 = a3;
  id v4 = [(UITextReplacementGeneratorForCorrections *)self autocorrectionRecord];

  if (v4)
  {
    id v5 = [(UITextReplacementGenerator *)self stringToReplace];
    id v6 = [(UITextReplacementGeneratorForCorrections *)self autocorrectionRecord];
    uint64_t v7 = [v6 input];
    int v8 = [v5 isEqualToString:v7];

    if (v8)
    {
      uint64_t v9 = [(UITextReplacementGeneratorForCorrections *)self autocorrectionRecord];
      uint64_t v10 = [v9 candidate];
      BOOL v11 = [(UITextReplacementGenerator *)self shouldAllowString:v10 intoReplacements:v15];

      if (v11)
      {
        uint64_t v12 = [(UITextReplacementGeneratorForCorrections *)self autocorrectionRecord];
        v13 = [v12 candidate];
        uint64_t v14 = [(UITextReplacementGenerator *)self replacementWithText:v13];
        [v15 addObject:v14];
      }
    }
  }
}

- (void)addAutocorrectionGuessesToReplacements:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 count];
  if (v5 < [(UITextReplacementGeneratorForCorrections *)self maxCountAfterAutocorrectionGuesses])
  {
    id v6 = +[UIKeyboardImpl sharedInstance];
    uint64_t v7 = [(UITextReplacementGenerator *)self stringToReplace];
    v23 = v6;
    int v8 = [v6 generateAutocorrectionReplacements:v7];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
        uint64_t v14 = [v13 candidate];
        BOOL v15 = [(UITextReplacementGenerator *)self shouldAllowString:v14 intoReplacements:v4];

        if (v15)
        {
          v16 = [(UITextReplacementGenerator *)self stringToReplace];
          v17 = [v13 candidate];
          unint64_t v18 = [v16 _editDistanceFrom:v17];
          unint64_t v19 = [(UITextReplacementGeneratorForCorrections *)self maxEditDistance];

          if (v18 <= v19)
          {
            v20 = [v13 candidate];
            id v21 = [(UITextReplacementGenerator *)self replacementWithText:v20];
            [v4 addObject:v21];

            unint64_t v22 = [v4 count];
            if (v22 >= [(UITextReplacementGeneratorForCorrections *)self maxCountAfterAutocorrectionGuesses])break; {
          }
            }
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void)addSpellingGuessesForString:(id)a3 ToReplacements:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(UITextReplacementGeneratorForCorrections *)self textChecker];

  if (v8)
  {
    unint64_t v9 = [v7 count];
    if (v9 < [(UITextReplacementGeneratorForCorrections *)self maxCountAfterSpellingGuesses])
    {
      uint64_t v10 = [v6 length];
      uint64_t v11 = +[UIKeyboardInputModeController sharedInputModeController];
      uint64_t v12 = [v11 currentInputMode];
      uint64_t v13 = [v12 languageWithRegion];

      uint64_t v14 = [(UITextReplacementGeneratorForCorrections *)self textChecker];
      int v38 = (void *)v13;
      id v39 = v6;
      BOOL v15 = objc_msgSend(v14, "grammarGuessesForRange:inString:language:", 0, v10, v6, v13);

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v45;
LABEL_5:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v45 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v44 + 1) + 8 * v20);
          if ([(UITextReplacementGenerator *)self shouldAllowString:v21 intoReplacements:v7])
          {
            unint64_t v22 = [(UITextReplacementGenerator *)self replacementWithText:v21];
            [v7 addObject:v22];

            unint64_t v23 = [v7 count];
            if (v23 >= [(UITextReplacementGeneratorForCorrections *)self maxCountAfterSpellingGuesses])break; {
          }
            }
          if (v18 == ++v20)
          {
            uint64_t v18 = [v16 countByEnumeratingWithState:&v44 objects:v49 count:16];
            if (v18) {
              goto LABEL_5;
            }
            break;
          }
        }
      }
      v37 = v16;

      uint64_t v24 = [(UITextReplacementGeneratorForCorrections *)self textChecker];
      long long v25 = objc_msgSend(v24, "guessesForWordRange:inString:language:", 0, v10, v39, v38);

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v26 = v25;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v41;
LABEL_14:
        uint64_t v30 = 0;
        while (1)
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void *)(*((void *)&v40 + 1) + 8 * v30);
          unint64_t v32 = [v7 count];
          if (v32 >= [(UITextReplacementGeneratorForCorrections *)self maxCountAfterSpellingGuesses])break; {
          if ([(UITextReplacementGenerator *)self shouldAllowString:v31 intoReplacements:v7])
          }
          {
            v33 = [(UITextReplacementGenerator *)self stringToReplace];
            unint64_t v34 = [v33 _editDistanceFrom:v31];
            unint64_t v35 = [(UITextReplacementGeneratorForCorrections *)self maxEditDistance];

            if (v34 <= v35)
            {
              uint64_t v36 = [(UITextReplacementGenerator *)self replacementWithText:v31];
              [v7 addObject:v36];
            }
          }
          if (v28 == ++v30)
          {
            uint64_t v28 = [v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
            if (v28) {
              goto LABEL_14;
            }
            break;
          }
        }
      }

      id v6 = v39;
    }
  }
}

- (id)replacements
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(UITextReplacementGenerator *)self stringToReplace];
  uint64_t v4 = [v3 length];

  if (!v4) {
    goto LABEL_7;
  }
  id v5 = [(UITextReplacementGenerator *)self replacementRange];

  if (!v5) {
    goto LABEL_46;
  }
  id v6 = +[UIKeyboardImpl activeInstance];
  int v7 = [v6 autocorrectSpellingEnabled];

  if (!v7)
  {
LABEL_7:
    id v5 = 0;
    goto LABEL_46;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v8 = [(UITextReplacementGenerator *)self stringToReplace];
  unint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v10 = [v8 rangeOfCharacterFromSet:v9 options:2];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL
    && [(UITextReplacementGeneratorForCorrections *)self isStringMisspelled:v8])
  {
    char v11 = 1;
    goto LABEL_35;
  }
  if ([(UITextReplacementGeneratorForCorrections *)self forceSpellingGuesses])
  {
    uint64_t v12 = +[UIKeyboardImpl activeInstance];
    uint64_t v13 = [v12 generateAutocorrectionListForSelectedText];

    uint64_t v14 = [v13 autocorrection];
    BOOL v15 = [v14 candidate];

    if ([v15 _containsEmoji])
    {
      id v16 = +[UIKeyboardEmojiPreferences sharedInstance];
      uint64_t v17 = +[UIKeyboardInputModeController sharedInputModeController];
      uint64_t v18 = [v17 currentInputMode];
      uint64_t v19 = [v18 primaryLanguage];
      uint64_t v20 = [v16 typingNameForEmoji:v15 language:v19];

      if ([v20 length])
      {
        uint64_t v21 = [(UITextReplacementGenerator *)self replacementWithText:v20];
        [v5 addObject:v21];
      }
      goto LABEL_14;
    }
    unint64_t v22 = [v13 emojiList];
    uint64_t v23 = [v22 count];

    if (v23)
    {
      uint64_t v20 = v15;
LABEL_14:
      long long v44 = v20;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v24 = [v13 predictions];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v50;
LABEL_16:
        uint64_t v28 = 0;
        while (1)
        {
          if (*(void *)v50 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = [*(id *)(*((void *)&v49 + 1) + 8 * v28) candidate];
          uint64_t v30 = [(UITextReplacementGenerator *)self replacementWithText:v29];
          [v5 addObject:v30];

          if ((unint64_t)[v5 count] > 1) {
            break;
          }
          if (v26 == ++v28)
          {
            uint64_t v26 = [v24 countByEnumeratingWithState:&v49 objects:v54 count:16];
            if (v26) {
              goto LABEL_16;
            }
            break;
          }
        }
      }

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v31 = [v13 emojiList];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v46;
LABEL_24:
        uint64_t v35 = 0;
        while (1)
        {
          if (*(void *)v46 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = [*(id *)(*((void *)&v45 + 1) + 8 * v35) candidate];
          v37 = [(UITextReplacementGenerator *)self replacementWithText:v36];
          [v5 addObject:v37];

          if ((unint64_t)[v5 count] > 2) {
            break;
          }
          if (v33 == ++v35)
          {
            uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v53 count:16];
            if (v33) {
              goto LABEL_24;
            }
            break;
          }
        }
      }

      id v38 = v5;
      goto LABEL_45;
    }
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (![(UITextReplacementGeneratorForCorrections *)self forceHistoryReplacement]) {
      goto LABEL_39;
    }
    char v11 = 0;
LABEL_35:
    id v39 = [(UITextReplacementGeneratorForCorrections *)self addReplacementRevertingAutocorrectionToReplacements:v5];
    if (v39)
    {
      id v40 = v39;

      BOOL v41 = [(UITextReplacementGeneratorForCorrections *)self isStringMisspelled:v40];
      int v8 = v40;
      if (v41)
      {
LABEL_37:
        [(UITextReplacementGeneratorForCorrections *)self addAutocorrectionGuessesToReplacements:v5];
LABEL_42:
        [(UITextReplacementGeneratorForCorrections *)self addSpellingGuessesForString:v8 ToReplacements:v5];
        if (!self->_showRevertingAutocorrectionInPredictionView) {
          [(UITextReplacementGenerator *)self addPlaceholderForEmptyReplacements:v5];
        }
        goto LABEL_44;
      }
    }
    else
    {
      [(UITextReplacementGeneratorForCorrections *)self addPreviouslySuggestedAutocorrectionToReplacements:v5];
      if (v11) {
        goto LABEL_37;
      }
    }
LABEL_39:
    if ([(UITextReplacementGeneratorForCorrections *)self forceAutocorrectionGuesses]) {
      [(UITextReplacementGeneratorForCorrections *)self addAutocorrectionGuessesToReplacements:v5];
    }
    if (![(UITextReplacementGeneratorForCorrections *)self forceSpellingGuesses]) {
      goto LABEL_44;
    }
    goto LABEL_42;
  }
LABEL_44:
  id v42 = v5;
LABEL_45:

LABEL_46:
  return v5;
}

- (UITextChecker)textChecker
{
  return self->_textChecker;
}

- (void)setTextChecker:(id)a3
{
}

- (TIKeyboardCandidate)autocorrectionRecord
{
  return self->_autocorrectionRecord;
}

- (void)setAutocorrectionRecord:(id)a3
{
}

- (BOOL)forceHistoryReplacement
{
  return self->_forceHistoryReplacement;
}

- (void)setForceHistoryReplacement:(BOOL)a3
{
  self->_forceHistoryReplacement = a3;
}

- (unint64_t)maxEditDistance
{
  return self->_maxEditDistance;
}

- (void)setMaxEditDistance:(unint64_t)a3
{
  self->_maxEditDistance = a3;
}

- (unint64_t)maxCountAfterAutocorrectionGuesses
{
  return self->_maxCountAfterAutocorrectionGuesses;
}

- (void)setMaxCountAfterAutocorrectionGuesses:(unint64_t)a3
{
  self->_maxCountAfterAutocorrectionGuesses = a3;
}

- (BOOL)forceAutocorrectionGuesses
{
  return self->_forceAutocorrectionGuesses;
}

- (void)setForceAutocorrectionGuesses:(BOOL)a3
{
  self->_forceAutocorrectionGuesses = a3;
}

- (unint64_t)maxCountAfterSpellingGuesses
{
  return self->_maxCountAfterSpellingGuesses;
}

- (void)setMaxCountAfterSpellingGuesses:(unint64_t)a3
{
  self->_maxCountAfterSpellingGuesses = a3;
}

- (BOOL)forceSpellingGuesses
{
  return self->_forceSpellingGuesses;
}

- (void)setForceSpellingGuesses:(BOOL)a3
{
  self->_forceSpellingGuesses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocorrectionRecord, 0);
  objc_storeStrong((id *)&self->_textChecker, 0);
}

@end