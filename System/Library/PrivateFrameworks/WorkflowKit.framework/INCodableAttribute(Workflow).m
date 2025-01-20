@interface INCodableAttribute(Workflow)
- (BOOL)wf_multipleValues;
- (id)wf_contentItemClass;
- (id)wf_contentItemForValue:()Workflow;
- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:;
- (uint64_t)wf_objectClass;
- (uint64_t)wf_parameterClass;
- (uint64_t)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (void)wf_getProcessedIntentValueForParameterValue:()Workflow parameter:parameterState:completionHandler:;
@end

@implementation INCodableAttribute(Workflow)

- (id)wf_contentItemForValue:()Workflow
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_msgSend(a1, "wf_contentItemClass"), "itemWithObject:", v4);

  return v5;
}

- (uint64_t)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  return 0;
}

- (void)wf_getProcessedIntentValueForParameterValue:()Workflow parameter:parameterState:completionHandler:
{
}

- (id)wf_updatedParameterDefinition:()Workflow parameterClass:localizer:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v47 = a5;
  objc_msgSend(a1, "localizedDisplayNameWithLocalizer:");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    uint64_t v10 = [a1 displayName];
    v11 = (void *)v10;
    v12 = &stru_1F229A4D8;
    if (v10) {
      v12 = (__CFString *)v10;
    }
    v9 = v12;
    v13 = getWFActionsLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v14 = NSStringFromClass(a4);
      v15 = [a1 propertyName];
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[INCodableAttribute(Workflow) wf_updatedParameterDefinition:parameterClass:localizer:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v66 = v15;
      LOWORD(v67) = 2112;
      *(void *)((char *)&v67 + 2) = v11;
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_FAULT, "%s no localized name class=%@, propertyName=%@, displayName=%@", buf, 0x2Au);
    }
  }
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__25777;
  v55 = __Block_byref_object_dispose__25778;
  id v46 = v8;
  id v56 = v46;
  v63[0] = @"Class";
  v16 = NSStringFromClass(a4);
  v64[0] = v16;
  v63[1] = @"Key";
  v17 = [a1 propertyName];
  v64[1] = v17;
  v64[2] = v9;
  v63[2] = @"Label";
  v63[3] = @"IntentSlotName";
  v18 = [a1 propertyName];
  v64[3] = v18;
  v63[4] = @"AllowsMultipleValues";
  v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "modifier") == 0);
  v64[4] = v19;
  v64[5] = @"Right";
  v63[5] = @"TextAlignment";
  v63[6] = @"FixedSizeArray";
  v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isFixedSizeArray"));
  v64[6] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:7];

  if ([a1 isFixedSizeArray])
  {
    uint64_t v22 = *MEMORY[0x1E4F300A0];
    *(void *)buf = *MEMORY[0x1E4F300A8];
    *(void *)&buf[8] = v22;
    v23 = (void *)*MEMORY[0x1E4F30090];
    *(void *)&buf[16] = *MEMORY[0x1E4F30098];
    v66 = v23;
    uint64_t v24 = *MEMORY[0x1E4F30070];
    *(void *)&long long v67 = *MEMORY[0x1E4F30078];
    *((void *)&v67 + 1) = v24;
    uint64_t v25 = *MEMORY[0x1E4F30080];
    uint64_t v68 = *MEMORY[0x1E4F30088];
    uint64_t v69 = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:8];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __87__INCodableAttribute_Workflow__wf_updatedParameterDefinition_parameterClass_localizer___block_invoke;
    v50[3] = &unk_1E65572C8;
    v50[4] = a1;
    v27 = objc_msgSend(v26, "if_compactMap:", v50);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __87__INCodableAttribute_Workflow__wf_updatedParameterDefinition_parameterClass_localizer___block_invoke_2;
    v49[3] = &unk_1E6550D48;
    v49[4] = a1;
    v28 = objc_msgSend(v26, "if_objectsPassingTest:", v49);
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v28];
    v61 = @"ArraySizesForSizeClass";
    v62 = v29;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    uint64_t v31 = objc_msgSend(v21, "if_dictionaryByAddingEntriesFromDictionary:", v30);

    v21 = (void *)v31;
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __87__INCodableAttribute_Workflow__wf_updatedParameterDefinition_parameterClass_localizer___block_invoke_3;
  v48[3] = &unk_1E65566A8;
  v48[4] = &v51;
  [v21 enumerateKeysAndObjectsUsingBlock:v48];
  if (([a1 supportsDynamicEnumeration] & 1) == 0)
  {
    v32 = [a1 metadata];
    v33 = [v32 localizedPlaceholder];

    if (v33)
    {
      v34 = (void *)v52[5];
      v59 = @"Placeholder";
      v60 = v33;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      uint64_t v36 = [v34 definitionByAddingEntriesInDictionary:v35];
      v37 = (void *)v52[5];
      v52[5] = v36;
    }
  }
  v38 = [a1 languageCode];

  if (v38)
  {
    v39 = (void *)v52[5];
    v57 = @"LanguageCodeOverride";
    v40 = [a1 languageCode];
    v58 = v40;
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    uint64_t v42 = [v39 definitionByAddingEntriesInDictionary:v41];
    v43 = (void *)v52[5];
    v52[5] = v42;
  }
  id v44 = (id)v52[5];

  _Block_object_dispose(&v51, 8);
  return v44;
}

- (uint64_t)wf_parameterClass
{
  return 0;
}

- (BOOL)wf_multipleValues
{
  return [a1 modifier] == 0;
}

- (id)wf_contentItemClass
{
  if (objc_msgSend((id)objc_msgSend(a1, "wf_objectClass"), "conformsToProtocol:", &unk_1F23873A0))
  {
    v2 = objc_msgSend((id)objc_msgSend(a1, "wf_objectClass"), "wf_contentItemClass");
  }
  else
  {
    v3 = [MEMORY[0x1E4F5A858] sharedRegistry];
    id v4 = objc_msgSend(MEMORY[0x1E4F5A9A8], "typeWithClass:", objc_msgSend(a1, "wf_objectClass"));
    v2 = [v3 contentItemClassForType:v4];
  }
  return v2;
}

- (uint64_t)wf_objectClass
{
  return 0;
}

@end