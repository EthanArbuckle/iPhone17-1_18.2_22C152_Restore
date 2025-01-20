@interface UIImageSymbolConfiguration(SafariServicesExtras)
+ (id)_sf_staticConfigurationWithTextStyle:()SafariServicesExtras scale:;
+ (id)_sf_staticConfigurationWithTextStyle:()SafariServicesExtras scale:compatibleWithTraitCollection:;
@end

@implementation UIImageSymbolConfiguration(SafariServicesExtras)

+ (id)_sf_staticConfigurationWithTextStyle:()SafariServicesExtras scale:
{
  v6 = (void *)MEMORY[0x1E4FB1E20];
  uint64_t v7 = *MEMORY[0x1E4FB27D0];
  id v8 = a3;
  v9 = [v6 traitCollectionWithPreferredContentSizeCategory:v7];
  v10 = objc_msgSend(a1, "_sf_staticConfigurationWithTextStyle:scale:compatibleWithTraitCollection:", v8, a4, v9);

  return v10;
}

+ (id)_sf_staticConfigurationWithTextStyle:()SafariServicesExtras scale:compatibleWithTraitCollection:
{
  uint64_t v7 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a3 compatibleWithTraitCollection:a5];
  id v8 = [v7 fontAttributes];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB0950]];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB09F0]];
  [v10 floatValue];
  double v12 = v11;

  uint64_t v13 = MEMORY[0x192F95700](v12);
  [v7 pointSize];
  v14 = objc_msgSend(a1, "configurationWithPointSize:weight:scale:", v13, a4);

  return v14;
}

@end