@interface UIKeyboardHiddenViewController_Autofill
- (BOOL)isValidedString:(id)a3;
- (id)customInfoFromCredential:(id)a3;
- (void)passwordViewController:(id)a3 selectedCredential:(id)a4;
- (void)presentViewController:(BOOL)a3;
- (void)setAutofillVC:(id)a3;
@end

@implementation UIKeyboardHiddenViewController_Autofill

- (void)setAutofillVC:(id)a3
{
  p_autofillVC = &self->super._autofillVC;
  objc_storeStrong((id *)&self->super._autofillVC, a3);
  id v6 = a3;
  [(_SFPasswordViewController *)*p_autofillVC setDelegate:self];
}

- (void)presentViewController:(BOOL)a3
{
  v4 = self;
  uint64_t v5 = [(UIKeyboardHiddenViewController *)self autofillVC];
  if (v5
    && (id v6 = (void *)v5,
        [(UIKeyboardHiddenViewController *)v4 autofillVC],
        v7 = objc_claimAutoreleasedReturnValue(),
        get_SFAppAutoFillPasswordViewControllerClass(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) != 0))
  {
    v9 = [(UIKeyboardHiddenViewController *)v4 autofillVC];
  }
  else
  {
    v9 = 0;
  }
  v10 = +[UIKeyboardImpl activeInstance];
  v11 = [v10 _autofillContext];
  v12 = [v11 objectForKey:@"_WebViewURL"];

  [v9 setWebViewURL:v12];
  v13 = +[UIKeyboardImpl activeInstance];
  v14 = [v13 _remoteAppId];

  [v9 setRemoteAppID:v14];
  v15 = +[UIKeyboardImpl activeInstance];
  v16 = [v15 _remoteLocalizedAppName];

  [v9 setRemoteLocalizedAppName:v16];
  v17 = +[UIKeyboardImpl activeInstance];
  v18 = [v17 _remoteUnlocalizedAppName];

  [v9 setRemoteUnlocalizedAppName:v18];
  v19 = +[UIKeyboardImpl activeInstance];
  v20 = [v19 _remoteAssociatedDomains];

  [v9 setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:v20];
  if (objc_opt_respondsToSelector())
  {
    +[UIKeyboardImpl activeInstance];
    v21 = BOOL v38 = a3;
    [v21 _autofillContext];
    v22 = v37 = v4;
    v23 = [v22 objectForKey:@"_credential_type"];

    v24 = +[UIKeyboardImpl activeInstance];
    v25 = [v24 _autofillContext];
    [v25 objectForKey:@"_page_id"];
    v36 = v16;
    v27 = v26 = v12;

    v28 = +[UIKeyboardImpl activeInstance];
    v29 = [v28 _autofillContext];
    [v29 objectForKey:@"_frame_id"];
    v31 = v30 = v14;

    a3 = v38;
    v4 = v37;
    [v9 setPageID:v27 frameID:v31 credentialType:v23];

    v14 = v30;
    v12 = v26;
    v16 = v36;
  }
  uint64_t v32 = [(UIKeyboardHiddenViewController *)v4 shouldPresentAsPopover];
  v33 = v4;
  uint64_t v34 = v32;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __65__UIKeyboardHiddenViewController_Autofill_presentViewController___block_invoke;
  v39[3] = &unk_1E52DF270;
  id v40 = v9;
  v41 = v33;
  BOOL v42 = a3;
  id v35 = v9;
  [v35 authenticateToPresentInPopover:v34 completion:v39];
}

- (BOOL)isValidedString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_1EB261FC0 != -1)
  {
    dispatch_once(&qword_1EB261FC0, &__block_literal_global_396);
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
  BOOL v5 = [v4 rangeOfCharacterFromSet:_MergedGlobals_1166] == 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

  return v5;
}

- (id)customInfoFromCredential:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 user];
  if ([(UIKeyboardHiddenViewController_Autofill *)self isValidedString:v5])
  {
    id v6 = [v4 user];
  }
  else
  {
    id v6 = &stru_1ED0E84C0;
  }

  v7 = [v4 password];
  if ([(UIKeyboardHiddenViewController_Autofill *)self isValidedString:v7])
  {
    v8 = [v4 password];
  }
  else
  {
    v8 = &stru_1ED0E84C0;
  }

  uint64_t v9 = *MEMORY[0x1E4FAE918];
  v12[0] = *MEMORY[0x1E4FAE938];
  v12[1] = v9;
  v13[0] = v6;
  v13[1] = v8;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

- (void)passwordViewController:(id)a3 selectedCredential:(id)a4
{
  id v5 = [(UIKeyboardHiddenViewController_Autofill *)self customInfoFromCredential:a4];
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 processPayloadInfo:v5];
}

@end