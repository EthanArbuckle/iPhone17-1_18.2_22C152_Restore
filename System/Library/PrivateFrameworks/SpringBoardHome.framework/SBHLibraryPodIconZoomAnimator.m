@interface SBHLibraryPodIconZoomAnimator
- (CGPoint)_centerOfMiniPodIconViews;
- (SBFolderIcon)targetIcon;
- (SBHLibraryPodIconZoomAnimator)initWithAnimationContainer:(id)a3 innerFolderController:(id)a4 folderIcon:(id)a5 searchBar:(id)a6 libraryViewController:(id)a7;
- (SBIconView)targetIconView;
- (double)_scaleForZoomFraction:(double)a3;
- (id)referenceIconView;
- (unint64_t)_numberOfSignificantAnimations;
- (void)_animateIconViewTransformsAndAlphaForZoomFraction:(double)a3 withAnimationSettings:(id)a4 delay:(double)a5 completion:(id)a6;
- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5;
- (void)_cancelAnimationForIconViewClippedOrObscured;
- (void)_captureVisibleAndMiniPodIconViews;
- (void)_cleanupAnimation;
- (void)_cleanupMiniPodIconViewsAfterCrossfade;
- (void)_handleIconViewClippedNotification:(id)a3;
- (void)_handleIconZoomNotification:(id)a3;
- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7;
- (void)_prepareAnimation;
- (void)_prepareToCrossfadeMiniPodIconViews;
- (void)_removeMatchMoveAnimation;
- (void)_returnFolderAndLibraryScalingViews;
- (void)_setAnimationFraction:(double)a3;
- (void)_setupFolderAndLibraryScalingViews;
- (void)_setupMatchMoveAnimation;
- (void)_updateFolderNavigationBarAlphaForZoomFraction:(double)a3;
- (void)_updateFolderViewFramesForZoomFraction:(double)a3;
- (void)_updateIconCrossfadeForZoomFraction:(double)a3;
- (void)_updateLibraryAlphaForZoomFraction:(double)a3;
- (void)_updateLibraryScaleForZoomFraction:(double)a3;
- (void)_updateSearchBarAlphaForZoomFraction:(double)a3;
- (void)_updateSearchBarForZoomFraction:(double)a3;
- (void)_updateVisibleIconViewsPointerAllowed:(BOOL)a3;
- (void)cleanup;
- (void)dealloc;
@end

@implementation SBHLibraryPodIconZoomAnimator

- (SBHLibraryPodIconZoomAnimator)initWithAnimationContainer:(id)a3 innerFolderController:(id)a4 folderIcon:(id)a5 searchBar:(id)a6 libraryViewController:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  v17 = [(SBIconZoomAnimator *)&v21 initWithAnimationContainer:a3];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_targetIcon, a5);
    objc_storeStrong((id *)&v18->_folderController, a4);
    objc_storeWeak((id *)&v18->_libraryViewController, v16);
    objc_storeStrong((id *)&v18->_searchBar, a6);
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v18 selector:sel__handleIconViewClippedNotification_ name:@"SBHScrollableContainerDidScrollHiddenIconViewOutsideClippingBoundsNotification" object:0];
    [v19 addObserver:v18 selector:sel__handleIconZoomNotification_ name:@"SBIconZoomExpansionAnimationWillBeginNotification" object:0];
  }
  return v18;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBIconZoomExpansionAnimationWillBeginNotification" object:0];
  [v3 removeObserver:self name:@"SBHScrollableContainerDidScrollHiddenIconViewOutsideClippingBoundsNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  [(SBIconZoomAnimator *)&v4 dealloc];
}

- (id)referenceIconView
{
  return [(SBIconZoomAnimator *)self iconViewForIcon:self->_targetIcon];
}

- (void)cleanup
{
  self->_animationComplete = 1;
  v2.receiver = self;
  v2.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  [(SBIconAnimator *)&v2 cleanup];
}

- (void)_prepareAnimation
{
  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  [(SBIconZoomAnimator *)&v5 _prepareAnimation];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryViewController);
  [WeakRetained addObserver:self];

  objc_super v4 = [(SBHLibraryPodIconZoomAnimator *)self referenceIconView];
  [v4 setIconGridImageAlpha:0.0];

  [(SBHLibraryPodIconZoomAnimator *)self _setupFolderAndLibraryScalingViews];
  [(SBHLibraryPodIconZoomAnimator *)self _captureVisibleAndMiniPodIconViews];
  [(SBHLibraryPodIconZoomAnimator *)self _prepareToCrossfadeMiniPodIconViews];
  [(SBHLibraryPodIconZoomAnimator *)self _updateVisibleIconViewsPointerAllowed:0];
}

