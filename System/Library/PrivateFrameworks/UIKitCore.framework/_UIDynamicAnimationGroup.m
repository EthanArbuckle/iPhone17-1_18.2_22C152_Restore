@interface _UIDynamicAnimationGroup
- (BOOL)_animateForInterval:(double)a3;
- (NSArray)animations;
- (void)_appendSubclassDescription:(id)a3 atLevel:(int)a4;
- (void)_stopAnimation;
- (void)addAnimation:(id)a3;
- (void)dealloc;
- (void)removeAnimation:(id)a3;
- (void)runWithCompletion:(id)a3;
- (void)runWithGroupApplier:(id)a3 completion:(id)a4;
- (void)runWithGroupApplier:(id)a3 completion:(id)a4 forScreen:(id)a5 runLoopMode:(id)a6;
- (void)setAnimations:(id)a3;
@end

@implementation _UIDynamicAnimationGroup

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicAnimationGroup;
  [(_UIDynamicAnimation *)&v3 dealloc];
}

- (void)_stopAnimation
{
  self->_applier = 0;
  self->_runningAnimations = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicAnimationGroup;
  [(_UIDynamicAnimation *)&v3 _stopAnimation];
}

- (BOOL)_animateForInterval:(double)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  runningAnimations = self->_runningAnimations;
  uint64_t v6 = [(NSMutableArray *)runningAnimations countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(runningAnimations);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v11 _animateForInterval:a3])
        {
          if (!v8) {
            v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
          }
          [v8 addObject:v11];
        }
      }
      uint64_t v7 = [(NSMutableArray *)runningAnimations countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  [(NSMutableArray *)self->_runningAnimations removeObjectsInArray:v8];
  uint64_t v12 = [(NSMutableArray *)self->_runningAnimations count];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __48___UIDynamicAnimationGroup__animateForInterval___block_invoke;
  v22[3] = &unk_1E52DC558;
  v22[4] = self;
  [(_UIDynamicAnimation *)self _callAppliers:v22 additionalEndAppliers:0 done:v12 == 0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v13 = [v8 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * j) _stopAnimation];
      }
      uint64_t v14 = [v8 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v14);
  }

  return v12 == 0;
}

- (void)setAnimations:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  animations = self->_animations;
  if (animations != a3)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [(NSMutableArray *)animations countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(animations);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * i) _setGrouped:0];
        }
        uint64_t v7 = [(NSMutableArray *)animations countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = [a3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(a3);
          }
          uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * j);
          if ([v15 _isGrouped]) {
            [MEMORY[0x1E4F1CA00] raise:v13, @"%@ is already in a dynamic animation group. It must be removed before being added to another.", v15 format];
          }
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __42___UIDynamicAnimationGroup_setAnimations___block_invoke;
          v16[3] = &unk_1E52DC580;
          v16[4] = self;
          [v15 _cancelWithAppliers:v16];
          [v15 _setGrouped:1];
        }
        uint64_t v11 = [a3 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v11);
    }

    self->_animations = (NSMutableArray *)[a3 mutableCopy];
  }
}

- (void)addAnimation:(id)a3
{
  if (a3 && (-[NSMutableArray containsObject:](self->_animations, "containsObject:") & 1) == 0)
  {
    if ([a3 _isGrouped]) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is already in a dynamic animation group. It must be removed before being added to another.", a3 format];
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41___UIDynamicAnimationGroup_addAnimation___block_invoke;
    v6[3] = &unk_1E52DC580;
    v6[4] = self;
    [a3 _cancelWithAppliers:v6];
    animations = self->_animations;
    if (!animations)
    {
      animations = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
      self->_animations = animations;
    }
    [(NSMutableArray *)animations addObject:a3];
    [a3 _setGrouped:1];
    if ((*((unsigned char *)&self->super + 20) & 2) != 0) {
      [(NSMutableArray *)self->_runningAnimations addObject:a3];
    }
  }
}

- (void)removeAnimation:(id)a3
{
  if (-[NSMutableArray containsObject:](self->_animations, "containsObject:"))
  {
    [(NSMutableArray *)self->_animations removeObject:a3];
    if ((*((unsigned char *)&self->super + 20) & 2) != 0) {
      [(NSMutableArray *)self->_runningAnimations removeObject:a3];
    }
    if (![(NSMutableArray *)self->_animations count]) {

    }
    if (![(NSMutableArray *)self->_runningAnimations count]) {
    [a3 _setGrouped:0];
    }
  }
}

- (void)runWithGroupApplier:(id)a3 completion:(id)a4 forScreen:(id)a5 runLoopMode:(id)a6
{
  if (!a3 && !self->_applier) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"groupApplier must be non-nil"];
  }
  if ([(NSMutableArray *)self->_animations count])
  {
    if ((*((unsigned char *)&self->super + 20) & 2) == 0)
    {
      if (a3)
      {

        self->_applier = (id)[a3 copy];
      }

      self->_runningAnimations = (NSMutableArray *)[(NSMutableArray *)self->_animations mutableCopy];
      v12.receiver = self;
      v12.super_class = (Class)_UIDynamicAnimationGroup;
      [(_UIDynamicAnimation *)&v12 runWithCompletion:a4 forScreen:a5 runLoopMode:a6];
    }
  }
  else if (a4)
  {
    uint64_t v11 = (void (*)(id, uint64_t))*((void *)a4 + 2);
    v11(a4, 1);
  }
}

- (void)runWithGroupApplier:(id)a3 completion:(id)a4
{
}

- (void)runWithCompletion:(id)a3
{
  if (!self->_applier) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Dynamic animations without pre-set appliers must be run with an explicit applier. Use runWithValueApplier:completion:"];
  }
  [(_UIDynamicAnimationGroup *)self runWithGroupApplier:0 completion:a3];
}

- (void)_appendSubclassDescription:(id)a3 atLevel:(int)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_animations count])
  {
    [a3 appendString:@"; animations = {"];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    animations = self->_animations;
    uint64_t v8 = [(NSMutableArray *)animations countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      char v11 = 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(animations);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ((v11 & 1) == 0) {
            [a3 appendString:@","];
          }
          [v13 _appendDescriptionToString:a3 atLevel:(a4 + 1)];
          char v11 = 0;
        }
        uint64_t v9 = [(NSMutableArray *)animations countByEnumeratingWithState:&v15 objects:v19 count:16];
        char v11 = 0;
      }
      while (v9);
    }
    [a3 appendString:@"\n"];
    if (a4)
    {
      unint64_t v14 = 1;
      do
      {
        [a3 appendString:@"    "];
        ++v14;
      }
      while (v14 <= a4);
    }
    [a3 appendString:@"}"];
  }
}

- (NSArray)animations
{
  return &self->_animations->super;
}

@end