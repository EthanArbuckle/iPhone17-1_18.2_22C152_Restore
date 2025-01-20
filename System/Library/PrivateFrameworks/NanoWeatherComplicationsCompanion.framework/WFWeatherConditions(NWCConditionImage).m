@interface WFWeatherConditions(NWCConditionImage)
- (id)nwc_conditionImageForTimeOfDay:()NWCConditionImage withScale:;
- (uint64_t)_nwc_code;
@end

@implementation WFWeatherConditions(NWCConditionImage)

- (id)nwc_conditionImageForTimeOfDay:()NWCConditionImage withScale:
{
  v6 = [a1 objectForKeyedSubscript:*MEMORY[0x263F85FB0]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (a3)
  {
    if (a3 != 1)
    {
      v9 = 0;
      goto LABEL_8;
    }
    v8 = NWCWFWeatherConditionsNighttimeImages;
  }
  else
  {
    v8 = NWCWFWeatherConditionsDaytimeImages;
  }
  v9 = v8[v7];
  if (v9)
  {
    v10 = [MEMORY[0x263F1C6C8] configurationWithScale:a4];
    v11 = [MEMORY[0x263F1C6B0] systemImageNamed:v9 withConfiguration:v10];
    v12 = [v11 imageWithRenderingMode:1];

    goto LABEL_9;
  }
LABEL_8:
  v12 = 0;
LABEL_9:

  return v12;
}

- (uint64_t)_nwc_code
{
  v1 = [a1 objectForKeyedSubscript:*MEMORY[0x263F85FB0]];
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

@end