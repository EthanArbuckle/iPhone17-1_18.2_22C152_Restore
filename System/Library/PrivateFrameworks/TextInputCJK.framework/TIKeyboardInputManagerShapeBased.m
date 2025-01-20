@interface TIKeyboardInputManagerShapeBased
- (BOOL)hasCandidates;
- (BOOL)isHardwareKeyboardAutocorrectionEnabled;
- (BOOL)previousActionWasAutoConfirmation;
- (BOOL)shouldExtendPriorWord;
- (BOOL)shouldLookForCompletionCandidates;
- (BOOL)suppliesCompletions;
- (BOOL)supportsLearning;
- (BOOL)supportsReversionUI;
- (BOOL)updateCandidatesWithTIWordSearch:(id)a3 predictionEnabled:(BOOL)a4;
- (BOOL)usesAutoDeleteWord;
- (BOOL)usesCandidateSelection;
- (NSMutableString)searchString;
- (id)candidateResultSet;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)didAcceptCandidate:(id)a3;
- (id)keyboardBehaviors;
- (id)keyboardConfigurationLayoutTag;
- (id)markedTextWithAutoconvertedCandidates;
- (id)rawInputString;
- (id)searchStringForMarkedText;
- (id)sortingMethods;
- (unint64_t)initialSelectedIndex;
- (unsigned)inputCount;
- (unsigned)inputIndex;
- (void)acceptInput;
- (void)cancelCandidatesThread;
- (void)clearInput;
- (void)inputLocationChanged;
- (void)setPreviousActionWasAutoConfirmation:(BOOL)a3;
@end

@implementation TIKeyboardInputManagerShapeBased

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingInput, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

- (void)setPreviousActionWasAutoConfirmation:(BOOL)a3
{
  self->_previousActionWasAutoConfirmation = a3;
}

- (BOOL)previousActionWasAutoConfirmation
{
  return self->_previousActionWasAutoConfirmation;
}

- (id)searchStringForMarkedText
{
  v2 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  v3 = [v2 autoconvertedCandidateString];

  return v3;
}

- (id)markedTextWithAutoconvertedCandidates
{
  v3 = [(TIKeyboardInputManagerShapeBased *)self formattedSearchString];
  v4 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  v5 = [v4 autoconvertedCandidateString];

  if (!v5)
  {
    id v10 = v3;
    goto LABEL_15;
  }
  v6 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  v7 = [v6 autoconvertedInputString];

  unint64_t v8 = [v7 length];
  if (v8 >= [v3 length])
  {
    v11 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    v9 = [v11 autoconvertedCandidates];

    uint64_t v12 = [v9 count];
    if (!v12) {
      goto LABEL_13;
    }
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      v16 = [v9 objectAtIndexedSubscript:v14];
      v17 = [v16 input];
      uint64_t v18 = [v17 length];

      unint64_t v19 = v18 + v15;
      unint64_t v20 = [v3 length];

      if (v19 >= v20) {
        break;
      }
      ++v14;
      unint64_t v15 = v19;
      if (v13 == v14)
      {
        unint64_t v15 = v19;
        uint64_t v14 = v13;
        break;
      }
    }
    if (!v15)
    {
LABEL_13:
      id v25 = v3;
      goto LABEL_14;
    }
    v21 = objc_msgSend(v9, "subarrayWithRange:", 0, v14 - 1);
    v22 = [v21 valueForKey:@"candidate"];
    uint64_t v23 = [v22 componentsJoinedByString:&stru_270B867F0];

    uint64_t v24 = [v3 substringFromIndex:v15];

    v9 = (void *)v24;
    v5 = (void *)v23;
  }
  else
  {
    v9 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v7, "length"));
  }
  id v25 = [v5 stringByAppendingString:v9];
LABEL_14:
  id v10 = v25;

LABEL_15:
  return v10;
}

- (id)didAcceptCandidate:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TIKeyboardInputManagerShapeBased;
  v5 = [(TIKeyboardInputManagerChinese *)&v26 didAcceptCandidate:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v6 = objc_msgSend(v4, "autoconvertedCandidatePointerValues", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [(TIKeyboardInputManagerChinese *)self mecabraCandidateRefFromPointerValue:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          uint64_t v12 = [(TIKeyboardInputManagerChinese *)self wordSearch];
          uint64_t v13 = v12;
          if (v11)
          {
            [v12 performAccept:v11 isPartial:0];
          }
          else
          {
            uint64_t v14 = [v4 candidate];
            [v13 commitSurface:v14];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }
  }
  unint64_t v15 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v4];
  v16 = [v4 proactiveTrigger];

  if (v16)
  {
    uint64_t v17 = [v4 candidate];

    v5 = (void *)v17;
  }
  uint64_t v18 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  unint64_t v19 = v18;
  if (v15)
  {
    [v18 performAccept:v15 isPartial:0];
  }
  else
  {
    unint64_t v20 = [v4 candidate];
    [v19 commitSurface:v20];
  }
  return v5;
}

