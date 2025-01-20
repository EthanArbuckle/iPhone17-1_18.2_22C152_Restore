@interface WFWorkoutTrigger
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
+ (id)stopColor;
+ (id)workoutColors;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (BOOL)onEnd;
- (BOOL)onStart;
- (NSArray)selectedWorkoutTypes;
- (WFWorkoutTrigger)init;
- (WFWorkoutTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (unint64_t)selection;
- (void)encodeWithCoder:(id)a3;
- (void)setOnEnd:(BOOL)a3;
- (void)setOnStart:(BOOL)a3;
- (void)setSelectedWorkoutTypes:(id)a3;
- (void)setSelection:(unint64_t)a3;
@end

@implementation WFWorkoutTrigger

- (void).cxx_destruct
{
}

- (void)setOnEnd:(BOOL)a3
{
  self->_onEnd = a3;
}

- (BOOL)onEnd
{
  return self->_onEnd;
}

- (void)setOnStart:(BOOL)a3
{
  self->_onStart = a3;
}

- (BOOL)onStart
{
  return self->_onStart;
}

- (void)setSelectedWorkoutTypes:(id)a3
{
}

- (NSArray)selectedWorkoutTypes
{
  return self->_selectedWorkoutTypes;
}

- (void)setSelection:(unint64_t)a3
{
  self->_selection = a3;
}

- (unint64_t)selection
{
  return self->_selection;
}

- (id)suggestedActions
{
  v2 = +[WFActionRegistry sharedRegistry];
  v3 = [v2 createActionsWithIdentifiers:&unk_1F2317B38 serializedParameterArray:0];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFWorkoutTrigger;
  id v4 = [(WFTrigger *)&v8 copyWithZone:a3];
  objc_msgSend(v4, "setSelection:", -[WFWorkoutTrigger selection](self, "selection"));
  v5 = [(WFWorkoutTrigger *)self selectedWorkoutTypes];
  v6 = (void *)[v5 copy];
  [v4 setSelectedWorkoutTypes:v6];

  objc_msgSend(v4, "setOnStart:", -[WFWorkoutTrigger onStart](self, "onStart"));
  objc_msgSend(v4, "setOnEnd:", -[WFWorkoutTrigger onEnd](self, "onEnd"));
  return v4;
}

- (WFWorkoutTrigger)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFWorkoutTrigger;
  v5 = [(WFTrigger *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selection"];
    v7 = v6;
    if (v6) {
      uint64_t v8 = [v6 unsignedIntegerValue];
    }
    else {
      uint64_t v8 = 1;
    }
    v5->_selection = v8;
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    v11 = [v9 setWithArray:v10];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"selectedWorkouts"];
    v13 = (void *)v12;
    if (v12) {
      v14 = (void *)v12;
    }
    else {
      v14 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_selectedWorkoutTypes, v14);

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"onStart"];
    v5->_onStart = [v15 BOOLValue];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"onEnd"];
    v5->_onEnd = [v16 BOOLValue];

    v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFWorkoutTrigger;
  id v4 = a3;
  [(WFTrigger *)&v9 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFWorkoutTrigger selection](self, "selection", v9.receiver, v9.super_class));
  [v4 encodeObject:v5 forKey:@"selection"];

  v6 = [(WFWorkoutTrigger *)self selectedWorkoutTypes];
  [v4 encodeObject:v6 forKey:@"selectedWorkouts"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[WFWorkoutTrigger onStart](self, "onStart"));
  [v4 encodeObject:v7 forKey:@"onStart"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[WFWorkoutTrigger onEnd](self, "onEnd"));
  [v4 encodeObject:v8 forKey:@"onEnd"];
}

