@interface RBSJetsamPriorityGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSJetsamPriorityGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x263F64420], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  id v5 = a3;
  unint64_t v4 = [a1 band];
  if (v4 > [v5 explicitJetsamBand]) {
    [v5 setExplicitJetsamBand:v4];
  }
}

@end