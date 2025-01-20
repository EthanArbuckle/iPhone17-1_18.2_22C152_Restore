@interface UIImageSymbolConfiguration(TelephonyUI)
+ (id)hierarchicalTpConfigurationWithStaticTextStyle:()TelephonyUI scale:color:;
+ (id)paletteTpConfigurationWithStaticTextStyle:()TelephonyUI scale:colors:;
+ (id)tpConfigurationWithStaticTextStyle:()TelephonyUI scale:;
+ (id)tpConfigurationWithStaticTextStyle:()TelephonyUI scale:symbolWeight:;
@end

@implementation UIImageSymbolConfiguration(TelephonyUI)

+ (id)tpConfigurationWithStaticTextStyle:()TelephonyUI scale:
{
  v6 = (void *)MEMORY[0x1E4FB08E8];
  v7 = (void *)MEMORY[0x1E4FB1E20];
  uint64_t v8 = *MEMORY[0x1E4FB27D8];
  id v9 = a3;
  v10 = [v7 traitCollectionWithPreferredContentSizeCategory:v8];
  v11 = [v6 preferredFontDescriptorWithTextStyle:v9 compatibleWithTraitCollection:v10];

  v12 = [v11 fontAttributes];
  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4FB0950]];
  v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4FB09F0]];
  [v14 floatValue];
  double v16 = v15;

  uint64_t v17 = MEMORY[0x1C876DD70](v16);
  [v11 pointSize];
  v18 = objc_msgSend(a1, "configurationWithPointSize:weight:scale:", v17, a4);

  return v18;
}

+ (id)hierarchicalTpConfigurationWithStaticTextStyle:()TelephonyUI scale:color:
{
  uint64_t v8 = (void *)MEMORY[0x1E4FB08E8];
  id v9 = (void *)MEMORY[0x1E4FB1E20];
  uint64_t v10 = *MEMORY[0x1E4FB27D8];
  id v11 = a5;
  id v12 = a3;
  v13 = [v9 traitCollectionWithPreferredContentSizeCategory:v10];
  v14 = [v8 preferredFontDescriptorWithTextStyle:v12 compatibleWithTraitCollection:v13];

  float v15 = [v14 fontAttributes];
  double v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4FB0950]];
  uint64_t v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4FB09F0]];
  [v17 floatValue];
  double v19 = v18;

  uint64_t v20 = MEMORY[0x1C876DD70](v19);
  [v14 pointSize];
  v21 = objc_msgSend(a1, "configurationWithPointSize:weight:scale:", v20, a4);
  v22 = [MEMORY[0x1E4FB1830] configurationWithHierarchicalColor:v11];

  v23 = [v22 configurationByApplyingConfiguration:v21];

  return v23;
}

+ (id)paletteTpConfigurationWithStaticTextStyle:()TelephonyUI scale:colors:
{
  v7 = (void *)MEMORY[0x1E4FB08E8];
  uint64_t v8 = *MEMORY[0x1E4FB2988];
  id v9 = (void *)MEMORY[0x1E4FB1E20];
  uint64_t v10 = *MEMORY[0x1E4FB27D8];
  id v11 = a5;
  id v12 = [v9 traitCollectionWithPreferredContentSizeCategory:v10];
  v13 = [v7 preferredFontDescriptorWithTextStyle:v8 compatibleWithTraitCollection:v12];

  v14 = [v13 fontAttributes];
  float v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4FB0950]];
  double v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4FB09F0]];
  [v16 floatValue];
  double v18 = v17;

  uint64_t v19 = MEMORY[0x1C876DD70](v18);
  [v13 pointSize];
  uint64_t v20 = objc_msgSend(a1, "configurationWithPointSize:weight:scale:", v19, a4);
  v21 = [MEMORY[0x1E4FB1830] configurationWithPaletteColors:v11];

  v22 = [v21 configurationByApplyingConfiguration:v20];

  return v22;
}

+ (id)tpConfigurationWithStaticTextStyle:()TelephonyUI scale:symbolWeight:
{
  uint64_t v8 = (void *)MEMORY[0x1E4FB08E8];
  id v9 = (void *)MEMORY[0x1E4FB1E20];
  uint64_t v10 = *MEMORY[0x1E4FB27D8];
  id v11 = a3;
  id v12 = [v9 traitCollectionWithPreferredContentSizeCategory:v10];
  v13 = [v8 preferredFontDescriptorWithTextStyle:v11 compatibleWithTraitCollection:v12];

  [v13 pointSize];
  v14 = objc_msgSend(a1, "configurationWithPointSize:weight:scale:", a5, a4);

  return v14;
}

@end