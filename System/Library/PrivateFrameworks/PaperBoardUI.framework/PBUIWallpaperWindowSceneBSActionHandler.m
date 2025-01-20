@interface PBUIWallpaperWindowSceneBSActionHandler
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
@end

@implementation PBUIWallpaperWindowSceneBSActionHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = (void *)[v7 mutableCopy];
  uint64_t v10 = objc_opt_class();
  id v11 = v8;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v22 = v11;
    id v23 = v7;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v15) {
      goto LABEL_25;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    while (1)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = v19;
          [v13 _handleUpdateLocationsAction:v20];
          [v9 removeObject:v20];

          continue;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v13 _handleUpdateAndPrewarmAction:v19];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v13 _handlePreheatAction:v19];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v13 _handleImageSlotRequestAction:v19];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                continue;
              }
              [v13 _handleWallpaperEffectImageRequestAction:v19];
            }
          }
        }
        objc_msgSend(v9, "removeObject:", v19, v22, v23, (void)v24);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v16)
      {
LABEL_25:

        id v11 = v22;
        id v7 = v23;
        break;
      }
    }
  }

  return v9;
}

@end