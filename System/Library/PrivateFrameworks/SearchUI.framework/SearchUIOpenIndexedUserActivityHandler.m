@interface SearchUIOpenIndexedUserActivityHandler
+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4;
- (void)getUserActivityForCommand:(id)a3 environment:(id)a4 completionHandler:(id)a5;
@end

@implementation SearchUIOpenIndexedUserActivityHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  v4 = [a3 identifyingResult];
  v5 = [v4 userActivityRequiredString];
  if (v5)
  {
    v6 = objc_opt_new();
    [v6 setUserActivityRequiredString:v5];
    v7 = [v4 applicationBundleIdentifier];
    [v6 setApplicationBundleIdentifier:v7];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)getUserActivityForCommand:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F22488];
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 alloc];
  id v13 = [v9 userActivityRequiredString];
  v11 = (void *)[v10 _initWithUserActivityStrings:v13 secondaryString:0 optionalData:0];
  v12 = [v9 applicationBundleIdentifier];

  (*((void (**)(id, void *, void *))a5 + 2))(v8, v11, v12);
}

@end