@interface TPUIConfiguration
+ (double)defaultHeight;
+ (id)defaultFont;
+ (unint64_t)inCallBottomBarSpacing;
+ (unint64_t)pipStatusBarPadding;
+ (unint64_t)screenSize;
@end

@implementation TPUIConfiguration

+ (id)defaultFont
{
  if (defaultFont_onceToken != -1) {
    dispatch_once(&defaultFont_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)MEMORY[0x1E4FB08E0];
  double v3 = *(double *)&defaultFont_defaultFontSize;
  double v4 = *MEMORY[0x1E4FB09D8];
  return (id)[v2 systemFontOfSize:v3 weight:v4];
}

void __32__TPUIConfiguration_defaultFont__block_invoke()
{
  v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v1 = [v0 currentMode];
  [v1 size];
  int v3 = (int)v2;

  BOOL v4 = v3 > 2207 || v3 == 1334;
  double v5 = 13.0;
  if (v4) {
    double v5 = 16.0;
  }
  defaultFont_defaultFontSize = *(void *)&v5;
}

+ (unint64_t)screenSize
{
  if (screenSize_onceToken != -1) {
    dispatch_once(&screenSize_onceToken, &__block_literal_global_7);
  }
  return screenSize_screenSize;
}

void __31__TPUIConfiguration_screenSize__block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F39B60] mainDisplay];
  [v0 bounds];
  double v2 = v1;
  double v4 = v3;

  if (v2 >= v4) {
    double v5 = v2;
  }
  else {
    double v5 = v4;
  }
  int v6 = (int)v5;
  uint64_t v7 = MGGetProductType();
  if (v6 == 1136)
  {
LABEL_5:
    uint64_t v8 = 0;
LABEL_47:
    screenSize_screenSize = v8;
    goto LABEL_48;
  }
  if (v7 <= 2795618602)
  {
    if (v7 > 851437780)
    {
      if (v7 <= 2688879998)
      {
        if (v7 != 851437781)
        {
          if (v7 != 1169082144) {
            goto LABEL_23;
          }
          goto LABEL_42;
        }
LABEL_32:
        BOOL v10 = v6 == 2556;
        goto LABEL_45;
      }
      if (v7 != 2688879999)
      {
        if (v7 != 2793418701) {
          goto LABEL_23;
        }
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    if (v7 == 133314240) {
      goto LABEL_32;
    }
    if (v7 != 330877086)
    {
      uint64_t v9 = 574536383;
LABEL_22:
      if (v7 != v9) {
        goto LABEL_23;
      }
LABEL_33:
      BOOL v11 = v6 == 2796;
      goto LABEL_34;
    }
    BOOL v11 = v6 == 2868;
LABEL_34:
    uint64_t v8 = 14;
    if (!v11) {
      uint64_t v8 = 15;
    }
    goto LABEL_47;
  }
  if (v7 <= 3001488777)
  {
    if (v7 == 2795618603)
    {
      BOOL v10 = v6 == 2622;
LABEL_45:
      uint64_t v8 = 9;
      if (v10) {
        uint64_t v8 = 12;
      }
      goto LABEL_47;
    }
    if (v7 == 2940697645) {
      goto LABEL_32;
    }
    uint64_t v9 = 2941181571;
    goto LABEL_22;
  }
  if (v7 <= 3885279869)
  {
    if (v7 == 3001488778)
    {
LABEL_42:
      BOOL v10 = v6 == 2532;
      goto LABEL_45;
    }
    uint64_t v9 = 3825599860;
    goto LABEL_22;
  }
  if (v7 == 4201643249)
  {
    BOOL v11 = v6 == 2778;
    goto LABEL_34;
  }
  if (v7 == 3885279870)
  {
    uint64_t v8 = 9;
    if (v6 == 2436) {
      uint64_t v8 = 10;
    }
    goto LABEL_47;
  }
LABEL_23:
  if (v6 <= 2223)
  {
    uint64_t v8 = 2;
    if (v6 > 2000)
    {
      if (v6 > 2078)
      {
        if (v6 == 2079)
        {
          uint64_t v8 = 9;
          goto LABEL_47;
        }
        if (v6 == 2208)
        {
          uint64_t v8 = 6;
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      if (v6 != 2001)
      {
        if (v6 == 2048) {
          goto LABEL_47;
        }
        goto LABEL_48;
      }
    }
    else
    {
      if (v6 > 1623)
      {
        if (v6 == 1624) {
          goto LABEL_78;
        }
        if (v6 == 1792)
        {
LABEL_70:
          uint64_t v8 = 5;
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      if (v6 == 1024) {
        goto LABEL_47;
      }
      if (v6 != 1334) {
        goto LABEL_48;
      }
    }
    uint64_t v8 = 1;
    goto LABEL_47;
  }
  if (v6 > 2435)
  {
    if (v6 > 2687)
    {
      if (v6 != 2688)
      {
        if (v6 == 2732)
        {
          uint64_t v8 = 7;
        }
        else
        {
          if (v6 != 2778) {
            goto LABEL_48;
          }
          uint64_t v8 = 14;
        }
        goto LABEL_47;
      }
      goto LABEL_70;
    }
    if (v6 != 2436)
    {
      if (v6 == 2532)
      {
        uint64_t v8 = 12;
        goto LABEL_47;
      }
      goto LABEL_48;
    }
LABEL_78:
    uint64_t v8 = 4;
    goto LABEL_47;
  }
  if (v6 > 2359)
  {
    if (v6 == 2360 || v6 == 2388)
    {
      uint64_t v8 = 8;
      goto LABEL_47;
    }
  }
  else
  {
    if (v6 == 2224)
    {
      uint64_t v8 = 3;
      goto LABEL_47;
    }
    if (v6 == 2272) {
      goto LABEL_5;
    }
  }
LABEL_48:
  v12 = TPDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218240;
    uint64_t v14 = screenSize_screenSize;
    __int16 v15 = 1024;
    int v16 = v6;
    _os_log_impl(&dword_1C2F24000, v12, OS_LOG_TYPE_DEFAULT, "Determined screen size to be %ld for screenHeight: %d", (uint8_t *)&v13, 0x12u);
  }
}

+ (unint64_t)inCallBottomBarSpacing
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__TPUIConfiguration_inCallBottomBarSpacing__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (inCallBottomBarSpacing_onceToken != -1) {
    dispatch_once(&inCallBottomBarSpacing_onceToken, block);
  }
  return inCallBottomBarSpacing_spacing;
}

unint64_t __43__TPUIConfiguration_inCallBottomBarSpacing__block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(a1 + 32) screenSize];
  if (result > 0xF) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = qword_1C2F72ED8[result];
  }
  inCallBottomBarSpacing_spacing = v2;
  return result;
}

+ (unint64_t)pipStatusBarPadding
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__TPUIConfiguration_pipStatusBarPadding__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pipStatusBarPadding_onceToken != -1) {
    dispatch_once(&pipStatusBarPadding_onceToken, block);
  }
  return (unint64_t)*(double *)&pipStatusBarPadding_padding;
}

uint64_t __40__TPUIConfiguration_pipStatusBarPadding__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) screenSize];
  double v2 = 1.0;
  if ((unint64_t)(result - 1) <= 0xE) {
    double v2 = dbl_1C2F72F58[result - 1];
  }
  pipStatusBarPadding_padding = *(void *)&v2;
  return result;
}

+ (double)defaultHeight
{
  unint64_t v2 = +[TPUIConfiguration screenSize] - 10;
  if (v2 < 6) {
    return dbl_1C2F72FD0[v2];
  }
  if (+[TPUIConfiguration inCallBottomBarSpacing] == 6) {
    return 82.0;
  }
  unint64_t v4 = +[TPUIConfiguration inCallBottomBarSpacing];
  double result = 72.0;
  if (v4 == 3) {
    return 82.0;
  }
  return result;
}

@end