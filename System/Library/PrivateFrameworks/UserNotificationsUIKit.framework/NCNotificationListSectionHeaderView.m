@interface NCNotificationListSectionHeaderView
+ (CGSize)_clearButtonPreferredSize;
+ (CGSize)_collapseButtonPreferredSize;
+ (double)headerHeightWithWidth:(double)a3 title:(id)a4 isShowingCollapseButton:(BOOL)a5;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)dismissModalFullScreenIfNeeded;
- (BOOL)showCollapseButton;
- (NCNotificationListHeaderTitleView)headerTitleView;
- (NCNotificationListSectionHeaderView)initWithFrame:(CGRect)a3;
- (NCNotificationListSectionHeaderViewDelegate)delegate;
- (NSString)materialGroupNameBase;
- (NSString)preferredContentSizeCategory;
- (NSString)sectionIdentifier;
- (NSString)title;
- (UIButton)collapseButton;
- (UIControl)clearButton;
- (_UILegibilitySettings)legibilitySettings;
- (id)_legibilitySettings;
- (id)containerViewForToggleControlClickInteractionPresentedContent:(id)a3;
- (void)_configureClearButtonIfNecessary;
- (void)_configureCollapseButtonIfNecessary;
- (void)_configureHeaderTitleViewIfNecessary;
- (void)_contentSizeCategoryDidChange;
- (void)_handleClearAll:(id)a3;
- (void)_handleClearButtonPrimaryActionTriggered:(id)a3;
- (void)_handleClearButtonTouchUpInside:(id)a3;
- (void)_handleCollapseActionTriggered:(id)a3;
- (void)_layoutClearButton;
- (void)_layoutCollapseButton;
- (void)_layoutHeaderTitleView;
- (void)_resetClearButtonStateAnimated:(BOOL)a3;
- (void)_updateHeaderTitleViewWithLegibilitySettings:(id)a3;
- (void)adjustForLegibilitySettingsChange:(id)a3;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setCollapseButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeaderTitleView:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setShowCollapseButton:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)toggleControlDidBeginClickInteraction:(id)a3;
- (void)toggleControlDidDismssClickInteractionPresentedContent:(id)a3;
- (void)toggleControlDidPresentClickInteractionPresentedContent:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NCNotificationListSectionHeaderView

