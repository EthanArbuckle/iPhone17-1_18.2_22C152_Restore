@interface UIView(SBUtilities)
- (uint64_t)sb_setBoundsAndPositionFromFrame:()SBUtilities;
- (void)sb_setPresentationBoundsAndPositionFromFrame:()SBUtilities;
@end

@implementation UIView(SBUtilities)

- (uint64_t)sb_setBoundsAndPositionFromFrame:()SBUtilities
{
  [a1 bounds];
  objc_msgSend(a1, "setBounds:");
  v10 = [a1 layer];
  [v10 anchorPoint];
  double v12 = v11;
  double v14 = v13;

  return objc_msgSend(a1, "setCenter:", a2 + v12 * a4, a3 + v14 * a5);
}

- (void)sb_setPresentationBoundsAndPositionFromFrame:()SBUtilities
{
  [a1 bounds];
  double v11 = v10;
  double v13 = v12;
  double v14 = [a1 layer];
  [v14 anchorPoint];
  double v16 = v15;
  double v18 = v17;

  v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", a2 + v16 * a4, a3 + v18 * a5);
  [a1 _setPresentationValue:v19 forKey:@"position"];

  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v11, v13, a4, a5);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _setPresentationValue:v20 forKey:@"bounds"];
}

@end