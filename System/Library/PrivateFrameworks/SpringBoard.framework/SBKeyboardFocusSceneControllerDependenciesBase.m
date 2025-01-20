@interface SBKeyboardFocusSceneControllerDependenciesBase
@end

@implementation SBKeyboardFocusSceneControllerDependenciesBase

uint64_t __98___SBKeyboardFocusSceneControllerDependenciesBase_isBannerKitHostingSceneWithIdentityTokenString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 scene];
    uint64_t v5 = objc_opt_class();
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v8 identityToken];
  v10 = [v9 stringRepresentation];
  uint64_t v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

  return v11;
}

@end