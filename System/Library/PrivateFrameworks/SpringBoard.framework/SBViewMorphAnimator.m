@interface SBViewMorphAnimator
- (BOOL)_isReversed;
- (BOOL)_isTargetSourcePinningFrameEquivalentToSourceViewFrame;
- (BOOL)automaticallyStartSourceAnimations;
- (BOOL)automaticallyStartTargetAnimations;
- (BOOL)invalidated;
- (BOOL)preflightCheck;
- (BOOL)sourceAllEnded;
- (BOOL)sourceContentFrameWasAltered;
- (BOOL)startSourceAnimations:(unint64_t)a3;
- (BOOL)startTargetAnimations:(unint64_t)a3;
- (BOOL)targetExternalPlaceholderAllEnded;
- (BSAbsoluteMachTimer)allAnimationsTimeoutTimer;
- (BSAbsoluteMachTimer)morphAnimationTimeout;
- (BSAbsoluteMachTimer)sourceAnimationsCompletionContinueBlockTimeoutTimer;
- (CGPoint)_source:(id)a3 finalCenterWithFinalScale:(double)a4 contentFrame:(CGRect)a5 targetFinalFrame:(CGRect)a6;
- (CGPoint)sourceFinalCenter;
- (CGRect)_sourceContentContainerFrameForSourceView:(id)a3 withTargetDataSource:(id)a4;
- (CGRect)_targetInitialClippingBoundsWithSourceContentFrame:(CGRect)a3 sourceFinalScale:(double)a4 targetViewBounds:(CGRect)a5;
- (CGRect)_targetSourcePinningFrameWithSourceContentFrame:(CGRect)a3 targetFinalFrame:(CGRect)a4;
- (CGRect)_validatedSourceContentFrame:(CGRect)a3 withinSourceView:(id)a4 withSourceFinalScale:(double)a5;
- (CGRect)sourceClippingFrame;
- (CGRect)sourceContentContainerFrame;
- (CGRect)sourceContentFrame;
- (CGRect)targetContentClippingViewInitialFrame;
- (CGRect)targetFinalFrame;
- (CGRect)targetSourcePinningFrame;
- (NSHashTable)observers;
- (NSUUID)uuid;
- (SBFFluidBehaviorSettings)sourceClipAnimationSettings;
- (SBFFluidBehaviorSettings)targetClipAnimationSettings;
- (SBViewMorphAnimator)init;
- (SBViewMorphAnimator)initWithUUID:(id)a3 windowScene:(id)a4 direction:(int64_t)a5;
- (SBViewMorphAnimatorContentBlackCurtainView)sourceBlackCurtainView;
- (SBViewMorphAnimatorContentClippingView)targetContentClippingView;
- (SBViewMorphAnimatorDataSource)dataSource;
- (SBViewMorphAnimatorDelegate)delegate;
- (SBWindowScene)windowScene;
- (UIView)sourceView;
- (UIView)targetContentView;
- (UIView)targetView;
- (double)_sourceFinalScaleWithContentFrame:(CGRect)a3 targetFinalFrame:(CGRect)a4;
- (double)sourceClippingCornerRadius;
- (double)sourceCornerRadius;
- (double)sourceFinalScale;
- (double)targetCornerRadius;
- (id)sourceAllAnimationsCompletionBlock;
- (int64_t)direction;
- (int64_t)fromOrientation;
- (int64_t)toOrientation;
- (unint64_t)completedSourceAnimations;
- (unint64_t)completedTargetAnimations;
- (unint64_t)startedSourceAnimations;
- (unint64_t)startedTargetAnimations;
- (void)_checkAnimationsDependencies:(id)a3;
- (void)_continueSourceAnimationsCompletionPendingBlock;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_handleHandoffTimeout;
- (void)_noteAnimatorWasCanceled;
- (void)_noteAnimatorWasInterrupted;
- (void)_noteDidEndAllAnimations;
- (void)_removeBlackCurtainView;
- (void)_removeMatchMoveAnimation;
- (void)_removeTargetClippingView;
- (void)_reset;
- (void)_resetAllAnimations;
- (void)_startMorphAnimationTimeoutTimer;
- (void)_updateParameters;
- (void)addObserver:(id)a3;
- (void)cancel:(id)a3;
- (void)dealloc;
- (void)didEndSourceAnimations:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5;
- (void)didEndTargetAnimations:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5;
- (void)interrupt:(id)a3;
- (void)noteSourceAnimationsDidEnd:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5;
- (void)noteSourceAnimationsWillStart:(unint64_t)a3;
- (void)noteTargetAnimationsDidEnd:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5;
- (void)noteTargetAnimationsWillStart:(unint64_t)a3;
- (void)noteWillRemoveTargeMatchMoveAnimationAtFrame:(CGRect)a3 withinSourceFrame:(CGRect)a4;
- (void)setAllAnimationsTimeoutTimer:(id)a3;
- (void)setAutomaticallyStartSourceAnimations:(BOOL)a3;
- (void)setAutomaticallyStartTargetAnimations:(BOOL)a3;
- (void)setCompletedSourceAnimations:(unint64_t)a3;
- (void)setCompletedTargetAnimations:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setFromOrientation:(int64_t)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setMorphAnimationTimeout:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSourceAllAnimationsCompletionBlock:(id)a3;
- (void)setSourceAllEnded:(BOOL)a3;
- (void)setSourceAnimationsCompletionContinueBlockTimeoutTimer:(id)a3;
- (void)setSourceBlackCurtainView:(id)a3;
- (void)setSourceClipAnimationSettings:(id)a3;
- (void)setSourceContentContainerFrame:(CGRect)a3;
- (void)setSourceContentFrame:(CGRect)a3;
- (void)setSourceContentFrameWasAltered:(BOOL)a3;
- (void)setSourceCornerRadius:(double)a3;
- (void)setSourceView:(id)a3;
- (void)setStartedSourceAnimations:(unint64_t)a3;
- (void)setStartedTargetAnimations:(unint64_t)a3;
- (void)setTargetClipAnimationSettings:(id)a3;
- (void)setTargetContentClippingView:(id)a3;
- (void)setTargetContentClippingViewInitialFrame:(CGRect)a3;
- (void)setTargetContentView:(id)a3;
- (void)setTargetExternalPlaceholderAllEnded:(BOOL)a3;
- (void)setTargetView:(id)a3;
- (void)setToOrientation:(int64_t)a3;
- (void)willStartSourceAnimations:(unint64_t)a3;
- (void)willStartTargetAnimations:(unint64_t)a3;
@end

@implementation SBViewMorphAnimator

- (SBViewMorphAnimator)initWithUUID:(id)a3 windowScene:(id)a4 direction:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBViewMorphAnimator;
  v11 = [(SBViewMorphAnimator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    v12->_direction = a5;
    objc_storeWeak((id *)&v12->_windowScene, v10);
    [(SBViewMorphAnimator *)v12 _reset];
  }

  return v12;
}

- (SBViewMorphAnimator)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"SBViewMorphAnimator.m", 104, @"unavailable initializer, use -initWithUUID:" object file lineNumber description];

  return 0;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] dealloc", buf, 0xCu);
  }

  [(SBViewMorphAnimator *)self _resetAllAnimations];
  v4.receiver = self;
  v4.super_class = (Class)SBViewMorphAnimator;
  [(SBViewMorphAnimator *)&v4 dealloc];
}

- (void)_reset
{
  self->_invalidated = 0;
  CGPoint v3 = (CGPoint)*MEMORY[0x1E4F1DB20];
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_targetFinalFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_targetFinalFrame.size = v4;
  self->_sourceFinalCenter = (CGPoint)SBInvalidPoint;
  self->_targetSourcePinningFrame.origin = v3;
  self->_targetSourcePinningFrame.size = v4;
  *(_OWORD *)&self->_sourceFinalScale = xmmword_1D8FD19C0;
  self->_fromOrientation = 0;
  self->_toOrientation = 0;
  *(_WORD *)&self->_automaticallyStartSourceAnimations = 257;
  self->_sourceContentContainerFrame.origin = v3;
  self->_sourceContentContainerFrame.size = v4;
  self->_sourceCornerRadius = 0.0;
  observers = self->_observers;
  self->_observers = 0;

  self->_startedSourceAnimations = 0;
  self->_completedSourceAnimations = 0;
  self->_completedTargetAnimations = 0;
  id sourceAllAnimationsCompletionBlock = self->_sourceAllAnimationsCompletionBlock;
  self->_id sourceAllAnimationsCompletionBlock = 0;

  targetContentClippingView = self->_targetContentClippingView;
  self->_targetContentClippingView = 0;

  sourceBlackCurtainView = self->_sourceBlackCurtainView;
  self->_sourceBlackCurtainView = 0;
}

- (void)cancel:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  CGSize v4 = (void (**)(void))a3;
  v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Layout][Morph Animator][%p] was canceled", (uint8_t *)&v7, 0xCu);
  }

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (!self->_direction)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
      [WeakRetained setAlpha:0.0];
    }
    [(SBViewMorphAnimator *)self _resetAllAnimations];
    [(SBViewMorphAnimator *)self _noteAnimatorWasCanceled];
    [(SBViewMorphAnimator *)self _continueSourceAnimationsCompletionPendingBlock];
  }
  if (v4) {
    v4[2](v4);
  }
}

