@interface WGWidgetPlatterView
+ (double)contentBaselineToBoundsBottomWithWidth:(double)a3;
- (BOOL)_isUtilityButtonVisible;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)canBecomeFocused;
- (BOOL)isBackgroundHidden;
- (BOOL)isContentViewHitTestingDisabled;
- (BOOL)isEditingIcons;
- (BOOL)isShowingMoreContent;
- (CGRect)_headerFrameForBounds:(CGRect)a3;
- (CGSize)_contentSize;
- (CGSize)contentSizeForSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)minimumSizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSString)materialGroupNameBase;
- (NSString)widgetIdentifier;
- (UIButton)addWidgetButton;
- (UIButton)showMoreButton;
- (UIView)contentView;
- (WGWidgetHostingViewController)widgetHost;
- (WGWidgetListItemViewController)listItem;
- (WGWidgetPlatterView)initWithFrame:(CGRect)a3;
- (double)_continuousCornerRadius;
- (double)overrideHeightForLayingOutContentView;
- (double)topMarginForLayout;
- (id)cancelTouches;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)buttonMode;
- (unint64_t)clippingEdge;
- (void)_configureBackgroundMaterialViewIfNecessary;
- (void)_configureHeaderViewsIfNecessary;
- (void)_handleAddWidget:(id)a3;
- (void)_handleIconButton:(id)a3;
- (void)_layoutContentView;
- (void)_layoutHeaderViews;
- (void)_setContentView:(id)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setUtilityButtonVisible:(BOOL)a3;
- (void)_toggleShowMore:(id)a3;
- (void)_updateHeaderContentViewVisualStyling;
- (void)_updateShowMoreButtonImage;
- (void)_updateUtilityButtonForMode:(int64_t)a3;
- (void)_updateUtilityButtonForMoreContentState:(BOOL)a3;
- (void)iconDidInvalidate:(id)a3;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setBackgroundHidden:(BOOL)a3;
- (void)setButtonMode:(int64_t)a3;
- (void)setClippingEdge:(unint64_t)a3;
- (void)setContentViewHitTestingDisabled:(BOOL)a3;
- (void)setEditingIcons:(BOOL)a3;
- (void)setListItem:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setOverrideHeightForLayingOutContentView:(double)a3;
- (void)setShowingMoreContent:(BOOL)a3;
- (void)setTopMarginForLayout:(double)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)setWidgetHost:(id)a3;
- (void)willRemoveSubview:(id)a3;
@end

@implementation WGWidgetPlatterView

- (WGWidgetPlatterView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WGWidgetPlatterView;
  v3 = -[WGWidgetPlatterView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(WGWidgetPlatterView *)v3 setClipsToBounds:1];
    [(WGWidgetPlatterView *)v4 setAutoresizesSubviews:1];
    [(WGWidgetPlatterView *)v4 _setContinuousCornerRadius:13.0];
    v5 = [(WGWidgetPlatterView *)v4 layer];
    [v5 setAllowsGroupBlending:0];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v4 selector:sel_iconDidInvalidate_ name:@"WGWidgetInfoIconDidInvalidateNotification" object:0];
  }
  return v4;
}

- (void)setWidgetHost:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  v6 = WeakRetained;
  if (WeakRetained != v4)
  {
    v7 = [WeakRetained view];
    [v7 removeFromSuperview];

    id v8 = objc_storeWeak((id *)&self->_widgetHost, v4);
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __37__WGWidgetPlatterView_setWidgetHost___block_invoke;
    v14[3] = &unk_264676C28;
    objc_copyWeak(&v16, &location);
    id v9 = v4;
    id v15 = v9;
    [v9 requestIconWithHandler:v14];
    headerContentView = self->_headerContentView;
    v11 = [v9 displayName];
    v12 = [v11 localizedUppercaseString];
    [(PLPlatterHeaderContentView *)headerContentView setTitle:v12];

    [(WGWidgetPlatterView *)self _updateUtilityButtonForMode:self->_buttonMode];
    v13 = [v9 view];
    [(WGWidgetPlatterView *)self _setContentView:v13];

    [(WGWidgetPlatterView *)self setNeedsLayout];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __37__WGWidgetPlatterView_setWidgetHost___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__WGWidgetPlatterView_setWidgetHost___block_invoke_2;
  block[3] = &unk_264676C00;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __37__WGWidgetPlatterView_setWidgetHost___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      v9[0] = *(void *)(a1 + 32);
      id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
      [WeakRetained[52] setIcons:v3];
    }
    id v4 = [*(id *)(a1 + 40) widgetIdentifier];
    v5 = WGApplicationIdentifierForWidgetWithBundleIdentifier(v4);
    uint64_t v6 = [v5 length];

    if (v6)
    {
      id v7 = [WeakRetained[52] iconButtons];
      id v8 = [v7 firstObject];
      [v8 addTarget:WeakRetained action:sel__handleIconButton_ forControlEvents:64];
    }
  }
}

