@interface _UIColorWelliOSVisualStyle
- (CGSize)intrinsicSizeWithinSize:(CGSize)a3;
- (_UIColorWelliOSVisualStyle)initWithColorWell:(id)a3;
- (double)_widthForTraitCollection:(id)a3;
- (id)dragPreviewParameters;
- (void)_invokeColorPicker:(id)a3;
- (void)layoutSubviews;
- (void)setSelectedColor:(id)a3;
- (void)touchDown:(id)a3;
- (void)touchUp:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _UIColorWelliOSVisualStyle

- (_UIColorWelliOSVisualStyle)initWithColorWell:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)_UIColorWelliOSVisualStyle;
  v3 = [(_UIColorWellVisualStyle *)&v18 initWithColorWell:a3];
  v4 = v3;
  if (v3)
  {
    [(_UIColorWellVisualStyle *)v3 setWantsSystemDragAndDrop:1];
    uint64_t v5 = +[UIButton buttonWithType:1];
    button = v4->_button;
    v4->_button = (UIButton *)v5;

    v7 = [UIImageView alloc];
    v8 = +[UIImage kitImageNamed:@"UIColorWell"];
    uint64_t v9 = [(UIImageView *)v7 initWithImage:v8];
    gradientView = v4->_gradientView;
    v4->_gradientView = (UIView *)v9;

    v11 = objc_alloc_init(UIView);
    borderView = v4->_borderView;
    v4->_borderView = v11;

    v13 = v4->_borderView;
    v14 = +[UIColor systemBackgroundColor];
    [(UIView *)v13 setBackgroundColor:v14];

    v15 = v4->_button;
    v16 = [(_UIColorWellVisualStyle *)v4 selectedColor];
    [(UIView *)v15 setBackgroundColor:v16];

    [(UIView *)v4 addSubview:v4->_gradientView];
    [(UIView *)v4 addSubview:v4->_borderView];
    [(UIView *)v4 addSubview:v4->_button];
    [(UIView *)v4->_gradientView setAutoresizingMask:18];
    [(UIView *)v4->_button setAutoresizingMask:18];
    [(UIControl *)v4->_button addTarget:v4 action:sel__invokeColorPicker_ forControlEvents:64];
    [(UIControl *)v4->_button addTarget:v4 action:sel_touchDown_ forControlEvents:1];
    [(UIControl *)v4->_button addTarget:v4 action:sel_touchUp_ forControlEvents:480];
    [(_UIColorWellVisualStyle *)v4 setWantsExtraTouchInsets:1];
  }
  return v4;
}

