@interface UIApplication(VideosUI)
+ (BOOL)vuiIsActive;
+ (BOOL)vuiIsRTL;
- (id)vuiDelegate;
- (uint64_t)vuiIsNonLightningAVAdapterConnected;
@end

@implementation UIApplication(VideosUI)

- (uint64_t)vuiIsNonLightningAVAdapterConnected
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(a1, "connectedScenes", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    int v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        v4 |= objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "vui_isNonLightningSecondScreenScene");
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4 & 1;
}

- (id)vuiDelegate
{
  v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  v1 = [v0 delegate];

  if ([v1 conformsToProtocol:&unk_1F40592F8]) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

+ (BOOL)vuiIsRTL
{
  v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v1 = [v0 userInterfaceLayoutDirection];

  return v1 == 1;
}

+ (BOOL)vuiIsActive
{
  v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v1 = [v0 applicationState] == 0;

  return v1;
}

@end