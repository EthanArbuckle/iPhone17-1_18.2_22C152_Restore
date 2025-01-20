@interface INCodablePersonAttributeMetadata(Workflow)
- (id)wf_contentItemForValue:()Workflow;
- (id)wf_parameterClass;
- (id)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (uint64_t)wf_objectClass;
@end

@implementation INCodablePersonAttributeMetadata(Workflow)

- (id)wf_contentItemForValue:()Workflow
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)MEMORY[0x1E4F5A848];
    v6 = [MEMORY[0x1E4F5A7F0] cnContactWithINPerson:v4];

    v7 = [v5 itemWithObject:v6];
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&off_1F238B020;
    v7 = objc_msgSendSuper2(&v9, sel_wf_contentItemForValue_, v4);
  }
  return v7;
}

- (id)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v9 = 0;
LABEL_17:
      v22.receiver = a1;
      v22.super_class = (Class)&off_1F238B020;
      v18 = objc_msgSendSuper2(&v22, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7);
      goto LABEL_18;
    }
    uint64_t v8 = objc_msgSend(v6, "if_compactMap:", &__block_literal_global_65182);
  }
  objc_super v9 = (void *)v8;
  if (!v8) {
    goto LABEL_17;
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v10 = (void *)getCNContactStoreClass_softClass_65183;
  uint64_t v31 = getCNContactStoreClass_softClass_65183;
  if (!getCNContactStoreClass_softClass_65183)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __getCNContactStoreClass_block_invoke_65184;
    v27[3] = &unk_1E6558B78;
    v27[4] = &v28;
    __getCNContactStoreClass_block_invoke_65184((uint64_t)v27);
    v10 = (void *)v29[3];
  }
  v11 = v10;
  _Block_object_dispose(&v28, 8);
  id v12 = objc_alloc_init(v11);
  v13 = [MEMORY[0x1E4F5A7B8] requiredKeysToFetch];
  char IsAuthorizedToAccessContact = WFCNContactIsAuthorizedToAccessContact();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __98__INCodablePersonAttributeMetadata_Workflow__wf_parameterStateForIntentValue_parameterDefinition___block_invoke_2;
  v23[3] = &unk_1E6557568;
  char v26 = IsAuthorizedToAccessContact;
  id v15 = v12;
  id v24 = v15;
  id v16 = v13;
  id v25 = v16;
  v17 = objc_msgSend(v9, "if_map:", v23);
  v18 = 0;
  int v19 = 0;
  switch([a1 type])
  {
    case 0:
      v20 = [(WFMultipleValueParameterState *)[WFContactSubstitutableState alloc] initWithParameterStates:v17];
      goto LABEL_15;
    case 1:
      v20 = [(WFMultipleValueParameterState *)[WFEmailAddressSubstitutableState alloc] initWithParameterStates:v17];
      goto LABEL_15;
    case 2:
      v20 = [(WFMultipleValueParameterState *)[WFPhoneNumberSubstitutableState alloc] initWithParameterStates:v17];
      goto LABEL_15;
    case 3:
      v20 = [(WFMultipleValueParameterState *)[WFContactHandleSubstitutableState alloc] initWithParameterStates:v17];
LABEL_15:
      v18 = v20;
      int v19 = 0;
      break;
    case 4:
      break;
    default:
      int v19 = 1;
      break;
  }

  if (v19) {
    goto LABEL_17;
  }
LABEL_18:

  return v18;
}

- (id)wf_parameterClass
{
  if ((unint64_t)[a1 type] > 3)
  {
    v1 = 0;
  }
  else
  {
    v1 = objc_opt_class();
  }
  return v1;
}

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

@end