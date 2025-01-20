@interface PFSharingUtilities
+ (id)_dateFormatterTemplate;
+ (id)_exifDateTimeFormatter;
+ (id)_exifSubsecTimeFormatter;
+ (id)_gpsDateFormatter;
+ (id)_gpsTimeFormatter;
+ (id)addAccessibilityDescription:(id)a3 toAVMetadata:(id)a4;
+ (id)addCreationDate:(id)a3 toExifDictionary:(id)a4;
+ (id)addCreationDate:(id)a3 toTIFFDictionary:(id)a4;
+ (id)addCustomDate:(id)a3 toAVMetadata:(id)a4;
+ (id)addCustomLocation:(id)a3 toAVMetadata:(id)a4;
+ (id)addDescription:(id)a3 toAVMetadata:(id)a4;
+ (id)exifDateTimeFromDate:(id)a3;
+ (id)exifSubsecTimeFromDate:(id)a3;
+ (id)gpsDictionaryForLocation:(id)a3;
+ (id)setString:(id)a3 forKey:(id)a4 inKeySpace:(id)a5 inAVMetadata:(id)a6;
@end

@implementation PFSharingUtilities

+ (id)addCreationDate:(id)a3 toTIFFDictionary:(id)a4
{
  id v5 = a3;
  v6 = (void *)[a4 mutableCopy];
  if (!v6)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v7 = [(id)objc_opt_class() exifDateTimeFromDate:v5];

  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F2FD38]];

  return v6;
}

+ (id)addCreationDate:(id)a3 toExifDictionary:(id)a4
{
  id v5 = a3;
  v6 = (void *)[a4 mutableCopy];
  if (!v6)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v7 = [(id)objc_opt_class() exifDateTimeFromDate:v5];
  v8 = [(id)objc_opt_class() exifSubsecTimeFromDate:v5];

  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F2F7F0]];
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2F950]];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F2F7E8]];
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2F948]];

  return v6;
}

+ (id)exifSubsecTimeFromDate:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _exifSubsecTimeFormatter];
  id v5 = [v4 stringFromDate:v3];

  return v5;
}

+ (id)exifDateTimeFromDate:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _exifDateTimeFormatter];
  id v5 = [v4 stringFromDate:v3];

  return v5;
}

+ (id)_exifSubsecTimeFormatter
{
  if (_exifSubsecTimeFormatter_onceToken_5573 != -1) {
    dispatch_once(&_exifSubsecTimeFormatter_onceToken_5573, &__block_literal_global_56);
  }
  v2 = (void *)_exifSubsecTimeFormatter_subsecTimeFormatter_5574;

  return v2;
}

void __46__PFSharingUtilities__exifSubsecTimeFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_exifSubsecTimeFormatter_subsecTimeFormatter_5574;
  _exifSubsecTimeFormatter_subsecTimeFormatter_5574 = (uint64_t)v0;

  [(id)_exifSubsecTimeFormatter_subsecTimeFormatter_5574 setTimeStyle:0];
  [(id)_exifSubsecTimeFormatter_subsecTimeFormatter_5574 setDateStyle:0];
  [(id)_exifSubsecTimeFormatter_subsecTimeFormatter_5574 setDateFormat:@"SSS"];
  v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)_exifSubsecTimeFormatter_subsecTimeFormatter_5574 setLocale:v2];

  id v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:@"en_US"];
  [(id)_exifSubsecTimeFormatter_subsecTimeFormatter_5574 setCalendar:v3];
}

+ (id)_exifDateTimeFormatter
{
  if (_exifDateTimeFormatter_onceToken_5586 != -1) {
    dispatch_once(&_exifDateTimeFormatter_onceToken_5586, &__block_literal_global_5587);
  }
  v2 = (void *)_exifDateTimeFormatter_dateTimeFormatter_5588;

  return v2;
}

void __44__PFSharingUtilities__exifDateTimeFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_exifDateTimeFormatter_dateTimeFormatter_5588;
  _exifDateTimeFormatter_dateTimeFormatter_5588 = (uint64_t)v0;

  [(id)_exifDateTimeFormatter_dateTimeFormatter_5588 setTimeStyle:0];
  [(id)_exifDateTimeFormatter_dateTimeFormatter_5588 setDateStyle:0];
  [(id)_exifDateTimeFormatter_dateTimeFormatter_5588 setDateFormat:@"yyyy:MM:dd HH:mm:ss"];
  v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)_exifDateTimeFormatter_dateTimeFormatter_5588 setLocale:v2];

  id v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:@"en_US"];
  [(id)_exifDateTimeFormatter_dateTimeFormatter_5588 setCalendar:v3];
}

