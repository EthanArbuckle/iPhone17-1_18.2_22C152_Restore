@interface SBHWidgetWrapperViewController
- (BOOL)forcesEdgeAntialiasing;
- (BOOL)isDragging;
- (BOOL)titleAndSubtitleVisible;
- (BOOL)usesAmbientScaleFactorForRemovableBackgroundItems;
- (CGAffineTransform)contentTransform;
- (CGAffineTransform)shadowTransform;
- (CGSize)contentSize;
- (NSArray)supportedSizeClasses;
- (SBHAddWidgetSheetGalleryItem)galleryItem;
- (SBHWidgetStyleManager)widgetStyleManager;
- (SBHWidgetWrapperViewController)initWithGalleryItem:(id)a3 titleAndSubtitleVisible:(BOOL)a4 listLayoutProvider:(id)a5 iconViewProvider:(id)a6;
- (SBHWidgetWrapperViewControllerDelegate)delegate;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconView)iconView;
- (SBIconViewProviding)iconViewProvider;
- (id)_widgetBackgroundViewConfigurator;
- (id)_widgetBackgroundViewProvider;
- (id)_widgetDragHandler;
- (id)defaultBackgroundViewConfigurator;
- (id)defaultBackgroundViewProvider;
- (id)effectiveIconImageAppearance;
- (id)effectiveIconImageStyleConfiguration;
- (int64_t)backgroundType;
- (int64_t)selectedSizeClass;
- (int64_t)wrapperViewBackgroundType;
- (unint64_t)indexOfSelectedSizeClass;
- (void)_configureCustomImageViewController:(id)a3 iconView:(id)a4;
- (void)_configureIconView:(id)a3 forIcon:(id)a4;
- (void)_removeIconViewKeepObserving:(BOOL)a3;
- (void)_updateAvocadoHostViewController;
- (void)_userInterfaceStyleDidChange;
- (void)dealloc;
- (void)iconTapped:(id)a3;
- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4;
- (void)iconViewDidEndDrag:(id)a3;
- (void)iconViewWillBeginDrag:(id)a3;
- (void)loadView;
- (void)setBackgroundType:(int64_t)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentTransform:(CGAffineTransform *)a3;
- (void)setDefaultBackgroundViewConfigurator:(id)a3;
- (void)setDefaultBackgroundViewProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragging:(BOOL)a3;
- (void)setForcesEdgeAntialiasing:(BOOL)a3;
- (void)setGalleryItem:(id)a3;
- (void)setIndexOfSelectedSizeClass:(unint64_t)a3;
- (void)setSelectedSizeClass:(int64_t)a3;
- (void)setShadowTransform:(CGAffineTransform *)a3;
- (void)setTitleAndSubtitleVisible:(BOOL)a3;
- (void)setUpWidgetStyleManagerForIconView:(id)a3;
- (void)setUsesAmbientScaleFactorForRemovableBackgroundItems:(BOOL)a3;
- (void)setWidgetStyleManager:(id)a3;
- (void)widgetStyleManager:(id)a3 needsToAddBackgroundView:(id)a4;
- (void)widgetStyleManager:(id)a3 needsToAddFilter:(id)a4;
- (void)widgetStyleManager:(id)a3 needsToRemoveBackgroundView:(id)a4;
- (void)widgetStyleManager:(id)a3 needsToRemoveFilter:(id)a4;
@end

@implementation SBHWidgetWrapperViewController

