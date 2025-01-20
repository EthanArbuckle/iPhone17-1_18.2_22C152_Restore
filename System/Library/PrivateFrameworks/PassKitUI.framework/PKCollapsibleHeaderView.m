@interface PKCollapsibleHeaderView
- ($3CC2805F0189FCCE51047C0D2B5A52A9)_layoutWithBounds:(SEL)a3 isTemplateLayout:(CGRect)a4;
- ($3CC2805F0189FCCE51047C0D2B5A52A9)heightBoundsForWidth:(SEL)a3;
- (BOOL)removeAdditionalTopPadding;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)showCheckmark;
- (BOOL)showSearchBar;
- (BOOL)showSpinner;
- (BOOL)titleAccessoriesEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKCollapsibleHeaderView)initWithFrame:(CGRect)a3;
- (PKCollapsibleHeaderViewDelegate)delegate;
- (UIEdgeInsets)readableContentInsets;
- (UIFont)titleFont;
- (UIImage)image;
- (UIView)topArtView;
- (double)_maxTitleWidthInsideFrameWidth:(double)a3 reserveSpace:(BOOL)a4;
- (double)_titleTopPadding;
- (double)_topArtTopPadding;
- (double)additionalBottomPadding;
- (double)additionalCollapsibleHeight;
- (double)additionalTopPadding;
- (double)maxHeight;
- (double)minHeight;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_contentSizeCategoryDidChange;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_setLabelFonts;
- (void)_updateCheckmarkColor;
- (void)layoutSubviews;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)setAdditionalBottomPadding:(double)a3;
- (void)setAdditionalCollapsibleHeight:(double)a3;
- (void)setAdditionalTopPadding:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3;
- (void)setReadableContentInsets:(UIEdgeInsets)a3;
- (void)setRemoveAdditionalTopPadding:(BOOL)a3;
- (void)setSearchBarDefaultText:(id)a3;
- (void)setShowCheckmark:(BOOL)a3;
- (void)setShowSearchBar:(BOOL)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)setTitle:(id)a3 subtitle:(id)a4;
- (void)setTitleAccessoriesEnabled:(BOOL)a3;
- (void)setTitleFont:(id)a3;
- (void)setTopArtView:(id)a3;
- (void)showCheckmark:(BOOL)a3 animated:(BOOL)a4;
- (void)updateTitleLabelText;
@end

@implementation PKCollapsibleHeaderView