- (id)localizedPastTenseDescription
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(WFWorkoutTrigger *)self selection])
  {
    v3 = [(WFWorkoutTrigger *)self selectedWorkoutTypes];
    uint64_t v4 = [v3 count];

    if (v4 == 1)
    {
      v5 = [WFWorkoutType alloc];
      v6 = [(WFWorkoutTrigger *)self selectedWorkoutTypes];
      v7 = [v6 firstObject];
      uint64_t v8 = -[WFWorkoutType initWithActivityType:](v5, "initWithActivityType:", [v7 unsignedIntegerValue]);
      objc_super v9 = [(WFWorkoutType *)v8 name];

      if ([(WFWorkoutTrigger *)self onStart] && [(WFWorkoutTrigger *)self onEnd])
      {
        v10 = NSString;
        v11 = @"%@ workout started or ended";
      }
      else if ([(WFWorkoutTrigger *)self onStart])
      {
        v10 = NSString;
        v11 = @"%@ workout started";
      }
      else
      {
        if (![(WFWorkoutTrigger *)self onEnd])
        {
          v20 = getWFTriggersLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v23 = "-[WFWorkoutTrigger localizedPastTenseDescription]";
            __int16 v24 = 2114;
            v25 = self;
            _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
          }

          v15 = &stru_1F229A4D8;
          goto LABEL_24;
        }
        v10 = NSString;
        v11 = @"%@ workout ended";
      }
      v16 = WFLocalizedString(v11);
      objc_msgSend(v10, "localizedStringWithFormat:", v16, v9);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_24:
      goto LABEL_36;
    }
    if ([(WFWorkoutTrigger *)self onStart] && [(WFWorkoutTrigger *)self onEnd])
    {
      v13 = NSString;
      v14 = @"Any of %lu workouts started or ended";
LABEL_27:
      v17 = WFLocalizedPluralString(v14);
      v18 = [(WFWorkoutTrigger *)self selectedWorkoutTypes];
      objc_msgSend(v13, "localizedStringWithFormat:", v17, objc_msgSend(v18, "count"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    }
    if ([(WFWorkoutTrigger *)self onStart])
    {
      v13 = NSString;
      v14 = @"Any of %lu workouts started";
      goto LABEL_27;
    }
    if ([(WFWorkoutTrigger *)self onEnd])
    {
      v13 = NSString;
      v14 = @"Any of %lu workouts ended";
      goto LABEL_27;
    }
    objc_super v19 = getWFTriggersLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if ([(WFWorkoutTrigger *)self onStart] && [(WFWorkoutTrigger *)self onEnd])
  {
    uint64_t v12 = @"Any workout started or ended";
LABEL_20:
    WFLocalizedString(v12);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if ([(WFWorkoutTrigger *)self onStart])
  {
    uint64_t v12 = @"Any workout started";
    goto LABEL_20;
  }
  if ([(WFWorkoutTrigger *)self onEnd])
  {
    uint64_t v12 = @"Any workout ended";
    goto LABEL_20;
  }
  objc_super v19 = getWFTriggersLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
LABEL_34:
    *(_DWORD *)buf = 136315394;
    v23 = "-[WFWorkoutTrigger localizedPastTenseDescription]";
    __int16 v24 = 2114;
    v25 = self;
    _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }
LABEL_35:

  v15 = &stru_1F229A4D8;
LABEL_36:
  return v15;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(WFWorkoutTrigger *)self selection])
  {
    v3 = [(WFWorkoutTrigger *)self selectedWorkoutTypes];
    uint64_t v4 = [v3 count];

    if (v4 == 1)
    {
      v5 = [WFWorkoutType alloc];
      v6 = [(WFWorkoutTrigger *)self selectedWorkoutTypes];
      v7 = [v6 firstObject];
      uint64_t v8 = -[WFWorkoutType initWithActivityType:](v5, "initWithActivityType:", [v7 unsignedIntegerValue]);
      objc_super v9 = [(WFWorkoutType *)v8 name];

      if ([(WFWorkoutTrigger *)self onStart] && [(WFWorkoutTrigger *)self onEnd])
      {
        v10 = NSString;
        v11 = @"When I start or end a %@ workout";
      }
      else if ([(WFWorkoutTrigger *)self onStart])
      {
        v10 = NSString;
        v11 = @"When I start a %@ workout";
      }
      else
      {
        if (![(WFWorkoutTrigger *)self onEnd])
        {
          v20 = getWFTriggersLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v23 = "-[WFWorkoutTrigger localizedDescriptionWithConfigurationSummary]";
            __int16 v24 = 2114;
            v25 = self;
            _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
          }

          v15 = &stru_1F229A4D8;
          goto LABEL_24;
        }
        v10 = NSString;
        v11 = @"When I end a %@ workout";
      }
      v16 = WFLocalizedString(v11);
      objc_msgSend(v10, "localizedStringWithFormat:", v16, v9);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_24:
      goto LABEL_36;
    }
    if ([(WFWorkoutTrigger *)self onStart] && [(WFWorkoutTrigger *)self onEnd])
    {
      v13 = NSString;
      v14 = @"When I start or end any of %lu workouts";
LABEL_27:
      v17 = WFLocalizedPluralString(v14);
      v18 = [(WFWorkoutTrigger *)self selectedWorkoutTypes];
      objc_msgSend(v13, "localizedStringWithFormat:", v17, objc_msgSend(v18, "count"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    }
    if ([(WFWorkoutTrigger *)self onStart])
    {
      v13 = NSString;
      v14 = @"When I start any of %lu workouts";
      goto LABEL_27;
    }
    if ([(WFWorkoutTrigger *)self onEnd])
    {
      v13 = NSString;
      v14 = @"When I end any of %lu workouts";
      goto LABEL_27;
    }
    objc_super v19 = getWFTriggersLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if ([(WFWorkoutTrigger *)self onStart] && [(WFWorkoutTrigger *)self onEnd])
  {
    uint64_t v12 = @"When I start or end any workout";
LABEL_20:
    WFLocalizedString(v12);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if ([(WFWorkoutTrigger *)self onStart])
  {
    uint64_t v12 = @"When I start any workout";
    goto LABEL_20;
  }
  if ([(WFWorkoutTrigger *)self onEnd])
  {
    uint64_t v12 = @"When I end any workout";
    goto LABEL_20;
  }
  objc_super v19 = getWFTriggersLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
LABEL_34:
    *(_DWORD *)buf = 136315394;
    v23 = "-[WFWorkoutTrigger localizedDescriptionWithConfigurationSummary]";
    __int16 v24 = 2114;
    v25 = self;
    _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }
LABEL_35:

  v15 = &stru_1F229A4D8;
LABEL_36:
  return v15;
}

- (BOOL)hasValidConfiguration
{
  BOOL v3 = [(WFWorkoutTrigger *)self onStart] || [(WFWorkoutTrigger *)self onEnd];
  if ([(WFWorkoutTrigger *)self selection])
  {
    uint64_t v4 = [(WFWorkoutTrigger *)self selectedWorkoutTypes];
    uint64_t v5 = [v4 count];

    if (!v5) {
      return 0;
    }
  }
  return v3;
}

- (WFWorkoutTrigger)init
{
  v8.receiver = self;
  v8.super_class = (Class)WFWorkoutTrigger;
  v2 = [(WFTrigger *)&v8 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_selection = 0;
    uint64_t v4 = objc_opt_new();
    selectedWorkoutTypes = v3->_selectedWorkoutTypes;
    v3->_selectedWorkoutTypes = (NSArray *)v4;

    v3->_onStart = 1;
    v6 = v3;
  }

  return v3;
}

+ (id)stopColor
{
  return (id)[MEMORY[0x1E4FB45E0] colorWithRed:0.917647064 green:0.305882365 blue:0.239215687 alpha:1.0];
}

+ (id)workoutColors
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB45E0] colorWithWhite:0.0 alpha:1.0];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB45E0], "colorWithRed:green:blue:alpha:", 0.725490212, 0.992156863, 0.313725501, 1.0, v2);
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4FB45E0] colorWithRed:0.725490212 green:0.992156863 blue:0.313725501 alpha:1.0];
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)offLabel
{
  return WFLocalizedString(@"Ends");
}

