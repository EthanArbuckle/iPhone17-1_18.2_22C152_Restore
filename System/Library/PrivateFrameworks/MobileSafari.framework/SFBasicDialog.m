@interface SFBasicDialog
- (BOOL)alertControllerPresentsAsActionSheet;
- (BOOL)canceledOnApplicationBackground;
- (BOOL)canceledOnCommittedNavigation;
- (BOOL)canceledOnProvisionalNavigation;
- (BOOL)completionHandlerBlocksWebProcess;
- (BOOL)shouldHideWebContent;
- (NSArray)actions;
- (NSArray)additionalCancellationExemptions;
- (NSString)defaultPassword;
- (NSString)defaultText;
- (NSString)message;
- (NSString)passwordPlaceholder;
- (NSString)textPlaceholder;
- (NSString)title;
- (SFBasicDialog)init;
- (UIImage)icon;
- (id)completionHandler;
- (id)newDialogViewRepresentation;
- (id)newViewControllerRepresentationWithCompletionHandler:(id)a3;
- (id)responseForSelectionIndex:(unint64_t)a3;
- (int64_t)presentationStyle;
- (void)didCompleteWithResponse:(id)a3;
- (void)setActions:(id)a3;
- (void)setAdditionalCancellationExemptions:(id)a3;
- (void)setAlertControllerPresentsAsActionSheet:(BOOL)a3;
- (void)setCanceledOnApplicationBackground:(BOOL)a3;
- (void)setCanceledOnCommittedNavigation:(BOOL)a3;
- (void)setCanceledOnProvisionalNavigation:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCompletionHandlerBlocksWebProcess:(BOOL)a3;
- (void)setDefaultPassword:(id)a3;
- (void)setDefaultText:(id)a3;
- (void)setIcon:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPasswordPlaceholder:(id)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setShouldHideWebContent:(BOOL)a3;
- (void)setTextPlaceholder:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFBasicDialog

- (SFBasicDialog)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFBasicDialog;
  v2 = [(SFBasicDialog *)&v7 init];
  v6.receiver = v2;
  v6.super_class = (Class)SFBasicDialog;
  v2->_canceledOnProvisionalNavigation = [(SFDialog *)&v6 canceledOnProvisionalNavigation];
  v5.receiver = v2;
  v5.super_class = (Class)SFBasicDialog;
  v2->_canceledOnCommittedNavigation = [(SFDialog *)&v5 canceledOnCommittedNavigation];
  v4.receiver = v2;
  v4.super_class = (Class)SFBasicDialog;
  v2->_canceledOnApplicationBackground = [(SFDialog *)&v4 canceledOnApplicationBackground];
  return v2;
}

- (id)newDialogViewRepresentation
{
  v3 = objc_alloc_init(SFDialogView);
  objc_super v4 = [(SFBasicDialog *)self title];
  [(SFDialogView *)v3 setTitleText:v4];

  objc_super v5 = [(SFBasicDialog *)self message];
  [(SFDialogView *)v3 setMessageText:v5];

  objc_super v6 = [(SFBasicDialog *)self defaultText];
  objc_super v7 = [(SFBasicDialog *)self textPlaceholder];
  [(SFDialogView *)v3 setInputText:v6 placeholder:v7];

  v8 = [(SFBasicDialog *)self defaultPassword];
  v9 = [(SFBasicDialog *)self passwordPlaceholder];
  [(SFDialogView *)v3 setPasswordText:v8 placeholder:v9];

  v10 = [(SFBasicDialog *)self actions];
  [(SFDialogView *)v3 setDialogActions:v10];

  [(SFDialogView *)v3 setUsesOpaqueAppearance:[(SFBasicDialog *)self shouldHideWebContent]];
  return v3;
}

- (id)newViewControllerRepresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = !self->_alertControllerPresentsAsActionSheet;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1418]);
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:self->_title];
  uint64_t v8 = *MEMORY[0x1E4FB06F8];
  v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  objc_msgSend(v7, "addAttribute:value:range:", v8, v9, 0, objc_msgSend(v7, "length"));

  [v6 _setAttributedTitle:v7];
  [v6 setTitle:self->_title];
  [v6 setMessage:self->_message];
  [v6 setPreferredStyle:v5];
  [v6 setImage:self->_icon];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3042000000;
  v29[3] = __Block_byref_object_copy__4;
  v29[4] = __Block_byref_object_dispose__4;
  id v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3042000000;
  v27[3] = __Block_byref_object_copy__4;
  v27[4] = __Block_byref_object_dispose__4;
  id v28 = 0;
  if (*(_OWORD *)&self->_defaultText != 0)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke;
    v26[3] = &unk_1E54EBCD0;
    v26[4] = self;
    v26[5] = v29;
    [v6 addTextFieldWithConfigurationHandler:v26];
  }
  if (self->_defaultPassword || self->_passwordPlaceholder)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_2;
    v25[3] = &unk_1E54EBCD0;
    v25[4] = self;
    v25[5] = v27;
    [v6 addTextFieldWithConfigurationHandler:v25];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E54EBCF8;
  id v10 = v4;
  id v22 = v10;
  v23 = v29;
  v24 = v27;
  v11 = _Block_copy(aBlock);
  v12 = [(SFBasicDialog *)self actions];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_4;
  v18[3] = &unk_1E54EBD68;
  id v13 = v11;
  id v20 = v13;
  id v14 = v6;
  id v19 = v14;
  [v12 enumerateObjectsUsingBlock:v18];

  v15 = v19;
  id v16 = v14;

  _Block_object_dispose(v27, 8);
  objc_destroyWeak(&v28);
  _Block_object_dispose(v29, 8);
  objc_destroyWeak(&v30);

  return v16;
}

