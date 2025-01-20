@interface UIDocumentAlertPresenter
+ (id)_presentAlertWithError:(id)a3 completionHandler:(id)a4;
- (UIDocumentAlertPresenter)initWithError:(id)a3 completionHandler:(id)a4;
- (void)_forceFinishNow;
- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4;
- (void)alertViewCancel:(id)a3;
- (void)dealloc;
@end

@implementation UIDocumentAlertPresenter

- (UIDocumentAlertPresenter)initWithError:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIDocumentAlertPresenter;
  v9 = [(UIDocumentAlertPresenter *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id completionHandler = v9->_completionHandler;
    v9->_id completionHandler = (id)v10;

    objc_storeStrong((id *)&v9->_error, a3);
  }

  return v9;
}

- (void)dealloc
{
  [(UIAlertView *)self->_alert setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)UIDocumentAlertPresenter;
  [(UIDocumentAlertPresenter *)&v3 dealloc];
}

+ (id)_presentAlertWithError:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [[UIDocumentAlertPresenter alloc] initWithError:v5 completionHandler:v6];
  id v8 = [UIAlertView alloc];
  v9 = [v5 localizedDescription];
  uint64_t v10 = [v5 localizedRecoverySuggestion];
  v11 = [(UIAlertView *)v8 initWithTitle:v9 message:v10 delegate:v7 cancelButtonTitle:0 otherButtonTitles:0];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v12 = objc_msgSend(v5, "localizedRecoveryOptions", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [(UIAlertView *)v11 addButtonWithTitle:*(void *)(*((void *)&v18 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  [(UIAlertView *)v11 show];
  return v7;
}

- (void)_forceFinishNow
{
  alert = self->_alert;
  uint64_t v3 = [(UIAlertView *)alert cancelButtonIndex];
  [(UIAlertView *)alert dismissWithClickedButtonIndex:v3 animated:0];
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  if ([a3 cancelButtonIndex] != a4)
  {
    id v6 = [(NSError *)self->_error recoveryAttempter];
    [v6 attemptRecoveryFromError:self->_error optionIndex:a4];
  }
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    id v8 = (void (*)(void))*((void *)completionHandler + 2);
    v8();
  }
}

- (void)alertViewCancel:(id)a3
{
  id completionHandler = (void (**)(id, void))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end