- (PKCollapsibleHeaderView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PKCollapsibleHeaderView;
  v3 = -[PKCollapsibleHeaderView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&v3->_readableContentInsets.top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&v3->_readableContentInsets.bottom = v5;
    v6 = objc_alloc_init(PKTrailingAccessoryLabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    [(PKTrailingAccessoryLabel *)v4->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [(PKCollapsibleHeaderView *)v4 addSubview:v4->_titleLabel];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v8;

    [(UILabel *)v4->_subtitleLabel setTextAlignment:1];
    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v4->_subtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [(PKCollapsibleHeaderView *)v4 addSubview:v4->_subtitleLabel];
    [(PKCollapsibleHeaderView *)v4 _setLabelFonts];
    v10 = (UISearchBar *)objc_alloc_init(MEMORY[0x1E4FB1BF0]);
    searchBar = v4->_searchBar;
    v4->_searchBar = v10;

    [(UISearchBar *)v4->_searchBar setAutocorrectionType:1];
    [(UISearchBar *)v4->_searchBar setDelegate:v4];
    [(UISearchBar *)v4->_searchBar setReturnKeyType:6];
    [(UISearchBar *)v4->_searchBar setEnablesReturnKeyAutomatically:1];
    [(UISearchBar *)v4->_searchBar setSearchBarStyle:2];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    activityIndicator = v4->_activityIndicator;
    v4->_activityIndicator = (UIActivityIndicatorView *)v12;

    [(UIActivityIndicatorView *)v4->_activityIndicator setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)v4->_activityIndicator sizeToFit];
    [(UIActivityIndicatorView *)v4->_activityIndicator setHidden:1];
    v14 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E4F72FB8]);
    checkmarkLayer = v4->_checkmarkLayer;
    v4->_checkmarkLayer = v14;

    [(LAUICheckmarkLayer *)v4->_checkmarkLayer setLineWidthScale:1.4];
    [(LAUICheckmarkLayer *)v4->_checkmarkLayer setRevealed:0 animated:0];
    v16 = v4->_checkmarkLayer;
    v17 = PKLayerNullActions();
    [(LAUICheckmarkLayer *)v16 setActions:v17];

    [(PKCollapsibleHeaderView *)v4 _updateCheckmarkColor];
    [(PKCollapsibleHeaderView *)v4 setTitleAccessoriesEnabled:1];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v4 selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4FB27A8] object:0];

    [(PKCollapsibleHeaderView *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F855D8]];
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(UISearchBar *)self->_searchBar frame];
  v12.double x = x;
  v12.double y = y;
  if (CGRectContainsPoint(v13, v12))
  {
    searchBar = self->_searchBar;
    -[PKCollapsibleHeaderView convertPoint:toView:](self, "convertPoint:toView:", searchBar, x, y);
    v9 = -[UISearchBar hitTest:withEvent:](searchBar, "hitTest:withEvent:", v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKCollapsibleHeaderView;
  [(PKCollapsibleHeaderView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKCollapsibleHeaderView *)self _updateCheckmarkColor];
}

- (void)_updateCheckmarkColor
{
  objc_super v3 = [(PKCollapsibleHeaderView *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__PKCollapsibleHeaderView__updateCheckmarkColor__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);
}

void __48__PKCollapsibleHeaderView__updateCheckmarkColor__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[56];
  id v3 = [v1 tintColor];
  objc_msgSend(v2, "setColor:animated:", objc_msgSend(v3, "CGColor"), 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[PKCollapsibleHeaderView heightBoundsForWidth:](self, "heightBoundsForWidth:", a3.width, a3.height, 0, 0, 0, 0);
  double v4 = 0.0;
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKCollapsibleHeaderView;
  [(PKCollapsibleHeaderView *)&v3 layoutSubviews];
  [(PKCollapsibleHeaderView *)self bounds];
  -[PKCollapsibleHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- ($3CC2805F0189FCCE51047C0D2B5A52A9)_layoutWithBounds:(SEL)a3 isTemplateLayout:(CGRect)a4
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double x = a4.origin.x;
  p_readableContentInsets = &self->_readableContentInsets;
  double left = self->_readableContentInsets.left;
  double right = self->_readableContentInsets.right;
  CGFloat MaxY = 0.0;
  if (!a5)
  {
    -[PKCollapsibleHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, 0.0, 0.0, a4.size.width, 1.79769313e308);
    a4.origin.double x = v53;
    CGFloat MaxY = height - v53;
  }
  double v51 = right;
  double v52 = height;
  double v15 = width - (left + right);
  if (self->_topArtView)
  {
    double v50 = x;
    double v16 = left;
    [(PKCollapsibleHeaderView *)self _topArtTopPadding];
    double v18 = v17;
    double v20 = self->_imageSize.width;
    double v19 = self->_imageSize.height;
    if (v20 == *MEMORY[0x1E4F1DB30] && v19 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      -[UIView sizeThatFits:](self->_topArtView, "sizeThatFits:", v15, 1.79769313e308);
      double v20 = v22;
      double v19 = v23;
    }
    double v24 = MaxY + v18;
    PKFloatRoundToPixel();
    CGFloat v26 = v25;
    if (!v5) {
      -[UIView setFrame:](self->_topArtView, "setFrame:", v25, v24, v20, v19);
    }
    double v27 = fmin(v24, 0.0);
    v54.origin.double x = v26;
    v54.origin.double y = v24;
    v54.size.double width = v20;
    v54.size.double height = v19;
    CGFloat MaxY = CGRectGetMaxY(v54);
    double left = v16;
    double x = v50;
  }
  else
  {
    double v27 = 0.0;
  }
  if (self->_titleText || self->_showSpinner || self->_showCheckmark)
  {
    [(PKCollapsibleHeaderView *)self _titleTopPadding];
    double v29 = MaxY + v28;
    -[PKTrailingAccessoryLabel setContentInsets:](self->_titleLabel, "setContentInsets:", p_readableContentInsets->top, p_readableContentInsets->left, p_readableContentInsets->bottom, p_readableContentInsets->right);
    -[PKTrailingAccessoryLabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, 1.79769313e308);
    double v32 = v31;
    if (!v5) {
      -[PKTrailingAccessoryLabel setFrame:](self->_titleLabel, "setFrame:", x, v29, v30, v31);
    }
    double v27 = fmin(v27, v29);
    CGFloat MaxY = v29 + v32;
  }
  else
  {
    -[PKTrailingAccessoryLabel setContentInsets:](self->_titleLabel, "setContentInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    if (!v5) {
      -[PKTrailingAccessoryLabel setFrame:](self->_titleLabel, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
  }
  v33 = [(UILabel *)self->_subtitleLabel text];
  uint64_t v34 = [v33 length];

  if (v34)
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v15, 1.79769313e308);
    double v37 = v36;
    double v39 = v38;
    PKFloatRoundToPixel();
    CGFloat v41 = v40;
    if (!v5) {
      -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v40, MaxY + 15.0, v37, v39);
    }
    double v27 = fmin(v27, MaxY + 15.0);
    v55.origin.double x = v41;
    v55.origin.double y = MaxY + 15.0;
    v55.size.double width = v37;
    v55.size.double height = v39;
    double v42 = CGRectGetMaxY(v55);
    double v43 = 10.0;
    if (!self->_showSearchBar) {
      double v43 = 15.0;
    }
    double v44 = v42 + v43;
    if (self->_showSearchBar) {
      goto LABEL_26;
    }
LABEL_35:
    double v48 = 0.0;
    goto LABEL_36;
  }
  if (self->_showSearchBar) {
    double v44 = MaxY;
  }
  else {
    double v44 = MaxY + 15.0;
  }
  if (!self->_showSearchBar) {
    goto LABEL_35;
  }
LABEL_26:
  double v45 = v44;
  if (!v5) {
    double v45 = fmax(v44, self->_additionalCollapsibleHeight);
  }
  CGSize result = ($3CC2805F0189FCCE51047C0D2B5A52A9 *)-[UISearchBar sizeThatFits:](self->_searchBar, "sizeThatFits:", width, v52);
  double v47 = v46;
  if (!v5)
  {
    -[UISearchBar setFrame:](self->_searchBar, "setFrame:", 0.0, v45, width, v46);
    CGSize result = ($3CC2805F0189FCCE51047C0D2B5A52A9 *)-[UISearchBar setContentInset:](self->_searchBar, "setContentInset:", 0.0, left, 0.0, v51);
  }
  double v27 = fmin(v27, v44);
  double v44 = v44 + v47 + 10.0;
  double v48 = fmax(v47 + 10.0 - self->_additionalCollapsibleHeight, 0.0);
LABEL_36:
  double v49 = v44 + self->_additionalBottomPadding;
  retstr->var0 = v48;
  retstr->var1 = v27;
  retstr->var2 = MaxY;
  retstr->var3 = v49 - MaxY;
  retstr->var4 = v49;
  return result;
}

- ($3CC2805F0189FCCE51047C0D2B5A52A9)heightBoundsForWidth:(SEL)a3
{
  return -[PKCollapsibleHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, 0.0, 0.0, a4, 1.79769313e308);
}

- (void)_contentSizeCategoryDidChange
{
  [(PKCollapsibleHeaderView *)self _setLabelFonts];

  [(PKCollapsibleHeaderView *)self setNeedsLayout];
}

- (void)_setLabelFonts
{
  PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2928], (void *)*MEMORY[0x1E4FB2788], 2, 0);
  objc_super v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  titleFont = self->_titleFont;
  self->_titleFont = v3;

  [(PKCollapsibleHeaderView *)self updateTitleLabelText];
}

