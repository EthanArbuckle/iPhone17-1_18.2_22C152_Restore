@interface SUSSoftwareUpdateScanCell
+ (int64_t)cellStyle;
- (BOOL)suPathsRestricted;
- (BOOL)updatesDeferred;
- (NSError)scanError;
- (NSString)currentVersion;
- (NSString)errorMessage;
- (NSString)errorPrimaryButton;
- (NSString)errorTitle;
- (SUSSoftwareUpdateScanCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIAction)errorPrimaryButtonAction;
- (double)preferredHeightWithTable:(id)a3;
- (id)contentUnavailableConfigurationForState:(int)a3;
- (id)upToDateManagedText;
- (id)upToDateText;
- (id)upToDateWithAlternate;
- (int)state;
- (void)layoutSubviews;
- (void)setCurrentVersion:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setErrorPrimaryButton:(id)a3;
- (void)setErrorPrimaryButtonAction:(id)a3;
- (void)setErrorTitle:(id)a3;
- (void)setScanError:(id)a3;
- (void)setState:(int)a3;
- (void)setSuPathsRestricted:(BOOL)a3;
- (void)setUpdatesDeferred:(BOOL)a3;
@end

@implementation SUSSoftwareUpdateScanCell

+ (int64_t)cellStyle
{
  return 3;
}

- (SUSSoftwareUpdateScanCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v16 = self;
  SEL v15 = a2;
  int64_t v14 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  v5 = v16;
  v16 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)SUSSoftwareUpdateScanCell;
  v16 = [(PSTableCell *)&v11 initWithStyle:v14 reuseIdentifier:location specifier:v12];
  objc_storeStrong((id *)&v16, v16);
  if (v16)
  {
    [(SUSSoftwareUpdateScanCell *)v16 setSelectionStyle:0];
    v8 = v16;
    id v9 = (id)[MEMORY[0x263F825C8] clearColor];
    -[SUSSoftwareUpdateScanCell setBackgroundColor:](v8, "setBackgroundColor:");

    [(SUSSoftwareUpdateScanCell *)v16 setHoverStyle:0];
    v16->_state = -1;
  }
  v7 = v16;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v16, 0);
  return v7;
}

- (void)setState:(int)a3
{
  if (a3 != self->_state)
  {
    self->_state = a3;
    id v3 = [(SUSSoftwareUpdateScanCell *)self contentUnavailableConfigurationForState:a3];
    -[SUSSoftwareUpdateScanCell setContentConfiguration:](self, "setContentConfiguration:");

    [(SUSSoftwareUpdateScanCell *)self setNeedsLayout];
  }
}

- (double)preferredHeightWithTable:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return -1.0;
}

- (void)layoutSubviews
{
  v6 = self;
  SEL v5 = a2;
  id v3 = (id)[MEMORY[0x263F825C8] clearColor];
  -[SUSSoftwareUpdateScanCell setSeparatorColor:](self, "setSeparatorColor:");

  v4.receiver = v6;
  v4.super_class = (Class)SUSSoftwareUpdateScanCell;
  [(PSTableCell *)&v4 layoutSubviews];
}

