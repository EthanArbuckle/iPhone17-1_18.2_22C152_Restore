@interface SBIconDragUndoLayoutDelegate
- (NSMapTable)destinationIconScreenLocations;
- (NSMapTable)originalIconScreenLocations;
- (NSSet)iconsAtHigherZLevel;
- (SBHIconEditingSettings)iconEditingSettings;
- (SBIconDragUndoLayoutDelegate)initWithOriginalIconScreenLocations:(id)a3 destinationIconScreenLocations:(id)a4 iconsAtHigherZLevel:(id)a5;
- (SBIconDragUndoLayoutDelegate)initWithPreModificationInfo:(id)a3;
- (SBIconListLayoutAnimating)defaultRemovalAnimator;
- (id)iconListView:(id)a3 animatorForLayingOutIconView:(id)a4 proposedAnimator:(id)a5;
- (id)iconListView:(id)a3 animatorForRemovingIcons:(id)a4 proposedAnimator:(id)a5;
- (void)animateWithOptions:(unint64_t)a3 animations:(id)a4 completion:(id)a5;
- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6;
- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5;
- (void)setDefaultRemovalAnimator:(id)a3;
@end

@implementation SBIconDragUndoLayoutDelegate

- (SBIconDragUndoLayoutDelegate)initWithPreModificationInfo:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v31 = [v3 rootFolderController];
  v42 = [v31 dockListView];
  v4 = [v3 visibleListViews];
  v35 = [v3 originalIconsPerListView];
  v33 = v3;
  v41 = [v3 originalScreenLocationsPerIcon];
  v40 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v39 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v4;
  uint64_t v36 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v58;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v58 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v5;
        v6 = *(void **)(*((void *)&v57 + 1) + 8 * v5);
        v7 = [v35 objectForKey:v6];
        v8 = [v6 icons];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v47 = v7;
        uint64_t v9 = [v47 countByEnumeratingWithState:&v53 objects:v62 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v54;
          uint64_t v44 = *(void *)v54;
          v45 = v8;
          do
          {
            uint64_t v12 = 0;
            uint64_t v46 = v10;
            do
            {
              if (*(void *)v54 != v11) {
                objc_enumerationMutation(v47);
              }
              uint64_t v13 = *(void *)(*((void *)&v53 + 1) + 8 * v12);
              if (([v8 containsObject:v13] & 1) == 0)
              {
                long long v51 = 0u;
                long long v52 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                id v14 = obj;
                uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v61 count:16];
                if (v15)
                {
                  uint64_t v16 = v15;
                  uint64_t v17 = *(void *)v50;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v16; ++i)
                    {
                      if (*(void *)v50 != v17) {
                        objc_enumerationMutation(v14);
                      }
                      v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                      if (v19 != v6)
                      {
                        v20 = [*(id *)(*((void *)&v49 + 1) + 8 * i) model];
                        int v21 = [v20 directlyContainsIcon:v13];

                        if (v21)
                        {
                          v22 = [v41 objectForKey:v13];
                          [v40 setObject:v22 forKey:v13];
                          [v19 centerForIcon:v13];
                          objc_msgSend(v19, "convertPoint:toView:", 0);
                          v48[0] = v23;
                          v48[1] = v24;
                          v25 = [MEMORY[0x1E4F29238] valueWithBytes:v48 objCType:"{CGPoint=dd}"];
                          [v39 setObject:v25 forKey:v13];

                          if (v19 == v42) {
                            [v38 addObject:v13];
                          }

                          goto LABEL_25;
                        }
                      }
                    }
                    uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v61 count:16];
                    if (v16) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_25:

                uint64_t v11 = v44;
                v8 = v45;
                uint64_t v10 = v46;
              }
              ++v12;
            }
            while (v12 != v10);
            uint64_t v10 = [v47 countByEnumeratingWithState:&v53 objects:v62 count:16];
          }
          while (v10);
        }

        uint64_t v5 = v37 + 1;
      }
      while (v37 + 1 != v36);
      uint64_t v36 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v36);
  }

  if ([v40 count])
  {
    v27 = v38;
    v26 = v39;
    v28 = [(SBIconDragUndoLayoutDelegate *)self initWithOriginalIconScreenLocations:v40 destinationIconScreenLocations:v39 iconsAtHigherZLevel:v38];
    v29 = v28;
  }
  else
  {
    v29 = 0;
    v28 = self;
    v27 = v38;
    v26 = v39;
  }

  return v29;
}

