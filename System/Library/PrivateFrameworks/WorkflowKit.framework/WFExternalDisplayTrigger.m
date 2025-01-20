@interface WFExternalDisplayTrigger
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
- (BOOL)onConnect;
- (BOOL)onDisconnect;
- (Class)shortcutInputContentItemClass;
- (WFExternalDisplayTrigger)init;
- (WFExternalDisplayTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (void)encodeWithCoder:(id)a3;
- (void)setOnConnect:(BOOL)a3;
- (void)setOnDisconnect:(BOOL)a3;
@end

@implementation WFExternalDisplayTrigger

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
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFExternalDisplayTrigger;
  id v4 = [(WFTrigger *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setOnConnect:", -[WFExternalDisplayTrigger onConnect](self, "onConnect"));
  objc_msgSend(v4, "setOnDisconnect:", -[WFExternalDisplayTrigger onDisconnect](self, "onDisconnect"));
  return v4;
}

- (WFExternalDisplayTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFExternalDisplayTrigger;
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
  v7.super_class = (Class)WFExternalDisplayTrigger;
  id v4 = a3;
  [(WFTrigger *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[WFExternalDisplayTrigger onConnect](self, "onConnect", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"onConnect"];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithBool:", -[WFExternalDisplayTrigger onDisconnect](self, "onDisconnect"));
  [v4 encodeObject:v6 forKey:@"onDisconnect"];
}

- (Class)shortcutInputContentItemClass
{
  return (Class)objc_opt_class();
}

- (id)localizedPastTenseDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(WFExternalDisplayTrigger *)self onConnect]
    && [(WFExternalDisplayTrigger *)self onDisconnect])
  {
    v3 = @"Display connected or disconnected";
LABEL_8:
    WFLocalizedString(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([(WFExternalDisplayTrigger *)self onConnect])
  {
    v3 = @"Display connected";
    goto LABEL_8;
  }
  if ([(WFExternalDisplayTrigger *)self onDisconnect])
  {
    v3 = @"Display disconnected";
    goto LABEL_8;
  }
  objc_super v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    v8 = "-[WFExternalDisplayTrigger localizedPastTenseDescription]";
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
  if ([(WFExternalDisplayTrigger *)self onConnect]
    && [(WFExternalDisplayTrigger *)self onDisconnect])
  {
    v3 = @"When my display connects or disconnects";
LABEL_8:
    WFLocalizedString(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ([(WFExternalDisplayTrigger *)self onConnect])
  {
    v3 = @"When my display connects";
    goto LABEL_8;
  }
  if ([(WFExternalDisplayTrigger *)self onDisconnect])
  {
    v3 = @"When my display disconnects";
    goto LABEL_8;
  }
  objc_super v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    v8 = "-[WFExternalDisplayTrigger localizedDescriptionWithConfigurationSummary]";
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
  if ([(WFExternalDisplayTrigger *)self onConnect]) {
    return 1;
  }
  return [(WFExternalDisplayTrigger *)self onDisconnect];
}

- (WFExternalDisplayTrigger)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFExternalDisplayTrigger;
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

+ (id)tintColor
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB45E0]) initWithSystemColor:4];
  return v2;
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
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v2 = (void *)getUIImageSymbolConfigurationClass_softClass;
  uint64_t v20 = getUIImageSymbolConfigurationClass_softClass;
  if (!getUIImageSymbolConfigurationClass_softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __getUIImageSymbolConfigurationClass_block_invoke;
    v15 = &unk_1E6558B78;
    v16 = &v17;
    __getUIImageSymbolConfigurationClass_block_invoke((uint64_t)&v12);
    v2 = (void *)v18[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v17, 8);
  id v4 = [v3 configurationWithPointSize:54.0];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v5 = (void *)getUIImageClass_softClass;
  uint64_t v20 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __getUIImageClass_block_invoke;
    v15 = &unk_1E6558B78;
    v16 = &v17;
    __getUIImageClass_block_invoke((uint64_t)&v12);
    v5 = (void *)v18[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v17, 8);
  int v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v6 imageNamed:@"custom.cable.connector.slash" inBundle:v7 withConfiguration:v4];

  __int16 v9 = (void *)[objc_alloc(MEMORY[0x1E4FB4770]) initWithPlatformImage:v8];
  objc_super v10 = [v9 imageWithRenderingMode:2];

  return v10;
}

+ (id)onIcon
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4FB4770];
  id v4 = [a1 tintColor];
  v9[0] = v4;
  v5 = [a1 tintColor];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  int v7 = [v3 triggerConfigurationSymbolNamed:@"cable.connector" hierarchicalColors:v6];

  return v7;
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)displayGlyphName
{
  return @"display";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When my display connects”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Display");
}

+ (BOOL)isSupportedOnThisDevice
{
  v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  BOOL v3 = [v2 idiom] == 1;

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