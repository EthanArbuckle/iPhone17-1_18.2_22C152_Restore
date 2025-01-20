@interface RBSAttribute(RBProcessState)
+ (uint64_t)allowedForPrimitiveAttributeForProcessTarget:()RBProcessState withError:;
- (uint64_t)allowedWithAttribute:()RBProcessState error:;
- (uint64_t)effectiveAttributesWithContext:()RBProcessState;
- (uint64_t)hasMandatoryAttributes:()RBProcessState error:;
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (uint64_t)preventsSuspension;
@end

@implementation RBSAttribute(RBProcessState)

- (uint64_t)hasMandatoryAttributes:()RBProcessState error:
{
  return 1;
}

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  return 1;
}

+ (uint64_t)allowedForPrimitiveAttributeForProcessTarget:()RBProcessState withError:
{
  v22[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![v6 targetIsSystem])
  {
    v11 = [v6 originatorEntitlements];
    if (([v6 ignoreRestrictions] & 1) != 0
      || ([v11 hasEntitlement:@"com.apple.runningboard.primitiveattribute"] & 1) != 0)
    {
      a4 = 1;
      goto LABEL_8;
    }
    if (!a4) {
      goto LABEL_8;
    }
    v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F64670];
    uint64_t v16 = *MEMORY[0x263F08338];
    v20[0] = @"Required client entitlement is missing";
    uint64_t v17 = *MEMORY[0x263F64668];
    v19[0] = v16;
    v19[1] = v17;
    v12 = [a1 description];
    v20[1] = v12;
    v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    *(void *)a4 = [v14 errorWithDomain:v15 code:2 userInfo:v18];

LABEL_4:
    a4 = 0;
LABEL_8:

    goto LABEL_9;
  }
  if (a4)
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F64670];
    uint64_t v9 = *MEMORY[0x263F08338];
    v22[0] = @"Attribute is not applicable to system target";
    uint64_t v10 = *MEMORY[0x263F64668];
    v21[0] = v9;
    v21[1] = v10;
    v11 = [a1 description];
    v22[1] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    *(void *)a4 = [v7 errorWithDomain:v8 code:2 userInfo:v12];
    goto LABEL_4;
  }
LABEL_9:

  return a4;
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return 1;
}

- (uint64_t)effectiveAttributesWithContext:()RBProcessState
{
  return [MEMORY[0x263EFFA08] setWithObject:a1];
}

- (uint64_t)preventsSuspension
{
  return 0;
}

@end