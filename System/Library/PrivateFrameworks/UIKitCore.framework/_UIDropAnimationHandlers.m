@interface _UIDropAnimationHandlers
- (NSArray)alongsideAnimationHandlers;
- (NSArray)completionHandlers;
- (_UIDropAnimationHandlers)init;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)invokeAllCompletionHandlers;
- (void)resetAllAnimationHandlers;
@end

@implementation _UIDropAnimationHandlers

- (_UIDropAnimationHandlers)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIDropAnimationHandlers;
  v2 = [(_UIDropAnimationHandlers *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    alongsideAnimationHandlers = v2->_alongsideAnimationHandlers;
    v2->_alongsideAnimationHandlers = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v5;
  }
  return v2;
}

- (void)invokeAllCompletionHandlers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_completionHandlers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)resetAllAnimationHandlers
{
  [(NSMutableArray *)self->_alongsideAnimationHandlers removeAllObjects];
  completionHandlers = self->_completionHandlers;
  [(NSMutableArray *)completionHandlers removeAllObjects];
}

- (NSArray)alongsideAnimationHandlers
{
  return (NSArray *)self->_alongsideAnimationHandlers;
}

- (NSArray)completionHandlers
{
  return (NSArray *)self->_completionHandlers;
}

- (void)addAnimations:(id)a3
{
  if (a3)
  {
    alongsideAnimationHandlers = self->_alongsideAnimationHandlers;
    id v5 = (id)[a3 copy];
    uint64_t v4 = _Block_copy(v5);
    [(NSMutableArray *)alongsideAnimationHandlers addObject:v4];
  }
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v5 = (id)[a3 copy];
    uint64_t v4 = _Block_copy(v5);
    [(NSMutableArray *)completionHandlers addObject:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_alongsideAnimationHandlers, 0);
}

@end