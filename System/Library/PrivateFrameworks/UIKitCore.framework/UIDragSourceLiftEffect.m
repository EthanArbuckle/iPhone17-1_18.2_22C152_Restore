@interface UIDragSourceLiftEffect
@end

@implementation UIDragSourceLiftEffect

void __68___UIDragSourceLiftEffect__addworkaroundForPropertyAnimator_inView___block_invoke(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68___UIDragSourceLiftEffect__addworkaroundForPropertyAnimator_inView___block_invoke_2;
  v8[3] = &unk_1E52D9F70;
  id v9 = *(id *)(a1 + 32);
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v8, v5, v6, v7);
}

uint64_t __68___UIDragSourceLiftEffect__addworkaroundForPropertyAnimator_inView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __68___UIDragSourceLiftEffect__addworkaroundForPropertyAnimator_inView___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

void __60___UIDragSourceLiftEffect_interaction_didChangeWithContext___block_invoke(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  id v8 = [*(id *)(a1 + 32) animations];
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v8, v5, v6, v7);
}

void __67___UIDragSourceLiftEffect__installInteractionPlattersForOperation___block_invoke(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67___UIDragSourceLiftEffect__installInteractionPlattersForOperation___block_invoke_2;
  v8[3] = &unk_1E52D9F70;
  id v9 = *(id *)(a1 + 32);
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048615, v8, v5, v6, v7);
}

void __67___UIDragSourceLiftEffect__installInteractionPlattersForOperation___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "items", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        double v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        double v7 = [v6 platterView];
        [v7 setLifted:1];
        [v6 liftAlpha];
        objc_msgSend(v7, "setAlpha:");
        [v7 layoutIfNeeded];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

uint64_t __67___UIDragSourceLiftEffect__installInteractionPlattersForOperation___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2 == 1) {
    return [*(id *)(result + 32) _uninstallInteractionPlattersForOperation:*(void *)(result + 40)];
  }
  return result;
}

@end