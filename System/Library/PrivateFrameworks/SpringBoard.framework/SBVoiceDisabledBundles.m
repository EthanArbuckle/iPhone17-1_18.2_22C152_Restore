@interface SBVoiceDisabledBundles
+ (BOOL)voiceControlDisabledByCurrentlyRunningApp;
+ (void)setAppDisabledVoiceControl:(BOOL)a3 bundleIdentifier:(id)a4;
@end

@implementation SBVoiceDisabledBundles

+ (void)setAppDisabledVoiceControl:(BOOL)a3 bundleIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if ([v10 length])
  {
    v5 = (void *)__disabledVoiceControlBundleIds;
    if (v4)
    {
      id v6 = v10;
      if (!__disabledVoiceControlBundleIds)
      {
        uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
        v8 = (void *)__disabledVoiceControlBundleIds;
        __disabledVoiceControlBundleIds = v7;

        id v6 = v10;
        v5 = (void *)__disabledVoiceControlBundleIds;
      }
      [v5 addObject:v6];
    }
    else
    {
      [(id)__disabledVoiceControlBundleIds removeObject:v10];
      if (![(id)__disabledVoiceControlBundleIds count])
      {
        v9 = (void *)__disabledVoiceControlBundleIds;
        __disabledVoiceControlBundleIds = 0;
      }
    }
  }
}

+ (BOOL)voiceControlDisabledByCurrentlyRunningApp
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = (id)[(id)__disabledVoiceControlBundleIds copy];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v9 = +[SBApplicationController sharedInstanceIfExists];
        id v10 = [v9 applicationWithBundleIdentifier:v8];

        v11 = [v10 processState];
        char v12 = [v11 isRunning];

        if (v12) {
          char v5 = 1;
        }
        else {
          [a1 setAppDisabledVoiceControl:0 bundleIdentifier:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

@end