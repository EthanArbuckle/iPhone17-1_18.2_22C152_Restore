@interface _UITextSelectionRangeView
+ (Class)layerClass;
- (CGPath)path;
- (UIColor)selectionBorderColor;
- (UIColor)selectionColor;
- (double)selectionBorderWidth;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)setPath:(CGPath *)a3;
- (void)setSelectionBorderColor:(id)a3;
- (void)setSelectionBorderWidth:(double)a3;
- (void)setSelectionColor:(id)a3;
@end

@implementation _UITextSelectionRangeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(CGPath *)a3
{
  id v4 = [(_UITextSelectionRangeView *)self pathLayer];
  [v4 setPath:a3];
}

- (CGPath)path
{
  v2 = [(_UITextSelectionRangeView *)self pathLayer];
  v3 = (CGPath *)[v2 path];

  return v3;
}

- (void)setSelectionColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionColor, a3);
  id v5 = a3;
  uint64_t v6 = [v5 CGColor];

  id v7 = [(_UITextSelectionRangeView *)self pathLayer];
  [v7 setFillColor:v6];
}

- (void)setSelectionBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectionBorderColor, a3);
  id v5 = a3;
  uint64_t v6 = [v5 CGColor];

  id v7 = [(_UITextSelectionRangeView *)self pathLayer];
  [v7 setStrokeColor:v6];
}

- (void)setSelectionBorderWidth:(double)a3
{
  self->_selectionBorderWidth = a3;
  id v4 = [(_UITextSelectionRangeView *)self pathLayer];
  [v4 setLineWidth:a3];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v9.receiver = self;
  v9.super_class = (Class)_UITextSelectionRangeView;
  [(UIView *)&v9 _dynamicUserInterfaceTraitDidChange];
  id v3 = [(_UITextSelectionRangeView *)self selectionColor];
  uint64_t v4 = [v3 CGColor];
  id v5 = [(_UITextSelectionRangeView *)self pathLayer];
  [v5 setFillColor:v4];

  id v6 = [(_UITextSelectionRangeView *)self selectionBorderColor];
  uint64_t v7 = [v6 CGColor];
  v8 = [(_UITextSelectionRangeView *)self pathLayer];
  [v8 setStrokeColor:v7];
}

- (UIColor)selectionColor
{
  return self->_selectionColor;
}

- (UIColor)selectionBorderColor
{
  return self->_selectionBorderColor;
}

- (double)selectionBorderWidth
{
  return self->_selectionBorderWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionBorderColor, 0);
  objc_storeStrong((id *)&self->_selectionColor, 0);
}

@end