- (SBHWidgetWrapperViewController)initWithGalleryItem:(id)a3 titleAndSubtitleVisible:(BOOL)a4 listLayoutProvider:(id)a5 iconViewProvider:(id)a6
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)SBHWidgetWrapperViewController;
  v14 = [(SBHWidgetWrapperViewController *)&v34 initWithNibName:0 bundle:0];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_galleryItem, a3);
    v15->_titleAndSubtitleVisible = a4;
    objc_storeStrong((id *)&v15->_listLayoutProvider, a5);
    objc_storeWeak((id *)&v15->_iconViewProvider, v13);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int8x8_t v17 = (int8x8_t)objc_msgSend(v11, "sbh_supportedSizeClasses");
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v31 = __114__SBHWidgetWrapperViewController_initWithGalleryItem_titleAndSubtitleVisible_listLayoutProvider_iconViewProvider___block_invoke;
    v32 = &unk_1E6AAD858;
    v18 = (NSArray *)v16;
    v33 = v18;
    v19 = v30;
    if (v17)
    {
      id v29 = v12;
      char v35 = 0;
      uint8x8_t v20 = (uint8x8_t)vcnt_s8(v17);
      v20.i16[0] = vaddlv_u8(v20);
      int v21 = v20.i32[0];
      if (v20.i32[0])
      {
        unint64_t v22 = 0;
        do
        {
          if (((1 << v22) & *(void *)&v17) != 0)
          {
            ((void (*)(void *))v31)(v19);
            if (v35) {
              break;
            }
            --v21;
          }
          if (v22 > 0x3E) {
            break;
          }
          ++v22;
        }
        while (v21 > 0);
      }
      id v12 = v29;
    }

    supportedSizeClasses = v15->_supportedSizeClasses;
    v15->_supportedSizeClasses = v18;
    v24 = v18;

    v15->_indexOfSelectedSizeClass = 0;
    v15->_usesAmbientScaleFactorForRemovableBackgroundItems = 0;
    v25 = self;
    v36[0] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    id v27 = (id)[(SBHWidgetWrapperViewController *)v15 registerForTraitChanges:v26 withAction:sel__userInterfaceStyleDidChange];
  }
  return v15;
}

void __114__SBHWidgetWrapperViewController_initWithGalleryItem_titleAndSubtitleVisible_listLayoutProvider_iconViewProvider___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 <= 0xB && ((1 << a3) & 0xC5E) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(NSNumber, "numberWithInt:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v4 addObject:v5];
  }
}

- (void)loadView
{
  id v5 = [[SBHWidgetWrapperView alloc] initWithTitleAndSubtitleVisible:self->_titleAndSubtitleVisible];
  uint64_t v3 = [(SBHAddWidgetSheetGalleryItem *)self->_galleryItem sbh_appName];
  [(SBHWidgetWrapperView *)v5 setTitle:v3];

  v4 = [(SBHAddWidgetSheetGalleryItem *)self->_galleryItem sbh_widgetName];
  [(SBHWidgetWrapperView *)v5 setSubtitle:v4];

  [(SBHWidgetWrapperView *)v5 setBackgroundType:[(SBHWidgetWrapperViewController *)self wrapperViewBackgroundType]];
  [(SBHWidgetWrapperViewController *)self setView:v5];
  [(SBHWidgetWrapperViewController *)self _updateAvocadoHostViewController];
}

- (void)dealloc
{
  [(SBHWidgetWrapperViewController *)self _removeIconViewKeepObserving:0];
  v3.receiver = self;
  v3.super_class = (Class)SBHWidgetWrapperViewController;
  [(SBHWidgetWrapperViewController *)&v3 dealloc];
}

- (int64_t)selectedSizeClass
{
  v2 = [(NSArray *)self->_supportedSizeClasses objectAtIndex:self->_indexOfSelectedSizeClass];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setSelectedSizeClass:(int64_t)a3
{
  if ([(SBHWidgetWrapperViewController *)self selectedSizeClass] != a3)
  {
    supportedSizeClasses = self->_supportedSizeClasses;
    v6 = [NSNumber numberWithInteger:a3];
    uint64_t v7 = [(NSArray *)supportedSizeClasses indexOfObject:v6];

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = SBLogWidgets();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(SBHWidgetWrapperViewController *)a3 setSelectedSizeClass:v8];
      }

      uint64_t v7 = 0;
    }
    [(SBHWidgetWrapperViewController *)self setIndexOfSelectedSizeClass:v7];
  }
}

- (void)setIndexOfSelectedSizeClass:(unint64_t)a3
{
  if (self->_indexOfSelectedSizeClass != a3)
  {
    self->_indexOfSelectedSizeClass = a3;
    [(SBHWidgetWrapperViewController *)self _updateAvocadoHostViewController];
    id v4 = [(SBHWidgetWrapperViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 wrapperViewControllerSelectedSizeClassChanged:self];
    }
  }
}