- (void)interrupt:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  CGSize v4 = (void (**)(void))a3;
  v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = self;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Layout][Morph Animator][%p] was interrupted", buf, 0xCu);
  }

  if (self->_invalidated)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    [(SBViewMorphAnimator *)self _noteAnimatorWasInterrupted];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__SBViewMorphAnimator_interrupt___block_invoke;
    v6[3] = &unk_1E6AF6828;
    v6[4] = self;
    int v7 = v4;
    [(SBViewMorphAnimator *)self cancel:v6];
  }
}

void __33__SBViewMorphAnimator_interrupt___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F42FF0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SBViewMorphAnimator_interrupt___block_invoke_2;
  v4[3] = &unk_1E6AF4AC0;
  v4[4] = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__SBViewMorphAnimator_interrupt___block_invoke_3;
  v2[3] = &unk_1E6AF5A50;
  id v3 = *(id *)(a1 + 40);
  [v1 animateWithDuration:v4 animations:v2 completion:0.2];
}

void __33__SBViewMorphAnimator_interrupt___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained setAlpha:1.0];
}

uint64_t __33__SBViewMorphAnimator_interrupt___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_resetAllAnimations
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(SBViewMorphAnimator *)self _removeBlackCurtainView];
  [(SBViewMorphAnimator *)self _removeTargetClippingView];
  [(SBViewMorphAnimator *)self _removeMatchMoveAnimation];
  [(BSAbsoluteMachTimer *)self->_allAnimationsTimeoutTimer invalidate];
  [(BSAbsoluteMachTimer *)self->_morphAnimationTimeout invalidate];
  [(BSAbsoluteMachTimer *)self->_sourceAnimationsCompletionContinueBlockTimeoutTimer invalidate];
  allAnimationsTimeoutTimer = self->_allAnimationsTimeoutTimer;
  self->_allAnimationsTimeoutTimer = 0;

  morphAnimationTimeout = self->_morphAnimationTimeout;
  self->_morphAnimationTimeout = 0;

  sourceAnimationsCompletionContinueBlockTimeoutTimer = self->_sourceAnimationsCompletionContinueBlockTimeoutTimer;
  self->_sourceAnimationsCompletionContinueBlockTimeoutTimer = 0;

  v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[Layout][Morph Animator][%p] did reset all animations", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_removeTargetClippingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetContentView);
  targetContentClippingView = self->_targetContentClippingView;
  if (targetContentClippingView)
  {
    CGSize v4 = [(SBViewMorphAnimatorContentClippingView *)targetContentClippingView superview];
    [v4 insertSubview:WeakRetained belowSubview:self->_targetContentClippingView];

    [(SBViewMorphAnimatorContentClippingView *)self->_targetContentClippingView frame];
    objc_msgSend(WeakRetained, "setFrame:");
    [(SBViewMorphAnimatorContentClippingView *)self->_targetContentClippingView removeFromSuperview];
    v5 = self->_targetContentClippingView;
    self->_targetContentClippingView = 0;
  }
}

- (void)_removeBlackCurtainView
{
  sourceBlackCurtainView = self->_sourceBlackCurtainView;
  if (sourceBlackCurtainView)
  {
    [(SBViewMorphAnimatorContentBlackCurtainView *)sourceBlackCurtainView removeFromSuperview];
    CGSize v4 = self->_sourceBlackCurtainView;
    self->_sourceBlackCurtainView = 0;
  }
}

- (double)sourceClippingCornerRadius
{
  return self->_targetCornerRadius / self->_sourceFinalScale;
}

- (CGRect)sourceClippingFrame
{
  return CGRectInset(self->_sourceContentFrame, 1.0, 1.0);
}

- (BOOL)_isReversed
{
  return self->_direction == 1;
}

- (BOOL)preflightCheck
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  CGSize v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained sourceContentFrameForAnimator:self];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v4 targetFinalFrameForAnimator:self];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    v35.origin.x = v6;
    v35.origin.y = v8;
    v35.size.width = v10;
    v35.size.height = v12;
    if (CGRectIsNull(v35))
    {
      BOOL v21 = 0;
    }
    else
    {
      v36.origin.x = v14;
      v36.origin.y = v16;
      v36.size.width = v18;
      v36.size.height = v20;
      BOOL v21 = !CGRectIsNull(v36);
    }
    v22 = SBLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v37.origin.x = v6;
      v37.origin.y = v8;
      v37.size.width = v10;
      v37.size.height = v12;
      v23 = NSStringFromRect(v37);
      v38.origin.x = v14;
      v38.origin.y = v16;
      v38.size.width = v18;
      v38.size.height = v20;
      v24 = NSStringFromRect(v38);
      int v26 = 134218754;
      v27 = self;
      __int16 v28 = 1024;
      BOOL v29 = v21;
      __int16 v30 = 2112;
      v31 = v23;
      __int16 v32 = 2112;
      v33 = v24;
      _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "[Layout][Morph Animator][%p] Preflight check succeeded? %{BOOL}u, with sourceContentFrame: %@, targetFinalFrame: %@.", (uint8_t *)&v26, 0x26u);
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
  [(SBViewMorphAnimator *)self _updateParameters];
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
  [(SBViewMorphAnimator *)self _updateParameters];
  if (a3 && self->_automaticallyStartSourceAnimations)
  {
    [(SBViewMorphAnimator *)self startSourceAnimations:15];
  }
}

- (void)setTargetView:(id)a3
{
  objc_storeWeak((id *)&self->_targetView, a3);
  [(SBViewMorphAnimator *)self _updateParameters];
  if (self->_direction == 1)
  {
    if (!a3)
    {
      [(SBViewMorphAnimator *)self noteTargetAnimationsDidEnd:4 finished:1 continueBlock:0];
      return;
    }
  }
  else
  {
    [(SBViewMorphAnimator *)self noteTargetAnimationsDidEnd:4 finished:1 continueBlock:0];
  }
  if (a3)
  {
    if (self->_automaticallyStartTargetAnimations)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_targetContentView);

      if (WeakRetained)
      {
        [(SBViewMorphAnimator *)self startTargetAnimations:1];
      }
    }
  }
}

- (void)setTargetContentView:(id)a3
{
  objc_storeWeak((id *)&self->_targetContentView, a3);
  [(SBViewMorphAnimator *)self _updateParameters];
  if (self->_automaticallyStartTargetAnimations)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);

    if (a3)
    {
      if (WeakRetained)
      {
        [(SBViewMorphAnimator *)self startTargetAnimations:1];
      }
    }
  }
}

