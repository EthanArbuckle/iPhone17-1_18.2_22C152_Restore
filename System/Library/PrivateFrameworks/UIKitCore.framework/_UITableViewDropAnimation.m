@interface _UITableViewDropAnimation
- (BOOL)_didBeginAnimation;
- (NSMutableArray)animationsBlocks;
- (NSMutableArray)completionBlocks;
- (UIDragItem)dragItem;
- (_UITableViewDropAnimation)initWithDragItem:(id)a3;
- (void)_addClientBlocksToAnimator:(id)a3;
- (void)_executeCompletionBlocks;
- (void)_setDidBeginAnimation:(BOOL)a3;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)setAnimationsBlocks:(id)a3;
- (void)setCompletionBlocks:(id)a3;
- (void)setDragItem:(id)a3;
@end

@implementation _UITableViewDropAnimation

- (_UITableViewDropAnimation)initWithDragItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITableViewDropAnimation;
  v6 = [(_UITableViewDropAnimation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dragItem, a3);
  }

  return v7;
}

- (void)addAnimations:(id)a3
{
  id v4 = a3;
  animationsBlocks = self->_animationsBlocks;
  aBlock = v4;
  if (!animationsBlocks)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_animationsBlocks;
    self->_animationsBlocks = v6;

    id v4 = aBlock;
    animationsBlocks = self->_animationsBlocks;
  }
  v8 = _Block_copy(v4);
  [(NSMutableArray *)animationsBlocks addObject:v8];
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  completionBlocks = self->_completionBlocks;
  aBlock = v4;
  if (!completionBlocks)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_completionBlocks;
    self->_completionBlocks = v6;

    id v4 = aBlock;
    completionBlocks = self->_completionBlocks;
  }
  v8 = _Block_copy(v4);
  [(NSMutableArray *)completionBlocks addObject:v8];
}

- (void)_addClientBlocksToAnimator:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  animationsBlocks = self->_animationsBlocks;
  if (animationsBlocks)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v6 = animationsBlocks;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          [v4 addAnimations:*(void *)(*((void *)&v21 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    [(NSMutableArray *)self->_animationsBlocks removeAllObjects];
  }
  completionBlocks = self->_completionBlocks;
  if (completionBlocks)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v12 = completionBlocks;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
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
          objc_msgSend(v4, "addCompletion:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }

    [(NSMutableArray *)self->_completionBlocks removeAllObjects];
  }
}

- (void)_executeCompletionBlocks
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  completionBlocks = self->_completionBlocks;
  if (completionBlocks)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = completionBlocks;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [(NSMutableArray *)self->_completionBlocks removeAllObjects];
  }
}

- (UIDragItem)dragItem
{
  return self->_dragItem;
}

- (void)setDragItem:(id)a3
{
}

- (BOOL)_didBeginAnimation
{
  return self->_didBeginAnimation;
}

- (void)_setDidBeginAnimation:(BOOL)a3
{
  self->_didBeginAnimation = a3;
}

- (NSMutableArray)animationsBlocks
{
  return self->_animationsBlocks;
}

- (void)setAnimationsBlocks:(id)a3
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
  objc_storeStrong((id *)&self->_animationsBlocks, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
}

@end