- (void)_setAnimationFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  -[SBIconZoomAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  if (!self->_animationComplete)
  {
    [(SBHLibraryPodIconZoomAnimator *)self _updateIconCrossfadeForZoomFraction:a3];
    [(SBHLibraryPodIconZoomAnimator *)self _updateFolderNavigationBarAlphaForZoomFraction:a3];
    [(SBHLibraryPodIconZoomAnimator *)self _updateLibraryAlphaForZoomFraction:a3];
    [(SBHLibraryPodIconZoomAnimator *)self _updateFolderViewFramesForZoomFraction:a3];
    [(SBHLibraryPodIconZoomAnimator *)self _updateLibraryScaleForZoomFraction:a3];
    [(SBHLibraryPodIconZoomAnimator *)self _updateSearchBarForZoomFraction:a3];
    [(SBHLibraryPodIconZoomAnimator *)self _updateSearchBarAlphaForZoomFraction:a3];
    [(SBHLibraryPodIconZoomAnimator *)self _animateIconViewTransformsAndAlphaForZoomFraction:0 withAnimationSettings:0 delay:a3 completion:0.0];
  }
}

- (void)_cleanupAnimation
{
  v3 = [(SBHLibraryPodIconZoomAnimator *)self referenceIconView];
  [v3 setAllowsProgressState:1];
  [v3 setIconGridImageAlpha:1.0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryViewController);
  [WeakRetained removeObserver:self];

  [(SBHLibraryPodIconZoomAnimator *)self _updateSearchBarForZoomFraction:0.0];
  [(SBHLibraryPodIconZoomAnimator *)self _returnFolderAndLibraryScalingViews];
  [(SBHLibraryPodIconZoomAnimator *)self _cleanupMiniPodIconViewsAfterCrossfade];
  [(SBHLibraryPodIconZoomAnimator *)self _updateVisibleIconViewsPointerAllowed:1];
  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  [(SBIconZoomAnimator *)&v5 _cleanupAnimation];
}

- (unint64_t)_numberOfSignificantAnimations
{
  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  return [(SBIconZoomAnimator *)&v3 _numberOfSignificantAnimations] + 5;
}

- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5
{
  id v8 = a5;
  if (BSFloatIsZero() && ![(SBIconAnimator *)self invalidated])
  {
    v9 = [(SBHLibraryPodIconZoomAnimator *)self referenceIconView];
    if (v9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryViewController);
      [WeakRetained noteIconViewWillZoomDown:v9];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  [(SBIconZoomAnimator *)&v11 _animateToFraction:v8 afterDelay:a3 withSharedCompletion:a4];
}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  BOOL v7 = a6;
  v35.receiver = self;
  v35.super_class = (Class)SBHLibraryPodIconZoomAnimator;
  id v12 = a7;
  [(SBIconZoomAnimator *)&v35 _performAnimationToFraction:a4 withCentralAnimationSettings:v7 delay:v12 alreadyAnimating:a3 sharedCompletion:a5];
  if (BSFloatIsZero()) {
    [(SBHLibraryPodIconZoomAnimator *)self _setupMatchMoveAnimation];
  }
  else {
    [(SBHLibraryPodIconZoomAnimator *)self _removeMatchMoveAnimation];
  }
  id v13 = [(SBHLibraryPodIconZoomAnimator *)self referenceIconView];
  if (BSFloatIsZero()) {
    [v13 setAllowsProgressState:0];
  }
  if ((BSFloatIsOne() & 1) != 0 || BSFloatIsZero())
  {
    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"SBIconZoomExpansionAnimationWillBeginNotification" object:self];
  }
  [v13 setIconGridImageAlpha:0.0];
  [(UIView *)self->_folderScalingView setHidden:0];
  id v15 = [(SBHLibraryPodFolderView *)self->_folderView podScrollView];
  [v15 contentOffset];
  objc_msgSend(v15, "_setContentOffsetPinned:animated:", 0);
  id v16 = [(SBIconAnimator *)self settings];
  v17 = v16;
  if (v7)
  {
    a5 = 0.0;
    uint64_t v18 = 6;
  }
  else
  {
    uint64_t v18 = 2;
  }
  v19 = (void *)MEMORY[0x1E4F4F898];
  v20 = [v16 crossfadeSettings];
  objc_super v21 = [v20 BSAnimationSettings];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
  v34[3] = &unk_1E6AAC838;
  v34[4] = self;
  *(double *)&v34[5] = a3;
  [v19 animateWithSettings:v21 options:v18 actions:v34 completion:v12];

  v22 = (void *)MEMORY[0x1E4F4F898];
  v23 = [v17 innerFolderFadeSettings];
  v24 = [v23 BSAnimationSettings];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2;
  v33[3] = &unk_1E6AAC838;
  v33[4] = self;
  *(double *)&v33[5] = a3;
  [v22 animateWithSettings:v24 options:v18 actions:v33 completion:v12];

  v25 = (void *)MEMORY[0x1E4F4F898];
  v26 = [v17 outerFolderFadeSettings];
  v27 = [v26 BSAnimationSettings];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3;
  v32[3] = &unk_1E6AAC838;
  v32[4] = self;
  *(double *)&v32[5] = a3;
  [v25 animateWithSettings:v27 options:v18 actions:v32 completion:v12];

  v28 = (void *)MEMORY[0x1E4F4F898];
  v29 = [v17 centralAnimationSettings];
  v30 = [v29 BSAnimationSettings];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4;
  v31[3] = &unk_1E6AAC838;
  v31[4] = self;
  *(double *)&v31[5] = a3;
  [v28 animateWithSettings:v30 options:v18 actions:v31 completion:v12];

  [(SBHLibraryPodIconZoomAnimator *)self _animateIconViewTransformsAndAlphaForZoomFraction:v17 withAnimationSettings:v12 delay:a3 completion:a5];
  [(UIView *)self->_folderScalingView setUserInteractionEnabled:BSFloatIsZero() ^ 1];
}

uint64_t __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateIconCrossfadeForZoomFraction:*(double *)(a1 + 40)];
}

uint64_t __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFolderNavigationBarAlphaForZoomFraction:*(double *)(a1 + 40)];
}

uint64_t __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLibraryAlphaForZoomFraction:*(double *)(a1 + 40)];
  objc_super v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  return [v2 _updateSearchBarAlphaForZoomFraction:v3];
}

uint64_t __130__SBHLibraryPodIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateFolderViewFramesForZoomFraction:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateLibraryScaleForZoomFraction:*(double *)(a1 + 40)];
  objc_super v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  return [v2 _updateSearchBarForZoomFraction:v3];
}

- (CGPoint)_centerOfMiniPodIconViews
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  objc_super v2 = self->_miniPodIconViews;
  if ([(NSArray *)v2 count])
  {
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    BOOL v7 = v2;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v11), "frame", (void)v22);
          v31.origin.CGFloat x = v12;
          v31.origin.CGFloat y = v13;
          v31.size.CGFloat width = v14;
          v31.size.CGFloat height = v15;
          v29.origin.CGFloat x = x;
          v29.origin.CGFloat y = y;
          v29.size.CGFloat width = width;
          v29.size.CGFloat height = height;
          CGRect v30 = CGRectUnion(v29, v31);
          CGFloat x = v30.origin.x;
          CGFloat y = v30.origin.y;
          CGFloat width = v30.size.width;
          CGFloat height = v30.size.height;
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    UIRectGetCenter();
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DAD8];
    double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v20 = v17;
  double v21 = v19;
  result.CGFloat y = v21;
  result.CGFloat x = v20;
  return result;
}

- (double)_scaleForZoomFraction:(double)a3
{
  objc_super v5 = [(SBHLibraryPodIconZoomAnimator *)self referenceIconView];
  v6 = [(NSArray *)self->_miniPodIconViews firstObject];
  if (v6)
  {
    [v5 frameForMiniIconAtIndex:0];
    double v8 = v7;
    [v6 iconImageSize];
    double v10 = a3 + (1.0 - a3) * (v8 / v9);
  }
  else
  {
    double v10 = 0.4;
  }

  return v10;
}

