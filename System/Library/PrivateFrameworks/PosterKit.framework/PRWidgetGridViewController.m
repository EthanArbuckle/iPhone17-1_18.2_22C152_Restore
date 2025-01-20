@interface PRWidgetGridViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldDisableWidgetInteraction;
- (BOOL)allowsSnappingIconsToGridForIconDragManager:(id)a3;
- (BOOL)containsIconsInRow:(unint64_t)a3;
- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5;
- (BOOL)iconDragManager:(id)a3 canMakeIconViewDragRecipient:(id)a4;
- (BOOL)iconDragManager:(id)a3 canSnapIconsToGridInLocation:(id)a4;
- (BOOL)interpretsViewAsContent:(id)a3;
- (BOOL)isEditing;
- (BOOL)isFocused;
- (BOOL)isIconViewRecycled:(id)a3;
- (BOOL)isWidgetInteractionDisabled;
- (BOOL)requiresFocusForLaunchRequests;
- (BOOL)shouldNonDefaultGridSizeClassesUseClusterAnimationForIconDragManager:(id)a3;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (PRWidgetGridModel)model;
- (PRWidgetGridViewController)initWithModel:(id)a3;
- (PRWidgetGridViewController)initWithModel:(id)a3 iconViewProvider:(id)a4;
- (PRWidgetGridViewController)initWithModel:(id)a3 iconViewProvider:(id)a4 contentType:(unint64_t)a5 presentationMode:(unint64_t)a6;
- (PRWidgetGridViewControllerDelegate)delegate;
- (SBHIconGridSize)gridSize;
- (SBIconDragManager)dragManager;
- (SBIconListView)listView;
- (SBIconViewProviding)iconViewProvider;
- (UIView)recycledViewsContainer;
- (double)iconContentScale;
- (id)_descriptorFromWidgetIcon:(id)a3;
- (id)_widgetIconViewControllerForIcon:(id)a3;
- (id)customImageViewControllerForIconView:(id)a3;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (id)iconDragManager:(id)a3 dragItemsForIconView:(id)a4;
- (id)iconDragManager:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7;
- (id)iconViewMap;
- (id)rootFolderForIconDragManager:(id)a3;
- (id)widgetHostViewControllerForComplicationDescriptor:(id)a3;
- (int64_t)closeBoxTypeForIconView:(id)a3;
- (unint64_t)contentType;
- (unint64_t)iconDragManager:(id)a3 willMoveDragPlaceholderToGridCellIndex:(unint64_t)a4 inIconListView:(id)a5 draggedIcons:(id)a6;
- (unint64_t)presentationMode;
- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4;
- (void)_intentsUpdated;
- (void)_layoutInsetsModeUpdated;
- (void)_listModelUpdated;
- (void)_tapGestureRecognized:(id)a3;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)dealloc;
- (void)ensureContentWithTimeout:(double)a3 completion:(id)a4;
- (void)handleLaunchRequestForIcon:(id)a3;
- (void)iconCloseBoxTapped:(id)a3;
- (void)iconDragManager:(id)a3 didEndDragWithResult:(id)a4;
- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4;
- (void)invalidate;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performAnimatedInsertionForIcon:(id)a3;
- (void)performAnimatedRemovalForIcon:(id)a3;
- (void)recycleIconView:(id)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDragManager:(id)a3;
- (void)setFocused:(BOOL)a3;
- (void)setFocused:(BOOL)a3 animated:(BOOL)a4;
- (void)setFocused:(BOOL)a3 animationSettings:(id)a4;
- (void)setGridSize:(SBHIconGridSize)a3;
- (void)setIconContentScale:(double)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setListView:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setRequiresFocusForLaunchRequests:(BOOL)a3;
- (void)setVibrancyConfiguration:(id)a3;
- (void)setWidgetInteractionDisabled:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)widgetHostViewController:(id)a3 requestsLaunchWithAction:(id)a4;
- (void)widgetIconViewControllerDidReceiveTap:(id)a3;
@end

@implementation PRWidgetGridViewController

- (PRWidgetGridViewController)initWithModel:(id)a3
{
  return [(PRWidgetGridViewController *)self initWithModel:a3 iconViewProvider:0];
}

- (PRWidgetGridViewController)initWithModel:(id)a3 iconViewProvider:(id)a4
{
  return [(PRWidgetGridViewController *)self initWithModel:a3 iconViewProvider:a4 contentType:0 presentationMode:2];
}

