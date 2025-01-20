@interface _UITextSelectionHighlightView
- (NSArray)selectionRects;
- (UIColor)_selectionBorderColor;
- (UIEdgeInsets)_selectionEdgeInsets;
- (_UITextSelectionHighlightView)initWithFrame:(CGRect)a3;
- (double)_selectionBorderWidth;
- (double)_selectionCornerRadius;
- (void)_setSelectionBorderColor:(id)a3;
- (void)_setSelectionBorderWidth:(double)a3;
- (void)_setSelectionCornerRadius:(double)a3;
- (void)_setSelectionEdgeInsets:(UIEdgeInsets)a3;
- (void)layoutSubviews;
- (void)setSelectionRects:(id)a3;
- (void)tintColorDidChange;
@end

@implementation _UITextSelectionHighlightView

- (_UITextSelectionHighlightView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UITextSelectionHighlightView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:0];
    v5 = [_UITextSelectionRangeView alloc];
    uint64_t v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    rangeView = v4->_rangeView;
    v4->_rangeView = (_UITextSelectionRangeView *)v6;

    [(UIView *)v4 addSubview:v4->_rangeView];
  }
  return v4;
}

- (void)setSelectionRects:(id)a3
{
  id v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_selectionRects, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_selectionRects, a3);
    [(UIView *)self setNeedsLayout];
  }
}

- (UIColor)_selectionBorderColor
{
  return [(_UITextSelectionRangeView *)self->_rangeView selectionBorderColor];
}

- (void)_setSelectionBorderColor:(id)a3
{
}

- (double)_selectionBorderWidth
{
  [(_UITextSelectionRangeView *)self->_rangeView selectionBorderWidth];
  return result;
}

- (void)_setSelectionBorderWidth:(double)a3
{
}

- (void)_setSelectionEdgeInsets:(UIEdgeInsets)a3
{
  self->_selectionEdgeInsets = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)_setSelectionCornerRadius:(double)a3
{
  self->_selectionCornerRadius = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)_UITextSelectionHighlightView;
  [(UIView *)&v4 tintColorDidChange];
  v3 = [(UIView *)self tintColor];
  [(_UITextSelectionRangeView *)self->_rangeView setSelectionColor:v3];
}

- (void)layoutSubviews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UITextSelectionHighlightView;
  [(UIView *)&v14 layoutSubviews];
  CGMutablePathRef Mutable = CGPathCreateMutable();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v4 = self->_selectionRects;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "_appendToPath:cornerRadius:edgeInsets:", Mutable, self->_selectionCornerRadius, self->_selectionEdgeInsets.top, self->_selectionEdgeInsets.left, self->_selectionEdgeInsets.bottom, self->_selectionEdgeInsets.right, (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }

  objc_super v9 = [(UIView *)self tintColor];
  [(_UITextSelectionRangeView *)self->_rangeView setSelectionColor:v9];

  [(UIView *)self bounds];
  -[UIView setFrame:](self->_rangeView, "setFrame:");
  [(_UITextSelectionRangeView *)self->_rangeView setPath:Mutable];
  if (Mutable) {
    CFRelease(Mutable);
  }
}

- (NSArray)selectionRects
{
  return self->_selectionRects;
}

- (double)_selectionCornerRadius
{
  return self->_selectionCornerRadius;
}

- (UIEdgeInsets)_selectionEdgeInsets
{
  double top = self->_selectionEdgeInsets.top;
  double left = self->_selectionEdgeInsets.left;
  double bottom = self->_selectionEdgeInsets.bottom;
  double right = self->_selectionEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionRects, 0);
  objc_storeStrong((id *)&self->_rangeView, 0);
}

@end