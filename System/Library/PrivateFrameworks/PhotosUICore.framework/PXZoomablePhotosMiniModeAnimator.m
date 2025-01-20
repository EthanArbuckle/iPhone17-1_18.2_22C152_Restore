@interface PXZoomablePhotosMiniModeAnimator
- (BOOL)isActive;
- (BOOL)isAnimating;
- (BOOL)isContentAnimating;
- (NSString)description;
- (PXNumberAnimator)gridBackgroundVisibilityAnimator;
- (PXNumberAnimator)gridExpansionAnimator;
- (PXNumberAnimator)gridMiniChromeVisibilityAnimator;
- (PXNumberAnimator)gridMiniStylingAnimator;
- (PXZoomablePhotosMiniModeAnimator)init;
- (double)gridBackgroundVisibilityPercentage;
- (double)gridExpansionPercentage;
- (double)gridExpansionVelocity;
- (double)gridMiniChromeVisibilityPercentage;
- (double)gridMiniFoldingPercentage;
- (double)gridMiniStylingPercentage;
- (double)interactionProgress;
- (unint64_t)previousState;
- (unint64_t)targetState;
- (void)_applyAnimationValue:(id *)a3 toAnimator:(id)a4 animateImmediately:(BOOL)a5;
- (void)_invalidateAnimator;
- (void)_invalidateIsAnimating;
- (void)_setNeedsUpdate;
- (void)_updateAnimator;
- (void)_updateIsAnimating;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performAnimated:(BOOL)a3 changes:(id)a4;
- (void)performChanges:(id)a3;
- (void)setGridExpansionVelocity:(double)a3;
- (void)setInteractionProgress:(double)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setIsContentAnimating:(BOOL)a3;
- (void)setTargetState:(unint64_t)a3;
@end

@implementation PXZoomablePhotosMiniModeAnimator

- (double)gridMiniStylingPercentage
{
  v2 = [(PXZoomablePhotosMiniModeAnimator *)self gridMiniStylingAnimator];
  [v2 presentationValue];
  double v4 = v3;

  return v4 * v4;
}

- (PXNumberAnimator)gridMiniStylingAnimator
{
  return self->_gridMiniStylingAnimator;
}

- (PXZoomablePhotosMiniModeAnimator)init
{
  v14.receiver = self;
  v14.super_class = (Class)PXZoomablePhotosMiniModeAnimator;
  v2 = [(PXZoomablePhotosMiniModeAnimator *)&v14 init];
  if (v2)
  {
    double v3 = (PXNumberAnimator *)objc_alloc_init((Class)off_1E5DA74E8);
    gridExpansionAnimator = v2->_gridExpansionAnimator;
    v2->_gridExpansionAnimator = v3;

    v5 = (PXNumberAnimator *)objc_alloc_init((Class)off_1E5DA74E8);
    gridMiniStylingAnimator = v2->_gridMiniStylingAnimator;
    v2->_gridMiniStylingAnimator = v5;

    v7 = (PXNumberAnimator *)objc_alloc_init((Class)off_1E5DA74E8);
    gridMiniChromeVisibilityAnimator = v2->_gridMiniChromeVisibilityAnimator;
    v2->_gridMiniChromeVisibilityAnimator = v7;

    v9 = (PXNumberAnimator *)objc_alloc_init((Class)off_1E5DA74E8);
    gridBackgroundVisibilityAnimator = v2->_gridBackgroundVisibilityAnimator;
    v2->_gridBackgroundVisibilityAnimator = v9;

    [(PXNumberAnimator *)v2->_gridExpansionAnimator setHighFrameRateReason:2228229];
    [(PXNumberAnimator *)v2->_gridMiniStylingAnimator setHighFrameRateReason:2228229];
    [(PXNumberAnimator *)v2->_gridMiniChromeVisibilityAnimator setHighFrameRateReason:2228229];
    [(PXNumberAnimator *)v2->_gridBackgroundVisibilityAnimator setHighFrameRateReason:2228229];
    [(PXNumberAnimator *)v2->_gridExpansionAnimator registerChangeObserver:v2 context:PXZoomablePhotosMiniModeAnimatorGridExpansionContext];
    [(PXNumberAnimator *)v2->_gridMiniStylingAnimator registerChangeObserver:v2 context:PXZoomablePhotosMiniModeAnimatorGridMiniStylingContext];
    [(PXNumberAnimator *)v2->_gridMiniChromeVisibilityAnimator registerChangeObserver:v2 context:PXZoomablePhotosMiniModeAnimatorGridMiniChromeVisibilityContext];
    [(PXNumberAnimator *)v2->_gridBackgroundVisibilityAnimator registerChangeObserver:v2 context:PXZoomablePhotosMiniModeAnimatorGridBackgroundVisibilityContext];
    uint64_t v11 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v2 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v2->_updater;
    v2->_updater = (PXUpdater *)v11;

    [(PXUpdater *)v2->_updater addUpdateSelector:sel__updateAnimator needsUpdate:0];
    [(PXUpdater *)v2->_updater addUpdateSelector:sel__updateIsAnimating needsUpdate:0];
  }
  return v2;
}

