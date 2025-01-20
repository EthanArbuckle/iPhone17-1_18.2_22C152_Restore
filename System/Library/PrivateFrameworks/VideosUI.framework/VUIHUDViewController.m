@interface VUIHUDViewController
- (BOOL)isMultiview;
- (CGSize)_computePreferredContentSize;
- (CGSize)playerViewSize;
- (NSObject)tabObserver;
- (NSString)tabIdentifier;
- (UIViewController)hudContentViewController;
- (VUIHUDViewController)init;
- (id)avkit_customInfoPanelKindIdentifier;
- (int)tabIndex;
- (void)_addViewControllerToHud;
- (void)addBorderWithColor:(id)a3 width:(double)a4 cornerRadius:(double)a5;
- (void)dealloc;
- (void)setHudContentViewController:(id)a3;
- (void)setIsMultiview:(BOOL)a3;
- (void)setPlayerViewSize:(CGSize)a3;
- (void)setTabIdentifier:(id)a3;
- (void)setTabIndex:(int)a3;
- (void)setTabObserver:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation VUIHUDViewController

- (VUIHUDViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)VUIHUDViewController;
  v2 = [(VUIHUDViewController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_tabIndex = -1;
    tabIdentifier = v2->_tabIdentifier;
    v2->_tabIdentifier = (NSString *)&stru_1F3E921E0;

    hudContentViewController = v3->_hudContentViewController;
    v3->_hudContentViewController = 0;
  }
  [(VUIHUDViewController *)v3 setOverrideUserInterfaceStyle:2];
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)VUIHUDViewController;
  [(VUIHUDViewController *)&v2 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)VUIHUDViewController;
  [(VUIHUDViewController *)&v5 viewDidLoad];
  v3 = [(VUIHUDViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)setHudContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hudContentViewController, a3);
  [(VUIHUDViewController *)self _addViewControllerToHud];
}

- (void)viewDidLayoutSubviews
{
  v3 = [(VUIHUDViewController *)self view];
  [v3 bounds];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  v12 = self->_hudContentViewController;
  v13 = (void *)MEMORY[0x1E4FB1EB0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__VUIHUDViewController_viewDidLayoutSubviews__block_invoke;
  v15[3] = &unk_1E6DF74D8;
  v16 = v12;
  uint64_t v17 = v5;
  uint64_t v18 = v7;
  uint64_t v19 = v9;
  uint64_t v20 = v11;
  v14 = v12;
  [v13 performWithoutAnimation:v15];
}

void __45__VUIHUDViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_addViewControllerToHud
{
  v3 = self->_hudContentViewController;
  if (v3)
  {
    uint64_t v8 = v3;
    uint64_t v4 = [(UIViewController *)v3 parentViewController];

    v3 = v8;
    if (v4 != self)
    {
      [(VUIHUDViewController *)self addChildViewController:v8];
      uint64_t v5 = [(VUIHUDViewController *)self view];
      uint64_t v6 = [(UIViewController *)v8 view];
      [v5 addSubview:v6];

      uint64_t v7 = [(VUIHUDViewController *)self view];
      [v7 setClipsToBounds:0];

      [(UIViewController *)v8 didMoveToParentViewController:self];
      v3 = v8;
    }
  }
}

- (CGSize)_computePreferredContentSize
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FB1F48];
  [(VUIHUDViewController *)self playerViewSize];
  unint64_t v4 = objc_msgSend(v3, "vui_currentSizeClassForWindowWidth:");
  [(VUIHUDViewController *)self playerViewSize];
  BOOL v5 = +[VUIUtilities shouldPlayerTabsUseVerticalLayoutForSize:isPhoneSizeClass:](VUIUtilities, "shouldPlayerTabsUseVerticalLayoutForSize:isPhoneSizeClass:", v4 < 3);
  if (v5) {
    double v6 = 1.79769313e308;
  }
  else {
    double v6 = 160.0;
  }
  uint64_t v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(VUIHUDViewController *)self tabIdentifier];
    [(VUIHUDViewController *)self playerViewSize];
    uint64_t v9 = NSStringFromCGSize(v26);
    v27.width = 0.0;
    v27.height = v6;
    uint64_t v10 = NSStringFromCGSize(v27);
    int v13 = 134219266;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    __int16 v19 = 2048;
    unint64_t v20 = v4;
    __int16 v21 = 1024;
    BOOL v22 = v5;
    __int16 v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIHUDViewController::(%p, %@) computePreferredContentSize, playerViewSize: %@, sizeClass: %ld, useVerticalLayout: %d, result: %@", (uint8_t *)&v13, 0x3Au);
  }
  double v11 = 0.0;
  double v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)avkit_customInfoPanelKindIdentifier
{
  return self->_tabIdentifier;
}

- (void)addBorderWithColor:(id)a3 width:(double)a4 cornerRadius:(double)a5
{
  id v8 = a3;
  uint64_t v9 = [(VUIHUDViewController *)self view];
  uint64_t v10 = [v9 layer];
  id v11 = v8;
  uint64_t v12 = [v11 CGColor];

  [v10 setBorderColor:v12];
  int v13 = [(VUIHUDViewController *)self view];
  v14 = [v13 layer];
  [v14 setBorderWidth:a4];

  __int16 v15 = [(VUIHUDViewController *)self view];
  v16 = [v15 layer];
  [v16 setCornerRadius:a5];

  id v18 = [(VUIHUDViewController *)self view];
  __int16 v17 = [v18 layer];
  [v17 setMasksToBounds:1];
}

- (UIViewController)hudContentViewController
{
  return self->_hudContentViewController;
}

- (int)tabIndex
{
  return self->_tabIndex;
}

- (void)setTabIndex:(int)a3
{
  self->_tabIndex = a3;
}

- (NSString)tabIdentifier
{
  return self->_tabIdentifier;
}

- (void)setTabIdentifier:(id)a3
{
}

- (CGSize)playerViewSize
{
  double width = self->_playerViewSize.width;
  double height = self->_playerViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPlayerViewSize:(CGSize)a3
{
  self->_playerViewSize = a3;
}

- (BOOL)isMultiview
{
  return self->_isMultiview;
}

- (void)setIsMultiview:(BOOL)a3
{
  self->_isMultiview = a3;
}

- (NSObject)tabObserver
{
  return self->_tabObserver;
}

- (void)setTabObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabObserver, 0);
  objc_storeStrong((id *)&self->_tabIdentifier, 0);
  objc_storeStrong((id *)&self->_hudContentViewController, 0);
}

@end