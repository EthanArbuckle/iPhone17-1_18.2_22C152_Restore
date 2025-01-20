@interface _TVProductStackView
+ (id)productStackViewWithElement:(id)a3 existingView:(id)a4;
- (IKViewElement)stackElement;
- (NSArray)viewsAboveDescription;
- (NSArray)viewsBelowDescription;
- (UIView)buttonsRowView;
- (UIView)descriptionView;
- (UIView)initialFocusView;
- (UIView)titleView;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (id)preferredFocusEnvironments;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setButtonsRowView:(id)a3;
- (void)setDescriptionView:(id)a3;
- (void)setInitialFocusView:(id)a3;
- (void)setStackElement:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setViewsAboveDescription:(id)a3;
- (void)setViewsBelowDescription:(id)a3;
@end

@implementation _TVProductStackView

+ (id)productStackViewWithElement:(id)a3 existingView:(id)a4
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = (_TVProductStackView *)v6;
  }
  else
  {
    v8 = [_TVProductStackView alloc];
    v7 = -[_TVFocusRedirectView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  v9 = v7;
  id v85 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v81 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10 = [v5 children];
  uint64_t v11 = [v10 count];

  uint64_t v12 = v11 - 1;
  v83 = v9;
  if (v11 - 1 < 0)
  {
    id v21 = 0;
  }
  else
  {
    do
    {
      v13 = [v5 children];
      v14 = [v13 objectAtIndexedSubscript:v12];

      if (objc_msgSend(v14, "tv_elementType") == 44)
      {
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        v15 = [v14 children];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v109 objects:v117 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v110;
          while (2)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v110 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v109 + 1) + 8 * i);
              if (objc_msgSend(v20, "tv_elementType") == 7 || objc_msgSend(v20, "tv_elementType") == 6)
              {
                id v21 = v14;
                v9 = v83;
                goto LABEL_19;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v109 objects:v117 count:16];
            id v21 = 0;
            v9 = v83;
            if (v17) {
              continue;
            }
            break;
          }
        }
        else
        {
          id v21 = 0;
        }
LABEL_19:
      }
      else
      {
        id v21 = 0;
      }

      BOOL v22 = v12-- < 1;
    }
    while (!v22 && !v21);
  }
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v23 = [v21 children];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v105 objects:v116 count:16];
  id v78 = v6;
  v89 = v21;
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v106;
    while (2)
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v106 != v26) {
          objc_enumerationMutation(v23);
        }
        if (objc_msgSend(*(id *)(*((void *)&v105 + 1) + 8 * j), "tv_elementType", v78) == 7)
        {
          int v82 = 0;
          goto LABEL_34;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v105 objects:v116 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }
  int v82 = 1;
