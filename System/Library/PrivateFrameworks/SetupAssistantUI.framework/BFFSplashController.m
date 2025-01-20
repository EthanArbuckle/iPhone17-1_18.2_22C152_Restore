@interface BFFSplashController
- (BFFPaneHeaderView)headerView;
- (BFFSplashController)init;
- (BOOL)disableIconTint;
- (BOOL)fullWidthContent;
- (BOOL)isScrollingDisabled;
- (BOOL)usesTwoButtonLayout;
- (NSString)detailText;
- (UIColor)bleedColor;
- (UIColor)tint;
- (UIEdgeInsets)additionalInsets;
- (UIImage)icon;
- (UIView)buttonTray;
- (UIView)contentView;
- (UIVisualEffectView)effectView;
- (id)_createButtonWithTitle:(id)a3 style:(int64_t)a4;
- (id)buttonAtIndex:(unint64_t)a3;
- (id)contentScrollView;
- (int64_t)contentViewPosition;
- (void)_buttonPressed:(id)a3;
- (void)_updateButtonFonts;
- (void)_updateTrayVisibility;
- (void)addButtonWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5;
- (void)loadView;
- (void)removeAllButtons;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAdditionalInsets:(UIEdgeInsets)a3;
- (void)setBleedColor:(id)a3;
- (void)setButtonsEnabled:(BOOL)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewPosition:(int64_t)a3;
- (void)setDetailText:(id)a3;
- (void)setDisableIconTint:(BOOL)a3;
- (void)setEffectView:(id)a3;
- (void)setFullWidthContent:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setLinkText:(id)a3 action:(id)a4;
- (void)setScrollingDisabled:(BOOL)a3;
- (void)setTint:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitle:(id)a3 forButtonAtIndex:(unint64_t)a4 action:(id)a5;
- (void)updateBleedColor;
- (void)updateBleedViewLayout;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BFFSplashController

- (BFFSplashController)init
{
  v8.receiver = self;
  v8.super_class = (Class)BFFSplashController;
  v2 = [(BFFSplashController *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F825C8] systemBlueColor];
    [(BFFSplashController *)v2 setTint:v3];

    uint64_t v4 = objc_opt_new();
    buttons = v2->_buttons;
    v2->_buttons = (NSMutableArray *)v4;

    v2->_contentViewPosition = 1;
    long long v6 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    *(_OWORD *)&v2->_additionalInsets.top = *MEMORY[0x263F834E8];
    *(_OWORD *)&v2->_additionalInsets.bottom = v6;
  }
  return v2;
}

- (void)setIcon:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(BFFSplashController *)self tint];
  if (v4)
  {
    v5 = (void *)v4;
    BOOL v6 = [(BFFSplashController *)self disableIconTint];

    if (!v6)
    {
      v7 = [(BFFSplashController *)self tint];
      uint64_t v8 = [v10 _flatImageWithColor:v7];

      id v10 = (id)v8;
    }
  }
  v9 = [(BFFSplashController *)self headerView];
  [v9 setIcon:v10];
}

- (UIImage)icon
{
  return [(BFFPaneHeaderView *)self->_headerView icon];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(BFFSplashController *)self headerView];
  [v5 setTitleText:v4];
}

- (void)setDetailText:(id)a3
{
  id v4 = a3;
  id v6 = [(BFFSplashController *)self headerView];
  id v5 = [v6 detailTextLabel];
  [v5 setText:v4];
}

- (void)setContentView:(id)a3
{
  id v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(UIScrollView *)self->_scrollView addSubview:self->_contentView];
    v7 = [(BFFSplashController *)self view];
    [v7 setNeedsLayout];
  }
  MEMORY[0x270F9A758]();
}

- (void)setContentViewPosition:(int64_t)a3
{
  if (self->_contentViewPosition != a3)
  {
    self->_contentViewPosition = a3;
    id v3 = [(BFFSplashController *)self view];
    [v3 setNeedsLayout];
  }
}

- (void)setAdditionalInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_additionalInsets.left
    || a3.top != self->_additionalInsets.top
    || a3.right != self->_additionalInsets.right
    || a3.bottom != self->_additionalInsets.bottom)
  {
    self->_additionalInsets = a3;
    id v6 = [(BFFSplashController *)self view];
    [v6 setNeedsLayout];
  }
}

