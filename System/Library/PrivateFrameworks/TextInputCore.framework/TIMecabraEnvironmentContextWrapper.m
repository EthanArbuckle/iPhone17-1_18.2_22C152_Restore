@interface TIMecabraEnvironmentContextWrapper
- (BOOL)analyzeInput:(id)a3 options:(unint64_t)a4;
- (BOOL)analyzeString:(id)a3 options:(unint64_t)a4;
- (BOOL)predictionCandidatesWithOptions:(unint64_t)a3 maxNumberOfCandidates:(unint64_t)a4;
- (NSArray)contextCandidateStrings;
- (NSArray)contextCandidates;
- (NSArray)environmentCandidateStrings;
- (NSArray)inlineCandidates;
- (NSDate)lastAnalyzeInputDate;
- (NSMutableArray)environmentCandidates;
- (NSMutableArray)temporaryCandidates;
- (NSString)appContext;
- (TIMecabraEnvironmentContextWrapper)initWithMecabraEngine:(__Mecabra *)a3 language:(int)a4;
- (__Mecabra)mecabraEngine;
- (__MecabraContext)mecabraContext;
- (id)contextString:(id)a3 forRightContext:(BOOL)a4;
- (id)findSupplementalLexiconCandidatesSurroundingCursor;
- (int)shuangpinType;
- (int)textContentType;
- (unint64_t)candidateIndex;
- (unint64_t)candidateInternalIndex;
- (unint64_t)contextCandidateCount;
- (unint64_t)environmentCandidateCount;
- (void)acceptInlineCandidates;
- (void)addContextCandidate:(void *)a3 accept:(BOOL)a4;
- (void)addContextStringCandidate:(void *)a3;
- (void)addEnvironmentCandidate:(void *)a3 atIndex:(unint64_t)a4;
- (void)clearAll;
- (void)clearContext;
- (void)clearInline;
- (void)commitPredictionCandidate:(void *)a3;
- (void)completelyCommitInlineCandidate:(void *)a3;
- (void)createMecabraCandidateFromString:(id)a3;
- (void)dealloc;
- (void)declareEndOfSentence;
- (void)partiallyCommitInlineCandidate:(void *)a3;
- (void)removeCandidatesInRange:(_NSRange)a3;
- (void)revertInlineCandidate;
- (void)revertLearningForCandidate:(void *)a3;
- (void)setAppContext:(id)a3;
- (void)setCandidateIndex:(unint64_t)a3;
- (void)setCandidateInternalIndex:(unint64_t)a3;
- (void)setEnvironmentCandidates:(id)a3;
- (void)setGeometryModel:(void *)a3 modelData:(__CFArray *)a4;
- (void)setKeyboardLayout:(id)a3;
- (void)setLastAnalyzeInputDate:(id)a3;
- (void)setMecabraContext:(__MecabraContext *)a3;
- (void)setPrivateMode:(BOOL)a3;
- (void)setShuangpinType:(int)a3;
- (void)setTemporaryCandidates:(id)a3;
- (void)setTextContentType:(int)a3;
- (void)syncEnvironmentAndContextCandidates;
@end

@implementation TIMecabraEnvironmentContextWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAnalyzeInputDate, 0);
  objc_storeStrong((id *)&self->_temporaryCandidates, 0);
  objc_storeStrong((id *)&self->_environmentCandidates, 0);

  objc_storeStrong((id *)&self->_appContext, 0);
}

- (void)setLastAnalyzeInputDate:(id)a3
{
}

- (NSDate)lastAnalyzeInputDate
{
  return self->_lastAnalyzeInputDate;
}

- (int)shuangpinType
{
  return self->_shuangpinType;
}

- (int)textContentType
{
  return self->_textContentType;
}

- (void)setTemporaryCandidates:(id)a3
{
}

- (void)setMecabraContext:(__MecabraContext *)a3
{
  self->_mecabraContext = a3;
}

- (__MecabraContext)mecabraContext
{
  return self->_mecabraContext;
}

- (__Mecabra)mecabraEngine
{
  return self->_mecabraEngine;
}

- (unint64_t)environmentCandidateCount
{
  return self->_environmentCandidateCount;
}

- (void)setEnvironmentCandidates:(id)a3
{
}

- (void)setCandidateInternalIndex:(unint64_t)a3
{
  self->_candidateInternalIndex = a3;
}

- (unint64_t)candidateInternalIndex
{
  return self->_candidateInternalIndex;
}

