@interface UITextCheckingController
- (BOOL)continuousSpellCheckingEnabled;
- (BOOL)foundApostropheAfterRange:(_NSRange)a3;
- (BOOL)performFinalGrammarChecking;
- (BOOL)performFinalGrammarCheckingWithAutocorrection:(BOOL)a3;
- (BOOL)rangeIsSuitableForGrammarAutocorrections:(id)a3;
- (UITextCheckingClient)client;
- (UITextCheckingController)initWithClient:(id)a3;
- (_NSRange)nsRangeForTextRange:(id)a3;
- (_NSRange)selectedRange;
- (_NSRange)terminatedSentenceRangeInTextRange:(id)a3;
- (id)annotatedStringWithValidAnnotationsForAnnotatedString:(id)a3;
- (id)annotatedSubstringForRange:(id)a3;
- (id)textChecker;
- (id)validAnnotations;
- (void)_addCorrectionUnderlinesForCandidates:(id)a3 ranges:(id)a4 inSentenceRange:(id)a5;
- (void)_addGrammarAttributesForRange:(_NSRange)a3 details:(id)a4 inAnnotatedString:(id)a5;
- (void)_handleGrammarCheckingResults:(id)a3 sequenceNumber:(int64_t)a4 forSentenceRange:(id)a5 autocorrectionCount:(unint64_t *)a6;
- (void)_pauseTimer:(id)a3;
- (void)applyGrammarCheckingIndication;
- (void)checkGrammarForSentenceInRange:(id)a3 onPause:(BOOL)a4;
- (void)checkSpellingForSelectionChangeFromRange:(_NSRange)a3;
- (void)checkSpellingForWordInRange:(id)a3;
- (void)dealloc;
- (void)didChangeSelectionFromRange:(id)a3;
- (void)feedbackForGrammarMarkersFromWordsInRange:(id)a3 replacementText:(id)a4;
- (void)invalidate;
- (void)invalidateTimers;
- (void)preheatTextChecker;
- (void)removeGrammarAnnotationFromWordAtPosition:(id)a3;
- (void)removeGrammarMarkersFromWordsInRange:(id)a3;
- (void)removeSpellingMarkersFromWordInRange:(id)a3;
- (void)willReplaceTextInRange:(id)a3 withText:(id)a4;
@end

@implementation UITextCheckingController

- (UITextCheckingController)initWithClient:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)UITextCheckingController;
    v6 = [(UITextCheckingController *)&v15 init];
    self = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_client, a3);
      v7 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v7 timeIntervalSinceReferenceDate];
      self->_lastPauseTimer = v8;

      self->_selectedRangeFromPreviousUnchecked = (_NSRange)xmmword_186B93450;
      self->_previousCheckedSentenceRange = (_NSRange)xmmword_186B93450;
      self->_previousCheckedSelectedRange.length = 0;
      self->_prechangeCheckingSequenceNumber = 0;
      self->_previousCheckedSelectedRange.location = 0x7FFFFFFFFFFFFFFFLL;
      *(unsigned char *)&self->_tccClientFlags = *(unsigned char *)&self->_tccClientFlags & 0xFE | objc_opt_respondsToSelector() & 1;
      if (objc_opt_respondsToSelector()) {
        char v9 = 2;
      }
      else {
        char v9 = 0;
      }
      *(unsigned char *)&self->_tccClientFlags = *(unsigned char *)&self->_tccClientFlags & 0xFD | v9;
      if (objc_opt_respondsToSelector()) {
        char v10 = 4;
      }
      else {
        char v10 = 0;
      }
      *(unsigned char *)&self->_tccClientFlags = *(unsigned char *)&self->_tccClientFlags & 0xFB | v10;
      if (objc_opt_respondsToSelector()) {
        char v11 = 8;
      }
      else {
        char v11 = 0;
      }
      *(unsigned char *)&self->_tccClientFlags = *(unsigned char *)&self->_tccClientFlags & 0xF7 | v11;
      if (objc_opt_respondsToSelector()) {
        char v12 = 16;
      }
      else {
        char v12 = 0;
      }
      *(unsigned char *)&self->_tccClientFlags = *(unsigned char *)&self->_tccClientFlags & 0xEF | v12;
      if (objc_opt_respondsToSelector()) {
        char v13 = 32;
      }
      else {
        char v13 = 0;
      }
      *(unsigned char *)&self->_tccClientFlags = *(unsigned char *)&self->_tccClientFlags & 0xDF | v13;
    }
  }

  return self;
}

- (void)invalidate
{
  [(UITextCheckingController *)self invalidateTimers];
  client = self->_client;
  self->_client = 0;

  textChecker = self->_textChecker;
  self->_textChecker = 0;
}

- (void)invalidateTimers
{
  pauseTimer = self->_pauseTimer;
  if (pauseTimer)
  {
    [(NSTimer *)pauseTimer invalidate];
    v4 = self->_pauseTimer;
    self->_pauseTimer = 0;
  }
}