- (void)_updateParameters
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  BOOL v4 = [(SBViewMorphAnimator *)self _isReversed];
  id v5 = objc_loadWeakRetained((id *)&self->_sourceView);
  id v6 = objc_loadWeakRetained((id *)&self->_targetView);
  if (v5)
  {
    [WeakRetained sourceCornerRadiusForAnimator:self];
    self->_sourceCornerRadius = v7;
    [WeakRetained targetFinalCornerRadiusForAnimator:self];
    self->_double targetCornerRadius = v8;
    [WeakRetained targetFinalFrameForAnimator:self];
    self->_targetFinalFrame.origin.double x = v9;
    self->_targetFinalFrame.origin.double y = v10;
    self->_targetFinalFrame.size.double width = v11;
    self->_targetFinalFrame.size.double height = v12;
    [WeakRetained sourceContentFrameForAnimator:self];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    if (v4)
    {
      [v6 frame];
      double x = v21;
      double y = v23;
      double width = v25;
      double height = v27;
    }
    else
    {
      double x = self->_targetFinalFrame.origin.x;
      double y = self->_targetFinalFrame.origin.y;
      double width = self->_targetFinalFrame.size.width;
      double height = self->_targetFinalFrame.size.height;
    }
    -[SBViewMorphAnimator _sourceFinalScaleWithContentFrame:targetFinalFrame:](self, "_sourceFinalScaleWithContentFrame:targetFinalFrame:", v14, v16, v18, v20, x, y, width, height);
    -[SBViewMorphAnimator _validatedSourceContentFrame:withinSourceView:withSourceFinalScale:](self, "_validatedSourceContentFrame:withinSourceView:withSourceFinalScale:", v5, v14, v16, v18, v20, v29);
    self->_sourceContentFrame.origin.double x = v30;
    self->_sourceContentFrame.origin.double y = v31;
    self->_sourceContentFrame.size.double width = v32;
    self->_sourceContentFrame.size.double height = v33;
    if (v4)
    {
      [v6 frame];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v30 = self->_sourceContentFrame.origin.x;
      double v31 = self->_sourceContentFrame.origin.y;
      double v32 = self->_sourceContentFrame.size.width;
      double v33 = self->_sourceContentFrame.size.height;
    }
    else
    {
      double v35 = self->_targetFinalFrame.origin.x;
      double v37 = self->_targetFinalFrame.origin.y;
      double v39 = self->_targetFinalFrame.size.width;
      double v41 = self->_targetFinalFrame.size.height;
    }
    -[SBViewMorphAnimator _sourceFinalScaleWithContentFrame:targetFinalFrame:](self, "_sourceFinalScaleWithContentFrame:targetFinalFrame:", v30, v31, v32, v33, v35, v37, v39, v41);
    double v43 = v42;
    self->_double sourceFinalScale = v42;
    if (v4)
    {
      [v6 frame];
    }
    else
    {
      CGFloat v44 = self->_targetFinalFrame.origin.x;
      CGFloat v45 = self->_targetFinalFrame.origin.y;
      CGFloat v46 = self->_targetFinalFrame.size.width;
      CGFloat v47 = self->_targetFinalFrame.size.height;
    }
    -[SBViewMorphAnimator _source:finalCenterWithFinalScale:contentFrame:targetFinalFrame:](self, "_source:finalCenterWithFinalScale:contentFrame:targetFinalFrame:", v5, v43, self->_sourceContentFrame.origin.x, self->_sourceContentFrame.origin.y, self->_sourceContentFrame.size.width, self->_sourceContentFrame.size.height, *(void *)&v44, *(void *)&v45, *(void *)&v46, *(void *)&v47);
    self->_sourceFinalCenter.double x = v48;
    self->_sourceFinalCenter.double y = v49;
    -[SBViewMorphAnimator _targetSourcePinningFrameWithSourceContentFrame:targetFinalFrame:](self, "_targetSourcePinningFrameWithSourceContentFrame:targetFinalFrame:", self->_sourceContentFrame.origin.x, self->_sourceContentFrame.origin.y, self->_sourceContentFrame.size.width, self->_sourceContentFrame.size.height, self->_targetFinalFrame.origin.x, self->_targetFinalFrame.origin.y, self->_targetFinalFrame.size.width, self->_targetFinalFrame.size.height);
    self->_targetSourcePinningFrame.origin.double x = v50;
    self->_targetSourcePinningFrame.origin.double y = v51;
    self->_targetSourcePinningFrame.size.double width = v52;
    self->_targetSourcePinningFrame.size.double height = v53;
    [(SBViewMorphAnimator *)self _sourceContentContainerFrameForSourceView:v5 withTargetDataSource:WeakRetained];
    self->_sourceContentContainerFrame.origin.double x = v54;
    self->_sourceContentContainerFrame.origin.double y = v55;
    self->_sourceContentContainerFrame.size.double width = v56;
    self->_sourceContentContainerFrame.size.double height = v57;
    v58 = SBLogCommon();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v68 = NSStringFromCGRect(self->_sourceContentFrame);
      v59 = NSStringFromCGRect(self->_targetFinalFrame);
      double sourceFinalScale = self->_sourceFinalScale;
      v61 = NSStringFromCGPoint(self->_sourceFinalCenter);
      v62 = NSStringFromCGRect(self->_targetSourcePinningFrame);
      uint64_t v63 = NSStringFromCGRect(self->_sourceContentContainerFrame);
      BOOL v64 = v4;
      id v65 = v6;
      v66 = (void *)v63;
      double targetCornerRadius = self->_targetCornerRadius;
      *(_DWORD *)buf = 134220034;
      v70 = self;
      __int16 v71 = 2114;
      v72 = v68;
      __int16 v73 = 2114;
      v74 = v59;
      __int16 v75 = 2048;
      double v76 = sourceFinalScale;
      __int16 v77 = 2114;
      v78 = v61;
      __int16 v79 = 2114;
      v80 = v62;
      __int16 v81 = 2114;
      uint64_t v82 = v63;
      __int16 v83 = 2048;
      double v84 = targetCornerRadius;
      __int16 v85 = 1024;
      BOOL v86 = v64;
      _os_log_impl(&dword_1D85BA000, v58, OS_LOG_TYPE_DEFAULT, "[Layout][Morph Animator][%p] Parameters update: _sourceContentFrame(%{public}@) _targetFinalFrame(%{public}@) _sourceFinalScale(%.2f) _sourceFinalCenter(%{public}@) _targetSourcePinningFrame(%{public}@) _sourceContentContainerFrame(%{public}@) _targetCornerRadius(%.2f) isAnimationDirectionReversed(%{BOOL}u)", buf, 0x58u);

      id v6 = v65;
    }
  }
}

- (BOOL)_isTargetSourcePinningFrameEquivalentToSourceViewFrame
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  [WeakRetained bounds];
  v9.origin.double x = v4;
  v9.origin.double y = v5;
  v9.size.double width = v6;
  v9.size.double height = v7;
  LOBYTE(v2) = CGRectContainsRect(v2->_targetSourcePinningFrame, v9);

  return (char)v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    CGFloat v6 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:2];
    CGFloat v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  if (![(NSHashTable *)observers containsObject:v4]) {
    [(NSHashTable *)self->_observers addObject:v8];
  }
}

- (void)noteSourceAnimationsWillStart:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__SBViewMorphAnimator_noteSourceAnimationsWillStart___block_invoke;
  v3[3] = &__block_descriptor_40_e39_v16__0___SBViewMorphAnimatorObserver__8l;
  v3[4] = a3;
  [(SBViewMorphAnimator *)self _enumerateObserversRespondingToSelector:sel_willStartSourceAnimations_ usingBlock:v3];
}

uint64_t __53__SBViewMorphAnimator_noteSourceAnimationsWillStart___block_invoke(uint64_t a1, void *a2)
{
  return [a2 willStartSourceAnimations:*(void *)(a1 + 32)];
}

- (void)noteSourceAnimationsDidEnd:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__SBViewMorphAnimator_noteSourceAnimationsDidEnd_finished_continueBlock___block_invoke;
  v10[3] = &unk_1E6B03160;
  BOOL v13 = a4;
  id v11 = v8;
  unint64_t v12 = a3;
  id v9 = v8;
  [(SBViewMorphAnimator *)self _enumerateObserversRespondingToSelector:sel_didEndSourceAnimations_finished_continueBlock_ usingBlock:v10];
}

uint64_t __73__SBViewMorphAnimator_noteSourceAnimationsDidEnd_finished_continueBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didEndSourceAnimations:*(void *)(a1 + 40) finished:*(unsigned __int8 *)(a1 + 48) continueBlock:*(void *)(a1 + 32)];
}

- (void)noteTargetAnimationsWillStart:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__SBViewMorphAnimator_noteTargetAnimationsWillStart___block_invoke;
  v3[3] = &__block_descriptor_40_e39_v16__0___SBViewMorphAnimatorObserver__8l;
  v3[4] = a3;
  [(SBViewMorphAnimator *)self _enumerateObserversRespondingToSelector:sel_willStartTargetAnimations_ usingBlock:v3];
}

uint64_t __53__SBViewMorphAnimator_noteTargetAnimationsWillStart___block_invoke(uint64_t a1, void *a2)
{
  return [a2 willStartTargetAnimations:*(void *)(a1 + 32)];
}

- (void)noteWillRemoveTargeMatchMoveAnimationAtFrame:(CGRect)a3 withinSourceFrame:(CGRect)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__SBViewMorphAnimator_noteWillRemoveTargeMatchMoveAnimationAtFrame_withinSourceFrame___block_invoke;
  v4[3] = &__block_descriptor_96_e39_v16__0___SBViewMorphAnimatorObserver__8l;
  CGRect v5 = a3;
  CGRect v6 = a4;
  [(SBViewMorphAnimator *)self _enumerateObserversRespondingToSelector:sel_willRemoveTargeMatchMoveAnimationAtFrame_withinSourceFrame_ usingBlock:v4];
}

uint64_t __86__SBViewMorphAnimator_noteWillRemoveTargeMatchMoveAnimationAtFrame_withinSourceFrame___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "willRemoveTargeMatchMoveAnimationAtFrame:withinSourceFrame:", a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11]);
}

- (void)noteTargetAnimationsDidEnd:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__SBViewMorphAnimator_noteTargetAnimationsDidEnd_finished_continueBlock___block_invoke;
  v10[3] = &unk_1E6B03160;
  BOOL v13 = a4;
  id v11 = v8;
  unint64_t v12 = a3;
  id v9 = v8;
  [(SBViewMorphAnimator *)self _enumerateObserversRespondingToSelector:sel_didEndTargetAnimations_finished_continueBlock_ usingBlock:v10];
}

uint64_t __73__SBViewMorphAnimator_noteTargetAnimationsDidEnd_finished_continueBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didEndTargetAnimations:*(void *)(a1 + 40) finished:*(unsigned __int8 *)(a1 + 48) continueBlock:*(void *)(a1 + 32)];
}

- (void)_noteDidEndAllAnimations
{
}

uint64_t __47__SBViewMorphAnimator__noteDidEndAllAnimations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 didEndAllAnimations];
}

- (void)_noteAnimatorWasCanceled
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__SBViewMorphAnimator__noteAnimatorWasCanceled__block_invoke;
  v2[3] = &unk_1E6B031C8;
  void v2[4] = self;
  [(SBViewMorphAnimator *)self _enumerateObserversRespondingToSelector:sel_animatorWasCanceled_ usingBlock:v2];
}

uint64_t __47__SBViewMorphAnimator__noteAnimatorWasCanceled__block_invoke(uint64_t a1, void *a2)
{
  return [a2 animatorWasCanceled:*(void *)(a1 + 32)];
}

- (void)_noteAnimatorWasInterrupted
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__SBViewMorphAnimator__noteAnimatorWasInterrupted__block_invoke;
  v2[3] = &unk_1E6B031C8;
  void v2[4] = self;
  [(SBViewMorphAnimator *)self _enumerateObserversRespondingToSelector:sel_animatorWasInterrupted_ usingBlock:v2];
}

