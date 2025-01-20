@interface ICBluetoothKeyboardHintViewController
- (BOOL)forceShow;
- (BOOL)hasAttachedBluetoothKeyboard;
- (BOOL)hasAttachedHardwareKeyboard;
- (BOOL)hasEditedNote;
- (BOOL)hasShownHint;
- (BOOL)isInHardwareKeyboardMode;
- (BOOL)shouldShow;
- (ICBluetoothKeyboardHintViewController)initWithRootViewController:(id)a3;
- (ICBluetoothKeyboardHintViewController)initWithRootViewController:(id)a3 userDefaults:(id)a4 buttonAction:(id)a5;
- (NSUserDefaults)userDefaults;
- (void)didEditNote;
- (void)setIsInHardwareKeyboardMode:(BOOL)a3;
- (void)setUserDefaults:(id)a3;
- (void)show;
- (void)showIfNeeded;
- (void)updateHardwareKeyboardMode;
- (void)viewDidLoad;
@end

@implementation ICBluetoothKeyboardHintViewController

- (ICBluetoothKeyboardHintViewController)initWithRootViewController:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA40];
  id v5 = a3;
  v6 = [v4 standardUserDefaults];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__ICBluetoothKeyboardHintViewController_initWithRootViewController___block_invoke;
  v9[3] = &unk_2640B8140;
  v10 = self;
  v7 = [(ICBluetoothKeyboardHintViewController *)v10 initWithRootViewController:v5 userDefaults:v6 buttonAction:v9];

  return v7;
}

uint64_t __68__ICBluetoothKeyboardHintViewController_initWithRootViewController___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F82438], "ic_openBluetoothSettings");
  v2 = *(void **)(a1 + 32);

  return [v2 hide];
}

- (ICBluetoothKeyboardHintViewController)initWithRootViewController:(id)a3 userDefaults:(id)a4 buttonAction:(id)a5
{
  id v20 = a4;
  v9 = (void *)MEMORY[0x263F086E0];
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 mainBundle];
  v13 = [v12 localizedStringForKey:@"Connect a Keyboard" value:&stru_26C10E100 table:0];
  v14 = [MEMORY[0x263F086E0] mainBundle];
  v15 = [v14 localizedStringForKey:@"Pair a Bluetooth keyboard or trackpad to make quick edits." value:&stru_26C10E100 table:0];
  v16 = [MEMORY[0x263F086E0] mainBundle];
  v17 = [v16 localizedStringForKey:@"Go to Settings" value:&stru_26C10E100 table:0];
  v21.receiver = self;
  v21.super_class = (Class)ICBluetoothKeyboardHintViewController;
  v18 = [(ICHintViewController *)&v21 initWithRootViewController:v11 showsCloseButton:1 hintTitle:v13 hintSubtitle:v15 buttonTitle:v17 buttonAction:v10];

  if (v18) {
    objc_storeStrong((id *)&v18->_userDefaults, a4);
  }

  return v18;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)ICBluetoothKeyboardHintViewController;
  [(ICHintViewController *)&v4 viewDidLoad];
  [(ICBluetoothKeyboardHintViewController *)self updateHardwareKeyboardMode];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_keyboardDidChangeFrame_ name:*MEMORY[0x263F83798] object:0];
}

- (void)didEditNote
{
  [(ICBluetoothKeyboardHintViewController *)self updateHardwareKeyboardMode];
  [(ICBluetoothKeyboardHintViewController *)self showIfNeeded];
  id v3 = [(ICBluetoothKeyboardHintViewController *)self userDefaults];
  [v3 setBool:1 forKey:@"bluetoothKeyboardHintDidEditNote"];
}

- (BOOL)shouldShow
{
  if ([(ICBluetoothKeyboardHintViewController *)self forceShow])
  {
    LOBYTE(v3) = 1;
  }
  else if ([(ICBluetoothKeyboardHintViewController *)self hasAttachedHardwareKeyboard] {
         || [(ICBluetoothKeyboardHintViewController *)self isInHardwareKeyboardMode])
  }
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    BOOL v3 = [(ICBluetoothKeyboardHintViewController *)self hasEditedNote];
    if (v3) {
      LOBYTE(v3) = ![(ICBluetoothKeyboardHintViewController *)self hasShownHint];
    }
  }
  return v3;
}

