@interface SBMatchMoveToDropletSwitcherEventResponse
- (BOOL)isActive;
- (SBAppLayout)appLayout;
- (SBMatchMoveToDropletSwitcherEventResponse)initWithAppLayout:(id)a3 active:(BOOL)a4;
- (int64_t)type;
@end

@implementation SBMatchMoveToDropletSwitcherEventResponse

- (SBMatchMoveToDropletSwitcherEventResponse)initWithAppLayout:(id)a3 active:(BOOL)a4
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBMatchMoveToDropletSwitcherEventResponse;
  v9 = [(SBChainableModifierEventResponse *)&v12 init];
  if (v9)
  {
    if (!v8)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"SBMatchMoveToDropletSwitcherEventResponse.m", 18, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_appLayout, a3);
    v9->_active = a4;
  }

  return v9;
}

- (int64_t)type
{
  return 44;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
}

@end