- (void)setGalleryItem:(id)a3
{
  id v5 = a3;
  if ((-[SBHAddWidgetSheetGalleryItem isEqual:](self->_galleryItem, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_galleryItem, a3);
    [(SBHWidgetWrapperViewController *)self _updateAvocadoHostViewController];
  }
}

- (void)setDragging:(BOOL)a3
{
  if (self->_dragging != a3)
  {
    self->_dragging = a3;
    [(SBHWidgetWrapperViewController *)self _updateAvocadoHostViewController];
  }
}

- (void)setForcesEdgeAntialiasing:(BOOL)a3
{
  if (self->_forcesEdgeAntialiasing != a3)
  {
    self->_forcesEdgeAntialiasing = a3;
    id v4 = [(SBIconView *)self->_iconView customIconImageViewController];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(SBIconView *)self->_iconView customIconImageViewController];
      [v6 setForcesEdgeAntialiasing:self->_forcesEdgeAntialiasing];
    }
  }
}

- (void)setBackgroundType:(int64_t)a3
{
  if (self->_backgroundType != a3)
  {
    self->_backgroundType = a3;
    if ([(SBHWidgetWrapperViewController *)self isViewLoaded])
    {
      id v4 = [(SBHWidgetWrapperViewController *)self wrapperView];
      objc_msgSend(v4, "setBackgroundType:", -[SBHWidgetWrapperViewController wrapperViewBackgroundType](self, "wrapperViewBackgroundType"));
    }
  }
}

- (void)_removeIconViewKeepObserving:(BOOL)a3
{
  char v5 = [(SBHWidgetWrapperViewController *)self wrapperView];
  iconView = self->_iconView;
  if (iconView)
  {
    v10 = v5;
    if (!a3)
    {
      [(SBIconView *)iconView removeObserver:self];
      char v5 = v10;
    }
    [v5 setContentView:0];
    uint64_t v7 = self->_iconView;
    self->_iconView = 0;

    id defaultBackgroundViewProvider = self->_defaultBackgroundViewProvider;
    self->_id defaultBackgroundViewProvider = 0;

    id defaultBackgroundViewConfigurator = self->_defaultBackgroundViewConfigurator;
    self->_id defaultBackgroundViewConfigurator = 0;

    char v5 = v10;
  }
}

- (id)effectiveIconImageAppearance
{
  v2 = [(SBHWidgetWrapperViewController *)self traitCollection];
  int64_t v3 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:", v2);

  return v3;
}

- (id)effectiveIconImageStyleConfiguration
{
  v2 = [(SBHWidgetWrapperViewController *)self traitCollection];
  int64_t v3 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageStyleConfigurationFromTraitCollection:", v2);

  return v3;
}

