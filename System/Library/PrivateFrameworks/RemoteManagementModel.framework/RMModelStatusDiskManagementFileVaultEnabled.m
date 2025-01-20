@interface RMModelStatusDiskManagementFileVaultEnabled
+ (id)statusItemType;
+ (id)supportedOS;
- (BOOL)isArrayValue;
@end

@implementation RMModelStatusDiskManagementFileVaultEnabled

+ (id)statusItemType
{
  return @"diskmanagement.filevault.enabled";
}

- (BOOL)isArrayValue
{
  return 0;
}

+ (id)supportedOS
{
  v9[1] = *MEMORY[0x263EF8340];
  v8 = &unk_2708C3390;
  v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0258];
  v7[0] = v2;
  v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_2708C0270];
  v7[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v9[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v5;
}

@end