@interface TFBetaAppLaunchPresenter
- (NSURL)bundleURL;
- (TFBetaAppLaunchDataProvider)launchDataProvider;
- (TFBetaAppLaunchPresenter)initWithBundleURL:(id)a3 launchDataProvider:(id)a4 launchScreenSidepack:(id)a5;
- (TFBetaAppLaunchPresenterView)presenterView;
- (TFImageFetcher)imageFetcher;
- (TFLaunchScreen)launchScreen;
- (void)_abortLaunchScreenLoadWithError:(id)a3;
- (void)_showHowToViewWithLaunchScreen:(id)a3;
- (void)_showLoading;
- (void)_showTestNotesViewWithLaunchScreen:(id)a3;
- (void)exitLaunchScreen;
- (void)openHowToSupportLink;
- (void)setLaunchScreen:(id)a3;
- (void)setPresenterView:(id)a3;
- (void)showHowToScreen;
- (void)update;
@end

@implementation TFBetaAppLaunchPresenter

- (TFBetaAppLaunchPresenter)initWithBundleURL:(id)a3 launchDataProvider:(id)a4 launchScreenSidepack:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TFBetaAppLaunchPresenter;
  v11 = [(TFBetaAppLaunchPresenter *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    bundleURL = v11->_bundleURL;
    v11->_bundleURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_launchDataProvider, a4);
    objc_storeStrong((id *)&v11->_launchScreen, a5);
    v14 = objc_alloc_init(TFImageFetcher);
    imageFetcher = v11->_imageFetcher;
    v11->_imageFetcher = v14;
  }
  return v11;
}

- (void)update
{
  v3 = [(TFBetaAppLaunchPresenter *)self launchScreen];

  if (v3)
  {
    id v6 = [(TFBetaAppLaunchPresenter *)self launchScreen];
    [(TFBetaAppLaunchPresenter *)self _showTestNotesViewWithLaunchScreen:v6];
  }
  else
  {
    [(TFBetaAppLaunchPresenter *)self _showLoading];
    v4 = [(TFBetaAppLaunchPresenter *)self launchDataProvider];
    v5 = [(TFBetaAppLaunchPresenter *)self bundleURL];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__TFBetaAppLaunchPresenter_update__block_invoke;
    v7[3] = &unk_26468EB60;
    v7[4] = self;
    [v4 loadLaunchScreenForBundleWithURL:v5 withCompletionHandler:v7];
  }
}

void __34__TFBetaAppLaunchPresenter_update__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    id v8 = v6;
LABEL_9:
    [v7 _abortLaunchScreenLoadWithError:v8];
    goto LABEL_10;
  }
  if (!v5 || ([v5 testerNotes], id v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    uint64_t v12 = +[TFLogConfiguration defaultConfiguration];
    v13 = [v12 generatedLogger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = objc_opt_class();
      v15 = *(void **)(a1 + 32);
      id v16 = v14;
      objc_super v17 = [v15 bundleURL];
      int v18 = 138543618;
      v19 = v14;
      __int16 v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_223064000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] update: failed to fetch launch screen record, or no tester notes are available", (uint8_t *)&v18, 0x16u);
    }
    v7 = *(void **)(a1 + 32);
    id v8 = 0;
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) setLaunchScreen:v5];
  id v10 = *(void **)(a1 + 32);
  v11 = [v10 launchScreen];
  [v10 _showTestNotesViewWithLaunchScreen:v11];

LABEL_10:
}

- (void)showHowToScreen
{
  v3 = [(TFBetaAppLaunchPresenter *)self launchScreen];

  if (v3)
  {
    id v4 = [(TFBetaAppLaunchPresenter *)self launchScreen];
    [(TFBetaAppLaunchPresenter *)self _showHowToViewWithLaunchScreen:v4];
  }
}

