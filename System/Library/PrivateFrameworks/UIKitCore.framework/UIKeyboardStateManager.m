@interface UIKeyboardStateManager
@end

@implementation UIKeyboardStateManager

void __65___UIKeyboardStateManager_generateAutofillCandidateByAddingTask___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = [*(id *)(a1 + 32) usesCandidateSelection];
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    if (([v4 _hasMarkedText] & 1) == 0
      && ([*(id *)(a1 + 32) committingCandidate] & 1) == 0)
    {
      [*(id *)(a1 + 32) generateCandidatesWithOptions:2];
    }
    [v5 returnExecutionToParent];
  }
  else
  {
    [v4 generateAutocorrectionWithExecutionContext:v5];
  }
}

void __65___UIKeyboardStateManager_generateAutofillCandidateByAddingTask___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_408 copy];
  v1 = (void *)qword_1EB25F760;
  qword_1EB25F760 = v0;
}

uint64_t __65___UIKeyboardStateManager_generateAutofillCandidateByAddingTask___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __65___UIKeyboardStateManager_generateAutofillCandidateByAddingTask___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_414 copy];
  v1 = (void *)qword_1EB25F770;
  qword_1EB25F770 = v0;
}

uint64_t __65___UIKeyboardStateManager_generateAutofillCandidateByAddingTask___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __53___UIKeyboardStateManager_updateDefaultsWithResults___block_invoke(uint64_t a1)
{
  v72[6] = *MEMORY[0x1E4F143B8];
  v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  int v3 = [v2 preferencesActions];
  uint64_t v52 = *MEMORY[0x1E4FAE810];
  unsigned int v58 = objc_msgSend(v3, "BOOLForPreferenceKey:");

  int v4 = *(unsigned __int8 *)(a1 + 48);
  id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v6 = [v5 preferencesActions];
  v7 = v6;
  uint64_t v50 = *MEMORY[0x1E4FAE7A0];
  uint64_t v51 = *MEMORY[0x1E4FAE5E8];
  if (v4) {
    uint64_t v8 = *MEMORY[0x1E4FAE5E8];
  }
  else {
    uint64_t v8 = *MEMORY[0x1E4FAE7A0];
  }
  unsigned int v57 = [v6 BOOLForPreferenceKey:v8];

  v9 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v10 = [v9 preferencesActions];
  uint64_t v11 = *MEMORY[0x1E4FAE538];
  unsigned int v56 = [v10 BOOLForPreferenceKey:*MEMORY[0x1E4FAE538]];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 776));
  if ([WeakRetained rivenPreference])
  {
    v13 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v14 = [v13 preferencesActions];
    v15 = [v14 valueForPreferenceKey:*MEMORY[0x1E4FAEF68]];
    [v15 floatValue];
    BOOL v55 = v16 > 0.00000011921;
  }
  else
  {
    BOOL v55 = 0;
  }

  int v17 = *(unsigned __int8 *)(a1 + 48);
  v18 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v19 = [v18 preferencesActions];
  v20 = v19;
  uint64_t v21 = *MEMORY[0x1E4FAE940];
  uint64_t v22 = *MEMORY[0x1E4FAE610];
  if (v17) {
    uint64_t v23 = *MEMORY[0x1E4FAE610];
  }
  else {
    uint64_t v23 = *MEMORY[0x1E4FAE940];
  }
  unsigned int v54 = [v19 BOOLForPreferenceKey:v23];

  int v24 = *(unsigned __int8 *)(a1 + 48);
  v25 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v26 = [v25 preferencesActions];
  v27 = v26;
  uint64_t v28 = *MEMORY[0x1E4FAE7A8];
  uint64_t v29 = *MEMORY[0x1E4FAE5F0];
  if (v24) {
    uint64_t v30 = *MEMORY[0x1E4FAE5F0];
  }
  else {
    uint64_t v30 = *MEMORY[0x1E4FAE7A8];
  }
  unsigned int v31 = [v26 BOOLForPreferenceKey:v30];

  v32 = &xmmword_186B92000;
  if (*(void *)(a1 + 40))
  {
    unsigned int v53 = v31;
    v33 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v34 = [v33 preferencesActions];
    uint64_t v49 = *MEMORY[0x1E4FAE8C0];
    v35 = objc_msgSend(v34, "valueForPreferenceKey:");

    if (*(unsigned char *)(a1 + 48))
    {
      v71[0] = v52;
      v36 = [NSNumber numberWithBool:v58];
      v72[0] = v36;
      v71[1] = v51;
      v37 = [NSNumber numberWithBool:v57];
      v72[1] = v37;
      v71[2] = v11;
      v38 = [NSNumber numberWithBool:v56];
      v72[2] = v38;
      v71[3] = *MEMORY[0x1E4FAEF68];
      v39 = [NSNumber numberWithBool:v55];
      v72[3] = v39;
      v71[4] = v22;
      v40 = [NSNumber numberWithBool:v54];
      v72[4] = v40;
      v71[5] = v29;
      v41 = [NSNumber numberWithBool:v53];
      v72[5] = v41;
      v42 = (void *)MEMORY[0x1E4F1C9E8];
      v43 = v72;
      v44 = v71;
    }
    else
    {
      v69[0] = v52;
      v36 = [NSNumber numberWithBool:v58];
      v70[0] = v36;
      v69[1] = v50;
      v37 = [NSNumber numberWithBool:v57];
      v70[1] = v37;
      v69[2] = v11;
      v38 = [NSNumber numberWithBool:v56];
      v70[2] = v38;
      v69[3] = *MEMORY[0x1E4FAEF68];
      v39 = [NSNumber numberWithBool:v55];
      v70[3] = v39;
      v69[4] = v21;
      v40 = [NSNumber numberWithBool:v54];
      v70[4] = v40;
      v69[5] = v28;
      v41 = [NSNumber numberWithBool:v53];
      v70[5] = v41;
      v42 = (void *)MEMORY[0x1E4F1C9E8];
      v43 = v70;
      v44 = v69;
    }
    v45 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:6];
    v46 = (void *)[v45 mutableCopy];

    if (v35) {
      [v46 setValue:v35 forKey:v49];
    }
    block[0] = MEMORY[0x1E4F143A8];
    v32 = &xmmword_186B92000;
    block[1] = 3221225472;
    block[2] = __53___UIKeyboardStateManager_updateDefaultsWithResults___block_invoke_2;
    block[3] = &unk_1E52DB330;
    id v47 = *(id *)(a1 + 40);
    id v67 = v46;
    id v68 = v47;
    id v48 = v46;
    dispatch_async(MEMORY[0x1E4F14428], block);

    LOBYTE(v31) = v53;
  }
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = *((void *)v32 + 137);
  v59[2] = __53___UIKeyboardStateManager_updateDefaultsWithResults___block_invoke_3;
  v59[3] = &unk_1E52E3510;
  v59[4] = *(void *)(a1 + 32);
  char v60 = v58;
  char v61 = v56;
  char v62 = v31;
  char v63 = v57;
  BOOL v64 = v55;
  char v65 = v54;
  dispatch_async(MEMORY[0x1E4F14428], v59);
}

uint64_t __53___UIKeyboardStateManager_updateDefaultsWithResults___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __53___UIKeyboardStateManager_updateDefaultsWithResults___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 776));
  [(id)objc_opt_class() suppressSetPersistentOffset:1];

  *(unsigned char *)(*(void *)(a1 + 32) + 515) = *(unsigned char *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 41);
  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 776));
  [v4 setAutomaticMinimizationEnabled:v3];

  *(unsigned char *)(*(void *)(a1 + 32) + 520) = *(unsigned char *)(a1 + 42);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 624), "setAutocorrectionEnabled:", objc_msgSend(*(id *)(a1 + 32), "_updateAutocorrectionPreferenceForTraitsWithCurrentPreference:", *(unsigned __int8 *)(a1 + 42)) != 0);
  [*(id *)(a1 + 32) setAutocorrectSpellingEnabled:*(unsigned __int8 *)(a1 + 42)];
  *(unsigned char *)(*(void *)(a1 + 32) + 519) = *(unsigned char *)(a1 + 43);
  [*(id *)(a1 + 32) updateInputManagerAutocapitalizationType];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 624), "setInlineCompletionEnabled:", objc_msgSend(*(id *)(a1 + 32), "isInlineCompletionEnabled"));
  [*(id *)(a1 + 32) takeTextInputTraitsFromDelegate];
  id v5 = [*(id *)(a1 + 32) UILanguagePreference];
  uint64_t v6 = [v5 copy];
  v7 = (void *)UIKeyboardCurrentUILanguage;
  UIKeyboardCurrentUILanguage = v6;

  if (!+[UIKeyboard usesInputSystemUI])
  {
    uint64_t v8 = +[UIKeyboardInputModeController sharedInputModeController];
    v9 = [v8 activeInputModes];
    v10 = [v8 currentInputMode];
    uint64_t v11 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v12 = [v11 preferencesActions];
    v13 = [v12 valueForPreferenceKey:*MEMORY[0x1E4FAE8C0]];

    if ([v9 containsObject:v10])
    {
      v14 = [v10 identifier];
      int v15 = [v13 isEqualToString:v14];
    }
    else
    {
      int v15 = 0;
    }
    float v16 = [v8 inputModeContextIdentifier];
    if (v16) {
      int v17 = 1;
    }
    else {
      int v17 = [*(id *)(a1 + 32) shouldLoadAutofillSignUpInputViewController];
    }

    v18 = [*(id *)(a1 + 32) delegate];

    if (!v18 || (v17 & 1) != 0)
    {
      if ((v15 | v17))
      {
        uint64_t v21 = [v8 identifiersFromInputModes:v9];
        UIKeyboardSetActiveInputModes(v21);
      }
      else
      {
        [*(id *)(a1 + 32) recomputeActiveInputModesWithExtensions:1 allowNonLinguisticInputModes:1];
      }
    }
    else
    {
      [*(id *)(a1 + 32) recomputeActiveInputModesWithExtensions:1 allowNonLinguisticInputModes:1];
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        v19 = [v8 currentInputMode];
        char v20 = [v19 isEqual:v10];

        if ((v20 & 1) == 0) {
          [*(id *)(a1 + 32) syncInputManagerToKeyboardState];
        }
      }
    }
  }
  uint64_t v22 = *(unsigned char **)(a1 + 32);
  if (v22[176])
  {
    uint64_t v23 = +[UIKeyboardCache sharedInstance];
    id v24 = (id)UIKeyboardActiveInputModes;
    [v23 updateCacheForInputModes:v24];

    uint64_t v22 = *(unsigned char **)(a1 + 32);
  }
  v25 = [v22 inputDelegateManager];
  v26 = [v25 keyInputDelegate];
  if (v26)
  {
  }
  else
  {
    int v27 = *(unsigned __int8 *)(a1 + 44);
    int v28 = [*(id *)(*(void *)(a1 + 32) + 624) splitKeyboardMode];

    if (v27 != v28) {
      UIKeyboardSetCurrentInputMode(@"intl");
    }
  }
  uint64_t v29 = [*(id *)(a1 + 32) inputDelegateManager];
  uint64_t v30 = [v29 keyInputDelegate];

  if (v30)
  {
    unsigned int v31 = +[UIKeyboardInputModeController sharedInputModeController];
    v32 = [v31 currentInputMode];
    if ([v32 isEmojiInputMode])
    {
      BOOL v33 = +[UIKeyboard isRemoteEmojiCollectionViewEnabled];

      if (v33) {
        goto LABEL_29;
      }
    }
    else
    {
    }
    id v34 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 776));
    [v34 updateLayout];

LABEL_29:
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 162) = *(unsigned char *)(a1 + 45);
  v35 = *(void **)(a1 + 32);
  v36 = +[UIKeyboardInputModeController sharedInputModeController];
  v37 = [v36 currentInputMode];
  v38 = [v37 primaryLanguage];
  [v35 updateSmartPunctuationOptionsForLocaleIdentifier:v38];

  id v39 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 776));
  [v39 didCompleteUpdateDefaults];

  --*(_DWORD *)(*(void *)(a1 + 32) + 200);
}

uint64_t __54___UIKeyboardStateManager_setInputMode_userInitiated___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setInputMode:*(void *)(a1 + 40) userInitiated:*(unsigned __int8 *)(a1 + 48) updateIndicator:0 executionContext:a2];
}

void __54___UIKeyboardStateManager_setInputMode_userInitiated___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_452 copy];
  v1 = (void *)qword_1EB25F780;
  qword_1EB25F780 = v0;
}

uint64_t __54___UIKeyboardStateManager_setInputMode_userInitiated___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __54___UIKeyboardStateManager_setInputMode_userInitiated___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_458 copy];
  v1 = (void *)qword_1EB25F790;
  qword_1EB25F790 = v0;
}

uint64_t __54___UIKeyboardStateManager_setInputMode_userInitiated___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __69___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_force___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_463 copy];
  v1 = (void *)qword_1EB25F7A0;
  qword_1EB25F7A0 = v0;
}

uint64_t __69___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_force___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __69___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_force___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setKeyboardInputMode:*(void *)(a1 + 40) userInitiated:*(unsigned __int8 *)(a1 + 48) updateIndicator:0 force:*(unsigned __int8 *)(a1 + 49) executionContext:a2];
}

void __95___UIKeyboardStateManager_setKeyboardInputMode_userInitiated_updateIndicator_executionContext___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = UIKeyboardGetCurrentInputMode();
  LODWORD(v2) = [v2 isEqualToString:v3];

  if (v2)
  {
    if (qword_1EB25F7B8 != -1) {
      dispatch_once(&qword_1EB25F7B8, &__block_literal_global_466);
    }
    id v4 = [*(id *)(a1 + 40) taskQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __95___UIKeyboardStateManager_setKeyboardInputMode_userInitiated_updateIndicator_executionContext___block_invoke_4;
    v6[3] = &unk_1E52E3588;
    id v5 = *(void **)(a1 + 48);
    v6[4] = *(void *)(a1 + 40);
    id v7 = v5;
    __int16 v8 = *(_WORD *)(a1 + 56);
    [v4 performSingleTask:v6 breadcrumb:qword_1EB25F7B0];
  }
}

void __95___UIKeyboardStateManager_setKeyboardInputMode_userInitiated_updateIndicator_executionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_468 copy];
  v1 = (void *)qword_1EB25F7B0;
  qword_1EB25F7B0 = v0;
}

uint64_t __95___UIKeyboardStateManager_setKeyboardInputMode_userInitiated_updateIndicator_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __95___UIKeyboardStateManager_setKeyboardInputMode_userInitiated_updateIndicator_executionContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setKeyboardInputMode:*(void *)(a1 + 40) userInitiated:*(unsigned __int8 *)(a1 + 48) updateIndicator:*(unsigned __int8 *)(a1 + 49) force:0 executionContext:a2];
}

void __102___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_updateIndicator_force_executionContext___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_473 copy];
  v1 = (void *)qword_1EB25F7C0;
  qword_1EB25F7C0 = v0;
}

uint64_t __102___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_updateIndicator_force_executionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __102___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_updateIndicator_force_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) syncingDictationLanguageForInputModeSwitch])
  {
    uint64_t v3 = +[UIDictationController activeInstance];
    id v4 = +[UIDictationInputModeOptions dictationInputModeOptionsWithInvocationSource:@"UIDictationInputModeInvocationSourceGlobalButtonOnDictationPlane"];
    [v3 switchToDictationInputModeWithOptions:v4];

    [*(id *)(a1 + 32) setSyncingDictationLanguageForInputModeSwitch:0];
  }
  [v5 returnExecutionToParent];
}

void __102___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_updateIndicator_force_executionContext___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) remoteTextInputPartner];
  [v1 documentStateChanged];
}

void __102___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_updateIndicator_force_executionContext___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) finishSetKeyboardInputMode:*(void *)(a1 + 40) previousInputMode:*(void *)(a1 + 48) didChangeDirection:*(unsigned __int8 *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 57) && ([*(id *)(a1 + 40) isEmojiInputMode] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) inputModeIndicatorController];
    [v3 inputModeChanged];
  }
  [v4 returnExecutionToParent];
}

void __102___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_updateIndicator_force_executionContext___block_invoke_6(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  id v6 = a2;
  [v2 finishSetKeyboardInputMode:v3 previousInputMode:v4 didChangeDirection:v5];
  [v6 returnExecutionToParent];
}

void __86___UIKeyboardStateManager_keyboardInputModeIndicatorControllerShouldPresentIndicator___block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"dictation";
  v2[1] = @"emoji";
  v2[2] = @"intl_HWR";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  id v1 = (void *)qword_1EB25F7D0;
  qword_1EB25F7D0 = v0;
}

uint64_t __54___UIKeyboardStateManager_setInputModeFromPreferences__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isEqual:a2];
}

uint64_t __81___UIKeyboardStateManager_setInputModeToNextInPreferredListWithExecutionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishSetInputModeToNextInPreferredListWithExecutionContext:a2 withPreviousInputMode:*(void *)(a1 + 40)];
}

uint64_t __62___UIKeyboardStateManager_documentIdentifierForInputDelegate___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __74___UIKeyboardStateManager__notifyDidTeardownExistingDelegate_newDelegate___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_517 copy];
  id v1 = (void *)qword_1EB25F7E0;
  qword_1EB25F7E0 = v0;
}

uint64_t __74___UIKeyboardStateManager__notifyDidTeardownExistingDelegate_newDelegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __74___UIKeyboardStateManager__notifyDidTeardownExistingDelegate_newDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) didTeardownExistingDelegate];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) didTeardownExistingDelegate];
    ((void (**)(void, void, void, id))v4)[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48), v5);
  }
  else
  {
    [v5 returnExecutionToParent];
  }
}

void __72___UIKeyboardStateManager__notifyWillSetupNewDelegate_existingDelegate___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_521_0 copy];
  id v1 = (void *)qword_1EB25F7F0;
  qword_1EB25F7F0 = v0;
}

uint64_t __72___UIKeyboardStateManager__notifyWillSetupNewDelegate_existingDelegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __72___UIKeyboardStateManager__notifyWillSetupNewDelegate_existingDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) willSetupNewDelegate];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) willSetupNewDelegate];
    ((void (**)(void, void, void, id))v4)[2](v4, *(void *)(a1 + 40), *(void *)(a1 + 48), v5);
  }
  else
  {
    [v5 returnExecutionToParent];
  }
}

void __95___UIKeyboardStateManager__teardownExistingDelegate_forSetDelegate_force_delayEndInputSession___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (+[UIKeyboard usesInputSystemUI]
    && ([*(id *)(*(void *)(a1 + 32) + 136) isDevicePasscodeEntry] & 1) == 0)
  {
    uint64_t v5 = +[UIKeyboard snapshotViewForOptions:1];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 440);
    *(void *)(v6 + 440) = v5;
  }
  __int16 v8 = [*(id *)(a1 + 32) remoteTextInputPartnerPrivate];
  [v8 endInputSessionWithIdentifier:v10 shouldResign:a3];

  if ([*(id *)(a1 + 32) isOutOfProcess])
  {
    v9 = [*(id *)(a1 + 32) remoteTextInputPartner];
    [v9 endAllowingRemoteTextInput:v10];
  }
}

void __95___UIKeyboardStateManager__teardownExistingDelegate_forSetDelegate_force_delayEndInputSession___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) resigningRTISessionIdentifier];

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(a1 + 32) resigningRTISessionIdentifier];
    (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, 1);

    uint64_t v5 = *(void **)(a1 + 32);
    [v5 setResigningRTISessionIdentifier:0];
  }
}

void __95___UIKeyboardStateManager__teardownExistingDelegate_forSetDelegate_force_delayEndInputSession___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = _UIKeyboardInputSessionChangeLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = "NO";
    *(void *)&v12[4] = "-[_UIKeyboardStateManager _teardownExistingDelegate:forSetDelegate:force:delayEndInputSession:]_block_invoke_3";
    *(_DWORD *)v12 = 136315650;
    if (a3) {
      uint64_t v11 = "YES";
    }
    *(_WORD *)&v12[12] = 2112;
    *(void *)&v12[14] = v5;
    __int16 v13 = 2080;
    v14 = v11;
    _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, "%s end input session: %@ (shouldResignImmediately=%s)", v12, 0x20u);
  }

  if (+[UIKeyboard usesInputSystemUI]
    && ([*(id *)(*(void *)(a1 + 32) + 136) isDevicePasscodeEntry] & 1) == 0)
  {
    uint64_t v7 = +[UIKeyboard snapshotViewForOptions:1];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 440);
    *(void *)(v8 + 440) = v7;
  }
  id v10 = objc_msgSend(*(id *)(a1 + 32), "remoteTextInputPartnerPrivate", *(_OWORD *)v12);
  [v10 endInputSessionWithIdentifier:v5 shouldResign:a3 waitForReply:1];
}

void __140___UIKeyboardStateManager__setupDelegate_delegateSame_hardwareKeyboardStateChanged_endingInputSessionIdentifier_force_delayEndInputSession___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_543 copy];
  id v1 = (void *)qword_1EB25F800;
  qword_1EB25F800 = v0;
}

uint64_t __140___UIKeyboardStateManager__setupDelegate_delegateSame_hardwareKeyboardStateChanged_endingInputSessionIdentifier_force_delayEndInputSession___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __140___UIKeyboardStateManager__setupDelegate_delegateSame_hardwareKeyboardStateChanged_endingInputSessionIdentifier_force_delayEndInputSession___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  [v3 setInputManagerFromCurrentInputMode];
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 1;
  if (*(void *)(a1 + 40)) {
    uint64_t v4 = @"gainFocus";
  }
  else {
    uint64_t v4 = @"loseFocus";
  }
  [*(id *)(a1 + 32) changingContextWithTrigger:v4];
  [*(id *)(a1 + 32) updateForChangedSelectionWithExecutionContext:v5];
}