- (id)contentUnavailableConfigurationForState:(int)a3
{
  v25 = self;
  SEL v24 = a2;
  int v23 = a3;
  id v22 = 0;
  if (a3 == 1)
  {
    id v3 = (id)[MEMORY[0x263F82600] loadingConfiguration];
    id v4 = v22;
    id v22 = v3;

    id v20 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v19 = (id)[v20 localizedStringForKey:@"CHECKING_FOR_UPDATES" value:&stru_26EF052F8 table:@"Software Update"];
    objc_msgSend(v22, "setText:");
  }
  else if (v23 && v23 != 5)
  {
    if (v23 == 4)
    {
      id v15 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v21 = (id)[v15 localizedStringForKey:@"MANAGED_DEVICE_HIDDEN_WITHIN_DELAY" value:&stru_26EF052F8 table:@"Software Update"];

      id v7 = (id)[MEMORY[0x263F82600] emptyConfiguration];
      id v8 = v22;
      id v22 = v7;

      [v22 setText:v25->_currentVersion];
      [v22 setSecondaryText:v21];
      objc_storeStrong(&v21, 0);
    }
    else if (v23 == 2)
    {
      id v9 = (id)[MEMORY[0x263F82600] emptyConfiguration];
      id v10 = v22;
      id v22 = v9;

      [v22 setText:v25->_errorTitle];
      [v22 setSecondaryText:v25->_errorMessage];
      if (v25->_errorPrimaryButton)
      {
        if (v25->_errorPrimaryButtonAction)
        {
          id v13 = (id)[v22 button];
          [v13 setTitle:v25->_errorPrimaryButton];

          id v14 = (id)[v22 buttonProperties];
          [v14 setPrimaryAction:v25->_errorPrimaryButtonAction];
        }
      }
    }
  }
  else
  {
    id v5 = (id)[MEMORY[0x263F82600] emptyConfiguration];
    id v6 = v22;
    id v22 = v5;

    [v22 setText:v25->_currentVersion];
    if ([(SUSSoftwareUpdateScanCell *)v25 updatesDeferred]
      || [(SUSSoftwareUpdateScanCell *)v25 suPathsRestricted])
    {
      id v18 = [(SUSSoftwareUpdateScanCell *)v25 upToDateManagedText];
      objc_msgSend(v22, "setSecondaryText:");
    }
    else if (v23 == 5)
    {
      id v17 = [(SUSSoftwareUpdateScanCell *)v25 upToDateWithAlternate];
      objc_msgSend(v22, "setSecondaryText:");
    }
    else
    {
      id v16 = [(SUSSoftwareUpdateScanCell *)v25 upToDateText];
      objc_msgSend(v22, "setSecondaryText:");
    }
  }
  id v12 = v22;
  objc_storeStrong(&v22, 0);
  return v12;
}

- (id)upToDateText
{
  id v4 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"UP_TO_DATE"];
  id v5 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:");

  return v5;
}

- (id)upToDateWithAlternate
{
  v13[2] = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  id v11 = (id)[MEMORY[0x263F82670] currentDevice];
  id location = (id)[v11 systemVersion];

  if (location)
  {
    id v10 = (id)[location componentsSeparatedByString:@"."];
    id v2 = (id)[v10 firstObject];
    id v3 = v13[0];
    v13[0] = v2;
  }
  id v5 = NSString;
  id v8 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"UP_TO_DATE_WITH_ALTERNATE"];
  id v6 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:");
  id v9 = (id)[v5 stringWithFormat:v13[0]];

  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);
  return v9;
}

- (id)upToDateManagedText
{
  id v4 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"MANAGED_DEVICE_DELAY_EXPIRED_UNAVAILABLE"];
  id v5 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:");

  return v5;
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (void)setErrorTitle:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)errorPrimaryButton
{
  return self->_errorPrimaryButton;
}

- (void)setErrorPrimaryButton:(id)a3
{
}

- (UIAction)errorPrimaryButtonAction
{
  return self->_errorPrimaryButtonAction;
}

- (void)setErrorPrimaryButtonAction:(id)a3
{
}

- (NSString)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(id)a3
{
}

- (NSError)scanError
{
  return self->_scanError;
}

- (void)setScanError:(id)a3
{
}

- (BOOL)updatesDeferred
{
  return self->_updatesDeferred;
}

- (void)setUpdatesDeferred:(BOOL)a3
{
  self->_updatesDeferred = a3;
}

- (BOOL)suPathsRestricted
{
  return self->_suPathsRestricted;
}

- (void)setSuPathsRestricted:(BOOL)a3
{
  self->_suPathsRestricted = a3;
}

- (int)state
{
  return self->_state;
}

- (void).cxx_destruct
{
}

@end