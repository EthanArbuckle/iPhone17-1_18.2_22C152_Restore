@interface NSArray(WebPrivacyExtras)
- (id)_wp_arrayByRemovingTrackingInformationFromURLs;
- (void)_wp_removeTrackingInformationFromURLs:()WebPrivacyExtras;
@end

@implementation NSArray(WebPrivacyExtras)

- (id)_wp_arrayByRemovingTrackingInformationFromURLs
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)[a1 mutableCopy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(*((void *)&v12 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v8)
          {
            objc_msgSend(v8, "_wp_urlByRemovingTrackingInformation");
            id v9 = (id)objc_claimAutoreleasedReturnValue();
            if (v9) {
              [v2 setObject:v9 atIndexedSubscript:v5 + v7];
            }
            goto LABEL_15;
          }
        }
        else
        {
        }
        id v9 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v8 = 0;
LABEL_15:

          goto LABEL_16;
        }
        if (v9)
        {
          objc_msgSend(v9, "_wp_removeTrackingInformationFromURLRepresentation", (void)v12);
          id v8 = v9;
        }
        else
        {
          id v8 = 0;
        }
LABEL_16:

        ++v7;
      }
      while (v4 != v7);
      uint64_t v10 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v4 = v10;
      v5 += v7;
    }
    while (v10);
  }

  return v2;
}

- (void)_wp_removeTrackingInformationFromURLs:()WebPrivacyExtras
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v16 = a3;
  uint64_t v17 = (void *)[a1 mutableCopy];
  group = dispatch_group_create();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v26 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v9)
          {
            dispatch_group_enter(group);
            v22[0] = MEMORY[0x263EF8330];
            v22[1] = 3321888768;
            v22[2] = __67__NSArray_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke;
            v22[3] = &__block_descriptor_56_ea8_32c80_ZTSKZ67__NSArray_WebPrivacyExtras___wp_removeTrackingInformationFromURLs__E3__2_e15_v16__0__NSURL_8l;
            uint64_t v10 = group;
            id v11 = v17;
            v23 = v10;
            id v24 = v11;
            uint64_t v25 = v6 + v8;
            [v9 _wp_removeTrackingInformation:v22];

            long long v12 = v23;
LABEL_14:

            goto LABEL_15;
          }
        }
        else
        {
        }
        long long v12 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v9 = 0;
          goto LABEL_14;
        }
        if (v12)
        {
          [v12 _wp_removeTrackingInformationFromURLRepresentation];
          id v9 = v12;
        }
        else
        {
          id v9 = 0;
        }
LABEL_15:

        ++v8;
      }
      while (v5 != v8);
      uint64_t v13 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
      uint64_t v5 = v13;
      v6 += v8;
    }
    while (v13);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NSArray_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke_18;
  block[3] = &unk_265586020;
  id v20 = v17;
  id v21 = v16;
  id v14 = v17;
  id v15 = v16;
  dispatch_group_notify(group, MEMORY[0x263EF83A0], block);
}

@end