@interface WFDurationQuantityFieldParameter
+ (BOOL)unitStringIsDurationUnit:(id)a3;
+ (id)stateForDuration:(double)a3 possibleUnits:(id)a4;
+ (unint64_t)calendarUnitFromUnitString:(id)a3;
+ (unint64_t)possibleCalendarUnitsForUnits:(id)a3;
- (BOOL)isTimePickerParameter;
- (BOOL)parameterStateIsValid:(id)a3;
- (WFDurationQuantityFieldParameter)initWithDefinition:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5;
- (id)stateForDuration:(double)a3;
- (unint64_t)possibleCalendarUnits;
- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6;
- (void)setPossibleCalendarUnits:(unint64_t)a3;
@end

@implementation WFDurationQuantityFieldParameter

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
}

- (BOOL)isTimePickerParameter
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"hr", @"min", @"sec", 0);
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v5 = [(WFQuantityFieldParameter *)self possibleUnits];
  v6 = (void *)[v4 initWithArray:v5];

  LOBYTE(v5) = [v6 isEqualToSet:v3];
  return (char)v5;
}

- (id)defaultSerializedRepresentation
{
  v3 = [(WFParameter *)self definition];
  id v4 = [v3 objectForKey:@"DefaultUnit"];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = WFEnforceClass(v4, v5);
  v7 = (void *)v6;
  v8 = @"min";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v9 = v8;

  v10 = [(WFParameter *)self definition];
  v11 = [v10 objectForKey:@"DefaultValue"];
  uint64_t v12 = objc_opt_class();
  v13 = WFEnforceClass(v11, v12);

  if (v13) {
    v14 = [[WFNumberStringSubstitutableState alloc] initWithValue:v13];
  }
  else {
    v14 = 0;
  }
  v15 = [[WFQuantityParameterState alloc] initWithMagnitudeState:v14 unitString:v9];
  v16 = [(WFQuantityParameterState *)v15 serializedRepresentation];

  return v16;
}

- (id)stateForDuration:(double)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(WFQuantityFieldParameter *)self possibleUnits];
  v7 = [v5 stateForDuration:v6 possibleUnits:a3];

  return v7;
}

- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"sec"])
  {
    v8 = NSString;
    v9 = @"seconds";
LABEL_15:
    v10 = WFLocalizedPluralString(v9);
    v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, objc_msgSend(v7, "intValue"));

    goto LABEL_16;
  }
  if ([v6 isEqualToString:@"min"])
  {
    v8 = NSString;
    v9 = @"minutes";
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"hr"])
  {
    v8 = NSString;
    v9 = @"hours";
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"days"])
  {
    v8 = NSString;
    v9 = @"days";
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"weeks"])
  {
    v8 = NSString;
    v9 = @"weeks";
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"months"])
  {
    v8 = NSString;
    v9 = @"months";
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"years"])
  {
    v8 = NSString;
    v9 = @"years";
    goto LABEL_15;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v3 = a3;
  id v4 = [v3 unitString];
  if (v4)
  {
    uint64_t v5 = WFDurationQuantityPossibleUnits();
    id v6 = [v3 unitString];
    char v7 = [v5 containsObject:v6];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)setPossibleCalendarUnits:(unint64_t)a3
{
  __int16 v3 = a3;
  id v5 = (id)objc_opt_new();
  if ((v3 & 0x80) != 0)
  {
    [v5 addObject:@"sec"];
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"min"];
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v5 addObject:@"hr"];
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v5 addObject:@"days"];
  if ((v3 & 0x2000) == 0)
  {
LABEL_6:
    if ((v3 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v5 addObject:@"weeks"];
  if ((v3 & 8) == 0)
  {
LABEL_7:
    if ((v3 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  [v5 addObject:@"months"];
  if ((v3 & 4) != 0) {
LABEL_8:
  }
    [v5 addObject:@"years"];
LABEL_9:
  [(WFQuantityFieldParameter *)self setPossibleUnits:v5];
}

- (unint64_t)possibleCalendarUnits
{
  __int16 v3 = objc_opt_class();
  id v4 = [(WFQuantityFieldParameter *)self possibleUnits];
  unint64_t v5 = [v3 possibleCalendarUnitsForUnits:v4];

  return v5;
}

- (WFDurationQuantityFieldParameter)initWithDefinition:(id)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)WFDurationQuantityFieldParameter;
  __int16 v3 = [(WFQuantityFieldParameter *)&v10 initWithDefinition:a3];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [(WFQuantityFieldParameter *)v3 possibleUnits];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      v11[0] = @"sec";
      v11[1] = @"min";
      v11[2] = @"hr";
      v11[3] = @"days";
      char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
      [(WFQuantityFieldParameter *)v4 setPossibleUnits:v7];
    }
    v8 = v4;
  }

  return v4;
}