- (void)openHowToSupportLink
{
  v3 = [(TFBetaAppLaunchPresenter *)self launchScreen];

  if (v3)
  {
    id v6 = [MEMORY[0x263F1C408] sharedApplication];
    id v4 = [(TFBetaAppLaunchPresenter *)self launchScreen];
    id v5 = [v4 howToScreenshotSupportUrl];
    [v6 openURL:v5 options:MEMORY[0x263EFFA78] completionHandler:0];
  }
}

- (void)exitLaunchScreen
{
  id v2 = [(TFBetaAppLaunchPresenter *)self presenterView];
  [v2 dismissAnimated:1];
}

- (void)_showLoading
{
  id v2 = [(TFBetaAppLaunchPresenter *)self presenterView];
  [v2 showLoadingAnimated:1];
}

- (void)_showTestNotesViewWithLaunchScreen:(id)a3
{
  id v4 = a3;
  TFLocalizedString(@"LAUNCH_BUTTON_NEXT");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(TFBetaAppLaunchPresenter *)self presenterView];
  id v6 = TFLocalizedString(@"LAUNCH_TITLE_FROM_THE_DEVELOPER");
  v7 = [v4 lockup];
  id v8 = TFLocalizedString(@"LAUNCH_TEST_NOTES_TITLE");
  id v9 = [v4 testerNotes];

  id v10 = [(TFBetaAppLaunchPresenter *)self imageFetcher];
  LOBYTE(v11) = 1;
  [v5 showTestNotesWithTitle:v6 lockup:v7 testNotesTitle:v8 testNotesText:v9 primaryButtonTitle:v12 primaryButtonEvent:0 animated:v11 fetchingOnImageFetcher:v10];
}

- (void)_showHowToViewWithLaunchScreen:(id)a3
{
  id v10 = +[TFCoreUtils tf_screenshotInstructionImageDict];
  id v4 = [(TFBetaAppLaunchPresenter *)self presenterView];
  id v5 = TFLocalizedString(@"LAUNCH_TITLE_SHARE_FEEDBACK");
  id v6 = TFLocalizedString(@"LAUNCH_SUBTITLE_TAKE_SCREENSHOT_MESSAGE");
  v7 = TFLocalizedString(@"LAUNCH_BUTTON_START_TESTING");
  id v8 = TFLocalizedString(@"LAUNCH_BUTTON_LEARN_MORE");
  LOBYTE(v9) = 1;
  [v4 showHowToWithTitle:v5 subtitle:v6 screenshotImageDict:v10 primaryButtonTitle:v7 primaryButtonEvent:2 secondaryButtonTitle:v8 secondaryButtonEvent:1 animated:v9];
}

- (void)_abortLaunchScreenLoadWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[TFLogConfiguration defaultConfiguration];
  id v6 = [v5 generatedLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_opt_class();
    id v8 = v7;
    uint64_t v9 = [(TFBetaAppLaunchPresenter *)self bundleURL];
    id v10 = [v4 localizedDescription];
    int v11 = 138543874;
    id v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] _abortLaunchScreenLoadWithError: error = %@", (uint8_t *)&v11, 0x20u);
  }
  [(TFBetaAppLaunchPresenter *)self exitLaunchScreen];
}

- (TFBetaAppLaunchPresenterView)presenterView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenterView);

  return (TFBetaAppLaunchPresenterView *)WeakRetained;
}

- (void)setPresenterView:(id)a3
{
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (TFBetaAppLaunchDataProvider)launchDataProvider
{
  return self->_launchDataProvider;
}

- (TFImageFetcher)imageFetcher
{
  return self->_imageFetcher;
}

- (TFLaunchScreen)launchScreen
{
  return self->_launchScreen;
}

- (void)setLaunchScreen:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchScreen, 0);
  objc_storeStrong((id *)&self->_imageFetcher, 0);
  objc_storeStrong((id *)&self->_launchDataProvider, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);

  objc_destroyWeak((id *)&self->_presenterView);
}

@end