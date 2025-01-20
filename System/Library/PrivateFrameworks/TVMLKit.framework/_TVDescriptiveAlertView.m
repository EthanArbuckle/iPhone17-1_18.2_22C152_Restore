@interface _TVDescriptiveAlertView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)childViews;
- (UIView)defaultFocusView;
- (id)preferredFocusEnvironments;
- (void)_scrollDown;
- (void)_scrollDown:(id)a3;
- (void)_scrollInDirection:(double)a3;
- (void)_scrollUp;
- (void)_scrollUp:(id)a3;
- (void)_setupGestureRecognizers;
- (void)layoutSubviews;
- (void)setBgImage:(id)a3;
- (void)setChildViews:(id)a3;
- (void)setDefaultFocusView:(id)a3;
@end

@implementation _TVDescriptiveAlertView

- (void)setBgImage:(id)a3
{
  v4 = (UIImage *)a3;
  if (self->_bgImage != v4)
  {
    bgImageView = self->_bgImageView;
    if (v4)
    {
      if (bgImageView)
      {
LABEL_8:
        [(UIImageView *)bgImageView setImage:v4];
        goto LABEL_9;
      }
    }
    else if (bgImageView)
    {
      [(UIImageView *)bgImageView removeFromSuperview];
      v6 = self->_bgImageView;
      self->_bgImageView = 0;

      goto LABEL_9;
    }
    id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
    [(_TVDescriptiveAlertView *)self bounds];
    v8 = (UIImageView *)objc_msgSend(v7, "initWithFrame:");
    [(_TVDescriptiveAlertView *)self addSubview:v8];
    [(_TVDescriptiveAlertView *)self sendSubviewToBack:v8];
    v9 = self->_bgImageView;
    self->_bgImageView = v8;

    bgImageView = self->_bgImageView;
    goto LABEL_8;
  }
LABEL_9:
  bgImage = self->_bgImage;
  self->_bgImage = v4;
}

- (void)setChildViews:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[(NSArray *)self->_childViews mutableCopy];
  v6 = [(_TVDescriptiveAlertView *)self window];
  id v7 = [v6 screen];
  v8 = [v7 focusedView];

  if (([v8 isDescendantOfView:self] & 1) == 0)
  {

    v8 = 0;
  }
  v9 = (NSArray *)[v4 copy];
  childViews = self->_childViews;
  self->_childViews = v9;

  p_scrollView = &self->_scrollView;
  scrollView = self->_scrollView;
  self->_scrollView = 0;

  defaultFocusView = self->_defaultFocusView;
  p_defaultFocusView = (id *)&self->_defaultFocusView;
  self->_defaultFocusView = 0;

  id v43 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v44 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v14 = self->_childViews;
  id v15 = (id)[(NSArray *)v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
  BOOL v16 = v15 == 0;
  if (!v15)
  {
    id v18 = 0;
LABEL_35:

    goto LABEL_37;
  }
  obj = v14;
  location = (id *)&self->_scrollView;
  v40 = v8;
  id v41 = v4;
  id v17 = 0;
  id v18 = 0;
  uint64_t v19 = *(void *)v49;
  v42 = v5;
  do
  {
    v20 = 0;
    v21 = v18;
    do
    {
      if (*(void *)v49 != v19) {
        objc_enumerationMutation(obj);
      }
      v22 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v20);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong(location, v22);
      }
      else
      {
        if (*location) {
          v23 = v44;
        }
        else {
          v23 = v43;
        }
        [v23 addObject:v22];
      }
      if (!*p_defaultFocusView)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ([v22 canBecomeFocused]) {
            goto LABEL_19;
          }
          id v24 = [v22 preferredFocusEnvironments];
          if ([v24 count])
          {
            v25 = [v22 preferredFocusEnvironments];
            v26 = [v25 firstObject];

            BOOL v27 = v26 == v22;
            v5 = v42;
            if (v27) {
              goto LABEL_21;
            }
LABEL_19:
            id v28 = v22;
            id v24 = *p_defaultFocusView;
            id *p_defaultFocusView = v28;
          }
        }
      }