+ (id)stateForDuration:(double)a3 possibleUnits:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = [v7 dateByAddingTimeInterval:a3];
  uint64_t v9 = [a1 possibleCalendarUnitsForUnits:v6];
  objc_super v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v11 = [v10 components:v9 fromDate:v7 toDate:v8 options:0];

  uint64_t v12 = [v6 firstObject];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    v29 = v8;
    uint64_t v16 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v19 = [(id)objc_opt_class() calendarUnitFromUnitString:v18];
        if ([v11 valueForComponent:v19])
        {
          v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          v8 = v29;
          v22 = [v21 components:v19 fromDate:v7 toDate:v29 options:0];

          uint64_t v20 = [v22 valueForComponent:v19];
          id v23 = v18;

          uint64_t v12 = v23;
          goto LABEL_12;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    uint64_t v20 = 0;
    v8 = v29;
  }
  else
  {
    uint64_t v20 = 0;
  }
LABEL_12:

  v24 = [NSNumber numberWithInteger:v20];
  v25 = [v24 stringValue];

  v26 = [[WFNumberStringSubstitutableState alloc] initWithValue:v25];
  v27 = [[WFQuantityParameterState alloc] initWithMagnitudeState:v26 unitString:v12];

  return v27;
}

+ (unint64_t)calendarUnitFromUnitString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"sec"])
  {
    unint64_t v4 = 128;
  }
  else if ([v3 isEqualToString:@"min"])
  {
    unint64_t v4 = 64;
  }
  else if ([v3 isEqualToString:@"hr"])
  {
    unint64_t v4 = 32;
  }
  else if ([v3 isEqualToString:@"days"])
  {
    unint64_t v4 = 16;
  }
  else if ([v3 isEqualToString:@"weeks"])
  {
    unint64_t v4 = 0x2000;
  }
  else if ([v3 isEqualToString:@"months"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"years"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    unint64_t v4 = 128;
  }

  return v4;
}

+ (BOOL)unitStringIsDurationUnit:(id)a3
{
  id v3 = a3;
  unint64_t v4 = WFDurationQuantityPossibleUnits();
  char v5 = [v4 containsObject:v3];

  return v5;
}

+ (unint64_t)possibleCalendarUnitsForUnits:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isEqualToString:@"sec"])
        {
          v6 |= 0x80uLL;
        }
        else if ([v9 isEqualToString:@"min"])
        {
          v6 |= 0x40uLL;
        }
        else if ([v9 isEqualToString:@"hr"])
        {
          v6 |= 0x20uLL;
        }
        else if ([v9 isEqualToString:@"days"])
        {
          v6 |= 0x10uLL;
        }
        else if ([v9 isEqualToString:@"weeks"])
        {
          v6 |= 0x2000uLL;
        }
        else if ([v9 isEqualToString:@"months"])
        {
          v6 |= 8uLL;
        }
        else if ([v9 isEqualToString:@"years"])
        {
          v6 |= 4uLL;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

@end