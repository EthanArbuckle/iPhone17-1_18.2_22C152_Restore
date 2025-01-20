@interface SUICProgressRingLayer
@end

@implementation SUICProgressRingLayer

uint64_t __38___SUICProgressRingLayer_setSpinning___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation.z"];
  v1 = (void *)setSpinning__sRotationAnimation;
  setSpinning__sRotationAnimation = v0;

  [(id)setSpinning__sRotationAnimation setToValue:&unk_1EFB50388];
  [(id)setSpinning__sRotationAnimation setDuration:0.75];
  [(id)setSpinning__sRotationAnimation setCumulative:1];
  v2 = (void *)setSpinning__sRotationAnimation;
  LODWORD(v3) = 2139095040;

  return [v2 setRepeatCount:v3];
}

void __58___SUICProgressRingLayer_setProgress_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setStrokeEnd:*(double *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

@end