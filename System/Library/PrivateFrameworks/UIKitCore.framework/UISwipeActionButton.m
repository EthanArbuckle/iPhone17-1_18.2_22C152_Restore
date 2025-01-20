@interface UISwipeActionButton
- (BOOL)_heightDemandsCompactLayout;
- (BOOL)autosizes;
- (CGRect)_allowableContentRectForContentRect:(CGRect)a3;
- (UIColor)defaultBackgroundColor;
- (UIColor)highlightedBackgroundColor;
- (UISwipeActionButton)initWithFrame:(CGRect)a3;
- (UISwipeActionVisualStyle)visualStyle;
- (UIView)backgroundView;
- (_UISwipeActionButtonDelegate)swipeActionButtonDelegate;
- (double)_horizontalPaddingForCurrentIdiom;
- (double)_maxFontSizeForCurrentIdiom;
- (double)_minFontSizeForCurrentIdiom;
- (double)_minScaleFactorForFont:(id)a3;
- (double)_titleFontWeightForCurrentIdiom;
- (double)defaultButtonWidth;
- (id)titleFont;
- (id)titleFontOfSize:(double)a3;
- (int64_t)_numberOfLinesForTitle:(id)a3;
- (unint64_t)_defaultLayoutForHeight:(double)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)setAutosizes:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDefaultBackgroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedBackgroundColor:(id)a3;
- (void)setSwipeActionButtonDelegate:(id)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
- (void)setVisualStyle:(id)a3;
@end

@implementation UISwipeActionButton

- (UISwipeActionButton)initWithFrame:(CGRect)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)UISwipeActionButton;
  v3 = -[UIButton initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 traitCollection];
    v6 = +[UISwipeActionVisualStyleProvider visualStyleForIdiom:](UISwipeActionVisualStyleProvider, "visualStyleForIdiom:", [v5 userInterfaceIdiom]);
    [(UISwipeActionButton *)v4 setVisualStyle:v6];

    [(UIButton *)v4 setAdjustsImageWhenHighlighted:0];
    [(UIView *)v4 setTintAdjustmentMode:1];
    [(UIView *)v4 setAutoresizingMask:18];
    v7 = [(UISwipeActionButton *)v4 visualStyle];
    v8 = [v7 defaultTintColor];
    [(UIButton *)v4 setTintColor:v8];

    [(UIView *)v4 setClipsToBounds:1];
    v9 = [(UISwipeActionButton *)v4 titleFont];
    v10 = [(UIButton *)v4 titleLabel];
    [v10 setFont:v9];

    v11 = [(UIButton *)v4 titleLabel];
    [v11 setAdjustsFontSizeToFitWidth:1];

    v12 = [(UIButton *)v4 titleLabel];
    v13 = [v12 font];
    [(UISwipeActionButton *)v4 _minScaleFactorForFont:v13];
    double v15 = v14;
    v16 = [(UIButton *)v4 titleLabel];
    [v16 setMinimumScaleFactor:v15];

    v17 = [(UIButton *)v4 titleLabel];
    [v17 setLineBreakMode:4];

    v18 = [(UIButton *)v4 imageView];
    [v18 setContentMode:4];

    if (dyld_program_sdk_at_least())
    {
      v23[0] = objc_opt_class();
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      id v20 = [(UIView *)v4 registerForTraitChanges:v19 withHandler:&__block_literal_global_515];
    }
  }
  return v4;
}

void __37__UISwipeActionButton_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 titleFont];
  v4 = [v2 titleLabel];
  [v4 setFont:v3];

  id v8 = [v2 titleFont];
  [v2 _minScaleFactorForFont:v8];
  double v6 = v5;
  v7 = [v2 titleLabel];

  [v7 setMinimumScaleFactor:v6];
}

