@interface INIntentSlotDescription(Workflow)
- (id)wf_facadeClass;
- (id)wf_objectClass;
- (id)wf_parameterClass;
- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:;
- (uint64_t)wf_contentItemClass;
- (uint64_t)wf_contentItemForValue:()Workflow;
- (uint64_t)wf_multipleValues;
- (uint64_t)wf_outputContentItemForOutput:()Workflow;
- (uint64_t)wf_outputDisplayNameWithLocalizer:()Workflow;
- (uint64_t)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (uint64_t)wf_processedParameterValueForValue:()Workflow;
- (void)wf_getProcessedIntentValueForParameterValue:()Workflow parameter:parameterState:completionHandler:;
@end

@implementation INIntentSlotDescription(Workflow)

- (uint64_t)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  return 0;
}

- (uint64_t)wf_outputContentItemForOutput:()Workflow
{
  return 0;
}

- (void)wf_getProcessedIntentValueForParameterValue:()Workflow parameter:parameterState:completionHandler:
{
}

- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 resolveSelectorStrings];
  if (![v10 count])
  {

    goto LABEL_11;
  }
  char v11 = [a1 isPrivate];

  if (v11)
  {
LABEL_11:
    id v32 = v8;
    goto LABEL_12;
  }
  unint64_t v12 = [a1 valueType];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__60148;
  v39 = __Block_byref_object_dispose__60149;
  id v40 = v8;
  v45[0] = @"Class";
  v13 = NSStringFromClass(a4);
  v46[0] = v13;
  v45[1] = @"Key";
  v14 = [a1 name];
  v46[1] = v14;
  v45[2] = @"Label";
  v15 = [a1 name];
  v16 = WFAddSpacesToCamelCaseName(v15);
  v17 = WFCapitalizeFirstLetter(v16);
  v46[2] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __92__INIntentSlotDescription_Workflow__wf_updatedParameterDefinition_parameterClass_localizer___block_invoke;
  v34[3] = &unk_1E65566A8;
  v34[4] = &v35;
  [v18 enumerateKeysAndObjectsUsingBlock:v34];
  if ([(objc_class *)a4 isEqual:objc_opt_class()])
  {
    v19 = (void *)v36[5];
    v43 = @"AllowsDecimalNumbers";
    v20 = [NSNumber numberWithBool:(v12 < 0x36) & (0x20000000200018uLL >> v12)];
    v44 = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    uint64_t v22 = [v19 definitionByAddingEntriesInDictionary:v21];
    v23 = (void *)v36[5];
    v36[5] = v22;
  }
  if ([(objc_class *)a4 isEqual:objc_opt_class()])
  {
    v24 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithObjects:", @"Variable", @"ExtensionInput", @"ActionOutput", @"CurrentDate", @"Clipboard", 0);
    v25 = [(id)v36[5] objectForKey:@"DisallowedVariableTypes"];
    if (v25)
    {
      uint64_t v26 = [v24 orderedSetByAddingObjectsFromArray:v25];

      v24 = (void *)v26;
    }
    v27 = (void *)v36[5];
    v41 = @"DisallowedVariableTypes";
    v28 = [v24 array];
    v42 = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    uint64_t v30 = [v27 definitionByAddingEntriesInDictionary:v29];
    v31 = (void *)v36[5];
    v36[5] = v30;
  }
  id v32 = (id)v36[5];

  _Block_object_dispose(&v35, 8);
LABEL_12:

  return v32;
}

- (uint64_t)wf_processedParameterValueForValue:()Workflow
{
  return 0;
}

- (uint64_t)wf_contentItemForValue:()Workflow
{
  return 0;
}

- (uint64_t)wf_contentItemClass
{
  return 0;
}

- (uint64_t)wf_outputDisplayNameWithLocalizer:()Workflow
{
  return 0;
}

- (id)wf_parameterClass
{
  uint64_t v1 = [a1 valueType];
  v2 = 0;
  if (!(!v4 & v3))
  {
    switch(v1)
    {
      case 1:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 16:
      case 18:
      case 21:
      case 24:
      case 27:
      case 28:
      case 30:
        goto LABEL_10;
      case 2:
      case 12:
      case 13:
      case 14:
      case 15:
      case 17:
      case 19:
      case 20:
      case 22:
      case 23:
      case 25:
      case 26:
      case 29:
        goto LABEL_11;
      default:
        JUMPOUT(0);
    }
  }
  if ((unint64_t)(v1 - 53) <= 0x3F
    && (((1 << (v1 - 53)) & 0xE0002001800A8C30) != 0 || v1 == 53)
    || (unint64_t v5 = v1 - 120, v5 <= 0x1D) && ((1 << v5) & 0x2080037F) != 0)
  {
LABEL_10:
    v2 = objc_opt_class();
  }
LABEL_11:
  return v2;
}

- (uint64_t)wf_multipleValues
{
  if ([a1 valueStyle] == 3) {
    return 1;
  }
  unint64_t v3 = [a1 valueType];
  if (v3 <= 0x1F) {
    return (0x92402800 >> v3) & 1;
  }
  else {
    return 0;
  }
}

- (id)wf_facadeClass
{
  uint64_t v2 = [a1 valueType];
  if ((v2 & 0xFFFFFFFFFFFFFFFELL) == 0xC) {
    goto LABEL_8;
  }
  if (v2 > 17)
  {
    if (v2 == 53 || v2 == 18) {
      goto LABEL_8;
    }
  }
  else if ((unint64_t)(v2 - 10) < 2 || v2 == 16)
  {
LABEL_8:
    unint64_t v3 = objc_opt_class();
    goto LABEL_9;
  }
  unint64_t v3 = objc_msgSend(a1, "wf_objectClass");
LABEL_9:
  return v3;
}

- (id)wf_objectClass
{
  uint64_t v1 = [a1 valueType];
  id v2 = 0;
  switch(v1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 18:
    case 21:
    case 22:
    case 24:
    case 25:
    case 30:
    case 31:
    case 53:
    case 54:
    case 57:
    case 58:
    case 63:
    case 64:
    case 68:
    case 70:
    case 72:
    case 84:
    case 85:
      goto LABEL_4;
    case 14:
    case 15:
    case 17:
    case 19:
    case 20:
    case 23:
    case 26:
    case 29:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 55:
    case 56:
    case 59:
    case 60:
    case 61:
    case 62:
    case 65:
    case 66:
    case 67:
    case 69:
    case 71:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
      break;
    case 27:
    case 28:
      uint64_t v6 = 0;
      v7 = &v6;
      uint64_t v8 = 0x2050000000;
      char v4 = (void *)getCLPlacemarkClass_softClass_60150;
      uint64_t v9 = getCLPlacemarkClass_softClass_60150;
      if (!getCLPlacemarkClass_softClass_60150)
      {
        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = __getCLPlacemarkClass_block_invoke_60151;
        v5[3] = &unk_1E6558B78;
        v5[4] = &v6;
        __getCLPlacemarkClass_block_invoke_60151((uint64_t)v5);
        char v4 = (void *)v7[3];
      }
      id v2 = v4;
      _Block_object_dispose(&v6, 8);
      break;
    default:
      if ((unint64_t)(v1 - 98) <= 0x33 && ((1 << (v1 - 98)) & 0x82000DFC70001) != 0)
      {
LABEL_4:
        objc_opt_class();
        id v2 = (id)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return v2;
}

@end