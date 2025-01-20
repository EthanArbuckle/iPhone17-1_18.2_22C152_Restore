@interface RBSResistTerminationGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSResistTerminationGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x263F64420], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v5 = a3;
  uint64_t v4 = [a1 resistance];
  if (v4 > [v5 terminationResistance]) {
    [v5 setTerminationResistance:v4];
  }
}

@end