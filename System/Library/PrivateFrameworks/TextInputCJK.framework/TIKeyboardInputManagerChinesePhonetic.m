@interface TIKeyboardInputManagerChinesePhonetic
+ (Class)wordSearchClass;
+ (id)ambiguousAndPinyinCharacterSet;
+ (id)ambiguousDefaults;
+ (id)ambiguousPinyinSet;
+ (id)directlyCommittedCharacterSetForEmptyInline;
+ (id)stringFallBackForTenKeyInput:(id)a3 range:(_NSRange)a4;
+ (unint64_t)maxNumberOfUncommittedSegments;
- (BOOL)_shouldCommitInputDirectly:(id)a3;
- (BOOL)canStartSentenceAfterString:(id)a3;
- (BOOL)commitsAcceptedCandidate;
- (BOOL)doesComposeText;
- (BOOL)filterCandidatesUsingInputIndex;
- (BOOL)generateReanalysisCandidatesIfAppropriate;
- (BOOL)handleDirectlyCommitForInput:(id)a3 withContext:(id)a4;
- (BOOL)hasExtensionEmojiCandidates;
- (BOOL)hasLockedSyllable;
- (BOOL)ignoresDeadKeys;
- (BOOL)inputContinuesGB18030OrUnicodeLookupKey:(id)a3;
- (BOOL)isPhraseBoundarySet;
- (BOOL)isSpecialInput:(id)a3;
- (BOOL)shouldAddModifierSymbolsToWordCharacters;
- (BOOL)shouldAdvanceSyllableSelection;
- (BOOL)shouldDelayUpdateComposedText;
- (BOOL)shouldExtendPriorWord;
- (BOOL)shouldLookForCompletionCandidates;
- (BOOL)shouldReplaceCharacterOfInputStringBeforeCursorForInput:(id)a3;
- (BOOL)skipSetMarkedTextDuringInput;
- (BOOL)suppliesCompletions;
- (BOOL)supportsLearning;
- (BOOL)supportsNumberKeySelection;
- (BOOL)supportsPerRecipientLearning;
- (BOOL)supportsReversionUI;
- (BOOL)supportsSetPhraseBoundary;
- (BOOL)suppressCompletionsForFieldEditor;
- (BOOL)updateCandidatesByWaitingForResults:(BOOL)a3;
- (BOOL)usesAutoDeleteWord;
- (BOOL)usesCandidateSelection;
- (BOOL)usesGeometryModelData;
- (NSArray)pinyinSyllableCandidates;
- (NSArray)segments;
- (NSMutableArray)replacedAmbiguousPinyinSyllables;
- (NSMutableArray)replacementUnambiguousPinyinSyllables;
- (NSString)composedTextBeforeFirstSyllableLocked;
- (NSString)convertedInput;
- (NSString)inputStringForSearch;
- (NSString)internalInputString;
- (NSString)remainingInput;
- (NSString)unconvertedInput;
- (TIConversionHistory)conversionHistory;
- (TIKeyboardCandidate)candidateForInlineTextSegmentation;
- (TIKeyboardCandidateResultSet)mostRecentCandidateResultSetPendingDisplay;
- (TIKeyboardInputManagerChinesePhonetic)initWithConfig:(id)a3 keyboardState:(id)a4;
- (TIMecabraIMLogger)logger;
- (_NSRange)analysisStringRange;
- (id)SegmentedPinyin:(id)a3 inputMethodType:(int)a4;
- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6;
- (id)candidateResultSet;
- (id)candidateResultSetByWaitingForResults:(BOOL)a3;
- (id)composedTextForSelectedCandidate:(id)a3 remainingInput:(id)a4;
- (id)convertInputsToSyntheticInputUptoCount:(int)a3;
- (id)defaultCandidate;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)didAcceptCandidate:(id)a3;
- (id)externalStringToInternal:(id)a3;
- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4;
- (id)handleKeyboardInput:(id)a3;
- (id)inputString;
- (id)internalStringToExternal:(id)a3;
- (id)keyboardBehaviors;
- (id)keyboardConfigurationLayoutTag;
- (id)locale;
- (id)newInputManagerState;
- (id)phoneticSortingMethod;
- (id)remapInput:(id)a3 isFacemarkInput:(BOOL *)a4;
- (id)searchStringForMarkedText;
- (id)segmentedInputFromString:(id)a3;
- (id)sentenceDelimitingCharacters;
- (id)sortingMethods;
- (id)stringByPrependingConvertedCandidateTextToString:(id)a3;
- (id)stringByRemovingSyllableSeparatorsFromString:(id)a3;
- (id)stringByStrippingConvertedCandidateTextFromString:(id)a3;
- (id)uncommittedText;
- (int)inputMethodType;
- (int64_t)addTouch:(id)a3 shouldHitTest:(BOOL)a4;
- (unint64_t)internalInputCount;
- (unint64_t)internalInputIndex;
- (unint64_t)phraseBoundary;
- (unint64_t)predictionOptions;
- (unint64_t)selectedPinyinSyllableCandidateIndex;
- (unsigned)externalIndexToInternal:(unsigned int)a3;
- (unsigned)externalIndexToInternal:(unsigned int)a3 shouldBoundToInputCount:(BOOL)a4;
- (unsigned)inputCount;
- (unsigned)inputIndex;
- (unsigned)internalIndexToExternal:(unsigned int)a3;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)addInputToInternal:(id)a3;
- (void)autocommitHeadSegmentWithContext:(id)a3;
- (void)clearDynamicDictionary;
- (void)clearInput;
- (void)clearPinyinSyllableSelection;
- (void)dealloc;
- (void)didDeleteCandidates:(id)a3;
- (void)handleAcceptedPinyinDisambiguationCandidate:(id)a3 keyboardState:(id)a4;
- (void)inputLocationChanged;
- (void)lastAcceptedCandidateCorrected;
- (void)resume;
- (void)revertLastDisambiguation;
- (void)setAutoCorrects:(BOOL)a3;
- (void)setComposedTextBeforeFirstSyllableLocked:(id)a3;
- (void)setConversionHistory:(id)a3;
- (void)setFilterCandidatesUsingInputIndex:(BOOL)a3;
- (void)setInHardwareKeyboardMode:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setLogger:(id)a3;
- (void)setMostRecentCandidateResultSetPendingDisplay:(id)a3;
- (void)setPhraseBoundary:(unint64_t)a3;
- (void)setPinyinSyllableCandidates:(id)a3;
- (void)setRemainingInput:(id)a3;
- (void)setReplacedAmbiguousPinyinSyllables:(id)a3;
- (void)setReplacementUnambiguousPinyinSyllables:(id)a3;
- (void)setSegments:(id)a3;
- (void)setSelectedPinyinSyllableCandidateIndex:(unint64_t)a3;
- (void)setShouldAdvanceSyllableSelection:(BOOL)a3;
- (void)setSkipSetMarkedTextDuringInput:(BOOL)a3;
- (void)shiftPinyinSyllableSelection;
- (void)storeLanguageModelDynamicDataIncludingCache;
- (void)suspend;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
- (void)syncToLayoutState:(id)a3;
- (void)updateComposedText;
- (void)wordSearchEngineDidFindCandidates:(id)a3 forOperation:(id)a4;
- (void)wordSearchEngineDidFindPredictionCandidates:(id)a3;
@end

@implementation TIKeyboardInputManagerChinesePhonetic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_mostRecentCandidateResultSetPendingDisplay, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_pinyinSyllableCandidates, 0);
  objc_storeStrong((id *)&self->_composedTextBeforeFirstSyllableLocked, 0);
  objc_storeStrong((id *)&self->_replacementUnambiguousPinyinSyllables, 0);
  objc_storeStrong((id *)&self->_replacedAmbiguousPinyinSyllables, 0);
  objc_storeStrong((id *)&self->_remainingInput, 0);
  objc_storeStrong((id *)&self->_conversionHistory, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_candidateData, 0);
}

- (void)setSegments:(id)a3
{
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSkipSetMarkedTextDuringInput:(BOOL)a3
{
  self->_skipSetMarkedTextDuringInput = a3;
}

- (BOOL)skipSetMarkedTextDuringInput
{
  return self->_skipSetMarkedTextDuringInput;
}

- (void)setMostRecentCandidateResultSetPendingDisplay:(id)a3
{
}

- (TIKeyboardCandidateResultSet)mostRecentCandidateResultSetPendingDisplay
{
  return self->_mostRecentCandidateResultSetPendingDisplay;
}

- (void)setShouldAdvanceSyllableSelection:(BOOL)a3
{
  self->_shouldAdvanceSyllableSelection = a3;
}

- (BOOL)shouldAdvanceSyllableSelection
{
  return self->_shouldAdvanceSyllableSelection;
}

- (void)setFilterCandidatesUsingInputIndex:(BOOL)a3
{
  self->_filterCandidatesUsingInputIndex = a3;
}

- (BOOL)filterCandidatesUsingInputIndex
{
  return self->_filterCandidatesUsingInputIndex;
}

- (void)setLogger:(id)a3
{
}

- (TIMecabraIMLogger)logger
{
  return self->_logger;
}

- (void)setSelectedPinyinSyllableCandidateIndex:(unint64_t)a3
{
  self->_selectedPinyinSyllableCandidateIndex = a3;
}

- (unint64_t)selectedPinyinSyllableCandidateIndex
{
  return self->_selectedPinyinSyllableCandidateIndex;
}

- (void)setPinyinSyllableCandidates:(id)a3
{
}

- (NSArray)pinyinSyllableCandidates
{
  return self->_pinyinSyllableCandidates;
}

- (void)setComposedTextBeforeFirstSyllableLocked:(id)a3
{
}

- (NSString)composedTextBeforeFirstSyllableLocked
{
  return self->_composedTextBeforeFirstSyllableLocked;
}

- (void)setReplacementUnambiguousPinyinSyllables:(id)a3
{
}

- (NSMutableArray)replacementUnambiguousPinyinSyllables
{
  return self->_replacementUnambiguousPinyinSyllables;
}

- (void)setReplacedAmbiguousPinyinSyllables:(id)a3
{
}

- (NSMutableArray)replacedAmbiguousPinyinSyllables
{
  return self->_replacedAmbiguousPinyinSyllables;
}

- (void)setRemainingInput:(id)a3
{
}

- (NSString)remainingInput
{
  return self->_remainingInput;
}

- (void)setConversionHistory:(id)a3
{
}

- (TIConversionHistory)conversionHistory
{
  return self->_conversionHistory;
}

- (void)autocommitHeadSegmentWithContext:(id)a3
{
  v4 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v4 cancel];

  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    v5 = [(TIKeyboardInputManagerChinesePhonetic *)self segments];
    id v11 = [v5 firstObject];

    id v6 = objc_alloc(MEMORY[0x263F7EA00]);
    v7 = [v11 surface];
    v8 = [v11 reading];
    v9 = (void *)[v6 initWithCandidateText:v7 convertedInput:v8];

    v10 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v10 composeNew:v9];
  }
}

- (BOOL)usesGeometryModelData
{
  v2 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
  char v3 = [v2 hardwareKeyboardMode] ^ 1;

  return v3;
}

- (BOOL)generateReanalysisCandidatesIfAppropriate
{
  char v3 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
  v4 = [v3 documentState];
  v5 = [v4 selectedText];

  id v6 = [(TIKeyboardInputManagerChinese *)self language];
  v7 = [v5 _stringByTranscribingFromLanguage:v6];

  if ([(TIKeyboardInputManagerChinesePhonetic *)self inputMethodType] == 5) {
    v8 = @"Latin-Bopomofo";
  }
  else {
    v8 = (__CFString *)*MEMORY[0x263EFFF50];
  }
  v9 = [v7 _stringByApplyingTransform:v8];

  v10 = [TIWordSearchChinesePhoneticOperationGetCandidates alloc];
  id v11 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  v12 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
  char v13 = [v12 hardwareKeyboardMode];
  v14 = [(TIKeyboardInputManagerChinesePhonetic *)self logger];
  LOBYTE(v20) = v13;
  BYTE2(v19) = 1;
  LOWORD(v19) = 257;
  v15 = -[TIWordSearchChinesePhoneticOperationGetCandidates initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:](v10, "initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:", v11, v9, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, v19, self, sel_wordSearchEngineDidFindCandidates_forOperation_, 0, v20, v14);

  v16 = [(TIWordSearchOperationGetCandidates *)v15 results];

  if (v16)
  {
    v17 = [(TIWordSearchOperationGetCandidates *)v15 results];
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v17];
  }
  else
  {
    v17 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v17 performOperationAsync:v15];
  }

  return v16 != 0;
}

- (id)locale
{
  return 0;
}

- (id)composedTextForSelectedCandidate:(id)a3 remainingInput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isInAmbiguousMode)
  {
    if ([(TIKeyboardInputManagerChinesePhonetic *)self filterCandidatesUsingInputIndex])
    {
      BOOL v8 = [(TIKeyboardInputManagerChinesePhonetic *)self hasLockedSyllable];
      uint64_t v9 = (int)*MEMORY[0x263F7EB90];
      if (v8
        || (v10 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v9),
            -[TIKeyboardInputManagerChinesePhonetic composedTextBeforeFirstSyllableLocked](self, "composedTextBeforeFirstSyllableLocked"), id v11 = objc_claimAutoreleasedReturnValue(), LOBYTE(v10) = [v10 isEqualToString:v11], v11, (v10 & 1) == 0))
      {
        v29 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v9);
        goto LABEL_21;
      }
    }
  }
  v12 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v6];
  if (self->_isInAmbiguousMode && v12 == 0)
  {
    v29 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB90]);
LABEL_21:
    id v30 = v29;
    v15 = v7;
    goto LABEL_39;
  }
  v14 = v12;
  v15 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByStrippingConvertedCandidateTextFromString:v7];

  uint64_t v16 = [v6 input];
  v17 = (void *)v16;
  v18 = &stru_270B867F0;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  uint64_t v19 = v18;

  unint64_t v20 = [(__CFString *)v19 length];
  unint64_t v21 = [v15 length];
  unint64_t v22 = v21;
  if (self->_isInAmbiguousMode)
  {
    if (v21 < v20 || !v21) {
      goto LABEL_37;
    }
    v23 = (void *)MEMORY[0x263F7E6A0];
    v24 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
    v25 = [v23 displayReadingFromMecabraCandidate:v14 syllableSeparator:v24];

    unint64_t v26 = v22 - v20;
    if (v26)
    {
      id v28 = [MEMORY[0x263F089D8] string];
      if ([v25 length]) {
        [v28 appendString:v25];
      }
      v40 = objc_msgSend((id)objc_opt_class(), "stringFallBackForTenKeyInput:range:", v15, v20, v26);
      [v28 appendString:v40];
    }
    else
    {
      v27 = [v25 length] ? v25 : 0;
      id v28 = v27;
    }

    if (!v28)
    {
LABEL_37:
      objc_msgSend((id)objc_opt_class(), "stringFallBackForTenKeyInput:range:", v15, 0, objc_msgSend(v15, "length"));
      id v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_38;
  }
  v31 = (void *)MEMORY[0x263F7E6A0];
  v32 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
  v33 = [v31 displayReadingFromMecabraCandidate:v14 syllableSeparator:v32];

  if (v14 && ([v15 hasPrefix:v19] & 1) != 0)
  {
    if (v6)
    {
      id v28 = v33;
      if (v22 > v20)
      {
        v34 = [(TIKeyboardInputManagerChinesePhonetic *)self segmentedInputFromString:v15];
        uint64_t v58 = 0;
        v59 = &v58;
        uint64_t v60 = 0x2020000000;
        char v61 = 1;
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x2020000000;
        uint64_t v57 = 0;
        uint64_t v57 = [v34 length];
        v53[0] = 0;
        v53[1] = v53;
        v53[2] = 0x2020000000;
        v53[3] = 0;
        uint64_t v35 = [v34 length];
        uint64_t v42 = MEMORY[0x263EF8330];
        uint64_t v43 = 3221225472;
        v44 = __89__TIKeyboardInputManagerChinesePhonetic_composedTextForSelectedCandidate_remainingInput___block_invoke;
        v45 = &unk_265535500;
        unint64_t v52 = v20;
        v49 = v53;
        v50 = &v54;
        id v36 = v34;
        id v46 = v36;
        v47 = self;
        v48 = v19;
        v51 = &v58;
        objc_msgSend(v36, "enumerateSubstringsInRange:options:usingBlock:", 0, v35, 514, &v42);
        if (*((unsigned char *)v59 + 24))
        {
          uint64_t v37 = objc_msgSend(v36, "substringFromIndex:", v55[3], v42, v43, v44, v45, v46, v47);
          uint64_t v38 = [v28 stringByAppendingString:v37];

          id v28 = (id)v37;
        }
        else
        {
          uint64_t v38 = 0;
        }

        _Block_object_dispose(v53, 8);
        _Block_object_dispose(&v54, 8);
        _Block_object_dispose(&v58, 8);

        id v28 = (id)v38;
      }
      if (v28) {
        goto LABEL_32;
      }
    }
  }
  else
  {

    id v6 = 0;
  }
  -[TIKeyboardInputManagerChinesePhonetic segmentedInputFromString:](self, "segmentedInputFromString:", v15, v42, v43, v44, v45);
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  if (!v39) {
    id v39 = v15;
  }
  id v28 = v39;
LABEL_32:

LABEL_38:
  -[TIKeyboardInputManagerChinesePhonetic stringByPrependingConvertedCandidateTextToString:](self, "stringByPrependingConvertedCandidateTextToString:", v28, v42, v43, v44, v45);
  id v30 = (id)objc_claimAutoreleasedReturnValue();

LABEL_39:
  return v30;
}