- (void)_updateAvocadoHostViewController
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "No SBIcon for descriptor: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)_configureIconView:(id)a3 forIcon:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  uint64_t v7 = [SBHMappedIconListLayoutProvider alloc];
  v8 = [(SBHWidgetWrapperViewController *)self listLayoutProvider];
  v9 = [(SBHMappedIconListLayoutProvider *)v7 initWithTargetListLayoutProvider:v8];

  [(SBHMappedIconListLayoutProvider *)v9 mapIconLocation:@"SBIconLocationAddWidgetSheet" toIconLocation:@"SBIconLocationRoot"];
  [v25 setLocation:@"SBIconLocationAddWidgetSheet"];
  [v25 setListLayoutProvider:v9];
  v10 = [v6 gridSizeClass];
  id v11 = v10;
  if (v10 != @"SBHIconGridSizeClassDefault" && (-[__CFString isEqualToString:](v10, "isEqualToString:") & 1) == 0)
  {
    id v12 = [(SBHWidgetWrapperViewController *)self listLayoutProvider];
    id v13 = [v12 layoutForIconLocation:@"SBIconLocationRoot"];

    objc_msgSend(v25, "setIconImageInfo:", SBHIconListLayoutIconImageInfoForGridSizeClass(v13, v11));
  }
  [v25 addObserver:self];
  v14 = [(SBHWidgetWrapperViewController *)self iconViewProvider];
  [v14 configureIconView:v25 forIcon:v6];

  [v25 setOverrideActionDelegate:self];
  [v25 setCustomIconImageViewHitTestingDisabled:1];
  [v25 setStartsDragMoreQuickly:1];
  [v25 setIcon:v6];
  [v25 iconViewSize];
  BSRectWithSize();
  objc_msgSend(v25, "setBounds:");
  id defaultBackgroundViewProvider = self->_defaultBackgroundViewProvider;
  self->_id defaultBackgroundViewProvider = 0;

  id v16 = [v25 customIconImageViewController];
  if (objc_opt_respondsToSelector())
  {
    int8x8_t v17 = [v16 backgroundViewProvider];
    v18 = (void *)[v17 copy];
    id v19 = self->_defaultBackgroundViewProvider;
    self->_id defaultBackgroundViewProvider = v18;
  }
  if (objc_opt_respondsToSelector())
  {
    uint8x8_t v20 = [(SBHWidgetWrapperViewController *)self _widgetBackgroundViewProvider];
    [v16 setBackgroundViewProvider:v20];
  }
  if (objc_opt_respondsToSelector())
  {
    int v21 = [v16 backgroundViewConfigurator];
    unint64_t v22 = (void *)[v21 copy];
    id defaultBackgroundViewConfigurator = self->_defaultBackgroundViewConfigurator;
    self->_id defaultBackgroundViewConfigurator = v22;
  }
  if (objc_opt_respondsToSelector())
  {
    v24 = [(SBHWidgetWrapperViewController *)self _widgetBackgroundViewConfigurator];
    [v16 setBackgroundViewConfigurator:v24];
  }
}

- (id)_widgetBackgroundViewConfigurator
{
  objc_initWeak(&location, self);
  int v3 = _Block_copy(self->_defaultBackgroundViewConfigurator);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__SBHWidgetWrapperViewController__widgetBackgroundViewConfigurator__block_invoke;
  aBlock[3] = &unk_1E6AAD880;
  objc_copyWeak(&v10, &location);
  id v9 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = _Block_copy(v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

void __67__SBHWidgetWrapperViewController__widgetBackgroundViewConfigurator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v16 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v16;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  id v10 = [v9 underlyingBackgroundView];
  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v12 = [WeakRetained delegate];
    [v12 configureBackgroundView:v10 matchingMaterialBeneathWrapperViewController:WeakRetained];
  }
  if (*(void *)(a1 + 32))
  {
    id v13 = [v9 widgetBackgroundView];
    if (v13) {
      v14 = v13;
    }
    else {
      v14 = v16;
    }
    id v15 = v14;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_widgetBackgroundViewProvider
{
  int v3 = _Block_copy(self->_defaultBackgroundViewProvider);
  if (v3)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__SBHWidgetWrapperViewController__widgetBackgroundViewProvider__block_invoke;
    aBlock[3] = &unk_1E6AAD8A8;
    id v8 = v3;
    objc_copyWeak(&v9, &location);
    id v4 = _Block_copy(aBlock);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }
  else
  {
    id v4 = 0;
  }
  id v5 = _Block_copy(v4);

  return v5;
}

SBHWidgetWrapperBackgroundView *__63__SBHWidgetWrapperViewController__widgetBackgroundViewProvider__block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
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

  if (v6)
  {
    [v6 setBlurEnabled:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = [WeakRetained delegate];
    id v9 = [v8 backgroundViewMatchingMaterialBeneathWrapperViewController:WeakRetained];

    id v10 = [[SBHWidgetWrapperBackgroundView alloc] initWithUnderlyingBackgroundView:v9 widgetBackgroundView:v6];
  }
  else
  {
    id v10 = (SBHWidgetWrapperBackgroundView *)v4;
  }

  return v10;
}

- (id)_widgetDragHandler
{
  uint64_t v2 = [(SBHWidgetWrapperViewController *)self delegate];
  uint64_t v3 = [v2 widgetDragHandler];

  return v3;
}

- (void)_configureCustomImageViewController:(id)a3 iconView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector()) {
    [v6 setForcesEdgeAntialiasing:self->_forcesEdgeAntialiasing];
  }
  uint64_t v8 = objc_opt_class();
  id v23 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v23;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  [v10 setHighlightsAtAnySize:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 setAlwaysShowsAsStack:1];
    id v11 = [(SBHWidgetWrapperViewController *)self wrapperView];
    [v11 setExtraSpacingBetweenWidgetAndTitle:5.0];
  }
  if (self->_usesAmbientScaleFactorForRemovableBackgroundItems)
  {
    [v7 setIconContentScalingEnabled:1];
    id v12 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    double v14 = 1.0;
    if (isKindOfClass)
    {
      id v15 = [v23 contentViewController];
      id v16 = self;
      char v17 = objc_opt_isKindOfClass();

      if (v17)
      {
        v18 = [v15 metrics];
        [v18 scaleFactor];
        double v14 = v19;
      }
    }
    uint8x8_t v20 = [(SBHWidgetWrapperViewController *)self galleryItem];
    int v21 = objc_msgSend(v20, "sbh_supportsRemovableBackgroundOrAccessoryFamilies");

    double v22 = 1.05;
    if (!v21) {
      double v22 = 1.0;
    }
    [v7 setIconContentScale:1.0 / (v14 * v22)];
  }
  [(SBHWidgetWrapperViewController *)self setUpWidgetStyleManagerForIconView:v7];
}

