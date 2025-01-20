@interface GeneratePredictionsOperation
- (GeneratePredictionsOperation)initWithInputManager:(id)a3 predictionOptions:(unint64_t)a4 prefixContext:(id)a5;
- (NSArray)candidates;
- (NSArray)committedCandidates;
- (NSArray)proactiveTriggers;
- (NSArray)stickers;
- (NSDictionary)candidateRefsDictionary;
- (NSString)prefixContext;
- (TIInputManagerHandwriting)inputManager;
- (TIWordSearchHandwriting)wordSearch;
- (unint64_t)predictionOptions;
- (void)main;
@end

@implementation GeneratePredictionsOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateRefsDictionary, 0);
  objc_storeStrong((id *)&self->_proactiveTriggers, 0);
  objc_storeStrong((id *)&self->_stickers, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_prefixContext, 0);
  objc_storeStrong((id *)&self->_committedCandidates, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
  objc_storeStrong((id *)&self->_inputManager, 0);
}

- (NSDictionary)candidateRefsDictionary
{
  return self->_candidateRefsDictionary;
}

- (NSArray)proactiveTriggers
{
  return self->_proactiveTriggers;
}

- (NSArray)stickers
{
  return self->_stickers;
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (NSString)prefixContext
{
  return self->_prefixContext;
}

- (unint64_t)predictionOptions
{
  return self->_predictionOptions;
}

- (NSArray)committedCandidates
{
  return self->_committedCandidates;
}

- (TIWordSearchHandwriting)wordSearch
{
  return self->_wordSearch;
}

- (TIInputManagerHandwriting)inputManager
{
  return self->_inputManager;
}

- (void)main
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263EFF980] array];
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  v31 = v3;
  objc_storeStrong((id *)&self->_candidates, v3);
  objc_storeStrong((id *)&self->_proactiveTriggers, v4);
  objc_storeStrong((id *)&self->_candidateRefsDictionary, v5);
  v6 = [(GeneratePredictionsOperation *)self wordSearch];
  v7 = [(GeneratePredictionsOperation *)self committedCandidates];
  v8 = [(GeneratePredictionsOperation *)self prefixContext];
  v30 = self;
  v9 = objc_msgSend(v6, "generatePredictionsWithCandidateContext:stringContext:option:", v7, v8, -[GeneratePredictionsOperation predictionOptions](self, "predictionOptions"));

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    uint64_t v13 = *MEMORY[0x263F7E968];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        if (MecabraCandidateGetType() == 6)
        {
          v16 = MecabraCandidateGetAttributes();
          if (!v16) {
            goto LABEL_11;
          }
          v17 = [NSNumber numberWithUnsignedLongLong:v15];
          [v5 setObject:v15 forKeyedSubscript:v17];
          v18 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v16];
          [v18 setObject:v17 forKeyedSubscript:v13];
          v19 = (void *)[objc_alloc(MEMORY[0x263F7EB30]) initWithSourceType:0 attributes:v18];
          [v4 addObject:v19];
        }
        else
        {
          v16 = (void *)[objc_alloc(MEMORY[0x263F7E6A0]) initWithMecabraCandidate:v15];
          [v16 setTypingEngine:6];
          [v31 addObject:v16];
          v17 = [v16 mecabraCandidatePointerValue];
          [v5 setObject:v15 forKeyedSubscript:v17];
        }

LABEL_11:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v11);
  }

  if ([v4 count] && TICanLogMessageAtLevel())
  {
    v20 = TIOSLogFacility();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v29 = [NSString stringWithFormat:@"%s ProactiveQuickType:TI: Mecabra found prediction proactive triggers: %@", "-[GeneratePredictionsOperation main]", v4];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v29;
      _os_log_debug_impl(&dword_25EC0A000, v20, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)location, 0xCu);
    }
  }
  v21 = [(GeneratePredictionsOperation *)v30 candidates];
  v22 = [v21 firstObject];

  if (v22)
  {
    v23 = [(GeneratePredictionsOperation *)v30 inputManager];
    v24 = [v23 stickerCandidateGenerator];

    v25 = [v22 candidate];
    v26 = [v24 generateStickerQueriesForText:v25 tokenize:0];

    if ([v26 count])
    {
      v27 = dispatch_group_create();
      dispatch_group_enter(v27);
      objc_initWeak(location, v30);
      id v33 = v24;
      id v34 = v26;
      objc_copyWeak(&v36, location);
      v35 = v27;
      v28 = v27;
      TIDispatchAsync();
      dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);

      objc_destroyWeak(&v36);
      objc_destroyWeak(location);
    }
  }
}

void __36__GeneratePredictionsOperation_main__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) inputManager];
  v5 = [v4 keyboardState];
  v6 = [v5 secureCandidateRenderTraits];
  v7 = [*(id *)(a1 + 48) inputManager];
  v8 = [v7 inputMode];
  v9 = [v8 languageWithRegion];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36__GeneratePredictionsOperation_main__block_invoke_2;
  v10[3] = &unk_265535558;
  objc_copyWeak(&v12, (id *)(a1 + 64));
  id v11 = *(id *)(a1 + 56);
  [v2 generateStickerCandidatesForSearchableQueries:v3 withRenderTraits:v6 shouldAppend:1 language:v9 completionHandler:v10];

  objc_destroyWeak(&v12);
}

void __36__GeneratePredictionsOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (void *)WeakRetained[37];
  WeakRetained[37] = v3;
  id v5 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (GeneratePredictionsOperation)initWithInputManager:(id)a3 predictionOptions:(unint64_t)a4 prefixContext:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GeneratePredictionsOperation;
  id v11 = [(GeneratePredictionsOperation *)&v19 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_inputManager, a3);
    uint64_t v13 = [v9 wordSearch];
    wordSearch = v12->_wordSearch;
    v12->_wordSearch = (TIWordSearchHandwriting *)v13;

    uint64_t v15 = [v9 committedCandidates];
    uint64_t v16 = [v15 copy];
    committedCandidates = v12->_committedCandidates;
    v12->_committedCandidates = (NSArray *)v16;

    v12->_predictionOptions = a4;
    objc_storeStrong((id *)&v12->_prefixContext, a5);
  }

  return v12;
}

@end