- (id)sortingMethods
{
  if ([(TIKeyboardInputManagerChinese *)self showingFacemarkCandidates]) {
    return &unk_270B8AEC8;
  }
  if (![(TIKeyboardInputManagerChinese *)self hasIdeographicCandidates]) {
    return &unk_270B8AEE0;
  }
  if (+[CIMCandidateData shouldShowZhuyinSortingMethod])
  {
    return &unk_270B8AEF8;
  }
  return &unk_270B8AF10;
}

- (BOOL)supportsLearning
{
  return 0;
}

- (BOOL)supportsReversionUI
{
  return 0;
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (BOOL)usesAutoDeleteWord
{
  return 0;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (BOOL)suppliesCompletions
{
  return 1;
}

- (BOOL)shouldLookForCompletionCandidates
{
  if ([(TIKeyboardInputManagerShapeBased *)self inputCount]) {
    return 0;
  }
  else {
    return ![(TIKeyboardInputManagerChinese *)self showingFacemarkCandidates];
  }
}

- (void)inputLocationChanged
{
  [(TIKeyboardInputManagerShapeBased *)self clearInput];
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerShapeBased;
  [(TIKeyboardInputManagerChinese *)&v3 inputLocationChanged];
}

- (void)acceptInput
{
  [(TIKeyboardInputManagerShapeBased *)self clearInput];
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerShapeBased;
  [(TIKeyboardInputManagerShapeBased *)&v3 acceptInput];
}

- (BOOL)isHardwareKeyboardAutocorrectionEnabled
{
  return 0;
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E5F8]);
  return v2;
}

- (id)keyboardConfigurationLayoutTag
{
  if ([(TIKeyboardInputManagerChinese *)self shouldEnableHalfWidthPunctuationForCurrentInputContext])
  {
    id v2 = @"HalfWidthPunctuation";
  }
  else
  {
    id v2 = @"Default";
  }
  return v2;
}

- (void)clearInput
{
  objc_super v3 = [(TIKeyboardInputManagerShapeBased *)self searchString];
  id v4 = [(TIKeyboardInputManagerShapeBased *)self searchString];
  objc_msgSend(v3, "deleteCharactersInRange:", 0, objc_msgSend(v4, "length"));

  if (!self->_keepRemainingInput) {
    [(TIKeyboardInputManagerMecabra *)self setRemainingInput:0];
  }
  [(TIKeyboardInputManagerShapeBased *)self cancelCandidatesThread];
  v5 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v5 resetPreviousWord];

  [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
  [(TIKeyboardInputManagerShapeBased *)self setPreviousActionWasAutoConfirmation:0];
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerShapeBased;
  [(TIKeyboardInputManagerChinese *)&v6 clearInput];
}

- (id)deleteFromInput:(unint64_t *)a3
{
  [(TIKeyboardInputManagerShapeBased *)self cancelCandidatesThread];
  if ([(TIKeyboardInputManagerShapeBased *)self previousActionWasAutoConfirmation])
  {
    v5 = [(TIKeyboardInputManagerShapeBased *)self keyboardState];
    objc_super v6 = [v5 inputMode];
    uint64_t v7 = TIStatisticGetKeyForCandidateAccepted();
    TIStatisticScalarDecrement();

    [(TIKeyboardInputManagerShapeBased *)self setPreviousActionWasAutoConfirmation:0];
  }
  if ([(TIKeyboardInputManagerShapeBased *)self shouldSkipCandidateSelection])
  {
    -[TIKeyboardInputManagerChinese deleteFromInput:](&v24, sel_deleteFromInput_, a3, v23.receiver, v23.super_class, self, TIKeyboardInputManagerShapeBased);
  }
  else
  {
    uint64_t v8 = [(TIKeyboardInputManagerShapeBased *)self inputString];
    int v9 = [v8 hasSuffix:*MEMORY[0x263F7EBF8]];

    if (v9)
    {
      [(TIKeyboardInputManagerShapeBased *)self clearInput];
      id v10 = 0;
      goto LABEL_22;
    }
    unsigned int v11 = [(TIKeyboardInputManagerShapeBased *)self inputIndex];
    if (a3 && v11)
    {
      if (!*a3)
      {
        uint64_t v12 = [(TIKeyboardInputManagerShapeBased *)self keyboardState];
        uint64_t v13 = [v12 documentState];
        [v13 selectedRangeInMarkedText];
        unint64_t v15 = v14;

        if (v15 <= 1) {
          unint64_t v16 = 1;
        }
        else {
          unint64_t v16 = v15;
        }
        *a3 = v16;
      }
      uint64_t v17 = [(TIKeyboardInputManagerShapeBased *)self searchString];
      if ([v17 length] >= *a3)
      {
        unint64_t v19 = [(TIKeyboardInputManagerShapeBased *)self searchString];
        unint64_t v18 = [v19 length] - *a3;
      }
      else
      {
        unint64_t v18 = 0;
      }

      unint64_t v20 = [(TIKeyboardInputManagerShapeBased *)self searchString];
      v21 = [(TIKeyboardInputManagerShapeBased *)self searchString];
      objc_msgSend(v20, "deleteCharactersInRange:", v18, objc_msgSend(v21, "length") - v18);
    }
    if (![(TIKeyboardInputManagerShapeBased *)self inputCount]) {
      [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
    }
    -[TIKeyboardInputManagerChinese deleteFromInput:](&v23, sel_deleteFromInput_, a3, self, TIKeyboardInputManagerShapeBased, v24.receiver, v24.super_class);
  id v10 = };
LABEL_22:
  return v10;
}

- (void)cancelCandidatesThread
{
  id v2 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v2 cancel];
}

