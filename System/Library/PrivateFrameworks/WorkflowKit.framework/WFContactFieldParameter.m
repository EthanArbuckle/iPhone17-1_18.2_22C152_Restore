@interface WFContactFieldParameter
- (BOOL)allowsCustomHandles;
- (BOOL)allowsTextEntry;
- (BOOL)hidesLabel;
- (BOOL)shouldAlignLabels;
- (Class)multipleStateClass;
- (Class)singleStateClass;
- (NSArray)supportedContactProperties;
- (NSString)autocapitalizationType;
- (NSString)autocorrectionType;
- (NSString)keyboardType;
- (NSString)textAlignment;
- (WFContactFieldParameter)initWithDefinition:(id)a3;
@end

@implementation WFContactFieldParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedContactProperties, 0);
  objc_storeStrong((id *)&self->_autocorrectionType, 0);
  objc_storeStrong((id *)&self->_autocapitalizationType, 0);
  objc_storeStrong((id *)&self->_textAlignment, 0);
}

- (BOOL)hidesLabel
{
  return self->_hidesLabel;
}

- (NSArray)supportedContactProperties
{
  return self->_supportedContactProperties;
}

- (NSString)autocorrectionType
{
  return self->_autocorrectionType;
}

- (NSString)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (NSString)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)allowsTextEntry
{
  return self->_allowsTextEntry;
}

- (BOOL)allowsCustomHandles
{
  return self->_allowsCustomHandles;
}

- (BOOL)shouldAlignLabels
{
  v2 = [(WFContactFieldParameter *)self textAlignment];
  v3 = (void *)*MEMORY[0x1E4FB4E58];
  id v4 = v2;
  id v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    char v7 = 1;
  }
  else
  {
    char v7 = 0;
    if (v4 && v5) {
      char v7 = [v4 isEqualToString:v5];
    }
  }

  return v7;
}

- (NSString)keyboardType
{
  v2 = [(WFContactFieldParameter *)self supportedContactProperties];
  if ([v2 count] != 1) {
    goto LABEL_6;
  }
  if (([v2 containsObject:@"Email"] & 1) == 0)
  {
    if ([v2 containsObject:@"Phone"])
    {
      v3 = (id *)MEMORY[0x1E4FB4E30];
      goto LABEL_7;
    }
LABEL_6:
    v3 = (id *)MEMORY[0x1E4FB4E18];
    goto LABEL_7;
  }
  v3 = (id *)MEMORY[0x1E4FB4E20];
LABEL_7:
  id v4 = (NSString *)*v3;

  return v4;
}

- (WFContactFieldParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WFContactFieldParameter;
  id v5 = [(WFParameter *)&v29 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AllowsTextEntry"];
    uint64_t v7 = objc_opt_class();
    v8 = WFEnforceClass(v6, v7);
    v9 = v8;
    if (!v8) {
      v8 = (void *)MEMORY[0x1E4F1CC38];
    }
    v5->_allowsTextEntry = [v8 BOOLValue];

    v10 = [v4 objectForKey:@"TextAlignment"];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = WFEnforceClass(v10, v11);
    textAlignment = v5->_textAlignment;
    v5->_textAlignment = (NSString *)v12;

    uint64_t v14 = [v4 objectForKey:@"AutocapitalizationType"];
    autocapitalizationType = v5->_autocapitalizationType;
    v5->_autocapitalizationType = (NSString *)v14;

    v16 = [v4 objectForKey:@"DisableAutocorrection"];
    uint64_t v17 = objc_opt_class();
    v18 = WFEnforceClass(v16, v17);
    int v19 = [v18 BOOLValue];
    v20 = (id *)MEMORY[0x1E4FB4E08];
    if (!v19) {
      v20 = (id *)MEMORY[0x1E4FB4E00];
    }
    objc_storeStrong((id *)&v5->_autocorrectionType, *v20);

    v21 = [v4 objectForKey:@"HidesLabel"];
    uint64_t v22 = objc_opt_class();
    v23 = WFEnforceClass(v21, v22);
    v5->_hidesLabel = [v23 BOOLValue];

    v24 = [v4 objectForKey:@"AllowsCustomHandles"];
    uint64_t v25 = objc_opt_class();
    v26 = WFEnforceClass(v24, v25);
    v5->_allowsCustomHandles = [v26 BOOLValue];

    v27 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (Class)multipleStateClass
{
  return (Class)objc_opt_class();
}

@end