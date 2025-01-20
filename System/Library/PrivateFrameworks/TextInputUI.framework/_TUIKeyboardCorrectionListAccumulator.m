@interface _TUIKeyboardCorrectionListAccumulator
- (BOOL)areAllGeneratorsComplete;
- (BOOL)completionCalled;
- (BOOL)hasCorrectionsForCandidateSource:(int64_t)a3;
- (BOOL)kbdCorrectionsAreComplete;
- (BOOL)updateWithCorrections:(id)a3 forType:(int64_t)a4;
- (NSArray)expectedGeneratorSourceTypes;
- (NSMutableDictionary)generatorResults;
- (NSMutableSet)nilResults;
- (OS_dispatch_queue)completionBlockQueue;
- (TICandidateRequestToken)token;
- (TIKeyboardState)keyboardState;
- (_TUIKeyboardCorrectionListAccumulator)initWithRequestToken:(id)a3 keyboardState:(id)a4 enabledCandidateSources:(id)a5 policy:(id)a6 onComplete:(id)a7;
- (_TUIKeyboardCorrectionListAccumulatorPolicy)policy;
- (id)accumulatorCompletedBlock;
- (id)correctionsForCandidateSource:(int64_t)a3;
- (id)debugDescription;
- (void)completionBlockJustOnce:(BOOL)a3;
@end

