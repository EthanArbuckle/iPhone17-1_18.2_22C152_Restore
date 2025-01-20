@interface SFURLFieldOverlayView
- (SFURLFieldOverlayConfiguration)configuration;
- (SFURLFieldOverlayView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (double)_buttonCornerRadius;
- (id)_configurationForButtonItem:(id)a3 inOverlayConfiguration:(id)a4;
- (void)_animateWithDelay:(double)a3 isPresenting:(BOOL)a4 group:(id)a5 animations:(id)a6;
- (void)_layOutClippingView;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setIsShowing:(BOOL)a3 completion:(id)a4;
- (void)_updateText;
- (void)dismissAndRemove;
- (void)layoutSubviews;
- (void)present;
- (void)setConfiguration:(id)a3;
@end

@implementation SFURLFieldOverlayView

- (SFURLFieldOverlayView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v56[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v55.receiver = self;
  v55.super_class = (Class)SFURLFieldOverlayView;
  v10 = -[SFURLFieldOverlayView initWithFrame:](&v55, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x1E4FB2950];
    id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(SFURLFieldOverlayView *)v10 bounds];
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:");
    backgroundView = v10->_backgroundView;
    v10->_backgroundView = (UIView *)v13;

    buttons = v10->_buttons;
    v10->_buttons = (NSArray *)MEMORY[0x1E4F1CBF0];

    id v16 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(SFURLFieldOverlayView *)v10 bounds];
    uint64_t v17 = objc_msgSend(v16, "initWithFrame:");
    clippingView = v10->_clippingView;
    v10->_clippingView = (UIView *)v17;

    v19 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIView *)v10->_clippingView setBackgroundColor:v19];

    v20 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconView = v10->_iconView;
    v10->_iconView = v20;

    [(UIImageView *)v10->_iconView setContentMode:4];
    uint64_t v22 = *MEMORY[0x1E4FB27D0];
    [(UIImageView *)v10->_iconView setMaximumContentSizeCategory:*MEMORY[0x1E4FB27D0]];
    v23 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v11];
    [(UIImageView *)v10->_iconView setPreferredSymbolConfiguration:v23];

    v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryTextLabel = v10->_secondaryTextLabel;
    v10->_secondaryTextLabel = v24;

    [(UILabel *)v10->_secondaryTextLabel setAdjustsFontForContentSizeCategory:1];
    v26 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v11];
    [(UILabel *)v10->_secondaryTextLabel setFont:v26];

    v27 = [(UILabel *)v10->_secondaryTextLabel font];
    [v27 pointSize];
    [(UILabel *)v10->_secondaryTextLabel setMinimumScaleFactor:11.0 / v28];

    [(UILabel *)v10->_secondaryTextLabel setMaximumContentSizeCategory:v22];
    LODWORD(v29) = 1132068864;
    [(UILabel *)v10->_secondaryTextLabel setContentCompressionResistancePriority:0 forAxis:v29];
    LODWORD(v30) = 1131937792;
    [(UILabel *)v10->_secondaryTextLabel setContentHuggingPriority:0 forAxis:v30];
    v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    textLabel = v10->_textLabel;
    v10->_textLabel = v31;

    [(UILabel *)v10->_textLabel setAdjustsFontForContentSizeCategory:1];
    v33 = [(UILabel *)v10->_secondaryTextLabel font];
    [v33 pointSize];
    [(UILabel *)v10->_textLabel setMinimumScaleFactor:11.0 / v34];

    [(UILabel *)v10->_textLabel setMaximumContentSizeCategory:v22];
    v35 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v11 weight:*MEMORY[0x1E4FB09D0]];
    [(UILabel *)v10->_textLabel setFont:v35];

    LODWORD(v36) = 1132068864;
    [(UILabel *)v10->_textLabel setContentCompressionResistancePriority:0 forAxis:v36];
    LODWORD(v37) = 1132003328;
    [(UILabel *)v10->_textLabel setContentHuggingPriority:0 forAxis:v37];
    id v38 = objc_alloc(MEMORY[0x1E4FB1C60]);
    [(SFURLFieldOverlayView *)v10 bounds];
    uint64_t v39 = objc_msgSend(v38, "initWithFrame:");
    stackView = v10->_stackView;
    v10->_stackView = (UIStackView *)v39;

    [(UIStackView *)v10->_stackView setSpacing:5.0];
    [(SFURLFieldOverlayView *)v10 addSubview:v10->_clippingView];
    [(UIView *)v10->_clippingView addSubview:v10->_backgroundView];
    [(UIView *)v10->_clippingView addSubview:v10->_stackView];
    [(UIStackView *)v10->_stackView addArrangedSubview:v10->_iconView];
    [(UIStackView *)v10->_stackView addArrangedSubview:v10->_textLabel];
    [(UIStackView *)v10->_stackView addArrangedSubview:v10->_secondaryTextLabel];
    [(UIStackView *)v10->_stackView setCustomSpacing:v10->_textLabel afterView:8.0];
    v41 = (void *)MEMORY[0x1E4FB1EB0];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __53__SFURLFieldOverlayView_initWithFrame_configuration___block_invoke;
    v53[3] = &unk_1E54E9858;
    v42 = v10;
    v54 = v42;
    [v41 performWithoutAnimation:v53];
    [(SFURLFieldOverlayView *)v42 setConfiguration:v9];
    v43 = (void *)MEMORY[0x1E4F28DC8];
    v44 = [(UIImageView *)v10->_iconView widthAnchor];
    v45 = [v44 constraintGreaterThanOrEqualToConstant:26.0];
    v56[0] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    [v43 activateConstraints:v46];

    v47 = (void *)MEMORY[0x1E4FB1EB0];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __53__SFURLFieldOverlayView_initWithFrame_configuration___block_invoke_2;
    v51[3] = &unk_1E54E9858;
    v48 = v42;
    v52 = v48;
    [v47 performWithoutAnimation:v51];
    v49 = v48;
  }
  return v10;
}

