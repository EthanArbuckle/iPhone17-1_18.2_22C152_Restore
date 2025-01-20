@interface WFAlarmTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)supportsSecureCoding;
+ (id)displayGlyphName;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (NSArray)alarmIDs;
- (NSArray)cachedAlarmDescriptions;
- (WFAlarmTrigger)init;
- (WFAlarmTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (int64_t)alarmState;
- (int64_t)alarmType;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarmIDs:(id)a3;
- (void)setAlarmState:(int64_t)a3;
- (void)setAlarmType:(int64_t)a3;
- (void)setCachedAlarmDescriptions:(id)a3;
@end

@implementation WFAlarmTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAlarmDescriptions, 0);
  objc_storeStrong((id *)&self->_alarmIDs, 0);
}

- (void)setAlarmState:(int64_t)a3
{
  self->_alarmState = a3;
}

- (int64_t)alarmState
{
  return self->_alarmState;
}

- (void)setCachedAlarmDescriptions:(id)a3
{
}

- (NSArray)cachedAlarmDescriptions
{
  return self->_cachedAlarmDescriptions;
}

- (void)setAlarmIDs:(id)a3
{
}

- (NSArray)alarmIDs
{
  return self->_alarmIDs;
}

- (void)setAlarmType:(int64_t)a3
{
  self->_alarmType = a3;
}

- (int64_t)alarmType
{
  return self->_alarmType;
}

- (id)suggestedActions
{
  v2 = +[WFActionRegistry sharedRegistry];
  v3 = [v2 createActionsWithIdentifiers:&unk_1F2317B20 serializedParameterArray:0];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFAlarmTrigger;
  id v4 = [(WFTrigger *)&v10 copyWithZone:a3];
  objc_msgSend(v4, "setAlarmType:", -[WFAlarmTrigger alarmType](self, "alarmType"));
  v5 = [(WFAlarmTrigger *)self alarmIDs];
  v6 = (void *)[v5 copy];
  [v4 setAlarmIDs:v6];

  v7 = [(WFAlarmTrigger *)self cachedAlarmDescriptions];
  v8 = (void *)[v7 copy];
  [v4 setCachedAlarmDescriptions:v8];

  objc_msgSend(v4, "setAlarmState:", -[WFAlarmTrigger alarmState](self, "alarmState"));
  return v4;
}

- (WFAlarmTrigger)initWithCoder:(id)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)WFAlarmTrigger;
  v5 = [(WFTrigger *)&v31 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alarmType"];
    v7 = v6;
    if (v6)
    {
      -[WFAlarmTrigger setAlarmType:](v5, "setAlarmType:", [v6 integerValue]);
      v8 = (void *)MEMORY[0x1E4F1CAD0];
      v35[0] = objc_opt_class();
      v35[1] = objc_opt_class();
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
      objc_super v10 = [v8 setWithArray:v9];
      uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"alarmIDs"];
      v12 = (void *)v11;
      uint64_t v13 = MEMORY[0x1E4F1CBF0];
      if (v11) {
        uint64_t v14 = v11;
      }
      else {
        uint64_t v14 = MEMORY[0x1E4F1CBF0];
      }
      [(WFAlarmTrigger *)v5 setAlarmIDs:v14];

      v15 = (void *)MEMORY[0x1E4F1CAD0];
      v34[0] = objc_opt_class();
      v34[1] = objc_opt_class();
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
      v17 = [v15 setWithArray:v16];
      uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"cachedAlarmDescriptions"];
      v19 = (void *)v18;
      if (v18) {
        uint64_t v20 = v18;
      }
      else {
        uint64_t v20 = v13;
      }
      [(WFAlarmTrigger *)v5 setCachedAlarmDescriptions:v20];

      if ([(WFAlarmTrigger *)v5 alarmType] == 1)
      {
        v21 = [(WFAlarmTrigger *)v5 alarmIDs];
        uint64_t v22 = [v21 count];

        if (!v22)
        {
          v23 = getWFTriggersLogObject();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v33 = "-[WFAlarmTrigger initWithCoder:]";
            _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_ERROR, "%s alarm type existing, but no alarmIDs", buf, 0xCu);
          }

          [(WFAlarmTrigger *)v5 setAlarmType:0];
        }
      }
    }
    else
    {
      [(WFAlarmTrigger *)v5 setAlarmType:0];
      [(WFAlarmTrigger *)v5 setAlarmIDs:MEMORY[0x1E4F1CBF0]];
    }
    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alarmState"];
    v25 = v24;
    if (v24) {
      uint64_t v26 = [v24 integerValue];
    }
    else {
      uint64_t v26 = 2;
    }
    [(WFAlarmTrigger *)v5 setAlarmState:v26];
    v27 = [MEMORY[0x1E4FB46B8] currentDevice];
    if ([v27 idiom] == 1)
    {
      uint64_t v28 = [(WFAlarmTrigger *)v5 alarmType];

      if (v28 == 2) {
        [(WFAlarmTrigger *)v5 setAlarmType:1];
      }
    }
    else
    {
    }
    v29 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFAlarmTrigger;
  id v4 = a3;
  [(WFTrigger *)&v9 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFAlarmTrigger alarmType](self, "alarmType", v9.receiver, v9.super_class));
  [v4 encodeObject:v5 forKey:@"alarmType"];

  v6 = [(WFAlarmTrigger *)self alarmIDs];
  [v4 encodeObject:v6 forKey:@"alarmIDs"];

  v7 = [(WFAlarmTrigger *)self cachedAlarmDescriptions];
  [v4 encodeObject:v7 forKey:@"cachedAlarmDescriptions"];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFAlarmTrigger alarmState](self, "alarmState"));
  [v4 encodeObject:v8 forKey:@"alarmState"];
}