- (CGSize)minimumSizeThatFits:(CGSize)a3
{
  -[WGWidgetPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:", a3.width, 0.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setContentViewHitTestingDisabled:(BOOL)a3
{
  if (self->_contentViewHitTestingDisabled != a3)
  {
    self->_contentViewHitTestingDisabled = a3;
    -[UIView bs_setHitTestingDisabled:](self->_contentView, "bs_setHitTestingDisabled:");
  }
}

- (void)setClippingEdge:(unint64_t)a3
{
  if (a3 != 1 && a3 != 4)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"WGWidgetPlatterView.m" lineNumber:103 description:@"Only 'UIRectEdgeTop' or 'UIRectEdgeBottom' (but not both) are supported."];
  }
  if (self->_clippingEdge != a3)
  {
    self->_clippingEdge = a3;
    [(WGWidgetPlatterView *)self setNeedsLayout];
  }
}

- (void)setBackgroundHidden:(BOOL)a3
{
  if (self->_backgroundHidden != a3)
  {
    self->_backgroundHidden = a3;
    [(WGWidgetPlatterView *)self setNeedsLayout];
  }
}

- (void)setButtonMode:(int64_t)a3
{
  self->_buttonMode = a3;
  -[WGWidgetPlatterView _updateUtilityButtonForMode:](self, "_updateUtilityButtonForMode:");
}

- (UIButton)showMoreButton
{
  [(WGWidgetPlatterView *)self _configureHeaderViewsIfNecessary];
  headerContentView = self->_headerContentView;
  return [(PLPlatterHeaderContentView *)headerContentView utilityButton];
}

- (void)setShowingMoreContent:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  [WeakRetained setUserSpecifiedDisplayMode:v5];

  if (self->_showingMoreContent != v3)
  {
    self->_showingMoreContent = v3;
    [(WGWidgetPlatterView *)self _updateUtilityButtonForMoreContentState:v3];
  }
}

- (UIButton)addWidgetButton
{
  [(WGWidgetPlatterView *)self _configureHeaderViewsIfNecessary];
  headerContentView = self->_headerContentView;
  return [(PLPlatterHeaderContentView *)headerContentView utilityButton];
}

- (void)setTopMarginForLayout:(double)a3
{
  if (self->_topMarginForLayout != a3)
  {
    self->_topMarginForLayout = a3;
    [(WGWidgetPlatterView *)self setNeedsLayout];
  }
}

+ (double)contentBaselineToBoundsBottomWithWidth:(double)a3
{
  double v4 = _WGMainScreenScale();
  +[PLPlatterHeaderContentView contentBaselineToBoundsBottomWithWidth:a3 scale:v4];
  return result;
}

- (NSString)widgetIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  BOOL v3 = [WeakRetained widgetIdentifier];

  return (NSString *)v3;
}

