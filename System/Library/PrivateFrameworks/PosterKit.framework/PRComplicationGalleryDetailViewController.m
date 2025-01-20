@interface PRComplicationGalleryDetailViewController
- (BOOL)showsBackgroundView;
- (BOOL)showsCloseButton;
- (NSArray)pageViewControllers;
- (NSMutableDictionary)userInfo;
- (NSString)appName;
- (SBHApplicationWidgetCollection)applicationWidgetCollection;
- (SBHWidgetSheetViewControllerPresenter)presenter;
- (UIImage)iconImage;
- (unint64_t)addWidgetSheetLocation;
- (void)_updateContent;
- (void)_updateParallax;
- (void)complicationGalleryDetailPageViewController:(id)a3 didSelectWidgetIconView:(id)a4;
- (void)complicationGalleryView:(id)a3 didUpdateVisiblePagesWithAppearedBlock:(id)a4;
- (void)complicationGalleryViewDidTapClose:(id)a3;
- (void)loadView;
- (void)setAppName:(id)a3;
- (void)setApplicationWidgetCollection:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setPageViewControllers:(id)a3;
- (void)setShowsBackgroundView:(BOOL)a3;
- (void)setShowsCloseButton:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PRComplicationGalleryDetailViewController

- (void)loadView
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(PRComplicationGalleryDetailView);
  [(PRComplicationGalleryDetailView *)v3 setDelegate:self];
  [(PRComplicationGalleryDetailViewController *)self setView:v3];
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v28 = v3;
  id v29 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [(PRComplicationGalleryDetailView *)v3 addLayoutGuide:"addLayoutGuide:"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v4 = [(PRComplicationGalleryDetailViewController *)self applicationWidgetCollection];
  v5 = [v4 widgetDescriptors];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v11 = [(SBHAddWidgetSheetViewControllerBase *)self allowedWidgets];
        v12 = [(PRComplicationGalleryDetailViewController *)self applicationWidgetCollection];
        int v13 = [v12 isDisfavored];

        unint64_t v14 = [(PRComplicationGalleryDetailViewController *)self addWidgetSheetLocation];
        v15 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v16 = [v15 userInterfaceIdiom];

        if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        {
          if (v13) {
            uint64_t v17 = objc_msgSend(v10, "sbh_disfavoredSizeClassesForAddWidgetSheetLocation:", v14);
          }
          else {
            uint64_t v17 = objc_msgSend(v10, "sbh_favoredSizeClassesForAddWidgetSheetLocation:", v14);
          }
        }
        else
        {
          uint64_t v17 = objc_msgSend(v10, "sbh_supportedSizeClasses");
        }
        uint64_t v18 = v17;
        id v19 = v10;
        if (objc_msgSend(v19, "sbh_supportsRemovableBackgroundOrAccessoryFamilies"))
        {
          uint64_t v20 = v18 & v11;
          v21 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
          v22 = [v21 widgetDragHandler];

          v23 = [PRComplicationGalleryDetailPageViewController alloc];
          v24 = [(SBHAddWidgetSheetViewControllerBase *)self listLayoutProvider];
          v25 = [(SBHAddWidgetSheetViewControllerBase *)self iconViewProvider];
          v26 = [(PRComplicationGalleryDetailPageViewController *)v23 initWithGalleryItem:v19 listLayoutProvider:v24 iconViewProvider:v25 widgetDragHandler:v22 allowedFamilies:v20];

          [(PRComplicationGalleryDetailPageViewController *)v26 setDelegate:self];
          [(PRComplicationGalleryDetailPageViewController *)v26 setLayoutGuide:v29];
          [v31 addObject:v26];
          v27 = [(PRComplicationGalleryDetailPageViewController *)v26 view];
          [v30 addObject:v27];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v7);
  }

  [(PRComplicationGalleryDetailViewController *)self setPageViewControllers:v31];
  [(PRComplicationGalleryDetailView *)v28 setPages:v30];
  [(PRComplicationGalleryDetailViewController *)self _updateContent];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PRComplicationGalleryDetailViewController;
  [(PRComplicationGalleryDetailViewController *)&v5 viewWillAppear:a3];
  v4 = [(PRComplicationGalleryDetailViewController *)self view];
  [v4 layoutIfNeeded];

  [(PRComplicationGalleryDetailViewController *)self _updateParallax];
}

