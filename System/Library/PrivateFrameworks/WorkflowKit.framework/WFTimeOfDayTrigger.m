@interface WFTimeOfDayTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)supportsSecureCoding;
+ (id)dateFormatter;
+ (id)displayGlyphName;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (id)localizedRecurrenceDescriptionForDaysOfWeek:(id)a3 dayOfMonth:(id)a4 mode:(unint64_t)a5;
+ (id)localizedSunriseSunsetDescriptionForTriggerEvent:(unint64_t)a3 timeOffset:(unint64_t)a4;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (BOOL)isEqual:(id)a3;
- (NSArray)daysOfWeek;
- (NSDateComponents)time;
- (NSNumber)dayOfMonth;
- (WFTimeOfDayTrigger)init;
- (WFTimeOfDayTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)suggestedActions;
- (unint64_t)event;
- (unint64_t)mode;
- (unint64_t)timeOffset;
- (void)encodeWithCoder:(id)a3;
- (void)setDayOfMonth:(id)a3;
- (void)setDaysOfWeek:(id)a3;
- (void)setEvent:(unint64_t)a3;
- (void)setMode:(unint64_t)a3;
- (void)setTime:(id)a3;
- (void)setTimeOffset:(unint64_t)a3;
@end

@implementation WFTimeOfDayTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayOfMonth, 0);
  objc_storeStrong((id *)&self->_daysOfWeek, 0);
  objc_storeStrong((id *)&self->_time, 0);
}

- (void)setDayOfMonth:(id)a3
{
}

- (NSNumber)dayOfMonth
{
  return self->_dayOfMonth;
}

- (void)setDaysOfWeek:(id)a3
{
}

- (NSArray)daysOfWeek
{
  return self->_daysOfWeek;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setTime:(id)a3
{
}

- (NSDateComponents)time
{
  return self->_time;
}

- (void)setTimeOffset:(unint64_t)a3
{
  self->_timeOffset = a3;
}

- (unint64_t)timeOffset
{
  return self->_timeOffset;
}

- (void)setEvent:(unint64_t)a3
{
  self->_event = a3;
}

- (unint64_t)event
{
  return self->_event;
}

- (id)suggestedActions
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = +[WFActionRegistry sharedRegistry];
  v11 = @"ShowWhenRun";
  v12[0] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v4 = [v2 createActionWithIdentifier:@"is.workflow.actions.sendmessage" serializedParameters:v3];

  v5 = +[WFActionRegistry sharedRegistry];
  v6 = [v5 createActionsWithIdentifiers:&unk_1F2317CD0 serializedParameterArray:0];

  if (v4)
  {
    v10 = v4;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    uint64_t v8 = [v7 arrayByAddingObjectsFromArray:v6];

    v6 = (void *)v8;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFTimeOfDayTrigger *)a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v4 == self)
      {
        LOBYTE(v13) = 1;
      }
      else
      {
        unint64_t v5 = [(WFTimeOfDayTrigger *)self event];
        if (v5 == [(WFTimeOfDayTrigger *)v4 event])
        {
          unint64_t v6 = [(WFTimeOfDayTrigger *)self mode];
          if (v6 == [(WFTimeOfDayTrigger *)v4 mode])
          {
            unint64_t v7 = [(WFTimeOfDayTrigger *)self timeOffset];
            if (v7 == [(WFTimeOfDayTrigger *)v4 timeOffset])
            {
              uint64_t v8 = [(WFTimeOfDayTrigger *)self time];
              v9 = [(WFTimeOfDayTrigger *)v4 time];
              v10 = v8;
              v11 = v9;
              v12 = v11;
              if (v10 == v11)
              {
              }
              else
              {
                LOBYTE(v13) = 0;
                v14 = v11;
                v15 = v10;
                if (!v10 || !v11) {
                  goto LABEL_33;
                }
                BOOL v16 = [(WFTimeOfDayTrigger *)v10 isEqual:v11];

                if (!v16)
                {
                  LOBYTE(v13) = 0;
LABEL_34:

                  v17 = v4;
                  goto LABEL_14;
                }
              }
              v19 = [(WFTimeOfDayTrigger *)self daysOfWeek];
              v20 = [(WFTimeOfDayTrigger *)v4 daysOfWeek];
              v15 = v19;
              v21 = v20;
              v14 = v21;
              if (v15 == v21)
              {
              }
              else
              {
                LOBYTE(v13) = 0;
                v22 = v21;
                v23 = v15;
                if (!v15 || !v21)
                {
LABEL_32:

LABEL_33:
                  goto LABEL_34;
                }
                int v13 = [(WFTimeOfDayTrigger *)v15 isEqualToArray:v21];

                if (!v13) {
                  goto LABEL_33;
                }
              }
              v24 = [(WFTimeOfDayTrigger *)self dayOfMonth];
              v25 = [(WFTimeOfDayTrigger *)v4 dayOfMonth];
              v23 = v24;
              v26 = v25;
              v22 = v26;
              if (v23 == v26)
              {
                LOBYTE(v13) = 1;
              }
              else
              {
                LOBYTE(v13) = 0;
                if (v23 && v26) {
                  LOBYTE(v13) = [(WFTimeOfDayTrigger *)v23 isEqual:v26];
                }
              }

              goto LABEL_32;
            }
          }
        }
        LOBYTE(v13) = 0;
      }
      v17 = v4;
      goto LABEL_18;
    }
    v17 = 0;
    LOBYTE(v13) = 0;
    v10 = v4;
  }
  else
  {
    v10 = 0;
    v17 = 0;
    LOBYTE(v13) = 0;
  }
