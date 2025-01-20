@interface TIMecabraEnvironment
+ (id)getWordFrom:(void *)a3 atIndex:(unint64_t)a4 forSurface:(BOOL)a5;
+ (id)getWordFromAnalysisStringOf:(void *)a3 atIndex:(unint64_t)a4;
+ (id)getWordFromSurfaceOf:(void *)a3 atIndex:(unint64_t)a4;
+ (id)loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer:(id)a3 inputModes:(id)a4 onQueue:(id)a5 oldMobileAssetChangeListener:(id)a6;
+ (id)loadMobileAssetContentsWhenMobileAssetChangesForMecabra:(__Mecabra *)a3 inputModes:(id)a4 onQueue:(id)a5 oldMobileAssetChangeListener:(id)a6;
+ (int)maxNumberOfDrawSamples;
+ (void)loadMobileAssetContentsForInputModes:(id)a3 assetContentTypes:(id)a4 inMecabra:(__Mecabra *)a5 onQueue:(id)a6;
+ (void)loadMobileAssetContentsForInputModes:(id)a3 assetContentTypes:(id)a4 onQueue:(id)a5 withCompletionBlock:(id)a6;
+ (void)loadMobileAssetContentsForInputModes:(id)a3 inMecabra:(__Mecabra *)a4 onQueue:(id)a5;
+ (void)loadMobileAssetContentsForInputModes:(id)a3 onQueue:(id)a4 withCompletionBlock:(id)a5;
+ (void)removeMobileAssetListener:(id)a3;
- (BOOL)addNewCandidatesIfNecessary:(int64_t)a3;
- (BOOL)analyzeInput:(id)a3 options:(unint64_t)a4;
- (BOOL)analyzeString:(id)a3 options:(unint64_t)a4;
- (BOOL)canSuggestSupplementalItems;
- (BOOL)documentContextIsEmpty;
- (BOOL)predictionAnalyzeWithOptions:(unint64_t)a3 maxNumberOfCandidates:(unint64_t)a4;
- (BOOL)shouldAdjustOnAnalyze;
- (NSArray)contextCandidateSurfaces;
- (NSArray)inlineCandidateSurfaces;
- (NSArray)rightCandidateSurfaces;
- (NSDictionary)environmentDebuggingInformation;
- (NSMutableArray)candidatesLeftOfCaret;
- (NSMutableArray)candidatesRightOfCaret;
- (NSMutableArray)candidatesToDelete;
- (NSString)leftDocumentContext;
- (NSString)leftDocumentContextCorrespondingToCandidates;
- (NSString)rightDocumentContext;
- (NSString)rightDocumentContextCorrespondingToCandidates;
- (TIKeyboardLayout)baseLayout;
- (TIMecabraEnvironment)initWithMecabraEngine:(__Mecabra *)a3 language:(int)a4;
- (TIMecabraEnvironmentContextWrapper)mecabraContextWrapper;
- (_NSRange)leftDocumentContextCorrespondingToCandidatesRange;
- (_NSRange)rightDocumentContextCorrespondingToCandidatesRange;
- (__Mecabra)mecabra;
- (id)_longestWubiCodeForCharacter:(id)a3;
- (id)_wubiCodeForWord:(id)a3;
- (id)contactNameWubiCodePairsForFirstName:(id)a3 lastName:(id)a4;
- (id)findSupplementalLexiconCandidatesSurroundingCursor;
- (id)readingForWubiWord:(id)a3;
- (id)wubiAnnotationForCandidate:(id)a3;
- (int)mecabraLanguage;
- (int)textContentType;
- (unint64_t)candidateIndex;
- (void)acceptInlineCandidates;
- (void)addCandidateWithString:(id)a3 toArray:(id)a4;
- (void)addPunctuationCandidateToContext:(id)a3;
- (void)addStringCandidateToContextInternal:(id)a3;
- (void)adjustEnvironment:(int64_t)a3;
- (void)analyzeCandidateContextWithSplit:(BOOL)a3;
- (void)commitPredictionCandidate:(void *)a3;
- (void)compareDocumentAndEnvironmentCandidates;
- (void)completelyCommitInlineCandidate:(void *)a3;
- (void)createNewCandidatesFromDocumentContext;
- (void)declareEndOfSentence;
- (void)insertCandidateWithString:(id)a3 intoArray:(id)a4 atIndex:(unint64_t)a5;
- (void)partiallyCommitInlineCandidate:(void *)a3;
- (void)reset;
- (void)revertInlineCandidate;
- (void)revertLearningOfCandidateIfNecessary;
- (void)setAppContext:(id)a3;
- (void)setCanSuggestSupplementalItems:(BOOL)a3;
- (void)setCandidateIndex:(int64_t)a3;
- (void)setCandidatesLeftOfCaret:(id)a3;
- (void)setCandidatesRightOfCaret:(id)a3;
- (void)setCandidatesToDelete:(id)a3;
- (void)setGeometryModel:(void *)a3 modelData:(__CFArray *)a4;
- (void)setKeyboardLayout:(id)a3;
- (void)setLeftDocumentContext:(id)a3;
- (void)setLeftDocumentContextCorrespondingToCandidates:(id)a3;
- (void)setLeftDocumentContextCorrespondingToCandidatesRange:(_NSRange)a3;
- (void)setLeftDocumentContextInternal:(id)a3;
- (void)setMecabraContextWrapper:(id)a3;
- (void)setMecabraLanguage:(int)a3;
- (void)setPrivateMode:(BOOL)a3;
- (void)setRightDocumentContext:(id)a3;
- (void)setRightDocumentContextCorrespondingToCandidates:(id)a3;
- (void)setRightDocumentContextCorrespondingToCandidatesRange:(_NSRange)a3;
- (void)setShouldAdjustOnAnalyze:(BOOL)a3;
- (void)setShuangpinType:(int)a3;
- (void)setTextContentType:(int)a3;
- (void)updateCursorPosition;
@end

@implementation TIMecabraEnvironment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidatesToDelete, 0);
  objc_storeStrong((id *)&self->_rightDocumentContextCorrespondingToCandidates, 0);
  objc_storeStrong((id *)&self->_leftDocumentContextCorrespondingToCandidates, 0);
  objc_storeStrong((id *)&self->_candidatesRightOfCaret, 0);
  objc_storeStrong((id *)&self->_candidatesLeftOfCaret, 0);
  objc_storeStrong((id *)&self->_mecabraContextWrapper, 0);
  objc_storeStrong((id *)&self->_baseLayout, 0);
  objc_storeStrong((id *)&self->_rightDocumentContext, 0);

  objc_storeStrong((id *)&self->_leftDocumentContext, 0);
}

- (void)setCanSuggestSupplementalItems:(BOOL)a3
{
  self->_canSuggestSupplementalItems = a3;
}

- (BOOL)canSuggestSupplementalItems
{
  return self->_canSuggestSupplementalItems;
}

- (void)setCandidatesToDelete:(id)a3
{
}

- (void)setRightDocumentContextCorrespondingToCandidatesRange:(_NSRange)a3
{
  self->_rightDocumentContextCorrespondingToCandidatesRange = a3;
}

