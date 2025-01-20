@interface DCIMLocationUtilities
+ (id)_sharedGPSDateAndTimestampFormatter;
+ (id)locationFromImageProperties:(id)a3;
@end

@implementation DCIMLocationUtilities

+ (id)locationFromImageProperties:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F2FA18]];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FA40]];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FA50]];
  v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FA48]];
  uint64_t v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FA58]];
  v8 = (void *)v7;
  if (v4) {
    BOOL v9 = v5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v6 == 0 || v7 == 0)
  {
    v12 = 0;
  }
  else
  {
    [v4 doubleValue];
    double v14 = v13;
    [v5 doubleValue];
    double v16 = v15;
    int v17 = [v6 isEqualToString:@"S"];
    double v18 = -fabs(v14);
    if (v17) {
      double v14 = v18;
    }
    int v19 = [v8 isEqualToString:@"W"];
    double v20 = -fabs(v16);
    if (v19) {
      CLLocationDegrees v21 = v20;
    }
    else {
      CLLocationDegrees v21 = v16;
    }
    v22 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2F9B0]];
    uint64_t v23 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2F9B8]];
    v24 = (void *)v23;
    double v25 = 0.0;
    double v26 = -1.0;
    if (v22) {
      BOOL v27 = v23 == 0;
    }
    else {
      BOOL v27 = 1;
    }
    double v28 = 0.0;
    if (!v27)
    {
      [v22 doubleValue];
      double v28 = v29;
      double v26 = 0.0;
      if ([v24 intValue]) {
        double v28 = -fabs(v28);
      }
    }
    v30 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2F9D8]];
    v31 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2F9E0]];
    v56 = v31;
    if (v30 && [v31 isEqualToString:@"T"])
    {
      [v30 doubleValue];
      double v25 = v32;
    }
    uint64_t v33 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FA80]];
    uint64_t v34 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FA88]];
    v55 = (void *)v33;
    v35 = (void *)v33;
    v36 = (void *)v34;
    [v35 doubleValue];
    double v38 = v37;
    v57 = v30;
    if ([v36 isEqualToString:@"M"])
    {
      double v38 = v38 * 1.609344;
    }
    else if ([v36 isEqualToString:@"N"])
    {
      double v38 = v38 * 1.852;
    }
    v39 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2F9D0]];
    v40 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FA98]];
    v53 = v39;
    v54 = v36;
    if ([v40 length] && objc_msgSend(v39, "length"))
    {
      v41 = [NSString stringWithFormat:@"%@ %@", v39, v40];
      [(id)objc_opt_class() _sharedGPSDateAndTimestampFormatter];
      v52 = v24;
      v42 = v8;
      v43 = v6;
      v44 = v5;
      v45 = v22;
      v47 = v46 = v4;
      v48 = [v47 dateFromString:v41];

      v4 = v46;
      v22 = v45;
      v5 = v44;
      v6 = v43;
      v8 = v42;
      v24 = v52;
    }
    else
    {
      v48 = 0;
    }
    CLLocationCoordinate2D v59 = CLLocationCoordinate2DMake(v14, v21);
    double latitude = v59.latitude;
    double longitude = v59.longitude;
    if (CLLocationCoordinate2DIsValid(v59)) {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5F0]), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v48, latitude, longitude, v28, 0.0, v26, v25, v38);
    }
    else {
      v12 = 0;
    }
  }
  return v12;
}

+ (id)_sharedGPSDateAndTimestampFormatter
{
  if (_sharedGPSDateAndTimestampFormatter_onceToken != -1) {
    dispatch_once(&_sharedGPSDateAndTimestampFormatter_onceToken, &__block_literal_global_50);
  }
  v2 = (void *)_sharedGPSDateAndTimestampFormatter_formatter;
  return v2;
}

void __60__DCIMLocationUtilities__sharedGPSDateAndTimestampFormatter__block_invoke()
{
  v0 = (void *)MEMORY[0x19F38F510]();
  id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v2 = (void *)_sharedGPSDateAndTimestampFormatter_formatter;
  _sharedGPSDateAndTimestampFormatter_formatter = (uint64_t)v1;

  v3 = (void *)_sharedGPSDateAndTimestampFormatter_formatter;
  v4 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v3 setTimeZone:v4];

  [(id)_sharedGPSDateAndTimestampFormatter_formatter setDateFormat:@"yyyy:MM:dd HH:mm:ss.SS"];
}

@end