void __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 64);
  id obj = a2;
  [obj setText:v3];
  [obj setPlaceholder:*(void *)(*(void *)(a1 + 32) + 72)];
  objc_storeWeak((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
  id obj = a2;
  [obj setText:v3];
  [obj setPlaceholder:*(void *)(*(void *)(a1 + 32) + 88)];
  [obj setSecureTextEntry:1];
  objc_storeWeak((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_3(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1[5] + 8) + 40));
  BOOL v5 = [WeakRetained text];
  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1[6] + 8) + 40));
  objc_super v7 = [v6 text];
  uint64_t v8 = makeBasicDialogResponse(a2, v5, v7);
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v8);
}

void __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 actionType];
  if (v6 == 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = v6 == 1;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4FB1410];
  v9 = [v5 title];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_5;
  v15 = &unk_1E54EBD20;
  id v16 = *(id *)(a1 + 40);
  uint64_t v17 = a3;
  id v10 = [v8 _actionWithTitle:v9 image:0 style:v7 handler:&v12 shouldDismissHandler:&__block_literal_global_31];

  objc_msgSend(*(id *)(a1 + 32), "addAction:", v10, v12, v13, v14, v15);
  int v11 = [v5 isPreferredAction];

  if (v11) {
    [*(id *)(a1 + 32) setPreferredAction:v10];
  }
}

uint64_t __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __70__SFBasicDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke_6()
{
  return 0;
}

- (id)responseForSelectionIndex:(unint64_t)a3
{
  return makeBasicDialogResponse(a3, 0, 0);
}

- (void)didCompleteWithResponse:(id)a3
{
  id v4 = a3;
  completionHandler = (void (**)(id, uint64_t, void *, void *))self->_completionHandler;
  id v10 = v4;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "safari_numberForKey:", @"selectedActionIndex");
    uint64_t v7 = [v6 unsignedIntegerValue];
    uint64_t v8 = objc_msgSend(v10, "safari_stringForKey:", @"text");
    v9 = objc_msgSend(v10, "safari_stringForKey:", @"password");
    completionHandler[2](completionHandler, v7, v8, v9);
  }
  else
  {
    completionHandler[2](completionHandler, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
  }
}

- (BOOL)canceledOnProvisionalNavigation
{
  return self->_canceledOnProvisionalNavigation;
}

- (void)setCanceledOnProvisionalNavigation:(BOOL)a3
{
  self->_canceledOnProvisionalNavigation = a3;
}

- (BOOL)canceledOnCommittedNavigation
{
  return self->_canceledOnCommittedNavigation;
}

- (void)setCanceledOnCommittedNavigation:(BOOL)a3
{
  self->_canceledOnCommittedNavigation = a3;
}

- (BOOL)canceledOnApplicationBackground
{
  return self->_canceledOnApplicationBackground;
}

- (void)setCanceledOnApplicationBackground:(BOOL)a3
{
  self->_canceledOnApplicationBackground = a3;
}

- (NSArray)additionalCancellationExemptions
{
  return self->_additionalCancellationExemptions;
}

- (void)setAdditionalCancellationExemptions:(id)a3
{
}

- (BOOL)completionHandlerBlocksWebProcess
{
  return self->_completionHandlerBlocksWebProcess;
}

- (void)setCompletionHandlerBlocksWebProcess:(BOOL)a3
{
  self->_completionHandlerBlocksWebProcess = a3;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)defaultText
{
  return self->_defaultText;
}

- (void)setDefaultText:(id)a3
{
}

- (NSString)textPlaceholder
{
  return self->_textPlaceholder;
}

- (void)setTextPlaceholder:(id)a3
{
}

- (NSString)defaultPassword
{
  return self->_defaultPassword;
}

- (void)setDefaultPassword:(id)a3
{
}

- (NSString)passwordPlaceholder
{
  return self->_passwordPlaceholder;
}

- (void)setPasswordPlaceholder:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (BOOL)alertControllerPresentsAsActionSheet
{
  return self->_alertControllerPresentsAsActionSheet;
}

- (void)setAlertControllerPresentsAsActionSheet:(BOOL)a3
{
  self->_alertControllerPresentsAsActionSheet = a3;
}

- (BOOL)shouldHideWebContent
{
  return self->_shouldHideWebContent;
}

- (void)setShouldHideWebContent:(BOOL)a3
{
  self->_shouldHideWebContent = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_passwordPlaceholder, 0);
  objc_storeStrong((id *)&self->_defaultPassword, 0);
  objc_storeStrong((id *)&self->_textPlaceholder, 0);
  objc_storeStrong((id *)&self->_defaultText, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_additionalCancellationExemptions, 0);
}

@end