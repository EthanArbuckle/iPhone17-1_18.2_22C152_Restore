@interface RTIDocumentTraits(UIKBExtras)
+ (id)currentRTIDocumentTraitsForAutoFillPanel;
+ (id)translateToRTITextInputKeyboardActionButtonConfiguration:()UIKBExtras;
@end

@implementation RTIDocumentTraits(UIKBExtras)

+ (id)currentRTIDocumentTraitsForAutoFillPanel
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F95EB0]);
  v1 = +[UIKeyboardImpl activeInstance];
  v2 = [v1 keyboardState];
  v3 = [v2 textInputTraits];
  [v0 setTextInputTraits:v3];

  v4 = [v1 delegateAsResponder];
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 textInputContextIdentifier];
    [v0 setTextInputContextIdentifier:v5];
  }
  v6 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v7 = [v6 textInputModeForResponder:v4];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
    if (v8) {
      [v0 setTextInputModeData:v8];
    }
  }
  v92 = (void *)v7;
  v9 = [v4 _additionalTextInputLocales];
  v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v96 objects:v103 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v97 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v96 + 1) + 8 * i) localeIdentifier];
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v96 objects:v103 count:16];
    }
    while (v13);
  }

  if ([v10 count]) {
    [v0 setAdditionalLocaleIdentifiers:v10];
  }
  v17 = [v2 recipientIdentifier];
  [v0 setRecipientId:v17];

  v18 = [v2 responseContext];
  [v0 setResponseContext:v18];

  v19 = [v2 inputContextHistory];
  v20 = (void *)[v19 copy];
  [v0 setInputContextHistory:v20];

  v21 = [v2 supportedPayloadIds];
  [v0 setSupportedPayloadIds:v21];

  v22 = +[UIKeyboardImpl activeInstance];
  v23 = [v22 textInputTraits];
  objc_msgSend(v0, "setHidePrediction:", objc_msgSend(v23, "hidePrediction"));

  v24 = +[UIKeyboardImpl activeInstance];
  v25 = [v24 textInputTraits];
  uint64_t v26 = [v25 disablePrediction];

  [v0 setDisablePrediction:v26];
  v27 = +[UIKeyboardImpl activeInstance];
  v28 = [v27 inputDelegate];
  v29 = [v28 textInputView];
  objc_msgSend(v0, "setShouldReverseLayoutDirection:", objc_msgSend(v29, "_shouldReverseLayoutDirection"));

  objc_msgSend(v0, "setAutofillMode:", objc_msgSend(v2, "autofillMode"));
  objc_msgSend(v0, "setAutofillSubMode:", objc_msgSend(v2, "autofillSubMode"));
  v30 = [v2 autofillContext];
  [v0 setAutofillContext:v30];

  v31 = +[UIKeyboardImpl activeInstance];
  v32 = [v31 _passwordRules];
  [v0 setPasswordRules:v32];

  v33 = +[UIKeyboardImpl activeInstance];
  objc_msgSend(v0, "setShouldLoadAutofillSignUp:", objc_msgSend(v33, "shouldLoadAutofillSignUpInputViewController"));

  if ([v2 supplementalLexiconIdentifier])
  {
    v34 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v2, "supplementalLexiconIdentifier"));
    v102 = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
    [v0 setEnabledSupplementalLexiconIdentifiers:v35];
  }
  else
  {
    [v0 setEnabledSupplementalLexiconIdentifiers:0];
  }
  v36 = [v1 keyboardStateManager];
  objc_msgSend(v0, "setDelegateConformanceType:", objc_msgSend(v36, "delegateConformanceType"));

  if (objc_opt_respondsToSelector())
  {
    v37 = [v1 inputDelegate];
    char v38 = objc_opt_respondsToSelector();

    if (v38)
    {
      v39 = [v1 inputDelegate];
      objc_msgSend(v0, "setDisableAutomaticKeyboardUI:", objc_msgSend(v39, "_disableAutomaticKeyboardUI"));
    }
  }
  v40 = [v4 _responderWindow];
  v90 = [v40 windowScene];
  v89 = [v90 _sceneIdentifier];
  objc_msgSend(v0, "setSceneID:");
  objc_msgSend(v0, "setContextID:", objc_msgSend(v40, "_contextId"));
  v91 = v40;
  v41 = [v40 layer];
  [v0 setLayerID:CALayerGetRenderId()];

  objc_msgSend(v0, "setSupportsImagePaste:", objc_msgSend(v1, "delegateSupportsImagePaste"));
  v42 = [v1 textInputTraits];
  objc_msgSend(v0, "setDevicePasscodeEntry:", objc_msgSend(v42, "isDevicePasscodeEntry"));

  v43 = [v1 textInputTraits];
  objc_msgSend(v0, "setDisableInputBars:", objc_msgSend(v43, "disableInputBars"));

  v44 = +[UIKeyboardImpl activeInstance];
  v88 = [v44 delegateAsResponder];

  v100[0] = @"ForceFloatingKeyboard";
  v45 = NSNumber;
  v87 = [v1 textInputTraits];
  v86 = objc_msgSend(v45, "numberWithBool:", objc_msgSend(v87, "forceFloatingKeyboard"));
  v101[0] = v86;
  v100[1] = @"ForceDisableDictation";
  v46 = NSNumber;
  v85 = [v1 textInputTraits];
  v84 = objc_msgSend(v46, "numberWithBool:", objc_msgSend(v85, "forceDisableDictation"));
  v101[1] = v84;
  v100[2] = @"UseAutomaticEndpointing";
  v47 = NSNumber;
  v83 = [v1 textInputTraits];
  v82 = objc_msgSend(v47, "numberWithBool:", objc_msgSend(v83, "useAutomaticEndpointing"));
  v101[2] = v82;
  v100[3] = @"AcceptsDictationResults";
  v48 = NSNumber;
  v81 = [v1 textInputTraits];
  v80 = objc_msgSend(v48, "numberWithBool:", objc_msgSend(v81, "acceptsDictationSearchResults"));
  v101[3] = v80;
  v100[4] = @"ShouldUseDictationSearchFieldBehavior";
  v49 = NSNumber;
  NSClassFromString(&cfstr_Uisearchtextfi_0.isa);
  v95 = v4;
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v68 = [v1 textInputTraits];
    uint64_t v50 = [v68 showDictationButton];
  }
  else
  {
    uint64_t v50 = 0;
  }
  v78 = [v49 numberWithInt:v50];
  v101[4] = v78;
  v100[5] = @"ForceEnableDictation";
  v51 = NSNumber;
  v94 = v1;
  v77 = [v1 textInputTraits];
  v76 = objc_msgSend(v51, "numberWithBool:", objc_msgSend(v77, "forceEnableDictation"));
  v101[5] = v76;
  v100[6] = @"ShouldSuppressSoftwareKeyboard";
  v52 = NSNumber;
  v75 = +[UIDictationController activeInstance];
  v74 = objc_msgSend(v52, "numberWithBool:", objc_msgSend(v75, "shouldSuppressSoftwareKeyboard"));
  v101[6] = v74;
  v100[7] = @"ShouldSuppressSoftwareKeyboardForKeyboardCamera";
  v53 = NSNumber;
  v73 = +[UIKeyboardCameraSession activeSession];
  v72 = objc_msgSend(v53, "numberWithBool:", objc_msgSend(v73, "shouldSuppressSoftwareKeyboard"));
  v101[7] = v72;
  v100[8] = @"HasCustomInputViewController";
  v54 = NSNumber;
  v71 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v70 = objc_msgSend(v54, "numberWithBool:", objc_msgSend(v71, "hasCustomInputViewController"));
  v101[8] = v70;
  v100[9] = @"SuppressAssistantBar";
  v55 = NSNumber;
  v69 = +[UIKeyboardImpl activeInstance];
  v56 = objc_msgSend(v55, "numberWithBool:", objc_msgSend(v69, "_shouldSuppressAssistantBar"));
  v101[9] = v56;
  v100[10] = @"SuppressSoftwareKeyboard";
  v57 = NSNumber;
  v58 = +[UIKeyboardImpl activeInstance];
  v59 = objc_msgSend(v57, "numberWithBool:", objc_msgSend(v58, "_shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:", 0));
  v101[10] = v59;
  v100[11] = @"RTIInputDelegateClassName";
  if (v95)
  {
    v60 = (objc_class *)objc_opt_class();
    NSStringFromClass(v60);
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = &stru_1ED0E84C0;
  }
  v101[11] = v61;
  v100[12] = @"CorrectionLearningAllowed";
  v93 = v2;
  v62 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "wordLearningEnabled"));
  v101[12] = v62;
  v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:13];
  [v0 setUserInfo:v63];

  if (v95) {
  if (isKindOfClass)
  }

  if (objc_opt_respondsToSelector())
  {
    v64 = +[UIKeyboardImpl activeInstance];
    v65 = [v64 textInputTraits];
    objc_msgSend(v0, "setSingleLineDocument:", objc_msgSend(v65, "isSingleLineDocument"));
  }
  v66 = _UIMainBundleIdentifier();
  [v0 setBundleId:v66];

  return v0;
}