- (id)candidateResultSet
{
  if ([(TIKeyboardInputManagerShapeBased *)self shouldSkipCandidateSelection]) {
    goto LABEL_2;
  }
  id v4 = [(TIKeyboardInputManagerShapeBased *)self searchString];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    objc_super v6 = [(TIKeyboardInputManagerShapeBased *)self searchString];
    uint64_t v7 = [v6 length];

    if (!v7)
    {
LABEL_2:
      objc_super v3 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = [(TIKeyboardInputManagerShapeBased *)self searchString];
    BOOL v9 = [(TIKeyboardInputManagerShapeBased *)self updateCandidatesWithTIWordSearch:v8 predictionEnabled:0];

    if (!v9) {
      goto LABEL_6;
    }
  }
  else if (![(TIKeyboardInputManagerChinese *)self updateCompletionCandidatesIfAppropriate])
  {
LABEL_6:
    objc_super v3 = [MEMORY[0x263F7E638] dummySet];
    goto LABEL_9;
  }
  id v10 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  objc_super v3 = [(TIKeyboardInputManagerMecabra *)self candidateResultSetFromWordSearchCandidateResultSet:v10];

LABEL_9:
  return v3;
}

- (BOOL)updateCandidatesWithTIWordSearch:(id)a3 predictionEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = (objc_class *)MEMORY[0x263F7EB80];
  id v7 = a3;
  id v8 = [v6 alloc];
  BOOL v9 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  id v10 = [(TIKeyboardInputManagerShapeBased *)self keyboardState];
  LOBYTE(v15) = [v10 hardwareKeyboardMode];
  unsigned int v11 = (void *)[v8 initWithWordSearch:v9 inputString:v7 keyboardInput:0 segmentBreakIndex:0x7FFFFFFFFFFFFFFFLL predictionEnabled:v4 reanalysisMode:0 autocapitalizationType:0 target:self action:sel_notifyUpdateCandidates_forOperation_ geometryModelData:0 hardwareKeyboardMode:v15 logger:0];

  uint64_t v12 = [v11 results];

  if (v12)
  {
    uint64_t v13 = [v11 results];
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v13];
  }
  else
  {
    uint64_t v13 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v13 performOperationAsync:v11];
  }

  return v12 != 0;
}

- (BOOL)hasCandidates
{
  objc_super v3 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  BOOL v4 = [v3 candidates];

  if ([v4 count] == 1)
  {
    uint64_t v5 = [(TIKeyboardInputManagerShapeBased *)self inputString];
    objc_super v6 = [v4 objectAtIndex:0];
    id v7 = [v6 candidate];
    char v8 = [v5 isEqualToString:v7];

    char v9 = v8 ^ 1;
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (unint64_t)initialSelectedIndex
{
  BOOL v4 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  uint64_t v5 = [v4 candidates];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    id v2 = [(TIKeyboardInputManagerShapeBased *)self inputString];
    if ([v2 length])
    {
      id v7 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerShapeBased;
  id v7 = [(TIKeyboardInputManagerChinese *)&v9 initialSelectedIndex];
  if (v6) {
    goto LABEL_5;
  }
LABEL_6:

  return (unint64_t)v7;
}

- (unsigned)inputCount
{
  if ([(TIKeyboardInputManagerShapeBased *)self shouldSkipCandidateSelection])
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManagerShapeBased;
    return [(TIKeyboardInputManagerShapeBased *)&v6 inputCount];
  }
  else
  {
    BOOL v4 = [(TIKeyboardInputManagerShapeBased *)self searchString];
    unsigned int v3 = [v4 length];
  }
  return v3;
}

- (unsigned)inputIndex
{
  id v2 = [(TIKeyboardInputManagerShapeBased *)self searchString];
  unsigned int v3 = [v2 length];

  return v3;
}

- (id)rawInputString
{
  if ([(TIKeyboardInputManagerShapeBased *)self shouldSkipCandidateSelection])
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManagerShapeBased;
    unsigned int v3 = [(TIKeyboardInputManagerShapeBased *)&v5 rawInputString];
  }
  else
  {
    unsigned int v3 = [(TIKeyboardInputManagerShapeBased *)self searchString];
  }
  return v3;
}

- (NSMutableString)searchString
{
  searchString = self->_searchString;
  if (!searchString)
  {
    BOOL v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    objc_super v5 = self->_searchString;
    self->_searchString = v4;

    searchString = self->_searchString;
  }
  return searchString;
}

@end