- (id)cancelTouches
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  BOOL v3 = [WeakRetained _cancelTouches];

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  uint64_t v6 = [WeakRetained parentViewController];
  id v7 = v6;
  if (v6) {
    objc_msgSend(v6, "sizeForChildContentContainer:withParentContainerSize:", WeakRetained, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
  else {
    [(WGWidgetPlatterView *)self _contentSize];
  }
  [(WGWidgetPlatterView *)self sizeThatFitsContentWithSize:width];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3 = *MEMORY[0x263F1D7C8];
  [(WGWidgetPlatterView *)self _contentSize];
  -[WGWidgetPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:");
  double v5 = v3;
  result.height = v4;
  result.double width = v5;
  return result;
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)WGWidgetPlatterView;
  [(WGWidgetPlatterView *)&v38 layoutSubviews];
  [(WGWidgetPlatterView *)self _configureBackgroundMaterialViewIfNecessary];
  [(WGWidgetPlatterView *)self _configureHeaderViewsIfNecessary];
  [(WGWidgetPlatterView *)self _layoutHeaderViews];
  [(WGWidgetPlatterView *)self _layoutContentView];
  [(WGWidgetPlatterView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIView *)self->_contentView frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v39.origin.x = v4;
  v39.origin.y = v6;
  v39.size.double width = v8;
  v39.size.height = v10;
  double MaxY = CGRectGetMaxY(v39);
  v40.origin.x = v12;
  v40.origin.y = v14;
  v40.size.double width = v16;
  v40.size.height = v18;
  double v19 = CGRectGetMaxY(v40);
  double v20 = v19;
  unint64_t clippingEdge = self->_clippingEdge;
  if (clippingEdge == 4)
  {
    double v19 = MaxY;
    if (MaxY < v20)
    {
      uint64_t v22 = 12;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (clippingEdge != 1)
  {
LABEL_11:
    uint64_t v22 = 0;
    goto LABEL_12;
  }
  v41.origin.x = v4;
  double v35 = v20;
  v41.origin.y = v6;
  v41.size.double width = v8;
  v41.size.height = v10;
  double Height = CGRectGetHeight(v41);
  v42.origin.x = v12;
  v42.origin.y = v14;
  v42.size.double width = v16;
  v42.size.height = v18;
  if (Height >= CGRectGetHeight(v42) + self->_cornerRadius) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = 3;
  }
  [(WGPlatterHeaderContentView *)self->_headerContentView frame];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  double v19 = MaxY;
  if (MaxY < v35) {
    goto LABEL_8;
  }
  CGFloat v29 = v23;
  CGFloat v30 = v24;
  v43.origin.x = v4;
  v43.origin.y = v6;
  v43.size.double width = v8;
  v43.size.height = v10;
  double v31 = CGRectGetHeight(v43);
  v44.origin.x = v26;
  v44.origin.y = v28;
  v44.size.double width = v29;
  v44.size.height = v30;
  double v19 = CGRectGetHeight(v44) + self->_cornerRadius;
  if (v31 < v19) {
LABEL_8:
  }
    v22 |= 0xCuLL;
LABEL_12:
  v32 = [(WGWidgetPlatterView *)self layer];
  [v32 setMaskedCorners:v22];

  if (v22) {
    double cornerRadius = self->_cornerRadius;
  }
  else {
    double cornerRadius = 0.0;
  }
  v37.receiver = self;
  v37.super_class = (Class)WGWidgetPlatterView;
  [(WGWidgetPlatterView *)&v37 _setContinuousCornerRadius:cornerRadius];
}

- (void)willRemoveSubview:(id)a3
{
  CGFloat v4 = (UIView *)a3;
  v8.receiver = self;
  v8.super_class = (Class)WGWidgetPlatterView;
  [(WGWidgetPlatterView *)&v8 willRemoveSubview:v4];
  if (self->_contentView == v4)
  {
    self->_contentView = 0;
  }
  p_widgetHost = &self->_widgetHost;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  if ([WeakRetained isViewLoaded])
  {
    double v7 = [WeakRetained view];

    if (v7 == v4) {
      objc_storeWeak((id *)p_widgetHost, 0);
    }
  }
}

- (double)_continuousCornerRadius
{
  return self->_cornerRadius;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_double cornerRadius = a3;
    -[MTMaterialView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
    [(UIView *)self->_contentView _setContinuousCornerRadius:self->_cornerRadius];
    [(WGWidgetPlatterView *)self setNeedsDisplay];
  }
}

- (void)_updateShowMoreButtonImage
{
  id v10 = [(WGWidgetPlatterView *)self showMoreButton];
  v2 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D270]];
  double v3 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D278]];
  [v2 pointSize];
  double v5 = v4;
  [v3 pointSize];
  double v7 = [MEMORY[0x263F1C6C8] configurationWithPointSize:6 weight:(v5 + v6) * 0.5];
  objc_super v8 = [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.forward"];
  double v9 = [v8 imageWithSymbolConfiguration:v7];

  [v10 setImage:v9 forState:0];
  objc_msgSend(v10, "setImageEdgeInsets:", -0.5, 0.0, 0.5, 0.0);
  objc_msgSend(v10, "_setTouchInsets:", -20.0, -20.0, -20.0, -20.0);
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(WGWidgetPlatterView *)self _configureHeaderViewsIfNecessary];
  headerContentView = self->_headerContentView;
  if (headerContentView)
  {
    -[PLPlatterHeaderContentView sizeThatFits:](headerContentView, "sizeThatFits:", width, 0.0);
    double height = height + v7;
  }
  double v8 = width;
  double v9 = height;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  -[WGWidgetPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:", a3.width, 0.0);
  double v6 = (double)((int)(height - v5) & ~((int)(height - v5) >> 31));
  double v7 = width;
  result.double height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_BOOL adjustsFontForContentSizeCategory = a3;
    [(WGWidgetPlatterView *)self _configureHeaderViewsIfNecessary];
    headerContentView = self->_headerContentView;
    BOOL adjustsFontForContentSizeCategory = self->_adjustsFontForContentSizeCategory;
    [(PLPlatterHeaderContentView *)headerContentView setAdjustsFontForContentSizeCategory:adjustsFontForContentSizeCategory];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return 1;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  p_materialGroupNameBase = &self->_materialGroupNameBase;
  id v6 = a3;
  if (!-[NSString isEqualToString:](*p_materialGroupNameBase, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
    [(MTMaterialView *)self->_backgroundView setGroupNameBase:*p_materialGroupNameBase];
  }
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  if (self->_backgroundView)
  {
    double v3 = [(MTMaterialView *)self->_backgroundView visualStylingProviderForCategory:a3];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WGWidgetPlatterView;
    double v3 = [(WGWidgetPlatterView *)&v5 visualStylingProviderForCategory:a3];
  }
  return v3;
}

- (NSArray)requiredVisualStyleCategories
{
  [(WGWidgetPlatterView *)self _configureHeaderViewsIfNecessary];
  headerContentView = self->_headerContentView;
  return [(PLPlatterHeaderContentView *)headerContentView requiredVisualStyleCategories];
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = a3;
  [(WGWidgetPlatterView *)self _configureHeaderViewsIfNecessary];
  [(PLPlatterHeaderContentView *)self->_headerContentView setVisualStylingProvider:v6 forCategory:a4];
}

- (void)_setContentView:(id)a3
{
  objc_super v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    double v11 = v5;
    double v8 = [(UIView *)contentView superview];

    if (v8 == self) {
      [(UIView *)*p_contentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    [(UIView *)*p_contentView bs_setHitTestingDisabled:self->_contentViewHitTestingDisabled];
    if (*p_contentView)
    {
      [(UIView *)*p_contentView setAutoresizingMask:0];
      double v9 = [(UIView *)*p_contentView layer];
      [v9 setMaskedCorners:12];

      [(UIView *)*p_contentView _setContinuousCornerRadius:self->_cornerRadius];
      [(UIView *)*p_contentView setClipsToBounds:1];
      [(WGWidgetPlatterView *)self _configureBackgroundMaterialViewIfNecessary];
      id v10 = *p_contentView;
      if (self->_backgroundView) {
        -[WGWidgetPlatterView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v10);
      }
      else {
        -[WGWidgetPlatterView insertSubview:atIndex:](self, "insertSubview:atIndex:", v10);
      }
    }
    contentView = (UIView *)[(WGWidgetPlatterView *)self setNeedsLayout];
    objc_super v5 = v11;
  }
  MEMORY[0x270F9A758](contentView, v5);
}

- (void)_configureBackgroundMaterialViewIfNecessary
{
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    if (self->_backgroundHidden)
    {
      [(MTMaterialView *)backgroundView removeFromSuperview];
      double v4 = self->_backgroundView;
      self->_backgroundView = 0;
    }
  }
  else if (!self->_backgroundHidden)
  {
    objc_super v5 = [MEMORY[0x263F53FE8] materialViewWithRecipe:2 configuration:1];
    id v6 = self->_backgroundView;
    self->_backgroundView = v5;

    [(MTMaterialView *)self->_backgroundView setGroupNameBase:self->_materialGroupNameBase];
    [(MTMaterialView *)self->_backgroundView _setContinuousCornerRadius:self->_cornerRadius];
    double v7 = self->_backgroundView;
    [(WGWidgetPlatterView *)self bounds];
    -[MTMaterialView setFrame:](v7, "setFrame:");
    [(MTMaterialView *)self->_backgroundView setAutoresizingMask:18];
    double v8 = self->_backgroundView;
    double v9 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    [(MTMaterialView *)v8 setBlurEnabled:(v10 & 0xFFFFFFFFFFFFFFFBLL) == 1];
    double v11 = self->_backgroundView;
    [(WGWidgetPlatterView *)self insertSubview:v11 atIndex:0];
  }
}

- (void)_updateHeaderContentViewVisualStyling
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_headerContentView)
  {
    [(WGWidgetPlatterView *)self _configureBackgroundMaterialViewIfNecessary];
    if (self->_backgroundView)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      double v3 = [(PLPlatterHeaderContentView *)self->_headerContentView requiredVisualStyleCategories];
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v12;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v12 != v6) {
              objc_enumerationMutation(v3);
            }
            uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) integerValue];
            headerContentView = self->_headerContentView;
            uint64_t v10 = [(MTMaterialView *)self->_backgroundView visualStylingProviderForCategory:v8];
            [(PLPlatterHeaderContentView *)headerContentView setVisualStylingProvider:v10 forCategory:v8];

            ++v7;
          }
          while (v5 != v7);
          uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v5);
      }
    }
  }
}

