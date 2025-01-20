@interface UIWindow(SelfHosting)
- (id)sb_hostWrapperForUseInOrientation:()SelfHosting hostRequester:;
- (id)sb_hostWrapperForUseInWindow:()SelfHosting hostRequester:;
@end

@implementation UIWindow(SelfHosting)

- (id)sb_hostWrapperForUseInWindow:()SelfHosting hostRequester:
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "sb_hostWrapperForUseInOrientation:hostRequester:", objc_msgSend(a3, "interfaceOrientation"), v6);

  return v7;
}

- (id)sb_hostWrapperForUseInOrientation:()SelfHosting hostRequester:
{
  id v6 = a4;
  v7 = [a1 windowScene];
  v8 = [v7 _FBSScene];
  v9 = [v8 identifier];
  v10 = +[SBWindowSelfHostWrapper wrapperForWindow:a1 orientation:a3 hostRequester:v6 sceneIdentifier:v9];

  return v10;
}

@end