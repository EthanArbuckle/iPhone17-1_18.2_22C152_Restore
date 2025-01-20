@interface WFSevereWeatherEvent(WeatherAdditions)
- (id)dictionaryRepresentation;
- (uint64_t)initWithDictionary:()WeatherAdditions;
@end

@implementation WFSevereWeatherEvent(WeatherAdditions)

- (uint64_t)initWithDictionary:()WeatherAdditions
{
  id v3 = a3;
  v4 = [v3 objectForKey:0x26DAE1750];
  v5 = [v3 objectForKey:0x26DAE1770];
  v6 = [v3 objectForKey:0x26DAE1790];
  v7 = [v3 objectForKey:0x26DAE17B0];
  v8 = [v3 objectForKey:0x26DAE1570];
  v9 = (void *)[v8 unsignedIntegerValue];

  if (v9)
  {
    v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(unint64_t)v9];
  }
  v10 = [v3 objectForKey:0x26DAE17D0];
  if (v10)
  {
    v11 = [NSURL URLWithString:v10];
  }
  else
  {
    v11 = 0;
  }
  v12 = [v3 objectForKey:0x26DAE17F0];
  uint64_t v13 = [v12 unsignedIntegerValue];

  uint64_t v14 = [a1 initWithIdentifier:v4 areaName:v5 eventDescription:v6 source:v7 expirationDate:v9 URL:v11 importance:v13];
  return v14;
}

- (id)dictionaryRepresentation
{
  v17[2] = *MEMORY[0x263EF8340];
  v16[0] = 0x26DAE1750;
  v2 = [a1 identifier];
  v16[1] = 0x26DAE17F0;
  v17[0] = v2;
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "importance"));
  v17[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v5 = (void *)[v4 mutableCopy];

  v6 = [a1 areaName];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v6, 0x26DAE1770);

  v7 = [a1 eventDescription];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v7, 0x26DAE1790);

  v8 = [a1 source];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v8, 0x26DAE17B0);

  v9 = [a1 URL];
  v10 = [v9 absoluteString];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v10, 0x26DAE17D0);

  v11 = [a1 expirationDate];

  if (v11)
  {
    v12 = NSNumber;
    uint64_t v13 = [a1 expirationDate];
    [v13 timeIntervalSince1970];
    uint64_t v14 = objc_msgSend(v12, "numberWithDouble:");
    [v5 setObject:v14 forKey:0x26DAE1570];
  }
  return v5;
}

@end