- (_NSRange)rightDocumentContextCorrespondingToCandidatesRange
{
  NSUInteger length = self->_rightDocumentContextCorrespondingToCandidatesRange.length;
  NSUInteger location = self->_rightDocumentContextCorrespondingToCandidatesRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLeftDocumentContextCorrespondingToCandidatesRange:(_NSRange)a3
{
  self->_leftDocumentContextCorrespondingToCandidatesRange = a3;
}

- (_NSRange)leftDocumentContextCorrespondingToCandidatesRange
{
  NSUInteger length = self->_leftDocumentContextCorrespondingToCandidatesRange.length;
  NSUInteger location = self->_leftDocumentContextCorrespondingToCandidatesRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRightDocumentContextCorrespondingToCandidates:(id)a3
{
}

- (NSString)rightDocumentContextCorrespondingToCandidates
{
  return self->_rightDocumentContextCorrespondingToCandidates;
}

- (void)setLeftDocumentContextCorrespondingToCandidates:(id)a3
{
}

- (NSString)leftDocumentContextCorrespondingToCandidates
{
  return self->_leftDocumentContextCorrespondingToCandidates;
}

- (void)setCandidatesRightOfCaret:(id)a3
{
}

- (void)setCandidatesLeftOfCaret:(id)a3
{
}

- (void)setShouldAdjustOnAnalyze:(BOOL)a3
{
  self->_shouldAdjustOnAnalyze = a3;
}

- (BOOL)shouldAdjustOnAnalyze
{
  return self->_shouldAdjustOnAnalyze;
}

- (void)setMecabraLanguage:(int)a3
{
  self->_mecabraLanguage = a3;
}

- (int)mecabraLanguage
{
  return self->_mecabraLanguage;
}

- (void)setMecabraContextWrapper:(id)a3
{
}

- (TIMecabraEnvironmentContextWrapper)mecabraContextWrapper
{
  return self->_mecabraContextWrapper;
}

- (NSArray)rightCandidateSurfaces
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  v4 = [v3 environmentCandidates];

  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  v7 = [v6 contextCandidates];
  v8 = [v5 setWithArray:v7];

  v9 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if ((objc_msgSend(v8, "containsObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17) & 1) == 0)
        {
          v15 = MecabraCandidateGetSurface();
          if (v15) {
            [v9 addObject:v15];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return (NSArray *)v9;
}

- (NSArray)inlineCandidateSurfaces
{
  v2 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  v3 = [v2 inlineCandidates];
  v4 = [v3 mecabraCandidateSurfaces];

  return (NSArray *)v4;
}

- (NSArray)contextCandidateSurfaces
{
  v2 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  v3 = [v2 contextCandidateStrings];

  return (NSArray *)v3;
}

- (NSDictionary)environmentDebuggingInformation
{
  v32[8] = *MEMORY[0x1E4F143B8];
  v31[0] = @"TIMecabraEnvironmentCandidateIndex";
  v3 = NSNumber;
  v30 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  v29 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v30, "candidateIndex"));
  v32[0] = v29;
  v31[1] = @"TIMecabraEnvironmentPositionWithinCandidate";
  v4 = NSNumber;
  v28 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  v5 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v28, "candidateInternalIndex"));
  v32[1] = v5;
  v31[2] = @"TIMecabraEnvironmentContextCandidateSurfaces";
  uint64_t v6 = [(TIMecabraEnvironment *)self contextCandidateSurfaces];
  v7 = (void *)v6;
  uint64_t v8 = MEMORY[0x1E4F1CBF0];
  if (v6) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
  }
  v32[2] = v9;
  v31[3] = @"TIMecabraEnvironmentInlineCandidateSurfaces";
  uint64_t v10 = [(TIMecabraEnvironment *)self inlineCandidateSurfaces];
  uint64_t v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v8;
  }
  v32[3] = v12;
  v31[4] = @"TIMecabraEnvironmentRightCandidateSurfaces";
  uint64_t v13 = [(TIMecabraEnvironment *)self rightCandidateSurfaces];
  v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v8;
  }
  v32[4] = v15;
  v31[5] = @"TIMecabraEnvironmentLeftContext";
  uint64_t v16 = [(TIMecabraEnvironment *)self leftDocumentContext];
  long long v17 = (void *)v16;
  if (v16) {
    long long v18 = (__CFString *)v16;
  }
  else {
    long long v18 = &stru_1F3F7A998;
  }
  v32[5] = v18;
  v31[6] = @"TIMecabraEnvironmentRightContext";
  uint64_t v19 = [(TIMecabraEnvironment *)self rightDocumentContext];
  long long v20 = (void *)v19;
  if (v19) {
    v21 = (__CFString *)v19;
  }
  else {
    v21 = &stru_1F3F7A998;
  }
  v32[6] = v21;
  v31[7] = @"TIMecabraEnvironmentTemporaryCandidates";
  uint64_t v22 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  uint64_t v23 = [v22 temporaryCandidates];
  v24 = (void *)v23;
  if (v23) {
    uint64_t v25 = v23;
  }
  else {
    uint64_t v25 = v8;
  }
  v32[7] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:8];

  return (NSDictionary *)v26;
}

- (void)reset
{
  [(TIMecabraEnvironment *)self setLeftDocumentContext:&stru_1F3F7A998];
  [(TIMecabraEnvironment *)self setRightDocumentContext:&stru_1F3F7A998];
  v3 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v3 clearAll];

  [(TIMecabraEnvironment *)self setCanSuggestSupplementalItems:1];
}

- (id)findSupplementalLexiconCandidatesSurroundingCursor
{
  if ([(TIMecabraEnvironment *)self canSuggestSupplementalItems])
  {
    v3 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
    v4 = [v3 findSupplementalLexiconCandidatesSurroundingCursor];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (void)setPrivateMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v4 setPrivateMode:v3];
}

- (void)declareEndOfSentence
{
  id v2 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v2 declareEndOfSentence];
}

- (void)addPunctuationCandidateToContext:(id)a3
{
  [(TIMecabraEnvironment *)self addStringCandidateToContextInternal:a3];
  id v4 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v4 declareEndOfSentence];
}

- (void)revertInlineCandidate
{
  id v2 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v2 revertInlineCandidate];
}

- (void)completelyCommitInlineCandidate:(void *)a3
{
  v5 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  uint64_t v6 = [v5 candidateInternalIndex];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    [(TIMecabraEnvironment *)self adjustEnvironment:4];
  }
  v7 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v7 completelyCommitInlineCandidate:a3];

  MecabraCandidateGetSurface();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if ([v10 length] && MecabraCandidateGetType() == 6)
  {
    uint64_t v8 = [(TIMecabraEnvironment *)self leftDocumentContext];
    uint64_t v9 = [v8 stringByAppendingString:v10];
    [(TIMecabraEnvironment *)self setLeftDocumentContextInternal:v9];
  }
}

- (void)partiallyCommitInlineCandidate:(void *)a3
{
  v5 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  uint64_t v6 = [v5 candidateInternalIndex];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    [(TIMecabraEnvironment *)self adjustEnvironment:4];
  }
  id v7 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v7 partiallyCommitInlineCandidate:a3];
}

- (void)acceptInlineCandidates
{
  id v2 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v2 acceptInlineCandidates];
}

- (id)readingForWubiWord:(id)a3
{
  id v4 = a3;
  if ([v4 _containsIdeographicCharacters])
  {
    v5 = [(TIMecabraEnvironment *)self _wubiCodeForWord:v4];
    if ([v5 length] == 4) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)contactNameWubiCodePairsForFirstName:(id)a3 lastName:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if ([v7 _containsIdeographicCharacters]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v8;

  if ([v6 _containsIdeographicCharacters]) {
    id v10 = v6;
  }
  else {
    id v10 = 0;
  }
  unint64_t v11 = v10;

  uint64_t v12 = 0;
  if (v9 | v11)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    if (v9 && v11)
    {
      v14 = [(id)v11 stringByAppendingString:v9];
      [v13 addObject:v14];
    }
    if ((unint64_t)[(id)v9 _graphemeCount] >= 2) {
      [v13 addObject:v9];
    }
    if ((unint64_t)[(id)v11 _graphemeCount] >= 2) {
      [v13 addObject:v11];
    }
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 2 * objc_msgSend(v13, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v21 = -[TIMecabraEnvironment _wubiCodeForWord:](self, "_wubiCodeForWord:", v20, (void)v23);
          if ([v21 length] == 4)
          {
            [v12 addObject:v20];
            [v12 addObject:v21];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v17);
    }
  }

  return v12;
}

