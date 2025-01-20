@interface NWCSevenDayForecastUltravioletIndexView
- (id)_setupViewBuilderForDevice:(id)a3;
- (void)processConditions:(id)a3 dailyForecastedConditions:(id)a4 timeZone:(id)a5;
- (void)processSimpleEntryModel:(id)a3;
@end

@implementation NWCSevenDayForecastUltravioletIndexView

- (void)processConditions:(id)a3 dailyForecastedConditions:(id)a4 timeZone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (processConditions_dailyForecastedConditions_timeZone__onceToken != -1) {
    dispatch_once(&processConditions_dailyForecastedConditions_timeZone__onceToken, &__block_literal_global_8);
  }
  [(id)processConditions_dailyForecastedConditions_timeZone__WeekdayFormatter setTimeZone:v10];
  v11 = (void *)processConditions_dailyForecastedConditions_timeZone__RangeFormatter;
  v12 = [NSNumber numberWithDouble:11.0];
  v13 = [v11 stringFromNumber:v12];
  v14 = [(NWCSevenDayForecastView *)self dailyForecastRangeView];
  v15 = [v14 highLabel];
  [v15 setText:v13];

  v16 = (void *)processConditions_dailyForecastedConditions_timeZone__RangeFormatter;
  v17 = [NSNumber numberWithDouble:0.0];
  v18 = [v16 stringFromNumber:v17];
  v19 = [(NWCSevenDayForecastView *)self dailyForecastRangeView];
  v20 = [v19 lowLabel];
  [v20 setText:v18];

  v21 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v21 setTimeZone:v10];
  v22 = objc_msgSend(v8, "nwc_date");
  if (v9)
  {
    v23 = [(NWCSevenDayForecastView *)self dailyForecastViews];
    uint64_t v24 = [v23 count];
    uint64_t v25 = [v9 count];

    if (v24 == v25)
    {
      v26 = [(NWCSevenDayForecastView *)self dailyForecastViews];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __96__NWCSevenDayForecastUltravioletIndexView_processConditions_dailyForecastedConditions_timeZone___block_invoke_2;
      v27[3] = &unk_264DEFC30;
      id v28 = v9;
      id v29 = v21;
      id v30 = v22;
      id v31 = v8;
      [v26 enumerateObjectsUsingBlock:v27];
    }
  }
}

void __96__NWCSevenDayForecastUltravioletIndexView_processConditions_dailyForecastedConditions_timeZone___block_invoke()
{
  v0 = objc_opt_new();
  v1 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [v0 setLocale:v1];

  [v0 setMinimumIntegerDigits:1];
  [v0 setMaximumFractionDigits:0];
  v2 = (void *)processConditions_dailyForecastedConditions_timeZone__RangeFormatter;
  processConditions_dailyForecastedConditions_timeZone__RangeFormatter = (uint64_t)v0;

  v3 = objc_opt_new();
  [v3 setDateFormat:@"EEEEE"];
  v4 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [v3 setLocale:v4];

  v5 = (void *)processConditions_dailyForecastedConditions_timeZone__WeekdayFormatter;
  processConditions_dailyForecastedConditions_timeZone__WeekdayFormatter = (uint64_t)v3;
}

void __96__NWCSevenDayForecastUltravioletIndexView_processConditions_dailyForecastedConditions_timeZone___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v26 = a2;
  v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  v6 = objc_msgSend(v5, "nwc_date");
  int v7 = [*(id *)(a1 + 40) isDate:v6 inSameDayAsDate:*(void *)(a1 + 48)];
  id v8 = (void *)MEMORY[0x263F86058];
  if (v7)
  {
    id v9 = [*(id *)(a1 + 56) objectForKeyedSubscript:*MEMORY[0x263F86058]];
    [v9 doubleValue];
    double v11 = v10;
    v12 = [v26 linearGaugeView];
    v13 = objc_msgSend(*(id *)(a1 + 56), "nwc_ultravioletIndexCategoryColor");
    [v12 applyIndicatorFillColor:v13];

    v14 = [v26 linearGaugeView];
    objc_msgSend(v14, "setValue:", fmin(v11 / 11.0, 1.0));

    v15 = [MEMORY[0x263F1C550] whiteColor];
    v16 = [v26 weekdayLabel];
    [v16 setTextColor:v15];
  }
  else
  {
    double v17 = *MEMORY[0x263F580C8];
    v18 = [v26 linearGaugeView];
    [v18 setValue:v17];

    id v9 = +[NWCColor systemGrayTextColor];
    v15 = [v26 weekdayLabel];
    [v15 setTextColor:v9];
  }

  if ([v5 isNightForecast])
  {
    v19 = 0;
  }
  else
  {
    v20 = [v5 objectForKeyedSubscript:*v8];
    [v20 doubleValue];
    v21 = +[NWKUIColorIndex indexForValue:](NWMUltravioletIndexColorIndex, "indexForValue:");
    v22 = +[NWMUltravioletIndexColorIndex allIndices];
    v19 = objc_msgSend(v22, "subarrayWithRange:", 0, objc_msgSend(v22, "indexOfObject:", v21) + 1);
  }
  v23 = [v26 linearGaugeView];
  [v23 setColorIndices:v19];

  uint64_t v24 = [(id)processConditions_dailyForecastedConditions_timeZone__WeekdayFormatter stringFromDate:v6];
  uint64_t v25 = [v26 weekdayLabel];
  [v25 setText:v24];
}

