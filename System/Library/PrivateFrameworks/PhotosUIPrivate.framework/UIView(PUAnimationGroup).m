@interface UIView(PUAnimationGroup)
+ (void)_pu_animateViews:()PUAnimationGroup withAnimationBlock:completionHandler:;
+ (void)pu_animateViews:()PUAnimationGroup usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:;
+ (void)pu_animateViews:()PUAnimationGroup usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:;
+ (void)pu_animateViews:()PUAnimationGroup withDuration:delay:options:animations:completion:;
+ (void)pu_animateViews:()PUAnimationGroup withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:;
- (id)_pu_animationDictionary;
@end

@implementation UIView(PUAnimationGroup)

- (id)_pu_animationDictionary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v1 = [a1 layer];
  v2 = [v1 animationKeys];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v1, "animationForKey:", v9, (void)v12);
        [v3 setObject:v10 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (void)_pu_animateViews:()PUAnimationGroup withAnimationBlock:completionHandler:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v43 = a5;
  if (![v9 count])
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, a1, @"PUAnimationGroup.m", 240, @"Invalid parameter not satisfying: %@", @"[views count] > 0" object file lineNumber description];
  }
  v44 = (void (**)(void, void))v10;
  if (!v10)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, a1, @"PUAnimationGroup.m", 241, @"Invalid parameter not satisfying: %@", @"animationBlock != NULL" object file lineNumber description];
  }
  v11 = [v9 firstObject];
  uint64_t v12 = [v11 layer];

  v42 = (void *)v12;
  v41 = [[PULayerAnimationGroup alloc] initWithReferenceLayer:v12];
  +[PUAnimationGroup pushAnimationGroup:](PUAnimationGroup, "pushAnimationGroup:");
  v51 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v9;
  uint64_t v49 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
  if (v49)
  {
    uint64_t v47 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v71 != v47) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        long long v15 = [v14 layer];
        v16 = [v15 animationKeys];
        if ([v16 count])
        {
          v52 = v14;
          uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v18 = v16;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v66 objects:v76 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v67;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v67 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v66 + 1) + 8 * j);
                v24 = [v15 animationForKey:v23];
                if (v24) {
                  [v17 setObject:v24 forKeyedSubscript:v23];
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v66 objects:v76 count:16];
            }
            while (v20);
          }

          [v51 setObject:v17 forKey:v52];
        }
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v70 objects:v77 count:16];
    }
    while (v49);
  }

  if (v43)
  {
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __82__UIView_PUAnimationGroup___pu_animateViews_withAnimationBlock_completionHandler___block_invoke;
    v64[3] = &unk_1E5F2EBA0;
    id v65 = v43;
    [(PUAnimationGroup *)v41 setCompletionHandler:v64];
  }
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __82__UIView_PUAnimationGroup___pu_animateViews_withAnimationBlock_completionHandler___block_invoke_2;
  v62[3] = &unk_1E5F2CEE8;
  v25 = v41;
  v63 = v25;
  ((void (**)(void, void *))v44)[2](v44, v62);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obja = obj;
  uint64_t v50 = [obja countByEnumeratingWithState:&v58 objects:v75 count:16];
  if (v50)
  {
    uint64_t v48 = *(void *)v59;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v59 != v48) {
          objc_enumerationMutation(obja);
        }
        uint64_t v53 = v26;
        v27 = *(void **)(*((void *)&v58 + 1) + 8 * v26);
        v28 = [v27 layer];
        v29 = [v51 objectForKey:v27];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        v30 = [v28 animationKeys];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v54 objects:v74 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v55;
          do
          {
            for (uint64_t k = 0; k != v32; ++k)
            {
              if (*(void *)v55 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v54 + 1) + 8 * k);
              v36 = [v29 objectForKeyedSubscript:v35];
              v37 = [v28 animationForKey:v35];
              if (v37 != v36)
              {
                v38 = [[PULayerAnimation alloc] initWithLayer:v28 key:v35];
                [(PUAnimationGroup *)v25 addSubAnimationGroup:v38];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v54 objects:v74 count:16];
          }
          while (v32);
        }

        uint64_t v26 = v53 + 1;
      }
      while (v53 + 1 != v50);
      uint64_t v50 = [obja countByEnumeratingWithState:&v58 objects:v75 count:16];
    }
    while (v50);
  }

  +[PUAnimationGroup popAnimationGroup:v25];
}

+ (void)pu_animateViews:()PUAnimationGroup usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:
{
  id v22 = a11;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __143__UIView_PUAnimationGroup__pu_animateViews_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_animations_completion___block_invoke;
  v24[3] = &unk_1E5F23590;
  double v26 = a2;
  double v27 = a3;
  uint64_t v28 = a10;
  double v29 = a4;
  double v30 = a5;
  double v31 = a6;
  double v32 = a7;
  id v25 = v22;
  id v23 = v22;
  objc_msgSend(a1, "_pu_animateViews:withAnimationBlock:completionHandler:", a9, v24, a12);
}

+ (void)pu_animateViews:()PUAnimationGroup usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:
{
  id v14 = a7;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __130__UIView_PUAnimationGroup__pu_animateViews_usingDefaultDampedSpringWithDelay_initialSpringVelocity_options_animations_completion___block_invoke;
  v16[3] = &unk_1E5F23540;
  double v18 = a2;
  double v19 = a3;
  uint64_t v20 = a6;
  id v17 = v14;
  id v15 = v14;
  objc_msgSend(a1, "_pu_animateViews:withAnimationBlock:completionHandler:", a5, v16, a8);
}

+ (void)pu_animateViews:()PUAnimationGroup withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:
{
  id v18 = a9;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __138__UIView_PUAnimationGroup__pu_animateViews_withDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion___block_invoke;
  v20[3] = &unk_1E5F23568;
  double v22 = a2;
  double v23 = a3;
  double v24 = a4;
  double v25 = a5;
  uint64_t v26 = a8;
  id v21 = v18;
  id v19 = v18;
  objc_msgSend(a1, "_pu_animateViews:withAnimationBlock:completionHandler:", a7, v20, a10);
}

+ (void)pu_animateViews:()PUAnimationGroup withDuration:delay:options:animations:completion:
{
  id v14 = a7;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__UIView_PUAnimationGroup__pu_animateViews_withDuration_delay_options_animations_completion___block_invoke;
  v16[3] = &unk_1E5F23540;
  double v18 = a2;
  double v19 = a3;
  uint64_t v20 = a6;
  id v17 = v14;
  id v15 = v14;
  objc_msgSend(a1, "_pu_animateViews:withAnimationBlock:completionHandler:", a5, v16, a8);
}

@end