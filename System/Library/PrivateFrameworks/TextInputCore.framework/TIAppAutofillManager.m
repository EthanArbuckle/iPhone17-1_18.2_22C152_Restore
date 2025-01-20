@interface TIAppAutofillManager
+ (BOOL)_simulatesAutofillCandidates;
+ (id)sharedInstance;
+ (void)_fetchCredentialsWithPasskeyProvider:(id)a3 autofillContext:(id)a4 textContentType:(id)a5 applicationIdentifier:(id)a6 auditToken:(id *)a7 completion:(id)a8;
+ (void)getCredentialsWithApplicationIdentifier:(id)a3 autofillContext:(id)a4 withCompletionHandler:(id)a5;
+ (void)setSharedAppAutofillManager:(id)a3;
- (BOOL)hasAutofillContextEntitlementForConnection:(id)a3;
- (BOOL)hasCoreTelephonyEntitlementForConnection:(id)a3;
- (BOOL)hasOneTimeCode;
- (BOOL)isValidedString:(id)a3;
- (BOOL)shouldAuthenticateToAcceptAutofill;
- (CoreTelephonyMockObject)coreTelephonyMockObject;
- (LAContext)laContext;
- (NSDate)dateOfLastPasswordAutoFill;
- (NSString)clientIdentifierForLastAutofillGeneration;
- (NSString)clientIdentifierForLastKeyboardSync;
- (NSString)lastAutofilledUsername;
- (NSUUID)documentIdentifierForLastAutofillGeneration;
- (OS_dispatch_queue)privateQueue;
- (SFAppAutoFillPasskeyProvider)passkeyProvider;
- (TICredentialCustomInfo)queuedCustomInfo;
- (TICredentialCustomInfo)queuedUnauthenticatedCustomInfo;
- (TIKeyboardSecureCandidateRenderer)secureCandidateRenderer;
- (id)_autoFillPayloadForPasskey:(id)a3 keyboardInfoType:(unint64_t *)a4;
- (id)_autoFillPayloadForPasswordCredential:(id)a3 keyboardInfoType:(unint64_t *)a4;
- (id)_secureCandidateForPasskey:(id)a3 fromLocalizedStringKey:(id)a4;
- (id)_secureCandidateForPasswordCredential:(id)a3 fromLocalizedStringKey:(id)a4;
- (id)customInfoFromCredential:(id)a3;
- (id)generateCellularCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4;
- (id)generateOneTimeCodeCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4;
- (id)initPrivate;
- (id)localizedCellularAutofillStringForKey:(id)a3 defaultValue:(id)a4;
- (void)_finishAutofillFormCandidatesOnMainThreadWithCredentials:(id)a3 renderTraits:(id)a4 documentIdentifier:(id)a5 clientIdentifier:(id)a6 completion:(id)a7;
- (void)generateAutofillFormCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completion:(id)a5;
- (void)generateAutofillFormSuggestedUsernameWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completionHandler:(id)a5;
- (void)generateHideMyEmailCandidateWithSlotID:(unsigned int)a3 applicationBundleId:(id)a4 applicationId:(id)a5 keyboardState:(id)a6 secureCandidateWidth:(double)a7 secureCandidateHash:(unint64_t)a8 completionHandler:(id)a9;
- (void)generateJustHMEAutofillFormSuggestionWithRenderTraits:(id)a3 withKeyboardState:(id)a4 applicationID:(id)a5 applicationBundleID:(id)a6 completionHandler:(id)a7;
- (void)obtainCredential:(id)a3;
- (void)oneTimeCodeProvider:(id)a3 didUpdateOneTimeCode:(id)a4;
- (void)oneTimeCodeProviderReceivedCode:(id)a3;
- (void)presentHideMyEmailUI:(id)a3 keyboardState:(id)a4 completion:(id)a5;
- (void)pushQueuedCredentialIfNecessaryForKeyboardState:(id)a3;
- (void)reset;
- (void)setClientIdentifierForLastAutofillGeneration:(id)a3;
- (void)setClientIdentifierForLastKeyboardSync:(id)a3;
- (void)setCoreTelephonyMockObject:(id)a3;
- (void)setDateOfLastPasswordAutoFill:(id)a3;
- (void)setDocumentIdentifierForLastAutofillGeneration:(id)a3;
- (void)setLaContext:(id)a3;
- (void)setLastAutofilledUsername:(id)a3;
- (void)setQueuedCustomInfo:(id)a3;
- (void)setQueuedUnauthenticatedCustomInfo:(id)a3;
- (void)shouldAcceptAutofill:(id)a3 withPayload:(id)a4 completion:(id)a5;
- (void)shouldAcceptOneTimeCode:(id)a3 completion:(id)a4;
@end

@implementation TIAppAutofillManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passkeyProvider, 0);
  objc_storeStrong((id *)&self->_laContext, 0);
  objc_storeStrong((id *)&self->_lastAutofilledUsername, 0);
  objc_storeStrong((id *)&self->_dateOfLastPasswordAutoFill, 0);
  objc_storeStrong((id *)&self->_queuedUnauthenticatedCustomInfo, 0);
  objc_storeStrong((id *)&self->_queuedCustomInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifierForLastKeyboardSync, 0);
  objc_storeStrong((id *)&self->_clientIdentifierForLastAutofillGeneration, 0);
  objc_storeStrong((id *)&self->_documentIdentifierForLastAutofillGeneration, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_coreTelephonyMockObject, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeProvider, 0);

  objc_storeStrong((id *)&self->_secureCandidateRenderer, 0);
}

- (SFAppAutoFillPasskeyProvider)passkeyProvider
{
  return self->_passkeyProvider;
}

- (void)setLaContext:(id)a3
{
}

- (LAContext)laContext
{
  return self->_laContext;
}

- (void)setLastAutofilledUsername:(id)a3
{
}

- (NSString)lastAutofilledUsername
{
  return self->_lastAutofilledUsername;
}

- (void)setDateOfLastPasswordAutoFill:(id)a3
{
}

- (NSDate)dateOfLastPasswordAutoFill
{
  return self->_dateOfLastPasswordAutoFill;
}

- (void)setQueuedUnauthenticatedCustomInfo:(id)a3
{
}

- (TICredentialCustomInfo)queuedUnauthenticatedCustomInfo
{
  return self->_queuedUnauthenticatedCustomInfo;
}

- (void)setQueuedCustomInfo:(id)a3
{
}

- (TICredentialCustomInfo)queuedCustomInfo
{
  return self->_queuedCustomInfo;
}

- (void)setClientIdentifierForLastKeyboardSync:(id)a3
{
}

- (NSString)clientIdentifierForLastKeyboardSync
{
  return self->_clientIdentifierForLastKeyboardSync;
}

- (void)setClientIdentifierForLastAutofillGeneration:(id)a3
{
}

- (NSString)clientIdentifierForLastAutofillGeneration
{
  return self->_clientIdentifierForLastAutofillGeneration;
}

- (void)setDocumentIdentifierForLastAutofillGeneration:(id)a3
{
}

- (NSUUID)documentIdentifierForLastAutofillGeneration
{
  return self->_documentIdentifierForLastAutofillGeneration;
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (BOOL)hasOneTimeCode
{
  return self->hasOneTimeCode;
}

- (id)_autoFillPayloadForPasskey:(id)a3 keyboardInfoType:(unint64_t *)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t *)MEMORY[0x1E4FAE910];
  *a4 = 2056;
  uint64_t v9 = *v4;
  v10[0] = a3;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v7;
}

- (id)_secureCandidateForPasskey:(id)a3 fromLocalizedStringKey:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 username];
  uint64_t v9 = [(TIAppAutofillManager *)self secureCandidateRenderer];
  v10 = [v9 localizedStringForKey:v7];

  v11 = NSString;
  id v23 = 0;
  v12 = [v6 relyingPartyIdentifier];
  v13 = [v11 stringWithValidatedFormat:v10, @"%@", &v23, v12 validFormatSpecifiers error];
  id v14 = v23;
  v15 = &stru_1F3F7A998;
  if (v13) {
    v15 = v13;
  }
  v16 = v15;

  if (objc_opt_respondsToSelector())
  {
    v17 = [v6 customTitle];

    if (v17)
    {
      uint64_t v18 = [v6 customTitle];

      v16 = (__CFString *)v18;
    }
  }
  if (v14)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    v19 = TIOSLogFacility();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v22 = [NSString stringWithFormat:@"%s ERROR: invalid localized format for key %@: %@", "-[TIAppAutofillManager _secureCandidateForPasskey:fromLocalizedStringKey:]", v7, v14];
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_debug_impl(&dword_1E3F0E000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  v20 = (void *)[objc_alloc(MEMORY[0x1E4FAE508]) initWithSecureHeader:v16 secureContent:v8 secureFormattedContent:v8 input:&stru_1F3F7A998 truncationSentinel:0];

  return v20;
}

- (id)_autoFillPayloadForPasswordCredential:(id)a3 keyboardInfoType:(unint64_t *)a4
{
  id v5 = a3;
  id v6 = [v5 user];
  id v7 = [v5 password];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v5 isExternal])
  {
    *a4 = 264;
    uint64_t v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    v10 = (void *)MEMORY[0x1E4FAE8F0];
  }
  else
  {
    *a4 = 24;
    [v8 setObject:v6 forKey:*MEMORY[0x1E4FAE938]];
    [v8 setObject:v7 forKey:*MEMORY[0x1E4FAE918]];
    uint64_t v9 = [v5 site];
    v10 = (void *)MEMORY[0x1E4FAE8F8];
  }
  [v8 setObject:v9 forKey:*v10];

  return v8;
}

- (id)_secureCandidateForPasswordCredential:(id)a3 fromLocalizedStringKey:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 user];
  uint64_t v9 = [v6 site];
  v10 = [v6 customTitle];
  if [v6 isExternal] && (objc_opt_respondsToSelector())
  {
    v11 = [(id)objc_opt_class() textSuggestionHeaderForExternalCredential:v6];
LABEL_6:
    v12 = v11;
    goto LABEL_7;
  }
  if (v10)
  {
    v11 = v10;
    goto LABEL_6;
  }
  v25 = [(TIAppAutofillManager *)self secureCandidateRenderer];
  uint64_t v26 = v25;
  if (v9)
  {
    v27 = [v25 localizedStringForKey:v7];

    id v36 = 0;
    v28 = [NSString stringWithValidatedFormat:v27, @"%@", &v36, v9 validFormatSpecifiers error];
    id v29 = v36;
    v30 = &stru_1F3F7A998;
    if (v28) {
      v30 = v28;
    }
    v12 = v30;

    if (v29)
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      v31 = TIOSLogFacility();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v34 = [NSString stringWithFormat:@"%s ERROR: invalid localized format for key %@: %@", "-[TIAppAutofillManager _secureCandidateForPasswordCredential:fromLocalizedStringKey:]", v7, v29];
        *(_DWORD *)buf = 138412290;
        v38 = v34;
        _os_log_debug_impl(&dword_1E3F0E000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  else
  {
    v12 = [v25 localizedStringForKey:@"SAFARI_KEYCHAIN"];
  }
LABEL_7:
  if (![v8 length])
  {
    v13 = [v6 creationDate];

    if (v13)
    {
      id v14 = [(TIAppAutofillManager *)self secureCandidateRenderer];
      v15 = [v14 localizedStringForKey:@"SAFARI_CREDENTIAL_DATE"];

      v16 = (void *)MEMORY[0x1E4F28C10];
      v17 = [v6 creationDate];
      uint64_t v18 = [v16 localizedStringFromDate:v17 dateStyle:1 timeStyle:0];

      id v35 = 0;
      v19 = [NSString stringWithValidatedFormat:v15, @"%@", &v35, v18 validFormatSpecifiers error];
      id v20 = v35;
      v21 = &stru_1F3F7A998;
      if (v19) {
        v21 = v19;
      }
      v33 = v21;

      if (v20)
      {
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        v22 = TIOSLogFacility();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v32 = [NSString stringWithFormat:@"%s ERROR: invalid localized format for key SAFARI_CREDENTIAL_DATE: %@", "-[TIAppAutofillManager _secureCandidateForPasswordCredential:fromLocalizedStringKey:]", v20];
          *(_DWORD *)buf = 138412290;
          v38 = v32;
          _os_log_debug_impl(&dword_1E3F0E000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }

      v8 = v33;
    }
  }
  id v23 = (void *)[objc_alloc(MEMORY[0x1E4FAE508]) initWithSecureHeader:v12 secureContent:v8 secureFormattedContent:v8 input:&stru_1F3F7A998 truncationSentinel:0];

  return v23;
}

- (void)oneTimeCodeProvider:(id)a3 didUpdateOneTimeCode:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4FAE900];
  v9[0] = MEMORY[0x1E4F1CC38];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v5 = +[TIKeyboardInputManagerLoader sharedLoader];
  id v6 = [v5 interactingConnection];

  if (v6)
  {
    id v7 = [v6 remoteObjectProxy];
    [v7 processPayloadInfo:v4];
  }
}

- (void)oneTimeCodeProviderReceivedCode:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4FAE900];
  v8[0] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v4 = +[TIKeyboardInputManagerLoader sharedLoader];
  id v5 = [v4 interactingConnection];

  if (v5)
  {
    id v6 = [v5 remoteObjectProxy];
    [v6 processPayloadInfo:v3];
  }
}

