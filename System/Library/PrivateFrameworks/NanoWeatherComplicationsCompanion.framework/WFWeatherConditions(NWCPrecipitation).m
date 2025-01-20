@interface WFWeatherConditions(NWCPrecipitation)
- (uint64_t)_code;
- (uint64_t)isTypeOfPrecipitation;
- (uint64_t)simplifiedPrecipitationCondition;
@end

@implementation WFWeatherConditions(NWCPrecipitation)

- (uint64_t)_code
{
  v1 = [a1 valueForComponent:*MEMORY[0x263F85FB0]];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (uint64_t)isTypeOfPrecipitation
{
  if (isTypeOfPrecipitation_onceToken != -1) {
    dispatch_once(&isTypeOfPrecipitation_onceToken, &__block_literal_global_11);
  }
  uint64_t v2 = (void *)isTypeOfPrecipitation_PrecipitationConditions;
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "_code"));
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (uint64_t)simplifiedPrecipitationCondition
{
  uint64_t v1 = [a1 _code];
  if ((unint64_t)(v1 - 1) > 0x2C) {
    return 0;
  }
  else {
    return qword_23B5B5918[v1 - 1];
  }
}

@end