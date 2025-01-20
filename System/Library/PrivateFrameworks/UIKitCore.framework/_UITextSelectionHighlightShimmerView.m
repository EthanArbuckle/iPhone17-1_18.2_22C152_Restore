@interface _UITextSelectionHighlightShimmerView
- (NSArray)selectionRects;
- (_UITextSelectionHighlightShimmerView)initWithFrame:(CGRect)a3;
- (_UITextSelectionHighlightShimmerView)initWithFrame:(CGRect)a3 effect:(id)a4;
- (double)_selectionCornerRadius;
- (void)_setSelectionCornerRadius:(double)a3;
- (void)layoutSubviews;
- (void)setSelectionRects:(id)a3;
@end

@implementation _UITextSelectionHighlightShimmerView

- (_UITextSelectionHighlightShimmerView)initWithFrame:(CGRect)a3
{
  return -[_UITextSelectionHighlightShimmerView initWithFrame:effect:](self, "initWithFrame:effect:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UITextSelectionHighlightShimmerView)initWithFrame:(CGRect)a3 effect:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = (_UIIntelligenceContentLightEffect *)a4;
  v24.receiver = self;
  v24.super_class = (Class)_UITextSelectionHighlightShimmerView;
  v10 = -[UIView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(UIView *)v10 setUserInteractionEnabled:0];
    if (!v9)
    {
      v12 = [_UIDirectionalLightConfiguration alloc];
      v13 = +[_UIColorPalette textAssistantPonderingFillPalette];
      v14 = [(_UIDirectionalLightConfiguration *)v12 initWithColorPalette:v13];

      [(_UIDirectionalLightConfiguration *)v14 setDirection:2];
      [(_UIDirectionalLightConfiguration *)v14 setDuration:3.0];
      v15 = +[_UIIntelligenceLightSourceDescriptor directionalLightWithConfiguration:v14];
      v9 = [[_UIIntelligenceContentLightEffect alloc] initWithLightSource:v15];
    }
    v16 = [[UIVisualEffectView alloc] initWithEffect:v9];
    shimmerView = v11->_shimmerView;
    v11->_shimmerView = v16;

    v18 = [(UIView *)v11->_shimmerView layer];
    [v18 setAllowsGroupOpacity:1];

    [(UIView *)v11 insertSubview:v11->_shimmerView atIndex:0];
    v19 = [_UITextSelectionRangeView alloc];
    uint64_t v20 = -[UIView initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    rangeView = v11->_rangeView;
    v11->_rangeView = (_UITextSelectionRangeView *)v20;

    v22 = [(UIVisualEffectView *)v11->_shimmerView contentView];
    [v22 addSubview:v11->_rangeView];
  }
  return v11;
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

- (void)_setSelectionCornerRadius:(double)a3
{
  self->_selectionCornerRadius = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UITextSelectionHighlightShimmerView;
  [(UIView *)&v14 layoutSubviews];
  CGMutablePathRef Mutable = CGPathCreateMutable();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_selectionRects;
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "_appendToPath:cornerRadius:edgeInsets:", Mutable, self->_selectionCornerRadius, 0.0, 0.0, 0.0, 0.0, (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }

  v9 = [(UIView *)self tintColor];
  [(_UITextSelectionRangeView *)self->_rangeView setSelectionColor:v9];

  [(UIView *)self bounds];
  -[UIView setFrame:](self->_shimmerView, "setFrame:");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionRects, 0);
  objc_storeStrong((id *)&self->_shimmerView, 0);
  objc_storeStrong((id *)&self->_rangeView, 0);
}

@end