@interface SBIconListViewIconSizeChangeAnimator
- (BSInvalidatable)iconViewContextMenuAssertion;
- (CGPoint)priorIconViewPosition;
- (NSString)priorGridSizeClass;
- (SBHIconEditingSettings)iconEditingSettings;
- (SBHWidgetIconResizeViewHelper)viewHelper;
- (SBIcon)priorIcon;
- (SBIconListViewIconSizeChangeAnimator)initWithIconView:(id)a3 iconListView:(id)a4 widgetMetricsProvider:(id)a5;
- (SBIconListViewIconSizeChangeAnimatorDelegate)delegate;
- (SBIconView)iconView;
- (SBLeafIconDataSource)priorIconActiveDataSource;
- (id)iconResizeTransitionViewController:(id)a3 willUseIcon:(id)a4 forViewControllerForGridSizeClass:(id)a5;
- (id)iconResizeTransitionViewController:(id)a3 willUseIconDataSource:(id)a4 forViewControllerForGridSizeClass:(id)a5;
- (id)iconResizeViewHelper:(id)a3 intentForWidget:(id)a4;
- (id)iconResizeViewHelper:(id)a3 viewControllerForIconDataSource:(id)a4 icon:(id)a5 gridSizeClass:(id)a6;
- (id)snapshotViewBackgroundViewForIconView:(id)a3;
- (void)addAnimationCompletionHandler:(id)a3;
- (void)dealloc;
- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setIconViewContextMenuAssertion:(id)a3;
- (void)setPriorGridSizeClass:(id)a3;
@end

@implementation SBIconListViewIconSizeChangeAnimator

- (SBIconListViewIconSizeChangeAnimator)initWithIconView:(id)a3 iconListView:(id)a4 widgetMetricsProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)SBIconListViewIconSizeChangeAnimator;
  v12 = [(SBIconListViewClusterAnimator *)&v31 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_iconView, a3);
    uint64_t v14 = [v9 icon];
    priorIcon = v13->_priorIcon;
    v13->_priorIcon = (SBIcon *)v14;

    uint64_t v16 = [(SBIcon *)v13->_priorIcon activeDataSource];
    priorIconActiveDataSource = v13->_priorIconActiveDataSource;
    v13->_priorIconActiveDataSource = (SBLeafIconDataSource *)v16;

    [v9 center];
    v13->_priorIconViewPosition.x = v18;
    v13->_priorIconViewPosition.y = v19;
    v20 = [v9 icon];
    v21 = [v20 gridSizeClass];
    uint64_t v22 = [v21 copy];
    priorGridSizeClass = v13->_priorGridSizeClass;
    v13->_priorGridSizeClass = (NSString *)v22;

    v24 = [v9 listLayout];
    v25 = -[SBHWidgetIconResizeViewHelper initWithDelegate:listLayout:widgetMetricsProvider:orientation:]([SBHWidgetIconResizeViewHelper alloc], "initWithDelegate:listLayout:widgetMetricsProvider:orientation:", v13, v24, v11, [v10 layoutOrientation]);
    viewHelper = v13->_viewHelper;
    v13->_viewHelper = v25;

    v27 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v28 = [v27 iconEditingSettings];
    iconEditingSettings = v13->_iconEditingSettings;
    v13->_iconEditingSettings = (SBHIconEditingSettings *)v28;
  }
  return v13;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_iconViewContextMenuAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBIconListViewIconSizeChangeAnimator;
  [(SBIconListViewIconSizeChangeAnimator *)&v3 dealloc];
}

- (void)addAnimationCompletionHandler:(id)a3
{
  id v4 = a3;
  animationCompletionHandlers = self->_animationCompletionHandlers;
  id v10 = v4;
  if (!animationCompletionHandlers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_animationCompletionHandlers;
    self->_animationCompletionHandlers = v6;

    id v4 = v10;
    animationCompletionHandlers = self->_animationCompletionHandlers;
  }
  v8 = (void *)[v4 copy];
  id v9 = _Block_copy(v8);
  [(NSMutableArray *)animationCompletionHandlers addObject:v9];
}

