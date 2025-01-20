@interface _UILegacyEffectConverterTVOS
- (id)backdropSettingsForBlurStyle:(int64_t)a3;
- (id)vibrancyConfigForHighQualityVibrancyStyle:(int64_t)a3;
- (id)vibrancyConfigForLowQualityVibrancyStyle:(int64_t)a3;
- (id)vibrancyConfigForReducedTransperancyVibrancyStyle:(int64_t)a3;
@end

@implementation _UILegacyEffectConverterTVOS

- (id)backdropSettingsForBlurStyle:(int64_t)a3
{
  int64_t v3 = -2;
  if (a3 <= 500)
  {
    switch(a3)
    {
      case 0:
LABEL_5:
        a3 = 4003;
        break;
      case 1:
LABEL_15:
        a3 = 4001;
        break;
      case 2:
LABEL_16:
        a3 = 4006;
        break;
      case 3:
LABEL_17:
        a3 = 4008;
        break;
      default:
        int64_t v4 = 2050;
        if (a3 == 100) {
          int64_t v3 = 2080;
        }
        BOOL v5 = a3 == 99;
LABEL_12:
        if (v5) {
          a3 = v4;
        }
        else {
          a3 = v3;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 4000:
      case 4012:
        a3 = 4000;
        break;
      case 4001:
        goto LABEL_15;
      case 4002:
      case 4004:
      case 4007:
      case 4009:
      case 4010:
      case 4011:
        return +[_UIBackdropViewSettings settingsForPrivateStyle:a3];
      case 4003:
        goto LABEL_5;
      case 4005:
      case 4013:
      case 4016:
        a3 = 4005;
        break;
      case 4006:
        goto LABEL_16;
      case 4008:
        goto LABEL_17;
      case 4014:
        a3 = 4012;
        break;
      case 4015:
        a3 = 4013;
        break;
      case 4017:
        a3 = 4014;
        break;
      case 4018:
        a3 = 4015;
        break;
      default:
        int64_t v4 = 3901;
        if (a3 == 502) {
          int64_t v3 = 3902;
        }
        BOOL v5 = a3 == 501;
        goto LABEL_12;
    }
  }
  return +[_UIBackdropViewSettings settingsForPrivateStyle:a3];
}

- (id)vibrancyConfigForHighQualityVibrancyStyle:(int64_t)a3
{
  id v3 = 0;
  switch(a3)
  {
    case 4000:
    case 4001:
    case 4002:
    case 4003:
    case 4004:
    case 4014:
      goto LABEL_7;
    case 4005:
    case 4006:
    case 4007:
    case 4008:
    case 4009:
    case 4010:
    case 4011:
    case 4015:
      goto LABEL_2;
    case 4012:
      v7 = +[UIColor colorWithWhite:0.156862745 alpha:0.3];
      id v3 = +[_UIVisualEffectLayerConfig layerWithFillColor:v7 opacity:*MEMORY[0x1E4F3A2E8] filterType:1.0];

      goto LABEL_7;
    case 4013:
      v12 = +[UIColor colorWithWhite:0.156862745 alpha:0.3];
      id v3 = +[_UIVisualEffectLayerConfig layerWithFillColor:v12 opacity:*MEMORY[0x1E4F3A2E8] filterType:1.0];

      goto LABEL_2;
    case 4016:
      v10 = [(_UILegacyEffectConverterTVOS *)self vibrancyConfigForLowQualityVibrancyStyle:4016];
      goto LABEL_12;
    default:
      if ((unint64_t)a3 < 2)
      {
LABEL_7:
        int64_t v4 = +[UIColor colorWithRed:0.666666667 green:0.666666667 blue:0.666666667 alpha:1.0];
        BOOL v5 = (id *)MEMORY[0x1E4F3A2E0];
      }
      else
      {
        v6 = 0;
        int64_t v4 = 0;
        if ((unint64_t)(a3 - 2) >= 2) {
          goto LABEL_9;
        }
LABEL_2:
        int64_t v4 = +[UIColor colorWithRed:0.274509804 green:0.274509804 blue:0.274509804 alpha:1.0];
        BOOL v5 = (id *)MEMORY[0x1E4F3A2E8];
      }
      v6 = v3;
      id v3 = *v5;
LABEL_9:
      v8 = +[_UIVisualEffectTintLayerConfig layerWithTintColor:v4 filterType:v3];
      v9 = +[_UIVisualEffectConfig configWithContentConfig:v8];
      v10 = v9;
      if (v6) {
        [v9 addLayerConfig:v6];
      }

LABEL_12:
      return v10;
  }
}

- (id)vibrancyConfigForLowQualityVibrancyStyle:(int64_t)a3
{
  id v3 = 0;
  if (a3 > 3999)
  {
    switch(a3)
    {
      case 4000:
      case 4001:
      case 4002:
      case 4004:
      case 4014:
        goto LABEL_3;
      case 4003:
        goto LABEL_8;
      case 4005:
      case 4006:
      case 4007:
      case 4008:
      case 4009:
      case 4010:
      case 4011:
      case 4015:
        goto LABEL_11;
      case 4012:
        id v3 = +[UIColor colorWithWhite:1.0 alpha:0.2];
        goto LABEL_3;
      case 4013:
        id v3 = +[UIColor colorWithWhite:1.0 alpha:0.2];
        goto LABEL_11;
      case 4016:
        id v3 = +[UIColor colorWithWhite:1.0 alpha:0.2];
        uint64_t v4 = +[UIColor whiteColor];
        goto LABEL_12;
      default:
        BOOL v5 = 0;
        break;
    }
    goto LABEL_13;
  }
  if ((unint64_t)(a3 - 2) < 2)
  {
LABEL_11:
    uint64_t v4 = +[UIColor colorWithWhite:1.0 alpha:0.65];
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_8:
    BOOL v5 = +[UIColor colorWithRed:0.0352941176 green:0.0784313725 blue:0.121568627 alpha:0.45];
    id v3 = 0;
    goto LABEL_13;
  }
  BOOL v5 = 0;
  if (a3 == 1)
  {
LABEL_3:
    uint64_t v4 = +[UIColor colorWithRed:0.0352941176 green:0.0784313725 blue:0.121568627 alpha:0.6];
LABEL_12:
    BOOL v5 = (void *)v4;
  }
LABEL_13:
  v6 = +[_UIVisualEffectTintLayerConfig layerWithTintColor:v5];
  v7 = +[_UIVisualEffectConfig configWithContentConfig:v6];

  if (v3)
  {
    v8 = +[_UIVisualEffectLayerConfig layerWithFillColor:v3 opacity:0 filterType:1.0];
    [v7 addLayerConfig:v8];
  }
  return v7;
}

- (id)vibrancyConfigForReducedTransperancyVibrancyStyle:(int64_t)a3
{
  id v3 = 0;
  uint64_t v4 = 0;
  switch(a3)
  {
    case 4000:
      goto LABEL_31;
    case 4001:
    case 4014:
LABEL_6:
      double v5 = 0.368627451;
      double v6 = 0.396078431;
      double v7 = 0.411764706;
      goto LABEL_13;
    case 4002:
      double v5 = 0.4;
      double v6 = 0.431372549;
      double v7 = 0.447058824;
      goto LABEL_13;
    case 4003:
LABEL_5:
      double v5 = 0.490196078;
      double v6 = 0.525490196;
      double v7 = 0.545098039;
      goto LABEL_13;
    case 4004:
      double v5 = 0.235294118;
      double v6 = 0.254901961;
      double v7 = 0.262745098;
      goto LABEL_13;
    case 4005:
      goto LABEL_28;
    case 4006:
    case 4015:
LABEL_7:
      double v5 = 0.450980392;
      double v6 = 0.48627451;
      double v7 = 0.505882353;
      goto LABEL_13;
    case 4007:
      double v5 = 0.470588235;
      double v6 = 0.509803922;
      double v7 = 0.529411765;
      goto LABEL_13;
    case 4008:
LABEL_8:
      double v5 = 0.392156863;
      double v6 = 0.423529412;
      double v7 = 0.439215686;
      goto LABEL_13;
    case 4009:
      double v5 = 0.435294118;
      double v6 = 0.466666667;
      double v7 = 0.48627451;
LABEL_13:
      uint64_t v8 = +[UIColor colorWithRed:v5 green:v6 blue:v7 alpha:1.0];
      goto LABEL_14;
    case 4010:
      uint64_t v8 = +[UIColor whiteColor];
      goto LABEL_14;
    case 4011:
      uint64_t v8 = +[UIColor blackColor];
LABEL_14:
      v9 = (void *)v8;
      id v3 = 0;
      goto LABEL_15;
    case 4012:
      if (_AXSEnhanceBackgroundContrastEnabled()) {
        +[UIColor whiteColor];
      }
      else {
      id v3 = +[UIColor colorWithWhite:1.0 alpha:0.3];
      }
LABEL_31:
      v9 = +[UIColor colorWithRed:0.207843137 green:0.223529412 blue:0.231372549 alpha:1.0];
      goto LABEL_15;
    case 4013:
    case 4016:
      if (_AXSEnhanceBackgroundContrastEnabled()) {
        +[UIColor lightGrayColor];
      }
      else {
      uint64_t v4 = +[UIColor colorWithWhite:1.0 alpha:0.05];
      }
LABEL_28:
      v9 = +[UIColor colorWithRed:0.584313725 green:0.611764706 blue:0.62745098 alpha:1.0];
      id v3 = (void *)v4;
LABEL_15:
      v10 = +[_UIVisualEffectTintLayerConfig layerWithTintColor:v9];
      v11 = +[_UIVisualEffectConfig configWithContentConfig:v10];

      if (v3)
      {
        v12 = +[_UIVisualEffectLayerConfig layerWithFillColor:v3 opacity:0 filterType:1.0];
        [v11 addLayerConfig:v12];
      }
      break;
    default:
      switch(a3)
      {
        case 0:
          goto LABEL_5;
        case 1:
          goto LABEL_6;
        case 2:
          goto LABEL_7;
        case 3:
          goto LABEL_8;
        default:
          v11 = -[_UILegacyEffectConverterTVOS vibrancyConfigForLowQualityVibrancyStyle:](self, "vibrancyConfigForLowQualityVibrancyStyle:");
          break;
      }
      break;
  }
  return v11;
}

@end