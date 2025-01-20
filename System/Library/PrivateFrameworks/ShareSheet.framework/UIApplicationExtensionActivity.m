@interface UIApplicationExtensionActivity
+ (id)_activityExtensionItemsForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4;
+ (id)_applicationExtensionActivitiesForItems:(id)a3;
+ (id)preparedActivityExtensionItemDataForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4;
+ (int64_t)activityCategory;
- (BOOL)_canBeExcludeWhenMatchingWithContext:(id)a3;
- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)_isServiceExtension;
- (BOOL)_managesOwnPresentation;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSDate)installationDate;
- (NSExtension)applicationExtension;
- (NSExtensionItem)_injectedExtensionItem;
- (NSNumber)overrideActivityCategory;
- (NSString)containingAppBundleIdentifier;
- (NSString)debugDescription;
- (NSURL)originalFileURL;
- (UIApplicationExtensionActivity)initWithApplicationExtension:(id)a3;
- (UISUIActivityExtensionItemDataRequest)extensionItemDataRequest;
- (UIViewController)extensionViewController;
- (UIViewController)presenterViewController;
- (_UIActivityBundleHelper)activityBundleHelper;
- (id)_actionImage;
- (id)_activityImage;
- (id)_activitySettingsImage;
- (id)activityTitle;
- (id)activityType;
- (id)extensionContextIdentifier;
- (id)extensionRequestCleanupCompletion;
- (id)presenterCompletion;
- (int64_t)_defaultSortGroup;
- (int64_t)activityCategory;
- (void)_cleanup;
- (void)_instantiateExtensionViewControllerWithInputItems:(id)a3;
- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4;
- (void)_presentExtensionViewControllerIfPossible;
- (void)dealloc;
- (void)prepareWithActivityExtensionItemData:(id)a3;
- (void)prepareWithActivityItems:(id)a3;
- (void)setActivityBundleHelper:(id)a3;
- (void)setApplicationExtension:(id)a3;
- (void)setExtensionContextIdentifier:(id)a3;
- (void)setExtensionItemDataRequest:(id)a3;
- (void)setExtensionRequestCleanupCompletion:(id)a3;
- (void)setExtensionViewController:(id)a3;
- (void)setOriginalFileURL:(id)a3;
- (void)setOverrideActivityCategory:(id)a3;
- (void)setPresenterCompletion:(id)a3;
- (void)setPresenterViewController:(id)a3;
- (void)set_injectedExtensionItem:(id)a3;
@end

@implementation UIApplicationExtensionActivity

- (UIApplicationExtensionActivity)initWithApplicationExtension:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIApplicationExtensionActivity;
  v5 = [(UIActivity *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(UIApplicationExtensionActivity *)v5 setApplicationExtension:v4];
    v7 = v6;
  }

  return v6;
}

- (void)dealloc
{
  [(NSExtension *)self->_applicationExtension set_requestPostCompletionBlockWithItems:0];
  [(NSExtension *)self->_applicationExtension setRequestCompletionBlock:0];
  [(NSExtension *)self->_applicationExtension setRequestCancellationBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)UIApplicationExtensionActivity;
  [(UIApplicationExtensionActivity *)&v3 dealloc];
}

- (int64_t)activityCategory
{
  objc_super v3 = [(UIApplicationExtensionActivity *)self overrideActivityCategory];
  if (v3)
  {
    id v4 = [(UIApplicationExtensionActivity *)self overrideActivityCategory];
    int64_t v5 = (int)[v4 intValue];
  }
  else
  {
    int64_t v5 = [(id)objc_opt_class() activityCategory];
  }

  return v5;
}

- (NSString)debugDescription
{
  objc_super v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)UIApplicationExtensionActivity;
  id v4 = [(UIActivity *)&v9 description];
  int64_t v5 = [(UIApplicationExtensionActivity *)self applicationExtension];
  v6 = [v5 identifier];
  v7 = [v3 stringWithFormat:@"%@ {extension = %@}", v4, v6];

  return (NSString *)v7;
}

- (void)setApplicationExtension:(id)a3
{
  objc_storeStrong((id *)&self->_applicationExtension, a3);
  id v5 = a3;
  id v6 = [v5 _plugIn];

  self->_installationDate = (NSDate *)(id)[v6 timestamp];
}

