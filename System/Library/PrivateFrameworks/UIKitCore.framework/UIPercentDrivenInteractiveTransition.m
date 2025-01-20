@interface UIPercentDrivenInteractiveTransition
- (BOOL)_clampsPercentComplete;
- (BOOL)_isTransitionInterrupted;
- (BOOL)_startInterruptibleTransition:(id)a3;
- (BOOL)_useAnimatorTrackingToDriveTransition;
- (BOOL)_usesPacedFractionComplete;
- (BOOL)wantsInteractiveStart;
- (CGFloat)completionSpeed;
- (CGFloat)duration;
- (CGFloat)percentComplete;
- (NSString)_originalFillMode;
- (NSUUID)_uuid;
- (UIPercentDrivenInteractiveTransition)init;
- (UIViewAnimationCurve)completionCurve;
- (double)_durationFactorForPercentComplete:(double)a3 reversed:(BOOL)a4;
- (id)timingCurve;
- (void)_continueInterruptibleTransitionFromPercentComplete:(double)a3 reversed:(BOOL)a4;
- (void)_setClampsPercentComplete:(BOOL)a3;
- (void)_setDuration:(double)a3;
- (void)_setOriginalFillMode:(id)a3;
- (void)_setTransitionInterrupted:(BOOL)a3;
- (void)_setUsesPacedFractionComplete:(BOOL)a3;
- (void)_setUuid:(id)a3;
- (void)_stopInteractiveTransition;
- (void)_stopInteractiveTransition:(id)a3;
- (void)_updateInteractiveTransition:(id)a3 percent:(double)a4 isFinished:(BOOL)a5 didComplete:(BOOL)a6;
- (void)cancelInteractiveTransition;
- (void)finishInteractiveTransition;
- (void)pauseInteractiveTransition;
- (void)setCompletionCurve:(UIViewAnimationCurve)completionCurve;
- (void)setCompletionSpeed:(CGFloat)completionSpeed;
- (void)setTimingCurve:(id)timingCurve;
- (void)setWantsInteractiveStart:(BOOL)wantsInteractiveStart;
- (void)startInteractiveTransition:(id)a3;
- (void)startInteractiveTransition:(id)a3 containerViews:(id)a4 animation:(id)a5;
- (void)updateInteractiveTransition:(CGFloat)percentComplete;
@end

@implementation UIPercentDrivenInteractiveTransition

- (UIPercentDrivenInteractiveTransition)init
{
  self->_duration = 0.0;
  self->_completionSpeed = 1.0;
  self->_completionCurve = 7;
  self->_wantsInteractiveStart = 1;
  self->__clampsPercentComplete = 1;
  v3.receiver = self;
  v3.super_class = (Class)UIPercentDrivenInteractiveTransition;
  return [(UIPercentDrivenInteractiveTransition *)&v3 init];
}

- (void)_setUsesPacedFractionComplete:(BOOL)a3
{
  self->__usesPacedFractionComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__uuid, 0);
  objc_storeStrong((id *)&self->__originalFillMode, 0);
  objc_storeStrong((id *)&self->_timingCurve, 0);
  objc_storeStrong((id *)&self->_animationTrackingAnimatorUUID, 0);
  objc_storeStrong((id *)&self->_interruptibleAnimator, 0);
}

- (CGFloat)percentComplete
{
  v2 = +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:self];
  objc_super v3 = [v2 firstObject];

  [v3 _previousPercentComplete];
  double v5 = v4;

  return v5;
}

- (CGFloat)duration
{
  return self->_duration;
}

- (void)_setDuration:(double)a3
{
  self->_duration = a3;
}

- (CGFloat)completionSpeed
{
  CGFloat result = self->_completionSpeed;
  if (result <= 0.0) {
    return 1.0;
  }
  return result;
}

- (double)_durationFactorForPercentComplete:(double)a3 reversed:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIPercentDrivenInteractiveTransition *)self completionSpeed];
  if (v6 == 0.0) {
    return 0.0;
  }
  double v7 = 1.0 - a3;
  if (v4) {
    double v7 = a3;
  }
  return v7 / v6;
}