- (id)_wubiCodeForWord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _graphemeCount];
  if (v5 == 3)
  {
    uint64_t v13 = [v4 _graphemeAtIndex:0];
    id v7 = [(TIMecabraEnvironment *)self _longestWubiCodeForCharacter:v13];

    v14 = [v4 _graphemeAtIndex:1];
    unint64_t v9 = [(TIMecabraEnvironment *)self _longestWubiCodeForCharacter:v14];

    id v15 = [v4 _graphemeAtIndex:2];
    id v10 = [(TIMecabraEnvironment *)self _longestWubiCodeForCharacter:v15];

    if ([v7 length] && objc_msgSend(v9, "length") && (unint64_t)objc_msgSend(v10, "length") > 1)
    {
      unint64_t v11 = [v7 substringToIndex:1];
      uint64_t v16 = [v9 substringToIndex:1];
      uint64_t v17 = [v11 stringByAppendingString:v16];
      uint64_t v18 = [v10 substringToIndex:2];
      uint64_t v12 = [v17 stringByAppendingString:v18];

      goto LABEL_10;
    }

    goto LABEL_18;
  }
  if (v5 == 2)
  {
    id v6 = [v4 _firstGrapheme];
    id v7 = [(TIMecabraEnvironment *)self _longestWubiCodeForCharacter:v6];

    uint64_t v8 = [v4 _lastGrapheme];
    unint64_t v9 = [(TIMecabraEnvironment *)self _longestWubiCodeForCharacter:v8];

    if ((unint64_t)[v7 length] >= 2 && (unint64_t)objc_msgSend(v9, "length") >= 2)
    {
      id v10 = [v7 substringToIndex:2];
      unint64_t v11 = [v9 substringToIndex:2];
      uint64_t v12 = [v10 stringByAppendingString:v11];
LABEL_10:

      goto LABEL_20;
    }
LABEL_18:

LABEL_19:
    uint64_t v12 = 0;
    goto LABEL_20;
  }
  if (v5 < 4) {
    goto LABEL_19;
  }
  uint64_t v19 = [v4 _graphemeAtIndex:0];
  uint64_t v20 = [(TIMecabraEnvironment *)self _longestWubiCodeForCharacter:v19];

  char v21 = 1;
  uint64_t v22 = [v4 _graphemeAtIndex:1];
  long long v23 = [(TIMecabraEnvironment *)self _longestWubiCodeForCharacter:v22];

  long long v24 = [v4 _graphemeAtIndex:2];
  long long v25 = [(TIMecabraEnvironment *)self _longestWubiCodeForCharacter:v24];

  uint64_t v12 = [v4 _lastGrapheme];
  long long v26 = [(TIMecabraEnvironment *)self _longestWubiCodeForCharacter:v12];

  if ([v20 length])
  {
    if ([v23 length] && objc_msgSend(v25, "length") && objc_msgSend(v26, "length"))
    {
      v33 = [v20 substringToIndex:1];
      v32 = [v23 substringToIndex:1];
      v27 = [v33 stringByAppendingString:v32];
      uint64_t v28 = [v25 substringToIndex:1];
      v29 = [v27 stringByAppendingString:v28];
      v30 = [v26 substringToIndex:1];
      uint64_t v12 = [v29 stringByAppendingString:v30];

      char v21 = 0;
    }
    else
    {
      char v21 = 1;
    }
  }

  if (v21) {
    goto LABEL_19;
  }
LABEL_20:

  return v12;
}

- (id)_longestWubiCodeForCharacter:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TIMecabraEnvironment *)self mecabra];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)MecabraCreateWubixingCodesFromSurface();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      unint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
      unint64_t v12 = objc_msgSend(v11, "length", (void)v15);
      if (v12 > [v8 length])
      {
        id v13 = v11;

        uint64_t v8 = v13;
      }
      if ([v8 length] == 4) {
        break;
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)wubiAnnotationForCandidate:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TIMecabraEnvironment *)self mecabra];
  WubixingCodesFromSurface = (void *)MecabraCreateWubixingCodesFromSurface();
  if ((unint64_t)[WubixingCodesFromSurface count] <= 1
    || ([WubixingCodesFromSurface objectAtIndexedSubscript:0],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 length],
        v6,
        v7 > 2))
  {
    long long v17 = [WubixingCodesFromSurface firstObject];
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = objc_msgSend(WubixingCodesFromSurface, "subarrayWithRange:", 1, objc_msgSend(WubixingCodesFromSurface, "count") - 1);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unint64_t v11 = 0;
      uint64_t v12 = *(void *)v22;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
        unint64_t v15 = [v14 length];
        if (v15 > [v11 length])
        {
          id v16 = v14;

          unint64_t v11 = v16;
        }
        if ([v11 length] == 4) {
          break;
        }
        if (v10 == ++v13)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v10) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
    else
    {
      unint64_t v11 = 0;
    }

    long long v18 = NSString;
    uint64_t v19 = [WubixingCodesFromSurface objectAtIndexedSubscript:0];
    long long v17 = [v18 stringWithFormat:@"%@, %@", v19, v11];
  }

  return v17;
}

- (void)setShuangpinType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v4 setShuangpinType:v3];
}

- (void)setAppContext:(id)a3
{
  id v4 = a3;
  id v5 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v5 setAppContext:v4];
}

- (void)addStringCandidateToContextInternal:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    id v4 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
    id v5 = (void *)[v4 createMecabraCandidateFromString:v6];

    [(TIMecabraEnvironment *)self completelyCommitInlineCandidate:v5];
  }
}

- (void)setKeyboardLayout:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = __Block_byref_object_copy__475;
  uint64_t v12 = __Block_byref_object_dispose__476;
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v13 = [v4 array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__TIMecabraEnvironment_setKeyboardLayout___block_invoke;
  v7[3] = &unk_1E6E29968;
  v7[4] = &v8;
  [v5 enumerateKeysUsingBlock:v7];

  id v6 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v6 setKeyboardLayout:v9[5]];

  _Block_object_dispose(&v8, 8);
}

void __42__TIMecabraEnvironment_setKeyboardLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = [NSString stringWithUTF8String:a2];
  }
  else
  {
    uint64_t v3 = &stru_1F3F7A998;
  }
  id v5 = v3;
  if ([(__CFString *)v3 length] == 1)
  {
    [(__CFString *)v5 _firstChar];
    LayoutKey = (const void *)MecabraCreateLayoutKey();
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:LayoutKey];
    CFRelease(LayoutKey);
  }
}

- (void)setGeometryModel:(void *)a3 modelData:(__CFArray *)a4
{
  if (a4)
  {
    id v6 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
    [v6 setGeometryModel:a3 modelData:a4];
  }
}

- (void)commitPredictionCandidate:(void *)a3
{
  id v4 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v4 commitPredictionCandidate:a3];
}

- (BOOL)predictionAnalyzeWithOptions:(unint64_t)a3 maxNumberOfCandidates:(unint64_t)a4
{
  [(TIMecabraEnvironment *)self adjustEnvironment:0];
  unint64_t v7 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  LOBYTE(a4) = [v7 predictionCandidatesWithOptions:a3 maxNumberOfCandidates:a4];

  return a4;
}

- (BOOL)analyzeInput:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  LOBYTE(a4) = [v7 analyzeInput:v6 options:a4];

  return a4;
}

- (BOOL)analyzeString:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  LOBYTE(a4) = [v7 analyzeString:v6 options:a4];

  return a4;
}

- (__Mecabra)mecabra
{
  return [(TIMecabraEnvironmentContextWrapper *)self->_mecabraContextWrapper mecabraEngine];
}

