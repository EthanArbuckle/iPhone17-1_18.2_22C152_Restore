@interface PSTrackingWelcomeController
- (OBTextWelcomeController)controller;
- (PSTrackingWelcomeController)init;
- (id)aboutText;
- (void)donePressed;
- (void)setController:(id)a3;
@end

@implementation PSTrackingWelcomeController

- (PSTrackingWelcomeController)init
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PSTrackingWelcomeController;
  v2 = [(PSTrackingWelcomeController *)&v17 init];
  if (v2)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    v3 = (void *)getOBTextWelcomeControllerClass_softClass;
    uint64_t v22 = getOBTextWelcomeControllerClass_softClass;
    if (!getOBTextWelcomeControllerClass_softClass)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __getOBTextWelcomeControllerClass_block_invoke;
      v18[3] = &unk_1E5C5D4D8;
      v18[4] = &v19;
      __getOBTextWelcomeControllerClass_block_invoke((uint64_t)v18);
      v3 = (void *)v20[3];
    }
    v4 = v3;
    _Block_object_dispose(&v19, 8);
    id v5 = [v4 alloc];
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"TRACKING_ABOUT_TITLE" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    v8 = (void *)[v5 initWithTitle:v7 detailText:0 symbolName:0];
    [(PSTrackingWelcomeController *)v2 setController:v8];

    v9 = [(PSTrackingWelcomeController *)v2 controller];
    v10 = [(PSTrackingWelcomeController *)v2 aboutText];
    [v9 addSectionWithHeader:0 content:v10];

    v11 = [(PSTrackingWelcomeController *)v2 controller];
    v23[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [(PSTrackingWelcomeController *)v2 setViewControllers:v12];

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:v2 action:sel_donePressed];
    v14 = [(PSTrackingWelcomeController *)v2 controller];
    v15 = [v14 navigationItem];
    [v15 setRightBarButtonItem:v13];
  }
  return v2;
}

- (id)aboutText
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  int v2 = [MEMORY[0x1E4F18950] shouldEnforceTrackingWithReasonCode:&v10];
  v3 = _PSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[PSTrackingWelcomeController aboutText]";
    __int16 v13 = 1024;
    int v14 = v2;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1A6597000, v3, OS_LOG_TYPE_DEFAULT, "%s: Showing tracking about text. shouldEnforce: %d, reason: %ld", buf, 0x1Cu);
  }

  if (v2)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = v4;
    v6 = @"TRACKING_ABOUT_TEXT_NO_ENFORCEMENT";
  }
  else
  {
    uint64_t v7 = v10;
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = v4;
    if (v7) {
      v6 = @"TRACKING_ABOUT_TEXT_REASON_UNENFORCED";
    }
    else {
      v6 = @"TRACKING_ABOUT_TEXT_REASON_NONE";
    }
  }
  v8 = [v4 localizedStringForKey:v6 value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];

  return v8;
}

- (void)donePressed
{
  id v3 = [(PSTrackingWelcomeController *)self controller];
  int v2 = [v3 presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (OBTextWelcomeController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end