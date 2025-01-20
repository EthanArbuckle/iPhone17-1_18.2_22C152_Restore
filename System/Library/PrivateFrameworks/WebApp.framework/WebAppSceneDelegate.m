@interface WebAppSceneDelegate
- (void)_tearDownWindowAndWebApp;
- (void)connectWebClipIdentifier:(id)a3 toScene:(id)a4 forWebPush:(BOOL)a5;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
@end

@implementation WebAppSceneDelegate

- (void)connectWebClipIdentifier:(id)a3 toScene:(id)a4 forWebPush:(BOOL)a5
{
  BOOL v5 = a5;
  id v24 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F1CBA0] webClipWithIdentifier:v24];
  if ([MEMORY[0x263F16990] isHSWADisabled]) {
    int v10 = 1;
  }
  else {
    int v10 = [MEMORY[0x263F16990] isYttriumEligible];
  }
  uint64_t v11 = [v9 eligibilityStatus];
  char v12 = v10 ^ 1;
  if (v11) {
    char v12 = 0;
  }
  self->_shouldLoadWebApp = v12;
  if (v12)
  {
    v13 = [[WebAppViewController alloc] initWithWebClip:v9];
    webApp = self->_webApp;
    self->_webApp = v13;

    v15 = +[WebAppNotificationCenterDelegate sharedDelegate];
    [v15 addWebAppViewController:self->_webApp];

    [(WebAppViewController *)self->_webApp setWasLaunchedForWebPush:v5];
    if (v5)
    {
      [(WebAppViewController *)self->_webApp processWebPushWithIdentifier:v24];
      goto LABEL_15;
    }
    v19 = (UIWindow *)[objc_alloc(MEMORY[0x263F1CBC8]) initWithWindowScene:v8];
    window = self->_window;
    self->_window = v19;

    [(UIWindow *)self->_window setRootViewController:self->_webApp];
    v21 = self->_window;
  }
  else
  {
    v16 = [[WebAppEligibilityViewController alloc] initWithWebClip:v9 scene:v8];
    eligibilityViewController = self->_eligibilityViewController;
    self->_eligibilityViewController = v16;

    if (v10) {
      BOOL v18 = [v9 eligibilityStatus] == 0;
    }
    else {
      BOOL v18 = 0;
    }
    [(WebAppEligibilityViewController *)self->_eligibilityViewController setOverrideShowAlert:v18];
    v22 = (UIWindow *)[objc_alloc(MEMORY[0x263F1CBC8]) initWithWindowScene:v8];
    v23 = self->_window;
    self->_window = v22;

    [(UIWindow *)self->_window setRootViewController:self->_eligibilityViewController];
    v21 = self->_window;
  }
  [(UIWindow *)v21 makeKeyAndVisible];
LABEL_15:
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v9 URLContexts];
  uint64_t v11 = [v10 anyObject];
  char v12 = [v11 URL];

  v13 = webClipIdentifierFromLaunchURL(v12, @"webapp://web-push/");
  if (v13)
  {
    v14 = [v9 sourceApplication];
    char v15 = [v14 hasPrefix:@"com.apple."];

    if (v15)
    {
      uint64_t v16 = 1;
      goto LABEL_11;
    }
  }
  id v17 = [v8 persistentIdentifier];
  if ([v17 hasPrefix:@"com.apple.webapp - "])
  {
    BOOL v18 = @"com.apple.webapp - ";
  }
  else
  {
    if (![v17 hasPrefix:@"com.apple.webapp-"])
    {
      id v19 = v17;
      goto LABEL_10;
    }
    BOOL v18 = @"com.apple.webapp-";
  }
  objc_msgSend(v17, "substringFromIndex:", -[__CFString length](v18, "length"));
  id v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  id v20 = v19;

  uint64_t v16 = 0;
  v13 = v20;
LABEL_11:
  [(WebAppSceneDelegate *)self connectWebClipIdentifier:v13 toScene:v21 forWebPush:v16];
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_shouldLoadWebApp)
  {
    id v9 = [v7 anyObject];
    int v10 = [v9 URL];

    uint64_t v11 = webClipIdentifierFromLaunchURL(v10, @"webapp://web-push/");
    webApp = self->_webApp;
    if (v11)
    {
      [(WebAppViewController *)webApp processWebPushWithIdentifier:v11];
    }
    else
    {
      if (webApp && ![(WebAppViewController *)webApp wasLaunchedForWebPush]) {
        goto LABEL_11;
      }
      uint64_t v13 = webClipIdentifierFromLaunchURL(v10, @"webapp:");
      if (v13)
      {
        uint64_t v11 = v13;
        [(WebAppSceneDelegate *)self _tearDownWindowAndWebApp];
        [(WebAppSceneDelegate *)self connectWebClipIdentifier:v11 toScene:v6 forWebPush:0];
      }
      else
      {
        uint64_t v11 = viewServiceLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v14 = [v8 anyObject];
          char v15 = [v14 URL];
          int v16 = 138739971;
          id v17 = v15;
          _os_log_impl(&dword_23D520000, v11, OS_LOG_TYPE_INFO, "scene:openURLContexts: Launch URL %{sensitive}@ did not contain a web clip identifier", (uint8_t *)&v16, 0xCu);
        }
      }
    }

LABEL_11:
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_shouldLoadWebApp)
  {
    BOOL v5 = [(WebAppViewController *)self->_webApp webClip];
  }
  else
  {
    BOOL v5 = [(WebAppEligibilityViewController *)self->_eligibilityViewController webClip];
    [(WebAppEligibilityViewController *)self->_eligibilityViewController presentAlertIfNeeded];
  }
  v10[0] = @"url";
  id v6 = [v5 pageURL];
  v11[0] = v6;
  v10[1] = @"title";
  id v7 = [v5 title];
  v11[1] = v7;
  v10[2] = @"identifier";
  id v8 = [v5 identifier];
  v11[2] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  if (PLShouldLogRegisteredEvent()) {
    PLLogRegisteredEvent();
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  self->_wasSuspendedUnderLock = objc_msgSend((id)*MEMORY[0x263F1D020], "isSuspendedUnderLock", a3);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v9 = a3;
  BOOL sceneHasEverEnteredForeground = self->_sceneHasEverEnteredForeground;
  self->_BOOL sceneHasEverEnteredForeground = 1;
  if (sceneHasEverEnteredForeground
    && !self->_wasSuspendedUnderLock
    && ([(WebAppViewController *)self->_webApp webClip],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        [v5 pageURL],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = objc_msgSend(v6, "safari_isDataURL"),
        v6,
        v5,
        v7))
  {
    [(WebAppSceneDelegate *)self _tearDownWindowAndWebApp];
    id v8 = [v9 session];
    [(WebAppSceneDelegate *)self scene:v9 willConnectToSession:v8 options:0];
  }
  else
  {
    [(WebAppViewController *)self->_webApp openURLWithCustomSchemeIfNeeded];
  }
}

- (void)_tearDownWindowAndWebApp
{
  [(UIWindow *)self->_window setHidden:1];
  window = self->_window;
  self->_window = 0;

  id v4 = +[WebAppNotificationCenterDelegate sharedDelegate];
  [v4 removeWebAppViewController:self->_webApp];

  webApp = self->_webApp;
  self->_webApp = 0;

  eligibilityViewController = self->_eligibilityViewController;
  self->_eligibilityViewController = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibilityViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);

  objc_storeStrong((id *)&self->_webApp, 0);
}

@end