@interface _TVListTemplateController
- (BOOL)_backgroundImageRequiresBlur;
- (BOOL)setNeedsFocusUpdateToList;
- (CGSize)_backgroundImageProxySize;
- (UIViewController)focusedController;
- (UIViewController)previewViewController;
- (_TVListViewController)listViewController;
- (id)_backgroundImageProxy;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (id)preferredFocusEnvironments;
- (int64_t)_blurEffectStyle;
- (void)_configureWithBgElement:(id)a3;
- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4;
- (void)_configureWithListElement:(id)a3;
- (void)_updateView;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)listViewController:(id)a3 didScrollWithScrollView:(id)a4;
- (void)listViewController:(id)a3 updatePreviewViewController:(id)a4;
- (void)loadView;
- (void)setFocusedController:(id)a3;
- (void)setListViewController:(id)a3;
- (void)setPreviewViewController:(id)a3;
- (void)updateWithViewElement:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _TVListTemplateController

- (void)updateWithViewElement:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_TVListTemplateController;
  [(_TVBgImageLoadingViewController *)&v19 updateWithViewElement:v5];
  objc_storeStrong((id *)&self->_templateElement, a3);
  v6 = [v5 appDocument];
  [v6 impressionThreshold];
  self->_impressionThreshold = v7;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = objc_msgSend(v5, "children", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "tv_elementType");
        switch(v14)
        {
          case 22:
            [(_TVListTemplateController *)self _configureWithListElement:v13];
            break;
          case 12:
            objc_storeStrong((id *)&self->_bannerElement, v13);
            break;
          case 4:
            [(_TVListTemplateController *)self _configureWithBgElement:v13];
            break;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v10);
  }

  if ([(_TVListTemplateController *)self isViewLoaded]) {
    [(_TVListTemplateController *)self _updateView];
  }
}