- (void)_updateIconCrossfadeForZoomFraction:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v4 = self->_miniPodIconViews;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    double v8 = 1.0 - a3;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setCrossfadeFraction:", v8, (void)v10);
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_updateFolderNavigationBarAlphaForZoomFraction:(double)a3
{
  id v4 = [(SBHLibraryPodFolderView *)self->_folderView navigationBar];
  [v4 setAlpha:a3];
}

- (void)_animateIconViewTransformsAndAlphaForZoomFraction:(double)a3 withAnimationSettings:(id)a4 delay:(double)a5 completion:(id)a6
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v77 = a4;
  id v66 = a6;
  long long v10 = dispatch_group_create();
  long long v11 = self->_visibleIconViews;
  v76 = self->_miniPodIconViews;
  long long v12 = [(SBHLibraryPodIconZoomAnimator *)self referenceIconView];
  double v75 = a3;
  [(SBHLibraryPodIconZoomAnimator *)self _scaleForZoomFraction:a3];
  double v69 = v13;
  v70 = self;
  [(SBHLibraryPodIconZoomAnimator *)self _centerOfMiniPodIconViews];
  double v15 = v14;
  double v17 = v16;
  v71 = v12;
  [v12 iconImageSize];
  BSRectWithSize();
  UIRectGetCenter();
  double v67 = v19;
  double v68 = v18;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  double v20 = v11;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v88 objects:v93 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v89;
    double v24 = 1.79769313e308;
    double v25 = 2.22507386e-308;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v89 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v88 + 1) + 8 * i) center];
        double v29 = hypot(v15 - v27, v17 - v28);
        if (v29 > v25) {
          double v25 = v29;
        }
        if (v29 < v24) {
          double v24 = v29;
        }
      }
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v88 objects:v93 count:16];
    }
    while (v22);
  }
  else
  {
    double v24 = 1.79769313e308;
    double v25 = 2.22507386e-308;
  }

  CGRect v30 = [v77 innerFolderEdgeZoomSettings];
  CGRect v31 = [v77 innerFolderCenterZoomSettings];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = v20;
  uint64_t v32 = [(NSArray *)obj countByEnumeratingWithState:&v84 objects:v92 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v85;
    double v74 = 1.0 - v75;
    double v73 = v15;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v85 != v34) {
          objc_enumerationMutation(obj);
        }
        v36 = *(void **)(*((void *)&v84 + 1) + 8 * j);
        [v36 center];
        double v39 = v15 - v37;
        double v40 = v17 - v38;
        if (v77)
        {
          long double v41 = (hypot(v15 - v37, v17 - v38) - v24) / (v25 - v24);
          v42 = (void *)[v30 copy];
          [v31 mass];
          double v44 = v43;
          [v30 mass];
          [v42 setMass:(double)(v41 * v45 + (1.0 - v41) * v44)];
          [v31 stiffness];
          double v47 = v46;
          [v30 stiffness];
          [v42 setStiffness:(double)(v41 * v48 + (1.0 - v41) * v47)];
          [v31 damping];
          double v50 = v49;
          [v30 damping];
          [v42 setDamping:(double)(v41 * v51 + (1.0 - v41) * v50)];
          [v31 delay];
          double v53 = v52;
          [v30 delay];
          [v42 setDelay:(double)(v41 * v54 + (1.0 - v41) * v53)];
          v55 = (void *)MEMORY[0x1E4F4F898];
          v56 = [v42 BSAnimationSettings];
          v57 = [v55 factoryWithSettings:v56];
        }
        else
        {
          v57 = 0;
        }
        uint64_t v58 = [(NSArray *)v76 indexOfObject:v36];
        if (v58 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v83[0] = MEMORY[0x1E4F143A8];
          v83[1] = 3221225472;
          v83[2] = __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke;
          v83[3] = &unk_1E6AB20D0;
          *(double *)&v83[5] = v75;
          *(double *)&v83[6] = v74 * v39;
          *(double *)&v83[7] = v74 * v40;
          v83[4] = v36;
          v59 = v83;
        }
        else
        {
          uint64_t v60 = v58;
          [v71 frameForMiniIconAtIndex:v58];
          UIRectGetCenter();
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke_2;
          aBlock[3] = &unk_1E6AAEE98;
          *(double *)&aBlock[6] = v74 * (v39 - (v68 - v61) / v69);
          *(double *)&aBlock[7] = v74 * (v40 - (v67 - v62) / v69);
          *(double *)&aBlock[8] = v75;
          aBlock[9] = v60;
          aBlock[4] = v36;
          aBlock[5] = v70;
          v59 = aBlock;
        }
        v63 = _Block_copy(v59);
        double v15 = v73;
        if (v63)
        {
          dispatch_group_enter(v10);
          v64 = (void *)MEMORY[0x1E4F4F898];
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke_3;
          v80[3] = &unk_1E6AACAB8;
          v81 = v10;
          [v64 animateWithFactory:v57 additionalDelay:6 options:v63 actions:v80 completion:a5 + 0.0];
        }
      }
      uint64_t v33 = [(NSArray *)obj countByEnumeratingWithState:&v84 objects:v92 count:16];
    }
    while (v33);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke_4;
  block[3] = &unk_1E6AAD4C8;
  id v79 = v66;
  id v65 = v66;
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], block);
}