- (void)_configureHeaderViewsIfNecessary
{
  double v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v4 = [v3 integerForKey:@"WGAzulWidgetsType"];

  if (self->_headerContentView) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    [(WGWidgetPlatterView *)self _configureBackgroundMaterialViewIfNecessary];
    uint64_t v6 = objc_alloc_init(WGPlatterHeaderContentView);
    headerContentView = self->_headerContentView;
    self->_headerContentView = v6;

    [(PLPlatterHeaderContentView *)self->_headerContentView setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    [(PLPlatterHeaderContentView *)self->_headerContentView setHeedsHorizontalLayoutMargins:1];
    uint64_t v8 = [(WGPlatterHeaderContentView *)self->_headerContentView layer];
    [v8 setMaskedCorners:3];

    [(WGPlatterHeaderContentView *)self->_headerContentView _setContinuousCornerRadius:self->_cornerRadius];
    -[WGPlatterHeaderContentView setLayoutMargins:](self->_headerContentView, "setLayoutMargins:", 0.0, 11.5, 0.0, 11.5);
    [(WGWidgetPlatterView *)self addSubview:self->_headerContentView];
    [(WGWidgetPlatterView *)self _updateHeaderContentViewVisualStyling];
  }
}

- (CGSize)_contentSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  double v3 = [WeakRetained parentViewController];
  uint64_t v4 = v3;
  if (v3) {
    objc_msgSend(v3, "sizeForChildContentContainer:withParentContainerSize:", WeakRetained, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
  else {
    [WeakRetained preferredContentSize];
  }
  double v7 = v5;
  double v8 = v6;
  +[WGWidgetInfo maximumContentHeightForCompactDisplayMode];
  if (v8 < v9) {
    double v8 = v9;
  }

  double v10 = v7;
  double v11 = v8;
  result.double height = v11;
  result.CGFloat width = v10;
  return result;
}

- (CGRect)_headerFrameForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(WGWidgetPlatterView *)self _configureHeaderViewsIfNecessary];
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  if (CGRectIsEmpty(v12))
  {
    double v8 = *MEMORY[0x263F001A8];
    double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", width, height);
    BSRectWithSize();
    _WGMainScreenScale();
    UIRectIntegralWithScale();
  }
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (void)setOverrideHeightForLayingOutContentView:(double)a3
{
  if (vabdd_f64(a3, self->_overrideHeightForLayingOutContentView) > 2.22044605e-16)
  {
    self->_overrideHeightForLayingOutContentView = a3;
    [(WGWidgetPlatterView *)self setNeedsLayout];
  }
}