uint64_t __53__SFURLFieldOverlayView_initWithFrame_configuration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __53__SFURLFieldOverlayView_initWithFrame_configuration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setIsShowing:0 completion:0];
}

- (double)_buttonCornerRadius
{
  [(SFURLFieldOverlayView *)self _continuousCornerRadius];

  return _SFContinuousCornerRadiusMatchingRadiusWithInset(v2, 5.0);
}

- (void)_layOutClippingView
{
  [(SFURLFieldOverlayView *)self bounds];
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  if (!self->_isShowing)
  {
    CGFloat Height = CGRectGetHeight(*(CGRect *)&v3);
    CGFloat v7 = _SFFlipRectInCoordinateSpace(![(UIView *)self _sf_usesLeftToRightLayout], 0.0, 0.0, 0.0, Height, v7, v8, v9, v10);
    CGFloat v8 = v12;
    CGFloat v9 = v13;
    CGFloat v10 = v14;
  }
  clippingView = self->_clippingView;

  -[UIView setFrame:](clippingView, "setFrame:", v7, v8, v9, v10);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFURLFieldOverlayView;
  [(SFURLFieldOverlayView *)&v3 layoutSubviews];
  [(SFURLFieldOverlayView *)self _layOutClippingView];
  [(SFURLFieldOverlayView *)self bounds];
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  [(SFURLFieldOverlayView *)self bounds];
  CGRect v5 = CGRectInset(v4, 5.0, 5.0);
  -[UIStackView setFrame:](self->_stackView, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  [(SFURLFieldOverlayView *)self bounds];
  if (CGRectGetWidth(v6) != self->_lastLayoutWidth) {
    [(SFURLFieldOverlayView *)self _updateText];
  }
  [(SFURLFieldOverlayView *)self bounds];
  self->_lastLayoutWidth = CGRectGetWidth(v7);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(SFURLFieldOverlayView *)self _continuousCornerRadius];
  if (v5 != a3)
  {
    v20.receiver = self;
    v20.super_class = (Class)SFURLFieldOverlayView;
    [(SFURLFieldOverlayView *)&v20 _setContinuousCornerRadius:a3];
    [(UIView *)self->_clippingView _setContinuousCornerRadius:a3];
    [(UIView *)self->_backgroundView _setContinuousCornerRadius:a3];
    [(SFURLFieldOverlayView *)self _buttonCornerRadius];
    double v7 = v6;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    CGFloat v8 = self->_buttons;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          double v14 = objc_msgSend(v13, "configuration", (void)v16);
          v15 = [v14 background];
          [v15 setCornerRadius:v7];

          [v13 setConfiguration:v14];
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (id)_configurationForButtonItem:(id)a3 inOverlayConfiguration:(id)a4
{
  id v6 = a4;
  double v7 = (void *)MEMORY[0x1E4FB14D8];
  id v8 = a3;
  uint64_t v9 = [v7 borderedButtonConfiguration];
  [(SFURLFieldOverlayView *)self _buttonCornerRadius];
  double v11 = v10;
  double v12 = [v9 background];
  [v12 setCornerRadius:v11];

  [v9 setCornerStyle:-1];
  [v9 setImagePadding:4.0];
  uint64_t v13 = [v8 theme];

  if (v13 == 2)
  {
    long long v19 = [MEMORY[0x1E4FB1618] labelColor];
    objc_super v20 = [v19 colorWithAlphaComponent:0.08];
    [v9 setBaseBackgroundColor:v20];

    long long v17 = [v6 themeColor];
LABEL_7:
    [v9 setBaseForegroundColor:v17];
    goto LABEL_8;
  }
  if (v13 == 1)
  {
    uint64_t v22 = [v6 prominentButtonBackgroundColor];
    if (v22)
    {
      [v9 setBaseBackgroundColor:v22];
    }
    else
    {
      v23 = [MEMORY[0x1E4FB1618] labelColor];
      [v9 setBaseBackgroundColor:v23];
    }
    long long v17 = [v6 prominentButtonTextColor];
    if (v17)
    {
      [v9 setBaseForegroundColor:v17];
    }
    else
    {
      v24 = [v6 themeColor];
      [v9 setBaseForegroundColor:v24];
    }
    v21 = (uint64_t *)MEMORY[0x1E4FB09E0];
    goto LABEL_16;
  }
  uint64_t v14 = 0;
  if (v13) {
    goto LABEL_17;
  }
  v15 = objc_msgSend(MEMORY[0x1E4FB1618], "tertiaryLabelColor", 0.0);
  long long v16 = [v15 colorWithAlphaComponent:0.1];
  [v9 setBaseBackgroundColor:v16];

  long long v17 = [v6 primaryTextColor];
  if (v17) {
    goto LABEL_7;
  }
  long long v18 = [MEMORY[0x1E4FB1618] labelColor];
  [v9 setBaseForegroundColor:v18];

LABEL_8:
  v21 = (uint64_t *)MEMORY[0x1E4FB09D0];
LABEL_16:

  uint64_t v14 = *v21;
LABEL_17:
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__SFURLFieldOverlayView__configurationForButtonItem_inOverlayConfiguration___block_invoke;
  v26[3] = &__block_descriptor_40_e36___NSDictionary_16__0__NSDictionary_8l;
  v26[4] = v14;
  [v9 setTitleTextAttributesTransformer:v26];

  return v9;
}

id __76__SFURLFieldOverlayView__configurationForButtonItem_inOverlayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  double v2 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v3 = *MEMORY[0x1E4FB2950];
  double v4 = *(double *)(a1 + 32);
  id v5 = a2;
  id v6 = [v2 _preferredFontForTextStyle:v3 weight:v4];
  v11[0] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = objc_msgSend(v5, "safari_setValuesFromDictionary:", v7);

  return v8;
}

- (void)setConfiguration:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  id v6 = [v5 themeColor];
  [(UIView *)self->_backgroundView setBackgroundColor:v6];

  double v7 = [v5 icon];
  [(UIImageView *)self->_iconView setImage:v7];

  id v8 = [v5 icon];
  [(UIImageView *)self->_iconView setHidden:v8 == 0];

  uint64_t v9 = [v5 primaryTextColor];
  if (v9)
  {
    [(UIImageView *)self->_iconView setTintColor:v9];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIImageView *)self->_iconView setTintColor:v10];
  }
  -[SFURLFieldOverlayView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", [v5 userInterfaceStyle]);
  double v11 = [v5 secondaryTextColor];
  if (v11)
  {
    [(UILabel *)self->_secondaryTextLabel setTextColor:v11];
  }
  else
  {
    double v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)self->_secondaryTextLabel setTextColor:v12];
  }
  uint64_t v13 = [v5 primaryTextColor];
  if (v13)
  {
    [(UILabel *)self->_textLabel setTextColor:v13];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)self->_textLabel setTextColor:v14];
  }
  [(SFURLFieldOverlayView *)self _updateText];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = self->_buttons;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v16);
  }

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__10;
  v27[4] = __Block_byref_object_dispose__10;
  id v28 = 0;
  long long v19 = [v5 buttonItems];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __42__SFURLFieldOverlayView_setConfiguration___block_invoke;
  v24[3] = &unk_1E54EDBF8;
  v24[4] = self;
  id v20 = v5;
  id v25 = v20;
  v26 = v27;
  objc_msgSend(v19, "safari_mapObjectsUsingBlock:", v24);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  buttons = self->_buttons;
  self->_buttons = v21;

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __42__SFURLFieldOverlayView_setConfiguration___block_invoke_2;
  v23[3] = &unk_1E54E9858;
  v23[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v23];

  _Block_object_dispose(v27, 8);
}

