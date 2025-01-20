@interface RBSAssertion(PosterUIFoundation)
+ (id)pui_posterRuntimeAssertionForTarget:()PosterUIFoundation explanation:sceneType:auditToken:posterProviderBundleIdentifier:;
@end

@implementation RBSAssertion(PosterUIFoundation)

+ (id)pui_posterRuntimeAssertionForTarget:()PosterUIFoundation explanation:sceneType:auditToken:posterProviderBundleIdentifier:
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  if ([v12 isEqualToString:@"PosterKit.rendering"])
  {
    v18 = [v13 valueForEntitlement:@"com.apple.posterkit.enhanced-memory-limits"];
    if (objc_opt_respondsToSelector())
    {
      int v19 = [v18 BOOLValue];
      int v20 = PFBundleIdentifierRequiresMemoryHogAssertion();
      v21 = (id *)MEMORY[0x263F5F478];
      if ((v19 & v20) != 0) {
        v21 = (id *)MEMORY[0x263F5F480];
      }
      if (v19) {
        goto LABEL_11;
      }
    }
    else
    {
      PFBundleIdentifierRequiresMemoryHogAssertion();
    }
    v21 = (id *)MEMORY[0x263F5F488];
LABEL_11:
    id v22 = *v21;

    goto LABEL_13;
  }
  if (PUISceneRoleIsEditing(v12, v17)) {
    id v22 = (id)*MEMORY[0x263F5F470];
  }
  else {
    id v22 = 0;
  }
LABEL_13:
  v23 = objc_msgSend(a1, "pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:", v16, v22, v15, 0);

  return v23;
}

@end