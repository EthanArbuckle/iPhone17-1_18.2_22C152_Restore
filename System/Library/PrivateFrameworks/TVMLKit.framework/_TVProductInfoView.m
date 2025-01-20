@interface _TVProductInfoView
+ (id)productInfoViewWithElement:(id)a3 existingView:(id)a4;
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)infoSectionViews;
- (NSArray)viewsAboveInfoSection;
- (NSArray)viewsBelowInfoSection;
- (UIView)defaultFocusView;
- (id)impressionableElementsContainedInDocument:(id)a3;
- (id)preferredFocusEnvironments;
- (void)layoutSubviews;
- (void)setDefaultFocusView:(id)a3;
- (void)setInfoSectionViews:(id)a3;
- (void)setViewsAboveInfoSection:(id)a3;
- (void)setViewsBelowInfoSection:(id)a3;
@end

@implementation _TVProductInfoView

+ (id)productInfoViewWithElement:(id)a3 existingView:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = (_TVProductInfoView *)v6;
  }
  else
  {
    v8 = [_TVProductInfoView alloc];
    v7 = -[_TVFocusRedirectView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  v23 = v7;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v24 = v5;
  v10 = [v5 children];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v25 = 0;
    v26 = 0;
    id v13 = 0;
    uint64_t v14 = *(void *)v28;
    while (1)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        unint64_t v17 = objc_msgSend(v16, "tv_elementType") - 19;
        v18 = +[TVInterfaceFactory sharedInterfaceFactory];
        v19 = [v18 _viewFromElement:v16 existingView:0];

        if (v17 > 1)
        {
          if (!v19) {
            goto LABEL_27;
          }
          if (!v13)
          {
            if ([v19 canBecomeFocused]) {
              id v13 = v19;
            }
            else {
              id v13 = 0;
            }
          }
          if ([v9 count])
          {
            id v20 = v26;
            if (!v26)
            {
              id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
              v26 = v20;
            }
          }
          else
          {
            id v20 = v25;
            if (!v25)
            {
              id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
              v25 = v20;
            }
          }
        }
        else
        {
          if (!v19) {
            goto LABEL_27;
          }
          if (!v13)
          {
            if ([v19 canBecomeFocused]) {
              id v13 = v19;
            }
            else {
              id v13 = 0;
            }
          }
          id v20 = v9;
        }
        [v20 addObject:v19];
LABEL_27:
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (!v12) {
        goto LABEL_31;
      }
    }
  }
  v25 = 0;
  v26 = 0;
  id v13 = 0;
LABEL_31:

  [(_TVProductInfoView *)v23 setViewsAboveInfoSection:v25];
  [(_TVProductInfoView *)v23 setInfoSectionViews:v9];
  [(_TVProductInfoView *)v23 setViewsBelowInfoSection:v26];
  [(_TVProductInfoView *)v23 setDefaultFocusView:v13];
  v21 = v23;

  return v21;
}

- (void)setViewsAboveInfoSection:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    p_viewsAboveInfoSection = &self->_viewsAboveInfoSection;
    if (![(NSArray *)self->_viewsAboveInfoSection isEqualToArray:v5])
    {
      [(NSArray *)*p_viewsAboveInfoSection makeObjectsPerformSelector:sel_removeFromSuperview];
      objc_storeStrong((id *)&self->_viewsAboveInfoSection, a3);
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v7 = *p_viewsAboveInfoSection;
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
            -[_TVProductInfoView addSubview:](self, "addSubview:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
          }
          while (v9 != v11);
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
  }
  [(_TVProductInfoView *)self setNeedsLayout];
}

