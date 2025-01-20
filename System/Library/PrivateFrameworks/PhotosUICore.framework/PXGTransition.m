@interface PXGTransition
- (BOOL)animatingTowardsFinalState;
- (BOOL)animatingTowardsInitialState;
- (BOOL)invalid;
- (BOOL)isIntercative;
- (NSSet)animations;
- (PXGLayout)layout;
- (PXGTransition)initWithAnimations:(id)a3 layout:(id)a4;
- (float)fractionCompleted;
- (id)completionBlock;
- (void)animateToFinalStateWithCompletionBlock:(id)a3;
- (void)animateToInitialStateWithCompletionBlock:(id)a3;
- (void)invalidate;
- (void)setFractionCompleted:(float)a3;
- (void)setIsIntercative:(BOOL)a3;
@end

@implementation PXGTransition

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

- (void)setIsIntercative:(BOOL)a3
{
  self->_isIntercative = a3;
}

- (BOOL)isIntercative
{
  return self->_isIntercative;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (BOOL)animatingTowardsFinalState
{
  return self->_animatingTowardsFinalState;
}

- (BOOL)animatingTowardsInitialState
{
  return self->_animatingTowardsInitialState;
}

- (BOOL)invalid
{
  return self->_invalid;
}

- (PXGLayout)layout
{
  return self->_layout;
}

- (float)fractionCompleted
{
  return self->_fractionCompleted;
}

- (NSSet)animations
{
  return self->_animations;
}

- (void)setFractionCompleted:(float)a3
{
  if (self->_invalid)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXGTransition.m", 49, @"Invalid parameter not satisfying: %@", @"!_invalid" object file lineNumber description];
  }
  if (!self->_animatingTowardsFinalState && !self->_animatingTowardsInitialState) {
    self->_fractionCompleted = a3;
  }
}

- (void)animateToFinalStateWithCompletionBlock:(id)a3
{
  *(_WORD *)&self->_animatingTowardsInitialState = 256;
  v4 = (void *)[a3 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v4;
}

- (void)animateToInitialStateWithCompletionBlock:(id)a3
{
  *(_WORD *)&self->_animatingTowardsInitialState = 1;
  v4 = (void *)[a3 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v4;
}

- (void)invalidate
{
  self->_invalid = 1;
}

- (PXGTransition)initWithAnimations:(id)a3 layout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXGTransition;
  v9 = [(PXGTransition *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_animations, a3);
    objc_storeStrong((id *)&v10->_layout, a4);
    v10->_isIntercative = 1;
  }

  return v10;
}

@end