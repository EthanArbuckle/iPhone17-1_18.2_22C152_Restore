@interface SFTransitionCoordinator
- (BOOL)isTransition;
- (BOOL)requiresKeyframeAnimations;
- (SFTransitionCoordinator)initWithAnimations:(id)a3 completion:(id)a4;
- (UIViewSpringAnimationBehaviorDescribing)springAnimationBehavior;
- (void)addAnimation:(uint64_t)a1;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)addKeyframeWithRelativeStartTime:(double)a3 relativeDuration:(double)a4 animations:(id)a5;
- (void)addRetargetableAnimations:(id)a3;
- (void)disableKeyframeAnimations;
- (void)invokeAnimations;
- (void)invokeCompletion;
- (void)performTransitionWithAnimation:(BOOL)a3 inContextOfContainerView:(id)a4;
- (void)setSpringAnimationBehavior:(id)a3;
@end

@implementation SFTransitionCoordinator

- (SFTransitionCoordinator)initWithAnimations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SFTransitionCoordinator;
  v8 = [(SFTransitionCoordinator *)&v18 init];
  if (v8)
  {
    if (v6)
    {
      v9 = -[SFTransitionCoordinatorBasicAnimation initWithAnimations:]([SFTransitionCoordinatorBasicAnimation alloc], v6);
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v9, 0);
      animations = v8->_animations;
      v8->_animations = (NSMutableArray *)v10;
    }
    if (v7)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v13 = _Block_copy(v7);
      uint64_t v14 = objc_msgSend(v12, "initWithObjects:", v13, 0);
      completionBlocks = v8->_completionBlocks;
      v8->_completionBlocks = (NSMutableArray *)v14;
    }
    v16 = v8;
  }

  return v8;
}

- (void)addAnimation:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v6 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)invokeAnimations
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = self->_animations;
  animations = self->_animations;
  self->_animations = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "invokeInContext:", self, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)invokeCompletion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = self->_completionBlocks;
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)performTransitionWithAnimation:(BOOL)a3 inContextOfContainerView:(id)a4
{
  if (a3)
  {
    id v5 = dispatch_group_create();
    uint64_t v6 = (void *)[(NSMutableArray *)self->_animations mutableCopy];
    animations = self->_animations;
    self->_animations = 0;

    while ([v6 count])
    {
      uint64_t v8 = [v6 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke;
      v32[3] = &__block_descriptor_33_e51_B32__0___SFTransitionCoordinatorAnimation__8Q16_B24l;
      char v33 = isKindOfClass & 1;
      uint64_t v10 = [v6 indexOfObjectPassingTest:v32];
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v10 = [v6 count];
      }
      long long v11 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v10);
      long long v12 = [v6 objectsAtIndexes:v11];
      [v6 removeObjectsAtIndexes:v11];
      dispatch_group_enter(v5);
      if (isKindOfClass)
      {
        long long v13 = (void *)MEMORY[0x1E4FB1EB0];
        uint64_t v14 = [(SFTransitionCoordinator *)self springAnimationBehavior];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_2;
        v30[3] = &unk_1E54E9A60;
        v31[0] = v12;
        v31[1] = self;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_3;
        v28[3] = &unk_1E54ECC78;
        v29 = v5;
        [v13 _animateUsingSpringBehavior:v14 tracking:0 animations:v30 completion:v28];

        uint64_t v15 = (id *)&v29;
        v16 = (id *)v31;
      }
      else
      {
        BOOL v17 = [(SFTransitionCoordinator *)self requiresKeyframeAnimations];
        objc_super v18 = (void *)MEMORY[0x1E4FB1EB0];
        if (v17)
        {
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_4;
          v26[3] = &unk_1E54E9A60;
          v27[0] = v12;
          v27[1] = self;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_5;
          v24[3] = &unk_1E54E9998;
          v25 = v5;
          [v18 animateKeyframesWithDuration:327682 delay:v26 options:v24 animations:0.33 completion:0.0];
          uint64_t v15 = (id *)&v25;
          v16 = (id *)v27;
        }
        else
        {
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_6;
          v22[3] = &unk_1E54E9A60;
          v23[0] = v12;
          v23[1] = self;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_7;
          v20[3] = &unk_1E54E9998;
          v21 = v5;
          objc_msgSend(v18, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 2, v22, v20);
          uint64_t v15 = (id *)&v21;
          v16 = (id *)v23;
        }
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_8;
    block[3] = &unk_1E54E9858;
    block[4] = self;
    dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
  }
  else
  {
    self->_keyframeAnimationMode = 2;
    [(SFTransitionCoordinator *)self invokeAnimations];
    [(SFTransitionCoordinator *)self invokeCompletion];
  }
}

BOOL __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return *(unsigned char *)(a1 + 32) != (isKindOfClass & 1);
}

