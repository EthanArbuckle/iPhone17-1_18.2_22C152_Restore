@interface UIRemoteKeyboardWindowHosted
+ (BOOL)_isHostedInAnotherProcess;
+ (BOOL)_isSecure;
- (BOOL)_isTextEffectsWindowHosting;
- (CGSize)keyboardScreenReferenceSize;
- (double)_adjustedWindowLevelFromLevel:(double)a3;
- (double)keyboardWidthForCurrentDevice;
- (int64_t)_orientationForRootTransform;
- (int64_t)_orientationForSceneTransform;
- (int64_t)_orientationForViewTransform;
@end

@implementation UIRemoteKeyboardWindowHosted

+ (BOOL)_isSecure
{
  return 1;
}

+ (BOOL)_isHostedInAnotherProcess
{
  if (qword_1EB25C688 != -1) {
    dispatch_once(&qword_1EB25C688, &__block_literal_global_237);
  }
  if (!byte_1EB25C66A) {
    return 1;
  }
  v2 = +[UIWindow _applicationKeyWindow];
  v3 = v2;
  if (v2) {
    char v4 = [v2 _isHostedInAnotherProcess];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

void __57__UIRemoteKeyboardWindowHosted__isHostedInAnotherProcess__block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EB25C66A = [v0 isEqualToString:@"com.apple.InCallService"];
}

- (double)_adjustedWindowLevelFromLevel:(double)a3
{
  if (dyld_program_sdk_at_least()
    && (_UIApplicationIsSystemApplication() & 1) == 0
    && ([(id)UIApp _isSpringBoard] & 1) == 0
    && !_AXSProcessDrawsAssistiveUI())
  {
    return -9999999.0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIRemoteKeyboardWindowHosted;
  [(UIRemoteKeyboardWindow *)&v6 _adjustedWindowLevelFromLevel:a3];
  return result;
}

- (int64_t)_orientationForViewTransform
{
  return 1;
}

- (int64_t)_orientationForRootTransform
{
  return 1;
}

- (int64_t)_orientationForSceneTransform
{
  return 1;
}

- (BOOL)_isTextEffectsWindowHosting
{
  return 0;
}

- (CGSize)keyboardScreenReferenceSize
{
  MEMORY[0x1F411C9F8](self, a2);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)keyboardWidthForCurrentDevice
{
  unint64_t v3 = [(UITextEffectsWindow *)self interfaceOrientation] - 1;
  [(UIRemoteKeyboardWindowHosted *)self keyboardScreenReferenceSize];
  if (v3 >= 2) {
    return v5;
  }
  return result;
}

@end