- (id)localizedPastTenseDescription
{
  int64_t v4 = [(WFAlarmTrigger *)self alarmType];
  if (v4 == 2)
  {
    int64_t v12 = [(WFAlarmTrigger *)self alarmState];
    if (v12 == 2)
    {
      v6 = @"My wake-up alarm stopped";
    }
    else if (v12 == 1)
    {
      v6 = @"My wake-up alarm snoozed";
    }
    else
    {
      if (v12) {
        goto LABEL_33;
      }
      v6 = @"My wake-up alarm went off";
    }
    goto LABEL_25;
  }
  if (v4 != 1)
  {
    if (v4) {
      goto LABEL_33;
    }
    int64_t v5 = [(WFAlarmTrigger *)self alarmState];
    if (v5 == 2)
    {
      v6 = @"Any alarm stopped";
    }
    else if (v5 == 1)
    {
      v6 = @"Any alarm snoozed";
    }
    else
    {
      if (v5) {
        goto LABEL_33;
      }
      v6 = @"Any alarm went off";
    }
LABEL_25:
    v2 = WFLocalizedString(v6);
    goto LABEL_33;
  }
  v2 = [(WFAlarmTrigger *)self alarmIDs];
  uint64_t v7 = [v2 count];

  if (v7 == 1)
  {
    v2 = [(WFAlarmTrigger *)self cachedAlarmDescriptions];
    v8 = [v2 firstObject];

    int64_t v9 = [(WFAlarmTrigger *)self alarmState];
    if (v9 == 2)
    {
      objc_super v10 = NSString;
      uint64_t v11 = @"My %@ alarm stopped";
    }
    else if (v9 == 1)
    {
      objc_super v10 = NSString;
      uint64_t v11 = @"My %@ alarm snoozed";
    }
    else
    {
      if (v9)
      {
LABEL_29:

        goto LABEL_33;
      }
      objc_super v10 = NSString;
      uint64_t v11 = @"My %@ went off";
    }
    v16 = WFLocalizedString(v11);
    v2 = objc_msgSend(v10, "localizedStringWithFormat:", v16, v8);

    goto LABEL_29;
  }
  int64_t v13 = [(WFAlarmTrigger *)self alarmState];
  if (v13 == 2)
  {
    uint64_t v14 = NSString;
    v15 = @"Any of %lu alarms stopped";
  }
  else if (v13 == 1)
  {
    uint64_t v14 = NSString;
    v15 = @"Any of %lu alarms snoozed";
  }
  else
  {
    if (v13) {
      goto LABEL_33;
    }
    uint64_t v14 = NSString;
    v15 = @"Any of %lu alarms went off";
  }
  v17 = WFLocalizedPluralString(v15);
  v2 = objc_msgSend(v14, "localizedStringWithFormat:", v17, v7);

LABEL_33:
  return v2;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  int64_t v4 = [(WFAlarmTrigger *)self alarmType];
  if (v4 == 2)
  {
    int64_t v12 = [(WFAlarmTrigger *)self alarmState];
    if (v12 == 2)
    {
      v6 = @"When my wake-up alarm is stopped";
    }
    else if (v12 == 1)
    {
      v6 = @"When my wake-up alarm is snoozed";
    }
    else
    {
      if (v12) {
        goto LABEL_33;
      }
      v6 = @"When my wake-up alarm goes off";
    }
    goto LABEL_25;
  }
  if (v4 != 1)
  {
    if (v4) {
      goto LABEL_33;
    }
    int64_t v5 = [(WFAlarmTrigger *)self alarmState];
    if (v5 == 2)
    {
      v6 = @"When any alarm is stopped";
    }
    else if (v5 == 1)
    {
      v6 = @"When any alarm is snoozed";
    }
    else
    {
      if (v5) {
        goto LABEL_33;
      }
      v6 = @"When any alarm goes off";
    }
LABEL_25:
    v2 = WFLocalizedString(v6);
    goto LABEL_33;
  }
  v2 = [(WFAlarmTrigger *)self alarmIDs];
  uint64_t v7 = [v2 count];

  if (v7 == 1)
  {
    v2 = [(WFAlarmTrigger *)self cachedAlarmDescriptions];
    v8 = [v2 firstObject];

    int64_t v9 = [(WFAlarmTrigger *)self alarmState];
    if (v9 == 2)
    {
      objc_super v10 = NSString;
      uint64_t v11 = @"When my %@ alarm is stopped";
    }
    else if (v9 == 1)
    {
      objc_super v10 = NSString;
      uint64_t v11 = @"When my %@ alarm is snoozed";
    }
    else
    {
      if (v9)
      {
LABEL_29:

        goto LABEL_33;
      }
      objc_super v10 = NSString;
      uint64_t v11 = @"When my %@ alarm goes off";
    }
    v16 = WFLocalizedString(v11);
    v2 = objc_msgSend(v10, "localizedStringWithFormat:", v16, v8);

    goto LABEL_29;
  }
  int64_t v13 = [(WFAlarmTrigger *)self alarmState];
  if (v13 == 2)
  {
    uint64_t v14 = NSString;
    v15 = @"When any of %lu alarms is stopped";
  }
  else if (v13 == 1)
  {
    uint64_t v14 = NSString;
    v15 = @"When any of %lu alarms is snoozed";
  }
  else
  {
    if (v13) {
      goto LABEL_33;
    }
    uint64_t v14 = NSString;
    v15 = @"When any of %lu alarms go off";
  }
  v17 = WFLocalizedPluralString(v15);
  v2 = objc_msgSend(v14, "localizedStringWithFormat:", v17, v7);

LABEL_33:
  return v2;
}

- (BOOL)hasValidConfiguration
{
  BOOL result = ([(WFAlarmTrigger *)self alarmType] != 1
         || ([(WFAlarmTrigger *)self alarmIDs],
             v3 = objc_claimAutoreleasedReturnValue(),
             uint64_t v4 = [v3 count],
             v3,
             v4))
        && ([(WFAlarmTrigger *)self alarmState] == 1
         || [(WFAlarmTrigger *)self alarmState] == 2
         || ![(WFAlarmTrigger *)self alarmState]);
  return result;
}

- (WFAlarmTrigger)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFAlarmTrigger;
  v2 = [(WFTrigger *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_alarmType = 0;
    alarmIDs = v2->_alarmIDs;
    int64_t v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_alarmIDs = (NSArray *)MEMORY[0x1E4F1CBF0];

    cachedAlarmDescriptions = v3->_cachedAlarmDescriptions;
    v3->_cachedAlarmDescriptions = v5;

    v3->_alarmState = 2;
    uint64_t v7 = v3;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)displayGlyphName
{
  return @"clock.fill";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When my alarm is stopped”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Alarm");
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

@end