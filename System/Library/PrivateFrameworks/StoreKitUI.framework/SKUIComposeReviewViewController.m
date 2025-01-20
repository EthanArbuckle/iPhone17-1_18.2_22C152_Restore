@interface SKUIComposeReviewViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
- (BOOL)isEdit;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (SKUIComposeReviewViewController)init;
- (SKUIReviewMetadata)editedReviewMetadata;
- (SKUIWriteAReviewTemplateViewElement)templateViewElement;
- (int64_t)preferredStatusBarStyle;
- (void)_attemptReviewSubmission;
- (void)_finishLoadWithOutput:(id)a3 error:(id)a4;
- (void)_loadReviewWithURL:(id)a3 completionBlock:(id)a4;
- (void)_promptForNickname;
- (void)_promptForNicknameWithAlert;
- (void)_sendDidCancel;
- (void)_sendDidSubmit;
- (void)_setNickname:(id)a3;
- (void)_setNicknameShouldResetOnError:(BOOL)a3;
- (void)composeReviewFormDidSubmit:(id)a3;
- (void)composeReviewNicknameDidCancel:(id)a3;
- (void)composeReviewNicknameDidConfirm:(id)a3 nickname:(id)a4;
- (void)dealloc;
- (void)loadReviewWithURL:(id)a3 completionBlock:(id)a4;
- (void)setEdit:(BOOL)a3;
- (void)setRating:(float)a3;
- (void)setTemplateViewElement:(id)a3;
- (void)submitReview;
@end

@implementation SKUIComposeReviewViewController

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (SKUIComposeReviewViewController)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB88D8]);
  v4 = (void *)MEMORY[0x1E4FB88B0];
  v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v6 = [v4 gradientWithColor:v5];
  [v3 setBackgroundGradient:v6];

  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"WRITE_A_REVIEW" value:&stru_1F1C879E8 table:0];
  [v3 setTitle:v8];

  v18.receiver = self;
  v18.super_class = (Class)SKUIComposeReviewViewController;
  v9 = [(SUNavigationController *)&v18 initWithRootViewController:v3];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeholderViewController, v3);
    id v11 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
    [v11 setAction:sel__cancelAction_];
    [v11 setTarget:v10];
    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"CANCEL" value:&stru_1F1C879E8 table:0];
    [v11 setTitle:v13];

    v14 = [(SUPlaceholderViewController *)v10->_placeholderViewController navigationItem];
    [v14 setLeftBarButtonItem:v11];

    v15 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v16 = [v15 userInterfaceIdiom];

    if (v16 == 1) {
      [(SKUIComposeReviewViewController *)v10 setModalPresentationStyle:2];
    }
  }
  return v10;
}

- (void)dealloc
{
  [(SKUIComposeReviewFormViewController *)self->_formViewController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIComposeReviewViewController;
  [(SUNavigationController *)&v3 dealloc];
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (SKUIReviewMetadata)editedReviewMetadata
{
  objc_super v3 = [(SKUIComposeReviewFormViewController *)self->_formViewController editedReviewMetadata];
  v4 = v3;
  if (self->_nickname) {
    objc_msgSend(v3, "setNickname:");
  }

  return (SKUIReviewMetadata *)v4;
}

- (void)loadReviewWithURL:(id)a3 completionBlock:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = v6;
  if (v8)
  {
    [(SKUIComposeReviewViewController *)self _loadReviewWithURL:v8 completionBlock:v6];
  }
  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)setRating:(float)a3
{
}

- (void)submitReview
{
  uint64_t v3 = *MEMORY[0x1E4FB2748];
  v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__SKUIComposeReviewViewController_submitReview__block_invoke;
  v20[3] = &__block_descriptor_40_e5_v8__0l;
  v20[4] = v3;
  v7 = (void *)[v4 beginBackgroundTaskWithName:v6 expirationHandler:v20];

  id v8 = [SKUIPostReviewOperation alloc];
  v9 = [(SKUIComposeReviewViewController *)self editedReviewMetadata];
  v10 = [(SKUIPostReviewOperation *)v8 initWithReviewMetadata:v9];

  objc_initWeak(&location, v10);
  objc_initWeak(&from, self);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __47__SKUIComposeReviewViewController_submitReview__block_invoke_2;
  v15 = &unk_1E64236C8;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(v17, &from);
  v17[1] = v7;
  [(SKUIPostReviewOperation *)v10 setCompletionBlock:&v12];
  id v11 = objc_msgSend(MEMORY[0x1E4FB8838], "mainQueue", v12, v13, v14, v15);
  [v11 addOperation:v10];

  objc_destroyWeak(v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __47__SKUIComposeReviewViewController_submitReview__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 endBackgroundTask:*(void *)(a1 + 32)];
}

void __47__SKUIComposeReviewViewController_submitReview__block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SKUIComposeReviewViewController_submitReview__block_invoke_3;
  block[3] = &unk_1E64236A0;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  objc_copyWeak(v6, a1 + 5);
  v6[1] = a1[6];
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v6);
}

