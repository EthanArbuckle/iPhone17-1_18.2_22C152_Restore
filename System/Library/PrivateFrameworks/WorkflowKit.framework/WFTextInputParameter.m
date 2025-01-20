@interface WFTextInputParameter
- (BOOL)autoPeriodsDisabled;
- (BOOL)isMonospace;
- (BOOL)isMultiline;
- (BOOL)isSecureTextEntry;
- (BOOL)processesIntoContentItems;
- (BOOL)shouldAlignLabels;
- (BOOL)smartDashesDisabled;
- (BOOL)smartQuotesDisabled;
- (BOOL)textReplacementDisabled;
- (Class)singleStateClass;
- (NSString)autocapitalizationType;
- (NSString)autocorrectionType;
- (NSString)keyboardType;
- (NSString)prefix;
- (NSString)returnKeyType;
- (NSString)textAlignment;
- (NSString)textContentType;
- (WFTextInputParameter)initWithDefinition:(id)a3;
- (id)createDialogTextFieldConfigurationWithDefaultState:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)defaultSupportedVariableTypes;
- (id)hintForState:(id)a3;
- (id)parameterStateFromDialogResponse:(id)a3;
- (unint64_t)hintDisplayMode;
- (unint64_t)syntaxHighlightingType;
- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6;
- (void)setLocalizedPlaceholder:(id)a3;
- (void)setPrefix:(id)a3;
@end

@implementation WFTextInputParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textAlignment, 0);
  objc_storeStrong((id *)&self->_autocorrectionType, 0);
  objc_storeStrong((id *)&self->_autocapitalizationType, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
}

- (BOOL)processesIntoContentItems
{
  return self->_processesIntoContentItems;
}

- (unint64_t)syntaxHighlightingType
{
  return self->_syntaxHighlightingType;
}

- (unint64_t)hintDisplayMode
{
  return self->_hintDisplayMode;
}

- (BOOL)isMonospace
{
  return self->_monospace;
}

- (BOOL)isMultiline
{
  return self->_multiline;
}

- (NSString)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)textReplacementDisabled
{
  return self->_textReplacementDisabled;
}

- (BOOL)smartDashesDisabled
{
  return self->_smartDashesDisabled;
}

- (BOOL)smartQuotesDisabled
{
  return self->_smartQuotesDisabled;
}

- (BOOL)autoPeriodsDisabled
{
  return self->_autoPeriodsDisabled;
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

- (BOOL)isSecureTextEntry
{
  return self->_secureTextEntry;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (id)parameterStateFromDialogResponse:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [WFVariableString alloc];
  v6 = [v4 inputtedText];

  v7 = [(WFVariableString *)v5 initWithString:v6];
  v8 = [[(objc_class *)[(WFTextInputParameter *)self singleStateClass] alloc] initWithVariableString:v7];
  if ([(WFParameter *)self allowsMultipleValues])
  {
    v9 = [WFMultipleValueParameterState alloc];
    v13[0] = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v11 = [(WFMultipleValueParameterState *)v9 initWithParameterStates:v10];
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (NSString)returnKeyType
{
  BOOL v2 = [(WFTextInputParameter *)self isMultiline];
  v3 = (void **)MEMORY[0x1E4FB4E40];
  if (!v2) {
    v3 = (void **)MEMORY[0x1E4FB4E48];
  }
  id v4 = *v3;
  return (NSString *)v4;
}

- (id)createDialogTextFieldConfigurationWithDefaultState:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FB49E0]);
  v6 = [v4 variableString];
  v7 = [v6 stringByRemovingVariables];
  [v5 setText:v7];

  v8 = [(WFTextInputParameter *)self prefix];
  [v5 setPrefix:v8];

  v9 = [(WFParameter *)self localizedPlaceholder];
  [v5 setPlaceholder:v9];

  objc_msgSend(v5, "setSecureTextEntry:", -[WFTextInputParameter isSecureTextEntry](self, "isSecureTextEntry"));
  v10 = [(WFTextInputParameter *)self keyboardType];
  [v5 setKeyboardType:v10];

  v11 = [(WFTextInputParameter *)self textContentType];
  [v5 setTextContentType:v11];

  v12 = [(WFTextInputParameter *)self autocapitalizationType];
  [v5 setAutocapitalizationType:v12];

  v13 = [(WFTextInputParameter *)self autocorrectionType];
  [v5 setAutocorrectionType:v13];

  objc_msgSend(v5, "setSmartQuotesDisabled:", -[WFTextInputParameter smartQuotesDisabled](self, "smartQuotesDisabled"));
  objc_msgSend(v5, "setSmartDashesDisabled:", -[WFTextInputParameter smartDashesDisabled](self, "smartDashesDisabled"));
  objc_msgSend(v5, "setAutoPeriodsDisabled:", -[WFTextInputParameter autoPeriodsDisabled](self, "autoPeriodsDisabled"));
  objc_msgSend(v5, "setTextReplacementDisabled:", -[WFTextInputParameter textReplacementDisabled](self, "textReplacementDisabled"));
  objc_msgSend(v5, "setMultiline:", -[WFTextInputParameter isMultiline](self, "isMultiline"));
  if (v4) {
    objc_msgSend(v5, "setInitialInsertionIndex:", objc_msgSend(v4, "userInputInsertionIndex"));
  }
  v14 = [(WFTextInputParameter *)self returnKeyType];
  [v5 setReturnKeyType:v14];

  return v5;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void))a6;
  v13 = [v10 variableString];
  v14 = [v13 variables];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    v12[2](v12, 0);
  }
  else
  {
    v16 = [(WFTextInputParameter *)self createDialogTextFieldConfigurationWithDefaultState:v10];
    id v17 = objc_alloc(MEMORY[0x1E4FB4798]);
    v18 = [(WFParameter *)self key];
    v19 = (void *)[v17 initWithTextFieldConfiguration:v16 message:0 attribution:v20 prompt:v11 parameterKey:v18];
    ((void (**)(id, void *))v12)[2](v12, v19);
  }
}

