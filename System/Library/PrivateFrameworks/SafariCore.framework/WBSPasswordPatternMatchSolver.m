@interface WBSPasswordPatternMatchSolver
- (WBSPasswordPatternMatchSolver)initWithPassword:(id)a3 patternMatches:(id)a4;
- (id)_exhaustiveSearchPatternWithStartIndex:(unint64_t)a3 endIndex:(unint64_t)a4;
- (id)_partialSolutionWithEndIndex:(unint64_t)a3 patternCount:(unint64_t)a4;
- (id)_unwindSolution;
- (id)optimalEvaluation;
- (void)_enumeratePartialSolutionsWithEndIndex:(unint64_t)a3 usingBlock:(id)a4;
- (void)_setPartialSolution:(id)a3 withEndIndex:(unint64_t)a4 patternCount:(unint64_t)a5;
- (void)_updateExhaustiveSearchPartialSolutionsAtEndIndex:(unint64_t)a3;
- (void)_updatePartialSolutionsWithPatternMatch:(id)a3 patternCount:(unint64_t)a4;
@end

@implementation WBSPasswordPatternMatchSolver

- (WBSPasswordPatternMatchSolver)initWithPassword:(id)a3 patternMatches:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WBSPasswordPatternMatchSolver;
  v8 = [(WBSPasswordPatternMatchSolver *)&v23 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    password = v8->_password;
    v8->_password = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    patternMatches = v8->_patternMatches;
    v8->_patternMatches = (NSSet *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    partialSolutions = v8->_partialSolutions;
    v8->_partialSolutions = v13;

    uint64_t v15 = [v6 length];
    if (v15)
    {
      uint64_t v16 = v15;
      for (uint64_t i = 0; i != v16; ++i)
      {
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v19 = v8->_partialSolutions;
        v20 = [NSNumber numberWithUnsignedInteger:i];
        [(NSMutableDictionary *)v19 setObject:v18 forKeyedSubscript:v20];
      }
    }
    v21 = v8;
  }

  return v8;
}

- (id)_partialSolutionWithEndIndex:(unint64_t)a3 patternCount:(unint64_t)a4
{
  partialSolutions = self->_partialSolutions;
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  id v7 = [(NSMutableDictionary *)partialSolutions objectForKeyedSubscript:v6];
  v8 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  return v9;
}

- (void)_setPartialSolution:(id)a3 withEndIndex:(unint64_t)a4 patternCount:(unint64_t)a5
{
  partialSolutions = self->_partialSolutions;
  v8 = NSNumber;
  id v9 = a3;
  id v12 = [v8 numberWithUnsignedInteger:a4];
  v10 = [(NSMutableDictionary *)partialSolutions objectForKeyedSubscript:v12];
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a5];
  [v10 setObject:v9 forKeyedSubscript:v11];
}

- (void)_enumeratePartialSolutionsWithEndIndex:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, uint64_t, unsigned char *))a4;
  unsigned __int8 v21 = 0;
  partialSolutions = self->_partialSolutions;
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)partialSolutions objectForKeyedSubscript:v8];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = objc_msgSend(v9, "allKeys", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
      uint64_t v16 = [v9 objectForKeyedSubscript:v15];
      v6[2](v6, v16, [v15 unsignedLongValue], &v21);
      LODWORD(v15) = v21;

      if (v15) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_updatePartialSolutionsWithPatternMatch:(id)a3 patternCount:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 endIndex];
  [v6 guessesRequired];
  double v9 = v8;
  if (a4 > 1)
  {
    v10 = -[WBSPasswordPatternMatchSolver _partialSolutionWithEndIndex:patternCount:](self, "_partialSolutionWithEndIndex:patternCount:", [v6 range] - 1, a4 - 1);
    [v10 guessesRequiredWithoutPatternCountPenalty];
    double v9 = v9 * v11;
  }
  double v12 = factorial(a4);
  double v13 = pow(10000.0, (double)(a4 - 1)) + v9 * v12;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__WBSPasswordPatternMatchSolver__updatePartialSolutionsWithPatternMatch_patternCount___block_invoke;
  v15[3] = &unk_1E615C5C8;
  *(double *)&v15[6] = v13;
  v15[4] = &v16;
  v15[5] = a4;
  [(WBSPasswordPatternMatchSolver *)self _enumeratePartialSolutionsWithEndIndex:v7 usingBlock:v15];
  if (!*((unsigned char *)v17 + 24))
  {
    uint64_t v14 = [[WBSPasswordPatternPartialSolution alloc] initWithPatternMatch:v6 guessesRequiredWithoutPatternCountPenalty:v9 withPatternCountPenalty:v13];
    [(WBSPasswordPatternMatchSolver *)self _setPartialSolution:v14 withEndIndex:v7 patternCount:a4];
  }
  _Block_object_dispose(&v16, 8);
}