- (TIKeyboardLayout)baseLayout
{
  id v2 = self;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  baseLayout = self->_baseLayout;
  if (!baseLayout)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v5 = [(TIMecabraEnvironment *)v2 mecabraLanguage];
    if ((v5 - 1) >= 2)
    {
      if (v5 != 4)
      {
LABEL_30:

        baseLayout = v2->_baseLayout;
        goto LABEL_31;
      }
      id v6 = @"continuous_path_base_layout_ko";
    }
    else
    {
      id v6 = @"continuous_path_base_layout";
    }
    uint64_t v7 = [v4 pathForResource:v6 ofType:@"plist"];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7];
      if (v9)
      {
        id v47 = 0;
        uint64_t v48 = 0;
        uint64_t v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:&v48 error:&v47];
        unint64_t v11 = v47;
        if (v11)
        {
          if (TICanLogMessageAtLevel_onceToken != -1) {
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
          }
          uint64_t v12 = TIOSLogFacility();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            id v13 = [NSString stringWithFormat:@"%s Error loading continuous_path_base_layout.plist : %@", "-[TIMecabraEnvironment baseLayout]", v11];
            *(_DWORD *)buf = 138412290;
            v50 = v13;
            _os_log_debug_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
        else
        {
          id v15 = objc_alloc(MEMORY[0x1E4FAE360]);
          id v16 = [v10 objectForKeyedSubscript:@"keys"];
          uint64_t v17 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));
          long long v18 = v2->_baseLayout;
          v2->_baseLayout = (TIKeyboardLayout *)v17;

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v42 = v10;
          uint64_t v12 = [v10 objectForKeyedSubscript:@"keys"];
          uint64_t v19 = [v12 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            v40 = v8;
            v41 = v4;
            uint64_t v21 = *(void *)v44;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v44 != v21) {
                  objc_enumerationMutation(v12);
                }
                long long v23 = *(void **)(*((void *)&v43 + 1) + 8 * i);
                long long v24 = [v23 objectForKeyedSubscript:@"string"];
                if ([v24 length] == 1)
                {
                  long long v25 = [v23 objectForKeyedSubscript:@"frame"];
                  [v25 objectForKeyedSubscript:@"x"];
                  v27 = uint64_t v26 = v2;
                  [v27 floatValue];
                  float v29 = v28;

                  v30 = [v25 objectForKeyedSubscript:@"y"];
                  [v30 floatValue];
                  float v32 = v31;

                  v33 = [v25 objectForKeyedSubscript:@"width"];
                  [v33 floatValue];
                  float v35 = v34;

                  v36 = [v25 objectForKeyedSubscript:@"height"];
                  [v36 floatValue];
                  float v38 = v37;

                  id v2 = v26;
                  -[TIKeyboardLayout addKeyWithExactString:frame:](v26->_baseLayout, "addKeyWithExactString:frame:", v24, v29, v32, v35, v38);
                }
              }
              uint64_t v20 = [v12 countByEnumeratingWithState:&v43 objects:v51 count:16];
            }
            while (v20);
            uint64_t v8 = v40;
            id v4 = v41;
            unint64_t v11 = 0;
          }
          uint64_t v10 = v42;
        }
      }
      else
      {
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        unint64_t v11 = TIOSLogFacility();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s Error loading continuous_path_base_layout.plist", "-[TIMecabraEnvironment baseLayout]");
          *(_DWORD *)buf = 138412290;
          v50 = v14;
          _os_log_debug_impl(&dword_1E3F0E000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    goto LABEL_30;
  }
LABEL_31:

  return baseLayout;
}

- (TIMecabraEnvironment)initWithMecabraEngine:(__Mecabra *)a3 language:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v11.receiver = self;
  v11.super_class = (Class)TIMecabraEnvironment;
  id v6 = [(TIMecabraEnvironment *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [[TIMecabraEnvironmentContextWrapper alloc] initWithMecabraEngine:a3 language:v4];
    mecabraContextWrapper = v6->_mecabraContextWrapper;
    v6->_mecabraContextWrapper = v7;

    v6->_mecabraLanguage = v4;
    v6->_shouldAdjustOnAnalyze = 1;
    uint64_t v9 = [(TIMecabraEnvironment *)v6 baseLayout];
    [(TIMecabraEnvironment *)v6 setKeyboardLayout:v9];

    [(TIMecabraEnvironment *)v6 setCanSuggestSupplementalItems:1];
  }
  return v6;
}

- (void)adjustEnvironment:(int64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v5 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  id v6 = [v5 environmentCandidates];
  uint64_t v7 = [v6 count];

  BOOL v8 = [(TIMecabraEnvironment *)self documentContextIsEmpty];
  if (v7)
  {
    char v9 = !v8;
    if (a3 == 2) {
      char v9 = 1;
    }
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
      [v10 declareEndOfSentence];
LABEL_18:

      goto LABEL_19;
    }
    [(TIMecabraEnvironment *)self compareDocumentAndEnvironmentCandidates];
    [(TIMecabraEnvironment *)self analyzeCandidateContextWithSplit:((a3 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0];
    if ([(TIMecabraEnvironment *)self addNewCandidatesIfNecessary:a3])
    {
      objc_super v11 = [(TIMecabraEnvironment *)self candidatesLeftOfCaret];
      uint64_t v12 = [(TIMecabraEnvironment *)self candidatesRightOfCaret];
      uint64_t v10 = [v11 arrayByAddingObjectsFromArray:v12];

      id v13 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
      v14 = [v13 environmentCandidates];
      [v14 removeAllObjects];

      id v15 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
      id v16 = [v15 environmentCandidates];
      [v16 setArray:v10];

      goto LABEL_18;
    }
    uint64_t v17 = [(TIMecabraEnvironment *)self candidatesToDelete];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v10 = [(TIMecabraEnvironment *)self candidatesToDelete];
      uint64_t v19 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v10);
            }
            uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            long long v24 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
            long long v25 = [v24 environmentCandidates];
            [v25 removeObjectIdenticalTo:v23];
          }
          uint64_t v20 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v20);
      }
      goto LABEL_18;
    }
  }
  else
  {
    if (v8) {
      return;
    }
    [(TIMecabraEnvironment *)self createNewCandidatesFromDocumentContext];
  }
LABEL_19:
  [(TIMecabraEnvironment *)self compareDocumentAndEnvironmentCandidates];
  [(TIMecabraEnvironment *)self updateCursorPosition];
  uint64_t v26 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v26 syncEnvironmentAndContextCandidates];
}