- (void)presentHideMyEmailUI:(id)a3 keyboardState:(id)a4 completion:(id)a5
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F080]);
  uint64_t v9 = [v6 altDSID];
  if (!v9) {
    goto LABEL_6;
  }
  v10 = (void *)v9;
  uint64_t v11 = [v6 applicationKey];
  if (!v11)
  {

    goto LABEL_6;
  }
  v12 = (void *)v11;
  v13 = [v6 applicationBundleId];

  if (!v13)
  {
LABEL_6:
    v7[2](v7, 0);
    goto LABEL_7;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F4F078]);
  v15 = [v6 applicationKey];
  v16 = [v6 altDSID];
  v17 = [v6 applicationBundleId];
  uint64_t v18 = (void *)[v14 initWithKey:v15 altDSID:v16 clientAppBundleId:v17];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__TIAppAutofillManager_presentHideMyEmailUI_keyboardState_completion___block_invoke;
  v19[3] = &unk_1E6E29560;
  id v20 = v7;
  [v8 fetchPrivateEmailWithContext:v18 completion:v19];

LABEL_7:
}

void __70__TIAppAutofillManager_presentHideMyEmailUI_keyboardState_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FAE318]);
    uint64_t v9 = [v5 privateEmailAddress];
    v10 = (void *)[v8 initWithCandidate:v9];

    [v10 setCustomInfoType:1024];
    id v15 = *(id *)(a1 + 32);
    id v11 = v10;
    TIDispatchAsync();

LABEL_7:
    goto LABEL_8;
  }
  if (v6)
  {
    v12 = TIAppAutofillOSLogFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [NSString stringWithFormat:@"%s HME: UI service returned error: %@", "-[TIAppAutofillManager presentHideMyEmailUI:keyboardState:completion:]_block_invoke", v7];
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_error_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    id v14 = *(id *)(a1 + 32);
    TIDispatchAsync();
    id v11 = v14;
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __70__TIAppAutofillManager_presentHideMyEmailUI_keyboardState_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __70__TIAppAutofillManager_presentHideMyEmailUI_keyboardState_completion___block_invoke_381(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)shouldAcceptOneTimeCode:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    if (v8)
    {
      [(TIAppAutofillManager *)self setLastAutofilledUsername:0];
      if ([v8 customInfoType] == 64) {
        [(SFAppAutoFillOneTimeCodeProvider *)self->_oneTimeCodeProvider consumeCurrentOneTimeCode];
      }
      [(SFAppAutoFillOneTimeCodeProvider *)self->_oneTimeCodeProvider removeObserverForOneTimeCode:self];
    }
  }
}

- (void)shouldAcceptAutofill:(id)a3 withPayload:(id)a4 completion:(id)a5
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    if (v8)
    {
      v79 = self;
      uint64_t v12 = [v8 customInfoType];
      if (v12 == 24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v13 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FAE938]];
        [(TIAppAutofillManager *)self setLastAutofilledUsername:v13];

        id v14 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FAE8F8]];
      }
      else
      {
        id v14 = 0;
      }
      uint64_t v15 = [v8 customInfoType];
      BOOL v16 = v15 == 264;
      if (v15 == 264 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v17 = v9;
        uint64_t v18 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FAE8F0]];
        if (v18)
        {
          v19 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v18 error:0];
        }
        else
        {
          v19 = 0;
        }

        id v9 = v17;
      }
      else
      {
        v19 = 0;
      }
      uint64_t v20 = [v8 customInfoType];
      uint64_t v21 = [v8 customInfoType];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __68__TIAppAutofillManager_shouldAcceptAutofill_withPayload_completion___block_invoke;
      aBlock[3] = &unk_1E6E29510;
      BOOL v92 = v12 == 24;
      aBlock[4] = self;
      id v22 = v14;
      id v88 = v22;
      BOOL v93 = v16;
      id v23 = v19;
      v24 = v23;
      BOOL v26 = v12 == 24 || v20 == 512;
      id v89 = v23;
      BOOL v94 = v21 == 2056;
      int v27 = v21 == 2056 || v26;
      id v77 = v9;
      id v90 = v77;
      id v91 = v11;
      v78 = _Block_copy(aBlock);
      if (![(TIAppAutofillManager *)self shouldAuthenticateToAcceptAutofill]
        || !v27)
      {
        v43 = v78;
        (*((void (**)(void *, uint64_t, void))v78 + 2))(v78, 1, 0);
LABEL_79:

        goto LABEL_80;
      }
      id v71 = v9;
      v72 = v24;
      id v73 = v22;
      v28 = [MEMORY[0x1E4F29268] currentConnection];
      v76 = +[TIXPCUtils obtainBundleIdentifierFromConnection:v28];

      uint64_t v95 = 0;
      v96 = &v95;
      uint64_t v97 = 0x2050000000;
      id v29 = (void *)getLAContextClass_softClass;
      uint64_t v98 = getLAContextClass_softClass;
      if (!getLAContextClass_softClass)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v102 = __getLAContextClass_block_invoke;
        v103 = &unk_1E6E2E248;
        v104 = &v95;
        __getLAContextClass_block_invoke((uint64_t)&buf);
        id v29 = (void *)v96[3];
      }
      v30 = v29;
      _Block_object_dispose(&v95, 8);
      id v31 = objc_alloc_init(v30);
      [(TIAppAutofillManager *)self setLaContext:v31];

      id v32 = [[TIKeyboardSecureCandidateRenderer alloc] initForLocalizedStrings];
      uint64_t v33 = deviceClassString();
      v75 = (void *)v33;
      if (v12 == 24)
      {
        uint64_t v34 = v33;
        id v35 = NSString;
        id v36 = [v32 localizedStringForKey:@"AUTOFILL_AUTH_PASSCODE_TITLE"];
        id v86 = 0;
        v37 = [v35 stringWithValidatedFormat:v36, @"%@", &v86, v34 validFormatSpecifiers error];
        id v38 = v86;
        uint64_t v39 = &stru_1F3F7A998;
        if (v37) {
          uint64_t v39 = v37;
        }
        v40 = v39;

        if (!v38)
        {
          v42 = @"AUTOFILL_AUTH_ALERT_TITLE";
          goto LABEL_61;
        }
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        v41 = TIOSLogFacility();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          v68 = [NSString stringWithFormat:@"%s ERROR: invalid localized format for key AUTOFILL_AUTH_PASSCODE_TITLE: %@", "-[TIAppAutofillManager shouldAcceptAutofill:withPayload:completion:]", v38];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v68;
          _os_log_debug_impl(&dword_1E3F0E000, v41, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
        }
        v42 = @"AUTOFILL_AUTH_ALERT_TITLE";
      }
      else if (v20 == 512)
      {
        v44 = NSString;
        v45 = [v32 localizedStringForKey:@"TOTP_AUTOFILL_AUTH_PASSCODE_TITLE"];
        id v85 = 0;
        v46 = [v44 stringWithValidatedFormat:v45, @"%@", &v85, v75 validFormatSpecifiers error];
        id v38 = v85;
        v47 = &stru_1F3F7A998;
        if (v46) {
          v47 = v46;
        }
        v40 = v47;

        if (!v38)
        {
          v42 = @"TOTP_AUTOFILL_AUTH_ALERT_TITLE";
          goto LABEL_61;
        }
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        v41 = TIOSLogFacility();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          v69 = [NSString stringWithFormat:@"%s ERROR: invalid localized format for key TOTP_AUTOFILL_AUTH_PASSCODE_TITLE: %@", "-[TIAppAutofillManager shouldAcceptAutofill:withPayload:completion:]", v38];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v69;
          _os_log_debug_impl(&dword_1E3F0E000, v41, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
        }
        v42 = @"TOTP_AUTOFILL_AUTH_ALERT_TITLE";
      }
      else
      {
        if (v21 != 2056)
        {
          v40 = 0;
          v52 = 0;
LABEL_62:
          v99[0] = &unk_1F3FA7A00;
          v99[1] = &unk_1F3FA7A18;
          v100[0] = v52;
          v100[1] = v40;
          uint64_t v53 = 2;
          uint64_t v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:2];
          if (_os_feature_enabled_impl())
          {
            uint64_t v95 = 0;
            v96 = &v95;
            uint64_t v97 = 0x2050000000;
            v54 = (void *)getLARatchetManagerClass_softClass;
            uint64_t v98 = getLARatchetManagerClass_softClass;
            if (!getLARatchetManagerClass_softClass)
            {
              *(void *)&long long buf = MEMORY[0x1E4F143A8];
              *((void *)&buf + 1) = 3221225472;
              v102 = __getLARatchetManagerClass_block_invoke;
              v103 = &unk_1E6E2E248;
              v104 = &v95;
              __getLARatchetManagerClass_block_invoke((uint64_t)&buf);
              v54 = (void *)v96[3];
            }
            id v55 = v54;
            _Block_object_dispose(&v95, 8);
            v56 = [v55 sharedInstance];
            if ([v56 isFeatureEnabled]) {
              uint64_t v53 = 1025;
            }
            else {
              uint64_t v53 = 2;
            }
          }
          v57 = v40;
          v58 = [(TIAppAutofillManager *)v79 laContext];
          id v83 = 0;
          int v59 = [v58 canEvaluatePolicy:v53 error:&v83];
          id v60 = v83;

          if (v59)
          {
            if ([v76 isEqualToString:@"com.apple.springboard"]
              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              (*((void (**)(void *, void, void))v78 + 2))(v78, 0, 0);
              int v61 = 1;
            }
            else
            {
              int v61 = 0;
            }
            id v9 = v71;
            v63 = [(TIAppAutofillManager *)v79 laContext];
            v80[0] = MEMORY[0x1E4F143A8];
            v80[1] = 3221225472;
            v80[2] = __68__TIAppAutofillManager_shouldAcceptAutofill_withPayload_completion___block_invoke_375;
            v80[3] = &unk_1E6E29538;
            v80[4] = v79;
            char v82 = v61;
            id v81 = v78;
            uint64_t v64 = v53;
            v62 = (void *)v74;
            [v63 evaluatePolicy:v64 options:v74 reply:v80];

            if (v61)
            {
              v65 = [TICredentialCustomInfo alloc];
              v66 = [(TIAppAutofillManager *)v79 documentIdentifierForLastAutofillGeneration];
              v67 = [(TICredentialCustomInfo *)v65 initWithCustomInfo:v77 documentIdentifier:v66];
              [(TIAppAutofillManager *)v79 setQueuedUnauthenticatedCustomInfo:v67];

              v62 = (void *)v74;
            }

            v24 = v72;
            v43 = v78;
          }
          else
          {
            [(TIAppAutofillManager *)v79 setLaContext:0];
            v43 = v78;
            (*((void (**)(void *, uint64_t, void))v78 + 2))(v78, 1, 0);
            id v9 = v71;
            v24 = v72;
            v62 = (void *)v74;
          }

          id v22 = v73;
          goto LABEL_79;
        }
        v48 = NSString;
        v49 = [v32 localizedStringForKey:@"PASSKEY_AUTOFILL_AUTH_PASSCODE_TITLE"];
        id v84 = 0;
        v50 = [v48 stringWithValidatedFormat:v49, @"%@", &v84, v75 validFormatSpecifiers error];
        id v38 = v84;
        v51 = &stru_1F3F7A998;
        if (v50) {
          v51 = v50;
        }
        v40 = v51;

        if (!v38)
        {
          v42 = @"PASSKEY_AUTOFILL_AUTH_ALERT_TITLE";
          goto LABEL_61;
        }
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        v41 = TIOSLogFacility();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          v70 = [NSString stringWithFormat:@"%s ERROR: invalid localized format for key PASSKEY_AUTOFILL_AUTH_PASSCODE_TITLE: %@", "-[TIAppAutofillManager shouldAcceptAutofill:withPayload:completion:]", v38];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v70;
          _os_log_debug_impl(&dword_1E3F0E000, v41, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
        }
        v42 = @"PASSKEY_AUTOFILL_AUTH_ALERT_TITLE";
      }

LABEL_61:
      v52 = [v32 localizedStringForKey:v42];

      goto LABEL_62;
    }
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
LABEL_80:
}

void __68__TIAppAutofillManager_shouldAcceptAutofill_withPayload_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!*(unsigned char *)(a1 + 72))
  {
    if (*(unsigned char *)(a1 + 73))
    {
      if (!*(void *)(a1 + 48)
        || ([*(id *)(a1 + 32) passkeyProvider],
            uint64_t v15 = objc_claimAutoreleasedReturnValue(),
            char v16 = objc_opt_respondsToSelector(),
            v15,
            (v16 & 1) == 0))
      {
LABEL_11:
        if (!a2) {
          goto LABEL_14;
        }
        goto LABEL_12;
      }
      id v17 = [*(id *)(a1 + 32) passkeyProvider];
      uint64_t v18 = *(void *)(a1 + 48);
      v19 = [*(id *)(a1 + 32) clientIdentifierForLastKeyboardSync];
      [v17 didFillExternalCredential:v18 inAppWithBundleIdentifier:v19];
    }
    else
    {
      uint64_t v20 = *(void *)(a1 + 32);
      id v17 = *(void **)(v20 + 88);
      *(void *)(v20 + 88) = 0;
    }

    goto LABEL_11;
  }
  if (!a2) {
    goto LABEL_14;
  }
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 88);
  *(void *)(v7 + 88) = v6;

  id v9 = [*(id *)(a1 + 32) passkeyProvider];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [*(id *)(a1 + 32) passkeyProvider];
    uint64_t v12 = [*(id *)(a1 + 32) lastAutofilledUsername];
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = [*(id *)(a1 + 32) clientIdentifierForLastKeyboardSync];
    [v11 didFillCredentialForUsername:v12 forHost:v13 inAppWithBundleIdentifier:v14];
  }