uint64_t __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke(uint64_t a1)
{
  CGFloat v2 = *(double *)(a1 + 48);
  CGFloat v3 = *(double *)(a1 + 40) + (1.0 - *(double *)(a1 + 40)) * 0.1;
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformMakeTranslation(&v7, v2, *(CGFloat *)(a1 + 56));
  CGAffineTransform v5 = v7;
  CGAffineTransformScale(&v6, &v5, v3, v3);
  CGAffineTransform v7 = v6;
  [*(id *)(a1 + 32) setTransform:&v6];
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
  return [*(id *)(a1 + 32) setIconLabelAlpha:*(double *)(a1 + 40)];
}

void __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke_2(uint64_t a1)
{
  memset(&v5, 0, sizeof(v5));
  CGAffineTransformMakeTranslation(&v5, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  CGFloat v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  [*(id *)(a1 + 32) setIconLabelAlpha:*(double *)(a1 + 64)];
  if (!*(void *)(a1 + 72))
  {
    CGFloat v3 = [*(id *)(*(void *)(a1 + 40) + 168) navigationBar];
    CGAffineTransform v4 = v5;
    [v3 setTransform:&v4];
  }
}

void __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke_3(uint64_t a1)
{
}

uint64_t __122__SBHLibraryPodIconZoomAnimator__animateIconViewTransformsAndAlphaForZoomFraction_withAnimationSettings_delay_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)_updateFolderViewFramesForZoomFraction:(double)a3
{
  CGAffineTransform v5 = self->_miniPodIconViews;
  CGAffineTransform v6 = [(SBHLibraryPodIconZoomAnimator *)self referenceIconView];
  matchMoveWrapperView = self->_matchMoveWrapperView;
  double v8 = [(SBIconAnimator *)self animationContainer];
  uint64_t v9 = [v8 containerView];
  [v9 bounds];
  -[UIView setBounds:](matchMoveWrapperView, "setBounds:");

  [(UIView *)self->_folderScalingView bounds];
  UIRectGetCenter();
  double v11 = v10;
  double v13 = v12;
  double v14 = [v6 superview];
  [v6 center];
  objc_msgSend(v14, "convertPoint:toView:", self->_libraryScalingView);

  double v15 = 1.0 - a3;
  [v6 iconImageSize];
  [(UIView *)self->_folderScalingView bounds];
  folderClippingView = self->_folderClippingView;
  BSRectWithSize();
  BSRectCenteredAboutPoint();
  -[UIView setFrame:](folderClippingView, "setFrame:");
  [v6 iconImageInfo];
  [(UIView *)self->_folderClippingView _setContinuousCornerRadius:a3 * 0.0 + (1.0 - a3) * v17];
  double v18 = [(NSArray *)v5 firstObject];
  [(SBHLibraryPodIconZoomAnimator *)self _centerOfMiniPodIconViews];
  double v20 = v19;
  double v22 = v21;
  [(SBHLibraryPodIconZoomAnimator *)self _scaleForZoomFraction:a3];
  double v24 = v23;
  folderScalingView = self->_folderScalingView;
  CGAffineTransformMakeScale(&v35, v23, v23);
  [(UIView *)folderScalingView setTransform:&v35];
  [(UIView *)self->_folderClippingView bounds];
  UIRectGetCenter();
  double v27 = v26;
  double v29 = v28;
  if (v18)
  {
    CGRect v30 = [v18 superview];
    objc_msgSend(v30, "convertPoint:toView:", self->_folderScalingView, v20, v22);
    double v32 = v31;
    double v34 = v33;
  }
  else
  {
    double v32 = *MEMORY[0x1E4F1DAD8];
    double v34 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  -[UIView setCenter:](self->_folderScalingView, "setCenter:", v27 + v24 * (v11 - v32) * v15, v29 + v24 * (v13 - v34) * v15);
}

- (void)_updateLibraryScaleForZoomFraction:(double)a3
{
  libraryScalingView = self->_libraryScalingView;
  CGAffineTransformMakeScale(&v4, 1.0 - a3 + a3 * 0.8, 1.0 - a3 + a3 * 0.8);
  [(UIView *)libraryScalingView setTransform:&v4];
}

- (void)_updateSearchBarForZoomFraction:(double)a3
{
  CGFloat v4 = 1.0 - a3 + a3 * 0.8;
  CGAffineTransform v5 = [(UIView *)self->_searchBar superview];
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v4, v4);
  [(UIView *)self->_searchBar center];
  double v7 = v6;
  double v9 = v8;
  [v5 center];
  CGAffineTransform v13 = v15;
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformTranslate(&v14, &v13, (1.0 - v4) * (v10 - v7), (1.0 - v4) * (v11 - v9));
  searchBar = self->_searchBar;
  CGAffineTransform v13 = v14;
  [(UIView *)searchBar setTransform:&v13];
}

