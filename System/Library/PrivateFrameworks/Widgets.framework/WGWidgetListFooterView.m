@interface WGWidgetListFooterView
- (BOOL)shouldBlurContent;
- (BOOL)shouldSizeContent;
- (BOOL)textView:(id)a3 shouldInteractWithTextAttachment:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)materialGroupNameBase;
- (UIButton)customizeButton;
- (UIView)contentView;
- (WGNewWidgetsButton)widgetAvailableButton;
- (WGShortLookStyleButton)editButton;
- (WGWidgetListFooterView)initWithFrame:(CGRect)a3;
- (WGWidgetListFooterViewDelegate)delegate;
- (_UILegibilitySettings)legibilitySettings;
- (id)_referenceFont;
- (int64_t)layoutMode;
- (void)_addCustomizeButton;
- (void)_availableWidgetsUpdated:(id)a3;
- (void)_setAttributedString:(id)a3 forWidgetIdentifier:(id)a4;
- (void)invalidateSubviewGeometery;
- (void)layoutSubviews;
- (void)setCustomizeButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditButton:(id)a3;
- (void)setLayoutMode:(int64_t)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setShouldBlurContent:(BOOL)a3;
- (void)setShouldSizeContent:(BOOL)a3;
- (void)setVisibleWidgetsIDs:(id)a3;
- (void)setWidgetAvailableButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WGWidgetListFooterView

- (WGWidgetListFooterView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)WGWidgetListFooterView;
  v3 = -[WGWidgetListFooterView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    [(WGWidgetListFooterView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v5;

    [(WGWidgetListFooterView *)v3 addSubview:v3->_contentView];
    [(WGWidgetListFooterView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = objc_alloc_init(WGShortLookStyleButton);
    editButton = v3->_editButton;
    v3->_editButton = v7;

    v9 = v3->_editButton;
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"WIDGETS_EDIT_BUTTON" value:&stru_26D5C79B8 table:@"Widgets"];
    [(WGShortLookStyleButton *)v9 setTitle:v11];

    [(UIView *)v3->_contentView addSubview:v3->_editButton];
    [(WGWidgetListFooterView *)v3 _addCustomizeButton];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    if ((_os_feature_enabled_impl() & 1) == 0) {
      [v12 addObserver:v3 selector:sel__availableWidgetsUpdated_ name:@"WGAvailableWidgetsUpdatedNotification" object:0];
    }
    [v12 addObserver:v3 selector:sel__updateForContentCategorySizeDidChange name:*MEMORY[0x263F1D158] object:0];
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    widgetIDsToAttributionViews = v3->_widgetIDsToAttributionViews;
    v3->_widgetIDsToAttributionViews = v13;

    [(WGWidgetListFooterView *)v3 setShouldSizeContent:1];
  }
  return v3;
}

- (void)setLayoutMode:(int64_t)a3
{
  if (self->_layoutMode != a3)
  {
    self->_layoutMode = a3;
    [(WGWidgetListFooterView *)self setNeedsLayout];
  }
}

- (BOOL)shouldBlurContent
{
  return [(WGShortLookStyleButton *)self->_editButton isBackgroundBlurred];
}

- (void)setShouldBlurContent:(BOOL)a3
{
}

- (void)setVisibleWidgetsIDs:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_widgetIDsToAttributionViews allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        if (([v4 containsObject:v11] & 1) == 0)
        {
          v12 = [(NSMutableDictionary *)self->_widgetIDsToAttributionViews objectForKey:v11];
          [v12 removeFromSuperview];
          [(NSMutableDictionary *)self->_widgetIDsToAttributionViews removeObjectForKey:v11];

          char v8 = 1;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);

    if (v8)
    {
      [(WGWidgetListFooterView *)self invalidateIntrinsicContentSize];
      [(WGWidgetListFooterView *)self setNeedsLayout];
    }
  }
  else
  {
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * j);
        v19 = [(NSMutableDictionary *)self->_widgetIDsToAttributionViews objectForKey:v18];

        if (!v19)
        {
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __47__WGWidgetListFooterView_setVisibleWidgetsIDs___block_invoke;
          v20[3] = &unk_264677160;
          v20[4] = self;
          v20[5] = v18;
          +[WGWidgetAttributionView requestAttributedStringForIdentifier:v18 withHandler:v20];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }
}

