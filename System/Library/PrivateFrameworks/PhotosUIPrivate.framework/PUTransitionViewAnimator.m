@interface PUTransitionViewAnimator
- (BOOL)_isAutoUpdating;
- (BOOL)_isEnding;
- (BOOL)appliesScaleViaTransform;
- (BOOL)autoUpdates;
- (BOOL)shouldFinish;
- (BOOL)shouldUseTargetAspectRatio;
- (CADisplayLink)_autoUpdateDisplayLink;
- (CGPoint)_desiredTranslation;
- (CGPoint)anchorPoint;
- (CGPoint)currentTranslation;
- (CGRect)_targetAspectRatioSourceFrame;
- (CGRect)sourceFrame;
- (CGRect)targetFrame;
- (PUTransitionViewAnimator)initWithView:(id)a3 sourceFrame:(CGRect)a4 targetFrame:(CGRect)a5 anchorPoint:(CGPoint)a6 shouldUseTargetAspectRatio:(BOOL)a7 rampUpDuration:(double)a8 direction:(unint64_t)a9;
- (PUTransitionViewAnimatorDelegate)delegate;
- (PUValueFilter)_progressFilter;
- (PUValueFilter)_rampUpFilter;
- (PUValueFilter)_shouldFinishFilter;
- (UIView)view;
- (double)_currentRotation;
- (double)_currentScale;
- (double)_currentSizeMixFactor;
- (double)_desiredRotation;
- (double)_desiredScale;
- (double)_desiredSizeMixFactor;
- (double)_targetScale;
- (double)progress;
- (double)rampUpDuration;
- (double)unfilteredProgress;
- (unint64_t)direction;
- (void)_endWithTranslationVelocity:(CGPoint)a3 rotationVelocity:(double)a4 scaleVelocity:(double)a5 shouldBounce:(BOOL)a6 finish:(BOOL)a7 animated:(BOOL)a8;
- (void)_setAnchorPoint:(CGPoint)a3;
- (void)_setAutoUpdateDisplayLink:(id)a3;
- (void)_setAutoUpdating:(BOOL)a3;
- (void)_setCurrentRotation:(double)a3;
- (void)_setCurrentScale:(double)a3;
- (void)_setCurrentSizeMixFactor:(double)a3;
- (void)_setCurrentTranslation:(CGPoint)a3;
- (void)_setDesiredRotation:(double)a3;
- (void)_setDesiredScale:(double)a3;
- (void)_setDesiredSizeMixFactor:(double)a3;
- (void)_setDesiredTranslation:(CGPoint)a3;
- (void)_setDirection:(unint64_t)a3;
- (void)_setEnding:(BOOL)a3;
- (void)_setProgress:(double)a3;
- (void)_setProgressFilter:(id)a3;
- (void)_setRampUpDuration:(double)a3;
- (void)_setRampUpFilter:(id)a3;
- (void)_setShouldFinish:(BOOL)a3;
- (void)_setShouldFinishFilter:(id)a3;
- (void)_setShouldUseTargetAspectRatio:(BOOL)a3;
- (void)_setSourceFrame:(CGRect)a3;
- (void)_setTargetAspectRatioSourceFrame:(CGRect)a3;
- (void)_setTargetFrame:(CGRect)a3;
- (void)_setTargetScale:(double)a3;
- (void)_setUnfilteredProgress:(double)a3;
- (void)_setView:(id)a3;
- (void)_update;
- (void)_updateAutoUpdateDisplayLink;
- (void)cancelWithTranslationVelocity:(CGPoint)a3 rotationVelocity:(double)a4 scaleVelocity:(double)a5 shouldBounce:(BOOL)a6;
- (void)cancelWithoutAnimation;
- (void)finishWithTranslationVelocity:(CGPoint)a3 rotationVelocity:(double)a4 scaleVelocity:(double)a5 shouldBounce:(BOOL)a6;
- (void)setAppliesScaleViaTransform:(BOOL)a3;
- (void)setAutoUpdates:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)updateWithTranslation:(CGPoint)a3 rotation:(double)a4 scale:(double)a5;
@end