- (SBIconDragUndoLayoutDelegate)initWithOriginalIconScreenLocations:(id)a3 destinationIconScreenLocations:(id)a4 iconsAtHigherZLevel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBIconDragUndoLayoutDelegate;
  uint64_t v11 = [(SBIconDragUndoLayoutDelegate *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    originalIconScreenLocations = v11->_originalIconScreenLocations;
    v11->_originalIconScreenLocations = (NSMapTable *)v12;

    uint64_t v14 = [v9 copy];
    destinationIconScreenLocations = v11->_destinationIconScreenLocations;
    v11->_destinationIconScreenLocations = (NSMapTable *)v14;

    uint64_t v16 = [v10 copy];
    iconsAtHigherZLevel = v11->_iconsAtHigherZLevel;
    v11->_iconsAtHigherZLevel = (NSSet *)v16;

    v18 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v19 = [v18 iconEditingSettings];
    iconEditingSettings = v11->_iconEditingSettings;
    v11->_iconEditingSettings = (SBHIconEditingSettings *)v19;
  }
  return v11;
}

- (id)iconListView:(id)a3 animatorForLayingOutIconView:(id)a4 proposedAnimator:(id)a5
{
  v7 = (SBIconDragUndoLayoutDelegate *)a5;
  id v8 = [a4 icon];
  id v9 = [(NSMapTable *)self->_originalIconScreenLocations objectForKey:v8];

  if (v9) {
    id v10 = self;
  }
  else {
    id v10 = v7;
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)iconListView:(id)a3 animatorForRemovingIcons:(id)a4 proposedAnimator:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = -[NSMapTable objectForKey:](self->_originalIconScreenLocations, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);

        if (v14)
        {
          uint64_t v15 = self;

          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = (SBIconDragUndoLayoutDelegate *)v8;
LABEL_11:

  return v15;
}

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v11 icon];
  uint64_t v14 = [(SBIconDragUndoLayoutDelegate *)self iconsAtHigherZLevel];
  char v15 = [v14 containsObject:v13];

  if (v15)
  {
    uint64_t v16 = [(NSMapTable *)self->_originalIconScreenLocations objectForKey:v13];
    [v16 CGPointValue];
    objc_msgSend(v10, "convertPoint:fromView:", 0);
    objc_msgSend(v11, "setCenter:");
    [v11 setHidden:0];
    [v11 setAlpha:1.0];
    unint64_t var7 = a5->var7;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __115__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
    v24[3] = &unk_1E6AAFF90;
    id v25 = v11;
    long long v18 = *(_OWORD *)&a5->var2.continuousCornerRadius;
    long long v29 = *(_OWORD *)&a5->var2.size.height;
    long long v30 = v18;
    long long v19 = *(_OWORD *)&a5->var5;
    SBIconCoordinate var4 = a5->var4;
    long long v32 = v19;
    long long v20 = *(_OWORD *)&a5->var1;
    CGPoint var0 = a5->var0;
    long long v28 = v20;
    id v26 = v12;
    [(SBIconDragUndoLayoutDelegate *)self animateWithOptions:var7 animations:v24 completion:0];
  }
  else
  {
    iconViewsHiddenForRemovalAnimation = self->_iconViewsHiddenForRemovalAnimation;
    if (!iconViewsHiddenForRemovalAnimation)
    {
      uint64_t v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v23 = self->_iconViewsHiddenForRemovalAnimation;
      self->_iconViewsHiddenForRemovalAnimation = v22;

      iconViewsHiddenForRemovalAnimation = self->_iconViewsHiddenForRemovalAnimation;
    }
    [(NSMutableArray *)iconViewsHiddenForRemovalAnimation addObject:v11];
    [v11 setHidden:1];
  }
}