- (void)_updateSearchBarAlphaForZoomFraction:(double)a3
{
}

- (void)_updateLibraryAlphaForZoomFraction:(double)a3
{
  id v4 = [(SBIconAnimator *)self animationContainer];
  [v4 setContentAlpha:1.0 - a3];
}

- (void)_setupFolderAndLibraryScalingViews
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CGAffineTransform v5 = NSStringFromSelector(a1);
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  double v9 = v5;
  __int16 v10 = 2114;
  double v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  CGAffineTransform v15 = @"SBHLibraryPodIconZoomAnimator.m";
  __int16 v16 = 1024;
  int v17 = 449;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D7F0A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)_returnFolderAndLibraryScalingViews
{
  [(UIView *)self->_libraryScalingView _setSafeAreaInsetsFrozen:0];
  [(UIView *)self->_folderScalingView _setSafeAreaInsetsFrozen:0];
  CGFloat v3 = [(SBIconAnimator *)self animationContainer];
  [v3 returnScalingView];

  libraryScalingView = self->_libraryScalingView;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v5;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)libraryScalingView setTransform:v8];
  double v6 = self->_libraryScalingView;
  self->_libraryScalingView = 0;

  [(UIView *)self->_folderScalingView setUserInteractionEnabled:1];
  [(UIView *)self->_folderScalingView setHidden:0];
  [(SBFolderView *)self->_folderView returnScalingView];
  folderScalingView = self->_folderScalingView;
  self->_folderScalingView = 0;

  [(SBHLibraryPodIconZoomAnimator *)self _removeMatchMoveAnimation];
  [(UIView *)self->_matchMoveWrapperView removeFromSuperview];
  [(UIView *)self->_folderClippingView removeFromSuperview];
}

