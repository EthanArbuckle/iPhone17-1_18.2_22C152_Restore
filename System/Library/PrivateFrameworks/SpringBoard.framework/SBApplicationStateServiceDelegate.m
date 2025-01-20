@interface SBApplicationStateServiceDelegate
- (id)dataSourceForApplicationBundleIdentifier:(id)a3;
@end

@implementation SBApplicationStateServiceDelegate

- (id)dataSourceForApplicationBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[SBApplicationController sharedInstanceIfExists];
  v5 = [v4 applicationWithBundleIdentifier:v3];

  if (!v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:0];
    if ([v6 isWebAppPlaceholder])
    {
      v7 = +[SBIconController sharedInstance];
      v8 = [v7 model];
      v9 = [v8 bookmarkIconForWebClipPlaceholderBundleIdentifier:v3];
      v10 = self;
      v11 = [v9 bookmark];
      v5 = SBSafeCast((uint64_t)v10, v11);
    }
  }

  return v5;
}

@end