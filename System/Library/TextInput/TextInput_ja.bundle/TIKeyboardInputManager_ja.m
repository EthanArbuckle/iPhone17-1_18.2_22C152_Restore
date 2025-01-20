@interface TIKeyboardInputManager_ja
+ (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3;
+ (Class)wordSearchClass;
+ (id)sortTitleFromSort:(unint64_t)a3;
+ (unint64_t)sortFromSortTitle:(id)a3;
+ (void)addFullwidthAnnotationToResultSet:(id)a3;
- (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3;
- (BOOL)filterCandidatesUsingInputIndex;
- (BOOL)flickUsed;
- (BOOL)hasGroupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4 inputString:(id)a5;
- (BOOL)ignoresDeadKeys;
- (BOOL)isEmojiFacemarkMode;
- (BOOL)isKanaPlane;
- (BOOL)isLiveConversion;
- (BOOL)liveConversionEnabled;
- (BOOL)liveConversionForceDisabled;
- (BOOL)liveConversionForceEnabled;
- (BOOL)makeCandidatesWithWordSearch:(id)a3 input:(id)a4 predictionEnabled:(BOOL)a5 reanalysisMode:(BOOL)a6;
- (BOOL)newInputAcceptsUserSelectedCandidate;
- (BOOL)selectFirstCandidate;
- (BOOL)shouldAddModifierSymbolsToWordCharacters;
- (BOOL)shouldExtendPriorWord;
- (BOOL)shouldInvokeLiveConversion:(id)a3;
- (BOOL)shouldOutputFullwidthSpace;
- (BOOL)shouldOutputFullwidthSpaceForKanaABC123;
- (BOOL)suppliesCompletions;
- (BOOL)supportsCandidateGeneration;
- (BOOL)supportsLearning;
- (BOOL)supportsPerRecipientLearning;
- (BOOL)supportsReversionUI;
- (BOOL)supportsSetPhraseBoundary;
- (BOOL)suppressCompletionsForFieldEditor;
- (BOOL)usesAutoDeleteWord;
- (BOOL)usesCandidateSelection;
- (BOOL)usesLiveConversion;
- (NSMutableArray)recentlyCommittedCandidatesForReanalysis;
- (NSOperationQueue)operationQueue;
- (NSString)alternateDisplayString;
- (TICandidateSorter)candidateSorter;
- (TIKeyboardInputManager_ja)initWithConfig:(id)a3 keyboardState:(id)a4;
- (TISmartPunctuationController)smartPunctuationController;
- (id)_convertStringWithBoundary:(unint64_t)a3;
- (id)_inputString;
- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6;
- (id)candidateResultSet;
- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4;
- (id)candidateResultSetFromWordSearchCandidateResultSet:(id)a3;
- (id)defaultCandidate;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)dictionaryInputMode;
- (id)didAcceptCandidate:(id)a3;
- (id)geometryModelData;
- (id)getInputStringFromTopCandidate;
- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4;
- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4 inputString:(id)a5;
- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4;
- (id)handleKeyboardInput:(id)a3;
- (id)indexTitlesForGroupTitles:(id)a3 sortingMethod:(id)a4;
- (id)inputString;
- (id)keyEventMap;
- (id)keyboardBehaviors;
- (id)liveConversionTextInputManager;
- (id)rawInputString;
- (id)remainingInput;
- (id)sortingMethods;
- (id)stringByConvertingPunctuationForInput:(id)a3 isLockedInput:(BOOL)a4;
- (id)syllableSeparator;
- (id)titleForSortingMethod:(id)a3;
- (id)wordCharacters;
- (id)wordSearch;
- (unint64_t)actualInputIndex;
- (unint64_t)autoquoteType;
- (unint64_t)initialSelectedIndex;
- (unint64_t)phraseBoundary;
- (unint64_t)remainingInputLengthOfCandidate:(id)a3;
- (unint64_t)remainingInputLengthOfString:(id)a3 index:(unint64_t)a4 candidate:(id)a5;
- (unsigned)inputCount;
- (unsigned)inputIndex;
- (void)_addInput:(id)a3 point:(CGPoint)a4;
- (void)_cancelCandidatesThread;
- (void)_deleteFromInput;
- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4;
- (void)addRecentlyCommittedCandidatesForReanalysis:(void *)a3;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (void)clearDynamicDictionary;
- (void)clearInput;
- (void)commitComposition;
- (void)dealloc;
- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5;
- (void)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4 completion:(id)a5;
- (void)initImplementation;
- (void)inputLocationChanged;
- (void)lastAcceptedCandidateCorrected;
- (void)loadFavoniusTypingModel;
- (void)lockAnyDrawInputResults;
- (void)mecabraLearningValidator:(id)a3;
- (void)preferencesDidChange:(id)a3;
- (void)resume;
- (void)setAlternateDisplayString:(id)a3;
- (void)setAutoCorrects:(BOOL)a3;
- (void)setFilterCandidatesUsingInputIndex:(BOOL)a3;
- (void)setFlickUsed:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setIsEmojiFacemarkMode:(BOOL)a3;
- (void)setIsKanaPlane:(BOOL)a3;
- (void)setLearnsCorrection:(BOOL)a3;
- (void)setLiveConversionForceDisabled:(BOOL)a3;
- (void)setLiveConversionForceEnabled:(BOOL)a3;
- (void)setPhraseBoundary:(unint64_t)a3;
- (void)setSelectFirstCandidate:(BOOL)a3;
- (void)suspend;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
- (void)syncToLayoutState:(id)a3;
@end

@implementation TIKeyboardInputManager_ja

- (TIKeyboardInputManager_ja)initWithConfig:(id)a3 keyboardState:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_ja;
  v4 = [(TIKeyboardInputManagerMecabra *)&v11 initWithConfig:a3 keyboardState:a4];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    recentlyCommittedCandidatesForReanalysis = v4->_recentlyCommittedCandidatesForReanalysis;
    v4->_recentlyCommittedCandidatesForReanalysis = v5;

    v7 = (TISmartPunctuationController *)objc_alloc_init(MEMORY[0x263F7E6D0]);
    smartPunctuationController = v4->_smartPunctuationController;
    v4->_smartPunctuationController = v7;

    [(TISmartPunctuationController *)v4->_smartPunctuationController setAutoQuoteType:1];
    [(TISmartPunctuationController *)v4->_smartPunctuationController setSmartDashesEnabled:0];
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v4 selector:sel_preferencesDidChange_ name:*MEMORY[0x263F7E858] object:0];

    [(TIKeyboardInputManager_ja *)v4 preferencesDidChange:0];
    [(TIKeyboardInputManager_ja *)v4 setFlickUsed:0];
  }
  return v4;
}

- (void)initImplementation
{
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98])) {
    operator new();
  }
  return *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
}

- (id)keyEventMap
{
  v3 = [(TIKeyboardInputManager_ja *)self keyboardState];
  int v4 = [v3 hardwareKeyboardMode];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F7E578]);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManager_ja;
    id v5 = [(TIKeyboardInputManager_ja *)&v7 keyEventMap];
  }
  return v5;
}

- (id)dictionaryInputMode
{
  return (id)[MEMORY[0x263F7EA88] inputModeWithIdentifier:@"en_US"];
}

- (void)loadFavoniusTypingModel
{
  if (self->_isCandidateSelectionSuppressed)
  {
    v4.receiver = self;
    v4.super_class = (Class)TIKeyboardInputManager_ja;
    [(TIKeyboardInputManager_ja *)&v4 loadFavoniusTypingModel];
  }
  else
  {
    uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
    v3 = *(std::__shared_weak_count **)(v2 + 240);
    *(void *)(v2 + 232) = 0;
    *(void *)(v2 + 240) = 0;
    if (v3)
    {
      std::__shared_weak_count::__release_shared[abi:nn180100](v3);
    }
  }
}

- (void)dealloc
{
  [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:0];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja;
  [(TIKeyboardInputManagerMecabra *)&v4 dealloc];
}

- (void)resume
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_mecabraLearningValidator_ name:*MEMORY[0x263F8C558] object:0];

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja;
  [(TIKeyboardInputManagerMecabra *)&v4 resume];
}

- (void)suspend
{
  [(TIWordSearch *)self->_kbws resetPreviousWord];
  [(TIWordSearch *)self->_kbws clearCache];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F8C558] object:0];

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja;
  [(TIKeyboardInputManagerMecabra *)&v4 suspend];
}