LABEL_12:
  if (*(unsigned char *)(a1 + 74))
  {
    uint64_t v21 = [*(id *)(a1 + 32) privateQueue];
    id v22 = *(id *)(a1 + 56);
    id v23 = v5;
    TIDispatchAsync();
  }
LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __68__TIAppAutofillManager_shouldAcceptAutofill_withPayload_completion___block_invoke_375(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) queuedUnauthenticatedCustomInfo];

  if (v4)
  {
    if (v3 && *(unsigned char *)(a1 + 48))
    {
      id v5 = [TICredentialCustomInfo alloc];
      uint64_t v6 = [*(id *)(a1 + 32) queuedUnauthenticatedCustomInfo];
      uint64_t v7 = [v6 customInfo];
      id v8 = [*(id *)(a1 + 32) queuedUnauthenticatedCustomInfo];
      id v9 = [v8 documentIdentifier];
      char v10 = [(TICredentialCustomInfo *)v5 initWithCustomInfo:v7 documentIdentifier:v9];
      [*(id *)(a1 + 32) setQueuedCustomInfo:v10];
    }
    [*(id *)(a1 + 32) setQueuedUnauthenticatedCustomInfo:0];
  }
  id v11 = [*(id *)(a1 + 32) laContext];
  if (!*(unsigned char *)(a1 + 48))
  {
    id v14 = *(id *)(a1 + 40);
    id v12 = v3;
    id v13 = v11;
    TIDispatchAsync();
  }
  [*(id *)(a1 + 32) setLaContext:0];
}

uint64_t __68__TIAppAutofillManager_shouldAcceptAutofill_withPayload_completion___block_invoke_2_376(void *a1)
{
  return (*(uint64_t (**)(void, BOOL, void))(a1[6] + 16))(a1[6], a1[4] != 0, a1[5]);
}

void __68__TIAppAutofillManager_shouldAcceptAutofill_withPayload_completion___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) passkeyProvider];
  v2 = [*(id *)(a1 + 40) objectForKey:*MEMORY[0x1E4FAE910]];
  [v3 userSelectedPasskey:v2 authenticatedLAContext:*(void *)(a1 + 48)];
}

- (BOOL)shouldAuthenticateToAcceptAutofill
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v2 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v19 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __getMCProfileConnectionClass_block_invoke;
    id v14 = &unk_1E6E2E248;
    uint64_t v15 = &v16;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v11);
    v2 = (void *)v17[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v16, 8);
  v4 = [v3 sharedConnection];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  id v5 = (void *)getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr;
  uint64_t v19 = getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr;
  if (!getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_block_invoke;
    id v14 = &unk_1E6E2E248;
    uint64_t v15 = &v16;
    uint64_t v6 = (void *)ManagedConfigurationLibrary();
    uint64_t v7 = dlsym(v6, "MCFeatureAuthenticationBeforeAutoFillRequired");
    *(void *)(v15[1] + 24) = v7;
    getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr = *(void *)(v15[1] + 24);
    id v5 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (v5)
  {
    BOOL v8 = [v4 effectiveBoolValueForSetting:*v5] == 1;

    return v8;
  }
  else
  {
    dlerror();
    uint64_t v10 = abort_report_np();
    return __getMCProfileConnectionClass_block_invoke(v10);
  }
}

- (void)generateHideMyEmailCandidateWithSlotID:(unsigned int)a3 applicationBundleId:(id)a4 applicationId:(id)a5 keyboardState:(id)a6 secureCandidateWidth:(double)a7 secureCandidateHash:(unint64_t)a8 completionHandler:(id)a9
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  v44 = (void (**)(id, void))a9;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy__74;
  v86[4] = __Block_byref_object_dispose__75;
  id v87 = 0;
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  uint64_t v18 = objc_opt_class();
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke;
  v83[3] = &unk_1E6E293A8;
  id v85 = v86;
  uint64_t v19 = v17;
  id v84 = v19;
  [v18 getApprovedSharedWebCredentialsEntriesForAppWithAppID:v16 completionHandler:v83];
  dispatch_time_t v20 = dispatch_time(0, 200000000);
  if (dispatch_semaphore_wait(v19, v20))
  {
    uint64_t v21 = TIAppAutofillOSLogFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s HME: Timeout on getApprovedSharedWebCredentialsEntriesForAppWithAppID:completionHandler:", "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]");
      uint64_t v39 = v38 = v16;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v39;
      _os_log_error_impl(&dword_1E3F0E000, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

      id v16 = v38;
    }

    v44[2](v44, 0);
  }
  else
  {
    v42 = [MEMORY[0x1E4F4EF40] sharedInstance];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v89 = 0x3032000000;
    id v90 = __Block_byref_object_copy__74;
    id v91 = __Block_byref_object_dispose__75;
    id v92 = objc_alloc_init(MEMORY[0x1E4F4F080]);
    v41 = [v42 primaryAuthKitAccount];
    v81[0] = 0;
    v81[1] = v81;
    v81[2] = 0x3032000000;
    v81[3] = __Block_byref_object_copy__74;
    v81[4] = __Block_byref_object_dispose__75;
    id v82 = [v42 altDSIDForAccount:v41];
    objc_initWeak(&location, self);
    v78[0] = 0;
    v78[1] = v78;
    v78[2] = 0x2810000000;
    v78[3] = "";
    char v79 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_297;
    aBlock[3] = &unk_1E6E29420;
    id v22 = v15;
    id v23 = v15;
    id v69 = v23;
    id v43 = v16;
    id v24 = v16;
    id v70 = v24;
    id v71 = self;
    unint64_t v25 = a8;
    unsigned int v26 = a3;
    unsigned int v77 = a3;
    double v75 = a7;
    unint64_t v76 = v25;
    id v73 = v81;
    uint64_t v74 = v78;
    int v27 = v44;
    id v72 = v27;
    v28 = _Block_copy(aBlock);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_302;
    v58[3] = &unk_1E6E29470;
    id v59 = v24;
    uint64_t v64 = v81;
    id v29 = v23;
    id v60 = v29;
    int v61 = self;
    unsigned int v67 = v26;
    p_long long buf = &buf;
    v66 = v78;
    v30 = v27;
    id v62 = v30;
    id v63 = v28;
    id v40 = v28;
    id v31 = _Block_copy(v58);
    id v32 = (void *)MEMORY[0x1E4F59BB8];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_307;
    v48[3] = &unk_1E6E294E8;
    v52 = v78;
    uint64_t v33 = v30;
    id v50 = v33;
    uint64_t v53 = v86;
    v54 = v81;
    id v34 = v29;
    id v16 = v43;
    id v49 = v34;
    id v55 = &buf;
    objc_copyWeak(&v56, &location);
    unsigned int v57 = v26;
    id v51 = v31;
    id v35 = v31;
    [v32 requestFeatureWithId:@"mail.hide-my-email.create" completion:v48];
    dispatch_time_t v36 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_333;
    block[3] = &unk_1E6E2BDC0;
    v47 = v78;
    v37 = v33;
    id v15 = v22;
    id v46 = v37;
    dispatch_after(v36, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v56);
    _Block_object_dispose(v78, 8);
    objc_destroyWeak(&location);
    _Block_object_dispose(v81, 8);

    _Block_object_dispose(&buf, 8);
  }

  _Block_object_dispose(v86, 8);
}

intptr_t __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  uint64_t v5 = [[v3 alloc] initWithArray:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  BOOL v8 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v8);
}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_297(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F98250];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_2;
  v10[3] = &unk_1E6E293F8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v11 = v4;
  uint64_t v12 = v5;
  int v18 = *(_DWORD *)(a1 + 96);
  id v6 = *(id *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 80);
  uint64_t v17 = *(void *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 72);
  id v13 = v6;
  uint64_t v15 = v7;
  long long v9 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v9;
  long long v14 = v9;
  [v2 bestDomainForAppID:v3 completionHandler:v10];
}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_302(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4F078]) initWithKey:*(void *)(a1 + 32) altDSID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) clientAppBundleId:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_2_304;
  v7[3] = &unk_1E6E29448;
  v7[4] = *(void *)(a1 + 48);
  int v14 = *(_DWORD *)(a1 + 96);
  id v8 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 72);
  id v9 = v4;
  uint64_t v6 = *(void *)(a1 + 88);
  uint64_t v12 = v5;
  uint64_t v13 = v6;
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  [v3 lookupPrivateEmailWithContext:v2 completion:v7];
}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_307(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = TIAppAutofillOSLogFacility();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    id v8 = [NSString stringWithFormat:@"%s HME: %@ on requestFeatureWithId:completion: HideMyEmail", "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]_block_invoke", v6];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
LABEL_20:
    _os_log_error_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

LABEL_11:
    if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 32), 1u) & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    goto LABEL_13;
  }
  if ([v5 status] == 2 || objc_msgSend(v5, "status") == 3 || objc_msgSend(v5, "status") == 4)
  {
    unint64_t v9 = [v5 status] - 2;
    if (v9 > 2) {
      id v10 = 0;
    }
    else {
      id v10 = off_1E6E295E0[v9];
    }
    uint64_t v7 = TIAppAutofillOSLogFacility();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    id v8 = [NSString stringWithFormat:@"%s HME: feature is %@ for user", "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]_block_invoke", v10];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    goto LABEL_20;
  }
  if (![v5 status] || objc_msgSend(v5, "status") == 1)
  {
    uint64_t v11 = [v5 status];
    uint64_t v12 = TIAppAutofillOSLogFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v18 = @"available and unlimited";
      if (v11 != 1) {
        int v18 = 0;
      }
      if (!v11) {
        int v18 = @"available";
      }
      uint64_t v19 = [NSString stringWithFormat:@"%s HME: feature is %@ for user", "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]_block_invoke", v18];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_debug_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
    {
      uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_329;
      v20[3] = &unk_1E6E294C0;
      uint64_t v24 = *(void *)(a1 + 72);
      id v14 = *(id *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 80);
      id v21 = v14;
      uint64_t v25 = v15;
      p_long long buf = &buf;
      objc_copyWeak(&v29, (id *)(a1 + 88));
      int v30 = *(_DWORD *)(a1 + 96);
      uint64_t v27 = *(void *)(a1 + 56);
      id v16 = *(id *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 64);
      id v22 = v16;
      uint64_t v28 = v17;
      id v23 = *(id *)(a1 + 48);
      [v13 enumerateObjectsUsingBlock:v20];

      objc_destroyWeak(&v29);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    _Block_object_dispose(&buf, 8);
  }
LABEL_13:
}

uint64_t __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_333(uint64_t result)
{
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(result + 40) + 8) + 32), 1u) & 1) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_329(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = objc_alloc(MEMORY[0x1E4F4F078]);
  unint64_t v9 = [v7 domain];
  id v10 = (void *)[v8 initWithKey:v9 altDSID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) clientAppBundleId:*(void *)(a1 + 32)];

  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_2_330;
  v18[3] = &unk_1E6E29498;
  uint64_t v23 = *(void *)(a1 + 72);
  v27[1] = a4;
  objc_copyWeak(v27, (id *)(a1 + 96));
  int v28 = *(_DWORD *)(a1 + 104);
  id v19 = v7;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 56);
  id v20 = v12;
  uint64_t v14 = *(void *)(a1 + 80);
  uint64_t v24 = v13;
  uint64_t v25 = v14;
  id v15 = *(id *)(a1 + 40);
  v27[2] = a3;
  uint64_t v16 = *(void *)(a1 + 88);
  id v21 = v15;
  uint64_t v26 = v16;
  id v22 = *(id *)(a1 + 48);
  id v17 = v7;
  [v11 lookupPrivateEmailWithContext:v10 completion:v18];

  objc_destroyWeak(v27);
}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_2_330(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 privateEmailAddress];

  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    **(unsigned char **)(a1 + 104) = 1;
    id v4 = (void *)MEMORY[0x1E4FAE318];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
    id v6 = [WeakRetained secureCandidateRenderer];
    id v7 = [v6 localizedStringForKey:@"SAFARI_HIDE_MY_EMAIL_SUGGESTION"];
    uint64_t v8 = *(unsigned int *)(a1 + 120);
    unint64_t v9 = [*(id *)(a1 + 32) domain];
    id v10 = [v4 secureCandidateForInput:v7 slotID:v8 customInfoType:1024 applicationKey:v9 applicationBundleId:*(void *)(a1 + 40) altDSID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

    if (atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 80) + 8) + 32), 1u))
    {
      uint64_t v13 = TIAppAutofillOSLogFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s Timeout before handler completed", "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]_block_invoke_2");
        *(_DWORD *)long long buf = 138412290;
        uint64_t v16 = v14;
        _os_log_error_impl(&dword_1E3F0E000, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 112);
    if (v11 == [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count] - 1
      && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      v12();
    }
  }
}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_2_304(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 privateEmailAddress];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4FAE318];
    id v5 = [*(id *)(a1 + 32) secureCandidateRenderer];
    id v6 = [v5 localizedStringForKey:@"SAFARI_HIDE_MY_EMAIL_SUGGESTION"];
    id v7 = [v4 secureCandidateForInput:v6 slotID:*(unsigned int *)(a1 + 88) customInfoType:1024 applicationKey:*(void *)(a1 + 40) applicationBundleId:*(void *)(a1 + 48) altDSID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

    if (atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 80) + 8) + 32), 1u))
    {
      unint64_t v9 = TIAppAutofillOSLogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s Timeout before handler completed", "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]_block_invoke_2");
        *(_DWORD *)long long buf = 138412290;
        id v12 = v10;
        _os_log_error_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v8();
  }
}

