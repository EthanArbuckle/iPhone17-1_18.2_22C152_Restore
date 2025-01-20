@interface UIView(NAUIAutolayoutDebugging)
+ (void)_naui_beginDebuggingAutolayout;
- (id)naui_descendantsWithAmbiguousLayout;
@end

@implementation UIView(NAUIAutolayoutDebugging)

+ (void)_naui_beginDebuggingAutolayout
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"NAUIDebugAutolayout"];

  if (v3)
  {
    _showAutolayoutIssues = 1;
    _logsAutolayoutIssues = 1;
  }
  else
  {
    v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    _showAutolayoutIssues = [v4 BOOLForKey:@"NAUIDebugAutolayout_Visualize"];

    v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    _logsAutolayoutIssues = [v5 BOOLForKey:@"NAUIDebugAutolayout_EnableLogs"];

    if (!(_showAutolayoutIssues | _logsAutolayoutIssues)) {
      return;
    }
  }
  dispatch_time_t v6 = dispatch_time(0, 1500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__UIView_NAUIAutolayoutDebugging___naui_beginDebuggingAutolayout__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
  v7 = [MEMORY[0x263F1CBC8] _applicationKeyWindow];
  if ([v7 hasAmbiguousLayout])
  {
    v18 = v7;
    objc_msgSend(v7, "naui_descendantsWithAmbiguousLayout");
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
          NSClassFromString(&cfstr_Uilayoutguide.isa);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v22 = 0u;
            long long v23 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            v13 = [v12 _layoutVariablesWithAmbiguousValue];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v29 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v21;
              do
              {
                uint64_t v17 = 0;
                do
                {
                  if (*(void *)v21 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  +[_NAUIAmbigousLayoutView installOnView:v12 forVariable:*(void *)(*((void *)&v20 + 1) + 8 * v17++)];
                }
                while (v15 != v17);
                uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v29 count:16];
              }
              while (v15);
            }
          }
          ++v11;
        }
        while (v11 != v9);
        uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v9);
    }

    v7 = v18;
  }
}

- (id)naui_descendantsWithAmbiguousLayout
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v3 = objc_msgSend(a1, "subviews", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "naui_descendantsWithAmbiguousLayout");
        if ([v9 count]) {
          [v2 addObjectsFromArray:v9];
        }
        if ([v8 hasAmbiguousLayout]) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  if ([v2 count]) {
    uint64_t v10 = v2;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  return v11;
}

@end