- (void)_layoutContentView
{
  if (self->_contentView)
  {
    [(WGWidgetPlatterView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", v7, v9);
    if (self->_overrideHeightForLayingOutContentView <= 0.0) {
      [(WGWidgetPlatterView *)self _contentSize];
    }
    [(WGWidgetPlatterView *)self bounds];
    -[WGWidgetPlatterView _headerFrameForBounds:](self, "_headerFrameForBounds:");
    double MaxY = CGRectGetMaxY(v21);
    v22.origin.CGFloat x = v4;
    v22.origin.CGFloat y = v6;
    v22.size.double width = v8;
    v22.size.double height = v10;
    if (CGRectIsEmpty(v22))
    {
      double v12 = *MEMORY[0x263F001A8];
      double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    else
    {
      v23.origin.CGFloat x = v4;
      v23.origin.CGFloat y = v6;
      v23.size.double width = v8;
      v23.size.double height = v10;
      CGRectGetWidth(v23);
      BSRectWithSize();
      double v12 = v15;
      double v13 = v16;
      double v14 = v17;
    }
    if (self->_clippingEdge == 1)
    {
      [(WGWidgetPlatterView *)self topMarginForLayout];
      double MaxY = MaxY - v18;
    }
    contentView = self->_contentView;
    -[UIView setFrame:](contentView, "setFrame:", v12, MaxY, v13, v14);
  }
}

- (void)_layoutHeaderViews
{
  [(WGWidgetPlatterView *)self bounds];
  -[WGWidgetPlatterView _headerFrameForBounds:](self, "_headerFrameForBounds:");
  -[WGPlatterHeaderContentView setFrame:](self->_headerContentView, "setFrame:");
  headerContentView = self->_headerContentView;
  [(WGPlatterHeaderContentView *)headerContentView setNeedsLayout];
}

- (void)_handleIconButton:(id)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  CGFloat v4 = [WeakRetained widgetIdentifier];
  double v5 = WGApplicationIdentifierForWidgetWithBundleIdentifier(v4);

  CGFloat v6 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  double v7 = (void *)MEMORY[0x263F3F778];
  uint64_t v8 = *MEMORY[0x263F14660];
  uint64_t v9 = *MEMORY[0x263F3F608];
  v15[0] = *MEMORY[0x263F3F5C0];
  v15[1] = v9;
  v16[0] = v8;
  v16[1] = MEMORY[0x263EFFA88];
  v15[2] = *MEMORY[0x263F3F5E8];
  v16[2] = MEMORY[0x263EFFA88];
  CGFloat v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  double v11 = [v7 optionsWithDictionary:v10];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__WGWidgetPlatterView__handleIconButton___block_invoke;
  v13[3] = &unk_264676C50;
  id v14 = v5;
  id v12 = v5;
  [v6 openApplication:v12 withOptions:v11 completion:v13];
}

void __41__WGWidgetPlatterView__handleIconButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __41__WGWidgetPlatterView__handleIconButton___block_invoke_cold_1(a1, (uint64_t)v6);
  }
}