void __89__TIKeyboardInputManagerChinesePhonetic_composedTextForSelectedCandidate_remainingInput___block_invoke(uint64_t a1, int a2, NSString *a3, _NSRange a4, uint64_t a5, unsigned char *a6)
{
  v16[4] = *MEMORY[0x263EF8340];
  if ((unint64_t)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + v8) <= *(void *)(a1 + 80))
  {
    NSUInteger length = v17.length;
    v17.location = v17.length;
    KB::utf8_substring(v16, *(KB **)(a1 + 32), a3, v17);
    id v11 = [*(id *)(a1 + 40) syllableSeparator];
    KB::utf8_string(v15, v11, v12);
    char v13 = KB::String::equal((KB::String *)v16, (const KB::String *)v15);
    KB::String::~String((KB::String *)v15);

    if ((v13 & 1) == 0)
    {
      v14.location = length;
      KB::utf8_substring(v15, *(KB **)(a1 + 48), *(NSString **)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v14);
      if (KB::String::equal((KB::String *)v16, (const KB::String *)v15))
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += length;
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        *a6 = 1;
      }
      KB::String::~String((KB::String *)v15);
    }
    KB::String::~String((KB::String *)v16);
  }
  else
  {
    *a6 = 1;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
  }
}

- (BOOL)hasLockedSyllable
{
  v2 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)segmentedInputFromString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [MEMORY[0x263F089D8] string];
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x4012000000;
    unint64_t v26 = __Block_byref_object_copy__507;
    v27 = __Block_byref_object_dispose__508;
    id v28 = &unk_25EC2CB5B;
    long long v29 = xmmword_25EC2B150;
    uint64_t v6 = [v4 length];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    _NSRange v17 = __66__TIKeyboardInputManagerChinesePhonetic_segmentedInputFromString___block_invoke;
    v18 = &unk_2655354B0;
    uint64_t v19 = self;
    id v7 = v4;
    id v20 = v7;
    unint64_t v22 = &v23;
    id v8 = v5;
    id v21 = v8;
    objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 514, &v15);
    if (v24[6] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v8, "length", v15, v16, v17, v18, v19, v20))
      {
        uint64_t v9 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
        [v8 appendString:v9];
      }
      v10 = objc_msgSend(v7, "substringWithRange:", v24[6], v24[7]);
      id v11 = [(TIKeyboardInputManagerChinesePhonetic *)self SegmentedPinyin:v10 inputMethodType:[(TIKeyboardInputManagerChinesePhonetic *)self inputMethodType]];
      [v8 appendString:v11];
    }
    v12 = v21;
    id v13 = v8;

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    id v13 = v4;
  }

  return v13;
}

void __66__TIKeyboardInputManagerChinesePhonetic_segmentedInputFromString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v19 = a2;
  if (a4 == 1
    && ([*(id *)(a1 + 32) validCharacterSetForSegmentation],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(*(id *)(a1 + 40), "characterAtIndex:", a3)),
        v7,
        v8))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    v10 = v19;
    if (*(void *)(v9 + 48) == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(void *)(v9 + 48) = a3;
      *(void *)(v9 + 56) = 1;
    }
    else
    {
      ++*(void *)(v9 + 56);
    }
  }
  else
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([*(id *)(a1 + 48) length])
      {
        id v11 = *(void **)(a1 + 48);
        v12 = [*(id *)(a1 + 32) syllableSeparator];
        [v11 appendString:v12];
      }
      id v13 = *(void **)(a1 + 32);
      _NSRange v14 = *(void **)(a1 + 48);
      uint64_t v15 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 56));
      uint64_t v16 = objc_msgSend(v13, "SegmentedPinyin:inputMethodType:", v15, objc_msgSend(*(id *)(a1 + 32), "inputMethodType"));
      [v14 appendString:v16];

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48) = 0x7FFFFFFFFFFFFFFFLL;
    }
    _NSRange v17 = *(void **)(a1 + 48);
    v18 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
    [v17 appendString:v18];

    v10 = v19;
  }
}

- (id)SegmentedPinyin:(id)a3 inputMethodType:(int)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    if (a4 == 13)
    {
      id v8 = [MEMORY[0x263F089D8] string];
      uint64_t v9 = (void *)MecabraCandidateCopySyllableLengthArrayInAnalysisString();
      v10 = v9;
      if (v9)
      {
        uint64_t v11 = [v9 count];
        if (v11 >= 1)
        {
          uint64_t v12 = v11;
          uint64_t v13 = 0;
          uint64_t v14 = 0;
          do
          {
            uint64_t v15 = [v10 objectAtIndexedSubscript:v13];
            uint64_t v16 = (int)[v15 intValue];

            _NSRange v17 = objc_msgSend(v7, "substringWithRange:", v14, v16);
            [v8 appendString:v17];
            if (++v13 < v12)
            {
              v18 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
              [v8 appendString:v18];

              v14 += v16;
            }
          }
          while (v12 != v13);
        }
      }
    }
    else
    {
      id v8 = [MEMORY[0x263F089D8] string];
      MecabraSyllablesCreateWithString();
      uint64_t SyllableCount = MecabraSyllablesGetSyllableCount();
      if (SyllableCount)
      {
        uint64_t v20 = SyllableCount;
        for (uint64_t i = 0; i != v20; ++i)
        {
          unint64_t v22 = MecabraSyllablesGetSyllableAtIndex();
          if ([v22 length])
          {
            if ([v8 length])
            {
              uint64_t v23 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
              [v8 appendString:v23];
            }
            [v8 appendString:v22];
          }
        }
      }
      MecabraSyllablesRelease();
    }
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (int)inputMethodType
{
  return 0;
}

- (TIKeyboardCandidate)candidateForInlineTextSegmentation
{
  if (self->_isInAmbiguousMode)
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
    BOOL v3 = [v4 currentCandidate];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    BOOL v3 = 0;
  }
  v5 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  id v6 = [v5 candidates];

  if (!v3)
  {
    if ([v6 count])
    {
      BOOL v3 = [v6 objectAtIndex:0];
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  id v7 = [MEMORY[0x263EFF9D0] null];
  int v8 = [v3 isEqual:v7];

  if (v8)
  {

    BOOL v3 = 0;
  }

  return (TIKeyboardCandidate *)v3;
}

- (BOOL)isPhraseBoundarySet
{
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    BOOL v3 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    id v4 = [v3 inputs];
    v5 = [v4 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    int v8 = v7;
    if (isKindOfClass)
    {
      uint64_t v9 = [v7 inputs];
      v10 = [v9 firstObject];

      uint64_t v11 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
      uint64_t v12 = [v10 externalSuffix:v11];
      BOOL v13 = [v12 length] != 0;
    }
    else
    {
      uint64_t v15 = [v7 asInlineText];

      uint64_t v16 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      unint64_t v17 = [v16 asInlineTextCursorIndex];

      BOOL v13 = v17 < [v15 length];
    }
  }
  else
  {
    unint64_t v14 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputIndex];
    return v14 != [(TIKeyboardInputManagerChinesePhonetic *)self internalInputCount];
  }
  return v13;
}

- (BOOL)shouldDelayUpdateComposedText
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  return [(TIKeyboardInputManagerMecabra *)&v4 shouldDelayUpdateComposedText]
      || self->_isInAmbiguousMode;
}

- (void)updateComposedText
{
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    BOOL v3 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    id v15 = [v3 asInlineText];
  }
  else
  {
    id v15 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
  }
  objc_super v4 = [(TIKeyboardInputManagerChinesePhonetic *)self candidateForInlineTextSegmentation];
  if (v4)
  {
    v5 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    id v6 = [v5 candidates];
    id v7 = [v6 firstObject];

    if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
    {
      int v8 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      if (![v8 hasKindOf:objc_opt_class()])
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v9 = [v7 input];

      if (v9)
      {
        int v8 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        v10 = [v8 asCommittedText];
        uint64_t v11 = [v7 input];
        uint64_t v12 = [v10 stringByAppendingString:v11];

        id v15 = (id)v12;
        goto LABEL_9;
      }
    }
LABEL_10:
    uint64_t v13 = [(TIKeyboardInputManagerChinesePhonetic *)self composedTextForSelectedCandidate:v4 remainingInput:v15];

    goto LABEL_17;
  }
  if (!self->_isInAmbiguousMode)
  {
    id v14 = v15;
    goto LABEL_18;
  }
  if (self->_lockingPinyinSyllableSelection) {
    [(TIKeyboardInputManagerChinesePhonetic *)self composedTextBeforeFirstSyllableLocked];
  }
  else {
  uint64_t v13 = objc_msgSend((id)objc_opt_class(), "stringFallBackForTenKeyInput:range:", v15, 0, objc_msgSend(v15, "length"));
  }
  id v7 = v15;
LABEL_17:

  id v14 = (id)v13;
LABEL_18:
  id v16 = v14;
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB90]) setString:v14];
}

- (void)wordSearchEngineDidFindPredictionCandidates:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  [(TIKeyboardInputManagerChinese *)&v4 wordSearchEngineDidFindPredictionCandidates:a3];
  if ([(TIKeyboardInputManagerChinesePhonetic *)self isTypologyEnabled]) {
    [(TIKeyboardInputManagerMecabra *)self logInputString];
  }
}

- (void)wordSearchEngineDidFindCandidates:(id)a3 forOperation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(TIKeyboardInputManagerChinesePhonetic *)self logger];
  [v8 markTime:4];

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __88__TIKeyboardInputManagerChinesePhonetic_wordSearchEngineDidFindCandidates_forOperation___block_invoke;
  v10[3] = &unk_265535530;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  id v9 = v6;
  [(TIKeyboardInputManagerMecabra *)self addStickers:v7 withCompletionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __88__TIKeyboardInputManagerChinesePhonetic_wordSearchEngineDidFindCandidates_forOperation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_73;
  }
  id v6 = [WeakRetained composingInput];
  id v7 = [v6 composingInput];

  int v8 = (const void *)arc4random();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    kdebug_trace();
    kac_get_log();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v8);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_25EC0A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "kbdCPMecabraSetMarkedText", " enableTelemetry=YES ", buf, 2u);
      }
    }
  }
  [v5 setWordSearchCandidateResultSet:v3];
  [v5 updateComposedText];
  [v5 setMarkedText];
  if (_os_feature_enabled_impl())
  {
    id v12 = [v3 candidates];
    uint64_t v13 = [v12 firstObject];
    id v14 = [v5 segmentsFromCandidate:v13 phraseBoundary:0];
    [v5 setSegments:v14];
  }
  id v15 = [v5 wordSearchCandidateResultSet];
  id v16 = [v5 rawInputString];
  [v5 updateProactiveCandidatesForCandidateResultSet:v15 withInput:v16];

  unint64_t v17 = [v5 wordSearchCandidateResultSet];
  v18 = [v5 candidateResultSetFromWordSearchCandidateResultSet:v17];

  id v19 = *(id *)(a1 + 32);
  uint64_t v20 = [v19 keyboardInput];
  v95 = v8;
  v96 = v18;
  if (([v20 hasDrawInput] & 1) != 0
    && ([v19 lastAcceptCandidateInput], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v22 = (void *)v21;
    id v23 = v3;
    v24 = [v19 lastAcceptCandidateInput];
    uint64_t v25 = [v24 remainingMecabraInputs];
    if ([v25 count])
    {

      id v3 = v23;
      v18 = v96;
    }
    else
    {
      uint64_t v54 = [v19 lastAcceptCandidateInput];
      v55 = [v54 remainingInputString];
      uint64_t v94 = [v55 length];

      id v3 = v23;
      v18 = v96;
      if (!v94)
      {
        uint64_t v56 = [v19 keyboardInput];
        uint64_t v57 = [v56 asInlineText];
        [v96 setCommittedText:v57];

        uint64_t v58 = [v5 composingInput];
        [v58 removeAllInputs];

        v59 = [v5 keyboardState];
        uint64_t v60 = [v59 documentState];
        char v61 = [v60 documentStateAfterUnmarkingText];
        v62 = [v5 keyboardState];
        [v62 setDocumentState:v61];

        v18 = v96;
        [v5 updateComposedText];
        [v5 setMarkedText];
      }
    }
  }
  else
  {
  }
  if ([v5 isTypologyEnabled])
  {
    unint64_t v26 = [v5 keyboardState];
    v27 = [v26 documentState];
    id v28 = [v27 selectedText];
    uint64_t v29 = [v28 length];

    v18 = v96;
    if (!v29) {
      [v5 logInputString];
    }
  }
  id v30 = [v19 keyboardInput];
  v31 = [v30 composingInput];

  v32 = [v19 keyboardInput];
  v33 = [v32 inputs];
  if ([v33 count] != 1) {
    goto LABEL_21;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && [v31 isComplete])
  {
    uint64_t v35 = [v3 candidates];
    v32 = [v35 firstObject];

    id v36 = [v32 candidate];
    uint64_t v37 = [v36 _graphemeCount];

    v33 = [v5 typingSessionMonitor];
    uint64_t v38 = [v5 keyboardState];
    [v33 addDrawInputWithSyllableCount:v37 keyboardState:v38];

LABEL_21:
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v39 = [v5 composingInput];
      v40 = [v39 inputs];
      uint64_t v41 = [v40 count];
      uint64_t v42 = [v19 keyboardInput];
      uint64_t v43 = [v42 inputs];
      id v93 = v3;
      uint64_t v44 = [v43 count];

      BOOL v45 = v41 == v44;
      v18 = v96;
      id v3 = v93;
      if (v45)
      {
        id v46 = v7;
        id v47 = v31;
        v48 = [v19 keyboardInput];
        int v49 = [v48 totalDrawSamples];

        if ((int)[MEMORY[0x263F7EB00] maxNumberOfDrawSamples] >= v49)
        {
LABEL_44:

          goto LABEL_45;
        }
        v92 = v47;
        v50 = [v5 composingInput];
        v51 = [v50 inputs];
        id v52 = (id)objc_msgSend(v5, "convertInputsToSyntheticInputUptoCount:", objc_msgSend(v51, "count"));

        id v53 = objc_alloc(MEMORY[0x263F7EA10]);
        if (v46)
        {
          [v46 keyboardLayout];
          [v46 rescaleKeyboardLayout];
        }
        else
        {
          v101 = 0;
          *(void *)buf = 0;
        }
        v63 = objc_msgSend(v53, "initWithKeyboardLayout:rescaleKeyboardLayout:shouldResample:", buf, &v101, objc_msgSend(v5, "shouldResample"));
        if (v101) {
          WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v101);
        }
        if (*(void *)buf) {
          WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(*(unsigned int **)buf);
        }
        v64 = [v92 inputs];
        LODWORD(v65) = [v64 count];

        v66 = [v46 inputs];
        unint64_t v67 = [v66 count];

        if (v67 > (int)v65)
        {
          unint64_t v65 = (int)v65;
          do
          {
            v68 = [v46 inputs];
            v69 = [v68 objectAtIndexedSubscript:v65];
            [v63 composeNew:v69];

            ++v65;
            v70 = [v46 inputs];
            unint64_t v71 = [v70 count];
          }
          while (v71 > v65);
        }
        v72 = [v63 inputs];
        if (![v72 count])
        {
          v73 = [v46 inputs];
          uint64_t v74 = [v73 count];

          if (!v74)
          {
LABEL_43:
            v76 = [v5 composingInput];
            [v76 composeNew:v63];

            id v47 = v92;
            id v3 = v93;
            goto LABEL_44;
          }
          v72 = [v46 inputs];
          v75 = [v72 lastObject];
          [v63 composeNew:v75];
        }
        goto LABEL_43;
      }
    }
  }
