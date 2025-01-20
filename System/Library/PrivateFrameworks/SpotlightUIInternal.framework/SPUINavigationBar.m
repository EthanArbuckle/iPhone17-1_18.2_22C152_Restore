@interface SPUINavigationBar
- (BOOL)isLocked;
- (SPUINavigationBar)initWithFrame:(CGRect)a3;
- (SPUISearchHeader)header;
- (SearchUISeparatorView)topDividerView;
- (void)didAddSubview:(id)a3;
- (void)didMoveToWindow;
- (void)performShowSeparator:(BOOL)a3 animated:(BOOL)a4;
- (void)reconfigureNavigationBarForItem:(id)a3;
- (void)setHeader:(id)a3;
- (void)setTopDividerView:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBackgroundViewVisibility;
@end

@implementation SPUINavigationBar

- (void)performShowSeparator:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (double)a3;
  v8 = [(SPUINavigationBar *)self topDividerView];
  [v8 alpha];
  double v10 = v9;

  if (v10 != v7)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__SPUINavigationBar_performShowSeparator_animated___block_invoke;
    v11[3] = &unk_264E90790;
    v11[4] = self;
    BOOL v12 = a3;
    [MEMORY[0x263F67C78] performAnimatableChanges:v11 animated:v4];
  }
}

- (SPUINavigationBar)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SPUINavigationBar;
  v3 = -[SPUINavigationBar initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    BOOL v4 = objc_opt_new();
    [(SPUINavigationBar *)v3 setBackgroundImage:v4 forBarMetrics:0];

    v5 = objc_opt_new();
    [(SPUINavigationBar *)v3 setTopDividerView:v5];

    v6 = [(SPUINavigationBar *)v3 topDividerView];
    [(SPUINavigationBar *)v3 addSubview:v6];

    double v7 = [(SPUINavigationBar *)v3 topDividerView];
    [v7 setAlpha:0.0];

    v8 = (void *)MEMORY[0x263F67C10];
    double v9 = [(SPUINavigationBar *)v3 topDividerView];
    id v10 = (id)[v8 baselineAlignBottomView:v3 toTopView:v9];

    v11 = (void *)MEMORY[0x263F67C10];
    BOOL v12 = [(SPUINavigationBar *)v3 topDividerView];
    [v11 constrainViewWidthToContainer:v12];

    v13 = objc_opt_new();
    [(SPUINavigationBar *)v3 _setBackgroundView:v13];

    v14 = [(SPUINavigationBar *)v3 _backgroundView];
    [v14 setAlpha:0.0];

    [(SPUINavigationBar *)v3 _setHidesShadow:1];
  }
  return v3;
}

- (SearchUISeparatorView)topDividerView
{
  return (SearchUISeparatorView *)objc_getProperty(self, a2, 640, 1);
}

- (void)setTopDividerView:(id)a3
{
}

- (void)didAddSubview:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SPUINavigationBar;
  [(SPUINavigationBar *)&v34 didAddSubview:v4];
  id v5 = [(SPUINavigationBar *)self topItem];
  v6 = [v5 titleView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_16;
  }
  uint64_t v7 = [(SPUINavigationBar *)self _backgroundView];
  v8 = v4;
  if ((id)v7 == v4)
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  double v9 = (void *)v7;
  id v10 = [(SPUINavigationBar *)self _backgroundView];
  uint64_t v11 = [v10 superview];
  if ((id)v11 == v4)
  {

    v8 = v9;
    goto LABEL_15;
  }
  BOOL v12 = (void *)v11;
  char v13 = [MEMORY[0x263F79140] enableFloatingWindow];

  if ((v13 & 1) == 0)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v14 = [(SPUINavigationBar *)self subviews];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          NSClassFromString(&cfstr_Uinavigationba.isa);
          if (objc_opt_isKindOfClass())
          {
            id v5 = v19;
            goto LABEL_19;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    id v5 = 0;
LABEL_19:

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v6 = objc_msgSend(v5, "subviews", 0);
    uint64_t v20 = [v6 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v6);
          }
          uint64_t v24 = *(void *)(*((void *)&v26 + 1) + 8 * j);
          v25 = [MEMORY[0x263F7E398] bestAppearanceForView:self];
          [v25 enableAppearanceForView:v24];
        }
        uint64_t v21 = [v6 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v21);
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)updateBackgroundViewVisibility
{
  id v6 = [(SPUINavigationBar *)self topItem];
  v3 = [v6 titleView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = [(SPUINavigationBar *)self _backgroundView];
  [v5 setHidden:(isKindOfClass & 1) == 0];
}

- (BOOL)isLocked
{
  return 0;
}

- (void)setHeader:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = (SPUISearchHeader *)a3;
  p_header = &self->_header;
  if (self->_header != v5)
  {
    if ([MEMORY[0x263F79140] enableFloatingWindow])
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v7 = [(SPUINavigationBar *)self items];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
            [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setTitleView:v5];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
    objc_storeStrong((id *)p_header, a3);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPUINavigationBar;
  [(SPUINavigationBar *)&v9 traitCollectionDidChange:v4];
  id v5 = [(SPUINavigationBar *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SPUINavigationBar *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  id v6 = [(SPUINavigationBar *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SPUINavigationBar;
  [(SPUINavigationBar *)&v3 didMoveToWindow];
  [(SPUINavigationBar *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SPUINavigationBar;
  [(SPUINavigationBar *)&v7 tlk_updateForAppearance:v4];
  if (([MEMORY[0x263F79140] enableFloatingWindow] & 1) == 0)
  {
    id v5 = [v4 secondaryColor];
    [(SPUINavigationBar *)self setTintColor:v5];
    uint64_t v8 = *MEMORY[0x263F81500];
    v9[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [(SPUINavigationBar *)self setTitleTextAttributes:v6];
  }
}

void __51__SPUINavigationBar_performShowSeparator_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v2 = (double)*(unint64_t *)&a2;
  id v3 = [*(id *)(a1 + 32) topDividerView];
  [v3 setAlpha:v2];
}

- (void)reconfigureNavigationBarForItem:(id)a3
{
  id v6 = a3;
  if ([MEMORY[0x263F79140] enableFloatingWindow])
  {
    [(SPUINavigationBar *)self showSeparator:1 animated:0];
    id v4 = [(SPUINavigationBar *)self header];
    [v6 setTitleView:v4];

    [v6 setTitle:0];
    [v6 setHidesBackButton:1];
    [v6 setBackBarButtonItem:0];
    uint64_t v5 = MEMORY[0x263EFFA68];
    [v6 setRightBarButtonItems:MEMORY[0x263EFFA68]];
    [v6 setLeftBarButtonItems:v5];
  }
  else
  {
    [(SPUINavigationBar *)self showSeparator:0 animated:0];
  }
  [(SPUINavigationBar *)self updateBackgroundViewVisibility];
}

- (SPUISearchHeader)header
{
  return self->_header;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topDividerView, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end