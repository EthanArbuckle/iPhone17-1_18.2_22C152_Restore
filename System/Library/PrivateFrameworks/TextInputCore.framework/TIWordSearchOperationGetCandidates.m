@interface TIWordSearchOperationGetCandidates
- (BOOL)hardwareKeyboardMode;
- (BOOL)predictionEnabled;
- (BOOL)reanalysisMode;
- (MCAcceptCandidateInput)lastAcceptCandidateInput;
- (MCKeyboardInput)keyboardInput;
- (NSArray)geometryModelData;
- (NSString)inputString;
- (SEL)action;
- (TIKeyboardCandidate)candidateAfterSegmentBreak;
- (TIMecabraIMLogger)logger;
- (TIWordSearch)wordSearch;
- (TIWordSearchCandidateResultSet)results;
- (TIWordSearchOperationGetCandidates)initWithWordSearch:(id)a3 inputString:(id)a4 keyboardInput:(id)a5 segmentBreakIndex:(unint64_t)a6 predictionEnabled:(BOOL)a7 reanalysisMode:(BOOL)a8 autocapitalizationType:(unint64_t)a9 target:(id)a10 action:(SEL)a11 geometryModelData:(id)a12 hardwareKeyboardMode:(BOOL)a13 logger:(id)a14;
- (id)target;
- (unint64_t)autocapitalizationType;
- (unint64_t)segmentBreakIndex;
- (void)checkForCachedResults;
- (void)completeSearchOnMainThreadWithResults:(id)a3;
- (void)dealloc;
- (void)perform;
- (void)setCandidateAfterSegmentBreak:(id)a3;
- (void)setResults:(id)a3;
- (void)setSegmentBreakIndex:(unint64_t)a3;
- (void)setWordSearch:(id)a3;
@end

@implementation TIWordSearchOperationGetCandidates

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordSearch, 0);
  objc_storeStrong((id *)&self->_candidateAfterSegmentBreak, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_geometryModelData, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_lastAcceptCandidateInput, 0);
  objc_storeStrong((id *)&self->_keyboardInput, 0);

  objc_storeStrong((id *)&self->_inputString, 0);
}

- (void)setWordSearch:(id)a3
{
}

- (TIWordSearch)wordSearch
{
  return (TIWordSearch *)objc_getProperty(self, a2, 344, 1);
}

- (void)setCandidateAfterSegmentBreak:(id)a3
{
}

- (TIKeyboardCandidate)candidateAfterSegmentBreak
{
  return self->_candidateAfterSegmentBreak;
}

- (TIMecabraIMLogger)logger
{
  return self->_logger;
}

- (BOOL)hardwareKeyboardMode
{
  return self->_hardwareKeyboardMode;
}

- (NSArray)geometryModelData
{
  return self->_geometryModelData;
}

