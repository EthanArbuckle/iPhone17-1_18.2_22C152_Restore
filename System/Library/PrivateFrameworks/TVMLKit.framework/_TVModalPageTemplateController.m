@interface _TVModalPageTemplateController
- (BOOL)_updateWithCollectionListElement:(id)a3;
- (id)_viewControllerWithElement:(id)a3 existingController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (void)_tapAction:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)updateWithViewElement:(id)a3;
- (void)viewDidLoad;
@end

@implementation _TVModalPageTemplateController

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  id v11 = (id)objc_msgSend(v3, "initWithFrame:");

  v5 = [(IKViewElement *)self->_backgroundElement style];
  v6 = objc_msgSend(v5, "tv_backgroundColor");
  v7 = [v6 color];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.3];
  }
  v10 = v9;

  [v11 setBackgroundColor:v10];
  [(_TVModalPageTemplateController *)self setView:v11];
}

- (void)viewDidLoad
{
  v14[1] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)_TVModalPageTemplateController;
  [(_TVModalPageTemplateController *)&v13 viewDidLoad];
  id v3 = (UIPageViewController *)[objc_alloc(MEMORY[0x263F1C830]) initWithTransitionStyle:1 navigationOrientation:0 options:0];
  pageViewController = self->_pageViewController;
  self->_pageViewController = v3;

  [(UIPageViewController *)self->_pageViewController setDataSource:self];
  v5 = [(UIPageViewController *)self->_pageViewController view];
  [(_TVModalPageTemplateController *)self addChildViewController:self->_pageViewController];
  v6 = [(_TVModalPageTemplateController *)self view];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");

  [v5 setAutoresizingMask:18];
  v7 = [(_TVModalPageTemplateController *)self view];
  [v7 addSubview:v5];

  [(UIPageViewController *)self->_pageViewController didMoveToParentViewController:self];
  if ([(NSArray *)self->_viewControllers count])
  {
    v8 = self->_pageViewController;
    id v9 = [(NSArray *)self->_bezelViewControllers firstObject];
    v14[0] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    [(UIPageViewController *)v8 setViewControllers:v10 direction:0 animated:0 completion:0];
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__tapAction_];
  v12 = [(_TVModalPageTemplateController *)self view];
  [v12 addGestureRecognizer:v11];
}

- (void)didMoveToParentViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setOpaque:0];
  }
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  if ([(NSArray *)self->_bezelViewControllers indexOfObjectIdenticalTo:a4] - 1 > 0x7FFFFFFFFFFFFFFDLL)
  {
    v5 = 0;
  }
  else
  {
    v5 = -[NSArray objectAtIndex:](self->_bezelViewControllers, "objectAtIndex:");
  }
  return v5;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  unint64_t v5 = [(NSArray *)self->_bezelViewControllers indexOfObjectIdenticalTo:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v6 = v5, v5 >= [(NSArray *)self->_bezelViewControllers count] - 1))
  {
    v7 = 0;
  }
  else
  {
    v7 = [(NSArray *)self->_bezelViewControllers objectAtIndex:v6 + 1];
  }
  return v7;
}

- (void)_tapAction:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(_TVModalPageTemplateController *)self view];
  unint64_t v6 = [(_TVModalPageTemplateController *)self view];
  [v4 locationInView:v6];
  v7 = objc_msgSend(v5, "hitTest:withEvent:", 0);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = self->_bezelViewControllers;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v8);
      }
      objc_super v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "contentViewController", (void)v18);
      if ([v13 isViewLoaded])
      {
        v14 = [v13 view];
        char v15 = [v7 isDescendantOfView:v14];

        if (v15) {
          goto LABEL_14;
        }
      }

      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v8 = +[_TVModalPresenter presenter];
  v16 = [(NSArray *)v8 presentedViewController];

  if (v16)
  {
    objc_super v13 = [(NSArray *)v8 presentedViewController];
    [(NSArray *)v8 hideController:v13 animated:1 withCompletion:0];
LABEL_14:

    goto LABEL_15;
  }
  v17 = [(_TVModalPageTemplateController *)self presentingViewController];

  if (v17)
  {
    objc_super v13 = [(_TVModalPageTemplateController *)self presentingViewController];
    [v13 dismissViewControllerAnimated:1 completion:0];
    goto LABEL_14;
  }
LABEL_15:
}

