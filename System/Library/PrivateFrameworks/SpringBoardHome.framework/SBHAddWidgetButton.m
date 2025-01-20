@interface SBHAddWidgetButton
- (CGSize)intrinsicContentSize;
- (MTStylingProvidingSolidColorView)backgroundView;
- (SBHAddWidgetButton)initWithFrame:(CGRect)a3;
- (UIView)highlightView;
- (double)_buttonCornerRadius;
- (id)_addSymbolImage;
- (id)_titleLabelFont;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)addWidgetSheetStyle;
- (void)_contentSizeCategoryDidChange;
- (void)dealloc;
- (void)layoutSubviews;
- (void)mt_applyVisualStyling:(id)a3;
- (void)mt_removeAllVisualStyling;
- (void)setAddWidgetSheetStyle:(unint64_t)a3;
- (void)setBackgroundView:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SBHAddWidgetButton

- (SBHAddWidgetButton)initWithFrame:(CGRect)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)SBHAddWidgetButton;
  v3 = -[SBHAddWidgetButton initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = SBHBundle();
    v5 = [v4 localizedStringForKey:@"WIDGET_ADD_SHEET_ADD_WIDGET_THIS_STRING_NEEDS_TO_HAVE_A_LEADING_SPACE_FOR_LAYOUT_PURPOSES" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [(SBHAddWidgetButton *)v3 setTitle:v5 forState:0];

    v6 = [(SBHAddWidgetButton *)v3 imageView];
    [v6 setContentMode:1];

    v7 = [(SBHAddWidgetButton *)v3 titleLabel];
    [v7 setAdjustsFontSizeToFitWidth:1];
    v8 = [(SBHAddWidgetButton *)v3 _titleLabelFont];
    [v7 setFont:v8];

    v9 = [(SBHAddWidgetButton *)v3 _addSymbolImage];
    [(SBHAddWidgetButton *)v3 setImage:v9 forState:0];

    [(SBHAddWidgetButton *)v3 setAdjustsImageWhenHighlighted:0];
    v10 = (MTStylingProvidingSolidColorView *)objc_alloc_init(MEMORY[0x1E4F743E0]);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v10;

    [(MTStylingProvidingSolidColorView *)v3->_backgroundView setUserInteractionEnabled:0];
    [(SBHAddWidgetButton *)v3 insertSubview:v3->_backgroundView atIndex:0];
    v12 = [(MTStylingProvidingSolidColorView *)v3->_backgroundView visualStylingProviderForCategory:1];
    [v12 automaticallyUpdateView:v3 withStyle:0];

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    highlightView = v3->_highlightView;
    v3->_highlightView = v13;

    [(UIView *)v3->_highlightView setUserInteractionEnabled:0];
    [(UIView *)v3->_highlightView setAlpha:0.0];
    [(SBHAddWidgetButton *)v3 insertSubview:v3->_highlightView aboveSubview:v3->_backgroundView];
    [(SBHAddWidgetButton *)v3 layoutIfNeeded];
    v15 = [(MTStylingProvidingSolidColorView *)v3->_backgroundView visualStylingProviderForCategory:2];
    [v15 automaticallyUpdateView:v3->_highlightView withStyle:0 andObserverBlock:&__block_literal_global_58];

    v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
    [(SBHAddWidgetButton *)v3 addInteraction:v16];
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v3 selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4FB27A8] object:0];

    v18 = self;
    v23[0] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    id v20 = (id)[(SBHAddWidgetButton *)v3 registerForTraitChanges:v19 withAction:sel__contentSizeCategoryDidChange];
  }
  return v3;
}

id __36__SBHAddWidgetButton_initWithFrame___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 alpha];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__SBHAddWidgetButton_initWithFrame___block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  aBlock[4] = v3;
  v4 = _Block_copy(aBlock);
  return v4;
}

uint64_t __36__SBHAddWidgetButton_initWithFrame___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:*(double *)(a1 + 32)];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetButton;
  [(SBHAddWidgetButton *)&v4 dealloc];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SBHAddWidgetButton *)self isHighlighted];
  v9.receiver = self;
  v9.super_class = (Class)SBHAddWidgetButton;
  [(SBHAddWidgetButton *)&v9 setHighlighted:v3];
  if (v5 != [(SBHAddWidgetButton *)self isHighlighted])
  {
    double v6 = 0.3;
    v7[1] = 3221225472;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[2] = __37__SBHAddWidgetButton_setHighlighted___block_invoke;
    v7[3] = &unk_1E6AAD728;
    if (v3) {
      double v6 = 0.0;
    }
    v7[4] = self;
    BOOL v8 = v3;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:delay:options:animations:completion:", 4, v7, 0, v6);
  }
}