- (void)compareDocumentAndEnvironmentCandidates
{
  uint64_t v3 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  uint64_t v4 = [v3 environmentCandidateStrings];
  id v34 = [v4 componentsJoinedByString:&stru_1F3F7A998];

  int v5 = [(TIMecabraEnvironment *)self leftDocumentContext];
  id v6 = v5;
  if (self->_mecabraLanguage == 4)
  {
    uint64_t v7 = [v5 normalizeSmartQuotedStringOnlySingleQuote];

    id v6 = (void *)v7;
  }
  BOOL v8 = [v6 longestCommonSubstring:v34 backwards:0];
  if (![v8 length])
  {
    char v9 = [(TIMecabraEnvironment *)self leftDocumentContext];
    uint64_t v10 = v9;
    objc_super v11 = v9 ? v9 : &stru_1F3F7A998;
    uint64_t v12 = [v34 rangeOfString:v11];
    uint64_t v14 = v13;

    if (v12 != 0x7FFFFFFFFFFFFFFFLL && v12 + v14 <= (unint64_t)[v34 length])
    {
      uint64_t v15 = objc_msgSend(v34, "substringWithRange:", v12, v14);

      BOOL v8 = (void *)v15;
    }
  }
  [(TIMecabraEnvironment *)self setLeftDocumentContextCorrespondingToCandidates:v8];
  uint64_t v16 = [(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidates];
  uint64_t v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = (__CFString *)v16;
  }
  else {
    uint64_t v18 = &stru_1F3F7A998;
  }
  uint64_t v19 = [v34 rangeOfString:v18 options:2];
  -[TIMecabraEnvironment setLeftDocumentContextCorrespondingToCandidatesRange:](self, "setLeftDocumentContextCorrespondingToCandidatesRange:", v19, v20);

  if ([(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidatesRange] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v22 = [(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidatesRange];
    [(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidatesRange];
    uint64_t v21 = v23 + v22;
  }
  long long v24 = [(TIMecabraEnvironment *)self rightDocumentContext];
  long long v25 = v24;
  if (self->_mecabraLanguage == 4)
  {
    uint64_t v26 = [v24 normalizeSmartQuotedStringOnlySingleQuote];

    long long v25 = (void *)v26;
  }
  long long v27 = [v34 substringFromIndex:v21];
  long long v28 = [v27 longestCommonSubstring:v25 backwards:1];
  [(TIMecabraEnvironment *)self setRightDocumentContextCorrespondingToCandidates:v28];

  uint64_t v29 = [(TIMecabraEnvironment *)self rightDocumentContextCorrespondingToCandidates];
  long long v30 = (void *)v29;
  if (v29) {
    float v31 = (__CFString *)v29;
  }
  else {
    float v31 = &stru_1F3F7A998;
  }
  uint64_t v32 = [v34 rangeOfString:v31 options:4];
  -[TIMecabraEnvironment setRightDocumentContextCorrespondingToCandidatesRange:](self, "setRightDocumentContextCorrespondingToCandidatesRange:", v32, v33);
}

- (BOOL)addNewCandidatesIfNecessary:(int64_t)a3
{
  if (a3 != 4)
  {
    uint64_t v4 = [(TIMecabraEnvironment *)self leftDocumentContext];
    int v5 = [(TIMecabraEnvironment *)self rightDocumentContext];
    uint64_t v6 = [v4 stringByAppendingString:v5];
    uint64_t v7 = (void *)v6;
    if (v6) {
      BOOL v8 = (__CFString *)v6;
    }
    else {
      BOOL v8 = &stru_1F3F7A998;
    }
    char v9 = v8;

    uint64_t v10 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
    objc_super v11 = [v10 environmentCandidateStrings];
    uint64_t v12 = [v11 componentsJoinedByString:&stru_1F3F7A998];
    uint64_t v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (__CFString *)v12;
    }
    else {
      uint64_t v14 = &stru_1F3F7A998;
    }
    uint64_t v15 = v14;

    if ([(__CFString *)v9 rangeOfString:v15] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = [(__CFString *)v9 length];
      if (v16 == [(__CFString *)v15 length])
      {
        LOBYTE(v17) = 0;
        goto LABEL_49;
      }
    }
  }
  uint64_t v18 = [(TIMecabraEnvironment *)self candidatesLeftOfCaret];
  uint64_t v19 = [v18 mecabraCandidateSurfaces];
  char v9 = [v19 componentsJoinedByString:&stru_1F3F7A998];

  uint64_t v20 = [(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidates];
  if ([v20 length])
  {
    uint64_t v21 = [(__CFString *)v9 length];

    if (!v21)
    {
      uint64_t v17 = [(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidates];
      goto LABEL_28;
    }
  }
  else
  {
  }
  if (self->_mecabraLanguage == 4)
  {
    uint64_t v22 = @" ";
    uint64_t v23 = [(__CFString *)v9 stringByAppendingString:@" "];
    long long v24 = [(TIMecabraEnvironment *)self leftDocumentContext];
    long long v25 = [v24 normalizeSmartQuotedStringOnlySingleQuote];
    char v26 = [v23 isEqualToString:v25];

    if (v26)
    {
LABEL_29:
      uint64_t v17 = [(TIMecabraEnvironment *)self candidatesLeftOfCaret];
      [(TIMecabraEnvironment *)self addCandidateWithString:v22 toArray:v17];

      LOBYTE(v17) = 1;
      goto LABEL_30;
    }
  }
  uint64_t v17 = [(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidates];
  uint64_t v27 = [(__CFString *)v17 rangeOfString:v9];
  uint64_t v29 = v28;

  LOBYTE(v17) = 0;
  if (v27 != 0x7FFFFFFFFFFFFFFFLL && v29 != 0x7FFFFFFFFFFFFFFFLL && v29)
  {
    uint64_t v30 = v27 + v29;
    float v31 = [(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidates];
    uint64_t v32 = [v31 length];

    uint64_t v17 = (__CFString *)(v32 - v30);
    if (v32 != v30)
    {
      uint64_t v33 = [(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidates];
      objc_msgSend(v33, "substringWithRange:", v30, v17);
      uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v34 = [(TIMecabraEnvironment *)self leftDocumentContext];
    float v35 = [(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidates];
    char v36 = objc_msgSend(v34, "TI_hasTruePrefix:", v35);

    if ((v36 & 1) == 0)
    {
LABEL_28:
      uint64_t v22 = v17;
      if (!v17) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
    float v37 = [(TIMecabraEnvironment *)self leftDocumentContext];
    float v38 = [(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidates];
    objc_msgSend(v37, "substringFromIndex:", objc_msgSend(v38, "length"));
    uint64_t v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v39 = [(TIMecabraEnvironment *)self candidatesLeftOfCaret];
      uint64_t v40 = [v39 lastObject];

      if (v40 && MecabraCandidateGetType() == 5)
      {
        v41 = MecabraCandidateGetSurface();
        uint64_t v42 = [v41 stringByAppendingString:v22];

        long long v43 = [(TIMecabraEnvironment *)self candidatesLeftOfCaret];
        [v43 removeObject:v40];

        uint64_t v22 = (__CFString *)v42;
      }
      goto LABEL_29;
    }
    LOBYTE(v17) = 0;
  }
LABEL_30:
  long long v44 = [(TIMecabraEnvironment *)self candidatesRightOfCaret];
  long long v45 = [v44 mecabraCandidateSurfaces];
  uint64_t v15 = [v45 componentsJoinedByString:&stru_1F3F7A998];

  uint64_t v46 = [(__CFString *)v15 length];
  id v47 = [(TIMecabraEnvironment *)self rightDocumentContextCorrespondingToCandidates];
  uint64_t v48 = v47;
  if (v46)
  {
    uint64_t v49 = [v47 rangeOfString:v15];
    uint64_t v51 = v50;

    uint64_t v52 = 0;
    if (v49 != 0x7FFFFFFFFFFFFFFFLL && v51 != 0x7FFFFFFFFFFFFFFFLL && v51 && v49)
    {
      v53 = [(TIMecabraEnvironment *)self rightDocumentContextCorrespondingToCandidates];
      uint64_t v52 = objc_msgSend(v53, "substringWithRange:", 0, v49);
    }
    v54 = [(TIMecabraEnvironment *)self rightDocumentContext];
    v55 = [(TIMecabraEnvironment *)self rightDocumentContextCorrespondingToCandidates];
    int v56 = objc_msgSend(v54, "TI_hasTrueSuffix:", v55);

    if (v56)
    {
      v57 = [(TIMecabraEnvironment *)self rightDocumentContext];
      v58 = [(TIMecabraEnvironment *)self rightDocumentContext];
      uint64_t v59 = [v58 length];
      v60 = [(TIMecabraEnvironment *)self rightDocumentContextCorrespondingToCandidates];
      v61 = objc_msgSend(v57, "substringToIndex:", v59 - objc_msgSend(v60, "length"));

      if (!v61) {
        goto LABEL_49;
      }
      v62 = [(TIMecabraEnvironment *)self candidatesRightOfCaret];
      uint64_t v63 = [v62 firstObject];

      if (v63 && MecabraCandidateGetType() == 5)
      {
        v64 = MecabraCandidateGetSurface();
        if (v64)
        {
          uint64_t v65 = [v61 stringByAppendingString:v64];

          v66 = [(TIMecabraEnvironment *)self candidatesRightOfCaret];
          [v66 removeObject:v63];

          v61 = (void *)v65;
        }
      }
      uint64_t v52 = v61;
    }
    else if (!v52)
    {
      goto LABEL_49;
    }
LABEL_48:
    uint64_t v17 = [(TIMecabraEnvironment *)self candidatesRightOfCaret];
    [(TIMecabraEnvironment *)self insertCandidateWithString:v52 intoArray:v17 atIndex:0];

    LOBYTE(v17) = 1;
    goto LABEL_49;
  }
  uint64_t v67 = [v47 length];

  if (v67)
  {
    uint64_t v52 = [(TIMecabraEnvironment *)self rightDocumentContextCorrespondingToCandidates];
    if (v52) {
      goto LABEL_48;
    }
  }
LABEL_49:

  return (char)v17;
}

- (void)createNewCandidatesFromDocumentContext
{
  uint64_t v3 = [(TIMecabraEnvironment *)self leftDocumentContext];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    int v5 = [(TIMecabraEnvironment *)self leftDocumentContext];
    uint64_t v6 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
    uint64_t v7 = [v6 environmentCandidates];
    [(TIMecabraEnvironment *)self addCandidateWithString:v5 toArray:v7];
  }
  BOOL v8 = [(TIMecabraEnvironment *)self rightDocumentContext];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v12 = [(TIMecabraEnvironment *)self rightDocumentContext];
    uint64_t v10 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
    objc_super v11 = [v10 environmentCandidates];
    [(TIMecabraEnvironment *)self addCandidateWithString:v12 toArray:v11];
  }
}

- (void)insertCandidateWithString:(id)a3 intoArray:(id)a4 atIndex:(unint64_t)a5
{
  id v11 = a4;
  id v8 = a3;
  uint64_t v9 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  uint64_t v10 = (void *)[v9 createMecabraCandidateFromString:v8];

  if (v10)
  {
    [v11 insertObject:v10 atIndex:a5];
  }
}

- (void)addCandidateWithString:(id)a3 toArray:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  uint64_t v7 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  id v8 = (void *)[v7 createMecabraCandidateFromString:v6];

  if (v8)
  {
    [v9 addObject:v8];
  }
}

- (void)revertLearningOfCandidateIfNecessary
{
  uint64_t v3 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  unint64_t v4 = [v3 candidateIndex];

  int v5 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  id v6 = [v5 environmentCandidateStrings];
  unint64_t v7 = [v6 count];

  if (v4 >= v7)
  {
    id v8 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
    id v9 = [v8 environmentCandidateStrings];
    unint64_t v4 = [v9 count] - 1;
  }
  uint64_t v10 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  id v11 = [v10 environmentCandidates];
  id v12 = [v11 objectAtIndexedSubscript:v4];

  id v13 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v13 revertLearningForCandidate:v12];
}

- (void)analyzeCandidateContextWithSplit:(BOOL)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v5 = [(TIMecabraEnvironment *)self candidatesToDelete];
  [v5 removeAllObjects];

  id v6 = [(TIMecabraEnvironment *)self candidatesLeftOfCaret];
  [v6 removeAllObjects];

  unint64_t v7 = [(TIMecabraEnvironment *)self candidatesRightOfCaret];
  [v7 removeAllObjects];

  unint64_t v8 = [(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidatesRange];
  uint64_t v10 = v9;
  unint64_t v34 = [(TIMecabraEnvironment *)self rightDocumentContextCorrespondingToCandidatesRange];
  uint64_t v12 = v11;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  char v36 = self;
  id v13 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  uint64_t v14 = [v13 environmentCandidates];

  id obj = v14;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    unint64_t v17 = 0;
    uint64_t v18 = *(void *)v38;
    unint64_t v33 = v8 + v10;
    BOOL v19 = v8 + v10 != v34 || a3;
    unint64_t v31 = v12 + v10 + v8;
    unint64_t v32 = v34 + v12;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        unint64_t v21 = v17;
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v23 = MecabraCandidateGetSurface();
        v17 += [v23 length];
        if (v19)
        {
          BOOL v25 = v8 <= v21 && v33 >= v17;
          BOOL v27 = v34 <= v21 && v32 >= v17;
          if (!v25 && !v27)
          {
LABEL_30:
            uint64_t v29 = [(TIMecabraEnvironment *)v36 candidatesToDelete];
            goto LABEL_31;
          }
          if (v25)
          {
            uint64_t v28 = [(TIMecabraEnvironment *)v36 candidatesLeftOfCaret];
            [v28 addObject:v22];
          }
          if (v27)
          {
            uint64_t v29 = [(TIMecabraEnvironment *)v36 candidatesRightOfCaret];
LABEL_31:
            uint64_t v30 = v29;
            objc_msgSend(v29, "addObject:", v22, v31);
          }
        }
        else if (v8 > v21 || v31 < v17)
        {
          goto LABEL_30;
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v16);
  }
}

- (void)updateCursorPosition
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  unint64_t v4 = [v3 environmentCandidateStrings];

  int v5 = [(TIMecabraEnvironment *)self leftDocumentContextCorrespondingToCandidates];
  id v6 = [(TIMecabraEnvironment *)self leftDocumentContext];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    uint64_t v18 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
    [v18 setCandidateIndex:0x7FFFFFFFFFFFFFFFLL];

    BOOL v19 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
    [v19 setCandidateInternalIndex:0x7FFFFFFFFFFFFFFFLL];

    goto LABEL_17;
  }
  uint64_t v28 = self;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v30;
  BOOL v27 = v4;
  while (2)
  {
    uint64_t v14 = 0;
    uint64_t v26 = v11 + v10;
    do
    {
      if (*(void *)v30 != v13) {
        objc_enumerationMutation(v8);
      }
      uint64_t v15 = v11 + v14;
      uint64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * v14);
      unint64_t v17 = [v16 length] + v12;
      if (v17 == [v5 length])
      {
        uint64_t v20 = [(TIMecabraEnvironment *)v28 mecabraContextWrapper];
        [v20 setCandidateIndex:v15];

        unint64_t v21 = [(TIMecabraEnvironment *)v28 mecabraContextWrapper];
        uint64_t v22 = v21;
        uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:
        [v21 setCandidateInternalIndex:v23];

        unint64_t v4 = v27;
        goto LABEL_16;
      }
      if (v17 > [v5 length])
      {
        long long v24 = [(TIMecabraEnvironment *)v28 mecabraContextWrapper];
        [v24 setCandidateIndex:v15];

        uint64_t v25 = [v5 length] - v12;
        unint64_t v21 = [(TIMecabraEnvironment *)v28 mecabraContextWrapper];
        uint64_t v22 = v21;
        uint64_t v23 = v25;
        goto LABEL_15;
      }
      v12 += [v16 length];
      ++v14;
    }
    while (v10 != v14);
    uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    uint64_t v11 = v26;
    unint64_t v4 = v27;
    if (v10) {
      continue;
    }
    break;
  }
LABEL_16:

LABEL_17:
}

- (BOOL)documentContextIsEmpty
{
  uint64_t v3 = [(TIMecabraEnvironment *)self leftDocumentContext];
  if ([v3 length])
  {
    BOOL v4 = 0;
  }
  else
  {
    int v5 = [(TIMecabraEnvironment *)self rightDocumentContext];
    BOOL v4 = [v5 length] == 0;
  }
  return v4;
}

- (void)setCandidateIndex:(int64_t)a3
{
  id v4 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v4 setCandidateIndex:a3];
}

- (unint64_t)candidateIndex
{
  id v2 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  unint64_t v3 = [v2 candidateIndex];

  return v3;
}

- (NSMutableArray)candidatesToDelete
{
  candidatesToDelete = self->_candidatesToDelete;
  if (!candidatesToDelete)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    int v5 = self->_candidatesToDelete;
    self->_candidatesToDelete = v4;

    candidatesToDelete = self->_candidatesToDelete;
  }

  return candidatesToDelete;
}

