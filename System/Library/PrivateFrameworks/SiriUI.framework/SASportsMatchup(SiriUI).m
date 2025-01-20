@interface SASportsMatchup(SiriUI)
- (id)siriui_channelsString;
- (id)siriui_firstEntity;
- (id)siriui_firstLineScores;
- (id)siriui_firstScore;
- (id)siriui_localizedScheduleStatusForLeague:()SiriUI sport:showTimeIfToday:;
- (id)siriui_secondEntity;
- (id)siriui_secondLineScores;
- (id)siriui_secondScore;
- (id)siriui_teamVsTeam;
- (id)siriui_venueLocation;
- (uint64_t)siriui_homeIsFirst;
- (uint64_t)siriui_isInTheFuture;
@end

@implementation SASportsMatchup(SiriUI)

- (uint64_t)siriui_isInTheFuture
{
  v1 = [a1 status];
  if (([v1 isEqualToString:*MEMORY[0x263F65C28]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F65C20]] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F65C10]];
  }

  return v2;
}

- (id)siriui_localizedScheduleStatusForLeague:()SiriUI sport:showTimeIfToday:
{
  id v7 = a4;
  v8 = [a1 status];
  v9 = objc_msgSend(MEMORY[0x263F086E0], "afui_assistantUIFrameworkBundle");
  v10 = [v9 assistantUILocale];

  if ([v8 isEqualToString:*MEMORY[0x263F65C18]])
  {
    id v11 = [a1 timeRemaining];
    id v12 = [a1 periodDescription];
    if (([v7 isEqualToString:*MEMORY[0x263F65CA0]] & 1) == 0 && objc_msgSend(v11, "length"))
    {
      v13 = NSString;
      v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
      v15 = [v14 siriUILocalizedStringForKey:@"PERIOD_TIME_REMAINING_PAIR %@, %@"];
      uint64_t v16 = [v13 stringWithValidatedFormat:v15, @"%@, %@", 0, v12, v11 validFormatSpecifiers error];
LABEL_5:
      uint64_t v17 = v16;

LABEL_10:
LABEL_27:

      id v12 = (id)v17;
      goto LABEL_28;
    }
    id v24 = v12;
    id v12 = v24;
    goto LABEL_12;
  }
  if ([v8 isEqualToString:*MEMORY[0x263F65C28]])
  {
    id v11 = objc_alloc_init(MEMORY[0x263F08790]);
    [v11 setFormattingContext:2];
    v18 = [a1 timeTBD];
    int v19 = [v18 BOOLValue];

    v20 = [a1 startTime];
    int v21 = objc_msgSend(v20, "sruif_isToday");

    if ((a5 & v21) == 1 && (v19 & 1) == 0)
    {
      v22 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
      id v12 = [v22 siriUILocalizedStringForKey:@"SCHEDULE_DATE_FORMAT_TEMPLATE"];

      v23 = [MEMORY[0x263F08790] dateFormatFromTemplate:v12 options:0 locale:v10];
      [v11 setDateFormat:v23];

      v14 = [a1 startTime];
      uint64_t v17 = [v11 stringFromDate:v14];
      goto LABEL_10;
    }
    if ((a5 & v21 & v19) != 1)
    {
      char v28 = v21 | v19;
      v29 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"EEE MMM d y" options:0 locale:v10];
      [v11 setDateFormat:v29];

      v30 = [a1 startTime];
      id v12 = [v11 stringFromDate:v30];

      if (v28)
      {
LABEL_28:

        goto LABEL_29;
      }
      v31 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
      v14 = [v31 siriUILocalizedStringForKey:@"SCHEDULE_DATE_FORMAT_TEMPLATE"];

      v32 = [MEMORY[0x263F08790] dateFormatFromTemplate:v14 options:0 locale:v10];
      [v11 setDateFormat:v32];

      v33 = [a1 startTime];
      v15 = [v11 stringFromDate:v33];

      uint64_t v16 = [NSString stringWithFormat:@"%@\n%@", v12, v15];
      goto LABEL_5;
    }
    id v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    id v24 = [v12 siriUILocalizedStringForKey:@"TO_BE_DETERMINED"];
LABEL_12:
    uint64_t v17 = (uint64_t)v24;
    goto LABEL_27;
  }
  if ([v8 isEqualToString:*MEMORY[0x263F65C08]])
  {
    v25 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v26 = v25;
    v27 = @"FINAL_SCHEDULE_FORMAT";
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F65C00]])
  {
    v25 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v26 = v25;
    v27 = @"CANCELED_SCHEDULE_FORMAT";
  }
  else if ([v8 isEqualToString:*MEMORY[0x263F65C20]])
  {
    v25 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v26 = v25;
    v27 = @"POSTPONED_SCHEDULE_FORMAT";
  }
  else
  {
    if (![v8 isEqualToString:*MEMORY[0x263F65C10]]) {
      goto LABEL_32;
    }
    v25 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v26 = v25;
    v27 = @"DELAYED_SCHEDULE_FORMAT";
  }
  id v11 = [v25 siriUILocalizedStringForKey:v27];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F08790]);
    [v12 setLocale:v10];
    [v12 setDoesRelativeDateFormatting:1];
    [v12 setTimeStyle:0];
    [v12 setDateStyle:2];
    [v12 setFormattingContext:2];
    id v34 = [NSString alloc];
    v35 = [a1 startTime];
    v36 = [v12 stringFromDate:v35];
    uint64_t v17 = objc_msgSend(v34, "initWithFormat:", v11, v36);

    goto LABEL_27;
  }
