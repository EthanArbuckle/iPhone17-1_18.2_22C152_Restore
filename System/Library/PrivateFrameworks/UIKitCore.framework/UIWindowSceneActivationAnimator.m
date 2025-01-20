@interface UIWindowSceneActivationAnimator
@end

@implementation UIWindowSceneActivationAnimator

void __58___UIWindowSceneActivationAnimator_prewarmWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___UIWindowSceneActivationAnimator_prewarmWithCompletion___block_invoke_2;
  block[3] = &unk_1E52FD268;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __58___UIWindowSceneActivationAnimator_prewarmWithCompletion___block_invoke_2(uint64_t a1)
{
  v60[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained state];
  id v4 = [*(id *)(a1 + 32) error];

  if (v4)
  {
    uint64_t v3 = 2;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = *(id *)(a1 + 32);
      uint64_t v6 = [v5 sceneContainerContextId];
      id v7 = [WeakRetained incomingScenePortalView];
      id v8 = [v7 portalLayer];
      [v8 setSourceContextId:v6];

      uint64_t v9 = [v5 sceneContainerRenderId];
      v10 = [WeakRetained incomingScenePortalView];
      v11 = [v10 portalLayer];
      [v11 setSourceLayerRenderId:v9];

      v12 = [WeakRetained morphContainerView];
      v13 = [v12 window];
      [v5 sceneFrame];
      objc_msgSend(v13, "_convertRectFromSceneReferenceSpace:");
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;

      v22 = [v12 superview];
      v55 = v12;
      v23 = [v12 window];
      objc_msgSend(v22, "convertRect:fromView:", v23, v15, v17, v19, v21);
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;

      objc_msgSend(v12, "setFrame:", v25, v27, v29, v31);
      v32 = objc_opt_new();
      objc_msgSend(v32, "setSourceContextId:", objc_msgSend(v5, "sceneContainerContextId"));
      objc_msgSend(v32, "setSourceLayerRenderId:", objc_msgSend(v5, "sceneContainerRenderId"));
      [v32 setDuration:INFINITY];
      uint64_t v3 = 1;
      [v32 setUsesNormalizedCoordinates:1];
      v59[0] = 0;
      v59[1] = 0;
      v33 = [MEMORY[0x1E4F29238] valueWithBytes:v59 objCType:"{CGPoint=dd}"];
      v60[0] = v33;
      long long v58 = xmmword_186B8C800;
      v34 = [MEMORY[0x1E4F29238] valueWithBytes:&v58 objCType:"{CGPoint=dd}"];
      v60[1] = v34;
      __asm { FMOV            V0.2D, #1.0 }
      long long v57 = _Q0;
      v40 = [MEMORY[0x1E4F29238] valueWithBytes:&v57 objCType:"{CGPoint=dd}"];
      v60[2] = v40;
      long long v56 = xmmword_186B89740;
      v41 = [MEMORY[0x1E4F29238] valueWithBytes:&v56 objCType:"{CGPoint=dd}"];
      v60[3] = v41;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:4];
      [v32 setSourcePoints:v42];

      [WeakRetained setIncomingSceneAnchorAnimation:v32];
      [v5 sceneFrame];
      objc_msgSend(WeakRetained, "setExpectedFrame:");
      [v5 sceneCornerRadii];
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;

      objc_msgSend(WeakRetained, "setExpectedCornerRadii:", v44, v46, v48, v50);
      v51 = [WeakRetained incomingScenePortalView];
      objc_msgSend(v51, "setFrame:", 0.0, 0.0, v29, v31);
    }
  }
  [WeakRetained setState:v3];
  uint64_t v52 = *(void *)(a1 + 40);
  if (v52)
  {
    BOOL v53 = [WeakRetained state] == 1;
    v54 = [WeakRetained morphContainerView];
    (*(void (**)(uint64_t, BOOL, void *))(v52 + 16))(v52, v53, v54);
  }
}

uint64_t __70___UIWindowSceneActivationAnimator_animateWithSourcePreview_velocity___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  long long v2 = *(_OWORD *)(a1 + 112);
  v4[0] = *(_OWORD *)(a1 + 96);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 128);
  [*(id *)(a1 + 32) setTransform:v4];
  [*(id *)(a1 + 32) setExpanded:1];
  [*(id *)(a1 + 32) layoutIfNeeded];
  return [*(id *)(a1 + 40) _performAllAlongsideAnimations:*(void *)(a1 + 32)];
}

uint64_t __70___UIWindowSceneActivationAnimator_animateWithSourcePreview_velocity___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCompletionActionCallingAlongsideCompletions:1];
}

void __50___UIWindowSceneActivationAnimator_setDeparented___block_invoke(uint64_t a1)
{
  long long v2 = *(unsigned char **)(a1 + 32);
  if (v2[8]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = [v2 deparentingPortalAlphaSourceView];
  [v4 setAlpha:v3];

  id v7 = [*(id *)(a1 + 32) deparentingWrapper];
  id v5 = [v7 layer];
  uint64_t v6 = [NSNumber numberWithDouble:v3];
  [v5 setValue:v6 forKeyPath:@"filters.opacityPair.inputAmount"];
}

void __85___UIWindowSceneActivationAnimator__sendCompletionActionCallingAlongsideCompletions___block_invoke_2(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __85___UIWindowSceneActivationAnimator__sendCompletionActionCallingAlongsideCompletions___block_invoke_3;
  v1[3] = &unk_1E52D9FC0;
  v1[4] = *(void *)(a1 + 32);
  char v2 = *(unsigned char *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v1);
}

uint64_t __85___UIWindowSceneActivationAnimator__sendCompletionActionCallingAlongsideCompletions___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _cleanUp];
  if (*(unsigned char *)(a1 + 40))
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 _performAllAlongsideCompletions];
  }
  return result;
}

@end