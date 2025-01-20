@interface PFRoleManifest
@end

@implementation PFRoleManifest

id __36___PFRoleManifest_rawSupportedRoles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (PFPosterRoleIsValid(v2)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void __38___PFRoleManifest_knownSupportedRoles__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = PFProvidersForRole(v4);
  if ([v3 containsObject:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

@end