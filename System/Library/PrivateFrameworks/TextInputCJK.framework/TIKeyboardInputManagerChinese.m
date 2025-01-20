@interface TIKeyboardInputManagerChinese
+ (BOOL)shouldEnableHalfWidthPunctuationForDocumentContext:(id)a3 composedText:(id)a4;
+ (Class)wordSearchClass;
+ (id)GB18030CandidateFromString:(id)a3;
+ (id)pairedPunctuationDictionary;
+ (id)punctuationPredictionsForString:(id)a3;
+ (id)unicodeCandidateFromString:(id)a3;
- (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3;
- (BOOL)duringDeleteFromInputWithContext;
- (BOOL)handlePairedPunctuationInput:(id)a3 context:(id)a4;
- (BOOL)hasIdeographicCandidates;
- (BOOL)isAlphabeticPlane;
- (BOOL)isFacemarkInput:(id)a3;
- (BOOL)isInCompletionMode;
- (BOOL)shouldEnableHalfWidthPunctuationForCurrentInputContext;
- (BOOL)shouldLearnAcceptedCandidate;
- (BOOL)shouldSearchCompletionForSubstrings;
- (BOOL)showingFacemarkCandidates;
- (BOOL)supportsPairedPunctutationInput;
- (BOOL)updateCompletionCandidatesIfAppropriate;
- (CIMCandidateData)candidateData;
- (NSOperationQueue)operationQueue;
- (NSString)currentKeyHint;
- (NSString)language;
- (NSString)modeName;
- (NSString)pairedPunctuationOpenQuote;
- (NSString)pairedPunctuationSelectedText;
- (TIKeyboardInputManagerChinese)initWithConfig:(id)a3 keyboardState:(id)a4;
- (TIMathSymbolPunctuationController)mathSymbolPunctuationController;
- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4;
- (id)candidateResultSetUsedForCompletionQuery;
- (id)completionCandidateResultSetForKeyHint:(id)a3;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)didAcceptCandidate:(id)a3;
- (id)firstCandidate;
- (id)generateCompletions;
- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4;
- (id)outputByConvertingDecimalPointForInput:(id)a3;
- (id)replacementForDoubleSpace;
- (id)sortMethodsGroupsForCandidates:(id)a3;
- (id)sortingMethods;
- (id)titleForSortingMethod:(id)a3;
- (id)wordCharacters;
- (id)wordSearch;
- (unint64_t)initialSelectedIndex;
- (unint64_t)predictionOptions;
- (void)acceptFirstCandidateWithContext:(id)a3;
- (void)clearInput;
- (void)deleteFromInputWithContext:(id)a3;
- (void)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4 completion:(id)a5;
- (void)initImplementationWithMode:(id)a3 andLanguage:(id)a4;
- (void)inputLocationChanged;
- (void)mecabraCandidateRefFromPointerValue:(id)a3;
- (void)resetCommitHistory;
- (void)setCurrentKeyHint:(id)a3;
- (void)setDuringDeleteFromInputWithContext:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setIsAlphabeticPlane:(BOOL)a3;
- (void)setIsInCompletionMode:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLearnsCorrection:(BOOL)a3;
- (void)setModeName:(id)a3;
- (void)setPairedPunctuationOpenQuote:(id)a3;
- (void)setPairedPunctuationSelectedText:(id)a3;
- (void)setShouldLearnAcceptedCandidate:(BOOL)a3;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
- (void)syncToLayoutState:(id)a3;
- (void)wordSearchEngineDidFindPredictionCandidates:(id)a3;
@end

