@interface _TVLoadingViewController
- (BOOL)_backgroundImageRequiresBlur;
- (CGSize)_backgroundImageProxySize;
- (_TVLoadingViewController)init;
- (id)_backgroundImageProxy;
- (int64_t)_blurEffectStyle;
- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4;
- (void)loadView;
- (void)setSpinnerDelay:(double)a3;
- (void)updateWithViewElement:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _TVLoadingViewController

- (_TVLoadingViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)_TVLoadingViewController;
  result = [(_TVLoadingViewController *)&v3 init];
  if (result) {
    result->_spinnerDelay = 0.0;
  }
  return result;
}

- (void)updateWithViewElement:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v55.receiver = self;
  v55.super_class = (Class)_TVLoadingViewController;
  [(_TVBgImageLoadingViewController *)&v55 updateWithViewElement:v5];
  objc_storeStrong((id *)&self->_loadingTemplateElement, a3);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v34 = v5;
  obuint64_t j = [v5 children];
  uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_41;
  }
  uint64_t v7 = v6;
  id v8 = 0;
  uint64_t v9 = *(void *)v52;
  uint64_t v36 = *(void *)v52;
  do
  {
    uint64_t v10 = 0;
    uint64_t v37 = v7;
    do
    {
      if (*(void *)v52 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v51 + 1) + 8 * v10);
      uint64_t v12 = objc_msgSend(v11, "tv_elementType");
      switch(v12)
      {
        case 12:
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v14 = [v11 children];
          uint64_t v21 = [v14 countByEnumeratingWithState:&v43 objects:v57 count:16];
          if (!v21) {
            break;
          }
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v44 != v23) {
                objc_enumerationMutation(v14);
              }
              v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              if (objc_msgSend(v25, "tv_elementType") == 16 && objc_msgSend(v25, "tv_imageType") == 3) {
                objc_storeStrong((id *)&self->_heroImgElement, v25);
              }
            }
            uint64_t v22 = [v14 countByEnumeratingWithState:&v43 objects:v57 count:16];
          }
          while (v22);
LABEL_35:
          uint64_t v9 = v36;
          uint64_t v7 = v37;
          break;
        case 4:
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          v14 = [v11 children];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v58 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            id v35 = v8;
            uint64_t v17 = *(void *)v48;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v48 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v47 + 1) + 8 * j);
                p_bgImageElement = &self->_bgImageElement;
                if (self->_bgImageElement
                  || objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * j), "tv_elementType") != 16
                  || objc_msgSend(v19, "tv_imageType"))
                {
                  p_bgImageElement = &self->_heroImgElement;
                  if (self->_heroImgElement
                    || objc_msgSend(v19, "tv_elementType") != 16
                    || objc_msgSend(v19, "tv_imageType") != 3)
                  {
                    continue;
                  }
                }
                objc_storeStrong((id *)p_bgImageElement, v19);
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v58 count:16];
            }
            while (v16);
            id v8 = v35;
            goto LABEL_35;
          }
          break;
        case 1:
          id v13 = v11;
          v14 = v8;
          id v8 = v13;
          break;
        default:
          goto LABEL_37;
      }

LABEL_37:
      ++v10;
    }
    while (v10 != v7);
    uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  }
  while (v7);
LABEL_41:

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v26 = [v8 children];
  id v27 = (id)[v26 countByEnumeratingWithState:&v39 objects:v56 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v40;
    while (2)
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v26);
        }
        v30 = *(void **)(*((void *)&v39 + 1) + 8 * (void)k);
        if (objc_msgSend(v30, "tv_elementType") == 55)
        {
          id v27 = v30;
          goto LABEL_51;
        }
      }
      id v27 = (id)[v26 countByEnumeratingWithState:&v39 objects:v56 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }
LABEL_51:

  [(_TVLoadingViewController *)self loadViewIfNeeded];
  v31 = +[TVInterfaceFactory sharedInterfaceFactory];
  v32 = [v31 _viewFromElement:v27 existingView:0];

  v33 = [(_TVLoadingViewController *)self view];
  [v33 setLoadingTitleLabel:v32];
}