- (void)processSimpleEntryModel:(id)a3
{
  id v4 = a3;
  if (processSimpleEntryModel__onceToken != -1) {
    dispatch_once(&processSimpleEntryModel__onceToken, &__block_literal_global_11);
  }
  v5 = [v4 hourlyEntryModels];
  v6 = [v5 firstObject];
  int v7 = [v6 timeZone];

  if (v7)
  {
    [(id)processSimpleEntryModel__WeekdayFormatter setTimeZone:v7];
    id v8 = (void *)processSimpleEntryModel__RangeFormatter;
    id v9 = [NSNumber numberWithDouble:11.0];
    double v10 = [v8 stringFromNumber:v9];
    double v11 = [(NWCSevenDayForecastView *)self dailyForecastRangeView];
    v12 = [v11 highLabel];
    [v12 setText:v10];

    v13 = (void *)processSimpleEntryModel__RangeFormatter;
    v14 = [NSNumber numberWithDouble:0.0];
    v15 = [v13 stringFromNumber:v14];
    v16 = [(NWCSevenDayForecastView *)self dailyForecastRangeView];
    double v17 = [v16 lowLabel];
    [v17 setText:v15];

    v18 = [MEMORY[0x263EFF8F0] currentCalendar];
    [v18 setTimeZone:v7];
    v19 = [(NWCSevenDayForecastView *)self dailyForecastViews];
    uint64_t v20 = [v19 count];
    v21 = [v4 hourlyEntryModels];
    uint64_t v22 = [v21 count];

    if (v20 == v22)
    {
      v23 = [(NWCSevenDayForecastView *)self dailyForecastViews];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __67__NWCSevenDayForecastUltravioletIndexView_processSimpleEntryModel___block_invoke_2;
      v24[3] = &unk_264DEF920;
      id v25 = v4;
      [v23 enumerateObjectsUsingBlock:v24];
    }
  }
}

void __67__NWCSevenDayForecastUltravioletIndexView_processSimpleEntryModel___block_invoke()
{
  v0 = objc_opt_new();
  v1 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [v0 setLocale:v1];

  [v0 setMinimumIntegerDigits:1];
  [v0 setMaximumFractionDigits:0];
  v2 = (void *)processSimpleEntryModel__RangeFormatter;
  processSimpleEntryModel__RangeFormatter = (uint64_t)v0;

  v3 = objc_opt_new();
  [v3 setDateFormat:@"EEEEE"];
  id v4 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [v3 setLocale:v4];

  v5 = (void *)processSimpleEntryModel__WeekdayFormatter;
  processSimpleEntryModel__WeekdayFormatter = (uint64_t)v3;

  v6 = objc_opt_new();
  [v6 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
  int v7 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v6 setLocale:v7];

  id v8 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v6 setTimeZone:v8];

  id v9 = (void *)processSimpleEntryModel__FixedDateFormatter;
  processSimpleEntryModel__FixedDateFormatter = (uint64_t)v6;
}

void __67__NWCSevenDayForecastUltravioletIndexView_processSimpleEntryModel___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v34 = a2;
  v5 = [*(id *)(a1 + 32) hourlyEntryModels];
  v6 = [v5 objectAtIndexedSubscript:a3];

  int v7 = [v6 middleString];

  if (v7)
  {
    id v8 = (void *)processSimpleEntryModel__RangeFormatter;
    id v9 = [v6 middleString];
    int v7 = [v8 numberFromString:v9];
  }
  double v10 = *MEMORY[0x263F580C8];
  if (a3)
  {
    double v11 = [v34 linearGaugeView];
    [v11 setValue:v10];

    v12 = +[NWCColor systemGrayTextColor];
    v13 = [v34 weekdayLabel];
    [v13 setTextColor:v12];
  }
  else
  {
    v12 = [v6 topString];

    if (v12)
    {
      v14 = (void *)processSimpleEntryModel__RangeFormatter;
      v15 = [v6 topString];
      v12 = [v14 numberFromString:v15];

      [v12 doubleValue];
      double v10 = fmin(v16 / 11.0, 1.0);
    }
    v13 = objc_msgSend(MEMORY[0x263F85F98], "nwc_ultravioletIndexCategoryColorForNumber:", v12);
    double v17 = [v34 linearGaugeView];
    [v17 applyIndicatorFillColor:v13];

    v18 = [v34 linearGaugeView];
    [v18 setValue:v10];

    v19 = [MEMORY[0x263F1C550] whiteColor];
    uint64_t v20 = [v34 weekdayLabel];
    [v20 setTextColor:v19];
  }
  if ([v6 isDay])
  {
    [v7 doubleValue];
    double v22 = v21;
    v23 = +[NWKUIColorIndex indexForValue:](NWMUltravioletIndexColorIndex, "indexForValue:");
    uint64_t v24 = +[NWMUltravioletIndexColorIndex allIndices];
    id v25 = objc_msgSend(v24, "subarrayWithRange:", 0, objc_msgSend(v24, "indexOfObject:", v23) + 1);

    double v26 = fmin(v22 / 11.0, 1.0);
  }
  else
  {
    id v25 = 0;
    double v26 = 1.0;
  }
  v27 = [v34 linearGaugeView];
  [v27 setHighValue:v26];

  id v28 = [v34 linearGaugeView];
  [v28 setColorIndices:v25];

  id v29 = (void *)processSimpleEntryModel__FixedDateFormatter;
  id v30 = [v6 bottomString];
  id v31 = [v29 dateFromString:v30];

  v32 = [(id)processSimpleEntryModel__WeekdayFormatter stringFromDate:v31];
  v33 = [v34 weekdayLabel];
  [v33 setText:v32];
}

- (id)_setupViewBuilderForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NWCDailyForecastUltravioletIndexViewBuilder alloc] initWithDevice:v3];

  return v4;
}

@end