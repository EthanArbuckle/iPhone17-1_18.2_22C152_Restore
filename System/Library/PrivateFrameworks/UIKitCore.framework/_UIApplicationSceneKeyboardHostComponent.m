@interface _UIApplicationSceneKeyboardHostComponent
- (BOOL)suppressKeyboardFocusRequests;
- (id)suppressKeyboardFocusRequestsForReason:(id)a3;
- (void)evaluateKeyboardSuppressionSettingForActiveAssertions;
- (void)setHardwareKeyboardExclusivityIdentifier:(id)a3;
- (void)setKeyboardDockDisabled:(BOOL)a3 forSettings:(id)a4;
- (void)setMinimumKeyboardPadding:(UIEdgeInsets)a3 forSettings:(id)a4;
- (void)setScene:(id)a3;
@end

@implementation _UIApplicationSceneKeyboardHostComponent

- (void)setScene:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIApplicationSceneKeyboardHostComponent;
  [(FBSSceneComponent *)&v4 setScene:a3];
  [(_UIApplicationSceneKeyboardHostComponent *)self setHardwareKeyboardExclusivityIdentifier:0];
}

- (void)setHardwareKeyboardExclusivityIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(FBSSceneComponent *)self hostScene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85___UIApplicationSceneKeyboardHostComponent_setHardwareKeyboardExclusivityIdentifier___block_invoke;
  v7[3] = &unk_1E53056C0;
  id v8 = v4;
  id v6 = v4;
  [v5 updateSettings:v7];
}

- (void)setMinimumKeyboardPadding:(UIEdgeInsets)a3 forSettings:(id)a4
{
}

- (void)setKeyboardDockDisabled:(BOOL)a3 forSettings:(id)a4
{
}

- (BOOL)suppressKeyboardFocusRequests
{
  v2 = [(FBSSceneComponent *)self hostScene];
  v3 = [v2 settings];
  char v4 = [v3 suppressKeyboardFocusRequests];

  return v4;
}

- (id)suppressKeyboardFocusRequestsForReason:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [v6 UUIDString];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __83___UIApplicationSceneKeyboardHostComponent_suppressKeyboardFocusRequestsForReason___block_invoke;
  v13 = &unk_1E52E04F8;
  objc_copyWeak(&v14, &location);
  id v8 = (void *)[v5 initWithIdentifier:v7 forReason:v4 invalidationBlock:&v10];

  ++*((_DWORD *)&self->super._invalid + 1);
  [(_UIApplicationSceneKeyboardHostComponent *)self evaluateKeyboardSuppressionSettingForActiveAssertions];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

- (void)evaluateKeyboardSuppressionSettingForActiveAssertions
{
  int v3 = *((_DWORD *)&self->super._invalid + 1);
  if ((v3 != 0) != [(_UIApplicationSceneKeyboardHostComponent *)self suppressKeyboardFocusRequests])
  {
    id v4 = [(FBSSceneComponent *)self hostScene];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __97___UIApplicationSceneKeyboardHostComponent_evaluateKeyboardSuppressionSettingForActiveAssertions__block_invoke;
    v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
    BOOL v6 = v3 != 0;
    [v4 updateSettings:v5];
  }
}

@end