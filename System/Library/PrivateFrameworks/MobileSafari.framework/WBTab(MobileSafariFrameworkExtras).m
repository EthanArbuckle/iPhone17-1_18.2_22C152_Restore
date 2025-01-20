@interface WBTab(MobileSafariFrameworkExtras)
+ (uint64_t)linkCountForTabs:()MobileSafariFrameworkExtras;
- (BOOL)hasLinkToCopy;
@end

@implementation WBTab(MobileSafariFrameworkExtras)

- (BOOL)hasLinkToCopy
{
  v1 = [a1 url];
  BOOL v2 = v1 != 0;

  return v2;
}

+ (uint64_t)linkCountForTabs:()MobileSafariFrameworkExtras
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) hasLinkToCopy];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end