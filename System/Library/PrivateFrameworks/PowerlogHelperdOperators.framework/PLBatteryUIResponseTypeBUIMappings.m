@interface PLBatteryUIResponseTypeBUIMappings
- (NSDictionary)batteryUIMappings;
- (PLBatteryUIResponderService)responderService;
- (id)dependencies;
- (id)getInstalledPluginMapping;
- (id)result;
- (void)run;
- (void)setBatteryUIMappings:(id)a3;
- (void)setResponderService:(id)a3;
@end

@implementation PLBatteryUIResponseTypeBUIMappings

- (id)dependencies
{
  return 0;
}

- (void)run
{
  id v5 = [(PLBatteryUIResponseTypeBUIMappings *)self getInstalledPluginMapping];
  v3 = +[PLBatteryUIResponseTypeUtilities getBundleIDToReplacementBundleIDMap];
  [v5 addEntriesFromDictionary:v3];

  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v5];
  [(PLBatteryUIResponseTypeBUIMappings *)self setBatteryUIMappings:v4];
}

- (id)result
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"buiMappings";
  v2 = [(PLBatteryUIResponseTypeBUIMappings *)self batteryUIMappings];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)getInstalledPluginMapping
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = objc_msgSend(MEMORY[0x1E4F223A0], "enumeratorWithOptions:", 0, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        v9 = [v8 bundleIdentifier];
        v10 = [v8 containingBundleRecord];
        v11 = [v10 bundleIdentifier];

        v12 = [v8 extensionPointRecord];
        v13 = [v12 identifier];

        if (v9) {
          BOOL v14 = v11 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          if ([v13 isEqualToString:@"com.apple.posterkit.provider"])
          {
            v15 = v2;
            v16 = @"HLS";
            goto LABEL_18;
          }
          if ([v13 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"])
          {
            v15 = v2;
            v16 = @"com.apple.mobileslideshow";
            goto LABEL_18;
          }
          if ([v13 isEqualToString:@"com.apple.sidecar.extension.capture"])
          {
            v15 = v2;
            v16 = @"ContinuityCamera";
            goto LABEL_18;
          }
          if ([v13 isEqualToString:@"HomeKit"])
          {
            v15 = v2;
            v16 = @"com.apple.Home";
LABEL_18:
            [v15 setObject:v16 forKey:v9];
LABEL_19:
            [v2 setObject:v11 forKey:v9];
            goto LABEL_20;
          }
          if ([v13 hasSuffix:@"/watch"])
          {
            uint64_t v17 = [v13 length] - 6;
          }
          else
          {
            if (![v13 hasSuffix:@".watchkitextension"]) {
              goto LABEL_19;
            }
            uint64_t v17 = [v13 length] - 18;
          }
          v18 = objc_msgSend(v13, "substringWithRange:", 0, v17);
          [v2 setObject:v18 forKey:v9];

          goto LABEL_19;
        }
LABEL_20:

        ++v7;
      }
      while (v5 != v7);
      uint64_t v19 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v5 = v19;
    }
    while (v19);
  }

  return v2;
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
}

- (NSDictionary)batteryUIMappings
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBatteryUIMappings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryUIMappings, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end