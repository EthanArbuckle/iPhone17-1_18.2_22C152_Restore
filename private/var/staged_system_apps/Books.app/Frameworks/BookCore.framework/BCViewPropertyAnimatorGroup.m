@interface BCViewPropertyAnimatorGroup
- (BOOL)isReversed;
- (BOOL)isRunning;
- (NSArray)animators;
- (double)fractionComplete;
- (int64_t)state;
- (void)addCompletion:(id)a3;
- (void)continueAnimationWithTimingParameters:(id)a3 durationFactor:(double)a4;
- (void)finishAnimationAtPosition:(int64_t)a3;
- (void)pauseAnimation;
- (void)setAnimators:(id)a3;
- (void)setFractionComplete:(double)a3;
- (void)setReversed:(BOOL)a3;
- (void)startAnimation;
- (void)startAnimationAfterDelay:(double)a3;
- (void)stopAnimation:(BOOL)a3;
@end

@implementation BCViewPropertyAnimatorGroup

- (void)setAnimators:(id)a3
{
  v5 = (NSArray *)a3;
  animators = self->_animators;
  p_animators = &self->_animators;
  if (animators != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_animators, a3);
    v5 = v8;
  }
}

- (void)finishAnimationAtPosition:(int64_t)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(BCViewPropertyAnimatorGroup *)self animators];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) finishAnimationAtPosition:a3];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)pauseAnimation
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(BCViewPropertyAnimatorGroup *)self animators];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) pauseAnimation];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)startAnimation
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(BCViewPropertyAnimatorGroup *)self animators];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) startAnimation];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)startAnimationAfterDelay:(double)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(BCViewPropertyAnimatorGroup *)self animators];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) startAnimationAfterDelay:a3];
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)stopAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(BCViewPropertyAnimatorGroup *)self animators];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) stopAnimation:v3];
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)isRunning
{
  v2 = [(BCViewPropertyAnimatorGroup *)self animators];
  BOOL v3 = [v2 objectAtIndexedSubscript:0];
  unsigned __int8 v4 = [v3 isRunning];

  return v4;
}

- (BOOL)isReversed
{
  v2 = [(BCViewPropertyAnimatorGroup *)self animators];
  BOOL v3 = [v2 objectAtIndexedSubscript:0];
  unsigned __int8 v4 = [v3 isReversed];

  return v4;
}

- (void)setReversed:(BOOL)a3
{
  BOOL v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned __int8 v4 = [(BCViewPropertyAnimatorGroup *)self animators];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setReversed:v3];
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (double)fractionComplete
{
  v2 = [(BCViewPropertyAnimatorGroup *)self animators];
  BOOL v3 = [v2 objectAtIndexedSubscript:0];
  [v3 fractionComplete];
  double v5 = v4;

  return v5;
}

- (void)setFractionComplete:(double)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = [(BCViewPropertyAnimatorGroup *)self animators];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setFractionComplete:a3];
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (int64_t)state
{
  v2 = [(BCViewPropertyAnimatorGroup *)self animators];
  BOOL v3 = [v2 objectAtIndexedSubscript:0];
  id v4 = [v3 state];

  return (int64_t)v4;
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(BCViewPropertyAnimatorGroup *)self animators];
  id v5 = [v6 objectAtIndexedSubscript:0];
  [v5 addCompletion:v4];
}

- (void)continueAnimationWithTimingParameters:(id)a3 durationFactor:(double)a4
{
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(BCViewPropertyAnimatorGroup *)self animators];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) continueAnimationWithTimingParameters:v6 durationFactor:a4];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NSArray)animators
{
  return self->_animators;
}

- (void).cxx_destruct
{
}

@end