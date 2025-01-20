@interface STStorageOptionTip
- (BOOL)mayCauseDataLoss;
- (NSString)activatingString;
- (NSString)additionalButtonTitle;
- (NSString)confirmationButtonTitle;
- (NSString)confirmationText;
- (NSString)enableButtonTitle;
- (STStorageOptionTip)init;
- (STStorageOptionTipDelegate)delegate;
- (float)activationPercent;
- (id)getValue:(id)a3;
- (int64_t)eventualGain;
- (int64_t)immediateGain;
- (void)enableOption;
- (void)performAdditionalAction;
- (void)setActivatingString:(id)a3;
- (void)setActivationPercent:(float)a3;
- (void)setAdditionalButtonTitle:(id)a3;
- (void)setConfirmationButtonTitle:(id)a3;
- (void)setConfirmationText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableButtonTitle:(id)a3;
- (void)setEventualGain:(int64_t)a3;
- (void)setImmediateGain:(int64_t)a3;
- (void)setMayCauseDataLoss:(BOOL)a3;
- (void)setValue:(id)a3 specifier:(id)a4;
@end

@implementation STStorageOptionTip

- (int64_t)eventualGain
{
  v2 = [(STStorageTip *)self propertyForKey:@"stEventualGain"];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (float)activationPercent
{
  v2 = [(STStorageTip *)self propertyForKey:@"stPercent"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (int64_t)immediateGain
{
  v2 = [(STStorageTip *)self specifier];
  float v3 = [v2 propertyForKey:@"stImmediateGain"];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (STStorageOptionTip)init
{
  v5.receiver = self;
  v5.super_class = (Class)STStorageOptionTip;
  v2 = [(STStorageTip *)&v5 init];
  if (v2)
  {
    float v3 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26C91D0A0 target:v2 set:sel_setValue_specifier_ get:0 detail:0 cell:6 edit:0];
    [v3 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [(STStorageTip *)v2 setSpecifier:v3];
    [(STStorageTip *)v2 setProperty:@"stOptionTip" forKey:@"stTipKind"];
  }
  return v2;
}

- (void)enableOption
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained enableOptionForTip:self];

  id v4 = [MEMORY[0x263F7B008] sharedNotifier];
  [v4 postAppsStateChanged:0];
}

- (void)performAdditionalAction
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 performAdditionalAction:self];
  }
}

- (void)setValue:(id)a3 specifier:(id)a4
{
  id v18 = [(STStorageOptionTip *)self confirmationText];
  if ([v18 length])
  {
    char v5 = [(STStorageOptionTip *)self confirmationButtonTitle];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(STStorageTip *)self title];
    }
    v8 = v7;

    v9 = STFrameworkLocStr(@"ST_CANCEL");
    v10 = (char *)objc_alloc_init(MEMORY[0x263F5FB40]);
    [v10 setTitle:v8];
    [v10 setPrompt:v18];
    [v10 setCancelButton:v9];
    v11 = STFrameworkLocStr(@"ST_ENABLE");
    [v10 setOkButton:v11];

    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[STStorageOptionTip mayCauseDataLoss](self, "mayCauseDataLoss"));
    [v10 setProperty:v12 forKey:*MEMORY[0x263F60000]];

    objc_storeWeak((id *)&v10[*MEMORY[0x263F5FE40]], self);
    [v10 setConfirmationAction:sel_enableOption];
    v13 = [(STStorageOptionTip *)self additionalButtonTitle];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      v15 = [(STStorageOptionTip *)self additionalButtonTitle];
      [v10 setAlternateButton:v15];

      [v10 setConfirmationAlternateAction:sel_performAdditionalAction];
    }
    v16 = [(STStorageTip *)self propertyForKey:@"_stController"];
    v17 = [v16 pointerValue];
    [v17 showConfirmationViewForSpecifier:v10];
  }
  else
  {
    [(STStorageOptionTip *)self enableOption];
  }
}

- (id)getValue:(id)a3
{
  return (id)[NSNumber numberWithBool:0];
}

- (void)setEnableButtonTitle:(id)a3
{
}

- (NSString)enableButtonTitle
{
  return (NSString *)[(STStorageTip *)self propertyForKey:@"stEnableTitle"];
}

- (void)setActivationPercent:(float)a3
{
  [(STStorageOptionTip *)self activationPercent];
  if (*(float *)&v5 != a3)
  {
    *(float *)&double v5 = a3;
    id v6 = [NSNumber numberWithFloat:v5];
    [(STStorageTip *)self setProperty:v6 forKey:@"stPercent"];
  }
}

- (void)setActivatingString:(id)a3
{
}

- (NSString)activatingString
{
  return (NSString *)[(STStorageTip *)self propertyForKey:@"stActivating"];
}

- (void)setImmediateGain:(int64_t)a3
{
  id v4 = [NSNumber numberWithLongLong:a3];
  [(STStorageTip *)self setProperty:v4 forKey:@"stImmediateGain"];
}

- (void)setEventualGain:(int64_t)a3
{
  id v4 = [NSNumber numberWithLongLong:a3];
  [(STStorageTip *)self setProperty:v4 forKey:@"stEventualGain"];
}

- (STStorageOptionTipDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STStorageOptionTipDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)mayCauseDataLoss
{
  return self->_mayCauseDataLoss;
}

- (void)setMayCauseDataLoss:(BOOL)a3
{
  self->_mayCauseDataLoss = a3;
}

- (NSString)confirmationText
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConfirmationText:(id)a3
{
}

- (NSString)confirmationButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConfirmationButtonTitle:(id)a3
{
}

- (NSString)additionalButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAdditionalButtonTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalButtonTitle, 0);
  objc_storeStrong((id *)&self->_confirmationButtonTitle, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end