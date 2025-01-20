@interface PKCalendarWeekdayHeaderView
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKCalendarWeekdayHeaderView)initWithWeekdayString:(id)a3;
- (void)layoutSubviews;
@end

@implementation PKCalendarWeekdayHeaderView

- (PKCalendarWeekdayHeaderView)initWithWeekdayString:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCalendarWeekdayHeaderView;
  v5 = -[PKCalendarWeekdayHeaderView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v5->_label;
    v5->_label = v6;

    v8 = v5->_label;
    v9 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], (void *)*MEMORY[0x1E4FB2798], 2, (unint64_t)*MEMORY[0x1E4FB09E0]);
    [(UILabel *)v8 setFont:v9];

    [(UILabel *)v5->_label setText:v4];
    v10 = v5->_label;
    v11 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UILabel *)v10 setTextColor:v11];

    [(PKCalendarWeekdayHeaderView *)v5 addSubview:v5->_label];
  }

  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKCalendarWeekdayHeaderView;
  [(PKCalendarWeekdayHeaderView *)&v3 layoutSubviews];
  [(PKCalendarWeekdayHeaderView *)self bounds];
  -[PKCalendarWeekdayHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKCalendarWeekdayHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat width = a3.size.width;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.size.width, 3.40282347e38);
  PKRectCenteredIntegralRect();
  double v8 = v7;
  if (!a4) {
    -[UILabel setFrame:](self->_label, "setFrame:");
  }
  double v9 = v8 + 0.0;
  double v10 = width;
  result.height = v9;
  result.CGFloat width = v10;
  return result;
}

- (void).cxx_destruct
{
}

@end