- (void)setLocalizedPlaceholder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFTextInputParameter;
  [(WFParameter *)&v4 setLocalizedPlaceholder:a3];
  [(WFParameter *)self attributesDidChange];
}

- (void)setPrefix:(id)a3
{
  objc_super v4 = (NSString *)[a3 copy];
  prefix = self->_prefix;
  self->_prefix = v4;

  [(WFParameter *)self attributesDidChange];
}

- (id)defaultSupportedVariableTypes
{
  BOOL v2 = objc_opt_class();
  return (id)[v2 allInsertableVariableTypes];
}

- (id)hintForState:(id)a3
{
  return 0;
}

- (BOOL)shouldAlignLabels
{
  v3 = [(WFTextInputParameter *)self textAlignment];
  objc_super v4 = (void *)*MEMORY[0x1E4FB4E58];
  id v5 = v3;
  id v6 = v4;
  if (v5 == v6)
  {
  }
  else
  {
    v7 = v6;
    if (!v5 || !v6)
    {

LABEL_9:
      LOBYTE(v9) = 0;
      goto LABEL_10;
    }
    int v8 = [v5 isEqualToString:v6];

    if (!v8) {
      goto LABEL_9;
    }
  }
  BOOL v9 = ![(WFTextInputParameter *)self isMultiline];
LABEL_10:

  return v9;
}

- (NSString)textContentType
{
  v3 = [MEMORY[0x1E4F5A7A0] sharedContext];
  int v4 = [v3 shouldReverseLayoutDirection];
  id v5 = (id *)MEMORY[0x1E4FB4E50];
  if (!v4) {
    id v5 = (id *)MEMORY[0x1E4FB4E60];
  }
  id v6 = *v5;

  if (!self->_textContentType)
  {
    v7 = self->_textAlignment;
    int v8 = (NSString *)v6;
    BOOL v9 = v8;
    if (v7 == v8)
    {
    }
    else
    {
      if (v8) {
        BOOL v10 = v7 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10) {
        goto LABEL_13;
      }
      BOOL v11 = [(NSString *)v7 isEqualToString:v8];

      if (!v11) {
        goto LABEL_14;
      }
    }
    v7 = [(WFParameter *)self definition];
    BOOL v9 = [(NSString *)v7 objectForKey:@"TextContentType"];
    uint64_t v12 = objc_opt_class();
    WFEnforceClass(v9, v12);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    textContentType = self->_textContentType;
    self->_textContentType = v13;

LABEL_13:
  }
LABEL_14:
  uint64_t v15 = self->_textContentType;

  return v15;
}

- (id)defaultSerializedRepresentation
{
  v6.receiver = self;
  v6.super_class = (Class)WFTextInputParameter;
  BOOL v2 = [(WFParameter *)&v6 defaultSerializedRepresentation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    int v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 localize];
    goto LABEL_5;
  }
  int v4 = 0;
LABEL_7:

  return v4;
}

