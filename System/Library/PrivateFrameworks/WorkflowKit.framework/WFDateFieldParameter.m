@interface WFDateFieldParameter
- (BOOL)dateOnlyMode;
- (BOOL)detectsAllDayDates;
- (BOOL)displaysAllDayString;
- (BOOL)forcesAllDayDates;
- (BOOL)timeOnlyMode;
- (Class)singleStateClass;
- (NSDateFormatter)hintDateFormatter;
- (NSNumber)dateFormatterDateStyleNumber;
- (NSNumber)dateFormatterRelativeDateFormattingNumber;
- (NSNumber)dateFormatterTimeStyleNumber;
- (NSString)dateFormatterTemplateString;
- (NSString)hintDateMode;
- (NSString)localizedIncompleteHintString;
- (NSString)reactiveParameterKey;
- (NSString)resultType;
- (WFDateFieldParameter)initWithDefinition:(id)a3;
- (id)createDialogTextFieldConfigurationWithDefaultState:(id)a3;
- (id)dateFormatterForConfiguration:(id)a3;
- (id)datePickerConfiguration;
- (id)hintForState:(id)a3;
- (id)parameterStateFromDialogResponse:(id)a3;
- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6;
- (void)setForcesAllDayDates:(BOOL)a3;
@end

@implementation WFDateFieldParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatterTemplateString, 0);
  objc_storeStrong((id *)&self->_hintDateMode, 0);
  objc_storeStrong((id *)&self->_reactiveParameterKey, 0);
  objc_storeStrong((id *)&self->_resultType, 0);
  objc_storeStrong((id *)&self->_hintDateFormatter, 0);
}

- (NSString)dateFormatterTemplateString
{
  return self->_dateFormatterTemplateString;
}

- (NSNumber)dateFormatterRelativeDateFormattingNumber
{
  return self->_dateFormatterRelativeDateFormattingNumber;
}

- (NSNumber)dateFormatterTimeStyleNumber
{
  return self->_dateFormatterTimeStyleNumber;
}

- (NSNumber)dateFormatterDateStyleNumber
{
  return self->_dateFormatterDateStyleNumber;
}

- (NSString)hintDateMode
{
  return self->_hintDateMode;
}

- (BOOL)forcesAllDayDates
{
  return self->_forcesAllDayDates;
}

- (BOOL)displaysAllDayString
{
  return self->_displaysAllDayString;
}

- (BOOL)detectsAllDayDates
{
  return self->_detectsAllDayDates;
}

- (NSString)reactiveParameterKey
{
  return self->_reactiveParameterKey;
}

- (NSString)resultType
{
  return self->_resultType;
}

- (id)parameterStateFromDialogResponse:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 inputtedDate];

    if (v6)
    {
      v7 = [(WFDateFieldParameter *)self datePickerConfiguration];
      v8 = [(WFDateFieldParameter *)self dateFormatterForConfiguration:v7];

      v9 = [WFVariableString alloc];
      v10 = [v5 inputtedDate];
      v11 = [v8 stringFromDate:v10];
      v12 = [(WFVariableString *)v9 initWithString:v11];

      v6 = [(WFVariableStringParameterState *)[WFDateFieldParameterState alloc] initWithVariableString:v12];
      v13 = [v5 inputtedDate];
      [(WFDateFieldParameterState *)v6 setPreprocessedDate:v13];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15.receiver = self;
      v15.super_class = (Class)WFDateFieldParameter;
      v6 = [(WFTextInputParameter *)&v15 parameterStateFromDialogResponse:v4];
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)createDialogTextFieldConfigurationWithDefaultState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFDateFieldParameter *)self timeOnlyMode];
  BOOL v6 = [(WFDateFieldParameter *)self dateOnlyMode];
  v11.receiver = self;
  v11.super_class = (Class)WFDateFieldParameter;
  v7 = [(WFTextInputParameter *)&v11 createDialogTextFieldConfigurationWithDefaultState:v4];

  [v7 setShowsDateFormattingHint:1];
  [v7 setTimeFormatStyle:!v6];
  [v7 setDateFormatStyle:!v5];
  if ([(WFDateFieldParameter *)self detectsAllDayDates]) {
    uint64_t v8 = [(WFDateFieldParameter *)self displaysAllDayString] ^ 1;
  }
  else {
    uint64_t v8 = 0;
  }
  [v7 setDateHintPrefersDateOnly:v8];
  [v7 setDoesRelativeDateFormatting:1];
  v9 = [(WFDateFieldParameter *)self localizedIncompleteHintString];
  [v7 setLocalizedIncompleteHintString:v9];

  return v7;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (v11
    && ([v11 variableString],
        v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 isEmpty],
        v14,
        (v15 & 1) == 0))
  {
    v18.receiver = self;
    v18.super_class = (Class)WFDateFieldParameter;
    [(WFTextInputParameter *)&v18 createDialogRequestWithAttribution:v10 defaultState:v11 prompt:v12 completionHandler:v13];
  }
  else
  {
    v16 = [(WFDateFieldParameter *)self datePickerConfiguration];
    v17 = (void *)[objc_alloc(MEMORY[0x1E4FB4788]) initWithDatePickerConfiguration:v16 message:0 attribution:v10 prompt:v12];
    v13[2](v13, v17);
  }
}