- (NSString)containingAppBundleIdentifier
{
  v2 = [(UIApplicationExtensionActivity *)self activityBundleHelper];
  objc_super v3 = [v2 bundleProxy];
  id v4 = [v3 containingBundle];

  id v5 = [v4 bundleIdentifier];

  return (NSString *)v5;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  v2 = [(UIApplicationExtensionActivity *)self applicationExtension];
  objc_super v3 = [v2 identifier];

  return v3;
}

- (int64_t)_defaultSortGroup
{
  return 4;
}

- (id)activityTitle
{
  int64_t v3 = [(UIApplicationExtensionActivity *)self activityCategory];
  id v4 = [(UIApplicationExtensionActivity *)self activityBundleHelper];
  id v5 = [v4 bundleProxy];
  id v6 = v5;
  if (v3 == 1)
  {
    uint64_t v7 = [v5 containingBundle];

    id v6 = (void *)v7;
  }

  v8 = [(UIActivity *)self preferredLocalizations];

  if (!v8
    || ([(UIActivity *)self preferredLocalizations],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        [v6 localizedNameWithPreferredLocalizations:v9 useShortNameOnly:0],
        v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    v11 = [v6 localizedName];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v6 localizedShortName];
    }
    v10 = v13;
  }
  return v10;
}

- (id)_activityImage
{
  int64_t v3 = [(UIApplicationExtensionActivity *)self activityCategory];
  id v4 = [(UIApplicationExtensionActivity *)self activityBundleHelper];
  id v5 = [(UIActivity *)self contentSizeCategory];
  id v6 = objc_msgSend(v4, "imageForApplicationIconFormat:activityCategory:contentSizeCategory:userInterfaceStyle:", 10, v3, v5, -[UIActivity userInterfaceStyle](self, "userInterfaceStyle"));

  if (!v3 || !v6)
  {
    uint64_t v7 = [(id)objc_opt_class() _activityImageForActionRepresentationImage:v6];

    id v6 = (void *)v7;
  }
  return v6;
}

- (id)_activitySettingsImage
{
  int64_t v3 = [(UIApplicationExtensionActivity *)self activityCategory];
  if (v3)
  {
    id v4 = [(UIApplicationExtensionActivity *)self activityBundleHelper];
    id v5 = [(UIActivity *)self contentSizeCategory];
    int64_t v3 = objc_msgSend(v4, "imageForApplicationIconFormat:activityCategory:contentSizeCategory:userInterfaceStyle:", 0, v3, v5, -[UIActivity userInterfaceStyle](self, "userInterfaceStyle"));
  }
  return v3;
}

- (id)_actionImage
{
  int64_t v3 = [(UIApplicationExtensionActivity *)self activityBundleHelper];
  id v4 = [(UIActivity *)self contentSizeCategory];
  id v5 = objc_msgSend(v3, "imageForApplicationIconFormat:activityCategory:contentSizeCategory:userInterfaceStyle:", 10, 0, v4, -[UIActivity userInterfaceStyle](self, "userInterfaceStyle"));

  id v6 = objc_opt_class();
  uint64_t v7 = [(UIActivity *)self contentSizeCategory];
  v8 = [v6 _actionImageForActionRepresentationImage:v5 contentSizeCategory:v7];

  return v8;
}

- (BOOL)_canBeExcludeWhenMatchingWithContext:(id)a3
{
  return [a3 canExcludeExtensionActivities];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (BOOL)_isServiceExtension
{
  v2 = [(UIApplicationExtensionActivity *)self applicationExtension];
  int64_t v3 = [v2 extensionPointIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.services"];

  return v4;
}

- (void)prepareWithActivityItems:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIApplicationExtensionActivity *)self _injectedExtensionItem];
  id v6 = (void *)v5;
  if (v5)
  {
    v11[0] = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

    id v4 = (id)v7;
  }
  v8 = [(UIApplicationExtensionActivity *)self extensionItemDataRequest];
  if (!v8)
  {
    objc_super v9 = [(UIApplicationExtensionActivity *)self activityType];
    v8 = +[UISUIActivityExtensionItemDataRequest requestForActivity:self activityType:v9];
  }
  v10 = [(id)objc_opt_class() preparedActivityExtensionItemDataForActivityItemValues:v4 extensionItemDataRequest:v8];
  [(UIApplicationExtensionActivity *)self prepareWithActivityExtensionItemData:v10];
}