- (PRWidgetGridViewController)initWithModel:(id)a3 iconViewProvider:(id)a4 contentType:(unint64_t)a5 presentationMode:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PRWidgetGridViewController;
  v13 = [(PRWidgetGridViewController *)&v18 initWithNibName:0 bundle:0];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_model, a3);
    objc_storeWeak((id *)&v14->_iconViewProvider, v12);
    v14->_contentType = a5;
    v14->_presentationMode = a6;
    v15 = objc_alloc_init(PRIconDragManager);
    dragManager = v14->_dragManager;
    v14->_dragManager = &v15->super;

    [(SBIconDragManager *)v14->_dragManager setDelegate:v14];
  }

  return v14;
}

- (void)dealloc
{
  v3 = [(PRWidgetGridViewController *)self model];
  [v3 removeObserver:self forKeyPath:@"listModel" context:&PRWidgetGridViewControllerKVOContext];

  v4 = [(PRWidgetGridViewController *)self model];
  [v4 removeObserver:self forKeyPath:@"layoutInsetsMode" context:&PRWidgetGridViewControllerKVOContext];

  v5 = [(PRWidgetGridViewController *)self model];
  [v5 removeObserver:self forKeyPath:@"intentsByDescriptorIdentifier" context:&PRWidgetGridViewControllerKVOContext];

  v6.receiver = self;
  v6.super_class = (Class)PRWidgetGridViewController;
  [(PRWidgetGridViewController *)&v6 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v3 = objc_alloc_init(PRSubviewHitTestingView);
  [(PRWidgetGridViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)PRWidgetGridViewController;
  [(PRWidgetGridViewController *)&v25 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FA6410]);
  v4 = [(PRWidgetGridViewController *)self model];
  v5 = [v4 listModel];
  objc_super v6 = [PRIconListLayoutProvider alloc];
  v7 = [(PRWidgetGridViewController *)self model];
  v8 = -[PRIconListLayoutProvider initWithGridSize:](v6, "initWithGridSize:", [v7 gridSize]);
  uint64_t v9 = *MEMORY[0x1E4FA6698];
  WeakRetained = (PRWidgetGridViewController *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
  id v11 = WeakRetained;
  if (WeakRetained) {
    id v12 = WeakRetained;
  }
  else {
    id v12 = self;
  }
  v13 = (void *)[v3 initWithModel:v5 layoutProvider:v8 iconLocation:v9 orientation:1 iconViewProvider:v12];

  [v13 setAllowsGaps:1];
  v14 = [(PRWidgetGridViewController *)self dragManager];
  [v13 setDragDelegate:v14];

  [v13 setIconDragTypeIdentifier:@"com.apple.PosterBoard.WidgetGrid"];
  [v13 addLayoutObserver:self];
  [MEMORY[0x1E4F5E4A8] interComplicationSpacingExcludingInnerInset];
  objc_msgSend(v13, "setIconSpacing:", v15, v15);
  v16 = [(PRWidgetGridViewController *)self view];
  [v16 addSubview:v13];

  [(PRWidgetGridViewController *)self setListView:v13];
  v17 = [(PRWidgetGridViewController *)self view];
  objc_super v18 = [v17 layer];
  [v18 setHitTestsAsOpaque:1];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__tapGestureRecognized_];
  v20 = [(PRWidgetGridViewController *)self view];
  [v20 addGestureRecognizer:v19];

  v21 = [(PRWidgetGridViewController *)self model];
  [v21 addObserver:self forKeyPath:@"listModel" options:5 context:&PRWidgetGridViewControllerKVOContext];

  v22 = [(PRWidgetGridViewController *)self model];
  [v22 addObserver:self forKeyPath:@"layoutInsetsMode" options:5 context:&PRWidgetGridViewControllerKVOContext];

  v23 = [(PRWidgetGridViewController *)self model];
  [v23 addObserver:self forKeyPath:@"intentsByDescriptorIdentifier" options:5 context:&PRWidgetGridViewControllerKVOContext];

  v24 = [(PRWidgetGridViewController *)self model];
  [v24 setPresenter:self];
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PRWidgetGridViewController;
  [(PRWidgetGridViewController *)&v9 viewDidLayoutSubviews];
  id v3 = [(PRWidgetGridViewController *)self view];
  [v3 bounds];
  CGRect v11 = CGRectInset(v10, -20.0, -20.0);
  double x = v11.origin.x;
  double y = v11.origin.y;
  double width = v11.size.width;
  double height = v11.size.height;

  v8 = [(PRWidgetGridViewController *)self listView];
  objc_msgSend(v8, "setFrame:", x, y, width, height);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  CGRect v11 = v10;
  if (a6 == &PRWidgetGridViewControllerKVOContext)
  {
    if ([v10 isEqualToString:@"listModel"])
    {
      [(PRWidgetGridViewController *)self _listModelUpdated];
    }
    else if ([v11 isEqualToString:@"layoutInsetsMode"])
    {
      [(PRWidgetGridViewController *)self _layoutInsetsModeUpdated];
    }
    else if ([v11 isEqualToString:@"intentsByDescriptorIdentifier"])
    {
      [(PRWidgetGridViewController *)self _intentsUpdated];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PRWidgetGridViewController;
    [(PRWidgetGridViewController *)&v12 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)_listModelUpdated
{
  id v5 = [(PRWidgetGridViewController *)self listView];
  id v3 = [(PRWidgetGridViewController *)self model];
  v4 = [v3 listModel];
  [v5 setModel:v4];
}

- (void)_layoutInsetsModeUpdated
{
  id v3 = [(PRWidgetGridViewController *)self model];
  BOOL v4 = [v3 layoutInsetsMode] == 1;

  id v5 = [(PRWidgetGridViewController *)self listView];
  [v5 setLayoutInsetsMode:2 * v4];
}

- (void)_intentsUpdated
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = [(PRWidgetGridViewController *)self model];
  BOOL v4 = [v3 listModel];
  id v5 = [v4 icons];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v23 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        objc_super v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v10 = [(PRWidgetGridViewController *)self _widgetIconViewControllerForIcon:v9];
        CGRect v11 = [v9 leafIdentifier];
        objc_super v12 = [v10 widgetHostViewController];
        v13 = [v12 widget];

        v14 = [(PRWidgetGridViewController *)self model];
        double v15 = [v14 intentsByDescriptorIdentifier];
        v16 = [v15 objectForKeyedSubscript:v11];

        v17 = [v13 intentReference];
        objc_super v18 = [v17 intent];
        char v19 = BSEqualObjects();

        if ((v19 & 1) == 0)
        {
          v20 = [v13 widgetByReplacingIntent:v16];
          v21 = [v10 widgetHostViewController];
          [v21 setWidget:v20];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }
}

- (void)ensureContentWithTimeout:(double)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v18 = a4;
  id v5 = [(PRWidgetGridViewController *)self listView];
  [v5 layoutIconsIfNeeded];

  uint64_t v6 = [(PRWidgetGridViewController *)self listView];
  uint64_t v7 = [v6 icons];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke;
  v28[3] = &unk_1E54DBB88;
  v28[4] = self;
  v8 = objc_msgSend(v7, "bs_compactMap:", v28);

  objc_super v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = [*(id *)(*((void *)&v24 + 1) + 8 * v14) widgetHostViewController];
        if (v15)
        {
          dispatch_group_enter(v9);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke_2;
          v21[3] = &unk_1E54DBBB0;
          id v16 = v15;
          id v22 = v16;
          uint64_t v23 = v9;
          [v16 ensureContentWithTimeout:v21 completion:5.0];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  dispatch_group_leave(v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke_27;
  block[3] = &unk_1E54DBBD8;
  id v20 = v18;
  id v17 = v18;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);
}

uint64_t __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _widgetIconViewControllerForIcon:a2];
}

void __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = PRLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke_2_cold_1((uint64_t)v3, a1, v4);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke_27(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)interpretsViewAsContent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = [(PRWidgetGridViewController *)self listView];
    uint64_t v6 = [v5 icons];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [(PRWidgetGridViewController *)self _widgetIconViewControllerForIcon:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          uint64_t v12 = [v11 view];
          char v13 = [v12 containsView:v4];

          if (v13)
          {
            BOOL v14 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 0;
LABEL_12:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)widgetHostViewControllerForComplicationDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(PRWidgetGridViewController *)self model];
  uint64_t v6 = [v5 listModel];

  uint64_t v7 = [v4 uniqueIdentifier];

  uint64_t v8 = [v6 indexForIconWithIdentifier:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
  }
  else
  {
    id v10 = [v6 iconAtIndex:v8];
    uint64_t v11 = [(PRWidgetGridViewController *)self _widgetIconViewControllerForIcon:v10];
    uint64_t v9 = [v11 widgetHostViewController];
  }
  return v9;
}

