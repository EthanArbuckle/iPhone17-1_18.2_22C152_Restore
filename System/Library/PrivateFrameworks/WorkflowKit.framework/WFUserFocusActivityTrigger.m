@interface WFUserFocusActivityTrigger
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
- (NSString)activityGlyphName;
- (NSString)activityName;
- (NSString)activitySemanticIdentifier;
- (NSString)activityUniqueIdentifier;
- (WFColor)activityTintColor;
- (WFUserFocusActivityTrigger)init;
- (WFUserFocusActivityTrigger)initWithActivity:(id)a3;
- (WFUserFocusActivityTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayGlyph;
- (id)displayGlyphTintColor;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedDisplayExplanation;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityGlyphName:(id)a3;
- (void)setActivityName:(id)a3;
- (void)setActivitySemanticIdentifier:(id)a3;
- (void)setActivityTintColor:(id)a3;
- (void)setActivityUniqueIdentifier:(id)a3;
- (void)setOnDisable:(BOOL)a3;
- (void)setOnEnable:(BOOL)a3;
@end

@implementation WFUserFocusActivityTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTintColor, 0);
  objc_storeStrong((id *)&self->_activityGlyphName, 0);
  objc_storeStrong((id *)&self->_activitySemanticIdentifier, 0);
  objc_storeStrong((id *)&self->_activityUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_activityName, 0);
}

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

- (void)setActivityTintColor:(id)a3
{
}

- (WFColor)activityTintColor
{
  return self->_activityTintColor;
}

- (void)setActivityGlyphName:(id)a3
{
}

- (NSString)activityGlyphName
{
  return self->_activityGlyphName;
}

- (void)setActivitySemanticIdentifier:(id)a3
{
}

- (NSString)activitySemanticIdentifier
{
  return self->_activitySemanticIdentifier;
}

- (void)setActivityUniqueIdentifier:(id)a3
{
}

- (NSString)activityUniqueIdentifier
{
  return self->_activityUniqueIdentifier;
}

- (void)setActivityName:(id)a3
{
}

- (NSString)activityName
{
  return self->_activityName;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WFUserFocusActivityTrigger;
  id v4 = [(WFTrigger *)&v11 copyWithZone:a3];
  objc_msgSend(v4, "setOnEnable:", -[WFUserFocusActivityTrigger onEnable](self, "onEnable"));
  objc_msgSend(v4, "setOnDisable:", -[WFUserFocusActivityTrigger onDisable](self, "onDisable"));
  v5 = [(WFUserFocusActivityTrigger *)self activityName];
  [v4 setActivityName:v5];

  v6 = [(WFUserFocusActivityTrigger *)self activityUniqueIdentifier];
  [v4 setActivityUniqueIdentifier:v6];

  v7 = [(WFUserFocusActivityTrigger *)self activitySemanticIdentifier];
  [v4 setActivitySemanticIdentifier:v7];

  v8 = [(WFUserFocusActivityTrigger *)self activityGlyphName];
  [v4 setActivityGlyphName:v8];

  v9 = [(WFUserFocusActivityTrigger *)self activityTintColor];
  [v4 setActivityTintColor:v9];

  return v4;
}

- (id)suggestedActions
{
  v2 = +[WFActionRegistry sharedRegistry];
  v3 = [v2 createActionsWithIdentifiers:&unk_1F2317A00 serializedParameterArray:0];

  return v3;
}

