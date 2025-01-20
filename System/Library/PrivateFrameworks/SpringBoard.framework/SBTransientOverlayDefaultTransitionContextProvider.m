@interface SBTransientOverlayDefaultTransitionContextProvider
- (BOOL)isAnimated;
- (void)completeTransition:(BOOL)a3;
- (void)performAlongsideTransitions;
- (void)setAnimated:(BOOL)a3;
- (void)transitionAlongsideUsingBlock:(id)a3 completion:(id)a4;
@end

@implementation SBTransientOverlayDefaultTransitionContextProvider

- (void)completeTransition:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_didPerformAlongsideTransitions)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBTransientOverlayDefaultTransitionContextProvider.m" lineNumber:24 description:@"-performAlongsideTransitions must be called before completing the transition."];
  }
  if (self->_isCompleted)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = NSStringFromSelector(a2);
    [v14 handleFailureInMethod:a2, self, @"SBTransientOverlayDefaultTransitionContextProvider.m", 25, @"%@ may only be called once.", v15 object file lineNumber description];
  }
  self->_isCompleted = 1;
  self->_transitionCompletedSuccessfully = a3;
  v6 = (void *)[(NSMutableArray *)self->_transitionCompletionBlocks copy];
  transitionCompletionBlocks = self->_transitionCompletionBlocks;
  self->_transitionCompletionBlocks = 0;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)performAlongsideTransitions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_didPerformAlongsideTransitions)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = NSStringFromSelector(a2);
    [v11 handleFailureInMethod:a2, self, @"SBTransientOverlayDefaultTransitionContextProvider.m", 38, @"%@ may only be called once.", v12 object file lineNumber description];
  }
  self->_didPerformAlongsideTransitions = 1;
  v3 = (void *)[(NSMutableArray *)self->_transitionBlocks copy];
  transitionBlocks = self->_transitionBlocks;
  self->_transitionBlocks = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)transitionAlongsideUsingBlock:(id)a3 completion:(id)a4
{
  long long v15 = (void (**)(void))a3;
  uint64_t v6 = (void (**)(id, BOOL))a4;
  if (self->_didPerformAlongsideTransitions)
  {
    if (v15) {
      v15[2](v15);
    }
  }
  else if (v15)
  {
    transitionBlocks = self->_transitionBlocks;
    if (!transitionBlocks)
    {
      uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = self->_transitionBlocks;
      self->_transitionBlocks = v8;

      transitionBlocks = self->_transitionBlocks;
    }
    uint64_t v10 = (void *)MEMORY[0x1D948C7A0](v15);
    [(NSMutableArray *)transitionBlocks addObject:v10];
  }
  if (self->_isCompleted)
  {
    if (v6) {
      v6[2](v6, self->_transitionCompletedSuccessfully);
    }
  }
  else if (v6)
  {
    transitionCompletionBlocks = self->_transitionCompletionBlocks;
    if (!transitionCompletionBlocks)
    {
      uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v13 = self->_transitionCompletionBlocks;
      self->_transitionCompletionBlocks = v12;

      transitionCompletionBlocks = self->_transitionCompletionBlocks;
    }
    long long v14 = (void *)MEMORY[0x1D948C7A0](v6);
    [(NSMutableArray *)transitionCompletionBlocks addObject:v14];
  }
}

- (BOOL)isAnimated
{
  return self->animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->animated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_transitionBlocks, 0);
}

@end