id __42__SFURLFieldOverlayView_setConfiguration___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  id v6 = [v3 _configurationForButtonItem:v5 inOverlayConfiguration:v4];
  double v7 = (void *)MEMORY[0x1E4FB14D0];
  id v8 = [v5 action];
  uint64_t v9 = [v7 buttonWithConfiguration:v6 primaryAction:v8];

  [v9 setMaximumContentSizeCategory:*MEMORY[0x1E4FB27D0]];
  uint64_t v10 = [v5 theme];

  [v9 setUserInteractionEnabled:v10 != 2];
  if (*(void *)(*(void *)(a1[6] + 8) + 40)
    || ![(id)a1[5] placeFirstButtonInLeadingEdge])
  {
    [*(id *)(a1[4] + 472) addArrangedSubview:v9];
  }
  else
  {
    [*(id *)(a1[4] + 472) insertArrangedSubview:v9 atIndex:0];
  }
  double v11 = [*(id *)(*(void *)(a1[6] + 8) + 40) widthAnchor];
  double v12 = [v9 widthAnchor];
  uint64_t v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v9);

  return v9;
}

uint64_t __42__SFURLFieldOverlayView_setConfiguration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 472) layoutIfNeeded];
}

- (void)_updateText
{
  if ([(SFURLFieldOverlayConfiguration *)self->_configuration placeFirstButtonInLeadingEdge])
  {
    uint64_t v3 = [(SFURLFieldOverlayConfiguration *)self->_configuration text];
    configuration = self->_configuration;
    if (v3) {
      [(SFURLFieldOverlayConfiguration *)configuration text];
    }
    else {
    id v8 = [(SFURLFieldOverlayConfiguration *)configuration secondaryText];
    }
    [(UILabel *)self->_textLabel setText:v8];

    [(UILabel *)self->_textLabel setTextAlignment:1];
    [(UILabel *)self->_textLabel setAdjustsFontSizeToFitWidth:[(SFURLFieldOverlayConfiguration *)self->_configuration shouldTextShrinkToFit]];
    secondaryTextLabel = self->_secondaryTextLabel;
    [(UILabel *)secondaryTextLabel setHidden:1];
    return;
  }
  [(SFURLFieldOverlayView *)self bounds];
  double Width = CGRectGetWidth(v12);
  [(UILabel *)self->_secondaryTextLabel setHidden:Width <= 500.0];
  id v6 = [(SFURLFieldOverlayConfiguration *)self->_configuration secondaryText];
  [(UILabel *)self->_secondaryTextLabel setText:v6];

  [(UILabel *)self->_secondaryTextLabel setAdjustsFontSizeToFitWidth:[(SFURLFieldOverlayConfiguration *)self->_configuration shouldTextShrinkToFit]];
  [(UILabel *)self->_textLabel setTextAlignment:4];
  if (Width > 500.0)
  {
    [(UILabel *)self->_textLabel setAdjustsFontSizeToFitWidth:0];
    goto LABEL_8;
  }
  [(UILabel *)self->_textLabel setAdjustsFontSizeToFitWidth:[(SFURLFieldOverlayConfiguration *)self->_configuration shouldTextShrinkToFit]];
  if (![(SFURLFieldOverlayConfiguration *)self->_configuration prefersSecondaryText])
  {
LABEL_8:
    uint64_t v7 = [(SFURLFieldOverlayConfiguration *)self->_configuration text];
    goto LABEL_9;
  }
  uint64_t v7 = [(SFURLFieldOverlayConfiguration *)self->_configuration secondaryText];
LABEL_9:
  id v10 = (id)v7;
  [(UILabel *)self->_textLabel setText:v7];
}

