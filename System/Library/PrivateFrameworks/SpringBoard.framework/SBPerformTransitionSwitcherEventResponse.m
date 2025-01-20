@interface SBPerformTransitionSwitcherEventResponse
- (BOOL)isGestureInitiated;
- (SBPerformTransitionSwitcherEventResponse)initWithTransitionRequest:(id)a3 gestureInitiated:(BOOL)a4;
- (SBSwitcherTransitionRequest)transitionRequest;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBPerformTransitionSwitcherEventResponse

- (int64_t)type
{
  return 1;
}

- (SBPerformTransitionSwitcherEventResponse)initWithTransitionRequest:(id)a3 gestureInitiated:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPerformTransitionSwitcherEventResponse;
  v8 = [(SBChainableModifierEventResponse *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transitionRequest, a3);
    v9->_gestureInitiated = a4;
  }

  return v9;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBPerformTransitionSwitcherEventResponse;
  id v4 = a3;
  v5 = [(SBChainableModifierEventResponse *)&v10 descriptionBuilderWithMultilinePrefix:v4];
  id v6 = (id)objc_msgSend(v5, "appendBool:withName:", self->_gestureInitiated, @"gestureInitiated", v10.receiver, v10.super_class);
  id v7 = [(SBSwitcherTransitionRequest *)self->_transitionRequest descriptionWithMultilinePrefix:v4];

  id v8 = (id)[v5 appendObject:v7 withName:@"request"];
  return v5;
}

- (SBSwitcherTransitionRequest)transitionRequest
{
  return self->_transitionRequest;
}

- (BOOL)isGestureInitiated
{
  return self->_gestureInitiated;
}

- (void).cxx_destruct
{
}

@end