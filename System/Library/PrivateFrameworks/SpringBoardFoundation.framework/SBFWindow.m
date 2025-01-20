@interface SBFWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_isEffectivelyHiddenForKeyWindowStack;
- (BOOL)isInterfaceAutorotationDisabled;
- (_SBFKeyWindowStack)_keyWindowStack;
- (id)autorotationPreventionReasons;
- (id)hostedSceneIdentityTokens;
- (void)_makeKeyFromKeyWindowStack;
- (void)_setKeyWindowStack:(id)a3;
- (void)dealloc;
- (void)makeKeyWindow;
- (void)resignAsKeyWindow;
- (void)setHidden:(BOOL)a3;
@end

@implementation SBFWindow

- (void)makeKeyWindow
{
  if (__sb__runningInSpringBoard())
  {
    id v3 = [(SBFWindow *)self _keyWindowStack];
    [v3 pushKeyWindow:self];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBFWindow;
    [(SBFWindow *)&v4 makeKeyWindow];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (__sb__runningInSpringBoard())
  {
    int v5 = [(SBFWindow *)self isHidden];
    if (v3)
    {
      if ((v5 & 1) == 0)
      {
        p_isHiddenOverride = &self->_isHiddenOverride;
        isHiddenOverride = self->_isHiddenOverride;
        self->_isHiddenOverride = (NSNumber *)MEMORY[0x1E4F1CC38];

        v8 = [(SBFWindow *)self _keyWindowStack];
        [v8 noteWindowHidden:self];
LABEL_7:

        v10 = *p_isHiddenOverride;
        *p_isHiddenOverride = 0;
      }
    }
    else if (v5)
    {
      p_isHiddenOverride = &self->_isHiddenOverride;
      v9 = self->_isHiddenOverride;
      self->_isHiddenOverride = (NSNumber *)MEMORY[0x1E4F1CC28];

      v8 = [(SBFWindow *)self _keyWindowStack];
      [v8 noteWindowUnhidden:self];
      goto LABEL_7;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SBFWindow;
  [(SBFWindow *)&v11 setHidden:v3];
}

- (_SBFKeyWindowStack)_keyWindowStack
{
  keyWindowStack = self->_keyWindowStack;
  if (!keyWindowStack)
  {
    objc_super v4 = +[_SBFKeyWindowStack sharedInstance];
    int v5 = self->_keyWindowStack;
    self->_keyWindowStack = v4;

    keyWindowStack = self->_keyWindowStack;
  }
  return keyWindowStack;
}

- (void)_makeKeyFromKeyWindowStack
{
  v2.receiver = self;
  v2.super_class = (Class)SBFWindow;
  [(SBFWindow *)&v2 makeKeyWindow];
}

- (BOOL)_isEffectivelyHiddenForKeyWindowStack
{
  if (self->_isHiddenOverride) {
    return [(NSNumber *)self->_isHiddenOverride BOOLValue];
  }
  else {
    return [(SBFWindow *)self isHidden];
  }
}

- (BOOL)isInterfaceAutorotationDisabled
{
  return 1;
}

- (void)dealloc
{
  BOOL v3 = [(SBFWindow *)self _keyWindowStack];
  [v3 noteWindowDeallocated:self];

  v4.receiver = self;
  v4.super_class = (Class)SBFWindow;
  [(SBFWindow *)&v4 dealloc];
}

- (void)resignAsKeyWindow
{
  if (__sb__runningInSpringBoard())
  {
    id v3 = [(SBFWindow *)self _keyWindowStack];
    [v3 popKeyWindow:self];
  }
}

- (id)autorotationPreventionReasons
{
  return 0;
}

- (id)hostedSceneIdentityTokens
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (void)_setKeyWindowStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isHiddenOverride, 0);
  objc_storeStrong((id *)&self->_keyWindowStack, 0);
}

@end