- (void)iconListView:(id)a3 wantsAnimatedLayoutForIconView:(id)a4 withParameters:(SBIconListLayoutAnimationParameters *)a5 alongsideAnimationBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [v11 icon];
  id v14 = [(SBIconListViewIconSizeChangeAnimator *)self iconView];
  if (v14 != v11)
  {

LABEL_5:
    v75.receiver = self;
    v75.super_class = (Class)SBIconListViewIconSizeChangeAnimator;
    long long v48 = *(_OWORD *)&a5->var2.continuousCornerRadius;
    v74[2] = *(_OWORD *)&a5->var2.size.height;
    v74[3] = v48;
    long long v49 = *(_OWORD *)&a5->var5;
    v74[4] = a5->var4;
    v74[5] = v49;
    long long v50 = *(_OWORD *)&a5->var1;
    v74[0] = a5->var0;
    v74[1] = v50;
    [(SBIconListViewClusterAnimator *)&v75 iconListView:v10 wantsAnimatedLayoutForIconView:v11 withParameters:v74 alongsideAnimationBlock:v12];
    goto LABEL_6;
  }
  char v15 = [v13 isLeafIcon];

  if ((v15 & 1) == 0) {
    goto LABEL_5;
  }
  v57 = [(SBIconListViewIconSizeChangeAnimator *)self priorGridSizeClass];
  uint64_t v16 = [v11 icon];
  uint64_t v17 = [v16 gridSizeClass];

  id v51 = v13;
  v55 = [v11 gridSizeClassDomain];
  v54 = [(SBIconListViewIconSizeChangeAnimator *)self viewHelper];
  v56 = v13;
  CGFloat v18 = [SBHIconGridSizeClassSet alloc];
  v58 = v12;
  uint64_t v19 = v17;
  v52 = (void *)v17;
  v20 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v57, v17, 0);
  v53 = [(SBHIconGridSizeClassSet *)v18 initWithGridSizeClasses:v20];

  v21 = [[SBWidgetIconResizeTransitionViewController alloc] initWithLeafIcon:v51 allowedGridSizeClasses:v53 gridSizeClassDomain:v55 viewHelper:v54 options:1];
  [(SBWidgetIconResizeTransitionViewController *)v21 setDelegate:self];
  [(SBWidgetIconResizeTransitionViewController *)v21 setStartingGridSizeClass:v57];
  [(SBWidgetIconResizeTransitionViewController *)v21 setEndingGridSizeClass:v19];
  [v11 setOverrideCustomIconImageViewController:v21];
  [v10 iconImageInfoForGridSizeClass:v57];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  [(SBIconListViewIconSizeChangeAnimator *)self priorIconViewPosition];
  double v31 = v30;
  double v33 = v32;
  v34 = [v11 disallowContextMenusForReason:@"size change"];
  [(SBIconListViewIconSizeChangeAnimator *)self setIconViewContextMenuAssertion:v34];

  v35 = [(SBWidgetIconResizeTransitionViewController *)v21 view];
  objc_msgSend(v11, "setIconImageInfo:", v23, v25, v27, v29);
  objc_msgSend(v11, "setCenter:", v31, v33);
  [v11 layoutIfNeeded];
  [v35 layoutIfNeeded];
  [(SBHIconEditingSettings *)self->_iconEditingSettings defaultSpringDuration];
  double v37 = v36;
  [(SBHIconEditingSettings *)self->_iconEditingSettings defaultSpringDampingRatio];
  double v39 = v38;
  v40 = (void *)MEMORY[0x1E4FB1EB0];
  unint64_t var7 = a5->var7;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __123__SBIconListViewIconSizeChangeAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke;
  v63[3] = &unk_1E6AB4BB8;
  v64 = v21;
  id v65 = v11;
  id v66 = v10;
  long long v42 = *(_OWORD *)&a5->var2.size.height;
  SBIconCoordinate var4 = a5->var4;
  long long v44 = *(_OWORD *)&a5->var5;
  long long v71 = *(_OWORD *)&a5->var2.continuousCornerRadius;
  SBIconCoordinate v72 = var4;
  long long v73 = v44;
  long long v45 = *(_OWORD *)&a5->var1;
  CGPoint var0 = a5->var0;
  long long v69 = v45;
  long long v70 = v42;
  id v67 = v58;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __123__SBIconListViewIconSizeChangeAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3;
  v59[3] = &unk_1E6AB3020;
  id v60 = v65;
  v61 = self;
  v62 = v64;
  v46 = v64;
  unint64_t v47 = var7;
  v13 = v56;
  [v40 animateWithDuration:v47 delay:v63 usingSpringWithDamping:v59 initialSpringVelocity:v37 options:0.0 animations:v39 completion:0.0];

  id v12 = v58;
LABEL_6:
}

void __123__SBIconListViewIconSizeChangeAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v23 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v23.minimum;
  float maximum = v23.maximum;
  float preferred = v23.preferred;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __123__SBIconListViewIconSizeChangeAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2;
  v12[3] = &unk_1E6AB4BB8;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 112);
  long long v19 = *(_OWORD *)(a1 + 96);
  long long v20 = v6;
  long long v7 = *(_OWORD *)(a1 + 144);
  long long v21 = *(_OWORD *)(a1 + 128);
  long long v22 = v7;
  long long v8 = *(_OWORD *)(a1 + 80);
  long long v17 = *(_OWORD *)(a1 + 64);
  long long v18 = v8;
  id v16 = *(id *)(a1 + 56);
  *(float *)&double v9 = minimum;
  *(float *)&double v10 = maximum;
  *(float *)&double v11 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114131, v12, v9, v10, v11);
}