- (void)_continueInterruptibleTransitionFromPercentComplete:(double)a3 reversed:(BOOL)a4
{
  BOOL v4 = a4;
  interruptibleAnimator = self->_interruptibleAnimator;
  if (!interruptibleAnimator)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UIViewControllerTransitioning.m", 684, @"Expected an interruptible animator for %@", self object file lineNumber description];

    interruptibleAnimator = self->_interruptibleAnimator;
  }
  [(UIViewImplicitlyAnimating *)interruptibleAnimator setReversed:v4];
  v8 = [(UIPercentDrivenInteractiveTransition *)self timingCurve];
  if (v8)
  {

LABEL_6:
    uint64_t v10 = dyld_program_sdk_at_least() & v4;
    v11 = self->_interruptibleAnimator;
    id v15 = [(UIPercentDrivenInteractiveTransition *)self timingCurve];
    [(UIPercentDrivenInteractiveTransition *)self _durationFactorForPercentComplete:v10 reversed:a3];
    -[UIViewImplicitlyAnimating continueAnimationWithTimingParameters:durationFactor:](v11, "continueAnimationWithTimingParameters:durationFactor:", v15);

    return;
  }
  [(UIPercentDrivenInteractiveTransition *)self completionSpeed];
  if (v9 != 1.0) {
    goto LABEL_6;
  }
  v12 = self->_interruptibleAnimator;
  [(UIViewImplicitlyAnimating *)v12 startAnimation];
}

- (BOOL)_useAnimatorTrackingToDriveTransition
{
  if (self->_animationTrackingAnimatorUUID) {
    return 1;
  }
  if (self->_interruptibleAnimator) {
    return 0;
  }
  return +[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators];
}

