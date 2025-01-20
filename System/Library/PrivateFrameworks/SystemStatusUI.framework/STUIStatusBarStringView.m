@interface STUIStatusBarStringView
- (BOOL)isEncapsulated;
- (BOOL)prefersBaselineAlignment;
- (BOOL)showsAlternateText;
- (BOOL)wantsCrossfade;
- (NSString)alternateText;
- (NSString)originalText;
- (NSTimer)alternateTextTimer;
- (STUIStatusBarStringView)initWithFrame:(CGRect)a3;
- (UIAccessibilityHUDItem)accessibilityHUDRepresentation;
- (UIEdgeInsets)alignmentRectInsets;
- (int64_t)fontStyle;
- (void)_updateAlternateTextTimer;
- (void)applyStyleAttributes:(id)a3;
- (void)setAlignmentRectInsets:(UIEdgeInsets)a3;
- (void)setAlternateText:(id)a3;
- (void)setEncapsulated:(BOOL)a3;
- (void)setFontStyle:(int64_t)a3;
- (void)setOriginalText:(id)a3;
- (void)setShowsAlternateText:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation STUIStatusBarStringView

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  double bottom = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)wantsCrossfade
{
  return 1;
}

- (void)applyStyleAttributes:(id)a3
{
  int64_t fontStyle = self->_fontStyle;
  id v5 = a3;
  v6 = [v5 fontForStyle:fontStyle];
  [(STUIStatusBarStringView *)self setFont:v6];

  id v7 = [v5 textColor];

  [(STUIStatusBarStringView *)self setTextColor:v7];
}

- (void)setText:(id)a3
{
  id v4 = a3;
  [(STUIStatusBarStringView *)self setOriginalText:v4];
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarStringView;
  [(STUIStatusBarStringView *)&v5 setText:v4];
}

- (void)setOriginalText:(id)a3
{
}

- (void)setFontStyle:(int64_t)a3
{
  self->_int64_t fontStyle = a3;
}

- (STUIStatusBarStringView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarStringView;
  v3 = -[STUIStatusBarStringView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(STUIStatusBarStringView *)v3 setAllowsDefaultTighteningForTruncation:1];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateTextTimer, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_storeStrong((id *)&self->_alternateText, 0);
}

- (void)_updateAlternateTextTimer
{
  if ([(NSString *)self->_alternateText length])
  {
    v3 = [(STUIStatusBarStringView *)self window];
    BOOL v4 = v3 != 0;

    p_alternateTextTimer = &self->_alternateTextTimer;
    alternateTextTimer = self->_alternateTextTimer;
    BOOL v7 = alternateTextTimer == 0;
    if (v3 && !alternateTextTimer)
    {
      objc_initWeak(&location, self);
      v8 = (void *)MEMORY[0x1E4F1CB00];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__STUIStatusBarStringView__updateAlternateTextTimer__block_invoke;
      v12[3] = &unk_1E6AA3A18;
      objc_copyWeak(&v13, &location);
      uint64_t v9 = [v8 scheduledTimerWithTimeInterval:1 repeats:v12 block:8.0];
      v10 = *p_alternateTextTimer;
      *p_alternateTextTimer = (NSTimer *)v9;

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {
    BOOL v4 = 0;
    p_alternateTextTimer = &self->_alternateTextTimer;
    alternateTextTimer = self->_alternateTextTimer;
    BOOL v7 = alternateTextTimer == 0;
  }
  if (!v4 && !v7)
  {
    [(NSTimer *)alternateTextTimer invalidate];
    v11 = *p_alternateTextTimer;
    *p_alternateTextTimer = 0;

    [(STUIStatusBarStringView *)self setShowsAlternateText:0];
  }
}

- (BOOL)prefersBaselineAlignment
{
  return 1;
}

- (void)setShowsAlternateText:(BOOL)a3
{
  if (self->_showsAlternateText != a3)
  {
    self->_showsAlternateText = a3;
    if (a3) {
      -[STUIStatusBarStringView setText:](&v4, sel_setText_, self->_alternateText, v3.receiver, v3.super_class, self, STUIStatusBarStringView);
    }
    else {
      -[STUIStatusBarStringView setText:](&v3, sel_setText_, self->_originalText, self, STUIStatusBarStringView, v4.receiver, v4.super_class);
    }
  }
}

- (void)setAlternateText:(id)a3
{
  objc_super v5 = (NSString *)a3;
  p_alternateText = &self->_alternateText;
  if (self->_alternateText != v5)
  {
    BOOL v7 = v5;
    objc_storeStrong((id *)p_alternateText, a3);
    p_alternateText = (NSString **)[(STUIStatusBarStringView *)self _updateAlternateTextTimer];
    objc_super v5 = v7;
  }
  MEMORY[0x1F41817F8](p_alternateText, v5);
}

void __52__STUIStatusBarStringView__updateAlternateTextTimer__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained showsAlternateText] ^ 1;
  id v3 = objc_loadWeakRetained(v1);
  [v3 setShowsAlternateText:v2];
}

- (void)setEncapsulated:(BOOL)a3
{
  if (a3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F24388]);
    [(STUIStatusBarStringView *)self _setTextEncapsulation:v4];
  }
  else
  {
    [(STUIStatusBarStringView *)self _setTextEncapsulation:0];
  }
}

- (BOOL)isEncapsulated
{
  uint64_t v2 = [(STUIStatusBarStringView *)self _textEncapsulation];
  BOOL v3 = v2 != 0;

  return v3;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  id v3 = objc_alloc(MEMORY[0x1E4FB13E0]);
  id v4 = [(STUIStatusBarStringView *)self originalText];
  objc_super v5 = objc_msgSend(v3, "initWithTitle:image:imageInsets:", v4, 0, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  return (UIAccessibilityHUDItem *)v5;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
}

- (NSString)alternateText
{
  return self->_alternateText;
}

- (BOOL)showsAlternateText
{
  return self->_showsAlternateText;
}

- (NSString)originalText
{
  return self->_originalText;
}

- (NSTimer)alternateTextTimer
{
  return self->_alternateTextTimer;
}

@end