- (double)_titleTopPadding
{
  if (self->_topArtView || (double result = 0.0, !self->_removeAdditionalTopPadding))
  {
    uint64_t v3 = PKUIGetMinScreenWidthType();
    if (self->_topArtView)
    {
      double result = 15.0;
      if (!v3) {
        return 5.0;
      }
    }
    else
    {
      double v5 = 24.0;
      if (!v3) {
        double v5 = 10.0;
      }
      return v5 + self->_additionalTopPadding;
    }
  }
  return result;
}

- (double)_topArtTopPadding
{
  double result = 0.0;
  if (!self->_removeAdditionalTopPadding)
  {
    uint64_t v4 = PKUIGetMinScreenWidthType();
    double v5 = 10.0;
    if (!v4) {
      double v5 = 5.0;
    }
    return v5 + self->_additionalTopPadding;
  }
  return result;
}

- (double)_maxTitleWidthInsideFrameWidth:(double)a3 reserveSpace:(BOOL)a4
{
  double v5 = 0.0;
  if (a4)
  {
    -[UIActivityIndicatorView sizeThatFits:](self->_activityIndicator, "sizeThatFits:", a3, 1.79769313e308);
    double v5 = fmax(v6, 30.0) * 2.0 + 10.0;
  }
  return a3 - v5;
}