- (void)setFocused:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_focused != a3)
  {
    BOOL v3 = a3;
    self->_focused = a3;
    id v5 = [(PRWidgetGridViewController *)self listView];
    [v5 setEditing:v3];

    uint64_t v6 = [(PRWidgetGridViewController *)self listView];
    [v6 updateEditingStateAnimated:1];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [(PRWidgetGridViewController *)self listView];
    uint64_t v8 = [v7 icons];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      uint64_t v12 = v3 ^ 1;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v14 = [(PRWidgetGridViewController *)self _widgetIconViewControllerForIcon:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          [v14 setBackgroundHidden:v12];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)setFocused:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    uint64_t v6 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.3];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  [(PRWidgetGridViewController *)self setFocused:v4 animationSettings:v6];
}

- (void)setFocused:(BOOL)a3 animationSettings:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PRWidgetGridViewController_setFocused_animationSettings___block_invoke;
  v4[3] = &unk_1E54DB3F0;
  v4[4] = self;
  BOOL v5 = a3;
  [MEMORY[0x1E4F4F898] animateWithSettings:a4 actions:v4];
}

uint64_t __59__PRWidgetGridViewController_setFocused_animationSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFocused:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setVibrancyConfiguration:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(PRWidgetGridViewController *)self listView];
  id v7 = [v6 icons];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [(PRWidgetGridViewController *)self _widgetIconViewControllerForIcon:*(void *)(*((void *)&v13 + 1) + 8 * v11)];
        [v12 setVibrancyConfiguration:v5];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)setIconContentScale:(double)a3
{
  [MEMORY[0x1E4F5E4A8] interComplicationSpacingExcludingInnerInset];
  double v6 = v5 * a3;
  id v7 = [(PRWidgetGridViewController *)self listView];
  objc_msgSend(v7, "setIconSpacing:", v6, v6);

  id v8 = [(PRWidgetGridViewController *)self listView];
  [v8 setIconContentScale:a3];
}

