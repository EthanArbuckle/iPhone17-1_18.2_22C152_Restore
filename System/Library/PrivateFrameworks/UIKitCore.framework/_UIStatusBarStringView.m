@interface _UIStatusBarStringView
- (BOOL)prefersBaselineAlignment;
- (BOOL)showsAlternateText;
- (BOOL)wantsCrossfade;
- (NSString)alternateText;
- (NSString)originalText;
- (NSTimer)alternateTextTimer;
- (UIAccessibilityHUDItem)accessibilityHUDRepresentation;
- (UIEdgeInsets)alignmentRectInsets;
- (_UIStatusBarStringView)initWithFrame:(CGRect)a3;
- (int64_t)fontStyle;
- (void)_updateAlternateTextTimer;
- (void)applyStyleAttributes:(id)a3;
- (void)setAlignmentRectInsets:(UIEdgeInsets)a3;
- (void)setAlternateText:(id)a3;
- (void)setFontStyle:(int64_t)a3;
- (void)setOriginalText:(id)a3;
- (void)setShowsAlternateText:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation _UIStatusBarStringView

- (_UIStatusBarStringView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarStringView;
  v3 = -[UILabel initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UILabel *)v3 setAllowsDefaultTighteningForTruncation:1];
  return v3;
}

- (BOOL)wantsCrossfade
{
  return 1;
}

- (BOOL)prefersBaselineAlignment
{
  return 1;
}

- (void)applyStyleAttributes:(id)a3
{
  int64_t fontStyle = self->_fontStyle;
  id v5 = a3;
  v6 = [v5 fontForStyle:fontStyle];
  [(UILabel *)self setFont:v6];

  id v7 = [v5 textColor];

  [(UILabel *)self setTextColor:v7];
}

- (void)setShowsAlternateText:(BOOL)a3
{
  if (self->_showsAlternateText != a3)
  {
    self->_showsAlternateText = a3;
    if (a3) {
      -[UILabel setText:](&v4, sel_setText_, self->_alternateText, v3.receiver, v3.super_class, self, _UIStatusBarStringView);
    }
    else {
      -[UILabel setText:](&v3, sel_setText_, self->_originalText, self, _UIStatusBarStringView, v4.receiver, v4.super_class);
    }
  }
}

- (void)setText:(id)a3
{
  id v4 = a3;
  [(_UIStatusBarStringView *)self setOriginalText:v4];
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarStringView;
  [(UILabel *)&v5 setText:v4];
}

- (void)setAlternateText:(id)a3
{
  objc_super v5 = (NSString *)a3;
  if (self->_alternateText != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_alternateText, a3);
    [(_UIStatusBarStringView *)self _updateAlternateTextTimer];
    objc_super v5 = v6;
  }
}

- (void)_updateAlternateTextTimer
{
  if ([(NSString *)self->_alternateText length])
  {
    objc_super v3 = [(UIView *)self window];
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
      v12[2] = __51___UIStatusBarStringView__updateAlternateTextTimer__block_invoke;
      v12[3] = &unk_1E52DAB28;
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

    [(_UIStatusBarStringView *)self setShowsAlternateText:0];
  }
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  objc_super v3 = [UIAccessibilityHUDItem alloc];
  BOOL v4 = [(_UIStatusBarStringView *)self originalText];
  objc_super v5 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v3, "initWithTitle:image:imageInsets:", v4, 0, 0.0, 0.0, 0.0, 0.0);

  return v5;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (void)setFontStyle:(int64_t)a3
{
  self->_int64_t fontStyle = a3;
}

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

- (void)setOriginalText:(id)a3
{
}

- (NSTimer)alternateTextTimer
{
  return self->_alternateTextTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateTextTimer, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_storeStrong((id *)&self->_alternateText, 0);
}

@end