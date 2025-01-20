@interface WFCustomIntentDynamicEnumerationParameter
- (BOOL)displaysMultipleValueEditor;
- (BOOL)hidesSubtitleInEditor;
- (BOOL)parameterStateIsValid:(id)a3;
- (BOOL)preferParameterValuePicker;
- (BOOL)wf_allowsMultipleSelection;
- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged;
- (BOOL)wf_supportsSearch;
- (Class)singleStateClass;
- (INCodableAttribute)codableAttribute;
- (INStringLocalizer)stringLocalizer;
- (NSString)localizedConfigurationPromptDialog;
- (NSString)wf_displayLocalizedPrompt;
- (id)accessoryImageForPossibleState:(id)a3;
- (id)localizedSubtitleLabelForPossibleState:(id)a3;
- (id)wf_pickerLocalizedImageForState:(id)a3;
- (id)wf_pickerLocalizedSubtitleForState:(id)a3;
- (id)wf_pickerLocalizedTitleForState:(id)a3;
- (void)getStatesWithSearchTerm:(id)a3 completionHandler:(id)a4;
- (void)setCodableAttribute:(id)a3;
- (void)setStringLocalizer:(id)a3;
- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4;
@end

@implementation WFCustomIntentDynamicEnumerationParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringLocalizer, 0);
  objc_storeStrong((id *)&self->_codableAttribute, 0);
}

- (void)setStringLocalizer:(id)a3
{
}

- (INStringLocalizer)stringLocalizer
{
  return self->_stringLocalizer;
}

- (void)setCodableAttribute:(id)a3
{
}

- (INCodableAttribute)codableAttribute
{
  return self->_codableAttribute;
}

- (void)getStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFDynamicEnumerationParameter *)self dataSource];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__WFCustomIntentDynamicEnumerationParameter_getStatesWithSearchTerm_completionHandler___block_invoke;
  v10[3] = &unk_1E6557340;
  id v11 = v6;
  id v9 = v6;
  [v8 loadPossibleStatesForEnumeration:self searchTerm:v7 completionHandler:v10];
}

void __87__WFCustomIntentDynamicEnumerationParameter_getStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__WFCustomIntentDynamicEnumerationParameter_getStatesWithSearchTerm_completionHandler___block_invoke_2;
  block[3] = &unk_1E6557D28;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __87__WFCustomIntentDynamicEnumerationParameter_getStatesWithSearchTerm_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (BOOL)displaysMultipleValueEditor
{
  v3 = [(WFCustomIntentDynamicEnumerationParameter *)self codableAttribute];
  BOOL v4 = ([v3 supportsSearch] & 1) != 0 || -[WFParameter isRangedSizeArray](self, "isRangedSizeArray");

  return v4;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4 = a3;
  id v5 = [(WFCustomIntentDynamicEnumerationParameter *)self codableAttribute];
  char v6 = [v5 supportsSearch];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFCustomIntentDynamicEnumerationParameter;
    BOOL v7 = [(WFDynamicEnumerationParameter *)&v9 parameterStateIsValid:v4];
  }

  return v7;
}

- (BOOL)hidesSubtitleInEditor
{
  return 1;
}

- (id)localizedSubtitleLabelForPossibleState:(id)a3
{
  id v4 = [a3 value];
  id v5 = [(WFCustomIntentDynamicEnumerationParameter *)self stringLocalizer];
  char v6 = v5;
  if (!v5)
  {
    char v6 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
  }
  BOOL v7 = [(WFCustomIntentDynamicEnumerationParameter *)self codableAttribute];
  id v8 = [v7 metadata];
  objc_super v9 = objc_msgSend(v4, "_intents_readableSubtitleWithLocalizer:metadata:", v6, v8);

  if (!v5) {
  return v9;
  }
}

- (id)accessoryImageForPossibleState:(id)a3
{
  id v4 = [a3 value];
  id v5 = [(WFCustomIntentDynamicEnumerationParameter *)self stringLocalizer];
  if (v5)
  {
    char v6 = objc_msgSend(v4, "_intents_displayImageWithLocalizer:", v5);
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
    char v6 = objc_msgSend(v4, "_intents_displayImageWithLocalizer:", v7);
  }
  id v8 = objc_msgSend(v6, "wf_image");

  return v8;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (NSString)localizedConfigurationPromptDialog
{
  v3 = [(WFDynamicEnumerationParameter *)self dataSource];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFDynamicEnumerationParameter *)self dataSource];
    char v6 = [v5 localizedConfigurationPromptDialogForPamameter:self];
  }
  else
  {
    char v6 = 0;
  }
  return (NSString *)v6;
}

- (id)wf_pickerLocalizedImageForState:(id)a3
{
  char v4 = [a3 value];
  id v5 = [(WFCustomIntentDynamicEnumerationParameter *)self stringLocalizer];
  char v6 = v5;
  if (!v5)
  {
    char v6 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
  }
  BOOL v7 = objc_msgSend(v4, "_intents_displayImageWithLocalizer:", v6);
  id v8 = objc_msgSend(v7, "wf_image");

  if (!v5) {
  return v8;
  }
}

- (id)wf_pickerLocalizedSubtitleForState:(id)a3
{
  return (id)[a3 readableSubtitle];
}

- (id)wf_pickerLocalizedTitleForState:(id)a3
{
  return (id)[a3 readableTitle];
}

- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFDynamicEnumerationParameter *)self dataSource];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __110__WFCustomIntentDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke;
  v10[3] = &unk_1E6557340;
  id v11 = v6;
  id v9 = v6;
  [v8 loadPossibleStatesForEnumeration:self searchTerm:v7 completionHandler:v10];
}

void __110__WFCustomIntentDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__WFCustomIntentDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2;
  block[3] = &unk_1E6557D28;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __110__WFCustomIntentDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged
{
  return 1;
}

- (BOOL)wf_allowsMultipleSelection
{
  BOOL v3 = [(WFDynamicEnumerationParameter *)self allowsMultipleValues];
  if (v3)
  {
    if ([(WFCustomIntentDynamicEnumerationParameter *)self wf_supportsSearch]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(WFParameter *)self isRangedSizeArray];
    }
  }
  return v3;
}

- (NSString)wf_displayLocalizedPrompt
{
  BOOL v3 = [(WFCustomIntentDynamicEnumerationParameter *)self localizedConfigurationPromptDialog];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(WFParameter *)self localizedLabel];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (BOOL)wf_supportsSearch
{
  v2 = [(WFCustomIntentDynamicEnumerationParameter *)self codableAttribute];
  char v3 = [v2 supportsSearch];

  return v3;
}

@end