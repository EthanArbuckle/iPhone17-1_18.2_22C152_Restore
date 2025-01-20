@interface _TVDescriptiveAlertTemplateController
- (BOOL)_backgroundImageRequiresBlur;
- (CGSize)_backgroundImageProxySize;
- (id)_backgroundImageProxy;
- (int64_t)_blurEffectStyle;
- (void)_configureWithBgImage:(id)a3 backdropImage:(id)a4;
- (void)_normalizeButtonsInViews:(id)a3;
- (void)loadView;
- (void)updateWithViewElement:(id)a3;
@end

@implementation _TVDescriptiveAlertTemplateController

- (void)updateWithViewElement:(id)a3
{
  uint64_t v159 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v149.receiver = self;
  v149.super_class = (Class)_TVDescriptiveAlertTemplateController;
  [(_TVBgImageLoadingViewController *)&v149 updateWithViewElement:v5];
  objc_storeStrong((id *)&self->_templateElement, a3);
  p_bgImageElement = &self->_bgImageElement;
  bgImageElement = self->_bgImageElement;
  self->_bgImageElement = 0;

  p_bgHeroImageElement = &self->_bgHeroImageElement;
  bgHeroImageElement = self->_bgHeroImageElement;
  self->_bgHeroImageElement = 0;

  id v10 = objc_alloc(MEMORY[0x263EFF980]);
  v11 = [v5 children];
  v104 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  v103 = (void *)[(NSArray *)self->_templateSubcontrollers mutableCopy];
  v101 = [MEMORY[0x263EFF980] array];
  v102 = [MEMORY[0x263EFF980] array];
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  v100 = v5;
  obuint64_t j = [v5 children];
  uint64_t v110 = [obj countByEnumeratingWithState:&v145 objects:v158 count:16];
  if (v110)
  {
    id v105 = 0;
    uint64_t v109 = *(void *)v146;
    double v12 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
    v106 = self;
    do
    {
      for (uint64_t i = 0; i != v110; ++i)
      {
        if (*(void *)v146 != v109) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v145 + 1) + 8 * i);
        if (objc_msgSend(v17, "tv_elementType") == 4)
        {
          long long v143 = 0u;
          long long v144 = 0u;
          long long v141 = 0u;
          long long v142 = 0u;
          id v18 = [v17 children];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v141 objects:v157 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v142;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v142 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v141 + 1) + 8 * j);
                if (objc_msgSend(v23, "tv_elementType") == 16)
                {
                  if (!*p_bgImageElement
                    && (uint64_t v24 = objc_msgSend(v23, "tv_imageType"), v25 = (id *)p_bgImageElement, !v24)
                    || !*p_bgHeroImageElement
                    && (uint64_t v26 = objc_msgSend(v23, "tv_imageType"), v25 = (id *)p_bgHeroImageElement, v26 == 3))
                  {
                    objc_storeStrong(v25, v23);
                  }
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v141 objects:v157 count:16];
            }
            while (v20);
          }
        }
        else
        {
          v27 = [v17 autoHighlightIdentifier];

          uint64_t v111 = i;
          if (v27)
          {
            [v17 resetProperty:2];
            int v108 = 1;
          }
          else if (objc_msgSend(v17, "tv_elementType") == 44)
          {
            long long v139 = 0u;
            long long v140 = 0u;
            long long v137 = 0u;
            long long v138 = 0u;
            v28 = [v17 children];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v137 objects:v156 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              char v31 = 0;
              uint64_t v32 = *(void *)v138;
              do
              {
                for (uint64_t k = 0; k != v30; ++k)
                {
                  if (*(void *)v138 != v32) {
                    objc_enumerationMutation(v28);
                  }
                  v34 = [*(id *)(*((void *)&v137 + 1) + 8 * k) autoHighlightIdentifier];

                  if (v34) {
                    char v31 = 1;
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v137 objects:v156 count:16];
              }
              while (v30);
            }
            else
            {
              char v31 = 0;
            }

            int v108 = v31 & 1;
            uint64_t i = v111;
          }
          else
          {
            int v108 = 0;
          }
          long long v135 = 0u;
          long long v136 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          v35 = self->_templateSubviews;
          uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v133 objects:v155 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v134;
LABEL_39:
            uint64_t v39 = 0;
            while (1)
            {
              if (*(void *)v134 != v38) {
                objc_enumerationMutation(v35);
              }
              id v18 = *(id *)(*((void *)&v133 + 1) + 8 * v39);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v40 = [v18 subviews];
                uint64_t v41 = [v40 firstObject];

                id v18 = (id)v41;
              }
              v42 = objc_msgSend(v18, "tv_associatedIKViewElement");

              if (v42 == v17) {
                break;
              }

              if (v37 == ++v39)
              {
                uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v133 objects:v155 count:16];
                if (v37) {
                  goto LABEL_39;
                }
                id v18 = 0;
                break;
              }
            }
            self = v106;
            uint64_t i = v111;
          }
          else
          {
            id v18 = 0;
          }

          v43 = +[TVInterfaceFactory sharedInterfaceFactory];
          v44 = [v43 _viewFromElement:v17 existingView:v18];

          if (!v44)
          {
            v112 = v17;
            long long v131 = 0u;
            long long v132 = 0u;
            long long v129 = 0u;
            long long v130 = 0u;
            id v45 = v103;
            uint64_t v46 = [v45 countByEnumeratingWithState:&v129 objects:v154 count:16];
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v48 = *(void *)v130;
              while (2)
              {
                for (uint64_t m = 0; m != v47; ++m)
                {
                  if (*(void *)v130 != v48) {
                    objc_enumerationMutation(v45);
                  }
                  v50 = *(void **)(*((void *)&v129 + 1) + 8 * m);
                  v51 = objc_msgSend(v50, "tv_associatedIKViewElement");
                  char v52 = [v51 isEqual:v112];

                  if (v52)
                  {
                    id v53 = v50;

                    if (v53) {
                      [v45 removeObject:v53];
                    }
                    goto LABEL_62;
                  }
                }
                uint64_t v47 = [v45 countByEnumeratingWithState:&v129 objects:v154 count:16];
                if (v47) {
                  continue;
                }
                break;
              }
            }

            id v53 = 0;