- (void)dealloc
{
  [(UITextCheckingController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UITextCheckingController;
  [(UITextCheckingController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseTimer, 0);
  objc_storeStrong((id *)&self->_textChecker, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (UITextCheckingClient)client
{
  return self->_client;
}

- (BOOL)continuousSpellCheckingEnabled
{
  client = self->_client;
  if (client && (*(unsigned char *)&self->_tccClientFlags & 0x20) != 0) {
    return [(UITextCheckingClient *)client continuousSpellCheckingEnabled];
  }
  else {
    return 0;
  }
}

- (id)validAnnotations
{
  if (qword_1EB25D650 != -1) {
    dispatch_once(&qword_1EB25D650, &__block_literal_global_374);
  }
  v2 = (void *)qword_1EB25D648;
  return v2;
}

void __44__UITextCheckingController_validAnnotations__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", *(void *)off_1E52D1F38, @"NSDominantLanguageAttributeName", @"NSDominantScriptAttributeName", @"NSGrammarCorrections", *(void *)off_1E52D2060, *(void *)off_1E52D2068, @"NSGrammarUserDescription", @"NSGrammarConfidenceScore", @"NSGrammarIssueType", @"NSGrammarLanguage", @"NSGrammarTargetPair", @"NSGrammarAutocorrected", *(void *)off_1E52D2088, *(void *)off_1E52D21A8, *(void *)off_1E52D2228, *(void *)off_1E52D2240, *(void *)off_1E52D2280,
         *(void *)off_1E52D2288,
         *(void *)off_1E52D2290,
         *(void *)off_1E52D22A0,
         *(void *)off_1E52D22B0,
         *(void *)off_1E52D22B8,
         *(void *)off_1E52D2340,
         0);
  v1 = (void *)qword_1EB25D648;
  qword_1EB25D648 = v0;
}

- (id)textChecker
{
  textChecker = self->_textChecker;
  if (!textChecker)
  {
    v4 = [[UITextChecker alloc] _initWithAsynchronousLoading:1];
    id v5 = self->_textChecker;
    self->_textChecker = v4;

    textChecker = self->_textChecker;
  }
  if ([(UITextChecker *)textChecker _doneLoading]) {
    v6 = self->_textChecker;
  }
  else {
    v6 = 0;
  }
  return v6;
}

- (void)preheatTextChecker
{
  if (!self->_textChecker)
  {
    objc_super v3 = [[UITextChecker alloc] _initWithAsynchronousLoading:1];
    textChecker = self->_textChecker;
    self->_textChecker = v3;
  }
}

- (_NSRange)nsRangeForTextRange:(id)a3
{
  uint64_t v3 = 0;
  uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    client = self->_client;
    if (client)
    {
      id v7 = a3;
      double v8 = [(UITextCheckingClient *)client beginningOfDocument];
      char v9 = [v7 start];
      uint64_t v4 = [(UITextCheckingClient *)client offsetFromPosition:v8 toPosition:v9];

      char v10 = self->_client;
      char v11 = [v7 start];
      char v12 = [v7 end];

      uint64_t v3 = [(UITextCheckingClient *)v10 offsetFromPosition:v11 toPosition:v12];
    }
  }
  NSUInteger v13 = v4;
  NSUInteger v14 = v3;
  result.length = v14;
  result.location = v13;
  return result;
}

- (_NSRange)selectedRange
{
  client = self->_client;
  if (client)
  {
    uint64_t v4 = [(UITextCheckingClient *)client selectedTextRange];
    uint64_t v5 = [(UITextCheckingController *)self nsRangeForTextRange:v4];
    NSUInteger v7 = v6;

    NSUInteger v8 = v5;
    NSUInteger v9 = v7;
  }
  else
  {
    NSUInteger v8 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v9 = 0;
  }
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)annotatedStringWithValidAnnotationsForAnnotatedString:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 length])
  {
    NSUInteger v6 = [(UITextCheckingController *)self validAnnotations];
    NSUInteger v7 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v8 = [v5 length];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __82__UITextCheckingController_annotatedStringWithValidAnnotationsForAnnotatedString___block_invoke;
    v23[3] = &unk_1E530B7B8;
    id v9 = v6;
    id v24 = v9;
    id v10 = v7;
    id v25 = v10;
    objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0x100000, v23);
    if ([v10 count])
    {
      char v11 = (void *)[v5 mutableCopy];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v26 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(v11, "removeAttribute:range:", *(void *)(*((void *)&v19 + 1) + 8 * i), 0, objc_msgSend(v11, "length", (void)v19));
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v26 count:16];
        }
        while (v14);
      }
    }
    else
    {
      char v11 = v5;
    }
    id v17 = v11;
  }
  else
  {
    id v17 = v5;
  }

  return v17;
}

void __82__UITextCheckingController_annotatedStringWithValidAnnotationsForAnnotatedString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        if (([*(id *)(a1 + 32) containsObject:v8] & 1) == 0
          && ([*(id *)(a1 + 40) containsObject:v8] & 1) == 0)
        {
          [*(id *)(a1 + 40) addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)annotatedSubstringForRange:(id)a3
{
  id v3 = 0;
  if (a3 && self->_client)
  {
    id v5 = a3;
    uint64_t v6 = [v5 start];
    NSUInteger v7 = [v5 end];

    uint64_t v8 = [(UITextCheckingClient *)self->_client endOfDocument];
    long long v9 = (void *)v8;
    id v3 = 0;
    if (v6 && v7 && v8)
    {
      if ([(UITextCheckingClient *)self->_client comparePosition:v6 toPosition:v8] == -1)
      {
        if ([(UITextCheckingClient *)self->_client comparePosition:v7 toPosition:v9] == 1)
        {
          id v10 = v9;

          NSUInteger v7 = v10;
        }
        long long v11 = [(UITextCheckingClient *)self->_client textRangeFromPosition:v6 toPosition:v7];
        if (v11)
        {
          long long v12 = [(UITextCheckingClient *)self->_client annotatedSubstringForRange:v11];
        }
        else
        {
          long long v12 = 0;
        }
        id v3 = [(UITextCheckingController *)self annotatedStringWithValidAnnotationsForAnnotatedString:v12];
      }
      else
      {
        id v3 = 0;
      }
    }
  }
  return v3;
}

- (void)checkSpellingForWordInRange:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(UITextCheckingController *)self textChecker];
  if (v14)
  {
    client = self->_client;
    if (client && v4 != 0)
    {
      NSUInteger v7 = [(UITextCheckingClient *)client textInRange:v14];
      uint64_t v8 = [v7 length];
      long long v9 = +[UITextChecker keyboardLanguages];
      uint64_t v10 = objc_msgSend(v4, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", v7, 0, v8, 0, 0, v9);

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [(UITextCheckingClient *)self->_client removeAnnotation:*(void *)off_1E52D2290 forRange:v14];
      }
      else
      {
        long long v11 = [(UITextCheckingController *)self annotatedSubstringForRange:v14];
        long long v12 = v11;
        if (v11 && [v11 length])
        {
          uint64_t v13 = (void *)[v12 mutableCopy];
          objc_msgSend(v13, "addAttribute:value:range:", *(void *)off_1E52D2290, &unk_1ED3F6F78, 0, objc_msgSend(v13, "length"));
          -[UITextCheckingClient replaceRange:withAnnotatedString:relativeReplacementRange:](self->_client, "replaceRange:withAnnotatedString:relativeReplacementRange:", v14, v13, 0x7FFFFFFFFFFFFFFFLL, 0);
        }
      }
    }
  }
}

