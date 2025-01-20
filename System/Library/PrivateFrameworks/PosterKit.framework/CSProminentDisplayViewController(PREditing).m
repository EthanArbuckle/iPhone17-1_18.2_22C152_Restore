@interface CSProminentDisplayViewController(PREditing)
- (uint64_t)pr_setSubtitleHidden:()PREditing;
- (void)pr_setStylingFromTitleStyleConfiguration:()PREditing withExtensionBundleURL:forRole:;
- (void)pr_setTitleColor:()PREditing timeFont:timeNumberingSystem:alternateDateEnabled:groupName:extensionBundleURL:;
@end

@implementation CSProminentDisplayViewController(PREditing)

- (void)pr_setTitleColor:()PREditing timeFont:timeNumberingSystem:alternateDateEnabled:groupName:extensionBundleURL:
{
  id v25 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  if (v25)
  {
    unsigned int v24 = a6;
    v18 = [v25 color];
    [a1 setTextColor:v18];

    uint64_t v19 = [MEMORY[0x1E4F4F8E8] vibrancyEffectTypeFromColor:v25];
    v20 = [MEMORY[0x1E4F4F8E8] vibrancyLUTFromColor:v25 extensionBundleURL:v17 luminanceReduced:0];
    char v21 = objc_opt_respondsToSelector();
    v22 = [v20 lutIdentifier];
    v23 = [v20 bundleURL];
    if (v21) {
      [a1 setAlternativeVibrancyEffectLUTIdentifier:v22 alternativeVibrancyEffectLUTBundleURL:v23 luminanceReduced:0];
    }
    else {
      [a1 setAlternativeVibrancyEffectLUTIdentifier:v22 alternativeVibrancyEffectLUTBundleURL:v23];
    }

    a6 = v24;
    if (v19 != [a1 effectType]) {
      [a1 setEffectType:v19];
    }
  }
  if (v14) {
    [a1 setBaseFont:v14];
  }
  if (v15) {
    [a1 setNumberingSystem:v15];
  }
  objc_msgSend(a1, "pr_setAlternateDateEnabled:", a6);
  [a1 setGroupName:v16];
}

- (void)pr_setStylingFromTitleStyleConfiguration:()PREditing withExtensionBundleURL:forRole:
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v25 titleContentStyle];
  [a1 setTitleContentStyle:v10];

  v11 = [v25 effectiveTitleColor];
  v12 = [v25 vibrancyConfigurationWithExtensionBundleURL:v8];
  if (v12)
  {
    v13 = [PRPosterColor alloc];
    id v14 = [v12 color];
    uint64_t v15 = [(PRPosterColor *)v13 initWithColor:v14 preferredStyle:0];

    v11 = (void *)v15;
  }
  unsigned int v24 = v9;
  uint64_t v16 = [v25 effectiveTimeFontWithExtensionBundleURL:v8 forRole:v9];
  id v17 = [v25 timeNumberingSystem];
  v18 = [v12 groupName];
  v23 = (void *)v16;
  objc_msgSend(a1, "pr_setTitleColor:timeFont:timeNumberingSystem:alternateDateEnabled:groupName:extensionBundleURL:", v11, v16, v17, objc_msgSend(v25, "isAlternateDateEnabled"), v18, v8);
  objc_msgSend(a1, "setEffectType:", objc_msgSend(v12, "effectType"));
  objc_msgSend(a1, "setBackgroundType:", objc_msgSend(v12, "backgroundType"));
  uint64_t v19 = [v12 alternativeVibrancyEffectLUT];
  char v20 = objc_opt_respondsToSelector();
  char v21 = [v19 lutIdentifier];
  v22 = [v19 bundleURL];
  if (v20) {
    [a1 setAlternativeVibrancyEffectLUTIdentifier:v21 alternativeVibrancyEffectLUTBundleURL:v22 luminanceReduced:0];
  }
  else {
    [a1 setAlternativeVibrancyEffectLUTIdentifier:v21 alternativeVibrancyEffectLUTBundleURL:v22];
  }
}

- (uint64_t)pr_setSubtitleHidden:()PREditing
{
  unint64_t v5 = [a1 elements] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v6 = 2;
  if (a3) {
    uint64_t v6 = 0;
  }
  return [a1 setElements:v5 | v6];
}

@end