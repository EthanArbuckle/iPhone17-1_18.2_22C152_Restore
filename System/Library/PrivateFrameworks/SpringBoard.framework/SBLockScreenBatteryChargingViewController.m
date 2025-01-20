@interface SBLockScreenBatteryChargingViewController
- (BOOL)batteryVisible;
- (SBLockScreenBatteryChargingViewControllerDelegate)delegate;
- (id)chargingView;
- (id)initForDisplayOfBattery:(BOOL)a3;
- (int64_t)presentationStyle;
- (void)_clearVisibilityTimer;
- (void)_visibilityTimerFired:(id)a3;
- (void)connectedDevicesDidChange:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)presentWithAnimation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)showChargeLevelWithBatteryVisible:(BOOL)a3;
@end

@implementation SBLockScreenBatteryChargingViewController

- (id)initForDisplayOfBattery:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBLockScreenBatteryChargingViewController;
  v4 = [(CSCoverSheetViewControllerBase *)&v13 initWithNibName:0 bundle:0];
  p_isa = (id *)&v4->super.super.super.super.isa;
  if (v4)
  {
    v4->_shouldDisplayBattery = a3;
    id v6 = objc_alloc_init(MEMORY[0x1E4F4F9D0]);
    id v7 = p_isa[135];
    p_isa[135] = v6;

    v8 = [p_isa[135] connectedDevices];
    uint64_t v9 = [v8 mutableCopy];
    id v10 = p_isa[134];
    p_isa[134] = (id)v9;

    v11 = [p_isa[134] indexesOfObjectsPassingTest:&__block_literal_global_258];
    [p_isa[134] removeObjectsAtIndexes:v11];
  }
  return p_isa;
}

uint64_t __69__SBLockScreenBatteryChargingViewController_initForDisplayOfBattery___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPowerSource] ^ 1;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBLockScreenBatteryChargingViewController;
  [(CSCoverSheetViewControllerBase *)&v4 dealloc];
}

- (void)loadView
{
  if (self->_shouldDisplayBattery && (unint64_t)[(NSMutableArray *)self->_connectedDevices count] > 1)
  {
    v3 = [MEMORY[0x1E4F5E3A0] batteryChargingViewWithDoubleBattery];
    int v5 = 0;
    int v4 = 1;
  }
  else
  {
    v3 = [MEMORY[0x1E4F5E3A0] batteryChargingViewWithSingleBattery];
    int v4 = 0;
    int v5 = 1;
  }
  objc_storeStrong((id *)&self->_chargingView, v3);
  if (v4) {

  }
  if (v5) {
  [(BCBatteryDeviceController *)self->_batteryDeviceController addBatteryDeviceObserver:self queue:MEMORY[0x1E4F14428]];
  }
  chargingView = self->_chargingView;
  [(SBLockScreenBatteryChargingViewController *)self setView:chargingView];
}

- (void)presentWithAnimation:(BOOL)a3
{
  int v5 = [(SBLockScreenBatteryChargingViewController *)self view];
  [v5 setAlpha:0.0];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__SBLockScreenBatteryChargingViewController_presentWithAnimation___block_invoke;
  v8[3] = &unk_1E6B07768;
  v8[4] = self;
  BOOL v9 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__SBLockScreenBatteryChargingViewController_presentWithAnimation___block_invoke_2;
  v6[3] = &unk_1E6AFAC80;
  BOOL v7 = a3;
  v6[4] = self;
  [(CSCoverSheetViewControllerBase *)self updateAppearance:v8 completion:v6];
}

id __66__SBLockScreenBatteryChargingViewController_presentWithAnimation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setComponents:0];
  if ([*(id *)(*(void *)(a1 + 32) + 1056) batteryVisible])
  {
    int v4 = [MEMORY[0x1E4F5E3C0] statusBar];
    int v5 = [v4 priority:40];
    id v6 = [v5 hidden:1];
    [v3 addComponent:v6];

    BOOL v7 = [MEMORY[0x1E4F5E3C0] dateView];
    v8 = [v7 priority:40];
    BOOL v9 = [v8 hidden:1];
    id v10 = [v9 string:&stru_1F3084718];
    [v3 addComponent:v10];

    v11 = [MEMORY[0x1E4F5E3C0] backgroundContent];
    v12 = [v11 priority:40];
    objc_super v13 = [v12 hidden:1];
    [v3 addComponent:v13];

    v14 = [MEMORY[0x1E4F5E3C0] pageContent];
    v15 = [v14 priority:40];
    [v15 hidden:1];
  }
  else
  {
    v14 = [MEMORY[0x1E4F5E3C0] dateView];
    v15 = [v14 priority:40];
    [v15 string:&stru_1F3084718];
  v16 = };
  [v3 addComponent:v16];

  if (*(unsigned char *)(a1 + 40))
  {
    v17 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.25];
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

void __66__SBLockScreenBatteryChargingViewController_presentWithAnimation___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.25];
  }
  else
  {
    v2 = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__SBLockScreenBatteryChargingViewController_presentWithAnimation___block_invoke_3;
  v3[3] = &unk_1E6AF4AC0;
  v3[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4F4F898] animateWithSettings:v2 actions:v3];
}

