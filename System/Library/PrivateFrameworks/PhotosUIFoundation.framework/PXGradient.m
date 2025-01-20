@interface PXGradient
+ (NSArray)opacityValuesForSmoothDescendingGradient;
+ (NSArray)stopLocationsForSmoothDescendingGradient;
+ (id)colorValuesForSmoothDescendingGradientWithBaseColor:(id)a3;
@end

@implementation PXGradient

+ (NSArray)stopLocationsForSmoothDescendingGradient
{
  return (NSArray *)&unk_2707AF058;
}

+ (id)colorValuesForSmoothDescendingGradientWithBaseColor:(id)a3
{
  id v3 = a3;
  v4 = +[PXGradient opacityValuesForSmoothDescendingGradient];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__PXGradient_colorValuesForSmoothDescendingGradientWithBaseColor___block_invoke;
  v8[3] = &unk_26545A130;
  id v9 = v3;
  id v5 = v3;
  v6 = PXMap(v4, v8);

  return v6;
}

id __66__PXGradient_colorValuesForSmoothDescendingGradientWithBaseColor___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 doubleValue];
  objc_msgSend(v2, "colorWithAlphaComponent:");
  id v3 = objc_claimAutoreleasedReturnValue();
  v4 = [v3 CGColor];

  return v4;
}

+ (NSArray)opacityValuesForSmoothDescendingGradient
{
  return (NSArray *)&unk_2707AF040;
}

@end