- (unint64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (BOOL)reanalysisMode
{
  return self->_reanalysisMode;
}

- (BOOL)predictionEnabled
{
  return self->_predictionEnabled;
}

- (void)setSegmentBreakIndex:(unint64_t)a3
{
  self->_segmentBreakIndex = a3;
}

- (unint64_t)segmentBreakIndex
{
  return self->_segmentBreakIndex;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (id)target
{
  return self->_target;
}

- (void)setResults:(id)a3
{
}

- (TIWordSearchCandidateResultSet)results
{
  return self->_results;
}

- (MCAcceptCandidateInput)lastAcceptCandidateInput
{
  return self->_lastAcceptCandidateInput;
}

- (MCKeyboardInput)keyboardInput
{
  return self->_keyboardInput;
}

- (NSString)inputString
{
  return self->_inputString;
}

- (void)completeSearchOnMainThreadWithResults:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v4 = [(TIWordSearchOperationGetCandidates *)self isCancelled];
    uint64_t v5 = v7;
    if ((v4 & 1) == 0)
    {
      v6 = [(TIWordSearchOperationGetCandidates *)self target];
      objc_msgSend(v6, -[TIWordSearchOperationGetCandidates action](self, "action"), v7, self);

      uint64_t v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)perform
{
  if (([(TIWordSearchOperationGetCandidates *)self isCancelled] & 1) == 0)
  {
    v3 = [(TIWordSearchOperationGetCandidates *)self results];

    if (!v3)
    {
      v9 = [(TIWordSearchOperationGetCandidates *)self wordSearch];
      v10 = [v9 candidatesForOperation:self];
      [(TIWordSearchOperationGetCandidates *)self setResults:v10];

      uint64_t v11 = [(TIWordSearchOperationGetCandidates *)self lastAcceptCandidateInput];
      if (v11)
      {
        v12 = (void *)v11;
        v13 = [(TIWordSearchOperationGetCandidates *)self keyboardInput];
        v14 = [v13 composingInput];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v16 = [(TIWordSearchOperationGetCandidates *)self keyboardInput];
          v17 = [v16 composingInput];
          v18 = [v17 remainingMecabraInputs];
          v19 = [(TIWordSearchOperationGetCandidates *)self lastAcceptCandidateInput];
          [v19 setRemainingMecabraInputs:v18];

          v20 = [(TIWordSearchOperationGetCandidates *)self results];
          v21 = [v20 candidates];
          v22 = [v21 firstObject];

          if (v22)
          {
            v23 = [v22 input];
            v24 = [(TIWordSearchOperationGetCandidates *)self lastAcceptCandidateInput];
            [v24 setRemainingInputString:v23];
          }
        }
      }
    }
  }
  if (([(TIWordSearchOperationGetCandidates *)self isCancelled] & 1) == 0)
  {
    uint64_t v4 = [(TIWordSearchOperationGetCandidates *)self results];
    if (v4)
    {
      id v25 = (id)v4;
      uint64_t v5 = [(TIWordSearchOperationGetCandidates *)self target];
      if (v5)
      {
        v6 = (void *)v5;
        uint64_t v7 = [(TIWordSearchOperationGetCandidates *)self action];

        if (!v7) {
          return;
        }
        v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
        [v8 cancelPerformSelectorsWithTarget:self];

        id v25 = [(TIWordSearchOperationGetCandidates *)self results];
        [(TIWordSearchOperationGetCandidates *)self performSelectorOnMainThread:sel_completeSearchOnMainThreadWithResults_ withObject:v25 waitUntilDone:0];
      }
    }
  }
}

- (void)checkForCachedResults
{
  id v4 = [(TIWordSearchOperationGetCandidates *)self wordSearch];
  v3 = [v4 cachedCandidatesForOperation:self];
  [(TIWordSearchOperationGetCandidates *)self setResults:v3];
}

- (void)dealloc
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id target = self->_target;
    self->_id target = 0;
  }
  else
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__20956;
    v8[4] = __Block_byref_object_dispose__20957;
    id v9 = self->_target;
    id v4 = self->_target;
    self->_id target = 0;

    uint64_t v5 = [MEMORY[0x1E4F28F08] mainQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__TIWordSearchOperationGetCandidates_dealloc__block_invoke;
    v7[3] = &unk_1E6E2E248;
    v7[4] = v8;
    [v5 addOperationWithBlock:v7];

    _Block_object_dispose(v8, 8);
  }
  v6.receiver = self;
  v6.super_class = (Class)TIWordSearchOperationGetCandidates;
  [(TIWordSearchOperationGetCandidates *)&v6 dealloc];
}

void __45__TIWordSearchOperationGetCandidates_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (TIWordSearchOperationGetCandidates)initWithWordSearch:(id)a3 inputString:(id)a4 keyboardInput:(id)a5 segmentBreakIndex:(unint64_t)a6 predictionEnabled:(BOOL)a7 reanalysisMode:(BOOL)a8 autocapitalizationType:(unint64_t)a9 target:(id)a10 action:(SEL)a11 geometryModelData:(id)a12 hardwareKeyboardMode:(BOOL)a13 logger:(id)a14
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a10;
  id v39 = a12;
  id v38 = a14;
  v40.receiver = self;
  v40.super_class = (Class)TIWordSearchOperationGetCandidates;
  v22 = [(TIWordSearchOperationGetCandidates *)&v40 init];
  if (v22)
  {
    id v34 = v18;
    id v33 = v19;
    uint64_t v23 = [v19 copy];
    inputString = v22->_inputString;
    v22->_inputString = (NSString *)v23;

    id v25 = [v20 composingInput];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v27 = [v20 composingInput];
      lastAcceptCandidateInput = v22->_lastAcceptCandidateInput;
      v22->_lastAcceptCandidateInput = (MCAcceptCandidateInput *)v27;
    }
    uint64_t v29 = [v20 copy];
    keyboardInput = v22->_keyboardInput;
    v22->_keyboardInput = (MCKeyboardInput *)v29;

    v22->_segmentBreakIndex = a6;
    v22->_predictionEnabled = a7;
    v22->_reanalysisMode = a8;
    v22->_autocapitalizationType = a9;
    objc_storeStrong(&v22->_target, a10);
    if (a11) {
      SEL v31 = a11;
    }
    else {
      SEL v31 = 0;
    }
    id v19 = v33;
    v22->_action = v31;
    objc_storeStrong((id *)&v22->_geometryModelData, a12);
    v22->_hardwareKeyboardMode = a13;
    objc_storeStrong((id *)&v22->_logger, a14);
    objc_storeStrong((id *)&v22->_wordSearch, a3);
    [(TIWordSearchOperationGetCandidates *)v22 checkForCachedResults];
    id v18 = v34;
  }

  return v22;
}

@end