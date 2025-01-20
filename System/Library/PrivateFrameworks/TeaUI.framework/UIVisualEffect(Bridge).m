@interface UIVisualEffect(Bridge)
+ (id)ts_floatingTabBarEffect;
+ (id)ts_visualEffectsForBarWithBackgroundColor:()Bridge;
+ (id)ts_visualEffectsForBlackBackgroundBarAppearance;
+ (id)ts_visualEffectsForWhiteBackgroundBarAppearance;
+ (uint64_t)ts_blurEffectWithNewBarStyle;
+ (uint64_t)ts_sideBarEffect;
+ (uint64_t)ts_sideBarSelectionEffect;
@end

@implementation UIVisualEffect(Bridge)

+ (uint64_t)ts_sideBarEffect
{
  return 0;
}

+ (uint64_t)ts_sideBarSelectionEffect
{
  return 0;
}

+ (id)ts_visualEffectsForBarWithBackgroundColor:()Bridge
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend(MEMORY[0x1E4FB1EF8], "effectCompositingColor:");
  v3[0] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  return v1;
}

+ (id)ts_visualEffectsForWhiteBackgroundBarAppearance
{
  v22[4] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v6 = 0x3FE0000000000000;
  uint64_t v7 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0x3FE0000000000000;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0x3FE0000000000000;
  long long v19 = xmmword_1B61BBB90;
  int64x2_t v20 = vdupq_n_s64(0x3FDF0A3D70A3D70AuLL);
  uint64_t v21 = 0x3FE0000000000000;
  v0 = [MEMORY[0x1E4FB1620] colorEffectMatrix:&v6];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v6 = 0x3FC3333333333333;
  uint64_t v7 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0x3FC3333333333333;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0x3FC3333333333333;
  long long v19 = xmmword_1B61BBBA0;
  int64x2_t v20 = vdupq_n_s64(0x3FEB333333333333uLL);
  uint64_t v21 = 0x3FEB333333333333;
  v1 = [MEMORY[0x1E4FB1620] colorEffectMatrix:&v6];
  v2 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:20.0];
  v22[0] = v2;
  v3 = [MEMORY[0x1E4FB1620] colorEffectSaturate:0.0];
  v22[1] = v3;
  v22[2] = v0;
  v22[3] = v1;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];

  return v4;
}

+ (id)ts_visualEffectsForBlackBackgroundBarAppearance
{
  v22[4] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v6 = 0x3FE0000000000000;
  uint64_t v7 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0x3FE0000000000000;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0x3FE0000000000000;
  int64x2_t v19 = (int64x2_t)xmmword_1B61BBB90;
  int64x2_t v20 = vdupq_n_s64(0x3FDF0A3D70A3D70AuLL);
  uint64_t v21 = 0x3FE0000000000000;
  v0 = [MEMORY[0x1E4FB1620] colorEffectMatrix:&v6];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v6 = 0x3FC3333333333333;
  uint64_t v7 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0x3FC3333333333333;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0x3FC3333333333333;
  int64x2_t v19 = vdupq_n_s64(0x3FC3333333333333uLL);
  int64x2_t v20 = v19;
  uint64_t v21 = 0x3FEB333333333333;
  v1 = [MEMORY[0x1E4FB1620] colorEffectMatrix:&v6];
  v2 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:20.0];
  v22[0] = v2;
  v3 = [MEMORY[0x1E4FB1620] colorEffectSaturate:0.0];
  v22[1] = v3;
  v22[2] = v0;
  v22[3] = v1;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];

  return v4;
}

+ (uint64_t)ts_blurEffectWithNewBarStyle
{
  return [MEMORY[0x1E4FB14C8] _effectWithStyle:1100 invertAutomaticStyle:0];
}

+ (id)ts_floatingTabBarEffect
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.25 alpha:0.06];
  v1 = [MEMORY[0x1E4FB1618] colorWithRed:0.75 green:0.75 blue:1.0 alpha:0.06];
  v2 = (void *)MEMORY[0x1E4FB1618];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__UIVisualEffect_Bridge__ts_floatingTabBarEffect__block_invoke;
  v12[3] = &unk_1E6136750;
  id v13 = v1;
  id v14 = v0;
  id v3 = v0;
  id v4 = v1;
  v5 = [v2 colorWithDynamicProvider:v12];
  uint64_t v6 = (void *)MEMORY[0x1E4FB1EF8];
  uint64_t v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
  v15[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4FB1EF8] effectCompositingColor:v5];
  v15[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v10 = [v6 effectCombiningEffects:v9];

  return v10;
}

@end