- (void)_captureVisibleAndMiniPodIconViews
{
  CGFloat v3 = [(SBIconAnimator *)self animationContainer];
  id v4 = [v3 containerView];

  [v4 layoutIfNeeded];
  long long v5 = [(SBFolderController *)self->_folderController currentIconListView];
  [v4 bounds];
  double v50 = v4;
  objc_msgSend(v5, "convertRect:fromView:", v4);
  uint64_t v6 = objc_msgSend(v5, "gridRangeForRect:");
  int v8 = v7;
  double v9 = [v5 gridCellInfo];
  unsigned __int16 v10 = [v9 gridSize];
  double v48 = self;
  double v11 = [(SBHLibraryPodIconZoomAnimator *)self referenceIconView];
  unint64_t v12 = [v11 visibleMiniIconCount];
  double v47 = v11;
  uint64_t v13 = [v11 icon];
  __int16 v14 = [v13 folder];
  CGAffineTransform v15 = [v14 icons];
  unint64_t v16 = [v15 count];

  if (v12 >= v16) {
    unint64_t v17 = v16;
  }
  else {
    unint64_t v17 = v12;
  }
  __int16 v18 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v19 = v8 & 0xFFFF0000 | 1;
  uint64_t v20 = v6 + (unsigned __int16)v8 - 1;
  unint64_t v21 = SBHIconGridRangeCellIndexForCorner(v6, v8, 1, v10);
  unint64_t v22 = SBHIconGridRangeCellIndexForCorner(v6, v8, 2, v10);
  uint64_t v23 = objc_msgSend(v9, "indexOfLastUsedGridCellInGridRange:", v6, v19);
  double v49 = v9;
  double v24 = v9;
  double v25 = v5;
  uint64_t v26 = objc_msgSend(v24, "indexOfLastUsedGridCellInGridRange:", v20, v19);
  if (v23 == v21) {
    unint64_t v27 = v21 + 1;
  }
  else {
    unint64_t v27 = v23;
  }
  if (v26 == v22) {
    unint64_t v28 = v22 - 1;
  }
  else {
    unint64_t v28 = v26;
  }
  unint64_t v29 = SBIconCoordinateMakeWithGridCellIndex(v21, v10);
  double v31 = objc_msgSend(v25, "iconViewForCoordinate:", v29, v30);
  if (v31) {
    [(NSArray *)v18 addObject:v31];
  }
  if (v17 >= 2)
  {
    unint64_t v32 = SBIconCoordinateMakeWithGridCellIndex(v22, v10);
    double v34 = objc_msgSend(v25, "iconViewForCoordinate:", v32, v33);
    if (v34) {
      [(NSArray *)v18 addObject:v34];
    }

    if (v17 >= 3)
    {
      unint64_t v35 = SBIconCoordinateMakeWithGridCellIndex(v27, v10);
      double v37 = objc_msgSend(v25, "iconViewForCoordinate:", v35, v36);
      if (v37) {
        [(NSArray *)v18 addObject:v37];
      }

      if (v17 >= 4)
      {
        unint64_t v38 = SBIconCoordinateMakeWithGridCellIndex(v28, v10);
        double v40 = objc_msgSend(v25, "iconViewForCoordinate:", v38, v39);
        if (v40) {
          [(NSArray *)v18 addObject:v40];
        }
      }
    }
  }
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __67__SBHLibraryPodIconZoomAnimator__captureVisibleAndMiniPodIconViews__block_invoke;
  v51[3] = &unk_1E6AAD830;
  v42 = (NSArray *)v41;
  double v52 = v42;
  [v25 enumerateDisplayedIconViewsUsingBlock:v51];
  visibleIconViews = v48->_visibleIconViews;
  v48->_visibleIconViews = v42;
  double v44 = v42;

  miniPodIconViews = v48->_miniPodIconViews;
  v48->_miniPodIconViews = v18;
  double v46 = v18;
}

uint64_t __67__SBHLibraryPodIconZoomAnimator__captureVisibleAndMiniPodIconViews__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_prepareToCrossfadeMiniPodIconViews
{
  v40[1] = *MEMORY[0x1E4F143B8];
  CGFloat v3 = self->_miniPodIconViews;
  id v4 = [(SBHLibraryPodIconZoomAnimator *)self referenceIconView];
  unint64_t v38 = [v4 traitCollection];
  long long v5 = [v4 listLayoutProvider];
  uint64_t v6 = [v5 layoutForIconLocation:@"SBIconLocationFolder"];

  double v37 = [v4 folderIconImageCache];
  double v7 = SBHIconListLayoutFolderIconGridCellSize(v6);
  double v9 = v8;
  uint64_t v33 = v6;
  [v6 iconImageInfo];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v34 = v4;
  __int16 v18 = [v4 icon];
  uint64_t v19 = [v18 folder];
  uint64_t v20 = [v19 icons];

  unint64_t v21 = [v20 count];
  uint64_t v39 = v3;
  unint64_t v22 = [(NSArray *)v3 count];
  if (v22 >= v21) {
    unint64_t v23 = v21;
  }
  else {
    unint64_t v23 = v22;
  }
  if (v23)
  {
    uint64_t v24 = 0;
    uint64_t v35 = *MEMORY[0x1E4F3A148];
    uint64_t v36 = *MEMORY[0x1E4F3A2A8];
    do
    {
      double v25 = [(NSArray *)v39 objectAtIndex:v24];
      uint64_t v26 = [v20 objectAtIndex:v24];
      unint64_t v27 = objc_msgSend(v37, "gridCellImageOfSize:forIcon:iconImageInfo:compatibleWithTraitCollection:", v26, v38, v7, v9, v11, v13, v15, v17);
      unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v27];
      if (([v26 isTimedOut] & 1) != 0 || objc_msgSend(v26, "progressState"))
      {
        unint64_t v29 = [MEMORY[0x1E4F39BC0] filterWithType:v36];
        id v30 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
        objc_msgSend(v29, "setValue:forKey:", objc_msgSend(v30, "CGColor"), v35);

        double v31 = [v28 layer];
        v40[0] = v29;
        unint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
        [v31 setFilters:v32];
      }
      [v25 prepareToCrossfadeImageWithView:v28 options:2];

      ++v24;
    }
    while (v23 != v24);
  }
}

