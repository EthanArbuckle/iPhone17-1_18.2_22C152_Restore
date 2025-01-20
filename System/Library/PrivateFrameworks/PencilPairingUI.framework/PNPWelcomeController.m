@interface PNPWelcomeController
+ (id)bundleImageNamed:(id)a3;
+ (id)bundleImageNamed:(id)a3 renderingMode:(int64_t)a4;
+ (id)controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6;
- (BOOL)_canShowWhileLocked;
- (BOOL)isRTL;
- (OBTrayButton)trayButton;
- (PNPWelcomeControllerDelegate)delegate;
- (UIEdgeInsets)additionalSafeAreaInsets;
- (id)bundleImageNamed:(id)a3;
- (id)bundleImageNamed:(id)a3 renderingMode:(int64_t)a4;
- (int64_t)buttonType;
- (int64_t)controllerType;
- (int64_t)deviceType;
- (void)addButtonWithType:(int64_t)a3;
- (void)buttonPressed:(id)a3;
- (void)setButtonType:(int64_t)a3;
- (void)setControllerType:(int64_t)a3;
- (void)setControllerType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setTrayButton:(id)a3;
@end

@implementation PNPWelcomeController

+ (id)controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v9 = a6;
  v10 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 8:
    case 9:
      goto LABEL_3;
    case 7:
      objc_opt_class();
LABEL_3:
      v10 = objc_opt_class();
      break;
    default:
      break;
  }
  v11 = [v10 _controllerWithType:a3 buttonType:a4 deviceType:a5 delegate:v9];

  return v11;
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  double v2 = 0.0;
  double v3 = 22.0;
  double v4 = 0.0;
  double v5 = 22.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)addButtonWithType:(int64_t)a3
{
  if (a3 == 1)
  {
    double v4 = PencilPairingUIBundle();
    double v5 = v4;
    v6 = @"CONTINUE_BUTTON";
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    double v4 = PencilPairingUIBundle();
    double v5 = v4;
    v6 = @"DONE_BUTTON";
  }
  id v10 = [v4 localizedStringForKey:v6 value:&stru_26ECD9920 table:0];

  if (v10)
  {
    v7 = [MEMORY[0x263F5B898] boldButton];
    [v7 setTitle:v10 forState:0];
    [v7 addTarget:self action:sel_buttonPressed_ forControlEvents:64];
    v8 = [(PNPWelcomeController *)self buttonTray];
    [v8 addButton:v7];

    id v9 = [(PNPWelcomeController *)self buttonTray];
    [v9 setHidden:0];

    [(PNPWelcomeController *)self setTrayButton:v7];
  }
}

- (void)buttonPressed:(id)a3
{
  id v4 = [(PNPWelcomeController *)self delegate];
  [v4 welcomeControllerButtonDidPress:self];
}

- (void)setControllerType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v10 = a6;
  [(PNPWelcomeController *)self setControllerType:a3];
  [(PNPWelcomeController *)self setButtonType:a4];
  [(PNPWelcomeController *)self setDelegate:v10];

  [(PNPWelcomeController *)self setDeviceType:a5];
  [(PNPWelcomeController *)self addButtonWithType:a4];
}

- (id)bundleImageNamed:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() bundleImageNamed:v3];

  return v4;
}

- (id)bundleImageNamed:(id)a3 renderingMode:(int64_t)a4
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() bundleImageNamed:v5 renderingMode:a4];

  return v6;
}

+ (id)bundleImageNamed:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1C6B0];
  id v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v3 imageNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  v8 = [v7 imageWithRenderingMode:2];

  return v8;
}

+ (id)bundleImageNamed:(id)a3 renderingMode:(int64_t)a4
{
  id v5 = (void *)MEMORY[0x263F1C6B0];
  v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a3;
  v8 = [v6 bundleForClass:objc_opt_class()];
  id v9 = [v5 imageNamed:v7 inBundle:v8 compatibleWithTraitCollection:0];

  id v10 = [v9 imageWithRenderingMode:a4];

  return v10;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isRTL
{
  double v2 = [MEMORY[0x263F1C408] sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == 1;

  return v3;
}

- (PNPWelcomeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PNPWelcomeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)controllerType
{
  return self->_controllerType;
}

- (void)setControllerType:(int64_t)a3
{
  self->_controllerType = a3;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (OBTrayButton)trayButton
{
  return self->_trayButton;
}

- (void)setTrayButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trayButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end