- (void)updateWithViewElement:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v60 = a3;
  id v4 = [v60 children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v81 objects:v90 count:16];
  if (!v5)
  {
    v7 = 0;
    v8 = 0;
    goto LABEL_15;
  }
  uint64_t v6 = v5;
  v7 = 0;
  v8 = 0;
  uint64_t v9 = *(void *)v82;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v82 != v9) {
        objc_enumerationMutation(v4);
      }
      uint64_t v11 = *(void **)(*((void *)&v81 + 1) + 8 * i);
      uint64_t v12 = objc_msgSend(v11, "tv_elementType");
      if (v12 == 4)
      {
        objc_super v13 = v7;
        v7 = v11;
      }
      else
      {
        if (v12 != 10) {
          continue;
        }
        objc_super v13 = v8;
        v8 = v11;
      }
      id v14 = v11;
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v81 objects:v90 count:16];
  }
  while (v6);
LABEL_15:

  p_viewElement = &self->_viewElement;
  objc_storeStrong((id *)&self->_viewElement, a3);
  objc_storeStrong((id *)&self->_collectionListElement, v8);
  objc_storeStrong((id *)&self->_backgroundElement, v7);
  BOOL v59 = [(_TVModalPageTemplateController *)self _updateWithCollectionListElement:self->_collectionListElement];
  char v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_viewControllers, "count"));
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v16 = self->_viewControllers;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v77 objects:v89 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v78;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v78 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v77 + 1) + 8 * j);
        v22 = objc_alloc_init(_TVModalPageBezelViewController);
        [(_TVModalPageBezelViewController *)v22 setContentViewController:v21];
        [v15 addObject:v22];
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v77 objects:v89 count:16];
    }
    while (v18);
  }

  uint64_t v23 = (NSArray *)[v15 copy];
  bezelViewControllers = self->_bezelViewControllers;
  self->_bezelViewControllers = v23;

  if (v59)
  {
    pageViewController = self->_pageViewController;
    v26 = [(NSArray *)self->_bezelViewControllers firstObject];
    v88 = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
    [(UIPageViewController *)pageViewController setViewControllers:v27 direction:0 animated:0 completion:0];
  }
  v28 = &self->_viewElement;
  if ([(_TVModalPageTemplateController *)self isViewLoaded])
  {
    v29 = [(IKViewElement *)self->_backgroundElement style];
    v30 = objc_msgSend(v29, "tv_backgroundColor");
    v31 = [v30 color];

    if (v31)
    {
      v32 = [(_TVModalPageTemplateController *)self view];
      [v32 setBackgroundColor:v31];
    }
  }
  long long v75 = TVCornerRadiiZero;
  long long v76 = *(_OWORD *)&qword_230C384E8;
  if (+[TVMLUtilities _cornerRadiiFromElement:*p_viewElement cornerRadii:&v75 circle:0])
  {
    +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v75, v76);
    double v34 = v33;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v35 = self->_bezelViewControllers;
    uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v71 objects:v87 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v72;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v72 != v38) {
            objc_enumerationMutation(v35);
          }
          [*(id *)(*((void *)&v71 + 1) + 8 * k) setBezelCornerRadius:v34];
        }
        uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v71 objects:v87 count:16];
      }
      while (v37);
    }
  }
  v40 = [(IKViewElement *)*p_viewElement style];
  v41 = objc_msgSend(v40, "tv_backgroundColor");
  v42 = [v41 color];

  if (v42)
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v43 = self->_bezelViewControllers;
    uint64_t v44 = [(NSArray *)v43 countByEnumeratingWithState:&v67 objects:v86 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v68;
      do
      {
        for (uint64_t m = 0; m != v45; ++m)
        {
          if (*(void *)v68 != v46) {
            objc_enumerationMutation(v43);
          }
          [*(id *)(*((void *)&v67 + 1) + 8 * m) setBezelBackgroundColor:v42];
        }
        uint64_t v45 = [(NSArray *)v43 countByEnumeratingWithState:&v67 objects:v86 count:16];
      }
      while (v45);
    }

    v28 = &self->_viewElement;
  }
  v48 = [(IKViewElement *)*v28 style];
  objc_msgSend(v48, "tv_width");
  double v50 = v49;

  v51 = [(IKViewElement *)*v28 style];
  objc_msgSend(v51, "tv_height");
  double v53 = v52;

  if (v50 > 0.0 && v53 > 0.0)
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v54 = self->_bezelViewControllers;
    uint64_t v55 = [(NSArray *)v54 countByEnumeratingWithState:&v63 objects:v85 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v64;
      do
      {
        for (uint64_t n = 0; n != v56; ++n)
        {
          if (*(void *)v64 != v57) {
            objc_enumerationMutation(v54);
          }
          objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * n), "setContentSize:", v50, v53);
        }
        uint64_t v56 = [(NSArray *)v54 countByEnumeratingWithState:&v63 objects:v85 count:16];
      }
      while (v56);
    }
  }
}

