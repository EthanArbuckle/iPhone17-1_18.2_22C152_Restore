@interface BSUIVibrancyConfiguration(PUIStylePrivate)
+ (id)pui_vibrancyLUTFromColor:()PUIStylePrivate extensionBundleURL:;
+ (id)pui_vibrancyLUTFromColor:()PUIStylePrivate extensionBundleURL:luminanceReduced:;
+ (id)pui_vibrancyLUTFromPrivateStyle:()PUIStylePrivate extensionBundleURL:luminanceReduced:;
+ (uint64_t)pui_vibrancyEffectTypeFromColor:()PUIStylePrivate;
@end

@implementation BSUIVibrancyConfiguration(PUIStylePrivate)

+ (uint64_t)pui_vibrancyEffectTypeFromColor:()PUIStylePrivate
{
  id v3 = a3;
  if ([v3 isVibrantMaterialColor])
  {
    uint64_t v4 = 0;
  }
  else if ([v3 isVibrantMonochromeColor])
  {
    uint64_t v4 = 2;
  }
  else if ([v3 isLUTBackedColor])
  {
    uint64_t v4 = 3;
  }
  else
  {
    v5 = [v3 color];
    uint64_t v4 = v5 != 0;
  }
  return v4;
}

+ (id)pui_vibrancyLUTFromColor:()PUIStylePrivate extensionBundleURL:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isLUTBackedColor])
  {
    id v7 = objc_alloc(MEMORY[0x263F29D70]);
    v8 = [v5 lutIdentifier];
    v9 = (void *)[v7 initWithIdentifier:v8 bundleURL:v6];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)pui_vibrancyLUTFromColor:()PUIStylePrivate extensionBundleURL:luminanceReduced:
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 isLUTBackedColor];
  v10 = 0;
  if (v8 && v9)
  {
    id v11 = objc_alloc(MEMORY[0x263F29D70]);
    v12 = [v7 lutIdentifier];
    v13 = (void *)[v11 initWithIdentifier:v12 bundleURL:v8];

    v10 = (void *)[v13 copyWithLuminanceReduced:a5];
  }

  return v10;
}

+ (id)pui_vibrancyLUTFromPrivateStyle:()PUIStylePrivate extensionBundleURL:luminanceReduced:
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 lutIdentifier];

  v10 = 0;
  if (v8 && v9)
  {
    id v11 = objc_alloc(MEMORY[0x263F29D70]);
    v12 = [v7 lutIdentifier];
    v13 = (void *)[v11 initWithIdentifier:v12 bundleURL:v8];

    v10 = (void *)[v13 copyWithLuminanceReduced:a5];
  }

  return v10;
}

@end