- (void)_addGrammarAttributesForRange:(_NSRange)a3 details:(id)a4 inAnnotatedString:(id)a5
{
  NSUInteger location = a3.location;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  unint64_t v31 = [v7 length];
  uint64_t v8 = +[UITextChecker keyboardLanguages];
  v36 = [v8 firstObject];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v43 = 0;
    uint64_t v39 = 0;
    long long v12 = 0;
    uint64_t v13 = *(void *)v45;
    uint64_t v33 = *(void *)off_1E52D2288;
    uint64_t v34 = *(void *)off_1E52D2290;
    uint64_t v42 = *(void *)v45;
    id v35 = v9;
    while (1)
    {
      uint64_t v14 = 0;
      uint64_t v37 = v11;
      do
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v44 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector())
        {
          v16 = [v15 objectForKey:@"NSGrammarCorrections"];
          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v17 = v16;
              v16 = 0;
              goto LABEL_52;
            }
            if ([v16 count])
            {
              id v17 = [v15 objectForKey:@"NSGrammarUserDescription"];
              if (v17)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  id v17 = 0;
                }
              }
              v18 = [v15 objectForKey:@"NSGrammarIssueType"];
              if (v18)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v18 = 0;
                }
              }
              v41 = v18;
              uint64_t v19 = [v15 objectForKey:@"NSGrammarTargetPair"];
              if (v19)
              {
                long long v20 = (void *)v19;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v40 = v20;
LABEL_22:
                  long long v21 = [v15 objectForKey:@"NSGrammarConfidenceScore"];
                  if (v21)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {

                      long long v21 = 0;
                    }
                  }
                  long long v22 = [v15 objectForKey:@"NSGrammarRange"];

                  if (v22)
                  {
                    unint64_t v23 = v43;
                    if (objc_opt_respondsToSelector())
                    {
                      uint64_t v24 = [v22 rangeValue];
                      if (v31 < v24 + location)
                      {
                        unint64_t v43 = 0;
                        uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
                        goto LABEL_51;
                      }
                      uint64_t v39 = v24 + location;
                      if (v24 + location + v25 <= v31) {
                        unint64_t v23 = v25;
                      }
                      else {
                        unint64_t v23 = v31 - (v24 + location);
                      }
                      if (!v23)
                      {
LABEL_50:
                        unint64_t v43 = 0;
                        goto LABEL_51;
                      }
LABEL_31:
                      v38 = v22;
                      id v26 = objc_alloc((Class)off_1E52D2EA8);
                      [v7 string];
                      v28 = uint64_t v27 = v7;
                      objc_msgSend(v28, "substringWithRange:", v39, v23);
                      v29 = unint64_t v43 = v23;
                      v30 = (void *)[v26 initWithPrimaryString:v29 alternativeStrings:v16];

                      id v7 = v27;
                      objc_msgSend(v27, "addAttribute:value:range:", @"NSGrammarCorrections", v16, v39, v43);
                      if (v17) {
                        objc_msgSend(v27, "addAttribute:value:range:", @"NSGrammarUserDescription", v17, v39, v43);
                      }
                      if (v41) {
                        objc_msgSend(v27, "addAttribute:value:range:", @"NSGrammarIssueType", v41, v39, v43);
                      }
                      uint64_t v11 = v37;
                      long long v22 = v38;
                      if (v40) {
                        objc_msgSend(v7, "addAttribute:value:range:", @"NSGrammarTargetPair", v40, v39, v43);
                      }
                      if (v21) {
                        objc_msgSend(v7, "addAttribute:value:range:", @"NSGrammarConfidenceScore", v21, v39, v43);
                      }
                      if (v36) {
                        objc_msgSend(v7, "addAttribute:value:range:", @"NSGrammarLanguage", v36, v39, v43);
                      }
                      if (qword_1EB25D6A8 != -1) {
                        dispatch_once(&qword_1EB25D6A8, &__block_literal_global_531);
                      }
                      if (byte_1EB25D5EB)
                      {
                        objc_msgSend(v7, "addAttribute:value:range:", v34, &unk_1ED3F6F90, v39, v43);
                        long long v22 = v38;
                        objc_msgSend(v7, "addAttribute:value:range:", v33, v30, v39, v43);
                      }

                      id v9 = v35;
LABEL_51:

                      long long v12 = v22;
LABEL_52:

                      uint64_t v13 = v42;
                      goto LABEL_53;
                    }
                  }
                  else
                  {
                    unint64_t v23 = v43;
                  }
                  if (!v23) {
                    goto LABEL_50;
                  }
                  goto LABEL_31;
                }
              }
              v40 = 0;
              goto LABEL_22;
            }
          }
LABEL_53:
        }
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (!v11) {
        goto LABEL_58;
      }
    }
  }
  long long v12 = 0;
LABEL_58:
}