- (void)setInfoSectionViews:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_infoSectionViews = &self->_infoSectionViews;
  if (![(NSArray *)self->_infoSectionViews isEqualToArray:v5])
  {
    [(NSArray *)*p_infoSectionViews makeObjectsPerformSelector:sel_removeFromSuperview];
    objc_storeStrong((id *)&self->_infoSectionViews, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = *p_infoSectionViews;
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
          -[_TVProductInfoView addSubview:](self, "addSubview:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  [(_TVProductInfoView *)self setNeedsLayout];
}

- (void)setViewsBelowInfoSection:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    p_viewsBelowInfoSection = &self->_viewsBelowInfoSection;
    if (![(NSArray *)self->_viewsBelowInfoSection isEqualToArray:v5])
    {
      [(NSArray *)*p_viewsBelowInfoSection makeObjectsPerformSelector:sel_removeFromSuperview];
      objc_storeStrong((id *)&self->_viewsBelowInfoSection, a3);
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v7 = *p_viewsBelowInfoSection;
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
            -[_TVProductInfoView addSubview:](self, "addSubview:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
          }
          while (v9 != v11);
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
  }
  [(_TVProductInfoView *)self setNeedsLayout];
}

- (BOOL)canBecomeFocused
{
  v3 = [MEMORY[0x263F1C920] mainScreen];
  v4 = [v3 focusedView];

  id v5 = [(_TVProductInfoView *)self defaultFocusView];
  if (v5) {
    int v6 = [v4 isDescendantOfView:self] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)preferredFocusEnvironments
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = [(_TVProductInfoView *)self defaultFocusView];

  if (v3) {
    [(_TVProductInfoView *)self layoutIfNeeded];
  }
  v4 = [(_TVProductInfoView *)self defaultFocusView];
  if (v4)
  {
    id v5 = [(_TVProductInfoView *)self defaultFocusView];
    v8[0] = v5;
    int v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    int v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v87 = *MEMORY[0x263EF8340];
  [(UIView *)self tv_padding];
  double v7 = v6;
  double v71 = v8;
  double v67 = v10;
  double v68 = v9;
  [(UIView *)self tv_lineSpacing];
  double v70 = v11;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v12 = self->_viewsAboveInfoSection;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v80 objects:v86 count:16];
  uint64_t v14 = v13;
  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  if (v13)
  {
    char v18 = 0;
    uint64_t v19 = *(void *)v81;
    uint64_t v20 = v13;
    do
    {
      uint64_t v21 = 0;
      double v22 = v16;
      do
      {
        if (*(void *)v81 != v19) {
          objc_enumerationMutation(v12);
        }
        v23 = *(void **)(*((void *)&v80 + 1) + 8 * v21);
        objc_msgSend(v23, "tv_margin");
        double v16 = v24;
        double v25 = fmax(v24, v22);
        double v26 = fmax(v7, v16);
        if ((v18 & 1) == 0) {
          double v25 = v26;
        }
        double v27 = v17 + v25;
        objc_msgSend(v23, "sizeThatFits:", width, height);
        double v17 = v28 + v27;
        ++v21;
        char v18 = 1;
        double v22 = v16;
      }
      while (v20 != v21);
      uint64_t v20 = [(NSArray *)v12 countByEnumeratingWithState:&v80 objects:v86 count:16];
    }
    while (v20);
  }

  long long v29 = [(NSArray *)self->_infoSectionViews firstObject];
  objc_msgSend(v29, "tv_margin");
  double v31 = v30;
  double v33 = v32;

  double v34 = fmax(v31, v16);
  double v35 = fmax(v7, v31);
  if (!v14) {
    double v34 = v35;
  }
  double v36 = v17 + v34;
  [(UIView *)self tv_interitemSpacing];
  double v38 = v37;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v39 = self->_infoSectionViews;
  uint64_t v40 = [(NSArray *)v39 countByEnumeratingWithState:&v76 objects:v85 count:16];
  double v69 = width;
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v77;
    double v43 = fmax(width - v71 - v67, 0.0);
    double v44 = width - v67;
    double v15 = 0.0;
    double v45 = v71;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v77 != v42) {
          objc_enumerationMutation(v39);
        }
        objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * i), "tv_sizeThatFits:", v43, 0.0);
        double v49 = v71;
        double v50 = v70 + v15;
        double v51 = 0.0;
        if (v45 + v47 <= v44)
        {
          double v51 = v15;
          double v49 = v45;
          double v50 = -0.0;
        }
        double v36 = v36 + v50;
        double v15 = fmax(v51, v48);
        double v45 = v38 + v47 + v49;
      }
      uint64_t v41 = [(NSArray *)v39 countByEnumeratingWithState:&v76 objects:v85 count:16];
    }
    while (v41);
  }

  double v52 = v15 + v36;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v53 = self->_viewsBelowInfoSection;
  uint64_t v54 = [(NSArray *)v53 countByEnumeratingWithState:&v72 objects:v84 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v73;
    double v57 = v69;
    do
    {
      uint64_t v58 = 0;
      double v59 = v33;
      do
      {
        if (*(void *)v73 != v56) {
          objc_enumerationMutation(v53);
        }
        v60 = *(void **)(*((void *)&v72 + 1) + 8 * v58);
        objc_msgSend(v60, "tv_margin");
        double v62 = v61;
        double v33 = v63;
        objc_msgSend(v60, "sizeThatFits:", v69, height);
        double v52 = v52 + v64 + fmax(v59, v62);
        ++v58;
        double v59 = v33;
      }
      while (v55 != v58);
      uint64_t v55 = [(NSArray *)v53 countByEnumeratingWithState:&v72 objects:v84 count:16];
    }
    while (v55);
  }
  else
  {
    double v57 = v69;
  }

  double v65 = v52 + fmax(v33, v68);
  double v66 = v57;
  result.double height = v65;
  result.double width = v66;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  v101.receiver = self;
  v101.super_class = (Class)_TVProductInfoView;
  [(_TVFocusRedirectView *)&v101 layoutSubviews];
  [(_TVProductInfoView *)self bounds];
  double Width = CGRectGetWidth(v106);
  [(UIView *)self tv_padding];
  double v86 = v3;
  double v5 = v4;
  double v82 = v6;
  [(UIView *)self tv_lineSpacing];
  double v85 = v7;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  double v8 = self->_viewsAboveInfoSection;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v97 objects:v104 count:16];
  uint64_t v10 = v9;
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  double v88 = v5;
  if (v9)
  {
    char v14 = 0;
    uint64_t v15 = *(void *)v98;
    double v16 = Width - v5 - v82;
    uint64_t v17 = v9;
    do
    {
      uint64_t v18 = 0;
      double v19 = v12;
      do
      {
        if (*(void *)v98 != v15) {
          objc_enumerationMutation(v8);
        }
        uint64_t v20 = *(void **)(*((void *)&v97 + 1) + 8 * v18);
        objc_msgSend(v20, "tv_margin");
        double v12 = v21;
        double v23 = v22;
        double v25 = v16 - v22 - v24;
        objc_msgSend(v20, "sizeThatFits:", v25, 0.0);
        double v27 = v26;
        double v28 = v13 + fmax(v12, v19);
        double v29 = fmax(v86, v12);
        if (v14) {
          double v30 = v28;
        }
        else {
          double v30 = v29;
        }
        double v31 = v88 + v23;
        double v5 = v88;
        objc_msgSend(v20, "setFrame:", v31, v30, v25, v27);
        double v13 = v27 + v30;
        ++v18;
        char v14 = 1;
        double v19 = v12;
      }
      while (v17 != v18);
      uint64_t v17 = [(NSArray *)v8 countByEnumeratingWithState:&v97 objects:v104 count:16];
    }
    while (v17);
  }

  double v32 = [(NSArray *)self->_infoSectionViews firstObject];
  objc_msgSend(v32, "tv_margin");
  double v34 = v33;
  double v81 = v35;

  double v36 = v13 + fmax(v34, v12);
  double v37 = fmax(v86, v34);
  if (v10) {
    double v38 = v36;
  }
  else {
    double v38 = v37;
  }
  uint64_t v39 = [(_TVProductInfoView *)self effectiveUserInterfaceLayoutDirection];
  [(UIView *)self tv_interitemSpacing];
  double v84 = v40;
  double v41 = v5;
  double v87 = Width - v82;
  if (v39 == 1) {
    double v5 = Width - v82;
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v42 = self->_infoSectionViews;
  uint64_t v43 = [(NSArray *)v42 countByEnumeratingWithState:&v93 objects:v103 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v94;
    double v46 = fmax(Width - v41 - v82, 0.0);
    double v47 = v5;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v94 != v45) {
          objc_enumerationMutation(v42);
        }
        double v49 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        objc_msgSend(v49, "tv_sizeThatFits:", v46, 0.0);
        double v51 = v50;
        double v53 = v52;
        BOOL v54 = v47 - v50 < v88;
        if (v39 != 1) {
          BOOL v54 = v47 + v50 > v87;
        }
        double v55 = v85 + v11;
        if (v39 == 1) {
          double v56 = v51;
        }
        else {
          double v56 = 0.0;
        }
        if (v39 == 1) {
          double v57 = -(v84 + v51);
        }
        else {
          double v57 = v84 + v51;
        }
        if (v54)
        {
          double v47 = v5;
          double v11 = 0.0;
        }
        else
        {
          double v55 = -0.0;
        }
        double v38 = v38 + v55;
        objc_msgSend(v49, "setFrame:", v47 - v56, v38);
        double v47 = v57 + v47;
        double v11 = fmax(v11, v53);
      }
      uint64_t v44 = [(NSArray *)v42 countByEnumeratingWithState:&v93 objects:v103 count:16];
    }
    while (v44);
  }

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  uint64_t v58 = self->_viewsBelowInfoSection;
  uint64_t v59 = [(NSArray *)v58 countByEnumeratingWithState:&v89 objects:v102 count:16];
  double v60 = v81;
  if (v59)
  {
    uint64_t v61 = v59;
    double v62 = v11 + v38;
    uint64_t v63 = *(void *)v90;
    do
    {
      uint64_t v64 = 0;
      double v65 = v60;
      do
      {
        if (*(void *)v90 != v63) {
          objc_enumerationMutation(v58);
        }
        double v66 = *(void **)(*((void *)&v89 + 1) + 8 * v64);
        objc_msgSend(v66, "tv_margin");
        double v68 = v67;
        double v60 = v69;
        double v71 = Width - v88 - v82 - v67 - v70;
        double v73 = v62 + fmax(v65, v72);
        objc_msgSend(v66, "sizeThatFits:", v71, 0.0);
        double v75 = v74;
        if (v39 == 1) {
          double v76 = v87 - v88 - v71;
        }
        else {
          double v76 = v88 + v68;
        }
        if (objc_msgSend(v66, "tv_alignment") == 2)
        {
          [(_TVProductInfoView *)self bounds];
          UIRectCenteredXInRect();
          double v76 = v79;
          double v71 = v80;
        }
        else
        {
          double v77 = v73;
          double v78 = v75;
        }
        objc_msgSend(v66, "setFrame:", v76, v77, v71, v78);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v66 setComponentsNeedUpdate];
        }
        double v62 = v75 + v73;
        ++v64;
        double v65 = v60;
      }
      while (v61 != v64);
      uint64_t v61 = [(NSArray *)v58 countByEnumeratingWithState:&v89 objects:v102 count:16];
    }
    while (v61);
  }
}

