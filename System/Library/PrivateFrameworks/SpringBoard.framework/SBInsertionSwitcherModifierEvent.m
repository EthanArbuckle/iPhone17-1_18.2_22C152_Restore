@interface SBInsertionSwitcherModifierEvent
- (SBAppLayout)appLayout;
- (SBInsertionSwitcherModifierEvent)initWithAppLayout:(id)a3 intoIndex:(unint64_t)a4 phase:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
- (unint64_t)index;
- (unint64_t)phase;
@end

@implementation SBInsertionSwitcherModifierEvent

- (SBInsertionSwitcherModifierEvent)initWithAppLayout:(id)a3 intoIndex:(unint64_t)a4 phase:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBInsertionSwitcherModifierEvent;
  v10 = [(SBInsertionSwitcherModifierEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_appLayout, a3);
    v11->_index = a4;
    v11->_phase = a5;
  }

  return v11;
}

- (int64_t)type
{
  return 13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBInsertionSwitcherModifierEvent;
  v4 = [(SBChainableModifierEvent *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SBAppLayout *)self->_appLayout copy];
  v6 = (void *)v4[3];
  v4[3] = v5;

  v4[4] = self->_index;
  v4[5] = self->_phase;
  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBInsertionSwitcherModifierEvent;
  v4 = [(SBSwitcherModifierEvent *)&v11 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendInteger:self->_index withName:@"intoIndex"];
  unint64_t v6 = self->_phase - 1;
  if (v6 > 3) {
    v7 = @"Possible";
  }
  else {
    v7 = off_1E6B025B8[v6];
  }
  [v4 appendString:v7 withName:@"phase"];
  objc_super v8 = [(SBAppLayout *)self->_appLayout succinctDescription];
  id v9 = (id)[v4 appendObject:v8 withName:@"appLayout"];

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (unint64_t)index
{
  return self->_index;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void).cxx_destruct
{
}

@end