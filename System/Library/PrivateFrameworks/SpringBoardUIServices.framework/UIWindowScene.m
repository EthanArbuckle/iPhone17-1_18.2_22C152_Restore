@interface UIWindowScene
@end

@implementation UIWindowScene

void __105__UIWindowScene_SBSUIScreenSharingOverlaySceneSpecification__setSBSUI_preferredSystemRootLayerTransform___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"SBSUIScreenSharingOverlaySceneSpecification.m", 61, @"*** setSBSUI_preferredSystemRootLayerTransform: is unavailable for this window scene. If this message surprises you, contact your friendly SBSUI engineer. ***" object file lineNumber description];
  }
  long long v4 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v4;
  v7[2] = *(_OWORD *)(a1 + 80);
  v5 = [MEMORY[0x1E4F29238] valueWithCGAffineTransform:v7];
  [v3 setPreferredSystemRootTransform:v5];
}

void __73__UIWindowScene_SBSUIHearingTestModeAdditions__SBSUI_setHearingTestMode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 setHearingTestMode:*(void *)(a1 + 32)];
  }
}

@end