uint64_t __115__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  [*(id *)(a1 + 32) setIconContentScale:*(double *)(a1 + 64)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v8 = a4;
  id v9 = a5;
  group = dispatch_group_create();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
  id v12 = &off_1D81E4000;
  if (v11)
  {
    uint64_t v13 = v11;
    id v29 = v9;
    id v14 = 0;
    uint64_t v15 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v10);
        }
        long long v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        long long v18 = [v17 icon];
        long long v19 = [(NSMapTable *)self->_originalIconScreenLocations objectForKey:v18];

        if (v19)
        {
          long long v20 = [(SBIconDragUndoLayoutDelegate *)self iconsAtHigherZLevel];
          char v21 = [v20 containsObject:v18];

          if (v21)
          {
            [v17 setHidden:1];
          }
          else
          {
            uint64_t v22 = [(NSMapTable *)self->_destinationIconScreenLocations objectForKey:v18];
            [v22 CGPointValue];
            objc_msgSend(v31, "convertPoint:fromView:", 0);
            uint64_t v24 = v23;
            uint64_t v26 = v25;
            dispatch_group_enter(group);
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke;
            v38[3] = &unk_1E6AAFD70;
            v38[4] = v17;
            v38[5] = v24;
            v38[6] = v26;
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_2;
            v36[3] = &unk_1E6AACF80;
            v36[4] = v17;
            uint64_t v37 = group;
            [(SBIconDragUndoLayoutDelegate *)self animateWithOptions:0 animations:v38 completion:v36];
          }
        }
        else
        {
          if (!v14) {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v14 addObject:v17];
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v13);

    if (!v14)
    {
      id v9 = v29;
      id v12 = &off_1D81E4000;
      goto LABEL_20;
    }
    dispatch_group_enter(group);
    v27 = [(SBIconDragUndoLayoutDelegate *)self defaultRemovalAnimator];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_3;
    v34[3] = &unk_1E6AAC810;
    v35 = group;
    [v27 iconListView:v31 wantsAnimatedRemovalForIconViews:v14 completionHandler:v34];

    id v9 = v29;
    id v12 = &off_1D81E4000;
  }
  else
  {
    id v14 = 0;
    v27 = v10;
  }

LABEL_20:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *((void *)v12 + 360);
  block[2] = __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_4;
  block[3] = &unk_1E6AAC8E8;
  block[4] = self;
  id v33 = v9;
  id v28 = v9;
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);
}

uint64_t __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_2(uint64_t a1)
{
}

void __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_3(uint64_t a1)
{
}

uint64_t __96__SBIconDragUndoLayoutDelegate_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "setHidden:", 0, (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)animateWithOptions:(unint64_t)a3 animations:(id)a4 completion:(id)a5
{
  id v8 = a4;
  iconEditingSettings = self->_iconEditingSettings;
  id v10 = a5;
  [(SBHIconEditingSettings *)iconEditingSettings defaultSpringDuration];
  double v12 = v11;
  [(SBHIconEditingSettings *)self->_iconEditingSettings defaultSpringDampingRatio];
  double v14 = v13;
  uint64_t v15 = (void *)MEMORY[0x1E4FB1EB0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__SBIconDragUndoLayoutDelegate_animateWithOptions_animations_completion___block_invoke;
  v17[3] = &unk_1E6AAD4C8;
  id v18 = v8;
  id v16 = v8;
  [v15 animateWithDuration:a3 delay:v17 usingSpringWithDamping:v10 initialSpringVelocity:v12 options:0.0 animations:v14 completion:0.0];
}

void __73__SBIconDragUndoLayoutDelegate_animateWithOptions_animations_completion___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v11.minimum;
  float maximum = v11.maximum;
  float preferred = v11.preferred;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SBIconDragUndoLayoutDelegate_animateWithOptions_animations_completion___block_invoke_2;
  v9[3] = &unk_1E6AAD4C8;
  id v10 = *(id *)(a1 + 32);
  *(float *)&double v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114131, v9, v6, v7, v8);
}

uint64_t __73__SBIconDragUndoLayoutDelegate_animateWithOptions_animations_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSMapTable)originalIconScreenLocations
{
  return self->_originalIconScreenLocations;
}

- (NSMapTable)destinationIconScreenLocations
{
  return self->_destinationIconScreenLocations;
}

- (NSSet)iconsAtHigherZLevel
{
  return self->_iconsAtHigherZLevel;
}

- (SBIconListLayoutAnimating)defaultRemovalAnimator
{
  return self->_defaultRemovalAnimator;
}

- (void)setDefaultRemovalAnimator:(id)a3
{
}

- (SBHIconEditingSettings)iconEditingSettings
{
  return self->_iconEditingSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_storeStrong((id *)&self->_defaultRemovalAnimator, 0);
  objc_storeStrong((id *)&self->_iconsAtHigherZLevel, 0);
  objc_storeStrong((id *)&self->_destinationIconScreenLocations, 0);
  objc_storeStrong((id *)&self->_originalIconScreenLocations, 0);
  objc_storeStrong((id *)&self->_iconViewsHiddenForRemovalAnimation, 0);
}

@end