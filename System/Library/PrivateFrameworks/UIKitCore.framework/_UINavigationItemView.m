@interface _UINavigationItemView
- (BOOL)_isFadingInFromCustomAlpha;
- (BOOL)titleAutoresizesToFit;
- (CGRect)_labelFrame;
- (CGSize)_currentTextShadowOffsetForBarStyle:(int64_t)a3;
- (CGSize)_titleSize;
- (_UINavigationItemView)initWithNavigationItem:(id)a3;
- (double)_titleYAdjustmentCustomization;
- (id)_currentTextColorForBarStyle:(int64_t)a3;
- (id)_currentTextShadowColorForBarStyle:(int64_t)a3;
- (id)_defaultFont;
- (id)description;
- (id)font;
- (id)navigationItem;
- (id)title;
- (void)_cleanUpCrossView;
- (void)_crossFadeHiddingButton:(BOOL)a3;
- (void)_prepareCrossViewsForNewSize:(CGSize)a3;
- (void)_resetTitleSize;
- (void)_setFadingInFromCustomAlpha:(BOOL)a3;
- (void)_setFont:(id)a3;
- (void)_setLineBreakMode:(int64_t)a3;
- (void)_updateLabel;
- (void)_updateLabelColor;
- (void)_updateLabelContents;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setTitleAutoresizesToFit:(BOOL)a3;
@end

@implementation _UINavigationItemView

- (_UINavigationItemView)initWithNavigationItem:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = -[UIView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_item, v4);
    __asm { FMOV            V0.2D, #-1.0 }
    v6->_titleSize = _Q0;
    [(UIView *)v6 setOpaque:0];
    [(UIView *)v6 setUserInteractionEnabled:0];
    v12 = objc_alloc_init(UILabel);
    label = v6->_label;
    v6->_label = v12;

    [(UIView *)v6->_label setOpaque:0];
    v14 = v6->_label;
    v15 = +[UIColor clearColor];
    [(UIView *)v14 setBackgroundColor:v15];

    [(UILabel *)v6->_label setLineBreakMode:4];
    v16 = [(_UINavigationItemView *)v6 _defaultFont];
    [(_UINavigationItemView *)v6 _setFont:v16];

    v17 = v6->_label;
    [(_UINavigationItemView *)v6 _labelFrame];
    -[UILabel setFrame:](v17, "setFrame:");
    [(UIView *)v6 addSubview:v6->_label];
    v21[0] = objc_opt_class();
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    id v19 = [(UIView *)v6 registerForTraitChanges:v18 withAction:sel__updateLabelColor];
  }
  return v6;
}

- (id)navigationItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return WeakRetained;
}

- (id)_defaultFont
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  v3 = [WeakRetained _navigationBar];
  [WeakRetained _fontScaleAdjustment];
  id v4 = objc_msgSend(v3, "_defaultTitleFontWithScaleAdjustment:");

  return v4;
}

- (id)_currentTextColorForBarStyle:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  id v4 = [WeakRetained _navigationBar];

  v5 = [v4 _appearanceStorage];
  v6 = [v5 textAttributes];
  v7 = [v6 objectForKey:*(void *)off_1E52D2048];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [v4 _titleTextColor];
  }
  v9 = v8;

  return v9;
}

- (id)_currentTextShadowColorForBarStyle:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  id v4 = [WeakRetained _navigationBar];

  v5 = [v4 _appearanceStorage];
  v6 = [v5 textAttributes];
  v7 = [v6 objectForKey:*(void *)off_1E52D2238];

  id v8 = [v7 shadowColor];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v4 buttonItemShadowColor];
  }
  v11 = v10;

  return v11;
}

- (CGSize)_currentTextShadowOffsetForBarStyle:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  id v4 = [WeakRetained _navigationBar];
  v5 = [v4 _appearanceStorage];
  v6 = [v5 textAttributes];
  v7 = [v6 objectForKey:*(void *)off_1E52D2238];

  if (v7)
  {
    [v7 shadowOffset];
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v11 = -1.0;
    double v9 = 0.0;
  }

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_titleSize = (CGSize)*MEMORY[0x1E4F1DB30];
  [(UIView *)self setNeedsLayout];
  v8.receiver = self;
  v8.super_class = (Class)_UINavigationItemView;
  -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)_updateLabelColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  id v7 = [WeakRetained _navigationBar];

  uint64_t v4 = [v7 barStyle];
  label = self->_label;
  v6 = [(_UINavigationItemView *)self _currentTextColorForBarStyle:v4];
  [(UILabel *)label setTextColor:v6];
}

