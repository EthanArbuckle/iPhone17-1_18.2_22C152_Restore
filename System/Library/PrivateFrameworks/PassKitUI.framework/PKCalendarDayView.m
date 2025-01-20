@interface PKCalendarDayView
- (BOOL)hideDayLabel;
- (BOOL)isSelectable;
- (BOOL)isSelected;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKCalendarDayView)initWithDate:(id)a3 dayString:(id)a4 delegate:(id)a5;
- (UIView)decorationView;
- (double)verticalMarginWithBounds:(CGRect)a3;
- (void)_viewTapped;
- (void)layoutSubviews;
- (void)setDecorationView:(id)a3;
- (void)setHideDayLabel:(BOOL)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PKCalendarDayView

- (PKCalendarDayView)initWithDate:(id)a3 dayString:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKCalendarDayView;
  v12 = -[PKCalendarDayView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_date, a3);
    objc_storeStrong((id *)&v13->_delegate, a5);
    v14 = [[PKCalendarDayLabelView alloc] initWithDayString:v10];
    dayLabelView = v13->_dayLabelView;
    v13->_dayLabelView = v14;

    [(PKCalendarDayView *)v13 addSubview:v13->_dayLabelView];
  }

  return v13;
}

- (void)setSelected:(BOOL)a3
{
  [(PKCalendarDayLabelView *)self->_dayLabelView setSelected:a3];

  [(PKCalendarDayView *)self setNeedsLayout];
}

- (BOOL)isSelected
{
  return [(PKCalendarDayLabelView *)self->_dayLabelView isSelected];
}

- (void)setSelectable:(BOOL)a3
{
  if (self->_selectable != a3)
  {
    self->_selectable = a3;
    tapRecognizer = self->_tapRecognizer;
    if (a3)
    {
      if (!tapRecognizer)
      {
        v6 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__viewTapped];
        v7 = self->_tapRecognizer;
        self->_tapRecognizer = v6;

        v8 = self->_tapRecognizer;
        [(PKCalendarDayView *)self addGestureRecognizer:v8];
      }
    }
    else
    {
      if (tapRecognizer)
      {
        [(PKCalendarDayView *)self removeGestureRecognizer:self->_tapRecognizer];
        v5 = self->_tapRecognizer;
      }
      else
      {
        v5 = 0;
      }
      self->_tapRecognizer = 0;
    }
  }
}

- (void)setHideDayLabel:(BOOL)a3
{
  if (self->_hideDayLabel != a3)
  {
    self->_hideDayLabel = a3;
    -[PKCalendarDayLabelView setHidden:](self->_dayLabelView, "setHidden:");
  }
}

- (void)setDecorationView:(id)a3
{
  v5 = (UIView *)a3;
  decorationView = self->_decorationView;
  if (decorationView != v5)
  {
    v7 = v5;
    [(UIView *)decorationView removeFromSuperview];
    objc_storeStrong((id *)&self->_decorationView, a3);
    [(PKCalendarDayView *)self addSubview:self->_decorationView];
    [(PKCalendarDayView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (double)verticalMarginWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[PKCalendarDayLabelView labelFrameForBounds:](self->_dayLabelView, "labelFrameForBounds:");
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v17);
  v18.origin.CGFloat x = v8;
  v18.origin.CGFloat y = v10;
  v18.size.CGFloat width = v12;
  v18.size.CGFloat height = v14;
  return fmax(MaxY - CGRectGetMaxY(v18), 0.0);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKCalendarDayView;
  [(PKCalendarDayView *)&v3 layoutSubviews];
  [(PKCalendarDayView *)self bounds];
  -[PKCalendarDayView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKCalendarDayView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  uint64_t v8 = MEMORY[0x1E4F1DB28];
  double v9 = *MEMORY[0x1E4F1DB28];
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  -[PKCalendarDayLabelView sizeThatFits:](self->_dayLabelView, "sizeThatFits:", a3.size.width, 1.79769313e308);
  PKRectCenteredXInRect();
  double v14 = v13;
  double v15 = v12;
  if (!self->_decorationView)
  {
    double v20 = *(double *)(v8 + 16);
    double v26 = *(double *)(v8 + 24);
    if (a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  double rect = v12;
  CGFloat v16 = v11;
  [(PKCalendarDayLabelView *)self->_dayLabelView isSelected];
  -[UIView sizeThatFits:](self->_decorationView, "sizeThatFits:", width, 1.79769313e308);
  v32.origin.CGFloat y = 0.0;
  v32.origin.CGFloat x = v14;
  v32.size.double width = v16;
  v32.size.CGFloat height = rect;
  CGRectGetMaxY(v32);
  PKRectCenteredXInRect();
  double v9 = v17;
  double v10 = v18;
  double v20 = v19;
  double v29 = v21;
  CGFloat v22 = v16;
  double v23 = v16;
  double v15 = rect;
  -[PKCalendarDayLabelView labelFrameForBounds:](self->_dayLabelView, "labelFrameForBounds:", v14, 0.0, v23, rect);
  if (v20 < v24)
  {
    [(PKCalendarDayLabelView *)self->_dayLabelView totalSpacingBetweenTextAndLabel];
    double v9 = v9 + v25 * 0.5;
  }
  double v11 = v22;
  double v26 = v29;
  if (!a4)
  {
LABEL_5:
    -[PKCalendarDayLabelView setFrame:](self->_dayLabelView, "setFrame:", v14, 0.0, v11, v15);
    -[UIView setFrame:](self->_decorationView, "setFrame:", v9, v10, v20, v26);
  }
LABEL_6:
  double v27 = width;
  double v28 = height;
  result.CGFloat height = v28;
  result.double width = v27;
  return result;
}

- (void)_viewTapped
{
}

- (UIView)decorationView
{
  return self->_decorationView;
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (BOOL)hideDayLabel
{
  return self->_hideDayLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationView, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_dayLabelView, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end