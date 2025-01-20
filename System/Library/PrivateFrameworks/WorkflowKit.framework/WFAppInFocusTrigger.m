@interface WFAppInFocusTrigger
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
- (BOOL)onBackground;
- (BOOL)onFocus;
- (NSArray)selectedBundleIdentifiers;
- (WFAppInFocusTrigger)init;
- (WFAppInFocusTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (void)encodeWithCoder:(id)a3;
- (void)setOnBackground:(BOOL)a3;
- (void)setOnFocus:(BOOL)a3;
- (void)setSelectedBundleIdentifiers:(id)a3;
@end

@implementation WFAppInFocusTrigger

- (void).cxx_destruct
{
}

- (void)setOnBackground:(BOOL)a3
{
  self->_onBackground = a3;
}

- (BOOL)onBackground
{
  return self->_onBackground;
}

- (void)setOnFocus:(BOOL)a3
{
  self->_onFocus = a3;
}

- (BOOL)onFocus
{
  return self->_onFocus;
}

- (void)setSelectedBundleIdentifiers:(id)a3
{
}

- (NSArray)selectedBundleIdentifiers
{
  return self->_selectedBundleIdentifiers;
}

- (id)suggestedActions
{
  v2 = +[WFActionRegistry sharedRegistry];
  v3 = [v2 createActionsWithIdentifiers:&unk_1F2317400 serializedParameterArray:0];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFAppInFocusTrigger;
  id v4 = [(WFTrigger *)&v8 copyWithZone:a3];
  v5 = [(WFAppInFocusTrigger *)self selectedBundleIdentifiers];
  v6 = (void *)[v5 copy];
  [v4 setSelectedBundleIdentifiers:v6];

  return v4;
}

- (WFAppInFocusTrigger)initWithCoder:(id)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)WFAppInFocusTrigger;
  v5 = [(WFTrigger *)&v34 initWithCoder:v4];
  v6 = v5;
  if (!v5) {
    goto LABEL_17;
  }
  v7 = (void *)MEMORY[0x1E4F1CBF0];
  [(WFAppInFocusTrigger *)v5 setSelectedBundleIdentifiers:MEMORY[0x1E4F1CBF0]];
  if ([v4 containsValueForKey:@"appIdentifiers"])
  {
    objc_super v8 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"appIdentifiers"];
    v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = (uint64_t)v7;
    }
    [(WFAppInFocusTrigger *)v6 setSelectedBundleIdentifiers:v13];

LABEL_12:
    goto LABEL_13;
  }
  if ([v4 containsValueForKey:@"apps"])
  {
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    v16 = [v14 setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"apps"];
    v18 = (void *)v17;
    if (v17) {
      v19 = (void *)v17;
    }
    else {
      v19 = v7;
    }
    id v20 = v19;

    v9 = objc_msgSend(v20, "if_compactMap:", &__block_literal_global_11097);

    [(WFAppInFocusTrigger *)v6 setSelectedBundleIdentifiers:v9];
    goto LABEL_12;
  }
LABEL_13:
  if ([v4 containsValueForKey:@"onFocus"])
  {
    -[WFAppInFocusTrigger setOnFocus:](v6, "setOnFocus:", [v4 decodeBoolForKey:@"onFocus"]);
    uint64_t v21 = [v4 decodeBoolForKey:@"onBackground"];
  }
  else
  {
    [(WFAppInFocusTrigger *)v6 setOnFocus:1];
    uint64_t v21 = 0;
  }
  [(WFAppInFocusTrigger *)v6 setOnBackground:v21];
  v22 = [(WFAppInFocusTrigger *)v6 selectedBundleIdentifiers];
  v23 = objc_msgSend(v22, "if_objectsPassingTest:", &__block_literal_global_280);

  v24 = objc_opt_new();
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  v31 = __37__WFAppInFocusTrigger_initWithCoder___block_invoke_3;
  v32 = &unk_1E65591A0;
  id v33 = v24;
  id v25 = v24;
  [v23 enumerateObjectsUsingBlock:&v29];
  v26 = objc_msgSend(v25, "allObjects", v29, v30, v31, v32);
  [(WFAppInFocusTrigger *)v6 setSelectedBundleIdentifiers:v26];

  v27 = v6;