uint64_t __50__SBViewMorphAnimator__noteAnimatorWasInterrupted__block_invoke(uint64_t a1, void *a2)
{
  return [a2 animatorWasInterrupted:*(void *)(a1 + 32)];
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CGRect v5 = (void (**)(id, SBViewMorphAnimator *))a4;
  if (objc_opt_respondsToSelector()) {
    v5[2](v5, self);
  }
  if ([(NSHashTable *)self->_observers count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    CGRect v6 = [(NSHashTable *)self->_observers allObjects];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(SBViewMorphAnimator **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v11);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (CGRect)_validatedSourceContentFrame:(CGRect)a3 withinSourceView:(id)a4 withSourceFinalScale:(double)a5
{
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  self->_sourceContentFrameWasAltered = 0;
  if (a5 > 1.0 && self->_direction == 0)
  {
    CGFloat aRect = a3.size.height;
    id v14 = a4;
    [v14 bounds];
    double v10 = v15;
    [v14 bounds];
    double v17 = v16;

    double v19 = self->_targetFinalFrame.size.width;
    double height = self->_targetFinalFrame.size.height;
    double v9 = floor(v10 * (height / v19));
    if (v9 <= v17)
    {
      double v12 = 0.0;
      CGFloat v11 = 0.0;
    }
    else
    {
      double v20 = floor(v17 * (v19 / height));
      double v12 = (v10 - v20) * 0.5;
      CGFloat v11 = 0.0;
      double v10 = v20;
      double v9 = v17;
    }
    self->_sourceContentFrameWasAltered = 1;
    double v21 = SBLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = y;
      v36.size.CGFloat width = width;
      v36.size.double height = aRect;
      v22 = NSStringFromRect(v36);
      v37.origin.CGFloat x = v12;
      v37.origin.CGFloat y = 0.0;
      v37.size.CGFloat width = v10;
      v37.size.double height = v9;
      double v23 = NSStringFromRect(v37);
      *(_DWORD *)buf = 134218498;
      double v30 = self;
      __int16 v31 = 2114;
      double v32 = v22;
      __int16 v33 = 2114;
      double v34 = v23;
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "[Layout][Morph Animator][%p] Altering sourceContentFrame{%{public}@} to {%{public}@}", buf, 0x20u);
    }
  }
  else
  {
    double v9 = a3.size.height;
    double v10 = a3.size.width;
    CGFloat v11 = a3.origin.y;
    double v12 = a3.origin.x;
  }
  double v24 = v12;
  double v25 = v11;
  double v26 = v10;
  double v27 = v9;
  result.size.double height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (CGRect)_sourceContentContainerFrameForSourceView:(id)a3 withTargetDataSource:(id)a4
{
  if (a4)
  {
    [a4 sourceContentContainerFrameForAnimator:self];
    return CGRectInset(v4, -1.0, -1.0);
  }
  else
  {
    return *(CGRect *)*(void *)&MEMORY[0x1E4F1DB20];
  }
}

- (double)_sourceFinalScaleWithContentFrame:(CGRect)a3 targetFinalFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat rect = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v7 = a3.size.height;
  double v8 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  double v11 = 0.0;
  if (!CGRectIsNull(a3))
  {
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = rect;
    v14.size.double width = width;
    v14.size.double height = height;
    if (!CGRectIsNull(v14))
    {
      v15.origin.CGFloat x = v10;
      v15.origin.CGFloat y = y;
      v15.size.double width = v8;
      v15.size.double height = v7;
      if (!CGRectIsEmpty(v15))
      {
        if (width / v8 >= height / v7) {
          return height / v7;
        }
        else {
          return width / v8;
        }
      }
    }
  }
  return v11;
}

- (CGPoint)_source:(id)a3 finalCenterWithFinalScale:(double)a4 contentFrame:(CGRect)a5 targetFinalFrame:(CGRect)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  double v13 = *MEMORY[0x1E4F1DAD8];
  double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v12)
  {
    v47.origin.CGFloat x = x;
    v47.origin.CGFloat y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    if (!CGRectIsNull(v47) && !CGRectIsNull(a6))
    {
      UIRectGetCenter();
      double v16 = v15;
      double v32 = v17;
      [v12 bounds];
      UIRectGetCenter();
      double v19 = v18;
      double v21 = v20;
      UIRectGetCenter();
      CGFloat v31 = v19;
      double v13 = v16 + (v19 - v22) * a4;
      double v14 = v32 + (v21 - v23) * a4;
      double v24 = SBLogPIP();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        double v27 = NSStringFromCGRect(a6);
        v44.CGFloat y = v21;
        v44.CGFloat x = v31;
        __int16 v28 = NSStringFromCGPoint(v44);
        v48.origin.CGFloat x = x;
        v48.origin.CGFloat y = y;
        v48.size.CGFloat width = width;
        v48.size.CGFloat height = height;
        double v29 = NSStringFromCGRect(v48);
        v45.CGFloat x = v13;
        v45.CGFloat y = v14;
        double v30 = NSStringFromCGPoint(v45);
        *(_DWORD *)buf = 134219010;
        double v34 = self;
        __int16 v35 = 2114;
        NSRect v36 = v27;
        __int16 v37 = 2114;
        double v38 = v28;
        __int16 v39 = 2114;
        double v40 = v29;
        __int16 v41 = 2114;
        double v42 = v30;
        _os_log_debug_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEBUG, "[Layout][Morph Animator][%p] finalCenterWithFinalScale finalFrame[%{public}@] containerCenter[%{public}@] contentFrame:[%{public}@] sourceFinalCenter[%{public}@]", buf, 0x34u);
      }
    }
  }

  double v25 = v13;
  double v26 = v14;
  result.CGFloat y = v26;
  result.CGFloat x = v25;
  return result;
}

- (CGRect)_targetSourcePinningFrameWithSourceContentFrame:(CGRect)a3 targetFinalFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v22 = a3.size.width;
  double v23 = a3.size.height;
  if (!CGRectIsNull(a3))
  {
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    if (!CGRectIsNull(v26))
    {
      if (v22 / width >= v23 / height) {
        double v8 = v22 / width;
      }
      else {
        double v8 = v23 / height;
      }
      BSRectWithSize();
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v24.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v24.c = v17;
      *(_OWORD *)&v24.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformScale(&v25, &v24, v8, v8);
      v27.origin.CGFloat x = v10;
      v27.origin.CGFloat y = v12;
      v27.size.double width = v14;
      v27.size.double height = v16;
      CGRectApplyAffineTransform(v27, &v25);
      UIRectGetCenter();
      UIRectCenteredAboutPoint();
    }
  }
  SBScreenScale();
  BSRectRoundForScale();
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)_targetInitialClippingBoundsWithSourceContentFrame:(CGRect)a3 sourceFinalScale:(double)a4 targetViewBounds:(CGRect)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectIsNull(a5))
  {
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    BOOL IsNull = CGRectIsNull(v18);
    if (a4 > 0.0 && !IsNull)
    {
      long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v16.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v16.c = v11;
      *(_OWORD *)&v16.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformScale(&v17, &v16, a4, a4);
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      CGRectApplyAffineTransform(v19, &v17);
    }
  }
  SBScreenScale();
  BSRectRoundForScale();
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)startSourceAnimations:(unint64_t)a3
{
  return !self->_invalidated;
}

- (BOOL)startTargetAnimations:(unint64_t)a3
{
  BOOL invalidated = self->_invalidated;
  if (!self->_invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
    id v7 = objc_loadWeakRetained((id *)&self->_targetView);
    id v8 = objc_loadWeakRetained((id *)&self->_targetContentView);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    CGRect v18 = __45__SBViewMorphAnimator_startTargetAnimations___block_invoke;
    CGRect v19 = &unk_1E6B031F0;
    double v20 = self;
    id v9 = WeakRetained;
    id v21 = v9;
    id v10 = v7;
    id v22 = v10;
    id v11 = v8;
    id v23 = v11;
    double v12 = v17;
    if (a3)
    {
      char v24 = 0;
      uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
      v13.i16[0] = vaddlv_u8(v13);
      int v14 = v13.i32[0];
      if (v13.i32[0])
      {
        unint64_t v15 = 0;
        do
        {
          if (((1 << v15) & a3) != 0)
          {
            ((void (*)(void *))v18)(v12);
            if (v24) {
              break;
            }
            --v14;
          }
          if (v15 > 0x3E) {
            break;
          }
          ++v15;
        }
        while (v14 > 0);
      }
    }
  }
  return !invalidated;
}

