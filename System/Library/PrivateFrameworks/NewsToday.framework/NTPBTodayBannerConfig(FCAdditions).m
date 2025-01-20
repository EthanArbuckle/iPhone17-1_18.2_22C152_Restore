@interface NTPBTodayBannerConfig(FCAdditions)
+ (id)bannerConfigWithJSONDictionary:()FCAdditions;
@end

@implementation NTPBTodayBannerConfig(FCAdditions)

+ (id)bannerConfigWithJSONDictionary:()FCAdditions
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59000]];
  [v4 setIdentifier:v5];

  v6 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59038]];
  [v4 setTitle:v6];

  v7 = [v3 objectForKeyedSubscript:*MEMORY[0x263F58FE0]];
  [v4 setBody:v7];

  v8 = [v3 objectForKeyedSubscript:*MEMORY[0x263F58FC0]];
  [v4 setActionURL:v8];

  v9 = [v3 objectForKeyedSubscript:*MEMORY[0x263F58FB8]];
  [v4 setActionButtonText:v9];

  v10 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59008]];
  objc_msgSend(v4, "setImageMethod:", objc_msgSend(v10, "intValue"));

  v11 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59010]];
  [v4 setImageURL:v11];

  v12 = [v3 objectForKeyedSubscript:*MEMORY[0x263F58FD8]];
  objc_msgSend(v4, "setBackgroundMethod:", objc_msgSend(v12, "intValue"));

  v13 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59030]];
  v14 = ColorPairWithJSONDictionary(v13);
  [v4 setSolidBackgroundColorPair:v14];

  v15 = [v3 objectForKeyedSubscript:*MEMORY[0x263F58FF8]];
  v16 = ColorGradientPairWithJSONDictionary(v15);
  [v4 setGradientBackgroundPair:v16];

  v17 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59020]];
  objc_msgSend(v4, "setNumberOfAppearancesToHide:", (int)objc_msgSend(v17, "intValue"));

  v18 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59028]];
  objc_msgSend(v4, "setNumberOfTapsToHide:", (int)objc_msgSend(v18, "intValue"));

  v19 = [v3 objectForKeyedSubscript:*MEMORY[0x263F58FF0]];
  objc_msgSend(v4, "setDaysVisibleToNewSubscribers:", (int)objc_msgSend(v19, "intValue"));

  uint64_t v20 = *MEMORY[0x263F59018];
  v21 = [v3 objectForKeyedSubscript:*MEMORY[0x263F59018]];

  if (v21)
  {
    v22 = [v3 objectForKeyedSubscript:v20];
    objc_msgSend(v4, "setIsEnabled:", objc_msgSend(v22, "BOOLValue"));
  }

  return v4;
}

@end