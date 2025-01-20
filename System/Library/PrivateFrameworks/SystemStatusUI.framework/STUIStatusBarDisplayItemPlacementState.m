@interface STUIStatusBarDisplayItemPlacementState
+ (id)stateForDisplayItemPlacement:(id)a3 region:(id)a4;
- (BOOL)areRelationsFulfilled;
- (BOOL)canBeEnabled;
- (BOOL)isEnabled;
- (NSMutableArray)relations;
- (STUIStatusBarDisplayItemPlacement)placement;
- (STUIStatusBarRegion)region;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescription;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)priority;
- (void)setRelations:(id)a3;
@end

@implementation STUIStatusBarDisplayItemPlacementState

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
  return [(STUIStatusBarDisplayItemPlacement *)placement isEnabled];
}

- (STUIStatusBarDisplayItemPlacement)placement
{
  return self->_placement;
}

- (BOOL)isEnabled
{
  BOOL v3 = [(STUIStatusBarDisplayItemPlacementState *)self canBeEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(STUIStatusBarDisplayItemPlacementState *)self areRelationsFulfilled];
  }
  return v3;
}

- (NSMutableArray)relations
{
  return self->_relations;
}

- (STUIStatusBarRegion)region
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  return (STUIStatusBarRegion *)WeakRetained;
}

- (int64_t)priority
{
  return [(STUIStatusBarDisplayItemPlacement *)self->_placement priority];
}

+ (id)stateForDisplayItemPlacement:(id)a3 region:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v10 = (void *)*((void *)v8 + 3);
  *((void *)v8 + 3) = v9;

  long long v11 = (void *)*((void *)v8 + 1);
  *((void *)v8 + 1) = v6;

  objc_storeWeak((id *)v8 + 2, v7);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relations, 0);
  objc_destroyWeak((id *)&self->_region);
  objc_storeStrong((id *)&self->_placement, 0);
}

- (id)description
{
  return [(STUIStatusBarDisplayItemPlacementState *)self descriptionWithMultilinePrefix:0];
}

- (id)debugDescription
{
  return [(STUIStatusBarDisplayItemPlacementState *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STUIStatusBarDisplayItemPlacementState *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_region);
  uint64_t v5 = [WeakRetained identifier];
  [v3 appendString:v5 withName:@"region"];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarDisplayItemPlacementState isEnabled](self, "isEnabled"), @"enabled");
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[STUIStatusBarDisplayItemPlacementState areRelationsFulfilled](self, "areRelationsFulfilled"), @"relationsFulfilled");
  id v8 = [(STUIStatusBarDisplayItemPlacementState *)self relations];
  id v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v8, "count"), @"relations.count");

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(STUIStatusBarDisplayItemPlacementState *)self descriptionBuilderWithMultilinePrefix:a3];
  int v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(STUIStatusBarDisplayItemPlacementState *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  int v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBarDisplayItemPlacementState *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = [(STUIStatusBarDisplayItemPlacementState *)self succinctDescriptionBuilder];
  [v5 setUseDebugDescription:v4];
  return v5;
}

- (void)setRelations:(id)a3
{
}

@end