void __170__TIAppAutofillManager_generateHideMyEmailCandidateWithSlotID_applicationBundleId_applicationId_keyboardState_secureCandidateWidth_secureCandidateHash_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!v3) {
    id v4 = *(void **)(a1 + 32);
  }
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1E4FAE318];
  id v7 = [*(id *)(a1 + 40) secureCandidateRenderer];
  uint64_t v8 = [v7 localizedStringForKey:@"SAFARI_HIDE_MY_EMAIL_SUGGESTION"];
  unint64_t v9 = [v6 secureCandidateForInput:v8 slotID:*(unsigned int *)(a1 + 96) customInfoType:1024 applicationKey:v5 applicationBundleId:*(void *)(a1 + 48) altDSID:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  [v9 setSecureCandidateWidth:*(double *)(a1 + 80)];
  [v9 setSecureCandidateHash:*(void *)(a1 + 88)];
  if (atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 72) + 8) + 32), 1u))
  {
    id v10 = TIAppAutofillOSLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s Timeout before handler completed", "-[TIAppAutofillManager generateHideMyEmailCandidateWithSlotID:applicationBundleId:applicationId:keyboardState:secureCandidateWidth:secureCandidateHash:completionHandler:]_block_invoke_2");
      *(_DWORD *)long long buf = 138412290;
      uint64_t v13 = v11;
      _os_log_error_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)generateJustHMEAutofillFormSuggestionWithRenderTraits:(id)a3 withKeyboardState:(id)a4 applicationID:(id)a5 applicationBundleID:(id)a6 completionHandler:(id)a7
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  [(TIAppAutofillManager *)self setDocumentIdentifierForLastAutofillGeneration:0];
  [(TIAppAutofillManager *)self setClientIdentifierForLastAutofillGeneration:0];
  if (v12)
  {
    id v66 = v12;
    uint64_t v17 = [(TIAppAutofillManager *)self secureCandidateRenderer];

    int v18 = (id *)MEMORY[0x1E4FAE9A8];
    id v63 = v13;
    if (v17)
    {
      id v19 = [(TIAppAutofillManager *)self secureCandidateRenderer];
      id v20 = [v19 localizedStringForKey:@"SAFARI_HIDE_MY_EMAIL_SUGGESTION"];

      if (v20 && [v20 length])
      {
LABEL_15:
        [v66 setHideMyEmailLocalizedText:v20];
        uint64_t v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
        uint64_t v64 = (void *)[objc_alloc(MEMORY[0x1E4FAE508]) initWithSecureHeader:&stru_1F3F7A998 secureContent:v20 secureFormattedContent:v20 input:&stru_1F3F7A998 truncationSentinel:0];
        objc_msgSend(v25, "addObject:");
        uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v25, "count"));
        uint64_t v27 = [(TIAppAutofillManager *)self secureCandidateRenderer];
        v65 = (void *)v26;
        int v28 = [v27 slotIDsFromSecureCandidates:v25 withRenderTraits:v66 outWidths:v26];

        if (v28)
        {
          id v61 = v15;
          id v62 = (void (**)(void, void))v16;
          id v13 = v63;
          id v59 = v12;
          id v60 = v28;
          id v29 = [v28 objectAtIndex:0];
          uint64_t v30 = [v29 unsignedIntegerValue];

          id v31 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v32 = v31;
          if (v20) {
            char v33 = v20;
          }
          else {
            char v33 = (void *)*MEMORY[0x1E4FAE9A8];
          }
          [v31 setObject:v33 forKey:*MEMORY[0x1E4FAE930]];
          uint64_t v34 = [(TIAppAutofillManager *)self secureCandidateRenderer];
          id v35 = [v34 secureCandidateCache];
          dispatch_time_t v36 = [NSNumber numberWithUnsignedInt:v30];
          [v35 setObject:v32 forKey:v36];

          v37 = +[TIKeyboardSecureTouchManager sharedInstance];
          [v37 registerSlotID:v30];

          int v38 = _os_feature_enabled_impl();
          if (v14 && v61 && v38)
          {
            uint64_t v39 = [v65 firstObject];
            [v39 floatValue];
            double v41 = v40;
            v42 = [v25 firstObject];
            uint64_t v58 = [v42 candidateHash];
            v67[0] = MEMORY[0x1E4F143A8];
            v67[1] = 3221225472;
            v67[2] = __148__TIAppAutofillManager_generateJustHMEAutofillFormSuggestionWithRenderTraits_withKeyboardState_applicationID_applicationBundleID_completionHandler___block_invoke;
            v67[3] = &unk_1E6E293D0;
            v67[4] = self;
            id v68 = v63;
            id v69 = v62;
            uint64_t v43 = v30;
            id v15 = v61;
            [(TIAppAutofillManager *)self generateHideMyEmailCandidateWithSlotID:v43 applicationBundleId:v61 applicationId:v14 keyboardState:v68 secureCandidateWidth:v58 secureCandidateHash:v67 completionHandler:v41];

            id v12 = v59;
          }
          else
          {
            v45 = [v63 documentIdentifier];
            [(TIAppAutofillManager *)self setDocumentIdentifierForLastAutofillGeneration:v45];

            id v46 = [v63 clientIdentifier];
            [(TIAppAutofillManager *)self setClientIdentifierForLastAutofillGeneration:v46];

            v62[2](v62, 0);
            id v12 = v59;
            id v15 = v61;
          }

          id v16 = v62;
          int v28 = v60;
        }
        else
        {
          v44 = TIAppAutofillOSLogFacility();
          id v13 = v63;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(NSString, "stringWithFormat:", @"%s slotIDs are nil", "-[TIAppAutofillManager generateJustHMEAutofillFormSuggestionWithRenderTraits:withKeyboardState:applicationID:applicationBundleID:completionHandler:]");
            v57 = id v56 = v16;
            *(_DWORD *)long long buf = 138412290;
            id v71 = v57;
            _os_log_error_impl(&dword_1E3F0E000, v44, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            id v16 = v56;
          }

          (*((void (**)(id, void))v16 + 2))(v16, 0);
        }

        goto LABEL_29;
      }
    }
    else
    {
      id v22 = TIAppAutofillOSLogFacility();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%s self.secureCandidateRenderer is nil", "-[TIAppAutofillManager generateJustHMEAutofillFormSuggestionWithRenderTraits:withKeyboardState:applicationID:applicationBundleID:completionHandler:]");
        id v53 = v16;
        id v55 = v54 = v15;
        *(_DWORD *)long long buf = 138412290;
        id v71 = v55;
        _os_log_debug_impl(&dword_1E3F0E000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        id v15 = v54;
        id v16 = v53;
      }

      id v20 = 0;
    }
    uint64_t v23 = TIAppAutofillOSLogFacility();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%s Localized Hide My Email text is nil", "-[TIAppAutofillManager generateJustHMEAutofillFormSuggestionWithRenderTraits:withKeyboardState:applicationID:applicationBundleID:completionHandler:]");
      id v47 = v16;
      id v49 = v48 = v15;
      *(_DWORD *)long long buf = 138412290;
      id v71 = v49;
      _os_log_debug_impl(&dword_1E3F0E000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      id v15 = v48;
      id v16 = v47;
    }

    id v24 = *v18;
    id v20 = v24;
    goto LABEL_15;
  }
  id v21 = TIAppAutofillOSLogFacility();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s secureCandidateRenderTraits is nil", "-[TIAppAutofillManager generateJustHMEAutofillFormSuggestionWithRenderTraits:withKeyboardState:applicationID:applicationBundleID:completionHandler:]");
    id v50 = v16;
    v52 = id v51 = v15;
    *(_DWORD *)long long buf = 138412290;
    id v71 = v52;
    _os_log_error_impl(&dword_1E3F0E000, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    id v15 = v51;
    id v16 = v50;
  }

  (*((void (**)(id, void))v16 + 2))(v16, 0);
LABEL_29:
}