- (void)_updateInteractiveTransition:(id)a3 percent:(double)a4 isFinished:(BOOL)a5 didComplete:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  interruptibleAnimator = self->_interruptibleAnimator;
  if (!interruptibleAnimator)
  {
    SEL v83 = a2;
    v13 = [v11 firstObject];
    v14 = [v13 containerView];
    uint64_t v15 = [v14 layer];

    v16 = [v11 firstObject];
    v17 = [v16 containerView];

    v18 = [v11 firstObject];
    v85 = [v18 _containerViews];

    v19 = [v11 firstObject];
    v20 = [v19 _auxContext];
    if (v20)
    {
      v21 = [v11 firstObject];
      v22 = [v21 _auxContext];
      v84 = [v22 _alongsideAnimationViews];
    }
    else
    {
      v84 = 0;
    }

    if (!v7)
    {
      v30 = (void *)v15;
      if ([(UIPercentDrivenInteractiveTransition *)self _useAnimatorTrackingToDriveTransition])
      {
        v31 = +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:self->_animationTrackingAnimatorUUID];
        [v31 pauseAnimation];
        v32 = v17;
        v33 = v85;
        if (self->__usesPacedFractionComplete && (objc_opt_respondsToSelector() & 1) != 0) {
          [v31 setPacedFractionComplete:a4];
        }
        else {
          [v31 setFractionComplete:a4];
        }
        v38 = v84;
      }
      else
      {
        v32 = v17;
        v33 = v85;
        if ([v11 count] != 1)
        {
          v81 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", v83, self, @"UIViewControllerTransitioning.m", 736, @"Unsupported path when one interactor is driving multiple (%lu) transitions.", objc_msgSend(v11, "count"));
        }
        double v39 = self->_duration * a4;
        if (v85)
        {
          long long v113 = 0u;
          long long v114 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          id v40 = v85;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v111 objects:v119 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v112;
            do
            {
              for (uint64_t i = 0; i != v42; ++i)
              {
                if (*(void *)v112 != v43) {
                  objc_enumerationMutation(v40);
                }
                v45 = *(void **)(*((void *)&v111 + 1) + 8 * i);
                v46 = [v45 layer];
                [v46 setTimeOffset:v39];

                [v45 layoutBelowIfNeeded];
              }
              uint64_t v42 = [v40 countByEnumeratingWithState:&v111 objects:v119 count:16];
            }
            while (v42);
          }
        }
        else
        {
          [v30 setTimeOffset:v39];
          [v17 layoutBelowIfNeeded];
        }
        v38 = v84;
        if (v84)
        {
          long long v109 = 0u;
          long long v110 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v61 = v84;
          uint64_t v62 = [v61 countByEnumeratingWithState:&v107 objects:v118 count:16];
          if (v62)
          {
            uint64_t v63 = v62;
            uint64_t v64 = *(void *)v108;
            do
            {
              for (uint64_t j = 0; j != v63; ++j)
              {
                if (*(void *)v108 != v64) {
                  objc_enumerationMutation(v61);
                }
                v66 = *(void **)(*((void *)&v107 + 1) + 8 * j);
                v67 = [v66 layer];
                [v67 setTimeOffset:v39];
                [v66 layoutBelowIfNeeded];
              }
              uint64_t v63 = [v61 countByEnumeratingWithState:&v107 objects:v118 count:16];
            }
            while (v63);
          }

          v38 = v84;
        }
      }
      goto LABEL_80;
    }
    if ([(UIPercentDrivenInteractiveTransition *)self _isTransitionInterrupted])
    {
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v24 = v11;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v103 objects:v117 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v104;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v104 != v27) {
              objc_enumerationMutation(v24);
            }
            [*(id *)(*((void *)&v103 + 1) + 8 * k) setTransitionWasCancelled:!v6];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v103 objects:v117 count:16];
        }
        while (v26);
      }

      if ([(UIPercentDrivenInteractiveTransition *)self _useAnimatorTrackingToDriveTransition])
      {
        v29 = +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:self->_animationTrackingAnimatorUUID];
        [v29 stopAnimation:0];
        [v29 finishAnimationAtPosition:!v6];
      }
      else
      {
        v29 = [(UIPercentDrivenInteractiveTransition *)self _uuid];
        +[UIView _finalizeStoppedAnimationWithUUID:v29 reverseAnimation:!v6];
      }
      v30 = (void *)v15;
      v33 = v85;

      [(UIPercentDrivenInteractiveTransition *)self _setTransitionInterrupted:0];
      v32 = v17;
      v38 = v84;
      goto LABEL_79;
    }
    [(UIPercentDrivenInteractiveTransition *)self completionSpeed];
    double v35 = v34;
    v30 = (void *)v15;
    if ([(UIPercentDrivenInteractiveTransition *)self _useAnimatorTrackingToDriveTransition])
    {
      v36 = +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:self->_animationTrackingAnimatorUUID];
      v37 = [[UICubicTimingParameters alloc] initWithAnimationCurve:[(UIPercentDrivenInteractiveTransition *)self completionCurve]];
      [v36 setReversed:!v6];
      [(UIPercentDrivenInteractiveTransition *)self _durationFactorForPercentComplete:!v6 reversed:a4];
      objc_msgSend(v36, "continueAnimationWithTimingParameters:durationFactor:", v37);

      v32 = v17;
      v38 = v84;
      v33 = v85;
LABEL_79:
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __100__UIPercentDrivenInteractiveTransition__updateInteractiveTransition_percent_isFinished_didComplete___block_invoke;
      aBlock[3] = &unk_1E52D9F70;
      id v77 = v11;
      id v94 = v77;
      v78 = _Block_copy(aBlock);
      v79 = [v77 firstObject];
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __100__UIPercentDrivenInteractiveTransition__updateInteractiveTransition_percent_isFinished_didComplete___block_invoke_2;
      v86[3] = &unk_1E52EA538;
      v86[4] = self;
      id v87 = v77;
      SEL v92 = v83;
      id v88 = v33;
      id v89 = v32;
      id v90 = v38;
      id v91 = v78;
      id v80 = v78;
      [v79 _setPostInteractiveCompletionHandler:v86];