+ (id)onLabel
{
  return WFLocalizedString(@"Starts");
}

+ (id)offIcon
{
  v11[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4FB4770];
  uint64_t v4 = [a1 stopColor];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB45E0], "colorWithWhite:alpha:", 1.0, 1.0, v4);
  v11[1] = v5;
  v6 = [a1 stopColor];
  v7 = [v6 colorWithAlphaComponent:0.140000001];
  v11[2] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  objc_super v9 = [v3 triggerConfigurationSymbolNamed:@"xmark.circle.fill" hierarchicalColors:v8];

  return v9;
}

+ (id)onIcon
{
  v2 = (void *)MEMORY[0x1E4FB4770];
  BOOL v3 = [a1 workoutColors];
  uint64_t v4 = [v2 triggerConfigurationSymbolNamed:@"figure.run.circle.fill" hierarchicalColors:v3];

  return v4;
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)displayGlyphName
{
  return @"figure.run.circle.fill";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When I start a workout”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Apple Watch Workout");
}

+ (BOOL)isSupportedOnThisDevice
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(objc_class *)getNRPairedDeviceRegistryClass() sharedInstance];
  BOOL v3 = [v2 getPairedDevices];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = softLinkNRWatchOSVersionForRemoteDevice(*(void **)(*((void *)&v9 + 1) + 8 * i));
        if (((uint64_t (*(*)(uint64_t, uint64_t))())softLinkNRVersionIsGreaterThanOrEqual)(v7, 393216))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
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