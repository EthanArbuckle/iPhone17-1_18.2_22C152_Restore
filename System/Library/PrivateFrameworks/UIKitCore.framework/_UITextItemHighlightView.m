@interface _UITextItemHighlightView
- (NSArray)textLineRects;
- (UIColor)fillColor;
- (UIEdgeInsets)_padding;
- (_UITextItemHighlightView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (double)horizontalPadding;
- (double)verticalPadding;
- (void)_updateShape;
- (void)setCornerRadius:(double)a3;
- (void)setFillColor:(id)a3;
- (void)setHorizontalPadding:(double)a3;
- (void)setTextLineRects:(id)a3;
- (void)setVerticalPadding:(double)a3;
@end

@implementation _UITextItemHighlightView

- (_UITextItemHighlightView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UITextItemHighlightView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor systemFillColor];
    [(_UITextItemHighlightView *)v3 setFillColor:v4];
  }
  return v3;
}

- (void)setTextLineRects:(id)a3
{
  objc_storeStrong((id *)&self->_textLineRects, a3);
  [(_UITextItemHighlightView *)self _updateShape];
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
  id v5 = a3;
  uint64_t v6 = [v5 CGColor];

  id v7 = [(_UIShapeView *)self shapeLayer];
  [v7 setFillColor:v6];
}

- (void)setHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
  [(_UITextItemHighlightView *)self _updateShape];
}

- (void)setVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
  [(_UITextItemHighlightView *)self _updateShape];
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  [(_UITextItemHighlightView *)self _updateShape];
}

- (UIEdgeInsets)_padding
{
  double v2 = -self->_verticalPadding;
  double v3 = -self->_horizontalPadding;
  double v4 = v2;
  double v5 = v3;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_updateShape
{
  double v3 = [(_UITextItemHighlightView *)self textLineRects];
  [(_UITextItemHighlightView *)self _padding];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(_UITextItemHighlightView *)self cornerRadius];
  v13 = _UIPreviewParametersGenerateTextPlatter(v3, v5, v7, v9, v11, v12);

  id v16 = v13;
  uint64_t v14 = [v16 CGPath];
  v15 = [(_UIShapeView *)self shapeLayer];
  [v15 setPath:v14];
}

- (NSArray)textLineRects
{
  return self->_textLineRects;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_textLineRects, 0);
}

@end