- (void)_prepareWithActivityItems:(id)a3 completion:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  id location = 0;
  objc_initWeak(&location, self);
  v8 = [(UIApplicationExtensionActivity *)self originalFileURL];

  if (v8)
  {
    id v9 = [(UIApplicationExtensionActivity *)self originalFileURL];
    [v9 fileSystemRepresentation];
    uint64_t v10 = sandbox_extension_issue_file();

    v11 = [NSString stringWithUTF8String:v10];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithItem:v11 typeIdentifier:@"sandbox-token"];
    v20[0] = v12;
    id v13 = [(UIApplicationExtensionActivity *)self originalFileURL];
    v20[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    [(UIApplicationExtensionActivity *)self prepareWithActivityItems:v14];

    v7[2](v7);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F9F6B8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__UIApplicationExtensionActivity__prepareWithActivityItems_completion___block_invoke;
    v16[3] = &unk_1E5A21E38;
    objc_copyWeak(&v18, &location);
    v17 = v7;
    [v15 loadSendCopyRepresentationIfNeededForActivityItems:v6 completion:v16];

    objc_destroyWeak(&v18);
  }
  objc_destroyWeak(&location);
}

void __71__UIApplicationExtensionActivity__prepareWithActivityItems_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v4 = v3;
  id v5 = *(id *)(a1 + 32);
  sf_dispatch_on_main_queue();

  objc_destroyWeak(&v6);
}

uint64_t __71__UIApplicationExtensionActivity__prepareWithActivityItems_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained prepareWithActivityItems:*(void *)(a1 + 32)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)prepareWithActivityExtensionItemData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 extensionItems];
  if ([(UIApplicationExtensionActivity *)self _isServiceExtension])
  {
    id location = 0;
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke;
    v16[3] = &unk_1E5A22F58;
    objc_copyWeak(&v17, &location);
    id v6 = [(UIApplicationExtensionActivity *)self applicationExtension];
    objc_msgSend(v6, "set_requestPostCompletionBlockWithItems:", v16);

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_15;
    v14[3] = &unk_1E5A22F80;
    objc_copyWeak(&v15, &location);
    uint64_t v7 = [(UIApplicationExtensionActivity *)self applicationExtension];
    [v7 setRequestCancellationBlock:v14];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_18;
    v12[3] = &unk_1E5A22FA8;
    objc_copyWeak(&v13, &location);
    v8 = [(UIApplicationExtensionActivity *)self applicationExtension];
    [v8 setRequestInterruptionBlock:v12];

    id v9 = [(UIApplicationExtensionActivity *)self applicationExtension];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_26;
    v10[3] = &unk_1E5A22F80;
    objc_copyWeak(&v11, &location);
    [v9 beginExtensionRequestWithInputItems:v5 completion:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    [(UIApplicationExtensionActivity *)self _instantiateExtensionViewControllerWithInputItems:v5];
  }
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2;
  block[3] = &unk_1E5A21D20;
  id v13 = v6;
  id v14 = WeakRetained;
  id v15 = v7;
  id v9 = v7;
  id v10 = WeakRetained;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_DEFAULT, "completed request - items: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) setExtensionRequestCleanupCompletion:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 40) activityDidFinish:1 items:*(void *)(a1 + 32) error:0];
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_16;
  v8[3] = &unk_1E5A215A0;
  id v9 = v4;
  id v10 = WeakRetained;
  id v6 = WeakRetained;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_16(uint64_t a1)
{
  v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_16_cold_1(a1);
  }

  return [*(id *)(a1 + 40) activityDidFinish:0 items:0 error:*(void *)(a1 + 32)];
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_19;
  block[3] = &unk_1E5A21900;
  id v4 = WeakRetained;
  id v2 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_19(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Extension was interrupted";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  int v5 = [v2 errorWithDomain:v3 code:0 userInfo:v4];

  id v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_19_cold_1(v5);
  }

  [*(id *)(a1 + 32) activityDidFinish:0 items:0 error:v5];
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_27;
  block[3] = &unk_1E5A21A28;
  id v12 = v5;
  id v13 = v6;
  id v14 = WeakRetained;
  id v8 = WeakRetained;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_27(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = *(void **)(a1 + 48);
    return objc_msgSend(v2, "setExtensionContextIdentifier:");
  }
  else
  {
    id v4 = share_sheet_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_27_cold_1(a1);
    }

    return [*(id *)(a1 + 48) activityDidFinish:0 items:0 error:*(void *)(a1 + 40)];
  }
}

