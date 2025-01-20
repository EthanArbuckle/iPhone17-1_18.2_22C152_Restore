@interface UIVibrancyEffect(SafariServicesExtras)
+ (id)_sf_effectWithStyle:()SafariServicesExtras forBarTintStyle:;
@end

@implementation UIVibrancyEffect(SafariServicesExtras)

+ (id)_sf_effectWithStyle:()SafariServicesExtras forBarTintStyle:
{
  if (a4 == 5)
  {
    switch(a3)
    {
      case 0:
      case 2:
        v6 = (void *)MEMORY[0x1E4FB1EA0];
        goto LABEL_21;
      case 1:
        v6 = (void *)MEMORY[0x1E4FB1EA0];
        goto LABEL_21;
      case 3:
        v6 = (void *)MEMORY[0x1E4FB1EA0];
        goto LABEL_23;
      case 4:
        v6 = (void *)MEMORY[0x1E4FB1EA0];
        goto LABEL_23;
      case 5:
        v6 = (void *)MEMORY[0x1E4FB1EA0];
        goto LABEL_23;
      case 6:
        v6 = (void *)MEMORY[0x1E4FB1EA0];
LABEL_21:
        CAColorMatrixMakeBrightness();
        goto LABEL_24;
      case 7:
        v6 = (void *)MEMORY[0x1E4FB1EA0];
LABEL_23:
        CAColorMatrixMakeColorSourceOver();
        goto LABEL_24;
      default:
        goto LABEL_26;
    }
  }
  int v8 = _SFIsPrivateTintStyle(a4);
  if ((unint64_t)(a3 - 8) <= 0xFFFFFFFFFFFFFFF9 && v8)
  {
    if (a3 == 1)
    {
      v6 = (void *)MEMORY[0x1E4FB1EA0];
      CAColorMatrixMakeBrightness();
      long long v17 = xmmword_18C70EE40;
      long long v18 = xmmword_18C70EE50;
      long long v19 = xmmword_18C70EE60;
      long long v20 = xmmword_18C70EE70;
      long long v21 = xmmword_18C70EE80;
      CAColorMatrixConcat();
LABEL_24:
      double v10 = 1.0;
      v9 = v6;
    }
    else
    {
      if (a3) {
        goto LABEL_26;
      }
      v9 = (void *)MEMORY[0x1E4FB1EA0];
      v22[0] = xmmword_18C70EE40;
      v22[1] = xmmword_18C70EE50;
      v22[2] = xmmword_18C70EE60;
      v22[3] = xmmword_18C70EE70;
      v22[4] = xmmword_18C70EE80;
      double v10 = 1.0;
    }
    v4 = objc_msgSend(v9, "_vibrantEffectWithCAColorMatrix:alpha:", v22, v10, v17, v18, v19, v20, v21);
  }
  else
  {
    int v11 = _SFIsDarkTintStyle(a4);
    if (a3 == 2 && v11)
    {
      unint64_t v12 = _SFLightTintStyleForStyle(a4);
      v13 = (void *)MEMORY[0x1E4FB1EA0];
      v14 = _SFBackdropEffectForBarTintStyle(v12);
LABEL_13:
      uint64_t v15 = 112;
    }
    else
    {
      v13 = (void *)MEMORY[0x1E4FB1EA0];
      v14 = _SFBackdropEffectForBarTintStyle(a4);
      uint64_t v15 = 103;
      switch(a3)
      {
        case 0:
        case 2:
        case 7:
          goto LABEL_13;
        case 1:
          uint64_t v15 = 111;
          break;
        case 3:
          uint64_t v15 = 101;
          break;
        case 4:
          uint64_t v15 = 102;
          break;
        default:
          break;
      }
    }
    v4 = [v13 _effectForBlurEffect:v14 vibrancyStyle:v15];
  }
LABEL_26:

  return v4;
}

@end