LABEL_62:
            uint64_t i = v111;
            v54 = +[TVInterfaceFactory sharedInterfaceFactory];
            v17 = v112;
            id v55 = [v54 _viewControllerFromElement:v112 existingController:v53];

            if (v55)
            {
              self = v106;
              if (v55 != v53) {
                [v101 addObject:v55];
              }
              [v102 addObject:v55];
              v44 = [v55 view];
            }
            else
            {
              v44 = 0;
              self = v106;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v56 = [v17 style];
            objc_msgSend(v56, "tv_width");
            objc_msgSend(v44, "sizeThatFits:");
            double v58 = v57;
            double v60 = v59;

            objc_msgSend(v44, "setSize:", v58, v60);
            v61 = [v44 superview];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v62 = [v44 superview];
            }
            else
            {
              uint64_t v62 = objc_msgSend(objc_alloc(MEMORY[0x263F1C940]), "initWithFrame:", v12, v13, v14, v15);
            }
            v63 = (void *)v62;

            [v63 addSubview:v44];
            [v63 transferLayoutStylesFromElement:v17];
            objc_msgSend(v63, "setContentSize:", v58, v60);
            [v63 setBounces:1];

            v44 = v63;
          }
          if (v44)
          {
            if (v105) {
              int v64 = 0;
            }
            else {
              int v64 = v108;
            }
            if (v64 == 1) {
              id v105 = v44;
            }
            if (objc_msgSend(v17, "tv_elementType") == 44)
            {
              v65 = [v44 components];
              [(_TVDescriptiveAlertTemplateController *)self _normalizeButtonsInViews:v65];
            }
            [v104 addObject:v44];
          }
        }
      }
      uint64_t v110 = [obj countByEnumeratingWithState:&v145 objects:v158 count:16];
    }
    while (v110);
  }
  else
  {
    id v105 = 0;
  }

  [(_TVDescriptiveAlertTemplateController *)self _normalizeButtonsInViews:v104];
  v66 = (NSArray *)[v104 copy];
  templateSubviews = self->_templateSubviews;
  self->_templateSubviews = v66;

  v68 = (NSArray *)[v102 copy];
  templateSubcontrollers = self->_templateSubcontrollers;
  self->_templateSubcontrollers = v68;

  v70 = v100;
  v71 = [v100 style];
  v72 = objc_msgSend(v71, "tv_backgroundColor");
  v73 = [v72 color];
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v73;

  p_preferredFocusView = &self->_preferredFocusView;
  objc_storeStrong((id *)&self->_preferredFocusView, v105);
  if ([(_TVDescriptiveAlertTemplateController *)self isViewLoaded])
  {
    v76 = [(_TVDescriptiveAlertTemplateController *)self view];
    [v76 setBackgroundColor:self->_backgroundColor];

    v77 = [(_TVDescriptiveAlertTemplateController *)self view];
    [v77 transferLayoutStylesFromElement:v100];

    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v78 = v103;
    uint64_t v79 = [v78 countByEnumeratingWithState:&v125 objects:v153 count:16];
    if (v79)
    {
      uint64_t v80 = v79;
      uint64_t v81 = *(void *)v126;
      do
      {
        for (uint64_t n = 0; n != v80; ++n)
        {
          if (*(void *)v126 != v81) {
            objc_enumerationMutation(v78);
          }
          [*(id *)(*((void *)&v125 + 1) + 8 * n) willMoveToParentViewController:0];
        }
        uint64_t v80 = [v78 countByEnumeratingWithState:&v125 objects:v153 count:16];
      }
      while (v80);
    }

    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id v83 = v101;
    uint64_t v84 = [v83 countByEnumeratingWithState:&v121 objects:v152 count:16];
    if (v84)
    {
      uint64_t v85 = v84;
      uint64_t v86 = *(void *)v122;
      do
      {
        for (iuint64_t i = 0; ii != v85; ++ii)
        {
          if (*(void *)v122 != v86) {
            objc_enumerationMutation(v83);
          }
          [(_TVDescriptiveAlertTemplateController *)self addChildViewController:*(void *)(*((void *)&v121 + 1) + 8 * ii)];
        }
        uint64_t v85 = [v83 countByEnumeratingWithState:&v121 objects:v152 count:16];
      }
      while (v85);
    }

    v88 = [(_TVDescriptiveAlertTemplateController *)self view];
    [v88 setChildViews:self->_templateSubviews];

    if (*p_preferredFocusView)
    {
      v89 = [(_TVDescriptiveAlertTemplateController *)self view];
      [v89 setDefaultFocusView:*p_preferredFocusView];
    }
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v90 = v78;
    uint64_t v91 = [v90 countByEnumeratingWithState:&v117 objects:v151 count:16];
    if (v91)
    {
      uint64_t v92 = v91;
      uint64_t v93 = *(void *)v118;
      do
      {
        for (juint64_t j = 0; jj != v92; ++jj)
        {
          if (*(void *)v118 != v93) {
            objc_enumerationMutation(v90);
          }
          [*(id *)(*((void *)&v117 + 1) + 8 * jj) removeFromParentViewController];
        }
        uint64_t v92 = [v90 countByEnumeratingWithState:&v117 objects:v151 count:16];
      }
      while (v92);
    }

    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    id v95 = v83;
    uint64_t v96 = [v95 countByEnumeratingWithState:&v113 objects:v150 count:16];
    v70 = v100;
    if (v96)
    {
      uint64_t v97 = v96;
      uint64_t v98 = *(void *)v114;
      do
      {
        for (kuint64_t k = 0; kk != v97; ++kk)
        {
          if (*(void *)v114 != v98) {
            objc_enumerationMutation(v95);
          }
          [*(id *)(*((void *)&v113 + 1) + 8 * kk) didMoveToParentViewController:self];
        }
        uint64_t v97 = [v95 countByEnumeratingWithState:&v113 objects:v150 count:16];
      }
      while (v97);
    }

    [(_TVDescriptiveAlertTemplateController *)self setNeedsFocusUpdate];
  }
}

