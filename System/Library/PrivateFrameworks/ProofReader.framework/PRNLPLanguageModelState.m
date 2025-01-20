@interface PRNLPLanguageModelState
- (BOOL)getConditionalProbabilityForString:(id)a3 probability:(double *)a4;
- (PRNLPLanguageModel)languageModel;
- (PRNLPLanguageModelState)initWithLanguageModel:(id)a3 state:(id)a4;
- (id)conditionalProbabilityDictionaryForStrings:(id)a3;
- (void)dealloc;
- (void)enumeratePredictions:(unint64_t)a3 maxTokensPerPrediction:(unint64_t)a4 withBlock:(id)a5;
@end

@implementation PRNLPLanguageModelState

- (PRNLPLanguageModelState)initWithLanguageModel:(id)a3 state:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PRNLPLanguageModelState;
  v6 = [(PRNLPLanguageModelState *)&v8 init];
  if (v6)
  {
    v6->_languageModel = (PRNLPLanguageModel *)a3;
    v6->_state = (NLLanguageModelState *)a4;
    v6->_cachedPredictionsDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v6;
}

- (BOOL)getConditionalProbabilityForString:(id)a3 probability:(double *)a4
{
  v5 = (void *)[(NLLanguageModelState *)self->_state conditionalProbabilityForString:a3];
  if (v5)
  {
    v6 = v5;
    LODWORD(v5) = [v5 isValid];
    if (v5)
    {
      [v6 log10Probability];
      if (a4) {
        *(void *)a4 = v7;
      }
      LOBYTE(v5) = 1;
    }
  }
  return (char)v5;
}

- (id)conditionalProbabilityDictionaryForStrings:(id)a3
{
  v5 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v6 = (void *)[(NLLanguageModelState *)self->_state conditionalProbabilitiesForStrings:a3];
  uint64_t v7 = [a3 count];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v10 = [a3 objectAtIndex:i];
      v11 = (void *)[v6 objectAtIndex:i];
      if ([v11 isValid])
      {
        [v11 log10Probability];
        objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:"), v10);
      }
    }
  }
  return v5;
}

- (void)enumeratePredictions:(unint64_t)a3 maxTokensPerPrediction:(unint64_t)a4 withBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%u/%u", a3, a4);
  uint64_t v10 = (void *)[(NSMutableDictionary *)self->_cachedPredictionsDictionary objectForKey:v9];
  if (!v10)
  {
    uint64_t v10 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:a3];
    state = self->_state;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __81__PRNLPLanguageModelState_enumeratePredictions_maxTokensPerPrediction_withBlock___block_invoke;
    v26[3] = &unk_2640EF750;
    v26[4] = v10;
    [(NLLanguageModelState *)state enumeratePredictions:a3 maximumTokensPerPrediction:a4 withBlock:v26];
    [(NSMutableDictionary *)self->_cachedPredictionsDictionary setObject:v10 forKey:v9];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v23;
LABEL_5:
    uint64_t v16 = 0;
    uint64_t v20 = v14 + v13;
    while (1)
    {
      if (*(void *)v23 != v15) {
        objc_enumerationMutation(v10);
      }
      int v17 = 0;
      v18 = *(void **)(*((void *)&v22 + 1) + 8 * v16);
      unsigned __int8 v21 = 0;
      if (v14 + v16 < a3)
      {
        uint64_t v19 = [v18 prediction];
        objc_msgSend((id)objc_msgSend(v18, "probabilityInfo"), "log10Probability");
        (*((void (**)(id, uint64_t, unsigned __int8 *))a5 + 2))(a5, v19, &v21);
        int v17 = v21;
      }
      if (v17 || v14 + v16 + 1 >= a3) {
        break;
      }
      if (v13 == ++v16)
      {
        uint64_t v13 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
        uint64_t v14 = v20;
        if (v13) {
          goto LABEL_5;
        }
        return;
      }
    }
  }
}

uint64_t __81__PRNLPLanguageModelState_enumeratePredictions_maxTokensPerPrediction_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRNLPLanguageModelState;
  [(PRNLPLanguageModelState *)&v3 dealloc];
}

- (PRNLPLanguageModel)languageModel
{
  return self->_languageModel;
}

@end