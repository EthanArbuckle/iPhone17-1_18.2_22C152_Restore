@interface WFCompactPlatterView
- (BOOL)arrangeActionsVertically;
- (BOOL)footerViewHidden;
- (BOOL)hasScheduledSizeInvalidation;
- (BOOL)hidesContentViewTopSeparator;
- (BOOL)insetsContent;
- (BOOL)isClippingContent;
- (BOOL)sashVisible;
- (BOOL)showsBottomScrollingSeparator;
- (BOOL)showsTopScrollingSeparator;
- (BOOL)suppressContentViewLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)staticContentSizeForSize:(CGSize)a3;
- (NSArray)actions;
- (NSString)primaryText;
- (NSString)secondaryText;
- (NSString)secondaryTextFontStyle;
- (UIEdgeInsets)labelInsets;
- (UIEdgeInsets)separatorInsets;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UIView)backdropView;
- (UIView)clippingAutoLayoutContainerView;
- (UIView)clippingContentView;
- (UIView)contentView;
- (UIView)contentViewSeparatorView;
- (UIView)footerView;
- (UIView)footerViewSeparatorView;
- (UIView)insetContentBackgroundView;
- (WFCompactActionGroupView)actionGroupView;
- (WFCompactAppearanceProvider)appearanceProvider;
- (WFCompactPlatterContentClippingDelegate)contentClippingDelegate;
- (WFCompactPlatterSizingDelegate)sizingDelegate;
- (WFCompactPlatterView)initWithFrame:(CGRect)a3;
- (WFCompactTitledPlatterView)platterView;
- (WFDialogAttribution)attribution;
- (double)contentHeightWhenClipped;
- (double)contentVerticalOffsetWhenClipped;
- (double)footerViewHeight;
- (double)separatorHeight;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)primaryTextAlignment;
- (int64_t)secondaryTextAlignment;
- (void)_labelContentChanged;
- (void)applyMaterialViewStyling;
- (void)layoutContentInsideClippingView;
- (void)layoutCustomContentViewForPlatterView:(id)a3;
- (void)setActionGroupView:(id)a3;
- (void)setActions:(id)a3;
- (void)setAppearanceProvider:(id)a3;
- (void)setArrangeActionsVertically:(BOOL)a3;
- (void)setAttribution:(id)a3;
- (void)setBackdropView:(id)a3;
- (void)setClippingAutoLayoutContainerView:(id)a3;
- (void)setClippingContent:(BOOL)a3;
- (void)setClippingContentView:(id)a3;
- (void)setContentClippingDelegate:(id)a3;
- (void)setContentHeightWhenClipped:(double)a3;
- (void)setContentVerticalOffsetWhenClipped:(double)a3;
- (void)setContentView:(id)a3;
- (void)setFooterViewHeight:(double)a3;
- (void)setFooterViewHidden:(BOOL)a3;
- (void)setFooterViewSeparatorView:(id)a3;
- (void)setHasScheduledSizeInvalidation:(BOOL)a3;
- (void)setHidesContentViewTopSeparator:(BOOL)a3;
- (void)setInsetContentBackgroundView:(id)a3;
- (void)setInsetsContent:(BOOL)a3;
- (void)setLabelInsets:(UIEdgeInsets)a3;
- (void)setNeedsLayoutAndSizeInvalidation;
- (void)setPlatterView:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setPrimaryTextAlignment:(int64_t)a3;
- (void)setSashVisible:(BOOL)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSecondaryTextAlignment:(int64_t)a3;
- (void)setSecondaryTextFontStyle:(id)a3;
- (void)setSeparatorInsets:(UIEdgeInsets)a3;
- (void)setShowsBottomScrollingSeparator:(BOOL)a3;
- (void)setShowsTopScrollingSeparator:(BOOL)a3;
- (void)setSizingDelegate:(id)a3;
- (void)setSuppressContentViewLayout:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContentViewSeparatorVisibility;
- (void)updateFooterViewSeparatorVisibility;
@end

@implementation WFCompactPlatterView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_footerViewSeparatorView);
  objc_destroyWeak((id *)&self->_clippingAutoLayoutContainerView);
  objc_destroyWeak((id *)&self->_insetContentBackgroundView);
  objc_destroyWeak((id *)&self->_secondaryLabel);
  objc_destroyWeak((id *)&self->_primaryLabel);
  objc_destroyWeak((id *)&self->_platterView);
  objc_destroyWeak((id *)&self->_sizingDelegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_destroyWeak((id *)&self->_contentClippingDelegate);
  objc_storeStrong((id *)&self->_contentViewSeparatorView, 0);
  objc_destroyWeak((id *)&self->_clippingContentView);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_backdropView);
  objc_destroyWeak((id *)&self->_actionGroupView);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_storeStrong((id *)&self->_secondaryTextFontStyle, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

- (void)setHasScheduledSizeInvalidation:(BOOL)a3
{
  self->_hasScheduledSizeInvalidation = a3;
}

- (BOOL)hasScheduledSizeInvalidation
{
  return self->_hasScheduledSizeInvalidation;
}

- (void)setFooterViewSeparatorView:(id)a3
{
}

- (UIView)footerViewSeparatorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_footerViewSeparatorView);
  return (UIView *)WeakRetained;
}

