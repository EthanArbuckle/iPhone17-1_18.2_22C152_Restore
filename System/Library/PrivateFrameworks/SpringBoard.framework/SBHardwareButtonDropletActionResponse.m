@interface SBHardwareButtonDropletActionResponse
- (SBAppLayout)appLayout;
- (SBHardwareButtonDropletActionResponse)initWithPreludeToken:(id)a3 zoomUpToken:(id)a4 appLayout:(id)a5 action:(unint64_t)a6;
- (SBHardwareButtonLaunchPreludeAnimationToken)preludeToken;
- (SBHardwareButtonLaunchZoomUpAnimationToken)zoomUpToken;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
- (unint64_t)action;
@end

@implementation SBHardwareButtonDropletActionResponse

- (int64_t)type
{
  return 42;
}

- (SBHardwareButtonDropletActionResponse)initWithPreludeToken:(id)a3 zoomUpToken:(id)a4 appLayout:(id)a5 action:(unint64_t)a6
{
  unint64_t v12 = (unint64_t)a3;
  unint64_t v13 = (unint64_t)a4;
  id v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBHardwareButtonDropletActionResponse;
  v15 = [(SBChainableModifierEventResponse *)&v20 init];
  if (v15)
  {
    if (a6 != 1)
    {
      if (!a6)
      {
        if (v12)
        {
          if (!v14)
          {
LABEL_6:
            v16 = [MEMORY[0x1E4F28B00] currentHandler];
            [v16 handleFailureInMethod:a2, v15, @"SBHardwareButtonDropletActionResponse.m", 35, @"Invalid parameter not satisfying: %@", @"appLayout != nil" object file lineNumber description];
LABEL_15:
          }
        }
        else
        {
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2, v15, @"SBHardwareButtonDropletActionResponse.m", 34, @"Invalid parameter not satisfying: %@", @"preludeToken != nil" object file lineNumber description];

          if (!v14) {
            goto LABEL_6;
          }
        }
      }
LABEL_9:
      v15->_action = a6;
      objc_storeStrong((id *)&v15->_preludeToken, a3);
      objc_storeStrong((id *)&v15->_zoomUpToken, a4);
      objc_storeStrong((id *)&v15->_appLayout, a5);
      goto LABEL_10;
    }
    if (v12 | v13)
    {
      if (v14) {
        goto LABEL_9;
      }
    }
    else
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v15, @"SBHardwareButtonDropletActionResponse.m", 39, @"Invalid parameter not satisfying: %@", @"zoomUpToken != nil || preludeToken != nil" object file lineNumber description];

      if (v14) {
        goto LABEL_9;
      }
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, v15, @"SBHardwareButtonDropletActionResponse.m", 40, @"Invalid parameter not satisfying: %@", @"appLayout != nil" object file lineNumber description];
    goto LABEL_15;
  }
LABEL_10:

  return v15;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBHardwareButtonDropletActionResponse;
  v4 = [(SBChainableModifierEventResponse *)&v10 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendObject:self->_preludeToken withName:@"preludeToken"];
  id v6 = (id)[v4 appendObject:self->_zoomUpToken withName:@"zoomUpToken"];
  id v7 = (id)[v4 appendObject:self->_appLayout withName:@"appLayout"];
  id v8 = (id)[v4 appendInteger:self->_action withName:@"action"];
  return v4;
}

- (SBHardwareButtonLaunchPreludeAnimationToken)preludeToken
{
  return self->_preludeToken;
}

- (SBHardwareButtonLaunchZoomUpAnimationToken)zoomUpToken
{
  return self->_zoomUpToken;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (unint64_t)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_zoomUpToken, 0);
  objc_storeStrong((id *)&self->_preludeToken, 0);
}

@end