LABEL_21:
      v29 = objc_msgSend(v22, "tv_associatedIKViewElement");
      v30 = [v29 autoHighlightIdentifier];

      if (v30)
      {
        if (!v17) {
          id v17 = v22;
        }
        v31 = objc_msgSend(v22, "tv_associatedIKViewElement");
        [v31 resetProperty:2];
      }
      v32 = [v22 superview];

      if (v32 == self) {
        [v5 removeObject:v22];
      }
      if (v21) {
        [(_TVDescriptiveAlertView *)self insertSubview:v22 above:v21];
      }
      else {
        [(_TVDescriptiveAlertView *)self insertSubview:v22 atIndex:0];
      }
      id v18 = v22;

      v20 = (char *)v20 + 1;
      v21 = v18;
    }
    while (v15 != v20);
    id v15 = (id)[(NSArray *)obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  }
  while (v15);

  if (v17)
  {
    id v15 = v17;
    p_scrollView = &self->_scrollView;
    v14 = (NSArray *)*p_defaultFocusView;
    id *p_defaultFocusView = v15;
    v8 = v40;
    id v4 = v41;
    BOOL v16 = 0;
    goto LABEL_35;
  }
  id v15 = 0;
  BOOL v16 = 1;
  v8 = v40;
  id v4 = v41;
  p_scrollView = &self->_scrollView;
LABEL_37:
  v33 = (NSArray *)[v43 copy];
  viewsAboveScrollView = self->_viewsAboveScrollView;
  self->_viewsAboveScrollView = v33;

  v35 = (NSArray *)[v44 copy];
  viewsBelowScrollView = self->_viewsBelowScrollView;
  self->_viewsBelowScrollView = v35;

  [v5 makeObjectsPerformSelector:sel_removeFromSuperview];
  if ([v8 isDescendantOfView:self])
  {
    if (v16) {
      v37 = v8;
    }
    else {
      v37 = v15;
    }
    objc_storeStrong(p_defaultFocusView, v37);
  }
  [(_TVDescriptiveAlertView *)self bounds];
  -[_TVDescriptiveAlertView sizeThatFits:](self, "sizeThatFits:", CGRectGetWidth(v54), 0.0);
  double v39 = v38;
  [(_TVDescriptiveAlertView *)self bounds];
  if (v39 >= CGRectGetHeight(v55))
  {
    [(_TVDescriptiveAlertView *)self _setupGestureRecognizers];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[UIScrollView _setGradientMaskInsets:](*p_scrollView, "_setGradientMaskInsets:", 90.0, 0.0, 90.0, 0.0);
      -[UIScrollView setContentInset:](*p_scrollView, "setContentInset:", 0.0, 0.0, 90.0, 0.0);
    }
  }
  else
  {
    self->_isCenteredLayout = 1;
    [(UIScrollView *)*p_scrollView setBounces:0];
    [(UIScrollView *)*p_scrollView setShowsVerticalScrollIndicator:0];
  }
}

- (void)_setupGestureRecognizers
{
  scrollView = self->_scrollView;
  if (scrollView)
  {
    id v4 = [(UIScrollView *)scrollView panGestureRecognizer];
    [v4 setAllowedTouchTypes:&unk_26E59EB78];

    v5 = [(UIScrollView *)self->_scrollView panGestureRecognizer];
    [v5 _setHysteresis:240.0];

    v6 = [(UIScrollView *)self->_scrollView panGestureRecognizer];
    [(_TVDescriptiveAlertView *)self addGestureRecognizer:v6];

    id v7 = (_UIRepeatingPressGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CD18]) initWithTarget:self action:sel__scrollUp_];
    upButtonGesture = self->_upButtonGesture;
    self->_upButtonGesture = v7;

    [(_UIRepeatingPressGestureRecognizer *)self->_upButtonGesture setAllowedPressTypes:&unk_26E59EB90];
    [(_TVDescriptiveAlertView *)self addGestureRecognizer:self->_upButtonGesture];
    v9 = (_UIRepeatingPressGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CD18]) initWithTarget:self action:sel__scrollDown_];
    downButtonGesture = self->_downButtonGesture;
    self->_downButtonGesture = v9;

    [(_UIRepeatingPressGestureRecognizer *)self->_downButtonGesture setAllowedPressTypes:&unk_26E59EBA8];
    v11 = self->_downButtonGesture;
    [(_TVDescriptiveAlertView *)self addGestureRecognizer:v11];
  }
}

- (void)_scrollUp:(id)a3
{
  uint64_t v4 = [a3 state];
  if (v4 == 2)
  {
    if (!self->_waiting) {
      [(_TVDescriptiveAlertView *)self performSelector:sel__scrollUp withObject:0 afterDelay:0.3];
    }
    self->_waiting = 1;
  }
  else if (v4 == 1)
  {
    [(_TVDescriptiveAlertView *)self _scrollUp];
  }
  else
  {
    self->_waiting = 0;
  }
}

- (void)_scrollUp
{
  self->_waiting = 0;
}

