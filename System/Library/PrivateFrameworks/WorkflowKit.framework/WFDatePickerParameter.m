@interface WFDatePickerParameter
- (Class)singleStateClass;
- (NSDate)maximumDate;
- (NSDate)minimumDate;
- (NSString)datePickerMode;
- (WFDatePickerParameter)initWithDefinition:(id)a3;
- (id)defaultSupportedVariableTypes;
- (id)parameterStateFromDialogResponse:(id)a3;
- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6;
- (void)setDatePickerMode:(id)a3;
- (void)setMaximumDate:(id)a3;
- (void)setMinimumDate:(id)a3;
@end

@implementation WFDatePickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_minimumDate, 0);
  objc_storeStrong((id *)&self->_datePickerMode, 0);
}

- (NSDate)maximumDate
{
  return self->_maximumDate;
}

- (NSDate)minimumDate
{
  return self->_minimumDate;
}

- (NSString)datePickerMode
{
  return self->_datePickerMode;
}

- (id)parameterStateFromDialogResponse:(id)a3
{
  id v3 = a3;
  v4 = [v3 inputtedDate];
  if (v4)
  {
    v5 = [WFDateSubstitutableState alloc];
    v6 = [v3 inputtedDate];
    v7 = [(WFVariableSubstitutableParameterState *)v5 initWithValue:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  v10 = (objc_class *)MEMORY[0x1E4FB46A8];
  v11 = (void (**)(id, void *))a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v20 = objc_alloc_init(v10);
  v15 = [v13 value];

  [v20 setDefaultDate:v15];
  v16 = [(WFDatePickerParameter *)self datePickerMode];
  [v20 setDatePickerMode:v16];

  v17 = [(WFDatePickerParameter *)self minimumDate];
  [v20 setMinimumDate:v17];

  v18 = [(WFDatePickerParameter *)self maximumDate];
  [v20 setMaximumDate:v18];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4FB4788]) initWithDatePickerConfiguration:v20 message:0 attribution:v14 prompt:v12];
  v11[2](v11, v19);
}

- (id)defaultSupportedVariableTypes
{
  v2 = objc_opt_class();
  return (id)[v2 allInsertableVariableTypes];
}

- (void)setMaximumDate:(id)a3
{
  v5 = (NSDate *)a3;
  maximumDate = self->_maximumDate;
  v8 = v5;
  if (maximumDate == v5)
  {
    objc_storeStrong((id *)&self->_maximumDate, a3);
  }
  else
  {
    BOOL v7 = [(NSDate *)maximumDate isEqualToDate:v5];
    objc_storeStrong((id *)&self->_maximumDate, a3);
    if (!v7) {
      [(WFParameter *)self attributesDidChange];
    }
  }
}

- (void)setMinimumDate:(id)a3
{
  v5 = (NSDate *)a3;
  minimumDate = self->_minimumDate;
  v8 = v5;
  if (minimumDate == v5)
  {
    objc_storeStrong((id *)&self->_minimumDate, a3);
  }
  else
  {
    BOOL v7 = [(NSDate *)minimumDate isEqualToDate:v5];
    objc_storeStrong((id *)&self->_minimumDate, a3);
    if (!v7) {
      [(WFParameter *)self attributesDidChange];
    }
  }
}

- (void)setDatePickerMode:(id)a3
{
  id v4 = a3;
  v5 = self->_datePickerMode;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    datePickerMode = self->_datePickerMode;
    self->_datePickerMode = v8;

    [(WFParameter *)self attributesDidChange];
  }
LABEL_9:
}

- (WFDatePickerParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WFDatePickerParameter;
  v5 = [(WFParameter *)&v20 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"DatePickerMode"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);
    datePickerMode = v5->_datePickerMode;
    v5->_datePickerMode = (NSString *)v8;

    v10 = [v4 objectForKey:@"MinimumValue"];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = WFEnforceClass(v10, v11);
    minimumDate = v5->_minimumDate;
    v5->_minimumDate = (NSDate *)v12;

    id v14 = [v4 objectForKey:@"MaximumValue"];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = WFEnforceClass(v14, v15);
    maximumDate = v5->_maximumDate;
    v5->_maximumDate = (NSDate *)v16;

    v18 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end