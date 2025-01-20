@interface RDVAVisionKWSSpotterDelegateImpl
- (RDVAVisionKWSSpotterDelegateImpl)initWithDelegate:(RDKeywordSpotterDelegate *)a3;
- (void)didDetectKeywordWithKeyword:(id)a3 score:(float)a4 silenceAfter:(BOOL)a5 silenceBefore:(BOOL)a6 speechDuring:(BOOL)a7;
@end

@implementation RDVAVisionKWSSpotterDelegateImpl

- (RDVAVisionKWSSpotterDelegateImpl)initWithDelegate:(RDKeywordSpotterDelegate *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RDVAVisionKWSSpotterDelegateImpl;
  result = [(RDVAVisionKWSSpotterDelegateImpl *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->ctx;
    result->_keywordSpotterDelegate.KeywordSpotterDidStop = a3->KeywordSpotterDidStop;
    *(_OWORD *)&result->_keywordSpotterDelegate.ctx = v5;
  }
  return result;
}

- (void)didDetectKeywordWithKeyword:(id)a3 score:(float)a4 silenceAfter:(BOOL)a5 silenceBefore:(BOOL)a6 speechDuring:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v11 = a3;
  if (v8 && v7)
  {
    id v12 = v11;
    ((void (*)(void *, id, double))self->_keywordSpotterDelegate.KeywordSpotted)(self->_keywordSpotterDelegate.ctx, v11, a4);
    id v11 = v12;
  }
}

@end