- (double)iconContentScale
{
  v2 = [(PRWidgetGridViewController *)self listView];
  [v2 iconContentScale];
  double v4 = v3;

  return v4;
}

- (void)setWidgetInteractionDisabled:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_widgetInteractionDisabled != a3)
  {
    self->_widgetInteractionDisabled = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v4 = [(PRWidgetGridViewController *)self listView];
    double v5 = [v4 icons];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [(PRWidgetGridViewController *)self _widgetIconViewControllerForIcon:*(void *)(*((void *)&v11 + 1) + 8 * i)];
          objc_msgSend(v10, "setWidgetInteractionDisabled:", -[PRWidgetGridViewController _shouldDisableWidgetInteraction](self, "_shouldDisableWidgetInteraction"));
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (id)_widgetIconViewControllerForIcon:(id)a3
{
  id v4 = a3;
  double v5 = [(PRWidgetGridViewController *)self listView];
  uint64_t v6 = [v5 displayedIconViewForIcon:v4];

  uint64_t v7 = [v6 customIconImageViewController];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (void)_tapGestureRecognized:(id)a3
{
  id v4 = [(PRWidgetGridViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PRWidgetGridViewController *)self delegate];
    [v6 widgetGridViewControllerDidTapBackground:self];
  }
}

- (BOOL)_shouldDisableWidgetInteraction
{
  if ([(PRWidgetGridViewController *)self isWidgetInteractionDisabled]) {
    return 1;
  }
  return [(PRWidgetGridViewController *)self requiresFocusForLaunchRequests];
}

- (void)invalidate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = [(PRWidgetGridViewController *)self listView];
  id v4 = [v3 icons];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(PRWidgetGridViewController *)self _widgetIconViewControllerForIcon:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        [v9 invalidate];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(PRWidgetGridViewController *)self model];
  [v10 invalidate];
}