LABEL_80:
      goto LABEL_81;
    }
    v32 = v17;
    v33 = v85;
    if ([v11 count] != 1)
    {
      v82 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v82, "handleFailureInMethod:object:file:lineNumber:description:", v83, self, @"UIViewControllerTransitioning.m", 783, @"Unsupported path when one interactor is driving multiple (%lu) transitions.", objc_msgSend(v11, "count"));
    }
    v38 = v84;
    if (v85)
    {
      v47 = [v85 objectAtIndex:0];
      v48 = [v47 layer];
      [v48 timeOffset];
      double v50 = v49;

      if (!v6)
      {
LABEL_48:
        v51 = [(UIPercentDrivenInteractiveTransition *)self _uuid];
        +[UIView _completeAnimationWithUUID:v51 duration:[(UIPercentDrivenInteractiveTransition *)self completionCurve] curve:!v6 reverse:v50];

        if (v85)
        {
          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          id v53 = v85;
          uint64_t v54 = [v53 countByEnumeratingWithState:&v99 objects:v116 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = *(void *)v100;
            do
            {
              for (uint64_t m = 0; m != v55; ++m)
              {
                if (*(void *)v100 != v56) {
                  objc_enumerationMutation(v53);
                }
                v59 = [*(id *)(*((void *)&v99 + 1) + 8 * m) layer];
                float v57 = v35;
                *(float *)&double v60 = v57;
                [v59 setSpeed:v60];
              }
              uint64_t v55 = [v53 countByEnumeratingWithState:&v99 objects:v116 count:16];
            }
            while (v55);
          }

          v33 = v85;
        }
        else
        {
          *(float *)&double v52 = v35;
          [v30 setSpeed:v52];
        }
        if (v84)
        {
          long long v97 = 0u;
          long long v98 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          id v69 = v84;
          uint64_t v70 = [v69 countByEnumeratingWithState:&v95 objects:v115 count:16];
          if (v70)
          {
            uint64_t v71 = v70;
            uint64_t v72 = *(void *)v96;
            do
            {
              for (uint64_t n = 0; n != v71; ++n)
              {
                if (*(void *)v96 != v72) {
                  objc_enumerationMutation(v69);
                }
                v75 = [*(id *)(*((void *)&v95 + 1) + 8 * n) layer];
                float v73 = v35;
                *(float *)&double v76 = v73;
                [v75 setSpeed:v76];
              }
              uint64_t v71 = [v69 countByEnumeratingWithState:&v95 objects:v115 count:16];
            }
            while (v71);
          }

          v33 = v85;
        }
        goto LABEL_79;
      }
    }
    else
    {
      [v30 timeOffset];
      double v50 = v68;
      if (!v6) {
        goto LABEL_48;
      }
    }
    double v50 = self->_duration - v50;
    goto LABEL_48;
  }
  if (v7)
  {
    [(UIPercentDrivenInteractiveTransition *)self _continueInterruptibleTransitionFromPercentComplete:!v6 reversed:a4];
  }
  else if (self->__usesPacedFractionComplete {
         && (char v23 = objc_opt_respondsToSelector(), interruptibleAnimator = self->_interruptibleAnimator, (v23 & 1) != 0))
  }
  {
    [(UIViewImplicitlyAnimating *)interruptibleAnimator setPacedFractionComplete:a4];
  }
  else
  {
    [(UIViewImplicitlyAnimating *)interruptibleAnimator setFractionComplete:a4];
  }
LABEL_81:
}