void __140___UIKeyboardStateManager__setupDelegate_delegateSame_hardwareKeyboardStateChanged_endingInputSessionIdentifier_force_delayEndInputSession___block_invoke_554()
{
  uint64_t v0 = [&__block_literal_global_559 copy];
  id v1 = (void *)qword_1EB25F810;
  qword_1EB25F810 = v0;
}

uint64_t __140___UIKeyboardStateManager__setupDelegate_delegateSame_hardwareKeyboardStateChanged_endingInputSessionIdentifier_force_delayEndInputSession___block_invoke_2_557(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __140___UIKeyboardStateManager__setupDelegate_delegateSame_hardwareKeyboardStateChanged_endingInputSessionIdentifier_force_delayEndInputSession___block_invoke_3_560(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 refreshAutofillModeIfNecessary];
  [v3 returnExecutionToParent];
}

uint64_t __41___UIKeyboardStateManager_didSetDelegate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateDelegatePasteSupport];
}

uint64_t __41___UIKeyboardStateManager_didSetDelegate__block_invoke_2()
{
  return [@"loadEmojiCharacterSet" _containsEmoji];
}

void __53___UIKeyboardStateManager_updateDelegatePasteSupport__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/AvatarKit.framework"];
  uint64_t v0 = [v1 bundleIdentifier];

  if (!v0) {
    _MergedGlobals_990 = 1;
  }
}

uint64_t __44___UIKeyboardStateManager_queueDelayedTask___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __39___UIKeyboardStateManager_textChanged___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_584 copy];
  id v1 = (void *)qword_1EB25F828;
  qword_1EB25F828 = v0;
}

uint64_t __39___UIKeyboardStateManager_textChanged___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __39___UIKeyboardStateManager_textChanged___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) textChanged:*(void *)(a1 + 40) executionContext:a2];
}

void __56___UIKeyboardStateManager_textChanged_executionContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 finishTextChanged];
  [v3 returnExecutionToParent];
}

void __51___UIKeyboardStateManager_textSuggestionDidChange___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_588 copy];
  id v1 = (void *)qword_1EB25F838;
  qword_1EB25F838 = v0;
}

uint64_t __51___UIKeyboardStateManager_textSuggestionDidChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __51___UIKeyboardStateManager_textSuggestionDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 textDidChange:v3];
  [v4 returnExecutionToParent];
}

void __42___UIKeyboardStateManager_setSuggestions___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_595 copy];
  id v1 = (void *)qword_1EB25F848;
  qword_1EB25F848 = v0;
}

uint64_t __42___UIKeyboardStateManager_setSuggestions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __42___UIKeyboardStateManager_setSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 _setSuggestions:v3];
  [v4 returnExecutionToParent];
}

void __43___UIKeyboardStateManager__setSuggestions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v18 = a2;
  uint64_t v6 = [v18 inputText];
  if ([v6 length])
  {
    uint64_t v7 = [*(id *)(a1 + 32) length];
    if (!v7
      || (uint64_t v8 = *(void **)(a1 + 32),
          [v18 searchText],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          ([v8 isEqualToString:v3] & 1) != 0))
    {
      if (*(unsigned char *)(a1 + 80) || (v14 = *(void **)(a1 + 40)) == 0)
      {
        if (v7) {
      }
        }
      else
      {
        uint64_t v15 = [v14 candidate];
        float v16 = [v18 inputText];
        char v17 = [v15 isEqualToString:v16];

        if (v7) {
        if (v17)
        }
          goto LABEL_6;
      }
      uint64_t v11 = *(void **)(a1 + 48);
      v12 = [*(id *)(a1 + 56) objectAtIndex:a3];
      [v11 addObject:v12];

      v9 = *(void **)(a1 + 64);
      uint64_t v10 = [v18 inputText];
      goto LABEL_13;
    }
  }
LABEL_6:
  if (!*(unsigned char *)(a1 + 80)) {
    goto LABEL_14;
  }
  v9 = *(void **)(a1 + 48);
  uint64_t v10 = [*(id *)(a1 + 56) objectAtIndex:a3];
LABEL_13:
  __int16 v13 = (void *)v10;
  [v9 addObject:v10];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
LABEL_14:
}

void __43___UIKeyboardStateManager__setSuggestions___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_603 copy];
  id v1 = (void *)qword_1EB25F858;
  qword_1EB25F858 = v0;
}

uint64_t __43___UIKeyboardStateManager__setSuggestions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __43___UIKeyboardStateManager__setSuggestions___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setShowsCandidateBar:", objc_msgSend(*(id *)(a1 + 32), "shouldShowCandidateBar"));
  if ([*(id *)(*(void *)(a1 + 32) + 32) hasOnlyTextSuggestions]
    && [*(id *)(a1 + 40) hasOnlyTextSuggestions])
  {
    if ([*(id *)(*(void *)(a1 + 32) + 32) hasAutofillCandidates]) {
      int v3 = [*(id *)(a1 + 40) hasAutofillCandidates];
    }
    else {
      int v3 = 1;
    }
  }
  else
  {
    int v3 = 0;
  }
  if (([*(id *)(a1 + 32) shouldPrioritizeTextSuggestionsOverCandidateResultSet:*(void *)(*(void *)(a1 + 32) + 32)] & 1) != 0|| v3)
  {
    [*(id *)(a1 + 32) updateCandidateDisplayAsyncWithCandidateSet:*(void *)(a1 + 40)];
  }
  [v4 returnExecutionToParent];
}

void __86___UIKeyboardStateManager__processInputViewControllerKeyboardOutput_executionContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) keyboardOutputs];
  int v3 = [v2 firstObject];

  if (!v3)
  {
    [*(id *)(a1 + 40) _completePerformInputViewControllerOutput:*(void *)(a1 + 32) executionContext:*(void *)(a1 + 48)];
    goto LABEL_15;
  }
  id v4 = +[UIKeyboardInputModeController sharedInputModeController];
  id v5 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v6 = [v5 currentInputMode];
  [v4 updateLastUsedInputMode:v6];

  [*(id *)(a1 + 40) _updateInputViewControllerOutput:*(void *)(a1 + 32) forKeyboardOutput:v3];
  uint64_t v7 = *(unsigned char **)(a1 + 40);
  if (!*(unsigned char *)(a1 + 56))
  {
    [v7 performKeyboardOutput:v3 forwardToRemoteInputSource:1];
    [v3 setPositionOffset:0];
    v14 = [*(id *)(a1 + 32) keyboardOutputs];
    uint64_t v15 = [*(id *)(a1 + 32) keyboardOutputs];
    float v16 = objc_msgSend(v14, "subarrayWithRange:", 1, objc_msgSend(v15, "count") - 1);
    [*(id *)(a1 + 32) setKeyboardOutputs:v16];

    uint64_t v18 = *(void *)(a1 + 32);
    char v17 = *(void **)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    goto LABEL_11;
  }
  v7[171] = 0;
  if (![v3 deletionCount])
  {
    char v20 = [v3 insertionText];

    uint64_t v21 = [*(id *)(a1 + 32) keyboardOutputs];
    uint64_t v22 = [*(id *)(a1 + 32) keyboardOutputs];
    uint64_t v23 = objc_msgSend(v21, "subarrayWithRange:", 1, objc_msgSend(v22, "count") - 1);
    [*(id *)(a1 + 32) setKeyboardOutputs:v23];

    id v24 = *(void **)(a1 + 40);
    if (v20)
    {
      v25 = [v3 insertionText];
      v9 = [v24 physicalKeyboardEventWithInput:v25 inputFlags:128];

      v26 = *(void **)(a1 + 40);
      int v27 = [v3 insertionText];
      int v28 = *(void **)(a1 + 48);
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      v37 = __86___UIKeyboardStateManager__processInputViewControllerKeyboardOutput_executionContext___block_invoke_3;
      v38 = &unk_1E52E3628;
      int8x16_t v34 = *(int8x16_t *)(a1 + 32);
      id v29 = (id)v34.i64[0];
      int8x16_t v39 = vextq_s8(v34, v34, 8uLL);
      uint64_t v30 = [v28 childWithContinuation:&v35];
      [v26 _handleWebKeyEvent:v9 withInputString:v27 executionContext:v30];

      goto LABEL_9;
    }
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 48);
    char v17 = *(void **)(a1 + 40);
LABEL_11:
    [v17 _processInputViewControllerKeyboardOutput:v18 executionContext:v19];
    goto LABEL_12;
  }
  uint64_t v8 = objc_alloc_init(_UIInputViewKeyboardOutput);
  -[_UIInputViewKeyboardOutput setDeletionCount:](v8, "setDeletionCount:", [v3 deletionCount] - 1);
  [v3 setDeletionCount:0];
  v9 = [*(id *)(a1 + 40) physicalKeyboardEventWithInput:@"\x7F" inputFlags:128];
  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = *(void **)(a1 + 48);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __86___UIKeyboardStateManager__processInputViewControllerKeyboardOutput_executionContext___block_invoke_2;
  v40[3] = &unk_1E52E36F0;
  v40[4] = v10;
  v41 = v8;
  id v42 = v3;
  id v43 = *(id *)(a1 + 32);
  v12 = v8;
  __int16 v13 = [v11 childWithContinuation:v40];
  [v10 _handleWebKeyEvent:v9 withInputString:@"\x7F" executionContext:v13];

LABEL_9:
LABEL_12:
  if (objc_msgSend(v3, "deletionCount", *(_OWORD *)&v34, v35, v36, v37, v38))
  {
    unsigned int v31 = [*(id *)(a1 + 40) inputDelegateManager];
    v32 = [v31 delegateRespectingForwardingDelegate:0];
    char v33 = [v32 hasText];

    if ((v33 & 1) == 0) {
      [*(id *)(a1 + 40) setInitialDirection];
    }
  }
LABEL_15:
}

void __86___UIKeyboardStateManager__processInputViewControllerKeyboardOutput_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 performKeyboardOutput:v4];
  [*(id *)(a1 + 48) setPositionOffset:0];
  [*(id *)(a1 + 32) _performInputViewControllerOutput:*(void *)(a1 + 56)];
  [v5 returnExecutionToParent];
}

void __86___UIKeyboardStateManager__processInputViewControllerKeyboardOutput_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 _performInputViewControllerOutput:v3];
  [v4 returnExecutionToParent];
}

void __44___UIKeyboardStateManager_setDocumentState___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v1 = (void *)qword_1EB25F870;
  qword_1EB25F870 = v0;
}

void __50___UIKeyboardStateManager_shouldAllowRepeatEvent___block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  v6[0] = v0;
  id v1 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  v6[1] = v1;
  v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v6[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  id v5 = (void *)qword_1EB25F880;
  qword_1EB25F880 = v4;
}

uint64_t __79___UIKeyboardStateManager_handleKeyCommand_repeatOkay_beforePublicKeyCommands___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) handleKeyCommand:*(void *)(a1 + 40) repeatOkay:*(void *)(a1 + 56) options:*(unsigned __int8 *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result != 0;
  return result;
}

id __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke(uint64_t a1)
{
  v8[6] = *MEMORY[0x1E4F143B8];
  v7[0] = @"KeyboardEventType";
  v7[1] = @"Operation";
  v8[0] = @"TextEditing";
  v8[1] = @"Using modifier key";
  v8[2] = @"HWKeyboard";
  v7[2] = @"TriggerType";
  v7[3] = @"UsingShiftKey";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v8[3] = v2;
  v7[4] = @"UsingCommandKey";
  uint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v8[4] = v3;
  v7[5] = @"UnmodifiedInput";
  uint64_t v4 = [*(id *)(a1 + 32) _unmodifiedInput];
  v8[5] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];

  return v5;
}

uint64_t __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v4 = [*(id *)(a1 + 32) _delegateRequiresKeyEvents];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v5 inputDelegateManager];
    char v7 = [v6 canPerformAction:a2 withSender:0];
  }
  else
  {
    uint64_t v6 = [v5 inputDelegate];
    char v7 = objc_opt_respondsToSelector();
  }
  char v8 = v7;

  return v8 & 1;
}

uint64_t __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  int v4 = [*(id *)(a1 + 32) _delegateRequiresKeyEvents];
  id v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    v9 = [v5 inputDelegateManager];
    uint64_t v10 = [v9 selectableDelegate];
    char v8 = objc_opt_respondsToSelector();

LABEL_6:
    return v8 & 1;
  }
  uint64_t v6 = [v5 inputDelegate];
  char v7 = [v6 canPerformAction:a2 withSender:0];

  if ((v7 & 1) == 0)
  {
    v9 = [*(id *)(a1 + 32) inputDelegateManager];
    char v8 = [v9 canPerformAction:a2 withSender:0];
    goto LABEL_6;
  }
  char v8 = 1;
  return v8 & 1;
}

BOOL __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) inputDelegateManager];
  uint64_t v3 = [*(id *)(a1 + 32) inputDelegateManager];
  int v4 = [v3 selectedTextRange];
  id v5 = [v4 start];
  BOOL v6 = [v2 baseWritingDirectionForPosition:v5 inDirection:0] == 1;

  return v6;
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_5(uint64_t a1)
{
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  if (*(unsigned char *)(a1 + 64))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2();
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) || *(unsigned char *)(a1 + 65)) {
      return;
    }
    int v4 = *(void **)(a1 + 32);
    uint64_t v3 = a1 + 32;
    id v8 = [v4 inputDelegateManager];
    uint64_t v5 = [v8 _moveToStartOfWord:*(unsigned __int8 *)(v3 + 34) withHistory:*(void *)(v3 + 8)];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2();
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) || *(unsigned char *)(a1 + 65)) {
      return;
    }
    BOOL v6 = *(void **)(a1 + 32);
    uint64_t v3 = a1 + 32;
    id v8 = [v6 inputDelegateManager];
    uint64_t v5 = [v8 _moveToEndOfWord:*(unsigned __int8 *)(v3 + 34) withHistory:*(void *)(v3 + 8)];
  }
  char v7 = (void *)v5;
  [*(id *)v3 setArrowKeyHistory:v5];
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_6(uint64_t a1)
{
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  if (*(unsigned char *)(a1 + 64))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2();
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) || *(unsigned char *)(a1 + 65)) {
      return;
    }
    int v4 = *(void **)(a1 + 32);
    uint64_t v3 = a1 + 32;
    id v8 = [v4 inputDelegateManager];
    uint64_t v5 = [v8 _moveToEndOfWord:*(unsigned __int8 *)(v3 + 34) withHistory:*(void *)(v3 + 8)];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2();
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) || *(unsigned char *)(a1 + 65)) {
      return;
    }
    BOOL v6 = *(void **)(a1 + 32);
    uint64_t v3 = a1 + 32;
    id v8 = [v6 inputDelegateManager];
    uint64_t v5 = [v8 _moveToStartOfWord:*(unsigned __int8 *)(v3 + 34) withHistory:*(void *)(v3 + 8)];
  }
  char v7 = (void *)v5;
  [*(id *)v3 setArrowKeyHistory:v5];
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_7(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) inputDelegateManager];
  v2 = [v3 _moveToEndOfParagraph:*(unsigned __int8 *)(a1 + 48) withHistory:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setArrowKeyHistory:v2];
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_8(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) inputDelegateManager];
  v2 = [v3 _moveToEndOfDocument:*(unsigned __int8 *)(a1 + 48) withHistory:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setArrowKeyHistory:v2];
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_9(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) inputDelegateManager];
  v2 = [v3 _moveToStartOfParagraph:*(unsigned __int8 *)(a1 + 48) withHistory:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setArrowKeyHistory:v2];
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_10(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) inputDelegateManager];
  v2 = [v3 _moveToStartOfDocument:*(unsigned __int8 *)(a1 + 48) withHistory:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setArrowKeyHistory:v2];
}

id __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_11(uint64_t a1)
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"KeyboardEventType";
  v4[1] = @"Operation";
  v5[0] = @"TextEditing";
  v5[1] = @"Using modifier key";
  v4[2] = @"TriggerType";
  v4[3] = @"KeyCommand";
  uint64_t v1 = *(void *)(a1 + 32);
  v5[2] = @"HWKeyboard";
  v5[3] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_12(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _targetForResponderCommand:sel_copy_];
  [v1 copy:0];
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_13(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _targetForResponderCommand:sel_paste_];
  [v1 paste:0];
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_14(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _targetForResponderCommand:sel_cut_];
  [v1 cut:0];
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_15(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _targetForResponderCommand:sel_pasteAndMatchStyle_];
  [v1 pasteAndMatchStyle:0];
}

void __67___UIKeyboardStateManager_handleInputManagerBasedKeybind_testOnly___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_851 copy];
  id v1 = (void *)qword_1EB25F890;
  qword_1EB25F890 = v0;
}

uint64_t __67___UIKeyboardStateManager_handleInputManagerBasedKeybind_testOnly___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __67___UIKeyboardStateManager_handleInputManagerBasedKeybind_testOnly___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67___UIKeyboardStateManager_handleInputManagerBasedKeybind_testOnly___block_invoke_4;
  v5[3] = &unk_1E52E34C8;
  v5[4] = v2;
  int v4 = [a2 childWithContinuation:v5];
  [v2 handleKeyboardInput:v3 executionContext:v4];
}

void __67___UIKeyboardStateManager_handleInputManagerBasedKeybind_testOnly___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = a2;
  if ([v3 delayedCandidateList])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 776));
    uint64_t v5 = [WeakRetained candidateController];
    BOOL v6 = [v5 inlineCandidateView];

    if (v6) {
      [*(id *)(a1 + 32) removeCandidateList];
    }
  }
  [*(id *)(a1 + 32) generateCandidates];
  [v7 returnExecutionToParent];
}

void __156___UIKeyboardStateManager_setMarkedText_selectedRange_inputString_lastInputString_searchString_candidateOffset_liveConversionSegments_highlighSegmentIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = [a2 rangeValue];
  NSUInteger v7 = v6;
  unint64_t v8 = v5 + v6;
  unint64_t v9 = [*(id *)(a1 + 32) length];
  if (v5 >= v7) {
    NSUInteger v10 = v7;
  }
  else {
    NSUInteger v10 = v5;
  }
  if (v8 <= v9 && v8 >= v10)
  {
    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)off_1E52D2178;
    char v17 = [NSNumber numberWithUnsignedInteger:a3];
    objc_msgSend(v15, "addAttribute:value:range:", v16, v17, v5, v7);

    if (*(void *)(a1 + 48) == a3)
    {
      if (+[UIKeyboard isRedesignedTextCursorEnabled])
      {
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
        *(void *)(v18 + 32) = v5;
        *(void *)(v18 + 40) = v7;
      }
      else
      {
        uint64_t v19 = *(void **)(a1 + 32);
        uint64_t v20 = *(void *)off_1E52D1F58;
        id v21 = +[UIColor tertiaryLabelColor];
        objc_msgSend(v19, "addAttribute:value:range:", v20);
      }
    }
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __int16 v13 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        goto LABEL_12;
      }
      v27.location = v5;
      v27.length = v7;
      v14 = NSStringFromRange(v27);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v14;
      _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "illegal range %@ in liveConversionSegments", buf, 0xCu);
LABEL_11:

LABEL_12:
      return;
    }
    v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &kbLineSeparator_block_invoke_3___s_category) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = v12;
      v26.location = v5;
      v26.length = v7;
      v14 = NSStringFromRange(v26);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v14;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "illegal range %@ in liveConversionSegments", buf, 0xCu);
      goto LABEL_11;
    }
  }
}

void __125___UIKeyboardStateManager__setAttributedMarkedText_selectedRange_inputString_lastInputString_searchString_compareAttributes___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_869 copy];
  id v1 = (void *)qword_1EB25F8A0;
  qword_1EB25F8A0 = v0;
}

uint64_t __125___UIKeyboardStateManager__setAttributedMarkedText_selectedRange_inputString_lastInputString_searchString_compareAttributes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __125___UIKeyboardStateManager__setAttributedMarkedText_selectedRange_inputString_lastInputString_searchString_compareAttributes___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 inputDelegate];
  [v2 textChanged:v4 executionContext:v3];
}

void __125___UIKeyboardStateManager__setAttributedMarkedText_selectedRange_inputString_lastInputString_searchString_compareAttributes___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 markedTextRange];
  unint64_t v5 = v4;
  if ([*(id *)(a1 + 32) candidateViewOffset] >= v4)
  {
    [*(id *)(a1 + 32) setCharacterRectsForCharacterRange:0];
  }
  else
  {
    NSUInteger v6 = objc_msgSend(v7, "characterRectsForCharacterRange:", v3, v5);
    [*(id *)(a1 + 32) setCharacterRectsForCharacterRange:v6];
  }
}

uint64_t __86___UIKeyboardStateManager_smartSelectionForTextInDocument_inRange_options_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  [*(id *)(a1 + 32) signal];
  v2 = *(void **)(a1 + 32);
  return [v2 unlock];
}

void __59___UIKeyboardStateManager_syncDocumentStateToInputDelegate__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_881 copy];
  id v1 = (void *)qword_1EB25F8B0;
  qword_1EB25F8B0 = v0;
}

uint64_t __59___UIKeyboardStateManager_syncDocumentStateToInputDelegate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __59___UIKeyboardStateManager_syncDocumentStateToInputDelegate__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) syncDocumentStateToInputDelegateWithExecutionContext:a2];
}

