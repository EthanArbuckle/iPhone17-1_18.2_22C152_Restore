@interface RBSForceRoleManageAttribute(RBProcessState)
- (uint64_t)applyToProcessState:()RBProcessState attributePath:context:;
- (uint64_t)isValidForContext:()RBProcessState withError:;
@end

@implementation RBSForceRoleManageAttribute(RBProcessState)

- (uint64_t)applyToProcessState:()RBProcessState attributePath:context:
{
  return [a3 setForceRoleManage:1];
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x263F64420], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

@end