- (void)_updateLabelContents
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  id v10 = [WeakRetained _navigationBar];

  uint64_t v4 = [v10 barStyle];
  v5 = [(_UINavigationItemView *)self title];
  [(_UINavigationItemView *)self _updateLabelColor];
  label = self->_label;
  [(_UINavigationItemView *)self _currentTextShadowOffsetForBarStyle:v4];
  -[UILabel setShadowOffset:](label, "setShadowOffset:");
  id v7 = self->_label;
  objc_super v8 = [(_UINavigationItemView *)self _currentTextShadowColorForBarStyle:v4];
  [(UILabel *)v7 setShadowColor:v8];

  if (!self->_customFontSet)
  {
    double v9 = [(_UINavigationItemView *)self _defaultFont];
    [(_UINavigationItemView *)self _setFont:v9];
  }
  [(UILabel *)self->_label setText:v5];
}

- (double)_titleYAdjustmentCustomization
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  v3 = [WeakRetained _navigationBar];

  uint64_t v4 = [v3 _appearanceStorage];
  objc_msgSend(v4, "titleVerticalAdjustmentForBarMetrics:", objc_msgSend(v3, "_activeBarMetrics"));
  double v6 = v5;

  return v6;
}

- (CGRect)_labelFrame
{
  [(UIView *)self frame];
  double v4 = v3;
  double v6 = v5;
  [(_UINavigationItemView *)self _titleSize];
  double v8 = v7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  id v10 = [WeakRetained _navigationBar];

  double v11 = [v10 _contentView];
  double v12 = [v10 _currentVisualStyle];
  [v12 navigationItemBaselineOffset];
  double v14 = v13;
  [v11 frame];
  CGFloat v15 = CGRectGetHeight(v27) - v14;
  [(UILabel *)self->_label _baselineOffsetFromBottom];
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v11, v4, v15 + v16 - v8);
  double v18 = v17;
  double v20 = v19;
  [(_UINavigationItemView *)self _titleYAdjustmentCustomization];
  double v22 = v20 + v21;

  double v23 = v18;
  double v24 = v22;
  double v25 = v6;
  double v26 = v8;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (void)_updateLabel
{
  label = self->_label;
  if (self->_isCrossFading)
  {
    double v3 = self->_label;
    [(UIView *)v3 removeFromSuperview];
  }
  else
  {
    [(_UINavigationItemView *)self _labelFrame];
    -[UILabel setFrame:](label, "setFrame:");
    double v5 = self->_label;
    [(UIView *)self addSubview:v5];
  }
}

- (void)_resetTitleSize
{
  self->_titleSize = (CGSize)*MEMORY[0x1E4F1DB30];
  [(UIView *)self setNeedsLayout];
}

- (CGSize)_titleSize
{
  p_titleSize = &self->_titleSize;
  double width = self->_titleSize.width;
  if (width <= 0.0)
  {
    [(_UINavigationItemView *)self _updateLabelContents];
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    p_titleSize->double width = width;
    p_titleSize->double height = height;
  }
  else
  {
    double height = self->_titleSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)title
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  double v3 = [WeakRetained title];

  return v3;
}

- (void)setTitleAutoresizesToFit:(BOOL)a3
{
  [(UILabel *)self->_label setAdjustsFontSizeToFitWidth:a3];
  [(UIView *)self setNeedsLayout];
}

- (BOOL)titleAutoresizesToFit
{
  return [(UILabel *)self->_label adjustsFontSizeToFitWidth];
}

- (void)_setFont:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [(UILabel *)label setFont:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  id v15 = [WeakRetained _navigationBar];

  uint64_t v7 = [v15 barStyle];
  double v8 = [v15 _currentVisualStyle];
  double v9 = v8;
  id v10 = self->_label;
  if (v7) {
    [v8 _legacyButtonFontSize];
  }
  else {
    [v8 buttonFontSize];
  }
  double v12 = v11;
  [v5 pointSize];
  double v14 = v13;

  [(UILabel *)v10 setMinimumScaleFactor:v12 / v14];
}