- (void)_updateUtilityButtonForMode:(int64_t)a3
{
  if (a3 == 1)
  {
    double v7 = [(WGWidgetPlatterView *)self addWidgetButton];
    [v7 removeTarget:self action:sel__toggleShowMore_ forControlEvents:64];

    uint64_t v8 = [(WGWidgetPlatterView *)self addWidgetButton];
    [v8 addTarget:self action:sel__handleAddWidget_ forControlEvents:64];

    uint64_t v9 = [(WGWidgetPlatterView *)self addWidgetButton];
    int v10 = _os_feature_enabled_impl();
    double v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v12 = v11;
    if (v10) {
      double v13 = @"ADD_WIDGET_TITLE_LEGACY";
    }
    else {
      double v13 = @"ADD_WIDGET_TITLE";
    }
    id v14 = [v11 localizedStringForKey:v13 value:&stru_26D5C79B8 table:@"Widgets"];
    [v9 setTitle:v14 forState:0];

    headerContentView = self->_headerContentView;
    [(WGPlatterHeaderContentView *)headerContentView setNeedsLayout];
  }
  else if (!a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
    if ([WeakRetained isLinkedOnOrAfterSystemVersion:@"10.0"])
    {
      -[WGWidgetPlatterView setShowingMoreContent:](self, "setShowingMoreContent:", [WeakRetained userSpecifiedDisplayMode] == 1);
      CGFloat v4 = [(WGWidgetPlatterView *)self showMoreButton];
      [v4 removeTarget:self action:sel__handleAddWidget_ forControlEvents:64];
      [v4 addTarget:self action:sel__toggleShowMore_ forControlEvents:64];
      id v5 = [v4 titleLabel];
      if ([(WGWidgetPlatterView *)self _shouldReverseLayoutDirection]) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = 2;
      }
      [v5 setTextAlignment:v6];

      [(WGWidgetPlatterView *)self _updateShowMoreButtonImage];
      [(WGWidgetPlatterView *)self _updateUtilityButtonForMoreContentState:self->_showingMoreContent];
      -[WGWidgetPlatterView setShowMoreButtonVisible:](self, "setShowMoreButtonVisible:", [WeakRetained largestAvailableDisplayMode] == 1);
    }
    else
    {
      [(WGWidgetPlatterView *)self setShowMoreButtonVisible:0];
    }
  }
}