- (BOOL)supportsPerRecipientLearning
{
  return 1;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v10)
  {
    objc_super v11 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v11 syncToKeyboardState:v8 from:v9 afterContextChange:v5];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TIKeyboardInputManager_ja;
    [(TIKeyboardInputManagerMecabra *)&v13 syncToKeyboardState:v8 from:v9 afterContextChange:v5];
    int isCandidateSelectionSuppressed = self->_isCandidateSelectionSuppressed;
    if (isCandidateSelectionSuppressed != [v8 suppressingCandidateSelection])
    {
      self->_int isCandidateSelectionSuppressed = [v8 suppressingCandidateSelection];
      [(TIKeyboardInputManager_ja *)self loadFavoniusTypingModel];
    }
  }
}

- (BOOL)usesLiveConversion
{
  int v3 = [(TIKeyboardInputManager_ja *)self liveConversionEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(TIKeyboardInputManager_ja *)self inHardwareKeyboardMode];
  }
  return v3;
}

- (id)wordSearch
{
  return self->_kbws;
}

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (BOOL)ignoresDeadKeys
{
  return 1;
}

- (id)liveConversionTextInputManager
{
  return 0;
}

- (void)setIsEmojiFacemarkMode:(BOOL)a3
{
  if (!a3) {
    [(TIKeyboardInputManager_ja *)self setAlternateDisplayString:0];
  }
  self->_isEmojiFacemarkMode = a3;
}

- (void)syncToLayoutState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ja;
  id v4 = a3;
  [(TIKeyboardInputManager_ja *)&v6 syncToLayoutState:v4];
  uint64_t v5 = objc_msgSend(v4, "isKanaPlane", v6.receiver, v6.super_class);

  [(TIKeyboardInputManager_ja *)self setIsKanaPlane:v5];
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_super v6 = [v5 handleKeyboardInput:v4];

  if (v6) {
    goto LABEL_33;
  }
  objc_super v7 = [v4 string];
  if ([v7 isEqualToString:@"\n"]) {
    goto LABEL_5;
  }
  id v8 = [v4 string];
  if ([v8 isEqualToString:@" "])
  {

LABEL_5:
LABEL_6:
    [(TIWordSearch *)self->_kbws resetPreviousWord];
    goto LABEL_7;
  }
  v26 = [v4 string];
  char v27 = [v26 isEqualToString:@"　"];

  if (v27) {
    goto LABEL_6;
  }
LABEL_7:
  id v9 = [v4 string];
  int v10 = [v9 isEqualToString:@"\x1B"];

  if (v10)
  {
    [(TIKeyboardInputManager_ja *)self clearInput];
    objc_super v6 = 0;
    goto LABEL_33;
  }
  if (![(TIKeyboardInputManager_ja *)self shouldInvokeLiveConversion:v4]) {
    goto LABEL_13;
  }
  objc_super v11 = [(TIKeyboardInputManager_ja *)self liveConversionTextInputManager];
  [(TIKeyboardInputManagerMecabra *)self composeTextWith:v11];

  if ([(TIKeyboardInputManager_ja *)self inputCount])
  {
    id v12 = objc_alloc_init(MEMORY[0x263F7E648]);
    objc_super v13 = [(TIKeyboardInputManager_ja *)self rawInputString];
    [v12 setString:v13];

    id v14 = objc_alloc(MEMORY[0x263F7EAB8]);
    v15 = [(TIKeyboardInputManager_ja *)self keyboardState];
    v16 = (void *)[v14 initWithKeyboardState:v15];

    v17 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v17 addInput:v12 withContext:v16];
  }
  v18 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_super v6 = [v18 handleKeyboardInput:v4];

  if (!v6)
  {
LABEL_13:
    v19 = [(TIKeyboardInputManager_ja *)self keyboardState];
    char v20 = [v19 hardwareKeyboardMode];

    if (v20) {
      goto LABEL_32;
    }
    v21 = [(TIKeyboardInputManager_ja *)self keyboardState];
    v22 = [v21 layoutState];
    uint64_t v23 = [v22 userInterfaceIdiom];

    v24 = [v4 string];
    v25 = v24;
    if (v23 == 1)
    {
      if ([v24 isEqualToString:@" "])
      {

        goto LABEL_24;
      }
      v30 = [v4 string];
      int v31 = [v30 isEqualToString:@"　"];

      if (v31)
      {
LABEL_24:
        if (![(TIKeyboardInputManager_ja *)self isKanaPlane])
        {
          v32 = [(TIKeyboardInputManager_ja *)self keyboardState];
          int v33 = [v32 shiftState];

          if (v33 != 1) {
            goto LABEL_32;
          }
        }
        if ([(TIKeyboardInputManager_ja *)self shouldOutputFullwidthSpace]) {
          v29 = @"　";
        }
        else {
          v29 = @" ";
        }
        goto LABEL_29;
      }
LABEL_32:
      v36.receiver = self;
      v36.super_class = (Class)TIKeyboardInputManager_ja;
      objc_super v6 = [(TIKeyboardInputManagerMecabra *)&v36 handleKeyboardInput:v4];
      goto LABEL_33;
    }
    int v28 = [v24 isEqualToString:@"　"];

    if (!v28) {
      goto LABEL_32;
    }
    if ([(TIKeyboardInputManager_ja *)self isKanaPlane])
    {
      if (![(TIKeyboardInputManager_ja *)self shouldOutputFullwidthSpace])
      {
LABEL_22:
        v29 = @" ";
LABEL_29:
        [v4 setString:v29];
        goto LABEL_32;
      }
    }
    else if (![(TIKeyboardInputManager_ja *)self shouldOutputFullwidthSpaceForKanaABC123])
    {
      goto LABEL_22;
    }
    v34 = [v4 string];
    [v4 setString:v34];

    goto LABEL_32;
  }
LABEL_33:

  return v6;
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v9 = *(void *)&a4;
  id v11 = a3;
  id v12 = v11;
  if (v11 && [v11 length])
  {
    if ([(TIKeyboardInputManager_ja *)self shouldSkipCandidateSelection])
    {
      v17.receiver = self;
      v17.super_class = (Class)TIKeyboardInputManager_ja;
      -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v17, sel_addInput_flags_point_firstDelete_, v12, v9, a6, x, y);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if ((v9 & 8) != 0) {
        *a6 = 1;
      }
    }
    else
    {
      [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:0];
      [(TIKeyboardInputManager_ja *)self setFilterCandidatesUsingInputIndex:0];
      if ([v12 length] == 1)
      {
        -[TIKeyboardInputManager_ja _addInput:point:](self, "_addInput:point:", v12, x, y);
      }
      else if ([v12 length])
      {
        unint64_t v14 = 0;
        do
        {
          v15 = objc_msgSend(v12, "substringWithRange:", v14, 1);
          -[TIKeyboardInputManager_ja _addInput:point:](self, "_addInput:point:", v15, x, y);

          ++v14;
        }
        while ([v12 length] > v14);
      }
      id v13 = v12;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)_addInput:(id)a3 point:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  uint64_t v11 = 0;
  [(TIKeyboardInputManager_ja *)self _cancelCandidatesThread];
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ja;
  id v8 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v10, sel_addInput_flags_point_firstDelete_, v7, 0, &v11, x, y);
  unsigned int v9 = [(TIKeyboardInputManager_ja *)self inputCount];
  if (v9 == [(TIKeyboardInputManager_ja *)self inputIndex]) {
    self->_isPhraseBoundarySet = 0;
  }
}

- (void)_deleteFromInput
{
  uint64_t v5 = 0;
  [(TIKeyboardInputManager_ja *)self _cancelCandidatesThread];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja;
  id v3 = [(TIKeyboardInputManager_ja *)&v4 deleteFromInput:&v5];
}

- (void)setInput:(id)a3
{
  id v4 = a3;
  [(TIKeyboardInputManager_ja *)self _cancelCandidatesThread];
  self->_isPhraseBoundarySet = 0;
  [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:0];
  [(TIKeyboardInputManager_ja *)self setFilterCandidatesUsingInputIndex:0];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_ja;
  [(TIKeyboardInputManager_ja *)&v5 setInput:v4];
}

