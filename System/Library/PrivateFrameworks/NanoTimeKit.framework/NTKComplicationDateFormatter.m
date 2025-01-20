@interface NTKComplicationDateFormatter
+ (id)_localizedDayDateFormatter;
+ (id)dateFormatterForStyle:(unint64_t)a3;
+ (id)stringForDate:(id)a3 withStyle:(unint64_t)a4;
+ (void)_handleLocaleChange:(id)a3;
+ (void)_handleSignificantTimeChange:(id)a3;
+ (void)initialize;
@end

@implementation NTKComplicationDateFormatter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:a1 selector:sel__handleSignificantTimeChange_ name:*MEMORY[0x1E4FB2708] object:0];

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:a1 selector:sel__handleLocaleChange_ name:*MEMORY[0x1E4F1C370] object:0];
  }
}

+ (void)_handleSignificantTimeChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CAF0], "resetSystemTimeZone", a3);
  v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  id v4 = _NTKAllDateFormatters();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__NTKComplicationDateFormatter__handleSignificantTimeChange___block_invoke;
  v6[3] = &unk_1E62C08E8;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

uint64_t __61__NTKComplicationDateFormatter__handleSignificantTimeChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setTimeZone:*(void *)(a1 + 32)];
}

+ (void)_handleLocaleChange:(id)a3
{
  _NTKAllDateFormatters();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 removeAllObjects];
}

+ (id)stringForDate:(id)a3 withStyle:(unint64_t)a4
{
  if (!a3)
  {
    v9 = &stru_1F1635E90;
    goto LABEL_14;
  }
  id v6 = a3;
  id v7 = [a1 dateFormatterForStyle:a4];
  v8 = [v7 stringFromDate:v6];

  _NTKRemovePunctationIfNecessaryFromTextForDateStyle(v8, a4);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((uint64_t)a4 <= 255)
  {
    if (a4 != 1 && a4 != 8) {
      goto LABEL_13;
    }
  }
  else if (a4 != 4096 && a4 != 2048)
  {
    if (a4 != 256 || (NTKCanUseAllUppercaseLongDateStrings() & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (NTKUseAllUppercaseShortWeekdays())
  {
LABEL_12:
    v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v11 = [(__CFString *)v9 uppercaseStringWithLocale:v10];

    v9 = (__CFString *)v11;
  }
LABEL_13:

LABEL_14:
  return v9;
}

+ (id)dateFormatterForStyle:(unint64_t)a3
{
  id v4 = _NTKAllDateFormatters();
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v7 = 0;
    if ((uint64_t)a3 <= 127)
    {
      if ((uint64_t)a3 <= 15)
      {
        v8 = @"E d";
        v9 = @"E";
        switch(a3)
        {
          case 1uLL:
            goto LABEL_33;
          case 2uLL:
            v9 = @"EEEE";
            goto LABEL_33;
          case 4uLL:
            id v6 = objc_opt_new();
            id v7 = @"d";
            goto LABEL_27;
          case 8uLL:
            goto LABEL_11;
          default:
            goto LABEL_21;
        }
      }
      if (a3 != 16)
      {
        if (a3 == 32)
        {
          v9 = @"EMMMd";
          goto LABEL_33;
        }
        if (a3 == 64)
        {
          v9 = @"MMMd";
LABEL_33:
          id v6 = objc_opt_new();
          id v7 = v9;
          goto LABEL_34;
        }
        goto LABEL_21;
      }
LABEL_20:
      id v7 = @"EEEEMMMd";
      goto LABEL_21;
    }
    if ((uint64_t)a3 > 1023)
    {
      switch(a3)
      {
        case 0x400uLL:
          v9 = @"M/d";
          goto LABEL_33;
        case 0x800uLL:
          v9 = @"EEEEE d";
          goto LABEL_33;
        case 0x1000uLL:
          v9 = @"EEEEEE d";
          goto LABEL_33;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x80uLL:
          v9 = @"MMM";
          goto LABEL_33;
        case 0x100uLL:
          goto LABEL_20;
        case 0x200uLL:
          v8 = @"EEEE d";
LABEL_11:
          id v6 = objc_opt_new();
          id v7 = v8;
          goto LABEL_24;
      }
    }
LABEL_21:
    id v6 = objc_opt_new();
    if (a3 != 8)
    {
      if (a3 != 4) {
        goto LABEL_34;
      }
LABEL_27:
      if ((CLKIsCurrentLocaleCJK() & 1) == 0)
      {
LABEL_34:
        [v6 setLocalizedDateFormatFromTemplate:v7];
        goto LABEL_35;
      }
LABEL_28:
      [v6 setDateFormat:v7];
LABEL_35:
      v12 = [NSNumber numberWithUnsignedInteger:a3];
      [v4 setObject:v6 forKeyedSubscript:v12];

      goto LABEL_36;
    }
LABEL_24:
    v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v11 = [v10 objectForKey:*MEMORY[0x1E4F1C438]];

    LODWORD(v10) = [v11 isEqualToString:@"en"];
    if (!v10) {
      goto LABEL_34;
    }
    goto LABEL_28;
  }
LABEL_36:

  return v6;
}

+ (id)_localizedDayDateFormatter
{
  v2 = _NTKAllDateFormatters();
  id v3 = [v2 objectForKeyedSubscript:@"localized"];

  if (!v3)
  {
    id v3 = objc_opt_new();
    [v3 setLocalizedDateFormatFromTemplate:@"d"];
    id v4 = _NTKAllDateFormatters();
    [v4 setObject:v3 forKeyedSubscript:@"localized"];
  }
  return v3;
}

@end