+ (id)translateToRTITextInputKeyboardActionButtonConfiguration:()UIKBExtras
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_16:
    v20 = 0;
    goto LABEL_17;
  }
  v5 = [v3 image];

  if (!v5)
  {
    v21 = _UIKeyboardLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_error_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "keyboardActionButtonItem.image is set to nil, returning nil for the keyboardActionButtonItem", v23, 2u);
    }

    goto LABEL_16;
  }
  uint64_t v6 = [v4 accessibilityLabel];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    v8 = [v4 accessibilityLabel];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = [v4 accessibilityLabel];
LABEL_9:
      id v11 = (void *)v10;
      goto LABEL_10;
    }
  }
  id v11 = [v4 title];
  if (v11)
  {
    uint64_t v12 = [v4 title];
    uint64_t v13 = [v12 length];

    if (!v13)
    {
      id v11 = 0;
      goto LABEL_10;
    }
    uint64_t v10 = [v4 title];
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v14 = [v4 tintColor];

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F95E98];
    id v16 = [v4 tintColor];
    uint64_t v14 = objc_msgSend(v15, "colorWithCGColor:", objc_msgSend(v16, "CGColor"));
  }
  v17 = (void *)MEMORY[0x1E4F28DB0];
  v18 = [v4 image];
  v19 = [v17 archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];

  v20 = [MEMORY[0x1E4F95F10] actionButtonWithSystemImageData:v19 backgroundColor:v14 accessibilityTitle:v11];
  objc_msgSend(v20, "setIsEnabled:", objc_msgSend(v4, "isEnabled"));

LABEL_17:
  return v20;
}

@end