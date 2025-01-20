@interface TSDContentAnimationGroup
- (BOOL)i_canProduceAnimation;
- (CAMediaTimingFunction)timingFunction;
- (NSArray)animations;
- (double)duration;
- (id)i_animationWithTransformBlock:(id)a3;
- (id)i_endLocation;
- (void)dealloc;
- (void)setAnimations:(id)a3;
- (void)setDuration:(double)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation TSDContentAnimationGroup

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDContentAnimationGroup;
  [(TSDContentAnimationGroup *)&v3 dealloc];
}

- (BOOL)i_canProduceAnimation
{
  return 1;
}

- (id)i_animationWithTransformBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = (void *)[MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v17 = self;
  animations = self->_animations;
  uint64_t v7 = [(NSArray *)animations countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(animations);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v11, "i_canProduceAnimation") & 1) == 0)
        {
          v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v13 = [NSString stringWithUTF8String:"-[TSDContentAnimationGroup i_animationWithTransformBlock:]"];
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContentAnimation.m"), 168, @"group shouldn't contain animations that can't produce CAAnimations");
        }
        uint64_t v14 = objc_msgSend(v11, "i_animationWithTransformBlock:", a3);
        if (v14) {
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [(NSArray *)animations countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  v15 = (void *)[MEMORY[0x263F15750] animation];
  [v15 setAnimations:v5];
  [(TSDContentAnimationGroup *)v17 duration];
  objc_msgSend(v15, "setDuration:");
  objc_msgSend(v15, "setTimingFunction:", -[TSDContentAnimationGroup timingFunction](v17, "timingFunction"));
  return v15;
}

- (id)i_endLocation
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  animations = self->_animations;
  id result = (id)[(NSArray *)animations countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v8;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v8 != v5) {
        objc_enumerationMutation(animations);
      }
      id result = (id)objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6), "i_endLocation");
      if (result) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id result = (id)[(NSArray *)animations countByEnumeratingWithState:&v7 objects:v11 count:16];
        id v4 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (NSArray)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end