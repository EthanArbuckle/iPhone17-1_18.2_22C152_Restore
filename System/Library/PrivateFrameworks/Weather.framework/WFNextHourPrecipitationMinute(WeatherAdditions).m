@interface WFNextHourPrecipitationMinute(WeatherAdditions)
- (id)dictionaryRepresentation;
- (uint64_t)initWithDictionary:()WeatherAdditions;
@end

@implementation WFNextHourPrecipitationMinute(WeatherAdditions)

- (uint64_t)initWithDictionary:()WeatherAdditions
{
  id v4 = a3;
  v5 = [v4 objectForKey:0x26DAE15F0];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [v4 objectForKey:0x26DAE1610];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v4 objectForKey:0x26DAE1630];
  [v11 doubleValue];
  double v13 = v12;

  v14 = [v4 objectForKey:0x26DAE1650];

  unint64_t v15 = [v14 unsignedIntegerValue];
  if (v15) {
    [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v15];
  }
  else {
  v16 = [MEMORY[0x263EFF910] distantPast];
  }
  uint64_t v17 = [a1 initWithIntensity:v16 chance:v7 perceivedIntensity:v10 date:v13];

  return v17;
}

- (id)dictionaryRepresentation
{
  v14[4] = *MEMORY[0x263EF8340];
  v13[0] = 0x26DAE15F0;
  v2 = NSNumber;
  [a1 intensity];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  v14[0] = v3;
  v13[1] = 0x26DAE1610;
  id v4 = NSNumber;
  [a1 chance];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v14[1] = v5;
  v13[2] = 0x26DAE1630;
  double v6 = NSNumber;
  [a1 perceivedIntensity];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  v14[2] = v7;
  v13[3] = 0x26DAE1650;
  v8 = NSNumber;
  double v9 = [a1 date];
  [v9 timeIntervalSince1970];
  double v10 = objc_msgSend(v8, "numberWithDouble:");
  v14[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

@end