- (BOOL)setNeedsFocusUpdateToList
{
  [(_TVListTemplateController *)self setFocusedController:0];
  v3 = [(_TVListTemplateController *)self listViewController];
  [v3 setNeedsFocusUpdate];

  [(_TVListTemplateController *)self setNeedsFocusUpdate];
  v4 = [MEMORY[0x263F1C920] mainScreen];
  id v5 = [v4 focusedView];
  v6 = [(_TVListTemplateController *)self view];
  char v7 = [v5 isDescendantOfView:v6];

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_TVListTemplateController;
  [(_TVBgImageLoadingViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_TVListTemplateController;
  [(_TVBgImageLoadingViewController *)&v3 viewDidAppear:a3];
}

- (void)loadView
{
  objc_super v3 = -[_TVListTemplateView initWithFrame:]([_TVListTemplateView alloc], "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(_TVListTemplateController *)self setView:v3];
  [(_TVListTemplateController *)self _updateView];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)_TVListTemplateController;
  id v6 = a3;
  [(_TVListTemplateController *)&v19 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  char v7 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", v19.receiver, v19.super_class);
  v8 = [v7 focusedView];

  uint64_t v9 = [(_TVListTemplateController *)self listViewController];
  uint64_t v10 = [v9 view];
  int v11 = [v8 isDescendantOfView:v10];

  if (v11)
  {
    uint64_t v12 = [(_TVListTemplateController *)self listViewController];
LABEL_5:
    long long v16 = (void *)v12;
    [(_TVListTemplateController *)self setFocusedController:v12];

    goto LABEL_6;
  }
  v13 = [(_TVListTemplateController *)self previewViewController];
  uint64_t v14 = [v13 view];
  int v15 = [v8 isDescendantOfView:v14];

  if (v15)
  {
    uint64_t v12 = [(_TVListTemplateController *)self previewViewController];
    goto LABEL_5;
  }
LABEL_6:
  long long v17 = [(_TVListTemplateController *)self listViewController];
  long long v18 = [v6 previouslyFocusedView];

  [v17 templateControllerDidUpdateFocusFromView:v18];
}

- (id)preferredFocusEnvironments
{
  v10[1] = *MEMORY[0x263EF8340];
  if ([(IKViewElement *)self->_templateElement isDisabled])
  {
    if (self->_disabledTemplateFocusCaptureView)
    {
      v10[0] = self->_disabledTemplateFocusCaptureView;
      objc_super v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    }
    else
    {
      objc_super v3 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    v4 = [(_TVListTemplateController *)self view];
    [v4 layoutIfNeeded];

    objc_super v3 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    id v5 = [(_TVListTemplateController *)self focusedController];

    if (v5)
    {
      id v6 = [(_TVListTemplateController *)self focusedController];
      [v3 addObject:v6];
    }
    char v7 = [(_TVListTemplateController *)self listViewController];

    if (v7)
    {
      v8 = [(_TVListTemplateController *)self listViewController];
      [v3 addObject:v8];
    }
  }
  return v3;
}

- (void)_updateView
{
  id v29 = [(_TVListTemplateController *)self _listTemplateView];
  objc_msgSend(v29, "setSemanticContentAttribute:", -[IKViewElement tv_semanticContentAttribute](self->_templateElement, "tv_semanticContentAttribute"));
  objc_super v3 = +[TVInterfaceFactory sharedInterfaceFactory];
  bannerElement = self->_bannerElement;
  id v5 = [v29 bannerView];
  id v6 = [v3 _viewFromElement:bannerElement existingView:v5];
  [v29 setBannerView:v6];

  char v7 = [(IKViewElement *)self->_bannerElement attributes];
  v8 = [v7 objectForKeyedSubscript:@"floating"];

  if ([v8 length]) {
    objc_msgSend(v29, "setFloatingBanner:", objc_msgSend(v8, "BOOLValue"));
  }
  uint64_t v9 = [(IKCollectionElement *)self->_listElement style];
  uint64_t v10 = objc_msgSend(v9, "tv_backgroundColor");

  objc_msgSend(v29, "setBackdropEnabled:", objc_msgSend(v10, "colorType") == 2);
  int v11 = [(IKViewElement *)self->_templateElement style];
  uint64_t v12 = objc_msgSend(v11, "tv_backgroundColor");
  v13 = [v12 color];

  if (v13)
  {
    uint64_t v14 = [(IKViewElement *)self->_templateElement style];
    int v15 = objc_msgSend(v14, "tv_backgroundColor");
    long long v16 = [v15 color];
    [v29 setBackgroundColor:v16];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F1C550] clearColor];
    [v29 setBackgroundColor:v14];
  }

  long long v17 = [(_TVListTemplateController *)self listViewController];
  long long v18 = +[TVInterfaceFactory sharedInterfaceFactory];
  objc_super v19 = [v18 _viewControllerFromElement:self->_listElement existingController:v17];

  v20 = [(IKViewElement *)self->_templateElement elementName];
  objc_msgSend(v19, "setAlwaysSoftFocusEnabled:", objc_msgSend(v20, "isEqualToString:", @"catalogTemplate"));

  if (v17 != v19)
  {
    [v17 willMoveToParentViewController:0];
    if (v19)
    {
      [(_TVListTemplateController *)self addChildViewController:v19];
      uint64_t v21 = [v19 view];
      [v29 setListView:v21];
    }
    [v17 removeFromParentViewController];
    [v19 didMoveToParentViewController:self];
    [(_TVListTemplateController *)self setListViewController:v19];
    [v19 setDelegate:self];
  }
  int v22 = [(IKViewElement *)self->_templateElement isDisabled];
  disabledTemplateFocusCaptureView = self->_disabledTemplateFocusCaptureView;
  if (v22)
  {
    if (!disabledTemplateFocusCaptureView)
    {
      v24 = -[_TVFocusCaptureView initWithFrame:]([_TVFocusCaptureView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
      v25 = self->_disabledTemplateFocusCaptureView;
      self->_disabledTemplateFocusCaptureView = v24;

      v26 = self->_disabledTemplateFocusCaptureView;
      v27 = [MEMORY[0x263F1C550] clearColor];
      [(_TVFocusCaptureView *)v26 setBackgroundColor:v27];
    }
    v28 = [(_TVListTemplateController *)self view];
    [v28 addSubview:self->_disabledTemplateFocusCaptureView];
  }
  else
  {
    [(_TVFocusCaptureView *)disabledTemplateFocusCaptureView removeFromSuperview];
    v28 = self->_disabledTemplateFocusCaptureView;
    self->_disabledTemplateFocusCaptureView = 0;
  }
}

- (void)listViewController:(id)a3 updatePreviewViewController:(id)a4
{
  id v13 = a4;
  id v5 = [(_TVListTemplateController *)self previewViewController];
  if (v5 != v13)
  {
    id v6 = [(_TVListTemplateController *)self focusedController];

    if (v6 == v5) {
      [(_TVListTemplateController *)self setFocusedController:0];
    }
    char v7 = [(_TVListTemplateController *)self _listTemplateView];
    [v5 willMoveToParentViewController:0];
    v8 = v13;
    if (v13)
    {
      [(_TVListTemplateController *)self addChildViewController:v13];
      v8 = v13;
    }
    uint64_t v9 = [v8 view];
    [v7 setPreviewView:v9];

    [v5 removeFromParentViewController];
    [v13 didMoveToParentViewController:self];
    [(_TVListTemplateController *)self setPreviewViewController:v13];
    if (self->_impressionThreshold > 0.0 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v5 performSelector:sel__cancelImpressionsUpdate];
    }
    uint64_t v10 = objc_msgSend(v13, "tv_associatedIKViewElement");
    BOOL v11 = objc_msgSend(v10, "tv_elementType") != 14;

    uint64_t v12 = [(_TVListTemplateController *)self listViewController];
    [v12 setIndexDisplayEnabled:v11];
  }
}

- (void)listViewController:(id)a3 didScrollWithScrollView:(id)a4
{
  id v5 = a4;
  id v6 = [(_TVListTemplateController *)self _listTemplateView];
  [v6 adjustScrollForListView:v5];

  if (self->_impressionThreshold > 0.0)
  {
    char v7 = [(_TVListTemplateController *)self previewViewController];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(_TVListTemplateController *)self previewViewController];
      [v9 performSelector:sel__cancelImpressionsUpdate];
    }
  }
}

- (void)_configureWithBgElement:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = a3;
  v4 = [v20 children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v5)
  {
    char v7 = 0;
    goto LABEL_25;
  }
  uint64_t v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v24;
  uint64_t v21 = *(void *)v24;
  do
  {
    uint64_t v9 = 0;
    uint64_t v22 = v6;
    do
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
      uint64_t v11 = 1048;
      if ((self->_bgImageElement
         || objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v9), "tv_elementType") != 16
         || objc_msgSend(v10, "tv_imageType"))
        && ((uint64_t v11 = 1064, self->_heroImageElement)
         || objc_msgSend(v10, "tv_elementType") != 16
         || objc_msgSend(v10, "tv_imageType") != 3))
      {
        if (objc_msgSend(v10, "tv_elementType") == 3)
        {
          uint64_t v14 = v10;
          bgAudioElement = self->_bgAudioElement;
          self->_bgAudioElement = v14;
        }
        else
        {
          if (objc_msgSend(v10, "tv_elementType") != 35) {
            goto LABEL_21;
          }
          bgAudioElement = v10;
          int v15 = [(IKAudioElement *)bgAudioElement children];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            overlayView = self->_overlayView;
          }
          else {
            overlayView = 0;
          }
          long long v17 = v7;
          char v7 = +[TVMLViewFactory organizerViewWithElements:v15 existingView:overlayView];

          [v7 setUserInteractionEnabled:0];
          uint64_t v8 = v21;
          uint64_t v6 = v22;
        }
      }
      else
      {
        uint64_t v12 = v10;
        bgAudioElement = *(Class *)((char *)&self->super.super.super.super.isa + v11);
        *(Class *)((char *)&self->super.super.super.super.isa + v11) = v12;
      }

