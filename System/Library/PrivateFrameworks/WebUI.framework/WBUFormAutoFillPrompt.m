@interface WBUFormAutoFillPrompt
+ (void)showAutoFillPromptInWebView:(id)a3 title:(id)a4 message:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitles:(id)a7 cancelWhenAppEntersBackground:(BOOL)a8 makeFirstButtonSuggestedAction:(BOOL)a9 headerViewController:(id)a10 completionHandler:(id)a11;
+ (void)showAutoFillPromptInWebView:(id)a3 title:(id)a4 message:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitles:(id)a7 makeFirstButtonSuggestedAction:(BOOL)a8 completionHandler:(id)a9;
- (void)_alertTextFieldDidChange:(id)a3;
- (void)showAutoFillPromptForUsernameInWebView:(id)a3 title:(id)a4 message:(id)a5 suggestedUsername:(id)a6 password:(id)a7 isGeneratedPassword:(BOOL)a8 completionHandler:(id)a9;
@end

@implementation WBUFormAutoFillPrompt

+ (void)showAutoFillPromptInWebView:(id)a3 title:(id)a4 message:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitles:(id)a7 makeFirstButtonSuggestedAction:(BOOL)a8 completionHandler:(id)a9
{
  LOBYTE(v9) = a8;
  [a1 showAutoFillPromptInWebView:a3 title:a4 message:a5 cancelButtonTitle:a6 otherButtonTitles:a7 cancelWhenAppEntersBackground:0 makeFirstButtonSuggestedAction:v9 headerViewController:0 completionHandler:a9];
}

+ (void)showAutoFillPromptInWebView:(id)a3 title:(id)a4 message:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitles:(id)a7 cancelWhenAppEntersBackground:(BOOL)a8 makeFirstButtonSuggestedAction:(BOOL)a9 headerViewController:(id)a10 completionHandler:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  id v22 = a11;
  v23 = v22;
  if (isShowingAlertController == 1)
  {
    if (v22) {
      (*((void (**)(id, uint64_t))v22 + 2))(v22, -1);
    }
  }
  else
  {
    BOOL v36 = a8;
    v24 = objc_msgSend(v16, "webui_preventNavigationDuringAutoFillPrompt");
    v25 = objc_msgSend(v16, "webui_presentingViewController");
    if ([v25 modalPresentationStyle] == 7) {
      [v25 dismissViewControllerAnimated:0 completion:0];
    }
    id v37 = v18;
    id v38 = v17;
    v26 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v17 message:v18 preferredStyle:1];
    v27 = v26;
    if (v21) {
      [v26 setContentViewController:v21];
    }
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke;
    v46[3] = &unk_2643F01C8;
    id v28 = v23;
    id v50 = v28;
    id v29 = v24;
    id v51 = v29;
    id v30 = v27;
    id v47 = v30;
    BOOL v52 = a9;
    id v48 = v21;
    id v49 = v20;
    [v49 enumerateObjectsUsingBlock:v46];
    v31 = (void *)MEMORY[0x263F1C3F0];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_3;
    v43[3] = &unk_2643F01F0;
    id v44 = v28;
    id v45 = v29;
    id v32 = v29;
    v33 = [v31 actionWithTitle:v19 style:1 handler:v43];
    [v30 addAction:v33];
    isShowingAlertController = 1;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_4;
    v39[3] = &unk_2643F0240;
    BOOL v42 = v36;
    id v40 = v30;
    id v41 = v33;
    id v34 = v33;
    id v35 = v30;
    [v25 presentViewController:v35 animated:1 completion:v39];

    id v18 = v37;
    id v17 = v38;
  }
}

void __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6 = (void *)MEMORY[0x263F1C3F0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_2;
  v8[3] = &unk_2643F01A0;
  id v9 = *(id *)(a1 + 56);
  uint64_t v11 = a3;
  id v10 = *(id *)(a1 + 64);
  v7 = [v6 actionWithTitle:a2 style:0 handler:v8];
  [*(id *)(a1 + 32) addAction:v7];
  if (!a3 && *(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) setPreferredAction:v7];
  }
  if (*(void *)(a1 + 40) && [*(id *)(a1 + 48) count] - 2 == a3) {
    [*(id *)(a1 + 32) _addSectionDelimiter];
  }
}

uint64_t __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_2(void *a1)
{
  isShowingAlertController = 0;
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:appWillEnterBackgroundObserver];

  v3 = (void *)appWillEnterBackgroundObserver;
  appWillEnterBackgroundObserver = 0;

  uint64_t v4 = a1[4];
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, a1[6]);
  }
  v5 = *(uint64_t (**)(void))(a1[5] + 16);
  return v5();
}

uint64_t __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_3(uint64_t a1)
{
  isShowingAlertController = 0;
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:appWillEnterBackgroundObserver];

  v3 = (void *)appWillEnterBackgroundObserver;
  appWillEnterBackgroundObserver = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, -1);
  }
  v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

