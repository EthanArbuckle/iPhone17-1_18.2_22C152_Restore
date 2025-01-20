@interface PRWidgetIconViewProvider
- (BOOL)iconView:(id)a3 canAddDragItemsToSession:(id)a4;
- (BOOL)isIconViewRecycled:(id)a3;
- (BOOL)isWidgetInteractionDisabled;
- (BOOL)useMaterialBackground;
- (PRWidgetIconViewProvider)initWithRecycledViewsContainerProvider:(id)a3 widgetInteractionDisabled:(BOOL)a4 useMaterialBackground:(BOOL)a5;
- (SBHRecycledViewsContainerProviding)recycledViewsContainerProvider;
- (SBIconDragManager)dragManager;
- (id)customImageViewControllerForIconView:(id)a3;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (id)dragItemsForIconView:(id)a3;
- (id)iconView:(id)a3 dragPreviewForItem:(id)a4 session:(id)a5 previewParameters:(id)a6;
- (id)iconViewMap;
- (id)recycledViewsContainerProviderForViewMap:(id)a3;
- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4;
- (void)iconView:(id)a3 didEndDragSession:(id)a4 withOperation:(unint64_t)a5;
- (void)iconView:(id)a3 dragLiftAnimationDidChangeDirection:(int64_t)a4;
- (void)iconView:(id)a3 item:(id)a4 willAnimateDragCancelWithAnimator:(id)a5;
- (void)iconView:(id)a3 willAnimateDragLiftWithAnimator:(id)a4 session:(id)a5;
- (void)iconViewWillBeginDrag:(id)a3 session:(id)a4;
- (void)recycleIconView:(id)a3;
- (void)setDragManager:(id)a3;
- (void)setRecycledViewsContainerProvider:(id)a3;
@end

@implementation PRWidgetIconViewProvider

- (PRWidgetIconViewProvider)initWithRecycledViewsContainerProvider:(id)a3 widgetInteractionDisabled:(BOOL)a4 useMaterialBackground:(BOOL)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PRWidgetIconViewProvider;
  v9 = [(PRWidgetIconViewProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_recycledViewsContainerProvider, v8);
    v10->_widgetInteractionDisabled = a4;
    v10->_useMaterialBackground = a5;
  }

  return v10;
}

- (id)iconViewMap
{
  iconViewMap = self->_iconViewMap;
  if (!iconViewMap)
  {
    v4 = (SBHReusableViewMap *)[objc_alloc(MEMORY[0x1E4FA6310]) initWithDelegate:self];
    v5 = self->_iconViewMap;
    self->_iconViewMap = v4;

    iconViewMap = self->_iconViewMap;
  }
  return iconViewMap;
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  v4 = [(PRWidgetIconViewProvider *)self iconViewMap];
  v5 = [v4 dequeueReusableViewOfClass:a3];

  return v5;
}

- (void)recycleIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(PRWidgetIconViewProvider *)self iconViewMap];
  [v5 recycleView:v4];
}

- (BOOL)isIconViewRecycled:(id)a3
{
  id v4 = a3;
  id v5 = [(PRWidgetIconViewProvider *)self iconViewMap];
  char v6 = [v5 isViewRecycled:v4];

  return v6;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v5 = a3;
  [v5 setAllowsEditingAnimation:0];
  [v5 setDelegate:self];
  [v5 addObserver:self];
}

- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4
{
  return 16;
}

- (id)recycledViewsContainerProviderForViewMap:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recycledViewsContainerProvider);
  return WeakRetained;
}

