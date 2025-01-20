@interface PUTileAnimator
- (PUTilingViewControllerTransition)currentTransition;
- (id)freezeTileController:(id)a3;
- (void)animateTileController:(id)a3 toLayoutInfo:(id)a4 withOptions:(id)a5 completionHandler:(id)a6;
- (void)prepareTileControllerForAnimation:(id)a3 withInitialLayoutInfo:(id)a4;
- (void)transitionDidBeginAnimation:(id)a3;
- (void)transitionWillBeginAnimation:(id)a3;
- (void)updateAnimationForTileController:(id)a3 withRepositionedTargetLayoutInfo:(id)a4;
@end

@implementation PUTileAnimator

- (void).cxx_destruct
{
}

- (PUTilingViewControllerTransition)currentTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTransition);
  return (PUTilingViewControllerTransition *)WeakRetained;
}

- (void)transitionDidBeginAnimation:(id)a3
{
  p_currentTransition = &self->_currentTransition;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_currentTransition);

  if (WeakRetained != v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PUTileAnimator.m", 42, @"Invalid parameter not satisfying: %@", @"transition == _currentTransition" object file lineNumber description];
  }
  objc_storeWeak((id *)p_currentTransition, 0);
}

- (void)transitionWillBeginAnimation:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTransition);

  if (WeakRetained)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PUTileAnimator.m", 37, @"Invalid parameter not satisfying: %@", @"!_currentTransition" object file lineNumber description];
  }
  objc_storeWeak((id *)&self->_currentTransition, obj);
}

- (id)freezeTileController:(id)a3
{
  return (id)[a3 freeze];
}

- (void)updateAnimationForTileController:(id)a3 withRepositionedTargetLayoutInfo:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"PUTileAnimator.m" lineNumber:26 description:@"must be implemented by concrete subclass"];
}

- (void)animateTileController:(id)a3 toLayoutInfo:(id)a4 withOptions:(id)a5 completionHandler:(id)a6
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 handleFailureInMethod:a2 object:self file:@"PUTileAnimator.m" lineNumber:22 description:@"must be implemented by concrete subclass"];
}

- (void)prepareTileControllerForAnimation:(id)a3 withInitialLayoutInfo:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"PUTileAnimator.m" lineNumber:18 description:@"must be implemented by concrete subclass"];
}

@end