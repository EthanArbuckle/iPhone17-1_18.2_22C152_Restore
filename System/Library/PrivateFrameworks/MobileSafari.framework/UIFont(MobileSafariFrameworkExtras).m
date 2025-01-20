@interface UIFont(MobileSafariFrameworkExtras)
+ (id)_sf_highLegibilityAlternateFont:()MobileSafariFrameworkExtras;
+ (id)_sf_preferredFontForTextStyle:()MobileSafariFrameworkExtras attributes:;
+ (id)_sf_preferredFontForTextStyle:()MobileSafariFrameworkExtras symbolicTraits:;
+ (id)_sf_preferredFontForTextStyle:()MobileSafariFrameworkExtras weight:compatibleWithTraitCollection:;
+ (id)_sf_roundedSystemFontOfSize:()MobileSafariFrameworkExtras weight:;
+ (id)safari_fontDescriptorWithMonospacedDigitAttributes:()MobileSafariFrameworkExtras;
+ (id)safari_monospacedDigitFontForTextStyle:()MobileSafariFrameworkExtras;
+ (id)safari_monospacedDigitFontForTextStyle:()MobileSafariFrameworkExtras weight:;
- (id)_sf_fontByAddingAttributes:()MobileSafariFrameworkExtras;
@end

@implementation UIFont(MobileSafariFrameworkExtras)

+ (id)safari_monospacedDigitFontForTextStyle:()MobileSafariFrameworkExtras
{
  v2 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:");
  v3 = objc_msgSend(a1, "safari_fontDescriptorWithMonospacedDigitAttributes:", v2);

  v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];

  return v4;
}

+ (id)safari_monospacedDigitFontForTextStyle:()MobileSafariFrameworkExtras weight:
{
  v2 = objc_msgSend(MEMORY[0x1E4FB08E8], "_preferredFontDescriptorWithTextStyle:weight:");
  v3 = objc_msgSend(a1, "safari_fontDescriptorWithMonospacedDigitAttributes:", v2);

  v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];

  return v4;
}

+ (id)safari_fontDescriptorWithMonospacedDigitAttributes:()MobileSafariFrameworkExtras
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = *MEMORY[0x1E4FB0910];
  uint64_t v3 = *MEMORY[0x1E4FB0960];
  uint64_t v11 = *MEMORY[0x1E4FB0968];
  uint64_t v12 = v3;
  v13 = &unk_1EDA42540;
  v14 = &unk_1EDA42558;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:&v13 forKeys:&v11 count:2];
  v15 = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v15, 1, v11, v12, v13, v14);
  v17[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v9 = [v5 fontDescriptorByAddingAttributes:v8];

  return v9;
}

+ (id)_sf_preferredFontForTextStyle:()MobileSafariFrameworkExtras symbolicTraits:
{
  id v5 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:");
  v6 = objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v5, "symbolicTraits") | a4);

  v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v6 size:0.0];

  return v7;
}

+ (id)_sf_preferredFontForTextStyle:()MobileSafariFrameworkExtras attributes:
{
  id v5 = (void *)MEMORY[0x1E4FB08E8];
  id v6 = a4;
  v7 = [v5 preferredFontDescriptorWithTextStyle:a3];
  v8 = [v7 fontDescriptorByAddingAttributes:v6];

  v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];

  return v9;
}

+ (id)_sf_preferredFontForTextStyle:()MobileSafariFrameworkExtras weight:compatibleWithTraitCollection:
{
  id v5 = (void *)MEMORY[0x1E4FB17A8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 metricsForTextStyle:v7];
  v9 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v7 compatibleWithTraitCollection:v6];

  v10 = (void *)MEMORY[0x1E4FB08E0];
  [v9 pointSize];
  uint64_t v11 = objc_msgSend(v10, "systemFontOfSize:weight:");
  uint64_t v12 = [v8 scaledFontForFont:v11 compatibleWithTraitCollection:v6];

  return v12;
}

+ (id)_sf_roundedSystemFontOfSize:()MobileSafariFrameworkExtras weight:
{
  double v4 = (double)a4;
  id v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:(double)a4 weight:a1];
  id v6 = [v5 fontDescriptor];
  id v7 = [v6 fontDescriptorWithDesign:*MEMORY[0x1E4FB0938]];

  v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:v4];

  return v8;
}

+ (id)_sf_highLegibilityAlternateFont:()MobileSafariFrameworkExtras
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4FB0960];
  v17[0] = *MEMORY[0x1E4FB0968];
  v17[1] = v4;
  v18[0] = &unk_1EDA42570;
  v18[1] = &unk_1EDA42588;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v6 = [v3 fontDescriptor];
  uint64_t v7 = *MEMORY[0x1E4FB0910];
  v14 = v5;
  uint64_t v15 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  uint64_t v16 = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v10 = [v6 fontDescriptorByAddingAttributes:v9];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4FB08E0];
    [v3 pointSize];
    uint64_t v12 = objc_msgSend(v11, "fontWithDescriptor:size:", v10);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)_sf_fontByAddingAttributes:()MobileSafariFrameworkExtras
{
  id v4 = a3;
  id v5 = [a1 fontDescriptor];
  id v6 = [v5 fontDescriptorByAddingAttributes:v4];

  uint64_t v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v6 size:0.0];

  return v7;
}

@end