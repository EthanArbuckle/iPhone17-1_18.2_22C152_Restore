@interface ICQCloudStorageSummary(ICQUI)
- (id)icqui_AAUIiCloudMediaUsageInfo;
@end

@implementation ICQCloudStorageSummary(ICQUI)

- (id)icqui_AAUIiCloudMediaUsageInfo
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = objc_msgSend(a1, "mediaStorage", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v9 = [MEMORY[0x263F82DA0] currentTraitCollection];
        if ([v9 userInterfaceStyle] == 2)
        {
          v10 = [v8 displayColorDark];

          if (v10)
          {
            v11 = (void *)MEMORY[0x263F825C8];
            uint64_t v12 = [v8 displayColorDark];
            goto LABEL_11;
          }
        }
        else
        {
        }
        v11 = (void *)MEMORY[0x263F825C8];
        uint64_t v12 = [v8 displayColor];
LABEL_11:
        v13 = (void *)v12;
        v14 = objc_msgSend(v11, "icqui_colorWithHexString:", v12);

        id v15 = objc_alloc(MEMORY[0x263F25D78]);
        v16 = [v8 mediaType];
        v17 = [v8 storageUsed];
        [v17 floatValue];
        v18 = objc_msgSend(v15, "initWithMediaType:representativeColor:bytesUsed:", v16, v14);

        v19 = [v8 displayLabel];
        [v18 setDisplayLabel:v19];

        [v2 addObject:v18];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }

  v20 = (void *)[v2 copy];
  return v20;
}

@end