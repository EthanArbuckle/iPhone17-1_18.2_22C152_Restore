@interface RBSConstraintsAttribute(RBProcessState)
- (uint64_t)allowedWithAttribute:()RBProcessState error:;
- (uint64_t)hasMandatoryAttributes:()RBProcessState error:;
@end

@implementation RBSConstraintsAttribute(RBProcessState)

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([a1 constraints] & 4) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = *MEMORY[0x263F64670];
      uint64_t v11 = *MEMORY[0x263F08338];
      v12[0] = @"Constraints not met - assertion has a duration";
      v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
      *(void *)a4 = [v7 errorWithDomain:v8 code:4 userInfo:v9];

      a4 = 0;
    }
  }
  else
  {
    a4 = 1;
  }

  return a4;
}

- (uint64_t)hasMandatoryAttributes:()RBProcessState error:
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (([a1 constraints] & 3) == 0) {
    goto LABEL_16;
  }
  uint64_t v22 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    int v11 = 0;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v7);
        }
        v10 |= [*(id *)(*((void *)&v23 + 1) + 8 * i) preventsSuspension];
        objc_opt_class();
        v11 |= objc_opt_isKindOfClass();
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
    LOBYTE(v11) = 0;
  }

  if (([a1 constraints] & 1) != 0 && (v10 & 1) == 0)
  {
    uint64_t v14 = v22;
    if (v22)
    {
      v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F64670];
      uint64_t v29 = *MEMORY[0x263F08338];
      v30 = @"Constraints not met - assertion does not prevent suspension";
      v17 = NSDictionary;
      v18 = &v30;
      v19 = &v29;
LABEL_19:
      v20 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
      *(void *)uint64_t v14 = [v15 errorWithDomain:v16 code:4 userInfo:v20];

      uint64_t v14 = 0;
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if ((([a1 constraints] & 2) == 0) | v11 & 1)
  {
LABEL_16:
    uint64_t v14 = 1;
    goto LABEL_20;
  }
  uint64_t v14 = v22;
  if (v22)
  {
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F64670];
    uint64_t v27 = *MEMORY[0x263F08338];
    v28 = @"Constraints not met - assertion is not launching";
    v17 = NSDictionary;
    v18 = &v28;
    v19 = &v27;
    goto LABEL_19;
  }
LABEL_20:

  return v14;
}

@end