@interface _UIFocusEnvironmentPreferenceCacheNode
- (BOOL)isResolved;
- (NSArray)childNodes;
- (UIFocusEnvironment)environment;
- (UIFocusEnvironment)resolvedEnvironment;
- (_UIFocusEnvironmentPreferenceCacheNode)initWithEnvironment:(id)a3;
- (id)debugDescription;
- (id)description;
- (void)_reevaluateResolution;
- (void)_resolve:(id)a3 explicitly:(BOOL)a4;
- (void)_unresolve;
- (void)resolve:(id)a3;
- (void)setChildNodes:(id)a3;
@end

@implementation _UIFocusEnvironmentPreferenceCacheNode

- (_UIFocusEnvironmentPreferenceCacheNode)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIFocusEnvironmentPreferenceCacheNode;
  v6 = [(_UIFocusEnvironmentPreferenceCacheNode *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environment, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:514];
    parentNodes = v7->_parentNodes;
    v7->_parentNodes = (NSHashTable *)v8;
  }
  return v7;
}

- (void)_reevaluateResolution
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v3 = [(_UIFocusEnvironmentPreferenceCacheNode *)self childNodes];
    if (v3
      && (v4 = (void *)v3,
          [(_UIFocusEnvironmentPreferenceCacheNode *)self childNodes],
          id v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [v5 count],
          v5,
          v4,
          v6))
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v7 = [(_UIFocusEnvironmentPreferenceCacheNode *)self childNodes];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if (![v12 isResolved])
            {
              [(_UIFocusEnvironmentPreferenceCacheNode *)self _unresolve];
              goto LABEL_20;
            }
            uint64_t v13 = [v12 resolvedEnvironment];
            if (v13)
            {
              v14 = (void *)v13;
              goto LABEL_19;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
      v14 = 0;
LABEL_19:

      [(_UIFocusEnvironmentPreferenceCacheNode *)self _resolve:v14 explicitly:0];
      v7 = v14;
LABEL_20:
    }
    else
    {
      [(_UIFocusEnvironmentPreferenceCacheNode *)self _unresolve];
    }
  }
}

- (void)_resolve:(id)a3 explicitly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v7 = (UIFocusEnvironment *)a3;
  uint64_t v8 = v7;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0 || v4)
  {
    if ((*(unsigned char *)&self->_flags & 1) != 0 && self->_resolvedEnvironment == v7)
    {
      if (v4 | ((flags & 2) >> 1)) {
        char v17 = 2;
      }
      else {
        char v17 = 0;
      }
      *(unsigned char *)&self->_char flags = v17 | flags & 0xFD;
    }
    else
    {
      char v10 = flags & 0xFC;
      if (v4) {
        char v11 = 3;
      }
      else {
        char v11 = 1;
      }
      *(unsigned char *)&self->_char flags = v10 | v11;
      objc_storeStrong((id *)&self->_resolvedEnvironment, a3);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v12 = self->_parentNodes;
      uint64_t v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "_reevaluateResolution", (void)v18);
          }
          uint64_t v14 = [(NSHashTable *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v14);
      }
    }
  }
}

- (void)resolve:(id)a3
{
}

- (void)_unresolve
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char flags = (char)self->_flags;
  if ((flags & 3) == 1)
  {
    *(unsigned char *)&self->_char flags = flags & 0xFE;
    resolvedEnvironment = self->_resolvedEnvironment;
    self->_resolvedEnvironment = 0;

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = self->_parentNodes;
    uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_reevaluateResolution", (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setChildNodes:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [(_UIFocusEnvironmentPreferenceCacheNode *)self childNodes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*(void *)(*((void *)&v21 + 1) + 8 * v9++) + 8) removeObject:self];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v10 = (NSArray *)[v4 copy];
  childNodes = self->_childNodes;
  self->_childNodes = v10;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*(void *)(*((void *)&v17 + 1) + 8 * v16++) + 8), "addObject:", self, (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  [(_UIFocusEnvironmentPreferenceCacheNode *)self _reevaluateResolution];
}

- (BOOL)isResolved
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F4F718]) initWithObject:self];
  environment = self->_environment;
  if (environment)
  {
    id v5 = NSString;
    uint64_t v6 = environment;
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = [v5 stringWithFormat:@"<%@: %p>", v8, v6];
  }
  else
  {
    uint64_t v9 = @"(nil)";
  }
  id v10 = (id)[v3 appendObject:v9 withName:@"environment"];

  id v11 = (id)objc_msgSend(v3, "appendInteger:withName:", -[NSHashTable count](self->_parentNodes, "count"), @"parentNodes");
  id v12 = (id)objc_msgSend(v3, "appendInteger:withName:", -[NSArray count](self->_childNodes, "count"), @"childNodes");
  uint64_t v13 = [v3 build];

  return v13;
}

- (id)debugDescription
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F4F718]) initWithObject:self];
  environment = self->_environment;
  if (environment)
  {
    id v5 = NSString;
    uint64_t v6 = environment;
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = [v5 stringWithFormat:@"<%@: %p>", v8, v6];
  }
  else
  {
    uint64_t v9 = @"(nil)";
  }
  id v10 = (id)[v3 appendObject:v9 withName:@"environment"];

  id v11 = (id)[v3 appendObject:self->_parentNodes withName:@"parentNodes"];
  id v12 = (id)[v3 appendObject:self->_childNodes withName:@"childNodes"];
  uint64_t v13 = [v3 build];

  return v13;
}

- (UIFocusEnvironment)environment
{
  return self->_environment;
}

- (UIFocusEnvironment)resolvedEnvironment
{
  return self->_resolvedEnvironment;
}

- (NSArray)childNodes
{
  return self->_childNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childNodes, 0);
  objc_storeStrong((id *)&self->_resolvedEnvironment, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_parentNodes, 0);
}

@end