- (NSMutableArray)candidatesRightOfCaret
{
  candidatesRightOfCaret = self->_candidatesRightOfCaret;
  if (!candidatesRightOfCaret)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    int v5 = self->_candidatesRightOfCaret;
    self->_candidatesRightOfCaret = v4;

    candidatesRightOfCaret = self->_candidatesRightOfCaret;
  }

  return candidatesRightOfCaret;
}

- (NSMutableArray)candidatesLeftOfCaret
{
  candidatesLeftOfCaret = self->_candidatesLeftOfCaret;
  if (!candidatesLeftOfCaret)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    int v5 = self->_candidatesLeftOfCaret;
    self->_candidatesLeftOfCaret = v4;

    candidatesLeftOfCaret = self->_candidatesLeftOfCaret;
  }

  return candidatesLeftOfCaret;
}

- (void)setTextContentType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  [v4 setTextContentType:v3];
}

- (int)textContentType
{
  id v2 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
  int v3 = [v2 textContentType];

  return v3;
}

- (void)setRightDocumentContext:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = &stru_1F3F7A998;
  }
  id v8 = v5;
  if (!-[NSString isEqualToString:](self->_rightDocumentContext, "isEqualToString:"))
  {
    id v6 = (NSString *)[(__CFString *)v8 copy];
    rightDocumentContext = self->_rightDocumentContext;
    self->_rightDocumentContext = v6;
  }
}

- (void)setLeftDocumentContextInternal:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = &stru_1F3F7A998;
  }
  leftDocumentContext = self->_leftDocumentContext;
  p_leftDocumentContext = &self->_leftDocumentContext;
  if (leftDocumentContext != (NSString *)v5) {
    objc_storeStrong((id *)p_leftDocumentContext, v5);
  }

  MEMORY[0x1F41817F8]();
}

