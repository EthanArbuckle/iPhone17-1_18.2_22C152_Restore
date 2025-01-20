@interface UIDragInteractionContextImpl
- (BOOL)hasBegunDrag;
- (BOOL)isPreparedForLift;
- (BOOL)shouldAnimateLift;
- (CAPoint3D)initialLocation;
- (NSArray)items;
- (NSMutableArray)animationBlocks;
- (NSMutableArray)completionBlocks;
- (UITouch)initiationTouch;
- (id)_sessionDidBegin;
- (id)animations;
- (id)completion;
- (int64_t)invocationType;
- (int64_t)state;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)setAnimations:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setHasBegunDrag:(BOOL)a3;
- (void)setInitialLocation:(CAPoint3D)a3;
- (void)setInitiationTouch:(id)a3;
- (void)setInvocationType:(int64_t)a3;
- (void)setItems:(id)a3;
- (void)setPreparedForLift:(BOOL)a3;
- (void)setShouldAnimateLift:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)set_sessionDidBegin:(id)a3;
@end

@implementation UIDragInteractionContextImpl

- (id)animations
{
  v2 = [(UIDragInteractionContextImpl *)self animationBlocks];
  v3 = (void *)[v2 copy];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__UIDragInteractionContextImpl_animations__block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  id v8 = v3;
  id v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

void __42__UIDragInteractionContextImpl_animations__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)completion
{
  uint64_t v2 = [(UIDragInteractionContextImpl *)self completionBlocks];
  uint64_t v3 = (void *)[v2 copy];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__UIDragInteractionContextImpl_completion__block_invoke;
  aBlock[3] = &unk_1E52DC698;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

void __42__UIDragInteractionContextImpl_completion__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (NSMutableArray)animationBlocks
{
  animationBlocks = self->_animationBlocks;
  if (!animationBlocks)
  {
    uint64_t v4 = (NSMutableArray *)objc_opt_new();
    uint64_t v5 = self->_animationBlocks;
    self->_animationBlocks = v4;

    animationBlocks = self->_animationBlocks;
  }
  return animationBlocks;
}

- (NSMutableArray)completionBlocks
{
  completionBlocks = self->_completionBlocks;
  if (!completionBlocks)
  {
    uint64_t v4 = (NSMutableArray *)objc_opt_new();
    uint64_t v5 = self->_completionBlocks;
    self->_completionBlocks = v4;

    completionBlocks = self->_completionBlocks;
  }
  return completionBlocks;
}

- (void)addAnimations:(id)a3
{
  id aBlock = a3;
  if (!aBlock)
  {
    long long v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UIDragInteraction.m", 230, @"Invalid parameter not satisfying: %@", @"animations" object file lineNumber description];
  }
  uint64_t v5 = [(UIDragInteractionContextImpl *)self animationBlocks];
  long long v6 = _Block_copy(aBlock);
  [v5 addObject:v6];
}

- (void)addCompletion:(id)a3
{
  id aBlock = a3;
  if (!aBlock)
  {
    long long v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UIDragInteraction.m", 235, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  uint64_t v5 = [(UIDragInteractionContextImpl *)self completionBlocks];
  long long v6 = _Block_copy(aBlock);
  [v5 addObject:v6];
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (BOOL)shouldAnimateLift
{
  return self->_shouldAnimateLift;
}

- (void)setShouldAnimateLift:(BOOL)a3
{
  self->_shouldAnimateLift = a3;
}

- (void)setAnimations:(id)a3
{
}

- (void)setCompletion:(id)a3
{
}

- (id)_sessionDidBegin
{
  return self->__sessionDidBegin;
}

- (void)set_sessionDidBegin:(id)a3
{
}

- (CAPoint3D)initialLocation
{
  double x = self->_initialLocation.x;
  double y = self->_initialLocation.y;
  double z = self->_initialLocation.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialLocation:(CAPoint3D)a3
{
  self->_initialLocation = a3;
}

- (BOOL)isPreparedForLift
{
  return self->_preparedForLift;
}

- (void)setPreparedForLift:(BOOL)a3
{
  self->_preparedForLift = a3;
}

- (int64_t)invocationType
{
  return self->_invocationType;
}

- (void)setInvocationType:(int64_t)a3
{
  self->_invocationType = a3;
}

- (UITouch)initiationTouch
{
  return self->_initiationTouch;
}

- (void)setInitiationTouch:(id)a3
{
}

- (BOOL)hasBegunDrag
{
  return self->_hasBegunDrag;
}

- (void)setHasBegunDrag:(BOOL)a3
{
  self->_hasBegunDrag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiationTouch, 0);
  objc_storeStrong(&self->__sessionDidBegin, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_animations, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_animationBlocks, 0);
}

@end