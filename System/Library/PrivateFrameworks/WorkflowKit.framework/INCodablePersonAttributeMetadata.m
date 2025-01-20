@interface INCodablePersonAttributeMetadata
@end

@implementation INCodablePersonAttributeMetadata

id __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 contactIdentifier];
  v5 = (void *)v4;
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6
    || ([*(id *)(a1 + 32) unifiedContactWithIdentifier:v4 keysToFetch:*(void *)(a1 + 40) error:0],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v16 = objc_alloc(MEMORY[0x1E4F5A800]);
    v17 = [MEMORY[0x1E4F5A938] contactWithPerson:v3];
    v18 = (void *)[v16 initWithContact:v17];

    goto LABEL_20;
  }
  v8 = (void *)v7;
  v9 = [v3 personHandle];
  uint64_t v10 = [v9 type];

  if (v10 == 2)
  {
    v19 = [v8 phoneNumbers];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke_4;
    v24[3] = &unk_1E6557540;
    v12 = &v25;
    id v25 = v3;
    uint64_t v13 = [v19 indexOfObjectPassingTest:v24];

    BOOL v14 = v13 == 0x7FFFFFFFFFFFFFFFLL;
    unsigned int v15 = 3;
    goto LABEL_11;
  }
  if (v10 == 1)
  {
    v11 = [v8 emailAddresses];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke_3;
    v26[3] = &unk_1E6557540;
    v12 = &v27;
    id v27 = v3;
    uint64_t v13 = [v11 indexOfObjectPassingTest:v26];

    BOOL v14 = v13 == 0x7FFFFFFFFFFFFFFFLL;
    unsigned int v15 = 4;
LABEL_11:
    if (v14) {
      uint64_t v20 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v20 = v15;
    }
    if (v14) {
      uint64_t v13 = -1;
    }

    goto LABEL_19;
  }
  uint64_t v13 = -1;
  uint64_t v20 = 0xFFFFFFFFLL;
LABEL_19:
  id v21 = objc_alloc(MEMORY[0x1E4F5A800]);
  v22 = [MEMORY[0x1E4F5A7B8] contactWithCNContact:v8 propertyID:v20 multivalueIndex:v13];
  v18 = (void *)[v21 initWithContact:v22];

LABEL_20:
  return v18;
}

uint64_t __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 value];
  uint64_t v4 = [*(id *)(a1 + 32) personHandle];
  v5 = [v4 value];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

uint64_t __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 value];
  uint64_t v14 = 0;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x2050000000;
  v5 = (void *)getCNPhoneNumberClass_softClass;
  uint64_t v17 = getCNPhoneNumberClass_softClass;
  if (!getCNPhoneNumberClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getCNPhoneNumberClass_block_invoke;
    v13[3] = &unk_1E6558B78;
    v13[4] = &v14;
    __getCNPhoneNumberClass_block_invoke((uint64_t)v13);
    v5 = (void *)v15[3];
  }
  uint64_t v6 = v5;
  _Block_object_dispose(&v14, 8);
  id v7 = [v6 alloc];
  v8 = [*(id *)(a1 + 32) personHandle];
  v9 = [v8 value];
  uint64_t v10 = (void *)[v7 initWithStringValue:v9];
  uint64_t v11 = [v4 isLikePhoneNumber:v10];

  return v11;
}

id __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v4 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = getWFGeneralLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v9 = 136315906;
      uint64_t v10 = "WFEnforceClass";
      __int16 v11 = 2114;
      id v12 = v4;
      __int16 v13 = 2114;
      id v14 = (id)objc_opt_class();
      __int16 v15 = 2114;
      uint64_t v16 = v3;
      id v7 = v14;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v9, 0x2Au);
    }
    id v5 = 0;
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

@end