- (void)_animateWithDelay:(double)a3 isPresenting:(BOOL)a4 group:(id)a5 animations:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  buttons = self->_buttons;
  id v12 = a6;
  uint64_t v13 = [(NSArray *)buttons count];
  if (!v7) {
    a3 = (double)(unint64_t)(v13 - 1) * 0.1 + 0.25 - a3;
  }
  dispatch_group_enter(v10);
  uint64_t v14 = (void *)MEMORY[0x1E4FB1EB0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__SFURLFieldOverlayView__animateWithDelay_isPresenting_group_animations___block_invoke;
  v16[3] = &unk_1E54E9998;
  uint64_t v17 = v10;
  v15 = v10;
  objc_msgSend(v14, "sf_animate:usingDefaultMotionWithDelay:options:animations:completion:", 1, 0, v12, v16, a3);
}

void __73__SFURLFieldOverlayView__animateWithDelay_isPresenting_group_animations___block_invoke(uint64_t a1)
{
}

- (void)dismissAndRemove
{
  if (self->_isShowing)
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __41__SFURLFieldOverlayView_dismissAndRemove__block_invoke;
    v3[3] = &unk_1E54EA1B8;
    objc_copyWeak(&v4, &location);
    [(SFURLFieldOverlayView *)self _setIsShowing:0 completion:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __41__SFURLFieldOverlayView_dismissAndRemove__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removeFromSuperview];
}

