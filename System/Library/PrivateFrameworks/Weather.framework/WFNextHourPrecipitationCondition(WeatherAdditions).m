@interface WFNextHourPrecipitationCondition(WeatherAdditions)
- (__CFString)stringForType:()WeatherAdditions;
- (id)dictionaryRepresentation;
- (uint64_t)initWithDictionary:()WeatherAdditions;
@end

@implementation WFNextHourPrecipitationCondition(WeatherAdditions)

- (uint64_t)initWithDictionary:()WeatherAdditions
{
  id v4 = a3;
  v5 = [v4 objectForKey:0x26DAE16F0];
  uint64_t v6 = [v5 unsignedIntegerValue];

  v7 = [a1 stringForType:v6];
  v8 = [v4 objectForKey:0x26DAE15F0];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [v4 objectForKey:0x26DAE1710];
  [v11 doubleValue];
  double v13 = v12;

  v14 = [v4 objectForKey:0x26DAE1730];

  v15 = (void *)[v14 unsignedIntegerValue];
  if (v15)
  {
    v15 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(unint64_t)v15];
  }
  uint64_t v16 = [a1 initWithType:v7 intensity:v15 probability:v10 validUntil:v13];

  return v16;
}

- (__CFString)stringForType:()WeatherAdditions
{
  if ((unint64_t)(a3 - 1) > 5) {
    return &stru_26DADC2F0;
  }
  else {
    return off_2647E0750[a3 - 1];
  }
}

- (id)dictionaryRepresentation
{
  v13[4] = *MEMORY[0x263EF8340];
  v12[0] = 0x26DAE16F0;
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "type"));
  v13[0] = v2;
  v12[1] = 0x26DAE15F0;
  v3 = NSNumber;
  [a1 intensity];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  v13[1] = v4;
  v12[2] = 0x26DAE1710;
  v5 = NSNumber;
  [a1 probability];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  v13[2] = v6;
  v12[3] = 0x26DAE1730;
  v7 = NSNumber;
  v8 = [a1 validUntil];
  [v8 timeIntervalSince1970];
  double v9 = objc_msgSend(v7, "numberWithDouble:");
  v13[3] = v9;
  double v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

@end