LABEL_34:

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  obuint64_t j = [v5 children];
  uint64_t v28 = [obj countByEnumeratingWithState:&v101 objects:v115 count:16];
  id v29 = v81;
  if (!v28)
  {
    id v86 = 0;
    id v87 = 0;
    v84 = 0;
    v88 = 0;
    uint64_t v90 = 0;
    id v91 = 0;
    goto LABEL_106;
  }
  uint64_t v30 = v28;
  id v86 = 0;
  id v87 = 0;
  v84 = 0;
  v88 = 0;
  uint64_t v90 = 0;
  id v91 = 0;
  uint64_t v31 = *(void *)v102;
  id v80 = v5;
  do
  {
    for (uint64_t k = 0; k != v30; ++k)
    {
      if (*(void *)v102 != v31) {
        objc_enumerationMutation(obj);
      }
      v33 = *(void **)(*((void *)&v101 + 1) + 8 * k);
      uint64_t v34 = objc_msgSend(v33, "tv_elementType", v78);
      if (v34 != 55)
      {
        if (v34 == 16)
        {
          if (!v91)
          {
            if (objc_msgSend(v33, "tv_imageType")) {
              id v91 = 0;
            }
            else {
              id v91 = v33;
            }
          }
          continue;
        }
LABEL_49:
        if ([v5 updateType] == 1)
        {
          if (v33 == v89)
          {
            id v38 = [(_TVProductStackView *)v9 buttonsRowView];
          }
          else
          {
            if ([v33 updateType]) {
              goto LABEL_52;
            }
            v39 = [(_TVProductStackView *)v9 descriptionView];
            v40 = objc_msgSend(v39, "tv_associatedIKViewElement");

            if (v40 != v33
              || ([(_TVProductStackView *)v9 descriptionView],
                  (id v38 = (id)objc_claimAutoreleasedReturnValue()) == 0))
            {
              long long v99 = 0u;
              long long v100 = 0u;
              long long v97 = 0u;
              long long v98 = 0u;
              v41 = [(_TVProductStackView *)v9 viewsAboveDescription];
              uint64_t v42 = [v41 countByEnumeratingWithState:&v97 objects:v114 count:16];
              if (v42)
              {
                uint64_t v43 = v42;
                uint64_t v44 = *(void *)v98;
LABEL_57:
                uint64_t v45 = 0;
                while (1)
                {
                  if (*(void *)v98 != v44) {
                    objc_enumerationMutation(v41);
                  }
                  v46 = *(void **)(*((void *)&v97 + 1) + 8 * v45);
                  v47 = objc_msgSend(v46, "tv_associatedIKViewElement");

                  if (v47 == v33) {
                    break;
                  }
                  if (v43 == ++v45)
                  {
                    uint64_t v43 = [v41 countByEnumeratingWithState:&v97 objects:v114 count:16];
                    id v29 = v81;
                    if (v43) {
                      goto LABEL_57;
                    }
                    goto LABEL_63;
                  }
                }
                id v38 = v46;

                id v5 = v80;
                id v29 = v81;
                v9 = v83;
                if (v38) {
                  goto LABEL_80;
                }
              }
              else
              {
LABEL_63:

                id v5 = v80;
                v9 = v83;
              }
              long long v95 = 0u;
              long long v96 = 0u;
              long long v93 = 0u;
              long long v94 = 0u;
              v48 = [(_TVProductStackView *)v9 viewsBelowDescription];
              id v38 = (id)[v48 countByEnumeratingWithState:&v93 objects:v113 count:16];
              if (v38)
              {
                uint64_t v49 = *(void *)v94;
                while (2)
                {
                  for (m = 0; m != v38; m = (char *)m + 1)
                  {
                    if (*(void *)v94 != v49) {
                      objc_enumerationMutation(v48);
                    }
                    v51 = *(void **)(*((void *)&v93 + 1) + 8 * (void)m);
                    v52 = objc_msgSend(v51, "tv_associatedIKViewElement");

                    if (v52 == v33)
                    {
                      id v38 = v51;
                      goto LABEL_78;
                    }
                  }
                  id v38 = (id)[v48 countByEnumeratingWithState:&v93 objects:v113 count:16];
                  if (v38) {
                    continue;
                  }
                  break;
                }
LABEL_78:
                id v5 = v80;
                id v29 = v81;
                v9 = v83;
              }
            }
          }
        }
        else
        {
LABEL_52:
          id v38 = 0;
        }
LABEL_80:
        v53 = +[TVInterfaceFactory sharedInterfaceFactory];
        v54 = [v53 _viewFromElement:v33 existingView:v38];

        if (v54)
        {
          if (objc_msgSend(v33, "tv_elementType") == 44)
          {
            if (!v86)
            {
              if ([v54 canBecomeFocused]) {
                id v86 = v54;
              }
              else {
                id v86 = 0;
              }
            }
            v55 = [v33 style];
            objc_msgSend(v55, "tv_height");
            double v57 = v56;

            v58 = [v33 style];
            objc_msgSend(v58, "tv_interitemSpacing");
            double v60 = v59;

            if (v33 == v89)
            {
              id v61 = v54;

              [v61 setContentVerticalAlignment:1];
              [v61 _setSpeedBumpEdges:5];
              v84 = v61;
            }
            if (v57 == 0.0 || v60 == 0.0)
            {
              int v62 = v82;
              if (v33 != v89) {
                int v62 = 1;
              }
              if (v62) {
                v63 = &unk_26E59ECB8;
              }
              else {
                v63 = &unk_26E59EC98;
              }
              [v54 setValue:v63 forTVViewStyle:@"height"];
              [v54 setValue:&unk_26E59ECA8 forTVViewStyle:@"tv-interitem-spacing"];
            }
          }
          if (v90) {
            v64 = v29;
          }
          else {
            v64 = v85;
          }
          [v64 addObject:v54];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v65 = v54;

            v88 = v65;
          }
        }

        continue;
      }
      if (objc_msgSend(v33, "tv_textStyle") != 1)
      {
        if (objc_msgSend(v33, "tv_textStyle") == 3)
        {
          v35 = +[TVInterfaceFactory sharedInterfaceFactory];
          v36 = [(_TVProductStackView *)v9 descriptionView];
          uint64_t v37 = [v35 _viewFromElement:v33 existingView:v36];

          uint64_t v90 = v37;
          continue;
        }
        goto LABEL_49;
      }
      if (!v87) {
        id v87 = v33;
      }
    }
    uint64_t v30 = [obj countByEnumeratingWithState:&v101 objects:v115 count:16];
  }
  while (v30);
