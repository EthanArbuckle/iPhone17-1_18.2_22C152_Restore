@interface UIStatusBarAnimationFactory
@end

@implementation UIStatusBarAnimationFactory

uint64_t __43___UIStatusBarAnimationFactory_noAnimation__block_invoke()
{
  uint64_t v0 = +[_UIStatusBarAnimation animationWithBlock:&__block_literal_global_25_5];
  v1 = (void *)_MergedGlobals_1227;
  _MergedGlobals_1227 = v0;

  v2 = (void *)_MergedGlobals_1227;
  return [v2 setIdentifier:@"noAnimation"];
}

uint64_t __43___UIStatusBarAnimationFactory_noAnimation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a4, 1);
}

void __71___UIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v10 = a4;
  v11 = [v8 identifier];
  v12 = [v9 objectForKeyedSubscript:v11];

  if ([v7 type] == 2)
  {
    [v12 frame];
    objc_msgSend(v8, "setAbsoluteFrame:");
  }
  else if ([v12 itemAppearing])
  {
    [v8 setAlpha:0.0];
    long long v13 = *(_OWORD *)(a1 + 56);
    v25[0] = *(_OWORD *)(a1 + 40);
    v25[1] = v13;
    v25[2] = *(_OWORD *)(a1 + 72);
    [v8 setTransform:v25];
    [v12 setOptions:0];
  }
  double v14 = *(double *)(a1 + 88);
  uint64_t v15 = [v12 options];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71___UIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_2;
  v19[3] = &unk_1E5307600;
  id v20 = v8;
  id v21 = v7;
  long long v16 = *(_OWORD *)(a1 + 56);
  long long v22 = *(_OWORD *)(a1 + 40);
  long long v23 = v16;
  long long v24 = *(_OWORD *)(a1 + 72);
  id v17 = v7;
  id v18 = v8;
  +[UIView animateWithDuration:v15 delay:v19 options:v10 animations:v14 completion:0.0];
}

uint64_t __71___UIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) type];
  double v3 = 0.0;
  if (v2 == 1) {
    double v3 = 1.0;
  }
  [*(id *)(a1 + 32) setAlpha:v3];
  uint64_t v4 = [*(id *)(a1 + 40) type];
  v5 = (_OWORD *)(a1 + 48);
  if (v4 == 1) {
    v5 = (_OWORD *)MEMORY[0x1E4F1DAB8];
  }
  long long v6 = v5[1];
  v8[0] = *v5;
  v8[1] = v6;
  v8[2] = v5[2];
  return [*(id *)(a1 + 32) setTransform:v8];
}

BOOL __71___UIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(_UIStatusBarFadeAnimationParameters);
  [v6 absoluteFrame];
  -[_UIStatusBarFadeAnimationParameters setFrame:](v7, "setFrame:");
  uint64_t v8 = [v5 type];
  if (v8 != 3)
  {
    if ([v5 type] == 2)
    {
      [v6 setFloating:1];
    }
    else
    {
      [v6 alpha];
      if (v9 == 1.0)
      {
        [(_UIStatusBarFadeAnimationParameters *)v7 setItemAppearing:1];
LABEL_7:
        id v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        v11 = [v6 identifier];
        [v10 setObject:v7 forKeyedSubscript:v11];

        goto LABEL_8;
      }
    }
    [(_UIStatusBarFadeAnimationParameters *)v7 setOptions:4];
    goto LABEL_7;
  }
LABEL_8:

  return v8 != 3;
}

void __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_2;
  v9[3] = &unk_1E52D9CD0;
  id v10 = v6;
  double v7 = *(double *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v8 = v6;
  +[UIView animateKeyframesWithDuration:3072 delay:v9 options:a4 animations:v7 completion:0.0];
}

void __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_3;
  v4[3] = &unk_1E52D9CD0;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  +[UIView addKeyframeWithRelativeStartTime:v4 relativeDuration:0.0 animations:0.333];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_4;
  v2[3] = &unk_1E52D9F70;
  id v3 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v2 relativeDuration:0.333 animations:0.664];
}

uint64_t __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_3(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __65___UIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

@end