- (void)_cleanupMiniPodIconViewsAfterCrossfade
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  CGFloat v2 = self->_miniPodIconViews;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "cleanupAfterCrossfade", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_updateVisibleIconViewsPointerAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_visibleIconViews;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    BOOL v8 = !v3;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setDisallowCursorInteraction:", v8, (void)v10);
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_setupMatchMoveAnimation
{
  v12[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHLibraryPodIconZoomAnimator *)self referenceIconView];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F39C00]);
    uint64_t v5 = [v3 layer];
    [v4 setSourceLayer:v5];

    [v3 bounds];
    objc_msgSend(v3, "convertRect:toView:", self->_libraryScalingView);
    double v7 = v6;
    [(UIView *)self->_matchMoveWrapperView bounds];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, v8 * 0.5 - v7);
    v12[0] = v9;
    long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v4 setSourcePoints:v10];

    [v4 setAppliesX:0];
    [v4 setAppliesY:1];
    [v4 setAppliesScale:0];
    [v4 setAppliesRotation:0];
    [v4 setDuration:INFINITY];
    [v4 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v4 setRemovedOnCompletion:0];
    CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v4, "setPreferredFrameRateRange:", *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
    [v4 setHighFrameRateReason:1114123];
    long long v11 = [(UIView *)self->_matchMoveWrapperView layer];
    [v11 addAnimation:v4 forKey:@"SBHLibraryPodIconZoomMatchMoveAnimation"];
  }
}

- (void)_removeMatchMoveAnimation
{
  id v2 = [(UIView *)self->_matchMoveWrapperView layer];
  [v2 removeAnimationForKey:@"SBHLibraryPodIconZoomMatchMoveAnimation"];
}

- (void)_handleIconViewClippedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v7 = [v4 objectForKey:@"SBHHiddenIconViewUserInfoKey"];

  uint64_t v5 = [(SBHLibraryPodIconZoomAnimator *)self referenceIconView];
  int v6 = [v7 isEqual:v5];

  if (v6) {
    [(SBHLibraryPodIconZoomAnimator *)self _cancelAnimationForIconViewClippedOrObscured];
  }
}

- (void)_handleIconZoomNotification:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(SBHLibraryPodIconZoomAnimator *)self _cancelAnimationForIconViewClippedOrObscured];
  }
}

- (void)_cancelAnimationForIconViewClippedOrObscured
{
  BOOL v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "Hiding the folder scaling view for the library pod zoom animation due to icon being scrolled outside clipping bounds", v5, 2u);
  }

  [(UIView *)self->_folderScalingView setHidden:1];
  id v4 = [(SBHLibraryPodIconZoomAnimator *)self referenceIconView];
  [v4 setIconGridImageAlpha:1.0];
}

- (SBFolderIcon)targetIcon
{
  return self->_targetIcon;
}

- (SBIconView)targetIconView
{
  return self->_targetIconView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIconView, 0);
  objc_storeStrong((id *)&self->_targetIcon, 0);
  objc_storeStrong((id *)&self->_miniPodIconViews, 0);
  objc_storeStrong((id *)&self->_visibleIconViews, 0);
  objc_storeStrong((id *)&self->_libraryScalingView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_matchMoveWrapperView, 0);
  objc_storeStrong((id *)&self->_folderClippingView, 0);
  objc_storeStrong((id *)&self->_folderScalingView, 0);
  objc_storeStrong((id *)&self->_folderView, 0);
  objc_storeStrong((id *)&self->_folderController, 0);
  objc_destroyWeak((id *)&self->_libraryViewController);
}

@end