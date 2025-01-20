@interface _TVDivTemplateController
- (CGSize)_backgroundImageProxySize;
- (IKViewElement)viewElement;
- (NSArray)viewControllers;
- (TVImageProxy)backgroundImageProxy;
- (UIImageView)backgroundImageView;
- (_TVDivTemplateController)init;
- (_TVOrganizerView)contentView;
- (id)preferredFocusEnvironments;
- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4;
- (void)_updateContentView;
- (void)loadView;
- (void)setBackgroundImageProxy:(id)a3;
- (void)setBackgroundImageView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)setViewElement:(id)a3;
- (void)updateWithViewElement:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation _TVDivTemplateController

- (_TVDivTemplateController)init
{
  v8.receiver = self;
  v8.super_class = (Class)_TVDivTemplateController;
  v2 = [(_TVDivTemplateController *)&v8 init];
  if (v2)
  {
    v3 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    backgroundImageView = v2->_backgroundImageView;
    v2->_backgroundImageView = v3;

    v5 = objc_alloc_init(_TVOrganizerView);
    contentView = v2->_contentView;
    v2->_contentView = v5;
  }
  return v2;
}

- (void)updateWithViewElement:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25 = self;
  v36.receiver = self;
  v36.super_class = (Class)_TVDivTemplateController;
  [(_TVBgImageLoadingViewController *)&v36 updateWithViewElement:v4];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v26 = v4;
  obuint64_t j = [v4 children];
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v10, "tv_elementType") == 4)
        {
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          v11 = [v10 children];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v29;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v29 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v17 = [v26 appDocument];
                  objc_msgSend(v17, "tv_adjustedWindowSize");
                  double v19 = v18;
                  double v21 = v20;

                  v22 = objc_opt_new();
                  objc_msgSend(v22, "setImageSize:", v19, v21);
                  id v23 = +[TVImageLayout layoutWithLayout:v22 element:v16];
                  uint64_t v24 = objc_msgSend(v16, "tv_imageProxyWithLayout:", v22);

                  v7 = (void *)v24;
                  goto LABEL_17;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  [(_TVDivTemplateController *)v25 setBackgroundImageProxy:v7];
  [(_TVDivTemplateController *)v25 setViewElement:v26];
  [(_TVDivTemplateController *)v25 _updateContentView];
}

- (void)loadView
{
  id v4 = objc_alloc_init(MEMORY[0x263F1CB60]);
  v3 = [(_TVDivTemplateController *)self contentView];
  [v4 addSubview:v3];

  [(_TVDivTemplateController *)self setView:v4];
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)_TVDivTemplateController;
  [(_TVBgImageLoadingViewController *)&v10 viewDidLayoutSubviews];
  v3 = [(_TVDivTemplateController *)self backgroundImageProxy];

  id v4 = [(_TVDivTemplateController *)self backgroundImageView];
  uint64_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = [(_TVDivTemplateController *)self view];
    [v6 bounds];
    objc_msgSend(v5, "setFrame:");

    uint64_t v5 = [(_TVDivTemplateController *)self view];
    v7 = [(_TVDivTemplateController *)self backgroundImageView];
    [v5 insertSubview:v7 atIndex:0];
  }
  else
  {
    [v4 removeFromSuperview];
  }

  uint64_t v8 = [(_TVDivTemplateController *)self contentView];
  v9 = [(_TVDivTemplateController *)self view];
  [v9 bounds];
  objc_msgSend(v8, "setFrame:");
}