- (BOOL)isActive
{
  return [(PXZoomablePhotosMiniModeAnimator *)self isAnimating]
      || [(PXZoomablePhotosMiniModeAnimator *)self targetState] != 0;
}

- (unint64_t)targetState
{
  return self->_targetState;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (BOOL)isContentAnimating
{
  return self->_isContentAnimating;
}

- (double)gridMiniChromeVisibilityPercentage
{
  v2 = [(PXZoomablePhotosMiniModeAnimator *)self gridMiniChromeVisibilityAnimator];
  [v2 presentationValue];
  double v4 = v3;

  return v4;
}

- (PXNumberAnimator)gridMiniChromeVisibilityAnimator
{
  return self->_gridMiniChromeVisibilityAnimator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridBackgroundVisibilityAnimator, 0);
  objc_storeStrong((id *)&self->_gridMiniChromeVisibilityAnimator, 0);
  objc_storeStrong((id *)&self->_gridMiniStylingAnimator, 0);
  objc_storeStrong((id *)&self->_gridExpansionAnimator, 0);
  objc_storeStrong((id *)&self->_rowFoldingValueAnimation, 0);
  objc_storeStrong((id *)&self->_rowUnfoldingValueAnimation, 0);
  objc_storeStrong((id *)&self->_rowFoldingAnimation, 0);
  objc_storeStrong((id *)&self->_rowUnfoldingAnimation, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (unint64_t)previousState
{
  return self->_previousState;
}

- (PXNumberAnimator)gridBackgroundVisibilityAnimator
{
  return self->_gridBackgroundVisibilityAnimator;
}

- (PXNumberAnimator)gridExpansionAnimator
{
  return self->_gridExpansionAnimator;
}

- (void)setGridExpansionVelocity:(double)a3
{
  self->_gridExpansionVelocity = a3;
}

- (double)gridExpansionVelocity
{
  return self->_gridExpansionVelocity;
}

- (double)interactionProgress
{
  return self->_interactionProgress;
}

- (void)_updateIsAnimating
{
  if ([(PXZoomablePhotosMiniModeAnimator *)self targetState] != 2
    && [(PXZoomablePhotosMiniModeAnimator *)self targetState] != 3)
  {
    double v3 = [(PXZoomablePhotosMiniModeAnimator *)self gridMiniStylingAnimator];
    char v4 = [v3 isAnimating];

    if ((v4 & 1) == 0)
    {
      [(PXZoomablePhotosMiniModeAnimator *)self interactionProgress];
      PXFloatApproximatelyEqualToFloat();
    }
  }
  [(PXZoomablePhotosMiniModeAnimator *)self setIsContentAnimating:1];
  [(PXZoomablePhotosMiniModeAnimator *)self setIsAnimating:1];
}

- (void)_invalidateIsAnimating
{
}

- (void)_applyAnimationValue:(id *)a3 toAnimator:(id)a4 animateImmediately:(BOOL)a5
{
  id v8 = a4;
  [v8 value];
  if (v9 != a3->var0)
  {
    if (a3->var5 && self->_performAnimated)
    {
      if (a3->var3)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke_2;
        v27[3] = &unk_1E5DD0FD0;
        id v10 = v8;
        id v28 = v10;
        [v10 performChangesWithoutAnimation:v27];
        double var4 = a3->var4;
        int64_t var3 = a3->var3;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke_3;
        v22[3] = &__block_descriptor_81_e35_v16__0___PXMutableNumberAnimator__8l;
        long long v13 = *(_OWORD *)&a3->var2;
        long long v23 = *(_OWORD *)&a3->var0;
        long long v24 = v13;
        long long v25 = *(_OWORD *)&a3->var4;
        BOOL v26 = a5;
        [v10 performChangesWithDuration:var3 curve:v22 changes:var4];
      }
      else
      {
        double var1 = a3->var1;
        double var2 = a3->var2;
        if (var2 == 0.0) {
          double var2 = 300.0;
        }
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke;
        v29[3] = &__block_descriptor_81_e35_v16__0___PXMutableNumberAnimator__8l;
        long long v17 = *(_OWORD *)&a3->var2;
        long long v30 = *(_OWORD *)&a3->var0;
        long long v31 = v17;
        long long v32 = *(_OWORD *)&a3->var4;
        BOOL v33 = a5;
        [v8 performChangesUsingSpringAnimationWithStiffness:v29 dampingRatio:var2 initialVelocity:1.0 changes:var1];
      }
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke_4;
      v18[3] = &__block_descriptor_80_e35_v16__0___PXMutableNumberAnimator__8l;
      long long v14 = *(_OWORD *)&a3->var2;
      long long v19 = *(_OWORD *)&a3->var0;
      long long v20 = v14;
      long long v21 = *(_OWORD *)&a3->var4;
      [v8 performChangesWithDuration:1 curve:v18 changes:0.0];
    }
  }
}

uint64_t __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(unsigned __int8 *)(a1 + 80) animateImmediately:*(double *)(a1 + 32)];
}

