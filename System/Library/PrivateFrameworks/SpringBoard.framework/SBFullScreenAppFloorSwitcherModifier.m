@interface SBFullScreenAppFloorSwitcherModifier
@end

@implementation SBFullScreenAppFloorSwitcherModifier

BOOL __59___SBFullScreenAppFloorSwitcherModifier_frameForAppLayout___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 itemForLayoutRole:4];

  return v4 != v3;
}

BOOL __73___SBFullScreenAppFloorSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned char *)(a1 + 32) || [a2 environment] != 3;
}

uint64_t __65___SBFullScreenAppFloorSwitcherModifier_handleTapAppLayoutEvent___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 itemForLayoutRole:1];
  int v5 = [v3 isEqual:v4];

  return v5 ^ 1u;
}

@end