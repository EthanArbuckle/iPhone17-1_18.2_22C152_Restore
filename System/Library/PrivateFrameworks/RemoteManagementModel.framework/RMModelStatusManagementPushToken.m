@interface RMModelStatusManagementPushToken
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
@end

@implementation RMModelStatusManagementPushToken

+ (id)statusItemType
{
  return @"management.push-token";
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)supportedOS
{
  v35[6] = *MEMORY[0x263EF8340];
  v34[0] = &unk_2708C3510;
  v27 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C04C8];
  v33[0] = v27;
  v26 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C04E0];
  v33[1] = v26;
  v25 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C04F8];
  v33[2] = v25;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:3];
  v35[0] = v24;
  v34[1] = &unk_2708C3528;
  v23 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0510];
  v32[0] = v23;
  v22 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0528];
  v32[1] = v22;
  v21 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0540];
  v32[2] = v21;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
  v35[1] = v20;
  v34[2] = &unk_2708C3558;
  v19 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0558];
  v31[0] = v19;
  v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0570];
  v31[1] = v18;
  v17 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0588];
  v31[2] = v17;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
  v35[2] = v16;
  v34[3] = &unk_2708C3540;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C05A0];
  v30[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C05B8];
  v30[1] = v14;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C05D0];
  v30[2] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
  v35[3] = v3;
  v34[4] = &unk_2708C3570;
  v4 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C05E8];
  v29[0] = v4;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0600];
  v29[1] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0618];
  v29[2] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
  v35[4] = v7;
  v34[5] = &unk_2708C3588;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0630];
  v28[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0648];
  v28[1] = v9;
  v10 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0660];
  v28[2] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  v35[5] = v11;
  id v13 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:6];

  return v13;
}

@end