+ (id)_activityExtensionItemsForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  return _NSExtensionItemsFromActivityItemValuesForExtensionItemDataRequest(a3, a4);
}

+ (id)preparedActivityExtensionItemDataForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(UISUIActivityExtensionItemData);
  id v9 = [a1 _activityExtensionItemsForActivityItemValues:v7 extensionItemDataRequest:v6];

  [(UISUIActivityExtensionItemData *)v8 setExtensionItems:v9];
  return v8;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7 = a5;
  [(UIApplicationExtensionActivity *)self setPresenterViewController:a3];
  [(UIApplicationExtensionActivity *)self setPresenterCompletion:v7];

  [(UIApplicationExtensionActivity *)self _presentExtensionViewControllerIfPossible];
  return 1;
}

- (BOOL)_dismissActivityFromViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(UIApplicationExtensionActivity *)self extensionViewController];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __89__UIApplicationExtensionActivity__dismissActivityFromViewController_animated_completion___block_invoke;
  v20 = &unk_1E5A22578;
  v21 = self;
  id v22 = v9;
  id v11 = v9;
  uint64_t v12 = MEMORY[0x1A6229A90](&v17);
  id v13 = (void *)v12;
  if (v8)
  {
    id v14 = v8;
  }
  else
  {
    if (!v10)
    {
      (*(void (**)(uint64_t))(v12 + 16))(v12);
      BOOL v15 = 0;
      goto LABEL_6;
    }
    id v14 = v10;
  }
  objc_msgSend(v14, "dismissViewControllerAnimated:completion:", v6, v13, v17, v18, v19, v20, v21, v22);
  BOOL v15 = 1;
LABEL_6:

  return v15;
}

uint64_t __89__UIApplicationExtensionActivity__dismissActivityFromViewController_animated_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) extensionRequestCleanupCompletion];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) extensionRequestCleanupCompletion];
    v3[2]();

    [*(id *)(a1 + 32) setExtensionRequestCleanupCompletion:0];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (BOOL)_managesOwnPresentation
{
  return ![(UIApplicationExtensionActivity *)self _isServiceExtension];
}

- (void)_cleanup
{
  [(UIApplicationExtensionActivity *)self setPresenterCompletion:0];
  uint64_t v3 = [(UIApplicationExtensionActivity *)self applicationExtension];
  objc_msgSend(v3, "set_requestPostCompletionBlockWithItems:", 0);

  id v4 = [(UIApplicationExtensionActivity *)self applicationExtension];
  [v4 setRequestCancellationBlock:0];

  id v5 = [(UIApplicationExtensionActivity *)self applicationExtension];
  [v5 setRequestInterruptionBlock:0];

  [(UIApplicationExtensionActivity *)self setExtensionContextIdentifier:0];
  [(UIApplicationExtensionActivity *)self setExtensionViewController:0];
  v6.receiver = self;
  v6.super_class = (Class)UIApplicationExtensionActivity;
  [(UIActivity *)&v6 _cleanup];
}

- (_UIActivityBundleHelper)activityBundleHelper
{
  activityBundleHelper = self->_activityBundleHelper;
  if (!activityBundleHelper)
  {
    id v4 = [(UIApplicationExtensionActivity *)self applicationExtension];
    id v5 = +[_UIActivityBundleHelper activityBundleHelperForExtension:v4];
    objc_super v6 = self->_activityBundleHelper;
    self->_activityBundleHelper = v5;

    activityBundleHelper = self->_activityBundleHelper;
  }
  return activityBundleHelper;
}