void __58___UIKeyboardStateManager_documentStateFromInputDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  uint64_t v3 = [v16 contextBefore];
  if ((unint64_t)[v3 length] >= 0x65)
  {
    uint64_t v4 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 100);

    uint64_t v3 = (void *)v4;
  }
  unint64_t v5 = [v16 contextAfter];
  if ((unint64_t)[v5 length] >= 0x65)
  {
    uint64_t v6 = [v5 substringToIndex:100];

    unint64_t v5 = (void *)v6;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = objc_alloc(MEMORY[0x1E4FAE2A8]);
  unint64_t v9 = [v16 markedText];
  uint64_t v10 = [v9 length];
  if (v10)
  {
    uint64_t v11 = [v16 markedText];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = [v16 selectedText];
  uint64_t v13 = [v16 selectedRangeInMarkedText];
  uint64_t v15 = objc_msgSend(v8, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v3, v11, v12, v5, v13, v14);
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v15);

  if (v10) {
}
  }

void __58___UIKeyboardStateManager_documentStateFromInputDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (objc_class *)MEMORY[0x1E4FAE2A8];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v13 = [v4 contextBeforeSelection];
  uint64_t v6 = [v4 markedText];
  uint64_t v7 = [v4 selectedText];
  id v8 = [v4 contextAfterSelection];
  uint64_t v9 = [v4 rangeInMarkedText];
  uint64_t v11 = v10;

  v12 = objc_msgSend(v5, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v13, v6, v7, v8, v9, v11);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v12);
}

void __80___UIKeyboardStateManager_syncDocumentStateToInputDelegateWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1EB25F8C8 != -1) {
    dispatch_once(&qword_1EB25F8C8, &__block_literal_global_884);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80___UIKeyboardStateManager_syncDocumentStateToInputDelegateWithExecutionContext___block_invoke_4;
  v7[3] = &unk_1E52E3880;
  id v4 = *(void **)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = qword_1EB25F8C0;
  id v6 = v3;
  [v4 transferExecutionToMainThreadWithTask:v7 breadcrumb:v5];
}

void __80___UIKeyboardStateManager_syncDocumentStateToInputDelegateWithExecutionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_886 copy];
  id v1 = (void *)qword_1EB25F8C0;
  qword_1EB25F8C0 = v0;
}

uint64_t __80___UIKeyboardStateManager_syncDocumentStateToInputDelegateWithExecutionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __80___UIKeyboardStateManager_syncDocumentStateToInputDelegateWithExecutionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v14 = a2;
  [*(id *)(a1 + 32) setDocumentState:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 171) = 1;
  id v3 = *(unsigned char **)(a1 + 32);
  if (v3[509] || v3[511])
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v11 = [v3 inputDelegate];
    if (objc_opt_respondsToSelector())
    {
      v12 = [*(id *)(a1 + 32) inputDelegate];
      id v13 = [v12 _rtiSourceSession];
      BOOL v4 = v13 != 0;
    }
    else
    {
      BOOL v4 = 0;
    }

    id v3 = *(unsigned char **)(a1 + 32);
  }
  uint64_t v5 = [v3 inputDelegateManager];
  char v6 = [v5 hasAsyncCapableInputDelegate];

  if ((v4 || (v6 & 1) != 0 || ([*(id *)(*(void *)(a1 + 32) + 136) isSecureTextEntry] & 1) == 0)
    && ([*(id *)(a1 + 32) isCallingTextChangedDuringInputModeSwitch] & 1) == 0)
  {
    uint64_t v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v8 = [v7 _textInputSessionAnalytics];
    uint64_t v9 = [*(id *)(a1 + 40) _selectedTextRange];
    objc_msgSend(v8, "didChangeToSelection:relativeRangeBefore:", v9, v10, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  [v14 returnExecutionToParent];
}

void __52___UIKeyboardStateManager_prepareForSelectionChange__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 464);
  *(void *)(v1 + 464) = 0;
}

void __52___UIKeyboardStateManager_updateForChangedSelection__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_902 copy];
  uint64_t v1 = (void *)qword_1EB25F8D0;
  qword_1EB25F8D0 = v0;
}

uint64_t __52___UIKeyboardStateManager_updateForChangedSelection__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __52___UIKeyboardStateManager_updateForChangedSelection__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 121) = 1;
  uint64_t result = [*(id *)(a1 + 32) updateForChangedSelectionWithExecutionContext:a2];
  *(unsigned char *)(*(void *)(a1 + 32) + 121) = 0;
  return result;
}

uint64_t __73___UIKeyboardStateManager_updateForChangedSelectionWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 returnExecutionToParent];
}

uint64_t __73___UIKeyboardStateManager_updateForChangedSelectionWithExecutionContext___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 returnExecutionToParent];
}

void __73___UIKeyboardStateManager_updateForChangedSelectionWithExecutionContext___block_invoke_3(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 508) = *(unsigned char *)(*(void *)(a1 + 32) + 320);
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73___UIKeyboardStateManager_updateForChangedSelectionWithExecutionContext___block_invoke_4;
  v4[3] = &unk_1E52E34C8;
  void v4[4] = v2;
  id v3 = [a2 childWithContinuation:v4];
  [v2 syncInputManagerToKeyboardStateWithExecutionContext:v3];
}

void __73___UIKeyboardStateManager_updateForChangedSelectionWithExecutionContext___block_invoke_4(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 508) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  id v8 = a2;
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v4 = [v3 visualModeManager];
  int v5 = [v4 useVisualModeWindowed];

  if ([*(id *)(a1 + 32) shouldGenerateCandidatesAfterSelectionChange])
  {
    char v6 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    if ([v6 oldPathForSnapshot])
    {
      int v7 = +[UIKeyboard isKeyboardProcess] | v5;

      if (v7 != 1) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) generateCandidates];
  }
LABEL_7:
  [*(id *)(a1 + 32) completeUpdateForChangedSelection:1];
  [v8 returnExecutionToParent];
}

void __46___UIKeyboardStateManager_selectionDidChange___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_914 copy];
  uint64_t v1 = (void *)qword_1EB25F8E0;
  qword_1EB25F8E0 = v0;
}

uint64_t __46___UIKeyboardStateManager_selectionDidChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __46___UIKeyboardStateManager_selectionDidChange___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 320) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 121) = 1;
  uint64_t result = [*(id *)(a1 + 32) updateForChangedSelectionWithExecutionContext:a2];
  *(unsigned char *)(*(void *)(a1 + 32) + 121) = 0;
  return result;
}

void __46___UIKeyboardStateManager_selectionDidChange___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_920 copy];
  uint64_t v1 = (void *)qword_1EB25F8F0;
  qword_1EB25F8F0 = v0;
}

uint64_t __46___UIKeyboardStateManager_selectionDidChange___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __46___UIKeyboardStateManager_selectionDidChange___block_invoke_6(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 511) = 1;
  uint64_t result = [*(id *)(a1 + 32) updateForChangedSelectionWithExecutionContext:a2];
  *(unsigned char *)(*(void *)(a1 + 32) + 509) = 0;
  return result;
}

void __46___UIKeyboardStateManager_selectionDidChange___block_invoke_7()
{
  uint64_t v0 = [&__block_literal_global_926 copy];
  uint64_t v1 = (void *)qword_1EB25F900;
  qword_1EB25F900 = v0;
}

uint64_t __46___UIKeyboardStateManager_selectionDidChange___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __46___UIKeyboardStateManager_selectionDidChange___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v2 remoteTextInputPartner];
  [v3 documentStateChanged];

  [v4 returnExecutionToParent];
}

void __58___UIKeyboardStateManager_syncInputManagerToKeyboardState__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_943 copy];
  uint64_t v1 = (void *)qword_1EB25F910;
  qword_1EB25F910 = v0;
}

uint64_t __58___UIKeyboardStateManager_syncInputManagerToKeyboardState__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __58___UIKeyboardStateManager_syncInputManagerToKeyboardState__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) syncInputManagerToKeyboardStateWithExecutionContext:a2];
}

void __79___UIKeyboardStateManager_syncInputManagerToKeyboardStateWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1EB25F928 != -1) {
    dispatch_once(&qword_1EB25F928, &__block_literal_global_945);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79___UIKeyboardStateManager_syncInputManagerToKeyboardStateWithExecutionContext___block_invoke_4;
  v7[3] = &unk_1E52E3628;
  id v4 = *(void **)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v5 = qword_1EB25F920;
  id v6 = v3;
  [v4 transferExecutionToMainThreadWithTask:v7 breadcrumb:v5];
}

void __79___UIKeyboardStateManager_syncInputManagerToKeyboardStateWithExecutionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_947 copy];
  uint64_t v1 = (void *)qword_1EB25F920;
  qword_1EB25F920 = v0;
}

uint64_t __79___UIKeyboardStateManager_syncInputManagerToKeyboardStateWithExecutionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __79___UIKeyboardStateManager_syncInputManagerToKeyboardStateWithExecutionContext___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 syncKeyboardToConfiguration:v3];
  [v4 returnExecutionToParent];
}

void __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _UIKeyboardLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Keyboard receives output from kbd", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_954;
  aBlock[3] = &unk_1E52E3918;
  id v8 = *(id *)(a1 + 32);
  v32[1] = *(id *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 40);
  id v29 = v8;
  uint64_t v30 = v9;
  char v33 = *(unsigned char *)(a1 + 80);
  objc_copyWeak(v32, (id *)(a1 + 64));
  char v34 = *(unsigned char *)(a1 + 81);
  long long v18 = *(_OWORD *)(a1 + 48);
  id v10 = (id)v18;
  long long v31 = v18;
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = [*(id *)(a1 + 48) takeOwnershipOfPendingCompletionBlock];
  id v13 = (void *)v12;
  if (!*(unsigned char *)(a1 + 81) || v12)
  {
    if (qword_1EB25F938 != -1) {
      dispatch_once(&qword_1EB25F938, &__block_literal_global_1004);
    }
    id v14 = *(void **)(a1 + 48);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_5;
    v23[3] = &unk_1E52E3940;
    id v26 = v11;
    id v24 = v5;
    id v25 = v6;
    id v27 = v13;
    [v14 transferExecutionToMainThreadWithTask:v23 breadcrumb:qword_1EB25F930];
    uint64_t v15 = &v26;
    id v16 = &v24;
    char v17 = &v25;

    goto LABEL_11;
  }
  if (!pthread_main_np())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_6;
    block[3] = &unk_1E52E3968;
    uint64_t v15 = &v22;
    id v22 = v11;
    id v16 = &v20;
    id v20 = v5;
    char v17 = &v21;
    id v21 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
LABEL_11:

    goto LABEL_12;
  }
  (*((void (**)(void *, id, id, void))v11 + 2))(v11, v5, v6, 0);
LABEL_12:

  objc_destroyWeak(v32);
}

void __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_954(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  kdebug_trace();
  kac_get_log();
  uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, *(const void **)(a1 + 32));
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v11, OS_SIGNPOST_INTERVAL_END, v13, "appInput", " enableTelemetry=YES ", buf, 2u);
    }
  }

  double v14 = CACurrentMediaTime();
  unint64_t v15 = 0x1E4F39000uLL;
  uint64_t v16 = [MEMORY[0x1E4F39CF8] startFrameWithReason:32 beginTime:v14 commitDeadline:v14 + _UIQOSMaxFrameDurationSeconds()];
  [MEMORY[0x1E4F39CF8] setFrameInputTime:v16 withToken:*(double *)(a1 + 72)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 776));
  [(id)objc_opt_class() sendPerformanceNotification:@"UIKeyboardPerformanceHandleInputResponseNotification"];

  long long v18 = UIKeyboardGetCurrentInputMode();
  if (!*(unsigned char *)(a1 + 80)) {
    goto LABEL_7;
  }
  uint64_t v19 = [v8 customInfo];
  if (v19) {
    goto LABEL_6;
  }
  uint64_t v19 = [v8 insertionText];
  id v49 = v9;
  if (v19)
  {
    v44 = *(void **)(a1 + 40);
    v45 = (void *)MEMORY[0x1E4FAE318];
    id v4 = [v8 insertionText];
    id v9 = [v45 candidateWithCandidate:v4 forInput:0];
    if ([v44 shouldApplyAcceptedAutocorrection:v9])
    {

      id v9 = v49;
      unint64_t v15 = 0x1E4F39000;
LABEL_6:

LABEL_7:
      id v20 = objc_loadWeakRetained((id *)(a1 + 64));
      if (+[UIKeyboard isKeyboardProcess]
        && v20
        && ([v8 customInfo],
            id v21 = objc_claimAutoreleasedReturnValue(),
            uint64_t v22 = [v21 count],
            v21,
            v22))
      {
        uint64_t v23 = [*(id *)(a1 + 40) remoteTextInputPartner];
        id v24 = [v8 customInfo];
        [v23 forwardAutofillPayload:v24 toPayloadDelegate:v20];
      }
      else
      {
        int v25 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "conformsToProtocol:", &unk_1ED5EA530, v49);
        id v26 = *(id **)(a1 + 40);
        if (v25)
        {
          [v26[5] performOutput:v8];
        }
        else
        {
          [v26 updateKeyboardOutput:v8 withInputForSmartPunctuation:*(void *)(a1 + 32) keyboardConfiguration:v9];
          id v27 = [*(id *)(a1 + 40) inputSystemSourceSession];
          int v28 = [v27 textOperations];

          id v49 = v9;
          uint64_t v29 = [v9 multilingualLanguages];
          uint64_t v30 = (void *)v29;
          if (v29) {
            uint64_t v31 = v29;
          }
          else {
            uint64_t v31 = MEMORY[0x1E4F1CBF0];
          }
          [v28 setMultilingualLanguages:v31];

          if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 8) {
            uint64_t v32 = 8;
          }
          else {
            uint64_t v32 = 1;
          }
          char v33 = *(void **)(a1 + 40);
          uint64_t v50 = MEMORY[0x1E4F143A8];
          uint64_t v51 = 3221225472;
          uint64_t v52 = __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_1001;
          unsigned int v53 = &unk_1E52DCB30;
          unsigned int v54 = v33;
          id v55 = *(id *)(a1 + 32);
          id v34 = v8;
          id v56 = v34;
          if ([*(id *)(a1 + 40) isInHardwareKeyboardMode]) {
            uint64_t v35 = 4;
          }
          else {
            uint64_t v35 = v32;
          }
          [v33 performOperations:&v50 withTextInputSource:v35];
          uint64_t v36 = *(void **)(a1 + 40);
          if (v36[53])
          {
            v37 = [v36 remoteTextInputPartner];
            [v37 documentStateChanged];
          }
          v38 = [v34 insertionText];
          int v39 = [v38 _containsEmojiOnly];

          unint64_t v15 = 0x1E4F39000uLL;
          if (v39)
          {
            id v40 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 776));
            char v41 = [v40 isEmojiPopoverVisibleOrDismissing];

            if ((v41 & 1) == 0) {
              +[UIKBAnalyticsDispatcher emojiInsertedByMethod:@"Touch" inputType:@"Keyboard"];
            }
          }

          id v9 = v49;
        }
      }

      goto LABEL_29;
    }
  }
  v46 = objc_msgSend(v8, "acceptedCandidate", v49);
  uint64_t v47 = [v46 customInfoType];

  if (v19)
  {
  }
  BOOL v48 = v47 == 4096;
  id v9 = v49;
  unint64_t v15 = 0x1E4F39000;
  if (v48) {
    goto LABEL_7;
  }
LABEL_29:
  id v42 = UIKeyboardGetCurrentInputMode();
  int v43 = [v18 isEqualToString:v42];

  if (v43) {
    [*(id *)(a1 + 40) syncKeyboardToConfiguration:v9];
  }
  if (*(unsigned char *)(a1 + 81))
  {
    if (v10) {
      v10[2](v10);
    }
  }
  else
  {
    [*(id *)(a1 + 48) returnExecutionToParent];
  }
  objc_msgSend(*(id *)(v15 + 3320), "finishFrameWithToken:", v16, v49, v50, v51, v52, v53, v54);
}

void __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_1001(id *a1)
{
  if ([a1[4] showingEmojiSearch])
  {
    id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 97);
    if ([WeakRetained isEmojiPopoverPresented])
    {
      uint64_t v3 = [a1[5] touchEvent];
      BOOL v4 = v3 == 0;
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 1;
  }
  id v5 = a1[4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  v6[4] = v5;
  id v7 = a1[6];
  [v5 _performKeyboardOutput:v6 respectingForwardingDelegate:v4];
}

uint64_t __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performKeyboardOutput:*(void *)(a1 + 40)];
}

void __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_3()
{
  uint64_t v0 = [&__block_literal_global_1006 copy];
  uint64_t v1 = (void *)qword_1EB25F930;
  qword_1EB25F930 = v0;
}

uint64_t __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], a1[7]);
}

uint64_t __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_6(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained returnExecutionToParent];
}

void __62___UIKeyboardStateManager_replaceAllTextInResponder_withText___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1013 copy];
  uint64_t v1 = (void *)qword_1EB25F940;
  qword_1EB25F940 = v0;
}

uint64_t __62___UIKeyboardStateManager_replaceAllTextInResponder_withText___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __62___UIKeyboardStateManager_replaceAllTextInResponder_withText___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v3 = [v2 _editMenuAssistant];
  [v3 cancelDelayedCommandRequests];

  [v4 returnExecutionToParent];
}

void __48___UIKeyboardStateManager_performKeyboardEvent___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1041 copy];
  uint64_t v1 = (void *)qword_1EB25F950;
  qword_1EB25F950 = v0;
}

uint64_t __48___UIKeyboardStateManager_performKeyboardEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __48___UIKeyboardStateManager_performKeyboardEvent___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 _handleKeyCommand:v3];
  [v4 returnExecutionToParent];
}

void __48___UIKeyboardStateManager_performKeyboardEvent___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_1047 copy];
  uint64_t v1 = (void *)qword_1EB25F960;
  qword_1EB25F960 = v0;
}

uint64_t __48___UIKeyboardStateManager_performKeyboardEvent___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __48___UIKeyboardStateManager_performKeyboardEvent___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleKeyEvent:*(void *)(a1 + 40) executionContext:a2];
}

void __60___UIKeyboardStateManager_performKeyboardOutputAsRTIClient___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1051 copy];
  uint64_t v1 = (void *)qword_1EB25F970;
  qword_1EB25F970 = v0;
}

uint64_t __60___UIKeyboardStateManager_performKeyboardOutputAsRTIClient___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __60___UIKeyboardStateManager_performKeyboardOutputAsRTIClient___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 performKeyboardOutput:v3 checkingDelegate:0 forwardToRemoteInputSource:0];
  [v4 returnExecutionToParent];
}

void __93___UIKeyboardStateManager_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_copyTo:");
  if (+[UIKeyboard usesInputSystemUI])
  {
    if (!+[UIKeyboard isKeyboardProcess])
    {
      if ([*(id *)(a1 + 40) usesCandidateSelection])
      {
        uint64_t v3 = [v13 acceptedCandidate];
        if (v3)
        {
          id v4 = (void *)v3;
          id v5 = [v13 textToCommit];
          if ([v5 length])
          {
          }
          else
          {
            id v6 = [v13 insertionText];
            uint64_t v7 = [v6 length];

            if (!v7) {
              [v13 setAcceptedCandidate:0];
            }
          }
        }
      }
    }
  }
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v8 = [*(id *)(a1 + 40) inputManagerState];
    if ([v8 commitsAcceptedCandidate])
    {
    }
    else
    {
      id v9 = [v13 acceptedCandidate];
      id v10 = [v9 candidate];
      uint64_t v11 = [v13 textToCommit];
      int v12 = [v10 isEqualToString:v11];

      if (v12) {
        [v13 setTextToCommit:0];
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void __93___UIKeyboardStateManager_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93___UIKeyboardStateManager_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke_3;
    block[3] = &unk_1E52D9F70;
    id v5 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __93___UIKeyboardStateManager_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke_3(uint64_t a1)
{
  id v2 = +[UIKeyboardMediaController sharedKeyboardMediaController];
  [v2 handleStickerSuggestionWithTISticker:*(void *)(a1 + 32)];
}

void __93___UIKeyboardStateManager_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 insertionText];
  [v3 replaceAllTextInResponder:v5 withText:v6];

  uint64_t v7 = [*(id *)(a1 + 32) autofillController];
  [v7 showASPInTextField:v5 isRightToLeft:*(unsigned __int8 *)(a1 + 48)];

  id v8 = [*(id *)(a1 + 32) autofillController];
  [v8 addTemporaryTextColorToTextField:v5];
}

uint64_t __93___UIKeyboardStateManager_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke_1067(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _copyTo:a2];
}

void __87___UIKeyboardStateManager_generateCandidatesAsynchronouslyWithRange_selectedCandidate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1EB25F988 != -1) {
    dispatch_once(&qword_1EB25F988, &__block_literal_global_1084);
  }
  id v4 = [*(id *)(a1 + 32) taskQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87___UIKeyboardStateManager_generateCandidatesAsynchronouslyWithRange_selectedCandidate___block_invoke_4;
  v11[3] = &unk_1E52E3A50;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v6;
  id v8 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v14 = v3;
  uint64_t v16 = v7;
  id v15 = v8;
  uint64_t v9 = qword_1EB25F980;
  id v10 = v3;
  [v4 addDeferredTask:v11 breadcrumb:v9];
}

void __87___UIKeyboardStateManager_generateCandidatesAsynchronouslyWithRange_selectedCandidate___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1086 copy];
  uint64_t v1 = (void *)qword_1EB25F980;
  qword_1EB25F980 = v0;
}

uint64_t __87___UIKeyboardStateManager_generateCandidatesAsynchronouslyWithRange_selectedCandidate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __87___UIKeyboardStateManager_generateCandidatesAsynchronouslyWithRange_selectedCandidate___block_invoke_4(uint64_t a1, void *a2)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87___UIKeyboardStateManager_generateCandidatesAsynchronouslyWithRange_selectedCandidate___block_invoke_5;
  v11[3] = &unk_1E52E3A50;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id v12 = v4;
  uint64_t v13 = v5;
  id v7 = v6;
  uint64_t v9 = *(void **)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  id v14 = v7;
  uint64_t v16 = v8;
  id v15 = v9;
  id v10 = [a2 childWithContinuation:v11];
  [v10 returnExecutionToParent];
}

