@interface FBSDisplayConfiguration(PosterUIFoundation)
+ (id)pui_displayConfigurationForHardwareIdentifier:()PosterUIFoundation;
+ (id)pui_displayConfigurationForScreen:()PosterUIFoundation;
- (id)pui_displayConfigurationIdentifier;
@end

@implementation FBSDisplayConfiguration(PosterUIFoundation)

- (id)pui_displayConfigurationIdentifier
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [a1 currentMode];
  v3 = NSString;
  [a1 bounds];
  v4 = NSStringFromCGRect(v20);
  [a1 pointScale];
  uint64_t v6 = v5;
  [v2 colorGamut];
  v7 = FBSDisplayGamutDescription();
  [v2 hdrMode];
  v8 = FBSDisplayHDRModeDescription();
  v9 = [v3 stringWithFormat:@"{bounds:'%@',pointScale:'%f',gamut:'%@',hdrMode:'%@'}", v4, v6, v7, v8];

  id v10 = v9;
  v11 = (const char *)[v10 UTF8String];
  CC_LONG v12 = strlen(v11);
  CC_SHA256(v11, v12, md);
  v13 = [MEMORY[0x263F089D8] stringWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v13, "appendFormat:", @"%02x", md[i]);
  v15 = [NSString stringWithString:v13];

  return v15;
}

+ (id)pui_displayConfigurationForScreen:()PosterUIFoundation
{
  v3 = (void *)MEMORY[0x263F3F750];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "pui_sharedDisplayMonitor");
  uint64_t v6 = [v4 displayIdentity];

  v7 = [v5 configurationForIdentity:v6];

  return v7;
}

+ (id)pui_displayConfigurationForHardwareIdentifier:()PosterUIFoundation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263F3F750], "pui_sharedDisplayMonitor");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend(v4, "connectedIdentities", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = [v4 configurationForIdentity:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
      v11 = objc_msgSend(v10, "pui_displayConfigurationIdentifier");
      char v12 = [v11 isEqual:v3];

      if (v12) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v10 = 0;
  }

  return v10;
}

@end