void __66__SBLockScreenBatteryChargingViewController_presentWithAnimation___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

- (void)_clearVisibilityTimer
{
  [(NSTimer *)self->_visibilityTimer invalidate];
  visibilityTimer = self->_visibilityTimer;
  self->_visibilityTimer = 0;
}

- (BOOL)batteryVisible
{
  return [(CSBatteryChargingView *)self->_chargingView batteryVisible];
}

- (id)chargingView
{
  uint64_t v3 = objc_opt_class();
  int v4 = [(SBLockScreenBatteryChargingViewController *)self view];
  int v5 = SBSafeCast(v3, v4);

  return v5;
}

- (void)showChargeLevelWithBatteryVisible:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBLockScreenBatteryChargingViewController *)self _clearVisibilityTimer];
  [(CSBatteryChargingView *)self->_chargingView setAlpha:1.0];
  [(CSBatteryChargingView *)self->_chargingView setBatteryVisible:v3];
  int v5 = (void *)MEMORY[0x1E4F1CB00];
  [(CSBatteryChargingView *)self->_chargingView desiredVisibilityDuration];
  objc_msgSend(v5, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__visibilityTimerFired_, 0, 0);
  id v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  visibilityTimer = self->_visibilityTimer;
  self->_visibilityTimer = v6;

  id v8 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v8 addTimer:self->_visibilityTimer forMode:*MEMORY[0x1E4F1C4B0]];
}

- (void)_visibilityTimerFired:(id)a3
{
  [(SBLockScreenBatteryChargingViewController *)self _clearVisibilityTimer];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__SBLockScreenBatteryChargingViewController__visibilityTimerFired___block_invoke;
  v5[3] = &unk_1E6AF4AC0;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__SBLockScreenBatteryChargingViewController__visibilityTimerFired___block_invoke_2;
  v4[3] = &unk_1E6AF5350;
  v4[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v5 animations:v4 completion:0.25];
}

uint64_t __67__SBLockScreenBatteryChargingViewController__visibilityTimerFired___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1056) setAlpha:0.0];
}

void __67__SBLockScreenBatteryChargingViewController__visibilityTimerFired___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1088));
  [WeakRetained chargingViewControllerFadedOutContent:*(void *)(a1 + 32)];
}

- (int64_t)presentationStyle
{
  return 1;
}

- (void)connectedDevicesDidChange:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    uint64_t v8 = *MEMORY[0x1E4F4F9D8];
    BOOL v9 = &OBJC_IVAR___SBRemovalDodgingModifierEvent__identifier;
    id v24 = v4;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
        if (*((unsigned char *)&self->super.super.super.super.isa + v9[776])
          && (unint64_t)[(NSMutableArray *)self->_connectedDevices count] > 1)
        {
          if ([v11 isInternal])
          {
LABEL_11:
            chargingView = self->_chargingView;
            objc_super v13 = SBLockScreenChargePercentageLabelForBattery(v11);
            [(CSBatteryChargingView *)chargingView setPrimaryBatteryText:v13 forBattery:v11];
LABEL_12:

            goto LABEL_13;
          }
          v14 = [v11 identifier];
          v15 = [(NSMutableArray *)self->_connectedDevices objectAtIndex:1];
          v16 = [v15 identifier];
          uint64_t v17 = v8;
          int v18 = [v14 isEqualToString:v16];

          uint64_t v19 = [v11 productIdentifier];
          BOOL v20 = v18 == 0;
          uint64_t v8 = v17;
          BOOL v20 = v20 || v19 == v17;
          if (!v20)
          {
            v22 = self->_chargingView;
            objc_super v13 = SBLockScreenChargePercentageLabelForBattery(v11);
            [(CSBatteryChargingView *)v22 setSecondaryBatteryText:v13 forBattery:v11];
            id v4 = v24;
            BOOL v9 = &OBJC_IVAR___SBRemovalDodgingModifierEvent__identifier;
            goto LABEL_12;
          }
          id v4 = v24;
          BOOL v9 = &OBJC_IVAR___SBRemovalDodgingModifierEvent__identifier;
          if (v19 == v8)
          {
            v21 = self->_chargingView;
            objc_super v13 = SBLockScreenSimpleChargePercentageLabelForBattery(v11);
            [(CSBatteryChargingView *)v21 setSecondaryBatteryText:v13 forBattery:v11];
            goto LABEL_12;
          }
        }
        else if ([v11 isInternal])
        {
          goto LABEL_11;
        }
LABEL_13:
        ++v10;
      }
      while (v6 != v10);
      uint64_t v23 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v6 = v23;
    }
    while (v23);
  }
}

- (SBLockScreenBatteryChargingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBLockScreenBatteryChargingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_connectedDevices, 0);
  objc_storeStrong((id *)&self->_visibilityTimer, 0);
  objc_storeStrong((id *)&self->_chargingView, 0);
}

@end