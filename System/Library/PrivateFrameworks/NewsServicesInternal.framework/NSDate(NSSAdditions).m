@interface NSDate(NSSAdditions)
+ (id)_todayStringDateFormatterForThread;
- (void)nss_gregorianDescriptionWithFlags:()NSSAdditions options:completion:;
@end

@implementation NSDate(NSSAdditions)

+ (id)_todayStringDateFormatterForThread
{
  v0 = [MEMORY[0x1E4F29060] currentThread];
  v1 = [v0 threadDictionary];
  v2 = [v1 objectForKey:@"kCurrentThreadTodayStringFormatterKey"];

  if (!v2)
  {
    v2 = objc_opt_new();
    [v2 setDoesRelativeDateFormatting:1];
    [v2 setTimeStyle:0];
    [v2 setDateStyle:4];
    v3 = [MEMORY[0x1E4F29060] currentThread];
    v4 = [v3 threadDictionary];
    [v4 setObject:v2 forKey:@"kCurrentThreadTodayStringFormatterKey"];
  }
  return v2;
}

- (void)nss_gregorianDescriptionWithFlags:()NSSAdditions options:completion:
{
  v56 = a5;
  [a1 timeIntervalSinceNow];
  double v9 = v8;
  double v10 = -v8;
  if (v9 < 0.0) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  v12 = [MEMORY[0x1E4F29060] currentThread];
  v13 = [v12 threadDictionary];
  v14 = [v13 objectForKey:@"NSDateCurrentThreadNSDateComponentsFormatterKey"];

  if (!v14)
  {
    v14 = objc_opt_new();
    [v14 setUnitsStyle:5];
    [v14 setAllowedUnits:124];
    [v14 setFormattingContext:2];
    [v14 setMaximumUnitCount:1];
    v15 = [MEMORY[0x1E4F29060] currentThread];
    v16 = [v15 threadDictionary];
    [v16 setObject:v14 forKey:@"NSDateCurrentThreadNSDateComponentsFormatterKey"];
  }
  if (v9 >= 0.0 || v11 < 60.0)
  {
    v19 = NSSBundleInternal();
    v20 = [v19 localizedStringForKey:@"now" value:&stru_1F3B518D0 table:0];

    id v21 = v20;
LABEL_12:
    id v18 = v21;
    v22 = v18;
    v23 = v18;
    goto LABEL_60;
  }
  if (v11 < 3600.0)
  {
    if (a3)
    {
      id v18 = [v14 stringFromTimeInterval:v11];
    }
    else
    {
      id v18 = 0;
    }
    float v17 = v11 / 60.0;
    float v31 = floorf(v17);
    if ((a3 & 2) == 0)
    {
      v22 = 0;
      if ((a3 & 4) == 0) {
        goto LABEL_56;
      }
      goto LABEL_26;
    }
    v33 = NSString;
    v34 = NSSBundleInternal();
    v35 = [v34 localizedStringForKey:@"%d minute/minutes ago medium" value:&stru_1F3B518D0 table:0];
    v22 = objc_msgSend(v33, "localizedStringWithFormat:", v35, (int)v31);

    if ((a3 & 4) != 0)
    {
LABEL_26:
      v36 = NSString;
      v37 = NSSBundleInternal();
      v38 = v37;
      v39 = @"%d minute/minutes ago long";
LABEL_58:
      v44 = [v37 localizedStringForKey:v39 value:&stru_1F3B518D0 table:0];
      uint64_t v45 = (int)v31;
      goto LABEL_59;
    }
LABEL_56:
    v23 = 0;
    goto LABEL_60;
  }
  if (v11 >= 86400.0)
  {
    if (v11 >= 604800.0)
    {
      if (v11 >= 31449600.0)
      {
        if (a3)
        {
          id v18 = [v14 stringFromTimeInterval:v11];
        }
        else
        {
          id v18 = 0;
        }
        float v46 = v11 / 31449600.0;
        float v31 = floorf(v46);
        if ((a3 & 2) != 0)
        {
          v53 = NSString;
          v54 = NSSBundleInternal();
          v55 = [v54 localizedStringForKey:@"%d year/years ago medium" value:&stru_1F3B518D0 table:0];
          v22 = objc_msgSend(v53, "localizedStringWithFormat:", v55, (int)v31);
        }
        else
        {
          v22 = 0;
        }
        if ((a3 & 4) == 0) {
          goto LABEL_56;
        }
        v36 = NSString;
        v37 = NSSBundleInternal();
        v38 = v37;
        v39 = @"%d year/years ago long";
      }
      else
      {
        if (a3)
        {
          id v18 = [v14 stringFromTimeInterval:v11];
        }
        else
        {
          id v18 = 0;
        }
        float v43 = v11 / 604800.0;
        float v31 = floorf(v43);
        if ((a3 & 2) != 0)
        {
          v50 = NSString;
          v51 = NSSBundleInternal();
          v52 = [v51 localizedStringForKey:@"%d week/weeks ago medium" value:&stru_1F3B518D0 table:0];
          v22 = objc_msgSend(v50, "localizedStringWithFormat:", v52, (int)v31);
        }
        else
        {
          v22 = 0;
        }
        if ((a3 & 4) == 0) {
          goto LABEL_56;
        }
        v36 = NSString;
        v37 = NSSBundleInternal();
        v38 = v37;
        v39 = @"%d week/weeks ago long";
      }
      goto LABEL_58;
    }
    if (a3)
    {
      id v18 = [v14 stringFromTimeInterval:v11];
    }
    else
    {
      id v18 = 0;
    }
    float v32 = v11 / 86400.0;
    float v31 = floorf(v32);
    if ((a3 & 2) != 0)
    {
      v47 = NSString;
      v48 = NSSBundleInternal();
      v49 = [v48 localizedStringForKey:@"%d day/days ago medium" value:&stru_1F3B518D0 table:0];
      v22 = objc_msgSend(v47, "localizedStringWithFormat:", v49, (int)v31);

      if ((a3 & 4) == 0) {
        goto LABEL_56;
      }
    }
    else
    {
      v22 = 0;
      if ((a3 & 4) == 0) {
        goto LABEL_56;
      }
    }
    v36 = NSString;
    v37 = NSSBundleInternal();
    v38 = v37;
    v39 = @"%d day/days ago long";
    goto LABEL_58;
  }
  float v24 = v11 / 3600.0;
  float v25 = floorf(v24);
  if ((a4 & 1) != 0 && v25 > 6.0)
  {
    v26 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    int v27 = [v26 isDateInToday:a1];

    if (v27)
    {
      v28 = [MEMORY[0x1E4F1C9C8] _todayStringDateFormatterForThread];
      v29 = [MEMORY[0x1E4F1C9C8] date];
      v30 = [v28 stringFromDate:v29];

      id v21 = v30;
      goto LABEL_12;
    }
  }
  if (a3)
  {
    id v18 = [v14 stringFromTimeInterval:v11];
    if ((a3 & 2) != 0)
    {
LABEL_29:
      v40 = NSString;
      v41 = NSSBundleInternal();
      v42 = [v41 localizedStringForKey:@"%d hour/hours ago medium" value:&stru_1F3B518D0 table:0];
      v22 = objc_msgSend(v40, "localizedStringWithFormat:", v42, (int)v25);

      if ((a3 & 4) == 0) {
        goto LABEL_56;
      }
      goto LABEL_36;
    }
  }
  else
  {
    id v18 = 0;
    if ((a3 & 2) != 0) {
      goto LABEL_29;
    }
  }
  v22 = 0;
  if ((a3 & 4) == 0) {
    goto LABEL_56;
  }
LABEL_36:
  v36 = NSString;
  v38 = NSSBundleInternal();
  v44 = [v38 localizedStringForKey:@"%d hour/hours ago long" value:&stru_1F3B518D0 table:0];
  uint64_t v45 = (int)v25;
LABEL_59:
  v23 = objc_msgSend(v36, "localizedStringWithFormat:", v44, v45);

LABEL_60:
  if (v56) {
    v56[2](v56, v18, v22, v23);
  }
}

@end