LABEL_45:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_61:
    if ([v5 closeCandidateGenerationContextWithResults:v18]) {
      v85 = 0;
    }
    else {
      v85 = v18;
    }
    [v5 setMostRecentCandidateResultSetPendingDisplay:v85];
    goto LABEL_65;
  }
  if (![v7 isComplete])
  {
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    v80 = [MEMORY[0x263F7EB60] sharedOperationQueue];
    v78 = [v80 operations];

    uint64_t v81 = [v78 countByEnumeratingWithState:&v97 objects:v103 count:16];
    if (v81)
    {
      uint64_t v82 = v81;
      uint64_t v83 = *(void *)v98;
      while (2)
      {
        for (uint64_t i = 0; i != v82; ++i)
        {
          if (*(void *)v98 != v83) {
            objc_enumerationMutation(v78);
          }
          if ([*(id *)(*((void *)&v97 + 1) + 8 * i) isMemberOfClass:objc_opt_class()])
          {
            v18 = v96;
            [v96 setInputManagerHasPendingCandidatesUpdate:1];
            goto LABEL_60;
          }
        }
        uint64_t v82 = [v78 countByEnumeratingWithState:&v97 objects:v103 count:16];
        if (v82) {
          continue;
        }
        break;
      }
      v18 = v96;
    }
    goto LABEL_60;
  }
  v77 = [v19 keyboardInput];
  v78 = [v77 composingInput];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_60:

    goto LABEL_61;
  }
  char v79 = [v78 isComplete];

  if (v79) {
    goto LABEL_61;
  }
LABEL_65:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    kdebug_trace();
    kac_get_log();
    v86 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v87 = os_signpost_id_make_with_pointer(v86, v95);
    if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v88 = v87;
      if (os_signpost_enabled(v86))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_25EC0A000, v86, OS_SIGNPOST_INTERVAL_END, v88, "kbdCPMecabraSetMarkedText", " enableTelemetry=YES ", buf, 2u);
      }
    }
  }
  v89 = [v5 logger];

  if (v89)
  {
    v90 = [v5 logger];
    v91 = [v5 internalInputString];
    [v90 endLoggingForInput:v91 atFinalTimeMark:5];
  }
LABEL_73:
}

- (id)stringByPrependingConvertedCandidateTextToString:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    v5 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    id v6 = [v5 asCommittedText];
  }
  else
  {
    id v6 = [(TIKeyboardInputManagerChinesePhonetic *)self convertedInput];
  }
  id v7 = [v6 stringByAppendingString:v4];

  return v7;
}

- (id)stringByStrippingConvertedCandidateTextFromString:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    v5 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    id v6 = [v5 asCommittedText];

    unint64_t v7 = [v4 length];
    if (v7 <= [v6 length])
    {
      int v8 = &stru_270B867F0;
    }
    else
    {
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v6, "length"));
      int v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v9 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
    unint64_t v10 = [v9 convertedLength];

    if (v10 <= [v4 length])
    {
      int v8 = [v4 substringFromIndex:v10];
    }
    else
    {
      int v8 = &stru_270B867F0;
    }
  }

  return v8;
}

- (NSString)convertedInput
{
  v2 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
  id v3 = [v2 convertedCandidateText];

  return (NSString *)v3;
}

- (NSString)unconvertedInput
{
  id v3 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
  id v4 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByStrippingConvertedCandidateTextFromString:v3];

  return (NSString *)v4;
}

- (NSString)inputStringForSearch
{
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    id v3 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    id v4 = [v3 asSearchString];
  }
  else
  {
    id v3 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
    unint64_t v5 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputIndex];
    id v6 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
    unint64_t v7 = [v6 convertedLength];

    if (-[TIKeyboardInputManagerChinesePhonetic filterCandidatesUsingInputIndex](self, "filterCandidatesUsingInputIndex")&& v5 > v7&& v5 < [v3 length])
    {
      uint64_t v8 = [v3 substringToIndex:v5];

      id v3 = (void *)v8;
    }
    id v9 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByStrippingConvertedCandidateTextFromString:v3];
    if ([v9 length]) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = v3;
    }
    id v4 = v10;
  }
  return (NSString *)v4;
}

- (_NSRange)analysisStringRange
{
  id v3 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
  unint64_t v4 = [v3 length];

  unint64_t v5 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
  unint64_t v6 = v4;
  if ([v5 convertedLength] < v4)
  {
    unint64_t v7 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
    unint64_t v6 = [v7 convertedLength];
  }
  if ([(TIKeyboardInputManagerChinesePhonetic *)self filterCandidatesUsingInputIndex])
  {
    unint64_t v8 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputIndex];
    if (v8 < v4 && v8 > v6) {
      unint64_t v4 = v8;
    }
  }
  NSUInteger v10 = v4 - v6;
  NSUInteger v11 = v6;
  result.NSUInteger length = v10;
  result.id location = v11;
  return result;
}

- (BOOL)updateCandidatesByWaitingForResults:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(TIKeyboardInputManagerChinesePhonetic *)self inputStringForSearch];
  if ([v5 length]
    || [(TIKeyboardInputManagerMecabra *)self usesComposingInput]
    && ([(TIKeyboardInputManagerMecabra *)self composingInput],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 inputs],
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v7,
        v9))
  {
    if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
    {
      uint64_t v6 = MEMORY[0x263EFFA68];
    }
    else
    {
      uint64_t v6 = [(TIKeyboardInputManagerMecabra *)self geometryModelData];
    }
    [(TIKeyboardInputManagerChinesePhonetic *)self pinyinSyllableCandidates];
    v33 = v5;
    v32 = v34 = (void *)v6;
    if ([v32 count]) {
      unint64_t v31 = [(TIKeyboardInputManagerChinesePhonetic *)self selectedPinyinSyllableCandidateIndex];
    }
    else {
      unint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v30 = [TIWordSearchChinesePhoneticOperationGetCandidates alloc];
    uint64_t v29 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    NSUInteger v11 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    id v12 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
    uint64_t v13 = [v12 count];
    BOOL v14 = [(TIKeyboardInputManagerChinesePhonetic *)self shouldAdvanceSyllableSelection];
    if (v3) {
      id v15 = 0;
    }
    else {
      id v15 = self;
    }
    if (v3) {
      id v16 = 0;
    }
    else {
      id v16 = sel_wordSearchEngineDidFindCandidates_forOperation_;
    }
    [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
    v17 = BOOL v28 = v3;
    char v18 = [v17 hardwareKeyboardMode];
    id v19 = [(TIKeyboardInputManagerChinesePhonetic *)self logger];
    LOBYTE(v27) = v18;
    unint64_t v26 = v16;
    *(_WORD *)((char *)&v25 + 1) = 1;
    LOBYTE(v25) = v14;
    unint64_t v5 = v33;
    uint64_t v20 = -[TIWordSearchChinesePhoneticOperationGetCandidates initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:](v30, "initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:", v29, v33, v11, 0x7FFFFFFFFFFFFFFFLL, v32, v13, v31, v25, v15, v26, v34, v27, v19);

    uint64_t v21 = [(TIWordSearchOperationGetCandidates *)v20 results];

    if (!v21)
    {
      unint64_t v22 = [(TIKeyboardInputManagerChinese *)self wordSearch];
      [v22 performOperationAsync:v20];

      if (!v28)
      {
        BOOL v10 = 0;
        goto LABEL_22;
      }
      [(TIWordSearchChinesePhoneticOperationGetCandidates *)v20 waitUntilFinished];
    }
    id v23 = [(TIWordSearchOperationGetCandidates *)v20 results];
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v23];

    [(TIKeyboardInputManagerChinesePhonetic *)self updateComposedText];
    BOOL v10 = 1;
LABEL_22:

    goto LABEL_23;
  }
  [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
  BOOL v10 = 1;
LABEL_23:

  return v10;
}

- (BOOL)shouldLookForCompletionCandidates
{
  return [(TIKeyboardInputManagerChinesePhonetic *)self inputCount] == 0;
}

- (void)clearDynamicDictionary
{
  id v2 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v2 clearLearningDictionary];
}

- (void)lastAcceptedCandidateCorrected
{
  id v2 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v2 lastAcceptedCandidateCorrected];
}

- (id)didAcceptCandidate:(id)a3
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 candidate];
  uint64_t v6 = [v5 length];

  unint64_t v7 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v7 cancel];

  unint64_t v8 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v8 clearCache];

  if (!v6)
  {
    int v10 = 0;
    NSUInteger v11 = 0;
    goto LABEL_81;
  }
  uint64_t v9 = [v4 input];
  if ([v9 length]) {
    [v4 input];
  }
  else {
  id v12 = [v4 candidate];
  }

  uint64_t v13 = [(TIKeyboardInputManagerChinesePhonetic *)self convertedInput];
  BOOL v14 = [v4 input];
  id v15 = [v4 candidate];
  if ([v14 isEqualToString:v15])
  {
    id v16 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
    unint64_t v17 = [v16 documentState];
    char v18 = [v17 markedText];
    int v10 = [v12 isEqualToString:v18];
  }
  else
  {
    int v10 = 0;
  }

  unint64_t v19 = [v12 length];
  uint64_t v20 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
  uint64_t v21 = [v20 length];
  v118 = v13;
  unint64_t v22 = v21 - [v13 length];

  unsigned int v23 = ![(TIKeyboardInputManagerMecabra *)self usesComposingInput];
  if (v19 < v22) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = 0;
  }
  if ((v23 & 1) == 0 && (v10 & 1) == 0)
  {
    uint64_t v25 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    uint64_t v24 = [v25 hasRemainingComposingInput];
  }
  if ([(TIKeyboardInputManagerChinesePhonetic *)self isTypologyEnabled])
  {
    [(TIKeyboardInputManagerMecabra *)self logCommittedCandidate:v4 partial:v24];
    unint64_t v26 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v26 mecabra];
    uint64_t v27 = MecabraGetDebuggingLog();

    BOOL v28 = [v27 description];
    [(TIKeyboardInputManagerChinesePhonetic *)self logToTypologyRecorderWithString:v28];

    [(TIKeyboardInputManagerChinesePhonetic *)self logToTypologyRecorderWithString:@"\n\n"];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v30 = [v4 proactiveTrigger];

  __int16 v31 = [v4 customInfoType];
  BOOL v32 = [(TIKeyboardInputManagerMecabra *)self usesComposingInput];
  int v119 = v10;
  if ((isKindOfClass & 1) != 0 || v30 || (v31 & 0x1000) != 0)
  {
    v33 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
    int v34 = [v33 isValid] | v32;

    BOOL v35 = v34 == 1;
    int v10 = v119;
    if (v35)
    {
      v116 = v12;
      id v36 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v4];
      uint64_t v37 = [MEMORY[0x263F7E6A0] convertedInputFromMecabraCandidate:v36];
      if (v36 && MecabraCandidateIsFuzzyMatchCandidate())
      {
        uint64_t v38 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
        id v39 = [v38 inputMode];
        v40 = TIStatisticGetKeyForCandidateAccepted();
        TIStatisticScalarIncrement();

        int v10 = v119;
      }
      if (self->_isInAmbiguousMode
        && [(TIKeyboardInputManagerChinesePhonetic *)self hasLockedSyllable])
      {
        uint64_t v41 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
        uint64_t v42 = [v41 inputMode];
        uint64_t v43 = TIStatisticGetKeyForCandidateAccepted();
        TIStatisticScalarIncrement();

        int v10 = v119;
      }
      uint64_t v44 = [(TIKeyboardInputManagerChinese *)self wordSearch];
      BOOL v45 = v44;
      if (v36)
      {
        [v44 performAccept:v36 isPartial:v24];

        id v46 = v36;
      }
      else
      {
        v55 = [v4 candidate];
        [v45 commitSurface:v55];

        int v10 = v119;
        id v46 = [MEMORY[0x263EFF9D0] null];
      }
      v117 = v46;
      if (self->_isInAmbiguousMode)
      {
        uint64_t v56 = (void *)MecabraCandidateCopySyllableLengthArrayInAnalysisString();
        unint64_t v57 = [v56 count];

        uint64_t v58 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
        v48 = v118;
        if (v57 >= [v58 count])
        {
          v59 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
          unint64_t v57 = [v59 count];
        }
        uint64_t v60 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
        char v61 = objc_msgSend(v60, "subarrayWithRange:", 0, v57);

        v62 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
        v63 = objc_msgSend(v62, "subarrayWithRange:", 0, v57);

        v64 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
        [v64 addCandidate:v4 candidateRef:v117 replacedAmbiguousPinyinSyllables:v61 replacementUnambiguousPinyinSyllables:v63 convertedInput:v37];

        for (; v57; --v57)
          [(TIKeyboardInputManagerChinesePhonetic *)self shiftPinyinSyllableSelection];

        int v10 = v119;
      }
      else
      {
        char v61 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
        [v61 addCandidate:v4 candidateRef:v117 replacedAmbiguousPinyinSyllables:0 replacementUnambiguousPinyinSyllables:0 convertedInput:v37];
        v48 = v118;
      }

      id v12 = v116;
      if (!v32)
      {
        if (!v24)
        {
          NSUInteger v11 = [(TIKeyboardInputManagerChinesePhonetic *)self convertedInput];
          v95 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
          [v95 clear];

          [(TIKeyboardInputManagerChinesePhonetic *)self clearPinyinSyllableSelection];
          [(TIKeyboardInputManagerMecabra *)self updateUsageStatisticsForCandidate:v4 isPartial:0];

          goto LABEL_80;
        }
        uint64_t v68 = [v48 length];
        unint64_t v69 = [v116 length] + v68;
        v70 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
        unint64_t v71 = [v70 length];

        if (v69 > v71)
        {
          if (TICanLogMessageAtLevel())
          {
            v72 = TIOSLogFacility();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              v113 = objc_msgSend(NSString, "stringWithFormat:", @"%s Warning: internalInputString index is out of bounds with new candidateInputText", "-[TIKeyboardInputManagerChinesePhonetic didAcceptCandidate:]");
              *(_DWORD *)buf = 138412290;
              v121 = v113;
              _os_log_debug_impl(&dword_25EC0A000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
          v73 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
          unint64_t v69 = [v73 length];
        }
        uint64_t v74 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
        v75 = [v74 substringFromIndex:v69];
        v76 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByPrependingConvertedCandidateTextToString:v75];
        [(TIKeyboardInputManagerChinesePhonetic *)self setRemainingInput:v76];

        v77 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
        v115 = [v77 lastConvertedCandidate];

        uint64_t v78 = [v48 length];
        unint64_t v79 = [v116 length] + v78;
        v80 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
        unint64_t v81 = [v80 count];

        if (v79 < v81)
        {
          uint64_t v82 = [v48 length];
          uint64_t v83 = [v116 length];
          v84 = [v4 candidate];
          uint64_t v85 = [v84 length];

          v86 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
          os_signpost_id_t v87 = objc_msgSend(v86, "subarrayWithRange:", v82, v83);
          [v115 setGeometryData:v87];

          os_signpost_id_t v88 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
          uint64_t v114 = v83;
          objc_msgSend(v88, "removeObjectsInRange:", v82, v83);

          if (v85)
          {
            uint64_t v89 = v85;
            do
            {
              [(TIKeyboardInputManagerMecabra *)self insertDummyGeometryDataAtIndex:v82];
              --v89;
            }
            while (v89);
          }
          v48 = v118;
          if ([(TIKeyboardInputManagerChinesePhonetic *)self isTypologyEnabled])
          {
            v90 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
            unint64_t v91 = [v90 count];

            if (v79 < v91)
            {
              v92 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
              id v93 = objc_msgSend(v92, "subarrayWithRange:", v82, v114);
              [v115 setTouchData:v93];

              uint64_t v94 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
              objc_msgSend(v94, "removeObjectsInRange:", v82, v114);

              for (; v85; --v85)
                [(TIKeyboardInputManagerMecabra *)self insertDummyTouchDataAtIndex:v82];
            }
          }
        }

        id v12 = v116;
        int v10 = v119;
      }
      [(TIKeyboardInputManagerMecabra *)self updateUsageStatisticsForCandidate:v4 isPartial:v24];

      uint64_t v47 = 0;
      NSUInteger v11 = 0;
      if ((v24 & 1) == 0) {
        goto LABEL_80;
      }
      goto LABEL_79;
    }
  }
  if (v32)
  {
    uint64_t v47 = 0;
    uint64_t v37 = 0;
    NSUInteger v11 = 0;
    v48 = v118;
    if (!v24) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
  int v49 = [v4 input];
  uint64_t v50 = [v49 length];

  int v10 = v119;
  v48 = v118;
  if (v119)
  {
    v51 = [v4 candidate];
    uint64_t v47 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByRemovingSyllableSeparatorsFromString:v51];

    goto LABEL_78;
  }
  if ((v50 != 0) | isKindOfClass & 1 || v30)
  {
    uint64_t v47 = [v4 candidate];
    if (v24) {
      goto LABEL_48;
    }
    char v67 = 0;
  }
  else
  {
    unsigned int v52 = [(TIKeyboardInputManagerChinesePhonetic *)self inputIndex];
    unint64_t v53 = [v118 length];
    uint64_t v54 = [v4 candidate];
    if (v53 >= v52)
    {
      unint64_t v65 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
      unint64_t v96 = [v65 length];
      if (v96 <= [v12 length])
      {
        [(TIKeyboardInputManagerChinesePhonetic *)self setRemainingInput:&stru_270B867F0];
      }
      else
      {
        long long v97 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
        long long v98 = objc_msgSend(v97, "substringFromIndex:", objc_msgSend(v12, "length"));
        [(TIKeyboardInputManagerChinesePhonetic *)self setRemainingInput:v98];
      }
      char v67 = 0;
      int v10 = 0;
      goto LABEL_76;
    }
    uint64_t v47 = [v118 stringByAppendingString:v54];

    if (v24)
    {
      int v10 = 0;
LABEL_48:
      unint64_t v65 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
      v66 = objc_msgSend(v65, "substringFromIndex:", objc_msgSend(v12, "length") + objc_msgSend(v118, "length"));
      [(TIKeyboardInputManagerChinesePhonetic *)self setRemainingInput:v66];

      char v67 = 1;
      uint64_t v54 = (void *)v47;
LABEL_76:

      uint64_t v47 = (uint64_t)v54;
      goto LABEL_77;
    }
    char v67 = 0;
    int v10 = 0;
  }