LABEL_14:

LABEL_18:
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFTimeOfDayTrigger;
  id v4 = [(WFTrigger *)&v10 copyWithZone:a3];
  objc_msgSend(v4, "setEvent:", -[WFTimeOfDayTrigger event](self, "event"));
  objc_msgSend(v4, "setTimeOffset:", -[WFTimeOfDayTrigger timeOffset](self, "timeOffset"));
  unint64_t v5 = [(WFTimeOfDayTrigger *)self time];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setTime:v6];

  unint64_t v7 = [(WFTimeOfDayTrigger *)self daysOfWeek];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setDaysOfWeek:v8];

  return v4;
}

- (WFTimeOfDayTrigger)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WFTimeOfDayTrigger;
  unint64_t v5 = [(WFTrigger *)&v22 initWithCoder:v4];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeOfDay"];
    unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeOfDayTimeConfiguration"];
    unint64_t v8 = [v6 integerValue];
    uint64_t v9 = 2;
    if (v8 < 2) {
      uint64_t v9 = v8;
    }
    v5->_event = v9;
    v5->_timeOffset = [v7 integerValue];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
    time = v5->_time;
    v5->_time = (NSDateComponents *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"daysOfWeek"];
    daysOfWeek = v5->_daysOfWeek;
    v5->_daysOfWeek = (NSArray *)v15;

    if ([v4 containsValueForKey:@"mode"])
    {
      v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
      v5->_mode = [v17 integerValue];
    }
    else
    {
      v5->_mode = 0;
    }
    if ([v4 containsValueForKey:@"dayOfMonth"])
    {
      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dayOfMonth"];
      dayOfMonth = v5->_dayOfMonth;
      v5->_dayOfMonth = (NSNumber *)v18;
    }
    v20 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WFTimeOfDayTrigger;
  id v4 = a3;
  [(WFTrigger *)&v11 encodeWithCoder:v4];
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFTimeOfDayTrigger event](self, "event", v11.receiver, v11.super_class));
  [v4 encodeObject:v5 forKey:@"timeOfDay"];

  unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFTimeOfDayTrigger timeOffset](self, "timeOffset"));
  [v4 encodeObject:v6 forKey:@"timeOfDayTimeConfiguration"];

  unint64_t v7 = [(WFTimeOfDayTrigger *)self time];
  [v4 encodeObject:v7 forKey:@"time"];

  unint64_t v8 = [(WFTimeOfDayTrigger *)self daysOfWeek];
  [v4 encodeObject:v8 forKey:@"daysOfWeek"];

  uint64_t v9 = [(WFTimeOfDayTrigger *)self dayOfMonth];
  [v4 encodeObject:v9 forKey:@"dayOfMonth"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFTimeOfDayTrigger mode](self, "mode"));
  [v4 encodeObject:v10 forKey:@"mode"];
}

