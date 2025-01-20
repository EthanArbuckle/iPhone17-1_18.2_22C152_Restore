@interface _SBInnerFolderIconZoomAnimator
- (_SBInnerFolderIconZoomAnimator)initWithFolderController:(id)a3 iconView:(id)a4 iconZoomScaleDimension:(CGPoint)a5;
- (unint64_t)_numberOfSignificantAnimations;
- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5;
- (void)_applyIconCrossfadeForZoomFraction:(double)a3;
- (void)_applyIconTransformForZoomFraction:(double)a3;
- (void)_calculateZoomedOffset:(CGPoint *)a3 scale:(CGPoint *)a4 forIcon:(id)a5 withView:(id)a6;
- (void)_cleanupAnimation;
- (void)_prepareAnimation;
- (void)_setAnimationFraction:(double)a3;
@end

@implementation _SBInnerFolderIconZoomAnimator

- (_SBInnerFolderIconZoomAnimator)initWithFolderController:(id)a3 iconView:(id)a4 iconZoomScaleDimension:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_SBInnerFolderIconZoomAnimator;
  v11 = [(SBIconZoomAnimator *)&v19 initWithAnimationContainer:v9];
  if (v11)
  {
    v12 = [v9 contentView];
    v13 = self;
    if (objc_opt_isKindOfClass()) {
      v14 = v12;
    }
    else {
      v14 = 0;
    }
    objc_storeStrong((id *)v11 + 19, v14);

    objc_storeStrong((id *)v11 + 20, a4);
    CGAffineTransformMakeScale(&v18, x, y);
    long long v15 = *(_OWORD *)&v18.a;
    long long v16 = *(_OWORD *)&v18.tx;
    *(_OWORD *)(v11 + 184) = *(_OWORD *)&v18.c;
    *(_OWORD *)(v11 + 200) = v16;
    *(_OWORD *)(v11 + 168) = v15;
  }
  return (_SBInnerFolderIconZoomAnimator *)v11;
}

