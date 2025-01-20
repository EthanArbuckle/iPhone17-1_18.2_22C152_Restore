@interface SBConsumedPreludeAnimationTokenSwitcherEventResponse
- (SBConsumedPreludeAnimationTokenSwitcherEventResponse)initWithPreludeToken:(id)a3;
- (SBHardwareButtonLaunchPreludeAnimationToken)preludeToken;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBConsumedPreludeAnimationTokenSwitcherEventResponse

- (int64_t)type
{
  return 43;
}

- (SBConsumedPreludeAnimationTokenSwitcherEventResponse)initWithPreludeToken:(id)a3
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBConsumedPreludeAnimationTokenSwitcherEventResponse;
  v7 = [(SBChainableModifierEventResponse *)&v10 init];
  if (v7)
  {
    if (!v6)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"SBConsumedPreludeAnimationTokenSwitcherEventResponse.m", 29, @"Invalid parameter not satisfying: %@", @"preludeToken != nil" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_preludeToken, a3);
  }

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBConsumedPreludeAnimationTokenSwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendObject:self->_preludeToken withName:@"preludeToken"];
  return v4;
}

- (SBHardwareButtonLaunchPreludeAnimationToken)preludeToken
{
  return self->_preludeToken;
}

- (void).cxx_destruct
{
}

@end