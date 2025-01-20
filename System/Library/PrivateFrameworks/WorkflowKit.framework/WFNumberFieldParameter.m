@interface WFNumberFieldParameter
+ (BOOL)defaultAllowsDecimalNumbers;
+ (BOOL)defaultAllowsNegativeNumbers;
- (BOOL)allowsDecimalNumbers;
- (BOOL)allowsNegativeNumbers;
- (BOOL)shouldAlignLabels;
- (Class)singleStateClass;
- (NSString)textAlignment;
- (WFNumberFieldParameter)initWithDefinition:(id)a3;
- (id)defaultSupportedVariableTypes;
- (id)parameterStateFromDialogResponse:(id)a3;
- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6;
@end

@implementation WFNumberFieldParameter

- (void).cxx_destruct
{
}

- (BOOL)allowsNegativeNumbers
{
  return self->_allowsNegativeNumbers;
}

- (BOOL)allowsDecimalNumbers
{
  return self->_allowsDecimalNumbers;
}

- (NSString)textAlignment
{
  return self->_textAlignment;
}

- (id)parameterStateFromDialogResponse:(id)a3
{
  id v3 = a3;
  v4 = [v3 inputtedText];
  if (v4)
  {
    v5 = [WFNumberStringSubstitutableState alloc];
    v6 = [v3 inputtedText];
    v7 = [(WFNumberStringSubstitutableState *)v5 initWithValue:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  v10 = (objc_class *)MEMORY[0x1E4FB49E0];
  v11 = (void (**)(id, void *))a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v22 = objc_alloc_init(v10);
  v15 = [v13 value];

  [v22 setText:v15];
  v16 = [(WFParameter *)self localizedPlaceholder];
  [v22 setPlaceholder:v16];

  objc_msgSend(v22, "setAllowsNegativeNumbers:", -[WFNumberFieldParameter allowsNegativeNumbers](self, "allowsNegativeNumbers"));
  BOOL v17 = [(WFNumberFieldParameter *)self allowsDecimalNumbers];
  v18 = (void *)MEMORY[0x1E4FB4E10];
  if (!v17) {
    v18 = (void *)MEMORY[0x1E4FB4E28];
  }
  [v22 setKeyboardType:*v18];
  id v19 = objc_alloc(MEMORY[0x1E4FB4798]);
  v20 = [(WFParameter *)self key];
  v21 = (void *)[v19 initWithTextFieldConfiguration:v22 message:0 attribution:v14 prompt:v12 parameterKey:v20];

  v11[2](v11, v21);
}

- (BOOL)shouldAlignLabels
{
  return 1;
}

- (id)defaultSupportedVariableTypes
{
  v2 = [(id)objc_opt_class() allInsertableVariableTypes];
  id v3 = (void *)[v2 mutableCopy];

  [v3 removeObject:@"CurrentDate"];
  return v3;
}

- (WFNumberFieldParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WFNumberFieldParameter;
  v5 = [(WFParameter *)&v20 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"TextAlignment"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);
    textAlignment = v5->_textAlignment;
    v5->_textAlignment = (NSString *)v8;

    v10 = [v4 objectForKey:@"AllowsDecimalNumbers"];
    uint64_t v11 = objc_opt_class();
    id v12 = WFEnforceClass(v10, v11);

    id v13 = [v4 objectForKey:@"AllowsNegativeNumbers"];
    uint64_t v14 = objc_opt_class();
    v15 = WFEnforceClass(v13, v14);

    if (v12) {
      char v16 = [v12 BOOLValue];
    }
    else {
      char v16 = [(id)objc_opt_class() defaultAllowsDecimalNumbers];
    }
    v5->_allowsDecimalNumbers = v16;
    if (v15) {
      char v17 = [v15 BOOLValue];
    }
    else {
      char v17 = [(id)objc_opt_class() defaultAllowsNegativeNumbers];
    }
    v5->_allowsNegativeNumbers = v17;
    v18 = v5;
  }
  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)defaultAllowsNegativeNumbers
{
  return 1;
}

+ (BOOL)defaultAllowsDecimalNumbers
{
  return 0;
}

@end