void __87___UIKeyboardStateManager_generateCandidatesAsynchronouslyWithRange_selectedCandidate___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) currentCandidateRequest];
  LODWORD(v4) = [v4 isSameRequestAs:v5];

  if (v4)
  {
    [*(id *)(a1 + 40) inputManagerDidGenerateCandidateResultSet:*(void *)(a1 + 48)];
    kdebug_trace();
    kac_get_log();
    uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(a1 + 64));
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v8 = v7;
      if (os_signpost_enabled(v6))
      {
        *(_WORD *)id v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v6, OS_SIGNPOST_INTERVAL_END, v8, "appCandidates", " enableTelemetry=YES ", v12, 2u);
      }
    }

    uint64_t v9 = [*(id *)(a1 + 48) committedText];

    if (v9)
    {
      [*(id *)(a1 + 40) generateCandidatesWithOptions:2];
    }
    else if ([*(id *)(a1 + 48) inputManagerHasPendingCandidatesUpdate])
    {
      objc_msgSend(*(id *)(a1 + 40), "generateCandidatesAsynchronouslyWithRange:selectedCandidate:", 0, 0, 0);
    }
    else
    {
      id v10 = [*(id *)(a1 + 56) inputForMarkedText];
      if ([v10 length])
      {
      }
      else
      {
        uint64_t v11 = [*(id *)(a1 + 48) generatedCandidateCount];

        if (!v11) {
          [*(id *)(a1 + 40) _postInputResponderCapabilitiesChangedNotificationWithOutput:0 selectionChanged:1];
        }
      }
    }
  }
  [v3 returnExecutionToParent];
}

uint64_t __74___UIKeyboardStateManager__inputManagerDidGenerateSupplementalCandidates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAutocorrectionIgnoringCaseAndDiacriticsAndSupplementalItemPrefix] ^ 1;
}

void __70___UIKeyboardStateManager_generateAutocorrectionWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1EB25F998 != -1) {
    dispatch_once(&qword_1EB25F998, &__block_literal_global_1096);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70___UIKeyboardStateManager_generateAutocorrectionWithExecutionContext___block_invoke_4;
  v7[3] = &unk_1E52E3628;
  id v4 = *(void **)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v5 = qword_1EB25F990;
  id v6 = v3;
  [v4 transferExecutionToMainThreadWithTask:v7 breadcrumb:v5];
}

void __70___UIKeyboardStateManager_generateAutocorrectionWithExecutionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1098 copy];
  uint64_t v1 = (void *)qword_1EB25F990;
  qword_1EB25F990 = v0;
}

uint64_t __70___UIKeyboardStateManager_generateAutocorrectionWithExecutionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __70___UIKeyboardStateManager_generateAutocorrectionWithExecutionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  *(void *)(*(void *)(a1 + 32) + 640) = [v3 sourceForAutocorrection];
  [*(id *)(a1 + 32) inputManagerDidGenerateAutocorrections:*(void *)(a1 + 40) executionContext:v4];
}

void __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[UIKeyboardImpl activeInstance];
  uint64_t v5 = [v4 textInputTraits];
  id v6 = [v5 inputContextHistory];

  os_signpost_id_t v7 = [*(id *)(a1 + 32) candidate];
  uint64_t v8 = -[v7 length];

  uint64_t v9 = [*(id *)(a1 + 32) candidate];
  uint64_t v10 = [v9 length];

  uint64_t v11 = [*(id *)(a1 + 40) inputDelegateManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke_2;
  v15[3] = &unk_1E52DCB30;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  id v16 = v12;
  uint64_t v17 = v13;
  id v18 = v6;
  id v14 = v6;
  objc_msgSend(v11, "adjustSelection:completionHandler:", v8, v10, v15);

  [v3 returnExecutionToParent];
}

void __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke_2(id *a1)
{
  if (objc_opt_respondsToSelector())
  {
    id v2 = [a1[4] smartReplySourceCandidate];
    id v7 = [v2 candidate];
  }
  else
  {
    id v7 = 0;
  }
  id v3 = [a1[5] inputDelegateManager];
  id v4 = [v3 textInputDelegate];
  uint64_t v5 = [a1[4] candidate];
  id v6 = [a1[6] tiInputContextHistory];
  [v4 _startWritingToolsWithTool:@"WTUIRequestedToolSmartReply" prompt:v5 entryPoint:v7 inputContextHistory:v6 sender:a1[5]];
}

void __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setAutocorrectionToAcceptBeforeProgressiveCandidates:0];
  [*(id *)(a1 + 32) inputManagerDidGenerateAutocorrections:*(void *)(a1 + 40) executionContext:v4];
}

void __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) predictions];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4FAE278];
    uint64_t v5 = [*(id *)(a1 + 32) predictions];
    id v6 = [*(id *)(a1 + 32) emojiList];
    id v7 = [v4 listWithPredictions:v5 emojiList:v6 proactiveTriggers:0];

    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = [*(id *)(a1 + 32) corrections];
    uint64_t v10 = [v9 autocorrection];
    [v8 inputManagerDidGenerateAutocorrections:v7 forPredictiveInput:v10 executionContext:v11];
  }
  else
  {
    [v11 returnExecutionToParent];
  }
}

uint64_t __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) forceReloadInputViews];
}

void __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke_6(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) inlineTextCompletionController];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) inlineTextCompletionController];
    [v4 updateTextCompletionPromptExecutionContext:v5];
  }
  else
  {
    [v5 returnExecutionToParent];
  }
}

uint64_t __80___UIKeyboardStateManager__insertSupplementalCandidate_overridingCandidateText___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 autocorrectionController];
  [v11 setTextSuggestionList:0];

  id v12 = [*(id *)(a1 + 32) inputDelegateManager];
  [v12 insertSupplementalItem:v10 candidate:v9 replacementRange:v8];

  *(_DWORD *)(*(void *)(a1 + 32) + 540) = 0;
  [*(id *)(a1 + 32) syncInputManagerToKeyboardState];
  return 1;
}

void __108___UIKeyboardStateManager__acceptAutofillCandidateRequiringAuthentication_payloadDelegate_executionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (qword_1EB25F9A8 != -1) {
    dispatch_once(&qword_1EB25F9A8, &__block_literal_global_1113);
  }
  id v7 = [*(id *)(a1 + 32) taskQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __108___UIKeyboardStateManager__acceptAutofillCandidateRequiringAuthentication_payloadDelegate_executionContext___block_invoke_4;
  v9[3] = &unk_1E52E3B10;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v9[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v10 = v8;
  [v7 addTask:v9 breadcrumb:qword_1EB25F9A0];

  objc_destroyWeak(&v11);
}

void __108___UIKeyboardStateManager__acceptAutofillCandidateRequiringAuthentication_payloadDelegate_executionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1115 copy];
  uint64_t v1 = (void *)qword_1EB25F9A0;
  qword_1EB25F9A0 = v0;
}

uint64_t __108___UIKeyboardStateManager__acceptAutofillCandidateRequiringAuthentication_payloadDelegate_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __108___UIKeyboardStateManager__acceptAutofillCandidateRequiringAuthentication_payloadDelegate_executionContext___block_invoke_4(id *a1, void *a2)
{
  id v3 = a1 + 6;
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    id v6 = [a1[4] remoteTextInputPartner];
    id v7 = [a1[5] customInfo];
    [v6 forwardAutofillPayload:v7 toPayloadDelegate:WeakRetained];
  }
  else
  {
    id v8 = _UIKeyboardImplLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Cannot forward autofill payload to client: autofill payload delegate is nil", v9, 2u);
    }
  }
  [v4 returnExecutionToParent];
}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (qword_1EB25F9B8 != -1) {
    dispatch_once(&qword_1EB25F9B8, &__block_literal_global_1118);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_4;
  v13[3] = &unk_1E52E36F0;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v6;
  id v17 = v5;
  uint64_t v10 = qword_1EB25F9B0;
  id v11 = v5;
  id v12 = v6;
  [v7 transferExecutionToMainThreadWithTask:v13 breadcrumb:v10];
}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1120 copy];
  uint64_t v1 = (void *)qword_1EB25F9B0;
  qword_1EB25F9B0 = v0;
}

uint64_t __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  v70[2] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 isSupplementalItemCandidate];
  id v6 = *(void **)(a1 + 40);
  if (v5)
  {
    id v7 = [v6 remoteTextInputPartner];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [*(id *)(a1 + 48) textToCommit];
    uint64_t v10 = objc_msgSend(v7, "textOperation_insertSupplementalCandidate:textToCommit:", v8, v9);

    uint64_t v11 = [*(id *)(a1 + 40) inputSystemSourceSession];
    id v12 = (void *)v11;
    if (v10 && v11)
    {
      uint64_t v13 = [v10 customInfoType];
      id v14 = [v12 textOperations];
      [v14 setCustomInfoType:v13];

      uint64_t v15 = [v10 customInfo];
      id v16 = [v12 textOperations];
      [v16 setCustomInfo:v15];

      [v12 flushOperations];
    }
  }
  else
  {
    id v17 = [v6 inputDelegateManager];
    id v18 = [v17 forwardingInputDelegate];

    if (!v18)
    {
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_5;
      v68[3] = &unk_1E52E3A28;
      uint64_t v19 = *(void **)(a1 + 40);
      id v69 = *(id *)(a1 + 48);
      [v19 performKeyboardOutputOnInputSourceSession:v68];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_6;
      v66[3] = &unk_1E52E3A28;
      id v20 = *(void **)(a1 + 40);
      id v67 = *(id *)(a1 + 48);
      [v20 performKeyboardOutputOnInputSourceSession:v66];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_7;
      v64[3] = &unk_1E52E3A28;
      id v21 = *(void **)(a1 + 40);
      id v65 = *(id *)(a1 + 48);
      [v21 performKeyboardOutputOnInputSourceSession:v64];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_8;
      v62[3] = &unk_1E52E3A28;
      uint64_t v22 = *(void **)(a1 + 40);
      id v63 = *(id *)(a1 + 32);
      [v22 performKeyboardOutputOnInputSourceSession:v62];
    }
  }
  uint64_t v23 = [*(id *)(a1 + 48) textToCommit];
  if (v23)
  {
    id v24 = [*(id *)(a1 + 40) inputDelegate];

    if (v24
      && ([*(id *)(a1 + 40) inputDelegateManager],
          int v25 = objc_claimAutoreleasedReturnValue(),
          int v26 = objc_msgSend(v25, "callShouldReplaceExtendedRange:withText:includeMarkedText:", objc_msgSend(*(id *)(a1 + 48), "deletionCount"), v23, objc_msgSend(*(id *)(a1 + 40), "_hasMarkedText")), v25, !v26))
    {
      [*(id *)(a1 + 40) unmarkText:&stru_1ED0E84C0];
      char v36 = 0;
    }
    else
    {
      if (([*(id *)(a1 + 40) _hasMarkedText] & 1) == 0
        && [*(id *)(a1 + 48) deletionCount])
      {
        id v27 = [*(id *)(a1 + 48) insertionText];
        BOOL v28 = v27 == 0;

        objc_msgSend(*(id *)(a1 + 40), "deleteBackwardAndNotifyAtEnd:deletionCount:reinsertTextInLoop:", v28, objc_msgSend(*(id *)(a1 + 48), "deletionCount"), 0);
      }
      if ([*(id *)(a1 + 32) isSlottedCandidate]
        && [v23 hasPrefix:@"https://"])
      {
        uint64_t v29 = [*(id *)(a1 + 40) documentState];
        uint64_t v30 = [v29 contextBeforeInput];

        if ([v30 length])
        {
          uint64_t v31 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          char v32 = objc_msgSend(v31, "characterIsMember:", objc_msgSend(v30, "characterAtIndex:", objc_msgSend(v30, "length") - 1));

          if ((v32 & 1) == 0)
          {
            uint64_t v33 = [@" " stringByAppendingString:v23];

            uint64_t v23 = (void *)v33;
          }
        }
      }
      int v34 = [*(id *)(a1 + 32) isSupplementalItemCandidate];
      uint64_t v35 = *(void **)(a1 + 40);
      if (v34)
      {
        [v35 _willReplaceText:v23 withSupplementalCandidate:*(void *)(a1 + 32)];
        [*(id *)(a1 + 40) unmarkText:v23];
        [*(id *)(a1 + 40) _didReplaceText:v23 withSupplementalCandidate:*(void *)(a1 + 32)];
      }
      else
      {
        [v35 unmarkText:v23];
      }
      char v36 = 1;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 776));
    v38 = [WeakRetained candidateController];
    int v39 = [v38 barIsExtended];

    if (v39)
    {
      id v40 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 776));
      char v41 = [v40 candidateController];
      [v41 collapse];
    }
    id v42 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 776));
    int v43 = [v42 candidateController];
    v44 = [v43 inlineCandidateView];

    if (v44) {
      [*(id *)(a1 + 40) removeCandidateList];
    }
  }
  else
  {
    char v36 = 1;
  }
  if (+[UIKeyboard isKeyboardProcess]
    || !v23
    || ![*(id *)(a1 + 32) isSupplementalItemCandidate]
    || ([*(id *)(a1 + 40) _insertSupplementalCandidate:*(void *)(a1 + 32) overridingCandidateText:v23] & 1) == 0)
  {
    v45 = [*(id *)(a1 + 48) customInfo];

    if (v45)
    {
      v46 = *(void **)(a1 + 40);
      uint64_t v47 = [*(id *)(a1 + 48) customInfo];
      [v46 performKeyboardOutputInfo:v47];
    }
  }
  BOOL v48 = [*(id *)(a1 + 48) acceptedCandidate];
  if (([v48 customInfoType] & 0x1000) != 0)
  {
    id v49 = [*(id *)(a1 + 48) acceptedCandidate];
    uint64_t v50 = [v49 stickerIdentifier];

    if (!v50) {
      goto LABEL_40;
    }
    BOOL v48 = [*(id *)(a1 + 40) backendController];
    uint64_t v51 = [*(id *)(a1 + 48) acceptedCandidate];
    uint64_t v52 = [v51 stickerIdentifier];
    v70[0] = @"com.apple.stickers.role.still";
    v70[1] = @"com.apple.stickers.role.animated";
    unsigned int v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
    [v48 stickerWithIdentifier:v52 stickerRoles:v53 completionHandler:&__block_literal_global_1128];
  }
LABEL_40:
  uint64_t v54 = [*(id *)(a1 + 32) cursorMovement];
  char v55 = v36 ^ 1;
  if (!v54) {
    char v55 = 1;
  }
  if ((v55 & 1) == 0)
  {
    uint64_t v56 = v54;
    uint64_t v57 = *(void *)(a1 + 40);
    char v58 = *(unsigned char *)(v57 + 508);
    *(unsigned char *)(v57 + 508) = 1;
    v59 = *(void **)(a1 + 40);
    char v60 = [v59 documentState];
    char v61 = [v60 documentStateAfterCursorAdjustment:v56];
    [v59 setDocumentState:v61];

    [*(id *)(a1 + 40) moveCursorByAmount:v56];
    *(unsigned char *)(*(void *)(a1 + 40) + 508) = v58;
  }
  [*(id *)(a1 + 40) syncKeyboardToConfiguration:*(void *)(a1 + 56)];
  [v4 returnExecutionToParent];
}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setDeletionCount:", objc_msgSend(v2, "deletionCount"));
}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 textToCommit];
  [v3 setTextToCommit:v4];
}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 customInfo];
  [v3 setCustomInfo:v4];
}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setPositionOffset:", objc_msgSend(v2, "cursorMovement"));
}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_10;
    block[3] = &unk_1E52D9F70;
    id v5 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_10(uint64_t a1)
{
  id v2 = +[UIKeyboardMediaController sharedKeyboardMediaController];
  [v2 handleStickerSuggestionWithTISticker:*(void *)(a1 + 32)];
}

void __92___UIKeyboardStateManager_generateReplacementsForString_candidatesHandler_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1EB25F9C8 != -1) {
    dispatch_once(&qword_1EB25F9C8, &__block_literal_global_1130);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92___UIKeyboardStateManager_generateReplacementsForString_candidatesHandler_executionContext___block_invoke_4;
  v8[3] = &unk_1E52E3B88;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v5;
  uint64_t v6 = qword_1EB25F9C0;
  id v7 = v3;
  [v4 transferExecutionToMainThreadWithTask:v8 breadcrumb:v6];
}

void __92___UIKeyboardStateManager_generateReplacementsForString_candidatesHandler_executionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1132 copy];
  uint64_t v1 = (void *)qword_1EB25F9C0;
  qword_1EB25F9C0 = v0;
}

uint64_t __92___UIKeyboardStateManager_generateReplacementsForString_candidatesHandler_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __92___UIKeyboardStateManager_generateReplacementsForString_candidatesHandler_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  id v5 = a2;
  v4(v2, v3);
  [v5 returnExecutionToParent];
}

BOOL __53___UIKeyboardStateManager_skipHitTestForTouchEvents___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stage] != 5;
}

uint64_t __88___UIKeyboardStateManager_performHitTestForTouchEvents_executionContextPassingNSNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  if (qword_1EB25F9D8 != -1) {
    dispatch_once(&qword_1EB25F9D8, &__block_literal_global_1138);
  }
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88___UIKeyboardStateManager_performHitTestForTouchEvents_executionContextPassingNSNumber___block_invoke_4;
  v6[3] = &__block_descriptor_40_e40_v16__0__UIKeyboardTaskExecutionContext_8l;
  v6[4] = a2;
  return [v4 transferExecutionToMainThreadWithTask:v6 breadcrumb:qword_1EB25F9D0];
}

void __88___UIKeyboardStateManager_performHitTestForTouchEvents_executionContextPassingNSNumber___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1140 copy];
  uint64_t v1 = (void *)qword_1EB25F9D0;
  qword_1EB25F9D0 = v0;
}

uint64_t __88___UIKeyboardStateManager_performHitTestForTouchEvents_executionContextPassingNSNumber___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __88___UIKeyboardStateManager_performHitTestForTouchEvents_executionContextPassingNSNumber___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 numberWithInteger:v3];
  [v4 returnExecutionToParentWithInfo:v5];
}

void __95___UIKeyboardStateManager_adjustPhraseBoundaryInForwardDirection_granularity_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1EB25F9E8 != -1) {
    dispatch_once(&qword_1EB25F9E8, &__block_literal_global_1144);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95___UIKeyboardStateManager_adjustPhraseBoundaryInForwardDirection_granularity_executionContext___block_invoke_4;
  v7[3] = &unk_1E52E3628;
  id v4 = *(void **)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v5 = qword_1EB25F9E0;
  id v6 = v3;
  [v4 transferExecutionToMainThreadWithTask:v7 breadcrumb:v5];
}

void __95___UIKeyboardStateManager_adjustPhraseBoundaryInForwardDirection_granularity_executionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1146 copy];
  uint64_t v1 = (void *)qword_1EB25F9E0;
  qword_1EB25F9E0 = v0;
}

uint64_t __95___UIKeyboardStateManager_adjustPhraseBoundaryInForwardDirection_granularity_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __95___UIKeyboardStateManager_adjustPhraseBoundaryInForwardDirection_granularity_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 syncKeyboardToConfiguration:v4];
  [*(id *)(a1 + 32) didChangePhraseBoundary];
  [v5 returnExecutionToParent];
}

uint64_t __55___UIKeyboardStateManager_removeAllDynamicDictionaries__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void __61___UIKeyboardStateManager_desirableInputModesWithExtensions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  id v8 = v3;
  if ((!*(unsigned char *)(a1 + 64) || (char v5 = [v3 isExtensionInputMode], v4 = v8, (v5 & 1) == 0))
    && ((v6 = [v4 isAllowedForTraits:*(void *)(*(void *)(a1 + 32) + 136)], uint64_t v4 = v8, (v6 & 1) != 0)
     || *(void *)(a1 + 40) && (v7 = objc_msgSend(v8, "isAllowedForTraits:"), uint64_t v4 = v8, v7)))
  {
    [*(id *)(a1 + 48) addObject:v4];
    if (*(void *)(a1 + 40) && objc_msgSend(v8, "isAllowedForTraits:")) {
      [*(id *)(a1 + 56) addObject:v8];
    }
  }
  else if ([v4 isExtensionInputMode])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 220) = 1;
  }
}

void __43___UIKeyboardStateManager_notifyShiftState__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1177 copy];
  uint64_t v1 = (void *)qword_1EB25F9F0;
  qword_1EB25F9F0 = v0;
}

uint64_t __43___UIKeyboardStateManager_notifyShiftState__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __43___UIKeyboardStateManager_notifyShiftState__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained shiftKeyStateChangedFrom:*(unsigned int *)(a1 + 40) to:*(unsigned int *)(a1 + 44)];

  [v5 returnExecutionToParent];
}

uint64_t __60___UIKeyboardStateManager_handleDeleteWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 returnExecutionToParent];
}

void __39___UIKeyboardStateManager_handleDelete__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1219 copy];
  uint64_t v1 = (void *)qword_1EB25FA08;
  qword_1EB25FA08 = v0;
}

uint64_t __39___UIKeyboardStateManager_handleDelete__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __39___UIKeyboardStateManager_handleDelete__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleDeleteWithExecutionContext:a2];
}

void __38___UIKeyboardStateManager_handleClear__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1223 copy];
  uint64_t v1 = (void *)qword_1EB25FA18;
  qword_1EB25FA18 = v0;
}

