@interface _UICollectionCompositionalLayoutDynamicAnimator
- (BOOL)_animatorStep:(double)a3;
- (id)behaviorForIdentifier:(id *)a1;
@end

@implementation _UICollectionCompositionalLayoutDynamicAnimator

- (id)behaviorForIdentifier:(id *)a1
{
  if (a1)
  {
    v4 = a1;
    if (!a2)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_behaviorForIdentifier_, v4, @"_UICollectionCompositionalLayoutSolver.m", 3528, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
    }
    a1 = [v4[42] objectForKeyedSubscript:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (BOOL)_animatorStep:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UICollectionCompositionalLayoutDynamicAnimator;
  BOOL v4 = [(UIDynamicAnimator *)&v7 _animatorStep:a3];
  invalidationHandler = (void (**)(id, void))self->_invalidationHandler;
  if (invalidationHandler) {
    invalidationHandler[2](invalidationHandler, 0);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemBehaviors, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end