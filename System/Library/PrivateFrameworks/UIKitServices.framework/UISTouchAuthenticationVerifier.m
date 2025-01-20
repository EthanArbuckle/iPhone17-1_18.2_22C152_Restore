@interface UISTouchAuthenticationVerifier
@end

@implementation UISTouchAuthenticationVerifier

UISTransform3DGrader *__89___UISTouchAuthenticationVerifier_initWithBuildOverrideThresholds_runOverrideThresholds___block_invoke(uint64_t a1, int a2, double a3, double a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v8 = objc_alloc_init(UISTransform3DGrader);
  v9 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"mayHaveCatalystPadIdiom"];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    v12[0] = xmmword_191AE2730;
    [(UISTransform3DGrader *)v8 allowScales:v12 count:2 lowerMultiplier:a3 lowerConstant:0.0 upperMultiplier:a4 upperConstant:0.0];
    long long v13 = xmmword_191AE2740;
    [(UISTransform3DGrader *)v8 allowRotations:&v13 count:2];
    [(UISTransform3DGrader *)v8 allowHorizontalFlip:1];
  }
  else
  {
    *(void *)&long long v13 = 0x3FF0000000000000;
    [(UISTransform3DGrader *)v8 allowScales:&v13 count:1 lowerMultiplier:a3 lowerConstant:0.0 upperMultiplier:a4 upperConstant:0.0];
    if (a2)
    {
      v12[0] = xmmword_191AE2750;
      v12[1] = unk_191AE2760;
      [(UISTransform3DGrader *)v8 allowRotations:v12 count:4];
    }
  }
  return v8;
}

@end