- (id)localizedDescriptionWithConfigurationSummary
{
  if ([(WFTimeOfDayTrigger *)self event] == 2)
  {
    v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v4 = [(WFTimeOfDayTrigger *)self time];
    unint64_t v5 = [v3 dateFromComponents:v4];

    unint64_t v6 = [(id)objc_opt_class() dateFormatter];
    unint64_t v7 = [v6 stringFromDate:v5];

    unint64_t v8 = NSString;
    uint64_t v9 = WFLocalizedString(@"At %@");
    uint64_t v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v7);
  }
  else
  {
    uint64_t v10 = +[WFTimeOfDayTrigger localizedSunriseSunsetDescriptionForTriggerEvent:[(WFTimeOfDayTrigger *)self event] timeOffset:[(WFTimeOfDayTrigger *)self timeOffset]];
  }
  objc_super v11 = [(WFTimeOfDayTrigger *)self daysOfWeek];
  v12 = [(WFTimeOfDayTrigger *)self dayOfMonth];
  int v13 = +[WFTimeOfDayTrigger localizedRecurrenceDescriptionForDaysOfWeek:v11 dayOfMonth:v12 mode:[(WFTimeOfDayTrigger *)self mode]];

  v14 = NSString;
  uint64_t v15 = WFLocalizedString(@"%1$@, %2$@");
  BOOL v16 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v10, v13);

  return v16;
}

- (BOOL)hasValidConfiguration
{
  v3 = [(WFTimeOfDayTrigger *)self time];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(WFTimeOfDayTrigger *)self event] != 2;
  }

  if ([(WFTimeOfDayTrigger *)self mode] == 1)
  {
    unint64_t v5 = [(WFTimeOfDayTrigger *)self dayOfMonth];
    if (v5) {
      BOOL v6 = v4;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      unint64_t v7 = [(WFTimeOfDayTrigger *)self dayOfMonth];
      BOOL v8 = [v7 integerValue] > 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    unint64_t v5 = [(WFTimeOfDayTrigger *)self daysOfWeek];
    if ([v5 count]) {
      BOOL v8 = v4;
    }
    else {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (WFTimeOfDayTrigger)init
{
  v11.receiver = self;
  v11.super_class = (Class)WFTimeOfDayTrigger;
  v2 = [(WFTrigger *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_event = 2;
    v2->_timeOffset = 7;
    v2->_mode = 0;
    daysOfWeek = v2->_daysOfWeek;
    v2->_daysOfWeek = (NSArray *)&unk_1F2317CB8;

    unint64_t v5 = objc_opt_new();
    BOOL v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v7 = [v6 components:96 fromDate:v5];
    time = v3->_time;
    v3->_time = (NSDateComponents *)v7;

    uint64_t v9 = v3;
  }

  return v3;
}

+ (id)localizedRecurrenceDescriptionForDaysOfWeek:(id)a3 dayOfMonth:(id)a4 mode:(unint64_t)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a5 == 1)
  {
    if (v8)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      [v10 setNumberStyle:WFLocalizedNumberFormatStyle()];
      objc_super v11 = [v10 stringFromNumber:v9];
      uint64_t v15 = NSString;
      BOOL v16 = WFLocalizedString(@"monthly on the %@");
      uint64_t v17 = objc_msgSend(v15, "stringWithFormat:", v16, v11);
      goto LABEL_7;
    }
    objc_super v22 = getWFTriggersLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "+[WFTimeOfDayTrigger localizedRecurrenceDescriptionForDaysOfWeek:dayOfMonth:mode:]";
      __int16 v36 = 2112;
      unint64_t v37 = 0;
      _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Invalid day of month: %@", buf, 0x16u);
    }

LABEL_17:
    uint64_t v18 = &stru_1F229A4D8;
    goto LABEL_22;
  }
  if (a5)
  {
    v19 = getWFTriggersLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "+[WFTimeOfDayTrigger localizedRecurrenceDescriptionForDaysOfWeek:dayOfMonth:mode:]";
      __int16 v36 = 2048;
      unint64_t v37 = a5;
      __int16 v38 = 2112;
      id v39 = v7;
      __int16 v40 = 2112;
      v41 = v9;
      _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_ERROR, "%s Invalid mode %lu with days of week %@ day of month %@", buf, 0x2Au);
    }

    goto LABEL_17;
  }
  id v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  objc_super v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  v12 = objc_msgSend(v10, "wf_weekdays");
  int v13 = [v11 isEqualToSet:v12];

  if (v13)
  {
    v14 = @"daily";
LABEL_20:
    WFLocalizedString(v14);
    uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v20 = objc_msgSend(v10, "wf_weekendDays");
  int v21 = [v11 isEqualToSet:v20];

  if (v21)
  {
    v14 = @"weekends";
    goto LABEL_20;
  }
  v23 = objc_msgSend(v10, "wf_workweekDays");
  int v24 = [v11 isEqualToSet:v23];

  if (v24)
  {
    v14 = @"weekdays";
    goto LABEL_20;
  }
  if ([v7 count] != 1)
  {
    BOOL v16 = [v7 sortedArrayUsingSelector:sel_compare_];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __82__WFTimeOfDayTrigger_localizedRecurrenceDescriptionForDaysOfWeek_dayOfMonth_mode___block_invoke;
    v32[3] = &unk_1E6558DB0;
    id v33 = v10;
    v29 = objc_msgSend(v16, "if_compactMap:", v32);
    uint64_t v18 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v29];

    goto LABEL_8;
  }
  v26 = [v7 firstObject];
  uint64_t v27 = [v26 integerValue];

  v28 = [v10 standaloneWeekdaySymbols];
  BOOL v16 = v28;
  if (v27 < 1 || v27 - 1 >= (unint64_t)[v28 count])
  {
    v30 = getWFTriggersLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = [v7 firstObject];
      *(_DWORD *)buf = 136315394;
      v35 = "+[WFTimeOfDayTrigger localizedRecurrenceDescriptionForDaysOfWeek:dayOfMonth:mode:]";
      __int16 v36 = 2112;
      unint64_t v37 = (unint64_t)v31;
      _os_log_impl(&dword_1C7F0A000, v30, OS_LOG_TYPE_ERROR, "%s Invalid day index: %@", buf, 0x16u);
    }
    uint64_t v18 = &stru_1F229A4D8;
    goto LABEL_8;
  }
  uint64_t v17 = [v16 objectAtIndexedSubscript:v27 - 1];