void __100__UIPercentDrivenInteractiveTransition__updateInteractiveTransition_percent_isFinished_didComplete___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        BOOL v6 = objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "_auxContext", (void)v7);
        [v6 _setAlongsideAnimations:0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __100__UIPercentDrivenInteractiveTransition__updateInteractiveTransition_percent_isFinished_didComplete___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) _useAnimatorTrackingToDriveTransition] & 1) == 0)
  {
    if ([*(id *)(a1 + 40) count] != 1)
    {
      char v23 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 80), *(void *)(a1 + 32), @"UIViewControllerTransitioning.m", 819, @"Unsupported path when one interactor is driving multiple (%lu) transitions.", objc_msgSend(*(id *)(a1 + 40), "count"));
    }
    uint64_t v2 = *(void **)(a1 + 48);
    if (v2)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v3 = v2;
      uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v29;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v29 != v6) {
              objc_enumerationMutation(v3);
            }
            long long v8 = [*(id *)(*((void *)&v28 + 1) + 8 * v7) layer];
            [v8 setTimeOffset:0.0];
            LODWORD(v9) = 1.0;
            [v8 setSpeed:v9];

            ++v7;
          }
          while (v5 != v7);
          uint64_t v5 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v5);
      }
    }
    long long v10 = [*(id *)(a1 + 56) layer];
    [v10 setTimeOffset:0.0];

    id v11 = [*(id *)(a1 + 56) layer];
    LODWORD(v12) = 1.0;
    [v11 setSpeed:v12];

    v13 = *(void **)(a1 + 64);
    if (v13)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = [*(id *)(*((void *)&v24 + 1) + 8 * v18) layer];
            [v19 setTimeOffset:0.0];
            LODWORD(v20) = 1.0;
            [v19 setSpeed:v20];

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v16);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  uint64_t v21 = *(void *)(a1 + 32);
  v22 = *(void **)(v21 + 32);
  *(void *)(v21 + 32) = 0;
}

- (void)_stopInteractiveTransition:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(UIPercentDrivenInteractiveTransition *)self _setTransitionInterrupted:1];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v54 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v53 + 1) + 8 * i) _setState:4];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v8);
  }

  if ([(UIPercentDrivenInteractiveTransition *)self _useAnimatorTrackingToDriveTransition])
  {
    id v11 = +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:self->_animationTrackingAnimatorUUID];
    [v11 stopAnimation:1];
  }
  else
  {
    if ([v6 count] != 1)
    {
      id v40 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIViewControllerTransitioning.m", 860, @"Unsupported path when one interactor is driving multiple (%lu) transitions.", objc_msgSend(v6, "count"));
    }
    id v11 = [v6 firstObject];
    double v12 = [(UIPercentDrivenInteractiveTransition *)self _uuid];
    +[UIView _stopAnimationWithUUID:v12];
    v13 = [v11 _containerViews];

    if (v13)
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v14 = [v11 _containerViews];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v50 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = [*(id *)(*((void *)&v49 + 1) + 8 * j) layer];
            LODWORD(v20) = 1.0;
            [v19 setSpeed:v20];
            [v19 setTimeOffset:0.0];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v59 count:16];
        }
        while (v16);
      }
    }
    else
    {
      uint64_t v21 = [v11 containerView];
      id v14 = [v21 layer];

      LODWORD(v22) = 1.0;
      [v14 setSpeed:v22];
      [v14 setTimeOffset:0.0];
    }

    uint64_t v23 = [v11 _auxContext];
    if (v23)
    {
      long long v24 = (void *)v23;
      long long v25 = [v11 _auxContext];
      long long v26 = [v25 _alongsideAnimationViews];

      if (v26)
      {
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v58 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v46;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v46 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = [*(id *)(*((void *)&v45 + 1) + 8 * k) layer];
              LODWORD(v33) = 1.0;
              [v32 setSpeed:v33];
              [v32 setTimeOffset:0.0];
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v45 objects:v58 count:16];
          }
          while (v29);
        }

        uint64_t v34 = [v11 _auxContext];
        [v34 _setAlongsideAnimations:0];
      }
    }
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v35 = v6;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v41 objects:v57 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v42;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v42 != v38) {
          objc_enumerationMutation(v35);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * m) _stopInteractiveTransition];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v41 objects:v57 count:16];
    }
    while (v37);
  }
}

- (void)_stopInteractiveTransition
{
  id v3 = +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:self];
  [(UIPercentDrivenInteractiveTransition *)self _stopInteractiveTransition:v3];
}

