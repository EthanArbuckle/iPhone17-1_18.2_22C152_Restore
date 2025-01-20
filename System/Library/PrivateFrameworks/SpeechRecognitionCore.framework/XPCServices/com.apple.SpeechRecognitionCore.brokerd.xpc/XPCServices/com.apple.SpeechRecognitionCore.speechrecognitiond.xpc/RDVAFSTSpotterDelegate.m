@interface RDVAFSTSpotterDelegate
- (RDVAFSTSpotterDelegate)initWithDelegate:(RDKeywordSpotterDelegate *)a3;
- (int)maxFrameSizeForKeywords;
- (void)keywordSpotted:(id)a3 cost:(double)a4 start:(int)a5 end:(int)a6;
- (void)keywordSpotterDidStop;
- (void)setMaxFrameSizeForKeywords:(int)a3;
@end

@implementation RDVAFSTSpotterDelegate

- (RDVAFSTSpotterDelegate)initWithDelegate:(RDKeywordSpotterDelegate *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RDVAFSTSpotterDelegate;
  result = [(RDVAFSTSpotterDelegate *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->ctx;
    result->_keywordSpotterDelegate.KeywordSpotterDidStop = a3->KeywordSpotterDidStop;
    *(_OWORD *)&result->_keywordSpotterDelegate.ctx = v5;
  }
  return result;
}

- (void)keywordSpotted:(id)a3 cost:(double)a4 start:(int)a5 end:(int)a6
{
  id v10 = a3;
  if (a6 - a5 <= [(RDVAFSTSpotterDelegate *)self maxFrameSizeForKeywords]) {
    ((void (*)(void *, id, double))self->_keywordSpotterDelegate.KeywordSpotted)(self->_keywordSpotterDelegate.ctx, v10, a4);
  }
}

- (void)keywordSpotterDidStop
{
}

- (int)maxFrameSizeForKeywords
{
  return self->_maxFrameSizeForKeywords;
}

- (void)setMaxFrameSizeForKeywords:(int)a3
{
  self->_maxFrameSizeForKeywords = a3;
}

@end