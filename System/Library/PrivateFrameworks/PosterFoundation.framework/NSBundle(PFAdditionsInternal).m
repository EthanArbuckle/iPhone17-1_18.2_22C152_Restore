@interface NSBundle(PFAdditionsInternal)
- (_PFRoleManifest)pf_roleManifest;
@end

@implementation NSBundle(PFAdditionsInternal)

- (_PFRoleManifest)pf_roleManifest
{
  objc_getAssociatedObject(a1, "roleManifest");
  v2 = (_PFRoleManifest *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [_PFRoleManifest alloc];
    v4 = [a1 infoDictionary];
    v2 = [(_PFRoleManifest *)v3 initWithInfoDictionary:v4];

    objc_setAssociatedObject(a1, "roleManifest", v2, (void *)1);
  }
  return v2;
}

@end