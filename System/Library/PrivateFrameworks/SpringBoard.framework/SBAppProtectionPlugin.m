@interface SBAppProtectionPlugin
@end

@implementation SBAppProtectionPlugin

uint64_t __71___SBAppProtectionPlugin_setApplication_shielded_forOutlet_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _owningCoordinator];
  v3 = [v2 bundleIdentifiersToAssistants];
  v4 = [*(id *)(a1 + 40) bundleIdentifier];
  v5 = [v3 objectForKey:v4];
  [v5 setShouldShield:*(unsigned __int8 *)(a1 + 56)];

  v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v6();
}

@end