@interface UIColor(VSAdditions)
+ (id)vsa_dynamicColorWithLightStyleColor:()VSAdditions darkStyleColor:;
+ (id)vsa_opacityADarkColor;
+ (id)vsa_opacityADynamicColor;
+ (id)vsa_opacityALightColor;
+ (id)vsa_opacityBDarkColor;
+ (id)vsa_opacityBDynamicColor;
+ (id)vsa_opacityBLightColor;
+ (id)vsa_opacityCDarkColor;
+ (id)vsa_opacityCDynamicColor;
+ (id)vsa_opacityCLightColor;
+ (uint64_t)vsa_primaryBackgroundColor;
+ (uint64_t)vsa_primaryLabelColor;
+ (uint64_t)vsa_quaternaryLabelColor;
+ (uint64_t)vsa_secondaryBackgroundColor;
+ (uint64_t)vsa_secondaryLabelColor;
+ (uint64_t)vsa_tertiaryBackgroundColor;
+ (uint64_t)vsa_tertiaryLabelColor;
@end

@implementation UIColor(VSAdditions)

+ (uint64_t)vsa_primaryBackgroundColor
{
  return [MEMORY[0x263F1C550] systemBackgroundColor];
}

+ (uint64_t)vsa_secondaryBackgroundColor
{
  return [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
}

+ (uint64_t)vsa_tertiaryBackgroundColor
{
  return [MEMORY[0x263F1C550] tertiarySystemBackgroundColor];
}

+ (uint64_t)vsa_primaryLabelColor
{
  return [MEMORY[0x263F1C550] labelColor];
}

+ (uint64_t)vsa_secondaryLabelColor
{
  return [MEMORY[0x263F1C550] secondaryLabelColor];
}

+ (uint64_t)vsa_tertiaryLabelColor
{
  return [MEMORY[0x263F1C550] tertiaryLabelColor];
}

+ (uint64_t)vsa_quaternaryLabelColor
{
  return [MEMORY[0x263F1C550] quaternaryLabelColor];
}

+ (id)vsa_dynamicColorWithLightStyleColor:()VSAdditions darkStyleColor:
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F1C550];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__UIColor_VSAdditions__vsa_dynamicColorWithLightStyleColor_darkStyleColor___block_invoke;
  v12[3] = &unk_265077E98;
  id v13 = v6;
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  v10 = [v7 colorWithDynamicProvider:v12];

  return v10;
}

+ (id)vsa_opacityADarkColor
{
  if (vsa_opacityADarkColor___once != -1) {
    dispatch_once(&vsa_opacityADarkColor___once, &__block_literal_global_22);
  }
  v0 = (void *)vsa_opacityADarkColor___color;
  return v0;
}

+ (id)vsa_opacityALightColor
{
  if (vsa_opacityALightColor___once != -1) {
    dispatch_once(&vsa_opacityALightColor___once, &__block_literal_global_3);
  }
  v0 = (void *)vsa_opacityALightColor___color;
  return v0;
}

+ (id)vsa_opacityADynamicColor
{
  v2 = objc_msgSend(a1, "vsa_opacityALightColor");
  v3 = objc_msgSend(a1, "vsa_opacityADarkColor");
  v4 = objc_msgSend(a1, "vsa_dynamicColorWithLightStyleColor:darkStyleColor:", v2, v3);

  return v4;
}

+ (id)vsa_opacityBDarkColor
{
  if (vsa_opacityBDarkColor___once != -1) {
    dispatch_once(&vsa_opacityBDarkColor___once, &__block_literal_global_5);
  }
  v0 = (void *)vsa_opacityBDarkColor___color;
  return v0;
}

+ (id)vsa_opacityBLightColor
{
  if (vsa_opacityBLightColor___once != -1) {
    dispatch_once(&vsa_opacityBLightColor___once, &__block_literal_global_7);
  }
  v0 = (void *)vsa_opacityBLightColor___color;
  return v0;
}

+ (id)vsa_opacityBDynamicColor
{
  v2 = objc_msgSend(a1, "vsa_opacityBLightColor");
  v3 = objc_msgSend(a1, "vsa_opacityBDarkColor");
  v4 = objc_msgSend(a1, "vsa_dynamicColorWithLightStyleColor:darkStyleColor:", v2, v3);

  return v4;
}

+ (id)vsa_opacityCDarkColor
{
  if (vsa_opacityCDarkColor___once != -1) {
    dispatch_once(&vsa_opacityCDarkColor___once, &__block_literal_global_9_0);
  }
  v0 = (void *)vsa_opacityCDarkColor___color;
  return v0;
}

+ (id)vsa_opacityCLightColor
{
  if (vsa_opacityCLightColor___once[0] != -1) {
    dispatch_once(vsa_opacityCLightColor___once, &__block_literal_global_11);
  }
  v0 = (void *)vsa_opacityCLightColor___color;
  return v0;
}

+ (id)vsa_opacityCDynamicColor
{
  v2 = objc_msgSend(a1, "vsa_opacityCLightColor");
  v3 = objc_msgSend(a1, "vsa_opacityCDarkColor");
  v4 = objc_msgSend(a1, "vsa_dynamicColorWithLightStyleColor:darkStyleColor:", v2, v3);

  return v4;
}

@end