- (void)setClippingAutoLayoutContainerView:(id)a3
{
}

- (UIView)clippingAutoLayoutContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clippingAutoLayoutContainerView);
  return (UIView *)WeakRetained;
}

- (void)setInsetContentBackgroundView:(id)a3
{
}

- (UIView)insetContentBackgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_insetContentBackgroundView);
  return (UIView *)WeakRetained;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondaryLabel);
  return (UILabel *)WeakRetained;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)primaryLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryLabel);
  return (UILabel *)WeakRetained;
}

- (void)setPlatterView:(id)a3
{
}

- (WFCompactTitledPlatterView)platterView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);
  return (WFCompactTitledPlatterView *)WeakRetained;
}

- (void)setSizingDelegate:(id)a3
{
}

- (WFCompactPlatterSizingDelegate)sizingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizingDelegate);
  return (WFCompactPlatterSizingDelegate *)WeakRetained;
}

- (BOOL)footerViewHidden
{
  return self->_footerViewHidden;
}

- (double)footerViewHeight
{
  return self->_footerViewHeight;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setContentClippingDelegate:(id)a3
{
}

- (WFCompactPlatterContentClippingDelegate)contentClippingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentClippingDelegate);
  return (WFCompactPlatterContentClippingDelegate *)WeakRetained;
}

- (double)contentVerticalOffsetWhenClipped
{
  return self->_contentVerticalOffsetWhenClipped;
}

- (double)contentHeightWhenClipped
{
  return self->_contentHeightWhenClipped;
}

- (BOOL)isClippingContent
{
  return self->_clippingContent;
}

- (BOOL)hidesContentViewTopSeparator
{
  return self->_hidesContentViewTopSeparator;
}

- (BOOL)showsBottomScrollingSeparator
{
  return self->_showsBottomScrollingSeparator;
}

- (BOOL)showsTopScrollingSeparator
{
  return self->_showsTopScrollingSeparator;
}

- (UIView)contentViewSeparatorView
{
  return self->_contentViewSeparatorView;
}

- (void)setSuppressContentViewLayout:(BOOL)a3
{
  self->_suppressContentViewLayout = a3;
}

- (BOOL)suppressContentViewLayout
{
  return self->_suppressContentViewLayout;
}

- (void)setClippingContentView:(id)a3
{
}

- (UIView)clippingContentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clippingContentView);
  return (UIView *)WeakRetained;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setBackdropView:(id)a3
{
}

- (UIView)backdropView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backdropView);
  return (UIView *)WeakRetained;
}

- (void)setArrangeActionsVertically:(BOOL)a3
{
  self->_arrangeActionsVertically = a3;
}

- (BOOL)arrangeActionsVertically
{
  return self->_arrangeActionsVertically;
}

- (void)setActionGroupView:(id)a3
{
}

- (WFCompactActionGroupView)actionGroupView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionGroupView);
  return (WFCompactActionGroupView *)WeakRetained;
}

- (NSArray)actions
{
  return self->_actions;
}

- (WFCompactAppearanceProvider)appearanceProvider
{
  return self->_appearanceProvider;
}

- (void)setInsetsContent:(BOOL)a3
{
  self->_insetsContent = a3;
}

- (BOOL)insetsContent
{
  return self->_insetsContent;
}

- (BOOL)sashVisible
{
  return self->_sashVisible;
}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  self->_separatorInsets = a3;
}

- (UIEdgeInsets)separatorInsets
{
  double top = self->_separatorInsets.top;
  double left = self->_separatorInsets.left;
  double bottom = self->_separatorInsets.bottom;
  double right = self->_separatorInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLabelInsets:(UIEdgeInsets)a3
{
  self->_labelInsets = a3;
}

- (UIEdgeInsets)labelInsets
{
  double top = self->_labelInsets.top;
  double left = self->_labelInsets.left;
  double bottom = self->_labelInsets.bottom;
  double right = self->_labelInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSString)secondaryTextFontStyle
{
  return self->_secondaryTextFontStyle;
}

- (int64_t)secondaryTextAlignment
{
  return self->_secondaryTextAlignment;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (int64_t)primaryTextAlignment
{
  return self->_primaryTextAlignment;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  v4 = [(WFCompactPlatterView *)self platterView];
  v5 = [v4 visualStylingProviderForCategory:a3];

  return v5;
}

- (void)setAppearanceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceProvider, a3);
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);
  [WeakRetained setAppearanceProvider:v7];

  id v6 = objc_loadWeakRetained((id *)&self->_actionGroupView);
  [v6 setAppearanceProvider:v7];

  [v7 configurePlatterView:self];
}

- (void)setSashVisible:(BOOL)a3
{
  BOOL v3 = a3;
  self->_sashVisible = a3;
  v5 = [(WFCompactPlatterView *)self platterView];
  [v5 setSashVisible:v3];

  [(WFCompactPlatterView *)self setNeedsLayoutAndSizeInvalidation];
  [(WFCompactPlatterView *)self layoutIfNeeded];
}