- (void)loadView
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [_TVDescriptiveAlertView alloc];
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  id v5 = -[_TVDescriptiveAlertView initWithFrame:](v3, "initWithFrame:");

  [(_TVDescriptiveAlertView *)v5 setBackgroundColor:self->_backgroundColor];
  [(UIView *)v5 transferLayoutStylesFromElement:self->_templateElement];
  [(_TVDescriptiveAlertTemplateController *)self setView:v5];
  if (self->_templateSubviews)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v6 = self->_templateSubcontrollers;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          [(_TVDescriptiveAlertTemplateController *)self addChildViewController:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v8);
    }

    [(_TVDescriptiveAlertView *)v5 setChildViews:self->_templateSubviews];
    if (self->_preferredFocusView) {
      -[_TVDescriptiveAlertView setDefaultFocusView:](v5, "setDefaultFocusView:");
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v11 = self->_templateSubcontrollers;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * j), "didMoveToParentViewController:", self, (void)v16);
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (void)_normalizeButtonsInViews:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    double v9 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v11 = 0.0;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        double v15 = objc_msgSend(v14, "tv_associatedIKViewElement");
        if (objc_msgSend(v15, "tv_elementType") == 6)
        {
          objc_msgSend(v14, "tv_sizeThatFits:", v9, v10);
          double v12 = fmax(v12, v16);
          double v11 = fmax(v11, v17);
          [v4 addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }
  else
  {
    double v11 = 0.0;
    double v12 = 0.0;
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = v4;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        uint64_t v24 = objc_msgSend(NSNumber, "numberWithDouble:", v12, (void)v26);
        [v23 setValue:v24 forTVViewStyle:@"width"];

        v25 = [NSNumber numberWithDouble:v11];
        [v23 setValue:v25 forTVViewStyle:@"height"];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }
}

