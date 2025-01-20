@interface SBFAlwaysOnLiveRenderingAssertionWeakCollection
- (BOOL)isEmpty;
- (SBFAlwaysOnLiveRenderingAssertionWeakCollection)init;
- (id)mostRecentlyCreatedValidAssertion;
- (int64_t)count;
- (void)addAssertion:(id)a3;
- (void)invalidateAll;
- (void)removeAll;
- (void)removeAssertion:(id)a3;
@end

@implementation SBFAlwaysOnLiveRenderingAssertionWeakCollection

- (SBFAlwaysOnLiveRenderingAssertionWeakCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBFAlwaysOnLiveRenderingAssertionWeakCollection;
  v2 = [(SBFAlwaysOnLiveRenderingAssertionWeakCollection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    assertions = v2->_assertions;
    v2->_assertions = (NSHashTable *)v3;
  }
  return v2;
}

- (BOOL)isEmpty
{
  v2 = [(NSHashTable *)self->_assertions anyObject];
  BOOL v3 = v2 == 0;

  return v3;
}

- (int64_t)count
{
  v2 = [(NSHashTable *)self->_assertions allObjects];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)addAssertion:(id)a3
{
}

- (void)removeAssertion:(id)a3
{
}

- (void)removeAll
{
}

- (id)mostRecentlyCreatedValidAssertion
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [(NSHashTable *)self->_assertions allObjects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v8 isValid])
        {
          v9 = [v8 createdAt];
          [v9 timeIntervalSince1970];
          double v11 = v10;
          v12 = [v5 createdAt];
          [v12 timeIntervalSince1970];
          double v14 = v13;

          if (v11 > v14)
          {
            id v15 = v8;

            v5 = v15;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)invalidateAll
{
  id v2 = [(NSHashTable *)self->_assertions allObjects];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_6];
}

uint64_t __64__SBFAlwaysOnLiveRenderingAssertionWeakCollection_invalidateAll__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void).cxx_destruct
{
}

@end