- (void)_scrollDown:(id)a3
{
  uint64_t v4 = [a3 state];
  if (v4 == 2)
  {
    if (!self->_waiting) {
      [(_TVDescriptiveAlertView *)self performSelector:sel__scrollDown withObject:0 afterDelay:0.3];
    }
    self->_waiting = 1;
  }
  else if (v4 == 1)
  {
    [(_TVDescriptiveAlertView *)self _scrollDown];
  }
  else
  {
    self->_waiting = 0;
  }
}

- (void)_scrollDown
{
  self->_waiting = 0;
}

- (void)_scrollInDirection:(double)a3
{
  [(UIScrollView *)self->_scrollView contentOffset];
  double v6 = v5;
  double v8 = v7;
  [(UIScrollView *)self->_scrollView frame];
  double v9 = CGRectGetHeight(v18) * 0.85;
  [(UIScrollView *)self->_scrollView contentSize];
  double v11 = v10;
  [(UIScrollView *)self->_scrollView contentInset];
  double v13 = v8 + a3 * (v9 * 0.5);
  double v15 = -v14;
  if (v13 >= -v14)
  {
    double v15 = v8 + a3 * (v9 * 0.5);
    if (v13 > v11 - v9) {
      double v15 = v11 - v9 + v12;
    }
  }
  scrollView = self->_scrollView;
  -[UIScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 1, v6, v15);
}