- (void)setTitleAccessoriesEnabled:(BOOL)a3
{
  if (((!self->_titleAccessoriesEnabled ^ a3) & 1) == 0)
  {
    self->_titleAccessoriesEnabled = a3;
    titleLabel = self->_titleLabel;
    if (a3)
    {
      checkmarkLayer = self->_checkmarkLayer;
      [(LAUICheckmarkLayer *)checkmarkLayer aspectSize];
      PKSizeScaleAspectFit();
      -[PKTrailingAccessoryLabel registerAccessoryWithLayer:withSize:for:](titleLabel, "registerAccessoryWithLayer:withSize:for:", checkmarkLayer, @"checkmark");
      double v6 = self->_titleLabel;
      activityIndicator = self->_activityIndicator;
      [(UIActivityIndicatorView *)activityIndicator intrinsicContentSize];
      -[PKTrailingAccessoryLabel registerAccessoryWithView:withSize:for:](v6, "registerAccessoryWithView:withSize:for:", activityIndicator, @"activityIndicator");
    }
    else
    {
      [(PKTrailingAccessoryLabel *)self->_titleLabel unregisterAccessories];
    }
    [(PKCollapsibleHeaderView *)self setNeedsLayout];
  }
}

- (void)setShowSpinner:(BOOL)a3
{
  if (((!self->_showSpinner ^ a3) & 1) == 0)
  {
    self->_showSpinner = a3;
    activityIndicator = self->_activityIndicator;
    if (a3)
    {
      [(UIActivityIndicatorView *)activityIndicator setHidden:0];
      double v5 = self->_activityIndicator;
      [(UIActivityIndicatorView *)v5 startAnimating];
    }
    else
    {
      [(UIActivityIndicatorView *)activityIndicator stopAnimating];
    }
  }
}

- (void)setShowCheckmark:(BOOL)a3
{
}

- (void)setShowSearchBar:(BOOL)a3
{
  if (((!self->_showSearchBar ^ a3) & 1) == 0)
  {
    self->_showSearchBar = a3;
    if (a3) {
      [(PKCollapsibleHeaderView *)self addSubview:self->_searchBar];
    }
    else {
      [(UISearchBar *)self->_searchBar removeFromSuperview];
    }
    [(PKCollapsibleHeaderView *)self setNeedsLayout];
  }
}

- (void)setAdditionalCollapsibleHeight:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (self->_additionalCollapsibleHeight != a3) {
    self->_additionalCollapsibleHeight = a3;
  }
}

- (void)showCheckmark:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_showCheckmark ^ a3) & 1) == 0)
  {
    self->_showCheckmark = a3;
    -[LAUICheckmarkLayer setRevealed:animated:](self->_checkmarkLayer, "setRevealed:animated:");
  }
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
  [(PKCollapsibleHeaderView *)self updateTitleLabelText];

  [(PKCollapsibleHeaderView *)self setNeedsLayout];
}

- (void)setTitle:(id)a3 subtitle:(id)a4
{
  objc_storeStrong((id *)&self->_titleText, a3);
  id v7 = a3;
  id v8 = a4;
  [(PKCollapsibleHeaderView *)self updateTitleLabelText];
  [(UILabel *)self->_subtitleLabel setText:v8];

  [(PKCollapsibleHeaderView *)self setNeedsLayout];
}

