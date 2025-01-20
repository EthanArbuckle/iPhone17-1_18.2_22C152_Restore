@interface TITraceLogCandidateWordSource
- (NSString)wordSource;
- (TITraceLogCandidateWordSource)initWithWordSource:(id)a3 probability:(double)a4 linguisticContextProbability:(double)a5;
- (double)linguisticContextProbability;
- (double)probability;
- (void)setLinguisticContextProbability:(double)a3;
- (void)setProbability:(double)a3;
- (void)setWordSource:(id)a3;
@end

@implementation TITraceLogCandidateWordSource

- (void).cxx_destruct
{
}

- (void)setLinguisticContextProbability:(double)a3
{
  self->_linguisticContextProbability = a3;
}

- (double)linguisticContextProbability
{
  return self->_linguisticContextProbability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setWordSource:(id)a3
{
}

- (NSString)wordSource
{
  return self->_wordSource;
}

- (TITraceLogCandidateWordSource)initWithWordSource:(id)a3 probability:(double)a4 linguisticContextProbability:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TITraceLogCandidateWordSource;
  v10 = [(TITraceLogCandidateWordSource *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_wordSource, a3);
    v11->_probability = a4;
    v11->_linguisticContextProbability = a5;
  }

  return v11;
}

@end