- (BOOL)_isUtilityButtonVisible
{
  v2 = [(PLPlatterHeaderContentView *)self->_headerContentView utilityButton];
  [v2 alpha];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)_setUtilityButtonVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WGWidgetPlatterView *)self _isUtilityButtonVisible] != a3)
  {
    id v5 = [(PLPlatterHeaderContentView *)self->_headerContentView utilityButton];
    uint64_t v6 = v5;
    double v7 = 0.0;
    if (v3) {
      double v7 = 1.0;
    }
    [v5 setAlpha:v7];

    [(WGWidgetPlatterView *)self setNeedsLayout];
  }
}

- (void)_toggleShowMore:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__WGWidgetPlatterView__toggleShowMore___block_invoke;
  v3[3] = &unk_264676588;
  v3[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:6 delay:v3 options:0 animations:0.3 completion:0.0];
}

uint64_t __39__WGWidgetPlatterView__toggleShowMore___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 isShowingMoreContent] ^ 1;
  return [v1 setShowingMoreContent:v2];
}

- (void)_handleAddWidget:(id)a3
{
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__WGWidgetPlatterView__handleAddWidget___block_invoke;
  v13[3] = &unk_264676588;
  void v13[4] = self;
  [MEMORY[0x263F1CB60] _animateUsingSpringWithDuration:0 delay:v13 options:0 mass:0.4 stiffness:0.0 damping:3.0 initialVelocity:1560.0 animations:600.0 completion:0.0];
  BOOL v4 = objc_alloc_init(WGCircleCheckView);
  id v5 = (void *)MEMORY[0x263F1CB60];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__WGWidgetPlatterView__handleAddWidget___block_invoke_2;
  v11[3] = &unk_264676680;
  v11[4] = self;
  uint64_t v6 = v4;
  id v12 = v6;
  [v5 performWithoutAnimation:v11];
  double v7 = (void *)MEMORY[0x263F1CB60];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __40__WGWidgetPlatterView__handleAddWidget___block_invoke_3;
  v9[3] = &unk_264676588;
  int v10 = v6;
  uint64_t v8 = v6;
  [v7 animateWithDuration:v9 animations:0.4];
}