void __148__TIAppAutofillManager_generateJustHMEAutofillFormSuggestionWithRenderTraits_withKeyboardState_applicationID_applicationBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v6 = a2;
  id v4 = [v3 documentIdentifier];
  [*(id *)(a1 + 32) setDocumentIdentifierForLastAutofillGeneration:v4];

  id v5 = [*(id *)(a1 + 40) clientIdentifier];
  [*(id *)(a1 + 32) setClientIdentifierForLastAutofillGeneration:v5];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)generateAutofillFormSuggestedUsernameWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completionHandler:(id)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(TIAppAutofillManager *)self setDocumentIdentifierForLastAutofillGeneration:0];
  id v83 = self;
  [(TIAppAutofillManager *)self setClientIdentifierForLastAutofillGeneration:0];
  uint64_t v92 = 0;
  uint64_t v93 = &v92;
  uint64_t v94 = 0x3032000000;
  uint64_t v95 = __Block_byref_object_copy__74;
  v96 = __Block_byref_object_dispose__75;
  id v97 = [MEMORY[0x1E4F1CA48] array];
  if ([MEMORY[0x1E4F98250] isAppAutoFillAvailable])
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    id v12 = [v9 textInputTraits];
    BOOL v13 = [v12 keyboardType] == 7;

    id v14 = [MEMORY[0x1E4F98260] sharedProvider];
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __114__TIAppAutofillManager_generateAutofillFormSuggestedUsernameWithRenderTraits_withKeyboardState_completionHandler___block_invoke;
    v89[3] = &unk_1E6E293A8;
    dispatch_semaphore_t v90 = v11;
    id v91 = &v92;
    id v15 = v11;
    [v14 suggestedUsersOfType:v13 completionHandler:v89];

    dispatch_time_t v16 = dispatch_time(0, 200000000);
    dispatch_semaphore_wait(v15, v16);
  }
  if (_os_feature_enabled_impl() && [v9 autofillSubMode] == 7)
  {
    uint64_t v17 = [(TIAppAutofillManager *)v83 secureCandidateRenderer];

    if (v17)
    {
      int v18 = [(TIAppAutofillManager *)v83 secureCandidateRenderer];
      id v19 = [v18 localizedStringForKey:@"SAFARI_HIDE_MY_EMAIL_SUGGESTION"];

      if (v19 && [v19 length])
      {
LABEL_15:
        [v8 setHideMyEmailLocalizedText:v19];
        [(id)v93[5] insertObject:v19 atIndex:0];

        goto LABEL_16;
      }
    }
    else
    {
      id v20 = TIAppAutofillOSLogFacility();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v74 = objc_msgSend(NSString, "stringWithFormat:", @"%s self.secureCandidateRenderer is nil", "-[TIAppAutofillManager generateAutofillFormSuggestedUsernameWithRenderTraits:withKeyboardState:completionHandler:]");
        *(_DWORD *)long long buf = 138412290;
        v99 = v74;
        _os_log_debug_impl(&dword_1E3F0E000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      id v19 = 0;
    }
    id v21 = TIAppAutofillOSLogFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v73 = objc_msgSend(NSString, "stringWithFormat:", @"%s Localized Hide My Email text is nil", "-[TIAppAutofillManager generateAutofillFormSuggestedUsernameWithRenderTraits:withKeyboardState:completionHandler:]");
      *(_DWORD *)long long buf = 138412290;
      v99 = v73;
      _os_log_debug_impl(&dword_1E3F0E000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    id v22 = (id)*MEMORY[0x1E4FAE9A8];

    id v19 = v22;
    goto LABEL_15;
  }
LABEL_16:
  unint64_t v23 = [(id)v93[5] count];
  double v75 = (void (**)(void, void))v10;
  unint64_t v76 = v8;
  if (v23 >= [v8 maxCellCount]) {
    uint64_t v24 = [v8 maxCellCount];
  }
  else {
    uint64_t v24 = [(id)v93[5] count];
  }
  unint64_t v25 = v24;
  id v84 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v24];
  uint64_t v81 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v25];
  v78 = v9;
  uint64_t v26 = v83;
  if (v25)
  {
    uint64_t v27 = [(id)v93[5] objectAtIndex:0];
    int v28 = [v27 containsString:@"@"];

    if (v28)
    {
      uint64_t v29 = 1;
      while (v25 != v29)
      {
        uint64_t v30 = [(id)v93[5] objectAtIndex:v29];
        char v31 = [v30 containsString:@"@"];

        ++v29;
        if ((v31 & 1) == 0)
        {
          unint64_t v32 = v29 - 1;
          goto LABEL_27;
        }
      }
      unint64_t v32 = v25;
LABEL_27:
      id v9 = v78;
      BOOL v33 = v32 < v25;
    }
    else
    {
      BOOL v33 = 1;
    }
    for (uint64_t i = 0; i != v25; ++i)
    {
      id v35 = [(id)v93[5] objectAtIndex:i];
      dispatch_time_t v36 = &stru_1F3F7A998;
      if (v33)
      {
        v37 = [(TIAppAutofillManager *)v26 secureCandidateRenderer];
        dispatch_time_t v36 = [v37 localizedStringForKey:@"SAFARI_CREDENTIAL_SUGGESTED_USERNAME"];
      }
      if (_os_feature_enabled_impl() && [v9 autofillSubMode] == 7)
      {
        int v38 = [(TIAppAutofillManager *)v26 secureCandidateRenderer];
        uint64_t v39 = [v38 localizedStringForKey:@"SAFARI_HIDE_MY_EMAIL_SUGGESTION"];
        int v40 = [v35 isEqualToString:v39];

        if (v40)
        {

          dispatch_time_t v36 = &stru_1F3F7A998;
        }
        id v9 = v78;
        uint64_t v26 = v83;
      }
      double v41 = (void *)[objc_alloc(MEMORY[0x1E4FAE508]) initWithSecureHeader:v36 secureContent:v35 secureFormattedContent:v35 input:&stru_1F3F7A998 truncationSentinel:0];
      [v84 addObject:v41];
    }
  }
  v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v84, "count"));
  uint64_t v43 = [(TIAppAutofillManager *)v26 secureCandidateRenderer];
  v44 = [v43 slotIDsFromSecureCandidates:v84 withRenderTraits:v76 outWidths:v42];

  v80 = v42;
  id v82 = v44;
  if ([v44 count])
  {
    unint64_t v45 = 0;
    uint64_t v77 = 0;
    uint64_t v46 = 0;
    uint64_t v79 = *MEMORY[0x1E4FAE930];
    double v47 = 0.0;
    id v48 = (void *)v81;
    do
    {
      id v49 = [(id)v93[5] objectAtIndex:v45];
      id v50 = [v44 objectAtIndex:v45];
      uint64_t v51 = [v50 unsignedIntegerValue];

      if (_os_feature_enabled_impl()
        && [v78 autofillSubMode] == 7
        && ([(TIAppAutofillManager *)v83 secureCandidateRenderer],
            v52 = objc_claimAutoreleasedReturnValue(),
            [v52 localizedStringForKey:@"SAFARI_HIDE_MY_EMAIL_SUGGESTION"],
            id v53 = objc_claimAutoreleasedReturnValue(),
            int v54 = [v49 isEqualToString:v53],
            v53,
            v52,
            v54))
      {
        double v47 = 0.0;
        if ([v42 count] > v45)
        {
          id v55 = [v42 objectAtIndexedSubscript:v45];
          [v55 floatValue];
          double v47 = v56;
        }
        unsigned int v57 = [v84 objectAtIndexedSubscript:v45];
        uint64_t v77 = [v57 candidateHash];
      }
      else
      {
        unsigned int v57 = [MEMORY[0x1E4FAE318] secureCandidateForInput:&stru_1F3F7A998 slotID:v51 customInfoType:128 applicationKey:&stru_1F3F7A998 applicationBundleId:&stru_1F3F7A998 altDSID:&stru_1F3F7A998];
        if ([v42 count] <= v45)
        {
          [v57 setSecureCandidateWidth:0.0];
        }
        else
        {
          uint64_t v58 = [v42 objectAtIndexedSubscript:v45];
          [v58 floatValue];
          [v57 setSecureCandidateWidth:v59];
        }
        id v60 = [v84 objectAtIndexedSubscript:v45];
        objc_msgSend(v57, "setSecureCandidateHash:", objc_msgSend(v60, "candidateHash"));

        [v48 addObject:v57];
        id v61 = [MEMORY[0x1E4F1CA60] dictionary];
        [v61 setObject:v49 forKey:v79];
        id v62 = [(TIAppAutofillManager *)v83 secureCandidateRenderer];
        id v63 = [v62 secureCandidateCache];
        uint64_t v64 = [NSNumber numberWithUnsignedInt:v51];
        [v63 setObject:v61 forKey:v64];

        id v48 = (void *)v81;
        v65 = +[TIKeyboardSecureTouchManager sharedInstance];
        [v65 registerSlotID:v51];

        uint64_t v51 = v46;
        v42 = v80;
      }
      v44 = v82;

      ++v45;
      uint64_t v46 = v51;
    }
    while (v45 < [v82 count]);
  }
  else
  {
    uint64_t v51 = 0;
    uint64_t v77 = 0;
    double v47 = 0.0;
    id v48 = (void *)v81;
  }
  if ((_os_feature_enabled_impl() & 1) == 0 || [v78 autofillSubMode] != 7 || !v51) {
    goto LABEL_63;
  }
  id v66 = [MEMORY[0x1E4F29268] currentConnection];
  unsigned int v67 = [v78 autofillContext];
  id v68 = [v67 objectForKey:*MEMORY[0x1E4FAE9D8]];

  if (!v68)
  {
    id v68 = +[TIXPCUtils obtainApplicationIdentifierFromConnection:v66];
  }
  id v69 = [v78 autofillContext];
  id v70 = [v69 objectForKey:*MEMORY[0x1E4FAE9E8]];

  if (!v70)
  {
    id v70 = +[TIXPCUtils obtainBundleIdentifierFromConnection:v66];
  }
  if (!v70 || !v68)
  {

LABEL_63:
    id v71 = [v78 documentIdentifier];
    [(TIAppAutofillManager *)v83 setDocumentIdentifierForLastAutofillGeneration:v71];

    uint64_t v72 = [v78 clientIdentifier];
    [(TIAppAutofillManager *)v83 setClientIdentifierForLastAutofillGeneration:v72];

    ((void (**)(void, void *))v75)[2](v75, v48);
    goto LABEL_64;
  }
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __114__TIAppAutofillManager_generateAutofillFormSuggestedUsernameWithRenderTraits_withKeyboardState_completionHandler___block_invoke_283;
  v85[3] = &unk_1E6E298F0;
  v85[4] = v83;
  id v86 = v78;
  id v87 = v48;
  id v88 = v75;
  [(TIAppAutofillManager *)v83 generateHideMyEmailCandidateWithSlotID:v51 applicationBundleId:v70 applicationId:v68 keyboardState:v86 secureCandidateWidth:v77 secureCandidateHash:v85 completionHandler:v47];

LABEL_64:
  _Block_object_dispose(&v92, 8);
}

void __114__TIAppAutofillManager_generateAutofillFormSuggestedUsernameWithRenderTraits_withKeyboardState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) value];
        [v8 addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __114__TIAppAutofillManager_generateAutofillFormSuggestedUsernameWithRenderTraits_withKeyboardState_completionHandler___block_invoke_283(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 40) documentIdentifier];
  [*(id *)(a1 + 32) setDocumentIdentifierForLastAutofillGeneration:v3];

  uint64_t v4 = [*(id *)(a1 + 40) clientIdentifier];
  [*(id *)(a1 + 32) setClientIdentifierForLastAutofillGeneration:v4];

  if (v5) {
    [*(id *)(a1 + 48) addObject:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)generateCellularCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 textInputTraits];
  id v9 = [v8 textContentType];
  uint64_t v10 = *MEMORY[0x1E4FAEE90];
  if ([v9 isEqualToString:*MEMORY[0x1E4FAEE90]])
  {

    goto LABEL_4;
  }
  long long v11 = [v7 textInputTraits];
  long long v12 = [v11 textContentType];
  char v13 = [v12 isEqualToString:*MEMORY[0x1E4FAEE98]];

  if (v13)
  {
LABEL_4:
    uint64_t v14 = deviceClassString();
    uint64_t v15 = [v7 textInputTraits];
    dispatch_time_t v16 = [v15 textContentType];
    int v17 = [v16 isEqualToString:v10];

    int v18 = NSString;
    v80 = (void *)v14;
    if (v17)
    {
      id v19 = [(TIAppAutofillManager *)self localizedCellularAutofillStringForKey:@"AUTOFILL_CELLULAR_EID_TITLE" defaultValue:*MEMORY[0x1E4FAE998]];
      uint64_t v88 = 0;
      id v20 = (id *)&v88;
      [v18 stringWithValidatedFormat:v19, @"%@", &v88, v14 validFormatSpecifiers error];
    }
    else
    {
      id v19 = [(TIAppAutofillManager *)self localizedCellularAutofillStringForKey:@"AUTOFILL_CELLULAR_IMEI_TITLE" defaultValue:*MEMORY[0x1E4FAE9A0]];
      uint64_t v87 = 0;
      id v20 = (id *)&v87;
      [v18 stringWithValidatedFormat:v19, @"%@", &v87, v14 validFormatSpecifiers error];
    }
    id v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v79 = *v20;
    id v22 = &stru_1F3F7A998;
    if (v21) {
      id v22 = v21;
    }
    id v82 = v22;

    id v83 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    unint64_t v23 = [(TIAppAutofillManager *)self coreTelephonyMockObject];

    uint64_t v24 = [v7 textInputTraits];
    unint64_t v25 = [v24 textContentType];
    int v26 = [v25 isEqualToString:v10];
    id v84 = v7;
    if (v23)
    {
      uint64_t v27 = v26 ^ 1u;

      int v28 = [(TIAppAutofillManager *)self coreTelephonyMockObject];
      id v29 = [v28 retrieveDeviceIdentifier:v27];
LABEL_11:

      [v6 setShouldForceDoubleLineCandidateForCellularAutofill:1];
      uint64_t v30 = (objc_class *)MEMORY[0x1E4FAE508];
      id v29 = v29;
      uint64_t v77 = [[v30 alloc] initWithSecureHeader:v82 secureContent:v29 secureFormattedContent:v29 input:v29 truncationSentinel:0];
      objc_msgSend(v83, "addObject:");
      char v31 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v83, "count"));
      unint64_t v32 = [(TIAppAutofillManager *)self secureCandidateRenderer];
      id v76 = v6;
      BOOL v33 = [v32 slotIDsFromSecureCandidates:v83 withRenderTraits:v6 outWidths:v31];

      uint64_t v34 = [v33 firstObject];
      uint64_t v35 = [v34 unsignedIntegerValue];

      dispatch_time_t v36 = [v84 textInputTraits];
      v37 = [v36 textContentType];
      if ([v37 isEqualToString:v10]) {
        uint64_t v38 = 0x2000;
      }
      else {
        uint64_t v38 = 0x4000;
      }

      uint64_t v39 = [v84 textInputTraits];
      int v40 = [v39 textContentType];
      int v41 = [v40 isEqualToString:v10];
      v42 = (id *)MEMORY[0x1E4FAE8E0];
      if (!v41) {
        v42 = (id *)MEMORY[0x1E4FAE8E8];
      }
      id v43 = *v42;

      v44 = [MEMORY[0x1E4FAE318] secureCandidateForInput:v29 slotID:v35 customInfoType:v38];
      uint64_t v81 = v31;
      unint64_t v45 = [v31 firstObject];
      [v45 floatValue];
      [v44 setSecureCandidateWidth:v46];

      double v47 = [v83 firstObject];
      objc_msgSend(v44, "setSecureCandidateHash:", objc_msgSend(v47, "candidateHash"));

      id v48 = [MEMORY[0x1E4F1CA60] dictionary];
      [v48 setObject:v29 forKeyedSubscript:v43];

      id v49 = [(TIAppAutofillManager *)self secureCandidateRenderer];
      id v50 = [v49 secureCandidateCache];
      uint64_t v51 = [NSNumber numberWithUnsignedInt:v35];
      [v50 setObject:v48 forKey:v51];

      v52 = +[TIKeyboardSecureTouchManager sharedInstance];
      [v52 registerSlotID:v35];

      if (v44)
      {
        uint64_t v93 = v44;
        id v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
      }
      else
      {
        id v53 = 0;
      }
      id v66 = v79;
      v65 = v80;

      id v6 = v76;
      id v55 = (void *)v77;
LABEL_36:
      uint64_t v64 = v82;
      id v7 = v84;
LABEL_37:

      goto LABEL_38;
    }
    if (v26) {
      uint64_t v54 = 1;
    }
    else {
      uint64_t v54 = 2;
    }

    id v55 = [MEMORY[0x1E4F29268] currentConnection];
    if (![(TIAppAutofillManager *)self hasCoreTelephonyEntitlementForConnection:v55])
    {
      unsigned int v67 = TIAppAutofillOSLogFacility();
      uint64_t v81 = v67;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        id v73 = objc_msgSend(NSString, "stringWithFormat:", @"%s The application does not have the required entitlement.", "-[TIAppAutofillManager generateCellularCandidatesWithRenderTraits:withKeyboardState:]");
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v73;
        _os_log_error_impl(&dword_1E3F0E000, v67, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
      }
      id v29 = 0;
      id v53 = (void *)MEMORY[0x1E4F1CBF0];
      id v66 = v79;
      v65 = v80;
      goto LABEL_36;
    }
    v78 = v55;
    uint64_t v89 = 0;
    dispatch_semaphore_t v90 = &v89;
    uint64_t v91 = 0x2050000000;
    float v56 = (void *)getCoreTelephonyClientClass_softClass;
    uint64_t v92 = getCoreTelephonyClientClass_softClass;
    if (!getCoreTelephonyClientClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v95 = __getCoreTelephonyClientClass_block_invoke;
      v96 = &unk_1E6E2E248;
      id v97 = &v89;
      __getCoreTelephonyClientClass_block_invoke((uint64_t)&buf);
      float v56 = (void *)v90[3];
    }
    unsigned int v57 = v56;
    _Block_object_dispose(&v89, 8);
    id v58 = [v57 alloc];
    float v59 = [v58 initWithQueue:MEMORY[0x1E4F14428]];
    id v60 = [v84 autofillContext];
    id v61 = [v60 objectForKey:*MEMORY[0x1E4FAE9E8]];

    if (!v61)
    {
      id v61 = +[TIXPCUtils obtainBundleIdentifierFromConnection:v78];
    }
    uint64_t v81 = v59;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v86 = 0;
      id v62 = (id *)&v86;
      uint64_t v63 = [v59 retrieveDeviceIdentifier:v54 clientBundleIdentifier:v61 showAlert:0 error:&v86];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        id v70 = TIAppAutofillOSLogFacility();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          double v75 = objc_msgSend(NSString, "stringWithFormat:", @"%s Could not link CoreTelephony.", "-[TIAppAutofillManager generateCellularCandidatesWithRenderTraits:withKeyboardState:]");
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v75;
          _os_log_error_impl(&dword_1E3F0E000, v70, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
        }
        id v29 = 0;
        id v66 = v79;
        v65 = v80;
        uint64_t v64 = v82;
        id v7 = v84;
        goto LABEL_51;
      }
      uint64_t v85 = 0;
      id v62 = (id *)&v85;
      uint64_t v63 = [v59 retrieveDeviceIdentifier:v54 error:&v85];
    }
    id v29 = (id)v63;
    id v69 = *v62;
    id v7 = v84;
    if (!v69)
    {

      int v28 = v78;
      goto LABEL_11;
    }
    id v70 = v69;
    id v71 = TIAppAutofillOSLogFacility();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      uint64_t v74 = [NSString stringWithFormat:@"%s CoreTelephony client returned error on retrieveDeviceIdentifier:error: ERROR:%@", "-[TIAppAutofillManager generateCellularCandidatesWithRenderTraits:withKeyboardState:]", v70];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v74;
      _os_log_error_impl(&dword_1E3F0E000, v71, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
    }
    id v66 = v79;
    v65 = v80;
    uint64_t v64 = v82;