uint64_t __37__SBHAddWidgetButton_setHighlighted___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 760) setAlpha:v1];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SBHAddWidgetButton;
  [(SBHAddWidgetButton *)&v7 layoutSubviews];
  highlightView = self->_highlightView;
  [(SBHAddWidgetButton *)self bounds];
  -[UIView setFrame:](highlightView, "setFrame:");
  [(SBHAddWidgetButton *)self sendSubviewToBack:self->_highlightView];
  backgroundView = self->_backgroundView;
  [(SBHAddWidgetButton *)self bounds];
  -[MTStylingProvidingSolidColorView setFrame:](backgroundView, "setFrame:");
  [(SBHAddWidgetButton *)self sendSubviewToBack:self->_backgroundView];
  [(SBHAddWidgetButton *)self _buttonCornerRadius];
  double v6 = v5;
  -[MTStylingProvidingSolidColorView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:");
  [(UIView *)self->_highlightView _setContinuousCornerRadius:v6];
}

- (double)_buttonCornerRadius
{
  double result = self->_buttonCornerRadius;
  if (result <= 0.0)
  {
    unint64_t v4 = [(SBHAddWidgetButton *)self addWidgetSheetStyle];
    double v5 = [(SBHAddWidgetButton *)self _screen];
    double v6 = [v5 traitCollection];
    [v6 displayCornerRadius];
    double v8 = v7;

    [(SBHAddWidgetButton *)self bounds];
    double result = v9 * 0.5;
    if (v4 != 1)
    {
      if (v8 + -24.0 <= result) {
        double result = v8 + -24.0;
      }
      if (v4) {
        double result = 14.0;
      }
      if (v8 <= 0.0) {
        return 14.0;
      }
    }
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = [(SBHAddWidgetButton *)self titleLabel];
  [v3 intrinsicContentSize];
  double v5 = v4 + 20.0;

  double v6 = [(SBHAddWidgetButton *)self imageView];
  [v6 intrinsicContentSize];
  double v8 = v7 + 20.0;

  v11.receiver = self;
  v11.super_class = (Class)SBHAddWidgetButton;
  [(SBHAddWidgetButton *)&v11 intrinsicContentSize];
  if (v5 >= v8) {
    double v10 = v5;
  }
  else {
    double v10 = v8;
  }
  if (v10 < 50.0) {
    double v10 = 50.0;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_titleLabelFont
{
  BOOL v3 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  double v5 = [(SBHAddWidgetButton *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  double v7 = [v3 preferredFontForTextStyle:v4 hiFontStyle:4 contentSizeCategory:v6];

  return v7;
}

- (id)_addSymbolImage
{
  v2 = [(SBHAddWidgetButton *)self _titleLabelFont];
  BOOL v3 = [MEMORY[0x1E4FB1830] configurationWithFont:v2 scale:2];
  uint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.circle.fill" withConfiguration:v3];

  return v4;
}

- (void)_contentSizeCategoryDidChange
{
  BOOL v3 = [(SBHAddWidgetButton *)self titleLabel];
  uint64_t v4 = [(SBHAddWidgetButton *)self _titleLabelFont];
  [v3 setFont:v4];

  double v5 = [(SBHAddWidgetButton *)self _addSymbolImage];
  [(SBHAddWidgetButton *)self setImage:v5 forState:0];

  [(SBHAddWidgetButton *)self setNeedsLayout];
  [(SBHAddWidgetButton *)self layoutBelowIfNeeded];
  [(SBHAddWidgetButton *)self invalidateIntrinsicContentSize];
}

- (void)mt_applyVisualStyling:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__SBHAddWidgetButton_mt_applyVisualStyling___block_invoke;
  v3[3] = &unk_1E6AB34D8;
  v3[4] = self;
  [a3 applyToView:self withColorBlock:v3];
}

void __44__SBHAddWidgetButton_mt_applyVisualStyling___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setTintColor:v4];
  [*(id *)(a1 + 32) setTitleColor:v4 forState:0];
}

- (void)mt_removeAllVisualStyling
{
  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetButton;
  [(SBHAddWidgetButton *)&v3 mt_removeAllVisualStyling];
  [(SBHAddWidgetButton *)self setTintColor:0];
  [(SBHAddWidgetButton *)self setTitleColor:0 forState:0];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  double v6 = (void *)MEMORY[0x1E4FB1AD8];
  id v7 = a5;
  [(SBHAddWidgetButton *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v7 identifier];

  v17 = objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self parameters:v5];
  id v7 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v6];
  double v8 = (void *)MEMORY[0x1E4FB1AE0];
  [(SBHAddWidgetButton *)self frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(SBHAddWidgetButton *)self _buttonCornerRadius];
  v18 = objc_msgSend(v8, "shapeWithRoundedRect:cornerRadius:", v10, v12, v14, v16, v17);
  v19 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v7 shape:v18];

  return v19;
}

- (MTStylingProvidingSolidColorView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (unint64_t)addWidgetSheetStyle
{
  return self->_addWidgetSheetStyle;
}

- (void)setAddWidgetSheetStyle:(unint64_t)a3
{
  self->_addWidgetSheetStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end