- (id)preferredFocusEnvironments
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(_TVDivTemplateController *)self contentView];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (CGSize)_backgroundImageProxySize
{
  v2 = [(_TVDivTemplateController *)self viewElement];
  v3 = [v2 appDocument];
  objc_msgSend(v3, "tv_adjustedWindowSize");
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4
{
  id v5 = a3;
  id v6 = [(_TVDivTemplateController *)self backgroundImageView];
  [v6 setImage:v5];
}

- (void)_updateContentView
{
  v2 = self;
  uint64_t v92 = *MEMORY[0x263EF8340];
  v3 = [(_TVDivTemplateController *)self viewElement];
  double v4 = [(_TVDivTemplateController *)v2 contentView];
  uint64_t v57 = objc_msgSend(v3, "tv_semanticContentAttribute");
  objc_msgSend(v4, "setSemanticContentAttribute:");
  id v5 = [(_TVDivTemplateController *)v2 viewControllers];
  id v6 = (void *)[v5 mutableCopy];

  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __46___TVDivTemplateController__updateContentView__block_invoke;
  v85[3] = &unk_264BA7E18;
  id v54 = v6;
  id v86 = v54;
  uint64_t v7 = MEMORY[0x230FC9DC0](v85);
  v52 = v4;
  double v8 = [v4 components];
  double v9 = (void *)[v8 mutableCopy];

  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __46___TVDivTemplateController__updateContentView__block_invoke_2;
  v83[3] = &unk_264BA7E68;
  id v51 = v9;
  id v84 = v51;
  uint64_t v10 = MEMORY[0x230FC9DC0](v83);
  v58 = [MEMORY[0x263EFF980] array];
  v59 = [MEMORY[0x263EFF980] array];
  v53 = v3;
  [v3 children];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v79 objects:v91 count:16];
  v55 = (void (**)(void, void))v10;
  v56 = (void (**)(void *, void *))v7;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v80;
    id v60 = 0;
    unint64_t v14 = 0x264BA5000uLL;
    v15 = (void (**)(void *, void *))v7;
    do
    {
      uint64_t v16 = 0;
      uint64_t v61 = v12;
      do
      {
        if (*(void *)v80 != v13) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v79 + 1) + 8 * v16);
        if (objc_msgSend(v17, "tv_elementType") != 4)
        {
          uint64_t v18 = v13;
          double v19 = v2;
          double v20 = [v17 autoHighlightIdentifier];

          if (v20) {
            [v17 resetProperty:1];
          }
          double v21 = v15[2](v15, v17);
          [*(id *)(v14 + 2784) sharedInterfaceFactory];
          id v23 = v22 = v14;
          uint64_t v24 = [v23 _viewControllerFromElement:v17 existingController:v21];

          if (v24)
          {
            if (v24 == v21) {
              [v54 removeObject:v21];
            }
            [v58 addObject:v24];
            v25 = [v24 view];
          }
          else
          {
            v26 = v55[2](v55, objc_msgSend(v17, "tv_elementType"));
            v27 = [*(id *)(v22 + 2784) sharedInterfaceFactory];
            v25 = [v27 _viewFromElement:v17 existingView:v26];

            v15 = v56;
          }
          v2 = v19;
          uint64_t v13 = v18;
          if (v25)
          {
            [v25 setSemanticContentAttribute:v57];
            [v59 addObject:v25];
            unint64_t v14 = 0x264BA5000;
            uint64_t v12 = v61;
            if (!v60 && v20) {
              id v60 = v25;
            }
          }
          else
          {
            unint64_t v14 = 0x264BA5000;
            uint64_t v12 = v61;
          }
        }
        ++v16;
      }
      while (v12 != v16);
      uint64_t v12 = [obj countByEnumeratingWithState:&v79 objects:v91 count:16];
    }
    while (v12);
  }
  else
  {
    id v60 = 0;
  }
  long long v28 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v58, "count"));
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v29 = v58;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v75 objects:v90 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v76 != v32) {
          objc_enumerationMutation(v29);
        }
        long long v34 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        long long v35 = [v34 parentViewController];

        if (v35 != v2) {
          [v28 addObject:v34];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v75 objects:v90 count:16];
    }
    while (v31);
  }

  [(_TVDivTemplateController *)v2 setViewControllers:v29];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v36 = v54;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v71 objects:v89 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v72 != v39) {
          objc_enumerationMutation(v36);
        }
        [*(id *)(*((void *)&v71 + 1) + 8 * j) willMoveToParentViewController:0];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v71 objects:v89 count:16];
    }
    while (v38);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v41 = v28;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v67 objects:v88 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v68;
    do
    {
      for (uint64_t k = 0; k != v43; ++k)
      {
        if (*(void *)v68 != v44) {
          objc_enumerationMutation(v41);
        }
        [(_TVDivTemplateController *)v2 addChildViewController:*(void *)(*((void *)&v67 + 1) + 8 * k)];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v67 objects:v88 count:16];
    }
    while (v43);
  }

  [v52 setComponents:v59];
  if (v60) {
    objc_msgSend(v52, "setPreferredFocusedComponent:");
  }
  [v52 transferLayoutStylesFromElement:v53];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v46 = v41;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v63 objects:v87 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v64;
    do
    {
      for (uint64_t m = 0; m != v48; ++m)
      {
        if (*(void *)v64 != v49) {
          objc_enumerationMutation(v46);
        }
        [*(id *)(*((void *)&v63 + 1) + 8 * m) didMoveToParentViewController:v2];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v63 objects:v87 count:16];
    }
    while (v48);
  }
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
}

- (TVImageProxy)backgroundImageProxy
{
  return self->_backgroundImageProxy;
}

- (void)setBackgroundImageProxy:(id)a3
{
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (_TVOrganizerView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (NSArray)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageProxy, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end