LABEL_51:

    id v53 = (void *)MEMORY[0x1E4F1CBF0];
    id v55 = v78;
    goto LABEL_37;
  }
  uint64_t v64 = TIAppAutofillOSLogFacility();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
  {
    uint64_t v72 = objc_msgSend(NSString, "stringWithFormat:", @"%s The text field has no text content type.", "-[TIAppAutofillManager generateCellularCandidatesWithRenderTraits:withKeyboardState:]");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v72;
    _os_log_error_impl(&dword_1E3F0E000, v64, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
  }
  id v53 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_38:

  return v53;
}

- (id)generateOneTimeCodeCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 autofillContext];
  id v9 = [v8 objectForKey:@"_WebViewURL"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v9 = 0;
  }
  uint64_t v10 = [v7 textInputTraits];
  long long v11 = [v10 textContentType];
  int v12 = [v11 isEqualToString:@"one-time-code"];

  char v13 = [(TIAppAutofillManager *)self dateOfLastPasswordAutoFill];
  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v15 = [(TIAppAutofillManager *)self dateOfLastPasswordAutoFill];
    [v14 timeIntervalSinceDate:v15];
    BOOL v17 = v16 <= 30.0;
  }
  else
  {
    BOOL v17 = 0;
  }

  int v18 = [MEMORY[0x1E4F29268] currentConnection];
  id v19 = +[TIXPCUtils obtainApplicationIdentifierFromConnection:v18];
  int v20 = [v19 isEqualToString:@"com.apple.InputUI"];
  id v21 = TIAppAutofillOSLogFacility();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v20)
  {
    if (v22)
    {
      uint64_t v92 = objc_msgSend(NSString, "stringWithFormat:", @"%s Grabbing application identifier from keyboardState.autofillContext.", "-[TIAppAutofillManager generateOneTimeCodeCandidatesWithRenderTraits:withKeyboardState:]");
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v92;
      _os_log_debug_impl(&dword_1E3F0E000, v21, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
    id v21 = [v7 autofillContext];
    uint64_t v23 = [v21 objectForKey:*MEMORY[0x1E4FAE9D8]];

    id v19 = (void *)v23;
  }
  else if (v22)
  {
    uint64_t v93 = objc_msgSend(NSString, "stringWithFormat:", @"%s Grabbing application identifier from xpc connection.", "-[TIAppAutofillManager generateOneTimeCodeCandidatesWithRenderTraits:withKeyboardState:]");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v93;
    _os_log_debug_impl(&dword_1E3F0E000, v21, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
  }
  if (v19)
  {
    BOOL v105 = v17;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v118 = 0x3032000000;
    v119 = __Block_byref_object_copy__74;
    v120 = __Block_byref_object_dispose__75;
    id v121 = 0;
    uint64_t v24 = [v7 autofillContext];
    unint64_t v25 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4FAE9E0]];

    group = dispatch_group_create();
    objc_opt_class();
    v108 = v25;
    if (objc_opt_respondsToSelector())
    {
      dispatch_group_enter(group);
      int v26 = (void *)MEMORY[0x1E4F98250];
      v111[0] = MEMORY[0x1E4F143A8];
      v111[1] = 3221225472;
      v111[2] = __88__TIAppAutofillManager_generateOneTimeCodeCandidatesWithRenderTraits_withKeyboardState___block_invoke;
      v111[3] = &unk_1E6E293A8;
      p_long long buf = &buf;
      uint64_t v27 = group;
      v112 = v27;
      [v26 getOneTimeCodeCredentialsForAppWithAppID:v19 externallyVerifiedAndApprovedSharedWebCredentialDomains:v25 websiteURL:v9 completionHandler:v111];
      dispatch_time_t v28 = dispatch_time(0, 200000000);
      if (dispatch_group_wait(v27, v28))
      {
        id v29 = TIAppAutofillOSLogFacility();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v95 = objc_msgSend(NSString, "stringWithFormat:", @"%s Timed out while fetching external one time code credential identities", "-[TIAppAutofillManager generateOneTimeCodeCandidatesWithRenderTraits:withKeyboardState:]");
          *(_DWORD *)v116 = 138412290;
          *(void *)&v116[4] = v95;
          _os_log_error_impl(&dword_1E3F0E000, v29, OS_LOG_TYPE_ERROR, "%@", v116, 0xCu);
        }
      }
      uint64_t v30 = *(void *)(*((void *)&buf + 1) + 40);
      if (v30)
      {
        v99 = v19;
        v101 = v18;
        v103 = v9;
        char v31 = (void *)MEMORY[0x1E4F1C978];
        unint64_t v32 = [(TIAppAutofillManager *)self _secureCandidateForPasswordCredential:v30 fromLocalizedStringKey:@"SAFARI_CREDENTIAL_SITE_SHORT"];
        BOOL v33 = [v31 arrayWithObject:v32];

        *(void *)v116 = 0;
        uint64_t v34 = [(TIAppAutofillManager *)self _autoFillPayloadForPasswordCredential:*(void *)(*((void *)&buf + 1) + 40) keyboardInfoType:v116];
        uint64_t v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v33, "count"));
        dispatch_time_t v36 = [(TIAppAutofillManager *)self secureCandidateRenderer];
        v37 = [v36 slotIDsFromSecureCandidates:v33 withRenderTraits:v6 outWidths:v35];
        [v37 firstObject];
        uint64_t v38 = v106 = v7;
        uint64_t v39 = [v38 unsignedIntValue];

        int v40 = [MEMORY[0x1E4FAE318] secureCandidateForInput:&stru_1F3F7A998 slotID:v39 customInfoType:*(void *)v116];
        int v41 = [v35 firstObject];
        [v41 floatValue];
        [v40 setSecureCandidateWidth:v42];

        id v43 = [v33 firstObject];
        objc_msgSend(v40, "setSecureCandidateHash:", objc_msgSend(v43, "candidateHash"));

        v44 = [(TIAppAutofillManager *)self secureCandidateRenderer];
        unint64_t v45 = [v44 secureCandidateCache];
        float v46 = [NSNumber numberWithUnsignedInt:v39];
        [v45 setObject:v34 forKey:v46];

        id v7 = v106;
        double v47 = +[TIKeyboardSecureTouchManager sharedInstance];
        [v47 registerSlotID:v39];

        id v48 = [v106 documentIdentifier];
        id v49 = (void *)[v48 copy];
        [(TIAppAutofillManager *)self setDocumentIdentifierForLastAutofillGeneration:v49];

        id v50 = [v106 clientIdentifier];
        uint64_t v51 = (void *)[v50 copy];
        [(TIAppAutofillManager *)self setClientIdentifierForLastAutofillGeneration:v51];

        if (v40)
        {
          v115 = v40;
          v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
        }
        else
        {
          v52 = 0;
        }
        int v18 = v101;

        id v58 = v112;
        id v9 = v103;
        id v19 = v99;
        unint64_t v25 = v108;
        goto LABEL_50;
      }
    }
    char v54 = objc_opt_respondsToSelector();
    oneTimeCodeProvider = self->_oneTimeCodeProvider;
    if (v54)
    {
      if (v12 | v105) {
        uint64_t v56 = 2;
      }
      else {
        uint64_t v56 = 0;
      }
      unsigned int v57 = [(SFAppAutoFillOneTimeCodeProvider *)self->_oneTimeCodeProvider currentOneTimeCodesWithAppIdentifier:v19 website:v9 usernameHint:self->_lastAutofilledUsername fieldClassification:v56];
      id v58 = [v57 firstObject];
    }
    else
    {
      id v59 = v6;
      id v60 = v19;
      unsigned int v57 = +[TIKeyboardInputManagerLoader sharedLoader];
      id v61 = [v57 interactingConnection];
      id v62 = v61;
      if (v61) {
        [v61 auditToken];
      }
      else {
        memset(v110, 0, sizeof(v110));
      }
      if (v12 | v105) {
        uint64_t v63 = 2;
      }
      else {
        uint64_t v63 = 0;
      }
      uint64_t v64 = [(SFAppAutoFillOneTimeCodeProvider *)oneTimeCodeProvider currentOneTimeCodesWithAuditToken:v110 website:v9 usernameHint:self->_lastAutofilledUsername fieldClassification:v63];
      id v58 = [v64 firstObject];

      id v19 = v60;
      id v6 = v59;
      unint64_t v25 = v108;
    }

    if (!v58)
    {
      v52 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_51:

      _Block_object_dispose(&buf, 8);
      goto LABEL_52;
    }
    uint64_t v100 = v19;
    v102 = v18;
    v104 = v9;
    id v107 = v7;
    v65 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    id v66 = [v58 localizedTitleForContext:0];
    unsigned int v67 = [v58 displayCode];
    uint64_t v68 = [v58 localizedSubtitleForContext:0];
    id v69 = (void *)v68;
    if (v67) {
      id v70 = v67;
    }
    else {
      id v70 = (void *)v68;
    }
    id v71 = (objc_class *)MEMORY[0x1E4FAE508];
    id v72 = v70;
    id v73 = (void *)[[v71 alloc] initWithSecureHeader:v66 secureContent:v72 secureFormattedContent:v69 input:&stru_1F3F7A998 truncationSentinel:0];

    [v65 addObject:v73];
    uint64_t v74 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v65, "count"));
    double v75 = [(TIAppAutofillManager *)self secureCandidateRenderer];
    id v98 = v6;
    id v76 = [v75 slotIDsFromSecureCandidates:v65 withRenderTraits:v6 outWidths:v74];

    uint64_t v77 = [v58 code];
    v96 = v76;
    v78 = [v76 firstObject];
    uint64_t v79 = [v78 unsignedIntegerValue];

    unint64_t v80 = [v58 source];
    uint64_t v81 = 0;
    if (v80 <= 2) {
      uint64_t v81 = qword_1E4154F38[v80];
    }
    id v82 = [MEMORY[0x1E4FAE318] secureCandidateForInput:v77 slotID:v79 customInfoType:v81];
    id v97 = v74;
    id v83 = [v74 firstObject];
    [v83 floatValue];
    [v82 setSecureCandidateWidth:v84];

    uint64_t v85 = [v65 firstObject];
    objc_msgSend(v82, "setSecureCandidateHash:", objc_msgSend(v85, "candidateHash"));

    uint64_t v86 = [MEMORY[0x1E4F1CA60] dictionary];
    [v86 setObject:v77 forKeyedSubscript:*MEMORY[0x1E4FAE908]];
    uint64_t v87 = [(TIAppAutofillManager *)self secureCandidateRenderer];
    uint64_t v88 = [v87 secureCandidateCache];
    uint64_t v89 = [NSNumber numberWithUnsignedInt:v79];
    [v88 setObject:v86 forKey:v89];

    dispatch_semaphore_t v90 = +[TIKeyboardSecureTouchManager sharedInstance];
    [v90 registerSlotID:v79];

    [(SFAppAutoFillOneTimeCodeProvider *)self->_oneTimeCodeProvider addObserver:self forOneTimeCode:v58];
    if (v82)
    {
      v114 = v82;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
    }
    else
    {
      v52 = 0;
    }
    id v9 = v104;
    unint64_t v25 = v108;

    id v6 = v98;
    id v19 = v100;
    id v7 = v107;
    int v18 = v102;
LABEL_50:

    goto LABEL_51;
  }
  id v53 = TIAppAutofillOSLogFacility();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    uint64_t v94 = objc_msgSend(NSString, "stringWithFormat:", @"%s The application has no appID.", "-[TIAppAutofillManager generateOneTimeCodeCandidatesWithRenderTraits:withKeyboardState:]");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v94;
    _os_log_error_impl(&dword_1E3F0E000, v53, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
  }
  v52 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_52:

  return v52;
}

void __88__TIAppAutofillManager_generateOneTimeCodeCandidatesWithRenderTraits_withKeyboardState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

