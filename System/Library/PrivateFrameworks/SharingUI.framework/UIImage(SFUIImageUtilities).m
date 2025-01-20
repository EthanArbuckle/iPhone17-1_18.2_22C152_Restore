@interface UIImage(SFUIImageUtilities)
+ (double)sfui_scaleSize:()SFUIImageUtilities toSize:contentMode:;
+ (id)sfui_bulletImageWithSystemName:()SFUIImageUtilities color:;
+ (id)sfui_systemImageNamed:()SFUIImageUtilities withBackgroundColor:symbolColor:size:cornerRadius:configuration:;
+ (uint64_t)sfui_systemImageNamed:()SFUIImageUtilities withBackgroundColor:symbolColor:size:cornerRadius:;
- (id)sfui_imageScaledToSize:()SFUIImageUtilities contentMode:;
@end

@implementation UIImage(SFUIImageUtilities)

+ (double)sfui_scaleSize:()SFUIImageUtilities toSize:contentMode:
{
  double v7 = a1 / a2;
  double v8 = a3 / a4;
  if (a7 == 2)
  {
    if (v7 <= v8) {
      return a3;
    }
    return a4 * v7;
  }
  if (a7 == 1 && v7 < v8) {
    return a4 * v7;
  }
  return a3;
}

- (id)sfui_imageScaledToSize:()SFUIImageUtilities contentMode:
{
  v5 = objc_opt_class();
  [a1 size];
  objc_msgSend(v5, "sfui_scaleSize:toSize:contentMode:", a3);
  double v7 = v6;
  double v9 = v8;
  [a1 size];
  if (v11 == v7 && v10 == v9)
  {
    id v23 = a1;
  }
  else
  {
    [a1 scale];
    UIRectIntegralWithScale();
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [a1 scale];
    CGFloat v22 = v21;
    v26.width = v18;
    v26.height = v20;
    UIGraphicsBeginImageContextWithOptions(v26, 0, v22);
    objc_msgSend(a1, "drawInRect:", v14, v16, v18, v20);
    UIGraphicsGetImageFromCurrentImageContext();
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  return v23;
}

+ (id)sfui_bulletImageWithSystemName:()SFUIImageUtilities color:
{
  double v6 = (void *)MEMORY[0x263F825C8];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 systemWhiteColor];
  double v10 = [MEMORY[0x263F82818] configurationWithPointSize:22.0];
  double v11 = objc_msgSend(a1, "sfui_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:", v8, v7, v9, v10, 40.0, 40.0, 10.0);

  return v11;
}

+ (uint64_t)sfui_systemImageNamed:()SFUIImageUtilities withBackgroundColor:symbolColor:size:cornerRadius:
{
  return objc_msgSend(a1, "sfui_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:", a3, a4, a5, 0);
}

+ (id)sfui_systemImageNamed:()SFUIImageUtilities withBackgroundColor:symbolColor:size:cornerRadius:configuration:
{
  id v15 = a7;
  double v16 = (void *)MEMORY[0x263F827E8];
  id v17 = a8;
  double v18 = [v16 systemImageNamed:a6 withConfiguration:a9];
  double v19 = [v18 imageWithTintColor:v17];

  if (v19)
  {
    [v19 scale];
    CGFloat v21 = v20;
    v29.width = a1;
    v29.height = a2;
    UIGraphicsBeginImageContextWithOptions(v29, 0, v21);
    [v15 setFill];
    CGFloat v22 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), a1, a2, a3);
    [v22 fill];
    [v19 size];
    CGFloat v24 = (a1 - v23) * 0.5;
    [v19 size];
    objc_msgSend(v19, "drawAtPoint:", v24, (a2 - v25) * 0.5);
    CGSize v26 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    CGSize v26 = 0;
  }

  return v26;
}

@end