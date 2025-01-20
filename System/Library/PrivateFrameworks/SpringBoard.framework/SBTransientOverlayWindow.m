@interface SBTransientOverlayWindow
+ (BOOL)sb_autorotates;
- (BOOL)_canBecomeKeyWindow;
- (id)hostedSceneIdentityTokens;
@end

@implementation SBTransientOverlayWindow

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

+ (BOOL)sb_autorotates
{
  return SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleTransientOverlay") ^ 1;
}

- (id)hostedSceneIdentityTokens
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  v4 = [(UIWindow *)self _sbWindowScene];
  v5 = v4;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = objc_msgSend(v4, "transientOverlayPresenter", 0);
    v7 = [v6 presentedViewControllers];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) hostedSceneIdentityTokens];
          [v3 addObjectsFromArray:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  if ([v3 count])
  {
    v13 = [v3 allObjects];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end