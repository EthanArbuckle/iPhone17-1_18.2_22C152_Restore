@interface UIWindowScene(SBSUIScreenSharingOverlaySceneSpecification)
- (void)SBSUI_preferredSystemRootLayerTransform;
- (void)setSBSUI_preferredSystemRootLayerTransform:()SBSUIScreenSharingOverlaySceneSpecification;
@end

@implementation UIWindowScene(SBSUIScreenSharingOverlaySceneSpecification)

- (void)SBSUI_preferredSystemRootLayerTransform
{
  v6 = [a1 _FBSScene];
  v7 = [v6 clientSettings];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"SBSUIScreenSharingOverlaySceneSpecification.m", 54, @"*** SBSUI_preferredSystemRootLayerTransform is unavailable for this window scene. If this message surprises you, contact your friendly SBSUI engineer. ***" object file lineNumber description];
  }
  id v13 = [a1 _FBSScene];
  v9 = [v13 clientSettings];
  v10 = [v9 preferredSystemRootTransform];
  v11 = v10;
  if (v10)
  {
    [v10 CGAffineTransformValue];
  }
  else
  {
    a3[1] = 0u;
    a3[2] = 0u;
    *a3 = 0u;
  }
}

- (void)setSBSUI_preferredSystemRootLayerTransform:()SBSUIScreenSharingOverlaySceneSpecification
{
  v6 = [a1 _FBSScene];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__UIWindowScene_SBSUIScreenSharingOverlaySceneSpecification__setSBSUI_preferredSystemRootLayerTransform___block_invoke;
  v8[3] = &unk_1E5CCCD80;
  v8[4] = a1;
  v8[5] = a2;
  long long v7 = a3[1];
  long long v9 = *a3;
  long long v10 = v7;
  long long v11 = a3[2];
  [v6 updateClientSettings:v8];
}

@end