void __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 presentationValue];
  objc_msgSend(v3, "setValue:");
}

uint64_t __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setValue:*(unsigned __int8 *)(a1 + 80) animateImmediately:*(double *)(a1 + 32)];
}

uint64_t __87__PXZoomablePhotosMiniModeAnimator__applyAnimationValue_toAnimator_animateImmediately___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

- (void)_updateAnimator
{
  unint64_t v3 = [(PXZoomablePhotosMiniModeAnimator *)self targetState];
  unint64_t v4 = [(PXZoomablePhotosMiniModeAnimator *)self currentChanges];
  [(PXZoomablePhotosMiniModeAnimator *)self interactionProgress];
  v31[0] = 0;
  *(_DWORD *)((char *)v31 + 3) = 0;
  v30[0] = 0;
  uint64_t v6 = 0;
  *(_DWORD *)((char *)v30 + 3) = 0;
  double v7 = v5;
  uint64_t v8 = (v4 >> 2) & 1;
  switch(v3)
  {
    case 0uLL:
      [(PXZoomablePhotosMiniModeAnimator *)self gridExpansionVelocity];
      uint64_t v6 = v16;
      v31[0] = 0;
      *(_DWORD *)((char *)v31 + 3) = 0;
      v30[0] = 0;
      *(_DWORD *)((char *)v30 + 3) = 0;
      LOBYTE(v8) = 1;
      double v22 = 1.0;
      double v11 = 25.0;
      uint64_t v15 = 0x4049000000000000;
      uint64_t v12 = 0x4062C00000000000;
      double v13 = 0.0;
      uint64_t v14 = 0x4062C00000000000;
      double v10 = 0.0;
      char v9 = 1;
      double v7 = 1.0;
      break;
    case 1uLL:
      LOBYTE(v8) = 1;
      double v22 = 1.0;
      uint64_t v15 = 0x4049000000000000;
      uint64_t v14 = 0x4059000000000000;
      double v11 = 150.0;
      uint64_t v12 = 0x4062C00000000000;
      double v13 = 1.0;
      double v10 = 1.0;
      char v9 = 1;
      goto LABEL_6;
    case 2uLL:
    case 3uLL:
      char v9 = 0;
      double v22 = 1.0;
      double v10 = 1.0 - v5;
      double v11 = 50.0;
      uint64_t v12 = 0x4049000000000000;
      double v13 = 1.0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      break;
    default:
      LOBYTE(v8) = 0;
      char v9 = 0;
      double v11 = 0.0;
      double v22 = 0.0;
      uint64_t v12 = 0;
      double v13 = 0.0;
      uint64_t v14 = 0;
      double v10 = 0.0;
      uint64_t v15 = 0;
LABEL_6:
      double v7 = 0.0;
      break;
  }
  BOOL v17 = [(PXZoomablePhotosMiniModeAnimator *)self previousState] == 2
     || [(PXZoomablePhotosMiniModeAnimator *)self previousState] == 3;
  v18 = [(PXZoomablePhotosMiniModeAnimator *)self gridExpansionAnimator];
  double v23 = v7;
  uint64_t v24 = v6;
  double v25 = *(double *)&v15;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  char v28 = v9;
  memset(v29, 0, sizeof(v29));
  [(PXZoomablePhotosMiniModeAnimator *)self _applyAnimationValue:&v23 toAnimator:v18 animateImmediately:v17];

  long long v19 = [(PXZoomablePhotosMiniModeAnimator *)self gridMiniStylingAnimator];
  double v23 = v10;
  uint64_t v24 = 0;
  double v25 = *(double *)&v14;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  char v28 = v8;
  *(_DWORD *)v29 = v31[0];
  *(_DWORD *)&v29[3] = *(_DWORD *)((char *)v31 + 3);
  [(PXZoomablePhotosMiniModeAnimator *)self _applyAnimationValue:&v23 toAnimator:v19 animateImmediately:v17];

  long long v20 = [(PXZoomablePhotosMiniModeAnimator *)self gridMiniChromeVisibilityAnimator];
  double v23 = v13;
  uint64_t v24 = 0;
  double v25 = *(double *)&v12;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  char v28 = v8;
  *(_DWORD *)v29 = v30[0];
  *(_DWORD *)&v29[3] = *(_DWORD *)((char *)v30 + 3);
  [(PXZoomablePhotosMiniModeAnimator *)self _applyAnimationValue:&v23 toAnimator:v20 animateImmediately:v17];

  long long v21 = [(PXZoomablePhotosMiniModeAnimator *)self gridBackgroundVisibilityAnimator];
  double v23 = v22;
  uint64_t v24 = 0;
  double v25 = v11;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  char v28 = v8;
  memset(v29, 0, sizeof(v29));
  [(PXZoomablePhotosMiniModeAnimator *)self _applyAnimationValue:&v23 toAnimator:v21 animateImmediately:v17];
}

