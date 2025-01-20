@interface LNValueType(Workflow)
- (WFLinkActionArrayParameterDefinition)wf_parameterDefinitionWithParameterMetadata:()Workflow dynamicOptionsSupport:actionIdentifier:;
- (id)wf_objectClass;
- (id)wf_objectValueType;
- (id)wf_parameterDefinitionWithParameterMetadata:()Workflow;
- (id)wf_parameterDefinitionWithParameterMetadata:()Workflow actionIdentifier:;
- (id)wf_valueTypeOfClass:()Workflow;
- (uint64_t)wf_entityValueType;
- (uint64_t)wf_enumValueType;
- (uint64_t)wf_parameterDefinitionWithParameterMetadata:()Workflow dynamicOptionsSupport:;
@end

@implementation LNValueType(Workflow)

- (id)wf_valueTypeOfClass:()Workflow
{
  if (objc_opt_isKindOfClass()) {
    v2 = a1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = a1;
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v6 = [v5 memberValueType];
      if (objc_opt_isKindOfClass())
      {
        v7 = [v5 memberValueType];
      }
      else
      {
        v7 = 0;
      }

      a1 = v7;
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (uint64_t)wf_entityValueType
{
  uint64_t v2 = objc_opt_class();
  return objc_msgSend(a1, "wf_valueTypeOfClass:", v2);
}

- (uint64_t)wf_enumValueType
{
  uint64_t v2 = objc_opt_class();
  return objc_msgSend(a1, "wf_valueTypeOfClass:", v2);
}

- (id)wf_parameterDefinitionWithParameterMetadata:()Workflow
{
  id v4 = a3;
  BOOL v5 = [v4 dynamicOptionsSupport] != 0;
  if (objc_msgSend(v4, "wf_isPersistentFileIdentifiableEntity")) {
    BOOL v5 = [v4 dynamicOptionsSupport] == 2;
  }
  v6 = objc_msgSend(a1, "wf_parameterDefinitionWithParameterMetadata:dynamicOptionsSupport:", v4, v5);

  return v6;
}

- (uint64_t)wf_parameterDefinitionWithParameterMetadata:()Workflow dynamicOptionsSupport:
{
  return objc_msgSend(a1, "wf_parameterDefinitionWithParameterMetadata:dynamicOptionsSupport:actionIdentifier:", a3, a4, 0);
}

- (WFLinkActionArrayParameterDefinition)wf_parameterDefinitionWithParameterMetadata:()Workflow dynamicOptionsSupport:actionIdentifier:
{
  v56[16] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v8 name];
    v11 = v10;
    if (v10 == @"shortcut"
      || v10
      && (int v12 = [(__CFString *)v10 isEqualToString:@"shortcut"], v11, v12))
    {
      v13 = (__CFString *)v9;
      v14 = @"com.apple.shortcuts.RunShortcutIntent";
      if (v13 == @"com.apple.shortcuts.RunShortcutIntent") {
        goto LABEL_15;
      }
      if (v13)
      {
        char v15 = [(__CFString *)v13 isEqualToString:@"com.apple.shortcuts.RunShortcutIntent"];

        if (v15) {
          goto LABEL_16;
        }
        v16 = v13;
        v17 = @"com.apple.shortcuts.RunShortcutConfigurationIntent";
        if (v16 != @"com.apple.shortcuts.RunShortcutConfigurationIntent")
        {
          char v18 = [(__CFString *)v16 isEqualToString:@"com.apple.shortcuts.RunShortcutConfigurationIntent"];

          if (v18) {
            goto LABEL_16;
          }
          v19 = v16;
          v20 = @"com.apple.shortcuts.WFShortcutsSmallWidgetConfigurationIntent";
          if (v19 != @"com.apple.shortcuts.WFShortcutsSmallWidgetConfigurationIntent")
          {
            char v21 = [(__CFString *)v19 isEqualToString:@"com.apple.shortcuts.WFShortcutsSmallWidgetConfigurationIntent"];

            if ((v21 & 1) == 0)
            {
              v22 = v19;
              v23 = @"com.apple.shortcuts.WFShortcutsWidgetConfigurationIntent";
              if (v22 != @"com.apple.shortcuts.WFShortcutsWidgetConfigurationIntent")
              {
                char v24 = [(__CFString *)v22 isEqualToString:@"com.apple.shortcuts.WFShortcutsWidgetConfigurationIntent"];

                if ((v24 & 1) == 0) {
                  goto LABEL_21;
                }
LABEL_17:
                v25 = WFLinkActionSystemShortcutParameterDefinition;
LABEL_18:
                uint64_t v26 = [[v25 alloc] initWithValueType:a1 parameterMetadata:v8];
LABEL_35:
                v36 = (WFLinkActionArrayParameterDefinition *)v26;
                goto LABEL_36;
              }
              goto LABEL_15;
            }
LABEL_16:

            goto LABEL_17;
          }
        }
LABEL_15:

        goto LABEL_16;
      }

      v27 = @"com.apple.shortcuts.RunShortcutConfigurationIntent";
      v28 = @"com.apple.shortcuts.WFShortcutsSmallWidgetConfigurationIntent";

      v29 = @"com.apple.shortcuts.WFShortcutsWidgetConfigurationIntent";
    }
  }
LABEL_21:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [WFLinkActionArrayParameterDefinition alloc];
    id v31 = a1;
    if (v31)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v32 = v31;
      }
      else {
        v32 = 0;
      }
    }
    else
    {
      v32 = 0;
    }
    id v34 = v32;

    v35 = [v34 memberValueType];

    v36 = [(WFLinkActionArrayParameterDefinition *)v30 initWithMemberValueType:v35 parameterMetadata:v8 actionIdentifier:v9];
    goto LABEL_36;
  }
  if (objc_msgSend(v8, "wf_isPersistentFileIdentifiableEntity"))
  {
    v33 = WFLinkActionFileEntityParameterDefinition;
LABEL_34:
    uint64_t v26 = [[v33 alloc] initWithParameterMetadata:v8];
    goto LABEL_35;
  }
  if (a4)
  {
    v33 = WFLinkActionDynamicOptionsParameterDefinition;
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v33 = WFLinkActionEnumParameterDefinition;
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = WFLinkActionMeasurementParameterDefinition;
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v33 = WFLinkActionEntityParameterDefinition;
    goto LABEL_34;
  }
  v54 = [MEMORY[0x1E4F72D18] stringValueType];
  v55[0] = v54;
  v56[0] = objc_opt_class();
  v53 = [MEMORY[0x1E4F72D18] attributedStringValueType];
  v55[1] = v53;
  v56[1] = objc_opt_class();
  v52 = [MEMORY[0x1E4F72D18] intValueType];
  v55[2] = v52;
  v56[2] = objc_opt_class();
  v51 = [MEMORY[0x1E4F72D18] doubleValueType];
  v55[3] = v51;
  v56[3] = objc_opt_class();
  v50 = [MEMORY[0x1E4F72D18] BOOLValueType];
  v55[4] = v50;
  v56[4] = objc_opt_class();
  v49 = [MEMORY[0x1E4F72D18] dateValueType];
  v55[5] = v49;
  v56[5] = objc_opt_class();
  v48 = [MEMORY[0x1E4F72D18] dateComponentsValueType];
  v55[6] = v48;
  v56[6] = objc_opt_class();
  v47 = [MEMORY[0x1E4F72D18] placemarkValueType];
  v55[7] = v47;
  v56[7] = objc_opt_class();
  v46 = [MEMORY[0x1E4F72D18] URLValueType];
  v55[8] = v46;
  v56[8] = objc_opt_class();
  v45 = [MEMORY[0x1E4F72CB8] fileValueType];
  v55[9] = v45;
  v56[9] = objc_opt_class();
  v38 = [MEMORY[0x1E4F72CB8] personValueType];
  v55[10] = v38;
  v56[10] = objc_opt_class();
  v39 = [MEMORY[0x1E4F72CB8] currencyAmountValueType];
  v55[11] = v39;
  v56[11] = objc_opt_class();
  v40 = [MEMORY[0x1E4F72CB8] paymentMethodValueType];
  v55[12] = v40;
  v56[12] = objc_opt_class();
  v41 = [MEMORY[0x1E4F72D90] stringValueType];
  v55[13] = v41;
  v56[13] = objc_opt_class();
  v42 = [MEMORY[0x1E4F72B70] photoItemCollectionValueType];
  v55[14] = v42;
  v56[14] = objc_opt_class();
  v43 = [MEMORY[0x1E4F72CB8] applicationValueType];
  v55[15] = v43;
  v56[15] = objc_opt_class();
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:16];

  v36 = (WFLinkActionArrayParameterDefinition *)objc_msgSend(objc_alloc((Class)objc_msgSend(v44, "objectForKey:", a1)), "initWithParameterMetadata:", v8);
LABEL_36:

  return v36;
}

- (id)wf_parameterDefinitionWithParameterMetadata:()Workflow actionIdentifier:
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 dynamicOptionsSupport] != 0;
  if (objc_msgSend(v6, "wf_isPersistentFileIdentifiableEntity")) {
    BOOL v8 = [v6 dynamicOptionsSupport] == 2;
  }
  id v9 = objc_msgSend(a1, "wf_parameterDefinitionWithParameterMetadata:dynamicOptionsSupport:actionIdentifier:", v6, v8, v7);

  return v9;
}

- (id)wf_objectValueType
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v2 = [v1 memberValueType];
  }
  else
  {

    id v2 = v1;
  }
  return v2;
}

- (id)wf_objectClass
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = [v1 memberValueType];
      objc_msgSend(v2, "wf_objectClass");
      id v3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_4:
      goto LABEL_10;
    }
  }

  id v4 = (void *)[v1 objectClass];
  if (v4 == objc_opt_class())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v1 typeIdentifier] == 1)
    {
      id v1 = [NSNumber numberWithBool:1];
      objc_opt_class();
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
  }
  id v3 = v4;
LABEL_10:
  return v3;
}

@end