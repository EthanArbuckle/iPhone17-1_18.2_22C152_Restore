@interface SBUpdateFocusedAppLayoutSwitcherModifierEvent
- (BOOL)isFocused;
- (SBAppLayout)appLayout;
- (SBUpdateFocusedAppLayoutSwitcherModifierEvent)initWithAppLayout:(id)a3 focused:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBUpdateFocusedAppLayoutSwitcherModifierEvent

- (SBUpdateFocusedAppLayoutSwitcherModifierEvent)initWithAppLayout:(id)a3 focused:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBUpdateFocusedAppLayoutSwitcherModifierEvent;
  v8 = [(SBUpdateFocusedAppLayoutSwitcherModifierEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appLayout, a3);
    v9->_focused = a4;
  }

  return v9;
}

- (int64_t)type
{
  return 20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBUpdateFocusedAppLayoutSwitcherModifierEvent;
  v4 = [(SBChainableModifierEvent *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SBUpdateFocusedAppLayoutSwitcherModifierEvent *)self appLayout];
  v6 = (void *)v4[4];
  v4[4] = v5;

  *((unsigned char *)v4 + 24) = [(SBUpdateFocusedAppLayoutSwitcherModifierEvent *)self isFocused];
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBUpdateFocusedAppLayoutSwitcherModifierEvent;
  v4 = [(SBSwitcherModifierEvent *)&v8 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendObject:self->_appLayout withName:@"appLayout"];
  id v6 = (id)[v4 appendBool:self->_focused withName:@"focused"];
  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (void).cxx_destruct
{
}

@end