- (unint64_t)addWidgetSheetLocation
{
  return 1;
}

- (void)setAppName:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_appName, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    appName = self->_appName;
    self->_appName = v4;

    [(PRComplicationGalleryDetailViewController *)self _updateContent];
  }
}

- (void)setIconImage:(id)a3
{
  objc_super v5 = (UIImage *)a3;
  p_iconImage = &self->_iconImage;
  if (self->_iconImage != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_iconImage, a3);
    p_iconImage = (UIImage **)[(PRComplicationGalleryDetailViewController *)self _updateContent];
    objc_super v5 = v7;
  }
  MEMORY[0x1F41817F8](p_iconImage, v5);
}

- (void)setShowsCloseButton:(BOOL)a3
{
  BOOL v3 = a3;
  [(PRComplicationGalleryDetailViewController *)self loadViewIfNeeded];
  id v5 = [(PRComplicationGalleryDetailViewController *)self _complicationGalleryDetailView];
  [v5 setShowsCloseButton:v3];
}

- (BOOL)showsCloseButton
{
  [(PRComplicationGalleryDetailViewController *)self loadViewIfNeeded];
  BOOL v3 = [(PRComplicationGalleryDetailViewController *)self _complicationGalleryDetailView];
  char v4 = [v3 showsCloseButton];

  return v4;
}

- (void)setShowsBackgroundView:(BOOL)a3
{
  BOOL v3 = a3;
  [(PRComplicationGalleryDetailViewController *)self loadViewIfNeeded];
  id v5 = [(PRComplicationGalleryDetailViewController *)self _complicationGalleryDetailView];
  [v5 setShowsBackgroundView:v3];
}

- (BOOL)showsBackgroundView
{
  [(PRComplicationGalleryDetailViewController *)self loadViewIfNeeded];
  BOOL v3 = [(PRComplicationGalleryDetailViewController *)self _complicationGalleryDetailView];
  char v4 = [v3 showsBackgroundView];

  return v4;
}

- (void)_updateContent
{
  id v3 = [(PRComplicationGalleryDetailViewController *)self _complicationGalleryDetailView];
  [v3 setTitle:self->_appName];
  [v3 setIconImage:self->_iconImage];
}

- (void)complicationGalleryView:(id)a3 didUpdateVisiblePagesWithAppearedBlock:(id)a4
{
  id v5 = a4;
  pageViewControllers = self->_pageViewControllers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __108__PRComplicationGalleryDetailViewController_complicationGalleryView_didUpdateVisiblePagesWithAppearedBlock___block_invoke;
  v8[3] = &unk_1E54DC758;
  id v9 = v5;
  id v7 = v5;
  [(NSArray *)pageViewControllers enumerateObjectsWithOptions:0 usingBlock:v8];
}

void __108__PRComplicationGalleryDetailViewController_complicationGalleryView_didUpdateVisiblePagesWithAppearedBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = v5 && ((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, a3) & 1) != 0;
  objc_msgSend(v7, "bs_endAppearanceTransition:", v6);
}

- (void)complicationGalleryViewDidTapClose:(id)a3
{
  id v4 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  [v4 addWidgetSheetViewControllerDidCancel:self];
}

- (void)_updateParallax
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_pageViewControllers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = [(PRComplicationGalleryDetailViewController *)self view];
        [v8 updateParallaxEffectInReferenceView:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)complicationGalleryDetailPageViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHAddWidgetSheetViewControllerBase *)self delegate];
  [v6 addWidgetSheetViewController:self didSelectWidgetIconView:v5];
}

- (NSMutableDictionary)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (SBHWidgetSheetViewControllerPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (SBHWidgetSheetViewControllerPresenter *)WeakRetained;
}

- (SBHApplicationWidgetCollection)applicationWidgetCollection
{
  return self->_applicationWidgetCollection;
}

- (void)setApplicationWidgetCollection:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSArray)pageViewControllers
{
  return self->_pageViewControllers;
}

- (void)setPageViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageViewControllers, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_applicationWidgetCollection, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end