@interface WFBatteryLevelTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)supportsSecureCoding;
+ (id)displayGlyphHierarchicalColors;
+ (id)displayGlyphName;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (WFBatteryLevelTrigger)init;
- (WFBatteryLevelTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (unint64_t)level;
- (unint64_t)selection;
- (void)encodeWithCoder:(id)a3;
- (void)setLevel:(unint64_t)a3;
- (void)setSelection:(unint64_t)a3;
@end

@implementation WFBatteryLevelTrigger

- (void)setSelection:(unint64_t)a3
{
  self->_selection = a3;
}

- (unint64_t)selection
{
  return self->_selection;
}

- (void)setLevel:(unint64_t)a3
{
  self->_level = a3;
}

- (unint64_t)level
{
  return self->_level;
}

- (id)suggestedActions
{
  v2 = +[WFActionRegistry sharedRegistry];
  v3 = [v2 createActionsWithIdentifiers:&unk_1F2317A60 serializedParameterArray:0];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFBatteryLevelTrigger;
  id v4 = [(WFTrigger *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setLevel:", -[WFBatteryLevelTrigger level](self, "level"));
  objc_msgSend(v4, "setSelection:", -[WFBatteryLevelTrigger selection](self, "selection"));
  return v4;
}

- (WFBatteryLevelTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFBatteryLevelTrigger;
  v5 = [(WFTrigger *)&v12 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"level"];
    v7 = v6;
    if (v6) {
      uint64_t v8 = [v6 unsignedIntegerValue];
    }
    else {
      uint64_t v8 = 50;
    }
    [(WFBatteryLevelTrigger *)v5 setLevel:v8];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selection"];
    -[WFBatteryLevelTrigger setSelection:](v5, "setSelection:", [v9 unsignedIntegerValue]);
    v10 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFBatteryLevelTrigger;
  id v4 = a3;
  [(WFTrigger *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFBatteryLevelTrigger level](self, "level", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"level"];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFBatteryLevelTrigger selection](self, "selection"));
  [v4 encodeObject:v6 forKey:@"selection"];
}

- (id)localizedPastTenseDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28EE0];
  id v4 = NSNumber;
  *(float *)&double v5 = (float)[(WFBatteryLevelTrigger *)self level] / 100.0;
  objc_super v6 = [v4 numberWithFloat:v5];
  objc_super v7 = [v3 localizedStringFromNumber:v6 numberStyle:3];

  unint64_t v8 = [(WFBatteryLevelTrigger *)self selection];
  switch(v8)
  {
    case 2uLL:
      v9 = NSString;
      v10 = @"Battery level fell below %@";
      goto LABEL_7;
    case 1uLL:
      v9 = NSString;
      v10 = @"Battery level rose above %@";
      goto LABEL_7;
    case 0uLL:
      v9 = NSString;
      v10 = @"Battery level reached %@";
LABEL_7:
      v11 = WFLocalizedString(v10);
      objc_msgSend(v9, "localizedStringWithFormat:", v11, v7);
      objc_super v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
  }
  v13 = getWFTriggersLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFBatteryLevelTrigger localizedPastTenseDescription]";
    __int16 v17 = 2114;
    v18 = self;
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  objc_super v12 = &stru_1F229A4D8;
LABEL_11:

  return v12;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28EE0];
  id v4 = NSNumber;
  *(float *)&double v5 = (float)[(WFBatteryLevelTrigger *)self level] / 100.0;
  objc_super v6 = [v4 numberWithFloat:v5];
  objc_super v7 = [v3 localizedStringFromNumber:v6 numberStyle:3];

  unint64_t v8 = [(WFBatteryLevelTrigger *)self selection];
  switch(v8)
  {
    case 2uLL:
      v9 = NSString;
      v10 = @"When battery level falls below %@";
      goto LABEL_7;
    case 1uLL:
      v9 = NSString;
      v10 = @"When battery level rises above %@";
      goto LABEL_7;
    case 0uLL:
      v9 = NSString;
      v10 = @"When battery level is %@";
LABEL_7:
      v11 = WFLocalizedString(v10);
      objc_msgSend(v9, "localizedStringWithFormat:", v11, v7);
      objc_super v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
  }
  v13 = getWFTriggersLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFBatteryLevelTrigger localizedDescriptionWithConfigurationSummary]";
    __int16 v17 = 2114;
    v18 = self;
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

  objc_super v12 = &stru_1F229A4D8;
LABEL_11:

  return v12;
}

- (BOOL)hasValidConfiguration
{
  return [(WFBatteryLevelTrigger *)self level] < 0x65;
}

- (WFBatteryLevelTrigger)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFBatteryLevelTrigger;
  v2 = [(WFTrigger *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_level = 50;
    v2->_selection = 0;
    id v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)displayGlyphHierarchicalColors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB45E0] colorWithSystemColor:1];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4FB45E0] batteryOutlineColor];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)displayGlyphName
{
  return @"battery.75";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When battery level rises above 50%”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Battery Level");
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

@end