@implementation TIKeyboardInputManagerChinese

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mathSymbolPunctuationController, 0);
  objc_storeStrong((id *)&self->_currentKeyHint, 0);
  objc_storeStrong((id *)&self->_pairedPunctuationSelectedText, 0);
  objc_storeStrong((id *)&self->_pairedPunctuationOpenQuote, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_candidateData, 0);
  objc_storeStrong((id *)&self->_modeName, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

- (void)setDuringDeleteFromInputWithContext:(BOOL)a3
{
  self->_duringDeleteFromInputWithContext = a3;
}

- (BOOL)duringDeleteFromInputWithContext
{
  return self->_duringDeleteFromInputWithContext;
}

- (TIMathSymbolPunctuationController)mathSymbolPunctuationController
{
  return (TIMathSymbolPunctuationController *)objc_getProperty(self, a2, 856, 1);
}

- (void)setCurrentKeyHint:(id)a3
{
}

- (NSString)currentKeyHint
{
  return self->_currentKeyHint;
}

- (void)setPairedPunctuationSelectedText:(id)a3
{
}

- (NSString)pairedPunctuationSelectedText
{
  return self->_pairedPunctuationSelectedText;
}

- (void)setPairedPunctuationOpenQuote:(id)a3
{
}

- (NSString)pairedPunctuationOpenQuote
{
  return self->_pairedPunctuationOpenQuote;
}

- (void)setIsAlphabeticPlane:(BOOL)a3
{
  self->_isAlphabeticPlane = a3;
}

- (BOOL)isAlphabeticPlane
{
  return self->_isAlphabeticPlane;
}

- (void)setShouldLearnAcceptedCandidate:(BOOL)a3
{
  self->_shouldLearnAcceptedCandidate = a3;
}

- (BOOL)shouldLearnAcceptedCandidate
{
  return self->_shouldLearnAcceptedCandidate;
}

- (void)setIsInCompletionMode:(BOOL)a3
{
  self->_isInCompletionMode = a3;
}

- (BOOL)isInCompletionMode
{
  return self->_isInCompletionMode;
}

- (void)setModeName:(id)a3
{
}

- (NSString)modeName
{
  return self->_modeName;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (BOOL)handlePairedPunctuationInput:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isFlick] & 1) == 0
    && [(TIKeyboardInputManagerChinese *)self supportsPairedPunctutationInput])
  {
    v8 = [v6 string];
    if (![v8 length])
    {
      BOOL v33 = 0;
LABEL_29:

      goto LABEL_30;
    }
    int v9 = [v6 isMultitap];
    if (v9)
    {
      v10 = [(TIKeyboardInputManagerChinese *)self pairedPunctuationOpenQuote];
      uint64_t v11 = [v10 length];

      if (!v11)
      {
LABEL_13:
        v29 = [(id)objc_opt_class() pairedPunctuationDictionary];
        v14 = [v29 objectForKey:v8];

        if (![v14 length])
        {
          [(TIKeyboardInputManagerChinese *)self setPairedPunctuationOpenQuote:0];
          [(TIKeyboardInputManagerChinese *)self setPairedPunctuationSelectedText:0];
          BOOL v33 = 0;
LABEL_28:

          goto LABEL_29;
        }
        if (v9)
        {
          v30 = [(TIKeyboardInputManagerChinese *)self pairedPunctuationSelectedText];
          uint64_t v31 = [v30 length];

          if (v31)
          {
            v32 = [(TIKeyboardInputManagerChinese *)self pairedPunctuationSelectedText];
            objc_msgSend(v7, "deleteBackward:", objc_msgSend(v32, "length"));

            [v7 deleteForward:1];
          }
          else
          {
            [v7 deleteBackward:1];
          }
        }
        else
        {
          v34 = [(TIKeyboardInputManagerChinese *)self keyboardState];
          v35 = [v34 documentState];
          v36 = [v35 selectedText];
          [(TIKeyboardInputManagerChinese *)self setPairedPunctuationSelectedText:v36];

          if ([(TIKeyboardInputManagerChinese *)self inputCount]) {
            [(TIKeyboardInputManagerChinese *)self acceptFirstCandidateWithContext:v7];
          }
          else {
            [(TIKeyboardInputManagerChinese *)self acceptCurrentCandidateWithContext:v7];
          }
        }
        [(TIKeyboardInputManagerChinese *)self setPairedPunctuationOpenQuote:v8];
        [v7 insertText:v8];
        v37 = [(TIKeyboardInputManagerChinese *)self pairedPunctuationSelectedText];
        uint64_t v38 = [v37 length];

        if (v38)
        {
          v39 = [(TIKeyboardInputManagerChinese *)self pairedPunctuationSelectedText];
          [v7 insertText:v39];
        }
        [v7 insertTextAfterSelection:v14];
LABEL_27:
        BOOL v33 = 1;
        goto LABEL_28;
      }
      v12 = [(id)objc_opt_class() pairedPunctuationDictionary];
      v13 = [(TIKeyboardInputManagerChinese *)self pairedPunctuationOpenQuote];
      v14 = [v12 objectForKey:v13];

      if ([v14 length])
      {
        v15 = [(TIKeyboardInputManagerChinese *)self keyboardState];
        v16 = [v15 documentState];
        v17 = [v16 contextAfterInput];
        int v18 = [v17 hasPrefix:v14];

        if (v18)
        {
          v19 = [(TIKeyboardInputManagerChinese *)self pairedPunctuationSelectedText];
          uint64_t v20 = [v19 length];

          if (!v20)
          {
            [v7 deleteForward:1];

            goto LABEL_13;
          }
          v21 = [(TIKeyboardInputManagerChinese *)self pairedPunctuationOpenQuote];
          v22 = [(TIKeyboardInputManagerChinese *)self pairedPunctuationSelectedText];
          v23 = [v21 stringByAppendingString:v22];

          v24 = [(TIKeyboardInputManagerChinese *)self keyboardState];
          v25 = [v24 documentState];
          v26 = [v25 contextBeforeInput];
          uint64_t v27 = [v26 rangeOfString:v23 options:4];
          uint64_t v42 = v28;
          uint64_t v43 = v27;

          if (v43 != 0x7FFFFFFFFFFFFFFFLL)
          {
            [v7 deleteBackward:v42];
            v41 = [(TIKeyboardInputManagerChinese *)self pairedPunctuationSelectedText];
            [v7 insertText:v41];

            [(TIKeyboardInputManagerChinese *)self setPairedPunctuationOpenQuote:0];
            goto LABEL_27;
          }
        }
      }
    }
    -[TIKeyboardInputManagerChinese setPairedPunctuationOpenQuote:](self, "setPairedPunctuationOpenQuote:", 0, v42);
    [(TIKeyboardInputManagerChinese *)self setPairedPunctuationSelectedText:0];
    goto LABEL_13;
  }
  BOOL v33 = 0;