- (id)_backgroundImageProxy
{
  if (self->_bgImageElement)
  {
    objc_super v3 = [(IKViewElement *)self->_loadingTemplateElement appDocument];
    objc_msgSend(v3, "tv_adjustedWindowSize");
    double v5 = v4;
    double v7 = v6;

    id v8 = objc_opt_new();
    objc_msgSend(v8, "setImageSize:", v5, v7);
    id v9 = +[TVImageLayout layoutWithLayout:v8 element:self->_bgImageElement];
    uint64_t v10 = [(IKImageElement *)self->_bgImageElement tv_imageProxyWithLayout:v8];
  }
  else
  {
    heroImgElement = self->_heroImgElement;
    if (heroImgElement)
    {
      uint64_t v10 = [(IKImageElement *)heroImgElement tv_imageProxy];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  return v10;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return !self->_bgImageElement && self->_heroImgElement != 0;
}

- (int64_t)_blurEffectStyle
{
  if (+[TVMLUtilities interfaceStyleForTemplateElement:self->_loadingTemplateElement] == 1)return 4000; {
  else
  }
    return 4005;
}

- (CGSize)_backgroundImageProxySize
{
  bgImageElement = self->_bgImageElement;
  if (bgImageElement || (bgImageElement = self->_heroImgElement) != 0)
  {
    [(IKImageElement *)bgImageElement tv_imageScaleToSize];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_TVLoadingViewController;
    [(_TVBgImageLoadingViewController *)&v5 _backgroundImageProxySize];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4
{
  id v5 = a3;
  id v7 = [(_TVLoadingViewController *)self view];
  double v6 = [v7 backgroundImageView];
  [v6 setImage:v5];
}

- (void)loadView
{
  double v3 = [_TVLoadingView alloc];
  double v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  id v5 = -[_TVLoadingView initWithFrame:](v3, "initWithFrame:");

  [(_TVLoadingView *)v5 setAutoresizingMask:45];
  [(_TVLoadingViewController *)self setView:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TVLoadingViewController;
  [(_TVBgImageLoadingViewController *)&v5 viewDidAppear:a3];
  double v4 = [(_TVLoadingViewController *)self view];
  [v4 performSelector:sel__showSpinner withObject:0 afterDelay:self->_spinnerDelay];
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_TVLoadingViewController;
  [(_TVBgImageLoadingViewController *)&v12 viewWillAppear:a3];
  double v4 = [(_TVLoadingViewController *)self view];
  objc_super v5 = [v4 loadingTitleLabel];
  [v5 setAlpha:0.0];

  double v6 = [v4 loadingTitleLabel];
  CGAffineTransformMakeScale(&v11, 0.85, 0.85);
  [v6 setTransform:&v11];

  id v7 = (void *)MEMORY[0x263F1CB60];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43___TVLoadingViewController_viewWillAppear___block_invoke;
  v9[3] = &unk_264BA69A0;
  id v10 = v4;
  id v8 = v4;
  [v7 animateWithDuration:v9 animations:0 completion:0.4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_TVLoadingViewController;
  [(_TVLoadingViewController *)&v9 viewWillDisappear:a3];
  double v4 = [(_TVLoadingViewController *)self view];
  objc_super v5 = (void *)MEMORY[0x263F1CB60];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46___TVLoadingViewController_viewWillDisappear___block_invoke;
  v7[3] = &unk_264BA69A0;
  id v8 = v4;
  id v6 = v4;
  [v5 animateWithDuration:v7 animations:0 completion:0.4];
}

- (void)setSpinnerDelay:(double)a3
{
  self->_spinnerDelay = a3;
  double v4 = [(_TVLoadingViewController *)self view];
  objc_super v5 = [v4 spinnerView];
  [v5 alpha];
  double v7 = v6;

  if (v7 < 1.0)
  {
    id v8 = (void *)MEMORY[0x263F8C6D0];
    objc_super v9 = [(_TVLoadingViewController *)self view];
    [v8 cancelPreviousPerformRequestsWithTarget:v9 selector:sel__showSpinner object:0];

    id v10 = [(_TVLoadingViewController *)self view];
    [v10 performSelector:sel__showSpinner withObject:0 afterDelay:self->_spinnerDelay];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingTemplateElement, 0);
  objc_storeStrong((id *)&self->_heroImgElement, 0);
  objc_storeStrong((id *)&self->_bgImageElement, 0);
}

@end