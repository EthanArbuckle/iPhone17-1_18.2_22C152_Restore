@interface STUIStatusBarAnimationFactory
+ (id)fadeAnimationWithDuration:(double)a3;
+ (id)fadeAnimationWithDuration:(double)a3 scale:(double)a4;
+ (id)fadeAnimationWithDuration:(double)a3 scale:(double)a4 offset:(UIOffset)a5;
+ (id)noAnimation;
+ (id)pulseAnimationWithDuration:(double)a3 scale:(double)a4;
@end

@implementation STUIStatusBarAnimationFactory

+ (id)noAnimation
{
  if (qword_1EC05EF88 != -1) {
    dispatch_once(&qword_1EC05EF88, &__block_literal_global_16);
  }
  v2 = (void *)_MergedGlobals_49;
  return v2;
}

uint64_t __44__STUIStatusBarAnimationFactory_noAnimation__block_invoke()
{
  uint64_t v0 = +[STUIStatusBarAnimation animationWithBlock:&__block_literal_global_25];
  v1 = (void *)_MergedGlobals_49;
  _MergedGlobals_49 = v0;

  v2 = (void *)_MergedGlobals_49;
  return [v2 setIdentifier:@"noAnimation"];
}

uint64_t __44__STUIStatusBarAnimationFactory_noAnimation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a4, 1);
}

+ (id)fadeAnimationWithDuration:(double)a3
{
  return (id)[a1 fadeAnimationWithDuration:a3 scale:1.0];
}

+ (id)fadeAnimationWithDuration:(double)a3 scale:(double)a4
{
  return (id)objc_msgSend(a1, "fadeAnimationWithDuration:scale:offset:", a3, a4, *MEMORY[0x1E4FB2E10], *(double *)(MEMORY[0x1E4FB2E10] + 8));
}

+ (id)fadeAnimationWithDuration:(double)a3 scale:(double)a4 offset:(UIOffset)a5
{
  double vertical = a5.vertical;
  double horizontal = a5.horizontal;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__7;
  v23[4] = __Block_byref_object_dispose__7;
  id v24 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v9 = *MEMORY[0x1E4F1DAB8];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v22.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v22.c = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v22.tx = v11;
  if (horizontal != *MEMORY[0x1E4FB2E10] || vertical != *(double *)(MEMORY[0x1E4FB2E10] + 8))
  {
    *(_OWORD *)&v21.a = v9;
    *(_OWORD *)&v21.c = v10;
    *(_OWORD *)&v21.tx = v11;
    CGAffineTransformTranslate(&v22, &v21, horizontal, vertical);
  }
  if (a4 != 1.0)
  {
    CGAffineTransform v20 = v22;
    CGAffineTransformScale(&v21, &v20, a4, a4);
    CGAffineTransform v22 = v21;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  CGAffineTransform v18 = v22;
  v17[2] = __72__STUIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke;
  v17[3] = &unk_1E6AA5148;
  v17[4] = v23;
  double v19 = a3;
  v13 = +[STUIStatusBarAnimation animationWithBlock:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__STUIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_3;
  v16[3] = &unk_1E6AA3E90;
  v16[4] = v23;
  [v13 setPrepareBlock:v16];
  v14 = [NSString stringWithFormat:@"fadeAnimation[%.2f]", *(void *)&a3];
  [v13 setIdentifier:v14];

  _Block_object_dispose(v23, 8);
  return v13;
}

void __72__STUIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  long long v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v10 = a4;
  long long v11 = [v8 identifier];
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
    v26[0] = *(_OWORD *)(a1 + 40);
    v26[1] = v13;
    v26[2] = *(_OWORD *)(a1 + 72);
    [v8 setTransform:v26];
    [v12 setOptions:0];
  }
  v14 = (void *)MEMORY[0x1E4FB1EB0];
  double v15 = *(double *)(a1 + 88);
  uint64_t v16 = [v12 options];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__STUIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_2;
  v20[3] = &unk_1E6AA5120;
  id v21 = v8;
  id v22 = v7;
  long long v17 = *(_OWORD *)(a1 + 56);
  long long v23 = *(_OWORD *)(a1 + 40);
  long long v24 = v17;
  long long v25 = *(_OWORD *)(a1 + 72);
  id v18 = v7;
  id v19 = v8;
  [v14 animateWithDuration:v16 delay:v20 options:v10 animations:v15 completion:0.0];
}

uint64_t __72__STUIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_2(uint64_t a1)
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

BOOL __72__STUIStatusBarAnimationFactory_fadeAnimationWithDuration_scale_offset___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(STUIStatusBarFadeAnimationParameters);
  [v6 absoluteFrame];
  -[STUIStatusBarFadeAnimationParameters setFrame:](v7, "setFrame:");
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
        [(STUIStatusBarFadeAnimationParameters *)v7 setItemAppearing:1];
LABEL_7:
        id v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        long long v11 = [v6 identifier];
        [v10 setObject:v7 forKeyedSubscript:v11];

        goto LABEL_8;
      }
    }
    [(STUIStatusBarFadeAnimationParameters *)v7 setOptions:4];
    goto LABEL_7;
  }
LABEL_8:

  return v8 != 3;
}

+ (id)pulseAnimationWithDuration:(double)a3 scale:(double)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke;
  v6[3] = &__block_descriptor_48_e71_v32__0__STUIStatusBarAnimation_8__STUIStatusBarDisplayItem_16___v__B_24l;
  *(double *)&v6[4] = a3;
  *(double *)&v6[5] = a4;
  uint64_t v4 = +[STUIStatusBarAnimation animationWithBlock:v6];
  return v4;
}

void __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4FB1EB0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_2;
  v10[3] = &unk_1E6AA3F30;
  id v11 = v6;
  double v8 = *(double *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v9 = v6;
  [v7 animateKeyframesWithDuration:3072 delay:v10 options:a4 animations:v8 completion:0.0];
}

void __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_3;
  v6[3] = &unk_1E6AA3F30;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  [v2 addKeyframeWithRelativeStartTime:v6 relativeDuration:0.0 animations:0.333];
  double v3 = (void *)MEMORY[0x1E4FB1EB0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_4;
  v4[3] = &unk_1E6AA37A0;
  id v5 = *(id *)(a1 + 32);
  [v3 addKeyframeWithRelativeStartTime:v4 relativeDuration:0.333 animations:0.664];
}

uint64_t __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_3(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __66__STUIStatusBarAnimationFactory_pulseAnimationWithDuration_scale___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

@end