LABEL_30:

  return v33;
}

- (BOOL)supportsPairedPunctutationInput
{
  return 0;
}

- (void)acceptFirstCandidateWithContext:(id)a3
{
  id v12 = a3;
  v4 = [(TIKeyboardInputManagerChinese *)self firstCandidate];
  if (v4)
  {
    [v12 acceptCandidate:v4];
    v5 = [(TIKeyboardInputManagerChinese *)self keyboardState];
    id v6 = [(TIKeyboardInputManagerMecabra *)self handleAcceptedCandidate:v4 keyboardState:v5];

    if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
    {
      id v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      int v8 = [v7 hasKindOf:objc_opt_class()];

      if (v8)
      {
        int v9 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        uint64_t v10 = [v9 asCommittedText];

        uint64_t v11 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        [v11 removeAllInputs];

        [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB90]) setString:&stru_270B867F0];
        id v6 = (void *)v10;
      }
    }
    if (v6) {
      [v12 unmarkText:v6];
    }
  }
}

- (id)firstCandidate
{
  v2 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  v3 = [v2 candidates];

  if ([v3 count])
  {
    v4 = [v3 objectAtIndex:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setLearnsCorrection:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerChinese;
  -[TIKeyboardInputManagerChinese setLearnsCorrection:](&v6, sel_setLearnsCorrection_);
  [(TIKeyboardInputManagerChinese *)self setShouldLearnAcceptedCandidate:v3];
  v5 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v5 setShouldLearnAcceptedCandidate:v3];
}

- (id)outputByConvertingDecimalPointForInput:(id)a3
{
  id v4 = a3;
  v5 = [(TIKeyboardInputManagerChinese *)self keyboardState];
  int v6 = [v5 hardwareKeyboardMode];

  id v7 = v4;
  if (v6)
  {
    int v8 = [(TIKeyboardInputManagerChinese *)self keyboardState];
    int v9 = [v8 documentState];
    uint64_t v10 = [v9 contextBeforeInput];
    uint64_t v11 = [v10 _lastGrapheme];

    id v12 = [(TIKeyboardInputManagerChinese *)self mathSymbolPunctuationController];
    v13 = [v11 stringByAppendingString:v4];
    v14 = [v12 mathSymbolPunctuationedStringForInputString:v13];

    id v7 = v4;
    if (v14)
    {
      id v7 = objc_msgSend(v14, "substringFromIndex:", objc_msgSend(v11, "length"));
    }
  }

  return v7;
}

- (BOOL)shouldSearchCompletionForSubstrings
{
  return 1;
}

- (NSOperationQueue)operationQueue
{
  v2 = self;
  objc_sync_enter(v2);
  operationQueue = v2->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    v5 = v2->_operationQueue;
    v2->_operationQueue = v4;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    operationQueue = v2->_operationQueue;
  }
  int v6 = operationQueue;
  objc_sync_exit(v2);

  return v6;
}

- (CIMCandidateData)candidateData
{
  v2 = self;
  objc_sync_enter(v2);
  candidateData = v2->_candidateData;
  if (!candidateData)
  {
    id v4 = [CIMCandidateData alloc];
    v5 = [(TIKeyboardInputManagerBase *)v2 inputMode];
    uint64_t v6 = [(CIMCandidateData *)v4 initWithInputMode:v5];
    id v7 = v2->_candidateData;
    v2->_candidateData = (CIMCandidateData *)v6;

    candidateData = v2->_candidateData;
  }
  int v8 = candidateData;
  objc_sync_exit(v2);

  return v8;
}

- (void)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9 && v10)
  {
    id v12 = [(TIKeyboardInputManagerChinese *)self operationQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __95__TIKeyboardInputManagerChinese_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke;
    v13[3] = &unk_2655357B8;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v11;
    [v12 addOperationWithBlock:v13];
  }
}

void __95__TIKeyboardInputManagerChinese_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) groupedCandidatesFromCandidates:*(void *)(a1 + 40) usingSortingMethod:*(void *)(a1 + 48)];
  BOOL v3 = [MEMORY[0x263F08A48] mainQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __95__TIKeyboardInputManagerChinese_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke_2;
  v6[3] = &unk_2655357E0;
  id v4 = *(id *)(a1 + 56);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  [v3 addOperationWithBlock:v6];
}

uint64_t __95__TIKeyboardInputManagerChinese_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(TIKeyboardInputManagerChinese *)self candidateData];
    [v8 setCandidates:v7];

    uint64_t v9 = [v6 unsignedIntegerValue];
    id v10 = objc_msgSend(v8, "candidatesSortedByMethod:omittingEmoji:", v9, -[TIKeyboardInputManagerChinese shouldOmitEmojiCandidates](self, "shouldOmitEmojiCandidates"));
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)sortMethodsGroupsForCandidates:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManagerChinese *)self candidateData];
  [v5 clearCache];

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerChinese;
  id v6 = [(TIKeyboardInputManagerChinese *)&v8 sortMethodsGroupsForCandidates:v4];

  return v6;
}

- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = v8;
  if ([(TIKeyboardInputManagerChinese *)self shouldOmitEmojiCandidates])
  {
    uint64_t v9 = [v8 _arrayByFilteringEmojiCandidates:0];
  }
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardInputManagerChinese;
  id v10 = [(TIKeyboardInputManagerChinese *)&v12 candidateResultSetFromCandidates:v9 proactiveTriggers:v7];

  return v10;
}

- (id)titleForSortingMethod:(id)a3
{
  uint64_t v3 = [a3 unsignedIntegerValue];
  return +[CIMCandidateData sortTitleFromSortingMethod:v3];
}

- (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3
{
  return 1;
}

- (id)sortingMethods
{
  return 0;
}

- (unint64_t)initialSelectedIndex
{
  id v4 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  id v5 = [v4 candidates];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    v2 = [(TIKeyboardInputManagerChinese *)self inputString];
    if ([v2 length])
    {
      id v7 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerChinese;
  id v7 = [(TIKeyboardInputManagerChinese *)&v9 initialSelectedIndex];
  if (v6) {
    goto LABEL_5;
  }
LABEL_6:

  return (unint64_t)v7;
}

- (id)completionCandidateResultSetForKeyHint:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqualToString:@"Chinese"])
  {
    id v5 = [(TIKeyboardInputManagerChinese *)self language];
    int v6 = [v5 isEqualToString:@"zh-Hans"];

    int v25 = 0;
    if (v6) {
      id v7 = &unk_270B8AE50;
    }
    else {
      id v7 = &unk_270B8AE68;
    }
  }
  else if ([v4 isEqualToString:@"Latin"])
  {
    id v7 = &unk_270B8AE80;
    int v25 = 1;
  }
  else
  {
    int v25 = [v4 isEqualToString:@"Numbers"];
    if (v25) {
      id v7 = &unk_270B8AE98;
    }
    else {
      id v7 = 0;
    }
  }
  if ([v7 count])
  {
    id v24 = v4;
    id v27 = objc_alloc_init(MEMORY[0x263F7EB68]);
    v26 = [(id)objc_opt_class() pairedPunctuationDictionary];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v8) {
      goto LABEL_30;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    uint64_t v11 = *MEMORY[0x263EFF5A0];
    objc_super v12 = v7;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(id *)(*((void *)&v28 + 1) + 8 * i);
        id v15 = v14;
        if (v25)
        {
          id v16 = [v14 stringByApplyingTransform:v11 reverse:0];
          if (([v15 isEqualToString:v16] & 1) == 0)
          {
            v17 = @"UI-Fullwidth";
            goto LABEL_22;
          }
        }
        else
        {
          id v16 = [v14 stringByApplyingTransform:v11 reverse:1];
          if (([v15 isEqualToString:v16] & 1) == 0)
          {
            v17 = @"UI-Halfwidth";
LABEL_22:
            if (objc_msgSend(v7, "containsObject:", v16, v24)) {
              int v18 = v17;
            }
            else {
              int v18 = 0;
            }
            goto LABEL_25;
          }
        }
        int v18 = 0;
LABEL_25:

        v19 = [v26 objectForKeyedSubscript:v15];
        uint64_t v20 = v19;
        if (v19)
        {
          uint64_t v21 = -[v19 length];
          uint64_t v22 = [v15 stringByAppendingString:v20];

          id v15 = (void *)v22;
        }
        else
        {
          uint64_t v21 = 0;
        }
        objc_msgSend(v27, "addSyntheticMecabraCandidateWithSurface:input:isExtension:deleteCount:cursorMovement:annotation:", v15, &stru_270B867F0, 0, 1, v21, v18, v24);

        id v7 = v12;
      }
      uint64_t v9 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v9)
      {
LABEL_30:

        id v4 = v24;
        goto LABEL_32;
      }
    }
  }
  id v27 = 0;
LABEL_32:

  return v27;
}

- (void)wordSearchEngineDidFindPredictionCandidates:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  -[TIKeyboardInputManagerChinese setIsInCompletionMode:](self, "setIsInCompletionMode:", [v4 isEmpty] ^ 1);
  id v5 = objc_opt_class();
  int v6 = [(TIKeyboardInputManagerChinese *)self keyboardState];
  id v7 = [v6 documentState];
  uint64_t v8 = [v7 contextBeforeInput];
  uint64_t v9 = [v5 punctuationPredictionsForString:v8];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = objc_msgSend(v9, "reverseObjectEnumerator", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        [v4 insertSyntheticMecabraCandidateWithSurface:*(void *)(*((void *)&v18 + 1) + 8 * v14++) input:&stru_270B867F0 atIndex:0];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  [(TIKeyboardInputManagerMecabra *)self updateProactiveCandidatesForCandidateResultSet:v4 withInput:&stru_270B867F0];
  if ([(TIKeyboardInputManagerChinese *)self candidateRange])
  {
    id v15 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    id v16 = [v15 candidateRefsDictionary];
    [v4 addCandidates:MEMORY[0x263EFFA68] candidateRefsDictionary:v16];
  }
  [(TIKeyboardInputManagerMecabra *)self updateProactiveCandidatesForCandidateResultSet:v4 withInput:&stru_270B867F0];
  [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v4];
  v17 = [(TIKeyboardInputManagerMecabra *)self candidateResultSetFromWordSearchCandidateResultSet:v4];
  [(TIKeyboardInputManagerChinese *)self closeCandidateGenerationContextWithResults:v17];
}