+ (CGSize)_clearButtonPreferredSize
{
  double v3 = *((double *)&__clearButtonPreferredSize + 1);
  double v2 = *(double *)&__clearButtonPreferredSize;
  if (*(double *)&__clearButtonPreferredSize == 0.0 && *((double *)&__clearButtonPreferredSize + 1) == 0.0)
  {
    v4 = NCUserNotificationsUIKitFrameworkBundle();
    v5 = [v4 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR_ALL" value:&stru_1F2F516F8 table:0];
    v6 = +[NCToggleControl dismissControlWithMaterialRecipe:0 clearAllText:v5];

    [v6 setAdjustsFontForContentSizeCategory:1];
    objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    *(void *)&__clearButtonPreferredSize = v7;
    *((void *)&__clearButtonPreferredSize + 1) = v8;

    double v3 = *((double *)&__clearButtonPreferredSize + 1);
    double v2 = *(double *)&__clearButtonPreferredSize;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)_collapseButtonPreferredSize
{
  double v3 = *((double *)&__collapseButtonPreferredSize + 1);
  double v2 = *(double *)&__collapseButtonPreferredSize;
  if (*(double *)&__collapseButtonPreferredSize == 0.0 && *((double *)&__collapseButtonPreferredSize + 1) == 0.0)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14D0]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = (void *)MEMORY[0x1E4FB1830];
    uint64_t v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
    uint64_t v8 = [v6 configurationWithFont:v7 scale:1];

    v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.down" withConfiguration:v8];
    [v5 setImage:v9 forState:0];
    objc_msgSend(v5, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    *(void *)&__collapseButtonPreferredSize = v10;
    *((void *)&__collapseButtonPreferredSize + 1) = v11;

    double v3 = *((double *)&__collapseButtonPreferredSize + 1);
    double v2 = *(double *)&__collapseButtonPreferredSize;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)headerHeightWithWidth:(double)a3 title:(id)a4 isShowingCollapseButton:(BOOL)a5
{
  BOOL v5 = a5;
  v47[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (id *)MEMORY[0x1E4FB2608];
  v9 = (void *)*MEMORY[0x1E4FB2608];
  id v10 = a4;
  uint64_t v11 = [v9 preferredContentSizeCategory];
  BOOL IsAX = _NCSizeCategoryIsAX(v11);

  v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
  if (!IsAX)
  {
    unint64_t v14 = [*v8 activeInterfaceOrientation] - 3;
    v15 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v16 = [v15 userInterfaceIdiom];
    if (v14 >= 0xFFFFFFFFFFFFFFFELL)
    {
      if (v16)
      {
        *(double *)&uint64_t v17 = 52.0;
        goto LABEL_7;
      }
      v49.origin.x = NCMainScreenReferenceBounds();
      BOOL v19 = CGRectGetHeight(v49) <= 568.0;
      double v18 = 52.0;
      double v20 = 56.0;
    }
    else
    {
      if (v16)
      {
        *(double *)&uint64_t v17 = 50.0;
LABEL_7:
        double v18 = *(double *)&v17;
LABEL_12:
        [v13 _scaledValueForValue:v18 + -8.0];
        [v13 lineHeight];

        goto LABEL_13;
      }
      v48.origin.x = NCMainScreenReferenceBounds();
      BOOL v19 = CGRectGetHeight(v48) <= 568.0;
      double v18 = 50.0;
      double v20 = 54.0;
    }
    if (!v19) {
      double v18 = v20;
    }
    goto LABEL_12;
  }
LABEL_13:
  __clearButtonPreferredSize = *MEMORY[0x1E4F1DB30];
  __collapseButtonPreferredSize = __clearButtonPreferredSize;
  [a1 _clearButtonPreferredSize];
  double v22 = v21;
  [a1 _collapseButtonPreferredSize];
  double v24 = v23;
  unint64_t v25 = [*v8 activeInterfaceOrientation] - 1;
  double v26 = 6.0;
  if (v25 < 2) {
    double v26 = 10.0;
  }
  double v27 = a3 - v26;
  if (IsAX)
  {
    double v28 = 0.0;
  }
  else
  {
    [*v8 activeInterfaceOrientation];
    double v29 = v22 + 0.0;
    double v30 = 0.0;
    if (v5)
    {
      uint64_t v31 = objc_msgSend(*v8, "activeInterfaceOrientation", 0.0);
      double v32 = 6.0;
      if ((unint64_t)(v31 - 1) < 2) {
        double v32 = 10.0;
      }
      double v30 = v24 + v32;
    }
    double v28 = v29 + v30;
  }
  double v33 = v27 - v28;
  uint64_t v46 = *MEMORY[0x1E4FB06F8];
  v47[0] = v13;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v34, 0, v33, 0.0);
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;

  v50.origin.x = v36;
  v50.origin.y = v38;
  v50.size.width = v40;
  v50.size.height = v42;
  CGRectGetHeight(v50);

  if (!IsAX) {
    [v13 _scaledValueForValue:8.0];
  }
  _NCMainScreenScale();
  UICeilToScale();
  double v44 = v43;

  return v44;
}

- (NCNotificationListSectionHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListSectionHeaderView;
  double v3 = -[NCNotificationListSectionHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(NCNotificationListSectionHeaderView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v4 = a3;
  [(NCNotificationListSectionHeaderView *)self _configureClearButtonIfNecessary];
  [(PLGlyphControl *)self->_clearButton setMaterialGroupNameBase:v4];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(NCNotificationListHeaderTitleView *)self->_headerTitleView setTitle:v5];
}

- (UIControl)clearButton
{
  return (UIControl *)self->_clearButton;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListSectionHeaderView;
  [(NCNotificationListSectionHeaderView *)&v3 layoutSubviews];
  [(NCNotificationListSectionHeaderView *)self _configureHeaderTitleViewIfNecessary];
  [(NCNotificationListSectionHeaderView *)self _configureClearButtonIfNecessary];
  [(NCNotificationListSectionHeaderView *)self _configureCollapseButtonIfNecessary];
  [(NCNotificationListSectionHeaderView *)self _layoutClearButton];
  [(NCNotificationListSectionHeaderView *)self _layoutHeaderTitleView];
  [(NCNotificationListSectionHeaderView *)self _layoutCollapseButton];
}

- (BOOL)dismissModalFullScreenIfNeeded
{
  return [(NCToggleControl *)self->_clearButton dismissModalFullScreenIfNeeded];
}

- (id)containerViewForToggleControlClickInteractionPresentedContent:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained containerViewForHeaderViewPreviewInteractionPresentedContent:self];

  return v5;
}

- (void)toggleControlDidBeginClickInteraction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sectionHeaderViewDidBeginForceTouchInteraction:self];
}