void __45__SBViewMorphAnimator_startTargetAnimations___block_invoke(id *a1, uint64_t a2)
{
  v90[4] = *MEMORY[0x1E4F143B8];
  id v3 = a1[4];
  if ((a2 & ~v3[15]) == 0) {
    return;
  }
  int v5 = [v3 _isReversed];
  if (a2 != 2)
  {
    if (a2 != 1) {
      return;
    }
    if (!a1[5]
      || !a1[6]
      || !a1[7]
      || CGRectIsNull(*(CGRect *)((char *)a1[4] + 368))
      || CGRectIsNull(*(CGRect *)((char *)a1[4] + 272)))
    {
      CGRect v6 = SBLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (char *)a1[4];
        id v8 = NSStringFromRect(*(NSRect *)(v7 + 368));
        id v9 = NSStringFromRect(*(NSRect *)((char *)a1[4] + 272));
        id v10 = a1[5];
        id v11 = a1[6];
        id v12 = a1[7];
        *(_DWORD *)buf = 134219266;
        *(void *)&uint8_t buf[4] = v7;
        __int16 v80 = 2112;
        __int16 v81 = v8;
        __int16 v82 = 2112;
        __int16 v83 = v9;
        __int16 v84 = 2048;
        id v85 = v10;
        __int16 v86 = 2048;
        id v87 = v11;
        __int16 v88 = 2048;
        id v89 = v12;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Interrupting morph animator since match move was requested to start with invalid frames _sourceContentFrame{%@} _targetFinalFrame{%@} or missing views: sourceView(%p) targetView(%p) targetContentView(%p)", buf, 0x3Eu);
      }
      [a1[4] interrupt:0];
      return;
    }
    [a1[6] layoutIfNeeded];
    [a1[6] bounds];
    uint64_t v70 = v26;
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    __int16 v33 = (double *)a1[4];
    CGFloat v34 = v33[30];
    CGFloat v35 = v33[31];
    CGFloat v36 = v33[32];
    CGFloat v37 = v33[33];
    id v14 = objc_alloc_init(MEMORY[0x1E4F39C00]);
    double v38 = [a1[5] layer];
    [v14 setSourceLayer:v38];

    __int16 v39 = (void *)MEMORY[0x1E4F29238];
    v92.origin.CGFloat x = v34;
    v92.origin.CGFloat y = v35;
    v92.size.CGFloat width = v36;
    v92.size.CGFloat height = v37;
    double MinX = CGRectGetMinX(v92);
    v93.origin.CGFloat x = v34;
    v93.origin.CGFloat y = v35;
    v93.size.CGFloat width = v36;
    v93.size.CGFloat height = v37;
    __int16 v41 = objc_msgSend(v39, "valueWithCGPoint:", MinX, CGRectGetMinY(v93));
    v90[0] = v41;
    double v42 = (void *)MEMORY[0x1E4F29238];
    v94.origin.CGFloat x = v34;
    v94.origin.CGFloat y = v35;
    v94.size.CGFloat width = v36;
    v94.size.CGFloat height = v37;
    double MaxX = CGRectGetMaxX(v94);
    v95.origin.CGFloat x = v34;
    v95.origin.CGFloat y = v35;
    v95.size.CGFloat width = v36;
    v95.size.CGFloat height = v37;
    CGPoint v44 = objc_msgSend(v42, "valueWithCGPoint:", MaxX, CGRectGetMinY(v95));
    v90[1] = v44;
    CGPoint v45 = (void *)MEMORY[0x1E4F29238];
    v96.origin.CGFloat x = v34;
    v96.origin.CGFloat y = v35;
    v96.size.CGFloat width = v36;
    v96.size.CGFloat height = v37;
    double v46 = CGRectGetMaxX(v96);
    v97.origin.CGFloat x = v34;
    v97.origin.CGFloat y = v35;
    v97.size.CGFloat width = v36;
    v97.size.CGFloat height = v37;
    CGRect v47 = objc_msgSend(v45, "valueWithCGPoint:", v46, CGRectGetMaxY(v97));
    v90[2] = v47;
    CGRect v48 = (void *)MEMORY[0x1E4F29238];
    v98.origin.CGFloat x = v34;
    v98.origin.CGFloat y = v35;
    v98.size.CGFloat width = v36;
    v98.size.CGFloat height = v37;
    double v49 = CGRectGetMinX(v98);
    v99.origin.CGFloat x = v34;
    v99.origin.CGFloat y = v35;
    v99.size.CGFloat width = v36;
    v99.size.CGFloat height = v37;
    CGFloat v50 = objc_msgSend(v48, "valueWithCGPoint:", v49, CGRectGetMaxY(v99));
    v90[3] = v50;
    CGFloat v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:4];
    [v14 setSourcePoints:v51];

    [v14 setDuration:INFINITY];
    CGFloat v52 = [a1[6] layer];
    [v52 addAnimation:v14 forKey:@"SBMorphAnimatorLayerMatchMoveAnimationKey"];

    [a1[4] _startMorphAnimationTimeoutTimer];
    [a1[7] layoutIfNeeded];
    CGFloat v53 = a1[4];
    [a1[7] frame];
    v53[38] = v54;
    v53[39] = v55;
    v53[40] = v56;
    v53[41] = v57;
    v58 = -[SBViewMorphAnimatorContentClippingView initWithFrame:]([SBViewMorphAnimatorContentClippingView alloc], "initWithFrame:", *((double *)a1[4] + 38), *((double *)a1[4] + 39), *((double *)a1[4] + 40), *((double *)a1[4] + 41));
    v59 = a1[4];
    v60 = (void *)v59[26];
    v59[26] = v58;

    v61 = [a1[7] superview];
    [v61 insertSubview:*((void *)a1[4] + 26) belowSubview:a1[7]];

    id v62 = a1[7];
    [*((id *)a1[4] + 26) bounds];
    objc_msgSend(v62, "setFrame:");
    [*((id *)a1[4] + 26) addSubview:a1[7]];
    [*((id *)a1[4] + 26) setClipsToBounds:1];
    id v63 = a1[4];
    if (v5)
    {
      double v64 = *((double *)v63 + 19);
      [*((id *)v63 + 26) _setContinuousCornerRadius:v64];
      [a1[7] _setContinuousCornerRadius:v64];
      id v65 = [*((id *)a1[4] + 26) layer];
      BSRectWithSize();
      objc_msgSend(v65, "setBounds:");
    }
    else
    {
      int v66 = [v63 _isTargetSourcePinningFrameEquivalentToSourceViewFrame];
      id v67 = a1[4];
      double v68 = 0.0;
      if (v66) {
        double v68 = *((double *)v67 + 27) * *((double *)v67 + 18);
      }
      [*((id *)v67 + 26) _setContinuousCornerRadius:v68];
      [a1[7] _setContinuousCornerRadius:v68];
      v69 = (double *)a1[4];
      objc_msgSend(v69, "_targetInitialClippingBoundsWithSourceContentFrame:sourceFinalScale:targetViewBounds:", v69[46], v69[47], v69[48], v69[49], v69[18], v70, v28, v30, v32);
      objc_msgSend(*((id *)a1[4] + 26), "setBounds:");
    }
    [MEMORY[0x1E4F39CF8] commit];
    [a1[4] noteTargetAnimationsWillStart:1];
LABEL_27:

    return;
  }
  uint8x8_t v13 = a1[4];
  if (v13[26])
  {
    double v78 = 0.0;
    *(void *)buf = 0;
    id v14 = 0;
    unint64_t v15 = 0;
    if (!SBReduceMotion())
    {
      id v16 = *((id *)a1[4] + 10);
      id v14 = v16;
      if (v16)
      {
        [v16 dampingRatio];
        [v14 response];
        convertDampingRatioAndResponseToTensionAndFriction();
        CGAffineTransform v17 = (void *)MEMORY[0x1E4F4F840];
        CGRect v18 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
        unint64_t v15 = [v17 settingsWithMass:v18 stiffness:1.0 damping:*(double *)buf timingFunction:v78];
      }
      else
      {
        unint64_t v15 = 0;
      }
    }
    CGRect v19 = (double *)a1[4];
    if (v5)
    {
      int v20 = [v19 _isTargetSourcePinningFrameEquivalentToSourceViewFrame];
      CGRect v19 = (double *)a1[4];
      double v21 = 0.0;
      if (v20) {
        double v21 = v19[27] * v19[18];
      }
    }
    else
    {
      double v21 = v19[19];
    }
    double v22 = 0.0;
    if (!*((unsigned char *)v19 + 13)) {
      double v22 = 1.0;
    }
    [a1[7] setAlpha:v22];
    id v23 = (void *)MEMORY[0x1E4F4F898];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __45__SBViewMorphAnimator_startTargetAnimations___block_invoke_44;
    v72[3] = &unk_1E6AF7150;
    id v24 = a1[7];
    char v77 = v5;
    id v25 = a1[4];
    id v73 = v24;
    id v74 = v25;
    id v75 = a1[6];
    double v76 = v21;
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __45__SBViewMorphAnimator_startTargetAnimations___block_invoke_2;
    v71[3] = &unk_1E6AF5350;
    v71[4] = a1[4];
    [v23 animateWithSettings:v15 actions:v72 completion:v71];
    [a1[4] noteTargetAnimationsWillStart:2];

    goto LABEL_27;
  }
  [v13 noteTargetAnimationsDidEnd:2 finished:0 continueBlock:0];
}

uint64_t __45__SBViewMorphAnimator_startTargetAnimations___block_invoke_44(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(a1 + 64))
  {
    CGRect v26 = CGRectIntersection(*(CGRect *)(v2 + 368), *(CGRect *)(v2 + 336));
    double x = v26.origin.x;
    double y = v26.origin.y;
    double width = v26.size.width;
    double height = v26.size.height;
    double v7 = *(double *)(*(void *)(a1 + 40) + 144);
    [*(id *)(a1 + 48) bounds];
    objc_msgSend((id)v2, "_targetInitialClippingBoundsWithSourceContentFrame:sourceFinalScale:targetViewBounds:", x, y, width, height, v7, v8, v9, v10, v11);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    int v20 = [*(id *)(*(void *)(a1 + 40) + 208) layer];
    objc_msgSend(v20, "setBounds:", v13, v15, v17, v19);
  }
  else
  {
    double v21 = *(void **)(v2 + 208);
    BSRectWithSize();
    objc_msgSend(v21, "setBounds:");
  }
  [*(id *)(*(void *)(a1 + 40) + 208) _setContinuousCornerRadius:*(double *)(a1 + 56)];
  double v22 = *(void **)(a1 + 32);
  double v23 = *(double *)(a1 + 56);
  return [v22 _setContinuousCornerRadius:v23];
}

uint64_t __45__SBViewMorphAnimator_startTargetAnimations___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) noteTargetAnimationsDidEnd:2 finished:1 continueBlock:0];
}