LABEL_106:

  v66 = +[TVInterfaceFactory sharedInterfaceFactory];
  if (v91) {
    id v67 = v91;
  }
  else {
    id v67 = v87;
  }
  [(_TVProductStackView *)v9 titleView];
  v69 = id v68 = v29;
  v70 = [v66 _viewFromElement:v67 existingView:v69];

  [(_TVProductStackView *)v9 setTitleView:v70];
  [(_TVProductStackView *)v9 setButtonsRowView:v84];
  [(_TVProductStackView *)v9 setViewsAboveDescription:v85];
  [(_TVProductStackView *)v9 setDescriptionView:v90];
  [(_TVProductStackView *)v9 setViewsBelowDescription:v68];
  id v71 = v86;
  if (v88) {
    id v71 = v88;
  }
  if (v84) {
    v72 = v84;
  }
  else {
    v72 = v71;
  }
  [(_TVProductStackView *)v9 setInitialFocusView:v72];
  [(_TVProductStackView *)v9 setStackElement:v5];
  uint64_t v73 = [(_TVProductStackView *)v9 initialFocusView];
  unint64_t v74 = v73 | v90;

  if (!v74)
  {
    v75 = [(_TVFocusRedirectView *)v9 containerGuide];
    [v75 setEnabled:0];
  }
  v76 = v9;

  return v76;
}

- (id)preferredFocusEnvironments
{
  v7[1] = *MEMORY[0x263EF8340];
  p_lastFocusedView = &self->_lastFocusedView;
  lastFocusedView = self->_lastFocusedView;
  if (lastFocusedView) {
    goto LABEL_5;
  }
  initialFocusView = self->_initialFocusView;
  if (!initialFocusView) {
    initialFocusView = self->_descriptionView;
  }
  objc_storeStrong((id *)&self->_lastFocusedView, initialFocusView);
  lastFocusedView = *p_lastFocusedView;
  if (*p_lastFocusedView)
  {
LABEL_5:
    v7[0] = lastFocusedView;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }
  return v5;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v11 = [a3 nextFocusedView];
  uint64_t v5 = [(UIView *)v11 isDescendantOfView:self];
  id v6 = v11;
  if (v5)
  {
    BOOL v7 = [(UIView *)v11 isDescendantOfView:self->_buttonsRowView];
    buttonsRowView = v11;
    if (v7) {
      buttonsRowView = self->_buttonsRowView;
    }
    v9 = buttonsRowView;
    lastFocusedView = self->_lastFocusedView;
    self->_lastFocusedView = v9;

    id v6 = v11;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)setTitleView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  titleView = self->_titleView;
  BOOL v7 = v5;
  if (titleView != v5)
  {
    [(UIView *)titleView removeFromSuperview];
    objc_storeStrong((id *)&self->_titleView, a3);
    if (self->_titleView) {
      -[_TVProductStackView addSubview:](self, "addSubview:");
    }
  }
  [(_TVProductStackView *)self setNeedsLayout];
}

