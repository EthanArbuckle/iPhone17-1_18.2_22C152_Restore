@interface WFAppContentLocation(Icon)
- (id)icon;
@end

@implementation WFAppContentLocation(Icon)

- (id)icon
{
  v2 = (void *)MEMORY[0x263F85308];
  v3 = [a1 appDescriptor];
  v4 = [v3 bundleIdentifier];
  v5 = [v2 applicationIconImageForBundleIdentifier:v4];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F85148]);
    v7 = [a1 appDescriptor];
    v8 = [v7 bundleIdentifier];
    v9 = (void *)[v6 initWithBundleIdentifier:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end