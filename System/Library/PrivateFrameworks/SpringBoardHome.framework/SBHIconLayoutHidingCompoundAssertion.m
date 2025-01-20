@interface SBHIconLayoutHidingCompoundAssertion
- (BOOL)isInvalidated;
- (NSArray)icons;
- (NSString)description;
- (NSString)reason;
- (SBHIconLayoutHidingCompoundAssertion)initWithInvalidationHandler:(id)a3 icons:(id)a4 reason:(id)a5 options:(unint64_t)a6;
- (SBHIconLayoutHidingCompoundAssertionInvalidationHandler)invalidationHandler;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)options;
- (void)addAssertion:(id)a3 forChild:(id)a4;
- (void)addAssertionFromChild:(id)a3;
- (void)addIcon:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeAndInvalidateAssertionsForChild:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation SBHIconLayoutHidingCompoundAssertion

- (SBHIconLayoutHidingCompoundAssertion)initWithInvalidationHandler:(id)a3 icons:(id)a4 reason:(id)a5 options:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBHIconLayoutHidingCompoundAssertion;
  v14 = [(SBHIconLayoutHidingCompoundAssertion *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 mutableCopy];
    icons = v14->_icons;
    v14->_icons = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v14->_invalidationHandler, a3);
    uint64_t v17 = [v13 copy];
    reason = v14->_reason;
    v14->_reason = (NSString *)v17;

    v14->_options = a6;
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_FAULT, "SBHIconLayoutHidingCompoundAssertion deallocated but not invalidated! Reason: %@", (uint8_t *)&v3, 0xCu);
}

- (void)addAssertion:(id)a3 forChild:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  childAssertions = self->_childAssertions;
  if (!childAssertions)
  {
    v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v9 = self->_childAssertions;
    self->_childAssertions = v8;

    childAssertions = self->_childAssertions;
  }
  id v10 = [(NSMapTable *)childAssertions objectForKey:v6];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(NSMapTable *)self->_childAssertions setObject:v10 forKey:v6];
  }
  [v10 addObject:v11];
}

- (void)addAssertionFromChild:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(SBHIconLayoutHidingCompoundAssertion *)self icons];
  uint64_t v5 = [(SBHIconLayoutHidingCompoundAssertion *)self reason];
  id v6 = objc_msgSend(v7, "beginHidingIconsFromLayout:reason:options:", v4, v5, -[SBHIconLayoutHidingCompoundAssertion options](self, "options"));
  if (v6) {
    [(SBHIconLayoutHidingCompoundAssertion *)self addAssertion:v6 forChild:v7];
  }
}

- (void)removeAndInvalidateAssertionsForChild:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_childAssertions objectForKey:v4];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) invalidate];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(NSMapTable *)self->_childAssertions removeObjectForKey:v4];
}

- (void)addIcon:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableArray *)self->_icons addObject:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_childAssertions;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [(NSMapTable *)self->_childAssertions objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * v9)];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * v14++) addIcon:v4];
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
}

- (NSArray)icons
{
  uint64_t v2 = (void *)[(NSMutableArray *)self->_icons copy];
  return (NSArray *)v2;
}

- (void)setOptions:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_options != a3)
  {
    self->_options = a3;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v5 = self->_childAssertions;
    uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = [(NSMapTable *)self->_childAssertions objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * v9)];
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v16;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v16 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v15 + 1) + 8 * v14++) setOptions:a3];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v12);
          }

          ++v9;
        }
        while (v9 != v7);
        uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }
  }
}

- (NSString)description
{
  return (NSString *)[(SBHIconLayoutHidingCompoundAssertion *)self descriptionWithMultilinePrefix:0];
}

- (void)invalidate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(SBHIconLayoutHidingCompoundAssertion *)self isInvalidated])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    int v3 = self->_childAssertions;
    uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v19;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [(NSMapTable *)self->_childAssertions objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * v7)];
          long long v14 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v15;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v15 != v11) {
                  objc_enumerationMutation(v8);
                }
                [*(id *)(*((void *)&v14 + 1) + 8 * v12++) invalidate];
              }
              while (v10 != v12);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
            }
            while (v10);
          }

          ++v7;
        }
        while (v7 != v5);
        uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v5);
    }

    uint64_t v13 = [(SBHIconLayoutHidingCompoundAssertion *)self invalidationHandler];
    [v13 layoutHidingCompoundAssertionDidInvalidate:self];

    [(SBHIconLayoutHidingCompoundAssertion *)self setInvalidated:1];
  }
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBHIconLayoutHidingCompoundAssertion *)self succinctDescriptionBuilder];
  int v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int v3 = [(SBHIconLayoutHidingCompoundAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(SBHIconLayoutHidingCompoundAssertion *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_childAssertions withName:@"childAssertions"];
  uint64_t v6 = [(SBHIconLayoutHidingCompoundAssertion *)self reason];
  id v7 = (id)[v4 appendObject:v6 withName:@"reason"];

  id v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:format:", -[SBHIconLayoutHidingCompoundAssertion options](self, "options"), @"options", 1);
  uint64_t v9 = [(SBHIconLayoutHidingCompoundAssertion *)self invalidationHandler];
  id v10 = (id)[v4 appendPointer:v9 withName:@"invalidationHandler"];

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (unint64_t)options
{
  return self->_options;
}

- (SBHIconLayoutHidingCompoundAssertionInvalidationHandler)invalidationHandler
{
  return self->_invalidationHandler;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_childAssertions, 0);
  objc_storeStrong((id *)&self->_icons, 0);
}

@end