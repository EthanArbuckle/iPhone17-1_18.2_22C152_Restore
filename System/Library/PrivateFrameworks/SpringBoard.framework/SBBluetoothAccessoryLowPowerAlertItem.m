@interface SBBluetoothAccessoryLowPowerAlertItem
- (BOOL)wakeDisplay;
- (SBBluetoothAccessoryLowPowerAlertItem)initWithAccessory:(id)a3 batteryLevel:(int64_t)a4;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBBluetoothAccessoryLowPowerAlertItem

- (SBBluetoothAccessoryLowPowerAlertItem)initWithAccessory:(id)a3 batteryLevel:(int64_t)a4
{
  id v6 = a3;
  v7 = [(SBAlertItem *)self init];
  v8 = v7;
  if (v7)
  {
    v7->_batteryLevel = a4;
    uint64_t v9 = [v6 copy];
    accessoryName = v8->_accessoryName;
    v8->_accessoryName = (NSString *)v9;
  }
  return v8;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  v5 = [(SBAlertItem *)self alertController];
  id v6 = (void *)SBApp;
  v7 = [NSNumber numberWithDouble:(double)self->_batteryLevel / 100.0];
  v8 = [v6 formattedPercentStringForNumber:v7];

  uint64_t v9 = NSString;
  v10 = [MEMORY[0x1E4F28B50] mainBundle];
  v11 = [v10 localizedStringForKey:@"ACCESSORY_LOW_POWER_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  v12 = objc_msgSend(v9, "stringWithFormat:", v11, self->_accessoryName);

  v13 = NSString;
  v14 = [MEMORY[0x1E4F28B50] mainBundle];
  v15 = [v14 localizedStringForKey:@"ACCESSORY_LOW_POWER_MESSAGE" value:&stru_1F3084718 table:@"SpringBoard"];
  v16 = objc_msgSend(v13, "stringWithFormat:", v15, v8);

  [v5 setTitle:v12];
  [v5 setMessage:v16];
  if (!a3)
  {
    v17 = (void *)MEMORY[0x1E4F42720];
    v18 = [MEMORY[0x1E4F28B50] mainBundle];
    v19 = [v18 localizedStringForKey:@"CLOSE" value:&stru_1F3084718 table:@"SpringBoard"];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__SBBluetoothAccessoryLowPowerAlertItem_configure_requirePasscodeForActions___block_invoke;
    v22[3] = &unk_1E6AF4918;
    v22[4] = self;
    v20 = [v17 actionWithTitle:v19 style:1 handler:v22];
    [v5 addAction:v20];
  }
}

uint64_t __77__SBBluetoothAccessoryLowPowerAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deactivateForButton];
}

- (BOOL)wakeDisplay
{
  return 1;
}

- (void).cxx_destruct
{
}

@end