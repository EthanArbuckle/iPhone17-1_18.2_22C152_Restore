@interface WFWifiTrigger
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
- (BOOL)runAfterConnectionInterruption;
- (NSArray)selectedNetworks;
- (WFWifiTrigger)init;
- (WFWifiTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (unint64_t)selection;
- (void)encodeWithCoder:(id)a3;
- (void)setOnConnect:(BOOL)a3;
- (void)setOnDisconnect:(BOOL)a3;
- (void)setRunAfterConnectionInterruption:(BOOL)a3;
- (void)setSelectedNetworks:(id)a3;
- (void)setSelection:(unint64_t)a3;
@end

@implementation WFWifiTrigger

- (void).cxx_destruct
{
}

- (void)setRunAfterConnectionInterruption:(BOOL)a3
{
  self->_runAfterConnectionInterruption = a3;
}

- (BOOL)runAfterConnectionInterruption
{
  return self->_runAfterConnectionInterruption;
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

- (void)setSelectedNetworks:(id)a3
{
}

- (NSArray)selectedNetworks
{
  return self->_selectedNetworks;
}

- (id)suggestedActions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = +[WFActionRegistry sharedRegistry];
  v9 = @"ShowWhenRun";
  v10[0] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v4 = [v2 createActionWithIdentifier:@"is.workflow.actions.sendmessage" serializedParameters:v3];

  v5 = +[WFActionRegistry sharedRegistry];
  v6 = [v5 createActionsWithIdentifiers:&unk_1F2317C10 serializedParameterArray:0];

  if (v4)
  {
    uint64_t v7 = [v6 arrayByAddingObject:v4];

    v6 = (void *)v7;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFWifiTrigger;
  id v4 = [(WFTrigger *)&v8 copyWithZone:a3];
  v5 = [(WFWifiTrigger *)self selectedNetworks];
  v6 = (void *)[v5 copy];
  [v4 setSelectedNetworks:v6];

  objc_msgSend(v4, "setSelection:", -[WFWifiTrigger selection](self, "selection"));
  objc_msgSend(v4, "setOnConnect:", -[WFWifiTrigger onConnect](self, "onConnect"));
  objc_msgSend(v4, "setOnDisconnect:", -[WFWifiTrigger onDisconnect](self, "onDisconnect"));
  objc_msgSend(v4, "setRunAfterConnectionInterruption:", -[WFWifiTrigger runAfterConnectionInterruption](self, "runAfterConnectionInterruption"));
  return v4;
}

- (WFWifiTrigger)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFWifiTrigger;
  v5 = [(WFTrigger *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    objc_super v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"selectedNetworks"];
    selectedNetworks = v5->_selectedNetworks;
    v5->_selectedNetworks = (NSArray *)v9;

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
    if ([v4 containsValueForKey:@"runAfterConnectionInterruption"]) {
      v5->_runAfterConnectionInterruption = [v4 decodeBoolForKey:@"runAfterConnectionInterruption"];
    }
    else {
      v5->_runAfterConnectionInterruption = 1;
    }
    v14 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFWifiTrigger;
  id v4 = a3;
  [(WFTrigger *)&v7 encodeWithCoder:v4];
  v5 = [(WFWifiTrigger *)self selectedNetworks];
  [v4 encodeObject:v5 forKey:@"selectedNetworks"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFWifiTrigger selection](self, "selection"));
  [v4 encodeObject:v6 forKey:@"selection"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFWifiTrigger onConnect](self, "onConnect"), @"onConnect");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFWifiTrigger onDisconnect](self, "onDisconnect"), @"onDisconnect");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFWifiTrigger runAfterConnectionInterruption](self, "runAfterConnectionInterruption"), @"runAfterConnectionInterruption");
}