- (id)deleteFromInput:(unint64_t *)a3
{
  if ([(TIKeyboardInputManager_ja *)self shouldSkipCandidateSelection])
  {
    v12.receiver = self;
    v12.super_class = (Class)TIKeyboardInputManager_ja;
    objc_super v5 = [(TIKeyboardInputManager_ja *)&v12 deleteFromInput:a3];
  }
  else
  {
    if ([(TIKeyboardInputManager_ja *)self isEmojiFacemarkMode])
    {
      [(TIKeyboardInputManager_ja *)self clearInput];
    }
    else
    {
      self->_remainingInputLength = 0;
      objc_super v6 = [(TIKeyboardInputManager_ja *)self keyboardState];
      id v7 = [v6 documentState];
      [v7 selectedRangeInMarkedText];
      unint64_t v9 = v8;

      if (v9 <= 1) {
        unint64_t v10 = 1;
      }
      else {
        unint64_t v10 = v9;
      }
      if (a3) {
        *a3 = v10;
      }
      do
      {
        [(TIKeyboardInputManager_ja *)self _deleteFromInput];
        --v10;
      }
      while (v10);
      if (![(TIKeyboardInputManager_ja *)self inputCount])
      {
        [(TIKeyboardInputManager_ja *)self setFlickUsed:0];
        [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
      }
      [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:0];
      [(TIKeyboardInputManager_ja *)self setFilterCandidatesUsingInputIndex:0];
    }
    objc_super v5 = 0;
  }
  return v5;
}

- (void)clearInput
{
  [(TIKeyboardInputManager_ja *)self setFlickUsed:0];
  [(TIKeyboardInputManager_ja *)self _cancelCandidatesThread];
  [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
  [(TIWordSearch *)self->_kbws clearCache];
  self->_isPhraseBoundarySet = 0;
  [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:0];
  [(TIKeyboardInputManager_ja *)self setFilterCandidatesUsingInputIndex:0];
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja;
  [(TIKeyboardInputManagerMecabra *)&v3 clearInput];
}

- (void)inputLocationChanged
{
  [(TIKeyboardInputManager_ja *)self _cancelCandidatesThread];
  [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
  [(TIWordSearch *)self->_kbws clearCache];
  self->_isPhraseBoundarySet = 0;
  [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:0];
  [(TIKeyboardInputManager_ja *)self setFilterCandidatesUsingInputIndex:0];
  [(TIWordSearch *)self->_kbws resetPreviousWord];
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja;
  [(TIKeyboardInputManager_ja *)&v3 inputLocationChanged];
}

- (id)rawInputString
{
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    v12.receiver = self;
    v12.super_class = (Class)TIKeyboardInputManager_ja;
    unint64_t v9 = [(TIKeyboardInputManager_ja *)&v12 inputString];
    goto LABEL_10;
  }
  objc_super v3 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  int v4 = [v3 hasKindOf:objc_opt_class()];

  if (v4)
  {
    objc_super v5 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    objc_super v6 = [v5 candidates];
    id v7 = [v6 firstObject];

    if (!v7)
    {
      unint64_t v10 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      unint64_t v9 = [v10 asSearchString];

      goto LABEL_9;
    }
    uint64_t v8 = [v7 input];
  }
  else
  {
    id v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    uint64_t v8 = [v7 asSearchString];
  }
  unint64_t v9 = (void *)v8;
LABEL_9:

LABEL_10:
  return v9;
}

- (unsigned)inputCount
{
  if ([(TIKeyboardInputManager_ja *)self shouldSkipCandidateSelection])
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_ja;
    return [(TIKeyboardInputManager_ja *)&v6 inputCount];
  }
  else
  {
    int v4 = [(TIKeyboardInputManager_ja *)self _inputString];
    unsigned int v3 = [v4 length];
  }
  return v3;
}

- (unsigned)inputIndex
{
  unsigned int v3 = [(TIKeyboardInputManager_ja *)self alternateDisplayString];
  int v4 = v3;
  if (!v3 || (uint64_t v5 = [v3 length]) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManager_ja;
    LODWORD(v5) = [(TIKeyboardInputManager_ja *)&v7 inputIndex];
  }

  return v5;
}

- (id)_inputString
{
  unsigned int v3 = [(TIKeyboardInputManager_ja *)self alternateDisplayString];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [(TIKeyboardInputManager_ja *)self rawInputString];
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)inputString
{
  if ([(TIKeyboardInputManager_ja *)self shouldSkipCandidateSelection])
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManager_ja;
    unsigned int v3 = [(TIKeyboardInputManager_ja *)&v5 inputString];
  }
  else
  {
    unsigned int v3 = [(TIKeyboardInputManager_ja *)self _inputString];
  }
  return v3;
}