void __47__SKUIComposeReviewViewController_submitReview__block_invoke_3(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  v23 = [*(id *)(a1 + 32) responseDictionary];
  if (([*v1 success] & 1) == 0 && v23)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v22 = (id)[objc_alloc(MEMORY[0x1E4FA8148]) initWithResponseDictionary:v23];
    obuint64_t j = [v22 actions];
    uint64_t v2 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v2)
    {
      uint64_t v3 = *(void *)v34;
      uint64_t v4 = *MEMORY[0x1E4FA8900];
      while (2)
      {
        for (uint64_t i = 0; i != v2; ++i)
        {
          if (*(void *)v34 != v3) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v7 = [v6 actionType];
          int v8 = [v7 isEqualToString:v4];

          if (v8)
          {
            v21 = [v6 dialog];
            v9 = (void *)MEMORY[0x1E4FB1418];
            v10 = [v21 title];
            id v11 = [v21 message];
            uint64_t v12 = [v9 alertControllerWithTitle:v10 message:v11 preferredStyle:1];

            [v21 buttons];
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id v26 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v13 = [v26 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v30;
              do
              {
                for (uint64_t j = 0; j != v13; ++j)
                {
                  if (*(void *)v30 != v14) {
                    objc_enumerationMutation(v26);
                  }
                  id v16 = (void *)MEMORY[0x1E4FB1410];
                  v17 = [*(id *)(*((void *)&v29 + 1) + 8 * j) buttonTitle];
                  v27[0] = MEMORY[0x1E4F143A8];
                  v27[1] = 3221225472;
                  v27[2] = __47__SKUIComposeReviewViewController_submitReview__block_invoke_4;
                  v27[3] = &unk_1E6423678;
                  objc_copyWeak(&v28, (id *)(a1 + 40));
                  objc_super v18 = [v16 actionWithTitle:v17 style:0 handler:v27];

                  [v12 addAction:v18];
                  objc_destroyWeak(&v28);
                }
                uint64_t v13 = [v26 countByEnumeratingWithState:&v29 objects:v37 count:16];
              }
              while (v13);
            }

            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
            [WeakRetained presentViewController:v12 animated:1 completion:0];

            goto LABEL_21;
          }
        }
        uint64_t v2 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }
  }
  id v22 = objc_loadWeakRetained((id *)(a1 + 40));
  [v22 _sendDidSubmit];
LABEL_21:

  if (*(void *)(a1 + 48) != *MEMORY[0x1E4FB2748])
  {
    v20 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v20 endBackgroundTask:*(void *)(a1 + 48)];
  }
}

void __47__SKUIComposeReviewViewController_submitReview__block_invoke_4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setNicknameShouldResetOnError:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _setNickname:0];
}

- (void)composeReviewFormDidSubmit:(id)a3
{
  id v8 = [(SKUIComposeReviewViewController *)self editedReviewMetadata];
  uint64_t v4 = [v8 nickname];
  if (v4
    && (id v5 = (void *)v4,
        [v8 nickname],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v5,
        v7))
  {
    [(SKUIComposeReviewViewController *)self _attemptReviewSubmission];
  }
  else
  {
    [(SKUIComposeReviewViewController *)self _promptForNickname];
  }
}

- (void)composeReviewNicknameDidCancel:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = self->_formViewController;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(SKUIComposeReviewViewController *)self setViewControllers:v4 animated:1];
}

