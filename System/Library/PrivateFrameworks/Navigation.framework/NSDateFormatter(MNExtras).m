@interface NSDateFormatter(MNExtras)
+ (id)_navigation_debugDescriptionForDate:()MNExtras;
+ (id)_navigation_localizedTimestampStringForDepartureArrivalDate:()MNExtras inTimeZone:canIncludeDate:relativeToTimeZone:;
+ (id)_navigation_localizedTimestampStringForDepartureArrivalDate:()MNExtras inTimeZone:canIncludeDate:showTimeZone:useShortFormat:;
+ (id)_navigation_localizedTimestampStringForDepartureArrivalDate:()MNExtras inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:;
+ (id)_timestampFormatterForTimeZone:()MNExtras displayTimeZone:;
+ (uint64_t)_navigation_localizedTimestampStringForDepartureArrivalDate:()MNExtras inTimeZone:canIncludeDate:;
@end

@implementation NSDateFormatter(MNExtras)

+ (id)_timestampFormatterForTimeZone:()MNExtras displayTimeZone:
{
  v5 = (objc_class *)MEMORY[0x1E4F28C10];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v8 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v7 setLocale:v8];

  if (a4) {
    v9 = @"jmaz";
  }
  else {
    v9 = @"jma";
  }
  [v7 setLocalizedDateFormatFromTemplate:v9];
  [v7 setTimeZone:v6];

  return v7;
}

+ (uint64_t)_navigation_localizedTimestampStringForDepartureArrivalDate:()MNExtras inTimeZone:canIncludeDate:
{
  return objc_msgSend(a1, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:", a3, a4, a5, 0, 0);
}

+ (id)_navigation_localizedTimestampStringForDepartureArrivalDate:()MNExtras inTimeZone:canIncludeDate:suppressTimeZoneDisplay:useShortFormat:
{
  id v11 = a3;
  id v12 = a4;
  v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v14 = [v13 timeZone];

  uint64_t v15 = 0;
  if (v12 && (a6 & 1) == 0) {
    uint64_t v15 = objc_msgSend(v12, "_navigation_isEquivalentToTimeZone:forDate:", v14, v11) ^ 1;
  }
  v16 = objc_msgSend(MEMORY[0x1E4F28C10], "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:showTimeZone:useShortFormat:", v11, v12, a5, v15, a7);

  return v16;
}

+ (id)_navigation_localizedTimestampStringForDepartureArrivalDate:()MNExtras inTimeZone:canIncludeDate:relativeToTimeZone:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v13 = [v12 timeZone];

  if (v10 && v11)
  {
    v14 = v10;
    id v15 = v11;
  }
  else
  {
    if (!v10 || (v14 = v10, v11))
    {
      uint64_t v16 = 0;
      if (v10) {
        goto LABEL_10;
      }
      v14 = v11;
      if (!v11) {
        goto LABEL_10;
      }
    }
    id v15 = v13;
  }
  uint64_t v16 = objc_msgSend(v14, "_navigation_isEquivalentToTimeZone:forDate:", v15, v9) ^ 1;
LABEL_10:
  v17 = objc_msgSend(MEMORY[0x1E4F28C10], "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:showTimeZone:useShortFormat:", v9, v10, a5, v16, 0);

  return v17;
}

+ (id)_navigation_localizedTimestampStringForDepartureArrivalDate:()MNExtras inTimeZone:canIncludeDate:showTimeZone:useShortFormat:
{
  id v12 = a3;
  id v13 = a4;
  if (qword_1EB59C018 != -1) {
    dispatch_once(&qword_1EB59C018, &__block_literal_global_6);
  }
  v14 = (void *)_MergedGlobals_20;
  id v15 = [NSNumber numberWithBool:a6];
  uint64_t v16 = [v14 objectForKey:v15];

  if (v16)
  {
    if (v13)
    {
LABEL_5:
      id v17 = v13;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v16 = objc_opt_new();
    v18 = (void *)_MergedGlobals_20;
    v19 = [NSNumber numberWithBool:a6];
    [v18 setObject:v16 forKey:v19];

    if (v13) {
      goto LABEL_5;
    }
  }
  v20 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v17 = [v20 timeZone];

LABEL_8:
  v21 = [v16 objectForKey:v17];
  if (v21)
  {
    v22 = v21;
    if (a6) {
      v23 = @"jmaz";
    }
    else {
      v23 = @"jma";
    }
    [v21 setLocalizedDateFormatFromTemplate:v23];
  }
  else
  {
    v22 = [a1 _timestampFormatterForTimeZone:v17 displayTimeZone:a6];
    [v16 setObject:v22 forKey:v17];
  }
  v24 = [v22 stringFromDate:v12];
  if (a5)
  {
    v25 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    if ((objc_msgSend(v25, "_navigation_isDateInToday:inTimeZone:", v12, v13) & 1) == 0)
    {
      if (a7)
      {
        v27 = objc_msgSend(v25, "_navigation_dateStringForDate:withStyle:useRelativeFormatting:inTimeZone:", v12, 1, 0, v13);
        v28 = NSString;
        v29 = _MNLocalizedStringFromThisBundle(@"%@ %@");
        objc_msgSend(v28, "stringWithFormat:", v29, v24, v27);
      }
      else
      {
        v27 = objc_msgSend(v25, "_navigation_dateStringForDate:withStyle:useRelativeFormatting:inTimeZone:", v12, 1, 1, v13);
        v30 = NSString;
        v29 = _MNLocalizedStringFromThisBundle(@"%@ at %@");
        objc_msgSend(v30, "stringWithFormat:", v29, v27, v24);
      }
      id v26 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
  }
  id v26 = v24;
LABEL_22:

  return v26;
}

+ (id)_navigation_debugDescriptionForDate:()MNExtras
{
  uint64_t v3 = qword_1EB59C028;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EB59C028, &__block_literal_global_29);
  }
  v5 = [(id)qword_1EB59C020 stringForObjectValue:v4];

  return v5;
}

@end