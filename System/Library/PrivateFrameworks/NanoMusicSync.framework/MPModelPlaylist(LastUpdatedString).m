@interface MPModelPlaylist(LastUpdatedString)
- (BOOL)nms_shouldShowLastUpdatedString;
- (id)_stringForDayOfWeek:()LastUpdatedString compact:;
- (id)nms_compactLastUpdatedString;
- (id)nms_lastUpdatedString;
@end

@implementation MPModelPlaylist(LastUpdatedString)

- (id)nms_lastUpdatedString
{
  v2 = [a1 lastModifiedDateComponents];

  if (v2)
  {
    v3 = [MEMORY[0x263EFF8F0] currentCalendar];
    v4 = [a1 lastModifiedDateComponents];
    v5 = [v4 date];
    uint64_t v6 = [v3 component:512 fromDate:v5];

    v7 = [a1 _stringForDayOfWeek:v6 compact:0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)nms_compactLastUpdatedString
{
  v2 = [a1 lastModifiedDateComponents];

  if (v2)
  {
    v3 = [MEMORY[0x263EFF8F0] currentCalendar];
    v4 = [a1 lastModifiedDateComponents];
    v5 = [v3 dateFromComponents:v4];
    uint64_t v6 = [v3 startOfDayForDate:v5];

    v7 = [MEMORY[0x263EFF910] date];
    v8 = [v3 startOfDayForDate:v7];

    v9 = objc_msgSend(v8, "nmu_dateWithDeltaDays:", -1);
    v10 = objc_msgSend(v8, "nmu_dateWithDeltaDays:", -7);
    if ([v6 compare:v9] == -1 && objc_msgSend(v6, "compare:", v10) == 1)
    {
      v11 = [MEMORY[0x263EFF8F0] currentCalendar];
      v12 = [a1 lastModifiedDateComponents];
      v13 = [v12 date];
      uint64_t v14 = [v11 component:512 fromDate:v13];

      v15 = [a1 _stringForDayOfWeek:v14 compact:1];
    }
    else
    {
      v16 = objc_msgSend(v6, "nmu_displayStringWithOptions:", -1);
      v17 = NSString;
      v18 = [MEMORY[0x263F086E0] nanoMusicSyncBundle];
      v19 = [v18 localizedStringForKey:@"LAST_UPDATED_SHORT_SUBTITLE" value:@"Updated %@" table:0];
      v15 = objc_msgSend(v17, "stringWithFormat:", v19, v16);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)nms_shouldShowLastUpdatedString
{
  v2 = [a1 lastModifiedDateComponents];

  if (!v2) {
    return 0;
  }
  v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  v4 = [a1 lastModifiedDateComponents];
  v5 = [v3 dateFromComponents:v4];
  uint64_t v6 = [v3 startOfDayForDate:v5];

  v7 = [MEMORY[0x263EFF910] date];
  v8 = [v3 startOfDayForDate:v7];

  v9 = objc_msgSend(v8, "nmu_dateWithDeltaDays:", -14);
  BOOL v10 = [v6 compare:v9] == 1;

  return v10;
}

- (id)_stringForDayOfWeek:()LastUpdatedString compact:
{
  switch(a3)
  {
    case 1:
      v5 = [MEMORY[0x263F086E0] nanoMusicSyncBundle];
      if (a4)
      {
        uint64_t v6 = @"COMPACT_LAST_UPDATED_SUBTITLE_SUNDAY";
        v7 = @"Updated Sun";
      }
      else
      {
        uint64_t v6 = @"LAST_UPDATED_SUBTITLE_SUNDAY";
        v7 = @"Updated every Sunday";
      }
      goto LABEL_24;
    case 2:
      v5 = [MEMORY[0x263F086E0] nanoMusicSyncBundle];
      if (a4)
      {
        uint64_t v6 = @"COMPACT_LAST_UPDATED_SUBTITLE_MONDAY";
        v7 = @"Updated Mon";
      }
      else
      {
        uint64_t v6 = @"LAST_UPDATED_SUBTITLE_MONDAY";
        v7 = @"Updated every Monday";
      }
      goto LABEL_24;
    case 3:
      v5 = [MEMORY[0x263F086E0] nanoMusicSyncBundle];
      if (a4)
      {
        uint64_t v6 = @"COMPACT_LAST_UPDATED_SUBTITLE_TUESDAY";
        v7 = @"Updated Tue";
      }
      else
      {
        uint64_t v6 = @"LAST_UPDATED_SUBTITLE_TUESDAY";
        v7 = @"Updated every Tuesday";
      }
      goto LABEL_24;
    case 4:
      v5 = [MEMORY[0x263F086E0] nanoMusicSyncBundle];
      if (a4)
      {
        uint64_t v6 = @"COMPACT_LAST_UPDATED_SUBTITLE_WEDNESDAY";
        v7 = @"Updated Wed";
      }
      else
      {
        uint64_t v6 = @"LAST_UPDATED_SUBTITLE_WEDNESDAY";
        v7 = @"Updated every Wednesday";
      }
      goto LABEL_24;
    case 5:
      v5 = [MEMORY[0x263F086E0] nanoMusicSyncBundle];
      if (a4)
      {
        uint64_t v6 = @"COMPACT_LAST_UPDATED_SUBTITLE_THURSDAY";
        v7 = @"Updated Thu";
      }
      else
      {
        uint64_t v6 = @"LAST_UPDATED_SUBTITLE_THURSDAY";
        v7 = @"Updated every Thursday";
      }
      goto LABEL_24;
    case 6:
      v5 = [MEMORY[0x263F086E0] nanoMusicSyncBundle];
      if (a4)
      {
        uint64_t v6 = @"COMPACT_LAST_UPDATED_SUBTITLE_FRIDAY";
        v7 = @"Updated Fri";
      }
      else
      {
        uint64_t v6 = @"LAST_UPDATED_SUBTITLE_FRIDAY";
        v7 = @"Updated every Friday";
      }
      goto LABEL_24;
    case 7:
      v5 = [MEMORY[0x263F086E0] nanoMusicSyncBundle];
      if (a4)
      {
        uint64_t v6 = @"COMPACT_LAST_UPDATED_SUBTITLE_SATURDAY";
        v7 = @"Updated Sat";
      }
      else
      {
        uint64_t v6 = @"LAST_UPDATED_SUBTITLE_SATURDAY";
        v7 = @"Updated every Saturday";
      }
LABEL_24:
      v8 = [v5 localizedStringForKey:v6 value:v7 table:0];

      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

@end