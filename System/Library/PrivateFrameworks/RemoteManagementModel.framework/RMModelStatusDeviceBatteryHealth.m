@interface RMModelStatusDeviceBatteryHealth
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
@end

@implementation RMModelStatusDeviceBatteryHealth

+ (id)statusItemType
{
  return @"device.power.battery-health";
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)supportedOS
{
  v17[3] = *MEMORY[0x263EF8340];
  v16[0] = &unk_2708C2C70;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF448];
  v15[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF460];
  v15[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v17[0] = v4;
  v16[1] = &unk_2708C2C88;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF478];
  v14[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF490];
  v14[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v17[1] = v7;
  v16[2] = &unk_2708C2CA0;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF4A8];
  v13[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BF4C0];
  v13[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v17[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];

  return v11;
}

@end