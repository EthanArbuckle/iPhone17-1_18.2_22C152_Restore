@interface _TVAlertTemplateController_iOS
- (void)_dismissAlertControllerAnimated:(BOOL)a3;
- (void)_presentAlertController;
- (void)didMoveToParentViewController:(id)a3;
- (void)updateWithTemplateElement:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _TVAlertTemplateController_iOS

- (void)updateWithTemplateElement:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v43 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v41 = v4;
  v6 = [v4 children];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    v10 = &OBJC_IVAR____TVAppLoadingView__wallpaperView;
    v42 = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (objc_msgSend(v12, "tv_elementType") == 16)
        {
          objc_msgSend(v12, "tv_imageProxy");
          v13 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = v10[37];
          v15 = *(Class *)((char *)&self->super.super.super.isa + v14);
          *(Class *)((char *)&self->super.super.super.isa + v14) = v13;

          [v12 width];
          double v17 = v16;
          [v12 height];
          CGFloat v19 = fmin(v18, 112.0);
          self->_imageSize.width = round(v17 * (v19 / v18));
          self->_imageSize.height = v19;
          continue;
        }
        if (objc_msgSend(v12, "tv_elementType") == 55)
        {
          v20 = [v12 elementName];
          int v21 = [v20 isEqualToString:@"title"];

          if (v21)
          {
            v22 = [v12 text];
            v23 = [v22 string];
            title = self->_title;
            self->_title = v23;

            continue;
          }
          v25 = [v12 elementName];
          int v26 = [v25 isEqualToString:@"description"];

          v27 = [v12 text];
          v28 = [v27 string];
          v29 = v28;
          if (v26)
          {
            message = self->_message;
            self->_message = v28;
          }
          else
          {
            [v43 addObject:v28];
          }
          goto LABEL_28;
        }
        if (objc_msgSend(v12, "tv_elementType") == 6)
        {
          [v5 addObject:v12];
          continue;
        }
        if (objc_msgSend(v12, "tv_elementType") == 44)
        {
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v31 = [v12 children];
          uint64_t v32 = [v31 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v45 != v34) {
                  objc_enumerationMutation(v31);
                }
                v36 = *(void **)(*((void *)&v44 + 1) + 8 * j);
                if (objc_msgSend(v36, "tv_elementType") == 6) {
                  [v5 addObject:v36];
                }
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v44 objects:v52 count:16];
            }
            while (v33);
          }

          v6 = v42;
LABEL_28:
          v10 = &OBJC_IVAR____TVAppLoadingView__wallpaperView;
          continue;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v8);
  }

  v37 = (NSArray *)[v5 copy];
  buttonElements = self->_buttonElements;
  self->_buttonElements = v37;

  v39 = (NSMutableArray *)[v43 copy];
  additionalLabels = self->_additionalLabels;
  self->_additionalLabels = v39;

  if (self->_alertController) {
    [(_TVAlertTemplateController_iOS *)self _presentAlertController];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVAlertTemplateController_iOS;
  [(_TVAlertTemplateController_iOS *)&v4 viewDidAppear:a3];
  [(_TVAlertTemplateController_iOS *)self _presentAlertController];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_TVAlertTemplateController_iOS;
  -[_TVAlertTemplateController_iOS viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(_TVAlertTemplateController_iOS *)self _dismissAlertControllerAnimated:v3];
}

- (void)didMoveToParentViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setOpaque:0];
  }
}

- (void)_dismissAlertControllerAnimated:(BOOL)a3
{
  alertController = self->_alertController;
  if (alertController)
  {
    BOOL v5 = a3;
    v6 = [(UIAlertController *)alertController presentingViewController];
    [v6 dismissViewControllerAnimated:v5 completion:0];

    uint64_t v7 = self->_alertController;
    self->_alertController = 0;
  }
}

- (void)_presentAlertController
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  p_alertController = (id *)&self->_alertController;
  alertController = self->_alertController;
  [(_TVAlertTemplateController_iOS *)self _dismissAlertControllerAnimated:alertController == 0];
  uint64_t v4 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:1];
  id v5 = *p_alertController;
  id *p_alertController = (id)v4;

  v6 = objc_alloc_init(_TVAlertView);
  [(_TVAlertView *)v6 setImageProxy:self->_imageProxy];
  -[_TVAlertView setImageSize:](v6, "setImageSize:", self->_imageSize.width, self->_imageSize.height);
  [(_TVAlertView *)v6 setTitle:self->_title];
  [(_TVAlertView *)v6 setAdditionalLabels:self->_additionalLabels];
  -[_TVAlertView sizeThatFits:](v6, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v8 = v7;
  -[_TVAlertView setFrame:](v6, "setFrame:", 0.0, 0.0, 270.0, v7);
  id v9 = objc_alloc_init(MEMORY[0x263F1CB68]);
  objc_msgSend(v9, "setPreferredContentSize:", 270.0, v8);
  v24 = v6;
  [v9 setView:v6];
  [*p_alertController setContentViewController:v9];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  obuint64_t j = self->_buttonElements;
  uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v38;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v38 != v27)
        {
          uint64_t v11 = v10;
          objc_enumerationMutation(obj);
          uint64_t v10 = v11;
        }
        uint64_t v29 = v10;
        v12 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        v13 = v12;
        uint64_t v14 = [v12 children];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v34 != v16) {
                objc_enumerationMutation(v14);
              }
              double v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              if ([v18 elementType] == 55)
              {
                id v19 = v18;
                v20 = [v19 text];
                int v21 = [v20 string];

                objc_initWeak(&location, self->_alertController);
                v22 = (void *)MEMORY[0x263F1C3F0];
                v30[0] = MEMORY[0x263EF8330];
                v30[1] = 3221225472;
                v30[2] = __57___TVAlertTemplateController_iOS__presentAlertController__block_invoke;
                v30[3] = &unk_264BA7048;
                objc_copyWeak(&v31, &location);
                v30[4] = v13;
                v23 = [v22 actionWithTitle:v21 style:0 handler:v30];
                [(UIAlertController *)self->_alertController addAction:v23];

                objc_destroyWeak(&v31);
                objc_destroyWeak(&location);
              }
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v15);
        }

        uint64_t v10 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v28);
  }

  [(_TVAlertTemplateController_iOS *)self presentViewController:self->_alertController animated:alertController == 0 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_buttonElements, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_additionalLabels, 0);
}

@end