- (void)setCandidateIndex:(unint64_t)a3
{
  self->_candidateIndex = a3;
}

- (unint64_t)candidateIndex
{
  return self->_candidateIndex;
}

- (NSString)appContext
{
  return self->_appContext;
}

- (void)createMecabraCandidateFromString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
    CandidateFromContextString = (void *)MecabraCreateCandidateFromContextString();
  }
  else
  {
    CandidateFromContextString = 0;
  }

  return CandidateFromContextString;
}

- (void)setKeyboardLayout:(id)a3
{
  id v4 = a3;
  [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
  MecabraSetKeyboardLayout();
}

- (void)setGeometryModel:(void *)a3 modelData:(__CFArray *)a4
{
  v6 = [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];

  MEMORY[0x1F4180C30](v6, a3, a4);
}

- (void)setAppContext:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_appContext] & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    appContext = self->_appContext;
    self->_appContext = v4;

    [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
    MecabraContextSetAppContext();
  }
}

- (void)completelyCommitInlineCandidate:(void *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
    MecabraContextAddInlineCandidate();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(TIMecabraEnvironmentContextWrapper *)self inlineCandidates];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        [(TIMecabraEnvironmentContextWrapper *)self setCandidateIndex:[(TIMecabraEnvironmentContextWrapper *)self candidateIndex] + 1];
        [(TIMecabraEnvironmentContextWrapper *)self addEnvironmentCandidate:v9 atIndex:[(TIMecabraEnvironmentContextWrapper *)self candidateIndex]];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
  MecabraAcceptInlineCandidates();
}

- (void)partiallyCommitInlineCandidate:(void *)a3
{
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];

  MecabraContextAddInlineCandidate();
}

- (void)commitPredictionCandidate:(void *)a3
{
  uint64_t v5 = [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
  uint64_t v6 = [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];

  MEMORY[0x1F4180D00](v5, a3, v6);
}

- (BOOL)predictionCandidatesWithOptions:(unint64_t)a3 maxNumberOfCandidates:(unint64_t)a4
{
  return MecabraPredictionAnalyzeWithContext() != 0;
}

- (BOOL)analyzeInput:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  char v25 = 0;
  uint64_t v6 = [v5 asMecabraGestures:&v25];
  if (v25)
  {
    uint64_t v7 = [v5 composingInput];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v9 = [v5 composingInput];
      long long v10 = [v9 remainingMecabraInputs];
      if (!v10)
      {
        [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
        [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
        uint64_t RemainingGestures = MecabraCreateRemainingGestures();
        long long v10 = (void *)RemainingGestures;
        uint64_t v12 = RemainingGestures ? RemainingGestures : MEMORY[0x1E4F1CBF0];
        [v9 setRemainingMecabraInputs:v12];
        if (![v10 count]) {
          [(TIMecabraEnvironmentContextWrapper *)self completelyCommitInlineCandidate:0];
        }
      }

      uint64_t v6 = v10;
    }
  }
  uint64_t v13 = [(TIMecabraEnvironmentContextWrapper *)self lastAnalyzeInputDate];
  if (v13)
  {
    v14 = (void *)v13;
    uint64_t v15 = [v5 composingInput];
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();

    if (v16)
    {
      v17 = [v5 composingInput];
      v18 = [MEMORY[0x1E4F1C9C8] date];
      v19 = [(TIMecabraEnvironmentContextWrapper *)self lastAnalyzeInputDate];
      [v18 timeIntervalSinceDate:v19];
      double v21 = v20;

      if ([v17 isDrawing] && v21 * 1000.0 < 40.0) {
        [MEMORY[0x1E4F29060] sleepForTimeInterval:(40.0 - v21 * 1000.0) / 1000.0];
      }
    }
  }
  v22 = [MEMORY[0x1E4F1C9C8] date];
  [(TIMecabraEnvironmentContextWrapper *)self setLastAnalyzeInputDate:v22];

  [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
  BOOL v23 = MecabraAnalyzeGesturesWithContext() != 0;

  return v23;
}

- (BOOL)analyzeString:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
  int v6 = MecabraAnalyzeStringWithContext();

  return v6 != 0;
}

- (id)findSupplementalLexiconCandidatesSurroundingCursor
{
  v3 = [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
  id v4 = [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];

  return (id)MEMORY[0x1F4180CB8](v3, v4);
}

- (void)setPrivateMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
  uint64_t v5 = *MEMORY[0x1E4FBA6F8];
  uint64_t v6 = [NSNumber numberWithBool:v3];

  MEMORY[0x1F4180C38](v4, v5, v6);
}

- (id)contextString:(id)a3 forRightContext:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
  uint64_t LengthForContextString = MecabraGetLengthForContextString();
  if (v4) {
    [v6 substringToIndex:LengthForContextString];
  }
  else {
  uint64_t v8 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v6, "length") - LengthForContextString);
  }

  return v8;
}

