@interface WFBluetoothTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)requiresNotification;
+ (BOOL)supportsSecureCoding;
+ (id)displayGlyphName;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (id)offIcon;
+ (id)offLabel;
+ (id)onIcon;
+ (id)onLabel;
+ (id)tintColor;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (BOOL)onConnect;
- (BOOL)onDisconnect;
- (NSArray)selectedDevices;
- (WFBluetoothTrigger)init;
- (WFBluetoothTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (unint64_t)selection;
- (void)encodeWithCoder:(id)a3;
- (void)setOnConnect:(BOOL)a3;
- (void)setOnDisconnect:(BOOL)a3;
- (void)setSelectedDevices:(id)a3;
- (void)setSelection:(unint64_t)a3;
@end

@implementation WFBluetoothTrigger

- (void).cxx_destruct
{
}

- (void)setOnDisconnect:(BOOL)a3
{
  self->_onDisconnect = a3;
}

- (BOOL)onDisconnect
{
  return self->_onDisconnect;
}

- (void)setOnConnect:(BOOL)a3
{
  self->_onConnect = a3;
}

- (BOOL)onConnect
{
  return self->_onConnect;
}

- (void)setSelection:(unint64_t)a3
{
  self->_selection = a3;
}

- (unint64_t)selection
{
  return self->_selection;
}

- (void)setSelectedDevices:(id)a3
{
}

- (NSArray)selectedDevices
{
  return self->_selectedDevices;
}

- (id)suggestedActions
{
  v2 = +[WFActionRegistry sharedRegistry];
  v3 = [v2 createActionsWithIdentifiers:&unk_1F2317B80 serializedParameterArray:0];

  return v3;
}

- (WFBluetoothTrigger)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFBluetoothTrigger;
  v5 = [(WFTrigger *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"selectedDevices"];
    selectedDevices = v5->_selectedDevices;
    v5->_selectedDevices = (NSArray *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selection"];
    v12 = v11;
    if (v11) {
      uint64_t v13 = [v11 unsignedIntegerValue];
    }
    else {
      uint64_t v13 = 1;
    }
    v5->_selection = v13;
    v5->_onConnect = [v4 decodeBoolForKey:@"onConnect"];
    v5->_onDisconnect = [v4 decodeBoolForKey:@"onDisconnect"];
    if (![(WFBluetoothTrigger *)v5 onConnect] && ![(WFBluetoothTrigger *)v5 onDisconnect]) {
      v5->_onConnect = 1;
    }
    v14 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFBluetoothTrigger;
  id v4 = a3;
  [(WFTrigger *)&v7 encodeWithCoder:v4];
  v5 = [(WFBluetoothTrigger *)self selectedDevices];
  [v4 encodeObject:v5 forKey:@"selectedDevices"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFBluetoothTrigger selection](self, "selection"));
  [v4 encodeObject:v6 forKey:@"selection"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFBluetoothTrigger onConnect](self, "onConnect"), @"onConnect");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFBluetoothTrigger onDisconnect](self, "onDisconnect"), @"onDisconnect");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFBluetoothTrigger;
  id v4 = [(WFTrigger *)&v8 copyWithZone:a3];
  v5 = [(WFBluetoothTrigger *)self selectedDevices];
  v6 = (void *)[v5 copy];
  [v4 setSelectedDevices:v6];

  objc_msgSend(v4, "setSelection:", -[WFBluetoothTrigger selection](self, "selection"));
  objc_msgSend(v4, "setOnConnect:", -[WFBluetoothTrigger onConnect](self, "onConnect"));
  objc_msgSend(v4, "setOnDisconnect:", -[WFBluetoothTrigger onDisconnect](self, "onDisconnect"));
  return v4;
}

