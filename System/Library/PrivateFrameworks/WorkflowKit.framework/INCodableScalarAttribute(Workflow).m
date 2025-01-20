@interface INCodableScalarAttribute(Workflow)
- (id)wf_objectClass;
- (id)wf_parameterClass;
- (id)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:;
- (uint64_t)wf_contentItemForValue:()Workflow;
@end

@implementation INCodableScalarAttribute(Workflow)

- (uint64_t)wf_contentItemForValue:()Workflow
{
  return objc_msgSend(MEMORY[0x1E4F5A848], "itemWithObject:");
}

- (id)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 type] != 7)
  {
    v16.receiver = a1;
    v16.super_class = (Class)&off_1F2380558;
    v12 = objc_msgSendSuper2(&v16, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7);
    goto LABEL_11;
  }
  if (![a1 modifier])
  {
    uint64_t v13 = objc_opt_class();
    v9 = WFEnforceClass(v6, v13);
    if (v9)
    {
      v14 = [WFMultipleValueParameterState alloc];
      objc_msgSend(v9, "if_compactMap:", &__block_literal_global_41166);
      v10 = (WFVariableString *)objc_claimAutoreleasedReturnValue();
      v11 = [(WFMultipleValueParameterState *)v14 initWithParameterStates:v10];
      goto LABEL_8;
    }
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = objc_opt_class();
  v9 = WFEnforceClass(v6, v8);
  if (!v9) {
    goto LABEL_9;
  }
  v10 = [[WFVariableString alloc] initWithString:v9];
  v11 = [[WFVariableStringParameterState alloc] initWithVariableString:v10];
LABEL_8:
  v12 = v11;

LABEL_10:
LABEL_11:

  return v12;
}

- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v25.receiver = a1;
  v25.super_class = (Class)&off_1F2380558;
  v2 = objc_msgSendSuper2(&v25, sel_wf_updatedParameterDefinition_parameterClass_localizer_);
  if (([a1 supportsDynamicEnumeration] & 1) == 0 && objc_msgSend(a1, "type") == 7)
  {
    v3 = [a1 metadata];
    uint64_t v4 = objc_opt_class();
    v5 = WFEnforceClass(v3, v4);

    v32 = @"TextAlignment";
    int v6 = [v5 isMultiline];
    id v7 = @"Right";
    if (v6) {
      id v7 = @"Left";
    }
    v33[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    v9 = [v2 definitionByAddingEntriesInDictionary:v8];

    uint64_t v10 = [v5 localizedDefaultValue];
    v11 = (void *)v10;
    if (v10)
    {
      v30 = @"DefaultValue";
      uint64_t v31 = v10;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v13 = [v9 definitionByAddingEntriesInDictionary:v12];

      v9 = (void *)v13;
    }
    v28[0] = @"Multiline";
    v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isMultiline"));
    v29[0] = v14;
    v28[1] = @"DisableAutocorrection";
    v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "disableAutocorrect"));
    v29[1] = v15;
    v28[2] = @"DisableSmartDashes";
    objc_super v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "disableSmartDashes"));
    v29[2] = v16;
    v28[3] = @"DisableSmartQuotes";
    v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "disableSmartQuotes"));
    v29[3] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
    v2 = [v9 definitionByAddingEntriesInDictionary:v18];

    unint64_t v19 = [v5 capitalization];
    if (v19 <= 3)
    {
      v20 = off_1E6553228[v19];
      v26 = @"AutocapitalizationType";
      v27 = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      uint64_t v22 = [v2 definitionByAddingEntriesInDictionary:v21];

      v2 = (void *)v22;
    }
  }
  id v23 = v2;

  return v23;
}

- (id)wf_parameterClass
{
  if ([a1 type] == 7)
  {
    v1 = objc_opt_class();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (id)wf_objectClass
{
  switch([a1 type])
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
      v1 = objc_opt_class();
      break;
    case 6:
      v3 = [NSNumber numberWithBool:1];
      v1 = objc_opt_class();

      break;
    default:
      v1 = 0;
      break;
  }
  return v1;
}

@end