- (void)addButtonWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5
{
  id v8 = a5;
  id v9 = [(BFFSplashController *)self _createButtonWithTitle:a3 style:a4];
  [v9 setAction:v8];

  [(NSMutableArray *)self->_buttons addObject:v9];
}

- (void)removeAllButtons
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_buttons;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "button", (void)v9);
        [v8 removeFromSuperview];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_buttons removeAllObjects];
}

- (void)setTitle:(id)a3 forButtonAtIndex:(unint64_t)a4 action:(id)a5
{
  if (a4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [(BFFSplashController *)self addButtonWithTitle:a3 style:v5 action:a5];
}

- (id)buttonAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_buttons count] <= a3)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_buttons objectAtIndexedSubscript:a3];
    uint64_t v6 = [v5 button];
  }
  return v6;
}

- (void)setLinkText:(id)a3 action:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BFFSplashController *)self headerView];
  [v8 setLinkText:v7 handler:v6];
}

- (void)setTint:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = (UIColor *)a3;
  if (self->_tint != v5)
  {
    objc_storeStrong((id *)&self->_tint, a3);
    if (![(BFFSplashController *)self disableIconTint])
    {
      id v6 = [(BFFSplashController *)self icon];
      id v7 = [(BFFSplashController *)self tint];
      id v8 = [v6 _flatImageWithColor:v7];

      [(BFFSplashController *)self setIcon:v8];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v9 = self->_buttons;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "button", (void)v15);
          [v14 setTintColor:v5];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)setScrollingDisabled:(BOOL)a3
{
  if (self->_scrollingDisabled != a3)
  {
    BOOL v3 = a3;
    self->_scrollingDisabled = a3;
    [(UIScrollView *)self->_scrollView setScrollEnabled:!a3];
    id v5 = [(BFFSplashController *)self effectView];
    [v5 setHidden:v3];
  }
}

- (void)setBleedColor:(id)a3
{
  id v5 = (UIColor *)a3;
  uint64_t v10 = v5;
  if (!self->_bleedView)
  {
    id v6 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    bleedView = self->_bleedView;
    self->_bleedView = v6;

    id v8 = [(BFFSplashController *)self view];
    [v8 addSubview:self->_bleedView];

    id v5 = v10;
  }
  p_bleedColor = &self->_bleedColor;
  if (self->_bleedColor != v5)
  {
    objc_storeStrong((id *)p_bleedColor, a3);
    p_bleedColor = (UIColor **)[(UIView *)self->_bleedView setBackgroundColor:v10];
  }
  MEMORY[0x270F9A790](p_bleedColor);
}

- (BFFPaneHeaderView)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    uint64_t v4 = [BFFPaneHeaderView alloc];
    id v5 = -[BFFPaneHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v6 = self->_headerView;
    self->_headerView = v5;

    [(UIScrollView *)self->_scrollView addSubview:self->_headerView];
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)_updateButtonFonts
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_buttons;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = *MEMORY[0x263F83570];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "style", (void)v12) == 2)
        {
          long long v9 = [MEMORY[0x263F82760] preferredFontForTextStyle:v6];
          uint64_t v10 = [v8 button];
          uint64_t v11 = [v10 titleLabel];
          [v11 setFont:v9];
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (id)_createButtonWithTitle:(id)a3 style:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setStyle:a4];
  if (a4 == 1)
  {
    [(BFFSplashController *)self loadViewIfNeeded];
    id v8 = +[BFFStyle sharedStyle];
    long long v9 = [v8 continueButtonWithTitle:v6 inView:self->_buttonTray];
    [v7 setButton:v9];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F824E8] buttonWithType:1];
    [v7 setButton:v10];

    uint64_t v11 = [v7 button];
    long long v12 = [v11 titleLabel];
    [v12 setAdjustsFontSizeToFitWidth:1];

    [(BFFSplashController *)self _updateButtonFonts];
    buttonTray = self->_buttonTray;
    id v8 = [v7 button];
    [(UIView *)buttonTray addSubview:v8];
  }

  long long v14 = [v7 button];
  [v14 setTintColor:self->_tint];

  long long v15 = [v7 button];
  [v15 addTarget:self action:sel__buttonPressed_ forControlEvents:0x2000];

  long long v16 = [v7 button];
  [v16 setTitle:v6 forState:0];

  return v7;
}