- (void)_instantiateExtensionViewControllerWithInputItems:(id)a3
{
  id v4 = a3;
  id v5 = [(UIApplicationExtensionActivity *)self applicationExtension];
  objc_super v6 = [v5 identifier];
  id location = 0;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke;
  v18[3] = &unk_1E5A22F58;
  objc_copyWeak(&v19, &location);
  id v7 = [(UIApplicationExtensionActivity *)self applicationExtension];
  objc_msgSend(v7, "set_requestPostCompletionBlockWithItems:", v18);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_32;
  v16[3] = &unk_1E5A22F80;
  objc_copyWeak(&v17, &location);
  id v8 = [(UIApplicationExtensionActivity *)self applicationExtension];
  [v8 setRequestCancellationBlock:v16];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_34;
  v14[3] = &unk_1E5A22FA8;
  objc_copyWeak(&v15, &location);
  id v9 = [(UIApplicationExtensionActivity *)self applicationExtension];
  [v9 setRequestInterruptionBlock:v14];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_36;
  v11[3] = &unk_1E5A22FF8;
  objc_copyWeak(&v13, &location);
  id v10 = v6;
  id v12 = v10;
  [v5 instantiateViewControllerWithInputItems:v4 connectionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2;
  block[3] = &unk_1E5A21D20;
  id v13 = v6;
  id v14 = WeakRetained;
  id v15 = v7;
  id v9 = v7;
  id v10 = WeakRetained;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_DEFAULT, "completed request - items: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) setExtensionRequestCleanupCompletion:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 40) activityDidFinish:1 items:*(void *)(a1 + 32) error:0];
}

void __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_32(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_33;
  v8[3] = &unk_1E5A215A0;
  id v9 = v4;
  id v10 = WeakRetained;
  id v6 = WeakRetained;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_33(uint64_t a1)
{
  id v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_16_cold_1(a1);
  }

  return [*(id *)(a1 + 40) activityDidFinish:0 items:0 error:*(void *)(a1 + 32)];
}

void __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_35;
  block[3] = &unk_1E5A21900;
  id v4 = WeakRetained;
  id v2 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_35(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Extension was interrupted";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  int v5 = [v2 errorWithDomain:v3 code:0 userInfo:v4];

  id v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_19_cold_1(v5);
  }

  [*(id *)(a1 + 32) activityDidFinish:0 items:0 error:v5];
}

void __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_36(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_37;
  block[3] = &unk_1E5A22FD0;
  id v16 = v7;
  id v17 = v8;
  id v18 = *(id *)(a1 + 32);
  id v19 = v9;
  id v20 = WeakRetained;
  id v11 = WeakRetained;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_37(uint64_t a1)
{
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 64), "setExtensionContextIdentifier:");
    [*(id *)(a1 + 64) setExtensionViewController:*(void *)(a1 + 40)];
    id v2 = *(void **)(a1 + 64);
    return [v2 _presentExtensionViewControllerIfPossible];
  }
  else
  {
    id v4 = share_sheet_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_37_cold_1(a1, v4);
    }

    return [*(id *)(a1 + 64) activityDidFinish:0 items:0 error:*(void *)(a1 + 56)];
  }
}

- (void)_presentExtensionViewControllerIfPossible
{
  uint64_t v3 = [(UIApplicationExtensionActivity *)self extensionViewController];
  if (v3)
  {
    id v14 = v3;
    id v4 = [(UIApplicationExtensionActivity *)self presenterViewController];
    if (v4)
    {
      int v5 = [(UIApplicationExtensionActivity *)self applicationExtension];
      id v6 = [v5 infoDictionary];
      id v7 = [v6 objectForKeyedSubscript:@"NSExtension"];

      id v8 = [v7 objectForKeyedSubscript:@"NSExtensionActionWantsFullScreenPresentation"];
      if ([v8 BOOLValue])
      {
        uint64_t v9 = 5;
      }
      else
      {
        id v10 = [v7 objectForKeyedSubscript:@"NSExtensionAttributes"];
        id v11 = [v10 objectForKeyedSubscript:@"NSExtensionActionWantsFullScreenPresentation"];
        if ([v11 BOOLValue]) {
          uint64_t v9 = 5;
        }
        else {
          uint64_t v9 = 2;
        }
      }
      [v14 setModalPresentationStyle:v9];
      id v12 = [v14 view];
      [v12 setTintAdjustmentMode:1];

      id v13 = [(UIApplicationExtensionActivity *)self presenterCompletion];
      [v4 presentViewController:v14 animated:1 completion:v13];
    }
    uint64_t v3 = v14;
  }
}

- (NSExtension)applicationExtension
{
  return self->_applicationExtension;
}

- (NSExtensionItem)_injectedExtensionItem
{
  return self->__injectedExtensionItem;
}