LABEL_7:
  uint64_t v18 = (__CFString *)v17;
LABEL_8:

LABEL_21:
LABEL_22:

  return v18;
}

id __82__WFTimeOfDayTrigger_localizedRecurrenceDescriptionForDaysOfWeek_dayOfMonth_mode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 integerValue];
  unint64_t v5 = [*(id *)(a1 + 32) shortStandaloneWeekdaySymbols];
  BOOL v6 = v5;
  BOOL v7 = v4 < 1;
  unint64_t v8 = v4 - 1;
  if (v7 || v8 >= [v5 count])
  {
    id v10 = getWFTriggersLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      int v13 = "+[WFTimeOfDayTrigger localizedRecurrenceDescriptionForDaysOfWeek:dayOfMonth:mode:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Invalid day index: %@", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [v6 objectAtIndexedSubscript:v8];
  }

  return v9;
}

+ (id)localizedSunriseSunsetDescriptionForTriggerEvent:(unint64_t)a3 timeOffset:(unint64_t)a4
{
  if (a3 == 1)
  {
    if (a4 <= 0xE)
    {
      unint64_t v5 = off_1E6558E50;
      goto LABEL_7;
    }
  }
  else if (!a3)
  {
    if (a4 >= 0xF) {
      goto LABEL_8;
    }
    unint64_t v5 = off_1E6558DD8;
LABEL_7:
    WFLocalizedString(v5[a4]);
    a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    return a1;
  }
  a1 = &stru_1F229A4D8;
  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1) {
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_73549);
  }
  v2 = (void *)dateFormatter_dateFormatter;
  return v2;
}

uint64_t __35__WFTimeOfDayTrigger_dateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)dateFormatter_dateFormatter;
  dateFormatter_dateFormatter = v0;

  [(id)dateFormatter_dateFormatter setTimeStyle:1];
  v2 = (void *)dateFormatter_dateFormatter;
  return [v2 setDateStyle:0];
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)displayGlyphName
{
  return @"clock.fill";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “At 8:00 AM, weekdays”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Time of Day");
}

@end