@interface UIButtonCanInferIndicator
@end

@implementation UIButtonCanInferIndicator

void ___UIButtonCanInferIndicator_block_invoke()
{
  if (dyld_program_sdk_at_least())
  {
    v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v1 = [v0 objectForKey:@"InferButtonIndicators"];

    if (v1
      || (_UIKitPreferencesOnce(),
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 objectForKey:@"InferButtonIndicators"],
          v1 = objc_claimAutoreleasedReturnValue(),
          v2,
          v1))
    {
      char v3 = [v1 BOOLValue];
    }
    else
    {
      char v3 = 1;
    }
    _MergedGlobals_1085 = v3;
  }
}

@end