void __47__WGWidgetListFooterView_setVisibleWidgetsIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __47__WGWidgetListFooterView_setVisibleWidgetsIDs___block_invoke_2;
    v6[3] = &unk_264676C00;
    objc_copyWeak(&v9, &location);
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __47__WGWidgetListFooterView_setVisibleWidgetsIDs___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _setAttributedString:*(void *)(a1 + 32) forWidgetIdentifier:*(void *)(a1 + 40)];
}

- (void)_setAttributedString:(id)a3 forWidgetIdentifier:(id)a4
{
  widgetIDsToAttributionViews = self->_widgetIDsToAttributionViews;
  id v7 = a4;
  id v8 = a3;
  id v12 = [(NSMutableDictionary *)widgetIDsToAttributionViews objectForKey:v7];
  [v12 removeFromSuperview];
  id v9 = [[WGWidgetAttributionView alloc] initWithWidgetAttributedString:v8];

  [(WGWidgetAttributionView *)v9 setDelegate:self];
  v10 = [(WGWidgetListFooterView *)self legibilitySettings];
  uint64_t v11 = [v10 primaryColor];
  [(WGWidgetAttributionView *)v9 setLegibilityTextColor:v11];

  [(WGWidgetAttributionView *)v9 _setInteractiveTextSelectionDisabled:1];
  [(NSMutableDictionary *)self->_widgetIDsToAttributionViews setObject:v9 forKey:v7];

  [(UIView *)self->_contentView addSubview:v9];
  [(WGWidgetListFooterView *)self invalidateIntrinsicContentSize];
  [(WGWidgetListFooterView *)self setNeedsLayout];
}

- (void)_addCustomizeButton
{
  v47[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F1C660] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F1D268]];
  uint64_t v46 = *MEMORY[0x263F1D210];
  uint64_t v44 = *MEMORY[0x263F1D350];
  id v3 = [NSNumber numberWithDouble:*MEMORY[0x263F1D340]];
  v45 = v3;
  id v4 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  v47[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
  uint64_t v6 = [v2 fontDescriptorByAddingAttributes:v5];

  id v7 = (void *)MEMORY[0x263F1C658];
  [v6 pointSize];
  v40 = v6;
  v42 = objc_msgSend(v7, "fontWithDescriptor:size:", v6);
  id v8 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v8 setFont:v42];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"WIDGETS_CUSTOMIZE_BUTTON" value:&stru_26D5C79B8 table:@"Widgets"];
  [v8 setText:v10];

  uint64_t v11 = [MEMORY[0x263F1C550] labelColor];
  [v8 setTextColor:v11];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = (void *)MEMORY[0x263F1C6C8];
  [v6 pointSize];
  v39 = objc_msgSend(v12, "configurationWithPointSize:weight:", 6);
  v38 = [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.forward" withConfiguration:v39];
  id v13 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v38];
  LODWORD(v14) = 1144750080;
  [v13 setContentHuggingPriority:0 forAxis:v14];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 intrinsicContentSize];
  double v16 = v15 + 10.0;
  [v13 intrinsicContentSize];
  double v18 = v16 + v17 + 10.0;
  v19 = [MEMORY[0x263F1C488] buttonWithType:0];
  -[UIButton setFrame:](v19, "setFrame:", 0.0, 0.0, v18, 20.0);
  [(UIButton *)v19 setAlpha:0.0];
  [(UIButton *)v19 addSubview:v8];
  [(UIButton *)v19 addSubview:v13];
  uint64_t v31 = (void *)MEMORY[0x263F08938];
  v37 = [v8 leadingAnchor];
  v36 = [(UIButton *)v19 leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36 constant:10.0];
  v43[0] = v35;
  v34 = [v13 leadingAnchor];
  v33 = [v8 trailingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v43[1] = v32;
  v30 = [(UIButton *)v19 trailingAnchor];
  v29 = [v13 trailingAnchor];
  long long v28 = [v30 constraintEqualToAnchor:v29 constant:10.0];
  v43[2] = v28;
  v20 = [v8 centerYAnchor];
  long long v21 = [(UIButton *)v19 centerYAnchor];
  long long v22 = [v20 constraintEqualToAnchor:v21];
  v43[3] = v22;
  long long v23 = [v13 centerYAnchor];
  long long v24 = [(UIButton *)v19 centerYAnchor];
  long long v25 = [v23 constraintEqualToAnchor:v24];
  v43[4] = v25;
  long long v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:5];
  [v31 activateConstraints:v26];

  [(UIView *)self->_contentView addSubview:v19];
  customizeButton = self->_customizeButton;
  self->_customizeButton = v19;
}