+ (id)gpsDictionaryForLocation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 coordinate], CLLocationCoordinate2DIsValid(v33)))
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 coordinate];
    double v8 = v7;
    [v5 coordinate];
    if (v8 >= 0.0) {
      v10 = @"N";
    }
    else {
      v10 = @"S";
    }
    if (v8 < 0.0) {
      double v8 = -v8;
    }
    double v11 = -v9;
    if (v9 >= 0.0) {
      v12 = @"E";
    }
    else {
      v12 = @"W";
    }
    if (v9 >= 0.0) {
      double v11 = v9;
    }
    v13 = [NSNumber numberWithDouble:v11];
    [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F2FA50]];

    v14 = [NSNumber numberWithDouble:v8];
    [v6 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F2FA40]];

    [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F2FA48]];
    [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F2FA58]];
    v15 = [v5 timestamp];
    if (v15)
    {
      v16 = [a1 _gpsTimeFormatter];
      v17 = [v16 stringFromDate:v15];

      [v6 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F2FA98]];
      v18 = [a1 _gpsDateFormatter];
      v19 = [v18 stringFromDate:v15];

      [v6 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F2F9D0]];
    }
    [v5 verticalAccuracy];
    if (v20 >= 0.0)
    {
      [v5 altitude];
      BOOL v22 = v21 < 0.0;
      v23 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v6 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F2F9B0]];

      v24 = [NSNumber numberWithInt:v22];
      [v6 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F2F9B8]];
    }
    [v5 horizontalAccuracy];
    if (v25 >= 0.0)
    {
      v26 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v6 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F2FA28]];
    }
    [v5 speed];
    if (v27 >= 0.0)
    {
      v28 = [NSNumber numberWithDouble:v27 * 3.6];
      [v6 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F2FA80]];

      [v6 setObject:@"K" forKeyedSubscript:*MEMORY[0x1E4F2FA88]];
    }
    [v5 course];
    if (v29 >= 0.0)
    {
      v30 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v6 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F2FA30]];

      [v6 setObject:@"T" forKeyedSubscript:*MEMORY[0x1E4F2FA38]];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_gpsDateFormatter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PFSharingUtilities__gpsDateFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_gpsDateFormatter_onceToken_5609 != -1) {
    dispatch_once(&_gpsDateFormatter_onceToken_5609, block);
  }
  v2 = (void *)_gpsDateFormatter_dateFormatter_5610;

  return v2;
}

uint64_t __39__PFSharingUtilities__gpsDateFormatter__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _dateFormatterTemplate];
  v2 = (void *)_gpsDateFormatter_dateFormatter_5610;
  _gpsDateFormatter_dateFormatter_5610 = v1;

  id v3 = (void *)_gpsDateFormatter_dateFormatter_5610;

  return [v3 setDateFormat:@"yyyy:MM:dd"];
}

+ (id)_gpsTimeFormatter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PFSharingUtilities__gpsTimeFormatter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_gpsTimeFormatter_onceToken_5614 != -1) {
    dispatch_once(&_gpsTimeFormatter_onceToken_5614, block);
  }
  v2 = (void *)_gpsTimeFormatter_timeFormatter_5615;

  return v2;
}

uint64_t __39__PFSharingUtilities__gpsTimeFormatter__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _dateFormatterTemplate];
  v2 = (void *)_gpsTimeFormatter_timeFormatter_5615;
  _gpsTimeFormatter_timeFormatter_5615 = v1;

  id v3 = (void *)_gpsTimeFormatter_timeFormatter_5615;

  return [v3 setDateFormat:@"HH:mm:ss.SS"];
}

+ (id)_dateFormatterTemplate
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  id v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:@"en_US"];
  [v2 setCalendar:v4];

  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v5];

  return v2;
}