LABEL_17:

  return v6;
}

void __37__WFAppInFocusTrigger_initWithCoder___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];
  id v4 = [v3 applicationState];
  int v5 = [v4 isInstalled];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

uint64_t __37__WFAppInFocusTrigger_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*MEMORY[0x1E4FB4BE8]] ^ 1;
}

uint64_t __37__WFAppInFocusTrigger_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFAppInFocusTrigger;
  id v4 = a3;
  [(WFTrigger *)&v6 encodeWithCoder:v4];
  int v5 = [(WFAppInFocusTrigger *)self selectedBundleIdentifiers];
  [v4 encodeObject:v5 forKey:@"appIdentifiers"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFAppInFocusTrigger onFocus](self, "onFocus"), @"onFocus");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFAppInFocusTrigger onBackground](self, "onBackground"), @"onBackground");
}

- (id)localizedPastTenseDescription
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(WFAppInFocusTrigger *)self selectedBundleIdentifiers];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
    objc_super v6 = [(WFAppInFocusTrigger *)self selectedBundleIdentifiers];
    v7 = [v6 objectAtIndexedSubscript:0];
    objc_super v8 = (void *)[v5 initWithBundleIdentifier:v7 allowPlaceholder:1 error:0];

    v9 = [v8 localizedName];
    if ([(WFAppInFocusTrigger *)self onFocus] && [(WFAppInFocusTrigger *)self onBackground])
    {
      v10 = NSString;
      uint64_t v11 = @"Opened or closed “%@”";
    }
    else if ([(WFAppInFocusTrigger *)self onFocus])
    {
      v10 = NSString;
      uint64_t v11 = @"Opened “%@”";
    }
    else
    {
      if (![(WFAppInFocusTrigger *)self onBackground])
      {
        v19 = getWFTriggersLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v22 = "-[WFAppInFocusTrigger localizedPastTenseDescription]";
          __int16 v23 = 2114;
          v24 = self;
          _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
        }

        v15 = &stru_1F229A4D8;
        goto LABEL_15;
      }
      v10 = NSString;
      uint64_t v11 = @"Closed “%@”";
    }
    v14 = WFLocalizedString(v11);
    objc_msgSend(v10, "localizedStringWithFormat:", v14, v9);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    goto LABEL_19;
  }
  if ([(WFAppInFocusTrigger *)self onFocus] && [(WFAppInFocusTrigger *)self onBackground])
  {
    v12 = NSString;
    uint64_t v13 = @"Opened or closed any of %lu apps";
LABEL_18:
    v16 = WFLocalizedString(v13);
    uint64_t v17 = [(WFAppInFocusTrigger *)self selectedBundleIdentifiers];
    objc_msgSend(v12, "localizedStringWithFormat:", v16, objc_msgSend(v17, "count"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  if ([(WFAppInFocusTrigger *)self onFocus])
  {
    v12 = NSString;
    uint64_t v13 = @"Opened any of %lu apps";
    goto LABEL_18;
  }
  if ([(WFAppInFocusTrigger *)self onBackground])
  {
    v12 = NSString;
    uint64_t v13 = @"Closed any of %lu apps";
    goto LABEL_18;
  }
  id v20 = getWFTriggersLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[WFAppInFocusTrigger localizedPastTenseDescription]";
    __int16 v23 = 2114;
    v24 = self;
    _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  v15 = &stru_1F229A4D8;
LABEL_19:
  return v15;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(WFAppInFocusTrigger *)self selectedBundleIdentifiers];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
    objc_super v6 = [(WFAppInFocusTrigger *)self selectedBundleIdentifiers];
    v7 = [v6 objectAtIndexedSubscript:0];
    objc_super v8 = (void *)[v5 initWithBundleIdentifier:v7 allowPlaceholder:1 error:0];

    v9 = [v8 localizedName];
    if ([(WFAppInFocusTrigger *)self onFocus] && [(WFAppInFocusTrigger *)self onBackground])
    {
      v10 = NSString;
      uint64_t v11 = @"When “%@” is opened or closed";
    }
    else if ([(WFAppInFocusTrigger *)self onFocus])
    {
      v10 = NSString;
      uint64_t v11 = @"When “%@” is opened";
    }
    else
    {
      if (![(WFAppInFocusTrigger *)self onBackground])
      {
        v19 = getWFTriggersLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v22 = "-[WFAppInFocusTrigger localizedDescriptionWithConfigurationSummary]";
          __int16 v23 = 2114;
          v24 = self;
          _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
        }

        v15 = &stru_1F229A4D8;
        goto LABEL_15;
      }
      v10 = NSString;
      uint64_t v11 = @"When “%@” is closed";
    }
    v14 = WFLocalizedString(v11);
    objc_msgSend(v10, "localizedStringWithFormat:", v14, v9);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    goto LABEL_19;
  }
  if ([(WFAppInFocusTrigger *)self onFocus] && [(WFAppInFocusTrigger *)self onBackground])
  {
    v12 = NSString;
    uint64_t v13 = @"When any of %lu apps are opened or closed";
LABEL_18:
    v16 = WFLocalizedPluralString(v13);
    uint64_t v17 = [(WFAppInFocusTrigger *)self selectedBundleIdentifiers];
    objc_msgSend(v12, "localizedStringWithFormat:", v16, objc_msgSend(v17, "count"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  if ([(WFAppInFocusTrigger *)self onFocus])
  {
    v12 = NSString;
    uint64_t v13 = @"When any of %lu apps are opened";
    goto LABEL_18;
  }
  if ([(WFAppInFocusTrigger *)self onBackground])
  {
    v12 = NSString;
    uint64_t v13 = @"When any of %lu apps are closed";
    goto LABEL_18;
  }
  id v20 = getWFTriggersLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[WFAppInFocusTrigger localizedDescriptionWithConfigurationSummary]";
    __int16 v23 = 2114;
    v24 = self;
    _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  v15 = &stru_1F229A4D8;
LABEL_19:
  return v15;
}

- (BOOL)hasValidConfiguration
{
  v3 = [(WFAppInFocusTrigger *)self selectedBundleIdentifiers];
  if ([v3 count]) {
    BOOL v4 = [(WFAppInFocusTrigger *)self onFocus] || [(WFAppInFocusTrigger *)self onBackground];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (WFAppInFocusTrigger)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFAppInFocusTrigger;
  v2 = [(WFTrigger *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    selectedBundleIdentifiers = v2->_selectedBundleIdentifiers;
    v2->_selectedBundleIdentifiers = (NSArray *)v3;

    v2->_onFocus = 1;
    id v5 = v2;
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)offLabel
{
  return WFLocalizedString(@"Is Closed");
}

+ (id)onLabel
{
  return WFLocalizedString(@"Is Opened");
}

+ (id)tintColor
{
  v2 = (void *)MEMORY[0x1E4FB45E0];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v4 = [v2 colorNamed:@"AppTriggerIconColor" inBundle:v3];

  return v4;
}

+ (id)offIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"xmark.app.fill" renderingMode:0];
}

+ (id)onIcon
{
  return (id)[MEMORY[0x1E4FB4770] triggerConfigurationSymbolNamed:@"arrow.up.forward.app.fill" renderingMode:0];
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)displayGlyphName
{
  return @"arrow.up.forward.app.fill";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When “Weather” is opened or closed”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"App");
}

+ (BOOL)isSupportedOnThisDevice
{
  return 1;
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