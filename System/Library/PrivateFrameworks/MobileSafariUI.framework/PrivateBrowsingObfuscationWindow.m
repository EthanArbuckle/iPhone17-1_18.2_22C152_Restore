@interface PrivateBrowsingObfuscationWindow
+ (id)showPrivateBrowsingObfuscationWindowForApplicationWindow:(id)a3;
- (BOOL)_canAffectStatusBarAppearance;
@end

@implementation PrivateBrowsingObfuscationWindow

+ (id)showPrivateBrowsingObfuscationWindowForApplicationWindow:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1CB0];
  id v4 = a3;
  if (_SFDeviceIsPad()) {
    v5 = @"LaunchPrivateBrowsing-iPad";
  }
  else {
    v5 = @"LaunchPrivateBrowsing";
  }
  v6 = [v3 storyboardWithName:v5 bundle:0];
  v7 = [v6 instantiateInitialViewController];
  v8 = [PrivateBrowsingObfuscationWindow alloc];
  v9 = [v4 windowScene];

  v10 = [(PrivateBrowsingObfuscationWindow *)v8 initWithWindowScene:v9];
  [(PrivateBrowsingObfuscationWindow *)v10 setRootViewController:v7];
  [(PrivateBrowsingObfuscationWindow *)v10 setWindowLevel:*MEMORY[0x1E4FB2F18] + -1.0];
  [(PrivateBrowsingObfuscationWindow *)v10 makeKeyAndVisible];

  return v10;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

@end