- (BOOL)updateCompletionCandidatesIfAppropriate
{
  if ([(TIKeyboardInputManagerChinese *)self conformsToProtocol:&unk_270B95858])
  {
    if ([(TIKeyboardInputManagerChinese *)self shouldLookForCompletionCandidates])
    {
      uint64_t v3 = [(TIKeyboardInputManagerChinese *)self currentKeyHint];

      if (v3)
      {
        id v4 = [(TIKeyboardInputManagerChinese *)self currentKeyHint];
        id v5 = [(TIKeyboardInputManagerChinese *)self completionCandidateResultSetForKeyHint:v4];
      }
      else
      {
        id v5 = [(TIKeyboardInputManagerChinese *)self generateCompletions];
      }
      [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v5];
      BOOL v7 = v5 != 0;
    }
    else
    {
      [(TIKeyboardInputManagerChinese *)self willExitCompletionMode];
      [(TIKeyboardInputManagerChinese *)self setIsInCompletionMode:0];
      return 0;
    }
  }
  else
  {
    if ([(TIKeyboardInputManagerChinese *)self isInCompletionMode])
    {
      [(TIKeyboardInputManagerChinese *)self willExitCompletionMode];
      [(TIKeyboardInputManagerChinese *)self setIsInCompletionMode:0];
    }
    int v6 = [MEMORY[0x263F7EB68] emptySet];
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v6];

    return 1;
  }
  return v7;
}

- (id)generateCompletions
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F7EB68]);
    unint64_t v4 = [(TIKeyboardInputManagerChinese *)self predictionOptions];
    id v5 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    int v6 = [v5 mecabraEnvironment];

    BOOL v7 = [(TIKeyboardInputManagerChinese *)self keyboardState];
    uint64_t v8 = [v7 documentState];

    uint64_t v9 = [v8 contextBeforeInput];
    uint64_t v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (__CFString *)v9;
    }
    else {
      uint64_t v11 = &stru_270B867F0;
    }
    uint64_t v12 = v11;

    uint64_t v13 = [v8 contextAfterInput];
    uint64_t v14 = (void *)v13;
    if (v13) {
      id v15 = (__CFString *)v13;
    }
    else {
      id v15 = &stru_270B867F0;
    }
    id v16 = v15;

    v17 = (void *)MEMORY[0x263F086D0];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke;
    v32[3] = &unk_265535158;
    id v33 = v6;
    v34 = v12;
    v35 = v16;
    unint64_t v38 = v4;
    id v18 = v3;
    id v36 = v18;
    v37 = self;
    long long v19 = v16;
    long long v20 = v12;
    id v21 = v6;
    uint64_t v22 = [v17 blockOperationWithBlock:v32];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_77;
    v28[3] = &unk_2655351F8;
    id v29 = v22;
    long long v30 = self;
    id v31 = v18;
    id v23 = v18;
    id v24 = v22;
    [v24 setCompletionBlock:v28];
    int v25 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v25 cancel];

    v26 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v26 performOperationAsync:v24];
  }
  return 0;
}

void __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setLeftDocumentContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setRightDocumentContext:*(void *)(a1 + 48)];
  if (TICanLogMessageAtLevel())
  {
    v2 = TIOSLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = NSString;
      uint64_t v11 = [*(id *)(a1 + 32) leftDocumentContext];
      uint64_t v12 = [*(id *)(a1 + 32) rightDocumentContext];
      uint64_t v13 = [v10 stringWithFormat:@"%s [Environment] Set left context: %@, Right context: %@", "-[TIKeyboardInputManagerChinese generateCompletions]_block_invoke", v11, v12];
      *(_DWORD *)buf = 138412290;
      id v18 = v13;
      _os_log_debug_impl(&dword_25EC0A000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  [*(id *)(a1 + 32) adjustEnvironmentDirectly:0];
  [*(id *)(a1 + 32) adjustEnvironmentDirectly:0];
  if ([*(id *)(a1 + 32) predictionAnalyzeWithOptions:*(void *)(a1 + 72) maxNumberOfCandidates:40])
  {
    [*(id *)(a1 + 32) mecabra];
    while (1)
    {
      uint64_t NextCandidate = MecabraPredictionGetNextCandidate();
      if (!NextCandidate) {
        break;
      }
      uint64_t v4 = NextCandidate;
      if (MecabraCandidateGetType() == 6)
      {
        [*(id *)(a1 + 56) addMecabraProactiveCandidate:v4 triggerSourceType:0];
      }
      else
      {
        id v5 = (void *)[objc_alloc(MEMORY[0x263F7E6A0]) initWithMecabraCandidate:v4];
        [*(id *)(a1 + 56) addMecabraCandidate:v5 mecabraCandidateRef:v4];
      }
    }
    int v6 = [*(id *)(a1 + 56) proactiveTriggers];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      if (TICanLogMessageAtLevel())
      {
        uint64_t v8 = TIOSLogFacility();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = NSString;
          id v15 = [*(id *)(a1 + 56) proactiveTriggers];
          id v16 = [v14 stringWithFormat:@"%s ProactiveQuickType:TI: found prediction proactive triggers: %@", "-[TIKeyboardInputManagerChinese generateCompletions]_block_invoke", v15];
          *(_DWORD *)buf = 138412290;
          id v18 = v16;
          _os_log_debug_impl(&dword_25EC0A000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  uint64_t v9 = [*(id *)(a1 + 64) wordSearch];
  [v9 insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet:*(void *)(a1 + 56)];
}

void __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_77(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A48] mainQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_2;
  v6[3] = &unk_2655351F8;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  [v2 addOperationWithBlock:v6];
}

void __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCompletionBlock:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_3;
  v10[3] = &unk_2655351A8;
  v2 = *(void **)(a1 + 48);
  v10[4] = *(void *)(a1 + 40);
  id v11 = v2;
  id v3 = (void *)MEMORY[0x2611ED830](v10);
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    id v5 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_5;
    v6[3] = &unk_2655351D0;
    objc_copyWeak(&v8, &location);
    id v7 = v3;
    [v5 addStickers:v4 withCompletionHandler:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_3(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A48] mainQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_4;
  v4[3] = &unk_265535180;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 addOperationWithBlock:v4];
}

void __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addProactiveTriggers:v4 withCompletionHandler:*(void *)(a1 + 32)];
}

