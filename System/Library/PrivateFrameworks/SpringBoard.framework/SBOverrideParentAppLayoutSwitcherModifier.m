@interface SBOverrideParentAppLayoutSwitcherModifier
- (SBAppLayout)childAppLayout;
- (SBAppLayout)parentAppLayout;
- (SBOverrideParentAppLayoutSwitcherModifier)initWithChildAppLayout:(id)a3 newParentAppLayout:(id)a4;
- (id)appLayoutContainingAppLayout:(id)a3;
- (id)appLayoutsContainedWithinAppLayout:(id)a3;
@end

@implementation SBOverrideParentAppLayoutSwitcherModifier

- (SBOverrideParentAppLayoutSwitcherModifier)initWithChildAppLayout:(id)a3 newParentAppLayout:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBOverrideParentAppLayoutSwitcherModifier;
  v10 = [(SBSwitcherModifier *)&v14 init];
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        objc_storeStrong((id *)&v10->_childAppLayout, a3);
        objc_storeStrong((id *)&v10->_parentAppLayout, a4);
        goto LABEL_5;
      }
    }
    else
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v10, @"SBOverrideParentAppLayoutSwitcherModifier.m", 16, @"Invalid parameter not satisfying: %@", @"childAppLayout" object file lineNumber description];

      if (v9) {
        goto LABEL_4;
      }
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, v10, @"SBOverrideParentAppLayoutSwitcherModifier.m", 17, @"Invalid parameter not satisfying: %@", @"parentAppLayout" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_childAppLayout])
  {
    v5 = self->_parentAppLayout;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBOverrideParentAppLayoutSwitcherModifier;
    v5 = [(SBOverrideParentAppLayoutSwitcherModifier *)&v8 appLayoutContainingAppLayout:v4];
  }
  v6 = v5;

  return v6;
}

- (id)appLayoutsContainedWithinAppLayout:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBOverrideParentAppLayoutSwitcherModifier;
  id v4 = a3;
  v5 = [(SBOverrideParentAppLayoutSwitcherModifier *)&v11 appLayoutsContainedWithinAppLayout:v4];
  int v6 = objc_msgSend(v5, "containsObject:", self->_childAppLayout, v11.receiver, v11.super_class);
  int v7 = [v4 isEqual:self->_parentAppLayout];

  if (v6)
  {
    if (v7) {
      goto LABEL_8;
    }
    uint64_t v8 = objc_msgSend(v5, "sb_arrayByRemovingObject:", self->_childAppLayout);
    goto LABEL_7;
  }
  if (v7 && ([v5 containsObject:self->_childAppLayout] & 1) == 0)
  {
    uint64_t v8 = [v5 arrayByAddingObject:self->_childAppLayout];
LABEL_7:
    id v9 = (void *)v8;

    v5 = v9;
  }
LABEL_8:
  return v5;
}

- (SBAppLayout)childAppLayout
{
  return self->_childAppLayout;
}

- (SBAppLayout)parentAppLayout
{
  return self->_parentAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentAppLayout, 0);
  objc_storeStrong((id *)&self->_childAppLayout, 0);
}

@end