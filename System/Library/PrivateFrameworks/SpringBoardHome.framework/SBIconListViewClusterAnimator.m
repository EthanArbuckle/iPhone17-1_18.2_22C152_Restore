@interface SBIconListViewClusterAnimator
- (SBIconListViewClusterAnimator)init;
- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6;
- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5;
- (void)setRemovalDirection:(unint64_t)a3 forIcon:(id)a4;
@end

@implementation SBIconListViewClusterAnimator

- (SBIconListViewClusterAnimator)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconListViewClusterAnimator;
  v2 = [(SBIconListViewClusterAnimator *)&v7 init];
  if (v2)
  {
    v3 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v4 = [v3 iconEditingSettings];
    iconEditingSettings = v2->_iconEditingSettings;
    v2->_iconEditingSettings = (SBHIconEditingSettings *)v4;
  }
  return v2;
}

- (void)setRemovalDirection:(unint64_t)a3 forIcon:(id)a4
{
  id v11 = a4;
  removalDirectionForIcons = self->_removalDirectionForIcons;
  if (!removalDirectionForIcons)
  {
    objc_super v7 = [MEMORY[0x1E4F1CA60] dictionary];
    v8 = self->_removalDirectionForIcons;
    self->_removalDirectionForIcons = v7;

    removalDirectionForIcons = self->_removalDirectionForIcons;
  }
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  v10 = [v11 uniqueIdentifier];
  [(NSMutableDictionary *)removalDirectionForIcons setObject:v9 forKey:v10];
}

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(SBHIconEditingSettings *)self->_iconEditingSettings defaultSpringDuration];
  double v14 = v13;
  [(SBHIconEditingSettings *)self->_iconEditingSettings defaultSpringDampingRatio];
  double v16 = v15;
  v17 = [v11 icon];
  v18 = [v17 gridSizeClass];
  v19 = v18;
  if (v18 == @"SBHIconGridSizeClassDefault")
  {
    BOOL var6 = a5->var6;

    if (!var6) {
      goto LABEL_73;
    }
  }
  else
  {
    v20 = [v17 gridSizeClass];
    if (([v20 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
    {

      goto LABEL_12;
    }
    BOOL v21 = a5->var6;

    if (!v21) {
      goto LABEL_73;
    }
  }
  int64_t column = a5->var4.column;
  int64_t row = a5->var4.row;
  double x = a5->var0.x;
  double y = a5->var0.y;
  [v11 center];
  double v28 = v27;
  double v30 = v29;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    int64_t v33 = column & 1;
    if (column < 0) {
      int64_t v33 = -v33;
    }
    BOOL v34 = v33 == 1;
    BOOL v35 = (row & 0x8000000000000001) == 1 && v33 == 1;
    BOOL v36 = (row & 0x8000000000000001) == 1 && v33 == 0;
    int64_t v37 = v33 | row & 1;
    BOOL v38 = (row & 1) == 0 && v34;
    BOOL v39 = v37 == 0;
    if (BSFloatEqualToFloat())
    {
      if (x > v28)
      {
        if (!v36)
        {
          if (!v39)
          {
            if (v35) {
              goto LABEL_67;
            }
            goto LABEL_34;
          }
          goto LABEL_63;
        }
LABEL_42:
        [(SBHIconEditingSettings *)self->_iconEditingSettings clusterFastestDuration];
LABEL_72:
        double v14 = v40;
        goto LABEL_73;
      }
      if (v35) {
        goto LABEL_42;
      }
      if (!v38)
      {
        if (!v36)
        {
          if (!v39) {
            goto LABEL_73;
          }
LABEL_71:
          [(SBHIconEditingSettings *)self->_iconEditingSettings clusterSlowestDuration];
          goto LABEL_72;
        }
        goto LABEL_67;
      }
    }
    else if (x <= v28)
    {
      if (v38) {
        goto LABEL_42;
      }
      if (!v39)
      {
        if (!v35)
        {
          if (!v36) {
            goto LABEL_73;
          }
          goto LABEL_71;
        }
        goto LABEL_67;
      }
    }
    else
    {
      if (v36) {
        goto LABEL_42;
      }
      if (!v35)
      {
        if (!v39)
        {
LABEL_34:
          if (!v38) {
            goto LABEL_73;
          }
          goto LABEL_71;
        }
LABEL_67:
        [(SBHIconEditingSettings *)self->_iconEditingSettings clusterMiddleSlowDuration];
        goto LABEL_72;
      }
    }
LABEL_63:
    [(SBHIconEditingSettings *)self->_iconEditingSettings clusterMiddleFastDuration];
    goto LABEL_72;
  }
  if (BSFloatEqualToFloat() && (BSFloatEqualToFloat() & 1) == 0)
  {
    v31 = [v10 layoutMetrics];
    v19 = v31;
    BOOL v32 = column == 1 || column == [(__CFString *)v31 columns];
    if (row >= 0) {
      int64_t v41 = row & 1;
    }
    else {
      int64_t v41 = -(row & 1);
    }
    BOOL v42 = v41 == 1 && v32;
    int v43 = v41 == 1 && !v32;
    if (v41)
    {
      BOOL v32 = 0;
      int v44 = 0;
    }
    else
    {
      int v44 = !v32;
    }
    if (y >= v30)
    {
      if (!v44)
      {
        if (!v43)
        {
          if (!v32)
          {
            if (v42)
            {
LABEL_77:
              [(SBHIconEditingSettings *)self->_iconEditingSettings clusterSlowestDuration];
              goto LABEL_78;
            }
LABEL_12:

            goto LABEL_73;
          }
          goto LABEL_75;
        }
        goto LABEL_69;
      }
    }
    else if (!v43)
    {
      if (!v44)
      {
        if (!v42)
        {
          if (v32) {
            goto LABEL_77;
          }
          goto LABEL_12;
        }
LABEL_75:
        [(SBHIconEditingSettings *)self->_iconEditingSettings clusterMiddleSlowDuration];
        goto LABEL_78;
      }
LABEL_69:
      [(SBHIconEditingSettings *)self->_iconEditingSettings clusterMiddleFastDuration];
      goto LABEL_78;
    }
    [(SBHIconEditingSettings *)self->_iconEditingSettings clusterFastestDuration];
LABEL_78:
    double v14 = v45;
    goto LABEL_12;
  }
LABEL_73:
  uint64_t v46 = [v10 iconInsertionAnimationOriginatingEdge];
  v47 = (void *)MEMORY[0x1E4FB1EB0];
  unint64_t var7 = a5->var7;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __116__SBIconListViewClusterAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v56[3] = &unk_1E6AB3578;
  long long v49 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  long long v63 = *(_OWORD *)&a5->var2.size.height;
  long long v64 = v49;
  long long v50 = *(_OWORD *)&a5->var5;
  SBIconCoordinate var4 = a5->var4;
  long long v66 = v50;
  long long v51 = *(_OWORD *)&a5->var1;
  CGPoint var0 = a5->var0;
  long long v62 = v51;
  id v57 = v11;
  id v58 = v17;
  BOOL v67 = v46 == 1;
  id v59 = v10;
  id v60 = v12;
  id v52 = v12;
  id v53 = v10;
  id v54 = v17;
  id v55 = v11;
  [v47 animateWithDuration:var7 delay:v56 usingSpringWithDamping:0 initialSpringVelocity:v14 options:0.0 animations:v16 completion:0.0];
}

void __116__SBIconListViewClusterAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v21 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v21.minimum;
  float maximum = v21.maximum;
  float preferred = v21.preferred;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __116__SBIconListViewClusterAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2;
  v9[3] = &unk_1E6AB3578;
  *(_OWORD *)&v21.float maximum = *(_OWORD *)(a1 + 112);
  long long v16 = *(_OWORD *)(a1 + 96);
  long long v17 = *(_OWORD *)&v21.maximum;
  *(_OWORD *)&v21.float maximum = *(_OWORD *)(a1 + 144);
  long long v18 = *(_OWORD *)(a1 + 128);
  long long v19 = *(_OWORD *)&v21.maximum;
  *(_OWORD *)&v21.float maximum = *(_OWORD *)(a1 + 80);
  long long v14 = *(_OWORD *)(a1 + 64);
  long long v15 = *(_OWORD *)&v21.maximum;
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  char v20 = *(unsigned char *)(a1 + 160);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  *(float *)&double v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114131, v9, v6, v7, v8);
}

