@interface MSDCodeEntryAlertController
- (MSDCodeEntryAlertController)initWithVerificationCode:(id)a3 completion:(id)a4;
- (id)completion;
- (void)didCompleteVerification:(BOOL)a3 forCode:(id)a4;
- (void)setCompletion:(id)a3;
@end

@implementation MSDCodeEntryAlertController

- (MSDCodeEntryAlertController)initWithVerificationCode:(id)a3 completion:(id)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(MSDCodeEntryAlertController *)self initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    [(MSDCodeEntryAlertController *)v8 setCompletion:v7];
    [(MSDCodeEntryAlertController *)v9 setPreferredStyle:1];
    v24 = +[MSDSetupUILocalization localizedStringForKey:@"DDL_AUTHENTICATION_TITLE"];
    v10 = +[MSDSetupUILocalization localizedStringForKey:@"DDL_AUTHENTICATION_DESCRIPTION"];
    v23 = +[MSDSetupUILocalization localizedStringForKey:@"DDL_AUTHENTICATION_ERROR_DESCRIPTION"];
    v11 = +[MSDSetupUILocalization localizedStringForKey:@"CANCEL_OPTION"];
    v12 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v10];
    uint64_t v13 = [v10 rangeOfString:@"demounit.apple.com"];
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = v13;
      uint64_t v16 = v14;
      uint64_t v28 = *MEMORY[0x263F815F8];
      v17 = [NSNumber numberWithInteger:1];
      v29[0] = v17;
      v18 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      objc_msgSend(v12, "addAttributes:range:", v18, v15, v16);
    }
    v19 = [[MSDCodeEntryContentViewController alloc] initWithTitle:v24 message:v12 verificationCode:v6 verificationErrorMesssage:v23 andDelegate:v9];
    [(MSDCodeEntryAlertController *)v9 setContentViewController:v19];
    objc_initWeak(&location, v9);
    v20 = (void *)MEMORY[0x263F1C3F0];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __67__MSDCodeEntryAlertController_initWithVerificationCode_completion___block_invoke;
    v25[3] = &unk_264D88228;
    objc_copyWeak(&v26, &location);
    v21 = [v20 actionWithTitle:v11 style:1 handler:v25];
    [(MSDCodeEntryAlertController *)v9 addAction:v21];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v9;
}

void __67__MSDCodeEntryAlertController_initWithVerificationCode_completion___block_invoke(uint64_t a1)
{
  v2 = defaultLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_23911B000, v2, OS_LOG_TYPE_DEFAULT, "Verification Code Alert cancelled", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained completion];
    v5[2](v5, 0);
  }
}

- (void)didCompleteVerification:(BOOL)a3 forCode:(id)a4
{
  if (a3)
  {
    v4 = [(MSDCodeEntryAlertController *)self completion];
    v4[2](v4, 1);
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end