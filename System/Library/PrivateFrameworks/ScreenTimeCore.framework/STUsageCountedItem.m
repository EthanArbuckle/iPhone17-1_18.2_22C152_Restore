@interface STUsageCountedItem
+ (id)notificationItemsExcludingSystemHiddenApplications:(id)a3;
+ (id)pickupItemsExcludingSystemHiddenApplications:(id)a3;
@end

@implementation STUsageCountedItem

+ (id)notificationItemsExcludingSystemHiddenApplications:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = [MEMORY[0x1E4F580A0] systemHiddenBundleIdentifiersForDeviceFamily:102];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    v29 = v4;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "numberOfNotifications", v29);
        v13 = [v11 bundleIdentifier];
        if (v12 >= 1
          && ([v5 containsObject:v13] & 1) == 0
          && ([(__CFString *)v13 hasPrefix:@"_SYSTEM_CENTER_:"] & 1) == 0
          && ([(__CFString *)v13 hasPrefix:@"_SOCIAL_CENTER_:"] & 1) == 0)
        {
          char v14 = [(__CFString *)v13 hasPrefix:@"_WEB_CENTER_:"];
          v15 = @"com.apple.mobilesafari";
          if ((v14 & 1) == 0)
          {
            int v16 = [(__CFString *)v13 hasPrefix:@"_WALLET_CENTER_:"];
            v15 = @"com.apple.Passbook";
            if (!v16) {
              v15 = v13;
            }
          }
          float v17 = (float)v12;
          v30 = v15;
          v18 = -[STUsageTrustIdentifier initWithIdentifier:usageTrusted:]([STUsageTrustIdentifier alloc], "initWithIdentifier:usageTrusted:", v30, [v11 usageTrusted]);
          id v19 = v4;
          v20 = [v19 objectForKeyedSubscript:v18];
          if (v20)
          {
            v21 = v20;
            [(STUsageDetailItem *)v20 quantity];
            *(float *)&double v23 = v22 + v17;
            [(STUsageDetailItem *)v21 setQuantity:v23];
          }
          else
          {
            v24 = [STUsageDetailItem alloc];
            v25 = [(STUsageTrustIdentifier *)v18 identifier];
            v21 = [(STUsageDetailItem *)v24 initWithType:1 identifier:v25 usageTrusted:[(STUsageTrustIdentifier *)v18 usageTrusted]];

            v4 = v29;
            *(float *)&double v26 = v17;
            [(STUsageDetailItem *)v21 setQuantity:v26];
            [v19 setObject:v21 forKeyedSubscript:v18];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  v27 = [v4 allValues];

  return v27;
}

+ (id)pickupItemsExcludingSystemHiddenApplications:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = [MEMORY[0x1E4F580A0] systemHiddenBundleIdentifiersForDeviceFamily:102];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    unint64_t v10 = 0x1E6BC6000uLL;
    do
    {
      uint64_t v11 = 0;
      uint64_t v31 = v8;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
        uint64_t v13 = [v12 numberOfPickups];
        char v14 = [v12 bundleIdentifier];
        if (v13 >= 1 && ([v5 containsObject:v14] & 1) == 0)
        {
          float v15 = (float)v13;
          id v16 = (id)objc_msgSend(objc_alloc(*(Class *)(v10 + 2976)), "initWithIdentifier:usageTrusted:", v14, objc_msgSend(v12, "usageTrusted"));
          id v17 = v4;
          v18 = [v17 objectForKeyedSubscript:v16];
          if (v18)
          {
            id v19 = v18;
            [(STUsageDetailItem *)v18 quantity];
            *(float *)&double v21 = v20 + v15;
            [(STUsageDetailItem *)v19 setQuantity:v21];
          }
          else
          {
            float v22 = [STUsageDetailItem alloc];
            [v16 identifier];
            uint64_t v23 = v9;
            v24 = v5;
            id v25 = v6;
            v27 = double v26 = v4;
            id v19 = -[STUsageDetailItem initWithType:identifier:usageTrusted:](v22, "initWithType:identifier:usageTrusted:", 1, v27, [v16 usageTrusted]);

            v4 = v26;
            id v6 = v25;
            v5 = v24;
            uint64_t v9 = v23;
            unint64_t v10 = 0x1E6BC6000;
            *(float *)&double v28 = v15;
            [(STUsageDetailItem *)v19 setQuantity:v28];
            [v17 setObject:v19 forKeyedSubscript:v16];
          }

          uint64_t v8 = v31;
        }

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v8);
  }

  v29 = [v4 allValues];

  return v29;
}

@end