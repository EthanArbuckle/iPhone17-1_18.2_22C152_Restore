@interface NSREContentFormatter
+ (id)_countdownTextProviderWithDate:(id)a3;
+ (id)solarContentForEvent:(id)a3;
@end

@implementation NSREContentFormatter

+ (id)solarContentForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 1)
  {
    v6 = @"Sunset";
    v7 = NSRELocalizedString(@"SUNSET_VOICEOVER_TITLE");
    v8 = @"SUNSET_TITLE";
    goto LABEL_5;
  }
  if (!v5)
  {
    v6 = @"Sunrise";
    v7 = NSRELocalizedString(@"SUNRISE_VOICEOVER_TITLE");
    v8 = @"SUNRISE_TITLE";
LABEL_5:
    v9 = NSRELocalizedString(v8);
    v10 = NSRELocalizedImageNamed(v6);
    goto LABEL_7;
  }
  v10 = 0;
  v9 = 0;
  v7 = 0;
LABEL_7:
  v11 = [v4 date];
  v12 = [MEMORY[0x263EFD228] textProviderWithDate:v11];
  v13 = [MEMORY[0x263EFD208] textProviderWithText:v9];
  [v13 setAccessibilityLabel:v7];
  v14 = [a1 _countdownTextProviderWithDate:v11];
  id v15 = objc_alloc_init(MEMORY[0x263F62D40]);
  [v15 setHeaderTextProvider:v12];
  [v15 setDescription1TextProvider:v13];
  [v15 setDescription2TextProvider:v14];
  [v15 setDescription2FontStyle:3];
  [v15 setOverrideBodyImage:v10];
  [v15 setStyle:3];

  return v15;
}

+ (id)_countdownTextProviderWithDate:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF910] date];
  if ((unint64_t)([v3 compare:v4] + 1) > 1)
  {
    v7 = [MEMORY[0x263EFD1E8] textProviderWithDate:v3 style:0 units:96];
    [v7 setShrinkUnitsInCJK:1];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263EFD208];
    v6 = NSRELocalizedString(@"SUNRISE_SUNSET_NOW");
    v7 = [v5 textProviderWithText:v6];
  }

  return v7;
}

@end