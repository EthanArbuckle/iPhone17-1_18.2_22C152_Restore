@interface UIScreen
@end

@implementation UIScreen

void __43__UIScreen_TelephonyUI__screenSizeCategory__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) fixedCoordinateSpace];
  [v2 bounds];
  double v4 = v3;

  v5 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  uint64_t v7 = MGGetProductType();
  if (!v6 && v4 == 568.0 || (v6 == 1 ? (BOOL v8 = v4 > 1024.0) : (BOOL v8 = 1), !v8))
  {
LABEL_70:
    uint64_t v13 = 1;
    goto LABEL_71;
  }
  if (v7 > 2795618602)
  {
    if (v7 <= 3001488777)
    {
      if (v7 == 2795618603)
      {
        double v16 = 874.0;
        goto LABEL_58;
      }
      if (v7 == 2940697645) {
        goto LABEL_49;
      }
      uint64_t v9 = 2941181571;
    }
    else
    {
      if (v7 > 3885279869)
      {
        if (v7 != 4201643249)
        {
          if (v7 != 3885279870) {
            goto LABEL_25;
          }
          BOOL v18 = v4 == 812.0;
          uint64_t v13 = 8;
          uint64_t v19 = 7;
LABEL_59:
          if (v18) {
            uint64_t v13 = v19;
          }
          goto LABEL_71;
        }
        double v17 = 926.0;
LABEL_51:
        BOOL v18 = v4 == v17;
        uint64_t v13 = 11;
        uint64_t v19 = 10;
        goto LABEL_59;
      }
      if (v7 == 3001488778) {
        goto LABEL_55;
      }
      uint64_t v9 = 3825599860;
    }
    goto LABEL_24;
  }
  if (v7 <= 851437780)
  {
    if (v7 == 133314240) {
      goto LABEL_49;
    }
    if (v7 == 330877086)
    {
      double v17 = 956.0;
      goto LABEL_51;
    }
    uint64_t v9 = 574536383;
LABEL_24:
    if (v7 != v9) {
      goto LABEL_25;
    }
LABEL_50:
    double v17 = 932.0;
    goto LABEL_51;
  }
  if (v7 > 2688879998)
  {
    if (v7 != 2688879999)
    {
      if (v7 != 2793418701) {
        goto LABEL_25;
      }
      goto LABEL_49;
    }
    goto LABEL_50;
  }
  if (v7 == 851437781)
  {
LABEL_49:
    double v16 = 852.0;
LABEL_58:
    BOOL v18 = v4 == v16;
    uint64_t v13 = 9;
    uint64_t v19 = 5;
    goto LABEL_59;
  }
  if (v7 == 1169082144)
  {
LABEL_55:
    double v16 = 844.0;
    goto LABEL_58;
  }
LABEL_25:
  BOOL v11 = v4 <= 1112.0 && v6 == 1;
  BOOL v12 = v4 == 667.0 && v6 == 0;
  uint64_t v13 = 2;
  if (v12 || v11) {
    goto LABEL_71;
  }
  BOOL v14 = v4 == 736.0 && v6 == 0;
  BOOL v15 = v14;
  uint64_t v13 = 3;
  if (v6 == 1 || v15) {
    goto LABEL_71;
  }
  if (v6 || v4 != 812.0)
  {
    if (v6 || v4 != 844.0)
    {
      if (v6) {
        goto LABEL_72;
      }
      uint64_t v13 = 6;
      if (v4 == 896.0 || v4 == 926.0) {
        goto LABEL_71;
      }
      if (v4 != 693.0) {
        goto LABEL_72;
      }
      goto LABEL_70;
    }
    uint64_t v13 = 5;
  }
  else
  {
    uint64_t v13 = 4;
  }
LABEL_71:
  screenSizeCategory_screenCategory = v13;
LABEL_72:
  v20 = TPDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 134217984;
    uint64_t v23 = screenSizeCategory_screenCategory;
    _os_log_impl(&dword_1C2F24000, v20, OS_LOG_TYPE_DEFAULT, "determined screen category to be: %lu", (uint8_t *)&v22, 0xCu);
  }

  if (!screenSizeCategory_screenCategory)
  {
    v21 = TPDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __43__UIScreen_TelephonyUI__screenSizeCategory__block_invoke_cold_1(v21, v4);
    }
  }
}

void __43__UIScreen_TelephonyUI__screenSizeCategory__block_invoke_cold_1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  unint64_t v3 = (unint64_t)a2;
  _os_log_error_impl(&dword_1C2F24000, log, OS_LOG_TYPE_ERROR, "Unable to determine screen size category for screen with height %lu", (uint8_t *)&v2, 0xCu);
}

@end