- (id)_convertStringWithBoundary:(unint64_t)a3
{
  id v4 = [(TIKeyboardInputManager_ja *)self _convertString];
  objc_super v5 = v4;
  if (a3 && [v4 length] > a3)
  {
    uint64_t v6 = [v5 substringToIndex:a3];

    objc_super v5 = (void *)v6;
  }
  return v5;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (id)wordCharacters
{
  return (id)[MEMORY[0x263F7E520] kanaWordCharacters];
}

- (void)setAutoCorrects:(BOOL)a3
{
}

- (BOOL)shouldOutputFullwidthSpace
{
  unsigned int v3 = [(TIKeyboardInputManager_ja *)self keyboardState];
  char v4 = [v3 hardwareKeyboardMode];

  if (v4) {
    return 0;
  }
  uint64_t v6 = [(TIKeyboardInputManager_ja *)self keyboardState];
  char v5 = [v6 shouldOutputFullwidthSpace];

  objc_super v7 = [(TIKeyboardInputManager_ja *)self keyboardState];
  uint64_t v8 = [v7 layoutState];
  if ([v8 isAlphabeticPlane])
  {
    unint64_t v9 = [(TIKeyboardInputManager_ja *)self keyboardState];
    BOOL v10 = [v9 shiftState] == 1;

    return v5 ^ v10;
  }
  else
  {
  }
  return v5;
}

- (BOOL)shouldOutputFullwidthSpaceForKanaABC123
{
  if (![(TIKeyboardInputManager_ja *)self shouldOutputFullwidthSpace]) {
    return 0;
  }
  unsigned int v3 = [(TIKeyboardInputManager_ja *)self keyboardState];
  char v4 = [v3 documentState];
  char v5 = [v4 contextBeforeInput];
  uint64_t v6 = [v5 _lastGrapheme];

  if (![v6 length]) {
    goto LABEL_5;
  }
  if ([v6 _containsFullwidthLettersAndNumbersOnly]) {
    char v7 = [v6 _containsCJScripts] ^ 1;
  }
  else {
LABEL_5:
  }
    char v7 = 0;
  char v8 = [v6 isEqualToString:@"　"];

  BOOL result = 1;
  if ((v7 & 1) == 0 && (v8 & 1) == 0) {
    return 0;
  }
  return result;
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  unint64_t v3 = a3;
  self->_isPhraseBoundarySet = [(TIKeyboardInputManager_ja *)self inputCount] != a3;
  [(TIKeyboardInputManager_ja *)self _cancelCandidatesThread];
  char v5 = [(TIKeyboardInputManager_ja *)self keyboardState];
  uint64_t v6 = [v5 documentState];
  [v6 selectedRangeInMarkedText];
  uint64_t v8 = v7;

  if (v8)
  {
    unint64_t v9 = (v8 + v3);
    BOOL v10 = [(TIKeyboardInputManager_ja *)self inputString];
    unint64_t v11 = [v10 length];

    if (v9 <= v11) {
      unint64_t v3 = v9;
    }
  }
  [(TIKeyboardInputManager_ja *)self setInputIndex:v3];
  [(TIKeyboardInputManager_ja *)self setFilterCandidatesUsingInputIndex:self->_isPhraseBoundarySet];
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    id v12 = [(TIKeyboardInputManagerMecabra *)self _convertInputsToSyntheticInputWithOffset:v3];
    [(TIKeyboardInputManagerMecabra *)self _replaceComposingInputWithSyntheticInput:v12 internalIndex:v3];
  }
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  if ([(TIKeyboardInputManager_ja *)self usesLiveConversion])
  {
    uint64_t v7 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

    if (!v7) {
      [(TIKeyboardInputManager_ja *)self setAlternateDisplayString:0];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_ja;
  [(TIKeyboardInputManagerMecabra *)&v8 adjustPhraseBoundaryInForwardDirection:v5 granularity:v4];
}

- (unint64_t)phraseBoundary
{
  return [(TIKeyboardInputManager_ja *)self inputIndex];
}

- (unint64_t)actualInputIndex
{
  unint64_t v3 = [(TIKeyboardInputManager_ja *)self inputString];
  unsigned int v4 = [(TIKeyboardInputManager_ja *)self inputIndex];
  if (v4
    && (unsigned int v5 = v4, [(TIKeyboardInputManager_ja *)self filterCandidatesUsingInputIndex]))
  {
    unint64_t v6 = v5;
  }
  else
  {
    unint64_t v6 = [v3 length];
  }
  unint64_t remainingInputLength = self->_remainingInputLength;
  if (remainingInputLength >= v6 || remainingInputLength == 0) {
    unint64_t remainingInputLength = 0;
  }
  unint64_t v9 = v6 - remainingInputLength;

  return v9;
}

- (id)remainingInput
{
  unint64_t v3 = [(TIKeyboardInputManager_ja *)self inputString];
  unint64_t v4 = [(TIKeyboardInputManager_ja *)self actualInputIndex];
  if (v4 >= [v3 length])
  {
    unsigned int v5 = 0;
  }
  else
  {
    unsigned int v5 = [v3 substringFromIndex:v4];
  }

  return v5;
}

- (id)candidateResultSet
{
  if ([(TIKeyboardInputManager_ja *)self shouldSkipCandidateSelection])
  {
    unint64_t v3 = 0;
  }
  else
  {
    if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
    {
      unint64_t v4 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      unsigned int v5 = [v4 asSearchString];
    }
    else
    {
      unsigned int v5 = [(TIKeyboardInputManager_ja *)self _convertString];
    }
    unint64_t v6 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    uint64_t v7 = [(TIKeyboardInputManager_ja *)self keyboardState];
    objc_super v8 = [v7 documentState];
    unint64_t v9 = [v8 selectedText];

    uint64_t v10 = [v9 length];
    if ((unint64_t)(v10 - 1) >= *MEMORY[0x263F7EBA0])
    {
      [(TIKeyboardInputManagerMecabra *)self usesComposingInput];
      uint64_t v14 = 0;
    }
    else
    {
      unint64_t v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      uint64_t v12 = [v9 rangeOfCharacterFromSet:v11];

      unsigned int v13 = ![(TIKeyboardInputManagerMecabra *)self usesComposingInput];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = 0;
      }
      if ((v13 & 1) == 0 && v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        uint64_t v14 = [v15 totalDrawSamples] == 0;
      }
    }
    if (([v5 isEqualToString:*MEMORY[0x263F7EC00]] & 1) != 0
      || ([v5 isEqualToString:*MEMORY[0x263F7EC08]] & 1) != 0)
    {
      uint64_t v16 = 1;
    }
    else
    {
      uint64_t v16 = [v5 isEqualToString:*MEMORY[0x263F7EBF8]];
    }
    [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:v16];
    if (v14)
    {
      objc_super v17 = [(TIKeyboardInputManager_ja *)self keyboardState];
      v18 = [v17 documentState];
      v19 = [v18 selectedText];

      if ([v19 _containsKatakanaOrKanji])
      {
        char v20 = [(TIKeyboardInputManager_ja *)self recentlyCommittedCandidatesForReanalysis];
        v21 = [(TIKeyboardInputManagerMecabra *)self adaptationContextReadingForReanalysisString:v19 fromRecentlyCommittedCandidates:v20];

        if (v21)
        {
          id v22 = v21;
        }
        else
        {
          id v22 = [v19 _stringByTranscribingFromLanguage:@"ja_JP"];
        }
        id v24 = v22;

        v19 = v24;
      }
      if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
      {
        id v25 = objc_alloc(MEMORY[0x263F7EA18]);
        v26 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        char v27 = [v26 sourceKeyboardState];
        int v28 = (void *)[v25 initWithSourceKeyboardState:v27];

        id v29 = objc_alloc(MEMORY[0x263F7EA28]);
        v30 = (void *)[v29 initWithCommittedText:v19 syllables:MEMORY[0x263EFFA68]];
        [v28 composeNew:v30];

        BOOL v23 = 1;
        unint64_t v6 = v28;
      }
      else
      {
        BOOL v23 = 1;
      }
    }
    else
    {
      if ([(TIKeyboardInputManager_ja *)self isEmojiFacemarkMode]
        || ![(TIKeyboardInputManager_ja *)self filterCandidatesUsingInputIndex])
      {
        v19 = v5;
      }
      else
      {
        v19 = [(TIKeyboardInputManager_ja *)self _convertStringWithBoundary:[(TIKeyboardInputManager_ja *)self inputIndex]];
      }
      BOOL v23 = ([(TIKeyboardInputManager_ja *)self inHardwareKeyboardMode] & 1) == 0
         && !self->_isPhraseBoundarySet;
    }
    if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
    {

      v19 = 0;
    }
    BOOL v31 = [(TIKeyboardInputManager_ja *)self makeCandidatesWithWordSearch:v19 input:v6 predictionEnabled:v23 reanalysisMode:v14];
    unint64_t v3 = [MEMORY[0x263F7E638] dummySet];
    if (v31)
    {
      v32 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
      int v33 = [(TIKeyboardInputManager_ja *)self rawInputString];
      [(TIKeyboardInputManagerMecabra *)self updateProactiveCandidatesForCandidateResultSet:v32 withInput:v33];

      v34 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
      uint64_t v35 = [(TIKeyboardInputManager_ja *)self candidateResultSetFromWordSearchCandidateResultSet:v34];

      if ([(TIKeyboardInputManager_ja *)self isEmojiFacemarkMode])
      {
        objc_super v36 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
        v37 = [v36 candidates];
        v38 = [v37 firstObject];
        v39 = [v38 candidate];
        [(TIKeyboardInputManager_ja *)self setAlternateDisplayString:v39];
      }
      unint64_t v3 = (void *)v35;
    }
    else if ([(TIKeyboardInputManager_ja *)self isEmojiFacemarkMode])
    {
      [(TIKeyboardInputManager_ja *)self setAlternateDisplayString:*MEMORY[0x263F7EBF8]];
    }
  }
  return v3;
}

- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  unint64_t v9 = v8;
  if ([(TIKeyboardInputManager_ja *)self shouldOmitEmojiCandidates])
  {
    uint64_t v10 = [v8 _arrayByFilteringEmojiCandidates:0];
    unint64_t v9 = [v10 _arrayByFilteringCandidatesForNonExtendedView];
  }
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_ja;
  unint64_t v11 = [(TIKeyboardInputManager_ja *)&v13 candidateResultSetFromCandidates:v9 proactiveTriggers:v7];
  +[TIKeyboardInputManager_ja addFullwidthAnnotationToResultSet:v11];

  return v11;
}

+ (void)addFullwidthAnnotationToResultSet:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFF9C0]);
  unsigned int v5 = [v3 candidates];
  id v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v23 = v3;
  id v7 = [v3 candidates];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_super v13 = [v12 candidate];
            [v6 addObject:v13];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v14 = [v23 candidates];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v24 + 1) + 8 * v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v20 = v19;
            v21 = [v20 candidate];
            if ([v21 _containsFullwidthLettersAndSymbolsOnly])
            {
              id v22 = [v21 _stringByConvertingFromFullWidthToHalfWidth];
              if (([v21 isEqualToString:v22] & 1) == 0
                && [v6 containsObject:v22])
              {
                [v20 setAnnotationText:@"UI-Fullwidth"];
              }
            }
          }
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }
}

- (id)geometryModelData
{
  if ([(TIKeyboardInputManager_ja *)self isEmojiFacemarkMode])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManager_ja;
    id v3 = [(TIKeyboardInputManagerMecabra *)&v5 geometryModelData];
  }
  return v3;
}

