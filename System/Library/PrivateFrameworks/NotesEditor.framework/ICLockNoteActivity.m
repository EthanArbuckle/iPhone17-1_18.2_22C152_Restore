@interface ICLockNoteActivity
- (ICLockNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4;
- (ICNoteLockManager)lockManager;
- (UIViewController)presentingViewController;
- (id)accessibilityLabel;
- (id)activityImage;
- (id)activityTintColor;
- (id)activityTitle;
- (id)activityType;
- (int64_t)contextPath;
- (void)accessibilityAnnounceToggledLock;
- (void)performActivityWithCompletion:(id)a3;
- (void)setContextPath:(int64_t)a3;
@end

@implementation ICLockNoteActivity

- (ICLockNoteActivity)initWithNote:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICLockNoteActivity;
  v8 = [(ICActivity *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F5B3F0]) initWithNote:v6];
    lockManager = v8->_lockManager;
    v8->_lockManager = (ICNoteLockManager *)v9;

    v11 = [v7 view];
    v12 = [v11 window];
    [(ICNoteLockManager *)v8->_lockManager setWindow:v12];

    objc_storeWeak((id *)&v8->_presentingViewController, v7);
    v13 = [(ICLockNoteActivity *)v8 presentingViewController];
    v14 = [v13 view];
    v15 = [v14 window];

    if (!v15) {
      objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.presentingViewController.view.window) != nil)", "-[ICLockNoteActivity initWithNote:presentingViewController:]", 1, 0, @"Expected non-nil value for '%s'", "self.presentingViewController.view.window");
    }
  }

  return v8;
}

- (id)activityTitle
{
  v2 = [(ICLockNoteActivity *)self lockManager];
  v3 = [v2 note];
  int v4 = [v3 isPasswordProtected];
  v5 = [MEMORY[0x263F086E0] mainBundle];
  id v6 = v5;
  if (v4) {
    id v7 = @"Remove";
  }
  else {
    id v7 = @"Lock";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26C10E100 table:0];

  return v8;
}

- (id)activityType
{
  return (id)*MEMORY[0x263F5B120];
}

- (id)activityImage
{
  v2 = [(ICLockNoteActivity *)self lockManager];
  v3 = [v2 note];
  int v4 = [v3 isPasswordProtected];
  v5 = @"lock.fill";
  if (v4) {
    v5 = @"lock.slash.fill";
  }
  id v6 = v5;

  id v7 = [MEMORY[0x263F827E8] systemImageNamed:v6];

  return v7;
}

- (id)activityTintColor
{
  return (id)[MEMORY[0x263F825C8] systemIndigoColor];
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  dispatchMainAfterDelay();
}

void __52__ICLockNoteActivity_performActivityWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) lockManager];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__ICLockNoteActivity_performActivityWithCompletion___block_invoke_2;
  v3[3] = &unk_2640BB440;
  objc_copyWeak(&v5, &location);
  id v4 = *(id *)(a1 + 40);
  [v2 toggleLockWithCompletionHandler:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__ICLockNoteActivity_performActivityWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained lockManager];
  id v5 = [v4 updatedNote];

  if (!v5)
  {
    uint64_t v18 = *(void *)(a1 + 32);
    if (!v18) {
      return;
    }
    id v19 = objc_loadWeakRetained(v2);
    v16 = [v19 activityType];
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v16);
    goto LABEL_6;
  }
  id v6 = objc_loadWeakRetained(v2);
  id v7 = [v6 presentingViewController];
  v8 = objc_msgSend(v7, "ic_viewControllerManager");
  uint64_t v9 = [v8 noteEditorViewController];
  id v19 = [v9 eventReporter];

  id v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v19, "pushContextPathDataWithContextPathEnum:", objc_msgSend(v10, "contextPathEnum"));

  id v11 = objc_loadWeakRetained(v2);
  v12 = [v11 lockManager];
  v13 = [v12 updatedNote];
  [v19 submitPasswordProtectEventForModernNote:v13];

  [v19 popContextPathData];
  id v14 = objc_loadWeakRetained(v2);
  [v14 accessibilityAnnounceToggledLock];

  uint64_t v15 = *(void *)(a1 + 32);
  if (v15)
  {
    v16 = objc_loadWeakRetained(v2);
    objc_super v17 = [v16 activityType];
    (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, 1, v17);

LABEL_6:
  }
}

- (id)accessibilityLabel
{
  v2 = [(ICLockNoteActivity *)self lockManager];
  id v3 = [v2 note];
  int v4 = [v3 isPasswordProtected];
  id v5 = [MEMORY[0x263F086E0] mainBundle];
  id v6 = v5;
  if (v4) {
    id v7 = @"Remove Lock";
  }
  else {
    id v7 = @"Lock Note";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26C10E100 table:0];

  return v8;
}

- (void)accessibilityAnnounceToggledLock
{
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__ICLockNoteActivity_accessibilityAnnounceToggledLock__block_invoke;
  block[3] = &unk_2640B8140;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

void __54__ICLockNoteActivity_accessibilityAnnounceToggledLock__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lockManager];
  dispatch_time_t v3 = [v2 updatedNote];
  char v4 = [v3 isPasswordProtected];
  id v5 = NSString;
  id v6 = [MEMORY[0x263F086E0] mainBundle];
  id v7 = v6;
  if (v4) {
    v8 = @"Added lock to %@";
  }
  else {
    v8 = @"Removed lock from %@";
  }
  uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26C10E100 table:0];
  id v10 = [*(id *)(a1 + 32) lockManager];
  id v11 = [v10 updatedNote];
  v12 = [v11 title];
  objc_msgSend(v5, "localizedStringWithFormat:", v9, v12);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  ICAccessibilityPostAnnouncementNotification();
}

- (ICNoteLockManager)lockManager
{
  return self->_lockManager;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (int64_t)contextPath
{
  return self->_contextPath;
}

- (void)setContextPath:(int64_t)a3
{
  self->_contextPath = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_lockManager, 0);
}

@end