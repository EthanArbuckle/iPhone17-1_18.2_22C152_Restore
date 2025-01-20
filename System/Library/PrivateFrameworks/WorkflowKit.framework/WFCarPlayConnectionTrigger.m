@interface WFCarPlayConnectionTrigger
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
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (BOOL)onConnect;
- (BOOL)onDisconnect;
- (WFCarPlayConnectionTrigger)init;
- (WFCarPlayConnectionTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (void)encodeWithCoder:(id)a3;
- (void)setOnConnect:(BOOL)a3;
- (void)setOnDisconnect:(BOOL)a3;
@end

@implementation WFCarPlayConnectionTrigger

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

- (id)suggestedActions
{
  v2 = +[WFActionRegistry sharedRegistry];
  v3 = [v2 createActionsWithIdentifiers:&unk_1F2317CA0 serializedParameterArray:0];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFCarPlayConnectionTrigger;
  id v4 = [(WFTrigger *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOnConnect:", -[WFCarPlayConnectionTrigger onConnect](self, "onConnect"));
  objc_msgSend(v4, "setOnDisconnect:", -[WFCarPlayConnectionTrigger onDisconnect](self, "onDisconnect"));
  return v4;
}

- (WFCarPlayConnectionTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCarPlayConnectionTrigger;
  v5 = [(WFTrigger *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"onConnect"];
    v5->_onConnect = [v6 BOOLValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"onDisconnect"];
    v5->_onDisconnect = [v7 BOOLValue];

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFCarPlayConnectionTrigger;
  id v4 = a3;
  [(WFTrigger *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[WFCarPlayConnectionTrigger onConnect](self, "onConnect", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"onConnect"];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithBool:", -[WFCarPlayConnectionTrigger onDisconnect](self, "onDisconnect"));
  [v4 encodeObject:v6 forKey:@"onDisconnect"];
}

- (id)localizedPastTenseDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WFCarPlayConnectionTrigger *)self onConnect]
    && [(WFCarPlayConnectionTrigger *)self onDisconnect])
  {
    v3 = @"CarPlay connected or disconnected";
LABEL_8:
    WFLocalizedString(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([(WFCarPlayConnectionTrigger *)self onConnect])
  {
    v3 = @"CarPlay connected";
    goto LABEL_8;
  }
  if ([(WFCarPlayConnectionTrigger *)self onDisconnect])
  {
    v3 = @"CarPlay disconnected";
    goto LABEL_8;
  }
  objc_super v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    v8 = "-[WFCarPlayConnectionTrigger localizedPastTenseDescription]";
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
  if ([(WFCarPlayConnectionTrigger *)self onConnect]
    && [(WFCarPlayConnectionTrigger *)self onDisconnect])
  {
    v3 = @"When CarPlay connects or disconnects";
LABEL_8:
    WFLocalizedString(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([(WFCarPlayConnectionTrigger *)self onConnect])
  {
    v3 = @"When CarPlay connects";
    goto LABEL_8;
  }
  if ([(WFCarPlayConnectionTrigger *)self onDisconnect])
  {
    v3 = @"When CarPlay disconnects";
    goto LABEL_8;
  }
  objc_super v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    v8 = "-[WFCarPlayConnectionTrigger localizedDescriptionWithConfigurationSummary]";
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
  if ([(WFCarPlayConnectionTrigger *)self onConnect]) {
    return 1;
  }
  return [(WFCarPlayConnectionTrigger *)self onDisconnect];
}

- (WFCarPlayConnectionTrigger)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFCarPlayConnectionTrigger;
  v2 = [(WFTrigger *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_onConnect = 1;
    v2->_onDisconnect = 0;
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
  return WFLocalizedString(@"Disconnects");
}

+ (id)onLabel
{
  return WFLocalizedString(@"Connects");
}

+ (id)offIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"xmark.circle" renderingMode:0];
}

+ (id)onIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"carplay" renderingMode:0];
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)displayGlyphName
{
  return @"carplay";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When CarPlay connects”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"CarPlay");
}

+ (BOOL)isSupportedOnThisDevice
{
  return MEMORY[0x1F417CE00](@"StarkCapability", a2);
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