- (BOOL)_updateWithCollectionListElement:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 updateType] == 2
    && ([v4 children],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        NSUInteger v7 = [(NSArray *)self->_viewControllers count],
        v5,
        v6 == v7))
  {
    v8 = [v4 children];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __67___TVModalPageTemplateController__updateWithCollectionListElement___block_invoke;
    v60[3] = &unk_264BA7608;
    v60[4] = self;
    [v8 enumerateObjectsUsingBlock:v60];

    LOBYTE(v9) = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F1C920] mainScreen];
    [v10 bounds];
    double Width = CGRectGetWidth(v65);

    id v12 = objc_alloc(MEMORY[0x263EFF980]);
    objc_super v13 = [v4 children];
    v40 = objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

    uint64_t v44 = (void *)[(NSArray *)self->_viewControllers mutableCopy];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v39 = v4;
    obuint64_t j = [v4 children];
    v42 = self;
    uint64_t v45 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
    uint64_t v9 = 0;
    if (v45)
    {
      uint64_t v43 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          uint64_t v15 = v9;
          if (*(void *)v57 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v17 = v44;
          id v18 = (id)[v17 countByEnumeratingWithState:&v52 objects:v62 count:16];
          if (v18)
          {
            unsigned int v46 = v9;
            uint64_t v47 = i;
            uint64_t v19 = *(void *)v53;
            while (2)
            {
              for (uint64_t j = 0; j != v18; uint64_t j = (char *)j + 1)
              {
                if (*(void *)v53 != v19) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v21 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
                v22 = objc_msgSend(v21, "tv_associatedIKViewElement");
                uint64_t v23 = [[_TVShadowViewElementID alloc] initWithViewElement:v22];
                v24 = [[_TVShadowViewElementID alloc] initWithViewElement:v16];
                if ([(_TVShadowViewElementID *)v23 isEqual:v24])
                {
                  id v18 = v21;

                  goto LABEL_19;
                }
              }
              id v18 = (id)[v17 countByEnumeratingWithState:&v52 objects:v62 count:16];
              if (v18) {
                continue;
              }
              break;
            }
LABEL_19:
            self = v42;
            uint64_t i = v47;
            uint64_t v15 = v46;
          }

          id v25 = [(_TVModalPageTemplateController *)self _viewControllerWithElement:v16 existingController:v18];
          v26 = [v25 view];
          objc_msgSend(v26, "tv_sizeThatFits:", Width, 0.0);
          double v28 = v27;

          if (v28 == 0.0)
          {

            id v25 = 0;
          }
          else if (v25)
          {
            [v40 addObject:v25];
          }
          uint64_t v9 = 1;
          if (v18 && v18 == v25)
          {
            [v17 removeObjectIdenticalTo:v18];
            uint64_t v9 = v15;
          }
        }
        uint64_t v45 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
      }
      while (v45);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v29 = v44;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v61 count:16];
    id v4 = v39;
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v49;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v49 != v32) {
            objc_enumerationMutation(v29);
          }
          double v34 = *(void **)(*((void *)&v48 + 1) + 8 * k);
          [v34 willMoveToParentViewController:0];
          v35 = [v34 view];
          [v35 removeFromSuperview];

          [v34 removeFromParentViewController];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v48 objects:v61 count:16];
      }
      while (v31);
    }

    uint64_t v36 = [v40 copy];
    viewControllers = v42->_viewControllers;
    v42->_viewControllers = (NSArray *)v36;
  }
  return v9 & 1;
}

- (id)_viewControllerWithElement:(id)a3 existingController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  NSUInteger v7 = +[TVInterfaceFactory sharedInterfaceFactory];
  v8 = [v7 _viewControllerFromElement:v5 existingController:v6];

  if (!v8)
  {
    uint64_t v9 = +[TVInterfaceFactory sharedInterfaceFactory];
    uint64_t v10 = [v6 view];
    uint64_t v11 = [v9 _viewFromElement:v5 existingView:v10];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v12 = (_TVModalPageSupplementalViewController *)v6;
      }
      else {
        id v12 = objc_alloc_init(_TVModalPageSupplementalViewController);
      }
      v8 = v12;
      [(_TVModalPageSupplementalViewController *)v12 setView:v11];
      objc_msgSend(v8, "tv_setAssociatedIKViewElement:", v5);
    }
    else
    {
      v8 = 0;
    }
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_collectionListElement, 0);
  objc_storeStrong((id *)&self->_bezelViewControllers, 0);
  objc_storeStrong((id *)&self->_backgroundElement, 0);
}

@end