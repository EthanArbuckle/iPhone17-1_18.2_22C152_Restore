@interface TIWordSearchHandwriting_ja
- (id)generateConversionsForCandidate:(id)a3 candidateContext:(id)a4 stringContext:(id)a5;
- (id)generatePredictionsWithCandidateContext:(id)a3 stringContext:(id)a4 option:(unint64_t)a5;
- (int)mecabraInputMethodType;
@end

@implementation TIWordSearchHandwriting_ja

- (id)generateConversionsForCandidate:(id)a3 candidateContext:(id)a4 stringContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = [MEMORY[0x263EFF980] array];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __93__TIWordSearchHandwriting_ja_generateConversionsForCandidate_candidateContext_stringContext___block_invoke;
  v22[3] = &unk_265535350;
  v22[4] = self;
  id v11 = v9;
  id v23 = v11;
  id v12 = v10;
  id v24 = v12;
  id v13 = v8;
  id v25 = v13;
  v26 = &v27;
  v14 = (void (**)(void))MEMORY[0x2611ED830](v22);
  v15 = [MEMORY[0x263F08A48] currentQueue];
  v16 = [MEMORY[0x263F7EB60] sharedOperationQueue];
  int v17 = [v15 isEqual:v16];

  if (v17)
  {
    v14[2](v14);
  }
  else
  {
    v18 = [MEMORY[0x263F086D0] blockOperationWithBlock:v14];
    [(TIWordSearch *)self performOperationAsync:v18];

    v19 = [MEMORY[0x263F7EB60] sharedOperationQueue];
    [v19 waitUntilAllOperationsAreFinished];
  }
  id v20 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v20;
}

- (id)generatePredictionsWithCandidateContext:(id)a3 stringContext:(id)a4 option:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
  if ([v8 count] == 1
    && ([v8 objectAtIndexedSubscript:0],
        (id)objc_claimAutoreleasedReturnValue(),
        [(id)MecabraCandidateGetSurface() _containsSymbolsAndPunctuationOnly]))
  {
    uint64_t v11 = [MEMORY[0x263EFF8C0] array];
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t CandidateFromContextString = *(void *)(*((void *)&v23 + 1) + 8 * i);
          int Type = MecabraCandidateGetType();
          if (Type != 1 && Type != 7)
          {
            MecabraCandidateGetSurface();
            [(TIWordSearch *)self mecabra];
            uint64_t CandidateFromContextString = MecabraCreateCandidateFromContextString();
          }
          [v10 addObject:CandidateFromContextString];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    v22.receiver = self;
    v22.super_class = (Class)TIWordSearchHandwriting_ja;
    uint64_t v11 = [(TIWordSearchHandwriting *)&v22 generatePredictionsWithCandidateContext:v10 stringContext:v9 option:a5];
  }
  id v20 = (void *)v11;

  return v20;
}

- (int)mecabraInputMethodType
{
  return 1;
}

@end