- (void)setSelectedColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIColorWelliOSVisualStyle;
  [(_UIColorWellVisualStyle *)&v4 setSelectedColor:a3];
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)_UIColorWelliOSVisualStyle;
  [(UIView *)&v37 layoutSubviews];
  [(UIView *)self bounds];
  [(UIView *)self bounds];
  CGFloat v4 = fmax(fmin(v3, 36.0), 28.0);
  [(UIView *)self bounds];
  CGFloat v6 = fmax(fmin(v5, 36.0), 28.0);
  [(UIView *)self bounds];
  CGFloat v9 = v8 + (v7 - v6) * 0.5;
  CGFloat v12 = v11 + (v10 - v4) * 0.5;
  -[UIView setFrame:](self->_gradientView, "setFrame:", v9, v12, v6, v4);
  v38.origin.double x = v9;
  v38.origin.double y = v12;
  v38.size.double width = v6;
  v38.size.double height = v4;
  CGRect v39 = CGRectInset(v38, 3.0, 3.0);
  double x = v39.origin.x;
  double y = v39.origin.y;
  double width = v39.size.width;
  double height = v39.size.height;
  v39.origin.double x = v9;
  v39.origin.double y = v12;
  v39.size.double width = v6;
  v39.size.double height = v4;
  CGRect v40 = CGRectInset(v39, 5.0, 5.0);
  CGFloat v17 = v40.origin.x;
  CGFloat v18 = v40.origin.y;
  CGFloat v19 = v40.size.width;
  CGFloat v20 = v40.size.height;
  -[UIButton setFrame:](self->_button, "setFrame:");
  -[UIView setFrame:](self->_borderView, "setFrame:", x, y, width, height);
  v21 = [(UIView *)self->_button layer];
  v41.origin.double x = v17;
  v41.origin.double y = v18;
  v41.size.double width = v19;
  v41.size.double height = v20;
  [v21 setCornerRadius:CGRectGetWidth(v41) * 0.5];

  button = self->_button;
  v23 = [(_UIColorWellVisualStyle *)self selectedColor];
  [(UIView *)button setBackgroundColor:v23];

  v24 = [(UIView *)self->_borderView layer];
  v42.origin.double x = x;
  v42.origin.double y = y;
  v42.size.double width = width;
  v42.size.double height = height;
  [v24 setCornerRadius:CGRectGetWidth(v42) * 0.5];

  borderView = self->_borderView;
  v26 = [(_UIColorWellVisualStyle *)self selectedColor];
  if (v26) {
    double v27 = 1.0;
  }
  else {
    double v27 = 0.0;
  }
  [(UIView *)borderView setAlpha:v27];

  if (self->_isSelected) {
    double v28 = 0.5;
  }
  else {
    double v28 = 1.0;
  }
  [(UIView *)self setAlpha:v28];
  [(UIView *)self->_button bounds];
  double v31 = (v30 + -44.0) * 0.5;
  if (v30 + -44.0 > 0.0) {
    double v31 = 0.0;
  }
  if (v29 + -44.0 <= 0.0) {
    double v32 = (v29 + -44.0) * 0.5;
  }
  else {
    double v32 = 0.0;
  }
  -[UIView _setTouchInsets:](self->_button, "_setTouchInsets:", v32, v31, v32, v31);
  [(UIView *)self bounds];
  double v35 = (v34 + -44.0) * 0.5;
  if (v34 + -44.0 > 0.0) {
    double v35 = 0.0;
  }
  if (v33 + -44.0 <= 0.0) {
    double v36 = (v33 + -44.0) * 0.5;
  }
  else {
    double v36 = 0.0;
  }
  -[UIView _setTouchInsets:](self, "_setTouchInsets:", v36, v35, v36, v35);
}

- (void)touchDown:(id)a3
{
  self->_isSelected = 1;
  [(UIView *)self setNeedsLayout];
}

- (void)touchUp:(id)a3
{
  self->_isSelected = 0;
  [(UIView *)self setNeedsLayout];
}

- (double)_widthForTraitCollection:(id)a3
{
  uint64_t v3 = [a3 horizontalSizeClass];
  double result = 36.0;
  if (v3 == 1) {
    return 28.0;
  }
  return result;
}

- (CGSize)intrinsicSizeWithinSize:(CGSize)a3
{
  CGFloat v4 = [(UIView *)self traitCollection];
  [(_UIColorWelliOSVisualStyle *)self _widthForTraitCollection:v4];
  double v6 = v5;

  double v7 = v6;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIColorWelliOSVisualStyle;
  [(UIView *)&v4 traitCollectionDidChange:a3];
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
}

- (void)_invokeColorPicker:(id)a3
{
  id v3 = [(_UIColorWellVisualStyle *)self colorWell];
  [v3 styleRequestedColorPickerPresentation];
}

- (id)dragPreviewParameters
{
  id v3 = objc_alloc_init(UIDragPreviewParameters);
  objc_super v4 = [(_UIColorWellVisualStyle *)self selectedColor];

  if (v4)
  {
    [(UIView *)self->_button frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(UIView *)self->_button layer];
    [v13 cornerRadius];
    v15 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v6, v8, v10, v12, v14);
    [(UIPreviewParameters *)v3 setVisiblePath:v15];
  }
  else
  {
    [(UIView *)self->_gradientView frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    [(UIView *)self->_gradientView frame];
    v13 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v17, v19, v21, v23, CGRectGetWidth(v26) * 0.5);
    [(UIPreviewParameters *)v3 setVisiblePath:v13];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end