- (CGSize)_backgroundImageProxySize
{
  bgImageElement = self->_bgImageElement;
  if (bgImageElement || (bgImageElement = self->_bgHeroImageElement) != 0)
  {
    [(IKImageElement *)bgImageElement tv_imageScaleToSize];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_TVDescriptiveAlertTemplateController;
    [(_TVBgImageLoadingViewController *)&v5 _backgroundImageProxySize];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_backgroundImageProxy
{
  if (self->_bgImageElement)
  {
    double v3 = [(IKViewElement *)self->_templateElement appDocument];
    objc_msgSend(v3, "tv_adjustedWindowSize");
    double v5 = v4;
    double v7 = v6;

    uint64_t v8 = objc_opt_new();
    objc_msgSend(v8, "setImageSize:", v5, v7);
    id v9 = +[TVImageLayout layoutWithLayout:v8 element:self->_bgImageElement];
    double v10 = [(IKImageElement *)self->_bgImageElement tv_imageProxyWithLayout:v8];
  }
  else
  {
    bgHeroImageElement = self->_bgHeroImageElement;
    if (bgHeroImageElement)
    {
      double v10 = [(IKImageElement *)bgHeroImageElement tv_imageProxy];
    }
    else
    {
      double v10 = 0;
    }
  }
  return v10;
}

- (BOOL)_backgroundImageRequiresBlur
{
  return !self->_bgImageElement && self->_bgHeroImageElement != 0;
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
  id v5 = a3;
  id v6 = [(_TVDescriptiveAlertTemplateController *)self view];
  [v6 setBgImage:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgHeroImageElement, 0);
  objc_storeStrong((id *)&self->_bgImageElement, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_preferredFocusView, 0);
  objc_storeStrong((id *)&self->_templateSubcontrollers, 0);
  objc_storeStrong((id *)&self->_templateSubviews, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
}

@end