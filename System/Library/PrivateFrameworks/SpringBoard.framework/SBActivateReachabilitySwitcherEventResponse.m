@interface SBActivateReachabilitySwitcherEventResponse
- (SBActivateReachabilitySwitcherEventResponse)initWithReachabilityContext:(SBReachabilityActivationContext *)a3;
- (SBReachabilityActivationContext)reachabilityActivationContext;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBActivateReachabilitySwitcherEventResponse

- (int64_t)type
{
  return 4;
}

- (SBActivateReachabilitySwitcherEventResponse)initWithReachabilityContext:(SBReachabilityActivationContext *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBActivateReachabilitySwitcherEventResponse;
  result = [(SBChainableModifierEventResponse *)&v9 init];
  if (result)
  {
    CGPoint translation = a3->translation;
    result->_reachabilityActivationContext.location = a3->location;
    result->_reachabilityActivationContext.CGPoint translation = translation;
    CGPoint origin = a3->viewBounds.origin;
    CGSize size = a3->viewBounds.size;
    CGPoint velocity = a3->velocity;
    *(void *)&result->_reachabilityActivationContext.beganInSafeArea = *(void *)&a3->beganInSafeArea;
    result->_reachabilityActivationContext.viewBounds.CGPoint origin = origin;
    result->_reachabilityActivationContext.viewBounds.CGSize size = size;
    result->_reachabilityActivationContext.CGPoint velocity = velocity;
  }
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBActivateReachabilitySwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v11 descriptionBuilderWithMultilinePrefix:a3];
  CGPoint origin = self->_reachabilityActivationContext.viewBounds.origin;
  v9[2] = self->_reachabilityActivationContext.velocity;
  v9[3] = origin;
  v9[4] = self->_reachabilityActivationContext.viewBounds.size;
  uint64_t v10 = *(void *)&self->_reachabilityActivationContext.beganInSafeArea;
  CGPoint translation = self->_reachabilityActivationContext.translation;
  v9[0] = self->_reachabilityActivationContext.location;
  v9[1] = translation;
  v7 = NSStringFromSBReachabilityActivationContext((uint64_t)v9);
  [v4 appendString:v7 withName:@"context"];

  return v4;
}

- (SBReachabilityActivationContext)reachabilityActivationContext
{
  CGPoint location = self[1].location;
  retstr->CGPoint velocity = *(CGPoint *)&self->viewBounds.size.height;
  retstr->viewBounds.CGPoint origin = location;
  retstr->viewBounds.CGSize size = (CGSize)self[1].translation;
  *(CGFloat *)&retstr->beganInSafeArea = self[1].velocity.x;
  CGPoint v4 = *(CGPoint *)&self->viewBounds.origin.y;
  retstr->CGPoint location = *(CGPoint *)&self->velocity.y;
  retstr->CGPoint translation = v4;
  return self;
}

@end