- (void)widgetHostViewController:(id)a3 requestsLaunchWithAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PRWidgetGridViewController *)self model];
  uint64_t v9 = [v8 complicationDescriptors];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__PRWidgetGridViewController_widgetHostViewController_requestsLaunchWithAction___block_invoke;
  v14[3] = &unk_1E54DBC00;
  id v10 = v6;
  id v15 = v10;
  long long v11 = objc_msgSend((id)v9, "bs_firstObjectPassingTest:", v14);

  long long v12 = [(PRWidgetGridViewController *)self delegate];
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if (v9)
  {
    long long v13 = [(PRWidgetGridViewController *)self delegate];
    [v13 widgetGridViewController:self didRequestLaunchForComplicationDescriptor:v11 withAction:v7];
  }
}

uint64_t __80__PRWidgetGridViewController_widgetHostViewController_requestsLaunchWithAction___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 widgetConfigurationIdentifier];
  uint64_t v5 = [v3 uniqueIdentifier];

  uint64_t v6 = BSEqualObjects();
  return v6;
}

- (void)handleLaunchRequestForIcon:(id)a3
{
  id v4 = [(PRWidgetGridViewController *)self _widgetIconViewControllerForIcon:a3];
  id v3 = [v4 widgetHostViewController];
  [v3 requestLaunch];
}

- (void)performAnimatedInsertionForIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PRWidgetGridViewController *)self listView];
  [v5 layoutAndCreateIcon:v4];

  uint64_t v6 = [(PRWidgetGridViewController *)self listView];
  [v6 markIcon:v4 asNeedingAnimation:1];

  id v7 = [(PRWidgetGridViewController *)self listView];
  [v7 layoutIconsIfNeededWithAnimationType:0 options:0];
}

- (void)performAnimatedRemovalForIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PRWidgetGridViewController *)self listView];
  id v8 = [v5 displayedIconViewForIcon:v4];

  [v8 setAllowsEditingAnimation:0];
  uint64_t v6 = [(PRWidgetGridViewController *)self listView];
  [v6 markIcon:v4 asNeedingAnimation:0];

  id v7 = [(PRWidgetGridViewController *)self listView];
  [v7 layoutIconsIfNeededWithAnimationType:0 options:0];
}

- (void)widgetIconViewControllerDidReceiveTap:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PRWidgetGridViewController *)self isFocused];
  uint64_t v6 = [(PRWidgetGridViewController *)self delegate];
  if (v5)
  {
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(PRWidgetGridViewController *)self model];
      uint64_t v9 = [v4 widgetHostViewController];
      id v10 = [v9 widgetConfigurationIdentifier];
      long long v11 = [v8 complicationDescriptorForIdentifier:v10];

      if (!v11)
      {
        long long v11 = [v4 complicationDescriptor];
        long long v12 = PRLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[PRWidgetGridViewController widgetIconViewControllerDidReceiveTap:](v4);
        }
      }
      long long v13 = [(PRWidgetGridViewController *)self delegate];
      [v13 widgetGridViewController:self didRequestConfigurationForComplicationDescriptor:v11];

      goto LABEL_10;
    }
  }
  else
  {
    int v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      long long v11 = [(PRWidgetGridViewController *)self delegate];
      [v11 widgetGridViewControllerDidTapBackground:self];
LABEL_10:
    }
  }
}

- (id)iconViewMap
{
  iconViewMap = self->_iconViewMap;
  if (!iconViewMap)
  {
    id v4 = (SBHReusableViewMap *)[objc_alloc(MEMORY[0x1E4FA6310]) initWithDelegate:self];
    BOOL v5 = self->_iconViewMap;
    self->_iconViewMap = v4;

    iconViewMap = self->_iconViewMap;
  }
  return iconViewMap;
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  id v4 = [(PRWidgetGridViewController *)self iconViewMap];
  BOOL v5 = [v4 dequeueReusableViewOfClass:a3];

  return v5;
}

- (void)recycleIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(PRWidgetGridViewController *)self iconViewMap];
  [v5 recycleView:v4];
}