- (WFUserFocusActivityTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFUserFocusActivityTrigger;
  v5 = [(WFTrigger *)&v24 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"onEnable"];
    v5->_onEnable = [v6 BOOLValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"onDisable"];
    v5->_onDisable = [v7 BOOLValue];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityGlyphName"];
    activityGlyphName = v5->_activityGlyphName;
    v5->_activityGlyphName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityTintColor"];
    activityTintColor = v5->_activityTintColor;
    v5->_activityTintColor = (WFColor *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activitySemanticIdentifier"];
    activitySemanticIdentifier = v5->_activitySemanticIdentifier;
    v5->_activitySemanticIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityName"];
    activityName = v5->_activityName;
    v5->_activityName = (NSString *)v14;

    if (![(NSString *)v5->_activityName length])
    {
      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedMode"];
      v17 = v5->_activityName;
      v5->_activityName = (NSString *)v16;
    }
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifier"];
    activityUniqueIdentifier = v5->_activityUniqueIdentifier;
    v5->_activityUniqueIdentifier = (NSString *)v18;

    if (![(NSString *)v5->_activityUniqueIdentifier length])
    {
      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedModeIdentifier"];
      v21 = v5->_activityUniqueIdentifier;
      v5->_activityUniqueIdentifier = (NSString *)v20;
    }
    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WFUserFocusActivityTrigger;
  id v4 = a3;
  [(WFTrigger *)&v12 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[WFUserFocusActivityTrigger onEnable](self, "onEnable", v12.receiver, v12.super_class));
  [v4 encodeObject:v5 forKey:@"onEnable"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[WFUserFocusActivityTrigger onDisable](self, "onDisable"));
  [v4 encodeObject:v6 forKey:@"onDisable"];

  v7 = [(WFUserFocusActivityTrigger *)self activityName];
  [v4 encodeObject:v7 forKey:@"activityName"];

  uint64_t v8 = [(WFUserFocusActivityTrigger *)self activitySemanticIdentifier];
  [v4 encodeObject:v8 forKey:@"activitySemanticIdentifier"];

  v9 = [(WFUserFocusActivityTrigger *)self activityUniqueIdentifier];
  [v4 encodeObject:v9 forKey:@"activityIdentifier"];

  uint64_t v10 = [(WFUserFocusActivityTrigger *)self activityGlyphName];
  [v4 encodeObject:v10 forKey:@"activityGlyphName"];

  objc_super v11 = [(WFUserFocusActivityTrigger *)self activityTintColor];
  [v4 encodeObject:v11 forKey:@"activityTintColor"];
}

- (id)localizedPastTenseDescription
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(WFUserFocusActivityTrigger *)self onEnable]
    && [(WFUserFocusActivityTrigger *)self onDisable])
  {
    v3 = NSString;
    id v4 = @"Turned %@ on or off";
LABEL_8:
    v5 = WFLocalizedString(v4);
    v6 = [(WFUserFocusActivityTrigger *)self activityName];
    objc_msgSend(v3, "localizedStringWithFormat:", v5, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if ([(WFUserFocusActivityTrigger *)self onEnable])
  {
    v3 = NSString;
    id v4 = @"Turned %@ on";
    goto LABEL_8;
  }
  if ([(WFUserFocusActivityTrigger *)self onDisable])
  {
    v3 = NSString;
    id v4 = @"Turned %@ off";
    goto LABEL_8;
  }
  v9 = getWFTriggersLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v11 = "-[WFUserFocusActivityTrigger localizedPastTenseDescription]";
    __int16 v12 = 2114;
    v13 = self;
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  v7 = &stru_1F229A4D8;
LABEL_9:
  return v7;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(WFUserFocusActivityTrigger *)self onEnable]
    && [(WFUserFocusActivityTrigger *)self onDisable])
  {
    v3 = NSString;
    id v4 = @"When turning %@ on or off";
LABEL_8:
    v5 = WFLocalizedString(v4);
    v6 = [(WFUserFocusActivityTrigger *)self activityName];
    objc_msgSend(v3, "localizedStringWithFormat:", v5, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if ([(WFUserFocusActivityTrigger *)self onEnable])
  {
    v3 = NSString;
    id v4 = @"When turning %@ on";
    goto LABEL_8;
  }
  if ([(WFUserFocusActivityTrigger *)self onDisable])
  {
    v3 = NSString;
    id v4 = @"When turning %@ off";
    goto LABEL_8;
  }
  v9 = getWFTriggersLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v11 = "-[WFUserFocusActivityTrigger localizedDescriptionWithConfigurationSummary]";
    __int16 v12 = 2114;
    v13 = self;
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  v7 = &stru_1F229A4D8;
LABEL_9:
  return v7;
}

- (BOOL)hasValidConfiguration
{
  if (![(WFUserFocusActivityTrigger *)self onEnable]
    && ![(WFUserFocusActivityTrigger *)self onDisable])
  {
    return 0;
  }
  v3 = [(WFUserFocusActivityTrigger *)self activityName];
  BOOL v4 = v3 != 0;

  return v4;
}

- (WFUserFocusActivityTrigger)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFUserFocusActivityTrigger;
  v2 = [(WFTrigger *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_onEnable = 1;
    v2->_onDisable = 0;
    BOOL v4 = v2;
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)WFUserFocusActivityTrigger;
  BOOL v4 = [(WFTrigger *)&v10 description];
  v5 = [(WFUserFocusActivityTrigger *)self activityName];
  objc_super v6 = [(WFUserFocusActivityTrigger *)self activitySemanticIdentifier];
  v7 = [(WFUserFocusActivityTrigger *)self activityUniqueIdentifier];
  uint64_t v8 = [v3 stringWithFormat:@"<%@, name: %@, id: %@, unique id: %@, onEnable: %i, onDisable: %i>", v4, v5, v6, v7, -[WFUserFocusActivityTrigger onEnable](self, "onEnable"), -[WFUserFocusActivityTrigger onDisable](self, "onDisable")];

  return v8;
}

- (id)displayGlyphTintColor
{
  v2 = [(WFUserFocusActivityTrigger *)self activityTintColor];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB45E0]);
    uint64_t v11 = 0;
    __int16 v12 = &v11;
    uint64_t v13 = 0x2050000000;
    objc_super v6 = (void *)getUIColorClass_softClass;
    uint64_t v14 = getUIColorClass_softClass;
    if (!getUIColorClass_softClass)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getUIColorClass_block_invoke;
      v10[3] = &unk_1E6558B78;
      v10[4] = &v11;
      __getUIColorClass_block_invoke((uint64_t)v10);
      objc_super v6 = (void *)v12[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v11, 8);
    uint64_t v8 = [v7 systemIndigoColor];
    id v4 = (id)[v5 initWithPlatformColor:v8];
  }
  return v4;
}