- (id)preferredFocusEnvironments
{
  v5[1] = *MEMORY[0x263EF8340];
  [(_TVDescriptiveAlertView *)self layoutBelowIfNeeded];
  if (self->_defaultFocusView)
  {
    v5[0] = self->_defaultFocusView;
    v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  if (self->_bgImageView) {
    -[_TVDescriptiveAlertView sendSubviewToBack:](self, "sendSubviewToBack:");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIScrollView *)self->_scrollView setTextAlignment:4];
  }
  [(_TVDescriptiveAlertView *)self bounds];
  double Width = CGRectGetWidth(v143);
  if (self->_isCenteredLayout)
  {
    long long v134 = 0uLL;
    long long v135 = 0uLL;
    long long v132 = 0uLL;
    long long v133 = 0uLL;
    uint64_t v4 = self->_viewsAboveScrollView;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v132 objects:v141 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v133;
      double v8 = 0.0;
      double v9 = 0.0;
      do
      {
        uint64_t v10 = 0;
        double v11 = v9;
        do
        {
          if (*(void *)v133 != v7) {
            objc_enumerationMutation(v4);
          }
          double v12 = *(void **)(*((void *)&v132 + 1) + 8 * v10);
          objc_msgSend(v12, "tv_margin");
          double v14 = v13;
          double v9 = v15;
          objc_msgSend(v12, "tv_sizeThatFits:", Width, 0.0);
          double v17 = v16;
          double v19 = v18;
          double v20 = floor((Width - v16) * 0.5);
          NSUInteger v21 = [(NSArray *)self->_viewsAboveScrollView indexOfObject:v12];
          double v22 = fmax(v14, v11);
          if (!v21) {
            double v22 = 0.0;
          }
          double v23 = v8 + v22;
          objc_msgSend(v12, "setFrame:", v20, v8 + v22, v17, v19);
          double v8 = v19 + v23;
          ++v10;
          double v11 = v9;
        }
        while (v6 != v10);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v132 objects:v141 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
      double v9 = 0.0;
    }

    [(UIScrollView *)self->_scrollView tv_margin];
    double v63 = v62;
    double v65 = v64;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    scrollView = self->_scrollView;
    if (isKindOfClass)
    {
      [(UIScrollView *)self->_scrollView tv_itemWidth];
      -[UIScrollView sizeThatFits:](scrollView, "sizeThatFits:");
    }
    else
    {
      [(UIScrollView *)self->_scrollView contentSize];
    }
    double v70 = v68;
    double v71 = v69;
    double v72 = fmax(v9, v63);
    if (v8 == 0.0) {
      double v72 = 0.0;
    }
    double v73 = v8 + v72;
    float v74 = (Width - v70) * 0.5;
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", floorf(v74), v73, v70, v69);
    double v75 = v73 + v71;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    v76 = self->_viewsBelowScrollView;
    uint64_t v77 = [(NSArray *)v76 countByEnumeratingWithState:&v128 objects:v140 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = *(void *)v129;
      do
      {
        uint64_t v80 = 0;
        double v81 = v65;
        do
        {
          if (*(void *)v129 != v79) {
            objc_enumerationMutation(v76);
          }
          v82 = *(void **)(*((void *)&v128 + 1) + 8 * v80);
          objc_msgSend(v82, "tv_margin");
          double v84 = v83;
          double v65 = v85;
          objc_msgSend(v82, "tv_sizeThatFits:", Width, 0.0);
          double v87 = v86;
          double v89 = v88;
          double v90 = v75 + fmax(v84, v81);
          *(float *)&double v86 = (Width - v86) * 0.5;
          objc_msgSend(v82, "setFrame:", floorf(*(float *)&v86), v90, v87, v88);
          double v75 = v89 + v90;
          ++v80;
          double v81 = v65;
        }
        while (v78 != v80);
        uint64_t v78 = [(NSArray *)v76 countByEnumeratingWithState:&v128 objects:v140 count:16];
      }
      while (v78);
    }

    int64_t v91 = [(UIView *)self tv_contentAlignment];
    if (v91 == 3)
    {
      v96 = [(NSArray *)self->_viewsBelowScrollView lastObject];
      v97 = v96;
      if (v96 || (v97 = self->_scrollView) != 0)
      {
        v98 = v97;
      }
      else
      {
        v98 = [(NSArray *)self->_viewsAboveScrollView lastObject];
      }
      v99 = v98;

      [(_TVDescriptiveAlertView *)self bounds];
      CGRectGetHeight(v145);
      [(UIScrollView *)v99 tv_margin];
    }
    else if (v91 == 1)
    {
      v92 = [(NSArray *)self->_viewsAboveScrollView firstObject];
      v93 = v92;
      if (v92 || (v93 = self->_scrollView) != 0)
      {
        v94 = v93;
      }
      else
      {
        v94 = [(NSArray *)self->_viewsBelowScrollView firstObject];
      }
      v95 = v94;

      [(UIScrollView *)v95 tv_margin];
    }
    else
    {
      [(_TVDescriptiveAlertView *)self bounds];
      CGRectGetHeight(v146);
    }
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    v100 = self->_viewsAboveScrollView;
    uint64_t v101 = [(NSArray *)v100 countByEnumeratingWithState:&v124 objects:v139 count:16];
    if (v101)
    {
      uint64_t v102 = v101;
      uint64_t v103 = *(void *)v125;
      do
      {
        for (uint64_t i = 0; i != v102; ++i)
        {
          if (*(void *)v125 != v103) {
            objc_enumerationMutation(v100);
          }
          v105 = *(void **)(*((void *)&v124 + 1) + 8 * i);
          [v105 frame];
          objc_msgSend(v105, "setFrame:");
        }
        uint64_t v102 = [(NSArray *)v100 countByEnumeratingWithState:&v124 objects:v139 count:16];
      }
      while (v102);
    }

    [(UIScrollView *)self->_scrollView frame];
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    v106 = self->_viewsBelowScrollView;
    uint64_t v107 = [(NSArray *)v106 countByEnumeratingWithState:&v120 objects:v138 count:16];
    if (v107)
    {
      uint64_t v108 = v107;
      uint64_t v109 = *(void *)v121;
      do
      {
        for (uint64_t j = 0; j != v108; ++j)
        {
          if (*(void *)v121 != v109) {
            objc_enumerationMutation(v106);
          }
          v111 = *(void **)(*((void *)&v120 + 1) + 8 * j);
          [v111 frame];
          objc_msgSend(v111, "setFrame:");
        }
        uint64_t v108 = [(NSArray *)v106 countByEnumeratingWithState:&v120 objects:v138 count:16];
      }
      while (v108);
    }
  }
  else
  {
    long long v118 = 0uLL;
    long long v119 = 0uLL;
    long long v116 = 0uLL;
    long long v117 = 0uLL;
    id v24 = self->_viewsAboveScrollView;
    uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v116 objects:v137 count:16];
    double v26 = 0.0;
    double v27 = 0.0;
    double v28 = 0.0;
    if (v25)
    {
      uint64_t v29 = v25;
      uint64_t v30 = *(void *)v117;
      do
      {
        uint64_t v31 = 0;
        double v32 = v27;
        do
        {
          if (*(void *)v117 != v30) {
            objc_enumerationMutation(v24);
          }
          v33 = *(void **)(*((void *)&v116 + 1) + 8 * v31);
          objc_msgSend(v33, "tv_margin");
          double v35 = v34;
          double v27 = v36;
          objc_msgSend(v33, "tv_sizeThatFits:", Width, 0.0);
          double v38 = v37;
          double v39 = v28 + fmax(v35, v32);
          objc_msgSend(v33, "setFrame:", floor((Width - v40) * 0.5), v39, v40, v37);
          double v28 = v38 + v39;
          ++v31;
          double v32 = v27;
        }
        while (v29 != v31);
        uint64_t v29 = [(NSArray *)v24 countByEnumeratingWithState:&v116 objects:v137 count:16];
      }
      while (v29);
    }

    [(_TVDescriptiveAlertView *)self bounds];
    double Height = CGRectGetHeight(v144);
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v42 = [(NSArray *)self->_viewsBelowScrollView reverseObjectEnumerator];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v112 objects:v136 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v113;
      double v26 = 0.0;
      do
      {
        uint64_t v46 = 0;
        double v47 = v26;
        do
        {
          if (*(void *)v113 != v45) {
            objc_enumerationMutation(v42);
          }
          long long v48 = *(void **)(*((void *)&v112 + 1) + 8 * v46);
          objc_msgSend(v48, "tv_margin");
          double v26 = v49;
          double v51 = v50;
          objc_msgSend(v48, "tv_sizeThatFits:", Width, 0.0);
          double v53 = v52;
          double Height = Height - (fmax(v47, v51) + v54);
          *(float *)&double v52 = (Width - v52) * 0.5;
          objc_msgSend(v48, "setFrame:", floorf(*(float *)&v52), Height, v53, v54);
          ++v46;
          double v47 = v26;
        }
        while (v44 != v46);
        uint64_t v44 = [v42 countByEnumeratingWithState:&v112 objects:v136 count:16];
      }
      while (v44);
    }

    [(UIScrollView *)self->_scrollView tv_margin];
    double v56 = fmax(v55, v27);
    double v58 = Height - v28 - v56 - fmax(v57, v26);
    [(UIScrollView *)self->_scrollView tv_itemWidth];
    double v60 = v59;
    *(float *)&double v59 = (Width - v59) * 0.5;
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", floorf(*(float *)&v59), v28 + v56, v60, v58);
    if (![(NSArray *)self->_viewsBelowScrollView count])
    {
      [(UIScrollView *)self->_scrollView contentInset];
      if (v61 == 0.0)
      {
        [(UIScrollView *)self->_scrollView contentInset];
        -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
      }
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v50 = *MEMORY[0x263EF8340];
  [(_TVDescriptiveAlertView *)self bounds];
  double v5 = CGRectGetWidth(v52);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v6 = self->_viewsAboveScrollView;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  if (v7)
  {
    uint64_t v11 = v7;
    uint64_t v12 = *(void *)v45;
    do
    {
      uint64_t v13 = 0;
      double v14 = v9;
      do
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v6);
        }
        double v15 = *(void **)(*((void *)&v44 + 1) + 8 * v13);
        objc_msgSend(v15, "tv_margin");
        double v17 = v16;
        double v9 = v18;
        objc_msgSend(v15, "tv_sizeThatFits:", v5, 0.0);
        double v10 = v10 + fmax(v17, v14) + v19;
        ++v13;
        double v14 = v9;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v11);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  double v20 = [(NSArray *)self->_viewsBelowScrollView reverseObjectEnumerator];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v41;
    double v8 = 0.0;
    do
    {
      uint64_t v24 = 0;
      double v25 = v8;
      do
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v20);
        }
        double v26 = *(void **)(*((void *)&v40 + 1) + 8 * v24);
        objc_msgSend(v26, "tv_margin");
        double v8 = v27;
        double v29 = v28;
        objc_msgSend(v26, "tv_sizeThatFits:", v5, 0.0);
        double v10 = v10 + fmax(v25, v29) + v30;
        ++v24;
        double v25 = v8;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v22);
  }

  [(UIScrollView *)self->_scrollView tv_margin];
  double v32 = v31;
  double v34 = v33;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  scrollView = self->_scrollView;
  if (isKindOfClass)
  {
    [(UIScrollView *)scrollView tv_itemWidth];
    -[UIScrollView sizeThatFits:](scrollView, "sizeThatFits:");
  }
  else
  {
    [(UIScrollView *)scrollView contentSize];
  }
  double v38 = v10 + fmax(v9, v32) + fmax(v8, v34) + v37;
  double v39 = width;
  result.height = v38;
  result.CGFloat width = v39;
  return result;
}

- (NSArray)childViews
{
  return self->_childViews;
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
  objc_storeStrong((id *)&self->_childViews, 0);
  objc_storeStrong((id *)&self->_bgImageView, 0);
  objc_storeStrong((id *)&self->_bgImage, 0);
  objc_storeStrong((id *)&self->_downButtonGesture, 0);
  objc_storeStrong((id *)&self->_upButtonGesture, 0);
  objc_storeStrong((id *)&self->_defaultFocusView, 0);
  objc_storeStrong((id *)&self->_viewsBelowScrollView, 0);
  objc_storeStrong((id *)&self->_viewsAboveScrollView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end