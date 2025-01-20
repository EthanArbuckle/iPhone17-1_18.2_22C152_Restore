@interface SBRegionallyRestrictedAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBRegionallyRestrictedAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v7 = [v6 localizedStringForKey:@"REGIONALLY_RESTRICTION_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setTitle:v7];

  v8 = [MEMORY[0x1E4F28B50] mainBundle];
  v9 = [v8 localizedStringForKey:@"REGIONALLY_RESTRICTION_BODY" value:&stru_1F3084718 table:@"SpringBoard"];
  [v5 setMessage:v9];

  v10 = (void *)MEMORY[0x1E4F42720];
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v12 = [v11 localizedStringForKey:@"OK" value:&stru_1F3084718 table:@"SpringBoard"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__SBRegionallyRestrictedAlertItem_configure_requirePasscodeForActions___block_invoke;
  v14[3] = &unk_1E6AF4918;
  v14[4] = self;
  v13 = [v10 actionWithTitle:v12 style:0 handler:v14];
  [v5 addAction:v13];
}

uint64_t __71__SBRegionallyRestrictedAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)dismissOnLock
{
  return 1;
}

@end