@interface UIFocusRotaryIndicatorView
@end

@implementation UIFocusRotaryIndicatorView

uint64_t __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_2;
  v6[3] = &unk_1E52D9F70;
  v6[4] = *(void *)(a1 + 32);
  +[UIView animateWithDuration:v6 animations:0.15];
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 488);
  *(void *)(v1 + 488) = 0;
}

uint64_t __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 448);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_5(uint64_t a1)
{
  memset(&v13, 0, sizeof(v13));
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(void **)(v2 + 448);
  if (v3)
  {
    [v3 transform];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  else
  {
    memset(&v12, 0, sizeof(v12));
  }
  CGAffineTransformRotate(&v13, &v12, 1.96349541);
  v4 = *(void **)(v2 + 448);
  CGAffineTransform v11 = v13;
  [v4 setTransform:&v11];
  memset(&v11, 0, sizeof(v11));
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 448);
  if (v6)
  {
    [v6 transform];
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    memset(&v10, 0, sizeof(v10));
  }
  CGAffineTransformRotate(&v11, &v10, 1.96349541);
  v7 = *(void **)(v5 + 448);
  CGAffineTransform v9 = v11;
  return [v7 setTransform:&v9];
}

void __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 496);
  *(void *)(v1 + 496) = 0;
}

uint64_t __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_7(uint64_t a1)
{
  memset(&v9, 0, sizeof(v9));
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RotaryFocusRingHiddenScale, @"RotaryFocusRingHiddenScale", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v2 = 0.1; {
  else
  }
    double v2 = *(double *)&qword_1E8FD5688;
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RotaryFocusRingHiddenScale, @"RotaryFocusRingHiddenScale", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v3 = 0.1; {
  else
  }
    double v3 = *(double *)&qword_1E8FD5688;
  CGAffineTransformMakeScale(&v9, v2, v3);
  v4 = *(void **)(*(void *)(a1 + 32) + 448);
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v8.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v8.c = v5;
  *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v4 setTransform:&v8];
  v6 = *(void **)(a1 + 32);
  CGAffineTransform v8 = v9;
  [v6 setTransform:&v8];
  [*(id *)(a1 + 32) setAlpha:0.0];
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 480);
  *(void *)(v2 + 480) = 0;

  v4 = *(void **)(*(void *)(a1 + 32) + 448);
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v10 = *MEMORY[0x1E4F1DAB8];
  long long v8 = v10;
  long long v11 = v9;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v7 = v12;
  [v4 setTransform:&v10];
  long long v5 = *(void **)(a1 + 32);
  long long v10 = v8;
  long long v11 = v9;
  long long v12 = v7;
  [v5 setTransform:&v10];
  v6 = [*(id *)(*(void *)(a1 + 32) + 472) layer];
  [v6 setCompositingFilter:0];
}

@end