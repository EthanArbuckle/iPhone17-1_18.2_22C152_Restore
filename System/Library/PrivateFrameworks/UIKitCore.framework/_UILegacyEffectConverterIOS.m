@interface _UILegacyEffectConverterIOS
- (id)backdropSettingsForBlurStyle:(int64_t)a3;
- (id)vibrancyConfigForHighQualityVibrancyStyle:(int64_t)a3;
- (id)vibrancyConfigForLowQualityVibrancyStyle:(int64_t)a3;
@end

@implementation _UILegacyEffectConverterIOS

- (id)backdropSettingsForBlurStyle:(int64_t)a3
{
  uint64_t v3 = -2;
  uint64_t v4 = 3901;
  uint64_t v5 = 3902;
  if (a3 != 502) {
    uint64_t v5 = -2;
  }
  if (a3 != 501) {
    uint64_t v4 = v5;
  }
  uint64_t v6 = 2050;
  uint64_t v7 = 2080;
  if (a3 != 100) {
    uint64_t v7 = -2;
  }
  if (a3 != 99) {
    uint64_t v6 = v7;
  }
  if (a3 <= 500) {
    uint64_t v4 = v6;
  }
  if (a3 == 1) {
    uint64_t v3 = 2020;
  }
  if (!a3) {
    uint64_t v3 = 2010;
  }
  if ((unint64_t)(a3 - 2) < 2) {
    uint64_t v3 = 2030;
  }
  if (a3 <= 98) {
    uint64_t v8 = v3;
  }
  else {
    uint64_t v8 = v4;
  }
  return +[_UIBackdropViewSettings settingsForPrivateStyle:v8];
}

- (id)vibrancyConfigForHighQualityVibrancyStyle:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v3 = +[UIColor _vibrantLightDividerBurnColor];
    uint64_t v6 = +[UIColor _vibrantLightDividerDarkeningColor];
LABEL_7:
    uint64_t v4 = (void *)v6;
    uint64_t v5 = (id *)MEMORY[0x1E4F3A368];
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    uint64_t v3 = +[UIColor _vibrantLightFillBurnColor];
    uint64_t v6 = +[UIColor _vibrantLightFillDarkeningColor];
    goto LABEL_7;
  }
  if (a3 != 2)
  {
    uint64_t v3 = 0;
    id v7 = 0;
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  uint64_t v3 = +[UIColor _vibrantDarkFillDodgeColor];
  uint64_t v4 = +[UIColor colorWithWhite:0.0 alpha:0.0];
  uint64_t v5 = (id *)MEMORY[0x1E4F3A360];
LABEL_8:
  id v7 = *v5;
  if (v7)
  {
    uint64_t v8 = +[_UIVisualEffectVibrantLayerConfig layerWithVibrantColor:v3 tintColor:v4 filterType:v7 filterAttributes:0];
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v8 = 0;
LABEL_12:
  v9 = +[_UIVisualEffectConfig configWithContentConfig:v8];

  return v9;
}

- (id)vibrancyConfigForLowQualityVibrancyStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      double v4 = 0.45;
LABEL_7:
      uint64_t v3 = +[UIColor colorWithRed:0.0352941176 green:0.0784313725 blue:0.121568627 alpha:v4];
      goto LABEL_8;
    case 1:
      double v4 = 0.6;
      goto LABEL_7;
    case 2:
      uint64_t v3 = +[UIColor colorWithWhite:1.0 alpha:0.65];
LABEL_8:
      uint64_t v5 = (void *)v3;
      goto LABEL_10;
  }
  uint64_t v5 = 0;
LABEL_10:
  uint64_t v6 = +[_UIVisualEffectTintLayerConfig layerWithTintColor:v5];
  id v7 = +[_UIVisualEffectConfig configWithContentConfig:v6];

  return v7;
}

@end