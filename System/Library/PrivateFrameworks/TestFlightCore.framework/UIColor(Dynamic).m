@interface UIColor(Dynamic)
+ (id)dynamicColorWithLightColor:()Dynamic darkColor:lightHighContrastColor:darkHighContrastColor:;
+ (uint64_t)dynamicColorWithLightColor:()Dynamic darkColor:;
+ (uint64_t)dynamicColorWithLightColor:()Dynamic darkColor:darkHighContrastColor:;
+ (uint64_t)dynamicColorWithLightColor:()Dynamic darkColor:lightHighContrastColor:;
@end

@implementation UIColor(Dynamic)

+ (uint64_t)dynamicColorWithLightColor:()Dynamic darkColor:
{
  return [MEMORY[0x263F1C550] dynamicColorWithLightColor:a3 darkColor:a4 lightHighContrastColor:a3 darkHighContrastColor:a4];
}

+ (uint64_t)dynamicColorWithLightColor:()Dynamic darkColor:lightHighContrastColor:
{
  return [MEMORY[0x263F1C550] dynamicColorWithLightColor:a3 darkColor:a4 lightHighContrastColor:a5 darkHighContrastColor:a4];
}

+ (uint64_t)dynamicColorWithLightColor:()Dynamic darkColor:darkHighContrastColor:
{
  return [MEMORY[0x263F1C550] dynamicColorWithLightColor:a3 darkColor:a4 lightHighContrastColor:a3 darkHighContrastColor:a5];
}

+ (id)dynamicColorWithLightColor:()Dynamic darkColor:lightHighContrastColor:darkHighContrastColor:
{
  v32[2] = *MEMORY[0x263EF8340];
  v9 = (void *)MEMORY[0x263F1CB00];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v9 traitCollectionWithUserInterfaceStyle:1];
  v32[0] = v14;
  v15 = [MEMORY[0x263F1CB00] _traitCollectionWithContrast:1];
  v32[1] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  v17 = [v9 traitCollectionWithTraitsFromCollections:v16];

  v18 = (void *)MEMORY[0x263F1CB00];
  v19 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  v31[0] = v19;
  v20 = [MEMORY[0x263F1CB00] _traitCollectionWithContrast:1];
  v31[1] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  v22 = [v18 traitCollectionWithTraitsFromCollections:v21];

  v23 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:0];
  v29[0] = v23;
  v30[0] = v13;
  v24 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
  v29[1] = v24;
  v30[1] = v13;
  v25 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  v29[2] = v25;
  v29[3] = v17;
  v30[2] = v12;
  v30[3] = v11;
  v29[4] = v22;
  v30[4] = v10;
  v26 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:5];

  v27 = [MEMORY[0x263F1C550] _dynamicColorWithColorsByTraitCollection:v26];

  return v27;
}

@end