LABEL_77:
  [(TIKeyboardInputManagerMecabra *)self updateUsageStatisticsForCandidate:v4 isPartial:v24];
  LOBYTE(v24) = v67;
  v48 = v118;
LABEL_78:
  long long v99 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v99 commitSurface:v47];

  long long v100 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
  [v100 clear];

  [(TIKeyboardInputManagerChinesePhonetic *)self clearPinyinSyllableSelection];
  uint64_t v37 = 0;
  NSUInteger v11 = (void *)v47;
  if (v24)
  {
LABEL_79:
    [(TIKeyboardInputManagerMecabra *)self savePartialGeometryData];
    NSUInteger v11 = (void *)v47;
  }
LABEL_80:

LABEL_81:
  [(TIKeyboardInputManagerChinesePhonetic *)self setFilterCandidatesUsingInputIndex:0];
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput]) {
    goto LABEL_89;
  }
  if (v10)
  {
    v101 = [v4 candidate];
    uint64_t v102 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByRemovingSyllableSeparatorsFromString:v101];

    v103 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v103 removeAllInputs];

    uint64_t v104 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v104 commitSurface:v102];
    NSUInteger v11 = (void *)v102;
  }
  else
  {
    v105 = [(TIKeyboardInputManagerMecabra *)self processAcceptedCandidate:v4];

    v106 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    int v107 = [v106 hasDrawInput];

    if (!v107
      || (id v108 = -[TIKeyboardInputManagerChinesePhonetic candidateResultSetByWaitingForResults:](self, "candidateResultSetByWaitingForResults:", 1), -[TIKeyboardInputManagerMecabra composingInput](self, "composingInput"), v109 = objc_claimAutoreleasedReturnValue(), v110 = [v109 hasRemainingComposingInput], v109, (v110 & 1) != 0))
    {
      NSUInteger v11 = v105;
      goto LABEL_89;
    }
    v111 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    NSUInteger v11 = [v111 asCommittedText];

    uint64_t v104 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v104 removeAllInputs];
  }

LABEL_89:
  return v11;
}

- (BOOL)canStartSentenceAfterString:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && (v10.receiver = self,
        v10.super_class = (Class)TIKeyboardInputManagerChinesePhonetic,
        ![(TIKeyboardInputManagerChinesePhonetic *)&v10 canStartSentenceAfterString:v4]))
  {
    uint64_t v6 = -[TIKeyboardInputManagerChinesePhonetic canStartSentenceAfterString:]::ChineseSentenceDelimitingCharacters;
    if (!-[TIKeyboardInputManagerChinesePhonetic canStartSentenceAfterString:]::ChineseSentenceDelimitingCharacters)
    {
      uint64_t v7 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"。？！"];
      unint64_t v8 = (void *)-[TIKeyboardInputManagerChinesePhonetic canStartSentenceAfterString:]::ChineseSentenceDelimitingCharacters;
      -[TIKeyboardInputManagerChinesePhonetic canStartSentenceAfterString:]::ChineseSentenceDelimitingCharacters = v7;

      uint64_t v6 = -[TIKeyboardInputManagerChinesePhonetic canStartSentenceAfterString:]::ChineseSentenceDelimitingCharacters;
    }
    BOOL v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v6, 1, objc_msgSend(v4, "length") - 1, 1) != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)sentenceDelimitingCharacters
{
  return @".?!。？！";
}

- (void)handleAcceptedPinyinDisambiguationCandidate:(id)a3 keyboardState:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 label];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    if (![(TIKeyboardInputManagerChinesePhonetic *)self shouldAdvanceSyllableSelection])[(TIKeyboardInputManagerChinesePhonetic *)self revertLastDisambiguation]; {
    id v8 = v5;
    }
    -[TIKeyboardInputManagerChinesePhonetic setShouldAdvanceSyllableSelection:](self, "setShouldAdvanceSyllableSelection:", [v8 isGeneratedByChoosePinyin] ^ 1);
    [v8 setGeneratedByChoosePinyin:0];
    uint64_t v9 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v9 cancel];

    [(TIKeyboardInputManagerChinesePhonetic *)self setComposedTextBeforeFirstSyllableLocked:*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB90])];
    objc_super v10 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    NSUInteger v11 = [v10 disambiguationCandidates];

    uint64_t v51 = [v11 indexOfObject:v8];
    if (v51 == 0x7FFFFFFFFFFFFFFFLL)
    {

      unsigned int v52 = 0;
    }
    else
    {
      unsigned int v52 = v11;
    }
    self->_lockingPinyinSyllableSelection = 1;
    id v12 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        id v16 = [(TIKeyboardInputManagerChinesePhonetic *)self unconvertedInput];
        unint64_t v17 = [(TIKeyboardInputManagerChinesePhonetic *)self unconvertedInput];
        uint64_t v18 = objc_msgSend(v16, "rangeOfString:options:range:", @"'", 0, v14, objc_msgSend(v17, "length") - v14);

        uint64_t v19 = v18 + 1;
        uint64_t v20 = [(TIKeyboardInputManagerChinesePhonetic *)self unconvertedInput];
        unint64_t v21 = [v20 length];

        if (v18 + 1 > v21) {
          break;
        }
        ++v15;
        unint64_t v22 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
        unint64_t v23 = [v22 count];

        uint64_t v14 = v18 + 1;
        if (v15 >= v23) {
          goto LABEL_14;
        }
      }
      [(TIKeyboardInputManagerChinesePhonetic *)self revertLastDisambiguation];
      uint64_t v19 = v14;
    }
    else
    {
      uint64_t v19 = 0;
    }
LABEL_14:
    uint64_t v24 = [v8 label];
    uint64_t v25 = [(TIKeyboardInputManagerChinesePhonetic *)self unconvertedInput];
    uint64_t v26 = [v25 length];

    uint64_t v27 = [(id)objc_opt_class() ambiguousAndPinyinCharacterSet];
    uint64_t v28 = [v24 rangeOfCharacterFromSet:v27];

    uint64_t v29 = [(id)objc_opt_class() ambiguousAndPinyinCharacterSet];
    id v30 = v29;
    unint64_t v53 = v8;
    if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v31 = [v29 invertedSet];

      id v30 = (void *)v31;
    }
    BOOL v32 = [(TIKeyboardInputManagerChinesePhonetic *)self unconvertedInput];
    uint64_t v33 = objc_msgSend(v32, "rangeOfCharacterFromSet:options:range:", v30, 0, v19, v26 - v19);

    if (v33 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v34 = v26;
    }
    else {
      unint64_t v34 = v33;
    }
    id v35 = [(TIKeyboardInputManagerChinesePhonetic *)self unconvertedInput];
    id v36 = v24;
    uint64_t v37 = [v36 length];
    unint64_t v38 = v37 + v19;
    id v39 = v36;
    if (([v36 hasSuffix:@"'"] & 1) == 0)
    {
      id v39 = v36;
      if (v38 < v34)
      {
        id v39 = v36;
        if (objc_msgSend(v35, "rangeOfString:options:range:", @"'", 2, v37 + v19, 1) == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v39 = [v36 stringByAppendingString:@"'"];
        }
      }
    }
    id v54 = v5;
    uint64_t v50 = v30;
    if (v34 >= v38)
    {
      objc_msgSend(v35, "substringWithRange:", v19, v37);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = objc_msgSend(v35, "stringByReplacingCharactersInRange:withString:", v19, v37, v39);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v56 = "-[TIKeyboardInputManagerChinesePhonetic handleAcceptedPinyinDisambiguationCandidate:keyboardState:]";
        __int16 v57 = 2048;
        uint64_t v58 = v19;
        __int16 v59 = 2048;
        uint64_t v60 = v37;
        __int16 v61 = 2048;
        unint64_t v62 = v34;
        _os_log_fault_impl(&dword_25EC0A000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s: disambiguation candidate(location=%ld, length=%ld) is longer than input(length=%ld). Please file to 'TextInput | Input Managers'", buf, 0x2Au);
      }
      id v40 = v36;
      uint64_t v41 = v35;
    }
    uint64_t v42 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByPrependingConvertedCandidateTextToString:v41];

    uint64_t v43 = (void *)[v52 copy];
    [(TIKeyboardInputManagerChinesePhonetic *)self clearInput];
    uint64_t v44 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
    [v44 addObject:v40];

    BOOL v45 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
    [v45 addObject:v39];

    [(TIKeyboardInputManagerChinesePhonetic *)self setSelectedPinyinSyllableCandidateIndex:v51];
    [(TIKeyboardInputManagerChinesePhonetic *)self setPinyinSyllableCandidates:v43];
    id v46 = objc_alloc_init(MEMORY[0x263F7E648]);
    id v47 = objc_alloc(MEMORY[0x263F7EAB8]);
    v48 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
    int v49 = (void *)[v47 initWithKeyboardState:v48];

    [v46 setString:v42];
    [(TIKeyboardInputManagerChinesePhonetic *)self addInput:v46 withContext:v49];
    self->_lockingPinyinSyllableSelection = 0;

    id v5 = v54;
  }
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  self->_acceptingCandidate = 1;
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(TIKeyboardInputManagerChinesePhonetic *)self handleAcceptedPinyinDisambiguationCandidate:v7 keyboardState:v6];

    id v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
    id v8 = [(TIKeyboardInputManagerMecabra *)&v10 handleAcceptedCandidate:v7 keyboardState:v6];
  }
  self->_acceptingCandidate = 0;
  [(TIKeyboardInputManagerChinese *)self setCurrentKeyHint:0];
  return v8;
}

- (id)defaultCandidate
{
  if ([(TIKeyboardInputManagerChinesePhonetic *)self inputCount])
  {
    BOOL v3 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
    unsigned int v4 = [(TIKeyboardInputManagerChinesePhonetic *)self inputIndex];
    if (v4)
    {
      uint64_t v5 = v4;
      if (v4 <= [(TIKeyboardInputManagerChinesePhonetic *)self inputCount])
      {
        uint64_t v6 = [v3 substringToIndex:v5];

        BOOL v3 = (void *)v6;
      }
    }
    id v7 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByStrippingConvertedCandidateTextFromString:v3];
    if ([v7 length])
    {
      id v8 = v7;

      BOOL v3 = v8;
    }
    id v9 = objc_alloc(MEMORY[0x263F7E640]);
    objc_super v10 = [(TIKeyboardInputManagerChinesePhonetic *)self externalStringToInternal:v3];
    NSUInteger v11 = (void *)[v9 initWithCandidate:v10];
  }
  else
  {
    NSUInteger v11 = 0;
  }
  return v11;
}

- (BOOL)ignoresDeadKeys
{
  return 1;
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E608]);
  return v2;
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

- (BOOL)commitsAcceptedCandidate
{
  return 0;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)suppressCompletionsForFieldEditor
{
  return 0;
}