- (void)_addCorrectionUnderlinesForCandidates:(id)a3 ranges:(id)a4 inSentenceRange:(id)a5
{
  id v37 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[UIKeyboardImpl activeInstance];
  uint64_t v11 = [v10 _textChoicesAssistant];

  if (self->_client
    && v11
    && +[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
  {
    uint64_t v34 = v11;
    if (+[UIKeyboard usesInputSystemUI])
    {
      uint64_t v33 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    else
    {
      uint64_t v33 = 0;
    }
    id v32 = v8;
    if ([v37 count])
    {
      unint64_t v12 = 0;
      id v35 = v9;
      do
      {
        if (v12 >= [v8 count]) {
          break;
        }
        uint64_t v13 = [v8 objectAtIndex:v12];
        uint64_t v14 = [v13 rangeValue];
        uint64_t v16 = v15;

        client = self->_client;
        v18 = [v9 start];
        uint64_t v19 = [(UITextCheckingClient *)client positionFromPosition:v18 offset:v14];

        if (v19)
        {
          long long v20 = [(UITextCheckingClient *)self->_client positionFromPosition:v19 offset:v16];
          if (v20)
          {
            uint64_t v21 = [(UITextCheckingClient *)self->_client textRangeFromPosition:v19 toPosition:v20];
            if (v21)
            {
              long long v22 = (void *)v21;
              unint64_t v23 = [v37 objectAtIndex:v12];
              if (objc_opt_respondsToSelector()) {
                [v23 setConfidence:2];
              }
              id v24 = objc_alloc(MEMORY[0x1E4FAE2A0]);
              v36 = (void *)[v24 initWithAutocorrection:v23 alternateCorrections:MEMORY[0x1E4F1CBF0]];
              unint64_t v25 = objc_msgSend(MEMORY[0x1E4FAE278], "listWithCorrections:");
              id v26 = [v23 input];
              objc_msgSend(v34, "adjustRangesAfterPosition:byOffset:", v19, v16 - objc_msgSend(v26, "length"));

              [v34 addUnderlineForCandidate:v23 range:v22];
              [v34 addList:v25 forCandidate:v23];
              if (v33)
              {
                uint64_t v27 = [v23 candidate];
                v28 = [v23 input];
                [v33 setObject:v27 forKey:v28];
              }
              id v8 = v32;
            }
            id v9 = v35;
          }
        }
        else
        {
          long long v20 = 0;
        }

        ++v12;
      }
      while (v12 < [v37 count]);
    }
    if ([v37 count])
    {
      uint64_t v29 = [v37 copy];
      v30 = (void *)_recentGrammarCandidates;
      _recentGrammarCandidates = v29;
    }
    uint64_t v11 = v34;
    if (v33 && [v33 count])
    {
      unint64_t v31 = +[UIKeyboardImpl activeInstance];
      [v31 handleGrammarCorrectionEntries:v33];

      id v8 = v32;
    }
  }
}

- (void)_handleGrammarCheckingResults:(id)a3 sequenceNumber:(int64_t)a4 forSentenceRange:(id)a5 autocorrectionCount:(unint64_t *)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v58 = [MEMORY[0x1E4F1CA48] array];
  v57 = [MEMORY[0x1E4F1CA48] array];
  v59 = [(UITextCheckingController *)self textChecker];
  if (self->_prechangeCheckingSequenceNumber <= a4)
  {
    unint64_t v12 = [(UITextCheckingController *)self annotatedSubstringForRange:v11];
    uint64_t v13 = v12;
    if (v12 && [v12 length])
    {
      v69 = self;
      id v53 = v11;
      v51 = v13;
      v70 = (void *)[v13 mutableCopy];
      uint64_t v14 = +[UIKeyboardImpl activeInstance];
      uint64_t v62 = [v14 autocorrectionPreferenceForTraits];
      v50 = v14;
      uint64_t v15 = [v14 smartPunctuationController];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v54 = v10;
      id v16 = v10;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v76 objects:v81 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v77;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v77 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            if ([v21 resultType] == 4)
            {
              uint64_t v22 = [v21 range];
              uint64_t v24 = v23;
              unint64_t v25 = [v21 grammarDetails];
              id v26 = _detailsByApplyingSmartQuotes((uint64_t)v25, v15);
              -[UITextCheckingController _addGrammarAttributesForRange:details:inAnnotatedString:](v69, "_addGrammarAttributesForRange:details:inAnnotatedString:", v22, v24, v26, v70);
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v76 objects:v81 count:16];
        }
        while (v18);
      }
      v52 = a6;

      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v27 = v16;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v72 objects:v80 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        NSUInteger length = 0;
        unint64_t v64 = 0;
        uint64_t v65 = 0;
        unint64_t v67 = 0;
        uint64_t v68 = 0;
        uint64_t v71 = *(void *)v73;
        uint64_t v56 = *(void *)off_1E52D2290;
        uint64_t v55 = *(void *)off_1E52D2288;
        NSUInteger range1 = 0x7FFFFFFFFFFFFFFFLL;
        id range1_8 = v27;
        uint64_t v30 = v62;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v73 != v71) {
              objc_enumerationMutation(v27);
            }
            id v32 = *(void **)(*((void *)&v72 + 1) + 8 * j);
            unint64_t v33 = [v32 range];
            uint64_t v35 = v34;
            v36 = [v32 replacementString];
            id v37 = _stringByApplyingSmartQuotes(v36, v15);

            uint64_t v38 = [v37 length];
            if (v30)
            {
              uint64_t v39 = v38;
              BOOL v40 = [v32 resultType] != 512 || v37 == 0;
              if (!v40 && ((v68 & 0x8000000000000000) == 0 || v33 >= -v68))
              {
                ++v67;
                unint64_t v41 = v33 + v68;
                if (v41 >= v64 + v65)
                {
                  if (v41 + v35 <= [v70 length])
                  {
                    objc_msgSend(v59, "recordResponse:toGrammarDetailInAnnotatedString:range:", 4, v70, v41, v35);
                    uint64_t v42 = [v70 string];
                    uint64_t v66 = objc_msgSend(v42, "substringWithRange:", v41, v35);

                    objc_msgSend(v70, "replaceCharactersInRange:withString:", v41, v35, v37);
                    v44.NSUInteger location = [v32 range];
                    NSRange v43 = v44;
                    v44.NSUInteger length = length;
                    if (length)
                    {
                      v44.NSUInteger location = range1;
                      NSRange v45 = NSUnionRange(v44, v43);
                      NSUInteger range1 = v45.location;
                      NSUInteger length = v45.length;
                    }
                    else
                    {
                      NSUInteger range1 = v44.location;
                      NSUInteger length = v43.length;
                    }
                    uint64_t v46 = v68;
                    id v27 = range1_8;
                    long long v47 = (void *)v66;
                    if (v39)
                    {
                      if (v66) {
                        objc_msgSend(v70, "addAttribute:value:range:", @"NSGrammarAutocorrected", v66, v41, v39);
                      }
                      objc_msgSend(v70, "removeAttribute:range:", v56, v41, v39);
                      objc_msgSend(v70, "removeAttribute:range:", @"NSGrammarUserDescription", v41, v39);
                      objc_msgSend(v70, "removeAttribute:range:", v55, v41, v39);
                      v48 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v41, v39);
                      [v58 addObject:v48];

                      uint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4FAE318]) initWithCandidate:v37 forInput:v66];
                      [v57 addObject:v49];

                      long long v47 = (void *)v66;
                      uint64_t v46 = v68;
                    }
                    uint64_t v68 = v46 - v35 + v39;

                    unint64_t v64 = v41;
                    uint64_t v65 = v39;
                    uint64_t v30 = v62;
                  }
                  else
                  {
                    id v27 = range1_8;
                    uint64_t v30 = v62;
                  }
                }
              }
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v72 objects:v80 count:16];
        }
        while (v29);
      }
      else
      {
        NSUInteger length = 0;
        unint64_t v67 = 0;
        NSUInteger range1 = 0x7FFFFFFFFFFFFFFFLL;
      }

      id v11 = v53;
      -[UITextCheckingClient replaceRange:withAnnotatedString:relativeReplacementRange:](v69->_client, "replaceRange:withAnnotatedString:relativeReplacementRange:", v53, v70, range1, length);
      uint64_t v13 = v51;
      if (v52) {
        unint64_t *v52 = v67;
      }
      [(UITextCheckingController *)v69 _addCorrectionUnderlinesForCandidates:v57 ranges:v58 inSentenceRange:v53];

      id v10 = v54;
    }
    else if (a6)
    {
      *a6 = 0;
    }
  }
  else if (a6)
  {
    *a6 = 0;
  }
}

