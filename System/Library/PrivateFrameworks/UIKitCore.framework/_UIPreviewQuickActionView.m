@interface _UIPreviewQuickActionView
- (BOOL)selected;
- (UIImageView)backgroundViewImage;
- (UIImageView)imageView;
- (UILabel)label;
- (UIPreviewAction)quickAction;
- (_UIPreviewQuickActionView)initWithCoder:(id)a3;
- (_UIPreviewQuickActionView)initWithFrame:(CGRect)a3;
- (id)centerYAnchor;
- (void)_updateCircleBackgroundImage;
- (void)layoutSubviews;
- (void)setBackgroundViewImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setQuickAction:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateFromQuickAction;
@end

@implementation _UIPreviewQuickActionView

- (_UIPreviewQuickActionView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewQuickActionView;
  v3 = [(UIView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    _UIPreviewQuickActionViewCommonInit(v3);
  }
  return v4;
}

- (_UIPreviewQuickActionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewQuickActionView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    _UIPreviewQuickActionViewCommonInit(v3);
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewQuickActionView;
  [(UIView *)&v3 layoutSubviews];
  [(_UIPreviewQuickActionView *)self _updateCircleBackgroundImage];
}

- (id)centerYAnchor
{
  v2 = [(_UIPreviewQuickActionView *)self imageView];
  objc_super v3 = [v2 bottomAnchor];

  return v3;
}

- (void)setQuickAction:(id)a3
{
  v5 = (UIPreviewAction *)a3;
  if (self->_quickAction != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_quickAction, a3);
    [(_UIPreviewQuickActionView *)self updateFromQuickAction];
    v5 = v6;
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(_UIPreviewQuickActionView *)self updateFromQuickAction];
  }
}

- (void)updateFromQuickAction
{
  objc_super v3 = [(_UIPreviewQuickActionView *)self quickAction];
  v4 = [v3 title];
  v5 = [(_UIPreviewQuickActionView *)self label];
  [v5 setText:v4];

  objc_super v6 = [(_UIPreviewQuickActionView *)self quickAction];
  v7 = [v6 image];
  v8 = [v7 imageWithRenderingMode:2];
  v9 = [(_UIPreviewQuickActionView *)self imageView];
  [v9 setImage:v8];

  v10 = [(_UIPreviewQuickActionView *)self quickAction];
  v11 = [v10 _color];
  v12 = [(_UIPreviewQuickActionView *)self label];
  [v12 setTextColor:v11];

  if ([(_UIPreviewQuickActionView *)self selected])
  {
    v13 = [(_UIPreviewQuickActionView *)self quickAction];
    v14 = [v13 _color];
    v15 = [(_UIPreviewQuickActionView *)self backgroundViewImage];
    [v15 setTintColor:v14];

    v16 = +[UIColor whiteColor];
    v17 = [(_UIPreviewQuickActionView *)self imageView];
    [v17 setTintColor:v16];
  }
  else
  {
    v18 = +[UIColor whiteColor];
    v19 = [(_UIPreviewQuickActionView *)self backgroundViewImage];
    [v19 setTintColor:v18];

    v16 = [(_UIPreviewQuickActionView *)self quickAction];
    v17 = [v16 _color];
    v20 = [(_UIPreviewQuickActionView *)self imageView];
    [v20 setTintColor:v17];
  }
  [(UIView *)self setNeedsLayout];
}

- (void)_updateCircleBackgroundImage
{
  objc_super v3 = [(_UIPreviewQuickActionView *)self backgroundViewImage];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v5, v7, v9, v11);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  _UIGraphicsBeginImageContextWithOptions(0, 0, v9, v11, 0.0);
  v12 = +[UIColor whiteColor];
  [v12 setFill];

  [v16 fill];
  v13 = _UIGraphicsGetImageFromCurrentImageContext(0);
  v14 = [v13 imageWithRenderingMode:2];
  v15 = [(_UIPreviewQuickActionView *)self backgroundViewImage];
  [v15 setImage:v14];

  UIGraphicsEndImageContext();
}

- (UIPreviewAction)quickAction
{
  return self->_quickAction;
}

- (BOOL)selected
{
  return self->_selected;
}

- (UIImageView)backgroundViewImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundViewImage);
  return (UIImageView *)WeakRetained;
}

- (void)setBackgroundViewImage:(id)a3
{
}

- (UIImageView)imageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  return (UIImageView *)WeakRetained;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  return (UILabel *)WeakRetained;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_backgroundViewImage);
  objc_storeStrong((id *)&self->_quickAction, 0);
}

@end