@interface STUIStatusBarDisplayItemDependencyRelation
- (BOOL)isFulfilled;
- (BOOL)requirement;
- (STUIStatusBarDisplayItemPlacement)placement;
- (STUIStatusBarDisplayItemState)itemState;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)itemStates;
- (id)type;
- (void)setItemState:(id)a3;
- (void)setPlacement:(id)a3;
- (void)setRequirement:(BOOL)a3;
@end

@implementation STUIStatusBarDisplayItemDependencyRelation

- (BOOL)isFulfilled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemState);
  char v4 = [WeakRetained isCurrentPlacement:self->_placement];

  return v4 ^ !self->_requirement;
}

- (void)setPlacement:(id)a3
{
}

- (void)setItemState:(id)a3
{
}

- (id)itemStates
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(STUIStatusBarDisplayItemDependencyRelation *)self itemState];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (STUIStatusBarDisplayItemState)itemState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemState);
  return (STUIStatusBarDisplayItemState *)WeakRetained;
}

- (void)setRequirement:(BOOL)a3
{
  self->_requirement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placement, 0);
  objc_destroyWeak((id *)&self->_itemState);
}

- (id)type
{
  if (self->_requirement) {
    return @"requirement";
  }
  else {
    return @"exclusion";
  }
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)STUIStatusBarDisplayItemDependencyRelation;
  v5 = [(STUIStatusBarDisplayItemRelation *)&v11 _descriptionBuilderWithMultilinePrefix:a3 forDebug:a4];
  v6 = [(STUIStatusBarDisplayItemDependencyRelation *)self itemState];
  id v7 = (id)[v5 appendObject:v6 withName:@"itemState" skipIfNil:1];

  v8 = [(STUIStatusBarDisplayItemDependencyRelation *)self placement];
  id v9 = (id)[v5 appendObject:v8 withName:@"placement" skipIfNil:1];

  return v5;
}

- (STUIStatusBarDisplayItemPlacement)placement
{
  return self->_placement;
}

- (BOOL)requirement
{
  return self->_requirement;
}

@end