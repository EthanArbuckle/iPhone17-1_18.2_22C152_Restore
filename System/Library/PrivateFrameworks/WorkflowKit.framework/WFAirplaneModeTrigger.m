@interface WFAirplaneModeTrigger
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
+ (id)tintColor;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (BOOL)onDisable;
- (BOOL)onEnable;
- (WFAirplaneModeTrigger)init;
- (WFAirplaneModeTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setOnDisable:(BOOL)a3;
- (void)setOnEnable:(BOOL)a3;
@end

@implementation WFAirplaneModeTrigger

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

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFAirplaneModeTrigger;
  id v4 = [(WFTrigger *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOnEnable:", -[WFAirplaneModeTrigger onEnable](self, "onEnable"));
  objc_msgSend(v4, "setOnDisable:", -[WFAirplaneModeTrigger onDisable](self, "onDisable"));
  return v4;
}

- (WFAirplaneModeTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFAirplaneModeTrigger;
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
  v7.super_class = (Class)WFAirplaneModeTrigger;
  id v4 = a3;
  [(WFTrigger *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[WFAirplaneModeTrigger onEnable](self, "onEnable", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"onEnable"];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithBool:", -[WFAirplaneModeTrigger onDisable](self, "onDisable"));
  [v4 encodeObject:v6 forKey:@"onDisable"];
}

- (id)localizedPastTenseDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WFAirplaneModeTrigger *)self onEnable] && [(WFAirplaneModeTrigger *)self onDisable])
  {
    v3 = @"Airplane Mode turned on or off";
LABEL_8:
    WFLocalizedString(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([(WFAirplaneModeTrigger *)self onEnable])
  {
    v3 = @"Airplane Mode turned on";
    goto LABEL_8;
  }
  if ([(WFAirplaneModeTrigger *)self onDisable])
  {
    v3 = @"Airplane Mode turned off";
    goto LABEL_8;
  }
  objc_super v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    v8 = "-[WFAirplaneModeTrigger localizedPastTenseDescription]";
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
  if ([(WFAirplaneModeTrigger *)self onEnable] && [(WFAirplaneModeTrigger *)self onDisable])
  {
    v3 = @"When Airplane Mode is turned on or off";
LABEL_8:
    WFLocalizedString(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([(WFAirplaneModeTrigger *)self onEnable])
  {
    v3 = @"When Airplane Mode is turned on";
    goto LABEL_8;
  }
  if ([(WFAirplaneModeTrigger *)self onDisable])
  {
    v3 = @"When Airplane Mode is turned off";
    goto LABEL_8;
  }
  objc_super v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    v8 = "-[WFAirplaneModeTrigger localizedDescriptionWithConfigurationSummary]";
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
  if ([(WFAirplaneModeTrigger *)self onEnable]) {
    return 1;
  }
  return [(WFAirplaneModeTrigger *)self onDisable];
}

- (WFAirplaneModeTrigger)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFAirplaneModeTrigger;
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

+ (id)tintColor
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB45E0]) initWithRed:1.0 green:0.584313725 blue:0.0 alpha:1.0];
  return v2;
}

+ (id)offIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"airplane.circle" renderingMode:2];
}

+ (id)onIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"airplane.circle.fill" renderingMode:2];
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)displayGlyphName
{
  return @"airplane.circle.fill";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When Airplane Mode is turned on”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Airplane Mode");
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