uint64_t __52__TIKeyboardInputManagerChinese_generateCompletions__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) wordSearchEngineDidFindPredictionCandidates:*(void *)(a1 + 40)];
}

- (unint64_t)predictionOptions
{
  if ([(TIKeyboardInputManagerChinese *)self shouldSearchCompletionForSubstrings]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(TIKeyboardInputManagerChinese *)self shouldLearnAcceptedCandidate]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = v3 | 4;
  }
  id v5 = [(TIKeyboardInputManagerChinese *)self keyboardState];
  int v6 = [v5 hardwareKeyboardMode];

  if (v6) {
    unint64_t v7 = v4 | 0x10;
  }
  else {
    unint64_t v7 = v4;
  }
  id v8 = [(TIKeyboardInputManagerChinese *)self keyboardState];
  int v9 = [v8 candidateSelectionPredictionEnabled];

  if (v9) {
    return v7;
  }
  else {
    return v7 | 0x20;
  }
}

- (void)mecabraCandidateRefFromPointerValue:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  int v6 = [v5 candidateRefsDictionary];
  unint64_t v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (BOOL)hasIdeographicCandidates
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  uint64_t v3 = [v2 candidates];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "candidate", (void)v11);
        char v9 = [v8 _containsIdeographicCharacters];

        if (v9)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)showingFacemarkCandidates
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  uint64_t v3 = [v2 candidates];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v4);
        }
        v8 += objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "isFacemarkCandidate", (void)v12);
        if (v7 + i + 1 > 4)
        {
          v7 += i + 1;
          goto LABEL_12;
        }
      }
      v7 += i;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v7 = 0;
    uint64_t v8 = 0;
  }
LABEL_12:

  return v7 < 2 * v8;
}

- (BOOL)isFacemarkInput:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F7EBF8]])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(TIKeyboardInputManagerChinese *)self keyboardState];
    if ([v6 hardwareKeyboardMode])
    {
      if ([v4 isEqualToString:*MEMORY[0x263F7EBE8]]) {
        char v5 = 1;
      }
      else {
        char v5 = [v4 isEqualToString:*MEMORY[0x263F7EBF0]];
      }
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5;
}

- (id)candidateResultSetUsedForCompletionQuery
{
  return 0;
}

- (BOOL)shouldEnableHalfWidthPunctuationForCurrentInputContext
{
  uint64_t v3 = [(TIKeyboardInputManagerChinese *)self keyboardState];
  id v4 = [v3 documentState];
  char v5 = [v4 contextBeforeInput];

  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB90]))
  {
    uint64_t v6 = -[TIKeyboardInputManager_mul externalStringToInternal:](self, "externalStringToInternal:");
  }
  else
  {
    uint64_t v6 = 0;
  }
  BOOL v7 = +[TIKeyboardInputManagerChinese shouldEnableHalfWidthPunctuationForDocumentContext:v5 composedText:v6];

  return v7;
}

- (id)wordCharacters
{
  v2 = (void *)-[TIKeyboardInputManagerChinese wordCharacters]::__wordCharacterSet;
  if (!-[TIKeyboardInputManagerChinese wordCharacters]::__wordCharacterSet)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F7E520]) initWithBaseCharacterSet:3];
    uint64_t v4 = [v3 invertedSetDescription];
    char v5 = (void *)-[TIKeyboardInputManagerChinese wordCharacters]::__wordCharacterSet;
    -[TIKeyboardInputManagerChinese wordCharacters]::__wordCharacterSet = v4;

    v2 = (void *)-[TIKeyboardInputManagerChinese wordCharacters]::__wordCharacterSet;
  }
  return v2;
}

- (id)replacementForDoubleSpace
{
  if ([(TIKeyboardInputManagerChinese *)self isAlphabeticPlane]) {
    v2 = @".";
  }
  else {
    v2 = @"。";
  }
  return v2;
}

