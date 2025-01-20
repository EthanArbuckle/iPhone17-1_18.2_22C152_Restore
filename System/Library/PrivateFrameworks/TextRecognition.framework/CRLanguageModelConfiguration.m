@interface CRLanguageModelConfiguration
+ (id)configurationForLanguageIdentifier:(id)a3 rev:(unint64_t)a4;
- (CRLanguageModelConfiguration)initWithDictionary:(id)a3;
- (NSArray)filteringCharLengths;
- (NSArray)lmFilteringThresholds;
- (NSNumber)characterLMWeight;
- (NSNumber)lexiconWeight;
- (NSNumber)wordLMWeight;
- (float)filteringActivationThreshold;
- (float)lmThresholdForLength:(int64_t)a3;
- (int64_t)filteringMinimumLength;
- (void)setFilteringCharLengths:(id)a3;
- (void)setLmFilteringThresholds:(id)a3;
@end

@implementation CRLanguageModelConfiguration

+ (id)configurationForLanguageIdentifier:(id)a3 rev:(unint64_t)a4
{
  id v5 = a3;
  if (a4 < 2)
  {
    v12 = [CRLanguageModelConfiguration alloc];
    v11 = [(CRLanguageModelConfiguration *)v12 initWithDictionary:MEMORY[0x1E4F1CC08]];
  }
  else
  {
    v6 = lmConfig();
    v7 = [NSNumber numberWithUnsignedInteger:a4];
    v8 = [v7 stringValue];
    v9 = [v6 objectForKeyedSubscript:v8];
    v10 = [v9 objectForKeyedSubscript:v5];

    v11 = [[CRLanguageModelConfiguration alloc] initWithDictionary:v10];
  }

  return v11;
}

- (CRLanguageModelConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRLanguageModelConfiguration;
  id v5 = [(CRLanguageModelConfiguration *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"lexicon"];
    lexiconWeight = v5->_lexiconWeight;
    v5->_lexiconWeight = (NSNumber *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"charlm"];
    characterLMWeight = v5->_characterLMWeight;
    v5->_characterLMWeight = (NSNumber *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"wordlm"];
    wordLMWeight = v5->_wordLMWeight;
    v5->_wordLMWeight = (NSNumber *)v10;

    v12 = [v4 objectForKeyedSubscript:@"lmFiltering"];
    v13 = [v12 objectForKeyedSubscript:@"activationThreshold"];
    [v13 floatValue];
    v5->_filteringActivationThreshold = v14;

    v15 = [v4 objectForKeyedSubscript:@"lmFiltering"];
    uint64_t v16 = [v15 objectForKeyedSubscript:@"charLengths"];
    filteringCharLengths = v5->_filteringCharLengths;
    v5->_filteringCharLengths = (NSArray *)v16;

    v18 = [v4 objectForKeyedSubscript:@"lmFiltering"];
    uint64_t v19 = [v18 objectForKeyedSubscript:@"lmThresholds"];
    lmFilteringThresholds = v5->_lmFilteringThresholds;
    v5->_lmFilteringThresholds = (NSArray *)v19;

    v21 = [(NSArray *)v5->_filteringCharLengths lastObject];
    v5->_filteringMinimumLength = [v21 integerValue];
  }
  return v5;
}

- (float)lmThresholdForLength:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = (float *)&v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 2139095039;
  id v5 = [(CRLanguageModelConfiguration *)self filteringCharLengths];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__CRLanguageModelConfiguration_lmThresholdForLength___block_invoke;
  v8[3] = &unk_1E6CDC7C0;
  v8[5] = &v9;
  v8[6] = a3;
  v8[4] = self;
  [v5 enumerateObjectsUsingBlock:v8];

  float v6 = v10[6];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __53__CRLanguageModelConfiguration_lmThresholdForLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7 >= [a2 integerValue])
  {
    uint64_t v8 = [*(id *)(a1 + 32) lmFilteringThresholds];
    uint64_t v9 = [v8 objectAtIndexedSubscript:a3];
    [v9 floatValue];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;

    *a4 = 1;
  }
}

- (NSNumber)lexiconWeight
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)characterLMWeight
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)wordLMWeight
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (float)filteringActivationThreshold
{
  return self->_filteringActivationThreshold;
}

- (int64_t)filteringMinimumLength
{
  return self->_filteringMinimumLength;
}

- (NSArray)filteringCharLengths
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFilteringCharLengths:(id)a3
{
}

- (NSArray)lmFilteringThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLmFilteringThresholds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lmFilteringThresholds, 0);
  objc_storeStrong((id *)&self->_filteringCharLengths, 0);
  objc_storeStrong((id *)&self->_wordLMWeight, 0);
  objc_storeStrong((id *)&self->_characterLMWeight, 0);
  objc_storeStrong((id *)&self->_lexiconWeight, 0);
}

@end