- (void)setDelegate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_storeWeak((id *)&self->_delegate, a3);
  id v4 = [(WGWidgetListFooterView *)self delegate];
  uint64_t v5 = [v4 editingMaterialViewForWidgetListFooterView:self];
  customizeButtonBackground = self->_customizeButtonBackground;
  self->_customizeButtonBackground = v5;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(UIButton *)self->_customizeButton subviews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        id v13 = [(MTMaterialView *)self->_customizeButtonBackground visualStylingProviderForCategory:1];
        [v13 automaticallyUpdateView:v12 withStyle:1];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)setShouldSizeContent:(BOOL)a3
{
  if (self->_shouldSizeContent != a3)
  {
    self->_shouldSizeContent = a3;
    [(WGWidgetListFooterView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v6 = [(WGWidgetListFooterView *)self _referenceFont];
  [v6 _scaledValueForValue:12.0];
  double v8 = v7;
  [(WGShortLookStyleButton *)self->_editButton alpha];
  if (v9 > 0.0)
  {
    -[WGShortLookStyleButton sizeThatFits:](self->_editButton, "sizeThatFits:", width, height);
    double v8 = v8 + v10;
  }
  [(UIButton *)self->_customizeButton alpha];
  if (v11 > 0.0)
  {
    [(UIButton *)self->_customizeButton frame];
    double v8 = v8 + v12;
  }
  unint64_t v13 = [(WGNewWidgetsButton *)self->_widgetAvailableButton badgeNumber];
  double v14 = 0.0;
  double v15 = 0.0;
  if (v13)
  {
    -[WGNewWidgetsButton sizeThatFits:](self->_widgetAvailableButton, "sizeThatFits:", width, 0.0);
    double v15 = v16 + 22.0;
  }
  double v17 = v8 + v15;
  uint64_t v18 = [(NSMutableDictionary *)self->_widgetIDsToAttributionViews count];
  if (v18 >= 1)
  {
    [v6 _scaledValueForValue:(double)v18 * 15.0 + 7.0];
    double v14 = v19;
  }
  double v20 = v17 + v14;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v21 = [(NSMutableDictionary *)self->_widgetIDsToAttributionViews allValues];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v40 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        [v26 layoutIfNeeded];
        WGMainScreenReferenceBounds();
        objc_msgSend(v26, "sizeThatFits:", v27 + -40.0, 0.0);
        double v29 = v28;
        [v26 textContainerInset];
        double v31 = v29 - v30;
        [v6 lineHeight];
        double v33 = v31 - v32;
        [v26 textContainerInset];
        double v20 = v20 + v33 - v34;
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v23);
  }

  [v6 _scaledValueForValue:5.5];
  double v36 = v35;

  double v37 = v20 + v36;
  double v38 = width;
  result.double height = v37;
  result.double width = v38;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F1D7C8];
  -[WGWidgetListFooterView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v4 = v2;
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  v73.receiver = self;
  v73.super_class = (Class)WGWidgetListFooterView;
  [(WGWidgetListFooterView *)&v73 layoutSubviews];
  [(WGWidgetListFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(WGWidgetListFooterView *)self _referenceFont];
  [v11 _scaledValueForValue:12.0];
  double v68 = v12;

  if (self->_shouldSizeContent) {
    -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  }
  [(WGShortLookStyleButton *)self->_editButton sizeToFit];
  [(WGShortLookStyleButton *)self->_editButton bounds];
  double v65 = _WGMainScreenScale();
  UIRectCenteredIntegralRectScale();
  double v14 = v13;
  [(WGShortLookStyleButton *)self->_editButton setFrame:*(void *)&v65];
  double v15 = v8;
  -[UIButton setFrame:](self->_customizeButton, "setFrame:", 0.0, v68, v8, 20.0);
  double v16 = [(WGWidgetListFooterView *)self _referenceFont];
  [v16 _scaledValueForValue:v14];
  double v18 = v68 + v17;

  widgetAvailableButton = self->_widgetAvailableButton;
  if (widgetAvailableButton && [(WGNewWidgetsButton *)widgetAvailableButton badgeNumber])
  {
    [(WGNewWidgetsButton *)self->_widgetAvailableButton sizeToFit];
    [(WGNewWidgetsButton *)self->_widgetAvailableButton size];
    WGMainScreenReferenceBounds();
    [(WGNewWidgetsButton *)self->_widgetAvailableButton size];
    BSRectWithSize();
    [(WGNewWidgetsButton *)self->_widgetAvailableButton frame];
    double v21 = v18 + v20;
    double v66 = _WGMainScreenScale();
    UIRectCenteredIntegralRectScale();
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v28 = [(WGWidgetListFooterView *)self _referenceFont];
    [v28 _scaledValueForValue:v21];
    double v30 = v29;
    double v31 = [(WGWidgetListFooterView *)self _referenceFont];
    [v31 ascender];
    double v33 = v30 - v32;

    -[WGNewWidgetsButton setFrame:](self->_widgetAvailableButton, "setFrame:", v23, v33, v25, v27);
    double v18 = v21 + 22.0;
  }
  if ([(NSMutableDictionary *)self->_widgetIDsToAttributionViews count])
  {
    double v34 = [(WGWidgetListFooterView *)self _referenceFont];
    [v34 _scaledValueForValue:7.0];
    double v18 = v18 + v35;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  double v36 = +[WGWidgetAttributionView widgetAttributionIDsInOrder];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v70 != v39) {
          objc_enumerationMutation(v36);
        }
        long long v41 = [(NSMutableDictionary *)self->_widgetIDsToAttributionViews objectForKey:*(void *)(*((void *)&v69 + 1) + 8 * i)];
        if (v41)
        {
          long long v42 = [(WGWidgetListFooterView *)self _referenceFont];
          [v42 _scaledValueForValue:15.0];
          double v44 = v18 + v43;

          objc_msgSend(v41, "sizeThatFits:", v15 + -40.0, 0.0);
          BSRectWithSize();
          double v67 = _WGMainScreenScale();
          UIRectCenteredIntegralRectScale();
          double v46 = v45;
          double v48 = v47;
          double v50 = v49;
          v51 = [(WGWidgetListFooterView *)self _referenceFont];
          [v51 _scaledValueForValue:v44];
          double v53 = v52;
          v54 = [(WGWidgetListFooterView *)self _referenceFont];
          [v54 ascender];
          double v56 = v53 - v55;

          objc_msgSend(v41, "setFrame:", v46, v56, v48, v50);
          [v41 bounds];
          double v58 = v57;
          [v41 textContainerInset];
          double v60 = v58 - v59;
          v61 = [(WGWidgetListFooterView *)self _referenceFont];
          [v61 lineHeight];
          double v63 = v60 - v62;
          [v41 textContainerInset];
          double v18 = v44 + v63 - v64;
        }
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v69 objects:v74 count:16];
    }
    while (v38);
  }
}