- (BOOL)suppliesCompletions
{
  return 1;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (BOOL)usesAutoDeleteWord
{
  return 0;
}

- (id)phoneticSortingMethod
{
  return 0;
}

- (id)sortingMethods
{
  v7[2] = *MEMORY[0x263EF8340];
  if ([(TIKeyboardInputManagerChinese *)self showingFacemarkCandidates])
  {
    BOOL v3 = &unk_270B8AF70;
  }
  else if ([(TIKeyboardInputManagerChinese *)self hasIdeographicCandidates])
  {
    if ([(TIKeyboardInputManagerChinesePhonetic *)self hasExtensionEmojiCandidates]
      && ![(TIKeyboardInputManagerChinesePhonetic *)self shouldOmitEmojiCandidates])
    {
      BOOL v3 = &unk_270B8AFA0;
    }
    else if ([(TIKeyboardInputManagerChinesePhonetic *)self inputCount])
    {
      BOOL v3 = &unk_270B8AFD0;
    }
    else
    {
      uint64_t v4 = [(TIKeyboardInputManagerChinesePhonetic *)self phoneticSortingMethod];
      uint64_t v5 = (void *)v4;
      if (v4)
      {
        v7[0] = &unk_270B8B0E0;
        v7[1] = v4;
        BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
      }
      else
      {
        BOOL v3 = &unk_270B8AFB8;
      }
    }
  }
  else
  {
    BOOL v3 = &unk_270B8AF88;
  }
  return v3;
}

- (BOOL)hasExtensionEmojiCandidates
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v2 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  BOOL v3 = [v2 candidates];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__TIKeyboardInputManagerChinesePhonetic_hasExtensionEmojiCandidates__block_invoke;
  v5[3] = &unk_265535488;
  v5[4] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __68__TIKeyboardInputManagerChinesePhonetic_hasExtensionEmojiCandidates__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 isEmojiCandidate] && objc_msgSend(v6, "isExtensionCandidate"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (id)candidateResultSetByWaitingForResults:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(TIKeyboardInputManagerChinesePhonetic *)self shouldSkipCandidateSelection])
  {
    uint64_t v5 = 0;
    goto LABEL_23;
  }
  if ([(TIKeyboardInputManagerChinesePhonetic *)self candidateRange]
    || ([(TIKeyboardInputManagerChinesePhonetic *)self candidateRange], v6))
  {
    id v7 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
    uint64_t v8 = [v7 documentState];
    char v9 = [v8 selectedText];

    uint64_t v10 = [v9 length];
    if (!v10) {
      goto LABEL_7;
    }
    unint64_t v11 = v10;
    id v12 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    uint64_t v13 = [v12 inputs];
    uint64_t v14 = [v13 count];

    if (!v14)
    {
      if (v11 > *MEMORY[0x263F7EBA0]
        || ([MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            uint64_t v25 = [v9 rangeOfCharacterFromSet:v24],
            v24,
            v25 != 0x7FFFFFFFFFFFFFFFLL)
        || [(TIKeyboardInputManagerChinesePhonetic *)self inputMethodType] == 5
        && ![v9 _containsIdeographsOrBopomofoOnly]
        || ([(TIKeyboardInputManagerChinese *)self language],
            uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue(),
            v26,
            v26 == @"yue-Hant"))
      {
        uint64_t v5 = 0;
        goto LABEL_22;
      }
      if (![(TIKeyboardInputManagerChinesePhonetic *)self generateReanalysisCandidatesIfAppropriate])goto LABEL_13; {
    }
      }
    else
    {
LABEL_7:
      unint64_t v15 = [(TIKeyboardInputManagerChinesePhonetic *)self inputStringForSearch];
      if ([v15 length]
        || [(TIKeyboardInputManagerMecabra *)self usesComposingInput]
        && ([(TIKeyboardInputManagerMecabra *)self composingInput],
            uint64_t v20 = objc_claimAutoreleasedReturnValue(),
            [v20 inputs],
            unint64_t v21 = objc_claimAutoreleasedReturnValue(),
            uint64_t v22 = [v21 count],
            v21,
            v20,
            v22))
      {
        BOOL v16 = [(TIKeyboardInputManagerChinesePhonetic *)self updateCandidatesByWaitingForResults:v3];

        if (!v16)
        {
LABEL_13:
          uint64_t v5 = [MEMORY[0x263F7E638] dummySet];
          goto LABEL_22;
        }
      }
      else
      {
        BOOL v23 = [(TIKeyboardInputManagerChinese *)self updateCompletionCandidatesIfAppropriate];

        if (!v23) {
          goto LABEL_13;
        }
      }
    }
    unint64_t v17 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    uint64_t v18 = [(TIKeyboardInputManagerChinesePhonetic *)self rawInputString];
    [(TIKeyboardInputManagerMecabra *)self updateProactiveCandidatesForCandidateResultSet:v17 withInput:v18];

    uint64_t v19 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self candidateResultSetFromWordSearchCandidateResultSet:v19];

LABEL_22:
    goto LABEL_23;
  }
  uint64_t v5 = [MEMORY[0x263F7E638] dummySet];
  uint64_t v28 = [(TIKeyboardInputManagerChinesePhonetic *)self mostRecentCandidateResultSetPendingDisplay];

  if (v28)
  {
    uint64_t v29 = [(TIKeyboardInputManagerChinesePhonetic *)self mostRecentCandidateResultSetPendingDisplay];

    [(TIKeyboardInputManagerChinesePhonetic *)self setMostRecentCandidateResultSetPendingDisplay:0];
    uint64_t v5 = (void *)v29;
  }
LABEL_23:
  return v5;
}

- (unint64_t)predictionOptions
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  unint64_t result = [(TIKeyboardInputManagerChinese *)&v4 predictionOptions];
  if (self->_isInAmbiguousMode) {
    result |= 0x40uLL;
  }
  return result;
}

- (id)candidateResultSet
{
  return [(TIKeyboardInputManagerChinesePhonetic *)self candidateResultSetByWaitingForResults:0];
}

- (unint64_t)phraseBoundary
{
  return [(TIKeyboardInputManagerChinesePhonetic *)self inputIndex];
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  if (self->_isInAmbiguousMode && [(TIKeyboardInputManagerChinesePhonetic *)self hasLockedSyllable])
  {
    uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    if (v5)
    {
    }
    else
    {
      uint64_t v6 = [(TIKeyboardInputManagerChinesePhonetic *)self composedTextBeforeFirstSyllableLocked];
      char v7 = [v6 isEqualToString:*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB90])];

      if (v7) {
        return;
      }
    }
  }
  [(TIKeyboardInputManagerChinesePhonetic *)self clearPinyinSyllableSelection];
  uint64_t v8 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v8 cancel];

  char v9 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v9 clearCache];

  uint64_t v10 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
  [v10 setInputChangedSinceLastConversion:1];

  [(TIKeyboardInputManagerChinese *)self setPairedPunctuationOpenQuote:0];
  [(TIKeyboardInputManagerChinese *)self setPairedPunctuationSelectedText:0];
  unint64_t v11 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
  id v12 = [v11 documentState];
  [v12 selectedRangeInMarkedText];
  uint64_t v14 = v13 + a3;

  [(TIKeyboardInputManagerChinesePhonetic *)self setInputIndex:v14];
  [(TIKeyboardInputManagerChinesePhonetic *)self setFilterCandidatesUsingInputIndex:[(TIKeyboardInputManagerChinesePhonetic *)self isPhraseBoundarySet]];
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    uint64_t v15 = [(TIKeyboardInputManagerChinesePhonetic *)self externalIndexToInternal:v14 shouldBoundToInputCount:0];
    id v16 = [(TIKeyboardInputManagerMecabra *)self _convertInputsToSyntheticInputWithOffset:v14];
    [(TIKeyboardInputManagerMecabra *)self _replaceComposingInputWithSyntheticInput:v16 internalIndex:v15];
  }
}

- (void)setAutoCorrects:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v4 setAutoCorrects:v3];
}

- (BOOL)shouldReplaceCharacterOfInputStringBeforeCursorForInput:(id)a3
{
  return 0;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (void)inputLocationChanged
{
  BOOL v3 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v3 cancel];

  [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
  id v4 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
  [v4 clear];

  [(TIKeyboardInputManagerChinesePhonetic *)self setFilterCandidatesUsingInputIndex:0];
  [(TIKeyboardInputManagerChinesePhonetic *)self clearPinyinSyllableSelection];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  [(TIKeyboardInputManagerChinese *)&v5 inputLocationChanged];
}

- (void)clearInput
{
  BOOL v3 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v3 cancel];

  id v4 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v4 clearCache];

  [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
  [(TIKeyboardInputManagerChinesePhonetic *)self setFilterCandidatesUsingInputIndex:0];
  [(TIKeyboardInputManagerChinesePhonetic *)self setRemainingInput:0];
  if (!self->_acceptingCandidate)
  {
    objc_super v5 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
    [v5 clear];
  }
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  [(TIKeyboardInputManagerChinese *)&v6 clearInput];
}

- (void)resume
{
  BOOL v3 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v3 mecabra];
  MecabraPreheatResources();

  if (-[TIKeyboardInputManagerChinesePhonetic resume]::onceToken != -1) {
    dispatch_once(&-[TIKeyboardInputManagerChinesePhonetic resume]::onceToken, &__block_literal_global_166);
  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  [(TIKeyboardInputManagerMecabra *)&v4 resume];
}

void __47__TIKeyboardInputManagerChinesePhonetic_resume__block_invoke()
{
  _TIQueueBackground();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  TIDispatchAsync();
}

id __47__TIKeyboardInputManagerChinesePhonetic_resume__block_invoke_2()
{
  return (id)[@"a" _stringByConvertingFromHalfWidthToFullWidth];
}

- (id)deleteFromInput:(unint64_t *)a3
{
  [(TIKeyboardInputManagerChinesePhonetic *)self setFilterCandidatesUsingInputIndex:0];
  BOOL v5 = [(TIKeyboardInputManagerChinesePhonetic *)self hasLockedSyllable];
  if (![(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    if ([(TIKeyboardInputManagerChinesePhonetic *)self shouldSkipCandidateSelection])
    {
      v127.receiver = self;
      v127.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
      unint64_t v21 = [(TIKeyboardInputManagerChinese *)&v127 deleteFromInput:a3];
      goto LABEL_73;
    }
    uint64_t v22 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
    int v23 = [v22 isEqualToString:*MEMORY[0x263F7EBF8]];

    if (v23) {
      goto LABEL_10;
    }
    uint64_t v24 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v24 cancel];

    unint64_t v25 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputIndex];
    uint64_t v26 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
    unint64_t v27 = [v26 convertedLength];

    if (v25 < v27)
    {
      uint64_t v28 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
      [v28 invalidate];
    }
    uint64_t v29 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
    id v30 = [v29 documentState];
    unint64_t v17 = [v30 markedText];

    if (v25 == v27)
    {
      uint64_t v31 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
      char v32 = [v31 shouldRevertConvertedCandidateOnDeletionFromMarkedText:v17];

      if ((v32 & 1) == 0)
      {
        uint64_t v33 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
        [v33 invalidate];
      }
    }
    unint64_t v34 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
    uint64_t i = [v34 documentState];

    [i selectedRangeInMarkedText];
    unint64_t v37 = v36;
    if (!v36)
    {
      unint64_t v38 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
      int v39 = [v38 shouldRevertConvertedCandidateOnDeletionFromMarkedText:v17];

      if (v39)
      {
        v121 = i;
        id v40 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
        uint64_t v41 = [v40 lastConvertedCandidate];

        uint64_t v42 = [v41 candidate];
        uint64_t v43 = [v42 input];

        uint64_t v44 = [v41 convertedInput];
        if ([v44 length])
        {
          uint64_t v45 = [v43 length];
          if (v45 == [v44 length])
          {
            int v119 = v17;
            uint64_t v46 = [(TIKeyboardInputManagerChinesePhonetic *)self unconvertedInput];
            id v47 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
            [v47 didRevertLastConvertedCandidate];

            v48 = [v41 revertedInput];
            int v49 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByPrependingConvertedCandidateTextToString:v48];
            v117 = (void *)v46;
            uint64_t v50 = [v49 stringByAppendingString:v46];

            v116 = (void *)v50;
            [(TIKeyboardInputManagerChinesePhonetic *)self setInput:v50];
            uint64_t v51 = [v41 candidate];
            unsigned int v52 = [v51 candidate];
            uint64_t v53 = [v52 length];

            id v54 = [(TIKeyboardInputManagerChinesePhonetic *)self convertedInput];
            unint64_t v55 = [v54 length] + v53;

            uint64_t v56 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
            unint64_t v57 = [v56 count];

            if (v55 <= v57)
            {
              uint64_t v115 = v53;
              uint64_t v58 = v43;
              __int16 v59 = [(TIKeyboardInputManagerChinesePhonetic *)self convertedInput];
              uint64_t v60 = [v59 length];

              uint64_t v61 = [v44 length];
              uint64_t v62 = [v41 geometryData];
              uint64_t v63 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
              v64 = v63;
              if (v62)
              {
                objc_msgSend(v63, "replaceObjectsInRange:withObjectsFromArray:", v60, v115, v62, v62);
              }
              else
              {
                objc_msgSend(v63, "removeObjectsInRange:", v60, v115, 0);

                if (v61)
                {
                  uint64_t v97 = v61;
                  do
                  {
                    [(TIKeyboardInputManagerMecabra *)self insertDummyGeometryDataAtIndex:v60];
                    --v97;
                  }
                  while (v97);
                }
              }
              uint64_t v43 = v58;
              if ([(TIKeyboardInputManagerChinesePhonetic *)self isTypologyEnabled])
              {
                long long v98 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
                unint64_t v99 = [v98 count];

                if (v55 <= v99)
                {
                  long long v100 = [v41 touchData];
                  v101 = [(TIKeyboardInputManagerMecabra *)self touchDataArray];
                  uint64_t v102 = v101;
                  if (v100)
                  {
                    objc_msgSend(v101, "replaceObjectsInRange:withObjectsFromArray:", v60, v115, v100);
                  }
                  else
                  {
                    objc_msgSend(v101, "removeObjectsInRange:", v60, v115);

                    for (; v61; --v61)
                      [(TIKeyboardInputManagerMecabra *)self insertDummyTouchDataAtIndex:v60];
                  }
                }
              }
            }
            v103 = [v41 replacedAmbiguousPinyinSyllables];
            uint64_t v104 = [v103 count];

            if (v104)
            {
              v105 = [v41 replacedAmbiguousPinyinSyllables];
              v106 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
              int v107 = [v105 arrayByAddingObjectsFromArray:v106];
              id v108 = (void *)[v107 mutableCopy];
              [(TIKeyboardInputManagerChinesePhonetic *)self setReplacedAmbiguousPinyinSyllables:v108];

              v109 = [v41 replacementUnambiguousPinyinSyllables];
              char v110 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
              v111 = [v109 arrayByAddingObjectsFromArray:v110];
              v112 = (void *)[v111 mutableCopy];
              [(TIKeyboardInputManagerChinesePhonetic *)self setReplacementUnambiguousPinyinSyllables:v112];
            }
            unint64_t v17 = v119;
            if (a3) {
              *a3 = 0;
            }

            uint64_t i = v121;
            goto LABEL_70;
          }
        }

        uint64_t i = v121;
      }
    }
    [(TIKeyboardInputManagerChinesePhonetic *)self revertLastDisambiguation];
    if (v5)
    {
LABEL_70:

LABEL_71:
      goto LABEL_72;
    }
    unsigned int v65 = [(TIKeyboardInputManagerChinesePhonetic *)self inputIndex];
    uint64_t v66 = (int)*MEMORY[0x263F7EB90];
    unint64_t v67 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v66) length];
    if (!v65 || v67 < v65)
    {
LABEL_52:
      if (![(TIKeyboardInputManagerChinesePhonetic *)self inputCount])
      {
        [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
        [(TIKeyboardInputManagerChinesePhonetic *)self clearPinyinSyllableSelection];
        unint64_t v96 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
        [v96 clear];
      }
      goto LABEL_70;
    }
    if (v37 <= 1) {
      unint64_t v68 = 1;
    }
    else {
      unint64_t v68 = v37;
    }
    v120 = v17;
    uint64_t v122 = i;
    if (v37 || v65 < 2)
    {
      unint64_t v118 = v68;
LABEL_39:
      uint64_t v78 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
      uint64_t v79 = [v78 length];
      v80 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
      uint64_t v81 = v68;
      if (v68 >= [v80 length])
      {
        uint64_t v82 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
        uint64_t v81 = [v82 length];
      }
      unint64_t v83 = v79 - v81;

      v84 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
      unint64_t v85 = [v84 length];

      if (v85 > v83)
      {
        uint64_t v86 = (int)*MEMORY[0x263F7EB98];
        do
        {
          TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                               + v86));
          os_signpost_id_t v87 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
          unint64_t v88 = [v87 length];
        }
        while (v88 > v83);
      }
      if (v25 >= v68) {
        unint64_t v89 = v25 - v68;
      }
      else {
        unint64_t v89 = 0;
      }
      for (uint64_t i = v122; v68; --v68)
      {
        v90 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
        unint64_t v91 = [v90 count];

        if (v89 < v91)
        {
          v92 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
          [v92 removeObjectAtIndex:v89];
        }
      }
      id v93 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v66) substringToIndex:v65 - v118];
      uint64_t v94 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v66) substringFromIndex:v65];
      v95 = [v93 stringByAppendingString:v94];

      [*(id *)((char *)&self->super.super.super.super.super.super.isa + v66) setString:v95];
      unint64_t v17 = v120;
      goto LABEL_52;
    }
    unint64_t v69 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    v126[0] = 0;
    v126[1] = v126;
    v126[2] = 0x2020000000;
    v126[3] = 0;
    v70 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v66);
    v123[0] = MEMORY[0x263EF8330];
    v123[1] = 3221225472;
    v123[2] = __57__TIKeyboardInputManagerChinesePhonetic_deleteFromInput___block_invoke;
    v123[3] = &unk_2655353A0;
    id v71 = v69;
    id v124 = v71;
    v125 = v126;
    objc_msgSend(v70, "enumerateSubstringsInRange:options:usingBlock:", 0, v65, 258, v123);
    if ([v71 count] != 1)
    {
      uint64_t v74 = [v71 count];
      unint64_t v73 = v68;
      if (v74 != 2) {
        goto LABEL_38;
      }
      v75 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
      uint64_t v76 = [v71 indexOfObject:v75];

      if (v76 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [v71 removeObjectAtIndex:v76];
        v77 = [v71 firstObject];
        unint64_t v68 = [v77 length];

        unint64_t v73 = v68 + 1;
        goto LABEL_38;
      }
    }
    v72 = [v71 firstObject];
    unint64_t v68 = [v72 length];

    unint64_t v73 = v68;