@implementation _TUIKeyboardCorrectionListAccumulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlockQueue, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_nilResults, 0);
  objc_storeStrong((id *)&self->_generatorResults, 0);
  objc_storeStrong((id *)&self->_expectedGeneratorSourceTypes, 0);
  objc_storeStrong(&self->_accumulatorCompletedBlock, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

- (OS_dispatch_queue)completionBlockQueue
{
  return self->_completionBlockQueue;
}

- (BOOL)completionCalled
{
  return self->_completionCalled;
}

- (_TUIKeyboardCorrectionListAccumulatorPolicy)policy
{
  return self->_policy;
}

- (NSMutableSet)nilResults
{
  return self->_nilResults;
}

- (NSMutableDictionary)generatorResults
{
  return self->_generatorResults;
}

- (NSArray)expectedGeneratorSourceTypes
{
  return self->_expectedGeneratorSourceTypes;
}

- (id)accumulatorCompletedBlock
{
  return self->_accumulatorCompletedBlock;
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (TICandidateRequestToken)token
{
  return self->_token;
}

- (id)debugDescription
{
  uint64_t v3 = [(NSMutableSet *)self->_nilResults count];
  BOOL v4 = [(_TUIKeyboardCorrectionListAccumulator *)self areAllGeneratorsComplete];
  v5 = NSString;
  v6 = [(TICandidateRequestToken *)self->_token shortIdentifier];
  expectedGeneratorSourceTypes = self->_expectedGeneratorSourceTypes;
  uint64_t v8 = [(NSMutableDictionary *)self->_generatorResults count];
  [(_TUIKeyboardCorrectionListAccumulatorPolicy *)self->_policy accumulatorTimeout];
  v10 = "NO";
  if (v4) {
    v11 = "YES";
  }
  else {
    v11 = "NO";
  }
  if (self->_completionCalled) {
    v10 = "YES";
  }
  v12 = [v5 stringWithFormat:@"{requestToken.shortId: %@, enabledSources: %@, generatedResults.count: %lu, nilResults.count: %lu, accumulatorTimeout: %f, isCompleted: %s, completionCalled: %s}", v6, expectedGeneratorSourceTypes, v8, v3, v9, v11, v10];

  return v12;
}

- (void)completionBlockJustOnce:(BOOL)a3
{
  accumulatorCompletedBlock = (void (**)(id, BOOL))self->_accumulatorCompletedBlock;
  if (accumulatorCompletedBlock)
  {
    if (!self->_completionCalled)
    {
      self->_completionCalled = 1;
      accumulatorCompletedBlock[2](accumulatorCompletedBlock, a3);
    }
  }
}

- (BOOL)areAllGeneratorsComplete
{
  if ([(NSArray *)self->_expectedGeneratorSourceTypes count])
  {
    if (![(NSArray *)self->_expectedGeneratorSourceTypes containsObject:&unk_1EDC79A88]
      || (BOOL v3 = [(_TUIKeyboardCorrectionListAccumulator *)self kbdCorrectionsAreComplete]))
    {
      uint64_t v4 = [(NSMutableDictionary *)self->_generatorResults count];
      uint64_t v5 = [(NSMutableSet *)self->_nilResults count] + v4;
      LOBYTE(v3) = v5 == [(NSArray *)self->_expectedGeneratorSourceTypes count];
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)updateWithCorrections:(id)a3 forType:(int64_t)a4
{
  id v6 = a3;
  expectedGeneratorSourceTypes = self->_expectedGeneratorSourceTypes;
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  BOOL v9 = [(NSArray *)expectedGeneratorSourceTypes containsObject:v8];

  if (v9)
  {
    if (v6)
    {
      generatorResults = self->_generatorResults;
      v11 = [NSNumber numberWithInteger:a4];
      [(NSMutableDictionary *)generatorResults setObject:v6 forKeyedSubscript:v11];

      nilResults = self->_nilResults;
      v13 = [NSNumber numberWithInteger:a4];
      [(NSMutableSet *)nilResults removeObject:v13];
    }
    else
    {
      v14 = self->_nilResults;
      v15 = [NSNumber numberWithInteger:a4];
      [(NSMutableSet *)v14 addObject:v15];

      v16 = self->_generatorResults;
      v13 = [NSNumber numberWithInteger:a4];
      [(NSMutableDictionary *)v16 removeObjectForKey:v13];
    }

    if ([(_TUIKeyboardCorrectionListAccumulator *)self areAllGeneratorsComplete])
    {
      v17 = [(_TUIKeyboardCorrectionListAccumulator *)self completionBlockQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71___TUIKeyboardCorrectionListAccumulator_updateWithCorrections_forType___block_invoke;
      block[3] = &unk_1E55941A8;
      block[4] = self;
      dispatch_async(v17, block);
    }
  }

  return v9;
}

- (BOOL)kbdCorrectionsAreComplete
{
  if ([(NSMutableSet *)self->_nilResults containsObject:&unk_1EDC79A88]) {
    return 1;
  }
  uint64_t v4 = [(NSMutableDictionary *)self->_generatorResults objectForKeyedSubscript:&unk_1EDC79A88];
  uint64_t v5 = v4;
  BOOL v3 = 0;
  if (v4)
  {
    id v6 = [v4 predictions];

    if (v6) {
      BOOL v3 = 1;
    }
  }

  return v3;
}

- (id)correctionsForCandidateSource:(int64_t)a3
{
  generatorResults = self->_generatorResults;
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)generatorResults objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)hasCorrectionsForCandidateSource:(int64_t)a3
{
  generatorResults = self->_generatorResults;
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)generatorResults objectForKeyedSubscript:v4];
  LOBYTE(generatorResults) = v5 != 0;

  return (char)generatorResults;
}

- (_TUIKeyboardCorrectionListAccumulator)initWithRequestToken:(id)a3 keyboardState:(id)a4 enabledCandidateSources:(id)a5 policy:(id)a6 onComplete:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v36.receiver = self;
  v36.super_class = (Class)_TUIKeyboardCorrectionListAccumulator;
  v18 = [(_TUIKeyboardCorrectionListAccumulator *)&v36 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_token, a3);
    objc_storeStrong((id *)&v19->_keyboardState, a4);
    objc_storeStrong((id *)&v19->_expectedGeneratorSourceTypes, a5);
    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    generatorResults = v19->_generatorResults;
    v19->_generatorResults = (NSMutableDictionary *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
    nilResults = v19->_nilResults;
    v19->_nilResults = (NSMutableSet *)v22;

    v24 = _Block_copy(v17);
    id accumulatorCompletedBlock = v19->_accumulatorCompletedBlock;
    v19->_id accumulatorCompletedBlock = v24;

    dispatch_queue_t v26 = dispatch_queue_create("com.apple.TextInputUI.TUIKeyboardCorrectionListAccumulator.Completion", 0);
    completionBlockQueue = v19->_completionBlockQueue;
    v19->_completionBlockQueue = (OS_dispatch_queue *)v26;

    v19->_completionCalled = 0;
    if (v16)
    {
      v28 = (_TUIKeyboardCorrectionListAccumulatorPolicy *)v16;
    }
    else
    {
      v28 = +[_TUIKeyboardCorrectionListAccumulatorPolicy standard];
    }
    policy = v19->_policy;
    v19->_policy = v28;

    [(_TUIKeyboardCorrectionListAccumulatorPolicy *)v19->_policy accumulatorTimeout];
    dispatch_time_t v31 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
    v32 = v19->_completionBlockQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __118___TUIKeyboardCorrectionListAccumulator_initWithRequestToken_keyboardState_enabledCandidateSources_policy_onComplete___block_invoke;
    block[3] = &unk_1E55941A8;
    v35 = v19;
    dispatch_after(v31, v32, block);
  }
  return v19;
}

@end