uint64_t __116__SBIconListViewClusterAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2(uint64_t a1)
{
  v2 = (long long *)(a1 + 64);
  if (*(unsigned char *)(a1 + 144))
  {
    v3 = (void *)MEMORY[0x1E4FB1EB0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __116__SBIconListViewClusterAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3;
    v15[3] = &unk_1E6AB3550;
    id v4 = *(id *)(a1 + 32);
    long long v5 = v2[3];
    long long v21 = v2[2];
    long long v22 = v5;
    long long v6 = v2[5];
    long long v23 = v2[4];
    long long v24 = v6;
    long long v7 = v2[1];
    long long v19 = *v2;
    id v16 = v4;
    long long v20 = v7;
    id v17 = *(id *)(a1 + 40);
    char v25 = *(unsigned char *)(a1 + 160);
    id v18 = *(id *)(a1 + 48);
    [v3 performWithoutAnimation:v15];
    [*(id *)(a1 + 32) setAlpha:1.0];
    objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  else
  {
    double v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    long long v10 = v2[3];
    v14[2] = v2[2];
    v14[3] = v10;
    long long v11 = v2[5];
    v14[4] = v2[4];
    v14[5] = v11;
    long long v12 = v2[1];
    v14[0] = *v2;
    v14[1] = v12;
    [v8 performDefaultAnimatedLayoutUpdateForIconView:v9 withParameters:v14];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __116__SBIconListViewClusterAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(a1 + 32) setIconContentScale:*(double *)(a1 + 72)];
  uint64_t result = [*(id *)(a1 + 32) isDropping];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 40) isPlaceholder];
    if ((result & 1) == 0)
    {
      double v4 = *(double *)(a1 + 56);
      double v3 = *(double *)(a1 + 64);
      if (*(unsigned char *)(a1 + 152))
      {
        [*(id *)(a1 + 48) bounds];
        double v3 = v3 + v5;
      }
      else
      {
        uint64_t v6 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
        [*(id *)(a1 + 48) bounds];
        double v8 = -v7;
        if (v6 != 1) {
          double v8 = v7;
        }
        double v4 = v4 + v8;
      }
      uint64_t v9 = *(void **)(a1 + 32);
      return objc_msgSend(v9, "setCenter:", v4, v3);
    }
  }
  return result;
}

