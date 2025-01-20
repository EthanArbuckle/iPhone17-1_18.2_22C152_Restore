@interface CEMPolicyAppDeclaration
- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMPolicyAppDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CEMPolicyAppDeclaration *)self payloadMode];
  if (DMDDeclarationModeIsValid(v7))
  {
    v8 = objc_opt_new();
    v9 = [v6 organizationIdentifier];
    [v8 setOrganizationIdentifier:v9];

    v10 = [(CEMPolicyAppDeclaration *)self declarationIdentifier];
    [v8 setDeclarationIdentifier:v10];

    [v8 setType:DMFEffectivePolicyTypeApplication];
    [v8 setPolicy:DMDPolicyFromDeclarationMode(v7)];
    v11 = [(CEMPolicyAppDeclaration *)self payloadApps];
    [v8 setIdentifiers:v11];

    if (v7)
    {
      if ([v7 caseInsensitiveCompare:DMFDeclarationPayloadModeOverride]) {
        uint64_t v12 = 100;
      }
      else {
        uint64_t v12 = 1;
      }
    }
    else
    {
      uint64_t v12 = 100;
    }
    [v8 setPriority:v12];
    id v18 = 0;
    unsigned int v14 = +[DMDSetEffectivePolicyOperation validateRequest:v8 error:&v18];
    id v15 = v18;
    if (v14)
    {
      id v13 = v8;
    }
    else
    {
      v16 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10007E8FC(v15);
      }

      id v13 = 0;
      if (a4) {
        *a4 = v15;
      }
    }
  }
  else
  {
    if (!a4)
    {
      id v13 = 0;
      goto LABEL_18;
    }
    uint64_t v19 = DMFInvalidParameterErrorKey;
    uint64_t v20 = DMFDeclarationPayloadModeKey;
    v8 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    DMFErrorWithCodeAndUserInfo();
    id v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_18:

  return v13;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [v6 organizationIdentifier];

  [v7 setOrganizationIdentifier:v8];
  v9 = [(CEMPolicyAppDeclaration *)self declarationIdentifier];
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
    uint64_t v12 = DMFConfigurationEngineLog();
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