- (id)customImageViewControllerForIconView:(id)a3
{
  id v4 = [a3 icon];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [v8 activeWidget];
  v10 = [v9 kind];
  v11 = [v9 extensionBundleIdentifier];
  uint64_t v12 = [v9 containerBundleIdentifier];
  v13 = [v8 gridSizeClass];

  v38 = (void *)v12;
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F58DD8]) initWithExtensionBundleIdentifier:v11 containerBundleIdentifier:v12 kind:v10 family:PRWidgetFamilyForIconGridSizeClass(v13) intent:0];
  v15 = [PRComplicationDescriptor alloc];
  v16 = [MEMORY[0x1E4F29128] UUID];
  v17 = [v16 UUIDString];
  v18 = [(PRComplicationDescriptor *)v15 initWithUniqueIdentifier:v17 widget:v14];

  if (v18)
  {
    v36 = v11;
    v37 = v10;
    v19 = [[PRWidgetIconViewController alloc] initWithComplicationDescriptor:v18 contentType:1];
    [(PRWidgetIconViewController *)v19 setBackgroundHidden:0];
    [(PRWidgetIconViewController *)v19 setWidgetInteractionDisabled:[(PRWidgetIconViewProvider *)self isWidgetInteractionDisabled]];
    [(PRWidgetIconViewController *)v19 setUseMaterialBackground:[(PRWidgetIconViewProvider *)self useMaterialBackground]];
    id v20 = objc_alloc(MEMORY[0x1E4F58EE8]);
    v21 = [MEMORY[0x1E4FB1618] darkGrayColor];
    v22 = [v21 BSColor];
    v23 = (void *)[v20 initWithPrimaryTintColor:0 secondaryTintColor:v22 filterStyle:4 fallbackFilterStyle:4 fraction:1.0];

    v24 = [(PRWidgetIconViewController *)v19 widgetHostViewController];
    [v24 setTintParameters:v23];

    v25 = [(PRComplicationDescriptor *)v18 widget];
    v26 = PRSharedWidgetDescriptorProvider();
    v27 = [v26 descriptorForPersonality:v25];

    uint64_t v28 = [v27 intentType];
    if (v28)
    {
      v29 = (void *)v28;
      v30 = [v25 intent];

      if (!v30)
      {
        v31 = [v27 defaultIntent];
        if (v31)
        {
          v32 = [(PRWidgetIconViewController *)v19 widgetHostViewController];
          [v25 widgetByReplacingIntent:v31];
          v33 = v35 = v31;
          [(PRComplicationDescriptor *)v18 setWidget:v33];
          [v32 setWidget:v33];

          v31 = v35;
        }
        else
        {
          v32 = PRLogCommon();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            -[PRWidgetIconViewProvider customImageViewControllerForIconView:](v25, v32);
          }
        }
      }
    }

    v11 = v36;
    v10 = v37;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)dragItemsForIconView:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 icon];
  uint64_t v5 = SBHIconDragItemWithIconAndIconView();

  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)iconViewWillBeginDrag:(id)a3 session:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PRWidgetIconViewProvider *)self dragManager];
  [v8 iconViewWillBeginDrag:v7 session:v6];
}

- (BOOL)iconView:(id)a3 canAddDragItemsToSession:(id)a4
{
  return 0;
}

- (void)iconView:(id)a3 willAnimateDragLiftWithAnimator:(id)a4 session:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PRWidgetIconViewProvider *)self dragManager];
  [v11 iconView:v10 willAnimateDragLiftWithAnimator:v9 session:v8];
}

- (void)iconView:(id)a3 dragLiftAnimationDidChangeDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(PRWidgetIconViewProvider *)self dragManager];
  [v7 iconView:v6 dragLiftAnimationDidChangeDirection:a4];
}

- (void)iconView:(id)a3 item:(id)a4 willAnimateDragCancelWithAnimator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PRWidgetIconViewProvider *)self dragManager];
  [v11 iconView:v10 item:v9 willAnimateDragCancelWithAnimator:v8];
}

- (void)iconView:(id)a3 didEndDragSession:(id)a4 withOperation:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PRWidgetIconViewProvider *)self dragManager];
  [v10 iconView:v9 didEndDragSession:v8 withOperation:a5];
}

- (id)iconView:(id)a3 dragPreviewForItem:(id)a4 session:(id)a5 previewParameters:(id)a6
{
  id v6 = a3;
  id v7 = [v6 customIconImageViewController];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [v11 widgetHostViewController];

  v13 = [PRComplicationDragPreviewView alloc];
  v14 = [v12 view];
  v15 = [(PRComplicationDragPreviewView *)v13 initWithWidgetHostView:v14];

  id v16 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  v17 = [MEMORY[0x1E4FB1618] clearColor];
  [v16 setBackgroundColor:v17];

  id v18 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  [v16 setShadowPath:v18];

  v19 = [v6 customIconImageViewController];
  id v20 = [v19 view];
  [v20 frame];
  BSRectGetCenter();
  double v22 = v21;
  double v24 = v23;

  id v25 = objc_alloc(MEMORY[0x1E4FB1B38]);
  long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v30[0] = *MEMORY[0x1E4F1DAB8];
  v30[1] = v26;
  v30[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  v27 = objc_msgSend(v25, "initWithContainer:center:transform:", v6, v30, v22, v24);

  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v15 parameters:v16 target:v27];
  return v28;
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v4 = a4;
  uint64_t v5 = self;
  id v8 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  [v7 invalidate];
}

- (BOOL)isWidgetInteractionDisabled
{
  return self->_widgetInteractionDisabled;
}

- (BOOL)useMaterialBackground
{
  return self->_useMaterialBackground;
}

- (SBIconDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
}

- (SBHRecycledViewsContainerProviding)recycledViewsContainerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recycledViewsContainerProvider);
  return (SBHRecycledViewsContainerProviding *)WeakRetained;
}

- (void)setRecycledViewsContainerProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recycledViewsContainerProvider);
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_iconViewMap, 0);
}

- (void)customImageViewControllerForIconView:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 extensionBundleIdentifier];
  uint64_t v5 = [a1 kind];
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_ERROR, "Default intent asked for but not provided: %@ - %@", (uint8_t *)&v6, 0x16u);
}

@end