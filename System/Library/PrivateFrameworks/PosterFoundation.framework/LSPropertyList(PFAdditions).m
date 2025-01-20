@interface LSPropertyList(PFAdditions)
- (id)pf_defaultRole;
- (id)pf_supportedRoles;
@end

@implementation LSPropertyList(PFAdditions)

- (id)pf_supportedRoles
{
  v1 = objc_msgSend(a1, "pf_roleManifest");
  v2 = objc_msgSend(v1, "pf_supportedRoles");

  return v2;
}

- (id)pf_defaultRole
{
  v1 = objc_msgSend(a1, "pf_roleManifest");
  v2 = objc_msgSend(v1, "pf_defaultRole");

  return v2;
}

@end