- (BOOL)isIconViewRecycled:(id)a3
{
  id v4 = a3;
  id v5 = [(PRWidgetGridViewController *)self iconViewMap];
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

- (UIView)recycledViewsContainer
{
  recycledViewsContainerView = self->_recycledViewsContainerView;
  if (!recycledViewsContainerView)
  {
    id v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v5 = self->_recycledViewsContainerView;
    self->_recycledViewsContainerView = v4;

    [(UIView *)self->_recycledViewsContainerView setHidden:1];
    [(UIView *)self->_recycledViewsContainerView setAlpha:0.0];
    [(UIView *)self->_recycledViewsContainerView setUserInteractionEnabled:0];
    char v6 = [(PRWidgetGridViewController *)self view];
    [v6 addSubview:self->_recycledViewsContainerView];

    recycledViewsContainerView = self->_recycledViewsContainerView;
  }
  return recycledViewsContainerView;
}

- (id)customImageViewControllerForIconView:(id)a3
{
  id v4 = [a3 icon];
  id v5 = [v4 leafIdentifier];

  char v6 = [(PRWidgetGridViewController *)self model];
  char v7 = [v6 complicationDescriptorForIdentifier:v5];

  if (v7)
  {
    if ([(PRWidgetGridViewController *)self presentationMode] == 3) {
      unint64_t v8 = 2;
    }
    else {
      unint64_t v8 = [(PRWidgetGridViewController *)self presentationMode];
    }
    uint64_t v9 = [[PRWidgetIconViewController alloc] initWithComplicationDescriptor:v7 contentType:[(PRWidgetGridViewController *)self contentType] presentationMode:v8];
    [(PRWidgetIconViewController *)v9 setBackgroundHidden:[(PRWidgetGridViewController *)self isFocused] ^ 1];
    [(PRWidgetIconViewController *)v9 setWidgetInteractionDisabled:[(PRWidgetGridViewController *)self _shouldDisableWidgetInteraction]];
    id v10 = [(PRWidgetGridViewController *)self vibrancyConfiguration];
    [(PRWidgetIconViewController *)v9 setVibrancyConfiguration:v10];

    [(PRWidgetIconViewController *)v9 setDelegate:self];
    long long v11 = [(PRWidgetIconViewController *)v9 widgetHostViewController];
    [v11 setDelegate:self];

    long long v12 = [v7 widget];
    long long v13 = PRSharedWidgetDescriptorProvider();
    int v14 = [v13 descriptorForPersonality:v12];

    uint64_t v15 = [v14 intentType];
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      long long v17 = [v12 intentReference];
      uint64_t v18 = [v17 intent];

      if (!v18)
      {
        long long v19 = [v14 defaultIntentReference];
        uint64_t v20 = [v19 intent];

        if (v20)
        {
          uint64_t v21 = [(PRWidgetIconViewController *)v9 widgetHostViewController];
          id v22 = [v12 widgetByReplacingIntent:v20];
          [v7 setWidget:v22];
          [v21 setWidget:v22];
        }
        else
        {
          uint64_t v21 = PRLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[PRWidgetGridViewController customImageViewControllerForIconView:](v12);
          }
        }
      }
    }
    if ([(PRWidgetGridViewController *)self presentationMode] == 3
      && (objc_msgSend(v12, "pr_isWorldClockWidget") & 1) == 0)
    {
      uint64_t v23 = [(PRWidgetIconViewController *)v9 widgetHostViewController];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __67__PRWidgetGridViewController_customImageViewControllerForIconView___block_invoke;
      v26[3] = &unk_1E54DBBB0;
      id v27 = v12;
      id v28 = v23;
      id v24 = v23;
      [v24 ensureContentWithTimeout:v26 completion:10.0];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __67__PRWidgetGridViewController_customImageViewControllerForIconView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = PRLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__PRWidgetGridViewController_customImageViewControllerForIconView___block_invoke_cold_1(a1);
    }
  }
  dispatch_time_t v5 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PRWidgetGridViewController_customImageViewControllerForIconView___block_invoke_41;
  block[3] = &unk_1E54DAFB8;
  id v7 = *(id *)(a1 + 40);
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
}

uint64_t __67__PRWidgetGridViewController_customImageViewControllerForIconView___block_invoke_41(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPresentationMode:3];
}

- (int64_t)closeBoxTypeForIconView:(id)a3
{
  return 1;
}

