@interface RBSGPUAccessGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSGPUAccessGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x263F64420], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v5 = a3;
  unsigned int v4 = [a1 role];
  if (v4 > [v5 gpuRole]) {
    objc_msgSend(v5, "setGPURole:", objc_msgSend(a1, "role"));
  }
}

@end