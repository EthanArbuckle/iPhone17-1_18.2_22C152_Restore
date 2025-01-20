@interface TILanguageModelOfflineLearningHandleMecabra
- (TIWordSearch)wordSearch;
- (void)adaptToParagraph:(id)a3 timeStamp:(double)a4 adaptationType:(int)a5;
- (void)didFinishLearning;
- (void)load;
- (void)setWordSearch:(id)a3;
- (void)updateAdaptationContext:(id)a3;
@end

@implementation TILanguageModelOfflineLearningHandleMecabra

- (void).cxx_destruct
{
}

- (void)setWordSearch:(id)a3
{
}

- (TIWordSearch)wordSearch
{
  return self->_wordSearch;
}

- (void)didFinishLearning
{
  id v2 = [(TILanguageModelOfflineLearningHandleMecabra *)self wordSearch];
  [v2 flushDynamicData];
}

- (void)adaptToParagraph:(id)a3 timeStamp:(double)a4 adaptationType:(int)a5
{
  id v9 = a3;
  v7 = [(TILanguageModelOfflineLearningHandleMecabra *)self wordSearch];
  if (v7)
  {
    v8 = [(TILanguageModelOfflineLearningHandle *)self currentAdaptationContext];
    [v7 adaptOfflineToParagraph:v9 adaptationContext:v8 timeStamp:a4];
  }
}

- (void)load
{
  id v5 = +[TIWordSearchController sharedWordSearchController];
  v3 = [(TILanguageModelOfflineLearningHandle *)self inputMode];
  v4 = [v5 wordSearchForInputMode:v3];
  [(TILanguageModelOfflineLearningHandleMecabra *)self setWordSearch:v4];
}

- (void)updateAdaptationContext:(id)a3
{
  id v4 = a3;
  id v5 = [(TILanguageModelOfflineLearningHandleMecabra *)self wordSearch];
  v6 = v5;
  if (v5)
  {
    [v5 setLanguageModelAdaptationContext:v4];
    [(TILanguageModelOfflineLearningHandle *)self setCurrentAdaptationContext:v4];
    v7 = [(TILanguageModelOfflineLearningHandle *)self lastAdaptationDate];

    if (!v7)
    {
      id v8 = v6;
      TIDispatchSync();
    }
  }
}

void __71__TILanguageModelOfflineLearningHandleMecabra_updateAdaptationContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) mecabra];
  MecabraGetLastOfflineAdaptationTime();
  objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) setLastAdaptationDate:v2];
}

@end