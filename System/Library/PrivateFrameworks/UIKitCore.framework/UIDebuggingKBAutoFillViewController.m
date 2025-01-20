@interface UIDebuggingKBAutoFillViewController
- (id)_formTypeFileName:(int64_t)a3;
- (id)_getTopMostViewControllerInWindow:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_archiveTopMostViewControllerForAutoFillTest;
- (void)autoFillTestGroundTruthGenerationViewController:(id)a3 didFinishWithResult:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation UIDebuggingKBAutoFillViewController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingKBAutoFillViewController;
  [(UIViewController *)&v10 viewDidLoad];
  v3 = [UITableView alloc];
  v4 = [(UIViewController *)self view];
  [v4 bounds];
  v5 = -[UITableView initWithFrame:style:](v3, "initWithFrame:style:", 0);
  tableView = self->_tableView;
  self->_tableView = v5;

  [(UIView *)self->_tableView setAutoresizingMask:18];
  v7 = [(UIViewController *)self view];
  [v7 addSubview:self->_tableView];

  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"cell"];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  v8 = +[UIColor whiteColor];
  v9 = [(UIViewController *)self view];
  [v9 setBackgroundColor:v8];
}

- (id)_getTopMostViewControllerInWindow:(id)a3
{
  v3 = [a3 rootViewController];
  v4 = [v3 presentedViewController];

  if (v4)
  {
    do
    {
      v5 = [v3 presentedViewController];

      v6 = [v5 presentedViewController];

      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 topViewController];
  }
  else
  {
    id v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (void)_archiveTopMostViewControllerForAutoFillTest
{
  v3 = +[UIDebuggingInformationOverlay overlay];
  v4 = [v3 inspectedWindow];
  id v11 = [(UIDebuggingKBAutoFillViewController *)self _getTopMostViewControllerInWindow:v4];

  v5 = +[UIKBAutoFillTestArchiveMaker archiveMakerWithViewControllerToSnapshot:v11];
  v6 = [v5 makeArchive];
  id v7 = (void *)[v6 copy];

  v8 = [[UIKBAutoFillTestViewController alloc] initWithAutoFillTestArchive:v7];
  v9 = [[UIKBAutoFillTestGroundTruthGenerationViewController alloc] initWithAutoFillTestViewController:v8];
  [(UIKBAutoFillTestGroundTruthGenerationViewController *)v9 setDelegate:self];
  objc_super v10 = [[UINavigationController alloc] initWithRootViewController:v9];
  [(UIViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (id)_formTypeFileName:(int64_t)a3
{
  id result = @"Unspecified";
  switch(a3)
  {
    case 0:
      return result;
    case 1:
    case 2:
      id result = @"SignIn";
      break;
    case 3:
    case 4:
      id result = @"SignUp";
      break;
    case 5:
      id result = @"ChangePassword";
      break;
    default:
      if (a3 == 10000) {
        id result = @"Other";
      }
      else {
        id result = &stru_1ED0E84C0;
      }
      break;
  }
  return result;
}

- (void)autoFillTestGroundTruthGenerationViewController:(id)a3 didFinishWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [v6 testViewController];
    v9 = [v8 testArchive];

    [v9 setExpectedResult:v7];
    objc_super v10 = +[UIAlertController alertControllerWithTitle:0 message:@"Saving AutoFill Test Archive" preferredStyle:1];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke;
    aBlock[3] = &unk_1E530CA68;
    id v22 = v10;
    id v11 = v6;
    id v23 = v11;
    id v12 = v10;
    v13 = _Block_copy(aBlock);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke_46;
    v16[3] = &unk_1E52FC828;
    id v20 = v13;
    id v17 = v9;
    v18 = self;
    id v19 = v7;
    id v14 = v13;
    id v15 = v9;
    [v11 presentViewController:v12 animated:1 completion:v16];
  }
  else
  {
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

void __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_time_t v7 = dispatch_time(0, 500000000);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke_2;
  v10[3] = &unk_1E52DD450;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v13 = v5;
  id v14 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v6;
  dispatch_after(v7, MEMORY[0x1E4F14428], v10);
}

void __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke_2(id *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  v3 = NSString;
  if (v2)
  {
    v4 = [a1[4] localizedDescription];
    id v5 = [v3 stringWithFormat:@"Failed to save the archive with error %@", v4];
    [a1[5] setMessage:v5];
  }
  else
  {
    id v6 = _UIMainBundleIdentifier();
    dispatch_time_t v7 = [v3 stringWithFormat:@"Successfully saved AutoFill Test Archive in app's container temp directory.\nBundle identifier: %@", v6];
    [a1[5] setMessage:v7];

    id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("AutoFillTest", &_block_invoke___s_category_11) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      objc_super v10 = _UIMainBundleIdentifier();
      id v11 = [a1[6] path];
      *(_DWORD *)buf = 138543618;
      v18 = v10;
      __int16 v19 = 2114;
      id v20 = v11;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Saved archive for bundle id: %{public}@, at path: %{public}@", buf, 0x16u);
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke_42;
  v13[3] = &unk_1E530CA40;
  BOOL v16 = v2 == 0;
  id v14 = a1[6];
  id v15 = a1[7];
  id v12 = +[UIAlertAction actionWithTitle:@"Done" style:0 handler:v13];
  [a1[5] addAction:v12];
}

uint64_t __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke_42(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("AutoFillTest", &_block_invoke_2___s_category_1) + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      v4 = _UIMainBundleIdentifier();
      id v5 = [*(id *)(a1 + 32) path];
      int v7 = 138543618;
      id v8 = v4;
      __int16 v9 = 2114;
      objc_super v10 = v5;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Saved archive for bundle id: %{public}@, at path: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  return [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
}

void __107__UIDebuggingKBAutoFillViewController_autoFillTestGroundTruthGenerationViewController_didFinishWithResult___block_invoke_46(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) autoFillTestArchiveData];
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = NSTemporaryDirectory();
  id v5 = [v4 stringByAppendingPathComponent:@"AutoFillTestArchives"];
  id v6 = [v3 fileURLWithPath:v5 isDirectory:1];

  int v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v22 = 0;
  char v8 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v9 = v22;
  if (v8)
  {
    __int16 v19 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v10 setLocale:v19];
    [v10 setDateFormat:@"yyyy-MM-dd'T'HH-mm-ss"];
    id v20 = v2;
    v18 = objc_msgSend(*(id *)(a1 + 40), "_formTypeFileName:", objc_msgSend(*(id *)(a1 + 48), "formType"));
    uint64_t v11 = NSString;
    id v12 = _UIMainBundleIdentifier();
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    id v14 = [v10 stringFromDate:v13];
    id v15 = [v11 stringWithFormat:@"AutoFill_%@_%@_%@.autofillarchive", v12, v18, v14];
    BOOL v16 = [v6 URLByAppendingPathComponent:v15];

    id v2 = v20;
    id v21 = v9;
    [v20 writeToURL:v16 options:1 error:&v21];
    id v17 = v21;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v9 = v17;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v7 = [v6 row];

  if (!v7)
  {
    [(UIDebuggingKBAutoFillViewController *)self _archiveTopMostViewControllerForAutoFillTest];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [a3 dequeueReusableCellWithIdentifier:@"cell"];
  uint64_t v7 = [v5 row];

  if (!v7)
  {
    char v8 = [v6 textLabel];
    [v8 setText:@"Create AutoFill Test Archive"];
  }
  return v6;
}

- (void).cxx_destruct
{
}

@end