- (id)impressionableElementsContainedInDocument:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [MEMORY[0x263EFF980] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  double v6 = [(_TVProductInfoView *)self viewsAboveInfoSection];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "tv_impressionableElementsForDocument:", v4);
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v8);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v12 = [(_TVProductInfoView *)self infoSectionViews];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * j), "tv_impressionableElementsForDocument:", v4);
        [v5 addObjectsFromArray:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v14);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v18 = [(_TVProductInfoView *)self viewsAboveInfoSection];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        double v23 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * k), "tv_impressionableElementsForDocument:", v4);
        [v5 addObjectsFromArray:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v20);
  }

  if ([v5 count])
  {
    double v24 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];
  }
  else
  {
    double v24 = 0;
  }

  return v24;
}

- (NSArray)viewsAboveInfoSection
{
  return self->_viewsAboveInfoSection;
}

- (NSArray)infoSectionViews
{
  return self->_infoSectionViews;
}

- (NSArray)viewsBelowInfoSection
{
  return self->_viewsBelowInfoSection;
}

- (UIView)defaultFocusView
{
  return self->_defaultFocusView;
}

- (void)setDefaultFocusView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFocusView, 0);
  objc_storeStrong((id *)&self->_viewsBelowInfoSection, 0);
  objc_storeStrong((id *)&self->_infoSectionViews, 0);
  objc_storeStrong((id *)&self->_viewsAboveInfoSection, 0);
}

@end