- (void)deleteFromInputWithContext:(id)a3
{
  id v4 = a3;
  [(TIKeyboardInputManagerChinese *)self setDuringDeleteFromInputWithContext:1];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerChinese;
  [(TIKeyboardInputManagerMecabra *)&v5 deleteFromInputWithContext:v4];

  [(TIKeyboardInputManagerChinese *)self setDuringDeleteFromInputWithContext:0];
  [(TIMathSymbolPunctuationController *)self->_mathSymbolPunctuationController setEnabled:[(TIMathSymbolPunctuationController *)self->_mathSymbolPunctuationController converted] ^ 1];
}

- (id)deleteFromInput:(unint64_t *)a3
{
  [(TIKeyboardInputManagerChinese *)self setCurrentKeyHint:0];
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerChinese;
  objc_super v5 = [(TIKeyboardInputManagerChinese *)&v7 deleteFromInput:a3];
  return v5;
}

- (void)setInput:(id)a3
{
  id v4 = a3;
  [(TIKeyboardInputManagerChinese *)self setCurrentKeyHint:0];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerChinese;
  [(TIKeyboardInputManagerChinese *)&v5 setInput:v4];
}

- (void)clearInput
{
  [(TIKeyboardInputManagerChinese *)self setCurrentKeyHint:0];
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerChinese;
  [(TIKeyboardInputManagerMecabra *)&v3 clearInput];
}

- (void)inputLocationChanged
{
  [(TIKeyboardInputManagerChinese *)self setCurrentKeyHint:0];
  if (![(TIKeyboardInputManagerChinese *)self duringDeleteFromInputWithContext]) {
    [(TIMathSymbolPunctuationController *)self->_mathSymbolPunctuationController reset];
  }
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerChinese;
  [(TIKeyboardInputManagerChinese *)&v3 inputLocationChanged];
}

- (id)didAcceptCandidate:(id)a3
{
  id v4 = a3;
  [(TIKeyboardInputManagerChinese *)self setCurrentKeyHint:0];
  objc_super v5 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v4];

  if ([(TIKeyboardInputManagerChinese *)self isInCompletionMode]
    && [(TIKeyboardInputManagerChinese *)self shouldLearnAcceptedCandidate]
    && v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F7EB78]);
    objc_super v7 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    uint64_t v8 = (void *)[v6 initWithWordSearch:v7 mecabraCandidate:v5 isPartial:0 isPrediction:1];

    uint64_t v9 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v9 performOperationAsync:v8];
  }
  if ([(TIKeyboardInputManagerChinese *)self inputCount])
  {
    uint64_t v10 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    long long v11 = [v10 candidates];

    if (!v11) {
      [(TIKeyboardInputManagerChinese *)self clearInput];
    }
  }
  long long v12 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v12 clearCache];

  return 0;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v10)
  {
    long long v11 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v11 syncToKeyboardState:v8 from:v9 afterContextChange:v5];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TIKeyboardInputManagerChinese;
    [(TIKeyboardInputManagerMecabra *)&v13 syncToKeyboardState:v8 from:v9 afterContextChange:v5];
    long long v12 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    objc_msgSend(v12, "setDebuggingLogEnabled:", -[TIKeyboardInputManagerChinese isTypologyEnabled](self, "isTypologyEnabled"));
  }
}

- (void)syncToLayoutState:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerChinese;
  id v4 = a3;
  [(TIKeyboardInputManagerChinese *)&v7 syncToLayoutState:v4];
  uint64_t v5 = objc_msgSend(v4, "isAlphabeticPlane", v7.receiver, v7.super_class);

  [(TIKeyboardInputManagerChinese *)self setIsAlphabeticPlane:v5];
  id v6 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v6 clearCache];
}

- (void)initImplementationWithMode:(id)a3 andLanguage:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(TIKeyboardInputManagerChinese *)self setModeName:a3];
  [(TIKeyboardInputManagerChinese *)self setLanguage:v6];

  [(TIKeyboardInputManagerChinese *)self setIsInCompletionMode:0];
  result = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
  if (!result) {
    operator new();
  }
  return result;
}

- (void)resetCommitHistory
{
  objc_super v3 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v3 resetPreviousWord];

  id v4 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v4 clearCache];
}

- (TIKeyboardInputManagerChinese)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManagerChinese;
  objc_super v7 = [(TIKeyboardInputManagerMecabra *)&v15 initWithConfig:v6 keyboardState:a4];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F7EB70] sharedWordSearchController];
    id v9 = [v6 inputMode];
    uint64_t v10 = [v8 wordSearchForInputMode:v9];
    wordSearch = v7->_wordSearch;
    v7->_wordSearch = (TIWordSearch *)v10;

    long long v12 = (TIMathSymbolPunctuationController *)objc_alloc_init(MEMORY[0x263F7EAF8]);
    mathSymbolPunctuationController = v7->_mathSymbolPunctuationController;
    v7->_mathSymbolPunctuationController = v12;

    [(TIMathSymbolPunctuationController *)v7->_mathSymbolPunctuationController setReplaceAfterNumerals:1];
  }

  return v7;
}