- (void)checkGrammarForSentenceInRange:(id)a3 onPause:(BOOL)a4
{
  BOOL v4 = a4;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(UITextCheckingController *)self textChecker];
  id v8 = (void *)v7;
  if (v6)
  {
    if (self->_client && v7 != 0)
    {
      id v10 = +[UITextChecker keyboardLanguages];
      id v11 = [v10 firstObject];

      if (+[UITextChecker grammarCheckingEnabledForLanguage:v11])
      {
        unint64_t v12 = [(UITextCheckingClient *)self->_client textInRange:v6];
        uint64_t v13 = v12;
        if (v12 && [v12 length])
        {
          uint64_t v14 = self;
          if (v4)
          {
            uint64_t v23 = @"IgnoreTermination";
            uint64_t v15 = [NSNumber numberWithInteger:2];
            v24[0] = v15;
            id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
          }
          else
          {
            id v16 = (void *)MEMORY[0x1E4F1CC08];
          }
          uint64_t v17 = [v13 length];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __67__UITextCheckingController_checkGrammarForSentenceInRange_onPause___block_invoke;
          v19[3] = &unk_1E530C390;
          BOOL v22 = v4;
          long long v20 = v14;
          id v21 = v6;
          uint64_t v18 = v14;
          objc_msgSend(v8, "requestGrammarCheckingOfString:range:language:options:completionHandler:", v13, 0, v17, v11, v16, v19);
        }
      }
    }
  }
}

void __67__UITextCheckingController_checkGrammarForSentenceInRange_onPause___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  Main = CFRunLoopGetMain();
  uint64_t v7 = (const void *)*MEMORY[0x1E4F1D410];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__UITextCheckingController_checkGrammarForSentenceInRange_onPause___block_invoke_2;
  block[3] = &unk_1E52E7F00;
  id v10 = v5;
  char v14 = *(unsigned char *)(a1 + 48);
  id v11 = *(id *)(a1 + 32);
  uint64_t v13 = a2;
  id v12 = *(id *)(a1 + 40);
  id v8 = v5;
  CFRunLoopPerformBlock(Main, v7, block);
}

void __67__UITextCheckingController_checkGrammarForSentenceInRange_onPause___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x18C108260]();
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "resultType", (void)v11);
        if (v10 == 4 || v10 == 512 && !*(unsigned char *)(a1 + 64)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 40) _handleGrammarCheckingResults:v3 sequenceNumber:*(void *)(a1 + 56) forSentenceRange:*(void *)(a1 + 48) autocorrectionCount:0];
}

- (void)removeGrammarMarkersFromWordsInRange:(id)a3
{
  id v4 = a3;
  if (v4 && self->_client)
  {
    if (qword_1EB25D6A8 != -1) {
      dispatch_once(&qword_1EB25D6A8, &__block_literal_global_531);
    }
    if (byte_1EB25D5EB)
    {
      uint64_t v5 = [(UITextCheckingController *)self annotatedSubstringForRange:v4];
      uint64_t v6 = [v5 length];
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      if (v6)
      {
        unint64_t v7 = v6;
        uint64_t v8 = 0;
        uint64_t v9 = *(void *)off_1E52D2290;
        do
        {
          uint64_t v10 = objc_msgSend(v5, "attribute:atIndex:longestEffectiveRange:inRange:", v9, v8, &v19, v8, v7 - v8);
          long long v11 = v10;
          if (v10 && [v10 integerValue] == 1)
          {
            long long v12 = [v5 attribute:@"NSGrammarCorrections" atIndex:v19 effectiveRange:0];
            if (v12)
            {
              client = self->_client;
              long long v14 = [v4 start];
              uint64_t v15 = [(UITextCheckingClient *)client positionFromPosition:v14 offset:v19];

              if (v15)
              {
                uint64_t v16 = [(UITextCheckingClient *)self->_client positionFromPosition:v15 offset:v20];
                if (v16)
                {
                  uint64_t v17 = [(UITextCheckingClient *)self->_client textRangeFromPosition:v15 toPosition:v16];
                  if (v17)
                  {
                    uint64_t v18 = (void *)v17;
                    [(UITextCheckingClient *)self->_client removeAnnotation:v9 forRange:v17];
                    [(UITextCheckingClient *)self->_client removeAnnotation:@"NSGrammarCorrections" forRange:v18];
                    [(UITextCheckingClient *)self->_client removeAnnotation:@"NSGrammarUserDescription" forRange:v18];
                    [(UITextCheckingClient *)self->_client removeAnnotation:@"NSGrammarIssueType" forRange:v18];
                    [(UITextCheckingClient *)self->_client removeAnnotation:@"NSGrammarTargetPair" forRange:v18];
                    [(UITextCheckingClient *)self->_client removeAnnotation:@"NSGrammarLanguage" forRange:v18];
                  }
                }
              }
              else
              {
                uint64_t v16 = 0;
              }
            }
          }

          uint64_t v8 = v20 + v19;
        }
        while (v20 + v19 < v7);
      }
    }
  }
}

