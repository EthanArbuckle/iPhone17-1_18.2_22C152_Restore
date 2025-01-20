@interface NSDate(SMExtensions)
- (id)absoluteTimeString:()SMExtensions preposition:capitalized:;
- (id)dateString;
- (id)relativeTimeString;
- (id)roundedFormattedTimeWithRoundedMinutesUnit:()SMExtensions allowedUnits:;
- (id)timeStringWithPreposition:()SMExtensions capitalized:;
- (uint64_t)preciseFormattedTime;
- (uint64_t)roundedTime;
@end

@implementation NSDate(SMExtensions)

- (uint64_t)preciseFormattedTime
{
  return [a1 roundedFormattedTimeWithRoundedMinutesUnit:1 allowedUnits:112];
}

- (id)roundedFormattedTimeWithRoundedMinutesUnit:()SMExtensions allowedUnits:
{
  v5 = [MEMORY[0x263EFF910] date];
  [a1 timeIntervalSinceDate:v5];
  double v7 = v6;

  uint64_t v8 = (uint64_t)(round(v7) / 60.0);
  v9 = [MEMORY[0x263F08878] relativeDateFormatter];
  v10 = v9;
  uint64_t v11 = a3 - 1;
  if (v7 < 0.0) {
    uint64_t v11 = 0;
  }
  v12 = [v9 localizedStringFromTimeInterval:(double)(60 * (v8 + v11) / a3 * a3)];

  return v12;
}

- (uint64_t)roundedTime
{
  [a1 timeIntervalSinceReferenceDate];
  double v2 = ceil(v1 / 300.0) * 300.0;
  v3 = (void *)MEMORY[0x263EFF910];
  return [v3 dateWithTimeIntervalSinceReferenceDate:v2];
}

- (id)relativeTimeString
{
  double v2 = [MEMORY[0x263F08878] relativeDateFormatter];
  v3 = [MEMORY[0x263EFF910] now];
  v4 = [v2 localizedStringForDate:a1 relativeToDate:v3];

  return v4;
}

- (id)absoluteTimeString:()SMExtensions preposition:capitalized:
{
  if (a3 == 1)
  {
    double v6 = [a1 dateString];
  }
  else
  {
    v9 = [MEMORY[0x263F08878] dateFormatter];
    [v9 setDateFormat:@"yyyy-MM-dd"];
    v10 = [v9 stringFromDate:a1];
    uint64_t v11 = [MEMORY[0x263EFF910] date];
    v12 = [v9 stringFromDate:v11];
    int v13 = [v10 isEqual:v12];

    if (v13)
    {
      double v6 = [a1 timeStringWithPreposition:a4 capitalized:a5];
    }
    else
    {
      v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = [v14 localizedStringForKey:@"ESTIMATED_TIME_NEXT_CALENDAR_DAY" value:@"%@ on %@" table:0];

      v16 = NSString;
      v17 = [a1 timeStringWithPreposition:a4 capitalized:a5];
      v18 = [a1 dateString];
      double v6 = [v16 localizedStringWithValidatedFormat:v15, @"%@%@", 0, v17, v18 validFormatSpecifiers error];
    }
  }
  return v6;
}

- (id)dateString
{
  double v2 = [MEMORY[0x263F08878] dateFormatter];
  [v2 setLocalizedDateFormatFromTemplate:@"EEEE, MMMM d"];
  v3 = [v2 stringFromDate:a1];

  return v3;
}

- (id)timeStringWithPreposition:()SMExtensions capitalized:
{
  double v7 = [MEMORY[0x263F08790] localizedStringFromDate:a1 dateStyle:0 timeStyle:1];
  uint64_t v8 = [MEMORY[0x263F08878] dateFormatter];
  [v8 setLocalizedDateFormatFromTemplate:@"j"];
  v9 = [v8 stringFromDate:a1];
  v10 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  uint64_t v11 = [v10 invertedSet];
  v12 = [v9 componentsSeparatedByCharactersInSet:v11];
  int v13 = [v12 componentsJoinedByString:&stru_27090E290];

  v14 = objc_opt_new();
  v15 = [v14 numberFromString:v13];
  uint64_t v16 = [v15 integerValue];

  if (a3 == 1)
  {
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v16 == 1)
    {
      if (a4)
      {
        v18 = @"ESTIMATED_TIME_SINGULAR_HOUR_1:XX_WITH_CAPITALIZED_AROUND_PREPOSITION";
LABEL_18:
        v19 = @"Around %@";
        goto LABEL_31;
      }
      v18 = @"ESTIMATED_TIME_SINGULAR_HOUR_1:XX_WITH_NONCAPITALIZED_AROUND_PREPOSITION";
    }
    else
    {
      if (a4)
      {
        v18 = @"ESTIMATED_TIME_PLURAL_HOUR_WITH_CAPITALIZED_AROUND_PREPOSITION";
        goto LABEL_18;
      }
      v18 = @"ESTIMATED_TIME_PLURAL_HOUR_WITH_NONCAPITALIZED_AROUND_PREPOSITION";
    }
    v19 = @"around %@";
    goto LABEL_31;
  }
  if (a3 == 3)
  {
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v16 == 1)
    {
      if (a4)
      {
        v18 = @"ESTIMATED_TIME_SINGULAR_HOUR_1:XX_WITH_CAPITALIZED_BY_PREPOSITION";
LABEL_21:
        v19 = @"By %@";
        goto LABEL_31;
      }
      v18 = @"ESTIMATED_TIME_SINGULAR_HOUR_1:XX_WITH_NONCAPITALIZED_BY_PREPOSITION";
    }
    else
    {
      if (a4)
      {
        v18 = @"ESTIMATED_TIME_PLURAL_HOUR_WITH_CAPITALIZED_BY_PREPOSITION";
        goto LABEL_21;
      }
      v18 = @"ESTIMATED_TIME_PLURAL_HOUR_WITH_NONCAPITALIZED_BY_PREPOSITION";
    }
    v19 = @"by %@";
    goto LABEL_31;
  }
  if (a3 != 2) {
    goto LABEL_32;
  }
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v16 != 1)
  {
    if (a4)
    {
      v18 = @"ESTIMATED_TIME_PLURAL_HOUR_WITH_CAPITALIZED_AT_PREPOSITION";
      goto LABEL_15;
    }
    v18 = @"ESTIMATED_TIME_PLURAL_HOUR_WITH_NONCAPITALIZED_AT_PREPOSITION";
LABEL_26:
    v19 = @"at %@";
    goto LABEL_31;
  }
  if (!a4)
  {
    v18 = @"ESTIMATED_TIME_SINGULAR_HOUR_1:XX_WITH_NONCAPITALIZED_AT_PREPOSITION";
    goto LABEL_26;
  }
  v18 = @"ESTIMATED_TIME_SINGULAR_HOUR_1:XX_WITH_CAPITALIZED_AT_PREPOSITION";
LABEL_15:
  v19 = @"At %@";
LABEL_31:
  v20 = [v17 localizedStringForKey:v18 value:v19 table:0];

  uint64_t v21 = [NSString localizedStringWithValidatedFormat:v20, @"%@", 0, v7 validFormatSpecifiers error];

  double v7 = (void *)v21;
LABEL_32:

  return v7;
}

@end