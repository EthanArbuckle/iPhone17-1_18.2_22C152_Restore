@interface WFLowPowerModeTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)isSupportedOnThisDevice;
+ (BOOL)isUserInitiated;
+ (BOOL)supportsSecureCoding;
+ (id)displayGlyphName;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (id)offIcon;
+ (id)offLabel;
+ (id)onIcon;
+ (id)onLabel;
+ (id)yellowBatteryHierarchicalColors;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (BOOL)onDisable;
- (BOOL)onEnable;
- (WFLowPowerModeTrigger)init;
- (WFLowPowerModeTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (void)encodeWithCoder:(id)a3;
- (void)setOnDisable:(BOOL)a3;
- (void)setOnEnable:(BOOL)a3;
@end

@implementation WFLowPowerModeTrigger

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
  v3 = [v2 createActionsWithIdentifiers:&unk_1F2317BC8 serializedParameterArray:0];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFLowPowerModeTrigger;
  id v4 = [(WFTrigger *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOnEnable:", -[WFLowPowerModeTrigger onEnable](self, "onEnable"));
  objc_msgSend(v4, "setOnDisable:", -[WFLowPowerModeTrigger onDisable](self, "onDisable"));
  return v4;
}

- (WFLowPowerModeTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLowPowerModeTrigger;
  v5 = [(WFTrigger *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"onEnable"];
    v5->_onEnable = [v6 BOOLValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"onDisable"];
    v5->_onDisable = [v7 BOOLValue];

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFLowPowerModeTrigger;
  id v4 = a3;
  [(WFTrigger *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[WFLowPowerModeTrigger onEnable](self, "onEnable", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"onEnable"];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithBool:", -[WFLowPowerModeTrigger onDisable](self, "onDisable"));
  [v4 encodeObject:v6 forKey:@"onDisable"];
}

- (id)localizedPastTenseDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WFLowPowerModeTrigger *)self onEnable] && [(WFLowPowerModeTrigger *)self onDisable])
  {
    v3 = @"Low Power Mode turned on or off";
LABEL_8:
    WFLocalizedString(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([(WFLowPowerModeTrigger *)self onEnable])
  {
    v3 = @"Low Power Mode turned on";
    goto LABEL_8;
  }
  if ([(WFLowPowerModeTrigger *)self onDisable])
  {
    v3 = @"Low Power Mode turned off";
    goto LABEL_8;
  }
  objc_super v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    v8 = "-[WFLowPowerModeTrigger localizedPastTenseDescription]";
    __int16 v9 = 2114;
    objc_super v10 = self;
    _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", (uint8_t *)&v7, 0x16u);
  }

  id v4 = &stru_1F229A4D8;
LABEL_9:
  return v4;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WFLowPowerModeTrigger *)self onEnable] && [(WFLowPowerModeTrigger *)self onDisable])
  {
    v3 = @"When Low Power Mode is turned on or off";
LABEL_8:
    WFLocalizedString(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([(WFLowPowerModeTrigger *)self onEnable])
  {
    v3 = @"When Low Power Mode is turned on";
    goto LABEL_8;
  }
  if ([(WFLowPowerModeTrigger *)self onDisable])
  {
    v3 = @"When Low Power Mode is turned off";
    goto LABEL_8;
  }
  objc_super v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    v8 = "-[WFLowPowerModeTrigger localizedDescriptionWithConfigurationSummary]";
    __int16 v9 = 2114;
    objc_super v10 = self;
    _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", (uint8_t *)&v7, 0x16u);
  }

  id v4 = &stru_1F229A4D8;
LABEL_9:
  return v4;
}

- (BOOL)hasValidConfiguration
{
  if ([(WFLowPowerModeTrigger *)self onEnable]) {
    return 1;
  }
  return [(WFLowPowerModeTrigger *)self onDisable];
}

- (WFLowPowerModeTrigger)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFLowPowerModeTrigger;
  v2 = [(WFTrigger *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_onEnable = 1;
    v2->_onDisable = 0;
    id v4 = v2;
  }

  return v3;
}

+ (id)yellowBatteryHierarchicalColors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB45E0] colorWithRed:1.0 green:0.792156875 blue:0.0 alpha:1.0];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4FB45E0] batteryOutlineColor];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)offLabel
{
  return WFLocalizedString(@"Is Turned Off");
}

+ (id)onLabel
{
  return WFLocalizedString(@"Is Turned On");
}

+ (id)offIcon
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FB4770];
  v3 = [MEMORY[0x1E4FB45E0] colorWithSystemColor:1];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4FB45E0] batteryOutlineColor];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  objc_super v6 = [v2 triggerConfigurationSymbolNamed:@"battery.25" hierarchicalColors:v5];

  return v6;
}

+ (id)onIcon
{
  v2 = (void *)MEMORY[0x1E4FB4770];
  v3 = [a1 yellowBatteryHierarchicalColors];
  id v4 = [v2 triggerConfigurationSymbolNamed:@"battery.25" hierarchicalColors:v3];

  return v4;
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)displayGlyphName
{
  return @"battery.25";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When Low Power Mode is turned off”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Low Power Mode");
}

+ (BOOL)isSupportedOnThisDevice
{
  return MEMORY[0x1F417CE00](@"f+PE44W6AO2UENJk3p2s5A", a2);
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