- (void)setUpWidgetStyleManagerForIconView:(id)a3
{
  id v15 = a3;
  id v4 = [v15 customIconImageViewController];
  if (v4)
  {
    id v5 = [v15 icon];
    if ([v5 isWidgetIcon]) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    uint64_t v8 = [v7 activeDataSource];
    id v9 = [v5 gridSizeClass];

    [v15 iconImageInfo];
    double v14 = -[SBHWidgetStyleManager initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:delegate:]([SBHWidgetStyleManager alloc], "initWithWidgetViewController:widgetDataSource:gridSizeClass:iconImageInfo:delegate:", v4, v8, v9, self, v10, v11, v12, v13);
    [(SBHWidgetWrapperViewController *)self setWidgetStyleManager:v14];
  }
}

- (int64_t)wrapperViewBackgroundType
{
  int64_t v3 = [(SBHWidgetWrapperViewController *)self backgroundType];
  if (v3 == 2) {
    return [(SBHAddWidgetSheetGalleryItem *)self->_galleryItem sbh_supportsRemovableBackgroundOrAccessoryFamilies];
  }
  else {
    return v3 == 1;
  }
}

- (void)_userInterfaceStyleDidChange
{
  id v2 = [(SBIconView *)self->_iconView customIconImageViewController];
  if (objc_opt_respondsToSelector()) {
    [v2 evaluateBackground];
  }
}

- (void)iconTapped:(id)a3
{
  id v4 = [(SBHWidgetWrapperViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 iconTapped:self];
  }
}

- (void)iconViewWillBeginDrag:(id)a3
{
  id v4 = a3;
  [(SBHWidgetWrapperViewController *)self setDragging:1];
  id v6 = [(SBHWidgetWrapperViewController *)self _widgetDragHandler];
  id v5 = [v4 icon];

  [v6 didBeginDraggingWidgetIcon:v5];
}

- (void)iconViewDidEndDrag:(id)a3
{
  id v6 = (SBIconView *)a3;
  [(SBHWidgetWrapperViewController *)self setDragging:0];
  if (self->_iconView != v6) {
    [(SBIconView *)v6 removeObserver:self];
  }
  id v4 = [(SBHWidgetWrapperViewController *)self _widgetDragHandler];
  id v5 = [(SBIconView *)v6 icon];
  [v4 didEndDraggingWidgetIcon:v5];
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [v8 customIconImageViewController];
  if (v6) {
    [(SBHWidgetWrapperViewController *)self bs_removeChildViewController:v6];
  }
  if (v7)
  {
    [(SBHWidgetWrapperViewController *)self bs_addChildViewController:v7];
    [(SBHWidgetWrapperViewController *)self _configureCustomImageViewController:v7 iconView:v8];
  }
}

