@interface SBTestAlertItem
+ (id)alertItemWithShowInLockScreen:(BOOL)a3 forcesModal:(BOOL)a4 superModal:(BOOL)a5;
- (BOOL)allowLockScreenDismissal;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)behavesSuperModally;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (NSString)message;
- (NSString)title;
- (id)description;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)setAllowLockScreenDismissal:(BOOL)a3;
- (void)setAllowMenuButtonDismissal:(BOOL)a3;
- (void)setBehavesSuperModally:(BOOL)a3;
- (void)setForcesModalAlertAppearance:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setReappearsAfterLock:(BOOL)a3;
- (void)setReappearsAfterUnlock:(BOOL)a3;
- (void)setShouldShowInLockScreen:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation SBTestAlertItem

+ (id)alertItemWithShowInLockScreen:(BOOL)a3 forcesModal:(BOOL)a4 superModal:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setShouldShowInLockScreen:v7];
  [v8 setForcesModalAlertAppearance:v6];
  [v8 setBehavesSuperModally:v5];
  return v8;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  BOOL v5 = [(SBAlertItem *)self alertController];
  BOOL v6 = [(SBTestAlertItem *)self title];
  [v5 setTitle:v6];

  if (self->_message)
  {
    objc_msgSend(v5, "setMessage:");
  }
  else
  {
    if (self->_shouldShowInLockScreen) {
      BOOL v7 = @"appears";
    }
    else {
      BOOL v7 = @"does not appear";
    }
    if (self->_forcesModalAlertAppearance) {
      id v8 = @"forces";
    }
    else {
      id v8 = @"does not force";
    }
    if (self->_behavesSuperModally) {
      v9 = @"is";
    }
    else {
      v9 = @"is not";
    }
    v10 = [NSString stringWithFormat:@"This alert item %@ on the lockscreen, %@ modal appearance and %@ supermodal", v7, v8, v9];
    [v5 setMessage:v10];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__SBTestAlertItem_configure_requirePasscodeForActions___block_invoke;
  v12[3] = &unk_1E6AF4918;
  v12[4] = self;
  v11 = [MEMORY[0x1E4F42720] actionWithTitle:@"Dismiss" style:1 handler:v12];
  [v5 addAction:v11];
}

uint64_t __55__SBTestAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p - title: %@>", objc_opt_class(), self, self->_title];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (BOOL)shouldShowInLockScreen
{
  return self->_shouldShowInLockScreen;
}

- (void)setShouldShowInLockScreen:(BOOL)a3
{
  self->_shouldShowInLockScreen = a3;
}

- (BOOL)forcesModalAlertAppearance
{
  return self->_forcesModalAlertAppearance;
}

- (void)setForcesModalAlertAppearance:(BOOL)a3
{
  self->_forcesModalAlertAppearance = a3;
}

- (BOOL)behavesSuperModally
{
  return self->_behavesSuperModally;
}

- (void)setBehavesSuperModally:(BOOL)a3
{
  self->_behavesSuperModally = a3;
}

- (BOOL)allowMenuButtonDismissal
{
  return self->_allowMenuButtonDismissal;
}

- (void)setAllowMenuButtonDismissal:(BOOL)a3
{
  self->_allowMenuButtonDismissal = a3;
}

- (BOOL)allowLockScreenDismissal
{
  return self->_allowLockScreenDismissal;
}

- (void)setAllowLockScreenDismissal:(BOOL)a3
{
  self->_allowLockScreenDismissal = a3;
}

- (BOOL)reappearsAfterUnlock
{
  return self->_reappearsAfterUnlock;
}

- (void)setReappearsAfterUnlock:(BOOL)a3
{
  self->_reappearsAfterUnlock = a3;
}

- (BOOL)reappearsAfterLock
{
  return self->_reappearsAfterLock;
}

- (void)setReappearsAfterLock:(BOOL)a3
{
  self->_reappearsAfterLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end