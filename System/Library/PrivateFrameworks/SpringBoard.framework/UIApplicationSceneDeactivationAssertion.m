@interface UIApplicationSceneDeactivationAssertion
@end

@implementation UIApplicationSceneDeactivationAssertion

uint64_t __116__UIApplicationSceneDeactivationAssertion_SBWindowScene__sb_acquireWithPredicate_transitionContext_displayIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7 && !(*(unsigned int (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6))
  {
    uint64_t v9 = 0;
  }
  else if (*(void *)(a1 + 32))
  {
    v8 = objc_msgSend(v6, "sb_displayIdentityForSceneManagers");
    uint64_t v9 = [v8 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

@end