- (id)localizedPastTenseDescription
{
  v3 = [MEMORY[0x1E4FB46B8] currentDevice];
  id v4 = [v3 name];

  if (![(WFBluetoothTrigger *)self selection]
    || [(WFBluetoothTrigger *)self selection] == 1
    && ([(WFBluetoothTrigger *)self selectedDevices],
        v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 >= 2))
  {
    if ([(WFBluetoothTrigger *)self onConnect] && [(WFBluetoothTrigger *)self onDisconnect])
    {
      objc_super v7 = NSString;
      objc_super v8 = @"%1$@ connected or disconnected from Bluetooth device";
LABEL_15:
      v12 = WFLocalizedString(v8);
      objc_msgSend(v7, "localizedStringWithFormat:", v12, v4);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    if ([(WFBluetoothTrigger *)self onConnect])
    {
      objc_super v7 = NSString;
      objc_super v8 = @"%1$@ connected to Bluetooth device";
      goto LABEL_15;
    }
    if ([(WFBluetoothTrigger *)self onDisconnect])
    {
      objc_super v7 = NSString;
      objc_super v8 = @"%1$@ disconnected from Bluetooth device";
      goto LABEL_15;
    }
LABEL_16:
    v15 = &stru_1F229A4D8;
    goto LABEL_23;
  }
  uint64_t v9 = [(WFBluetoothTrigger *)self selectedDevices];
  uint64_t v10 = [v9 count];

  if (v10 != 1) {
    goto LABEL_16;
  }
  v11 = [(WFBluetoothTrigger *)self selectedDevices];
  v12 = [v11 objectAtIndexedSubscript:0];

  if ([(WFBluetoothTrigger *)self onConnect] && [(WFBluetoothTrigger *)self onDisconnect])
  {
    uint64_t v13 = NSString;
    v14 = @"%1$@ connected or disconnected from “%2$@”";
  }
  else if ([(WFBluetoothTrigger *)self onConnect])
  {
    uint64_t v13 = NSString;
    v14 = @"%1$@ connected to “%2$@”";
  }
  else
  {
    if (![(WFBluetoothTrigger *)self onDisconnect])
    {
      v15 = &stru_1F229A4D8;
      goto LABEL_22;
    }
    uint64_t v13 = NSString;
    v14 = @"%1$@ disconnected from “%2$@”";
  }
  objc_super v16 = WFLocalizedString(v14);
  objc_msgSend(v13, "localizedStringWithFormat:", v16, v4, v12);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_22:
LABEL_23:

  return v15;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  v3 = [MEMORY[0x1E4FB46B8] currentDevice];
  id v4 = [v3 name];

  if (![(WFBluetoothTrigger *)self selection])
  {
    if ([(WFBluetoothTrigger *)self onConnect] && [(WFBluetoothTrigger *)self onDisconnect])
    {
      v11 = NSString;
      v12 = @"When %1$@ is connected or disconnected from any Bluetooth device";
    }
    else if ([(WFBluetoothTrigger *)self onConnect])
    {
      v11 = NSString;
      v12 = @"When %1$@ is connected to any Bluetooth device";
    }
    else
    {
      if (![(WFBluetoothTrigger *)self onDisconnect]) {
        goto LABEL_27;
      }
      v11 = NSString;
      v12 = @"When %1$@ is disconnected from any Bluetooth device";
    }
    objc_super v8 = WFLocalizedString(v12);
    objc_msgSend(v11, "localizedStringWithFormat:", v8, v4);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  v5 = [(WFBluetoothTrigger *)self selectedDevices];
  uint64_t v6 = [v5 count];

  if (v6 != 1)
  {
    if ([(WFBluetoothTrigger *)self onConnect] && [(WFBluetoothTrigger *)self onDisconnect])
    {
      uint64_t v13 = NSString;
      v14 = @"When %2$@ is connected or disconnected from any of %1$lu Bluetooth devices";
LABEL_26:
      objc_super v8 = WFLocalizedPluralString(v14);
      v17 = [(WFBluetoothTrigger *)self selectedDevices];
      objc_msgSend(v13, "localizedStringWithFormat:", v8, objc_msgSend(v17, "count"), v4);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_29;
    }
    if ([(WFBluetoothTrigger *)self onConnect])
    {
      uint64_t v13 = NSString;
      v14 = @"When %2$@ is connected to any of %1$lu Bluetooth devices";
      goto LABEL_26;
    }
    if ([(WFBluetoothTrigger *)self onDisconnect])
    {
      uint64_t v13 = NSString;
      v14 = @"When %2$@ is disconnected from any of %1$lu Bluetooth devices";
      goto LABEL_26;
    }
LABEL_27:
    v15 = &stru_1F229A4D8;
    goto LABEL_30;
  }
  objc_super v7 = [(WFBluetoothTrigger *)self selectedDevices];
  objc_super v8 = [v7 objectAtIndexedSubscript:0];

  if ([(WFBluetoothTrigger *)self onConnect] && [(WFBluetoothTrigger *)self onDisconnect])
  {
    uint64_t v9 = NSString;
    uint64_t v10 = @"When %1$@ is connected or disconnected from “%2$@”";
  }
  else if ([(WFBluetoothTrigger *)self onConnect])
  {
    uint64_t v9 = NSString;
    uint64_t v10 = @"When %1$@ is connected to “%2$@”";
  }
  else
  {
    if (![(WFBluetoothTrigger *)self onDisconnect])
    {
      v15 = &stru_1F229A4D8;
      goto LABEL_29;
    }
    uint64_t v9 = NSString;
    uint64_t v10 = @"When %1$@ is disconnected from “%2$@”";
  }
  objc_super v16 = WFLocalizedString(v10);
  objc_msgSend(v9, "localizedStringWithFormat:", v16, v4, v8);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_29:
LABEL_30:

  return v15;
}

- (BOOL)hasValidConfiguration
{
  v3 = [(WFBluetoothTrigger *)self selectedDevices];
  if ([v3 count]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(WFBluetoothTrigger *)self selection] == 0;
  }

  BOOL v5 = [(WFBluetoothTrigger *)self onConnect] || [(WFBluetoothTrigger *)self onDisconnect];
  return v4 && v5;
}

- (WFBluetoothTrigger)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFBluetoothTrigger;
  v2 = [(WFTrigger *)&v7 init];
  v3 = v2;
  if (v2)
  {
    selectedDevices = v2->_selectedDevices;
    v2->_selectedDevices = (NSArray *)MEMORY[0x1E4F1CBF0];

    v3->_selection = 1;
    v3->_onConnect = 1;
    BOOL v5 = v3;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)tintColor
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB45E0]) initWithSystemColor:4];
  return v2;
}

+ (id)offLabel
{
  return WFLocalizedString(@"Is Disconnected");
}

+ (id)onLabel
{
  return WFLocalizedString(@"Is Connected");
}

+ (id)offIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"bluetooth.circle" renderingMode:2];
}

+ (id)onIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"bluetooth.circle.fill" renderingMode:2];
}

+ (BOOL)requiresNotification
{
  return 1;
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)displayGlyphName
{
  return @"bluetooth";
}

+ (id)localizedDisplayExplanation
{
  v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  v3 = [v2 localizedModel];

  BOOL v4 = NSString;
  BOOL v5 = WFLocalizedString(@"Ex. “When my %@ connects to AirPods”");
  uint64_t v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);

  return v6;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Bluetooth");
}

@end