- (BOOL)makeCandidatesWithWordSearch:(id)a3 input:(id)a4 predictionEnabled:(BOOL)a5 reanalysisMode:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = *MEMORY[0x263F7EBF8];
  if ([v10 isEqualToString:*MEMORY[0x263F7EBF8]])
  {
    id v13 = (id)*MEMORY[0x263F7EC08];

    id v10 = v13;
  }
  uint64_t v14 = [v11 asSearchString];
  int v15 = [v14 isEqualToString:v12];

  BOOL v31 = a6;
  if (v15)
  {
    uint64_t v16 = [(id)*MEMORY[0x263F7EC08] _asTypeInputs];

    long long v30 = (void *)v16;
  }
  else
  {
    long long v30 = v11;
  }
  uint64_t v17 = [(TIKeyboardInputManager_ja *)self keyboardState];
  -[TIWordSearch setSupportsPairedPunctutationInput:](self->_kbws, "setSupportsPairedPunctutationInput:", [v17 hardwareKeyboardMode] ^ 1);

  uint64_t v18 = [(TIKeyboardInputManager_ja *)self geometryModelData];
  v19 = [TIWordSearchJapaneseOperationGetCandidates alloc];
  kbws = self->_kbws;
  v21 = [(TIKeyboardInputManager_ja *)self contextBeforeWithDesiredLength:20];
  BOOL v22 = [(TIKeyboardInputManager_ja *)self flickUsed];
  LOBYTE(v17) = self->_isPhraseBoundarySet;
  BOOL v23 = [(TIKeyboardInputManager_ja *)self keyboardState];
  BYTE2(v29) = [v23 hardwareKeyboardMode];
  BYTE1(v29) = (_BYTE)v17;
  LOBYTE(v29) = v22;
  LOBYTE(v28) = v31;
  long long v24 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v19, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", kbws, v10, v30, v21, 0x7FFFFFFFFFFFFFFFLL, v7, v28, 0, self, sel__notifyUpdateCandidates_forOperation_, v18, v29, 0);

  [(TIWordSearchJapaneseOperationGetCandidates *)v24 setAllowIncompleteRomaji:[(TIKeyboardInputManager_ja *)self inHardwareKeyboardMode]];
  [(TIWordSearchOperationGetCandidates *)v24 checkForCachedResults];
  long long v25 = [(TIWordSearchJapaneseOperationGetCandidates *)v24 results];

  if (v25)
  {
    long long v26 = [(TIWordSearchJapaneseOperationGetCandidates *)v24 results];
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v26];
  }
  else
  {
    [(TIWordSearch *)self->_kbws performOperationAsync:v24];
  }

  return v25 != 0;
}

- (void)_cancelCandidatesThread
{
}

- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(TIKeyboardInputManager_ja *)self shouldSkipCandidateSelection])
  {
    uint64_t v8 = [v6 candidates];
    uint64_t v9 = [v7 inputString];
    uint64_t v10 = *MEMORY[0x263F7EC00];
    if (([v9 isEqualToString:*MEMORY[0x263F7EC00]] & 1) == 0)
    {
      id v11 = [v7 inputString];
      uint64_t v12 = *MEMORY[0x263F7EC08];
      if (([v11 isEqualToString:*MEMORY[0x263F7EC08]] & 1) == 0)
      {
        id v13 = [v7 inputString];
        uint64_t v14 = *MEMORY[0x263F7EBF8];
        if (([v13 isEqualToString:*MEMORY[0x263F7EBF8]] & 1) == 0)
        {
          uint64_t v28 = v14;
          long long v30 = v13;
          int v15 = [v7 keyboardInput];
          uint64_t v16 = [v15 asInlineText];
          if (([v16 isEqualToString:v10] & 1) == 0)
          {
            long long v26 = v16;
            long long v27 = v15;
            uint64_t v17 = [v7 keyboardInput];
            uint64_t v18 = [v17 asInlineText];
            if (([v18 isEqualToString:v12] & 1) == 0)
            {
              long long v24 = [v7 keyboardInput];
              long long v25 = [v24 asInlineText];
              char v29 = [v25 isEqualToString:v28];

              if ((v29 & 1) == 0) {
                goto LABEL_14;
              }
              goto LABEL_13;
            }

            int v15 = v27;
          }

          id v13 = v30;
        }
      }
    }

LABEL_13:
    [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:1];
    v19 = [v8 firstObject];
    id v20 = [v19 candidate];
    [(TIKeyboardInputManager_ja *)self setAlternateDisplayString:v20];

LABEL_14:
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v6];
    [(TIKeyboardInputManager_ja *)self updateState];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __66__TIKeyboardInputManager_ja__notifyUpdateCandidates_forOperation___block_invoke;
    v35[3] = &unk_2650FA988;
    v35[4] = self;
    v21 = (void *)MEMORY[0x24563C640](v35);
    objc_initWeak(&location, self);
    BOOL v22 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __66__TIKeyboardInputManager_ja__notifyUpdateCandidates_forOperation___block_invoke_2;
    v31[3] = &unk_2650FA9B0;
    objc_copyWeak(&v33, &location);
    id v32 = v21;
    id v23 = v21;
    [(TIKeyboardInputManagerMecabra *)self addStickers:v22 withCompletionHandler:v31];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

    goto LABEL_15;
  }
  [(TIKeyboardInputManager_ja *)self closeCandidateGenerationContextWithResults:0];
LABEL_15:
}

- (id)candidateResultSetFromWordSearchCandidateResultSet:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ja;
  id v4 = [(TIKeyboardInputManagerMecabra *)&v6 candidateResultSetFromWordSearchCandidateResultSet:a3];
  if ([(TIKeyboardInputManager_ja *)self selectFirstCandidate])
  {
    [v4 setInitialSelectedIndex:0];
    [(TIKeyboardInputManager_ja *)self setSelectFirstCandidate:0];
  }
  return v4;
}

- (TICandidateSorter)candidateSorter
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  candidateSorter = v2->_candidateSorter;
  if (!candidateSorter)
  {
    id v4 = objc_alloc_init(TICandidateSorter);
    objc_super v5 = v2->_candidateSorter;
    v2->_candidateSorter = v4;

    candidateSorter = v2->_candidateSorter;
  }
  objc_super v6 = candidateSorter;
  objc_sync_exit(v2);

  return v6;
}

- (NSOperationQueue)operationQueue
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  operationQueue = v2->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    objc_super v5 = v2->_operationQueue;
    v2->_operationQueue = v4;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    operationQueue = v2->_operationQueue;
  }
  objc_super v6 = operationQueue;
  objc_sync_exit(v2);

  return v6;
}

+ (id)sortTitleFromSort:(unint64_t)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_2650FAA90[a3];
  }
}

+ (unint64_t)sortFromSortTitle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UI-Sort-Common"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"UI-Sort-Yomi"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"UI-Sort-Radical"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"UI-Sort-Facemark"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"UI-Sort-Emoji"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)sortingMethods
{
  id v3 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  unint64_t v4 = [v3 candidates];

  if (-[TIKeyboardInputManager_ja isEmojiFacemarkMode](self, "isEmojiFacemarkMode") || ![v4 count])
  {
    uint64_t v9 = (void *)MEMORY[0x263EFF8C0];
    objc_super v6 = [(id)objc_opt_class() sortTitleFromSort:0];
    objc_super v5 = [v9 arrayWithObject:v6];
  }
  else
  {
    objc_super v5 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
    objc_super v6 = [(TIKeyboardInputManager_ja *)self inputString];
    for (uint64_t i = 0; i != 5; ++i)
    {
      uint64_t v8 = [(id)objc_opt_class() sortTitleFromSort:kCandidateSorts[i]];
      if ([(TIKeyboardInputManager_ja *)self hasGroupedCandidatesFromCandidates:v4 usingSortingMethod:v8 inputString:v6])
      {
        [v5 addObject:v8];
      }
    }
  }

  return v5;
}

- (id)titleForSortingMethod:(id)a3
{
  id v3 = a3;
  return v3;
}

