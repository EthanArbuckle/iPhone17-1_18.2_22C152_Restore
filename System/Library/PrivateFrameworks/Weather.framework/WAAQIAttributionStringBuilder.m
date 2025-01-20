@interface WAAQIAttributionStringBuilder
- (id)buildAttributionStringFromCity:(id)a3;
- (id)stationStringWithTimeElapsedFromCity:(id)a3;
@end

@implementation WAAQIAttributionStringBuilder

- (id)buildAttributionStringFromCity:(id)a3
{
  id v4 = a3;
  v5 = [v4 airQualityAttribution];
  uint64_t v6 = [v5 dataOrigination];
  if (!v6 || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [(WAAQIAttributionStringBuilder *)self stationStringWithTimeElapsedFromCity:v4];
  }
  else if (v6 == 1)
  {
    v7 = NSString;
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"AQI_VIEW_ATTRIBUTION_MODELED_DATA" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    v10 = [v5 name];
    v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)stationStringWithTimeElapsedFromCity:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF910] date];
  v5 = [v3 airQualityAttribution];
  uint64_t v6 = [v5 stationLastReadDate];
  [v4 timeIntervalSinceDate:v6];
  double v8 = v7;

  unint64_t v9 = vcvtad_u64_f64(v8 / 60.0 / 60.0);
  v10 = [v3 airQualityAttribution];
  v11 = [v10 stationLocationName];

  if (![v11 length])
  {
    uint64_t v12 = [v3 name];

    v11 = (void *)v12;
  }
  if (v9 == 1)
  {
    v13 = NSString;
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = v14;
    v16 = @"AQI_VIEW_ATTRIBUTION_STATION_DATA_ONE_HOUR_AGO";
  }
  else
  {
    if (v9)
    {
      v19 = WANumberFormatterForDisplayingAQI();
      v20 = [NSNumber numberWithUnsignedInt:v9];
      v15 = [v19 stringFromNumber:v20];

      v21 = NSString;
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v22 = [v17 localizedStringForKey:@"AQI_VIEW_ATTRIBUTION_STATION_DATA_MORE_THAN_ONE_HOUR_AGO" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
      v18 = objc_msgSend(v21, "stringWithFormat:", v22, v11, v15);

      goto LABEL_9;
    }
    v13 = NSString;
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = v14;
    v16 = @"AQI_VIEW_ATTRIBUTION_STATION_DATA_LESS_THAN_ONE_HOUR_AGO";
  }
  v17 = [v14 localizedStringForKey:v16 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
  v18 = objc_msgSend(v13, "stringWithFormat:", v17, v11);
LABEL_9:

  uint64_t v23 = [v3 airQualityLearnMoreURL];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [v3 airQualityAttribution];

    if (v25)
    {
      v26 = NSString;
      v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v28 = [v27 localizedStringForKey:@"AQI_VIEW_ATTRIBUTION_STATION_DATA_LEARN_MORE_SUFFIX" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
      v29 = [v3 airQualityAttribution];
      v30 = [v29 name];
      v31 = objc_msgSend(v26, "stringWithFormat:", v28, v30);

      uint64_t v32 = [v18 stringByAppendingString:v31];

      v18 = (void *)v32;
    }
  }

  return v18;
}

@end