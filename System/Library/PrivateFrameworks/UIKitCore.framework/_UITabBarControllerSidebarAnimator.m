@interface _UITabBarControllerSidebarAnimator
- (NSMutableArray)animationBlocks;
- (NSMutableArray)completionBlocks;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)runAnimations;
- (void)runCompletions;
- (void)setAnimationBlocks:(id)a3;
- (void)setCompletionBlocks:(id)a3;
@end

@implementation _UITabBarControllerSidebarAnimator

- (void)addAnimations:(id)a3
{
  id v4 = a3;
  animationBlocks = self->_animationBlocks;
  aBlock = v4;
  if (!animationBlocks)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_animationBlocks;
    self->_animationBlocks = v6;

    id v4 = aBlock;
    animationBlocks = self->_animationBlocks;
  }
  v8 = _Block_copy(v4);
  [(NSMutableArray *)animationBlocks addObject:v8];
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  completionBlocks = self->_completionBlocks;
  aBlock = v4;
  if (!completionBlocks)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_completionBlocks;
    self->_completionBlocks = v6;

    id v4 = aBlock;
    completionBlocks = self->_completionBlocks;
  }
  v8 = _Block_copy(v4);
  [(NSMutableArray *)completionBlocks addObject:v8];
}

- (void)runAnimations
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)self->_animationBlocks copy];
  animationBlocks = self->_animationBlocks;
  self->_animationBlocks = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
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
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)runCompletions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)self->_completionBlocks copy];
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
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
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSMutableArray)animationBlocks
{
  return self->_animationBlocks;
}

- (void)setAnimationBlocks:(id)a3
{
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setCompletionBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_animationBlocks, 0);
}

@end