- (id)displayGlyph
{
  v2 = (void *)MEMORY[0x1E4FB4770];
  v3 = [(WFUserFocusActivityTrigger *)self displayGlyphName];
  id v4 = [v2 triggerDisplaySymbolNamed:v3 renderingMode:0];

  return v4;
}

- (id)localizedDisplayExplanation
{
  v3 = NSString;
  id v4 = WFLocalizedString(@"Ex. “When turning %@ on”");
  id v5 = [(WFUserFocusActivityTrigger *)self activityName];
  objc_super v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

  return v6;
}

- (WFUserFocusActivityTrigger)initWithActivity:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFUserFocusActivityTrigger;
  id v5 = [(WFTrigger *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 activityDisplayName];
    activityName = v5->_activityName;
    v5->_activityName = (NSString *)v6;

    uint64_t v8 = [v4 activityUniqueIdentifier];
    uint64_t v9 = [v8 UUIDString];
    activityUniqueIdentifier = v5->_activityUniqueIdentifier;
    v5->_activityUniqueIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 activityIdentifier];
    activitySemanticIdentifier = v5->_activitySemanticIdentifier;
    v5->_activitySemanticIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 activitySymbolImageName];
    activityGlyphName = v5->_activityGlyphName;
    v5->_activityGlyphName = (NSString *)v13;

    v5->_onEnable = 1;
    v5->_onDisable = 0;
    v15 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v16 = [v4 activityColorName];
    uint64_t v17 = [v15 colorWithFocusColorName:v16];
    activityTintColor = v5->_activityTintColor;
    v5->_activityTintColor = (WFColor *)v17;

    v19 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)offLabel
{
  return WFLocalizedString(@"When Turning Off");
}

+ (id)onLabel
{
  return WFLocalizedString(@"When Turning On");
}

+ (id)tintColor
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB45E0]) initWithRed:0.345098039 green:0.337254902 blue:0.839215686 alpha:1.0];
  return v2;
}

+ (id)offIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"moon.circle" renderingMode:0];
}

+ (id)onIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"moon.circle.fill" renderingMode:0];
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)displayGlyphName
{
  return @"moon.circle.fill";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When turning on Work”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Focus");
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