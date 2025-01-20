@interface PRWordLanguageModel
+ (id)languageModelWithLocalization:(id)a3 appIdentifier:(id)a4 lexicon:(id)a5;
+ (void)performMaintenance;
+ (void)setLogLevel:(int64_t)a3;
- (BOOL)addTokenForString:(id)a3 tokenID:(unsigned int *)a4;
- (BOOL)getConditionalProbabilityForTokenID:(unsigned int)a3 context:(const unsigned int *)a4 length:(unint64_t)a5 probability:(double *)a6;
- (BOOL)getFirstDynamicTokenID:(unsigned int *)a3 lastDynamicTokenID:(unsigned int *)a4;
- (BOOL)getUnigramProbabilityForString:(id)a3 probability:(double *)a4;
- (BOOL)shouldAdaptToTokenSequence:(const unsigned int *)a3 length:(unint64_t)a4;
- (BOOL)tokenSequenceIsBlocklisted:(const unsigned int *)a3 length:(unint64_t)a4;
- (PRWordLanguageModel)initWithLocalization:(id)a3 appIdentifier:(id)a4 lexicon:(id)a5;
- (float)usageCountForTokenID:(unsigned int)a3;
- (id)_descriptionForTokenSequence:(const unsigned int *)a3 length:(unint64_t)a4;
- (id)appIdentifier;
- (id)description;
- (id)localization;
- (id)stringForTokenID:(unsigned int)a3;
- (unsigned)tokenIDForString:(id)a3;
- (void)applyExponentialDecay;
- (void)dealloc;
- (void)enumerateCompletionEntriesForPrefix:(id)a3 maxCompletions:(unint64_t)a4 withBlock:(id)a5;
- (void)enumerateCompletionsForPrefix:(id)a3 maxCompletions:(unint64_t)a4 withBlock:(id)a5;
- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4;
- (void)enumeratePredictionsForContext:(const unsigned int *)a3 length:(unint64_t)a4 maxPredictions:(unint64_t)a5 maxTokensPerPrediction:(unint64_t)a6 withBlock:(id)a7;
- (void)flushDynamicData;
- (void)incrementUsageCountForTokenID:(unsigned int)a3 context:(const unsigned int *)a4 length:(unint64_t)a5;
- (void)pruneToSize:(unint64_t)a3;
- (void)recordWithDifferentialPrivacy:(id)a3;
- (void)reset;
@end

@implementation PRWordLanguageModel

- (PRWordLanguageModel)initWithLocalization:(id)a3 appIdentifier:(id)a4 lexicon:(id)a5
{
  v9 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:a3];
  v10 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v11 = [NSNumber numberWithInteger:2];
  v12 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x263F13EF0], v9, *MEMORY[0x263F13F00], 0);
  v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x263F13EE0], 0);
  if (_kSuppressAdaptation)
  {
    uint64_t v14 = [NSNumber numberWithBool:0];
    uint64_t v15 = *MEMORY[0x263F13ED8];
    [v12 setObject:v14 forKey:*MEMORY[0x263F13ED8]];
    objc_msgSend(v13, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 0), v15);
  }
  v16 = (void *)[MEMORY[0x263F14010] languageModelWithOptions:v12 error:0];
  v17 = (void *)[v16 sessionWithOptions:v13];
  v18 = (void *)[v16 tokenIDConverter];
  v21.receiver = self;
  v21.super_class = (Class)PRWordLanguageModel;
  v19 = [(PRWordLanguageModel *)&v21 init];
  if (v19)
  {
    v19->_localization = (NSString *)[a3 copy];
    v19->_appIdentifier = (NSString *)[a4 copy];
    v19->_model = (NLLanguageModel *)v16;
    v19->_session = (NLLMLanguageModelSession *)v17;
    v19->_converter = (NLTokenIDConverter *)v18;
    v19->_lexicon = (PRLexicon *)a5;
  }

  return v19;
}

+ (id)languageModelWithLocalization:(id)a3 appIdentifier:(id)a4 lexicon:(id)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithLocalization:a3 appIdentifier:a4 lexicon:a5];
  return v5;
}

+ (void)performMaintenance
{
}

+ (void)setLogLevel:(int64_t)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRWordLanguageModel;
  [(PRWordLanguageModel *)&v3 dealloc];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PRWordLanguageModel;
  objc_super v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"%@(%@"), -[PRWordLanguageModel description](&v6, sel_description), self->_localization;
  v4 = v3;
  if (self->_appIdentifier) {
    [v3 appendFormat:@":%@", self->_appIdentifier];
  }
  if (self->_session) {
    [v4 appendFormat:@":%@", self->_session];
  }
  if (self->_lexicon) {
    [v4 appendFormat:@"+%@", self->_lexicon];
  }
  [v4 appendString:@""]);
  return v4;
}

- (id)localization
{
  return self->_localization;
}

- (id)appIdentifier
{
  return self->_appIdentifier;
}

- (unsigned)tokenIDForString:(id)a3
{
  return [(NLTokenIDConverter *)self->_converter tokenIDForString:a3];
}

- (id)stringForTokenID:(unsigned int)a3
{
  if (a3 < 0x1F4) {
    return 0;
  }
  else {
    return (id)-[NLTokenIDConverter stringForTokenID:](self->_converter, "stringForTokenID:");
  }
}

