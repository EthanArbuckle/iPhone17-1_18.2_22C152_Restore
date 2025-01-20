@interface PKCalendarIconView
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKCalendarIconView)initWithDate:(id)a3 isDisabled:(BOOL)a4;
- (void)layoutSubviews;
@end

@implementation PKCalendarIconView

- (PKCalendarIconView)initWithDate:(id)a3 isDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKCalendarIconView;
  v7 = -[PKCalendarIconView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v7)
  {
    if (_MergedGlobals_3 != -1) {
      dispatch_once(&_MergedGlobals_3, &__block_literal_global_14);
    }
    v8 = [(id)qword_1E94F5628 stringFromDate:v6];
    v30 = [v8 uppercaseString];

    uint64_t v28 = [(id)qword_1E94F5620 stringFromDate:v6];
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    monthLabel = v7->_monthLabel;
    v7->_monthLabel = v9;

    v11 = [MEMORY[0x1E4FB1618] redColor];
    v12 = v11;
    if (v4)
    {
      uint64_t v13 = [v11 colorWithAlphaComponent:0.5];

      v12 = (void *)v13;
    }
    -[UILabel setTextColor:](v7->_monthLabel, "setTextColor:", v12, v28);
    [(UILabel *)v7->_monthLabel setTextAlignment:1];
    v14 = v7->_monthLabel;
    v15 = (NSString *)*MEMORY[0x1E4FB2798];
    v16 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28E0], (NSString *)*MEMORY[0x1E4FB2798], *MEMORY[0x1E4FB09C8]);
    [(UILabel *)v14 setFont:v16];

    [(UILabel *)v7->_monthLabel setText:v30];
    [(UILabel *)v7->_monthLabel setAdjustsFontSizeToFitWidth:1];
    [(PKCalendarIconView *)v7 addSubview:v7->_monthLabel];
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    dayLabel = v7->_dayLabel;
    v7->_dayLabel = v17;

    v19 = [MEMORY[0x1E4FB1618] labelColor];

    if (v4)
    {
      uint64_t v20 = [v19 colorWithAlphaComponent:0.5];

      v19 = (void *)v20;
    }
    [(UILabel *)v7->_dayLabel setTextColor:v19];
    [(UILabel *)v7->_dayLabel setTextAlignment:1];
    v21 = v7->_dayLabel;
    v22 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2998], v15, *MEMORY[0x1E4FB09E0]);
    [(UILabel *)v21 setFont:v22];

    [(UILabel *)v7->_dayLabel setText:v29];
    [(UILabel *)v7->_dayLabel setAdjustsFontSizeToFitWidth:1];
    [(PKCalendarIconView *)v7 addSubview:v7->_dayLabel];
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v24 = [(UILabel *)v7->_monthLabel text];
    [v23 safelyAddObject:v24];

    v25 = [(UILabel *)v7->_dayLabel text];
    [v23 safelyAddObject:v25];

    v26 = [v23 componentsJoinedByString:@","];
    [(PKCalendarIconView *)v7 setAccessibilityLabel:v26];
    [(PKCalendarIconView *)v7 setIsAccessibilityElement:1];
  }
  return v7;
}

uint64_t __46__PKCalendarIconView_initWithDate_isDisabled___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1E94F5620;
  qword_1E94F5620 = (uint64_t)v0;

  v2 = (void *)qword_1E94F5620;
  uint64_t v3 = *MEMORY[0x1E4F1C318];
  BOOL v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v2 setCalendar:v4];

  [(id)qword_1E94F5620 setLocalizedDateFormatFromTemplate:@"d"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v6 = (void *)qword_1E94F5628;
  qword_1E94F5628 = (uint64_t)v5;

  v7 = (void *)qword_1E94F5628;
  v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v3];
  [v7 setCalendar:v8];

  v9 = (void *)qword_1E94F5628;

  return [v9 setLocalizedDateFormatFromTemplate:@"MMM"];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKCalendarIconView;
  [(PKCalendarIconView *)&v3 layoutSubviews];
  [(PKCalendarIconView *)self bounds];
  -[PKCalendarIconView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKCalendarIconView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRect remainder = a3;
  memset(&slice, 0, sizeof(slice));
  -[UILabel sizeThatFits:](self->_monthLabel, "sizeThatFits:", a3.size.width, 3.40282347e38);
  double v11 = v10;
  -[UILabel sizeThatFits:](self->_dayLabel, "sizeThatFits:", width, 3.40282347e38);
  CGFloat v13 = v12;
  CGFloat v14 = fmax(height - (v11 + v12), 0.0) * 0.5;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  CGRectDivide(v28, &slice, &remainder, v14, CGRectMinYEdge);
  CGRectDivide(remainder, &slice, &remainder, v11, CGRectMinYEdge);
  PKRectCenteredXInRect();
  double v24 = v15;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  CGRectDivide(remainder, &slice, &remainder, v13, CGRectMinYEdge);
  PKRectCenteredXInRect();
  if (!v4)
  {
    -[UILabel setFrame:](self->_dayLabel, "setFrame:");
    -[UILabel setFrame:](self->_monthLabel, "setFrame:", v24, v17 + 2.0, v19, v21);
  }
  v29.origin.CGFloat x = v24;
  v29.origin.CGFloat y = v17 + 2.0;
  v29.size.double width = v19;
  v29.size.double height = v21;
  double MaxY = CGRectGetMaxY(v29);
  double v23 = width;
  result.double height = MaxY;
  result.double width = v23;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayLabel, 0);

  objc_storeStrong((id *)&self->_monthLabel, 0);
}

@end