- (void)_startMorphAnimationTimeoutTimer
{
  [(BSAbsoluteMachTimer *)self->_morphAnimationTimeout invalidate];
  morphAnimationTimeout = self->_morphAnimationTimeout;
  self->_morphAnimationTimeout = 0;

  CGRect v4 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"morphAnimationTimeout"];
  int v5 = self->_morphAnimationTimeout;
  self->_morphAnimationTimeout = v4;

  objc_initWeak(&location, self);
  CGRect v6 = self->_morphAnimationTimeout;
  if ([(SBViewMorphAnimator *)self _isReversed])
  {
    UIAnimationDragCoefficient();
    double v8 = v7 * 1.5;
  }
  else
  {
    UIAnimationDragCoefficient();
    double v8 = v9;
  }
  uint64_t v10 = MEMORY[0x1E4F14428];
  id v11 = MEMORY[0x1E4F14428];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__SBViewMorphAnimator__startMorphAnimationTimeoutTimer__block_invoke;
  v12[3] = &unk_1E6AF5838;
  objc_copyWeak(&v13, &location);
  [(BSAbsoluteMachTimer *)v6 scheduleWithFireInterval:v10 leewayInterval:v12 queue:v8 handler:0.0];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __55__SBViewMorphAnimator__startMorphAnimationTimeoutTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained interrupt:0];
    [v3[23] invalidate];
    id v2 = v3[23];
    v3[23] = 0;

    id WeakRetained = v3;
  }
}

- (void)willStartSourceAnimations:(unint64_t)a3
{
  if (!self->_allAnimationsTimeoutTimer)
  {
    if ([(SBViewMorphAnimator *)self _isReversed])
    {
      int v5 = -[SBViewMorphAnimatorContentBlackCurtainView initWithFrame:]([SBViewMorphAnimatorContentBlackCurtainView alloc], "initWithFrame:", self->_sourceContentContainerFrame.origin.x, self->_sourceContentContainerFrame.origin.y, self->_sourceContentContainerFrame.size.width, self->_sourceContentContainerFrame.size.height);
      sourceBlackCurtainView = self->_sourceBlackCurtainView;
      self->_sourceBlackCurtainView = v5;

      float v7 = self->_sourceBlackCurtainView;
      double v8 = [MEMORY[0x1E4F428B8] blackColor];
      [(SBViewMorphAnimatorContentBlackCurtainView *)v7 setBackgroundColor:v8];

      float v9 = self->_sourceBlackCurtainView;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      [WeakRetained sourceBlackCurtainCornerRadiusForAnimator:self];
      -[SBViewMorphAnimatorContentBlackCurtainView _setContinuousCornerRadius:](v9, "_setContinuousCornerRadius:");

      id v11 = objc_loadWeakRetained((id *)&self->_sourceView);
      [v11 addSubview:self->_sourceBlackCurtainView];
    }
    objc_initWeak(&location, self);
    double v12 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"allAnimationsTimeout"];
    allAnimationsTimeoutTimer = self->_allAnimationsTimeoutTimer;
    self->_allAnimationsTimeoutTimer = v12;

    double v14 = self->_allAnimationsTimeoutTimer;
    if (self->_direction)
    {
      UIAnimationDragCoefficient();
      double v16 = 2.0;
    }
    else
    {
      UIAnimationDragCoefficient();
      double v16 = 1.5;
    }
    double v17 = v16 * v15;
    uint64_t v18 = MEMORY[0x1E4F14428];
    id v19 = MEMORY[0x1E4F14428];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __49__SBViewMorphAnimator_willStartSourceAnimations___block_invoke;
    v21[3] = &unk_1E6AF5838;
    objc_copyWeak(&v22, &location);
    [(BSAbsoluteMachTimer *)v14 scheduleWithFireInterval:v18 leewayInterval:v21 queue:v17 handler:0.0];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  unint64_t startedSourceAnimations = self->_startedSourceAnimations;
  self->_unint64_t startedSourceAnimations = startedSourceAnimations | a3;
  if ((startedSourceAnimations | a3) != startedSourceAnimations) {
    [(SBViewMorphAnimator *)self _checkAnimationsDependencies:0];
  }
}

void __49__SBViewMorphAnimator_willStartSourceAnimations___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained interrupt:0];
    [v3[22] invalidate];
    id v2 = v3[22];
    v3[22] = 0;

    id WeakRetained = v3;
  }
}

- (void)didEndSourceAnimations:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (v5)
  {
    unint64_t completedSourceAnimations = self->_completedSourceAnimations;
    self->_unint64_t completedSourceAnimations = completedSourceAnimations | a3;
    if ((completedSourceAnimations | a3) == completedSourceAnimations) {
      goto LABEL_6;
    }
    id v10 = v8;
    [(SBViewMorphAnimator *)self _checkAnimationsDependencies:v8];
  }
  else
  {
    id v10 = v8;
    [(SBViewMorphAnimator *)self interrupt:v8];
  }
  id v8 = v10;
LABEL_6:
}

- (void)willStartTargetAnimations:(unint64_t)a3
{
  unint64_t startedTargetAnimations = self->_startedTargetAnimations;
  self->_unint64_t startedTargetAnimations = startedTargetAnimations | a3;
  if ((startedTargetAnimations | a3) != startedTargetAnimations) {
    [(SBViewMorphAnimator *)self _checkAnimationsDependencies:0];
  }
}

- (void)didEndTargetAnimations:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (v5)
  {
    unint64_t completedTargetAnimations = self->_completedTargetAnimations;
    self->_unint64_t completedTargetAnimations = completedTargetAnimations | a3;
    if ((completedTargetAnimations | a3) == completedTargetAnimations) {
      goto LABEL_6;
    }
    id v10 = v8;
    [(SBViewMorphAnimator *)self _checkAnimationsDependencies:v8];
  }
  else
  {
    id v10 = v8;
    [(SBViewMorphAnimator *)self interrupt:v8];
  }
  id v8 = v10;
LABEL_6:
}

- (void)_removeMatchMoveAnimation
{
  [(SBViewMorphAnimator *)self _removeTargetClippingView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  id v3 = [WeakRetained layer];
  CGRect v4 = [v3 animationForKey:@"SBMorphAnimatorLayerMatchMoveAnimationKey"];

  if (v4)
  {
    if (self->_direction)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_sourceView);
      [v5 frame];
      -[SBViewMorphAnimator noteWillRemoveTargeMatchMoveAnimationAtFrame:withinSourceFrame:](self, "noteWillRemoveTargeMatchMoveAnimationAtFrame:withinSourceFrame:", self->_targetSourcePinningFrame.origin.x, self->_targetSourcePinningFrame.origin.y, self->_targetSourcePinningFrame.size.width, self->_targetSourcePinningFrame.size.height, v6, v7, v8, v9);

      id v10 = [WeakRetained layer];
      [v10 removeAnimationForKey:@"SBMorphAnimatorLayerMatchMoveAnimationKey"];

      [(BSAbsoluteMachTimer *)self->_morphAnimationTimeout invalidate];
      morphAnimationTimeout = self->_morphAnimationTimeout;
      self->_morphAnimationTimeout = 0;
    }
    else
    {
      morphAnimationTimeout = [WeakRetained layer];
      [morphAnimationTimeout removeAnimationForKey:@"SBMorphAnimatorLayerMatchMoveAnimationKey"];
    }
  }
}