uint64_t __40__WGWidgetPlatterView__handleAddWidget___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setUtilityButtonVisible:0];
}

uint64_t __40__WGWidgetPlatterView__handleAddWidget___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 416) setUtilityView:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v2 layoutIfNeeded];
}

uint64_t __40__WGWidgetPlatterView__handleAddWidget___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChecked:1];
}

- (void)_updateUtilityButtonForMoreContentState:(BOOL)a3
{
  if (!self->_buttonMode)
  {
    BOOL v3 = a3;
    int v5 = [(WGWidgetPlatterView *)self _shouldReverseLayoutDirection];
    long long v6 = *MEMORY[0x263F000D0];
    long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v15.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v15.c = v7;
    long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)&v15.tCGFloat x = v8;
    if (v3)
    {
      double v9 = -3.0;
      if (v5) {
        double v9 = 3.0;
      }
      double v10 = -0.5;
      if (v5) {
        double v10 = 0.5;
      }
      *(_OWORD *)&v14.a = v6;
      *(_OWORD *)&v14.c = v7;
      *(_OWORD *)&v14.tCGFloat x = v8;
      if (v5) {
        double v11 = -1.57079633;
      }
      else {
        double v11 = 1.57079633;
      }
      CGAffineTransformTranslate(&v15, &v14, v9, v10);
      CGAffineTransform v13 = v15;
      CGAffineTransformRotate(&v14, &v13, v11);
      CGAffineTransform v15 = v14;
    }
    headerContentView = self->_headerContentView;
    CGAffineTransform v14 = v15;
    [(WGPlatterHeaderContentView *)headerContentView setUtilityButtonTransform:&v14];
  }
}

- (void)iconDidInvalidate:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__WGWidgetPlatterView_iconDidInvalidate___block_invoke;
  v3[3] = &unk_2646766F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __41__WGWidgetPlatterView_iconDidInvalidate___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained widgetHost];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__WGWidgetPlatterView_iconDidInvalidate___block_invoke_2;
  v4[3] = &unk_264676C78;
  objc_copyWeak(&v5, v1);
  [v3 requestIconWithHandler:v4];

  objc_destroyWeak(&v5);
}

void __41__WGWidgetPlatterView_iconDidInvalidate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__WGWidgetPlatterView_iconDidInvalidate___block_invoke_3;
  v5[3] = &unk_264676630;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __41__WGWidgetPlatterView_iconDidInvalidate___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (void *)WeakRetained[52];
  if (v3)
  {
    id v5 = WeakRetained;
    id v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *(void *)(a1 + 32), 0);
    [v3 setIcons:v4];

    id WeakRetained = v5;
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (WGWidgetHostingViewController)widgetHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  return (WGWidgetHostingViewController *)WeakRetained;
}

- (WGWidgetListItemViewController)listItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listItem);
  return (WGWidgetListItemViewController *)WeakRetained;
}

- (void)setListItem:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isContentViewHitTestingDisabled
{
  return self->_contentViewHitTestingDisabled;
}

- (unint64_t)clippingEdge
{
  return self->_clippingEdge;
}

- (BOOL)isBackgroundHidden
{
  return self->_backgroundHidden;
}

- (double)overrideHeightForLayingOutContentView
{
  return self->_overrideHeightForLayingOutContentView;
}

- (double)topMarginForLayout
{
  return self->_topMarginForLayout;
}

- (int64_t)buttonMode
{
  return self->_buttonMode;
}

- (BOOL)isShowingMoreContent
{
  return self->_showingMoreContent;
}

- (BOOL)isEditingIcons
{
  return self->_editingIcons;
}

- (void)setEditingIcons:(BOOL)a3
{
  self->_editingIcons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_listItem);
  objc_destroyWeak((id *)&self->_widgetHost);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_headerContentView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

void __41__WGWidgetPlatterView__handleIconButton___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_222E49000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to open application with bundle identifier '%@': %@", (uint8_t *)&v3, 0x16u);
}

@end