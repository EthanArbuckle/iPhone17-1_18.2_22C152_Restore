@interface _UIStatusBarDisplayItemPlacementState
+ (id)stateForDisplayItemPlacement:(id)a3 region:(id)a4;
- (BOOL)areRelationsFulfilled;
- (BOOL)canBeEnabled;
- (BOOL)isEnabled;
- (NSMutableArray)relations;
- (_UIStatusBarDisplayItemPlacement)placement;
- (_UIStatusBarRegion)region;
- (id)description;
- (int64_t)priority;
- (void)setRelations:(id)a3;
@end

@implementation _UIStatusBarDisplayItemPlacementState

+ (id)stateForDisplayItemPlacement:(id)a3 region:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = (void *)*((void *)v8 + 3);
  *((void *)v8 + 3) = v9;

  v11 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v6;

  objc_storeWeak((id *)v8 + 2, v7);
  return v8;
}

- (int64_t)priority
{
  return [(_UIStatusBarDisplayItemPlacement *)self->_placement priority];
}

- (BOOL)areRelationsFulfilled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_relations;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isFulfilled", (void)v9))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)canBeEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  int v4 = [WeakRetained isEnabled];

  if (!v4) {
    return 0;
  }
  placement = self->_placement;
  return [(_UIStatusBarDisplayItemPlacement *)placement isEnabled];
}

- (BOOL)isEnabled
{
  BOOL v3 = [(_UIStatusBarDisplayItemPlacementState *)self canBeEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(_UIStatusBarDisplayItemPlacementState *)self areRelationsFulfilled];
  }
  return v3;
}

- (id)description
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"region";
  id WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  int v4 = [WeakRetained identifier];
  v14[0] = v4;
  v13[1] = @"enabled";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[_UIStatusBarDisplayItemPlacementState isEnabled](self, "isEnabled"));
  v14[1] = v5;
  v13[2] = @"relationsFulfilled";
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_UIStatusBarDisplayItemPlacementState areRelationsFulfilled](self, "areRelationsFulfilled"));
  v14[2] = v6;
  v13[3] = @"relations";
  BOOL v7 = NSNumber;
  id v8 = [(_UIStatusBarDisplayItemPlacementState *)self relations];
  long long v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v14[3] = v9;
  long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  long long v11 = +[UIDescriptionBuilder descriptionForObject:self namesAndObjects:v10];

  return v11;
}

- (_UIStatusBarDisplayItemPlacement)placement
{
  return self->_placement;
}

- (_UIStatusBarRegion)region
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  return (_UIStatusBarRegion *)WeakRetained;
}

- (NSMutableArray)relations
{
  return self->_relations;
}

- (void)setRelations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relations, 0);
  objc_destroyWeak((id *)&self->_region);
  objc_storeStrong((id *)&self->_placement, 0);
}

@end