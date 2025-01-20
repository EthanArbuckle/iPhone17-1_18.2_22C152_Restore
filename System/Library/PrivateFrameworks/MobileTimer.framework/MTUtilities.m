@interface MTUtilities
+ (BOOL)mtSBUIIsSystemApertureEnabled;
+ (id)dayAndTimeZoneOffsetStringFromDate:(id)a3 withTimeZoneOffset:(int64_t)a4 timeZoneAbbreviation:(id)a5 spaceBeforeTimeDesignator:(BOOL)a6 hoursOnly:(BOOL)a7 numericOnly:(BOOL)a8;
+ (id)mtCityFromWorldClockCity:(id)a3;
+ (id)widgetOverrideDate;
+ (id)widgetURL;
@end

@implementation MTUtilities

+ (id)dayAndTimeZoneOffsetStringFromDate:(id)a3 withTimeZoneOffset:(int64_t)a4 timeZoneAbbreviation:(id)a5 spaceBeforeTimeDesignator:(BOOL)a6 hoursOnly:(BOOL)a7 numericOnly:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v65 = a6;
  BOOL v66 = a7;
  id v67 = a3;
  id v11 = a5;
  int64_t v12 = a4 / 3600;
  if (!gNumberFormatter)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v14 = (void *)gNumberFormatter;
    gNumberFormatter = (uint64_t)v13;

    [(id)gNumberFormatter setNumberStyle:1];
    id v15 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v16 = (void *)gTodayFormatter;
    gTodayFormatter = (uint64_t)v15;

    v17 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    [(id)gTodayFormatter setTimeZone:v17];
    [(id)gTodayFormatter setDateStyle:2];
    [(id)gTodayFormatter setTimeStyle:0];
    [(id)gTodayFormatter setDoesRelativeDateFormatting:1];
    [(id)gTodayFormatter setFormattingContext:4];
    uint64_t v18 = objc_opt_new();
    v19 = (void *)gDateComponentsFormatter;
    gDateComponentsFormatter = v18;

    [(id)gDateComponentsFormatter setUnitsStyle:0];
  }
  int64_t v20 = a4 % 3600;
  v21 = (void *)gTodayFormatter;
  v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)a4];
  v23 = [v21 stringFromDate:v22];

  if (!v8)
  {
    if (a4)
    {
      if (a4 >= 0) {
        unint64_t v33 = a4;
      }
      else {
        unint64_t v33 = -a4;
      }
      if (v33 > 0xE0F)
      {
        if (v33 == 3600)
        {
          v42 = @"DAY_FORMAT_ONE_HOUR_BEHIND";
          if (a4 <= 0)
          {
            v43 = @"ONE_HOUR_BEHIND";
          }
          else
          {
            v42 = @"DAY_FORMAT_ONE_HOUR_AHEAD";
            v43 = @"ONE_HOUR_AHEAD";
          }
          v27 = v42;
          v28 = v43;
          v32 = [(id)gNumberFormatter stringFromNumber:&unk_1EEE11DA8];
          goto LABEL_50;
        }
        if (v12 < 0) {
          int64_t v12 = a4 / -3600;
        }
        if (!v20)
        {
          v61 = @"DAY_FORMAT_HOURS_BEHIND";
          if (a4 <= 0)
          {
            v62 = @"HOURS_BEHIND";
          }
          else
          {
            v61 = @"DAY_FORMAT_HOURS_AHEAD";
            v62 = @"HOURS_AHEAD";
          }
          v27 = v61;
          v28 = v62;
          v63 = (void *)gNumberFormatter;
          v64 = [MEMORY[0x1E4F28ED0] numberWithInteger:v12];
          v32 = [v63 stringFromNumber:v64];

          goto LABEL_50;
        }
        v49 = @"DAY_FORMAT_HOURS_MINUTES_BEHIND";
        if (a4 <= 0)
        {
          v50 = @"HOURS_MINUTES_BEHIND";
        }
        else
        {
          v49 = @"DAY_FORMAT_HOURS_MINUTES_AHEAD";
          v50 = @"HOURS_MINUTES_AHEAD";
        }
        v27 = v49;
        v28 = v50;
        v38 = objc_opt_new();
        [v38 setHour:v12];
        [v38 setMinute:(2185 * (v33 % 0xE10)) >> 17];
        uint64_t v39 = [(id)gDateComponentsFormatter stringFromDateComponents:v38];
      }
      else
      {
        v34 = @"DAY_FORMAT_MINUTES_BEHIND";
        if (a4 <= 0)
        {
          v35 = @"MINUTES_BEHIND";
        }
        else
        {
          v34 = @"DAY_FORMAT_MINUTES_AHEAD";
          v35 = @"MINUTES_AHEAD";
        }
        v27 = v34;
        v28 = v35;
        v36 = (void *)gNumberFormatter;
        if (a4 / 60 >= 0) {
          int64_t v37 = a4 / 60;
        }
        else {
          int64_t v37 = a4 / -60;
        }
        v38 = [MEMORY[0x1E4F28ED0] numberWithInteger:v37];
        uint64_t v39 = [v36 stringFromNumber:v38];
      }
      v32 = (void *)v39;
    }
    else
    {
      v32 = [(id)gNumberFormatter stringFromNumber:&unk_1EEE11D90];
      v27 = @"DAY_FORMAT_HOURS_AHEAD";
      v28 = @"HOURS_AHEAD";
    }
LABEL_50:
    if (v11)
    {
      uint64_t v51 = [(__CFString *)v27 stringByAppendingString:@"_TZ"];

      v27 = (__CFString *)v51;
    }
    v52 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v48 = [v52 localizedStringForKey:v27 value:&stru_1EEDE16C8 table:@"Localizable"];

    if (v65)
    {
      uint64_t v53 = [(__CFString *)v28 stringByAppendingString:@"_SPACE"];

      v28 = (__CFString *)v53;
    }
    v54 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v55 = [v54 localizedStringForKey:v28 value:&stru_1EEDE16C8 table:@"Localizable"];

    v56 = objc_msgSend(NSString, "stringWithFormat:", v55, v32);
    uint64_t v57 = objc_msgSend(NSString, "stringWithFormat:", v48, v23, v56, v11);
    v58 = (void *)v57;
    if (v66) {
      v59 = v56;
    }
    else {
      v59 = (void *)v57;
    }
    v40 = v59;

    v41 = v67;
    goto LABEL_58;
  }
  if (!a4)
  {
    v40 = &stru_1EEDE16C8;
    v41 = v67;
    goto LABEL_59;
  }
  if (v20)
  {
    v24 = @"DAY_FORMAT_HOURS_MINUTES_BEHIND";
    if (a4 <= 0)
    {
      v25 = @"HOURS_MINUTES_BEHIND";
    }
    else
    {
      v24 = @"DAY_FORMAT_HOURS_MINUTES_AHEAD";
      v25 = @"HOURS_MINUTES_AHEAD";
    }
    if (a4 >= 0) {
      unint64_t v26 = a4;
    }
    else {
      unint64_t v26 = -a4;
    }
    v27 = v24;
    v28 = v25;
    v29 = objc_opt_new();
    v30 = v29;
    if (a4 / 3600 >= 0) {
      int64_t v31 = a4 / 3600;
    }
    else {
      int64_t v31 = a4 / -3600;
    }
    [v29 setHour:v31];
    [v30 setMinute:(2185 * (v26 % 0xE10)) >> 17];
    v32 = [(id)gDateComponentsFormatter stringFromDateComponents:v30];
  }
  else
  {
    v44 = @"HOURS_MINUTES_BEHIND";
    if (a4 > 0) {
      v44 = @"HOURS_MINUTES_AHEAD";
    }
    v28 = v44;
    v45 = (void *)gNumberFormatter;
    if (a4 / 3600 >= 0) {
      int64_t v46 = a4 / 3600;
    }
    else {
      int64_t v46 = a4 / -3600;
    }
    v30 = [MEMORY[0x1E4F28ED0] numberWithInteger:v46];
    v32 = [v45 stringFromNumber:v30];
    v27 = v28;
  }
  v41 = v67;

  v47 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v48 = [v47 localizedStringForKey:v28 value:&stru_1EEDE16C8 table:@"Localizable"];

  objc_msgSend(NSString, "stringWithFormat:", v48, v32);
  v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_58:

LABEL_59:
  return v40;
}

+ (id)widgetURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"clock-worldclock:default"];
}

+ (id)widgetOverrideDate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (widgetOverrideDate_onceToken != -1) {
    dispatch_once(&widgetOverrideDate_onceToken, &__block_literal_global_338);
  }
  if (widgetOverrideDate_internal)
  {
    v3 = (void *)CFPreferencesCopyValue(@"ForceClock", @"com.apple.mobiletimer", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if ([v3 length])
    {
      v4 = objc_opt_new();
      [v4 setDateFormat:@"yyyy:MM:dd:HH:mm"];
      v5 = [v4 dateFromString:v3];
      v6 = MTLogForCategory(1);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543618;
        id v9 = a1;
        __int16 v10 = 2114;
        id v11 = v5;
        _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: widget override date: %{public}@", (uint8_t *)&v8, 0x16u);
      }
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t __33__MTUtilities_widgetOverrideDate__block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  widgetOverrideDate_internal = result;
  return result;
}

+ (id)mtCityFromWorldClockCity:(id)a3
{
  id v3 = a3;
  v4 = [MTCity alloc];
  v5 = [v3 alCityId];
  v6 = [v5 stringValue];
  v7 = [v3 alCity];
  int v8 = [v7 displayNameIncludingCountry:1];
  id v9 = [(MTCity *)v4 initWithIdentifier:v6 displayString:v8];

  __int16 v10 = [v3 name];
  [(MTCity *)v9 setCityName:v10];

  id v11 = [v3 timeZone];
  [(MTCity *)v9 setTimeZoneName:v11];

  uint64_t v12 = (void *)MEMORY[0x1E4F28ED0];
  id v13 = [v3 alCity];
  [v13 latitude];
  v14 = objc_msgSend(v12, "numberWithFloat:");
  [(MTCity *)v9 setLatitude:v14];

  id v15 = (void *)MEMORY[0x1E4F28ED0];
  v16 = [v3 alCity];
  [v16 longitude];
  v17 = objc_msgSend(v15, "numberWithFloat:");
  [(MTCity *)v9 setLongditude:v17];

  uint64_t v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.mobiletimer-framework"];
  v19 = [v3 alCityId];

  int64_t v20 = [v19 stringValue];
  v21 = [v18 localizedStringForKey:v20 value:&stru_1EEDE16C8 table:@"WorldClock"];
  [(MTCity *)v9 setAbbreviation:v21];

  return v9;
}

+ (BOOL)mtSBUIIsSystemApertureEnabled
{
  if (mtSBUIIsSystemApertureEnabled_onceToken != -1) {
    dispatch_once(&mtSBUIIsSystemApertureEnabled_onceToken, &__block_literal_global_351);
  }
  return mtSBUIIsSystemApertureEnabled_apertureEnabled;
}

uint64_t __44__MTUtilities_mtSBUIIsSystemApertureEnabled__block_invoke()
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x2020000000;
  v0 = (uint64_t (*)(void))getSBUIIsSystemApertureEnabledSymbolLoc_ptr;
  v6 = getSBUIIsSystemApertureEnabledSymbolLoc_ptr;
  if (!getSBUIIsSystemApertureEnabledSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getSBUIIsSystemApertureEnabledSymbolLoc_block_invoke;
    v2[3] = &unk_1E5914EC0;
    v2[4] = &v3;
    __getSBUIIsSystemApertureEnabledSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (uint64_t (*)(void))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0) {
    __44__MTUtilities_mtSBUIIsSystemApertureEnabled__block_invoke_cold_1();
  }
  uint64_t result = v0();
  mtSBUIIsSystemApertureEnabled_apertureEnabled = result;
  return result;
}

void __44__MTUtilities_mtSBUIIsSystemApertureEnabled__block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"BOOL soft_SBUIIsSystemApertureEnabled(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MTUtilities.m", 23, @"%s", dlerror());

  __break(1u);
}

@end