- (void)setContentVerticalOffsetWhenClipped:(double)a3
{
  if (self->_contentVerticalOffsetWhenClipped != a3)
  {
    self->_contentVerticalOffsetWhenClipped = a3;
    uint64_t v5 = [(WFCompactPlatterView *)self contentClippingDelegate];
    if (v5)
    {
      id v6 = (void *)v5;
      BOOL v7 = [(WFCompactPlatterView *)self isClippingContent];

      if (v7)
      {
        v8 = [(WFCompactPlatterView *)self contentClippingDelegate];
        [v8 platterView:self didUpdateContentVerticalOffset:a3];
      }
    }
    [(WFCompactPlatterView *)self layoutContentInsideClippingView];
  }
}

- (void)setContentHeightWhenClipped:(double)a3
{
  if (self->_contentHeightWhenClipped != a3)
  {
    self->_contentHeightWhenClipped = a3;
    [(WFCompactPlatterView *)self layoutContentInsideClippingView];
  }
}

- (void)setClippingContent:(BOOL)a3
{
  if (self->_clippingContent != a3)
  {
    BOOL v3 = a3;
    self->_clippingContent = a3;
    uint64_t v5 = [(WFCompactPlatterView *)self contentClippingDelegate];

    if (v5)
    {
      id v6 = [(WFCompactPlatterView *)self contentClippingDelegate];
      double v7 = 0.0;
      if (v3) {
        [(WFCompactPlatterView *)self contentVerticalOffsetWhenClipped];
      }
      [v6 platterView:self didUpdateContentVerticalOffset:v7];
    }
    [(WFCompactPlatterView *)self layoutContentInsideClippingView];
  }
}

- (void)setFooterViewHidden:(BOOL)a3
{
  if (self->_footerViewHidden != a3)
  {
    BOOL v3 = a3;
    self->_footerViewHidden = a3;
    uint64_t v5 = [(WFCompactPlatterView *)self footerView];
    [v5 setHidden:v3];

    [(WFCompactPlatterView *)self updateFooterViewSeparatorVisibility];
    [(WFCompactPlatterView *)self setNeedsLayoutAndSizeInvalidation];
  }
}

- (void)setFooterViewHeight:(double)a3
{
  if (self->_footerViewHeight != a3)
  {
    self->_footerViewHeight = a3;
    if (![(WFCompactPlatterView *)self footerViewHidden])
    {
      [(WFCompactPlatterView *)self setNeedsLayoutAndSizeInvalidation];
    }
  }
}

- (void)setActions:(id)a3
{
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionGroupView);
  [WeakRetained removeFromSuperview];

  objc_storeStrong((id *)&self->_actions, a3);
  if (self->_actions)
  {
    id v6 = objc_opt_new();
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v7 = [v6 heightAnchor];
    v8 = [v7 constraintEqualToConstant:0.0];
    [v8 setActive:1];

    v9 = [WFCompactActionGroupView alloc];
    actions = self->_actions;
    v11 = [(WFCompactPlatterView *)self appearanceProvider];
    v12 = [(WFCompactActionGroupView *)v9 initWithActions:actions appearanceProvider:v11];

    objc_storeWeak((id *)&self->_actionGroupView, v12);
    v13 = [(WFCompactPlatterView *)self platterView];
    v14 = [v13 customContentView];
    [v14 addSubview:v12];

    [(WFCompactPlatterView *)self setNeedsLayoutAndSizeInvalidation];
  }
  else
  {
    [(WFCompactPlatterView *)self setNeedsLayoutAndSizeInvalidation];
  }
}

- (void)updateFooterViewSeparatorVisibility
{
  if ([(WFCompactPlatterView *)self insetsContent]) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = ![(WFCompactPlatterView *)self showsBottomScrollingSeparator]
  }
      && [(WFCompactPlatterView *)self footerViewHidden];
  v4 = [(WFCompactPlatterView *)self footerViewSeparatorView];
  int v5 = [v4 isHidden];

  if (v3 != v5)
  {
    id v6 = [(WFCompactPlatterView *)self footerViewSeparatorView];
    [v6 setHidden:v3];

    [(WFCompactPlatterView *)self setNeedsLayoutAndSizeInvalidation];
  }
}

- (void)setShowsBottomScrollingSeparator:(BOOL)a3
{
  self->_showsBottomScrollingSeparator = a3;
  [(WFCompactPlatterView *)self updateFooterViewSeparatorVisibility];
}