LABEL_38:
    unint64_t v118 = v73;

    _Block_object_dispose(v126, 8);
    goto LABEL_39;
  }
  objc_super v6 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v6 cancel];

  char v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  uint64_t v8 = [v7 asInlineText];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F7EBF8]];

  if (!v9)
  {
    uint64_t v10 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    unint64_t v11 = [v10 composingInput];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v13 = [(TIKeyboardInputManagerChinese *)self wordSearch];
      [v13 revertInlineCandidate];
    }
    id v14 = objc_alloc(MEMORY[0x263F7EA08]);
    uint64_t v15 = [(TIKeyboardInputManagerMecabra *)self previouslyDeletedTypeInput];
    id v16 = [(TIKeyboardInputManagerMecabra *)self previouslyProcessedDeleteInput];
    unint64_t v17 = (void *)[v14 initWithDeletedText:0 deleteBySyllable:v15 == 0 shouldDeleteAcceptCandidateInput:v16 == 0];

    uint64_t v18 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    [v18 composeNew:v17];

    [(TIKeyboardInputManagerMecabra *)self processDeleteInputs];
    [(TIKeyboardInputManagerMecabra *)self setPreviouslyProcessedDeleteInput:v17];
    TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                         + (int)*MEMORY[0x263F7EB98]));
    uint64_t v19 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    uint64_t v20 = [v19 composingInput];

    if (!v20) {
      [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
    }
    goto LABEL_71;
  }
LABEL_10:
  [(TIKeyboardInputManagerChinesePhonetic *)self clearInput];
LABEL_72:
  unint64_t v21 = 0;
LABEL_73:
  return v21;
}

uint64_t __57__TIKeyboardInputManagerChinesePhonetic_deleteFromInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t result = [*(id *)(a1 + 32) addObject:a2];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void *)(v10 + 24) + 1;
  *(void *)(v10 + 24) = v11;
  if (v11 == 2) {
    *a7 = 1;
  }
  return result;
}

- (id)convertInputsToSyntheticInputUptoCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput]
    && ([(TIKeyboardInputManagerMecabra *)self composingInput],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 hasKindOf:objc_opt_class()],
        v5,
        v6))
  {
    unint64_t v7 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputIndex];
  }
  else
  {
    unint64_t v7 = -1;
  }
  uint64_t v8 = [NSNumber numberWithInteger:v7];
  int v9 = [(TIKeyboardInputManagerMecabra *)self _convertInputsToSyntheticInputUptoCount:v3 cursorIndex:v8];

  return v9;
}

- (id)uncommittedText
{
  uint64_t v3 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  objc_super v4 = [v3 candidates];
  BOOL v5 = [v4 firstObject];

  uint64_t v6 = [v5 input];
  unint64_t v7 = (void *)v6;
  uint64_t v8 = &stru_270B867F0;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  int v9 = v8;

  uint64_t v10 = [(TIKeyboardInputManagerChinesePhonetic *)self composedTextForSelectedCandidate:v5 remainingInput:v9];
  if ([v10 length])
  {
    uint64_t v11 = v10;

    int v9 = v11;
  }

  return v9;
}

- (unint64_t)internalInputIndex
{
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput]
    && ([(TIKeyboardInputManagerMecabra *)self composingInput],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 hasKindOf:objc_opt_class()],
        v3,
        v4))
  {
    return [(TIKeyboardInputManagerMecabra *)self inputIndexWithDrawInput];
  }
  else
  {
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
    if (!v6) {
      return 0;
    }
    uint64_t v7 = *(unsigned int *)(v6 + 96);
    if (!v7) {
      return 0;
    }
    uint64_t v8 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    uint64_t v9 = [v8 length];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__TIKeyboardInputManagerChinesePhonetic_internalInputIndex__block_invoke;
    v11[3] = &unk_265535458;
    v11[4] = &v13;
    v11[5] = v12;
    v11[6] = v7;
    objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 514, v11);
    unint64_t v10 = v14[3];
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v13, 8);

    return v10;
  }
}

void *__59__TIKeyboardInputManagerChinesePhonetic_internalInputIndex__block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  *(void *)(*(void *)(result[4] + 8) + 24) += a4;
  uint64_t v7 = *(void *)(result[5] + 8);
  unint64_t v8 = *(void *)(v7 + 24) + 1;
  *(void *)(v7 + 24) = v8;
  if (v8 >= result[6]) {
    *a7 = 1;
  }
  return result;
}

- (unint64_t)internalInputCount
{
  id v2 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
  unint64_t v3 = [v2 length];

  return v3;
}

- (id)inputString
{
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  unint64_t v3 = [(TIKeyboardInputManagerChinesePhonetic *)&v7 inputString];
  if ([v3 length])
  {
    int v4 = [(TIKeyboardInputManagerChinesePhonetic *)self candidateForInlineTextSegmentation];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 candidate];

      unint64_t v3 = (void *)v5;
    }
  }
  return v3;
}

- (unsigned)inputIndex
{
  unint64_t v3 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [(TIKeyboardInputManagerChinesePhonetic *)self candidateForInlineTextSegmentation];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 candidate];
      uint64_t v7 = [v6 length];

      if (v7)
      {
        unint64_t v8 = [v5 candidate];
        unsigned int v9 = [v8 length];

        return v9;
      }
    }
  }
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    unint64_t v10 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    int v11 = [v10 hasKindOf:objc_opt_class()];

    if (v11)
    {
      uint64_t v12 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputIndex];
    }
    else
    {
      id v14 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      uint64_t v12 = [v14 asInlineTextCursorIndex];
    }
    unsigned int v13 = [(TIKeyboardInputManagerChinesePhonetic *)self internalIndexToExternal:v12];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
    unsigned int v13 = [(TIKeyboardInputManagerChinesePhonetic *)&v16 inputIndex];
  }
  unsigned int v9 = v13;
  if (([(TIKeyboardInputManagerChinesePhonetic *)self shouldSkipCandidateSelection] & 1) == 0
    && v9 >= [(TIKeyboardInputManagerChinesePhonetic *)self inputCount])
  {
    return [(TIKeyboardInputManagerChinesePhonetic *)self inputCount];
  }
  return v9;
}

- (unsigned)inputCount
{
  if ([(TIKeyboardInputManagerChinesePhonetic *)self shouldSkipCandidateSelection])
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
    return [(TIKeyboardInputManagerChinesePhonetic *)&v6 inputCount];
  }
  else
  {
    uint64_t v4 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
    unsigned int v3 = [v4 length];
  }
  return v3;
}

- (void)setInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v5 cancel];

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  [(TIKeyboardInputManagerChinese *)&v8 setInput:v4];

  if (self->_isInAmbiguousMode)
  {
    objc_super v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB90]);
    uint64_t v7 = objc_msgSend((id)objc_opt_class(), "stringFallBackForTenKeyInput:range:", v6, 0, objc_msgSend(v6, "length"));
    [v6 setString:v7];
  }
  else
  {
    [(TIKeyboardInputManagerChinesePhonetic *)self clearPinyinSyllableSelection];
  }
  [(TIKeyboardInputManagerChinesePhonetic *)self setFilterCandidatesUsingInputIndex:0];
}

- (void)addInputToInternal:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]))
  {
    uint64_t v6 = [v4 length];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__TIKeyboardInputManagerChinesePhonetic_addInputToInternal___block_invoke;
    void v7[3] = &unk_265535430;
    v7[4] = self;
    id v8 = v5;
    objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 514, v7);
  }
}

void __60__TIKeyboardInputManagerChinesePhonetic_addInputToInternal___block_invoke(uint64_t a1, int a2, NSString *a3, _NSRange a4)
{
  v5[4] = *MEMORY[0x263EF8340];
  v6.id location = v6.length;
  KB::utf8_substring(v5, *(KB **)(a1 + 40), a3, v6);
  TIInputManager::add_input();
  KB::String::~String((KB::String *)v5);
}

- (BOOL)handleDirectlyCommitForInput:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 length]) {
    goto LABEL_8;
  }
  if ([(TIKeyboardInputManagerChinesePhonetic *)self _shouldCommitInputDirectly:v6])
  {
    if ([(TIKeyboardInputManagerChinesePhonetic *)self inputCount])
    {
      id v8 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
      uint64_t v9 = [v8 keyboardType];

      if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 3
        || [(TIKeyboardInputManagerChinesePhonetic *)self isPhraseBoundarySet])
      {
        goto LABEL_6;
      }
      uint64_t v12 = [(TIKeyboardInputManagerChinese *)self firstCandidate];
      if (v12)
      {
        unsigned int v13 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
        uint64_t v14 = [v13 convertedLength];
        uint64_t v15 = [v12 input];
        unint64_t v16 = [v15 length] + v14;
        if (v16 >= [(TIKeyboardInputManagerChinesePhonetic *)self internalInputCount])
        {
          char v17 = [v6 isEqualToString:@"'"];

          if ((v17 & 1) == 0)
          {
            [(TIKeyboardInputManagerChinese *)self acceptFirstCandidateWithContext:v7];
            BOOL v10 = 1;
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      BOOL v10 = 0;
LABEL_15:

      goto LABEL_9;
    }
    [(TIKeyboardInputManagerChinesePhonetic *)self acceptCurrentCandidateWithContext:v7];
LABEL_8:
    BOOL v10 = 1;
    goto LABEL_9;
  }
LABEL_6:
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (id)remapInput:(id)a3 isFacemarkInput:(BOOL *)a4
{
  id v6 = a3;
  *a4 = 0;
  if ([v6 isEqualToString:@"☻"])
  {
    id v7 = (id)*MEMORY[0x263F7EBF8];

    *a4 = 1;
    id v6 = v7;
  }
  else if ([(TIKeyboardInputManagerChinese *)self isFacemarkInput:v6])
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v8 = [(TIKeyboardInputManagerChinese *)self outputByConvertingDecimalPointForInput:v6];

    id v6 = (id)v8;
  }
  return v6;
}

- (int64_t)addTouch:(id)a3 shouldHitTest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(TIKeyboardInputManagerMecabra *)self shouldClearBeforeContinuousPath])
  {
    [(TIKeyboardInputManagerMecabra *)self setShouldClearBeforeContinuousPath:0];
    [(TIKeyboardInputManagerChinesePhonetic *)self clearInput];
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  id v7 = [(TIKeyboardInputManagerMecabra *)&v9 addTouch:v6 shouldHitTest:v4];

  return (int64_t)v7;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(TIKeyboardInputManagerChinese *)self setCurrentKeyHint:0];
  if (![(TIKeyboardInputManagerChinese *)self handlePairedPunctuationInput:v6 context:v7])
  {
    uint64_t v8 = [v6 string];
    [(TIKeyboardInputManagerChinesePhonetic *)self setFilterCandidatesUsingInputIndex:0];
    objc_super v9 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
    char v10 = [v9 shouldSkipCandidateSelection];

    if (v10)
    {
      int v11 = [v6 string];
      uint64_t v12 = [v11 length];

      if (v12)
      {
        v78.receiver = self;
        v78.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
        [(TIKeyboardInputManagerChinesePhonetic *)&v78 addInput:v6 withContext:v7];
        BOOL v13 = 0;
      }
      else
      {
        BOOL v13 = 1;
      }
      uint64_t v14 = v8;
    }
    else
    {
      v87[0] = 0;
      uint64_t v14 = [(TIKeyboardInputManagerChinesePhonetic *)self remapInput:v8 isFacemarkInput:v87];

      if ([v6 isMultitap])
      {
        uint64_t v84 = 1;
        id v15 = [(TIKeyboardInputManagerChinesePhonetic *)self deleteFromInput:&v84];
        [v7 deleteBackward:v84];
      }
      BOOL v13 = [(TIKeyboardInputManagerChinesePhonetic *)self handleDirectlyCommitForInput:v14 withContext:v7];
      if (!v13)
      {
        if (v87[0]
          || [(TIKeyboardInputManagerChinese *)self showingFacemarkCandidates]
          || ([(TIKeyboardInputManagerChinesePhonetic *)self internalInputString],
              unint64_t v16 = objc_claimAutoreleasedReturnValue(),
              BOOL v17 = [(TIKeyboardInputManagerChinese *)self isFacemarkInput:v16],
              v16,
              v17))
        {
          if (self->_isCandidateSelected)
          {
            [(TIKeyboardInputManagerChinesePhonetic *)self acceptCurrentCandidateWithContext:v7];
          }
          else if ([(TIKeyboardInputManagerChinesePhonetic *)self inputCount])
          {
            [(TIKeyboardInputManagerChinese *)self acceptFirstCandidateWithContext:v7];
          }
        }
        uint64_t v18 = [(TIKeyboardInputManagerChinese *)self wordSearch];
        [v18 cancel];

        if ([(TIKeyboardInputManagerChinesePhonetic *)self shouldReplaceCharacterOfInputStringBeforeCursorForInput:v14])
        {
          uint64_t v84 = 1;
          id v19 = [(TIKeyboardInputManagerChinesePhonetic *)self deleteFromInput:&v84];
        }
        if ([v14 length] == 1 && (objc_msgSend(v14, "isEqualToString:", @"'") & 1) == 0)
        {
          uint64_t v20 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
          uint64_t v21 = [v20 count];

          if (v21)
          {
            uint64_t v22 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
            int v23 = [v22 componentsJoinedByString:&stru_270B867F0];
            uint64_t v24 = [v23 length];

            unint64_t v25 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
            uint64_t v26 = [v25 length];

            if (v24 == v26)
            {
              unint64_t v27 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
              uint64_t v28 = [v27 lastObject];
              [v28 stringByAppendingString:@"'"];
              id v30 = v29 = v13;

              uint64_t v31 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
              [v31 removeLastObject];

              char v32 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
              [v32 addObject:v30];

              [(TIKeyboardInputManagerChinesePhonetic *)self addInputToInternal:@"'"];
              BOOL v13 = v29;
            }
          }
        }
        [(TIKeyboardInputManagerChinesePhonetic *)self addInputToInternal:v14];
        if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
        {
          uint64_t v33 = (void *)TIInputManager::keys_for_input(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.isa
                                                                            + (int)*MEMORY[0x263F7EB98]));
          if (v33)
          {
            unint64_t v34 = v33;
            uint64_t v35 = *v33;
            uint64_t v36 = v33[2];
            unint64_t v85 = 0;
            uint64_t v86 = 0;
            uint64_t v84 = v35;
            if (v36)
            {
              uint64_t v86 = v36;
              unint64_t v37 = malloc_type_malloc(8 * v36, 0x2004093837F09uLL);
              unint64_t v85 = v37;
              if (v37)
              {
                if (*v34)
                {
                  unint64_t v38 = (atomic_uint **)v34[1];
                  uint64_t v39 = 8 * *v34;
                  do
                  {
                    id v40 = *v38;
                    *unint64_t v37 = *v38;
                    if (v40) {
                      atomic_fetch_add(v40, 1u);
                    }
                    ++v37;
                    ++v38;
                    v39 -= 8;
                  }
                  while (v39);
                }
              }
            }
          }
          else
          {
            uint64_t v84 = 0;
            unint64_t v85 = 0;
            uint64_t v86 = 0;
          }
          BOOL v76 = v13;
          v77 = v14;
          v75 = asMCNearbyKeys();
          if (v84)
          {
            uint64_t v41 = (uint64_t *)v85;
            uint64_t v42 = 8 * v84;
            do
            {
              uint64_t v43 = *v41;
              if (*v41)
              {
                unsigned int v44 = atomic_load((unsigned int *)v43);
                if (v44 == 1)
                {
                  uint64_t v45 = *(void *)(v43 + 8);
                  if (v45) {
                    WTF::RefCounted<TI::Favonius::Key>::deref(v45);
                  }
                  MEMORY[0x2611ED4A0](v43, 0x1020C40DF844C36);
                }
                else
                {
                  atomic_fetch_add((atomic_uint *volatile)v43, 0xFFFFFFFF);
                }
              }
              ++v41;
              v42 -= 8;
            }
            while (v42);
            uint64_t v84 = 0;
          }
          uint64_t v46 = v85;
          unint64_t v85 = 0;
          uint64_t v86 = 0;
          free(v46);
          id v73 = objc_alloc(MEMORY[0x263F7EA20]);
          uint64_t v74 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
          id v47 = [v74 layoutState];
          uint64_t v48 = [v47 userInterfaceIdiom];
          int v49 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
          uint64_t v50 = [v49 splitKeyboardMode];
          uint64_t v51 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
          uint64_t v52 = [v51 floatingKeyboardMode];
          uint64_t v53 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
          id v54 = objc_msgSend(v73, "initWithUserInterfaceIdiom:isSplitKeyboard:isFloatingKeyboard:isHardwareKeyboard:", v48, v50, v52, objc_msgSend(v53, "hardwareKeyboardMode"));

          uint64_t v14 = v77;
          uint64_t v55 = [v77 length];
          v79[0] = MEMORY[0x263EF8330];
          v79[1] = 3221225472;
          v79[2] = __62__TIKeyboardInputManagerChinesePhonetic_addInput_withContext___block_invoke;
          v79[3] = &unk_265535408;
          id v80 = v6;
          uint64_t v81 = self;
          id v82 = v75;
          id v83 = v54;
          id v56 = v54;
          id v57 = v75;
          objc_msgSend(v77, "enumerateSubstringsInRange:options:usingBlock:", 0, v55, 2, v79);
          [(TIKeyboardInputManagerMecabra *)self setPreviouslyDeletedTypeInput:0];
          [(TIKeyboardInputManagerMecabra *)self setPreviouslyProcessedDeleteInput:0];

          BOOL v13 = v76;
        }
        if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB90]))
        {
          if (_os_feature_enabled_impl())
          {
            uint64_t v58 = [(TIKeyboardInputManagerChinesePhonetic *)self segments];
            unint64_t v59 = [v58 count];
            unint64_t v60 = [(id)objc_opt_class() maxNumberOfUncommittedSegments];

            if (v59 > v60) {
              [(TIKeyboardInputManagerChinesePhonetic *)self autocommitHeadSegmentWithContext:v7];
            }
          }
          unint64_t v61 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputIndex];
          uint64_t v62 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
          unint64_t v63 = [v62 convertedLength];

          if (v61 <= v63)
          {
            v64 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
            [v64 invalidate];
          }
          [(TIKeyboardInputManagerChinesePhonetic *)self updateComposedText];
        }
      }
      if (![(TIKeyboardInputManagerChinesePhonetic *)self skipSetMarkedTextDuringInput])
      {
        if ([(TIKeyboardInputManagerChinesePhonetic *)self inputCount])
        {
          [(TIKeyboardInputManagerChinesePhonetic *)self setMarkedText];
        }
        else if ([v14 length])
        {
          [v7 insertText:v14];
        }
      }
    }
    if (!self->_acceptingCandidate && !self->_lockingPinyinSyllableSelection)
    {
      unsigned int v65 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
      [v65 setInputChangedSinceLastConversion:1];
    }
    if ([(TIKeyboardInputManagerChinesePhonetic *)self usesGeometryModelData])
    {
      uint64_t v66 = [(TIKeyboardInputManagerChinesePhonetic *)self pinyinSyllableCandidates];
      if ([v66 count]) {
        unint64_t v67 = [(TIKeyboardInputManagerChinesePhonetic *)self selectedPinyinSyllableCandidateIndex];
      }
      else {
        unint64_t v67 = 0x7FFFFFFFFFFFFFFFLL;
      }

      unint64_t v68 = [(TIKeyboardInputManagerChinese *)self wordSearch];
      unint64_t v69 = [(TIKeyboardInputManagerChinesePhonetic *)self inputStringForSearch];
      v70 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      id v71 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
      objc_msgSend(v68, "clearCacheForInputString:keyboardInput:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:", v69, v70, objc_msgSend(v71, "count"), v67);
    }
    if (([v6 isFlick] & 1) == 0 && (objc_msgSend(v6, "isMultitap") & 1) == 0)
    {
      v72 = [v6 inputManagerHint];
      [(TIKeyboardInputManagerChinese *)self setCurrentKeyHint:v72];
    }
    if (((v13 | [(TIKeyboardInputManagerMecabra *)self usesComposingInput]) & 1) == 0) {
      [(TIKeyboardInputManagerMecabra *)self saveGeometryForInput:v6 atIndex:[(TIKeyboardInputManagerChinesePhonetic *)self internalInputIndex]];
    }
  }
}

