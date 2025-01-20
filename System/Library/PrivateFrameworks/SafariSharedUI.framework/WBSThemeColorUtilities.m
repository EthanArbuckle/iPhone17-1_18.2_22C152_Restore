@interface WBSThemeColorUtilities
+ (BOOL)shouldIgnoreThemeColorForContrastWithActiveTab:(id)a3 privateBrowsingEnabled:(BOOL)a4;
+ (BOOL)shouldOverrideTintColorForThemeColor:(id)a3;
+ (id)overrideTabColorForThemeColor:(id)a3;
+ (id)updateThemeColorForWebView:(id)a3 darkModeEnabled:(BOOL)a4;
+ (id)updateThemeColorForWebView:(id)a3 darkModeEnabled:(BOOL)a4 allowFallbackColors:(BOOL)a5 updateUnderPageBackgroundColor:(BOOL)a6;
@end

@implementation WBSThemeColorUtilities

+ (id)overrideTabColorForThemeColor:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "safari_meetsThresholdForDarkAppearance"))
  {
    double v9 = 0.0;
    double v10 = 0.0;
    double v8 = 0.0;
    v5 = objc_msgSend(v4, "safari_sRGBColor");
    [v5 getHue:&v10 saturation:&v9 brightness:&v8 alpha:0];

    v6 = 0;
    if (v8 >= 0.9 && v9 >= 0.8)
    {
      v6 = [MEMORY[0x1E4F428B8] colorWithHue:v10 saturation:v9 * 0.83 brightness:v8 alpha:1.0];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldOverrideTintColorForThemeColor:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3
    && (double v9 = 0.0,
        double v10 = 0.0,
        objc_msgSend(v3, "safari_sRGBColor"),
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 getHue:0 saturation:&v10 brightness:&v9 alpha:0],
        v5,
        v9 >= 0.15))
  {
    objc_msgSend(v4, "safari_grayscaleComponent", v9);
    BOOL v6 = v8 < 0.8 || v10 > 0.4;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldIgnoreThemeColorForContrastWithActiveTab:(id)a3 privateBrowsingEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  if (!v4)
  {
    objc_msgSend(v5, "safari_saturation");
    if (v9 < 0.05)
    {
      objc_msgSend(v6, "safari_grayscaleComponent");
      BOOL v8 = v10 > 0.97;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v5, "safari_grayscaleComponent");
  BOOL v8 = v7 < 0.2;
LABEL_7:

  return v8;
}

+ (id)updateThemeColorForWebView:(id)a3 darkModeEnabled:(BOOL)a4
{
  return (id)[a1 updateThemeColorForWebView:a3 darkModeEnabled:a4 allowFallbackColors:1 updateUnderPageBackgroundColor:1];
}

+ (id)updateThemeColorForWebView:(id)a3 darkModeEnabled:(BOOL)a4 allowFallbackColors:(BOOL)a5 updateUnderPageBackgroundColor:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = [v9 themeColor];
  [v9 setUnderPageBackgroundColor:0];
  v11 = [v9 underPageBackgroundColor];
  v12 = WBS_LOG_CHANNEL_PREFIXThemeColor();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    v14 = [v9 URL];
    v15 = [v9 _sampledPageTopColor];
    int v40 = 138740739;
    v41 = v14;
    __int16 v42 = 2113;
    id v43 = v10;
    __int16 v44 = 2113;
    v45 = v15;
    __int16 v46 = 2113;
    v47 = v11;
    _os_log_impl(&dword_1ABB70000, v13, OS_LOG_TYPE_INFO, "Updating theme color for \"%{sensitive}@\" (themeColor: %{private}@, _sampledPageTopColor: %{private}@, underPageBackgroundColor: %{private}@)", (uint8_t *)&v40, 0x2Au);
  }
  objc_msgSend(v10, "safari_grayscaleComponent");
  double v17 = v16;
  if (v10 && v16 < 1.0)
  {
    BOOL v18 = 0;
    v19 = 0;
    int v20 = 0;
  }
  else
  {
    if (sampledPageTopColorEnabled_onceToken != -1) {
      dispatch_once(&sampledPageTopColorEnabled_onceToken, &__block_literal_global_46);
    }
    int v20 = sampledPageTopColorEnabled_sampledPageTopColorEnabled;
    if (sampledPageTopColorEnabled_sampledPageTopColorEnabled)
    {
      v21 = [v9 _sampledPageTopColor];
      v19 = v21;
      int v20 = 0;
      BOOL v18 = v21 != 0;
      if (v17 >= 1.0 && v21)
      {
        int v20 = objc_msgSend(v21, "safari_isOffWhite") ^ 1;
        BOOL v18 = 1;
      }
    }
    else
    {
      BOOL v18 = 0;
      v19 = 0;
    }
  }
  if (!v10) {
    int v20 = 1;
  }
  if (v20 == 1 && v7)
  {
    if (objc_msgSend(v19, "safari_meetsThresholdForDarkAppearance"))
    {
      objc_msgSend(v19, "safari_luminance");
      BOOL v23 = v22 < 0.25;
      if (!v18) {
        goto LABEL_19;
      }
    }
    else
    {
      BOOL v23 = 0;
      if (!v18)
      {
LABEL_19:
        if (v10) {
          goto LABEL_32;
        }
LABEL_31:
        id v10 = v11;
        BOOL v6 = 0;
        goto LABEL_32;
      }
    }
    if (!objc_msgSend(v11, "safari_isOffWhite")
      || !v23 && !objc_msgSend(v19, "safari_isOffWhite"))
    {
      if (v10) {
        goto LABEL_32;
      }
      v29 = WBS_LOG_CHANNEL_PREFIXThemeColor();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = v29;
        v31 = describeColor(v11);
        v32 = describeColor(v19);
        int v40 = 138543618;
        v41 = v31;
        __int16 v42 = 2114;
        id v43 = v32;
        _os_log_impl(&dword_1ABB70000, v30, OS_LOG_TYPE_INFO, "Using background color (%{public}@); ignoring sampled color (%{public}@)",
          (uint8_t *)&v40,
          0x16u);
      }
      goto LABEL_31;
    }
    v24 = WBS_LOG_CHANNEL_PREFIXThemeColor();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (!v25) {
        goto LABEL_47;
      }
      v26 = v24;
      v27 = describeColor(v19);
      v28 = describeColor(v10);
      int v40 = 138543618;
      v41 = v27;
      __int16 v42 = 2114;
      id v43 = v28;
      _os_log_impl(&dword_1ABB70000, v26, OS_LOG_TYPE_INFO, "Using sampled color (%{public}@); ignoring theme color (%{public}@)",
        (uint8_t *)&v40,
        0x16u);
    }
    else
    {
      if (!v25) {
        goto LABEL_47;
      }
      v38 = v24;
      v27 = describeColor(v19);
      int v40 = 138543362;
      v41 = v27;
      _os_log_impl(&dword_1ABB70000, v38, OS_LOG_TYPE_INFO, "Using sampled color (%{public}@)", (uint8_t *)&v40, 0xCu);
    }
LABEL_47:
    id v39 = v19;

    id v10 = v39;
    if (!v8) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_32:
  if (!v8)
  {
LABEL_34:
    if (v6) {
      [v9 setUnderPageBackgroundColor:v10];
    }
    id v33 = v10;
    goto LABEL_41;
  }
LABEL_33:
  if (objc_msgSend(v10, "safari_meetsThresholdForDarkAppearance")) {
    goto LABEL_34;
  }
  if (v10)
  {
    v34 = WBS_LOG_CHANNEL_PREFIXThemeColor();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = v34;
      objc_msgSend(v10, "safari_grayscaleComponent");
      int v40 = 134217984;
      v41 = v36;
      _os_log_impl(&dword_1ABB70000, v35, OS_LOG_TYPE_INFO, "Ignoring color because it's too light and dark mode is enabled (grayscale: %.2f)", (uint8_t *)&v40, 0xCu);
    }
  }
  id v33 = 0;
LABEL_41:

  return v33;
}

@end