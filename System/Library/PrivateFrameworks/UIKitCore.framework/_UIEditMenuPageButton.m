@interface _UIEditMenuPageButton
- (UIEdgeInsets)arrowEdgeInsets;
- (_UIEditMenuPageButton)initWithDirection:(int64_t)a3 backgroundGroupName:(id)a4;
- (id)_imageNameForCurrentDirection;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)direction;
- (void)_configureButtonWithGroupName:(id)a3;
- (void)layoutSubviews;
- (void)setArrowEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation _UIEditMenuPageButton

- (_UIEditMenuPageButton)initWithDirection:(int64_t)a3 backgroundGroupName:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_UIEditMenuPageButton;
  v7 = -[UIButton initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_direction = a3;
    [(_UIEditMenuPageButton *)v7 _configureButtonWithGroupName:v6];
  }

  return v8;
}

- (void)setArrowEdgeInsets:(UIEdgeInsets)a3
{
  double top = a3.top;
  double v4 = self->_arrowEdgeInsets.top;
  if (self->_arrowEdgeInsets.left != a3.left
    || v4 != top
    || self->_arrowEdgeInsets.right != a3.right
    || self->_arrowEdgeInsets.bottom != a3.bottom)
  {
    self->_arrowEdgeInsets.double top = top;
    self->_arrowEdgeInsets.left = a3.left;
    self->_arrowEdgeInsets.bottom = a3.bottom;
    self->_arrowEdgeInsets.right = a3.right;
    id v10 = [(UIButton *)self configuration];
    [v10 setDefaultContentInsets];
    [v10 contentInsets];
    [v10 setContentInsets:top + v9];
    [(UIButton *)self setConfiguration:v10];
  }
}

- (id)_imageNameForCurrentDirection
{
  if ([(_UIEditMenuPageButton *)self direction]) {
    return @"chevron.right";
  }
  else {
    return @"chevron.left";
  }
}

- (void)_configureButtonWithGroupName:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  double v4 = [(UIView *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  id v6 = _UIEditMenuGetPlatformMetrics(v5);
  v7 = _UIEditMenuGetPlatformMetrics(v5);
  v8 = [UIVisualEffectView alloc];
  double v9 = [v7 separatorEffect];
  id v10 = [(UIVisualEffectView *)v8 initWithEffect:v9];

  v11 = [v7 separatorEffectColor];
  v12 = [(UIVisualEffectView *)v10 contentView];
  [v12 setBackgroundColor:v11];

  v13 = [(UIVisualEffectView *)v10 contentView];
  v14 = [v13 layer];
  [v14 setAllowsEdgeAntialiasing:1];

  v15 = [(UIVisualEffectView *)v10 contentView];
  [v15 setClipsToBounds:0];

  separatorView = self->_separatorView;
  self->_separatorView = v10;

  [(UIView *)self addSubview:self->_separatorView];
  v17 = [v6 pageButtonConfiguration];
  v18 = [(UIView *)self traitCollection];
  v19 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleSubhead" compatibleWithTraitCollection:v18];
  uint64_t v40 = *(void *)off_1E52D6B98;
  uint64_t v38 = *(void *)off_1E52D6C08;
  v20 = [NSNumber numberWithDouble:*(double *)off_1E52D6C00];
  v39 = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  v41[0] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
  v23 = [v19 fontDescriptorByAddingAttributes:v22];

  v24 = [off_1E52D39B8 fontWithDescriptor:v23 size:0.0];

  v25 = +[UIImageSymbolConfiguration configurationWithFont:v24 scale:1];

  v26 = [(_UIEditMenuPageButton *)self _imageNameForCurrentDirection];
  v27 = +[UIImage systemImageNamed:v26 withConfiguration:v25];

  [v17 setImage:v27];
  [(UIButton *)self setConfiguration:v17];
  [v17 contentInsets];
  self->_defaultInsets.double top = v28;
  self->_defaultInsets.leading = v29;
  self->_defaultInsets.bottom = v30;
  self->_defaultInsets.trailing = v31;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __55___UIEditMenuPageButton__configureButtonWithGroupName___block_invoke;
  v35[3] = &unk_1E52FF188;
  id v36 = v6;
  id v37 = v34;
  id v32 = v34;
  id v33 = v6;
  [(UIButton *)self setConfigurationUpdateHandler:v35];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)_UIEditMenuPageButton;
  [(UIButton *)&v8 layoutSubviews];
  [(UIView *)self _currentScreenScale];
  double v4 = 1.0 / v3;
  int64_t v5 = [(_UIEditMenuPageButton *)self direction];
  if (v5 == 1)
  {
    [(UIView *)self bounds];
    double Height = CGRectGetHeight(v11);
    double v6 = 0.0;
  }
  else
  {
    if (v5) {
      return;
    }
    [(UIView *)self bounds];
    double v6 = CGRectGetMaxX(v9) - v4;
    [(UIView *)self bounds];
    double Height = CGRectGetHeight(v10);
  }
  -[UIView setFrame:](self->_separatorView, "setFrame:", v6, 0.0, v4, Height);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (int64_t)direction
{
  return self->_direction;
}

- (UIEdgeInsets)arrowEdgeInsets
{
  double top = self->_arrowEdgeInsets.top;
  double left = self->_arrowEdgeInsets.left;
  double bottom = self->_arrowEdgeInsets.bottom;
  double right = self->_arrowEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

@end