- (void)setFont:(id)a3
{
  self->_customFontSet = a3 != 0;
  if (a3)
  {
    -[_UINavigationItemView _setFont:](self, "_setFont:");
  }
  else
  {
    id v4 = [(_UINavigationItemView *)self _defaultFont];
    [(_UINavigationItemView *)self _setFont:v4];
  }
}

- (id)font
{
  return [(UILabel *)self->_label font];
}

- (void)_setLineBreakMode:(int64_t)a3
{
}

- (id)description
{
  double v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationItemView;
  id v4 = [(UIView *)&v10 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  double v6 = [(_UINavigationItemView *)self title];
  if (v6)
  {
    uint64_t v7 = [(_UINavigationItemView *)self title];
    double v8 = [v3 stringWithFormat:@"<%@: item=%@ title=%@>", v4, WeakRetained, v7];
  }
  else
  {
    double v8 = [v3 stringWithFormat:@"<%@: item=%@ title=%@>", v4, WeakRetained, @"<nil>"];
  }

  return v8;
}

- (void)_prepareCrossViewsForNewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_isCrossFading) {
    [(_UINavigationItemView *)self _cleanUpCrossView];
  }
  [(UIView *)self bounds];
  _UIGraphicsBeginImageContextWithOptions(0, 0, v6, v7, 0.0);
  double v8 = [(UIView *)self layer];
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  [v8 renderInContext:v10];

  double v11 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();
  if (v11)
  {
    double v12 = [[UIImageView alloc] initWithImage:v11];
    topCrossView = self->_topCrossView;
    self->_topCrossView = &v12->super;

    [(UIView *)self->_topCrossView setAlpha:1.0];
  }
  double v14 = [_UINavigationItemView alloc];
  id v15 = [(_UINavigationItemView *)self navigationItem];
  double v16 = [(_UINavigationItemView *)v14 initWithNavigationItem:v15];

  -[_UINavigationItemView setFrame:](v16, "setFrame:", 0.0, 0.0, width, height);
  _UIGraphicsBeginImageContextWithOptions(0, 0, width, height, 0.0);
  double v17 = [(UIView *)v16 layer];
  double v18 = GetContextStack(0);
  if (*(int *)v18 < 1) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v18[3 * (*(_DWORD *)v18 - 1) + 1];
  }
  [v17 renderInContext:v19];

  _UIGraphicsGetImageFromCurrentImageContext(0);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  if (v22)
  {
    double v20 = [[UIImageView alloc] initWithImage:v22];
    bottomCrossView = self->_bottomCrossView;
    self->_bottomCrossView = &v20->super;

    [(UIView *)self->_bottomCrossView setAlpha:0.0];
  }
  if (self->_bottomCrossView) {
    -[UIView addSubview:](self, "addSubview:");
  }
  if (self->_topCrossView) {
    -[UIView addSubview:](self, "addSubview:");
  }
  self->_isCrossFading = 1;
  [(UIView *)self setNeedsLayout];
}

- (void)_crossFadeHiddingButton:(BOOL)a3
{
  double v3 = 0.0;
  if (a3)
  {
    double v3 = 0.175;
    uint64_t v4 = 0x10000;
  }
  else
  {
    uint64_t v4 = 0x20000;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49___UINavigationItemView__crossFadeHiddingButton___block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  +[UIView animateWithDuration:v4 delay:v5 options:0 animations:0.175 completion:v3];
}

- (void)_cleanUpCrossView
{
  [(UIView *)self->_topCrossView removeFromSuperview];
  topCrossView = self->_topCrossView;
  self->_topCrossView = 0;

  [(UIView *)self->_bottomCrossView removeFromSuperview];
  bottomCrossView = self->_bottomCrossView;
  self->_bottomCrossView = 0;

  self->_isCrossFading = 0;
  [(UIView *)self setNeedsDisplay];
}

- (BOOL)_isFadingInFromCustomAlpha
{
  return self->__isFadingInFromCustomAlpha;
}

- (void)_setFadingInFromCustomAlpha:(BOOL)a3
{
  self->__isFadingInFromCustomAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bottomCrossView, 0);
  objc_storeStrong((id *)&self->_topCrossView, 0);
  objc_destroyWeak((id *)&self->_item);
}

@end