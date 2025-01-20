@interface _UIBarCustomizerAnimator
- (NSMutableArray)animations;
- (NSMutableArray)completions;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)performAllAnimations;
- (void)performAllCompletionsWithSession:(id)a3;
- (void)setAnimations:(id)a3;
- (void)setCompletions:(id)a3;
@end

@implementation _UIBarCustomizerAnimator

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
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(_UIBarCustomizerAnimator *)self animations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  animations = self->_animations;
  self->_animations = 0;
}

- (void)performAllCompletionsWithSession:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(_UIBarCustomizerAnimator *)self completions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  completions = self->_completions;
  self->_completions = 0;
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
}

@end