@interface NDOUtilities
+ (BOOL)isInternal;
+ (id)dateWithEpochNumber:(id)a3;
+ (unsigned)daysFromDate:(id)a3;
@end

@implementation NDOUtilities

+ (BOOL)isInternal
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  char v3 = objc_msgSend(v2, "sf_isInternalInstall");

  return v3;
}

+ (id)dateWithEpochNumber:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v4 = [v3 unsignedIntegerValue];
    unint64_t v5 = v4 / 0x3E8;
    if (v4 <= 0x2540BE400) {
      unint64_t v5 = v4;
    }
    v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unsigned)daysFromDate:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  unint64_t v5 = [v3 standardUserDefaults];
  v6 = [v5 objectForKey:@"OneDayInterval"];
  [v6 doubleValue];
  double v8 = v7;

  if (v8 <= 0.0) {
    double v9 = 86400.0;
  }
  else {
    double v9 = v8;
  }
  [v4 timeIntervalSinceNow];
  double v11 = v10;

  return vcvtpd_u64_f64(v11 / v9);
}

@end