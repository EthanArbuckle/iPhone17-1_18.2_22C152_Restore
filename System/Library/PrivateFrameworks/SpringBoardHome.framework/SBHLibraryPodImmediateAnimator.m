@interface SBHLibraryPodImmediateAnimator
- (SBHLibraryPodImmediateAnimator)initWithAnimationContainer:(id)a3 innerFolderController:(id)a4 searchBar:(id)a5;
- (unint64_t)_numberOfSignificantAnimations;
- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5;
- (void)_configureForFraction:(double)a3;
- (void)_prepareAnimation;
- (void)_setAnimationFraction:(double)a3;
- (void)cleanup;
@end

@implementation SBHLibraryPodImmediateAnimator

- (SBHLibraryPodImmediateAnimator)initWithAnimationContainer:(id)a3 innerFolderController:(id)a4 searchBar:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBHLibraryPodImmediateAnimator;
  v11 = [(SBIconAnimator *)&v14 initWithAnimationContainer:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_innerFolderController, a4);
    objc_storeStrong((id *)&v12->_searchBar, a5);
  }

  return v12;
}

- (void)_prepareAnimation
{
  v16.receiver = self;
  v16.super_class = (Class)SBHLibraryPodImmediateAnimator;
  [(SBIconAnimator *)&v16 _prepareAnimation];
  v3 = [(SBFolderController *)self->_innerFolderController view];
  [v3 setHidden:0];
  v4 = [(SBIconAnimator *)self animationContainer];
  v5 = [v4 containerView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v3, "setFrame:", v7, v9, v11, v13);
  [v3 setNeedsLayout];
  [v3 layoutIfNeeded];
  objc_super v14 = [(SBIconAnimator *)self animationContainer];
  v15 = [v14 containerView];
  [v15 addSubview:v3];
}

- (void)_setAnimationFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodImmediateAnimator;
  -[SBIconAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  if (!self->_animationComplete) {
    [(SBHLibraryPodImmediateAnimator *)self _configureForFraction:a3];
  }
}

- (void)_configureForFraction:(double)a3
{
  objc_super v5 = [(SBIconAnimator *)self animationContainer];
  [v5 setContentAlpha:1.0 - a3];

  [(UIView *)self->_searchBar setAlpha:1.0 - a3];
  id v6 = [(SBFolderController *)self->_innerFolderController view];
  [v6 setAlpha:a3];
}

- (unint64_t)_numberOfSignificantAnimations
{
  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodImmediateAnimator;
  return [(SBIconAnimator *)&v3 _numberOfSignificantAnimations] + 1;
}

- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5
{
  double v8 = (void (**)(id, uint64_t))a5;
  v10.receiver = self;
  v10.super_class = (Class)SBHLibraryPodImmediateAnimator;
  [(SBIconAnimator *)&v10 _animateToFraction:v8 afterDelay:a3 withSharedCompletion:a4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__SBHLibraryPodImmediateAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke;
  v9[3] = &unk_1E6AAC838;
  v9[4] = self;
  *(double *)&v9[5] = a3;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v9];
  if (v8) {
    v8[2](v8, 1);
  }
}

uint64_t __85__SBHLibraryPodImmediateAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureForFraction:*(double *)(a1 + 40)];
}

- (void)cleanup
{
  self->_animationComplete = 1;
  v2.receiver = self;
  v2.super_class = (Class)SBHLibraryPodImmediateAnimator;
  [(SBIconAnimator *)&v2 cleanup];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_innerFolderController, 0);
}

@end