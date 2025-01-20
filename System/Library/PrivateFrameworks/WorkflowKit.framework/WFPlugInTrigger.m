@interface WFPlugInTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)isUserInitiated;
+ (BOOL)supportsSecureCoding;
+ (id)displayGlyphName;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (id)offIcon;
+ (id)offLabel;
+ (id)onIcon;
+ (id)onLabel;
+ (id)pluggedInHierarchicalColors;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (BOOL)onDisable;
- (BOOL)onEnable;
- (WFPlugInTrigger)init;
- (WFPlugInTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (void)encodeWithCoder:(id)a3;
- (void)setOnDisable:(BOOL)a3;
- (void)setOnEnable:(BOOL)a3;
@end

@implementation WFPlugInTrigger

- (void)setOnDisable:(BOOL)a3
{
  self->_onDisable = a3;
}

- (BOOL)onDisable
{
  return self->_onDisable;
}

- (void)setOnEnable:(BOOL)a3
{
  self->_onEnable = a3;
}

- (BOOL)onEnable
{
  return self->_onEnable;
}

- (id)suggestedActions
{
  v2 = +[WFActionRegistry sharedRegistry];
  v3 = [v2 createActionsWithIdentifiers:&unk_1F23179D0 serializedParameterArray:0];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFPlugInTrigger;
  id v4 = [(WFTrigger *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOnEnable:", -[WFPlugInTrigger onEnable](self, "onEnable"));
  objc_msgSend(v4, "setOnDisable:", -[WFPlugInTrigger onDisable](self, "onDisable"));
  return v4;
}

- (WFPlugInTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFPlugInTrigger;
  v5 = [(WFTrigger *)&v11 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"selection"])
    {
      int v6 = [v4 decodeIntForKey:@"selection"];
      if (v6 == 2)
      {
        [(WFPlugInTrigger *)v5 setOnEnable:1];
      }
      else if (v6 != 1)
      {
        [(WFPlugInTrigger *)v5 setOnEnable:1];
LABEL_10:
        v9 = v5;
        goto LABEL_11;
      }
      v8 = v5;
      uint64_t v7 = 1;
    }
    else
    {
      -[WFPlugInTrigger setOnEnable:](v5, "setOnEnable:", [v4 decodeBoolForKey:@"onEnable"]);
      uint64_t v7 = [v4 decodeBoolForKey:@"onDisable"];
      v8 = v5;
    }
    [(WFPlugInTrigger *)v8 setOnDisable:v7];
    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFPlugInTrigger;
  id v4 = a3;
  [(WFTrigger *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[WFPlugInTrigger onEnable](self, "onEnable", v5.receiver, v5.super_class), @"onEnable");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFPlugInTrigger onDisable](self, "onDisable"), @"onDisable");
}

- (id)localizedPastTenseDescription
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB46B8] currentDevice];
  id v4 = [v3 name];

  if ([(WFPlugInTrigger *)self onEnable] && [(WFPlugInTrigger *)self onDisable])
  {
    objc_super v5 = NSString;
    int v6 = @"%@ connected or disconnected from power";
LABEL_8:
    uint64_t v7 = WFLocalizedString(v6);
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if ([(WFPlugInTrigger *)self onEnable])
  {
    objc_super v5 = NSString;
    int v6 = @"%@ connected to power";
    goto LABEL_8;
  }
  if ([(WFPlugInTrigger *)self onDisable])
  {
    objc_super v5 = NSString;
    int v6 = @"%@ disconnected from power";
    goto LABEL_8;
  }
  v10 = getWFTriggersLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFPlugInTrigger localizedPastTenseDescription]";
    __int16 v13 = 2114;
    v14 = self;
    _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  v8 = &stru_1F229A4D8;
LABEL_9:

  return v8;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB46B8] currentDevice];
  id v4 = [v3 name];

  if ([(WFPlugInTrigger *)self onEnable] && [(WFPlugInTrigger *)self onDisable])
  {
    objc_super v5 = NSString;
    int v6 = @"When %@ is connected or disconnected from power";
LABEL_8:
    uint64_t v7 = WFLocalizedString(v6);
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if ([(WFPlugInTrigger *)self onEnable])
  {
    objc_super v5 = NSString;
    int v6 = @"When %@ is connected to power";
    goto LABEL_8;
  }
  if ([(WFPlugInTrigger *)self onDisable])
  {
    objc_super v5 = NSString;
    int v6 = @"When %@ is disconnected from power";
    goto LABEL_8;
  }
  v10 = getWFTriggersLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFPlugInTrigger localizedDescriptionWithConfigurationSummary]";
    __int16 v13 = 2114;
    v14 = self;
    _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  v8 = &stru_1F229A4D8;
LABEL_9:

  return v8;
}

- (BOOL)hasValidConfiguration
{
  if ([(WFPlugInTrigger *)self onEnable]) {
    return 1;
  }
  return [(WFPlugInTrigger *)self onDisable];
}

- (WFPlugInTrigger)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFPlugInTrigger;
  v2 = [(WFTrigger *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_onEnable = 1;
    id v4 = v2;
  }

  return v3;
}

+ (id)pluggedInHierarchicalColors
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB45E0] colorWithSystemColor:1];
  v3 = objc_msgSend(MEMORY[0x1E4FB45E0], "batteryOutlineColor", v2);
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4FB45E0] colorWithRed:0.298039228 green:0.843137264 blue:0.392156869 alpha:1.0];
  v7[2] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FB4770];
  v3 = [MEMORY[0x1E4FB45E0] colorWithSystemColor:1];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4FB45E0] batteryOutlineColor];
  v8[1] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  objc_super v6 = [v2 triggerConfigurationSymbolNamed:@"battery.100" hierarchicalColors:v5];

  return v6;
}

+ (id)onIcon
{
  v2 = (void *)MEMORY[0x1E4FB4770];
  v3 = [a1 pluggedInHierarchicalColors];
  id v4 = [v2 triggerConfigurationSymbolNamed:@"battery.100.bolt" hierarchicalColors:v3];

  return v4;
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)displayGlyphName
{
  return @"battery.100.bolt";
}

+ (id)localizedDisplayExplanation
{
  v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  v3 = [v2 localizedModel];

  id v4 = NSString;
  objc_super v5 = WFLocalizedString(@"Ex. “When my %@ connects to power”");
  objc_super v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);

  return v6;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Charger");
}

+ (BOOL)isUserInitiated
{
  return 1;
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

@end