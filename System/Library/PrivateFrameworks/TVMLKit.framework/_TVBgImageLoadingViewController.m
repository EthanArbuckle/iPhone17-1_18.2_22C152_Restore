@interface _TVBgImageLoadingViewController
+ (id)_decorateImage:(id)a3 decorator:(id)a4;
- (BOOL)_backgroundImageRequiresBlur;
- (BOOL)_isBackdropNeeded;
- (BOOL)_isNewiOSTVApp;
- (BOOL)_shouldLoadBackgroundImageAsynchronously;
- (BOOL)appliedNavigationItem;
- (CGSize)_backgroundImageProxySize;
- (IKViewElement)navigationItemElement;
- (_TVBgImageLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)_backgroundImageProxy;
- (id)_stackViewWithMinSpacing:(double)a3 layoutMargin:(UIEdgeInsets)a4;
- (int64_t)_blurEffectStyle;
- (int64_t)_overrideLargeTitleDisplayMode;
- (int64_t)preferredStatusBarStyle;
- (void)_dismissViewController:(id)a3;
- (void)_reparentNavigationItem:(id)a3;
- (void)_updateNavigationBarPadding;
- (void)_updateNavigationItem;
- (void)configureAppearanceTransition;
- (void)dealloc;
- (void)loadFromViewController:(id)a3 completion:(id)a4;
- (void)setAppliedNavigationItem:(BOOL)a3;
- (void)setNavigationItemElement:(id)a3;
- (void)updateNavigationItem:(id)a3;
- (void)updateWithViewElement:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _TVBgImageLoadingViewController

- (_TVBgImageLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_TVBgImageLoadingViewController;
  v4 = [(_TVBgImageLoadingViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_loaded = 0;
    v4->_bgImageLoadingOptions.respondsToBackroundImageProxy = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToBackgroundImageRequiresBlur = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToBackdropNeeded = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToImageProxySize = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToBlurEffectStyle = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToPurgeBgImages = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToConfigureBgImageBackdropImage = objc_opt_respondsToSelector() & 1;
    v5->_bgImageLoadingOptions.respondsToShouldLoadBackgroundImageAsynchronously = objc_opt_respondsToSelector() & 1;
  }
  return v5;
}

- (void)dealloc
{
  [self->_imageProxy cancel];
  v3.receiver = self;
  v3.super_class = (Class)_TVBgImageLoadingViewController;
  [(_TVBgImageLoadingViewController *)&v3 dealloc];
}

- (id)_backgroundImageProxy
{
  return 0;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return 0;
}

- (BOOL)_isBackdropNeeded
{
  return 0;
}

- (CGSize)_backgroundImageProxySize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)_blurEffectStyle
{
  return 0x8000000000000000;
}

