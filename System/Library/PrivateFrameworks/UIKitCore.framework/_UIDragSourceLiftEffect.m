@interface _UIDragSourceLiftEffect
- (BOOL)scrollCancelling;
- (UITimingCurveProvider)liftTimingParameters;
- (_UIDragSourceLiftEffect)init;
- (double)liftAnimationDuration;
- (id)existingOperationForContext:(id)a3;
- (id)reversedTimingParametersForTimingParameters:(id)a3;
- (void)_addworkaroundForPropertyAnimator:(id)a3 inView:(id)a4;
- (void)_installInteractionPlattersForOperation:(id)a3;
- (void)_setInteractionEffectsLifted:(BOOL)a3 withOperation:(id)a4;
- (void)_uninstallInteractionPlattersForOperation:(id)a3;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)setScrollCancelling:(BOOL)a3;
@end

@implementation _UIDragSourceLiftEffect

- (_UIDragSourceLiftEffect)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDragSourceLiftEffect;
  v2 = [(_UIDragSourceLiftEffect *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    liftOperationByContext = v2->_liftOperationByContext;
    v2->_liftOperationByContext = (NSMapTable *)v3;

    v2->_scrollCancelling = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (UITimingCurveProvider)liftTimingParameters
{
  return (UITimingCurveProvider *)+[_UIDragLiftEffectOperation defaultTimingParameters];
}

- (double)liftAnimationDuration
{
  return 0.0;
}

- (id)existingOperationForContext:(id)a3
{
  return [(NSMapTable *)self->_liftOperationByContext objectForKey:a3];
}

- (void)_addworkaroundForPropertyAnimator:(id)a3 inView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", -500.0, -500.0, 0.0, 0.0);
  [(UIView *)v7 setUserInteractionEnabled:0];
  [(UIView *)v7 setAlpha:0.0];
  [v5 addSubview:v7];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68___UIDragSourceLiftEffect__addworkaroundForPropertyAnimator_inView___block_invoke;
  v12[3] = &unk_1E52D9F70;
  v8 = v7;
  v13 = v8;
  [v6 addAnimations:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68___UIDragSourceLiftEffect__addworkaroundForPropertyAnimator_inView___block_invoke_3;
  v10[3] = &unk_1E52DC698;
  v11 = v8;
  v9 = v8;
  [v6 addCompletion:v10];
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 state];
  v9 = [(NSMapTable *)self->_liftOperationByContext objectForKey:v7];
  if (!v9)
  {
    if (!v8)
    {
      v9 = 0;
      goto LABEL_16;
    }
    v10 = [_UIDragLiftEffectOperation alloc];
    [(_UIDragSourceLiftEffect *)self liftAnimationDuration];
    double v12 = v11;
    v13 = [(_UIDragSourceLiftEffect *)self liftTimingParameters];
    v9 = [(_UIDragLiftEffectOperation *)v10 initWithLiftAnimationDuration:v13 liftTimingParameters:v12];

    [(_UIDragLiftEffectOperation *)v9 setContext:v7];
    [(_UIDragLiftEffectOperation *)v9 setInteraction:v6];
    v14 = [(_UIDragLiftEffectOperation *)v9 propertyAnimator];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __60___UIDragSourceLiftEffect_interaction_didChangeWithContext___block_invoke;
    v26[3] = &unk_1E52D9F70;
    id v15 = v7;
    id v27 = v15;
    [v14 addAnimations:v26];

    v16 = [(_UIDragLiftEffectOperation *)v9 propertyAnimator];
    v17 = [v15 completion];
    [v16 addCompletion:v17];

    v18 = [(_UIDragLiftEffectOperation *)v9 propertyAnimator];
    v19 = [v6 view];
    v20 = [v19 _window];
    [(_UIDragSourceLiftEffect *)self _addworkaroundForPropertyAnimator:v18 inView:v20];

    [(NSMapTable *)self->_liftOperationByContext setObject:v9 forKey:v15];
  }
  switch(v8)
  {
    case 2:
      [(_UIDragSourceLiftEffect *)self _uninstallInteractionPlattersForOperation:v9];
      v23 = [(_UIDragLiftEffectOperation *)v9 propertyAnimator];
      if ([v23 state])
      {
        [v23 setPausesOnCompletion:0];
        [v23 stopAnimation:0];
        [v23 finishAnimationAtPosition:0];
      }

      break;
    case 1:
      v24 = [(_UIDragLiftEffectOperation *)v9 context];
      int v25 = [v24 shouldAnimateLift];

      if (v25) {
        [(_UIDragSourceLiftEffect *)self _installInteractionPlattersForOperation:v9];
      }
      v21 = self;
      uint64_t v22 = 1;
      goto LABEL_14;
    case 0:
      v21 = self;
      uint64_t v22 = 0;
LABEL_14:
      [(_UIDragSourceLiftEffect *)v21 _setInteractionEffectsLifted:v22 withOperation:v9];
      break;
  }
LABEL_16:
}

- (void)_installInteractionPlattersForOperation:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 items];

  if (!v5)
  {
    v43 = self;
    v47 = objc_opt_new();
    id v6 = objc_opt_new();
    v44 = v4;
    id v7 = [v4 context];
    uint64_t v8 = [v7 items];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unint64_t v11 = 0;
      uint64_t v12 = *(void *)v57;
      uint64_t v45 = *(void *)v57;
      v46 = v6;
      do
      {
        uint64_t v13 = 0;
        uint64_t v48 = v10;
        do
        {
          if (*(void *)v57 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = [*(id *)(*((void *)&v56 + 1) + 8 * v13) _targetedLiftPreview];
          id v15 = [v14 view];
          if (v15 && ([v6 containsObject:v15] & 1) == 0)
          {
            [v6 addObject:v15];
            v16 = [v15 window];

            if (!v16)
            {
              v17 = [v14 target];
              v18 = [v17 container];
              [v18 addSubview:v15];
            }
            v19 = [v14 _duiPreview];
            v20 = [[_UIPlatterView alloc] initWithDUIPreview:v19 imageComponent:0];
            [(UIView *)v20 setUserInteractionEnabled:0];
            [(_UIPlatterView *)v20 setSourceView:v15];
            v21 = [v14 parameters];
            uint64_t v22 = [v21 _previewMode];

            double v23 = 0.1;
            if (v22 != 1) {
              objc_msgSend(v19, "liftAlpha", 0.1);
            }
            v50 = v19;
            [(UIView *)v20 setAlpha:v23];
            [(_UIPlatterView *)v20 setAppliesOriginalRotation:1];
            v24 = [v14 target];
            int v25 = [v24 container];

            [(_UIPlatterView *)v20 takeCounterTransformsToAddToContainer:v25];
            v26 = [v14 _previewContainer];
            if (v26)
            {
              [(UIView *)v20 bounds];
              objc_msgSend(v26, "setBounds:");
              id v27 = [v14 target];
              [v27 center];
              objc_msgSend(v26, "setCenter:");

              [v25 addSubview:v26];
              v28 = [(_UIPlatterView *)v20 sourceView];
              long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
              v55[0] = *MEMORY[0x1E4F1DAB8];
              v55[1] = v29;
              v55[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
              [v26 _preparePreviewContainerWithPreview:v20 source:v28 initialTransform:v55];

              v30 = [v15 layer];
              [v30 zPosition];
              double v32 = v31 + 1.0 + (double)v11;
              [v26 layer];
              v34 = unint64_t v33 = v11;
              [v34 setZPosition:v32];
            }
            else
            {
              [v15 layer];
              v35 = unint64_t v33 = v11;
              [v35 zPosition];
              double v37 = v36 + 1.0 + (double)v33;
              v38 = [(UIView *)v20 layer];
              [v38 setZPosition:v37];

              v39 = [v14 target];
              [v39 center];
              -[UIView setCenter:](v20, "setCenter:");

              [v25 addSubview:v20];
            }
            [(UIView *)v20 layoutIfNeeded];
            v40 = objc_opt_new();
            [v40 setPreviewContainer:v26];
            [v40 setPlatterView:v20];
            [v40 setTargetedPreview:v14];
            [v40 setSourceViewWasAdded:v16 == 0];
            [v50 liftAlpha];
            objc_msgSend(v40, "setLiftAlpha:");
            [v47 addObject:v40];

            uint64_t v12 = v45;
            id v6 = v46;
            unint64_t v11 = v33 + 1;
            uint64_t v10 = v48;
          }

          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v10);
    }

    id v4 = v44;
    [v44 setItems:v47];
    v41 = [v44 propertyAnimator];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __67___UIDragSourceLiftEffect__installInteractionPlattersForOperation___block_invoke;
    v53[3] = &unk_1E52D9F70;
    id v42 = v44;
    id v54 = v42;
    [v41 addAnimations:v53];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __67___UIDragSourceLiftEffect__installInteractionPlattersForOperation___block_invoke_3;
    v51[3] = &unk_1E52E6608;
    v51[4] = v43;
    id v52 = v42;
    [v41 addCompletion:v51];
  }
}

- (void)_uninstallInteractionPlattersForOperation:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = objc_msgSend(v4, "items", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unint64_t v11 = [v10 previewContainer];

        if (v11) {
          [v10 previewContainer];
        }
        else {
        uint64_t v12 = [v10 platterView];
        }
        [v12 removeFromSuperview];

        uint64_t v13 = [v10 targetedPreview];
        v14 = [v13 view];

        if ([v10 sourceViewWasAdded]) {
          [v14 removeFromSuperview];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  [v4 setItems:0];
  liftOperationByContext = self->_liftOperationByContext;
  v16 = [v4 context];
  [(NSMapTable *)liftOperationByContext removeObjectForKey:v16];
}

- (id)reversedTimingParametersForTimingParameters:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)_setInteractionEffectsLifted:(BOOL)a3 withOperation:(id)a4
{
  BOOL v4 = a3;
  id v15 = a4;
  uint64_t v6 = [v15 context];
  uint64_t v7 = [v15 propertyAnimator];
  int v8 = [v6 shouldAnimateLift];
  if ([v6 state]) {
    char v9 = 1;
  }
  else {
    char v9 = v4;
  }
  if (v8)
  {
    if (v9)
    {
      if (v4)
      {
        [v7 setPausesOnCompletion:1];
        if ([v7 isReversed])
        {
          if ([v7 isRunning]) {
            [v7 pauseAnimation];
          }
          [v7 setReversed:0];
          uint64_t v10 = [v7 timingParameters];
          [v7 continueAnimationWithTimingParameters:v10 durationFactor:1.0];
        }
        else
        {
          [v7 startAnimation];
        }
      }
    }
    else
    {
      [v7 setPausesOnCompletion:0];
      if ([v7 isRunning]) {
        [v7 pauseAnimation];
      }
      [v7 setReversed:1];
      unint64_t v11 = [v7 timingParameters];
      uint64_t v12 = [(_UIDragSourceLiftEffect *)self reversedTimingParametersForTimingParameters:v11];

      [v7 continueAnimationWithTimingParameters:v12 durationFactor:1.0];
      [(_UIDragSourceLiftEffect *)self setScrollCancelling:0];
      uint64_t v13 = [v15 items];
      uint64_t v14 = [v13 count];

      if (!v14)
      {
        [v7 stopAnimation:0];
        [v7 finishAnimationAtPosition:1];
      }
    }
  }
  else if (v9)
  {
    [v7 pauseAnimation];
  }
  else
  {
    [v7 stopAnimation:0];
    [v7 finishAnimationAtPosition:1];
    [(_UIDragSourceLiftEffect *)self _uninstallInteractionPlattersForOperation:v15];
  }
}

- (BOOL)scrollCancelling
{
  return self->_scrollCancelling;
}

- (void)setScrollCancelling:(BOOL)a3
{
  self->_scrollCancelling = a3;
}

@end