uint64_t __38___UIKeyboardStateManager_handleClear__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __38___UIKeyboardStateManager_handleClear__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleClearWithExecutionContext:a2];
}

void __158___UIKeyboardStateManager_handleMoveCursorToStartOfLine_beforePublicKeyCommands_testOnly_savedHistory_force_canHandleSelectableInputDelegateCommand_keyEvent___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) inputDelegateManager];
  uint64_t v2 = [v3 _moveToStartOfLine:*(unsigned __int8 *)(a1 + 48) withHistory:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setArrowKeyHistory:v2];
}

void __156___UIKeyboardStateManager_handleMoveCursorToEndOfLine_beforePublicKeyCommands_testOnly_savedHistory_force_canHandleSelectableInputDelegateCommand_keyEvent___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) inputDelegateManager];
  uint64_t v2 = [v3 _moveToEndOfLine:*(unsigned __int8 *)(a1 + 48) withHistory:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setArrowKeyHistory:v2];
}

void __241___UIKeyboardStateManager_handleHorizontalArrow_shiftDown_beforePublicKeyCommands_testOnly_isVerticalCandidate_hasCandidatesForTypedInput_shouldNavigateCandidateList_canHandleInputDelegateCommand_savedHistory_keyCommandTypeHandled_keyEvent___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) inputDelegateManager];
  uint64_t v2 = [v3 _moveRight:*(unsigned __int8 *)(a1 + 48) withHistory:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setArrowKeyHistory:v2];
}

void __241___UIKeyboardStateManager_handleHorizontalArrow_shiftDown_beforePublicKeyCommands_testOnly_isVerticalCandidate_hasCandidatesForTypedInput_shouldNavigateCandidateList_canHandleInputDelegateCommand_savedHistory_keyCommandTypeHandled_keyEvent___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) inputDelegateManager];
  uint64_t v2 = [v3 _moveLeft:*(unsigned __int8 *)(a1 + 48) withHistory:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setArrowKeyHistory:v2];
}

void __239___UIKeyboardStateManager_handleVerticalArrow_shiftDown_beforePublicKeyCommands_testOnly_isVerticalCandidate_hasCandidatesForTypedInput_inputDelegateCommandEnabled_canHandleInputDelegateCommand_savedHistory_keyCommandTypeHandled_keyEvent___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) inputDelegateManager];
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v3;
  BOOL v5 = *(unsigned __int8 *)(a1 + 49) != 0;
  if (v2) {
    [v3 _moveDown:v5 withHistory:v4];
  }
  else {
  char v6 = [v3 _moveUp:v5 withHistory:v4];
  }
  [*(id *)(a1 + 32) setArrowKeyHistory:v6];
}

void __72___UIKeyboardStateManager_deleteForwardAndNotify_producedByDeleteInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setForwardDeletionCount:1];
  [v3 setProducedByDeleteInput:*(unsigned __int8 *)(a1 + 32)];
}

void __87___UIKeyboardStateManager__handleKeyInputMethodCommandForEvent_canHandleAppKeyCommand___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1240 copy];
  uint64_t v1 = (void *)qword_1EB25FA28;
  qword_1EB25FA28 = v0;
}

uint64_t __87___UIKeyboardStateManager__handleKeyInputMethodCommandForEvent_canHandleAppKeyCommand___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __87___UIKeyboardStateManager__handleKeyInputMethodCommandForEvent_canHandleAppKeyCommand___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(v3 + 507);
  *(unsigned char *)(v3 + 507) = 0;
  uint64_t result = [*(id *)(a1 + 32) handleKeyWithString:*(void *)(a1 + 40) forKeyEvent:*(void *)(a1 + 48) executionContext:a2];
  *(unsigned char *)(*(void *)(a1 + 32) + 507) = v4;
  return result;
}

uint64_t __62___UIKeyboardStateManager_handleReplacement_forSpaceAndInput___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeletionCount:1];
}

void __62___UIKeyboardStateManager_handleReplacement_forSpaceAndInput___block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 acceptedCandidate];
  [v3 setAcceptedCandidate:v4];
}

void __60___UIKeyboardStateManager__scheduleInputAdditionOrDeletion___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1249 copy];
  uint64_t v1 = (void *)qword_1EB25FA38;
  qword_1EB25FA38 = v0;
}

uint64_t __60___UIKeyboardStateManager__scheduleInputAdditionOrDeletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __52___UIKeyboardStateManager_addInputString_withFlags___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addInputString:*(void *)(a1 + 40) withFlags:*(void *)(a1 + 48) executionContext:a2];
}

uint64_t __73___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addInputString:*(void *)(a1 + 40) withFlags:*(void *)(a1 + 56) withInputManagerHint:*(void *)(a1 + 48) executionContext:a2];
}

void __90___UIKeyboardStateManager__addInputString_withFlags_withInputManagerHint_withInputSource___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1253 copy];
  uint64_t v1 = (void *)qword_1EB25FA48;
  qword_1EB25FA48 = v0;
}

uint64_t __90___UIKeyboardStateManager__addInputString_withFlags_withInputManagerHint_withInputSource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __90___UIKeyboardStateManager__addInputString_withFlags_withInputManagerHint_withInputSource___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addInputString:*(void *)(a1 + 40) withFlags:*(void *)(a1 + 56) withInputManagerHint:*(void *)(a1 + 48) withInputSource:*(void *)(a1 + 64) executionContext:a2];
}

void __106___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint_withInputSource_executionContext___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) inputManagerState];
  if (![v2 newInputAcceptsUserSelectedCandidate]) {
    goto LABEL_6;
  }
  id v3 = [*(id *)(a1 + 32) inputManagerState];
  if (([v3 inputStringAcceptsCurrentCandidateIfSelected:*(void *)(a1 + 40)] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  char v4 = [*(id *)(*(void *)(a1 + 32) + 624) longPredictionListEnabled];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = *(void **)(a1 + 32);
    BOOL v6 = v5[5] != 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __106___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint_withInputSource_executionContext___block_invoke_2;
    v12[3] = &unk_1E52E3560;
    v12[4] = v5;
    BOOL v14 = v6;
    id v7 = *(void **)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    id v8 = [v7 childWithContinuation:v12];
    [v5 acceptCurrentCandidateIfSelectedWithExecutionContext:v8];

    return;
  }
LABEL_7:
  [*(id *)(a1 + 32) setUserSelectedCurrentCandidate:0];
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 56);
  id v11 = [*(id *)(a1 + 48) childWithContinuation:&__block_literal_global_1273];
  [v9 addInputEvent:v10 executionContext:v11];
}

void __106___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint_withInputSource_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 216) = *(unsigned char *)(a1 + 48);
  BOOL v5 = *(void **)(a1 + 32);
  char v4 = *(void **)(a1 + 40);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __106___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint_withInputSource_executionContext___block_invoke_3;
  id v11 = &unk_1E52E3628;
  id v12 = v5;
  id v6 = v4;
  id v13 = v6;
  id v7 = [a2 childWithContinuation:&v8];
  objc_msgSend(v5, "addInputEvent:executionContext:", v6, v7, v8, v9, v10, v11, v12);

  *(unsigned char *)(*(void *)(a1 + 32) + 216) = 0;
}

void __106___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint_withInputSource_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([(id)objc_opt_class() _isInputEligibleForSpaceAutodelete:*(void *)(a1 + 40)]) {
    *(unsigned char *)(*(void *)(a1 + 32) + 170) = 1;
  }
  +[UIKBAnalyticsDispatcher didCandidateReplacement];
  [v3 returnExecutionToParent];
}

void __106___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint_withInputSource_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  +[UIKBAnalyticsDispatcher didCandidateReplacement];
  [v2 returnExecutionToParent];
}

void __58___UIKeyboardStateManager_addInputEvent_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = [v15 info];
  if (v3)
  {
    char v4 = (void *)v3;
    BOOL v5 = [v15 info];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = [v15 info];
      [v7 handleFailureInMethod:v8, v9, @"_UIKeyboardStateManager.m", 12209, @"UIKeyboardTask %s expected TIKeyboardCandidate but received %@", "-[_UIKeyboardStateManager addInputEvent:executionContext:]_block_invoke", v10 object file lineNumber description];
    }
  }
  id v11 = [v15 info];
  id v12 = v11;
  if (*(void *)(a1 + 40)
    && ([v11 candidate],
        id v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 hasSuffix:*(void *)(a1 + 40)],
        v13,
        v14))
  {
    [*(id *)(a1 + 32) completeAddInputString:*(void *)(a1 + 40)];
    [v15 returnExecutionToParent];
  }
  else
  {
    [*(id *)(a1 + 32) addWordTerminator:*(void *)(a1 + 48) afterSpace:*(unsigned __int8 *)(a1 + 72) afterAcceptingCandidate:v12 elapsedTime:v15 executionContext:*(double *)(a1 + 64)];
  }
}

void __58___UIKeyboardStateManager_addInputEvent_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v11 = a2;
  char v4 = [v3 autocorrectionController];
  if ([v4 hasAutocorrection])
  {
    BOOL v5 = [*(id *)(a1 + 32) autocorrectionController];
    id v6 = [v5 autocorrection];
    int v7 = [v6 isForShortcutConversion];

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v10 = [v9 shouldShowLongPredictionList];
      goto LABEL_6;
    }
  }
  else
  {

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
  }
  uint64_t v10 = 1;
LABEL_6:
  [v9 completeAddInputString:v8 generateCandidates:v10];
  [v11 returnExecutionToParent];
}

void __65___UIKeyboardStateManager_acceptAutocorrectionForWordTerminator___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1281 copy];
  uint64_t v1 = (void *)qword_1EB25FA58;
  qword_1EB25FA58 = v0;
}

uint64_t __65___UIKeyboardStateManager_acceptAutocorrectionForWordTerminator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __65___UIKeyboardStateManager_acceptAutocorrectionForWordTerminator___block_invoke_3(void *a1, void *a2)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65___UIKeyboardStateManager_acceptAutocorrectionForWordTerminator___block_invoke_4;
  v5[3] = &unk_1E52E3D70;
  v5[4] = a1[6];
  char v4 = [a2 childWithContinuation:v5];
  [v2 acceptAutocorrectionForWordTerminator:v3 executionContextPassingTIKeyboardCandidate:v4];
}

void __65___UIKeyboardStateManager_acceptAutocorrectionForWordTerminator___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 info];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [v6 returnExecutionToParent];
}

void __108___UIKeyboardStateManager_acceptAutocorrectionForWordTerminator_executionContextPassingTIKeyboardCandidate___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [v14 info];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    BOOL v5 = [v14 info];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      int v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = [v14 info];
      [v7 handleFailureInMethod:v8, v9, @"_UIKeyboardStateManager.m", 12302, @"UIKeyboardTask %s expected TIKeyboardCandidate but received %@", "-[_UIKeyboardStateManager acceptAutocorrectionForWordTerminator:executionContextPassingTIKeyboardCandidate:]_block_invoke", v10 object file lineNumber description];
    }
  }
  id v11 = [v14 info];
  NSSelectorFromString(&cfstr_Learningflags.isa);
  if (objc_opt_respondsToSelector())
  {
    id v12 = [*(id *)(a1 + 40) valueForKey:@"learningFlags"];
    uint64_t v13 = [v12 unsignedIntValue];

    [*(id *)(a1 + 32) didAcceptAutocorrection:v11 inputCandidate:*(void *)(a1 + 40) wordTerminator:*(void *)(a1 + 48) learningFlagsMask:v13];
  }
  else
  {
    [*(id *)(a1 + 32) didAcceptAutocorrection:v11 inputCandidate:*(void *)(a1 + 40) wordTerminator:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 32) setAutocorrection:0];
  [v14 returnExecutionToParentWithInfo:v11];
}

uint64_t __60___UIKeyboardStateManager_inputWordForTerminatorAtSelection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 inputManagerState];
  uint64_t v5 = [v4 stringEndsWord:v3];

  return v5;
}

void __60___UIKeyboardStateManager_insertedAccentVariantFromPopover___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1291 copy];
  uint64_t v1 = (void *)qword_1EB25FA68;
  qword_1EB25FA68 = v0;
}

uint64_t __60___UIKeyboardStateManager_insertedAccentVariantFromPopover___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __60___UIKeyboardStateManager_insertedAccentVariantFromPopover___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteFromInputWithFlags:1024 executionContext:a2];
}

void __60___UIKeyboardStateManager_insertedAccentVariantFromPopover___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_1297 copy];
  uint64_t v1 = (void *)qword_1EB25FA78;
  qword_1EB25FA78 = v0;
}

uint64_t __60___UIKeyboardStateManager_insertedAccentVariantFromPopover___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __60___UIKeyboardStateManager_insertedAccentVariantFromPopover___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4FAE328];
  id v4 = a2;
  id v7 = objc_alloc_init(v3);
  [v7 setString:*(void *)(a1 + 32)];
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [v4 childWithContinuation:&__block_literal_global_1299];

  [v5 handleKeyboardInput:v7 executionContext:v6];
}

uint64_t __60___UIKeyboardStateManager_insertedAccentVariantFromPopover___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 returnExecutionToParent];
}

void __58___UIKeyboardStateManager_handleEmojiInput_keyboardState___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1303 copy];
  uint64_t v1 = (void *)qword_1EB25FA88;
  qword_1EB25FA88 = v0;
}

uint64_t __58___UIKeyboardStateManager_handleEmojiInput_keyboardState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __58___UIKeyboardStateManager_handleEmojiInput_keyboardState___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58___UIKeyboardStateManager_handleEmojiInput_keyboardState___block_invoke_4;
  aBlock[3] = &unk_1E52E3DE8;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = [*(id *)(a1 + 32) backendController];
  [v6 handleKeyboardInput:*(void *)(a1 + 40) keyboardState:*(void *)(a1 + 48) completionHandler:v5];
}

uint64_t __58___UIKeyboardStateManager_handleEmojiInput_keyboardState___block_invoke_4(uint64_t a1)
{
  if (qword_1EB25FAA0 != -1) {
    dispatch_once(&qword_1EB25FAA0, &__block_literal_global_1305);
  }
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = qword_1EB25FA98;
  return [v2 transferExecutionToMainThreadWithTask:&__block_literal_global_1309 breadcrumb:v3];
}

void __58___UIKeyboardStateManager_handleEmojiInput_keyboardState___block_invoke_5()
{
  uint64_t v0 = [&__block_literal_global_1307 copy];
  uint64_t v1 = (void *)qword_1EB25FA98;
  qword_1EB25FA98 = v0;
}

uint64_t __58___UIKeyboardStateManager_handleEmojiInput_keyboardState___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __58___UIKeyboardStateManager_handleEmojiInput_keyboardState___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 returnExecutionToParentWithInfo:0];
}

uint64_t __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAcceptedCandidate:*(void *)(a1 + 32)];
}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  [*(id *)(a1 + 32) setDocumentStateForAutocorrection:*(void *)(a1 + 40)];
  if (qword_1EB25FAB0 != -1) {
    dispatch_once(&qword_1EB25FAB0, &__block_literal_global_1314);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_5;
  v13[3] = &unk_1E52E3E10;
  double v15 = a2;
  double v16 = a3;
  double v17 = a4;
  double v18 = a5;
  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = *(void **)(a1 + 48);
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v10;
  long long v12 = *(_OWORD *)(a1 + 72);
  long long v19 = *(_OWORD *)(a1 + 56);
  long long v20 = v12;
  [v11 transferExecutionToMainThreadWithTask:v13 breadcrumb:qword_1EB25FAA8];

  *(unsigned char *)(*(void *)(a1 + 32) + 508) = 0;
}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_3()
{
  uint64_t v0 = [&__block_literal_global_1316 copy];
  uint64_t v1 = (void *)qword_1EB25FAA8;
  qword_1EB25FAA8 = v0;
}

uint64_t __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (CGRectIsEmpty(*(CGRect *)(a1 + 48)))
  {
    [v4 returnExecutionToParent];
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) _textChoicesAssistant];
    [v3 trackUnderlineForWebKitCandidate:*(void *)(a1 + 40)];

    objc_msgSend(*(id *)(a1 + 32), "animateAutocorrectionToRect:fromRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    objc_msgSend(*(id *)(a1 + 32), "didApplyAutocorrection:autocorrectPromptFrame:", *(void *)(a1 + 40), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    [v4 returnExecutionToParentWithInfo:*(void *)(a1 + 40)];
  }
}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_6(uint64_t a1, double a2, double a3, double a4, double a5)
{
  [*(id *)(a1 + 32) setDocumentStateForAutocorrection:*(void *)(a1 + 40)];
  if (qword_1EB25FAC0 != -1) {
    dispatch_once(&qword_1EB25FAC0, &__block_literal_global_1319);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_9;
  v13[3] = &unk_1E52E3E10;
  double v15 = a2;
  double v16 = a3;
  double v17 = a4;
  double v18 = a5;
  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = *(void **)(a1 + 48);
  void v13[4] = *(void *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 72);
  long long v19 = *(_OWORD *)(a1 + 56);
  long long v20 = v12;
  id v14 = v10;
  [v11 transferExecutionToMainThreadWithTask:v13 breadcrumb:qword_1EB25FAB8];

  *(unsigned char *)(*(void *)(a1 + 32) + 508) = 0;
}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_7()
{
  uint64_t v0 = [&__block_literal_global_1321 copy];
  uint64_t v1 = (void *)qword_1EB25FAB8;
  qword_1EB25FAB8 = v0;
}

uint64_t __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (CGRectIsEmpty(*(CGRect *)(a1 + 48)))
  {
    [v3 returnExecutionToParent];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "animateAutocorrectionToRect:fromRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    objc_msgSend(*(id *)(a1 + 32), "didApplyAutocorrection:autocorrectPromptFrame:", *(void *)(a1 + 40), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    [v3 returnExecutionToParentWithInfo:*(void *)(a1 + 40)];
  }
}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  [v3 rect];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  [v3 rect];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

uint64_t __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  [a2 firstRect];
  id v3 = *(uint64_t (**)(uint64_t))(v2 + 16);
  return v3(v2);
}

void __109___UIKeyboardStateManager_addWordTerminator_afterSpace_afterAcceptingCandidate_elapsedTime_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v12 = a2;
  id v4 = [v3 autocorrectionController];
  if ([v4 hasAutocorrection])
  {
    uint64_t v5 = [*(id *)(a1 + 32) autocorrectionController];
    id v6 = [v5 autocorrection];
    char v7 = [v6 isForShortcutConversion] ^ 1;
  }
  else
  {
    char v7 = 1;
  }

  char v8 = [*(id *)(a1 + 40) isContinuousPathConversion];
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = 1;
  if ((v7 & 1) == 0 && (v8 & 1) == 0) {
    uint64_t v11 = [v9 shouldShowLongPredictionList];
  }
  [v9 completeAddInputString:v10 generateCandidates:v11];
  [v12 returnExecutionToParent];
}

void __69___UIKeyboardStateManager_movePhraseBoundaryToDirection_granularity___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1333 copy];
  uint64_t v1 = (void *)qword_1EB25FAC8;
  qword_1EB25FAC8 = v0;
}

uint64_t __69___UIKeyboardStateManager_movePhraseBoundaryToDirection_granularity___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __69___UIKeyboardStateManager_movePhraseBoundaryToDirection_granularity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) adjustPhraseBoundaryInForwardDirection:*(void *)(a1 + 40) == 0 granularity:*(unsigned int *)(a1 + 48) executionContext:a2];
}

void __67___UIKeyboardStateManager_deleteOnceFromInputWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 40);
  id v4 = a2;
  [v2 completeDeleteOnceFromInputWithCharacterBefore:v3];
  [v4 returnExecutionToParent];
}

void __53___UIKeyboardStateManager__deleteFromInputWithFlags___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1337 copy];
  uint64_t v1 = (void *)qword_1EB25FAD8;
  qword_1EB25FAD8 = v0;
}

uint64_t __53___UIKeyboardStateManager__deleteFromInputWithFlags___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __53___UIKeyboardStateManager__deleteFromInputWithFlags___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteFromInputWithFlags:*(void *)(a1 + 40) executionContext:a2];
}

uint64_t __52___UIKeyboardStateManager_deleteFromInputWithFlags___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteFromInputWithFlags:*(void *)(a1 + 40) executionContext:a2];
}

void __49___UIKeyboardStateManager_undoWithKeyboardInput___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1344 copy];
  uint64_t v1 = (void *)qword_1EB25FAE8;
  qword_1EB25FAE8 = v0;
}

uint64_t __49___UIKeyboardStateManager_undoWithKeyboardInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __49___UIKeyboardStateManager_undoWithKeyboardInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleKeyboardInput:*(void *)(a1 + 40) executionContext:a2];
}

void __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v9 = a2;
  if ([v9 _containsEmojiOnly])
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 1;
    *a7 = 1;
  }
  else if ([v9 _isSpace])
  {
    ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  }
  else
  {
    uint64_t v10 = (void *)a1[4];
    uint64_t v11 = [v10 length];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_2;
    v12[3] = &unk_1E52E3F28;
    v12[4] = a1[5];
    objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 259, v12);
    *a7 = 1;
  }
}

uint64_t __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a4;
  *a7 = 1;
  return result;
}

uint64_t __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 deleteBackward:*(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

void __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_1349 copy];
  uint64_t v1 = (void *)qword_1EB25FAF8;
  qword_1EB25FAF8 = v0;
}

uint64_t __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteOnceFromInputWithExecutionContext:a2];
}

uint64_t __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 deleteBackward:*(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

uint64_t __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 deleteBackward];
}

void __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1358 copy];
  uint64_t v1 = (void *)qword_1EB25FB08;
  qword_1EB25FB08 = v0;
}