- (BOOL)_shouldLoadBackgroundImageAsynchronously
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)updateWithViewElement:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(v4, "children", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "tv_elementType") == 31)
        {
          id v12 = v11;

          v8 = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  if (self->_navigationItemElement)
  {
    uint64_t v13 = [v8 updateType];
    objc_storeStrong((id *)&self->_navigationItemElement, v8);
    if (!v13) {
      goto LABEL_17;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_navigationItemElement, v8);
  }
  [(_TVBgImageLoadingViewController *)self _updateNavigationItem];
LABEL_17:
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVBgImageLoadingViewController;
  [(_TVBgImageLoadingViewController *)&v4 viewDidAppear:a3];
  self->_loaded = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TVBgImageLoadingViewController;
  [(_TVBgImageLoadingViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(_TVBgImageLoadingViewController *)self navigationController];

  if (!v4) {
    self->_loaded = 0;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TVBgImageLoadingViewController;
  [(_TVBgImageLoadingViewController *)&v5 viewWillAppear:a3];
  [(_TVBgImageLoadingViewController *)self _updateNavigationBarPadding];
  objc_super v4 = [(_TVBgImageLoadingViewController *)self parentViewController];
  [(_TVBgImageLoadingViewController *)self _reparentNavigationItem:v4];

  [(_TVBgImageLoadingViewController *)self configureAppearanceTransition];
}

- (void)configureAppearanceTransition
{
  double v3 = 1.0;
  if ([(_TVBgImageLoadingViewController *)self _isNewiOSTVApp])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v4 = [(_TVBgImageLoadingViewController *)self navigationItem];
      objc_super v5 = [v4 title];
      if (v5)
      {
      }
      else
      {
        uint64_t v6 = [(_TVBgImageLoadingViewController *)self navigationItem];
        uint64_t v7 = [v6 titleView];

        if (v7) {
          double v3 = 1.0;
        }
        else {
          double v3 = 0.0;
        }
      }
    }
  }
  v8 = [(_TVBgImageLoadingViewController *)self transitionCoordinator];

  if (v3 <= 0.0 || v8 == 0)
  {
    v10 = [(_TVBgImageLoadingViewController *)self navigationController];
    id v13 = [v10 navigationBar];

    v11 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
    [v13 setTintColor:v11];

    [v13 _setBackgroundOpacity:v3];
    [v13 _setTitleOpacity:v3];
  }
  else
  {
    objc_initWeak(&location, self);
    id v12 = [(_TVBgImageLoadingViewController *)self transitionCoordinator];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64___TVBgImageLoadingViewController_configureAppearanceTransition__block_invoke;
    v16[3] = &unk_264BA7900;
    objc_copyWeak(v17, &location);
    v17[1] = *(id *)&v3;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64___TVBgImageLoadingViewController_configureAppearanceTransition__block_invoke_2;
    v14[3] = &unk_264BA7900;
    objc_copyWeak(v15, &location);
    v15[1] = *(id *)&v3;
    [v12 animateAlongsideTransition:v16 completion:v14];

    objc_destroyWeak(v15);
    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
}

- (void)loadFromViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_bgImageLoadingOptions.respondsToConfigureBgImageBackdropImage)
  {
    id v12 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
    {
      -[_TVBgImageLoadingViewController loadFromViewController:completion:](v12);
      if (!v7) {
        goto LABEL_16;
      }
    }
    else if (!v7)
    {
      goto LABEL_16;
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_16;
  }
  v8 = [(_TVBgImageLoadingViewController *)self _backgroundImageProxy];
  id imageProxy = self->_imageProxy;
  self->_id imageProxy = v8;

  char v10 = [self->_imageProxy isImageAvailable];
  BOOL v11 = self->_bgImageLoadingOptions.respondsToShouldLoadBackgroundImageAsynchronously
     && [(_TVBgImageLoadingViewController *)self _shouldLoadBackgroundImageAsynchronously];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = self->_imageProxy;
    objc_msgSend(v13, "setAllowsSubstitutionForOriginal:", -[_TVBgImageLoadingViewController _backgroundImageRequiresBlur](self, "_backgroundImageRequiresBlur"));
    objc_initWeak(&location, self);
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __69___TVBgImageLoadingViewController_loadFromViewController_completion___block_invoke;
    uint64_t v19 = &unk_264BA7950;
    objc_copyWeak(&v21, &location);
    BOOL v22 = v11;
    id v14 = v7;
    id v20 = v14;
    char v23 = v10;
    [v13 setCompletionHandler:&v16];
    objc_msgSend(v13, "setCacheOnLoad:", +[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread", v16, v17, v18, v19) ^ 1);
    [v13 load];
    char v15 = !v11;
    if (!v14) {
      char v15 = 1;
    }
    if ((v15 & 1) == 0) {
      (*((void (**)(id, uint64_t, void))v14 + 2))(v14, 1, 0);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    [(_TVBgImageLoadingViewController *)self _configureWithBgImage:0 backdropImage:0];
    if (v7) {
      (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
    }
  }
LABEL_16:
}

+ (id)_decorateImage:(id)a3 decorator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = +[TVImage imageWithCGImageRef:preserveAlpha:](TVImage, "imageWithCGImageRef:preserveAlpha:", [v7 CGImage], 0);
    uint64_t v9 = (void *)v8;
    if (v6 && v8)
    {
      [v7 size];
      uint64_t v10 = objc_msgSend(v6, "decorate:scaledWithSize:croppedToFit:", v9, 1);

      uint64_t v9 = (void *)v10;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)updateNavigationItem:(id)a3
{
  id v3 = a3;
  [v3 setSearchController:0];
  [v3 setHidesSearchBarWhenScrolling:0];
}

- (void)_dismissViewController:(id)a3
{
  id v9 = +[_TVModalPresenter presenter];
  objc_super v4 = [v9 modalRootViewController];
  uint64_t v5 = [(_TVBgImageLoadingViewController *)self navigationController];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7 && v4 == (void *)v5) {
    [v9 hideAllAnimated:1 withCompletion:0];
  }
  else {
    [(_TVBgImageLoadingViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (int64_t)_overrideLargeTitleDisplayMode
{
  return 0;
}

- (BOOL)_isNewiOSTVApp
{
  double v2 = [MEMORY[0x263F08AB0] processInfo];
  id v3 = [v2 processName];
  char v4 = [v3 isEqualToString:@"AppleTV"];

  return v4;
}

- (void)_reparentNavigationItem:(id)a3
{
  id v32 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ![(_TVBgImageLoadingViewController *)self appliedNavigationItem])
  {
    uint64_t v5 = [(_TVBgImageLoadingViewController *)self navigationItem];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = &stru_26E5657A8;
    }
    uint64_t v8 = [v5 title];
    id v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = (void *)v8;
    }
    else {
      uint64_t v10 = v7;
    }
    id v30 = v10;

    BOOL v11 = [v5 leftBarButtonItems];
    id v12 = (void *)[v11 copy];

    id v13 = [v5 rightBarButtonItems];
    id v14 = (void *)[v13 copy];

    char v15 = [v5 titleView];
    BOOL v16 = [(_TVBgImageLoadingViewController *)self _isNewiOSTVApp];
    uint64_t v17 = [(_TVBgImageLoadingViewController *)self presentingViewController];
    unsigned int v29 = !v16;

    if (v17 && !v16)
    {
      v18 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel__dismissViewController_];
      uint64_t v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v14, "count") + 1);
      [v19 addObject:v18];
      uint64_t v20 = [v19 copy];

      id v14 = (void *)v20;
    }
    unsigned int v21 = [v5 leftItemsSupplementBackButton];
    unint64_t v22 = [v5 largeTitleDisplayMode];
    int v31 = isKindOfClass;
    if ([(_TVBgImageLoadingViewController *)self _overrideLargeTitleDisplayMode]) {
      unint64_t v22 = [(_TVBgImageLoadingViewController *)self _overrideLargeTitleDisplayMode];
    }
    BOOL v23 = v9 == 0;
    v24 = [v5 _largeTitleAccessoryView];
    unsigned int v28 = [v5 _supportsTwoLineLargeTitles];
    v25 = [v32 navigationItem];
    [v25 setTitle:v30];

    [v25 setTitleView:v15];
    [v25 setLeftBarButtonItems:v12];
    [v25 setRightBarButtonItems:v14];
    [v25 setLeftItemsSupplementBackButton:v21];
    if (v22 <= 1) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = v22;
    }
    if ((v23 & v31) != 0) {
      uint64_t v27 = 2;
    }
    else {
      uint64_t v27 = v26;
    }
    [v25 setLargeTitleDisplayMode:v27];
    [v25 _setLargeTitleAccessoryView:v24 alignToBaseline:v29];
    [v25 _setSupportsTwoLineLargeTitles:v28];
    [(_TVBgImageLoadingViewController *)self updateNavigationItem:v25];
    [(_TVBgImageLoadingViewController *)self setAppliedNavigationItem:1];
  }
  else
  {
    char v4 = v32;
    if (v32) {
      goto LABEL_24;
    }
    [(_TVBgImageLoadingViewController *)self setAppliedNavigationItem:0];
  }
  char v4 = v32;