void __62__TIKeyboardInputManagerChinesePhonetic_addInput_withContext___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    unsigned int v3 = *(void **)(a1 + 32);
    id v4 = a2;
    uint64_t v5 = [v3 touchEvent];
    [v5 location];
    double v7 = v6;
    double v9 = v8;

    if ([*(id *)(a1 + 40) shouldRescaleTouchPoints])
    {
      double v11 = *MEMORY[0x263F00148];
      double v10 = *(double *)(MEMORY[0x263F00148] + 8);
      if (v7 != *MEMORY[0x263F00148] || v9 != v10)
      {
        [*(id *)(a1 + 40) currentCharacterKeysLayoutFrame];
        [*(id *)(a1 + 40) baseCharacterKeysLayoutFrame];
        TI_GET_SCALED_POINT();
        double v11 = v13;
        double v10 = v14;
      }
    }
    else
    {
      double v10 = v9;
      double v11 = v7;
    }
    id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F7EA30]), "initWithCharacters:point:nearbyKeys:sourceKeyboardState:", v4, *(void *)(a1 + 48), *(void *)(a1 + 56), v11, v10);

    id v15 = [*(id *)(a1 + 40) composingInput];
    [v15 composeNew:v16];
  }
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v9 = *(void *)&a4;
  id v11 = a3;
  *a6 = 0;
  if ((v9 & 8) != 0) {
    id v12 = [(TIKeyboardInputManagerChinesePhonetic *)self deleteFromInput:a6];
  }
  uint64_t v17 = 0;
  if ([(TIKeyboardInputManagerChinesePhonetic *)self shouldSkipCandidateSelection])double v13 = (unint64_t *)&v17; {
  else
  }
    double v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  double v14 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v16, sel_addInput_flags_point_firstDelete_, v11, v9, v13, x, y);

  return v14;
}

- (BOOL)_shouldCommitInputDirectly:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManagerChinesePhonetic *)self isSpecialInput:v4]
    || [(TIKeyboardInputManagerMecabra *)self stringContainsActiveSupplementalLexiconSearchPrefix:v4])
  {
    goto LABEL_3;
  }
  unsigned int v7 = [(TIKeyboardInputManagerChinesePhonetic *)self inputCount];
  if (!v7)
  {
    id v11 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
    if ([v11 convertedLength])
    {
      unint64_t v12 = [v4 length];

      if (v12 > 1)
      {
LABEL_3:
        BOOL v5 = 0;
        goto LABEL_4;
      }
    }
    else
    {
    }
  }
  if (self->_isInAmbiguousMode && [(TIKeyboardInputManagerChinese *)self isAlphabeticPlane])
  {
    BOOL v5 = 1;
  }
  else
  {
    if (GetDirectlyCommittedNumbersAndPunctuationSet(void)::__onceToken != -1) {
      dispatch_once(&GetDirectlyCommittedNumbersAndPunctuationSet(void)::__onceToken, &__block_literal_global_447);
    }
    uint64_t v8 = [v4 rangeOfCharacterFromSet:GetDirectlyCommittedNumbersAndPunctuationSet(void)::__directNumbersAndPunctuationSet];
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    BOOL v5 = v9;
    if (!v7 && v8)
    {
      double v10 = [(id)objc_opt_class() directlyCommittedCharacterSetForEmptyInline];
      BOOL v5 = [v4 rangeOfCharacterFromSet:v10] == 0;
    }
  }
LABEL_4:

  return v5;
}

- (BOOL)isSpecialInput:(id)a3
{
  id v4 = a3;
  BOOL v5 = ![v4 length]
    || (unint64_t)[v4 length] > 2
    || [(TIKeyboardInputManagerChinese *)self isFacemarkInput:v4]
    || [(TIKeyboardInputManagerChinesePhonetic *)self inputContinuesGB18030OrUnicodeLookupKey:v4];

  return v5;
}

- (BOOL)inputContinuesGB18030OrUnicodeLookupKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_isInAmbiguousMode)
  {
    BOOL v5 = 0;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v21[0] = @"|g|";
    v21[1] = @"|u|";
    double v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v21, 2, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v12 = [v11 rangeOfString:v4];
          if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          {
            double v13 = [v11 substringToIndex:v12];
            if (![v13 length])
            {

LABEL_15:
              BOOL v5 = 1;
              goto LABEL_16;
            }
            double v14 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
            char v15 = [v13 isEqualToString:v14];

            if (v15) {
              goto LABEL_15;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 0;
LABEL_16:
  }
  return v5;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManagerChinesePhonetic *)self logger];
  [v5 beginLogging];

  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  double v6 = [(TIKeyboardInputManagerMecabra *)&v9 handleKeyboardInput:v4];

  uint64_t v7 = [(TIKeyboardInputManagerChinesePhonetic *)self logger];
  [v7 markTime:1];

  return v6;
}

- (void)setInHardwareKeyboardMode:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL isInAmbiguousMode = self->_isInAmbiguousMode;
  double v6 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v6 setTenKeyPinyinEnabled:isInAmbiguousMode];

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  [(TIKeyboardInputManagerChinesePhonetic *)&v7 setInHardwareKeyboardMode:v3];
}

- (id)keyboardConfigurationLayoutTag
{
  if (self->_isInAmbiguousMode && [(TIKeyboardInputManagerChinesePhonetic *)self inputCount])
  {
    BOOL v3 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
    BOOL v4 = [(TIKeyboardInputManagerChinese *)self isFacemarkInput:v3];

    if (v4)
    {
      BOOL v5 = [(TIKeyboardInputManagerChinese *)self shouldEnableHalfWidthPunctuationForCurrentInputContext];
      double v6 = kDisambiguationLayoutTag;
      if (v5) {
        double v6 = kHalfWidthPunctuationLayoutTag;
      }
    }
    else
    {
      double v6 = kSeparatorLayoutTag;
    }
  }
  else if ([(TIKeyboardInputManagerChinese *)self shouldEnableHalfWidthPunctuationForCurrentInputContext])
  {
    double v6 = kHalfWidthPunctuationLayoutTag;
  }
  else
  {
    double v6 = &kDefaultLayoutTag;
  }
  objc_super v7 = *v6;
  return v7;
}

- (void)syncToLayoutState:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  id v4 = a3;
  [(TIKeyboardInputManagerChinese *)&v8 syncToLayoutState:v4];
  BOOL v5 = objc_msgSend(v4, "softwareLayout", v8.receiver, v8.super_class);

  self->_BOOL isInAmbiguousMode = [v5 hasPrefix:@"Pinyin10"];
  BOOL isInAmbiguousMode = self->_isInAmbiguousMode;
  objc_super v7 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v7 setTenKeyPinyinEnabled:isInAmbiguousMode];
}

- (unsigned)externalIndexToInternal:(unsigned int)a3 shouldBoundToInputCount:(BOOL)a4
{
  unsigned int v5 = a3;
  uint64_t v7 = (int)*MEMORY[0x263F7EB90];
  objc_super v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v7);
  if (v8)
  {
    if ([v8 length] >= (unint64_t)a3) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v7) length];
    }
    uint64_t v15 = 0;
    objc_super v16 = &v15;
    uint64_t v17 = 0x2020000000;
    int v18 = 0;
    double v10 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v7);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __89__TIKeyboardInputManagerChinesePhonetic_externalIndexToInternal_shouldBoundToInputCount___block_invoke;
    v14[3] = &unk_2655353A0;
    v14[4] = self;
    v14[5] = &v15;
    objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 514, v14);
    unsigned int v5 = *((_DWORD *)v16 + 6);
    _Block_object_dispose(&v15, 8);
  }
  uint64_t v11 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
  if (v11)
  {
    unsigned int v12 = -858993459 * ((*(void *)(v11 + 16) - *(void *)(v11 + 8)) >> 3);
    if (v5 > v12 && a4) {
      return v12;
    }
  }
  return v5;
}

void __89__TIKeyboardInputManagerChinesePhonetic_externalIndexToInternal_shouldBoundToInputCount___block_invoke(uint64_t a1, int a2, NSString *a3, _NSRange a4)
{
  void v10[4] = *MEMORY[0x263EF8340];
  v11.id location = v11.length;
  KB::utf8_substring(v10, *(KB **)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F7EB90]), a3, v11);
  double v6 = [*(id *)(a1 + 32) syllableSeparator];
  KB::utf8_string(v9, v6, v7);
  char v8 = KB::String::equal((KB::String *)v10, (const KB::String *)v9);
  KB::String::~String((KB::String *)v9);

  KB::String::~String((KB::String *)v10);
  if ((v8 & 1) == 0) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (unsigned)externalIndexToInternal:(unsigned int)a3
{
  return [(TIKeyboardInputManagerChinesePhonetic *)self externalIndexToInternal:*(void *)&a3 shouldBoundToInputCount:1];
}

- (unsigned)internalIndexToExternal:(unsigned int)a3
{
  unsigned int v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB90]);
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
    id v6 = [(TIKeyboardInputManagerChinesePhonetic *)self internalStringToExternal:v7];
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = a3;
  uint64_t v8 = [v6 length];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__TIKeyboardInputManagerChinesePhonetic_internalIndexToExternal___block_invoke;
  v12[3] = &unk_265535378;
  double v14 = self;
  uint64_t v15 = &v16;
  id v13 = v6;
  id v9 = v6;
  objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 514, v12);
  unsigned int v10 = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __65__TIKeyboardInputManagerChinesePhonetic_internalIndexToExternal___block_invoke(uint64_t a1, int a2, NSString *a3, _NSRange a4, uint64_t a5, unsigned char *a6)
{
  v14[4] = *MEMORY[0x263EF8340];
  if ((unint64_t)a3 >= *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *a6 = 1;
  }
  else
  {
    NSUInteger length = v15.length;
    v15.id location = v15.length;
    KB::utf8_substring(v14, *(KB **)(a1 + 32), a3, v15);
    id v9 = [*(id *)(a1 + 40) syllableSeparator];
    KB::utf8_string(v13, v9, v10);
    int v11 = KB::String::equal((KB::String *)v14, (const KB::String *)v13);
    KB::String::~String((KB::String *)v13);

    KB::String::~String((KB::String *)v14);
    if (v11)
    {
      unsigned int v12 = [*(id *)(a1 + 40) syllableSeparator];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v12 length];
    }
    else if (length >= 2)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = length
                                                                  + *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 24)
                                                                  - 1;
    }
  }
}

