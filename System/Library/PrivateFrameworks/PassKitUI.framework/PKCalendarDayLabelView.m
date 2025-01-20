@interface PKCalendarDayLabelView
- (BOOL)isSelected;
- (CGRect)labelFrameForBounds:(CGRect)a3;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKCalendarDayLabelView)initWithDayString:(id)a3;
- (UIColor)disabledTextColor;
- (UIColor)highlightBackgroundColor;
- (UIColor)highlightTextColor;
- (double)highlightPadding;
- (double)totalSpacingBetweenTextAndLabel;
- (id)_dayLabelFont;
- (void)_updateTextColor;
- (void)layoutSubviews;
- (void)setDisabledTextColor:(id)a3;
- (void)setHighlightBackgroundColor:(id)a3;
- (void)setHighlightPadding:(double)a3;
- (void)setHighlightTextColor:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation PKCalendarDayLabelView

- (PKCalendarDayLabelView)initWithDayString:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCalendarDayLabelView;
  v5 = -[PKCalendarDayLabelView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    highlightView = v5->_highlightView;
    v5->_highlightView = v6;

    [(PKCalendarDayLabelView *)v5 addSubview:v5->_highlightView];
    v5->_highlightPadding = 10.0;
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    dayLabel = v5->_dayLabel;
    v5->_dayLabel = v8;

    [(UILabel *)v5->_dayLabel setTextAlignment:1];
    v10 = v5->_dayLabel;
    v11 = [(PKCalendarDayLabelView *)v5 _dayLabelFont];
    [(UILabel *)v10 setFont:v11];

    [(UILabel *)v5->_dayLabel setText:v4];
    v12 = v5->_dayLabel;
    v13 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v12 setTextColor:v13];

    [(PKCalendarDayLabelView *)v5 addSubview:v5->_dayLabel];
  }

  return v5;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    [(PKCalendarDayLabelView *)self _updateTextColor];
  }
}

- (void)_updateTextColor
{
  highlightBackgroundColor = self->_highlightBackgroundColor;
  if (highlightBackgroundColor)
  {
    id v4 = highlightBackgroundColor;
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB1618] redColor];
  }
  highlightView = self->_highlightView;
  v14 = v4;
  if (self->_selected)
  {
    [(UIView *)highlightView setBackgroundColor:v4];
  }
  else
  {
    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)highlightView setBackgroundColor:v6];
  }
  highlightTextColor = self->_highlightTextColor;
  if (highlightTextColor)
  {
    v8 = highlightTextColor;
  }
  else
  {
    v8 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  v9 = v8;
  dayLabel = self->_dayLabel;
  if (self->_selected)
  {
    [(UILabel *)self->_dayLabel setTextColor:v8];
  }
  else
  {
    v11 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)dayLabel setTextColor:v11];
  }
  v12 = self->_dayLabel;
  v13 = [(PKCalendarDayLabelView *)self _dayLabelFont];
  [(UILabel *)v12 setFont:v13];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKCalendarDayLabelView;
  -[PKCalendarDayLabelView setUserInteractionEnabled:](&v5, sel_setUserInteractionEnabled_);
  [(UILabel *)self->_dayLabel setUserInteractionEnabled:v3];
  [(UIView *)self->_highlightView setUserInteractionEnabled:v3];
  if (self->_disabledTextColor)
  {
    if (v3) {
      [(PKCalendarDayLabelView *)self _updateTextColor];
    }
    else {
      -[UILabel setTextColor:](self->_dayLabel, "setTextColor:");
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKCalendarDayLabelView;
  [(PKCalendarDayLabelView *)&v3 layoutSubviews];
  [(PKCalendarDayLabelView *)self bounds];
  -[PKCalendarDayLabelView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKCalendarDayLabelView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  BOOL v4 = a4;
  -[PKCalendarDayLabelView labelFrameForBounds:](self, "labelFrameForBounds:");
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  PKRectCenteredXInRect();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (!v4)
  {
    -[UILabel setFrame:](self->_dayLabel, "setFrame:", v7, v9, v11, v13);
    -[UIView setFrame:](self->_highlightView, "setFrame:", v15, 0.0, v17, v19);
    v20 = [(UIView *)self->_highlightView layer];
    [v20 setCornerRadius:v17 * 0.5];
  }
  v24.origin.x = v15;
  v24.origin.y = 0.0;
  v24.size.width = v17;
  v24.size.height = v19;
  double MaxY = CGRectGetMaxY(v24);
  double v22 = v17;
  result.height = MaxY;
  result.width = v22;
  return result;
}

- (CGRect)labelFrameForBounds:(CGRect)a3
{
  -[UILabel sizeThatFits:](self->_dayLabel, "sizeThatFits:", a3.size.width, 3.40282347e38);

  PKRectCenteredIntegralRect();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)_dayLabelFont
{
  if (self->_selected) {
    v2 = (double *)MEMORY[0x1E4FB09B8];
  }
  else {
    v2 = (double *)MEMORY[0x1E4FB09D8];
  }
  double v3 = PKDefaultSystemFontOfSizeAndWeight(19.0, *v2);
  double v4 = objc_msgSend(v3, "pk_fixedWidthFont");

  return v4;
}

- (double)totalSpacingBetweenTextAndLabel
{
  [(UILabel *)self->_dayLabel frame];
  double v4 = v3;
  CGFloat v6 = v5;
  CFAttributedStringRef v7 = [(UILabel *)self->_dayLabel attributedText];
  double v8 = CTFramesetterCreateWithAttributedString(v7);
  double v9 = 0.0;
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = v4;
  v18.size.height = v6;
  double v10 = CGPathCreateWithRect(v18, 0);
  v17.length = [(__CFAttributedString *)v7 length];
  v17.location = 0;
  Frame = CTFramesetterCreateFrame(v8, v17, v10, 0);
  CFArrayRef Lines = CTFrameGetLines(Frame);
  if (Lines)
  {
    CFArrayRef v13 = Lines;
    CFIndex Count = CFArrayGetCount(Lines);
    if (Count >= 1)
    {
      ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(v13, Count - 1);
      CGRect ImageBounds = CTLineGetImageBounds(ValueAtIndex, 0);
      double v9 = ImageBounds.origin.x + v4 - (ImageBounds.origin.x + ImageBounds.size.width);
    }
  }
  CFRelease(Frame);
  CFRelease(v10);
  CFRelease(v8);

  return v9;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (void)setHighlightBackgroundColor:(id)a3
{
}

- (UIColor)highlightTextColor
{
  return self->_highlightTextColor;
}

- (void)setHighlightTextColor:(id)a3
{
}

- (double)highlightPadding
{
  return self->_highlightPadding;
}

- (void)setHighlightPadding:(double)a3
{
  self->_highlightPadding = a3;
}

- (UIColor)disabledTextColor
{
  return self->_disabledTextColor;
}

- (void)setDisabledTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledTextColor, 0);
  objc_storeStrong((id *)&self->_highlightTextColor, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);

  objc_storeStrong((id *)&self->_dayLabel, 0);
}

@end