- (void)_invalidateAnimator
{
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosMiniModeAnimator;
  [(PXZoomablePhotosMiniModeAnimator *)&v3 didPerformChanges];
  [(PXUpdater *)self->_updater updateIfNeeded];
}

- (void)_setNeedsUpdate
{
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PXZoomablePhotosMiniModeAnimatorGridExpansionContext != a5
    && PXZoomablePhotosMiniModeAnimatorGridMiniStylingContext != (void)a5
    && PXZoomablePhotosMiniModeAnimatorGridMiniChromeVisibilityContext != (void)a5
    && PXZoomablePhotosMiniModeAnimatorGridBackgroundVisibilityContext != (void)a5)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXZoomablePhotosMiniModeAnimator.m" lineNumber:250 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  double v13 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__PXZoomablePhotosMiniModeAnimator_observable_didChange_context___block_invoke;
  v15[3] = &unk_1E5DD09C8;
  v15[4] = self;
  v15[5] = a4;
  [(PXZoomablePhotosMiniModeAnimator *)self performChanges:v15];
}

void __65__PXZoomablePhotosMiniModeAnimator_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 2) != 0)
  {
    [*(id *)(a1 + 32) signalChange:1];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if ((v3 & 4) != 0) {
    [*(id *)(a1 + 32) _invalidateIsAnimating];
  }
}

