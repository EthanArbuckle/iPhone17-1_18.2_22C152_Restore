@interface NLPLearnerEvaluationResultCoreLM
- (float)logfProbability;
- (float)predictedWords;
- (unint64_t)sentenceCount;
- (unint64_t)tokenCount;
- (unint64_t)wordCount;
- (void)setLogfProbability:(float)a3;
- (void)setPredictedWords:(float)a3;
- (void)setSentenceCount:(unint64_t)a3;
- (void)setTokenCount:(unint64_t)a3;
- (void)setWordCount:(unint64_t)a3;
@end

@implementation NLPLearnerEvaluationResultCoreLM

- (float)logfProbability
{
  return self->_logfProbability;
}

- (void)setLogfProbability:(float)a3
{
  self->_logfProbability = a3;
}

- (float)predictedWords
{
  return self->_predictedWords;
}

- (void)setPredictedWords:(float)a3
{
  self->_predictedWords = a3;
}

- (unint64_t)wordCount
{
  return self->_wordCount;
}

- (void)setWordCount:(unint64_t)a3
{
  self->_wordCount = a3;
}

- (unint64_t)tokenCount
{
  return self->_tokenCount;
}

- (void)setTokenCount:(unint64_t)a3
{
  self->_tokenCount = a3;
}

- (unint64_t)sentenceCount
{
  return self->_sentenceCount;
}

- (void)setSentenceCount:(unint64_t)a3
{
  self->_sentenceCount = a3;
}

@end