@interface UIColor(NUAdditions)
+ (id)arrayOfColors;
+ (id)nu_dynamicColor:()NUAdditions withDarkStyleVariant:;
+ (id)nu_safeColorForIdentifier:()NUAdditions;
@end

@implementation UIColor(NUAdditions)

+ (id)nu_safeColorForIdentifier:()NUAdditions
{
  id v4 = a3;
  v5 = [a1 arrayOfColors];
  unint64_t v6 = [v4 hash];

  v7 = objc_msgSend(v5, "objectAtIndex:", v6 % objc_msgSend(v5, "count"));

  return v7;
}

+ (id)arrayOfColors
{
  v26[8] = *MEMORY[0x263EF8340];
  v16 = [MEMORY[0x263F1C550] systemBlueColor];
  v17 = [MEMORY[0x263F1C550] systemPurpleColor];
  double v24 = 0.0;
  double v25 = 0.0;
  double v22 = 0.0;
  double v23 = 0.0;
  [v17 getRed:&v25 green:&v24 blue:&v23 alpha:&v22];
  double v20 = 0.0;
  double v21 = 0.0;
  double v18 = 0.0;
  double v19 = 0.0;
  [v16 getRed:&v21 green:&v20 blue:&v19 alpha:&v18];
  v15 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.678431373 blue:0.0 alpha:1.0];
  v26[0] = v15;
  v14 = [MEMORY[0x263F1C550] colorWithRed:0.992156863 green:0.466666667 blue:0.156862745 alpha:1.0];
  v26[1] = v14;
  v0 = (void *)MEMORY[0x263F1C550];
  v13 = [MEMORY[0x263F1C550] colorWithRed:0.411764706 green:0.337254902 blue:0.701960784 alpha:1.0];
  v1 = [MEMORY[0x263F1C550] colorWithRed:v25 green:v24 blue:v23 alpha:v22];
  v2 = objc_msgSend(v0, "nu_dynamicColor:withDarkStyleVariant:", v13, v1);
  v26[2] = v2;
  v3 = [MEMORY[0x263F1C550] colorWithRed:0.764705882 green:0.384313725 blue:0.874509804 alpha:1.0];
  v26[3] = v3;
  id v4 = [MEMORY[0x263F1C550] colorWithRed:0.360784314 green:0.752941176 blue:0.549019608 alpha:1.0];
  v26[4] = v4;
  v5 = [MEMORY[0x263F1C550] colorWithRed:0.0274509804 green:0.709803922 blue:0.796078431 alpha:1.0];
  v26[5] = v5;
  unint64_t v6 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  v26[6] = v6;
  v7 = (void *)MEMORY[0x263F1C550];
  v8 = [MEMORY[0x263F1C550] colorWithRed:0.149019608 green:0.28627451 blue:0.549019608 alpha:1.0];
  v9 = [MEMORY[0x263F1C550] colorWithRed:v21 green:v20 blue:v19 alpha:v18];
  v10 = objc_msgSend(v7, "nu_dynamicColor:withDarkStyleVariant:", v8, v9);
  v26[7] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:8];

  return v11;
}

+ (id)nu_dynamicColor:()NUAdditions withDarkStyleVariant:
{
  v14[2] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F1CB00];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 traitCollectionWithUserInterfaceStyle:0];
  v9 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  v13[0] = v8;
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v6;
  v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v11 = [MEMORY[0x263F1C550] _dynamicColorWithColorsByTraitCollection:v10];

  return v11;
}

@end