void __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_4(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *MEMORY[0x263F1D050];
  uint64_t v4 = [MEMORY[0x263F1C408] sharedApplication];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_5;
  v7[3] = &unk_2643F0218;
  char v10 = *(unsigned char *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  uint64_t v5 = [v2 addObserverForName:v3 object:v4 queue:0 usingBlock:v7];
  v6 = (void *)appWillEnterBackgroundObserver;
  appWillEnterBackgroundObserver = v5;
}

uint64_t __203__WBUFormAutoFillPrompt_showAutoFillPromptInWebView_title_message_cancelButtonTitle_otherButtonTitles_cancelWhenAppEntersBackground_makeFirstButtonSuggestedAction_headerViewController_completionHandler___block_invoke_5(uint64_t result)
{
  if (*(unsigned char *)(result + 48)) {
    return [*(id *)(result + 32) _dismissWithAction:*(void *)(result + 40)];
  }
  return result;
}

- (void)showAutoFillPromptForUsernameInWebView:(id)a3 title:(id)a4 message:(id)a5 suggestedUsername:(id)a6 password:(id)a7 isGeneratedPassword:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = (void (**)(id, void))a9;
  if ((isShowingAlertController & 1) != 0 || ![v19 length])
  {
    if (v20) {
      v20[2](v20, 0);
    }
  }
  else
  {
    id v21 = objc_msgSend(v15, "webui_presentingViewController");
    if ([v21 modalPresentationStyle] == 7) {
      [v21 dismissViewControllerAnimated:0 completion:0];
    }
    id v40 = v21;
    id v43 = v16;
    id v22 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v16 message:v17 preferredStyle:1];
    objc_storeWeak((id *)&self->_alertController, v22);
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke;
    v53[3] = &unk_2643F0268;
    id v41 = v18;
    id v37 = v18;
    id v54 = v37;
    v55 = self;
    v39 = self;
    [v22 addTextFieldWithConfigurationHandler:v53];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke_2;
    v51[3] = &unk_2643F0290;
    id v52 = v19;
    [v22 addTextFieldWithConfigurationHandler:v51];
    v23 = objc_msgSend(v15, "webui_preventNavigationDuringAutoFillPrompt");
    v24 = _WBSLocalizedString();
    id v42 = v17;
    if (v9)
    {
      uint64_t v25 = _WBSLocalizedString();

      uint64_t v26 = 2;
      v24 = (void *)v25;
    }
    else
    {
      uint64_t v26 = 1;
    }
    v27 = (void *)MEMORY[0x263F1C3F0];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke_3;
    v48[3] = &unk_2643F01F0;
    id v28 = v20;
    id v49 = v28;
    id v29 = v23;
    id v50 = v29;
    id v38 = v24;
    id v30 = [v27 actionWithTitle:v24 style:v26 handler:v48];
    [v22 addAction:v30];

    v31 = (void *)MEMORY[0x263F1C3F0];
    id v32 = _WBSLocalizedString();
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke_4;
    v44[3] = &unk_2643F02B8;
    v44[4] = v39;
    id v33 = v37;
    id v45 = v33;
    v46 = v28;
    id v47 = v29;
    id v34 = v29;
    id v35 = [v31 actionWithTitle:v32 style:0 handler:v44];

    [v22 addAction:v35];
    [v22 setPreferredAction:v35];
    objc_msgSend(v35, "setEnabled:", objc_msgSend(v33, "length") != 0);
    isShowingAlertController = 1;
    BOOL v36 = [MEMORY[0x263F66258] sharedLogger];
    [v36 didPresentUsernamePrompt];

    [v40 presentViewController:v22 animated:1 completion:0];
    id v16 = v43;
    id v18 = v41;
    id v17 = v42;
  }
}

void __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = _WBSLocalizedString();
  [v4 setPlaceholder:v3];

  [v4 setText:*(void *)(a1 + 32)];
  [v4 setKeyboardType:7];
  [v4 addTarget:*(void *)(a1 + 40) action:sel__alertTextFieldDidChange_ forControlEvents:0x20000];
}

void __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 substringToIndex:1];
  v6 = objc_msgSend(v5, "stringByPaddingToLength:withString:startingAtIndex:", objc_msgSend(*(id *)(a1 + 32), "length"), @"•", 0);
  [v4 setText:v6];

  [v4 setUserInteractionEnabled:0];
  id v7 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v4 setTextColor:v7];
}

uint64_t __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke_3(uint64_t a1)
{
  isShowingAlertController = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __143__WBUFormAutoFillPrompt_showAutoFillPromptForUsernameInWebView_title_message_suggestedUsername_password_isGeneratedPassword_completionHandler___block_invoke_4(uint64_t a1)
{
  isShowingAlertController = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v3 = [WeakRetained textFields];
  id v4 = [v3 firstObject];
  uint64_t v5 = [v4 text];
  v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v9 = [v5 stringByTrimmingCharactersInSet:v6];

  if ([*(id *)(a1 + 40) length])
  {
    id v7 = [MEMORY[0x263F66258] sharedLogger];
    objc_msgSend(v7, "didSuggestUsernameInPromptAndUserKeptSuggestion:", objc_msgSend(v9, "isEqualToString:", *(void *)(a1 + 40)));
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_alertTextFieldDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);
  uint64_t v3 = [WeakRetained textFields];
  id v4 = [v3 firstObject];
  uint64_t v5 = [v4 text];
  v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];

  BOOL v8 = [v7 length] != 0;
  id v9 = [WeakRetained actions];
  char v10 = [v9 objectAtIndexedSubscript:1];
  [v10 setEnabled:v8];
}

- (void).cxx_destruct
{
}

@end