- (void)updateContentViewSeparatorVisibility
{
  if ([(WFCompactPlatterView *)self insetsContent])
  {
    BOOL v3 = 1;
  }
  else if ([(WFCompactPlatterView *)self showsTopScrollingSeparator])
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [(WFCompactPlatterView *)self contentView];
    if (v4)
    {
      int v5 = [(WFCompactPlatterView *)self primaryText];
      if ([v5 length])
      {
        BOOL v3 = [(WFCompactPlatterView *)self hidesContentViewTopSeparator];
      }
      else
      {
        id v6 = [(WFCompactPlatterView *)self secondaryText];
        if ([v6 length]) {
          BOOL v3 = [(WFCompactPlatterView *)self hidesContentViewTopSeparator];
        }
        else {
          BOOL v3 = 1;
        }
      }
    }
    else
    {
      BOOL v3 = 1;
    }
  }
  double v7 = [(WFCompactPlatterView *)self contentViewSeparatorView];
  int v8 = [v7 isHidden];

  if (v3 != v8)
  {
    v9 = [(WFCompactPlatterView *)self contentViewSeparatorView];
    [v9 setHidden:v3];

    [(WFCompactPlatterView *)self setNeedsLayoutAndSizeInvalidation];
  }
}

- (void)setShowsTopScrollingSeparator:(BOOL)a3
{
  self->_showsTopScrollingSeparator = a3;
  [(WFCompactPlatterView *)self updateContentViewSeparatorVisibility];
}

- (void)setHidesContentViewTopSeparator:(BOOL)a3
{
  if (self->_hidesContentViewTopSeparator != a3)
  {
    self->_hidesContentViewTopSeparator = a3;
    [(WFCompactPlatterView *)self updateContentViewSeparatorVisibility];
  }
}

- (void)setContentView:(id)a3
{
  v42[4] = *MEMORY[0x263EF8340];
  int v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    if (v5)
    {
      [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v7 = [(WFCompactPlatterView *)self clippingAutoLayoutContainerView];
      [v7 addSubview:v5];

      v34 = (void *)MEMORY[0x263F08938];
      v40 = [(UIView *)v5 topAnchor];
      v41 = [(WFCompactPlatterView *)self clippingAutoLayoutContainerView];
      v39 = [v41 topAnchor];
      v38 = [v40 constraintEqualToAnchor:v39];
      v42[0] = v38;
      v36 = [(UIView *)v5 leadingAnchor];
      v37 = [(WFCompactPlatterView *)self clippingAutoLayoutContainerView];
      v35 = [v37 leadingAnchor];
      v33 = [v36 constraintEqualToAnchor:v35];
      v42[1] = v33;
      v32 = [(UIView *)v5 trailingAnchor];
      int v8 = [(WFCompactPlatterView *)self clippingAutoLayoutContainerView];
      v9 = [v8 trailingAnchor];
      v10 = [v32 constraintEqualToAnchor:v9];
      v42[2] = v10;
      v11 = [(UIView *)v5 bottomAnchor];
      v12 = [(WFCompactPlatterView *)self clippingAutoLayoutContainerView];
      v13 = [v12 bottomAnchor];
      v14 = [v11 constraintEqualToAnchor:v13];
      v42[3] = v14;
      id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
      [v34 activateConstraints:v15];

      if ([(WFCompactPlatterView *)self insetsContent])
      {
        v16 = [(WFCompactPlatterView *)self insetContentBackgroundView];

        if (!v16)
        {
          id v17 = objc_alloc(MEMORY[0x263F82E00]);
          v18 = [(WFCompactPlatterView *)self clippingAutoLayoutContainerView];
          [v18 bounds];
          v19 = objc_msgSend(v17, "initWithFrame:");

          [v19 setAutoresizingMask:18];
          v20 = [v19 layer];
          v21 = [MEMORY[0x263F825C8] whiteColor];
          id v22 = [v21 colorWithAlphaComponent:0.12];
          objc_msgSend(v20, "setBackgroundColor:", objc_msgSend(v22, "CGColor"));

          v23 = [v19 layer];
          [v23 setCompositingFilter:*MEMORY[0x263F15D58]];

          v24 = [(WFCompactPlatterView *)self clippingContentView];
          [v24 insertSubview:v19 atIndex:0];

          v25 = [(WFCompactPlatterView *)self clippingContentView];
          v26 = [v25 layer];
          [v26 setAllowsGroupBlending:0];

          [(WFCompactPlatterView *)self setInsetContentBackgroundView:v19];
        }
      }
    }
    BOOL v27 = [(WFCompactPlatterView *)self insetsContent];
    v28 = [(WFCompactPlatterView *)self clippingContentView];
    v29 = [v28 layer];
    v30 = v29;
    double v31 = 0.0;
    if (v27) {
      double v31 = 27.0;
    }
    [v29 setCornerRadius:v31];

    [(WFCompactPlatterView *)self updateContentViewSeparatorVisibility];
    [(WFCompactPlatterView *)self setNeedsLayoutAndSizeInvalidation];
  }
}

- (void)_labelContentChanged
{
  BOOL v3 = [(WFCompactPlatterView *)self primaryText];
  BOOL v4 = [v3 length] == 0;
  int v5 = [(WFCompactPlatterView *)self primaryLabel];
  [v5 setHidden:v4];

  id v6 = [(WFCompactPlatterView *)self secondaryText];
  BOOL v7 = [v6 length] == 0;
  int v8 = [(WFCompactPlatterView *)self secondaryLabel];
  [v8 setHidden:v7];

  [(WFCompactPlatterView *)self updateContentViewSeparatorVisibility];
  [(WFCompactPlatterView *)self setNeedsLayoutAndSizeInvalidation];
}

