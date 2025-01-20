@interface LinearGaugeLayoutConstants
@end

@implementation LinearGaugeLayoutConstants

void ___LinearGaugeLayoutConstants_block_invoke(uint64_t a1, void *a2)
{
  v14[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v3 screenScale];
  [v4 scaledValue:10.0 / v5];
  _LinearGaugeLayoutConstants_constants_0 = v6;
  [v3 screenScale];
  [v4 scaledValue:10.0 / v7];
  _LinearGaugeLayoutConstants_constants_1 = v8;
  [v3 screenScale];
  double v10 = v9;

  v13[0] = &unk_26EEA8408;
  v13[1] = &unk_26EEA8438;
  v14[0] = &unk_26EEA8420;
  v14[1] = &unk_26EEA8420;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v4 constantValue:v11 withOverrides:3.0 / v10];
  _LinearGaugeLayoutConstants_constants_2 = v12;
}

@end