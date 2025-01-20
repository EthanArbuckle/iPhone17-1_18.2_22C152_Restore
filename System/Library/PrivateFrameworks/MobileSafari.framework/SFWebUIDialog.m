@interface SFWebUIDialog
- (BOOL)shouldIgnoreGlobalModalUIDisplayPolicy;
- (SFWebUIDialog)initWithAlert:(id)a3 completionHandler:(id)a4;
- (WebUIAlert)alert;
- (id)newViewControllerRepresentationWithCompletionHandler:(id)a3;
- (int64_t)presentationStyle;
- (void)didCompleteWithResponse:(id)a3;
@end

@implementation SFWebUIDialog

- (SFWebUIDialog)initWithAlert:(id)a3 completionHandler:(id)a4
{
  v6 = (WebUIAlert *)a3;
  v15.receiver = self;
  v15.super_class = (Class)SFWebUIDialog;
  id v7 = a4;
  v8 = [(SFWebUIDialog *)&v15 init];
  alert = v8->_alert;
  v8->_alert = v6;
  v10 = v6;

  v8->_finalAction = 0;
  v11 = _Block_copy(v7);

  id completionHandler = v8->_completionHandler;
  v8->_id completionHandler = v11;

  v13 = [(WebUIAlert *)v10 identities];

  v8->_shouldIgnoreGlobalModalUIDisplayPolicy = [v13 count] != 0;
  return v8;
}

- (BOOL)shouldIgnoreGlobalModalUIDisplayPolicy
{
  return self->_shouldIgnoreGlobalModalUIDisplayPolicy;
}

- (int64_t)presentationStyle
{
  return 1;
}

- (id)newViewControllerRepresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4FB6EF8];
  alert = self->_alert;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__SFWebUIDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E54EBD90;
  id v11 = v4;
  id v7 = v4;
  v8 = [v5 alertControllerForAlert:alert automaticallyDismiss:0 withCompletionHandler:v10];

  return v8;
}

void __70__SFWebUIDialog_newViewControllerRepresentationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInt:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)didCompleteWithResponse:(id)a3
{
  if (a3) {
    [a3 integerValue];
  }
  else {
    [(WebUIAlert *)self->_alert hideAction];
  }
  id v4 = (void (*)(void))*((void *)self->_completionHandler + 2);

  v4();
}

- (WebUIAlert)alert
{
  return self->_alert;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alert, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end