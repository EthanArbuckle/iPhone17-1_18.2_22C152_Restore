@interface ICSystemPaperPresenter
+ (id)makeExtensionHostViewControllerWithUserActivityData:(id)a3 completion:(id)a4;
+ (void)initialize;
+ (void)presentSystemPaperWithUserActivityData:(id)a3 presentingViewController:(id)a4 completion:(id)a5;
- (ICSystemPaperPresenter)init;
@end

@implementation ICSystemPaperPresenter

+ (void)initialize
{
  v5[1] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v4 = @"ICEnableSystemPaperExtension";
    v5[0] = MEMORY[0x263EFFA88];
    v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
    [v2 registerDefaults:v3];
  }
}

+ (void)presentSystemPaperWithUserActivityData:(id)a3 presentingViewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (ICIsSystemPaperAvailable())
  {
    if (!v9)
    {
      v11 = [MEMORY[0x263F1CBC8] _applicationKeyWindow];
      v12 = [v11 rootViewController];

      v13 = [v12 presentedViewController];

      if (v13)
      {
        do
        {
          id v9 = [v12 presentedViewController];

          v14 = [v9 presentedViewController];

          v12 = v9;
        }
        while (v14);
      }
      else
      {
        id v9 = v12;
      }
    }
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __101__ICSystemPaperPresenter_presentSystemPaperWithUserActivityData_presentingViewController_completion___block_invoke;
    v22[3] = &unk_264E7BC90;
    v25 = &v26;
    id v9 = v9;
    id v23 = v9;
    id v24 = v10;
    v15 = (void (**)(void))MEMORY[0x23ECEF220](v22);
    v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v17 = [v16 BOOLForKey:@"ICEnableSystemPaperExtension"];

    if (v17)
    {
      uint64_t v18 = [a1 makeExtensionHostViewControllerWithUserActivityData:v8 completion:v15];
      v19 = (void *)v27[5];
      v27[5] = v18;
    }
    else
    {
      v20 = [[ICSystemPaperSceneViewController alloc] initWithUserActivityData:v8];
      v21 = (void *)v27[5];
      v27[5] = (uint64_t)v20;

      [(id)v27[5] setActive:1];
      v15[2](v15);
    }

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"System Paper not available"];
  }
}

uint64_t __101__ICSystemPaperPresenter_presentSystemPaperWithUserActivityData_presentingViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v1) {
    return [*(id *)(a1 + 32) presentViewController:v1 animated:1 completion:*(void *)(a1 + 40)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)makeExtensionHostViewControllerWithUserActivityData:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v5 = a4;
  v6 = [MEMORY[0x263F04DE8] extensionPointIdentifierQuery:@"com.apple.private.system-paper"];
  [MEMORY[0x263F04DF0] executeQuery:v6];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
      v13 = [v12 bundleIdentifier];
      char v14 = [v13 isEqualToString:@"com.apple.mobilenotes.EditorExtension"];

      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v15 = v12;

    if (!v15) {
      goto LABEL_12;
    }
    v16 = (void *)[objc_alloc(MEMORY[0x263F04E70]) initWithExtensionIdentity:v15];
    [v16 setBeginHostingImmediately:1];
    id v17 = objc_alloc_init(MEMORY[0x263F1CB60]);
    uint64_t v18 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [v17 setBackgroundColor:v18];

    v19 = [[ICSystemPaperExtensionHostViewController alloc] initWithConfiguration:v16];
    [(_EXHostViewController *)v19 setPlaceholderView:v17];
    v20 = v22;
    [(ICSystemPaperExtensionHostViewController *)v19 setUserActivityData:v22];
    [(ICSystemPaperExtensionHostViewController *)v19 setStartHostingBlock:v5];
  }
  else
  {
LABEL_9:

LABEL_12:
    v15 = ICSystemPaperExtensionLog();
    v20 = v22;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[ICSystemPaperPresenter makeExtensionHostViewControllerWithUserActivityData:completion:]();
    }
    v19 = 0;
  }

  return v19;
}

- (ICSystemPaperPresenter)init
{
  return 0;
}

+ (void)makeExtensionHostViewControllerWithUserActivityData:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_23CA54000, v0, OS_LOG_TYPE_ERROR, "Couldn't find System Paper extension; returning nil",
    v1,
    2u);
}

@end