@interface WFTagFieldParameter
- (BOOL)shouldAlignLabels;
- (Class)singleStateClass;
- (NSArray)suggestedTags;
- (NSString)autocapitalizationType;
- (NSString)autocorrectionType;
- (NSString)keyboardType;
- (NSString)textAlignment;
- (WFTagFieldParameter)initWithDefinition:(id)a3;
@end

@implementation WFTagFieldParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedTags, 0);
  objc_storeStrong((id *)&self->_textAlignment, 0);
  objc_storeStrong((id *)&self->_autocorrectionType, 0);
  objc_storeStrong((id *)&self->_autocapitalizationType, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
}

- (NSArray)suggestedTags
{
  return self->_suggestedTags;
}

- (NSString)textAlignment
{
  return self->_textAlignment;
}

- (NSString)autocorrectionType
{
  return self->_autocorrectionType;
}

- (NSString)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (BOOL)shouldAlignLabels
{
  v2 = [(WFTagFieldParameter *)self textAlignment];
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

- (WFTagFieldParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)WFTagFieldParameter;
  id v5 = [(WFParameter *)&v29 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"KeyboardType"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);
    keyboardType = v5->_keyboardType;
    v5->_keyboardType = (NSString *)v8;

    v10 = [v4 objectForKey:@"TextAlignment"];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = WFEnforceClass(v10, v11);
    textAlignment = v5->_textAlignment;
    v5->_textAlignment = (NSString *)v12;

    v14 = [v4 objectForKey:@"AutocapitalizationType"];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = WFEnforceClass(v14, v15);
    autocapitalizationType = v5->_autocapitalizationType;
    v5->_autocapitalizationType = (NSString *)v16;

    v18 = [v4 objectForKey:@"DisableAutocorrection"];
    uint64_t v19 = objc_opt_class();
    v20 = WFEnforceClass(v18, v19);
    int v21 = [v20 BOOLValue];
    v22 = (id *)MEMORY[0x1E4FB4E08];
    if (!v21) {
      v22 = (id *)MEMORY[0x1E4FB4E00];
    }
    objc_storeStrong((id *)&v5->_autocorrectionType, *v22);

    v23 = [v4 objectForKey:@"SuggestedTags"];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = WFEnforceClass(v23, v24);
    suggestedTags = v5->_suggestedTags;
    v5->_suggestedTags = (NSArray *)v25;

    v27 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end