- (void)widgetStyleManager:(id)a3 needsToAddBackgroundView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHWidgetWrapperViewController *)self wrapperView];
  [v6 setBackgroundView:v5];
}

- (void)widgetStyleManager:(id)a3 needsToRemoveBackgroundView:(id)a4
{
  id v4 = [(SBHWidgetWrapperViewController *)self wrapperView];
  [v4 setBackgroundView:0];
}

- (void)widgetStyleManager:(id)a3 needsToAddFilter:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHWidgetWrapperViewController *)self iconView];
  id v7 = [v6 layer];

  objc_msgSend(v7, "sbh_addFilter:", v5);
}

- (void)widgetStyleManager:(id)a3 needsToRemoveFilter:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHWidgetWrapperViewController *)self iconView];
  id v8 = [v6 layer];

  id v7 = [v5 name];

  objc_msgSend(v8, "sbh_removeFilterWithName:", v7);
}

- (CGAffineTransform)contentTransform
{
  long long v3 = *(_OWORD *)&self[23].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[22].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[23].c;
  return self;
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_contentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_contentTransform.c = v4;
  *(_OWORD *)&self->_contentTransform.tx = v3;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (CGAffineTransform)shadowTransform
{
  long long v3 = *(_OWORD *)&self[24].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[23].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[24].c;
  return self;
}

- (void)setShadowTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_shadowTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_shadowTransform.c = v4;
  *(_OWORD *)&self->_shadowTransform.tx = v3;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (SBHAddWidgetSheetGalleryItem)galleryItem
{
  return self->_galleryItem;
}

- (NSArray)supportedSizeClasses
{
  return self->_supportedSizeClasses;
}

- (unint64_t)indexOfSelectedSizeClass
{
  return self->_indexOfSelectedSizeClass;
}

- (BOOL)forcesEdgeAntialiasing
{
  return self->_forcesEdgeAntialiasing;
}

- (BOOL)usesAmbientScaleFactorForRemovableBackgroundItems
{
  return self->_usesAmbientScaleFactorForRemovableBackgroundItems;
}

- (void)setUsesAmbientScaleFactorForRemovableBackgroundItems:(BOOL)a3
{
  self->_usesAmbientScaleFactorForRemovableBackgroundItems = a3;
}

- (SBHWidgetWrapperViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHWidgetWrapperViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (BOOL)titleAndSubtitleVisible
{
  return self->_titleAndSubtitleVisible;
}

- (void)setTitleAndSubtitleVisible:(BOOL)a3
{
  self->_titleAndSubtitleVisible = a3;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (id)defaultBackgroundViewProvider
{
  return self->_defaultBackgroundViewProvider;
}

- (void)setDefaultBackgroundViewProvider:(id)a3
{
}

- (id)defaultBackgroundViewConfigurator
{
  return self->_defaultBackgroundViewConfigurator;
}

- (void)setDefaultBackgroundViewConfigurator:(id)a3
{
}

- (SBHWidgetStyleManager)widgetStyleManager
{
  return self->_widgetStyleManager;
}

- (void)setWidgetStyleManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetStyleManager, 0);
  objc_storeStrong(&self->_defaultBackgroundViewConfigurator, 0);
  objc_storeStrong(&self->_defaultBackgroundViewProvider, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_supportedSizeClasses, 0);
  objc_storeStrong((id *)&self->_galleryItem, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
}

- (void)setSelectedSizeClass:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromWidgetFamily();
  uint64_t v6 = *(void *)(a2 + 1000);
  int v7 = 138543618;
  id v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1D7F0A000, a3, OS_LOG_TYPE_ERROR, "size class %{public}@ is not in the supported size classes for descriptor %{public}@", (uint8_t *)&v7, 0x16u);
}

@end