- (BOOL)_startInterruptibleTransition:(id)a3
{
  id v5 = a3;
  id v6 = [v5 _animator];
  if (!v6 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = NSStringFromSelector(a2);
    [v15 handleFailureInMethod:a2, self, @"UIViewControllerTransitioning.m", 904, @"%@ requires an animator that implements interruptibleAnimatorForTransition:", v16 object file lineNumber description];
  }
  uint64_t v7 = [v6 interruptibleAnimatorForTransition:v5];
  interruptibleAnimator = self->_interruptibleAnimator;
  self->_interruptibleAnimator = v7;

  uint64_t v9 = self->_interruptibleAnimator;
  if (v9)
  {
    int v10 = [v5 _initiallyInteractive];
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__UIPercentDrivenInteractiveTransition__startInterruptibleTransition___block_invoke;
    v17[3] = &unk_1E52DC308;
    objc_copyWeak(&v18, &location);
    [v5 _setPostInteractiveCompletionHandler:v17];
    id v11 = self->_interruptibleAnimator;
    if (v10) {
      [(UIViewImplicitlyAnimating *)v11 pauseAnimation];
    }
    else {
      [(UIViewImplicitlyAnimating *)v11 startAnimation];
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    double v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    NSLog(&cfstr_Interruptiblea.isa, v13);
  }
  return v9 != 0;
}

void __70__UIPercentDrivenInteractiveTransition__startInterruptibleTransition___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (void)startInteractiveTransition:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 _animator];
  uint64_t v7 = +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:self];
  if ((unint64_t)[v7 count] < 2)
  {
    [v6 transitionDuration:v5];
    self->_duratiouint64_t n = v8;
    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ![(UIPercentDrivenInteractiveTransition *)self _startInterruptibleTransition:v5])
      {
        if ([(UIPercentDrivenInteractiveTransition *)self _useAnimatorTrackingToDriveTransition])
        {
          if (+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled])
          {
            uint64_t v9 = +[UIViewPropertyAnimator _currentTrackedAnimationsUUID];
            animationTrackingAnimatorUUID = self->_animationTrackingAnimatorUUID;
            self->_animationTrackingAnimatorUUID = v9;

            if (self->_wantsInteractiveStart
              && !+[UIViewPropertyAnimator _trackedAnimationsStartPaused]&& dyld_program_sdk_at_least())
            {
              +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:1];
              [v6 animateTransition:v5];
              +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:0];
            }
            else
            {
              [v6 animateTransition:v5];
            }
          }
          else
          {
            uint64_t v15 = +[UIView _currentViewAnimationState];

            if (v15)
            {
              uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
              [v28 handleFailureInMethod:a2 object:self file:@"UIViewControllerTransitioning.m" lineNumber:955 description:@"Detected animation state before starting interactive transition. This means we MAY need to support implicit start/finish animator tracking."];
            }
            id v16 = +[UIViewPropertyAnimator _startTrackingAnimations];
            +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:self->_wantsInteractiveStart];
            uint64_t v17 = +[UIViewPropertyAnimator _currentTrackedAnimationsUUID];
            id v18 = self->_animationTrackingAnimatorUUID;
            self->_animationTrackingAnimatorUUID = v17;

            [v6 animateTransition:v5];
            +[UIViewPropertyAnimator _finishTrackingAnimations];
          }
          if (+[UIViewPropertyAnimator _containsAnimatorForTrackedAnimationsUUID:self->_animationTrackingAnimatorUUID])
          {
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __67__UIPercentDrivenInteractiveTransition_startInteractiveTransition___block_invoke;
            v34[3] = &unk_1E52D9F70;
            v34[4] = self;
            [(id)UIApp _performBlockAfterCATransactionCommits:v34];
          }
          else
          {
            self->_didCommitAnimations = 1;
          }
        }
        else
        {
          double v12 = [v5 _auxContext];
          if (v12)
          {
            v13 = [v5 _auxContext];
            id v14 = [v13 _alongsideAnimationViews];
          }
          else
          {
            id v14 = 0;
          }

          v19 = [v5 containerView];
          double v20 = [v19 layer];

          uint64_t v21 = +[UIView _enableAnimationTracking];
          [(UIPercentDrivenInteractiveTransition *)self _setUuid:v21];
          [v6 animateTransition:v5];
          self->_didCommitAnimations = 0;
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __67__UIPercentDrivenInteractiveTransition_startInteractiveTransition___block_invoke_2;
          v33[3] = &unk_1E52D9F70;
          v33[4] = self;
          [(id)UIApp _performBlockAfterCATransactionCommits:v33];
          [v20 setSpeed:0.0];
          [v20 setTimeOffset:0.0];
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v22 = v14;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v35 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v30;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v30 != v25) {
                  objc_enumerationMutation(v22);
                }
                id v27 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "layer", (void)v29);
                [v27 setSpeed:0.0];
                [v27 setTimeOffset:0.0];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v35 count:16];
            }
            while (v24);
          }
        }
      }
    }
    else
    {
      id v11 = (id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Attempt to start a percent driven interactive transition but there is no animator!" userInfo:0];
    }
  }
  else
  {
    [v6 animateTransition:v5];
  }
}

