@interface UIMotionEffectEngine
@end

@implementation UIMotionEffectEngine

id __29___UIMotionEffectEngine_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_analyzerClass")), "initWithSettings:", v2);

  return v3;
}

void __29___UIMotionEffectEngine_init__block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t state64 = 0;
  notify_get_state(a2, &state64);
  if (state64 < 0x1E)
  {
    [WeakRetained endSuspendingForReason:@"thermal"];
  }
  else
  {
    [WeakRetained beginSuspendingForReason:@"thermal"];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __29___UIMotionEffectEngine_init__block_invoke_3;
    v4[3] = &unk_1E52D9F70;
    id v5 = WeakRetained;
    +[UIView animateWithDuration:v4 animations:0.75];
  }
}

uint64_t __29___UIMotionEffectEngine_init__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetMotionAnalysis];
}

void __29___UIMotionEffectEngine_init__block_invoke_4(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 128), &state64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29___UIMotionEffectEngine_init__block_invoke_5;
  block[3] = &unk_1E52DF528;
  objc_copyWeak(v3, (id *)(a1 + 40));
  v3[1] = (id)state64;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v3);
}

void __29___UIMotionEffectEngine_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = (double)*(unint64_t *)(a1 + 40);
  int v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIMotionEffectMinimumBacklightLevel, @"UIMotionEffectMinimumBacklightLevel");
  double v5 = *(double *)&qword_1E8FD53A0;
  if (v4) {
    double v5 = 5.0;
  }
  if (v5 >= v3)
  {
    [WeakRetained beginSuspendingForReason:@"screenDimmed"];
    if (*(void *)(a1 + 40)) {
      double v6 = 0.75;
    }
    else {
      double v6 = 0.0;
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __29___UIMotionEffectEngine_init__block_invoke_6;
    v7[3] = &unk_1E52D9F70;
    id v8 = WeakRetained;
    +[UIView animateWithDuration:v7 animations:v6];
  }
  else
  {
    [WeakRetained endSuspendingForReason:@"screenDimmed"];
  }
}

uint64_t __29___UIMotionEffectEngine_init__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetMotionAnalysis];
}

uint64_t __41___UIMotionEffectEngine_updateWithEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLatestDeviceMotion];
}

@end