- (CGRect)_allowableContentRectForContentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UISwipeActionButton *)self _horizontalPaddingForCurrentIdiom];
  double v9 = v8;
  [(UISwipeActionButton *)self buttonWidth];
  double v11 = v10;
  if ([(UIControl *)self contentHorizontalAlignment] == UIControlContentHorizontalAlignmentRight)
  {
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGRectGetWidth(v23);
  }
  UIRoundToViewScale(self);
  double v22 = v12;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v13 = CGRectGetHeight(v24);
  double v14 = [(UISwipeActionButton *)self visualStyle];
  [v14 defaultContentHeightForView:self];
  double v16 = v15;

  if (v13 < v16) {
    double v16 = v13;
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGRectGetHeight(v25);
  UIRoundToViewScale(self);
  double v18 = v17;
  double v19 = v11 - (v9 + v9);
  double v20 = v22;
  double v21 = v16;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v20;
  return result;
}

- (BOOL)_heightDemandsCompactLayout
{
  [(UIView *)self frame];
  [(UISwipeActionButton *)self _defaultLayoutForHeight:v3];
  return 0;
}

- (unint64_t)_defaultLayoutForHeight:(double)a3
{
  if (a3 >= 50.0) {
    return a3 < 90.0;
  }
  else {
    return 2;
  }
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  double v6 = (void *)MEMORY[0x1E4F28B88];
  id v7 = a3;
  double v8 = [v6 whitespaceAndNewlineCharacterSet];
  double v9 = [v7 stringByTrimmingCharactersInSet:v8];

  v15.receiver = self;
  v15.super_class = (Class)UISwipeActionButton;
  [(UIButton *)&v15 setTitle:v9 forState:a4];
  double v10 = [(UIButton *)self titleLabel];
  double v11 = [(UISwipeActionButton *)self visualStyle];
  unint64_t v12 = [v11 maxLines];

  unint64_t v13 = [(UISwipeActionButton *)self _numberOfLinesForTitle:v9];
  if (v12 >= v13) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = v12;
  }
  [v10 setNumberOfLines:v14];
}

- (int64_t)_numberOfLinesForTitle:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 1;
  }
  id v4 = a3;
  double v5 = [(UISwipeActionButton *)self titleFont];
  [(UIView *)self frame];
  -[UISwipeActionButton _allowableContentRectForContentRect:](self, "_allowableContentRectForContentRect:");
  double v7 = v6;
  double v9 = v8;
  uint64_t v23 = *(void *)off_1E52D2040;
  v24[0] = v5;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 1, v10, 0, v7, v9);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v25.origin.CGFloat x = v12;
  v25.origin.CGFloat y = v14;
  v25.size.CGFloat width = v16;
  v25.size.CGFloat height = v18;
  double Height = CGRectGetHeight(v25);
  [v5 lineHeight];
  int64_t v21 = vcvtpd_s64_f64(Height / v20);

  return v21;
}

- (void)setBackgroundColor:(id)a3
{
  id v7 = a3;
  id v4 = +[UIColor clearColor];
  char v5 = [v7 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    double v6 = [(UISwipeActionButton *)self backgroundView];
    [v6 setBackgroundColor:v7];
  }
}

- (void)setDefaultBackgroundColor:(id)a3
{
  p_defaultBackgroundColor = &self->_defaultBackgroundColor;
  objc_storeStrong((id *)&self->_defaultBackgroundColor, a3);
  id v6 = a3;
  [(UISwipeActionButton *)self setBackgroundColor:*p_defaultBackgroundColor];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UISwipeActionButton;
  -[UIButton setHighlighted:](&v6, sel_setHighlighted_);
  uint64_t v5 = 1;
  if (!v3) {
    uint64_t v5 = 0;
  }
  [(UISwipeActionButton *)self setBackgroundColor:*(Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___UISwipeActionButton__defaultBackgroundColor[v5])];
}

- (double)defaultButtonWidth
{
  id v2 = [(UISwipeActionButton *)self visualStyle];
  [v2 defaultButtonWidth];
  double v4 = v3;

  return v4;
}

