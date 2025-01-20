@interface PRNameLabelViewController
- (BSUIVibrancyEffectView)vibrancyView;
- (CGRect)titleRectForLayout:(unint64_t)a3;
- (NSString)displayString;
- (PREditorElementLayoutController)layoutController;
- (PRIncomingCallTextViewAdapter)nameTextViewAdapter;
- (PRNameLabelViewControllerTransition)currentTransition;
- (PRPosterContentStyleVibrantContentRenderer)vibrantStyleRenderer;
- (UIFont)baseFont;
- (double)idealFontSize;
- (id)beginInteractiveTransitionToVibrancyConfiguration:(id)a3;
- (id)effectiveFont;
- (id)pr_beginInteractiveTransitionToBaseFont:(id)a3 vibrancyConfiguration:(id)a4 cachingVibrancyTransitionProvider:(id)a5;
- (void)loadView;
- (void)pr_setBackgroundType:(int64_t)a3;
- (void)pr_setStylingFromTitleStyleConfiguration:(id)a3 withExtensionBundleURL:(id)a4 forRole:(id)a5;
- (void)pr_updateStyleBoundingRects;
- (void)removeIncomingCallTextViewAdapterFromParent:(id)a3;
- (void)setBaseFont:(id)a3;
- (void)setCurrentTransition:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setLayoutController:(id)a3;
- (void)setNameTextViewAdapter:(id)a3;
- (void)setVibrancyView:(id)a3;
- (void)setVibrantStyleRenderer:(id)a3;
- (void)transition:(id)a3 didFinishSuccessfully:(BOOL)a4;
- (void)transition:(id)a3 didUpdate:(double)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation PRNameLabelViewController

- (PRIncomingCallTextViewAdapter)nameTextViewAdapter
{
  nameTextViewAdapter = self->_nameTextViewAdapter;
  if (!nameTextViewAdapter)
  {
    v4 = [PRIncomingCallTextViewAdapter alloc];
    v5 = [(PRNameLabelViewController *)self displayString];
    v6 = [(PRIncomingCallTextViewAdapter *)v4 initWithName:v5];
    v7 = self->_nameTextViewAdapter;
    self->_nameTextViewAdapter = v6;

    v8 = self->_nameTextViewAdapter;
    v9 = [(PRNameLabelViewController *)self baseFont];
    [(PRIncomingCallTextViewAdapter *)v8 setEmphasizedNameFont:v9];

    v10 = self->_nameTextViewAdapter;
    v11 = [MEMORY[0x1E4FB1618] whiteColor];
    [(PRIncomingCallTextViewAdapter *)v10 setTextColor:v11];

    [(PRIncomingCallTextViewAdapter *)self->_nameTextViewAdapter setMarqueeRunning:0];
    nameTextViewAdapter = self->_nameTextViewAdapter;
  }
  return nameTextViewAdapter;
}

- (double)idealFontSize
{
  v3 = [(PRNameLabelViewController *)self displayString];
  v4 = [(PRNameLabelViewController *)self nameTextViewAdapter];
  +[PRIncomingCallFontsProvider idealEmphasizedFontSizeForName:usingLayout:](PRIncomingCallFontsProvider, "idealEmphasizedFontSizeForName:usingLayout:", v3, [v4 layout]);
  double v6 = v5;

  return v6;
}

- (id)effectiveFont
{
  v3 = [(PRNameLabelViewController *)self baseFont];
  [(PRNameLabelViewController *)self idealFontSize];
  CTFontRef CopyWithAttributes = CTFontCreateCopyWithAttributes(v3, v4, 0, 0);

  return CopyWithAttributes;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v19 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  -[PRNameLabelViewController setView:](self, "setView:");
  v8 = (BSUIVibrancyEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F4F8F0]), "initWithFrame:", v4, v5, v6, v7);
  vibrancyView = self->_vibrancyView;
  self->_vibrancyView = v8;

  v10 = [(PRNameLabelViewController *)self nameTextViewAdapter];
  v11 = [v10 viewController];
  v12 = [(BSUIVibrancyEffectView *)self->_vibrancyView contentView];
  [(PRNameLabelViewController *)self bs_addChildViewController:v11 withSuperview:v12];

  v13 = [[PREditorElementLayoutController alloc] initWithTraitEnvironment:self];
  layoutController = self->_layoutController;
  self->_layoutController = v13;

  v15 = [(PRNameLabelViewController *)self view];
  [v15 addSubview:self->_vibrancyView];

  v16 = [v10 emojiViewController];

  if (v16)
  {
    v17 = [v10 emojiViewController];
    v18 = [(PRNameLabelViewController *)self view];
    [(PRNameLabelViewController *)self bs_addChildViewController:v17 withSuperview:v18];
  }
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)PRNameLabelViewController;
  [(PRNameLabelViewController *)&v22 viewDidLayoutSubviews];
  vibrancyView = self->_vibrancyView;
  double v4 = [(PRNameLabelViewController *)self view];
  [v4 bounds];
  -[BSUIVibrancyEffectView setFrame:](vibrancyView, "setFrame:");

  double v5 = [(PRNameLabelViewController *)self nameTextViewAdapter];
  -[PRNameLabelViewController titleRectForLayout:](self, "titleRectForLayout:", [v5 layout]);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v5 frame];
  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.width = v11;
  v24.size.height = v13;
  if (!CGRectEqualToRect(v23, v24)) {
    objc_msgSend(v5, "setFrame:", v7, v9, v11, v13);
  }
  [v5 tightFrame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [v5 frame];
  -[PRPosterContentStyleVibrantContentRenderer setContentBoundingRect:](self->_vibrantStyleRenderer, "setContentBoundingRect:");
  -[PRPosterContentStyleVibrantContentRenderer setStyleBoundingRect:](self->_vibrantStyleRenderer, "setStyleBoundingRect:", v15, v17, v19, v21);
}