- (WFTextInputParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)WFTextInputParameter;
  id v5 = [(WFParameter *)&v64 initWithDefinition:v4];
  if (v5)
  {
    objc_super v6 = [v4 objectForKey:@"Prefix"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);
    prefix = v5->_prefix;
    v5->_prefix = (NSString *)v8;

    BOOL v10 = [v4 objectForKey:@"SecureTextInput"];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = WFEnforceClass(v10, v11);
    v5->_secureTextEntry = [v12 BOOLValue];

    v13 = [v4 objectForKey:@"KeyboardType"];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = WFEnforceClass(v13, v14);
    keyboardType = v5->_keyboardType;
    v5->_keyboardType = (NSString *)v15;

    id v17 = [v4 objectForKey:@"AutocapitalizationType"];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = WFEnforceClass(v17, v18);
    autocapitalizationType = v5->_autocapitalizationType;
    v5->_autocapitalizationType = (NSString *)v19;

    v21 = [v4 objectForKey:@"DisableAutocorrection"];
    uint64_t v22 = objc_opt_class();
    v23 = WFEnforceClass(v21, v22);
    int v24 = [v23 BOOLValue];
    v25 = (id *)MEMORY[0x1E4FB4E08];
    if (!v24) {
      v25 = (id *)MEMORY[0x1E4FB4E00];
    }
    objc_storeStrong((id *)&v5->_autocorrectionType, *v25);

    v26 = [v4 objectForKey:@"TextAlignment"];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = WFEnforceClass(v26, v27);
    textAlignment = v5->_textAlignment;
    v5->_textAlignment = (NSString *)v28;

    v30 = [v4 objectForKey:@"Multiline"];
    uint64_t v31 = objc_opt_class();
    v32 = WFEnforceClass(v30, v31);
    v5->_multiline = [v32 BOOLValue];

    v33 = [v4 objectForKey:@"MonospaceFont"];
    uint64_t v34 = objc_opt_class();
    v35 = WFEnforceClass(v33, v34);
    v5->_monospace = [v35 BOOLValue];

    v36 = [v4 objectForKey:@"ProcessIntoContentItems"];
    uint64_t v37 = objc_opt_class();
    v38 = WFEnforceClass(v36, v37);
    v5->_processesIntoContentItems = [v38 BOOLValue];

    v39 = [v4 objectForKey:@"DisableSmartQuotes"];
    uint64_t v40 = objc_opt_class();
    v41 = WFEnforceClass(v39, v40);

    v42 = [v4 objectForKey:@"DisableSmartDashes"];
    uint64_t v43 = objc_opt_class();
    v44 = WFEnforceClass(v42, v43);

    if (v41) {
      char v45 = [v41 BOOLValue];
    }
    else {
      char v45 = 1;
    }
    v5->_smartQuotesDisabled = v45;
    if (v44) {
      char v46 = [v44 BOOLValue];
    }
    else {
      char v46 = 1;
    }
    v5->_smartDashesDisabled = v46;
    v47 = [v4 objectForKey:@"DisableAutoPeriods"];
    uint64_t v48 = objc_opt_class();
    v49 = WFEnforceClass(v47, v48);

    v50 = [v4 objectForKey:@"DisableTextReplacement"];
    uint64_t v51 = objc_opt_class();
    v52 = WFEnforceClass(v50, v51);

    if (v49) {
      char v53 = [v49 BOOLValue];
    }
    else {
      char v53 = 0;
    }
    v5->_autoPeriodsDisabled = v53;
    if (v52) {
      char v54 = [v52 BOOLValue];
    }
    else {
      char v54 = 0;
    }
    v5->_textReplacementDisabled = v54;
    v55 = [v4 objectForKey:@"SyntaxHighlightingType"];
    uint64_t v56 = objc_opt_class();
    v57 = WFEnforceClass(v55, v56);

    v5->_syntaxHighlightingType = [v57 isEqualToString:@"JavaScript"];
    v58 = [v4 objectForKey:@"HintDisplayMode"];
    uint64_t v59 = objc_opt_class();
    v60 = WFEnforceClass(v58, v59);

    if ([v60 isEqualToString:@"WhileProcessing"])
    {
      uint64_t v61 = 1;
    }
    else
    {
      if (![v60 isEqualToString:@"Never"])
      {
        v5->_hintDisplayMode = 0;
        goto LABEL_22;
      }
      uint64_t v61 = 2;
    }
    v5->_hintDisplayMode = v61;
LABEL_22:
    v62 = v5;
  }
  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end