- (void)showIfNeeded
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = objc_msgSend(NSNumber, "numberWithBool:", -[ICBluetoothKeyboardHintViewController shouldShow](self, "shouldShow"));
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[ICBluetoothKeyboardHintViewController forceShow](self, "forceShow"));
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ICBluetoothKeyboardHintViewController isInHardwareKeyboardMode](self, "isInHardwareKeyboardMode"));
    v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ICBluetoothKeyboardHintViewController hasAttachedHardwareKeyboard](self, "hasAttachedHardwareKeyboard"));
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ICBluetoothKeyboardHintViewController hasEditedNote](self, "hasEditedNote"));
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ICBluetoothKeyboardHintViewController hasShownHint](self, "hasShownHint"));
    int v10 = 138413570;
    id v11 = v4;
    __int16 v12 = 2112;
    v13 = v5;
    __int16 v14 = 2112;
    v15 = v6;
    __int16 v16 = 2112;
    v17 = v7;
    __int16 v18 = 2112;
    v19 = v8;
    __int16 v20 = 2112;
    objc_super v21 = v9;
    _os_log_impl(&dword_20BE60000, v3, OS_LOG_TYPE_DEFAULT, "Bluetooth Keyboard Hint Should Show: %@ (forceShow: %@, inHardwareKeyboardMode: %@, hasAttachedHardwareKeyboard: %@, hasEditedNote: %@, hasShownHint: %@)", (uint8_t *)&v10, 0x3Eu);
  }
  if ([(ICBluetoothKeyboardHintViewController *)self shouldShow]) {
    [(ICBluetoothKeyboardHintViewController *)self show];
  }
}

- (void)show
{
  v4.receiver = self;
  v4.super_class = (Class)ICBluetoothKeyboardHintViewController;
  [(ICPillOrnamentViewController *)&v4 show];
  BOOL v3 = [(ICBluetoothKeyboardHintViewController *)self userDefaults];
  [v3 setBool:1 forKey:@"bluetoothKeyboardHintDidShow"];
}

- (BOOL)forceShow
{
  v2 = [(ICBluetoothKeyboardHintViewController *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"bluetoothKeyboardForceShow"];

  return v3;
}

- (BOOL)hasAttachedBluetoothKeyboard
{
  v2 = [(ICBluetoothKeyboardHintViewController *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"bluetoothKeyboardHintHasAttachedHardwareKeyboard"];

  return v3;
}

- (BOOL)hasEditedNote
{
  v2 = [(ICBluetoothKeyboardHintViewController *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"bluetoothKeyboardHintDidEditNote"];

  return v3;
}

- (BOOL)hasShownHint
{
  v2 = [(ICBluetoothKeyboardHintViewController *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"bluetoothKeyboardHintDidShow"];

  return v3;
}

- (void)updateHardwareKeyboardMode
{
  -[ICBluetoothKeyboardHintViewController setIsInHardwareKeyboardMode:](self, "setIsInHardwareKeyboardMode:", [MEMORY[0x263F828A0] isInHardwareKeyboardMode]);
  if ([(ICBluetoothKeyboardHintViewController *)self isInHardwareKeyboardMode])
  {
    id v3 = [(ICBluetoothKeyboardHintViewController *)self userDefaults];
    [v3 setBool:1 forKey:@"bluetoothKeyboardHintHasAttachedHardwareKeyboard"];
  }
}

- (BOOL)isInHardwareKeyboardMode
{
  return self->_isInHardwareKeyboardMode;
}

- (void)setIsInHardwareKeyboardMode:(BOOL)a3
{
  self->_isInHardwareKeyboardMode = a3;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (BOOL)hasAttachedHardwareKeyboard
{
  return self->_hasAttachedHardwareKeyboard;
}

- (void).cxx_destruct
{
}

@end