- (id)dateFormatterForConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [v3 datePickerMode];
  BOOL v5 = v4 != (void *)*MEMORY[0x1E4FB4C60];

  BOOL v6 = [v3 datePickerMode];

  v7 = (void *)*MEMORY[0x1E4FB4C50];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v9 = v8;
  if (v6 == v7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 3;
  }
  [v8 setTimeStyle:v10];
  [v9 setDateStyle:4 * v5];
  return v9;
}

- (id)datePickerConfiguration
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB46A8]);
  id v4 = (id)*MEMORY[0x1E4FB4C58];
  if ([(WFDateFieldParameter *)self timeOnlyMode])
  {
    BOOL v5 = (id *)MEMORY[0x1E4FB4C60];
LABEL_6:
    id v6 = *v5;

    id v4 = v6;
    goto LABEL_7;
  }
  if ([(WFDateFieldParameter *)self dateOnlyMode]
    || [(WFDateFieldParameter *)self forcesAllDayDates])
  {
    BOOL v5 = (id *)MEMORY[0x1E4FB4C50];
    goto LABEL_6;
  }
LABEL_7:
  [v3 setDatePickerMode:v4];

  return v3;
}

- (void)setForcesAllDayDates:(BOOL)a3
{
  if (self->_forcesAllDayDates != a3)
  {
    self->_forcesAllDayDates = a3;
    [(WFParameter *)self attributesDidChange];
  }
}

- (NSString)localizedIncompleteHintString
{
  if ([(WFDateFieldParameter *)self timeOnlyMode]) {
    v2 = @"Incomplete time";
  }
  else {
    v2 = @"Incomplete date";
  }
  id v3 = WFLocalizedString(v2);
  return (NSString *)v3;
}

- (id)hintForState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 variableString];
  id v6 = [v5 variables];
  if ([v6 count])
  {

    v7 = 0;
LABEL_3:

    goto LABEL_4;
  }
  v9 = [v4 variableString];
  uint64_t v10 = [v9 stringByRemovingVariables];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    id v12 = (void *)MEMORY[0x1E4F5A8B0];
    v13 = [v4 variableString];
    v14 = [v13 stringByRemovingVariables];
    char v15 = [v12 datesInString:v14 error:0];
    BOOL v5 = [v15 firstObject];

    if (v5)
    {
      v16 = [(WFDateFieldParameter *)self hintDateFormatter];
      v7 = [v16 stringFromDate:v5];
    }
    else
    {
      v7 = [(WFDateFieldParameter *)self localizedIncompleteHintString];
    }
    goto LABEL_3;
  }
  v7 = 0;
LABEL_4:

  return v7;
}

