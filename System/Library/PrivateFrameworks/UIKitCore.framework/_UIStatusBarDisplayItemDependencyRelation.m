@interface _UIStatusBarDisplayItemDependencyRelation
- (BOOL)isFulfilled;
- (BOOL)requirement;
- (_UIStatusBarDisplayItemPlacement)placement;
- (_UIStatusBarDisplayItemState)itemState;
- (id)_ui_descriptionBuilder;
- (id)itemStates;
- (id)type;
- (void)setItemState:(id)a3;
- (void)setPlacement:(id)a3;
- (void)setRequirement:(BOOL)a3;
@end

@implementation _UIStatusBarDisplayItemDependencyRelation

- (BOOL)isFulfilled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemState);
  char v4 = [WeakRetained isCurrentPlacement:self->_placement];

  return v4 ^ !self->_requirement;
}

- (id)itemStates
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(_UIStatusBarDisplayItemDependencyRelation *)self itemState];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
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

- (id)_ui_descriptionBuilder
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDisplayItemDependencyRelation;
  v2 = [(_UIStatusBarDisplayItemRelation *)&v8 _ui_descriptionBuilder];
  v3 = NSStringFromSelector(sel_itemState);
  v9[0] = v3;
  char v4 = NSStringFromSelector(sel_placement);
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v6 = [v2 appendKeys:v5];

  return v6;
}

- (_UIStatusBarDisplayItemState)itemState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemState);
  return (_UIStatusBarDisplayItemState *)WeakRetained;
}

- (void)setItemState:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)placement
{
  return self->_placement;
}

- (void)setPlacement:(id)a3
{
}

- (BOOL)requirement
{
  return self->_requirement;
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

@end