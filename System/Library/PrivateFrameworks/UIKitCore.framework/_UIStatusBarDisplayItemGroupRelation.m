@interface _UIStatusBarDisplayItemGroupRelation
- (BOOL)isFulfilled;
- (BOOL)requiresAll;
- (NSArray)relations;
- (id)_ui_descriptionBuilder;
- (id)itemStates;
- (id)type;
- (void)setRelations:(id)a3;
- (void)setRequiresAll:(BOOL)a3;
@end

@implementation _UIStatusBarDisplayItemGroupRelation

- (BOOL)isFulfilled
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_relations;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isFulfilled", (void)v11) && !self->_requiresAll)
        {
          BOOL v9 = 1;
LABEL_15:

          return v9;
        }
        if (([v8 isFulfilled] & 1) == 0 && self->_requiresAll)
        {
          BOOL v9 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  return self->_requiresAll;
}

- (id)itemStates
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_relations;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "itemStates", (void)v11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)type
{
  if (self->_requiresAll) {
    return @"all";
  }
  else {
    return @"any";
  }
}

- (id)_ui_descriptionBuilder
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDisplayItemGroupRelation;
  v2 = [(_UIStatusBarDisplayItemRelation *)&v7 _ui_descriptionBuilder];
  v3 = NSStringFromSelector(sel_relations);
  v8[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v5 = [v2 appendKeys:v4];

  return v5;
}

- (NSArray)relations
{
  return self->_relations;
}

- (void)setRelations:(id)a3
{
}

- (BOOL)requiresAll
{
  return self->_requiresAll;
}

- (void)setRequiresAll:(BOOL)a3
{
  self->_requiresAll = a3;
}

- (void).cxx_destruct
{
}

@end