uint64_t __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = qword_1EB25FB20;
  id v4 = a2;
  if (v3 != -1) {
    dispatch_once(&qword_1EB25FB20, &__block_literal_global_1360);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_6;
  v5[3] = &unk_1E52E34C8;
  v5[4] = *(void *)(a1 + 32);
  [v4 transferExecutionToMainThreadWithTask:v5 breadcrumb:qword_1EB25FB18];
}

void __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_1362 copy];
  uint64_t v1 = (void *)qword_1EB25FB18;
  qword_1EB25FB18 = v0;
}

uint64_t __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_7;
  v4[3] = &unk_1E52E34C8;
  void v4[4] = v2;
  uint64_t v3 = [a2 childWithContinuation:v4];
  [v2 syncDocumentStateToInputDelegateWithExecutionContext:v3];
}

uint64_t __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) syncInputManagerToKeyboardStateWithExecutionContext:a2];
}

void __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if (*(unsigned char *)(v4 + 274))
  {
    int v5 = *(_DWORD *)(v4 + 544);
    *(_DWORD *)(v4 + 544) = v5 + 1;
    if (v5) {
      goto LABEL_5;
    }
    uint64_t v4 = *(void *)(a1 + 32);
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 624), "setNeedAutofill:", objc_msgSend((id)v4, "needAutofillLogin"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 624), "setAutofillMode:", objc_msgSend(*(id *)(a1 + 32), "needAutofill"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 624), "setAutofillSubMode:", objc_msgSend(*(id *)(a1 + 32), "autofillSubMode"));
  [*(id *)(a1 + 32) completeDelete];
LABEL_5:
  [*(id *)(a1 + 32) completeDeleteFromInput];
  [v6 returnExecutionToParent];
}

uint64_t __50___UIKeyboardStateManager_completeDeleteFromInput__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 inputManagerState];
  uint64_t v5 = [v4 stringEndsWord:v3];

  return v5;
}

uint64_t __71___UIKeyboardStateManager_acceptInlineCompletionWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) endAcceptingInlineCompletionByDirectTap];
  uint64_t v4 = _UIKeyboardLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    char v7 = "-[_UIKeyboardStateManager acceptInlineCompletionWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%s Completed accept inline completion", (uint8_t *)&v6, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void __103___UIKeyboardStateManager_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination___block_invoke(uint64_t a1, int a2, int a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v6 = _UIKeyboardLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    char v7 = "NO";
    id v14 = "-[_UIKeyboardStateManager acceptAutocorrectionWithCompletionHandler:requestedByRemoteInputDestination:]_block_invoke";
    if (a2) {
      uint64_t v8 = "YES";
    }
    else {
      uint64_t v8 = "NO";
    }
    *(_DWORD *)buf = 136315650;
    double v16 = v8;
    __int16 v15 = 2080;
    if (a3) {
      char v7 = "YES";
    }
    __int16 v17 = 2080;
    double v18 = v7;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "%s Got response from keyboard UI host: didForward=%s, shouldWaitForOutput=%s", buf, 0x20u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103___UIKeyboardStateManager_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination___block_invoke_1371;
  aBlock[3] = &unk_1E52DA040;
  id v12 = *(id *)(a1 + 40);
  id v9 = (void (**)(void))_Block_copy(aBlock);
  if ((a2 & 1) == 0)
  {
    if (pthread_main_np() != 1)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"_UIKeyboardStateManager.m" lineNumber:13411 description:@"Call must be made on main thread"];
    }
    objc_msgSend(*(id *)(a1 + 32), "_local_acceptAutocorrection");
    goto LABEL_14;
  }
  if ((a3 & 1) == 0)
  {
LABEL_14:
    v9[2](v9);
    goto LABEL_15;
  }
  [*(id *)(a1 + 32) _setWaitingOnPerformAutocorrect:*(void *)(a1 + 40)];
LABEL_15:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

void __103___UIKeyboardStateManager_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination___block_invoke_1371(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (pthread_main_np() == 1)
    {
      uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      v2();
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __103___UIKeyboardStateManager_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination___block_invoke_2;
      block[3] = &unk_1E52DA040;
      id v4 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __103___UIKeyboardStateManager_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103___UIKeyboardStateManager_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 autocorrectionController];
  id v4 = [v3 autocorrection];
  uint64_t v5 = [v2 shouldApplyAcceptedAutocorrection:v4];
  if (v5)
  {
  }
  else
  {
    if ([*(id *)(a1 + 32) _hasMarkedText])
    {
      int v6 = [*(id *)(a1 + 32) inlineCompletionAsMarkedText];

      if (!v6)
      {
        uint64_t v5 = 1;
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v7 = [*(id *)(a1 + 32) inlineCompletionAsMarkedText];
    if (!v7
      || (uint64_t v8 = (void *)v7,
          [*(id *)(a1 + 32) inlineTextCompletionController],
          id v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 currentlyAcceptingInlineCompletionByDirectTap],
          v9,
          v8,
          (v10 & 1) != 0))
    {
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    id v3 = [*(id *)(a1 + 32) inlineTextCompletionController];
    [v3 removeTextCompletionPrompt];
  }

LABEL_11:
  int v11 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, v5);
    }
  }
  uint64_t result = [*(id *)(a1 + 32) _shouldAcceptAutocorrectionOnSelectionChange];
  if (result) {
    uint64_t result = [*(id *)(a1 + 32) _acceptAutocorrection];
  }
  if (!v11)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      id v14 = *(uint64_t (**)(void))(result + 16);
      return v14();
    }
  }
  return result;
}

void __54___UIKeyboardStateManager__local_acceptAutocorrection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v2, "_local_acceptAutocorrection");
  [v3 returnExecutionToParent];
}

void __54___UIKeyboardStateManager__local_acceptAutocorrection__block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1382 copy];
  uint64_t v1 = (void *)qword_1EB25FB28;
  qword_1EB25FB28 = v0;
}

uint64_t __54___UIKeyboardStateManager__local_acceptAutocorrection__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __48___UIKeyboardStateManager__acceptAutocorrection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[UIKeyboard usesInputSystemUI];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48___UIKeyboardStateManager__acceptAutocorrection__block_invoke_2;
    v6[3] = &unk_1E52DC3A0;
    id v7 = v3;
    [v5 acceptAutocorrectionWithCompletionHandler:v6];
  }
  else
  {
    [v5 _acceptAutocorrection];
    [v3 returnExecutionToParent];
  }
}

uint64_t __48___UIKeyboardStateManager__acceptAutocorrection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) returnExecutionToParent];
}

void __48___UIKeyboardStateManager__acceptAutocorrection__block_invoke_3()
{
  uint64_t v0 = [&__block_literal_global_1386 copy];
  uint64_t v1 = (void *)qword_1EB25FB38;
  qword_1EB25FB38 = v0;
}

uint64_t __48___UIKeyboardStateManager__acceptAutocorrection__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained remoteTextInputPartner];
  id v3 = [v2 exchangeWaitingRTIOutputOperationResponseContext:0];

  if (v3)
  {
    BOOL v4 = _UIKeyboardLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      int v6 = "-[_UIKeyboardStateManager acceptAutocorrection]_block_invoke";
      _os_log_error_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%s Timeout while waiting for acceptAutocorrectionWithCompletionHandler:", (uint8_t *)&v5, 0xCu);
    }

    if (qword_1EB25FB50 != -1) {
      dispatch_once(&qword_1EB25FB50, &__block_literal_global_1389);
    }
    [v3 transferExecutionToMainThreadWithTask:&__block_literal_global_1393 breadcrumb:qword_1EB25FB48];
  }
}

void __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_1387()
{
  uint64_t v0 = [&__block_literal_global_1391 copy];
  uint64_t v1 = (void *)qword_1EB25FB48;
  qword_1EB25FB48 = v0;
}

uint64_t __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 returnExecutionToParent];
}

void __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_4()
{
  uint64_t v0 = [&__block_literal_global_1397 copy];
  uint64_t v1 = (void *)qword_1EB25FB58;
  qword_1EB25FB58 = v0;
}

uint64_t __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = [WeakRetained remoteTextInputPartner];
  int v6 = [v5 exchangeWaitingRTIOutputOperationResponseContext:v3];

  if (v6)
  {
    uint64_t v7 = _UIKeyboardLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[_UIKeyboardStateManager acceptAutocorrection]_block_invoke_6";
      _os_log_error_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "%s Found unhandled waitingRTIOutputOperationResponseContext", buf, 0xCu);
    }
  }
  uint64_t v8 = [WeakRetained remoteTextInputPartner];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_1398;
  v10[3] = &unk_1E52E3FC8;
  v10[4] = *(void *)(a1 + 32);
  v10[5] = WeakRetained;
  id v11 = v3;
  id v9 = v3;
  [v8 forwardSelectorToUIHost:sel_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination_ completionHandler:v10];
}

void __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_1398(uint64_t a1, char a2, char a3)
{
  if ((a2 & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "_local_acceptAutocorrection");
  }
  if ((a3 & 1) == 0)
  {
    int v5 = [*(id *)(a1 + 40) remoteTextInputPartner];
    int v6 = [v5 compareWaitingRTIOutputOperationResponseContext:*(void *)(a1 + 48) andExchange:0];

    if (v6)
    {
      if (qword_1EB25FB70 != -1) {
        dispatch_once(&qword_1EB25FB70, &__block_literal_global_1401);
      }
      uint64_t v7 = *(void **)(a1 + 48);
      uint64_t v8 = qword_1EB25FB68;
      [v7 transferExecutionToMainThreadWithTask:&__block_literal_global_1407 breadcrumb:v8];
    }
  }
}

void __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_2_1399()
{
  uint64_t v0 = [&__block_literal_global_1404 copy];
  uint64_t v1 = (void *)qword_1EB25FB68;
  qword_1EB25FB68 = v0;
}

uint64_t __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_3_1402(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_4_1405(uint64_t a1, void *a2)
{
  return [a2 returnExecutionToParent];
}

uint64_t __67___UIKeyboardStateManager__acceptSupplementalCandidate_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (+[UIKeyboard isKeyboardProcess])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = (void *)(*(void *)(v10 + 664) + 1);
    *(void *)(v10 + 664) = v11;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __67___UIKeyboardStateManager__acceptSupplementalCandidate_completion___block_invoke_2;
    v36[3] = &unk_1E52E4018;
    uint64_t v12 = v40;
    objc_copyWeak(v40, &location);
    v40[1] = v11;
    id v13 = v8;
    id v37 = v13;
    id v38 = v9;
    id v39 = *(id *)(a1 + 40);
    [*(id *)(a1 + 32) setChooseSupplementalCandidateCompletion:v36];
    uint64_t v14 = [*(id *)(a1 + 32) remoteTextInputPartner];
    __int16 v15 = [v13 input];
    double v16 = objc_msgSend(v14, "textOperation_chooseSupplementalItem:toReplaceText:", v7, v15);

    uint64_t v17 = [*(id *)(a1 + 32) inputSystemSourceSession];
    double v18 = (void *)v17;
    if (v16 && v17)
    {
      uint64_t v19 = [v16 customInfoType];
      long long v20 = [v18 textOperations];
      [v20 setCustomInfoType:v19];

      id v21 = [v16 customInfo];
      uint64_t v22 = [v18 textOperations];
      [v22 setCustomInfo:v21];

      [v18 flushOperations];
    }

    uint64_t v23 = v37;
  }
  else
  {
    id v24 = [*(id *)(a1 + 32) inputDelegate];
    char v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) == 0)
    {
      uint64_t v29 = 0;
      goto LABEL_10;
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v26 = *(void *)(a1 + 32);
    id v27 = (void *)(*(void *)(v26 + 664) + 1);
    *(void *)(v26 + 664) = v27;
    *(unsigned char *)(*(void *)(a1 + 32) + 508) = 1;
    BOOL v28 = [*(id *)(a1 + 32) inputDelegate];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __67___UIKeyboardStateManager__acceptSupplementalCandidate_completion___block_invoke_3;
    v31[3] = &unk_1E52E4498;
    uint64_t v12 = v35;
    objc_copyWeak(v35, &location);
    v35[1] = v27;
    id v32 = v8;
    id v33 = v9;
    id v34 = *(id *)(a1 + 40);
    [v28 _chooseSupplementalItemToInsert:v7 replacementRange:v33 completionHandler:v31];

    *(unsigned char *)(*(void *)(a1 + 32) + 508) = 0;
    uint64_t v23 = v32;
  }

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  uint64_t v29 = 1;
LABEL_10:

  return v29;
}

void __67___UIKeyboardStateManager__acceptSupplementalCandidate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 64);
    if (v6 == [WeakRetained lastChooseSupplementalItemToInsertCallbackIdentifier])
    {
      [v5 setPendingSupplementalCandidateToInsert:0];
      if (v3)
      {
        id v7 = [*(id *)(a1 + 32) input];
        id v8 = [v5 _rangeForSupplementalItemText:v7];

        id v9 = [v5 inputDelegate];
        int v10 = [v9 _range:*(void *)(a1 + 40) isEqualToRange:v8];

        if (v10)
        {
          id v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3[1], "identifier"));
          v13[0] = v11;
          uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
          [*(id *)(a1 + 32) setSupplementalItemIdentifiers:v12];

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
      }
    }
  }
}

void __67___UIKeyboardStateManager__acceptSupplementalCandidate_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 64);
    if (v6 == [WeakRetained lastChooseSupplementalItemToInsertCallbackIdentifier])
    {
      [v5 setPendingSupplementalCandidateToInsert:0];
      if (v3)
      {
        id v7 = [*(id *)(a1 + 32) input];
        id v8 = [v5 _rangeForSupplementalItemText:v7];

        id v9 = [v5 inputDelegate];
        int v10 = [v9 _range:*(void *)(a1 + 40) isEqualToRange:v8];

        if (v10)
        {
          id v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3[1], "identifier"));
          v13[0] = v11;
          uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
          [*(id *)(a1 + 32) setSupplementalItemIdentifiers:v12];

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }
      }
    }
  }
}

void __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1421 copy];
  uint64_t v1 = (void *)qword_1EB25FB78;
  qword_1EB25FB78 = v0;
}

uint64_t __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = [WeakRetained backendController];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_4;
  v10[3] = &unk_1E52E4068;
  id v11 = v3;
  id v9 = v3;
  [v5 candidateAccepted:v6 keyboardState:v7 candidateRquestToken:v8 completionHandler:v10];
}

uint64_t __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) returnExecutionToParent];
}

void __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v5 = +[UIKBAnalyticsDispatcher sharedInstance];
    uint64_t v6 = [v5 nextCandidateReplacementSource];

    uint64_t v7 = +[UIKBAnalyticsDispatcher sharedInstance];
    [v7 setNextCandidateReplacementSource:0];

    if (qword_1EB25FB90 != -1) {
      dispatch_once(&qword_1EB25FB90, &__block_literal_global_1423);
    }
    uint64_t v8 = [WeakRetained taskQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_8;
    v9[3] = &unk_1E52E40B8;
    uint64_t v12 = v6;
    id v10 = WeakRetained;
    id v11 = v3;
    char v13 = *(unsigned char *)(a1 + 40);
    [v8 addTask:v9 breadcrumb:qword_1EB25FB88];
  }
}

void __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_6()
{
  uint64_t v0 = [&__block_literal_global_1425 copy];
  uint64_t v1 = (void *)qword_1EB25FB88;
  qword_1EB25FB88 = v0;
}

uint64_t __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = a2;
  int v5 = +[UIKBAnalyticsDispatcher sharedInstance];
  [v5 setNextCandidateReplacementSource:v3];

  [*(id *)(a1 + 32) acceptPredictiveInput:*(void *)(a1 + 40) appendSeparator:*(unsigned __int8 *)(a1 + 56) executionContext:v4];
  if ([*(id *)(a1 + 32) predictionType] == 1
    || (uint64_t result = [*(id *)(a1 + 32) predictionType], result == 3))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 setPredictionType:0];
  }
  return result;
}

void __48___UIKeyboardStateManager_rejectAutocorrection___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1430 copy];
  uint64_t v1 = (void *)qword_1EB25FB98;
  qword_1EB25FB98 = v0;
}

uint64_t __48___UIKeyboardStateManager_rejectAutocorrection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __48___UIKeyboardStateManager_rejectAutocorrection___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 inputManager];
  [v4 candidateRejected:*(void *)(a1 + 40)];

  [v5 returnExecutionToParent];
}

void __40___UIKeyboardStateManager_textAccepted___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1434 copy];
  uint64_t v1 = (void *)qword_1EB25FBA8;
  qword_1EB25FBA8 = v0;
}

uint64_t __40___UIKeyboardStateManager_textAccepted___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __40___UIKeyboardStateManager_textAccepted___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = +[UIKeyboardInputModeController sharedInputModeController];
  id v5 = [v4 currentInputMode];
  LODWORD(v3) = [v3 isEqual:v5];

  if (v3) {
    [*(id *)(a1 + 40) textAccepted:*(void *)(a1 + 48) executionContext:v6];
  }
  else {
    [v6 returnExecutionToParent];
  }
}

void __57___UIKeyboardStateManager_textAccepted_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1EB25FBC0 != -1) {
    dispatch_once(&qword_1EB25FBC0, &__block_literal_global_1436);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57___UIKeyboardStateManager_textAccepted_executionContext___block_invoke_4;
  v7[3] = &unk_1E52E3628;
  id v4 = *(void **)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v5 = qword_1EB25FBB8;
  id v6 = v3;
  [v4 transferExecutionToMainThreadWithTask:v7 breadcrumb:v5];
}

void __57___UIKeyboardStateManager_textAccepted_executionContext___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1438 copy];
  uint64_t v1 = (void *)qword_1EB25FBB8;
  qword_1EB25FBB8 = v0;
}

uint64_t __57___UIKeyboardStateManager_textAccepted_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __57___UIKeyboardStateManager_textAccepted_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if (([v3 usesCandidateSelection] & 1) == 0) {
    [*(id *)(a1 + 32) syncKeyboardToConfiguration:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) finishTextChanged];
  [v4 returnExecutionToParent];
}

uint64_t __64___UIKeyboardStateManager_acceptAutofillExtraCandidateIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAcceptedCandidate:*(void *)(a1 + 32)];
}

void __82___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator_executionContext___block_invoke(id *a1, void *a2)
{
  id v16 = a2;
  *((unsigned char *)a1[4] + 170) = 1;
  if ([a1[5] length])
  {
    id v3 = [a1[4] documentState];
    id v4 = [v3 contextAfterInput];
    if ([v4 hasPrefix:a1[5]])
    {
      uint64_t v5 = [a1[4] documentState];
      id v6 = [v5 contextBeforeInput];
      int v7 = [v6 hasSuffix:a1[5]];

      if (v7) {
        [a1[4] deleteForwardAndNotify:0];
      }
    }
    else
    {
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 97);
  id v9 = [WeakRetained layout];
  [v9 triggerSpaceKeyplaneSwitchIfNecessary];

  id v10 = [a1[6] input];
  id v11 = [a1[6] label];
  +[UIKBAnalyticsDispatcher didCandidateReplacementWithRemovedText:v10 insertedText:v11];

  if (+[_UISmartReplyFeedbackManager candidateIsSmartReply:a1[6]])
  {
    uint64_t v12 = [a1[4] smartReplyFeedbackManager];
    char v13 = [a1[6] label];
    uint64_t v14 = [*((id *)a1[4] + 78) inputContextHistory];
    __int16 v15 = [v14 threadIdentifier];
    [v12 userSelectedSmartReply:v13 isLongForm:0 withMailOrMsgThreadId:v15];
  }
  [v16 returnExecutionToParent];
}

void __82___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setPreviousInputString:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 161) = 0;
  id v4 = [v3 info];
  uint64_t v5 = v4;
  if (!v4) {
    uint64_t v5 = *(void **)(a1 + 40);
  }
  id v6 = v5;

  int v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator_executionContext___block_invoke_3;
  v9[3] = &unk_1E52E4108;
  char v10 = *(unsigned char *)(a1 + 48);
  void v9[4] = v7;
  id v8 = [v3 childWithContinuation:v9];
  [v7 textAccepted:v6 executionContext:v8];
}

void __82___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    char v4 = *(unsigned char *)(v3 + 508);
    *(unsigned char *)(v3 + 508) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 321) = 1;
    uint64_t v5 = [*(id *)(a1 + 32) inputDelegateManager];
    [v5 insertTextAfterSelection:@" "];

    *(unsigned char *)(*(void *)(a1 + 32) + 321) = 0;
    id v6 = +[UIKBAnalyticsDispatcher sharedInstance];
    [v6 setNextCandidateReplacementSource:0];

    if (+[UIKeyboard isKeyboardProcess])
    {
      int v7 = [*(id *)(a1 + 32) inputSystemSourceSession];
      id v8 = v7;
      if (v7)
      {
        id v9 = [v7 textOperations];
        char v10 = [v9 keyboardOutput];
        [v10 setInsertionTextAfterSelection:@" "];

        [v8 flushOperations];
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 508) = v4;
  }
  [v11 returnExecutionToParent];
}

uint64_t __52___UIKeyboardStateManager_acceptCandidate_forInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [MEMORY[0x1E4F1CA98] null];
  if ([v3 isEqual:v4])
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [v3 candidate];
    int v7 = [*(id *)(a1 + 32) candidate];
    uint64_t v5 = [v6 isEqualToString:v7];
  }
  return v5;
}

uint64_t __54___UIKeyboardStateManager_handleDeletionForCandidate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeletionCount:*(void *)(a1 + 32)];
}