- (id)localizedPastTenseDescription
{
  return &stru_1F229A4D8;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  v3 = [MEMORY[0x1E4FB46B8] currentDevice];
  id v4 = [v3 name];

  if (![(WFWifiTrigger *)self selection])
  {
    v11 = [MEMORY[0x1E4FB46B8] currentDevice];
    int v12 = [v11 hasCapability:*MEMORY[0x1E4FB4C90]];

    BOOL v13 = [(WFWifiTrigger *)self onConnect];
    if (v12)
    {
      if (v13 && [(WFWifiTrigger *)self onDisconnect])
      {
        v14 = NSString;
        v15 = @"When %@ joins or leaves any WLAN network";
      }
      else if ([(WFWifiTrigger *)self onConnect])
      {
        v14 = NSString;
        v15 = @"When %@ joins any WLAN network";
      }
      else
      {
        if (![(WFWifiTrigger *)self onDisconnect]) {
          goto LABEL_48;
        }
        v14 = NSString;
        v15 = @"When %@ leaves any WLAN network";
      }
    }
    else if (v13 && [(WFWifiTrigger *)self onDisconnect])
    {
      v14 = NSString;
      v15 = @"When %@ joins or leaves any Wi-Fi network";
    }
    else if ([(WFWifiTrigger *)self onConnect])
    {
      v14 = NSString;
      v15 = @"When %@ joins any Wi-Fi network";
    }
    else
    {
      if (![(WFWifiTrigger *)self onDisconnect]) {
        goto LABEL_48;
      }
      v14 = NSString;
      v15 = @"When %@ leaves any Wi-Fi network";
    }
    objc_super v8 = WFLocalizedString(v15);
    objc_msgSend(v14, "localizedStringWithFormat:", v8, v4);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  v5 = [(WFWifiTrigger *)self selectedNetworks];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    objc_super v7 = [(WFWifiTrigger *)self selectedNetworks];
    objc_super v8 = [v7 objectAtIndexedSubscript:0];

    if ([(WFWifiTrigger *)self onConnect] && [(WFWifiTrigger *)self onDisconnect])
    {
      uint64_t v9 = NSString;
      v10 = @"When %1$@ joins or leaves “%2$@”";
    }
    else if ([(WFWifiTrigger *)self onConnect])
    {
      uint64_t v9 = NSString;
      v10 = @"When %1$@ joins “%2$@”";
    }
    else
    {
      if (![(WFWifiTrigger *)self onDisconnect])
      {
        v22 = &stru_1F229A4D8;
        goto LABEL_44;
      }
      uint64_t v9 = NSString;
      v10 = @"When %1$@ leaves “%2$@”";
    }
    v21 = WFLocalizedString(v10);
    objc_msgSend(v9, "localizedStringWithFormat:", v21, v4, v8);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_44:
    goto LABEL_45;
  }
  objc_super v16 = [MEMORY[0x1E4FB46B8] currentDevice];
  int v17 = [v16 hasCapability:*MEMORY[0x1E4FB4C90]];

  BOOL v18 = [(WFWifiTrigger *)self onConnect];
  if (v17)
  {
    if (v18 && [(WFWifiTrigger *)self onDisconnect])
    {
      v19 = NSString;
      v20 = @"When %2$@ joins or leaves any of %1$lu WLAN networks";
LABEL_43:
      objc_super v8 = WFLocalizedPluralString(v20);
      v23 = [(WFWifiTrigger *)self selectedNetworks];
      objc_msgSend(v19, "localizedStringWithFormat:", v8, objc_msgSend(v23, "count"), v4);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_44;
    }
    if ([(WFWifiTrigger *)self onConnect])
    {
      v19 = NSString;
      v20 = @"When %2$@ joins any of %1$lu WLAN networks";
      goto LABEL_43;
    }
    if ([(WFWifiTrigger *)self onDisconnect])
    {
      v19 = NSString;
      v20 = @"When %2$@ leaves any of %1$lu WLAN networks";
      goto LABEL_43;
    }
  }
  else
  {
    if (v18 && [(WFWifiTrigger *)self onDisconnect])
    {
      v19 = NSString;
      v20 = @"When %2$@ joins or leaves any of %1$lu Wi-Fi networks";
      goto LABEL_43;
    }
    if ([(WFWifiTrigger *)self onConnect])
    {
      v19 = NSString;
      v20 = @"When %2$@ joins any of %1$lu Wi-Fi networks";
      goto LABEL_43;
    }
    if ([(WFWifiTrigger *)self onDisconnect])
    {
      v19 = NSString;
      v20 = @"When %2$@ leaves any of %1$lu Wi-Fi networks";
      goto LABEL_43;
    }
  }
LABEL_48:
  v22 = &stru_1F229A4D8;
LABEL_45:

  return v22;
}

- (BOOL)hasValidConfiguration
{
  v3 = [(WFWifiTrigger *)self selectedNetworks];
  if ([v3 count]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(WFWifiTrigger *)self selection] == 0;
  }

  BOOL v5 = [(WFWifiTrigger *)self onConnect] || [(WFWifiTrigger *)self onDisconnect];
  return v4 && v5;
}

- (WFWifiTrigger)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFWifiTrigger;
  v2 = [(WFTrigger *)&v7 init];
  v3 = v2;
  if (v2)
  {
    selectedNetworks = v2->_selectedNetworks;
    v2->_selectedNetworks = (NSArray *)MEMORY[0x1E4F1CBF0];

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
  return WFLocalizedString(@"Network Left");
}

+ (id)onLabel
{
  return WFLocalizedString(@"Network Joined");
}

+ (id)offIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"wifi.circle" renderingMode:2];
}

+ (id)onIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"wifi.circle.fill" renderingMode:2];
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
  return @"wifi";
}

+ (id)localizedDisplayExplanation
{
  v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  v3 = [v2 localizedModel];

  BOOL v4 = [MEMORY[0x1E4FB46B8] currentDevice];
  int v5 = [v4 hasCapability:*MEMORY[0x1E4FB4C90]];

  uint64_t v6 = NSString;
  if (v5) {
    objc_super v7 = @"Ex. “When my %@ joins home WLAN”";
  }
  else {
    objc_super v7 = @"Ex. “When my %@ joins home Wi-Fi”";
  }
  objc_super v8 = WFLocalizedString(v7);
  uint64_t v9 = objc_msgSend(v6, "localizedStringWithFormat:", v8, v3);

  return v9;
}

+ (id)localizedDisplayName
{
  v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  v3 = [v2 localizedWiFiDisplayName];

  return v3;
}

@end