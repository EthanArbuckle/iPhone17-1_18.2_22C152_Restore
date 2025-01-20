@interface NTKBatteryUtilities
+ (BOOL)chargingForState:(int64_t)a3;
+ (id)chargingStringForState:(int64_t)a3;
+ (id)chargingStringForState:(int64_t)a3 longText:(BOOL)a4;
+ (id)colorForLevel:(float)a3 andState:(int64_t)a4;
+ (id)modularRingColorForLevel:(float)a3;
@end

@implementation NTKBatteryUtilities

+ (BOOL)chargingForState:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)chargingStringForState:(int64_t)a3
{
  return (id)[a1 chargingStringForState:a3 longText:0];
}

+ (id)chargingStringForState:(int64_t)a3 longText:(BOOL)a4
{
  v4 = @"BATTERY_CHARGING";
  if (a4) {
    v4 = @"BATTERY_CHARGING_LONG";
  }
  v5 = @"BATTERY_REMAINING_LONG";
  if (!a4) {
    v5 = @"BATTERY_BATTERY";
  }
  v6 = @"BATTERY_CHARGED";
  if (a4) {
    v6 = @"BATTERY_CHARGED_LONG";
  }
  if (a3 == 3) {
    v5 = v6;
  }
  if (a3 == 2) {
    v7 = v4;
  }
  else {
    v7 = v5;
  }
  return NTKClockFaceLocalizedString(v7, @"charging");
}

+ (id)colorForLevel:(float)a3 andState:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v7 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    *(float *)&double v10 = a3;
    v11 = [NSNumber numberWithFloat:v10];
    v12 = [NSNumber numberWithInteger:a4];
    int v15 = 138412802;
    v16 = v9;
    __int16 v17 = 2112;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "%@ invoking colorForLevel with level:%@ and state:%@", (uint8_t *)&v15, 0x20u);
  }
  if ([a1 chargingForState:a4])
  {
    v13 = [MEMORY[0x1E4FB1618] systemGreenColor];
  }
  else
  {
    v13 = 0;
    if (a3 >= 0.0 && a3 <= 0.2)
    {
      v13 = objc_msgSend(MEMORY[0x1E4FB1618], "systemRedColor", a3);
    }
  }

  return v13;
}

+ (id)modularRingColorForLevel:(float)a3
{
  if (a3 <= 0.2)
  {
    if (a3 >= 0.0)
    {
      v3 = [MEMORY[0x1E4FB1618] systemRedColor];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1618] systemGreenColor];
  }

  return v3;
}

@end