void __58___UIKeyboardStateManager_acceptCurrentCandidateForInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (qword_1EB25FBD0 != -1) {
    dispatch_once(&qword_1EB25FBD0, &__block_literal_global_1457);
  }
  int v7 = [*(id *)(a1 + 32) taskQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58___UIKeyboardStateManager_acceptCurrentCandidateForInput___block_invoke_4;
  v11[3] = &unk_1E52E3678;
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  uint64_t v8 = qword_1EB25FBC8;
  id v9 = v6;
  id v10 = v5;
  [v7 performSingleTask:v11 breadcrumb:v8];
}

void __58___UIKeyboardStateManager_acceptCurrentCandidateForInput___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1459 copy];
  uint64_t v1 = (void *)qword_1EB25FBC8;
  qword_1EB25FBC8 = v0;
}

uint64_t __58___UIKeyboardStateManager_acceptCurrentCandidateForInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __58___UIKeyboardStateManager_acceptCurrentCandidateForInput___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) acceptCandidate:*(void *)(a1 + 40) forInput:*(void *)(a1 + 48) executionContext:a2];
}

uint64_t __58___UIKeyboardStateManager_acceptCurrentCandidateForInput___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

void __57___UIKeyboardStateManager_acceptInlineCandidateForInput___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1464 copy];
  uint64_t v1 = (void *)qword_1EB25FBD8;
  qword_1EB25FBD8 = v0;
}

uint64_t __57___UIKeyboardStateManager_acceptInlineCandidateForInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __57___UIKeyboardStateManager_acceptInlineCandidateForInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) acceptCandidate:*(void *)(a1 + 40) forInput:*(void *)(a1 + 48) executionContext:a2];
}

void __69___UIKeyboardStateManager_acceptCandidate_forInput_executionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 completeAcceptCandidate:v3];
  [v4 returnExecutionToParent];
}

void __47___UIKeyboardStateManager_acceptFirstCandidate__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1468 copy];
  uint64_t v1 = (void *)qword_1EB25FBE8;
  qword_1EB25FBE8 = v0;
}

uint64_t __47___UIKeyboardStateManager_acceptFirstCandidate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __47___UIKeyboardStateManager_acceptFirstCandidate__block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) acceptCandidate:*(void *)(a1 + 40) forInput:0 executionContext:a2];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 560) wordSeparator];
  if ([v4 length])
  {
    uint64_t v3 = [*(id *)(a1 + 32) inputDelegateManager];
    [v3 insertText:v4 updateInputSource:0];
  }
}

void __59___UIKeyboardStateManager_acceptCurrentCandidateIfSelected__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1472 copy];
  uint64_t v1 = (void *)qword_1EB25FBF8;
  qword_1EB25FBF8 = v0;
}

uint64_t __59___UIKeyboardStateManager_acceptCurrentCandidateIfSelected__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __59___UIKeyboardStateManager_acceptCurrentCandidateIfSelected__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) acceptCurrentCandidateIfSelectedWithExecutionContext:a2];
}

void __80___UIKeyboardStateManager_acceptCurrentCandidateIfSelectedWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 completeAcceptCandidate:v3];
  [v4 returnExecutionToParent];
}

void __56___UIKeyboardStateManager_candidateListAcceptCandidate___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1476 copy];
  uint64_t v1 = (void *)qword_1EB25FC08;
  qword_1EB25FC08 = v0;
}

uint64_t __56___UIKeyboardStateManager_candidateListAcceptCandidate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __56___UIKeyboardStateManager_candidateListAcceptCandidate___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  id v5 = [v3 currentCandidate];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 32) defaultCandidate];
  }
  id v8 = v7;

  [*(id *)(a1 + 32) acceptPredictiveInput:v8 executionContext:v4];
}

void __45___UIKeyboardStateManager_acceptRecentInput___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1482 copy];
  uint64_t v1 = (void *)qword_1EB25FC18;
  qword_1EB25FC18 = v0;
}

uint64_t __45___UIKeyboardStateManager_acceptRecentInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __45___UIKeyboardStateManager_acceptRecentInput___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __45___UIKeyboardStateManager_acceptRecentInput___block_invoke_4;
  id v8 = &unk_1E52E3628;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v4 = [a2 childWithContinuation:&v5];
  objc_msgSend(v3, "handleClearWithExecutionContext:", v4, v5, v6, v7, v8, v9);
}

uint64_t __45___UIKeyboardStateManager_acceptRecentInput___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addInputString:*(void *)(a1 + 40) withFlags:128 executionContext:a2];
}

void __42___UIKeyboardStateManager_addInputObject___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1486 copy];
  uint64_t v1 = (void *)qword_1EB25FC28;
  qword_1EB25FC28 = v0;
}

uint64_t __42___UIKeyboardStateManager_addInputObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __42___UIKeyboardStateManager_addInputObject___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addInputObject:*(void *)(a1 + 40) executionContext:a2];
}

void __59___UIKeyboardStateManager_addInputObject_executionContext___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1490 copy];
  uint64_t v1 = (void *)qword_1EB25FC38;
  qword_1EB25FC38 = v0;
}

uint64_t __59___UIKeyboardStateManager_addInputObject_executionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __59___UIKeyboardStateManager_addInputObject_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 updateTextCandidateView];
  [v3 returnExecutionToParent];
}

uint64_t __59___UIKeyboardStateManager_addInputObject_executionContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeAcceptCandidateBeforeAddingInputObject:*(void *)(a1 + 40) executionContext:a2];
}

void __91___UIKeyboardStateManager_completeAcceptCandidateBeforeAddingInputObject_executionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 completeAddInputString:0];
  [v3 returnExecutionToParent];
}

void __59___UIKeyboardStateManager_acceptWord_firstDelete_forInput___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (+[UIKeyboard isKeyboardProcess])
  {
    [v4 setAcceptedCandidate:*(void *)(a1 + 32)];
  }
  else
  {
    id v3 = [v4 acceptedCandidate];

    if (!v3) {
      [v4 insertText:*(void *)(a1 + 40)];
    }
  }
}

void __59___UIKeyboardStateManager_acceptWord_firstDelete_forInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (+[UIKeyboard isKeyboardProcess])
  {
    [v4 setAcceptedCandidate:*(void *)(a1 + 32)];
  }
  else
  {
    id v3 = [v4 acceptedCandidate];

    if (!v3) {
      [v4 insertText:*(void *)(a1 + 40)];
    }
  }
}

void __46___UIKeyboardStateManager_processPayloadInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inputDelegateManager];
  id v3 = [v2 delegateRespectingForwardingDelegate:0];
  if (v3)
  {
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) objectForKey:*MEMORY[0x1E4FAE918]];

    if (!v4) {
      goto LABEL_5;
    }
    id v11 = [*(id *)(a1 + 32) autofillController];
    id v12 = [v11 autofillGroup];
    id v2 = [v12 objectForKey:@"password"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v2, "__isKindOfUIResponder"))
    {
      id v2 = v2;
      [v2 becomeFirstResponder];
      id v4 = v2;
      goto LABEL_4;
    }
  }
  id v4 = 0;
LABEL_4:

LABEL_5:
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __46___UIKeyboardStateManager_processPayloadInfo___block_invoke_2;
  v13[3] = &unk_1E52E3A28;
  uint64_t v5 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  [v5 performKeyboardOutputOnInputSourceSession:v13];
  [v4 resignFirstResponder];
  uint64_t v6 = [*(id *)(a1 + 40) objectForKey:@"AutofillOneTimeCodeAvailable"];
  if ([v6 BOOLValue])
  {
    id v7 = +[UIKeyboardInputModeController sharedInputModeController];
    id v8 = [v7 currentInputMode];
    int v9 = [v8 isExtensionInputMode];

    if (v9)
    {
      id v10 = +[UIKeyboardInputModeController sharedInputModeController];
      [v10 switchToCurrentSystemInputMode];
    }
  }
  [*(id *)(a1 + 32) performKeyboardOutputInfo:*(void *)(a1 + 40)];
}

void __46___UIKeyboardStateManager_processPayloadInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)[v2 mutableCopy];
  [v3 setCustomInfo:v4];
}

void __60___UIKeyboardStateManager_pushAutocorrections_requestToken___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1498 copy];
  uint64_t v1 = (void *)qword_1EB25FC48;
  qword_1EB25FC48 = v0;
}

uint64_t __60___UIKeyboardStateManager_pushAutocorrections_requestToken___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __60___UIKeyboardStateManager_pushAutocorrections_requestToken___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] currentCandidateRequest];
  if (v4
    && (uint64_t v5 = (void *)v4,
        id v6 = a1[5],
        [a1[4] currentCandidateRequest],
        id v7 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v6) = [v6 isSameRequestAs:v7],
        v7,
        v5,
        v6))
  {
    id v8 = a1[6];
  }
  else
  {
    int v9 = [a1[6] predictions];
    id v10 = [v9 firstObject];
    char v11 = [v10 isAutofillCandidate];

    if ((v11 & 1) == 0)
    {
      id v8 = a1[6];
      goto LABEL_26;
    }
    id v12 = [a1[4] delegateForCandidateRequest];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __60___UIKeyboardStateManager_pushAutocorrections_requestToken___block_invoke_4;
    v50[3] = &unk_1E52E41F0;
    id v51 = a1[5];
    id v13 = [v12 keysOfEntriesPassingTest:v50];

    if ([v13 count])
    {
      id v14 = [a1[4] delegateForCandidateRequest];
      __int16 v15 = [v13 anyObject];
      id v16 = [v14 objectForKeyedSubscript:v15];
      uint64_t v17 = (void *)MEMORY[0x1E4F29238];
      double v18 = [a1[4] delegate];
      uint64_t v19 = [v17 valueWithPointer:v18];
      int v20 = [v16 isEqual:v19];
    }
    else
    {
      int v20 = 0;
    }

    id v8 = a1[6];
    if (!v20) {
      goto LABEL_26;
    }
  }
  id v21 = [v8 predictions];
  uint64_t v22 = [v21 lastObject];
  if ([v22 customInfoType] != 32)
  {
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  uint64_t v23 = _UIMainBundleIdentifier();
  int v24 = [v23 isEqualToString:@"com.apple.ConnectSSO.App-SSO"];

  if (v24)
  {
    char v25 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v26 = [v25 responder];
    id v21 = [v26 _responderWindow];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    id v27 = v21 ? (void *)v21[118] : 0;
    id v28 = v27;
    int v29 = [v28 isEqualToString:@"com.apple.SafariViewService"];

    if (!v29) {
      goto LABEL_19;
    }
    uint64_t v30 = [v8 predictions];
    unint64_t v31 = [v30 count];

    if (v31 >= 2)
    {
      id v32 = [v8 predictions];
      id v33 = [v8 predictions];
      uint64_t v22 = objc_msgSend(v32, "subarrayWithRange:", 0, objc_msgSend(v33, "count") - 1);

      id v34 = (void *)MEMORY[0x1E4FAE278];
      uint64_t v35 = [v8 corrections];
      char v36 = [v8 emojiList];
      uint64_t v37 = [v34 listWithCorrections:v35 predictions:v22 emojiList:v36];

      id v8 = (id)v37;
      goto LABEL_18;
    }

LABEL_26:
    [v3 returnExecutionToParent];
    goto LABEL_27;
  }
LABEL_20:
  uint64_t v38 = [v8 sourceForAutocorrection];
  id v39 = a1[4];
  id v40 = [v8 corrections];
  char v41 = [v40 autocorrection];
  LODWORD(v39) = [v39 shouldAcceptContinuousPathConversion:v41];

  if (v39)
  {
    id v42 = (void *)MEMORY[0x1E4FAE278];
    int v43 = [v8 predictions];
    v44 = [v8 emojiList];
    uint64_t v45 = [v42 listWithCorrections:0 predictions:v43 emojiList:v44];

    id v8 = (id)v45;
  }
  *((void *)a1[4] + 80) = v38;
  [a1[4] inputManagerDidGenerateAutocorrections:v8 executionContext:v3];
  if (_os_feature_enabled_impl())
  {
    v46 = a1[4];
    uint64_t v47 = (void *)v46[103];
    v46[103] = 0;
  }
  BOOL v48 = [a1[4] smartReplyFeedbackManager];
  id v49 = [a1[6] predictions];
  [v48 updateCandidates:v49];

LABEL_27:
}

uint64_t __60___UIKeyboardStateManager_pushAutocorrections_requestToken___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isSameRequestAs:a2];
}

void __63___UIKeyboardStateManager_pushCandidateResultSet_requestToken___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1511 copy];
  uint64_t v1 = (void *)qword_1EB25FC58;
  qword_1EB25FC58 = v0;
}

uint64_t __63___UIKeyboardStateManager_pushCandidateResultSet_requestToken___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __63___UIKeyboardStateManager_pushCandidateResultSet_requestToken___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) currentCandidateRequest];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) currentCandidateRequest];
    LODWORD(v5) = [v5 isSameRequestAs:v6];

    if (v5) {
      [*(id *)(a1 + 32) inputManagerDidGenerateCandidateResultSet:*(void *)(a1 + 48)];
    }
  }
  [v7 returnExecutionToParent];
}

void __49___UIKeyboardStateManager_setAutocorrectionList___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _supplementalCandidateIcon:v3];
  [v3 setIcon:v4];
}

uint64_t __46___UIKeyboardStateManager_removeCandidateList__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) setUIKeyboardCandidateListDelegate:0];
}

void __41___UIKeyboardStateManager_setCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4FAE2A0];
  id v4 = a2;
  id v6 = (id)[[v3 alloc] initWithAutocorrection:*(void *)(a1 + 32) alternateCorrections:0];
  uint64_t v5 = [MEMORY[0x1E4FAE278] listWithCorrections:v6 predictions:0];
  [*(id *)(a1 + 40) inputManagerDidGenerateAutocorrections:v5 executionContext:v4];
}

void __41___UIKeyboardStateManager_setCandidates___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1583 copy];
  uint64_t v1 = (void *)qword_1EB25FC68;
  qword_1EB25FC68 = v0;
}

uint64_t __41___UIKeyboardStateManager_setCandidates___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __62___UIKeyboardStateManager_touchDelayDeleteTimerWithThreshold___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1615 copy];
  uint64_t v1 = (void *)qword_1EB25FC78;
  qword_1EB25FC78 = v0;
}

uint64_t __62___UIKeyboardStateManager_touchDelayDeleteTimerWithThreshold___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __62___UIKeyboardStateManager_touchDelayDeleteTimerWithThreshold___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) deleteWordLastDelete];
  if (v3 <= -*MEMORY[0x1E4F1CF68])
  {
    [v4 returnExecutionToParent];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDeleteWordLastDelete:");
    [*(id *)(a1 + 32) handleDeleteWithExecutionContext:v4];
  }
}

void __47___UIKeyboardStateManager_applyAutocorrection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDocumentStateForAutocorrection:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) _textChoicesAssistant];
  [v2 trackUnderlineForWebKitCandidate:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(a1 + 32) + 508) = 0;
}

void __47___UIKeyboardStateManager_applyAutocorrection___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setDocumentStateForAutocorrection:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) _textChoicesAssistant];
  [v2 trackUnderlineForWebKitCandidate:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(a1 + 32) + 508) = 0;
}

void __52___UIKeyboardStateManager_populateEuclidCandidates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) isSelectionAtSentenceAutoshiftBoundary:1];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v21 + 1) + 8 * v10);
        if (v4)
        {
          uint64_t v12 = +[UIDictationUtilities capitalizeFirstWord:v11];

          id v11 = (id)v12;
        }
        id v13 = [MEMORY[0x1E4FAE318] candidateWithCandidate:v11 forInput:*(void *)(a1 + 40) property:32];
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  id v14 = [MEMORY[0x1E4FAE278] listWithCorrections:0 predictions:v5];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52___UIKeyboardStateManager_populateEuclidCandidates___block_invoke_2;
  v17[3] = &unk_1E52DC3F8;
  char v20 = *(unsigned char *)(a1 + 48);
  v17[4] = *(void *)(a1 + 32);
  id v18 = v5;
  id v19 = v14;
  id v15 = v14;
  id v16 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v17);
}

void __52___UIKeyboardStateManager_populateEuclidCandidates___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v1 = *(void **)(a1 + 32);
    id v2 = [MEMORY[0x1E4FAE310] setWithCandidates:*(void *)(a1 + 40)];
    [v1 setCandidates:v2];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v2 = [*(id *)(a1 + 32) autocorrectionController];
    [v2 setAutocorrectionList:v3];
  }

  id v4 = +[UIDictationController activeInstance];
  [v4 logEuclidRequested];
}

uint64_t __67___UIKeyboardStateManager_utlizeEuclidModelForDictationReplacement__block_invoke(uint64_t result)
{
  return result;
}

void __62___UIKeyboardStateManager_generateAutocorrectionReplacements___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1691 copy];
  uint64_t v1 = (void *)qword_1EB25FC88;
  qword_1EB25FC88 = v0;
}

uint64_t __62___UIKeyboardStateManager_generateAutocorrectionReplacements___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __62___UIKeyboardStateManager_generateAutocorrectionReplacements___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62___UIKeyboardStateManager_generateAutocorrectionReplacements___block_invoke_4;
  v5[3] = &unk_1E52DF840;
  v5[4] = a1[6];
  return [v3 generateReplacementsForString:v2 candidatesHandler:v5 executionContext:a2];
}

void __62___UIKeyboardStateManager_generateAutocorrectionReplacements___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x1E4FAE278] listWithCorrections:0 predictions:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1695 copy];
  uint64_t v1 = (void *)qword_1EB25FC98;
  qword_1EB25FC98 = v0;
}

uint64_t __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setAutocorrectionListUIDisplayed:1];
  uint64_t v4 = [*(id *)(a1 + 40) backendController];
  uint64_t v5 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke_4;
  v8[3] = &unk_1E52E42B8;
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  [v4 generateAutocorrectionsWithKeyboardState:v5 completionHandler:v8];
}

void __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1EB25FCB0 != -1) {
    dispatch_once(&qword_1EB25FCB0, &__block_literal_global_1697);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke_7;
  v8[3] = &unk_1E52E4290;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v6 = qword_1EB25FCA8;
  id v7 = v3;
  [v5 transferExecutionToMainThreadWithTask:v8 breadcrumb:v6];
}

void __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke_5()
{
  uint64_t v0 = [&__block_literal_global_1699 copy];
  uint64_t v1 = (void *)qword_1EB25FCA8;
  qword_1EB25FCA8 = v0;
}

uint64_t __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke_7(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
  id v3 = a2;
  [v3 returnExecutionToParent];
}

void __88___UIKeyboardStateManager_touchAutoDeleteTimerWithThreshold_adjustForPartialCompletion___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1703 copy];
  uint64_t v1 = (void *)qword_1EB25FCB8;
  qword_1EB25FCB8 = v0;
}

uint64_t __88___UIKeyboardStateManager_touchAutoDeleteTimerWithThreshold_adjustForPartialCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __88___UIKeyboardStateManager_touchAutoDeleteTimerWithThreshold_adjustForPartialCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) touchAutoDeleteTimerWithThreshold:0 adjustForPartialCompletion:*(double *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) handleAutoDeleteWithExecutionContext:v3];
}

void __63___UIKeyboardStateManager_performStopAutoDeleteAtDocumentStart__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1709 copy];
  uint64_t v1 = (void *)qword_1EB25FCC8;
  qword_1EB25FCC8 = v0;
}

uint64_t __63___UIKeyboardStateManager_performStopAutoDeleteAtDocumentStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __63___UIKeyboardStateManager_performStopAutoDeleteAtDocumentStart__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 _stopAutoDeleteAtDocumentStart];
  [v3 returnExecutionToParent];
}

void __64___UIKeyboardStateManager_handleAutoDeleteWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 completeHandleAutoDelete];
  [v3 returnExecutionToParent];
}

void __56___UIKeyboardStateManager_handleDelayedActionLongPress___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1720 copy];
  uint64_t v1 = (void *)qword_1EB25FCD8;
  qword_1EB25FCD8 = v0;
}

uint64_t __56___UIKeyboardStateManager_handleDelayedActionLongPress___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __56___UIKeyboardStateManager_handleDelayedActionLongPress___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[5];
  id v5 = v3;
  if (a1[4] == v4[12])
  {
    [v4 longPressAction:a1[6]];
    id v3 = v5;
  }
  [v3 returnExecutionToParent];
}

void __109___UIKeyboardStateManager__handleWebKeyEvent_withEventType_withInputString_withInputStringIgnoringModifiers___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1727 copy];
  uint64_t v1 = (void *)qword_1EB25FCE8;
  qword_1EB25FCE8 = v0;
}

uint64_t __109___UIKeyboardStateManager__handleWebKeyEvent_withEventType_withInputString_withInputStringIgnoringModifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __109___UIKeyboardStateManager__handleWebKeyEvent_withEventType_withInputString_withInputStringIgnoringModifiers___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleWebKeyEvent:*(void *)(a1 + 40) withEventType:*(unsigned int *)(a1 + 64) withInputString:*(void *)(a1 + 48) withInputStringIgnoringModifiers:*(void *)(a1 + 56) executionContext:a2];
}

void __126___UIKeyboardStateManager__handleWebKeyEvent_withEventType_withInputString_withInputStringIgnoringModifiers_executionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained returnExecutionToParentWithInfo:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __126___UIKeyboardStateManager__handleWebKeyEvent_withEventType_withInputString_withInputStringIgnoringModifiers_executionContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) takeOwnershipOfPendingCompletionBlock];
  if (v5)
  {
    id v13 = v5;
    uint64_t v6 = [NSNumber numberWithBool:a3];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v13[2](v13);
    id v5 = v13;
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = *(_DWORD *)(v9 + 104);
    BOOL v11 = __OFSUB__(v10, 1);
    int v12 = v10 - 1;
    if (v12 < 0 == v11) {
      *(_DWORD *)(v9 + 104) = v12;
    }
  }
}

