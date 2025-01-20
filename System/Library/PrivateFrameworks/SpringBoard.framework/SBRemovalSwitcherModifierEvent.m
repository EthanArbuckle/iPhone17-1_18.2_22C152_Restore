@interface SBRemovalSwitcherModifierEvent
- (SBAppLayout)appLayout;
- (SBRemovalSwitcherModifierEvent)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 reason:(int64_t)a5 phase:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)layoutRole;
- (int64_t)reason;
- (int64_t)type;
- (unint64_t)phase;
@end

@implementation SBRemovalSwitcherModifierEvent

- (SBRemovalSwitcherModifierEvent)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 reason:(int64_t)a5 phase:(unint64_t)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBRemovalSwitcherModifierEvent;
  v12 = [(SBRemovalSwitcherModifierEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_layoutRole = a3;
    objc_storeStrong((id *)&v12->_appLayout, a4);
    v13->_reason = a5;
    v13->_phase = a6;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBRemovalSwitcherModifierEvent;
  v4 = [(SBChainableModifierEvent *)&v8 copyWithZone:a3];
  v4[3] = self->_layoutRole;
  uint64_t v5 = [(SBAppLayout *)self->_appLayout copy];
  v6 = (void *)v4[4];
  v4[4] = v5;

  v4[5] = self->_reason;
  v4[6] = self->_phase;
  return v4;
}

- (int64_t)type
{
  return 14;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBRemovalSwitcherModifierEvent;
  v4 = [(SBSwitcherModifierEvent *)&v13 descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v5 = v4;
  unint64_t v6 = self->_phase - 1;
  if (v6 > 2) {
    v7 = @"Possible";
  }
  else {
    v7 = off_1E6AF8E48[v6];
  }
  [v4 appendString:v7 withName:@"phase"];
  objc_super v8 = SBLayoutRoleDescription(self->_layoutRole);
  [v5 appendString:v8 withName:@"role"];

  v9 = [(SBAppLayout *)self->_appLayout succinctDescription];
  id v10 = (id)[v5 appendObject:v9 withName:@"appLayout"];

  id v11 = SBStringFromSwitcherMutationReason(self->_reason);
  [v5 appendString:v11 withName:@"reason"];

  return v5;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)reason
{
  return self->_reason;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void).cxx_destruct
{
}

@end