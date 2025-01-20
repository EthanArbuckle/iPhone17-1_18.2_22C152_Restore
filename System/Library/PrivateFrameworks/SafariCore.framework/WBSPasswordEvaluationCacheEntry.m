@interface WBSPasswordEvaluationCacheEntry
+ (BOOL)supportsSecureCoding;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)versionNumber;
- (WBSPasswordEvaluationCacheEntry)initWithCoder:(id)a3;
- (WBSPasswordEvaluationCacheEntry)initWithDictionaryRepresentation:(id)a3;
- (WBSPasswordEvaluationCacheEntry)initWithPasswordEvaluation:(id)a3;
- (id)_initWithPasswordEvaluation:(id)a3 versionNumber:(id)a4;
- (id)passwordEvaluationWithPassword:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSPasswordEvaluationCacheEntry

- (id)_initWithPasswordEvaluation:(id)a3 versionNumber:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSPasswordEvaluationCacheEntry;
  v7 = [(WBSPasswordEvaluationCacheEntry *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_evaluation, a3);
    versionNumber = v8->_versionNumber;
    v8->_versionNumber = (NSNumber *)&unk_1F1086D98;

    v10 = v8;
  }

  return v8;
}

- (WBSPasswordEvaluationCacheEntry)initWithPasswordEvaluation:(id)a3
{
  return (WBSPasswordEvaluationCacheEntry *)[(WBSPasswordEvaluationCacheEntry *)self _initWithPasswordEvaluation:a3 versionNumber:&unk_1F1086D98];
}

- (WBSPasswordEvaluationCacheEntry)initWithDictionaryRepresentation:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"evaluation"];
  v5 = [[WBSPasswordEvaluation alloc] initWithDictionaryRepresentation:v4];
  if (v5)
  {
    id v6 = objc_msgSend(v4, "safari_numberForKey:", @"versionNumber");
    self = (WBSPasswordEvaluationCacheEntry *)[(WBSPasswordEvaluationCacheEntry *)self _initWithPasswordEvaluation:v5 versionNumber:v6];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)passwordEvaluationWithPassword:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v5 = [(WBSPasswordEvaluation *)self->_evaluation patternMatches];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __66__WBSPasswordEvaluationCacheEntry_passwordEvaluationWithPassword___block_invoke;
  v15 = &unk_1E615AE00;
  id v6 = v4;
  id v16 = v6;
  v17 = &v18;
  v7 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &v12);

  if (*((unsigned char *)v19 + 24))
  {
    v8 = 0;
  }
  else
  {
    v9 = [WBSPasswordEvaluation alloc];
    int64_t v10 = [(WBSPasswordEvaluation *)self->_evaluation evaluationType];
    [(WBSPasswordEvaluation *)self->_evaluation guessesRequired];
    v8 = -[WBSPasswordEvaluation initWithEvaluationType:password:patternMatches:guessesRequired:](v9, "initWithEvaluationType:password:patternMatches:guessesRequired:", v10, v6, v7);
  }

  _Block_object_dispose(&v18, 8);
  return v8;
}

WBSPasswordPatternMatch *__66__WBSPasswordEvaluationCacheEntry_passwordEvaluationWithPassword___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 range];
  if (v4 + v5 <= (unint64_t)[*(id *)(a1 + 32) length])
  {
    v7 = [WBSPasswordPatternMatch alloc];
    uint64_t v8 = [v3 type];
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v3 range];
    uint64_t v12 = objc_msgSend(v9, "substringWithRange:", v10, v11);
    uint64_t v13 = [v3 range];
    uint64_t v15 = v14;
    [v3 guessesRequired];
    double v17 = v16;
    uint64_t v18 = [v3 userInfo];
    id v6 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:](v7, "initWithType:matchedSubstring:range:guessesRequired:userInfo:", v8, v12, v13, v15, v18, v17);
  }
  else
  {
    id v6 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA60];
  id v3 = [(WBSPasswordEvaluation *)self->_evaluation dictionaryRepresentation];
  uint64_t v4 = [v2 dictionaryWithDictionary:v3];

  [v4 removeObjectForKey:@"password"];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"patternMatches"];
  id v6 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_11);
  [v4 setObject:v6 forKeyedSubscript:@"patternMatches"];
  v9[0] = @"evaluation";
  v9[1] = @"versionNumber";
  v10[0] = v4;
  v10[1] = &unk_1F1086D98;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return (NSDictionary *)v7;
}

id __59__WBSPasswordEvaluationCacheEntry_dictionaryRepresentation__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a2];
  [v2 removeObjectForKey:@"matchedSubstring"];
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSPasswordEvaluationCacheEntry *)self dictionaryRepresentation];
  [v4 encodeObject:v5];
}

- (WBSPasswordEvaluationCacheEntry)initWithCoder:(id)a3
{
  id v4 = [a3 decodeObject];
  id v5 = [(WBSPasswordEvaluationCacheEntry *)self initWithDictionaryRepresentation:v4];

  return v5;
}

- (NSNumber)versionNumber
{
  return self->_versionNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_evaluation, 0);
}

@end