- (void)composeReviewNicknameDidConfirm:(id)a3 nickname:(id)a4
{
  id v5 = a4;
  if ([v5 length])
  {
    [(SKUIComposeReviewViewController *)self _setNickname:v5];
    [(SKUIComposeReviewViewController *)self _setNicknameShouldResetOnError:1];
    [(SKUIComposeReviewViewController *)self _attemptReviewSubmission];
  }
  else
  {
    [(SKUIComposeReviewViewController *)self _promptForNickname];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  v10 = [a3 text];
  id v11 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  -[UIAlertAction setEnabled:](self->_nicknameOKAction, "setEnabled:", [v11 length] != 0);
  return 1;
}

- (void)_attemptReviewSubmission
{
  id v4 = [(SKUIComposeReviewViewController *)self editedReviewMetadata];
  id v3 = [(SKUIComposeReviewViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [v3 composeReviewViewController:self shouldSubmitReview:v4])
  {
    [(SKUIComposeReviewViewController *)self submitReview];
  }
}

- (void)_promptForNickname
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v3 = objc_alloc_init(SKUIComposeReviewNicknameViewController);
    nicknameViewController = self->_nicknameViewController;
    self->_nicknameViewController = v3;

    [(SKUIComposeReviewNicknameViewController *)self->_nicknameViewController setDelegate:self];
    id v5 = self->_nicknameViewController;
    v7[0] = self->_formViewController;
    v7[1] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
    [(SKUIComposeReviewViewController *)self setViewControllers:v6 animated:1];
  }
  else
  {
    [(SKUIComposeReviewViewController *)self _promptForNicknameWithAlert];
  }
}

- (void)_promptForNicknameWithAlert
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"NICKNAME_ALERT_TITLE" value:&stru_1F1C879E8 table:0];
  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"NICKNAME_ALERT_MESSAGE" value:&stru_1F1C879E8 table:0];
  id v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __62__SKUIComposeReviewViewController__promptForNicknameWithAlert__block_invoke;
  v25[3] = &unk_1E64236F0;
  v25[4] = self;
  [v8 addTextFieldWithConfigurationHandler:v25];
  id v9 = (void *)MEMORY[0x1E4FB1410];
  v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_1F1C879E8 table:0];
  uint64_t v12 = [v9 actionWithTitle:v11 style:1 handler:0];
  [v8 addAction:v12];

  objc_initWeak(&location, self);
  uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"OK" value:&stru_1F1C879E8 table:0];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __62__SKUIComposeReviewViewController__promptForNicknameWithAlert__block_invoke_2;
  v21 = &unk_1E6423718;
  objc_copyWeak(&v23, &location);
  id v16 = v8;
  id v22 = v16;
  v17 = [v13 actionWithTitle:v15 style:0 handler:&v18];

  objc_msgSend(v17, "setEnabled:", 0, v18, v19, v20, v21);
  [v16 addAction:v17];
  [v16 setPreferredAction:v17];
  objc_storeStrong((id *)&self->_nicknameOKAction, v17);
  [(SKUIComposeReviewViewController *)self presentViewController:v16 animated:1 completion:0];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __62__SKUIComposeReviewViewController__promptForNicknameWithAlert__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a2;
  id v4 = [v3 bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"NICKNAME_ALERT_PLACEHOLDER" value:&stru_1F1C879E8 table:0];
  [v6 setPlaceholder:v5];

  [v6 setDelegate:*(void *)(a1 + 32)];
}

void __62__SKUIComposeReviewViewController__promptForNicknameWithAlert__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 32) textFields];
  id v3 = [v2 firstObject];
  id v4 = [v3 text];

  if ([v4 length])
  {
    [WeakRetained _setNickname:v4];
    [WeakRetained _setNicknameShouldResetOnError:1];
    [WeakRetained _attemptReviewSubmission];
  }
  else
  {
    [WeakRetained _promptForNickname];
  }
}

- (void)_setNickname:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_nickname, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    nickname = self->_nickname;
    self->_nickname = v4;
  }
}

- (void)_setNicknameShouldResetOnError:(BOOL)a3
{
  if (self->_nicknameShouldResetOnError != a3) {
    self->_nicknameShouldResetOnError = a3;
  }
}