- (void)_checkAnimationsDependencies:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(void))a3;
  double v6 = v5;
  if (self->_invalidated)
  {
    if (v5) {
      v5[2](v5);
    }
    goto LABEL_62;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  BOOL v8 = [(SBViewMorphAnimator *)self _isReversed];
  unint64_t completedSourceAnimations = self->_completedSourceAnimations;
  unint64_t startedSourceAnimations = self->_startedSourceAnimations;
  unint64_t completedTargetAnimations = self->_completedTargetAnimations;
  unint64_t v55 = completedSourceAnimations & 0xF;
  unint64_t startedTargetAnimations = self->_startedTargetAnimations;
  BOOL v11 = v55 == 15;
  double v12 = SBLogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = SBViewMorphAnimatorCompletedSourceAnimationsDescription(self->_startedSourceAnimations);
    SBViewMorphAnimatorCompletedTargetAnimationsDescription(self->_startedTargetAnimations);
    double v14 = v53 = WeakRetained;
    SBViewMorphAnimatorCompletedSourceAnimationsDescription(self->_completedSourceAnimations);
    float v15 = v52 = v6;
    SBViewMorphAnimatorCompletedTargetAnimationsDescription(self->_completedTargetAnimations);
    double v16 = a2;
    completedTargetAnimations = char v17 = completedTargetAnimations;
    *(_DWORD *)buf = 134219010;
    int v66 = self;
    __int16 v67 = 2114;
    double v68 = v13;
    __int16 v69 = 2114;
    uint64_t v70 = v14;
    __int16 v71 = 2114;
    v72 = v15;
    __int16 v73 = 2114;
    unint64_t v74 = completedTargetAnimations;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] dependency check: startedSourceAnimations(%{public}@) startedTargetAnimations(%{public}@) completedSourceAnimations(%{public}@) completedTargetAnimations(%{public}@)", buf, 0x34u);

    LOBYTE(completedTargetAnimations) = v17;
    a2 = v16;

    BOOL v11 = (completedSourceAnimations & 0xF) == 15;
    double v6 = v52;

    id WeakRetained = v53;
  }
  unint64_t v18 = completedTargetAnimations & 7;

  if (!v8)
  {
    char v33 = startedTargetAnimations;
    if (self->_automaticallyStartTargetAnimations
      && (startedTargetAnimations & 1) != 0
      && (startedTargetAnimations & 2) == 0)
    {
      CGFloat v34 = (void *)*MEMORY[0x1E4F43630];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke;
      v64[3] = &unk_1E6AF4AC0;
      v64[4] = self;
      [v34 _performBlockAfterCATransactionCommits:v64];
    }
    if ((startedSourceAnimations & 4) != 0
      && (completedSourceAnimations & 4) != 0
      && (startedTargetAnimations & 1) != 0)
    {
      id v35 = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        [v35 hideSourceViewForAnimator:self];
        CGFloat v36 = SBLogCommon();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          int v66 = self;
          _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Hiding source view since source clip ended and match move started.", buf, 0xCu);
        }

        char v33 = startedTargetAnimations;
      }
    }
    int v37 = 0;
    if (v55 == 15 && (completedTargetAnimations & 1) == 0)
    {
      if (v33)
      {
        [(SBViewMorphAnimator *)self _continueSourceAnimationsCompletionPendingBlock];
        [(SBViewMorphAnimator *)self _removeMatchMoveAnimation];
        __int16 v41 = (void *)*MEMORY[0x1E4F43630];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_58;
        v63[3] = &unk_1E6AF4AC0;
        v63[4] = self;
        [v41 _performBlockAfterCATransactionCommits:v63];
        double v42 = SBLogCommon();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          int v66 = self;
          _os_log_impl(&dword_1D85BA000, v42, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Removed target match move since all source animations ended and match move was started.", buf, 0xCu);
        }

        int v37 = 0;
      }
      else
      {
        int v37 = 0;
        if (v6 && !self->_sourceAllEnded)
        {
          if (self->_sourceAllAnimationsCompletionBlock)
          {
            double v46 = [MEMORY[0x1E4F28B00] currentHandler];
            [v46 handleFailureInMethod:a2 object:self file:@"SBViewMorphAnimator.m" lineNumber:747 description:@"Morph animator was notified twice about source scale and position animations end."];
          }
          if (self->_direction)
          {
            CGRect v47 = [MEMORY[0x1E4F28B00] currentHandler];
            [v47 handleFailureInMethod:a2 object:self file:@"SBViewMorphAnimator.m" lineNumber:748 description:@"This path shouldn't be taken for reverse direction."];
          }
          double v38 = SBLogCommon();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            int v66 = self;
            _os_log_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Waiting for target match move animation to start before calling source scale and position ended continuation block.", buf, 0xCu);
          }

          [(SBViewMorphAnimator *)self setSourceAllAnimationsCompletionBlock:v6];
          int v37 = 1;
        }
      }
      self->_sourceAllEnded = v11;
    }
    BOOL v31 = v37 != 0;
    if (v18 != 7) {
      goto LABEL_58;
    }
    __int16 v39 = (void *)*MEMORY[0x1E4F43630];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_65;
    v61[3] = &unk_1E6AF5D38;
    v61[4] = self;
    BOOL v62 = v11;
    double v40 = v61;
    goto LABEL_57;
  }
  char v19 = startedTargetAnimations;
  if ((startedTargetAnimations & 3) == 1)
  {
    int v20 = (void *)*MEMORY[0x1E4F43630];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_2;
    v60[3] = &unk_1E6AF4AC0;
    v60[4] = self;
    [v20 _performBlockAfterCATransactionCommits:v60];
  }
  if (v55 == 15)
  {
    if (self->_sourceBlackCurtainView)
    {
      double v21 = [WeakRetained superview];
      id v22 = [(SBViewMorphAnimatorContentBlackCurtainView *)self->_sourceBlackCurtainView superview];
      [(SBViewMorphAnimatorContentBlackCurtainView *)self->_sourceBlackCurtainView frame];
      objc_msgSend(v22, "convertRect:toView:", v21);
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;

      char v19 = startedTargetAnimations;
      [v21 insertSubview:self->_sourceBlackCurtainView belowSubview:WeakRetained];
      -[SBViewMorphAnimatorContentBlackCurtainView setFrame:](self->_sourceBlackCurtainView, "setFrame:", v24, v26, v28, v30);
    }
    if ((completedTargetAnimations & 1) == 0)
    {
      if (v19)
      {
        if ((completedTargetAnimations & 4) != 0)
        {
          [(SBViewMorphAnimator *)self _continueSourceAnimationsCompletionPendingBlock];
          BOOL v31 = 0;
        }
        else
        {
          BOOL v31 = 0;
          if (v6 && !self->_sourceAllEnded)
          {
            if (self->_sourceAllAnimationsCompletionBlock)
            {
              CGFloat v50 = [MEMORY[0x1E4F28B00] currentHandler];
              [v50 handleFailureInMethod:a2 object:self file:@"SBViewMorphAnimator.m" lineNumber:785 description:@"Morph animator was notified twice about source scale and position animations end."];
            }
            if (self->_direction != 1)
            {
              CGFloat v51 = [MEMORY[0x1E4F28B00] currentHandler];
              [v51 handleFailureInMethod:a2 object:self file:@"SBViewMorphAnimator.m" lineNumber:786 description:@"This path shouldn't be taken for forward direction."];
            }
            uint64_t v43 = SBLogCommon();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              int v66 = self;
              _os_log_impl(&dword_1D85BA000, v43, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Waiting for target external placeholder animations to complete before calling source scale and position ended continuation block.", buf, 0xCu);
            }

            [(SBViewMorphAnimator *)self setSourceAllAnimationsCompletionBlock:v6];
            BOOL v31 = 1;
          }
        }
        [(SBViewMorphAnimator *)self _removeMatchMoveAnimation];
        CGPoint v44 = (void *)*MEMORY[0x1E4F43630];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_69;
        v59[3] = &unk_1E6AF4AC0;
        v59[4] = self;
        [v44 _performBlockAfterCATransactionCommits:v59];
        CGPoint v45 = SBLogCommon();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          int v66 = self;
          _os_log_impl(&dword_1D85BA000, v45, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Removed target match move since all source animations ended and match move was started.", buf, 0xCu);
        }
      }
      else
      {
        BOOL v31 = 0;
        if (v6 && !self->_sourceAllEnded)
        {
          if (self->_sourceAllAnimationsCompletionBlock)
          {
            CGRect v48 = [MEMORY[0x1E4F28B00] currentHandler];
            [v48 handleFailureInMethod:a2 object:self file:@"SBViewMorphAnimator.m" lineNumber:800 description:@"Morph animator was notified twice about source scale and position animations end."];
          }
          if (self->_direction != 1)
          {
            double v49 = [MEMORY[0x1E4F28B00] currentHandler];
            [v49 handleFailureInMethod:a2 object:self file:@"SBViewMorphAnimator.m" lineNumber:801 description:@"This path shouldn't be taken for forward direction."];
          }
          uint64_t v32 = SBLogCommon();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            int v66 = self;
            _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Waiting for target match move animation to start before calling source scale and position ended continuation block.", buf, 0xCu);
          }

          [(SBViewMorphAnimator *)self setSourceAllAnimationsCompletionBlock:v6];
          BOOL v31 = 1;
        }
      }
      self->_sourceAllEnded = v11;
      if ((completedTargetAnimations & 4) == 0) {
        goto LABEL_49;
      }
      goto LABEL_48;
    }
  }
  BOOL v31 = 0;
  if ((completedTargetAnimations & 4) != 0) {
LABEL_48:
  }
    [(SBViewMorphAnimator *)self _continueSourceAnimationsCompletionPendingBlock];
LABEL_49:
  if (v18 != 7) {
    goto LABEL_58;
  }
  __int16 v39 = (void *)*MEMORY[0x1E4F43630];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_70;
  v57[3] = &unk_1E6AF5D38;
  v57[4] = self;
  BOOL v58 = v11;
  double v40 = v57;
LABEL_57:
  [v39 _performBlockAfterCATransactionCommits:v40];
LABEL_58:
  if (v6 && !v31) {
    v6[2](v6);
  }

LABEL_62:
}

uint64_t __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Auto starting target unclip since target match move started.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) startTargetAnimations:2];
}

uint64_t __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_58(uint64_t a1)
{
  return [*(id *)(a1 + 32) noteTargetAnimationsDidEnd:1 finished:1 continueBlock:0];
}

uint64_t __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_65(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _removeMatchMoveAnimation];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _noteDidEndAllAnimations];
  }
  return result;
}

uint64_t __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[Morph Animator][%p] Auto starting target unclip since target match move started.", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) startTargetAnimations:2];
}

uint64_t __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_69(uint64_t a1)
{
  return [*(id *)(a1 + 32) noteTargetAnimationsDidEnd:1 finished:1 continueBlock:0];
}

uint64_t __52__SBViewMorphAnimator__checkAnimationsDependencies___block_invoke_70(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _removeMatchMoveAnimation];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _noteDidEndAllAnimations];
  }
  return result;
}