- (void)toggleControlDidPresentClickInteractionPresentedContent:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sectionHeaderViewDidPresentForceTouchView:self];
}

- (void)toggleControlDidDismssClickInteractionPresentedContent:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sectionHeaderViewDidDismissForceTouchView:self];
}

- (id)_legibilitySettings
{
  legibilitySettings = self->_legibilitySettings;
  if (!legibilitySettings)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = [WeakRetained legibilitySettingsForSectionHeaderView:self];
    objc_super v6 = self->_legibilitySettings;
    self->_legibilitySettings = v5;

    legibilitySettings = self->_legibilitySettings;
  }

  return legibilitySettings;
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  p_legibilitySettings = &self->_legibilitySettings;
  id v8 = a3;
  if (([v8 isEqual:*p_legibilitySettings] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(NCNotificationListSectionHeaderView *)self _updateHeaderTitleViewWithLegibilitySettings:*p_legibilitySettings];
    collapseButton = self->_collapseButton;
    uint64_t v7 = [(_UILegibilitySettings *)*p_legibilitySettings primaryColor];
    [(UIButton *)collapseButton setTintColor:v7];
  }
}

- (void)_updateHeaderTitleViewWithLegibilitySettings:(id)a3
{
  if (a3) {
    -[NCNotificationListHeaderTitleView adjustForLegibilitySettingsChange:](self->_headerTitleView, "adjustForLegibilitySettingsChange:");
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    BOOL v3 = a3;
    self->_adjustsFontForContentSizeCategory = a3;
    -[NCNotificationListHeaderTitleView setAdjustsFontForContentSizeCategory:](self->_headerTitleView, "setAdjustsFontForContentSizeCategory:");
    [(NCToggleControl *)self->_clearButton setAdjustsFontForContentSizeCategory:v3];
    if (self->_adjustsFontForContentSizeCategory)
    {
      [(NCNotificationListSectionHeaderView *)self adjustForContentSizeCategoryChange];
    }
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  if ([(NCNotificationListSectionHeaderView *)self adjustsFontForContentSizeCategory])
  {
    BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v4 = [v3 preferredContentSizeCategory];

    id v5 = [(NCNotificationListSectionHeaderView *)self preferredContentSizeCategory];
    int v6 = [v4 isEqualToString:v5];

    if ((v6 & 1) == 0)
    {
      [(NCNotificationListSectionHeaderView *)self setPreferredContentSizeCategory:v4];
      clearButton = self->_clearButton;
      id v8 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
      if (_NCSizeCategoryIsAX(v8)) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = 2;
      }
      [(NCToggleControl *)clearButton setAnchorEdge:v9];
    }
    BOOL v10 = [(NCNotificationListHeaderTitleView *)self->_headerTitleView adjustForContentSizeCategoryChange];
    BOOL v11 = [(NCToggleControl *)self->_clearButton adjustForContentSizeCategoryChange];
    if ([(NCNotificationListSectionHeaderView *)self showCollapseButton]
      && (v12 = self->_collapseButton) != 0)
    {
      [(UIButton *)v12 removeFromSuperview];
      collapseButton = self->_collapseButton;
      self->_collapseButton = 0;
    }
    else if (!((v11 || v10) | v6 ^ 1))
    {
      BOOL v14 = 0;
      goto LABEL_14;
    }
    [(NCNotificationListSectionHeaderView *)self setNeedsLayout];
    BOOL v14 = 1;
LABEL_14:

    return v14;
  }
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationListSectionHeaderView;
  id v4 = a3;
  [(NCNotificationListSectionHeaderView *)&v8 traitCollectionDidChange:v4];
  id v5 = [(NCNotificationListSectionHeaderView *)self traitCollection];
  int v6 = [v5 preferredContentSizeCategory];
  uint64_t v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(NCNotificationListSectionHeaderView *)self _contentSizeCategoryDidChange];
  }
  [(NCNotificationListSectionHeaderView *)self setNeedsLayout];
}