+ (id)addCustomLocation:(id)a3 toAVMetadata:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v21 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Adding custom location to video: %{private}@", buf, 0xCu);
  }
  v19 = v5;
  double v7 = (void *)[v6 mutableCopy];
  uint64_t v8 = *MEMORY[0x1E4F15CB0];
  uint64_t v9 = *MEMORY[0x1E4F15DE0];
  v10 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v6 withKey:*MEMORY[0x1E4F15CB0] keySpace:*MEMORY[0x1E4F15DE0]];
  if ([v10 count])
  {
    unint64_t v11 = 0;
    v12 = MEMORY[0x1E4F14500];
    do
    {
      v13 = [v10 objectAtIndexedSubscript:v11];
      [v7 removeObject:v13];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v10 objectAtIndexedSubscript:v11];
        *(_DWORD *)buf = 138477827;
        id v21 = v14;
        _os_log_impl(&dword_1A41FE000, v12, OS_LOG_TYPE_DEFAULT, "Removing existing metadata location: %{private}@", buf, 0xCu);
      }
      ++v11;
    }
    while ([v10 count] > v11);
  }
  v15 = [v19 iso6709Notation];
  v16 = [MEMORY[0x1E4F165A0] metadataItem];
  [v16 setKeySpace:v9];
  [v16 setKey:v8];
  [v16 setValue:v15];
  v17 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v16 setLocale:v17];

  [v7 addObject:v16];

  return v7;
}

+ (id)addCustomDate:(id)a3 toAVMetadata:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v19 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Adding custom date to video: %{private}@", buf, 0xCu);
  }
  v17 = v5;
  double v7 = (void *)[v6 mutableCopy];
  uint64_t v8 = *MEMORY[0x1E4F15CA0];
  uint64_t v9 = *MEMORY[0x1E4F15DE0];
  v10 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v6 withKey:*MEMORY[0x1E4F15CA0] keySpace:*MEMORY[0x1E4F15DE0]];
  if ([v10 count])
  {
    unint64_t v11 = 0;
    v12 = MEMORY[0x1E4F14500];
    do
    {
      v13 = [v10 objectAtIndexedSubscript:v11];
      [v7 removeObject:v13];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v10 objectAtIndexedSubscript:v11];
        *(_DWORD *)buf = 138477827;
        id v19 = v14;
        _os_log_impl(&dword_1A41FE000, v12, OS_LOG_TYPE_DEFAULT, "Removing existing metadata creation date: %{private}@", buf, 0xCu);
      }
      ++v11;
    }
    while ([v10 count] > v11);
  }
  v15 = [MEMORY[0x1E4F165A0] metadataItem];
  [v15 setKeySpace:v9];
  [v15 setKey:v8];
  [v15 setValue:v17];
  [v7 addObject:v15];

  return v7;
}

+ (id)setString:(id)a3 forKey:(id)a4 inKeySpace:(id)a5 inAVMetadata:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412803;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2113;
    id v28 = v9;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Setting '%@''s '%@' to '%{private}@' to video", buf, 0x20u);
  }
  uint64_t v22 = v9;
  v13 = (void *)[v12 mutableCopy];
  v14 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v12 withKey:v10 keySpace:v11];
  if ([v14 count])
  {
    unint64_t v15 = 0;
    v16 = MEMORY[0x1E4F14500];
    do
    {
      v17 = [v14 objectAtIndexedSubscript:v15];
      [v13 removeObject:v17];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [v14 objectAtIndexedSubscript:v15];
        *(_DWORD *)buf = 138412547;
        id v24 = v10;
        __int16 v25 = 2113;
        id v26 = v18;
        _os_log_impl(&dword_1A41FE000, v16, OS_LOG_TYPE_DEFAULT, "Removing existing metadata '%@': %{private}@", buf, 0x16u);
      }
      ++v15;
    }
    while ([v14 count] > v15);
  }
  id v19 = [MEMORY[0x1E4F165A0] metadataItem];
  [v19 setKeySpace:v11];
  [v19 setKey:v10];
  [v19 setValue:v22];
  uint64_t v20 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v19 setLocale:v20];

  [v13 addObject:v19];

  return v13;
}

+ (id)addDescription:(id)a3 toAVMetadata:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138477827;
    id v10 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Adding description label to video: %{private}@", (uint8_t *)&v9, 0xCu);
  }
  double v7 = +[PFSharingUtilities setString:v5 forKey:*MEMORY[0x1E4F15CA8] inKeySpace:*MEMORY[0x1E4F15DE0] inAVMetadata:v6];

  return v7;
}

+ (id)addAccessibilityDescription:(id)a3 toAVMetadata:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138477827;
    id v10 = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Adding custom accessibility label to video: %{private}@", (uint8_t *)&v9, 0xCu);
  }
  double v7 = +[PFSharingUtilities setString:v5 forKey:*MEMORY[0x1E4F15C88] inKeySpace:*MEMORY[0x1E4F15DE0] inAVMetadata:v6];

  return v7;
}

@end