- (id)iconDragManager:(id)a3 dragItemsForIconView:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(PRWidgetGridViewController *)self isFocused])
  {
    char v6 = [v5 icon];
    id v7 = SBHIconDragItemWithIconAndIconView();
    v10[0] = v7;
    unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5
{
  return 0;
}

- (id)iconDragManager:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7
{
  id v8 = a4;
  uint64_t v9 = [(PRWidgetGridViewController *)self model];
  id v10 = [v8 icon];
  long long v11 = [v10 leafIdentifier];
  long long v12 = [v9 complicationDescriptorForIdentifier:v11];

  if (v12)
  {
    long long v13 = [v8 customIconImageViewController];
    uint64_t v14 = objc_opt_class();
    id v15 = v13;
    if (v14)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    id v18 = v16;

    long long v19 = [v18 widgetHostViewController];

    uint64_t v20 = [PRComplicationDragPreviewView alloc];
    uint64_t v21 = [v19 view];
    id v22 = [(PRComplicationDragPreviewView *)v20 initWithWidgetHostView:v21];

    id v23 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    id v24 = [MEMORY[0x1E4FB1618] clearColor];
    [v23 setBackgroundColor:v24];

    id v25 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
    [v23 setShadowPath:v25];

    long long v26 = [v8 customIconImageViewController];
    id v27 = [v26 view];
    [v27 frame];
    BSRectGetCenter();
    double v29 = v28;
    double v31 = v30;

    id v32 = objc_alloc(MEMORY[0x1E4FB1B38]);
    long long v33 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v36[0] = *MEMORY[0x1E4F1DAB8];
    v36[1] = v33;
    v36[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v34 = objc_msgSend(v32, "initWithContainer:center:transform:", v8, v36, v29, v31);
    long long v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v22 parameters:v23 target:v34];
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

- (void)iconCloseBoxTapped:(id)a3
{
  id v4 = [a3 icon];
  id v9 = [v4 leafIdentifier];

  id v5 = [(PRWidgetGridViewController *)self model];
  char v6 = [v5 complicationDescriptorForIdentifier:v9];

  id v7 = [(PRWidgetGridViewController *)self model];
  id v8 = (id)[v7 removeComplicationDescriptor:v6];
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v4 = a4;
  id v5 = self;
  id v8 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      char v6 = v8;
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }
  id v7 = v6;

  [v7 invalidate];
}

- (id)rootFolderForIconDragManager:(id)a3
{
  id v3 = [(PRWidgetGridViewController *)self model];
  id v4 = [v3 rootFolder];

  return v4;
}

- (BOOL)isEditing
{
  return 1;
}

- (BOOL)allowsSnappingIconsToGridForIconDragManager:(id)a3
{
  return 1;
}

- (BOOL)iconDragManager:(id)a3 canSnapIconsToGridInLocation:(id)a4
{
  id v4 = [(PRWidgetGridViewController *)self model];
  BOOL v5 = [v4 type] == 1;

  return v5;
}

- (BOOL)shouldNonDefaultGridSizeClassesUseClusterAnimationForIconDragManager:(id)a3
{
  return 0;
}

- (BOOL)iconDragManager:(id)a3 canMakeIconViewDragRecipient:(id)a4
{
  return 0;
}

- (void)iconDragManager:(id)a3 didEndDragWithResult:(id)a4
{
  if ((unint64_t)(objc_msgSend(a4, "dragRejectionReason", a3) - 5) <= 1)
  {
    id v5 = [(PRWidgetGridViewController *)self delegate];
    [v5 widgetGridViewController:self isAttemptingDragToAddComplication:0];
  }
}

- (unint64_t)iconDragManager:(id)a3 willMoveDragPlaceholderToGridCellIndex:(unint64_t)a4 inIconListView:(id)a5 draggedIcons:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  long long v11 = [(PRWidgetGridViewController *)self model];
  uint64_t v12 = [v11 type];

  if (!v12)
  {
    uint64_t v14 = [v10 firstObject];
    uint64_t v15 = objc_opt_class();
    id v16 = v14;
    if (v15)
    {
      if (objc_opt_isKindOfClass()) {
        long long v17 = v16;
      }
      else {
        long long v17 = 0;
      }
    }
    else
    {
      long long v17 = 0;
    }
    id v18 = v17;

    long long v19 = [v18 gridSizeClass];
    uint64_t v20 = PRWidgetFamilyForIconGridSizeClass(v19);

    uint64_t v21 = [v9 icons];
    int v22 = [v21 containsObject:v18];

    id v23 = [v9 icons];
    id v24 = objc_msgSend(v23, "bs_filter:", &__block_literal_global_20);
    uint64_t v25 = [v24 count];

    if (v20 == 11)
    {
      if (v25 == v22) {
        a4 = 0;
      }
    }
    else
    {
      long long v26 = [v9 icons];
      id v27 = objc_msgSend(v26, "bs_filter:", &__block_literal_global_52_0);
      uint64_t v28 = [v27 count];

      double v29 = [v9 model];
      unsigned __int16 v30 = [v29 gridSize];

      if (v25)
      {
        if (v28 == v22)
        {
          a4 = v30 - 1;
        }
        else if (!a4)
        {
          a4 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
  }

  return a4;
}

BOOL __113__PRWidgetGridViewController_iconDragManager_willMoveDragPlaceholderToGridCellIndex_inIconListView_draggedIcons___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 gridSizeClass];

  uint64_t v8 = PRWidgetFamilyForIconGridSizeClass(v7);
  return v8 == 11;
}

BOOL __113__PRWidgetGridViewController_iconDragManager_willMoveDragPlaceholderToGridCellIndex_inIconListView_draggedIcons___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 gridSizeClass];

  uint64_t v8 = PRWidgetFamilyForIconGridSizeClass(v7);
  return v8 == 10;
}

