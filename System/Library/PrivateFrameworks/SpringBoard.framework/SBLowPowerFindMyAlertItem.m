@interface SBLowPowerFindMyAlertItem
+ (void)_readSupportsFindMy:(id)a3;
+ (void)showFindMyAlert;
- (BOOL)shouldShowInLockScreen;
- (SPBeaconManager)beaconManager;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)setBeaconManager:(id)a3;
@end

@implementation SBLowPowerFindMyAlertItem

+ (void)showFindMyAlert
{
}

void __44__SBLowPowerFindMyAlertItem_showFindMyAlert__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = objc_alloc_init(SBLowPowerFindMyAlertItem);
    v2 = +[SBAlertItemsController sharedInstance];
    [v2 activateAlertItem:v3];
  }
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v6 = [(SBAlertItem *)self alertController];
  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"LOW_BATT_FIND_MY_TITLE"];
  v9 = [v7 localizedStringForKey:v8 value:&stru_1F3084718 table:@"SpringBoard"];

  v10 = [MEMORY[0x1E4F28B50] mainBundle];
  v11 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"LOW_BATT_FIND_MY"];
  v12 = [v10 localizedStringForKey:v11 value:&stru_1F3084718 table:@"SpringBoard"];

  [v6 setTitle:v9];
  [v6 setMessage:v12];
  if (!a3)
  {
    v13 = (void *)MEMORY[0x1E4F42720];
    v14 = [MEMORY[0x1E4F28B50] mainBundle];
    v15 = [v14 localizedStringForKey:@"OK" value:&stru_1F3084718 table:@"SpringBoard"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__SBLowPowerFindMyAlertItem_configure_requirePasscodeForActions___block_invoke;
    v17[3] = &unk_1E6AF4918;
    v17[4] = self;
    v16 = [v13 actionWithTitle:v15 style:1 handler:v17];
    [v6 addAction:v16];
  }
}

void __65__SBLowPowerFindMyAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F97C08]);
  [*(id *)(a1 + 32) setBeaconManager:v2];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__SBLowPowerFindMyAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v3[3] = &unk_1E6AF4AC0;
  v3[4] = *(void *)(a1 + 32);
  [v2 setUserHasAcknowledgedFindMy:1 completion:v3];
}

void __65__SBLowPowerFindMyAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__SBLowPowerFindMyAlertItem_configure_requirePasscodeForActions___block_invoke_3;
  block[3] = &unk_1E6AF4AC0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __65__SBLowPowerFindMyAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setBeaconManager:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 deactivateForButton];
}

- (BOOL)shouldShowInLockScreen
{
  id v2 = [(id)SBApp notificationDispatcher];
  char v3 = [v2 isCarDestinationActive];

  return v3;
}

+ (void)_readSupportsFindMy:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F97C08]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SBLowPowerFindMyAlertItem__readSupportsFindMy___block_invoke;
  v7[3] = &unk_1E6AFF0E8;
  id v8 = v4;
  id v9 = v3;
  id v5 = v4;
  id v6 = v3;
  [v5 isLPEMModeSupported:v7];
}

void __49__SBLowPowerFindMyAlertItem__readSupportsFindMy___block_invoke(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SBLowPowerFindMyAlertItem__readSupportsFindMy___block_invoke_2;
  v4[3] = &unk_1E6AF7218;
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
  id v3 = self;
}

uint64_t __49__SBLowPowerFindMyAlertItem__readSupportsFindMy___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end