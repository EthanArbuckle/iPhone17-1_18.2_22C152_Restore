@interface SBApplicationPlaceholder
- (BOOL)cancel;
- (BOOL)pause;
- (BOOL)prioritize;
- (BOOL)resume;
- (void)_reloadThumbnailImage;
@end

@implementation SBApplicationPlaceholder

- (BOOL)prioritize
{
  v3 = (void *)MEMORY[0x1E4F78060];
  v4 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleID];
  v5 = [NSString stringWithFormat:@"Requesting to prioritize placeholder."];
  [v3 logStep:6 byParty:10 phase:3 success:1 forBundleID:v4 description:v5];

  v7.receiver = self;
  v7.super_class = (Class)SBApplicationPlaceholder;
  return [(SBHProxiedApplicationPlaceholder *)&v7 prioritize];
}

- (BOOL)cancel
{
  v3 = (void *)MEMORY[0x1E4F78060];
  v4 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleID];
  v5 = [NSString stringWithFormat:@"Requesting to cancel placeholder."];
  [v3 logStep:7 byParty:10 phase:3 success:1 forBundleID:v4 description:v5];

  v7.receiver = self;
  v7.super_class = (Class)SBApplicationPlaceholder;
  return [(SBHProxiedApplicationPlaceholder *)&v7 cancel];
}

- (BOOL)pause
{
  v3 = (void *)MEMORY[0x1E4F78060];
  v4 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleID];
  v5 = [NSString stringWithFormat:@"Requesting to pause placeholder."];
  [v3 logStep:8 byParty:10 phase:3 success:1 forBundleID:v4 description:v5];

  v7.receiver = self;
  v7.super_class = (Class)SBApplicationPlaceholder;
  return [(SBHProxiedApplicationPlaceholder *)&v7 pause];
}

- (BOOL)resume
{
  v3 = (void *)MEMORY[0x1E4F78060];
  v4 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleID];
  v5 = [NSString stringWithFormat:@"Requesting to resume placeholder."];
  [v3 logStep:9 byParty:10 phase:3 success:1 forBundleID:v4 description:v5];

  v7.receiver = self;
  v7.super_class = (Class)SBApplicationPlaceholder;
  return [(SBHProxiedApplicationPlaceholder *)&v7 resume];
}

- (void)_reloadThumbnailImage
{
  v3 = (void *)MEMORY[0x1E4F78060];
  v4 = [(SBHProxiedApplicationPlaceholder *)self applicationBundleID];
  v5 = [NSString stringWithFormat:@"Reloading icon image."];
  [v3 logStep:2 byParty:10 phase:3 success:1 forBundleID:v4 description:v5];

  v6.receiver = self;
  v6.super_class = (Class)SBApplicationPlaceholder;
  [(SBHProxiedApplicationPlaceholder *)&v6 _reloadThumbnailImage];
}

@end