- (void)_prepareAnimation
{
  v33.receiver = self;
  v33.super_class = (Class)_SBInnerFolderIconZoomAnimator;
  [(SBIconZoomAnimator *)&v33 _prepareAnimation];
  v3 = [(SBIconView *)self->_folderIconView listLayoutProvider];
  v4 = [v3 layoutForIconLocation:@"SBIconLocationFolder"];

  v5 = [(SBIconView *)self->_folderIconView _iconImageView];
  v6 = [(SBIconView *)self->_folderIconView folderIconImageCache];
  v7 = [(SBIconView *)self->_folderIconView traitCollection];
  double v8 = SBHIconListLayoutFolderIconGridCellSize(v4);
  uint64_t v10 = v9;
  [v4 iconImageInfo];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  objc_super v19 = self;
  if (objc_opt_isKindOfClass()) {
    char v20 = [v5 usesLayersForMiniIcons];
  }
  else {
    char v20 = 0;
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __51___SBInnerFolderIconZoomAnimator__prepareAnimation__block_invoke;
  v23[3] = &unk_1E6AAFC70;
  char v32 = v20;
  uint64_t v26 = v12;
  uint64_t v27 = v14;
  uint64_t v28 = v16;
  uint64_t v29 = v18;
  id v24 = v7;
  id v25 = v6;
  double v30 = v8;
  uint64_t v31 = v10;
  id v21 = v6;
  id v22 = v7;
  [(SBIconZoomAnimator *)self enumerateIconsAndIconViewsWithHandler:v23];
}

- (void)_setAnimationFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SBInnerFolderIconZoomAnimator;
  -[SBIconZoomAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  [(_SBInnerFolderIconZoomAnimator *)self _applyIconCrossfadeForZoomFraction:a3];
  [(_SBInnerFolderIconZoomAnimator *)self _applyIconTransformForZoomFraction:a3];
}

- (void)_cleanupAnimation
{
  [(SBIconZoomAnimator *)self enumerateIconsAndIconViewsWithHandler:&__block_literal_global_29];
  v3.receiver = self;
  v3.super_class = (Class)_SBInnerFolderIconZoomAnimator;
  [(SBIconZoomAnimator *)&v3 _cleanupAnimation];
}

- (unint64_t)_numberOfSignificantAnimations
{
  v3.receiver = self;
  v3.super_class = (Class)_SBInnerFolderIconZoomAnimator;
  return [(SBIconZoomAnimator *)&v3 _numberOfSignificantAnimations] + 2;
}

- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5
{
  id v8 = a5;
  BOOL v9 = [(SBIconAnimator *)self isAnimating];
  v21.receiver = self;
  v21.super_class = (Class)_SBInnerFolderIconZoomAnimator;
  [(SBIconZoomAnimator *)&v21 _animateToFraction:v8 afterDelay:a3 withSharedCompletion:a4];
  uint64_t v10 = [(SBIconAnimator *)self settings];
  uint64_t v11 = v10;
  if (v9) {
    uint64_t v12 = 6;
  }
  else {
    uint64_t v12 = 2;
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F4F898];
  uint64_t v14 = [v10 effectiveCrossfadeAnimationSettings];
  uint64_t v15 = [v14 BSAnimationSettings];
  uint64_t v16 = [v13 factoryWithSettings:v15];

  [v16 setAllowsAdditiveAnimations:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85___SBInnerFolderIconZoomAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke;
  v20[3] = &unk_1E6AAC838;
  v20[4] = self;
  *(double *)&v20[5] = a3;
  [MEMORY[0x1E4F4F898] animateWithFactory:v16 additionalDelay:v12 options:v20 actions:v8 completion:a4];
  uint64_t v17 = (void *)MEMORY[0x1E4F4F898];
  uint64_t v18 = [(SBIconAnimator *)self centralAnimationFactory];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __85___SBInnerFolderIconZoomAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke_2;
  v19[3] = &unk_1E6AAC838;
  v19[4] = self;
  *(double *)&v19[5] = a3;
  [v17 animateWithFactory:v18 additionalDelay:v12 options:v19 actions:v8 completion:a4];
}

- (void)_applyIconCrossfadeForZoomFraction:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69___SBInnerFolderIconZoomAnimator__applyIconCrossfadeForZoomFraction___block_invoke;
  v17[3] = &__block_descriptor_40_e34_v28__0__SBIcon_8__SBIconView_16B24l;
  *(double *)&v17[4] = a3;
  [(SBIconZoomAnimator *)self enumerateIconsAndIconViewsWithHandler:v17];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v5 = [(SBFolderView *)self->_folderView iconListViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    double v9 = 1.0 - a3;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        uint64_t v12 = [(SBFolderView *)self->_folderView currentIconListView];

        if (v11 != v12) {
          [v11 setAlpha:v9];
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_applyIconTransformForZoomFraction:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69___SBInnerFolderIconZoomAnimator__applyIconTransformForZoomFraction___block_invoke;
  v3[3] = &unk_1E6AAFCD8;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  [(SBIconZoomAnimator *)self enumerateIconsAndIconViewsWithHandler:v3];
}

- (void)_calculateZoomedOffset:(CGPoint *)a3 scale:(CGPoint *)a4 forIcon:(id)a5 withView:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(SBIconZoomAnimator *)self iconListView];
  -[SBIconView visibleImageRelativeFrameForMiniIconAtIndex:](self->_folderIconView, "visibleImageRelativeFrameForMiniIconAtIndex:", [v12 indexOfIcon:v10]);
  long long v13 = *(_OWORD *)&self->_folderIconViewScaleTransform.c;
  *(_OWORD *)&v26.a = *(_OWORD *)&self->_folderIconViewScaleTransform.a;
  *(_OWORD *)&v26.c = v13;
  *(_OWORD *)&v26.tCGFloat x = *(_OWORD *)&self->_folderIconViewScaleTransform.tx;
  CGRect v28 = CGRectApplyAffineTransform(v27, &v26);
  double width = v28.size.width;
  double height = v28.size.height;
  if (a4)
  {
    CGFloat v16 = self->_folderIconViewScaleTransform.d / self->_folderIconViewScaleTransform.a;
    [v11 iconImageVisibleSize];
    double v18 = width / v17;
    a4->CGFloat x = v18;
    if (v16 > 1.0)
    {
      [v11 iconImageVisibleSize];
      double v18 = height / v19;
    }
    a4->CGFloat y = v18;
  }
  UIRectGetCenter();
  double v21 = v20;
  double v23 = v22;
  [(SBFloatyFolderView *)self->_folderView visibleFolderRelativeImageCenterForIcon:v10];
  if (a3)
  {
    a3->CGFloat x = v21 - v24;
    a3->CGFloat y = v23 - v25;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIconView, 0);
  objc_storeStrong((id *)&self->_folderView, 0);
}

@end