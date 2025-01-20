@interface RBSAppNapEnableGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
@end

@implementation RBSAppNapEnableGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  v21[2] = *MEMORY[0x263EF8340];
  if ([a3 targetIsSystem])
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = *MEMORY[0x263F64670];
      uint64_t v8 = *MEMORY[0x263F08338];
      v21[0] = @"Attribute is not applicable to system target";
      uint64_t v9 = *MEMORY[0x263F64668];
      v20[0] = v8;
      v20[1] = v9;
      v10 = [a1 description];
      v21[1] = v10;
      v11 = NSDictionary;
      v12 = v21;
      v13 = v20;
LABEL_6:
      v16 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:2];
      *a4 = [v6 errorWithDomain:v7 code:2 userInfo:v16];
    }
  }
  else if (a4)
  {
    v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F64670];
    uint64_t v14 = *MEMORY[0x263F08338];
    v19[0] = @"AppNap attributes not supported on non-macOS platforms";
    uint64_t v15 = *MEMORY[0x263F64668];
    v18[0] = v14;
    v18[1] = v15;
    v10 = [a1 description];
    v19[1] = v10;
    v11 = NSDictionary;
    v12 = v19;
    v13 = v18;
    goto LABEL_6;
  }
  return 0;
}

@end