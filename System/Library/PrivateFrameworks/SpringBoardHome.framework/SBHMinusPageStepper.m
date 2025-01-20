@interface SBHMinusPageStepper
- (SBHMinusPageStepper)init;
- (double)backgroundBlurAlpha;
- (double)pageControlAlpha;
@end

@implementation SBHMinusPageStepper

- (double)backgroundBlurAlpha
{
  [(SBFSteppedAnimationTimingFunctionCalculator *)self valueForFunctionWithName:@"backgroundBlurAlpha"];
  return result;
}

- (SBHMinusPageStepper)init
{
  v11.receiver = self;
  v11.super_class = (Class)SBHMinusPageStepper;
  v2 = [(SBFSteppedAnimationTimingFunctionCalculator *)&v11 init];
  if (v2)
  {
    LODWORD(v4) = 1036831949;
    LODWORD(v3) = 0.25;
    LODWORD(v5) = 0.25;
    LODWORD(v6) = 1.0;
    v7 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v3 :v4 :v5 :v6];
    v8 = [MEMORY[0x1E4F4F680] settingsWithDuration:v7 delay:0.75 timingFunction:0.0];
    v9 = [MEMORY[0x1E4F4F680] settingsWithDuration:v7 delay:0.65 timingFunction:0.0];
    [(SBFSteppedAnimationTimingFunctionCalculator *)v2 addTimingFunctionWithName:@"backgroundBlurAlpha" fromNormalizedAnimationSettings:v8];
    [(SBFSteppedAnimationTimingFunctionCalculator *)v2 addTimingFunctionWithName:@"pageControlAlpha" fromNormalizedAnimationSettings:v9];
  }
  return v2;
}

- (double)pageControlAlpha
{
  [(SBFSteppedAnimationTimingFunctionCalculator *)self valueForFunctionWithName:@"pageControlAlpha"];
  return 1.0 - v2;
}

@end