- (void)removeGrammarAnnotationFromWordAtPosition:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    client = self->_client;
    if (client)
    {
      uint64_t v5 = [(UITextCheckingClient *)client tokenizer];
      uint64_t v6 = [v5 rangeEnclosingPosition:v8 withGranularity:1 inDirection:0];

      if (v6
        || ([(UITextCheckingClient *)self->_client tokenizer],
            unint64_t v7 = objc_claimAutoreleasedReturnValue(),
            [v7 rangeEnclosingPosition:v8 withGranularity:1 inDirection:1],
            uint64_t v6 = objc_claimAutoreleasedReturnValue(),
            v7,
            v6))
      {
        [(UITextCheckingClient *)self->_client removeAnnotation:@"NSGrammarAutocorrected" forRange:v6];
        [(UITextCheckingClient *)self->_client removeAnnotation:@"NSGrammarCorrections" forRange:v6];
        [(UITextCheckingClient *)self->_client removeAnnotation:@"NSGrammarUserDescription" forRange:v6];
        [(UITextCheckingClient *)self->_client removeAnnotation:@"NSGrammarIssueType" forRange:v6];
        [(UITextCheckingClient *)self->_client removeAnnotation:@"NSGrammarTargetPair" forRange:v6];
        [(UITextCheckingClient *)self->_client removeAnnotation:@"NSGrammarLanguage" forRange:v6];
      }
    }
  }
}

