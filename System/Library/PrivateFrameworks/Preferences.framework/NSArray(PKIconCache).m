@interface NSArray(PKIconCache)
+ (void)pk_updateSpecifiers:()PKIconCache withIconsFromCache:;
+ (void)pk_updateSpecifiers:()PKIconCache withIconsFromCache:isInterfaceRTL:;
@end

@implementation NSArray(PKIconCache)

+ (void)pk_updateSpecifiers:()PKIconCache withIconsFromCache:
{
  id v9 = a3;
  id v5 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v6 = [MEMORY[0x1E4F42D90] mainScreen];
    v7 = [v6 traitCollection];
    BOOL v8 = [v7 layoutDirection] == 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E4F1C978], "pk_updateSpecifiers:withIconsFromCache:isInterfaceRTL:", v9, v5, v8);
}

+ (void)pk_updateSpecifiers:()PKIconCache withIconsFromCache:isInterfaceRTL:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v33 = [v9 _calendarDirection];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v36;
    *(void *)&long long v11 = 138412290;
    long long v31 = v11;
    do
    {
      uint64_t v14 = 0;
      uint64_t v32 = v12;
      do
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
        v16 = objc_msgSend(v15, "propertyForKey:", @"iconCache", v31);
        v17 = [v15 propertyForKey:@"iconImageShouldFlipForRightToLeft"];
        int v18 = [v17 BOOLValue];

        v19 = [v15 propertyForKey:@"iconImageShouldFlipForRightToLeftCalendarKey"];
        int v20 = [v19 BOOLValue];

        if (v16)
        {
          if (a5)
          {
            uint64_t v21 = v13;
            id v22 = v8;
            uint64_t v23 = a5;
            v24 = [v15 propertyForKey:@"iconImageShouldLoadAlternateImageForRightToLeftKey"];
            int v25 = [v24 BOOLValue];

            if (v25)
            {
              uint64_t v26 = [@"RTL-" stringByAppendingString:v16];

              v16 = (void *)v26;
            }
            a5 = v23;
            id v8 = v22;
            uint64_t v13 = v21;
            uint64_t v12 = v32;
          }
          v27 = [v8 imageForKey:v16];
          if (v27)
          {
            v28 = v27;
            if (v33 == 1) {
              int v29 = v20;
            }
            else {
              int v29 = 0;
            }
            if ((v18 | v29) == 1)
            {
              uint64_t v30 = [v27 imageFlippedForRightToLeftLayoutDirection];

              v28 = v30;
            }
            [v15 setProperty:v28 forKey:@"iconImage"];
          }
          else
          {
            v28 = _PSLoggingFacility();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v31;
              v40 = v16;
              _os_log_impl(&dword_1A6597000, v28, OS_LOG_TYPE_DEFAULT, "############ Icon for key \"%@\" is missing from the cache.", buf, 0xCu);
            }
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v12);
  }
}

@end