+ (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3
{
  return [a3 isEqualToString:@"UI-Sort-Common"] ^ 1;
}

- (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3
{
  id v3 = a3;
  char v4 = [(id)objc_opt_class() alwaysShowExtensionCandidatesForSortingMethod:v3];

  return v4;
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4 inputString:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    uint64_t v12 = [(id)objc_opt_class() sortFromSortTitle:v10];
    id v13 = [(TIKeyboardInputManager_ja *)self candidateSorter];
    uint64_t v14 = objc_msgSend(v13, "candidatesFromCandidates:inputString:sortedBy:omittingEmoji:", v9, v11, v12, -[TIKeyboardInputManager_ja shouldOmitEmojiCandidates](self, "shouldOmitEmojiCandidates"));
  }
  else
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TIKeyboardInputManager_ja.mm", 897, @"Invalid parameter not satisfying: %@", @"sortTitle != nil" object file lineNumber description];
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)hasGroupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4 inputString:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    uint64_t v12 = [(id)objc_opt_class() sortFromSortTitle:v10];
    id v13 = [(TIKeyboardInputManager_ja *)self candidateSorter];
    char v14 = objc_msgSend(v13, "hasCandidatesFromCandidates:inputString:sortedBy:omittingEmoji:", v9, v11, v12, -[TIKeyboardInputManager_ja shouldOmitEmojiCandidates](self, "shouldOmitEmojiCandidates"));
  }
  else
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TIKeyboardInputManager_ja.mm", 909, @"Invalid parameter not satisfying: %@", @"sortTitle != nil" object file lineNumber description];
    char v14 = 0;
  }

  return v14;
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TIKeyboardInputManager_ja.mm", 920, @"Invalid parameter not satisfying: %@", @"[NSThread isMainThread]" object file lineNumber description];
  }
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v9 = [(TIKeyboardInputManager_ja *)self inputString];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = [(TIKeyboardInputManager_ja *)self groupedCandidatesFromCandidates:v7 usingSortingMethod:v8 inputString:v9];

  return v10;
}

- (void)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v10)
  {
    if (v11)
    {
      if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
      {
        uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
        [v17 handleFailureInMethod:a2, self, @"TIKeyboardInputManager_ja.mm", 936, @"Invalid parameter not satisfying: %@", @"[NSThread isMainThread]" object file lineNumber description];
      }
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        id v13 = [(TIKeyboardInputManager_ja *)self inputString];
      }
      else
      {
        id v13 = 0;
      }
      char v14 = [(TIKeyboardInputManager_ja *)self operationQueue];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __91__TIKeyboardInputManager_ja_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke;
      v18[3] = &unk_2650FAA00;
      v18[4] = self;
      id v19 = v9;
      id v20 = v10;
      id v21 = v13;
      id v22 = v12;
      id v15 = v13;
      [v14 addOperationWithBlock:v18];
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TIKeyboardInputManager_ja.mm", 931, @"Invalid parameter not satisfying: %@", @"sortTitle != nil" object file lineNumber description];
  }
}

- (id)indexTitlesForGroupTitles:(id)a3 sortingMethod:(id)a4
{
  id v5 = a3;
  if ([a4 isEqual:@"UI-Sort-Yomi"]) {
    id v6 = &unk_26F5E1148;
  }
  else {
    id v6 = v5;
  }

  return v6;
}

- (unint64_t)autoquoteType
{
  return 0;
}

- (BOOL)usesAutoDeleteWord
{
  return 1;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (BOOL)suppliesCompletions
{
  return 1;
}

- (BOOL)suppressCompletionsForFieldEditor
{
  return 1;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)newInputAcceptsUserSelectedCandidate
{
  return 1;
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (BOOL)supportsReversionUI
{
  return 0;
}

- (BOOL)supportsLearning
{
  return 0;
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E5E0]);
  return v2;
}

- (unint64_t)initialSelectedIndex
{
  if ([(TIKeyboardInputManager_ja *)self isEmojiFacemarkMode]) {
    return 0;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)defaultCandidate
{
  if ([(TIKeyboardInputManager_ja *)self inputCount])
  {
    id v3 = [(TIKeyboardInputManager_ja *)self inputString];
    unsigned int v4 = [(TIKeyboardInputManager_ja *)self inputIndex];
    if (v4)
    {
      uint64_t v5 = v4;
      if (v4 < [(TIKeyboardInputManager_ja *)self inputCount])
      {
        if ([(TIKeyboardInputManager_ja *)self filterCandidatesUsingInputIndex])
        {
          uint64_t v6 = [v3 substringToIndex:v5];

          id v3 = (void *)v6;
        }
      }
    }
    if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
    {
      id v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      id v8 = [v7 asSearchString];

      id v9 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      uint64_t v10 = [v9 asSearchTextCursorIndex];

      id v11 = [v8 substringToIndex:v10];
    }
    else
    {
      id v11 = [(TIKeyboardInputManager_ja *)self rawInputString];
    }
    uint64_t v12 = [(TIWordSearch *)self->_kbws candidateForDefault:v3 rawInputString:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (unint64_t)remainingInputLengthOfString:(id)a3 index:(unint64_t)a4 candidate:(id)a5
{
  id v7 = a3;
  id v8 = [a5 input];
  unint64_t v9 = [v8 length];

  if (v9)
  {
    if (!a4) {
      a4 = [v7 length];
    }
    if (a4 >= v9) {
      unint64_t v10 = a4 - v9;
    }
    else {
      unint64_t v10 = 0;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (unint64_t)remainingInputLengthOfCandidate:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManager_ja *)self filterCandidatesUsingInputIndex]) {
    uint64_t v5 = [(TIKeyboardInputManager_ja *)self inputIndex];
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(TIKeyboardInputManager_ja *)self inputString];
  unint64_t v7 = [(TIKeyboardInputManager_ja *)self remainingInputLengthOfString:v6 index:v5 candidate:v4];

  return v7;
}

- (void)preferencesDidChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F7E6C8], "sharedPreferencesController", a3);
  uint64_t v5 = [v4 BOOLForPreferenceKey:*MEMORY[0x263F7E878]];
  uint64_t v6 = [(TIKeyboardInputManager_ja *)self smartPunctuationController];
  [v6 setSmartQuotesEnabled:v5];

  id v9 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v7 = [v9 BOOLForPreferenceKey:*MEMORY[0x263F7E868]];
  id v8 = [(TIKeyboardInputManager_ja *)self smartPunctuationController];
  [v8 setSmartDashesEnabled:v7];
}

- (id)stringByConvertingPunctuationForInput:(id)a3 isLockedInput:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(TIKeyboardInputManager_ja *)self smartPunctuationController];
  id v8 = [v7 smartPunctuationOutputForInput:v6 isLockedInput:v4 documentState:0];

  id v9 = [v8 insertionText];

  if (v9)
  {
    id v10 = [v8 insertionText];
  }
  else
  {
    id v10 = v6;
  }
  id v11 = v10;

  return v11;
}

- (id)syllableSeparator
{
  return &stru_26F5DD710;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_ja;
  BOOL v4 = [(TIKeyboardInputManagerMecabra *)&v8 handleAcceptedCandidate:a3 keyboardState:a4];
  if ([v4 length]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)getInputStringFromTopCandidate
{
  id v2 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  id v3 = [v2 candidates];
  BOOL v4 = [v3 firstObject];

  uint64_t v5 = [v4 input];

  return v5;
}

- (void)lockAnyDrawInputResults
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  int v4 = [v3 hasDrawInput];

  if (v4)
  {
    unint64_t v5 = [(TIKeyboardInputManagerMecabra *)self inputIndexWithDrawInput];
    id v6 = [MEMORY[0x263EFF980] array];
    uint64_t v7 = [(TIKeyboardInputManager_ja *)self getInputStringFromTopCandidate];
    if ([v7 length])
    {
      unint64_t v8 = 0;
      do
      {
        id v9 = objc_msgSend(NSString, "_stringWithUnichar:", objc_msgSend(v7, "characterAtIndex:", v8));
        [v6 addObject:v9];

        ++v8;
      }
      while ([v7 length] > v8);
    }
    id v10 = (void *)[objc_alloc(MEMORY[0x263F7EA28]) initWithCommittedText:&stru_26F5DD710 syllables:v6];
    id v11 = [v10 syntheticInputWithCursorIndex:v5];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    id v13 = [v12 inputs];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          [v11 composeNew:*(void *)(*((void *)&v20 + 1) + 8 * v17++)];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }

    uint64_t v18 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v18 removeAllInputs];

    id v19 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v19 composeNew:v11];
  }
}

