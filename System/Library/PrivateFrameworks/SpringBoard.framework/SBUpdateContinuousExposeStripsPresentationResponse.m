@interface SBUpdateContinuousExposeStripsPresentationResponse
- (SBUpdateContinuousExposeStripsPresentationResponse)initWithPresentationOptions:(unint64_t)a3 dismissalOptions:(unint64_t)a4;
- (int64_t)type;
- (unint64_t)dismissalOptions;
- (unint64_t)presentationOptions;
@end

@implementation SBUpdateContinuousExposeStripsPresentationResponse

- (SBUpdateContinuousExposeStripsPresentationResponse)initWithPresentationOptions:(unint64_t)a3 dismissalOptions:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBUpdateContinuousExposeStripsPresentationResponse;
  result = [(SBChainableModifierEventResponse *)&v7 init];
  if (result)
  {
    result->_presentationOptions = a3;
    result->_dismissalOptions = a4;
  }
  return result;
}

- (int64_t)type
{
  return 33;
}

- (unint64_t)presentationOptions
{
  return self->_presentationOptions;
}

- (unint64_t)dismissalOptions
{
  return self->_dismissalOptions;
}

@end