@implementation PUTransitionViewAnimator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shouldFinishFilter, 0);
  objc_storeStrong((id *)&self->__progressFilter, 0);
  objc_storeStrong((id *)&self->__rampUpFilter, 0);
  objc_storeStrong((id *)&self->__autoUpdateDisplayLink, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_setEnding:(BOOL)a3
{
  *(&self->__isEnding + 4) = a3;
}

- (BOOL)_isEnding
{
  return *(&self->__isEnding + 4);
}

- (void)_setShouldFinishFilter:(id)a3
{
}

- (PUValueFilter)_shouldFinishFilter
{
  return self->__shouldFinishFilter;
}

- (void)_setProgressFilter:(id)a3
{
}

- (PUValueFilter)_progressFilter
{
  return self->__progressFilter;
}

- (void)_setRampUpFilter:(id)a3
{
}

- (PUValueFilter)_rampUpFilter
{
  return self->__rampUpFilter;
}

- (void)_setAutoUpdateDisplayLink:(id)a3
{
}

- (CADisplayLink)_autoUpdateDisplayLink
{
  return self->__autoUpdateDisplayLink;
}

- (BOOL)_isAutoUpdating
{
  return *(&self->__isEnding + 3);
}

- (void)_setTargetScale:(double)a3
{
  self->__targetScale = a3;
}

- (double)_targetScale
{
  return self->__targetScale;
}

- (void)_setTargetAspectRatioSourceFrame:(CGRect)a3
{
  self->__targetAspectRatioSourceFrame = a3;
}

- (CGRect)_targetAspectRatioSourceFrame
{
  double x = self->__targetAspectRatioSourceFrame.origin.x;
  double y = self->__targetAspectRatioSourceFrame.origin.y;
  double width = self->__targetAspectRatioSourceFrame.size.width;
  double height = self->__targetAspectRatioSourceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setCurrentSizeMixFactor:(double)a3
{
  self->__currentSizeMixFactor = a3;
}

- (double)_currentSizeMixFactor
{
  return self->__currentSizeMixFactor;
}

- (void)_setCurrentScale:(double)a3
{
  self->__currentScale = a3;
}

- (double)_currentScale
{
  return self->__currentScale;
}

- (void)_setCurrentRotation:(double)a3
{
  self->__currentRotation = a3;
}

- (double)_currentRotation
{
  return self->__currentRotation;
}

- (void)_setDesiredSizeMixFactor:(double)a3
{
  self->__desiredSizeMixFactor = a3;
}

- (double)_desiredSizeMixFactor
{
  return self->__desiredSizeMixFactor;
}

- (void)_setDesiredScale:(double)a3
{
  self->__desiredScale = a3;
}

- (double)_desiredScale
{
  return self->__desiredScale;
}

- (void)_setDesiredRotation:(double)a3
{
  self->__desiredRotation = a3;
}

- (double)_desiredRotation
{
  return self->__desiredRotation;
}

- (void)_setDesiredTranslation:(CGPoint)a3
{
  self->__desiredTranslation = a3;
}

- (CGPoint)_desiredTranslation
{
  double x = self->__desiredTranslation.x;
  double y = self->__desiredTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setRampUpDuration:(double)a3
{
  self->_rampUpDuration = a3;
}

- (double)rampUpDuration
{
  return self->_rampUpDuration;
}

- (void)_setShouldUseTargetAspectRatio:(BOOL)a3
{
  *(&self->__isEnding + 2) = a3;
}

- (BOOL)shouldUseTargetAspectRatio
{
  return *(&self->__isEnding + 2);
}

- (void)_setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setTargetFrame:(CGRect)a3
{
  self->_targetFrame = a3;
}

- (CGRect)targetFrame
{
  double x = self->_targetFrame.origin.x;
  double y = self->_targetFrame.origin.y;
  double width = self->_targetFrame.size.width;
  double height = self->_targetFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setSourceFrame:(CGRect)a3
{
  self->_sourceFrame = a3;
}

- (CGRect)sourceFrame
{
  double x = self->_sourceFrame.origin.x;
  double y = self->_sourceFrame.origin.y;
  double width = self->_sourceFrame.size.width;
  double height = self->_sourceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setView:(id)a3
{
}

- (UIView)view
{
  return self->_view;
}

- (void)_setCurrentTranslation:(CGPoint)a3
{
  self->_currentTranslation = a3;
}

- (CGPoint)currentTranslation
{
  double x = self->_currentTranslation.x;
  double y = self->_currentTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setShouldFinish:(BOOL)a3
{
  *(&self->__isEnding + 1) = a3;
}

- (BOOL)shouldFinish
{
  return *(&self->__isEnding + 1);
}

- (void)_setUnfilteredProgress:(double)a3
{
  self->_unfilteredProgress = a3;
}

- (double)unfilteredProgress
{
  return self->_unfilteredProgress;
}

- (void)_setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)progress
{
  return self->_progress;
}

- (PUTransitionViewAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUTransitionViewAnimatorDelegate *)WeakRetained;
}

- (void)_setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setAppliesScaleViaTransform:(BOOL)a3
{
  self->__isEnding = a3;
}

- (BOOL)appliesScaleViaTransform
{
  return self->__isEnding;
}

- (void)setAutoUpdates:(BOOL)a3
{
  self->__isAutoUpdating = a3;
}

- (BOOL)autoUpdates
{
  return self->__isAutoUpdating;
}

- (void)_endWithTranslationVelocity:(CGPoint)a3 rotationVelocity:(double)a4 scaleVelocity:(double)a5 shouldBounce:(BOOL)a6 finish:(BOOL)a7 animated:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  double y = a3.y;
  double x = a3.x;
  if (![(PUTransitionViewAnimator *)self _isEnding])
  {
    [(PUTransitionViewAnimator *)self _setEnding:1];
    [(PUTransitionViewAnimator *)self _setAutoUpdating:0];
    BOOL v13 = [(PUTransitionViewAnimator *)self appliesScaleViaTransform];
    id v14 = objc_alloc_init(MEMORY[0x1E4FB20D8]);
    [(PUTransitionViewAnimator *)self progress];
    v15 = objc_msgSend(MEMORY[0x1E4FB20E0], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:");
    [v14 addAnimation:v15];
    v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v16 scale];
    double v18 = v17;

    [(PUTransitionViewAnimator *)self currentTranslation];
    double v82 = v19;
    double v80 = v20;
    if (v9)
    {
      [(PUTransitionViewAnimator *)self anchorPoint];
      double v22 = v21;
      double v73 = v23;
      double v74 = v21;
      [(PUTransitionViewAnimator *)self _targetAspectRatioSourceFrame];
      double v76 = x;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      [(PUTransitionViewAnimator *)self targetFrame];
      CGFloat v33 = v32;
      CGFloat v69 = v34;
      CGFloat v70 = v32;
      CGFloat v78 = v35;
      CGFloat v37 = v36;
      v105.origin.double x = v25;
      v105.origin.double y = v27;
      v105.size.double width = v29;
      v105.size.double height = v31;
      double v75 = v18;
      double v38 = v22 - CGRectGetMinX(v105);
      v106.origin.double x = v25;
      v106.origin.double y = v27;
      v106.size.double width = v29;
      v106.size.double height = v31;
      double v71 = v38 / CGRectGetWidth(v106);
      v107.origin.double x = v33;
      v107.origin.double y = v78;
      v107.size.double width = v37;
      v107.size.double height = v69;
      double Width = CGRectGetWidth(v107);
      v108.origin.double x = v33;
      v108.origin.double y = v78;
      v108.size.double width = v37;
      v108.size.double height = v69;
      CGFloat v72 = CGRectGetMinX(v108) + v71 * Width;
      v109.origin.double x = v25;
      v109.origin.double y = v27;
      v109.size.double width = v29;
      v109.size.double height = v31;
      double v39 = v73 - CGRectGetMinY(v109);
      v110.origin.double x = v25;
      double x = v76;
      v110.origin.double y = v27;
      v110.size.double width = v29;
      v110.size.double height = v31;
      double v40 = v39 / CGRectGetHeight(v110);
      v111.origin.double x = v70;
      v111.origin.double y = v78;
      v111.size.double width = v37;
      v111.size.double height = v69;
      double Height = CGRectGetHeight(v111);
      v112.origin.double x = v70;
      v112.origin.double y = v78;
      v112.size.double width = v37;
      v112.size.double height = v69;
      double v18 = v75;
      *(double *)&long long v104 = v72 - v74;
      *((double *)&v104 + 1) = CGRectGetMinY(v112) + v40 * Height - v73;
    }
    else
    {
      long long v104 = *MEMORY[0x1E4F1DAD8];
    }
    v42 = [(PUTransitionViewAnimator *)self delegate];
    v43 = v42;
    if ((*(unsigned char *)&self->_delegateFlags & 2) != 0) {
      [v42 transitionViewAnimatorWillEnd:self withTargetTranslation:&v104];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __116__PUTransitionViewAnimator__endWithTranslationVelocity_rotationVelocity_scaleVelocity_shouldBounce_finish_animated___block_invoke;
    aBlock[3] = &unk_1E5F2DCD0;
    aBlock[4] = self;
    id v44 = v43;
    id v102 = v44;
    BOOL v103 = v9;
    v45 = _Block_copy(aBlock);
    v46 = v45;
    if (v8)
    {
      v77 = v45;
      BOOL v79 = v13;
      double v47 = 0.5 / v18;
      uint64_t v48 = objc_msgSend(MEMORY[0x1E4FB20E0], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:", v80, x, *(double *)&v104, 200.0, 1.0, v47);
      v49 = objc_msgSend(MEMORY[0x1E4FB20E0], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:", v82, y, *((double *)&v104 + 1), 200.0, 1.0, v47);
      v81 = (void *)v48;
      [v14 addAnimation:v48];
      [v14 addAnimation:v49];
      [(PUTransitionViewAnimator *)self _currentRotation];
      for (; v50 > 3.14159265; double v50 = v50 + -6.28318531)
        ;
      for (; v50 < -3.14159265; double v50 = v50 + 6.28318531)
        ;
      v84 = v15;
      double v51 = 1.0;
      v52 = objc_msgSend(MEMORY[0x1E4FB20E0], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:");
      [v14 addAnimation:v52];
      [(PUTransitionViewAnimator *)self _currentScale];
      double v54 = v53;
      double v55 = 1.0;
      if (v9)
      {
        [(PUTransitionViewAnimator *)self _targetScale];
        double v55 = v56;
      }
      if (a6 && v55 > v54) {
        double v51 = 0.67;
      }
      [(PUTransitionViewAnimator *)self sourceFrame];
      double v57 = CGRectGetWidth(v113);
      [(PUTransitionViewAnimator *)self sourceFrame];
      double v58 = CGRectGetHeight(v114);
      if (v57 >= v58) {
        double v58 = v57;
      }
      v59 = objc_msgSend(MEMORY[0x1E4FB20E0], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:", v54, a5, v55, 200.0, v51, v47 / v58);
      [v14 addAnimation:v59];
      v60 = objc_alloc_init(PUThresholdCrossingCountValueFilter);
      [(PUThresholdCrossingCountValueFilter *)v60 setThresholdValue:v55];
      [(PUThresholdCrossingCountValueFilter *)v60 setMaximumCrossingCount:2];
      [(PUTransitionViewAnimator *)self _currentSizeMixFactor];
      v61 = objc_msgSend(MEMORY[0x1E4FB20E0], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:");
      [v14 addAnimation:v61];
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __116__PUTransitionViewAnimator__endWithTranslationVelocity_rotationVelocity_scaleVelocity_shouldBounce_finish_animated___block_invoke_2;
      v88[3] = &unk_1E5F2D4E0;
      id v89 = v84;
      id v90 = v81;
      id v91 = v49;
      id v92 = v52;
      id v93 = v59;
      id v94 = v61;
      long long v98 = v104;
      double v99 = v55;
      v95 = v60;
      v96 = self;
      BOOL v100 = v79;
      id v97 = v44;
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __116__PUTransitionViewAnimator__endWithTranslationVelocity_rotationVelocity_scaleVelocity_shouldBounce_finish_animated___block_invoke_3;
      v86[3] = &unk_1E5F2D990;
      v46 = v77;
      id v87 = v77;
      v62 = v60;
      id v63 = v61;
      id v64 = v59;
      id v65 = v52;
      id v66 = v49;
      id v67 = v81;
      [v14 runWithGroupApplier:v88 completion:v86];

      v15 = v84;
    }
    else
    {
      (*((void (**)(void *))v45 + 2))(v45);
    }
  }
}

uint64_t __116__PUTransitionViewAnimator__endWithTranslationVelocity_rotationVelocity_scaleVelocity_shouldBounce_finish_animated___block_invoke(uint64_t result)
{
  if ((*(unsigned char *)(*(void *)(result + 32) + 8) & 4) != 0) {
    return objc_msgSend(*(id *)(result + 40), "transitionViewAnimatorDidEnd:finished:");
  }
  return result;
}

void __116__PUTransitionViewAnimator__endWithTranslationVelocity_rotationVelocity_scaleVelocity_shouldBounce_finish_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) value];
  double v3 = v2;
  [*(id *)(a1 + 40) value];
  CGFloat v5 = v4;
  [*(id *)(a1 + 48) value];
  CGFloat v7 = v6;
  [*(id *)(a1 + 56) value];
  CGFloat v9 = v8;
  [*(id *)(a1 + 64) value];
  double v11 = v10;
  [*(id *)(a1 + 72) value];
  double v13 = v12;
  if ([*(id *)(a1 + 40) state] == 3) {
    CGFloat v5 = *(double *)(a1 + 104);
  }
  if ([*(id *)(a1 + 48) state] == 3) {
    CGFloat v7 = *(double *)(a1 + 112);
  }
  if ([*(id *)(a1 + 64) state] == 3)
  {
    double v14 = *(double *)(a1 + 120);
  }
  else
  {
    [*(id *)(a1 + 80) setInputValue:v11];
    [*(id *)(a1 + 80) outputValue];
    double v14 = v15;
  }
  [*(id *)(a1 + 88) sourceFrame];
  UIRectGetCenter();
  double v17 = v16;
  double v19 = v18;
  [*(id *)(a1 + 88) anchorPoint];
  if (*(unsigned char *)(a1 + 128)) {
    double v22 = v14;
  }
  else {
    double v22 = 1.0;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  objc_msgSend(*(id *)(a1 + 88), "sourceFrame", PUAffineTransformWithAnchorPointTranslationRotationScale((uint64_t)&v40, v20 - v17, v21 - v19, v5, v7, v9, v22));
  double v24 = v23;
  double v26 = v25;
  [*(id *)(a1 + 88) _targetAspectRatioSourceFrame];
  double width = v27 * v13 + (1.0 - v13) * v24;
  double height = v29 * v13 + (1.0 - v13) * v26;
  double x = *MEMORY[0x1E4F1DAD8];
  double y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (!*(unsigned char *)(a1 + 128))
  {
    CGAffineTransformMakeScale(&v39, v14, v14);
    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.double width = width;
    v43.size.double height = height;
    CGRect v44 = CGRectApplyAffineTransform(v43, &v39);
    double x = v44.origin.x;
    double y = v44.origin.y;
    double width = v44.size.width;
    double height = v44.size.height;
  }
  [*(id *)(a1 + 88) _setProgress:v3];
  [*(id *)(a1 + 88) _targetScale];
  if (v33 == 1.0)
  {
    uint64_t v35 = [*(id *)(a1 + 88) direction];
    double v34 = 1.0;
    if (v14 <= 1.0) {
      double v36 = 0.0;
    }
    else {
      double v36 = 1.0;
    }
    if (v14 >= 1.0) {
      double v34 = 0.0;
    }
    if (!v35) {
      double v34 = v36;
    }
  }
  else
  {
    double v34 = (v14 + -1.0) / (v33 + -1.0);
  }
  [*(id *)(a1 + 88) _setUnfilteredProgress:v34];
  objc_msgSend(*(id *)(a1 + 88), "_setCurrentTranslation:", v5, v7);
  CGFloat v37 = [*(id *)(a1 + 88) view];
  objc_msgSend(v37, "setBounds:", x, y, width, height);
  v38[0] = v40;
  v38[1] = v41;
  v38[2] = v42;
  [v37 setTransform:v38];
  if (*(unsigned char *)(*(void *)(a1 + 88) + 8)) {
    objc_msgSend(*(id *)(a1 + 96), "transitionViewAnimatorDidUpdate:");
  }
}

uint64_t __116__PUTransitionViewAnimator__endWithTranslationVelocity_rotationVelocity_scaleVelocity_shouldBounce_finish_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateAutoUpdateDisplayLink
{
  BOOL v3 = [(PUTransitionViewAnimator *)self _isAutoUpdating];
  double v4 = [(PUTransitionViewAnimator *)self _autoUpdateDisplayLink];
  int v5 = !v3;
  if (v3 && !v4)
  {
    id v7 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__autoUpdate_];
    [(PUTransitionViewAnimator *)self _setAutoUpdateDisplayLink:v7];
    [v7 setPaused:0];
    double v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v7 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];

LABEL_8:
    double v4 = v7;
    goto LABEL_9;
  }
  if (!v4) {
    int v5 = 0;
  }
  if (v5 == 1)
  {
    id v7 = v4;
    [v4 setPaused:1];
    [v7 invalidate];
    [(PUTransitionViewAnimator *)self _setAutoUpdateDisplayLink:0];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_setAutoUpdating:(BOOL)a3
{
  if (*(&self->__isEnding + 3) != a3)
  {
    *(&self->__isEnding + 3) = a3;
    [(PUTransitionViewAnimator *)self _updateAutoUpdateDisplayLink];
  }
}

- (void)_update
{
  BOOL v3 = [(PUTransitionViewAnimator *)self appliesScaleViaTransform];
  [(PUTransitionViewAnimator *)self _desiredTranslation];
  double v5 = v4;
  double v7 = v6;
  [(PUTransitionViewAnimator *)self _desiredRotation];
  double v9 = v8;
  [(PUTransitionViewAnimator *)self _desiredScale];
  double v11 = v10;
  [(PUTransitionViewAnimator *)self _desiredSizeMixFactor];
  double v13 = v12;
  double v14 = [(PUTransitionViewAnimator *)self _rampUpFilter];
  [v14 outputValue];
  CGFloat v46 = *MEMORY[0x1E4F1DAD8];
  double y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v45 = v15;
  if (v15 < 1.0)
  {
    double v5 = v5 * v15 + (1.0 - v15) * *MEMORY[0x1E4F1DAD8];
    double v7 = v7 * v15 + (1.0 - v15) * *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v9 = v9 * v15 + (1.0 - v15) * 0.0;
    double v11 = 1.0 - v15 + v11 * v15;
    double v13 = v13 * v15 + (1.0 - v15) * 0.0;
  }
  -[PUTransitionViewAnimator _setCurrentTranslation:](self, "_setCurrentTranslation:", v5, v7);
  [(PUTransitionViewAnimator *)self _setCurrentRotation:v9];
  [(PUTransitionViewAnimator *)self _setCurrentScale:v11];
  [(PUTransitionViewAnimator *)self _setCurrentSizeMixFactor:v13];
  [(PUTransitionViewAnimator *)self anchorPoint];
  double v17 = v16;
  double v19 = v18;
  [(PUTransitionViewAnimator *)self sourceFrame];
  UIRectGetCenter();
  if (v3) {
    double v22 = v11;
  }
  else {
    double v22 = 1.0;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  [(PUTransitionViewAnimator *)self sourceFrame];
  double v24 = v23;
  double v26 = v25;
  [(PUTransitionViewAnimator *)self _targetAspectRatioSourceFrame];
  double width = v27 * v13 + (1.0 - v13) * v24;
  double height = v29 * v13 + (1.0 - v13) * v26;
  if (v3)
  {
    double x = v46;
  }
  else
  {
    CGAffineTransformMakeScale(&v49, v11, v11);
    v53.origin.double x = v46;
    v53.origin.double y = y;
    v53.size.double width = width;
    v53.size.double height = height;
    CGRect v54 = CGRectApplyAffineTransform(v53, &v49);
    double x = v54.origin.x;
    double y = v54.origin.y;
    double width = v54.size.width;
    double height = v54.size.height;
  }
  [(PUTransitionViewAnimator *)self _targetScale];
  if (v32 == 1.0)
  {
    unint64_t v34 = [(PUTransitionViewAnimator *)self direction];
    double v35 = 0.0;
    if (v11 <= 1.0) {
      double v36 = 0.0;
    }
    else {
      double v36 = 1.0;
    }
    if (v11 < 1.0) {
      double v35 = 1.0;
    }
    if (v34) {
      double v33 = v35;
    }
    else {
      double v33 = v36;
    }
  }
  else
  {
    double v33 = (v11 + -1.0) / (v32 + -1.0);
  }
  CGFloat v37 = [(PUTransitionViewAnimator *)self _progressFilter];
  [v37 setInputValue:v33];
  [v37 outputValue];
  double v39 = v38;
  -[PUTransitionViewAnimator _setProgress:](self, "_setProgress:");
  [(PUTransitionViewAnimator *)self _setUnfilteredProgress:v33];
  BOOL v40 = v39 != v33 || v45 < 1.0;
  long long v41 = [(PUTransitionViewAnimator *)self _shouldFinishFilter];
  [v41 setInputValue:v33];
  [v41 outputValue];
  [(PUTransitionViewAnimator *)self _setShouldFinish:v42 >= 0.0];
  CGRect v43 = [(PUTransitionViewAnimator *)self view];
  objc_msgSend(v43, "setBounds:", x, y, width, height);
  v48[0] = v50;
  v48[1] = v51;
  v48[2] = v52;
  [v43 setTransform:v48];
  if (*(unsigned char *)&self->_delegateFlags)
  {
    CGRect v44 = [(PUTransitionViewAnimator *)self delegate];
    [v44 transitionViewAnimatorDidUpdate:self];
  }
  if (!v40 || [(PUTransitionViewAnimator *)self autoUpdates]) {
    [(PUTransitionViewAnimator *)self _setAutoUpdating:v40];
  }
}

- (void)cancelWithoutAnimation
{
}

- (void)cancelWithTranslationVelocity:(CGPoint)a3 rotationVelocity:(double)a4 scaleVelocity:(double)a5 shouldBounce:(BOOL)a6
{
}

- (void)finishWithTranslationVelocity:(CGPoint)a3 rotationVelocity:(double)a4 scaleVelocity:(double)a5 shouldBounce:(BOOL)a6
{
}

- (void)updateWithTranslation:(CGPoint)a3 rotation:(double)a4 scale:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  if (![(PUTransitionViewAnimator *)self _isEnding])
  {
    -[PUTransitionViewAnimator _setDesiredTranslation:](self, "_setDesiredTranslation:", x, y);
    [(PUTransitionViewAnimator *)self _setDesiredRotation:a4];
    [(PUTransitionViewAnimator *)self _setDesiredScale:a5];
    if (![(PUTransitionViewAnimator *)self _isAutoUpdating])
    {
      [(PUTransitionViewAnimator *)self _update];
    }
  }
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFD | v6;
  char v7 = objc_opt_respondsToSelector();

  if (v7) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFB | v8;
}

- (PUTransitionViewAnimator)initWithView:(id)a3 sourceFrame:(CGRect)a4 targetFrame:(CGRect)a5 anchorPoint:(CGPoint)a6 shouldUseTargetAspectRatio:(BOOL)a7 rampUpDuration:(double)a8 direction:(unint64_t)a9
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  double height = a5.size.height;
  double width = a5.size.width;
  double v13 = a5.origin.y;
  double v14 = a5.origin.x;
  double v15 = a4.size.height;
  double v16 = a4.size.width;
  double v17 = a4.origin.y;
  double v56 = a4.origin.x;
  v61[2] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  v59.receiver = self;
  v59.super_class = (Class)PUTransitionViewAnimator;
  double v20 = [(PUTransitionViewAnimator *)&v59 init];
  double v21 = v20;
  if (v20)
  {
    CGFloat v58 = v13;
    CGFloat v57 = v14;
    [(PUTransitionViewAnimator *)v20 setAutoUpdates:1];
    [(PUTransitionViewAnimator *)v21 setAppliesScaleViaTransform:1];
    [(PUTransitionViewAnimator *)v21 _setView:v19];
    -[PUTransitionViewAnimator _setSourceFrame:](v21, "_setSourceFrame:", v56, v17, v16, v15);
    -[PUTransitionViewAnimator _setTargetFrame:](v21, "_setTargetFrame:", v14, v13, width, height);
    -[PUTransitionViewAnimator _setAnchorPoint:](v21, "_setAnchorPoint:", a8, v62);
    [(PUTransitionViewAnimator *)v21 _setShouldUseTargetAspectRatio:*(void *)&x];
    [(PUTransitionViewAnimator *)v21 _setRampUpDuration:v63];
    [(PUTransitionViewAnimator *)v21 _setDirection:*(void *)&y];
    [(PUTransitionViewAnimator *)v21 _setCurrentScale:1.0];
    [(PUTransitionViewAnimator *)v21 _setShouldFinish:1];
    double v22 = 0.0;
    if (LODWORD(x)) {
      double v22 = 1.0;
    }
    [(PUTransitionViewAnimator *)v21 _setDesiredSizeMixFactor:v22];
    v64.origin.CGFloat x = v14;
    v64.origin.CGFloat y = v13;
    v64.size.double width = width;
    v64.size.double height = height;
    CGFloat v53 = v16;
    CGFloat v54 = v15;
    CGFloat rect = height;
    if (CGRectIsEmpty(v64))
    {
      double v23 = v15;
      double v24 = v16;
      double v25 = v17;
      double v26 = v56;
      CGFloat v27 = v17;
      CGFloat v28 = height;
      CGFloat v29 = width;
    }
    else
    {
      v65.origin.CGFloat x = v14;
      v65.origin.CGFloat y = v13;
      v65.size.double width = width;
      v65.size.double height = height;
      double v30 = CGRectGetWidth(v65);
      v66.origin.CGFloat x = v14;
      v66.origin.CGFloat y = v13;
      v66.size.double width = width;
      v66.size.double height = height;
      double v31 = v30 / CGRectGetHeight(v66);
      CGFloat v29 = width;
      if (y == 0.0) {
        double v32 = PURectWithAspectRatioFillingRect(v31, v56, v17, v16, v15);
      }
      else {
        double v32 = PURectWithAspectRatioFittingRect(v31, v56, v17, v16, v15);
      }
      double v26 = v32;
      double v25 = v33;
      double v24 = v34;
      double v23 = v35;
      CGFloat v27 = v17;
      CGFloat v28 = rect;
    }
    -[PUTransitionViewAnimator _setTargetAspectRatioSourceFrame:](v21, "_setTargetAspectRatioSourceFrame:", v26, v25, v24, v23);
    v67.origin.CGFloat x = v57;
    v67.origin.CGFloat y = v58;
    v67.size.double width = v29;
    v67.size.double height = v28;
    IsEmptCGFloat y = CGRectIsEmpty(v67);
    double v37 = 1.0;
    if (!IsEmpty)
    {
      v68.origin.CGFloat x = v26;
      v68.origin.CGFloat y = v25;
      v68.size.double width = v24;
      v68.size.double height = v23;
      double v38 = CGRectGetWidth(v68);
      v69.origin.CGFloat x = v56;
      v69.origin.CGFloat y = v27;
      v69.size.double width = v53;
      v69.size.double height = v54;
      if (v38 == CGRectGetWidth(v69))
      {
        v70.origin.CGFloat x = v57;
        v70.origin.CGFloat y = v58;
        v70.size.double width = v29;
        v70.size.double height = rect;
        double v39 = CGRectGetWidth(v70);
        v71.origin.CGFloat x = v56;
        v71.origin.CGFloat y = v27;
        v71.size.double width = v53;
        v71.size.double height = v54;
        double v40 = CGRectGetWidth(v71);
      }
      else
      {
        v72.origin.CGFloat x = v57;
        v72.origin.CGFloat y = v58;
        v72.size.double width = v29;
        v72.size.double height = rect;
        double v39 = CGRectGetHeight(v72);
        v73.origin.CGFloat x = v56;
        v73.origin.CGFloat y = v27;
        v73.size.double width = v53;
        v73.size.double height = v54;
        double v40 = CGRectGetHeight(v73);
      }
      double v37 = v39 / v40;
    }
    [(PUTransitionViewAnimator *)v21 _setTargetScale:v37];
    if (v63 <= 0.0)
    {
      long long v41 = objc_alloc_init(PUValueFilter);
    }
    else
    {
      long long v41 = objc_alloc_init(PUMaximumChangeRateValueFilter);
      UIAnimationDragCoefficient();
      [(PUMaximumChangeRateValueFilter *)v41 setMaximumChangeRate:1.0 / (v42 * v63)];
    }
    [(PUDynamicValueFilter *)v41 setInputValue:1.0];
    [(PUTransitionViewAnimator *)v21 _setRampUpFilter:v41];
    CGRect v43 = objc_alloc_init(PUClampValueFilter);
    [(PUClampValueFilter *)v43 setMinimumValue:0.0];
    [(PUClampValueFilter *)v43 setMaximumValue:1.0];
    CGRect v44 = objc_alloc_init(PUMaximumChangeRateValueFilter);
    UIAnimationDragCoefficient();
    [(PUMaximumChangeRateValueFilter *)v44 setMaximumChangeRate:3.33333333 / v45];
    CGFloat v46 = objc_alloc_init(PUGroupValueFilter);
    v61[0] = v43;
    v61[1] = v44;
    double v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    [(PUGroupValueFilter *)v46 setFilters:v47];

    [(PUTransitionViewAnimator *)v21 _setProgressFilter:v46];
    uint64_t v48 = objc_alloc_init(PUClampValueFilter);
    [(PUClampValueFilter *)v48 setMinimumValue:0.0];
    [(PUClampValueFilter *)v48 setMaximumValue:1.0];
    CGAffineTransform v49 = objc_alloc_init(PUChangeDirectionValueFilter);
    [(PUChangeDirectionValueFilter *)v49 setMinimumChangeValue:0.05];
    long long v50 = objc_alloc_init(PUGroupValueFilter);
    v60[0] = v48;
    v60[1] = v49;
    long long v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
    [(PUGroupValueFilter *)v50 setFilters:v51];

    [(PUTransitionViewAnimator *)v21 _setShouldFinishFilter:v50];
  }

  return v21;
}

@end