- (id)internalStringToExternal:(id)a3
{
  id v4 = (__CFString *)a3;
  if ([(TIKeyboardInputManagerChinesePhonetic *)self shouldSkipCandidateSelection])
  {
    v16.receiver = self;
    v16.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
    unsigned int v5 = [(TIKeyboardInputManager_mul *)&v16 internalStringToExternal:v4];
LABEL_5:
    id v9 = v5;

    goto LABEL_15;
  }
  uint64_t v6 = (int)*MEMORY[0x263F7EB90];
  uint64_t v7 = [(TIKeyboardInputManagerChinesePhonetic *)self externalStringToInternal:*(Class *)((char *)&self->super.super.super.super.super.super.isa + v6)];
  int v8 = [v7 isEqualToString:v4];

  if (v8)
  {
    unsigned int v5 = (__CFString *)*(id *)((char *)&self->super.super.super.super.super.super.isa + v6);
    goto LABEL_5;
  }
  unsigned int v10 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
  id v9 = v4;
  if ([(__CFString *)v4 isEqualToString:v10])
  {
    id v9 = v4;
    if ([(__CFString *)v4 length])
    {
      int v11 = [(TIKeyboardInputManagerChinesePhonetic *)self candidateForInlineTextSegmentation];
      if (v11)
      {
        unsigned int v12 = [(TIKeyboardInputManagerChinesePhonetic *)self internalInputString];
        id v9 = [(TIKeyboardInputManagerChinesePhonetic *)self composedTextForSelectedCandidate:v11 remainingInput:v12];
      }
      else
      {
        id v9 = v4;
        if (!self->_isInAmbiguousMode)
        {
LABEL_13:

          goto LABEL_14;
        }
        objc_msgSend((id)objc_opt_class(), "stringFallBackForTenKeyInput:range:", v10, 0, objc_msgSend(v10, "length"));
        id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        unsigned int v12 = v4;
      }

      goto LABEL_13;
    }
  }
LABEL_14:

LABEL_15:
  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = &stru_270B867F0;
  }
  double v14 = v13;

  return v14;
}

- (id)externalStringToInternal:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManagerChinesePhonetic *)self shouldSkipCandidateSelection])
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
    uint64_t v5 = [(TIKeyboardInputManager_mul *)&v8 externalStringToInternal:v4];
  }
  else
  {
    uint64_t v5 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByRemovingSyllableSeparatorsFromString:v4];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (id)stringByRemovingSyllableSeparatorsFromString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
  uint64_t v6 = [v4 stringByReplacingOccurrencesOfString:v5 withString:&stru_270B867F0];

  return v6;
}

- (BOOL)doesComposeText
{
  return 1;
}

- (id)searchStringForMarkedText
{
  if (self->_isInAmbiguousMode)
  {
    BOOL v3 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
    id v4 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByRemovingSyllableSeparatorsFromString:v3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
    id v4 = [(TIKeyboardInputManagerChinese *)&v6 searchStringForMarkedText];
  }
  return v4;
}

- (NSString)internalInputString
{
  uint64_t v13[4] = *MEMORY[0x263EF8340];
  if ([(TIKeyboardInputManagerMecabra *)self usesComposingInput])
  {
    BOOL v3 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    int v4 = [v3 hasKindOf:objc_opt_class()];

    if (v4)
    {
      uint64_t v5 = [(TIKeyboardInputManagerChinesePhonetic *)self candidateForInlineTextSegmentation];
      objc_super v6 = v5;
      if (!v5)
      {
        unsigned int v12 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        unsigned int v10 = [v12 asInlineText];

        goto LABEL_9;
      }
      uint64_t v7 = [v5 input];
    }
    else
    {
      objc_super v6 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      uint64_t v7 = [v6 asInlineText];
    }
    unsigned int v10 = (void *)v7;
LABEL_9:

    goto LABEL_11;
  }
  objc_super v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
  if (v8)
  {
    TIInputManager::input_string(v13, v8);
    unsigned int v10 = KB::ns_string((KB *)v13, v9);
    KB::String::~String((KB::String *)v13);
  }
  else
  {
    unsigned int v10 = 0;
  }
LABEL_11:
  return (NSString *)v10;
}

- (void)revertLastDisambiguation
{
  if ([(TIKeyboardInputManagerChinesePhonetic *)self hasLockedSyllable])
  {
    if ([(TIKeyboardInputManagerChinesePhonetic *)self isPhraseBoundarySet]) {
      uint64_t v3 = [(TIKeyboardInputManagerChinesePhonetic *)self externalIndexToInternal:[(TIKeyboardInputManagerChinesePhonetic *)self inputIndex]];
    }
    else {
      uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v20 = [(TIKeyboardInputManagerChinesePhonetic *)self unconvertedInput];
    int v4 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
    uint64_t v5 = [v4 lastObject];

    unint64_t v6 = [v5 length];
    uint64_t v7 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
    [v7 removeLastObject];

    objc_super v8 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
    id v9 = [v8 lastObject];

    unsigned int v10 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
    [v10 removeLastObject];

    [(TIKeyboardInputManagerChinesePhonetic *)self setSelectedPinyinSyllableCandidateIndex:0x7FFFFFFFFFFFFFFFLL];
    int v11 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
    unsigned int v12 = [v11 componentsJoinedByString:&stru_270B867F0];
    uint64_t v13 = [v12 length];
    uint64_t v14 = [v9 length];

    _NSRange v15 = v20;
    if (v14 + v13 <= (unint64_t)[v20 length])
    {
      _NSRange v15 = objc_msgSend(v20, "stringByReplacingCharactersInRange:withString:", v13, v14, v5);
    }
    objc_super v16 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByPrependingConvertedCandidateTextToString:v15];
    [(TIKeyboardInputManagerChinesePhonetic *)self setInput:v16];

    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
      uint64_t v18 = [v17 convertedLength];

      uint64_t v19 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
      if (v3 != v18 && v3 - v18 > v6) {
        [v9 hasSuffix:@"'"];
      }
      TIInputManager::set_input_index(v19);
    }
  }
}

- (void)shiftPinyinSyllableSelection
{
  uint64_t v3 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
    [v5 removeObjectAtIndex:0];

    unint64_t v6 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
    [v6 removeObjectAtIndex:0];

    [(TIKeyboardInputManagerChinesePhonetic *)self setPinyinSyllableCandidates:0];
    [(TIKeyboardInputManagerChinesePhonetic *)self setSelectedPinyinSyllableCandidateIndex:0x7FFFFFFFFFFFFFFFLL];
  }
}

- (void)clearPinyinSyllableSelection
{
  uint64_t v3 = [(TIKeyboardInputManagerChinesePhonetic *)self replacedAmbiguousPinyinSyllables];
  [v3 removeAllObjects];

  uint64_t v4 = [(TIKeyboardInputManagerChinesePhonetic *)self replacementUnambiguousPinyinSyllables];
  [v4 removeAllObjects];

  [(TIKeyboardInputManagerChinesePhonetic *)self setPinyinSyllableCandidates:0];
  [(TIKeyboardInputManagerChinesePhonetic *)self setSelectedPinyinSyllableCandidateIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)storeLanguageModelDynamicDataIncludingCache
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  [(TIKeyboardInputManagerMecabra *)&v4 storeLanguageModelDynamicDataIncludingCache];
  if ([(TIKeyboardInputManagerChinesePhonetic *)self isTypologyEnabled])
  {
    uint64_t v3 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v3 mecabra];
    MecabraFlushDynamicData();
  }
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  [(TIKeyboardInputManagerChinese *)&v8 syncToKeyboardState:a3 from:a4 afterContextChange:a5];
  unint64_t v6 = [(TIKeyboardInputManagerChinesePhonetic *)self keyboardState];
  uint64_t v7 = [v6 currentCandidate];
  self->_isCandidateSelected = v7 != 0;

  if (self->_isCandidateSelected && !self->_isInAmbiguousMode)
  {
    [(TIKeyboardInputManagerChinesePhonetic *)self updateComposedText];
    [(TIKeyboardInputManagerChinesePhonetic *)self setMarkedText];
  }
}

- (id)newInputManagerState
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  id v2 = [(TIKeyboardInputManagerChinesePhonetic *)&v4 newInputManagerState];
  if (GetInputsPreventingAcceptCurrentCandidateIfSelectedSet(void)::onceToken != -1) {
    dispatch_once(&GetInputsPreventingAcceptCurrentCandidateIfSelectedSet(void)::onceToken, &__block_literal_global_444);
  }
  [v2 setInputsPreventingAcceptSelectedCandidate:GetInputsPreventingAcceptCurrentCandidateIfSelectedSet(void)::__inputsPreventingAcceptCurrentCandidateIfSelectedSet];
  return v2;
}

- (BOOL)supportsPerRecipientLearning
{
  return 1;
}

- (void)didDeleteCandidates:(id)a3
{
  objc_super v4 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v4 clearCache];

  id v5 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
  [v5 clear];
}

- (void)suspend
{
  uint64_t v3 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v3 clearCache];

  [(TIMecabraIMLogger *)self->_logger writeLogToFile];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  [(TIKeyboardInputManagerMecabra *)&v4 suspend];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  [(TIKeyboardInputManagerMecabra *)&v4 dealloc];
}

- (BOOL)supportsNumberKeySelection
{
  id v2 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (TIKeyboardInputManagerChinesePhonetic)initWithConfig:(id)a3 keyboardState:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManagerChinesePhonetic;
  objc_super v4 = [(TIKeyboardInputManagerChinese *)&v17 initWithConfig:a3 keyboardState:a4];
  id v5 = v4;
  if (v4)
  {
    v4->_isCandidateSelected = 0;
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    replacedAmbiguousPinyinSyllables = v5->_replacedAmbiguousPinyinSyllables;
    v5->_replacedAmbiguousPinyinSyllables = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x263EFF980] array];
    replacementUnambiguousPinyinSyllables = v5->_replacementUnambiguousPinyinSyllables;
    v5->_replacementUnambiguousPinyinSyllables = (NSMutableArray *)v8;

    v5->_selectedPinyinSyllableCandidateIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    v5->_shouldAdvanceSyllableSelection = 1;
    unsigned int v10 = objc_alloc_init(TIConversionHistory);
    conversionHistordouble y = v5->_conversionHistory;
    v5->_conversionHistordouble y = v10;

    segments = v5->_segments;
    v5->_segments = (NSArray *)MEMORY[0x263EFFA68];

    if ([MEMORY[0x263F7EB08] isLoggingEnabled])
    {
      uint64_t v13 = (TIMecabraIMLogger *)objc_alloc_init(MEMORY[0x263F7EB08]);
      logger = v5->_logger;
      v5->_logger = v13;

      NSLog(&cfstr_TimecabraimLog.isa);
    }
    _NSRange v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v5 selector:sel_didDeleteCandidates_ name:@"MecabraDatabaseDeletedAllElementsNotification" object:0];
  }
  return v5;
}

+ (unint64_t)maxNumberOfUncommittedSegments
{
  return 3;
}

+ (id)stringFallBackForTenKeyInput:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = (void *)MEMORY[0x263F089D8];
  id v8 = a3;
  id v9 = [v7 string];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__TIKeyboardInputManagerChinesePhonetic_stringFallBackForTenKeyInput_range___block_invoke;
  v12[3] = &unk_2655354D8;
  id v14 = a1;
  id v10 = v9;
  id v13 = v10;
  objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", location, length, 2, v12);

  return v10;
}

void __76__TIKeyboardInputManagerChinesePhonetic_stringFallBackForTenKeyInput_range___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 ambiguousDefaults];
  id v7 = [v5 objectForKey:v4];

  if (v7) {
    id v6 = v7;
  }
  else {
    id v6 = v4;
  }
  [*(id *)(a1 + 32) appendString:v6];
}

+ (id)directlyCommittedCharacterSetForEmptyInline
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__TIKeyboardInputManagerChinesePhonetic_directlyCommittedCharacterSetForEmptyInline__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[TIKeyboardInputManagerChinesePhonetic directlyCommittedCharacterSetForEmptyInline]::__onceToken != -1) {
    dispatch_once(&+[TIKeyboardInputManagerChinesePhonetic directlyCommittedCharacterSetForEmptyInline]::__onceToken, block);
  }
  id v2 = (void *)+[TIKeyboardInputManagerChinesePhonetic directlyCommittedCharacterSetForEmptyInline]::__committedCharacterSetForEmptyInline;
  return v2;
}

void __84__TIKeyboardInputManagerChinesePhonetic_directlyCommittedCharacterSetForEmptyInline__block_invoke()
{
  id v3 = [MEMORY[0x263F089C0] letterCharacterSet];
  id v0 = [(id)objc_opt_class() ambiguousPinyinSet];
  [v3 formUnionWithCharacterSet:v0];

  uint64_t v1 = [v3 invertedSet];
  id v2 = (void *)+[TIKeyboardInputManagerChinesePhonetic directlyCommittedCharacterSetForEmptyInline]::__committedCharacterSetForEmptyInline;
  +[TIKeyboardInputManagerChinesePhonetic directlyCommittedCharacterSetForEmptyInline]::__committedCharacterSetForEmptyInline = v1;
}

+ (id)ambiguousDefaults
{
  id v2 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousDefaults]::_ambiguousDefaults;
  if (!+[TIKeyboardInputManagerChinesePhonetic ambiguousDefaults]::_ambiguousDefaults)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"a", @"➋", @"d", @"➌", @"g", @"➍", @"j", @"➎", @"m", @"➏", @"p", @"➐", @"t", @"➑", @"w", @"➒", 0);
    id v4 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousDefaults]::_ambiguousDefaults;
    +[TIKeyboardInputManagerChinesePhonetic ambiguousDefaults]::_ambiguousDefaults = v3;

    id v2 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousDefaults]::_ambiguousDefaults;
  }
  return v2;
}

+ (id)ambiguousAndPinyinCharacterSet
{
  if (+[TIKeyboardInputManagerChinesePhonetic ambiguousAndPinyinCharacterSet]::__onceToken != -1) {
    dispatch_once(&+[TIKeyboardInputManagerChinesePhonetic ambiguousAndPinyinCharacterSet]::__onceToken, &__block_literal_global_560);
  }
  id v2 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousAndPinyinCharacterSet]::__ambiguousAndPinyinCharacterSet;
  return v2;
}

uint64_t __71__TIKeyboardInputManagerChinesePhonetic_ambiguousAndPinyinCharacterSet__block_invoke()
{
  +[TIKeyboardInputManagerChinesePhonetic ambiguousAndPinyinCharacterSet]::__ambiguousAndPinyinCharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"➋➌➍➎➏➐➑➒abcdefghijklmnopqrstuvwxyz'"];
  return MEMORY[0x270F9A758]();
}

+ (id)ambiguousPinyinSet
{
  id v2 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousPinyinSet]::_ambiguousPinyinSet;
  if (!+[TIKeyboardInputManagerChinesePhonetic ambiguousPinyinSet]::_ambiguousPinyinSet)
  {
    uint64_t v3 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"➋➌➍➎➏➐➑➒"];
    id v4 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousPinyinSet]::_ambiguousPinyinSet;
    +[TIKeyboardInputManagerChinesePhonetic ambiguousPinyinSet]::_ambiguousPinyinSet = v3;

    id v2 = (void *)+[TIKeyboardInputManagerChinesePhonetic ambiguousPinyinSet]::_ambiguousPinyinSet;
  }
  return v2;
}

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

@end