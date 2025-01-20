@interface UIPointerInteractionAnimator
- (NSMutableArray)animations;
- (NSMutableArray)completions;
- (NSString)debugName;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)performAllAnimations;
- (void)performAllCompletions:(BOOL)a3;
- (void)setAnimations:(id)a3;
- (void)setCompletions:(id)a3;
- (void)setDebugName:(id)a3;
@end

@implementation UIPointerInteractionAnimator

- (void)addAnimations:(id)a3
{
  id v4 = a3;
  animations = self->_animations;
  aBlock = v4;
  if (!animations)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_animations;
    self->_animations = v6;

    id v4 = aBlock;
    animations = self->_animations;
  }
  v8 = _Block_copy(v4);
  [(NSMutableArray *)animations addObject:v8];
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  completions = self->_completions;
  aBlock = v4;
  if (!completions)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_completions;
    self->_completions = v6;

    id v4 = aBlock;
    completions = self->_completions;
  }
  v8 = _Block_copy(v4);
  [(NSMutableArray *)completions addObject:v8];
}

- (void)performAllAnimations
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerInteraction", &performAllAnimations___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    uint64_t v5 = [(UIPointerInteractionAnimator *)self debugName];
    v6 = (void *)v5;
    v7 = &stru_1ED0E84C0;
    if (v5) {
      v7 = (__CFString *)v5;
    }
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "performAllAnimations called on animator: %@", buf, 0xCu);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = [(UIPointerInteractionAnimator *)self animations];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  animations = self->_animations;
  self->_animations = 0;
}

- (void)performAllCompletions:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIPointerInteraction", &performAllCompletions____s_category) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    v6 = NSStringFromBOOL();
    uint64_t v7 = [(UIPointerInteractionAnimator *)self debugName];
    v8 = (void *)v7;
    uint64_t v9 = &stru_1ED0E84C0;
    if (v7) {
      uint64_t v9 = (__CFString *)v7;
    }
    *(_DWORD *)buf = 138412546;
    v22 = v6;
    __int16 v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "performAllCompletions: %@ called on animator: %@", buf, 0x16u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [(UIPointerInteractionAnimator *)self completions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v14++) + 16))();
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  completions = self->_completions;
  self->_completions = 0;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setDebugName:(id)a3
{
}

- (NSMutableArray)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
}

@end