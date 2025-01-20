@interface SBPreemptAnimationSwitcherEventResponse
- (SBPreemptAnimationSwitcherEventResponse)initWithOptions:(unint64_t)a3;
- (int64_t)type;
- (unint64_t)options;
@end

@implementation SBPreemptAnimationSwitcherEventResponse

- (SBPreemptAnimationSwitcherEventResponse)initWithOptions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBPreemptAnimationSwitcherEventResponse;
  result = [(SBChainableModifierEventResponse *)&v5 init];
  if (result) {
    result->_options = a3;
  }
  return result;
}

- (int64_t)type
{
  return 24;
}

- (unint64_t)options
{
  return self->_options;
}

@end