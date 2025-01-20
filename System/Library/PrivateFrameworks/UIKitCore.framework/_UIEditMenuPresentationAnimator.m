@interface _UIEditMenuPresentationAnimator
- (NSMutableArray)animationBlocks;
- (NSMutableArray)completionBlocks;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)runAnimations;
- (void)runCompletions;
- (void)setAnimationBlocks:(id)a3;
- (void)setCompletionBlocks:(id)a3;
@end

@implementation _UIEditMenuPresentationAnimator

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
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_animationBlocks;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  animationBlocks = self->_animationBlocks;
  self->_animationBlocks = 0;
}

- (void)runCompletions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_completionBlocks;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;
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