- (void)setLeftDocumentContext:(id)a3
{
  id v4 = (__CFString *)a3;
  if (v4) {
    int v5 = v4;
  }
  else {
    int v5 = &stru_1F3F7A998;
  }
  id v8 = v5;
  if (!-[NSString isEqualToString:](self->_leftDocumentContext, "isEqualToString:"))
  {
    id v6 = [(TIMecabraEnvironment *)self mecabraContextWrapper];
    uint64_t v7 = [v6 contextString:v8 forRightContext:0];

    [(TIMecabraEnvironment *)self setLeftDocumentContextInternal:v7];
  }
}

- (NSString)rightDocumentContext
{
  rightDocumentContext = (__CFString *)self->_rightDocumentContext;
  if (!rightDocumentContext)
  {
    self->_rightDocumentContext = (NSString *)&stru_1F3F7A998;
    rightDocumentContext = &stru_1F3F7A998;
  }

  return (NSString *)rightDocumentContext;
}

- (NSString)leftDocumentContext
{
  leftDocumentContext = (__CFString *)self->_leftDocumentContext;
  if (!leftDocumentContext)
  {
    self->_leftDocumentContext = (NSString *)&stru_1F3F7A998;
    leftDocumentContext = &stru_1F3F7A998;
  }

  return (NSString *)leftDocumentContext;
}

+ (id)getWordFrom:(void *)a3 atIndex:(unint64_t)a4 forSurface:(BOOL)a5
{
  if (!a3)
  {
    uint64_t v11 = &stru_1F3F7A998;
    return v11;
  }
  BOOL v6 = a5;
  if ((int)MecabraCandidateGetWordCount() <= a4)
  {
    uint64_t v11 = &stru_1F3F7A998;
    goto LABEL_15;
  }
  uint64_t v8 = 0;
  unint64_t v9 = a4;
  while (v6)
  {
    uint64_t WordLengthAtIndex = MecabraCandidateGetWordLengthAtIndex();
    if (!v9)
    {
      Surface = (void *)MecabraCandidateGetSurface();
      goto LABEL_14;
    }
LABEL_8:
    v8 += WordLengthAtIndex;
    --v9;
  }
  uint64_t WordLengthAtIndex = MecabraCandidateGetWordReadingLengthAtIndex();
  if (v9) {
    goto LABEL_8;
  }
  Surface = (void *)MecabraCandidateGetAnalysisString();
LABEL_14:
  objc_msgSend(Surface, "substringWithRange:", v8, WordLengthAtIndex);
  uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v11;
}

+ (id)getWordFromSurfaceOf:(void *)a3 atIndex:(unint64_t)a4
{
  return (id)[a1 getWordFrom:a3 atIndex:a4 forSurface:1];
}

+ (id)getWordFromAnalysisStringOf:(void *)a3 atIndex:(unint64_t)a4
{
  return (id)[a1 getWordFrom:a3 atIndex:a4 forSurface:0];
}

+ (void)loadMobileAssetContentsForInputModes:(id)a3 assetContentTypes:(id)a4 onQueue:(id)a5 withCompletionBlock:(id)a6
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v59 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = v11;
  if (v10)
  {
    v54 = v11;
    v55 = v10;
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v68 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v67 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v56 = v9;
    id obj = v9;
    uint64_t v60 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
    if (v60)
    {
      uint64_t v58 = *(void *)v83;
      uint64_t v14 = *MEMORY[0x1E4F5EF30];
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v83 != v58) {
            objc_enumerationMutation(obj);
          }
          uint64_t v61 = v15;
          v64 = *(void **)(*((void *)&v82 + 1) + 8 * v15);
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v62 = v59;
          uint64_t v65 = [v62 countByEnumeratingWithState:&v78 objects:v89 count:16];
          if (v65)
          {
            uint64_t v63 = *(void *)v79;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v79 != v63) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v66 = v16;
                uint64_t v17 = *(void *)(*((void *)&v78 + 1) + 8 * v16);
                uint64_t v18 = [v64 normalizedIdentifier];
                uint64_t v19 = [v18 hasPrefix:@"zh"];

                uint64_t v20 = +[TIAssetManager sharedAssetManager];
                unint64_t v21 = [v20 ddsAssetContentItemsWithContentType:v17 inputMode:v64 filteredWithRegion:v19];

                long long v76 = 0u;
                long long v77 = 0u;
                long long v74 = 0u;
                long long v75 = 0u;
                id v22 = v21;
                uint64_t v23 = [v22 countByEnumeratingWithState:&v74 objects:v88 count:16];
                if (v23)
                {
                  uint64_t v24 = v23;
                  uint64_t v25 = *(void *)v75;
                  do
                  {
                    for (uint64_t i = 0; i != v24; ++i)
                    {
                      if (*(void *)v75 != v25) {
                        objc_enumerationMutation(v22);
                      }
                      BOOL v27 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                      uint64_t v28 = [v27 contents];
                      long long v29 = [v28 objectForKeyedSubscript:v14];

                      if ([v29 count])
                      {
                        long long v30 = [v27 type];
                        int v31 = [v30 isEqualToString:@"LanguageModel"];

                        if (v31)
                        {
                          long long v32 = [v67 objectForKeyedSubscript:v29];

                          if (!v32)
                          {
                            unint64_t v33 = [MEMORY[0x1E4F1CA48] array];
                            [v67 setObject:v33 forKeyedSubscript:v29];
                          }
                          uint64_t v34 = v67;
                        }
                        else
                        {
                          long long v38 = [v13 objectForKeyedSubscript:v29];

                          if (!v38)
                          {
                            long long v39 = [MEMORY[0x1E4F1CA48] array];
                            [v13 setObject:v39 forKeyedSubscript:v29];
                          }
                          uint64_t v34 = v13;
                        }
                        long long v37 = [v34 objectForKeyedSubscript:v29];
                        long long v40 = [v27 path];
                        v41 = [v40 path];
                        [v37 addObject:v41];
                      }
                      else
                      {
                        float v35 = [v27 path];
                        char v36 = [v35 URLByDeletingLastPathComponent];
                        long long v37 = [v36 URLByDeletingLastPathComponent];

                        [v68 addObject:v37];
                      }
                    }
                    uint64_t v24 = [v22 countByEnumeratingWithState:&v74 objects:v88 count:16];
                  }
                  while (v24);
                }

                uint64_t v16 = v66 + 1;
              }
              while (v66 + 1 != v65);
              uint64_t v65 = [v62 countByEnumeratingWithState:&v78 objects:v89 count:16];
            }
            while (v65);
          }

          uint64_t v15 = v61 + 1;
        }
        while (v61 + 1 != v60);
        uint64_t v60 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
      }
      while (v60);
    }

    uint64_t v42 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      long long v43 = [NSString stringWithFormat:@"%s DDS regionalAsset (%@)", "+[TIMecabraEnvironment loadMobileAssetContentsForInputModes:assetContentTypes:onQueue:withCompletionBlock:]", v13];
      *(_DWORD *)buf = 138412290;
      v87 = v43;
      _os_log_impl(&dword_1E3F0E000, v42, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    long long v44 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      long long v45 = [NSString stringWithFormat:@"%s DDS nonRegionalAsset (%@)", "+[TIMecabraEnvironment loadMobileAssetContentsForInputModes:assetContentTypes:onQueue:withCompletionBlock:]", v68];
      *(_DWORD *)buf = 138412290;
      v87 = v45;
      _os_log_impl(&dword_1E3F0E000, v44, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    id v46 = v13;
    id v47 = v68;
    uint64_t v48 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      v53 = [NSString stringWithFormat:@"%s sending to mecabra : regional assets %@ : non regional assets %@", "+[TIMecabraEnvironment loadMobileAssetContentsForInputModes:assetContentTypes:onQueue:withCompletionBlock:]", v46, v47];
      *(_DWORD *)buf = 138412290;
      v87 = v53;
      _os_log_debug_impl(&dword_1E3F0E000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __107__TIMecabraEnvironment_loadMobileAssetContentsForInputModes_assetContentTypes_onQueue_withCompletionBlock___block_invoke;
    v69[3] = &unk_1E6E2D3E0;
    id v70 = v46;
    id v71 = v67;
    id v72 = v47;
    uint64_t v12 = v54;
    id v73 = v54;
    id v49 = v47;
    id v50 = v67;
    id v51 = v46;
    uint64_t v52 = +[NSBlockOperation blockOperationWithBlock:v69];
    id v10 = v55;
    [v55 addOperation:v52];

    id v9 = v56;
  }
}

void __107__TIMecabraEnvironment_loadMobileAssetContentsForInputModes_assetContentTypes_onQueue_withCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v22 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v2 = [*(id *)(a1 + 32) allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v28;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * v6);
        v34[0] = *MEMORY[0x1E4FBA6F0];
        uint64_t v8 = [v7 description];
        v35[0] = v8;
        v34[1] = *MEMORY[0x1E4FBA6E8];
        id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        v35[1] = v9;
        id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
        [v22 addObject:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v4);
  }

  id v11 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v12 = [*(id *)(a1 + 40) allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
        v31[0] = *MEMORY[0x1E4FBA6F0];
        uint64_t v18 = [v17 description];
        v32[0] = v18;
        v31[1] = *MEMORY[0x1E4FBA6E8];
        uint64_t v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:v17];
        v32[1] = v19;
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
        [v11 addObject:v20];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v14);
  }

  unint64_t v21 = [*(id *)(a1 + 48) allObjects];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (void)loadMobileAssetContentsForInputModes:(id)a3 assetContentTypes:(id)a4 inMecabra:(__Mecabra *)a5 onQueue:(id)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__TIMecabraEnvironment_loadMobileAssetContentsForInputModes_assetContentTypes_inMecabra_onQueue___block_invoke;
  v6[3] = &__block_descriptor_40_e41_v32__0__NSArray_8__NSArray_16__NSArray_24l;
  v6[4] = a5;
  +[TIMecabraEnvironment loadMobileAssetContentsForInputModes:a3 assetContentTypes:a4 onQueue:a6 withCompletionBlock:v6];
}

