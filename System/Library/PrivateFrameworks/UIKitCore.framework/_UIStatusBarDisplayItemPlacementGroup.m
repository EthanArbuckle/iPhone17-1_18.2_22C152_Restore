@interface _UIStatusBarDisplayItemPlacementGroup
+ (id)groupWithPriority:(int64_t)a3 placements:(id)a4;
- (BOOL)enabled;
- (NSArray)placements;
- (int64_t)maximumPriority;
- (int64_t)minimumPriority;
- (void)setEnabled:(BOOL)a3;
- (void)setPlacements:(id)a3;
@end

@implementation _UIStatusBarDisplayItemPlacementGroup

+ (id)groupWithPriority:(int64_t)a3 placements:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = objc_alloc_init((Class)a1);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    int64_t v13 = 0x8000000000000000;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "setPriority:", objc_msgSend(v15, "priority", (void)v20) + a3);
        uint64_t v16 = [v15 priority];
        if (v12 >= v16) {
          uint64_t v12 = v16;
        }
        uint64_t v17 = [v15 priority];
        if (v13 <= v17) {
          int64_t v13 = v17;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    int64_t v13 = 0x8000000000000000;
  }

  v18 = (void *)v7[1];
  v7[1] = v8;

  v7[2] = v12;
  v7[3] = v13;
  return v7;
}

- (BOOL)enabled
{
  v2 = [(_UIStatusBarDisplayItemPlacementGroup *)self placements];
  v3 = [v2 firstObject];
  char v4 = [v3 isEnabled];

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v4 = self->_placements;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setEnabled:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSArray)placements
{
  return self->_placements;
}

- (void)setPlacements:(id)a3
{
}

- (int64_t)minimumPriority
{
  return self->_minimumPriority;
}

- (int64_t)maximumPriority
{
  return self->_maximumPriority;
}

- (void).cxx_destruct
{
}

@end