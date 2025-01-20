@interface SBXXLocalizedApplicationNameForDisplayIdentifier
@end

@implementation SBXXLocalizedApplicationNameForDisplayIdentifier

void ___SBXXLocalizedApplicationNameForDisplayIdentifier_block_invoke(uint64_t a1)
{
  id v7 = +[SBIconController sharedInstance];
  v2 = [v7 model];
  v3 = [v2 bookmarkIconForWebClipIdentifier:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 displayNameForLocation:*MEMORY[0x1E4FA66C8]];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

@end