@interface NTKCBundleLocalizedString
@end

@implementation NTKCBundleLocalizedString

__CFString *__NTKCBundleLocalizedString_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = a2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = NTKCDefaultValueLocalizedString(*(void **)(a1 + 32), *(void **)(*((void *)&v16 + 1) + 8 * i), v7, 0);
        if (v11)
        {
          v12 = (__CFString *)v11;
          v13 = objc_msgSend(MEMORY[0x1E4F19A98], "sharedMonitor", (void)v16);
          int v14 = [v13 shouldHideForSensitivity:a3];

          if (v14)
          {

            v12 = &stru_1F1635E90;
          }
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v12 = 0;
LABEL_12:

  return v12;
}

@end