void __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "invokeInContext:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_3(uint64_t a1)
{
}

void __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "invokeInContext:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_5(uint64_t a1)
{
}

void __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_6(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "invokeInContext:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_7(uint64_t a1)
{
}

uint64_t __83__SFTransitionCoordinator_performTransitionWithAnimation_inContextOfContainerView___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeCompletion];
}

- (UIViewSpringAnimationBehaviorDescribing)springAnimationBehavior
{
  overrideSpringAnimationBehavior = self->_overrideSpringAnimationBehavior;
  if (overrideSpringAnimationBehavior)
  {
    uint64_t v3 = overrideSpringAnimationBehavior;
  }
  else
  {
    if ([(SFTransitionCoordinator *)self requiresKeyframeAnimations]) {
      double v4 = 0.28;
    }
    else {
      double v4 = 0.34;
    }
    uint64_t v3 = [MEMORY[0x1E4FB1EE0] behaviorWithDampingRatio:1.0 response:v4];
  }

  return v3;
}

- (void)setSpringAnimationBehavior:(id)a3
{
}

- (BOOL)requiresKeyframeAnimations
{
  return self->_keyframeAnimationMode == 1;
}

- (void)disableKeyframeAnimations
{
  self->_keyframeAnimationMode = 2;
}

- (void)addAnimations:(id)a3
{
  double v4 = off_1E54E86F8;
  if (self->_overrideSpringAnimationBehavior) {
    double v4 = off_1E54E8700;
  }
  uint64_t v5 = (objc_class *)*v4;
  id v6 = a3;
  long long v7 = -[SFTransitionCoordinatorBasicAnimation initWithAnimations:]([v5 alloc], v6);

  -[SFTransitionCoordinator addAnimation:]((uint64_t)self, v7);
}

- (void)addKeyframeWithRelativeStartTime:(double)a3 relativeDuration:(double)a4 animations:(id)a5
{
  if (!self->_keyframeAnimationMode) {
    self->_keyframeAnimationMode = 1;
  }
  id v8 = a5;
  long long v9 = -[SFTransitionCoordinatorKeyframeAnimation initWithStartTime:duration:animations:]([SFTransitionCoordinatorKeyframeAnimation alloc], v8, a3, a4);

  -[SFTransitionCoordinator addAnimation:]((uint64_t)self, v9);
}

- (void)addRetargetableAnimations:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[SFTransitionCoordinatorBasicAnimation initWithAnimations:]([SFTransitionCoordinatorRetargetableAnimation alloc], v4);

  -[SFTransitionCoordinator addAnimation:]((uint64_t)self, v5);
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  completionBlocks = self->_completionBlocks;
  aBlock = v4;
  if (!completionBlocks)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v7 = self->_completionBlocks;
    self->_completionBlocks = v6;

    id v4 = aBlock;
    completionBlocks = self->_completionBlocks;
  }
  id v8 = _Block_copy(v4);
  [(NSMutableArray *)completionBlocks addObject:v8];
}

- (BOOL)isTransition
{
  return self->_isTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideSpringAnimationBehavior, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);

  objc_storeStrong((id *)&self->_animations, 0);
}

@end