- (void)_contentSizeCategoryDidChange
{
  __clearButtonPreferredSize = *MEMORY[0x1E4F1DB30];
  __collapseButtonPreferredSize = __clearButtonPreferredSize;
}

- (void)_resetClearButtonStateAnimated:(BOOL)a3
{
  clearButton = self->_clearButton;
  if (a3)
  {
    id v4 = clearButton;
    id v5 = objc_opt_class();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70__NCNotificationListSectionHeaderView__resetClearButtonStateAnimated___block_invoke;
    v7[3] = &unk_1E6A91BB0;
    objc_super v8 = v4;
    int v6 = v4;
    [v5 performWithDefaultExpansionAnimation:v7 completion:0];
  }
  else
  {
    -[NCToggleControl setExpanded:](clearButton, "setExpanded:");
  }
}

uint64_t __70__NCNotificationListSectionHeaderView__resetClearButtonStateAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setExpanded:0];
  double v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)_configureClearButtonIfNecessary
{
  if (!self->_clearButton)
  {
    BOOL v3 = NCUserNotificationsUIKitFrameworkBundle();
    id v4 = [v3 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR_ALL" value:&stru_1F2F516F8 table:0];
    id v5 = +[NCToggleControl dismissControlWithMaterialRecipe:1 clearAllText:v4];
    clearButton = self->_clearButton;
    self->_clearButton = v5;

    [(NCToggleControl *)self->_clearButton addTarget:self action:sel__handleClearButtonTouchUpInside_ forControlEvents:64];
    [(NCToggleControl *)self->_clearButton addTarget:self action:sel__handleClearButtonPrimaryActionTriggered_ forControlEvents:0x2000];
    [(NCToggleControl *)self->_clearButton addTarget:self forPreviewInteractionPresentedContentWithAction:sel__handleClearAll_];
    [(NCToggleControl *)self->_clearButton setDelegate:self];
    uint64_t v7 = self->_clearButton;
    objc_super v8 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    if (_NCSizeCategoryIsAX(v8)) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 2;
    }
    [(NCToggleControl *)v7 setAnchorEdge:v9];

    [(NCToggleControl *)self->_clearButton setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    id v10 = [(NCNotificationListSectionHeaderView *)self clearButton];
    [(NCNotificationListSectionHeaderView *)self addSubview:v10];
  }
}

- (void)_configureHeaderTitleViewIfNecessary
{
  if (!self->_headerTitleView)
  {
    BOOL v3 = [NCNotificationListHeaderTitleView alloc];
    [(NCNotificationListSectionHeaderView *)self bounds];
    id v4 = -[NCNotificationListHeaderTitleView initWithFrame:](v3, "initWithFrame:");
    headerTitleView = self->_headerTitleView;
    self->_headerTitleView = v4;

    [(NCNotificationListHeaderTitleView *)self->_headerTitleView setPrimary:1];
    [(NCNotificationListHeaderTitleView *)self->_headerTitleView setTitle:self->_title];
    [(NCNotificationListHeaderTitleView *)self->_headerTitleView adjustForLegibilitySettingsChange:self->_legibilitySettings];
    [(NCNotificationListHeaderTitleView *)self->_headerTitleView setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    [(NCNotificationListSectionHeaderView *)self addSubview:self->_headerTitleView];
    int v6 = self->_headerTitleView;
    [(NCNotificationListSectionHeaderView *)self sendSubviewToBack:v6];
  }
}

- (void)_configureCollapseButtonIfNecessary
{
  if ([(NCNotificationListSectionHeaderView *)self showCollapseButton] && !self->_collapseButton)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB14D0]);
    int v6 = (UIButton *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    collapseButton = self->_collapseButton;
    self->_collapseButton = v6;

    objc_super v8 = (void *)MEMORY[0x1E4FB1830];
    uint64_t v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
    v13 = [v8 configurationWithFont:v9 scale:1];

    id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.down" withConfiguration:v13];
    [(UIButton *)self->_collapseButton setImage:v10 forState:0];
    BOOL v11 = self->_collapseButton;
    v12 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
    [(UIButton *)v11 setTintColor:v12];

    [(UIButton *)self->_collapseButton addTarget:self action:sel__handleCollapseActionTriggered_ forControlEvents:64];
    -[UIButton _setTouchInsets:](self->_collapseButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    [(NCNotificationListSectionHeaderView *)self addSubview:self->_collapseButton];

    id v4 = v13;
  }
  else
  {
    if ([(NCNotificationListSectionHeaderView *)self showCollapseButton]) {
      return;
    }
    BOOL v3 = self->_collapseButton;
    if (!v3) {
      return;
    }
    [(UIButton *)v3 removeFromSuperview];
    id v4 = self->_collapseButton;
    self->_collapseButton = 0;
  }
}

- (void)_layoutClearButton
{
  [(NCNotificationListSectionHeaderView *)self bounds];
  CGFloat rect = v3;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  -[NCToggleControl sizeThatFits:](self->_clearButton, "sizeThatFits:", v6, v8);
  BSRectWithSize();
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v18 = (id *)MEMORY[0x1E4FB2608];
  BOOL v19 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  int IsAX = _NCSizeCategoryIsAX(v19);

  int v21 = [(NCNotificationListSectionHeaderView *)self _shouldReverseLayoutDirection];
  unint64_t v22 = [*v18 activeInterfaceOrientation] - 1;
  double v23 = 6.0;
  if (v22 < 2) {
    double v23 = 10.0;
  }
  if (IsAX) {
    double v24 = v23;
  }
  else {
    double v24 = 0.0;
  }
  if (IsAX == v21)
  {
    v29.origin.x = rect;
    v29.origin.y = v5;
    v29.size.width = v7;
    v29.size.height = v9;
    CGFloat v25 = CGRectGetMaxX(v29) - v24;
    v30.origin.x = v11;
    v30.origin.y = v13;
    v30.size.width = v15;
    v30.size.height = v17;
    double v24 = round(v25 - CGRectGetWidth(v30));
  }
  [(NCNotificationListSectionHeaderView *)self bounds];
  CGRectGetHeight(v31);
  v32.origin.x = v24;
  v32.origin.y = v13;
  v32.size.width = v15;
  v32.size.height = v17;
  CGRectGetHeight(v32);
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  clearButton = self->_clearButton;

  -[NCToggleControl setFrame:](clearButton, "setFrame:");
}

- (void)_layoutHeaderTitleView
{
  [(NCNotificationListSectionHeaderView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[NCNotificationListHeaderTitleView sizeThatFits:](self->_headerTitleView, "sizeThatFits:", v7, v9);
  BSRectWithSize();
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  int v19 = [(NCNotificationListSectionHeaderView *)self _shouldReverseLayoutDirection];
  double v20 = (id *)MEMORY[0x1E4FB2608];
  CGFloat v49 = v6;
  CGFloat v50 = v4;
  CGFloat rect = v14;
  if (v19)
  {
    v54.origin.x = v4;
    v54.origin.y = v6;
    v54.size.width = v8;
    v54.size.height = v10;
    double Width = CGRectGetWidth(v54);
    uint64_t v22 = [*v20 activeInterfaceOrientation];
    double v23 = 6.0;
    if ((unint64_t)(v22 - 1) < 2) {
      double v23 = 10.0;
    }
    double v24 = Width - v23;
    v55.origin.x = v12;
    v55.origin.y = v14;
    v55.size.width = v16;
    v55.size.height = v18;
    double v25 = v24 - CGRectGetWidth(v55);
  }
  else if ((unint64_t)([(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] - 1) >= 2)
  {
    double v25 = 6.0;
  }
  else
  {
    double v25 = 10.0;
  }
  double v26 = [*v20 preferredContentSizeCategory];
  BOOL IsAX = _NCSizeCategoryIsAX(v26);

  [(id)objc_opt_class() _clearButtonPreferredSize];
  CGFloat v51 = v18;
  CGFloat v52 = v16;
  CGFloat v29 = v18;
  CGFloat v30 = v16;
  CGFloat v31 = v25;
  if (!IsAX)
  {
    double v32 = v28;
    v56.origin.y = v49;
    v56.origin.x = v50;
    v56.size.width = v8;
    v56.size.height = v10;
    double v33 = CGRectGetWidth(v56);
    double v34 = 6.0;
    if ((unint64_t)([*v20 activeInterfaceOrientation] - 1) >= 2) {
      double v35 = 6.0;
    }
    else {
      double v35 = 10.0;
    }
    double v36 = v33 - v35;
    [*v20 activeInterfaceOrientation];
    double v37 = 0.0;
    double v38 = v36 - (v32 + 0.0);
    if ([(NCNotificationListSectionHeaderView *)self showCollapseButton])
    {
      if ((unint64_t)([*v20 activeInterfaceOrientation] - 1) < 2) {
        double v34 = 10.0;
      }
      -[UIButton sizeThatFits:](self->_collapseButton, "sizeThatFits:", v8, v10);
      double v37 = v34 + v39;
    }
    headerTitleView = self->_headerTitleView;
    [(NCNotificationListSectionHeaderView *)self bounds];
    -[NCNotificationListHeaderTitleView sizeThatFits:](headerTitleView, "sizeThatFits:", v38 - v37, CGRectGetHeight(v57));
    BSRectWithSize();
    CGFloat v31 = v41;
    CGFloat v30 = v42;
    CGFloat v29 = v43;
  }
  double v44 = [*v20 preferredContentSizeCategory];
  double v45 = 12.0;
  if (!_NCSizeCategoryIsAX(v44))
  {
    v58.origin.y = v49;
    v58.origin.x = v50;
    v58.size.width = v8;
    v58.size.height = v10;
    CGFloat v46 = CGRectGetHeight(v58) + -8.0;
    v59.origin.x = v25;
    v59.origin.y = rect;
    v59.size.height = v51;
    v59.size.width = v52;
    double v45 = v46 - CGRectGetHeight(v59);
  }

  if (!IsAX)
  {
    v60.origin.y = v49;
    v60.origin.x = v50;
    v60.size.width = v8;
    v60.size.height = v10;
    CGRectGetHeight(v60);
    v61.origin.x = v31;
    v61.origin.y = v45;
    v61.size.width = v30;
    v61.size.height = v29;
    CGRectGetHeight(v61);
  }
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  v47 = self->_headerTitleView;

  -[NCNotificationListHeaderTitleView setFrame:](v47, "setFrame:");
}

- (void)_layoutCollapseButton
{
  if (!self->_collapseButton) {
    return;
  }
  [(NCNotificationListSectionHeaderView *)self bounds];
  CGFloat v46 = v4;
  CGFloat v47 = v3;
  CGFloat v44 = v6;
  CGFloat v45 = v5;
  [(NCNotificationListHeaderTitleView *)self->_headerTitleView frame];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  [(NCToggleControl *)self->_clearButton frame];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v42 = v19;
  CGFloat v43 = v20;
  collapseButton = self->_collapseButton;
  [(NCNotificationListSectionHeaderView *)self bounds];
  -[UIButton sizeThatFits:](collapseButton, "sizeThatFits:", v22, v23);
  double v25 = v24;
  int v26 = [(NCNotificationListSectionHeaderView *)self _shouldReverseLayoutDirection];
  double v27 = (id *)MEMORY[0x1E4FB2608];
  uint64_t v28 = v8;
  uint64_t v29 = v10;
  uint64_t v30 = v12;
  uint64_t v31 = v14;
  if (v26)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v28);
    unint64_t v33 = [*v27 activeInterfaceOrientation] - 1;
    double v34 = 6.0;
    if (v33 < 2) {
      double v34 = 10.0;
    }
    double v35 = MinX - v34 - v25;
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v28);
    unint64_t v37 = [*v27 activeInterfaceOrientation] - 1;
    double v38 = 6.0;
    if (v37 < 2) {
      double v38 = 10.0;
    }
    double v35 = MaxX + v38;
  }
  double v39 = [*v27 preferredContentSizeCategory];
  BOOL IsAX = _NCSizeCategoryIsAX(v39);

  if ([(NCNotificationListSectionHeaderView *)self _shouldReverseLayoutDirection])
  {
    if (v35 >= 0.0) {
      goto LABEL_19;
    }
LABEL_14:
    if ([(NCNotificationListSectionHeaderView *)self _shouldReverseLayoutDirection])
    {
      if (!IsAX)
      {
LABEL_16:
        v50.origin.x = v16;
        v50.origin.y = v18;
        v50.size.width = v42;
        v50.size.height = v43;
        CGRectGetMaxX(v50);
        [*v27 activeInterfaceOrientation];
        goto LABEL_19;
      }
    }
    else if (IsAX)
    {
      goto LABEL_16;
    }
    v51.origin.x = v16;
    v51.origin.y = v18;
    v51.size.width = v42;
    v51.size.height = v43;
    CGRectGetMinX(v51);
    [*v27 activeInterfaceOrientation];
    goto LABEL_19;
  }
  v49.origin.y = v46;
  v49.origin.x = v47;
  v49.size.height = v44;
  v49.size.width = v45;
  if (v25 + v35 > CGRectGetWidth(v49)) {
    goto LABEL_14;
  }
LABEL_19:
  UIRectCenteredYInRect();
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  double v41 = self->_collapseButton;

  -[UIButton setFrame:](v41, "setFrame:");
}

- (void)_handleClearButtonTouchUpInside:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationListSectionHeaderView *)self clearButton];

  if (v5 == v4 && ![(NCToggleControl *)self->_clearButton isExpanded])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sectionHeaderViewDidTransitionToClearState:self];
  }
}

