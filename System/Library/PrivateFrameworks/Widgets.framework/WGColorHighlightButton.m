@interface WGColorHighlightButton
- (CGSize)intrinsicContentSize;
- (UIColor)highlightedBackgroundColor;
- (UIColor)savedBackgroundColor;
- (void)_updateRealBackgroundColor;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedBackgroundColor:(id)a3;
- (void)setSavedBackgroundColor:(id)a3;
@end

@implementation WGColorHighlightButton

- (CGSize)intrinsicContentSize
{
  v14.receiver = self;
  v14.super_class = (Class)WGColorHighlightButton;
  [(WGColorHighlightButton *)&v14 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [(WGColorHighlightButton *)self titleLabel];
  [v7 intrinsicContentSize];
  double v9 = v8;
  double v11 = v10;

  if (v4 >= v9) {
    double v12 = v4;
  }
  else {
    double v12 = v9;
  }
  if (v6 >= v11) {
    double v13 = v6;
  }
  else {
    double v13 = v11;
  }
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)WGColorHighlightButton;
  [(WGColorHighlightButton *)&v6 layoutSubviews];
  double v3 = [(WGColorHighlightButton *)self titleLabel];
  double v4 = [(WGColorHighlightButton *)self titleLabel];
  [v4 frame];
  [v3 setPreferredMaxLayoutWidth:v5];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WGColorHighlightButton *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WGColorHighlightButton;
    [(WGColorHighlightButton *)&v5 setHighlighted:v3];
    if (v3) {
      [(WGColorHighlightButton *)self _updateRealBackgroundColor];
    }
    else {
      BSRunLoopPerformAfterCACommit();
    }
  }
}

uint64_t __41__WGColorHighlightButton_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRealBackgroundColor];
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  [(WGColorHighlightButton *)self setSavedBackgroundColor:v4];
  id v5 = v4;
  double v9 = 0.0;
  double v10 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  objc_super v6 = v5;
  if ([v5 getHue:&v10 saturation:&v9 brightness:&v8 alpha:&v7])
  {
    objc_super v6 = [MEMORY[0x263F1C550] colorWithHue:v10 saturation:v9 brightness:v8 + -0.2 alpha:v7];
  }
  [(WGColorHighlightButton *)self setHighlightedBackgroundColor:v6];
  [(WGColorHighlightButton *)self _updateRealBackgroundColor];
}

- (void)_updateRealBackgroundColor
{
  if ([(WGColorHighlightButton *)self isHighlighted])
  {
    BOOL v3 = [(WGColorHighlightButton *)self highlightedBackgroundColor];
    v5.receiver = self;
    v5.super_class = (Class)WGColorHighlightButton;
    [(WGColorHighlightButton *)&v5 setBackgroundColor:v3];
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __52__WGColorHighlightButton__updateRealBackgroundColor__block_invoke;
    v4[3] = &unk_264676588;
    v4[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:6 delay:v4 options:0 animations:0.3 completion:0.0];
  }
}

void __52__WGColorHighlightButton__updateRealBackgroundColor__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [v1 savedBackgroundColor];
  v3.receiver = v1;
  v3.super_class = (Class)WGColorHighlightButton;
  objc_msgSendSuper2(&v3, sel_setBackgroundColor_, v2);
}

- (UIColor)savedBackgroundColor
{
  return self->_savedBackgroundColor;
}

- (void)setSavedBackgroundColor:(id)a3
{
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (void)setHighlightedBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_savedBackgroundColor, 0);
}

@end