- (BOOL)getConditionalProbabilityForTokenID:(unsigned int)a3 context:(const unsigned int *)a4 length:(unint64_t)a5 probability:(double *)a6
{
  v7 = (void *)[(NLLMLanguageModelSession *)self->_session conditionalProbabilityForTokenID:*(void *)&a3 contextTokenIDs:a4 length:a5];
  if (v7)
  {
    v8 = v7;
    LODWORD(v7) = [v7 isValid];
    if (v7)
    {
      [v8 log10Probability];
      if (a6) {
        *(void *)a6 = v9;
      }
      LOBYTE(v7) = 1;
    }
  }
  return (char)v7;
}

- (BOOL)getUnigramProbabilityForString:(id)a3 probability:(double *)a4
{
  return [(PRLexicon *)self->_lexicon getProbabilityForString:a3 probability:a4];
}

- (float)usageCountForTokenID:(unsigned int)a3
{
  [(NLLMLanguageModelSession *)self->_session usageCountForTokenID:*(void *)&a3];
  return result;
}

- (id)_descriptionForTokenSequence:(const unsigned int *)a3 length:(unint64_t)a4
{
  v7 = (void *)[MEMORY[0x263F089D8] string];
  if (a4)
  {
    uint64_t v8 = 0;
    do
    {
      if (v8) {
        [v7 appendString:@" "];
      }
      [v7 appendFormat:@"%u <%@>", a3[v8], -[PRWordLanguageModel stringForTokenID:](self, "stringForTokenID:", a3[v8])];
      ++v8;
    }
    while (a4 != v8);
  }
  return v7;
}

- (BOOL)tokenSequenceIsBlocklisted:(const unsigned int *)a3 length:(unint64_t)a4
{
  return [(NLLMLanguageModelSession *)self->_session blocklistStatusForTokenIDs:a3 length:a4 matchType:2] != 0;
}

- (void)enumerateCompletionsForPrefix:(id)a3 maxCompletions:(unint64_t)a4 withBlock:(id)a5
{
}

- (void)enumerateCompletionEntriesForPrefix:(id)a3 maxCompletions:(unint64_t)a4 withBlock:(id)a5
{
}

- (void)enumeratePredictionsForContext:(const unsigned int *)a3 length:(unint64_t)a4 maxPredictions:(unint64_t)a5 maxTokensPerPrediction:(unint64_t)a6 withBlock:(id)a7
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  session = self->_session;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __109__PRWordLanguageModel_enumeratePredictionsForContext_length_maxPredictions_maxTokensPerPrediction_withBlock___block_invoke;
  v8[3] = &unk_2640EF728;
  v8[5] = v9;
  v8[6] = a5;
  v8[4] = a7;
  [(NLLMLanguageModelSession *)session enumeratePredictionsForContextTokenIDs:a3 length:a4 maximumPredictions:a5 maximumTokensPerPrediction:a6 withBlock:v8];
  _Block_object_dispose(v9, 8);
}

void *__109__PRWordLanguageModel_enumeratePredictionsForContext_length_maxPredictions_maxTokensPerPrediction_withBlock___block_invoke(void *result, void *a2, unsigned char *a3)
{
  v4 = result;
  unsigned __int8 v12 = 0;
  uint64_t v5 = *(void *)(result[5] + 8);
  unint64_t v6 = *(void *)(v5 + 24);
  if (v6 >= result[6])
  {
    *(void *)(v5 + 24) = v6 + 1;
    goto LABEL_5;
  }
  uint64_t v8 = result[4];
  uint64_t v9 = [a2 tokenIDs];
  uint64_t v10 = [a2 tokenIDLength];
  objc_msgSend((id)objc_msgSend(a2, "probabilityInfo"), "log10Probability");
  float result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(v8 + 16))(v8, v9, v10, &v12);
  int v11 = v12;
  ++*(void *)(*(void *)(v4[5] + 8) + 24);
  if (!v11)
  {
LABEL_5:
    if (*(void *)(*(void *)(v4[5] + 8) + 24) < v4[6]) {
      return result;
    }
  }
  *a3 = 1;
  return result;
}

- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4
{
  lexicon = self->_lexicon;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__PRWordLanguageModel_enumerateEntriesForString_withBlock___block_invoke;
  v5[3] = &unk_2640EF4D8;
  v5[4] = a4;
  [(PRLexicon *)lexicon enumerateEntriesForString:a3 usingBlock:v5];
}

uint64_t __59__PRWordLanguageModel_enumerateEntriesForString_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7) {
    *a5 = 1;
  }
  return result;
}

- (BOOL)addTokenForString:(id)a3 tokenID:(unsigned int *)a4
{
  return [(NLLMLanguageModelSession *)self->_session addTokenForString:a3 tokenID:a4];
}

- (BOOL)getFirstDynamicTokenID:(unsigned int *)a3 lastDynamicTokenID:(unsigned int *)a4
{
  return [(NLLMLanguageModelSession *)self->_session getFirstDynamicTokenID:a3 lastDynamicTokenID:a4];
}

- (BOOL)shouldAdaptToTokenSequence:(const unsigned int *)a3 length:(unint64_t)a4
{
  return [(NLLMLanguageModelSession *)self->_session shouldAdaptToTokenIDs:a3 length:a4];
}

- (void)incrementUsageCountForTokenID:(unsigned int)a3 context:(const unsigned int *)a4 length:(unint64_t)a5
{
}

- (void)recordWithDifferentialPrivacy:(id)a3
{
}

- (void)reset
{
}

- (void)flushDynamicData
{
}

- (void)applyExponentialDecay
{
}

- (void)pruneToSize:(unint64_t)a3
{
}

@end