- (double)gridBackgroundVisibilityPercentage
{
  v2 = [(PXZoomablePhotosMiniModeAnimator *)self gridBackgroundVisibilityAnimator];
  [v2 presentationValue];
  double v4 = v3;

  return v4 * (2.0 - v4) * (2.0 - v4 * (2.0 - v4));
}

- (double)gridMiniFoldingPercentage
{
  [(PXZoomablePhotosMiniModeAnimator *)self interactionProgress];
  return 1.0 - v2;
}

- (double)gridExpansionPercentage
{
  double v2 = [(PXZoomablePhotosMiniModeAnimator *)self gridExpansionAnimator];
  [v2 presentationValue];
  double v4 = v3;

  return v4;
}

- (void)setIsContentAnimating:(BOOL)a3
{
  if (self->_isContentAnimating != a3)
  {
    self->_isContentAnimating = a3;
    [(PXZoomablePhotosMiniModeAnimator *)self signalChange:2];
  }
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    [(PXZoomablePhotosMiniModeAnimator *)self signalChange:2];
  }
}

- (void)setInteractionProgress:(double)a3
{
  if (self->_interactionProgress != a3)
  {
    self->_interactionProgress = a3;
    [(PXZoomablePhotosMiniModeAnimator *)self _invalidateAnimator];
    [(PXZoomablePhotosMiniModeAnimator *)self _invalidateIsAnimating];
    [(PXZoomablePhotosMiniModeAnimator *)self signalChange:1];
  }
}

- (void)setTargetState:(unint64_t)a3
{
  unint64_t targetState = self->_targetState;
  if (targetState != a3)
  {
    self->_previousState = targetState;
    self->_unint64_t targetState = a3;
    [(PXZoomablePhotosMiniModeAnimator *)self signalChange:4];
    [(PXZoomablePhotosMiniModeAnimator *)self _invalidateIsAnimating];
    [(PXZoomablePhotosMiniModeAnimator *)self _invalidateAnimator];
  }
}

- (void)performAnimated:(BOOL)a3 changes:(id)a4
{
  BOOL performAnimated = self->_performAnimated;
  self->_BOOL performAnimated = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXZoomablePhotosMiniModeAnimator;
  [(PXZoomablePhotosMiniModeAnimator *)&v6 performChanges:a4];
  self->_BOOL performAnimated = performAnimated;
}

- (void)performChanges:(id)a3
{
}

- (NSString)description
{
  double v3 = (void *)MEMORY[0x1E4F28E78];
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; targetState:%lu interactionProgress:%.2f \n",
    v5,
    self,
    self->_targetState,
  objc_super v6 = *(void *)&self->_interactionProgress);

  [v6 appendFormat:@"gridExpansion: %@\n", self->_gridExpansionAnimator];
  [v6 appendFormat:@"gridMiniStyling: %@\n", self->_gridMiniStylingAnimator];
  [v6 appendFormat:@"gridMiniChromeVisibility: %@\n", self->_gridMiniChromeVisibilityAnimator];
  [v6 appendFormat:@"gridBackgroundVisibility: %@\n", self->_gridBackgroundVisibilityAnimator];
  [v6 appendFormat:@">;"];
  return (NSString *)v6;
}

@end