- (void)_handleClearButtonPrimaryActionTriggered:(id)a3
{
  [(NCNotificationListSectionHeaderView *)self _resetClearButtonStateAnimated:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [(NCNotificationListSectionHeaderView *)self sectionIdentifier];
  [WeakRetained sectionHeaderView:self didReceiveClearActionForSectionIdentifier:v4];
}

- (void)_handleClearAll:(id)a3
{
  id v4 = [(NCNotificationListSectionHeaderView *)self delegate];
  [v4 sectionHeaderViewDidReceiveClearAllAction:self];

  clearButton = self->_clearButton;

  [(NCToggleControl *)clearButton dismissModalFullScreenIfNeeded];
}

- (void)_handleCollapseActionTriggered:(id)a3
{
  id v4 = [(NCNotificationListSectionHeaderView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v4 sectionHeaderViewDidRequestCollapsing:self];
    id v5 = [(NCNotificationListSectionHeaderView *)self collapseButton];
    memset(&v16, 0, sizeof(v16));
    int v6 = [(NCNotificationListSectionHeaderView *)self _shouldReverseLayoutDirection];
    double v7 = -1.57;
    if (v6) {
      double v7 = 1.57;
    }
    CGAffineTransformMakeRotation(&v16, v7);
    uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__NCNotificationListSectionHeaderView__handleCollapseActionTriggered___block_invoke;
    v13[3] = &unk_1E6A931F8;
    id v9 = v5;
    CGAffineTransform v15 = v16;
    id v14 = v9;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__NCNotificationListSectionHeaderView__handleCollapseActionTriggered___block_invoke_2;
    v11[3] = &unk_1E6A93220;
    id v12 = v9;
    id v10 = v9;
    [v8 animateWithDuration:0 delay:v13 options:v11 animations:0.3 completion:0.0];
  }
}

uint64_t __70__NCNotificationListSectionHeaderView__handleCollapseActionTriggered___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __70__NCNotificationListSectionHeaderView__handleCollapseActionTriggered___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (NCNotificationListSectionHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListSectionHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (BOOL)showCollapseButton
{
  return self->_showCollapseButton;
}

- (void)setShowCollapseButton:(BOOL)a3
{
  self->_showCollapseButton = a3;
}

- (NCNotificationListHeaderTitleView)headerTitleView
{
  return self->_headerTitleView;
}

- (void)setHeaderTitleView:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (UIButton)collapseButton
{
  return self->_collapseButton;
}

- (void)setCollapseButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collapseButton, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_headerTitleView, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);

  objc_storeStrong((id *)&self->_clearButton, 0);
}

@end