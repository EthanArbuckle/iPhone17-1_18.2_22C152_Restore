@interface WBSPasswordPatternPartialSolution
- (WBSPasswordPatternMatch)patternMatch;
- (WBSPasswordPatternPartialSolution)initWithPatternMatch:(id)a3 guessesRequiredWithoutPatternCountPenalty:(double)a4 withPatternCountPenalty:(double)a5;
- (double)guessesRequiredWithPatternCountPenalty;
- (double)guessesRequiredWithoutPatternCountPenalty;
@end

@implementation WBSPasswordPatternPartialSolution

- (WBSPasswordPatternPartialSolution)initWithPatternMatch:(id)a3 guessesRequiredWithoutPatternCountPenalty:(double)a4 withPatternCountPenalty:(double)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSPasswordPatternPartialSolution;
  v10 = [(WBSPasswordPatternPartialSolution *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_patternMatch, a3);
    v11->_guessesRequiredWithoutPatternCountPenalty = a4;
    v11->_guessesRequiredWithPatternCountPenalty = a5;
    v12 = v11;
  }

  return v11;
}

- (WBSPasswordPatternMatch)patternMatch
{
  return self->_patternMatch;
}

- (double)guessesRequiredWithoutPatternCountPenalty
{
  return self->_guessesRequiredWithoutPatternCountPenalty;
}

- (double)guessesRequiredWithPatternCountPenalty
{
  return self->_guessesRequiredWithPatternCountPenalty;
}

- (void).cxx_destruct
{
}

@end