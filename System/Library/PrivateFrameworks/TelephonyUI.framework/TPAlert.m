@interface TPAlert
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)message;
- (NSString)otherButtonTitle;
- (NSString)title;
- (__CFUserNotification)userNotification;
- (id)completion;
- (void)dealloc;
- (void)invalidate;
- (void)setCompletion:(id)a3;
- (void)setUserNotification:(__CFUserNotification *)a3;
- (void)show;
- (void)showOnViewController:(id)a3;
@end

@implementation TPAlert

- (void)dealloc
{
  userNotification = self->_userNotification;
  if (userNotification) {
    CFRelease(userNotification);
  }
  v4.receiver = self;
  v4.super_class = (Class)TPAlert;
  [(TPAlert *)&v4 dealloc];
}

- (void)invalidate
{
  userNotification = self->_userNotification;
  if (userNotification) {
    CFUserNotificationCancel(userNotification);
  }
}

- (void)show
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = [a1 userNotification];
  _os_log_error_impl(&dword_1C2F24000, a2, OS_LOG_TYPE_ERROR, "Could not create run loop source for CFUserNotification: %@", (uint8_t *)&v3, 0xCu);
}

uint64_t __15__TPAlert_show__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v1 = pendingAlerts;
  pendingAlerts = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)showOnViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4FB1418];
  v6 = [(TPAlert *)self title];
  v7 = [(TPAlert *)self message];
  v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  v9 = [(TPAlert *)self defaultButtonTitle];

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E4FB1410];
    v11 = [(TPAlert *)self defaultButtonTitle];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __32__TPAlert_showOnViewController___block_invoke;
    v23[3] = &unk_1E647C410;
    v23[4] = self;
    v12 = [v10 actionWithTitle:v11 style:1 handler:v23];
    [v8 addAction:v12];
  }
  v13 = [(TPAlert *)self alternateButtonTitle];

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E4FB1410];
    v15 = [(TPAlert *)self alternateButtonTitle];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __32__TPAlert_showOnViewController___block_invoke_2;
    v22[3] = &unk_1E647C410;
    v22[4] = self;
    v16 = [v14 actionWithTitle:v15 style:0 handler:v22];
    [v8 addAction:v16];
  }
  v17 = [(TPAlert *)self otherButtonTitle];

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E4FB1410];
    v19 = [(TPAlert *)self otherButtonTitle];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __32__TPAlert_showOnViewController___block_invoke_3;
    v21[3] = &unk_1E647C410;
    v21[4] = self;
    v20 = [v18 actionWithTitle:v19 style:0 handler:v21];
    [v8 addAction:v20];
  }
  [v4 presentViewController:v8 animated:1 completion:0];
}

uint64_t __32__TPAlert_showOnViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) defaultResponse];
}

uint64_t __32__TPAlert_showOnViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) alternateResponse];
}

uint64_t __32__TPAlert_showOnViewController___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) otherResponse];
}

- (NSString)title
{
  return 0;
}

- (NSString)message
{
  return 0;
}

- (NSString)defaultButtonTitle
{
  return 0;
}

- (NSString)alternateButtonTitle
{
  return 0;
}

- (NSString)otherButtonTitle
{
  return 0;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (__CFUserNotification)userNotification
{
  return self->_userNotification;
}

- (void)setUserNotification:(__CFUserNotification *)a3
{
  self->_userNotification = a3;
}

- (void).cxx_destruct
{
}

@end