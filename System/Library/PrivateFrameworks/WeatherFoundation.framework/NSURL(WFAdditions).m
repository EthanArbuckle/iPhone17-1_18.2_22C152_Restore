@interface NSURL(WFAdditions)
+ (id)wf_cacheDirectory;
- (id)wf_URLWithTracking:()WFAdditions;
- (uint64_t)wf_URLHasParameter:()WFAdditions;
@end

@implementation NSURL(WFAdditions)

+ (id)wf_cacheDirectory
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];
  v2 = (void *)v1;
  v3 = @"Configuration";
  if (v1) {
    v3 = (__CFString *)v1;
  }
  v4 = v3;

  v5 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v6 = NSURL;
  v7 = [v5 firstObject];
  v8 = [v6 fileURLWithPath:v7 isDirectory:1];

  v9 = [v8 URLByAppendingPathComponent:v4 isDirectory:1];

  v10 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v12 = 0;
  [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v12];

  return v9;
}

- (id)wf_URLWithTracking:()WFAdditions
{
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x263F08BA0];
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithURL:a1 resolvingAgainstBaseURL:0];
    v7 = [v6 query];
    v8 = [v7 stringByAppendingString:v5];

    [v6 setQuery:v8];
    id v9 = [v6 URL];
  }
  else
  {
    id v9 = a1;
  }
  return v9;
}

- (uint64_t)wf_URLHasParameter:()WFAdditions
{
  if (!a3) {
    return 0;
  }
  v4 = (objc_class *)MEMORY[0x263F08BA0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithURL:a1 resolvingAgainstBaseURL:0];
  v7 = [v6 query];
  uint64_t v8 = [v7 containsString:v5];

  return v8;
}

@end