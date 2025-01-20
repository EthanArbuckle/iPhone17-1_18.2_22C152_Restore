@interface SBWorkspaceTransitionContext
+ (id)context;
- (BOOL)animationDisabled;
- (BOOL)isFinalized;
- (BSAnimationSettings)animationSettings;
- (NSSet)entities;
- (NSSet)previousEntities;
- (NSString)description;
- (SBWorkspaceTransitionContext)init;
- (SBWorkspaceTransitionRequest)request;
- (id)compactDescriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)entityForIdentifier:(id)a3;
- (id)entityForKey:(id)a3;
- (id)previousEntityForIdentifier:(id)a3;
- (id)previousEntityForKey:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)addFinalizeBlock:(id)a3;
- (void)finalize;
- (void)setAnimationDisabled:(BOOL)a3;
- (void)setAnimationSettings:(id)a3;
- (void)setEntity:(id)a3 forKey:(id)a4;
- (void)setPreviousEntity:(id)a3 forKey:(id)a4;
- (void)setRequest:(id)a3;
@end

@implementation SBWorkspaceTransitionContext

- (id)entityForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_entities objectForKey:a3];
}

- (id)previousEntityForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_previousEntities objectForKey:a3];
}

- (void)setPreviousEntity:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBWorkspaceTransitionContext.m", 79, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  id v10 = (id)[v7 copy];

  if (v10)
  {
    [v10 clearActivationSettings];
    [(NSMutableDictionary *)self->_previousEntities setObject:v10 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)self->_previousEntities removeObjectForKey:v8];
  }
}

- (SBWorkspaceTransitionRequest)request
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  return (SBWorkspaceTransitionRequest *)WeakRetained;
}

- (NSSet)previousEntities
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSMutableDictionary *)self->_previousEntities allValues];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (NSSet)entities
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSMutableDictionary *)self->_entities allValues];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalizeBlocks, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_previousEntities, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_destroyWeak((id *)&self->_request);
}

- (BOOL)animationDisabled
{
  return self->_animationDisabled;
}

- (void)setEntity:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBWorkspaceTransitionContext.m", 53, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  entities = self->_entities;
  if (v10) {
    [(NSMutableDictionary *)entities setObject:v10 forKey:v7];
  }
  else {
    [(NSMutableDictionary *)entities removeObjectForKey:v7];
  }
}

- (void)setAnimationDisabled:(BOOL)a3
{
  self->_animationDisabled = a3;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void)finalize
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_finalized)
  {
    self->_finalized = 1;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = self->_finalizeBlocks;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(NSMutableArray *)self->_finalizeBlocks removeAllObjects];
  }
}

- (void)addFinalizeBlock:(id)a3
{
  if (a3)
  {
    finalizeBlocks = self->_finalizeBlocks;
    id v4 = (id)MEMORY[0x1D948C7A0](a3, a2);
    [(NSMutableArray *)finalizeBlocks addObject:v4];
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBWorkspaceTransitionContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBWorkspaceTransitionContext *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__SBWorkspaceTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  long long v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_animationDisabled withName:@"animationDisabled"];
  return v3;
}

id __77__SBWorkspaceTransitionContext_compactDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:a2];
  v3 = [v2 succinctDescription];

  return v3;
}

- (SBWorkspaceTransitionContext)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBWorkspaceTransitionContext;
  v2 = [(SBWorkspaceTransitionContext *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    entities = v2->_entities;
    v2->_entities = v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    previousEntities = v2->_previousEntities;
    v2->_previousEntities = v5;

    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    finalizeBlocks = v2->_finalizeBlocks;
    v2->_finalizeBlocks = v7;
  }
  return v2;
}

- (void)setRequest:(id)a3
{
}

- (BSAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (id)compactDescriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  entities = self->_entities;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__SBWorkspaceTransitionContext_compactDescriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6B00850;
  void v9[4] = self;
  [v6 appendDictionarySection:entities withName:@"entities" multilinePrefix:v5 skipIfEmpty:1 objectTransformer:v9];

  return v6;
}

uint64_t __70__SBWorkspaceTransitionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"animationSettings" skipIfNil:1];
  [*(id *)(a1 + 32) appendDictionarySection:*(void *)(*(void *)(a1 + 40) + 16) withName:@"entities" skipIfEmpty:1];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 24);
  return [v3 appendDictionarySection:v4 withName:@"previousEntities" skipIfEmpty:1];
}

+ (id)context
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)description
{
  return (NSString *)[(SBWorkspaceTransitionContext *)self descriptionWithMultilinePrefix:0];
}

- (id)entityForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMutableDictionary *)self->_entities allValues];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_super v10 = [v9 uniqueIdentifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)previousEntityForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMutableDictionary *)self->_previousEntities allValues];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_super v10 = [v9 uniqueIdentifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)succinctDescription
{
  id v2 = [(SBWorkspaceTransitionContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (void)setAnimationSettings:(id)a3
{
}

@end