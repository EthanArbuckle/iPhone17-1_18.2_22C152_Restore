@interface WBSPasswordEvaluator
+ (BOOL)passwordLooksLikeDigitOnlyPasscode:(id)a3;
+ (id)standardPasswordEvaluator;
- (id)_initWithPasswordWordListCollection:(id)a3 passcodeWordListCollection:(id)a4;
- (id)evaluatePassword:(id)a3;
@end

@implementation WBSPasswordEvaluator

- (id)_initWithPasswordWordListCollection:(id)a3 passcodeWordListCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSPasswordEvaluator;
  v9 = [(WBSPasswordEvaluator *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passwordWordListCollection, a3);
    objc_storeStrong((id *)&v10->_passcodeWordListCollection, a4);
    v11 = objc_alloc_init(WBSPasswordPatternMatcher);
    patternMatcher = v10->_patternMatcher;
    v10->_patternMatcher = v11;

    v13 = v10;
  }

  return v10;
}

- (id)evaluatePassword:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)([v4 length] - 32) > 0xFFFFFFFFFFFFFFE0)
  {
    id v7 = (void *)MEMORY[0x1BA9BCF20]();
    int v8 = [(id)objc_opt_class() passwordLooksLikeDigitOnlyPasscode:v4];
    patternMatcher = self->_patternMatcher;
    if (v8)
    {
      v10 = [(WBSPasswordPatternMatcher *)patternMatcher patternMatchesForPasscode:v4 withWordListCollection:self->_passcodeWordListCollection];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (!v11) {
        goto LABEL_15;
      }
      uint64_t v12 = v11;
      v13 = 0;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (v13)
          {
            [*(id *)(*((void *)&v24 + 1) + 8 * i) guessesRequired];
            double v18 = v17;
            [(WBSPasswordPatternMatchSolver *)v13 guessesRequired];
            if (v18 >= v19) {
              continue;
            }
          }
          v20 = v16;

          v13 = v20;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v12);
      if (!v13) {
LABEL_15:
      }
        v13 = -[WBSPasswordPatternMatch initExhaustiveSearchPatternWithMatchedSubstring:range:]([WBSPasswordPatternMatch alloc], "initExhaustiveSearchPatternWithMatchedSubstring:range:", v4, 0, [v4 length]);
      v21 = [WBSPasswordEvaluation alloc];
      v28 = v13;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      [(WBSPasswordPatternMatchSolver *)v13 guessesRequired];
      v6 = -[WBSPasswordEvaluation initWithEvaluationType:password:patternMatches:guessesRequired:](v21, "initWithEvaluationType:password:patternMatches:guessesRequired:", 1, v4, v22);
    }
    else
    {
      v10 = [(WBSPasswordPatternMatcher *)patternMatcher patternMatchesForPassword:v4 withWordListCollection:self->_passwordWordListCollection];
      v13 = [[WBSPasswordPatternMatchSolver alloc] initWithPassword:v4 patternMatches:v10];
      v6 = [(WBSPasswordPatternMatchSolver *)v13 optimalEvaluation];
    }
  }
  else
  {
    v5 = [WBSPasswordEvaluation alloc];
    v6 = [(WBSPasswordEvaluation *)v5 initWithEvaluationType:2 password:v4 patternMatches:MEMORY[0x1E4F1CBF0] guessesRequired:0.0];
  }

  return v6;
}

+ (BOOL)passwordLooksLikeDigitOnlyPasscode:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 4)
  {
    unint64_t v5 = v4;
    v6 = objc_msgSend(MEMORY[0x1E4F28B88], "safari_asciiDigitCharacterSet");
    if (objc_msgSend(v6, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", 0)))
    {
      uint64_t v7 = 1;
      do
      {
        unint64_t v8 = v7;
        if (v5 == v7) {
          break;
        }
        char v9 = objc_msgSend(v6, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v7));
        uint64_t v7 = v8 + 1;
      }
      while ((v9 & 1) != 0);
      BOOL v10 = v8 >= v5;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)standardPasswordEvaluator
{
  id v2 = objc_alloc((Class)a1);
  id v3 = +[WBSPasswordWordListCollection commonPasswordWordListCollection];
  uint64_t v4 = +[WBSPasswordWordListCollection commonPasscodeWordListCollection];
  unint64_t v5 = (void *)[v2 _initWithPasswordWordListCollection:v3 passcodeWordListCollection:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternMatcher, 0);
  objc_storeStrong((id *)&self->_passcodeWordListCollection, 0);
  objc_storeStrong((id *)&self->_passwordWordListCollection, 0);
}

@end