- (id)titleFontOfSize:(double)a3
{
  [(UISwipeActionButton *)self _titleFontWeightForCurrentIdiom];
  return (id)[off_1E52D39B8 systemFontOfSize:a3 weight:v4];
}

- (id)titleFont
{
  [(UISwipeActionButton *)self _maxFontSizeForCurrentIdiom];
  double v4 = v3;
  uint64_t v5 = [(id)UIApp preferredContentSizeCategory];
  objc_super v6 = (void *)v5;
  id v7 = @"_UICTContentSizeCategoryUnspecified";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  double v8 = v7;

  if (dyld_program_sdk_at_least()
    && UIContentSizeCategoryCompareToCategory(&v8->isa, &cfstr_Uictcontentsiz_5.isa) == NSOrderedDescending)
  {
    if (UIContentSizeCategoryCompareToCategory(&v8->isa, &cfstr_Uictcontentsiz_11.isa) == NSOrderedDescending)
    {
      double v9 = @"UICTContentSizeCategoryAccessibilityXL";

      double v8 = v9;
    }
    double v10 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v8];
    double v11 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody" compatibleWithTraitCollection:v10];
    [v11 _scaledValueForValue:v4];
    double v4 = v12;
  }
  double v13 = [(UISwipeActionButton *)self titleFontOfSize:v4];

  return v13;
}

- (double)_minScaleFactorForFont:(id)a3
{
  [a3 pointSize];
  double v5 = v4;
  [(UISwipeActionButton *)self _minFontSizeForCurrentIdiom];
  double v7 = v6;
  [(UISwipeActionButton *)self _maxFontSizeForCurrentIdiom];
  if (v5 != 0.0) {
    double v8 = v5;
  }
  return v7 / v8;
}

- (double)_minFontSizeForCurrentIdiom
{
  id v2 = [(UISwipeActionButton *)self visualStyle];
  [v2 minFontSize];
  double v4 = v3;

  return v4;
}

- (double)_maxFontSizeForCurrentIdiom
{
  id v2 = [(UISwipeActionButton *)self visualStyle];
  [v2 maxFontSize];
  double v4 = v3;

  return v4;
}

- (double)_horizontalPaddingForCurrentIdiom
{
  id v2 = [(UISwipeActionButton *)self visualStyle];
  [v2 horizontalPadding];
  double v4 = v3;

  return v4;
}

- (double)_titleFontWeightForCurrentIdiom
{
  id v2 = [(UISwipeActionButton *)self visualStyle];
  [v2 titleFontWeight];
  double v4 = v3;

  return v4;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  v10.receiver = self;
  v10.super_class = (Class)UISwipeActionButton;
  [(UIControl *)&v10 contextMenuInteraction:a3 willDisplayMenuForConfiguration:a4 animator:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_swipeActionButtonDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained swipeActionButton:self willDisplayContextMenuWithAnimator:v8];
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  v10.receiver = self;
  v10.super_class = (Class)UISwipeActionButton;
  [(UIControl *)&v10 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_swipeActionButtonDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained swipeActionButton:self willDismissContextMenuWithAnimator:v8];
  }
}

- (UIColor)defaultBackgroundColor
{
  return self->_defaultBackgroundColor;
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (void)setHighlightedBackgroundColor:(id)a3
{
}

- (UISwipeActionVisualStyle)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
}

- (BOOL)autosizes
{
  return self->_autosizes;
}

- (void)setAutosizes:(BOOL)a3
{
  self->_autosizes = a3;
}

- (_UISwipeActionButtonDelegate)swipeActionButtonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_swipeActionButtonDelegate);
  return (_UISwipeActionButtonDelegate *)WeakRetained;
}

- (void)setSwipeActionButtonDelegate:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_swipeActionButtonDelegate);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundColor, 0);
}

@end