@interface _UIListContentImageView
- (UIColor)_strokeColor;
- (_UIListContentImageView)initWithCoder:(id)a3;
- (_UIListContentImageView)initWithFrame:(CGRect)a3;
- (_UIListContentImageView)initWithImage:(id)a3;
- (_UIListContentImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (double)_strokeWidth;
- (void)_registerTraitChanges;
- (void)_setStrokeColor:(id)a3;
- (void)_setStrokeWidth:(double)a3;
- (void)_updateStroke;
@end

@implementation _UIListContentImageView

- (_UIListContentImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIListContentImageView;
  v3 = -[UIImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_UIListContentImageView *)v3 _registerTraitChanges];
  }
  return v4;
}

- (void)_registerTraitChanges
{
  id v4 = +[UITraitCollection systemTraitsAffectingColorAppearance];
  id v3 = [(UIView *)self registerForTraitChanges:v4 withAction:sel__updateStroke];
}

- (void)_setStrokeWidth:(double)a3
{
  if (self->_strokeWidth != a3)
  {
    self->_strokeWidth = a3;
    [(_UIListContentImageView *)self _updateStroke];
  }
}

- (void)_setStrokeColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_strokeColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_strokeColor, a3);
    [(_UIListContentImageView *)self _updateStroke];
    v5 = v6;
  }
}

- (void)_updateStroke
{
  id v3 = [(UIView *)self layer];
  if (self->_strokeWidth <= 0.0
    || (id v4 = self->_strokeColor) == 0
    || (id v11 = v3,
        +[UIColor clearColor],
        v5 = (UIColor *)objc_claimAutoreleasedReturnValue(),
        v5,
        id v3 = v11,
        v4 == v5))
  {
    if (self->_hadStroke)
    {
      id v12 = v3;
      id v10 = +[UIColor blackColor];
      objc_msgSend(v12, "setBorderColor:", objc_msgSend(v10, "CGColor"));

      [v12 setBorderWidth:0.0];
      id v3 = v12;
    }
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = 1;
    [v11 setMasksToBounds:1];
    strokeColor = self->_strokeColor;
    v8 = [(UIView *)self traitCollection];
    id v9 = [(UIColor *)strokeColor resolvedColorWithTraitCollection:v8];
    objc_msgSend(v11, "setBorderColor:", objc_msgSend(v9, "CGColor"));

    [v11 setBorderWidth:self->_strokeWidth];
    id v3 = v11;
  }
  self->_hadStroke = v6;
}

- (_UIListContentImageView)initWithImage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIListContentImageView;
  id v3 = [(UIImageView *)&v6 initWithImage:a3];
  id v4 = v3;
  if (v3) {
    [(_UIListContentImageView *)v3 _registerTraitChanges];
  }
  return v4;
}

- (_UIListContentImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIListContentImageView;
  id v4 = [(UIImageView *)&v7 initWithImage:a3 highlightedImage:a4];
  v5 = v4;
  if (v4) {
    [(_UIListContentImageView *)v4 _registerTraitChanges];
  }
  return v5;
}

- (_UIListContentImageView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIListContentImageView;
  id v3 = [(UIImageView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(_UIListContentImageView *)v3 _registerTraitChanges];
  }
  return v4;
}

- (UIColor)_strokeColor
{
  return self->_strokeColor;
}

- (double)_strokeWidth
{
  return self->_strokeWidth;
}

- (void).cxx_destruct
{
}

@end