- (void)invalidateSubviewGeometery
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = [(NSMutableDictionary *)self->_widgetIDsToAttributionViews allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setNeedsLayout];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(WGNewWidgetsButton *)self->_widgetAvailableButton updateForContentCategorySizeChange];
  [(WGWidgetListFooterView *)self invalidateIntrinsicContentSize];
}

- (void)setLegibilitySettings:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = (_UILegibilitySettings *)a3;
  p_legibilitySettings = &self->_legibilitySettings;
  if (self->_legibilitySettings != v5)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [(NSMutableDictionary *)self->_widgetIDsToAttributionViews allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
          uint64_t v13 = [(_UILegibilitySettings *)*p_legibilitySettings primaryColor];
          [v12 setLegibilityTextColor:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [(WGNewWidgetsButton *)self->_widgetAvailableButton setLegibilitySettings:*p_legibilitySettings];
    [(WGWidgetListFooterView *)self setNeedsLayout];
  }
}

- (void)_availableWidgetsUpdated:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"WGNewWidgetsCountKey"];
  int v6 = [v5 intValue];

  widgetAvailableButton = self->_widgetAvailableButton;
  if (v6)
  {
    if (!widgetAvailableButton)
    {
      uint64_t v8 = objc_alloc_init(WGNewWidgetsButton);
      uint64_t v9 = self->_widgetAvailableButton;
      self->_widgetAvailableButton = v8;

      uint64_t v10 = self->_widgetAvailableButton;
      uint64_t v11 = [(WGWidgetListFooterView *)self legibilitySettings];
      [(WGNewWidgetsButton *)v10 setLegibilitySettings:v11];

      [(UIView *)self->_contentView addSubview:self->_widgetAvailableButton];
      widgetAvailableButton = self->_widgetAvailableButton;
    }
    [(WGNewWidgetsButton *)widgetAvailableButton setBadgeNumber:v6];
    [(WGWidgetListFooterView *)self invalidateIntrinsicContentSize];
    [(WGWidgetListFooterView *)self setNeedsLayout];
  }
  else
  {
    [(WGNewWidgetsButton *)widgetAvailableButton removeFromSuperview];
    double v12 = self->_widgetAvailableButton;
    self->_widgetAvailableButton = 0;
  }
  id v13 = [(WGWidgetListFooterView *)self delegate];
  [v13 widgetListFooterViewAvailableNewWidgetsUpdated:self];
}