- (void)setButtonsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_buttons;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "button", (void)v10);
        [v9 setEnabled:v3];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)loadView
{
  v19.receiver = self;
  v19.super_class = (Class)BFFSplashController;
  [(BFFSplashController *)&v19 loadView];
  BOOL v3 = [(BFFSplashController *)self view];
  uint64_t v4 = +[BFFStyle sharedStyle];
  uint64_t v5 = [v4 backgroundColor];
  [v3 setBackgroundColor:v5];

  uint64_t v6 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F82B88]);
  scrollView = self->_scrollView;
  self->_scrollView = v6;

  [(UIScrollView *)self->_scrollView setDelegate:self];
  [(UIScrollView *)self->_scrollView addSubview:self->_headerView];
  [(UIScrollView *)self->_scrollView addSubview:self->_contentView];
  uint64_t v8 = [(BFFSplashController *)self view];
  [v8 addSubview:self->_scrollView];

  id v9 = objc_alloc(MEMORY[0x263F82E50]);
  long long v10 = [MEMORY[0x263F824D8] effectWithStyle:1100];
  long long v11 = (void *)[v9 initWithEffect:v10];
  [(BFFSplashController *)self setEffectView:v11];

  long long v12 = [(BFFSplashController *)self view];
  long long v13 = [(BFFSplashController *)self effectView];
  [v12 addSubview:v13];

  long long v14 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
  buttonTray = self->_buttonTray;
  self->_buttonTray = v14;

  long long v16 = [(BFFSplashController *)self view];
  [v16 addSubview:self->_buttonTray];

  uint64_t v17 = +[BFFStyle sharedStyle];
  long long v18 = [(BFFSplashController *)self navigationItem];
  [v17 applyAutomaticScrollToEdgeBehaviorOnNavigationItem:v18];
}

- (id)contentScrollView
{
  return self->_scrollView;
}

