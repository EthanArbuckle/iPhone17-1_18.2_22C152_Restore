@interface REMLSentimentAnalyzerResult
- (float)certainty;
- (float)negativeSentiment;
- (float)postivieSentiment;
- (void)setCertainty:(float)a3;
- (void)setNegativeSentiment:(float)a3;
- (void)setPostivieSentiment:(float)a3;
@end

@implementation REMLSentimentAnalyzerResult

- (float)postivieSentiment
{
  return self->_postivieSentiment;
}

- (void)setPostivieSentiment:(float)a3
{
  self->_postivieSentiment = a3;
}

- (float)negativeSentiment
{
  return self->_negativeSentiment;
}

- (void)setNegativeSentiment:(float)a3
{
  self->_negativeSentiment = a3;
}

- (float)certainty
{
  return self->_certainty;
}

- (void)setCertainty:(float)a3
{
  self->_certainty = a3;
}

@end