- (id)didAcceptCandidate:(id)a3
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TIKeyboardInputManager_ja *)self _cancelCandidatesThread];
  if ([(TIKeyboardInputManager_ja *)self usesLiveConversion])
  {
    unint64_t v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

    if (!v5) {
      [(TIKeyboardInputManager_ja *)self setAlternateDisplayString:0];
    }
  }
  [(TIKeyboardInputManager_ja *)self setFlickUsed:0];
  self->_unint64_t remainingInputLength = 0;
  id v6 = [(TIKeyboardInputManager_ja *)self rawInputString];
  unint64_t v7 = [v6 length];
  unint64_t v8 = [v4 input];
  unint64_t v9 = [v8 length];

  id v10 = [v4 candidate];
  if ([v10 length])
  {
    int v11 = [(TIKeyboardInputManager_ja *)self isTypologyEnabled];

    if (v11) {
      [(TIKeyboardInputManagerMecabra *)self logCommittedCandidate:v4 partial:v7 > v9];
    }
  }
  else
  {
  }
  if (v7 > v9) {
    [(TIKeyboardInputManagerMecabra *)self savePartialGeometryData];
  }
  uint64_t v12 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v4];
  id v13 = [v4 proactiveTrigger];

  if ([(TIKeyboardInputManager_ja *)self isEmojiFacemarkMode])
  {
    [(TIWordSearch *)self->_kbws performAccept:v12 isPartial:0];
    [(TIKeyboardInputManager_ja *)self setIsEmojiFacemarkMode:0];
LABEL_12:
    uint64_t v14 = 0;
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && !v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v81 = [v4 candidate];
      if ([v81 length])
      {
        uint64_t v15 = [(TIKeyboardInputManager_ja *)self keyboardState];
        uint64_t v16 = [v15 documentIdentifier];
        unint64_t v17 = 0x268D52000uLL;
        if (v16)
        {
          uint64_t v18 = (void *)v16;
          id v19 = [(TIKeyboardInputManager_ja *)self keyboardState];
          long long v20 = [v19 inputForMarkedText];
          uint64_t v21 = [v20 length];

          if (v21)
          {
            long long v22 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
            long long v23 = [v22 candidates];

            long long v85 = 0u;
            long long v86 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            id obj = v23;
            uint64_t v24 = [obj countByEnumeratingWithState:&v83 objects:v87 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v84;
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v84 != v26) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v28 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                  char v29 = [v28 candidate];
                  if ([v81 isEqualToString:v29])
                  {
                    objc_opt_class();
                    char isKindOfClass = objc_opt_isKindOfClass();

                    if (isKindOfClass)
                    {
                      BOOL v68 = v7 > v9;
                      v69 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v28];
                      [(TIKeyboardInputManager_ja *)self addRecentlyCommittedCandidatesForReanalysis:v69];
                      [(TIWordSearch *)self->_kbws performAccept:v69 isPartial:v68];
                      [(TIKeyboardInputManagerMecabra *)self updateUsageStatisticsForCandidate:v28 isPartial:v68];

                      goto LABEL_69;
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v25 = [obj countByEnumeratingWithState:&v83 objects:v87 count:16];
              }
              while (v25);
            }

            unint64_t v17 = 0x268D52000;
          }
        }
        else
        {
        }
        [*(id *)((char *)&self->super.super.super.super.super.isa + *(int *)(v17 + 1000)) performAccept:0 isPartial:0];
      }
LABEL_69:
    }
    goto LABEL_12;
  }
  [(TIKeyboardInputManager_ja *)self addRecentlyCommittedCandidatesForReanalysis:v12];
  self->_unint64_t remainingInputLength = [(TIKeyboardInputManager_ja *)self remainingInputLengthOfCandidate:v4];
  [(TIWordSearch *)self->_kbws performAccept:v12 isPartial:v7 > v9];
  if (v13)
  {
    uint64_t v14 = [v4 candidate];
  }
  else
  {
    uint64_t v14 = 0;
  }
  [(TIKeyboardInputManagerMecabra *)self updateUsageStatisticsForCandidate:v4 isPartial:v7 > v9];
LABEL_35:
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput]) {
    goto LABEL_64;
  }
  id v31 = [(TIKeyboardInputManagerMecabra *)self processAcceptedCandidate:v4];
  id v32 = [MEMORY[0x263F089D8] string];
  id v33 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  uint64_t v34 = [v33 inputs];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    uint64_t v36 = 0;
    int v37 = 0;
    do
    {
      v38 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      v39 = [v38 inputs];
      v40 = [v39 objectAtIndexedSubscript:v36];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v41 = [v40 convertedInput];
        [v32 appendString:v41];

        v42 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        [v42 removeInputAtIndex:v36];

        --v37;
      }

      uint64_t v36 = ++v37;
      v43 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      v44 = [v43 inputs];
      unint64_t v45 = [v44 count];
    }
    while (v45 > v37);
  }
  v46 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  v47 = [v46 inputs];
  if ((unint64_t)[v47 count] <= 1) {
    goto LABEL_46;
  }
  v48 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  v49 = [v48 inputs];
  v50 = [v49 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_46;
  }
  [(TIKeyboardInputManagerMecabra *)self composingInput];
  v52 = v51 = v14;
  char v82 = [v52 hasDrawInput];

  uint64_t v14 = v51;
  if ((v82 & 1) == 0)
  {
    v46 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    v47 = [v46 inputs];
    id v53 = -[TIKeyboardInputManagerMecabra convertInputsToSyntheticInputUptoCount:](self, "convertInputsToSyntheticInputUptoCount:", [v47 count]);
LABEL_46:
  }
  [(TIKeyboardInputManager_ja *)self lockAnyDrawInputResults];
  id v54 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  v55 = [v54 inputs];
  if ([v55 count])
  {
    while (1)
    {
      uint64_t v56 = [v32 length];

      if (!v56) {
        goto LABEL_63;
      }
      v57 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      v58 = [v57 inputs];
      v59 = [v58 objectAtIndexedSubscript:0];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v60 = v59;
      v61 = [v60 characters];
      if (![v61 length]) {
        goto LABEL_58;
      }
      v62 = [v60 characters];
      int v63 = [v62 characterAtIndex:0];
      int v64 = [v32 characterAtIndex:0];

      if (v63 != v64)
      {
        v59 = v60;
        goto LABEL_62;
      }
LABEL_59:
      v66 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      [v66 removeInputAtIndex:0];

      id v54 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      v55 = [v54 inputs];
      if (![v55 count]) {
        goto LABEL_60;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_62;
    }
    id v54 = v59;
    v61 = [v54 text];
    if ([v61 length])
    {
      if (([v32 hasPrefix:v61] & 1) == 0)
      {
        unint64_t v65 = [v32 length];
        if (v65 < [v61 length])
        {
          if (([v61 hasPrefix:v32] & 1) != 0
            || (unint64_t v70 = [v61 length], v70 > objc_msgSend(v32, "length")))
          {
            v71 = [v54 syllables];
            unint64_t v72 = [v71 count];
            unint64_t v73 = [v32 length];

            if (v72 <= v73)
            {
              v55 = v54;
            }
            else
            {
              v74 = [v54 syllables];
              uint64_t v75 = [v32 length];
              v76 = [v54 syllables];
              v77 = objc_msgSend(v74, "subarrayWithRange:", v75, objc_msgSend(v76, "count") - objc_msgSend(v32, "length"));

              v78 = [v54 committedText];
              v55 = [v54 syntheticInputWithCommittedText:v78 syllables:v77];

              v79 = [(TIKeyboardInputManagerMecabra *)self composingInput];
              [v79 replaceInputAtIndex:0 with:v55];

              id v32 = 0;
            }
          }
          else
          {
            v55 = v54;
          }

          goto LABEL_60;
        }
      }
    }
    objc_msgSend(v32, "deleteCharactersInRange:", 0, objc_msgSend(v61, "length"));
LABEL_58:

    goto LABEL_59;
  }
LABEL_60:

  v59 = v54;
LABEL_62:

LABEL_63:
LABEL_64:

  return v14;
}

- (void)lastAcceptedCandidateCorrected
{
}

- (void)clearDynamicDictionary
{
  [(TIWordSearch *)self->_kbws clearLearningDictionary];
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja;
  [(TIKeyboardInputManager_ja *)&v3 clearDynamicDictionary];
}

- (void)setLearnsCorrection:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManager_ja setLearnsCorrection:](&v5, sel_setLearnsCorrection_);
  self->_shouldLearnAcceptedCandidate = v3;
  [(TIWordSearch *)self->_kbws setShouldLearnAcceptedCandidate:v3];
}