- (void)setSecondaryTextFontStyle:(id)a3
{
  int v8 = (NSString *)a3;
  if (self->_secondaryTextFontStyle != v8)
  {
    objc_storeStrong((id *)&self->_secondaryTextFontStyle, a3);
    int v5 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v8];
    id v6 = [MEMORY[0x263F81708] fontWithDescriptor:v5 size:0.0];
    BOOL v7 = [(WFCompactPlatterView *)self secondaryLabel];
    [v7 setFont:v6];

    [(WFCompactPlatterView *)self _labelContentChanged];
  }
}

- (void)setSecondaryTextAlignment:(int64_t)a3
{
  if (self->_secondaryTextAlignment != a3)
  {
    self->_secondaryTextAlignment = a3;
    int64_t v4 = [(WFCompactPlatterView *)self secondaryTextAlignment];
    int v5 = [(WFCompactPlatterView *)self secondaryLabel];
    [v5 setTextAlignment:v4];

    [(WFCompactPlatterView *)self _labelContentChanged];
  }
}

- (void)setSecondaryText:(id)a3
{
  int64_t v4 = (NSString *)a3;
  secondaryText = self->_secondaryText;
  if (secondaryText != v4)
  {
    v10 = v4;
    BOOL v6 = [(NSString *)secondaryText isEqualToString:v4];
    int64_t v4 = v10;
    if (!v6)
    {
      BOOL v7 = (NSString *)[(NSString *)v10 copy];
      int v8 = self->_secondaryText;
      self->_secondaryText = v7;

      v9 = [(WFCompactPlatterView *)self secondaryLabel];
      [v9 setText:v10];

      [(WFCompactPlatterView *)self _labelContentChanged];
      int64_t v4 = v10;
    }
  }
}

- (void)setPrimaryTextAlignment:(int64_t)a3
{
  if (self->_primaryTextAlignment != a3)
  {
    self->_primaryTextAlignment = a3;
    int64_t v4 = [(WFCompactPlatterView *)self primaryTextAlignment];
    int v5 = [(WFCompactPlatterView *)self primaryLabel];
    [v5 setTextAlignment:v4];

    [(WFCompactPlatterView *)self _labelContentChanged];
  }
}

- (void)setPrimaryText:(id)a3
{
  int64_t v4 = (NSString *)a3;
  primaryText = self->_primaryText;
  if (primaryText != v4)
  {
    v10 = v4;
    BOOL v6 = [(NSString *)primaryText isEqualToString:v4];
    int64_t v4 = v10;
    if (!v6)
    {
      BOOL v7 = (NSString *)[(NSString *)v10 copy];
      int v8 = self->_primaryText;
      self->_primaryText = v7;

      v9 = [(WFCompactPlatterView *)self primaryLabel];
      [v9 setText:v10];

      [(WFCompactPlatterView *)self _labelContentChanged];
      int64_t v4 = v10;
    }
  }
}

- (void)setAttribution:(id)a3
{
  id v14 = a3;
  objc_storeStrong((id *)&self->_attribution, a3);
  int v5 = [v14 icon];
  BOOL v6 = [(WFCompactPlatterView *)self platterView];
  [v6 setIcon:v5];

  BOOL v7 = [v14 title];
  int v8 = [(WFCompactPlatterView *)self platterView];
  [v8 setTitle:v7];

  v9 = [v14 appBundleIdentifier];
  LODWORD(v8) = [v9 isEqualToString:*MEMORY[0x263F85550]];

  if (v8)
  {
    uint64_t v10 = [MEMORY[0x263F825C8] colorWithRed:0.941176474 green:0.701960802 blue:0.0 alpha:1.0];
  }
  else
  {
    v11 = [v14 appBundleIdentifier];
    int v12 = [v11 isEqualToString:*MEMORY[0x263F85530]];

    if (v12) {
      [MEMORY[0x263F825C8] systemOrangeColor];
    }
    else {
    uint64_t v10 = [MEMORY[0x263F825C8] tintColor];
    }
  }
  v13 = (void *)v10;
  [(WFCompactPlatterView *)self setTintColor:v10];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFCompactPlatterView;
  [(WFCompactPlatterView *)&v18 traitCollectionDidChange:v4];
  int v5 = [v4 preferredContentSizeCategory];
  BOOL v6 = [(WFCompactPlatterView *)self traitCollection];
  uint64_t v7 = [v6 preferredContentSizeCategory];
  if (v5 == (void *)v7)
  {
  }
  else
  {
    int v8 = (void *)v7;
    v9 = [v4 preferredContentSizeCategory];
    uint64_t v10 = [(WFCompactPlatterView *)self traitCollection];
    v11 = [v10 preferredContentSizeCategory];
    char v12 = [v9 isEqualToString:v11];

    if ((v12 & 1) == 0) {
      [(WFCompactPlatterView *)self setNeedsLayoutAndSizeInvalidation];
    }
  }
  [v4 displayScale];
  double v14 = v13;
  id v15 = [(WFCompactPlatterView *)self traitCollection];
  [v15 displayScale];
  double v17 = v16;

  if (v14 != v17) {
    [(WFCompactPlatterView *)self setNeedsLayoutAndSizeInvalidation];
  }
}

