@interface _UIStatusBarDisplayItemRelation
+ (id)allRelationWithRelations:(id)a3;
+ (id)anyRelationWithRelations:(id)a3;
+ (id)exclusionWithDisplayItemState:(id)a3 placement:(id)a4;
+ (id)requirementWithDisplayItemState:(id)a3 placement:(id)a4;
- (BOOL)isFulfilled;
- (NSArray)itemStates;
- (id)_ui_descriptionBuilder;
- (id)description;
- (id)type;
@end

@implementation _UIStatusBarDisplayItemRelation

+ (id)exclusionWithDisplayItemState:(id)a3 placement:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(_UIStatusBarDisplayItemDependencyRelation);
  [(_UIStatusBarDisplayItemDependencyRelation *)v7 setItemState:v6];

  [(_UIStatusBarDisplayItemDependencyRelation *)v7 setPlacement:v5];
  return v7;
}

+ (id)requirementWithDisplayItemState:(id)a3 placement:(id)a4
{
  v4 = [a1 exclusionWithDisplayItemState:a3 placement:a4];
  [v4 setRequirement:1];
  return v4;
}

+ (id)anyRelationWithRelations:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UIStatusBarDisplayItemGroupRelation);
  [(_UIStatusBarDisplayItemGroupRelation *)v4 setRelations:v3];

  return v4;
}

+ (id)allRelationWithRelations:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UIStatusBarDisplayItemGroupRelation);
  [(_UIStatusBarDisplayItemGroupRelation *)v4 setRelations:v3];

  [(_UIStatusBarDisplayItemGroupRelation *)v4 setRequiresAll:1];
  return v4;
}

- (BOOL)isFulfilled
{
  return 1;
}

- (NSArray)itemStates
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)type
{
  return 0;
}

- (id)_ui_descriptionBuilder
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarDisplayItemRelation;
  v2 = [&v8 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_type);
  v9[0] = v3;
  v4 = NSStringFromSelector(sel_isFulfilled);
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [v2 appendKeys:v5];

  return v6;
}

- (id)description
{
  v2 = [(_UIStatusBarDisplayItemRelation *)self _ui_descriptionBuilder];
  id v3 = [v2 string];

  return v3;
}

@end