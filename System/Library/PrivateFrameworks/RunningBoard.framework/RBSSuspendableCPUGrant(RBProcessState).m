@interface RBSSuspendableCPUGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSSuspendableCPUGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x263F64420], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v5 = a3;
  uint64_t v4 = [a1 role];
  if (v4 > [v5 role]) {
    [v5 setRole:v4];
  }
}

@end