LABEL_32:
  id v12 = 0;
LABEL_29:

  return v12;
}

- (id)siriui_venueLocation
{
  uint64_t v2 = [a1 locationName];
  v3 = [a1 location];
  if ([v3 length] && objc_msgSend(v2, "length"))
  {
    id v4 = [NSString alloc];
    v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v6 = [v5 siriUILocalizedStringForKey:@"VENUE_LOCATION_FORMAT %@ %@"];
    id v7 = (id)objc_msgSend(v4, "initWithFormat:", v6, v2, v3);

    uint64_t v2 = v5;
LABEL_7:

    uint64_t v2 = v7;
    goto LABEL_8;
  }
  if (![v2 length] && objc_msgSend(v3, "length"))
  {
    id v7 = v3;
    goto LABEL_7;
  }
LABEL_8:

  return v2;
}

- (id)siriui_channelsString
{
  v1 = [a1 tvChannels];
  if ([v1 count])
  {
    uint64_t v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v3 = [v2 siriUILocalizedStringForKey:@"TV_SCHEDULE_LIST_JOINER"];
    id v4 = [v1 componentsJoinedByString:v3];

    v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v6 = [v5 siriUILocalizedStringForKey:@"TV_SCHEDULE_FORMAT %@"];

    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", v6, v4);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (uint64_t)siriui_homeIsFirst
{
  v1 = [a1 matchupOrder];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F65BF8]];

  return v2;
}

- (id)siriui_firstEntity
{
  if (objc_msgSend(a1, "siriui_homeIsFirst")) {
    [a1 homeEntity];
  }
  else {
  uint64_t v2 = [a1 awayEntity];
  }
  return v2;
}

- (id)siriui_firstLineScores
{
  if (objc_msgSend(a1, "siriui_homeIsFirst")) {
    [a1 homeLineScores];
  }
  else {
  uint64_t v2 = [a1 awayLineScores];
  }
  return v2;
}

- (id)siriui_firstScore
{
  if (objc_msgSend(a1, "siriui_homeIsFirst")) {
    [a1 homeScore];
  }
  else {
  uint64_t v2 = [a1 awayScore];
  }
  return v2;
}

- (id)siriui_secondEntity
{
  if (objc_msgSend(a1, "siriui_homeIsFirst")) {
    [a1 awayEntity];
  }
  else {
  uint64_t v2 = [a1 homeEntity];
  }
  return v2;
}

- (id)siriui_secondLineScores
{
  if (objc_msgSend(a1, "siriui_homeIsFirst")) {
    [a1 awayLineScores];
  }
  else {
  uint64_t v2 = [a1 homeLineScores];
  }
  return v2;
}

- (id)siriui_secondScore
{
  if (objc_msgSend(a1, "siriui_homeIsFirst")) {
    [a1 awayScore];
  }
  else {
  uint64_t v2 = [a1 homeScore];
  }
  return v2;
}

- (id)siriui_teamVsTeam
{
  uint64_t v2 = [a1 homeEntity];
  v3 = objc_msgSend(v2, "siriui_displayName");

  id v4 = [a1 awayEntity];
  v5 = objc_msgSend(v4, "siriui_displayName");

  char v6 = objc_msgSend(a1, "siriui_homeIsFirst");
  id v7 = NSString;
  v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
  v9 = v8;
  if (v6)
  {
    v10 = [v8 siriUILocalizedStringForKey:@"MATCHUP_VS_TITLE_FORMAT %1$@ %2$@"];
    objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, @"%1$@ %2$@", 0, v3, v5);
  }
  else
  {
    v10 = [v8 siriUILocalizedStringForKey:@"MATCHUP_AT_TITLE_FORMAT %1$@ %2$@"];
    objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, @"%1$@ %2$@", 0, v5, v3);
  id v11 = };

  return v11;
}

@end