- (void)addRecentlyCommittedCandidatesForReanalysis:(void *)a3
{
  if (a3)
  {
    objc_super v5 = MecabraCandidateGetSurface();
    id v6 = [(TIKeyboardInputManager_ja *)self recentlyCommittedCandidatesForReanalysis];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __73__TIKeyboardInputManager_ja_addRecentlyCommittedCandidatesForReanalysis___block_invoke;
    v14[3] = &unk_2650FAA28;
    id v7 = v5;
    id v15 = v7;
    uint64_t v8 = [v6 indexOfObjectPassingTest:v14];

    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = [(TIKeyboardInputManager_ja *)self recentlyCommittedCandidatesForReanalysis];
      [v9 removeObjectAtIndex:v8];
    }
    id v10 = [(TIKeyboardInputManager_ja *)self recentlyCommittedCandidatesForReanalysis];
    [v10 insertObject:a3 atIndex:0];

    int v11 = [(TIKeyboardInputManager_ja *)self recentlyCommittedCandidatesForReanalysis];
    unint64_t v12 = [v11 count];

    if (v12 >= 0x1F)
    {
      id v13 = [(TIKeyboardInputManager_ja *)self recentlyCommittedCandidatesForReanalysis];
      [v13 removeLastObject];
    }
  }
}

- (BOOL)isLiveConversion
{
  if ([(TIKeyboardInputManager_ja *)self liveConversionEnabled])
  {
    BOOL v3 = [(TIKeyboardInputManager_ja *)self inputString];
    uint64_t v4 = [v3 length];
    if (v4 == [(TIKeyboardInputManager_ja *)self inputIndex]) {
      int v5 = [(TIKeyboardInputManager_ja *)self shouldSkipCandidateSelection] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)liveConversionEnabled
{
  if ([(TIKeyboardInputManager_ja *)self liveConversionForceEnabled]) {
    return 1;
  }
  if ([(TIKeyboardInputManager_ja *)self liveConversionForceDisabled]) {
    return 0;
  }
  int v4 = [(TIKeyboardInputManager_ja *)self inHardwareKeyboardMode];
  int v5 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  id v6 = v5;
  id v7 = (void *)MEMORY[0x263F7E840];
  if (!v4) {
    id v7 = (void *)MEMORY[0x263F7E880];
  }
  char v8 = [v5 BOOLForPreferenceKey:*v7];

  return v8;
}

- (BOOL)supportsCandidateGeneration
{
  id v2 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)commitComposition
{
  BOOL v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  int v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  id v6 = v5;
  if (isKindOfClass)
  {
    uint64_t v7 = [v5 inputStringForHiraganaMode];
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0) {
      goto LABEL_7;
    }
    id v6 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    uint64_t v7 = [v6 rawInputString];
  }
  unint64_t v9 = (void *)v7;

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F7E648]);
    [v10 setString:v9];
    id v11 = objc_alloc(MEMORY[0x263F7EAB8]);
    unint64_t v12 = [(TIKeyboardInputManager_ja *)self keyboardState];
    id v13 = (void *)[v11 initWithKeyboardState:v12];

    [(TIKeyboardInputManager_ja *)self clearInput];
    TIInputManager::sync_with_input_from_UI(*(TIInputManager **)((char *)&self->super.super.super.super.super.isa
                                                               + (int)*MEMORY[0x263F7EB98]));
    [(TIKeyboardInputManager_ja *)self addInput:v10 withContext:v13];
  }
LABEL_7:
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManager_ja;
  [(TIKeyboardInputManagerMecabra *)&v14 commitComposition];
}

- (BOOL)shouldInvokeLiveConversion:(id)a3
{
  id v4 = a3;
  int v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  if (v5 || ![(TIKeyboardInputManager_ja *)self isLiveConversion])
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    id v6 = [v4 string];
    if ([v6 length])
    {
      uint64_t v7 = [v4 string];
      if ([v7 _isSpace])
      {
        LOBYTE(v8) = 0;
      }
      else
      {
        id v10 = [v4 string];
        if ([v10 isEqualToString:*MEMORY[0x263F7EC00]])
        {
          LOBYTE(v8) = 0;
        }
        else
        {
          id v11 = [v4 string];
          if ([v11 isEqualToString:*MEMORY[0x263F7EC08]])
          {
            LOBYTE(v8) = 0;
          }
          else
          {
            unint64_t v12 = [v4 string];
            if ([v12 isEqualToString:*MEMORY[0x263F7EBF8]]) {
              LOBYTE(v8) = 0;
            }
            else {
              BOOL v8 = ![(TIKeyboardInputManager_ja *)self isEmojiFacemarkMode];
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  [v11 syncToKeyboardState:v10];

  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardInputManager_ja;
  -[TIKeyboardInputManagerMecabra generateCandidatesWithKeyboardState:candidateRange:candidateHandler:](&v12, sel_generateCandidatesWithKeyboardState_candidateRange_candidateHandler_, v10, location, length, v9);
}

- (void)mecabraLearningValidator:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(TIKeyboardInputManagerMecabra *)self storeLanguageModelDynamicDataIncludingCache];
  [(TIKeyboardInputManagerBase *)self clearHumanReadableTrace];
  int v5 = [(TIKeyboardInputManagerBase *)self inputManagerLogger];
  id v6 = [v5 writeToFile];

  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];
    BOOL v8 = [v6 objectAtIndexedSubscript:1];
    *(_DWORD *)buf = 136315906;
    uint64_t v16 = "-[TIKeyboardInputManager_ja mecabraLearningValidator:]";
    __int16 v17 = 2080;
    uint64_t v18 = "-[TIKeyboardInputManager_ja mecabraLearningValidator:]";
    __int16 v19 = 2112;
    long long v20 = v7;
    __int16 v21 = 2112;
    long long v22 = v8;
    _os_log_impl(&dword_241DFD000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "%s  [%s]Wrote typology log: %@, typology trace log: %@", buf, 0x2Au);
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.keyboard.TypoTracker"];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke;
  v12[3] = &unk_2650FAA70;
  id v13 = v4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v4;
  [v10 requestAuthorizationWithOptions:7 completionHandler:v12];
}

- (BOOL)isKanaPlane
{
  return self->_isKanaPlane;
}

- (void)setIsKanaPlane:(BOOL)a3
{
  self->_isKanaPlane = a3;
}

- (NSMutableArray)recentlyCommittedCandidatesForReanalysis
{
  return self->_recentlyCommittedCandidatesForReanalysis;
}

- (TISmartPunctuationController)smartPunctuationController
{
  return self->_smartPunctuationController;
}

- (BOOL)flickUsed
{
  return self->_flickUsed;
}

- (void)setFlickUsed:(BOOL)a3
{
  self->_flickUsed = a3;
}

- (BOOL)isEmojiFacemarkMode
{
  return self->_isEmojiFacemarkMode;
}

- (BOOL)filterCandidatesUsingInputIndex
{
  return self->_filterCandidatesUsingInputIndex;
}

- (void)setFilterCandidatesUsingInputIndex:(BOOL)a3
{
  self->_filterCandidatesUsingInputIndedouble x = a3;
}

- (NSString)alternateDisplayString
{
  return self->_alternateDisplayString;
}

- (void)setAlternateDisplayString:(id)a3
{
}

- (BOOL)selectFirstCandidate
{
  return self->_selectFirstCandidate;
}

- (void)setSelectFirstCandidate:(BOOL)a3
{
  self->_selectFirstCandidate = a3;
}

- (BOOL)liveConversionForceEnabled
{
  return self->_liveConversionForceEnabled;
}

- (void)setLiveConversionForceEnabled:(BOOL)a3
{
  self->_liveConversionForceEnabled = a3;
}

- (BOOL)liveConversionForceDisabled
{
  return self->_liveConversionForceDisabled;
}

- (void)setLiveConversionForceDisabled:(BOOL)a3
{
  self->_liveConversionForceDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDisplayString, 0);
  objc_storeStrong((id *)&self->_smartPunctuationController, 0);
  objc_storeStrong((id *)&self->_recentlyCommittedCandidatesForReanalysis, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_candidateSorter, 0);
  objc_storeStrong((id *)&self->_kbws, 0);
}

@end