- (NSMutableArray)temporaryCandidates
{
  temporaryCandidates = self->_temporaryCandidates;
  if (!temporaryCandidates)
  {
    BOOL v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = self->_temporaryCandidates;
    self->_temporaryCandidates = v4;

    temporaryCandidates = self->_temporaryCandidates;
  }

  return temporaryCandidates;
}

- (void)syncEnvironmentAndContextCandidates
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TIMecabraEnvironmentContextWrapper *)self temporaryCandidates];
  [v3 removeAllObjects];

  BOOL v4 = [(TIMecabraEnvironmentContextWrapper *)self contextCandidates];
  uint64_t v5 = [(TIMecabraEnvironmentContextWrapper *)self environmentCandidates];
  id v6 = [v4 deletionRangesWithElementsToKeep:v5];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
        [v12 rangeValue];
        MecabraContextRemoveCandidatesInRange();
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v9);
  }

  [(TIMecabraEnvironmentContextWrapper *)self clearContext];
  unint64_t v13 = [(TIMecabraEnvironmentContextWrapper *)self candidateIndex];
  unint64_t v14 = [(TIMecabraEnvironmentContextWrapper *)self candidateInternalIndex];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = [(TIMecabraEnvironmentContextWrapper *)self environmentCandidates];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      unint64_t v17 = [(TIMecabraEnvironmentContextWrapper *)self candidateIndex];
      uint64_t v18 = v14 == 0x7FFFFFFFFFFFFFFFLL ? v17 + 1 : v17;
      if (v18)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
          double v20 = [(TIMecabraEnvironmentContextWrapper *)self environmentCandidates];
          double v21 = [v20 objectAtIndexedSubscript:j];
          MecabraContextAddCandidate();
        }
      }
    }
  }
  v22 = [(TIMecabraEnvironmentContextWrapper *)self environmentCandidates];
  unint64_t v23 = [v22 count];

  if (v14 != 0x7FFFFFFFFFFFFFFFLL
    && v23
    && [(TIMecabraEnvironmentContextWrapper *)self candidateIndex] < v23)
  {
    v24 = [(TIMecabraEnvironmentContextWrapper *)self environmentCandidates];
    char v25 = objc_msgSend(v24, "objectAtIndexedSubscript:", -[TIMecabraEnvironmentContextWrapper candidateIndex](self, "candidateIndex"));
    v26 = MecabraCandidateGetSurface();

    v27 = [v26 substringToIndex:v14];
    v28 = [(TIMecabraEnvironmentContextWrapper *)self createMecabraCandidateFromString:v27];
    if (v28)
    {
      v29 = v28;
      [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
      MecabraContextAddCandidate();

      v30 = [(TIMecabraEnvironmentContextWrapper *)self temporaryCandidates];
      [v30 addObject:v29];
    }
  }
}

- (void)revertLearningForCandidate:(void *)a3
{
  uint64_t v5 = [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
  id v6 = [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];

  MEMORY[0x1F4180D38](v5, v6, a3);
}

- (void)revertInlineCandidate
{
  BOOL v3 = [(TIMecabraEnvironmentContextWrapper *)self inlineCandidates];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
    MEMORY[0x1F4180C20](v5, v4 - 1, 1);
  }
}

- (void)removeCandidatesInRange:(_NSRange)a3
{
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];

  MecabraContextRemoveCandidatesInRange();
}

- (void)acceptInlineCandidates
{
  [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];

  MecabraAcceptInlineCandidates();
}

- (NSArray)inlineCandidates
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
  uint64_t InlineCandidateCount = MecabraContextGetInlineCandidateCount();
  if (InlineCandidateCount)
  {
    uint64_t v5 = InlineCandidateCount;
    for (uint64_t i = 0; i != v5; ++i)
    {
      [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
      uint64_t InlineCandidateAtIndex = MecabraContextGetInlineCandidateAtIndex();
      if (InlineCandidateAtIndex) {
        [v3 addObject:InlineCandidateAtIndex];
      }
    }
  }

  return (NSArray *)v3;
}

