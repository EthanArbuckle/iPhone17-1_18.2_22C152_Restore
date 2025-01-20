@interface NSUserDefaults
@end

@implementation NSUserDefaults

void __87__NSUserDefaults_SafariSharedUIExtras__safari_resetWebKitExperimentalFeaturesIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) stringForKey:@"SafariVersionForExperimentalFeatures"];
  id v3 = *(id *)(a1 + 40);
  if (!v3)
  {
    id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  }
  v4 = objc_msgSend(v3, "safari_shortVersion");
  if (!v2 || [v2 compare:v4 options:64] == -1)
  {
    v12 = v2;
    [*(id *)(a1 + 32) setObject:v4 forKey:@"SafariVersionForExperimentalFeatures"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [MEMORY[0x1E4F46688] _experimentalFeatures];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(a1 + 32);
          v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_keyForWebKitExperimentalFeature:", *(void *)(*((void *)&v13 + 1) + 8 * v9));
          [v10 removeObjectForKey:v11];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v2 = v12;
  }
}

@end