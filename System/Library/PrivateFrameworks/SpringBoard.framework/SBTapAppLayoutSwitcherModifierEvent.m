@interface SBTapAppLayoutSwitcherModifierEvent
- (SBAppLayout)appLayout;
- (SBTapAppLayoutSwitcherModifierEvent)initWithAppLayout:(id)a3 layoutRole:(int64_t)a4 modifierFlags:(int64_t)a5;
- (SBTapAppLayoutSwitcherModifierEvent)initWithAppLayout:(id)a3 layoutRole:(int64_t)a4 modifierFlags:(int64_t)a5 source:(int64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)layoutRole;
- (int64_t)modifierFlags;
- (int64_t)source;
- (int64_t)type;
@end

@implementation SBTapAppLayoutSwitcherModifierEvent

- (SBTapAppLayoutSwitcherModifierEvent)initWithAppLayout:(id)a3 layoutRole:(int64_t)a4 modifierFlags:(int64_t)a5
{
  return [(SBTapAppLayoutSwitcherModifierEvent *)self initWithAppLayout:a3 layoutRole:a4 modifierFlags:a5 source:0];
}

- (SBTapAppLayoutSwitcherModifierEvent)initWithAppLayout:(id)a3 layoutRole:(int64_t)a4 modifierFlags:(int64_t)a5 source:(int64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBTapAppLayoutSwitcherModifierEvent;
  v12 = [(SBTapAppLayoutSwitcherModifierEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appLayout, a3);
    v13->_layoutRole = a4;
    v13->_modifierFlags = a5;
    v13->_source = a6;
  }

  return v13;
}

- (int64_t)type
{
  return 17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBTapAppLayoutSwitcherModifierEvent;
  v4 = [(SBChainableModifierEvent *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SBAppLayout *)self->_appLayout copy];
  v6 = (void *)v4[3];
  v4[3] = v5;

  v4[4] = self->_layoutRole;
  v4[5] = self->_modifierFlags;
  v4[6] = self->_source;
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBTapAppLayoutSwitcherModifierEvent;
  v4 = [(SBSwitcherModifierEvent *)&v11 descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v5 = [(SBAppLayout *)self->_appLayout succinctDescription];
  id v6 = (id)[v4 appendObject:v5 withName:@"appLayout"];

  v7 = SBLayoutRoleDescription(self->_layoutRole);
  [v4 appendString:v7 withName:@"layoutRole"];

  id v8 = (id)[v4 appendInteger:self->_modifierFlags withName:@"modifierFlags"];
  id v9 = (id)[v4 appendInteger:self->_source withName:@"source"];
  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
}

@end