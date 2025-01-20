@interface SBBookmarkIcon
- (BOOL)representsWebApp;
- (id)_applicationRecordForDefaultBrowser;
- (id)applicationToLaunch;
- (id)representedSceneIdentifier;
@end

@implementation SBBookmarkIcon

- (BOOL)representsWebApp
{
  v3 = +[SBApplicationController sharedInstance];
  v4 = [v3 webApplication];
  v5 = [(SBBookmarkIcon *)self applicationToLaunch];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (id)applicationToLaunch
{
  v3 = +[SBApplicationController sharedInstance];
  v4 = [(SBHBookmarkIcon *)self webClip];
  v5 = [v4 applicationBundleIdentifier];
  if (v5)
  {
    char v6 = [v3 restrictionController];
    char v7 = [v6 isApplicationIdentifierRestricted:v5];

    if (v7)
    {
      v8 = 0;
    }
    else
    {
      v8 = [v3 applicationWithBundleIdentifier:v5];
    }
  }
  else
  {
    if (![v4 fullScreen]
      || (objc_opt_respondsToSelector() & 1) != 0 && ([v4 alternativeFullScreen] & 1) != 0)
    {
      v9 = [(SBBookmarkIcon *)self _applicationRecordForDefaultBrowser];
      v10 = [v9 bundleIdentifier];

      if (v10)
      {
        v11 = v3;
        v12 = v10;
      }
      else
      {
        v12 = @"com.apple.mobilesafari";
        v11 = v3;
      }
      uint64_t v13 = [v11 applicationWithBundleIdentifier:v12];
    }
    else
    {
      v10 = +[SBApplicationController sharedInstance];
      uint64_t v13 = [(__CFString *)v10 webApplication];
    }
    v8 = (void *)v13;
  }
  return v8;
}

- (id)_applicationRecordForDefaultBrowser
{
  v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"http://"];
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBBookmarkIcon.m" lineNumber:62 description:@"HTTP URL should always construct"];
  }
  uint64_t v10 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F22408]) initWithURL:v4 error:&v10];
  char v6 = v5;
  if (v5)
  {
    char v7 = [v5 bundleRecord];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
  }
  char v7 = 0;
LABEL_7:

  return v7;
}

- (id)representedSceneIdentifier
{
  v3 = [(SBHBookmarkIcon *)self webClip];
  v4 = [v3 applicationBundleIdentifier];

  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)SBBookmarkIcon;
    v5 = [(SBIcon *)&v9 representedSceneIdentifier];
  }
  else
  {
    char v6 = [(SBHBookmarkIcon *)self webClip];
    char v7 = [v6 identifier];
    v5 = +[SBWebApplication _webAppIdentifierFromWebClipIdentifier:v7];
  }
  return v5;
}

@end