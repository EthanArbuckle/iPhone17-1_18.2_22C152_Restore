@interface SearchUILaunchWebClipHandler
+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUILaunchWebClipHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  v4 = [a3 identifyingResult];
  if ([v4 isLocalApplicationResult])
  {
    v5 = [v4 applicationBundleIdentifier];
    v6 = +[SearchUIUtilities bundleIdentifierForApp:0];
    int v7 = [v5 isEqualToString:v6];

    v8 = 0;
    if (v7)
    {
      v8 = objc_opt_new();
      v9 = [v4 identifier];
      [v8 setClipIdentifier:v9];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  v5 = (void *)MEMORY[0x1E4FA6CB8];
  id v6 = [a3 clipIdentifier];
  [v5 launchWebClipWithIdentifier:v6 origin:2];
}

@end