- (void)set_injectedExtensionItem:(id)a3
{
}

- (NSNumber)overrideActivityCategory
{
  return self->_overrideActivityCategory;
}

- (void)setOverrideActivityCategory:(id)a3
{
}

- (UIViewController)extensionViewController
{
  return self->_extensionViewController;
}

- (void)setExtensionViewController:(id)a3
{
}

- (id)extensionContextIdentifier
{
  return self->_extensionContextIdentifier;
}

- (void)setExtensionContextIdentifier:(id)a3
{
}

- (UIViewController)presenterViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresenterViewController:(id)a3
{
}

- (id)presenterCompletion
{
  return self->_presenterCompletion;
}

- (void)setPresenterCompletion:(id)a3
{
}

- (void)setActivityBundleHelper:(id)a3
{
}

- (id)extensionRequestCleanupCompletion
{
  return self->_extensionRequestCleanupCompletion;
}

- (void)setExtensionRequestCleanupCompletion:(id)a3
{
}

- (NSURL)originalFileURL
{
  return self->_originalFileURL;
}

- (void)setOriginalFileURL:(id)a3
{
}

- (NSDate)installationDate
{
  return self->_installationDate;
}

- (UISUIActivityExtensionItemDataRequest)extensionItemDataRequest
{
  return self->_extensionItemDataRequest;
}

- (void)setExtensionItemDataRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionItemDataRequest, 0);
  objc_storeStrong((id *)&self->_originalFileURL, 0);
  objc_storeStrong(&self->_extensionRequestCleanupCompletion, 0);
  objc_storeStrong((id *)&self->_activityBundleHelper, 0);
  objc_storeStrong(&self->_presenterCompletion, 0);
  objc_destroyWeak((id *)&self->_presenterViewController);
  objc_storeStrong(&self->_extensionContextIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionViewController, 0);
  objc_storeStrong((id *)&self->_overrideActivityCategory, 0);
  objc_storeStrong((id *)&self->__injectedExtensionItem, 0);
  objc_storeStrong((id *)&self->_applicationExtension, 0);
}

+ (id)_applicationExtensionActivitiesForItems:(id)a3
{
  id v3 = a3;
  id v4 = [_UIActivityMatchingContext alloc];
  int v5 = [(_UIActivityMatchingContext *)v4 initWithActivityItems:MEMORY[0x1E4F1CBF0] itemValues:MEMORY[0x1E4F1CBF0]];
  [(_UIActivityMatchingContext *)v5 setIsContentManaged:0];
  [(_UIActivityMatchingContext *)v5 setShouldMatchOnlyUserElectedExtensions:1];
  id v6 = _NSExtensionItemsFromActivityItemValues(v3);

  id v7 = +[_UIActivityApplicationExtensionDiscovery extensionMatchingDictionariesForExtensionItems:v6];
  [(_UIActivityMatchingContext *)v5 setActivityItemValueExtensionMatchingDictionaries:v7];

  id v8 = objc_alloc_init(_UIActivityApplicationExtensionDiscovery);
  id v13 = 0;
  uint64_t v9 = [(_UIActivityApplicationExtensionDiscovery *)v8 activitiesForMatchingContext:v5 error:&v13];
  id v10 = v13;
  if (v10)
  {
    id v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[UIApplicationExtensionActivity(UIActivity_PerformanceTest) _applicationExtensionActivitiesForItems:]();
    }
  }
  return v9;
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_16_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A0AD8000, v2, v3, "cancelled request - error: %{public}@", v4, v5, v6, v7, v8);
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_19_cold_1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A0AD8000, v2, v3, "request interrupted - error: %{public}@", v4, v5, v6, v7, v8);
}

void __71__UIApplicationExtensionActivity_prepareWithActivityExtensionItemData___block_invoke_2_27_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 40) localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A0AD8000, v2, v3, "Application extension failed to launch! error: %{public}@", v4, v5, v6, v7, v8);
}

void __84__UIApplicationExtensionActivity__instantiateExtensionViewControllerWithInputItems___block_invoke_2_37_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 56);
  uint64_t v5 = [v3 userInfo];
  int v6 = 138543874;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  __int16 v10 = 2114;
  id v11 = v5;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Cannot connect to view controller in %{public}@ - %{public}@ info %{public}@", (uint8_t *)&v6, 0x20u);
}

@end