uint64_t __123__SBIconListViewIconSizeChangeAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTransitionProgress:1.0];
  [*(id *)(a1 + 40) clearIconImageInfo];
  [*(id *)(a1 + 40) setNeedsLayout];
  [*(id *)(a1 + 40) layoutIfNeeded];
  uint64_t v3 = *(void *)(a1 + 40);
  v2 = *(void **)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 112);
  v8[2] = *(_OWORD *)(a1 + 96);
  v8[3] = v4;
  long long v5 = *(_OWORD *)(a1 + 144);
  v8[4] = *(_OWORD *)(a1 + 128);
  v8[5] = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  v8[0] = *(_OWORD *)(a1 + 64);
  v8[1] = v6;
  [v2 performDefaultAnimatedLayoutUpdateForIconView:v3 withParameters:v8];
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __123__SBIconListViewIconSizeChangeAnimator_iconListView_wantsAnimatedLayoutForIconView_withParameters_alongsideAnimationBlock___block_invoke_3(id *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a1[4] setOverrideCustomIconImageViewController:0];
  id v2 = *((id *)a1[5] + 3);
  uint64_t v3 = a1[5];
  long long v4 = (void *)v3[3];
  v3[3] = 0;

  long long v5 = [a1[5] iconViewContextMenuAssertion];
  [v5 invalidate];
  [a1[5] setIconViewContextMenuAssertion:0];
  [a1[6] invalidate];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v2;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)snapshotViewBackgroundViewForIconView:(id)a3
{
  uint64_t v3 = [a3 customIconImageViewController];
  if (objc_msgSend(v3, "sbh_isWidgetStackViewController"))
  {
    id v4 = v3;
    long long v5 = [v4 backgroundView];

    if (v5)
    {
      uint64_t v6 = [v4 backgroundViewProvider];
      uint64_t v7 = (void *)v6;
      if (v6) {
        (*(void (**)(uint64_t))(v6 + 16))(v6);
      }
      else {
      uint64_t v8 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:3];
      }
      [v8 setClipsToBounds:0];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)iconResizeViewHelper:(id)a3 intentForWidget:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBIconListViewIconSizeChangeAnimator *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 iconSizeChangeAnimator:self intentForWidget:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)iconResizeViewHelper:(id)a3 viewControllerForIconDataSource:(id)a4 icon:(id)a5 gridSizeClass:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v12 = [(SBIconListViewIconSizeChangeAnimator *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v13 = [v12 iconSizeChangeAnimator:self viewControllerForIconDataSource:v9 icon:v10 gridSizeClass:v11];
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (id)iconResizeTransitionViewController:(id)a3 willUseIcon:(id)a4 forViewControllerForGridSizeClass:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(SBIconListViewIconSizeChangeAnimator *)self priorGridSizeClass];
  if ((id)v9 == v8)
  {

    goto LABEL_5;
  }
  id v10 = (void *)v9;
  id v11 = [(SBIconListViewIconSizeChangeAnimator *)self priorGridSizeClass];
  int v12 = [v8 isEqualToString:v11];

  if (v12)
  {
LABEL_5:
    uint64_t v13 = [(SBIconListViewIconSizeChangeAnimator *)self priorIcon];

    id v7 = (id)v13;
  }

  return v7;
}

- (id)iconResizeTransitionViewController:(id)a3 willUseIconDataSource:(id)a4 forViewControllerForGridSizeClass:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(SBIconListViewIconSizeChangeAnimator *)self priorGridSizeClass];
  if ((id)v9 == v8)
  {

    goto LABEL_5;
  }
  id v10 = (void *)v9;
  id v11 = [(SBIconListViewIconSizeChangeAnimator *)self priorGridSizeClass];
  int v12 = [v8 isEqualToString:v11];

  if (v12)
  {
LABEL_5:
    uint64_t v13 = [(SBIconListViewIconSizeChangeAnimator *)self priorIconActiveDataSource];

    id v7 = (id)v13;
  }

  return v7;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (SBIconListViewIconSizeChangeAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBIconListViewIconSizeChangeAnimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBHIconEditingSettings)iconEditingSettings
{
  return self->_iconEditingSettings;
}

- (BSInvalidatable)iconViewContextMenuAssertion
{
  return self->_iconViewContextMenuAssertion;
}

- (void)setIconViewContextMenuAssertion:(id)a3
{
}

- (NSString)priorGridSizeClass
{
  return self->_priorGridSizeClass;
}

- (void)setPriorGridSizeClass:(id)a3
{
}

- (CGPoint)priorIconViewPosition
{
  double x = self->_priorIconViewPosition.x;
  double y = self->_priorIconViewPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (SBIcon)priorIcon
{
  return self->_priorIcon;
}

- (SBLeafIconDataSource)priorIconActiveDataSource
{
  return self->_priorIconActiveDataSource;
}

- (SBHWidgetIconResizeViewHelper)viewHelper
{
  return self->_viewHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewHelper, 0);
  objc_storeStrong((id *)&self->_priorIconActiveDataSource, 0);
  objc_storeStrong((id *)&self->_priorIcon, 0);
  objc_storeStrong((id *)&self->_priorGridSizeClass, 0);
  objc_storeStrong((id *)&self->_iconViewContextMenuAssertion, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_animationCompletionHandlers, 0);
}

@end