uint64_t __67__UIPercentDrivenInteractiveTransition_startInteractiveTransition___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = 1;
  return result;
}

uint64_t __67__UIPercentDrivenInteractiveTransition_startInteractiveTransition___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = 1;
  return result;
}

- (void)startInteractiveTransition:(id)a3 containerViews:(id)a4 animation:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, id))a5;
  if ([(UIPercentDrivenInteractiveTransition *)self _useAnimatorTrackingToDriveTransition])
  {
    [(UIPercentDrivenInteractiveTransition *)self startInteractiveTransition:v8];
  }
  else
  {
    id v11 = v8;
    double v12 = [v11 _animator];
    [v12 transitionDuration:v11];
    self->_duratiouint64_t n = v13;
    if (v12)
    {
      id v14 = [v11 _auxContext];
      if (v14)
      {
        uint64_t v15 = [v11 _auxContext];
        long long v29 = [v15 _alongsideAnimationViews];
      }
      else
      {
        long long v29 = 0;
      }

      [v11 _setContainerViews:v9];
      long long v30 = +[UIView _enableAnimationTracking];
      -[UIPercentDrivenInteractiveTransition _setUuid:](self, "_setUuid:");
      v10[2](v10, v11);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v17 = v9;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v36 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "layer", v29);
            [v22 setSpeed:0.0];
            [v22 setTimeOffset:0.0];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v19);
      }

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v23 = v29;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v32 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * j), "layer", v29);
            [v28 setSpeed:0.0];
            [v28 setTimeOffset:0.0];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v25);
      }
    }
    else
    {
      id v16 = (id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Attempt to start a percent driven interactive transition but there is no animator!" userInfo:0];
    }
  }
}

- (void)pauseInteractiveTransition
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_interruptibleAnimator)
  {
    id v3 = +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:self];
    uint64_t v4 = [v3 firstObject];
    uint64_t v5 = [v4 _state];

    if (v5 == 1)
    {
      [(UIViewImplicitlyAnimating *)self->_interruptibleAnimator pauseAnimation];
      if (dyld_program_sdk_at_least()) {
        [(UIViewImplicitlyAnimating *)self->_interruptibleAnimator setReversed:0];
      }
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = v3;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if (self->__usesPacedFractionComplete && (objc_opt_respondsToSelector() & 1) != 0) {
              [(UIViewImplicitlyAnimating *)self->_interruptibleAnimator pacedFractionComplete];
            }
            else {
              [(UIViewImplicitlyAnimating *)self->_interruptibleAnimator fractionComplete];
            }
            [v11 _setPreviousPercentComplete:(void)v12];
            [v11 pauseInteractiveTransition];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)updateInteractiveTransition:(CGFloat)percentComplete
{
  uint64_t v5 = +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:self];
  id v6 = [v5 firstObject];
  uint64_t v7 = [v6 _state];

  if (v7 == 1)
  {
    if ([(UIPercentDrivenInteractiveTransition *)self _clampsPercentComplete])
    {
      if (percentComplete < 0.0) {
        percentComplete = 0.0;
      }
      if (percentComplete > 1.0) {
        percentComplete = 1.0;
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__UIPercentDrivenInteractiveTransition_updateInteractiveTransition___block_invoke;
    aBlock[3] = &unk_1E52DA070;
    void aBlock[4] = self;
    id v8 = v5;
    id v16 = v8;
    CGFloat v17 = percentComplete;
    uint64_t v9 = _Block_copy(aBlock);
    int v10 = v9;
    if (self->_didCommitAnimations)
    {
      (*((void (**)(void *))v9 + 2))(v9);
    }
    else
    {
      id v11 = (void *)UIApp;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __68__UIPercentDrivenInteractiveTransition_updateInteractiveTransition___block_invoke_2;
      v12[3] = &unk_1E52DA160;
      id v13 = v8;
      id v14 = v10;
      [v11 _performBlockAfterCATransactionCommits:v12];
    }
  }
}

void __68__UIPercentDrivenInteractiveTransition_updateInteractiveTransition___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _updateInteractiveTransition:*(void *)(a1 + 40) percent:0 isFinished:0 didComplete:*(double *)(a1 + 48)];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "updateInteractiveTransition:", *(double *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __68__UIPercentDrivenInteractiveTransition_updateInteractiveTransition___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) firstObject];
  int v3 = [v2 isCurrentlyInteractive];

  if (v3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

- (void)cancelInteractiveTransition
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v3 = +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:self];
  uint64_t v4 = [v3 firstObject];
  if ([v4 _state] == 1)
  {

    goto LABEL_4;
  }
  uint64_t v5 = [v3 firstObject];
  uint64_t v6 = [v5 _state];

  if (v6 == 4)
  {
LABEL_4:
    long long v7 = [v3 firstObject];
    [v7 _previousPercentComplete];
    -[UIPercentDrivenInteractiveTransition _updateInteractiveTransition:percent:isFinished:didComplete:](self, "_updateInteractiveTransition:percent:isFinished:didComplete:", v3, 1, 0);

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "cancelInteractiveTransition", (void)v18);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v10);
    }
    goto LABEL_19;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v3;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * j) _setState:2];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v15);
  }