- (void)present
{
  if (!self->_isShowing) {
    [(SFURLFieldOverlayView *)self _setIsShowing:1 completion:0];
  }
}

- (void)_setIsShowing:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  self->_isShowing = v4;
  BOOL v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  id v8 = (void *)MEMORY[0x1E4FB1EB0];
  if (v4) {
    double v9 = 0.0;
  }
  else {
    double v9 = 0.41;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke;
  v23[3] = &unk_1E54EA208;
  v23[4] = self;
  BOOL v24 = v4;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_2;
  v21[3] = &unk_1E54E9998;
  id v10 = v7;
  uint64_t v22 = v10;
  [v8 animateWithDuration:0 delay:v23 options:v21 animations:0.15 completion:v9];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_3;
  v19[3] = &unk_1E54EA208;
  v19[4] = self;
  BOOL v20 = v4;
  [(SFURLFieldOverlayView *)self _animateWithDelay:v4 isPresenting:v10 group:v19 animations:0.0];
  buttons = self->_buttons;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_4;
  v16[3] = &unk_1E54EDC20;
  BOOL v18 = v4;
  void v16[4] = self;
  uint64_t v17 = v10;
  id v12 = v10;
  [(NSArray *)buttons enumerateObjectsUsingBlock:v16];
  ++self->_animationCount;
  [(UIView *)self->_clippingView setClipsToBounds:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_6;
  v14[3] = &unk_1E54E9D50;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], v14);
}

uint64_t __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) setAlpha:(double)*(unint64_t *)&a2];
}

void __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_2(uint64_t a1)
{
}

uint64_t __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _layOutClippingView];
  LOBYTE(v2) = *(unsigned char *)(a1 + 40);
  double v3 = (double)v2;
  [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:(double)v2];
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 480);

  return [v4 setAlpha:v3];
}

void __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  double v6 = (double)a3 * 0.1 + 0.25;
  uint64_t v7 = *(unsigned __int8 *)(a1 + 48);
  double v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_5;
  v11[3] = &unk_1E54EA208;
  id v12 = v5;
  char v13 = v7;
  id v10 = v5;
  [v9 _animateWithDelay:v7 isPresenting:v8 group:v11 animations:v6];
}

uint64_t __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_5(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) setAlpha:(double)*(unint64_t *)&a2];
  double v3 = 0.7;
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  CGAffineTransformMakeScale(&v7, v3, v3);
  BOOL v4 = *(void **)(a1 + 32);
  CGAffineTransform v6 = v7;
  return [v4 setTransform:&v6];
}

uint64_t __50__SFURLFieldOverlayView__setIsShowing_completion___block_invoke_6(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setClipsToBounds:--*(void *)(*(void *)(a1 + 32) + 408) > 0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (SFURLFieldOverlayConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end