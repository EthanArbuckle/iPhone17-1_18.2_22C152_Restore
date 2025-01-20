@interface TIWordSearchHandwriting
- (__MecabraContext)createMecabraContextFromCandidateContext:(id)a3 stringContext:(id)a4;
- (id)generateConversionsForCandidate:(id)a3 candidateContext:(id)a4 stringContext:(id)a5;
- (id)generatePredictionsWithCandidateContext:(id)a3 stringContext:(id)a4 option:(unint64_t)a5;
- (id)mecabraCreationOptionsDictionary;
- (void)acceptCandidate:(void *)a3;
- (void)updateMecabraState;
@end

@implementation TIWordSearchHandwriting

- (__MecabraContext)createMecabraContextFromCandidateContext:(id)a3 stringContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(TIWordSearch *)self mecabra];
  [(TIWordSearch *)self mecabraLanguage];
  Mutable = (__MecabraContext *)MecabraContextCreateMutable();
  if ([v7 length])
  {
    CandidateFromContextString = (void *)MecabraCreateCandidateFromContextString();
    MecabraContextAddCandidate();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        MecabraContextAddCandidate();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  return Mutable;
}

- (id)generateConversionsForCandidate:(id)a3 candidateContext:(id)a4 stringContext:(id)a5
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)generatePredictionsWithCandidateContext:(id)a3 stringContext:(id)a4 option:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = [MEMORY[0x263EFF980] array];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __88__TIWordSearchHandwriting_generatePredictionsWithCandidateContext_stringContext_option___block_invoke;
  v20[3] = &unk_265535328;
  v20[4] = self;
  id v10 = v8;
  id v21 = v10;
  id v11 = v9;
  v23 = &v25;
  unint64_t v24 = a5;
  id v22 = v11;
  uint64_t v12 = (void (**)(void))MEMORY[0x2611ED830](v20);
  uint64_t v13 = [MEMORY[0x263F08A48] currentQueue];
  uint64_t v14 = [MEMORY[0x263F7EB60] sharedOperationQueue];
  int v15 = [v13 isEqual:v14];

  if (v15)
  {
    v12[2](v12);
  }
  else
  {
    long long v16 = [MEMORY[0x263F086D0] blockOperationWithBlock:v12];
    [(TIWordSearch *)self performOperationAsync:v16];

    long long v17 = [MEMORY[0x263F7EB60] sharedOperationQueue];
    [v17 waitUntilAllOperationsAreFinished];
  }
  id v18 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v18;
}

uint64_t __88__TIWordSearchHandwriting_generatePredictionsWithCandidateContext_stringContext_option___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) mecabra];
  uint64_t v2 = [*(id *)(a1 + 32) createMecabraContextFromCandidateContext:*(void *)(a1 + 40) stringContext:*(void *)(a1 + 48)];
  uint64_t result = MecabraPredictionAnalyzeWithContext();
  if (result)
  {
    while (1)
    {
      uint64_t result = MecabraPredictionGetNextCandidate();
      if (!result) {
        break;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:result];
    }
  }
  if (v2)
  {
    return MEMORY[0x270F99D98](v2);
  }
  return result;
}

- (void)acceptCandidate:(void *)a3
{
  if (a3)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__TIWordSearchHandwriting_acceptCandidate___block_invoke;
    v10[3] = &unk_265535300;
    v10[4] = self;
    v10[5] = a3;
    v4 = (void (**)(void))MEMORY[0x2611ED830](v10, a2);
    v5 = [MEMORY[0x263F08A48] currentQueue];
    id v6 = [MEMORY[0x263F7EB60] sharedOperationQueue];
    int v7 = [v5 isEqual:v6];

    if (v7)
    {
      v4[2](v4);
    }
    else
    {
      id v8 = [MEMORY[0x263F086D0] blockOperationWithBlock:v4];
      [(TIWordSearch *)self performOperationAsync:v8];

      id v9 = [MEMORY[0x263F7EB60] sharedOperationQueue];
      [v9 waitUntilAllOperationsAreFinished];
    }
  }
}

uint64_t __43__TIWordSearchHandwriting_acceptCandidate___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) mecabra];
  if (MecabraCandidateIsPredictionCandidate()) {
    MecabraPredictionAcceptCandidate();
  }
  else {
    MecabraAcceptCandidate();
  }
  uint64_t result = MecabraCandidateGetSurface();
  if (result)
  {
    return MEMORY[0x270F99EB0](v1, result);
  }
  return result;
}

- (void)updateMecabraState
{
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchHandwriting;
  [(TIWordSearch *)&v3 updateMecabraState];
  [(TIWordSearch *)self updateUserWordEntries];
  [(TIWordSearch *)self updateDictionaryPaths];
}

- (id)mecabraCreationOptionsDictionary
{
  v5.receiver = self;
  v5.super_class = (Class)TIWordSearchHandwriting;
  uint64_t v2 = [(TIWordSearch *)&v5 mecabraCreationOptionsDictionary];
  objc_super v3 = (void *)[v2 mutableCopy];

  [v3 removeObjectForKey:*MEMORY[0x263F8C530]];
  return v3;
}

void __93__TIWordSearchHandwriting_ja_generateConversionsForCandidate_candidateContext_stringContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) mecabra];
  uint64_t v2 = [*(id *)(a1 + 32) createMecabraContextFromCandidateContext:*(void *)(a1 + 40) stringContext:*(void *)(a1 + 48)];
  objc_super v3 = [*(id *)(a1 + 56) candidate];
  int v4 = MecabraAnalyzeStringWithContext();

  if (v4)
  {
    while (1)
    {
      uint64_t NextCandidate = MecabraGetNextCandidate();
      if (!NextCandidate) {
        break;
      }
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:NextCandidate];
    }
  }
  if (v2)
  {
    MEMORY[0x270F99D98](v2);
  }
}

@end