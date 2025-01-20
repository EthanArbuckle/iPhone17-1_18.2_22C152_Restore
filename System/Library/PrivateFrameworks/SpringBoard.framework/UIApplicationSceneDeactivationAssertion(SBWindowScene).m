@interface UIApplicationSceneDeactivationAssertion(SBWindowScene)
- (uint64_t)sb_acquireForDisplayIdentity:()SBWindowScene;
- (void)sb_acquireWithPredicate:()SBWindowScene transitionContext:displayIdentity:;
@end

@implementation UIApplicationSceneDeactivationAssertion(SBWindowScene)

- (void)sb_acquireWithPredicate:()SBWindowScene transitionContext:displayIdentity:
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __116__UIApplicationSceneDeactivationAssertion_SBWindowScene__sb_acquireWithPredicate_transitionContext_displayIdentity___block_invoke;
  v12[3] = &unk_1E6B07E60;
  id v13 = v9;
  id v14 = v8;
  id v10 = v9;
  id v11 = v8;
  [a1 acquireWithPredicate:v12 transitionContext:a4];
}

- (uint64_t)sb_acquireForDisplayIdentity:()SBWindowScene
{
  return objc_msgSend(a1, "sb_acquireWithPredicate:transitionContext:displayIdentity:", 0, 0, a3);
}

@end