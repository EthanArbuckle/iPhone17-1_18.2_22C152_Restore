@interface WFSleepTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)isSupportedOnThisDevice;
+ (BOOL)supportsSecureCoding;
+ (id)displayGlyphName;
+ (id)displayGlyphTintColor;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (WFSleepTrigger)init;
- (WFSleepTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (unint64_t)selection;
- (void)encodeWithCoder:(id)a3;
- (void)setSelection:(unint64_t)a3;
@end

@implementation WFSleepTrigger

- (void)setSelection:(unint64_t)a3
{
  self->_selection = a3;
}

- (unint64_t)selection
{
  return self->_selection;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFSleepTrigger;
  id v4 = [(WFTrigger *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setSelection:", -[WFSleepTrigger selection](self, "selection"));
  return v4;
}

- (WFSleepTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFSleepTrigger;
  v5 = [(WFTrigger *)&v8 initWithCoder:v4];
  if (v5)
  {
    -[WFSleepTrigger setSelection:](v5, "setSelection:", (int)[v4 decodeIntForKey:@"selection"]);
    objc_super v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFSleepTrigger;
  id v4 = a3;
  [(WFTrigger *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFSleepTrigger selection](self, "selection", v5.receiver, v5.super_class), @"selection");
}

- (id)localizedPastTenseDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(WFSleepTrigger *)self selection])
  {
    v3 = @"Wind Down started";
    goto LABEL_7;
  }
  if ([(WFSleepTrigger *)self selection] == 1)
  {
    v3 = @"Bedtime started";
LABEL_7:
    WFLocalizedString(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ([(WFSleepTrigger *)self selection] == 2)
  {
    v3 = @"Woke Up";
    goto LABEL_7;
  }
  objc_super v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    objc_super v8 = "-[WFSleepTrigger localizedPastTenseDescription]";
    __int16 v9 = 2114;
    v10 = self;
    _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", (uint8_t *)&v7, 0x16u);
  }

  id v4 = &stru_1F229A4D8;
LABEL_8:
  return v4;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(WFSleepTrigger *)self selection])
  {
    v3 = @"When Wind Down starts";
    goto LABEL_7;
  }
  if ([(WFSleepTrigger *)self selection] == 1)
  {
    v3 = @"When Bedtime starts";
LABEL_7:
    WFLocalizedString(v3);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ([(WFSleepTrigger *)self selection] == 2)
  {
    v3 = @"When Waking Up";
    goto LABEL_7;
  }
  objc_super v6 = getWFTriggersLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    objc_super v8 = "-[WFSleepTrigger localizedDescriptionWithConfigurationSummary]";
    __int16 v9 = 2114;
    v10 = self;
    _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", (uint8_t *)&v7, 0x16u);
  }

  id v4 = &stru_1F229A4D8;
LABEL_8:
  return v4;
}

- (BOOL)hasValidConfiguration
{
  if ([(WFSleepTrigger *)self selection])
  {
    unint64_t v3 = [(WFSleepTrigger *)self selection];
    if (v3 != 1) {
      LOBYTE(v3) = [(WFSleepTrigger *)self selection] == 2;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (WFSleepTrigger)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFSleepTrigger;
  v2 = [(WFTrigger *)&v6 init];
  unint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When Wind Down starts”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedStringWithKey(@"Sleep trigger name", @"Sleep");
}

+ (BOOL)isSupportedOnThisDevice
{
  v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  BOOL v3 = [v2 idiom] != 1;

  return v3;
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)displayGlyphTintColor
{
  v2 = (void *)MEMORY[0x1E4FB45E0];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v2 colorNamed:@"SleepTriggerIconColor" inBundle:v3];

  return v4;
}

+ (id)displayGlyphName
{
  return @"bed.double.fill";
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

@end