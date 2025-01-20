@interface WFStageManagerTrigger
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
+ (id)tintColor;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (BOOL)onDisable;
- (BOOL)onEnable;
- (WFStageManagerTrigger)init;
- (WFStageManagerTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (void)encodeWithCoder:(id)a3;
- (void)setOnDisable:(BOOL)a3;
- (void)setOnEnable:(BOOL)a3;
@end

@implementation WFStageManagerTrigger

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
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFStageManagerTrigger;
  id v4 = [(WFTrigger *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOnEnable:", -[WFStageManagerTrigger onEnable](self, "onEnable"));
  objc_msgSend(v4, "setOnDisable:", -[WFStageManagerTrigger onDisable](self, "onDisable"));
  return v4;
}

- (WFStageManagerTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFStageManagerTrigger;
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
  v7.super_class = (Class)WFStageManagerTrigger;
  id v4 = a3;
  [(WFTrigger *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[WFStageManagerTrigger onEnable](self, "onEnable", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"onEnable"];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithBool:", -[WFStageManagerTrigger onDisable](self, "onDisable"));
  [v4 encodeObject:v6 forKey:@"onDisable"];
}

- (id)localizedPastTenseDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WFStageManagerTrigger *)self onEnable] && [(WFStageManagerTrigger *)self onDisable])
  {
    v3 = @"Stage Manager turned on or off";
LABEL_8:
    WFLocalizedString(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([(WFStageManagerTrigger *)self onEnable])
  {
    v3 = @"Stage Manager turned on";
    goto LABEL_8;
  }
  if ([(WFStageManagerTrigger *)self onDisable])
  {
    v3 = @"Stage Manager turned off";
    goto LABEL_8;
  }
  objc_super v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    v8 = "-[WFStageManagerTrigger localizedPastTenseDescription]";
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
  if ([(WFStageManagerTrigger *)self onEnable] && [(WFStageManagerTrigger *)self onDisable])
  {
    v3 = @"When Stage Manager is turned on or off";
LABEL_8:
    WFLocalizedString(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([(WFStageManagerTrigger *)self onEnable])
  {
    v3 = @"When Stage Manager is turned on";
    goto LABEL_8;
  }
  if ([(WFStageManagerTrigger *)self onDisable])
  {
    v3 = @"When Stage Manager is turned off";
    goto LABEL_8;
  }
  objc_super v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    v8 = "-[WFStageManagerTrigger localizedDescriptionWithConfigurationSummary]";
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
  if ([(WFStageManagerTrigger *)self onEnable]) {
    return 1;
  }
  return [(WFStageManagerTrigger *)self onDisable];
}

- (WFStageManagerTrigger)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFStageManagerTrigger;
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

+ (id)tintColor
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB45E0]) initWithSystemColor:4];
  return v2;
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
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"squares.leading.rectangle" renderingMode:0];
}

+ (id)onIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"squares.leading.rectangle.fill" renderingMode:0];
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)displayGlyphName
{
  return @"squares.leading.rectangle";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When Stage Manager is turned on”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Stage Manager");
}

+ (BOOL)isSupportedOnThisDevice
{
  v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  char v3 = [v2 hasCapability:*MEMORY[0x1E4FB4C88]];

  return v3;
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