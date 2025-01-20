@interface UINavigationBar(Bridge)
+ (uint64_t)ts_chromelessBarsEnabled;
- (TUNavigationBarCompressibleTitleView)ts_fetchCompressibleTitleView;
- (id)fetchCustomTitleViewInView:()Bridge;
- (id)fetchRegularTitleViewInView:()Bridge;
- (id)ts_barButtonViews;
- (id)ts_contentView;
- (id)ts_fetchTitleView;
- (void)syncBarButtonItems:()Bridge;
- (void)ts_resetButtonTransforms;
- (void)ts_setBlurthroughBackground;
@end

@implementation UINavigationBar(Bridge)

+ (uint64_t)ts_chromelessBarsEnabled
{
  return MEMORY[0x1F40C9FB0]("UIKit", "ui_consistency");
}

- (void)syncBarButtonItems:()Bridge
{
  id v4 = a3;
  objc_initWeak(&location, a1);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__UINavigationBar_Bridge__syncBarButtonItems___block_invoke;
  v6[3] = &unk_1E6136850;
  objc_copyWeak(&v9, &location);
  id v7 = v4;
  v8 = a1;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (TUNavigationBarCompressibleTitleView)ts_fetchCompressibleTitleView
{
  v2 = objc_msgSend(a1, "ts_contentView");
  v3 = [a1 fetchCustomTitleViewInView:v2];
  if (v3)
  {
    id v4 = [[TUNavigationBarCompressibleTitleView alloc] initWithCustomTitleView:v3];
  }
  else
  {
    id v5 = [a1 fetchRegularTitleViewInView:v2];
    if (v5) {
      id v4 = [[TUNavigationBarCompressibleTitleView alloc] initWithRegularTitleView:v5];
    }
    else {
      id v4 = 0;
    }
  }
  return v4;
}

- (id)fetchCustomTitleViewInView:()Bridge
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1F0F6AE08])
  {
    id v5 = v4;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = objc_msgSend(v4, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [a1 fetchCustomTitleViewInView:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          if (v11)
          {
            id v5 = (id)v11;

            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v5 = 0;
  }
LABEL_13:

  return v5;
}

- (id)ts_contentView
{
  v2 = [a1 subviews];
  uint64_t v3 = [v2 indexOfObjectPassingTest:&__block_literal_global_2];

  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [a1 subviews];
    id v4 = [v5 objectAtIndex:v3];
  }
  return v4;
}

- (void)ts_setBlurthroughBackground
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4FB1EF8], "ts_sideBarEffect");
  v4[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [a1 setBackgroundEffects:v3];
}

- (id)ts_barButtonViews
{
  v2 = objc_opt_new();
  uint64_t v3 = [a1 topItem];
  id v4 = [v3 rightBarButtonItems];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__UINavigationBar_Bridge__ts_barButtonViews__block_invoke;
  v14[3] = &unk_1E6136800;
  id v5 = v2;
  id v15 = v5;
  [v4 enumerateObjectsUsingBlock:v14];

  v6 = [a1 topItem];
  uint64_t v7 = [v6 leftBarButtonItems];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__UINavigationBar_Bridge__ts_barButtonViews__block_invoke_2;
  v12[3] = &unk_1E6136800;
  id v8 = v5;
  id v13 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

- (void)ts_resetButtonTransforms
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v1 = objc_msgSend(a1, "ts_barButtonViews");
  uint64_t v2 = [v1 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v19;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v12 = *MEMORY[0x1E4F39B10];
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "setContentAlpha:", 1.0, v9, v10, v11, v12, v13, v14, v15, v16);
        uint64_t v7 = [v6 view];
        id v8 = [v7 layer];
        v17[4] = v16;
        v17[5] = v15;
        v17[6] = v14;
        v17[7] = v13;
        v17[0] = v12;
        v17[1] = v11;
        v17[2] = v10;
        v17[3] = v9;
        [v8 setTransform:v17];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v3);
  }
}

- (id)ts_fetchTitleView
{
  v1 = objc_msgSend(a1, "ts_fetchCompressibleTitleView");
  uint64_t v2 = [v1 view];

  return v2;
}

- (id)fetchRegularTitleViewInView:()Bridge
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = objc_msgSend(v4, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [a1 fetchRegularTitleViewInView:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          if (v11)
          {
            id v5 = (id)v11;

            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v5 = 0;
  }
LABEL_13:

  return v5;
}

@end