+ (id)pairedPunctuationDictionary
{
  if (+[TIKeyboardInputManagerChinese pairedPunctuationDictionary]::__onceToken != -1) {
    dispatch_once(&+[TIKeyboardInputManagerChinese pairedPunctuationDictionary]::__onceToken, &__block_literal_global_466);
  }
  v2 = (void *)+[TIKeyboardInputManagerChinese pairedPunctuationDictionary]::__pairedPunctuationDictionary;
  return v2;
}

void __60__TIKeyboardInputManagerChinese_pairedPunctuationDictionary__block_invoke()
{
  v0 = (void *)+[TIKeyboardInputManagerChinese pairedPunctuationDictionary]::__pairedPunctuationDictionary;
  +[TIKeyboardInputManagerChinese pairedPunctuationDictionary]::__pairedPunctuationDictionary = (uint64_t)&unk_270B8B058;
}

+ (Class)wordSearchClass
{
  return 0;
}

+ (BOOL)shouldEnableHalfWidthPunctuationForDocumentContext:(id)a3 composedText:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = v6;
  if ([v5 length])
  {
    if ([v6 length])
    {
      id v8 = [v5 stringByAppendingString:v6];
    }
    else
    {
      id v8 = v5;
    }
    objc_super v7 = v8;
  }
  if (![v7 length]) {
    goto LABEL_19;
  }
  id v9 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  uint64_t v10 = [v7 rangeOfCharacterFromSet:v9 options:12];
  uint64_t v12 = v11;

  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v10 + v12 != [v7 length])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v14 = [&unk_270B8AEB0 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
LABEL_12:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(&unk_270B8AEB0);
        }
        if ([v7 hasSuffix:*(void *)(*((void *)&v19 + 1) + 8 * v17)]) {
          goto LABEL_9;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [&unk_270B8AEB0 countByEnumeratingWithState:&v19 objects:v23 count:16];
          BOOL v13 = 0;
          if (v15) {
            goto LABEL_12;
          }
          goto LABEL_20;
        }
      }
    }
LABEL_19:
    BOOL v13 = 0;
    goto LABEL_20;
  }
LABEL_9:
  BOOL v13 = 1;
LABEL_20:

  return v13;
}

+ (id)unicodeCandidateFromString:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"|u|"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"|u|", "length")];
    id v5 = [MEMORY[0x263F08B08] scannerWithString:v4];
    int v11 = 0;
    if ([v5 scanHexInt:&v11])
    {
      if ((v11 - 0x10000) >> 20)
      {
        uint64_t v7 = 1;
        LOWORD(v6) = v11;
      }
      else
      {
        unsigned int v6 = ((v11 + 67043328) >> 10) - 10240;
        v10[1] = v11 & 0x3FF | 0xDC00;
        uint64_t v7 = 2;
      }
      v10[0] = v6;
      id v8 = [NSString stringWithCharacters:v10 length:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)GB18030CandidateFromString:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"|g|"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"|g|", "length")];
    if ([v4 length])
    {
      id v8 = 0;
    }
    else
    {
      id v5 = [MEMORY[0x263F08B08] scannerWithString:v4];
      unsigned int v11 = 0;
      if ([v5 scanHexInt:&v11])
      {
        unint64_t v6 = 0;
        unint64_t v7 = 0;
        unsigned int v11 = bswap32(v11);
        do
        {
          if (*((unsigned char *)&v11 + v6)) {
            v10[v7++] = *((unsigned char *)&v11 + v6);
          }
          if (v6 > 2) {
            break;
          }
          ++v6;
        }
        while (v7 < 4);
        id v8 = (void *)[[NSString alloc] initWithBytes:v10 length:v7 encoding:CFStringConvertEncodingToNSStringEncoding(0x632u)];
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)punctuationPredictionsForString:(id)a3
{
  id v3 = a3;
  if (+[TIKeyboardInputManagerChinese punctuationPredictionsForString:]::__onceToken != -1) {
    dispatch_once(&+[TIKeyboardInputManagerChinese punctuationPredictionsForString:]::__onceToken, &__block_literal_global);
  }
  unint64_t v4 = [v3 length];
  unint64_t v5 = v4;
  if (v4 < 2)
  {
    id v8 = 0;
    if (!v4) {
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v6 = (void *)+[TIKeyboardInputManagerChinese punctuationPredictionsForString:]::__punctuationPredictions;
    unint64_t v7 = [v3 substringFromIndex:v4 - 2];
    id v8 = [v6 objectForKey:v7];

    if (!v5) {
      goto LABEL_9;
    }
  }
  if (!v8)
  {
    id v9 = (void *)+[TIKeyboardInputManagerChinese punctuationPredictionsForString:]::__punctuationPredictions;
    uint64_t v10 = [v3 substringFromIndex:v5 - 1];
    id v8 = [v9 objectForKey:v10];
  }
LABEL_9:

  return v8;
}

void __65__TIKeyboardInputManagerChinese_punctuationPredictionsForString___block_invoke()
{
  v0 = (void *)+[TIKeyboardInputManagerChinese punctuationPredictionsForString:]::__punctuationPredictions;
  +[TIKeyboardInputManagerChinese punctuationPredictionsForString:]::__punctuationPredictions = (uint64_t)&unk_270B8B030;
}

@end