- (NSArray)environmentCandidateStrings
{
  v2 = [(TIMecabraEnvironmentContextWrapper *)self environmentCandidates];
  BOOL v3 = [v2 mecabraCandidateSurfaces];

  return (NSArray *)v3;
}

- (NSMutableArray)environmentCandidates
{
  environmentCandidates = self->_environmentCandidates;
  if (!environmentCandidates)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = self->_environmentCandidates;
    self->_environmentCandidates = v4;

    environmentCandidates = self->_environmentCandidates;
  }

  return environmentCandidates;
}

- (void)declareEndOfSentence
{
  [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
  MecabraDeclareEndOfSentence();

  [(TIMecabraEnvironmentContextWrapper *)self clearAll];
}

- (void)clearAll
{
  [(TIMecabraEnvironmentContextWrapper *)self clearContext];
  [(TIMecabraEnvironmentContextWrapper *)self clearInline];
  BOOL v3 = [(TIMecabraEnvironmentContextWrapper *)self environmentCandidates];
  [v3 removeAllObjects];

  [(TIMecabraEnvironmentContextWrapper *)self setCandidateIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)clearInline
{
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
  uint64_t InlineCandidateCount = MecabraContextGetInlineCandidateCount();
  uint64_t v4 = [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];

  MEMORY[0x1F4180C20](v4, 0, InlineCandidateCount);
}

- (void)clearContext
{
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
  [(TIMecabraEnvironmentContextWrapper *)self contextCandidateCount];

  MecabraContextRemoveCandidatesInRange();
}

- (NSArray)contextCandidateStrings
{
  v2 = [(TIMecabraEnvironmentContextWrapper *)self contextCandidates];
  BOOL v3 = [v2 mecabraCandidateSurfaces];

  return (NSArray *)v3;
}

- (NSArray)contextCandidates
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
  uint64_t CandidateCount = MecabraContextGetCandidateCount();
  if (CandidateCount)
  {
    uint64_t v5 = CandidateCount;
    for (uint64_t i = 0; i != v5; ++i)
    {
      [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
      uint64_t CandidateAtIndex = MecabraContextGetCandidateAtIndex();
      if (CandidateAtIndex) {
        [v3 addObject:CandidateAtIndex];
      }
    }
  }

  return (NSArray *)v3;
}

- (unint64_t)contextCandidateCount
{
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];

  return MecabraContextGetCandidateCount();
}

- (void)addEnvironmentCandidate:(void *)a3 atIndex:(unint64_t)a4
{
  id v7 = [(TIMecabraEnvironmentContextWrapper *)self environmentCandidates];
  unint64_t v8 = [v7 count];

  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    a4 = v8;
  }
  uint64_t v9 = [(TIMecabraEnvironmentContextWrapper *)self environmentCandidates];
  id v10 = v9;
  if (a4 >= v8) {
    [v9 addObject:a3];
  }
  else {
    [v9 insertObject:a3 atIndex:a4];
  }
}

- (void)addContextStringCandidate:(void *)a3
{
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];

  MecabraContextAddCandidate();
}

- (void)addContextCandidate:(void *)a3 accept:(BOOL)a4
{
  BOOL v4 = a4;
  [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
  MecabraContextAddInlineCandidate();
  if (v4)
  {
    [(TIMecabraEnvironmentContextWrapper *)self mecabraEngine];
    [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];
    MecabraAcceptInlineCandidates();
  }
}

- (void)setShuangpinType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_shuangpinType = a3;
  BOOL v4 = [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];

  MEMORY[0x1F4180C40](v4, v3);
}

- (void)setTextContentType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_textContentType = a3;
  BOOL v4 = [(TIMecabraEnvironmentContextWrapper *)self mecabraContext];

  MEMORY[0x1F4180C48](v4, v3);
}

- (void)dealloc
{
  MecabraContextRelease();
  v3.receiver = self;
  v3.super_class = (Class)TIMecabraEnvironmentContextWrapper;
  [(TIMecabraEnvironmentContextWrapper *)&v3 dealloc];
}

- (TIMecabraEnvironmentContextWrapper)initWithMecabraEngine:(__Mecabra *)a3 language:(int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TIMecabraEnvironmentContextWrapper;
  uint64_t v5 = [(TIMecabraEnvironmentContextWrapper *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    v5->_mecabraEngine = a3;
    v5->_mecabraContext = (__MecabraContext *)MecabraContextCreateMutable();
    *(int64x2_t *)&v6->_candidateIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(void *)&v6->_textContentType = 0;
  }
  return v6;
}

@end