void __70___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1747 copy];
  uint64_t v1 = (void *)qword_1EB25FCF8;
  qword_1EB25FCF8 = v0;
}

uint64_t __70___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __70___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleWebKeyEvent:*(void *)(a1 + 40) withIndex:*(void *)(a1 + 56) inInputString:*(void *)(a1 + 48) executionContext:a2];
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleWebKeyEvent:*(void *)(a1 + 40) withIndex:*(void *)(a1 + 64) + *(void *)(a1 + 56) inInputString:*(void *)(a1 + 48) executionContext:a2];
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  uint64_t v6 = *(unsigned char **)(a1 + 32);
  if (v6[269])
  {
LABEL_2:
    v6[269] = 0;
    [*(id *)(a1 + 32) setExternalTask:0];
    [v5 returnExecutionToParent];
    uint64_t v7 = 1;
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (!v6[270] && (a3 & 1) == 0)
  {
    [v6 handleKeyAppCommandForCurrentEvent];
    uint64_t v6 = *(unsigned char **)(a1 + 32);
    if (!v6[269])
    {
      uint64_t v7 = 0;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v7;
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 40) || (uint64_t v7 = *(void *)(a1 + 32), !*(unsigned char *)(v7 + 271)))
  {
    int v6 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 776));
    uint64_t v9 = [WeakRetained layout];
    if (v9) {
      int v6 = [*(id *)(a1 + 32) callLayoutUsesAutoShift];
    }
    else {
      int v6 = 0;
    }
  }
  int v10 = [*(id *)(a1 + 32) externalTask];

  if (v10)
  {
    if (v6)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 273) = 0;
      [*(id *)(a1 + 32) setShiftNeedsUpdate];
    }
    BOOL v11 = [*(id *)(a1 + 32) externalTask];
    [*(id *)(a1 + 32) setExternalTask:0];
    int v12 = [v13 childWithContinuation:v5];
    ((void (**)(void, void *))v11)[2](v11, v12);
  }
  else
  {
    if (v6)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 273) = 1;
      [*(id *)(a1 + 32) setShiftOffIfNeeded];
    }
    v5[2](v5, v13);
  }
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 info];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 info];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    char v6 = 0;
  }

  if (qword_1EB25FD10 != -1) {
    dispatch_once(&qword_1EB25FD10, &__block_literal_global_1757);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_7;
  v8[3] = &unk_1E52E43A8;
  id v7 = *(id *)(a1 + 40);
  char v12 = v6;
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v3 transferExecutionToMainThreadWithTask:v8 breadcrumb:qword_1EB25FD08];
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_5()
{
  uint64_t v0 = [&__block_literal_global_1759 copy];
  uint64_t v1 = (void *)qword_1EB25FD08;
  qword_1EB25FD08 = v0;
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_7(uint64_t a1, void *a2)
{
  id v4 = a2;
  char v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) setEventForCurrentWebEvent:0];
  if ((v3 & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3 = qword_1EB25FD20;
  id v4 = a2;
  if (v3 != -1) {
    dispatch_once(&qword_1EB25FD20, &__block_literal_global_1761);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_11;
  v6[3] = &unk_1E52E43F8;
  id v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  id v12 = *(id *)(a1 + 80);
  [v4 transferExecutionToMainThreadWithTask:v6 breadcrumb:qword_1EB25FD18];
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_9()
{
  uint64_t v0 = [&__block_literal_global_1763 copy];
  uint64_t v1 = (void *)qword_1EB25FD18;
  qword_1EB25FD18 = v0;
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 info];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 info];
    [v5 BOOLValue];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_12;
  aBlock[3] = &unk_1E52E43F8;
  char v6 = *(void **)(a1 + 40);
  void aBlock[4] = *(void *)(a1 + 32);
  id v23 = v6;
  id v24 = *(id *)(a1 + 48);
  id v25 = *(id *)(a1 + 56);
  id v26 = *(id *)(a1 + 64);
  id v27 = *(id *)(a1 + 72);
  id v28 = *(id *)(a1 + 80);
  id v7 = _Block_copy(aBlock);
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))() & 1) == 0)
  {
    uint64_t v8 = [*(id *)(a1 + 40) source];
    if (+[UIKeyboard inputUIOOP])
    {
      id v9 = [[_UIKeyboardImplHeldOperation alloc] initWithOperation:v7];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(v10 + 480);
      *(void *)(v10 + 480) = v9;
      id v12 = v9;

      id v13 = *(void **)(a1 + 32);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_20;
      v19[3] = &unk_1E52DB330;
      id v21 = *(id *)(a1 + 72);
      id v20 = v3;
      [v13 performOperations:v19 withTextInputSource:v8];
    }
    else
    {
      id v14 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_22;
      v15[3] = &unk_1E52E4420;
      uint64_t v17 = (_UIKeyboardImplHeldOperation *)*(id *)(a1 + 72);
      id v16 = v3;
      id v18 = v7;
      [v14 performOperations:v15 withTextInputSource:v8];

      id v12 = v17;
    }
  }
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v3 = qword_1EB25FD30;
  id v4 = a2;
  if (v3 != -1) {
    dispatch_once(&qword_1EB25FD30, &__block_literal_global_1765);
  }
  id v5 = [*(id *)(a1 + 32) taskQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_15;
  v7[3] = &unk_1E52E43F8;
  char v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 72);
  id v13 = *(id *)(a1 + 80);
  [v5 addTask:v7 breadcrumb:qword_1EB25FD28];

  [v4 returnExecutionToParent];
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_13()
{
  uint64_t v0 = [&__block_literal_global_1767 copy];
  uint64_t v1 = (void *)qword_1EB25FD28;
  qword_1EB25FD28 = v0;
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_15(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 271) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 270) = 0;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_16;
  id v13 = &unk_1E52E43D0;
  id v8 = *(id *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v16 = *(id *)(a1 + 72);
  id v17 = *(id *)(a1 + 80);
  id v9 = [a2 childWithContinuation:&v10];
  objc_msgSend(v4, "_handleWebKeyEvent:withEventType:withInputString:withInputStringIgnoringModifiers:executionContext:", v5, 5, v6, v7, v9, v10, v11, v12, v13, v14);
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 info];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 info];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    char v6 = 0;
  }

  if (qword_1EB25FD40 != -1) {
    dispatch_once(&qword_1EB25FD40, &__block_literal_global_1769);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_19;
  v8[3] = &unk_1E52E43A8;
  id v7 = *(id *)(a1 + 40);
  char v12 = v6;
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v3 transferExecutionToMainThreadWithTask:v8 breadcrumb:qword_1EB25FD38];
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_17()
{
  uint64_t v0 = [&__block_literal_global_1771 copy];
  uint64_t v1 = (void *)qword_1EB25FD38;
  qword_1EB25FD38 = v0;
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_18(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_19(uint64_t a1, void *a2)
{
  id v4 = a2;
  char v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) setEventForCurrentWebEvent:0];
  if ((v3 & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), &__block_literal_global_1774);
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_21(uint64_t a1, void *a2)
{
  return [a2 returnExecutionToParent];
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_22(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

void __46___UIKeyboardStateManager_triggerPendingKeyup__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1778 copy];
  uint64_t v1 = (void *)qword_1EB25FD48;
  qword_1EB25FD48 = v0;
}

uint64_t __46___UIKeyboardStateManager_triggerPendingKeyup__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __60___UIKeyboardStateManager__handleKeyEvent_executionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 flushTouchEventWaitingForKeyInputEventIfNecessary];
  [v3 returnExecutionToParent];
}

uint64_t __42___UIKeyboardStateManager_handleKeyEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) handleKeyEvent:*(void *)(a1 + 40) executionContext:a2];
  if ([*(id *)(*(void *)(a1 + 32) + 136) isSecureTextEntry])
  {
    if ([*(id *)(a1 + 40) source] == 4)
    {
      if ([*(id *)(a1 + 40) _isKeyDown])
      {
        id v3 = [*(id *)(a1 + 32) inputDelegateManager];
        id v4 = [v3 keyInputDelegate];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          char v6 = [*(id *)(a1 + 32) inputDelegateManager];
          id v7 = [v6 keyInputDelegate];
          id v8 = [v7 _fieldEditor];
          objc_msgSend(v8, "set_shouldObscureNextInput:", 1);
        }
      }
    }
  }
  uint64_t result = +[UIKeyboard isCapslockIndicatorEnabled];
  if (result)
  {
    id v10 = *(void **)(a1 + 32);
    return [v10 setCapsLockIfNeeded];
  }
  return result;
}

void __42___UIKeyboardStateManager_handleKeyEvent___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1782 copy];
  uint64_t v1 = (void *)qword_1EB25FD58;
  qword_1EB25FD58 = v0;
}

uint64_t __42___UIKeyboardStateManager_handleKeyEvent___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __59___UIKeyboardStateManager_handleKeyEvent_executionContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleKeyWithString:*(void *)(a1 + 40) forKeyEvent:*(void *)(a1 + 48) executionContext:*(void *)(a1 + 56)];
}

void __76___UIKeyboardStateManager_handleKeyWithString_forKeyEvent_executionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 completeHandleKeyEvent:v3];
  [v4 returnExecutionToParent];
}

void __76___UIKeyboardStateManager_handleKeyWithString_forKeyEvent_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28EB8];
  id v6 = a2;
  id v4 = [v3 defaultCenter];
  uint64_t v5 = +[UIKeyboard activeKeyboard];
  [v4 postNotificationName:@"UIKeyboardReturnKeyPressed" object:v5];

  [*(id *)(a1 + 32) completeHandleKeyEvent:*(void *)(a1 + 40)];
  [v6 returnExecutionToParent];
}

void __76___UIKeyboardStateManager_handleKeyWithString_forKeyEvent_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v4 = v3[521];
  id v5 = a2;
  [v3 setShouldSkipCandidateSelection:v4 userInitiated:0];
  id v6 = [*(id *)(a1 + 32) inlineTextCompletionController];
  id v14 = [v6 presentingTextCompletionAsMarkedText];

  if (([*(id *)(a1 + 32) usesCandidateSelection] & 1) == 0)
  {
    id v7 = [*(id *)(a1 + 32) inputDelegateManager];
    id v8 = [v7 markedTextRange];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) inlineTextCompletionController];
      id v10 = [v9 presentingTextCompletionAsMarkedText];

      if (![v14 length]
        || ([*(id *)(a1 + 32) _markedText],
            id v11 = objc_claimAutoreleasedReturnValue(),
            char v12 = [v11 isEqualToString:v14],
            v11,
            (v12 & 1) == 0))
      {
        *(unsigned char *)(*(void *)(a1 + 32) + 508) = 1;
        id v13 = [*(id *)(a1 + 32) inputDelegateManager];
        [v13 unmarkText];

        *(unsigned char *)(*(void *)(a1 + 32) + 508) = 0;
      }
    }
  }
  [*(id *)(a1 + 32) completeHandleKeyEvent:*(void *)(a1 + 40)];
  [v5 returnExecutionToParent];
}

uint64_t __68___UIKeyboardStateManager_enableTransientInputDelegateSelectionMode__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enableTransientSelectionMode];
}

void __111___UIKeyboardStateManager_updateInputDelegateForRemoteDocumentStateChange_selectedTextRange_hasText_forceSync___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1823 copy];
  uint64_t v1 = (void *)qword_1EB25FD68;
  qword_1EB25FD68 = v0;
}

uint64_t __111___UIKeyboardStateManager_updateInputDelegateForRemoteDocumentStateChange_selectedTextRange_hasText_forceSync___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __111___UIKeyboardStateManager_updateInputDelegateForRemoteDocumentStateChange_selectedTextRange_hasText_forceSync___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 72)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 508) = 1;
  }
  int v4 = *(unsigned __int8 *)(a1 + 73);
  id v5 = +[UIDictationController activeInstance];
  char v6 = [v5 shouldSuppressSoftwareKeyboard];

  uint64_t v7 = [*(id *)(a1 + 40) length];
  if (v4) {
    char v8 = 1;
  }
  else {
    char v8 = v6;
  }
  if (v7 || (v8 & 1) == 0)
  {
    id v9 = [*(id *)(a1 + 48) markedText];
    if (![v9 length])
    {
      char v10 = [*(id *)(a1 + 32) showingEmojiSearch];

      if (v10) {
        goto LABEL_12;
      }
      id v11 = *(void **)(a1 + 32);
      id v9 = [v11 inputDelegate];
      [v11 replaceAllTextInResponder:v9 withText:*(void *)(a1 + 40)];
    }
  }
LABEL_12:
  char v12 = [*(id *)(a1 + 32) inputDelegate];
  id v13 = objc_msgSend(v12, "_textRangeFromNSRange:", *(void *)(a1 + 56), *(void *)(a1 + 64));

  id v14 = [*(id *)(a1 + 32) inputDelegateManager];
  [v14 setSelectedTextRange:v13];

  [*(id *)(a1 + 32) updateReturnKey:0];
  if (*(unsigned char *)(a1 + 72)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 508) = 0;
  }
  id v15 = [*(id *)(a1 + 48) markedText];
  uint64_t v16 = [v15 length];

  if (!v16)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 121) = 1;
    [*(id *)(a1 + 32) clearInput];
    *(unsigned char *)(*(void *)(a1 + 32) + 121) = 0;
  }
  [*(id *)(a1 + 32) setDocumentState:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) resumeDictationForResponderChange];
  if ((+[UIKeyboard usesInputSystemUI]
     || +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI](UIKeyboard, "usesInputSystemUIForAutoFillOnlyWithRTI"))&& [*(id *)(a1 + 32) isRTIClient])
  {
    id v17 = [*(id *)(a1 + 32) remoteTextInputPartner];
    [v17 documentStateChanged:1];
  }
  if (*(unsigned char *)(a1 + 72))
  {
    id v18 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __111___UIKeyboardStateManager_updateInputDelegateForRemoteDocumentStateChange_selectedTextRange_hasText_forceSync___block_invoke_4;
    v20[3] = &unk_1E52E34C8;
    v20[4] = v18;
    id v19 = [v3 childWithContinuation:v20];
    [v18 syncInputManagerToKeyboardStateWithExecutionContext:v19];
  }
  else
  {
    [v3 returnExecutionToParent];
  }
}

void __111___UIKeyboardStateManager_updateInputDelegateForRemoteDocumentStateChange_selectedTextRange_hasText_forceSync___block_invoke_4(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  id v3 = *(void **)(a1 + 32);
  id v14 = a2;
  if ([v3 shouldGenerateCandidatesAfterSelectionChange])
  {
    int v4 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    if ([v4 oldPathForSnapshot]
      && !+[UIKeyboard isKeyboardProcess])
    {
      id v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      char v12 = [v11 visualModeManager];
      int v13 = [v12 useVisualModeWindowed];

      if (!v13) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) generateCandidates];
  }
LABEL_6:
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v5 = [*(id *)(a1 + 32) inputDelegateManager];
    char v6 = [v5 selectedTextRange];
    char v7 = [v6 isEmpty];

    if ((v7 & 1) == 0)
    {
      char v8 = *(void **)(a1 + 32);
      id v9 = [v8 inputDelegateManager];
      char v10 = [v9 selectedTextRange];
      [v8 presentTextChoicePromptForRange:v10];
    }
  }
  [*(id *)(a1 + 32) completeUpdateForChangedSelection:1];
  [v14 returnExecutionToParent];
}

void __98___UIKeyboardStateManager_updateForExpectedRemoteDocumentStateChange_selectedTextRange_forceSync___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1827 copy];
  uint64_t v1 = (void *)qword_1EB25FD78;
  qword_1EB25FD78 = v0;
}

uint64_t __98___UIKeyboardStateManager_updateForExpectedRemoteDocumentStateChange_selectedTextRange_forceSync___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __98___UIKeyboardStateManager_updateForExpectedRemoteDocumentStateChange_selectedTextRange_forceSync___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 updateReturnKey:0];
  [v3 returnExecutionToParent];
}

uint64_t __92___UIKeyboardStateManager_assertTextForRemoteDocument_withSelectionDelta_updatingSelection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateForChangedSelection];
}

void __92___UIKeyboardStateManager_handleEventFromRemoteSource_chooseSupplementalItem_toReplaceText___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 remoteTextInputPartner];
  objc_msgSend(v7, "forwardEventCallbackToRemoteSource_didChooseSupplementalItem:toReplaceText:", v6, v5);
}

void __92___UIKeyboardStateManager_handleEventFromRemoteSource_chooseSupplementalItem_toReplaceText___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = WeakRetained;
  if (WeakRetained
    && (uint64_t v5 = *(void *)(a1 + 64),
        v5 == [WeakRetained lastChooseSupplementalItemToInsertCallbackIdentifier])
    && ([v4 setPendingSupplementalCandidateToInsert:0], v8))
  {
    id v6 = [v4 _rangeForSupplementalItemText:*(void *)(a1 + 32)];
    id v7 = [v4 inputDelegate];
    [v7 _range:*(void *)(a1 + 40) isEqualToRange:v6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __107___UIKeyboardStateManager_handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1846 copy];
  uint64_t v1 = (void *)qword_1EB25FD88;
  qword_1EB25FD88 = v0;
}

uint64_t __107___UIKeyboardStateManager_handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __107___UIKeyboardStateManager_handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  int v3 = [*(id *)(*(void *)(a1 + 32) + 624) canSuggestSupplementalItemsForCurrentSelection];
  [*(id *)(*(void *)(a1 + 32) + 624) setCanSuggestSupplementalItemsForCurrentSelection:*(unsigned __int8 *)(a1 + 40)];
  if (*(unsigned __int8 *)(a1 + 40) != v3)
  {
    int v4 = [*(id *)(a1 + 32) usesCandidateSelection];
    uint64_t v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "generateCandidatesAsynchronouslyWithRange:selectedCandidate:", 0, 0x7FFFFFFFLL, 0);
    }
    else
    {
      id v6 = [v5 autocorrectionController];
      [v6 setNeedsAutocorrection];
    }
  }
  [v7 returnExecutionToParent];
}

void __77___UIKeyboardStateManager_handleEventFromRemoteSource_insertAutofillContent___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1850 copy];
  uint64_t v1 = (void *)qword_1EB25FD98;
  qword_1EB25FD98 = v0;
}

uint64_t __77___UIKeyboardStateManager_handleEventFromRemoteSource_insertAutofillContent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __77___UIKeyboardStateManager_handleEventFromRemoteSource_insertAutofillContent___block_invoke_3(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  [v3 performKeyboardOutput:v4];
  uint64_t v5 = [*(id *)(a1 + 32) remoteTextInputPartner];
  [v5 documentStateChanged];

  [v6 returnExecutionToParent];
}

void __50___UIKeyboardStateManager_createTypoTrackerReport__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50___UIKeyboardStateManager_createTypoTrackerReport__block_invoke_2;
  v5[3] = &unk_1E52D9F98;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __50___UIKeyboardStateManager_createTypoTrackerReport__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentKeyboardFeedbackAssistantViewControllerForLogURL:*(void *)(a1 + 40)];
}

void __61___UIKeyboardStateManager__performInputViewControllerOutput___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1859 copy];
  uint64_t v1 = (void *)qword_1EB25FDA8;
  qword_1EB25FDA8 = v0;
}

uint64_t __61___UIKeyboardStateManager__performInputViewControllerOutput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __61___UIKeyboardStateManager__performInputViewControllerOutput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) source];
  uint64_t v5 = *(void **)(a1 + 40);
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61___UIKeyboardStateManager__performInputViewControllerOutput___block_invoke_4;
    v6[3] = &unk_1E52DCB30;
    void v6[4] = v5;
    id v7 = *(id *)(a1 + 32);
    id v8 = v3;
    objc_msgSend(v5, "performOperations:withTextInputSource:", v6, objc_msgSend(*(id *)(a1 + 32), "source"));
  }
  else
  {
    [*(id *)(a1 + 40) _processInputViewControllerKeyboardOutput:*(void *)(a1 + 32) executionContext:v3];
  }
}

uint64_t __61___UIKeyboardStateManager__performInputViewControllerOutput___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processInputViewControllerKeyboardOutput:*(void *)(a1 + 40) executionContext:*(void *)(a1 + 48)];
}

void __51___UIKeyboardStateManager__requestInputManagerSync__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1863 copy];
  uint64_t v1 = (void *)qword_1EB25FDB8;
  qword_1EB25FDB8 = v0;
}

uint64_t __51___UIKeyboardStateManager__requestInputManagerSync__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __51___UIKeyboardStateManager__requestInputManagerSync__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) syncInputManagerToKeyboardStateWithExecutionContext:a2];
}

void __71___UIKeyboardStateManager_showFirstTextAlternativeWithRangeAdjustment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  if (v9)
  {
    id v19 = v9;
    char v10 = [*(id *)(a1 + 32) inputDelegate];
    id v11 = [v10 interactionAssistant];
    char v12 = [*(id *)(a1 + 32) inputDelegateManager];
    int v13 = objc_msgSend(v12, "_textRangeFromNSRange:", a3, a4);
    [v11 scheduleDictationReplacementsForAlternatives:v19 range:v13];

    id v9 = v19;
    *a5 = 1;
  }
  uint64_t v14 = a3 + a4;
  unint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 32);
  if (v15 >= a3 + a4)
  {
    unint64_t v17 = v15 - (a3 + a4);
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 48);
    unint64_t v17 = 0;
  }
  *(void *)(v16 + 328) = v14;
  *(void *)(v16 + 336) = v17;
  if (*a5) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = *(void *)(*(void *)(a1 + 32) + 336) == 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v18;
}

@end