LABEL_21:
      ++v9;
    }
    while (v6 != v9);
    uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v6);
LABEL_25:

  [(UIView *)self->_overlayView removeFromSuperview];
  objc_storeStrong((id *)&self->_overlayView, v7);
  if (v7)
  {
    long long v18 = [(_TVListTemplateController *)self view];
    [v18 addSubview:v7];

    objc_super v19 = [(_TVListTemplateController *)self view];
    [v19 bounds];
    objc_msgSend(v7, "setFrame:");
  }
}

- (void)_configureWithListElement:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_listElement, a3);
  if (!self->_bgImageElement)
  {
    uint64_t v22 = self;
    id v23 = v5;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v6 = [v5 children];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v12, "tv_elementType") == 43)
          {
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v13 = [v12 children];
            uint64_t v14 = [v13 firstObject];
            int v15 = [v14 children];

            uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v25;
              while (2)
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v25 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  id v20 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                  if (objc_msgSend(v20, "tv_elementType") == 16 && objc_msgSend(v20, "tv_imageType") == 3)
                  {
                    id v21 = v20;

                    uint64_t v9 = v21;
                    goto LABEL_19;
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }
LABEL_19:
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }

    if (!v22->_heroImageElement) {
      objc_storeStrong((id *)&v22->_heroImageElement, v9);
    }

    id v5 = v23;
  }
}

