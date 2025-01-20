@interface SBUIAnimationPropertyAnimator
- (BOOL)isReversed;
- (BOOL)wasReversed;
- (SBUIAnimationPropertyAnimator)initWithPropertyAnimator:(id)a3 duration:(double)a4;
- (SBUIAnimationPropertyAnimator)initWithPropertyAnimatorGenerator:(id)a3;
- (UIViewPropertyAnimator)propertyAnimator;
- (double)duration;
- (double)transitionDuration:(id)a3;
- (id)generator;
- (void)_executeGenerator:(id)a3;
- (void)addCompletion:(id)a3;
- (void)animateTransition:(id)a3;
- (void)reverseAnimation;
@end

@implementation SBUIAnimationPropertyAnimator

- (SBUIAnimationPropertyAnimator)initWithPropertyAnimatorGenerator:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBUIAnimationPropertyAnimator.m", 24, @"Invalid parameter not satisfying: %@", @"generator" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBUIAnimationPropertyAnimator;
  v6 = [(SBUIAnimationPropertyAnimator *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    id generator = v6->_generator;
    v6->_id generator = (id)v7;
  }
  return v6;
}

- (SBUIAnimationPropertyAnimator)initWithPropertyAnimator:(id)a3 duration:(double)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBUIAnimationPropertyAnimator.m", 33, @"Invalid parameter not satisfying: %@", @"animator" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SBUIAnimationPropertyAnimator;
  v9 = [(SBUIAnimationPropertyAnimator *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_propertyAnimator, a3);
    v10->_duration = a4;
  }

  return v10;
}

- (BOOL)isReversed
{
  v2 = [(SBUIAnimationPropertyAnimator *)self propertyAnimator];
  char v3 = [v2 isReversed];

  return v3;
}

- (BOOL)wasReversed
{
  return self->_reverseCount != 0;
}

- (void)reverseAnimation
{
  ++self->_reverseCount;
  id v3 = [(SBUIAnimationPropertyAnimator *)self propertyAnimator];
  objc_msgSend(v3, "setReversed:", -[SBUIAnimationPropertyAnimator isReversed](self, "isReversed") ^ 1);
}

- (void)addCompletion:(id)a3
{
  id v9 = a3;
  v4 = [(SBUIAnimationPropertyAnimator *)self propertyAnimator];

  if (v4)
  {
    id v5 = [(SBUIAnimationPropertyAnimator *)self propertyAnimator];
    [v5 addCompletion:v9];
  }
  else
  {
    completionBlocks = self->_completionBlocks;
    if (!completionBlocks)
    {
      uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v8 = self->_completionBlocks;
      self->_completionBlocks = v7;

      completionBlocks = self->_completionBlocks;
    }
    id v5 = (void *)[v9 copy];
    [(NSMutableArray *)completionBlocks addObject:v5];
  }
}

- (double)transitionDuration:(id)a3
{
  id v4 = a3;
  id v5 = [(SBUIAnimationPropertyAnimator *)self generator];

  if (v5) {
    [(SBUIAnimationPropertyAnimator *)self _executeGenerator:v4];
  }
  [(SBUIAnimationPropertyAnimator *)self duration];
  double v7 = v6;

  return v7;
}

- (void)animateTransition:(id)a3
{
  id v6 = a3;
  id v4 = [(SBUIAnimationPropertyAnimator *)self generator];

  if (v4) {
    [(SBUIAnimationPropertyAnimator *)self _executeGenerator:v6];
  }
  [(SBUIAnimationPropertyAnimator *)self prepareToRunAnimation:v6];
  id v5 = [(SBUIAnimationPropertyAnimator *)self propertyAnimator];
  [v5 startAnimation];

  self->_wasStarted = 1;
}

- (void)_executeGenerator:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_propertyAnimator)
  {
    id v6 = [(SBUIAnimationPropertyAnimator *)self generator];
    ((void (**)(void, id))v6)[2](v6, v5);
    double v7 = (UIViewPropertyAnimator *)objc_claimAutoreleasedReturnValue();
    propertyAnimator = self->_propertyAnimator;
    self->_propertyAnimator = v7;

    id v9 = self->_propertyAnimator;
    if (!v9)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"SBUIAnimationPropertyAnimator.m" lineNumber:108 description:@"SBUIAnimationPropertyAnimator needs a UIViewPropertyAnimator."];

      id v9 = self->_propertyAnimator;
    }
    [(UIViewPropertyAnimator *)v9 duration];
    self->_duration = v10;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v11 = self->_completionBlocks;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          -[UIViewPropertyAnimator addCompletion:](self->_propertyAnimator, "addCompletion:", *(void *)(*((void *)&v17 + 1) + 8 * v15++), (void)v17);
        }
        while (v13 != v15);
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (UIViewPropertyAnimator)propertyAnimator
{
  return self->_propertyAnimator;
}

- (double)duration
{
  return self->_duration;
}

- (id)generator
{
  return self->_generator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_generator, 0);
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

@end