- (id)_descriptorFromWidgetIcon:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [v3 activeWidget];
    id v5 = [v3 gridSizeClass];

    uint64_t v6 = PRWidgetFamilyForIconGridSizeClass(v5);
    id v7 = objc_alloc(MEMORY[0x1E4F58DD8]);
    uint64_t v8 = [v4 extensionBundleIdentifier];
    id v9 = [v4 containerBundleIdentifier];
    id v10 = [v4 kind];
    long long v11 = (void *)[v7 initWithExtensionBundleIdentifier:v8 containerBundleIdentifier:v9 kind:v10 family:v6 intent:0];

    uint64_t v12 = [PRComplicationDescriptor alloc];
    long long v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];
    uint64_t v15 = [(PRComplicationDescriptor *)v12 initWithUniqueIdentifier:v14 widget:v11];
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (BOOL)containsIconsInRow:(unint64_t)a3
{
  id v4 = [(PRWidgetGridViewController *)self listView];
  id v5 = [v4 model];

  uint64_t v6 = [v5 gridCellInfoWithOptions:0];
  unsigned __int16 v7 = [v6 gridSize];
  unint64_t v8 = v7;
  if (v7)
  {
    unint64_t v9 = v7 * a3;
    if ([v6 iconIndexForGridCellIndex:v9] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = 1;
      do
      {
        unint64_t v11 = v10;
        if (v8 == v10) {
          break;
        }
        uint64_t v12 = [v6 iconIndexForGridCellIndex:v9 + v10];
        uint64_t v10 = v11 + 1;
      }
      while (v12 == 0x7FFFFFFFFFFFFFFFLL);
      BOOL v13 = v11 < v8;
    }
    else
    {
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (PRWidgetGridModel)model
{
  return self->_model;
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (SBIconDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
}

- (BOOL)requiresFocusForLaunchRequests
{
  return self->_requiresFocusForLaunchRequests;
}

- (void)setRequiresFocusForLaunchRequests:(BOOL)a3
{
  self->_requiresFocusForLaunchRequests = a3;
}

- (BOOL)isWidgetInteractionDisabled
{
  return self->_widgetInteractionDisabled;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (PRWidgetGridViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRWidgetGridViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBIconListView)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (void)setIconViewProvider:(id)a3
{
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (SBHIconGridSize)gridSize
{
  return self->_gridSize;
}

- (void)setGridSize:(SBHIconGridSize)a3
{
  self->_gridSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_recycledViewsContainerView, 0);
  objc_storeStrong((id *)&self->_iconViewMap, 0);
}

void __66__PRWidgetGridViewController_ensureContentWithTimeout_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Error loading content for host view controller %@ - %@", (uint8_t *)&v4, 0x16u);
}

- (void)widgetIconViewControllerDidReceiveTap:(void *)a1 .cold.1(void *a1)
{
  __int16 v6 = [a1 widgetHostViewController];
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);
}

- (void)customImageViewControllerForIconView:(void *)a1 .cold.1(void *a1)
{
  os_log_t v2 = [a1 extensionIdentity];
  os_log_type_t v3 = [v2 extensionBundleIdentifier];
  unint64_t v9 = [a1 kind];
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x16u);
}

void __67__PRWidgetGridViewController_customImageViewControllerForIconView___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v2 = [*(id *)(a1 + 32) extensionIdentity];
  os_log_type_t v3 = [v2 extensionBundleIdentifier];
  unint64_t v9 = [*(id *)(a1 + 32) kind];
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);
}

@end