- (void)layoutContentInsideClippingView
{
  id v14 = [(WFCompactPlatterView *)self clippingContentView];
  BOOL v3 = [(WFCompactPlatterView *)self clippingAutoLayoutContainerView];
  if ([(WFCompactPlatterView *)self isClippingContent]
    && ([(WFCompactPlatterView *)self contentClippingDelegate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    [(WFCompactPlatterView *)self contentVerticalOffsetWhenClipped];
    double v8 = v11;
    [v14 bounds];
    double v10 = v12;
    [(WFCompactPlatterView *)self contentHeightWhenClipped];
    double v6 = v13;
    double v5 = 0.0;
  }
  else
  {
    [v14 bounds];
    double v8 = v7;
    double v10 = v9;
  }
  objc_msgSend(v3, "setFrame:", v5, v8, v10, v6);
}

- (void)layoutCustomContentViewForPlatterView:(id)a3
{
  id v55 = a3;
  id v4 = [v55 customContentView];
  [v4 bounds];
  double width = v5;
  double v8 = v7;

  [(WFCompactPlatterView *)self labelInsets];
  double v10 = v9;
  double v12 = v11;
  double v54 = v13;
  double v15 = v14;
  [(WFCompactPlatterView *)self separatorInsets];
  double v56 = v16;
  double v18 = v17;
  v19 = [(WFCompactPlatterView *)self primaryLabel];
  v20 = [(WFCompactPlatterView *)self secondaryLabel];
  v21 = [v19 text];
  uint64_t v22 = [v21 length];

  v23 = [v20 text];
  uint64_t v24 = [v23 length];

  if (v22 | v24) {
    double y = v10 + 0.0;
  }
  else {
    double y = 0.0;
  }
  if (v22)
  {
    objc_msgSend(v19, "sizeThatFits:", width - v12 - v15, v8 - y);
    double v27 = v26;
    objc_msgSend(v19, "setFrame:", v12, y, width - v12 - v15, v26);
    if (v24) {
      double y = y + v27 + 3.0;
    }
    else {
      double y = y + v27;
    }
  }
  if (v24)
  {
    objc_msgSend(v20, "sizeThatFits:", width - v12 - v15, v8 - y);
    double v29 = v28;
    objc_msgSend(v20, "setFrame:", v12, y, width - v12 - v15, v28);
    double y = y + v29 + 3.0;
  }
  if (v22 | v24)
  {
    v30 = [(WFCompactPlatterView *)self contentView];

    double v31 = -0.0;
    if (v30) {
      double v31 = v54;
    }
    double y = y + v31;
  }
  double v32 = width - (v56 + v18);
  v33 = [(WFCompactPlatterView *)self contentViewSeparatorView];
  if (([v33 isHidden] & 1) == 0)
  {
    [(WFCompactPlatterView *)self separatorHeight];
    double v35 = v34;
    objc_msgSend(v33, "setFrame:", v56, y, v32, v34);
    double y = y + v35;
  }
  v36 = [(WFCompactPlatterView *)self footerView];
  [(WFCompactPlatterView *)self footerViewHeight];
  double v38 = v37;
  [(WFCompactPlatterView *)self separatorHeight];
  double v40 = v39;
  BOOL v41 = [(WFCompactPlatterView *)self footerViewHidden];
  v42 = [(WFCompactPlatterView *)self actionGroupView];
  v44 = v42;
  if (v42)
  {
    double v45 = v38 + v40;
    if (v41) {
      double v45 = 0.0;
    }
    LODWORD(v43) = 1112014848;
    objc_msgSend(v42, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, v8 - y - v45, COERCE_DOUBLE(1148846080), v43);
    double v47 = v46;
  }
  else
  {
    double v47 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  objc_msgSend(v44, "setFrame:", 0.0, v8 - v47, width, v47);
  v48 = [(WFCompactPlatterView *)self footerViewSeparatorView];
  objc_msgSend(v48, "setFrame:", 0.0, v8 - v47 - v38 - v40, width, v40);
  objc_msgSend(v36, "setFrame:", v56, v8 - v47 - v38, v32, v38);
  v49 = [(WFCompactPlatterView *)self clippingContentView];
  v50 = [(WFCompactPlatterView *)self contentView];
  if (v50)
  {
    [v49 setHidden:0];
    if (![(WFCompactPlatterView *)self suppressContentViewLayout])
    {
      double v51 = v38 + v40;
      double x = 0.0;
      if (v41) {
        double v51 = 0.0;
      }
      double v53 = v8 - y - v47 - v51;
      if ([(WFCompactPlatterView *)self insetsContent])
      {
        v58.origin.double x = 0.0;
        v58.origin.double y = y;
        v58.size.double width = width;
        v58.size.height = v53;
        CGRect v59 = CGRectInset(v58, 15.0, 0.0);
        double x = v59.origin.x;
        double y = v59.origin.y;
        double width = v59.size.width;
        double v53 = v59.size.height + -15.0;
      }
      objc_msgSend(v49, "setFrame:", x, y, width, v53);
      [(WFCompactPlatterView *)self layoutContentInsideClippingView];
    }
  }
  else
  {
    [v49 setHidden:1];
  }
}

- (void)setNeedsLayoutAndSizeInvalidation
{
  BOOL v3 = [(WFCompactPlatterView *)self platterView];
  [v3 setNeedsLayout];

  if (![(WFCompactPlatterView *)self hasScheduledSizeInvalidation])
  {
    [(WFCompactPlatterView *)self setHasScheduledSizeInvalidation:1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__WFCompactPlatterView_setNeedsLayoutAndSizeInvalidation__block_invoke;
    block[3] = &unk_2649CBF20;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __57__WFCompactPlatterView_setNeedsLayoutAndSizeInvalidation__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sizingDelegate];
  [v2 platterViewDidInvalidateSize:*(void *)(a1 + 32)];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setHasScheduledSizeInvalidation:0];
}

- (double)separatorHeight
{
  BOOL v3 = [(WFCompactPlatterView *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  double v5 = 1.0;
  if (!UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    double v6 = [(WFCompactPlatterView *)self traitCollection];
    [v6 displayScale];
    double v5 = 1.0 / v7;
  }
  return v5;
}

- (CGSize)staticContentSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(WFCompactPlatterView *)self labelInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(WFCompactPlatterView *)self primaryLabel];
  double v15 = [(WFCompactPlatterView *)self secondaryLabel];
  double v16 = [v14 text];
  uint64_t v17 = [v16 length];

  double v18 = [v15 text];
  uint64_t v19 = [v18 length];

  if (v17 | v19) {
    double v20 = v7 + 0.0;
  }
  else {
    double v20 = 0.0;
  }
  if (v17)
  {
    objc_msgSend(v14, "sizeThatFits:", width - v9 - v13, height - v20);
    double v22 = v20 + v21;
    double v23 = v20 + v21 + 3.0;
    if (v19) {
      double v20 = v23;
    }
    else {
      double v20 = v22;
    }
  }
  if (v19)
  {
    objc_msgSend(v15, "sizeThatFits:", width - v9 - v13, height - v20);
    double v20 = v20 + v24 + 3.0;
  }
  if (v17 | v19)
  {
    v25 = [(WFCompactPlatterView *)self contentView];

    double v26 = -0.0;
    if (v25) {
      double v26 = v11;
    }
    double v20 = v20 + v26;
  }
  if (![(WFCompactPlatterView *)self footerViewHidden])
  {
    [(WFCompactPlatterView *)self separatorHeight];
    double v28 = v20 + v27;
    [(WFCompactPlatterView *)self footerViewHeight];
    double v20 = v28 + v29;
  }
  if ([(WFCompactPlatterView *)self insetsContent]) {
    double v30 = v20 + 15.0;
  }
  else {
    double v30 = v20;
  }
  double v31 = [(WFCompactPlatterView *)self actionGroupView];
  double v32 = v31;
  if (v31)
  {
    [v31 layoutIfNeeded];
    LODWORD(v33) = 1148846080;
    LODWORD(v34) = 1112014848;
    objc_msgSend(v32, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height - v30, v33, v34);
    double v30 = v30 + v35;
  }

  double v36 = width;
  double v37 = v30;
  result.double height = v37;
  result.double width = v36;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(WFCompactPlatterView *)self platterView];
  objc_msgSend(v6, "sizeThatFitsContentWithSize:", width, 0.0);
  double v8 = v7;

  -[WFCompactPlatterView staticContentSizeForSize:](self, "staticContentSizeForSize:", width, fmax(height - v8, 0.0));
  double v10 = v8 + v9;
  double v11 = width;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (void)applyMaterialViewStyling
{
  BOOL v3 = [(WFCompactPlatterView *)self platterView];
  [v3 setMaterialRecipe:53];

  id v4 = [(WFCompactPlatterView *)self platterView];
  UIRoundToViewScale();
  double v6 = v5;
  double v7 = [(WFCompactPlatterView *)self platterView];
  [v7 _setContinuousCornerRadius:v6];

  id v8 = [(WFCompactPlatterView *)self platterView];
  [v8 setHasShadow:1];
}

- (WFCompactPlatterView)initWithFrame:(CGRect)a3
{
  v47.receiver = self;
  v47.super_class = (Class)WFCompactPlatterView;
  BOOL v3 = -[WFCompactPlatterView initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v3->_footerViewHidden = 1;
    v3->_sashVisible = 0;
    v3->_insetsContent = 0;
    v3->_suppressContentViewLayout = 0;
    [(WFCompactPlatterView *)v3 setAccessibilityIdentifier:@"junior_platter_view"];
    double v5 = [(WFCompactPlatterView *)v4 layer];
    [v5 setAllowsGroupOpacity:0];

    double v6 = [WFBackdropView alloc];
    [(WFCompactPlatterView *)v4 bounds];
    double v7 = -[WFBackdropView initWithFrame:](v6, "initWithFrame:");
    [(WFBackdropView *)v7 setAutoresizingMask:18];
    [(WFCompactPlatterView *)v4 addSubview:v7];
    double v46 = v7;
    objc_storeWeak((id *)&v4->_backdropView, v7);
    id v8 = [WFCompactTitledPlatterView alloc];
    [(WFCompactPlatterView *)v4 bounds];
    double v9 = -[PLPlatterView initWithFrame:](v8, "initWithFrame:");
    [(WFCompactTitledPlatterView *)v9 setDelegate:v4];
    [(WFCompactTitledPlatterView *)v9 setAutoresizingMask:18];
    [(WFCompactPlatterView *)v4 addSubview:v9];
    objc_storeWeak((id *)&v4->_platterView, v9);
    v44 = v9;
    double v10 = [(PLPlatterView *)v9 customContentView];
    id v11 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v11 setNumberOfLines:0];
    [v11 setAdjustsFontForContentSizeCategory:1];
    [v10 addSubview:v11];
    objc_storeWeak((id *)&v4->_primaryLabel, v11);
    id v12 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v12 setNumberOfLines:0];
    [v12 setAdjustsFontForContentSizeCategory:1];
    [v10 addSubview:v12];
    objc_storeWeak((id *)&v4->_secondaryLabel, v12);
    double v13 = (void *)MEMORY[0x263F81720];
    int v14 = [MEMORY[0x263EFFA40] universalPreviewsEnabled];
    double v15 = (void *)MEMORY[0x263F83628];
    if (!v14) {
      double v15 = (void *)MEMORY[0x263F83570];
    }
    double v16 = [v13 preferredFontDescriptorWithTextStyle:*v15];
    uint64_t v17 = [MEMORY[0x263F81708] fontWithDescriptor:v16 size:0.0];
    [v12 setFont:v17];

    if (([MEMORY[0x263EFFA40] universalPreviewsEnabled] & 1) == 0)
    {
      uint64_t v18 = [v16 fontDescriptorWithSymbolicTraits:2];

      double v16 = (void *)v18;
    }
    uint64_t v19 = [MEMORY[0x263F81708] fontWithDescriptor:v16 size:0.0];
    [v11 setFont:v19];

    double v45 = [MEMORY[0x263F824D8] effectWithStyle:1200];
    double v20 = [MEMORY[0x263F82DF0] effectForBlurEffect:v45 style:4];
    double v21 = (UIView *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v20];
    double v22 = [MEMORY[0x263F825C8] blackColor];
    double v23 = [v22 colorWithAlphaComponent:0.6];
    double v24 = [(UIView *)v21 contentView];
    [v24 setBackgroundColor:v23];

    [v10 addSubview:v21];
    contentViewSeparatorView = v4->_contentViewSeparatorView;
    v4->_contentViewSeparatorView = v21;
    double v43 = v21;

    [(WFCompactPlatterView *)v4 updateContentViewSeparatorVisibility];
    double v26 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    [(UIView *)v26 setHidden:[(WFCompactPlatterView *)v4 footerViewHidden]];
    [v10 addSubview:v26];
    footerView = v4->_footerView;
    v4->_footerView = v26;
    v42 = v26;

    double v28 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v20];
    double v29 = [MEMORY[0x263F825C8] blackColor];
    double v30 = [v29 colorWithAlphaComponent:0.6];
    double v31 = [v28 contentView];
    [v31 setBackgroundColor:v30];

    objc_msgSend(v28, "setHidden:", -[WFCompactPlatterView footerViewHidden](v4, "footerViewHidden"));
    [v10 addSubview:v28];
    objc_storeWeak((id *)&v4->_footerViewSeparatorView, v28);
    double v32 = objc_opt_new();
    [v32 setClipsToBounds:1];
    [v10 addSubview:v32];
    objc_storeWeak((id *)&v4->_clippingContentView, v32);
    double v33 = objc_opt_new();
    [v32 addSubview:v33];
    objc_storeWeak((id *)&v4->_clippingAutoLayoutContainerView, v33);
    long long v34 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    *(_OWORD *)&v4->_separatorInsets.double top = *MEMORY[0x263F834E8];
    *(_OWORD *)&v4->_separatorInsets.double bottom = v34;
    int v35 = [MEMORY[0x263EFFA40] universalPreviewsEnabled];

    double v36 = 5.0;
    if (v35) {
      double v36 = 6.0;
    }
    double v37 = 27.0;
    if (!v35) {
      double v37 = 22.0;
    }
    double v38 = 13.0;
    if (v35) {
      double v38 = 14.0;
    }
    v4->_labelInsets.double top = v36;
    v4->_labelInsets.double left = v37;
    if (v35) {
      double v39 = 25.0;
    }
    else {
      double v39 = 22.0;
    }
    v4->_labelInsets.double bottom = v38;
    v4->_labelInsets.double right = v39;
    double v40 = v4;
  }
  return v4;
}

@end