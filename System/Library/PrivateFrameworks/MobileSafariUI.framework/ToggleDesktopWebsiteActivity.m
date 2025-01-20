@interface ToggleDesktopWebsiteActivity
- (BOOL)canPerformWithTabDocument:(id)a3;
- (id)activityTitleWithTabDocument:(id)a3;
- (id)activityType;
- (id)systemImageNameWithTabDocument:(id)a3;
- (int64_t)actionType;
- (void)performActivityWithTabDocument:(id)a3;
@end

@implementation ToggleDesktopWebsiteActivity

- (id)activityType
{
  return @"SafariActivityTypeToggleDesktop";
}

- (id)activityTitleWithTabDocument:(id)a3
{
  v3 = [a3 reloadOptionsController];
  [v3 loadedUsingDesktopUserAgent];
  v4 = _WBSLocalizedString();

  return v4;
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  id v3 = a3;
  v4 = [v3 reloadOptionsController];
  int v5 = [v4 loadedUsingDesktopUserAgent];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4FB1818];
    v7 = [v3 view];
    v8 = [v7 window];
    v9 = [v8 windowScene];
    objc_msgSend(v6, "safari_currentDeviceImageNameForOrientation:", objc_msgSend(v9, "interfaceOrientation"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = @"desktopcomputer";
  }

  return v10;
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  id v3 = a3;
  if ([v3 isShowingReader])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v5 = [v3 webView];
    v6 = [v5 URL];
    int v4 = objc_msgSend(v6, "sf_isOfflineReadingListURL") ^ 1;
  }
  return v4;
}

- (int64_t)actionType
{
  return 18;
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4 = a3;
  int v5 = [v4 reloadOptionsController];
  int v6 = [v5 loadedUsingDesktopUserAgent];

  v7 = [v4 reloadOptionsController];

  if (v6) {
    [v7 requestStandardSite];
  }
  else {
    [v7 requestDesktopSite];
  }

  [(_SFActivity *)self activityDidFinish:1];
}

@end