void __86__WBSPasswordPatternMatchSolver__updatePartialSolutionsWithPatternMatch_patternCount___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 40) >= a3)
  {
    id v9 = v7;
    [v7 guessesRequiredWithPatternCountPenalty];
    id v7 = v9;
    if (v8 <= *(double *)(a1 + 48))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (id)_unwindSolution
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(NSString *)self->_password length] - 1;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0x7FEFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__WBSPasswordPatternMatchSolver__unwindSolution__block_invoke;
  v8[3] = &unk_1E615C5F0;
  v8[4] = v9;
  v8[5] = &v10;
  [(WBSPasswordPatternMatchSolver *)self _enumeratePartialSolutionsWithEndIndex:v4 usingBlock:v8];
  while ((v4 & 0x8000000000000000) == 0)
  {
    v5 = [(WBSPasswordPatternMatchSolver *)self _partialSolutionWithEndIndex:v4 patternCount:v11[3]];
    id v6 = [v5 patternMatch];
    [v3 insertObject:v6 atIndex:0];
    uint64_t v4 = [v6 range] - 1;
    --v11[3];
  }
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

uint64_t __48__WBSPasswordPatternMatchSolver__unwindSolution__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 guessesRequiredWithPatternCountPenalty];
  if (v6 < *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  }
  return result;
}

- (void)_updateExhaustiveSearchPartialSolutionsAtEndIndex:(unint64_t)a3
{
  id v5 = [(WBSPasswordPatternMatchSolver *)self _exhaustiveSearchPatternWithStartIndex:0 endIndex:a3];
  [(WBSPasswordPatternMatchSolver *)self _updatePartialSolutionsWithPatternMatch:v5 patternCount:1];
  if (a3)
  {
    unint64_t v6 = 1;
    do
    {
      id v7 = [(WBSPasswordPatternMatchSolver *)self _exhaustiveSearchPatternWithStartIndex:v6 endIndex:a3];

      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __83__WBSPasswordPatternMatchSolver__updateExhaustiveSearchPartialSolutionsAtEndIndex___block_invoke;
      v8[3] = &unk_1E615C618;
      v8[4] = self;
      id v5 = v7;
      id v9 = v5;
      [(WBSPasswordPatternMatchSolver *)self _enumeratePartialSolutionsWithEndIndex:v6 - 1 usingBlock:v8];

      ++v6;
    }
    while (v6 <= a3);
  }
}

void __83__WBSPasswordPatternMatchSolver__updateExhaustiveSearchPartialSolutionsAtEndIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 patternMatch];
  uint64_t v6 = [v5 type];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    [v7 _updatePartialSolutionsWithPatternMatch:v8 patternCount:a3 + 1];
  }
}

- (id)_exhaustiveSearchPatternWithStartIndex:(unint64_t)a3 endIndex:(unint64_t)a4
{
  unint64_t v5 = a4 - a3 + 1;
  uint64_t v6 = -[NSString substringWithRange:](self->_password, "substringWithRange:");
  id v7 = -[WBSPasswordPatternMatch initExhaustiveSearchPatternWithMatchedSubstring:range:]([WBSPasswordPatternMatch alloc], "initExhaustiveSearchPatternWithMatchedSubstring:range:", v6, a3, v5);

  return v7;
}

- (id)optimalEvaluation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSString *)self->_password length];
  objc_msgSend(MEMORY[0x1E4F1C9E8], "safari_dictionaryWithObjectsInFastEnumerationCollection:groupedUsingBlock:", self->_patternMatches, &__block_literal_global_46);
  v21 = NSUInteger v19 = v3;
  if (v3)
  {
    uint64_t v4 = 0;
    do
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v4, v19);
      uint64_t v6 = [v21 objectForKeyedSubscript:v5];

      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v6);
            }
            double v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            uint64_t v12 = [v11 range];
            if (v12)
            {
              v22[0] = MEMORY[0x1E4F143A8];
              v22[1] = 3221225472;
              v22[2] = __50__WBSPasswordPatternMatchSolver_optimalEvaluation__block_invoke_2;
              v22[3] = &unk_1E615C618;
              v22[4] = self;
              v22[5] = v11;
              [(WBSPasswordPatternMatchSolver *)self _enumeratePartialSolutionsWithEndIndex:v12 - 1 usingBlock:v22];
            }
            else
            {
              [(WBSPasswordPatternMatchSolver *)self _updatePartialSolutionsWithPatternMatch:v11 patternCount:1];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v8);
      }

      [(WBSPasswordPatternMatchSolver *)self _updateExhaustiveSearchPartialSolutionsAtEndIndex:v4++];
    }
    while (v4 != v19);
  }
  uint64_t v13 = [(WBSPasswordPatternMatchSolver *)self _unwindSolution];
  uint64_t v14 = -[WBSPasswordPatternMatchSolver _partialSolutionWithEndIndex:patternCount:](self, "_partialSolutionWithEndIndex:patternCount:", v20 - 1, [v13 count]);
  [v14 guessesRequiredWithPatternCountPenalty];
  double v16 = v15;

  long long v17 = [[WBSPasswordEvaluation alloc] initWithEvaluationType:0 password:self->_password patternMatches:v13 guessesRequired:v16];
  return v17;
}

uint64_t __50__WBSPasswordPatternMatchSolver_optimalEvaluation__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 endIndex];
  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __50__WBSPasswordPatternMatchSolver_optimalEvaluation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updatePartialSolutionsWithPatternMatch:*(void *)(a1 + 40) patternCount:a3 + 1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialSolutions, 0);
  objc_storeStrong((id *)&self->_patternMatches, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end