- (void)viewDidLayoutSubviews
{
  uint64_t v161 = *MEMORY[0x263EF8340];
  if (BFFIsiPad()) {
    double v3 = 25.0;
  }
  else {
    double v3 = -8.5;
  }
  v158.receiver = self;
  v158.super_class = (Class)BFFSplashController;
  [(BFFSplashController *)&v158 viewDidLayoutSubviews];
  uint64_t v4 = [(BFFSplashController *)self view];
  [v4 bounds];
  uint64_t v132 = v6;
  uint64_t v134 = v5;
  double v8 = v7;
  double v10 = v9;

  long long v11 = +[BFFStyle sharedStyle];
  long long v12 = [(BFFSplashController *)self view];
  long long v13 = [v12 superview];
  long long v14 = [(BFFSplashController *)self view];
  uint64_t v15 = [v14 superview];
  [v15 bounds];
  [v11 horizontalInsetsForContainingInView:v13 width:v16];

  UIEdgeInsetsAdd();
  double v18 = v17;
  double v147 = v19;
  double v20 = v8 - v19;
  [(UIScrollView *)self->_scrollView frame];
  double v22 = v21;
  double v24 = v23;
  [(UIScrollView *)self->_scrollView frame];
  v173.origin.CGFloat x = v22;
  v173.origin.CGFloat y = v24;
  v173.size.double width = v8;
  double v140 = v10;
  v173.size.height = v10;
  if (!CGRectEqualToRect(v162, v173)) {
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v22, v24, v8, v10);
  }
  double v25 = v20 - v18;
  double v26 = *MEMORY[0x263F001A8];
  double rect = *(double *)(MEMORY[0x263F001A8] + 24);
  double width = *(double *)(MEMORY[0x263F001A8] + 16);
  contentView = self->_contentView;
  double v142 = *(double *)(MEMORY[0x263F001A8] + 8);
  double MaxY = 0.0;
  if (contentView)
  {
    -[UIView sizeThatFits:](contentView, "sizeThatFits:", v25, 1.79769313e308);
    if (v29 * v28 == 0.0)
    {
      double v30 = v26;
      long long v156 = 0u;
      long long v157 = 0u;
      long long v154 = 0u;
      long long v155 = 0u;
      v31 = [(UIView *)self->_contentView subviews];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v154 objects:v160 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v155;
        CGFloat y = v142;
        CGFloat x = v30;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v155 != v34) {
              objc_enumerationMutation(v31);
            }
            objc_msgSend(*(id *)(*((void *)&v154 + 1) + 8 * i), "frame", v132, v134);
            v174.origin.CGFloat x = v38;
            v174.origin.CGFloat y = v39;
            v174.size.double width = v40;
            v174.size.height = v41;
            v163.origin.CGFloat x = x;
            v163.origin.CGFloat y = y;
            v163.size.height = rect;
            v163.size.double width = width;
            CGRect v164 = CGRectUnion(v163, v174);
            CGFloat x = v164.origin.x;
            CGFloat y = v164.origin.y;
            double rect = v164.size.height;
            double width = v164.size.width;
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v154 objects:v160 count:16];
        }
        while (v33);
      }

      double v26 = v30;
    }
    else
    {
      double rect = v28;
    }
    BOOL v42 = [(BFFSplashController *)self fullWidthContent];
    if (v42) {
      CGFloat v43 = v8;
    }
    else {
      CGFloat v43 = v25;
    }
    if (v42) {
      CGFloat v44 = v26;
    }
    else {
      CGFloat v44 = v147;
    }
    double width = v43;
    double v141 = v44;
    if (self->_contentViewPosition == 2)
    {
      v45 = [(BFFSplashController *)self headerView];
      v46 = [v45 icon];
      v47 = [(BFFSplashController *)self headerView];
      [v47 setUseMinimumTopPadding:v46 != 0];

      double v142 = 0.0;
      v165.origin.CGFloat y = 0.0;
      v165.origin.CGFloat x = v44;
      v165.size.double width = v43;
      v165.size.height = rect;
      double MaxY = CGRectGetMaxY(v165);
      if (BFFIsiPad())
      {
        v48 = [(BFFSplashController *)self headerView];
        [v48 setCustomTopPadding:60.0];
      }
    }
  }
  else
  {
    double v141 = *MEMORY[0x263F001A8];
  }
  v49 = [(BFFSplashController *)self headerView];
  [v49 heightForWidth:self->_scrollView inView:v8];
  double v51 = v50;

  v52 = [(BFFSplashController *)self headerView];
  double v138 = v51;
  double v139 = v26;
  objc_msgSend(v52, "setFrame:", v26, MaxY, v8, v51);

  if ([(NSMutableArray *)self->_buttons count])
  {
    double v146 = v25;
    double v136 = v8;
    double v137 = v3;
    v53 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
    [v53 scaledValueForValue:24.0];
    double v55 = v54;
    [v53 scaledValueForValue:44.0];
    double v144 = v56;
    [v53 scaledValueForValue:36.0];
    double v145 = v57;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    v58 = self->_buttons;
    uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v150 objects:v159 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v151;
      double v62 = v145;
      double v63 = v55;
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v151 != v61) {
            objc_enumerationMutation(v58);
          }
          v65 = *(void **)(*((void *)&v150 + 1) + 8 * j);
          v66 = [v65 button];
          [v66 frame];
          double v68 = v67;
          double v70 = v69;
          if ([v65 style] == 2)
          {
            v71 = [v66 titleLabel];
            objc_msgSend(v71, "sizeThatFits:", v146, 1.79769313e308);
            double v73 = v72;
            double v75 = v74;

            if (v146 >= v73) {
              double v76 = v73;
            }
            else {
              double v76 = v146;
            }
            objc_msgSend(v66, "setFrame:", v68, v70, v76, v75);
            [v66 layoutSubviews];
            v77 = [v66 titleLabel];
            [v77 _firstLineBaselineOffsetFromBoundsTop];

            double v63 = v55 + v62;
            double v62 = v144 + v62;
          }
          else
          {
            v78 = +[BFFStyle sharedStyle];
            v79 = [(BFFSplashController *)self view];
            [v78 sizeForContinueButtonInAncestor:v79];
            CGFloat v81 = v80;
            double v83 = v82;

            v166.origin.CGFloat x = v68;
            v166.origin.CGFloat y = v63;
            v166.size.double width = v81;
            v166.size.height = v83;
            double v62 = v145 + CGRectGetMaxY(v166);
            double v63 = v63 + v55 + v83;
          }
          UIRoundToViewScale();
          objc_msgSend(v66, "setFrame:");
        }
        uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v150 objects:v159 count:16];
      }
      while (v60);
    }

    unint64_t v84 = 0x267F04000uLL;
    [(UIView *)self->_buttonTray frame];
    double v86 = v85;
    v87 = [(NSMutableArray *)self->_buttons lastObject];
    uint64_t v88 = [v87 style];
    v89 = [v87 button];
    [v89 frame];
    double v94 = v91;
    if (v88 == 2)
    {
      v95 = [v87 button];
      v96 = [v95 titleLabel];
      [v96 _firstLineBaselineOffsetFromBoundsTop];
      double v98 = v94 + v97 + 24.0;
    }
    else
    {
      double v98 = CGRectGetMaxY(*(CGRect *)&v90) + 44.0;
    }
    double v3 = v137;
    double v8 = v136;
    double v25 = v146;

    v99 = [(BFFSplashController *)self view];
    [v99 safeAreaInsets];
    double v101 = v98 + v100;

    -[UIView setFrame:](self->_buttonTray, "setFrame:", v86, v140 - v101, v136, v101);
    v102 = [(BFFSplashController *)self effectView];
    objc_msgSend(v102, "setFrame:", v86, v140 - v101, v136, v101);
  }
  else
  {
    v53 = [(BFFSplashController *)self effectView];
    objc_msgSend(v53, "setFrame:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
    unint64_t v84 = 0x267F04000;
  }

  [(UIScrollView *)self->_scrollView contentInset];
  double v104 = v103;
  double v106 = v105;
  double v108 = v107;
  uint64_t v109 = *(int *)(v84 + 3204);
  [*(id *)((char *)&self->super.super.super.isa + v109) frame];
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", v104, v106, v110, v108);
  if (self->_contentView)
  {
    double v112 = rect;
    double v111 = width;
    double v113 = v141;
    double v114 = v142;
    if (self->_contentViewPosition != 1) {
      goto LABEL_56;
    }
    if ([(NSMutableArray *)self->_buttons count])
    {
      [*(id *)((char *)&self->super.super.super.isa + v109) frame];
      double MinY = CGRectGetMinY(v167);
    }
    else
    {
      v168.origin.CGFloat y = v133;
      v168.origin.CGFloat x = v135;
      v168.size.double width = v8;
      v168.size.height = v140;
      double MinY = CGRectGetMaxY(v168);
    }
    double v116 = MinY;
    v117 = [(BFFSplashController *)self view];
    objc_msgSend(v117, "convertRect:fromView:", self->_scrollView, v139, MaxY, v8, v138);
    double v118 = v3 + CGRectGetMaxY(v169);

    double v119 = v116 - v118;
    v170.origin.CGFloat x = v139;
    v170.origin.CGFloat y = MaxY;
    v170.size.double width = v8;
    v170.size.height = v138;
    double v114 = v3 + CGRectGetMaxY(v170);
    double v112 = rect;
    if (rect < v119)
    {
      float v120 = (v119 - rect) * 0.5;
      double v114 = v114 + floorf(v120);
    }
    double v111 = width;
  }
  else
  {
    double v112 = rect;
    double v111 = width;
    double v114 = v142;
  }
  double v113 = v141;
LABEL_56:
  -[UIView setFrame:](self->_contentView, "setFrame:", v113, v114, v111, v112);
  v121 = [(BFFSplashController *)self headerView];
  [v121 frame];
  double v122 = CGRectGetMaxY(v171);

  [(UIView *)self->_contentView frame];
  double v123 = CGRectGetMaxY(v172);
  if (v122 >= v123) {
    double v124 = v122;
  }
  else {
    double v124 = v123;
  }
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v25, v124);
  [(UIScrollView *)self->_scrollView scrollIndicatorInsets];
  double v126 = v125;
  double v128 = v127;
  double v130 = v129;
  [*(id *)((char *)&self->super.super.super.isa + v109) frame];
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", v126, v128, v131, v130);
  [(BFFSplashController *)self _updateTrayVisibility];
  [(BFFSplashController *)self updateBleedViewLayout];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BFFSplashController;
  [(BFFSplashController *)&v4 viewWillAppear:a3];
  [(BFFSplashController *)self updateBleedColor];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BFFSplashController;
  [(BFFSplashController *)&v11 viewDidAppear:a3];
  [(UIScrollView *)self->_scrollView contentInset];
  double v5 = v4;
  double v7 = v6;
  [(UIScrollView *)self->_scrollView contentSize];
  double v9 = v8;
  [(UIScrollView *)self->_scrollView frame];
  if (v9 > v10 - v7 - v5) {
    [(UIScrollView *)self->_scrollView flashScrollIndicators];
  }
  [(BFFSplashController *)self updateBleedColor];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BFFSplashController;
  [(BFFSplashController *)&v7 viewWillDisappear:a3];
  double v4 = [(BFFSplashController *)self bleedColor];

  if (v4)
  {
    double v5 = +[BFFStyle sharedStyle];
    double v6 = [(BFFSplashController *)self navigationController];
    [v5 applyThemeToNavigationController:v6];
  }
}

