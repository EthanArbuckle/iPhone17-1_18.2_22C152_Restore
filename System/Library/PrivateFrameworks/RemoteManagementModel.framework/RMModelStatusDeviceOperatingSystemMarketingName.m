@interface RMModelStatusDeviceOperatingSystemMarketingName
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
@end

@implementation RMModelStatusDeviceOperatingSystemMarketingName

+ (id)statusItemType
{
  return @"device.operating-system.marketing-name";
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)supportedOS
{
  v29[6] = *MEMORY[0x263EF8340];
  v28[0] = &unk_2708C3030;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BFB98];
  v27[0] = v21;
  v20 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BFBB0];
  v27[1] = v20;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  v29[0] = v19;
  v28[1] = &unk_2708C3048;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BFBC8];
  v26[0] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BFBE0];
  v26[1] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v29[1] = v16;
  v28[2] = &unk_2708C3060;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BFBF8];
  v25[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BFC10];
  v25[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  v29[2] = v13;
  v28[3] = &unk_2708C3078;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BFC28];
  v24[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BFC40];
  v24[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v29[3] = v4;
  v28[4] = &unk_2708C3090;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BFC58];
  v23[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BFC70];
  v23[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  v29[4] = v7;
  v28[5] = &unk_2708C30A8;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BFC88];
  v22[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708BFCA0];
  v22[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  v29[5] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];

  return v11;
}

@end