LABEL_24:
}

- (void)_updateNavigationBarPadding
{
  if (self->_navigationItemElement)
  {
    id v3 = [(_TVBgImageLoadingViewController *)self navigationController];
    char v4 = +[_TVModalPresenter presenter];
    uint64_t v5 = [v4 modalRootViewController];

    if (v3 != v5)
    {
      id v6 = [(IKViewElement *)self->_navigationItemElement style];
      objc_msgSend(v6, "tv_padding");
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      char v15 = [(_TVBgImageLoadingViewController *)self navigationController];
      BOOL v16 = [v15 navigationBar];
      [v16 layoutMargins];
      if (v10 == v20 && v8 == v17 && v14 == v19)
      {
        double v23 = v18;

        if (v12 == v23) {
          return;
        }
      }
      else
      {
      }
      v24 = [(_TVBgImageLoadingViewController *)self navigationController];
      v25 = [v24 navigationBar];
      objc_msgSend(v25, "setLayoutMargins:", v8, v10, v12, v14);

      id v27 = [(_TVBgImageLoadingViewController *)self navigationController];
      uint64_t v26 = [v27 navigationBar];
      [v26 setNeedsLayout];
    }
  }
}

- (void)_updateNavigationItem
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  v98 = [MEMORY[0x263EFF980] array];
  char v4 = [(_TVBgImageLoadingViewController *)self navigationItem];
  v95 = self;
  v96 = v3;
  navigationItemElement = self->_navigationItemElement;
  v94 = v4;
  if (!navigationItemElement)
  {
    v97 = 0;
    double v9 = 0;
    uint64_t v99 = 1;
    goto LABEL_35;
  }
  id v6 = [(IKViewElement *)navigationItemElement children];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v111 objects:v117 count:16];
  if (!v7)
  {
    v97 = 0;
    double v9 = 0;
    uint64_t v99 = 1;
    goto LABEL_34;
  }
  uint64_t v8 = v7;
  v97 = 0;
  double v9 = 0;
  uint64_t v10 = *(void *)v112;
  uint64_t v99 = 1;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v112 != v10) {
        objc_enumerationMutation(v6);
      }
      double v12 = *(void **)(*((void *)&v111 + 1) + 8 * i);
      uint64_t v13 = objc_msgSend(v12, "tv_elementType");
      if (v13 != 6)
      {
        if (v13 == 16)
        {
          unint64_t v22 = [v12 style];
          uint64_t v23 = objc_msgSend(v22, "tv_alignment");

          if (v23 == 3) {
            goto LABEL_24;
          }
          if (v23 == 1)
          {
            v24 = v3;
LABEL_25:
            [v24 addObject:v12];
            continue;
          }
          v33 = +[TVInterfaceFactory sharedInterfaceFactory];
          v34 = [v94 titleView];
          v35 = [v33 _viewFromElement:v12 existingView:v34];

          [v35 sizeToFit];
          v97 = v35;
        }
        else if (v13 == 55)
        {
          double v14 = [v12 text];
          uint64_t v15 = [v14 string];

          BOOL v16 = [v12 attributes];
          double v17 = [v16 objectForKey:@"showLargeTitle"];
          if ([v17 length])
          {
            double v18 = [v12 attributes];
            double v19 = [v18 objectForKey:@"showLargeTitle"];
            int v20 = [v19 BOOLValue];

            id v3 = v96;
            uint64_t v21 = v99;
            if (!v20) {
              uint64_t v21 = 2;
            }
            uint64_t v99 = v21;
          }
          else
          {
          }
          double v9 = (void *)v15;
        }
        continue;
      }
      v25 = [v12 style];
      uint64_t v26 = objc_msgSend(v25, "tv_alignment");

      id v27 = v3;
      if (v26 != 1)
      {
        if (v26 != 3) {
          goto LABEL_21;
        }
        id v27 = v98;
      }
      [v27 addObject:v12];