- (id)_referenceFont
{
  referenceFont = self->_referenceFont;
  if (!referenceFont)
  {
    uint64_t v4 = [MEMORY[0x263F29D38] defaultFontProvider];
    uint64_t v5 = [v4 preferredFontForTextStyle:*MEMORY[0x263F1D278] hiFontStyle:1];
    int v6 = self->_referenceFont;
    self->_referenceFont = v5;

    referenceFont = self->_referenceFont;
  }
  return referenceFont;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  if ((unint64_t)(a6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v8 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__WGWidgetListFooterView_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
    block[3] = &unk_264676588;
    id v11 = v7;
    dispatch_async(v8, block);
  }
  return 0;
}

void __77__WGWidgetListFooterView_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  v10[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F3F608];
  v9[0] = *MEMORY[0x263F3F5E8];
  v9[1] = v2;
  v10[0] = MEMORY[0x263EFFA88];
  v10[1] = MEMORY[0x263EFFA88];
  v9[2] = *MEMORY[0x263F3F5C0];
  v10[2] = *MEMORY[0x263F14660];
  double v3 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  uint64_t v4 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = 0;
  char v6 = [v4 openSensitiveURL:v5 withOptions:v3 error:&v8];
  id v7 = v8;

  if ((v6 & 1) == 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __77__WGWidgetListFooterView_textView_shouldInteractWithURL_inRange_interaction___block_invoke_cold_1((uint64_t)v7);
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithTextAttachment:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WGWidgetListFooterView;
  id v4 = a3;
  [(WGWidgetListFooterView *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(WGWidgetListFooterView *)self traitCollection];
  char v6 = [v4 preferredContentSizeCategory];

  if (v6)
  {
    id v7 = [v5 preferredContentSizeCategory];
    char v8 = [v7 isEqualToString:v6];

    if ((v8 & 1) == 0)
    {
      referenceFont = self->_referenceFont;
      self->_referenceFont = 0;

      [(WGWidgetListFooterView *)self invalidateSubviewGeometery];
      [(WGWidgetListFooterView *)self setNeedsLayout];
    }
  }
}

- (NSString)materialGroupNameBase
{
  return [(WGShortLookStyleButton *)self->_editButton materialGroupNameBase];
}

- (void)setMaterialGroupNameBase:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)shouldSizeContent
{
  return self->_shouldSizeContent;
}

- (WGShortLookStyleButton)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
}

- (UIButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
}

- (WGWidgetListFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WGWidgetListFooterViewDelegate *)WeakRetained;
}

- (WGNewWidgetsButton)widgetAvailableButton
{
  return self->_widgetAvailableButton;
}

- (void)setWidgetAvailableButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetAvailableButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_customizeButtonBackground, 0);
  objc_storeStrong((id *)&self->_referenceFont, 0);
  objc_storeStrong((id *)&self->_widgetIDsToAttributionViews, 0);
}

void __77__WGWidgetListFooterView_textView_shouldInteractWithURL_inRange_interaction___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_222E49000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to open Widget Footer View URL: %@", (uint8_t *)&v1, 0xCu);
}

@end