- (void)updateBleedColor
{
  double v3 = [(BFFSplashController *)self bleedColor];

  if (v3)
  {
    double v4 = [(BFFSplashController *)self navigationController];
    double v5 = [v4 navigationBar];
    id v6 = objc_alloc_init(MEMORY[0x263F827E8]);
    [v5 setBackgroundImage:v6 forBarMetrics:0];

    objc_super v7 = [(BFFSplashController *)self navigationController];
    double v8 = [v7 navigationBar];
    [v8 setTranslucent:1];

    double v9 = [MEMORY[0x263F825C8] clearColor];
    double v10 = [(BFFSplashController *)self navigationController];
    objc_super v11 = [v10 navigationBar];
    [v11 setBarTintColor:v9];

    id v14 = [MEMORY[0x263F825C8] clearColor];
    long long v12 = [(BFFSplashController *)self navigationController];
    long long v13 = [v12 navigationBar];
    [v13 setBackgroundColor:v14];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  [(BFFSplashController *)self _updateTrayVisibility];
  [(BFFSplashController *)self updateBleedViewLayout];
}

- (void)updateBleedViewLayout
{
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v4 = v3;
  [(UIScrollView *)self->_scrollView contentOffset];
  if (v5 < -v4) {
    [(UIScrollView *)self->_scrollView contentOffset];
  }
  id v6 = [(BFFSplashController *)self view];
  [v6 frame];
  -[UIView setFrame:](self->_bleedView, "setFrame:", 0.0, 0.0);
}

- (void)_updateTrayVisibility
{
  scrollView = self->_scrollView;
  [(UIView *)self->_buttonTray bounds];
  -[UIScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", self->_buttonTray);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  int64_t v12 = [(BFFSplashController *)self contentViewPosition];
  long long v13 = &OBJC_IVAR___BFFSplashController__contentView;
  if (v12 == 2) {
    long long v13 = &OBJC_IVAR___BFFSplashController__headerView;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v13) frame];
  double MaxY = CGRectGetMaxY(v18);
  v19.origin.CGFloat x = v5;
  v19.origin.CGFloat y = v7;
  v19.size.double width = v9;
  v19.size.height = v11;
  BOOL v15 = MaxY <= CGRectGetMinY(v19);
  id v16 = [(BFFSplashController *)self effectView];
  [v16 setHidden:v15];
}

- (void)_buttonPressed:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  buttons = self->_buttons;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__BFFSplashController__buttonPressed___block_invoke;
  v10[3] = &unk_26454AD40;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [(NSMutableArray *)buttons indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = _BYLoggingFacility();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_21FF9E000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Unknown button %@!", buf, 0xCu);
    }
  }
  else
  {
    CGFloat v9 = [(NSMutableArray *)self->_buttons objectAtIndexedSubscript:v7];
    uint64_t v8 = [v9 action];

    if (v8) {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }
  }
}

BOOL __38__BFFSplashController__buttonPressed___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 button];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (int64_t)contentViewPosition
{
  return self->_contentViewPosition;
}

- (UIView)buttonTray
{
  return self->_buttonTray;
}

- (UIEdgeInsets)additionalInsets
{
  double top = self->_additionalInsets.top;
  double left = self->_additionalInsets.left;
  double bottom = self->_additionalInsets.bottom;
  double right = self->_additionalInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)tint
{
  return self->_tint;
}

- (BOOL)disableIconTint
{
  return self->_disableIconTint;
}

- (void)setDisableIconTint:(BOOL)a3
{
  self->_disableIconTint = a3;
}

- (BOOL)isScrollingDisabled
{
  return self->_scrollingDisabled;
}

- (BOOL)fullWidthContent
{
  return self->_fullWidthContent;
}

- (void)setFullWidthContent:(BOOL)a3
{
  self->_fullWidthContent = a3;
}

- (UIColor)bleedColor
{
  return self->_bleedColor;
}

- (BOOL)usesTwoButtonLayout
{
  return self->_usesTwoButtonLayout;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_bleedColor, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_bleedView, 0);
  objc_storeStrong((id *)&self->_tint, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end