- (void)iconListView:(id)a3 wantsAnimatedRemovalForIconViews:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(SBHIconEditingSettings *)self->_iconEditingSettings defaultSpringDuration];
  double v12 = v11;
  [(SBHIconEditingSettings *)self->_iconEditingSettings defaultSpringDampingRatio];
  double v14 = v13;
  BOOL v15 = [v8 iconRemovalAnimationDestinationEdge] == 1;
  id v16 = (void *)MEMORY[0x1E4FB1EB0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __97__SBIconListViewClusterAnimator_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke;
  v22[3] = &unk_1E6AB35A0;
  id v23 = v9;
  long long v24 = self;
  BOOL v26 = v15;
  id v25 = v8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__SBIconListViewClusterAnimator_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_2;
  v20[3] = &unk_1E6AADF78;
  id v21 = v10;
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  [v16 animateWithDuration:4 delay:v22 usingSpringWithDamping:v20 initialSpringVelocity:v12 options:0.0 animations:v14 completion:0.0];
}

void __97__SBIconListViewClusterAnimator_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "icon", (void)v22);
        if ([v8 isPlaceholder])
        {
          [v7 setAlpha:0.0];
        }
        else
        {
          [v7 center];
          double v10 = v9;
          double v12 = v11;
          double v13 = *(void **)(*(void *)(a1 + 40) + 16);
          double v14 = [v8 uniqueIdentifier];
          BOOL v15 = [v13 objectForKey:v14];
          uint64_t v16 = [v15 unsignedIntegerValue];

          if (v16 == 1) {
            double v17 = -1.0;
          }
          else {
            double v17 = 1.0;
          }
          if (*(unsigned char *)(a1 + 56))
          {
            [*(id *)(a1 + 48) bounds];
            double v12 = v12 + v18 * v17;
          }
          else
          {
            uint64_t v19 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
            [*(id *)(a1 + 48) bounds];
            double v21 = -v20;
            if (v19 != 1) {
              double v21 = v20;
            }
            double v10 = v10 + v17 * v21;
          }
          objc_msgSend(v7, "setCenter:", v10, v12);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v4);
  }
}

uint64_t __97__SBIconListViewClusterAnimator_iconListView_wantsAnimatedRemovalForIconViews_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removalDirectionForIcons, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
}

@end