- (void)_finishAutofillFormCandidatesOnMainThreadWithCredentials:(id)a3 renderTraits:(id)a4 documentIdentifier:(id)a5 clientIdentifier:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v48 = a6;
  double v47 = (void (**)(id, void *))a7;
  unint64_t v14 = [v11 count];
  id v49 = v13;
  if (v14 >= [v12 maxCellCount])
  {
    unint64_t v15 = [v12 maxCellCount];
    [v12 setCellRenderingStyle:1];
  }
  else
  {
    unint64_t v15 = [v11 count];
  }
  uint64_t v56 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v15];
  char v54 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v15];
  double v16 = @"SAFARI_CREDENTIAL_SITE_LONG";
  if (v15 <= 1)
  {
    BOOL v17 = @"SAFARI_PASSKEY_SITE_LONG";
  }
  else
  {
    double v16 = @"SAFARI_CREDENTIAL_SITE_SHORT";
    BOOL v17 = @"SAFARI_CREDENTIAL_SITE_SHORT";
  }
  int v18 = v16;
  uint64_t v51 = v17;
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x2050000000;
  id v19 = (void *)getSFAutoFillPasskeyClass_softClass;
  uint64_t v61 = getSFAutoFillPasskeyClass_softClass;
  if (!getSFAutoFillPasskeyClass_softClass)
  {
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __getSFAutoFillPasskeyClass_block_invoke;
    v57[3] = &unk_1E6E2E248;
    v57[4] = &v58;
    __getSFAutoFillPasskeyClass_block_invoke((uint64_t)v57);
    id v19 = (void *)v59[3];
  }
  id v20 = v19;
  _Block_object_dispose(&v58, 8);
  uint64_t v21 = [v11 count];
  if (v21)
  {
    uint64_t v22 = v21;
    for (uint64_t i = 0; v22 != i; ++i)
    {
      uint64_t v24 = [v11 objectAtIndexedSubscript:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v25 = [(TIAppAutofillManager *)self _secureCandidateForPasswordCredential:v24 fromLocalizedStringKey:v18];
      }
      else
      {
        if (!v20 || (objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_17;
        }
        uint64_t v25 = [(TIAppAutofillManager *)self _secureCandidateForPasskey:v24 fromLocalizedStringKey:v51];
      }
      int v26 = (void *)v25;
      [v56 addObject:v25];

LABEL_17:
    }
  }
  float v46 = v18;
  uint64_t v27 = +[TIKeyboardSecureTouchManager sharedInstance];
  [v27 clearRegistrations];

  [v12 setShouldForceDoubleLineCandidateForPasswordAutofill:1];
  dispatch_time_t v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v56, "count"));
  id v29 = [(TIAppAutofillManager *)self secureCandidateRenderer];
  id v50 = v12;
  uint64_t v30 = [v29 slotIDsFromSecureCandidates:v56 withRenderTraits:v12 outWidths:v28];

  if ([v30 count])
  {
    unint64_t v31 = 0;
    id v52 = v20;
    id v53 = v11;
    while (1)
    {
      unint64_t v32 = [v11 objectAtIndex:v31];
      v57[0] = 0;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      BOOL v33 = self;
      if (v20)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v20 = 0;
          goto LABEL_26;
        }
        uint64_t v34 = [(TIAppAutofillManager *)self _autoFillPayloadForPasskey:v32 keyboardInfoType:v57];
        goto LABEL_25;
      }
LABEL_26:
      uint64_t v35 = [v30 objectAtIndex:v31];
      uint64_t v36 = [v35 unsignedIntegerValue];

      v37 = [MEMORY[0x1E4FAE318] secureCandidateForInput:&stru_1F3F7A998 slotID:v36 customInfoType:v57[0]];
      if ([v28 count] <= v31)
      {
        [v37 setSecureCandidateWidth:0.0];
      }
      else
      {
        uint64_t v38 = [v28 objectAtIndexedSubscript:v31];
        [v38 floatValue];
        [v37 setSecureCandidateWidth:v39];
      }
      int v40 = [v56 objectAtIndexedSubscript:v31];
      objc_msgSend(v37, "setSecureCandidateHash:", objc_msgSend(v40, "candidateHash"));

      [v54 addObject:v37];
      int v41 = [(TIAppAutofillManager *)v33 secureCandidateRenderer];
      float v42 = [v41 secureCandidateCache];
      id v43 = [NSNumber numberWithUnsignedInt:v36];
      [v42 setObject:v20 forKey:v43];

      v44 = +[TIKeyboardSecureTouchManager sharedInstance];
      [v44 registerSlotID:v36];

      ++v31;
      id v20 = v52;
      id v11 = v53;
      if (v31 >= [v30 count]) {
        goto LABEL_32;
      }
    }
    BOOL v33 = self;
    uint64_t v34 = [(TIAppAutofillManager *)self _autoFillPayloadForPasswordCredential:v32 keyboardInfoType:v57];
LABEL_25:
    id v20 = (id)v34;
    goto LABEL_26;
  }
LABEL_32:
  [(TIAppAutofillManager *)self setDocumentIdentifierForLastAutofillGeneration:v49];
  [(TIAppAutofillManager *)self setClientIdentifierForLastAutofillGeneration:v48];
  unint64_t v45 = [MEMORY[0x1E4FAE318] candidateWithCandidate:&stru_1F3F7A998 forInput:&stru_1F3F7A998 customInfoType:32];
  [v54 addObject:v45];
  v47[2](v47, v54);
}

- (void)generateAutofillFormCandidatesWithRenderTraits:(id)a3 withKeyboardState:(id)a4 completion:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(TIAppAutofillManager *)self privateQueue];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke;
  aBlock[3] = &unk_1E6E2BD98;
  id v12 = v11;
  id v53 = v12;
  id v13 = v10;
  id v54 = v13;
  unint64_t v14 = _Block_copy(aBlock);
  unint64_t v15 = [v9 documentIdentifier];

  if (v15)
  {
    [(TIAppAutofillManager *)self setDocumentIdentifierForLastAutofillGeneration:0];
    [(TIAppAutofillManager *)self setClientIdentifierForLastAutofillGeneration:0];
    if (+[TIAppAutofillManager _simulatesAutofillCandidates](TIAppAutofillManager, "_simulatesAutofillCandidates")|| ([MEMORY[0x1E4F98250] isAppAutoFillAvailable] & 1) != 0)
    {
      int v40 = v14;
      id v41 = v13;
      double v16 = [v9 documentIdentifier];
      float v39 = (void *)[v16 copy];

      BOOL v17 = [v9 clientIdentifier];
      uint64_t v38 = (void *)[v17 copy];

      int v18 = [v9 textInputTraits];
      id v19 = [v18 textContentType];
      id v20 = (void *)[v19 copy];

      uint64_t v21 = [v9 autofillContext];
      uint64_t v22 = (void *)[v21 copy];

      uint64_t v23 = [(TIAppAutofillManager *)self passkeyProvider];
      uint64_t v24 = [MEMORY[0x1E4F29268] currentConnection];
      uint64_t v25 = v24;
      *(_OWORD *)long long buf = 0u;
      long long v56 = 0u;
      if (v24) {
        [v24 auditToken];
      }
      uint64_t v26 = [v22 objectForKey:*MEMORY[0x1E4FAE9D8]];
      if (v26)
      {
        uint64_t v27 = (void *)v26;
        dispatch_time_t v28 = +[TIXPCUtils obtainBundleIdentifierFromConnection:v25];
        if (([v28 hasPrefix:@"com.apple."] & 1) != 0
          || [(TIAppAutofillManager *)self hasAutofillContextEntitlementForConnection:v25])
        {

LABEL_16:
          objc_initWeak(&location, self);
          uint64_t v30 = [(TIAppAutofillManager *)self privateQueue];
          long long v49 = *(_OWORD *)buf;
          float v42 = v23;
          id v43 = v22;
          v44 = v20;
          unint64_t v45 = v27;
          long long v50 = v56;
          id v37 = v27;
          id v36 = v20;
          id v31 = v22;
          id v32 = v23;
          objc_copyWeak(&v48, &location);
          id v46 = v8;
          unint64_t v14 = v40;
          id v47 = v40;
          id v33 = v38;
          id v34 = v39;
          TIDispatchAsync();

          objc_destroyWeak(&v48);
          objc_destroyWeak(&location);

          id v13 = v41;
          goto LABEL_17;
        }
      }
      uint64_t v27 = +[TIXPCUtils obtainApplicationIdentifierFromConnection:v25];
      goto LABEL_16;
    }
  }
  else
  {
    id v29 = TIAppAutofillOSLogFacility();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v35 = [NSString stringWithFormat:@"%s The documentIdentifier is nil, do not try to generate autofill suggestions.", "-[TIAppAutofillManager generateAutofillFormCandidatesWithRenderTraits:withKeyboardState:completion:]"];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v35;
      _os_log_debug_impl(&dword_1E3F0E000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  (*((void (**)(void *, void))v14 + 2))(v14, MEMORY[0x1E4F1CBF0]);
LABEL_17:
}

void __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  TIDispatchAsync();
}

void __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke_192(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke_2_193;
  v8[3] = &unk_1E6E29A00;
  objc_copyWeak(&v13, (id *)(a1 + 96));
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 80);
  id v12 = *(id *)(a1 + 88);
  long long v6 = *(_OWORD *)(a1 + 120);
  v7[0] = *(_OWORD *)(a1 + 104);
  v7[1] = v6;
  +[TIAppAutofillManager _fetchCredentialsWithPasskeyProvider:v2 autofillContext:v3 textContentType:v4 applicationIdentifier:v5 auditToken:v7 completion:v8];

  objc_destroyWeak(&v13);
}

void __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke_2_193(id *a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v9, a1 + 8);
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  id v8 = a1[7];
  id v4 = v3;
  TIDispatchAsync();

  objc_destroyWeak(&v9);
}

void __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _finishAutofillFormCandidatesOnMainThreadWithCredentials:*(void *)(a1 + 32) renderTraits:*(void *)(a1 + 40) documentIdentifier:*(void *)(a1 + 48) clientIdentifier:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __100__TIAppAutofillManager_generateAutofillFormCandidatesWithRenderTraits_withKeyboardState_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)hasCoreTelephonyEntitlementForConnection:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  id v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    id v6 = v5;
    CFErrorRef error = 0;
    id v7 = (void *)SecTaskCopyValueForEntitlement(v5, @"com.apple.CommCenter.fine-grained", &error);
    if (error)
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      id v8 = TIOSLogFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v11 = [NSString stringWithFormat:@"%s Cannot obtain core telephony entitlement: %@", "-[TIAppAutofillManager hasCoreTelephonyEntitlementForConnection:]", error];
        *(_DWORD *)long long buf = 138412290;
        id v20 = v11;
        _os_log_debug_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      CFRelease(error);
    }
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __65__TIAppAutofillManager_hasCoreTelephonyEntitlementForConnection___block_invoke;
        v12[3] = &unk_1E6E29308;
        v12[4] = &v15;
        [v7 enumerateObjectsUsingBlock:v12];
      }
    }
    CFRelease(v6);
  }
  char v9 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v9;
}

uint64_t __65__TIAppAutofillManager_hasCoreTelephonyEntitlementForConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isEqualToString:@"public-cellular-plan"];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)hasAutofillContextEntitlementForConnection:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  id v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    id v6 = v5;
    CFErrorRef error = 0;
    id v7 = (void *)SecTaskCopyValueForEntitlement(v5, @"com.apple.textInput.autofillContext", &error);
    char v8 = [v7 BOOLValue];

    if (error)
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      char v9 = TIOSLogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v11 = [NSString stringWithFormat:@"%s Cannot obtain autofill context: %@", "-[TIAppAutofillManager hasAutofillContextEntitlementForConnection:]", error];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v15 = v11;
        _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      CFRelease(error);
    }
    CFRelease(v6);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)localizedCellularAutofillStringForKey:(id)a3 defaultValue:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  char v8 = [(TIAppAutofillManager *)self secureCandidateRenderer];
  char v9 = [v8 localizedStringForKey:v7];

  if (![v9 length])
  {
    id v10 = TIAppAutofillOSLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s Localized Cellular autofill text is nil", "-[TIAppAutofillManager localizedCellularAutofillStringForKey:defaultValue:]");
      *(_DWORD *)long long buf = 138412290;
      uint64_t v15 = v13;
      _os_log_error_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    id v11 = v6;

    char v9 = v11;
  }

  return v9;
}

- (id)customInfoFromCredential:(id)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 user];
  if ([(TIAppAutofillManager *)self isValidedString:v5])
  {
    id v6 = [v4 user];
  }
  else
  {
    id v6 = &stru_1F3F7A998;
  }

  id v7 = [v4 password];
  if ([(TIAppAutofillManager *)self isValidedString:v7])
  {
    char v8 = [v4 password];
  }
  else
  {
    char v8 = &stru_1F3F7A998;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v4 oneTimeCode],
        char v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = [(TIAppAutofillManager *)self isValidedString:v9],
        v9,
        v10))
  {
    uint64_t v11 = *MEMORY[0x1E4FAE918];
    v18[0] = *MEMORY[0x1E4FAE938];
    v18[1] = v11;
    v19[0] = v6;
    v19[1] = v8;
    v18[2] = *MEMORY[0x1E4FAE908];
    id v12 = [v4 oneTimeCode];
    v19[2] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4FAE918];
    v16[0] = *MEMORY[0x1E4FAE938];
    v16[1] = v14;
    v17[0] = v6;
    v17[1] = v8;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }

  return v13;
}

- (BOOL)isValidedString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (isValidedString__onceToken != -1)
  {
    dispatch_once(&isValidedString__onceToken, &__block_literal_global_126);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v5 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL v5 = [v4 rangeOfCharacterFromSet:isValidedString__invalidCharacterSet] == 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

  return v5;
}

