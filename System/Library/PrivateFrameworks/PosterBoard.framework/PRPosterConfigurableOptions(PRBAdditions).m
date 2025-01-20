@interface PRPosterConfigurableOptions(PRBAdditions)
+ (id)pbf_configurableOptionsForPreview:()PRBAdditions;
@end

@implementation PRPosterConfigurableOptions(PRBAdditions)

+ (id)pbf_configurableOptionsForPreview:()PRBAdditions
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 titleStyleConfiguration];
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  v6 = [v4 titleColor];
  if (v6
    || ([v4 isUserConfigured] & 1) == 0
    && ([MEMORY[0x1E4F926E8] defaultTitleColor], (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v5 addObject:v6];
  }
  uint64_t v7 = [v4 timeFontConfiguration];
  v8 = (void *)v7;
  if (v7)
  {
    v16[0] = v7;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  else
  {
    v10 = [MEMORY[0x1E4F926E0] defaultConfiguration];
    v15 = v10;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  }
  id v11 = objc_alloc(MEMORY[0x1E4F92630]);
  v12 = [v3 displayNameLocalizationKey];

  [v4 contentsLuminance];
  v13 = objc_msgSend(v11, "initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:", v12, 0, v9, v5, 0);

  return v13;
}

@end