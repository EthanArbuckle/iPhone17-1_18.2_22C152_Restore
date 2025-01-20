@interface UITextDragCaretView
@end

@implementation UITextDragCaretView

uint64_t __80___UITextDragCaretView__insertAtRangeOrPosition_animations_completion_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v7[0] = *MEMORY[0x1E4F1DAB8];
  v7[1] = v3;
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v7];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = [*(id *)(a1 + 32) layer];
  [v5 setMask:v4];

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __80___UITextDragCaretView__insertAtRangeOrPosition_animations_completion_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39___UITextDragCaretView__performUpdate___block_invoke(uint64_t a1)
{
  v2 = CGPathRetain((CGPathRef)[*(id *)(*(void *)(a1 + 32) + 416) path]);
  long long v3 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = [v3 _caretColor];
    [*(id *)(a1 + 32) setBackgroundColor:v4];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 408));
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 408));
    [v6 caretRectForPosition:*(void *)(a1 + 40)];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 408));
    v16 = [v15 textInputView];
    objc_msgSend(WeakRetained, "convertRect:fromView:", v16, v8, v10, v12, v14);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    id v25 = 0;
  }
  else
  {
    v26 = [v3 _rangeColor];
    [*(id *)(a1 + 32) setBackgroundColor:v26];

    [*(id *)(a1 + 32) _configureMask:*(void *)(*(void *)(a1 + 32) + 416) withPath:*(void *)(a1 + 48)];
    double v18 = v27;
    double v20 = v28;
    double v22 = v29;
    double v24 = v30;
    id v25 = *(id *)(*(void *)(a1 + 32) + 416);
  }
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v18, v20, v22, v24);
  v31 = [*(id *)(a1 + 32) layer];
  id v32 = [v31 mask];
  if (v32 == v25)
  {
    int v34 = *(unsigned __int8 *)(a1 + 64);

    if (v34)
    {
      v35 = [v25 animationForKey:@"bounds"];
      v33 = (void *)[v35 copy];

      [v33 setKeyPath:@"path"];
      [v33 setFromValue:v2];
      [v25 addAnimation:v33 forKey:@"path"];
      goto LABEL_9;
    }
  }
  else
  {
  }
  v33 = [*(id *)(a1 + 32) layer];
  [v33 setMask:v25];
LABEL_9:

  CGPathRelease(v2);
  v36 = *(void **)(a1 + 32);
  long long v37 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v38[0] = *MEMORY[0x1E4F1DAB8];
  v38[1] = v37;
  v38[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v36 setTransform:v38];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __39___UITextDragCaretView__performUpdate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65___UITextDragCaretView_removeWithAnimations_completion_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 408));
  [WeakRetained _caretRect];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __65___UITextDragCaretView_removeWithAnimations_completion_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  CGAffineTransformMakeScale(&v5, 0.8, 0.8);
  v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __65___UITextDragCaretView_removeWithAnimations_completion_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end