- (void)removeIncomingCallTextViewAdapterFromParent:(id)a3
{
  id v3 = a3;
  double v4 = [v3 viewController];
  [v4 willMoveToParentViewController:0];

  double v5 = [v3 viewController];
  double v6 = [v5 view];
  [v6 removeFromSuperview];

  id v7 = [v3 viewController];

  [v7 removeFromParentViewController];
}

- (CGRect)titleRectForLayout:(unint64_t)a3
{
  double v5 = [(PRNameLabelViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [(PRNameLabelViewController *)self layoutController];
  double v15 = objc_msgSend(v14, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", 1, 2, a3, v7, v9, v11, v13);

  [v15 rect];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)setDisplayString:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_displayString != v5)
  {
    double v15 = v5;
    objc_storeStrong((id *)&self->_displayString, a3);
    double v6 = [(PRNameLabelViewController *)self nameTextViewAdapter];
    [v6 setDisplayNameText:v15];
    double v7 = [(PRNameLabelViewController *)self effectiveFont];
    [v6 setTextFontUsingDefaultFontSizes:v7];

    uint64_t v8 = [v6 emojiViewController];
    if (v8)
    {
      double v9 = (void *)v8;
      double v10 = [v6 emojiViewController];
      double v11 = [v10 view];
      double v12 = [v11 superview];

      if (!v12)
      {
        double v13 = [v6 emojiViewController];
        double v14 = [(PRNameLabelViewController *)self view];
        [(PRNameLabelViewController *)self bs_addChildViewController:v13 withSuperview:v14];
      }
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)pr_setBackgroundType:(int64_t)a3
{
  id v6 = [(PRNameLabelViewController *)self vibrancyView];
  double v4 = [v6 configuration];
  if ([v4 backgroundType] != a3)
  {
    double v5 = (void *)[v4 copyWithWithBackgroundType:a3];
    [v6 setConfiguration:v5];
  }
}

- (void)pr_setStylingFromTitleStyleConfiguration:(id)a3 withExtensionBundleURL:(id)a4 forRole:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  [(PRNameLabelViewController *)self loadViewIfNeeded];
  double v12 = [v9 effectiveTimeFontWithExtensionBundleURL:v11 forRole:v10];

  baseFont = self->_baseFont;
  self->_baseFont = v12;

  double v14 = [(PRNameLabelViewController *)self nameTextViewAdapter];
  objc_msgSend(v14, "setPreferredAlignment:", objc_msgSend(v9, "preferredTitleAlignment"));
  objc_msgSend(v14, "setPreferredLayout:", objc_msgSend(v9, "preferredTitleLayout"));
  double v15 = [(PRNameLabelViewController *)self effectiveFont];
  v46 = v10;
  if (v15)
  {
    [v14 setTextFontUsingDefaultFontSizes:v15];
  }
  else
  {
    double v16 = [NSString stringWithFormat:@"No effective font found for role %@, _baseFont %@, titleStyleConfiguration %@", v10, self->_baseFont, v9, v10];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      -[PRNameLabelViewController pr_setStylingFromTitleStyleConfiguration:withExtensionBundleURL:forRole:](a2, (uint64_t)self, (uint64_t)v16);
    }
  }
  double v17 = [(PRNameLabelViewController *)self view];
  [v17 setNeedsLayout];

  [v14 frame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [v14 tightFrame];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [v14 textColor];
  v35 = [PRPosterAppearance alloc];
  v36 = [(PRNameLabelViewController *)self effectiveFont];
  v37 = [[PRPosterColor alloc] initWithColor:v34];
  v38 = -[PRPosterAppearance initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:](v35, "initWithFont:labelColor:preferredTitleAlignment:preferredTitleLayout:", v36, v37, [v14 alignment], objc_msgSend(v14, "layout"));

  vibrantStyleRenderer = self->_vibrantStyleRenderer;
  if (vibrantStyleRenderer)
  {
    -[PRPosterContentStyleVibrantContentRenderer setContentBoundingRect:](vibrantStyleRenderer, "setContentBoundingRect:", v19, v21, v23, v25);
    -[PRPosterContentStyleVibrantContentRenderer setStyleBoundingRect:](self->_vibrantStyleRenderer, "setStyleBoundingRect:", v27, v29, v31, v33);
    [(PRPosterContentStyleVibrantContentRenderer *)self->_vibrantStyleRenderer setCurrentAppearance:v38];
  }
  else
  {
    v40 = [(PRNameLabelViewController *)self vibrancyView];
    v41 = [PRPosterContentStyleVibrantContentRenderer alloc];
    v42 = [v40 contentView];
    v43 = -[PRPosterContentStyleVibrantContentRenderer initWithVibrancyView:contentView:contentBoundingRect:styleBoundingRect:initialAppearance:](v41, "initWithVibrancyView:contentView:contentBoundingRect:styleBoundingRect:initialAppearance:", v40, v42, v38, v19, v21, v23, v25, v27, v29, v31, v33);
    v44 = self->_vibrantStyleRenderer;
    self->_vibrantStyleRenderer = v43;
  }
  v45 = [v9 effectiveTitleContentStyle];
  [v45 applyStyleWithRenderer:self->_vibrantStyleRenderer];
}

- (void)pr_updateStyleBoundingRects
{
  id v19 = [(PRNameLabelViewController *)self nameTextViewAdapter];
  [v19 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v19 tightFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  -[PRPosterContentStyleVibrantContentRenderer setContentBoundingRect:](self->_vibrantStyleRenderer, "setContentBoundingRect:", v4, v6, v8, v10);
  -[PRPosterContentStyleVibrantContentRenderer setStyleBoundingRect:](self->_vibrantStyleRenderer, "setStyleBoundingRect:", v12, v14, v16, v18);
}

- (id)beginInteractiveTransitionToVibrancyConfiguration:(id)a3
{
  id v4 = a3;
  double v5 = [(PRNameLabelViewController *)self vibrancyView];
  double v6 = [v5 configuration];

  double v7 = [[PRNameLabelViewControllerTransition alloc] initWithViewController:self fromVibrancyConfiguration:v6 toVibrancyConfiguration:v4];
  objc_storeStrong((id *)&self->_currentTransition, v7);

  return v7;
}

- (void)transition:(id)a3 didUpdate:(double)a4
{
  id v12 = a3;
  id v6 = [(PRNameLabelViewController *)self currentTransition];

  double v7 = v12;
  if (v6 == v12)
  {
    double v8 = [v12 fromConfiguration];
    double v9 = [v12 toConfiguration];
    double v10 = (void *)[v8 copyWithBlendAmount:v9 blendConfiguration:a4];

    double v11 = [(PRNameLabelViewController *)self vibrancyView];
    [v11 setConfiguration:v10];

    double v7 = v12;
  }
}

- (void)transition:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v11 = a3;
  id v6 = [(PRNameLabelViewController *)self currentTransition];

  double v7 = v11;
  if (v6 == v11)
  {
    if (a4) {
      [v11 toConfiguration];
    }
    else {
    double v8 = [v11 fromConfiguration];
    }
    double v9 = [(PRNameLabelViewController *)self vibrancyView];
    [v9 setConfiguration:v8];

    currentTransition = self->_currentTransition;
    self->_currentTransition = 0;

    double v7 = v11;
  }
}

- (id)pr_beginInteractiveTransitionToBaseFont:(id)a3 vibrancyConfiguration:(id)a4 cachingVibrancyTransitionProvider:(id)a5
{
  return [(PRNameLabelViewController *)self beginInteractiveTransitionToVibrancyConfiguration:a4];
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setNameTextViewAdapter:(id)a3
{
}

- (UIFont)baseFont
{
  return self->_baseFont;
}

- (void)setBaseFont:(id)a3
{
}

- (PRNameLabelViewControllerTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)setCurrentTransition:(id)a3
{
}

- (PREditorElementLayoutController)layoutController
{
  return self->_layoutController;
}

- (void)setLayoutController:(id)a3
{
}

- (PRPosterContentStyleVibrantContentRenderer)vibrantStyleRenderer
{
  return self->_vibrantStyleRenderer;
}

- (void)setVibrantStyleRenderer:(id)a3
{
}

- (BSUIVibrancyEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_vibrantStyleRenderer, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_baseFont, 0);
  objc_storeStrong((id *)&self->_nameTextViewAdapter, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

- (void)pr_setStylingFromTitleStyleConfiguration:(const char *)a1 withExtensionBundleURL:(uint64_t)a2 forRole:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  double v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  double v15 = @"PRNameLabelViewController.m";
  __int16 v16 = 1024;
  int v17 = 171;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_fault_impl(&dword_18C1C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end