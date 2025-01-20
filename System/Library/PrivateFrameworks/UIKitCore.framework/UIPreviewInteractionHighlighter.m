@interface UIPreviewInteractionHighlighter
@end

@implementation UIPreviewInteractionHighlighter

void __82___UIPreviewInteractionHighlighter__updateFromInteraction_fractionComplete_ended___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));

  if (!WeakRetained)
  {
    v11 = [*(id *)(a1 + 48) effectView];
    v12 = v11;
    if (v11) {
      id v13 = v11;
    }
    else {
      id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    }
    v14 = v13;

    uint64_t v15 = [*(id *)(a1 + 32) clickEffectPhase];
    if (v15 == 2)
    {
      double v16 = 1.01;
      if (*(unsigned char *)(a1 + 64)) {
        double v16 = 1.0;
      }
    }
    else if (v15 == 1)
    {
      [v14 frame];
      CGFloat Width = CGRectGetWidth(v25);
      double v19 = (Width + -14.36) / Width;
      if (v19 < 0.96) {
        double v19 = 0.96;
      }
      double v16 = 1.0 - *(double *)(a1 + 56) + *(double *)(a1 + 56) * v19;
    }
    else
    {
      double v16 = 1.0;
      if (!v15)
      {
        uint64_t v17 = *(void *)(a1 + 32);
        if (!*(unsigned char *)(a1 + 64)) {
          double v16 = *(double *)(v17 + 96);
        }
        double v16 = v16 + *(double *)(a1 + 56) * (*(double *)(v17 + 104) - v16);
      }
    }
    CGAffineTransformMakeScale(&v22, v16, v16);
    CGAffineTransform v21 = v22;
    v20 = &v21;
    goto LABEL_24;
  }
  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v3 _highlightForInteraction:*(void *)(a1 + 40) fractionComplete:*(unsigned __int8 *)(a1 + 64) ended:*(double *)(a1 + 56)];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    int v7 = [v6 _highlightsAlongsideDefaultEffect];

    if (v7)
    {
      double v8 = *(double *)(a1 + 56) * 0.0175 + 1.0;
      v9 = *(void **)(a1 + 48);
      if (v9)
      {
        uint64_t v10 = [v9 effectView];
      }
      else
      {
        uint64_t v10 = (uint64_t)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      }
      v14 = (void *)v10;
      CGAffineTransformMakeScale(&v24, v8, v8);
      CGAffineTransform v23 = v24;
      v20 = &v23;
LABEL_24:
      objc_msgSend(v14, "setTransform:", v20, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);
    }
  }
}

void __82___UIPreviewInteractionHighlighter__updateFromInteraction_fractionComplete_ended___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 72) isEqual:*(void *)(a1 + 40)])
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
      char v3 = objc_opt_respondsToSelector();

      if (v3)
      {
        id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
        [v4 _highlightDidEndForInteraction:*(void *)(a1 + 48)];
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 65) = 0;
      [*(id *)(a1 + 32) _finalizeAfterInteractionIfNeeded];
    }
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = 0;
  }
}

uint64_t __82___UIPreviewInteractionHighlighter__updateFromInteraction_fractionComplete_ended___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = 0;
  return [*(id *)(a1 + 32) _finalizeAfterInteractionIfNeeded];
}

void __93___UIPreviewInteractionHighlighter__applyHighlightEffectsToViewControllerDuringCancellation___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  char v3 = [*(id *)(*(void *)(a1 + 32) + 32) environment];
  if (v3)
  {
    id v4 = [v8 containerView];
    if (v4)
    {
      uint64_t v5 = [v3 interactiveHighlightEffectForView:v4 options:2];
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(void **)(v6 + 48);
      *(void *)(v6 + 48) = v5;
    }
  }
}

uint64_t __73___UIPreviewInteractionHighlighter__prepareContentEffectsForInteraction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareHighlightForInteraction:*(void *)(a1 + 40)];
}

uint64_t __68___UIPreviewInteractionHighlighter__setHighlighted_forViewIfNeeded___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHighlighted:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

@end