- (NSDateFormatter)hintDateFormatter
{
  hintDateFormatter = self->_hintDateFormatter;
  if (!hintDateFormatter)
  {
    BOOL v4 = [(WFDateFieldParameter *)self timeOnlyMode];
    BOOL v5 = [(WFDateFieldParameter *)self dateOnlyMode];
    id v6 = [(WFDateFieldParameter *)self dateFormatterDateStyleNumber];
    if (v6)
    {
      v7 = [(WFDateFieldParameter *)self dateFormatterDateStyleNumber];
      uint64_t v8 = [v7 integerValue];
    }
    else
    {
      uint64_t v8 = 1;
    }

    v9 = [(WFDateFieldParameter *)self dateFormatterTimeStyleNumber];
    if (v9)
    {
      uint64_t v10 = [(WFDateFieldParameter *)self dateFormatterTimeStyleNumber];
      uint64_t v11 = [v10 integerValue];
    }
    else
    {
      uint64_t v11 = 1;
    }

    id v12 = [(WFDateFieldParameter *)self dateFormatterRelativeDateFormattingNumber];
    if (v12)
    {
      v13 = [(WFDateFieldParameter *)self dateFormatterRelativeDateFormattingNumber];
      uint64_t v14 = [v13 BOOLValue];
    }
    else
    {
      uint64_t v14 = 1;
    }

    char v15 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v16 = v15;
    if (v5) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = v11;
    }
    [(NSDateFormatter *)v15 setTimeStyle:v17];
    if (v4) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v8;
    }
    [(NSDateFormatter *)v16 setDateStyle:v18];
    [(NSDateFormatter *)v16 setDoesRelativeDateFormatting:v14];
    v19 = [(WFDateFieldParameter *)self dateFormatterTemplateString];
    [(NSDateFormatter *)v16 setDateFormat:v19];

    v20 = self->_hintDateFormatter;
    self->_hintDateFormatter = v16;

    hintDateFormatter = self->_hintDateFormatter;
  }
  return hintDateFormatter;
}

- (BOOL)dateOnlyMode
{
  v2 = [(WFDateFieldParameter *)self hintDateMode];
  char v3 = [v2 isEqualToString:@"Date"];

  return v3;
}

- (BOOL)timeOnlyMode
{
  v2 = [(WFDateFieldParameter *)self hintDateMode];
  char v3 = [v2 isEqualToString:@"Time"];

  return v3;
}

- (WFDateFieldParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)WFDateFieldParameter;
  BOOL v5 = [(WFTextInputParameter *)&v41 initWithDefinition:v4];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"HintDateMode"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);
    uint64_t v9 = [v8 copy];
    hintDateMode = v5->_hintDateMode;
    v5->_hintDateMode = (NSString *)v9;

    uint64_t v11 = [v4 objectForKey:@"ReactiveParameterKey"];
    uint64_t v12 = objc_opt_class();
    v13 = WFEnforceClass(v11, v12);
    uint64_t v14 = [v13 copy];
    reactiveParameterKey = v5->_reactiveParameterKey;
    v5->_reactiveParameterKey = (NSString *)v14;

    v16 = [v4 objectForKey:@"DetectsAllDayDates"];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = WFEnforceClass(v16, v17);
    v5->_detectsAllDayDates = [v18 BOOLValue];

    v19 = [v4 objectForKey:@"DisplaysAllDayString"];
    uint64_t v20 = objc_opt_class();
    v21 = WFEnforceClass(v19, v20);
    v5->_displaysAllDayString = [v21 BOOLValue];

    v22 = [v4 objectForKey:@"DateFormatterDateStyle"];
    uint64_t v23 = objc_opt_class();
    v5->_dateFormatterDateStyleNumber = (NSNumber *)WFEnforceClass(v22, v23);

    v24 = [v4 objectForKey:@"DateFormatterTimeStyle"];
    uint64_t v25 = objc_opt_class();
    v5->_dateFormatterTimeStyleNumber = (NSNumber *)WFEnforceClass(v24, v25);

    v26 = [v4 objectForKey:@"DateFormatterAllowsRelative"];
    uint64_t v27 = objc_opt_class();
    v5->_dateFormatterRelativeDateFormattingNumber = (NSNumber *)WFEnforceClass(v26, v27);

    v28 = [v4 objectForKey:@"DateFormatterTemplate"];
    uint64_t v29 = objc_opt_class();
    v30 = WFEnforceClass(v28, v29);
    uint64_t v31 = [v30 copy];
    dateFormatterTemplateString = v5->_dateFormatterTemplateString;
    v5->_dateFormatterTemplateString = (NSString *)v31;

    v33 = [v4 objectForKey:@"ResultType"];
    uint64_t v34 = objc_opt_class();
    v35 = WFEnforceClass(v33, v34);
    uint64_t v36 = [v35 copy];
    v37 = (void *)v36;
    if (v36) {
      v38 = (__CFString *)v36;
    }
    else {
      v38 = @"Date";
    }
    objc_storeStrong((id *)&v5->_resultType, v38);

    v39 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end