@interface RBSCoalitionLevelGrant(ProcessState)
- (uint64_t)isValidForContext:()ProcessState withError:;
- (void)applyToProcessState:()ProcessState attributePath:context:;
@end

@implementation RBSCoalitionLevelGrant(ProcessState)

- (void)applyToProcessState:()ProcessState attributePath:context:
{
  id v7 = a3;
  unint64_t v4 = [v7 coalitionLevel];
  unint64_t v5 = [a1 coalitionLevel];
  if (v4 <= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v4;
  }
  [v7 setCoalitionLevel:v6];
}

- (uint64_t)isValidForContext:()ProcessState withError:
{
  return objc_msgSend(MEMORY[0x263F64420], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

@end