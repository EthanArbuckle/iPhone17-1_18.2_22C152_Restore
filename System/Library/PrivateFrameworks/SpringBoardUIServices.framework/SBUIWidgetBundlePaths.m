@interface SBUIWidgetBundlePaths
@end

@implementation SBUIWidgetBundlePaths

void ___SBUIWidgetBundlePaths_block_invoke()
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA48] array];
  v35 = MEMORY[0x1AD0CEBF0]();
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    id v33 = *(id *)v49;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(id *)v49 != v33) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if ([v4 length])
        {
          v5 = [v4 stringByAppendingPathComponent:@"WeeAppPlugins"];
          v6 = [v35 stringByAppendingPathComponent:v5];

          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v7 = [MEMORY[0x1E4F28CB8] defaultManager];
          v8 = [v7 contentsOfDirectoryAtPath:v6 error:0];

          uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v54 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v45 != v11) {
                  objc_enumerationMutation(v8);
                }
                v13 = *(void **)(*((void *)&v44 + 1) + 8 * j);
                if ([v13 length])
                {
                  v14 = [v6 stringByAppendingPathComponent:v13];
                  [v0 addObject:v14];
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v54 count:16];
            }
            while (v10);
          }
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v2);
  }
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 2uLL, 1);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v34 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v34);
        }
        v19 = *(void **)(*((void *)&v40 + 1) + 8 * k);
        if ([v19 length])
        {
          v20 = [v19 stringByAppendingPathComponent:@"WeeAppPlugins"];
          v21 = [@"/AppleInternal" stringByAppendingPathComponent:v20];
          v22 = [v35 stringByAppendingPathComponent:v21];

          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          v23 = [MEMORY[0x1E4F28CB8] defaultManager];
          v24 = [v23 contentsOfDirectoryAtPath:v22 error:0];

          uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v52 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v37;
            do
            {
              for (uint64_t m = 0; m != v26; ++m)
              {
                if (*(void *)v37 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v36 + 1) + 8 * m);
                if ([v29 length])
                {
                  v30 = [v22 stringByAppendingPathComponent:v29];
                  [v0 addObject:v30];
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v52 count:16];
            }
            while (v26);
          }
        }
      }
      uint64_t v16 = [v34 countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v16);
  }
  v31 = (void *)_SBUIWidgetBundlePaths___widgetBundlePaths;
  _SBUIWidgetBundlePaths___widgetBundlePaths = (uint64_t)v0;
}

@end