void __40__TIAppAutofillManager_isValidedString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E58] illegalCharacterSet];
  v1 = (void *)isValidedString__invalidCharacterSet;
  isValidedString__invalidCharacterSet = v0;

  uint64_t v2 = (void *)isValidedString__invalidCharacterSet;
  id v3 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  [v2 formUnionWithCharacterSet:v3];

  id v4 = (void *)isValidedString__invalidCharacterSet;
  id v5 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  [v4 formUnionWithCharacterSet:v5];
}

- (void)reset
{
}

- (void)pushQueuedCredentialIfNecessaryForKeyboardState:(id)a3
{
  id v14 = a3;
  id v4 = [(TIAppAutofillManager *)self queuedCustomInfo];
  if (v4
    && (([v14 needAutofill] & 1) != 0
     || [v14 autofillMode] == 1
     || [v14 autofillMode] == 3))
  {
    id v5 = [v14 documentIdentifier];
    id v6 = [(TIAppAutofillManager *)self queuedCustomInfo];
    id v7 = [v6 documentIdentifier];
    int v8 = [v5 isEqual:v7];

    if (!v8) {
      goto LABEL_9;
    }
    char v9 = +[TIKeyboardInputManagerLoader sharedLoader];
    id v4 = [v9 interactingConnection];

    if (v4)
    {
      BOOL v10 = [v4 remoteObjectProxy];
      uint64_t v11 = [(TIAppAutofillManager *)self queuedCustomInfo];
      id v12 = [v11 customInfo];
      [v10 processPayloadInfo:v12];

      [(TIAppAutofillManager *)self setQueuedCustomInfo:0];
    }
  }

LABEL_9:
  id v13 = [v14 clientIdentifier];
  [(TIAppAutofillManager *)self setClientIdentifierForLastKeyboardSync:v13];
}

- (void)obtainCredential:(id)a3
{
  id v15 = [(TIAppAutofillManager *)self customInfoFromCredential:a3];
  id v4 = +[TIKeyboardInputManagerLoader sharedLoader];
  id v5 = [v4 interactingConnection];

  id v6 = +[TIXPCUtils obtainBundleIdentifierFromConnection:v5];
  if (v5)
  {
    id v7 = [(TIAppAutofillManager *)self clientIdentifierForLastKeyboardSync];
    int v8 = [(TIAppAutofillManager *)self clientIdentifierForLastAutofillGeneration];
    if ([v7 isEqualToString:v8])
    {
      char v9 = [(TIAppAutofillManager *)self clientIdentifierForLastKeyboardSync];
      int v10 = [v9 isEqualToString:v6];

      if (v10)
      {
        uint64_t v11 = [v5 remoteObjectProxy];
        [v11 processPayloadInfo:v15];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v12 = [TICredentialCustomInfo alloc];
  uint64_t v11 = [(TIAppAutofillManager *)self documentIdentifierForLastAutofillGeneration];
  id v13 = [(TICredentialCustomInfo *)v12 initWithCustomInfo:v15 documentIdentifier:v11];
  [(TIAppAutofillManager *)self setQueuedCustomInfo:v13];

LABEL_7:
  id v14 = [MEMORY[0x1E4F1C9C8] date];
  [(TIAppAutofillManager *)self setDateOfLastPasswordAutoFill:v14];
}

- (TIKeyboardSecureCandidateRenderer)secureCandidateRenderer
{
  return self->_secureCandidateRenderer;
}

- (id)initPrivate
{
  v15.receiver = self;
  v15.super_class = (Class)TIAppAutofillManager;
  uint64_t v2 = [(TIAppAutofillManager *)&v15 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.TextInput.appAutofillManager", v3);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc_init(TIKeyboardSecureCandidateRenderer);
    secureCandidateRenderer = v2->_secureCandidateRenderer;
    v2->_secureCandidateRenderer = v6;

    int v8 = (SFAppAutoFillOneTimeCodeProvider *)objc_alloc_init(MEMORY[0x1E4F98200]);
    oneTimeCodeProvider = v2->_oneTimeCodeProvider;
    v2->_oneTimeCodeProvider = v8;

    [(SFAppAutoFillOneTimeCodeProvider *)v2->_oneTimeCodeProvider addObserver:v2];
    uint64_t v17 = 0;
    char v18 = &v17;
    uint64_t v19 = 0x2050000000;
    int v10 = (void *)getSFAppAutoFillPasskeyProviderClass_softClass;
    uint64_t v20 = getSFAppAutoFillPasskeyProviderClass_softClass;
    if (!getSFAppAutoFillPasskeyProviderClass_softClass)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __getSFAppAutoFillPasskeyProviderClass_block_invoke;
      v16[3] = &unk_1E6E2E248;
      v16[4] = &v17;
      __getSFAppAutoFillPasskeyProviderClass_block_invoke((uint64_t)v16);
      int v10 = (void *)v18[3];
    }
    uint64_t v11 = v10;
    _Block_object_dispose(&v17, 8);
    id v12 = (SFAppAutoFillPasskeyProvider *)objc_alloc_init(v11);
    passkeyProvider = v2->_passkeyProvider;
    v2->_passkeyProvider = v12;
  }
  return v2;
}

+ (void)_fetchCredentialsWithPasskeyProvider:(id)a3 autofillContext:(id)a4 textContentType:(id)a5 applicationIdentifier:(id)a6 auditToken:(id *)a7 completion:(id)a8
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  objc_super v15 = (void (**)(id, void *))a8;
  id v16 = a5;
  uint64_t v17 = dispatch_group_create();
  id v18 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x3032000000;
  id v62 = __Block_byref_object_copy__74;
  uint64_t v63 = __Block_byref_object_dispose__75;
  id v64 = 0;
  char v19 = [v16 isEqualToString:*MEMORY[0x1E4FAEF38]];

  if (v19)
  {
    if (!v12) {
      goto LABEL_13;
    }
    uint64_t v20 = *MEMORY[0x1E4FAE9F0];
    goto LABEL_6;
  }
  uint64_t v20 = *MEMORY[0x1E4FAE9F0];
  uint64_t v21 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4FAE9F0]];
  if ([v21 isEqualToString:@"webauthn"])
  {

    if (!v12) {
      goto LABEL_13;
    }
LABEL_6:
    dispatch_group_enter(v17);
    uint64_t v22 = [v13 objectForKeyedSubscript:v20];
    if ([v22 isEqualToString:@"webauthn"])
    {
      char v23 = objc_opt_respondsToSelector();

      if (v23)
      {
        uint64_t v24 = v58;
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        uint64_t v25 = __137__TIAppAutofillManager__fetchCredentialsWithPasskeyProvider_autofillContext_textContentType_applicationIdentifier_auditToken_completion___block_invoke;
LABEL_11:
        v24[2] = v25;
        v24[3] = &unk_1E6E29380;
        v24[4] = v18;
        v24[6] = &v59;
        v24[5] = v17;
        [v12 getAvailablePasskeysForApplicationIdentifier:v14 completionHandler:v24];

        uint64_t v21 = (void *)v24[4];
        goto LABEL_12;
      }
    }
    else
    {
    }
    uint64_t v24 = v57;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    uint64_t v25 = __137__TIAppAutofillManager__fetchCredentialsWithPasskeyProvider_autofillContext_textContentType_applicationIdentifier_auditToken_completion___block_invoke_2;
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  uint64_t v51 = 0;
  id v52 = &v51;
  uint64_t v53 = 0x3032000000;
  id v54 = __Block_byref_object_copy__74;
  id v55 = __Block_byref_object_dispose__75;
  id v56 = 0;
  dispatch_group_enter(v17);
  uint64_t v44 = MEMORY[0x1E4F143A8];
  uint64_t v45 = 3221225472;
  id v46 = __137__TIAppAutofillManager__fetchCredentialsWithPasskeyProvider_autofillContext_textContentType_applicationIdentifier_auditToken_completion___block_invoke_3;
  id v47 = &unk_1E6E29380;
  id v26 = v18;
  id v48 = v26;
  long long v50 = &v51;
  uint64_t v27 = v17;
  long long v49 = v27;
  +[TIAppAutofillManager getCredentialsWithApplicationIdentifier:v14 autofillContext:v13 withCompletionHandler:&v44];
  dispatch_time_t v28 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v27, v28))
  {
    id v29 = TIAppAutofillOSLogFacility();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v43 = objc_msgSend(NSString, "stringWithFormat:", @"%s Timeout while waiting for credentials", "+[TIAppAutofillManager _fetchCredentialsWithPasskeyProvider:autofillContext:textContentType:applicationIdentifier:auditToken:completion:]", v44, v45, v46, v47, v48);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v68 = v43;
      _os_log_error_impl(&dword_1E3F0E000, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  [v26 lock];
  uint64_t v30 = [(id)v60[5] copy];
  id v31 = (void *)v30;
  id v32 = (void *)MEMORY[0x1E4F1CBF0];
  if (v30) {
    id v33 = (void *)v30;
  }
  else {
    id v33 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v34 = v33;

  uint64_t v35 = [(id)v52[5] copy];
  id v36 = (void *)v35;
  if (v35) {
    id v37 = (void *)v35;
  }
  else {
    id v37 = v32;
  }
  id v38 = v37;

  [v26 unlock];
  if ([v34 count])
  {
    float v39 = [v34 firstObject];
    id v66 = v39;
    int v40 = &v66;
  }
  else
  {
    id v41 = [v38 firstObject];

    if (!v41)
    {
      float v42 = 0;
      goto LABEL_28;
    }
    float v39 = [v38 firstObject];
    v65 = v39;
    int v40 = &v65;
  }
  float v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];

LABEL_28:
  v15[2](v15, v42);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v59, 8);
}

void __137__TIAppAutofillManager__fetchCredentialsWithPasskeyProvider_autofillContext_textContentType_applicationIdentifier_auditToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) lock];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  [*(id *)(a1 + 32) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __137__TIAppAutofillManager__fetchCredentialsWithPasskeyProvider_autofillContext_textContentType_applicationIdentifier_auditToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) lock];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  [*(id *)(a1 + 32) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __137__TIAppAutofillManager__fetchCredentialsWithPasskeyProvider_autofillContext_textContentType_applicationIdentifier_auditToken_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 lock];
  uint64_t v5 = [v4 copy];

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1 + 32) unlock];
  int v8 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v8);
}

+ (void)getCredentialsWithApplicationIdentifier:(id)a3 autofillContext:(id)a4 withCompletionHandler:(id)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  char v9 = (void (**)(id, void *))a5;
  if (+[TIAppAutofillManager _simulatesAutofillCandidates](TIAppAutofillManager, "_simulatesAutofillCandidates")&& [MEMORY[0x1E4F98248] instancesRespondToSelector:sel_initWithUser_password_site_creationDate_])
  {
    id v10 = objc_alloc(MEMORY[0x1E4F98248]);
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    id v12 = (void *)[v10 initWithUser:@"simulateduser573" password:@"thisisasimulatedcandidate" site:@"apple.com" creationDate:v11];

    id v13 = objc_alloc(MEMORY[0x1E4F98248]);
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    objc_super v15 = (void *)[v13 initWithUser:@"Pablo 黑客 Jjyy" password:@"ascenders & descenders" site:@"jjyyPP.apple.com" creationDate:v14];

    v19[0] = v12;
    v19[1] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v9[2](v9, v16);
  }
  uint64_t v17 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FAE9E0]];
  if ([v17 count] && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    [(id)objc_opt_class() getCredentialsForAppWithAppID:v7 externallyVerifiedAndApprovedSharedWebCredentialDomains:v17 completionHandler:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_respondsToSelector())
    {
      id v18 = [v8 objectForKey:@"_WebViewURL"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v18 = 0;
      }
      [(id)objc_opt_class() getCredentialsForAppWithAppID:v7 websiteURL:v18 completionHandler:v9];
    }
    else
    {
      [MEMORY[0x1E4F98250] getCredentialsForAppWithAppID:v7 completionHandler:v9];
    }
  }
}

+ (BOOL)_simulatesAutofillCandidates
{
  uint64_t v2 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  char v3 = [v2 BOOLForPreferenceKey:*MEMORY[0x1E4FAE9C8]];

  return v3;
}

+ (id)sharedInstance
{
  uint64_t v2 = (void *)__testingInstance;
  if (!__testingInstance)
  {
    char v3 = &knownAssetRegionAttributes_assetRegionAttributes;
    uint64_t v2 = (void *)instance;
    if (!instance)
    {
      if (sharedInstance_onceToken != -1)
      {
        dispatch_once(&sharedInstance_onceToken, &__block_literal_global_138);
        char v3 = &knownAssetRegionAttributes_assetRegionAttributes;
      }
      uint64_t v2 = (void *)v3[286];
    }
  }
  id v4 = v2;

  return v4;
}

uint64_t __38__TIAppAutofillManager_sharedInstance__block_invoke()
{
  instance = [[TIAppAutofillManager alloc] initPrivate];

  return MEMORY[0x1F41817F8]();
}

- (void)setCoreTelephonyMockObject:(id)a3
{
}

- (CoreTelephonyMockObject)coreTelephonyMockObject
{
  return self->_coreTelephonyMockObject;
}

+ (void)setSharedAppAutofillManager:(id)a3
{
  id v4 = a3;
  if ((id)__testingInstance != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__testingInstance, a3);
    id v4 = v5;
  }
}

@end