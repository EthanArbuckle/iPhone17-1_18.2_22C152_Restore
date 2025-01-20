@interface CRMultiLocaleTextRecognizer
- (CRMultiLocaleTextRecognizer)initWithImageReaderOptions:(id)a3 error:(id *)a4;
- (NSMutableDictionary)textRecognizers;
- (id)decodingStats;
- (id)identifierForTextRegion:(id)a3;
- (id)inferenceStats;
- (id)recognizerForIdentifier:(id)a3;
- (void)cancel;
- (void)setTextRecognizers:(id)a3;
@end

@implementation CRMultiLocaleTextRecognizer

- (CRMultiLocaleTextRecognizer)initWithImageReaderOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRMultiLocaleTextRecognizer;
  v7 = [(CRMultiModelTextRecognizer *)&v12 initWithConfigurationOptions:v6];
  if (v7)
  {
    v8 = [[CRMultiLocaleRecognizerConfiguration alloc] initWithImageReaderOptions:v6 error:a4];
    [(CRMultiModelTextRecognizer *)v7 setConfiguration:v8];
    v9 = [[CRLocaleBasedTextFeatureSplitter alloc] initWithConfiguration:v8];
    [(CRMultiModelTextRecognizer *)v7 setTextFeatureSplitter:v9];

    v10 = objc_opt_new();
    [(CRMultiLocaleTextRecognizer *)v7 setTextRecognizers:v10];
  }
  return v7;
}

- (id)recognizerForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CRMultiLocaleTextRecognizer *)self textRecognizers];
  objc_sync_enter(v5);
  id v6 = [(CRMultiLocaleTextRecognizer *)self textRecognizers];
  v7 = [v6 objectForKey:v4];

  if (!v7)
  {
    v8 = [(CRMultiModelTextRecognizer *)self configurationOptions];
    id v20 = 0;
    v9 = +[CRNeuralTextRecognizer recognizerForLocale:v4 imageReaderOptions:v8 error:&v20];
    id v10 = v20;
    v11 = [(CRMultiLocaleTextRecognizer *)self textRecognizers];
    [v11 setObject:v9 forKeyedSubscript:v4];

    if (![(CRMultiModelTextRecognizer *)self keepAllResourcesLoadedWhenNotInUse])
    {
      objc_super v12 = [(CRMultiModelTextRecognizer *)self configuration];
      v13 = [v12 languages];
      v14 = [v13 firstObject];

      if (([v4 isEqualToString:v14] & 1) == 0
        && !+[CRImageReader languageIsLatin:v4]
        && !+[CRImageReader languageIsCyrillic:v4])
      {
        v15 = [(CRMultiLocaleTextRecognizer *)self textRecognizers];
        v16 = [v15 objectForKeyedSubscript:v4];
        [v16 setUnloadResourcesWhenNotInUse:1];
      }
    }
  }
  v17 = [(CRMultiLocaleTextRecognizer *)self textRecognizers];
  v18 = [v17 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);
  return v18;
}

- (id)inferenceStats
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__13;
  id v10 = __Block_byref_object_dispose__13;
  id v11 = 0;
  v2 = [(CRMultiLocaleTextRecognizer *)self textRecognizers];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CRMultiLocaleTextRecognizer_inferenceStats__block_invoke;
  v5[3] = &unk_1E6CDBB60;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__CRMultiLocaleTextRecognizer_inferenceStats__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    id v4 = a3;
    id v11 = [v4 inferenceStats];

    [v3 addStatistics:v11];
  }
  else
  {
    id v6 = a3;
    v7 = [CRPerformanceStatistics alloc];
    id v11 = [v6 inferenceStats];

    uint64_t v8 = [(CRPerformanceStatistics *)v7 initWithStatistics:v11];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (id)decodingStats
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__13;
  id v10 = __Block_byref_object_dispose__13;
  id v11 = 0;
  v2 = [(CRMultiLocaleTextRecognizer *)self textRecognizers];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__CRMultiLocaleTextRecognizer_decodingStats__block_invoke;
  v5[3] = &unk_1E6CDBB60;
  v5[4] = &v6;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__CRMultiLocaleTextRecognizer_decodingStats__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    id v4 = a3;
    id v11 = [v4 decodingStats];

    [v3 addStatistics:v11];
  }
  else
  {
    id v6 = a3;
    v7 = [CRPerformanceStatistics alloc];
    id v11 = [v6 decodingStats];

    uint64_t v8 = [(CRPerformanceStatistics *)v7 initWithStatistics:v11];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (id)identifierForTextRegion:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v4 locale], (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = [(CRMultiLocaleTextRecognizer *)self textRecognizers];
    v7 = [v6 allKeys];
    v5 = [v7 firstObject];
  }
  return v5;
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)CRMultiLocaleTextRecognizer;
  [(CRMultiModelTextRecognizer *)&v5 cancel];
  id v3 = [(CRMultiLocaleTextRecognizer *)self textRecognizers];
  objc_sync_enter(v3);
  id v4 = [(CRMultiLocaleTextRecognizer *)self textRecognizers];
  [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_24];

  objc_sync_exit(v3);
}

uint64_t __37__CRMultiLocaleTextRecognizer_cancel__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

- (NSMutableDictionary)textRecognizers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTextRecognizers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end