LABEL_21:
      unsigned int v28 = [v12 style];
      uint64_t v29 = objc_msgSend(v28, "tv_position");

      if (v29 == 10)
      {
        id v30 = +[TVInterfaceFactory sharedInterfaceFactory];
        uint64_t v31 = [v30 _viewFromElement:v12 existingView:0];
        rightLargeTitleButton = v95->_rightLargeTitleButton;
        v95->_rightLargeTitleButton = (UIView *)v31;

        continue;
      }
      if (!(v29 | v26))
      {
LABEL_24:
        v24 = v98;
        goto LABEL_25;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v111 objects:v117 count:16];
  }
  while (v8);
LABEL_34:

  char v4 = v94;
LABEL_35:
  v36 = [v4 leftBarButtonItem];
  v37 = [v36 view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v38 = [v4 leftBarButtonItem];
    v39 = [v38 view];
  }
  else
  {
    v39 = -[_TVBgImageLoadingViewController _stackViewWithMinSpacing:layoutMargin:](v95, "_stackViewWithMinSpacing:layoutMargin:", 15.0, 0.0, 0.0, 0.0, 15.0);
  }

  v40 = [v4 rightBarButtonItem];
  v41 = [v40 view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v42 = [v4 rightBarButtonItem];
    v43 = [v42 view];
  }
  else
  {
    v43 = -[_TVBgImageLoadingViewController _stackViewWithMinSpacing:layoutMargin:](v95, "_stackViewWithMinSpacing:layoutMargin:", 15.0, 0.0, 15.0, 0.0, 0.0);
  }
  v91 = v9;

  v100 = v39;
  if ([v3 count])
  {
    uint64_t v92 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v44 = [v39 subviews];
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    obuint64_t j = v3;
    uint64_t v45 = [obj countByEnumeratingWithState:&v107 objects:v116 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = 0;
      uint64_t v48 = *(void *)v108;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v108 != v48) {
            objc_enumerationMutation(obj);
          }
          uint64_t v50 = *(void *)(*((void *)&v107 + 1) + 8 * j);
          if (v47 + j >= (unint64_t)[v44 count])
          {
            v51 = 0;
          }
          else
          {
            v51 = [v44 objectAtIndexedSubscript:v47 + j];
          }
          v52 = +[TVInterfaceFactory sharedInterfaceFactory];
          v53 = [v52 _viewFromElement:v50 existingView:v51];

          [v53 sizeToFit];
          if (!v51)
          {
            [v53 frame];
            double v55 = v54;
            double v57 = v56;
            v58 = [v53 widthAnchor];
            v59 = [v58 constraintEqualToConstant:v55];
            [v59 setActive:1];

            v60 = [v53 heightAnchor];
            v61 = [v60 constraintEqualToConstant:v57];
            [v61 setActive:1];

            [v100 insertArrangedSubview:v53 atIndex:0];
          }
        }
        uint64_t v46 = [obj countByEnumeratingWithState:&v107 objects:v116 count:16];
        v47 += j;
      }
      while (v46);
    }

    v62 = (void *)v92;
    char v4 = v94;
    v39 = v100;
  }
  else
  {
    v62 = 0;
  }
  if ([v98 count])
  {
    v93 = v62;
    uint64_t v90 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v98, "count"));
    v63 = [v43 subviews];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id obja = v98;
    uint64_t v64 = [obja countByEnumeratingWithState:&v103 objects:v115 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = 0;
      uint64_t v67 = *(void *)v104;
      do
      {
        for (uint64_t k = 0; k != v65; ++k)
        {
          if (*(void *)v104 != v67) {
            objc_enumerationMutation(obja);
          }
          uint64_t v69 = *(void *)(*((void *)&v103 + 1) + 8 * k);
          if (v66 + k >= (unint64_t)[v63 count])
          {
            v70 = 0;
          }
          else
          {
            v70 = [v63 objectAtIndexedSubscript:v66 + k];
          }
          v71 = +[TVInterfaceFactory sharedInterfaceFactory];
          v72 = [v71 _viewFromElement:v69 existingView:v70];

          [v72 sizeToFit];
          if (!v70)
          {
            [v72 frame];
            double v74 = v73;
            double v76 = v75;
            v77 = [v72 widthAnchor];
            v78 = [v77 constraintEqualToConstant:v74];
            [v78 setActive:1];

            v79 = [v72 heightAnchor];
            v80 = [v79 constraintEqualToConstant:v76];
            [v80 setActive:1];

            [v43 insertArrangedSubview:v72 atIndex:0];
          }
        }
        uint64_t v65 = [obja countByEnumeratingWithState:&v103 objects:v115 count:16];
        v66 += k;
      }
      while (v65);
    }

    v62 = v93;
    char v4 = v94;
    v39 = v100;
    v81 = (void *)v90;
  }
  else
  {
    v81 = 0;
  }
  v82 = [v39 subviews];
  uint64_t v83 = [v82 count];

  if (v83)
  {
    [v39 sizeToFit];
    v84 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v39];
    [v62 addObject:v84];
  }
  v85 = [v43 subviews];
  uint64_t v86 = [v85 count];

  if (v86)
  {
    [v43 sizeToFit];
    v87 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v43];
    [v81 addObject:v87];
  }
  [v43 sizeToFit];
  [v4 setTitleView:v97];
  [v4 setTitle:v91];
  [v4 setLeftBarButtonItems:v62];
  [v4 setRightBarButtonItems:v81];
  [v4 setLeftItemsSupplementBackButton:1];
  [v4 setLargeTitleDisplayMode:v99];
  [v4 _setLargeTitleAccessoryView:v95->_rightLargeTitleButton alignToBaseline:1];
  [v4 _setSupportsTwoLineLargeTitles:1];
  [(_TVBgImageLoadingViewController *)v95 updateNavigationItem:v4];
  [(_TVBgImageLoadingViewController *)v95 setAppliedNavigationItem:0];
  v88 = [(_TVBgImageLoadingViewController *)v95 parentViewController];
  [(_TVBgImageLoadingViewController *)v95 _reparentNavigationItem:v88];

  [(_TVBgImageLoadingViewController *)v95 setNeedsStatusBarAppearanceUpdate];
  v89 = [(_TVBgImageLoadingViewController *)v95 navigationController];
  [v89 setNeedsStatusBarAppearanceUpdate];
}

- (id)_stackViewWithMinSpacing:(double)a3 layoutMargin:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = objc_alloc_init(MEMORY[0x263F1C9B8]);
  [v9 setAxis:0];
  [v9 setDistribution:0];
  [v9 setAlignment:3];
  [v9 setSpacing:a3];
  objc_msgSend(v9, "setLayoutMargins:", top, left, bottom, right);
  [v9 setLayoutMarginsRelativeArrangement:1];
  return v9;
}

- (IKViewElement)navigationItemElement
{
  return self->_navigationItemElement;
}

- (void)setNavigationItemElement:(id)a3
{
}

- (BOOL)appliedNavigationItem
{
  return self->_appliedNavigationItem;
}

- (void)setAppliedNavigationItem:(BOOL)a3
{
  self->_appliedNavigationItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationItemElement, 0);
  objc_storeStrong((id *)&self->_rightLargeTitleButton, 0);
  objc_storeStrong(&self->_imageProxy, 0);
}

- (void)loadFromViewController:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v1 = a1;
  double v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_230B4C000, v1, OS_LOG_TYPE_DEBUG, "_configureBgImage:backdropImage: not defined on %@. loadFromViewController:completion: aborted", (uint8_t *)&v4, 0xCu);
}

@end