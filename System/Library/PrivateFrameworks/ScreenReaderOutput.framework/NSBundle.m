@interface NSBundle
@end

@implementation NSBundle

void __50__NSBundle_SCROBundleExtras__brailleDriverBundles__block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [@"/System/Library/ScreenReader" stringByAppendingPathComponent:@"BrailleDrivers"];
  [v2 addObject:v3];

  v34 = v2;
  v4 = [v2 reverseObjectEnumerator];
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  v37 = [MEMORY[0x263EFF980] array];
  v35 = v4;
  uint64_t v6 = [v4 nextObject];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = @"brailledriver";
    do
    {
      v9 = [MEMORY[0x263F08850] defaultManager];
      id v44 = 0;
      v10 = [v9 contentsOfDirectoryAtPath:v7 error:&v44];
      id v36 = v44;

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v11 = v10;
      uint64_t v39 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v39)
      {
        uint64_t v12 = *(void *)v41;
        uint64_t v38 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v41 != v12) {
              objc_enumerationMutation(v11);
            }
            v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            v15 = [v14 pathExtension];
            int v16 = [v15 isEqualToString:v8];

            if (v16)
            {
              v17 = *(void **)(a1 + 32);
              v18 = [v7 stringByAppendingPathComponent:v14];
              v19 = [v17 bundleWithPath:v18];

              v20 = [v19 bundleIdentifier];
              if ([v20 length])
              {
                v21 = [v5 objectForKey:v20];
                v22 = v21;
                if (v21)
                {
                  [v21 bundlePath];
                  id v23 = v11;
                  v24 = v8;
                  v25 = v7;
                  uint64_t v26 = a1;
                  v28 = v27 = v5;
                  NSLog(&cfstr_DuplicateBrail.isa, v28);

                  v5 = v27;
                  a1 = v26;
                  v7 = v25;
                  v8 = v24;
                  id v11 = v23;
                  uint64_t v12 = v38;
                }
                else
                {
                  [v5 setObject:v19 forKey:v20];
                  [v37 addObject:v19];
                }
              }
            }
          }
          uint64_t v39 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v39);
      }

      uint64_t v29 = [v35 nextObject];

      v7 = (void *)v29;
    }
    while (v29);
  }
  uint64_t v30 = [objc_alloc(NSDictionary) initWithDictionary:v5];
  v31 = (void *)_DriverBundleDictionary;
  _DriverBundleDictionary = v30;

  uint64_t v32 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v37];
  v33 = (void *)_DriverBundleArray;
  _DriverBundleArray = v32;
}

void __50__NSBundle_SCROBundleExtras___brailleTableBundles__block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  v3 = [@"/System/Library/ScreenReader" stringByAppendingPathComponent:@"BrailleTables"];
  [v2 addObject:v3];

  uint64_t v32 = v2;
  v4 = [v2 reverseObjectEnumerator];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  v33 = v4;
  uint64_t v6 = [v4 nextObject];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = @"brailletable";
    do
    {
      v9 = [MEMORY[0x263F08850] defaultManager];
      id v42 = 0;
      v10 = [v9 contentsOfDirectoryAtPath:v7 error:&v42];
      id v34 = v42;

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v11 = v10;
      uint64_t v37 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v37)
      {
        uint64_t v12 = *(void *)v39;
        uint64_t v36 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v39 != v12) {
              objc_enumerationMutation(v11);
            }
            v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            v15 = [v14 pathExtension];
            int v16 = [v15 isEqualToString:v8];

            if (v16)
            {
              v17 = *(void **)(a1 + 32);
              v18 = [v7 stringByAppendingPathComponent:v14];
              v19 = [v17 bundleWithPath:v18];

              v20 = [v19 bundleIdentifier];
              if ([v20 length])
              {
                v21 = [v5 objectForKey:v20];
                v22 = v21;
                if (v21)
                {
                  [v21 bundlePath];
                  id v23 = v11;
                  v24 = v8;
                  v25 = v7;
                  id v26 = v5;
                  v28 = uint64_t v27 = a1;
                  NSLog(&cfstr_DuplicateBrail_0.isa, v28);

                  a1 = v27;
                  id v5 = v26;
                  v7 = v25;
                  v8 = v24;
                  id v11 = v23;
                  uint64_t v12 = v36;
                }
                else
                {
                  [v5 setObject:v19 forKey:v20];
                  [v35 addObject:v19];
                }
              }
            }
          }
          uint64_t v37 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v37);
      }

      uint64_t v29 = [v33 nextObject];

      v7 = (void *)v29;
    }
    while (v29);
  }
  uint64_t v30 = [v35 copy];
  v31 = (void *)_TableBundleArray;
  _TableBundleArray = v30;
}

@end