- (void)setSourceAllAnimationsCompletionBlock:(id)a3
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x1D948C7A0]();
  id sourceAllAnimationsCompletionBlock = self->_sourceAllAnimationsCompletionBlock;
  self->_id sourceAllAnimationsCompletionBlock = v5;

  int64_t direction = self->_direction;
  UIAnimationDragCoefficient();
  float v9 = v8;
  if (direction) {
    double v10 = 1.5;
  }
  else {
    double v10 = 0.1;
  }
  objc_initWeak(&location, self);
  BOOL v11 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"sourceAnimationsCompletionTimeout"];
  sourceAnimationsCompletionContinueBlockTimeoutTimer = self->_sourceAnimationsCompletionContinueBlockTimeoutTimer;
  self->_sourceAnimationsCompletionContinueBlockTimeoutTimer = v11;

  id v13 = self->_sourceAnimationsCompletionContinueBlockTimeoutTimer;
  uint64_t v14 = MEMORY[0x1E4F14428];
  id v15 = MEMORY[0x1E4F14428];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__SBViewMorphAnimator_setSourceAllAnimationsCompletionBlock___block_invoke;
  v16[3] = &unk_1E6AF5838;
  objc_copyWeak(&v17, &location);
  [(BSAbsoluteMachTimer *)v13 scheduleWithFireInterval:v14 leewayInterval:v16 queue:v10 * v9 handler:0.0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __61__SBViewMorphAnimator_setSourceAllAnimationsCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[24] invalidate];
    id v2 = v3[24];
    v3[24] = 0;

    [v3 _handleHandoffTimeout];
    id WeakRetained = v3;
  }
}

- (void)_continueSourceAnimationsCompletionPendingBlock
{
  sourceAnimationsCompletionContinueBlockTimeoutTimer = self->_sourceAnimationsCompletionContinueBlockTimeoutTimer;
  if (sourceAnimationsCompletionContinueBlockTimeoutTimer)
  {
    [(BSAbsoluteMachTimer *)sourceAnimationsCompletionContinueBlockTimeoutTimer invalidate];
    id v4 = self->_sourceAnimationsCompletionContinueBlockTimeoutTimer;
    self->_sourceAnimationsCompletionContinueBlockTimeoutTimer = 0;
  }
  id sourceAllAnimationsCompletionBlock = (void (**)(id, SEL))self->_sourceAllAnimationsCompletionBlock;
  if (sourceAllAnimationsCompletionBlock)
  {
    sourceAllAnimationsCompletionBlock[2](sourceAllAnimationsCompletionBlock, a2);
    id v6 = self->_sourceAllAnimationsCompletionBlock;
    self->_id sourceAllAnimationsCompletionBlock = 0;
  }
}

- (void)_handleHandoffTimeout
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  return (UIView *)WeakRetained;
}

- (UIView)targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  return (UIView *)WeakRetained;
}

- (UIView)targetContentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetContentView);
  return (UIView *)WeakRetained;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (int64_t)fromOrientation
{
  return self->_fromOrientation;
}

- (void)setFromOrientation:(int64_t)a3
{
  self->_fromOrientation = a3;
}

- (int64_t)toOrientation
{
  return self->_toOrientation;
}

- (void)setToOrientation:(int64_t)a3
{
  self->_toOrientation = a3;
}

- (SBFFluidBehaviorSettings)sourceClipAnimationSettings
{
  return self->_sourceClipAnimationSettings;
}

- (void)setSourceClipAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)targetClipAnimationSettings
{
  return self->_targetClipAnimationSettings;
}

- (void)setTargetClipAnimationSettings:(id)a3
{
}

- (SBViewMorphAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBViewMorphAnimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBViewMorphAnimatorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBViewMorphAnimatorDataSource *)WeakRetained;
}

- (BOOL)automaticallyStartSourceAnimations
{
  return self->_automaticallyStartSourceAnimations;
}

- (void)setAutomaticallyStartSourceAnimations:(BOOL)a3
{
  self->_automaticallyStartSourceAnimations = a3;
}

- (BOOL)automaticallyStartTargetAnimations
{
  return self->_automaticallyStartTargetAnimations;
}

- (void)setAutomaticallyStartTargetAnimations:(BOOL)a3
{
  self->_automaticallyStartTargetAnimations = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_int64_t direction = a3;
}

- (unint64_t)startedSourceAnimations
{
  return self->_startedSourceAnimations;
}

- (void)setStartedSourceAnimations:(unint64_t)a3
{
  self->_unint64_t startedSourceAnimations = a3;
}

- (unint64_t)startedTargetAnimations
{
  return self->_startedTargetAnimations;
}

- (void)setStartedTargetAnimations:(unint64_t)a3
{
  self->_unint64_t startedTargetAnimations = a3;
}

- (unint64_t)completedSourceAnimations
{
  return self->_completedSourceAnimations;
}

- (void)setCompletedSourceAnimations:(unint64_t)a3
{
  self->_unint64_t completedSourceAnimations = a3;
}

- (unint64_t)completedTargetAnimations
{
  return self->_completedTargetAnimations;
}

- (void)setCompletedTargetAnimations:(unint64_t)a3
{
  self->_unint64_t completedTargetAnimations = a3;
}

- (CGPoint)sourceFinalCenter
{
  double x = self->_sourceFinalCenter.x;
  double y = self->_sourceFinalCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)sourceFinalScale
{
  return self->_sourceFinalScale;
}

- (CGRect)targetSourcePinningFrame
{
  double x = self->_targetSourcePinningFrame.origin.x;
  double y = self->_targetSourcePinningFrame.origin.y;
  double width = self->_targetSourcePinningFrame.size.width;
  double height = self->_targetSourcePinningFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)targetFinalFrame
{
  double x = self->_targetFinalFrame.origin.x;
  double y = self->_targetFinalFrame.origin.y;
  double width = self->_targetFinalFrame.size.width;
  double height = self->_targetFinalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)targetCornerRadius
{
  return self->_targetCornerRadius;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_BOOL invalidated = a3;
}

- (BOOL)sourceAllEnded
{
  return self->_sourceAllEnded;
}

- (void)setSourceAllEnded:(BOOL)a3
{
  self->_sourceAllEnded = a3;
}

- (BOOL)targetExternalPlaceholderAllEnded
{
  return self->_targetExternalPlaceholderAllEnded;
}

- (void)setTargetExternalPlaceholderAllEnded:(BOOL)a3
{
  self->_targetExternalPlaceholderAllEnded = a3;
}

- (BOOL)sourceContentFrameWasAltered
{
  return self->_sourceContentFrameWasAltered;
}

- (void)setSourceContentFrameWasAltered:(BOOL)a3
{
  self->_sourceContentFrameWasAltered = a3;
}

- (id)sourceAllAnimationsCompletionBlock
{
  return self->_sourceAllAnimationsCompletionBlock;
}

- (BSAbsoluteMachTimer)allAnimationsTimeoutTimer
{
  return self->_allAnimationsTimeoutTimer;
}

- (void)setAllAnimationsTimeoutTimer:(id)a3
{
}

- (BSAbsoluteMachTimer)morphAnimationTimeout
{
  return self->_morphAnimationTimeout;
}

- (void)setMorphAnimationTimeout:(id)a3
{
}

- (BSAbsoluteMachTimer)sourceAnimationsCompletionContinueBlockTimeoutTimer
{
  return self->_sourceAnimationsCompletionContinueBlockTimeoutTimer;
}

- (void)setSourceAnimationsCompletionContinueBlockTimeoutTimer:(id)a3
{
}

- (SBViewMorphAnimatorContentBlackCurtainView)sourceBlackCurtainView
{
  return self->_sourceBlackCurtainView;
}

- (void)setSourceBlackCurtainView:(id)a3
{
}

- (SBViewMorphAnimatorContentClippingView)targetContentClippingView
{
  return self->_targetContentClippingView;
}

- (void)setTargetContentClippingView:(id)a3
{
}

- (CGRect)targetContentClippingViewInitialFrame
{
  double x = self->_targetContentClippingViewInitialFrame.origin.x;
  double y = self->_targetContentClippingViewInitialFrame.origin.y;
  double width = self->_targetContentClippingViewInitialFrame.size.width;
  double height = self->_targetContentClippingViewInitialFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetContentClippingViewInitialFrame:(CGRect)a3
{
  self->_targetContentClippingViewInitialFrame = a3;
}

- (CGRect)sourceContentContainerFrame
{
  double x = self->_sourceContentContainerFrame.origin.x;
  double y = self->_sourceContentContainerFrame.origin.y;
  double width = self->_sourceContentContainerFrame.size.width;
  double height = self->_sourceContentContainerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceContentContainerFrame:(CGRect)a3
{
  self->_sourceContentContainerFrame = a3;
}

- (CGRect)sourceContentFrame
{
  double x = self->_sourceContentFrame.origin.x;
  double y = self->_sourceContentFrame.origin.y;
  double width = self->_sourceContentFrame.size.width;
  double height = self->_sourceContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceContentFrame:(CGRect)a3
{
  self->_sourceContentFrame = a3;
}

- (double)sourceCornerRadius
{
  return self->_sourceCornerRadius;
}

- (void)setSourceCornerRadius:(double)a3
{
  self->_sourceCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentClippingView, 0);
  objc_storeStrong((id *)&self->_sourceBlackCurtainView, 0);
  objc_storeStrong((id *)&self->_sourceAnimationsCompletionContinueBlockTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_morphAnimationTimeout, 0);
  objc_storeStrong((id *)&self->_allAnimationsTimeoutTimer, 0);
  objc_storeStrong(&self->_sourceAllAnimationsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_targetClipAnimationSettings, 0);
  objc_storeStrong((id *)&self->_sourceClipAnimationSettings, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_targetContentView);
  objc_destroyWeak((id *)&self->_targetView);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end