@interface SBSceneReadySwitcherModifierEvent
- (SBAppLayout)appLayout;
- (SBSceneReadySwitcherModifierEvent)initWithAppLayout:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBSceneReadySwitcherModifierEvent

- (int64_t)type
{
  return 24;
}

- (void).cxx_destruct
{
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSceneReadySwitcherModifierEvent;
  v4 = [(SBSwitcherModifierEvent *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendObject:self->_appLayout withName:@"appLayout"];
  return v4;
}

- (SBSceneReadySwitcherModifierEvent)initWithAppLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneReadySwitcherModifierEvent;
  v6 = [(SBSceneReadySwitcherModifierEvent *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appLayout, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SBSceneReadySwitcherModifierEvent alloc];
  appLayout = self->_appLayout;
  return [(SBSceneReadySwitcherModifierEvent *)v4 initWithAppLayout:appLayout];
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

@end