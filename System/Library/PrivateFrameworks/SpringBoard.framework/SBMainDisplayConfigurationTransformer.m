@interface SBMainDisplayConfigurationTransformer
+ (id)transformedMainDisplayConfigurationForConfiguration:(id)a3;
- (id)transformDisplayConfiguration:(id)a3;
@end

@implementation SBMainDisplayConfigurationTransformer

+ (id)transformedMainDisplayConfigurationForConfiguration:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(SBMainDisplayConfigurationTransformer);
  v7 = [(SBMainDisplayConfigurationTransformer *)v6 transformDisplayConfiguration:v5];

  if ([v7 count] != 1)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"SBMainDisplayConfigurationTransformer.m" lineNumber:22 description:@"Can only have a single transformed display for the main display."];
  }
  v8 = [v7 anyObject];

  return v8;
}

- (id)transformDisplayConfiguration:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  BSCGFloatEpsilon();
  double v9 = v8;
  v10 = [v3 CADisplay];
  if (v5 <= v9 || v5 >= 1.79769313e308 || v7 <= v9 || v7 >= 1.79769313e308)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"-[SBMainDisplayConfigurationTransformer transformDisplayConfiguration:]"];
    [v10 bounds];
    v18 = NSStringFromCGRect(v25);
    v19 = [v10 currentMode];
    v20 = [v10 currentMode];
    uint64_t v21 = [v20 preferredScale];
    v22 = [v10 preferredMode];
    v23 = [v10 availableModes];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"SBMainDisplayConfigurationTransformer.m", 62, @"We expect a valid bounds for configuration: %@; CADisplay bounds: %@; currentMode: %@; preferredScale: %lu; preferredMode: %@; availableModes: %lu",
      v3,
      v18,
      v19,
      v21,
      v22,
      [v23 count]);
  }
  v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];

  return v14;
}

@end