- (BOOL)performFinalGrammarCheckingWithAutocorrection:(BOOL)a3
{
  BOOL v3 = a3;
  v35[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(UITextCheckingController *)self textChecker];
  if (v5 && self->_client)
  {
    uint64_t v6 = +[UITextChecker keyboardLanguages];
    unint64_t v7 = [v6 firstObject];

    if (+[UITextChecker grammarCheckingEnabledForLanguage:v7])
    {
      id v8 = [(UITextCheckingClient *)self->_client tokenizer];
      uint64_t v9 = [(UITextCheckingClient *)self->_client endOfDocument];
      uint64_t v10 = [v8 rangeEnclosingPosition:v9 withGranularity:2 inDirection:1];

      if (v10)
      {
        long long v11 = [(UITextCheckingClient *)self->_client textInRange:v10];
        long long v12 = v11;
        if (v11 && [v11 length])
        {
          long long v13 = [MEMORY[0x1E4F1CA48] array];
          id v27 = v10;
          if (v3)
          {
            uint64_t v34 = @"ControlRepeatedAutocorrections";
            v35[0] = MEMORY[0x1E4F1CC28];
            uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
          }
          else
          {
            uint64_t v14 = MEMORY[0x1E4F1CC08];
          }
          unint64_t v25 = (void *)v14;
          id v26 = v12;
          uint64_t v16 = objc_msgSend(v5, "finalResultsFromCheckingString:range:language:options:", v12, 0, objc_msgSend(v12, "length"), v7, v14);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v30;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v30 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                uint64_t v22 = [v21 resultType];
                if (v22 != 4 && (v22 != 512 || !v3)) {
                  continue;
                }
                [v13 addObject:v21];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
            }
            while (v18);
          }
          if (v13)
          {
            uint64_t v10 = v27;
            if ([v13 count])
            {
              uint64_t v28 = 0;
              [(UITextCheckingController *)self _handleGrammarCheckingResults:v13 sequenceNumber:self->_prechangeCheckingSequenceNumber forSentenceRange:v27 autocorrectionCount:&v28];
              BOOL v15 = v28 != 0;
            }
            else
            {
              BOOL v15 = 0;
            }
          }
          else
          {
            BOOL v15 = 0;
            uint64_t v10 = v27;
          }
          long long v12 = v26;
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)performFinalGrammarChecking
{
  return [(UITextCheckingController *)self performFinalGrammarCheckingWithAutocorrection:1];
}

- (void)applyGrammarCheckingIndication
{
}

- (void)removeSpellingMarkersFromWordInRange:(id)a3
{
  if (a3)
  {
    client = self->_client;
    if (client) {
      [(UITextCheckingClient *)client removeAnnotation:*(void *)off_1E52D2290 forRange:a3];
    }
  }
}

- (BOOL)foundApostropheAfterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  client = self->_client;
  unint64_t v7 = [(UITextCheckingClient *)client beginningOfDocument];
  id v8 = [(UITextCheckingClient *)client positionFromPosition:v7 offset:location + length];

  if (!v8)
  {
    uint64_t v9 = 0;
LABEL_7:
    char v13 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = [(UITextCheckingClient *)self->_client positionFromPosition:v8 offset:1];
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v10 = [(UITextCheckingClient *)self->_client textRangeFromPosition:v8 toPosition:v9];
  if (!v10) {
    goto LABEL_7;
  }
  long long v11 = (void *)v10;
  long long v12 = [(UITextCheckingClient *)self->_client textInRange:v10];
  if ([v12 isEqualToString:@"'"]) {
    char v13 = 1;
  }
  else {
    char v13 = [v12 isEqualToString:@"’"];
  }

LABEL_10:
  return v13;
}

- (_NSRange)terminatedSentenceRangeInTextRange:(id)a3
{
  BOOL v3 = [(UITextCheckingClient *)self->_client textInRange:a3];
  uint64_t v4 = [v3 length];
  NSUInteger v5 = v4;
  if (qword_1EB25D670 == -1)
  {
    if (!v4)
    {
LABEL_14:
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_15;
    }
  }
  else
  {
    dispatch_once(&qword_1EB25D670, &__block_literal_global_408_1);
    if (!v5) {
      goto LABEL_14;
    }
  }
  uint64_t v6 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", qword_1EB25D658, 4, 0, v5);
  if (!v7
    || (uint64_t v8 = v6 + v7, v9 = v5 > v6 + v7, v10 = v5 - (v6 + v7), !v9)
    || (objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", qword_1EB25D660, 4, v8, v10), !v11))
  {
    NSUInteger v5 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", qword_1EB25D668, 4, v8, v10);
  if (v13) {
    NSUInteger v5 = v12 + v13;
  }
  else {
    NSUInteger v5 = 0;
  }
  if (v13) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_15:

  NSUInteger v15 = v14;
  NSUInteger v16 = v5;
  result.NSUInteger length = v16;
  result.NSUInteger location = v15;
  return result;
}

void __63__UITextCheckingController_terminatedSentenceRangeInTextRange___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  v1 = (void *)qword_1EB25D658;
  qword_1EB25D658 = v0;

  uint64_t v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".!?։۔।።᙮‼‽⁈⁉。！．？｡"];
  BOOL v3 = (void *)qword_1EB25D660;
  qword_1EB25D660 = v2;

  id v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v4 = [v6 invertedSet];
  NSUInteger v5 = (void *)qword_1EB25D668;
  qword_1EB25D668 = v4;
}

- (void)_pauseTimer:(id)a3
{
  id v10 = [a3 userInfo];
  [(UITextCheckingController *)self invalidateTimers];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_lastPauseTimer = v4;
  if (self->_client
    && [(UITextCheckingController *)self continuousSpellCheckingEnabled]
    && v10)
  {
    if (qword_1EB25D6D8 != -1) {
      dispatch_once(&qword_1EB25D6D8, &__block_literal_global_620);
    }
    if (byte_1EB25D5EE == 1)
    {
      NSUInteger v5 = [(UITextCheckingClient *)self->_client tokenizer];
      id v6 = [v10 start];
      uint64_t v7 = [v5 rangeEnclosingPosition:v6 withGranularity:2 inDirection:0];

      if (v7 && [v10 isEqual:v7])
      {
        [(UITextCheckingController *)self removeGrammarMarkersFromWordsInRange:v10];
        [(UITextCheckingController *)self checkGrammarForSentenceInRange:v10 onPause:1];
        uint64_t v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__pauseTimer_ selector:0 userInfo:0 repeats:0.5];
        pauseTimer = self->_pauseTimer;
        self->_pauseTimer = v8;
      }
    }
  }
}

- (void)checkSpellingForSelectionChangeFromRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = self->_previousCheckedSentenceRange.location;
  NSUInteger v7 = self->_previousCheckedSentenceRange.length;
  BOOL v9 = a3.location == self->_selectedRangeFromPreviousUnchecked.location
    && a3.length == self->_selectedRangeFromPreviousUnchecked.length;
  [(UITextCheckingController *)self invalidateTimers];
  self->_selectedRangeFromPreviousUnchecked = (_NSRange)xmmword_186B93450;
  self->_previousCheckedSentenceRange = (_NSRange)xmmword_186B93450;
  if (!self->_client
    || ![(UITextCheckingController *)self continuousSpellCheckingEnabled])
  {
    return;
  }
  NSUInteger v10 = [(UITextCheckingController *)self selectedRange];
  NSUInteger v12 = v10;
  NSUInteger v13 = v11;
  if (v10 == self->_previousCheckedSelectedRange.location && v11 == self->_previousCheckedSelectedRange.length)
  {
    BOOL v54 = 0;
  }
  else
  {
    unint64_t add = atomic_fetch_add(&qword_1EB25D6A0, 1uLL);
    self->_previousCheckedSelectedRange.NSUInteger length = v11;
    self->_prechangeCheckingSequenceNumber = add + 1;
    self->_previousCheckedSelectedRange.NSUInteger location = v10;
    BOOL v54 = v11 == 0;
  }
  NSUInteger v53 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v55 = 0;
  }
  else
  {
    client = self->_client;
    NSUInteger v16 = [(UITextCheckingClient *)client beginningOfDocument];
    uint64_t v17 = [(UITextCheckingClient *)client positionFromPosition:v16 offset:location];

    uint64_t v18 = [(UITextCheckingClient *)self->_client tokenizer];
    id v55 = [v18 rangeEnclosingPosition:v17 withGranularity:1 inDirection:0];

    if (!v55)
    {
      uint64_t v19 = [(UITextCheckingClient *)self->_client tokenizer];
      id v55 = [v19 rangeEnclosingPosition:v17 withGranularity:1 inDirection:1];

      if (!v55)
      {
        char v20 = !v9;
        if (location < 2) {
          char v20 = 1;
        }
        if (v20)
        {
          id v55 = 0;
        }
        else
        {
          uint64_t v21 = [(UITextCheckingClient *)self->_client positionFromPosition:v17 offset:-1];

          uint64_t v22 = [(UITextCheckingClient *)self->_client tokenizer];
          id v55 = [v22 rangeEnclosingPosition:v21 withGranularity:1 inDirection:1];

          uint64_t v17 = (void *)v21;
        }
      }
    }
  }
  uint64_t v23 = self->_client;
  uint64_t v24 = [(UITextCheckingClient *)v23 beginningOfDocument];
  unint64_t v25 = [(UITextCheckingClient *)v23 positionFromPosition:v24 offset:v12];

  id v26 = [(UITextCheckingClient *)self->_client tokenizer];
  id v27 = [v26 rangeEnclosingPosition:v25 withGranularity:1 inDirection:0];

  if (!v27)
  {
    uint64_t v28 = [(UITextCheckingClient *)self->_client tokenizer];
    id v27 = [v28 rangeEnclosingPosition:v25 withGranularity:1 inDirection:1];
  }
  unint64_t v29 = [(UITextCheckingController *)self nsRangeForTextRange:v55];
  uint64_t v31 = v30;
  if (([v55 isEqual:v27] & 1) != 0 || v12 + v13 >= v29 && v12 <= v29 + v31) {
    goto LABEL_33;
  }
  if (v12 == length + location + 1
    && !v13
    && -[UITextCheckingController foundApostropheAfterRange:](self, "foundApostropheAfterRange:", location, length))
  {
    self->_selectedRangeFromPreviousUnchecked.NSUInteger location = v12;
    self->_selectedRangeFromPreviousUnchecked.NSUInteger length = 0;
LABEL_33:
    char v32 = 1;
    goto LABEL_34;
  }
  [(UITextCheckingController *)self checkSpellingForWordInRange:v55];
  [(UITextCheckingController *)self removeSpellingMarkersFromWordInRange:v27];
  char v32 = 0;
LABEL_34:
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v33 = self->_client;
    uint64_t v34 = [(UITextCheckingClient *)v33 beginningOfDocument];
    uint64_t v35 = [(UITextCheckingClient *)v33 positionFromPosition:v34 offset:location];

    v36 = [(UITextCheckingClient *)self->_client tokenizer];
    id v37 = [v36 rangeEnclosingPosition:v35 withGranularity:2 inDirection:0];

    if (v37
      || ([(UITextCheckingClient *)self->_client tokenizer],
          uint64_t v38 = objc_claimAutoreleasedReturnValue(),
          [v38 rangeEnclosingPosition:v35 withGranularity:2 inDirection:1],
          id v37 = objc_claimAutoreleasedReturnValue(),
          v38,
          v37))
    {
      char v51 = v32;
      v52 = v35;
      NSUInteger v39 = v7;
      uint64_t v40 = [(UITextCheckingController *)self nsRangeForTextRange:v37];
      unint64_t v42 = v41;
      uint64_t v43 = [(UITextCheckingController *)self terminatedSentenceRangeInTextRange:v37];
      if (v44)
      {
        NSUInteger v45 = v44;
        NSUInteger v46 = v43 + v40;
        if (v12 + v13 < v46 || v12 >= v46 + v44)
        {
          if (v46 != v53 || v44 != v39)
          {
            [(UITextCheckingController *)self removeGrammarMarkersFromWordsInRange:v37];
            [(UITextCheckingController *)self checkGrammarForSentenceInRange:v37 onPause:0];
          }
          self->_previousCheckedSentenceRange.NSUInteger location = v46;
          self->_previousCheckedSentenceRange.NSUInteger length = v45;
          uint64_t v35 = v52;
          goto LABEL_54;
        }
      }
      else
      {
        BOOL v47 = v54;
        if (v42 <= 9) {
          BOOL v47 = 0;
        }
        if (v47)
        {
          if (qword_1EB25D6D8 != -1) {
            dispatch_once(&qword_1EB25D6D8, &__block_literal_global_620);
          }
          if (byte_1EB25D5EE == 1)
          {
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            objc_msgSend(MEMORY[0x1E4F1CB00], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__pauseTimer_, v37, 0, fmax(self->_lastPauseTimer - v48 + 5.0, 1.0));
            uint64_t v49 = (NSTimer *)objc_claimAutoreleasedReturnValue();
            pauseTimer = self->_pauseTimer;
            self->_pauseTimer = v49;
          }
        }
      }
      uint64_t v35 = v52;
      if ((v51 & 1) == 0) {
        [(UITextCheckingController *)self removeGrammarMarkersFromWordsInRange:v37];
      }
    }
LABEL_54:
  }
}