LABEL_19:
}

- (void)finishInteractiveTransition
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v3 = +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:self];
  uint64_t v4 = [v3 firstObject];
  if ([v4 _state] == 1)
  {

    goto LABEL_4;
  }
  uint64_t v5 = [v3 firstObject];
  uint64_t v6 = [v5 _state];

  if (v6 == 4)
  {
LABEL_4:
    long long v7 = [v3 firstObject];
    [v7 _previousPercentComplete];
    -[UIPercentDrivenInteractiveTransition _updateInteractiveTransition:percent:isFinished:didComplete:](self, "_updateInteractiveTransition:percent:isFinished:didComplete:", v3, 1, 1);

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "finishInteractiveTransition", (void)v18);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v10);
    }
    goto LABEL_19;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v3;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * j) _setState:3];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v15);
  }
LABEL_19:
}

- (void)setCompletionSpeed:(CGFloat)completionSpeed
{
  self->_completionSpeed = completionSpeed;
}

- (UIViewAnimationCurve)completionCurve
{
  return self->_completionCurve;
}

- (void)setCompletionCurve:(UIViewAnimationCurve)completionCurve
{
  self->_completionCurve = completionCurve;
}

- (id)timingCurve
{
  return self->_timingCurve;
}

- (void)setTimingCurve:(id)timingCurve
{
}

- (BOOL)wantsInteractiveStart
{
  return self->_wantsInteractiveStart;
}

- (void)setWantsInteractiveStart:(BOOL)wantsInteractiveStart
{
  self->_wantsInteractiveStart = wantsInteractiveStart;
}

- (NSString)_originalFillMode
{
  return self->__originalFillMode;
}

- (void)_setOriginalFillMode:(id)a3
{
}

- (NSUUID)_uuid
{
  return self->__uuid;
}

- (void)_setUuid:(id)a3
{
}

- (BOOL)_isTransitionInterrupted
{
  return self->__transitionInterrupted;
}

- (void)_setTransitionInterrupted:(BOOL)a3
{
  self->__transitionInterrupted = a3;
}

- (BOOL)_usesPacedFractionComplete
{
  return self->__usesPacedFractionComplete;
}

- (BOOL)_clampsPercentComplete
{
  return self->__clampsPercentComplete;
}

- (void)_setClampsPercentComplete:(BOOL)a3
{
  self->__clampsPercentComplete = a3;
}

@end