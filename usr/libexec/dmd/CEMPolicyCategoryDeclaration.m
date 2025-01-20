@interface CEMPolicyCategoryDeclaration
- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMPolicyCategoryDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CEMPolicyCategoryDeclaration *)self payloadMode];
  if (DMDDeclarationModeIsValid(v7))
  {
    v8 = objc_opt_new();
    v9 = [v6 organizationIdentifier];
    [v8 setOrganizationIdentifier:v9];

    v10 = [(CEMPolicyCategoryDeclaration *)self declarationIdentifier];
    [v8 setDeclarationIdentifier:v10];

    [v8 setType:DMFEffectivePolicyTypeCategory];
    [v8 setPolicy:DMDPolicyFromDeclarationMode(v7)];
    v11 = [(CEMPolicyCategoryDeclaration *)self payloadCategoriesVersion2];
    if (v11)
    {
      [v8 setIdentifiers:v11];
    }
    else
    {
      v13 = [(CEMPolicyCategoryDeclaration *)self payloadCategories];
      [v8 setIdentifiers:v13];
    }
    if (v7)
    {
      if ([v7 caseInsensitiveCompare:DMFDeclarationPayloadModeOverride]) {
        uint64_t v14 = 100;
      }
      else {
        uint64_t v14 = 1;
      }
    }
    else
    {
      uint64_t v14 = 100;
    }
    [v8 setPriority:v14];
    id v19 = 0;
    unsigned int v15 = +[DMDSetEffectivePolicyOperation validateRequest:v8 error:&v19];
    id v16 = v19;
    if (v15)
    {
      id v12 = v8;
    }
    else
    {
      v17 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10007E8FC(v16);
      }

      id v12 = 0;
      if (a4) {
        *a4 = v16;
      }
    }
  }
  else
  {
    if (!a4)
    {
      id v12 = 0;
      goto LABEL_21;
    }
    uint64_t v20 = DMFInvalidParameterErrorKey;
    uint64_t v21 = DMFDeclarationPayloadModeKey;
    v8 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    DMFErrorWithCodeAndUserInfo();
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_21:

  return v12;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [v6 organizationIdentifier];

  [v7 setOrganizationIdentifier:v8];
  v9 = [(CEMPolicyCategoryDeclaration *)self declarationIdentifier];
  [v7 setDeclarationIdentifier:v9];

  id v14 = 0;
  LODWORD(v6) = +[DMDRemoveEffectivePolicyOperation validateRequest:v7 error:&v14];
  id v10 = v14;
  if (v6)
  {
    id v11 = v7;
  }
  else
  {
    id v12 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10007E984(v10);
    }

    id v11 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v11;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0;
}

@end