- (void)didChangeSelectionFromRange:(id)a3
{
  uint64_t v5 = [(UITextCheckingController *)self nsRangeForTextRange:a3];
  -[UITextCheckingController checkSpellingForSelectionChangeFromRange:](self, "checkSpellingForSelectionChangeFromRange:", v5, v4);
}

- (void)feedbackForGrammarMarkersFromWordsInRange:(id)a3 replacementText:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  NSUInteger v7 = [(UITextCheckingController *)self textChecker];
  if (v14 && self->_client && v7)
  {
    uint64_t v8 = [(UITextCheckingController *)self annotatedSubstringForRange:v14];
    BOOL v9 = v8;
    if (v8 && [v8 length])
    {
      uint64_t v10 = [v9 attribute:@"NSGrammarAutocorrected" atIndex:0 effectiveRange:0];
      NSUInteger v11 = (void *)v10;
      if (v6 && v10)
      {
        if ([v6 isEqualToString:v10]) {
          uint64_t v12 = 5;
        }
        else {
          uint64_t v12 = 3;
        }
        objc_msgSend(v7, "recordResponse:toGrammarDetailInAnnotatedString:range:", v12, v9, 0, objc_msgSend(v9, "length"));
        NSUInteger v13 = [v14 start];
        [(UITextCheckingController *)self removeGrammarAnnotationFromWordAtPosition:v13];
      }
    }
  }
}

- (BOOL)rangeIsSuitableForGrammarAutocorrections:(id)a3
{
  [(UITextCheckingController *)self nsRangeForTextRange:a3];
  return (unint64_t)(v3 - 1) < 0xF;
}

- (void)willReplaceTextInRange:(id)a3 withText:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(UITextCheckingController *)self rangeIsSuitableForGrammarAutocorrections:v7])
  {
    [(UITextCheckingController *)self feedbackForGrammarMarkersFromWordsInRange:v7 replacementText:v6];
  }
}

@end