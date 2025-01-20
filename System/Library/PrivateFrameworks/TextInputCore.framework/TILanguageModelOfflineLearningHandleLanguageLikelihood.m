@interface TILanguageModelOfflineLearningHandleLanguageLikelihood
- (void)adaptToParagraph:(id)a3 timeStamp:(double)a4 adaptationType:(int)a5;
- (void)updateAdaptationContext:(id)a3;
@end

@implementation TILanguageModelOfflineLearningHandleLanguageLikelihood

- (void)adaptToParagraph:(id)a3 timeStamp:(double)a4 adaptationType:(int)a5
{
  id v6 = a3;
  id v5 = v6;
  TIDispatchSync();
}

void __100__TILanguageModelOfflineLearningHandleLanguageLikelihood_adaptToParagraph_timeStamp_adaptationType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentAdaptationContext];
  id v6 = [v2 recipientNameDigest];

  v3 = [*(id *)(a1 + 32) currentAdaptationContext];
  v4 = [v3 appContext];

  id v5 = +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel];
  [v5 addEvidence:*(void *)(a1 + 40) timestamp:*(unsigned int *)(a1 + 56) adaptationType:v6 forRecipient:v4 app:0 language:*(double *)(a1 + 48)];
}

- (void)updateAdaptationContext:(id)a3
{
  id v4 = a3;
  [(TILanguageModelOfflineLearningHandle *)self setCurrentAdaptationContext:v4];
  id v5 = [(TILanguageModelOfflineLearningHandle *)self lastAdaptationDate];

  if (!v5)
  {
    id v6 = v4;
    TIDispatchSync();
  }
}

void __82__TILanguageModelOfflineLearningHandleLanguageLikelihood_updateAdaptationContext___block_invoke(uint64_t a1)
{
  v2 = +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel];
  v3 = [*(id *)(a1 + 32) appContext];
  [v2 lastOfflineAdaptationTimeForApp:v3];
  double v5 = v4;

  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v5];
  [*(id *)(a1 + 40) setLastAdaptationDate:v6];
}

@end