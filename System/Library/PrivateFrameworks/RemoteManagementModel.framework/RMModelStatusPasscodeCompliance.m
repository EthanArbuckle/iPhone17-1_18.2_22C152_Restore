@interface RMModelStatusPasscodeCompliance
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
@end

@implementation RMModelStatusPasscodeCompliance

+ (id)statusItemType
{
  return @"passcode.is-compliant";
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)supportedOS
{
  v21[4] = *MEMORY[0x263EF8340];
  v20[0] = &unk_2708C3630;
  v15 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0768];
  v19[0] = v15;
  v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0780];
  v19[1] = v14;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v21[0] = v13;
  v20[1] = &unk_2708C3660;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0798];
  v18[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C07B0];
  v18[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v21[1] = v4;
  v20[2] = &unk_2708C3690;
  v5 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C07C8];
  v17[0] = v5;
  v6 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C07E0];
  v17[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  v21[2] = v7;
  v20[3] = &unk_2708C36A8;
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C07F8];
  v16[0] = v8;
  v9 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0810];
  v16[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v21[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v11;
}

@end