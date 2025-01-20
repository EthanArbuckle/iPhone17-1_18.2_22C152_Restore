@interface _SBSystemKeyCommandCoalitionPolicyEnforcer
- (id)deferringTargetForPolicy:(id)a3;
@end

@implementation _SBSystemKeyCommandCoalitionPolicyEnforcer

- (id)deferringTargetForPolicy:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F4F368];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 sbWindowSceneAncestor];

  v7 = [v6 windows];
  v8 = [v7 firstObject];

  v9 = objc_msgSend(MEMORY[0x1E4F4F290], "tokenForIdentifierOfCAContext:", objc_msgSend(v8, "_contextId"));
  [v5 setToken:v9];

  return v5;
}

@end