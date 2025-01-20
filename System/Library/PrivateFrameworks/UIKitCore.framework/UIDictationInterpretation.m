@interface UIDictationInterpretation
+ (BOOL)supportsSecureCoding;
+ (id)serializedInterpretationFromTokens:(id)a3 transform:(__CFString *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeSpaceAfter;
- (BOOL)removeSpaceBefore;
- (NSArray)tokens;
- (UIDictationInterpretation)initWithCoder:(id)a3;
- (UIDictationInterpretation)initWithTokens:(id)a3;
- (UIDictationInterpretation)initWithTokens:(id)a3 score:(double)a4;
- (double)averageConfidenceScore;
- (id)description;
- (id)serializedInterpretationWithTransform:(__CFString *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAverageConfidenceScore:(double)a3;
@end

@implementation UIDictationInterpretation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationInterpretation)initWithTokens:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UIDictationInterpretation;
  v5 = [(UIDictationInterpretation *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v6;

    uint64_t v13 = 0;
    v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v8 = v5->_tokens;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__UIDictationInterpretation_initWithTokens___block_invoke;
    v12[3] = &unk_1E52FB5C8;
    v12[4] = &v13;
    [(NSArray *)v8 enumerateObjectsUsingBlock:v12];
    if ([v4 count])
    {
      double v9 = v14[3];
      v5->_averageConfidenceScore = v9 / (double)(unint64_t)[v4 count];
    }
    v10 = v5;
    _Block_object_dispose(&v13, 8);
  }

  return v5;
}

double __44__UIDictationInterpretation_initWithTokens___block_invoke(uint64_t a1, void *a2)
{
  [a2 confidenceScore];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

- (UIDictationInterpretation)initWithTokens:(id)a3 score:(double)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIDictationInterpretation;
  v7 = [(UIDictationInterpretation *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    tokens = v7->_tokens;
    v7->_tokens = (NSArray *)v8;

    v7->_averageConfidenceScore = a4;
    v10 = v7;
  }

  return v7;
}

- (UIDictationInterpretation)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIDictationInterpretation;
  v5 = [(UIDictationInterpretation *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"tokens"];
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v9;

    [v4 decodeDoubleForKey:@"averageConfidenceScore"];
    v5->_averageConfidenceScore = v11;
    objc_super v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  tokens = self->_tokens;
  id v5 = a3;
  [v5 encodeObject:tokens forKey:@"tokens"];
  [v5 encodeDouble:@"averageConfidenceScore" forKey:self->_averageConfidenceScore];
}

- (BOOL)removeSpaceBefore
{
  v2 = [(NSArray *)self->_tokens firstObject];
  char v3 = [v2 removeSpaceBefore];

  return v3;
}

- (BOOL)removeSpaceAfter
{
  v2 = [(NSArray *)self->_tokens lastObject];
  char v3 = [v2 removeSpaceAfter];

  return v3;
}

- (id)serializedInterpretationWithTransform:(__CFString *)a3
{
  id v5 = objc_opt_class();
  id v6 = [(UIDictationInterpretation *)self tokens];
  uint64_t v7 = [v5 serializedInterpretationFromTokens:v6 transform:a3];

  return v7;
}

+ (id)serializedInterpretationFromTokens:(id)a3 transform:(__CFString *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E78] string];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_super v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ((v9 & 1) != 0 && ([*(id *)(*((void *)&v21 + 1) + 8 * i) removeSpaceBefore] & 1) == 0) {
          [v5 appendString:@" "];
        }
        uint64_t v13 = [v12 text];
        uint64_t v14 = +[UIDictationUtilities _properNameForString:v13];
        uint64_t v15 = (void *)v14;
        if (v14) {
          uint64_t v16 = (void *)v14;
        }
        else {
          uint64_t v16 = v13;
        }
        id v17 = v16;

        [v17 length];
        [v5 appendString:v17];

        char v9 = [v12 removeSpaceAfter] ^ 1;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  v18 = [v5 _stringByApplyingTransform:a4];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    tokens = self->_tokens;
    id v6 = [v4 tokens];
    if ([(NSArray *)tokens isEqualToArray:v6])
    {
      double averageConfidenceScore = self->_averageConfidenceScore;
      [v4 averageConfidenceScore];
      BOOL v9 = vabdd_f64(averageConfidenceScore, v8) < 0.000000001;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  char v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(UIDictationInterpretation *)self serializedInterpretationWithTransform:0];
  uint64_t v7 = [(NSArray *)self->_tokens firstObject];
  if ([v7 removeSpaceBefore]) {
    double v8 = "YES";
  }
  else {
    double v8 = "NO";
  }
  BOOL v9 = [(NSArray *)self->_tokens lastObject];
  if ([v9 removeSpaceAfter]) {
    uint64_t v10 = "YES";
  }
  else {
    uint64_t v10 = "NO";
  }
  double v11 = [v3 stringWithFormat:@"<%@ \"%@\", removeSpaceBefore/After=%s/%s", v5, v6, v8, v10];

  return v11;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (double)averageConfidenceScore
{
  return self->_averageConfidenceScore;
}

- (void)setAverageConfidenceScore:(double)a3
{
  self->_double averageConfidenceScore = a3;
}

- (void).cxx_destruct
{
}

@end