- (void)setViewsAboveDescription:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_viewsAboveDescription = &self->_viewsAboveDescription;
  if (![(NSArray *)self->_viewsAboveDescription isEqualToArray:v5])
  {
    [(NSArray *)*p_viewsAboveDescription makeObjectsPerformSelector:sel_removeFromSuperview];
    objc_storeStrong((id *)&self->_viewsAboveDescription, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v7 = *p_viewsAboveDescription;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[_TVProductStackView addSubview:](self, "addSubview:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  [(_TVProductStackView *)self setNeedsLayout];
}

- (void)setDescriptionView:(id)a3
{
  id v5 = (UIView *)a3;
  p_descriptionView = &self->_descriptionView;
  descriptionView = self->_descriptionView;
  if (descriptionView != v5)
  {
    uint64_t v9 = v5;
    if (descriptionView) {
      BOOL v8 = self->_lastFocusedView == descriptionView;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      objc_storeStrong((id *)&self->_lastFocusedView, a3);
      [(_TVProductStackView *)self setNeedsFocusUpdate];
      descriptionView = *p_descriptionView;
    }
    [(UIView *)descriptionView removeFromSuperview];
    objc_storeStrong((id *)&self->_descriptionView, a3);
    if (*p_descriptionView) {
      -[_TVProductStackView addSubview:](self, "addSubview:");
    }
    descriptionView = (UIView *)[(_TVProductStackView *)self setNeedsLayout];
    id v5 = v9;
  }
  MEMORY[0x270F9A758](descriptionView, v5);
}

- (void)setViewsBelowDescription:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_viewsBelowDescription = &self->_viewsBelowDescription;
  if (![(NSArray *)self->_viewsBelowDescription isEqualToArray:v5])
  {
    [(NSArray *)*p_viewsBelowDescription makeObjectsPerformSelector:sel_removeFromSuperview];
    objc_storeStrong((id *)&self->_viewsBelowDescription, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v7 = *p_viewsBelowDescription;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[_TVProductStackView addSubview:](self, "addSubview:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  [(_TVProductStackView *)self setNeedsLayout];
}

- (void)setButtonsRowView:(id)a3
{
  id v5 = (UIView *)a3;
  buttonsRowView = self->_buttonsRowView;
  if (self->_lastFocusedView == buttonsRowView && buttonsRowView != 0)
  {
    objc_storeStrong((id *)&self->_lastFocusedView, a3);
    [(_TVProductStackView *)self setNeedsFocusUpdate];
  }
  uint64_t v8 = self->_buttonsRowView;
  self->_buttonsRowView = v5;
}

- (void)setInitialFocusView:(id)a3
{
  id v5 = (UIView *)a3;
  initialFocusView = self->_initialFocusView;
  if (initialFocusView != v5)
  {
    uint64_t v9 = v5;
    lastFocusedView = self->_lastFocusedView;
    if (initialFocusView) {
      BOOL v8 = lastFocusedView == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8
      && (lastFocusedView == initialFocusView || -[UIView isDescendantOfView:](lastFocusedView, "isDescendantOfView:")))
    {
      objc_storeStrong((id *)&self->_lastFocusedView, a3);
      [(_TVProductStackView *)self setNeedsFocusUpdate];
    }
    objc_storeStrong((id *)&self->_initialFocusView, a3);
    id v5 = v9;
  }
}

- (void)layoutSubviews
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  v67.receiver = self;
  v67.super_class = (Class)_TVProductStackView;
  [(_TVFocusRedirectView *)&v67 layoutSubviews];
  [(_TVProductStackView *)self bounds];
  CGFloat x = v71.origin.x;
  CGFloat y = v71.origin.y;
  CGFloat width = v71.size.width;
  CGFloat height = v71.size.height;
  double v7 = CGRectGetHeight(v71);
  v72.origin.CGFloat x = x;
  v72.origin.CGFloat y = y;
  v72.size.CGFloat width = width;
  v72.size.CGFloat height = height;
  double v8 = CGRectGetWidth(v72);
  [(UIView *)self->_titleView tv_itemHeight];
  double v10 = v9;
  [(UIView *)self->_titleView tv_margin];
  double v12 = v11;
  double v58 = v13;
  v73.origin.CGFloat x = x;
  v73.origin.CGFloat y = y;
  v73.size.CGFloat width = width;
  v73.size.CGFloat height = height;
  double v14 = CGRectGetWidth(v73);
  long long v15 = [(UIView *)self->_titleView tv_associatedIKViewElement];
  uint64_t v16 = objc_msgSend(v15, "tv_elementType");

  double v17 = 0.0;
  if (v16 == 55)
  {
    -[UIView sizeThatFits:](self->_titleView, "sizeThatFits:", v14, v10);
    double v19 = v18;
    double v20 = fmax(v10 - v18, 0.0);
    double v21 = fmin(v10, v19);
  }
  else
  {
    double v21 = v10;
    double v20 = 0.0;
  }
  -[UIView setFrame:](self->_titleView, "setFrame:", v12, v20, v14, v21);
  double v22 = v58 + v10 + v12;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v23 = self->_viewsAboveDescription;
  uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v64;
    do
    {
      uint64_t v27 = 0;
      double v28 = v17;
      do
      {
        if (*(void *)v64 != v26) {
          objc_enumerationMutation(v23);
        }
        id v29 = *(void **)(*((void *)&v63 + 1) + 8 * v27);
        objc_msgSend(v29, "tv_itemHeight");
        double v31 = v30;
        objc_msgSend(v29, "tv_margin");
        double v17 = v32;
        double v34 = v22 + fmax(v28, v33);
        objc_msgSend(v29, "sizeThatFits:", v8, v31);
        if (v31 == 0.0) {
          double v31 = v35;
        }
        objc_msgSend(v29, "setFrame:", 0.0, v34, v8, v31);
        double v22 = v34 + v31;
        ++v27;
        double v28 = v17;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v25);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v36 = [(NSArray *)self->_viewsBelowDescription reverseObjectEnumerator];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v60;
    double v40 = 0.0;
    do
    {
      uint64_t v41 = 0;
      double v42 = v40;
      do
      {
        if (*(void *)v60 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v43 = *(void **)(*((void *)&v59 + 1) + 8 * v41);
        objc_msgSend(v43, "tv_itemHeight");
        double v45 = v44;
        objc_msgSend(v43, "tv_margin");
        double v40 = v46;
        double v48 = v47;
        objc_msgSend(v43, "sizeThatFits:", v8, v45);
        if (v45 == 0.0) {
          double v50 = v49;
        }
        else {
          double v50 = v45;
        }
        double v7 = v7 - (fmax(v42, v48) + v50);
        objc_msgSend(v43, "setFrame:", 0.0, v7, v8);
        ++v41;
        double v42 = v40;
      }
      while (v38 != v41);
      uint64_t v38 = [v36 countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v38);
  }
  else
  {
    double v40 = 0.0;
  }

  [(UIView *)self->_descriptionView tv_margin];
  double v52 = fmax(v51, v17);
  double v54 = v7 - v40 - v22 - v52 - fmax(v53, v40);
  double v55 = *MEMORY[0x263F001A8];
  -[UIView sizeThatFits:](self->_descriptionView, "sizeThatFits:", v8, v54);
  -[UIView setFrame:](self->_descriptionView, "setFrame:", v55, v22 + v52, v56, v57);
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_TVProductStackView *)self stackElement];
  id v6 = [v5 appDocument];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    double v8 = [MEMORY[0x263EFF980] array];
    double v9 = [(_TVProductStackView *)self titleView];
    double v10 = objc_msgSend(v9, "tv_impressionableElementsForDocument:", v4);
    [v8 addObjectsFromArray:v10];

    double v11 = [(_TVProductStackView *)self descriptionView];
    double v12 = objc_msgSend(v11, "tv_impressionableElementsForDocument:", v4);
    [v8 addObjectsFromArray:v12];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    double v13 = [(_TVProductStackView *)self viewsAboveDescription];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          double v18 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "tv_impressionableElementsForDocument:", v4);
          [v8 addObjectsFromArray:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v15);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v19 = [(_TVProductStackView *)self viewsBelowDescription];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "tv_impressionableElementsForDocument:", v4);
          [v8 addObjectsFromArray:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v21);
    }

    if ([v8 count])
    {
      uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (NSArray)viewsAboveDescription
{
  return self->_viewsAboveDescription;
}

- (UIView)descriptionView
{
  return self->_descriptionView;
}

- (NSArray)viewsBelowDescription
{
  return self->_viewsBelowDescription;
}

- (UIView)buttonsRowView
{
  return self->_buttonsRowView;
}

- (UIView)initialFocusView
{
  return self->_initialFocusView;
}

- (IKViewElement)stackElement
{
  return self->_stackElement;
}

- (void)setStackElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackElement, 0);
  objc_storeStrong((id *)&self->_initialFocusView, 0);
  objc_storeStrong((id *)&self->_buttonsRowView, 0);
  objc_storeStrong((id *)&self->_viewsBelowDescription, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_viewsAboveDescription, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_lastFocusedView, 0);
}

@end