- (void)_finishLoadWithOutput:(id)a3 error:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4FB8878]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB8808]) initWithDialogDictionary:v7];
    }
    else {
      id v8 = 0;
    }
    id v9 = [(SKUIComposeReviewViewController *)self delegate];
    v10 = [v6 objectForKey:*MEMORY[0x1E4FB8880]];
    if (v10)
    {
      if (objc_opt_respondsToSelector())
      {
        [v9 composeReviewViewController:self didFailWithDialog:v8];
LABEL_21:

        goto LABEL_22;
      }
    }
    else if (!v8)
    {
      id v11 = [[SKUIReviewMetadata alloc] initWithReviewDictionary:v6];
      uint64_t v12 = [[SKUIComposeReviewFormViewController alloc] initWithReviewMetadata:v11];
      formViewController = self->_formViewController;
      self->_formViewController = v12;

      [(SKUIComposeReviewFormViewController *)self->_formViewController setDelegate:self];
      id v23 = v11;
      if (v11)
      {
        uint64_t v14 = [(SKUIReviewMetadata *)v11 title];
        if ([v14 length])
        {
          [(SKUIComposeReviewViewController *)self setEdit:1];
        }
        else
        {
          v15 = [(SKUIReviewMetadata *)v11 body];
          -[SKUIComposeReviewViewController setEdit:](self, "setEdit:", [v15 length] != 0);
        }
      }
      else
      {
        [(SKUIComposeReviewViewController *)self setEdit:0];
      }
      id v16 = self->_formViewController;
      BOOL v17 = [(SKUIComposeReviewViewController *)self isEdit];
      uint64_t v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v19 = v18;
      if (v17) {
        v20 = @"EDIT_REVIEW";
      }
      else {
        v20 = @"WRITE_A_REVIEW";
      }
      v21 = [v18 localizedStringForKey:v20 value:&stru_1F1C879E8 table:0];
      [(SUViewController *)v16 setTitle:v21];

      v24[0] = self->_formViewController;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      [(SUNavigationController *)self setViewControllers:v22];

      goto LABEL_21;
    }
    [(SKUIComposeReviewViewController *)self _sendDidCancel];
    goto LABEL_21;
  }
  [(SKUIComposeReviewViewController *)self _sendDidCancel];
LABEL_22:
}

- (void)_loadReviewWithURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB8858]);
  id v9 = [v8 authenticationContext];
  id v10 = (id)[v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x1E4FA8260]);
  }
  [v10 setCanSetActiveAccount:1];
  id v11 = (void *)[v10 copy];
  [v8 setAuthenticationContext:v11];

  uint64_t v12 = [MEMORY[0x1E4FB8848] provider];
  [v12 setShouldProcessDialogs:0];
  [v8 setDataProvider:v12];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FA8310]) initWithURL:v6];
  [v8 setRequestProperties:v13];
  objc_initWeak(&location, self);
  id v14 = v8;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __70__SKUIComposeReviewViewController__loadReviewWithURL_completionBlock___block_invoke;
  v21 = &unk_1E6423740;
  objc_copyWeak(&v24, &location);
  id v15 = v14;
  id v22 = v15;
  id v16 = v7;
  id v23 = v16;
  [v15 setCompletionBlock:&v18];
  -[SUPlaceholderViewController setSkLoading:](self->_placeholderViewController, "setSkLoading:", 1, v18, v19, v20, v21);
  BOOL v17 = [MEMORY[0x1E4FB8838] mainQueue];
  [v17 addOperation:v15];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __70__SKUIComposeReviewViewController__loadReviewWithURL_completionBlock___block_invoke(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SKUIComposeReviewViewController__loadReviewWithURL_completionBlock___block_invoke_2;
  block[3] = &unk_1E6423740;
  objc_copyWeak(&v5, a1 + 6);
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], block);
  [a1[4] setCompletionBlock:0];

  objc_destroyWeak(&v5);
}

void __70__SKUIComposeReviewViewController__loadReviewWithURL_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) dataProvider];
  id v4 = [v3 output];
  id v5 = [*(id *)(a1 + 32) error];
  [WeakRetained _finishLoadWithOutput:v4 error:v5];

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, 1, v7);
  }
}

- (void)_sendDidSubmit
{
  id v3 = [(SKUIComposeReviewViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 composeReviewViewControllerDidSubmit:self];
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "composeReviewViewController:didSubmitWithEdit:", self, -[SKUIComposeReviewViewController isEdit](self, "isEdit"));
  }
}

- (void)_sendDidCancel
{
  id v3 = [(SKUIComposeReviewViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 composeReviewViewControllerDidCancel:self];
  }
}

- (SKUIWriteAReviewTemplateViewElement)templateViewElement
{
  return self->_templateViewElement;
}

- (void)setTemplateViewElement:(id)a3
{
}

- (BOOL)isEdit
{
  return self->_edit;
}

- (void)setEdit:(BOOL)a3
{
  self->_edit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateViewElement, 0);
  objc_storeStrong((id *)&self->_nicknameOKAction, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_placeholderViewController, 0);
  objc_storeStrong((id *)&self->_nicknameViewController, 0);

  objc_storeStrong((id *)&self->_formViewController, 0);
}

@end