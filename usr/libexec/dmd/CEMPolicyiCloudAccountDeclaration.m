@interface CEMPolicyiCloudAccountDeclaration
- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMPolicyiCloudAccountDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CEMPolicyiCloudAccountDeclaration *)self payloadMode];
  if (DMDDeclarationModeIsValid(v7))
  {
    v8 = objc_opt_new();
    v9 = [v6 organizationIdentifier];
    [v8 setOrganizationIdentifier:v9];

    v10 = [(CEMPolicyiCloudAccountDeclaration *)self declarationIdentifier];
    [v8 setDeclarationIdentifier:v10];

    [v8 setType:DMFEffectivePolicyTypeiCloudAccountLogout];
    [v8 setPolicy:DMDPolicyFromDeclarationMode(v7)];
    if (v7)
    {
      if ([v7 caseInsensitiveCompare:DMFDeclarationPayloadModeOverride]) {
        uint64_t v11 = 100;
      }
      else {
        uint64_t v11 = 1;
      }
    }
    else
    {
      uint64_t v11 = 100;
    }
    [v8 setPriority:v11];
    id v17 = 0;
    unsigned int v13 = +[DMDSetEffectivePolicyOperation validateRequest:v8 error:&v17];
    id v14 = v17;
    if (v13)
    {
      id v12 = v8;
    }
    else
    {
      v15 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10007E8FC(v14);
      }

      id v12 = 0;
      if (a4) {
        *a4 = v14;
      }
    }
  }
  else
  {
    if (!a4)
    {
      id v12 = 0;
      goto LABEL_18;
    }
    uint64_t v18 = DMFInvalidParameterErrorKey;
    uint64_t v19 = DMFDeclarationPayloadModeKey;
    v8 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    DMFErrorWithCodeAndUserInfo();
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_18:

  return v12;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [v6 organizationIdentifier];

  [v7 setOrganizationIdentifier:v8];
  v9 = [(CEMPolicyiCloudAccountDeclaration *)self declarationIdentifier];
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