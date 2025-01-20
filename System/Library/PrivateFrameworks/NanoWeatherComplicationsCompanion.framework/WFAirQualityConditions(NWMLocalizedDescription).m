@interface WFAirQualityConditions(NWMLocalizedDescription)
+ (__CFString)_nwm_v2AirQualityConditionsDescriptionKeyForCategory:()NWMLocalizedDescription atLocation:;
+ (id)_nwm_descriptionForAirQualityConditions:()NWMLocalizedDescription atLocation:withExtension:;
+ (id)nwm_titleForAirQualityConditions:()NWMLocalizedDescription atLocation:;
+ (uint64_t)nwm_longDescriptionForAirQualityConditions:()NWMLocalizedDescription atLocation:;
+ (uint64_t)nwm_shortDescriptionForAirQualityConditions:()NWMLocalizedDescription atLocation:;
@end

@implementation WFAirQualityConditions(NWMLocalizedDescription)

+ (uint64_t)nwm_longDescriptionForAirQualityConditions:()NWMLocalizedDescription atLocation:
{
  return objc_msgSend(a1, "_nwm_descriptionForAirQualityConditions:atLocation:withExtension:", a3, a4, 0);
}

+ (uint64_t)nwm_shortDescriptionForAirQualityConditions:()NWMLocalizedDescription atLocation:
{
  return objc_msgSend(a1, "_nwm_descriptionForAirQualityConditions:atLocation:withExtension:", a3, a4, @"-Short");
}

+ (id)nwm_titleForAirQualityConditions:()NWMLocalizedDescription atLocation:
{
  id v5 = a4;
  v6 = [a3 currentScaleCategory];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
  }
  else if (objc_msgSend(v5, "nwm_isDAQICountry"))
  {
LABEL_4:
    v7 = @"AIR_POLLUTION";
    goto LABEL_7;
  }
  v7 = @"AIR_QUALITY";
LABEL_7:
  v8 = NWMAirQualityLocalizedString(v7);

  return v8;
}

+ (id)_nwm_descriptionForAirQualityConditions:()NWMLocalizedDescription atLocation:withExtension:
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [v10 currentScaleCategory];

  if (v11)
  {
    v12 = [v10 currentScaleCategory];

    v13 = [v12 categoryName];
  }
  else
  {
    uint64_t v14 = [v10 category];

    objc_msgSend(a1, "_nwm_v2AirQualityConditionsDescriptionKeyForCategory:atLocation:", v14, v8);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (!v13) {
    v13 = @"AirQualityUnknown";
  }
  if (![v9 length]) {
    goto LABEL_9;
  }
  v15 = [(__CFString *)v13 stringByAppendingString:v9];
  v16 = NWMAirQualityLocalizedString(v15);
  if ([v16 isEqualToString:v15])
  {

LABEL_9:
    v16 = NWMAirQualityLocalizedString(v13);
    goto LABEL_11;
  }

LABEL_11:

  return v16;
}

+ (__CFString)_nwm_v2AirQualityConditionsDescriptionKeyForCategory:()NWMLocalizedDescription atLocation:
{
  id v5 = a4;
  if (!objc_msgSend(v5, "nwm_isAQICountry"))
  {
    if (objc_msgSend(v5, "nwm_isDAQICountry"))
    {
      uint64_t v6 = a3 - 1;
      if ((unint64_t)(a3 - 1) < 0xA)
      {
        v7 = off_264DEFA28;
        goto LABEL_10;
      }
    }
    else if (objc_msgSend(v5, "nwm_isUBACountry"))
    {
      uint64_t v6 = a3 - 1;
      if ((unint64_t)(a3 - 1) < 5)
      {
        v7 = off_264DEFA78;
        goto LABEL_10;
      }
    }
LABEL_11:
    id v8 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 6) {
    goto LABEL_11;
  }
  v7 = off_264DEF9F8;
LABEL_10:
  id v8 = v7[v6];
LABEL_12:

  return v8;
}

@end