void __97__TIMecabraEnvironment_loadMobileAssetContentsForInputModes_assetContentTypes_inMecabra_onQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v5 = a3;
  MecabraSetAssetDataItemsForType();
  MecabraSetAssetDataItemsForType();

  MecabraSetAssetDataItemsForType();
}

+ (void)loadMobileAssetContentsForInputModes:(id)a3 onQueue:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = @"Lexicon";
  uint64_t v14 = @"LexiconDelta";
  uint64_t v15 = @"LanguageModel";
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 arrayWithObjects:&v13 count:3];
  objc_msgSend(a1, "loadMobileAssetContentsForInputModes:assetContentTypes:onQueue:withCompletionBlock:", v11, v12, v10, v9, v13, v14, v15, v16);
}

+ (void)loadMobileAssetContentsForInputModes:(id)a3 inMecabra:(__Mecabra *)a4 onQueue:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__TIMecabraEnvironment_loadMobileAssetContentsForInputModes_inMecabra_onQueue___block_invoke;
  v5[3] = &__block_descriptor_40_e41_v32__0__NSArray_8__NSArray_16__NSArray_24l;
  v5[4] = a4;
  +[TIMecabraEnvironment loadMobileAssetContentsForInputModes:a3 onQueue:a5 withCompletionBlock:v5];
}

void __79__TIMecabraEnvironment_loadMobileAssetContentsForInputModes_inMecabra_onQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v5 = a3;
  MecabraSetAssetDataItemsForType();
  MecabraSetAssetDataItemsForType();

  MecabraSetAssetDataItemsForType();
}

+ (void)removeMobileAssetListener:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28EB8];
    id v4 = a3;
    id v5 = [v3 defaultCenter];
    [v5 removeObserver:v4];

    id v6 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = NSString;
      uint64_t v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v9 = [v7 stringWithFormat:@"%s %@", "+[TIMecabraEnvironment removeMobileAssetListener:]", v8];
      *(_DWORD *)buf = 138412290;
      id v11 = v9;
      _os_log_debug_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

+ (id)loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer:(id)a3 inputModes:(id)a4 onQueue:(id)a5 oldMobileAssetChangeListener:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __133__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke;
  aBlock[3] = &unk_1E6E29718;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = a6;
  uint64_t v17 = (void (**)(void *, void))_Block_copy(aBlock);
  v17[2](v17, 0);
  [a1 removeMobileAssetListener:v16];

  uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v19 = +[TIAssetManager sharedAssetManager];
  uint64_t v20 = [MEMORY[0x1E4F28F08] mainQueue];
  unint64_t v21 = [v18 addObserverForName:@"TIAssetsDidChangeNotification" object:v19 queue:v20 usingBlock:v17];

  return v21;
}

void __133__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  if (v1)
  {
    uint64_t v2 = a1[5];
    uint64_t v3 = a1[6];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __133__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke_2;
    v4[3] = &unk_1E6E296F0;
    id v5 = v1;
    +[TIMecabraEnvironment loadMobileAssetContentsForInputModes:v2 onQueue:v3 withCompletionBlock:v4];
  }
}

void __133__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForCHRecognizer_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) performSelector:sel_updateMecabraWithRegionalOTAAssets_nonRegionalOTAAssets_ withObject:v6 withObject:v5];
  }
}

+ (id)loadMobileAssetContentsWhenMobileAssetChangesForMecabra:(__Mecabra *)a3 inputModes:(id)a4 onQueue:(id)a5 oldMobileAssetChangeListener:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForMecabra_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke;
  aBlock[3] = &unk_1E6E296C8;
  id v23 = v11;
  id v24 = a3;
  id v22 = v10;
  id v12 = v11;
  id v13 = v10;
  id v14 = a6;
  id v15 = (void (**)(void *, void))_Block_copy(aBlock);
  v15[2](v15, 0);
  [a1 removeMobileAssetListener:v14];

  id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v17 = +[TIAssetManager sharedAssetManager];
  uint64_t v18 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v19 = [v16 addObserverForName:@"TIAssetsDidChangeNotification" object:v17 queue:v18 usingBlock:v15];

  return v19;
}

void *__128__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForMecabra_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke(void *result)
{
  uint64_t v1 = result[6];
  if (v1)
  {
    uint64_t v2 = result[4];
    uint64_t v3 = result[5];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __128__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForMecabra_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke_2;
    v4[3] = &__block_descriptor_40_e41_v32__0__NSArray_8__NSArray_16__NSArray_24l;
    void v4[4] = v1;
    return (void *)+[TIMecabraEnvironment loadMobileAssetContentsForInputModes:v2 onQueue:v3 withCompletionBlock:v4];
  }
  return result;
}

void __128__TIMecabraEnvironment_loadMobileAssetContentsWhenMobileAssetChangesForMecabra_inputModes_onQueue_oldMobileAssetChangeListener___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v5 = a3;
  MecabraSetAssetDataItemsForType();
  MecabraSetAssetDataItemsForType();

  MecabraSetAssetDataItemsForType();
}

+ (int)maxNumberOfDrawSamples
{
  if (maxNumberOfDrawSamples_onceToken != -1) {
    dispatch_once(&maxNumberOfDrawSamples_onceToken, &__block_literal_global_543);
  }
  if (maxNumberOfDrawSamples_maxNumberOfDrawSamples) {
    return 400;
  }
  else {
    return 600;
  }
}

void __46__TIMecabraEnvironment_maxNumberOfDrawSamples__block_invoke()
{
  CFStringRef v0 = (const __CFString *)MGCopyAnswer();
  if (v0)
  {
    CFStringRef v1 = v0;
    CFIndex Length = CFStringGetLength(v0);
    do
    {
      CFIndex v3 = Length;
      if (Length-- < 1)
      {
        CFStringRef v5 = v1;
        goto LABEL_10;
      }
    }
    while (CFStringGetCharacterAtIndex(v1, Length) - 58 < 0xFFFFFFF6);
    v7.NSUInteger location = 0;
    v7.NSUInteger length = v3;
    CFStringRef v5 = CFStringCreateWithSubstring(0, v1, v7);
    CFRelease(v1);
    if (!v5) {
      return;
    }
    if ([&unk_1F3FA76A0 containsObject:v5]) {
      maxNumberOfDrawSamples_maxNumberOfDrawSamples = 1;
    }
LABEL_10:
    CFRelease(v5);
  }
}

@end