- (CGSize)_backgroundImageProxySize
{
  bgImageElement = self->_bgImageElement;
  if (bgImageElement || (bgImageElement = self->_heroImageElement) != 0)
  {
    [(IKImageElement *)bgImageElement tv_imageScaleToSize];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_TVListTemplateController;
    [(_TVBgImageLoadingViewController *)&v5 _backgroundImageProxySize];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_backgroundImageProxy
{
  double v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 _graphicsQuality];

  if (v4 == 10) {
    goto LABEL_2;
  }
  if (self->_bgImageElement)
  {
    uint64_t v6 = [(IKViewElement *)self->_templateElement appDocument];
    objc_msgSend(v6, "tv_adjustedWindowSize");
    double v8 = v7;
    double v10 = v9;

    uint64_t v11 = objc_opt_new();
    objc_msgSend(v11, "setImageSize:", v8, v10);
    id v12 = +[TVImageLayout layoutWithLayout:v11 element:self->_bgImageElement];
    objc_super v5 = [(IKImageElement *)self->_bgImageElement tv_imageProxyWithLayout:v11];
    id v13 = [(IKImageElement *)self->_bgImageElement style];
    uint64_t v14 = objc_msgSend(v13, "tv_imageTreatment");
    int v15 = [v14 isEqualToString:@"blur"];

    if (v15)
    {
      uint64_t v16 = objc_alloc_init(_TVUberBlurImageDecorator);
      uint64_t v17 = [(IKImageElement *)self->_bgImageElement style];
      uint64_t v18 = objc_msgSend(v17, "tv_tintColor");
      objc_super v19 = [v18 color];
      [(_TVUberBlurImageDecorator *)v16 setGradientColor:v19];

      [(_TVUberBlurImageDecorator *)v16 setBlurType:2];
      [v5 setDecorator:v16];
    }
  }
  else
  {
    heroImageElement = self->_heroImageElement;
    if (!heroImageElement)
    {
LABEL_2:
      objc_super v5 = 0;
      goto LABEL_9;
    }
    objc_super v5 = [(IKImageElement *)heroImageElement tv_imageProxy];
  }
LABEL_9:
  return v5;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return !self->_bgImageElement && self->_heroImageElement != 0;
}

- (int64_t)_blurEffectStyle
{
  if (+[TVMLUtilities interfaceStyleForTemplateElement:self->_templateElement] == 1)return 4000; {
  else
  }
    return 4005;
}

- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4
{
  id v12 = a3;
  objc_super v5 = [(_TVListTemplateController *)self view];
  if (v12)
  {
    uint64_t v6 = [v5 bgImageView];

    if (!v6)
    {
      double v7 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v12];
      [v5 setBgImageView:v7];
      double v8 = [(IKImageElement *)self->_bgImageElement style];
      double v9 = objc_msgSend(v8, "tv_imageTreatment");
      int v10 = [v9 isEqualToString:@"blurOverlay"];

      if (v10)
      {
        uint64_t v11 = [(IKImageElement *)self->_bgImageElement style];
        objc_msgSend(v11, "tv_padding");
        objc_msgSend(v5, "setOverlayBlurOffset:");
      }
    }
  }
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(IKViewElement *)self->_templateElement appDocument];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    double v7 = [MEMORY[0x263EFF980] array];
    double v8 = [(_TVListTemplateController *)self listViewController];
    double v9 = objc_msgSend(v8, "tv_impressionableElementsForDocument:", v4);
    [v7 addObjectsFromArray:v9];

    int v10 = [(_TVListTemplateController *)self _listTemplateView];
    uint64_t v11 = objc_msgSend(v10, "tv_impressionableElementsForDocument:", v4);
    [v7 addObjectsFromArray:v11];

    id v12 = [(_TVListTemplateController *)self previewViewController];
    id v13 = objc_msgSend(v12, "tv_impressionableElementsForDocument:", v4);
    [v7 addObjectsFromArray:v13];

    if ([v7 count])
    {
      uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (UIViewController)focusedController
{
  return self->_focusedController;
}

- (void)setFocusedController:(id)a3
{
}

- (_TVListViewController)listViewController
{
  return self->_listViewController;
}

- (void)setListViewController:(id)a3
{
}

- (UIViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setPreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_storeStrong((id *)&self->_listViewController, 0);
  objc_storeStrong((id *)&self->_focusedController, 0);
  objc_storeStrong((id *)&self->_disabledTemplateFocusCaptureView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_heroImageElement, 0);
  objc_storeStrong((id *)&self->_bgAudioElement, 0);
  objc_storeStrong((id *)&self->_bgImageElement, 0);
  objc_storeStrong((id *)&self->_bannerElement, 0);
  objc_storeStrong((id *)&self->_listElement, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
}

@end