- (void)updateTitleLabelText
{
  v13[3] = *MEMORY[0x1E4F143B8];
  if (self->_titleText)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x1E4FB0848];
    uint64_t v4 = self->_titleFont;
    id v5 = objc_alloc_init(v3);
    [v5 setAlignment:1];
    [v5 setLineBreakMode:0];
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    titleText = self->_titleText;
    uint64_t v8 = *MEMORY[0x1E4FB06F8];
    v12[0] = *MEMORY[0x1E4FB0738];
    v12[1] = v8;
    v13[0] = v5;
    v13[1] = v4;
    v12[2] = *MEMORY[0x1E4FB0700];
    v9 = [MEMORY[0x1E4FB1618] labelColor];
    v13[2] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v11 = (void *)[v6 initWithString:titleText attributes:v10];
  }
  else
  {
    v11 = 0;
  }
  [(PKTrailingAccessoryLabel *)self->_titleLabel setAttributedText:v11];
}

- (void)setSearchBarDefaultText:(id)a3
{
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  self->_imageSize = (CGSize)*MEMORY[0x1E4F1DB30];
  id v8 = v4;
  if (v4)
  {
    [v4 size];
    self->_imageSize.double width = v5;
    self->_imageSize.double height = v6;
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [v7 setContentMode:1];
    [v7 setImage:v8];
    [(PKCollapsibleHeaderView *)self addSubview:v7];
    [(PKCollapsibleHeaderView *)self setTopArtView:v7];
  }
  else
  {
    [(PKCollapsibleHeaderView *)self setTopArtView:0];
  }
}

- (void)setTopArtView:(id)a3
{
  id v5 = a3;
  [(UIView *)self->_topArtView removeFromSuperview];
  objc_storeStrong((id *)&self->_topArtView, a3);
  if (self->_topArtView) {
    -[PKCollapsibleHeaderView addSubview:](self, "addSubview:");
  }
  [(PKCollapsibleHeaderView *)self setNeedsLayout];
}

- (UIImage)image
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [(UIView *)self->_topArtView image];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (UIImage *)v3;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v8 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 searchTextDidChangeTo:v8];
  }
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  [a3 setShowsCancelButton:1];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 searchBarTextDidBeginEditing];
  }
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  [v4 resignFirstResponder];
  [v4 setShowsCancelButton:0];

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 searchBarTextDidEndEditing];
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  [v4 setText:0];
  [v4 resignFirstResponder];

  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 searchBarCancelButtonClicked];
  }
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return 1;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIView)topArtView
{
  return self->_topArtView;
}

- (BOOL)removeAdditionalTopPadding
{
  return self->_removeAdditionalTopPadding;
}

- (void)setRemoveAdditionalTopPadding:(BOOL)a3
{
  self->_removeAdditionalTopPadding = a3;
}

- (double)additionalTopPadding
{
  return self->_additionalTopPadding;
}

- (void)setAdditionalTopPadding:(double)a3
{
  self->_additionalTopPadding = a3;
}

- (double)additionalBottomPadding
{
  return self->_additionalBottomPadding;
}

- (void)setAdditionalBottomPadding:(double)a3
{
  self->_additionalBottomPadding = a3;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (double)minHeight
{
  return self->_minHeight;
}

- (double)additionalCollapsibleHeight
{
  return self->_additionalCollapsibleHeight;
}

- (BOOL)titleAccessoriesEnabled
{
  return self->_titleAccessoriesEnabled;
}

- (BOOL)showSearchBar
{
  return self->_showSearchBar;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (BOOL)showCheckmark
{
  return self->_showCheckmark;
}

- (UIEdgeInsets)readableContentInsets
{
  double top = self->_readableContentInsets.top;
  double left = self->_readableContentInsets.left;
  double bottom = self->_readableContentInsets.bottom;
  double right = self->_readableContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setReadableContentInsets:(UIEdgeInsets)a3
{
  self->_readableContentInsets = a3;
}

- (PKCollapsibleHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKCollapsibleHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topArtView, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleText, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end